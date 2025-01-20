unint64_t sub_1000022C0()
{
  unint64_t result;

  result = qword_1000180F0;
  if (!qword_1000180F0)
  {
    result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000180F0);
  }
  return result;
}

unint64_t sub_100002318()
{
  unint64_t result = qword_1000180F8;
  if (!qword_1000180F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000180F8);
  }
  return result;
}

uint64_t sub_10000236C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100002388()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1000023D8()
{
  unint64_t result = qword_100018100;
  if (!qword_100018100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018100);
  }
  return result;
}

uint64_t sub_10000242C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v29 = a1;
  uint64_t v1 = sub_100011360();
  __chkstk_darwin(v1 - 8);
  uint64_t v2 = sub_100003E74(&qword_100018128);
  uint64_t v24 = *(void *)(v2 - 8);
  uint64_t v3 = __chkstk_darwin(v2);
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  v7 = (char *)&v22 - v6;
  uint64_t v8 = sub_100003E74(&qword_100018130);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v25 = v8;
  uint64_t v26 = v9;
  __chkstk_darwin(v8);
  v22 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100003E74(&qword_100018138);
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v27 = v11;
  uint64_t v28 = v12;
  __chkstk_darwin(v11);
  v23 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRetain();
  sub_100011350();
  sub_100003E74(&qword_100018140);
  sub_100003E74(&qword_100018148);
  sub_1000023D8();
  sub_100003EB8();
  sub_100003FFC();
  sub_100011370();
  [self isPingMySupportedOnActiveDevice];
  sub_100011380();
  v14 = *(void (**)(char *, uint64_t))(v24 + 8);
  v14(v5, v2);
  uint64_t v15 = sub_1000040E4(&qword_100018198, &qword_100018128);
  v16 = v22;
  sub_100010FF0();
  v14(v7, v2);
  sub_100010FB0();
  uint64_t v30 = v2;
  uint64_t v31 = v15;
  uint64_t OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v18 = v23;
  uint64_t v19 = v25;
  sub_100011000();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v16, v19);
  sub_100010FB0();
  uint64_t v30 = v19;
  uint64_t v31 = OpaqueTypeConformance2;
  swift_getOpaqueTypeConformance2();
  uint64_t v20 = v27;
  sub_100010FE0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v28 + 8))(v18, v20);
}

uint64_t sub_100002920@<X0>(unsigned __int8 *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v71 = a2;
  uint64_t v3 = sub_1000112C0();
  uint64_t v59 = *(void *)(v3 - 8);
  v60 = (void (*)(char *, uint64_t))v3;
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v6 = (char *)&v57 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v57 - v7;
  uint64_t v69 = sub_100003E74(&qword_1000181A0);
  __chkstk_darwin(v69);
  uint64_t v70 = (uint64_t)&v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v68 = sub_1000112F0();
  uint64_t v66 = *(void *)(v68 - 8);
  uint64_t v10 = __chkstk_darwin(v68);
  uint64_t v12 = (char *)&v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v62 = (char *)&v57 - v13;
  uint64_t v57 = sub_100011340();
  uint64_t v14 = *(void *)(v57 - 8);
  uint64_t v15 = __chkstk_darwin(v57);
  v58 = (char *)&v57 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v57 - v18;
  uint64_t v20 = __chkstk_darwin(v17);
  v22 = (char *)&v57 - v21;
  __chkstk_darwin(v20);
  uint64_t v24 = (char *)&v57 - v23;
  uint64_t v25 = sub_100003E74(&qword_100018170);
  uint64_t v26 = *(void *)(v25 - 8);
  uint64_t v64 = v25;
  uint64_t v65 = v26;
  __chkstk_darwin(v25);
  uint64_t v28 = (char *)&v57 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = sub_100003E74(&qword_100018160);
  uint64_t v29 = __chkstk_darwin(v72);
  v63 = (char *)&v57 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v29);
  uint64_t v67 = (uint64_t)&v57 - v31;
  LODWORD(a1) = *a1;
  sub_100010FB0();
  v61 = v28;
  sub_100011240();
  if (a1 == 1)
  {
    sub_100011330();
    sub_100011300();
    v32 = *(void (**)(char *, uint64_t))(v14 + 8);
    v60 = v32;
    uint64_t v33 = v57;
    v32(v24, v57);
    sub_100011320();
    v32(v22, v33);
    v34 = v58;
    sub_100011310();
    v32(v19, v33);
    sub_1000112E0();
    v35 = v62;
    sub_1000112D0();
    uint64_t v36 = v66;
    uint64_t v59 = *(void *)(v66 + 8);
    uint64_t v37 = v68;
    ((void (*)(char *, uint64_t))v59)(v12, v68);
    uint64_t v38 = (uint64_t)v63;
    v39 = &v63[*(int *)(v72 + 36)];
    sub_100004258(&qword_1000181B0, (void (*)(uint64_t))&type metadata accessor for VariableColorSymbolEffect);
    sub_100011290();
    uint64_t v40 = sub_100011020();
    (*(void (**)(char *, char *, uint64_t))(v36 + 16))(&v39[*(int *)(v40 + 20)], v35, v37);
    v39[*(int *)(v40 + 24)] = 1;
    uint64_t v42 = v64;
    uint64_t v41 = v65;
    v43 = v61;
    (*(void (**)(uint64_t, char *, uint64_t))(v65 + 16))(v38, v61, v64);
    ((void (*)(char *, uint64_t))v59)(v35, v37);
    v60(v34, v33);
    (*(void (**)(char *, uint64_t))(v41 + 8))(v43, v42);
    uint64_t v44 = v67;
    sub_100004128(v38, v67);
  }
  else
  {
    sub_1000112B0();
    sub_1000112A0();
    uint64_t v59 = *(void *)(v59 + 8);
    v45 = v8;
    v46 = v60;
    ((void (*)(char *, void))v59)(v45, v60);
    sub_1000112E0();
    v47 = v62;
    sub_1000112D0();
    uint64_t v48 = v66;
    v58 = *(char **)(v66 + 8);
    uint64_t v49 = v68;
    ((void (*)(char *, uint64_t))v58)(v12, v68);
    uint64_t v50 = (uint64_t)v63;
    v51 = &v63[*(int *)(v72 + 36)];
    sub_100004258(&qword_1000181A8, (void (*)(uint64_t))&type metadata accessor for WiggleSymbolEffect);
    sub_100011290();
    uint64_t v52 = sub_100011020();
    (*(void (**)(char *, char *, uint64_t))(v48 + 16))(&v51[*(int *)(v52 + 20)], v47, v49);
    v51[*(int *)(v52 + 24)] = 1;
    uint64_t v54 = v64;
    uint64_t v53 = v65;
    v55 = v61;
    (*(void (**)(uint64_t, char *, uint64_t))(v65 + 16))(v50, v61, v64);
    ((void (*)(char *, uint64_t))v58)(v47, v49);
    ((void (*)(char *, void))v59)(v6, v46);
    (*(void (**)(char *, uint64_t))(v53 + 8))(v55, v54);
    uint64_t v44 = v67;
    sub_100004128(v50, v67);
  }
  sub_100004190(v44, v70);
  swift_storeEnumTagMultiPayload();
  sub_100003F2C();
  sub_100011010();
  return sub_1000041F8(v44);
}

double sub_100003104@<D0>(char a1@<W0>, unsigned char *a2@<X1>, uint64_t a3@<X8>)
{
  if (*a2 != 1 || (a1 & 1) != 0)
  {
    sub_100010FB0();
    sub_1000110F0();
  }
  sub_100003E74(&qword_100018190);
  sub_100004078();
  sub_100011010();
  double result = *(double *)&v5;
  *(_OWORD *)a3 = v5;
  *(_OWORD *)(a3 + 16) = v6;
  *(unsigned char *)(a3 + 32) = v7;
  return result;
}

uint64_t sub_10000323C(unsigned char *a1)
{
  if (*a1 == 1)
  {
    sub_1000111B0();
  }
  else
  {
    sub_100011170();
    sub_100010FB0();
    sub_1000110F0();
  }
  return sub_1000113A0();
}

uint64_t sub_100003310()
{
  uint64_t v0 = sub_100010CF0();
  sub_100003DE4(v0, qword_100018550);
  sub_100003DAC(v0, (uint64_t)qword_100018550);
  return sub_100010CE0();
}

uint64_t sub_100003374(uint64_t a1, char a2)
{
  *(unsigned char *)(v2 + 145) = a2;
  *(void *)(v2 + 120) = a1;
  return _swift_task_switch(sub_100003398, 0, 0);
}

uint64_t sub_100003398()
{
  if (qword_1000180E0 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_100010E40();
  *(void *)(v0 + 128) = sub_100003DAC(v1, (uint64_t)qword_100018568);
  uint64_t v2 = sub_100010E20();
  os_log_type_t v3 = sub_100011480();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Pinging Watch", v4, 2u);
    swift_slowDealloc();
  }
  int v5 = *(unsigned __int8 *)(v0 + 145);

  if (v5 == 1)
  {
    id v6 = [self sharedDeviceConnection];
    *(void *)(v0 + 136) = v6;
    if (v6)
    {
      char v7 = v6;
      *(void *)(v0 + 16) = v0;
      *(void *)(v0 + 56) = v0 + 144;
      *(void *)(v0 + 24) = sub_100003630;
      uint64_t v8 = swift_continuation_init();
      *(void *)(v0 + 80) = _NSConcreteStackBlock;
      *(void *)(v0 + 88) = 0x40000000;
      *(void *)(v0 + 96) = sub_1000037F0;
      *(void *)(v0 + 104) = &unk_100014D10;
      *(void *)(v0 + 112) = v8;
      [v7 playSoundOnCompanionWithCompletion:v0 + 80];
      id v6 = (id)(v0 + 16);
    }
    else
    {
      __break(1u);
    }
    return _swift_continuation_await(v6);
  }
  else
  {
    uint64_t v9 = sub_100010E20();
    os_log_type_t v10 = sub_100011480();
    if (os_log_type_enabled(v9, v10))
    {
      uint64_t v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, v10, "There is no active device or it is not supported", v11, 2u);
      swift_slowDealloc();
    }

    sub_100010CD0();
    uint64_t v12 = *(uint64_t (**)(void))(v0 + 8);
    return v12();
  }
}

uint64_t sub_100003630()
{
  return _swift_task_switch(sub_100003710, 0, 0);
}

