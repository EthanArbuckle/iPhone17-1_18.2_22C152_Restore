uint64_t sub_1BD0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v6;

  v3[2] = a2;
  v3[3] = v2;
  v4 = sub_37D90();
  v3[4] = v4;
  v3[5] = *(void *)(v4 - 8);
  v3[6] = swift_task_alloc();
  return _swift_task_switch(sub_1C90, 0, 0);
}

uint64_t sub_1C90()
{
  sub_23A4(*(void **)(v0 + 16), *(void *)(*(void *)(v0 + 16) + 24));
  *(void *)(v0 + 56) = sub_377B0();
  *(void *)(v0 + 64) = v1;
  *(void *)(v0 + 72) = swift_getObjectType();
  uint64_t v3 = sub_37F40();
  return _swift_task_switch(sub_1D40, v3, v2);
}

uint64_t sub_1D40()
{
  sub_29C8C();
  *(unsigned char *)(v0 + 80) = v1;
  swift_unknownObjectRelease();
  return _swift_task_switch(sub_1DB8, 0, 0);
}

uint64_t sub_1DB8()
{
  if (qword_4CD38 != -1) {
    swift_once();
  }
  char v1 = *(unsigned char *)(v0 + 80);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v2 = *(void *)(v0 + 48);
  uint64_t v5 = *(void *)(v0 + 24);
  uint64_t v4 = *(void *)(v0 + 32);
  uint64_t v6 = sub_23E8(v4, (uint64_t)static Log.suggestions);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v6, v4);
  sub_38020(27);
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(v5 + 16);
  v8 = *(void **)(v5 + 24);
  swift_bridgeObjectRetain();
  v17._countAndFlagsBits = v7;
  v17._object = v8;
  sub_37E70(v17);
  swift_bridgeObjectRelease();
  v9 = (void *)0xE400000000000000;
  v18._countAndFlagsBits = 544175136;
  v18._object = (void *)0xE400000000000000;
  sub_37E70(v18);
  if (v1) {
    v10._countAndFlagsBits = 1702195828;
  }
  else {
    v10._countAndFlagsBits = 0x65736C6166;
  }
  if ((v1 & 1) == 0) {
    v9 = (void *)0xE500000000000000;
  }
  v10._object = v9;
  sub_37E70(v10);
  swift_bridgeObjectRelease();
  v11._countAndFlagsBits = 0xD000000000000013;
  v12._countAndFlagsBits = 0xD00000000000008BLL;
  v12._object = (void *)0x800000000003A8A0;
  v11._object = (void *)0x800000000003A880;
  Logger.debug(output:test:caller:)(v11, 0, v12);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  sub_2420(&qword_4CEF0);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_385B0;
  *(void *)(v13 + 56) = &type metadata for Bool;
  *(unsigned char *)(v13 + 32) = v1 & 1;
  swift_task_dealloc();
  v14 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v14(v13);
}

uint64_t sub_1FD4()
{
  swift_bridgeObjectRelease();
  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for HasTargetedMoreThanOneEntityResolver()
{
  return self;
}

uint64_t sub_2030()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_37C30();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for SuggestionParameter.hasTargetedMoreThanOneEntity(_:), v2);
  uint64_t v6 = sub_37C20();
  uint64_t v8 = v7;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *(void *)(v1 + 16) = v6;
  *(void *)(v1 + 24) = v8;
  return v1;
}

uint64_t sub_2130()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_2164(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_21FC;
  return sub_1BD0((uint64_t)v4, a2);
}

uint64_t sub_21FC(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t sub_22FC()
{
  return sub_2364((unint64_t *)&unk_4CED0);
}

uint64_t sub_2330()
{
  return sub_2364(&qword_4CEE0);
}

uint64_t sub_2364(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for HasTargetedMoreThanOneEntityResolver();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void *sub_23A4(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_23E8(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_2420(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void sub_2464()
{
  unk_4CF07 = -18;
}

uint64_t sub_2494()
{
  sub_37940();
  uint64_t v0 = sub_37750();
  v3[3] = v0;
  v3[4] = sub_3E04(&qword_4CFD8, 255, (void (*)(uint64_t))&type metadata accessor for CoreSignalTypes);
  uint64_t v1 = sub_3C6C(v3);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v0 - 8) + 104))(v1, enum case for CoreSignalTypes.app(_:), v0);
  if (qword_4CC48 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_37910();
  qword_50890 = result;
  return result;
}

uint64_t sub_25BC(uint64_t a1, uint64_t a2)
{
  v3[13] = a2;
  v3[14] = v2;
  v3[12] = a1;
  return _swift_task_switch(sub_25E0, v2, 0);
}

uint64_t sub_25E0()
{
  if (qword_4CD38 != -1) {
    swift_once();
  }
  uint64_t v1 = (void *)v0[12];
  uint64_t v2 = sub_37D90();
  sub_23E8(v2, (uint64_t)static Log.suggestions);
  v3._countAndFlagsBits = 0xD00000000000007ALL;
  v4._object = (void *)0x800000000003A990;
  v3._object = (void *)0x800000000003A9B0;
  v4._countAndFlagsBits = 0xD00000000000001ALL;
  Logger.debug(output:test:caller:)(v4, 0, v3);
  sub_23A4(v1, v1[3]);
  uint64_t v5 = (void *)sub_376E0();
  if (qword_4CC48 != -1) {
    swift_once();
  }
  uint64_t v6 = v0[13];
  char v7 = sub_2868(qword_4CEF8, unk_4CF00, v5);
  swift_bridgeObjectRelease();
  sub_3BB8(v6, (uint64_t)(v0 + 2));
  if (v7)
  {
    sub_3C1C((uint64_t)(v0 + 2));
  }
  else
  {
    sub_23A4(v0 + 2, v0[5]);
    uint64_t v8 = (void *)sub_377C0();
    char v9 = sub_2868(qword_4CEF8, unk_4CF00, v8);
    swift_bridgeObjectRelease();
    sub_3C1C((uint64_t)(v0 + 2));
    if ((v9 & 1) == 0)
    {
      uint64_t v10 = &_swiftEmptyArrayStorage;
      goto LABEL_12;
    }
  }
  sub_3BB8(v0[13], (uint64_t)(v0 + 7));
  sub_2930((uint64_t)(v0 + 7));
  sub_3D60((uint64_t)(v0 + 7), &qword_4CFC8);
  sub_2420(&qword_4CFD0);
  uint64_t v10 = (_OWORD *)swift_allocObject();
  v10[1] = xmmword_386B0;
  if (qword_4CC50 != -1) {
    swift_once();
  }
  *((void *)v10 + 4) = qword_50890;
  sub_37F00();
  swift_retain();
LABEL_12:
  Swift::String v11 = (uint64_t (*)(_OWORD *))v0[1];
  return v11(v10);
}

uint64_t sub_2868(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_38150();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  char v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_38150() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return result;
}

void sub_2930(uint64_t a1)
{
  v43[1] = *v1;
  uint64_t v3 = sub_37D90();
  uint64_t v45 = *(void *)(v3 - 8);
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v6 = (char *)v43 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)v43 - v7;
  if (qword_4CD38 != -1) {
    swift_once();
  }
  uint64_t v9 = sub_23E8(v3, (uint64_t)static Log.suggestions);
  unint64_t v44 = (unint64_t)"Extracting home signals...";
  sub_3F44();
  Logger.debug(output:test:caller:)(v10, v11, v12);
  sub_37AD0();
  uint64_t v13 = (void *)sub_37AC0();
  int v14 = sub_37AA0();

  if (v14 == 2)
  {
    sub_3F44();
    Logger.warning(output:test:file:function:line:)(v15, v16, v17, v18, 34);
    return;
  }
  v19 = (void *)sub_37AC0();
  unint64_t v20 = sub_37AB0();

  unint64_t v21 = v20 >> 62;
  if (v20 >> 62)
  {
    sub_3EE8();
    uint64_t v22 = sub_380F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v22 = *(void *)((char *)&dword_10 + (v20 & 0xFFFFFFFFFFFFFF8));
  }
  if (v22 != 1)
  {
    sub_3CD0(a1, (uint64_t)&v49);
    if (v50)
    {
      sub_23A4(&v49, v50);
      uint64_t v28 = sub_377D0();
      sub_3C1C((uint64_t)&v49);
    }
    else
    {
      sub_3D60((uint64_t)&v49, &qword_4CFC8);
      uint64_t v28 = 0;
    }
    uint64_t v30 = sub_2F4C(v28);
    swift_bridgeObjectRelease();
    if (v30)
    {
      swift_bridgeObjectRelease();
      uint64_t v31 = sub_3EC4();
      v32(v31);
      v49._countAndFlagsBits = 0;
      v49._object = (void *)0xE000000000000000;
      swift_retain();
      sub_38020(38);
      swift_bridgeObjectRelease();
      sub_3F04(0xD000000000000024);
      uint64_t v33 = sub_37CD0();
      uint64_t v35 = v34;
      swift_release();
      uint64_t v47 = v33;
      uint64_t v48 = v35;
      sub_2420(&qword_4CFE0);
      v52._countAndFlagsBits = sub_37E00();
      sub_37E70(v52);
      swift_bridgeObjectRelease();
      sub_3E94();
      swift_release();
    }
    else
    {
      v36 = (void *)sub_37AC0();
      uint64_t v30 = sub_37A90();

      if (!v30)
      {
        if (v21)
        {
          sub_3EE8();
          uint64_t v42 = sub_380F0();
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v42 = *(void *)((char *)&dword_10 + (v20 & 0xFFFFFFFFFFFFFF8));
        }
        if (v42)
        {
          if ((v20 & 0xC000000000000001) != 0) {
            goto LABEL_39;
          }
          if (*(void *)((char *)&dword_10 + (v20 & 0xFFFFFFFFFFFFFF8))) {
            goto LABEL_21;
          }
          __break(1u);
        }
LABEL_36:
        swift_bridgeObjectRelease();
        uint64_t v30 = 0;
        goto LABEL_37;
      }
      swift_bridgeObjectRelease();
      uint64_t v37 = sub_3EC4();
      v38(v37);
      sub_3F24();
      swift_bridgeObjectRelease();
      sub_3F04(0xD000000000000013);
      uint64_t v39 = sub_37CD0();
      v41 = v40;
      swift_release();
      v53._countAndFlagsBits = v39;
      v53._object = v41;
      sub_37E70(v53);
      swift_bridgeObjectRelease();
      sub_3E94();
    }
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v6, v3);
    goto LABEL_37;
  }
  uint64_t v23 = v45;
  (*(void (**)(char *, uint64_t, uint64_t))(v45 + 16))(v8, v9, v3);
  sub_3F24();
  swift_bridgeObjectRelease();
  v49._countAndFlagsBits = 0xD000000000000013;
  v49._object = (void *)0x800000000003AB00;
  if (v21)
  {
    sub_3EE8();
    uint64_t v24 = sub_380F0();
    if (v24) {
      goto LABEL_10;
    }
LABEL_17:
    swift_bridgeObjectRelease();
    uint64_t v25 = 0;
    uint64_t v27 = 0;
    goto LABEL_18;
  }
  uint64_t v24 = *(void *)((char *)&dword_10 + (v20 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  if (!v24) {
    goto LABEL_17;
  }
LABEL_10:
  if ((v20 & 0xC000000000000001) != 0)
  {
    sub_38040();
  }
  else
  {
    if (!*(void *)((char *)&dword_10 + (v20 & 0xFFFFFFFFFFFFFF8)))
    {
      __break(1u);
      goto LABEL_42;
    }
    swift_retain();
  }
  swift_bridgeObjectRelease();
  uint64_t v25 = sub_37CD0();
  uint64_t v27 = v26;
  swift_release();
LABEL_18:
  uint64_t v47 = v25;
  uint64_t v48 = v27;
  sub_2420(&qword_4CFE0);
  v51._countAndFlagsBits = sub_37E00();
  sub_37E70(v51);
  swift_bridgeObjectRelease();
  v29._object = (void *)(v44 | 0x8000000000000000);
  v29._countAndFlagsBits = 0xD00000000000007ALL;
  Logger.debug(output:test:caller:)(v49, 0, v29);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v3);
  if (!v24) {
    goto LABEL_36;
  }
  if ((v20 & 0xC000000000000001) != 0)
  {
LABEL_39:
    uint64_t v30 = sub_38040();
    goto LABEL_22;
  }
  if (*(void *)((char *)&dword_10 + (v20 & 0xFFFFFFFFFFFFFF8)))
  {
LABEL_21:
    uint64_t v30 = *(void *)(v20 + 32);
    swift_retain();
LABEL_22:
    swift_bridgeObjectRelease();
LABEL_37:
    *(void *)(v46 + 112) = v30;
    swift_release();
    return;
  }
LABEL_42:
  __break(1u);
}

uint64_t sub_2F4C(uint64_t a1)
{
  uint64_t v2 = sub_377A0();
  uint64_t v3 = *(char **)(v2 - 8);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  Swift::String v53 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v54 = (char *)&v45 - v6;
  uint64_t v62 = sub_37740();
  uint64_t v60 = *(void *)(v62 - 8);
  uint64_t v7 = __chkstk_darwin(v62);
  v61 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  Swift::String v52 = (char *)&v45 - v9;
  uint64_t v10 = sub_2420(&qword_4CFE8);
  __chkstk_darwin(v10 - 8);
  Swift::String v12 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_37690();
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  Swift::Bool v16 = (char *)&v45 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  Swift::String v17 = (void (**)(char *, void, uint64_t))sub_37D90();
  Swift::String v18 = (char *)*(v17 - 1);
  __chkstk_darwin(v17);
  uint64_t v20 = (uint64_t)&v45 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1) {
    return 0;
  }
  uint64_t v55 = *(void *)(a1 + 16);
  if (!v55) {
    return 0;
  }
  uint64_t v50 = v12;
  uint64_t v45 = v16;
  uint64_t v46 = v14;
  uint64_t v51 = v13;
  if (qword_4CD38 != -1) {
LABEL_20:
  }
    swift_once();
  uint64_t v21 = sub_23E8((uint64_t)v17, (uint64_t)static Log.suggestions);
  uint64_t v22 = (void (*)(uint64_t))*((void *)v18 + 2);
  uint64_t v48 = v21;
  v22(v20);
  v67._countAndFlagsBits = 0;
  v67._object = (void *)0xE000000000000000;
  sub_38020(42);
  swift_bridgeObjectRelease();
  v67._countAndFlagsBits = 0xD000000000000028;
  v67._object = (void *)0x800000000003AB20;
  v68._countAndFlagsBits = sub_37EF0();
  sub_37E70(v68);
  swift_bridgeObjectRelease();
  unint64_t v47 = (unint64_t)"Extracting home signals...";
  v23._object = (void *)0x800000000003A9B0;
  v23._countAndFlagsBits = 0xD00000000000007ALL;
  Logger.debug(output:test:caller:)(v67, 0, v23);
  swift_bridgeObjectRelease();
  (*((void (**)(uint64_t, void (**)(char *, void, uint64_t)))v18 + 1))(v20, v17);
  uint64_t v58 = a1 + ((*(unsigned __int8 *)(v60 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v60 + 80));
  uint64_t v57 = v60 + 16;
  unsigned int v56 = enum case for SalientEntityType.activeHome(_:);
  Swift::String v17 = (void (**)(char *, void, uint64_t))(v3 + 104);
  Swift::String v18 = v3 + 8;
  v59 = (void (**)(char *, uint64_t))(v60 + 8);
  uint64_t v49 = a1;
  swift_bridgeObjectRetain();
  uint64_t v24 = 0;
  uint64_t v3 = v53;
  uint64_t v25 = v54;
  while (1)
  {
    a1 = v24 + 1;
    if (__OFADD__(v24, 1))
    {
      __break(1u);
      goto LABEL_20;
    }
    (*(void (**)(char *, uint64_t, uint64_t))(v60 + 16))(v61, v58 + *(void *)(v60 + 72) * v24, v62);
    sub_37720();
    (*v17)(v3, v56, v2);
    sub_3E04(&qword_4CFF0, 255, (void (*)(uint64_t))&type metadata accessor for SalientEntityType);
    sub_37EB0();
    sub_37EB0();
    if (v65 == v63 && v66 == v64) {
      break;
    }
    uint64_t v20 = sub_38150();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v27 = *(void (**)(char *, uint64_t))v18;
    (*(void (**)(char *, uint64_t))v18)(v3, v2);
    v27(v25, v2);
    if (v20) {
      goto LABEL_14;
    }
    (*v59)(v61, v62);
    ++v24;
    if (a1 == v55)
    {
      swift_bridgeObjectRelease();
      uint64_t v28 = (uint64_t)v50;
      sub_3D38((uint64_t)v50, 1, 1, v51);
      goto LABEL_15;
    }
  }
  swift_bridgeObjectRelease_n();
  Swift::String v29 = *(void (**)(char *, uint64_t))v18;
  (*(void (**)(char *, uint64_t))v18)(v3, v2);
  v29(v25, v2);
LABEL_14:
  swift_bridgeObjectRelease();
  uint64_t v30 = v60 + 32;
  uint64_t v31 = v52;
  uint64_t v32 = v62;
  (*(void (**)(char *, char *, uint64_t))(v60 + 32))(v52, v61, v62);
  sub_37730();
  (*(void (**)(char *, uint64_t))(v30 - 24))(v31, v32);
  sub_2420(&qword_4CFF8);
  uint64_t v28 = (uint64_t)v50;
  uint64_t v33 = v51;
  int v34 = swift_dynamicCast();
  sub_3D38(v28, v34 ^ 1u, 1, v33);
  if (sub_3DBC(v28, 1, v33) == 1)
  {
LABEL_15:
    sub_3D60(v28, &qword_4CFE8);
    v35._countAndFlagsBits = 0xD00000000000001ALL;
    v35._object = (void *)0x800000000003AB50;
    v36._object = (void *)(v47 | 0x8000000000000000);
    v36._countAndFlagsBits = 0xD00000000000007ALL;
    Logger.debug(output:test:caller:)(v35, 0, v36);
    return 0;
  }
  uint64_t v39 = v46;
  v40 = v45;
  (*(void (**)(char *, uint64_t, uint64_t))(v46 + 32))(v45, v28, v33);
  v67._countAndFlagsBits = 0;
  v67._object = (void *)0xE000000000000000;
  sub_38020(19);
  v69._countAndFlagsBits = 0xD000000000000011;
  v69._object = (void *)0x800000000003AB70;
  sub_37E70(v69);
  sub_380B0();
  v41._object = (void *)(v47 | 0x8000000000000000);
  v41._countAndFlagsBits = 0xD00000000000007ALL;
  Logger.debug(output:test:caller:)(v67, 0, v41);
  swift_bridgeObjectRelease();
  sub_37AD0();
  uint64_t v42 = (void *)sub_37AC0();
  unint64_t v43 = sub_37AB0();

  __chkstk_darwin(v44);
  *(&v45 - 2) = v40;
  uint64_t v37 = sub_37C8((uint64_t (*)(uint64_t *))sub_3DE4, (uint64_t)(&v45 - 4), v43);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v39 + 8))(v40, v33);
  return v37;
}

uint64_t sub_37C8(uint64_t (*a1)(uint64_t *), uint64_t a2, unint64_t a3)
{
  if (a3 >> 62) {
    goto LABEL_16;
  }
  uint64_t v6 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  for (; v6; uint64_t v6 = sub_380F0())
  {
    uint64_t v7 = 4;
    while (1)
    {
      if ((a3 & 0xC000000000000001) != 0)
      {
        uint64_t v8 = sub_38040();
      }
      else
      {
        uint64_t v8 = *(void *)(a3 + 8 * v7);
        swift_retain();
      }
      uint64_t v9 = v7 - 3;
      if (__OFADD__(v7 - 4, 1)) {
        break;
      }
      uint64_t v12 = v8;
      char v10 = a1(&v12);
      if (v3)
      {
        swift_bridgeObjectRelease();
        swift_release();
        return v8;
      }
      if (v10)
      {
        swift_bridgeObjectRelease();
        return v8;
      }
      swift_release();
      ++v7;
      if (v9 == v6) {
        goto LABEL_11;
      }
    }
    __break(1u);
LABEL_16:
    swift_bridgeObjectRetain();
  }
LABEL_11:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_38FC()
{
  uint64_t v0 = sub_37CD0();
  uint64_t v2 = v1;
  if (v0 == sub_37680() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_38150();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_3998()
{
  swift_release();
  swift_defaultActor_destroy();
  return _swift_defaultActor_deallocate(v0);
}

uint64_t type metadata accessor for HomeAutomationSignalExtractor()
{
  return self;
}

uint64_t sub_39F4()
{
  return v0;
}

uint64_t sub_3A00()
{
  return sub_39F4();
}

uint64_t sub_3A1C(uint64_t a1, uint64_t a2)
{
  char v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *char v5 = v2;
  v5[1] = sub_21FC;
  return sub_25BC(a1, a2);
}

uint64_t sub_3AC4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_3E04(&qword_4D000, a2, (void (*)(uint64_t))type metadata accessor for HomeAutomationSignalExtractor);
  return SignalExtractor.description.getter(a1, v3);
}

uint64_t sub_3B30(uint64_t a1, uint64_t a2)
{
  return sub_3E04((unint64_t *)&unk_4CFB0, a2, (void (*)(uint64_t))type metadata accessor for HomeAutomationSignalExtractor);
}

uint64_t sub_3B78()
{
  type metadata accessor for HomeAutomationSignalExtractor();
  uint64_t v0 = swift_allocObject();
  uint64_t result = swift_defaultActor_initialize();
  *(void *)(v0 + 112) = 0;
  qword_50898 = v0;
  return result;
}

uint64_t sub_3BB8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_3C1C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t *sub_3C6C(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_3CD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2420(&qword_4CFC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_3D38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_3D60(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_2420(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_3DBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_3DE4()
{
  return sub_38FC() & 1;
}

uint64_t sub_3E04(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_3E50(unint64_t result, char a2, uint64_t a3)
{
  if (a2)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(void *)(a3 + 16) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

unint64_t sub_3E70(unint64_t result, char a2, uint64_t a3)
{
  if (a2)
  {
    if ((result & 0x8000000000000000) != 0)
    {
      __break(1u);
    }
    else if (*(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8)) > result)
    {
      return result;
    }
    __break(1u);
  }
  return result;
}

void sub_3E94()
{
  uint64_t v2 = *(void *)(v0 - 120);
  unint64_t v3 = *(void *)(v0 - 160) | 0x8000000000000000;
  uint64_t v4 = *(void *)(v0 - 112);
  unint64_t v5 = 0xD00000000000007ALL;
  Logger.debug(output:test:caller:)(*(Swift::String *)&v2, 0, *(Swift::String *)&v5);
}

uint64_t sub_3EC4()
{
  return v0;
}

uint64_t sub_3EE8()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_3F04@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v2 - 120) = a1;
  *(void *)(v2 - 112) = (v1 - 32) | 0x8000000000000000;
  return swift_retain();
}

void sub_3F24()
{
  *(void *)(v0 - 120) = 0;
  *(void *)(v0 - 112) = 0xE000000000000000;
  sub_38020(21);
}

uint64_t static UnitSemantic.< infix(_:_:)(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0xD000000000000011;
  unint64_t v3 = (unint64_t)"percent";
  unint64_t v4 = 0x8000000000039DF0;
  uint64_t v5 = a1;
  uint64_t v6 = 0xD000000000000011;
  switch(v5)
  {
    case 1:
      unint64_t v4 = 0x737569736C65;
      uint64_t v6 = sub_47EC() & 0xFFFFFFFFFFFFLL | 0x4373000000000000;
      break;
    case 2:
      break;
    case 3:
      unint64_t v4 = 0x636972656E65;
      uint64_t v6 = sub_47EC() & 0xFFFFFFFFFFFFLL | 0x4773000000000000;
      break;
    default:
      unint64_t v4 = 0xE700000000000000;
      uint64_t v6 = 0x746E6563726570;
      break;
  }
  unint64_t v7 = v3 | 0x8000000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v7 = 0x737569736C65;
      sub_4800();
      uint64_t v2 = v8 & 0xFFFFFFFFFFFFLL | 0x4373000000000000;
      break;
    case 2:
      break;
    case 3:
      unint64_t v7 = 0x636972656E65;
      sub_4800();
      uint64_t v2 = v9 & 0xFFFFFFFFFFFFLL | 0x4773000000000000;
      break;
    default:
      unint64_t v7 = 0xE700000000000000;
      uint64_t v2 = 0x746E6563726570;
      break;
  }
  if (v6 == v2 && v4 == v7) {
    char v11 = 0;
  }
  else {
    char v11 = sub_38150();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11 & 1;
}

unint64_t UnitSemantic.rawValue.getter(char a1)
{
  unint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x4373656572676564;
      break;
    case 2:
      return result;
    case 3:
      unint64_t result = 0x4773656572676564;
      break;
    default:
      unint64_t result = 0x746E6563726570;
      break;
  }
  return result;
}

HomeAutomationSiriSuggestions::UnitSemantic_optional __swiftcall UnitSemantic.init(rawValue:)(Swift::String rawValue)
{
  object = rawValue._object;
  v5._countAndFlagsBits = rawValue._countAndFlagsBits;
  v2._rawValue = &off_49088;
  v5._object = object;
  unint64_t v3 = sub_38120(v2, v5);
  swift_bridgeObjectRelease();
  if (v3 >= 4) {
    return (HomeAutomationSiriSuggestions::UnitSemantic_optional)4;
  }
  else {
    return (HomeAutomationSiriSuggestions::UnitSemantic_optional)v3;
  }
}

_UNKNOWN **static UnitSemantic.allCases.getter()
{
  return &off_49108;
}

uint64_t sub_41D8(unsigned __int8 *a1, char *a2)
{
  return sub_16660(*a1, *a2);
}

Swift::Int sub_41E4()
{
  return sub_13D5C(*v0);
}

uint64_t sub_41EC(uint64_t a1)
{
  return sub_13EF0(a1, *v1);
}

Swift::Int sub_41F4(uint64_t a1)
{
  return sub_14048(a1, *v1);
}

HomeAutomationSiriSuggestions::UnitSemantic_optional sub_41FC@<W0>(Swift::String *a1@<X0>, HomeAutomationSiriSuggestions::UnitSemantic_optional *a2@<X8>)
{
  result.value = UnitSemantic.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

unint64_t sub_422C@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = UnitSemantic.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_4258(unsigned __int8 *a1, char *a2)
{
  return static UnitSemantic.< infix(_:_:)(*a1, *a2);
}

BOOL sub_4264(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_14110(*a1, *a2);
}

BOOL sub_4270(unsigned __int8 *a1, char *a2)
{
  return sub_141D8(*a1, *a2);
}

uint64_t sub_427C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1425C(*a1, *a2);
}

void sub_4288(void *a1@<X8>)
{
  *a1 = &off_49108;
}

uint64_t sub_4298()
{
  return sub_37ED0();
}

uint64_t sub_42F8()
{
  return sub_37EC0();
}

uint64_t sub_4348(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_4708();
  unint64_t v5 = sub_4754();
  unint64_t v6 = sub_47A0();
  return static TerminalNodeBoundedSemanticValue<>.fromIntentNodeValue(_:)(a1, a2, v4, v5, v6);
}

uint64_t sub_43BC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 16) = a2;
  *(void *)(result + 24) = 2 * a2;
  return result;
}

unint64_t sub_43D0()
{
  unint64_t result = qword_4D008;
  if (!qword_4D008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D008);
  }
  return result;
}

unint64_t sub_4420()
{
  unint64_t result = qword_4D010;
  if (!qword_4D010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D010);
  }
  return result;
}

unint64_t sub_4470()
{
  unint64_t result = qword_4D018;
  if (!qword_4D018)
  {
    sub_44C4(&qword_4D020);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D018);
  }
  return result;
}

uint64_t sub_44C4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_4510()
{
  unint64_t result = qword_4D028;
  if (!qword_4D028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D028);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for UnitSemantic(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for UnitSemantic(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
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
    int v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v5 = v6 - 4;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for UnitSemantic(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x46C0);
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

uint64_t sub_46E8(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_46F0(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for UnitSemantic()
{
  return &type metadata for UnitSemantic;
}

unint64_t sub_4708()
{
  unint64_t result = qword_4D030;
  if (!qword_4D030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D030);
  }
  return result;
}

unint64_t sub_4754()
{
  unint64_t result = qword_4D038;
  if (!qword_4D038)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D038);
  }
  return result;
}

unint64_t sub_47A0()
{
  unint64_t result = qword_4D040;
  if (!qword_4D040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D040);
  }
  return result;
}

uint64_t sub_47EC()
{
  return 0x656572676564;
}

uint64_t sub_4814()
{
  uint64_t v0 = sub_37A80();
  sub_4934(v0, qword_508A0);
  uint64_t v1 = sub_23E8(v0, (uint64_t)qword_508A0);
  uint64_t v2 = enum case for HomeSuggestionType.getStateOfWindows(_:);
  int v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);
  return v3(v1, v2, v0);
}

uint64_t sub_489C()
{
  uint64_t v0 = sub_37710();
  sub_4934(v0, qword_508B8);
  uint64_t v1 = (void *)sub_23E8(v0, (uint64_t)qword_508B8);
  *uint64_t v1 = sub_292B0();
  v1[1] = v2;
  uint64_t v3 = enum case for DialogDetails.catId(_:);
  unsigned int v4 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);
  return v4(v1, v3, v0);
}

uint64_t *sub_4934(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

ValueMetadata *type metadata accessor for GetStateOfWindows()
{
  return &type metadata for GetStateOfWindows;
}

uint64_t sub_49A8@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  *(void *)&long long v23 = a1;
  uint64_t v24 = a2;
  uint64_t v22 = sub_2420(&qword_4D048);
  sub_4EA8();
  uint64_t v21 = v2;
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_37C30();
  sub_4EA8();
  uint64_t v8 = v7;
  __chkstk_darwin(v9);
  char v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2420(&qword_4D050);
  uint64_t v12 = (int *)type metadata accessor for ResolverParameterProperties();
  unint64_t v13 = (*(unsigned __int8 *)(*((void *)v12 - 1) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*((void *)v12 - 1) + 80);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_385B0;
  unint64_t v15 = v14 + v13;
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v11, enum case for SuggestionParameter.isSingleAccessoryOfTypeInHome(_:), v6);
  uint64_t IsSingleAccessoryOfTypeInHomeResolver = type metadata accessor for IsSingleAccessoryOfTypeInHomeResolver();
  swift_allocObject();
  uint64_t v17 = sub_1E0F8();
  Swift::String v18 = (uint64_t *)(v15 + v12[5]);
  v18[3] = IsSingleAccessoryOfTypeInHomeResolver;
  v18[4] = sub_4D7C();
  *Swift::String v18 = v17;
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v15, v11, v6);
  *(unsigned char *)(v15 + v12[6]) = 1;
  *(unsigned char *)(v15 + v12[7]) = 0;
  sub_2420(&qword_4D060);
  sub_375B0();
  sub_4DCC(v23, (uint64_t)&v29);
  LODWORD(IsSingleAccessoryOfTypeInHomeResolver) = *(unsigned __int8 *)(v15 + v12[7]);
  sub_37800();
  swift_bridgeObjectRetain();
  sub_37C20();
  if (IsSingleAccessoryOfTypeInHomeResolver == 1)
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v21 + 16))(v5, v15 + v12[8], v22);
    sub_377E0();
  }
  else
  {
    sub_377F0();
  }
  uint64_t v19 = v31;
  long long v23 = v30;
  sub_23A4(&v29, v30);
  sub_37C20();
  sub_3BB8(v15 + v12[5], (uint64_t)v25);
  long long v27 = v23;
  uint64_t v28 = v19;
  sub_3C6C(v26);
  sub_378A0();
  swift_release();
  swift_bridgeObjectRelease();
  sub_4E30((uint64_t)v25);
  sub_3C1C((uint64_t)v26);
  swift_bridgeObjectRelease();
  sub_4E90(&v29, v24);
  swift_setDeallocating();
  return sub_219FC();
}

void *sub_4D6C()
{
  return &_swiftEmptyArrayStorage;
}

unint64_t sub_4D7C()
{
  unint64_t result = qword_4D058;
  if (!qword_4D058)
  {
    type metadata accessor for IsSingleAccessoryOfTypeInHomeResolver();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D058);
  }
  return result;
}

uint64_t sub_4DCC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_4E30(uint64_t a1)
{
  uint64_t v2 = sub_2420(&qword_4D068);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *sub_4E90(long long *a1, _OWORD *a2)
{
  long long v2 = *a1;
  long long v3 = a1[2];
  a2[1] = a1[1];
  a2[2] = v3;
  *a2 = v2;
  return a2;
}

uint64_t static StateSemantic.< infix(_:_:)(char a1, char a2)
{
  uint64_t v3 = StateSemantic.rawValue.getter(a1);
  uint64_t v5 = v4;
  if (v3 == StateSemantic.rawValue.getter(a2) && v5 == v6) {
    char v8 = 0;
  }
  else {
    char v8 = sub_38150();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t StateSemantic.rawValue.getter(char a1)
{
  uint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      return 6710895;
    case 2:
      return result;
    case 3:
      uint64_t v3 = 1702131053;
      return v3 & 0xFFFF0000FFFFFFFFLL | 0x6400000000;
    case 4:
      uint64_t v4 = 0x6574756D6E75;
      goto LABEL_87;
    case 5:
      return 0x64656B636F6CLL;
    case 6:
      uint64_t v5 = 0x6B636F6C6E75;
      return v5 & 0xFFFFFFFFFFFFLL | 0x6465000000000000;
    case 7:
      unsigned int v6 = 1801678700;
      return v6 | 0x676E6900000000;
    case 8:
      return 0x6E696B636F6C6E75;
    case 9:
      return 1852141679;
    case 10:
      uint64_t v7 = 1936682083;
      goto LABEL_85;
    case 11:
      unsigned int v6 = 1852141679;
      return v6 | 0x676E6900000000;
    case 12:
      unsigned int v6 = 1936682083;
      return v6 | 0x676E6900000000;
    case 13:
      return 28789;
    case 14:
      return 1853321060;
    case 15:
      return 7827308;
    case 16:
      uint64_t v8 = 1768187245;
      return v8 & 0xFFFF0000FFFFFFFFLL | 0x6D7500000000;
    case 17:
      return 1751607656;
    case 18:
      return 0x796177666C6168;
    case 19:
      return 0x7369776B636F6C63;
    case 20:
    case 26:
    case 38:
      return 0xD000000000000010;
    case 21:
      unint64_t v9 = 0x737265766572;
      return v9 & 0xFFFFFFFFFFFFLL | 0x65000000000000;
    case 22:
      uint64_t v10 = 0x5F656B6F6D73;
      return v10 & 0xFFFFFFFFFFFFLL | 0x6564000000000000;
    case 23:
      return 0xD000000000000012;
    case 24:
      return 0xD000000000000018;
    case 25:
      return 0xD00000000000001CLL;
    case 27:
      return 0xD000000000000014;
    case 28:
      return 0x6E656C6C65637865;
    case 29:
      return 1685024615;
    case 30:
      return 1919508838;
    case 31:
      return 0x726F697265666E69;
    case 32:
      return 1919905648;
    case 33:
      unsigned int v6 = 1952540008;
      return v6 | 0x676E6900000000;
    case 34:
      unsigned int v6 = 1819242339;
      return v6 | 0x676E6900000000;
    case 35:
      uint64_t v10 = 0x6F4D6F747561;
      return v10 & 0xFFFFFFFFFFFFLL | 0x6564000000000000;
    case 36:
      return 0x6C61756E616DLL;
    case 37:
      return 0x6576654C6B616570;
    case 39:
      return 0x6C6576656CLL;
    case 40:
      return 0x656772616863;
    case 41:
      return 0x745F726F736E6573;
    case 42:
      return 0xD000000000000012;
    case 43:
      return 0x6F6D5F676E697773;
    case 44:
      return 0x6573755F6E69;
    case 45:
      return 0x755F6E695F746F6ELL;
    case 46:
      uint64_t v3 = 1701671521;
      return v3 & 0xFFFF0000FFFFFFFFLL | 0x6400000000;
    case 47:
      return 0x696E5F64656D7261;
    case 48:
      return 0x74735F64656D7261;
    case 49:
      return 0x77615F64656D7261;
    case 50:
      uint64_t v5 = 0x6D7261736964;
      return v5 & 0xFFFFFFFFFFFFLL | 0x6465000000000000;
    case 51:
      return 0x72745F6D72616C61;
    case 52:
      return 1701602409;
    case 53:
      uint64_t v3 = 1702390118;
      return v3 & 0xFFFF0000FFFFFFFFLL | 0x6400000000;
    case 54:
      return 0x676E69676E697773;
    case 55:
      uint64_t v7 = 1835884906;
      goto LABEL_85;
    case 56:
      return 0x6E61656C63;
    case 57:
      uint64_t v8 = 1969447286;
      return v8 & 0xFFFF0000FFFFFFFFLL | 0x6D7500000000;
    case 58:
      return 7368557;
    case 59:
      return 0x6E416D7575636176;
    case 60:
      return 0x61656C4370656564;
    case 61:
      uint64_t v11 = 1667855729;
      return v11 & 0xFFFF0000FFFFFFFFLL | 0x6B00000000;
    case 62:
      return 0x7465697571;
    case 63:
      uint64_t v12 = 1299145573;
      goto LABEL_75;
    case 64:
      return 0x6573696F4E776F6CLL;
    case 65:
      return 0x6E6F697461636176;
    case 66:
      uint64_t v12 = 1299081581;
      goto LABEL_75;
    case 67:
      uint64_t v12 = 1299734893;
      goto LABEL_75;
    case 68:
      uint64_t v12 = 1299800420;
LABEL_75:
      unint64_t v9 = v12 & 0xFFFF0000FFFFFFFFLL | 0x646F00000000;
      return v9 & 0xFFFFFFFFFFFFLL | 0x65000000000000;
    case 69:
      return 0x646F4D746867696ELL;
    case 70:
      return 0x6573756170;
    case 71:
      return 0x656D75736572;
    case 72:
      uint64_t v7 = 1801678692;
      goto LABEL_85;
    case 73:
      uint64_t v11 = 1668641907;
      return v11 & 0xFFFF0000FFFFFFFFLL | 0x6B00000000;
    case 74:
      uint64_t v7 = 1937072496;
LABEL_85:
      uint64_t result = v7 & 0xFFFF0000FFFFFFFFLL | 0x646500000000;
      break;
    case 75:
      uint64_t v4 = 0x656D75736572;
LABEL_87:
      uint64_t result = v4 & 0xFFFFFFFFFFFFLL | 0x64000000000000;
      break;
    case 76:
      uint64_t result = 0x646570706F7473;
      break;
    default:
      uint64_t result = 28271;
      break;
  }
  return result;
}

HomeAutomationSiriSuggestions::StateSemantic_optional __swiftcall StateSemantic.init(rawValue:)(Swift::String rawValue)
{
  unint64_t v1 = sub_38160();
  swift_bridgeObjectRelease();
  if (v1 >= 0x4D) {
    return (HomeAutomationSiriSuggestions::StateSemantic_optional)77;
  }
  else {
    return (HomeAutomationSiriSuggestions::StateSemantic_optional)v1;
  }
}

_UNKNOWN **static StateSemantic.allCases.getter()
{
  return &off_49888;
}

uint64_t sub_5754(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_165CC(*a1, *a2);
}

Swift::Int sub_5760()
{
  return sub_13DA4(*v0);
}

uint64_t sub_5768(uint64_t a1)
{
  return sub_13E94(a1, *v1);
}

Swift::Int sub_5770(uint64_t a1)
{
  return sub_1408C(a1, *v1);
}

HomeAutomationSiriSuggestions::StateSemantic_optional sub_5778@<W0>(Swift::String *a1@<X0>, HomeAutomationSiriSuggestions::StateSemantic_optional *a2@<X8>)
{
  result.value = StateSemantic.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

uint64_t sub_57A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = StateSemantic.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_57D4(char *a1, char *a2)
{
  return static StateSemantic.< infix(_:_:)(*a1, *a2);
}

BOOL sub_57E0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_14130(*a1, *a2);
}

BOOL sub_57EC(char *a1, char *a2)
{
  return sub_141F4(*a1, *a2);
}

uint64_t sub_57F8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1426C(*a1, *a2);
}

void sub_5804(void *a1@<X8>)
{
  *a1 = &off_49888;
}

uint64_t sub_5814()
{
  return sub_37ED0();
}

uint64_t sub_5874()
{
  return sub_37EC0();
}

uint64_t sub_58C4(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_5C0C();
  unint64_t v5 = sub_5C58();
  unint64_t v6 = sub_5CA4();
  return static TerminalNodeBoundedSemanticValue<>.fromIntentNodeValue(_:)(a1, a2, v4, v5, v6);
}

unint64_t sub_593C()
{
  unint64_t result = qword_4D070;
  if (!qword_4D070)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D070);
  }
  return result;
}

unint64_t sub_598C()
{
  unint64_t result = qword_4D078;
  if (!qword_4D078)
  {
    sub_44C4(&qword_4D080);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D078);
  }
  return result;
}

unint64_t sub_59E4()
{
  unint64_t result = qword_4D088;
  if (!qword_4D088)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D088);
  }
  return result;
}

unint64_t sub_5A34()
{
  unint64_t result = qword_4D090;
  if (!qword_4D090)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D090);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for StateSemantic(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xB4)
  {
    if (a2 + 76 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 76) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 77;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x4D;
  int v5 = v6 - 77;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for StateSemantic(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 76 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 76) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xB4) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xB3)
  {
    unsigned int v6 = ((a2 - 180) >> 8) + 1;
    *unint64_t result = a2 + 76;
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
        JUMPOUT(0x5BD4);
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
          *unint64_t result = a2 + 76;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for StateSemantic()
{
  return &type metadata for StateSemantic;
}

unint64_t sub_5C0C()
{
  unint64_t result = qword_4D098;
  if (!qword_4D098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D098);
  }
  return result;
}

unint64_t sub_5C58()
{
  unint64_t result = qword_4D0A0;
  if (!qword_4D0A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D0A0);
  }
  return result;
}

unint64_t sub_5CA4()
{
  unint64_t result = qword_4D0A8;
  if (!qword_4D0A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D0A8);
  }
  return result;
}

uint64_t sub_5CF0()
{
  uint64_t v0 = sub_37A80();
  sub_4934(v0, qword_508D0);
  uint64_t v1 = sub_23E8(v0, (uint64_t)qword_508D0);
  uint64_t v2 = enum case for HomeSuggestionType.getStateOfHumidity(_:);
  int v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);
  return v3(v1, v2, v0);
}

uint64_t sub_5D78()
{
  uint64_t v0 = sub_37710();
  sub_4934(v0, qword_508E8);
  uint64_t v1 = (void *)sub_23E8(v0, (uint64_t)qword_508E8);
  *uint64_t v1 = sub_292D4();
  v1[1] = v2;
  uint64_t v3 = enum case for DialogDetails.catId(_:);
  unsigned int v4 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);
  return v4(v1, v3, v0);
}

ValueMetadata *type metadata accessor for GetStateOfHumidity()
{
  return &type metadata for GetStateOfHumidity;
}

uint64_t sub_5E20()
{
  uint64_t v0 = sub_37A80();
  sub_4934(v0, qword_50900);
  uint64_t v1 = sub_23E8(v0, (uint64_t)qword_50900);
  uint64_t v2 = enum case for HomeSuggestionType.getStateOfLightsPower(_:);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);
  return v3(v1, v2, v0);
}

uint64_t sub_5EA8()
{
  uint64_t v0 = sub_37710();
  sub_4934(v0, qword_50918);
  uint64_t v1 = (void *)sub_23E8(v0, (uint64_t)qword_50918);
  *uint64_t v1 = sub_292F8();
  v1[1] = v2;
  uint64_t v3 = enum case for DialogDetails.catId(_:);
  unsigned int v4 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);
  return v4(v1, v3, v0);
}

ValueMetadata *type metadata accessor for GetStateOfLightsPower()
{
  return &type metadata for GetStateOfLightsPower;
}

uint64_t sub_5F50@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  *(void *)&long long v36 = a1;
  v40 = a2;
  *(void *)&long long v39 = sub_2420(&qword_4D048);
  sub_4EA8();
  uint64_t v38 = v2;
  __chkstk_darwin(v3);
  uint64_t v37 = (char *)v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_37C30();
  sub_4EA8();
  uint64_t v7 = v6;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2420(&qword_4D050);
  uint64_t v11 = (int *)type metadata accessor for ResolverParameterProperties();
  uint64_t v12 = *(void *)(*((void *)v11 - 1) + 72);
  unint64_t v13 = (*(unsigned __int8 *)(*((void *)v11 - 1) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*((void *)v11 - 1) + 80);
  uint64_t v14 = swift_allocObject();
  uint64_t v41 = v14;
  *(_OWORD *)(v14 + 16) = xmmword_38BB0;
  unint64_t v15 = v14 + v13;
  Swift::String v35 = *(void (**)(char *, void, uint64_t))(v7 + 104);
  uint64_t v16 = v5;
  v35(v10, enum case for SuggestionParameter.isSingleAccessoryOfTypeInHome(_:), v5);
  uint64_t IsSingleAccessoryOfTypeInHomeResolver = type metadata accessor for IsSingleAccessoryOfTypeInHomeResolver();
  swift_allocObject();
  uint64_t v18 = sub_1E0F8();
  uint64_t v19 = (uint64_t *)(v15 + v11[5]);
  v19[3] = IsSingleAccessoryOfTypeInHomeResolver;
  v19[4] = sub_6548((unint64_t *)&qword_4D058, (void (*)(uint64_t))type metadata accessor for IsSingleAccessoryOfTypeInHomeResolver);
  uint64_t *v19 = v18;
  uint64_t v20 = *(void (**)(uint64_t, char *, uint64_t))(v7 + 32);
  v33[1] = v7 + 32;
  int v34 = v20;
  uint64_t v21 = v16;
  v20(v15, v10, v16);
  *(unsigned char *)(v15 + v11[6]) = 1;
  *(unsigned char *)(v15 + v11[7]) = 0;
  v33[0] = sub_2420(&qword_4D060);
  sub_375B0();
  uint64_t v22 = v15 + v12;
  v35(v10, enum case for SuggestionParameter.roomName(_:), v16);
  uint64_t v23 = type metadata accessor for RoomNameResolver();
  swift_allocObject();
  uint64_t v24 = sub_1D460();
  uint64_t v25 = (uint64_t *)(v22 + v11[5]);
  v25[3] = v23;
  v25[4] = sub_6548((unint64_t *)&qword_4D0B0, (void (*)(uint64_t))type metadata accessor for RoomNameResolver);
  *uint64_t v25 = v24;
  v34(v22, v10, v21);
  *(unsigned char *)(v22 + v11[6]) = 1;
  *(unsigned char *)(v22 + v11[7]) = 0;
  sub_375B0();
  sub_4DCC(v36, (uint64_t)&v46);
  LODWORD(v23) = *(unsigned __int8 *)(v15 + v11[7]);
  sub_37800();
  swift_bridgeObjectRetain();
  sub_37C20();
  if (v23 == 1)
  {
    uint64_t v26 = sub_65D4();
    v27(v26);
    sub_6590();
  }
  else
  {
    sub_65B4();
  }
  uint64_t v28 = v48;
  long long v36 = v47;
  sub_23A4(&v46, v47);
  sub_37C20();
  sub_3BB8(v15 + v11[5], (uint64_t)v42);
  long long v44 = v36;
  uint64_t v45 = v28;
  sub_3C6C(v43);
  sub_378A0();
  swift_release();
  swift_bridgeObjectRelease();
  sub_4E30((uint64_t)v42);
  sub_3C1C((uint64_t)v43);
  LODWORD(v28) = *(unsigned __int8 *)(v22 + v11[7]);
  sub_37C20();
  if (v28 == 1)
  {
    uint64_t v29 = sub_65D4();
    v30(v29);
    sub_6590();
  }
  else
  {
    sub_65B4();
  }
  uint64_t v31 = v48;
  long long v39 = v47;
  sub_23A4(&v46, v47);
  sub_37C20();
  sub_3BB8(v22 + v11[5], (uint64_t)v42);
  long long v44 = v39;
  uint64_t v45 = v31;
  sub_3C6C(v43);
  sub_378A0();
  swift_release();
  swift_bridgeObjectRelease();
  sub_4E30((uint64_t)v42);
  sub_3C1C((uint64_t)v43);
  swift_bridgeObjectRelease();
  sub_4E90(&v46, v40);
  swift_setDeallocating();
  return sub_219FC();
}

uint64_t sub_6548(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_6590()
{
  return sub_377E0();
}

uint64_t sub_65B4()
{
  return sub_377F0();
}

uint64_t sub_65D4()
{
  return *(void *)(v0 - 272);
}

uint64_t sub_65E8()
{
  uint64_t v0 = sub_37A80();
  sub_4934(v0, qword_50930);
  uint64_t v1 = sub_23E8(v0, (uint64_t)qword_50930);
  uint64_t v2 = enum case for HomeSuggestionType.openCloseSecureAccessories(_:);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);
  return v3(v1, v2, v0);
}

uint64_t sub_6670()
{
  uint64_t v0 = sub_37710();
  sub_4934(v0, qword_50948);
  uint64_t v1 = (void *)sub_23E8(v0, (uint64_t)qword_50948);
  *uint64_t v1 = sub_2931C();
  v1[1] = v2;
  uint64_t v3 = enum case for DialogDetails.catId(_:);
  uint64_t v4 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);
  return v4(v1, v3, v0);
}

ValueMetadata *type metadata accessor for OpenCloseSecureAccessoriesSuggestion()
{
  return &type metadata for OpenCloseSecureAccessoriesSuggestion;
}

uint64_t sub_6718@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 24);
  long long v11 = *(_OWORD *)(a1 + 32);
  sub_23A4((void *)a1, v3);
  if (qword_4CC90 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_37A80();
  sub_23E8(v4, (uint64_t)qword_50930);
  uint64_t v5 = sub_37A70();
  uint64_t v7 = v6;
  uint64_t v8 = type metadata accessor for HomeAutomationCandidateSuggestionConfigurator();
  swift_allocObject();
  uint64_t v9 = sub_16A14(v5, v7);
  v12[3] = v8;
  v12[4] = sub_6FF4(&qword_4D0C8, (void (*)(uint64_t))type metadata accessor for HomeAutomationCandidateSuggestionConfigurator);
  v12[0] = v9;
  *(void *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = v11;
  sub_3C6C((uint64_t *)a2);
  sub_37640();
  return sub_3C1C((uint64_t)v12);
}

uint64_t sub_6864@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v44 = a1;
  uint64_t v45 = a2;
  uint64_t v47 = sub_2420(&qword_4D048);
  sub_4EA8();
  uint64_t v46 = v2;
  __chkstk_darwin(v3);
  v51.n128_u64[0] = (unint64_t)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_37C30();
  sub_4EA8();
  uint64_t v7 = v6;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2420(&qword_4D050);
  long long v11 = (int *)type metadata accessor for ResolverParameterProperties();
  unint64_t v12 = (*(unsigned __int8 *)(*((void *)v11 - 1) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*((void *)v11 - 1) + 80);
  uint64_t v40 = *(void *)(*((void *)v11 - 1) + 72);
  uint64_t v13 = v40;
  uint64_t v14 = swift_allocObject();
  uint64_t v52 = v14;
  *(_OWORD *)(v14 + 16) = xmmword_38BF0;
  unint64_t v15 = v14 + v12;
  unint64_t v43 = *(void (**)(char *, void, uint64_t))(v7 + 104);
  v43(v10, enum case for SuggestionParameter.accessoryType(_:), v5);
  uint64_t v16 = type metadata accessor for AccessoryTypeResolver();
  swift_allocObject();
  uint64_t v17 = sub_2E370();
  uint64_t v18 = (uint64_t *)(v15 + v11[5]);
  v18[3] = v16;
  v18[4] = sub_6FF4(&qword_4D0B8, (void (*)(uint64_t))type metadata accessor for AccessoryTypeResolver);
  *uint64_t v18 = v17;
  uint64_t v19 = *(void (**)(unint64_t, char *, uint64_t))(v7 + 32);
  uint64_t v41 = v7 + 32;
  uint64_t v42 = v19;
  v19(v15, v10, v5);
  *(unsigned char *)(v15 + v11[6]) = 1;
  *(unsigned char *)(v15 + v11[7]) = 1;
  uint64_t v50 = sub_2420(&qword_4D060);
  v49.n128_u64[0] = (unint64_t)&type metadata for Any + 8;
  uint64_t v48 = sub_36818;
  sub_375B0();
  unint64_t v20 = v15 + v13;
  uint64_t v21 = v43;
  v43(v10, enum case for SuggestionParameter.roomName(_:), v5);
  uint64_t v22 = type metadata accessor for RoomNameResolver();
  swift_allocObject();
  uint64_t v23 = sub_1D460();
  uint64_t v24 = (uint64_t *)(v15 + v13 + v11[5]);
  v24[3] = v22;
  v24[4] = sub_6FF4((unint64_t *)&qword_4D0B0, (void (*)(uint64_t))type metadata accessor for RoomNameResolver);
  *uint64_t v24 = v23;
  long long v39 = v10;
  uint64_t v25 = v5;
  uint64_t v38 = v5;
  uint64_t v26 = v5;
  long long v27 = v42;
  v42(v20, v10, v26);
  *(unsigned char *)(v20 + v11[6]) = 1;
  *(unsigned char *)(v20 + v11[7]) = 0;
  sub_706C();
  unint64_t v28 = v15 + 2 * v40;
  v21(v10, enum case for SuggestionParameter.accessoryName(_:), v25);
  uint64_t v29 = type metadata accessor for AccessoryNameResolver();
  swift_allocObject();
  uint64_t v30 = sub_28518();
  uint64_t v31 = (uint64_t *)(v28 + v11[5]);
  v31[3] = v29;
  v31[4] = sub_6FF4(&qword_4D0C0, (void (*)(uint64_t))type metadata accessor for AccessoryNameResolver);
  *uint64_t v31 = v30;
  v27(v28, v39, v38);
  *(unsigned char *)(v28 + v11[6]) = 0;
  *(unsigned char *)(v28 + v11[7]) = 0;
  sub_706C();
  sub_4DCC(v44, (uint64_t)&v55);
  LODWORD(v10) = *(unsigned __int8 *)(v15 + v11[7]);
  uint64_t v32 = sub_37800();
  swift_bridgeObjectRetain();
  sub_37C20();
  sub_7108();
  uint64_t v50 = v32;
  if (v10 == 1)
  {
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v46 + 16))(v51.n128_u64[0], v15 + v11[8], v47);
    sub_377E0();
  }
  else
  {
    sub_377F0();
  }
  __n128 v49 = v56;
  sub_70C0(v56.n128_f64[0]);
  sub_37C20();
  sub_3BB8(v15 + v11[5], (uint64_t)v53);
  sub_7118(v49);
  sub_703C();
  swift_release();
  swift_bridgeObjectRelease();
  sub_4E30((uint64_t)v53);
  sub_3C1C((uint64_t)v54);
  char v33 = *(unsigned char *)(v20 + v11[7]);
  sub_37C20();
  sub_7108();
  if (v33)
  {
    uint64_t v34 = v47;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v46 + 16))(v51.n128_u64[0], v20 + v11[8], v47);
    sub_7098();
  }
  else
  {
    sub_70E4();
    uint64_t v34 = v47;
  }
  __n128 v49 = v56;
  sub_70C0(v56.n128_f64[0]);
  sub_37C20();
  sub_3BB8(v20 + v11[5], (uint64_t)v53);
  sub_7118(v49);
  sub_703C();
  swift_release();
  swift_bridgeObjectRelease();
  sub_4E30((uint64_t)v53);
  sub_3C1C((uint64_t)v54);
  char v35 = *(unsigned char *)(v28 + v11[7]);
  sub_37C20();
  sub_7108();
  if (v35)
  {
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v46 + 16))(v51.n128_u64[0], v28 + v11[8], v34);
    sub_7098();
  }
  else
  {
    sub_70E4();
  }
  __n128 v51 = v56;
  sub_70C0(v56.n128_f64[0]);
  sub_37C20();
  sub_3BB8(v28 + v11[5], (uint64_t)v53);
  sub_7118(v51);
  sub_378A0();
  swift_release();
  swift_bridgeObjectRelease();
  sub_4E30((uint64_t)v53);
  sub_3C1C((uint64_t)v54);
  swift_bridgeObjectRelease();
  sub_4E90(&v55, v45);
  swift_setDeallocating();
  return sub_219FC();
}

uint64_t sub_6FF4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_703C()
{
  return sub_378A0();
}

uint64_t sub_706C()
{
  return sub_375B0();
}

uint64_t sub_7098()
{
  return sub_377E0();
}

void *sub_70C0(double a1)
{
  return sub_23A4((void *)(v1 - 136), *(uint64_t *)&a1);
}

uint64_t sub_70E4()
{
  return sub_377F0();
}

uint64_t *sub_7118(__n128 a1)
{
  *(__n128 *)(v2 - 160) = a1;
  *(void *)(v2 - 144) = v1;
  return sub_3C6C((uint64_t *)(v2 - 184));
}

uint64_t sub_7134()
{
  uint64_t v0 = sub_37A80();
  sub_4934(v0, qword_50960);
  uint64_t v1 = sub_23E8(v0, (uint64_t)qword_50960);
  uint64_t v2 = enum case for HomeSuggestionType.getStateOfGarageDoors(_:);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);
  return v3(v1, v2, v0);
}

uint64_t sub_71BC()
{
  uint64_t v0 = sub_37710();
  sub_4934(v0, qword_50978);
  uint64_t v1 = (void *)sub_23E8(v0, (uint64_t)qword_50978);
  *uint64_t v1 = sub_29340();
  v1[1] = v2;
  uint64_t v3 = enum case for DialogDetails.catId(_:);
  uint64_t v4 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);
  return v4(v1, v3, v0);
}

ValueMetadata *type metadata accessor for GetStateOfGarageDoors()
{
  return &type metadata for GetStateOfGarageDoors;
}

uint64_t sub_7264@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  *(void *)&long long v23 = a1;
  uint64_t v24 = a2;
  uint64_t v22 = sub_2420(&qword_4D048);
  sub_4EA8();
  uint64_t v21 = v2;
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_37C30();
  sub_4EA8();
  uint64_t v8 = v7;
  __chkstk_darwin(v9);
  long long v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2420(&qword_4D050);
  unint64_t v12 = (int *)type metadata accessor for ResolverParameterProperties();
  unint64_t v13 = (*(unsigned __int8 *)(*((void *)v12 - 1) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*((void *)v12 - 1) + 80);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_385B0;
  unint64_t v15 = v14 + v13;
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v11, enum case for SuggestionParameter.isSingleAccessoryOfTypeInHome(_:), v6);
  uint64_t IsSingleAccessoryOfTypeInHomeResolver = type metadata accessor for IsSingleAccessoryOfTypeInHomeResolver();
  swift_allocObject();
  uint64_t v17 = sub_1E0F8();
  uint64_t v18 = (uint64_t *)(v15 + v12[5]);
  v18[3] = IsSingleAccessoryOfTypeInHomeResolver;
  v18[4] = sub_4D7C();
  *uint64_t v18 = v17;
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v15, v11, v6);
  *(unsigned char *)(v15 + v12[6]) = 1;
  *(unsigned char *)(v15 + v12[7]) = 0;
  sub_2420(&qword_4D060);
  sub_375B0();
  sub_4DCC(v23, (uint64_t)&v29);
  LODWORD(IsSingleAccessoryOfTypeInHomeResolver) = *(unsigned __int8 *)(v15 + v12[7]);
  sub_37800();
  swift_bridgeObjectRetain();
  sub_37C20();
  if (IsSingleAccessoryOfTypeInHomeResolver == 1)
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v21 + 16))(v5, v15 + v12[8], v22);
    sub_377E0();
  }
  else
  {
    sub_377F0();
  }
  uint64_t v19 = v31;
  long long v23 = v30;
  sub_23A4(&v29, v30);
  sub_37C20();
  sub_3BB8(v15 + v12[5], (uint64_t)v25);
  long long v27 = v23;
  uint64_t v28 = v19;
  sub_3C6C(v26);
  sub_378A0();
  swift_release();
  swift_bridgeObjectRelease();
  sub_4E30((uint64_t)v25);
  sub_3C1C((uint64_t)v26);
  swift_bridgeObjectRelease();
  sub_4E90(&v29, v24);
  swift_setDeallocating();
  return sub_219FC();
}

uint64_t sub_762C()
{
  uint64_t v0 = sub_37A80();
  sub_4934(v0, qword_50990);
  uint64_t v1 = sub_23E8(v0, (uint64_t)qword_50990);
  uint64_t v2 = enum case for HomeSuggestionType.getStateOfAirQuality(_:);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);
  return v3(v1, v2, v0);
}

uint64_t sub_76B4()
{
  uint64_t v0 = sub_37710();
  sub_4934(v0, qword_509A8);
  uint64_t v1 = (void *)sub_23E8(v0, (uint64_t)qword_509A8);
  *uint64_t v1 = sub_29364();
  v1[1] = v2;
  uint64_t v3 = enum case for DialogDetails.catId(_:);
  uint64_t v4 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);
  return v4(v1, v3, v0);
}

ValueMetadata *type metadata accessor for GetStateOfAirQuality()
{
  return &type metadata for GetStateOfAirQuality;
}

uint64_t sub_775C@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  *(void *)&long long v23 = a1;
  uint64_t v24 = a2;
  uint64_t v22 = sub_2420(&qword_4D048);
  sub_4EA8();
  uint64_t v21 = v2;
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_37C30();
  sub_4EA8();
  uint64_t v8 = v7;
  __chkstk_darwin(v9);
  long long v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2420(&qword_4D050);
  unint64_t v12 = (int *)type metadata accessor for ResolverParameterProperties();
  unint64_t v13 = (*(unsigned __int8 *)(*((void *)v12 - 1) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*((void *)v12 - 1) + 80);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_385B0;
  unint64_t v15 = v14 + v13;
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v11, enum case for SuggestionParameter.roomName(_:), v6);
  uint64_t v16 = type metadata accessor for RoomNameResolver();
  swift_allocObject();
  uint64_t v17 = sub_1D460();
  uint64_t v18 = (uint64_t *)(v15 + v12[5]);
  v18[3] = v16;
  v18[4] = sub_7B20();
  *uint64_t v18 = v17;
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v15, v11, v6);
  *(unsigned char *)(v15 + v12[6]) = 0;
  *(unsigned char *)(v15 + v12[7]) = 0;
  sub_2420(&qword_4D060);
  sub_375B0();
  sub_4DCC(v23, (uint64_t)&v29);
  LODWORD(v16) = *(unsigned __int8 *)(v15 + v12[7]);
  sub_37800();
  swift_bridgeObjectRetain();
  sub_37C20();
  if (v16 == 1)
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v21 + 16))(v5, v15 + v12[8], v22);
    sub_377E0();
  }
  else
  {
    sub_377F0();
  }
  uint64_t v19 = v31;
  long long v23 = v30;
  sub_23A4(&v29, v30);
  sub_37C20();
  sub_3BB8(v15 + v12[5], (uint64_t)v25);
  long long v27 = v23;
  uint64_t v28 = v19;
  sub_3C6C(v26);
  sub_378A0();
  swift_release();
  swift_bridgeObjectRelease();
  sub_4E30((uint64_t)v25);
  sub_3C1C((uint64_t)v26);
  swift_bridgeObjectRelease();
  sub_4E90(&v29, v24);
  swift_setDeallocating();
  return sub_219FC();
}

unint64_t sub_7B20()
{
  unint64_t result = qword_4D0B0;
  if (!qword_4D0B0)
  {
    type metadata accessor for RoomNameResolver();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D0B0);
  }
  return result;
}

void HueSemantic.rawValue.getter(__int16 a1)
{
  switch(a1)
  {
    case 8:
      sub_10AF4(0x207261656C63);
      return;
    case 18:
    case 33:
    case 87:
    case 101:
    case 103:
    case 105:
    case 118:
    case 179:
    case 201:
    case 328:
    case 383:
    case 394:
    case 411:
    case 419:
    case 420:
    case 470:
    case 487:
    case 533:
    case 591:
    case 600:
    case 653:
    case 687:
      goto LABEL_26;
    case 19:
      sub_10AF4(0x206563696C61);
      return;
    case 24:
    case 44:
    case 66:
    case 72:
    case 100:
    case 108:
    case 120:
    case 121:
    case 128:
    case 137:
    case 146:
    case 174:
    case 175:
    case 185:
    case 220:
    case 229:
    case 243:
    case 244:
    case 266:
    case 291:
    case 322:
    case 340:
    case 346:
    case 348:
    case 350:
    case 374:
    case 399:
    case 400:
    case 410:
    case 412:
    case 430:
    case 452:
    case 465:
    case 466:
    case 472:
    case 488:
    case 490:
    case 492:
    case 493:
    case 512:
    case 516:
    case 525:
    case 566:
    case 576:
    case 601:
    case 623:
    case 657:
    case 705:
      goto LABEL_34;
    case 27:
    case 257:
      sub_10A5C();
      return;
    case 38:
      sub_10AC4(0x6C6F65727561);
      return;
    case 41:
    case 46:
    case 93:
    case 129:
    case 130:
    case 136:
    case 170:
    case 238:
    case 254:
    case 384:
    case 432:
    case 443:
    case 462:
    case 560:
    case 582:
    case 626:
    case 634:
    case 640:
    case 648:
    case 652:
    case 660:
    case 703:
      sub_10A28();
      return;
    case 42:
      sub_10AC4(0x702079626162);
      return;
    case 59:
    case 65:
    case 73:
    case 78:
    case 92:
    case 102:
    case 117:
    case 126:
    case 144:
    case 157:
    case 165:
    case 211:
    case 234:
    case 261:
    case 276:
    case 309:
    case 326:
    case 352:
    case 354:
    case 360:
    case 361:
    case 369:
    case 385:
    case 388:
    case 392:
    case 447:
    case 456:
    case 459:
    case 481:
    case 482:
    case 483:
    case 485:
    case 489:
    case 523:
    case 535:
    case 558:
    case 569:
    case 580:
    case 584:
    case 585:
    case 606:
    case 645:
    case 675:
    case 683:
      goto LABEL_49;
    case 61:
      sub_10AF4(0x2069646E6F62);
      return;
    case 62:
    case 156:
    case 258:
    case 259:
    case 268:
    case 288:
    case 294:
    case 316:
    case 319:
    case 333:
    case 372:
    case 376:
    case 413:
    case 449:
    case 498:
    case 515:
    case 521:
    case 527:
    case 553:
    case 568:
    case 573:
    case 581:
    case 612:
    case 633:
    case 700:
      sub_10B34();
      return;
    case 64:
    case 71:
    case 75:
    case 116:
    case 142:
    case 186:
    case 215:
    case 222:
    case 225:
    case 235:
    case 239:
    case 269:
    case 274:
    case 275:
    case 277:
    case 280:
    case 289:
    case 290:
    case 297:
    case 299:
    case 302:
    case 304:
    case 312:
    case 325:
    case 330:
    case 332:
    case 345:
    case 364:
    case 370:
    case 405:
    case 429:
    case 431:
    case 434:
    case 439:
    case 442:
    case 460:
    case 464:
    case 473:
    case 484:
    case 486:
    case 497:
    case 511:
    case 517:
    case 530:
    case 534:
    case 548:
    case 567:
    case 575:
    case 614:
    case 638:
    case 639:
    case 646:
    case 651:
    case 665:
    case 678:
    case 686:
    case 706:
      goto LABEL_48;
    case 70:
      sub_10A8C(0x746867697262);
      return;
    case 90:
      uint64_t v1 = 0x20746E727562;
      goto LABEL_10;
    case 95:
    case 253:
    case 279:
    case 283:
    case 287:
    case 320:
    case 323:
    case 378:
    case 425:
    case 426:
    case 448:
    case 501:
    case 528:
    case 577:
    case 589:
    case 620:
    case 625:
    case 637:
    case 658:
    case 676:
      sub_10B04();
      return;
    case 96:
    case 255:
    case 285:
    case 298:
    case 313:
    case 321:
    case 386:
    case 427:
    case 451:
    case 455:
    case 529:
    case 571:
    case 572:
    case 579:
    case 598:
    case 602:
    case 603:
    case 617:
    case 622:
    case 643:
    case 659:
    case 682:
    case 702:
    case 704:
    case 707:
      sub_10B3C();
      return;
    case 98:
      sub_10AF4(0x207465646163);
      return;
    case 109:
    case 480:
      sub_10AD4();
      return;
    case 110:
      sub_10AA8(0x2079646E6163);
      return;
    case 139:
      sub_10A70(0x62616E6E6963);
      return;
    case 147:
      sub_10A1C(0x6C6F6F63u);
      return;
    case 150:
      sub_10A8C(0x726570706F63);
      return;
    case 153:
      sub_10AA8(0x206C61726F63);
      return;
    case 176:
      uint64_t v1 = 0x63206B726164;
      goto LABEL_10;
    case 195:
      uint64_t v2 = 1802658148;
      goto LABEL_32;
    case 208:
      unsigned int v3 = 1802658148;
      goto LABEL_28;
    case 226:
      sub_10AE8(0x70656564u);
      return;
    case 227:
      uint64_t v2 = 1885693284;
LABEL_32:
      sub_10AC4(v2 & 0xFFFF0000FFFFFFFFLL | 0x702000000000);
      return;
    case 247:
      goto LABEL_35;
    case 252:
    case 476:
      sub_10A34();
      return;
    case 278:
      uint64_t v4 = 0x68636E657266;
      goto LABEL_39;
    case 282:
      uint64_t v1 = 0x62736E696167;
LABEL_10:
      sub_10ACC(v1);
      return;
    case 296:
      uint64_t v5 = 0x206E65657267;
      goto LABEL_45;
    case 303:
    case 366:
    case 698:
      sub_10B0C();
      return;
    case 334:
      sub_10A94();
      return;
    case 335:
    case 337:
    case 339:
    case 342:
      sub_10A94();
LABEL_34:
      sub_10B2C();
      return;
    case 336:
      sub_10A94();
      goto LABEL_26;
    case 338:
      sub_10A94();
LABEL_35:
      sub_10A48();
      return;
    case 351:
      sub_10AF4(0x20746867696CLL);
      return;
    case 363:
      sub_10AA8(0x20746867696CLL);
      return;
    case 377:
      unsigned int v6 = 544568173;
      goto LABEL_57;
    case 433:
      sub_10A70(0x63206E6F656ELL);
      return;
    case 454:
      sub_10A8C(0x65676E61726FLL);
      return;
    case 469:
      sub_10AB0(0x656C6170u);
      return;
    case 474:
      sub_10AC4(0x7020656C6170);
      return;
    case 479:
      unsigned int v3 = 1701601648;
      goto LABEL_28;
    case 491:
      sub_10A8C(0x6C6574736170);
      return;
    case 503:
    case 506:
    case 507:
    case 509:
      sub_10A78();
LABEL_48:
      sub_10AFC();
      return;
    case 504:
    case 505:
      sub_10A78();
LABEL_26:
      sub_10AE0();
      return;
    case 508:
      sub_10A78();
LABEL_49:
      sub_10ABC();
      return;
    case 513:
      uint64_t v7 = 1734830448;
      goto LABEL_77;
    case 518:
      sub_10AE8(0x6B6E6970u);
      return;
    case 547:
      sub_10A1C(0x68636972u);
      return;
    case 551:
      sub_10A70(0x6D2068636972);
      return;
    case 557:
      sub_10AC4(0x702065736F72);
      return;
    case 559:
      unsigned int v3 = 1702063986;
LABEL_28:
      sub_10B14(v3);
      return;
    case 565:
      uint64_t v8 = 1635348338;
      goto LABEL_84;
    case 570:
      uint64_t v7 = 1684305266;
LABEL_77:
      sub_10AA8(v7 & 0xFFFF0000FFFFFFFFLL | 0x207900000000);
      return;
    case 583:
      sub_10ACC(0x7473646E6173);
      return;
    case 586:
      unsigned int v6 = 544235891;
      goto LABEL_57;
    case 593:
      unsigned int v6 = 543253875;
      goto LABEL_57;
    case 607:
      uint64_t v5 = 0x206574616C73;
      goto LABEL_45;
    case 611:
      uint64_t v5 = 0x20796B6F6D73;
      goto LABEL_45;
    case 615:
      uint64_t v8 = 1701147763;
LABEL_84:
      sub_10AF4(v8 & 0xFFFF0000FFFFFFFFLL | 0x206C00000000);
      return;
    case 649:
      uint64_t v5 = 0x207374667574;
LABEL_45:
      sub_10AF4(v5);
      return;
    case 655:
      uint64_t v4 = 0x6E6163737574;
      goto LABEL_39;
    case 661:
      sub_10AB0(0x616C6375u);
      return;
    case 662:
      unsigned int v6 = 544171637;
LABEL_57:
      sub_10B20(v6);
      return;
    case 668:
      sub_10AA8(0x206172746C75);
      return;
    case 669:
      sub_10A70(0x6D6172746C75);
      return;
    case 684:
      uint64_t v4 = 0x74656C6F6976;
LABEL_39:
      sub_10A8C(v4);
      break;
    case 691:
      sub_10A1C(0x6D726177u);
      break;
    default:
      return;
  }
}

uint64_t static HueSemantic.< infix(_:_:)(__int16 a1, __int16 a2)
{
  HueSemantic.rawValue.getter(a1);
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  HueSemantic.rawValue.getter(a2);
  if (v4 == v8 && v6 == v7) {
    char v10 = 0;
  }
  else {
    char v10 = sub_38150();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10 & 1;
}

HomeAutomationSiriSuggestions::HueSemantic_optional __swiftcall HueSemantic.init(rawValue:)(Swift::String rawValue)
{
  object = rawValue._object;
  uint64_t countAndFlagsBits = rawValue._countAndFlagsBits;
  sub_2420(&qword_4D0D0);
  uint64_t v2 = swift_allocObject();
  uint64_t v8 = sub_43BC(v2, 709);
  *(void *)uint64_t v3 = "greenish";
  *(void *)(v3 + 8) = 8;
  *(unsigned char *)(v3 + 16) = 2;
  *(void *)(v3 + 24) = "candle";
  *(void *)(v3 + 32) = 6;
  *(unsigned char *)(v3 + 40) = 2;
  *(void *)(v3 + 48) = "40w tungsten";
  *(void *)(v3 + 56) = 12;
  *(unsigned char *)(v3 + 64) = 2;
  *(void *)(v3 + 72) = "100w tungsten";
  *(void *)(v3 + 80) = 13;
  *(unsigned char *)(v3 + 88) = 2;
  *(void *)(v3 + 96) = "halogen";
  *(void *)(v3 + 104) = 7;
  *(unsigned char *)(v3 + 112) = 2;
  *(void *)(v3 + 120) = "carbon arc";
  *(void *)(v3 + 128) = 10;
  *(unsigned char *)(v3 + 136) = 2;
  *(void *)(v3 + 144) = "high noon sun";
  *(void *)(v3 + 152) = 13;
  *(unsigned char *)(v3 + 160) = 2;
  *(void *)(v3 + 168) = "overcast sky";
  *(void *)(v3 + 176) = 12;
  *(unsigned char *)(v3 + 184) = 2;
  *(void *)(v3 + 192) = "clear blue sky";
  *(void *)(v3 + 200) = 14;
  *(unsigned char *)(v3 + 208) = 2;
  *(void *)(v3 + 216) = "warm fluorescent";
  *(void *)(v3 + 224) = 16;
  *(unsigned char *)(v3 + 232) = 2;
  *(void *)(v3 + 240) = "standard fluorescent";
  *(void *)(v3 + 248) = 20;
  *(unsigned char *)(v3 + 256) = 2;
  *(void *)(v3 + 264) = "cool white fluorescent";
  *(void *)(v3 + 272) = 22;
  *(unsigned char *)(v3 + 280) = 2;
  *(void *)(v3 + 288) = "full spectrum fluorescent";
  *(void *)(v3 + 296) = 25;
  *(unsigned char *)(v3 + 304) = 2;
  *(void *)(v3 + 312) = "black light fluorescent";
  *(void *)(v3 + 320) = 23;
  *(unsigned char *)(v3 + 328) = 2;
  *(void *)(v3 + 336) = "mercury vapor";
  *(void *)(v3 + 344) = 13;
  *(unsigned char *)(v3 + 352) = 2;
  *(void *)(v3 + 360) = "sodium vapor";
  *(void *)(v3 + 368) = 12;
  *(unsigned char *)(v3 + 376) = 2;
  *(void *)(v3 + 384) = "metal halide";
  *(void *)(v3 + 392) = 12;
  *(unsigned char *)(v3 + 400) = 2;
  *(void *)(v3 + 408) = "high pressure sodium";
  *(void *)(v3 + 416) = 20;
  *(unsigned char *)(v3 + 424) = 2;
  *(void *)(v3 + 432) = "air force blue";
  *(void *)(v3 + 440) = 14;
  *(unsigned char *)(v3 + 448) = 2;
  *(void *)(v3 + 456) = "alice blue";
  *(void *)(v3 + 464) = 10;
  *(unsigned char *)(v3 + 472) = 2;
  *(void *)(v3 + 480) = "alizarin crimson";
  *(void *)(v3 + 488) = 16;
  *(unsigned char *)(v3 + 496) = 2;
  *(void *)(v3 + 504) = "almond";
  *(void *)(v3 + 512) = 6;
  *(unsigned char *)(v3 + 520) = 2;
  *(void *)(v3 + 528) = "amaranth";
  *(void *)(v3 + 536) = 8;
  *(unsigned char *)(v3 + 544) = 2;
  *(void *)(v3 + 552) = "amber";
  *(void *)(v3 + 560) = 5;
  *(unsigned char *)(v3 + 568) = 2;
  *(void *)(v3 + 576) = "american rose";
  *(void *)(v3 + 584) = 13;
  *(unsigned char *)(v3 + 592) = 2;
  *(void *)(v3 + 600) = "amethyst";
  *(void *)(v3 + 608) = 8;
  *(unsigned char *)(v3 + 616) = 2;
  *(void *)(v3 + 624) = "antique brass";
  *(void *)(v3 + 632) = 13;
  *(unsigned char *)(v3 + 640) = 2;
  *(void *)(v3 + 648) = "antique fuchsia";
  *(void *)(v3 + 656) = 15;
  *(unsigned char *)(v3 + 664) = 2;
  *(void *)(v3 + 672) = "antique white";
  *(void *)(v3 + 680) = 13;
  *(unsigned char *)(v3 + 688) = 2;
  *(void *)(v3 + 696) = "apricot";
  *(void *)(v3 + 704) = 7;
  *(unsigned char *)(v3 + 712) = 2;
  *(void *)(v3 + 720) = "aqua";
  *(void *)(v3 + 728) = 4;
  *(unsigned char *)(v3 + 736) = 2;
  *(void *)(v3 + 744) = "aquamarine";
  *(void *)(v3 + 752) = 10;
  *(unsigned char *)(v3 + 760) = 2;
  *(void *)(v3 + 768) = "army green";
  *(void *)(v3 + 776) = 10;
  *(unsigned char *)(v3 + 784) = 2;
  *(void *)(v3 + 792) = "arylide yellow";
  *(void *)(v3 + 800) = 14;
  *(unsigned char *)(v3 + 808) = 2;
  *(void *)(v3 + 816) = "ash grey";
  *(void *)(v3 + 824) = 8;
  *(unsigned char *)(v3 + 832) = 2;
  *(void *)(v3 + 840) = "asparagus";
  *(void *)(v3 + 848) = 9;
  *(unsigned char *)(v3 + 856) = 2;
  *(void *)(v3 + 864) = "atomic tangerine";
  *(void *)(v3 + 872) = 16;
  *(unsigned char *)(v3 + 880) = 2;
  *(void *)(v3 + 888) = "auburn";
  *(void *)(v3 + 896) = 6;
  *(unsigned char *)(v3 + 904) = 2;
  *(void *)(v3 + 912) = "aureolin";
  *(void *)(v3 + 920) = 8;
  *(unsigned char *)(v3 + 928) = 2;
  *(void *)(v3 + 936) = "aurometalsaurus";
  *(void *)(v3 + 944) = 15;
  *(unsigned char *)(v3 + 952) = 2;
  *(void *)(v3 + 960) = "azure";
  *(void *)(v3 + 968) = 5;
  *(unsigned char *)(v3 + 976) = 2;
  *(void *)(v3 + 984) = "baby blue";
  *(void *)(v3 + 992) = 9;
  *(unsigned char *)(v3 + 1000) = 2;
  *(void *)(v3 + 1008) = "baby pink";
  *(void *)(v3 + 1016) = 9;
  *(unsigned char *)(v3 + 1024) = 2;
  *(void *)(v3 + 1032) = "banana mania";
  *(void *)(v3 + 1040) = 12;
  *(unsigned char *)(v3 + 1048) = 2;
  *(void *)(v3 + 1056) = "banana yellow";
  *(void *)(v3 + 1064) = 13;
  *(unsigned char *)(v3 + 1072) = 2;
  *(void *)(v3 + 1080) = "battleship grey";
  *(void *)(v3 + 1088) = 15;
  *(unsigned char *)(v3 + 1096) = 2;
  *(void *)(v3 + 1104) = "beau blue";
  *(void *)(v3 + 1112) = 9;
  *(unsigned char *)(v3 + 1120) = 2;
  *(void *)(v3 + 1128) = "beige";
  *(void *)(v3 + 1136) = 5;
  *(unsigned char *)(v3 + 1144) = 2;
  *(void *)(v3 + 1152) = "bisque";
  *(void *)(v3 + 1160) = 6;
  *(unsigned char *)(v3 + 1168) = 2;
  *(void *)(v3 + 1176) = "bistre";
  *(void *)(v3 + 1184) = 6;
  *(unsigned char *)(v3 + 1192) = 2;
  *(void *)(v3 + 1200) = "bittersweet";
  *(void *)(v3 + 1208) = 11;
  *(unsigned char *)(v3 + 1216) = 2;
  *(void *)(v3 + 1224) = "black";
  *(void *)(v3 + 1232) = 5;
  *(unsigned char *)(v3 + 1240) = 2;
  *(void *)(v3 + 1248) = "blanched almond";
  *(void *)(v3 + 1256) = 15;
  *(unsigned char *)(v3 + 1264) = 2;
  *(void *)(v3 + 1272) = "bleu de france";
  *(void *)(v3 + 1280) = 14;
  *(unsigned char *)(v3 + 1288) = 2;
  *(void *)(v3 + 1296) = "blond";
  *(void *)(v3 + 1304) = 5;
  *(unsigned char *)(v3 + 1312) = 2;
  *(void *)(v3 + 1320) = "blue";
  *(void *)(v3 + 1328) = 4;
  *(unsigned char *)(v3 + 1336) = 2;
  *(void *)(v3 + 1344) = "blue gray";
  *(void *)(v3 + 1352) = 9;
  *(unsigned char *)(v3 + 1360) = 2;
  *(void *)(v3 + 1368) = "blue green";
  *(void *)(v3 + 1376) = 10;
  *(unsigned char *)(v3 + 1384) = 2;
  *(void *)(v3 + 1392) = "blue purple";
  *(void *)(v3 + 1400) = 11;
  *(unsigned char *)(v3 + 1408) = 2;
  *(void *)(v3 + 1416) = "blue violet";
  *(void *)(v3 + 1424) = 11;
  *(unsigned char *)(v3 + 1432) = 2;
  *(void *)(v3 + 1440) = "blush";
  *(void *)(v3 + 1448) = 5;
  *(unsigned char *)(v3 + 1456) = 2;
  *(void *)(v3 + 1464) = "bondi blue";
  *(void *)(v3 + 1472) = 10;
  *(unsigned char *)(v3 + 1480) = 2;
  *(void *)(v3 + 1488) = "bone";
  *(void *)(v3 + 1496) = 4;
  *(unsigned char *)(v3 + 1504) = 2;
  *(void *)(v3 + 1512) = "boston university red";
  *(void *)(v3 + 1520) = 21;
  *(unsigned char *)(v3 + 1528) = 2;
  *(void *)(v3 + 1536) = "bottle green";
  *(void *)(v3 + 1544) = 12;
  *(unsigned char *)(v3 + 1552) = 2;
  *(void *)(v3 + 1560) = "boysenberry";
  *(void *)(v3 + 1568) = 11;
  *(unsigned char *)(v3 + 1576) = 2;
  *(void *)(v3 + 1584) = "brandeis blue";
  *(void *)(v3 + 1592) = 13;
  *(unsigned char *)(v3 + 1600) = 2;
  *(void *)(v3 + 1608) = "brass";
  *(void *)(v3 + 1616) = 5;
  *(unsigned char *)(v3 + 1624) = 2;
  *(void *)(v3 + 1632) = "brick red";
  *(void *)(v3 + 1640) = 9;
  *(unsigned char *)(v3 + 1648) = 2;
  *(void *)(v3 + 1656) = "begonia";
  *(void *)(v3 + 1664) = 7;
  *(unsigned char *)(v3 + 1672) = 2;
  *(void *)(v3 + 1680) = "bright red";
  *(void *)(v3 + 1688) = 10;
  *(unsigned char *)(v3 + 1696) = 2;
  *(void *)(v3 + 1704) = "bright white";
  *(void *)(v3 + 1712) = 12;
  *(unsigned char *)(v3 + 1720) = 2;
  *(void *)(v3 + 1728) = "bright yellow";
  *(void *)(v3 + 1736) = 13;
  *(unsigned char *)(v3 + 1744) = 2;
  *(void *)(v3 + 1752) = "bright blue";
  *(void *)(v3 + 1760) = 11;
  *(void *)(v3 + 1776) = "bright cerulean";
  *(void *)(v3 + 1800) = "bright green";
  *(void *)(v3 + 1824) = "bright lavender";
  *(void *)(v3 + 1848) = "bright maroon";
  *(void *)(v3 + 1872) = "bright pink";
  *(void *)(v3 + 1896) = "bright turquoise";
  *(void *)(v3 + 1920) = "brilliant lavender";
  *(void *)(v3 + 1944) = "brilliant rose";
  *(void *)(v3 + 1968) = "british racing green";
  *(void *)(v3 + 2640) = "candy pink";
  *(void *)(v3 + 2736) = "caribbean green";
  *(void *)(v3 + 2832) = "carnation pink";
  *(void *)(v3 + 2928) = "celadon";
  *(void *)(v3 + 3024) = "cerise pink";
  *(void *)(v3 + 3120) = "champagne";
  *(void *)(v3 + 3360) = "cinnamon";
  *(void *)(v3 + 3456) = "cocoa brown";
  *(void *)(v3 + 3552) = "cool grey";
  *(void *)(v3 + 3648) = "coral";
  *(void *)(v3 + 3744) = "corn";
  *(void *)(v3 + 3840) = "cornsilk";
  *(void *)(v3 + 3936) = "crimson";
  *(void *)(v3 + 4032) = "daffodil";
  *(void *)(v3 + 4128) = "dark byzantium";
  *(unsigned char *)(v3 + 1768) = 2;
  *(void *)(v3 + 4440) = "dark lavender";
  *(void *)(v3 + 4424) = 9;
  *(unsigned char *)(v3 + 4432) = 2;
  *(void *)(v3 + 4224) = "dark coral";
  *(void *)(v3 + 4400) = 10;
  *(unsigned char *)(v3 + 4408) = 2;
  *(void *)(v3 + 4416) = "dark lava";
  *(void *)(v3 + 4392) = "dark khaki";
  *(void *)(v3 + 4376) = 17;
  *(unsigned char *)(v3 + 4384) = 2;
  *(void *)(v3 + 4344) = "dark green";
  *(void *)(v3 + 4352) = 10;
  *(unsigned char *)(v3 + 4360) = 2;
  *(void *)(v3 + 4368) = "dark jungle green";
  *(unsigned char *)(v3 + 4312) = 2;
  *(void *)(v3 + 4320) = "dark gray";
  *(void *)(v3 + 4328) = 9;
  *(unsigned char *)(v3 + 4336) = 2;
  *(void *)(v3 + 4296) = "dark goldenrod";
  *(unsigned char *)(v3 + 4288) = 2;
  *(void *)(v3 + 4304) = 14;
  *(void *)(v3 + 4272) = "dark electric blue";
  *(void *)(v3 + 4256) = 9;
  *(unsigned char *)(v3 + 4264) = 2;
  *(void *)(v3 + 4280) = 18;
  *(void *)(v3 + 1784) = 15;
  *(void *)(v3 + 4248) = "dark cyan";
  *(void *)(v3 + 4232) = 10;
  *(unsigned char *)(v3 + 4240) = 2;
  *(void *)(v3 + 4200) = "dark chestnut";
  *(unsigned char *)(v3 + 4192) = 2;
  *(void *)(v3 + 4208) = 13;
  *(unsigned char *)(v3 + 4216) = 2;
  *(void *)(v3 + 4176) = "dark cerulean";
  *(void *)(v3 + 4160) = 20;
  *(unsigned char *)(v3 + 4168) = 2;
  *(void *)(v3 + 4184) = 13;
  *(unsigned char *)(v3 + 1792) = 2;
  *(void *)(v3 + 4152) = "dark candy apple red";
  *(void *)(v3 + 4136) = 14;
  *(unsigned char *)(v3 + 4144) = 2;
  *(void *)(v3 + 4104) = "dark brown";
  *(unsigned char *)(v3 + 4096) = 2;
  *(void *)(v3 + 4112) = 10;
  *(unsigned char *)(v3 + 4120) = 2;
  *(void *)(v3 + 4080) = "dark blue";
  *(void *)(v3 + 4064) = 9;
  *(unsigned char *)(v3 + 4072) = 2;
  *(void *)(v3 + 4088) = 9;
  *(void *)(v3 + 1808) = 12;
  *(void *)(v3 + 4056) = "dandelion";
  *(void *)(v3 + 4040) = 8;
  *(unsigned char *)(v3 + 4048) = 2;
  *(void *)(v3 + 4008) = "cyan";
  *(unsigned char *)(v3 + 4000) = 2;
  *(void *)(v3 + 4016) = 4;
  *(unsigned char *)(v3 + 4024) = 2;
  *(void *)(v3 + 3984) = "crimson glory";
  *(void *)(v3 + 3968) = 11;
  *(unsigned char *)(v3 + 3976) = 2;
  *(void *)(v3 + 3992) = 13;
  *(unsigned char *)(v3 + 1816) = 2;
  *(void *)(v3 + 3960) = "crimson red";
  *(void *)(v3 + 3944) = 7;
  *(unsigned char *)(v3 + 3952) = 2;
  *(void *)(v3 + 3912) = "cream";
  *(unsigned char *)(v3 + 3904) = 2;
  *(void *)(v3 + 3920) = 5;
  *(unsigned char *)(v3 + 3928) = 2;
  *(void *)(v3 + 3888) = "cotton candy";
  *(void *)(v3 + 3872) = 12;
  *(unsigned char *)(v3 + 3880) = 2;
  *(void *)(v3 + 3896) = 12;
  *(void *)(v3 + 1832) = 15;
  *(void *)(v3 + 3864) = "cosmic latte";
  *(void *)(v3 + 3848) = 8;
  *(unsigned char *)(v3 + 3856) = 2;
  *(void *)(v3 + 3816) = "cornflower blue";
  *(unsigned char *)(v3 + 3808) = 2;
  *(void *)(v3 + 3824) = 15;
  *(unsigned char *)(v3 + 3832) = 2;
  *(void *)(v3 + 3792) = "cornflower";
  *(void *)(v3 + 3776) = 11;
  *(unsigned char *)(v3 + 3784) = 2;
  *(void *)(v3 + 3800) = 10;
  *(unsigned char *)(v3 + 1840) = 2;
  *(void *)(v3 + 3768) = "cornell red";
  *(void *)(v3 + 3752) = 4;
  *(unsigned char *)(v3 + 3760) = 2;
  *(void *)(v3 + 3720) = "cordovan";
  *(unsigned char *)(v3 + 3712) = 2;
  *(void *)(v3 + 3728) = 8;
  *(unsigned char *)(v3 + 3736) = 2;
  *(void *)(v3 + 3696) = "coral red";
  *(void *)(v3 + 3680) = 10;
  *(unsigned char *)(v3 + 3688) = 2;
  *(void *)(v3 + 3704) = 9;
  *(void *)(v3 + 1856) = 13;
  *(void *)(v3 + 3672) = "coral pink";
  *(void *)(v3 + 3656) = 5;
  *(unsigned char *)(v3 + 3664) = 2;
  *(void *)(v3 + 3624) = "coquelicot";
  *(unsigned char *)(v3 + 3616) = 2;
  *(void *)(v3 + 3632) = 10;
  *(unsigned char *)(v3 + 3640) = 2;
  *(void *)(v3 + 3600) = "copper rose";
  *(void *)(v3 + 3584) = 6;
  *(unsigned char *)(v3 + 3592) = 2;
  *(void *)(v3 + 3608) = 11;
  *(unsigned char *)(v3 + 1864) = 2;
  *(void *)(v3 + 3576) = "copper";
  *(void *)(v3 + 3560) = 9;
  *(unsigned char *)(v3 + 3568) = 2;
  *(void *)(v3 + 3528) = "cool black";
  *(unsigned char *)(v3 + 3520) = 2;
  *(void *)(v3 + 3536) = 10;
  *(unsigned char *)(v3 + 3544) = 2;
  *(void *)(v3 + 3504) = "columbia blue";
  *(void *)(v3 + 3488) = 6;
  *(unsigned char *)(v3 + 3496) = 2;
  *(void *)(v3 + 3512) = 13;
  *(void *)(v3 + 1880) = 11;
  *(void *)(v3 + 3480) = "coffee";
  *(void *)(v3 + 3464) = 11;
  *(unsigned char *)(v3 + 3472) = 2;
  *(void *)(v3 + 3432) = "cobalt";
  *(unsigned char *)(v3 + 3424) = 2;
  *(void *)(v3 + 3440) = 6;
  *(unsigned char *)(v3 + 3448) = 2;
  *(void *)(v3 + 3408) = "classic rose";
  *(void *)(v3 + 3392) = 7;
  *(unsigned char *)(v3 + 3400) = 2;
  *(void *)(v3 + 3416) = 12;
  *(unsigned char *)(v3 + 1888) = 2;
  *(void *)(v3 + 3384) = "citrine";
  *(void *)(v3 + 3368) = 8;
  *(unsigned char *)(v3 + 3376) = 2;
  *(void *)(v3 + 3336) = "cinnabar";
  *(unsigned char *)(v3 + 3328) = 2;
  *(void *)(v3 + 3344) = 8;
  *(unsigned char *)(v3 + 3352) = 2;
  *(void *)(v3 + 3312) = "cinereous";
  *(void *)(v3 + 3296) = 13;
  *(unsigned char *)(v3 + 3304) = 2;
  *(void *)(v3 + 3320) = 9;
  *(void *)(v3 + 1904) = 16;
  *(void *)(v3 + 3288) = "chrome yellow";
  *(void *)(v3 + 3272) = 9;
  *(unsigned char *)(v3 + 3280) = 2;
  *(void *)(v3 + 3216) = "cherry blossom pink";
  *(void *)(v3 + 3248) = 8;
  *(unsigned char *)(v3 + 3256) = 2;
  *(void *)(v3 + 3264) = "chocolate";
  *(void *)(v3 + 3240) = "chestnut";
  *(void *)(v3 + 3224) = 19;
  *(unsigned char *)(v3 + 3232) = 2;
  *(void *)(v3 + 3192) = "cherry";
  *(unsigned char *)(v3 + 3184) = 2;
  *(void *)(v3 + 3200) = 6;
  *(unsigned char *)(v3 + 3208) = 2;
  *(void *)(v3 + 3168) = "chartreuse";
  *(void *)(v3 + 3152) = 8;
  *(unsigned char *)(v3 + 3160) = 2;
  *(void *)(v3 + 3176) = 10;
  *(unsigned char *)(v3 + 1912) = 2;
  *(void *)(v3 + 3144) = "charcoal";
  *(void *)(v3 + 3128) = 9;
  *(unsigned char *)(v3 + 3136) = 2;
  *(void *)(v3 + 3096) = "chamoisee";
  *(unsigned char *)(v3 + 3088) = 2;
  *(void *)(v3 + 3104) = 9;
  *(unsigned char *)(v3 + 3112) = 2;
  *(void *)(v3 + 3072) = "cerulean blue";
  *(void *)(v3 + 3056) = 8;
  *(unsigned char *)(v3 + 3064) = 2;
  *(void *)(v3 + 3080) = 13;
  *(void *)(v3 + 1928) = 18;
  *(void *)(v3 + 3048) = "cerulean";
  *(void *)(v3 + 3032) = 11;
  *(unsigned char *)(v3 + 3040) = 2;
  *(void *)(v3 + 3000) = "cerise";
  *(unsigned char *)(v3 + 2992) = 2;
  *(void *)(v3 + 3008) = 6;
  *(unsigned char *)(v3 + 3016) = 2;
  *(void *)(v3 + 2976) = "celestial blue";
  *(void *)(v3 + 2960) = 7;
  *(unsigned char *)(v3 + 2968) = 2;
  *(void *)(v3 + 2984) = 14;
  *(unsigned char *)(v3 + 1936) = 2;
  *(void *)(v3 + 2952) = "celeste";
  *(void *)(v3 + 2936) = 7;
  *(unsigned char *)(v3 + 2944) = 2;
  *(void *)(v3 + 2904) = "carrot orange";
  *(unsigned char *)(v3 + 2896) = 2;
  *(void *)(v3 + 2912) = 13;
  *(unsigned char *)(v3 + 2920) = 2;
  *(void *)(v3 + 2880) = "carolina blue";
  *(void *)(v3 + 2864) = 9;
  *(unsigned char *)(v3 + 2872) = 2;
  *(void *)(v3 + 2888) = 13;
  *(void *)(v3 + 1952) = 14;
  *(void *)(v3 + 2856) = "carnelian";
  *(void *)(v3 + 2840) = 14;
  *(unsigned char *)(v3 + 2848) = 2;
  *(void *)(v3 + 2808) = "carmine red";
  *(unsigned char *)(v3 + 2800) = 2;
  *(void *)(v3 + 2816) = 11;
  *(unsigned char *)(v3 + 2824) = 2;
  *(void *)(v3 + 2784) = "carmine pink";
  *(void *)(v3 + 2768) = 7;
  *(unsigned char *)(v3 + 2776) = 2;
  *(void *)(v3 + 2792) = 12;
  *(unsigned char *)(v3 + 1960) = 2;
  *(void *)(v3 + 2760) = "carmine";
  *(void *)(v3 + 2744) = 15;
  *(unsigned char *)(v3 + 2752) = 2;
  *(void *)(v3 + 2712) = "cardinal";
  *(unsigned char *)(v3 + 2704) = 2;
  *(void *)(v3 + 2720) = 8;
  *(unsigned char *)(v3 + 2728) = 2;
  *(void *)(v3 + 2688) = "caput mortuum";
  *(void *)(v3 + 2672) = 5;
  *(unsigned char *)(v3 + 2680) = 2;
  *(void *)(v3 + 2696) = 13;
  *(void *)(v3 + 1976) = 20;
  *(void *)(v3 + 2664) = "capri";
  *(void *)(v3 + 2648) = 10;
  *(unsigned char *)(v3 + 2656) = 2;
  *(void *)(v3 + 2616) = "candy apple red";
  *(unsigned char *)(v3 + 2608) = 2;
  *(void *)(v3 + 2624) = 15;
  *(unsigned char *)(v3 + 2632) = 2;
  *(void *)(v3 + 2592) = "canary yellow";
  *(void *)(v3 + 2576) = 6;
  *(unsigned char *)(v3 + 2584) = 2;
  *(void *)(v3 + 2600) = 13;
  *(unsigned char *)(v3 + 1984) = 2;
  *(void *)(v3 + 2568) = "canary";
  *(void *)(v3 + 2552) = 16;
  *(unsigned char *)(v3 + 2560) = 2;
  *(void *)(v3 + 2520) = "cambridge blue";
  *(void *)(v3 + 2528) = 14;
  *(unsigned char *)(v3 + 2536) = 2;
  *(void *)(v3 + 2544) = "camouflage green";
  *(unsigned char *)(v3 + 2488) = 2;
  *(void *)(v3 + 2496) = "cal poly pomona green";
  *(void *)(v3 + 2504) = 21;
  *(unsigned char *)(v3 + 2512) = 2;
  *(void *)(v3 + 1992) = "bronze";
  *(void *)(v3 + 2000) = 6;
  *(unsigned char *)(v3 + 2008) = 2;
  *(void *)(v3 + 2480) = 14;
  *(void *)(v3 + 2016) = "brown";
  *(void *)(v3 + 2024) = 5;
  *(unsigned char *)(v3 + 2032) = 2;
  *(void *)(v3 + 2040) = "bubble gum";
  *(void *)(v3 + 2048) = 10;
  *(unsigned char *)(v3 + 2056) = 2;
  *(void *)(v3 + 2064) = "buff";
  *(void *)(v3 + 2072) = 4;
  *(unsigned char *)(v3 + 2080) = 2;
  *(void *)(v3 + 2088) = "bulgarian rose";
  *(void *)(v3 + 2096) = 14;
  *(unsigned char *)(v3 + 2104) = 2;
  *(void *)(v3 + 2112) = "burgundy";
  *(void *)(v3 + 2120) = 8;
  *(unsigned char *)(v3 + 2128) = 2;
  *(void *)(v3 + 2136) = "burlywood";
  *(void *)(v3 + 2144) = 9;
  *(unsigned char *)(v3 + 2152) = 2;
  *(void *)(v3 + 2160) = "burnt orange";
  *(void *)(v3 + 2168) = 12;
  *(unsigned char *)(v3 + 2176) = 2;
  *(void *)(v3 + 2184) = "burnt sienna";
  *(void *)(v3 + 2192) = 12;
  *(unsigned char *)(v3 + 2200) = 2;
  *(void *)(v3 + 2208) = "burnt umber";
  *(void *)(v3 + 2216) = 11;
  *(unsigned char *)(v3 + 2224) = 2;
  *(void *)(v3 + 2232) = "byzantine";
  *(void *)(v3 + 2240) = 9;
  *(unsigned char *)(v3 + 2248) = 2;
  *(void *)(v3 + 2256) = "byzantium";
  *(void *)(v3 + 2264) = 9;
  *(unsigned char *)(v3 + 2272) = 2;
  *(void *)(v3 + 2280) = "cg blue";
  *(void *)(v3 + 2288) = 7;
  *(unsigned char *)(v3 + 2296) = 2;
  *(void *)(v3 + 2304) = "cg red";
  *(void *)(v3 + 2312) = 6;
  *(unsigned char *)(v3 + 2320) = 2;
  *(void *)(v3 + 2328) = "cadet";
  *(void *)(v3 + 2336) = 5;
  *(unsigned char *)(v3 + 2344) = 2;
  *(void *)(v3 + 2352) = "cadet blue";
  *(void *)(v3 + 2360) = 10;
  *(unsigned char *)(v3 + 2368) = 2;
  *(void *)(v3 + 2376) = "cadet grey";
  *(void *)(v3 + 2384) = 10;
  *(unsigned char *)(v3 + 2392) = 2;
  *(void *)(v3 + 2400) = "cadmium green";
  *(void *)(v3 + 2408) = 13;
  *(unsigned char *)(v3 + 2416) = 2;
  *(void *)(v3 + 2424) = "cadmium orange";
  *(void *)(v3 + 2432) = 14;
  *(unsigned char *)(v3 + 2440) = 2;
  *(void *)(v3 + 2448) = "cadmium red";
  *(void *)(v3 + 2456) = 11;
  *(unsigned char *)(v3 + 2464) = 2;
  *(void *)(v3 + 2472) = "cadmium yellow";
  *(void *)(v3 + 4448) = 13;
  *(unsigned char *)(v3 + 4456) = 2;
  *(void *)(v3 + 4464) = "dark magenta";
  *(void *)(v3 + 4472) = 12;
  *(unsigned char *)(v3 + 4480) = 2;
  *(void *)(v3 + 4488) = "dark midnight blue";
  *(void *)(v3 + 4496) = 18;
  *(unsigned char *)(v3 + 4504) = 2;
  *(void *)(v3 + 4512) = "dark olive green";
  *(void *)(v3 + 4520) = 16;
  *(unsigned char *)(v3 + 4528) = 2;
  *(void *)(v3 + 4536) = "dark orange";
  *(void *)(v3 + 4544) = 11;
  *(unsigned char *)(v3 + 4552) = 2;
  *(void *)(v3 + 4560) = "dark orchid";
  *(void *)(v3 + 4568) = 11;
  *(unsigned char *)(v3 + 4576) = 2;
  *(void *)(v3 + 4584) = "dark pastel blue";
  *(void *)(v3 + 4592) = 16;
  *(unsigned char *)(v3 + 4600) = 2;
  *(void *)(v3 + 4608) = "dark pastel green";
  *(void *)(v3 + 4616) = 17;
  *(unsigned char *)(v3 + 4624) = 2;
  *(void *)(v3 + 4632) = "dark pastel purple";
  *(void *)(v3 + 4640) = 18;
  *(unsigned char *)(v3 + 4648) = 2;
  *(void *)(v3 + 4656) = "dark pastel red";
  *(void *)(v3 + 4664) = 15;
  *(unsigned char *)(v3 + 4672) = 2;
  *(void *)(v3 + 4680) = "dark pink";
  *(void *)(v3 + 4688) = 9;
  *(unsigned char *)(v3 + 4696) = 2;
  *(void *)(v3 + 4704) = "dark powder blue";
  *(void *)(v3 + 4712) = 16;
  *(unsigned char *)(v3 + 4720) = 2;
  *(void *)(v3 + 4728) = "dark raspberry";
  *(void *)(v3 + 4736) = 14;
  *(unsigned char *)(v3 + 4744) = 2;
  *(void *)(v3 + 4752) = "dark red";
  *(void *)(v3 + 4760) = 8;
  *(unsigned char *)(v3 + 4768) = 2;
  *(void *)(v3 + 4776) = "dark salmon";
  *(void *)(v3 + 4784) = 11;
  *(unsigned char *)(v3 + 4792) = 2;
  *(void *)(v3 + 4800) = "dark scarlet";
  *(void *)(v3 + 4808) = 12;
  *(unsigned char *)(v3 + 4816) = 2;
  *(void *)(v3 + 4824) = "dark sea green";
  *(void *)(v3 + 4832) = 14;
  *(unsigned char *)(v3 + 4840) = 2;
  *(void *)(v3 + 4848) = "dark sienna";
  *(void *)(v3 + 4856) = 11;
  *(unsigned char *)(v3 + 4864) = 2;
  *(void *)(v3 + 4872) = "dark slate blue";
  *(void *)(v3 + 4880) = 15;
  *(unsigned char *)(v3 + 4888) = 2;
  *(void *)(v3 + 4896) = "dark slate gray";
  *(void *)(v3 + 4904) = 15;
  *(unsigned char *)(v3 + 4912) = 2;
  *(void *)(v3 + 4920) = "dark spring green";
  *(void *)(v3 + 4928) = 17;
  *(unsigned char *)(v3 + 4936) = 2;
  *(void *)(v3 + 4944) = "dark tan";
  *(void *)(v3 + 4952) = 8;
  *(unsigned char *)(v3 + 4960) = 2;
  *(void *)(v3 + 4968) = "dark tangerine";
  *(void *)(v3 + 4976) = 14;
  *(unsigned char *)(v3 + 4984) = 2;
  *(void *)(v3 + 4992) = "dark taupe";
  *(void *)(v3 + 5000) = 10;
  *(unsigned char *)(v3 + 5008) = 2;
  *(void *)(v3 + 5016) = "dark terra cotta";
  *(void *)(v3 + 5040) = "dark turquoise";
  *(void *)(v3 + 5064) = "dark violet";
  *(void *)(v3 + 5088) = "dark yellow";
  *(void *)(v3 + 5112) = "dartmouth green";
  *(void *)(v3 + 5136) = "davy grey";
  *(void *)(v3 + 5160) = "deep carmine";
  *(void *)(v3 + 5184) = "deep carmine pink";
  *(void *)(v3 + 5208) = "deep carrot orange";
  *(void *)(v3 + 5232) = "deep cerise";
  *(void *)(v3 + 5256) = "deep champagne";
  *(void *)(v3 + 5280) = "deep chestnut";
  *(void *)(v3 + 5304) = "deep coffee";
  *(void *)(v3 + 5328) = "deep fuchsia";
  *(void *)(v3 + 5352) = "deep jungle green";
  *(void *)(v3 + 5376) = "deep lilac";
  *(void *)(v3 + 5400) = "deep magenta";
  *(void *)(v3 + 5424) = "deep peach";
  *(void *)(v3 + 5448) = "deep pink";
  *(void *)(v3 + 5472) = "deep saffron";
  *(void *)(v3 + 5496) = "deep sky blue";
  *(void *)(v3 + 5520) = "denim";
  *(void *)(v3 + 5544) = "desert";
  *(void *)(v3 + 5568) = "desert sand";
  *(void *)(v3 + 5592) = "dim gray";
  *(void *)(v3 + 5616) = "dodger blue";
  *(void *)(v3 + 5640) = "dogwood rose";
  *(void *)(v3 + 5664) = "dollar bill";
  *(void *)(v3 + 5688) = "drab";
  *(void *)(v3 + 5712) = "duke blue";
  *(void *)(v3 + 5736) = "earth yellow";
  *(void *)(v3 + 5760) = "ecru";
  *(void *)(v3 + 5784) = "eggplant";
  *(void *)(v3 + 5808) = "eggshell";
  *(void *)(v3 + 5832) = "egyptian blue";
  *(void *)(v3 + 5856) = "electric blue";
  *(void *)(v3 + 5880) = "electric crimson";
  *(void *)(v3 + 5904) = "electric cyan";
  *(void *)(v3 + 5928) = "electric indigo";
  *(void *)(v3 + 5952) = "electric lavender";
  *(void *)(v3 + 5976) = "electric lime";
  *(void *)(v3 + 6000) = "electric purple";
  *(void *)(v3 + 6024) = "electric ultramarine";
  *(void *)(v3 + 6048) = "electric violet";
  *(void *)(v3 + 6072) = "emerald";
  *(void *)(v3 + 6096) = "eton blue";
  *(void *)(v3 + 6120) = "fallow";
  *(void *)(v3 + 6144) = "falu red";
  *(void *)(v3 + 6168) = "fashion fuchsia";
  *(void *)(v3 + 6192) = "fawn";
  *(void *)(v3 + 6216) = "fern";
  *(void *)(v3 + 6240) = "fern green";
  *(void *)(v3 + 6264) = "ferrari red";
  *(void *)(v3 + 6288) = "field drab";
  *(void *)(v3 + 6312) = "fire engine red";
  *(void *)(v3 + 6336) = "firebrick";
  *(void *)(v3 + 6360) = "flame";
  *(void *)(v3 + 6384) = "flamingo pink";
  *(void *)(v3 + 6408) = "flavescent";
  *(void *)(v3 + 6432) = "flax";
  *(void *)(v3 + 6456) = "floral white";
  *(void *)(v3 + 6480) = "fluorescent orange";
  *(void *)(v3 + 6504) = "fluorescent pink";
  *(void *)(v3 + 6528) = "fluorescent yellow";
  *(void *)(v3 + 6552) = "folly";
  *(void *)(v3 + 6576) = "forest green";
  *(void *)(v3 + 6600) = "french beige";
  *(void *)(v3 + 6624) = "french blue";
  *(void *)(v3 + 6648) = "french lilac";
  *(void *)(v3 + 6672) = "french rose";
  *(void *)(v3 + 6696) = "fuchsia";
  *(void *)(v3 + 6720) = "fuchsia pink";
  *(void *)(v3 + 6744) = "fuzzy wuzzy";
  *(void *)(v3 + 6768) = "gainsboro";
  *(void *)(v3 + 6792) = "gamboge";
  *(void *)(v3 + 6816) = "ghost white";
  *(void *)(v3 + 6840) = "ginger";
  *(void *)(v3 + 6864) = "glaucous";
  *(void *)(v3 + 6888) = "glitter";
  *(void *)(v3 + 6912) = "gold";
  *(void *)(v3 + 6936) = "golden brown";
  *(void *)(v3 + 6960) = "golden poppy";
  *(void *)(v3 + 6984) = "golden yellow";
  *(void *)(v3 + 7008) = "goldenrod";
  *(void *)(v3 + 7032) = "granny smith apple";
  *(void *)(v3 + 7056) = "gray";
  *(void *)(v3 + 7080) = "green";
  *(void *)(v3 + 7104) = "green blue";
  *(void *)(v3 + 7128) = "green yellow";
  *(void *)(v3 + 7152) = "grullo";
  *(void *)(v3 + 7176) = "guppie green";
  *(void *)(v3 + 7200) = "han blue";
  *(void *)(v3 + 7224) = "han purple";
  *(void *)(v3 + 7248) = "hansa yellow";
  *(void *)(v3 + 7272) = "harvard crimson";
  *(void *)(v3 + 7296) = "harvest gold";
  *(void *)(v3 + 7320) = "heart gold";
  *(void *)(v3 + 7344) = "heliotrope";
  *(void *)(v3 + 7368) = "hollywood cerise";
  *(void *)(v3 + 7392) = "honeydew";
  *(void *)(v3 + 7416) = "hot magenta";
  *(void *)(v3 + 7440) = "hot pink";
  *(void *)(v3 + 7464) = "icterine";
  *(void *)(v3 + 7488) = "incandescent";
  *(void *)(v3 + 7512) = "indigo";
  *(void *)(v3 + 7536) = "international klein blue";
  *(void *)(v3 + 7544) = 24;
  *(void *)(v3 + 7560) = "international orange";
  *(void *)(v3 + 7584) = "iris";
  *(void *)(v3 + 7608) = "isabelline";
  *(void *)(v3 + 7632) = "ivory";
  *(void *)(v3 + 7656) = "jade";
  *(void *)(v3 + 7680) = "jasmine";
  *(void *)(v3 + 7704) = "jasper";
  *(void *)(v3 + 7728) = "jazzberry jam";
  *(void *)(v3 + 7752) = "jonquil";
  *(void *)(v3 + 7776) = "june bud";
  *(void *)(v3 + 7800) = "jungle green";
  *(void *)(v3 + 7824) = "kelly green";
  *(void *)(v3 + 7848) = "khaki";
  *(void *)(v3 + 7872) = "la salle green";
  *(void *)(v3 + 7896) = "languid lavender";
  *(void *)(v3 + 7920) = "lapis lazuli";
  *(void *)(v3 + 7944) = "laser lemon";
  *(void *)(v3 + 7992) = "lava";
  *(void *)(v3 + 8016) = "lavender";
  *(void *)(v3 + 8040) = "lavender blue";
  *(void *)(v3 + 8064) = "lavender blush";
  *(void *)(v3 + 8088) = "lavender gray";
  *(void *)(v3 + 8112) = "lavender indigo";
  *(void *)(v3 + 8136) = "lavender mist";
  *(void *)(v3 + 8160) = "lavender pink";
  *(void *)(v3 + 8184) = "lavender purple";
  *(void *)(v3 + 8208) = "lavender rose";
  *(void *)(v3 + 8232) = "lawn green";
  *(void *)(v3 + 8256) = "lemon";
  *(void *)(v3 + 8280) = "lemon yellow";
  *(void *)(v3 + 8304) = "lemon chiffon";
  *(void *)(v3 + 8328) = "lemon lime";
  *(void *)(v3 + 8352) = "light crimson";
  *(void *)(v3 + 8376) = "light thulian pink";
  *(void *)(v3 + 8400) = "light apricot";
  *(void *)(v3 + 8424) = "light blue";
  *(void *)(v3 + 8448) = "light brown";
  *(void *)(v3 + 8472) = "light carmine pink";
  *(void *)(v3 + 8496) = "light coral";
  *(void *)(v3 + 8520) = "light cornflower blue";
  *(void *)(v3 + 8528) = 21;
  *(void *)(v3 + 8544) = "light cyan";
  *(void *)(v3 + 8568) = "light fuchsia pink";
  *(void *)(v3 + 8592) = "light goldenrod yellow";
  *(void *)(v3 + 8616) = "light gray";
  *(void *)(v3 + 8640) = "light green";
  *(void *)(v3 + 8648) = 11;
  *(unsigned char *)(v3 + 8656) = 2;
  *(void *)(v3 + 8664) = "light khaki";
  *(void *)(v3 + 8672) = 11;
  *(unsigned char *)(v3 + 8680) = 2;
  *(void *)(v3 + 8688) = "light pastel purple";
  *(void *)(v3 + 8696) = 19;
  *(unsigned char *)(v3 + 8704) = 2;
  *(void *)(v3 + 8712) = "light pink";
  *(void *)(v3 + 8720) = 10;
  *(unsigned char *)(v3 + 8728) = 2;
  *(void *)(v3 + 8736) = "light salmon";
  *(void *)(v3 + 8744) = 12;
  *(unsigned char *)(v3 + 8752) = 2;
  *(void *)(v3 + 8760) = "light salmon pink";
  *(void *)(v3 + 8768) = 17;
  *(unsigned char *)(v3 + 8776) = 2;
  *(void *)(v3 + 8784) = "light sea green";
  *(void *)(v3 + 8792) = 15;
  *(unsigned char *)(v3 + 8800) = 2;
  *(void *)(v3 + 8808) = "light sky blue";
  *(void *)(v3 + 8816) = 14;
  *(unsigned char *)(v3 + 8824) = 2;
  *(void *)(v3 + 8832) = "light slate gray";
  *(void *)(v3 + 8856) = "light taupe";
  *(void *)(v3 + 8880) = "light yellow";
  *(void *)(v3 + 8904) = "lilac";
  *(void *)(v3 + 8928) = "lime";
  *(void *)(v3 + 8952) = "lime green";
  *(void *)(v3 + 8976) = "lincoln green";
  *(void *)(v3 + 9000) = "linen";
  *(void *)(v3 + 9024) = "lion";
  *(unsigned char *)(v3 + 9040) = 2;
  *(void *)(v3 + 9048) = "msu green";
  *(void *)(v3 + 9072) = "magenta";
  *(void *)(v3 + 9096) = "magic mint";
  *(void *)(v3 + 9120) = "magnolia";
  *(void *)(v3 + 9144) = "mahogany";
  *(void *)(v3 + 9168) = "maize";
  *(void *)(v3 + 9192) = "majorelle blue";
  *(void *)(v3 + 9216) = "malachite";
  *(void *)(v3 + 9240) = "mango tango";
  *(void *)(v3 + 9264) = "maroon";
  *(void *)(v3 + 9288) = "mauve";
  *(void *)(v3 + 9312) = "mauve taupe";
  *(void *)(v3 + 9336) = "mauvelous";
  *(void *)(v3 + 9360) = "medium persian blue";
  *(void *)(v3 + 9384) = "medium aquamarine";
  *(void *)(v3 + 9408) = "medium blue";
  *(void *)(v3 + 9432) = "medium candy apple red";
  *(void *)(v3 + 9456) = "medium carmine";
  *(void *)(v3 + 9480) = "medium champagne";
  *(void *)(v3 + 9504) = "medium electric blue";
  *(void *)(v3 + 9528) = "medium jungle green";
  *(void *)(v3 + 9552) = "medium lavender magenta";
  *(void *)(v3 + 9576) = "medium orchid";
  *(void *)(v3 + 9600) = "medium purple";
  *(void *)(v3 + 9624) = "medium red violet";
  *(void *)(v3 + 9648) = "medium sea green";
  *(void *)(v3 + 9672) = "medium slate blue";
  *(void *)(v3 + 9696) = "medium spring green";
  *(void *)(v3 + 9720) = "medium taupe";
  *(void *)(v3 + 9744) = "medium teal blue";
  *(void *)(v3 + 9768) = "medium turquoise";
  *(void *)(v3 + 9792) = "medium violet red";
  *(void *)(v3 + 9816) = "melon";
  *(void *)(v3 + 9840) = "midnight blue";
  *(void *)(v3 + 9864) = "midnight green";
  *(void *)(v3 + 9888) = "mikado yellow";
  *(void *)(v3 + 9912) = "mint";
  *(void *)(v3 + 9936) = "mint cream";
  *(void *)(v3 + 9960) = "mint green";
  *(void *)(v3 + 9984) = "misty rose";
  *(void *)(v3 + 10008) = "moccasin";
  *(void *)(v3 + 10032) = "mode beige";
  *(void *)(v3 + 10056) = "moonstone blue";
  *(void *)(v3 + 10080) = "mordant red 19";
  *(void *)(v3 + 10104) = "moss green";
  *(void *)(v3 + 10128) = "mountain meadow";
  *(void *)(v3 + 10152) = "mountbatten pink";
  *(void *)(v3 + 10176) = "mulberry";
  *(void *)(v3 + 10200) = "munsell";
  *(void *)(v3 + 10224) = "mustard";
  *(void *)(v3 + 10248) = "myrtle";
  *(void *)(v3 + 10272) = "nadeshiko pink";
  *(void *)(v3 + 10296) = "napier green";
  *(void *)(v3 + 10320) = "naples yellow";
  *(void *)(v3 + 10344) = "navajo white";
  *(void *)(v3 + 10368) = "navy blue";
  *(void *)(v3 + 10392) = "neon carrot";
  *(void *)(v3 + 10416) = "neon fuchsia";
  *(void *)(v3 + 10440) = "neon green";
  *(void *)(v3 + 10464) = "north texas green";
  *(void *)(v3 + 10488) = "ocean boat blue";
  *(void *)(v3 + 10512) = "ochre";
  *(void *)(v3 + 10536) = "office green";
  *(void *)(v3 + 10560) = "old gold";
  *(void *)(v3 + 10584) = "old lace";
  *(void *)(v3 + 10608) = "old lavender";
  *(void *)(v3 + 10632) = "old mauve";
  *(void *)(v3 + 10656) = "old rose";
  *(void *)(v3 + 10680) = "olive";
  *(void *)(v3 + 10704) = "olive drab";
  *(void *)(v3 + 10728) = "olive green";
  *(void *)(v3 + 10752) = "olivine";
  *(void *)(v3 + 10776) = "onyx";
  *(void *)(v3 + 10800) = "opera mauve";
  *(void *)(v3 + 10824) = "orange";
  *(void *)(v3 + 10848) = "orange yellow";
  *(void *)(v3 + 10872) = "orange peel";
  *(void *)(v3 + 10896) = "orange red";
  *(void *)(v3 + 10920) = "orchid";
  *(void *)(v3 + 10944) = "otter brown";
  *(void *)(v3 + 10968) = "outer space";
  *(void *)(v3 + 10992) = "outrageous orange";
  *(void *)(v3 + 11568) = "paris green";
  *(void *)(v3 + 11664) = "pastel green";
  *(void *)(v3 + 11760) = "pastel purple";
  *(void *)(v3 + 11856) = "payne grey";
  *(void *)(v3 + 11952) = "pear";
  *(void *)(v3 + 12048) = "periwinkle";
  *(void *)(v3 + 12144) = "persian pink";
  *(void *)(v3 + 12240) = "phlox";
  *(void *)(v3 + 8600) = 22;
  *(unsigned char *)(v3 + 8608) = 2;
  *(void *)(v3 + 8624) = 10;
  *(unsigned char *)(v3 + 8632) = 2;
  *(void *)(v3 + 5024) = 16;
  *(unsigned char *)(v3 + 5032) = 2;
  *(void *)(v3 + 8552) = 10;
  *(unsigned char *)(v3 + 8560) = 2;
  *(void *)(v3 + 8576) = 18;
  *(unsigned char *)(v3 + 8584) = 2;
  *(void *)(v3 + 5048) = 14;
  *(unsigned char *)(v3 + 5056) = 2;
  *(void *)(v3 + 5072) = 11;
  *(void *)(v3 + 8504) = 11;
  *(unsigned char *)(v3 + 8512) = 2;
  *(unsigned char *)(v3 + 8536) = 2;
  *(unsigned char *)(v3 + 5080) = 2;
  *(void *)(v3 + 5096) = 11;
  *(void *)(v3 + 8456) = 11;
  *(unsigned char *)(v3 + 8464) = 2;
  *(void *)(v3 + 8480) = 18;
  *(unsigned char *)(v3 + 8488) = 2;
  *(unsigned char *)(v3 + 5104) = 2;
  *(void *)(v3 + 5120) = 15;
  *(void *)(v3 + 8408) = 13;
  *(unsigned char *)(v3 + 8416) = 2;
  *(void *)(v3 + 8432) = 10;
  *(unsigned char *)(v3 + 8440) = 2;
  *(unsigned char *)(v3 + 5128) = 2;
  *(void *)(v3 + 5144) = 9;
  *(void *)(v3 + 8360) = 13;
  *(unsigned char *)(v3 + 8368) = 2;
  *(void *)(v3 + 8384) = 18;
  *(unsigned char *)(v3 + 8392) = 2;
  *(unsigned char *)(v3 + 5152) = 2;
  *(void *)(v3 + 5168) = 12;
  *(void *)(v3 + 8312) = 13;
  *(unsigned char *)(v3 + 8320) = 2;
  *(void *)(v3 + 8336) = 10;
  *(unsigned char *)(v3 + 8344) = 2;
  *(unsigned char *)(v3 + 5176) = 2;
  *(void *)(v3 + 5192) = 17;
  *(void *)(v3 + 8264) = 5;
  *(unsigned char *)(v3 + 8272) = 2;
  *(void *)(v3 + 8288) = 12;
  *(unsigned char *)(v3 + 8296) = 2;
  *(unsigned char *)(v3 + 5200) = 2;
  *(void *)(v3 + 5216) = 18;
  *(void *)(v3 + 8216) = 13;
  *(unsigned char *)(v3 + 8224) = 2;
  *(void *)(v3 + 8240) = 10;
  *(unsigned char *)(v3 + 8248) = 2;
  *(unsigned char *)(v3 + 5224) = 2;
  *(void *)(v3 + 8168) = 13;
  *(unsigned char *)(v3 + 8176) = 2;
  *(void *)(v3 + 0x2000) = 15;
  *(void *)(v3 + 7952) = 11;
  *(unsigned char *)(v3 + 8200) = 2;
  *(void *)(v3 + 5240) = 11;
  *(unsigned char *)(v3 + 5248) = 2;
  *(void *)(v3 + 8120) = 15;
  *(unsigned char *)(v3 + 8128) = 2;
  *(void *)(v3 + 8144) = 13;
  *(unsigned char *)(v3 + 8152) = 2;
  *(void *)(v3 + 5264) = 14;
  *(unsigned char *)(v3 + 5272) = 2;
  *(void *)(v3 + 8072) = 14;
  *(unsigned char *)(v3 + 8080) = 2;
  *(void *)(v3 + 8096) = 13;
  *(unsigned char *)(v3 + 8104) = 2;
  *(void *)(v3 + 5288) = 13;
  *(unsigned char *)(v3 + 5296) = 2;
  *(void *)(v3 + 8024) = 8;
  *(unsigned char *)(v3 + 8032) = 2;
  *(void *)(v3 + 8048) = 13;
  *(unsigned char *)(v3 + 8056) = 2;
  *(void *)(v3 + 5312) = 11;
  *(unsigned char *)(v3 + 5320) = 2;
  *(void *)(v3 + 5336) = 12;
  *(unsigned char *)(v3 + 7984) = 2;
  *(void *)(v3 + 8000) = 4;
  *(unsigned char *)(v3 + 8008) = 2;
  *(unsigned char *)(v3 + 5344) = 2;
  *(void *)(v3 + 5360) = 17;
  *(void *)(v3 + 7904) = 16;
  *(unsigned char *)(v3 + 7912) = 2;
  *(void *)(v3 + 7928) = 12;
  *(unsigned char *)(v3 + 7936) = 2;
  *(unsigned char *)(v3 + 5368) = 2;
  *(void *)(v3 + 5384) = 10;
  *(void *)(v3 + 7856) = 5;
  *(unsigned char *)(v3 + 7864) = 2;
  *(void *)(v3 + 7880) = 14;
  *(unsigned char *)(v3 + 7888) = 2;
  *(unsigned char *)(v3 + 5392) = 2;
  *(void *)(v3 + 5408) = 12;
  *(void *)(v3 + 7808) = 12;
  *(unsigned char *)(v3 + 7816) = 2;
  *(void *)(v3 + 7832) = 11;
  *(unsigned char *)(v3 + 7840) = 2;
  *(unsigned char *)(v3 + 5416) = 2;
  *(void *)(v3 + 5432) = 10;
  *(void *)(v3 + 7760) = 7;
  *(unsigned char *)(v3 + 7768) = 2;
  *(void *)(v3 + 7784) = 8;
  *(unsigned char *)(v3 + 7792) = 2;
  *(unsigned char *)(v3 + 5440) = 2;
  *(void *)(v3 + 5456) = 9;
  *(void *)(v3 + 7712) = 6;
  *(unsigned char *)(v3 + 7720) = 2;
  *(void *)(v3 + 7736) = 13;
  *(unsigned char *)(v3 + 7744) = 2;
  *(unsigned char *)(v3 + 5464) = 2;
  *(void *)(v3 + 5480) = 12;
  *(void *)(v3 + 7664) = 4;
  *(unsigned char *)(v3 + 7672) = 2;
  *(void *)(v3 + 7688) = 7;
  *(unsigned char *)(v3 + 7696) = 2;
  *(unsigned char *)(v3 + 5488) = 2;
  *(void *)(v3 + 5504) = 13;
  *(void *)(v3 + 7616) = 10;
  *(unsigned char *)(v3 + 7624) = 2;
  *(void *)(v3 + 7640) = 5;
  *(unsigned char *)(v3 + 7648) = 2;
  *(unsigned char *)(v3 + 5512) = 2;
  *(void *)(v3 + 5528) = 5;
  *(void *)(v3 + 7568) = 20;
  *(unsigned char *)(v3 + 7576) = 2;
  *(void *)(v3 + 7592) = 4;
  *(unsigned char *)(v3 + 7600) = 2;
  *(unsigned char *)(v3 + 5536) = 2;
  *(void *)(v3 + 5552) = 6;
  *(unsigned char *)(v3 + 5560) = 2;
  *(void *)(v3 + 7520) = 6;
  *(unsigned char *)(v3 + 7528) = 2;
  *(unsigned char *)(v3 + 7552) = 2;
  *(void *)(v3 + 5576) = 11;
  *(unsigned char *)(v3 + 5584) = 2;
  *(void *)(v3 + 7472) = 8;
  *(unsigned char *)(v3 + 7480) = 2;
  *(void *)(v3 + 7496) = 12;
  *(unsigned char *)(v3 + 7504) = 2;
  *(void *)(v3 + 5600) = 8;
  *(unsigned char *)(v3 + 5608) = 2;
  *(void *)(v3 + 7424) = 11;
  *(unsigned char *)(v3 + 7432) = 2;
  *(void *)(v3 + 7448) = 8;
  *(unsigned char *)(v3 + 7456) = 2;
  *(void *)(v3 + 5624) = 11;
  *(unsigned char *)(v3 + 5632) = 2;
  *(void *)(v3 + 7376) = 16;
  *(unsigned char *)(v3 + 7384) = 2;
  *(void *)(v3 + 7400) = 8;
  *(unsigned char *)(v3 + 7408) = 2;
  *(void *)(v3 + 5648) = 12;
  *(unsigned char *)(v3 + 5656) = 2;
  *(void *)(v3 + 7328) = 10;
  *(unsigned char *)(v3 + 7336) = 2;
  *(void *)(v3 + 7352) = 10;
  *(unsigned char *)(v3 + 7360) = 2;
  *(void *)(v3 + 5672) = 11;
  *(unsigned char *)(v3 + 5680) = 2;
  *(void *)(v3 + 7280) = 15;
  *(unsigned char *)(v3 + 7288) = 2;
  *(void *)(v3 + 7304) = 12;
  *(unsigned char *)(v3 + 7312) = 2;
  *(void *)(v3 + 5696) = 4;
  *(unsigned char *)(v3 + 5704) = 2;
  *(void *)(v3 + 7232) = 10;
  *(unsigned char *)(v3 + 7240) = 2;
  *(void *)(v3 + 7256) = 12;
  *(unsigned char *)(v3 + 7264) = 2;
  *(void *)(v3 + 5720) = 9;
  *(unsigned char *)(v3 + 5728) = 2;
  *(void *)(v3 + 7184) = 12;
  *(unsigned char *)(v3 + 7192) = 2;
  *(void *)(v3 + 7208) = 8;
  *(unsigned char *)(v3 + 7216) = 2;
  *(void *)(v3 + 5744) = 12;
  *(unsigned char *)(v3 + 5752) = 2;
  *(void *)(v3 + 7136) = 12;
  *(unsigned char *)(v3 + 7144) = 2;
  *(void *)(v3 + 7160) = 6;
  *(unsigned char *)(v3 + 7168) = 2;
  *(void *)(v3 + 5768) = 4;
  *(unsigned char *)(v3 + 5776) = 2;
  *(void *)(v3 + 7088) = 5;
  *(unsigned char *)(v3 + 7096) = 2;
  *(void *)(v3 + 7112) = 10;
  *(unsigned char *)(v3 + 7120) = 2;
  *(void *)(v3 + 5792) = 8;
  *(unsigned char *)(v3 + 5800) = 2;
  *(void *)(v3 + 7040) = 18;
  *(unsigned char *)(v3 + 7048) = 2;
  *(void *)(v3 + 7064) = 4;
  *(unsigned char *)(v3 + 7072) = 2;
  *(void *)(v3 + 5816) = 8;
  *(unsigned char *)(v3 + 5824) = 2;
  *(void *)(v3 + 6992) = 13;
  *(unsigned char *)(v3 + 7000) = 2;
  *(void *)(v3 + 7016) = 9;
  *(unsigned char *)(v3 + 7024) = 2;
  *(void *)(v3 + 5840) = 13;
  *(unsigned char *)(v3 + 5848) = 2;
  *(void *)(v3 + 6944) = 12;
  *(unsigned char *)(v3 + 6952) = 2;
  *(void *)(v3 + 6968) = 12;
  *(unsigned char *)(v3 + 6976) = 2;
  *(void *)(v3 + 5864) = 13;
  *(unsigned char *)(v3 + 5872) = 2;
  *(void *)(v3 + 6896) = 7;
  *(unsigned char *)(v3 + 6904) = 2;
  *(void *)(v3 + 6920) = 4;
  *(unsigned char *)(v3 + 6928) = 2;
  *(void *)(v3 + 5888) = 16;
  *(unsigned char *)(v3 + 5896) = 2;
  *(void *)(v3 + 6848) = 6;
  *(unsigned char *)(v3 + 6856) = 2;
  *(void *)(v3 + 6872) = 8;
  *(unsigned char *)(v3 + 6880) = 2;
  *(void *)(v3 + 5912) = 13;
  *(unsigned char *)(v3 + 5920) = 2;
  *(void *)(v3 + 6800) = 7;
  *(unsigned char *)(v3 + 6808) = 2;
  *(void *)(v3 + 6824) = 11;
  *(unsigned char *)(v3 + 6832) = 2;
  *(void *)(v3 + 5936) = 15;
  *(unsigned char *)(v3 + 5944) = 2;
  *(void *)(v3 + 6752) = 11;
  *(unsigned char *)(v3 + 6760) = 2;
  *(void *)(v3 + 6776) = 9;
  *(unsigned char *)(v3 + 6784) = 2;
  *(void *)(v3 + 5960) = 17;
  *(unsigned char *)(v3 + 5968) = 2;
  *(void *)(v3 + 6704) = 7;
  *(unsigned char *)(v3 + 6712) = 2;
  *(void *)(v3 + 6728) = 12;
  *(unsigned char *)(v3 + 6736) = 2;
  *(void *)(v3 + 5984) = 13;
  *(unsigned char *)(v3 + 5992) = 2;
  *(void *)(v3 + 6656) = 12;
  *(unsigned char *)(v3 + 6664) = 2;
  *(void *)(v3 + 6680) = 11;
  *(unsigned char *)(v3 + 6688) = 2;
  *(void *)(v3 + 6008) = 15;
  *(unsigned char *)(v3 + 6016) = 2;
  *(void *)(v3 + 6608) = 12;
  *(unsigned char *)(v3 + 6616) = 2;
  *(void *)(v3 + 6632) = 11;
  *(unsigned char *)(v3 + 6640) = 2;
  *(void *)(v3 + 6032) = 20;
  *(unsigned char *)(v3 + 6040) = 2;
  *(void *)(v3 + 6560) = 5;
  *(unsigned char *)(v3 + 6568) = 2;
  *(void *)(v3 + 6584) = 12;
  *(unsigned char *)(v3 + 6592) = 2;
  *(void *)(v3 + 6056) = 15;
  *(unsigned char *)(v3 + 6064) = 2;
  *(void *)(v3 + 6512) = 16;
  *(unsigned char *)(v3 + 6520) = 2;
  *(void *)(v3 + 6536) = 18;
  *(unsigned char *)(v3 + 6544) = 2;
  *(void *)(v3 + 6080) = 7;
  *(unsigned char *)(v3 + 6088) = 2;
  *(void *)(v3 + 6464) = 12;
  *(unsigned char *)(v3 + 6472) = 2;
  *(void *)(v3 + 6488) = 18;
  *(unsigned char *)(v3 + 6496) = 2;
  *(void *)(v3 + 6104) = 9;
  *(unsigned char *)(v3 + 6112) = 2;
  *(void *)(v3 + 6416) = 10;
  *(unsigned char *)(v3 + 6424) = 2;
  *(void *)(v3 + 6440) = 4;
  *(unsigned char *)(v3 + 6448) = 2;
  *(void *)(v3 + 6128) = 6;
  *(unsigned char *)(v3 + 6136) = 2;
  *(void *)(v3 + 6368) = 5;
  *(unsigned char *)(v3 + 6376) = 2;
  *(void *)(v3 + 6392) = 13;
  *(unsigned char *)(v3 + 6400) = 2;
  *(void *)(v3 + 6152) = 8;
  *(unsigned char *)(v3 + 6160) = 2;
  *(void *)(v3 + 6320) = 15;
  *(unsigned char *)(v3 + 6328) = 2;
  *(void *)(v3 + 6344) = 9;
  *(unsigned char *)(v3 + 6352) = 2;
  *(void *)(v3 + 6176) = 15;
  *(unsigned char *)(v3 + 6184) = 2;
  *(void *)(v3 + 6272) = 11;
  *(unsigned char *)(v3 + 6280) = 2;
  *(void *)(v3 + 6296) = 10;
  *(unsigned char *)(v3 + 6304) = 2;
  *(void *)(v3 + 6200) = 4;
  *(unsigned char *)(v3 + 6208) = 2;
  *(void *)(v3 + 6224) = 4;
  *(unsigned char *)(v3 + 6232) = 2;
  *(void *)(v3 + 6248) = 10;
  *(unsigned char *)(v3 + 6256) = 2;
  *(void *)(v3 + 8840) = 16;
  *(unsigned char *)(v3 + 8848) = 2;
  *(void *)(v3 + 8864) = 11;
  *(unsigned char *)(v3 + 8872) = 2;
  *(void *)(v3 + 8888) = 12;
  *(unsigned char *)(v3 + 8896) = 2;
  *(void *)(v3 + 8912) = 5;
  *(unsigned char *)(v3 + 8920) = 2;
  *(void *)(v3 + 8936) = 4;
  *(unsigned char *)(v3 + 8944) = 2;
  *(void *)(v3 + 8960) = 10;
  *(unsigned char *)(v3 + 8968) = 2;
  *(void *)(v3 + 8984) = 13;
  *(unsigned char *)(v3 + 8992) = 2;
  *(void *)(v3 + 9008) = 5;
  *(unsigned char *)(v3 + 9016) = 2;
  *(void *)(v3 + 9032) = 4;
  *(void *)(v3 + 9056) = 9;
  *(unsigned char *)(v3 + 9064) = 2;
  *(void *)(v3 + 9080) = 7;
  *(unsigned char *)(v3 + 9088) = 2;
  *(void *)(v3 + 9104) = 10;
  *(unsigned char *)(v3 + 9112) = 2;
  *(void *)(v3 + 9128) = 8;
  *(unsigned char *)(v3 + 9136) = 2;
  *(void *)(v3 + 9152) = 8;
  *(unsigned char *)(v3 + 9160) = 2;
  *(void *)(v3 + 9176) = 5;
  *(unsigned char *)(v3 + 9184) = 2;
  *(void *)(v3 + 9200) = 14;
  *(unsigned char *)(v3 + 9208) = 2;
  *(void *)(v3 + 9224) = 9;
  *(unsigned char *)(v3 + 9232) = 2;
  *(void *)(v3 + 9248) = 11;
  *(unsigned char *)(v3 + 9256) = 2;
  *(void *)(v3 + 9272) = 6;
  *(unsigned char *)(v3 + 9280) = 2;
  *(void *)(v3 + 9296) = 5;
  *(unsigned char *)(v3 + 9304) = 2;
  *(void *)(v3 + 9320) = 11;
  *(unsigned char *)(v3 + 9328) = 2;
  *(void *)(v3 + 9344) = 9;
  *(unsigned char *)(v3 + 9352) = 2;
  *(void *)(v3 + 9368) = 19;
  *(unsigned char *)(v3 + 9376) = 2;
  *(void *)(v3 + 9392) = 17;
  *(unsigned char *)(v3 + 9400) = 2;
  *(void *)(v3 + 9416) = 11;
  *(unsigned char *)(v3 + 9424) = 2;
  *(void *)(v3 + 9440) = 22;
  *(unsigned char *)(v3 + 9448) = 2;
  *(void *)(v3 + 9464) = 14;
  *(unsigned char *)(v3 + 9472) = 2;
  *(void *)(v3 + 9488) = 16;
  *(unsigned char *)(v3 + 9496) = 2;
  *(void *)(v3 + 9512) = 20;
  *(unsigned char *)(v3 + 9520) = 2;
  *(void *)(v3 + 9536) = 19;
  *(unsigned char *)(v3 + 9544) = 2;
  *(void *)(v3 + 9560) = 23;
  *(unsigned char *)(v3 + 9568) = 2;
  *(void *)(v3 + 9584) = 13;
  *(unsigned char *)(v3 + 9592) = 2;
  *(void *)(v3 + 9608) = 13;
  *(unsigned char *)(v3 + 9616) = 2;
  *(void *)(v3 + 9632) = 17;
  *(unsigned char *)(v3 + 9640) = 2;
  *(void *)(v3 + 9656) = 16;
  *(unsigned char *)(v3 + 9664) = 2;
  *(void *)(v3 + 9680) = 17;
  *(unsigned char *)(v3 + 9688) = 2;
  *(void *)(v3 + 9704) = 19;
  *(unsigned char *)(v3 + 9712) = 2;
  *(void *)(v3 + 9728) = 12;
  *(unsigned char *)(v3 + 9736) = 2;
  *(void *)(v3 + 9752) = 16;
  *(unsigned char *)(v3 + 9760) = 2;
  *(void *)(v3 + 9776) = 16;
  *(unsigned char *)(v3 + 9784) = 2;
  *(void *)(v3 + 9800) = 17;
  *(unsigned char *)(v3 + 9808) = 2;
  *(void *)(v3 + 9824) = 5;
  *(unsigned char *)(v3 + 9832) = 2;
  *(void *)(v3 + 9848) = 13;
  *(unsigned char *)(v3 + 9856) = 2;
  *(void *)(v3 + 9872) = 14;
  *(unsigned char *)(v3 + 9880) = 2;
  *(void *)(v3 + 9896) = 13;
  *(unsigned char *)(v3 + 9904) = 2;
  *(void *)(v3 + 9920) = 4;
  *(unsigned char *)(v3 + 9928) = 2;
  *(void *)(v3 + 9944) = 10;
  *(unsigned char *)(v3 + 9952) = 2;
  *(void *)(v3 + 9968) = 10;
  *(unsigned char *)(v3 + 9976) = 2;
  *(void *)(v3 + 9992) = 10;
  *(unsigned char *)(v3 + 10000) = 2;
  *(void *)(v3 + 10016) = 8;
  *(unsigned char *)(v3 + 10024) = 2;
  *(void *)(v3 + 10040) = 10;
  *(unsigned char *)(v3 + 10048) = 2;
  *(void *)(v3 + 10064) = 14;
  *(unsigned char *)(v3 + 10072) = 2;
  *(void *)(v3 + 10088) = 14;
  *(unsigned char *)(v3 + 10096) = 2;
  *(void *)(v3 + 10112) = 10;
  *(unsigned char *)(v3 + 10120) = 2;
  *(void *)(v3 + 10136) = 15;
  *(unsigned char *)(v3 + 10144) = 2;
  *(void *)(v3 + 10160) = 16;
  *(unsigned char *)(v3 + 10168) = 2;
  *(void *)(v3 + 10184) = 8;
  *(unsigned char *)(v3 + 10192) = 2;
  *(void *)(v3 + 10208) = 7;
  *(unsigned char *)(v3 + 10216) = 2;
  *(void *)(v3 + 10232) = 7;
  *(unsigned char *)(v3 + 10240) = 2;
  *(void *)(v3 + 10256) = 6;
  *(unsigned char *)(v3 + 10264) = 2;
  *(void *)(v3 + 10280) = 14;
  *(unsigned char *)(v3 + 10288) = 2;
  *(void *)(v3 + 10304) = 12;
  *(unsigned char *)(v3 + 10312) = 2;
  *(void *)(v3 + 10328) = 13;
  *(unsigned char *)(v3 + 10336) = 2;
  *(void *)(v3 + 10352) = 12;
  *(unsigned char *)(v3 + 10360) = 2;
  *(void *)(v3 + 10376) = 9;
  *(unsigned char *)(v3 + 10384) = 2;
  *(void *)(v3 + 10400) = 11;
  *(unsigned char *)(v3 + 10408) = 2;
  *(void *)(v3 + 10424) = 12;
  *(unsigned char *)(v3 + 10432) = 2;
  *(void *)(v3 + 10448) = 10;
  *(unsigned char *)(v3 + 10456) = 2;
  *(void *)(v3 + 10472) = 17;
  *(unsigned char *)(v3 + 10480) = 2;
  *(void *)(v3 + 10496) = 15;
  *(unsigned char *)(v3 + 10504) = 2;
  *(void *)(v3 + 10520) = 5;
  *(unsigned char *)(v3 + 10528) = 2;
  *(void *)(v3 + 10544) = 12;
  *(unsigned char *)(v3 + 10552) = 2;
  *(void *)(v3 + 10568) = 8;
  *(unsigned char *)(v3 + 7960) = 2;
  *(void *)(v3 + 12360) = "pink";
  *(void *)(v3 + 12456) = "pistachio";
  *(void *)(v3 + 12552) = "powder blue";
  *(void *)(v3 + 12624) = "psychedelic purple";
  *(void *)(v3 + 12648) = "puce";
  *(void *)(v3 + 12720) = "purple heart";
  *(void *)(v3 + 12752) = 25;
  *(void *)(v3 + 12768) = "purple mountain majesty";
  *(void *)(v3 + 12936) = "raspberry rose";
  *(void *)(v3 + 13032) = "red";
  *(void *)(v3 + 13104) = "red violet";
  *(void *)(v3 + 13200) = "rich lilac";
  *(void *)(v3 + 13296) = "rose bonbon";
  *(void *)(v3 + 13392) = "rose quartz";
  *(void *)(v3 + 13488) = "rosso corsa";
  *(void *)(v3 + 13584) = "royal fuchsia";
  *(void *)(v3 + 13680) = "ruddy pink";
  *(void *)(v3 + 13776) = "sacramento state green";
  *(void *)(v3 + 13896) = "salmon";
  *(void *)(v3 + 13992) = "sandstorm";
  *(void *)(v3 + 14088) = "sapphire";
  *(void *)(v3 + 14184) = "screamin green";
  *(void *)(v3 + 14280) = "seashell";
  *(void *)(v3 + 14376) = "shamrock";
  *(void *)(v3 + 14472) = "silver";
  *(void *)(v3 + 14568) = "slate blue";
  *(void *)(v3 + 14664) = "smoky black";
  *(void *)(v3 + 14760) = "steel blue";
  *(void *)(v3 + 14856) = "straw";
  *(unsigned char *)(v3 + 10576) = 2;
  *(void *)(v3 + 14952) = "sunset orange";
  *(void *)(v3 + 14960) = 13;
  *(unsigned char *)(v3 + 14968) = 2;
  *(void *)(v3 + 14928) = "sunset";
  *(unsigned char *)(v3 + 14920) = 2;
  *(void *)(v3 + 14936) = 6;
  *(unsigned char *)(v3 + 14944) = 2;
  *(void *)(v3 + 14904) = "sunlight";
  *(void *)(v3 + 14888) = 7;
  *(unsigned char *)(v3 + 14896) = 2;
  *(void *)(v3 + 14912) = 8;
  *(void *)(v3 + 10592) = 8;
  *(void *)(v3 + 14880) = "sunglow";
  *(void *)(v3 + 14864) = 5;
  *(unsigned char *)(v3 + 14872) = 2;
  *(void *)(v3 + 14832) = "stormcloud";
  *(unsigned char *)(v3 + 14824) = 2;
  *(void *)(v3 + 14840) = 10;
  *(unsigned char *)(v3 + 14848) = 2;
  *(void *)(v3 + 14808) = "stizza";
  *(void *)(v3 + 14792) = 20;
  *(unsigned char *)(v3 + 14800) = 2;
  *(void *)(v3 + 14816) = 6;
  *(unsigned char *)(v3 + 10600) = 2;
  *(void *)(v3 + 14784) = "stil de grain yellow";
  *(void *)(v3 + 14768) = 10;
  *(unsigned char *)(v3 + 14776) = 2;
  *(void *)(v3 + 14736) = "spring green";
  *(unsigned char *)(v3 + 14728) = 2;
  *(void *)(v3 + 14744) = 12;
  *(unsigned char *)(v3 + 14752) = 2;
  *(void *)(v3 + 14712) = "spiro disco ball";
  *(void *)(v3 + 14696) = 4;
  *(unsigned char *)(v3 + 14704) = 2;
  *(void *)(v3 + 14720) = 16;
  *(void *)(v3 + 10616) = 12;
  *(void *)(v3 + 14688) = "snow";
  *(void *)(v3 + 14672) = 11;
  *(unsigned char *)(v3 + 14680) = 2;
  *(void *)(v3 + 14640) = "smokey topaz";
  *(unsigned char *)(v3 + 14632) = 2;
  *(void *)(v3 + 14648) = 12;
  *(unsigned char *)(v3 + 14656) = 2;
  *(void *)(v3 + 14616) = "smalt";
  *(void *)(v3 + 14600) = 10;
  *(unsigned char *)(v3 + 14608) = 2;
  *(void *)(v3 + 14624) = 5;
  *(unsigned char *)(v3 + 10624) = 2;
  *(void *)(v3 + 14592) = "slate gray";
  *(void *)(v3 + 14576) = 10;
  *(unsigned char *)(v3 + 14584) = 2;
  *(void *)(v3 + 14544) = "sky magenta";
  *(unsigned char *)(v3 + 14536) = 2;
  *(void *)(v3 + 14552) = 11;
  *(unsigned char *)(v3 + 14560) = 2;
  *(void *)(v3 + 14520) = "sky blue";
  *(void *)(v3 + 14504) = 9;
  *(unsigned char *)(v3 + 14512) = 2;
  *(void *)(v3 + 14528) = 8;
  *(void *)(v3 + 10640) = 9;
  *(void *)(v3 + 14496) = "skobeloff";
  *(void *)(v3 + 14480) = 6;
  *(unsigned char *)(v3 + 14488) = 2;
  *(void *)(v3 + 14448) = "sienna";
  *(unsigned char *)(v3 + 14440) = 2;
  *(void *)(v3 + 14456) = 6;
  *(unsigned char *)(v3 + 14464) = 2;
  *(void *)(v3 + 14424) = "shocking pink";
  *(void *)(v3 + 14408) = 14;
  *(unsigned char *)(v3 + 14416) = 2;
  *(void *)(v3 + 14432) = 13;
  *(unsigned char *)(v3 + 10648) = 2;
  *(void *)(v3 + 14400) = "shamrock green";
  *(void *)(v3 + 14384) = 8;
  *(unsigned char *)(v3 + 14392) = 2;
  *(void *)(v3 + 14352) = "shadow";
  *(unsigned char *)(v3 + 14344) = 2;
  *(void *)(v3 + 14360) = 6;
  *(unsigned char *)(v3 + 14368) = 2;
  *(void *)(v3 + 14328) = "sepia";
  *(void *)(v3 + 14312) = 16;
  *(unsigned char *)(v3 + 14320) = 2;
  *(void *)(v3 + 14336) = 5;
  *(void *)(v3 + 10664) = 8;
  *(void *)(v3 + 14304) = "selective yellow";
  *(void *)(v3 + 14288) = 8;
  *(unsigned char *)(v3 + 14296) = 2;
  *(void *)(v3 + 14256) = "seal brown";
  *(unsigned char *)(v3 + 14248) = 2;
  *(void *)(v3 + 14264) = 10;
  *(unsigned char *)(v3 + 14272) = 2;
  *(void *)(v3 + 14232) = "sea green";
  *(void *)(v3 + 14216) = 8;
  *(unsigned char *)(v3 + 14224) = 2;
  *(void *)(v3 + 14240) = 9;
  *(unsigned char *)(v3 + 10672) = 2;
  *(void *)(v3 + 14208) = "sea blue";
  *(void *)(v3 + 14192) = 14;
  *(unsigned char *)(v3 + 14200) = 2;
  *(void *)(v3 + 14160) = "school bus yellow";
  *(unsigned char *)(v3 + 14152) = 2;
  *(void *)(v3 + 14168) = 17;
  *(unsigned char *)(v3 + 14176) = 2;
  *(void *)(v3 + 14136) = "scarlet";
  *(void *)(v3 + 14120) = 16;
  *(unsigned char *)(v3 + 14128) = 2;
  *(void *)(v3 + 14144) = 7;
  *(void *)(v3 + 10688) = 5;
  *(void *)(v3 + 14112) = "satin sheen gold";
  *(void *)(v3 + 14096) = 8;
  *(unsigned char *)(v3 + 14104) = 2;
  *(void *)(v3 + 14064) = "sap green";
  *(unsigned char *)(v3 + 14056) = 2;
  *(void *)(v3 + 14072) = 9;
  *(unsigned char *)(v3 + 14080) = 2;
  *(void *)(v3 + 14040) = "sandy taupe";
  *(void *)(v3 + 14024) = 11;
  *(unsigned char *)(v3 + 14032) = 2;
  *(void *)(v3 + 14048) = 11;
  *(unsigned char *)(v3 + 10696) = 2;
  *(void *)(v3 + 14016) = "sandy brown";
  *(void *)(v3 + 14000) = 9;
  *(unsigned char *)(v3 + 14008) = 2;
  *(void *)(v3 + 13968) = "sand dune";
  *(unsigned char *)(v3 + 13960) = 2;
  *(void *)(v3 + 13976) = 9;
  *(unsigned char *)(v3 + 13984) = 2;
  *(void *)(v3 + 13944) = "sand";
  *(void *)(v3 + 13928) = 11;
  *(unsigned char *)(v3 + 13936) = 2;
  *(void *)(v3 + 13952) = 4;
  *(void *)(v3 + 10712) = 10;
  *(void *)(v3 + 13920) = "salmon pink";
  *(void *)(v3 + 13904) = 6;
  *(unsigned char *)(v3 + 13912) = 2;
  *(void *)(v3 + 13872) = "saint patrick blue";
  *(unsigned char *)(v3 + 13864) = 2;
  *(void *)(v3 + 13880) = 18;
  *(unsigned char *)(v3 + 13888) = 2;
  *(void *)(v3 + 13848) = "saffron";
  *(void *)(v3 + 13832) = 13;
  *(unsigned char *)(v3 + 13840) = 2;
  *(void *)(v3 + 13856) = 7;
  *(void *)(v3 + 13784) = 22;
  *(void *)(v3 + 13808) = 12;
  *(unsigned char *)(v3 + 13816) = 2;
  *(void *)(v3 + 13824) = "safety orange";
  *(void *)(v3 + 13800) = "saddle brown";
  *(unsigned char *)(v3 + 13792) = 2;
  *(void *)(v3 + 13752) = "rust";
  *(unsigned char *)(v3 + 13744) = 2;
  *(void *)(v3 + 13760) = 4;
  *(unsigned char *)(v3 + 13768) = 2;
  *(void *)(v3 + 13728) = "russet";
  *(void *)(v3 + 13712) = 6;
  *(unsigned char *)(v3 + 13720) = 2;
  *(void *)(v3 + 13736) = 6;
  *(unsigned char *)(v3 + 10720) = 2;
  *(void *)(v3 + 13704) = "rufous";
  *(void *)(v3 + 13688) = 10;
  *(unsigned char *)(v3 + 13696) = 2;
  *(void *)(v3 + 13656) = "ruddy brown";
  *(unsigned char *)(v3 + 13648) = 2;
  *(void *)(v3 + 13664) = 11;
  *(unsigned char *)(v3 + 13672) = 2;
  *(void *)(v3 + 13632) = "ruby";
  *(void *)(v3 + 13616) = 12;
  *(unsigned char *)(v3 + 13624) = 2;
  *(void *)(v3 + 13640) = 4;
  *(void *)(v3 + 10736) = 11;
  *(void *)(v3 + 13608) = "royal purple";
  *(void *)(v3 + 13592) = 13;
  *(unsigned char *)(v3 + 13600) = 2;
  *(void *)(v3 + 13560) = "royal blue";
  *(unsigned char *)(v3 + 13552) = 2;
  *(void *)(v3 + 13568) = 10;
  *(unsigned char *)(v3 + 13576) = 2;
  *(void *)(v3 + 13536) = "royal azure";
  *(void *)(v3 + 13520) = 10;
  *(unsigned char *)(v3 + 13528) = 2;
  *(void *)(v3 + 13544) = 11;
  *(unsigned char *)(v3 + 10744) = 2;
  *(void *)(v3 + 13512) = "rosy brown";
  *(void *)(v3 + 13496) = 11;
  *(unsigned char *)(v3 + 13504) = 2;
  *(void *)(v3 + 13464) = "rosewood";
  *(unsigned char *)(v3 + 13456) = 2;
  *(void *)(v3 + 13472) = 8;
  *(unsigned char *)(v3 + 13480) = 2;
  *(void *)(v3 + 13440) = "rose vale";
  *(void *)(v3 + 13424) = 10;
  *(unsigned char *)(v3 + 13432) = 2;
  *(void *)(v3 + 13448) = 9;
  *(void *)(v3 + 10760) = 7;
  *(void *)(v3 + 13416) = "rose taupe";
  *(void *)(v3 + 13400) = 11;
  *(unsigned char *)(v3 + 13408) = 2;
  *(void *)(v3 + 13368) = "rose pink";
  *(unsigned char *)(v3 + 13360) = 2;
  *(void *)(v3 + 13376) = 9;
  *(unsigned char *)(v3 + 13384) = 2;
  *(void *)(v3 + 13344) = "rose madder";
  *(void *)(v3 + 13328) = 10;
  *(unsigned char *)(v3 + 13336) = 2;
  *(void *)(v3 + 13352) = 11;
  *(unsigned char *)(v3 + 10768) = 2;
  *(void *)(v3 + 13320) = "rose ebony";
  *(void *)(v3 + 13304) = 11;
  *(unsigned char *)(v3 + 13312) = 2;
  *(void *)(v3 + 13272) = "rose";
  *(unsigned char *)(v3 + 13264) = 2;
  *(void *)(v3 + 13280) = 4;
  *(unsigned char *)(v3 + 13288) = 2;
  *(void *)(v3 + 13248) = "robin's egg blue";
  *(void *)(v3 + 13232) = 11;
  *(unsigned char *)(v3 + 13240) = 2;
  *(void *)(v3 + 13256) = 16;
  *(void *)(v3 + 10784) = 4;
  *(void *)(v3 + 13224) = "rich maroon";
  *(void *)(v3 + 13208) = 10;
  *(unsigned char *)(v3 + 13216) = 2;
  *(void *)(v3 + 13176) = "rich electric blue";
  *(unsigned char *)(v3 + 13168) = 2;
  *(void *)(v3 + 13184) = 18;
  *(unsigned char *)(v3 + 13192) = 2;
  *(void *)(v3 + 13152) = "rich carmine";
  *(void *)(v3 + 13136) = 10;
  *(unsigned char *)(v3 + 13144) = 2;
  *(void *)(v3 + 13160) = 12;
  *(unsigned char *)(v3 + 10792) = 2;
  *(void *)(v3 + 13128) = "rich black";
  *(void *)(v3 + 13112) = 10;
  *(unsigned char *)(v3 + 13120) = 2;
  *(void *)(v3 + 13080) = "red brown";
  *(unsigned char *)(v3 + 13072) = 2;
  *(void *)(v3 + 13088) = 9;
  *(unsigned char *)(v3 + 13096) = 2;
  *(void *)(v3 + 10808) = 11;
  *(void *)(v3 + 13056) = "red orange";
  *(void *)(v3 + 13040) = 3;
  *(unsigned char *)(v3 + 13048) = 2;
  *(void *)(v3 + 13064) = 10;
  *(void *)(v3 + 13008) = "razzmatazz";
  *(unsigned char *)(v3 + 13000) = 2;
  *(void *)(v3 + 13016) = 10;
  *(unsigned char *)(v3 + 13024) = 2;
  *(void *)(v3 + 12984) = "razzle dazzle rose";
  *(void *)(v3 + 12968) = 10;
  *(unsigned char *)(v3 + 12976) = 2;
  *(void *)(v3 + 12992) = 18;
  *(unsigned char *)(v3 + 10816) = 2;
  *(void *)(v3 + 12960) = "raw sienna";
  *(void *)(v3 + 12944) = 14;
  *(unsigned char *)(v3 + 12952) = 2;
  *(void *)(v3 + 12912) = "raspberry pink";
  *(unsigned char *)(v3 + 12904) = 2;
  *(void *)(v3 + 12920) = 14;
  *(unsigned char *)(v3 + 12928) = 2;
  *(void *)(v3 + 12888) = "raspberry glace";
  *(void *)(v3 + 12872) = 9;
  *(unsigned char *)(v3 + 12880) = 2;
  *(void *)(v3 + 12896) = 15;
  *(void *)(v3 + 10832) = 6;
  *(void *)(v3 + 12864) = "raspberry";
  *(void *)(v3 + 12848) = 11;
  *(unsigned char *)(v3 + 12856) = 2;
  *(void *)(v3 + 12816) = "purple taupe";
  *(void *)(v3 + 12824) = 12;
  *(unsigned char *)(v3 + 12832) = 2;
  *(void *)(v3 + 12840) = "radical red";
  *(unsigned char *)(v3 + 12784) = 2;
  *(void *)(v3 + 12792) = "purple pizzazz";
  *(void *)(v3 + 12800) = 14;
  *(unsigned char *)(v3 + 12808) = 2;
  *(void *)(v3 + 12776) = 23;
  *(unsigned char *)(v3 + 12760) = 2;
  *(unsigned char *)(v3 + 10840) = 2;
  *(void *)(v3 + 12744) = "purple mountain's majesty";
  *(void *)(v3 + 12728) = 12;
  *(unsigned char *)(v3 + 12736) = 2;
  *(void *)(v3 + 12696) = "purple";
  *(unsigned char *)(v3 + 12688) = 2;
  *(void *)(v3 + 12704) = 6;
  *(unsigned char *)(v3 + 12712) = 2;
  *(void *)(v3 + 12672) = "pumpkin";
  *(void *)(v3 + 12656) = 4;
  *(unsigned char *)(v3 + 12664) = 2;
  *(void *)(v3 + 12680) = 7;
  *(void *)(v3 + 10856) = 13;
  *(void *)(v3 + 12632) = 18;
  *(unsigned char *)(v3 + 12616) = 2;
  *(unsigned char *)(v3 + 12640) = 2;
  *(void *)(v3 + 12600) = "prussian blue";
  *(void *)(v3 + 12584) = 16;
  *(unsigned char *)(v3 + 12592) = 2;
  *(void *)(v3 + 12608) = 13;
  *(unsigned char *)(v3 + 10864) = 2;
  *(void *)(v3 + 12576) = "princeton orange";
  *(void *)(v3 + 12560) = 11;
  *(unsigned char *)(v3 + 12568) = 2;
  *(void *)(v3 + 12528) = "portland orange";
  *(unsigned char *)(v3 + 12520) = 2;
  *(void *)(v3 + 12536) = 15;
  *(unsigned char *)(v3 + 12544) = 2;
  *(void *)(v3 + 12504) = "plum";
  *(void *)(v3 + 12488) = 8;
  *(unsigned char *)(v3 + 12496) = 2;
  *(void *)(v3 + 12512) = 4;
  *(void *)(v3 + 10880) = 11;
  *(void *)(v3 + 12480) = "platinum";
  *(void *)(v3 + 12464) = 9;
  *(unsigned char *)(v3 + 12472) = 2;
  *(void *)(v3 + 12432) = "pink pearl";
  *(unsigned char *)(v3 + 12424) = 2;
  *(void *)(v3 + 12440) = 10;
  *(unsigned char *)(v3 + 12448) = 2;
  *(void *)(v3 + 12408) = "pink sherbet";
  *(void *)(v3 + 12392) = 13;
  *(unsigned char *)(v3 + 12400) = 2;
  *(void *)(v3 + 12416) = 12;
  *(unsigned char *)(v3 + 10888) = 2;
  *(void *)(v3 + 12384) = "pink flamingo";
  *(void *)(v3 + 12368) = 4;
  *(unsigned char *)(v3 + 12376) = 2;
  *(void *)(v3 + 12336) = "pine green";
  *(unsigned char *)(v3 + 12328) = 2;
  *(void *)(v3 + 12344) = 10;
  *(unsigned char *)(v3 + 12352) = 2;
  *(void *)(v3 + 10904) = 10;
  *(void *)(v3 + 12312) = "piggy pink";
  *(unsigned char *)(v3 + 12304) = 2;
  *(void *)(v3 + 12320) = 10;
  *(void *)(v3 + 12288) = "phthalo green";
  *(void *)(v3 + 12272) = 12;
  *(unsigned char *)(v3 + 12280) = 2;
  *(void *)(v3 + 12296) = 13;
  *(unsigned char *)(v3 + 10912) = 2;
  *(void *)(v3 + 12264) = "phthalo blue";
  *(void *)(v3 + 12248) = 5;
  *(unsigned char *)(v3 + 12256) = 2;
  *(void *)(v3 + 12216) = "persian rose";
  *(unsigned char *)(v3 + 12208) = 2;
  *(void *)(v3 + 12224) = 12;
  *(unsigned char *)(v3 + 12232) = 2;
  *(void *)(v3 + 12192) = "persian red";
  *(void *)(v3 + 12176) = 12;
  *(unsigned char *)(v3 + 12184) = 2;
  *(void *)(v3 + 12200) = 11;
  *(void *)(v3 + 10928) = 6;
  *(void *)(v3 + 12168) = "persian plum";
  *(void *)(v3 + 12152) = 12;
  *(unsigned char *)(v3 + 12160) = 2;
  *(void *)(v3 + 12120) = "persian orange";
  *(unsigned char *)(v3 + 12112) = 2;
  *(void *)(v3 + 12128) = 14;
  *(unsigned char *)(v3 + 12136) = 2;
  *(void *)(v3 + 12096) = "persian indigo";
  *(void *)(v3 + 12080) = 12;
  *(unsigned char *)(v3 + 12088) = 2;
  *(void *)(v3 + 12104) = 14;
  *(unsigned char *)(v3 + 10936) = 2;
  *(void *)(v3 + 12072) = "persian blue";
  *(void *)(v3 + 12056) = 10;
  *(unsigned char *)(v3 + 12064) = 2;
  *(void *)(v3 + 12024) = "peridot";
  *(unsigned char *)(v3 + 12016) = 2;
  *(void *)(v3 + 12032) = 7;
  *(unsigned char *)(v3 + 12040) = 2;
  *(void *)(v3 + 12000) = "pearl aqua";
  *(void *)(v3 + 11984) = 5;
  *(unsigned char *)(v3 + 11992) = 2;
  *(void *)(v3 + 12008) = 10;
  *(void *)(v3 + 10952) = 11;
  *(void *)(v3 + 11976) = "pearl";
  *(void *)(v3 + 11960) = 4;
  *(unsigned char *)(v3 + 11968) = 2;
  *(void *)(v3 + 11928) = "peach yellow";
  *(unsigned char *)(v3 + 11920) = 2;
  *(void *)(v3 + 11936) = 12;
  *(unsigned char *)(v3 + 11944) = 2;
  *(void *)(v3 + 11904) = "peach puff";
  *(void *)(v3 + 11888) = 5;
  *(unsigned char *)(v3 + 11896) = 2;
  *(void *)(v3 + 11912) = 10;
  *(unsigned char *)(v3 + 10960) = 2;
  *(void *)(v3 + 11880) = "peach";
  *(void *)(v3 + 11864) = 10;
  *(unsigned char *)(v3 + 11872) = 2;
  *(void *)(v3 + 11832) = "pastel yellow";
  *(unsigned char *)(v3 + 11824) = 2;
  *(void *)(v3 + 11840) = 13;
  *(unsigned char *)(v3 + 11848) = 2;
  *(void *)(v3 + 11808) = "pastel violet";
  *(void *)(v3 + 11792) = 10;
  *(unsigned char *)(v3 + 11800) = 2;
  *(void *)(v3 + 11816) = 13;
  *(void *)(v3 + 10976) = 11;
  *(void *)(v3 + 11784) = "pastel red";
  *(void *)(v3 + 11768) = 13;
  *(unsigned char *)(v3 + 11776) = 2;
  *(void *)(v3 + 11736) = "pastel pink";
  *(unsigned char *)(v3 + 11728) = 2;
  *(void *)(v3 + 11744) = 11;
  *(unsigned char *)(v3 + 11752) = 2;
  *(void *)(v3 + 11712) = "pastel orange";
  *(void *)(v3 + 11696) = 14;
  *(unsigned char *)(v3 + 11704) = 2;
  *(void *)(v3 + 11720) = 13;
  *(unsigned char *)(v3 + 10984) = 2;
  *(void *)(v3 + 11688) = "pastel magenta";
  *(void *)(v3 + 11672) = 12;
  *(unsigned char *)(v3 + 11680) = 2;
  *(void *)(v3 + 11640) = "pastel gray";
  *(unsigned char *)(v3 + 11632) = 2;
  *(void *)(v3 + 11648) = 11;
  *(unsigned char *)(v3 + 11656) = 2;
  *(void *)(v3 + 11616) = "pastel brown";
  *(void *)(v3 + 11600) = 11;
  *(unsigned char *)(v3 + 11608) = 2;
  *(void *)(v3 + 11624) = 12;
  *(void *)(v3 + 11000) = 17;
  *(void *)(v3 + 11592) = "pastel blue";
  *(void *)(v3 + 11576) = 11;
  *(unsigned char *)(v3 + 11584) = 2;
  *(void *)(v3 + 11544) = "papaya whip";
  *(unsigned char *)(v3 + 11536) = 2;
  *(void *)(v3 + 11552) = 11;
  *(unsigned char *)(v3 + 11560) = 2;
  *(void *)(v3 + 11520) = "pale violet red";
  *(void *)(v3 + 11504) = 10;
  *(unsigned char *)(v3 + 11512) = 2;
  *(void *)(v3 + 11528) = 15;
  *(unsigned char *)(v3 + 11008) = 2;
  *(void *)(v3 + 11496) = "pale taupe";
  *(void *)(v3 + 11480) = 11;
  *(unsigned char *)(v3 + 11488) = 2;
  *(void *)(v3 + 11016) = "oxford blue";
  *(void *)(v3 + 11456) = 19;
  *(unsigned char *)(v3 + 11464) = 2;
  *(void *)(v3 + 11472) = "pale silver";
  *(void *)(v3 + 11424) = "pale red violet";
  *(void *)(v3 + 11432) = 15;
  *(unsigned char *)(v3 + 11440) = 2;
  *(void *)(v3 + 11448) = "pale robin egg blue";
  *(unsigned char *)(v3 + 11392) = 2;
  *(void *)(v3 + 11400) = "pale plum";
  *(void *)(v3 + 11408) = 9;
  *(unsigned char *)(v3 + 11416) = 2;
  *(void *)(v3 + 11360) = 12;
  *(unsigned char *)(v3 + 11368) = 2;
  *(void *)(v3 + 11376) = "pale pink";
  *(void *)(v3 + 11384) = 9;
  *(void *)(v3 + 11024) = 11;
  *(void *)(v3 + 11336) = 13;
  *(unsigned char *)(v3 + 11344) = 2;
  *(void *)(v3 + 11352) = "pale magenta";
  *(void *)(v3 + 11304) = "pale green";
  *(void *)(v3 + 11312) = 10;
  *(unsigned char *)(v3 + 11320) = 2;
  *(void *)(v3 + 11328) = "pale lavender";
  *(unsigned char *)(v3 + 11272) = 2;
  *(void *)(v3 + 11280) = "pale goldenrod";
  *(void *)(v3 + 11288) = 14;
  *(unsigned char *)(v3 + 11296) = 2;
  *(void *)(v3 + 11240) = 20;
  *(unsigned char *)(v3 + 11248) = 2;
  *(void *)(v3 + 11256) = "pale gold";
  *(void *)(v3 + 11264) = 9;
  *(unsigned char *)(v3 + 11032) = 2;
  *(void *)(v3 + 11216) = 11;
  *(unsigned char *)(v3 + 11224) = 2;
  *(void *)(v3 + 11232) = "pale cornflower blue";
  *(void *)(v3 + 11040) = "pacific blue";
  *(void *)(v3 + 11192) = 13;
  *(unsigned char *)(v3 + 11200) = 2;
  *(void *)(v3 + 11208) = "pale copper";
  *(void *)(v3 + 11160) = "pale cerulean";
  *(void *)(v3 + 11168) = 13;
  *(unsigned char *)(v3 + 11176) = 2;
  *(void *)(v3 + 11184) = "pale chestnut";
  *(unsigned char *)(v3 + 11128) = 2;
  *(void *)(v3 + 11136) = "pale carmine";
  *(void *)(v3 + 11144) = 12;
  *(unsigned char *)(v3 + 11152) = 2;
  *(void *)(v3 + 11096) = 9;
  *(unsigned char *)(v3 + 11104) = 2;
  *(void *)(v3 + 11112) = "pale brown";
  *(void *)(v3 + 11120) = 10;
  *(void *)(v3 + 11048) = 12;
  *(void *)(v3 + 11072) = 9;
  *(unsigned char *)(v3 + 11080) = 2;
  *(void *)(v3 + 11088) = "pale blue";
  *(unsigned char *)(v3 + 11056) = 2;
  *(void *)(v3 + 11064) = "pale aqua";
  *(void *)(v3 + 14976) = "tan";
  *(void *)(v3 + 14984) = 3;
  *(unsigned char *)(v3 + 14992) = 2;
  *(void *)(v3 + 15000) = "tangelo";
  *(void *)(v3 + 15008) = 7;
  *(unsigned char *)(v3 + 15016) = 2;
  *(void *)(v3 + 15024) = "tangerine";
  *(void *)(v3 + 15032) = 9;
  *(unsigned char *)(v3 + 15040) = 2;
  *(void *)(v3 + 15048) = "tangerine yellow";
  *(void *)(v3 + 15056) = 16;
  *(unsigned char *)(v3 + 15064) = 2;
  *(void *)(v3 + 15072) = "taupe";
  *(void *)(v3 + 15080) = 5;
  *(unsigned char *)(v3 + 15088) = 2;
  *(void *)(v3 + 15096) = "taupe gray";
  *(void *)(v3 + 15104) = 10;
  *(unsigned char *)(v3 + 15112) = 2;
  *(void *)(v3 + 15120) = "tawny";
  *(void *)(v3 + 15128) = 5;
  *(unsigned char *)(v3 + 15136) = 2;
  *(void *)(v3 + 15144) = "tea green";
  *(void *)(v3 + 15152) = 9;
  *(unsigned char *)(v3 + 15160) = 2;
  *(void *)(v3 + 15168) = "tea rose";
  *(void *)(v3 + 15176) = 8;
  *(unsigned char *)(v3 + 15184) = 2;
  *(void *)(v3 + 15192) = "teal";
  *(void *)(v3 + 15200) = 4;
  *(unsigned char *)(v3 + 15208) = 2;
  *(void *)(v3 + 15216) = "teal blue";
  *(void *)(v3 + 15224) = 9;
  *(unsigned char *)(v3 + 15232) = 2;
  *(void *)(v3 + 15240) = "teal green";
  *(void *)(v3 + 15248) = 10;
  *(unsigned char *)(v3 + 15256) = 2;
  *(void *)(v3 + 15264) = "terra cotta";
  *(void *)(v3 + 15272) = 11;
  *(unsigned char *)(v3 + 15280) = 2;
  *(void *)(v3 + 15288) = "thistle";
  *(void *)(v3 + 15296) = 7;
  *(unsigned char *)(v3 + 15304) = 2;
  *(void *)(v3 + 15312) = "thulian pink";
  *(void *)(v3 + 15320) = 12;
  *(unsigned char *)(v3 + 15328) = 2;
  *(void *)(v3 + 15336) = "tiffany blue";
  *(void *)(v3 + 15344) = 12;
  *(unsigned char *)(v3 + 15352) = 2;
  *(void *)(v3 + 15360) = "tiger eye";
  *(void *)(v3 + 15368) = 9;
  *(unsigned char *)(v3 + 15376) = 2;
  *(void *)(v3 + 15384) = "timberwolf";
  *(void *)(v3 + 15392) = 10;
  *(unsigned char *)(v3 + 15400) = 2;
  *(void *)(v3 + 15408) = "titanium yellow";
  *(void *)(v3 + 15416) = 15;
  *(unsigned char *)(v3 + 15424) = 2;
  *(void *)(v3 + 15432) = "tomato";
  *(void *)(v3 + 15440) = 6;
  *(unsigned char *)(v3 + 15448) = 2;
  *(void *)(v3 + 15456) = "topaz";
  *(void *)(v3 + 15464) = 5;
  *(unsigned char *)(v3 + 15472) = 2;
  *(void *)(v3 + 15480) = "tractor red";
  *(void *)(v3 + 15488) = 11;
  *(unsigned char *)(v3 + 15496) = 2;
  *(void *)(v3 + 15504) = "trolley grey";
  *(void *)(v3 + 15512) = 12;
  *(unsigned char *)(v3 + 15520) = 2;
  *(void *)(v3 + 15528) = "tropical rain forest";
  *(void *)(v3 + 15536) = 20;
  *(unsigned char *)(v3 + 15544) = 2;
  *(void *)(v3 + 15552) = "true blue";
  *(void *)(v3 + 15560) = 9;
  *(unsigned char *)(v3 + 15568) = 2;
  *(void *)(v3 + 15576) = "tufts blue";
  *(void *)(v3 + 15584) = 10;
  *(unsigned char *)(v3 + 15592) = 2;
  *(void *)(v3 + 15600) = "tumbleweed";
  *(void *)(v3 + 15608) = 10;
  *(unsigned char *)(v3 + 15616) = 2;
  *(void *)(v3 + 15624) = "turkish rose";
  *(void *)(v3 + 15632) = 12;
  *(unsigned char *)(v3 + 15640) = 2;
  *(void *)(v3 + 15648) = "turquoise";
  *(void *)(v3 + 15656) = 9;
  *(unsigned char *)(v3 + 15664) = 2;
  *(void *)(v3 + 15672) = "turquoise blue";
  *(void *)(v3 + 15680) = 14;
  *(unsigned char *)(v3 + 15688) = 2;
  *(void *)(v3 + 15696) = "turquoise green";
  *(void *)(v3 + 15704) = 15;
  *(unsigned char *)(v3 + 15712) = 2;
  *(void *)(v3 + 15720) = "tuscan red";
  *(void *)(v3 + 15728) = 10;
  *(unsigned char *)(v3 + 15736) = 2;
  *(void *)(v3 + 15744) = "twilight lavender";
  *(void *)(v3 + 15752) = 17;
  *(unsigned char *)(v3 + 15760) = 2;
  *(void *)(v3 + 15768) = "tyrian purple";
  *(void *)(v3 + 15776) = 13;
  *(unsigned char *)(v3 + 15784) = 2;
  *(void *)(v3 + 15792) = "ua blue";
  *(void *)(v3 + 15800) = 7;
  *(unsigned char *)(v3 + 15808) = 2;
  *(void *)(v3 + 15816) = "ua red";
  *(void *)(v3 + 15824) = 6;
  *(unsigned char *)(v3 + 15832) = 2;
  *(void *)(v3 + 15840) = "ucla blue";
  *(void *)(v3 + 15848) = 9;
  *(unsigned char *)(v3 + 15856) = 2;
  *(void *)(v3 + 15864) = "ucla gold";
  *(void *)(v3 + 15872) = 9;
  *(unsigned char *)(v3 + 15880) = 2;
  *(void *)(v3 + 15888) = "ufo green";
  *(void *)(v3 + 15896) = 9;
  *(unsigned char *)(v3 + 15904) = 2;
  *(void *)(v3 + 15912) = "up forest green";
  *(void *)(v3 + 15920) = 15;
  *(unsigned char *)(v3 + 15928) = 2;
  *(void *)(v3 + 15936) = "up maroon";
  *(void *)(v3 + 15944) = 9;
  *(unsigned char *)(v3 + 15952) = 2;
  *(void *)(v3 + 15960) = "usc cardinal";
  *(void *)(v3 + 15968) = 12;
  *(unsigned char *)(v3 + 15976) = 2;
  *(void *)(v3 + 15984) = "usc gold";
  *(void *)(v3 + 15992) = 8;
  *(unsigned char *)(v3 + 16000) = 2;
  *(void *)(v3 + 16008) = "ube";
  *(void *)(v3 + 16016) = 3;
  *(unsigned char *)(v3 + 16024) = 2;
  *(void *)(v3 + 16032) = "ultra pink";
  *(void *)(v3 + 16040) = 10;
  *(unsigned char *)(v3 + 16048) = 2;
  *(void *)(v3 + 16056) = "ultramarine";
  *(void *)(v3 + 16064) = 11;
  *(unsigned char *)(v3 + 16072) = 2;
  *(void *)(v3 + 16080) = "ultramarine blue";
  *(void *)(v3 + 16088) = 16;
  *(unsigned char *)(v3 + 16096) = 2;
  *(void *)(v3 + 16104) = "umber";
  *(void *)(v3 + 16112) = 5;
  *(unsigned char *)(v3 + 16120) = 2;
  *(void *)(v3 + 16128) = "united nations blue";
  *(void *)(v3 + 16136) = 19;
  *(unsigned char *)(v3 + 16144) = 2;
  *(void *)(v3 + 16152) = "university of california gold";
  *(void *)(v3 + 16160) = 29;
  *(unsigned char *)(v3 + 16168) = 2;
  *(void *)(v3 + 16176) = "unmellow yellow";
  *(void *)(v3 + 16184) = 15;
  *(unsigned char *)(v3 + 16192) = 2;
  *(void *)(v3 + 16200) = "upsdell red";
  *(void *)(v3 + 16208) = 11;
  *(unsigned char *)(v3 + 16216) = 2;
  *(void *)(v3 + 16224) = "vanilla";
  *(void *)(v3 + 16232) = 7;
  *(unsigned char *)(v3 + 16240) = 2;
  *(void *)(v3 + 16248) = "vegas gold";
  *(void *)(v3 + 16256) = 10;
  *(unsigned char *)(v3 + 16264) = 2;
  *(void *)(v3 + 16272) = "venetian red";
  *(void *)(v3 + 16280) = 12;
  *(unsigned char *)(v3 + 16288) = 2;
  *(void *)(v3 + 16296) = "verdigris";
  *(void *)(v3 + 16304) = 9;
  *(unsigned char *)(v3 + 16312) = 2;
  *(void *)(v3 + 16320) = "vermilion";
  *(void *)(v3 + 16328) = 9;
  *(unsigned char *)(v3 + 16336) = 2;
  *(void *)(v3 + 16344) = "veronica";
  *(void *)(v3 + 16352) = 8;
  *(unsigned char *)(v3 + 16360) = 2;
  *(void *)(v3 + 16368) = "violet";
  *(void *)(v3 + 16376) = 6;
  *(unsigned char *)(v3 + 0x4000) = 2;
  *(void *)(v3 + 16392) = "violet blue";
  *(void *)(v3 + 16400) = 11;
  *(void *)(v3 + 7968) = "laurel green";
  *(unsigned char *)(v3 + 16408) = 2;
  *(void *)(v3 + 16416) = "violet red";
  *(void *)(v3 + 16424) = 10;
  *(unsigned char *)(v3 + 16432) = 2;
  *(void *)(v3 + 16440) = "viridian";
  *(void *)(v3 + 16448) = 8;
  *(unsigned char *)(v3 + 16456) = 2;
  *(void *)(v3 + 16464) = "vivid auburn";
  *(void *)(v3 + 16472) = 12;
  *(unsigned char *)(v3 + 16480) = 2;
  *(void *)(v3 + 16488) = "vivid burgundy";
  *(void *)(v3 + 16496) = 14;
  *(unsigned char *)(v3 + 16504) = 2;
  *(void *)(v3 + 16512) = "vivid cerise";
  *(void *)(v3 + 16520) = 12;
  *(unsigned char *)(v3 + 16528) = 2;
  *(void *)(v3 + 16536) = "vivid tangerine";
  *(void *)(v3 + 16544) = 15;
  *(unsigned char *)(v3 + 16552) = 2;
  *(void *)(v3 + 16560) = "vivid violet";
  *(void *)(v3 + 16568) = 12;
  *(unsigned char *)(v3 + 16576) = 2;
  *(void *)(v3 + 16584) = "warm black";
  *(void *)(v3 + 16592) = 10;
  *(unsigned char *)(v3 + 16600) = 2;
  *(void *)(v3 + 16608) = "waterspout";
  *(void *)(v3 + 16616) = 10;
  *(unsigned char *)(v3 + 16624) = 2;
  *(void *)(v3 + 16632) = "wenge";
  *(void *)(v3 + 16640) = 5;
  *(unsigned char *)(v3 + 16648) = 2;
  *(void *)(v3 + 16656) = "wheat";
  *(void *)(v3 + 16664) = 5;
  *(unsigned char *)(v3 + 16672) = 2;
  *(void *)(v3 + 16680) = "white";
  *(void *)(v3 + 16688) = 5;
  *(unsigned char *)(v3 + 16696) = 2;
  *(void *)(v3 + 16704) = "white smoke";
  *(void *)(v3 + 16712) = 11;
  *(unsigned char *)(v3 + 16720) = 2;
  *(void *)(v3 + 16728) = "wild strawberry";
  *(void *)(v3 + 16736) = 15;
  *(unsigned char *)(v3 + 16744) = 2;
  *(void *)(v3 + 16752) = "wild watermelon";
  *(void *)(v3 + 16760) = 15;
  *(unsigned char *)(v3 + 16768) = 2;
  *(void *)(v3 + 16776) = "wild blue yonder";
  *(void *)(v3 + 16784) = 16;
  *(unsigned char *)(v3 + 16792) = 2;
  *(void *)(v3 + 16800) = "wine";
  *(void *)(v3 + 16808) = 4;
  *(unsigned char *)(v3 + 16816) = 2;
  *(void *)(v3 + 16824) = "wisteria";
  *(void *)(v3 + 16832) = 8;
  *(unsigned char *)(v3 + 16840) = 2;
  *(void *)(v3 + 16848) = "xanadu";
  *(void *)(v3 + 16856) = 6;
  *(unsigned char *)(v3 + 16864) = 2;
  *(void *)(v3 + 16872) = "yale blue";
  *(void *)(v3 + 16880) = 9;
  *(unsigned char *)(v3 + 16888) = 2;
  *(void *)(v3 + 16896) = "yellow";
  *(void *)(v3 + 16904) = 6;
  *(unsigned char *)(v3 + 16912) = 2;
  *(void *)(v3 + 16920) = "yellow orange";
  *(void *)(v3 + 16928) = 13;
  *(unsigned char *)(v3 + 16936) = 2;
  *(void *)(v3 + 16944) = "yellow green";
  *(void *)(v3 + 16952) = 12;
  *(unsigned char *)(v3 + 16960) = 2;
  *(void *)(v3 + 16968) = "zaffre";
  *(void *)(v3 + 16976) = 6;
  *(unsigned char *)(v3 + 16984) = 2;
  *(void *)(v3 + 16992) = "zinnwaldite brown";
  *(void *)(v3 + 17000) = 17;
  *(unsigned char *)(v3 + 17008) = 2;
  *(void *)(v3 + 7976) = 12;
  v4._rawValue = (void *)nullsub_1(v8);
  v10._uint64_t countAndFlagsBits = countAndFlagsBits;
  v10._object = object;
  unint64_t v5 = sub_38120(v4, v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v5 < 0x80
    || v5 - 128 < 0x40
    || v5 - 192 < 0x40
    || v5 - 256 < 0x40
    || v5 - 320 < 0x40
    || v5 - 384 < 0x40
    || v5 - 448 < 0x40
    || v5 - 512 < 0x40)
  {
    return (HomeAutomationSiriSuggestions::HueSemantic_optional)v5;
  }
  unint64_t v7 = v5 - 576;
  result.value = HomeAutomationSiriSuggestions_HueSemantic_sunset;
  LOWORD(v5) = 576;
  switch(v7)
  {
    case 0uLL:
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v5;
    case 1uLL:
      LOWORD(v5) = 577;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v5;
    case 2uLL:
      LOWORD(v5) = 578;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v5;
    case 3uLL:
      LOWORD(v5) = 579;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v5;
    case 4uLL:
      LOWORD(v5) = 580;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v5;
    case 5uLL:
      LOWORD(v5) = 581;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v5;
    case 6uLL:
      LOWORD(v5) = 582;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v5;
    case 7uLL:
      LOWORD(v5) = 583;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v5;
    case 8uLL:
      LOWORD(v5) = 584;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v5;
    case 9uLL:
      LOWORD(v5) = 585;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v5;
    case 0xAuLL:
      LOWORD(v5) = 586;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v5;
    case 0xBuLL:
      LOWORD(v5) = 587;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v5;
    case 0xCuLL:
      LOWORD(v5) = 588;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v5;
    case 0xDuLL:
      LOWORD(v5) = 589;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v5;
    case 0xEuLL:
      LOWORD(v5) = 590;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v5;
    case 0xFuLL:
      LOWORD(v5) = 591;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v5;
    case 0x10uLL:
      LOWORD(v5) = 592;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v5;
    case 0x11uLL:
      LOWORD(v5) = 593;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v5;
    case 0x12uLL:
      LOWORD(v5) = 594;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v5;
    case 0x13uLL:
      LOWORD(v5) = 595;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v5;
    case 0x14uLL:
      LOWORD(v5) = 596;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v5;
    case 0x15uLL:
      LOWORD(v5) = 597;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v5;
    case 0x16uLL:
      LOWORD(v5) = 598;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v5;
    case 0x17uLL:
      LOWORD(v5) = 599;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v5;
    case 0x18uLL:
      LOWORD(v5) = 600;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v5;
    case 0x19uLL:
      LOWORD(v5) = 601;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v5;
    case 0x1AuLL:
      LOWORD(v5) = 602;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v5;
    case 0x1BuLL:
      LOWORD(v5) = 603;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v5;
    case 0x1CuLL:
      LOWORD(v5) = 604;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v5;
    case 0x1DuLL:
      LOWORD(v5) = 605;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v5;
    case 0x1EuLL:
      LOWORD(v5) = 606;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v5;
    case 0x1FuLL:
      LOWORD(v5) = 607;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v5;
    case 0x20uLL:
      LOWORD(v5) = 608;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v5;
    case 0x21uLL:
      LOWORD(v5) = 609;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v5;
    case 0x22uLL:
      LOWORD(v5) = 610;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v5;
    case 0x23uLL:
      LOWORD(v5) = 611;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v5;
    case 0x24uLL:
      LOWORD(v5) = 612;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v5;
    case 0x25uLL:
      LOWORD(v5) = 613;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v5;
    case 0x26uLL:
      LOWORD(v5) = 614;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v5;
    case 0x27uLL:
      LOWORD(v5) = 615;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v5;
    case 0x28uLL:
      LOWORD(v5) = 616;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v5;
    case 0x29uLL:
      LOWORD(v5) = 617;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v5;
    case 0x2AuLL:
      LOWORD(v5) = 618;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v5;
    case 0x2BuLL:
      LOWORD(v5) = 619;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v5;
    case 0x2CuLL:
      LOWORD(v5) = 620;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v5;
    case 0x2DuLL:
      LOWORD(v5) = 621;
      return (HomeAutomationSiriSuggestions::HueSemantic_optional)v5;
    case 0x2EuLL:
      return result;
    case 0x2FuLL:
      result.value = HomeAutomationSiriSuggestions_HueSemantic_sunset_orange;
      break;
    case 0x30uLL:
      result.value = HomeAutomationSiriSuggestions_HueSemantic_tan;
      break;
    case 0x31uLL:
      result.value = HomeAutomationSiriSuggestions_HueSemantic_tangelo;
      break;
    case 0x32uLL:
      result.value = HomeAutomationSiriSuggestions_HueSemantic_tangerine;
      break;
    case 0x33uLL:
      result.value = HomeAutomationSiriSuggestions_HueSemantic_tangerine_yellow;
      break;
    case 0x34uLL:
      result.value = HomeAutomationSiriSuggestions_HueSemantic_taupe;
      break;
    case 0x35uLL:
      result.value = HomeAutomationSiriSuggestions_HueSemantic_taupe_gray;
      break;
    case 0x36uLL:
      result.value = HomeAutomationSiriSuggestions_HueSemantic_tawny;
      break;
    case 0x37uLL:
      result.value = HomeAutomationSiriSuggestions_HueSemantic_tea_green;
      break;
    case 0x38uLL:
      result.value = HomeAutomationSiriSuggestions_HueSemantic_tea_rose;
      break;
    case 0x39uLL:
      result.value = HomeAutomationSiriSuggestions_HueSemantic_teal;
      break;
    case 0x3AuLL:
      result.value = HomeAutomationSiriSuggestions_HueSemantic_teal_blue;
      break;
    case 0x3BuLL:
      result.value = HomeAutomationSiriSuggestions_HueSemantic_teal_green;
      break;
    case 0x3CuLL:
      result.value = HomeAutomationSiriSuggestions_HueSemantic_terra_cotta;
      break;
    case 0x3DuLL:
      result.value = HomeAutomationSiriSuggestions_HueSemantic_thistle;
      break;
    case 0x3EuLL:
      result.value = HomeAutomationSiriSuggestions_HueSemantic_thulian_pink;
      break;
    case 0x3FuLL:
      result.value = HomeAutomationSiriSuggestions_HueSemantic_tiffany_blue;
      break;
    default:
      result.value = HomeAutomationSiriSuggestions_HueSemantic_unknownDefault;
      break;
  }
  return result;
}

_UNKNOWN **static HueSemantic.allCases.getter()
{
  return &off_49C18;
}

uint64_t sub_1045C(__int16 *a1, __int16 *a2)
{
  return sub_167D4(*a1, *a2);
}

Swift::Int sub_10468()
{
  return sub_13DBC(*v0);
}

uint64_t sub_10470(uint64_t a1)
{
  return sub_13FBC(a1, *v1);
}

Swift::Int sub_10478(uint64_t a1)
{
  return sub_13FFC(a1, *v1);
}

HomeAutomationSiriSuggestions::HueSemantic_optional sub_10480@<W0>(Swift::String *a1@<X0>, HomeAutomationSiriSuggestions::HueSemantic_optional *a2@<X8>)
{
  result.value = HueSemantic.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

void sub_104B0(void *a1@<X8>)
{
  HueSemantic.rawValue.getter(*v1);
  *a1 = v3;
  a1[1] = v4;
}

uint64_t sub_104DC(__int16 *a1, __int16 *a2)
{
  return static HueSemantic.< infix(_:_:)(*a1, *a2);
}

BOOL sub_104E8(unsigned __int16 *a1, unsigned __int16 *a2)
{
  return sub_14150(*a1, *a2);
}

BOOL sub_104F4(__int16 *a1, __int16 *a2)
{
  return sub_141BC(*a1, *a2);
}

uint64_t sub_10500(unsigned __int16 *a1, unsigned __int16 *a2)
{
  return sub_1424C(*a1, *a2);
}

void sub_1050C(void *a1@<X8>)
{
  *a1 = &off_49C18;
}

uint64_t sub_1051C()
{
  return sub_37ED0();
}

uint64_t sub_1057C()
{
  return sub_37EC0();
}

uint64_t sub_105CC(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_10938();
  unint64_t v5 = sub_10984();
  unint64_t v6 = sub_109D0();
  return static TerminalNodeBoundedSemanticValue<>.fromIntentNodeValue(_:)(a1, a2, v4, v5, v6);
}

unint64_t sub_10644()
{
  unint64_t result = qword_4D0D8;
  if (!qword_4D0D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D0D8);
  }
  return result;
}

unint64_t sub_10694()
{
  unint64_t result = qword_4D0E0;
  if (!qword_4D0E0)
  {
    sub_44C4(&qword_4D0E8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D0E0);
  }
  return result;
}

unint64_t sub_106EC()
{
  unint64_t result = qword_4D0F0;
  if (!qword_4D0F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D0F0);
  }
  return result;
}

unint64_t sub_1073C()
{
  unint64_t result = qword_4D0F8;
  if (!qword_4D0F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D0F8);
  }
  return result;
}

_WORD *initializeBufferWithCopyOfBuffer for HueSemantic(_WORD *result, _WORD *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for HueSemantic(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD3C)
  {
    if (a2 + 708 <= 0xFFFEFFFF) {
      int v2 = 2;
    }
    else {
      int v2 = 4;
    }
    if (a2 + 708 < 0xFF0000) {
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
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
    }
    else
    {
      int v4 = *((unsigned __int8 *)a1 + 2);
      if (!*((unsigned char *)a1 + 2)) {
        goto LABEL_17;
      }
    }
    int v5 = (*a1 | (v4 << 16)) - 709;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x2C5;
  int v5 = v6 - 709;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for HueSemantic(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a3 + 708 <= 0xFFFEFFFF) {
    int v3 = 2;
  }
  else {
    int v3 = 4;
  }
  if (a3 + 708 < 0xFF0000) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD3C) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD3B)
  {
    unsigned int v6 = ((a2 - 64828) >> 16) + 1;
    *(_WORD *)unint64_t result = a2 + 708;
    switch(v5)
    {
      case 1:
        *(unsigned char *)(result + 2) = v6;
        break;
      case 2:
        *(_WORD *)(result + 2) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x108F0);
      case 4:
        *(_DWORD *)(result + 2) = v6;
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
        *(unsigned char *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 2) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 2) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *(_WORD *)unint64_t result = a2 + 708;
        break;
    }
  }
  return result;
}

uint64_t sub_10918(unsigned __int16 *a1)
{
  return *a1;
}

_WORD *sub_10920(_WORD *result, __int16 a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for HueSemantic()
{
  return &type metadata for HueSemantic;
}

unint64_t sub_10938()
{
  unint64_t result = qword_4D100;
  if (!qword_4D100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D100);
  }
  return result;
}

unint64_t sub_10984()
{
  unint64_t result = qword_4D108;
  if (!qword_4D108)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D108);
  }
  return result;
}

unint64_t sub_109D0()
{
  unint64_t result = qword_4D110;
  if (!qword_4D110)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D110);
  }
  return result;
}

uint64_t sub_10A1C(unsigned int a1)
{
  return a1 | 0x616C622000000000;
}

uint64_t sub_10A70(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFLL | 0x7261000000000000;
}

uint64_t sub_10A78()
{
  return 0x206E616973726570;
}

uint64_t sub_10A8C(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFLL | 0x7220000000000000;
}

uint64_t sub_10A94()
{
  return 0x7265646E6576616CLL;
}

uint64_t sub_10AA8(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFLL | 0x6970000000000000;
}

uint64_t sub_10AB0(unsigned int a1)
{
  return a1 | 0x6C6F672000000000;
}

uint64_t sub_10AC4(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFLL | 0x6E69000000000000;
}

uint64_t sub_10ACC(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFLL | 0x726F000000000000;
}

uint64_t sub_10AE8(unsigned int a1)
{
  return a1 | 0x6165702000000000;
}

uint64_t sub_10AF4(uint64_t a1)
{
  return a1 & 0xFFFFFFFFFFFFLL | 0x6C62000000000000;
}

uint64_t sub_10B14(unsigned int a1)
{
  return a1 | 0x7561742000000000;
}

uint64_t sub_10B20(unsigned int a1)
{
  return a1 | 0x6565726700000000;
}

uint64_t sub_10B44()
{
  sub_11914();
  sub_119A0(v1, v2, v3, v4);
  uint64_t v5 = sub_2420(&qword_4D188);
  sub_119B0(v5);
  *(void *)(v0 + 56) = sub_11974();
  *(void *)(v0 + 64) = swift_task_alloc();
  sub_11920();
  return _swift_task_switch(v6, v7, v8);
}

uint64_t sub_10BD0()
{
  uint64_t v2 = v1[8];
  uint64_t v3 = v1[3];
  sub_2420(&qword_4D190);
  uint64_t v4 = (__n128 *)swift_allocObject();
  v1[9] = v4;
  sub_11838(v4, (__n128)xmmword_38BF0);
  sub_1178C(v3, v2, &qword_4D188);
  uint64_t v5 = sub_37610();
  sub_1189C(v5);
  if (v6)
  {
    sub_3D60(v2, &qword_4D188);
    sub_11938();
  }
  else
  {
    v4[4].n128_u64[1] = v3;
    sub_3C6C(v0);
    sub_1188C();
    sub_1187C();
    v7();
  }
  uint64_t v8 = sub_117F4();
  sub_1178C(v8, v2, &qword_4D188);
  sub_118EC();
  if (v6)
  {
    sub_3D60(v2, &qword_4D188);
    sub_11938();
  }
  else
  {
    v4[7].n128_u64[1] = v3;
    sub_3C6C(v0);
    sub_1188C();
    sub_1187C();
    v9();
  }
  uint64_t v10 = sub_1185C();
  if (v3)
  {
    uint64_t v10 = sub_37B50();
  }
  else
  {
    v4[9].n128_u64[1] = 0;
    v4[10].n128_u64[0] = 0;
  }
  v4[9].n128_u64[0] = v3;
  v4[10].n128_u64[1] = v10;
  sub_118C8();
  uint64_t v11 = swift_task_alloc();
  unint64_t v12 = (void *)sub_11990(v11);
  *unint64_t v12 = v13;
  v12[1] = sub_10DA0;
  sub_11954();
  sub_11944();
  return v14();
}

uint64_t sub_10DA0()
{
  sub_11914();
  sub_11820();
  uint64_t v3 = v2;
  sub_1192C();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_1192C();
  *char v6 = v5;
  *(void *)(v3 + 88) = v0;
  swift_task_dealloc();
  if (v0)
  {
    sub_11920();
    return _swift_task_switch(v7, v8, v9);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_11964();
    return v10();
  }
}

uint64_t sub_10EB8()
{
  sub_11914();
  sub_119A0(v1, v2, v3, v4);
  uint64_t v5 = sub_2420(&qword_4D188);
  sub_119B0(v5);
  *(void *)(v0 + 56) = sub_11974();
  *(void *)(v0 + 64) = swift_task_alloc();
  sub_11920();
  return _swift_task_switch(v6, v7, v8);
}

uint64_t sub_10F44()
{
  uint64_t v2 = v1[8];
  uint64_t v3 = v1[3];
  sub_2420(&qword_4D190);
  uint64_t v4 = (__n128 *)swift_allocObject();
  v1[9] = v4;
  sub_11838(v4, (__n128)xmmword_38BF0);
  sub_1178C(v3, v2, &qword_4D188);
  uint64_t v5 = sub_37610();
  sub_1189C(v5);
  if (v6)
  {
    sub_3D60(v2, &qword_4D188);
    sub_11938();
  }
  else
  {
    v4[4].n128_u64[1] = v3;
    sub_3C6C(v0);
    sub_1188C();
    sub_1187C();
    v7();
  }
  uint64_t v8 = sub_117F4();
  sub_1178C(v8, v2, &qword_4D188);
  sub_118EC();
  if (v6)
  {
    sub_3D60(v2, &qword_4D188);
    sub_11938();
  }
  else
  {
    v4[7].n128_u64[1] = v3;
    sub_3C6C(v0);
    sub_1188C();
    sub_1187C();
    v9();
  }
  uint64_t v10 = sub_1185C();
  if (v3)
  {
    uint64_t v10 = sub_37B50();
  }
  else
  {
    v4[9].n128_u64[1] = 0;
    v4[10].n128_u64[0] = 0;
  }
  v4[9].n128_u64[0] = v3;
  v4[10].n128_u64[1] = v10;
  sub_118C8();
  uint64_t v11 = swift_task_alloc();
  uint64_t v12 = (void *)sub_11990(v11);
  *uint64_t v12 = v13;
  v12[1] = sub_11114;
  sub_11954();
  sub_11944();
  return v14();
}

uint64_t sub_11114()
{
  sub_11914();
  sub_11820();
  uint64_t v3 = v2;
  sub_1192C();
  *uint64_t v4 = v3;
  uint64_t v5 = *v1;
  sub_1192C();
  *char v6 = v5;
  *(void *)(v3 + 88) = v0;
  swift_task_dealloc();
  if (v0)
  {
    sub_11920();
    return _swift_task_switch(v7, v8, v9);
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_11964();
    return v10();
  }
}

uint64_t sub_1122C()
{
  sub_11914();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_112A0()
{
  sub_11914();
  sub_119A0(v1, v2, v3, v4);
  uint64_t v5 = sub_2420(&qword_4D188);
  sub_119B0(v5);
  *(void *)(v0 + 56) = sub_11974();
  *(void *)(v0 + 64) = swift_task_alloc();
  sub_11920();
  return _swift_task_switch(v6, v7, v8);
}

uint64_t sub_1132C()
{
  uint64_t v2 = v1[8];
  uint64_t v3 = v1[3];
  sub_2420(&qword_4D190);
  uint64_t v4 = (__n128 *)swift_allocObject();
  v1[9] = v4;
  sub_11838(v4, (__n128)xmmword_38BF0);
  sub_1178C(v3, v2, &qword_4D188);
  uint64_t v5 = sub_37610();
  sub_1189C(v5);
  if (v6)
  {
    sub_3D60(v2, &qword_4D188);
    sub_11938();
  }
  else
  {
    v4[4].n128_u64[1] = v3;
    sub_3C6C(v0);
    sub_1188C();
    sub_1187C();
    v7();
  }
  uint64_t v8 = sub_117F4();
  sub_1178C(v8, v2, &qword_4D188);
  sub_118EC();
  if (v6)
  {
    sub_3D60(v2, &qword_4D188);
    sub_11938();
  }
  else
  {
    v4[7].n128_u64[1] = v3;
    sub_3C6C(v0);
    sub_1188C();
    sub_1187C();
    v9();
  }
  uint64_t v10 = sub_1185C();
  if (v3)
  {
    uint64_t v10 = sub_37B50();
  }
  else
  {
    v4[9].n128_u64[1] = 0;
    v4[10].n128_u64[0] = 0;
  }
  v4[9].n128_u64[0] = v3;
  v4[10].n128_u64[1] = v10;
  sub_118C8();
  uint64_t v11 = swift_task_alloc();
  uint64_t v12 = (void *)sub_11990(v11);
  *uint64_t v12 = v13;
  v12[1] = sub_10DA0;
  sub_11954();
  sub_11944();
  return v14();
}

uint64_t HomeSuggestionCATs.__allocating_init(templateDir:options:globals:)(uint64_t a1, uint64_t a2)
{
  return HomeSuggestionCATs.init(templateDir:options:globals:)(a1, a2);
}

uint64_t HomeSuggestionCATs.init(templateDir:options:globals:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_37630();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_2420(&qword_4D118);
  uint64_t v9 = sub_119B0(v8);
  __chkstk_darwin(v9);
  sub_1178C(a1, (uint64_t)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_4D118);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
  uint64_t v11 = sub_375D0();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a2, v4);
  sub_3D60(a1, &qword_4D118);
  return v11;
}

uint64_t HomeSuggestionCATs.__deallocating_deinit()
{
  uint64_t v0 = _s29HomeAutomationSiriSuggestions0A14SuggestionCATsCfd_0();
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for HomeSuggestionCATs()
{
  uint64_t result = qword_4D120;
  if (!qword_4D120) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_11744()
{
  return swift_initClassMetadata2();
}

uint64_t sub_11784()
{
  return type metadata accessor for HomeSuggestionCATs();
}

uint64_t sub_1178C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_2420(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_117F4()
{
  uint64_t result = *(void *)(v0 + 32);
  *(void *)(v1 + 80) = 0x7475626972747461;
  *(void *)(v1 + 88) = 0xE900000000000065;
  return result;
}

__n128 *sub_11838(__n128 *result, __n128 a2)
{
  result[1] = a2;
  result[2].n128_u64[0] = 0x656D614E6D6F6F72;
  result[2].n128_u64[1] = 0xE800000000000000;
  return result;
}

uint64_t sub_1185C()
{
  *(void *)(v0 + 128) = 0x65756C6176;
  *(void *)(v0 + 136) = 0xE500000000000000;
  return 0;
}

uint64_t sub_1189C(uint64_t a1)
{
  return sub_3DBC(v1, 1, a1);
}

uint64_t sub_118C8()
{
  return swift_retain();
}

uint64_t sub_118EC()
{
  return sub_3DBC(v1, 1, v0);
}

double sub_11938()
{
  double result = 0.0;
  *uint64_t v0 = 0u;
  v0[1] = 0u;
  return result;
}

uint64_t sub_11964()
{
  return v0 + 8;
}

uint64_t sub_11974()
{
  return swift_task_alloc();
}

uint64_t sub_11990(uint64_t result)
{
  *(void *)(v1 + 80) = result;
  return result;
}

uint64_t sub_119A0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[5] = a4;
  v5[6] = v4;
  v5[3] = a2;
  v5[4] = a3;
  v5[2] = result;
  return result;
}

uint64_t sub_119B0(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_119BC()
{
  uint64_t v0 = sub_37A80();
  sub_4934(v0, qword_509D0);
  uint64_t v1 = sub_23E8(v0, (uint64_t)qword_509D0);
  uint64_t v2 = enum case for HomeSuggestionType.setColor(_:);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);
  return v3(v1, v2, v0);
}

uint64_t sub_11A44()
{
  uint64_t v0 = sub_37710();
  sub_4934(v0, qword_509E8);
  uint64_t v1 = (void *)sub_23E8(v0, (uint64_t)qword_509E8);
  *uint64_t v1 = sub_29388();
  v1[1] = v2;
  uint64_t v3 = enum case for DialogDetails.catId(_:);
  uint64_t v4 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);
  return v4(v1, v3, v0);
}

ValueMetadata *type metadata accessor for SetColorSuggestion()
{
  return &type metadata for SetColorSuggestion;
}

uint64_t sub_11AEC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 24);
  long long v11 = *(_OWORD *)(a1 + 32);
  sub_23A4((void *)a1, v3);
  if (qword_4CCC0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_37A80();
  sub_23E8(v4, (uint64_t)qword_509D0);
  uint64_t v5 = sub_37A70();
  uint64_t v7 = v6;
  uint64_t v8 = type metadata accessor for HomeAutomationCandidateSuggestionConfigurator();
  swift_allocObject();
  uint64_t v9 = sub_16A14(v5, v7);
  v12[3] = v8;
  v12[4] = sub_123C8(&qword_4D0C8, (void (*)(uint64_t))type metadata accessor for HomeAutomationCandidateSuggestionConfigurator);
  v12[0] = v9;
  *(void *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = v11;
  sub_3C6C((uint64_t *)a2);
  sub_37640();
  return sub_3C1C((uint64_t)v12);
}

uint64_t sub_11C38@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v44 = a1;
  uint64_t v45 = a2;
  uint64_t v47 = sub_2420(&qword_4D048);
  sub_4EA8();
  uint64_t v46 = v2;
  __chkstk_darwin(v3);
  v51.n128_u64[0] = (unint64_t)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_37C30();
  sub_4EA8();
  uint64_t v7 = v6;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2420(&qword_4D050);
  long long v11 = (int *)type metadata accessor for ResolverParameterProperties();
  unint64_t v12 = (*(unsigned __int8 *)(*((void *)v11 - 1) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*((void *)v11 - 1) + 80);
  uint64_t v40 = *(void *)(*((void *)v11 - 1) + 72);
  uint64_t v13 = v40;
  uint64_t v14 = swift_allocObject();
  uint64_t v52 = v14;
  *(_OWORD *)(v14 + 16) = xmmword_38BF0;
  unint64_t v15 = v14 + v12;
  unint64_t v43 = *(void (**)(char *, void, uint64_t))(v7 + 104);
  v43(v10, enum case for SuggestionParameter.roomName(_:), v5);
  uint64_t v16 = type metadata accessor for RoomNameResolver();
  swift_allocObject();
  uint64_t v17 = sub_1D460();
  uint64_t v18 = (uint64_t *)(v15 + v11[5]);
  v18[3] = v16;
  v18[4] = sub_123C8((unint64_t *)&qword_4D0B0, (void (*)(uint64_t))type metadata accessor for RoomNameResolver);
  *uint64_t v18 = v17;
  uint64_t v19 = *(void (**)(unint64_t, char *, uint64_t))(v7 + 32);
  uint64_t v41 = v7 + 32;
  uint64_t v42 = v19;
  v19(v15, v10, v5);
  *(unsigned char *)(v15 + v11[6]) = 1;
  *(unsigned char *)(v15 + v11[7]) = 0;
  uint64_t v50 = sub_2420(&qword_4D060);
  v49.n128_u64[0] = (unint64_t)&type metadata for Any + 8;
  uint64_t v48 = sub_36818;
  sub_375B0();
  unint64_t v20 = v15 + v13;
  uint64_t v21 = v43;
  v43(v10, enum case for SuggestionParameter.attribute(_:), v5);
  uint64_t v22 = type metadata accessor for AttributeResolver();
  swift_allocObject();
  long long v23 = sub_2C5BC();
  uint64_t v24 = (void *)(v15 + v13 + v11[5]);
  v24[3] = v22;
  v24[4] = sub_123C8(&qword_4D198, (void (*)(uint64_t))type metadata accessor for AttributeResolver);
  *uint64_t v24 = v23;
  long long v39 = v10;
  uint64_t v25 = v5;
  uint64_t v38 = v5;
  uint64_t v26 = v5;
  long long v27 = v42;
  v42(v20, v10, v26);
  *(unsigned char *)(v20 + v11[6]) = 1;
  *(unsigned char *)(v20 + v11[7]) = 0;
  sub_706C();
  unint64_t v28 = v15 + 2 * v40;
  v21(v10, enum case for SuggestionParameter.value(_:), v25);
  uint64_t v29 = type metadata accessor for ValueResolver();
  swift_allocObject();
  long long v30 = sub_27BD0();
  uint64_t v31 = (void *)(v28 + v11[5]);
  v31[3] = v29;
  v31[4] = sub_123C8(&qword_4D1A0, (void (*)(uint64_t))type metadata accessor for ValueResolver);
  *uint64_t v31 = v30;
  v27(v28, v39, v38);
  *(unsigned char *)(v28 + v11[6]) = 0;
  *(unsigned char *)(v28 + v11[7]) = 0;
  sub_706C();
  sub_4DCC(v44, (uint64_t)&v55);
  LODWORD(v10) = *(unsigned __int8 *)(v15 + v11[7]);
  uint64_t v32 = sub_37800();
  swift_bridgeObjectRetain();
  sub_37C20();
  sub_7108();
  uint64_t v50 = v32;
  if (v10 == 1)
  {
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v46 + 16))(v51.n128_u64[0], v15 + v11[8], v47);
    sub_377E0();
  }
  else
  {
    sub_377F0();
  }
  __n128 v49 = v56;
  sub_70C0(v56.n128_f64[0]);
  sub_37C20();
  sub_3BB8(v15 + v11[5], (uint64_t)v53);
  sub_7118(v49);
  sub_703C();
  swift_release();
  swift_bridgeObjectRelease();
  sub_4E30((uint64_t)v53);
  sub_3C1C((uint64_t)v54);
  char v33 = *(unsigned char *)(v20 + v11[7]);
  sub_37C20();
  sub_7108();
  if (v33)
  {
    uint64_t v34 = v47;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v46 + 16))(v51.n128_u64[0], v20 + v11[8], v47);
    sub_7098();
  }
  else
  {
    sub_70E4();
    uint64_t v34 = v47;
  }
  __n128 v49 = v56;
  sub_70C0(v56.n128_f64[0]);
  sub_37C20();
  sub_3BB8(v20 + v11[5], (uint64_t)v53);
  sub_7118(v49);
  sub_703C();
  swift_release();
  swift_bridgeObjectRelease();
  sub_4E30((uint64_t)v53);
  sub_3C1C((uint64_t)v54);
  char v35 = *(unsigned char *)(v28 + v11[7]);
  sub_37C20();
  sub_7108();
  if (v35)
  {
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v46 + 16))(v51.n128_u64[0], v28 + v11[8], v34);
    sub_7098();
  }
  else
  {
    sub_70E4();
  }
  __n128 v51 = v56;
  sub_70C0(v56.n128_f64[0]);
  sub_37C20();
  sub_3BB8(v28 + v11[5], (uint64_t)v53);
  sub_7118(v51);
  sub_378A0();
  swift_release();
  swift_bridgeObjectRelease();
  sub_4E30((uint64_t)v53);
  sub_3C1C((uint64_t)v54);
  swift_bridgeObjectRelease();
  sub_4E90(&v55, v45);
  swift_setDeallocating();
  return sub_219FC();
}

uint64_t sub_123C8(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t AccessoryTypeSemantic.rawValue.getter(char a1)
{
  unint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      return 0x6B636F4C726F6F64;
    case 2:
      return 0x6172656D61437069;
    case 3:
      return 0x65526172656D6163;
    case 4:
    case 13:
    case 28:
    case 35:
      return result;
    case 5:
      return 0xD000000000000010;
    case 6:
      return 0x74656C74756FLL;
    case 7:
      return 0x686374697773;
    case 8:
      return 0x74736F6D72656874;
    case 9:
      return 0x616C6C69746E6576;
    case 10:
      return 0x73646E696C62;
    case 11:
      return 0x53636972656E6567;
    case 12:
      return 0x65536E6F69746F6DLL;
    case 14:
      uint64_t v3 = 0x6964696D7568;
      return v3 & 0xFFFFFFFFFFFFLL | 0x7974000000000000;
    case 15:
      return 0xD000000000000010;
    case 16:
      return 0xD000000000000014;
    case 17:
      return 0xD000000000000013;
    case 18:
      uint64_t v4 = 0x53656B6F6D73;
      return v4 & 0xFFFFFFFFFFFFLL | 0x6E65000000000000;
    case 19:
      return 0x53746361746E6F63;
    case 20:
    case 21:
      return 0x657A69726F746F6DLL;
    case 22:
      uint64_t v4 = 0x53746867696CLL;
      return v4 & 0xFFFFFFFFFFFFLL | 0x6E65000000000000;
    case 23:
      return 0x636E61707563636FLL;
    case 24:
      return 0x736E65536B61656CLL;
    case 25:
      return 0x79726574746162;
    case 26:
      return 0x6C6C6542726F6F64;
    case 27:
      return 0x6669727550726961;
    case 29:
      uint64_t v5 = 1952540008;
      goto LABEL_48;
    case 30:
      uint64_t v5 = 1819242339;
      goto LABEL_48;
    case 31:
      return 1952541811;
    case 32:
      uint64_t v3 = 0x697275636573;
      return v3 & 0xFFFFFFFFFFFFLL | 0x7974000000000000;
    case 33:
      return 0x69666964696D7568;
    case 34:
      return 0x6964696D75686564;
    case 36:
      return 0x5F79616C70726961;
    case 37:
      return 0x76745F656C707061;
    case 38:
      return 0x5F74726F70726961;
    case 39:
      return 0x646F70656D6F68;
    case 40:
      return 0x5F646F70656D6F68;
    case 41:
      return 1684099177;
    case 42:
      return 0x656E6F685069;
    case 43:
      return 0x72656B61657073;
    case 44:
      return 0x69736976656C6574;
    case 45:
      return 0x6974616769727269;
    case 46:
      return 0x654A7265776F6873;
    case 47:
      uint64_t v5 = 2003789939;
LABEL_48:
      unint64_t result = v5 & 0xFFFF0000FFFFFFFFLL | 0x726500000000;
      break;
    case 48:
      unint64_t result = 1802398067;
      break;
    case 49:
      unint64_t result = 0x656C6B6E69727073;
      break;
    case 50:
      unint64_t result = 0xD000000000000012;
      break;
    case 51:
      unint64_t result = 0x706F4D746F626F72;
      break;
    default:
      unint64_t result = 0x6C7562746867696CLL;
      break;
  }
  return result;
}

uint64_t static AccessoryTypeSemantic.< infix(_:_:)(char a1, char a2)
{
  unint64_t v3 = AccessoryTypeSemantic.rawValue.getter(a1);
  uint64_t v5 = v4;
  if (v3 == AccessoryTypeSemantic.rawValue.getter(a2) && v5 == v6) {
    char v8 = 0;
  }
  else {
    char v8 = sub_38150();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

HomeAutomationSiriSuggestions::AccessoryTypeSemantic_optional __swiftcall AccessoryTypeSemantic.init(rawValue:)(Swift::String rawValue)
{
  unint64_t v1 = sub_38160();
  swift_bridgeObjectRelease();
  if (v1 >= 0x34) {
    return (HomeAutomationSiriSuggestions::AccessoryTypeSemantic_optional)52;
  }
  else {
    return (HomeAutomationSiriSuggestions::AccessoryTypeSemantic_optional)v1;
  }
}

_UNKNOWN **static AccessoryTypeSemantic.allCases.getter()
{
  return &off_4A7F0;
}

uint64_t sub_12B14(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1659C(*a1, *a2);
}

Swift::Int sub_12B20()
{
  return sub_13E0C(*v0);
}

uint64_t sub_12B28(uint64_t a1)
{
  return sub_13E7C(a1, *v1);
}

Swift::Int sub_12B30(uint64_t a1)
{
  return sub_140A4(a1, *v1);
}

HomeAutomationSiriSuggestions::AccessoryTypeSemantic_optional sub_12B38@<W0>(Swift::String *a1@<X0>, HomeAutomationSiriSuggestions::AccessoryTypeSemantic_optional *a2@<X8>)
{
  result.value = AccessoryTypeSemantic.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

unint64_t sub_12B68@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = AccessoryTypeSemantic.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_12B94(char *a1, char *a2)
{
  return static AccessoryTypeSemantic.< infix(_:_:)(*a1, *a2);
}

BOOL sub_12BA0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_14170(*a1, *a2);
}

BOOL sub_12BAC(char *a1, char *a2)
{
  return sub_14230(*a1, *a2);
}

uint64_t sub_12BB8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1428C(*a1, *a2);
}

void sub_12BC4(void *a1@<X8>)
{
  *a1 = &off_4A7F0;
}

uint64_t sub_12BD4()
{
  return sub_37ED0();
}

uint64_t sub_12C34()
{
  return sub_37EC0();
}

uint64_t sub_12C84(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_12FCC();
  unint64_t v5 = sub_13018();
  unint64_t v6 = sub_13064();
  return static TerminalNodeBoundedSemanticValue<>.fromIntentNodeValue(_:)(a1, a2, v4, v5, v6);
}

unint64_t sub_12CFC()
{
  unint64_t result = qword_4D1A8;
  if (!qword_4D1A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D1A8);
  }
  return result;
}

unint64_t sub_12D4C()
{
  unint64_t result = qword_4D1B0;
  if (!qword_4D1B0)
  {
    sub_44C4(&qword_4D1B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D1B0);
  }
  return result;
}

unint64_t sub_12DA4()
{
  unint64_t result = qword_4D1C0;
  if (!qword_4D1C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D1C0);
  }
  return result;
}

unint64_t sub_12DF4()
{
  unint64_t result = qword_4D1C8;
  if (!qword_4D1C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D1C8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AccessoryTypeSemantic(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xCD)
  {
    if (a2 + 51 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 51) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 52;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x34;
  int v5 = v6 - 52;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for AccessoryTypeSemantic(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 51 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 51) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xCD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xCC)
  {
    unsigned int v6 = ((a2 - 205) >> 8) + 1;
    *unint64_t result = a2 + 51;
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
        JUMPOUT(0x12F94);
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
          *unint64_t result = a2 + 51;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AccessoryTypeSemantic()
{
  return &type metadata for AccessoryTypeSemantic;
}

unint64_t sub_12FCC()
{
  unint64_t result = qword_4D1D0;
  if (!qword_4D1D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D1D0);
  }
  return result;
}

unint64_t sub_13018()
{
  unint64_t result = qword_4D1D8;
  if (!qword_4D1D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D1D8);
  }
  return result;
}

unint64_t sub_13064()
{
  unint64_t result = qword_4D1E0;
  if (!qword_4D1E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D1E0);
  }
  return result;
}

uint64_t sub_130B0(uint64_t a1, uint64_t a2)
{
  v3[2] = a2;
  v3[3] = v2;
  uint64_t v4 = sub_37D90();
  v3[4] = v4;
  uint64_t v3[5] = *(void *)(v4 - 8);
  v3[6] = swift_task_alloc();
  v3[7] = swift_task_alloc();
  return _swift_task_switch(sub_13180, 0, 0);
}

uint64_t sub_13180()
{
  sub_23A4(*(void **)(v0 + 16), *(void *)(*(void *)(v0 + 16) + 24));
  *(void *)(v0 + 64) = sub_377B0();
  *(void *)(v0 + 72) = v1;
  *(void *)(v0 + 80) = swift_getObjectType();
  uint64_t v3 = sub_37F40();
  return _swift_task_switch(sub_13230, v3, v2);
}

uint64_t sub_13230()
{
  sub_29E40();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  swift_unknownObjectRelease();
  *(void *)(v0 + 88) = v2;
  *(void *)(v0 + 96) = v4;
  return _swift_task_switch(sub_132B8, 0, 0);
}

uint64_t sub_132B8()
{
  uint64_t v25 = v0;
  uint64_t v1 = (void *)v0[12];
  if (v1)
  {
    if (qword_4CD38 != -1) {
      swift_once();
    }
    uint64_t v2 = v0[11];
    uint64_t v3 = v0[7];
    uint64_t v4 = v0[4];
    uint64_t v5 = v0[5];
    uint64_t v6 = v0[3];
    uint64_t v7 = sub_23E8(v4, (uint64_t)static Log.suggestions);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v3, v7, v4);
    sub_38020(27);
    swift_bridgeObjectRelease();
    v24._uint64_t countAndFlagsBits = 0xD000000000000013;
    v24._object = (void *)0x800000000003A880;
    uint64_t v8 = *(void *)(v6 + 16);
    uint64_t v9 = *(void **)(v6 + 24);
    swift_bridgeObjectRetain();
    v27._uint64_t countAndFlagsBits = v8;
    v27._object = v9;
    sub_37E70(v27);
    swift_bridgeObjectRelease();
    v28._uint64_t countAndFlagsBits = 544175136;
    v28._object = (void *)0xE400000000000000;
    sub_37E70(v28);
    v29._uint64_t countAndFlagsBits = v2;
    v29._object = v1;
    sub_37E70(v29);
    v10._uint64_t countAndFlagsBits = 0xD000000000000013;
    v11._object = (void *)0x800000000003D080;
    v10._object = (void *)0x800000000003A880;
    v11._uint64_t countAndFlagsBits = 0xD00000000000007CLL;
    Logger.debug(output:test:caller:)(v10, 0, v11);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
    sub_2420(&qword_4CEF0);
    unint64_t v12 = (_OWORD *)swift_allocObject();
    v12[1] = xmmword_385B0;
    *((void *)v12 + 7) = &type metadata for String;
    *((void *)v12 + 4) = v2;
    *((void *)v12 + 5) = v1;
  }
  else
  {
    if (qword_4CD38 != -1) {
      swift_once();
    }
    uint64_t v14 = v0[5];
    uint64_t v13 = v0[6];
    uint64_t v16 = v0[3];
    uint64_t v15 = v0[4];
    uint64_t v17 = sub_23E8(v15, (uint64_t)static Log.suggestions);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v13, v17, v15);
    sub_38020(16);
    swift_bridgeObjectRelease();
    strcpy((char *)&v24, "Couldn't find ");
    HIBYTE(v24._object) = -18;
    uint64_t v18 = *(void *)(v16 + 16);
    uint64_t v19 = *(void **)(v16 + 24);
    swift_bridgeObjectRetain();
    v30._uint64_t countAndFlagsBits = v18;
    v30._object = v19;
    sub_37E70(v30);
    swift_bridgeObjectRelease();
    v20._uint64_t countAndFlagsBits = 0xD00000000000003FLL;
    v21._object = (void *)0x800000000003D080;
    v20._object = (void *)0x800000000003D100;
    v21._uint64_t countAndFlagsBits = 0xD00000000000007CLL;
    Logger.warning(output:test:file:function:line:)(v24, 0, v21, v20, 19);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
    unint64_t v12 = &_swiftEmptyArrayStorage;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v22 = (uint64_t (*)(_OWORD *))v0[1];
  return v22(v12);
}

uint64_t type metadata accessor for ContainerNameResolver()
{
  return self;
}

uint64_t sub_13624()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_37C30();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for SuggestionParameter.containerName(_:), v2);
  uint64_t v6 = sub_37C20();
  uint64_t v8 = v7;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *(void *)(v1 + 16) = v6;
  *(void *)(v1 + 24) = v8;
  return v1;
}

uint64_t sub_13724(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_21FC;
  return sub_130B0((uint64_t)v4, a2);
}

uint64_t sub_137BC()
{
  return sub_13824((unint64_t *)&unk_4D288);
}

uint64_t sub_137F0()
{
  return sub_13824(&qword_4D298);
}

uint64_t sub_13824(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for ContainerNameResolver();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_13864()
{
  uint64_t v0 = sub_37A80();
  sub_4934(v0, qword_50A00);
  uint64_t v1 = sub_23E8(v0, (uint64_t)qword_50A00);
  uint64_t v2 = enum case for HomeSuggestionType.getStateOfTemperature(_:);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);
  return v3(v1, v2, v0);
}

uint64_t sub_138EC()
{
  uint64_t v0 = sub_37710();
  sub_4934(v0, qword_50A18);
  uint64_t v1 = (void *)sub_23E8(v0, (uint64_t)qword_50A18);
  *uint64_t v1 = sub_293AC();
  v1[1] = v2;
  uint64_t v3 = enum case for DialogDetails.catId(_:);
  uint64_t v4 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);
  return v4(v1, v3, v0);
}

ValueMetadata *type metadata accessor for GetStateOfTemperature()
{
  return &type metadata for GetStateOfTemperature;
}

uint64_t sub_13994@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  *(void *)&long long v23 = a1;
  Swift::String v24 = a2;
  uint64_t v22 = sub_2420(&qword_4D048);
  sub_4EA8();
  uint64_t v21 = v2;
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_37C30();
  sub_4EA8();
  uint64_t v8 = v7;
  __chkstk_darwin(v9);
  Swift::String v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2420(&qword_4D050);
  unint64_t v12 = (int *)type metadata accessor for ResolverParameterProperties();
  unint64_t v13 = (*(unsigned __int8 *)(*((void *)v12 - 1) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*((void *)v12 - 1) + 80);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_385B0;
  unint64_t v15 = v14 + v13;
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v11, enum case for SuggestionParameter.roomName(_:), v6);
  uint64_t v16 = type metadata accessor for RoomNameResolver();
  swift_allocObject();
  uint64_t v17 = sub_1D460();
  uint64_t v18 = (uint64_t *)(v15 + v12[5]);
  v18[3] = v16;
  v18[4] = sub_7B20();
  *uint64_t v18 = v17;
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v15, v11, v6);
  *(unsigned char *)(v15 + v12[6]) = 1;
  *(unsigned char *)(v15 + v12[7]) = 0;
  sub_2420(&qword_4D060);
  sub_375B0();
  sub_4DCC(v23, (uint64_t)&v29);
  LODWORD(v16) = *(unsigned __int8 *)(v15 + v12[7]);
  sub_37800();
  swift_bridgeObjectRetain();
  sub_37C20();
  if (v16 == 1)
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v21 + 16))(v5, v15 + v12[8], v22);
    sub_377E0();
  }
  else
  {
    sub_377F0();
  }
  uint64_t v19 = v31;
  long long v23 = v30;
  sub_23A4(&v29, v30);
  sub_37C20();
  sub_3BB8(v15 + v12[5], (uint64_t)v25);
  long long v27 = v23;
  uint64_t v28 = v19;
  sub_3C6C(v26);
  sub_378A0();
  swift_release();
  swift_bridgeObjectRelease();
  sub_4E30((uint64_t)v25);
  sub_3C1C((uint64_t)v26);
  swift_bridgeObjectRelease();
  sub_4E90(&v29, v24);
  swift_setDeallocating();
  return sub_219FC();
}

Swift::Int sub_13D5C(char a1)
{
  sub_38190();
  sub_13EF0((uint64_t)v3, a1);
  return sub_381B0();
}

Swift::Int sub_13DA4(uint64_t a1)
{
  return sub_13E24(a1, (void (*)(uint64_t))StateSemantic.rawValue.getter);
}

Swift::Int sub_13DBC(__int16 a1)
{
  return sub_381B0();
}

Swift::Int sub_13E0C(uint64_t a1)
{
  return sub_13E24(a1, (void (*)(uint64_t))AccessoryTypeSemantic.rawValue.getter);
}

Swift::Int sub_13E24(uint64_t a1, void (*a2)(uint64_t))
{
  return sub_381B0();
}

uint64_t sub_13E7C(uint64_t a1, uint64_t a2)
{
  return sub_13EAC(a1, a2, (void (*)(uint64_t))AccessoryTypeSemantic.rawValue.getter);
}

uint64_t sub_13E94(uint64_t a1, uint64_t a2)
{
  return sub_13EAC(a1, a2, (void (*)(uint64_t))StateSemantic.rawValue.getter);
}

uint64_t sub_13EAC(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  a3(a2);
  sub_150C0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_13EF0(uint64_t a1, char a2)
{
  switch(a2)
  {
    case 1:
    case 3:
      sub_150E4();
      break;
    default:
      break;
  }
  sub_37E40();
  return swift_bridgeObjectRelease();
}

uint64_t sub_13FBC(uint64_t a1, __int16 a2)
{
  HueSemantic.rawValue.getter(a2);
  sub_150C0();
  return swift_bridgeObjectRelease();
}

Swift::Int sub_13FFC(uint64_t a1, __int16 a2)
{
  return sub_381B0();
}

Swift::Int sub_14048(uint64_t a1, char a2)
{
  sub_38190();
  sub_13EF0((uint64_t)v4, a2);
  return sub_381B0();
}

Swift::Int sub_1408C(uint64_t a1, uint64_t a2)
{
  return sub_140BC(a1, a2, (void (*)(uint64_t))StateSemantic.rawValue.getter);
}

Swift::Int sub_140A4(uint64_t a1, uint64_t a2)
{
  return sub_140BC(a1, a2, (void (*)(uint64_t))AccessoryTypeSemantic.rawValue.getter);
}

Swift::Int sub_140BC(uint64_t a1, uint64_t a2, void (*a3)(uint64_t))
{
  return sub_381B0();
}

BOOL sub_14110(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v2 = sub_150B0(a1, a2);
  char v4 = static UnitSemantic.< infix(_:_:)(v2, v3);
  return sub_150A4(v4);
}

BOOL sub_14130(uint64_t a1, uint64_t a2)
{
  char v2 = sub_150B0(a1, a2);
  char v4 = static StateSemantic.< infix(_:_:)(v2, v3);
  return sub_150A4(v4);
}

BOOL sub_14150(uint64_t a1, uint64_t a2)
{
  __int16 v2 = sub_150B0(a1, a2);
  char v4 = static HueSemantic.< infix(_:_:)(v2, v3);
  return sub_150A4(v4);
}

BOOL sub_14170(uint64_t a1, uint64_t a2)
{
  char v2 = sub_150B0(a1, a2);
  char v4 = static AccessoryTypeSemantic.< infix(_:_:)(v2, v3);
  return sub_150A4(v4);
}

BOOL sub_14190(char a1, char a2)
{
  return (static AttributeSemantic.< infix(_:_:)(a2, a1) & 1) == 0;
}

BOOL sub_141BC(__int16 a1, __int16 a2)
{
  char v2 = static HueSemantic.< infix(_:_:)(a1, a2);
  return sub_150A4(v2);
}

BOOL sub_141D8(unsigned __int8 a1, char a2)
{
  char v2 = static UnitSemantic.< infix(_:_:)(a1, a2);
  return sub_150A4(v2);
}

BOOL sub_141F4(char a1, char a2)
{
  char v2 = static StateSemantic.< infix(_:_:)(a1, a2);
  return sub_150A4(v2);
}

BOOL sub_14210(char a1, char a2)
{
  return (static AttributeSemantic.< infix(_:_:)(a1, a2) & 1) == 0;
}

BOOL sub_14230(char a1, char a2)
{
  char v2 = static AccessoryTypeSemantic.< infix(_:_:)(a1, a2);
  return sub_150A4(v2);
}

uint64_t sub_1424C(uint64_t a1, uint64_t a2)
{
  __int16 v2 = sub_150B0(a1, a2);
  return static HueSemantic.< infix(_:_:)(v2, v3);
}

uint64_t sub_1425C(uint64_t a1, uint64_t a2)
{
  unsigned __int8 v2 = sub_150B0(a1, a2);
  return static UnitSemantic.< infix(_:_:)(v2, v3);
}

uint64_t sub_1426C(uint64_t a1, uint64_t a2)
{
  char v2 = sub_150B0(a1, a2);
  return static StateSemantic.< infix(_:_:)(v2, v3);
}

uint64_t sub_1427C(char a1, char a2)
{
  return static AttributeSemantic.< infix(_:_:)(a2, a1);
}

uint64_t sub_1428C(uint64_t a1, uint64_t a2)
{
  char v2 = sub_150B0(a1, a2);
  return static AccessoryTypeSemantic.< infix(_:_:)(v2, v3);
}

uint64_t AttributeSemantic.rawValue.getter(char a1)
{
  uint64_t result = 0xD000000000000011;
  switch(a1)
  {
    case 1:
      return 0x656E746867697262;
    case 2:
      return 0x6974617275746173;
    case 3:
      uint64_t v3 = 1869377379;
      goto LABEL_62;
    case 4:
      uint64_t v3 = 1702326128;
      goto LABEL_62;
    case 5:
      return result;
    case 6:
      unsigned int v4 = 1769172848;
      goto LABEL_35;
    case 7:
      return 0xD000000000000012;
    case 8:
      unsigned int v4 = 1635020658;
      goto LABEL_35;
    case 9:
      return 0x79746964696D7568;
    case 10:
      return 0x79726574746162;
    case 11:
      uint64_t v5 = 1802464627;
      goto LABEL_42;
    case 12:
      return 0x6D5F6E6F62726163;
    case 13:
      return 0x645F6E6F62726163;
    case 14:
      return 0x746361746E6F63;
    case 15:
      return 0x6E6F69746F6DLL;
    case 16:
      return 0x636E61707563636FLL;
    case 17:
      return 0x746867696CLL;
    case 18:
      return 1801545068;
    case 19:
      uint64_t v5 = 1852138355;
      goto LABEL_42;
    case 20:
      return 0x352E326D70;
    case 21:
      return 808545648;
    case 22:
      return 0xD000000000000011;
    case 23:
      return 0xD000000000000011;
    case 24:
      return 0xD000000000000014;
    case 25:
      return 0xD000000000000016;
    case 26:
      return 0x65645F656E6F7A6FLL;
    case 27:
    case 37:
    case 38:
    case 43:
    case 47:
      return 0xD000000000000010;
    case 28:
      return 0x5F727568706C7573;
    case 29:
      return 0x736E65645F636F76;
    case 30:
      return 0xD000000000000014;
    case 31:
      return 0x64656C62616E65;
    case 32:
      uint64_t v5 = 1934978665;
      goto LABEL_42;
    case 33:
      return 0x4D6D6172676F7270;
    case 34:
      unsigned int v4 = 1634891108;
LABEL_35:
      uint64_t result = v4 | 0x6E6F697400000000;
      break;
    case 35:
      uint64_t result = 0xD000000000000011;
      break;
    case 36:
      uint64_t result = 6649192;
      break;
    case 39:
      uint64_t result = 1801678700;
      break;
    case 40:
      uint64_t result = 0x4C6C6F72746E6F63;
      break;
    case 41:
      uint64_t result = 0xD000000000000013;
      break;
    case 42:
      uint64_t v5 = 1936286066;
LABEL_42:
      uint64_t result = v5 & 0xFFFF0000FFFFFFFFLL | 0x6500000000;
      break;
    case 44:
      uint64_t result = 0xD000000000000011;
      break;
    case 45:
      uint64_t result = 0x646F4D676E697773;
      break;
    case 46:
      uint64_t result = 0xD00000000000001ALL;
      break;
    case 48:
      uint64_t result = 0xD000000000000018;
      break;
    case 49:
      uint64_t result = 0xD000000000000015;
      break;
    case 50:
      uint64_t result = 0xD000000000000012;
      break;
    case 51:
      uint64_t result = 0xD000000000000013;
      break;
    case 52:
      uint64_t result = 0xD000000000000017;
      break;
    case 53:
      uint64_t result = 0xD000000000000012;
      break;
    case 54:
      uint64_t result = 0xD000000000000016;
      break;
    case 55:
      uint64_t result = 0x676E696772616863;
      break;
    case 56:
      uint64_t result = 0x6574746142776F6CLL;
      break;
    case 57:
      uint64_t result = 0x68437265746C6966;
      break;
    case 58:
      uint64_t result = 0x694C7265746C6966;
      break;
    case 59:
      uint64_t result = 0x76654C7265746177;
      break;
    case 60:
      uint64_t result = 0x6146737574617473;
      break;
    case 61:
      uint64_t result = 1701080941;
      break;
    case 62:
      uint64_t v3 = 1702125943;
LABEL_62:
      uint64_t result = v3 & 0xFFFF0000FFFFFFFFLL | 0x7200000000;
      break;
    case 63:
      uint64_t result = 0x6E6964726F636572;
      break;
    case 64:
      uint64_t result = 0xD000000000000012;
      break;
    case 65:
      uint64_t result = 1701670760;
      break;
    default:
      uint64_t result = 0x74617265706D6574;
      break;
  }
  return result;
}

uint64_t static AttributeSemantic.< infix(_:_:)(char a1, char a2)
{
  uint64_t v3 = AttributeSemantic.rawValue.getter(a1);
  uint64_t v5 = v4;
  if (v3 == AttributeSemantic.rawValue.getter(a2) && v5 == v6) {
    char v8 = 0;
  }
  else {
    char v8 = sub_38150();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

HomeAutomationSiriSuggestions::AttributeSemantic_optional __swiftcall AttributeSemantic.init(rawValue:)(Swift::String rawValue)
{
  unint64_t v1 = sub_38160();
  swift_bridgeObjectRelease();
  if (v1 >= 0x42) {
    return (HomeAutomationSiriSuggestions::AttributeSemantic_optional)66;
  }
  else {
    return (HomeAutomationSiriSuggestions::AttributeSemantic_optional)v1;
  }
}

_UNKNOWN **static AttributeSemantic.allCases.getter()
{
  return &off_4AE98;
}

Swift::Int sub_14A6C()
{
  return sub_13E24(*v0, (void (*)(uint64_t))AttributeSemantic.rawValue.getter);
}

uint64_t sub_14A9C(uint64_t a1)
{
  return sub_13EAC(a1, *v1, (void (*)(uint64_t))AttributeSemantic.rawValue.getter);
}

Swift::Int sub_14ACC(uint64_t a1)
{
  return sub_140BC(a1, *v1, (void (*)(uint64_t))AttributeSemantic.rawValue.getter);
}

HomeAutomationSiriSuggestions::AttributeSemantic_optional sub_14AFC@<W0>(Swift::String *a1@<X0>, HomeAutomationSiriSuggestions::AttributeSemantic_optional *a2@<X8>)
{
  result.value = AttributeSemantic.init(rawValue:)(*a1).value;
  a2->value = result.value;
  return result;
}

uint64_t sub_14B2C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = AttributeSemantic.rawValue.getter(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_14B58(char *a1, char *a2)
{
  return static AttributeSemantic.< infix(_:_:)(*a1, *a2);
}

BOOL sub_14B64(char *a1, char *a2)
{
  return sub_14190(*a1, *a2);
}

BOOL sub_14B70(char *a1, char *a2)
{
  return sub_14210(*a1, *a2);
}

uint64_t sub_14B7C(char *a1, char *a2)
{
  return sub_1427C(*a1, *a2);
}

void sub_14B88(void *a1@<X8>)
{
  *a1 = &off_4AE98;
}

uint64_t sub_14B98()
{
  return sub_37ED0();
}

uint64_t sub_14BF8()
{
  return sub_37EC0();
}

uint64_t sub_14C48(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_165B4(*a1, *a2);
}

uint64_t sub_14C54(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = sub_14F9C();
  unint64_t v5 = sub_14FE8();
  unint64_t v6 = sub_15034();
  return static TerminalNodeBoundedSemanticValue<>.fromIntentNodeValue(_:)(a1, a2, v4, v5, v6);
}

unint64_t sub_14CCC()
{
  unint64_t result = qword_4D2A8;
  if (!qword_4D2A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D2A8);
  }
  return result;
}

unint64_t sub_14D1C()
{
  unint64_t result = qword_4D2B0;
  if (!qword_4D2B0)
  {
    sub_44C4(&qword_4D2B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D2B0);
  }
  return result;
}

unint64_t sub_14D74()
{
  unint64_t result = qword_4D2C0;
  if (!qword_4D2C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D2C0);
  }
  return result;
}

unint64_t sub_14DC4()
{
  unint64_t result = qword_4D2C8;
  if (!qword_4D2C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D2C8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for AttributeSemantic(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2)
  {
    int v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xBF)
  {
    if (a2 + 65 >= 0xFFFF00) {
      int v2 = 4;
    }
    else {
      int v2 = 2;
    }
    if ((a2 + 65) >> 8 < 0xFF) {
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
    int v5 = (*a1 | (v4 << 8)) - 66;
    return (v5 + 1);
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0x42;
  int v5 = v6 - 66;
  if (!v7) {
    int v5 = -1;
  }
  return (v5 + 1);
}

unsigned char *storeEnumTagSinglePayload for AttributeSemantic(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 65 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 65) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xBF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xBE)
  {
    unsigned int v6 = ((a2 - 191) >> 8) + 1;
    *unint64_t result = a2 + 65;
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
        JUMPOUT(0x14F64);
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
          *unint64_t result = a2 + 65;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AttributeSemantic()
{
  return &type metadata for AttributeSemantic;
}

unint64_t sub_14F9C()
{
  unint64_t result = qword_4D2D0;
  if (!qword_4D2D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D2D0);
  }
  return result;
}

unint64_t sub_14FE8()
{
  unint64_t result = qword_4D2D8;
  if (!qword_4D2D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D2D8);
  }
  return result;
}

unint64_t sub_15034()
{
  unint64_t result = qword_4D2E0;
  if (!qword_4D2E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D2E0);
  }
  return result;
}

uint64_t sub_15080()
{
  return sub_37E40();
}

BOOL sub_150A4(char a1)
{
  return (a1 & 1) == 0;
}

uint64_t sub_150B0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_150C0()
{
  return sub_37E40();
}

uint64_t sub_150F8()
{
  uint64_t v0 = sub_37A80();
  sub_4934(v0, qword_50A30);
  uint64_t v1 = sub_23E8(v0, (uint64_t)qword_50A30);
  uint64_t v2 = enum case for HomeSuggestionType.setBrightness(_:);
  int v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);
  return v3(v1, v2, v0);
}

uint64_t sub_15180()
{
  uint64_t v0 = sub_37710();
  sub_4934(v0, qword_50A48);
  uint64_t v1 = (void *)sub_23E8(v0, (uint64_t)qword_50A48);
  *uint64_t v1 = &unk_4D2E8;
  v1[1] = 0;
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104);
  return v2();
}

uint64_t sub_1521C(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_152BC;
  return sub_1538C(a1, a2);
}

uint64_t sub_152BC()
{
  sub_11820();
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_1538C(uint64_t a1, uint64_t a2)
{
  v2[24] = a1;
  v2[25] = a2;
  sub_2420(&qword_4D188);
  v2[26] = swift_task_alloc();
  v2[27] = swift_task_alloc();
  sub_37630();
  v2[28] = swift_task_alloc();
  sub_2420(&qword_4D118);
  v2[29] = swift_task_alloc();
  uint64_t v3 = sub_37590();
  v2[30] = v3;
  v2[31] = *(void *)(v3 - 8);
  v2[32] = swift_task_alloc();
  return _swift_task_switch(sub_154E8, 0, 0);
}

uint64_t sub_154E8()
{
  uint64_t v1 = *(void **)(v0 + 200);
  sub_23A4(v1, v1[3]);
  uint64_t v2 = sub_37780();
  sub_16928(0x656D614E6D6F6F72, 0xE800000000000000, v2, (_OWORD *)(v0 + 16));
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 40))
  {
    if (swift_dynamicCast()) {
      uint64_t v3 = *(void *)(v0 + 152);
    }
    else {
      uint64_t v3 = 0;
    }
  }
  else
  {
    sub_3D60(v0 + 16, &qword_4D060);
    uint64_t v3 = 0;
  }
  uint64_t v4 = sub_37780();
  sub_16928(0x7475626972747461, 0xE900000000000065, v4, (_OWORD *)(v0 + 48));
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 72))
  {
    if (swift_dynamicCast()) {
      uint64_t v5 = *(void *)(v0 + 168);
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    sub_3D60(v0 + 48, &qword_4D060);
    uint64_t v5 = 0;
  }
  uint64_t v6 = sub_37780();
  sub_16928(0x65756C6176, 0xE500000000000000, v6, (_OWORD *)(v0 + 80));
  swift_bridgeObjectRelease();
  if (!*(void *)(v0 + 104))
  {
    sub_3D60(v0 + 80, &qword_4D060);
LABEL_18:
    uint64_t v7 = 0;
    *(_OWORD *)(v0 + 112) = 0u;
    *(_OWORD *)(v0 + 128) = 0u;
    goto LABEL_19;
  }
  sub_37B50();
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_18;
  }
  uint64_t v7 = *(void *)(v0 + 176);
  sub_23A4(*(void **)(v0 + 200), v1[3]);
  swift_retain();
  sub_37790();
  sub_37AF0();
  swift_release();
  if (!v7) {
    goto LABEL_18;
  }
  swift_retain();
  sub_37AE0();
  swift_release();
  if (!*(void *)(v0 + 136))
  {
LABEL_19:
    sub_3D60(v0 + 112, &qword_4D060);
    goto LABEL_20;
  }
  sub_37B80();
  if (swift_dynamicCast())
  {
    uint64_t v8 = *(void *)(v0 + 184);
    sub_23A4(*(void **)(v0 + 200), v1[3]);
    swift_retain();
    sub_37790();
    sub_37B60();
    swift_release();
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v8 = 0;
LABEL_21:
  *(void *)(v0 + 264) = v7;
  *(void *)(v0 + 272) = v8;
  if (qword_4CD68 != -1) {
    swift_once();
  }
  uint64_t v10 = *(void *)(v0 + 224);
  uint64_t v9 = *(void *)(v0 + 232);
  Swift::String v11 = *(void **)(v0 + 200);
  sub_37570();
  sub_23A4(v11, v1[3]);
  sub_37790();
  sub_37620();
  type metadata accessor for HomeSuggestionCATs();
  swift_allocObject();
  *(void *)(v0 + 280) = HomeSuggestionCATs.init(templateDir:options:globals:)(v9, v10);
  if (v3)
  {
    sub_37E20();
    swift_bridgeObjectRelease();
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = 1;
  }
  uint64_t v13 = *(void *)(v0 + 216);
  uint64_t v14 = sub_37610();
  uint64_t v15 = 1;
  sub_3D38(v13, v12, 1, v14);
  if (v5)
  {
    sub_37E20();
    swift_bridgeObjectRelease();
    uint64_t v15 = 0;
  }
  sub_3D38(*(void *)(v0 + 208), v15, 1, v14);
  uint64_t v16 = (void *)swift_task_alloc();
  *(void *)(v0 + 288) = v16;
  *uint64_t v16 = v0;
  v16[1] = sub_159A0;
  return sub_10B44();
}

uint64_t sub_159A0()
{
  sub_11820();
  uint64_t v2 = *(void *)(v1 + 216);
  uint64_t v3 = *(void *)(v1 + 208);
  *(void *)(v4 + 296) = v0;
  swift_task_dealloc();
  swift_release();
  sub_3D60(v3, &qword_4D188);
  sub_3D60(v2, &qword_4D188);
  if (v0) {
    uint64_t v5 = sub_15BE8;
  }
  else {
    uint64_t v5 = sub_15AFC;
  }
  return _swift_task_switch(v5, 0, 0);
}

uint64_t sub_15AFC()
{
  uint64_t v2 = v0[31];
  uint64_t v1 = v0[32];
  uint64_t v3 = v0[30];
  uint64_t v4 = (uint64_t *)v0[24];
  v4[3] = v3;
  uint64_t v5 = sub_3C6C(v4);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v2 + 32))(v5, v1, v3);
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v6 = (uint64_t (*)(void))v0[1];
  return v6();
}

uint64_t sub_15BE8()
{
  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_15C98@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 24);
  long long v11 = *(_OWORD *)(a1 + 32);
  sub_23A4((void *)a1, v3);
  if (qword_4CCE0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_37A80();
  sub_23E8(v4, (uint64_t)qword_50A30);
  uint64_t v5 = sub_37A70();
  uint64_t v7 = v6;
  uint64_t v8 = type metadata accessor for HomeAutomationCandidateSuggestionConfigurator();
  swift_allocObject();
  uint64_t v9 = sub_16A14(v5, v7);
  v12[3] = v8;
  v12[4] = sub_123C8(&qword_4D0C8, (void (*)(uint64_t))type metadata accessor for HomeAutomationCandidateSuggestionConfigurator);
  v12[0] = v9;
  *(void *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = v11;
  sub_3C6C((uint64_t *)a2);
  sub_37640();
  return sub_3C1C((uint64_t)v12);
}

uint64_t sub_15DE4@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v44 = a1;
  uint64_t v45 = a2;
  uint64_t v47 = sub_2420(&qword_4D048);
  sub_4EA8();
  uint64_t v46 = v2;
  __chkstk_darwin(v3);
  v51.n128_u64[0] = (unint64_t)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_37C30();
  sub_4EA8();
  uint64_t v7 = v6;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2420(&qword_4D050);
  long long v11 = (int *)type metadata accessor for ResolverParameterProperties();
  unint64_t v12 = (*(unsigned __int8 *)(*((void *)v11 - 1) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*((void *)v11 - 1) + 80);
  uint64_t v40 = *(void *)(*((void *)v11 - 1) + 72);
  uint64_t v13 = v40;
  uint64_t v14 = swift_allocObject();
  uint64_t v52 = v14;
  *(_OWORD *)(v14 + 16) = xmmword_38BF0;
  unint64_t v15 = v14 + v12;
  unint64_t v43 = *(void (**)(char *, void, uint64_t))(v7 + 104);
  v43(v10, enum case for SuggestionParameter.roomName(_:), v5);
  uint64_t v16 = type metadata accessor for RoomNameResolver();
  swift_allocObject();
  uint64_t v17 = sub_1D460();
  uint64_t v18 = (uint64_t *)(v15 + v11[5]);
  v18[3] = v16;
  v18[4] = sub_123C8((unint64_t *)&qword_4D0B0, (void (*)(uint64_t))type metadata accessor for RoomNameResolver);
  *uint64_t v18 = v17;
  uint64_t v19 = *(void (**)(unint64_t, char *, uint64_t))(v7 + 32);
  uint64_t v41 = v7 + 32;
  uint64_t v42 = v19;
  v19(v15, v10, v5);
  *(unsigned char *)(v15 + v11[6]) = 1;
  *(unsigned char *)(v15 + v11[7]) = 0;
  uint64_t v50 = sub_2420(&qword_4D060);
  v49.n128_u64[0] = (unint64_t)&type metadata for Any + 8;
  uint64_t v48 = sub_36818;
  sub_375B0();
  unint64_t v20 = v15 + v13;
  uint64_t v21 = v43;
  v43(v10, enum case for SuggestionParameter.attribute(_:), v5);
  uint64_t v22 = type metadata accessor for AttributeResolver();
  swift_allocObject();
  long long v23 = sub_2C5BC();
  Swift::String v24 = (void *)(v15 + v13 + v11[5]);
  v24[3] = v22;
  v24[4] = sub_123C8(&qword_4D198, (void (*)(uint64_t))type metadata accessor for AttributeResolver);
  *Swift::String v24 = v23;
  long long v39 = v10;
  uint64_t v25 = v5;
  uint64_t v38 = v5;
  uint64_t v26 = v5;
  long long v27 = v42;
  v42(v20, v10, v26);
  *(unsigned char *)(v20 + v11[6]) = 1;
  *(unsigned char *)(v20 + v11[7]) = 0;
  sub_706C();
  unint64_t v28 = v15 + 2 * v40;
  v21(v10, enum case for SuggestionParameter.value(_:), v25);
  uint64_t v29 = type metadata accessor for ValueResolver();
  swift_allocObject();
  long long v30 = sub_27BD0();
  uint64_t v31 = (void *)(v28 + v11[5]);
  v31[3] = v29;
  v31[4] = sub_123C8(&qword_4D1A0, (void (*)(uint64_t))type metadata accessor for ValueResolver);
  *uint64_t v31 = v30;
  v27(v28, v39, v38);
  *(unsigned char *)(v28 + v11[6]) = 0;
  *(unsigned char *)(v28 + v11[7]) = 0;
  sub_706C();
  sub_4DCC(v44, (uint64_t)&v55);
  LODWORD(v10) = *(unsigned __int8 *)(v15 + v11[7]);
  uint64_t v32 = sub_37800();
  swift_bridgeObjectRetain();
  sub_37C20();
  sub_7108();
  uint64_t v50 = v32;
  if (v10 == 1)
  {
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v46 + 16))(v51.n128_u64[0], v15 + v11[8], v47);
    sub_377E0();
  }
  else
  {
    sub_377F0();
  }
  __n128 v49 = v56;
  sub_70C0(v56.n128_f64[0]);
  sub_37C20();
  sub_3BB8(v15 + v11[5], (uint64_t)v53);
  sub_7118(v49);
  sub_703C();
  swift_release();
  swift_bridgeObjectRelease();
  sub_3D60((uint64_t)v53, &qword_4D068);
  sub_3C1C((uint64_t)v54);
  char v33 = *(unsigned char *)(v20 + v11[7]);
  sub_37C20();
  sub_7108();
  if (v33)
  {
    uint64_t v34 = v47;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v46 + 16))(v51.n128_u64[0], v20 + v11[8], v47);
    sub_7098();
  }
  else
  {
    sub_70E4();
    uint64_t v34 = v47;
  }
  __n128 v49 = v56;
  sub_70C0(v56.n128_f64[0]);
  sub_37C20();
  sub_3BB8(v20 + v11[5], (uint64_t)v53);
  sub_7118(v49);
  sub_703C();
  swift_release();
  swift_bridgeObjectRelease();
  sub_3D60((uint64_t)v53, &qword_4D068);
  sub_3C1C((uint64_t)v54);
  char v35 = *(unsigned char *)(v28 + v11[7]);
  sub_37C20();
  sub_7108();
  if (v35)
  {
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v46 + 16))(v51.n128_u64[0], v28 + v11[8], v34);
    sub_7098();
  }
  else
  {
    sub_70E4();
  }
  __n128 v51 = v56;
  sub_70C0(v56.n128_f64[0]);
  sub_37C20();
  sub_3BB8(v28 + v11[5], (uint64_t)v53);
  sub_7118(v51);
  sub_378A0();
  swift_release();
  swift_bridgeObjectRelease();
  sub_3D60((uint64_t)v53, &qword_4D068);
  sub_3C1C((uint64_t)v54);
  swift_bridgeObjectRelease();
  sub_4E90(&v55, v45);
  swift_setDeallocating();
  return sub_219FC();
}

ValueMetadata *type metadata accessor for SetBrightnessSuggestion()
{
  return &type metadata for SetBrightnessSuggestion;
}

uint64_t sub_1659C(uint64_t a1, uint64_t a2)
{
  return sub_165E4(a1, a2, (uint64_t (*)(void))AccessoryTypeSemantic.rawValue.getter);
}

uint64_t sub_165B4(uint64_t a1, uint64_t a2)
{
  return sub_165E4(a1, a2, (uint64_t (*)(void))AttributeSemantic.rawValue.getter);
}

uint64_t sub_165CC(uint64_t a1, uint64_t a2)
{
  return sub_165E4(a1, a2, (uint64_t (*)(void))StateSemantic.rawValue.getter);
}

uint64_t sub_165E4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3();
  uint64_t v7 = v6;
  if (v5 == ((uint64_t (*)(uint64_t))a3)(a2) && v7 == v8) {
    char v10 = 1;
  }
  else {
    char v10 = sub_1C258();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10 & 1;
}

uint64_t sub_16660(unsigned __int8 a1, char a2)
{
  uint64_t v2 = 0xD000000000000011;
  unint64_t v3 = (unint64_t)"percent";
  unint64_t v4 = 0x8000000000039DF0;
  uint64_t v5 = a1;
  uint64_t v6 = 0xD000000000000011;
  switch(v5)
  {
    case 1:
      unint64_t v4 = 0x737569736C65;
      uint64_t v6 = sub_47EC() & 0xFFFFFFFFFFFFLL | 0x4373000000000000;
      break;
    case 2:
      break;
    case 3:
      unint64_t v4 = 0x636972656E65;
      uint64_t v6 = sub_47EC() & 0xFFFFFFFFFFFFLL | 0x4773000000000000;
      break;
    default:
      unint64_t v4 = 0xE700000000000000;
      uint64_t v6 = 0x746E6563726570;
      break;
  }
  unint64_t v7 = v3 | 0x8000000000000000;
  switch(a2)
  {
    case 1:
      unint64_t v7 = 0x737569736C65;
      sub_4800();
      uint64_t v2 = v8 & 0xFFFFFFFFFFFFLL | 0x4373000000000000;
      break;
    case 2:
      break;
    case 3:
      unint64_t v7 = 0x636972656E65;
      sub_4800();
      uint64_t v2 = v9 & 0xFFFFFFFFFFFFLL | 0x4773000000000000;
      break;
    default:
      unint64_t v7 = 0xE700000000000000;
      uint64_t v2 = 0x746E6563726570;
      break;
  }
  if (v6 == v2 && v4 == v7) {
    char v11 = 1;
  }
  else {
    char v11 = sub_38150();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v11 & 1;
}

uint64_t sub_167D4(__int16 a1, __int16 a2)
{
  HueSemantic.rawValue.getter(a1);
  uint64_t v4 = v3;
  uint64_t v6 = v5;
  HueSemantic.rawValue.getter(a2);
  if (v4 == v8 && v6 == v7) {
    char v10 = 1;
  }
  else {
    char v10 = sub_1C258();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10 & 1;
}

uint64_t sub_16844()
{
  sub_37A80();
  sub_1BC0C(&qword_4D400, (void (*)(uint64_t))&type metadata accessor for HomeSuggestionType);
  sub_37EB0();
  sub_37EB0();
  if (v5 == v3 && v6 == v4) {
    char v1 = 1;
  }
  else {
    char v1 = sub_38150();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1 & 1;
}

double sub_16928@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _OWORD *a4@<X8>)
{
  if (*(void *)(a3 + 16) && (unint64_t v6 = sub_1A978(a1, a2), (v7 & 1) != 0))
  {
    uint64_t v8 = *(void *)(a3 + 56) + 32 * v6;
    sub_1BC54(v8, (uint64_t)a4);
  }
  else
  {
    double result = 0.0;
    *a4 = 0u;
    a4[1] = 0u;
  }
  return result;
}

uint64_t sub_1698C(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 16) && (sub_1A9F0(a1), (v2 & 1) != 0)) {
    return swift_bridgeObjectRetain();
  }
  else {
    return 0;
  }
}

uint64_t sub_169D0(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a2 + 16) && (sub_1AA60(a1), (v2 & 1) != 0)) {
    return swift_bridgeObjectRetain();
  }
  else {
    return 0;
  }
}

void *sub_16A14(uint64_t a1, uint64_t a2)
{
  sub_2420(&qword_4D430);
  uint64_t v2 = sub_2420(&qword_4D438);
  uint64_t v3 = sub_1BD50(v2);
  uint64_t v5 = *(void *)(v4 + 72);
  uint64_t v6 = v3;
  unint64_t v8 = (*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v105 = swift_allocObject();
  *(_OWORD *)(v105 + 16) = xmmword_393D0;
  uint64_t v9 = v105 + v8;
  uint64_t v10 = *(int *)(v6 + 56);
  uint64_t v11 = enum case for HomeSuggestionType.createAutomation(_:);
  uint64_t v131 = sub_37A80();
  uint64_t v12 = *(void *)(v131 - 8);
  uint64_t v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 104);
  uint64_t v88 = v12 + 104;
  v13(v9, v11, v131);
  uint64_t v14 = sub_2420(&qword_4D440);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_385B0;
  *(void *)(inited + 32) = 1;
  *(void *)(inited + 40) = &_swiftEmptyArrayStorage;
  uint64_t v16 = sub_2420(&qword_4D448);
  unint64_t v17 = sub_1BD00();
  *(void *)(v9 + v10) = sub_37DC0();
  uint64_t v97 = *(int *)(v6 + 56);
  uint64_t v18 = v131;
  v13(v9 + v5, enum case for HomeSuggestionType.getStateSmokeSensor(_:), v131);
  uint64_t v19 = (__n128 *)swift_initStackObject();
  sub_1C44C(v19, v20, v21, v22, v23, v24, v25, v26, v81, v85, v88, v92, v97, v103, v105, a1, v114, a2, v124,
    v127,
    v131,
    v135,
    v6,
    (uint64_t)v13,
    v27);
  *(void *)(v28 + 32) = 20;
  *(void *)(v28 + 40) = &off_498F8;
  *(void *)(v9 + v5 + v98) = sub_37DC0();
  uint64_t v93 = *(int *)(v6 + 56);
  v13(v9 + 2 * v5, enum case for HomeSuggestionType.openCloseSecureAccessories(_:), v18);
  uint64_t v29 = swift_initStackObject();
  *(_OWORD *)(v29 + 16) = xmmword_393E0;
  *(void *)(v29 + 32) = 4;
  *(void *)(v29 + 40) = &off_49920;
  *(void *)(v29 + 48) = 27;
  *(void *)(v29 + 56) = &off_49948;
  *(void *)(v29 + 64) = 28;
  *(void *)(v29 + 72) = &off_49970;
  *(void *)(v29 + 80) = 7;
  *(void *)(v29 + 88) = &off_49998;
  *(void *)(v29 + 96) = 22;
  *(void *)(v29 + 104) = &off_499C0;
  *(void *)(v29 + 112) = 13;
  *(void *)(v29 + 120) = &off_499E8;
  *(void *)(v9 + 2 * v5 + v93) = sub_37DC0();
  uint64_t v82 = v9;
  uint64_t v30 = v138;
  uint64_t v94 = *(int *)(v138 + 56);
  uint64_t v31 = sub_1C1FC();
  v141(v31);
  uint64_t v32 = swift_initStackObject();
  *(_OWORD *)(v32 + 16) = xmmword_393E0;
  *(void *)(v32 + 32) = 1;
  *(void *)(v32 + 40) = &off_49A10;
  *(void *)(v32 + 48) = 6;
  *(void *)(v32 + 56) = &off_49A38;
  *(void *)(v32 + 64) = 2;
  *(void *)(v32 + 72) = &off_49A60;
  *(void *)(v32 + 80) = 41;
  *(void *)(v32 + 88) = &off_49A88;
  *(void *)(v32 + 96) = 36;
  *(void *)(v32 + 104) = &off_49AB0;
  *(void *)(v32 + 112) = 3;
  *(void *)(v32 + 120) = &off_49AD8;
  *(void *)(v9 + 3 * v5 + v94) = sub_37DC0();
  uint64_t v33 = v9 + 4 * v5;
  uint64_t v99 = *(int *)(v138 + 56);
  uint64_t v34 = sub_1C1FC();
  v141(v34);
  char v35 = v141;
  long long v36 = (__n128 *)swift_initStackObject();
  sub_1C44C(v36, v37, v38, v39, v40, v41, v42, v43, v82, v17, v89, v94, v99, 12, v106, v110, v115, v120, v16,
    v5,
    v132,
    v14,
    v138,
    (uint64_t)v141,
    v44);
  *(void *)(v45 + 32) = 1;
  *(void *)(v45 + 40) = &off_49B00;
  *(void *)(v33 + v100) = sub_37DC0();
  uint64_t v46 = *(int *)(v30 + 56);
  uint64_t v47 = sub_1C1FC();
  v35(v47);
  uint64_t v48 = swift_initStackObject();
  *(_OWORD *)(v48 + 16) = xmmword_38BB0;
  *(void *)(v48 + 32) = 3;
  *(void *)(v48 + 40) = &off_49B28;
  *(void *)(v48 + 48) = 29;
  *(void *)(v48 + 56) = &off_49B50;
  *(void *)(v83 + 5 * v5 + v46) = sub_37DC0();
  uint64_t v49 = v83;
  uint64_t v50 = v128;
  uint64_t v51 = v83 + 6 * v128;
  uint64_t v52 = *(int *)(v30 + 56);
  uint64_t v53 = v133;
  v54 = v142;
  v142(v51, enum case for HomeSuggestionType.setColor(_:), v133);
  long long v55 = (__n128 *)swift_initStackObject();
  sub_1C44C(v55, v56, v57, v58, v59, v60, v61, v62, v83, v86, v90, v95, 2, 4, v107, v111, v116, v121, v125,
    v128,
    v133,
    v136,
    v139,
    (uint64_t)v142,
    v63);
  *(void *)(v64 + 32) = 1;
  *(void *)(v64 + 40) = &off_49B78;
  *(void *)(v51 + v52) = sub_37DC0();
  uint64_t v65 = v140;
  uint64_t v66 = *(int *)(v140 + 56);
  v54(v49 + 7 * v50, enum case for HomeSuggestionType.setFanSpeed(_:), v53);
  Swift::String v67 = (__n128 *)swift_initStackObject();
  sub_1C44C(v67, v68, v69, v70, v71, v72, v73, v74, v84, v87, v91, v96, v101, v104, v108, v112, v117, v122, v126,
    v129,
    v134,
    v137,
    v140,
    v143,
    v75);
  *(void *)(v76 + 32) = 5;
  *(void *)(v76 + 40) = &off_49BA0;
  *(void *)(v49 + 7 * v50 + v66) = sub_37DC0();
  uint64_t v77 = *(int *)(v65 + 56);
  v54(v49 + 8 * v130, enum case for HomeSuggestionType.setTemperature(_:), v53);
  uint64_t v78 = swift_initStackObject();
  *(_OWORD *)(v78 + 16) = v102;
  *(void *)(v78 + 32) = 29;
  *(void *)(v78 + 40) = &off_49BC8;
  *(void *)(v78 + 48) = 3;
  *(void *)(v78 + 56) = &off_49BF0;
  *(void *)(v49 + 8 * v130 + v77) = sub_37DC0();
  sub_2420(&qword_4D458);
  sub_1BC0C(&qword_4D3D8, (void (*)(uint64_t))&type metadata accessor for HomeSuggestionType);
  uint64_t v79 = sub_37DC0();
  v118[2] = v113;
  v118[3] = v123;
  v118[4] = v79;
  return v118;
}

uint64_t sub_17070()
{
  sub_11914();
  v1[20] = v2;
  v1[21] = v0;
  uint64_t v3 = sub_37D90();
  v1[22] = v3;
  sub_1BD50(v3);
  v1[23] = v4;
  v1[24] = sub_1C354();
  sub_2420(&qword_4D3F0);
  v1[25] = sub_1C354();
  sub_2420(&qword_4D3B8);
  v1[26] = sub_1C354();
  uint64_t v5 = sub_37A80();
  v1[27] = v5;
  sub_1BD50(v5);
  v1[28] = v6;
  v1[29] = sub_11974();
  v1[30] = swift_task_alloc();
  uint64_t v7 = sub_37D70();
  v1[31] = v7;
  sub_1BD50(v7);
  v1[32] = v8;
  v1[33] = sub_1C354();
  sub_11920();
  return _swift_task_switch(v9, v10, v11);
}

uint64_t sub_171B8()
{
  if (qword_4CD48 != -1) {
    swift_once();
  }
  uint64_t v2 = v0[26];
  uint64_t v1 = v0[27];
  uint64_t v3 = v0[21];
  sub_37D10();
  sub_37D20();
  uint64_t v4 = *(void *)(v3 + 16);
  v0[34] = v4;
  uint64_t v5 = *(void **)(v3 + 24);
  v0[35] = v5;
  swift_bridgeObjectRetain();
  sub_37A60();
  if (sub_3DBC(v2, 1, v1) == 1)
  {
    sub_3D60(v0[26], &qword_4D3B8);
    if (qword_4CD38 != -1) {
      swift_once();
    }
    uint64_t v7 = v0[24];
    uint64_t v6 = v0[25];
    uint64_t v8 = v0[22];
    uint64_t v9 = v0[23];
    sub_23E8(v8, (uint64_t)static Log.suggestions);
    sub_1C09C();
    v10();
    sub_1C2AC();
    sub_38020(58);
    v49._uint64_t countAndFlagsBits = 0xD000000000000038;
    v49._object = (void *)0x800000000003D4D0;
    sub_37E70(v49);
    swift_bridgeObjectRetain();
    v50._uint64_t countAndFlagsBits = v4;
    v50._object = v5;
    sub_37E70(v50);
    swift_bridgeObjectRelease();
    sub_1C178();
    Logger.warning(output:test:file:function:line:)(v11, v12, v13, v14, 72);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
    sub_37D10();
    uint64_t v15 = sub_37D30();
    sub_1C12C(v15);
    goto LABEL_21;
  }
  uint64_t v6 = v0[29];
  uint64_t v16 = v0[27];
  uint64_t v17 = v0[28];
  (*(void (**)(void, void, uint64_t))(v17 + 32))(v0[30], v0[26], v16);
  uint64_t v18 = *(void (**)(uint64_t, void, uint64_t))(v17 + 104);
  v18(v6, enum case for HomeSuggestionType.setScene(_:), v16);
  char v19 = sub_16844();
  uint64_t v20 = *(void (**)(void))(v17 + 8);
  v0[36] = v20;
  v0[37] = (v17 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  sub_1C36C();
  v20();
  if (v19)
  {
    if (qword_4CD38 != -1) {
      swift_once();
    }
    uint64_t v21 = sub_1C458();
    sub_23E8(v21, (uint64_t)static Log.suggestions);
    sub_1C4AC();
    sub_1C178();
    Logger.debug(output:test:caller:)(v22, v23, v24);
    sub_1C36C();
    v20();
    sub_37D10();
    uint64_t v25 = sub_1BF9C();
    sub_1C12C(v25);
    goto LABEL_21;
  }
  uint64_t v26 = *(void *)(v0[21] + 32);
  uint64_t v27 = sub_169D0(v0[30], v26);
  v0[38] = v27;
  if (!v27)
  {
LABEL_18:
    if (qword_4CD38 != -1) {
      swift_once();
    }
    uint64_t v35 = sub_1C458();
    sub_23E8(v35, (uint64_t)static Log.suggestions);
    sub_1C2AC();
    sub_38020(53);
    v0[14] = v47;
    v0[15] = v48;
    sub_1C4AC();
    sub_37E70(v51);
    sub_380B0();
    sub_1C3AC();
    sub_1C178();
    Logger.warning(output:test:file:function:line:)(v36, v37, v38, v39, 82);
    swift_bridgeObjectRelease();
    sub_1C36C();
    v20();
    sub_37D10();
    uint64_t v40 = sub_1BF9C();
    sub_1C12C(v40);
LABEL_21:
    sub_37CF0();
    sub_3D60(v6, &qword_4D3F0);
    uint64_t v41 = sub_1BD68();
    v42(v41);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_1C210();
    sub_1BF08();
    __asm { BRAA            X1, X16 }
  }
  uint64_t v6 = v27;
  if (!*(void *)(v26 + 16))
  {
    swift_bridgeObjectRelease();
    goto LABEL_18;
  }
  uint64_t v28 = v0[29];
  uint64_t v29 = v0[27];
  v18(v28, enum case for HomeSuggestionType.createAutomation(_:), v29);
  char v30 = sub_16844();
  ((void (*)(uint64_t, uint64_t))v20)(v28, v29);
  type metadata accessor for SuggestionEntityRetrieval();
  if (v30)
  {
    v0[39] = swift_initStackObject();
    swift_bridgeObjectRetain();
    v0[40] = sub_2F6AC(v4, v5);
    uint64_t v31 = swift_bridgeObjectRetain();
    v0[41] = sub_1B1F8(v31);
    swift_bridgeObjectRelease();
    uint64_t v32 = (void *)swift_task_alloc();
    v0[42] = v32;
    *uint64_t v32 = v0;
    v32[1] = sub_178A0;
    sub_1BF08();
    return sub_2FB44();
  }
  else
  {
    v0[44] = swift_initStackObject();
    swift_bridgeObjectRetain();
    v0[45] = sub_2F6AC(v4, v5);
    uint64_t v45 = (void *)swift_task_alloc();
    v0[46] = v45;
    *uint64_t v45 = v0;
    v45[1] = sub_17CF4;
    sub_1BF08();
    return sub_2FDE0();
  }
}

uint64_t sub_178A0()
{
  sub_11914();
  sub_11820();
  sub_1C39C();
  *uint64_t v2 = v1;
  uint64_t v3 = *v0;
  sub_1C0A8();
  *uint64_t v4 = v3;
  *(void *)(v6 + 344) = v5;
  swift_task_dealloc();
  swift_release();
  swift_release();
  sub_11920();
  return _swift_task_switch(v7, v8, v9);
}

uint64_t sub_179A0()
{
  uint64_t v7 = *(void *)(v3 + 344);
  *(unsigned char *)(v3 + 497) = 1;
  *(void *)(v3 + 392) = 0;
  *(void *)(v3 + 400) = v7;
  if (!v7)
  {
    if (qword_4CD38 != -1) {
      swift_once();
    }
    sub_1BEA4();
    sub_23E8(v6, (uint64_t)static Log.suggestions);
    sub_1C09C();
    v17();
    sub_1C400();
    v26._uint64_t countAndFlagsBits = sub_1C1AC(v18, v19, v20, v21, v22, v23, v24, v25, v36, v37, v39, v41, v43, v44, v45, v46);
    sub_1C1CC(v26, (uint64_t)"Couldn't get preferred accessory for suggestion: ");
    sub_380B0();
    v27._uint64_t countAndFlagsBits = v5 - 121;
    sub_1C1CC(v27, (uint64_t)" and accessories ");
    sub_18544(0xD00000000000008ALL);
    swift_bridgeObjectRelease();
    v50._uint64_t countAndFlagsBits = sub_37EF0();
    sub_37E70(v50);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1C0B8(*v1, v5 - 108, (uint64_t)"ggestion. Invalidating ");
    swift_bridgeObjectRelease();
    uint64_t v28 = sub_1C2BC();
    v29(v28);
    v42(v40, v38);
    sub_37D10();
    uint64_t v30 = sub_1C4E0();
    sub_1C050(v30);
    sub_3D60(v0, &qword_4D3F0);
    uint64_t v31 = sub_1BD68();
    v32(v31);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_1C210();
    sub_1C104();
    __asm { BRAA            X1, X16 }
  }
  swift_retain();
  swift_bridgeObjectRelease();
  if (qword_4CD38 != -1) {
    swift_once();
  }
  sub_1C4CC();
  uint64_t v8 = sub_23E8(v2, (uint64_t)static Log.suggestions);
  uint64_t v9 = sub_1BED8(v8);
  v10(v9);
  sub_1C420();
  swift_bridgeObjectRelease();
  v47._uint64_t countAndFlagsBits = sub_1C46C();
  sub_37E70(v47);
  swift_bridgeObjectRelease();
  v48._uint64_t countAndFlagsBits = 0xD00000000000001CLL;
  v48._object = (void *)0x800000000003D5F0;
  sub_37E70(v48);
  swift_bridgeObjectRetain();
  v49._uint64_t countAndFlagsBits = v5;
  v49._object = v4;
  sub_37E70(v49);
  swift_bridgeObjectRelease();
  sub_1BF5C(v45, (uint64_t)"ggestion. Invalidating ");
  swift_bridgeObjectRelease();
  uint64_t v11 = sub_1C154();
  v12(v11);
  *(void *)(v3 + 464) = sub_1C2F8();
  sub_37F40();
  sub_1C104();
  return _swift_task_switch(v13, v14, v15);
}

uint64_t sub_17CF4()
{
  sub_11914();
  sub_11820();
  sub_1C39C();
  *uint64_t v2 = v1;
  uint64_t v3 = *v0;
  sub_1C0A8();
  *uint64_t v4 = v3;
  *(void *)(v7 + 376) = v5;
  *(void *)(v7 + 384) = v6;
  *(unsigned char *)(v7 + 496) = v8;
  swift_task_dealloc();
  swift_release();
  sub_11920();
  return _swift_task_switch(v9, v10, v11);
}

uint64_t sub_17DDC()
{
  uint64_t v8 = *(void *)(v3 + 376);
  uint64_t v7 = *(void *)(v3 + 384);
  *(unsigned char *)(v3 + 497) = *(unsigned char *)(v3 + 496) & 1;
  *(void *)(v3 + 392) = v7;
  *(void *)(v3 + 400) = v8;
  if (!v8)
  {
    if (qword_4CD38 != -1) {
      swift_once();
    }
    sub_1BEA4();
    sub_23E8(v6, (uint64_t)static Log.suggestions);
    sub_1C09C();
    v18();
    sub_1C400();
    v27._uint64_t countAndFlagsBits = sub_1C1AC(v19, v20, v21, v22, v23, v24, v25, v26, v37, v38, v40, v42, v44, v45, v46, v47);
    sub_1C1CC(v27, (uint64_t)"Couldn't get preferred accessory for suggestion: ");
    sub_380B0();
    v28._uint64_t countAndFlagsBits = v5 - 121;
    sub_1C1CC(v28, (uint64_t)" and accessories ");
    sub_18544(0xD00000000000008ALL);
    swift_bridgeObjectRelease();
    v51._uint64_t countAndFlagsBits = sub_37EF0();
    sub_37E70(v51);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1C0B8(*v1, v5 - 108, (uint64_t)"ggestion. Invalidating ");
    swift_bridgeObjectRelease();
    uint64_t v29 = sub_1C2BC();
    v30(v29);
    v43(v41, v39);
    sub_37D10();
    uint64_t v31 = sub_1C4E0();
    sub_1C050(v31);
    sub_3D60(v0, &qword_4D3F0);
    uint64_t v32 = sub_1BD68();
    v33(v32);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_1C210();
    sub_1C104();
    __asm { BRAA            X1, X16 }
  }
  swift_retain();
  swift_bridgeObjectRelease();
  if (qword_4CD38 != -1) {
    swift_once();
  }
  sub_1C4CC();
  uint64_t v9 = sub_23E8(v2, (uint64_t)static Log.suggestions);
  uint64_t v10 = sub_1BED8(v9);
  v11(v10);
  sub_1C420();
  swift_bridgeObjectRelease();
  v48._uint64_t countAndFlagsBits = sub_1C46C();
  sub_37E70(v48);
  swift_bridgeObjectRelease();
  v49._uint64_t countAndFlagsBits = 0xD00000000000001CLL;
  v49._object = (void *)0x800000000003D5F0;
  sub_37E70(v49);
  swift_bridgeObjectRetain();
  v50._uint64_t countAndFlagsBits = v5;
  v50._object = v4;
  sub_37E70(v50);
  swift_bridgeObjectRelease();
  sub_1BF5C(v46, (uint64_t)"ggestion. Invalidating ");
  swift_bridgeObjectRelease();
  uint64_t v12 = sub_1C154();
  v13(v12);
  *(void *)(v3 + 464) = sub_1C2F8();
  sub_37F40();
  sub_1C104();
  return _swift_task_switch(v14, v15, v16);
}

uint64_t sub_18134()
{
  sub_11914();
  sub_2A02C();
  sub_11920();
  return _swift_task_switch(v0, v1, v2);
}

uint64_t sub_1819C()
{
  if (*(unsigned char *)(v1 + 497) == 1)
  {
    swift_release_n();
    uint64_t v2 = sub_1C3BC();
    v3(v2);
    sub_37D10();
    uint64_t v4 = sub_1BF9C();
    sub_1C004(v4);
    sub_3D60(v0, &qword_4D3F0);
    uint64_t v5 = sub_1BD68();
    v6(v5);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    sub_1C210();
    sub_1BF08();
    __asm { BRAA            X1, X16 }
  }
  uint64_t v9 = *(void (**)(uint64_t, uint64_t))(v1 + 432);
  uint64_t v11 = *(void *)(v1 + 272);
  uint64_t v10 = *(void **)(v1 + 280);
  uint64_t v12 = *(void *)(v1 + 192);
  uint64_t v13 = *(void *)(v1 + 176);
  uint64_t v14 = *(void **)(v1 + 160);
  (*(void (**)(uint64_t, void, uint64_t))(v1 + 416))(v12, *(void *)(v1 + 408), v13);
  sub_1C2AC();
  sub_38020(50);
  swift_bridgeObjectRelease();
  *(void *)(v1 + 152) = sub_37A20();
  sub_1BB18();
  v22._uint64_t countAndFlagsBits = sub_37FD0();
  sub_37E70(v22);
  swift_bridgeObjectRelease();
  v23._uint64_t countAndFlagsBits = 0xD00000000000001CLL;
  v23._object = (void *)0x800000000003D5F0;
  sub_37E70(v23);
  swift_bridgeObjectRetain();
  v24._uint64_t countAndFlagsBits = v11;
  v24._object = v10;
  sub_37E70(v24);
  swift_bridgeObjectRelease();
  v15._uint64_t countAndFlagsBits = 0xD000000000000012;
  v16._uint64_t countAndFlagsBits = 0xD00000000000008ALL;
  v16._object = (void *)0x800000000003D240;
  v15._object = (void *)0x800000000003D610;
  Logger.debug(output:test:caller:)(v15, 0, v16);
  swift_bridgeObjectRelease();
  v9(v12, v13);
  *(void *)(v1 + 472) = *v14;
  *(void *)(v1 + 480) = v14[1];
  *(void *)(v1 + 488) = swift_getObjectType();
  sub_37F40();
  sub_1BF08();
  return _swift_task_switch(v17, v18, v19);
}

uint64_t sub_18404()
{
  sub_11914();
  sub_2A3B8();
  sub_11920();
  return _swift_task_switch(v0, v1, v2);
}

uint64_t sub_1846C()
{
  swift_release_n();
  uint64_t v1 = sub_1C3BC();
  v2(v1);
  sub_37D10();
  uint64_t v3 = sub_1BF9C();
  sub_1C004(v3);
  sub_3D60(v0, &qword_4D3F0);
  uint64_t v4 = sub_1BD68();
  v5(v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  sub_1C210();
  return v6();
}

uint64_t sub_18544(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return (uint64_t)_swiftEmptyArrayStorage;
  }
  sub_1AE88(0, v1, 0);
  uint64_t result = sub_1BB64(a1);
  if ((result & 0x8000000000000000) == 0)
  {
    unint64_t v5 = result;
    if (result < 1 << *(unsigned char *)(a1 + 32))
    {
      uint64_t v6 = a1 + 64;
      while ((*(void *)(v6 + 8 * (v5 >> 6)) & (1 << v5)) != 0)
      {
        if (v4 != *(_DWORD *)(a1 + 36)) {
          goto LABEL_18;
        }
        int64_t v13 = v1;
        int v14 = v4;
        uint64_t result = sub_379D0();
        uint64_t v7 = result;
        uint64_t v9 = v8;
        unint64_t v11 = _swiftEmptyArrayStorage[2];
        unint64_t v10 = _swiftEmptyArrayStorage[3];
        if (v11 >= v10 >> 1) {
          uint64_t result = (uint64_t)sub_1AE88((char *)(v10 > 1), v11 + 1, 1);
        }
        _swiftEmptyArrayStorage[2] = v11 + 1;
        uint64_t v12 = (char *)&_swiftEmptyArrayStorage[2 * v11];
        *((void *)v12 + 4) = v7;
        *((void *)v12 + 5) = v9;
        if ((uint64_t)v5 >= -(-1 << *(unsigned char *)(a1 + 32))) {
          goto LABEL_19;
        }
        uint64_t v6 = a1 + 64;
        if ((*(void *)(a1 + 64 + 8 * (v5 >> 6)) & (1 << v5)) == 0) {
          goto LABEL_20;
        }
        if (v14 != *(_DWORD *)(a1 + 36)) {
          goto LABEL_21;
        }
        uint64_t result = sub_37FE0();
        int64_t v1 = v13 - 1;
        if (v13 == 1) {
          return (uint64_t)_swiftEmptyArrayStorage;
        }
        unint64_t v5 = result;
        if ((result & 0x8000000000000000) == 0)
        {
          int v4 = *(_DWORD *)(a1 + 36);
          if (result < 1 << *(unsigned char *)(a1 + 32)) {
            continue;
          }
        }
        goto LABEL_22;
      }
      __break(1u);
LABEL_18:
      __break(1u);
LABEL_19:
      __break(1u);
LABEL_20:
      __break(1u);
LABEL_21:
      __break(1u);
    }
  }
LABEL_22:
  __break(1u);
  return result;
}

uint64_t sub_186FC()
{
  sub_11914();
  v1[9] = v0;
  uint64_t v2 = sub_37D90();
  v1[10] = v2;
  sub_1BD50(v2);
  v1[11] = v3;
  v1[12] = sub_11974();
  v1[13] = swift_task_alloc();
  v1[14] = swift_task_alloc();
  sub_2420(&qword_4D3B8);
  v1[15] = sub_1C354();
  uint64_t v4 = sub_37A80();
  v1[16] = v4;
  sub_1BD50(v4);
  v1[17] = v5;
  v1[18] = sub_11974();
  v1[19] = swift_task_alloc();
  v1[20] = swift_task_alloc();
  v1[21] = swift_task_alloc();
  v1[22] = swift_task_alloc();
  v1[23] = swift_task_alloc();
  v1[24] = swift_task_alloc();
  v1[25] = swift_task_alloc();
  v1[26] = swift_task_alloc();
  v1[27] = swift_task_alloc();
  v1[28] = swift_task_alloc();
  sub_11920();
  return _swift_task_switch(v6, v7, v8);
}

uint64_t sub_18870()
{
  sub_11914();
  type metadata accessor for SuggestionEntityRetrieval();
  v0[29] = swift_initStackObject();
  sub_1C4AC();
  v0[30] = sub_2F6AC(0xD000000000000017, v1);
  uint64_t v2 = (void *)swift_task_alloc();
  v0[31] = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_18934;
  return sub_2F75C();
}

uint64_t sub_18934()
{
  sub_11914();
  sub_11820();
  sub_1C39C();
  *uint64_t v2 = v1;
  uint64_t v3 = *v0;
  sub_1C0A8();
  *uint64_t v4 = v3;
  *(void *)(v6 + 256) = v5;
  swift_task_dealloc();
  swift_release();
  sub_11920();
  return _swift_task_switch(v7, v8, v9);
}

unint64_t sub_18A18()
{
  uint64_t v1 = v0[32];
  uint64_t v2 = "/Library/Caches/com.apple.xbs/Sources/SiriHomeAutomation/HomeAutomationSiriSuggestions/HomeAutomationCandidateSug"
       "gestionConfigurator.swift";
  if (!v1)
  {
    if (qword_4CD38 != -1) {
      swift_once();
    }
    uint64_t v16 = v0[13];
    uint64_t v17 = v0[10];
    uint64_t v18 = v0[11];
    uint64_t v19 = v0[9];
    sub_23E8(v17, (uint64_t)static Log.suggestions);
    sub_1C09C();
    v20();
    sub_1C184();
    sub_38020(57);
    v21._uint64_t countAndFlagsBits = 0xD000000000000037;
    sub_1C1CC(v21, (uint64_t)"Couldn't get home to validate suggestion. Invalidating ");
    uint64_t v22 = *(void *)(v19 + 16);
    Swift::String v23 = *(void **)(v19 + 24);
    swift_bridgeObjectRetain();
    v173._uint64_t countAndFlagsBits = v22;
    v173._object = v23;
    sub_37E70(v173);
    swift_bridgeObjectRelease();
    sub_1C3AC();
    sub_1C178();
    Logger.warning(output:test:file:function:line:)(v24, v25, v26, v27, 112);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v16, v17);
    goto LABEL_9;
  }
  uint64_t v3 = v0[15];
  uint64_t v4 = v0[16];
  uint64_t v5 = v0[9];
  uint64_t v7 = *(void *)(v5 + 16);
  unint64_t v6 = *(void *)(v5 + 24);
  swift_bridgeObjectRetain();
  unint64_t v166 = v6;
  sub_37A60();
  if (sub_3DBC(v3, 1, v4) == 1)
  {
    sub_3D60(v0[15], &qword_4D3B8);
    if (qword_4CD38 != -1) {
      swift_once();
    }
    uint64_t v8 = v0[13];
    uint64_t v10 = v0[10];
    uint64_t v9 = v0[11];
    sub_23E8(v10, (uint64_t)static Log.suggestions);
    sub_1C09C();
    v11();
    sub_1C184();
    sub_38020(44);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    v172._uint64_t countAndFlagsBits = v7;
    v172._object = (void *)v166;
    sub_37E70(v172);
    swift_bridgeObjectRelease();
    sub_1C3AC();
    sub_1C178();
    Logger.warning(output:test:file:function:line:)(v12, v13, v14, v15, 119);
    swift_release();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
LABEL_9:
    unsigned int v167 = 0;
    goto LABEL_95;
  }
  uint64_t v28 = v0[28];
  uint64_t v29 = v0[9];
  (*(void (**)(uint64_t, void, void))(v0[17] + 32))(v28, v0[15], v0[16]);
  uint64_t v163 = v1;
  unint64_t v30 = sub_37990();
  uint64_t v31 = sub_169D0(v28, *(void *)(v29 + 32));
  uint64_t v32 = (uint64_t)_swiftEmptyArrayStorage;
  if (v31)
  {
    v165 = sub_1B1F8(v31);
    swift_bridgeObjectRelease();
  }
  else
  {
    v165 = _swiftEmptyArrayStorage;
  }
  if (qword_4CD38 != -1) {
    swift_once();
  }
  uint64_t v33 = v0[14];
  uint64_t v34 = v0[10];
  v168 = v0;
  v160 = (void (**)(uint64_t))(v0[11] + 16);
  uint64_t v161 = sub_23E8(v34, (uint64_t)static Log.suggestions);
  (*v160)(v33);
  sub_1C184();
  sub_38020(87);
  v174._uint64_t countAndFlagsBits = 0x676E696B63656843;
  v174._object = (void *)0xEC00000020666920;
  sub_37E70(v174);
  unint64_t v35 = v166;
  swift_bridgeObjectRetain();
  uint64_t v164 = v7;
  v175._uint64_t countAndFlagsBits = v7;
  v175._object = (void *)v166;
  sub_37E70(v175);
  swift_bridgeObjectRelease();
  v36._uint64_t countAndFlagsBits = 0xD000000000000021;
  sub_1C1CC(v36, (uint64_t)" is valid for\n- home accessories ");
  if (v30 >> 62)
  {
    sub_1BDC8();
    uint64_t v37 = sub_380F0();
    swift_bridgeObjectRelease();
    if (!v37) {
      goto LABEL_27;
    }
  }
  else
  {
    uint64_t v37 = *(void *)((char *)&dword_10 + (v30 & 0xFFFFFFFFFFFFFF8));
    if (!v37) {
      goto LABEL_27;
    }
  }
  sub_1AE88(0, v37 & ~(v37 >> 63), 0);
  if (v37 < 0) {
    goto LABEL_203;
  }
  uint64_t v38 = 0;
  do
  {
    if ((v30 & 0xC000000000000001) != 0) {
      sub_38040();
    }
    else {
      swift_retain();
    }
    uint64_t v39 = sub_37CC0();
    uint64_t v41 = v40;
    swift_release();
    unint64_t v43 = _swiftEmptyArrayStorage[2];
    unint64_t v42 = _swiftEmptyArrayStorage[3];
    if (v43 >= v42 >> 1) {
      sub_1C2D4(v42);
    }
    ++v38;
    _swiftEmptyArrayStorage[2] = v43 + 1;
    uint64_t v44 = &_swiftEmptyArrayStorage[2 * v43];
    v44[4] = v39;
    v44[5] = v41;
  }
  while (v37 != v38);
LABEL_27:
  swift_bridgeObjectRelease();
  v176._uint64_t countAndFlagsBits = sub_37EF0();
  sub_37E70(v176);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v45._uint64_t countAndFlagsBits = 0xD000000000000024;
  sub_1C1CC(v45, (uint64_t)"\n- supported suggestion accessories ");
  int64_t v46 = v165[2];
  uint64_t v2 = (const char *)_swiftEmptyArrayStorage;
  if (v46)
  {
    swift_bridgeObjectRetain();
    sub_1AE88(0, v46, 0);
    uint64_t v47 = 0;
    do
    {
      uint64_t v48 = sub_379D0();
      uint64_t v50 = v49;
      unint64_t v52 = _swiftEmptyArrayStorage[2];
      unint64_t v51 = _swiftEmptyArrayStorage[3];
      if (v52 >= v51 >> 1) {
        sub_1C2D4(v51);
      }
      ++v47;
      _swiftEmptyArrayStorage[2] = v52 + 1;
      uint64_t v53 = &_swiftEmptyArrayStorage[2 * v52];
      v53[4] = v48;
      v53[5] = v50;
    }
    while (v46 != v47);
    swift_bridgeObjectRelease();
  }
  uint64_t v54 = v168[27];
  uint64_t v56 = v168[16];
  uint64_t v55 = v168[17];
  uint64_t v57 = v168[14];
  uint64_t v58 = v168[10];
  uint64_t v59 = v168[11];
  v177._uint64_t countAndFlagsBits = sub_37EF0();
  sub_37E70(v177);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1BF5C(v169, (uint64_t)"ggestion. Invalidating ");
  swift_bridgeObjectRelease();
  uint64_t v60 = v58;
  uint64_t v61 = v55;
  v159 = *(void (**)(uint64_t, uint64_t))(v59 + 8);
  v159(v57, v60);
  uint64_t v62 = *(void (**)(uint64_t, void, uint64_t))(v55 + 104);
  unint64_t v35 = v55 + 104;
  uint64_t v37 = (uint64_t)v62;
  v62(v54, enum case for HomeSuggestionType.createAutomation(_:), v56);
  uint64_t v34 = sub_37A70();
  unint64_t v64 = v63;
  v162 = *(void (**)(uint64_t, uint64_t))(v61 + 8);
  v162(v54, v56);
  sub_1C21C();
  uint64_t v65 = (void *)v166;
  BOOL v66 = v66 && v64 == v166;
  if (v66)
  {
    swift_bridgeObjectRelease();
LABEL_85:
    if (sub_379A0())
    {
      int v109 = 1;
    }
    else
    {
      sub_1C4AC();
      sub_1C178();
      Logger.warning(output:test:file:function:line:)(v110, v111, v112, v113, 142);
      int v109 = 0;
    }
    goto LABEL_88;
  }
  sub_1BE10();
  sub_1BF84();
  if (v34) {
    goto LABEL_85;
  }
  unint64_t v67 = v168[26];
  uint64_t v68 = sub_1BDE8();
  ((void (*)(uint64_t))v37)(v68);
  sub_37A70();
  uint64_t v69 = sub_1BD90();
  v70(v69);
  sub_1C21C();
  if (v66 && v67 == v166)
  {
    swift_bridgeObjectRelease();
LABEL_99:
    sub_37990();
    sub_1C120();
    if (v126)
    {
      sub_1BDC8();
      uint64_t v37 = sub_380F0();
    }
    else
    {
      sub_1BE54();
    }
    if (v37)
    {
      unint64_t v35 = v166 & 0xC000000000000001;
      if ((v166 & 0xC000000000000001) != 0) {
        goto LABEL_227;
      }
      swift_retain();
LABEL_104:
      char v127 = sub_37D50();
      swift_release();
      if (v127)
      {
        sub_1C31C();
        int v109 = 1;
LABEL_108:
        uint64_t v65 = (void *)v166;
        goto LABEL_88;
      }
      if (v37 != 1)
      {
        uint64_t v32 = 5;
        while (1)
        {
          if (v35)
          {
            uint64_t v34 = sub_38040();
          }
          else
          {
            uint64_t v34 = *(void *)(v166 + 8 * v32);
            swift_retain();
          }
          uint64_t v131 = v32 - 3;
          if (__OFADD__(v32 - 4, 1)) {
            goto LABEL_204;
          }
          char v132 = sub_37D50();
          swift_release();
          if (v132) {
            goto LABEL_270;
          }
          ++v32;
          if (v131 == v37) {
            goto LABEL_137;
          }
        }
      }
LABEL_107:
      sub_1C31C();
      int v109 = 0;
      goto LABEL_108;
    }
LABEL_181:
    sub_1C31C();
    int v109 = 0;
    uint64_t v65 = (void *)v166;
    goto LABEL_88;
  }
  sub_1BE10();
  sub_1BF84();
  if (v34) {
    goto LABEL_99;
  }
  uint64_t v32 = v168[25];
  uint64_t v72 = sub_1BDE8();
  ((void (*)(uint64_t))v37)(v72);
  sub_37A70();
  uint64_t v73 = sub_1BD90();
  v74(v73);
  sub_1C21C();
  if (v66 && v32 == v166)
  {
    swift_bridgeObjectRelease();
LABEL_110:
    sub_37990();
    sub_1C120();
    if (v128)
    {
      sub_1BDC8();
      uint64_t v37 = sub_380F0();
    }
    else
    {
      sub_1BE54();
    }
    unint64_t v35 = v161;
    if (v37)
    {
      sub_1BDFC();
      while (1)
      {
        if (v161) {
          sub_1C0EC();
        }
        else {
          sub_1BE88();
        }
        BOOL v129 = __OFADD__(v2++, 1);
        if (v129) {
          goto LABEL_226;
        }
        sub_1C240();
        sub_37D60();
        uint64_t v130 = *(void *)(v32 + 16);
        if (v130)
        {
          sub_1BF24();
          sub_379F0();
          if (v34 == sub_1BE70())
          {
LABEL_269:
            swift_release();
            sub_1C31C();
LABEL_270:
            swift_bridgeObjectRelease_n();
LABEL_271:
            int v109 = 1;
            goto LABEL_272;
          }
          if (v130 != 1)
          {
            uint64_t v32 = 5;
            while (1)
            {
              sub_1C1A0();
              if (v129) {
                break;
              }
              sub_1C1E4();
              if (v34 == sub_1BE70()) {
                goto LABEL_269;
              }
              sub_1C194();
              if (v66) {
                goto LABEL_126;
              }
            }
            __break(1u);
LABEL_203:
            __break(1u);
LABEL_204:
            __break(1u);
LABEL_205:
            swift_bridgeObjectRelease();
LABEL_206:
            sub_37990();
            sub_1C120();
            if (v139) {
              goto LABEL_299;
            }
            sub_1BE54();
            if (v37) {
              goto LABEL_208;
            }
            goto LABEL_137;
          }
LABEL_126:
          sub_1C228();
        }
        swift_release();
        swift_bridgeObjectRelease();
        sub_1C440();
        if (v66) {
          goto LABEL_107;
        }
      }
    }
    goto LABEL_181;
  }
  sub_1BE10();
  sub_1BF84();
  if (v34) {
    goto LABEL_110;
  }
  uint64_t v76 = v168[24];
  uint64_t v77 = sub_1BDE8();
  ((void (*)(uint64_t))v37)(v77);
  sub_37A70();
  uint64_t v78 = sub_1BD90();
  v79(v78);
  sub_1C21C();
  if (v66 && v76 == v166)
  {
    swift_bridgeObjectRelease();
LABEL_140:
    sub_37990();
    sub_1C120();
    if (v133)
    {
      sub_1BDC8();
      uint64_t v37 = sub_380F0();
    }
    else
    {
      sub_1BE54();
    }
    unint64_t v35 = v161;
    if (v37)
    {
      sub_1BDFC();
      while (1)
      {
        if (v161) {
          sub_1C0EC();
        }
        else {
          sub_1BE88();
        }
        BOOL v129 = __OFADD__(v2++, 1);
        if (v129) {
          goto LABEL_249;
        }
        sub_1C240();
        sub_37D60();
        uint64_t v134 = *(void *)(v76 + 16);
        if (v134)
        {
          sub_1BF24();
          sub_379F0();
          if (v34 == sub_1BE70()) {
            goto LABEL_269;
          }
          if (v134 != 1)
          {
            uint64_t v76 = 5;
            while (1)
            {
              sub_1C1A0();
              if (v129) {
                break;
              }
              sub_1C1E4();
              if (v34 == sub_1BE70()) {
                goto LABEL_269;
              }
              sub_1C194();
              if (v66) {
                goto LABEL_156;
              }
            }
            __break(1u);
LABEL_226:
            __break(1u);
LABEL_227:
            sub_38040();
            goto LABEL_104;
          }
LABEL_156:
          sub_1C228();
        }
        swift_release();
        swift_bridgeObjectRelease();
        sub_1C440();
        if (v66) {
          goto LABEL_107;
        }
      }
    }
    goto LABEL_181;
  }
  sub_1BE10();
  sub_1BF84();
  if (v34) {
    goto LABEL_140;
  }
  uint64_t v81 = v168[23];
  uint64_t v82 = sub_1BDE8();
  ((void (*)(uint64_t))v37)(v82);
  sub_37A70();
  uint64_t v83 = sub_1BD90();
  v84(v83);
  sub_1C21C();
  if (v66 && v81 == v166)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1BE10();
    sub_1BF84();
    if ((v34 & 1) == 0)
    {
      uint64_t v32 = v168[22];
      uint64_t v86 = sub_1BDE8();
      ((void (*)(uint64_t))v37)(v86);
      sub_37A70();
      uint64_t v87 = sub_1BD90();
      v88(v87);
      sub_1C21C();
      if (v66 && v32 == v166)
      {
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_1BE10();
        sub_1BF84();
        if ((v34 & 1) == 0)
        {
          uint64_t v32 = v168[21];
          uint64_t v90 = v168[16];
          uint64_t v91 = sub_1BDE8();
          ((void (*)(uint64_t))v37)(v91);
          uint64_t v34 = sub_37A70();
          unint64_t v93 = v92;
          v162(v32, v90);
          sub_1C3F4();
          if (v66 && v93 == v166) {
            goto LABEL_205;
          }
          sub_38150();
          sub_1BF84();
          if (v34) {
            goto LABEL_206;
          }
          uint64_t v32 = v168[20];
          uint64_t v95 = sub_1BDE8();
          ((void (*)(uint64_t))v37)(v95);
          sub_37A70();
          uint64_t v96 = sub_1BE30();
          v97(v96);
          sub_1C3F4();
          if (v66 && v32 == v166)
          {
            swift_bridgeObjectRelease();
          }
          else
          {
            sub_1BFE0();
            sub_1BF84();
            if ((v34 & 1) == 0)
            {
              unint64_t v99 = v168[19];
              uint64_t v100 = sub_1BDE8();
              ((void (*)(uint64_t))v37)(v100);
              sub_37A70();
              uint64_t v101 = sub_1BE30();
              v102(v101);
              sub_1C3F4();
              if (v66 && v99 == v166) {
                goto LABEL_250;
              }
              sub_1BFE0();
              sub_1BF84();
              if (v34) {
                goto LABEL_251;
              }
              unint64_t v104 = v168[18];
              uint64_t v105 = sub_1BDE8();
              ((void (*)(uint64_t))v37)(v105);
              sub_37A70();
              uint64_t v106 = sub_1BE30();
              v107(v106);
              sub_1C3F4();
              if (!v66 || v104 != v166)
              {
                sub_1BFE0();
                sub_1BF84();
                if ((v34 & 1) == 0) {
                  goto LABEL_271;
                }
LABEL_277:
                unint64_t result = sub_379B0();
                unint64_t v145 = result;
                v170 = v2;
                if (result >> 62)
                {
                  unint64_t result = sub_380F0();
                  uint64_t v146 = result;
                  if (result) {
                    goto LABEL_279;
                  }
                }
                else
                {
                  uint64_t v146 = *(void *)((char *)&dword_10 + (result & 0xFFFFFFFFFFFFFF8));
                  if (v146)
                  {
LABEL_279:
                    if (v146 < 1)
                    {
                      __break(1u);
                      return result;
                    }
                    for (uint64_t i = 0; i != v146; ++i)
                    {
                      if ((v145 & 0xC000000000000001) != 0) {
                        sub_1C0EC();
                      }
                      else {
                        swift_retain();
                      }
                      unint64_t v148 = sub_37CB0();
                      if (v148 >> 62) {
                        uint64_t v149 = sub_380F0();
                      }
                      else {
                        uint64_t v149 = *(void *)((char *)&dword_10 + (v148 & 0xFFFFFFFFFFFFFF8));
                      }
                      swift_bridgeObjectRelease();
                      if (v149)
                      {
                        sub_38070();
                        sub_38090();
                        sub_380A0();
                        sub_38080();
                      }
                      else
                      {
                        swift_release();
                      }
                    }
                    swift_bridgeObjectRelease();
                    unint64_t v150 = (unint64_t)v170;
                    goto LABEL_310;
                  }
                }
                swift_bridgeObjectRelease();
                unint64_t v150 = (unint64_t)_swiftEmptyArrayStorage;
LABEL_310:
                if ((v150 & 0x8000000000000000) != 0 || (v150 & 0x4000000000000000) != 0)
                {
                  swift_bridgeObjectRetain();
                  uint64_t v151 = sub_380F0();
                  swift_release();
                }
                else
                {
                  uint64_t v151 = *(void *)(v150 + 16);
                }
                swift_release();
                if (!v151)
                {
                  uint64_t v152 = v168[13];
                  uint64_t v153 = v168[10];
                  sub_1C09C();
                  v154();
                  sub_27D98(45);
                  swift_bridgeObjectRelease();
                  v168[8] = v163;
                  sub_379C0();
                  sub_1BC0C((unint64_t *)&qword_4D3C0, (void (*)(uint64_t))&type metadata accessor for Home);
                  v180._uint64_t countAndFlagsBits = sub_38140();
                  sub_37E70(v180);
                  swift_bridgeObjectRelease();
                  sub_1C178();
                  Logger.warning(output:test:file:function:line:)(v155, v156, v157, v158, 173);
                  swift_bridgeObjectRelease();
                  v159(v152, v153);
                  int v109 = 0;
                  uint64_t v65 = (void *)v166;
                  goto LABEL_88;
                }
                goto LABEL_271;
              }
LABEL_276:
              swift_bridgeObjectRelease();
              goto LABEL_277;
            }
          }
          sub_37990();
          sub_1C120();
          if (v141) {
            goto LABEL_303;
          }
          sub_1BE54();
          if (v37) {
            goto LABEL_231;
          }
          goto LABEL_137;
        }
      }
      sub_37990();
      sub_1C120();
      if (v137) {
        goto LABEL_295;
      }
      sub_1BE54();
      if (v37) {
        goto LABEL_185;
      }
      goto LABEL_107;
    }
  }
  sub_37990();
  sub_1C120();
  if (v135)
  {
    sub_1BDC8();
    uint64_t v37 = sub_380F0();
  }
  else
  {
    sub_1BE54();
  }
  unint64_t v35 = v161;
  if (!v37) {
    goto LABEL_181;
  }
  sub_1BDFC();
  while (1)
  {
    if (v161) {
      sub_1C0EC();
    }
    else {
      sub_1BE88();
    }
    BOOL v129 = __OFADD__(v2++, 1);
    if (v129)
    {
LABEL_275:
      __break(1u);
      goto LABEL_276;
    }
    sub_1C240();
    sub_37D60();
    uint64_t v136 = *(void *)(v81 + 16);
    if (v136) {
      break;
    }
LABEL_178:
    swift_release();
    swift_bridgeObjectRelease();
    sub_1C440();
    if (v66) {
      goto LABEL_107;
    }
  }
  sub_1BF24();
  sub_379F0();
  if (v34 == sub_1BE70()) {
    goto LABEL_269;
  }
  if (v136 == 1)
  {
LABEL_177:
    sub_1C228();
    goto LABEL_178;
  }
  uint64_t v81 = 5;
  while (1)
  {
    sub_1C1A0();
    if (v129) {
      break;
    }
    sub_1C1E4();
    if (v34 == sub_1BE70()) {
      goto LABEL_269;
    }
    sub_1C194();
    if (v66) {
      goto LABEL_177;
    }
  }
  __break(1u);
LABEL_249:
  __break(1u);
LABEL_250:
  swift_bridgeObjectRelease();
LABEL_251:
  sub_37990();
  sub_1C120();
  if (v143)
  {
LABEL_306:
    sub_1BDC8();
    uint64_t v37 = sub_380F0();
    if (!v37) {
      goto LABEL_137;
    }
  }
  else
  {
    sub_1BE54();
    if (!v37) {
      goto LABEL_137;
    }
  }
  sub_1BDFC();
  while (2)
  {
    if (v35) {
      sub_1C0EC();
    }
    else {
      sub_1BE88();
    }
    BOOL v129 = __OFADD__(v2++, 1);
    if (v129)
    {
      __break(1u);
      goto LABEL_306;
    }
    swift_bridgeObjectRetain();
    sub_37D60();
    uint64_t v144 = v165[2];
    if (!v144)
    {
LABEL_267:
      swift_release();
      swift_bridgeObjectRelease();
      if (v2 == (const char *)v37) {
        goto LABEL_137;
      }
      continue;
    }
    break;
  }
  uint64_t v34 = v165[4];
  swift_bridgeObjectRetain();
  sub_379F0();
  if (v34 == sub_1BE70()) {
    goto LABEL_269;
  }
  if (v144 == 1)
  {
LABEL_266:
    swift_bridgeObjectRelease();
    goto LABEL_267;
  }
  uint64_t v32 = 5;
  while (1)
  {
    sub_1C1A0();
    if (v129) {
      break;
    }
    sub_1C1E4();
    if (v34 == sub_1BE70()) {
      goto LABEL_269;
    }
    sub_1C194();
    if (v66) {
      goto LABEL_266;
    }
  }
  __break(1u);
  while (1)
  {
    __break(1u);
LABEL_303:
    sub_1BDC8();
    uint64_t v37 = sub_380F0();
    if (!v37) {
      break;
    }
LABEL_231:
    sub_1BDFC();
    while (1)
    {
      if (v35) {
        sub_1C0EC();
      }
      else {
        sub_1BE88();
      }
      BOOL v129 = __OFADD__(v2++, 1);
      if (v129) {
        break;
      }
      sub_1C240();
      sub_37D60();
      uint64_t v142 = *(void *)(v32 + 16);
      if (v142)
      {
        sub_1BF24();
        sub_379F0();
        if (v34 == sub_1BE70()) {
          goto LABEL_269;
        }
        if (v142 != 1)
        {
          uint64_t v32 = 5;
          while (1)
          {
            sub_1C1A0();
            if (v129) {
              break;
            }
            sub_1C1E4();
            if (v34 == sub_1BE70()) {
              goto LABEL_269;
            }
            sub_1C194();
            if (v66) {
              goto LABEL_244;
            }
          }
          __break(1u);
          while (1)
          {
            __break(1u);
LABEL_299:
            sub_1BDC8();
            uint64_t v37 = sub_380F0();
            if (!v37) {
              goto LABEL_137;
            }
LABEL_208:
            sub_1BDFC();
            while (1)
            {
              if (v35) {
                sub_1C0EC();
              }
              else {
                sub_1BE88();
              }
              BOOL v129 = __OFADD__(v2++, 1);
              if (v129) {
                break;
              }
              sub_1C240();
              sub_37D60();
              uint64_t v140 = *(void *)(v32 + 16);
              if (v140)
              {
                sub_1BF24();
                sub_379F0();
                if (v34 == sub_1BE70()) {
                  goto LABEL_269;
                }
                if (v140 != 1)
                {
                  uint64_t v32 = 5;
                  while (1)
                  {
                    sub_1C1A0();
                    if (v129) {
                      break;
                    }
                    sub_1C1E4();
                    if (v34 == sub_1BE70()) {
                      goto LABEL_269;
                    }
                    sub_1C194();
                    if (v66) {
                      goto LABEL_221;
                    }
                  }
                  __break(1u);
                  while (1)
                  {
                    __break(1u);
LABEL_295:
                    sub_1BDC8();
                    if (!sub_380F0()) {
                      goto LABEL_107;
                    }
LABEL_185:
                    sub_1BDFC();
                    while (1)
                    {
                      if (v35) {
                        sub_1C0EC();
                      }
                      else {
                        sub_1BE88();
                      }
                      BOOL v129 = __OFADD__(v2++, 1);
                      if (v129) {
                        break;
                      }
                      sub_1C240();
                      sub_37D60();
                      uint64_t v138 = *(void *)(v32 + 16);
                      if (v138)
                      {
                        sub_1BF24();
                        sub_379F0();
                        if (v34 == sub_1BE70()) {
                          goto LABEL_269;
                        }
                        if (v138 != 1)
                        {
                          uint64_t v32 = 5;
                          while (1)
                          {
                            sub_1C1A0();
                            if (v129) {
                              break;
                            }
                            sub_1C1E4();
                            if (v34 == sub_1BE70()) {
                              goto LABEL_269;
                            }
                            sub_1C194();
                            if (v66) {
                              goto LABEL_198;
                            }
                          }
                          __break(1u);
                          goto LABEL_275;
                        }
LABEL_198:
                        sub_1C228();
                      }
                      swift_release();
                      swift_bridgeObjectRelease();
                      sub_1C440();
                      if (v66) {
                        goto LABEL_107;
                      }
                    }
                  }
                }
LABEL_221:
                sub_1C228();
              }
              swift_release();
              swift_bridgeObjectRelease();
              if (v2 == (const char *)v37) {
                goto LABEL_137;
              }
            }
          }
        }
LABEL_244:
        sub_1C228();
      }
      swift_release();
      swift_bridgeObjectRelease();
      if (v2 == (const char *)v37) {
        goto LABEL_137;
      }
    }
  }
LABEL_137:
  sub_1C31C();
  int v109 = 0;
LABEL_272:
  uint64_t v65 = (void *)v166;
LABEL_88:
  uint64_t v114 = v168[28];
  uint64_t v115 = v168[16];
  uint64_t v116 = v168[12];
  uint64_t v117 = v168[10];
  sub_1C09C();
  v118();
  sub_1C184();
  sub_38020(29);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  v178._uint64_t countAndFlagsBits = v164;
  v178._object = v65;
  sub_37E70(v178);
  swift_bridgeObjectRelease();
  v179._uint64_t countAndFlagsBits = 0x64696C6156736920;
  v179._object = (void *)0xEA0000000000203ALL;
  sub_37E70(v179);
  unsigned int v167 = v109;
  if (v109) {
    v119._uint64_t countAndFlagsBits = 1702195828;
  }
  else {
    v119._uint64_t countAndFlagsBits = 0x65736C6166;
  }
  if (v109) {
    uint64_t v120 = (void *)0xE400000000000000;
  }
  else {
    uint64_t v120 = (void *)0xE500000000000000;
  }
  v119._object = v120;
  sub_37E70(v119);
  swift_bridgeObjectRelease();
  sub_1C178();
  Logger.debug(output:test:caller:)(v121, v122, v123);
  swift_bridgeObjectRelease();
  swift_release();
  v159(v116, v117);
  uint64_t v0 = v168;
  v162(v114, v115);
  swift_bridgeObjectRelease();
LABEL_95:
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
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v124 = (uint64_t (*)(void))v0[1];
  return v124(v167);
}

uint64_t sub_1A000()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1A028()
{
  sub_1A000();
  return _swift_deallocClassInstance(v0, 40, 7);
}

uint64_t type metadata accessor for HomeAutomationCandidateSuggestionConfigurator()
{
  return self;
}

uint64_t sub_1A080()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1A118;
  return sub_17070();
}

uint64_t sub_1A118()
{
  sub_11914();
  sub_11820();
  uint64_t v1 = *v0;
  sub_1C0A8();
  *uint64_t v2 = v1;
  swift_task_dealloc();
  sub_1C210();
  return v3();
}

uint64_t sub_1A1D8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1A268;
  return sub_186FC();
}

uint64_t sub_1A268()
{
  sub_11914();
  uint64_t v2 = v1;
  sub_11820();
  uint64_t v3 = *v0;
  sub_1C0A8();
  *uint64_t v4 = v3;
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(uint64_t))(v3 + 8);
  return v5(v2);
}

char *sub_1A338(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_38110();
    __break(1u);
  }
  else if (__dst != __src || &__src[8 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 8 * a2);
  }
  return __src;
}

char *sub_1A3CC(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    __src = (char *)sub_38110();
    __break(1u);
  }
  else if (__dst != __src || &__src[2 * a2] <= __dst)
  {
    return (char *)memmove(__dst, __src, 2 * a2);
  }
  return __src;
}

char *sub_1A460(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    sub_1BDB4();
    unint64_t result = (char *)sub_1BFBC();
    __break(1u);
  }
  else if (a3 != result || &result[8 * a2] <= a3)
  {
    return (char *)sub_1BF40(a3, result);
  }
  return result;
}

char *sub_1A4BC(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    sub_1BDB4();
    unint64_t result = (char *)sub_1BFBC();
    __break(1u);
  }
  else if (a3 != result || &result[16 * a2] <= a3)
  {
    return (char *)sub_1BF40(a3, result);
  }
  return result;
}

char *sub_1A518(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    sub_1BDB4();
    unint64_t result = (char *)sub_1BFBC();
    __break(1u);
  }
  else if (a3 != result || &result[40 * a2] <= a3)
  {
    return (char *)sub_1BF40(a3, result);
  }
  return result;
}

void *sub_1A57C(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0 || (&__dst[8 * a2] > __src ? (BOOL v3 = &__src[8 * a2] > __dst) : (BOOL v3 = 0), v3))
  {
    unint64_t result = (void *)sub_38110();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, 8 * a2);
  }
  return result;
}

void *sub_1A658(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0 || (&__dst[2 * a2] > __src ? (BOOL v3 = &__src[2 * a2] > __dst) : (BOOL v3 = 0), v3))
  {
    unint64_t result = (void *)sub_38110();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, 2 * a2);
  }
  return result;
}

void *sub_1A734(char *__src, uint64_t a2, char *__dst)
{
  if (a2 < 0)
  {
    sub_1BDB4();
    sub_1C344();
LABEL_11:
    unint64_t result = (void *)sub_38110();
    __break(1u);
    return result;
  }
  if (&__dst[8 * a2] > __src && &__src[8 * a2] > __dst)
  {
    sub_1BDB4();
    sub_1C334();
    goto LABEL_11;
  }
  return memcpy(__dst, __src, 8 * a2);
}

uint64_t sub_1A7E8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a2 < 0)
  {
    sub_1BDB4();
    sub_1C344();
LABEL_11:
    uint64_t result = sub_38110();
    __break(1u);
    return result;
  }
  if (a3 + 16 * a2 > a1 && a1 + 16 * a2 > a3)
  {
    sub_1BDB4();
    sub_1C334();
    goto LABEL_11;
  }
  return swift_arrayInitWithCopy();
}

uint64_t sub_1A8A0(unint64_t a1, uint64_t a2, unint64_t a3, void (*a4)(void))
{
  if (a2 < 0)
  {
    sub_1BDB4();
    sub_1C344();
LABEL_11:
    uint64_t result = sub_38110();
    __break(1u);
    return result;
  }
  if (a3 + 8 * a2 > a1 && a1 + 8 * a2 > a3)
  {
    sub_1BDB4();
    sub_1C334();
    goto LABEL_11;
  }
  a4(0);
  return swift_arrayInitWithCopy();
}

unint64_t sub_1A978(uint64_t a1, uint64_t a2)
{
  sub_38190();
  sub_37E40();
  Swift::Int v4 = sub_381B0();
  return sub_1AAF8(a1, a2, v4);
}

unint64_t sub_1A9F0(uint64_t a1)
{
  sub_38190();
  Swift::UInt v2 = sub_379F0();
  sub_381A0(v2);
  Swift::Int v3 = sub_381B0();
  return sub_1ABDC(a1, v3);
}

unint64_t sub_1AA60(uint64_t a1)
{
  sub_37A80();
  sub_1BC0C(&qword_4D3D8, (void (*)(uint64_t))&type metadata accessor for HomeSuggestionType);
  uint64_t v2 = sub_37DD0();
  return sub_1ACC8(a1, v2);
}

unint64_t sub_1AAF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_38150() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        Swift::Bool v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_38150() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_1ABDC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v6 = sub_379F0();
    if (v6 != sub_379F0())
    {
      uint64_t v7 = ~v4;
      for (unint64_t i = (i + 1) & v7; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v7)
      {
        uint64_t v8 = sub_379F0();
        if (v8 == sub_379F0()) {
          break;
        }
      }
    }
  }
  return i;
}

unint64_t sub_1ACC8(uint64_t a1, uint64_t a2)
{
  uint64_t v19 = a1;
  uint64_t v4 = sub_37A80();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v18 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    Swift::Bool v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v12 = v5 + 16;
    BOOL v11 = v13;
    uint64_t v14 = *(void *)(v12 + 56);
    do
    {
      v11(v7, *(void *)(v20 + 48) + v14 * v9, v4);
      sub_1BC0C(&qword_4D3E0, (void (*)(uint64_t))&type metadata accessor for HomeSuggestionType);
      char v15 = sub_37DE0();
      (*(void (**)(char *, uint64_t))(v12 - 8))(v7, v4);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
    }
    while (((*(void *)(v18 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

char *sub_1AE88(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_1B0D8(a1, a2, a3, *v3);
  *uint64_t v3 = (uint64_t)result;
  return result;
}

void sub_1AEA8(char a1, uint64_t a2, char a3, uint64_t a4)
{
}

void sub_1AEB4(char a1, uint64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    sub_1C29C();
    if (v8 != v9)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
      }
      sub_1C3E4();
    }
  }
  sub_1C3D4();
  if (v4)
  {
    sub_2420(&qword_4D460);
    uint64_t v10 = (const void *)sub_1C500();
    size_t v11 = j__malloc_size(v10);
    sub_1C38C(v11 - 32);
  }
  uint64_t v12 = (char *)sub_1C37C();
  if (a1)
  {
    sub_1A338(v12, v13, v14);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1A57C(v12, v13, v14);
  }
  swift_release();
}

void sub_1AF68(char a1, uint64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    sub_1C29C();
    if (v8 != v9)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
      }
      sub_1C3E4();
    }
  }
  sub_1C3D4();
  if (v4)
  {
    sub_2420(&qword_4D468);
    uint64_t v10 = (const void *)sub_1C500();
    size_t v11 = j__malloc_size(v10);
    sub_1C38C(v11 - 32);
  }
  uint64_t v12 = (char *)sub_1C37C();
  if (a1)
  {
    sub_1A3CC(v12, v13, v14);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1A658(v12, v13, v14);
  }
  swift_release();
}

void sub_1B01C(char a1, uint64_t a2, char a3, uint64_t a4)
{
}

void sub_1B028(char a1, uint64_t a2, char a3, uint64_t a4)
{
  if (a3)
  {
    sub_1C29C();
    if (v8 != v9)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
      }
      sub_1C3E4();
    }
  }
  sub_1C3D4();
  if (v4)
  {
    sub_2420(v10);
    size_t v11 = (const void *)sub_1C500();
    size_t v12 = j__malloc_size(v11);
    sub_1C38C(v12 - 32);
  }
  uint64_t v13 = (char *)sub_1C37C();
  if (a1)
  {
    sub_1A460(v13, v14, v15);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1A734(v13, v14, v15);
  }
  swift_release();
}

char *sub_1B0D8(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    sub_2420(&qword_4D3D0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  size_t v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_1A4BC(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_1A7E8((unint64_t)v13, v8, (unint64_t)v12);
  }
  swift_release();
  return v10;
}

void *sub_1B1BC(unint64_t a1)
{
  return sub_1B318(a1, (void (*)(void))&type metadata accessor for Accessory, &qword_4D418, &qword_4D410, (uint64_t (*)(unsigned char *, uint64_t, unint64_t, uint64_t, uint64_t))sub_1B620);
}

void *sub_1B1F8(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  sub_2420(&qword_4D3C8);
  uint64_t v3 = (void *)swift_allocObject();
  size_t v4 = j__malloc_size(v3);
  v3[2] = v1;
  v3[3] = 2 * ((uint64_t)(v4 - 32) / 8);
  char v5 = sub_1B978(&v7, v3 + 4, v1, a1);
  swift_bridgeObjectRetain();
  sub_1BB0C();
  if (v5 != (void *)v1)
  {
    __break(1u);
    return _swiftEmptyArrayStorage;
  }
  return v3;
}

void *sub_1B2DC(unint64_t a1)
{
  return sub_1B318(a1, (void (*)(void))&type metadata accessor for Scene, &qword_4D428, &qword_4D420, (uint64_t (*)(unsigned char *, uint64_t, unint64_t, uint64_t, uint64_t))sub_1B670);
}

void *sub_1B318(unint64_t a1, void (*a2)(void), unint64_t *a3, uint64_t *a4, uint64_t (*a5)(unsigned char *, uint64_t, unint64_t, uint64_t, uint64_t))
{
  if (a1 >> 62) {
    goto LABEL_8;
  }
  uint64_t v10 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  if (!v10) {
    return _swiftEmptyArrayStorage;
  }
  while (1)
  {
    if (v10 <= 0)
    {
      size_t v11 = _swiftEmptyArrayStorage;
    }
    else
    {
      sub_2420(&qword_4CFD0);
      size_t v11 = (void *)sub_1C500();
      size_t v12 = j__malloc_size(v11);
      v11[2] = v10;
      v11[3] = (2 * ((uint64_t)(v12 - 32) / 8)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_1B470((uint64_t)(v11 + 4), v10, a1, a2, a3, a4, a5);
    a5 = v13;
    swift_bridgeObjectRelease();
    if (a5 == (uint64_t (*)(unsigned char *, uint64_t, unint64_t, uint64_t, uint64_t))v10) {
      break;
    }
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_380F0();
    swift_bridgeObjectRelease();
    if (!v10) {
      return _swiftEmptyArrayStorage;
    }
  }
  return v11;
}

uint64_t sub_1B438@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = -1;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  *a2 = a1;
  uint64_t v6 = *(void *)(a1 + 64);
  uint64_t result = a1 + 64;
  uint64_t v5 = v6;
  if (-v3 < 64) {
    uint64_t v2 = ~(-1 << -(char)v3);
  }
  a2[1] = result;
  a2[2] = ~v3;
  a2[3] = 0;
  a2[4] = v2 & v5;
  return result;
}

uint64_t sub_1B470(uint64_t result, uint64_t a2, unint64_t a3, void (*a4)(void), unint64_t *a5, uint64_t *a6, uint64_t (*a7)(unsigned char *, uint64_t, unint64_t, uint64_t, uint64_t))
{
  unint64_t v13 = result;
  unint64_t v14 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_380F0();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v15) {
      return a3;
    }
  }
  else
  {
    uint64_t v15 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8));
    if (!v15) {
      return a3;
    }
  }
  if (v13)
  {
    if (v14)
    {
      swift_bridgeObjectRetain();
      uint64_t v16 = sub_380F0();
      uint64_t result = swift_bridgeObjectRelease();
      if (v16 <= a2)
      {
        if (v15 >= 1)
        {
          uint64_t v17 = sub_1BCB0(a5, a6);
          swift_bridgeObjectRetain();
          for (uint64_t i = 0; i != v15; ++i)
          {
            uint64_t v19 = sub_2420(a6);
            uint64_t v20 = (void (*)(unsigned char *, void))a7(v23, i, a3, v19, v17);
            uint64_t v22 = *v21;
            swift_retain();
            v20(v23, 0);
            *(void *)(v13 + 8 * i) = v22;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8)) <= a2)
      {
        sub_1A8A0((a3 & 0xFFFFFFFFFFFFFF8) + 32, *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8)), v13, a4);
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

uint64_t (*sub_1B620())()
{
  uint64_t v1 = sub_1C48C();
  uint64_t v2 = sub_1C4B8((uint64_t)v1);
  *(void *)(v0 + 32) = sub_1B704(v2, v3);
  return sub_1B66C;
}

uint64_t (*sub_1B670())()
{
  uint64_t v1 = sub_1C48C();
  uint64_t v2 = sub_1C4B8((uint64_t)v1);
  *(void *)(v0 + 32) = sub_1B770(v2, v3);
  return sub_1B66C;
}

void sub_1B6BC(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t (*sub_1B704(uint64_t a1, uint64_t a2))()
{
  unint64_t v4 = sub_1C280(a1, a2);
  sub_3E4C(v4, v5, v6);
  if (v3) {
    uint64_t v7 = sub_38040();
  }
  else {
    uint64_t v7 = swift_retain();
  }
  *uint64_t v2 = v7;
  return sub_1BD4C;
}

uint64_t (*sub_1B770(uint64_t a1, uint64_t a2))()
{
  unint64_t v4 = sub_1C280(a1, a2);
  sub_3E4C(v4, v5, v6);
  if (v3) {
    uint64_t v7 = sub_38040();
  }
  else {
    uint64_t v7 = swift_retain();
  }
  *uint64_t v2 = v7;
  return sub_1B7DC;
}

uint64_t sub_1B7DC()
{
  return swift_release();
}

void *sub_1B7E4(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4 + 56;
  uint64_t v5 = -1;
  uint64_t v6 = -1 << *(unsigned char *)(a4 + 32);
  if (-v6 < 64) {
    uint64_t v5 = ~(-1 << -(char)v6);
  }
  unint64_t v7 = v5 & *(void *)(a4 + 56);
  if (!a2)
  {
    int64_t v8 = 0;
    a3 = 0;
LABEL_36:
    *uint64_t result = a4;
    result[1] = v4;
    result[2] = ~v6;
    result[3] = v8;
    result[4] = v7;
    return (void *)a3;
  }
  if (!a3)
  {
    int64_t v8 = 0;
    goto LABEL_36;
  }
  if (a3 < 0)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  int64_t v8 = 0;
  uint64_t v9 = 0;
  int64_t v10 = (unint64_t)(63 - v6) >> 6;
  while (v7)
  {
    unint64_t v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v12 = v11 | (v8 << 6);
LABEL_19:
    ++v9;
    *a2++ = *(void *)(*(void *)(a4 + 48) + 8 * v12);
    if (v9 == a3) {
      goto LABEL_36;
    }
  }
  int64_t v13 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_38;
  }
  if (v13 >= v10) {
    goto LABEL_31;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v13);
  if (v14) {
    goto LABEL_18;
  }
  v8 += 2;
  if (v13 + 1 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13;
    goto LABEL_35;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14)
  {
LABEL_14:
    int64_t v13 = v8;
LABEL_18:
    unint64_t v16 = __clz(__rbit64(v14));
    unint64_t v7 = (v14 - 1) & v14;
    unint64_t v12 = v16 + (v13 << 6);
    int64_t v8 = v13;
    goto LABEL_19;
  }
  int64_t v15 = v13 + 2;
  if (v13 + 2 >= v10) {
    goto LABEL_31;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_17:
    int64_t v13 = v15;
    goto LABEL_18;
  }
  int64_t v8 = v13 + 3;
  if (v13 + 3 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13 + 2;
    goto LABEL_35;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14) {
    goto LABEL_14;
  }
  int64_t v15 = v13 + 4;
  if (v13 + 4 >= v10)
  {
LABEL_31:
    unint64_t v7 = 0;
LABEL_35:
    a3 = v9;
    goto LABEL_36;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14) {
    goto LABEL_17;
  }
  while (1)
  {
    int64_t v13 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v13 >= v10)
    {
      unint64_t v7 = 0;
      int64_t v8 = v10 - 1;
      goto LABEL_35;
    }
    unint64_t v14 = *(void *)(v4 + 8 * v13);
    ++v15;
    if (v14) {
      goto LABEL_18;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

void *sub_1B978(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4 + 64;
  uint64_t v5 = -1;
  uint64_t v6 = -1 << *(unsigned char *)(a4 + 32);
  if (-v6 < 64) {
    uint64_t v5 = ~(-1 << -(char)v6);
  }
  unint64_t v7 = v5 & *(void *)(a4 + 64);
  if (!a2)
  {
    int64_t v8 = 0;
    a3 = 0;
LABEL_36:
    *uint64_t result = a4;
    result[1] = v4;
    result[2] = ~v6;
    result[3] = v8;
    result[4] = v7;
    return (void *)a3;
  }
  if (!a3)
  {
    int64_t v8 = 0;
    goto LABEL_36;
  }
  if (a3 < 0)
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  int64_t v8 = 0;
  uint64_t v9 = 0;
  int64_t v10 = (unint64_t)(63 - v6) >> 6;
  while (v7)
  {
    unint64_t v11 = __clz(__rbit64(v7));
    v7 &= v7 - 1;
    unint64_t v12 = v11 | (v8 << 6);
LABEL_19:
    ++v9;
    *a2++ = *(void *)(*(void *)(a4 + 48) + 8 * v12);
    if (v9 == a3) {
      goto LABEL_36;
    }
  }
  int64_t v13 = v8 + 1;
  if (__OFADD__(v8, 1))
  {
    __break(1u);
    goto LABEL_38;
  }
  if (v13 >= v10) {
    goto LABEL_31;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v13);
  if (v14) {
    goto LABEL_18;
  }
  v8 += 2;
  if (v13 + 1 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13;
    goto LABEL_35;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14)
  {
LABEL_14:
    int64_t v13 = v8;
LABEL_18:
    unint64_t v16 = __clz(__rbit64(v14));
    unint64_t v7 = (v14 - 1) & v14;
    unint64_t v12 = v16 + (v13 << 6);
    int64_t v8 = v13;
    goto LABEL_19;
  }
  int64_t v15 = v13 + 2;
  if (v13 + 2 >= v10) {
    goto LABEL_31;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14)
  {
LABEL_17:
    int64_t v13 = v15;
    goto LABEL_18;
  }
  int64_t v8 = v13 + 3;
  if (v13 + 3 >= v10)
  {
    unint64_t v7 = 0;
    int64_t v8 = v13 + 2;
    goto LABEL_35;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v8);
  if (v14) {
    goto LABEL_14;
  }
  int64_t v15 = v13 + 4;
  if (v13 + 4 >= v10)
  {
LABEL_31:
    unint64_t v7 = 0;
LABEL_35:
    a3 = v9;
    goto LABEL_36;
  }
  unint64_t v14 = *(void *)(v4 + 8 * v15);
  if (v14) {
    goto LABEL_17;
  }
  while (1)
  {
    int64_t v13 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v13 >= v10)
    {
      unint64_t v7 = 0;
      int64_t v8 = v10 - 1;
      goto LABEL_35;
    }
    unint64_t v14 = *(void *)(v4 + 8 * v13);
    ++v15;
    if (v14) {
      goto LABEL_18;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_1BB0C()
{
  return swift_release();
}

unint64_t sub_1BB18()
{
  unint64_t result = qword_4D3F8;
  if (!qword_4D3F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D3F8);
  }
  return result;
}

uint64_t sub_1BB64(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 64);
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
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 80);
  if (v1)
  {
    uint64_t v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v1 = *(void *)(a1 + 88);
  if (v1)
  {
    uint64_t v2 = 192;
    return __clz(__rbit64(v1)) + v2;
  }
  uint64_t v2 = 192;
  for (uint64_t i = 12; i - 8 < (unint64_t)(v3 + 63) >> 6; ++i)
  {
    unint64_t v1 = *(void *)(a1 + 8 * i);
    v2 += 64;
    if (v1) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

uint64_t sub_1BC0C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1BC54(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1BCB0(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_44C4(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1BD00()
{
  unint64_t result = qword_4D450;
  if (!qword_4D450)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D450);
  }
  return result;
}

uint64_t sub_1BD50(uint64_t a1)
{
  return a1 - 8;
}

uint64_t sub_1BD68()
{
  return *(void *)(v0 + 264);
}

uint64_t sub_1BD90()
{
  return v0;
}

uint64_t sub_1BDC8()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BDE8()
{
  return v0;
}

uint64_t sub_1BE10()
{
  return sub_38150();
}

uint64_t sub_1BE30()
{
  return v0;
}

uint64_t sub_1BE54()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1BE70()
{
  return sub_379F0();
}

uint64_t sub_1BE88()
{
  return swift_retain();
}

uint64_t sub_1BED8(uint64_t a1)
{
  v2[51] = a1;
  v2[52] = *(void *)(v3 + 16);
  v2[53] = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  return v1;
}

uint64_t sub_1BF24()
{
  return swift_bridgeObjectRetain();
}

void *sub_1BF40@<X0>(void *__dst@<X2>, const void *a2@<X8>)
{
  return memmove(__dst, a2, v2);
}

void sub_1BF5C(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v5 = v2;
  unint64_t v6 = 0xD00000000000008ALL;
  unint64_t v4 = a2 | 0x8000000000000000;
  Logger.debug(output:test:caller:)(*(Swift::String *)&a1, 0, *(Swift::String *)&v6);
}

uint64_t sub_1BF84()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1BF9C()
{
  return sub_37D30();
}

uint64_t sub_1BFBC()
{
  return sub_38110();
}

uint64_t sub_1BFE0()
{
  return sub_38150();
}

uint64_t sub_1C004(uint64_t a1)
{
  sub_3D38(v1, 1, 1, a1);
  return sub_37CF0();
}

uint64_t sub_1C050(uint64_t a1)
{
  sub_3D38(v1, 1, 1, a1);
  return sub_37CF0();
}

void sub_1C0B8(uint64_t a1@<X0>, uint64_t a2@<X5>, uint64_t a3@<X8>)
{
  uint64_t v8 = v4;
  unint64_t v9 = 0xD00000000000008ALL;
  unint64_t v6 = a3 | 0x8000000000000000;
  unint64_t v7 = (v3 - 32) | 0x8000000000000000;
  Logger.warning(output:test:file:function:line:)(*(Swift::String *)&a1, 0, *(Swift::String *)&v9, *(Swift::String *)&a2, 97);
}

uint64_t sub_1C0EC()
{
  return sub_38040();
}

uint64_t sub_1C12C(uint64_t a1)
{
  sub_3D38(v1, 1, 1, a1);
  return v2;
}

uint64_t sub_1C154()
{
  *(void *)(v1 + 432) = *(void *)(v2 + 8);
  *(void *)(v1 + 440) = (v2 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  return v0;
}

void sub_1C184()
{
  *(void *)(v0 - 88) = 0;
  *(void *)(v0 - 80) = 0xE000000000000000;
}

unint64_t sub_1C1AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16)
{
  *(void *)(v16 + 128) = a15;
  *(void *)(v16 + 136) = a16;
  return 0xD000000000000031;
}

void sub_1C1CC(Swift::String a1@<X1:X0>, uint64_t a2@<X8>)
{
  a1._object = (void *)((a2 - 32) | 0x8000000000000000);
  sub_37E70(a1);
}

uint64_t sub_1C1E4()
{
  return sub_379F0();
}

uint64_t sub_1C1FC()
{
  return v0;
}

uint64_t sub_1C210()
{
  return v0 + 8;
}

uint64_t sub_1C228()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1C240()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_1C258()
{
  return sub_38150();
}

uint64_t sub_1C280(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1C2BC()
{
  return v0;
}

char *sub_1C2D4@<X0>(unint64_t a1@<X8>)
{
  return sub_1AE88((char *)(a1 > 1), v1, 1);
}

uint64_t sub_1C2F8()
{
  *(void *)(v0 + 448) = *v1;
  *(void *)(v0 + 456) = v1[1];
  return swift_getObjectType();
}

uint64_t sub_1C31C()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_1C354()
{
  return swift_task_alloc();
}

uint64_t sub_1C37C()
{
  return v0 + 32;
}

void sub_1C38C(uint64_t a1@<X8>)
{
  *(void *)(v3 + 16) = v2;
  *(void *)(v3 + 24) = 2 * (a1 / v1);
}

uint64_t sub_1C3BC()
{
  return *(void *)(v0 + 240);
}

void sub_1C400()
{
  sub_38020(70);
}

void sub_1C420()
{
  sub_38020(50);
}

__n128 sub_1C44C(__n128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,__n128 a25)
{
  __n128 result = a25;
  a1[1] = a25;
  return result;
}

uint64_t sub_1C458()
{
  return *(void *)(v0 + 176);
}

uint64_t sub_1C46C()
{
  return sub_37CC0();
}

void *sub_1C48C()
{
  return malloc(0x28uLL);
}

uint64_t sub_1C4B8(uint64_t result)
{
  *uint64_t v1 = result;
  return result;
}

uint64_t sub_1C4E0()
{
  return sub_37D30();
}

uint64_t sub_1C500()
{
  return swift_allocObject();
}

double sub_1C518(uint64_t a1, double result)
{
  if (a1 == 3)
  {
    double v2 = (result + -32.0) * 5.0 / 9.0;
  }
  else
  {
    if (a1 != 2) {
      return result;
    }
    double v2 = result * 9.0 / 5.0 + 32.0;
  }
  return round(v2 * 10.0) / 10.0;
}

uint64_t sub_1C578()
{
  uint64_t v0 = sub_37A80();
  sub_4934(v0, qword_50A60);
  uint64_t v1 = sub_23E8(v0, (uint64_t)qword_50A60);
  uint64_t v2 = enum case for HomeSuggestionType.createAutomation(_:);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);
  return v3(v1, v2, v0);
}

uint64_t sub_1C600()
{
  uint64_t v0 = sub_37710();
  sub_4934(v0, qword_50A78);
  uint64_t v1 = (void *)sub_23E8(v0, (uint64_t)qword_50A78);
  *uint64_t v1 = sub_293D0();
  v1[1] = v2;
  uint64_t v3 = enum case for DialogDetails.catId(_:);
  uint64_t v4 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);
  return v4(v1, v3, v0);
}

ValueMetadata *type metadata accessor for CreateAutomationSuggestion()
{
  return &type metadata for CreateAutomationSuggestion;
}

uint64_t sub_1C6A8()
{
  sub_2420(&qword_4D470);
  uint64_t v0 = sub_37670();
  sub_4EA8();
  uint64_t v2 = v1;
  unint64_t v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_385B0;
  (*(void (**)(unint64_t, void, uint64_t))(v2 + 104))(v4 + v3, enum case for DeviceType.watch(_:), v0);
  return v4;
}

uint64_t sub_1C758@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 24);
  long long v11 = *(_OWORD *)(a1 + 32);
  sub_23A4((void *)a1, v3);
  if (qword_4CCF0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_37A80();
  sub_23E8(v4, (uint64_t)qword_50A60);
  uint64_t v5 = sub_37A70();
  uint64_t v7 = v6;
  uint64_t v8 = type metadata accessor for HomeAutomationCandidateSuggestionConfigurator();
  swift_allocObject();
  unint64_t v9 = sub_16A14(v5, v7);
  v12[3] = v8;
  v12[4] = sub_1CEA4(&qword_4D0C8, (void (*)(uint64_t))type metadata accessor for HomeAutomationCandidateSuggestionConfigurator);
  v12[0] = v9;
  *(void *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = v11;
  sub_3C6C((uint64_t *)a2);
  sub_37640();
  return sub_3C1C((uint64_t)v12);
}

uint64_t sub_1C8A4@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  *(void *)&long long v36 = a1;
  uint64_t v40 = a2;
  *(void *)&long long v39 = sub_2420(&qword_4D048);
  sub_4EA8();
  uint64_t v38 = v2;
  __chkstk_darwin(v3);
  uint64_t v37 = (char *)v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_37C30();
  sub_4EA8();
  uint64_t v7 = v6;
  __chkstk_darwin(v8);
  int64_t v10 = (char *)v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2420(&qword_4D050);
  long long v11 = (int *)type metadata accessor for ResolverParameterProperties();
  uint64_t v12 = *(void *)(*((void *)v11 - 1) + 72);
  unint64_t v13 = (*(unsigned __int8 *)(*((void *)v11 - 1) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*((void *)v11 - 1) + 80);
  uint64_t v14 = swift_allocObject();
  uint64_t v41 = v14;
  *(_OWORD *)(v14 + 16) = xmmword_38BB0;
  unint64_t v15 = v14 + v13;
  unint64_t v35 = *(void (**)(char *, void, uint64_t))(v7 + 104);
  uint64_t v16 = v5;
  v35(v10, enum case for SuggestionParameter.accessoryType(_:), v5);
  uint64_t v17 = type metadata accessor for AccessoryTypeResolver();
  swift_allocObject();
  uint64_t v18 = sub_2E370();
  uint64_t v19 = (uint64_t *)(v15 + v11[5]);
  v19[3] = v17;
  v19[4] = sub_1CEA4(&qword_4D0B8, (void (*)(uint64_t))type metadata accessor for AccessoryTypeResolver);
  uint64_t *v19 = v18;
  uint64_t v20 = *(void (**)(uint64_t, char *, uint64_t))(v7 + 32);
  v33[1] = v7 + 32;
  uint64_t v34 = v20;
  uint64_t v21 = v16;
  v20(v15, v10, v16);
  *(unsigned char *)(v15 + v11[6]) = 1;
  *(unsigned char *)(v15 + v11[7]) = 0;
  v33[0] = sub_2420(&qword_4D060);
  sub_375B0();
  uint64_t v22 = v15 + v12;
  v35(v10, enum case for SuggestionParameter.roomName(_:), v16);
  uint64_t v23 = type metadata accessor for RoomNameResolver();
  swift_allocObject();
  uint64_t v24 = sub_1D460();
  Swift::Bool v25 = (uint64_t *)(v22 + v11[5]);
  v25[3] = v23;
  v25[4] = sub_1CEA4((unint64_t *)&qword_4D0B0, (void (*)(uint64_t))type metadata accessor for RoomNameResolver);
  *Swift::Bool v25 = v24;
  v34(v22, v10, v21);
  *(unsigned char *)(v22 + v11[6]) = 1;
  *(unsigned char *)(v22 + v11[7]) = 0;
  sub_375B0();
  sub_4DCC(v36, (uint64_t)&v46);
  LODWORD(v23) = *(unsigned __int8 *)(v15 + v11[7]);
  sub_37800();
  swift_bridgeObjectRetain();
  sub_37C20();
  if (v23 == 1)
  {
    uint64_t v26 = sub_65D4();
    v27(v26);
    sub_6590();
  }
  else
  {
    sub_65B4();
  }
  uint64_t v28 = v48;
  long long v36 = v47;
  sub_23A4(&v46, v47);
  sub_37C20();
  sub_3BB8(v15 + v11[5], (uint64_t)v42);
  long long v44 = v36;
  uint64_t v45 = v28;
  sub_3C6C(v43);
  sub_378A0();
  swift_release();
  swift_bridgeObjectRelease();
  sub_4E30((uint64_t)v42);
  sub_3C1C((uint64_t)v43);
  LODWORD(v28) = *(unsigned __int8 *)(v22 + v11[7]);
  sub_37C20();
  if (v28 == 1)
  {
    uint64_t v29 = sub_65D4();
    v30(v29);
    sub_6590();
  }
  else
  {
    sub_65B4();
  }
  uint64_t v31 = v48;
  long long v39 = v47;
  sub_23A4(&v46, v47);
  sub_37C20();
  sub_3BB8(v22 + v11[5], (uint64_t)v42);
  long long v44 = v39;
  uint64_t v45 = v31;
  sub_3C6C(v43);
  sub_378A0();
  swift_release();
  swift_bridgeObjectRelease();
  sub_4E30((uint64_t)v42);
  sub_3C1C((uint64_t)v43);
  swift_bridgeObjectRelease();
  sub_4E90(&v46, v40);
  swift_setDeallocating();
  return sub_219FC();
}

uint64_t sub_1CEA4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1CEEC(uint64_t a1, uint64_t a2)
{
  v3[2] = a2;
  v3[3] = v2;
  uint64_t v4 = sub_37D90();
  v3[4] = v4;
  uint64_t v3[5] = *(void *)(v4 - 8);
  v3[6] = swift_task_alloc();
  v3[7] = swift_task_alloc();
  return _swift_task_switch(sub_1CFBC, 0, 0);
}

uint64_t sub_1CFBC()
{
  sub_23A4(*(void **)(v0 + 16), *(void *)(*(void *)(v0 + 16) + 24));
  *(void *)(v0 + 64) = sub_377B0();
  *(void *)(v0 + 72) = v1;
  *(void *)(v0 + 80) = swift_getObjectType();
  uint64_t v3 = sub_37F40();
  return _swift_task_switch(sub_1D06C, v3, v2);
}

uint64_t sub_1D06C()
{
  sub_2A5D8();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  swift_unknownObjectRelease();
  *(void *)(v0 + 88) = v2;
  *(void *)(v0 + 96) = v4;
  return _swift_task_switch(sub_1D0F4, 0, 0);
}

uint64_t sub_1D0F4()
{
  Swift::Bool v25 = v0;
  uint64_t v1 = (void *)v0[12];
  if (v1)
  {
    if (qword_4CD38 != -1) {
      swift_once();
    }
    uint64_t v2 = v0[11];
    uint64_t v3 = v0[7];
    uint64_t v4 = v0[4];
    uint64_t v5 = v0[5];
    uint64_t v6 = v0[3];
    uint64_t v7 = sub_23E8(v4, (uint64_t)static Log.suggestions);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v3, v7, v4);
    sub_38020(27);
    swift_bridgeObjectRelease();
    v24._uint64_t countAndFlagsBits = 0xD000000000000013;
    v24._object = (void *)0x800000000003A880;
    uint64_t v8 = *(void *)(v6 + 16);
    uint64_t v9 = *(void **)(v6 + 24);
    swift_bridgeObjectRetain();
    v27._uint64_t countAndFlagsBits = v8;
    v27._object = v9;
    sub_37E70(v27);
    swift_bridgeObjectRelease();
    v28._uint64_t countAndFlagsBits = 544175136;
    v28._object = (void *)0xE400000000000000;
    sub_37E70(v28);
    v29._uint64_t countAndFlagsBits = v2;
    v29._object = v1;
    sub_37E70(v29);
    v10._uint64_t countAndFlagsBits = 0xD000000000000013;
    v11._object = (void *)0x800000000003D6B0;
    v10._object = (void *)0x800000000003A880;
    v11._uint64_t countAndFlagsBits = 0xD000000000000077;
    Logger.debug(output:test:caller:)(v10, 0, v11);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
    sub_2420(&qword_4CEF0);
    uint64_t v12 = (void *)swift_allocObject();
    *((_OWORD *)v12 + 1) = xmmword_385B0;
    v12[7] = &type metadata for String;
    v12[4] = v2;
    void v12[5] = v1;
  }
  else
  {
    if (qword_4CD38 != -1) {
      swift_once();
    }
    uint64_t v14 = v0[5];
    uint64_t v13 = v0[6];
    uint64_t v16 = v0[3];
    uint64_t v15 = v0[4];
    uint64_t v17 = sub_23E8(v15, (uint64_t)static Log.suggestions);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v13, v17, v15);
    sub_38020(16);
    swift_bridgeObjectRelease();
    strcpy((char *)&v24, "Couldn't find ");
    HIBYTE(v24._object) = -18;
    uint64_t v18 = *(void *)(v16 + 16);
    uint64_t v19 = *(void **)(v16 + 24);
    swift_bridgeObjectRetain();
    v30._uint64_t countAndFlagsBits = v18;
    v30._object = v19;
    sub_37E70(v30);
    swift_bridgeObjectRelease();
    v20._uint64_t countAndFlagsBits = 0xD00000000000003FLL;
    v21._object = (void *)0x800000000003D6B0;
    v20._object = (void *)0x800000000003D100;
    v21._uint64_t countAndFlagsBits = 0xD000000000000077;
    Logger.warning(output:test:file:function:line:)(v24, 0, v21, v20, 18);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
    uint64_t v12 = _swiftEmptyArrayStorage;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v22 = (uint64_t (*)(void *))v0[1];
  return v22(v12);
}

uint64_t type metadata accessor for RoomNameResolver()
{
  return self;
}

uint64_t sub_1D460()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_37C30();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for SuggestionParameter.roomName(_:), v2);
  uint64_t v6 = sub_37C20();
  uint64_t v8 = v7;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *(void *)(v1 + 16) = v6;
  *(void *)(v1 + 24) = v8;
  return v1;
}

uint64_t sub_1D560(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_21FC;
  return sub_1CEEC((uint64_t)v4, a2);
}

uint64_t sub_1D5F8()
{
  return sub_1D660((unint64_t *)&unk_4D518);
}

uint64_t sub_1D62C()
{
  return sub_1D660(&qword_4D528);
}

uint64_t sub_1D660(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for RoomNameResolver();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1D6A0()
{
  sub_11914();
  v1[10] = v2;
  v1[11] = v0;
  uint64_t v3 = sub_37D90();
  v1[12] = v3;
  v1[13] = *(void *)(v3 - 8);
  v1[14] = swift_task_alloc();
  sub_11920();
  return _swift_task_switch(v4, v5, v6);
}

uint64_t sub_1D758()
{
  uint64_t v1 = (void *)v0[10];
  uint64_t v2 = v1[3];
  v0[15] = v2;
  v0[16] = v1[4];
  v0[17] = sub_23A4(v1, v2);
  v0[18] = sub_377B0();
  v0[19] = v3;
  v0[20] = swift_getObjectType();
  uint64_t v5 = sub_37F40();
  return _swift_task_switch(sub_1D818, v5, v4);
}

uint64_t sub_1D818()
{
  sub_11914();
  sub_2A7B4();
  *(unsigned char *)(v0 + 216) = v1;
  swift_unknownObjectRelease();
  sub_11920();
  return _swift_task_switch(v2, v3, v4);
}

uint64_t sub_1D888()
{
  int v2 = *(unsigned __int8 *)(v0 + 216);
  if (v2 != 2)
  {
    if (qword_4CD38 != -1) {
      swift_once();
    }
    uint64_t v9 = *(void *)(v0 + 104);
    uint64_t v8 = *(void *)(v0 + 112);
    Swift::String v11 = *(void **)(v0 + 88);
    uint64_t v10 = *(void *)(v0 + 96);
    sub_23E8(v10, (uint64_t)static Log.suggestions);
    uint64_t v12 = sub_1E478();
    v13(v12);
    sub_1E4C0();
    swift_bridgeObjectRelease();
    sub_1E430();
    v21._uint64_t countAndFlagsBits = v1;
    v21._object = v11;
    sub_37E70(v21);
    swift_bridgeObjectRelease();
    uint64_t v14 = (void *)0xE400000000000000;
    sub_1E490();
    if (v2) {
      v15._uint64_t countAndFlagsBits = 1702195828;
    }
    else {
      v15._uint64_t countAndFlagsBits = 0x65736C6166;
    }
    if ((v2 & 1) == 0) {
      uint64_t v14 = (void *)0xE500000000000000;
    }
    v15._object = v14;
    sub_37E70(v15);
    swift_bridgeObjectRelease();
    sub_1E454(v20, 0xD00000000000008CLL, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SiriHomeAutomation/HomeAutomationSiriSuggestions/Resolvers/IsSingleAccessoryOfTypeInHomeResolver.swift");
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
    sub_2420(&qword_4CEF0);
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_385B0;
    *(void *)(v16 + 56) = &type metadata for Bool;
    *(unsigned char *)(v16 + 32) = v2 & 1;
    swift_task_dealloc();
    sub_1E404();
    sub_1E414();
    __asm { BRAA            X2, X16 }
  }
  *(void *)(v0 + 168) = sub_377B0();
  *(void *)(v0 + 176) = v3;
  *(void *)(v0 + 184) = swift_getObjectType();
  sub_37F40();
  sub_1E414();
  return _swift_task_switch(v4, v5, v6);
}

uint64_t sub_1DAB4()
{
  sub_11914();
  sub_2A978();
  char v2 = v1;
  *(void *)(v0 + 64) = v3;
  *(unsigned char *)(v0 + 72) = v1;
  swift_unknownObjectRelease();
  *(unsigned char *)(v0 + 217) = v2;
  sub_11920();
  return _swift_task_switch(v4, v5, v6);
}

uint64_t sub_1DB30()
{
  if (*(unsigned char *)(v0 + 217))
  {
    if (qword_4CD38 != -1) {
      swift_once();
    }
    sub_23E8(*(void *)(v0 + 96), (uint64_t)static Log.suggestions);
    sub_1E4AC();
    Logger.debug(output:test:caller:)(v6, v7, v8);
    if (qword_4CD38 != -1) {
      swift_once();
    }
    uint64_t v10 = *(void *)(v0 + 104);
    uint64_t v9 = *(void *)(v0 + 112);
    uint64_t v12 = *(void *)(v0 + 88);
    uint64_t v11 = *(void *)(v0 + 96);
    uint64_t v13 = sub_23E8(v11, (uint64_t)static Log.suggestions);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v9, v13, v11);
    sub_38020(27);
    swift_bridgeObjectRelease();
    uint64_t v14 = *(void *)(v12 + 16);
    Swift::String v15 = *(void **)(v12 + 24);
    swift_bridgeObjectRetain();
    v23._uint64_t countAndFlagsBits = v14;
    v23._object = v15;
    sub_37E70(v23);
    swift_bridgeObjectRelease();
    sub_1E490();
    v24._uint64_t countAndFlagsBits = 0x65736C6166;
    v24._object = (void *)0xE500000000000000;
    sub_37E70(v24);
    swift_bridgeObjectRelease();
    sub_1E4AC();
    Logger.debug(output:test:caller:)(v16, v17, v18);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
    sub_2420(&qword_4CEF0);
    uint64_t v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_385B0;
    *(void *)(v19 + 56) = &type metadata for Bool;
    *(unsigned char *)(v19 + 32) = 0;
    swift_task_dealloc();
    uint64_t v20 = sub_1E404();
    return v21(v20);
  }
  else
  {
    uint64_t v1 = *(void *)(v0 + 88);
    uint64_t v2 = *(void *)(v1 + 16);
    uint64_t v3 = *(void **)(v1 + 24);
    type metadata accessor for SuggestionEntityRetrieval();
    *(void *)(v0 + 192) = swift_initStackObject();
    swift_bridgeObjectRetain();
    *(void *)(v0 + 200) = sub_2F6AC(v2, v3);
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 208) = v4;
    *uint64_t v4 = v0;
    v4[1] = sub_1DE2C;
    return sub_31EE8();
  }
}

uint64_t sub_1DE2C()
{
  sub_11914();
  sub_11820();
  *(unsigned char *)(v1 + 218) = v0;
  swift_task_dealloc();
  swift_release();
  sub_11920();
  return _swift_task_switch(v2, v3, v4);
}

void sub_1DF20()
{
  int v2 = *(unsigned __int8 *)(v0 + 218);
  if (qword_4CD38 != -1) {
    swift_once();
  }
  uint64_t v4 = *(void *)(v0 + 104);
  uint64_t v3 = *(void *)(v0 + 112);
  uint64_t v6 = *(void **)(v0 + 88);
  uint64_t v5 = *(void *)(v0 + 96);
  sub_23E8(v5, (uint64_t)static Log.suggestions);
  uint64_t v7 = sub_1E478();
  v8(v7);
  sub_1E4C0();
  swift_bridgeObjectRelease();
  sub_1E430();
  v15._uint64_t countAndFlagsBits = v1;
  v15._object = v6;
  sub_37E70(v15);
  swift_bridgeObjectRelease();
  uint64_t v9 = (void *)0xE400000000000000;
  sub_1E490();
  if (v2) {
    v10._uint64_t countAndFlagsBits = 1702195828;
  }
  else {
    v10._uint64_t countAndFlagsBits = 0x65736C6166;
  }
  if (!v2) {
    uint64_t v9 = (void *)0xE500000000000000;
  }
  v10._object = v9;
  sub_37E70(v10);
  swift_bridgeObjectRelease();
  sub_1E454(v14, 0xD00000000000008CLL, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SiriHomeAutomation/HomeAutomationSiriSuggestions/Resolvers/IsSingleAccessoryOfTypeInHomeResolver.swift");
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  sub_2420(&qword_4CEF0);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_385B0;
  *(void *)(v11 + 56) = &type metadata for Bool;
  *(unsigned char *)(v11 + 32) = v2;
  swift_task_dealloc();
  sub_1E404();
  sub_1E414();
  __asm { BRAA            X2, X16 }
}

uint64_t type metadata accessor for IsSingleAccessoryOfTypeInHomeResolver()
{
  return self;
}

uint64_t sub_1E0F8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_37C30();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for SuggestionParameter.isSingleAccessoryOfTypeInHome(_:), v2);
  uint64_t v6 = sub_37C20();
  uint64_t v8 = v7;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *(void *)(v1 + 16) = v6;
  *(void *)(v1 + 24) = v8;
  return v1;
}

uint64_t sub_1E1F8()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_1E290;
  return sub_1D6A0();
}

uint64_t sub_1E290()
{
  sub_11914();
  sub_11820();
  swift_task_dealloc();
  uint64_t v0 = sub_1E404();
  return v1(v0);
}

uint64_t sub_1E35C()
{
  return sub_1E3C4((unint64_t *)&unk_4D5D8);
}

uint64_t sub_1E390()
{
  return sub_1E3C4(&qword_4D5E8);
}

uint64_t sub_1E3C4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for IsSingleAccessoryOfTypeInHomeResolver();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1E404()
{
  return v0;
}

uint64_t sub_1E430()
{
  return swift_bridgeObjectRetain();
}

void sub_1E454(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v6 = v3;
  unint64_t v5 = (a3 - 32) | 0x8000000000000000;
  Logger.debug(output:test:caller:)(*(Swift::String *)&a1, 0, *(Swift::String *)&a2);
}

uint64_t sub_1E478()
{
  return v0;
}

void sub_1E490()
{
  v1._uint64_t countAndFlagsBits = 544175136;
  v1._object = (void *)0xE400000000000000;
  sub_37E70(v1);
}

void sub_1E4C0()
{
  sub_38020(27);
}

uint64_t sub_1E4E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3[35] = a1;
  v3[36] = a3;
  uint64_t v4 = sub_37970();
  v3[37] = v4;
  sub_1BD50(v4);
  v3[38] = v5;
  v3[39] = swift_task_alloc();
  v3[40] = sub_2420(&qword_4D600);
  v3[41] = sub_11974();
  v3[42] = swift_task_alloc();
  v3[43] = swift_task_alloc();
  v3[44] = sub_2420(&qword_4D608);
  v3[45] = sub_11974();
  v3[46] = swift_task_alloc();
  v3[47] = swift_task_alloc();
  v3[48] = swift_task_alloc();
  v3[49] = swift_task_alloc();
  v3[50] = swift_task_alloc();
  v3[51] = swift_task_alloc();
  v3[52] = swift_task_alloc();
  v3[53] = swift_task_alloc();
  uint64_t v6 = sub_37D90();
  v3[54] = v6;
  sub_1BD50(v6);
  v3[55] = v7;
  v3[56] = sub_11974();
  v3[57] = swift_task_alloc();
  return _swift_task_switch(sub_1E688, 0, 0);
}

uint64_t sub_1E688()
{
  Swift::String v1 = *(void **)(v0 + 280);
  sub_23A4(v1, v1[3]);
  uint64_t v2 = sub_376D0();
  if (!v3)
  {
LABEL_7:
    if (qword_4CD38 == -1)
    {
LABEL_8:
      uint64_t v6 = *(void *)(v0 + 456);
      uint64_t v7 = *(void *)(v0 + 432);
      uint64_t v8 = *(void *)(v0 + 440);
      sub_23E8(v7, (uint64_t)static Log.suggestions);
      sub_1C09C();
      v9();
      sub_21058();
      sub_38020(36);
      swift_bridgeObjectRelease();
      sub_21048(0xD000000000000022);
      *(void *)(v0 + 264) = sub_376D0();
      *(void *)(v0 + 272) = v10;
      sub_2420(&qword_4CFE0);
      v159._uint64_t countAndFlagsBits = sub_37E00();
      sub_37E70(v159);
      swift_bridgeObjectRelease();
      sub_20F20();
      Logger.warning(output:test:file:function:line:)(v11, v12, v13, v14, 22);
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
      goto LABEL_70;
    }
LABEL_84:
    swift_once();
    goto LABEL_8;
  }
  if (v2 == 7628147 && v3 == 0xE300000000000000)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v5 = sub_38150();
    swift_bridgeObjectRelease();
    if ((v5 & 1) == 0) {
      goto LABEL_7;
    }
  }
  sub_23A4(*(void **)(v0 + 280), v1[3]);
  uint64_t v15 = sub_376C0();
  unint64_t v16 = sub_207C4(v15);
  *(void *)(v0 + 464) = v16;
  swift_bridgeObjectRelease();
  if (!v16)
  {
    if (qword_4CD38 != -1) {
      swift_once();
    }
    uint64_t v98 = *(void *)(v0 + 456);
    uint64_t v99 = *(void *)(v0 + 432);
    uint64_t v100 = *(void *)(v0 + 440);
    uint64_t v101 = *(void **)(v0 + 280);
    sub_23E8(v99, (uint64_t)static Log.suggestions);
    sub_1C09C();
    v102();
    sub_21058();
    sub_38020(29);
    swift_bridgeObjectRelease();
    sub_21048(0xD00000000000001BLL);
    sub_23A4(v101, v1[3]);
    sub_376C0();
    sub_2420(&qword_4CFF8);
    v163._uint64_t countAndFlagsBits = sub_37DB0();
    sub_37E70(v163);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_20F20();
    Logger.warning(output:test:file:function:line:)(v103, v104, v105, v106, 27);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v100 + 8))(v98, v99);
    goto LABEL_70;
  }
  uint64_t v141 = (void *)(v0 + 16);
  uint64_t v142 = (long long *)(v0 + 56);
  if (qword_4CD38 != -1) {
    swift_once();
  }
  uint64_t v140 = (unsigned char *)(v0 + 689);
  uint64_t v17 = *(void *)(v0 + 456);
  uint64_t v19 = *(void *)(v0 + 432);
  uint64_t v18 = *(void *)(v0 + 440);
  *(void *)(v0 + 472) = sub_23E8(v19, (uint64_t)static Log.suggestions);
  *(void *)(v0 + 480) = *(void *)(v18 + 16);
  *(void *)(v0 + 488) = (v18 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  sub_1C09C();
  v20();
  sub_21058();
  sub_38020(21);
  swift_bridgeObjectRelease();
  sub_21048(0xD000000000000013);
  *(void *)(v0 + 496) = sub_37CA0();
  v160._uint64_t countAndFlagsBits = sub_37DB0();
  sub_37E70(v160);
  swift_bridgeObjectRelease();
  sub_20F20();
  Logger.debug(output:test:caller:)(v21, v22, v23);
  swift_bridgeObjectRelease();
  Swift::Bool v25 = *(void (**)(uint64_t, uint64_t))(v18 + 8);
  unint64_t v24 = v18 + 8;
  *(void *)(v0 + 504) = v25;
  *(void *)(v0 + 512) = v24 & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v25(v17, v19);
  uint64_t v26 = 0;
  char v27 = *(unsigned char *)(v16 + 32);
  uint64_t v28 = 1 << v27;
  *(unsigned char *)(v0 + 688) = v27;
  uint64_t v29 = -1 << (1 << v27);
  if (v28 < 64) {
    uint64_t v30 = ~v29;
  }
  else {
    uint64_t v30 = -1;
  }
  uint64_t v31 = v30 & *(void *)(v16 + 64);
  uint64_t v32 = &enum case for SiriHintUseCase.getStateOfTemperature(_:);
  *(_DWORD *)(v0 + 648) = enum case for SiriHintUseCase.dimLights(_:);
  *(_DWORD *)(v0 + 652) = enum case for SiriHintUseCase.getStateOfAirQuality(_:);
  *(_DWORD *)(v0 + 656) = enum case for SiriHintUseCase.getStateOfDoorLocks(_:);
  *(_DWORD *)(v0 + 660) = enum case for SiriHintUseCase.getStateOfGarageDoors(_:);
  *(_DWORD *)(v0 + 664) = enum case for SiriHintUseCase.getStateOfSecuritySystems(_:);
  *(_DWORD *)(v0 + 668) = enum case for SiriHintUseCase.getStateOfHumidity(_:);
  *(_DWORD *)(v0 + 672) = enum case for SiriHintUseCase.getStateOfLightsPower(_:);
  *(_DWORD *)(v0 + 676) = enum case for SiriHintUseCase.getStateOfTemperature(_:);
  *(_DWORD *)(v0 + 680) = enum case for SiriHintUseCase.getStateOfWindows(_:);
  *(_DWORD *)(v0 + 684) = enum case for Objective.discoverability(_:);
  uint64_t v158 = v0;
  while (1)
  {
    *(void *)(v0 + 520) = _swiftEmptyArrayStorage;
    if (v31)
    {
      sub_20FEC();
      goto LABEL_33;
    }
    if (__OFADD__(v26, 1))
    {
      __break(1u);
LABEL_83:
      __break(1u);
      goto LABEL_84;
    }
    uint64_t v34 = sub_20FD0();
    if (v37 == v38) {
      goto LABEL_69;
    }
    uint64_t v39 = v34 + 64;
    if (!*(void *)(v34 + 64 + 8 * v36))
    {
      int64_t v40 = v35 >> 6;
      if (v36 + 1 >= v40) {
        goto LABEL_69;
      }
      if (!*(void *)(v39 + 8 * (v36 + 1)))
      {
        if (v36 + 2 >= v40) {
          goto LABEL_69;
        }
        if (!*(void *)(v39 + 8 * (v36 + 2)))
        {
          uint64_t v41 = v36 + 3;
          if (v41 < v40)
          {
            if (!*(void *)(v39 + 8 * v41))
            {
              while (1)
              {
                uint64_t v42 = v41 + 1;
                if (__OFADD__(v41, 1)) {
                  goto LABEL_83;
                }
                if (v42 >= v40) {
                  goto LABEL_69;
                }
                ++v41;
                if (*(void *)(v39 + 8 * v42)) {
                  goto LABEL_32;
                }
              }
            }
            goto LABEL_32;
          }
LABEL_69:
          swift_release();
LABEL_70:
          sub_20F94();
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
          swift_task_dealloc();
          swift_task_dealloc();
          sub_20F78();
          __asm { BRAA            X2, X16 }
        }
      }
    }
LABEL_32:
    sub_21030();
LABEL_33:
    sub_210A4(v33);
    uint64_t v43 = *(void *)(v0 + 352);
    uint64_t v154 = *(void *)(v158 + 344);
    long long v46 = (uint64_t *)(*(void *)(v44 + 48) + 16 * v45);
    uint64_t v47 = *v46;
    uint64_t v48 = v46[1];
    *uint64_t v49 = *v46;
    v49[1] = v48;
    sub_20F00();
    uint64_t v157 = v50;
    uint64_t v54 = v53 + *(int *)(v43 + 48);
    uint64_t v56 = *(void (**)(uint64_t, uint64_t, void *))(v55 + 16);
    uint64_t v57 = (void *)(v55 + 16);
    v56(v54, v52 + *(void *)(v55 + 72) * v51, v32);
    unint64_t v58 = v16 + *(int *)(v43 + 48);
    *(void *)unint64_t v16 = v47;
    *(void *)(v16 + 8) = v48;
    (*(void (**)(unint64_t, uint64_t, void *))(v157 + 32))(v58, v54, v32);
    uint64_t v59 = *(int *)(v43 + 48);
    *(void *)unint64_t v24 = v47;
    *(void *)(v24 + 8) = v48;
    unint64_t v152 = v58;
    unint64_t v60 = v58;
    uint64_t v61 = v48;
    uint64_t v62 = v47;
    uint64_t v153 = (void (*)(char *, unint64_t, uint64_t))v56;
    v56(v24 + v59, v60, v32);
    swift_bridgeObjectRetain_n();
    sub_37BC0();
    unint64_t v63 = *(void (**)(void))(v157 + 8);
    sub_20F48();
    v63();
    uint64_t v64 = sub_37BD0();
    uint64_t v0 = v158;
    if (sub_3DBC(v154, 1, v64) == 1) {
      goto LABEL_34;
    }
    uint64_t v143 = v63;
    uint64_t v144 = v47;
    int v76 = *(_DWORD *)(v158 + 648);
    sub_20E80(*(void *)(v158 + 344), *(void *)(v158 + 336));
    sub_20F30();
    uint64_t v77 = sub_2108C();
    int v79 = v78(v77);
    uint64_t v156 = v61;
    if (v79 == v76)
    {
      v80 = qword_50A90;
      if (qword_4CD00 == -1) {
        goto LABEL_62;
      }
LABEL_61:
      swift_once();
      goto LABEL_62;
    }
    if (v79 == *(_DWORD *)(v158 + 652))
    {
      v80 = qword_50990;
      if (qword_4CCB0 == -1) {
        goto LABEL_62;
      }
      goto LABEL_61;
    }
    if (v79 == *(_DWORD *)(v158 + 656))
    {
      v80 = qword_50C38;
      if (qword_4CDB0 == -1) {
        goto LABEL_62;
      }
      goto LABEL_61;
    }
    if (v79 == *(_DWORD *)(v158 + 660))
    {
      v80 = qword_50960;
      if (qword_4CCA0 == -1) {
        goto LABEL_62;
      }
      goto LABEL_61;
    }
    if (v79 == *(_DWORD *)(v158 + 664))
    {
      v80 = qword_50C68;
      if (qword_4CDC0 == -1) {
        goto LABEL_62;
      }
      goto LABEL_61;
    }
    if (v79 == *(_DWORD *)(v158 + 668))
    {
      v80 = qword_508D0;
      if (qword_4CC70 == -1) {
        goto LABEL_62;
      }
      goto LABEL_61;
    }
    if (v79 == *(_DWORD *)(v158 + 672))
    {
      v80 = qword_50900;
      if (qword_4CC80 == -1) {
        goto LABEL_62;
      }
      goto LABEL_61;
    }
    if (v79 == *(_DWORD *)(v158 + 676))
    {
      v80 = qword_50A00;
      if (qword_4CCD0 == -1) {
        goto LABEL_62;
      }
      goto LABEL_61;
    }
    if (v79 != *(_DWORD *)(v158 + 680))
    {
      uint64_t v96 = sub_21074();
      v97(v96);
      uint64_t v62 = v47;
LABEL_34:
      uint64_t v65 = *(void *)(v158 + 496);
      Swift::String v155 = *(void (**)(uint64_t, uint64_t))(v158 + 504);
      uint64_t v66 = *(void *)(v158 + 456);
      uint64_t v145 = *(void *)(v158 + 432);
      unint64_t v67 = *(void **)(v158 + 408);
      uint64_t v68 = *(void *)(v158 + 352);
      uint64_t v147 = *(void *)(v158 + 344);
      (*(void (**)(uint64_t, void))(v158 + 480))(v66, *(void *)(v158 + 472));
      *(void *)(v158 + 184) = 0;
      *(void *)(v158 + 192) = 0xE000000000000000;
      sub_38020(29);
      swift_bridgeObjectRelease();
      *(void *)(v158 + 200) = 0xD00000000000001BLL;
      *(void *)(v158 + 208) = 0x800000000003D9B0;
      uint64_t v69 = (char *)v67 + *(int *)(v68 + 48);
      *unint64_t v67 = v62;
      v67[1] = v61;
      v153(v69, v152, v65);
      swift_bridgeObjectRetain();
      sub_37BC0();
      ((void (*)(char *, uint64_t))v63)(v69, v65);
      uint64_t v0 = v158;
      v161._uint64_t countAndFlagsBits = sub_37E00();
      sub_37E70(v161);
      swift_bridgeObjectRelease();
      sub_20F20();
      v70._object = (void *)0x800000000003D930;
      Logger.warning(output:test:file:function:line:)(v71, v72, v73, v70, 64);
      swift_bridgeObjectRelease();
      v155(v66, v145);
      sub_3D60(v147, &qword_4D600);
      swift_bridgeObjectRelease();
      uint64_t v74 = 0;
      uint64_t v75 = 0;
      goto LABEL_64;
    }
    v80 = qword_508A0;
    if (qword_4CC60 != -1) {
      goto LABEL_61;
    }
LABEL_62:
    unsigned int v148 = *(_DWORD *)(v158 + 684);
    uint64_t v81 = *(void *)(v158 + 344);
    uint64_t v82 = *(void *)(v158 + 304);
    uint64_t v83 = *(void *)(v158 + 312);
    uint64_t v84 = *(void **)(v158 + 288);
    uint64_t v85 = *(void *)(v158 + 296);
    uint64_t v86 = sub_37A80();
    sub_23E8(v86, (uint64_t)v80);
    uint64_t v74 = sub_37A70();
    uint64_t v75 = v87;
    *(void *)(v158 + 544) = v87;
    *(void *)(v158 + 552) = v74;
    sub_3D60(v81, &qword_4D600);
    sub_23A4(v84, v84[3]);
    swift_bridgeObjectRetain();
    sub_37DC0();
    (*(void (**)(uint64_t, void, uint64_t))(v82 + 104))(v83, v148, v85);
    sub_378B0();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v82 + 8))(v83, v85);
    if (*(void *)(v158 + 80)) {
      break;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_3D60((uint64_t)v142, &qword_4D610);
LABEL_64:
    uint64_t v88 = *(void (**)(void *, uint64_t))(v0 + 504);
    uint64_t v89 = *(void **)(v0 + 456);
    uint64_t v90 = *(void *)(v0 + 432);
    unint64_t v16 = *(void *)(v0 + 416);
    (*(void (**)(void *, void, uint64_t))(v0 + 480))(v89, *(void *)(v0 + 472), v90);
    *(void *)(v0 + 152) = 0;
    *(void *)(v0 + 160) = 0xE000000000000000;
    sub_38020(44);
    swift_bridgeObjectRelease();
    *(void *)(v0 + 136) = 0xD00000000000002ALL;
    *(void *)(v0 + 144) = 0x800000000003D9D0;
    *(void *)(v0 + 168) = v74;
    *(void *)(v0 + 176) = v75;
    sub_2420(&qword_4CFE0);
    v162._uint64_t countAndFlagsBits = sub_37E00();
    sub_37E70(v162);
    swift_bridgeObjectRelease();
    unint64_t v24 = *(void *)(v0 + 144);
    sub_21014();
    uint64_t v32 = v89;
    Logger.warning(output:test:file:function:line:)(v91, v92, v93, v94, v95);
    swift_bridgeObjectRelease();
    v88(v89, v90);
    sub_3D60(v16, &qword_4D608);
    uint64_t v31 = *(void *)(v0 + 536);
    uint64_t v26 = *(void *)(v0 + 528);
  }
  uint64_t v109 = *(void *)(v158 + 496);
  Swift::String v110 = *(char **)(v158 + 400);
  uint64_t v111 = *(void *)(v158 + 352);
  swift_bridgeObjectRelease();
  sub_20EE8(v142, (uint64_t)v141);
  uint64_t v112 = *(int *)(v111 + 48);
  *(void *)Swift::String v110 = v144;
  *((void *)v110 + 1) = v156;
  v153(&v110[v112], v152, v109);
  sub_37C60();
  if (v113)
  {
    sub_20F48();
    v143();
    uint64_t v114 = sub_210F0();
  }
  else
  {
    sub_20F48();
    v143();
    uint64_t v114 = sub_379E0();
    char v116 = v115 & 1;
  }
  *uint64_t v140 = v116;
  *(void *)(v158 + 560) = v114;
  uint64_t v117 = sub_210BC(*(void **)(v158 + 392));
  ((void (*)(char *, unint64_t))v153)(v117, v152);
  sub_37C60();
  if (v118)
  {
    sub_20F48();
    v143();
    uint64_t v119 = sub_210F0();
  }
  else
  {
    sub_20F48();
    v143();
    uint64_t v119 = sub_37A10();
    char v121 = v120 & 1;
  }
  sub_20FB4(v119, v121);
  uint64_t v146 = v123;
  uint64_t v149 = v122;
  unint64_t v150 = *(void **)(v158 + 368);
  uint64_t v151 = *(void **)(v158 + 360);
  sub_23A4(v141, *(void *)(v158 + 40));
  *(void *)(v158 + 576) = sub_377B0();
  *(void *)(v158 + 584) = v124;
  *(void *)(v158 + 592) = swift_getObjectType();
  *uint64_t v57 = v144;
  v57[1] = v156;
  sub_20F6C();
  ((void (*)(void))v153)();
  *(void *)(v158 + 600) = sub_37C50();
  *(void *)(v158 + 608) = v125;
  uint64_t v126 = sub_21008();
  ((void (*)(uint64_t))v143)(v126);
  *uint64_t v146 = v144;
  v146[1] = v156;
  uint64_t v127 = sub_20F54();
  ((void (*)(uint64_t))v153)(v127);
  *(void *)(v158 + 616) = sub_37C90();
  *(void *)(v158 + 624) = v128;
  sub_21008();
  sub_21068();
  v143();
  *uint64_t v149 = v144;
  v149[1] = v156;
  uint64_t v129 = sub_20F54();
  ((void (*)(uint64_t))v153)(v129);
  *(void *)(v158 + 632) = sub_37C70();
  *(void *)(v158 + 640) = v130;
  sub_21008();
  sub_21068();
  v143();
  *unint64_t v150 = v144;
  v150[1] = v156;
  uint64_t v131 = sub_20F54();
  ((void (*)(uint64_t))v153)(v131);
  v140[2] = sub_37C80() & 1;
  uint64_t v132 = sub_21008();
  ((void (*)(uint64_t))v143)(v132);
  *uint64_t v151 = v144;
  v151[1] = v156;
  sub_20F6C();
  v133();
  swift_bridgeObjectRelease();
  v140[3] = sub_37C40() & 1;
  uint64_t v134 = sub_210DC();
  ((void (*)(uint64_t))v143)(v134);
  sub_37F40();
  sub_20F78();
  return _swift_task_switch(v135, v136, v137);
}

uint64_t sub_1F854()
{
  sub_2AB80(*(void *)(v0 + 560), *(unsigned char *)(v0 + 689), *(void *)(v0 + 600), *(void *)(v0 + 608), *(void *)(v0 + 616), *(void *)(v0 + 624), *(void *)(v0 + 568), *(unsigned char *)(v0 + 690), *(void *)(v0 + 632), *(void *)(v0 + 640), *(unsigned char *)(v0 + 691), *(unsigned char *)(v0 + 692));
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_1F940, 0, 0);
}

uint64_t sub_1F940()
{
  uint64_t v1 = *(void *)(v0 + 552);
  uint64_t v2 = *(void **)(v0 + 544);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t))(v0 + 504);
  uint64_t v4 = *(void *)(v0 + 448);
  uint64_t v5 = *(void *)(v0 + 432);
  (*(void (**)(uint64_t, void, uint64_t))(v0 + 480))(v4, *(void *)(v0 + 472), v5);
  *(void *)(v0 + 232) = 0;
  *(void *)(v0 + 240) = 0xE000000000000000;
  sub_38020(41);
  uint64_t v6 = *(void *)(v0 + 240);
  *(void *)(v0 + 216) = *(void *)(v0 + 232);
  *(void *)(v0 + 224) = v6;
  v125._uint64_t countAndFlagsBits = 0xD000000000000016;
  v125._object = (void *)0x800000000003DA00;
  sub_37E70(v125);
  v126._uint64_t countAndFlagsBits = v1;
  v126._object = v2;
  sub_37E70(v126);
  swift_bridgeObjectRelease();
  v127._uint64_t countAndFlagsBits = 0x6F63206874697720;
  v127._object = (void *)0xEF203A747865746ELL;
  sub_37E70(v127);
  sub_23A4((void *)(v0 + 16), *(void *)(v0 + 40));
  *(void *)(v0 + 248) = sub_377B0();
  unint64_t v7 = v0 + 248;
  uint64_t v8 = (long long *)(v0 + 96);
  *(void *)(v0 + 256) = v9;
  sub_2420(&qword_4D618);
  sub_380B0();
  swift_unknownObjectRelease();
  sub_20F20();
  Logger.debug(output:test:caller:)(v10, v11, v12);
  swift_bridgeObjectRelease();
  v3(v4, v5);
  Swift::String v106 = (void *)(v0 + 16);
  sub_3BB8(v0 + 16, v0 + 96);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  char v118 = *(char **)(v0 + 520);
  if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
LABEL_68:
  }
    char v118 = sub_33324(0, *((void *)v118 + 2) + 1, 1, (uint64_t)v118);
  unint64_t v15 = *((void *)v118 + 2);
  unint64_t v14 = *((void *)v118 + 3);
  unint64_t v16 = (char *)(v15 + 1);
  uint64_t v108 = (long long *)(v7 - 192);
  if (v15 >= v14 >> 1) {
    char v118 = sub_33324((char *)(v14 > 1), v15 + 1, 1, (uint64_t)v118);
  }
  Swift::String v105 = (unsigned char *)(v7 + 441);
  uint64_t v17 = *(void **)(v0 + 416);
  *((void *)v118 + 2) = v16;
  sub_20EE8(v8, (uint64_t)&v118[40 * v15 + 32]);
  sub_3D60((uint64_t)v17, &qword_4D608);
  sub_3C1C((uint64_t)v106);
  uint64_t v119 = v0;
  while (1)
  {
    uint64_t v18 = *(void *)(v0 + 536);
    uint64_t v19 = *(void *)(v0 + 528);
    *(void *)(v0 + 520) = v118;
    if (v18)
    {
      sub_20FEC();
    }
    else
    {
      if (__OFADD__(v19, 1))
      {
        __break(1u);
LABEL_67:
        __break(1u);
        goto LABEL_68;
      }
      uint64_t v21 = sub_20FD0();
      if (v24 == v25) {
        goto LABEL_54;
      }
      uint64_t v26 = v21 + 64;
      if (!*(void *)(v21 + 64 + 8 * v23))
      {
        int64_t v27 = v22 >> 6;
        if (v23 + 1 >= v27) {
          goto LABEL_54;
        }
        if (!*(void *)(v26 + 8 * (v23 + 1)))
        {
          if (v23 + 2 >= v27) {
            goto LABEL_54;
          }
          if (!*(void *)(v26 + 8 * (v23 + 2)))
          {
            uint64_t v28 = v23 + 3;
            if (v28 >= v27)
            {
LABEL_54:
              swift_release();
              sub_20F94();
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
              swift_task_dealloc();
              swift_task_dealloc();
              sub_20F78();
              __asm { BRAA            X2, X16 }
            }
            if (!*(void *)(v26 + 8 * v28))
            {
              do
              {
                uint64_t v29 = v28 + 1;
                if (__OFADD__(v28, 1)) {
                  goto LABEL_67;
                }
                if (v29 >= v27) {
                  goto LABEL_54;
                }
                ++v28;
              }
              while (!*(void *)(v26 + 8 * v29));
            }
          }
        }
      }
      sub_21030();
    }
    sub_210A4(v20);
    uint64_t v30 = *(void *)(v0 + 352);
    uint64_t v122 = *(void *)(v0 + 344);
    uint64_t v33 = (uint64_t *)(*(void *)(v31 + 48) + 16 * v32);
    uint64_t v34 = *v33;
    uint64_t v35 = v33[1];
    uint64_t *v36 = *v33;
    v36[1] = v35;
    sub_20F00();
    uint64_t v124 = v37;
    uint64_t v39 = v38 + *(int *)(v30 + 48);
    uint64_t v41 = *(void *)(v40 + 16);
    sub_210D0();
    ((void (*)(void))v41)();
    uint64_t v42 = (char *)v17 + *(int *)(v30 + 48);
    *uint64_t v17 = v34;
    v17[1] = v35;
    (*(void (**)(char *, uint64_t, char *))(v124 + 32))(v42, v39, v16);
    uint64_t v43 = (char *)(v15 + *(int *)(v30 + 48));
    *(void *)unint64_t v15 = v34;
    *(void *)(v15 + 8) = v35;
    char v120 = (void (*)(char *, char *, uint64_t))v41;
    char v121 = v42;
    sub_210D0();
    ((void (*)(void))v41)();
    uint64_t v44 = v35;
    uint64_t v45 = v34;
    uint64_t v0 = v119;
    swift_bridgeObjectRetain_n();
    sub_37BC0();
    long long v46 = *(void (**)(void))(v124 + 8);
    ((void (*)(char *, char *))v46)(v43, v16);
    uint64_t v47 = sub_37BD0();
    if (sub_3DBC(v122, 1, v47) == 1) {
      goto LABEL_22;
    }
    uint64_t v107 = v46;
    uint64_t v110 = v34;
    int v59 = *(_DWORD *)(v119 + 648);
    sub_20E80(*(void *)(v119 + 344), *(void *)(v119 + 336));
    sub_20F30();
    uint64_t v60 = sub_2108C();
    int v62 = v61(v60);
    uint64_t v123 = v44;
    if (v62 == v59)
    {
      unint64_t v63 = qword_50A90;
      if (qword_4CD00 == -1) {
        goto LABEL_50;
      }
LABEL_49:
      swift_once();
      goto LABEL_50;
    }
    if (v62 == *(_DWORD *)(v119 + 652))
    {
      unint64_t v63 = qword_50990;
      if (qword_4CCB0 == -1) {
        goto LABEL_50;
      }
      goto LABEL_49;
    }
    if (v62 == *(_DWORD *)(v119 + 656))
    {
      unint64_t v63 = qword_50C38;
      if (qword_4CDB0 == -1) {
        goto LABEL_50;
      }
      goto LABEL_49;
    }
    if (v62 == *(_DWORD *)(v119 + 660))
    {
      unint64_t v63 = qword_50960;
      if (qword_4CCA0 == -1) {
        goto LABEL_50;
      }
      goto LABEL_49;
    }
    if (v62 == *(_DWORD *)(v119 + 664))
    {
      unint64_t v63 = qword_50C68;
      if (qword_4CDC0 == -1) {
        goto LABEL_50;
      }
      goto LABEL_49;
    }
    if (v62 == *(_DWORD *)(v119 + 668))
    {
      unint64_t v63 = qword_508D0;
      if (qword_4CC70 == -1) {
        goto LABEL_50;
      }
      goto LABEL_49;
    }
    if (v62 == *(_DWORD *)(v119 + 672))
    {
      unint64_t v63 = qword_50900;
      if (qword_4CC80 == -1) {
        goto LABEL_50;
      }
      goto LABEL_49;
    }
    if (v62 == *(_DWORD *)(v119 + 676))
    {
      unint64_t v63 = qword_50A00;
      if (qword_4CCD0 == -1) {
        goto LABEL_50;
      }
      goto LABEL_49;
    }
    if (v62 != *(_DWORD *)(v119 + 680))
    {
      uint64_t v79 = sub_21074();
      v80(v79);
LABEL_22:
      uint64_t v48 = *(void *)(v119 + 496);
      uint64_t v49 = *(void **)(v119 + 408);
      uint64_t v50 = *(void *)(v119 + 352);
      uint64_t v111 = *(void *)(v119 + 344);
      uint64_t v112 = *(void (**)(uint64_t, uint64_t))(v119 + 504);
      uint64_t v109 = *(void *)(v119 + 432);
      uint64_t v51 = *(void *)(v119 + 456);
      (*(void (**)(void))(v119 + 480))();
      *(void *)(v119 + 184) = 0;
      *(void *)(v119 + 192) = 0xE000000000000000;
      sub_38020(29);
      swift_bridgeObjectRelease();
      *(void *)(v119 + 200) = 0xD00000000000001BLL;
      *(void *)(v119 + 208) = 0x800000000003D9B0;
      uint64_t v52 = (char *)v49 + *(int *)(v50 + 48);
      *uint64_t v49 = v45;
      v49[1] = v44;
      v120(v52, v121, v48);
      swift_bridgeObjectRetain();
      sub_37BC0();
      ((void (*)(char *, uint64_t))v46)(v52, v48);
      v128._uint64_t countAndFlagsBits = sub_37E00();
      sub_37E70(v128);
      swift_bridgeObjectRelease();
      sub_20F20();
      v54._object = (void *)0x800000000003D930;
      v53._object = (void *)0x800000000003D890;
      Logger.warning(output:test:file:function:line:)(v55, v56, v53, v54, 64);
      swift_bridgeObjectRelease();
      v112(v51, v109);
      sub_3D60(v111, &qword_4D600);
      swift_bridgeObjectRelease();
      uint64_t v57 = 0;
      uint64_t v58 = 0;
      goto LABEL_52;
    }
    unint64_t v63 = qword_508A0;
    if (qword_4CC60 != -1) {
      goto LABEL_49;
    }
LABEL_50:
    uint64_t v0 = v119;
    unsigned int v113 = *(_DWORD *)(v119 + 684);
    uint64_t v64 = *(void *)(v119 + 344);
    uint64_t v65 = *(void *)(v119 + 304);
    uint64_t v66 = *(void *)(v119 + 312);
    uint64_t v68 = *(void **)(v119 + 288);
    uint64_t v67 = *(void *)(v119 + 296);
    uint64_t v69 = sub_37A80();
    sub_23E8(v69, (uint64_t)v63);
    uint64_t v57 = sub_37A70();
    uint64_t v58 = v70;
    *(void *)(v119 + 544) = v70;
    *(void *)(v119 + 552) = v57;
    sub_3D60(v64, &qword_4D600);
    sub_23A4(v68, v68[3]);
    swift_bridgeObjectRetain();
    sub_37DC0();
    (*(void (**)(uint64_t, void, uint64_t))(v65 + 104))(v66, v113, v67);
    sub_378B0();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v66, v67);
    if (*(void *)(v119 + 80)) {
      break;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_3D60((uint64_t)v108, &qword_4D610);
LABEL_52:
    Swift::String v71 = *(void (**)(char *, uint64_t))(v0 + 504);
    uint64_t v8 = *(long long **)(v0 + 512);
    Swift::Bool v72 = *(char **)(v0 + 456);
    uint64_t v73 = *(void *)(v0 + 432);
    uint64_t v17 = *(void **)(v0 + 416);
    (*(void (**)(char *, void, uint64_t))(v0 + 480))(v72, *(void *)(v0 + 472), v73);
    *(void *)(v0 + 152) = 0;
    *(void *)(v0 + 160) = 0xE000000000000000;
    sub_38020(44);
    swift_bridgeObjectRelease();
    *(void *)(v0 + 136) = 0xD00000000000002ALL;
    *(void *)(v0 + 144) = 0x800000000003D9D0;
    *(void *)(v0 + 168) = v57;
    *(void *)(v0 + 176) = v58;
    sub_2420(&qword_4CFE0);
    v129._uint64_t countAndFlagsBits = sub_37E00();
    unint64_t v7 = 0xD000000000000092;
    sub_37E70(v129);
    swift_bridgeObjectRelease();
    unint64_t v15 = *(void *)(v0 + 144);
    sub_21014();
    unint64_t v16 = v72;
    Logger.warning(output:test:file:function:line:)(v74, v75, v76, v77, v78);
    swift_bridgeObjectRelease();
    v71(v72, v73);
    sub_3D60((uint64_t)v17, &qword_4D608);
  }
  uint64_t v83 = *(void **)(v119 + 400);
  swift_bridgeObjectRelease();
  sub_20EE8(v108, (uint64_t)v106);
  *uint64_t v83 = v110;
  v83[1] = v123;
  sub_210D0();
  ((void (*)(void))v41)();
  sub_37C60();
  if (v84)
  {
    sub_20F48();
    v107();
    uint64_t v85 = sub_210F0();
  }
  else
  {
    sub_20F48();
    v107();
    uint64_t v85 = sub_379E0();
    char v87 = v86 & 1;
  }
  *Swift::String v105 = v87;
  *(void *)(v119 + 560) = v85;
  sub_210BC(*(void **)(v119 + 392));
  sub_210D0();
  ((void (*)(void))v41)();
  sub_37C60();
  if (v88)
  {
    sub_20F48();
    v107();
    uint64_t v89 = sub_210F0();
  }
  else
  {
    sub_20F48();
    v107();
    uint64_t v89 = sub_37A10();
    char v91 = v90 & 1;
  }
  sub_20FB4(v89, v91);
  uint64_t v114 = v93;
  char v115 = v92;
  char v116 = *(void **)(v119 + 368);
  uint64_t v117 = *(void **)(v119 + 360);
  sub_23A4(v106, *(void *)(v119 + 40));
  *(void *)(v119 + 576) = sub_377B0();
  *(void *)(v119 + 584) = v94;
  *(void *)(v119 + 592) = swift_getObjectType();
  *(void *)uint64_t v41 = v110;
  *(void *)(v41 + 8) = v123;
  sub_1C09C();
  ((void (*)(void))v41)();
  *(void *)(v119 + 600) = sub_37C50();
  *(void *)(v119 + 608) = v95;
  uint64_t v96 = sub_21008();
  ((void (*)(uint64_t))v107)(v96);
  *uint64_t v114 = v110;
  v114[1] = v123;
  sub_20F6C();
  ((void (*)(void))v41)();
  *(void *)(v119 + 616) = sub_37C90();
  *(void *)(v119 + 624) = v97;
  uint64_t v98 = sub_210DC();
  ((void (*)(uint64_t))v107)(v98);
  *char v115 = v110;
  v115[1] = v123;
  sub_20F6C();
  ((void (*)(void))v41)();
  *(void *)(v119 + 632) = sub_37C70();
  *(void *)(v119 + 640) = v99;
  sub_21008();
  sub_21068();
  v107();
  *char v116 = v110;
  v116[1] = v123;
  sub_20F6C();
  ((void (*)(void))v41)();
  v105[2] = sub_37C80() & 1;
  sub_21068();
  v107();
  *uint64_t v117 = v110;
  v117[1] = v123;
  sub_20F6C();
  ((void (*)(void))v41)();
  swift_bridgeObjectRelease();
  v105[3] = sub_37C40() & 1;
  sub_21068();
  v107();
  sub_37F40();
  sub_20F78();
  return _swift_task_switch(v100, v101, v102);
}

unint64_t sub_207C4(uint64_t a1)
{
  uint64_t v2 = sub_2420(&qword_4D620);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v48 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = sub_2420(&qword_4D608);
  __chkstk_darwin(v58);
  uint64_t v57 = (char *)&v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v56 = sub_2420(&qword_4D628);
  __chkstk_darwin(v56);
  unint64_t v7 = (uint64_t *)((char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v8 = sub_37CA0();
  uint64_t v60 = *(void *)(v8 - 8);
  uint64_t v9 = __chkstk_darwin(v8);
  Swift::Bool v11 = (char *)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  Swift::String v54 = (char *)&v48 - v13;
  __chkstk_darwin(v12);
  Swift::String v53 = (char *)&v48 - v14;
  if (*(void *)(a1 + 16))
  {
    sub_2420(&qword_4D630);
    unint64_t v15 = (void *)sub_38100();
  }
  else
  {
    unint64_t v15 = &_swiftEmptyDictionarySingleton;
  }
  sub_1B434(a1);
  uint64_t v61 = v66[6];
  uint64_t v52 = v66[7];
  uint64_t v16 = v68;
  uint64_t v48 = v67;
  int64_t v51 = (unint64_t)(v67 + 64) >> 6;
  unint64_t v17 = v69;
  int v59 = v66;
  uint64_t v18 = (void (**)(char *))(v60 + 32);
  uint64_t v49 = v15 + 8;
  uint64_t v50 = v60 + 40;
  unint64_t result = swift_bridgeObjectRetain();
  Swift::String v55 = v11;
  if (!v17) {
    goto LABEL_6;
  }
LABEL_5:
  uint64_t v62 = (v17 - 1) & v17;
  int64_t v63 = v16;
  for (unint64_t i = __clz(__rbit64(v17)) | (v16 << 6); ; unint64_t i = __clz(__rbit64(v22)) + (v23 << 6))
  {
    char v25 = (uint64_t *)(*(void *)(v61 + 48) + 16 * i);
    uint64_t v26 = *v25;
    uint64_t v27 = v25[1];
    uint64_t v28 = (uint64_t)v59;
    sub_4DCC(*(void *)(v61 + 56) + 48 * i, (uint64_t)v59);
    v65[0] = v26;
    v65[1] = v27;
    sub_4DCC(v28, (uint64_t)v64);
    swift_bridgeObjectRetain_n();
    sub_3D60((uint64_t)v65, &qword_4D638);
    sub_2420(&qword_4CFF8);
    if (!swift_dynamicCast())
    {
      sub_3D38((uint64_t)v4, 1, 1, v8);
      swift_bridgeObjectRelease();
      sub_3D60((uint64_t)v4, &qword_4D620);
      sub_1BB0C();
      swift_release();
      return 0;
    }
    sub_3D38((uint64_t)v4, 0, 1, v8);
    uint64_t v29 = v4;
    uint64_t v30 = *v18;
    uint64_t v31 = v54;
    uint64_t v32 = v29;
    (*v18)(v54);
    uint64_t v33 = &v57[*(int *)(v58 + 48)];
    ((void (*)(char *, char *, uint64_t))v30)(v33, v31, v8);
    uint64_t v34 = v56;
    uint64_t v35 = (char *)v7 + *(int *)(v56 + 48);
    *unint64_t v7 = v26;
    v7[1] = v27;
    ((void (*)(char *, char *, uint64_t))v30)(v35, v33, v8);
    uint64_t v36 = (char *)v7 + *(int *)(v34 + 48);
    uint64_t v37 = *v7;
    uint64_t v38 = v7[1];
    uint64_t v39 = v53;
    ((void (*)(char *, char *, uint64_t))v30)(v53, v36, v8);
    uint64_t v40 = v55;
    ((void (*)(char *, char *, uint64_t))v30)(v55, v39, v8);
    unint64_t result = sub_1A978(v37, v38);
    unint64_t v41 = result;
    if (v42)
    {
      uint64_t v43 = (uint64_t *)(v15[6] + 16 * result);
      swift_bridgeObjectRelease();
      *uint64_t v43 = v37;
      v43[1] = v38;
      unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v60 + 40))(v15[7] + *(void *)(v60 + 72) * v41, v40, v8);
      goto LABEL_28;
    }
    if (v15[2] >= v15[3]) {
      break;
    }
    *(void *)((char *)v49 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v44 = (uint64_t *)(v15[6] + 16 * result);
    *uint64_t v44 = v37;
    v44[1] = v38;
    unint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v30)(v15[7] + *(void *)(v60 + 72) * result, v40, v8);
    uint64_t v45 = v15[2];
    BOOL v46 = __OFADD__(v45, 1);
    uint64_t v47 = v45 + 1;
    if (v46) {
      goto LABEL_34;
    }
    v15[2] = v47;
LABEL_28:
    unint64_t v17 = v62;
    uint64_t v16 = v63;
    uint64_t v4 = v32;
    if (v62) {
      goto LABEL_5;
    }
LABEL_6:
    int64_t v21 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      goto LABEL_35;
    }
    if (v21 >= v51) {
      goto LABEL_31;
    }
    unint64_t v22 = *(void *)(v52 + 8 * v21);
    int64_t v23 = v16 + 1;
    if (!v22)
    {
      int64_t v23 = v16 + 2;
      if (v16 + 2 >= v51) {
        goto LABEL_31;
      }
      unint64_t v22 = *(void *)(v52 + 8 * v23);
      if (!v22)
      {
        int64_t v23 = v16 + 3;
        if (v16 + 3 >= v51) {
          goto LABEL_31;
        }
        unint64_t v22 = *(void *)(v52 + 8 * v23);
        if (!v22)
        {
          int64_t v23 = v16 + 4;
          if (v16 + 4 >= v51) {
            goto LABEL_31;
          }
          unint64_t v22 = *(void *)(v52 + 8 * v23);
          if (!v22)
          {
            int64_t v23 = v16 + 5;
            if (v16 + 5 >= v51) {
              goto LABEL_31;
            }
            unint64_t v22 = *(void *)(v52 + 8 * v23);
            if (!v22)
            {
              int64_t v24 = v16 + 6;
              while (v24 < v51)
              {
                unint64_t v22 = *(void *)(v52 + 8 * v24++);
                if (v22)
                {
                  int64_t v23 = v24 - 1;
                  goto LABEL_21;
                }
              }
LABEL_31:
              sub_1BB0C();
              return (unint64_t)v15;
            }
          }
        }
      }
    }
LABEL_21:
    uint64_t v62 = (v22 - 1) & v22;
    int64_t v63 = v23;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
  return result;
}

uint64_t sub_20E80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2420(&qword_4D600);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_20EE8(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_20F54()
{
  return v0;
}

uint64_t sub_20F94()
{
  return *(void *)(v0 + 456);
}

uint64_t sub_20FB4@<X0>(uint64_t result@<X0>, char a2@<W8>)
{
  *(unsigned char *)(v2 + 1) = a2;
  *(void *)(v3 + 568) = result;
  return result;
}

uint64_t sub_20FD0()
{
  return *(void *)(v0 + 464);
}

uint64_t sub_20FEC()
{
  return *(void *)(v0 + 464);
}

uint64_t sub_21008()
{
  return v0;
}

void sub_21048(uint64_t a1@<X8>)
{
  *(void *)(v2 - 96) = a1;
  *(void *)(v2 - 88) = (v1 - 32) | 0x8000000000000000;
}

void sub_21058()
{
  *(void *)(v0 - 96) = 0;
  *(void *)(v0 - 88) = 0xE000000000000000;
}

uint64_t sub_21074()
{
  return *(void *)(v0 + 336);
}

uint64_t sub_2108C()
{
  return v0;
}

void sub_210A4(uint64_t a1@<X8>)
{
  *(void *)(v2 + 536) = v1;
  *(void *)(v2 + 528) = a1;
}

char *sub_210BC@<X0>(void *a1@<X8>)
{
  uint64_t v4 = (char *)a1 + *(int *)(v1 + 48);
  *a1 = v3;
  a1[1] = v2;
  return v4;
}

uint64_t sub_210DC()
{
  return v0;
}

uint64_t sub_210F0()
{
  return 0;
}

uint64_t sub_210FC()
{
  uint64_t v0 = sub_37A80();
  sub_4934(v0, qword_50A90);
  uint64_t v1 = sub_23E8(v0, (uint64_t)qword_50A90);
  uint64_t v2 = enum case for HomeSuggestionType.dimLights(_:);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);
  return v3(v1, v2, v0);
}

uint64_t sub_21184()
{
  uint64_t v0 = sub_37710();
  sub_4934(v0, qword_50AA8);
  uint64_t v1 = (void *)sub_23E8(v0, (uint64_t)qword_50AA8);
  *uint64_t v1 = sub_293F4();
  v1[1] = v2;
  uint64_t v3 = enum case for DialogDetails.catId(_:);
  uint64_t v4 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);
  return v4(v1, v3, v0);
}

ValueMetadata *type metadata accessor for DimLightsSuggestion()
{
  return &type metadata for DimLightsSuggestion;
}

uint64_t sub_2122C@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v44 = a1;
  uint64_t v45 = a2;
  uint64_t v47 = sub_2420(&qword_4D048);
  sub_4EA8();
  uint64_t v46 = v2;
  __chkstk_darwin(v3);
  v51.n128_u64[0] = (unint64_t)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_37C30();
  sub_4EA8();
  uint64_t v7 = v6;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2420(&qword_4D050);
  Swift::Bool v11 = (int *)type metadata accessor for ResolverParameterProperties();
  unint64_t v12 = (*(unsigned __int8 *)(*((void *)v11 - 1) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*((void *)v11 - 1) + 80);
  uint64_t v40 = *(void *)(*((void *)v11 - 1) + 72);
  uint64_t v13 = v40;
  uint64_t v14 = swift_allocObject();
  uint64_t v52 = v14;
  *(_OWORD *)(v14 + 16) = xmmword_38BF0;
  unint64_t v15 = v14 + v12;
  uint64_t v43 = *(void (**)(char *, void, uint64_t))(v7 + 104);
  v43(v10, enum case for SuggestionParameter.hasTargetedMoreThanOneEntity(_:), v5);
  uint64_t HasTargetedMoreThanOneEntityResolver = type metadata accessor for HasTargetedMoreThanOneEntityResolver();
  swift_allocObject();
  uint64_t v17 = sub_2030();
  uint64_t v18 = (uint64_t *)(v15 + v11[5]);
  v18[3] = HasTargetedMoreThanOneEntityResolver;
  v18[4] = sub_219B4(&qword_4D640, (void (*)(uint64_t))type metadata accessor for HasTargetedMoreThanOneEntityResolver);
  *uint64_t v18 = v17;
  uint64_t v19 = *(void (**)(unint64_t, char *, uint64_t))(v7 + 32);
  uint64_t v41 = v7 + 32;
  char v42 = v19;
  v19(v15, v10, v5);
  *(unsigned char *)(v15 + v11[6]) = 1;
  *(unsigned char *)(v15 + v11[7]) = 0;
  uint64_t v50 = sub_2420(&qword_4D060);
  v49.n128_u64[0] = (unint64_t)&type metadata for Any + 8;
  uint64_t v48 = sub_36818;
  sub_375B0();
  unint64_t v20 = v15 + v13;
  int64_t v21 = v43;
  v43(v10, enum case for SuggestionParameter.containerName(_:), v5);
  uint64_t v22 = type metadata accessor for ContainerNameResolver();
  swift_allocObject();
  uint64_t v23 = sub_13624();
  int64_t v24 = (uint64_t *)(v15 + v13 + v11[5]);
  v24[3] = v22;
  v24[4] = sub_219B4(&qword_4D648, (void (*)(uint64_t))type metadata accessor for ContainerNameResolver);
  *int64_t v24 = v23;
  uint64_t v39 = v10;
  uint64_t v25 = v5;
  uint64_t v38 = v5;
  uint64_t v26 = v5;
  uint64_t v27 = v42;
  v42(v20, v10, v26);
  *(unsigned char *)(v20 + v11[6]) = 0;
  *(unsigned char *)(v20 + v11[7]) = 0;
  sub_706C();
  unint64_t v28 = v15 + 2 * v40;
  v21(v10, enum case for SuggestionParameter.accessoryName(_:), v25);
  uint64_t v29 = type metadata accessor for AccessoryNameResolver();
  swift_allocObject();
  uint64_t v30 = sub_28518();
  uint64_t v31 = (uint64_t *)(v28 + v11[5]);
  v31[3] = v29;
  v31[4] = sub_219B4(&qword_4D0C0, (void (*)(uint64_t))type metadata accessor for AccessoryNameResolver);
  *uint64_t v31 = v30;
  v27(v28, v39, v38);
  *(unsigned char *)(v28 + v11[6]) = 0;
  *(unsigned char *)(v28 + v11[7]) = 0;
  sub_706C();
  sub_4DCC(v44, (uint64_t)&v55);
  LODWORD(v10) = *(unsigned __int8 *)(v15 + v11[7]);
  uint64_t v32 = sub_37800();
  swift_bridgeObjectRetain();
  sub_37C20();
  sub_7108();
  uint64_t v50 = v32;
  if (v10 == 1)
  {
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v46 + 16))(v51.n128_u64[0], v15 + v11[8], v47);
    sub_377E0();
  }
  else
  {
    sub_377F0();
  }
  __n128 v49 = v56;
  sub_70C0(v56.n128_f64[0]);
  sub_37C20();
  sub_3BB8(v15 + v11[5], (uint64_t)v53);
  sub_7118(v49);
  sub_703C();
  swift_release();
  swift_bridgeObjectRelease();
  sub_4E30((uint64_t)v53);
  sub_3C1C((uint64_t)v54);
  char v33 = *(unsigned char *)(v20 + v11[7]);
  sub_37C20();
  sub_7108();
  if (v33)
  {
    uint64_t v34 = v47;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v46 + 16))(v51.n128_u64[0], v20 + v11[8], v47);
    sub_7098();
  }
  else
  {
    sub_70E4();
    uint64_t v34 = v47;
  }
  __n128 v49 = v56;
  sub_70C0(v56.n128_f64[0]);
  sub_37C20();
  sub_3BB8(v20 + v11[5], (uint64_t)v53);
  sub_7118(v49);
  sub_703C();
  swift_release();
  swift_bridgeObjectRelease();
  sub_4E30((uint64_t)v53);
  sub_3C1C((uint64_t)v54);
  char v35 = *(unsigned char *)(v28 + v11[7]);
  sub_37C20();
  sub_7108();
  if (v35)
  {
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v46 + 16))(v51.n128_u64[0], v28 + v11[8], v34);
    sub_7098();
  }
  else
  {
    sub_70E4();
  }
  __n128 v51 = v56;
  sub_70C0(v56.n128_f64[0]);
  sub_37C20();
  sub_3BB8(v28 + v11[5], (uint64_t)v53);
  sub_7118(v51);
  sub_378A0();
  swift_release();
  swift_bridgeObjectRelease();
  sub_4E30((uint64_t)v53);
  sub_3C1C((uint64_t)v54);
  swift_bridgeObjectRelease();
  sub_4E90(&v55, v45);
  swift_setDeallocating();
  return sub_219FC();
}

uint64_t sub_219B4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_219FC()
{
  type metadata accessor for ResolverParameterProperties();
  swift_arrayDestroy();
  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t sub_21A78()
{
  uint64_t v0 = sub_37A80();
  sub_4934(v0, qword_50AC0);
  uint64_t v1 = sub_23E8(v0, (uint64_t)qword_50AC0);
  uint64_t v2 = enum case for HomeSuggestionType.setScene(_:);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);
  return v3(v1, v2, v0);
}

uint64_t sub_21B00()
{
  uint64_t v0 = sub_37710();
  sub_4934(v0, qword_50AD8);
  uint64_t v1 = (void *)sub_23E8(v0, (uint64_t)qword_50AD8);
  *uint64_t v1 = sub_29418();
  v1[1] = v2;
  uint64_t v3 = enum case for DialogDetails.catId(_:);
  uint64_t v4 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);
  return v4(v1, v3, v0);
}

ValueMetadata *type metadata accessor for SetSceneSuggestion()
{
  return &type metadata for SetSceneSuggestion;
}

uint64_t sub_21BA8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 24);
  long long v11 = *(_OWORD *)(a1 + 32);
  sub_23A4((void *)a1, v3);
  if (qword_4CD10 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_37A80();
  sub_23E8(v4, (uint64_t)qword_50AC0);
  uint64_t v5 = sub_37A70();
  uint64_t v7 = v6;
  uint64_t v8 = type metadata accessor for HomeAutomationCandidateSuggestionConfigurator();
  swift_allocObject();
  uint64_t v9 = sub_16A14(v5, v7);
  v12[3] = v8;
  v12[4] = sub_220F0(&qword_4D0C8, (void (*)(uint64_t))type metadata accessor for HomeAutomationCandidateSuggestionConfigurator);
  v12[0] = v9;
  *(void *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = v11;
  sub_3C6C((uint64_t *)a2);
  sub_37640();
  return sub_3C1C((uint64_t)v12);
}

uint64_t sub_21CF4@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  *(void *)&long long v23 = a1;
  int64_t v24 = a2;
  uint64_t v22 = sub_2420(&qword_4D048);
  sub_4EA8();
  uint64_t v21 = v2;
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_37C30();
  sub_4EA8();
  uint64_t v8 = v7;
  __chkstk_darwin(v9);
  long long v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2420(&qword_4D050);
  unint64_t v12 = (int *)type metadata accessor for ResolverParameterProperties();
  unint64_t v13 = (*(unsigned __int8 *)(*((void *)v12 - 1) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*((void *)v12 - 1) + 80);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_385B0;
  unint64_t v15 = v14 + v13;
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v11, enum case for SuggestionParameter.sceneName(_:), v6);
  uint64_t v16 = type metadata accessor for SceneNameResolver();
  swift_allocObject();
  uint64_t v17 = sub_2D9FC();
  uint64_t v18 = (uint64_t *)(v15 + v12[5]);
  v18[3] = v16;
  v18[4] = sub_220F0(&qword_4D650, (void (*)(uint64_t))type metadata accessor for SceneNameResolver);
  *uint64_t v18 = v17;
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v15, v11, v6);
  *(unsigned char *)(v15 + v12[6]) = 1;
  *(unsigned char *)(v15 + v12[7]) = 0;
  sub_2420(&qword_4D060);
  sub_375B0();
  sub_4DCC(v23, (uint64_t)&v29);
  LODWORD(v16) = *(unsigned __int8 *)(v15 + v12[7]);
  sub_37800();
  swift_bridgeObjectRetain();
  sub_37C20();
  if (v16 == 1)
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v21 + 16))(v5, v15 + v12[8], v22);
    sub_377E0();
  }
  else
  {
    sub_377F0();
  }
  uint64_t v19 = v31;
  long long v23 = v30;
  sub_23A4(&v29, v30);
  sub_37C20();
  sub_3BB8(v15 + v12[5], (uint64_t)v25);
  long long v27 = v23;
  uint64_t v28 = v19;
  sub_3C6C(v26);
  sub_378A0();
  swift_release();
  swift_bridgeObjectRelease();
  sub_4E30((uint64_t)v25);
  sub_3C1C((uint64_t)v26);
  swift_bridgeObjectRelease();
  sub_4E90(&v29, v24);
  swift_setDeallocating();
  return sub_219FC();
}

uint64_t sub_220F0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_22138()
{
  uint64_t v0 = sub_37A80();
  sub_4934(v0, qword_50AF0);
  uint64_t v1 = sub_23E8(v0, (uint64_t)qword_50AF0);
  uint64_t v2 = enum case for HomeSuggestionType.setClimateMode(_:);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);
  return v3(v1, v2, v0);
}

uint64_t sub_221C0()
{
  uint64_t v0 = sub_37710();
  sub_4934(v0, qword_50B08);
  uint64_t v1 = (void *)sub_23E8(v0, (uint64_t)qword_50B08);
  *uint64_t v1 = sub_2943C();
  v1[1] = v2;
  uint64_t v3 = enum case for DialogDetails.catId(_:);
  uint64_t v4 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);
  return v4(v1, v3, v0);
}

ValueMetadata *type metadata accessor for SetClimateModeSuggestion()
{
  return &type metadata for SetClimateModeSuggestion;
}

uint64_t sub_22268@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 24);
  long long v11 = *(_OWORD *)(a1 + 32);
  sub_23A4((void *)a1, v3);
  if (qword_4CD20 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_37A80();
  sub_23E8(v4, (uint64_t)qword_50AF0);
  uint64_t v5 = sub_37A70();
  uint64_t v7 = v6;
  uint64_t v8 = type metadata accessor for HomeAutomationCandidateSuggestionConfigurator();
  swift_allocObject();
  uint64_t v9 = sub_16A14(v5, v7);
  v12[3] = v8;
  v12[4] = sub_229B0(&qword_4D0C8, (void (*)(uint64_t))type metadata accessor for HomeAutomationCandidateSuggestionConfigurator);
  v12[0] = v9;
  *(void *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = v11;
  sub_3C6C((uint64_t *)a2);
  sub_37640();
  return sub_3C1C((uint64_t)v12);
}

uint64_t sub_223B4@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  *(void *)&long long v36 = a1;
  uint64_t v40 = a2;
  *(void *)&long long v39 = sub_2420(&qword_4D048);
  sub_4EA8();
  uint64_t v38 = v2;
  __chkstk_darwin(v3);
  uint64_t v37 = (char *)v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_37C30();
  sub_4EA8();
  uint64_t v7 = v6;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v33 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2420(&qword_4D050);
  long long v11 = (int *)type metadata accessor for ResolverParameterProperties();
  uint64_t v12 = *(void *)(*((void *)v11 - 1) + 72);
  unint64_t v13 = (*(unsigned __int8 *)(*((void *)v11 - 1) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*((void *)v11 - 1) + 80);
  uint64_t v14 = swift_allocObject();
  uint64_t v41 = v14;
  *(_OWORD *)(v14 + 16) = xmmword_38BB0;
  unint64_t v15 = v14 + v13;
  char v35 = *(void (**)(char *, void, uint64_t))(v7 + 104);
  uint64_t v16 = v5;
  v35(v10, enum case for SuggestionParameter.roomName(_:), v5);
  uint64_t v17 = type metadata accessor for RoomNameResolver();
  swift_allocObject();
  uint64_t v18 = sub_1D460();
  uint64_t v19 = (uint64_t *)(v15 + v11[5]);
  v19[3] = v17;
  v19[4] = sub_229B0((unint64_t *)&qword_4D0B0, (void (*)(uint64_t))type metadata accessor for RoomNameResolver);
  uint64_t *v19 = v18;
  unint64_t v20 = *(void (**)(uint64_t, char *, uint64_t))(v7 + 32);
  v33[1] = v7 + 32;
  uint64_t v34 = v20;
  uint64_t v21 = v16;
  v20(v15, v10, v16);
  *(unsigned char *)(v15 + v11[6]) = 1;
  *(unsigned char *)(v15 + v11[7]) = 0;
  v33[0] = sub_2420(&qword_4D060);
  sub_375B0();
  uint64_t v22 = v15 + v12;
  v35(v10, enum case for SuggestionParameter.attribute(_:), v16);
  uint64_t v23 = type metadata accessor for AttributeResolver();
  swift_allocObject();
  int64_t v24 = sub_2C5BC();
  uint64_t v25 = (void *)(v22 + v11[5]);
  v25[3] = v23;
  v25[4] = sub_229B0(&qword_4D198, (void (*)(uint64_t))type metadata accessor for AttributeResolver);
  *uint64_t v25 = v24;
  v34(v22, v10, v21);
  *(unsigned char *)(v22 + v11[6]) = 1;
  *(unsigned char *)(v22 + v11[7]) = 0;
  sub_375B0();
  sub_4DCC(v36, (uint64_t)&v46);
  LODWORD(v23) = *(unsigned __int8 *)(v15 + v11[7]);
  sub_37800();
  swift_bridgeObjectRetain();
  sub_37C20();
  if (v23 == 1)
  {
    uint64_t v26 = sub_65D4();
    v27(v26);
    sub_6590();
  }
  else
  {
    sub_65B4();
  }
  uint64_t v28 = v48;
  long long v36 = v47;
  sub_23A4(&v46, v47);
  sub_37C20();
  sub_3BB8(v15 + v11[5], (uint64_t)v42);
  long long v44 = v36;
  uint64_t v45 = v28;
  sub_3C6C(v43);
  sub_378A0();
  swift_release();
  swift_bridgeObjectRelease();
  sub_4E30((uint64_t)v42);
  sub_3C1C((uint64_t)v43);
  LODWORD(v28) = *(unsigned __int8 *)(v22 + v11[7]);
  sub_37C20();
  if (v28 == 1)
  {
    uint64_t v29 = sub_65D4();
    v30(v29);
    sub_6590();
  }
  else
  {
    sub_65B4();
  }
  uint64_t v31 = v48;
  long long v39 = v47;
  sub_23A4(&v46, v47);
  sub_37C20();
  sub_3BB8(v22 + v11[5], (uint64_t)v42);
  long long v44 = v39;
  uint64_t v45 = v31;
  sub_3C6C(v43);
  sub_378A0();
  swift_release();
  swift_bridgeObjectRelease();
  sub_4E30((uint64_t)v42);
  sub_3C1C((uint64_t)v43);
  swift_bridgeObjectRelease();
  sub_4E90(&v46, v40);
  swift_setDeallocating();
  return sub_219FC();
}

uint64_t sub_229B0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_229F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_21FC;
  return sub_1E4E0(a1, a2, a3);
}

uint64_t sub_22AA4()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for HomeAutomationGenerator()
{
  return self;
}

uint64_t sub_22AD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *uint64_t v7 = v3;
  v7[1] = sub_22C30;
  return sub_229F8(a1, a2, a3);
}

uint64_t sub_22B88()
{
  return sub_22BF0((unint64_t *)&unk_4D700);
}

uint64_t sub_22BBC()
{
  return sub_22BF0(&qword_4D710);
}

uint64_t sub_22BF0(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for HomeAutomationGenerator();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t Log.suggestions.unsafeMutableAddressor()
{
  return sub_23088(&qword_4CD38, (uint64_t)static Log.suggestions);
}

Swift::Void __swiftcall Logger.debug(output:test:caller:)(Swift::String output, Swift::Bool test, Swift::String caller)
{
  object = caller._object;
  uint64_t countAndFlagsBits = caller._countAndFlagsBits;
  uint64_t v5 = output._object;
  uint64_t v27 = output._countAndFlagsBits;
  uint64_t v31 = 46;
  unint64_t v32 = 0xE100000000000000;
  uint64_t v29 = &v31;
  unint64_t v6 = sub_24580(sub_246B4, (uint64_t)v28, caller._countAndFlagsBits, (unint64_t)caller._object);
  if (v7)
  {
    sub_2476C();
    unint64_t v6 = sub_248D4(v8);
  }
  unint64_t v9 = v6;
  uint64_t v31 = 47;
  unint64_t v32 = 0xE100000000000000;
  __chkstk_darwin();
  v26[2] = &v31;
  unint64_t v10 = sub_24580(sub_24734, (uint64_t)v26, countAndFlagsBits, (unint64_t)object);
  char v12 = v11;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  unint64_t v13 = sub_37D80();
  os_log_type_t v14 = sub_37F70();
  BOOL v15 = os_log_type_enabled(v13, v14);
  if (v12)
  {
    if (v15)
    {
      uint64_t v16 = swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 136446466;
      sub_24848(15, v9);
      uint64_t v22 = sub_37E10();
      unint64_t v24 = v23;
      swift_bridgeObjectRelease();
      uint64_t v25 = sub_23D84(v22, v24, &v31);
      sub_24860(v25);
      sub_37FA0();
      sub_247C0();
      goto LABEL_9;
    }
LABEL_10:
    swift_bridgeObjectRelease_n();
    sub_247C0();
    goto LABEL_11;
  }
  if (!v15) {
    goto LABEL_10;
  }
  uint64_t v16 = swift_slowAlloc();
  uint64_t v31 = swift_slowAlloc();
  *(_DWORD *)uint64_t v16 = 136446466;
  unint64_t v17 = sub_2487C(v10);
  if (v9 >> 14 >= v17 >> 14)
  {
    sub_24848(v17, v9);
    uint64_t v18 = sub_37E10();
    unint64_t v20 = v19;
    swift_bridgeObjectRelease();
    uint64_t v21 = sub_23D84(v18, v20, &v31);
    sub_24860(v21);
    sub_37FA0();
    sub_247C0();
LABEL_9:
    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v30 = sub_23D84(v27, (unint64_t)v5, &v31);
    sub_37FA0();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v13, v14, "%{public}s: %s", (uint8_t *)v16, 0x16u);
    swift_arrayDestroy();
    sub_24830();
    sub_24830();
LABEL_11:

    return;
  }
  __break(1u);
}

Swift::Void __swiftcall Logger.warning(output:test:file:function:line:)(Swift::String output, Swift::Bool test, Swift::String file, Swift::String function, Swift::Int line)
{
}

uint64_t *Log.OSLogs.suggestions.unsafeMutableAddressor()
{
  if (qword_4CD48 != -1) {
    swift_once();
  }
  return &static Log.OSLogs.suggestions;
}

uint64_t sub_22FEC(uint64_t a1)
{
  return sub_2312C(a1, static Log.general, &qword_4CD40, (id *)&static Log.OSLogs.general);
}

uint64_t *Log.OSLogs.general.unsafeMutableAddressor()
{
  if (qword_4CD40 != -1) {
    swift_once();
  }
  return &static Log.OSLogs.general;
}

uint64_t Log.general.unsafeMutableAddressor()
{
  return sub_23088(&qword_4CD30, (uint64_t)static Log.general);
}

uint64_t sub_23088(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_37D90();
  return sub_23E8(v3, a2);
}

uint64_t static Log.general.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_231DC(&qword_4CD30, (uint64_t)static Log.general, a1);
}

uint64_t sub_23100(uint64_t a1)
{
  return sub_2312C(a1, static Log.suggestions, &qword_4CD48, (id *)&static Log.OSLogs.suggestions);
}

uint64_t sub_2312C(uint64_t a1, uint64_t *a2, void *a3, id *a4)
{
  uint64_t v7 = sub_37D90();
  sub_4934(v7, a2);
  sub_23E8(v7, (uint64_t)a2);
  if (*a3 != -1) {
    swift_once();
  }
  id v8 = *a4;
  return sub_37DA0();
}

uint64_t static Log.suggestions.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_231DC(&qword_4CD38, (uint64_t)static Log.suggestions, a1);
}

uint64_t sub_231DC@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_37D90();
  uint64_t v6 = sub_23E8(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  return v7(a3, v6, v5);
}

uint64_t sub_23274()
{
  sub_246F4();
  if (qword_4CD50 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_37F90();
  static Log.OSLogs.general = result;
  return result;
}

id static Log.OSLogs.general.getter()
{
  return sub_233FC(&qword_4CD40, (void **)&static Log.OSLogs.general);
}

uint64_t sub_23338()
{
  sub_246F4();
  if (qword_4CD58 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  uint64_t result = sub_37F90();
  static Log.OSLogs.suggestions = result;
  return result;
}

id static Log.OSLogs.suggestions.getter()
{
  return sub_233FC(&qword_4CD48, (void **)&static Log.OSLogs.suggestions);
}

id sub_233FC(void *a1, void **a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = *a2;
  return v3;
}

void sub_23448()
{
  qword_50B60 = 0x6C6172656E6547;
  *(void *)algn_50B68 = 0xE700000000000000;
}

void sub_2346C()
{
  qword_50B70 = 0x6974736567677553;
  *(void *)algn_50B78 = 0xEB00000000736E6FLL;
}

Swift::Void __swiftcall Logger.info(output:addToSummary:test:caller:)(Swift::String output, Swift::Bool addToSummary, Swift::Bool test, Swift::String caller)
{
}

Swift::Void __swiftcall Logger.notice(output:addToSummary:test:caller:)(Swift::String output, Swift::Bool addToSummary, Swift::Bool test, Swift::String caller)
{
}

void sub_23550(uint64_t a1, unint64_t a2, char a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t (*a7)(void *), uint64_t (*a8)(void *), uint64_t (*a9)(void))
{
  uint64_t v31 = a1;
  uint64_t v34 = a9;
  uint64_t v13 = 0x65725F7261646172;
  uint64_t v38 = 46;
  unint64_t v39 = 0xE100000000000000;
  if (a3) {
    unint64_t v14 = 0xEF202D2074726F70;
  }
  else {
    unint64_t v14 = 0xE000000000000000;
  }
  long long v36 = &v38;
  if ((a3 & 1) == 0) {
    uint64_t v13 = 0;
  }
  uint64_t v32 = v13;
  unint64_t v15 = sub_24580(a7, (uint64_t)v35, a5, a6);
  if (v16)
  {
    sub_2476C();
    unint64_t v15 = sub_248D4(v17);
  }
  unint64_t v33 = v15;
  uint64_t v38 = 47;
  unint64_t v39 = 0xE100000000000000;
  __chkstk_darwin(v15);
  v30[2] = &v38;
  unint64_t v18 = sub_24580(a8, (uint64_t)v30, a5, a6);
  char v20 = v19;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_37D80();
  int v22 = v34();
  BOOL v23 = os_log_type_enabled(v21, (os_log_type_t)v22);
  if (v20)
  {
    if (v23)
    {
      uint64_t v26 = swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      *(_DWORD *)uint64_t v26 = 136315650;
      swift_bridgeObjectRetain();
      uint64_t v37 = sub_23D84(v32, v14, &v38);
      sub_24750();
      sub_24914();
      *(_WORD *)(v26 + 12) = 2082;
      sub_24848(15, v33);
      uint64_t v27 = sub_37E10();
      LODWORD(v34) = v22;
      unint64_t v29 = v28;
      swift_bridgeObjectRelease();
      uint64_t v37 = sub_23D84(v27, v29, &v38);
      sub_24750();
      sub_247C0();
      swift_bridgeObjectRelease();
      *(_WORD *)(v26 + 22) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v37 = sub_23D84(v31, a2, &v38);
      sub_24750();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_0, v21, (os_log_type_t)v34, "%s%{public}s: %s", (uint8_t *)v26, 0x20u);
      swift_arrayDestroy();
      sub_24830();
      goto LABEL_14;
    }
LABEL_15:
    swift_bridgeObjectRelease_n();
    sub_247C0();
    swift_bridgeObjectRelease_n();
    goto LABEL_16;
  }
  if (!v23) {
    goto LABEL_15;
  }
  uint64_t v24 = swift_slowAlloc();
  uint64_t v34 = (uint64_t (*)(void))swift_slowAlloc();
  uint64_t v38 = (uint64_t)v34;
  *(_DWORD *)uint64_t v24 = 136315650;
  swift_bridgeObjectRetain();
  uint64_t v37 = sub_23D84(v32, v14, &v38);
  sub_24750();
  sub_24914();
  *(_WORD *)(v24 + 12) = 2082;
  unint64_t v25 = sub_2487C(v18);
  if (v33 >> 14 >= v25 >> 14)
  {
    sub_24848(v25, v33);
    sub_37E10();
    sub_24898();
    uint64_t v37 = sub_23D84(a5, v14, &v38);
    sub_24750();
    sub_247C0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v24 + 22) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v37 = sub_23D84(v31, a2, &v38);
    sub_24750();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v21, (os_log_type_t)v22, "%s%{public}s: %s", (uint8_t *)v24, 0x20u);
    swift_arrayDestroy();
    sub_24830();
LABEL_14:
    sub_24830();
LABEL_16:

    return;
  }
  __break(1u);
}

void sub_23998(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, unint64_t a7, uint64_t a8, uint64_t (*a9)(void *))
{
  v54[0] = 47;
  v54[1] = 0xE100000000000000;
  uint64_t v52 = v54;
  unint64_t v14 = sub_24580(a9, (uint64_t)v51, a4, a5);
  char v16 = v15;
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  uint64_t v17 = sub_37D80();
  int v18 = sub_37F80();
  BOOL v19 = os_log_type_enabled(v17, (os_log_type_t)v18);
  if (v16)
  {
    if (v19)
    {
      uint64_t v32 = swift_slowAlloc();
      uint64_t v33 = swift_slowAlloc();
      v54[0] = v33;
      *(_DWORD *)uint64_t v32 = 136316162;
      HIDWORD(v47) = v18;
      uint64_t v53 = sub_24788(v33, v34, v35, v36, v37, v38, v39, v40, v46, v47);
      sub_247F4();
      sub_248F4();
      uint64_t v53 = sub_23D84(a6, a7, v54);
      sub_247F4();
      swift_bridgeObjectRelease_n();
      sub_248B4();
      uint64_t v53 = sub_23D84(a1, a2, v54);
      sub_247F4();
      sub_24914();
      *(_WORD *)(v32 + 32) = 2082;
      sub_2476C();
      BOOL v44 = (v42 & v43) == 0;
      uint64_t v45 = 7;
      if (!v44) {
        uint64_t v45 = 11;
      }
      sub_24848(15, v45 | (v41 << 16));
      sub_37E10();
      sub_24898();
      uint64_t v53 = sub_23D84(a4, a2, v54);
      sub_247F4();
      sub_247C0();
      swift_bridgeObjectRelease();
      sub_24810();
      sub_37FA0();
      _os_log_impl(&dword_0, v17, v49, "%s\n%{public}s: %s\n    at %{public}s:%{public}ld", (uint8_t *)v32, 0x34u);
      swift_arrayDestroy();
      goto LABEL_13;
    }
LABEL_14:
    sub_247C0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    goto LABEL_15;
  }
  if (!v19) {
    goto LABEL_14;
  }
  HIDWORD(v47) = v18;
  uint64_t v20 = swift_slowAlloc();
  uint64_t v21 = swift_slowAlloc();
  v54[0] = v21;
  *(_DWORD *)uint64_t v20 = 136316162;
  uint64_t v53 = sub_24788(v21, v22, v23, v24, v25, v26, v27, v28, v21, v47);
  sub_247D8();
  sub_248F4();
  uint64_t v53 = sub_23D84(a6, a7, v54);
  sub_247D8();
  swift_bridgeObjectRelease_n();
  sub_248B4();
  uint64_t v53 = sub_23D84(a1, a2, v54);
  sub_247D8();
  sub_24914();
  *(_WORD *)(v20 + 32) = 2082;
  unint64_t v29 = sub_2487C(v14);
  uint64_t v30 = HIBYTE(a5) & 0xF;
  if ((a5 & 0x2000000000000000) == 0) {
    uint64_t v30 = a4 & 0xFFFFFFFFFFFFLL;
  }
  if (4 * v30 >= v29 >> 14)
  {
    uint64_t v31 = 7;
    if (((a5 >> 60) & ((a4 & 0x800000000000000) == 0)) != 0) {
      uint64_t v31 = 11;
    }
    sub_24848(v29, v31 | (v30 << 16));
    sub_37E10();
    sub_24898();
    uint64_t v53 = sub_23D84(a4, a2, v54);
    sub_247D8();
    sub_247C0();
    swift_bridgeObjectRelease();
    sub_24810();
    sub_37FA0();
    _os_log_impl(&dword_0, v17, v48, "%s\n%{public}s: %s\n    at %{public}s:%{public}ld", (uint8_t *)v20, 0x34u);
    swift_arrayDestroy();
LABEL_13:
    sub_24830();
    sub_24830();
LABEL_15:

    return;
  }
  __break(1u);
}

uint64_t sub_23D84(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_23E58(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1BC54((uint64_t)v12, *a3);
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
      sub_1BC54((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_3C1C((uint64_t)v12);
  return v7;
}

uint64_t sub_23E58(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_23FB0((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_37FB0();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_24088(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_38060();
    if (!v8)
    {
      uint64_t result = sub_380E0();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

void *sub_23FB0(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_38110();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_24088(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24120(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_242FC(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_242FC((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_24120(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = sub_37E80();
    if (v2) {
      goto LABEL_6;
    }
    return &_swiftEmptyArrayStorage;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    Swift::Int v2 = HIBYTE(a2) & 0xF;
  }
  else {
    Swift::Int v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
LABEL_6:
  unint64_t v3 = sub_24294(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_38030();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  sub_38110();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)sub_380E0();
  __break(1u);
  return result;
}

void *sub_24294(uint64_t a1, uint64_t a2)
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
  sub_2420(&qword_4D720);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_242FC(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
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
  int64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    int64_t v9 = *(void *)(a4 + 16);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_2420(&qword_4D720);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  char v12 = v10 + 32;
  uint64_t v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_244AC(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_243D4(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_243D4(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_38110();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_244AC(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_38110();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_2453C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a1 == a3 && a2 == a4) {
    return 1;
  }
  else {
    return sub_38150() & 1;
  }
}

unint64_t sub_24580(uint64_t (*a1)(void *), uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v5 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0) {
    uint64_t v5 = a3 & 0xFFFFFFFFFFFFLL;
  }
  if (!v5) {
    return 0;
  }
  while (1)
  {
    unint64_t v7 = sub_37E50();
    v12[0] = sub_37E90();
    v12[1] = v8;
    char v9 = a1(v12);
    if (v4) {
      break;
    }
    char v10 = v9;
    swift_bridgeObjectRelease();
    if (v10) {
      return v7;
    }
    if (v7 < 0x4000) {
      return 0;
    }
  }
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_24688(uint64_t *a1, uint64_t *a2)
{
  return sub_2453C(*a1, a1[1], *a2, a2[1]) & 1;
}

uint64_t sub_246B4(uint64_t *a1)
{
  return sub_24688(a1, *(uint64_t **)(v1 + 16)) & 1;
}

ValueMetadata *type metadata accessor for Log()
{
  return &type metadata for Log;
}

ValueMetadata *type metadata accessor for Log.OSLogs()
{
  return &type metadata for Log.OSLogs;
}

unint64_t sub_246F4()
{
  unint64_t result = qword_4D718;
  if (!qword_4D718)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_4D718);
  }
  return result;
}

uint64_t sub_24734(uint64_t *a1)
{
  return sub_246B4(a1) & 1;
}

uint64_t sub_24750()
{
  return sub_37FA0();
}

uint64_t sub_24788(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  return sub_23D84(0x65725F7261646172, 0xEF202D2074726F70, (uint64_t *)va);
}

uint64_t sub_247C0()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_247D8()
{
  return sub_37FA0();
}

uint64_t sub_247F4()
{
  return sub_37FA0();
}

void sub_24810()
{
  *(_WORD *)(v0 + 42) = 2050;
}

uint64_t sub_24830()
{
  return swift_slowDealloc();
}

uint64_t sub_24848(uint64_t a1, uint64_t a2)
{
  return String.subscript.getter(a1, a2, v3, v2);
}

uint64_t sub_24860(uint64_t a1)
{
  *(void *)(v1 - 112) = a1;
  return v1 - 112;
}

uint64_t sub_2487C(uint64_t a1)
{
  return String.index(_:offsetBy:)(a1, 1, v2, v1);
}

uint64_t sub_24898()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_248B4()
{
  *(_WORD *)(v0 + 22) = 2080;
  return swift_bridgeObjectRetain();
}

uint64_t sub_248D4@<X0>(uint64_t a1@<X8>)
{
  return String.index(_:offsetBy:)(v1 | (a1 << 16), -1, v3, v2);
}

uint64_t sub_248F4()
{
  *(_WORD *)(v0 + 12) = 2082;
  return swift_bridgeObjectRetain();
}

uint64_t sub_24914()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_2492C()
{
  return sub_24BD8(&qword_4CCF0, (uint64_t)qword_50A60);
}

uint64_t sub_24950()
{
  return sub_24BD8(&qword_4CC60, (uint64_t)qword_508A0);
}

uint64_t sub_24974()
{
  return sub_24BD8(&qword_4CC70, (uint64_t)qword_508D0);
}

uint64_t sub_24998()
{
  return sub_24BD8(&qword_4CCC0, (uint64_t)qword_509D0);
}

uint64_t sub_249BC()
{
  return sub_24BD8(&qword_4CD10, (uint64_t)qword_50AC0);
}

uint64_t sub_249E0()
{
  return sub_24BD8(&qword_4CD00, (uint64_t)qword_50A90);
}

uint64_t sub_24A04()
{
  return sub_24BD8(&qword_4CDB0, (uint64_t)qword_50C38);
}

uint64_t sub_24A28()
{
  return sub_24BD8(&qword_4CCB0, (uint64_t)qword_50990);
}

uint64_t sub_24A4C()
{
  return sub_24BD8(&qword_4CCA0, (uint64_t)qword_50960);
}

uint64_t sub_24A70()
{
  return sub_24BD8(&qword_4CC80, (uint64_t)qword_50900);
}

uint64_t sub_24A94()
{
  return sub_24BD8(&qword_4CCD0, (uint64_t)qword_50A00);
}

uint64_t sub_24AB8()
{
  return sub_24BD8(&qword_4CDF0, (uint64_t)qword_50CF8);
}

uint64_t sub_24ADC()
{
  return sub_24BD8(&qword_4CCE0, (uint64_t)qword_50A30);
}

uint64_t sub_24B00()
{
  return sub_24BD8(&qword_4CD20, (uint64_t)qword_50AF0);
}

uint64_t sub_24B24()
{
  return sub_24BD8(&qword_4CDE0, (uint64_t)qword_50CC8);
}

uint64_t sub_24B48()
{
  return sub_24BD8(&qword_4CDC0, (uint64_t)qword_50C68);
}

uint64_t sub_24B6C()
{
  return sub_24BD8(&qword_4CDD0, (uint64_t)qword_50C98);
}

uint64_t sub_24B90()
{
  return sub_24BD8(&qword_4CD78, (uint64_t)qword_50BC0);
}

uint64_t sub_24BB4()
{
  return sub_24BD8(&qword_4CC90, (uint64_t)qword_50930);
}

uint64_t sub_24BD8(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_37A80();
  sub_23E8(v3, a2);
  return sub_37A70();
}

uint64_t sub_24C28()
{
  sub_376A0();
  swift_allocObject();
  uint64_t result = sub_376B0();
  qword_50B80 = result;
  return result;
}

uint64_t sub_24C88()
{
  uint64_t v0 = sub_2420(&qword_4D118);
  uint64_t v1 = __chkstk_darwin(v0 - 8);
  uint64_t v3 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v1);
  uint64_t v5 = (char *)&v24 - v4;
  uint64_t v6 = sub_37580();
  sub_2707C();
  uint64_t v8 = v7;
  uint64_t v10 = __chkstk_darwin(v9);
  char v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  unint64_t v14 = (char *)&v24 - v13;
  sub_37B90();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v16 = [self bundleForClass:ObjCClassFromMetadata];
  id v17 = [v16 resourceURL];

  if (v17)
  {
    sub_37550();

    uint64_t v18 = 0;
  }
  else
  {
    uint64_t v18 = 1;
  }
  sub_3D38((uint64_t)v3, v18, 1, v6);
  sub_26F48((uint64_t)v3, (uint64_t)v5);
  if (sub_3DBC((uint64_t)v5, 1, v6) == 1)
  {
    uint64_t result = sub_3D60((uint64_t)v5, &qword_4D118);
    unint64_t v20 = 0x800000000003DE00;
    uint64_t v21 = 0xD00000000000004DLL;
  }
  else
  {
    sub_37540();
    uint64_t v22 = *(void (**)(char *, uint64_t))(v8 + 8);
    v22(v5, v6);
    sub_37530();
    v22(v14, v6);
    uint64_t v21 = sub_37560(1);
    unint64_t v20 = v23;
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v22)(v12, v6);
  }
  qword_50B88 = v21;
  unk_50B90 = v20;
  return result;
}

uint64_t sub_24EFC()
{
  qword_50BB0 = sub_37C10();
  unk_50BB8 = &protocol witness table for FeatureFlagProvider;
  sub_3C6C(qword_50B98);
  return sub_37C00();
}

uint64_t sub_24F3C(uint64_t a1, uint64_t a2)
{
  v2[22] = a1;
  v2[23] = a2;
  uint64_t v3 = sub_37710();
  v2[24] = v3;
  sub_1BD50(v3);
  v2[25] = v4;
  v2[26] = sub_1C354();
  sub_2420(&qword_4D3F0);
  v2[27] = sub_1C354();
  uint64_t v5 = sub_37D70();
  v2[28] = v5;
  sub_1BD50(v5);
  v2[29] = v6;
  v2[30] = sub_1C354();
  return _swift_task_switch(sub_25028, 0, 0);
}

uint64_t sub_25028()
{
  if (qword_4CD48 != -1) {
    swift_once();
  }
  sub_37D00();
  sub_37D20();
  if (qword_4CD70 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_50BB0;
  uint64_t v2 = sub_23A4(qword_50B98, qword_50BB0);
  sub_2707C();
  uint64_t v4 = v3;
  uint64_t v5 = sub_1C354();
  (*(void (**)(uint64_t, void *, uint64_t))(v4 + 16))(v5, v2, v1);
  LOBYTE(v2) = sub_37BF0();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v1);
  swift_task_dealloc();
  if (v2)
  {
    if (qword_4CD60 != -1) {
      swift_once();
    }
    uint64_t v6 = (int *)v0[22];
    uint64_t v7 = qword_50B80;
    v0[5] = sub_376A0();
    v0[6] = sub_26F00(&qword_4D7D0, (void (*)(uint64_t))&type metadata accessor for DomainOwner);
    v0[2] = v7;
    id v17 = (uint64_t (*)(void *))((char *)v6 + *v6);
    swift_retain();
    uint64_t v8 = (void *)swift_task_alloc();
    v0[31] = v8;
    void *v8 = v0;
    v8[1] = sub_25448;
    return v17(v0 + 2);
  }
  else
  {
    if (qword_4CD38 != -1) {
      swift_once();
    }
    uint64_t v10 = v0[27];
    uint64_t v11 = sub_37D90();
    sub_23E8(v11, (uint64_t)static Log.suggestions);
    v12._uint64_t countAndFlagsBits = 0xD000000000000031;
    v13._uint64_t countAndFlagsBits = 0xD000000000000081;
    v12._object = (void *)0x800000000003DD00;
    v13._object = (void *)0x800000000003DD40;
    v14._object = (void *)0x800000000003DDD0;
    v14._uint64_t countAndFlagsBits = 0xD000000000000027;
    Logger.warning(output:test:file:function:line:)(v12, 0, v13, v14, 38);
    sub_37D00();
    uint64_t v15 = sub_37D30();
    sub_3D38(v10, 1, 1, v15);
    sub_37CF0();
    sub_3D60(v10, &qword_4D3F0);
    (*(void (**)(void, void))(v0[29] + 8))(v0[30], v0[28]);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    id v16 = (uint64_t (*)(void *))v0[1];
    return v16(_swiftEmptyArrayStorage);
  }
}

uint64_t sub_25448()
{
  sub_11820();
  uint64_t v1 = v0 + 16;
  *(void *)(v0 + 256) = v2;
  swift_task_dealloc();
  sub_3C1C(v1);
  return _swift_task_switch(sub_25530, 0, 0);
}

uint64_t sub_25530()
{
  uint64_t v1 = type metadata accessor for HomeAutomationGenerator();
  uint64_t v2 = swift_allocObject();
  *(void *)(v0 + 80) = v1;
  uint64_t v3 = sub_26F00(&qword_4D7D8, (void (*)(uint64_t))type metadata accessor for HomeAutomationGenerator);
  *(void *)(v0 + 56) = v2;
  *(void *)(v0 + 88) = v3;
  sub_378D0();
  swift_release();
  sub_3C1C(v0 + 56);
  if (qword_4CD00 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_37A80();
  sub_23E8(v4, (uint64_t)qword_50A90);
  sub_37A70();
  sub_27070();
  if (qword_4CD08 != -1) {
    swift_once();
  }
  uint64_t v6 = *(void *)(v0 + 200);
  uint64_t v5 = *(void *)(v0 + 208);
  uint64_t v7 = *(void *)(v0 + 192);
  uint64_t v8 = sub_23E8(v7, (uint64_t)qword_50AA8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v5, v8, v7);
  uint64_t v9 = swift_task_alloc();
  *(void *)(v9 + 16) = &type metadata for DimLightsSuggestion;
  *(void *)(v9 + 24) = &off_4B6B8;
  sub_26FFC();
  sub_27058();
  swift_release();
  swift_task_dealloc();
  uint64_t v10 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  if (qword_4CCB0 != -1) {
    uint64_t v10 = swift_once();
  }
  sub_27020(v10, (uint64_t)qword_50990);
  sub_27070();
  if (qword_4CCB8 != -1) {
    swift_once();
  }
  sub_2704C();
  uint64_t v12 = sub_26FB4(v11, (uint64_t)qword_509A8);
  v13(v12);
  uint64_t v14 = swift_task_alloc();
  *(void *)(v14 + 16) = &type metadata for GetStateOfAirQuality;
  *(void *)(v14 + 24) = &off_4B298;
  sub_26FFC();
  sub_27058();
  swift_release();
  swift_task_dealloc();
  uint64_t v15 = sub_26FE4();
  uint64_t v17 = v16(v15);
  if (qword_4CDB0 != -1) {
    uint64_t v17 = swift_once();
  }
  sub_27020(v17, (uint64_t)qword_50C38);
  sub_27070();
  if (qword_4CDB8 != -1) {
    swift_once();
  }
  sub_2704C();
  uint64_t v19 = sub_26FB4(v18, (uint64_t)qword_50C50);
  v20(v19);
  uint64_t v21 = swift_task_alloc();
  *(void *)(v21 + 16) = &type metadata for GetStateOfDoorLocks;
  *(void *)(v21 + 24) = &off_4B8D8;
  sub_26FFC();
  sub_27058();
  swift_release();
  swift_task_dealloc();
  uint64_t v22 = sub_26FE4();
  uint64_t v24 = v23(v22);
  if (qword_4CCA0 != -1) {
    uint64_t v24 = swift_once();
  }
  sub_27020(v24, (uint64_t)qword_50960);
  sub_27070();
  if (qword_4CCA8 != -1) {
    swift_once();
  }
  sub_2704C();
  uint64_t v26 = sub_26FB4(v25, (uint64_t)qword_50978);
  v27(v26);
  uint64_t v28 = swift_task_alloc();
  *(void *)(v28 + 16) = &type metadata for GetStateOfGarageDoors;
  *(void *)(v28 + 24) = &off_4B220;
  sub_26FFC();
  sub_27058();
  swift_release();
  swift_task_dealloc();
  uint64_t v29 = sub_26FE4();
  uint64_t v31 = v30(v29);
  if (qword_4CC70 != -1) {
    uint64_t v31 = swift_once();
  }
  sub_27020(v31, (uint64_t)qword_508D0);
  sub_27070();
  if (qword_4CC78 != -1) {
    swift_once();
  }
  sub_2704C();
  uint64_t v33 = sub_26FB4(v32, (uint64_t)qword_508E8);
  v34(v33);
  uint64_t v35 = swift_task_alloc();
  *(void *)(v35 + 16) = &type metadata for GetStateOfHumidity;
  *(void *)(v35 + 24) = &off_4B0B8;
  sub_26FFC();
  sub_27058();
  swift_release();
  swift_task_dealloc();
  uint64_t v36 = sub_26FE4();
  uint64_t v38 = v37(v36);
  if (qword_4CC80 != -1) {
    uint64_t v38 = swift_once();
  }
  sub_27020(v38, (uint64_t)qword_50900);
  sub_27070();
  if (qword_4CC88 != -1) {
    swift_once();
  }
  sub_2704C();
  uint64_t v40 = sub_26FB4(v39, (uint64_t)qword_50918);
  v41(v40);
  uint64_t v42 = swift_task_alloc();
  *(void *)(v42 + 16) = &type metadata for GetStateOfLightsPower;
  *(void *)(v42 + 24) = &off_4B130;
  sub_26FFC();
  sub_27058();
  swift_release();
  swift_task_dealloc();
  uint64_t v43 = sub_26FE4();
  uint64_t v45 = v44(v43);
  if (qword_4CDC0 != -1) {
    uint64_t v45 = swift_once();
  }
  sub_27020(v45, (uint64_t)qword_50C68);
  sub_27070();
  if (qword_4CDC8 != -1) {
    swift_once();
  }
  sub_2704C();
  uint64_t v47 = sub_26FB4(v46, (uint64_t)qword_50C80);
  v48(v47);
  uint64_t v49 = swift_task_alloc();
  *(void *)(v49 + 16) = &type metadata for GetStateOfSecuritySystems;
  *(void *)(v49 + 24) = &off_4B950;
  sub_26FFC();
  sub_27058();
  swift_release();
  swift_task_dealloc();
  uint64_t v50 = sub_26FE4();
  uint64_t v52 = v51(v50);
  if (qword_4CCD0 != -1) {
    uint64_t v52 = swift_once();
  }
  sub_27020(v52, (uint64_t)qword_50A00);
  sub_27070();
  if (qword_4CCD8 != -1) {
    swift_once();
  }
  sub_2704C();
  uint64_t v54 = sub_26FB4(v53, (uint64_t)qword_50A18);
  v55(v54);
  uint64_t v56 = swift_task_alloc();
  *(void *)(v56 + 16) = &type metadata for GetStateOfTemperature;
  *(void *)(v56 + 24) = &off_4B4C0;
  sub_26FFC();
  sub_27058();
  swift_release();
  swift_task_dealloc();
  uint64_t v57 = sub_26FE4();
  uint64_t v59 = v58(v57);
  if (qword_4CC60 != -1) {
    uint64_t v59 = swift_once();
  }
  sub_27020(v59, (uint64_t)qword_508A0);
  sub_27070();
  if (qword_4CC68 != -1) {
    swift_once();
  }
  sub_2704C();
  uint64_t v61 = sub_26FB4(v60, (uint64_t)qword_508B8);
  v62(v61);
  uint64_t v63 = swift_task_alloc();
  *(void *)(v63 + 16) = &type metadata for GetStateOfWindows;
  *(void *)(v63 + 24) = &off_4AFB0;
  sub_26FFC();
  sub_27058();
  swift_release();
  swift_task_dealloc();
  uint64_t v64 = sub_26FE4();
  uint64_t v66 = v65(v64);
  if (qword_4CCF0 != -1) {
    uint64_t v66 = swift_once();
  }
  sub_27020(v66, (uint64_t)qword_50A60);
  sub_27070();
  if (qword_4CCF8 != -1) {
    swift_once();
  }
  sub_2704C();
  uint64_t v68 = sub_26FB4(v67, (uint64_t)qword_50A78);
  v69(v68);
  uint64_t v70 = swift_task_alloc();
  *(void *)(v70 + 16) = &type metadata for CreateAutomationSuggestion;
  *(void *)(v70 + 24) = &off_4B640;
  sub_26FFC();
  sub_27058();
  swift_release();
  swift_task_dealloc();
  uint64_t v71 = sub_26FE4();
  uint64_t v73 = v72(v71);
  if (qword_4CD10 != -1) {
    uint64_t v73 = swift_once();
  }
  sub_27020(v73, (uint64_t)qword_50AC0);
  sub_27070();
  if (qword_4CD18 != -1) {
    swift_once();
  }
  sub_2704C();
  uint64_t v75 = sub_26FB4(v74, (uint64_t)qword_50AD8);
  v76(v75);
  uint64_t v77 = swift_task_alloc();
  *(void *)(v77 + 16) = &type metadata for SetSceneSuggestion;
  *(void *)(v77 + 24) = &off_4B730;
  sub_26FFC();
  sub_27058();
  swift_release();
  swift_task_dealloc();
  uint64_t v78 = sub_26FE4();
  uint64_t v80 = v79(v78);
  if (qword_4CDE0 != -1) {
    uint64_t v80 = swift_once();
  }
  sub_27020(v80, (uint64_t)qword_50CC8);
  sub_27070();
  if (qword_4CDE8 != -1) {
    swift_once();
  }
  sub_2704C();
  uint64_t v82 = sub_26FB4(v81, (uint64_t)qword_50CE0);
  v83(v82);
  uint64_t v84 = swift_task_alloc();
  *(void *)(v84 + 16) = &type metadata for SetTemperatureSuggestion;
  *(void *)(v84 + 24) = &off_4BA40;
  sub_26FFC();
  sub_27058();
  swift_release();
  swift_task_dealloc();
  uint64_t v85 = sub_26FE4();
  uint64_t v87 = v86(v85);
  if (qword_4CC90 != -1) {
    uint64_t v87 = swift_once();
  }
  sub_27020(v87, (uint64_t)qword_50930);
  sub_27070();
  if (qword_4CC98 != -1) {
    swift_once();
  }
  sub_2704C();
  uint64_t v89 = sub_26FB4(v88, (uint64_t)qword_50948);
  v90(v89);
  uint64_t v91 = swift_task_alloc();
  *(void *)(v91 + 16) = &type metadata for OpenCloseSecureAccessoriesSuggestion;
  *(void *)(v91 + 24) = &off_4B1A8;
  sub_26FFC();
  sub_27058();
  swift_release();
  swift_task_dealloc();
  uint64_t v92 = sub_26FE4();
  uint64_t v94 = v93(v92);
  if (qword_4CDD0 != -1) {
    uint64_t v94 = swift_once();
  }
  sub_27020(v94, (uint64_t)qword_50C98);
  sub_27070();
  if (qword_4CDD8 != -1) {
    swift_once();
  }
  sub_2704C();
  uint64_t v96 = sub_26FB4(v95, (uint64_t)qword_50CB0);
  v97(v96);
  uint64_t v98 = swift_task_alloc();
  *(void *)(v98 + 16) = &type metadata for PowerAccessoriesSuggestion;
  *(void *)(v98 + 24) = &off_4B9C8;
  sub_26FFC();
  sub_27058();
  swift_release();
  swift_task_dealloc();
  uint64_t v99 = sub_26FE4();
  uint64_t v101 = v100(v99);
  if (qword_4CCE0 != -1) {
    uint64_t v101 = swift_once();
  }
  sub_27020(v101, (uint64_t)qword_50A30);
  sub_27070();
  if (qword_4CCE8 != -1) {
    swift_once();
  }
  sub_2704C();
  uint64_t v103 = sub_26FB4(v102, (uint64_t)qword_50A48);
  v104(v103);
  uint64_t v105 = swift_task_alloc();
  *(void *)(v105 + 16) = &type metadata for SetBrightnessSuggestion;
  *(void *)(v105 + 24) = &off_4B5C8;
  sub_26FFC();
  sub_27058();
  swift_release();
  swift_task_dealloc();
  uint64_t v106 = sub_26FE4();
  uint64_t v108 = v107(v106);
  if (qword_4CD20 != -1) {
    uint64_t v108 = swift_once();
  }
  sub_27020(v108, (uint64_t)qword_50AF0);
  sub_27070();
  if (qword_4CD28 != -1) {
    swift_once();
  }
  sub_2704C();
  uint64_t v110 = sub_26FB4(v109, (uint64_t)qword_50B08);
  v111(v110);
  uint64_t v112 = swift_task_alloc();
  *(void *)(v112 + 16) = &type metadata for SetClimateModeSuggestion;
  *(void *)(v112 + 24) = &off_4B7A8;
  sub_26FFC();
  sub_27058();
  swift_release();
  swift_task_dealloc();
  uint64_t v113 = sub_26FE4();
  uint64_t v115 = v114(v113);
  if (qword_4CCC0 != -1) {
    uint64_t v115 = swift_once();
  }
  sub_27020(v115, (uint64_t)qword_509D0);
  sub_27070();
  if (qword_4CCC8 != -1) {
    swift_once();
  }
  sub_2704C();
  uint64_t v117 = sub_26FB4(v116, (uint64_t)qword_509E8);
  v118(v117);
  uint64_t v119 = swift_task_alloc();
  *(void *)(v119 + 16) = &type metadata for SetColorSuggestion;
  *(void *)(v119 + 24) = &off_4B3B8;
  sub_26FFC();
  sub_27058();
  swift_release();
  swift_task_dealloc();
  uint64_t v120 = sub_26FE4();
  uint64_t v122 = v121(v120);
  if (qword_4CDF0 != -1) {
    uint64_t v122 = swift_once();
  }
  sub_27020(v122, (uint64_t)qword_50CF8);
  sub_27070();
  if (qword_4CDF8 != -1) {
    swift_once();
  }
  sub_2704C();
  uint64_t v124 = sub_26FB4(v123, (uint64_t)qword_50D10);
  v125(v124);
  uint64_t v126 = swift_task_alloc();
  *(void *)(v126 + 16) = &type metadata for SetFanSpeedSuggestion;
  *(void *)(v126 + 24) = &off_4BAB8;
  sub_26FFC();
  sub_27058();
  swift_release();
  swift_task_dealloc();
  uint64_t v127 = sub_26FE4();
  uint64_t v129 = v128(v127);
  if (qword_4CD78 != -1) {
    uint64_t v129 = swift_once();
  }
  sub_27020(v129, (uint64_t)qword_50BC0);
  if (qword_4CD80 != -1) {
    swift_once();
  }
  sub_2704C();
  uint64_t v131 = sub_26FB4(v130, (uint64_t)qword_50BD8);
  v132(v131);
  uint64_t v133 = swift_task_alloc();
  *(void *)(v133 + 16) = &type metadata for GetStateSmokeSensorSuggestion;
  *(void *)(v133 + 24) = &off_4B860;
  sub_378E0();
  swift_bridgeObjectRelease();
  swift_release();
  swift_task_dealloc();
  uint64_t v134 = sub_26FE4();
  v135(v134);
  if (qword_4CC58 != -1) {
    swift_once();
  }
  uint64_t v136 = *(void *)(v0 + 216);
  uint64_t v137 = qword_50898;
  *(void *)(v0 + 160) = type metadata accessor for HomeAutomationSignalExtractor();
  *(void *)(v0 + 168) = sub_26F00(&qword_4D000, (void (*)(uint64_t))type metadata accessor for HomeAutomationSignalExtractor);
  *(void *)(v0 + 136) = v137;
  swift_retain();
  sub_378C0();
  sub_3C1C(v0 + 136);
  sub_378F0();
  swift_release();
  sub_2420(&qword_4D7E0);
  uint64_t v138 = swift_allocObject();
  *(_OWORD *)(v138 + 16) = xmmword_385B0;
  sub_20EE8((long long *)(v0 + 96), v138 + 32);
  swift_release();
  sub_37D00();
  uint64_t v139 = sub_37D30();
  sub_3D38(v136, 1, 1, v139);
  sub_37CF0();
  sub_3D60(v136, &qword_4D3F0);
  (*(void (**)(void, void))(*(void *)(v0 + 232) + 8))(*(void *)(v0 + 240), *(void *)(v0 + 224));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v140 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v140(v138);
}

_OWORD *sub_26844(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a1 + 24);
  long long v22 = *(_OWORD *)(a1 + 32);
  sub_23A4((void *)a1, v6);
  (*(void (**)(uint64_t, uint64_t))(a3 + 40))(a2, a3);
  *(void *)uint64_t v42 = v6;
  *(_OWORD *)&v42[8] = v22;
  sub_3C6C((uint64_t *)&v41);
  sub_37650();
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)&v42[16];
  long long v23 = *(_OWORD *)v42;
  sub_23A4(&v41, *(uint64_t *)v42);
  (*(void (**)(uint64_t, uint64_t))(a3 + 48))(a2, a3);
  long long v39 = v23;
  uint64_t v40 = v7;
  sub_3C6C(v38);
  sub_37860();
  swift_bridgeObjectRelease();
  uint64_t v8 = v40;
  long long v24 = v39;
  sub_23A4(v38, v39);
  (*(void (**)(uint64_t, uint64_t))(a3 + 24))(a2, a3);
  long long v36 = v24;
  uint64_t v37 = v8;
  sub_3C6C(v35);
  sub_37870();
  swift_bridgeObjectRelease();
  uint64_t v9 = v37;
  long long v25 = v36;
  sub_23A4(v35, v36);
  if (qword_4CD68 != -1) {
    swift_once();
  }
  long long v33 = v25;
  uint64_t v34 = v9;
  sub_3C6C(v32);
  sub_37850();
  uint64_t v10 = v34;
  long long v20 = v33;
  sub_23A4(v32, v33);
  sub_2420(&qword_4D7E8);
  uint64_t v11 = sub_37760();
  uint64_t v12 = *(void *)(v11 - 8);
  unint64_t v13 = (*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_385B0;
  unint64_t v15 = v14 + v13;
  uint64_t v16 = enum case for SiriHintsMode.spoken(_:);
  uint64_t v17 = sub_37660();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 104))(v15, v16, v17);
  (*(void (**)(unint64_t, void, uint64_t))(v12 + 104))(v15, enum case for DeliveryVehicle.siriHints(_:), v11);
  long long v30 = v20;
  uint64_t v31 = v10;
  sub_3C6C(v29);
  sub_37890();
  swift_bridgeObjectRelease();
  uint64_t v18 = v31;
  long long v21 = v30;
  sub_23A4(v29, v30);
  sub_2420(&qword_4D7F0);
  sub_37810();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_385B0;
  sub_37830();
  long long v27 = v21;
  uint64_t v28 = v18;
  sub_3C6C(v26);
  sub_37880();
  swift_bridgeObjectRelease();
  sub_3C1C((uint64_t)v26);
  sub_3C1C((uint64_t)v29);
  sub_3C1C((uint64_t)v32);
  sub_3C1C((uint64_t)v35);
  sub_3C1C((uint64_t)v38);
  sub_3C1C((uint64_t)&v41);
  (*(void (**)(long long *__return_ptr, uint64_t, uint64_t, uint64_t))(a3 + 56))(&v41, a1, a2, a3);
  sub_3C1C(a1);
  sub_4E90(&v41, (_OWORD *)a1);
  (*(void (**)(long long *__return_ptr, uint64_t, uint64_t, uint64_t))(a3 + 64))(&v41, a1, a2, a3);
  sub_3C1C(a1);
  return sub_4E90(&v41, (_OWORD *)a1);
}

uint64_t type metadata accessor for HomeAutomationOwnerDefinitionFactory()
{
  return self;
}

uint64_t sub_26D84(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_26E20;
  return sub_24F3C(a1, a2);
}

uint64_t sub_26E20(uint64_t a1)
{
  sub_11820();
  uint64_t v5 = *v1;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

_OWORD *sub_26EF8(uint64_t a1)
{
  return sub_26844(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_26F00(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_26F48(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_2420(&qword_4D118);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_26FB4(uint64_t a1, uint64_t a2)
{
  sub_23E8(v3, a2);
  return v2;
}

uint64_t sub_26FE4()
{
  return v0;
}

uint64_t sub_26FFC()
{
  return sub_378E0();
}

uint64_t sub_27020(uint64_t a1, uint64_t a2)
{
  sub_23E8(v2, a2);
  return sub_37A70();
}

uint64_t sub_27058()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_27094(uint64_t a1, uint64_t a2)
{
  v3[4] = a2;
  uint64_t v3[5] = v2;
  uint64_t v4 = sub_37D90();
  v3[6] = v4;
  v3[7] = *(void *)(v4 - 8);
  v3[8] = swift_task_alloc();
  sub_2420(&qword_4D188);
  v3[9] = swift_task_alloc();
  return _swift_task_switch(sub_27184, 0, 0);
}

uint64_t sub_27184()
{
  sub_23A4(*(void **)(v0 + 32), *(void *)(*(void *)(v0 + 32) + 24));
  *(void *)(v0 + 80) = sub_377B0();
  *(void *)(v0 + 88) = v1;
  *(void *)(v0 + 96) = swift_getObjectType();
  uint64_t v3 = sub_37F40();
  return _swift_task_switch(sub_27234, v3, v2);
}

uint64_t sub_27234()
{
  sub_2B05C();
  char v2 = v1;
  *(void *)(v0 + 16) = v3;
  *(unsigned char *)(v0 + 24) = v1;
  swift_unknownObjectRelease();
  *(unsigned char *)(v0 + 104) = v2;
  return _swift_task_switch(sub_272B8, 0, 0);
}

uint64_t sub_272B8()
{
  if (*(unsigned char *)(v0 + 104))
  {
    if (qword_4CD38 != -1) {
      swift_once();
    }
    uint64_t v4 = *(void *)(v0 + 56);
    uint64_t v3 = *(void *)(v0 + 64);
    uint64_t v6 = *(void *)(v0 + 40);
    uint64_t v5 = *(void *)(v0 + 48);
    uint64_t v7 = sub_23E8(v5, (uint64_t)static Log.suggestions);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v7, v5);
    sub_38020(31);
    swift_bridgeObjectRelease();
    uint64_t v8 = *(void *)(v6 + 16);
    uint64_t v9 = *(void **)(v6 + 24);
    swift_bridgeObjectRetain();
    v23._uint64_t countAndFlagsBits = v8;
    v23._object = v9;
    sub_37E70(v23);
    swift_bridgeObjectRelease();
    v10._uint64_t countAndFlagsBits = 0xD00000000000001DLL;
    v11._uint64_t countAndFlagsBits = 0xD00000000000003FLL;
    v12._uint64_t countAndFlagsBits = 0xD000000000000074;
    v12._object = (void *)0x800000000003DE50;
    v11._object = (void *)0x800000000003D100;
    v10._object = (void *)0x800000000003DFF0;
    Logger.warning(output:test:file:function:line:)(v10, 0, v12, v11, 48);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
LABEL_7:
    unint64_t v13 = _swiftEmptyArrayStorage;
  }
  else
  {
    uint64_t v1 = *(void *)(v0 + 16);
    sub_37B40();
    swift_allocObject();
    sub_37B30();
    switch(v1)
    {
      case 2:
        uint64_t v2 = *(void *)(*(void *)(v0 + 40) + 40);
        goto LABEL_13;
      case 5:
        uint64_t v14 = *(void *)(*(void *)(v0 + 40) + 32);
        if (*(void *)(v14 + 16))
        {
          uint64_t v15 = *(void *)(v0 + 72);
          HueSemantic.rawValue.getter(*(_WORD *)(v14 + 32));
          sub_375F0();
          uint64_t v16 = sub_37610();
          sub_3D38(v15, 0, 1, v16);
          sub_37B00();
          swift_release();
          sub_27EAC(v15);
        }
        goto LABEL_15;
      case 6:
        if (!*(void *)(*(void *)(*(void *)(v0 + 40) + 48) + 16)) {
          goto LABEL_19;
        }
        sub_37A50();
        uint64_t v17 = (void *)sub_37A40();
        id v18 = HomeAttributeValue.localizedValue.getter();

        sub_37B80();
        [v18 doubleValue];
        [v18 unit];
        sub_37B70();
        sub_37B10();
        swift_release();
        swift_release();

        goto LABEL_15;
      case 11:
        uint64_t v2 = *(void *)(*(void *)(v0 + 40) + 56);
LABEL_13:
        if (!*(void *)(v2 + 16))
        {
LABEL_19:
          swift_release();
          goto LABEL_7;
        }
        sub_37B80();
        sub_37B70();
        sub_37B10();
        swift_release();
        swift_release();
LABEL_15:
        sub_2420(&qword_4CEF0);
        unint64_t v13 = (void *)swift_allocObject();
        *((_OWORD *)v13 + 1) = xmmword_385B0;
        uint64_t v19 = sub_37B20();
        v13[7] = sub_37B50();
        v13[4] = v19;
        swift_release();
        break;
      default:
        goto LABEL_15;
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  long long v20 = *(uint64_t (**)(void *))(v0 + 8);
  return v20(v13);
}

id HomeAttributeValue.localizedValue.getter()
{
  uint64_t v1 = sub_37D90();
  uint64_t v2 = sub_2420(&qword_4D7F8);
  sub_4EA8();
  uint64_t v4 = v3;
  __chkstk_darwin(v5);
  sub_27F30();
  id v6 = [objc_allocWithZone((Class)NSMeasurementFormatter) init];
  id v7 = [self celsius];
  sub_27AD0();
  sub_37520();
  double v8 = sub_37510();
  Swift::String v10 = v9;
  (*(void (**)(uint64_t, uint64_t, double))(v4 + 8))(v0, v2, v8);
  id v11 = [v6 stringFromMeasurement:v10];

  uint64_t v12 = sub_37DF0();
  uint64_t v14 = v13;

  v23[0] = v12;
  v23[1] = v14;
  sub_27B10();
  char v15 = sub_37FC0();
  swift_bridgeObjectRelease();
  [v22 unit];
  uint64_t v16 = sub_37A30();
  if (v16 != sub_37A30()
    && (([v22 unit], uint64_t v17 = sub_37A30(), v17 == sub_37A30())
     || ([v22 unit], uint64_t v18 = sub_37A30(), v18 == sub_37A30())))
  {
    [v22 doubleValue];
    if (v15)
    {
      sub_1C518(3, v19);
      if (qword_4CD30 != -1) {
        swift_once();
      }
      sub_23E8(v1, (uint64_t)static Log.general);
      sub_27F68();
      sub_38020(49);
      sub_27F48((uint64_t)"Converted value: ");
      [v22 doubleValue];
      sub_27F7C((uint64_t)v23);
      v25._uint64_t countAndFlagsBits = 0xD00000000000001CLL;
      v25._object = (void *)0x800000000003DF10;
      sub_37E70(v25);
      sub_27F7C((uint64_t)v23);
      sub_27F0C(v23[0], 0xD000000000000074, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SiriHomeAutomation/HomeAutomationSiriSuggestions/Resolvers/ValueResolver.swift");
      swift_bridgeObjectRelease();
      sub_37A50();
    }
    else
    {
      sub_1C518(2, v19);
      if (qword_4CD30 != -1) {
        swift_once();
      }
      sub_23E8(v1, (uint64_t)static Log.general);
      sub_27F68();
      sub_38020(52);
      sub_27F48((uint64_t)"Converted value: ");
      [v22 doubleValue];
      sub_27F7C((uint64_t)v23);
      v26._uint64_t countAndFlagsBits = 0xD00000000000001FLL;
      v26._object = (void *)0x800000000003DEF0;
      sub_37E70(v26);
      sub_27F7C((uint64_t)v23);
      sub_27F0C(v23[0], 0xD000000000000074, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SiriHomeAutomation/HomeAutomationSiriSuggestions/Resolvers/ValueResolver.swift");
      swift_bridgeObjectRelease();
      sub_37A50();
    }
    uint64_t v21 = sub_37A40();

    return (id)v21;
  }
  else
  {

    return v22;
  }
}

unint64_t sub_27AD0()
{
  unint64_t result = qword_4D800;
  if (!qword_4D800)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_4D800);
  }
  return result;
}

unint64_t sub_27B10()
{
  unint64_t result = qword_4D808;
  if (!qword_4D808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D808);
  }
  return result;
}

uint64_t sub_27B5C()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_27B9C()
{
  sub_27B5C();
  return _swift_deallocClassInstance(v0, 64, 7);
}

void *sub_27BD0()
{
  uint64_t v1 = sub_37C30();
  sub_4EA8();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  sub_27F30();
  (*(void (**)(void *, void, uint64_t))(v3 + 104))(v0, enum case for SuggestionParameter.value(_:), v1);
  uint64_t v5 = sub_37C20();
  uint64_t v7 = v6;
  uint64_t v8 = (*(uint64_t (**)(void *, uint64_t))(v3 + 8))(v0, v1);
  v0[2] = v5;
  v0[3] = v7;
  sub_33928(v8, v9, v10, v11, v12, v13, v14, v15);
  v0[4] = &off_4A218;
  sub_33818(v16, v17, v18, v19, v20, v21, v22, v23);
  v0[5] = &off_4A248;
  sub_33818(v24, v25, v26, v27, v28, v29, v30, v31);
  v0[6] = &off_4A280;
  sub_33818(v32, v33, v34, v35, v36, v37, v38, v39);
  v0[7] = &off_4A2B8;
  return v0;
}

uint64_t sub_27D00(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_21FC;
  return sub_27094((uint64_t)v4, a2);
}

uint64_t sub_27D98(Swift::Int a1)
{
  if (a1 < 16) {
    return 0;
  }
  sub_38020(a1);
  return 0;
}

uint64_t type metadata accessor for ValueResolver()
{
  return self;
}

uint64_t sub_27E04()
{
  return sub_27E6C((unint64_t *)&unk_4D8D0);
}

uint64_t sub_27E38()
{
  return sub_27E6C(&qword_4D8E0);
}

uint64_t sub_27E6C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for ValueResolver();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_27EAC(uint64_t a1)
{
  uint64_t v2 = sub_2420(&qword_4D188);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_27F0C(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v6 = v3;
  unint64_t v5 = (a3 - 32) | 0x8000000000000000;
  Logger.debug(output:test:caller:)(*(Swift::String *)&a1, 0, *(Swift::String *)&a2);
}

void sub_27F48(uint64_t a1@<X8>)
{
  v2._uint64_t countAndFlagsBits = 0xD000000000000011;
  v2._object = (void *)((a1 - 32) | 0x8000000000000000);
  sub_37E70(v2);
}

void sub_27F68()
{
  *(void *)(v0 - 80) = 0;
  *(void *)(v0 - 72) = 0xE000000000000000;
}

uint64_t sub_27F7C(uint64_t a1)
{
  return Double.write<A>(to:)(a1, v1, v2);
}

uint64_t sub_27F94(uint64_t a1, uint64_t a2)
{
  v3[2] = a2;
  v3[3] = v2;
  uint64_t v4 = sub_37D90();
  v3[4] = v4;
  uint64_t v3[5] = *(void *)(v4 - 8);
  v3[6] = swift_task_alloc();
  v3[7] = swift_task_alloc();
  return _swift_task_switch(sub_28064, 0, 0);
}

uint64_t sub_28064()
{
  sub_23A4(*(void **)(v0 + 16), *(void *)(*(void *)(v0 + 16) + 24));
  *(void *)(v0 + 64) = sub_377B0();
  *(void *)(v0 + 72) = v1;
  *(void *)(v0 + 80) = swift_getObjectType();
  uint64_t v3 = sub_37F40();
  return _swift_task_switch(sub_28114, v3, v2);
}

uint64_t sub_28114()
{
  sub_2B238();
  uint64_t v2 = v1;
  uint64_t v4 = v3;
  swift_unknownObjectRelease();
  *(void *)(v0 + 88) = v2;
  *(void *)(v0 + 96) = v4;
  return _swift_task_switch(sub_2819C, 0, 0);
}

uint64_t sub_2819C()
{
  uint64_t v25 = v0;
  uint64_t v1 = (void *)v0[12];
  if (v1)
  {
    if (qword_4CD38 != -1) {
      swift_once();
    }
    uint64_t v2 = v0[11];
    uint64_t v3 = v0[7];
    uint64_t v4 = v0[4];
    uint64_t v5 = v0[5];
    uint64_t v6 = v0[3];
    uint64_t v7 = sub_23E8(v4, (uint64_t)static Log.suggestions);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v3, v7, v4);
    sub_38020(27);
    swift_bridgeObjectRelease();
    v24._uint64_t countAndFlagsBits = 0xD000000000000013;
    v24._object = (void *)0x800000000003A880;
    uint64_t v8 = *(void *)(v6 + 16);
    uint64_t v9 = *(void **)(v6 + 24);
    swift_bridgeObjectRetain();
    v27._uint64_t countAndFlagsBits = v8;
    v27._object = v9;
    sub_37E70(v27);
    swift_bridgeObjectRelease();
    v28._uint64_t countAndFlagsBits = 544175136;
    v28._object = (void *)0xE400000000000000;
    sub_37E70(v28);
    swift_bridgeObjectRetain();
    v29._uint64_t countAndFlagsBits = v2;
    v29._object = v1;
    sub_37E70(v29);
    swift_bridgeObjectRelease();
    v10._uint64_t countAndFlagsBits = 0xD000000000000013;
    v11._object = (void *)0x800000000003E050;
    v10._object = (void *)0x800000000003A880;
    v11._uint64_t countAndFlagsBits = 0xD00000000000007CLL;
    Logger.debug(output:test:caller:)(v10, 0, v11);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
    sub_2420(&qword_4CEF0);
    uint64_t v12 = (void *)swift_allocObject();
    *((_OWORD *)v12 + 1) = xmmword_385B0;
    v12[7] = &type metadata for String;
    v12[4] = v2;
    void v12[5] = v1;
  }
  else
  {
    if (qword_4CD38 != -1) {
      swift_once();
    }
    uint64_t v14 = v0[5];
    uint64_t v13 = v0[6];
    uint64_t v16 = v0[3];
    uint64_t v15 = v0[4];
    uint64_t v17 = sub_23E8(v15, (uint64_t)static Log.suggestions);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(v13, v17, v15);
    sub_38020(16);
    swift_bridgeObjectRelease();
    strcpy((char *)&v24, "Couldn't find ");
    HIBYTE(v24._object) = -18;
    uint64_t v18 = *(void *)(v16 + 16);
    uint64_t v19 = *(void **)(v16 + 24);
    swift_bridgeObjectRetain();
    v30._uint64_t countAndFlagsBits = v18;
    v30._object = v19;
    sub_37E70(v30);
    swift_bridgeObjectRelease();
    v20._uint64_t countAndFlagsBits = 0xD00000000000003FLL;
    v21._object = (void *)0x800000000003E050;
    v20._object = (void *)0x800000000003D100;
    v21._uint64_t countAndFlagsBits = 0xD00000000000007CLL;
    Logger.warning(output:test:file:function:line:)(v24, 0, v21, v20, 18);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
    uint64_t v12 = _swiftEmptyArrayStorage;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v22 = (uint64_t (*)(void *))v0[1];
  return v22(v12);
}

uint64_t type metadata accessor for AccessoryNameResolver()
{
  return self;
}

uint64_t sub_28518()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_37C30();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for SuggestionParameter.accessoryName(_:), v2);
  uint64_t v6 = sub_37C20();
  uint64_t v8 = v7;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *(void *)(v1 + 16) = v6;
  *(void *)(v1 + 24) = v8;
  return v1;
}

uint64_t sub_28618(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_21FC;
  return sub_27F94((uint64_t)v4, a2);
}

uint64_t sub_286B0()
{
  return sub_28718((unint64_t *)&unk_4D990);
}

uint64_t sub_286E4()
{
  return sub_28718(&qword_4D9A0);
}

uint64_t sub_28718(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for AccessoryNameResolver();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_28758()
{
  sub_11914();
  v1[10] = v2;
  v1[11] = v0;
  uint64_t v3 = sub_37D90();
  v1[12] = v3;
  v1[13] = *(void *)(v3 - 8);
  v1[14] = swift_task_alloc();
  v1[15] = swift_task_alloc();
  return _swift_task_switch(sub_28824, 0, 0);
}

uint64_t sub_28824()
{
  sub_23A4(*(void **)(v0 + 80), *(void *)(*(void *)(v0 + 80) + 24));
  *(void *)(v0 + 128) = sub_377B0();
  *(void *)(v0 + 136) = v1;
  *(void *)(v0 + 144) = swift_getObjectType();
  uint64_t v3 = sub_37F40();
  return _swift_task_switch(sub_288D4, v3, v2);
}

uint64_t sub_288D4()
{
  sub_11914();
  sub_2A978();
  char v2 = v1;
  *(void *)(v0 + 64) = v3;
  *(unsigned char *)(v0 + 72) = v1;
  swift_unknownObjectRelease();
  *(unsigned char *)(v0 + 200) = v2;
  return _swift_task_switch(sub_28954, 0, 0);
}

uint64_t sub_28954()
{
  if (*(unsigned char *)(v0 + 200))
  {
    if (qword_4CD38 != -1) {
      swift_once();
    }
    uint64_t v7 = *(void *)(v0 + 104);
    uint64_t v6 = *(void *)(v0 + 112);
    uint64_t v9 = *(void *)(v0 + 88);
    uint64_t v8 = *(void *)(v0 + 96);
    uint64_t v10 = sub_23E8(v8, (uint64_t)static Log.suggestions);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v6, v10, v8);
    sub_38020(33);
    swift_bridgeObjectRelease();
    uint64_t v11 = *(void *)(v9 + 16);
    uint64_t v12 = *(void **)(v9 + 24);
    swift_bridgeObjectRetain();
    v18._uint64_t countAndFlagsBits = v11;
    v18._object = v12;
    sub_37E70(v18);
    swift_bridgeObjectRelease();
    v13._uint64_t countAndFlagsBits = 0xD00000000000001FLL;
    v14._uint64_t countAndFlagsBits = 0xD00000000000003FLL;
    v15._uint64_t countAndFlagsBits = 0xD00000000000007CLL;
    v15._object = (void *)0x800000000003E140;
    v14._object = (void *)0x800000000003D100;
    v13._object = (void *)0x800000000003E120;
    Logger.warning(output:test:file:function:line:)(v13, 0, v15, v14, 19);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v16 = *(uint64_t (**)(void *))(v0 + 8);
    return v16(_swiftEmptyArrayStorage);
  }
  else
  {
    uint64_t v1 = *(void *)(v0 + 88);
    uint64_t v2 = *(void *)(v1 + 16);
    *(void *)(v0 + 152) = v2;
    uint64_t v3 = *(void **)(v1 + 24);
    *(void *)(v0 + 160) = v3;
    type metadata accessor for SuggestionEntityRetrieval();
    *(void *)(v0 + 168) = swift_initStackObject();
    swift_bridgeObjectRetain();
    *(void *)(v0 + 176) = sub_2F6AC(v2, v3);
    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v0 + 184) = v4;
    *uint64_t v4 = v0;
    v4[1] = sub_28BCC;
    return sub_32268();
  }
}

uint64_t sub_28BCC()
{
  sub_11914();
  sub_11820();
  *(void *)(v1 + 192) = v0;
  swift_task_dealloc();
  swift_release();
  return _swift_task_switch(sub_28CC4, 0, 0);
}

uint64_t sub_28CC4()
{
  uint64_t v1 = v0[24];
  if (*(void *)(v1 + 16) < 2uLL)
  {
    swift_bridgeObjectRelease();
    if (qword_4CD38 != -1) {
      swift_once();
    }
    sub_23E8(v0[12], (uint64_t)static Log.suggestions);
    v11._uint64_t countAndFlagsBits = 0xD00000000000001DLL;
    v11._object = (void *)0x800000000003E1C0;
    v12._object = (void *)0x800000000003E140;
    v12._uint64_t countAndFlagsBits = 0xD00000000000007CLL;
    Logger.debug(output:test:caller:)(v11, 0, v12);
    uint64_t v10 = _swiftEmptyArrayStorage;
  }
  else
  {
    if (qword_4CD38 != -1)
    {
      swift_once();
      uint64_t v1 = v0[24];
    }
    uint64_t v3 = v0[19];
    uint64_t v2 = (void *)v0[20];
    uint64_t v4 = v0[15];
    uint64_t v5 = v0[12];
    uint64_t v6 = v0[13];
    uint64_t v7 = sub_23E8(v5, (uint64_t)static Log.suggestions);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v4, v7, v5);
    sub_38020(27);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    v16._uint64_t countAndFlagsBits = v3;
    v16._object = v2;
    sub_37E70(v16);
    swift_bridgeObjectRelease();
    v17._uint64_t countAndFlagsBits = 544175136;
    v17._object = (void *)0xE400000000000000;
    sub_37E70(v17);
    v18._uint64_t countAndFlagsBits = sub_37EF0();
    sub_37E70(v18);
    swift_bridgeObjectRelease();
    v8._uint64_t countAndFlagsBits = 0xD000000000000013;
    v9._object = (void *)0x800000000003E140;
    v8._object = (void *)0x800000000003A880;
    v9._uint64_t countAndFlagsBits = 0xD00000000000007CLL;
    Logger.debug(output:test:caller:)(v8, 0, v9);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
    sub_2420(&qword_4CEF0);
    uint64_t v10 = (void *)swift_allocObject();
    *((_OWORD *)v10 + 1) = xmmword_385B0;
    v10[7] = sub_2420(&qword_4DA70);
    v10[4] = v1;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  Swift::String v13 = (uint64_t (*)(void *))v0[1];
  return v13(v10);
}

uint64_t type metadata accessor for SameTypeMultipleRoomsResolver()
{
  return self;
}

uint64_t sub_28F9C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_37C30();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for SuggestionParameter.sameTypeMultipleRooms(_:), v2);
  uint64_t v6 = sub_37C20();
  uint64_t v8 = v7;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *(void *)(v1 + 16) = v6;
  *(void *)(v1 + 24) = v8;
  return v1;
}

uint64_t sub_2909C()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_29134;
  return sub_28758();
}

uint64_t sub_29134()
{
  sub_11914();
  uint64_t v2 = v1;
  sub_11820();
  uint64_t v5 = *v0;
  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(v2);
}

uint64_t sub_29208()
{
  return sub_29270((unint64_t *)&unk_4DA50);
}

uint64_t sub_2923C()
{
  return sub_29270(&qword_4DA60);
}

uint64_t sub_29270(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for SameTypeMultipleRoomsResolver();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_292B0()
{
  return sub_294CC(&qword_4CC60, (uint64_t)qword_508A0);
}

uint64_t sub_292D4()
{
  return sub_294CC(&qword_4CC70, (uint64_t)qword_508D0);
}

uint64_t sub_292F8()
{
  return sub_294CC(&qword_4CC80, (uint64_t)qword_50900);
}

uint64_t sub_2931C()
{
  return sub_294CC(&qword_4CC90, (uint64_t)qword_50930);
}

uint64_t sub_29340()
{
  return sub_294CC(&qword_4CCA0, (uint64_t)qword_50960);
}

uint64_t sub_29364()
{
  return sub_294CC(&qword_4CCB0, (uint64_t)qword_50990);
}

uint64_t sub_29388()
{
  return sub_294CC(&qword_4CCC0, (uint64_t)qword_509D0);
}

uint64_t sub_293AC()
{
  return sub_294CC(&qword_4CCD0, (uint64_t)qword_50A00);
}

uint64_t sub_293D0()
{
  return sub_294CC(&qword_4CCF0, (uint64_t)qword_50A60);
}

uint64_t sub_293F4()
{
  return sub_294CC(&qword_4CD00, (uint64_t)qword_50A90);
}

uint64_t sub_29418()
{
  return sub_294CC(&qword_4CD10, (uint64_t)qword_50AC0);
}

uint64_t sub_2943C()
{
  return sub_294CC(&qword_4CD20, (uint64_t)qword_50AF0);
}

uint64_t sub_29460()
{
  return sub_294CC(&qword_4CDB0, (uint64_t)qword_50C38);
}

uint64_t sub_29484()
{
  return sub_294CC(&qword_4CDC0, (uint64_t)qword_50C68);
}

uint64_t sub_294A8()
{
  return sub_294CC(&qword_4CDD0, (uint64_t)qword_50C98);
}

uint64_t sub_294CC(void *a1, uint64_t a2)
{
  sub_38020(17);
  swift_bridgeObjectRelease();
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_37A80();
  sub_23E8(v4, a2);
  sub_37A70();
  uint64_t v5 = sub_37E30();
  uint64_t v7 = v6;
  swift_bridgeObjectRelease();
  v9._uint64_t countAndFlagsBits = v5;
  v9._object = v7;
  sub_37E70(v9);
  swift_bridgeObjectRelease();
  return 0x67677553656D6F48;
}

uint64_t sub_295AC()
{
  uint64_t v0 = sub_37A80();
  sub_4934(v0, qword_50BC0);
  uint64_t v1 = sub_23E8(v0, (uint64_t)qword_50BC0);
  uint64_t v2 = enum case for HomeSuggestionType.getStateSmokeSensor(_:);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);
  return v3(v1, v2, v0);
}

uint64_t sub_29634()
{
  uint64_t v0 = sub_37710();
  sub_4934(v0, qword_50BD8);
  uint64_t v1 = (void *)sub_23E8(v0, (uint64_t)qword_50BD8);
  *uint64_t v1 = sub_294CC(&qword_4CD78, (uint64_t)qword_50BC0);
  v1[1] = v2;
  uint64_t v3 = enum case for DialogDetails.catId(_:);
  uint64_t v4 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);
  return v4(v1, v3, v0);
}

uint64_t sub_296EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 24);
  long long v11 = *(_OWORD *)(a1 + 32);
  sub_23A4((void *)a1, v3);
  if (qword_4CD78 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_37A80();
  sub_23E8(v4, (uint64_t)qword_50BC0);
  uint64_t v5 = sub_37A70();
  uint64_t v7 = v6;
  uint64_t v8 = type metadata accessor for HomeAutomationCandidateSuggestionConfigurator();
  swift_allocObject();
  Swift::String v9 = sub_16A14(v5, v7);
  void v12[3] = v8;
  v12[4] = sub_29C44(&qword_4D0C8, (void (*)(uint64_t))type metadata accessor for HomeAutomationCandidateSuggestionConfigurator);
  v12[0] = v9;
  *(void *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = v11;
  sub_3C6C((uint64_t *)a2);
  sub_37640();
  return sub_3C1C((uint64_t)v12);
}

uint64_t sub_29838@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  *(void *)&long long v23 = a1;
  Swift::String v24 = a2;
  uint64_t v22 = sub_2420(&qword_4D048);
  sub_4EA8();
  uint64_t v21 = v2;
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_37C30();
  sub_4EA8();
  uint64_t v8 = v7;
  __chkstk_darwin(v9);
  long long v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2420(&qword_4D050);
  Swift::String v12 = (int *)type metadata accessor for ResolverParameterProperties();
  unint64_t v13 = (*(unsigned __int8 *)(*((void *)v12 - 1) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*((void *)v12 - 1) + 80);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_385B0;
  unint64_t v15 = v14 + v13;
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v11, enum case for SuggestionParameter.accessoryType(_:), v6);
  uint64_t v16 = type metadata accessor for AccessoryTypeResolver();
  swift_allocObject();
  uint64_t v17 = sub_2E370();
  Swift::String v18 = (uint64_t *)(v15 + v12[5]);
  v18[3] = v16;
  v18[4] = sub_29C44(&qword_4D0B8, (void (*)(uint64_t))type metadata accessor for AccessoryTypeResolver);
  *Swift::String v18 = v17;
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v15, v11, v6);
  *(unsigned char *)(v15 + v12[6]) = 1;
  *(unsigned char *)(v15 + v12[7]) = 0;
  sub_2420(&qword_4D060);
  sub_375B0();
  sub_4DCC(v23, (uint64_t)&v29);
  LODWORD(v16) = *(unsigned __int8 *)(v15 + v12[7]);
  sub_37800();
  swift_bridgeObjectRetain();
  sub_37C20();
  if (v16 == 1)
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v21 + 16))(v5, v15 + v12[8], v22);
    sub_377E0();
  }
  else
  {
    sub_377F0();
  }
  uint64_t v19 = v31;
  long long v23 = v30;
  sub_23A4(&v29, v30);
  sub_37C20();
  sub_3BB8(v15 + v12[5], (uint64_t)v25);
  long long v27 = v23;
  uint64_t v28 = v19;
  sub_3C6C(v26);
  sub_378A0();
  swift_release();
  swift_bridgeObjectRelease();
  sub_4E30((uint64_t)v25);
  sub_3C1C((uint64_t)v26);
  swift_bridgeObjectRelease();
  sub_4E90(&v29, v24);
  swift_setDeallocating();
  return sub_219FC();
}

ValueMetadata *type metadata accessor for GetStateSmokeSensorSuggestion()
{
  return &type metadata for GetStateSmokeSensorSuggestion;
}

uint64_t sub_29C44(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_29C8C()
{
  sub_2B8E4();
  sub_2B6CC();
  sub_4EA8();
  __chkstk_darwin();
  sub_2B67C();
  if (qword_4CD88 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_37700();
  sub_2B8AC(v0, (uint64_t)&protocol witness table for DefaultOwner);
  uint64_t v1 = sub_2B7B0();
  sub_2B81C(v1, 28, v2);
  sub_2B750();
  if (v3) {
    uint64_t v4 = sub_2B6AC();
  }
  else {
    uint64_t v4 = sub_2B4D8((uint64_t)&v10);
  }
  if (qword_4CD38 != -1) {
    uint64_t v4 = swift_once();
  }
  uint64_t v5 = sub_2B648(v4, (uint64_t)static Log.suggestions);
  v6(v5);
  sub_2B92C();
  swift_bridgeObjectRelease();
  sub_2B804((uint64_t)"Retrieved hasTargetedMoreThanOneEntity: ");
  sub_2420(&qword_4DA78);
  v11._uint64_t countAndFlagsBits = sub_2B7C4();
  sub_37E70(v11);
  swift_bridgeObjectRelease();
  sub_2B84C(v9, 0xD000000000000073, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SiriHomeAutomation/HomeAutomationSiriSuggestions/Context+SettersGetters.swift");
  swift_bridgeObjectRelease();
  uint64_t v7 = sub_2B694();
  v8(v7);
  sub_2B838();
}

void sub_29E40()
{
  sub_2B8E4();
  sub_2B6CC();
  sub_4EA8();
  __chkstk_darwin(v0);
  sub_2B67C();
  if (qword_4CD88 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_37700();
  sub_2B94C(v1, (uint64_t)&protocol witness table for DefaultOwner);
  uint64_t v2 = qword_4CDA8;
  swift_retain();
  if (v2 != -1) {
    swift_once();
  }
  sub_2B72C(&qword_50C28);
  sub_2B750();
  if (v3)
  {
    sub_2B6AC();
    sub_2B7F4();
  }
  else
  {
    uint64_t v4 = sub_2B4D8((uint64_t)&v9);
  }
  if (qword_4CD38 != -1) {
    uint64_t v4 = swift_once();
  }
  uint64_t v5 = sub_2B648(v4, (uint64_t)static Log.suggestions);
  v6(v5);
  sub_38020(27);
  swift_bridgeObjectRelease();
  sub_2B76C((uint64_t)"Retrieved containerName: ");
  sub_2420(&qword_4CFE0);
  v10._uint64_t countAndFlagsBits = sub_2B7C4();
  sub_37E70(v10);
  swift_bridgeObjectRelease();
  sub_2B6E8(0, 0xD000000000000073, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SiriHomeAutomation/HomeAutomationSiriSuggestions/Context+SettersGetters.swift");
  swift_bridgeObjectRelease();
  uint64_t v7 = sub_2B694();
  v8(v7);
  sub_2B8C8();
  sub_2B838();
}

uint64_t sub_2A02C()
{
  uint64_t v1 = sub_2B6CC();
  sub_4EA8();
  uint64_t v3 = v2;
  __chkstk_darwin(v4);
  sub_2B7DC();
  if (qword_4CD38 != -1) {
    swift_once();
  }
  sub_23E8(v1, (uint64_t)static Log.suggestions);
  uint64_t v5 = sub_2B894();
  v6(v5);
  sub_2B90C();
  swift_bridgeObjectRelease();
  v21[0] = 0xD00000000000001DLL;
  v21[1] = 0x800000000003E310;
  v24._uint64_t countAndFlagsBits = sub_37CC0();
  sub_37E70(v24);
  swift_bridgeObjectRelease();
  sub_2B870(0xD00000000000001DLL, 0xD000000000000073, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SiriHomeAutomation/HomeAutomationSiriSuggestions/Context+SettersGetters.swift");
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v0, v1);
  if (qword_4CD88 != -1) {
    swift_once();
  }
  uint64_t v7 = qword_50BF0;
  uint64_t v8 = sub_37700();
  uint64_t v22 = v8;
  long long v23 = &protocol witness table for DefaultOwner;
  v21[0] = v7;
  uint64_t v9 = qword_4CD98;
  swift_retain();
  if (v9 != -1) {
    swift_once();
  }
  Swift::String v20 = &type metadata for String;
  uint64_t v18 = sub_37CD0();
  uint64_t v19 = v10;
  sub_2B8F8();
  sub_37960();
  sub_3C1C((uint64_t)&v18);
  sub_3C1C((uint64_t)v21);
  uint64_t v22 = v8;
  long long v23 = &protocol witness table for DefaultOwner;
  v21[0] = qword_50BF0;
  uint64_t v11 = qword_4CDA0;
  swift_retain();
  if (v11 != -1) {
    swift_once();
  }
  Swift::String v20 = (void *)sub_2420(&qword_4CFE0);
  if (sub_37CE0())
  {
    uint64_t v12 = sub_37CD0();
    uint64_t v14 = v13;
    swift_release();
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v14 = 0;
  }
  uint64_t v18 = v12;
  uint64_t v19 = v14;
  sub_2B8F8();
  sub_37960();
  sub_3C1C((uint64_t)&v18);
  sub_3C1C((uint64_t)v21);
  uint64_t v22 = v8;
  long long v23 = &protocol witness table for DefaultOwner;
  v21[0] = qword_50BF0;
  uint64_t v15 = qword_4CD90;
  swift_retain();
  if (v15 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_37D60();
  Swift::String v20 = &type metadata for HomeDeviceType;
  uint64_t v18 = v16;
  sub_37960();
  sub_3C1C((uint64_t)&v18);
  return sub_3C1C((uint64_t)v21);
}

uint64_t sub_2A3B8()
{
  uint64_t v2 = sub_2B6CC();
  sub_4EA8();
  uint64_t v4 = v3;
  __chkstk_darwin(v5);
  sub_2B7DC();
  if (qword_4CD38 != -1) {
    swift_once();
  }
  sub_23E8(v2, (uint64_t)static Log.suggestions);
  uint64_t v6 = sub_2B894();
  v7(v6);
  sub_2B90C();
  swift_bridgeObjectRelease();
  v13[0] = 0xD00000000000001DLL;
  v13[1] = 0x800000000003E2D0;
  v14._uint64_t countAndFlagsBits = sub_37A00();
  sub_37E70(v14);
  swift_bridgeObjectRelease();
  sub_2B870(0xD00000000000001DLL, 0xD000000000000073, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SiriHomeAutomation/HomeAutomationSiriSuggestions/Context+SettersGetters.swift");
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v1, v2);
  uint64_t v8 = sub_37A20();
  uint64_t v9 = sub_37A20();
  if (qword_4CD88 != -1) {
    swift_once();
  }
  if (v8 == v9) {
    uint64_t v0 = 5;
  }
  uint64_t v10 = qword_50BF0;
  v13[3] = sub_37700();
  v13[4] = &protocol witness table for DefaultOwner;
  v13[0] = v10;
  void v12[3] = &type metadata for HomeAttributeType;
  v12[0] = v0;
  swift_retain();
  sub_37960();
  sub_3C1C((uint64_t)v12);
  return sub_3C1C((uint64_t)v13);
}

void sub_2A5D8()
{
  sub_2B8E4();
  sub_2B6CC();
  sub_4EA8();
  __chkstk_darwin(v0);
  sub_2B67C();
  if (qword_4CD88 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_37700();
  sub_2B94C(v1, (uint64_t)&protocol witness table for DefaultOwner);
  uint64_t v2 = qword_4CDA0;
  swift_retain();
  if (v2 != -1) {
    swift_once();
  }
  sub_2B72C(&qword_50C18);
  sub_2B750();
  if (v3)
  {
    sub_2B6AC();
    sub_2B7F4();
  }
  else
  {
    uint64_t v4 = sub_2B4D8((uint64_t)&v10);
  }
  if (qword_4CD38 != -1) {
    uint64_t v4 = swift_once();
  }
  uint64_t v5 = sub_2B648(v4, (uint64_t)static Log.suggestions);
  v6(v5);
  sub_2B790();
  swift_bridgeObjectRelease();
  sub_2B76C((uint64_t)"Retrieved accessory room: ");
  sub_2420(&qword_4CFE0);
  v11._uint64_t countAndFlagsBits = sub_2B7C4();
  sub_37E70(v11);
  swift_bridgeObjectRelease();
  sub_2B6E8(v9, 0xD000000000000073, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SiriHomeAutomation/HomeAutomationSiriSuggestions/Context+SettersGetters.swift");
  swift_bridgeObjectRelease();
  uint64_t v7 = sub_2B694();
  v8(v7);
  sub_2B8C8();
  sub_2B838();
}

void sub_2A7B4()
{
  sub_2B8E4();
  sub_2B6CC();
  sub_4EA8();
  __chkstk_darwin(v0);
  sub_2B67C();
  if (qword_4CD88 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_37700();
  sub_2B8AC(v1, (uint64_t)&protocol witness table for DefaultOwner);
  uint64_t v2 = sub_2B7B0();
  sub_2B81C(v2, 29, v3);
  sub_2B750();
  if (v4) {
    uint64_t v5 = sub_2B6AC();
  }
  else {
    uint64_t v5 = sub_2B4D8((uint64_t)&v10);
  }
  if (qword_4CD38 != -1) {
    uint64_t v5 = swift_once();
  }
  uint64_t v6 = sub_2B648(v5, (uint64_t)static Log.suggestions);
  v7(v6);
  sub_38020(43);
  swift_bridgeObjectRelease();
  sub_2B804((uint64_t)"Retrieved isSingleAccessoryOfTypeInHome: ");
  sub_2420(&qword_4DA78);
  v11._uint64_t countAndFlagsBits = sub_2B7C4();
  sub_37E70(v11);
  swift_bridgeObjectRelease();
  sub_2B84C(0, 0xD000000000000073, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SiriHomeAutomation/HomeAutomationSiriSuggestions/Context+SettersGetters.swift");
  swift_bridgeObjectRelease();
  uint64_t v8 = sub_2B694();
  v9(v8);
  sub_2B838();
}

void sub_2A978()
{
  sub_2B8E4();
  sub_2B6CC();
  sub_4EA8();
  __chkstk_darwin(v0);
  sub_2B67C();
  if (qword_4CD88 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_37700();
  sub_2B94C(v1, (uint64_t)&protocol witness table for DefaultOwner);
  uint64_t v2 = qword_4CD90;
  swift_retain();
  if (v2 != -1) {
    swift_once();
  }
  sub_2B72C(&qword_50BF8);
  sub_2B750();
  if (v3)
  {
    uint64_t v4 = sub_2B6AC();
    if (v4)
    {
      char v5 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v4 = sub_2B4D8((uint64_t)&v11);
  }
  char v5 = 1;
LABEL_10:
  if (qword_4CD38 != -1) {
    uint64_t v4 = swift_once();
  }
  uint64_t v6 = sub_2B648(v4, (uint64_t)static Log.suggestions);
  v7(v6);
  sub_2B790();
  swift_bridgeObjectRelease();
  uint64_t v8 = 0;
  if ((v5 & 1) == 0) {
    uint64_t v8 = sub_379F0();
  }
  uint64_t v11 = v8;
  char v12 = v5;
  sub_2420(&qword_4DA88);
  v13._uint64_t countAndFlagsBits = sub_2B7C4();
  sub_37E70(v13);
  swift_bridgeObjectRelease();
  sub_2B6E8(0xD00000000000001ALL, 0xD000000000000073, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SiriHomeAutomation/HomeAutomationSiriSuggestions/Context+SettersGetters.swift");
  swift_bridgeObjectRelease();
  uint64_t v9 = sub_2B694();
  v10(v9);
  sub_2B838();
}

uint64_t sub_2AB80(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8, uint64_t a9, uint64_t a10, char a11, char a12)
{
  if ((a2 & 1) == 0)
  {
    if (qword_4CD88 != -1) {
      swift_once();
    }
    sub_37700();
    sub_2B8D8();
    uint64_t v17 = qword_4CD90;
    swift_retain();
    if (v17 != -1) {
      swift_once();
    }
    uint64_t v31 = &type metadata for HomeDeviceType;
    uint64_t v29 = a1;
    sub_2B70C();
    sub_3C1C((uint64_t)&v29);
    sub_3C1C((uint64_t)v32);
  }
  if (a4)
  {
    uint64_t v18 = qword_4CD88;
    swift_bridgeObjectRetain();
    if (v18 != -1) {
      swift_once();
    }
    sub_37700();
    sub_2B8D8();
    uint64_t v19 = qword_4CD98;
    swift_retain();
    if (v19 != -1) {
      swift_once();
    }
    uint64_t v31 = &type metadata for String;
    uint64_t v29 = a3;
    uint64_t v30 = a4;
    sub_2B70C();
    sub_3C1C((uint64_t)&v29);
    sub_3C1C((uint64_t)v32);
  }
  if (a6)
  {
    uint64_t v20 = qword_4CD88;
    swift_bridgeObjectRetain();
    if (v20 != -1) {
      swift_once();
    }
    sub_37700();
    sub_2B8D8();
    uint64_t v21 = qword_4CDA0;
    swift_retain();
    if (v21 != -1) {
      swift_once();
    }
    uint64_t v31 = &type metadata for String;
    uint64_t v29 = a5;
    uint64_t v30 = a6;
    sub_2B70C();
    sub_3C1C((uint64_t)&v29);
    sub_3C1C((uint64_t)v32);
  }
  if ((a8 & 1) == 0)
  {
    if (qword_4CD88 != -1) {
      swift_once();
    }
    sub_37700();
    sub_2B8D8();
    uint64_t v31 = &type metadata for HomeAttributeType;
    uint64_t v29 = a7;
    swift_retain();
    sub_37960();
    sub_3C1C((uint64_t)&v29);
    sub_3C1C((uint64_t)v32);
  }
  if (a10)
  {
    uint64_t v22 = qword_4CD88;
    swift_bridgeObjectRetain();
    if (v22 != -1) {
      swift_once();
    }
    sub_37700();
    sub_2B8D8();
    uint64_t v23 = qword_4CDA8;
    swift_retain();
    if (v23 != -1) {
      swift_once();
    }
    uint64_t v31 = &type metadata for String;
    uint64_t v29 = a9;
    uint64_t v30 = a10;
    sub_2B70C();
    sub_3C1C((uint64_t)&v29);
    sub_3C1C((uint64_t)v32);
  }
  if (qword_4CD88 != -1) {
    swift_once();
  }
  uint64_t v24 = qword_50BF0;
  uint64_t v25 = sub_37700();
  uint64_t v33 = v25;
  uint64_t v34 = &protocol witness table for DefaultOwner;
  v32[0] = v24;
  uint64_t v31 = &type metadata for Bool;
  LOBYTE(v29) = a11 & 1;
  swift_retain();
  sub_2B70C();
  sub_3C1C((uint64_t)&v29);
  sub_3C1C((uint64_t)v32);
  uint64_t v33 = v25;
  uint64_t v34 = &protocol witness table for DefaultOwner;
  uint64_t v31 = &type metadata for Bool;
  v32[0] = qword_50BF0;
  LOBYTE(v29) = a12 & 1;
  swift_retain();
  sub_2B70C();
  sub_3C1C((uint64_t)&v29);
  return sub_3C1C((uint64_t)v32);
}

void sub_2B05C()
{
  sub_2B8E4();
  sub_2B6CC();
  sub_4EA8();
  __chkstk_darwin(v0);
  sub_2B67C();
  if (qword_4CD88 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_37700();
  sub_2B8AC(v1, (uint64_t)&protocol witness table for DefaultOwner);
  uint64_t v2 = sub_2B7B0();
  sub_2B81C(v2, 18, v3);
  sub_2B750();
  if (v4)
  {
    uint64_t v5 = sub_2B6AC();
    if (v5)
    {
      char v6 = 0;
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v5 = sub_2B4D8((uint64_t)&v12);
  }
  char v6 = 1;
LABEL_8:
  if (qword_4CD38 != -1) {
    uint64_t v5 = swift_once();
  }
  uint64_t v7 = sub_2B648(v5, (uint64_t)static Log.suggestions);
  v8(v7);
  sub_2B92C();
  swift_bridgeObjectRelease();
  uint64_t v9 = 0;
  if ((v6 & 1) == 0) {
    uint64_t v9 = sub_37A20();
  }
  uint64_t v12 = v9;
  char v13 = v6;
  sub_2420(&qword_4DA88);
  v14._uint64_t countAndFlagsBits = sub_2B7C4();
  sub_37E70(v14);
  swift_bridgeObjectRelease();
  sub_2B6E8(0xD000000000000028, 0xD000000000000073, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SiriHomeAutomation/HomeAutomationSiriSuggestions/Context+SettersGetters.swift");
  swift_bridgeObjectRelease();
  uint64_t v10 = sub_2B694();
  v11(v10);
  sub_2B838();
}

void sub_2B238()
{
  sub_2B8E4();
  sub_2B6CC();
  sub_4EA8();
  __chkstk_darwin(v0);
  sub_2B67C();
  if (qword_4CD88 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_37700();
  sub_2B94C(v1, (uint64_t)&protocol witness table for DefaultOwner);
  uint64_t v2 = qword_4CD98;
  swift_retain();
  if (v2 != -1) {
    swift_once();
  }
  sub_2B72C(&qword_50C08);
  sub_2B750();
  if (v3)
  {
    sub_2B6AC();
    sub_2B7F4();
  }
  else
  {
    uint64_t v4 = sub_2B4D8((uint64_t)&v10);
  }
  if (qword_4CD38 != -1) {
    uint64_t v4 = swift_once();
  }
  uint64_t v5 = sub_2B648(v4, (uint64_t)static Log.suggestions);
  v6(v5);
  sub_2B790();
  swift_bridgeObjectRelease();
  sub_2B76C((uint64_t)"Retrieved accessory name: ");
  sub_2420(&qword_4CFE0);
  v11._uint64_t countAndFlagsBits = sub_2B7C4();
  sub_37E70(v11);
  swift_bridgeObjectRelease();
  sub_2B6E8(v9, 0xD000000000000073, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/SiriHomeAutomation/HomeAutomationSiriSuggestions/Context+SettersGetters.swift");
  swift_bridgeObjectRelease();
  uint64_t v7 = sub_2B694();
  v8(v7);
  sub_2B8C8();
  sub_2B838();
}

uint64_t sub_2B414()
{
  uint64_t v0 = sub_37820();
  v3[3] = v0;
  v3[4] = sub_2B5F8();
  uint64_t v1 = sub_3C6C(v3);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v0 - 8) + 104))(v1, enum case for CoreSuggestionGroups.domain(_:), v0);
  sub_37700();
  swift_allocObject();
  uint64_t result = sub_376F0();
  qword_50BF0 = result;
  return result;
}

uint64_t sub_2B4D8(uint64_t a1)
{
  uint64_t v2 = sub_2420(&qword_4D060);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_2B538()
{
  unk_50C06 = -4864;
}

void sub_2B568()
{
  unk_50C16 = -4864;
}

void sub_2B598()
{
  unk_50C26 = -4864;
}

void sub_2B5C8()
{
  unk_50C36 = -4864;
}

unint64_t sub_2B5F8()
{
  unint64_t result = qword_4DA80;
  if (!qword_4DA80)
  {
    sub_37820();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4DA80);
  }
  return result;
}

uint64_t sub_2B648(uint64_t a1, uint64_t a2)
{
  sub_23E8(v2, a2);
  return v3;
}

uint64_t sub_2B694()
{
  return v0;
}

uint64_t sub_2B6AC()
{
  return swift_dynamicCast();
}

uint64_t sub_2B6CC()
{
  return sub_37D90();
}

void sub_2B6E8(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v6 = v3;
  unint64_t v5 = (a3 - 32) | 0x8000000000000000;
  Logger.debug(output:test:caller:)(*(Swift::String *)&a1, 0, *(Swift::String *)&a2);
}

uint64_t sub_2B70C()
{
  return sub_37960();
}

uint64_t sub_2B72C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v5 = *a1;
  uint64_t v6 = a1[1];
  return Context.getParam(for:key:)(v3 - 136, v5, v6, v2, v1);
}

uint64_t sub_2B750()
{
  return sub_3C1C(v0 - 136);
}

uint64_t sub_2B76C@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v4 - 136) = v3;
  *(void *)(v4 - 128) = (a1 - 32) | 0x8000000000000000;
  *(void *)(v4 - 96) = v1;
  *(void *)(v4 - 88) = v2;
  return swift_bridgeObjectRetain();
}

void sub_2B790()
{
  *(void *)(v0 - 136) = 0;
  *(void *)(v0 - 128) = 0xE000000000000000;
  sub_38020(28);
}

uint64_t sub_2B7B0()
{
  return v0 - 136;
}

uint64_t sub_2B7C4()
{
  return sub_37E00();
}

void sub_2B804(uint64_t a1@<X8>)
{
  *(void *)(v3 - 136) = v2 + 12;
  *(void *)(v3 - 128) = (a1 - 32) | 0x8000000000000000;
  *(unsigned char *)(v3 - 96) = v1;
}

uint64_t sub_2B81C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = a2 & 0xFFFFFFFFFFFFLL | 0xD000000000000000;
  return Context.getParam(for:key:)(a1, v6, a3, v4, v3);
}

void sub_2B84C(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v6 = v3;
  unint64_t v5 = (a3 - 32) | 0x8000000000000000;
  Logger.debug(output:test:caller:)(*(Swift::String *)&a1, 0, *(Swift::String *)&a2);
}

void sub_2B870(uint64_t a1@<X0>, uint64_t a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v6 = v3;
  unint64_t v5 = (a3 - 32) | 0x8000000000000000;
  Logger.debug(output:test:caller:)(*(Swift::String *)&a1, 0, *(Swift::String *)&a2);
}

uint64_t sub_2B894()
{
  return v0;
}

uint64_t sub_2B8AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v3 - 112) = a1;
  *(void *)(v3 - 104) = a2;
  *(void *)(v3 - 136) = v2;
  return swift_retain();
}

uint64_t sub_2B8C8()
{
  return v0;
}

uint64_t sub_2B8F8()
{
  return v0 - 120;
}

void sub_2B90C()
{
  *(void *)(v0 - 120) = 0;
  *(void *)(v0 - 112) = 0xE000000000000000;
  sub_38020(31);
}

void sub_2B92C()
{
  *(void *)(v0 - 136) = 0;
  *(void *)(v0 - 128) = 0xE000000000000000;
  sub_38020(42);
}

uint64_t sub_2B94C@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(void *)(v3 - 112) = result;
  *(void *)(v3 - 104) = a2;
  *(void *)(v3 - 136) = v2;
  return result;
}

uint64_t sub_2B958()
{
  uint64_t v0 = sub_37A80();
  sub_4934(v0, qword_50C38);
  uint64_t v1 = sub_23E8(v0, (uint64_t)qword_50C38);
  uint64_t v2 = enum case for HomeSuggestionType.getStateOfDoorLocks(_:);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);
  return v3(v1, v2, v0);
}

uint64_t sub_2B9E0()
{
  uint64_t v0 = sub_37710();
  sub_4934(v0, qword_50C50);
  uint64_t v1 = (void *)sub_23E8(v0, (uint64_t)qword_50C50);
  *uint64_t v1 = sub_29460();
  v1[1] = v2;
  uint64_t v3 = enum case for DialogDetails.catId(_:);
  uint64_t v4 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);
  return v4(v1, v3, v0);
}

ValueMetadata *type metadata accessor for GetStateOfDoorLocks()
{
  return &type metadata for GetStateOfDoorLocks;
}

uint64_t sub_2BA88@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  *(void *)&long long v23 = a1;
  uint64_t v24 = a2;
  uint64_t v22 = sub_2420(&qword_4D048);
  sub_4EA8();
  uint64_t v21 = v2;
  __chkstk_darwin(v3);
  unint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_37C30();
  sub_4EA8();
  uint64_t v8 = v7;
  __chkstk_darwin(v9);
  Swift::String v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2420(&qword_4D050);
  uint64_t v12 = (int *)type metadata accessor for ResolverParameterProperties();
  unint64_t v13 = (*(unsigned __int8 *)(*((void *)v12 - 1) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*((void *)v12 - 1) + 80);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = xmmword_385B0;
  unint64_t v15 = v14 + v13;
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v11, enum case for SuggestionParameter.isSingleAccessoryOfTypeInHome(_:), v6);
  uint64_t IsSingleAccessoryOfTypeInHomeResolver = type metadata accessor for IsSingleAccessoryOfTypeInHomeResolver();
  swift_allocObject();
  uint64_t v17 = sub_1E0F8();
  uint64_t v18 = (uint64_t *)(v15 + v12[5]);
  v18[3] = IsSingleAccessoryOfTypeInHomeResolver;
  v18[4] = sub_4D7C();
  *uint64_t v18 = v17;
  (*(void (**)(unint64_t, char *, uint64_t))(v8 + 32))(v15, v11, v6);
  *(unsigned char *)(v15 + v12[6]) = 1;
  *(unsigned char *)(v15 + v12[7]) = 0;
  sub_2420(&qword_4D060);
  sub_375B0();
  sub_4DCC(v23, (uint64_t)&v29);
  LODWORD(IsSingleAccessoryOfTypeInHomeResolver) = *(unsigned __int8 *)(v15 + v12[7]);
  sub_37800();
  swift_bridgeObjectRetain();
  sub_37C20();
  if (IsSingleAccessoryOfTypeInHomeResolver == 1)
  {
    (*(void (**)(char *, unint64_t, uint64_t))(v21 + 16))(v5, v15 + v12[8], v22);
    sub_377E0();
  }
  else
  {
    sub_377F0();
  }
  uint64_t v19 = v31;
  long long v23 = v30;
  sub_23A4(&v29, v30);
  sub_37C20();
  sub_3BB8(v15 + v12[5], (uint64_t)v25);
  long long v27 = v23;
  uint64_t v28 = v19;
  sub_3C6C(v26);
  sub_378A0();
  swift_release();
  swift_bridgeObjectRelease();
  sub_4E30((uint64_t)v25);
  sub_3C1C((uint64_t)v26);
  swift_bridgeObjectRelease();
  sub_4E90(&v29, v24);
  swift_setDeallocating();
  return sub_219FC();
}

uint64_t sub_2BE50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[7] = a3;
  v4[8] = v3;
  v4[6] = a2;
  uint64_t v5 = sub_37D90();
  v4[9] = v5;
  sub_1BD50(v5);
  v4[10] = v6;
  v4[11] = swift_task_alloc();
  v4[12] = swift_task_alloc();
  v4[13] = swift_task_alloc();
  sub_2420(&qword_4D188);
  v4[14] = swift_task_alloc();
  uint64_t v7 = sub_37610();
  v4[15] = v7;
  sub_1BD50(v7);
  v4[16] = v8;
  v4[17] = swift_task_alloc();
  return _swift_task_switch(sub_2BF74, 0, 0);
}

uint64_t sub_2BF74()
{
  sub_23A4(*(void **)(v0 + 48), *(void *)(*(void *)(v0 + 48) + 24));
  *(void *)(v0 + 144) = sub_377B0();
  *(void *)(v0 + 152) = v1;
  *(void *)(v0 + 160) = swift_getObjectType();
  uint64_t v3 = sub_37F40();
  return _swift_task_switch(sub_2C024, v3, v2);
}

uint64_t sub_2C024()
{
  sub_2B05C();
  uint64_t v2 = v1;
  char v4 = v3;
  swift_unknownObjectRelease();
  *(void *)(v0 + 168) = v2;
  *(unsigned char *)(v0 + 176) = v4;
  return _swift_task_switch(sub_2C0B0, 0, 0);
}

uint64_t sub_2C0B0()
{
  if (*(unsigned char *)(v0 + 176))
  {
    if (qword_4CD38 != -1) {
      swift_once();
    }
    uint64_t v12 = *(void *)(v0 + 64);
    sub_23E8(*(void *)(v0 + 72), (uint64_t)static Log.suggestions);
    uint64_t v13 = sub_1E478();
    v14(v13);
    sub_1C2AC();
    sub_38020(19);
    *(void *)(v0 + 16) = v40;
    *(void *)(v0 + 24) = v41;
    v44._uint64_t countAndFlagsBits = 0x74276E646C756F43;
    v44._object = (void *)0xEE0020646E696620;
    sub_37E70(v44);
    uint64_t v15 = *(void *)(v12 + 16);
    uint64_t v16 = *(void **)(v12 + 24);
    swift_bridgeObjectRetain();
    v45._uint64_t countAndFlagsBits = v15;
    v45._object = v16;
    sub_37E70(v45);
    swift_bridgeObjectRelease();
    v46._uint64_t countAndFlagsBits = 32;
    v46._object = (void *)0xE100000000000000;
    sub_37E70(v46);
    sub_2420(&qword_4DB58);
    sub_380B0();
    sub_2C82C();
    Logger.warning(output:test:file:function:line:)(v17, v18, v19, v20, 27);
    swift_bridgeObjectRelease();
    uint64_t v21 = sub_2C840();
    v22(v21);
    goto LABEL_9;
  }
  uint64_t v1 = *(void *)(v0 + 112);
  uint64_t v2 = *(void *)(v0 + 120);
  sub_37BB0();
  if (sub_3DBC(v1, 1, v2) == 1)
  {
    sub_27EAC(*(void *)(v0 + 112));
    if (qword_4CD38 != -1) {
      swift_once();
    }
    uint64_t v3 = *(void *)(v0 + 96);
    uint64_t v4 = *(void *)(v0 + 72);
    uint64_t v5 = *(void *)(v0 + 80);
    sub_23E8(v4, (uint64_t)static Log.suggestions);
    uint64_t v6 = sub_1E478();
    v7(v6);
    sub_1C2AC();
    sub_38020(35);
    swift_bridgeObjectRelease();
    v43._uint64_t countAndFlagsBits = sub_37A00();
    sub_37E70(v43);
    swift_bridgeObjectRelease();
    sub_2C82C();
    Logger.warning(output:test:file:function:line:)(v8, v9, v10, v11, 31);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
LABEL_9:
    long long v23 = _swiftEmptyArrayStorage;
    goto LABEL_13;
  }
  (*(void (**)(void, void, void))(*(void *)(v0 + 128) + 32))(*(void *)(v0 + 136), *(void *)(v0 + 112), *(void *)(v0 + 120));
  if (qword_4CD38 != -1) {
    swift_once();
  }
  uint64_t v24 = *(void *)(v0 + 104);
  uint64_t v25 = *(void *)(v0 + 72);
  uint64_t v26 = *(void *)(v0 + 80);
  uint64_t v27 = *(void *)(v0 + 64);
  uint64_t v28 = sub_23E8(v25, (uint64_t)static Log.suggestions);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16))(v24, v28, v25);
  sub_1C2AC();
  sub_38020(27);
  *(void *)(v0 + 32) = v40;
  *(void *)(v0 + 40) = v41;
  v47._uint64_t countAndFlagsBits = 0xD000000000000013;
  v47._object = (void *)0x800000000003A880;
  sub_37E70(v47);
  uint64_t v29 = *(void *)(v27 + 16);
  long long v30 = *(void **)(v27 + 24);
  swift_bridgeObjectRetain();
  v48._uint64_t countAndFlagsBits = v29;
  v48._object = v30;
  sub_37E70(v48);
  swift_bridgeObjectRelease();
  v49._uint64_t countAndFlagsBits = 544175136;
  v49._object = (void *)0xE400000000000000;
  sub_37E70(v49);
  sub_380B0();
  sub_2C82C();
  Logger.debug(output:test:caller:)(v31, v32, v33);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v24, v25);
  sub_2420(&qword_4CEF0);
  long long v23 = (void *)swift_allocObject();
  *((_OWORD *)v23 + 1) = xmmword_385B0;
  uint64_t v34 = sub_37600();
  v23[7] = &type metadata for String;
  v23[4] = v34;
  v23[5] = v35;
  uint64_t v36 = sub_2C840();
  v37(v36);
LABEL_13:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v38 = *(uint64_t (**)(void *))(v0 + 8);
  return v38(v23);
}

uint64_t type metadata accessor for AttributeResolver()
{
  return self;
}

void *sub_2C5BC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_37C30();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for SuggestionParameter.attribute(_:), v2);
  uint64_t v6 = sub_37C20();
  uint64_t v8 = v7;
  uint64_t v9 = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v1[2] = v6;
  v1[3] = v8;
  Swift::String v19 = &off_4A1C8;
  sub_33800(v9, v10, v11, v12, v13, v14, v15, v16);
  v1[4] = v19;
  return v1;
}

uint64_t sub_2C6DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v6;
  *uint64_t v6 = v3;
  v6[1] = sub_21FC;
  return sub_2BE50((uint64_t)v6, a2, a3);
}

uint64_t sub_2C784()
{
  return sub_2C7EC((unint64_t *)&unk_4DB38);
}

uint64_t sub_2C7B8()
{
  return sub_2C7EC(&qword_4DB48);
}

uint64_t sub_2C7EC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for AttributeResolver();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2C840()
{
  return v0;
}

uint64_t sub_2C854()
{
  uint64_t v0 = sub_37A80();
  sub_4934(v0, qword_50C68);
  uint64_t v1 = sub_23E8(v0, (uint64_t)qword_50C68);
  uint64_t v2 = enum case for HomeSuggestionType.getStateOfSecuritySystems(_:);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);
  return v3(v1, v2, v0);
}

uint64_t sub_2C8DC()
{
  uint64_t v0 = sub_37710();
  sub_4934(v0, qword_50C80);
  uint64_t v1 = (void *)sub_23E8(v0, (uint64_t)qword_50C80);
  *uint64_t v1 = sub_29484();
  v1[1] = v2;
  uint64_t v3 = enum case for DialogDetails.catId(_:);
  uint64_t v4 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);
  return v4(v1, v3, v0);
}

ValueMetadata *type metadata accessor for GetStateOfSecuritySystems()
{
  return &type metadata for GetStateOfSecuritySystems;
}

uint64_t sub_2C984()
{
  uint64_t v0 = sub_37A80();
  sub_4934(v0, qword_50C98);
  uint64_t v1 = sub_23E8(v0, (uint64_t)qword_50C98);
  uint64_t v2 = enum case for HomeSuggestionType.powerAccessories(_:);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);
  return v3(v1, v2, v0);
}

uint64_t sub_2CA0C()
{
  uint64_t v0 = sub_37710();
  sub_4934(v0, qword_50CB0);
  uint64_t v1 = (void *)sub_23E8(v0, (uint64_t)qword_50CB0);
  *uint64_t v1 = sub_294A8();
  v1[1] = v2;
  uint64_t v3 = enum case for DialogDetails.catId(_:);
  uint64_t v4 = *(uint64_t (**)(void *, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);
  return v4(v1, v3, v0);
}

ValueMetadata *type metadata accessor for PowerAccessoriesSuggestion()
{
  return &type metadata for PowerAccessoriesSuggestion;
}

uint64_t sub_2CAB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 24);
  long long v11 = *(_OWORD *)(a1 + 32);
  sub_23A4((void *)a1, v3);
  if (qword_4CDD0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_37A80();
  sub_23E8(v4, (uint64_t)qword_50C98);
  uint64_t v5 = sub_37A70();
  uint64_t v7 = v6;
  uint64_t v8 = type metadata accessor for HomeAutomationCandidateSuggestionConfigurator();
  swift_allocObject();
  uint64_t v9 = sub_16A14(v5, v7);
  void v12[3] = v8;
  void v12[4] = sub_2D390(&qword_4D0C8, (void (*)(uint64_t))type metadata accessor for HomeAutomationCandidateSuggestionConfigurator);
  v12[0] = v9;
  *(void *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = v11;
  sub_3C6C((uint64_t *)a2);
  sub_37640();
  return sub_3C1C((uint64_t)v12);
}

uint64_t sub_2CC00@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v44 = a1;
  Swift::String v45 = a2;
  uint64_t v47 = sub_2420(&qword_4D048);
  sub_4EA8();
  uint64_t v46 = v2;
  __chkstk_darwin(v3);
  v51.n128_u64[0] = (unint64_t)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_37C30();
  sub_4EA8();
  uint64_t v7 = v6;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2420(&qword_4D050);
  long long v11 = (int *)type metadata accessor for ResolverParameterProperties();
  unint64_t v12 = (*(unsigned __int8 *)(*((void *)v11 - 1) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*((void *)v11 - 1) + 80);
  uint64_t v40 = *(void *)(*((void *)v11 - 1) + 72);
  uint64_t v13 = v40;
  uint64_t v14 = swift_allocObject();
  uint64_t v52 = v14;
  *(_OWORD *)(v14 + 16) = xmmword_38BF0;
  unint64_t v15 = v14 + v12;
  Swift::String v43 = *(void (**)(char *, void, uint64_t))(v7 + 104);
  v43(v10, enum case for SuggestionParameter.accessoryType(_:), v5);
  uint64_t v16 = type metadata accessor for AccessoryTypeResolver();
  swift_allocObject();
  uint64_t v17 = sub_2E370();
  uint64_t v18 = (uint64_t *)(v15 + v11[5]);
  v18[3] = v16;
  v18[4] = sub_2D390(&qword_4D0B8, (void (*)(uint64_t))type metadata accessor for AccessoryTypeResolver);
  *uint64_t v18 = v17;
  Swift::String v19 = *(void (**)(unint64_t, char *, uint64_t))(v7 + 32);
  uint64_t v41 = v7 + 32;
  uint64_t v42 = v19;
  v19(v15, v10, v5);
  *(unsigned char *)(v15 + v11[6]) = 1;
  *(unsigned char *)(v15 + v11[7]) = 1;
  uint64_t v50 = sub_2420(&qword_4D060);
  v49.n128_u64[0] = (unint64_t)&type metadata for Any + 8;
  Swift::String v48 = sub_36818;
  sub_375B0();
  unint64_t v20 = v15 + v13;
  uint64_t v21 = v43;
  v43(v10, enum case for SuggestionParameter.roomName(_:), v5);
  uint64_t v22 = type metadata accessor for RoomNameResolver();
  swift_allocObject();
  uint64_t v23 = sub_1D460();
  uint64_t v24 = (uint64_t *)(v15 + v13 + v11[5]);
  v24[3] = v22;
  v24[4] = sub_2D390((unint64_t *)&qword_4D0B0, (void (*)(uint64_t))type metadata accessor for RoomNameResolver);
  *uint64_t v24 = v23;
  uint64_t v39 = v10;
  uint64_t v25 = v5;
  uint64_t v38 = v5;
  uint64_t v26 = v5;
  uint64_t v27 = v42;
  v42(v20, v10, v26);
  *(unsigned char *)(v20 + v11[6]) = 1;
  *(unsigned char *)(v20 + v11[7]) = 0;
  sub_706C();
  unint64_t v28 = v15 + 2 * v40;
  v21(v10, enum case for SuggestionParameter.sameTypeMultipleRooms(_:), v25);
  uint64_t v29 = type metadata accessor for SameTypeMultipleRoomsResolver();
  swift_allocObject();
  uint64_t v30 = sub_28F9C();
  Swift::String v31 = (uint64_t *)(v28 + v11[5]);
  v31[3] = v29;
  v31[4] = sub_2D390(&qword_4DB60, (void (*)(uint64_t))type metadata accessor for SameTypeMultipleRoomsResolver);
  *Swift::String v31 = v30;
  v27(v28, v39, v38);
  *(unsigned char *)(v28 + v11[6]) = 0;
  *(unsigned char *)(v28 + v11[7]) = 0;
  sub_706C();
  sub_4DCC(v44, (uint64_t)&v55);
  LODWORD(v10) = *(unsigned __int8 *)(v15 + v11[7]);
  uint64_t v32 = sub_37800();
  swift_bridgeObjectRetain();
  sub_37C20();
  sub_7108();
  uint64_t v50 = v32;
  if (v10 == 1)
  {
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v46 + 16))(v51.n128_u64[0], v15 + v11[8], v47);
    sub_377E0();
  }
  else
  {
    sub_377F0();
  }
  __n128 v49 = v56;
  sub_70C0(v56.n128_f64[0]);
  sub_37C20();
  sub_3BB8(v15 + v11[5], (uint64_t)v53);
  sub_7118(v49);
  sub_703C();
  swift_release();
  swift_bridgeObjectRelease();
  sub_4E30((uint64_t)v53);
  sub_3C1C((uint64_t)v54);
  char v33 = *(unsigned char *)(v20 + v11[7]);
  sub_37C20();
  sub_7108();
  if (v33)
  {
    uint64_t v34 = v47;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v46 + 16))(v51.n128_u64[0], v20 + v11[8], v47);
    sub_7098();
  }
  else
  {
    sub_70E4();
    uint64_t v34 = v47;
  }
  __n128 v49 = v56;
  sub_70C0(v56.n128_f64[0]);
  sub_37C20();
  sub_3BB8(v20 + v11[5], (uint64_t)v53);
  sub_7118(v49);
  sub_703C();
  swift_release();
  swift_bridgeObjectRelease();
  sub_4E30((uint64_t)v53);
  sub_3C1C((uint64_t)v54);
  char v35 = *(unsigned char *)(v28 + v11[7]);
  sub_37C20();
  sub_7108();
  if (v35)
  {
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v46 + 16))(v51.n128_u64[0], v28 + v11[8], v34);
    sub_7098();
  }
  else
  {
    sub_70E4();
  }
  __n128 v51 = v56;
  sub_70C0(v56.n128_f64[0]);
  sub_37C20();
  sub_3BB8(v28 + v11[5], (uint64_t)v53);
  sub_7118(v51);
  sub_378A0();
  swift_release();
  swift_bridgeObjectRelease();
  sub_4E30((uint64_t)v53);
  sub_3C1C((uint64_t)v54);
  swift_bridgeObjectRelease();
  sub_4E90(&v55, v45);
  swift_setDeallocating();
  return sub_219FC();
}

uint64_t sub_2D390(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2D3D8()
{
  v1[8] = v0;
  uint64_t v2 = sub_37D90();
  v1[9] = v2;
  v1[10] = *(void *)(v2 - 8);
  v1[11] = swift_task_alloc();
  v1[12] = swift_task_alloc();
  return _swift_task_switch(sub_2D4A8, 0, 0);
}

uint64_t sub_2D4A8()
{
  uint64_t v1 = v0[8];
  uint64_t v2 = *(void *)(v1 + 16);
  v0[13] = v2;
  uint64_t v3 = *(void **)(v1 + 24);
  v0[14] = v3;
  type metadata accessor for SuggestionEntityRetrieval();
  v0[15] = swift_initStackObject();
  swift_bridgeObjectRetain();
  v0[16] = sub_2F6AC(v2, v3);
  uint64_t v4 = (void *)swift_task_alloc();
  v0[17] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_2D588;
  return sub_3192C();
}

uint64_t sub_2D588()
{
  sub_11820();
  *(void *)(v1 + 144) = v0;
  swift_task_dealloc();
  swift_release();
  return _swift_task_switch(sub_2D684, 0, 0);
}

uint64_t sub_2D684()
{
  uint64_t v24 = v0;
  if (v0[18])
  {
    uint64_t v1 = sub_37CD0();
    uint64_t v3 = v2;
    swift_release();
    if (qword_4CD38 != -1) {
      swift_once();
    }
    uint64_t v5 = v0[13];
    uint64_t v4 = (void *)v0[14];
    uint64_t v6 = v0[12];
    uint64_t v7 = v0[9];
    uint64_t v8 = v0[10];
    uint64_t v9 = sub_23E8(v7, (uint64_t)static Log.suggestions);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v6, v9, v7);
    sub_38020(27);
    swift_bridgeObjectRelease();
    v23._uint64_t countAndFlagsBits = 0xD000000000000013;
    v23._object = (void *)0x800000000003A880;
    swift_bridgeObjectRetain();
    v26._uint64_t countAndFlagsBits = v5;
    v26._object = v4;
    sub_37E70(v26);
    swift_bridgeObjectRelease();
    v27._uint64_t countAndFlagsBits = 544175136;
    v27._object = (void *)0xE400000000000000;
    sub_37E70(v27);
    v28._uint64_t countAndFlagsBits = v1;
    v28._object = v3;
    sub_37E70(v28);
    v10._uint64_t countAndFlagsBits = 0xD000000000000013;
    v11._object = (void *)0x800000000003E560;
    v10._object = (void *)0x800000000003A880;
    v11._uint64_t countAndFlagsBits = 0xD000000000000078;
    Logger.debug(output:test:caller:)(v10, 0, v11);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
    sub_2420(&qword_4CEF0);
    unint64_t v12 = (void *)swift_allocObject();
    *((_OWORD *)v12 + 1) = xmmword_385B0;
    v12[7] = &type metadata for String;
    void v12[4] = v1;
    void v12[5] = v3;
  }
  else
  {
    if (qword_4CD38 != -1) {
      swift_once();
    }
    uint64_t v14 = v0[13];
    uint64_t v13 = (void *)v0[14];
    uint64_t v16 = v0[10];
    uint64_t v15 = v0[11];
    uint64_t v17 = v0[9];
    uint64_t v18 = sub_23E8(v17, (uint64_t)static Log.suggestions);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v15, v18, v17);
    sub_38020(16);
    swift_bridgeObjectRelease();
    strcpy((char *)&v23, "Couldn't find ");
    HIBYTE(v23._object) = -18;
    swift_bridgeObjectRetain();
    v29._uint64_t countAndFlagsBits = v14;
    v29._object = v13;
    sub_37E70(v29);
    swift_bridgeObjectRelease();
    v19._uint64_t countAndFlagsBits = 0xD00000000000003FLL;
    v20._object = (void *)0x800000000003E560;
    v19._object = (void *)0x800000000003D100;
    v20._uint64_t countAndFlagsBits = 0xD000000000000078;
    Logger.warning(output:test:file:function:line:)(v23, 0, v20, v19, 18);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
    unint64_t v12 = _swiftEmptyArrayStorage;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v21 = (uint64_t (*)(void *))v0[1];
  return v21(v12);
}

uint64_t type metadata accessor for SceneNameResolver()
{
  return self;
}

uint64_t sub_2D9FC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_37C30();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for SuggestionParameter.sceneName(_:), v2);
  uint64_t v6 = sub_37C20();
  uint64_t v8 = v7;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *(void *)(v1 + 16) = v6;
  *(void *)(v1 + 24) = v8;
  return v1;
}

uint64_t sub_2DAFC()
{
  uint64_t v1 = (void *)swift_task_alloc();
  *(void *)(v0 + 16) = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_26E20;
  return sub_2D3D8();
}

uint64_t sub_2DB8C()
{
  return sub_2DBF4((unint64_t *)&unk_4DC08);
}

uint64_t sub_2DBC0()
{
  return sub_2DBF4(&qword_4DC18);
}

uint64_t sub_2DBF4(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for SceneNameResolver();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2DC34(uint64_t a1, uint64_t a2)
{
  uint64_t v3[5] = a2;
  v3[6] = v2;
  uint64_t v4 = sub_37D90();
  v3[7] = v4;
  sub_1BD50(v4);
  v3[8] = v5;
  v3[9] = swift_task_alloc();
  v3[10] = swift_task_alloc();
  v3[11] = swift_task_alloc();
  sub_2420(&qword_4D188);
  v3[12] = swift_task_alloc();
  uint64_t v6 = sub_37610();
  v3[13] = v6;
  sub_1BD50(v6);
  v3[14] = v7;
  v3[15] = swift_task_alloc();
  return _swift_task_switch(sub_2DD54, 0, 0);
}

uint64_t sub_2DD54()
{
  sub_23A4(*(void **)(v0 + 40), *(void *)(*(void *)(v0 + 40) + 24));
  sub_2E5C4();
  *(void *)(v0 + 128) = sub_377B0();
  *(void *)(v0 + 136) = v1;
  *(void *)(v0 + 144) = swift_getObjectType();
  uint64_t v3 = sub_37F40();
  return _swift_task_switch(sub_2DE00, v3, v2);
}

uint64_t sub_2DE00()
{
  sub_2A978();
  uint64_t v2 = v1;
  char v4 = v3;
  swift_unknownObjectRelease();
  *(void *)(v0 + 152) = v2;
  *(unsigned char *)(v0 + 160) = v4;
  return _swift_task_switch(sub_2DE8C, 0, 0);
}

uint64_t sub_2DE8C()
{
  if (*(unsigned char *)(v0 + 160))
  {
    if (qword_4CD38 != -1) {
      swift_once();
    }
    uint64_t v12 = *(void *)(v0 + 48);
    sub_23E8(*(void *)(v0 + 56), (uint64_t)static Log.suggestions);
    uint64_t v13 = sub_1E478();
    v14(v13);
    sub_1C2AC();
    sub_38020(16);
    swift_bridgeObjectRelease();
    uint64_t v15 = *(void *)(v12 + 16);
    uint64_t v16 = *(void **)(v12 + 24);
    swift_bridgeObjectRetain();
    v44._uint64_t countAndFlagsBits = v15;
    v44._object = v16;
    sub_37E70(v44);
    swift_bridgeObjectRelease();
    sub_2E5B0();
    Logger.warning(output:test:file:function:line:)(v17, v18, v19, v20, 18);
    swift_bridgeObjectRelease();
    uint64_t v21 = sub_2E5C4();
    v22(v21);
    goto LABEL_9;
  }
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v2 = *(void *)(v0 + 104);
  sub_37BA0();
  if (sub_3DBC(v1, 1, v2) == 1)
  {
    sub_27EAC(*(void *)(v0 + 96));
    if (qword_4CD38 != -1) {
      swift_once();
    }
    uint64_t v3 = *(void *)(v0 + 152);
    sub_23E8(*(void *)(v0 + 56), (uint64_t)static Log.suggestions);
    uint64_t v4 = sub_1E478();
    v5(v4);
    sub_1C2AC();
    sub_38020(35);
    swift_bridgeObjectRelease();
    *(void *)(v0 + 32) = v3;
    v43._uint64_t countAndFlagsBits = sub_37E00();
    sub_37E70(v43);
    swift_bridgeObjectRelease();
    sub_2E5B0();
    Logger.warning(output:test:file:function:line:)(v6, v7, v8, v9, 23);
    swift_bridgeObjectRelease();
    uint64_t v10 = sub_2E5C4();
    v11(v10);
LABEL_9:
    Swift::String v23 = _swiftEmptyArrayStorage;
    goto LABEL_13;
  }
  (*(void (**)(void, void, void))(*(void *)(v0 + 112) + 32))(*(void *)(v0 + 120), *(void *)(v0 + 96), *(void *)(v0 + 104));
  if (qword_4CD38 != -1) {
    swift_once();
  }
  uint64_t v24 = *(void *)(v0 + 88);
  uint64_t v25 = *(void *)(v0 + 56);
  uint64_t v26 = *(void *)(v0 + 64);
  uint64_t v27 = *(void *)(v0 + 48);
  uint64_t v28 = sub_23E8(v25, (uint64_t)static Log.suggestions);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 16))(v24, v28, v25);
  sub_1C2AC();
  sub_38020(27);
  *(void *)(v0 + 16) = v40;
  *(void *)(v0 + 24) = v41;
  v45._uint64_t countAndFlagsBits = 0xD000000000000013;
  v45._object = (void *)0x800000000003A880;
  sub_37E70(v45);
  uint64_t v29 = *(void *)(v27 + 16);
  uint64_t v30 = *(void **)(v27 + 24);
  swift_bridgeObjectRetain();
  v46._uint64_t countAndFlagsBits = v29;
  v46._object = v30;
  sub_37E70(v46);
  swift_bridgeObjectRelease();
  v47._uint64_t countAndFlagsBits = 544175136;
  v47._object = (void *)0xE400000000000000;
  sub_37E70(v47);
  sub_380B0();
  sub_2E5B0();
  Logger.debug(output:test:caller:)(v31, v32, v33);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v24, v25);
  sub_2420(&qword_4CEF0);
  Swift::String v23 = (void *)swift_allocObject();
  *((_OWORD *)v23 + 1) = xmmword_385B0;
  uint64_t v34 = sub_37600();
  v23[7] = &type metadata for String;
  v23[4] = v34;
  v23[5] = v35;
  uint64_t v36 = sub_2E5C4();
  v37(v36);
LABEL_13:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v38 = *(uint64_t (**)(void *))(v0 + 8);
  return v38(v23);
}

uint64_t type metadata accessor for AccessoryTypeResolver()
{
  return self;
}

uint64_t sub_2E370()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_37C30();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for SuggestionParameter.accessoryType(_:), v2);
  uint64_t v6 = sub_37C20();
  uint64_t v8 = v7;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  *(void *)(v1 + 16) = v6;
  *(void *)(v1 + 24) = v8;
  return v1;
}

uint64_t sub_2E470(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_21FC;
  return sub_2DC34((uint64_t)v4, a2);
}

uint64_t sub_2E508()
{
  return sub_2E570((unint64_t *)&unk_4DCC8);
}

uint64_t sub_2E53C()
{
  return sub_2E570(&qword_4DCD8);
}

uint64_t sub_2E570(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for AccessoryTypeResolver();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2E5C4()
{
  return v0;
}

uint64_t sub_2E5D0()
{
  uint64_t v0 = sub_37A80();
  sub_4934(v0, qword_50CC8);
  uint64_t v1 = sub_23E8(v0, (uint64_t)qword_50CC8);
  uint64_t v2 = enum case for HomeSuggestionType.setTemperature(_:);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);
  return v3(v1, v2, v0);
}

uint64_t sub_2E658()
{
  uint64_t v0 = sub_37710();
  sub_4934(v0, qword_50CE0);
  uint64_t v1 = (void *)sub_23E8(v0, (uint64_t)qword_50CE0);
  *uint64_t v1 = &unk_4DCE8;
  v1[1] = 0;
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104);
  return v2();
}

uint64_t sub_2E6F4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_152BC;
  return sub_2E794(a1, a2);
}

uint64_t sub_2E794(uint64_t a1, uint64_t a2)
{
  v2[24] = a1;
  v2[25] = a2;
  sub_2420(&qword_4D188);
  v2[26] = swift_task_alloc();
  v2[27] = swift_task_alloc();
  sub_37630();
  v2[28] = swift_task_alloc();
  sub_2420(&qword_4D118);
  v2[29] = swift_task_alloc();
  uint64_t v3 = sub_37590();
  v2[30] = v3;
  v2[31] = *(void *)(v3 - 8);
  v2[32] = swift_task_alloc();
  return _swift_task_switch(sub_2E8F0, 0, 0);
}

uint64_t sub_2E8F0()
{
  uint64_t v1 = *(void **)(v0 + 200);
  sub_23A4(v1, v1[3]);
  uint64_t v2 = sub_37780();
  sub_16928(0x656D614E6D6F6F72, 0xE800000000000000, v2, (_OWORD *)(v0 + 16));
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 40))
  {
    if (swift_dynamicCast()) {
      uint64_t v3 = *(void *)(v0 + 152);
    }
    else {
      uint64_t v3 = 0;
    }
  }
  else
  {
    sub_3D60(v0 + 16, &qword_4D060);
    uint64_t v3 = 0;
  }
  uint64_t v4 = sub_37780();
  sub_16928(0x7475626972747461, 0xE900000000000065, v4, (_OWORD *)(v0 + 48));
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 72))
  {
    if (swift_dynamicCast()) {
      uint64_t v5 = *(void *)(v0 + 168);
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    sub_3D60(v0 + 48, &qword_4D060);
    uint64_t v5 = 0;
  }
  uint64_t v6 = sub_37780();
  sub_16928(0x65756C6176, 0xE500000000000000, v6, (_OWORD *)(v0 + 80));
  swift_bridgeObjectRelease();
  if (!*(void *)(v0 + 104))
  {
    sub_3D60(v0 + 80, &qword_4D060);
LABEL_18:
    uint64_t v7 = 0;
    *(_OWORD *)(v0 + 112) = 0u;
    *(_OWORD *)(v0 + 128) = 0u;
    goto LABEL_19;
  }
  sub_37B50();
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_18;
  }
  uint64_t v7 = *(void *)(v0 + 176);
  sub_23A4(*(void **)(v0 + 200), v1[3]);
  swift_retain();
  sub_37790();
  sub_37AF0();
  swift_release();
  if (!v7) {
    goto LABEL_18;
  }
  swift_retain();
  sub_37AE0();
  swift_release();
  if (!*(void *)(v0 + 136))
  {
LABEL_19:
    sub_3D60(v0 + 112, &qword_4D060);
    goto LABEL_20;
  }
  sub_37B80();
  if (swift_dynamicCast())
  {
    uint64_t v8 = *(void *)(v0 + 184);
    sub_23A4(*(void **)(v0 + 200), v1[3]);
    swift_retain();
    sub_37790();
    sub_37B60();
    swift_release();
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v8 = 0;
LABEL_21:
  *(void *)(v0 + 264) = v7;
  *(void *)(v0 + 272) = v8;
  if (qword_4CD68 != -1) {
    swift_once();
  }
  uint64_t v10 = *(void *)(v0 + 224);
  uint64_t v9 = *(void *)(v0 + 232);
  Swift::String v11 = *(void **)(v0 + 200);
  sub_37570();
  sub_23A4(v11, v1[3]);
  sub_37790();
  sub_37620();
  type metadata accessor for HomeSuggestionCATs();
  swift_allocObject();
  *(void *)(v0 + 280) = HomeSuggestionCATs.init(templateDir:options:globals:)(v9, v10);
  if (v3)
  {
    sub_37E20();
    swift_bridgeObjectRelease();
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = 1;
  }
  uint64_t v13 = *(void *)(v0 + 216);
  uint64_t v14 = sub_37610();
  uint64_t v15 = 1;
  sub_3D38(v13, v12, 1, v14);
  if (v5)
  {
    sub_37E20();
    swift_bridgeObjectRelease();
    uint64_t v15 = 0;
  }
  sub_3D38(*(void *)(v0 + 208), v15, 1, v14);
  uint64_t v16 = (void *)swift_task_alloc();
  *(void *)(v0 + 288) = v16;
  *uint64_t v16 = v0;
  v16[1] = sub_159A0;
  return sub_112A0();
}

ValueMetadata *type metadata accessor for SetTemperatureSuggestion()
{
  return &type metadata for SetTemperatureSuggestion;
}

uint64_t sub_2EDB8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 24);
  long long v11 = *(_OWORD *)(a1 + 32);
  sub_23A4((void *)a1, v3);
  if (qword_4CDE0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_37A80();
  sub_23E8(v4, (uint64_t)qword_50CC8);
  uint64_t v5 = sub_37A70();
  uint64_t v7 = v6;
  uint64_t v8 = type metadata accessor for HomeAutomationCandidateSuggestionConfigurator();
  swift_allocObject();
  uint64_t v9 = sub_16A14(v5, v7);
  void v12[3] = v8;
  void v12[4] = sub_123C8(&qword_4D0C8, (void (*)(uint64_t))type metadata accessor for HomeAutomationCandidateSuggestionConfigurator);
  v12[0] = v9;
  *(void *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = v11;
  sub_3C6C((uint64_t *)a2);
  sub_37640();
  return sub_3C1C((uint64_t)v12);
}

uint64_t sub_2EF04@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v44 = a1;
  Swift::String v45 = a2;
  uint64_t v47 = sub_2420(&qword_4D048);
  sub_4EA8();
  uint64_t v46 = v2;
  __chkstk_darwin(v3);
  v51.n128_u64[0] = (unint64_t)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_37C30();
  sub_4EA8();
  uint64_t v7 = v6;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2420(&qword_4D050);
  long long v11 = (int *)type metadata accessor for ResolverParameterProperties();
  unint64_t v12 = (*(unsigned __int8 *)(*((void *)v11 - 1) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*((void *)v11 - 1) + 80);
  uint64_t v40 = *(void *)(*((void *)v11 - 1) + 72);
  uint64_t v13 = v40;
  uint64_t v14 = swift_allocObject();
  uint64_t v52 = v14;
  *(_OWORD *)(v14 + 16) = xmmword_38BF0;
  unint64_t v15 = v14 + v12;
  Swift::String v43 = *(void (**)(char *, void, uint64_t))(v7 + 104);
  v43(v10, enum case for SuggestionParameter.roomName(_:), v5);
  uint64_t v16 = type metadata accessor for RoomNameResolver();
  swift_allocObject();
  uint64_t v17 = sub_1D460();
  uint64_t v18 = (uint64_t *)(v15 + v11[5]);
  v18[3] = v16;
  v18[4] = sub_123C8((unint64_t *)&qword_4D0B0, (void (*)(uint64_t))type metadata accessor for RoomNameResolver);
  *uint64_t v18 = v17;
  Swift::String v19 = *(void (**)(unint64_t, char *, uint64_t))(v7 + 32);
  uint64_t v41 = v7 + 32;
  uint64_t v42 = v19;
  v19(v15, v10, v5);
  *(unsigned char *)(v15 + v11[6]) = 1;
  *(unsigned char *)(v15 + v11[7]) = 0;
  uint64_t v50 = sub_2420(&qword_4D060);
  v49.n128_u64[0] = (unint64_t)&type metadata for Any + 8;
  Swift::String v48 = sub_36818;
  sub_375B0();
  unint64_t v20 = v15 + v13;
  uint64_t v21 = v43;
  v43(v10, enum case for SuggestionParameter.attribute(_:), v5);
  uint64_t v22 = type metadata accessor for AttributeResolver();
  swift_allocObject();
  Swift::String v23 = sub_2C5BC();
  uint64_t v24 = (void *)(v15 + v13 + v11[5]);
  v24[3] = v22;
  v24[4] = sub_123C8(&qword_4D198, (void (*)(uint64_t))type metadata accessor for AttributeResolver);
  *uint64_t v24 = v23;
  uint64_t v39 = v10;
  uint64_t v25 = v5;
  uint64_t v38 = v5;
  uint64_t v26 = v5;
  uint64_t v27 = v42;
  v42(v20, v10, v26);
  *(unsigned char *)(v20 + v11[6]) = 1;
  *(unsigned char *)(v20 + v11[7]) = 0;
  sub_706C();
  unint64_t v28 = v15 + 2 * v40;
  v21(v10, enum case for SuggestionParameter.value(_:), v25);
  uint64_t v29 = type metadata accessor for ValueResolver();
  swift_allocObject();
  uint64_t v30 = sub_27BD0();
  Swift::String v31 = (void *)(v28 + v11[5]);
  v31[3] = v29;
  v31[4] = sub_123C8(&qword_4D1A0, (void (*)(uint64_t))type metadata accessor for ValueResolver);
  *Swift::String v31 = v30;
  v27(v28, v39, v38);
  *(unsigned char *)(v28 + v11[6]) = 0;
  *(unsigned char *)(v28 + v11[7]) = 0;
  sub_706C();
  sub_4DCC(v44, (uint64_t)&v55);
  LODWORD(v10) = *(unsigned __int8 *)(v15 + v11[7]);
  uint64_t v32 = sub_37800();
  swift_bridgeObjectRetain();
  sub_37C20();
  sub_7108();
  uint64_t v50 = v32;
  if (v10 == 1)
  {
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v46 + 16))(v51.n128_u64[0], v15 + v11[8], v47);
    sub_377E0();
  }
  else
  {
    sub_377F0();
  }
  __n128 v49 = v56;
  sub_70C0(v56.n128_f64[0]);
  sub_37C20();
  sub_3BB8(v15 + v11[5], (uint64_t)v53);
  sub_7118(v49);
  sub_703C();
  swift_release();
  swift_bridgeObjectRelease();
  sub_3D60((uint64_t)v53, &qword_4D068);
  sub_3C1C((uint64_t)v54);
  char v33 = *(unsigned char *)(v20 + v11[7]);
  sub_37C20();
  sub_7108();
  if (v33)
  {
    uint64_t v34 = v47;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v46 + 16))(v51.n128_u64[0], v20 + v11[8], v47);
    sub_7098();
  }
  else
  {
    sub_70E4();
    uint64_t v34 = v47;
  }
  __n128 v49 = v56;
  sub_70C0(v56.n128_f64[0]);
  sub_37C20();
  sub_3BB8(v20 + v11[5], (uint64_t)v53);
  sub_7118(v49);
  sub_703C();
  swift_release();
  swift_bridgeObjectRelease();
  sub_3D60((uint64_t)v53, &qword_4D068);
  sub_3C1C((uint64_t)v54);
  char v35 = *(unsigned char *)(v28 + v11[7]);
  sub_37C20();
  sub_7108();
  if (v35)
  {
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v46 + 16))(v51.n128_u64[0], v28 + v11[8], v34);
    sub_7098();
  }
  else
  {
    sub_70E4();
  }
  __n128 v51 = v56;
  sub_70C0(v56.n128_f64[0]);
  sub_37C20();
  sub_3BB8(v28 + v11[5], (uint64_t)v53);
  sub_7118(v51);
  sub_378A0();
  swift_release();
  swift_bridgeObjectRelease();
  sub_3D60((uint64_t)v53, &qword_4D068);
  sub_3C1C((uint64_t)v54);
  swift_bridgeObjectRelease();
  sub_4E90(&v55, v45);
  swift_setDeallocating();
  return sub_219FC();
}

void *sub_2F6AC(uint64_t a1, void *a2)
{
  v2[2] = a1;
  v2[3] = a2;
  swift_bridgeObjectRetain();
  sub_38020(29);
  swift_bridgeObjectRelease();
  v6._uint64_t countAndFlagsBits = a1;
  v6._object = a2;
  sub_37E70(v6);
  swift_bridgeObjectRelease();
  v7._uint64_t countAndFlagsBits = 46;
  v7._object = (void *)0xE100000000000000;
  sub_37E70(v7);
  v2[4] = 0xD00000000000001ALL;
  v2[5] = 0x800000000003E700;
  return v2;
}

uint64_t sub_2F75C()
{
  sub_11914();
  uint64_t v1 = sub_37D90();
  v0[2] = v1;
  sub_1BD50(v1);
  v0[3] = v2;
  v0[4] = swift_task_alloc();
  sub_11920();
  return _swift_task_switch(v3, v4, v5);
}

uint64_t sub_2F7EC()
{
  sub_11914();
  if (qword_4CC58 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_50898;
  *(void *)(v0 + 40) = qword_50898;
  swift_retain();
  return _swift_task_switch(sub_2F890, v1, 0);
}

uint64_t sub_2F890()
{
  sub_11914();
  *(void *)(v0 + 48) = *(void *)(*(void *)(v0 + 40) + 112);
  swift_retain();
  swift_release();
  sub_11920();
  return _swift_task_switch(v1, v2, v3);
}

uint64_t sub_2F900(uint64_t x0_0, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, Swift::String a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t *a17, uint64_t a18, uint64_t a19)
{
  sub_352F8();
  a18 = v20;
  a19 = v21;
  a17 = v19;
  if (v19[6])
  {
    if (qword_4CD38 != -1) {
      swift_once();
    }
    uint64_t v23 = v19[3];
    uint64_t v22 = v19[4];
    uint64_t v24 = v19[2];
    sub_23E8(v24, (uint64_t)static Log.suggestions);
    sub_1C09C();
    v25();
    sub_38020(45);
    swift_bridgeObjectRelease();
    strcpy((char *)&a9, "Using home: ");
    BYTE5(a9._object) = 0;
    HIWORD(a9._object) = -5120;
    swift_retain();
    uint64_t v26 = sub_37CD0();
    unint64_t v28 = v27;
    swift_release();
    v42._uint64_t countAndFlagsBits = v26;
    v42._object = v28;
    sub_37E70(v42);
    swift_bridgeObjectRelease();
    sub_1C4AC();
    sub_37E70(v43);
    v29._object = (void *)0x800000000003E790;
    v29._uint64_t countAndFlagsBits = 0xD000000000000076;
    Logger.debug(output:test:caller:)(a9, 0, v29);
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
  }
  else
  {
    if (qword_4CD38 != -1) {
      swift_once();
    }
    sub_23E8(v19[2], (uint64_t)static Log.suggestions);
    sub_1C4AC();
    v30._object = (void *)0x800000000003E790;
    v30._uint64_t countAndFlagsBits = 0xD000000000000076;
    v31._uint64_t countAndFlagsBits = 0x28656D6F48746567;
    v31._object = (void *)0xE900000000000029;
    Logger.warning(output:test:file:function:line:)(v32, 0, v30, v31, 35);
  }
  swift_task_dealloc();
  sub_1E414();
  return v35(v33, v34, v35, v36, v37, v38, v39, v40, a9._countAndFlagsBits, a9._object, a10, a11);
}

uint64_t sub_2FB44()
{
  sub_11914();
  v1[2] = v2;
  v1[3] = v0;
  uint64_t v3 = (void *)swift_task_alloc();
  v1[4] = v3;
  *uint64_t v3 = v1;
  v3[1] = sub_2FBD0;
  return sub_2F75C();
}

uint64_t sub_2FBD0()
{
  sub_11914();
  sub_11820();
  sub_1C39C();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 40) = v3;
  swift_task_dealloc();
  sub_11920();
  return _swift_task_switch(v4, v5, v6);
}

uint64_t sub_2FC9C()
{
  if (v0[5])
  {
    uint64_t v1 = (void *)v0[2];
    int64_t v2 = sub_37990();
    uint64_t v3 = sub_32758(v1, v2, 0, 1);
    swift_bridgeObjectRelease();
    swift_release();
  }
  else
  {
    if (qword_4CD38 != -1) {
      swift_once();
    }
    uint64_t v4 = sub_37D90();
    sub_23E8(v4, (uint64_t)static Log.suggestions);
    sub_1C4AC();
    sub_35268();
    v5._uint64_t countAndFlagsBits = 0xD000000000000027;
    Logger.warning(output:test:file:function:line:)(v6, v7, v8, v5, 47);
    uint64_t v3 = 0;
  }
  uint64_t v9 = (uint64_t (*)(uint64_t))v0[1];
  return v9(v3);
}

uint64_t sub_2FDE0()
{
  sub_11914();
  v1[22] = v2;
  v1[23] = v0;
  uint64_t v3 = sub_37D90();
  v1[24] = v3;
  sub_1BD50(v3);
  v1[25] = v4;
  v1[26] = swift_task_alloc();
  v1[27] = swift_task_alloc();
  v1[28] = swift_task_alloc();
  v1[29] = swift_task_alloc();
  v1[30] = swift_task_alloc();
  v1[31] = swift_task_alloc();
  v1[32] = swift_task_alloc();
  v1[33] = swift_task_alloc();
  Swift::String v5 = (void *)swift_task_alloc();
  v1[34] = v5;
  *Swift::String v5 = v1;
  v5[1] = sub_2FEFC;
  return sub_2F75C();
}

uint64_t sub_2FEFC()
{
  sub_11914();
  sub_11820();
  sub_1C39C();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 280) = v3;
  swift_task_dealloc();
  sub_11920();
  return _swift_task_switch(v4, v5, v6);
}

uint64_t sub_2FFC8()
{
  if (!v0[35])
  {
    if (qword_4CD38 != -1) {
      goto LABEL_199;
    }
    goto LABEL_116;
  }
  uint64_t v2 = v0[25];
  uint64_t v3 = v0[22];
  uint64_t v167 = v0[23];
  uint64_t v164 = v3 + 64;
  uint64_t v4 = -1;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  if (-v5 < 64) {
    uint64_t v4 = ~(-1 << -(char)v5);
  }
  unint64_t v6 = v4 & *(void *)(v3 + 64);
  int64_t v165 = (unint64_t)(63 - v5) >> 6;
  Swift::String v174 = (void (**)(void))(v2 + 16);
  Swift::String v179 = (void (**)(uint64_t, uint64_t))(v2 + 8);
  swift_bridgeObjectRetain_n();
  int64_t v7 = 0;
  uint64_t v166 = v3;
LABEL_5:
  uint64_t v168 = v3;
  while (1)
  {
    if (v6)
    {
      unint64_t v8 = __clz(__rbit64(v6));
      v6 &= v6 - 1;
      unint64_t v9 = v8 | (v7 << 6);
      goto LABEL_19;
    }
    BOOL v10 = __OFADD__(v7++, 1);
    if (v10) {
      goto LABEL_193;
    }
    if (v7 >= v165) {
      break;
    }
    unint64_t v11 = *(void *)(v164 + 8 * v7);
    if (!v11)
    {
      int64_t v12 = v7 + 1;
      if (v7 + 1 >= v165) {
        break;
      }
      unint64_t v11 = *(void *)(v164 + 8 * v12);
      if (!v11)
      {
        int64_t v12 = v7 + 2;
        if (v7 + 2 >= v165) {
          break;
        }
        unint64_t v11 = *(void *)(v164 + 8 * v12);
        if (!v11)
        {
          int64_t v12 = v7 + 3;
          if (v7 + 3 >= v165) {
            break;
          }
          unint64_t v11 = *(void *)(v164 + 8 * v12);
          if (!v11)
          {
            while (1)
            {
              int64_t v7 = v12 + 1;
              if (__OFADD__(v12, 1)) {
                break;
              }
              if (v7 >= v165) {
                goto LABEL_73;
              }
              unint64_t v11 = *(void *)(v164 + 8 * v7);
              ++v12;
              if (v11) {
                goto LABEL_18;
              }
            }
LABEL_198:
            __break(1u);
LABEL_199:
            swift_once();
            uint64_t v0 = v180;
LABEL_116:
            sub_23E8(v0[24], (uint64_t)static Log.suggestions);
            sub_3525C();
            sub_1C4AC();
            sub_35268();
            Logger.warning(output:test:file:function:line:)(v90, v91, v92, v93, 59);
            uint64_t v94 = 0;
            uint64_t v95 = 0;
            char v176 = 1;
LABEL_184:
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            swift_task_dealloc();
            Swift::String v162 = (uint64_t (*)(uint64_t, uint64_t, void))v0[1];
            return v162(v94, v95, v176 & 1);
          }
        }
      }
      int64_t v7 = v12;
    }
LABEL_18:
    unint64_t v6 = (v11 - 1) & v11;
    unint64_t v9 = __clz(__rbit64(v11)) + (v7 << 6);
LABEL_19:
    uint64_t v13 = *(void *)(*(void *)(v166 + 48) + 8 * v9);
    uint64_t v14 = sub_1698C(v13, v180[22]);
    unint64_t v15 = sub_37990();
    if (v15 >> 62) {
      uint64_t v1 = sub_352C0();
    }
    else {
      sub_353AC();
    }
    uint64_t v181 = v13;
    unint64_t v170 = v6;
    int64_t v171 = v7;
    uint64_t v172 = v14;
    if (v1)
    {
      if (v1 < 1) {
        goto LABEL_190;
      }
      for (uint64_t i = 0; i != v1; ++i)
      {
        if ((v15 & 0xC000000000000001) != 0) {
          sub_38040();
        }
        else {
          swift_retain();
        }
        if (sub_37D50())
        {
          sub_38070();
          sub_38090();
          sub_380A0();
          sub_38080();
        }
        else
        {
          swift_release();
        }
      }
    }
    swift_bridgeObjectRelease();
    uint64_t v17 = v180;
    if (qword_4CD38 != -1)
    {
      swift_once();
      uint64_t v17 = v180;
    }
    sub_23E8(v17[24], (uint64_t)static Log.suggestions);
    uint64_t v18 = *v174;
    sub_3534C();
    v18();
    sub_27D98(17);
    swift_bridgeObjectRelease();
    v191._uint64_t countAndFlagsBits = sub_379D0();
    sub_37E70(v191);
    swift_bridgeObjectRelease();
    sub_27D98(2);
    uint64_t v20 = *(void *)(v167 + 32);
    Swift::String v19 = *(void **)(v167 + 40);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v21._uint64_t countAndFlagsBits = 0x6574726F70707573;
    v21._object = (void *)0xEF203A6570795464;
    uint64_t v175 = v20;
    v22._uint64_t countAndFlagsBits = v20;
    v22._object = v19;
    Logger.debug(output:test:caller:)(v21, 1, v22);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_35290();
    v23();
    sub_3534C();
    v18();
    sub_27D98(38);
    swift_bridgeObjectRelease();
    sub_3525C();
    uint64_t v183 = v24;
    BOOL v25 = (uint64_t)_swiftEmptyArrayStorage < 0
       || ((unint64_t)_swiftEmptyArrayStorage & 0x4000000000000000) != 0;
    BOOL v169 = v25;
    if (v25)
    {
      swift_bridgeObjectRetain();
      uint64_t v26 = sub_380F0();
      swift_release();
      if (!v26) {
        goto LABEL_53;
      }
    }
    else
    {
      uint64_t v26 = _swiftEmptyArrayStorage[2];
      if (!v26) {
        goto LABEL_53;
      }
    }
    sub_1AE88(0, v26 & ~(v26 >> 63), 0);
    if (v26 < 0) {
      goto LABEL_191;
    }
    uint64_t v27 = 0;
    do
    {
      if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000001) != 0) {
        sub_38040();
      }
      else {
        swift_retain();
      }
      uint64_t v28 = sub_37CC0();
      uint64_t v30 = v29;
      swift_release();
      unint64_t v32 = _swiftEmptyArrayStorage[2];
      unint64_t v31 = _swiftEmptyArrayStorage[3];
      if (v32 >= v31 >> 1) {
        sub_35314(v31);
      }
      ++v27;
      _swiftEmptyArrayStorage[2] = v32 + 1;
      uint64_t v33 = &_swiftEmptyArrayStorage[2 * v32];
      v33[4] = v28;
      v33[5] = v30;
    }
    while (v26 != v27);
LABEL_53:
    v192._uint64_t countAndFlagsBits = sub_37EF0();
    sub_37E70(v192);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_27D98(2);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_35360(v183, 0x800000000003E990);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_3527C();
    v34();
    sub_1C09C();
    v35();
    sub_27D98(23);
    swift_bridgeObjectRelease();
    sub_3525C();
    uint64_t v184 = v36 - 15;
    if (v172)
    {
      if (*(void *)(v172 + 16))
      {
        sub_3E50(0, 1, v172);
        uint64_t v37 = sub_37A00();
      }
      else
      {
        uint64_t v37 = sub_353B8();
      }
    }
    else
    {
      uint64_t v37 = 0;
      uint64_t v38 = 1;
    }
    uint64_t v1 = v180[24];
    v180[12] = v37;
    v180[13] = v38;
    sub_2420(&qword_4DE20);
    v193._uint64_t countAndFlagsBits = sub_37E00();
    sub_37E70(v193);
    swift_bridgeObjectRelease();
    sub_27D98(2);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v39._uint64_t countAndFlagsBits = v184;
    v39._object = (void *)0x800000000003E9C0;
    v40._uint64_t countAndFlagsBits = v175;
    v40._object = v19;
    Logger.debug(output:test:caller:)(v39, 1, v40);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_3527C();
    v41();
    if (v169)
    {
      swift_retain();
      uint64_t v42 = sub_380F0();
      swift_release();
    }
    else
    {
      uint64_t v42 = _swiftEmptyArrayStorage[2];
    }
    uint64_t v3 = v168;
    if (v42)
    {
      uint64_t v1 = v180[24];
      if (v172)
      {
        swift_bridgeObjectRetain();
        sub_316E0((unint64_t)_swiftEmptyArrayStorage, v172);
        swift_bridgeObjectRelease();
        swift_release();
        sub_351A4();
        uint64_t v55 = sub_37F20();
        swift_bridgeObjectRelease();
        sub_1C09C();
        v56();
        sub_27D98(37);
        swift_bridgeObjectRelease();
        sub_3525C();
        uint64_t v186 = v57 - 1;
        int64_t v58 = *(void *)(v55 + 16);
        if (v58)
        {
          sub_1AE88(0, v58, 0);
          uint64_t v59 = v55 + 32;
          do
          {
            v59 += 8;
            uint64_t v60 = sub_37A00();
            uint64_t v62 = v61;
            unint64_t v64 = _swiftEmptyArrayStorage[2];
            unint64_t v63 = _swiftEmptyArrayStorage[3];
            if (v64 >= v63 >> 1) {
              sub_35314(v63);
            }
            _swiftEmptyArrayStorage[2] = v64 + 1;
            uint64_t v65 = &_swiftEmptyArrayStorage[2 * v64];
            v65[4] = v60;
            v65[5] = v62;
            --v58;
          }
          while (v58);
        }
        uint64_t v1 = v180[24];
        v194._uint64_t countAndFlagsBits = sub_37EF0();
        sub_37E70(v194);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_27D98(2);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        sub_35360(v186, 0x800000000003EA40);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_3527C();
        v66();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v185 = v168;
        uint64_t v53 = (void *)v55;
        uint64_t v54 = v181;
      }
      else
      {
        swift_release();
        sub_1C09C();
        v47();
        sub_27D98(2);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        sub_3525C();
        v49._uint64_t countAndFlagsBits = v48 + 44;
        v49._object = (void *)0x800000000003E9E0;
        v50._uint64_t countAndFlagsBits = v175;
        v50._object = v19;
        Logger.debug(output:test:caller:)(v49, 0, v50);
        swift_bridgeObjectRelease();
        sub_3527C();
        v51();
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v185 = v168;
        uint64_t v53 = _swiftEmptyArrayStorage;
        uint64_t v54 = v181;
      }
      sub_33D08((uint64_t)v53, v54, isUniquelyReferenced_nonNull_native);
      uint64_t v3 = v185;
      swift_bridgeObjectRelease();
      unint64_t v6 = v170;
      int64_t v7 = v171;
      goto LABEL_5;
    }
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1A9F0(v181);
    char v44 = v43;
    swift_bridgeObjectRelease();
    int64_t v7 = v171;
    if (v44)
    {
      char v45 = swift_isUniquelyReferenced_nonNull_native();
      Swift::Int v46 = *(void *)(v168 + 24);
      sub_2420(&qword_4DE30);
      sub_380C0(v45, v46);
      uint64_t v3 = v168;
      sub_2420(&qword_4D448);
      sub_1BD00();
      sub_380D0();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_5;
    }
  }
LABEL_73:
  swift_release();
  if (!*(void *)(v3 + 16))
  {
    if (qword_4CD38 != -1) {
      swift_once();
    }
    uint64_t v0 = v180;
    uint64_t v118 = v180[29];
    uint64_t v119 = v180[24];
    uint64_t v120 = sub_23E8(v119, (uint64_t)static Log.suggestions);
    ((void (*)(uint64_t, uint64_t, uint64_t))*v174)(v118, v120, v119);
    sub_27D98(2);
    uint64_t v122 = *(void *)(v167 + 32);
    char v121 = *(void **)(v167 + 40);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    sub_3525C();
    sub_1C4AC();
    char v176 = 1;
    v123._uint64_t countAndFlagsBits = v122;
    v123._object = v121;
    Logger.debug(output:test:caller:)(v124, 1, v123);
    swift_release();
    swift_bridgeObjectRelease();
    (*v179)(v118, v119);
    swift_bridgeObjectRelease();
    uint64_t v94 = 0;
    uint64_t v95 = 0;
    goto LABEL_184;
  }
  sub_1B434(v3);
  uint64_t v67 = v180[7];
  uint64_t v68 = v180[8];
  int64_t v69 = v180[10];
  unint64_t v70 = v180[11];
  int64_t v71 = (unint64_t)(v180[9] + 64) >> 6;
  swift_bridgeObjectRetain_n();
  Swift::Bool v72 = (char *)_swiftEmptyArrayStorage;
  if (!v70) {
    goto LABEL_76;
  }
  while (2)
  {
    unint64_t v73 = __clz(__rbit64(v70));
    v70 &= v70 - 1;
    unint64_t v74 = v73 | (v69 << 6);
LABEL_89:
    uint64_t v78 = *(void *)(*(void *)(v67 + 56) + 8 * v74);
    uint64_t v79 = *(void *)(v78 + 16);
    int64_t v80 = *((void *)v72 + 2);
    int64_t v81 = v80 + v79;
    if (__OFADD__(v80, v79)) {
      goto LABEL_188;
    }
    swift_bridgeObjectRetain();
    uint64_t v82 = (char *)swift_isUniquelyReferenced_nonNull_native();
    if (!v82 || v81 > *((void *)v72 + 3) >> 1)
    {
      if (v80 <= v81) {
        int64_t v83 = v80 + v79;
      }
      else {
        int64_t v83 = v80;
      }
      Swift::Bool v72 = sub_33228(v82, v83, 1, (uint64_t)v72, &qword_4D408, (void (*)(uint64_t, uint64_t, char *))sub_1A334);
    }
    if (*(void *)(v78 + 16))
    {
      uint64_t v84 = *((void *)v72 + 2);
      if ((*((void *)v72 + 3) >> 1) - v84 < v79) {
        goto LABEL_192;
      }
      uint64_t v85 = &v72[8 * v84 + 32];
      if (v78 + 32 < (unint64_t)&v85[8 * v79] && (unint64_t)v85 < v78 + 32 + 8 * v79) {
        goto LABEL_196;
      }
      memcpy(v85, (const void *)(v78 + 32), 8 * v79);
      if (v79)
      {
        uint64_t v87 = *((void *)v72 + 2);
        BOOL v10 = __OFADD__(v87, v79);
        uint64_t v88 = v87 + v79;
        if (v10) {
          goto LABEL_194;
        }
        *((void *)v72 + 2) = v88;
      }
    }
    else if (v79)
    {
      goto LABEL_189;
    }
    swift_bridgeObjectRelease();
    if (v70) {
      continue;
    }
    break;
  }
LABEL_76:
  int64_t v75 = v69 + 1;
  if (__OFADD__(v69, 1)) {
    goto LABEL_195;
  }
  if (v75 >= v71) {
    goto LABEL_117;
  }
  unint64_t v76 = *(void *)(v68 + 8 * v75);
  if (v76)
  {
LABEL_88:
    unint64_t v70 = (v76 - 1) & v76;
    unint64_t v74 = __clz(__rbit64(v76)) + (v75 << 6);
    int64_t v69 = v75;
    goto LABEL_89;
  }
  int64_t v77 = v69 + 2;
  if (v69 + 2 >= v71) {
    goto LABEL_117;
  }
  unint64_t v76 = *(void *)(v68 + 8 * v77);
  if (v76) {
    goto LABEL_87;
  }
  int64_t v77 = v69 + 3;
  if (v69 + 3 >= v71) {
    goto LABEL_117;
  }
  unint64_t v76 = *(void *)(v68 + 8 * v77);
  if (v76) {
    goto LABEL_87;
  }
  int64_t v77 = v69 + 4;
  if (v69 + 4 >= v71) {
    goto LABEL_117;
  }
  unint64_t v76 = *(void *)(v68 + 8 * v77);
  if (v76) {
    goto LABEL_87;
  }
  int64_t v77 = v69 + 5;
  if (v69 + 5 >= v71) {
    goto LABEL_117;
  }
  unint64_t v76 = *(void *)(v68 + 8 * v77);
  if (v76)
  {
LABEL_87:
    int64_t v75 = v77;
    goto LABEL_88;
  }
  int64_t v75 = v69 + 6;
  if (v69 + 6 >= v71) {
    goto LABEL_117;
  }
  unint64_t v76 = *(void *)(v68 + 8 * v75);
  if (v76) {
    goto LABEL_88;
  }
  int64_t v89 = v69 + 7;
  while (v89 < v71)
  {
    unint64_t v76 = *(void *)(v68 + 8 * v89++);
    if (v76)
    {
      int64_t v75 = v89 - 1;
      goto LABEL_88;
    }
  }
LABEL_117:
  swift_release();
  swift_bridgeObjectRelease();
  if (qword_4CD38 != -1) {
    swift_once();
  }
  sub_23E8(v180[24], (uint64_t)static Log.suggestions);
  sub_1C09C();
  v96();
  sub_27D98(32);
  swift_bridgeObjectRelease();
  sub_3525C();
  uint64_t v187 = v97 - 6;
  int64_t v98 = *((void *)v72 + 2);
  if (v98)
  {
    sub_1AE88(0, v98, 0);
    uint64_t v99 = v72 + 32;
    do
    {
      v99 += 8;
      uint64_t v100 = sub_37A00();
      uint64_t v102 = v101;
      unint64_t v104 = _swiftEmptyArrayStorage[2];
      unint64_t v103 = _swiftEmptyArrayStorage[3];
      if (v104 >= v103 >> 1) {
        sub_1AE88((char *)(v103 > 1), v104 + 1, 1);
      }
      _swiftEmptyArrayStorage[2] = v104 + 1;
      uint64_t v105 = &_swiftEmptyArrayStorage[2 * v104];
      v105[4] = v100;
      v105[5] = v102;
      --v98;
    }
    while (v98);
  }
  v195._uint64_t countAndFlagsBits = sub_37EF0();
  sub_37E70(v195);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_27D98(2);
  uint64_t v107 = *(void *)(v167 + 32);
  uint64_t v106 = *(void **)(v167 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v108._uint64_t countAndFlagsBits = v187;
  v108._object = (void *)0x800000000003EA70;
  v173._uint64_t countAndFlagsBits = v107;
  v109._uint64_t countAndFlagsBits = v107;
  v109._object = v106;
  Logger.debug(output:test:caller:)(v108, 1, v109);
  v173._object = v106;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_35290();
  v110();
  uint64_t v95 = sub_32D78((uint64_t)v72);
  char v112 = v111;
  swift_bridgeObjectRelease();
  sub_1C09C();
  v113();
  v188._uint64_t countAndFlagsBits = sub_27D98(58);
  v188._object = v114;
  sub_3525C();
  v196._uint64_t countAndFlagsBits = v115 - 12;
  v196._object = (void *)0x800000000003EA90;
  sub_37E70(v196);
  if (v112) {
    uint64_t v116 = sub_353B8();
  }
  else {
    uint64_t v116 = sub_37A00();
  }
  v180[14] = v116;
  v180[15] = v117;
  sub_2420(&qword_4CFE0);
  v197._uint64_t countAndFlagsBits = sub_37E00();
  sub_37E70(v197);
  swift_bridgeObjectRelease();
  sub_3525C();
  v198._uint64_t countAndFlagsBits = v125 - 4;
  v198._object = (void *)0x800000000003EAB0;
  sub_37E70(v198);
  sub_27D98(2);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v126._uint64_t countAndFlagsBits = v107;
  v126._object = v173._object;
  Logger.debug(output:test:caller:)(v188, 1, v126);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_35290();
  v127();
  char v176 = v112;
  if (v112)
  {
    uint64_t v128 = 0;
LABEL_174:
    sub_1C09C();
    v150();
    v189._uint64_t countAndFlagsBits = sub_27D98(90);
    v189._object = v151;
    v199._object = (void *)0x800000000003EAE0;
    v199._uint64_t countAndFlagsBits = 0xD000000000000024;
    sub_37E70(v199);
    if (v112) {
      uint64_t v152 = sub_353B8();
    }
    else {
      uint64_t v152 = sub_37A00();
    }
    v180[16] = v152;
    v180[17] = v153;
    v200._uint64_t countAndFlagsBits = sub_37E00();
    sub_37E70(v200);
    swift_bridgeObjectRelease();
    sub_3525C();
    v201._uint64_t countAndFlagsBits = v154 + 3;
    v201._object = (void *)0x800000000003EB10;
    sub_37E70(v201);
    if (v128)
    {
      swift_retain();
      uint64_t v155 = sub_37CC0();
      uint64_t v157 = v156;
      swift_release();
    }
    else
    {
      uint64_t v155 = 0;
      uint64_t v157 = 0;
    }
    v180[18] = v155;
    v180[19] = v157;
    v202._uint64_t countAndFlagsBits = sub_37E00();
    sub_37E70(v202);
    swift_bridgeObjectRelease();
    v203._uint64_t countAndFlagsBits = 0x3A65707974202D20;
    v203._object = (void *)0xE900000000000020;
    sub_37E70(v203);
    if (v128)
    {
      swift_retain();
      sub_37D60();
      uint64_t v158 = v128;
      swift_release();
      uint64_t v159 = sub_379D0();
    }
    else
    {
      uint64_t v158 = 0;
      uint64_t v159 = sub_353B8();
    }
    uint64_t v0 = v180;
    v180[20] = v159;
    v180[21] = v160;
    v204._uint64_t countAndFlagsBits = sub_37E00();
    sub_37E70(v204);
    swift_bridgeObjectRelease();
    sub_27D98(2);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    Logger.debug(output:test:caller:)(v189, 1, v173);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();
    sub_35290();
    v161();
    swift_bridgeObjectRelease();
    uint64_t v94 = v158;
    goto LABEL_184;
  }
  sub_1B434(v180[22]);
  uint64_t v129 = v180[2];
  uint64_t v178 = v180[3];
  int64_t v130 = v180[5];
  unint64_t v131 = v180[6];
  int64_t v182 = (unint64_t)(v180[4] + 64) >> 6;
  swift_bridgeObjectRetain();
  for (j = (char *)_swiftEmptyArrayStorage; ; *(void *)&j[8 * v147 + 32] = v140)
  {
    do
    {
LABEL_133:
      if (v131)
      {
        unint64_t v132 = __clz(__rbit64(v131));
        v131 &= v131 - 1;
        unint64_t v133 = v132 | (v130 << 6);
      }
      else
      {
        int64_t v134 = v130 + 1;
        if (__OFADD__(v130, 1))
        {
          __break(1u);
          goto LABEL_198;
        }
        if (v134 >= v182) {
          goto LABEL_173;
        }
        unint64_t v135 = *(void *)(v178 + 8 * v134);
        if (!v135)
        {
          sub_353A0();
          if (v136 == v10) {
            goto LABEL_173;
          }
          sub_35394();
          if (v135) {
            goto LABEL_150;
          }
          sub_353A0();
          if (v136 == v10) {
            goto LABEL_173;
          }
          sub_35394();
          if (v135) {
            goto LABEL_150;
          }
          sub_353A0();
          if (v136 == v10) {
            goto LABEL_173;
          }
          sub_35394();
          if (v135) {
            goto LABEL_150;
          }
          sub_353A0();
          if (v136 == v10) {
            goto LABEL_173;
          }
          sub_35394();
          if (v135)
          {
LABEL_150:
            int64_t v134 = v137;
          }
          else
          {
            int64_t v134 = v138 + 5;
            if (v134 >= v182) {
              goto LABEL_173;
            }
            unint64_t v135 = *(void *)(v178 + 8 * v134);
            if (!v135)
            {
              int64_t v148 = v130 + 7;
              while (v148 < v182)
              {
                unint64_t v135 = *(void *)(v178 + 8 * v148++);
                if (v135)
                {
                  int64_t v134 = v148 - 1;
                  goto LABEL_151;
                }
              }
LABEL_173:
              swift_release();
              int64_t v149 = sub_37990();
              uint64_t v128 = sub_32758(j, v149, v95, 0);
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              char v112 = v176;
              goto LABEL_174;
            }
          }
        }
LABEL_151:
        unint64_t v131 = (v135 - 1) & v135;
        unint64_t v133 = __clz(__rbit64(v135)) + (v134 << 6);
        int64_t v130 = v134;
      }
      uint64_t v139 = *(void *)(*(void *)(*(void *)(v129 + 56) + 8 * v133) + 16);
    }
    while (!v139);
    uint64_t v140 = *(void *)(*(void *)(v129 + 48) + 8 * v133);
    swift_bridgeObjectRetain();
    uint64_t v141 = sub_37A20();
    if (v141 != sub_37A20())
    {
      if (v139 == 1) {
        goto LABEL_161;
      }
      uint64_t v142 = sub_37A20();
      if (v142 != sub_37A20()) {
        break;
      }
    }
LABEL_162:
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      j = sub_33228(0, *((void *)j + 2) + 1, 1, (uint64_t)j, &qword_4D3C8, (void (*)(uint64_t, uint64_t, char *))sub_1A334);
    }
    unint64_t v147 = *((void *)j + 2);
    unint64_t v146 = *((void *)j + 3);
    if (v147 >= v146 >> 1) {
      j = sub_33228((char *)(v146 > 1), v147 + 1, 1, (uint64_t)j, &qword_4D3C8, (void (*)(uint64_t, uint64_t, char *))sub_1A334);
    }
    *((void *)j + 2) = v147 + 1;
  }
  if (v139 == 2)
  {
LABEL_161:
    swift_bridgeObjectRelease();
    goto LABEL_133;
  }
  uint64_t v143 = 6;
  while (1)
  {
    uint64_t v144 = v143 - 3;
    if (__OFADD__(v143 - 4, 1)) {
      break;
    }
    uint64_t v145 = sub_37A20();
    if (v145 == sub_37A20()) {
      goto LABEL_162;
    }
    ++v143;
    if (v144 == v139) {
      goto LABEL_161;
    }
  }
  __break(1u);
LABEL_188:
  __break(1u);
LABEL_189:
  __break(1u);
LABEL_190:
  __break(1u);
LABEL_191:
  __break(1u);
LABEL_192:
  __break(1u);
LABEL_193:
  __break(1u);
LABEL_194:
  __break(1u);
LABEL_195:
  __break(1u);
LABEL_196:
  sub_1BDB4();
  return sub_38110();
}

void *sub_316E0(unint64_t a1, uint64_t a2)
{
  unint64_t v3 = a1;
  uint64_t v26 = _swiftEmptyArrayStorage;
  if (a1 >> 62) {
    goto LABEL_21;
  }
  uint64_t v4 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  swift_bridgeObjectRetain();
  for (; v4; uint64_t v4 = sub_380F0())
  {
    uint64_t v5 = 0;
    unint64_t v23 = v3 & 0xC000000000000001;
    unint64_t v6 = &type metadata for HomeAttributeType;
    uint64_t v22 = v4;
    while (1)
    {
      if (v23) {
        sub_38040();
      }
      else {
        swift_retain();
      }
      if (__OFADD__(v5++, 1)) {
        break;
      }
      uint64_t v8 = sub_37D40();
      sub_351F0();
      unint64_t v9 = v6;
      uint64_t v10 = sub_37F60();
      uint64_t v25 = v10;
      uint64_t v11 = *(void *)(v8 + 16);
      if (v11)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          Swift::Int v13 = *(void *)(v8 + 8 * i + 32);
          sub_33E78(&v24, v13);
        }
        swift_bridgeObjectRelease();
        uint64_t v14 = v25;
      }
      else
      {
        uint64_t v14 = v10;
        swift_bridgeObjectRelease();
      }
      swift_bridgeObjectRetain();
      unint64_t v6 = v9;
      uint64_t v15 = sub_37F60();
      uint64_t v25 = v15;
      uint64_t v16 = *(void *)(a2 + 16);
      if (v16)
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          Swift::Int v18 = *(void *)(a2 + 8 * j + 32);
          sub_33E78(&v24, v18);
        }
        swift_bridgeObjectRelease();
        uint64_t v19 = v25;
      }
      else
      {
        uint64_t v19 = v15;
        swift_bridgeObjectRelease();
      }
      Swift::Int v20 = sub_3429C(v19, v14);
      swift_release();
      swift_bridgeObjectRelease();
      unint64_t v3 = (unint64_t)&v26;
      sub_32E6C(v20);
      if (v5 == v22)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return v26;
      }
    }
    __break(1u);
LABEL_21:
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return _swiftEmptyArrayStorage;
}

uint64_t sub_3192C()
{
  sub_11914();
  uint64_t v1 = sub_37D90();
  v0[3] = v1;
  sub_1BD50(v1);
  v0[4] = v2;
  v0[5] = swift_task_alloc();
  unint64_t v3 = (void *)swift_task_alloc();
  v0[6] = v3;
  *unint64_t v3 = v0;
  v3[1] = sub_319EC;
  return sub_2F75C();
}

uint64_t sub_319EC()
{
  sub_11914();
  sub_11820();
  sub_1C39C();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 56) = v3;
  swift_task_dealloc();
  sub_11920();
  return _swift_task_switch(v4, v5, v6);
}

uint64_t sub_31AB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unint64_t a9, unint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20)
{
  sub_352F8();
  a19 = v22;
  a20 = v23;
  a18 = v20;
  uint64_t v24 = v20[7];
  if (v24)
  {
    uint64_t v25 = v20[7];
    unint64_t v26 = sub_379B0();
    a9 = (unint64_t)_swiftEmptyArrayStorage;
    if (v26 >> 62)
    {
      uint64_t v21 = sub_352C0();
      if (v21)
      {
LABEL_4:
        if (v21 < 1)
        {
          __break(1u);
          goto LABEL_42;
        }
        for (uint64_t i = 0; i != v21; ++i)
        {
          if ((v26 & 0xC000000000000001) != 0) {
            sub_38040();
          }
          else {
            sub_352DC();
          }
          unint64_t v28 = sub_37CB0();
          uint64_t v25 = v28;
          if (v28 >> 62) {
            uint64_t v29 = sub_380F0();
          }
          else {
            uint64_t v29 = *(void *)((char *)&dword_10 + (v28 & 0xFFFFFFFFFFFFFF8));
          }
          swift_bridgeObjectRelease();
          if (v29)
          {
            sub_38070();
            sub_38090();
            sub_380A0();
            uint64_t v25 = (uint64_t)&a9;
            sub_38080();
          }
          else
          {
            swift_release();
          }
        }
        swift_bridgeObjectRelease();
        unint64_t v30 = a9;
        if ((a9 & 0x8000000000000000) != 0) {
          goto LABEL_33;
        }
        goto LABEL_24;
      }
    }
    else
    {
      sub_353AC();
      if (v21) {
        goto LABEL_4;
      }
    }
    swift_bridgeObjectRelease();
    unint64_t v30 = (unint64_t)_swiftEmptyArrayStorage;
    if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0) {
      goto LABEL_33;
    }
LABEL_24:
    if ((v30 & 0x4000000000000000) == 0)
    {
      if (*(void *)(v30 + 16))
      {
        uint64_t v35 = swift_bridgeObjectRetain();
        uint64_t v25 = v30;
LABEL_27:
        a9 = v25;
        sub_33B70(v35, sub_35190, v36, v37, v38, v39, v40, v41);
        swift_release();
        uint64_t v25 = a9;
        if ((a9 & 0x8000000000000000) == 0 && (a9 & 0x4000000000000000) == 0)
        {
          if (*(void *)(a9 + 16)) {
            goto LABEL_30;
          }
          goto LABEL_32;
        }
LABEL_42:
        swift_bridgeObjectRetain();
        uint64_t v60 = sub_380F0();
        swift_release();
        if (v60)
        {
LABEL_30:
          sub_3E4C(0, (v25 & 0xC000000000000001) == 0, v25);
          if ((v25 & 0xC000000000000001) != 0) {
            sub_38040();
          }
          else {
            swift_retain();
          }
        }
LABEL_32:
        swift_release();
        swift_release();
        goto LABEL_38;
      }
      goto LABEL_35;
    }
LABEL_33:
    swift_retain();
    sub_380F0();
    sub_353C4();
    if (v25)
    {
      unint64_t v42 = swift_bridgeObjectRetain();
      sub_1B2DC(v42);
      uint64_t v35 = sub_353C4();
      goto LABEL_27;
    }
LABEL_35:
    swift_release();
    if (qword_4CD38 != -1) {
      swift_once();
    }
    uint64_t v44 = v20[4];
    uint64_t v43 = v20[5];
    uint64_t v45 = v20[3];
    sub_23E8(v45, (uint64_t)static Log.suggestions);
    sub_1C09C();
    v46();
    a9 = 0;
    a10 = 0xE000000000000000;
    sub_38020(34);
    swift_bridgeObjectRelease();
    a9 = 0xD000000000000020;
    a10 = 0x800000000003E8D0;
    v20[2] = v24;
    sub_379C0();
    sub_35140();
    v61._uint64_t countAndFlagsBits = sub_38140();
    sub_37E70(v61);
    swift_bridgeObjectRelease();
    sub_3529C();
    Logger.warning(output:test:file:function:line:)(v47, v48, v49, v50, 135);
    swift_bridgeObjectRelease();
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v43, v45);
    goto LABEL_38;
  }
  if (qword_4CD38 != -1) {
    swift_once();
  }
  sub_23E8(v20[3], (uint64_t)static Log.suggestions);
  sub_3529C();
  Logger.warning(output:test:file:function:line:)(v31, v32, v33, v34, 129);
LABEL_38:
  swift_task_dealloc();
  sub_1E414();
  return v53(v51, v52, v53, v54, v55, v56, v57, v58, a9, a10, a11, a12);
}

uint64_t sub_31EE8()
{
  sub_11914();
  *(void *)(v0 + 16) = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_31F74;
  return sub_2F75C();
}

uint64_t sub_31F74()
{
  sub_11914();
  sub_11820();
  sub_1C39C();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 32) = v3;
  swift_task_dealloc();
  sub_11920();
  return _swift_task_switch(v4, v5, v6);
}

uint64_t sub_32040(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12)
{
  sub_352F8();
  if (!*(void *)(v12 + 32))
  {
    if (qword_4CD38 == -1)
    {
LABEL_16:
      uint64_t v16 = sub_37D90();
      sub_23E8(v16, (uint64_t)static Log.suggestions);
      sub_1C4AC();
      sub_35268();
      v17._uint64_t countAndFlagsBits = 0xD00000000000001FLL;
      Logger.warning(output:test:file:function:line:)(v18, v19, v20, v17, 144);
      goto LABEL_22;
    }
LABEL_27:
    swift_once();
    goto LABEL_16;
  }
  unint64_t v14 = sub_37990();
  a10 = _swiftEmptyArrayStorage;
  if (v14 >> 62)
  {
    uint64_t v13 = sub_352C0();
    if (v13) {
      goto LABEL_4;
    }
  }
  else
  {
    sub_353AC();
    if (v13)
    {
LABEL_4:
      if (v13 >= 1)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if ((v14 & 0xC000000000000001) != 0) {
            sub_38040();
          }
          else {
            sub_352DC();
          }
          if (sub_37D50())
          {
            sub_38070();
            sub_38090();
            sub_380A0();
            sub_38080();
          }
          else
          {
            swift_release();
          }
        }
        swift_bridgeObjectRelease();
        if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0) {
          goto LABEL_25;
        }
        goto LABEL_19;
      }
      __break(1u);
      goto LABEL_27;
    }
  }
  swift_bridgeObjectRelease();
  if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0)
  {
LABEL_25:
    swift_bridgeObjectRetain();
    sub_380F0();
    swift_release_n();
    goto LABEL_21;
  }
LABEL_19:
  if (((unint64_t)_swiftEmptyArrayStorage & 0x4000000000000000) != 0) {
    goto LABEL_25;
  }
  swift_release();
LABEL_21:
  swift_release();
LABEL_22:
  sub_1E414();
  return v23(v21, v22, v23, v24, v25, v26, v27, v28, a9, a10, a11, a12);
}

uint64_t sub_32268()
{
  sub_11914();
  *(void *)(v0 + 16) = v1;
  uint64_t v2 = (void *)swift_task_alloc();
  *(void *)(v0 + 24) = v2;
  *uint64_t v2 = v0;
  v2[1] = sub_322F4;
  return sub_2F75C();
}

uint64_t sub_322F4()
{
  sub_11914();
  sub_11820();
  sub_1C39C();
  *uint64_t v2 = v1;
  *uint64_t v2 = *v0;
  *(void *)(v1 + 32) = v3;
  swift_task_dealloc();
  sub_11920();
  return _swift_task_switch(v4, v5, v6);
}

uint64_t sub_323C0()
{
  uint64_t v26 = v0;
  uint64_t v3 = *(void ***)(v0 + 32);
  if (!v3)
  {
    if (qword_4CD38 == -1)
    {
LABEL_16:
      uint64_t v7 = sub_37D90();
      sub_23E8(v7, (uint64_t)static Log.suggestions);
      sub_1C4AC();
      sub_35268();
      v8._uint64_t countAndFlagsBits = 0xD00000000000001CLL;
      Logger.warning(output:test:file:function:line:)(v9, v10, v11, v8, 154);
LABEL_40:
      uint64_t v22 = _swiftEmptyArrayStorage;
      goto LABEL_44;
    }
LABEL_42:
    swift_once();
    goto LABEL_16;
  }
  unint64_t v4 = sub_37990();
  unint64_t v25 = (unint64_t)_swiftEmptyArrayStorage;
  if (v4 >> 62)
  {
    uint64_t v1 = sub_352C0();
    if (v1) {
      goto LABEL_4;
    }
  }
  else
  {
    sub_353AC();
    if (v1)
    {
LABEL_4:
      if (v1 >= 1)
      {
        for (uint64_t i = 0; i != v1; ++i)
        {
          if ((v4 & 0xC000000000000001) != 0) {
            uint64_t v2 = sub_38040();
          }
          else {
            sub_352DC();
          }
          uint64_t v3 = (void **)v2;
          if (sub_37D50())
          {
            sub_38070();
            sub_38090();
            sub_380A0();
            uint64_t v3 = (void **)&v25;
            sub_38080();
          }
          else
          {
            swift_release();
          }
        }
        swift_bridgeObjectRelease();
        unint64_t v6 = v25;
        if ((v25 & 0x8000000000000000) != 0) {
          goto LABEL_35;
        }
        goto LABEL_19;
      }
      __break(1u);
      goto LABEL_42;
    }
  }
  swift_bridgeObjectRelease();
  unint64_t v6 = (unint64_t)_swiftEmptyArrayStorage;
  if (((unint64_t)_swiftEmptyArrayStorage & 0x8000000000000000) != 0) {
    goto LABEL_35;
  }
LABEL_19:
  if ((v6 & 0x4000000000000000) == 0)
  {
    unint64_t v12 = *(void *)(v6 + 16);
    if (v12 > 1)
    {
      swift_retain();
LABEL_22:
      uint64_t v13 = 0;
      unint64_t v14 = (char *)_swiftEmptyArrayStorage;
      do
      {
        if ((v6 & 0xC000000000000001) != 0) {
          sub_38040();
        }
        else {
          swift_retain();
        }
        if (sub_37CE0())
        {
          uint64_t v15 = sub_37CD0();
          uint64_t v17 = v16;
          swift_release();
          swift_release();
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            unint64_t v14 = sub_3341C(0, *((void *)v14 + 2) + 1, 1, (uint64_t)v14);
          }
          unint64_t v19 = *((void *)v14 + 2);
          unint64_t v18 = *((void *)v14 + 3);
          if (v19 >= v18 >> 1) {
            unint64_t v14 = sub_3341C((char *)(v18 > 1), v19 + 1, 1, (uint64_t)v14);
          }
          *((void *)v14 + 2) = v19 + 1;
          Swift::String v20 = &v14[16 * v19];
          *((void *)v20 + 4) = v15;
          *((void *)v20 + 5) = v17;
        }
        else
        {
          swift_release();
        }
        ++v13;
      }
      while (v12 != v13);
      goto LABEL_43;
    }
LABEL_39:
    swift_release();
    swift_release();
    goto LABEL_40;
  }
LABEL_35:
  swift_bridgeObjectRetain();
  sub_380F0();
  sub_353C4();
  if ((uint64_t)v3 <= 1) {
    goto LABEL_39;
  }
  swift_retain();
  uint64_t v21 = sub_380F0();
  if (v21)
  {
    unint64_t v12 = v21;
    if (v21 < 1)
    {
      __break(1u);
      goto LABEL_39;
    }
    goto LABEL_22;
  }
LABEL_43:
  swift_release_n();
  uint64_t v22 = (void *)sub_37F20();
  swift_bridgeObjectRelease();
  swift_release();
LABEL_44:
  uint64_t v23 = *(uint64_t (**)(void *))(v0 + 8);
  return v23(v22);
}

uint64_t sub_32758(void *a1, int64_t a2, uint64_t a3, int a4)
{
  uint64_t v5 = v4;
  uint64_t v65 = a3;
  uint64_t v9 = sub_37D90();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  unint64_t v12 = (char *)&v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v66 = (unint64_t)a1;
  uint64_t v13 = swift_bridgeObjectRetain();
  unint64_t v14 = &v66;
  sub_33A38(v13, (uint64_t (*)(uint64_t))sub_3512C, v15, v16, v17, v18, v19, v20);
  uint64_t v21 = v66;
  uint64_t v64 = *(void *)(v66 + 16);
  if (!v64)
  {
    swift_release();
    unint64_t v24 = (unint64_t)_swiftEmptyArrayStorage;
    if (a4) {
      goto LABEL_63;
    }
    goto LABEL_30;
  }
  int v62 = a4;
  uint64_t v60 = v10;
  uint64_t v61 = v9;
  uint64_t v58 = v5;
  uint64_t v59 = v12;
  if ((unint64_t)a2 >> 62) {
    goto LABEL_57;
  }
  uint64_t v22 = *(void *)((char *)&dword_10 + (a2 & 0xFFFFFFFFFFFFFF8));
LABEL_4:
  unint64_t v23 = 0;
  unint64_t v63 = (void *)(v21 + 32);
  unint64_t v24 = (unint64_t)_swiftEmptyArrayStorage;
  while (1)
  {
    if (v23 >= *(void *)(v21 + 16))
    {
      __break(1u);
LABEL_53:
      __break(1u);
LABEL_54:
      __break(1u);
LABEL_55:
      __break(1u);
LABEL_56:
      __break(1u);
LABEL_57:
      if (a2 < 0) {
        unint64_t v14 = (unint64_t *)a2;
      }
      else {
        unint64_t v14 = (unint64_t *)(a2 & 0xFFFFFFFFFFFFFF8);
      }
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_380F0();
      swift_bridgeObjectRelease();
      goto LABEL_4;
    }
    unint64_t v66 = (unint64_t)_swiftEmptyArrayStorage;
    if (v22)
    {
      if (v22 < 1) {
        goto LABEL_54;
      }
      swift_bridgeObjectRetain();
      for (uint64_t i = 0; i != v22; ++i)
      {
        if ((a2 & 0xC000000000000001) != 0)
        {
          uint64_t v26 = sub_38040();
        }
        else
        {
          uint64_t v26 = *(void *)(a2 + 8 * i + 32);
          swift_retain();
        }
        unint64_t v14 = (unint64_t *)v26;
        if (sub_37D50())
        {
          unint64_t v14 = &v66;
          sub_38070();
          sub_38090();
          sub_380A0();
          sub_38080();
        }
        else
        {
          swift_release();
        }
      }
      swift_bridgeObjectRelease();
      unint64_t v24 = v66;
    }
    if ((v24 & 0x8000000000000000) == 0 && (v24 & 0x4000000000000000) == 0)
    {
      unint64_t v14 = *(unint64_t **)(v24 + 16);
      if (v14) {
        break;
      }
      goto LABEL_20;
    }
    swift_retain();
    sub_380F0();
    sub_353C4();
    if (v14) {
      break;
    }
LABEL_20:
    ++v23;
    swift_release();
    unint64_t v24 = (unint64_t)_swiftEmptyArrayStorage;
    if (v23 == v64)
    {
      swift_release();
      if (v62) {
        goto LABEL_63;
      }
LABEL_30:
      unint64_t v66 = (unint64_t)_swiftEmptyArrayStorage;
      if (v24 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v38 = sub_380F0();
        swift_bridgeObjectRelease();
        if (v38) {
          goto LABEL_32;
        }
      }
      else
      {
        uint64_t v38 = *(void *)((char *)&dword_10 + (v24 & 0xFFFFFFFFFFFFFF8));
        if (v38)
        {
LABEL_32:
          unint64_t v39 = 0;
          a2 = v24 & 0xC000000000000001;
          unint64_t v63 = (void *)(v24 + 32);
          uint64_t v64 = v24 & 0xFFFFFFFFFFFFFF8;
          do
          {
            if (a2)
            {
              sub_38040();
            }
            else
            {
              if (v39 >= *(void *)(v64 + 16)) {
                goto LABEL_56;
              }
              swift_retain();
            }
            if (__OFADD__(v39++, 1)) {
              goto LABEL_53;
            }
            uint64_t v41 = *(void *)(sub_37D40() + 16);
            if (v41)
            {
              uint64_t v42 = sub_37A20();
              if (v42 == sub_37A20()) {
                goto LABEL_43;
              }
              if (v41 != 1)
              {
                uint64_t v43 = sub_37A20();
                if (v43 == sub_37A20())
                {
LABEL_43:
                  swift_bridgeObjectRelease();
                  sub_38070();
                  sub_38090();
                  sub_380A0();
                  sub_38080();
                  continue;
                }
                if (v41 != 2)
                {
                  uint64_t v21 = 6;
                  do
                  {
                    uint64_t v44 = v21 - 3;
                    if (__OFADD__(v21 - 4, 1)) {
                      goto LABEL_55;
                    }
                    uint64_t v45 = sub_37A20();
                    if (v45 == sub_37A20()) {
                      goto LABEL_43;
                    }
                    ++v21;
                  }
                  while (v44 != v41);
                }
              }
            }
            swift_release();
            swift_bridgeObjectRelease();
          }
          while (v39 != v38);
        }
      }
      swift_bridgeObjectRelease();
      unint64_t v24 = v66;
      goto LABEL_63;
    }
  }
  swift_release();
  char v27 = v62;
  if (qword_4CD38 != -1) {
    swift_once();
  }
  uint64_t v28 = v61;
  sub_23E8(v61, (uint64_t)static Log.suggestions);
  uint64_t v21 = (uint64_t)v59;
  uint64_t v29 = v60;
  sub_1C09C();
  v30();
  unint64_t v66 = 0;
  unint64_t v67 = 0xE000000000000000;
  sub_38020(38);
  swift_bridgeObjectRelease();
  sub_3525C();
  unint64_t v66 = (unint64_t)v31;
  unint64_t v67 = 0x800000000003E720;
  v68._uint64_t countAndFlagsBits = sub_379D0();
  sub_37E70(v68);
  swift_bridgeObjectRelease();
  uint64_t v32 = v66;
  Swift::String v33 = (void *)v67;
  uint64_t v34 = *(void *)(v58 + 32);
  uint64_t v35 = *(void **)(v58 + 40);
  swift_bridgeObjectRetain();
  v36._uint64_t countAndFlagsBits = v32;
  v36._object = v33;
  v37._uint64_t countAndFlagsBits = v34;
  v37._object = v35;
  Logger.debug(output:test:caller:)(v36, 0, v37);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v21, v28);
  if ((v27 & 1) == 0) {
    goto LABEL_30;
  }
LABEL_63:
  if ((v24 & 0x8000000000000000) != 0 || (v24 & 0x4000000000000000) != 0)
  {
    unint64_t v57 = swift_bridgeObjectRetain();
    uint64_t v46 = (uint64_t)sub_1B1BC(v57);
    uint64_t v47 = swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v46 = v24 & 0xFFFFFFFFFFFFFF8;
    uint64_t v47 = swift_bridgeObjectRetain();
  }
  unint64_t v66 = v46;
  sub_33B70(v47, sub_3523C, v48, v49, v50, v51, v52, v53);
  swift_bridgeObjectRelease();
  uint64_t v54 = v66;
  if ((v66 & 0x8000000000000000) != 0 || (v66 & 0x4000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v55 = sub_380F0();
    swift_release();
    if (v55) {
      goto LABEL_69;
    }
  }
  else
  {
    uint64_t v55 = *(void *)(v66 + 16);
    if (v55)
    {
LABEL_69:
      sub_3E4C(0, (v54 & 0xC000000000000001) == 0, v54);
      if ((v54 & 0xC000000000000001) != 0)
      {
        uint64_t v55 = sub_38040();
      }
      else
      {
        uint64_t v55 = *(void *)(v54 + 32);
        swift_retain();
      }
    }
  }
  swift_release();
  return v55;
}

uint64_t sub_32D78(uint64_t a1)
{
  uint64_t v1 = swift_bridgeObjectRetain();
  sub_33A38(v1, (uint64_t (*)(uint64_t))sub_350F0, v2, v3, v4, v5, v6, v7);
  if (*(void *)(a1 + 16)) {
    uint64_t v8 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v8 = 0;
  }
  swift_release();
  return v8;
}

uint64_t sub_32DEC()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_32E14()
{
  sub_32DEC();
  return _swift_deallocClassInstance(v0, 48, 7);
}

uint64_t type metadata accessor for SuggestionEntityRetrieval()
{
  return self;
}

uint64_t sub_32E6C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t v3 = *v1;
  int64_t v4 = *((void *)*v1 + 2);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v6 = a1;
  char isUniquelyReferenced_nonNull_native = (char *)swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || (int64_t v8 = *((void *)v3 + 3) >> 1, v8 < v5))
  {
    if (v4 <= v5) {
      int64_t v9 = v4 + v2;
    }
    else {
      int64_t v9 = v4;
    }
    uint64_t v3 = sub_33228(isUniquelyReferenced_nonNull_native, v9, 1, (uint64_t)v3, &qword_4D408, (void (*)(uint64_t, uint64_t, char *))sub_1A334);
    int64_t v8 = *((void *)v3 + 3) >> 1;
  }
  uint64_t v10 = *((void *)v3 + 2);
  uint64_t v11 = v8 - v10;
  uint64_t result = (uint64_t)sub_1B7E4(v43, &v3[8 * v10 + 32], v8 - v10, v6);
  if (result < v2) {
    goto LABEL_15;
  }
  if (result)
  {
    uint64_t v16 = *((void *)v3 + 2);
    BOOL v17 = __OFADD__(v16, result);
    uint64_t v18 = v16 + result;
    if (v17)
    {
      __break(1u);
      goto LABEL_45;
    }
    *((void *)v3 + 2) = v18;
  }
  if (result != v11)
  {
LABEL_13:
    uint64_t result = sub_1BB0C();
    *uint64_t v1 = v3;
    return result;
  }
LABEL_16:
  uint64_t v6 = *((void *)v3 + 2);
  uint64_t result = v43[0];
  uint64_t v13 = v43[1];
  uint64_t v14 = v44;
  int64_t v15 = v45;
  if (!v46)
  {
LABEL_45:
    int64_t v35 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      goto LABEL_63;
    }
    int64_t v21 = (unint64_t)(v14 + 64) >> 6;
    if (v35 >= v21) {
      goto LABEL_13;
    }
    unint64_t v36 = *(void *)(v13 + 8 * v35);
    int64_t v37 = v15 + 1;
    if (!v36)
    {
      int64_t v37 = v15 + 2;
      if (v15 + 2 >= v21) {
        goto LABEL_13;
      }
      unint64_t v36 = *(void *)(v13 + 8 * v37);
      if (!v36)
      {
        int64_t v37 = v15 + 3;
        if (v15 + 3 >= v21) {
          goto LABEL_13;
        }
        unint64_t v36 = *(void *)(v13 + 8 * v37);
        if (!v36)
        {
          int64_t v37 = v15 + 4;
          if (v15 + 4 >= v21) {
            goto LABEL_13;
          }
          unint64_t v36 = *(void *)(v13 + 8 * v37);
          if (!v36)
          {
            int64_t v37 = v15 + 5;
            if (v15 + 5 >= v21) {
              goto LABEL_13;
            }
            unint64_t v36 = *(void *)(v13 + 8 * v37);
            if (!v36)
            {
              int64_t v38 = v15 + 6;
              do
              {
                if (v38 >= v21) {
                  goto LABEL_13;
                }
                unint64_t v36 = *(void *)(v13 + 8 * v38++);
              }
              while (!v36);
              int64_t v37 = v38 - 1;
            }
          }
        }
      }
    }
    unint64_t v19 = (v36 - 1) & v36;
    unint64_t v20 = __clz(__rbit64(v36)) + (v37 << 6);
    int64_t v15 = v37;
    goto LABEL_18;
  }
  unint64_t v19 = (v46 - 1) & v46;
  unint64_t v20 = __clz(__rbit64(v46)) | (v45 << 6);
  int64_t v21 = (unint64_t)(v44 + 64) >> 6;
LABEL_18:
  uint64_t v22 = *(void *)(*(void *)(result + 48) + 8 * v20);
  unint64_t v23 = &qword_4D408;
  while (1)
  {
    unint64_t v24 = *((void *)v3 + 3);
    int64_t v25 = v24 >> 1;
    if ((uint64_t)(v24 >> 1) < v6 + 1)
    {
      uint64_t v41 = v13;
      uint64_t v42 = result;
      uint64_t v39 = v15;
      uint64_t v40 = v14;
      uint64_t v32 = (uint64_t)v3;
      Swift::String v33 = v23;
      uint64_t v34 = sub_33228((char *)(v24 > 1), v6 + 1, 1, v32, v23, (void (*)(uint64_t, uint64_t, char *))sub_1A334);
      unint64_t v23 = v33;
      int64_t v15 = v39;
      uint64_t v14 = v40;
      uint64_t v3 = v34;
      uint64_t v13 = v41;
      uint64_t result = v42;
      int64_t v25 = *((void *)v3 + 3) >> 1;
    }
    if (v6 < v25) {
      break;
    }
LABEL_41:
    *((void *)v3 + 2) = v6;
  }
  while (1)
  {
    *(void *)&v3[8 * v6++ + 32] = v22;
    if (v19)
    {
      unint64_t v26 = __clz(__rbit64(v19));
      v19 &= v19 - 1;
      unint64_t v27 = v26 | (v15 << 6);
      goto LABEL_40;
    }
    int64_t v28 = v15 + 1;
    if (__OFADD__(v15, 1)) {
      break;
    }
    if (v28 >= v21) {
      goto LABEL_42;
    }
    unint64_t v29 = *(void *)(v13 + 8 * v28);
    int64_t v30 = v15 + 1;
    if (!v29)
    {
      int64_t v30 = v15 + 2;
      if (v15 + 2 >= v21) {
        goto LABEL_42;
      }
      unint64_t v29 = *(void *)(v13 + 8 * v30);
      if (!v29)
      {
        int64_t v30 = v15 + 3;
        if (v15 + 3 >= v21) {
          goto LABEL_42;
        }
        unint64_t v29 = *(void *)(v13 + 8 * v30);
        if (!v29)
        {
          int64_t v30 = v15 + 4;
          if (v15 + 4 >= v21) {
            goto LABEL_42;
          }
          unint64_t v29 = *(void *)(v13 + 8 * v30);
          if (!v29)
          {
            int64_t v30 = v15 + 5;
            if (v15 + 5 >= v21) {
              goto LABEL_42;
            }
            unint64_t v29 = *(void *)(v13 + 8 * v30);
            if (!v29)
            {
              int64_t v31 = v15 + 6;
              while (v31 < v21)
              {
                unint64_t v29 = *(void *)(v13 + 8 * v31++);
                if (v29)
                {
                  int64_t v30 = v31 - 1;
                  goto LABEL_39;
                }
              }
LABEL_42:
              *((void *)v3 + 2) = v6;
              goto LABEL_13;
            }
          }
        }
      }
    }
LABEL_39:
    unint64_t v19 = (v29 - 1) & v29;
    unint64_t v27 = __clz(__rbit64(v29)) + (v30 << 6);
    int64_t v15 = v30;
LABEL_40:
    uint64_t v22 = *(void *)(*(void *)(result + 48) + 8 * v27);
    if (v6 >= v25) {
      goto LABEL_41;
    }
  }
  __break(1u);
LABEL_63:
  __break(1u);
  return result;
}

char *sub_33228(char *result, int64_t a2, char a3, uint64_t a4, uint64_t *a5, void (*a6)(uint64_t, uint64_t, char *))
{
  char v8 = (char)result;
  if (a3)
  {
    unint64_t v9 = *(void *)(a4 + 24);
    uint64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      uint64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v10 = a2;
      }
    }
  }
  else
  {
    uint64_t v10 = a2;
  }
  uint64_t v11 = *(void *)(a4 + 16);
  if (v10 <= v11) {
    uint64_t v12 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v12 = v10;
  }
  if (v12)
  {
    sub_2420(a5);
    uint64_t v13 = (char *)swift_allocObject();
    size_t v14 = j__malloc_size(v13);
    *((void *)v13 + 2) = v11;
    *((void *)v13 + 3) = 2 * ((uint64_t)(v14 - 32) / 8);
  }
  else
  {
    uint64_t v13 = (char *)_swiftEmptyArrayStorage;
  }
  int64_t v15 = v13 + 32;
  if (v8)
  {
    a6(a4 + 32, v11, v15);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_3350C(0, v11, v15, a4);
  }
  return v13;
}

char *sub_33324(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    sub_2420(&qword_4DE48);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  if (v5)
  {
    sub_1A518((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_335E8(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

char *sub_3341C(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
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
    sub_2420(&qword_4D3D0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  if (v5)
  {
    sub_1A4BC((char *)(a4 + 32), v8, v12);
    *(void *)(a4 + 16) = 0;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_33708(0, v8, (unint64_t)v12, a4);
  }
  return v10;
}

char *sub_3350C(uint64_t a1, uint64_t a2, char *__dst, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    char v5 = (char *)(a4 + 8 * a1 + 32);
    unint64_t v6 = &__dst[8 * v4];
    if (v5 >= v6 || &v5[8 * v4] <= __dst)
    {
      memcpy(__dst, v5, 8 * v4);
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  sub_1BDB4();
  uint64_t result = (char *)sub_38110();
  __break(1u);
  return result;
}

uint64_t sub_335E8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      sub_2420(&qword_4DE50);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_38110();
  __break(1u);
  return result;
}

uint64_t sub_33708(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  uint64_t result = sub_38110();
  __break(1u);
  return result;
}

uint64_t sub_33800(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return sub_33A38(a1, (uint64_t (*)(uint64_t))sub_350F0, a3, a4, a5, a6, a7, a8);
}

void sub_33818(uint64_t isUniquelyReferenced_nonNull_native, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = *v8;
  unint64_t v11 = *(void *)(*v8 + 16);
  unint64_t v12 = v11 - 2;
  if (v11 >= 2)
  {
    unint64_t v13 = 0;
    while (1)
    {
      sub_35240(isUniquelyReferenced_nonNull_native, a2, a3, a4, a5, a6, a7, a8, v21, v22);
      sub_35380();
      if (!v16 & v15)
      {
        sub_35338();
        if (!v16 & v15)
        {
          do
            char isUniquelyReferenced_nonNull_native = sub_35240(isUniquelyReferenced_nonNull_native, a2, a3, a4, a5, a6, a7, a8, v21, v22);
          while (v9 > v22 * v11);
          uint64_t v14 = ((unint64_t)v22 * (unsigned __int128)v11) >> 64;
        }
      }
      unint64_t v9 = v13 + v14;
      if (__OFADD__(v13, v14)) {
        break;
      }
      if (v13 != v9)
      {
        unint64_t v17 = *(void *)(v10 + 16);
        if (v13 >= v17) {
          goto LABEL_22;
        }
        if (v9 >= v17) {
          goto LABEL_23;
        }
        uint64_t v18 = *(void *)(v10 + 32 + 8 * v13);
        uint64_t v19 = *(void *)(v10 + 32 + 8 * v9);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_35104(v10);
          uint64_t v10 = isUniquelyReferenced_nonNull_native;
        }
        unint64_t v20 = *(void *)(v10 + 16);
        if (v13 >= v20) {
          goto LABEL_24;
        }
        *(void *)(v10 + 32 + 8 * v13) = v19;
        if (v9 >= v20) {
          goto LABEL_25;
        }
        *(void *)(v10 + 32 + 8 * v9) = v18;
        uint64_t *v8 = v10;
      }
      --v11;
      BOOL v16 = v13++ == v12;
      if (v16) {
        return;
      }
    }
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
  }
}

void sub_33928(uint64_t isUniquelyReferenced_nonNull_native, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10 = *v8;
  unint64_t v11 = *(void *)(*v8 + 16);
  unint64_t v12 = v11 - 2;
  if (v11 >= 2)
  {
    unint64_t v13 = 0;
    while (1)
    {
      sub_35240(isUniquelyReferenced_nonNull_native, a2, a3, a4, a5, a6, a7, a8, v21, v22);
      sub_35380();
      if (!v16 & v15)
      {
        sub_35338();
        if (!v16 & v15)
        {
          do
            char isUniquelyReferenced_nonNull_native = sub_35240(isUniquelyReferenced_nonNull_native, a2, a3, a4, a5, a6, a7, a8, v21, v22);
          while (v9 > v22 * v11);
          uint64_t v14 = ((unint64_t)v22 * (unsigned __int128)v11) >> 64;
        }
      }
      unint64_t v9 = v13 + v14;
      if (__OFADD__(v13, v14)) {
        break;
      }
      if (v13 != v9)
      {
        unint64_t v17 = *(void *)(v10 + 16);
        if (v13 >= v17) {
          goto LABEL_22;
        }
        if (v9 >= v17) {
          goto LABEL_23;
        }
        __int16 v18 = *(_WORD *)(v10 + 32 + 2 * v13);
        __int16 v19 = *(_WORD *)(v10 + 32 + 2 * v9);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_35118(v10);
          uint64_t v10 = isUniquelyReferenced_nonNull_native;
        }
        unint64_t v20 = *(void *)(v10 + 16);
        if (v13 >= v20) {
          goto LABEL_24;
        }
        *(_WORD *)(v10 + 32 + 2 * v13) = v19;
        if (v9 >= v20) {
          goto LABEL_25;
        }
        *(_WORD *)(v10 + 32 + 2 * v9) = v18;
        uint64_t *v8 = v10;
      }
      --v11;
      BOOL v16 = v13++ == v12;
      if (v16) {
        return;
      }
    }
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
  }
}

uint64_t sub_33A38(uint64_t result, uint64_t (*a2)(uint64_t), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *v8;
  unint64_t v10 = *(void *)(*v8 + 16);
  unint64_t v11 = v10 - 2;
  if (v10 >= 2)
  {
    unint64_t v13 = 0;
    while (1)
    {
      uint64_t result = sub_35240(result, (uint64_t)a2, a3, a4, a5, a6, a7, a8, v22, v23);
      uint64_t v14 = ((unint64_t)v23 * (unsigned __int128)v10) >> 64;
      if (v10 > v23 * v10)
      {
        unint64_t v15 = -(uint64_t)v10 % v10;
        if (v15 > v23 * v10)
        {
          do
            uint64_t result = sub_35240(result, (uint64_t)a2, a3, a4, a5, a6, a7, a8, v22, v23);
          while (v15 > v23 * v10);
          uint64_t v14 = ((unint64_t)v23 * (unsigned __int128)v10) >> 64;
        }
      }
      unint64_t v16 = v13 + v14;
      if (__OFADD__(v13, v14)) {
        break;
      }
      if (v13 != v16)
      {
        unint64_t v17 = *(void *)(v9 + 16);
        if (v13 >= v17) {
          goto LABEL_20;
        }
        if (v16 >= v17) {
          goto LABEL_21;
        }
        uint64_t v18 = *(void *)(v9 + 32 + 8 * v13);
        uint64_t v19 = *(void *)(v9 + 32 + 8 * v16);
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          uint64_t result = a2(v9);
          uint64_t v9 = result;
        }
        unint64_t v20 = *(void *)(v9 + 16);
        if (v13 >= v20) {
          goto LABEL_22;
        }
        *(void *)(v9 + 32 + 8 * v13) = v19;
        if (v16 >= v20) {
          goto LABEL_23;
        }
        *(void *)(v9 + 32 + 8 * v16) = v18;
        uint64_t *v8 = v9;
      }
      --v10;
      if (v13++ == v11) {
        return result;
      }
    }
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
  }
  return result;
}

uint64_t sub_33B70(uint64_t result, uint64_t (*a2)(uint64_t), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v9 = *(void *)(*v8 + 16);
  unint64_t v10 = v9 - 2;
  if (v9 >= 2)
  {
    unint64_t v12 = 0;
    while (1)
    {
      uint64_t result = sub_35240(result, (uint64_t)a2, a3, a4, a5, a6, a7, a8, v22, v23);
      uint64_t v13 = ((unint64_t)v23 * (unsigned __int128)v9) >> 64;
      if (v9 > v23 * v9)
      {
        unint64_t v14 = -(uint64_t)v9 % v9;
        if (v14 > v23 * v9)
        {
          do
            uint64_t result = sub_35240(result, (uint64_t)a2, a3, a4, a5, a6, a7, a8, v22, v23);
          while (v14 > v23 * v9);
          uint64_t v13 = ((unint64_t)v23 * (unsigned __int128)v9) >> 64;
        }
      }
      unint64_t v15 = v12 + v13;
      if (__OFADD__(v12, v13)) {
        break;
      }
      if (v12 != v15)
      {
        uint64_t v16 = *v8;
        unint64_t v17 = *(void *)(*v8 + 16);
        if (v12 >= v17) {
          goto LABEL_22;
        }
        if (v15 >= v17) {
          goto LABEL_23;
        }
        uint64_t v18 = *(void *)(v16 + 32 + 8 * v12);
        uint64_t v19 = *(void *)(v16 + 32 + 8 * v15);
        swift_retain();
        swift_retain();
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        uint64_t *v8 = v16;
        if ((result & 1) == 0)
        {
          uint64_t result = a2(v16);
          uint64_t v16 = result;
          uint64_t *v8 = result;
        }
        if (v12 >= *(void *)(v16 + 16)) {
          goto LABEL_24;
        }
        *(void *)(v16 + 8 * v12 + 32) = v19;
        swift_release();
        sub_38080();
        uint64_t v20 = *v8;
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        uint64_t *v8 = v20;
        if ((result & 1) == 0)
        {
          uint64_t result = a2(v20);
          uint64_t v20 = result;
          uint64_t *v8 = result;
        }
        if (v15 >= *(void *)(v20 + 16)) {
          goto LABEL_25;
        }
        *(void *)(v20 + 8 * v15 + 32) = v18;
        swift_release();
        uint64_t result = sub_38080();
      }
      --v9;
      if (v12++ == v10) {
        return result;
      }
    }
    __break(1u);
LABEL_22:
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
LABEL_25:
    __break(1u);
  }
  return result;
}

unint64_t sub_33D08(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v4 = (void **)v3;
  uint64_t v8 = (void *)*v3;
  unint64_t v9 = sub_1A9F0(a2);
  uint64_t v11 = v8[2];
  BOOL v12 = (v10 & 1) == 0;
  Swift::Int v13 = v11 + v12;
  if (__OFADD__(v11, v12))
  {
    __break(1u);
    goto LABEL_11;
  }
  unint64_t v14 = v9;
  char v15 = v10;
  sub_2420(&qword_4DE30);
  if (!sub_380C0(a3 & 1, v13)) {
    goto LABEL_5;
  }
  unint64_t v16 = sub_1A9F0(a2);
  if ((v15 & 1) != (v17 & 1))
  {
LABEL_11:
    unint64_t result = sub_38180();
    __break(1u);
    return result;
  }
  unint64_t v14 = v16;
LABEL_5:
  uint64_t v18 = *v4;
  if (v15)
  {
    uint64_t v19 = v18[7];
    unint64_t result = swift_bridgeObjectRelease();
    *(void *)(v19 + 8 * v14) = a1;
  }
  else
  {
    return sub_33E18(v14, a2, a1, v18);
  }
  return result;
}

unint64_t sub_33E18(unint64_t result, uint64_t a2, uint64_t a3, void *a4)
{
  a4[(result >> 6) + 8] |= 1 << result;
  *(void *)(a4[6] + 8 * result) = a2;
  *(void *)(a4[7] + 8 * result) = a3;
  uint64_t v4 = a4[2];
  BOOL v5 = __OFADD__(v4, 1);
  uint64_t v6 = v4 + 1;
  if (v5) {
    __break(1u);
  }
  else {
    a4[2] = v6;
  }
  return result;
}

uint64_t sub_33E5C(uint64_t result, uint64_t a2, void *a3)
{
  if (a2 < 0)
  {
    __break(1u);
  }
  else
  {
    for (; a2; --a2)
      *a3++ = result;
  }
  return result;
}

uint64_t sub_33E78(Swift::Int *a1, Swift::Int a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  sub_38190();
  swift_bridgeObjectRetain();
  Swift::UInt v7 = sub_37A20();
  sub_381A0(v7);
  Swift::Int v8 = sub_381B0();
  uint64_t v9 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v10 = v8 & ~v9;
  if (((*(void *)(v6 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
  {
LABEL_7:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v16 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_34B50(a2, v10, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v16;
    swift_bridgeObjectRelease();
    uint64_t result = 1;
    goto LABEL_8;
  }
  uint64_t v11 = sub_37A20();
  if (v11 != sub_37A20())
  {
    uint64_t v12 = ~v9;
    do
    {
      unint64_t v10 = (v10 + 1) & v12;
      if (((*(void *)(v6 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        goto LABEL_7;
      }
      uint64_t v13 = sub_37A20();
    }
    while (v13 != sub_37A20());
  }
  swift_bridgeObjectRelease();
  uint64_t result = 0;
  a2 = *(void *)(*(void *)(*v3 + 48) + 8 * v10);
LABEL_8:
  *a1 = a2;
  return result;
}

uint64_t sub_33FE0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_2420(&qword_4DE40);
  uint64_t v3 = sub_38000();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v6 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v7 = ~(-1 << v5);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v8 = v7 & *(void *)(v2 + 56);
    int64_t v9 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v10 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v12 = 0;
    if (!v8) {
      goto LABEL_7;
    }
LABEL_6:
    unint64_t v13 = __clz(__rbit64(v8));
    v8 &= v8 - 1;
    for (unint64_t i = v13 | (v12 << 6); ; unint64_t i = __clz(__rbit64(v16)) + (v12 << 6))
    {
      uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * i);
      sub_38190();
      Swift::UInt v19 = sub_37A20();
      sub_381A0(v19);
      uint64_t result = sub_381B0();
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) == 0)
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v20) >> 6;
        while (++v22 != v25 || (v24 & 1) == 0)
        {
          BOOL v26 = v22 == v25;
          if (v22 == v25) {
            unint64_t v22 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v10 + 8 * v22);
          if (v27 != -1)
          {
            unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
            goto LABEL_30;
          }
        }
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        return result;
      }
      unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
      *(void *)(v10 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
      *(void *)(*(void *)(v4 + 48) + 8 * v23) = v18;
      ++*(void *)(v4 + 16);
      if (v8) {
        goto LABEL_6;
      }
LABEL_7:
      int64_t v15 = v12 + 1;
      if (__OFADD__(v12, 1)) {
        goto LABEL_38;
      }
      if (v15 >= v9) {
        goto LABEL_32;
      }
      unint64_t v16 = v6[v15];
      ++v12;
      if (!v16)
      {
        int64_t v12 = v15 + 1;
        if (v15 + 1 >= v9) {
          goto LABEL_32;
        }
        unint64_t v16 = v6[v12];
        if (!v16)
        {
          int64_t v12 = v15 + 2;
          if (v15 + 2 >= v9) {
            goto LABEL_32;
          }
          unint64_t v16 = v6[v12];
          if (!v16)
          {
            int64_t v17 = v15 + 3;
            if (v17 >= v9)
            {
LABEL_32:
              swift_release();
              uint64_t v1 = v0;
              uint64_t v28 = 1 << *(unsigned char *)(v2 + 32);
              if (v28 > 63) {
                sub_33E5C(0, (unint64_t)(v28 + 63) >> 6, (void *)(v2 + 56));
              }
              else {
                *uint64_t v6 = -1 << v28;
              }
              *(void *)(v2 + 16) = 0;
              break;
            }
            unint64_t v16 = v6[v17];
            if (!v16)
            {
              while (1)
              {
                int64_t v12 = v17 + 1;
                if (__OFADD__(v17, 1)) {
                  goto LABEL_39;
                }
                if (v12 >= v9) {
                  goto LABEL_32;
                }
                unint64_t v16 = v6[v12];
                ++v17;
                if (v16) {
                  goto LABEL_20;
                }
              }
            }
            int64_t v12 = v17;
          }
        }
      }
LABEL_20:
      unint64_t v8 = (v16 - 1) & v16;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

Swift::Int sub_3429C(uint64_t isStackAllocationSafe, uint64_t a2)
{
  uint64_t v3 = isStackAllocationSafe;
  char v4 = *(unsigned char *)(a2 + 32);
  unint64_t v5 = (unint64_t)((1 << v4) + 63) >> 6;
  if ((v4 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    __chkstk_darwin(isStackAllocationSafe);
    uint64_t v6 = (uint64_t *)((char *)&v10 - ((8 * v5 + 15) & 0x3FFFFFFFFFFFFFF0));
    sub_33E5C(0, v5, v6);
    Swift::Int v7 = sub_34430((Swift::Int)v6, v5, a2, v3);
    swift_release();
  }
  else
  {
    unint64_t v8 = (void *)swift_slowAlloc();
    sub_33E5C(0, v5, v8);
    Swift::Int v7 = sub_34430((Swift::Int)v8, v5, a2, v3);
    swift_release();
    swift_slowDealloc();
  }
  return v7;
}

Swift::Int sub_34430(Swift::Int result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = a3;
  uint64_t v41 = (unint64_t *)result;
  uint64_t v6 = 0;
  if (*(void *)(a4 + 16) < *(void *)(a3 + 16))
  {
    int64_t v46 = 0;
    uint64_t v42 = a4 + 56;
    uint64_t v7 = 1 << *(unsigned char *)(a4 + 32);
    if (v7 < 64) {
      uint64_t v8 = ~(-1 << v7);
    }
    else {
      uint64_t v8 = -1;
    }
    uint64_t v9 = v8 & *(void *)(a4 + 56);
    int64_t v43 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v10 = a3 + 56;
    while (2)
    {
      uint64_t v45 = v6;
      while (1)
      {
        do
        {
          if (v9)
          {
            v9 &= v9 - 1;
          }
          else
          {
            int64_t v11 = v46 + 1;
            if (__OFADD__(v46, 1))
            {
              __break(1u);
LABEL_64:
              __break(1u);
LABEL_65:
              __break(1u);
LABEL_66:
              __break(1u);
              return result;
            }
            if (v11 >= v43) {
              goto LABEL_62;
            }
            uint64_t v12 = *(void *)(v42 + 8 * v11);
            int64_t v13 = v46 + 1;
            if (!v12)
            {
              int64_t v13 = v46 + 2;
              if (v46 + 2 >= v43) {
                goto LABEL_62;
              }
              uint64_t v12 = *(void *)(v42 + 8 * v13);
              if (!v12)
              {
                int64_t v13 = v46 + 3;
                if (v46 + 3 >= v43) {
                  goto LABEL_62;
                }
                uint64_t v12 = *(void *)(v42 + 8 * v13);
                if (!v12)
                {
                  int64_t v14 = v46 + 4;
                  if (v46 + 4 >= v43) {
                    goto LABEL_62;
                  }
                  uint64_t v12 = *(void *)(v42 + 8 * v14);
                  if (!v12)
                  {
                    while (1)
                    {
                      int64_t v13 = v14 + 1;
                      if (__OFADD__(v14, 1)) {
                        goto LABEL_65;
                      }
                      if (v13 >= v43) {
                        goto LABEL_62;
                      }
                      uint64_t v12 = *(void *)(v42 + 8 * v13);
                      ++v14;
                      if (v12) {
                        goto LABEL_22;
                      }
                    }
                  }
                  int64_t v13 = v46 + 4;
                }
              }
            }
LABEL_22:
            uint64_t v9 = (v12 - 1) & v12;
            int64_t v46 = v13;
          }
          sub_38190();
          Swift::UInt v15 = sub_37A20();
          sub_381A0(v15);
          uint64_t result = sub_381B0();
          uint64_t v5 = a3;
          uint64_t v16 = -1 << *(unsigned char *)(a3 + 32);
          unint64_t v17 = result & ~v16;
          unint64_t v18 = v17 >> 6;
          uint64_t v19 = 1 << v17;
        }
        while (((1 << v17) & *(void *)(v10 + 8 * (v17 >> 6))) == 0);
        uint64_t v20 = sub_37A20();
        uint64_t result = sub_37A20();
        if (v20 == result) {
          break;
        }
        uint64_t v21 = ~v16;
        for (unint64_t i = v17 + 1; ; unint64_t i = v23 + 1)
        {
          unint64_t v23 = i & v21;
          uint64_t v5 = a3;
          if (((*(void *)(v10 + (((i & v21) >> 3) & 0xFFFFFFFFFFFFFF8)) >> (i & v21)) & 1) == 0) {
            break;
          }
          uint64_t v24 = sub_37A20();
          uint64_t result = sub_37A20();
          if (v24 == result)
          {
            unint64_t v18 = v23 >> 6;
            uint64_t v19 = 1 << v23;
            goto LABEL_30;
          }
        }
      }
LABEL_30:
      uint64_t v5 = a3;
      v41[v18] |= v19;
      uint64_t v6 = v45 + 1;
      if (!__OFADD__(v45, 1)) {
        continue;
      }
      break;
    }
    __break(1u);
  }
  int64_t v25 = 0;
  uint64_t v44 = v5 + 56;
  uint64_t v26 = 1 << *(unsigned char *)(v5 + 32);
  if (v26 < 64) {
    uint64_t v27 = ~(-1 << v26);
  }
  else {
    uint64_t v27 = -1;
  }
  unint64_t v28 = v27 & *(void *)(v5 + 56);
  int64_t v47 = (unint64_t)(v26 + 63) >> 6;
  uint64_t v29 = a4 + 56;
  while (2)
  {
    uint64_t v45 = v6;
    while (1)
    {
      do
      {
        if (v28)
        {
          unint64_t v30 = __clz(__rbit64(v28));
          v28 &= v28 - 1;
          unint64_t v31 = v30 | (v25 << 6);
        }
        else
        {
          int64_t v32 = v25 + 1;
          uint64_t v5 = a3;
          if (__OFADD__(v25, 1)) {
            goto LABEL_64;
          }
          if (v32 >= v47) {
            goto LABEL_62;
          }
          unint64_t v33 = *(void *)(v44 + 8 * v32);
          int64_t v34 = v25 + 1;
          if (!v33)
          {
            int64_t v34 = v25 + 2;
            if (v25 + 2 >= v47) {
              goto LABEL_62;
            }
            unint64_t v33 = *(void *)(v44 + 8 * v34);
            if (!v33)
            {
              int64_t v34 = v25 + 3;
              if (v25 + 3 >= v47) {
                goto LABEL_62;
              }
              unint64_t v33 = *(void *)(v44 + 8 * v34);
              if (!v33)
              {
                int64_t v35 = v25 + 4;
                if (v25 + 4 >= v47) {
                  goto LABEL_62;
                }
                unint64_t v33 = *(void *)(v44 + 8 * v35);
                if (!v33)
                {
                  while (1)
                  {
                    int64_t v34 = v35 + 1;
                    if (__OFADD__(v35, 1)) {
                      goto LABEL_66;
                    }
                    if (v34 >= v47) {
                      goto LABEL_62;
                    }
                    unint64_t v33 = *(void *)(v44 + 8 * v34);
                    ++v35;
                    if (v33) {
                      goto LABEL_53;
                    }
                  }
                }
                int64_t v34 = v25 + 4;
              }
            }
          }
LABEL_53:
          unint64_t v28 = (v33 - 1) & v33;
          int64_t v25 = v34;
          unint64_t v31 = __clz(__rbit64(v33)) + (v34 << 6);
        }
        sub_38190();
        Swift::UInt v36 = sub_37A20();
        sub_381A0(v36);
        uint64_t result = sub_381B0();
        uint64_t v37 = -1 << *(unsigned char *)(a4 + 32);
        unint64_t v38 = result & ~v37;
      }
      while (((*(void *)(v29 + ((v38 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v38) & 1) == 0);
      uint64_t v5 = sub_37A20();
      uint64_t result = sub_37A20();
      if (v5 == result) {
        break;
      }
      uint64_t v39 = ~v37;
      while (1)
      {
        unint64_t v38 = (v38 + 1) & v39;
        if (((*(void *)(v29 + ((v38 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v38) & 1) == 0) {
          break;
        }
        uint64_t v5 = sub_37A20();
        uint64_t result = sub_37A20();
        if (v5 == result) {
          goto LABEL_59;
        }
      }
    }
LABEL_59:
    *(unint64_t *)((char *)v41 + ((v31 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v31;
    uint64_t v6 = v45 + 1;
    if (!__OFADD__(v45, 1)) {
      continue;
    }
    break;
  }
  __break(1u);
LABEL_62:
  swift_retain();
  return sub_348E8(v41, a2, v45, v5);
}

uint64_t sub_348E8(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  if (!a3)
  {
    uint64_t v9 = &_swiftEmptySetSingleton;
LABEL_35:
    swift_release();
    return (uint64_t)v9;
  }
  uint64_t v5 = a3;
  if (*(void *)(a4 + 16) == a3) {
    return v4;
  }
  sub_2420(&qword_4DE40);
  uint64_t result = sub_38010();
  uint64_t v9 = (unsigned char *)result;
  uint64_t v29 = a1;
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
      goto LABEL_35;
    }
    unint64_t v16 = v29[v15];
    ++v11;
    if (!v16)
    {
      uint64_t v11 = v15 + 1;
      if (v15 + 1 >= a2) {
        goto LABEL_35;
      }
      unint64_t v16 = v29[v11];
      if (!v16)
      {
        uint64_t v11 = v15 + 2;
        if (v15 + 2 >= a2) {
          goto LABEL_35;
        }
        unint64_t v16 = v29[v11];
        if (!v16) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v10 = (v16 - 1) & v16;
    unint64_t v14 = __clz(__rbit64(v16)) + (v11 << 6);
LABEL_24:
    uint64_t v18 = *(void *)(*(void *)(v4 + 48) + 8 * v14);
    sub_38190();
    Swift::UInt v19 = sub_37A20();
    sub_381A0(v19);
    uint64_t result = sub_381B0();
    uint64_t v20 = -1 << v9[32];
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v12 + 8 * (v21 >> 6))) == 0)
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v12 + 8 * v22);
        if (v27 != -1)
        {
          unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_33;
        }
      }
      __break(1u);
LABEL_38:
      __break(1u);
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v12 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_33:
    *(void *)(v12 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    *(void *)(*((void *)v9 + 6) + 8 * v23) = v18;
    ++*((void *)v9 + 2);
    if (__OFSUB__(v5--, 1)) {
      goto LABEL_38;
    }
    if (!v5) {
      goto LABEL_35;
    }
  }
  uint64_t v17 = v15 + 3;
  if (v17 >= a2) {
    goto LABEL_35;
  }
  unint64_t v16 = v29[v17];
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
      goto LABEL_35;
    }
    unint64_t v16 = v29[v11];
    ++v17;
    if (v16) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

Swift::Int sub_34B50(Swift::Int result, unint64_t a2, char a3)
{
  uint64_t v4 = v3;
  Swift::Int v6 = result;
  unint64_t v7 = *(void *)(*v3 + 16);
  unint64_t v8 = *(void *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_33FE0();
  }
  else
  {
    if (v8 > v7)
    {
      uint64_t result = (Swift::Int)sub_34CD0();
      goto LABEL_14;
    }
    sub_34E68();
  }
  uint64_t v9 = *v3;
  sub_38190();
  Swift::UInt v10 = sub_37A20();
  sub_381A0(v10);
  uint64_t result = sub_381B0();
  uint64_t v11 = -1 << *(unsigned char *)(v9 + 32);
  a2 = result & ~v11;
  if ((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v12 = sub_37A20();
    uint64_t result = sub_37A20();
    if (v12 == result)
    {
LABEL_13:
      uint64_t result = sub_38170();
      __break(1u);
    }
    else
    {
      uint64_t v13 = ~v11;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        uint64_t v14 = sub_37A20();
        uint64_t result = sub_37A20();
        if (v14 == result) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v15 = *v4;
  *(void *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v15 + 48) + 8 * a2) = v6;
  uint64_t v16 = *(void *)(v15 + 16);
  BOOL v17 = __OFADD__(v16, 1);
  uint64_t v18 = v16 + 1;
  if (v17) {
    __break(1u);
  }
  else {
    *(void *)(v15 + 16) = v18;
  }
  return result;
}

void *sub_34CD0()
{
  uint64_t v1 = v0;
  sub_2420(&qword_4DE40);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_37FF0();
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
  if (!v12) {
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v14 = __clz(__rbit64(v12));
  v12 &= v12 - 1;
  for (unint64_t i = v14 | (v9 << 6); ; unint64_t i = __clz(__rbit64(v17)) + (v9 << 6))
  {
    *(void *)(*(void *)(v4 + 48) + 8 * i) = *(void *)(*(void *)(v2 + 48) + 8 * i);
    if (v12) {
      goto LABEL_11;
    }
LABEL_12:
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
LABEL_25:
    unint64_t v12 = (v17 - 1) & v17;
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_25;
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
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_34E68()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_2420(&qword_4DE40);
  uint64_t v3 = sub_38000();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_34:
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
  int64_t v9 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v10 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v12 = 0;
  if (!v8) {
    goto LABEL_7;
  }
LABEL_6:
  unint64_t v13 = __clz(__rbit64(v8));
  v8 &= v8 - 1;
  for (unint64_t i = v13 | (v12 << 6); ; unint64_t i = __clz(__rbit64(v16)) + (v12 << 6))
  {
    uint64_t v18 = *(void *)(*(void *)(v2 + 48) + 8 * i);
    sub_38190();
    Swift::UInt v19 = sub_37A20();
    sub_381A0(v19);
    uint64_t result = sub_381B0();
    uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) == 0)
    {
      char v24 = 0;
      unint64_t v25 = (unint64_t)(63 - v20) >> 6;
      while (++v22 != v25 || (v24 & 1) == 0)
      {
        BOOL v26 = v22 == v25;
        if (v22 == v25) {
          unint64_t v22 = 0;
        }
        v24 |= v26;
        uint64_t v27 = *(void *)(v10 + 8 * v22);
        if (v27 != -1)
        {
          unint64_t v23 = __clz(__rbit64(~v27)) + (v22 << 6);
          goto LABEL_30;
        }
      }
      __break(1u);
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    unint64_t v23 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
LABEL_30:
    *(void *)(v10 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    *(void *)(*(void *)(v4 + 48) + 8 * v23) = v18;
    ++*(void *)(v4 + 16);
    if (v8) {
      goto LABEL_6;
    }
LABEL_7:
    int64_t v15 = v12 + 1;
    if (__OFADD__(v12, 1)) {
      goto LABEL_36;
    }
    if (v15 >= v9) {
      goto LABEL_32;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v15);
    ++v12;
    if (!v16)
    {
      int64_t v12 = v15 + 1;
      if (v15 + 1 >= v9) {
        goto LABEL_32;
      }
      unint64_t v16 = *(void *)(v6 + 8 * v12);
      if (!v16)
      {
        int64_t v12 = v15 + 2;
        if (v15 + 2 >= v9) {
          goto LABEL_32;
        }
        unint64_t v16 = *(void *)(v6 + 8 * v12);
        if (!v16) {
          break;
        }
      }
    }
LABEL_20:
    unint64_t v8 = (v16 - 1) & v16;
  }
  int64_t v17 = v15 + 3;
  if (v17 >= v9)
  {
LABEL_32:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_34;
  }
  unint64_t v16 = *(void *)(v6 + 8 * v17);
  if (v16)
  {
    int64_t v12 = v17;
    goto LABEL_20;
  }
  while (1)
  {
    int64_t v12 = v17 + 1;
    if (__OFADD__(v17, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_32;
    }
    unint64_t v16 = *(void *)(v6 + 8 * v12);
    ++v17;
    if (v16) {
      goto LABEL_20;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

void sub_350F0(uint64_t a1)
{
}

void sub_35104(uint64_t a1)
{
}

void sub_35118(uint64_t a1)
{
}

void sub_3512C(uint64_t a1)
{
}

unint64_t sub_35140()
{
  unint64_t result = qword_4D3C0;
  if (!qword_4D3C0)
  {
    sub_379C0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4D3C0);
  }
  return result;
}

uint64_t sub_35190(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, a1);
}

unint64_t sub_351A4()
{
  unint64_t result = qword_4DE28;
  if (!qword_4DE28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4DE28);
  }
  return result;
}

unint64_t sub_351F0()
{
  unint64_t result = qword_4DE38;
  if (!qword_4DE38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_4DE38);
  }
  return result;
}

uint64_t sub_35240(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  a10 = 0;
  return _swift_stdlib_random(&a10, 8);
}

uint64_t sub_352C0()
{
  return sub_380F0();
}

uint64_t sub_352DC()
{
  return swift_retain();
}

char *sub_35314@<X0>(unint64_t a1@<X8>)
{
  return sub_1AE88((char *)(a1 > 1), v1, 1);
}

void sub_35360(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(v3 - 160);
  uint64_t v6 = v2;
  Logger.debug(output:test:caller:)(*(Swift::String *)&a1, 1, *(Swift::String *)&v5);
}

uint64_t sub_353B8()
{
  return 0;
}

uint64_t sub_353C4()
{
  return swift_release();
}

uint64_t sub_353DC()
{
  uint64_t v0 = sub_37A80();
  sub_4934(v0, qword_50CF8);
  uint64_t v1 = sub_23E8(v0, (uint64_t)qword_50CF8);
  uint64_t v2 = enum case for HomeSuggestionType.setFanSpeed(_:);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v0 - 8) + 104);
  return v3(v1, v2, v0);
}

uint64_t sub_35464()
{
  uint64_t v0 = sub_37710();
  sub_4934(v0, qword_50D10);
  uint64_t v1 = (void *)sub_23E8(v0, (uint64_t)qword_50D10);
  *uint64_t v1 = &unk_4DE58;
  v1[1] = 0;
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(v0 - 8) + 104);
  return v2();
}

uint64_t sub_35500(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_152BC;
  return sub_355A0(a1, a2);
}

uint64_t sub_355A0(uint64_t a1, uint64_t a2)
{
  v2[24] = a1;
  v2[25] = a2;
  sub_2420(&qword_4D188);
  v2[26] = swift_task_alloc();
  v2[27] = swift_task_alloc();
  sub_37630();
  v2[28] = swift_task_alloc();
  sub_2420(&qword_4D118);
  v2[29] = swift_task_alloc();
  uint64_t v3 = sub_37590();
  v2[30] = v3;
  v2[31] = *(void *)(v3 - 8);
  v2[32] = swift_task_alloc();
  return _swift_task_switch(sub_356FC, 0, 0);
}

uint64_t sub_356FC()
{
  uint64_t v1 = *(void **)(v0 + 200);
  sub_23A4(v1, v1[3]);
  uint64_t v2 = sub_37780();
  sub_16928(0x656D614E6D6F6F72, 0xE800000000000000, v2, (_OWORD *)(v0 + 16));
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 40))
  {
    if (swift_dynamicCast()) {
      uint64_t v3 = *(void *)(v0 + 152);
    }
    else {
      uint64_t v3 = 0;
    }
  }
  else
  {
    sub_3D60(v0 + 16, &qword_4D060);
    uint64_t v3 = 0;
  }
  uint64_t v4 = sub_37780();
  sub_16928(0x7475626972747461, 0xE900000000000065, v4, (_OWORD *)(v0 + 48));
  swift_bridgeObjectRelease();
  if (*(void *)(v0 + 72))
  {
    if (swift_dynamicCast()) {
      uint64_t v5 = *(void *)(v0 + 168);
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    sub_3D60(v0 + 48, &qword_4D060);
    uint64_t v5 = 0;
  }
  uint64_t v6 = sub_37780();
  sub_16928(0x65756C6176, 0xE500000000000000, v6, (_OWORD *)(v0 + 80));
  swift_bridgeObjectRelease();
  if (!*(void *)(v0 + 104))
  {
    sub_3D60(v0 + 80, &qword_4D060);
LABEL_18:
    uint64_t v7 = 0;
    *(_OWORD *)(v0 + 112) = 0u;
    *(_OWORD *)(v0 + 128) = 0u;
    goto LABEL_19;
  }
  sub_37B50();
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_18;
  }
  uint64_t v7 = *(void *)(v0 + 176);
  sub_23A4(*(void **)(v0 + 200), v1[3]);
  swift_retain();
  sub_37790();
  sub_37AF0();
  swift_release();
  if (!v7) {
    goto LABEL_18;
  }
  swift_retain();
  sub_37AE0();
  swift_release();
  if (!*(void *)(v0 + 136))
  {
LABEL_19:
    sub_3D60(v0 + 112, &qword_4D060);
    goto LABEL_20;
  }
  sub_37B80();
  if (swift_dynamicCast())
  {
    uint64_t v8 = *(void *)(v0 + 184);
    sub_23A4(*(void **)(v0 + 200), v1[3]);
    swift_retain();
    sub_37790();
    sub_37B60();
    swift_release();
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v8 = 0;
LABEL_21:
  *(void *)(v0 + 264) = v7;
  *(void *)(v0 + 272) = v8;
  if (qword_4CD68 != -1) {
    swift_once();
  }
  uint64_t v10 = *(void *)(v0 + 224);
  uint64_t v9 = *(void *)(v0 + 232);
  uint64_t v11 = *(void **)(v0 + 200);
  sub_37570();
  sub_23A4(v11, v1[3]);
  sub_37790();
  sub_37620();
  type metadata accessor for HomeSuggestionCATs();
  swift_allocObject();
  *(void *)(v0 + 280) = HomeSuggestionCATs.init(templateDir:options:globals:)(v9, v10);
  if (v3)
  {
    sub_37E20();
    swift_bridgeObjectRelease();
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = 1;
  }
  uint64_t v13 = *(void *)(v0 + 216);
  uint64_t v14 = sub_37610();
  uint64_t v15 = 1;
  sub_3D38(v13, v12, 1, v14);
  if (v5)
  {
    sub_37E20();
    swift_bridgeObjectRelease();
    uint64_t v15 = 0;
  }
  sub_3D38(*(void *)(v0 + 208), v15, 1, v14);
  unint64_t v16 = (void *)swift_task_alloc();
  *(void *)(v0 + 288) = v16;
  *unint64_t v16 = v0;
  v16[1] = sub_159A0;
  return sub_10EB8();
}

ValueMetadata *type metadata accessor for SetFanSpeedSuggestion()
{
  return &type metadata for SetFanSpeedSuggestion;
}

uint64_t sub_35BC4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 24);
  long long v11 = *(_OWORD *)(a1 + 32);
  sub_23A4((void *)a1, v3);
  if (qword_4CDF0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_37A80();
  sub_23E8(v4, (uint64_t)qword_50CF8);
  uint64_t v5 = sub_37A70();
  uint64_t v7 = v6;
  uint64_t v8 = type metadata accessor for HomeAutomationCandidateSuggestionConfigurator();
  swift_allocObject();
  uint64_t v9 = sub_16A14(v5, v7);
  void v12[3] = v8;
  void v12[4] = sub_123C8(&qword_4D0C8, (void (*)(uint64_t))type metadata accessor for HomeAutomationCandidateSuggestionConfigurator);
  v12[0] = v9;
  *(void *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = v11;
  sub_3C6C((uint64_t *)a2);
  sub_37640();
  return sub_3C1C((uint64_t)v12);
}

uint64_t sub_35D10@<X0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v44 = a1;
  uint64_t v45 = a2;
  uint64_t v47 = sub_2420(&qword_4D048);
  sub_4EA8();
  uint64_t v46 = v2;
  __chkstk_darwin(v3);
  v51.n128_u64[0] = (unint64_t)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_37C30();
  sub_4EA8();
  uint64_t v7 = v6;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2420(&qword_4D050);
  long long v11 = (int *)type metadata accessor for ResolverParameterProperties();
  unint64_t v12 = (*(unsigned __int8 *)(*((void *)v11 - 1) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*((void *)v11 - 1) + 80);
  uint64_t v40 = *(void *)(*((void *)v11 - 1) + 72);
  uint64_t v13 = v40;
  uint64_t v14 = swift_allocObject();
  uint64_t v52 = v14;
  *(_OWORD *)(v14 + 16) = xmmword_38BF0;
  unint64_t v15 = v14 + v12;
  int64_t v43 = *(void (**)(char *, void, uint64_t))(v7 + 104);
  v43(v10, enum case for SuggestionParameter.roomName(_:), v5);
  uint64_t v16 = type metadata accessor for RoomNameResolver();
  swift_allocObject();
  uint64_t v17 = sub_1D460();
  uint64_t v18 = (uint64_t *)(v15 + v11[5]);
  v18[3] = v16;
  v18[4] = sub_123C8((unint64_t *)&qword_4D0B0, (void (*)(uint64_t))type metadata accessor for RoomNameResolver);
  *uint64_t v18 = v17;
  Swift::UInt v19 = *(void (**)(unint64_t, char *, uint64_t))(v7 + 32);
  uint64_t v41 = v7 + 32;
  uint64_t v42 = v19;
  v19(v15, v10, v5);
  *(unsigned char *)(v15 + v11[6]) = 1;
  *(unsigned char *)(v15 + v11[7]) = 0;
  uint64_t v50 = sub_2420(&qword_4D060);
  v49.n128_u64[0] = (unint64_t)&type metadata for Any + 8;
  uint64_t v48 = sub_36818;
  sub_375B0();
  unint64_t v20 = v15 + v13;
  unint64_t v21 = v43;
  v43(v10, enum case for SuggestionParameter.attribute(_:), v5);
  uint64_t v22 = type metadata accessor for AttributeResolver();
  swift_allocObject();
  unint64_t v23 = sub_2C5BC();
  char v24 = (void *)(v15 + v13 + v11[5]);
  v24[3] = v22;
  v24[4] = sub_123C8(&qword_4D198, (void (*)(uint64_t))type metadata accessor for AttributeResolver);
  *char v24 = v23;
  uint64_t v39 = v10;
  uint64_t v25 = v5;
  uint64_t v38 = v5;
  uint64_t v26 = v5;
  uint64_t v27 = v42;
  v42(v20, v10, v26);
  *(unsigned char *)(v20 + v11[6]) = 1;
  *(unsigned char *)(v20 + v11[7]) = 0;
  sub_706C();
  unint64_t v28 = v15 + 2 * v40;
  v21(v10, enum case for SuggestionParameter.value(_:), v25);
  uint64_t v29 = type metadata accessor for ValueResolver();
  swift_allocObject();
  unint64_t v30 = sub_27BD0();
  unint64_t v31 = (void *)(v28 + v11[5]);
  v31[3] = v29;
  v31[4] = sub_123C8(&qword_4D1A0, (void (*)(uint64_t))type metadata accessor for ValueResolver);
  *unint64_t v31 = v30;
  v27(v28, v39, v38);
  *(unsigned char *)(v28 + v11[6]) = 0;
  *(unsigned char *)(v28 + v11[7]) = 0;
  sub_706C();
  sub_4DCC(v44, (uint64_t)&v55);
  LODWORD(v10) = *(unsigned __int8 *)(v15 + v11[7]);
  uint64_t v32 = sub_37800();
  swift_bridgeObjectRetain();
  sub_37C20();
  sub_7108();
  uint64_t v50 = v32;
  if (v10 == 1)
  {
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v46 + 16))(v51.n128_u64[0], v15 + v11[8], v47);
    sub_377E0();
  }
  else
  {
    sub_377F0();
  }
  __n128 v49 = v56;
  sub_70C0(v56.n128_f64[0]);
  sub_37C20();
  sub_3BB8(v15 + v11[5], (uint64_t)v53);
  sub_7118(v49);
  sub_703C();
  swift_release();
  swift_bridgeObjectRelease();
  sub_3D60((uint64_t)v53, &qword_4D068);
  sub_3C1C((uint64_t)v54);
  char v33 = *(unsigned char *)(v20 + v11[7]);
  sub_37C20();
  sub_7108();
  if (v33)
  {
    uint64_t v34 = v47;
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v46 + 16))(v51.n128_u64[0], v20 + v11[8], v47);
    sub_7098();
  }
  else
  {
    sub_70E4();
    uint64_t v34 = v47;
  }
  __n128 v49 = v56;
  sub_70C0(v56.n128_f64[0]);
  sub_37C20();
  sub_3BB8(v20 + v11[5], (uint64_t)v53);
  sub_7118(v49);
  sub_703C();
  swift_release();
  swift_bridgeObjectRelease();
  sub_3D60((uint64_t)v53, &qword_4D068);
  sub_3C1C((uint64_t)v54);
  char v35 = *(unsigned char *)(v28 + v11[7]);
  sub_37C20();
  sub_7108();
  if (v35)
  {
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v46 + 16))(v51.n128_u64[0], v28 + v11[8], v34);
    sub_7098();
  }
  else
  {
    sub_70E4();
  }
  __n128 v51 = v56;
  sub_70C0(v56.n128_f64[0]);
  sub_37C20();
  sub_3BB8(v28 + v11[5], (uint64_t)v53);
  sub_7118(v51);
  sub_378A0();
  swift_release();
  swift_bridgeObjectRelease();
  sub_3D60((uint64_t)v53, &qword_4D068);
  sub_3C1C((uint64_t)v54);
  swift_bridgeObjectRelease();
  sub_4E90(&v55, v45);
  swift_setDeallocating();
  return sub_219FC();
}

uint64_t sub_364C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_4DCC(a1, a2);
}

void *sub_364D8()
{
  return sub_364F0();
}

void *sub_364F0()
{
  unint64_t v14 = (unint64_t)_swiftEmptyArrayStorage;
  if (qword_4CD70 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_50BB0;
  uint64_t v1 = sub_23A4(qword_50B98, qword_50BB0);
  uint64_t v2 = *(void *)(v0 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v2 + 16))(v4);
  char v5 = sub_37BE0();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v0);
  if ((v5 & 1) == 0) {
    return _swiftEmptyArrayStorage;
  }
  sub_37940();
  sub_37930();
  sub_37900();
  sub_37920();
  if (qword_4CC50 != -1) {
    swift_once();
  }
  if (v14 >> 62)
  {
    swift_retain();
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_380F0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v6 = *(void *)((char *)&dword_10 + (v14 & 0xFFFFFFFFFFFFFF8));
    swift_retain();
  }
  if (__OFADD__(v6, 4))
  {
    __break(1u);
    goto LABEL_20;
  }
  sub_3689C(v6 + 4);
  sub_37F00();
  swift_retain();
  sub_37EE0();
  sub_374C4();
  if (v8) {
LABEL_20:
  }
    sub_374F0(v7);
  sub_37F30();
  sub_37F00();
  swift_retain();
  sub_37EE0();
  sub_374C4();
  if (v8) {
    sub_374F0(v9);
  }
  sub_37F30();
  sub_37F00();
  swift_retain();
  sub_37EE0();
  sub_374C4();
  if (v8) {
    sub_374F0(v10);
  }
  sub_37F30();
  sub_37F00();
  swift_retain();
  sub_37EE0();
  sub_374C4();
  if (v8) {
    sub_374F0(v11);
  }
  sub_37F30();
  sub_37F00();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return (void *)v14;
}

uint64_t sub_36818@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  sub_1BC54(a1, (uint64_t)v7);
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    *a2 = v5;
    a2[1] = v6;
    uint64_t v4 = &type metadata for String;
  }
  else
  {
    *(unsigned char *)a2 = 0;
    uint64_t v4 = &type metadata for Bool;
  }
  a2[3] = v4;
  return result;
}

uint64_t sub_3689C(uint64_t a1)
{
  unint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v3;
  if ((result & 1) == 0
    || (v3 & 0x8000000000000000) != 0
    || (v3 & 0x4000000000000000) != 0
    || a1 > *(void *)((char *)&dword_18 + (v3 & 0xFFFFFFFFFFFFFF8)) >> 1)
  {
    if (v3 >> 62)
    {
      swift_bridgeObjectRetain();
      sub_380F0();
      swift_bridgeObjectRelease();
    }
    uint64_t result = sub_38050();
    *uint64_t v1 = result;
  }
  return result;
}

void *sub_3695C(void *a1, void *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (void *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_37C30();
    (*(void (**)(void *, void *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    long long v9 = *(_OWORD *)((char *)a2 + v8 + 24);
    *(_OWORD *)((char *)a1 + v8 + 24) = v9;
    (**(void (***)(void))(v9 - 8))();
    uint64_t v10 = a3[7];
    *((unsigned char *)a1 + a3[6]) = *((unsigned char *)a2 + a3[6]);
    *((unsigned char *)a1 + v10) = *((unsigned char *)a2 + v10);
    uint64_t v11 = a3[8];
    unint64_t v12 = (char *)a1 + v11;
    uint64_t v13 = (char *)a2 + v11;
    uint64_t v14 = sub_2420(&qword_4D048);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  }
  return a1;
}

uint64_t sub_36AD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_37C30();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  sub_3C1C(a1 + *(int *)(a2 + 20));
  uint64_t v5 = a1 + *(int *)(a2 + 32);
  uint64_t v6 = sub_2420(&qword_4D048);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8);
  return v7(v5, v6);
}

uint64_t sub_36B88(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_37C30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  long long v8 = *(_OWORD *)(a2 + v7 + 24);
  *(_OWORD *)(a1 + v7 + 24) = v8;
  (**(void (***)(void))(v8 - 8))();
  uint64_t v9 = a3[7];
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  *(unsigned char *)(a1 + v9) = *(unsigned char *)(a2 + v9);
  uint64_t v10 = a3[8];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = sub_2420(&qword_4D048);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
  return a1;
}

uint64_t sub_36CAC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_37C30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  sub_36D90((uint64_t *)(a1 + a3[5]), (uint64_t *)(a2 + a3[5]));
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  uint64_t v7 = a3[8];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  uint64_t v10 = sub_2420(&qword_4D048);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 24))(v8, v9, v10);
  return a1;
}

uint64_t *sub_36D90(uint64_t *result, uint64_t *a2)
{
  if (result != a2)
  {
    unint64_t v3 = result;
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
        *unint64_t v3 = v12;
      }
      else
      {
        uint64_t v11 = *(uint64_t (**)(void))(v10 + 24);
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
          *unint64_t v3 = *a2;
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

uint64_t sub_36FC0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_37C30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = a1 + v7;
  uint64_t v10 = (long long *)(a2 + v7);
  long long v11 = *v10;
  long long v12 = v10[1];
  *(void *)(v9 + 32) = *((void *)v10 + 4);
  *(_OWORD *)uint64_t v9 = v11;
  *(_OWORD *)(v9 + 16) = v12;
  *(unsigned char *)(a1 + v8) = *(unsigned char *)(a2 + v8);
  uint64_t v13 = a3[8];
  *(unsigned char *)(a1 + a3[7]) = *(unsigned char *)(a2 + a3[7]);
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = sub_2420(&qword_4D048);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 32))(v14, v15, v16);
  return a1;
}

uint64_t sub_370A8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_37C30();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a1 + v7;
  uint64_t v9 = a2 + v7;
  sub_3C1C(a1 + v7);
  long long v10 = *(_OWORD *)(v9 + 16);
  *(_OWORD *)uint64_t v8 = *(_OWORD *)v9;
  *(_OWORD *)(v8 + 16) = v10;
  *(void *)(v8 + 32) = *(void *)(v9 + 32);
  uint64_t v11 = a3[7];
  *(unsigned char *)(a1 + a3[6]) = *(unsigned char *)(a2 + a3[6]);
  *(unsigned char *)(a1 + v11) = *(unsigned char *)(a2 + v11);
  uint64_t v12 = a3[8];
  uint64_t v13 = a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_2420(&qword_4D048);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 40))(v13, v14, v15);
  return a1;
}

uint64_t sub_371A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_371B8);
}

uint64_t sub_371B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_37C30();
  sub_374D8();
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = a1;
LABEL_8:
    return sub_3DBC(v9, a2, v8);
  }
  if (a2 != 0x7FFFFFFF)
  {
    uint64_t v8 = sub_2420(&qword_4D048);
    uint64_t v9 = a1 + *(int *)(a3 + 32);
    goto LABEL_8;
  }
  unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 24);
  if (v10 >= 0xFFFFFFFF) {
    LODWORD(v10) = -1;
  }
  return (v10 + 1);
}

uint64_t sub_37270(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_37284);
}

void sub_37284(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  sub_37C30();
  sub_374D8();
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = v8;
    uint64_t v11 = a1;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(void *)(a1 + *(int *)(a4 + 20) + 24) = (a2 - 1);
      return;
    }
    uint64_t v10 = sub_2420(&qword_4D048);
    uint64_t v11 = a1 + *(int *)(a4 + 32);
  }
  sub_3D38(v11, a2, a2, v10);
}

uint64_t type metadata accessor for ResolverParameterProperties()
{
  uint64_t result = qword_4DEC0;
  if (!qword_4DEC0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_37380()
{
  sub_37C30();
  if (v0 <= 0x3F)
  {
    sub_3745C();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_3745C()
{
  if (!qword_4DED0)
  {
    sub_44C4(&qword_4D060);
    unint64_t v0 = sub_375C0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_4DED0);
    }
  }
}

uint64_t sub_374F0@<X0>(unint64_t a1@<X8>)
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)(a1 > 1, v1 + 1, 1);
}

double sub_37510()
{
  NSMeasurement v1 = Measurement._bridgeToObjectiveC()();
  return v1._doubleValue;
}

uint64_t sub_37520()
{
  return Measurement.init(value:unit:)();
}

uint64_t sub_37530()
{
  return URL.absoluteURL.getter();
}

uint64_t sub_37540()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t sub_37550()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_37560(Swift::Bool percentEncoded)
{
  return URL.path(percentEncoded:)(percentEncoded)._countAndFlagsBits;
}

uint64_t sub_37570()
{
  return URL.init(string:)();
}

uint64_t sub_37580()
{
  return type metadata accessor for URL();
}

uint64_t sub_37590()
{
  return type metadata accessor for TemplatingResult();
}

uint64_t sub_375B0()
{
  return Transformer.init(transform:)();
}

uint64_t sub_375C0()
{
  return type metadata accessor for Transformer();
}

uint64_t sub_375D0()
{
  return CATWrapper.init(templateDir:options:globals:)();
}

uint64_t _s29HomeAutomationSiriSuggestions0A14SuggestionCATsCfd_0()
{
  return CATWrapper.deinit();
}

uint64_t sub_375F0()
{
  return SpeakableString.init(print:speak:)();
}

uint64_t sub_37600()
{
  return SpeakableString.speak.getter();
}

uint64_t sub_37610()
{
  return type metadata accessor for SpeakableString();
}

uint64_t sub_37620()
{
  return static CATOption.defaultMode.getter();
}

uint64_t sub_37630()
{
  return type metadata accessor for CATOption();
}

uint64_t sub_37640()
{
  return dispatch thunk of SiriHelpSuggestionDetailsBuilderExtension.withConfigurator(_:)();
}

uint64_t sub_37650()
{
  return dispatch thunk of SiriHelpSuggestionDetailsBuilderExtension.register(signals:)();
}

uint64_t sub_37660()
{
  return type metadata accessor for SiriHintsMode();
}

uint64_t sub_37670()
{
  return type metadata accessor for DeviceType();
}

uint64_t sub_37680()
{
  return HomeEntity.name.getter();
}

uint64_t sub_37690()
{
  return type metadata accessor for HomeEntity();
}

uint64_t sub_376A0()
{
  return type metadata accessor for DomainOwner();
}

uint64_t sub_376B0()
{
  return DomainOwner.init(_:)();
}

uint64_t sub_376C0()
{
  return dispatch thunk of Interaction.executionParameters.getter();
}

uint64_t sub_376D0()
{
  return dispatch thunk of Interaction.verb.getter();
}

uint64_t sub_376E0()
{
  return Interaction.getMentionedAppIds()();
}

uint64_t sub_376F0()
{
  return DefaultOwner.init(group:identifier:)();
}

uint64_t sub_37700()
{
  return type metadata accessor for DefaultOwner();
}

uint64_t sub_37710()
{
  return type metadata accessor for DialogDetails();
}

uint64_t sub_37720()
{
  return SalientEntity.type.getter();
}

uint64_t sub_37730()
{
  return SalientEntity.value.getter();
}

uint64_t sub_37740()
{
  return type metadata accessor for SalientEntity();
}

uint64_t sub_37750()
{
  return type metadata accessor for CoreSignalTypes();
}

uint64_t sub_37760()
{
  return type metadata accessor for DeliveryVehicle();
}

uint64_t sub_37780()
{
  return dispatch thunk of DialogProperties.getParameters()();
}

uint64_t sub_37790()
{
  return dispatch thunk of DialogProperties.globals.getter();
}

uint64_t sub_377A0()
{
  return type metadata accessor for SalientEntityType();
}

uint64_t sub_377B0()
{
  return dispatch thunk of CandidateSuggestion.context.getter();
}

uint64_t sub_377C0()
{
  return dispatch thunk of EnvironmentSnapshot.openAppIds.getter();
}

uint64_t sub_377D0()
{
  return dispatch thunk of EnvironmentSnapshot.salientEntities.getter();
}

uint64_t sub_377E0()
{
  return ResolvableParameter.__allocating_init(typeIdentifier:required:loggingKeyTransformer:)();
}

uint64_t sub_377F0()
{
  return ResolvableParameter.__allocating_init(typeIdentifier:required:)();
}

uint64_t sub_37800()
{
  return type metadata accessor for ResolvableParameter();
}

uint64_t sub_37810()
{
  return type metadata accessor for VersionedInvocation();
}

uint64_t sub_37820()
{
  return type metadata accessor for CoreSuggestionGroups();
}

uint64_t sub_37830()
{
  return static VersionedInvocations.HintsDawnA.getter();
}

uint64_t sub_37840()
{
  return static OwnerDefinitionFactory.createOwnerDefinitions()();
}

uint64_t sub_37850()
{
  return dispatch thunk of SuggestionDetailsBuilder.templateRoot(_:)();
}

uint64_t sub_37860()
{
  return dispatch thunk of SuggestionDetailsBuilder.disabledDevices(_:)();
}

uint64_t sub_37870()
{
  return dispatch thunk of SuggestionDetailsBuilder.loggingIdentifier(_:)();
}

uint64_t sub_37880()
{
  return dispatch thunk of SuggestionDetailsBuilder.validForInvocationTypes(_:)();
}

uint64_t sub_37890()
{
  return dispatch thunk of SuggestionDetailsBuilder.disabledDeliveryVehicles(_:)();
}

uint64_t sub_378A0()
{
  return SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:)();
}

uint64_t sub_378B0()
{
  return CandidateSuggestionFactory.create(suggestionId:params:objective:)();
}

uint64_t sub_378C0()
{
  return dispatch thunk of SuggestionOwnerDefinitionBuilder.withSiriHelpSignalExtractor(_:)();
}

uint64_t sub_378D0()
{
  return dispatch thunk of SuggestionOwnerDefinitionBuilder.withConversationalGenerator(_:)();
}

uint64_t sub_378E0()
{
  return dispatch thunk of SuggestionOwnerDefinitionBuilder.add(suggestionId:dialogDetails:builder:)();
}

uint64_t sub_378F0()
{
  return dispatch thunk of SuggestionOwnerDefinitionBuilder.build()();
}

uint64_t sub_37900()
{
  return static Signal.HomeScreen.getter();
}

uint64_t sub_37910()
{
  return Signal.__allocating_init(signalType:signalValue:fallbackSignals:)();
}

uint64_t sub_37920()
{
  return static Signal.DeviceLocked.getter();
}

uint64_t sub_37930()
{
  return static Signal.Fallback.getter();
}

uint64_t sub_37940()
{
  return type metadata accessor for Signal();
}

uint64_t sub_37960()
{
  return Context.setParam(for:key:value:)();
}

uint64_t sub_37970()
{
  return type metadata accessor for Objective();
}

uint64_t sub_37980()
{
  return Wrappable.getRoot()();
}

uint64_t sub_37990()
{
  return dispatch thunk of Home.accessories.getter();
}

uint64_t sub_379A0()
{
  return dispatch thunk of Home.hasHub.getter();
}

uint64_t sub_379B0()
{
  return dispatch thunk of Home.scenes.getter();
}

uint64_t sub_379C0()
{
  return type metadata accessor for Home();
}

uint64_t sub_379D0()
{
  return HomeDeviceType.description.getter();
}

uint64_t sub_379E0()
{
  return HomeDeviceType.init(rawValue:)();
}

uint64_t sub_379F0()
{
  return HomeDeviceType.rawValue.getter();
}

uint64_t sub_37A00()
{
  return HomeAttributeType.description.getter();
}

uint64_t sub_37A10()
{
  return HomeAttributeType.init(rawValue:)();
}

uint64_t sub_37A20()
{
  return HomeAttributeType.rawValue.getter();
}

uint64_t sub_37A30()
{
  return HomeAttributeUnit.rawValue.getter();
}

uint64_t sub_37A40()
{
  return HomeAttributeValue.__allocating_init(doubleValue:unit:)();
}

uint64_t sub_37A50()
{
  return type metadata accessor for HomeAttributeValue();
}

uint64_t sub_37A60()
{
  return HomeSuggestionType.init(rawValue:)();
}

uint64_t sub_37A70()
{
  return HomeSuggestionType.rawValue.getter();
}

uint64_t sub_37A80()
{
  return type metadata accessor for HomeSuggestionType();
}

uint64_t sub_37A90()
{
  return dispatch thunk of HomeStore.currentHome.getter();
}

uint64_t sub_37AA0()
{
  return dispatch thunk of HomeStore.waitForInitialization(label:refresh:)();
}

uint64_t sub_37AB0()
{
  return dispatch thunk of HomeStore.homes.getter();
}

uint64_t sub_37AC0()
{
  return static HomeStore.shared.getter();
}

uint64_t sub_37AD0()
{
  return type metadata accessor for HomeStore();
}

uint64_t sub_37AE0()
{
  return dispatch thunk of HomeAutomationEntityStateValue.getProperty(_:)();
}

uint64_t sub_37AF0()
{
  return dispatch thunk of HomeAutomationEntityStateValue.mockGlobals.setter();
}

uint64_t sub_37B00()
{
  return dispatch thunk of HomeAutomationEntityStateValue.Builder.withStringValue(_:)();
}

uint64_t sub_37B10()
{
  return dispatch thunk of HomeAutomationEntityStateValue.Builder.withNumericValue(_:)();
}

uint64_t sub_37B20()
{
  return dispatch thunk of HomeAutomationEntityStateValue.Builder.build()();
}

uint64_t sub_37B30()
{
  return HomeAutomationEntityStateValue.Builder.init()();
}

uint64_t sub_37B40()
{
  return type metadata accessor for HomeAutomationEntityStateValue.Builder();
}

uint64_t sub_37B50()
{
  return type metadata accessor for HomeAutomationEntityStateValue();
}

uint64_t sub_37B60()
{
  return dispatch thunk of HomeAutomationAbstractMeasurement.mockGlobals.setter();
}

uint64_t sub_37B70()
{
  return HomeAutomationAbstractMeasurement.__allocating_init(value:unit:)();
}

uint64_t sub_37B80()
{
  return type metadata accessor for HomeAutomationAbstractMeasurement();
}

uint64_t sub_37B90()
{
  return type metadata accessor for HomeAutomationCATs();
}

uint64_t sub_37BA0()
{
  return static SemanticMapper.getSemanticKey(for:)();
}

uint64_t sub_37BB0()
{
  return static SemanticMapper.getSemanticKey(for:)();
}

uint64_t sub_37BC0()
{
  return SiriHintUseCase.init(rawValue:)();
}

uint64_t sub_37BD0()
{
  return type metadata accessor for SiriHintUseCase();
}

uint64_t sub_37BE0()
{
  return dispatch thunk of FeatureFlagProtocol.isSiriHelpEnabled.getter();
}

uint64_t sub_37BF0()
{
  return dispatch thunk of FeatureFlagProtocol.isSiriSuggestionsEnabled.getter();
}

uint64_t sub_37C00()
{
  return FeatureFlagProvider.init()();
}

uint64_t sub_37C10()
{
  return type metadata accessor for FeatureFlagProvider();
}

uint64_t sub_37C20()
{
  return SuggestionParameter.rawValue.getter();
}

uint64_t sub_37C30()
{
  return type metadata accessor for SuggestionParameter();
}

uint64_t sub_37C40()
{
  return SuggestionParameters.isSingleAccessoryOfTypeInHome.getter();
}

uint64_t sub_37C50()
{
  return SuggestionParameters.accessoryName.getter();
}

uint64_t sub_37C60()
{
  return SuggestionParameters.accessoryType.getter();
}

uint64_t sub_37C70()
{
  return SuggestionParameters.containerName.getter();
}

uint64_t sub_37C80()
{
  return SuggestionParameters.hasTargetedMoreThanOneEntity.getter();
}

uint64_t sub_37C90()
{
  return SuggestionParameters.roomName.getter();
}

uint64_t sub_37CA0()
{
  return type metadata accessor for SuggestionParameters();
}

uint64_t sub_37CB0()
{
  return dispatch thunk of Scene.actions.getter();
}

uint64_t sub_37CC0()
{
  return dispatch thunk of Entity.description.getter();
}

uint64_t sub_37CD0()
{
  return Entity.name.getter();
}

uint64_t sub_37CE0()
{
  return dispatch thunk of Entity.room.getter();
}

uint64_t sub_37CF0()
{
  return static Signpost.end(logging:_:_:_:)();
}

uint64_t sub_37D00()
{
  return static Signpost.Name.createOwnerDefinition.getter();
}

uint64_t sub_37D10()
{
  return static Signpost.Name.updateSuggestionContext.getter();
}

uint64_t sub_37D20()
{
  return static Signpost.begin(logging:_:)();
}

uint64_t sub_37D30()
{
  return type metadata accessor for Signpost.Context();
}

uint64_t sub_37D40()
{
  return dispatch thunk of Accessory.attributes.getter();
}

uint64_t sub_37D50()
{
  return dispatch thunk of Accessory.has(type:)();
}

uint64_t sub_37D60()
{
  return dispatch thunk of Accessory.type.getter();
}

uint64_t sub_37D70()
{
  return type metadata accessor for OSSignpostID();
}

uint64_t sub_37D80()
{
  return Logger.logObject.getter();
}

uint64_t sub_37D90()
{
  return type metadata accessor for Logger();
}

uint64_t sub_37DA0()
{
  return Logger.init(_:)();
}

uint64_t sub_37DB0()
{
  return Dictionary.description.getter();
}

uint64_t sub_37DC0()
{
  return Dictionary.init(dictionaryLiteral:)();
}

uint64_t sub_37DD0()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_37DE0()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t sub_37DF0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_37E00()
{
  return String.init<A>(describing:)();
}

uint64_t sub_37E10()
{
  return static String._fromSubstring(_:)();
}

uint64_t sub_37E20()
{
  return String.toSpeakableString.getter();
}

uint64_t sub_37E30()
{
  return String.capitalizeFirstLetter()()._countAndFlagsBits;
}

uint64_t sub_37E40()
{
  return String.hash(into:)();
}

uint64_t sub_37E50()
{
  return String.index(before:)();
}

void sub_37E70(Swift::String a1)
{
}

Swift::Int sub_37E80()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_37E90()
{
  return String.subscript.getter();
}

uint64_t sub_37EB0()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

uint64_t sub_37EC0()
{
  return RawRepresentable<>.encode(to:)();
}

uint64_t sub_37ED0()
{
  return RawRepresentable<>.init(from:)();
}

uint64_t sub_37EE0()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_37EF0()
{
  return Array.description.getter();
}

uint64_t sub_37F00()
{
  return specialized Array._endMutation()();
}

uint64_t sub_37F20()
{
  return Array<A>.removeDuplicates()();
}

uint64_t sub_37F30()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_37F40()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_37F60()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_37F70()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_37F80()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_37F90()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_37FA0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_37FB0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_37FC0()
{
  return StringProtocol.contains<A>(_:)();
}

uint64_t sub_37FD0()
{
  return BinaryInteger.description.getter();
}

uint64_t sub_37FE0()
{
  return _HashTable.occupiedBucket(after:)();
}

uint64_t sub_37FF0()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_38000()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_38010()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_38020(Swift::Int a1)
{
}

uint64_t sub_38030()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_38040()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_38050()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_38060()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_38070()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_38080()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_38090()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_380A0()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_380B0()
{
  return _print_unlocked<A, B>(_:_:)();
}

BOOL sub_380C0(Swift::Bool isUnique, Swift::Int capacity)
{
  return _NativeDictionary.ensureUnique(isUnique:capacity:)(isUnique, capacity);
}

uint64_t sub_380D0()
{
  return _NativeDictionary._delete(at:)();
}

uint64_t sub_380E0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_380F0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_38100()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_38110()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_38120(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_38140()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_38150()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_38160()
{
  return _findStringSwitchCaseWithCache(cases:string:cache:)();
}

uint64_t sub_38170()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_38180()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_38190()
{
  return Hasher.init(_seed:)();
}

void sub_381A0(Swift::UInt a1)
{
}

Swift::Int sub_381B0()
{
  return Hasher._finalize()();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
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

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
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

uint64_t swift_defaultActor_destroy()
{
  return _swift_defaultActor_destroy();
}

uint64_t swift_defaultActor_initialize()
{
  return _swift_defaultActor_initialize();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
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

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}