uint64_t sub_100003710()
{
  uint64_t v1 = sub_100010E20();
  os_log_type_t v2 = sub_100011480();
  if (os_log_type_enabled(v1, v2))
  {
    os_log_type_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Sounds was played", v3, 2u);
    swift_slowDealloc();
  }

  sub_100010CD0();
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_1000037F0(uint64_t a1, char a2)
{
  **(unsigned char **)(*(void *)(*(void *)(a1 + 32) + 64) + 40) = a2;
  return _swift_continuation_resume();
}

uint64_t sub_100003814@<X0>(uint64_t a1@<X8>)
{
  if (qword_1000180D8 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_100010CF0();
  uint64_t v3 = sub_100003DAC(v2, (uint64_t)qword_100018550);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);

  return v4(a1, v3, v2);
}

uint64_t sub_1000038D0(uint64_t a1)
{
  char v4 = *v1;
  uint64_t v5 = swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *(void *)uint64_t v5 = v2;
  *(void *)(v5 + 8) = sub_100003984;
  *(unsigned char *)(v5 + 145) = v4;
  *(void *)(v5 + 120) = a1;
  return _swift_task_switch(sub_100003398, 0, 0);
}

uint64_t sub_100003984()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

id sub_100003A78@<X0>(unsigned char *a1@<X8>)
{
  id result = [self isPingMySupportedOnActiveDevice];
  *a1 = (_BYTE)result;
  return result;
}

uint64_t sub_100003AB4(uint64_t a1)
{
  unint64_t v2 = sub_1000023D8();

  return static AppIntent.persistentIdentifier.getter(a1, v2);
}

unsigned char *initializeBufferWithCopyOfBuffer for PingMyWatchControlIntent(unsigned char *result, unsigned char *a2)
{
  *id result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PingMyWatchControlIntent(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for PingMyWatchControlIntent(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *id result = a2 + 1;
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
        JUMPOUT(0x100003C6CLL);
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
          *id result = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PingMyWatchControlIntent()
{
  return &type metadata for PingMyWatchControlIntent;
}

uint64_t sub_100003CA4()
{
  return sub_1000040E4(&qword_100018110, &qword_100018118);
}

uint64_t sub_100003CE0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100003D28()
{
  uint64_t v0 = sub_100010E40();
  sub_100003DE4(v0, qword_100018568);
  sub_100003DAC(v0, (uint64_t)qword_100018568);
  return sub_100010E30();
}

uint64_t sub_100003DAC(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t *sub_100003DE4(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

ValueMetadata *type metadata accessor for PingMyWatchControl()
{
  return &type metadata for PingMyWatchControl;
}

uint64_t sub_100003E58()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100003E74(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100003EB8()
{
  unint64_t result = qword_100018150;
  if (!qword_100018150)
  {
    sub_100003CE0(&qword_100018140);
    sub_100003F2C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018150);
  }
  return result;
}

unint64_t sub_100003F2C()
{
  unint64_t result = qword_100018158;
  if (!qword_100018158)
  {
    sub_100003CE0(&qword_100018160);
    sub_1000040E4(&qword_100018168, &qword_100018170);
    sub_100004258(&qword_100018178, (void (*)(uint64_t))&type metadata accessor for _IndefiniteSymbolEffectModifier);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018158);
  }
  return result;
}

unint64_t sub_100003FFC()
{
  unint64_t result = qword_100018180;
  if (!qword_100018180)
  {
    sub_100003CE0(&qword_100018148);
    sub_100004078();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018180);
  }
  return result;
}

unint64_t sub_100004078()
{
  unint64_t result = qword_100018188;
  if (!qword_100018188)
  {
    sub_100003CE0(&qword_100018190);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018188);
  }
  return result;
}

uint64_t sub_1000040E4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100003CE0(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100004128(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003E74(&qword_100018160);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100004190(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003E74(&qword_100018160);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000041F8(uint64_t a1)
{
  uint64_t v2 = sub_100003E74(&qword_100018160);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100004258(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000042A0()
{
  return swift_getOpaqueTypeConformance2();
}

__n128 initializeBufferWithCopyOfBuffer for ProgressView(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for ProgressView(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for ProgressView(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGPoint()
{
  if (!qword_1000181B8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1000181B8);
    }
  }
}

void *sub_10000443C()
{
  sub_100010DA0();
  sub_100010DC0();
  uint64_t v0 = sub_100010D70();
  sub_100005C3C(v0, (uint64_t)v6);
  long long v3 = 0u;
  long long v4 = 0u;
  char v5 = -1;
  sub_100005C98((uint64_t)v6);
  sub_100010DB0();
  sub_100005C3C(v0, (uint64_t)v2);
  sub_100005C98((uint64_t)v2);
  sub_100010DB0();
  sub_100010DE0();
  sub_100010D50();
  memcpy(&v8[7], __src, 0x1AAuLL);
  byte_100018580 = 3;
  return memcpy(&unk_100018581, v8, 0x1B1uLL);
}

uint64_t sub_100004580@<X0>(void *a1@<X8>)
{
  if (qword_1000180E8 != -1) {
    swift_once();
  }
  memcpy(__dst, &byte_100018580, 0x1B2uLL);
  memcpy(a1, &byte_100018580, 0x1B2uLL);
  return sub_100005934((uint64_t)__dst);
}

void *sub_100004614@<X0>(void *a1@<X8>)
{
  sub_100004668();
  sub_100010F80();
  return memcpy(a1, v3, 0x1B2uLL);
}

unint64_t sub_100004668()
{
  unint64_t result = qword_1000181C0;
  if (!qword_1000181C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000181C0);
  }
  return result;
}

ValueMetadata *type metadata accessor for LiveActivitySetupConfigEnvironmentKey()
{
  return &type metadata for LiveActivitySetupConfigEnvironmentKey;
}

uint64_t initializeBufferWithCopyOfBuffer for LiveActivitySetupConfig(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t sub_100004700(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 >= 2u)
  {
    if (a5 != 2) {
      return result;
    }
    swift_bridgeObjectRetain();
  }

  return swift_bridgeObjectRetain();
}

uint64_t sub_100004760(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int8 a6)
{
  if (a6 <= 0x3Fu)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t destroy for LiveActivitySetupConfig(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 48))
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  sub_1000048C0(*(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(unsigned char *)(a1 + 104));
  int v2 = *(unsigned __int8 *)(a1 + 144);
  if (v2 != 255) {
    sub_1000048C0(*(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), v2);
  }
  uint64_t v3 = *(unsigned __int8 *)(a1 + 184);
  if (v3 != 255)
  {
    sub_1000048C0(*(void *)(a1 + 152), *(void *)(a1 + 160), *(void *)(a1 + 168), *(void *)(a1 + 176), v3);
    int v4 = *(unsigned __int8 *)(a1 + 224);
    if (v4 != 255) {
      sub_1000048C0(*(void *)(a1 + 192), *(void *)(a1 + 200), *(void *)(a1 + 208), *(void *)(a1 + 216), v4);
    }
  }
  sub_1000048C0(*(void *)(a1 + 232), *(void *)(a1 + 240), *(void *)(a1 + 248), *(void *)(a1 + 256), *(unsigned char *)(a1 + 264));
  int v5 = *(unsigned __int8 *)(a1 + 304);
  if (v5 != 255) {
    sub_1000048C0(*(void *)(a1 + 272), *(void *)(a1 + 280), *(void *)(a1 + 288), *(void *)(a1 + 296), v5);
  }
  uint64_t v6 = *(unsigned __int8 *)(a1 + 344);
  if (v6 != 255)
  {
    sub_1000048C0(*(void *)(a1 + 312), *(void *)(a1 + 320), *(void *)(a1 + 328), *(void *)(a1 + 336), v6);
    int v7 = *(unsigned __int8 *)(a1 + 384);
    if (v7 != 255) {
      sub_1000048C0(*(void *)(a1 + 352), *(void *)(a1 + 360), *(void *)(a1 + 368), *(void *)(a1 + 376), v7);
    }
  }
  uint64_t v8 = *(void *)(a1 + 392);
  uint64_t v9 = *(void *)(a1 + 400);
  uint64_t v10 = *(void *)(a1 + 408);
  uint64_t v11 = *(void *)(a1 + 416);
  uint64_t v12 = *(void *)(a1 + 424);
  unsigned __int8 v13 = *(unsigned char *)(a1 + 432);

  return sub_100004920(v8, v9, v10, v11, v12, v13);
}

uint64_t sub_1000048C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 >= 2u)
  {
    if (a5 != 2) {
      return result;
    }
    swift_bridgeObjectRelease();
  }

  return swift_bridgeObjectRelease();
}

uint64_t sub_100004920(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned __int8 a6)
{
  if (a6 <= 0x3Fu)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t initializeWithCopy for LiveActivitySetupConfig(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  uint64_t v6 = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  if (v6)
  {
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    *(void *)(a1 + 48) = v6;
    uint64_t v7 = *(void *)(a2 + 64);
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    *(void *)(a1 + 64) = v7;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v8 = *(_OWORD *)(a2 + 56);
    *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
    *(_OWORD *)(a1 + 56) = v8;
  }
  uint64_t v9 = *(void *)(a2 + 72);
  uint64_t v10 = *(void *)(a2 + 80);
  uint64_t v11 = *(void *)(a2 + 88);
  uint64_t v12 = *(void *)(a2 + 96);
  unsigned __int8 v13 = *(unsigned char *)(a2 + 104);
  sub_100004700(v9, v10, v11, v12, v13);
  *(void *)(a1 + 72) = v9;
  *(void *)(a1 + 80) = v10;
  *(void *)(a1 + 88) = v11;
  *(void *)(a1 + 96) = v12;
  *(unsigned char *)(a1 + 104) = v13;
  int v14 = *(unsigned __int8 *)(a2 + 144);
  if (v14 == 255)
  {
    long long v19 = *(_OWORD *)(a2 + 128);
    *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
    *(_OWORD *)(a1 + 128) = v19;
    *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
  }
  else
  {
    uint64_t v15 = *(void *)(a2 + 112);
    uint64_t v16 = *(void *)(a2 + 120);
    uint64_t v17 = *(void *)(a2 + 128);
    uint64_t v18 = *(void *)(a2 + 136);
    sub_100004700(v15, v16, v17, v18, *(unsigned char *)(a2 + 144));
    *(void *)(a1 + 112) = v15;
    *(void *)(a1 + 120) = v16;
    *(void *)(a1 + 128) = v17;
    *(void *)(a1 + 136) = v18;
    *(unsigned char *)(a1 + 144) = v14;
  }
  uint64_t v20 = *(unsigned __int8 *)(a2 + 184);
  if (v20 == 255)
  {
    long long v21 = *(_OWORD *)(a2 + 200);
    *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
    *(_OWORD *)(a1 + 200) = v21;
    *(_OWORD *)(a1 + 209) = *(_OWORD *)(a2 + 209);
    long long v22 = *(_OWORD *)(a2 + 168);
    *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
    *(_OWORD *)(a1 + 168) = v22;
  }
  else
  {
    uint64_t v23 = *(void *)(a2 + 152);
    uint64_t v24 = *(void *)(a2 + 160);
    uint64_t v25 = *(void *)(a2 + 168);
    uint64_t v26 = *(void *)(a2 + 176);
    sub_100004700(v23, v24, v25, v26, *(unsigned char *)(a2 + 184));
    *(void *)(a1 + 152) = v23;
    *(void *)(a1 + 160) = v24;
    *(void *)(a1 + 168) = v25;
    *(void *)(a1 + 176) = v26;
    *(unsigned char *)(a1 + 184) = v20;
    int v27 = *(unsigned __int8 *)(a2 + 224);
    if (v27 == 255)
    {
      long long v32 = *(_OWORD *)(a2 + 208);
      *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
      *(_OWORD *)(a1 + 208) = v32;
      *(unsigned char *)(a1 + 224) = *(unsigned char *)(a2 + 224);
    }
    else
    {
      uint64_t v28 = *(void *)(a2 + 192);
      uint64_t v29 = *(void *)(a2 + 200);
      uint64_t v30 = *(void *)(a2 + 208);
      uint64_t v31 = *(void *)(a2 + 216);
      sub_100004700(v28, v29, v30, v31, *(unsigned char *)(a2 + 224));
      *(void *)(a1 + 192) = v28;
      *(void *)(a1 + 200) = v29;
      *(void *)(a1 + 208) = v30;
      *(void *)(a1 + 216) = v31;
      *(unsigned char *)(a1 + 224) = v27;
    }
  }
  uint64_t v33 = *(void *)(a2 + 232);
  uint64_t v34 = *(void *)(a2 + 240);
  uint64_t v35 = *(void *)(a2 + 248);
  uint64_t v36 = *(void *)(a2 + 256);
  unsigned __int8 v37 = *(unsigned char *)(a2 + 264);
  sub_100004700(v33, v34, v35, v36, v37);
  *(void *)(a1 + 232) = v33;
  *(void *)(a1 + 240) = v34;
  *(void *)(a1 + 248) = v35;
  *(void *)(a1 + 256) = v36;
  *(unsigned char *)(a1 + 264) = v37;
  int v38 = *(unsigned __int8 *)(a2 + 304);
  if (v38 == 255)
  {
    long long v43 = *(_OWORD *)(a2 + 288);
    *(_OWORD *)(a1 + 272) = *(_OWORD *)(a2 + 272);
    *(_OWORD *)(a1 + 288) = v43;
    *(unsigned char *)(a1 + 304) = *(unsigned char *)(a2 + 304);
  }
  else
  {
    uint64_t v39 = *(void *)(a2 + 272);
    uint64_t v40 = *(void *)(a2 + 280);
    uint64_t v41 = *(void *)(a2 + 288);
    uint64_t v42 = *(void *)(a2 + 296);
    sub_100004700(v39, v40, v41, v42, *(unsigned char *)(a2 + 304));
    *(void *)(a1 + 272) = v39;
    *(void *)(a1 + 280) = v40;
    *(void *)(a1 + 288) = v41;
    *(void *)(a1 + 296) = v42;
    *(unsigned char *)(a1 + 304) = v38;
  }
  uint64_t v44 = *(unsigned __int8 *)(a2 + 344);
  if (v44 == 255)
  {
    long long v45 = *(_OWORD *)(a2 + 360);
    *(_OWORD *)(a1 + 344) = *(_OWORD *)(a2 + 344);
    *(_OWORD *)(a1 + 360) = v45;
    *(_OWORD *)(a1 + 369) = *(_OWORD *)(a2 + 369);
    long long v46 = *(_OWORD *)(a2 + 328);
    *(_OWORD *)(a1 + 312) = *(_OWORD *)(a2 + 312);
    *(_OWORD *)(a1 + 328) = v46;
  }
  else
  {
    uint64_t v47 = *(void *)(a2 + 312);
    uint64_t v48 = *(void *)(a2 + 320);
    uint64_t v49 = *(void *)(a2 + 328);
    uint64_t v50 = *(void *)(a2 + 336);
    sub_100004700(v47, v48, v49, v50, *(unsigned char *)(a2 + 344));
    *(void *)(a1 + 312) = v47;
    *(void *)(a1 + 320) = v48;
    *(void *)(a1 + 328) = v49;
    *(void *)(a1 + 336) = v50;
    *(unsigned char *)(a1 + 344) = v44;
    int v51 = *(unsigned __int8 *)(a2 + 384);
    if (v51 == 255)
    {
      long long v56 = *(_OWORD *)(a2 + 368);
      *(_OWORD *)(a1 + 352) = *(_OWORD *)(a2 + 352);
      *(_OWORD *)(a1 + 368) = v56;
      *(unsigned char *)(a1 + 384) = *(unsigned char *)(a2 + 384);
    }
    else
    {
      uint64_t v52 = *(void *)(a2 + 352);
      uint64_t v53 = *(void *)(a2 + 360);
      uint64_t v54 = *(void *)(a2 + 368);
      uint64_t v55 = *(void *)(a2 + 376);
      sub_100004700(v52, v53, v54, v55, *(unsigned char *)(a2 + 384));
      *(void *)(a1 + 352) = v52;
      *(void *)(a1 + 360) = v53;
      *(void *)(a1 + 368) = v54;
      *(void *)(a1 + 376) = v55;
      *(unsigned char *)(a1 + 384) = v51;
    }
  }
  uint64_t v57 = *(void *)(a2 + 392);
  uint64_t v58 = *(void *)(a2 + 400);
  uint64_t v59 = *(void *)(a2 + 408);
  uint64_t v60 = *(void *)(a2 + 416);
  uint64_t v61 = *(void *)(a2 + 424);
  unsigned __int8 v62 = *(unsigned char *)(a2 + 432);
  sub_100004760(v57, v58, v59, v60, v61, v62);
  *(void *)(a1 + 392) = v57;
  *(void *)(a1 + 400) = v58;
  *(void *)(a1 + 408) = v59;
  *(void *)(a1 + 416) = v60;
  *(void *)(a1 + 424) = v61;
  *(unsigned char *)(a1 + 432) = v62;
  *(unsigned char *)(a1 + 433) = *(unsigned char *)(a2 + 433);
  return a1;
}

uint64_t assignWithCopy for LiveActivitySetupConfig(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = (_OWORD *)(a1 + 40);
  uint64_t v5 = (_OWORD *)(a2 + 40);
  uint64_t v6 = *(void *)(a2 + 48);
  if (*(void *)(a1 + 48))
  {
    if (v6)
    {
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      *(void *)(a1 + 48) = *(void *)(a2 + 48);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      *(void *)(a1 + 64) = *(void *)(a2 + 64);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_1000053E8(a1 + 40);
      long long v7 = *(_OWORD *)(a2 + 56);
      *uint64_t v4 = *v5;
      *(_OWORD *)(a1 + 56) = v7;
    }
  }
  else if (v6)
  {
    *(void *)(a1 + 40) = *(void *)(a2 + 40);
    *(void *)(a1 + 48) = *(void *)(a2 + 48);
    *(void *)(a1 + 56) = *(void *)(a2 + 56);
    *(void *)(a1 + 64) = *(void *)(a2 + 64);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  else
  {
    long long v8 = *(_OWORD *)(a2 + 56);
    *uint64_t v4 = *v5;
    *(_OWORD *)(a1 + 56) = v8;
  }
  uint64_t v9 = *(void *)(a2 + 72);
  uint64_t v10 = *(void *)(a2 + 80);
  uint64_t v11 = *(void *)(a2 + 88);
  uint64_t v12 = *(void *)(a2 + 96);
  unsigned __int8 v13 = *(unsigned char *)(a2 + 104);
  sub_100004700(v9, v10, v11, v12, v13);
  uint64_t v14 = *(void *)(a1 + 72);
  uint64_t v15 = *(void *)(a1 + 80);
  uint64_t v16 = *(void *)(a1 + 88);
  uint64_t v17 = *(void *)(a1 + 96);
  *(void *)(a1 + 72) = v9;
  *(void *)(a1 + 80) = v10;
  *(void *)(a1 + 88) = v11;
  *(void *)(a1 + 96) = v12;
  unsigned __int8 v18 = *(unsigned char *)(a1 + 104);
  *(unsigned char *)(a1 + 104) = v13;
  sub_1000048C0(v14, v15, v16, v17, v18);
  long long v19 = (long long *)(a1 + 112);
  uint64_t v20 = (long long *)(a2 + 112);
  int v21 = *(unsigned __int8 *)(a2 + 144);
  if (*(unsigned __int8 *)(a1 + 144) == 255)
  {
    if (v21 == 255)
    {
      long long v37 = *v20;
      long long v38 = *(_OWORD *)(a2 + 128);
      *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
      *long long v19 = v37;
      *(_OWORD *)(a1 + 128) = v38;
    }
    else
    {
      uint64_t v31 = *(void *)(a2 + 112);
      uint64_t v32 = *(void *)(a2 + 120);
      uint64_t v33 = *(void *)(a2 + 128);
      uint64_t v34 = *(void *)(a2 + 136);
      sub_100004700(v31, v32, v33, v34, *(unsigned char *)(a2 + 144));
      *(void *)(a1 + 112) = v31;
      *(void *)(a1 + 120) = v32;
      *(void *)(a1 + 128) = v33;
      *(void *)(a1 + 136) = v34;
      *(unsigned char *)(a1 + 144) = v21;
    }
  }
  else if (v21 == 255)
  {
    sub_10000543C(a1 + 112);
    char v35 = *(unsigned char *)(a2 + 144);
    long long v36 = *(_OWORD *)(a2 + 128);
    *long long v19 = *v20;
    *(_OWORD *)(a1 + 128) = v36;
    *(unsigned char *)(a1 + 144) = v35;
  }
  else
  {
    uint64_t v22 = *(void *)(a2 + 112);
    uint64_t v23 = *(void *)(a2 + 120);
    uint64_t v24 = *(void *)(a2 + 128);
    uint64_t v25 = *(void *)(a2 + 136);
    sub_100004700(v22, v23, v24, v25, *(unsigned char *)(a2 + 144));
    uint64_t v26 = *(void *)(a1 + 112);
    uint64_t v27 = *(void *)(a1 + 120);
    uint64_t v28 = *(void *)(a1 + 128);
    uint64_t v29 = *(void *)(a1 + 136);
    *(void *)(a1 + 112) = v22;
    *(void *)(a1 + 120) = v23;
    *(void *)(a1 + 128) = v24;
    *(void *)(a1 + 136) = v25;
    unsigned __int8 v30 = *(unsigned char *)(a1 + 144);
    *(unsigned char *)(a1 + 144) = v21;
    sub_1000048C0(v26, v27, v28, v29, v30);
  }
  uint64_t v39 = (_OWORD *)(a1 + 152);
  uint64_t v40 = (_OWORD *)(a2 + 152);
  uint64_t v41 = *(unsigned __int8 *)(a2 + 184);
  if (*(unsigned char *)(a1 + 184) == 0xFF)
  {
    if (v41 == 255)
    {
      _OWORD *v39 = *v40;
      long long v42 = *(_OWORD *)(a2 + 168);
      long long v43 = *(_OWORD *)(a2 + 184);
      long long v44 = *(_OWORD *)(a2 + 200);
      *(_OWORD *)(a1 + 209) = *(_OWORD *)(a2 + 209);
      *(_OWORD *)(a1 + 184) = v43;
      *(_OWORD *)(a1 + 200) = v44;
      *(_OWORD *)(a1 + 168) = v42;
      goto LABEL_29;
    }
    uint64_t v48 = *(void *)(a2 + 152);
    uint64_t v49 = *(void *)(a2 + 160);
    uint64_t v50 = *(void *)(a2 + 168);
    uint64_t v51 = *(void *)(a2 + 176);
    sub_100004700(v48, v49, v50, v51, *(unsigned char *)(a2 + 184));
    *(void *)(a1 + 152) = v48;
    *(void *)(a1 + 160) = v49;
    *(void *)(a1 + 168) = v50;
    *(void *)(a1 + 176) = v51;
    *(unsigned char *)(a1 + 184) = v41;
    int v52 = *(unsigned __int8 *)(a2 + 224);
    if (v52 == 255)
    {
      long long v53 = *(_OWORD *)(a2 + 192);
      long long v54 = *(_OWORD *)(a2 + 208);
      *(unsigned char *)(a1 + 224) = *(unsigned char *)(a2 + 224);
      *(_OWORD *)(a1 + 192) = v53;
      *(_OWORD *)(a1 + 208) = v54;
      goto LABEL_29;
    }
    goto LABEL_26;
  }
  if (v41 == 255)
  {
    sub_100005490(a1 + 152);
    _OWORD *v39 = *v40;
    long long v46 = *(_OWORD *)(a2 + 184);
    long long v45 = *(_OWORD *)(a2 + 200);
    long long v47 = *(_OWORD *)(a2 + 168);
    *(_OWORD *)(a1 + 209) = *(_OWORD *)(a2 + 209);
    *(_OWORD *)(a1 + 184) = v46;
    *(_OWORD *)(a1 + 200) = v45;
    *(_OWORD *)(a1 + 168) = v47;
    goto LABEL_29;
  }
  uint64_t v55 = *(void *)(a2 + 152);
  uint64_t v56 = *(void *)(a2 + 160);
  uint64_t v57 = *(void *)(a2 + 168);
  uint64_t v58 = *(void *)(a2 + 176);
  sub_100004700(v55, v56, v57, v58, *(unsigned char *)(a2 + 184));
  uint64_t v59 = *(void *)(a1 + 152);
  uint64_t v60 = *(void *)(a1 + 160);
  uint64_t v61 = *(void *)(a1 + 168);
  uint64_t v62 = *(void *)(a1 + 176);
  *(void *)(a1 + 152) = v55;
  *(void *)(a1 + 160) = v56;
  *(void *)(a1 + 168) = v57;
  *(void *)(a1 + 176) = v58;
  unsigned __int8 v63 = *(unsigned char *)(a1 + 184);
  *(unsigned char *)(a1 + 184) = v41;
  sub_1000048C0(v59, v60, v61, v62, v63);
  uint64_t v64 = (_OWORD *)(a1 + 192);
  uint64_t v65 = (_OWORD *)(a2 + 192);
  int v52 = *(unsigned __int8 *)(a2 + 224);
  if (*(unsigned __int8 *)(a1 + 224) != 255)
  {
    if (v52 == 255)
    {
      sub_10000543C(a1 + 192);
      char v79 = *(unsigned char *)(a2 + 224);
      long long v80 = *(_OWORD *)(a2 + 208);
      *uint64_t v64 = *v65;
      *(_OWORD *)(a1 + 208) = v80;
      *(unsigned char *)(a1 + 224) = v79;
    }
    else
    {
      uint64_t v66 = *(void *)(a2 + 192);
      uint64_t v67 = *(void *)(a2 + 200);
      uint64_t v68 = *(void *)(a2 + 208);
      uint64_t v69 = *(void *)(a2 + 216);
      sub_100004700(v66, v67, v68, v69, *(unsigned char *)(a2 + 224));
      uint64_t v70 = *(void *)(a1 + 192);
      uint64_t v71 = *(void *)(a1 + 200);
      uint64_t v72 = *(void *)(a1 + 208);
      uint64_t v73 = *(void *)(a1 + 216);
      *(void *)(a1 + 192) = v66;
      *(void *)(a1 + 200) = v67;
      *(void *)(a1 + 208) = v68;
      *(void *)(a1 + 216) = v69;
      unsigned __int8 v74 = *(unsigned char *)(a1 + 224);
      *(unsigned char *)(a1 + 224) = v52;
      sub_1000048C0(v70, v71, v72, v73, v74);
    }
    goto LABEL_29;
  }
  if (v52 != 255)
  {
LABEL_26:
    uint64_t v75 = *(void *)(a2 + 192);
    uint64_t v76 = *(void *)(a2 + 200);
    uint64_t v77 = *(void *)(a2 + 208);
    uint64_t v78 = *(void *)(a2 + 216);
    sub_100004700(v75, v76, v77, v78, v52);
    *(void *)(a1 + 192) = v75;
    *(void *)(a1 + 200) = v76;
    *(void *)(a1 + 208) = v77;
    *(void *)(a1 + 216) = v78;
    *(unsigned char *)(a1 + 224) = v52;
    goto LABEL_29;
  }
  long long v81 = *v65;
  long long v82 = *(_OWORD *)(a2 + 208);
  *(unsigned char *)(a1 + 224) = *(unsigned char *)(a2 + 224);
  *uint64_t v64 = v81;
  *(_OWORD *)(a1 + 208) = v82;
LABEL_29:
  uint64_t v83 = *(void *)(a2 + 232);
  uint64_t v84 = *(void *)(a2 + 240);
  uint64_t v85 = *(void *)(a2 + 248);
  uint64_t v86 = *(void *)(a2 + 256);
  unsigned __int8 v87 = *(unsigned char *)(a2 + 264);
  sub_100004700(v83, v84, v85, v86, v87);
  uint64_t v88 = *(void *)(a1 + 232);
  uint64_t v89 = *(void *)(a1 + 240);
  uint64_t v90 = *(void *)(a1 + 248);
  uint64_t v91 = *(void *)(a1 + 256);
  *(void *)(a1 + 232) = v83;
  *(void *)(a1 + 240) = v84;
  *(void *)(a1 + 248) = v85;
  *(void *)(a1 + 256) = v86;
  unsigned __int8 v92 = *(unsigned char *)(a1 + 264);
  *(unsigned char *)(a1 + 264) = v87;
  sub_1000048C0(v88, v89, v90, v91, v92);
  v93 = (long long *)(a1 + 272);
  v94 = (long long *)(a2 + 272);
  int v95 = *(unsigned __int8 *)(a2 + 304);
  if (*(unsigned __int8 *)(a1 + 304) == 255)
  {
    if (v95 == 255)
    {
      long long v111 = *v94;
      long long v112 = *(_OWORD *)(a2 + 288);
      *(unsigned char *)(a1 + 304) = *(unsigned char *)(a2 + 304);
      long long *v93 = v111;
      *(_OWORD *)(a1 + 288) = v112;
    }
    else
    {
      uint64_t v105 = *(void *)(a2 + 272);
      uint64_t v106 = *(void *)(a2 + 280);
      uint64_t v107 = *(void *)(a2 + 288);
      uint64_t v108 = *(void *)(a2 + 296);
      sub_100004700(v105, v106, v107, v108, *(unsigned char *)(a2 + 304));
      *(void *)(a1 + 272) = v105;
      *(void *)(a1 + 280) = v106;
      *(void *)(a1 + 288) = v107;
      *(void *)(a1 + 296) = v108;
      *(unsigned char *)(a1 + 304) = v95;
    }
  }
  else if (v95 == 255)
  {
    sub_10000543C(a1 + 272);
    char v109 = *(unsigned char *)(a2 + 304);
    long long v110 = *(_OWORD *)(a2 + 288);
    long long *v93 = *v94;
    *(_OWORD *)(a1 + 288) = v110;
    *(unsigned char *)(a1 + 304) = v109;
  }
  else
  {
    uint64_t v96 = *(void *)(a2 + 272);
    uint64_t v97 = *(void *)(a2 + 280);
    uint64_t v98 = *(void *)(a2 + 288);
    uint64_t v99 = *(void *)(a2 + 296);
    sub_100004700(v96, v97, v98, v99, *(unsigned char *)(a2 + 304));
    uint64_t v100 = *(void *)(a1 + 272);
    uint64_t v101 = *(void *)(a1 + 280);
    uint64_t v102 = *(void *)(a1 + 288);
    uint64_t v103 = *(void *)(a1 + 296);
    *(void *)(a1 + 272) = v96;
    *(void *)(a1 + 280) = v97;
    *(void *)(a1 + 288) = v98;
    *(void *)(a1 + 296) = v99;
    unsigned __int8 v104 = *(unsigned char *)(a1 + 304);
    *(unsigned char *)(a1 + 304) = v95;
    sub_1000048C0(v100, v101, v102, v103, v104);
  }
  v113 = (_OWORD *)(a1 + 312);
  v114 = (_OWORD *)(a2 + 312);
  uint64_t v115 = *(unsigned __int8 *)(a2 + 344);
  if (*(unsigned char *)(a1 + 344) == 0xFF)
  {
    if (v115 == 255)
    {
      _OWORD *v113 = *v114;
      long long v116 = *(_OWORD *)(a2 + 328);
      long long v117 = *(_OWORD *)(a2 + 344);
      long long v118 = *(_OWORD *)(a2 + 360);
      *(_OWORD *)(a1 + 369) = *(_OWORD *)(a2 + 369);
      *(_OWORD *)(a1 + 344) = v117;
      *(_OWORD *)(a1 + 360) = v118;
      *(_OWORD *)(a1 + 328) = v116;
      goto LABEL_50;
    }
    uint64_t v122 = *(void *)(a2 + 312);
    uint64_t v123 = *(void *)(a2 + 320);
    uint64_t v124 = *(void *)(a2 + 328);
    uint64_t v125 = *(void *)(a2 + 336);
    sub_100004700(v122, v123, v124, v125, *(unsigned char *)(a2 + 344));
    *(void *)(a1 + 312) = v122;
    *(void *)(a1 + 320) = v123;
    *(void *)(a1 + 328) = v124;
    *(void *)(a1 + 336) = v125;
    *(unsigned char *)(a1 + 344) = v115;
    int v126 = *(unsigned __int8 *)(a2 + 384);
    if (v126 == 255)
    {
      long long v127 = *(_OWORD *)(a2 + 352);
      long long v128 = *(_OWORD *)(a2 + 368);
      *(unsigned char *)(a1 + 384) = *(unsigned char *)(a2 + 384);
      *(_OWORD *)(a1 + 352) = v127;
      *(_OWORD *)(a1 + 368) = v128;
      goto LABEL_50;
    }
LABEL_47:
    uint64_t v149 = *(void *)(a2 + 352);
    uint64_t v150 = *(void *)(a2 + 360);
    uint64_t v151 = *(void *)(a2 + 368);
    uint64_t v152 = *(void *)(a2 + 376);
    sub_100004700(v149, v150, v151, v152, v126);
    *(void *)(a1 + 352) = v149;
    *(void *)(a1 + 360) = v150;
    *(void *)(a1 + 368) = v151;
    *(void *)(a1 + 376) = v152;
    *(unsigned char *)(a1 + 384) = v126;
    goto LABEL_50;
  }
  if (v115 == 255)
  {
    sub_100005490(a1 + 312);
    _OWORD *v113 = *v114;
    long long v120 = *(_OWORD *)(a2 + 344);
    long long v119 = *(_OWORD *)(a2 + 360);
    long long v121 = *(_OWORD *)(a2 + 328);
    *(_OWORD *)(a1 + 369) = *(_OWORD *)(a2 + 369);
    *(_OWORD *)(a1 + 344) = v120;
    *(_OWORD *)(a1 + 360) = v119;
    *(_OWORD *)(a1 + 328) = v121;
    goto LABEL_50;
  }
  uint64_t v129 = *(void *)(a2 + 312);
  uint64_t v130 = *(void *)(a2 + 320);
  uint64_t v131 = *(void *)(a2 + 328);
  uint64_t v132 = *(void *)(a2 + 336);
  sub_100004700(v129, v130, v131, v132, *(unsigned char *)(a2 + 344));
  uint64_t v133 = *(void *)(a1 + 312);
  uint64_t v134 = *(void *)(a1 + 320);
  uint64_t v135 = *(void *)(a1 + 328);
  uint64_t v136 = *(void *)(a1 + 336);
  *(void *)(a1 + 312) = v129;
  *(void *)(a1 + 320) = v130;
  *(void *)(a1 + 328) = v131;
  *(void *)(a1 + 336) = v132;
  unsigned __int8 v137 = *(unsigned char *)(a1 + 344);
  *(unsigned char *)(a1 + 344) = v115;
  sub_1000048C0(v133, v134, v135, v136, v137);
  v138 = (long long *)(a1 + 352);
  v139 = (long long *)(a2 + 352);
  int v126 = *(unsigned __int8 *)(a2 + 384);
  if (*(unsigned __int8 *)(a1 + 384) == 255)
  {
    if (v126 == 255)
    {
      long long v155 = *v139;
      long long v156 = *(_OWORD *)(a2 + 368);
      *(unsigned char *)(a1 + 384) = *(unsigned char *)(a2 + 384);
      long long *v138 = v155;
      *(_OWORD *)(a1 + 368) = v156;
      goto LABEL_50;
    }
    goto LABEL_47;
  }
  if (v126 == 255)
  {
    sub_10000543C(a1 + 352);
    char v153 = *(unsigned char *)(a2 + 384);
    long long v154 = *(_OWORD *)(a2 + 368);
    long long *v138 = *v139;
    *(_OWORD *)(a1 + 368) = v154;
    *(unsigned char *)(a1 + 384) = v153;
  }
  else
  {
    uint64_t v140 = *(void *)(a2 + 352);
    uint64_t v141 = *(void *)(a2 + 360);
    uint64_t v142 = *(void *)(a2 + 368);
    uint64_t v143 = *(void *)(a2 + 376);
    sub_100004700(v140, v141, v142, v143, *(unsigned char *)(a2 + 384));
    uint64_t v144 = *(void *)(a1 + 352);
    uint64_t v145 = *(void *)(a1 + 360);
    uint64_t v146 = *(void *)(a1 + 368);
    uint64_t v147 = *(void *)(a1 + 376);
    *(void *)(a1 + 352) = v140;
    *(void *)(a1 + 360) = v141;
    *(void *)(a1 + 368) = v142;
    *(void *)(a1 + 376) = v143;
    unsigned __int8 v148 = *(unsigned char *)(a1 + 384);
    *(unsigned char *)(a1 + 384) = v126;
    sub_1000048C0(v144, v145, v146, v147, v148);
  }
LABEL_50:
  uint64_t v157 = *(void *)(a2 + 392);
  uint64_t v158 = *(void *)(a2 + 400);
  uint64_t v159 = *(void *)(a2 + 408);
  uint64_t v160 = *(void *)(a2 + 416);
  uint64_t v161 = *(void *)(a2 + 424);
  unsigned __int8 v162 = *(unsigned char *)(a2 + 432);
  sub_100004760(v157, v158, v159, v160, v161, v162);
  uint64_t v163 = *(void *)(a1 + 392);
  uint64_t v164 = *(void *)(a1 + 400);
  uint64_t v165 = *(void *)(a1 + 408);
  uint64_t v166 = *(void *)(a1 + 416);
  uint64_t v167 = *(void *)(a1 + 424);
  *(void *)(a1 + 392) = v157;
  *(void *)(a1 + 400) = v158;
  *(void *)(a1 + 408) = v159;
  *(void *)(a1 + 416) = v160;
  *(void *)(a1 + 424) = v161;
  unsigned __int8 v168 = *(unsigned char *)(a1 + 432);
  *(unsigned char *)(a1 + 432) = v162;
  sub_100004920(v163, v164, v165, v166, v167, v168);
  *(unsigned char *)(a1 + 433) = *(unsigned char *)(a2 + 433);
  return a1;
}

uint64_t sub_1000053E8(uint64_t a1)
{
  return a1;
}

uint64_t sub_10000543C(uint64_t a1)
{
  return a1;
}

uint64_t sub_100005490(uint64_t a1)
{
  return a1;
}

void *initializeWithTake for LiveActivitySetupConfig(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x1B2uLL);
}

uint64_t assignWithTake for LiveActivitySetupConfig(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  if (*(void *)(a1 + 48))
  {
    uint64_t v6 = *(void *)(a2 + 48);
    if (v6)
    {
      *(void *)(a1 + 40) = *(void *)(a2 + 40);
      *(void *)(a1 + 48) = v6;
      swift_bridgeObjectRelease();
      uint64_t v7 = *(void *)(a2 + 64);
      *(void *)(a1 + 56) = *(void *)(a2 + 56);
      *(void *)(a1 + 64) = v7;
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
    sub_1000053E8(a1 + 40);
  }
  long long v8 = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = v8;
LABEL_6:
  char v9 = *(unsigned char *)(a2 + 104);
  uint64_t v10 = *(void *)(a1 + 72);
  uint64_t v11 = *(void *)(a1 + 80);
  uint64_t v12 = *(void *)(a1 + 88);
  uint64_t v13 = *(void *)(a1 + 96);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  unsigned __int8 v14 = *(unsigned char *)(a1 + 104);
  *(unsigned char *)(a1 + 104) = v9;
  sub_1000048C0(v10, v11, v12, v13, v14);
  int v15 = *(unsigned __int8 *)(a1 + 144);
  if (v15 != 255)
  {
    int v16 = *(unsigned __int8 *)(a2 + 144);
    if (v16 != 255)
    {
      uint64_t v17 = *(void *)(a1 + 112);
      uint64_t v18 = *(void *)(a1 + 120);
      uint64_t v19 = *(void *)(a1 + 128);
      uint64_t v20 = *(void *)(a1 + 136);
      long long v21 = *(_OWORD *)(a2 + 128);
      *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
      *(_OWORD *)(a1 + 128) = v21;
      *(unsigned char *)(a1 + 144) = v16;
      sub_1000048C0(v17, v18, v19, v20, v15);
      goto LABEL_11;
    }
    sub_10000543C(a1 + 112);
  }
  long long v22 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 112) = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 128) = v22;
  *(unsigned char *)(a1 + 144) = *(unsigned char *)(a2 + 144);
LABEL_11:
  uint64_t v23 = *(unsigned __int8 *)(a1 + 184);
  if (v23 == 255)
  {
LABEL_14:
    long long v25 = *(_OWORD *)(a2 + 200);
    *(_OWORD *)(a1 + 184) = *(_OWORD *)(a2 + 184);
    *(_OWORD *)(a1 + 200) = v25;
    *(_OWORD *)(a1 + 209) = *(_OWORD *)(a2 + 209);
    long long v26 = *(_OWORD *)(a2 + 168);
    *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
    *(_OWORD *)(a1 + 168) = v26;
    goto LABEL_15;
  }
  uint64_t v24 = *(unsigned __int8 *)(a2 + 184);
  if (v24 == 255)
  {
    sub_100005490(a1 + 152);
    goto LABEL_14;
  }
  uint64_t v40 = *(void *)(a1 + 152);
  uint64_t v41 = *(void *)(a1 + 160);
  uint64_t v42 = *(void *)(a1 + 168);
  uint64_t v43 = *(void *)(a1 + 176);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  *(_OWORD *)(a1 + 168) = *(_OWORD *)(a2 + 168);
  *(unsigned char *)(a1 + 184) = v24;
  sub_1000048C0(v40, v41, v42, v43, v23);
  int v44 = *(unsigned __int8 *)(a1 + 224);
  if (v44 != 255)
  {
    int v45 = *(unsigned __int8 *)(a2 + 224);
    if (v45 != 255)
    {
      uint64_t v46 = *(void *)(a1 + 192);
      uint64_t v47 = *(void *)(a1 + 200);
      uint64_t v48 = *(void *)(a1 + 208);
      uint64_t v49 = *(void *)(a1 + 216);
      long long v50 = *(_OWORD *)(a2 + 208);
      *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
      *(_OWORD *)(a1 + 208) = v50;
      *(unsigned char *)(a1 + 224) = v45;
      sub_1000048C0(v46, v47, v48, v49, v44);
      goto LABEL_15;
    }
    sub_10000543C(a1 + 192);
  }
  long long v80 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 208) = v80;
  *(unsigned char *)(a1 + 224) = *(unsigned char *)(a2 + 224);
LABEL_15:
  char v27 = *(unsigned char *)(a2 + 264);
  uint64_t v28 = *(void *)(a1 + 232);
  uint64_t v29 = *(void *)(a1 + 240);
  uint64_t v30 = *(void *)(a1 + 248);
  uint64_t v31 = *(void *)(a1 + 256);
  *(_OWORD *)(a1 + 232) = *(_OWORD *)(a2 + 232);
  *(_OWORD *)(a1 + 248) = *(_OWORD *)(a2 + 248);
  unsigned __int8 v32 = *(unsigned char *)(a1 + 264);
  *(unsigned char *)(a1 + 264) = v27;
  sub_1000048C0(v28, v29, v30, v31, v32);
  int v33 = *(unsigned __int8 *)(a1 + 304);
  if (v33 != 255)
  {
    int v34 = *(unsigned __int8 *)(a2 + 304);
    if (v34 != 255)
    {
      uint64_t v35 = *(void *)(a1 + 272);
      uint64_t v36 = *(void *)(a1 + 280);
      uint64_t v37 = *(void *)(a1 + 288);
      uint64_t v38 = *(void *)(a1 + 296);
      long long v39 = *(_OWORD *)(a2 + 288);
      *(_OWORD *)(a1 + 272) = *(_OWORD *)(a2 + 272);
      *(_OWORD *)(a1 + 288) = v39;
      *(unsigned char *)(a1 + 304) = v34;
      sub_1000048C0(v35, v36, v37, v38, v33);
      goto LABEL_23;
    }
    sub_10000543C(a1 + 272);
  }
  long long v51 = *(_OWORD *)(a2 + 288);
  *(_OWORD *)(a1 + 272) = *(_OWORD *)(a2 + 272);
  *(_OWORD *)(a1 + 288) = v51;
  *(unsigned char *)(a1 + 304) = *(unsigned char *)(a2 + 304);
LABEL_23:
  int v52 = (_OWORD *)(a1 + 312);
  long long v53 = (_OWORD *)(a2 + 312);
  uint64_t v54 = *(unsigned __int8 *)(a1 + 344);
  if (v54 != 255)
  {
    uint64_t v55 = *(unsigned __int8 *)(a2 + 344);
    if (v55 != 255)
    {
      uint64_t v68 = *(void *)(a1 + 312);
      uint64_t v69 = *(void *)(a1 + 320);
      uint64_t v70 = *(void *)(a1 + 328);
      uint64_t v71 = *(void *)(a1 + 336);
      long long v72 = *(_OWORD *)(a2 + 328);
      *int v52 = *v53;
      *(_OWORD *)(a1 + 328) = v72;
      *(unsigned char *)(a1 + 344) = v55;
      sub_1000048C0(v68, v69, v70, v71, v54);
      int v73 = *(unsigned __int8 *)(a1 + 384);
      if (v73 != 255)
      {
        int v74 = *(unsigned __int8 *)(a2 + 384);
        if (v74 != 255)
        {
          uint64_t v75 = *(void *)(a1 + 352);
          uint64_t v76 = *(void *)(a1 + 360);
          uint64_t v77 = *(void *)(a1 + 368);
          uint64_t v78 = *(void *)(a1 + 376);
          long long v79 = *(_OWORD *)(a2 + 368);
          *(_OWORD *)(a1 + 352) = *(_OWORD *)(a2 + 352);
          *(_OWORD *)(a1 + 368) = v79;
          *(unsigned char *)(a1 + 384) = v74;
          sub_1000048C0(v75, v76, v77, v78, v73);
          goto LABEL_27;
        }
        sub_10000543C(a1 + 352);
      }
      long long v81 = *(_OWORD *)(a2 + 368);
      *(_OWORD *)(a1 + 352) = *(_OWORD *)(a2 + 352);
      *(_OWORD *)(a1 + 368) = v81;
      *(unsigned char *)(a1 + 384) = *(unsigned char *)(a2 + 384);
      goto LABEL_27;
    }
    sub_100005490(a1 + 312);
  }
  long long v56 = *(_OWORD *)(a2 + 360);
  *(_OWORD *)(a1 + 344) = *(_OWORD *)(a2 + 344);
  *(_OWORD *)(a1 + 360) = v56;
  *(_OWORD *)(a1 + 369) = *(_OWORD *)(a2 + 369);
  long long v57 = *(_OWORD *)(a2 + 328);
  *int v52 = *v53;
  *(_OWORD *)(a1 + 328) = v57;
LABEL_27:
  uint64_t v58 = *(void *)(a2 + 424);
  char v59 = *(unsigned char *)(a2 + 432);
  uint64_t v60 = *(void *)(a1 + 392);
  uint64_t v61 = *(void *)(a1 + 400);
  uint64_t v62 = *(void *)(a1 + 408);
  uint64_t v63 = *(void *)(a1 + 416);
  uint64_t v64 = *(void *)(a1 + 424);
  long long v65 = *(_OWORD *)(a2 + 408);
  *(_OWORD *)(a1 + 392) = *(_OWORD *)(a2 + 392);
  *(_OWORD *)(a1 + 408) = v65;
  *(void *)(a1 + 424) = v58;
  unsigned __int8 v66 = *(unsigned char *)(a1 + 432);
  *(unsigned char *)(a1 + 432) = v59;
  sub_100004920(v60, v61, v62, v63, v64, v66);
  *(unsigned char *)(a1 + 433) = *(unsigned char *)(a2 + 433);
  return a1;
}

uint64_t getEnumTagSinglePayload for LiveActivitySetupConfig(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 434)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for LiveActivitySetupConfig(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 424) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 432) = 0;
    *(_OWORD *)(result + 408) = 0u;
    *(_OWORD *)(result + 392) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 434) = 1;
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
    *(unsigned char *)(result + 434) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for LiveActivitySetupConfig()
{
  return &type metadata for LiveActivitySetupConfig;
}

uint64_t sub_100005934(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 80);
  uint64_t v13 = *(void *)(a1 + 72);
  uint64_t v10 = *(void *)(a1 + 96);
  uint64_t v11 = *(void *)(a1 + 88);
  uint64_t v17 = *(void *)(a1 + 120);
  uint64_t v18 = *(void *)(a1 + 112);
  uint64_t v15 = *(void *)(a1 + 136);
  uint64_t v16 = *(void *)(a1 + 128);
  uint64_t v25 = *(void *)(a1 + 160);
  uint64_t v26 = *(void *)(a1 + 152);
  uint64_t v23 = *(void *)(a1 + 176);
  uint64_t v24 = *(void *)(a1 + 168);
  uint64_t v21 = *(void *)(a1 + 192);
  uint64_t v22 = *(void *)(a1 + 184);
  uint64_t v19 = *(void *)(a1 + 208);
  uint64_t v20 = *(void *)(a1 + 200);
  uint64_t v14 = *(void *)(a1 + 216);
  unsigned __int8 v9 = *(unsigned char *)(a1 + 224);
  uint64_t v30 = *(void *)(a1 + 240);
  uint64_t v31 = *(void *)(a1 + 232);
  uint64_t v28 = *(void *)(a1 + 256);
  uint64_t v29 = *(void *)(a1 + 248);
  uint64_t v36 = *(void *)(a1 + 272);
  uint64_t v34 = *(void *)(a1 + 288);
  uint64_t v35 = *(void *)(a1 + 280);
  uint64_t v33 = *(void *)(a1 + 296);
  uint64_t v44 = *(void *)(a1 + 320);
  uint64_t v45 = *(void *)(a1 + 312);
  uint64_t v42 = *(void *)(a1 + 336);
  uint64_t v43 = *(void *)(a1 + 328);
  uint64_t v40 = *(void *)(a1 + 352);
  uint64_t v41 = *(void *)(a1 + 344);
  uint64_t v38 = *(void *)(a1 + 368);
  uint64_t v39 = *(void *)(a1 + 360);
  uint64_t v32 = *(void *)(a1 + 376);
  unsigned __int8 v27 = *(unsigned char *)(a1 + 384);
  uint64_t v49 = *(void *)(a1 + 400);
  uint64_t v50 = *(void *)(a1 + 392);
  uint64_t v47 = *(void *)(a1 + 416);
  uint64_t v48 = *(void *)(a1 + 408);
  uint64_t v46 = *(void *)(a1 + 424);
  unsigned __int8 v4 = *(unsigned char *)(a1 + 104);
  unsigned __int8 v5 = *(unsigned char *)(a1 + 144);
  unsigned __int8 v6 = *(unsigned char *)(a1 + 264);
  unsigned __int8 v7 = *(unsigned char *)(a1 + 304);
  unsigned __int8 v37 = *(unsigned char *)(a1 + 432);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_100005B6C(v2, v3);
  sub_100004700(v13, v12, v11, v10, v4);
  sub_100005BB0(v18, v17, v16, v15, v5);
  sub_100005BC4(v26, v25, v24, v23, v22, v21, v20, v19, v14, v9);
  sub_100004700(v31, v30, v29, v28, v6);
  sub_100005BB0(v36, v35, v34, v33, v7);
  sub_100005BC4(v45, v44, v43, v42, v41, v40, v39, v38, v32, v27);
  sub_100004760(v50, v49, v48, v47, v46, v37);
  return a1;
}

uint64_t sub_100005B6C(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_100005BB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 != 0xFF) {
    return sub_100004700(a1, a2, a3, a4, a5);
  }
  return a1;
}

uint64_t sub_100005BC4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unsigned __int8 a10)
{
  if (a5 != 0xFF)
  {
    sub_100004700(result, a2, a3, a4, a5);
    return sub_100005BB0(a6, a7, a8, a9, a10);
  }
  return result;
}

uint64_t sub_100005C3C(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_100005C98(uint64_t a1)
{
  return a1;
}

uint64_t sub_100005CD0()
{
  uint64_t v0 = sub_100003E74(&qword_1000181D0);

  return TupleWidget.init(_:)(v0, v0);
}

int main(int argc, const char **argv, const char **envp)
{
  return 0;
}

unint64_t sub_100005D50()
{
  unint64_t result = qword_1000181C8;
  if (!qword_1000181C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000181C8);
  }
  return result;
}

ValueMetadata *type metadata accessor for BridgeWidgetExtensionBundle()
{
  return &type metadata for BridgeWidgetExtensionBundle;
}

uint64_t sub_100005DB4()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_100005DD4()
{
  unint64_t result = qword_1000181D8;
  if (!qword_1000181D8)
  {
    sub_100003CE0(&qword_1000181E0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000181D8);
  }
  return result;
}

__n128 initializeWithCopy for ProgressViewScreen(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 25) = *(_OWORD *)(a2 + 25);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for ProgressViewScreen(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFE && *(unsigned char *)(a1 + 41)) {
    return (*(_DWORD *)a1 + 254);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 40);
  BOOL v4 = v3 >= 3;
  int v5 = v3 - 3;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ProgressViewScreen(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 40) = 0;
    *(void *)__n128 result = a2 - 254;
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 41) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFE) {
      *(unsigned char *)(result + 41) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 40) = a2 + 2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ProgressViewScreen()
{
  return &type metadata for ProgressViewScreen;
}

uint64_t sub_100005EE8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100005F04@<X0>(uint64_t a1@<X8>, double a2@<D0>, __n128 a3@<Q1>)
{
  __n128 v38 = a3;
  uint64_t v5 = sub_100003E74(&qword_100018218);
  uint64_t v36 = *(void *)(v5 - 8);
  uint64_t v37 = v5;
  __chkstk_darwin(v5);
  unsigned __int8 v7 = (char *)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100003E74(&qword_100018220);
  uint64_t v9 = v8 - 8;
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v35 = (uint64_t)&v28 - v13;
  uint64_t v14 = sub_100011210();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v28 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100011230();
  (*(void (**)(char *, void, uint64_t))(v15 + 104))(v17, enum case for Image.ResizingMode.stretch(_:), v14);
  uint64_t v34 = sub_100011220();
  swift_release();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  sub_100011260();
  sub_100010E90();
  uint64_t v33 = v39;
  int v32 = v40;
  uint64_t v31 = v41;
  int v30 = v42;
  uint64_t v29 = v43;
  uint64_t v28 = v44;
  long long v45 = xmmword_100011AC0;
  swift_getKeyPath();
  uint64_t v18 = swift_allocObject();
  unint64_t v19 = v38.n128_u64[0];
  *(double *)(v18 + 16) = a2;
  *(void *)(v18 + 24) = v19;
  sub_100003E74(&qword_100018228);
  sub_100003E74(&qword_100018230);
  sub_100006CC8();
  sub_100006DC8(&qword_100018248, &qword_100018230, (void (*)(void))sub_100006D98);
  sub_100011250();
  sub_100011260();
  sub_100010E90();
  uint64_t v21 = v36;
  uint64_t v20 = v37;
  (*(void (**)(char *, char *, uint64_t))(v36 + 16))(v12, v7, v37);
  uint64_t v22 = (long long *)&v12[*(int *)(v9 + 44)];
  long long v23 = v46;
  long long *v22 = v45;
  v22[1] = v23;
  v22[2] = v47;
  (*(void (**)(char *, uint64_t))(v21 + 8))(v7, v20);
  uint64_t v24 = v35;
  sub_100006EE4((uint64_t)v12, v35);
  sub_100006F4C(v24, (uint64_t)v12, &qword_100018220);
  *(void *)a1 = v34;
  *(void *)(a1 + 8) = 0;
  *(_WORD *)(a1 + 16) = 1;
  *(void *)(a1 + 24) = v33;
  *(unsigned char *)(a1 + 32) = v32;
  *(void *)(a1 + 40) = v31;
  *(unsigned char *)(a1 + 48) = v30;
  uint64_t v25 = v28;
  *(void *)(a1 + 56) = v29;
  *(void *)(a1 + 64) = v25;
  uint64_t v26 = sub_100003E74(&qword_100018280);
  sub_100006F4C((uint64_t)v12, a1 + *(int *)(v26 + 48), &qword_100018220);
  swift_retain();
  sub_100006FB0(v24, &qword_100018220);
  sub_100006FB0((uint64_t)v12, &qword_100018220);
  return swift_release();
}

uint64_t *sub_100006430@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>)
{
  double v6 = a3 * 60.0;
  if ((~*(void *)&v6 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v6 <= -9.22337204e18)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (v6 >= 9.22337204e18)
  {
LABEL_10:
    __break(1u);
    return result;
  }
  uint64_t v7 = *result;
  if (*result >= (uint64_t)v6)
  {
    sub_100011170();
    uint64_t v8 = sub_1000111C0();
    swift_release();
  }
  else
  {
    uint64_t v8 = sub_1000111A0();
  }
  sub_100011260();
  sub_100010E90();
  __n128 result = (uint64_t *)sub_100011280();
  *(void *)a2 = v8;
  *(_WORD *)(a2 + 8) = 256;
  *(void *)(a2 + 16) = v11;
  *(unsigned char *)(a2 + 24) = v12;
  *(void *)(a2 + 32) = v13;
  *(unsigned char *)(a2 + 40) = v14;
  *(void *)(a2 + 48) = v15;
  *(void *)(a2 + 56) = v16;
  *(void *)(a2 + 64) = 0;
  *(double *)(a2 + 72) = round(a4 * 55.0 * 100.0) / -100.0;
  *(double *)(a2 + 80) = (double)v7 * 6.0 * 0.0174532925;
  *(void *)(a2 + 88) = v9;
  *(void *)(a2 + 96) = v10;
  return result;
}

uint64_t sub_1000065EC(uint64_t a1)
{
  uint64_t v2 = sub_100010EC0();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_100010F10();
}

uint64_t sub_1000066BC()
{
  return sub_100011160();
}

uint64_t sub_1000066D8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100010EC0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100003E74(&qword_1000181F8);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (uint64_t *)((char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  double v10 = *v1;
  unint64_t v11 = *((void *)v1 + 1);
  *uint64_t v9 = sub_100011260();
  v9[1] = v12;
  uint64_t v13 = sub_100003E74(&qword_100018200);
  v14.n128_u64[0] = v11;
  sub_100005F04((uint64_t)v9 + *(int *)(v13 + 44), v10, v14);
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for LayoutDirection.leftToRight(_:), v3);
  uint64_t v16 = (uint64_t *)(a1 + *(int *)(sub_100003E74(&qword_100018208) + 36));
  uint64_t v17 = sub_100003E74(&qword_100018210);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))((char *)v16 + *(int *)(v17 + 28), v6, v3);
  uint64_t *v16 = KeyPath;
  sub_100006F4C((uint64_t)v9, a1, &qword_1000181F8);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return sub_100006FB0((uint64_t)v9, &qword_1000181F8);
}

double sub_1000068C0@<D0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v17 = sub_100011190();
  sub_100010EA0();
  sub_100010EA0();
  sub_100011260();
  sub_100010E90();
  uint64_t v6 = sub_100011260();
  uint64_t v15 = v7;
  uint64_t v16 = v6;
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  long long v9 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(v8 + 24) = *(_OWORD *)a1;
  *(_OWORD *)(v8 + 40) = v9;
  *(_OWORD *)(v8 + 49) = *(_OWORD *)(a1 + 25);
  swift_retain();
  sub_100010EA0();
  double v10 = *(double *)(a1 + 16);
  double v12 = v11 * *(double *)(a1 + 8);
  sub_100010EA0();
  *(void *)a3 = v17;
  double result = v10 * v13;
  *(_WORD *)(a3 + 8) = 256;
  *(void *)(a3 + 16) = v18;
  *(unsigned char *)(a3 + 24) = v19;
  *(void *)(a3 + 32) = v20;
  *(unsigned char *)(a3 + 40) = v21;
  *(void *)(a3 + 48) = v22;
  *(void *)(a3 + 56) = v23;
  *(void *)(a3 + 64) = sub_100006C14;
  *(void *)(a3 + 72) = v8;
  *(void *)(a3 + 80) = v16;
  *(void *)(a3 + 88) = v15;
  *(double *)(a3 + 96) = v12;
  *(double *)(a3 + 104) = v10 * v13;
  return result;
}

uint64_t sub_100006A1C@<X0>(uint64_t a1@<X1>, uint64_t *a2@<X2>, uint64_t a3@<X8>)
{
  sub_100010EA0();
  double v7 = v6;
  swift_beginAccess();
  double v8 = v7 * *(double *)(a1 + 16);
  sub_100010EA0();
  if (v9 / 116.0 >= v8 / 116.0) {
    double v10 = v8 / 116.0;
  }
  else {
    double v10 = v9 / 116.0;
  }
  uint64_t v11 = *a2;
  sub_100010EA0();
  double v13 = v12 * 0.5;
  sub_100010EA0();
  double v15 = v14 * 0.5;
  uint64_t result = sub_100011280();
  *(void *)a3 = v11;
  *(void *)(a3 + 8) = 0x3FF0000000000000;
  *(double *)(a3 + 16) = v13;
  *(double *)(a3 + 24) = v15;
  *(double *)(a3 + 32) = v10;
  *(double *)(a3 + 40) = v10;
  *(void *)(a3 + 48) = v17;
  *(void *)(a3 + 56) = v18;
  return result;
}

__n128 sub_100006AE8@<Q0>(double (**a1)@<D0>(uint64_t a1@<X8>)@<X8>)
{
  int v3 = *(unsigned __int8 *)(v1 + 40);
  uint64_t v4 = swift_allocObject();
  uint64_t v5 = v4;
  double v6 = 0.85;
  if (!v3) {
    double v6 = 1.0;
  }
  *(double *)(v4 + 16) = v6;
  uint64_t v7 = swift_allocObject();
  __n128 result = *(__n128 *)v1;
  long long v9 = *(_OWORD *)(v1 + 16);
  *(_OWORD *)(v7 + 16) = *(_OWORD *)v1;
  *(_OWORD *)(v7 + 32) = v9;
  *(void *)(v7 + 48) = *(void *)(v1 + 32);
  *(unsigned char *)(v7 + 56) = v3;
  *(void *)(v7 + 64) = v5;
  *a1 = sub_100006BD0;
  a1[1] = (double (*)@<D0>(uint64_t@<X8>))v7;
  return result;
}

uint64_t sub_100006B88()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100006B98()
{
  swift_release();

  return _swift_deallocObject(v0, 72, 7);
}

double sub_100006BD0@<D0>(uint64_t a1@<X8>)
{
  return sub_1000068C0(v1 + 16, *(void *)(v1 + 64), a1);
}

uint64_t sub_100006BDC()
{
  swift_release();

  return _swift_deallocObject(v0, 65, 7);
}

uint64_t sub_100006C14@<X0>(uint64_t a1@<X8>)
{
  return sub_100006A1C(*(void *)(v1 + 16), (uint64_t *)(v1 + 24), a1);
}

ValueMetadata *type metadata accessor for ProgressView()
{
  return &type metadata for ProgressView;
}

uint64_t sub_100006C30()
{
  return sub_1000040E4(&qword_1000181E8, &qword_1000181F0);
}

uint64_t sub_100006C6C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100006C88()
{
  return sub_100010F00();
}

uint64_t sub_100006CB0()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t *sub_100006CC0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100006430(a1, a2, *(double *)(v2 + 16), *(double *)(v2 + 24));
}

unint64_t sub_100006CC8()
{
  unint64_t result = qword_100018238;
  if (!qword_100018238)
  {
    sub_100003CE0(&qword_100018228);
    sub_100006D44();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018238);
  }
  return result;
}

unint64_t sub_100006D44()
{
  unint64_t result = qword_100018240;
  if (!qword_100018240)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018240);
  }
  return result;
}

uint64_t sub_100006D98()
{
  return sub_100006DC8(&qword_100018250, &qword_100018258, (void (*)(void))sub_100006E44);
}

uint64_t sub_100006DC8(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100003CE0(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100006E44()
{
  unint64_t result = qword_100018260;
  if (!qword_100018260)
  {
    sub_100003CE0(&qword_100018268);
    sub_1000040E4(&qword_100018270, &qword_100018278);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018260);
  }
  return result;
}

uint64_t sub_100006EE4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003E74(&qword_100018220);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006F4C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100003E74(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100006FB0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100003E74(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_100007010()
{
  unint64_t result = qword_100018288;
  if (!qword_100018288)
  {
    sub_100003CE0(&qword_100018208);
    sub_1000040E4(&qword_100018290, &qword_1000181F8);
    sub_1000040E4(&qword_100018298, &qword_100018210);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018288);
  }
  return result;
}

uint64_t destroy for WristSelectionTrailingView()
{
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for WristSelectionTrailingView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for WristSelectionTrailingView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for WristSelectionTrailingView(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

void *assignWithTake for WristSelectionTrailingView(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for WristSelectionTrailingView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for WristSelectionTrailingView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for WristSelectionTrailingView()
{
  return &type metadata for WristSelectionTrailingView;
}

uint64_t sub_1000072B0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000072CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10 = sub_100011260();
  uint64_t v42 = v11;
  uint64_t v43 = v10;
  sub_100007564(a1, a2, (uint64_t)&v44);
  char v40 = v46;
  char v41 = v45;
  uint64_t v12 = v47;
  uint64_t v13 = v48;
  LOBYTE(a2) = v49;
  uint64_t v38 = *((void *)&v49 + 1);
  uint64_t v39 = v44;
  uint64_t v14 = v50;
  sub_100011260();
  sub_100010E90();
  char v15 = v52;
  uint64_t v36 = v53;
  uint64_t v37 = v51;
  char v16 = v54;
  uint64_t v34 = v56;
  uint64_t v35 = v55;
  uint64_t v17 = sub_100011260();
  uint64_t v32 = v18;
  uint64_t v33 = v17;
  sub_100007564(a3, a4, (uint64_t)&v44);
  char v30 = v46;
  char v31 = v45;
  uint64_t v19 = v47;
  uint64_t v20 = v48;
  char v21 = v49;
  uint64_t v28 = v44;
  uint64_t v29 = *((void *)&v49 + 1);
  uint64_t v22 = v50;
  sub_100011260();
  sub_100010E90();
  uint64_t v23 = v44;
  char v24 = v45;
  uint64_t v25 = v47;
  char v26 = v48;
  char v62 = a2;
  char v61 = v15;
  char v60 = v16;
  char v59 = v21;
  char v58 = v45;
  char v57 = v48;
  *(void *)a5 = v43;
  *(void *)(a5 + 8) = v42;
  *(void *)(a5 + 16) = v39;
  *(unsigned char *)(a5 + 24) = v41;
  *(unsigned char *)(a5 + 25) = v40;
  *(void *)(a5 + 32) = v12;
  *(void *)(a5 + 40) = v13;
  *(unsigned char *)(a5 + 48) = a2;
  *(void *)(a5 + 56) = v38;
  *(void *)(a5 + 64) = v14;
  *(void *)(a5 + 72) = v37;
  *(unsigned char *)(a5 + 80) = v15;
  *(void *)(a5 + 88) = v36;
  *(unsigned char *)(a5 + 96) = v16;
  *(void *)(a5 + 104) = v35;
  *(void *)(a5 + 112) = v34;
  *(void *)(a5 + 120) = v33;
  *(void *)(a5 + 128) = v32;
  *(void *)(a5 + 136) = v28;
  *(unsigned char *)(a5 + 144) = v31;
  *(unsigned char *)(a5 + 145) = v30;
  *(void *)(a5 + 152) = v19;
  *(void *)(a5 + 160) = v20;
  *(unsigned char *)(a5 + 168) = v21;
  *(void *)(a5 + 176) = v29;
  *(void *)(a5 + 184) = v22;
  *(void *)(a5 + 192) = v23;
  *(unsigned char *)(a5 + 200) = v24;
  *(void *)(a5 + 208) = v25;
  *(unsigned char *)(a5 + 216) = v26;
  *(_OWORD *)(a5 + 224) = v49;
  swift_retain();
  sub_1000078D0(v12, v13, a2);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1000078D0(v19, v20, v21);
  swift_bridgeObjectRetain();
  swift_release();
  sub_1000078E0(v19, v20, v21);
  swift_release();
  swift_bridgeObjectRelease();
  sub_1000078E0(v12, v13, a2);

  return swift_bridgeObjectRelease();
}

uint64_t sub_100007564@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_100003E74(&qword_1000182A0);
  __chkstk_darwin(v6 - 8);
  double v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_1000111B0();
  uint64_t v30 = a1;
  uint64_t v31 = a2;
  sub_1000078F0();
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_100011100();
  uint64_t v11 = v10;
  char v13 = v12 & 1;
  uint64_t v14 = sub_100011080();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v8, 1, 1, v14);
  sub_1000110A0();
  sub_100007944((uint64_t)v8);
  uint64_t v15 = sub_1000110E0();
  uint64_t v17 = v16;
  char v19 = v18;
  swift_release();
  sub_1000078E0(v9, v11, v13);
  swift_bridgeObjectRelease();
  sub_100011090();
  uint64_t v20 = sub_1000110C0();
  uint64_t v22 = v21;
  uint64_t v24 = v23;
  char v26 = v25 & 1;
  sub_1000078E0(v15, v17, v19 & 1);
  swift_bridgeObjectRelease();
  *(void *)a3 = v29;
  *(_WORD *)(a3 + 8) = 256;
  *(void *)(a3 + 16) = v20;
  *(void *)(a3 + 24) = v22;
  *(unsigned char *)(a3 + 32) = v26;
  *(void *)(a3 + 40) = v24;
  *(void *)(a3 + 48) = 0x3FE0000000000000;
  swift_retain();
  sub_1000078D0(v20, v22, v26);
  swift_bridgeObjectRetain();
  sub_1000078E0(v20, v22, v26);
  swift_release();
  return swift_bridgeObjectRelease();
}

double sub_100007790@<D0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *v1;
  uint64_t v4 = v1[1];
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = sub_100010FA0();
  sub_1000072CC(v3, v4, v5, v6, (uint64_t)v16);
  *(_OWORD *)&v17[183] = v16[11];
  *(_OWORD *)&v17[199] = v16[12];
  *(_OWORD *)&v17[215] = v16[13];
  *(_OWORD *)&v17[231] = v16[14];
  *(_OWORD *)&v17[119] = v16[7];
  *(_OWORD *)&v17[135] = v16[8];
  *(_OWORD *)&v17[151] = v16[9];
  *(_OWORD *)&v17[167] = v16[10];
  *(_OWORD *)&v17[55] = v16[3];
  *(_OWORD *)&v17[71] = v16[4];
  *(_OWORD *)&v17[87] = v16[5];
  *(_OWORD *)&v17[103] = v16[6];
  *(_OWORD *)&v17[7] = v16[0];
  *(_OWORD *)&v17[23] = v16[1];
  *(_OWORD *)&v17[39] = v16[2];
  long long v8 = *(_OWORD *)&v17[208];
  *(_OWORD *)(a1 + 209) = *(_OWORD *)&v17[192];
  *(_OWORD *)(a1 + 225) = v8;
  *(_OWORD *)(a1 + 241) = *(_OWORD *)&v17[224];
  long long v9 = *(_OWORD *)&v17[144];
  *(_OWORD *)(a1 + 145) = *(_OWORD *)&v17[128];
  *(_OWORD *)(a1 + 161) = v9;
  long long v10 = *(_OWORD *)&v17[176];
  *(_OWORD *)(a1 + 177) = *(_OWORD *)&v17[160];
  *(_OWORD *)(a1 + 193) = v10;
  long long v11 = *(_OWORD *)&v17[80];
  *(_OWORD *)(a1 + 81) = *(_OWORD *)&v17[64];
  *(_OWORD *)(a1 + 97) = v11;
  long long v12 = *(_OWORD *)&v17[112];
  *(_OWORD *)(a1 + 113) = *(_OWORD *)&v17[96];
  *(_OWORD *)(a1 + 129) = v12;
  long long v13 = *(_OWORD *)&v17[16];
  *(_OWORD *)(a1 + 17) = *(_OWORD *)v17;
  *(_OWORD *)(a1 + 33) = v13;
  double result = *(double *)&v17[32];
  long long v15 = *(_OWORD *)&v17[48];
  *(_OWORD *)(a1 + 49) = *(_OWORD *)&v17[32];
  *(void *)a1 = v7;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(void *)(a1 + 256) = *(void *)&v17[239];
  *(_OWORD *)(a1 + 65) = v15;
  return result;
}

uint64_t sub_1000078D0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_1000078E0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

unint64_t sub_1000078F0()
{
  unint64_t result = qword_1000182A8;
  if (!qword_1000182A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000182A8);
  }
  return result;
}

uint64_t sub_100007944(uint64_t a1)
{
  uint64_t v2 = sub_100003E74(&qword_1000182A0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1000079A8()
{
  unint64_t result = qword_1000182B0;
  if (!qword_1000182B0)
  {
    sub_100003CE0(&qword_1000182B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000182B0);
  }
  return result;
}

ValueMetadata *type metadata accessor for SetupLiveActivityConfiguration()
{
  return &type metadata for SetupLiveActivityConfiguration;
}

uint64_t sub_100007A14()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100007A30(void *__src)
{
  memcpy(__dst, __src, 0x1B2uLL);
  memcpy(v3, __src, sizeof(v3));
  sub_100005934((uint64_t)__dst);
  sub_100004668();
  return sub_100010F90();
}

uint64_t sub_100007AA8(uint64_t a1)
{
  __chkstk_darwin(a1);
  uint64_t v14 = v1;
  uint64_t v2 = sub_100003E74(&qword_1000182D0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v15[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21[0] = swift_getKeyPath();
  sub_100008EE4((uint64_t)v21);
  sub_10000FA08((uint64_t)v21, (uint64_t)v22, &qword_100018358);
  memcpy(v25, v22, 0x1B3uLL);
  sub_100011260();
  sub_100010E90();
  uint64_t v6 = v15[117];
  uint64_t v7 = v17;
  uint64_t v8 = v19;
  uint64_t v9 = v20;
  char v24 = v16;
  char v23 = v18;
  sub_100003E74(&qword_100018310);
  sub_1000113B0();
  memcpy(&v27[7], v26, 0x1AAuLL);
  uint64_t KeyPath = swift_getKeyPath();
  memcpy(v28, v25, 0x1B8uLL);
  v28[55] = v6;
  LOBYTE(v28[56]) = v24;
  v28[57] = v7;
  LOBYTE(v28[58]) = v23;
  v28[59] = v8;
  v28[60] = v9;
  v28[61] = KeyPath;
  LOBYTE(v28[62]) = 3;
  memcpy((char *)&v28[62] + 1, v27, 0x1B1uLL);
  memcpy(v15, v28, 0x3A2uLL);
  sub_100011180();
  uint64_t v11 = sub_100003E74(&qword_1000182D8);
  uint64_t v12 = sub_100008D88(&qword_1000182E0, &qword_1000182D8, (void (*)(void))sub_1000089E4);
  sub_100011120();
  swift_release();
  sub_10000C4D0((uint64_t)v28);
  sub_1000111A0();
  v15[0] = v11;
  v15[1] = v12;
  swift_getOpaqueTypeConformance2();
  sub_100011130();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_100007D74@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v22 = a1;
  uint64_t v26 = a2;
  uint64_t v3 = sub_100003E74(&qword_100018310);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  uint64_t v6 = __chkstk_darwin(v3);
  char v24 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v21 - v8;
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v21 - v10;
  uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  v12((char *)&v21 - v10, a1, v3);
  unint64_t v13 = (*(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v25 = swift_allocObject();
  uint64_t v14 = *(void (**)(unint64_t, char *, uint64_t))(v4 + 32);
  v14(v25 + v13, v11, v3);
  uint64_t v15 = v22;
  v12(v9, v22, v3);
  uint64_t v23 = swift_allocObject();
  v14(v23 + v13, v9, v3);
  char v16 = v24;
  v12(v24, v15, v3);
  uint64_t v17 = swift_allocObject();
  v14(v17 + v13, v16, v3);
  sub_100003E74(&qword_100018318);
  sub_100003E74(&qword_100018320);
  uint64_t v18 = sub_100003CE0(&qword_100018328);
  unint64_t v19 = sub_100008C04();
  uint64_t v27 = v18;
  unint64_t v28 = v19;
  swift_getOpaqueTypeConformance2();
  sub_100008D88(&qword_100018348, &qword_100018320, (void (*)(void))sub_100008E2C);
  return sub_100011390();
}

uint64_t sub_100008094(uint64_t a1)
{
  uint64_t v2 = sub_100011410();
  __chkstk_darwin(v2 - 8);
  uint64_t v3 = sub_100003E74(&qword_100018360);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v10[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_100011400();
  uint64_t v12 = a1;
  uint64_t v7 = sub_100003E74(&qword_100018328);
  unint64_t v8 = sub_100008C04();
  sub_1000113E0();
  uint64_t v11 = v6;
  sub_100003E74(&qword_100018318);
  uint64_t v13 = v7;
  unint64_t v14 = v8;
  swift_getOpaqueTypeConformance2();
  sub_1000113F0();
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_100008264@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v14 = a1;
  uint64_t v3 = sub_100011430();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v15[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  uint64_t v7 = sub_100003E74(&qword_100018368);
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = &v15[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v17[0] = swift_getKeyPath();
  sub_100008EE4((uint64_t)v17);
  sub_10000FA08((uint64_t)v17, (uint64_t)v18, &qword_100018358);
  memcpy(v16, v18, sizeof(v16));
  sub_100011260();
  sub_10000859C(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, (uint64_t)v19, 0.0, 1, 40.0, 0);
  swift_release();
  memcpy(v15, v19, sizeof(v15));
  sub_100011420();
  sub_100003E74(&qword_100018338);
  sub_100008D0C(&qword_100018340, &qword_100018338, (void (*)(void))sub_100008A14);
  sub_100011110();
  (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
  memcpy(v20, v15, sizeof(v20));
  sub_1000109A8((uint64_t)v20, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000BE48);
  uint64_t KeyPath = swift_getKeyPath();
  sub_100003E74(&qword_100018310);
  sub_1000113B0();
  memcpy(&v15[7], v21, 0x1AAuLL);
  (*(void (**)(uint64_t, unsigned char *, uint64_t))(v8 + 16))(a2, v10, v7);
  uint64_t v12 = a2 + *(int *)(sub_100003E74(&qword_100018328) + 36);
  *(void *)uint64_t v12 = KeyPath;
  *(unsigned char *)(v12 + 8) = 2;
  memcpy((void *)(v12 + 9), v15, 0x1B1uLL);
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_10000859C@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  uint64_t v14 = v13;
  uint64_t v15 = a9;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_100011470();
    char v24 = (void *)sub_100011030();
    sub_100010E10();

    uint64_t v15 = a9;
  }
  sub_100010ED0();
  memcpy((void *)v15, v14, 0x1B3uLL);
  *(_OWORD *)(v15 + 504) = v31;
  *(_OWORD *)(v15 + 520) = v32;
  *(_OWORD *)(v15 + 536) = v33;
  *(_OWORD *)(v15 + 440) = v27;
  *(_OWORD *)(v15 + 456) = v28;
  *(_OWORD *)(v15 + 472) = v29;
  *(_OWORD *)(v15 + 488) = v30;
  return sub_1000109A8((uint64_t)v14, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000C204);
}

void *sub_100008768@<X0>(char a1@<W1>, uint64_t a2@<X8>)
{
  v6[0] = swift_getKeyPath();
  sub_100008EE4((uint64_t)v6);
  sub_10000FA08((uint64_t)v6, (uint64_t)__src, &qword_100018358);
  memcpy(__dst, __src, sizeof(__dst));
  sub_100003E74(&qword_100018310);
  sub_1000113B0();
  memcpy(&v9[7], v8, 0x1AAuLL);
  uint64_t KeyPath = swift_getKeyPath();
  memcpy((void *)a2, __dst, 0x1B3uLL);
  *(unsigned char *)(a2 + 435) = 1;
  *(void *)(a2 + 440) = KeyPath;
  *(unsigned char *)(a2 + 448) = a1;
  return memcpy((void *)(a2 + 449), v9, 0x1B1uLL);
}

uint64_t sub_10000884C()
{
  return sub_1000113C0();
}

unint64_t sub_10000898C()
{
  unint64_t result = qword_1000182C8;
  if (!qword_1000182C8)
  {
    sub_100010D90();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000182C8);
  }
  return result;
}

uint64_t sub_1000089E4()
{
  return sub_100008D0C(&qword_1000182E8, &qword_1000182F0, (void (*)(void))sub_100008A14);
}

unint64_t sub_100008A14()
{
  unint64_t result = qword_1000182F8;
  if (!qword_1000182F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000182F8);
  }
  return result;
}

uint64_t sub_100008A6C()
{
  uint64_t v1 = *(void *)(sub_100003E74(&qword_100018310) - 8);
  uint64_t v2 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_100008094(v2);
}

void *sub_100008AE4@<X0>(uint64_t a1@<X8>)
{
  return sub_100008B8C(0, a1);
}

uint64_t sub_100008AF0()
{
  uint64_t v1 = sub_100003E74(&qword_100018310);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

void *sub_100008B84@<X0>(uint64_t a1@<X8>)
{
  return sub_100008B8C(1, a1);
}

void *sub_100008B8C@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  return sub_100008768(a1, a2);
}

unint64_t sub_100008C04()
{
  unint64_t result = qword_100018330;
  if (!qword_100018330)
  {
    sub_100003CE0(&qword_100018328);
    sub_100003CE0(&qword_100018338);
    sub_100008D0C(&qword_100018340, &qword_100018338, (void (*)(void))sub_100008A14);
    swift_getOpaqueTypeConformance2();
    sub_1000040E4(&qword_100018300, &qword_100018308);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018330);
  }
  return result;
}

uint64_t sub_100008D0C(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100003CE0(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100008D88(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100003CE0(a2);
    a3();
    sub_1000040E4(&qword_100018300, &qword_100018308);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100008E2C()
{
  unint64_t result = qword_100018350;
  if (!qword_100018350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018350);
  }
  return result;
}

void *sub_100008E80@<X0>(void *a1@<X8>)
{
  sub_100004668();
  sub_100010F80();
  return memcpy(a1, __src, 0x1B2uLL);
}

uint64_t sub_100008EE4(uint64_t result)
{
  *(unsigned char *)(result + 434) = 0;
  return result;
}

uint64_t sub_100008EEC@<X0>(uint64_t a1@<X8>)
{
  return sub_100008264(*(void *)(v1 + 16), a1);
}

uint64_t sub_100008EF4(uint64_t a1)
{
  __chkstk_darwin(a1);
  unint64_t v19 = v2;
  uint64_t v3 = sub_100003E74(&qword_100018380);
  uint64_t v4 = v3 - 8;
  __chkstk_darwin(v3);
  uint64_t v6 = (uint64_t *)((char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = sub_100010E60();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100010FA0();
  sub_100009148(v1);
  v21[1544] = 0;
  memcpy(&v21[7], v20, 0x5FAuLL);
  uint64_t v12 = sub_100011180();
  char v13 = sub_100011040();
  v22[0] = v11;
  v22[1] = 0;
  LOBYTE(v22[2]) = 0;
  memcpy((char *)&v22[2] + 1, v21, 0x601uLL);
  v22[195] = v12;
  LOBYTE(v22[196]) = v13;
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for ColorScheme.dark(_:), v7);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))((char *)v6 + *(int *)(v4 + 36), v10, v7);
  *uint64_t v6 = KeyPath;
  uint64_t v15 = sub_100003E74(&qword_100018388);
  char v16 = v19;
  sub_10000D3E8((uint64_t)v6, (uint64_t)v19 + *(int *)(v15 + 36));
  memcpy(v16, v22, 0x621uLL);
  sub_10000D450((uint64_t)v22);
  sub_10000DE34((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return sub_10000DE94((uint64_t)v22);
}

uint64_t sub_100009148(uint64_t a1)
{
  uint64_t v1 = (const void *)__chkstk_darwin(a1);
  long long v27 = v2;
  v47[0] = swift_getKeyPath();
  sub_100008EE4((uint64_t)v47);
  sub_10000FA08((uint64_t)v47, (uint64_t)__src, &qword_100018358);
  memcpy(__dst, __src, sizeof(__dst));
  memcpy(v46, v1, sizeof(v46));
  sub_1000109A8((uint64_t)v1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000C204);
  sub_10000BB38(v62);
  sub_1000109A8((uint64_t)v1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000BE48);
  memcpy(v49, v62, 0x1B2uLL);
  sub_10000E878((uint64_t)v49);
  sub_100010E00();
  sub_100011260();
  sub_100010E90();
  uint64_t v22 = v36;
  uint64_t v28 = v38;
  uint64_t v29 = v39;
  uint64_t v30 = v34;
  char v51 = v35;
  char v50 = v37;
  v52[0] = swift_getKeyPath();
  sub_100008EE4((uint64_t)v52);
  sub_10000FA08((uint64_t)v52, (uint64_t)v53, &qword_100018358);
  memcpy(v32, v53, 0x1B3uLL);
  char v3 = sub_100011050();
  sub_100010E50();
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  char v54 = 0;
  sub_100011270();
  uint64_t v12 = sub_100010E90();
  uint64_t v13 = v40;
  uint64_t v24 = v40;
  uint64_t v21 = v42;
  uint64_t v14 = v44;
  uint64_t v15 = v45;
  char v16 = v54;
  char v23 = v54;
  char v56 = v41;
  char v55 = v43;
  sub_100009618(v12);
  char v25 = v50;
  char v26 = v51;
  char v17 = v56;
  char v18 = v55;
  memcpy(v57, __dst, 0x1B3uLL);
  BYTE3(v57[54]) = 1;
  LOBYTE(v57[56]) = v51;
  v57[55] = v30;
  v57[57] = v22;
  LOBYTE(v57[58]) = v50;
  v57[59] = v28;
  v57[60] = v29;
  memcpy(v58, v32, 0x1B8uLL);
  LOBYTE(v58[55]) = v3;
  v58[56] = v5;
  v58[57] = v7;
  v58[58] = v9;
  v58[59] = v11;
  LOBYTE(v58[60]) = v16;
  LOBYTE(v58[62]) = v56;
  v58[61] = v13;
  v58[63] = v21;
  LOBYTE(v58[64]) = v55;
  v58[65] = v14;
  v58[66] = v15;
  memcpy(v59, v31, 0x1EAuLL);
  memcpy(v62, v57, 0x1E8uLL);
  memcpy(&v62[488], v58, 0x218uLL);
  char v61 = 0;
  memcpy(&v60[7], v31, 0x1EAuLL);
  memcpy(v27, v62, 0x400uLL);
  char v19 = v61;
  *((void *)v27 + 128) = 0x4024000000000000;
  v27[1032] = v19;
  memcpy(v27 + 1033, v60, 0x1F1uLL);
  memcpy(v63, v31, 0x1EAuLL);
  sub_1000109A8((uint64_t)v57, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000C204);
  sub_1000109A8((uint64_t)v58, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000C204);
  sub_10000EAE4((uint64_t)v59, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, _WORD))sub_10000D8C0);
  sub_10000EAE4((uint64_t)v63, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, _WORD))sub_10000E304);
  memcpy(v64, v32, 0x1B8uLL);
  v64[440] = v3;
  uint64_t v65 = v5;
  uint64_t v66 = v7;
  uint64_t v67 = v9;
  uint64_t v68 = v11;
  char v69 = v23;
  char v71 = v17;
  uint64_t v70 = v24;
  uint64_t v72 = v21;
  char v73 = v18;
  uint64_t v74 = v14;
  uint64_t v75 = v15;
  sub_1000109A8((uint64_t)v64, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000BE48);
  memcpy(v76, __dst, 0x1B3uLL);
  v76[435] = 1;
  char v78 = v26;
  uint64_t v77 = v30;
  uint64_t v79 = v22;
  char v80 = v25;
  uint64_t v81 = v28;
  uint64_t v82 = v29;
  return sub_1000109A8((uint64_t)v76, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000BE48);
}

void *sub_100009618(uint64_t a1)
{
  __chkstk_darwin(a1);
  uint64_t v2 = (uint64_t)v1;
  uint64_t v4 = v3;
  memcpy(__dst, v1, sizeof(__dst));
  sub_1000109A8((uint64_t)v1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000C204);
  sub_10000BB38(v48);
  sub_1000109A8((uint64_t)v1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000BE48);
  memcpy(v49, &v48[8], 0x1AAuLL);
  uint64_t v5 = v49[48];
  uint64_t v6 = v49[49];
  uint64_t v7 = v49[50];
  uint64_t v8 = v49[51];
  int v9 = LOBYTE(v49[53]) >> 6;
  sub_100004760(v49[48], v49[49], v49[50], v49[51], v49[52], v49[53]);
  sub_10000EBB8((uint64_t)v49);
  if (!v9)
  {
    sub_1000109A8(v2, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000C204);
    sub_10000BB38(v48);
    sub_1000109A8(v2, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000BE48);
    memcpy(v31, v48, 0x1B2uLL);
    sub_10000E878((uint64_t)v31);
    uint64_t v22 = 8 * SLOBYTE(v31[0]);
    uint64_t v23 = *(void *)((char *)&unk_100011F58 + v22);
    uint64_t v24 = *(void *)((char *)&unk_100011F78 + v22);
    uint64_t v25 = *(void *)((char *)&unk_100011F98 + v22);
    char v26 = sub_100011040();
    *(void *)long long v33 = v5;
    *(void *)&v33[8] = v6;
    *(void *)&v33[16] = v7;
    *(void *)&v33[24] = v8;
    v33[32] = v26;
    *(void *)&v33[40] = v23;
    *(void *)&v33[48] = v23;
    *(void *)&v33[56] = v24;
    *(void *)&v33[64] = v25;
    v33[72] = 0;
    sub_10000F0A0((uint64_t)v33);
    sub_10000FA08((uint64_t)v33, (uint64_t)v48, &qword_100018408);
    sub_100003E74(&qword_1000183B8);
    sub_100003E74(&qword_1000183C8);
    sub_100008D0C(&qword_1000183B0, &qword_1000183B8, (void (*)(void))sub_100008E2C);
    sub_100008D0C(&qword_1000183C0, &qword_1000183C8, (void (*)(void))sub_10000EF28);
    sub_100011010();
    memcpy(v41, __src, 0x1E9uLL);
    sub_10000F0AC((uint64_t)v41);
    sub_10000FA08((uint64_t)v41, (uint64_t)v40, &qword_100018398);
    sub_100003E74(&qword_1000183A0);
    sub_100003E74(&qword_100018390);
    sub_10000EE54();
    sub_10000EF7C();
LABEL_9:
    sub_100011010();
    return memcpy(v4, v48, 0x1EAuLL);
  }
  if (v9 == 1)
  {
    sub_1000109A8(v2, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000C204);
    sub_10000BB38(v48);
    sub_1000109A8(v2, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000BE48);
    memcpy(v33, v48, 0x1B2uLL);
    sub_10000E878((uint64_t)v33);
    if (v33[0] == 2)
    {
      sub_1000109A8(v2, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000C204);
      sub_10000BB38(v48);
      sub_1000109A8(v2, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000BE48);
      memcpy(v40, v48, 0x1B2uLL);
      sub_10000E878((uint64_t)v40);
      sub_100010E00();
      sub_1000109A8(v2, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000C204);
      sub_10000BB38(v48);
      sub_1000109A8(v2, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000BE48);
      memcpy(v41, v48, 0x1B2uLL);
      sub_10000E878((uint64_t)v41);
      sub_100010E00();
      sub_100011260();
      sub_100010E90();
      sub_1000109A8(v2, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000C204);
      sub_10000BB38(__src);
      sub_1000109A8(v2, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000BE48);
      memcpy(v48, __src, 0x1B2uLL);
      sub_10000E878((uint64_t)v48);
      uint64_t v10 = 8 * v48[0];
      uint64_t v11 = *(void *)((char *)&unk_100011F58 + v10);
      uint64_t v12 = *(void *)((char *)&unk_100011F78 + v10);
      uint64_t v13 = *(void *)((char *)&unk_100011F98 + v10);
      char v14 = sub_100011040();
      LOBYTE(v42) = 0;
      v31[0] = v5;
      __asm { FMOV            V0.2D, #0.5 }
      *(_OWORD *)&v31[1] = _Q0;
      __asm { FMOV            V0.2D, #1.0 }
      *(_OWORD *)&v31[3] = _Q0;
      LOBYTE(v31[5]) = 0;
      v31[6] = v29[0];
      LOBYTE(v31[7]) = v29[1];
      v31[8] = v29[2];
      LOBYTE(v31[9]) = v29[3];
      v31[10] = v29[4];
      v31[11] = v29[5];
      LOBYTE(v31[12]) = v14;
      v31[13] = v11;
      v31[14] = v11;
      v31[15] = v12;
      v31[16] = v13;
      LOBYTE(v31[17]) = 0;
      nullsub_1(v31);
      uint64_t v21 = v31;
    }
    else
    {
      sub_10000EE24((uint64_t)v48);
      uint64_t v21 = v48;
    }
    sub_10000FA08((uint64_t)v21, (uint64_t)__src, &qword_100018390);
    sub_10000FA08((uint64_t)__src, (uint64_t)v41, &qword_100018390);
    sub_10000EE48((uint64_t)v41);
    sub_10000FA08((uint64_t)v41, (uint64_t)v40, &qword_100018398);
    sub_100003E74(&qword_1000183A0);
    sub_100003E74(&qword_100018390);
    sub_10000EE54();
    sub_10000EF7C();
    goto LABEL_9;
  }
  v28[0] = swift_getKeyPath();
  sub_100008EE4((uint64_t)v28);
  sub_10000FA08((uint64_t)v28, (uint64_t)v29, &qword_100018358);
  memcpy(v31, v29, 0x1B3uLL);
  sub_1000109A8(v2, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000C204);
  sub_10000BB38(v48);
  sub_1000109A8(v2, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000BE48);
  memcpy(v30, v48, 0x1B2uLL);
  sub_10000E878((uint64_t)v30);
  sub_100010E00();
  sub_100011260();
  sub_100010E90();
  v30[448] = v43;
  v30[440] = v45;
  memcpy(v33, v31, sizeof(v33));
  char v34 = 0;
  uint64_t v35 = v42;
  char v36 = v43;
  uint64_t v37 = v44;
  char v38 = v45;
  long long v39 = v46;
  sub_10000F0B4((uint64_t)v33);
  sub_10000FA08((uint64_t)v33, (uint64_t)v48, &qword_100018408);
  sub_1000109A8((uint64_t)v29, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000C204);
  sub_100003E74(&qword_1000183B8);
  sub_100003E74(&qword_1000183C8);
  sub_100008D0C(&qword_1000183B0, &qword_1000183B8, (void (*)(void))sub_100008E2C);
  sub_100008D0C(&qword_1000183C0, &qword_1000183C8, (void (*)(void))sub_10000EF28);
  sub_100011010();
  memcpy(v41, __src, 0x1E9uLL);
  sub_10000F0AC((uint64_t)v41);
  sub_10000FA08((uint64_t)v41, (uint64_t)v48, &qword_100018398);
  sub_100003E74(&qword_1000183A0);
  sub_100003E74(&qword_100018390);
  sub_10000EE54();
  sub_10000EF7C();
  sub_100011010();
  swift_release();
  memcpy(v48, v40, 0x1EAuLL);
  return memcpy(v4, v48, 0x1EAuLL);
}

uint64_t sub_100009EFC(uint64_t a1)
{
  uint64_t v2 = sub_100010E60();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_100010EF0();
}

uint64_t sub_100009FC4()
{
  uint64_t v1 = memcpy(__dst, v0, sizeof(__dst));
  return sub_100008EF4((uint64_t)v1);
}

double sub_10000A010@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  if ((v1[435] & 1) == 0)
  {
    memcpy(__dst, v1, sizeof(__dst));
    sub_1000109A8((uint64_t)v1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000C204);
    sub_10000BB38(&v23);
    memcpy(v32, (char *)v25 + 8, sizeof(v32));
    sub_10000F7CC((uint64_t)v25 + 8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_100004700, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_100005BB0, (void (*)(void))sub_100004700, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_100005BB0);
    sub_10000E878((uint64_t)&v23);
    sub_1000109A8((uint64_t)v1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000C204);
    sub_10000BB38(__src);
    sub_1000109A8((uint64_t)v1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000BE48);
    memcpy(v26, __src, sizeof(v26));
    sub_10000E878((uint64_t)v26);
    sub_100010DF0();
    sub_10000F7CC((uint64_t)v25 + 8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1000048C0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_10000C158, (void (*)(void))sub_1000048C0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_10000C158);
    sub_10000FA08((uint64_t)&v28, (uint64_t)v29, &qword_100018418);
    sub_10000FA6C((uint64_t)v29, (void (*)(void, void, void, void, void))sub_100005BB0);
    sub_10000F99C((uint64_t)v27);
    sub_10000FA08((uint64_t)v29, (uint64_t)v33, &qword_100018418);
    if (v33[32] == 255)
    {
      uint64_t v4 = 0;
    }
    else
    {
      sub_100005C3C((uint64_t)v33, (uint64_t)v34);
      sub_100005C3C((uint64_t)v34, (uint64_t)v31);
      uint64_t v4 = sub_10000B29C();
      sub_10000FA6C((uint64_t)v29, (void (*)(void, void, void, void, void))sub_10000C158);
    }
    sub_1000109A8((uint64_t)v1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000BE48);
    sub_1000109A8((uint64_t)v1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000C204);
    sub_10000BB38(v21);
    sub_1000109A8((uint64_t)v1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000BE48);
    memcpy(__src, v21, 0x1B2uLL);
    sub_10000E878((uint64_t)__src);
    if (__src[0] < 2u)
    {
LABEL_11:
      double v6 = 4.0;
      double v7 = 4.0;
      double v5 = 4.0;
      goto LABEL_15;
    }
    if (__src[0] != 2)
    {
      double v5 = 10.0;
      double v6 = 0.0;
      double v7 = 0.0;
      goto LABEL_15;
    }
LABEL_14:
    double v7 = 20.0;
    double v6 = 0.0;
    double v5 = 0.0;
    goto LABEL_15;
  }
  memcpy(__dst, v1, sizeof(__dst));
  sub_1000109A8((uint64_t)v1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000C204);
  sub_10000BB38(&v23);
  memcpy(v32, (char *)v25 + 8, sizeof(v32));
  sub_10000F7CC((uint64_t)v25 + 8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_100004700, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_100005BB0, (void (*)(void))sub_100004700, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_100005BB0);
  sub_10000E878((uint64_t)&v23);
  sub_1000109A8((uint64_t)v1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000C204);
  sub_10000BB38(__src);
  sub_1000109A8((uint64_t)v1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000BE48);
  memcpy(v26, __src, sizeof(v26));
  sub_10000E878((uint64_t)v26);
  sub_100010DF0();
  sub_10000F7CC((uint64_t)v25 + 8, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_1000048C0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))sub_10000C158, (void (*)(void))sub_1000048C0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_10000C158);
  sub_100005C3C((uint64_t)v27, (uint64_t)v34);
  sub_10000FA6C((uint64_t)v34, (void (*)(void, void, void, void, void))sub_100004700);
  sub_10000F99C((uint64_t)v27);
  uint64_t v4 = sub_10000B29C();
  sub_10000FA6C((uint64_t)v34, (void (*)(void, void, void, void, void))sub_1000048C0);
  if (!v4)
  {
    sub_100010D60();
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_100011200();
  }
  sub_1000109A8((uint64_t)v1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000BE48);
  sub_1000109A8((uint64_t)v1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000C204);
  sub_10000BB38(v21);
  sub_1000109A8((uint64_t)v1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000BE48);
  memcpy(__src, v21, 0x1B2uLL);
  sub_10000E878((uint64_t)__src);
  if (__src[0] < 2u) {
    goto LABEL_11;
  }
  if (__src[0] == 2) {
    goto LABEL_14;
  }
  double v5 = 0.0;
  double v6 = 20.0;
  double v7 = 20.0;
LABEL_15:
  uint64_t v8 = sub_100010FC0();
  sub_10000A680(v4, v2, (uint64_t)v26, v6, v6, v7, v5);
  sub_10000FA08((uint64_t)v26, (uint64_t)__src, &qword_100018420);
  long long v23 = (unint64_t)v8;
  LOBYTE(v24[0]) = 1;
  sub_10000FA08((uint64_t)__src, (uint64_t)v24 + 8, &qword_100018420);
  *(_OWORD *)&v26[96] = v25[2];
  *(_OWORD *)&v26[112] = v25[3];
  *(_OWORD *)&v26[128] = v25[4];
  *(_OWORD *)&v26[137] = *(_OWORD *)((char *)&v25[4] + 9);
  *(_OWORD *)&v26[32] = v24[1];
  *(_OWORD *)&v26[48] = v24[2];
  *(_OWORD *)&v26[64] = v25[0];
  *(_OWORD *)&v26[80] = v25[1];
  *(_OWORD *)char v26 = v23;
  *(_OWORD *)&v26[16] = v24[0];
  sub_100011260();
  sub_100010E90();
  uint64_t v9 = v21[0];
  char v10 = v21[1];
  uint64_t v11 = v21[2];
  char v12 = v21[3];
  uint64_t v13 = v21[4];
  uint64_t v14 = v21[5];
  swift_release();
  long long v15 = *(_OWORD *)&v26[112];
  *(_OWORD *)(a1 + 96) = *(_OWORD *)&v26[96];
  *(_OWORD *)(a1 + 112) = v15;
  long long v16 = *(_OWORD *)&v26[144];
  *(_OWORD *)(a1 + 128) = *(_OWORD *)&v26[128];
  *(_OWORD *)(a1 + 144) = v16;
  long long v17 = *(_OWORD *)&v26[48];
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v26[32];
  *(_OWORD *)(a1 + 48) = v17;
  long long v18 = *(_OWORD *)&v26[80];
  *(_OWORD *)(a1 + 64) = *(_OWORD *)&v26[64];
  *(_OWORD *)(a1 + 80) = v18;
  double result = *(double *)v26;
  long long v20 = *(_OWORD *)&v26[16];
  *(_OWORD *)a1 = *(_OWORD *)v26;
  *(_OWORD *)(a1 + 16) = v20;
  *(void *)(a1 + 160) = v9;
  *(unsigned char *)(a1 + 168) = v10;
  *(void *)(a1 + 176) = v11;
  *(unsigned char *)(a1 + 184) = v12;
  *(void *)(a1 + 192) = v13;
  *(void *)(a1 + 200) = v14;
  return result;
}

uint64_t sub_10000A680@<X0>(uint64_t a1@<X0>, const void *a2@<X1>, uint64_t a3@<X8>, double a4@<D0>, double a5@<D1>, double a6@<D2>, double a7@<D3>)
{
  uint64_t v14 = sub_100011210();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  long long v17 = (char *)&v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    (*(void (**)(char *, void, uint64_t))(v15 + 104))(v17, enum case for Image.ResizingMode.stretch(_:), v14);
    uint64_t v18 = sub_100011220();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
    uint64_t v19 = sub_100011260();
    uint64_t v21 = v20;
    memcpy(v41, a2, 0x1B3uLL);
    sub_1000109A8((uint64_t)a2, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000C204);
    sub_10000BB38(v39);
    sub_1000109A8((uint64_t)a2, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000BE48);
    memcpy(v40, v39, 0x1B2uLL);
    sub_10000E878((uint64_t)v40);
    uint64_t v35 = a3;
    uint64_t v22 = v21;
    uint64_t v23 = v19;
    uint64_t v24 = v18;
    if (v40[0] == 3)
    {
      sub_1000109A8((uint64_t)a2, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000C204);
      sub_10000BB38(v39);
      sub_1000109A8((uint64_t)a2, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000BE48);
      memcpy(v36, &v39[8], 0x1AAuLL);
      uint64_t v25 = v36[48];
      uint64_t v26 = v36[49];
      uint64_t v27 = v36[50];
      uint64_t v28 = v36[51];
      uint64_t v29 = v36[52];
      unsigned __int8 v30 = v36[53];
      sub_100004760(v36[48], v36[49], v36[50], v36[51], v36[52], v36[53]);
      sub_10000EBB8((uint64_t)v36);
      if ((v30 & 0xC0) == 0x40)
      {
        char v31 = v30 & 0x3F;
LABEL_8:
        char v32 = sub_100011040();
        char v38 = 1;
        char v37 = 0;
        v36[0] = v24;
        v36[1] = v25;
        v36[2] = v26;
        v36[3] = v27;
        v36[4] = v28;
        v36[5] = v29;
        LOBYTE(v36[6]) = v31;
        v36[7] = v23;
        v36[8] = v22;
        v36[9] = 0;
        LOWORD(v36[10]) = 1;
        LOBYTE(v36[11]) = v32;
        *(double *)&v36[12] = a4;
        *(double *)&v36[13] = a5;
        *(double *)&v36[14] = a6;
        *(double *)&v36[15] = a7;
        LOBYTE(v36[16]) = 0;
        nullsub_1(v36);
        sub_10000FA08((uint64_t)v36, (uint64_t)v39, &qword_100018420);
        a3 = v35;
        return sub_10000FA08((uint64_t)v39, a3, &qword_100018420);
      }
      sub_100004920(v25, v26, v27, v28, v29, v30);
    }
    uint64_t v25 = 0;
    uint64_t v26 = 0;
    uint64_t v27 = 0;
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    char v31 = 3;
    goto LABEL_8;
  }
  sub_10000FB5C((uint64_t)v41);
  sub_10000FA08((uint64_t)v41, (uint64_t)v39, &qword_100018420);
  return sub_10000FA08((uint64_t)v39, a3, &qword_100018420);
}

double sub_10000A9C8@<D0>(uint64_t a1@<X8>)
{
  memcpy(__dst, v1, sizeof(__dst));
  return sub_10000A010(a1);
}

uint64_t sub_10000AA14@<X0>(uint64_t a1@<X8>)
{
  uint64_t v22 = sub_100010FD0();
  sub_10000ABB0(v1, (uint64_t)__dst);
  uint64_t v21 = __dst[0];
  char v3 = __dst[1];
  char v4 = BYTE1(__dst[1]);
  uint64_t v5 = __dst[2];
  uint64_t v6 = __dst[3];
  char v7 = __dst[4];
  long long v19 = *(_OWORD *)&__dst[7];
  long long v20 = *(_OWORD *)&__dst[5];
  uint64_t v8 = __dst[9];
  uint64_t v18 = __dst[10];
  char v17 = __dst[11];
  uint64_t v16 = __dst[12];
  uint64_t v9 = __dst[13];
  char v10 = sub_100011060();
  memcpy(__dst, v1, 0x1B3uLL);
  sub_1000109A8((uint64_t)v1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000C204);
  sub_10000BB38(v24);
  sub_1000109A8((uint64_t)v1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000BE48);
  sub_10000E878((uint64_t)v24);
  uint64_t result = sub_100010E50();
  *(void *)a1 = v22;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(void *)(a1 + 24) = v21;
  *(unsigned char *)(a1 + 32) = v3;
  *(unsigned char *)(a1 + 33) = v4;
  *(void *)(a1 + 40) = v5;
  *(void *)(a1 + 48) = v6;
  *(unsigned char *)(a1 + 56) = v7;
  *(_OWORD *)(a1 + 64) = v20;
  *(_OWORD *)(a1 + 80) = v19;
  *(void *)(a1 + 96) = v8;
  *(void *)(a1 + 104) = v18;
  *(unsigned char *)(a1 + 112) = v17;
  *(void *)(a1 + 120) = v16;
  *(void *)(a1 + 128) = v9;
  *(unsigned char *)(a1 + 136) = v10;
  *(void *)(a1 + 144) = v12;
  *(void *)(a1 + 152) = v13;
  *(void *)(a1 + 160) = v14;
  *(void *)(a1 + 168) = v15;
  *(unsigned char *)(a1 + 176) = 0;
  return result;
}

uint64_t sub_10000ABB0@<X0>(void *__src@<X0>, uint64_t a2@<X8>)
{
  memcpy(__dst, __src, sizeof(__dst));
  sub_1000109A8((uint64_t)__src, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000C204);
  sub_10000BB38(v24);
  sub_1000109A8((uint64_t)__src, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000BE48);
  sub_10000E878((uint64_t)v24);
  BOOL v15 = v24[0] != 2;
  sub_10000AD68(__src, (uint64_t)v16);
  uint64_t v4 = v16[0];
  uint64_t v5 = v16[1];
  char v6 = v17;
  uint64_t v7 = v18;
  uint64_t v8 = v19;
  uint64_t v9 = v20;
  uint64_t v14 = v21;
  uint64_t v10 = v22;
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v12 = swift_getKeyPath();
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 0;
  *(unsigned char *)(a2 + 9) = v15;
  *(void *)(a2 + 16) = v4;
  *(void *)(a2 + 24) = v5;
  *(unsigned char *)(a2 + 32) = v6;
  *(void *)(a2 + 40) = v7;
  *(void *)(a2 + 48) = v8;
  *(void *)(a2 + 56) = v9;
  *(void *)(a2 + 64) = v14;
  *(void *)(a2 + 72) = v10;
  *(void *)(a2 + 80) = KeyPath;
  *(unsigned char *)(a2 + 88) = 0;
  *(void *)(a2 + 96) = v12;
  *(void *)(a2 + 104) = 0x3F847AE147AE147BLL;
  sub_1000078D0(v4, v5, v6);
  swift_bridgeObjectRetain();
  sub_100010B0C(v8, v9, v14, v10);
  swift_retain();
  swift_retain();
  sub_1000078E0(v4, v5, v6);
  swift_bridgeObjectRelease();
  sub_100010B50(v8, v9, v14, v10);
  swift_release();
  return swift_release();
}

uint64_t sub_10000AD68@<X0>(void *__src@<X0>, uint64_t a2@<X8>)
{
  memcpy(__dst, __src, sizeof(__dst));
  sub_1000109A8((uint64_t)__src, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000C204);
  sub_10000BB38(v70);
  uint64_t v3 = v75;
  uint64_t v4 = v76;
  uint64_t v62 = v71;
  uint64_t v63 = v72;
  uint64_t v64 = v73;
  uint64_t v65 = v74;
  uint64_t v66 = v75;
  uint64_t v49 = v75;
  uint64_t v67 = v76;
  uint64_t v68 = v77;
  uint64_t v69 = v78;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_100005B6C(v3, v4);
  sub_10000E878((uint64_t)v70);
  sub_1000109A8((uint64_t)__src, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000C204);
  sub_10000BB38(__srca);
  sub_1000109A8((uint64_t)__src, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000BE48);
  memcpy(v79, __srca, 0x1B2uLL);
  sub_10000E878((uint64_t)v79);
  uint64_t v5 = sub_100010DD0();
  uint64_t v7 = v6;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000C114(v49, v4);
  swift_bridgeObjectRelease();
  sub_1000109A8((uint64_t)__src, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000BE48);
  __srca[0] = v5;
  __srca[1] = v7;
  sub_1000078F0();
  uint64_t v8 = sub_100011100();
  uint64_t v10 = v9;
  LOBYTE(v4) = v11 & 1;
  sub_1000110B0();
  uint64_t v12 = sub_1000110E0();
  uint64_t v14 = v13;
  char v16 = v15;
  swift_release();
  sub_1000078E0(v8, v10, v4);
  swift_bridgeObjectRelease();
  sub_1000111D0();
  uint64_t v17 = sub_1000110D0();
  uint64_t v47 = v18;
  uint64_t v48 = v17;
  char v46 = v19;
  uint64_t v50 = v20;
  swift_release();
  sub_1000078E0(v12, v14, v16 & 1);
  swift_bridgeObjectRelease();
  sub_1000109A8((uint64_t)__src, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000C204);
  sub_10000BB38(v80);
  uint64_t v21 = v85;
  uint64_t v22 = v86;
  uint64_t v54 = v81;
  uint64_t v55 = v82;
  uint64_t v56 = v83;
  uint64_t v57 = v84;
  uint64_t v58 = v85;
  uint64_t v59 = v86;
  uint64_t v60 = v87;
  uint64_t v61 = v88;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_100005B6C(v21, v22);
  sub_10000E878((uint64_t)v80);
  sub_1000109A8((uint64_t)__src, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000C204);
  sub_10000BB38(v52);
  sub_1000109A8((uint64_t)__src, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000BE48);
  memcpy(__srca, v52, 0x1B2uLL);
  sub_10000E878((uint64_t)__srca);
  sub_100010DD0();
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000C114(v21, v22);
  swift_bridgeObjectRelease();
  sub_1000109A8((uint64_t)__src, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000BE48);
  if (v26)
  {
    v52[0] = v24;
    v52[1] = v26;
    uint64_t v27 = sub_100011100();
    uint64_t v29 = v28;
    char v31 = v30 & 1;
    sub_100011070();
    uint64_t v32 = sub_1000110E0();
    uint64_t v34 = v33;
    char v36 = v35;
    swift_release();
    sub_1000078E0(v27, v29, v31);
    swift_bridgeObjectRelease();
    sub_1000111E0();
    uint64_t v37 = sub_1000110D0();
    uint64_t v39 = v38;
    char v41 = v40;
    uint64_t v43 = v42;
    swift_release();
    uint64_t v44 = v41 & 1;
    sub_1000078E0(v32, v34, v36 & 1);
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v37 = 0;
    uint64_t v39 = 0;
    uint64_t v44 = 0;
    uint64_t v43 = 0;
  }
  *(void *)a2 = v48;
  *(void *)(a2 + 8) = v47;
  *(unsigned char *)(a2 + 16) = v46 & 1;
  *(void *)(a2 + 24) = v50;
  *(void *)(a2 + 32) = v37;
  *(void *)(a2 + 40) = v39;
  *(void *)(a2 + 48) = v44;
  *(void *)(a2 + 56) = v43;
  sub_1000078D0(v48, v47, v46 & 1);
  swift_bridgeObjectRetain();
  sub_100010B0C(v37, v39, v44, v43);
  sub_100010B50(v37, v39, v44, v43);
  sub_1000078E0(v48, v47, v46 & 1);
  return swift_bridgeObjectRelease();
}

uint64_t sub_10000B250@<X0>(uint64_t a1@<X8>)
{
  memcpy(__dst, v1, sizeof(__dst));
  return sub_10000AA14(a1);
}

uint64_t sub_10000B29C()
{
  uint64_t v1 = v0;
  sub_100005C3C(v0, (uint64_t)v50);
  uint64_t v47 = v51;
  uint64_t v2 = sub_100010E40();
  uint64_t v45 = *(void *)(v2 - 8);
  uint64_t v46 = v2;
  uint64_t v3 = __chkstk_darwin(v2);
  uint64_t v44 = (uint64_t)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v43 = (char *)&v40 - v5;
  uint64_t v6 = sub_100010D00();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100003E74(&qword_100018428);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100010D20();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  char v16 = (char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005C3C(v0, (uint64_t)v52);
  if (!v53)
  {
    swift_bridgeObjectRetain();
    return sub_100011200();
  }
  if (v53 != 1)
  {
    id v20 = objc_allocWithZone((Class)NSBundle);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    NSString v21 = sub_100011440();
    swift_bridgeObjectRelease();
    id v22 = [v20 initWithPath:v21];

    id v23 = [self currentTraitCollection];
    NSString v24 = sub_100011440();
    swift_bridgeObjectRelease();
    id v25 = [self imageNamed:v24 inBundle:v22 compatibleWithTraitCollection:v23];

    if (!v25) {
      return (uint64_t)v25;
    }
    return sub_1000111F0();
  }
  uint64_t v18 = v52[0];
  unint64_t v17 = v52[1];
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for URL.DirectoryHint.inferFromPath(_:), v6);
  sub_10000FA6C(v1, (void (*)(void, void, void, void, void))sub_100004700);
  swift_bridgeObjectRetain();
  sub_100010D10();
  uint64_t v27 = sub_100010D30();
  unint64_t v29 = v28;
  unint64_t v42 = v17;
  uint64_t v44 = v18;
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  id v30 = objc_allocWithZone((Class)UIImage);
  sub_10000FAAC(v27, v29);
  Class isa = sub_100010D40().super.isa;
  id v32 = [v30 initWithData:isa];
  sub_10000FB04(v27, v29);

  if (v32)
  {
    sub_10000FA6C(v1, (void (*)(void, void, void, void, void))sub_1000048C0);
    id v25 = (id)sub_1000111F0();
    sub_10000FB04(v27, v29);
  }
  else
  {
    uint64_t v33 = sub_100010D80();
    uint64_t v34 = v45;
    char v35 = v43;
    uint64_t v36 = v46;
    (*(void (**)(char *, uint64_t, uint64_t))(v45 + 16))(v43, v33, v46);
    swift_bridgeObjectRetain();
    uint64_t v37 = sub_100010E20();
    os_log_type_t v38 = sub_100011460();
    if (os_log_type_enabled(v37, v38))
    {
      uint64_t v39 = (uint8_t *)swift_slowAlloc();
      uint64_t v41 = swift_slowAlloc();
      uint64_t v49 = v41;
      *(_DWORD *)uint64_t v39 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v48 = sub_10000F0C4(v44, v42, &v49);
      sub_100011490();
      sub_10000FA6C(v1, (void (*)(void, void, void, void, void))sub_1000048C0);
      sub_10000FA6C(v1, (void (*)(void, void, void, void, void))sub_1000048C0);
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v37, v38, "Unable to read live activity image from stored data at path: %s", v39, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      sub_10000FB04(v27, v29);
      (*(void (**)(char *, uint64_t))(v34 + 8))(v43, v46);
    }
    else
    {
      sub_10000FB04(v27, v29);
      sub_10000FA6C(v1, (void (*)(void, void, void, void, void))sub_1000048C0);
      sub_10000FA6C(v1, (void (*)(void, void, void, void, void))sub_1000048C0);

      (*(void (**)(char *, uint64_t))(v34 + 8))(v35, v36);
    }
    return 0;
  }
  return (uint64_t)v25;
}

uint64_t sub_10000BB38@<X0>(void *a1@<X8>)
{
  uint64_t v3 = sub_100010F70();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000FA08(v1, (uint64_t)v19, &qword_100018358);
  sub_10000FA08((uint64_t)v19, (uint64_t)v20, &qword_100018358);
  if (sub_10000F0BC((uint64_t)v20) == 1)
  {
    sub_10000FA08((uint64_t)v19, (uint64_t)v18, &qword_100018358);
    uint64_t v7 = (const void *)nullsub_1(v18);
    memcpy(a1, v7, 0x1B2uLL);
    return sub_1000109A8(v1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000C204);
  }
  else
  {
    sub_1000109A8(v1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000C204);
    os_log_type_t v9 = sub_100011470();
    uint64_t v10 = sub_100011030();
    os_log_type_t v11 = v9;
    if (os_log_type_enabled(v10, v9))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      char v16 = a1;
      v18[0] = v13;
      uint64_t v15 = v3;
      *(_DWORD *)uint64_t v12 = 136315138;
      uint64_t v17 = sub_10000F0C4(0xD000000000000017, 0x80000001000121A0, v18);
      uint64_t v3 = v15;
      sub_100011490();
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v12, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    sub_10000FA08((uint64_t)v19, (uint64_t)v18, &qword_100018358);
    nullsub_1(v18);
    sub_100010F60();
    swift_getAtKeyPath();
    sub_1000109A8(v1, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))sub_10000BE48);
    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
}

uint64_t sub_10000BE10()
{
  return sub_1000113D0();
}

uint64_t sub_10000BE48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, unsigned __int8 a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, unsigned __int8 a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,unsigned __int8 a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,unsigned __int8 a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,unsigned __int8 a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,unsigned __int8 a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,unsigned __int8 a55,char a56,char a57)
{
  if (a57)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_10000C114(a6, a7);
    sub_1000048C0(a10, a11, a12, a13, a14);
    sub_10000C158(a15, a16, a17, a18, a19);
    sub_10000C16C(a20, a21, a22, a23, a24, a25, a26, a27, a28, a29, (void (*)(void))sub_1000048C0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_10000C158);
    sub_1000048C0(a30, a31, a32, a33, a34);
    sub_10000C158(a35, a36, a37, a38, a39);
    sub_10000C16C(a40, a41, a42, a43, a44, a45, a46, a47, a48, a49, (void (*)(void))sub_1000048C0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_10000C158);
    return sub_100004920(a50, a51, a52, a53, a54, a55);
  }
  else
  {
    return swift_release();
  }
}

uint64_t sub_10000C114(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10000C158(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned __int8 a5)
{
  if (a5 != 0xFF) {
    return sub_1000048C0(a1, a2, a3, a4, a5);
  }
  return a1;
}

void sub_10000C16C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, unsigned __int8 a10, void (*a11)(void), void (*a12)(uint64_t, uint64_t, uint64_t, uint64_t, void))
{
  if (a5 != -1)
  {
    a11();
    a12(a6, a7, a8, a9, a10);
  }
}

uint64_t sub_10000C204(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, unsigned __int8 a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, unsigned __int8 a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,unsigned __int8 a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,unsigned __int8 a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,unsigned __int8 a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,unsigned __int8 a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,unsigned __int8 a55,char a56,char a57)
{
  if (a57)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_100005B6C(a6, a7);
    sub_100004700(a10, a11, a12, a13, a14);
    sub_100005BB0(a15, a16, a17, a18, a19);
    sub_10000C16C(a20, a21, a22, a23, a24, a25, a26, a27, a28, a29, (void (*)(void))sub_100004700, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_100005BB0);
    sub_100004700(a30, a31, a32, a33, a34);
    sub_100005BB0(a35, a36, a37, a38, a39);
    sub_10000C16C(a40, a41, a42, a43, a44, a45, a46, a47, a48, a49, (void (*)(void))sub_100004700, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_100005BB0);
    return sub_100004760(a50, a51, a52, a53, a54, a55);
  }
  else
  {
    return swift_retain();
  }
}

uint64_t sub_10000C4D0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 544);
  uint64_t v23 = *(void *)(a1 + 576);
  uint64_t v24 = *(void *)(a1 + 568);
  uint64_t v22 = *(void *)(a1 + 584);
  uint64_t v20 = *(void *)(a1 + 536);
  uint64_t v21 = *(void *)(a1 + 592);
  uint64_t v28 = *(void *)(a1 + 616);
  uint64_t v29 = *(void *)(a1 + 608);
  uint64_t v26 = *(void *)(a1 + 632);
  uint64_t v27 = *(void *)(a1 + 624);
  uint64_t v39 = *(void *)(a1 + 648);
  uint64_t v38 = *(void *)(a1 + 656);
  uint64_t v36 = *(void *)(a1 + 672);
  uint64_t v37 = *(void *)(a1 + 664);
  uint64_t v34 = *(void *)(a1 + 688);
  uint64_t v35 = *(void *)(a1 + 680);
  uint64_t v32 = *(void *)(a1 + 704);
  uint64_t v33 = *(void *)(a1 + 696);
  uint64_t v31 = *(void *)(a1 + 712);
  unsigned __int8 v30 = *(unsigned char *)(a1 + 720);
  uint64_t v43 = *(void *)(a1 + 728);
  uint64_t v42 = *(void *)(a1 + 736);
  uint64_t v41 = *(void *)(a1 + 744);
  uint64_t v40 = *(void *)(a1 + 752);
  uint64_t v48 = *(void *)(a1 + 776);
  uint64_t v49 = *(void *)(a1 + 768);
  uint64_t v46 = *(void *)(a1 + 792);
  uint64_t v47 = *(void *)(a1 + 784);
  uint64_t v57 = *(void *)(a1 + 816);
  uint64_t v58 = *(void *)(a1 + 808);
  uint64_t v55 = *(void *)(a1 + 832);
  uint64_t v56 = *(void *)(a1 + 824);
  uint64_t v53 = *(void *)(a1 + 848);
  uint64_t v54 = *(void *)(a1 + 840);
  uint64_t v51 = *(void *)(a1 + 864);
  uint64_t v52 = *(void *)(a1 + 856);
  uint64_t v45 = *(void *)(a1 + 872);
  unsigned __int8 v44 = *(unsigned char *)(a1 + 880);
  uint64_t v62 = *(void *)(a1 + 896);
  uint64_t v63 = *(void *)(a1 + 888);
  uint64_t v60 = *(void *)(a1 + 912);
  uint64_t v61 = *(void *)(a1 + 904);
  uint64_t v59 = *(void *)(a1 + 920);
  unsigned __int8 v3 = *(unsigned char *)(a1 + 600);
  unsigned __int8 v4 = *(unsigned char *)(a1 + 640);
  unsigned __int8 v5 = *(unsigned char *)(a1 + 760);
  unsigned __int8 v25 = *(unsigned char *)(a1 + 800);
  unsigned __int8 v50 = *(unsigned char *)(a1 + 928);
  __int16 v19 = *(_WORD *)(a1 + 432);
  long long v17 = *(_OWORD *)(a1 + 384);
  long long v18 = *(_OWORD *)(a1 + 400);
  long long v15 = *(_OWORD *)(a1 + 352);
  long long v16 = *(_OWORD *)(a1 + 368);
  long long v13 = *(_OWORD *)(a1 + 320);
  long long v14 = *(_OWORD *)(a1 + 336);
  long long v11 = *(_OWORD *)(a1 + 288);
  long long v12 = *(_OWORD *)(a1 + 304);
  long long v9 = *(_OWORD *)(a1 + 256);
  long long v10 = *(_OWORD *)(a1 + 272);
  long long v7 = *(_OWORD *)(a1 + 224);
  long long v8 = *(_OWORD *)(a1 + 240);
  sub_10000BE48(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(_OWORD *)(a1 + 144),
    *(void *)(a1 + 152),
    *(void *)(a1 + 160),
    *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    *(void *)(a1 + 184),
    *(void *)(a1 + 192),
    *(void *)(a1 + 200),
    *(void *)(a1 + 208),
    *(void *)(a1 + 216),
    v7,
    *((uint64_t *)&v7 + 1),
    v8,
    *((uint64_t *)&v8 + 1),
    v9,
    BYTE8(v9),
    v10,
    *((uint64_t *)&v10 + 1),
    v11,
    *((uint64_t *)&v11 + 1),
    v12,
    *((uint64_t *)&v12 + 1),
    v13,
    *((uint64_t *)&v13 + 1),
    v14,
    SBYTE8(v14),
    v15,
    *((uint64_t *)&v15 + 1),
    v16,
    *((uint64_t *)&v16 + 1),
    v17,
    *((uint64_t *)&v17 + 1),
    v18,
    *((uint64_t *)&v18 + 1),
    *(void *)(a1 + 416),
    *(void *)(a1 + 424),
    v19,
    SHIBYTE(v19),
    *(unsigned char *)(a1 + 434));
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  sub_10000C114(v20, v2);
  sub_1000048C0(v24, v23, v22, v21, v3);
  sub_10000C158(v29, v28, v27, v26, v4);
  sub_10000C16C(v39, v38, v37, v36, v35, v34, v33, v32, v31, v30, (void (*)(void))sub_1000048C0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_10000C158);
  sub_1000048C0(v43, v42, v41, v40, v5);
  sub_10000C158(v49, v48, v47, v46, v25);
  sub_10000C16C(v58, v57, v56, v55, v54, v53, v52, v51, v45, v44, (void (*)(void))sub_1000048C0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_10000C158);
  sub_100004920(v63, v62, v61, v60, v59, v50);
  return a1;
}

uint64_t initializeWithCopy for SetupHeroView(uint64_t a1, uint64_t a2)
{
  uint64_t v59 = *(void *)(a2 + 72);
  uint64_t v60 = *(void *)(a2 + 64);
  uint64_t v57 = *(void *)(a2 + 88);
  uint64_t v58 = *(void *)(a2 + 80);
  uint64_t v55 = *(void *)(a2 + 104);
  uint64_t v56 = *(void *)(a2 + 96);
  uint64_t v53 = *(void *)(a2 + 120);
  uint64_t v54 = *(void *)(a2 + 112);
  uint64_t v51 = *(void *)(a2 + 136);
  uint64_t v52 = *(void *)(a2 + 128);
  uint64_t v49 = *(void *)(a2 + 152);
  uint64_t v50 = *(void *)(a2 + 144);
  uint64_t v47 = *(void *)(a2 + 168);
  uint64_t v48 = *(void *)(a2 + 160);
  uint64_t v45 = *(void *)(a2 + 184);
  uint64_t v46 = *(void *)(a2 + 176);
  uint64_t v43 = *(void *)(a2 + 200);
  uint64_t v44 = *(void *)(a2 + 192);
  uint64_t v41 = *(void *)(a2 + 216);
  uint64_t v42 = *(void *)(a2 + 208);
  uint64_t v40 = *(void *)(a2 + 224);
  uint64_t v13 = *(void *)(a2 + 232);
  uint64_t v14 = *(void *)(a2 + 240);
  uint64_t v15 = *(void *)(a2 + 248);
  uint64_t v16 = *(void *)(a2 + 256);
  uint64_t v17 = *(void *)(a2 + 264);
  uint64_t v18 = *(void *)(a2 + 272);
  uint64_t v19 = *(void *)(a2 + 280);
  uint64_t v20 = *(void *)(a2 + 288);
  uint64_t v21 = *(void *)(a2 + 296);
  uint64_t v22 = *(void *)(a2 + 304);
  uint64_t v23 = *(void *)(a2 + 312);
  uint64_t v24 = *(void *)(a2 + 320);
  uint64_t v25 = *(void *)(a2 + 328);
  uint64_t v26 = *(void *)(a2 + 336);
  uint64_t v27 = *(void *)(a2 + 344);
  uint64_t v28 = *(void *)(a2 + 352);
  uint64_t v29 = *(void *)(a2 + 360);
  uint64_t v30 = *(void *)(a2 + 368);
  uint64_t v31 = *(void *)(a2 + 376);
  uint64_t v32 = *(void *)(a2 + 384);
  uint64_t v33 = *(void *)(a2 + 392);
  uint64_t v34 = *(void *)(a2 + 400);
  uint64_t v35 = *(void *)(a2 + 408);
  uint64_t v36 = *(void *)(a2 + 416);
  uint64_t v37 = *(void *)(a2 + 424);
  __int16 v38 = *(_WORD *)(a2 + 432);
  char v39 = *(unsigned char *)(a2 + 434);
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(a2 + 32);
  uint64_t v9 = *(void *)(a2 + 40);
  uint64_t v10 = *(void *)(a2 + 48);
  uint64_t v11 = *(void *)(a2 + 56);
  sub_10000C204(*(void *)a2, v5, v6, v7, v8, v9, v10, v11, v60, v59, v58, v57, v56, v55, v54, v53, v52, v51, v50,
    v49,
    v48,
    v47,
    v46,
    v45,
    v44,
    v43,
    v42,
    v41,
    v40,
    v13,
    v14,
    v15,
    v16,
    v17,
    v18,
    v19,
    v20,
    v21,
    v22,
    v23,
    v24,
    v25,
    v26,
    v27,
    v28,
    v29,
    v30,
    v31,
    v32,
    v33,
    v34,
    v35,
    v36,
    v37,
    v38,
    SHIBYTE(v38),
    v39);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v9;
  *(void *)(a1 + 48) = v10;
  *(void *)(a1 + 56) = v11;
  *(void *)(a1 + 64) = v60;
  *(void *)(a1 + 72) = v59;
  *(void *)(a1 + 80) = v58;
  *(void *)(a1 + 88) = v57;
  *(void *)(a1 + 96) = v56;
  *(void *)(a1 + 104) = v55;
  *(void *)(a1 + 112) = v54;
  *(void *)(a1 + 120) = v53;
  *(void *)(a1 + 128) = v52;
  *(void *)(a1 + 136) = v51;
  *(void *)(a1 + 144) = v50;
  *(void *)(a1 + 152) = v49;
  *(void *)(a1 + 160) = v48;
  *(void *)(a1 + 168) = v47;
  *(void *)(a1 + 176) = v46;
  *(void *)(a1 + 184) = v45;
  *(void *)(a1 + 192) = v44;
  *(void *)(a1 + 200) = v43;
  *(void *)(a1 + 208) = v42;
  *(void *)(a1 + 216) = v41;
  *(void *)(a1 + 224) = v40;
  *(void *)(a1 + 232) = v13;
  *(void *)(a1 + 240) = v14;
  *(void *)(a1 + 248) = v15;
  *(void *)(a1 + 256) = v16;
  *(void *)(a1 + 264) = v17;
  *(void *)(a1 + 272) = v18;
  *(void *)(a1 + 280) = v19;
  *(void *)(a1 + 288) = v20;
  *(void *)(a1 + 296) = v21;
  *(void *)(a1 + 304) = v22;
  *(void *)(a1 + 312) = v23;
  *(void *)(a1 + 320) = v24;
  *(void *)(a1 + 328) = v25;
  *(void *)(a1 + 336) = v26;
  *(void *)(a1 + 344) = v27;
  *(void *)(a1 + 352) = v28;
  *(void *)(a1 + 360) = v29;
  *(void *)(a1 + 368) = v30;
  *(void *)(a1 + 376) = v31;
  *(void *)(a1 + 384) = v32;
  *(void *)(a1 + 392) = v33;
  *(void *)(a1 + 400) = v34;
  *(void *)(a1 + 408) = v35;
  *(void *)(a1 + 416) = v36;
  *(void *)(a1 + 424) = v37;
  *(_WORD *)(a1 + 432) = v38;
  *(unsigned char *)(a1 + 434) = v39;
  *(unsigned char *)(a1 + 435) = *(unsigned char *)(a2 + 435);
  return a1;
}

uint64_t assignWithCopy for SetupHeroView(uint64_t a1, uint64_t a2)
{
  uint64_t v66 = a2 + 434;
  uint64_t v93 = *(void *)a2;
  uint64_t v94 = *(void *)(a2 + 8);
  uint64_t v91 = *(void *)(a2 + 24);
  uint64_t v92 = *(void *)(a2 + 16);
  uint64_t v89 = *(void *)(a2 + 40);
  uint64_t v90 = *(void *)(a2 + 32);
  uint64_t v87 = *(void *)(a2 + 56);
  uint64_t v88 = *(void *)(a2 + 48);
  uint64_t v85 = *(void *)(a2 + 72);
  uint64_t v86 = *(void *)(a2 + 64);
  uint64_t v83 = *(void *)(a2 + 88);
  uint64_t v84 = *(void *)(a2 + 80);
  uint64_t v81 = *(void *)(a2 + 104);
  uint64_t v82 = *(void *)(a2 + 96);
  uint64_t v79 = *(void *)(a2 + 120);
  uint64_t v80 = *(void *)(a2 + 112);
  uint64_t v77 = *(void *)(a2 + 136);
  uint64_t v78 = *(void *)(a2 + 128);
  uint64_t v75 = *(void *)(a2 + 152);
  uint64_t v76 = *(void *)(a2 + 144);
  uint64_t v74 = *(void *)(a2 + 160);
  uint64_t v73 = *(void *)(a2 + 168);
  uint64_t v72 = *(void *)(a2 + 176);
  uint64_t v71 = *(void *)(a2 + 184);
  uint64_t v70 = *(void *)(a2 + 192);
  uint64_t v69 = *(void *)(a2 + 200);
  uint64_t v68 = *(void *)(a2 + 208);
  uint64_t v67 = *(void *)(a2 + 216);
  uint64_t v4 = *(void *)(a2 + 232);
  uint64_t v3 = *(void *)(a2 + 240);
  uint64_t v6 = *(void *)(a2 + 248);
  uint64_t v5 = *(void *)(a2 + 256);
  uint64_t v8 = *(void *)(a2 + 264);
  uint64_t v7 = *(void *)(a2 + 272);
  uint64_t v10 = *(void *)(a2 + 280);
  uint64_t v9 = *(void *)(a2 + 288);
  uint64_t v11 = *(void *)(a2 + 296);
  uint64_t v47 = *(void *)(a2 + 224);
  uint64_t v48 = *(void *)(a2 + 304);
  uint64_t v49 = *(void *)(a2 + 312);
  uint64_t v50 = *(void *)(a2 + 320);
  uint64_t v51 = *(void *)(a2 + 328);
  uint64_t v52 = *(void *)(a2 + 336);
  uint64_t v53 = *(void *)(a2 + 344);
  uint64_t v54 = *(void *)(a2 + 352);
  uint64_t v55 = *(void *)(a2 + 360);
  uint64_t v56 = *(void *)(a2 + 368);
  uint64_t v57 = *(void *)(a2 + 376);
  uint64_t v58 = *(void *)(a2 + 384);
  uint64_t v59 = *(void *)(a2 + 392);
  uint64_t v60 = *(void *)(a2 + 400);
  uint64_t v61 = *(void *)(a2 + 408);
  uint64_t v62 = *(void *)(a2 + 416);
  uint64_t v63 = *(void *)(a2 + 424);
  __int16 v64 = *(_WORD *)(a2 + 432);
  char v65 = *(unsigned char *)(a2 + 434);
  sub_10000C204(*(void *)a2, v94, v92, v91, v90, v89, v88, v87, v86, v85, v84, v83, v82, v81, v80, v79, v78, v77, v76,
    v75,
    v74,
    v73,
    v72,
    v71,
    v70,
    v69,
    v68,
    v67,
    v47,
    v4,
    v3,
    v6,
    v5,
    v8,
    v7,
    v10,
    v9,
    v11,
    *(_OWORD *)(a2 + 304),
    v49,
    v50,
    v51,
    v52,
    v53,
    v54,
    v55,
    v56,
    v57,
    *(_OWORD *)(a2 + 384),
    v59,
    v60,
    v61,
    v62,
    v63,
    v64,
    SHIBYTE(v64),
    v65);
  uint64_t v12 = *(void *)a1;
  uint64_t v13 = *(void *)(a1 + 8);
  *(void *)a1 = v93;
  *(void *)(a1 + 8) = v94;
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = *(void *)(a1 + 24);
  *(void *)(a1 + 16) = v92;
  *(void *)(a1 + 24) = v91;
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  *(void *)(a1 + 32) = v90;
  *(void *)(a1 + 40) = v89;
  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 56);
  *(void *)(a1 + 48) = v88;
  *(void *)(a1 + 56) = v87;
  long long v20 = *(_OWORD *)(a1 + 64);
  long long v21 = *(_OWORD *)(a1 + 80);
  *(void *)(a1 + 64) = v86;
  *(void *)(a1 + 72) = v85;
  *(void *)(a1 + 80) = v84;
  *(void *)(a1 + 88) = v83;
  long long v22 = *(_OWORD *)(a1 + 96);
  long long v23 = *(_OWORD *)(a1 + 112);
  *(void *)(a1 + 96) = v82;
  *(void *)(a1 + 104) = v81;
  *(void *)(a1 + 112) = v80;
  *(void *)(a1 + 120) = v79;
  long long v24 = *(_OWORD *)(a1 + 128);
  long long v25 = *(_OWORD *)(a1 + 144);
  *(void *)(a1 + 128) = v78;
  *(void *)(a1 + 136) = v77;
  *(void *)(a1 + 144) = v76;
  *(void *)(a1 + 152) = v75;
  long long v26 = *(_OWORD *)(a1 + 160);
  long long v27 = *(_OWORD *)(a1 + 176);
  *(void *)(a1 + 160) = v74;
  *(void *)(a1 + 168) = v73;
  *(void *)(a1 + 176) = v72;
  *(void *)(a1 + 184) = v71;
  long long v28 = *(_OWORD *)(a1 + 192);
  long long v29 = *(_OWORD *)(a1 + 208);
  *(void *)(a1 + 192) = v70;
  *(void *)(a1 + 200) = v69;
  *(void *)(a1 + 208) = v68;
  *(void *)(a1 + 216) = v67;
  long long v30 = *(_OWORD *)(a1 + 224);
  long long v31 = *(_OWORD *)(a1 + 240);
  *(void *)(a1 + 224) = v47;
  *(void *)(a1 + 232) = v4;
  *(void *)(a1 + 240) = v3;
  *(void *)(a1 + 248) = v6;
  long long v32 = *(_OWORD *)(a1 + 256);
  long long v33 = *(_OWORD *)(a1 + 272);
  *(void *)(a1 + 256) = v5;
  *(void *)(a1 + 264) = v8;
  *(void *)(a1 + 272) = v7;
  *(void *)(a1 + 280) = v10;
  long long v34 = *(_OWORD *)(a1 + 288);
  long long v35 = *(_OWORD *)(a1 + 304);
  *(void *)(a1 + 288) = v9;
  *(void *)(a1 + 296) = v11;
  *(void *)(a1 + 304) = v48;
  *(void *)(a1 + 312) = v49;
  long long v36 = *(_OWORD *)(a1 + 320);
  long long v37 = *(_OWORD *)(a1 + 336);
  *(void *)(a1 + 320) = v50;
  *(void *)(a1 + 328) = v51;
  *(void *)(a1 + 336) = v52;
  *(void *)(a1 + 344) = v53;
  long long v38 = *(_OWORD *)(a1 + 352);
  long long v39 = *(_OWORD *)(a1 + 368);
  *(void *)(a1 + 352) = v54;
  *(void *)(a1 + 360) = v55;
  *(void *)(a1 + 368) = v56;
  *(void *)(a1 + 376) = v57;
  long long v40 = *(_OWORD *)(a1 + 384);
  long long v41 = *(_OWORD *)(a1 + 400);
  *(void *)(a1 + 384) = v58;
  *(void *)(a1 + 392) = v59;
  *(void *)(a1 + 400) = v60;
  *(void *)(a1 + 408) = v61;
  uint64_t v42 = *(void *)(a1 + 416);
  uint64_t v43 = *(void *)(a1 + 424);
  *(void *)(a1 + 416) = v62;
  *(void *)(a1 + 424) = v63;
  __int16 v44 = *(_WORD *)(a1 + 432);
  *(_WORD *)(a1 + 432) = v64;
  char v45 = *(unsigned char *)(a1 + 434);
  *(unsigned char *)(a1 + 434) = v65;
  sub_10000BE48(v12, v13, v14, v15, v16, v17, v18, v19, v20, *((uint64_t *)&v20 + 1), v21, *((uint64_t *)&v21 + 1), v22, BYTE8(v22), v23, *((uint64_t *)&v23 + 1), v24, *((uint64_t *)&v24 + 1), v25,
    *((uint64_t *)&v25 + 1),
    v26,
    *((uint64_t *)&v26 + 1),
    v27,
    SBYTE8(v27),
    v28,
    *((uint64_t *)&v28 + 1),
    v29,
    *((uint64_t *)&v29 + 1),
    v30,
    *((uint64_t *)&v30 + 1),
    v31,
    *((uint64_t *)&v31 + 1),
    v32,
    BYTE8(v32),
    v33,
    *((uint64_t *)&v33 + 1),
    v34,
    *((uint64_t *)&v34 + 1),
    v35,
    *((uint64_t *)&v35 + 1),
    v36,
    *((uint64_t *)&v36 + 1),
    v37,
    SBYTE8(v37),
    v38,
    *((uint64_t *)&v38 + 1),
    v39,
    *((uint64_t *)&v39 + 1),
    v40,
    *((uint64_t *)&v40 + 1),
    v41,
    *((uint64_t *)&v41 + 1),
    v42,
    v43,
    v44,
    SHIBYTE(v44),
    v45);
  *(unsigned char *)(a1 + 435) = *(unsigned char *)(v66 + 1);
  return a1;
}

void *initializeWithTake for SetupHeroView(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x1B4uLL);
}

uint64_t assignWithTake for SetupHeroView(uint64_t a1, uint64_t a2)
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
  long long v18 = *(_OWORD *)(a1 + 160);
  long long v19 = *(_OWORD *)(a1 + 176);
  long long v20 = *(_OWORD *)(a1 + 192);
  long long v21 = *(_OWORD *)(a1 + 208);
  long long v22 = *(_OWORD *)(a1 + 224);
  long long v23 = *(_OWORD *)(a1 + 240);
  long long v24 = *(_OWORD *)(a1 + 256);
  long long v25 = *(_OWORD *)(a1 + 272);
  long long v26 = *(_OWORD *)(a1 + 288);
  long long v27 = *(_OWORD *)(a1 + 304);
  long long v28 = *(_OWORD *)(a1 + 320);
  long long v29 = *(_OWORD *)(a1 + 336);
  long long v30 = *(_OWORD *)(a1 + 352);
  long long v31 = *(_OWORD *)(a1 + 368);
  long long v32 = *(_OWORD *)(a1 + 384);
  long long v33 = *(_OWORD *)(a1 + 400);
  long long v34 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v34;
  long long v35 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v35;
  long long v36 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v36;
  long long v37 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v37;
  long long v38 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v38;
  long long v39 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 176) = v39;
  long long v40 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 208) = v40;
  long long v41 = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 224) = *(_OWORD *)(a2 + 224);
  *(_OWORD *)(a1 + 240) = v41;
  long long v42 = *(_OWORD *)(a2 + 272);
  *(_OWORD *)(a1 + 256) = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 272) = v42;
  long long v43 = *(_OWORD *)(a2 + 304);
  *(_OWORD *)(a1 + 288) = *(_OWORD *)(a2 + 288);
  *(_OWORD *)(a1 + 304) = v43;
  long long v44 = *(_OWORD *)(a2 + 336);
  *(_OWORD *)(a1 + 320) = *(_OWORD *)(a2 + 320);
  *(_OWORD *)(a1 + 336) = v44;
  long long v45 = *(_OWORD *)(a2 + 368);
  *(_OWORD *)(a1 + 352) = *(_OWORD *)(a2 + 352);
  *(_OWORD *)(a1 + 368) = v45;
  long long v46 = *(_OWORD *)(a2 + 400);
  *(_OWORD *)(a1 + 384) = *(_OWORD *)(a2 + 384);
  *(_OWORD *)(a1 + 400) = v46;
  uint64_t v47 = *(void *)(a1 + 416);
  uint64_t v48 = *(void *)(a1 + 424);
  *(_OWORD *)(a1 + 416) = *(_OWORD *)(a2 + 416);
  uint64_t v49 = a2 + 434;
  __int16 v50 = *(_WORD *)(a2 + 432);
  LOBYTE(a2) = *(unsigned char *)(a2 + 434);
  __int16 v51 = *(_WORD *)(a1 + 432);
  char v52 = *(unsigned char *)(a1 + 434);
  *(_WORD *)(a1 + 432) = v50;
  *(unsigned char *)(a1 + 434) = a2;
  sub_10000BE48(v4, v5, v6, v7, v8, v9, v10, v11, v12, *((uint64_t *)&v12 + 1), v13, *((uint64_t *)&v13 + 1), v14, BYTE8(v14), v15, *((uint64_t *)&v15 + 1), v16, *((uint64_t *)&v16 + 1), v17,
    *((uint64_t *)&v17 + 1),
    v18,
    *((uint64_t *)&v18 + 1),
    v19,
    SBYTE8(v19),
    v20,
    *((uint64_t *)&v20 + 1),
    v21,
    *((uint64_t *)&v21 + 1),
    v22,
    *((uint64_t *)&v22 + 1),
    v23,
    *((uint64_t *)&v23 + 1),
    v24,
    BYTE8(v24),
    v25,
    *((uint64_t *)&v25 + 1),
    v26,
    *((uint64_t *)&v26 + 1),
    v27,
    *((uint64_t *)&v27 + 1),
    v28,
    *((uint64_t *)&v28 + 1),
    v29,
    SBYTE8(v29),
    v30,
    *((uint64_t *)&v30 + 1),
    v31,
    *((uint64_t *)&v31 + 1),
    v32,
    *((uint64_t *)&v32 + 1),
    v33,
    *((uint64_t *)&v33 + 1),
    v47,
    v48,
    v51,
    SHIBYTE(v51),
    v52);
  *(unsigned char *)(a1 + 435) = *(unsigned char *)(v49 + 1);
  return a1;
}

uint64_t getEnumTagSinglePayload for SetupHeroView(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 436)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 434);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SetupHeroView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 424) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_DWORD *)(result + 432) = 0;
    *(_OWORD *)(result + 408) = 0u;
    *(_OWORD *)(result + 392) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)uint64_t result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 436) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 436) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 434) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SetupHeroView()
{
  return &type metadata for SetupHeroView;
}

void *initializeWithTake for SetupLiveActivityContentView(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x1B3uLL);
}

ValueMetadata *type metadata accessor for SetupLiveActivityContentView()
{
  return &type metadata for SetupLiveActivityContentView;
}

uint64_t sub_10000D2FC()
{
  return sub_1000040E4(&qword_100018370, &qword_100018378);
}

unint64_t sub_10000D338(uint64_t a1)
{
  unint64_t result = sub_100008A14();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_10000D360(uint64_t a1)
{
  unint64_t result = sub_100008E2C();
  *(void *)(a1 + 8) = result;
  return result;
}

uint64_t sub_10000D388()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000D3A4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10000D3C0()
{
  return sub_100010EE0();
}

uint64_t sub_10000D3E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100003E74(&qword_100018380);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000D450(uint64_t a1)
{
  uint64_t v78 = *(void *)(a1 + 520);
  uint64_t v79 = *(void *)(a1 + 512);
  uint64_t v76 = *(void *)(a1 + 536);
  uint64_t v77 = *(void *)(a1 + 528);
  uint64_t v74 = *(void *)(a1 + 552);
  uint64_t v75 = *(void *)(a1 + 544);
  uint64_t v72 = *(void *)(a1 + 568);
  uint64_t v73 = *(void *)(a1 + 560);
  uint64_t v2 = *(void *)(a1 + 928);
  uint64_t v3 = *(void *)(a1 + 936);
  __int16 v4 = *(_WORD *)(a1 + 944);
  char v5 = *(unsigned char *)(a1 + 946);
  uint64_t v83 = *(void *)(a1 + 1072);
  uint64_t v84 = *(void *)(a1 + 1064);
  uint64_t v81 = *(void *)(a1 + 1088);
  uint64_t v82 = *(void *)(a1 + 1080);
  uint64_t v80 = *(void *)(a1 + 1096);
  long long v70 = *(_OWORD *)(a1 + 1144);
  long long v71 = *(_OWORD *)(a1 + 1128);
  long long v68 = *(_OWORD *)(a1 + 1176);
  long long v69 = *(_OWORD *)(a1 + 1160);
  long long v67 = *(_OWORD *)(a1 + 1192);
  long long v66 = *(_OWORD *)(a1 + 1208);
  long long v65 = *(_OWORD *)(a1 + 1224);
  long long v62 = *(_OWORD *)(a1 + 1240);
  long long v61 = *(_OWORD *)(a1 + 1256);
  long long v60 = *(_OWORD *)(a1 + 1272);
  long long v58 = *(_OWORD *)(a1 + 1304);
  long long v59 = *(_OWORD *)(a1 + 1288);
  long long v56 = *(_OWORD *)(a1 + 1336);
  long long v57 = *(_OWORD *)(a1 + 1320);
  long long v54 = *(_OWORD *)(a1 + 1368);
  long long v55 = *(_OWORD *)(a1 + 1352);
  long long v52 = *(_OWORD *)(a1 + 1400);
  long long v53 = *(_OWORD *)(a1 + 1384);
  long long v50 = *(_OWORD *)(a1 + 1432);
  long long v51 = *(_OWORD *)(a1 + 1416);
  uint64_t v6 = *(void *)(a1 + 1104);
  uint64_t v63 = *(void *)(a1 + 1112);
  uint64_t v64 = *(void *)(a1 + 1120);
  uint64_t v7 = *(void *)(a1 + 1544);
  long long v48 = *(_OWORD *)(a1 + 1464);
  long long v49 = *(_OWORD *)(a1 + 1448);
  long long v46 = *(_OWORD *)(a1 + 1496);
  long long v47 = *(_OWORD *)(a1 + 1480);
  long long v44 = *(_OWORD *)(a1 + 1528);
  long long v45 = *(_OWORD *)(a1 + 1512);
  long long v42 = *(_OWORD *)(a1 + 592);
  long long v43 = *(_OWORD *)(a1 + 576);
  long long v40 = *(_OWORD *)(a1 + 624);
  long long v41 = *(_OWORD *)(a1 + 608);
  long long v38 = *(_OWORD *)(a1 + 656);
  long long v39 = *(_OWORD *)(a1 + 640);
  long long v36 = *(_OWORD *)(a1 + 688);
  long long v37 = *(_OWORD *)(a1 + 672);
  long long v34 = *(_OWORD *)(a1 + 720);
  long long v35 = *(_OWORD *)(a1 + 704);
  long long v32 = *(_OWORD *)(a1 + 752);
  long long v33 = *(_OWORD *)(a1 + 736);
  long long v30 = *(_OWORD *)(a1 + 784);
  long long v31 = *(_OWORD *)(a1 + 768);
  long long v28 = *(_OWORD *)(a1 + 816);
  long long v29 = *(_OWORD *)(a1 + 800);
  long long v26 = *(_OWORD *)(a1 + 848);
  long long v27 = *(_OWORD *)(a1 + 832);
  long long v24 = *(_OWORD *)(a1 + 880);
  long long v25 = *(_OWORD *)(a1 + 864);
  long long v22 = *(_OWORD *)(a1 + 912);
  long long v23 = *(_OWORD *)(a1 + 896);
  __int16 v21 = *(_WORD *)(a1 + 456);
  long long v19 = *(_OWORD *)(a1 + 408);
  long long v20 = *(_OWORD *)(a1 + 424);
  long long v17 = *(_OWORD *)(a1 + 376);
  long long v18 = *(_OWORD *)(a1 + 392);
  long long v15 = *(_OWORD *)(a1 + 344);
  long long v16 = *(_OWORD *)(a1 + 360);
  long long v13 = *(_OWORD *)(a1 + 312);
  long long v14 = *(_OWORD *)(a1 + 328);
  long long v11 = *(_OWORD *)(a1 + 280);
  long long v12 = *(_OWORD *)(a1 + 296);
  long long v9 = *(_OWORD *)(a1 + 248);
  long long v10 = *(_OWORD *)(a1 + 264);
  sub_10000C204(*(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144), *(void *)(a1 + 152), *(void *)(a1 + 160), *(_OWORD *)(a1 + 168),
    *(void *)(a1 + 176),
    *(void *)(a1 + 184),
    *(void *)(a1 + 192),
    *(void *)(a1 + 200),
    *(void *)(a1 + 208),
    *(void *)(a1 + 216),
    *(void *)(a1 + 224),
    *(void *)(a1 + 232),
    *(void *)(a1 + 240),
    v9,
    *((uint64_t *)&v9 + 1),
    v10,
    *((uint64_t *)&v10 + 1),
    v11,
    BYTE8(v11),
    v12,
    *((uint64_t *)&v12 + 1),
    v13,
    *((uint64_t *)&v13 + 1),
    v14,
    *((uint64_t *)&v14 + 1),
    v15,
    *((uint64_t *)&v15 + 1),
    v16,
    SBYTE8(v16),
    v17,
    *((uint64_t *)&v17 + 1),
    v18,
    *((uint64_t *)&v18 + 1),
    v19,
    *((uint64_t *)&v19 + 1),
    v20,
    *((uint64_t *)&v20 + 1),
    *(void *)(a1 + 440),
    *(void *)(a1 + 448),
    v21,
    SHIBYTE(v21),
    *(unsigned char *)(a1 + 458));
  sub_10000C204(v79, v78, v77, v76, v75, v74, v73, v72, v43, *((uint64_t *)&v43 + 1), v42, *((uint64_t *)&v42 + 1), v41, BYTE8(v41), v40, *((uint64_t *)&v40 + 1), v39, *((uint64_t *)&v39 + 1), v38,
    *((uint64_t *)&v38 + 1),
    v37,
    *((uint64_t *)&v37 + 1),
    v36,
    SBYTE8(v36),
    v35,
    *((uint64_t *)&v35 + 1),
    v34,
    *((uint64_t *)&v34 + 1),
    v33,
    *((uint64_t *)&v33 + 1),
    v32,
    *((uint64_t *)&v32 + 1),
    v31,
    BYTE8(v31),
    v30,
    *((uint64_t *)&v30 + 1),
    v29,
    *((uint64_t *)&v29 + 1),
    v28,
    *((uint64_t *)&v28 + 1),
    v27,
    *((uint64_t *)&v27 + 1),
    v26,
    SBYTE8(v26),
    v25,
    *((uint64_t *)&v25 + 1),
    v24,
    *((uint64_t *)&v24 + 1),
    v23,
    *((uint64_t *)&v23 + 1),
    v22,
    *((uint64_t *)&v22 + 1),
    v2,
    v3,
    v4,
    SHIBYTE(v4),
    v5);
  sub_10000D8C0(v84, v83, v82, v81, v80, v6, v63, v64, v71, *((uint64_t *)&v71 + 1), v70, *((uint64_t *)&v70 + 1), v69, BYTE8(v69), v68, *((uint64_t *)&v68 + 1), v67, *((uint64_t *)&v67 + 1), v66,
    *((uint64_t *)&v66 + 1),
    v65,
    *((uint64_t *)&v65 + 1),
    v62,
    SBYTE8(v62),
    v61,
    *((uint64_t *)&v61 + 1),
    v60,
    *((uint64_t *)&v60 + 1),
    v59,
    *((uint64_t *)&v59 + 1),
    v58,
    *((uint64_t *)&v58 + 1),
    v57,
    BYTE8(v57),
    v56,
    *((uint64_t *)&v56 + 1),
    v55,
    *((uint64_t *)&v55 + 1),
    v54,
    *((uint64_t *)&v54 + 1),
    v53,
    *((uint64_t *)&v53 + 1),
    v52,
    SBYTE8(v52),
    v51,
    *((uint64_t *)&v51 + 1),
    v50,
    *((uint64_t *)&v50 + 1),
    v49,
    *((uint64_t *)&v49 + 1),
    v48,
    *((uint64_t *)&v48 + 1),
    v47,
    *((uint64_t *)&v47 + 1),
    v46,
    SBYTE1(v46),
    SBYTE2(v46),
    *((uint64_t *)&v46 + 1),
    v45,
    *((uint64_t *)&v45 + 1),
    v44,
    *((uint64_t *)&v44 + 1),
    v7);
  swift_retain();
  return a1;
}

uint64_t sub_10000D8C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, unsigned __int8 a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, unsigned __int8 a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,unsigned __int8 a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,unsigned __int8 a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,unsigned __int8 a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,unsigned __int8 a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,unsigned __int8 a55,char a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  if ((a65 & 1) == 0)
  {
    return sub_10000DBBC(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
             a20,
             a21,
             a22,
             a23,
             a24,
             a25,
             a26,
             a27,
             a28,
             a29,
             a30,
             a31,
             a32,
             a33,
             a34,
             a35,
             a36,
             a37,
             a38,
             a39,
             a40,
             a41,
             a42,
             a43,
             a44,
             a45,
             a46,
             a47,
             a48,
             a49,
             a50,
             a51,
             a52,
             a53,
             a54,
             a55,
             a56,
             a57,
             a58,
             a59,
             a60,
             a61,
             a62,
             a63);
  }
  return a1;
}

uint64_t sub_10000DBBC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, unsigned __int8 a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, unsigned __int8 a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,unsigned __int8 a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,unsigned __int8 a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,unsigned __int8 a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,unsigned __int8 a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,unsigned __int8 a55,char a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  if (a64)
  {
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  else
  {
    char v66 = a57 & 1;
    return sub_10000C204(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
             a20,
             a21,
             a22,
             a23,
             a24,
             a25,
             a26,
             a27,
             a28,
             a29,
             a30,
             a31,
             a32,
             a33,
             a34,
             a35,
             a36,
             a37,
             a38,
             a39,
             a40,
             a41,
             a42,
             a43,
             a44,
             a45,
             a46,
             a47,
             a48,
             a49,
             a50,
             a51,
             a52,
             a53,
             a54,
             a55,
             a56,
             v66);
  }
}

uint64_t sub_10000DE34(uint64_t a1)
{
  uint64_t v2 = sub_100003E74(&qword_100018380);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000DE94(uint64_t a1)
{
  uint64_t v78 = *(void *)(a1 + 520);
  uint64_t v79 = *(void *)(a1 + 512);
  uint64_t v76 = *(void *)(a1 + 536);
  uint64_t v77 = *(void *)(a1 + 528);
  uint64_t v74 = *(void *)(a1 + 552);
  uint64_t v75 = *(void *)(a1 + 544);
  uint64_t v72 = *(void *)(a1 + 568);
  uint64_t v73 = *(void *)(a1 + 560);
  uint64_t v2 = *(void *)(a1 + 928);
  uint64_t v3 = *(void *)(a1 + 936);
  __int16 v4 = *(_WORD *)(a1 + 944);
  char v5 = *(unsigned char *)(a1 + 946);
  uint64_t v83 = *(void *)(a1 + 1072);
  uint64_t v84 = *(void *)(a1 + 1064);
  uint64_t v81 = *(void *)(a1 + 1088);
  uint64_t v82 = *(void *)(a1 + 1080);
  uint64_t v80 = *(void *)(a1 + 1096);
  long long v70 = *(_OWORD *)(a1 + 1144);
  long long v71 = *(_OWORD *)(a1 + 1128);
  long long v68 = *(_OWORD *)(a1 + 1176);
  long long v69 = *(_OWORD *)(a1 + 1160);
  long long v67 = *(_OWORD *)(a1 + 1192);
  long long v66 = *(_OWORD *)(a1 + 1208);
  long long v65 = *(_OWORD *)(a1 + 1224);
  long long v62 = *(_OWORD *)(a1 + 1240);
  long long v61 = *(_OWORD *)(a1 + 1256);
  long long v60 = *(_OWORD *)(a1 + 1272);
  long long v58 = *(_OWORD *)(a1 + 1304);
  long long v59 = *(_OWORD *)(a1 + 1288);
  long long v56 = *(_OWORD *)(a1 + 1336);
  long long v57 = *(_OWORD *)(a1 + 1320);
  long long v54 = *(_OWORD *)(a1 + 1368);
  long long v55 = *(_OWORD *)(a1 + 1352);
  long long v52 = *(_OWORD *)(a1 + 1400);
  long long v53 = *(_OWORD *)(a1 + 1384);
  long long v50 = *(_OWORD *)(a1 + 1432);
  long long v51 = *(_OWORD *)(a1 + 1416);
  uint64_t v6 = *(void *)(a1 + 1104);
  uint64_t v63 = *(void *)(a1 + 1112);
  uint64_t v64 = *(void *)(a1 + 1120);
  uint64_t v7 = *(void *)(a1 + 1544);
  long long v48 = *(_OWORD *)(a1 + 1464);
  long long v49 = *(_OWORD *)(a1 + 1448);
  long long v46 = *(_OWORD *)(a1 + 1496);
  long long v47 = *(_OWORD *)(a1 + 1480);
  long long v44 = *(_OWORD *)(a1 + 1528);
  long long v45 = *(_OWORD *)(a1 + 1512);
  long long v42 = *(_OWORD *)(a1 + 592);
  long long v43 = *(_OWORD *)(a1 + 576);
  long long v40 = *(_OWORD *)(a1 + 624);
  long long v41 = *(_OWORD *)(a1 + 608);
  long long v38 = *(_OWORD *)(a1 + 656);
  long long v39 = *(_OWORD *)(a1 + 640);
  long long v36 = *(_OWORD *)(a1 + 688);
  long long v37 = *(_OWORD *)(a1 + 672);
  long long v34 = *(_OWORD *)(a1 + 720);
  long long v35 = *(_OWORD *)(a1 + 704);
  long long v32 = *(_OWORD *)(a1 + 752);
  long long v33 = *(_OWORD *)(a1 + 736);
  long long v30 = *(_OWORD *)(a1 + 784);
  long long v31 = *(_OWORD *)(a1 + 768);
  long long v28 = *(_OWORD *)(a1 + 816);
  long long v29 = *(_OWORD *)(a1 + 800);
  long long v26 = *(_OWORD *)(a1 + 848);
  long long v27 = *(_OWORD *)(a1 + 832);
  long long v24 = *(_OWORD *)(a1 + 880);
  long long v25 = *(_OWORD *)(a1 + 864);
  long long v22 = *(_OWORD *)(a1 + 912);
  long long v23 = *(_OWORD *)(a1 + 896);
  __int16 v21 = *(_WORD *)(a1 + 456);
  long long v19 = *(_OWORD *)(a1 + 408);
  long long v20 = *(_OWORD *)(a1 + 424);
  long long v17 = *(_OWORD *)(a1 + 376);
  long long v18 = *(_OWORD *)(a1 + 392);
  long long v15 = *(_OWORD *)(a1 + 344);
  long long v16 = *(_OWORD *)(a1 + 360);
  long long v13 = *(_OWORD *)(a1 + 312);
  long long v14 = *(_OWORD *)(a1 + 328);
  long long v11 = *(_OWORD *)(a1 + 280);
  long long v12 = *(_OWORD *)(a1 + 296);
  long long v9 = *(_OWORD *)(a1 + 248);
  long long v10 = *(_OWORD *)(a1 + 264);
  sub_10000BE48(*(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144), *(void *)(a1 + 152), *(void *)(a1 + 160), *(_OWORD *)(a1 + 168),
    *(void *)(a1 + 176),
    *(void *)(a1 + 184),
    *(void *)(a1 + 192),
    *(void *)(a1 + 200),
    *(void *)(a1 + 208),
    *(void *)(a1 + 216),
    *(void *)(a1 + 224),
    *(void *)(a1 + 232),
    *(void *)(a1 + 240),
    v9,
    *((uint64_t *)&v9 + 1),
    v10,
    *((uint64_t *)&v10 + 1),
    v11,
    BYTE8(v11),
    v12,
    *((uint64_t *)&v12 + 1),
    v13,
    *((uint64_t *)&v13 + 1),
    v14,
    *((uint64_t *)&v14 + 1),
    v15,
    *((uint64_t *)&v15 + 1),
    v16,
    SBYTE8(v16),
    v17,
    *((uint64_t *)&v17 + 1),
    v18,
    *((uint64_t *)&v18 + 1),
    v19,
    *((uint64_t *)&v19 + 1),
    v20,
    *((uint64_t *)&v20 + 1),
    *(void *)(a1 + 440),
    *(void *)(a1 + 448),
    v21,
    SHIBYTE(v21),
    *(unsigned char *)(a1 + 458));
  sub_10000BE48(v79, v78, v77, v76, v75, v74, v73, v72, v43, *((uint64_t *)&v43 + 1), v42, *((uint64_t *)&v42 + 1), v41, BYTE8(v41), v40, *((uint64_t *)&v40 + 1), v39, *((uint64_t *)&v39 + 1), v38,
    *((uint64_t *)&v38 + 1),
    v37,
    *((uint64_t *)&v37 + 1),
    v36,
    SBYTE8(v36),
    v35,
    *((uint64_t *)&v35 + 1),
    v34,
    *((uint64_t *)&v34 + 1),
    v33,
    *((uint64_t *)&v33 + 1),
    v32,
    *((uint64_t *)&v32 + 1),
    v31,
    BYTE8(v31),
    v30,
    *((uint64_t *)&v30 + 1),
    v29,
    *((uint64_t *)&v29 + 1),
    v28,
    *((uint64_t *)&v28 + 1),
    v27,
    *((uint64_t *)&v27 + 1),
    v26,
    SBYTE8(v26),
    v25,
    *((uint64_t *)&v25 + 1),
    v24,
    *((uint64_t *)&v24 + 1),
    v23,
    *((uint64_t *)&v23 + 1),
    v22,
    *((uint64_t *)&v22 + 1),
    v2,
    v3,
    v4,
    SHIBYTE(v4),
    v5);
  sub_10000E304(v84, v83, v82, v81, v80, v6, v63, v64, v71, *((uint64_t *)&v71 + 1), v70, *((uint64_t *)&v70 + 1), v69, BYTE8(v69), v68, *((uint64_t *)&v68 + 1), v67, *((uint64_t *)&v67 + 1), v66,
    *((uint64_t *)&v66 + 1),
    v65,
    *((uint64_t *)&v65 + 1),
    v62,
    SBYTE8(v62),
    v61,
    *((uint64_t *)&v61 + 1),
    v60,
    *((uint64_t *)&v60 + 1),
    v59,
    *((uint64_t *)&v59 + 1),
    v58,
    *((uint64_t *)&v58 + 1),
    v57,
    BYTE8(v57),
    v56,
    *((uint64_t *)&v56 + 1),
    v55,
    *((uint64_t *)&v55 + 1),
    v54,
    *((uint64_t *)&v54 + 1),
    v53,
    *((uint64_t *)&v53 + 1),
    v52,
    SBYTE8(v52),
    v51,
    *((uint64_t *)&v51 + 1),
    v50,
    *((uint64_t *)&v50 + 1),
    v49,
    *((uint64_t *)&v49 + 1),
    v48,
    *((uint64_t *)&v48 + 1),
    v47,
    *((uint64_t *)&v47 + 1),
    v46,
    SBYTE1(v46),
    SBYTE2(v46),
    *((uint64_t *)&v46 + 1),
    v45,
    *((uint64_t *)&v45 + 1),
    v44,
    *((uint64_t *)&v44 + 1),
    v7);
  swift_release();
  return a1;
}

uint64_t sub_10000E304(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, unsigned __int8 a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, unsigned __int8 a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,unsigned __int8 a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,unsigned __int8 a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,unsigned __int8 a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,unsigned __int8 a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,unsigned __int8 a55,char a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  if ((a65 & 1) == 0)
  {
    return sub_10000E600(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
             a20,
             a21,
             a22,
             a23,
             a24,
             a25,
             a26,
             a27,
             a28,
             a29,
             a30,
             a31,
             a32,
             a33,
             a34,
             a35,
             a36,
             a37,
             a38,
             a39,
             a40,
             a41,
             a42,
             a43,
             a44,
             a45,
             a46,
             a47,
             a48,
             a49,
             a50,
             a51,
             a52,
             a53,
             a54,
             a55,
             a56,
             a57,
             a58,
             a59,
             a60,
             a61,
             a62,
             a63);
  }
  return a1;
}

uint64_t sub_10000E600(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, unsigned __int8 a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, unsigned __int8 a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,unsigned __int8 a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,unsigned __int8 a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,unsigned __int8 a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,unsigned __int8 a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,unsigned __int8 a55,char a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  if (a64)
  {
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    char v66 = a57 & 1;
    return sub_10000BE48(a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
             a20,
             a21,
             a22,
             a23,
             a24,
             a25,
             a26,
             a27,
             a28,
             a29,
             a30,
             a31,
             a32,
             a33,
             a34,
             a35,
             a36,
             a37,
             a38,
             a39,
             a40,
             a41,
             a42,
             a43,
             a44,
             a45,
             a46,
             a47,
             a48,
             a49,
             a50,
             a51,
             a52,
             a53,
             a54,
             a55,
             a56,
             v66);
  }
}

uint64_t sub_10000E878(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 80);
  uint64_t v11 = *(void *)(a1 + 72);
  uint64_t v4 = *(void *)(a1 + 96);
  uint64_t v9 = *(void *)(a1 + 88);
  uint64_t v15 = *(void *)(a1 + 120);
  uint64_t v16 = *(void *)(a1 + 112);
  uint64_t v13 = *(void *)(a1 + 136);
  uint64_t v14 = *(void *)(a1 + 128);
  uint64_t v25 = *(void *)(a1 + 160);
  uint64_t v26 = *(void *)(a1 + 152);
  uint64_t v23 = *(void *)(a1 + 176);
  uint64_t v24 = *(void *)(a1 + 168);
  uint64_t v21 = *(void *)(a1 + 192);
  uint64_t v22 = *(void *)(a1 + 184);
  uint64_t v19 = *(void *)(a1 + 208);
  uint64_t v20 = *(void *)(a1 + 200);
  uint64_t v18 = *(void *)(a1 + 216);
  unsigned __int8 v17 = *(unsigned char *)(a1 + 224);
  uint64_t v29 = *(void *)(a1 + 240);
  uint64_t v30 = *(void *)(a1 + 232);
  uint64_t v27 = *(void *)(a1 + 256);
  uint64_t v28 = *(void *)(a1 + 248);
  uint64_t v35 = *(void *)(a1 + 280);
  uint64_t v36 = *(void *)(a1 + 272);
  uint64_t v34 = *(void *)(a1 + 288);
  uint64_t v33 = *(void *)(a1 + 296);
  uint64_t v44 = *(void *)(a1 + 320);
  uint64_t v45 = *(void *)(a1 + 312);
  uint64_t v42 = *(void *)(a1 + 336);
  uint64_t v43 = *(void *)(a1 + 328);
  uint64_t v40 = *(void *)(a1 + 352);
  uint64_t v41 = *(void *)(a1 + 344);
  uint64_t v38 = *(void *)(a1 + 368);
  uint64_t v39 = *(void *)(a1 + 360);
  uint64_t v32 = *(void *)(a1 + 376);
  unsigned __int8 v31 = *(unsigned char *)(a1 + 384);
  uint64_t v49 = *(void *)(a1 + 400);
  uint64_t v50 = *(void *)(a1 + 392);
  uint64_t v47 = *(void *)(a1 + 416);
  uint64_t v48 = *(void *)(a1 + 408);
  uint64_t v46 = *(void *)(a1 + 424);
  unsigned __int8 v5 = *(unsigned char *)(a1 + 104);
  unsigned __int8 v6 = *(unsigned char *)(a1 + 144);
  unsigned __int8 v7 = *(unsigned char *)(a1 + 264);
  unsigned __int8 v12 = *(unsigned char *)(a1 + 304);
  unsigned __int8 v37 = *(unsigned char *)(a1 + 432);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000C114(v2, v3);
  sub_1000048C0(v11, v10, v9, v4, v5);
  sub_10000C158(v16, v15, v14, v13, v6);
  sub_10000C16C(v26, v25, v24, v23, v22, v21, v20, v19, v18, v17, (void (*)(void))sub_1000048C0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_10000C158);
  sub_1000048C0(v30, v29, v28, v27, v7);
  sub_10000C158(v36, v35, v34, v33, v12);
  sub_10000C16C(v45, v44, v43, v42, v41, v40, v39, v38, v32, v31, (void (*)(void))sub_1000048C0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_10000C158);
  sub_100004920(v50, v49, v48, v47, v46, v37);
  return a1;
}

uint64_t sub_10000EAE4(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, _WORD))
{
  long long v17 = *(_OWORD *)(a1 + 448);
  long long v18 = *(_OWORD *)(a1 + 464);
  long long v15 = *(_OWORD *)(a1 + 416);
  long long v16 = *(_OWORD *)(a1 + 432);
  long long v13 = *(_OWORD *)(a1 + 384);
  long long v14 = *(_OWORD *)(a1 + 400);
  long long v11 = *(_OWORD *)(a1 + 352);
  long long v12 = *(_OWORD *)(a1 + 368);
  long long v9 = *(_OWORD *)(a1 + 320);
  long long v10 = *(_OWORD *)(a1 + 336);
  long long v7 = *(_OWORD *)(a1 + 288);
  long long v8 = *(_OWORD *)(a1 + 304);
  long long v5 = *(_OWORD *)(a1 + 256);
  long long v6 = *(_OWORD *)(a1 + 272);
  long long v4 = *(_OWORD *)(a1 + 224);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    *(void *)(a1 + 160),
    *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    *(void *)(a1 + 184),
    *(void *)(a1 + 192),
    *(void *)(a1 + 200),
    *(void *)(a1 + 208),
    *(void *)(a1 + 216),
    v4,
    *((void *)&v4 + 1),
    *(void *)(a1 + 240),
    *(void *)(a1 + 248),
    v5,
    *((void *)&v5 + 1),
    v6,
    *((void *)&v6 + 1),
    v7,
    *((void *)&v7 + 1),
    v8,
    *((void *)&v8 + 1),
    v9,
    *((void *)&v9 + 1),
    v10,
    *((void *)&v10 + 1),
    v11,
    *((void *)&v11 + 1),
    v12,
    *((void *)&v12 + 1),
    v13,
    *((void *)&v13 + 1),
    v14,
    *((void *)&v14 + 1),
    v15,
    *((void *)&v15 + 1),
    v16,
    *((void *)&v16 + 1),
    v17,
    *((void *)&v17 + 1),
    v18,
    *((void *)&v18 + 1),
    *(void *)(a1 + 480),
    *(_WORD *)(a1 + 488));
  return a1;
}

uint64_t sub_10000EBB8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 72);
  uint64_t v11 = *(void *)(a1 + 64);
  uint64_t v4 = *(void *)(a1 + 88);
  uint64_t v9 = *(void *)(a1 + 80);
  uint64_t v15 = *(void *)(a1 + 112);
  uint64_t v16 = *(void *)(a1 + 104);
  uint64_t v13 = *(void *)(a1 + 128);
  uint64_t v14 = *(void *)(a1 + 120);
  uint64_t v25 = *(void *)(a1 + 152);
  uint64_t v26 = *(void *)(a1 + 144);
  uint64_t v23 = *(void *)(a1 + 168);
  uint64_t v24 = *(void *)(a1 + 160);
  uint64_t v21 = *(void *)(a1 + 184);
  uint64_t v22 = *(void *)(a1 + 176);
  uint64_t v19 = *(void *)(a1 + 200);
  uint64_t v20 = *(void *)(a1 + 192);
  uint64_t v18 = *(void *)(a1 + 208);
  unsigned __int8 v17 = *(unsigned char *)(a1 + 216);
  uint64_t v29 = *(void *)(a1 + 232);
  uint64_t v30 = *(void *)(a1 + 224);
  uint64_t v27 = *(void *)(a1 + 248);
  uint64_t v28 = *(void *)(a1 + 240);
  uint64_t v35 = *(void *)(a1 + 272);
  uint64_t v36 = *(void *)(a1 + 264);
  uint64_t v34 = *(void *)(a1 + 280);
  uint64_t v33 = *(void *)(a1 + 288);
  uint64_t v44 = *(void *)(a1 + 312);
  uint64_t v45 = *(void *)(a1 + 304);
  uint64_t v42 = *(void *)(a1 + 328);
  uint64_t v43 = *(void *)(a1 + 320);
  uint64_t v40 = *(void *)(a1 + 344);
  uint64_t v41 = *(void *)(a1 + 336);
  uint64_t v38 = *(void *)(a1 + 360);
  uint64_t v39 = *(void *)(a1 + 352);
  uint64_t v32 = *(void *)(a1 + 368);
  unsigned __int8 v31 = *(unsigned char *)(a1 + 376);
  uint64_t v49 = *(void *)(a1 + 392);
  uint64_t v50 = *(void *)(a1 + 384);
  uint64_t v47 = *(void *)(a1 + 408);
  uint64_t v48 = *(void *)(a1 + 400);
  uint64_t v46 = *(void *)(a1 + 416);
  unsigned __int8 v5 = *(unsigned char *)(a1 + 96);
  unsigned __int8 v6 = *(unsigned char *)(a1 + 136);
  unsigned __int8 v7 = *(unsigned char *)(a1 + 256);
  unsigned __int8 v12 = *(unsigned char *)(a1 + 296);
  unsigned __int8 v37 = *(unsigned char *)(a1 + 424);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_10000C114(v2, v3);
  sub_1000048C0(v11, v10, v9, v4, v5);
  sub_10000C158(v16, v15, v14, v13, v6);
  sub_10000C16C(v26, v25, v24, v23, v22, v21, v20, v19, v18, v17, (void (*)(void))sub_1000048C0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_10000C158);
  sub_1000048C0(v30, v29, v28, v27, v7);
  sub_10000C158(v36, v35, v34, v33, v12);
  sub_10000C16C(v45, v44, v43, v42, v41, v40, v39, v38, v32, v31, (void (*)(void))sub_1000048C0, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, void))sub_10000C158);
  sub_100004920(v50, v49, v48, v47, v46, v37);
  return a1;
}

double sub_10000EE24(uint64_t a1)
{
  double result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 3;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 121) = 0u;
  return result;
}

uint64_t sub_10000EE48(uint64_t result)
{
  *(unsigned char *)(result + 489) = 1;
  return result;
}

unint64_t sub_10000EE54()
{
  unint64_t result = qword_1000183A8;
  if (!qword_1000183A8)
  {
    sub_100003CE0(&qword_1000183A0);
    sub_100008D0C(&qword_1000183B0, &qword_1000183B8, (void (*)(void))sub_100008E2C);
    sub_100008D0C(&qword_1000183C0, &qword_1000183C8, (void (*)(void))sub_10000EF28);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000183A8);
  }
  return result;
}

unint64_t sub_10000EF28()
{
  unint64_t result = qword_1000183D0;
  if (!qword_1000183D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000183D0);
  }
  return result;
}

unint64_t sub_10000EF7C()
{
  unint64_t result = qword_1000183D8;
  if (!qword_1000183D8)
  {
    sub_100003CE0(&qword_100018390);
    sub_100008D0C(&qword_1000183E0, &qword_1000183E8, (void (*)(void))sub_10000F01C);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000183D8);
  }
  return result;
}

uint64_t sub_10000F01C()
{
  return sub_100008D0C(&qword_1000183F0, &qword_1000183F8, (void (*)(void))sub_10000F04C);
}

unint64_t sub_10000F04C()
{
  unint64_t result = qword_100018400;
  if (!qword_100018400)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018400);
  }
  return result;
}

uint64_t sub_10000F0A0(uint64_t result)
{
  *(unsigned char *)(result + 488) = 1;
  return result;
}

uint64_t sub_10000F0AC(uint64_t result)
{
  *(unsigned char *)(result + 489) = 0;
  return result;
}

uint64_t sub_10000F0B4(uint64_t result)
{
  *(unsigned char *)(result + 488) = 0;
  return result;
}

uint64_t sub_10000F0BC(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 434);
}

uint64_t sub_10000F0C4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000F198(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000F3A4((uint64_t)v12, *a3);
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
      sub_10000F3A4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000F354((uint64_t)v12);
  return v7;
}

uint64_t sub_10000F198(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1000114A0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10000F400(a5, a6);
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
  uint64_t v8 = sub_1000114C0();
  if (!v8)
  {
    sub_1000114D0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1000114E0();
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

uint64_t sub_10000F354(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000F3A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000F400(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000F498(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000F678(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000F678(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000F498(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000F610(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1000114B0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_1000114D0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100011450();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_1000114E0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_1000114D0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10000F610(uint64_t a1, uint64_t a2)
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
  sub_100003E74(&qword_100018410);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000F678(char a1, int64_t a2, char a3, char *a4)
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
    sub_100003E74(&qword_100018410);
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
  uint64_t result = sub_1000114E0();
  __break(1u);
  return result;
}

uint64_t sub_10000F7CC(uint64_t a1, void (*a2)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), void (*a3)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t), void (*a4)(void), void (*a5)(uint64_t, uint64_t, uint64_t, uint64_t, void))
{
  uint64_t v9 = *(void *)(a1 + 40);
  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 64);
  uint64_t v25 = *(void *)(a1 + 88);
  uint64_t v26 = *(void *)(a1 + 80);
  uint64_t v23 = *(void *)(a1 + 104);
  uint64_t v24 = *(void *)(a1 + 96);
  uint64_t v21 = *(void *)(a1 + 120);
  uint64_t v22 = *(void *)(a1 + 112);
  uint64_t v19 = *(void *)(a1 + 136);
  uint64_t v20 = *(void *)(a1 + 128);
  uint64_t v16 = *(void *)(a1 + 144);
  uint64_t v17 = *(void *)(a1 + 48);
  unsigned __int8 v12 = *(unsigned char *)(a1 + 152);
  uint64_t v29 = *(void *)(a1 + 168);
  uint64_t v30 = *(void *)(a1 + 160);
  uint64_t v27 = *(void *)(a1 + 184);
  uint64_t v28 = *(void *)(a1 + 176);
  uint64_t v35 = *(void *)(a1 + 208);
  uint64_t v36 = *(void *)(a1 + 200);
  uint64_t v33 = *(void *)(a1 + 224);
  uint64_t v34 = *(void *)(a1 + 216);
  uint64_t v44 = *(void *)(a1 + 248);
  uint64_t v45 = *(void *)(a1 + 240);
  uint64_t v42 = *(void *)(a1 + 264);
  uint64_t v43 = *(void *)(a1 + 256);
  uint64_t v40 = *(void *)(a1 + 280);
  uint64_t v41 = *(void *)(a1 + 272);
  uint64_t v38 = *(void *)(a1 + 296);
  uint64_t v39 = *(void *)(a1 + 288);
  uint64_t v32 = *(void *)(a1 + 304);
  unsigned __int8 v31 = *(unsigned char *)(a1 + 312);
  uint64_t v13 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v14 = *(unsigned __int8 *)(a1 + 192);
  unsigned int v18 = *(unsigned __int8 *)(a1 + 232);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned __int8 *)(a1 + 32));
  a3(v9, v17, v10, v11, v13);
  sub_10000C16C(v26, v25, v24, v23, v22, v21, v20, v19, v16, v12, a4, a5);
  a2(v30, v29, v28, v27, v14);
  a3(v36, v35, v34, v33, v18);
  sub_10000C16C(v45, v44, v43, v42, v41, v40, v39, v38, v32, v31, a4, a5);
  return a1;
}

uint64_t sub_10000F99C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  unsigned __int8 v6 = *(unsigned char *)(a1 + 72);
  sub_1000048C0(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(unsigned char *)(a1 + 32));
  sub_10000C158(v2, v3, v4, v5, v6);
  return a1;
}

uint64_t sub_10000FA08(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100003E74(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10000FA6C(uint64_t a1, void (*a2)(void, void, void, void, void))
{
  return a1;
}

uint64_t sub_10000FAAC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

uint64_t sub_10000FB04(uint64_t a1, unint64_t a2)
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

double sub_10000FB5C(uint64_t a1)
{
  *(unsigned char *)(a1 + 128) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t _s21BridgeWidgetExtension13SetupHeroViewVwxx_0(uint64_t a1)
{
  __int16 v14 = *(_WORD *)(a1 + 432);
  long long v12 = *(_OWORD *)(a1 + 384);
  long long v13 = *(_OWORD *)(a1 + 400);
  long long v10 = *(_OWORD *)(a1 + 352);
  long long v11 = *(_OWORD *)(a1 + 368);
  long long v8 = *(_OWORD *)(a1 + 320);
  long long v9 = *(_OWORD *)(a1 + 336);
  long long v6 = *(_OWORD *)(a1 + 288);
  long long v7 = *(_OWORD *)(a1 + 304);
  long long v4 = *(_OWORD *)(a1 + 256);
  long long v5 = *(_OWORD *)(a1 + 272);
  long long v2 = *(_OWORD *)(a1 + 224);
  long long v3 = *(_OWORD *)(a1 + 240);
  return sub_10000BE48(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(_OWORD *)(a1 + 144),
           *(void *)(a1 + 152),
           *(void *)(a1 + 160),
           *(void *)(a1 + 168),
           *(void *)(a1 + 176),
           *(void *)(a1 + 184),
           *(void *)(a1 + 192),
           *(void *)(a1 + 200),
           *(void *)(a1 + 208),
           *(void *)(a1 + 216),
           v2,
           *((uint64_t *)&v2 + 1),
           v3,
           *((uint64_t *)&v3 + 1),
           v4,
           BYTE8(v4),
           v5,
           *((uint64_t *)&v5 + 1),
           v6,
           *((uint64_t *)&v6 + 1),
           v7,
           *((uint64_t *)&v7 + 1),
           v8,
           *((uint64_t *)&v8 + 1),
           v9,
           SBYTE8(v9),
           v10,
           *((uint64_t *)&v10 + 1),
           v11,
           *((uint64_t *)&v11 + 1),
           v12,
           *((uint64_t *)&v12 + 1),
           v13,
           *((uint64_t *)&v13 + 1),
           *(void *)(a1 + 416),
           *(void *)(a1 + 424),
           v14,
           SHIBYTE(v14),
           *(unsigned char *)(a1 + 434));
}

uint64_t _s21BridgeWidgetExtension28SetupLiveActivityContentViewVwcp_0(uint64_t a1, uint64_t a2)
{
  uint64_t v58 = *(void *)(a2 + 72);
  uint64_t v59 = *(void *)(a2 + 64);
  uint64_t v56 = *(void *)(a2 + 88);
  uint64_t v57 = *(void *)(a2 + 80);
  uint64_t v54 = *(void *)(a2 + 104);
  uint64_t v55 = *(void *)(a2 + 96);
  uint64_t v52 = *(void *)(a2 + 120);
  uint64_t v53 = *(void *)(a2 + 112);
  uint64_t v50 = *(void *)(a2 + 136);
  uint64_t v51 = *(void *)(a2 + 128);
  uint64_t v48 = *(void *)(a2 + 152);
  uint64_t v49 = *(void *)(a2 + 144);
  uint64_t v46 = *(void *)(a2 + 168);
  uint64_t v47 = *(void *)(a2 + 160);
  uint64_t v44 = *(void *)(a2 + 184);
  uint64_t v45 = *(void *)(a2 + 176);
  uint64_t v42 = *(void *)(a2 + 200);
  uint64_t v43 = *(void *)(a2 + 192);
  uint64_t v40 = *(void *)(a2 + 216);
  uint64_t v41 = *(void *)(a2 + 208);
  uint64_t v13 = *(void *)(a2 + 224);
  uint64_t v14 = *(void *)(a2 + 232);
  uint64_t v15 = *(void *)(a2 + 240);
  uint64_t v16 = *(void *)(a2 + 248);
  uint64_t v17 = *(void *)(a2 + 256);
  uint64_t v18 = *(void *)(a2 + 264);
  uint64_t v19 = *(void *)(a2 + 272);
  uint64_t v20 = *(void *)(a2 + 280);
  uint64_t v3 = *(void *)(a2 + 296);
  uint64_t v21 = *(void *)(a2 + 288);
  uint64_t v22 = *(void *)(a2 + 304);
  uint64_t v23 = *(void *)(a2 + 312);
  uint64_t v24 = *(void *)(a2 + 320);
  uint64_t v25 = *(void *)(a2 + 328);
  uint64_t v26 = *(void *)(a2 + 336);
  uint64_t v27 = *(void *)(a2 + 344);
  uint64_t v28 = *(void *)(a2 + 352);
  uint64_t v29 = *(void *)(a2 + 360);
  uint64_t v30 = *(void *)(a2 + 368);
  uint64_t v31 = *(void *)(a2 + 376);
  uint64_t v32 = *(void *)(a2 + 384);
  uint64_t v33 = *(void *)(a2 + 392);
  uint64_t v34 = *(void *)(a2 + 400);
  uint64_t v35 = *(void *)(a2 + 408);
  uint64_t v36 = *(void *)(a2 + 416);
  uint64_t v37 = *(void *)(a2 + 424);
  __int16 v38 = *(_WORD *)(a2 + 432);
  char v39 = *(unsigned char *)(a2 + 434);
  uint64_t v4 = *(void *)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  uint64_t v6 = *(void *)(a2 + 16);
  uint64_t v7 = *(void *)(a2 + 24);
  uint64_t v8 = *(void *)(a2 + 32);
  uint64_t v9 = *(void *)(a2 + 40);
  uint64_t v10 = *(void *)(a2 + 48);
  uint64_t v11 = *(void *)(a2 + 56);
  sub_10000C204(*(void *)a2, v5, v6, v7, v8, v9, v10, v11, v59, v58, v57, v56, v55, v54, v53, v52, v51, v50, v49,
    v48,
    v47,
    v46,
    v45,
    v44,
    v43,
    v42,
    v41,
    v40,
    v13,
    v14,
    v15,
    v16,
    v17,
    v18,
    v19,
    v20,
    v21,
    v3,
    v22,
    v23,
    v24,
    v25,
    v26,
    v27,
    v28,
    v29,
    v30,
    v31,
    v32,
    v33,
    v34,
    v35,
    v36,
    v37,
    v38,
    SHIBYTE(v38),
    v39);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = v6;
  *(void *)(a1 + 24) = v7;
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 40) = v9;
  *(void *)(a1 + 48) = v10;
  *(void *)(a1 + 56) = v11;
  *(void *)(a1 + 64) = v59;
  *(void *)(a1 + 72) = v58;
  *(void *)(a1 + 80) = v57;
  *(void *)(a1 + 88) = v56;
  *(void *)(a1 + 96) = v55;
  *(void *)(a1 + 104) = v54;
  *(void *)(a1 + 112) = v53;
  *(void *)(a1 + 120) = v52;
  *(void *)(a1 + 128) = v51;
  *(void *)(a1 + 136) = v50;
  *(void *)(a1 + 144) = v49;
  *(void *)(a1 + 152) = v48;
  *(void *)(a1 + 160) = v47;
  *(void *)(a1 + 168) = v46;
  *(void *)(a1 + 176) = v45;
  *(void *)(a1 + 184) = v44;
  *(void *)(a1 + 192) = v43;
  *(void *)(a1 + 200) = v42;
  *(void *)(a1 + 208) = v41;
  *(void *)(a1 + 216) = v40;
  *(void *)(a1 + 224) = v13;
  *(void *)(a1 + 232) = v14;
  *(void *)(a1 + 240) = v15;
  *(void *)(a1 + 248) = v16;
  *(void *)(a1 + 256) = v17;
  *(void *)(a1 + 264) = v18;
  *(void *)(a1 + 272) = v19;
  *(void *)(a1 + 280) = v20;
  *(void *)(a1 + 288) = v21;
  *(void *)(a1 + 296) = v3;
  *(void *)(a1 + 304) = v22;
  *(void *)(a1 + 312) = v23;
  *(void *)(a1 + 320) = v24;
  *(void *)(a1 + 328) = v25;
  *(void *)(a1 + 336) = v26;
  *(void *)(a1 + 344) = v27;
  *(void *)(a1 + 352) = v28;
  *(void *)(a1 + 360) = v29;
  *(void *)(a1 + 368) = v30;
  *(void *)(a1 + 376) = v31;
  *(void *)(a1 + 384) = v32;
  *(void *)(a1 + 392) = v33;
  *(void *)(a1 + 400) = v34;
  *(void *)(a1 + 408) = v35;
  *(void *)(a1 + 416) = v36;
  *(void *)(a1 + 424) = v37;
  *(_WORD *)(a1 + 432) = v38;
  *(unsigned char *)(a1 + 434) = v39;
  return a1;
}

uint64_t _s21BridgeWidgetExtension28SetupLiveActivityContentViewVwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v92 = *(void *)a2;
  uint64_t v93 = *(void *)(a2 + 8);
  uint64_t v90 = *(void *)(a2 + 24);
  uint64_t v91 = *(void *)(a2 + 16);
  uint64_t v88 = *(void *)(a2 + 40);
  uint64_t v89 = *(void *)(a2 + 32);
  uint64_t v86 = *(void *)(a2 + 56);
  uint64_t v87 = *(void *)(a2 + 48);
  uint64_t v84 = *(void *)(a2 + 72);
  uint64_t v85 = *(void *)(a2 + 64);
  uint64_t v82 = *(void *)(a2 + 88);
  uint64_t v83 = *(void *)(a2 + 80);
  uint64_t v80 = *(void *)(a2 + 104);
  uint64_t v81 = *(void *)(a2 + 96);
  uint64_t v78 = *(void *)(a2 + 120);
  uint64_t v79 = *(void *)(a2 + 112);
  uint64_t v76 = *(void *)(a2 + 136);
  uint64_t v77 = *(void *)(a2 + 128);
  uint64_t v74 = *(void *)(a2 + 152);
  uint64_t v75 = *(void *)(a2 + 144);
  uint64_t v73 = *(void *)(a2 + 160);
  uint64_t v72 = *(void *)(a2 + 168);
  uint64_t v71 = *(void *)(a2 + 176);
  uint64_t v70 = *(void *)(a2 + 184);
  uint64_t v69 = *(void *)(a2 + 192);
  uint64_t v68 = *(void *)(a2 + 200);
  uint64_t v67 = *(void *)(a2 + 208);
  uint64_t v66 = *(void *)(a2 + 216);
  uint64_t v4 = *(void *)(a2 + 232);
  uint64_t v3 = *(void *)(a2 + 240);
  uint64_t v6 = *(void *)(a2 + 248);
  uint64_t v5 = *(void *)(a2 + 256);
  uint64_t v8 = *(void *)(a2 + 264);
  uint64_t v7 = *(void *)(a2 + 272);
  uint64_t v10 = *(void *)(a2 + 280);
  uint64_t v9 = *(void *)(a2 + 288);
  uint64_t v11 = *(void *)(a2 + 296);
  uint64_t v47 = *(void *)(a2 + 224);
  uint64_t v48 = *(void *)(a2 + 304);
  uint64_t v49 = *(void *)(a2 + 312);
  uint64_t v50 = *(void *)(a2 + 320);
  uint64_t v51 = *(void *)(a2 + 328);
  uint64_t v52 = *(void *)(a2 + 336);
  uint64_t v53 = *(void *)(a2 + 344);
  uint64_t v54 = *(void *)(a2 + 352);
  uint64_t v55 = *(void *)(a2 + 360);
  uint64_t v56 = *(void *)(a2 + 368);
  uint64_t v57 = *(void *)(a2 + 376);
  uint64_t v58 = *(void *)(a2 + 384);
  uint64_t v59 = *(void *)(a2 + 392);
  uint64_t v60 = *(void *)(a2 + 400);
  uint64_t v61 = *(void *)(a2 + 408);
  uint64_t v62 = *(void *)(a2 + 416);
  uint64_t v63 = *(void *)(a2 + 424);
  __int16 v64 = *(_WORD *)(a2 + 432);
  char v65 = *(unsigned char *)(a2 + 434);
  sub_10000C204(*(void *)a2, v93, v91, v90, v89, v88, v87, v86, v85, v84, v83, v82, v81, v80, v79, v78, v77, v76, v75,
    v74,
    v73,
    v72,
    v71,
    v70,
    v69,
    v68,
    v67,
    v66,
    v47,
    v4,
    v3,
    v6,
    v5,
    v8,
    v7,
    v10,
    v9,
    v11,
    *(_OWORD *)(a2 + 304),
    v49,
    v50,
    v51,
    v52,
    v53,
    v54,
    v55,
    v56,
    v57,
    *(_OWORD *)(a2 + 384),
    v59,
    v60,
    v61,
    v62,
    v63,
    v64,
    SHIBYTE(v64),
    v65);
  uint64_t v12 = *(void *)a1;
  uint64_t v13 = *(void *)(a1 + 8);
  *(void *)a1 = v92;
  *(void *)(a1 + 8) = v93;
  uint64_t v14 = *(void *)(a1 + 16);
  uint64_t v15 = *(void *)(a1 + 24);
  *(void *)(a1 + 16) = v91;
  *(void *)(a1 + 24) = v90;
  uint64_t v16 = *(void *)(a1 + 32);
  uint64_t v17 = *(void *)(a1 + 40);
  *(void *)(a1 + 32) = v89;
  *(void *)(a1 + 40) = v88;
  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v19 = *(void *)(a1 + 56);
  *(void *)(a1 + 48) = v87;
  *(void *)(a1 + 56) = v86;
  long long v20 = *(_OWORD *)(a1 + 64);
  long long v21 = *(_OWORD *)(a1 + 80);
  *(void *)(a1 + 64) = v85;
  *(void *)(a1 + 72) = v84;
  *(void *)(a1 + 80) = v83;
  *(void *)(a1 + 88) = v82;
  long long v22 = *(_OWORD *)(a1 + 96);
  long long v23 = *(_OWORD *)(a1 + 112);
  *(void *)(a1 + 96) = v81;
  *(void *)(a1 + 104) = v80;
  *(void *)(a1 + 112) = v79;
  *(void *)(a1 + 120) = v78;
  long long v24 = *(_OWORD *)(a1 + 128);
  long long v25 = *(_OWORD *)(a1 + 144);
  *(void *)(a1 + 128) = v77;
  *(void *)(a1 + 136) = v76;
  *(void *)(a1 + 144) = v75;
  *(void *)(a1 + 152) = v74;
  long long v26 = *(_OWORD *)(a1 + 160);
  long long v27 = *(_OWORD *)(a1 + 176);
  *(void *)(a1 + 160) = v73;
  *(void *)(a1 + 168) = v72;
  *(void *)(a1 + 176) = v71;
  *(void *)(a1 + 184) = v70;
  long long v28 = *(_OWORD *)(a1 + 192);
  long long v29 = *(_OWORD *)(a1 + 208);
  *(void *)(a1 + 192) = v69;
  *(void *)(a1 + 200) = v68;
  *(void *)(a1 + 208) = v67;
  *(void *)(a1 + 216) = v66;
  long long v30 = *(_OWORD *)(a1 + 224);
  long long v31 = *(_OWORD *)(a1 + 240);
  *(void *)(a1 + 224) = v47;
  *(void *)(a1 + 232) = v4;
  *(void *)(a1 + 240) = v3;
  *(void *)(a1 + 248) = v6;
  long long v32 = *(_OWORD *)(a1 + 256);
  long long v33 = *(_OWORD *)(a1 + 272);
  *(void *)(a1 + 256) = v5;
  *(void *)(a1 + 264) = v8;
  *(void *)(a1 + 272) = v7;
  *(void *)(a1 + 280) = v10;
  long long v34 = *(_OWORD *)(a1 + 288);
  long long v35 = *(_OWORD *)(a1 + 304);
  *(void *)(a1 + 288) = v9;
  *(void *)(a1 + 296) = v11;
  *(void *)(a1 + 304) = v48;
  *(void *)(a1 + 312) = v49;
  long long v36 = *(_OWORD *)(a1 + 320);
  long long v37 = *(_OWORD *)(a1 + 336);
  *(void *)(a1 + 320) = v50;
  *(void *)(a1 + 328) = v51;
  *(void *)(a1 + 336) = v52;
  *(void *)(a1 + 344) = v53;
  long long v38 = *(_OWORD *)(a1 + 352);
  long long v39 = *(_OWORD *)(a1 + 368);
  *(void *)(a1 + 352) = v54;
  *(void *)(a1 + 360) = v55;
  *(void *)(a1 + 368) = v56;
  *(void *)(a1 + 376) = v57;
  long long v40 = *(_OWORD *)(a1 + 384);
  long long v41 = *(_OWORD *)(a1 + 400);
  *(void *)(a1 + 384) = v58;
  *(void *)(a1 + 392) = v59;
  *(void *)(a1 + 400) = v60;
  *(void *)(a1 + 408) = v61;
  uint64_t v42 = *(void *)(a1 + 416);
  uint64_t v43 = *(void *)(a1 + 424);
  *(void *)(a1 + 416) = v62;
  *(void *)(a1 + 424) = v63;
  __int16 v44 = *(_WORD *)(a1 + 432);
  *(_WORD *)(a1 + 432) = v64;
  char v45 = *(unsigned char *)(a1 + 434);
  *(unsigned char *)(a1 + 434) = v65;
  sub_10000BE48(v12, v13, v14, v15, v16, v17, v18, v19, v20, *((uint64_t *)&v20 + 1), v21, *((uint64_t *)&v21 + 1), v22, BYTE8(v22), v23, *((uint64_t *)&v23 + 1), v24, *((uint64_t *)&v24 + 1), v25,
    *((uint64_t *)&v25 + 1),
    v26,
    *((uint64_t *)&v26 + 1),
    v27,
    SBYTE8(v27),
    v28,
    *((uint64_t *)&v28 + 1),
    v29,
    *((uint64_t *)&v29 + 1),
    v30,
    *((uint64_t *)&v30 + 1),
    v31,
    *((uint64_t *)&v31 + 1),
    v32,
    BYTE8(v32),
    v33,
    *((uint64_t *)&v33 + 1),
    v34,
    *((uint64_t *)&v34 + 1),
    v35,
    *((uint64_t *)&v35 + 1),
    v36,
    *((uint64_t *)&v36 + 1),
    v37,
    SBYTE8(v37),
    v38,
    *((uint64_t *)&v38 + 1),
    v39,
    *((uint64_t *)&v39 + 1),
    v40,
    *((uint64_t *)&v40 + 1),
    v41,
    *((uint64_t *)&v41 + 1),
    v42,
    v43,
    v44,
    SHIBYTE(v44),
    v45);
  return a1;
}

uint64_t _s21BridgeWidgetExtension28SetupLiveActivityContentViewVwta_0(uint64_t a1, uint64_t a2)
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
  long long v18 = *(_OWORD *)(a1 + 160);
  long long v19 = *(_OWORD *)(a1 + 176);
  long long v20 = *(_OWORD *)(a1 + 192);
  long long v21 = *(_OWORD *)(a1 + 208);
  long long v22 = *(_OWORD *)(a1 + 224);
  long long v23 = *(_OWORD *)(a1 + 240);
  long long v24 = *(_OWORD *)(a1 + 256);
  long long v25 = *(_OWORD *)(a1 + 272);
  long long v26 = *(_OWORD *)(a1 + 288);
  long long v27 = *(_OWORD *)(a1 + 304);
  long long v28 = *(_OWORD *)(a1 + 320);
  long long v29 = *(_OWORD *)(a1 + 336);
  long long v30 = *(_OWORD *)(a1 + 352);
  long long v31 = *(_OWORD *)(a1 + 368);
  long long v32 = *(_OWORD *)(a1 + 384);
  long long v33 = *(_OWORD *)(a1 + 400);
  long long v34 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v34;
  long long v35 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v35;
  long long v36 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v36;
  long long v37 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v37;
  long long v38 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v38;
  long long v39 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 176) = v39;
  long long v40 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 208) = v40;
  long long v41 = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 224) = *(_OWORD *)(a2 + 224);
  *(_OWORD *)(a1 + 240) = v41;
  long long v42 = *(_OWORD *)(a2 + 272);
  *(_OWORD *)(a1 + 256) = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 272) = v42;
  long long v43 = *(_OWORD *)(a2 + 304);
  *(_OWORD *)(a1 + 288) = *(_OWORD *)(a2 + 288);
  *(_OWORD *)(a1 + 304) = v43;
  long long v44 = *(_OWORD *)(a2 + 336);
  *(_OWORD *)(a1 + 320) = *(_OWORD *)(a2 + 320);
  *(_OWORD *)(a1 + 336) = v44;
  long long v45 = *(_OWORD *)(a2 + 368);
  *(_OWORD *)(a1 + 352) = *(_OWORD *)(a2 + 352);
  *(_OWORD *)(a1 + 368) = v45;
  long long v46 = *(_OWORD *)(a2 + 400);
  *(_OWORD *)(a1 + 384) = *(_OWORD *)(a2 + 384);
  *(_OWORD *)(a1 + 400) = v46;
  uint64_t v47 = *(void *)(a1 + 416);
  uint64_t v48 = *(void *)(a1 + 424);
  *(_OWORD *)(a1 + 416) = *(_OWORD *)(a2 + 416);
  __int16 v49 = *(_WORD *)(a2 + 432);
  LOBYTE(a2) = *(unsigned char *)(a2 + 434);
  __int16 v50 = *(_WORD *)(a1 + 432);
  char v51 = *(unsigned char *)(a1 + 434);
  *(_WORD *)(a1 + 432) = v49;
  *(unsigned char *)(a1 + 434) = a2;
  sub_10000BE48(v4, v5, v6, v7, v8, v9, v10, v11, v12, *((uint64_t *)&v12 + 1), v13, *((uint64_t *)&v13 + 1), v14, BYTE8(v14), v15, *((uint64_t *)&v15 + 1), v16, *((uint64_t *)&v16 + 1), v17,
    *((uint64_t *)&v17 + 1),
    v18,
    *((uint64_t *)&v18 + 1),
    v19,
    SBYTE8(v19),
    v20,
    *((uint64_t *)&v20 + 1),
    v21,
    *((uint64_t *)&v21 + 1),
    v22,
    *((uint64_t *)&v22 + 1),
    v23,
    *((uint64_t *)&v23 + 1),
    v24,
    BYTE8(v24),
    v25,
    *((uint64_t *)&v25 + 1),
    v26,
    *((uint64_t *)&v26 + 1),
    v27,
    *((uint64_t *)&v27 + 1),
    v28,
    *((uint64_t *)&v28 + 1),
    v29,
    SBYTE8(v29),
    v30,
    *((uint64_t *)&v30 + 1),
    v31,
    *((uint64_t *)&v31 + 1),
    v32,
    *((uint64_t *)&v32 + 1),
    v33,
    *((uint64_t *)&v33 + 1),
    v47,
    v48,
    v50,
    SHIBYTE(v50),
    v51);
  return a1;
}

uint64_t _s21BridgeWidgetExtension28SetupLiveActivityContentViewVwet_0(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 435)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 434);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t _s21BridgeWidgetExtension28SetupLiveActivityContentViewVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 424) = 0;
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 434) = 0;
    *(_WORD *)(result + 432) = 0;
    *(_OWORD *)(result + 408) = 0u;
    *(_OWORD *)(result + 392) = 0u;
    *(_OWORD *)(result + 376) = 0u;
    *(_OWORD *)(result + 360) = 0u;
    *(_OWORD *)(result + 344) = 0u;
    *(_OWORD *)(result + 328) = 0u;
    *(_OWORD *)(result + 312) = 0u;
    *(_OWORD *)(result + 296) = 0u;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(void *)double result = a2 - 255;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 435) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 435) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 434) = -(char)a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SetupLiveActivityTextContent()
{
  return &type metadata for SetupLiveActivityTextContent;
}

unint64_t sub_100010708()
{
  unint64_t result = qword_100018430;
  if (!qword_100018430)
  {
    sub_100003CE0(&qword_100018388);
    sub_1000107A8();
    sub_1000040E4(&qword_100018468, &qword_100018380);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018430);
  }
  return result;
}

unint64_t sub_1000107A8()
{
  unint64_t result = qword_100018438;
  if (!qword_100018438)
  {
    sub_100003CE0(&qword_100018440);
    sub_1000040E4(&qword_100018448, &qword_100018450);
    sub_1000040E4(&qword_100018458, &qword_100018460);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018438);
  }
  return result;
}

unint64_t sub_100010870()
{
  unint64_t result = qword_100018470;
  if (!qword_100018470)
  {
    sub_100003CE0(&qword_100018478);
    sub_1000040E4(&qword_100018480, &qword_100018488);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018470);
  }
  return result;
}

uint64_t sub_100010910()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_10001092C(uint64_t a1)
{
  unint64_t result = sub_100010954();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_100010954()
{
  unint64_t result = qword_100018490;
  if (!qword_100018490)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018490);
  }
  return result;
}

uint64_t sub_1000109A8(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, int))
{
  BYTE2(v16) = *(unsigned char *)(a1 + 434);
  LOWORD(v16) = *(_WORD *)(a1 + 432);
  long long v14 = *(_OWORD *)(a1 + 384);
  long long v15 = *(_OWORD *)(a1 + 400);
  long long v12 = *(_OWORD *)(a1 + 352);
  long long v13 = *(_OWORD *)(a1 + 368);
  long long v10 = *(_OWORD *)(a1 + 320);
  long long v11 = *(_OWORD *)(a1 + 336);
  long long v8 = *(_OWORD *)(a1 + 288);
  long long v9 = *(_OWORD *)(a1 + 304);
  long long v6 = *(_OWORD *)(a1 + 256);
  long long v7 = *(_OWORD *)(a1 + 272);
  long long v4 = *(_OWORD *)(a1 + 224);
  long long v5 = *(_OWORD *)(a1 + 240);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    *(void *)(a1 + 160),
    *(void *)(a1 + 168),
    *(void *)(a1 + 176),
    *(void *)(a1 + 184),
    *(void *)(a1 + 192),
    *(void *)(a1 + 200),
    *(void *)(a1 + 208),
    *(void *)(a1 + 216),
    v4,
    *((void *)&v4 + 1),
    v5,
    *((void *)&v5 + 1),
    v6,
    *((void *)&v6 + 1),
    v7,
    *((void *)&v7 + 1),
    v8,
    *((void *)&v8 + 1),
    v9,
    *((void *)&v9 + 1),
    v10,
    *((void *)&v10 + 1),
    v11,
    *((void *)&v11 + 1),
    v12,
    *((void *)&v12 + 1),
    v13,
    *((void *)&v13 + 1),
    v14,
    *((void *)&v14 + 1),
    v15,
    *((void *)&v15 + 1),
    *(void *)(a1 + 416),
    *(void *)(a1 + 424),
    v16);
  return a1;
}

uint64_t sub_100010A64@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100010F40();
  *a1 = result;
  return result;
}

uint64_t sub_100010A90()
{
  return sub_100010F50();
}

uint64_t sub_100010AB8@<X0>(void *a1@<X8>)
{
  uint64_t result = sub_100010F20();
  *a1 = v3;
  return result;
}

uint64_t sub_100010AE4()
{
  return sub_100010F30();
}

uint64_t sub_100010B0C(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_1000078D0(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_100010B50(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_1000078E0(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_100010B98()
{
  unint64_t result = qword_100018498;
  if (!qword_100018498)
  {
    sub_100003CE0(&qword_1000184A0);
    sub_1000040E4(&qword_1000184A8, &qword_1000184B0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100018498);
  }
  return result;
}

uint64_t sub_100010C3C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_100010C70()
{
  return static AppIntent.openAppWhenRun.getter();
}

uint64_t sub_100010C80()
{
  return static AppIntent.description.getter();
}

uint64_t sub_100010C90()
{
  return static AppIntent.isDiscoverable.getter();
}

uint64_t sub_100010CA0()
{
  return static AppIntent.parameterSummary.getter();
}

uint64_t sub_100010CB0()
{
  return static AppIntent.authenticationPolicy.getter();
}

uint64_t sub_100010CD0()
{
  return static IntentResult.result<>()();
}

uint64_t sub_100010CE0()
{
  return LocalizedStringResource.init(stringLiteral:)();
}

uint64_t sub_100010CF0()
{
  return type metadata accessor for LocalizedStringResource();
}

uint64_t sub_100010D00()
{
  return type metadata accessor for URL.DirectoryHint();
}

uint64_t sub_100010D10()
{
  return URL.init(filePath:directoryHint:relativeTo:)();
}

uint64_t sub_100010D20()
{
  return type metadata accessor for URL();
}

uint64_t sub_100010D30()
{
  return Data.init(contentsOf:options:)();
}

NSData sub_100010D40()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_100010D50()
{
  return LiveActivitySetupState.init(textMap:imageMap:metadata:shouldSuppressAlert:)();
}

uint64_t sub_100010D60()
{
  return LiveActivityImageSource.defaultSystemImageName.unsafeMutableAddressor();
}

uint64_t sub_100010D70()
{
  return LiveActivityImageSource.systemAppleWatchSFSymbol.unsafeMutableAddressor();
}

uint64_t sub_100010D80()
{
  return LiveActivitySetupLogger.unsafeMutableAddressor();
}

uint64_t sub_100010D90()
{
  return type metadata accessor for LiveActivitySetupAttributes();
}

uint64_t sub_100010DA0()
{
  return LiveActivityText.init(title:subtitle:)();
}

uint64_t sub_100010DB0()
{
  return LiveActivityImages.init(leadingImageSource:trailingImageSource:)();
}

uint64_t sub_100010DC0()
{
  return LiveActivityTextMap.init(dynamicIslandExpanded:lockScreen:)();
}

uint64_t sub_100010DD0()
{
  return LiveActivityTextMap.subscript.getter();
}

uint64_t sub_100010DE0()
{
  return LiveActivityImageMap.init(dynamicIslandCompact:dynamicIslandMinimal:dynamicIslandExpanded:lockScreen:)();
}

uint64_t sub_100010DF0()
{
  return LiveActivityImageMap.subscript.getter();
}

uint64_t sub_100010E00()
{
  return LiveActivityPlacement.imageHeight.getter();
}

uint64_t sub_100010E10()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_100010E20()
{
  return Logger.logObject.getter();
}

uint64_t sub_100010E30()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100010E40()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100010E50()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_100010E60()
{
  return type metadata accessor for ColorScheme();
}

uint64_t sub_100010E80()
{
  return static WidgetBundle.main()();
}

uint64_t sub_100010E90()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_100010EA0()
{
  return GeometryProxy.size.getter();
}

uint64_t sub_100010EB0()
{
  return static EnvironmentKey._valuesEqual(_:_:)();
}

uint64_t sub_100010EC0()
{
  return type metadata accessor for LayoutDirection();
}

uint64_t sub_100010ED0()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t sub_100010EE0()
{
  return EnvironmentValues.colorScheme.getter();
}

uint64_t sub_100010EF0()
{
  return EnvironmentValues.colorScheme.setter();
}

uint64_t sub_100010F00()
{
  return EnvironmentValues.layoutDirection.getter();
}

uint64_t sub_100010F10()
{
  return EnvironmentValues.layoutDirection.setter();
}

uint64_t sub_100010F20()
{
  return EnvironmentValues.minimumScaleFactor.getter();
}

uint64_t sub_100010F30()
{
  return EnvironmentValues.minimumScaleFactor.setter();
}

uint64_t sub_100010F40()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t sub_100010F50()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_100010F60()
{
  return EnvironmentValues.init()();
}

uint64_t sub_100010F70()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t sub_100010F80()
{
  return EnvironmentValues.subscript.getter();
}

uint64_t sub_100010F90()
{
  return EnvironmentValues.subscript.setter();
}

uint64_t sub_100010FA0()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_100010FB0()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_100010FC0()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_100010FD0()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_100010FE0()
{
  return WidgetConfiguration.description(_:)();
}

uint64_t sub_100010FF0()
{
  return WidgetConfiguration.showsInControlCenter()();
}

uint64_t sub_100011000()
{
  return WidgetConfiguration.configurationDisplayName(_:)();
}

uint64_t sub_100011010()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_100011020()
{
  return type metadata accessor for _IndefiniteSymbolEffectModifier();
}

uint64_t sub_100011030()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_100011040()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_100011050()
{
  return static Edge.Set.leading.getter();
}

uint64_t sub_100011060()
{
  return static Edge.Set.vertical.getter();
}

uint64_t sub_100011070()
{
  return static Font.subheadline.getter();
}

uint64_t sub_100011080()
{
  return type metadata accessor for Font.Design();
}

uint64_t sub_100011090()
{
  return static Font.Weight.bold.getter();
}

uint64_t sub_1000110A0()
{
  return static Font.system(size:weight:design:)();
}

uint64_t sub_1000110B0()
{
  return static Font.headline.getter();
}

uint64_t sub_1000110C0()
{
  return Text.fontWeight(_:)();
}

uint64_t sub_1000110D0()
{
  return Text.foregroundColor(_:)();
}

uint64_t sub_1000110E0()
{
  return Text.font(_:)();
}

uint64_t sub_1000110F0()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_100011100()
{
  return Text.init<A>(_:)();
}

uint64_t sub_100011110()
{
  return View.dynamicIsland(verticalPlacement:)();
}

uint64_t sub_100011120()
{
  return View.activityBackgroundTint(_:)();
}

uint64_t sub_100011130()
{
  return View.activitySystemActionForegroundColor(_:)();
}

uint64_t sub_100011140()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_100011150()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_100011160()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100011170()
{
  return static Color.gray.getter();
}

uint64_t sub_100011180()
{
  return static Color.black.getter();
}

uint64_t sub_100011190()
{
  return static Color.clear.getter();
}

uint64_t sub_1000111A0()
{
  return static Color.white.getter();
}

uint64_t sub_1000111B0()
{
  return static Color.orange.getter();
}

uint64_t sub_1000111C0()
{
  return Color.opacity(_:)();
}

uint64_t sub_1000111D0()
{
  return static Color.primary.getter();
}

uint64_t sub_1000111E0()
{
  return static Color.secondary.getter();
}

uint64_t sub_1000111F0()
{
  return Image.init(uiImage:)();
}

uint64_t sub_100011200()
{
  return Image.init(systemName:)();
}

uint64_t sub_100011210()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t sub_100011220()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t sub_100011230()
{
  return Image.init(_:bundle:)();
}

uint64_t sub_100011240()
{
  return Label<>.init(_:systemImage:)();
}

uint64_t sub_100011250()
{
  return ForEach<>.init(_:id:content:)();
}

uint64_t sub_100011260()
{
  return static Alignment.center.getter();
}

uint64_t sub_100011270()
{
  return static Alignment.leading.getter();
}

uint64_t sub_100011280()
{
  return static UnitPoint.center.getter();
}

uint64_t sub_100011290()
{
  return dispatch thunk of SymbolEffect.configuration.getter();
}

uint64_t sub_1000112A0()
{
  return WiggleSymbolEffect.clockwise.getter();
}

uint64_t sub_1000112B0()
{
  return WiggleSymbolEffect.init()();
}

uint64_t sub_1000112C0()
{
  return type metadata accessor for WiggleSymbolEffect();
}

uint64_t sub_1000112D0()
{
  return SymbolEffectOptions.speed(_:)();
}

uint64_t sub_1000112E0()
{
  return static SymbolEffectOptions.repeat(_:)();
}

uint64_t sub_1000112F0()
{
  return type metadata accessor for SymbolEffectOptions();
}

uint64_t sub_100011300()
{
  return VariableColorSymbolEffect.cumulative.getter();
}

uint64_t sub_100011310()
{
  return VariableColorSymbolEffect.dimInactiveLayers.getter();
}

uint64_t sub_100011320()
{
  return VariableColorSymbolEffect.reversing.getter();
}

uint64_t sub_100011330()
{
  return VariableColorSymbolEffect.init()();
}

uint64_t sub_100011340()
{
  return type metadata accessor for VariableColorSymbolEffect();
}

uint64_t sub_100011350()
{
  return static ControlSize._1x1.getter();
}

uint64_t sub_100011360()
{
  return type metadata accessor for ControlSize();
}

uint64_t sub_100011370()
{
  return ControlButton.init<A, B>(kind:intent:displayName:preferredSize:title:subtitle:affordances:)();
}

uint64_t sub_100011380()
{
  return ControlButton.disabled(_:)();
}

uint64_t sub_100011390()
{
  return DynamicIsland.init<A, B, C, D>(expanded:compactLeading:compactTrailing:minimal:)();
}

uint64_t sub_1000113A0()
{
  return ControlAffordances.init(tint:status:actionHint:)();
}

uint64_t sub_1000113B0()
{
  return ActivityViewContext.state.getter();
}

uint64_t sub_1000113C0()
{
  return ActivityConfiguration.init<A>(for:content:dynamicIsland:)();
}

uint64_t sub_1000113D0()
{
  return DynamicIslandExpandedRegion._viewRepresentation.getter();
}

uint64_t sub_1000113E0()
{
  return DynamicIslandExpandedRegion.init(_:priority:content:)();
}

uint64_t sub_1000113F0()
{
  return DynamicIslandExpandedContent.init(content:)();
}

uint64_t sub_100011400()
{
  return static DynamicIslandExpandedRegionPosition.bottom.getter();
}

uint64_t sub_100011410()
{
  return type metadata accessor for DynamicIslandExpandedRegionPosition();
}

uint64_t sub_100011420()
{
  return static DynamicIslandExpandedRegionVerticalPlacement.belowIfTooWide.getter();
}

uint64_t sub_100011430()
{
  return type metadata accessor for DynamicIslandExpandedRegionVerticalPlacement();
}

NSString sub_100011440()
{
  return String._bridgeToObjectiveC()();
}

Swift::Int sub_100011450()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100011460()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100011470()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_100011480()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100011490()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_1000114A0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_1000114B0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_1000114C0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_1000114D0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000114E0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_1000114F0()
{
  return Error.localizedDescription.getter();
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

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
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

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}