uint64_t sub_53F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  long long v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  long long v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void (*v46)(uint64_t, uint64_t);
  uint64_t v47;
  uint64_t v48;
  uint64_t result;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  long long v59;
  long long v60;
  void *v61;
  uint64_t v62;
  long long v63;
  uint64_t v64[3];
  long long v65;
  uint64_t v66;
  uint64_t v67[3];
  long long v68;
  uint64_t v69;
  uint64_t v70[3];
  long long v71;
  uint64_t v72;
  uint64_t v73[3];
  long long v74;
  uint64_t v75;
  uint64_t v76[3];
  long long v77;
  uint64_t v78;
  uint64_t v79[3];
  long long v80;
  uint64_t v81;
  uint64_t v82[3];
  unsigned char v83[24];
  uint64_t v84;
  char v85[8];
  unsigned char v86[16];

  sub_68C4(&qword_18598);
  __chkstk_darwin();
  v56 = (char *)&v53 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_11140();
  v61 = *(void **)(v5 - 8);
  v62 = v5;
  __chkstk_darwin();
  v7 = (uint64_t *)((char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v8 = *(void *)(a1 + 24);
  v63 = *(_OWORD *)(a1 + 32);
  sub_6A84((void *)a1, v8);
  *(void *)v83 = v8;
  *(_OWORD *)&v83[8] = v63;
  sub_6908(v82);
  sub_11110();
  v9 = *(void *)&v83[16];
  v63 = *(_OWORD *)v83;
  sub_6A84(v82, *(uint64_t *)v83);
  v80 = v63;
  v81 = v9;
  sub_6908(v79);
  sub_11250();
  v10 = v81;
  v63 = v80;
  sub_6A84(v79, v80);
  v77 = v63;
  v78 = v10;
  sub_6908(v76);
  sub_11240();
  v11 = v78;
  v63 = v77;
  sub_6A84(v76, v77);
  v74 = v63;
  v75 = v11;
  sub_6908(v73);
  sub_11270();
  v12 = v75;
  v63 = v74;
  sub_6A84(v73, v74);
  v71 = v63;
  v72 = v12;
  sub_6908(v70);
  sub_11230();
  v13 = v72;
  v63 = v71;
  sub_6A84(v70, v71);
  v68 = v63;
  v69 = v13;
  sub_6908(v67);
  sub_112A0();
  v14 = v69;
  v63 = v68;
  sub_6A84(v67, v68);
  sub_B9C8(*(unsigned char *)(a2 + 88));
  v65 = v63;
  v66 = v14;
  sub_6908(v64);
  sub_11270();
  swift_bridgeObjectRelease();
  sub_696C((uint64_t)v64);
  sub_696C((uint64_t)v67);
  sub_696C((uint64_t)v70);
  sub_696C((uint64_t)v73);
  sub_696C((uint64_t)v76);
  sub_696C((uint64_t)v79);
  sub_696C((uint64_t)v82);
  sub_69BC(a2 + 120, (uint64_t)v86, &qword_185A0);
  sub_69BC((uint64_t)v86, (uint64_t)v64, &qword_185A0);
  if (v64[0])
  {
    v15 = *(void *)(a1 + 40);
    v63 = *(_OWORD *)(a1 + 24);
    sub_6A84((void *)a1, v63);
    *(_OWORD *)v83 = v63;
    *(void *)&v83[16] = v15;
    sub_6908(v82);
    sub_11290();
    sub_696C((uint64_t)v82);
  }
  sub_69BC(a2 + 128, (uint64_t)v85, &qword_185A8);
  sub_69BC((uint64_t)v85, (uint64_t)v67, &qword_185A8);
  if (v67[0])
  {
    v16 = *(void *)(a1 + 40);
    v63 = *(_OWORD *)(a1 + 24);
    sub_6A84((void *)a1, v63);
    *(_OWORD *)v83 = v63;
    *(void *)&v83[16] = v16;
    sub_6908(v82);
    sub_11280();
    sub_696C((uint64_t)v82);
  }
  sub_69BC(a2 + 96, (uint64_t)v70, &qword_185B0);
  sub_69BC((uint64_t)v70, (uint64_t)v73, &qword_185B0);
  if (v73[1])
  {
    v17 = *(void *)(a1 + 24);
    v63 = *(_OWORD *)(a1 + 32);
    sub_6A84((void *)a1, v17);
    *(void *)v83 = v17;
    *(_OWORD *)&v83[8] = v63;
    sub_6908(v82);
    sub_11100();
    sub_696C((uint64_t)v82);
  }
  if (*(unsigned char *)(a2 + 89))
  {
    v18 = *(void *)(a1 + 40);
    v63 = *(_OWORD *)(a1 + 24);
    sub_6A84((void *)a1, v63);
    *(_OWORD *)v83 = v63;
    *(void *)&v83[16] = v18;
    sub_6908(v82);
    sub_112B0();
    sub_696C((uint64_t)v82);
  }
  v20 = *(void *)(a2 + 152);
  v19 = *(void *)(a2 + 160);
  if ((v20 || v19 != 0xE000000000000000) && (sub_11580() & 1) == 0)
  {
    *(void *)&v59 = *(void *)(a1 + 40);
    v21 = v59;
    v60 = *(_OWORD *)(a1 + 24);
    *(void *)&v63 = sub_6A84((void *)a1, v60);
    v22 = v7;
    *v7 = v20;
    v7[1] = v19;
    v23 = v61;
    v24 = v7;
    v25 = v62;
    ((void (*)(void *, void, uint64_t))v61[13])(v24, enum case for IntentType.inIntent(_:), v62);
    *(_OWORD *)v83 = v60;
    *(void *)&v83[16] = v21;
    sub_6908(v82);
    swift_bridgeObjectRetain();
    sub_11260();
    ((void (*)(void *, uint64_t))v23[1])(v22, v25);
    sub_696C((uint64_t)v82);
  }
  v26 = *(void *)(a2 + 168);
  v84 = v26;
  v27 = *(void *)(v26 + 16);
  if (v27)
  {
    v54 = a2;
    v55 = sub_111E0();
    v28 = v26 + 32;
    swift_bridgeObjectRetain();
    do
    {
      *(void *)&v63 = v27;
      sub_6A20(v28, (uint64_t)v79);
      *(void *)&v60 = *(void *)(a1 + 40);
      v59 = *(_OWORD *)(a1 + 24);
      v62 = v59;
      v61 = sub_6A84((void *)a1, v59);
      v29 = v80;
      sub_6A84(v79, v80);
      v30 = 8 * (*(char (**)(void, void))(*((void *)&v29 + 1) + 8))(v29, *((void *)&v29 + 1));
      v31 = *(void *)&aSongnameartist[v30];
      v57 = *(void *)&aSongnameartist[v30 + 40];
      v58 = v31;
      v32 = *((void *)&v80 + 1);
      v33 = v80;
      sub_6A84(v79, v80);
      v34 = 8 * (*(char (**)(uint64_t, uint64_t))(v32 + 8))(v33, v32);
      v35 = *(void *)&aSongnameartist[v34];
      v36 = *(void *)&aSongnameartist[v34 + 40];
      v37 = type metadata accessor for AudioSuggestionResolver();
      v38 = swift_allocObject();
      *(void *)(v38 + 16) = v35;
      *(void *)(v38 + 24) = v36;
      swift_bridgeObjectRelease();
      *(void *)&v77 = v37;
      *((void *)&v77 + 1) = sub_6AC8(&qword_185B8, v39, (void (*)(uint64_t))type metadata accessor for AudioSuggestionResolver);
      v76[0] = v38;
      v41 = *((void *)&v80 + 1);
      v40 = v80;
      sub_6A84(v79, v80);
      (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v40, v41);
      v42 = v80;
      sub_6A84(v79, v80);
      (*(void (**)(void, void))(*((void *)&v42 + 1) + 16))(v42, *((void *)&v42 + 1));
      v43 = a1;
      v45 = *((void *)&v80 + 1);
      v44 = v80;
      sub_6A84(v79, v80);
      v46 = *(void (**)(uint64_t, uint64_t))(v45 + 32);
      v47 = v45;
      a1 = v43;
      v46(v44, v47);
      sub_111D0();
      *(_OWORD *)v83 = v59;
      *(void *)&v83[16] = v60;
      sub_6908(v82);
      sub_112D0();
      v48 = v63;
      swift_release();
      swift_bridgeObjectRelease();
      sub_6D74((uint64_t)v76, &qword_185C0);
      sub_696C((uint64_t)v82);
      sub_696C((uint64_t)v79);
      v28 += 40;
      v27 = v48 - 1;
    }
    while (v27);
    sub_6B10((uint64_t)&v84);
    a2 = v54;
  }
  result = *(void *)(a2 + 176);
  v79[0] = result;
  v50 = *(void *)(result + 16);
  if (v50)
  {
    v51 = result + 32;
    swift_bridgeObjectRetain();
    do
    {
      v52 = *(void *)(a1 + 40);
      v63 = *(_OWORD *)(a1 + 24);
      sub_6A84((void *)a1, v63);
      *(_OWORD *)v83 = v63;
      *(void *)&v83[16] = v52;
      sub_6908(v82);
      sub_112C0();
      sub_696C((uint64_t)v82);
      v51 += 40;
      --v50;
    }
    while (v50);
    return sub_6B10((uint64_t)v79);
  }
  return result;
}

uint64_t sub_5D78()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t sub_5D8C(uint64_t a1, uint64_t a2)
{
  v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_18578 + dword_18578);
  v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_6DE0;
  return v7(a1, a2);
}

uint64_t sub_5E40()
{
  swift_bridgeObjectRelease();
  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t sub_5E78()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_5EAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_185C8 + dword_185C8);
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v4 + 16) = v8;
  *uint64_t v8 = v4;
  v8[1] = sub_5F74;
  return v10(a2, a3, a4);
}

uint64_t sub_5F74(uint64_t a1)
{
  uint64_t v5 = *v1;
  swift_task_dealloc();
  v3 = *(uint64_t (**)(uint64_t))(v5 + 8);
  return v3(a1);
}

uint64_t variable initialization expression of ArtistNameParameterBuilder.parameterName()
{
  return 1;
}

uint64_t variable initialization expression of AudioSuggestionsExecutionParameters.queueIsPlayingShuffled()
{
  return 2;
}

uint64_t variable initialization expression of AudioSuggestionsExecutionParameters.mediaItemType()
{
  return 0;
}

uint64_t variable initialization expression of AudioSuggestionsExecutionParameters.supportsAffinityIntent()
{
  return 0;
}

uint64_t type metadata accessor for AudioSuggestionsPluginOwnerDefinitionFactory()
{
  return self;
}

uint64_t type metadata accessor for AudioSuggestionResolver()
{
  return self;
}

void type metadata accessor for INMediaItemType()
{
  if (!qword_18550)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_18550);
    }
  }
}

void *sub_6138@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_6148(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_6154(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_6168(uint64_t a1, uint64_t a2)
{
  return sub_6AC8((unint64_t *)&unk_18558, a2, (void (*)(uint64_t))type metadata accessor for AudioSuggestionResolver);
}

uint64_t sub_61B0(uint64_t a1, uint64_t a2)
{
  return sub_6AC8((unint64_t *)&unk_18568, a2, (void (*)(uint64_t))type metadata accessor for AudioSuggestionResolver);
}

uint64_t sub_61F8(uint64_t a1, uint64_t a2)
{
  *(void *)(v2 + 280) = a1;
  *(void *)(v2 + 288) = a2;
  return _swift_task_switch(sub_6218, 0, 0);
}

uint64_t sub_6218()
{
  if (qword_18348 != -1) {
    swift_once();
  }
  uint64_t v1 = (int *)v0[35];
  uint64_t v2 = qword_190E0;
  v0[28] = sub_11150();
  v0[29] = sub_6AC8(&qword_18580, 255, (void (*)(uint64_t))&type metadata accessor for DomainOwner);
  v0[25] = v2;
  uint64_t v5 = (uint64_t (*)(void *))((char *)v1 + *v1);
  swift_retain();
  v3 = (void *)swift_task_alloc();
  v0[37] = v3;
  void *v3 = v0;
  v3[1] = sub_638C;
  return v5(v0 + 25);
}

uint64_t sub_638C(uint64_t a1)
{
  uint64_t v2 = *(void *)v1 + 200;
  *(void *)(*(void *)v1 + 304) = a1;
  swift_task_dealloc();
  sub_696C(v2);
  return _swift_task_switch(sub_6498, 0, 0);
}

uint64_t sub_6498()
{
  uint64_t v18 = sub_FF90();
  uint64_t v1 = *(void *)(v18 + 16);
  if (v1)
  {
    uint64_t v2 = (_OWORD *)(v0 + 16);
    swift_bridgeObjectRetain();
    uint64_t v3 = 32;
    do
    {
      long long v4 = *(_OWORD *)(v18 + v3 + 64);
      long long v5 = *(_OWORD *)(v18 + v3 + 80);
      long long v6 = *(_OWORD *)(v18 + v3 + 112);
      *(_OWORD *)(v0 + 112) = *(_OWORD *)(v18 + v3 + 96);
      *(_OWORD *)(v0 + 128) = v6;
      *(_OWORD *)(v0 + 96) = v5;
      long long v8 = *(_OWORD *)(v18 + v3 + 144);
      long long v7 = *(_OWORD *)(v18 + v3 + 160);
      long long v9 = *(_OWORD *)(v18 + v3 + 128);
      *(void *)(v0 + 192) = *(void *)(v18 + v3 + 176);
      *(_OWORD *)(v0 + 160) = v8;
      *(_OWORD *)(v0 + 176) = v7;
      *(_OWORD *)(v0 + 144) = v9;
      long long v10 = *(_OWORD *)(v18 + v3 + 48);
      long long v12 = *(_OWORD *)(v18 + v3);
      long long v11 = *(_OWORD *)(v18 + v3 + 16);
      *(_OWORD *)(v0 + 48) = *(_OWORD *)(v18 + v3 + 32);
      *(_OWORD *)(v0 + 64) = v10;
      *uint64_t v2 = v12;
      *(_OWORD *)(v0 + 32) = v11;
      *(_OWORD *)(v0 + 80) = v4;
      sub_B9C8(*(unsigned char *)(v0 + 104));
      *(void *)(swift_task_alloc() + 16) = v2;
      sub_66D0(v0 + 16);
      sub_11300();
      swift_bridgeObjectRelease();
      swift_release();
      sub_67C8(v0 + 16);
      swift_task_dealloc();
      v3 += 184;
      --v1;
    }
    while (v1);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  uint64_t v13 = type metadata accessor for AudioHintsGenerator();
  uint64_t v14 = swift_allocObject();
  *(void *)(v0 + 264) = v13;
  *(void *)(v0 + 272) = sub_6AC8(&qword_18588, 255, (void (*)(uint64_t))type metadata accessor for AudioHintsGenerator);
  *(void *)(v0 + 240) = v14;
  sub_112F0();
  swift_release();
  sub_696C(v0 + 240);
  sub_68C4(&qword_18590);
  uint64_t v15 = swift_allocObject();
  *(_OWORD *)(v15 + 16) = xmmword_118A0;
  sub_11310();
  swift_release();
  v16 = *(uint64_t (**)(uint64_t))(v0 + 8);
  return v16(v15);
}

uint64_t sub_66C8(uint64_t a1)
{
  return sub_53F8(a1, *(void *)(v1 + 16));
}

uint64_t sub_66D0(uint64_t a1)
{
  return a1;
}

uint64_t sub_67C8(uint64_t a1)
{
  return a1;
}

uint64_t sub_68C4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t *sub_6908(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_696C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_69BC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_68C4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_6A20(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_6A84(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_6AC8(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

uint64_t sub_6B10(uint64_t a1)
{
  return a1;
}

uint64_t sub_6B3C(uint64_t a1)
{
  *(void *)(v2 + 80) = a1;
  *(void *)(v2 + 88) = v1;
  return _swift_task_switch(sub_6B5C, 0, 0);
}

uint64_t sub_6B5C()
{
  uint64_t v1 = *(void *)(v0 + 88);
  sub_6A84(*(void **)(v0 + 80), *(void *)(*(void *)(v0 + 80) + 24));
  *(void *)(v0 + 96) = sub_111C0();
  *(void *)(v0 + 104) = v2;
  *(void *)(v0 + 112) = swift_getObjectType();
  *(void *)(v0 + 120) = *(void *)(v1 + 16);
  *(void *)(v0 + 128) = *(void *)(v1 + 24);
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_11490();
  return _swift_task_switch(sub_6C2C, v4, v3);
}

uint64_t sub_6C2C()
{
  sub_11370();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  return _swift_task_switch(sub_6CB4, 0, 0);
}

uint64_t sub_6CB4()
{
  uint64_t v1 = (_OWORD *)(v0 + 48);
  if (*(void *)(v0 + 72))
  {
    sub_6DD0(v1, (_OWORD *)(v0 + 16));
    sub_68C4(&qword_185D8);
    uint64_t v2 = (_OWORD *)swift_allocObject();
    v2[1] = xmmword_118A0;
    sub_6DD0((_OWORD *)(v0 + 16), v2 + 2);
  }
  else
  {
    sub_6D74((uint64_t)v1, &qword_185D0);
    uint64_t v2 = &_swiftEmptyArrayStorage;
  }
  uint64_t v3 = *(uint64_t (**)(_OWORD *))(v0 + 8);
  return v3(v2);
}

uint64_t sub_6D74(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_68C4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

_OWORD *sub_6DD0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

_WORD *initializeBufferWithCopyOfBuffer for SongNameParameterBuilder(_WORD *result, _WORD *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SongNameParameterBuilder(unsigned __int16 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 65281 <= 0xFFFEFFFF) {
    int v2 = 2;
  }
  else {
    int v2 = 4;
  }
  if (a2 + 65281 < 0xFF0000) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 16)) - 65281;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = a1[1];
      if (!a1[1]) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 16)) - 65281;
    }
    int v4 = *((unsigned __int8 *)a1 + 2);
    if (*((unsigned char *)a1 + 2)) {
      return (*a1 | (v4 << 16)) - 65281;
    }
  }
LABEL_17:
  unsigned int v6 = *((unsigned __int8 *)a1 + 1);
  BOOL v7 = v6 >= 2;
  int v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for SongNameParameterBuilder(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a3 + 65281 <= 0xFFFEFFFF) {
    int v3 = 2;
  }
  else {
    int v3 = 4;
  }
  if (a3 + 65281 < 0xFF0000) {
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
    unsigned int v6 = ((a2 - 255) >> 16) + 1;
    *(_WORD *)uint64_t result = a2 - 255;
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
        JUMPOUT(0x6F64);
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
          *(unsigned char *)(result + 1) = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for SongNameParameterBuilder()
{
  return &type metadata for SongNameParameterBuilder;
}

void sub_6F9C(void *a1@<X0>, uint64_t *a2@<X8>)
{
  self;
  uint64_t v4 = swift_dynamicCastObjCClass();
  if (!v4)
  {
    uint64_t v12 = enum case for IntentParameter.ignore(_:);
LABEL_29:
    uint64_t v25 = sub_111B0();
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v25 - 8) + 104))(a2, v12, v25);
    return;
  }
  uint64_t v5 = (void *)v4;
  id v6 = a1;
  id v7 = [v5 mediaItems];
  if (!v7)
  {
LABEL_12:
    id v11 = [v5 mediaContainer];
    if (!v11) {
      goto LABEL_24;
    }
    goto LABEL_13;
  }
  int v8 = v7;
  sub_72B8(0, &qword_185E8);
  unint64_t v9 = sub_11450();

  if (!(v9 >> 62))
  {
    if (*(void *)((char *)&dword_10 + (v9 & 0xFFFFFFFFFFFFFF8))) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_11540();
  swift_bridgeObjectRelease();
  if (!v13)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
LABEL_5:
  if ((v9 & 0xC000000000000001) != 0)
  {
    id v10 = (id)sub_11510();
    goto LABEL_8;
  }
  if (*(void *)((char *)&dword_10 + (v9 & 0xFFFFFFFFFFFFFF8)))
  {
    id v10 = *(id *)(v9 + 32);
LABEL_8:
    id v11 = v10;
    swift_bridgeObjectRelease();
LABEL_13:
    if ([v11 type] == (char *)&dword_0 + 1)
    {
      id v14 = [v11 title];
      if (v14)
      {
        uint64_t v15 = sub_113E0();
        unint64_t v17 = v16;

        id v14 = (id)(v15 & 0xFFFFFFFFFFFFLL);
      }
      else
      {
        unint64_t v17 = 0xE000000000000000;
      }
      swift_bridgeObjectRelease();
      uint64_t v18 = HIBYTE(v17) & 0xF;
      if ((v17 & 0x2000000000000000) == 0) {
        uint64_t v18 = (uint64_t)v14;
      }
      if (v18)
      {
        id v19 = [v11 title];
        if (v19)
        {
          v20 = v19;
          uint64_t v21 = sub_113E0();
          unint64_t v23 = v22;

          a2[3] = (uint64_t)&type metadata for String;
          if (v23)
          {

LABEL_27:
            *a2 = v21;
            a2[1] = v23;
            v24 = (unsigned int *)&enum case for IntentParameter.directAssignment(_:);
            goto LABEL_28;
          }
        }
        else
        {
          a2[3] = (uint64_t)&type metadata for String;
        }

        uint64_t v21 = 0;
        unint64_t v23 = 0xE000000000000000;
        goto LABEL_27;
      }
    }

LABEL_24:
    v24 = (unsigned int *)&enum case for IntentParameter.ignore(_:);
LABEL_28:
    uint64_t v12 = *v24;
    goto LABEL_29;
  }
  __break(1u);
}

uint64_t sub_7240()
{
  return *v0;
}

uint64_t sub_7248()
{
  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t sub_7250()
{
  uint64_t v0 = sub_72B8(0, &qword_185E0);
  return static SuggestionTransformers.mapINIntentValue<A>(extractor:)(sub_6F9C, 0, v0);
}

uint64_t sub_72B8(uint64_t a1, unint64_t *a2)
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

uint64_t sub_72F4@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  v10[1] = a3;
  uint64_t v5 = sub_11380();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  int v8 = (char *)v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(a1) = *(unsigned char *)(a1 + 88);
  sub_6A84(a2, a2[3]);
  sub_B9C8(a1);
  sub_BE9C((uint64_t)&_swiftEmptyArrayStorage);
  (*(void (**)(char *, void, uint64_t))(v6 + 104))(v8, enum case for Objective.discoverability(_:), v5);
  sub_112E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

char *sub_746C(void (*a1)(long long *__return_ptr, long long *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a3 + 16);
  if (!v4) {
    return (char *)&_swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRetain();
  long long v7 = *(_OWORD *)(a3 + 176);
  long long v45 = *(_OWORD *)(a3 + 160);
  long long v46 = v7;
  long long v47 = *(_OWORD *)(a3 + 192);
  uint64_t v48 = *(void *)(a3 + 208);
  long long v8 = *(_OWORD *)(a3 + 112);
  long long v41 = *(_OWORD *)(a3 + 96);
  long long v42 = v8;
  long long v9 = *(_OWORD *)(a3 + 144);
  long long v43 = *(_OWORD *)(a3 + 128);
  long long v44 = v9;
  long long v10 = *(_OWORD *)(a3 + 48);
  long long v37 = *(_OWORD *)(a3 + 32);
  long long v38 = v10;
  long long v11 = *(_OWORD *)(a3 + 80);
  long long v39 = *(_OWORD *)(a3 + 64);
  long long v40 = v11;
  long long v33 = v45;
  long long v34 = v46;
  long long v35 = v47;
  uint64_t v36 = v48;
  long long v29 = v41;
  long long v30 = v42;
  long long v31 = v43;
  long long v32 = v44;
  long long v25 = v37;
  long long v26 = v38;
  long long v27 = v39;
  long long v28 = v11;
  sub_66D0((uint64_t)&v37);
  a1(&v22, &v25);
  uint64_t v12 = (char *)&_swiftEmptyArrayStorage;
  if (!v3)
  {
    for (uint64_t i = 216; ; i += 184)
    {
      sub_67C8((uint64_t)&v37);
      if (v23)
      {
        sub_8B88(&v22, (uint64_t)v24);
        sub_8B88(v24, (uint64_t)&v22);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v12 = sub_7890(0, *((void *)v12 + 2) + 1, 1, v12);
        }
        unint64_t v15 = *((void *)v12 + 2);
        unint64_t v14 = *((void *)v12 + 3);
        if (v15 >= v14 >> 1) {
          uint64_t v12 = sub_7890((char *)(v14 > 1), v15 + 1, 1, v12);
        }
        *((void *)v12 + 2) = v15 + 1;
        sub_8B88(&v22, (uint64_t)&v12[40 * v15 + 32]);
        if (!--v4)
        {
LABEL_15:
          swift_bridgeObjectRelease();
          return v12;
        }
      }
      else
      {
        sub_8B28((uint64_t)&v22);
        if (!--v4) {
          goto LABEL_15;
        }
      }
      long long v16 = *(_OWORD *)(a3 + i + 144);
      long long v45 = *(_OWORD *)(a3 + i + 128);
      long long v46 = v16;
      long long v47 = *(_OWORD *)(a3 + i + 160);
      uint64_t v48 = *(void *)(a3 + i + 176);
      long long v17 = *(_OWORD *)(a3 + i + 80);
      long long v41 = *(_OWORD *)(a3 + i + 64);
      long long v42 = v17;
      long long v18 = *(_OWORD *)(a3 + i + 112);
      long long v43 = *(_OWORD *)(a3 + i + 96);
      long long v44 = v18;
      long long v19 = *(_OWORD *)(a3 + i + 16);
      long long v37 = *(_OWORD *)(a3 + i);
      long long v38 = v19;
      long long v20 = *(_OWORD *)(a3 + i + 48);
      long long v39 = *(_OWORD *)(a3 + i + 32);
      long long v40 = v20;
      long long v33 = v45;
      long long v34 = v46;
      long long v35 = v47;
      uint64_t v36 = v48;
      long long v29 = v41;
      long long v30 = v42;
      long long v31 = v43;
      long long v32 = v44;
      long long v25 = v37;
      long long v26 = v38;
      long long v27 = v39;
      long long v28 = v20;
      sub_66D0((uint64_t)&v37);
      a1(&v22, &v25);
    }
  }
  sub_67C8((uint64_t)&v37);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t type metadata accessor for AudioHintsGenerator()
{
  return self;
}

uint64_t sub_7728(uint64_t a1, uint64_t a2, uint64_t a3)
{
  long long v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_186A0 + dword_186A0);
  long long v7 = (void *)swift_task_alloc();
  *(void *)(v3 + 16) = v7;
  *long long v7 = v3;
  v7[1] = sub_5F74;
  return v9(a1, a2, a3);
}

uint64_t sub_77E8()
{
  return sub_7850((unint64_t *)&unk_18688);
}

uint64_t sub_781C()
{
  return sub_7850(&qword_18698);
}

uint64_t sub_7850(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for AudioHintsGenerator();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

char *sub_7890(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
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
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_68C4(&qword_186D0);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
      uint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[40 * v8 + 32]) {
          memmove(v12, a4 + 32, 40 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v12 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result) {
        goto LABEL_13;
      }
    }
    sub_81B8(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_79B4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_7A88(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_8AC8((uint64_t)v12, *a3);
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
      sub_8AC8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_696C((uint64_t)v12);
  return v7;
}

uint64_t sub_7A88(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_114E0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_7C44(a5, a6);
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
  uint64_t v8 = sub_11520();
  if (!v8)
  {
    sub_11530();
    __break(1u);
LABEL_17:
    uint64_t result = sub_11560();
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

uint64_t sub_7C44(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_7CDC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_7EBC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_7EBC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_7CDC(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_7E54(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_11500();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_11530();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_11420();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_11560();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_11530();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_7E54(uint64_t a1, uint64_t a2)
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
  sub_68C4(&qword_186B8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_7EBC(char a1, int64_t a2, char a3, char *a4)
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
    sub_68C4(&qword_186B8);
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
  uint64_t result = sub_11560();
  __break(1u);
  return result;
}

uint64_t sub_800C(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_802C(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_802C(char a1, int64_t a2, char a3, char *a4)
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_68C4(&qword_186C0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 184);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[184 * v8]) {
      memmove(v12, v13, 184 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[184 * v8] || v12 >= &v13[184 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_11560();
  __break(1u);
  return result;
}

uint64_t sub_81B8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      sub_68C4(&qword_186D8);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_11560();
  __break(1u);
  return result;
}

uint64_t sub_82C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(v3 + 272) = a1;
  *(void *)(v3 + 280) = a3;
  return _swift_task_switch(sub_82E8, 0, 0);
}

uint64_t sub_82E8()
{
  uint64_t v62 = v0;
  uint64_t v1 = *(void **)(v0 + 272);
  sub_6A84(v1, v1[3]);
  uint64_t v2 = sub_11180();
  if (!v3) {
    goto LABEL_7;
  }
  if (v2 == 0x6964654D79616C50 && v3 == 0xE900000000000061)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v5 = sub_11580();
    swift_bridgeObjectRelease();
    if ((v5 & 1) == 0)
    {
LABEL_7:
      if (qword_18328 != -1) {
        swift_once();
      }
      uint64_t v6 = sub_113C0();
      sub_8A0C(v6, (uint64_t)static Logger.audio);
      int64_t v7 = sub_113A0();
      os_log_type_t v8 = sub_114C0();
      if (!os_log_type_enabled(v7, v8)) {
        goto LABEL_20;
      }
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      uint64_t v10 = "AudioHintsGenerator#generateCandidateSuggestions Received an Interaction which was not PlayMedia interaction"
            ". Not returning any suggestions.";
      goto LABEL_19;
    }
  }
  sub_6A84(*(void **)(v0 + 272), v1[3]);
  uint64_t v11 = sub_11170();
  sub_9D38(v11, v0 + 200);
  if (qword_18328 != -1) {
    swift_once();
  }
  uint64_t v12 = (long long *)(v0 + 16);
  uint64_t v13 = (uint64_t *)(v0 + 240);
  uint64_t v14 = sub_113C0();
  sub_8A0C(v14, (uint64_t)static Logger.audio);
  unint64_t v15 = sub_113A0();
  os_log_type_t v16 = sub_114B0();
  if (os_log_type_enabled(v15, v16))
  {
    long long v17 = (uint8_t *)swift_slowAlloc();
    v61 = (void *)swift_slowAlloc();
    *(_DWORD *)long long v17 = 136315138;
    sub_995C();
    sub_68C4(&qword_186B0);
    uint64_t v18 = sub_113D0();
    unint64_t v20 = v19;
    swift_bridgeObjectRelease();
    *(void *)(v0 + 16) = sub_79B4(v18, v20, (uint64_t *)&v61);
    sub_114D0();
    uint64_t v13 = (uint64_t *)(v0 + 240);
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v15, v16, "AudioHintsGenerator#generateCandidateSuggestions Received execution parameters:%s", v17, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  sub_8A44(v0 + 208, v0 + 256);
  sub_8A44(v0 + 256, (uint64_t)v13);
  if (*(unsigned char *)(v0 + 248))
  {
    int64_t v7 = sub_113A0();
    os_log_type_t v8 = sub_114C0();
    if (!os_log_type_enabled(v7, v8))
    {
LABEL_20:

      uint64_t v21 = (char *)&_swiftEmptyArrayStorage;
      goto LABEL_40;
    }
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    uint64_t v10 = "AudioHintsGenerator#generateCandidateSuggestions Failed to resolve a MediaItemType on the interaction. Not ret"
          "urning any suggestions.";
LABEL_19:
    _os_log_impl(&dword_0, v7, v8, v10, v9, 2u);
    swift_slowDealloc();
    goto LABEL_20;
  }
  uint64_t v22 = *v13;
  uint64_t v23 = sub_10B44(v22);
  v24 = sub_113A0();
  os_log_type_t v25 = sub_114B0();
  if (os_log_type_enabled(v24, v25))
  {
    uint64_t v26 = swift_slowAlloc();
    *(_DWORD *)uint64_t v26 = 134218240;
    *(void *)(v0 + 16) = v23[2];
    sub_114D0();
    *(_WORD *)(v26 + 12) = 2048;
    *(void *)(v0 + 16) = v22;
    sub_114D0();
    _os_log_impl(&dword_0, v24, v25, "AudioHintsGenerator#generateCandidateSuggestions Found %ld candidates which are enabled for INMediaItemType: %ld", (uint8_t *)v26, 0x16u);
    swift_slowDealloc();
  }

  uint64_t v27 = v23[2];
  if (v27)
  {
    uint64_t v28 = v27 - 1;
    long long v29 = &_swiftEmptyArrayStorage;
    for (uint64_t i = 4; ; i += 23)
    {
      long long v31 = *(_OWORD *)&v23[i];
      long long v32 = *(_OWORD *)&v23[i + 2];
      long long v33 = *(_OWORD *)&v23[i + 6];
      *(_OWORD *)(v0 + 48) = *(_OWORD *)&v23[i + 4];
      *(_OWORD *)(v0 + 64) = v33;
      *uint64_t v12 = v31;
      *(_OWORD *)(v0 + 32) = v32;
      long long v34 = *(_OWORD *)&v23[i + 8];
      long long v35 = *(_OWORD *)&v23[i + 10];
      long long v36 = *(_OWORD *)&v23[i + 14];
      *(_OWORD *)(v0 + 112) = *(_OWORD *)&v23[i + 12];
      *(_OWORD *)(v0 + 128) = v36;
      *(_OWORD *)(v0 + 80) = v34;
      *(_OWORD *)(v0 + 96) = v35;
      long long v37 = *(_OWORD *)&v23[i + 16];
      long long v38 = *(_OWORD *)&v23[i + 18];
      long long v39 = *(_OWORD *)&v23[i + 20];
      *(void *)(v0 + 192) = v23[i + 22];
      *(_OWORD *)(v0 + 160) = v38;
      *(_OWORD *)(v0 + 176) = v39;
      *(_OWORD *)(v0 + 144) = v37;
      long long v40 = *(uint64_t (**)(uint64_t))(v0 + 152);
      sub_66D0(v0 + 16);
      if (v40(v0 + 200))
      {
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v61 = v29;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_800C(0, v29[2] + 1, 1);
          long long v29 = v61;
        }
        unint64_t v43 = v29[2];
        unint64_t v42 = v29[3];
        if (v43 >= v42 >> 1)
        {
          sub_800C(v42 > 1, v43 + 1, 1);
          long long v29 = v61;
        }
        v29[2] = v43 + 1;
        long long v44 = (char *)&v29[23 * v43];
        long long v45 = *v12;
        long long v46 = *(_OWORD *)(v0 + 32);
        long long v47 = *(_OWORD *)(v0 + 64);
        *((_OWORD *)v44 + 4) = *(_OWORD *)(v0 + 48);
        *((_OWORD *)v44 + 5) = v47;
        *((_OWORD *)v44 + 2) = v45;
        *((_OWORD *)v44 + 3) = v46;
        long long v48 = *(_OWORD *)(v0 + 80);
        long long v49 = *(_OWORD *)(v0 + 96);
        long long v50 = *(_OWORD *)(v0 + 128);
        *((_OWORD *)v44 + 8) = *(_OWORD *)(v0 + 112);
        *((_OWORD *)v44 + 9) = v50;
        *((_OWORD *)v44 + 6) = v48;
        *((_OWORD *)v44 + 7) = v49;
        long long v51 = *(_OWORD *)(v0 + 144);
        long long v52 = *(_OWORD *)(v0 + 160);
        long long v53 = *(_OWORD *)(v0 + 176);
        *((void *)v44 + 26) = *(void *)(v0 + 192);
        *((_OWORD *)v44 + 11) = v52;
        *((_OWORD *)v44 + 12) = v53;
        *((_OWORD *)v44 + 10) = v51;
        if (!v28)
        {
LABEL_34:
          swift_bridgeObjectRelease();
          goto LABEL_36;
        }
      }
      else
      {
        sub_67C8(v0 + 16);
        if (!v28) {
          goto LABEL_34;
        }
      }
      --v28;
    }
  }
  swift_bridgeObjectRelease();
  long long v29 = &_swiftEmptyArrayStorage;
LABEL_36:
  swift_retain();
  v54 = sub_113A0();
  os_log_type_t v55 = sub_114B0();
  if (os_log_type_enabled(v54, v55))
  {
    v56 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v56 = 134217984;
    *(void *)(v0 + 16) = v29[2];
    sub_114D0();
    swift_release();
    _os_log_impl(&dword_0, v54, v55, "AudioHintsGenerator#generateCandidateSuggestions Returning %ld candidates which are qualified for the current interaction.", v56, 0xCu);
    swift_slowDealloc();
  }
  else
  {
    swift_release();
  }

  uint64_t v57 = *(void *)(v0 + 280);
  uint64_t v58 = swift_task_alloc();
  *(void *)(v58 + 16) = v57;
  uint64_t v21 = sub_746C((void (*)(long long *__return_ptr, long long *))sub_8AAC, v58, (uint64_t)v29);
  swift_release();
  swift_task_dealloc();
LABEL_40:
  v59 = *(uint64_t (**)(char *))(v0 + 8);
  return v59(v21);
}

uint64_t sub_8A0C(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_8A44(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_68C4(&qword_186A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_8AAC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return sub_72F4(a1, *(void **)(v2 + 16), a2);
}

uint64_t sub_8AC8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_8B28(uint64_t a1)
{
  uint64_t v2 = sub_68C4(&qword_186C8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_8B88(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t storeEnumTagSinglePayload for PodcastNameParameterBuilder(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a3 + 65281 <= 0xFFFEFFFF) {
    int v3 = 2;
  }
  else {
    int v3 = 4;
  }
  if (a3 + 65281 < 0xFF0000) {
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
    unsigned int v6 = ((a2 - 255) >> 16) + 1;
    *(_WORD *)uint64_t result = a2 - 255;
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
        JUMPOUT(0x8C6CLL);
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
          *(unsigned char *)(result + 1) = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PodcastNameParameterBuilder()
{
  return &type metadata for PodcastNameParameterBuilder;
}

void sub_8CA4(void *a1@<X0>, uint64_t *a2@<X8>)
{
  self;
  uint64_t v4 = swift_dynamicCastObjCClass();
  if (!v4)
  {
    uint64_t v14 = enum case for IntentParameter.ignore(_:);
LABEL_44:
    uint64_t v36 = sub_111B0();
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v36 - 8) + 104))(a2, v14, v36);
    return;
  }
  uint64_t v5 = (void *)v4;
  id v6 = a1;
  id v7 = [v5 mediaContainer];
  if (v7)
  {
    os_log_type_t v8 = v7;
    if ([v7 type] == (char *)&dword_4 + 2)
    {
      id v9 = [v8 title];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = sub_113E0();
        unint64_t v13 = v12;
      }
      else
      {
        uint64_t v11 = 0;
        unint64_t v13 = 0xE000000000000000;
      }
      swift_bridgeObjectRelease();
      uint64_t v15 = HIBYTE(v13) & 0xF;
      if ((v13 & 0x2000000000000000) == 0) {
        uint64_t v15 = v11 & 0xFFFFFFFFFFFFLL;
      }
      if (v15)
      {
        id v16 = [v8 title];
        if (v16)
        {
          long long v17 = v16;
          uint64_t v18 = sub_113E0();
          unint64_t v20 = v19;

          a2[3] = (uint64_t)&type metadata for String;
          if (v20)
          {

LABEL_39:
            *a2 = v18;
            a2[1] = v20;
            long long v34 = (unsigned int *)&enum case for IntentParameter.directAssignment(_:);
LABEL_43:
            uint64_t v14 = *v34;
            goto LABEL_44;
          }
        }
        else
        {
          a2[3] = (uint64_t)&type metadata for String;
        }

        goto LABEL_38;
      }
    }
  }
  id v21 = [v5 mediaItems];
  if (!v21) {
    goto LABEL_33;
  }
  uint64_t v22 = v21;
  sub_72B8(0, &qword_185E8);
  unint64_t v23 = sub_11450();

  if (!(v23 >> 62))
  {
    if (*(void *)((char *)&dword_10 + (v23 & 0xFFFFFFFFFFFFFF8))) {
      goto LABEL_18;
    }
LABEL_41:

    swift_bridgeObjectRelease();
    goto LABEL_42;
  }
  swift_bridgeObjectRetain();
  uint64_t v35 = sub_11540();
  swift_bridgeObjectRelease();
  if (!v35) {
    goto LABEL_41;
  }
LABEL_18:
  if ((v23 & 0xC000000000000001) != 0)
  {
    id v24 = (id)sub_11510();
    goto LABEL_21;
  }
  if (*(void *)((char *)&dword_10 + (v23 & 0xFFFFFFFFFFFFFF8)))
  {
    id v24 = *(id *)(v23 + 32);
LABEL_21:
    os_log_type_t v25 = v24;
    swift_bridgeObjectRelease();
    if ([v25 type] == (char *)&dword_4 + 3 || objc_msgSend(v25, "type") == (char *)&dword_4 + 2)
    {
      id v26 = [v25 artist];
      if (v26)
      {
        uint64_t v27 = sub_113E0();
        unint64_t v29 = v28;

        id v26 = (id)(v27 & 0xFFFFFFFFFFFFLL);
      }
      else
      {
        unint64_t v29 = 0xE000000000000000;
      }
      swift_bridgeObjectRelease();
      uint64_t v30 = HIBYTE(v29) & 0xF;
      if ((v29 & 0x2000000000000000) == 0) {
        uint64_t v30 = (uint64_t)v26;
      }
      if (v30)
      {
        id v31 = [v25 artist];
        if (v31)
        {
          long long v32 = v31;
          uint64_t v18 = sub_113E0();
          unint64_t v20 = v33;

          a2[3] = (uint64_t)&type metadata for String;
          if (v20)
          {

            goto LABEL_39;
          }
        }
        else
        {
          a2[3] = (uint64_t)&type metadata for String;
        }

LABEL_38:
        uint64_t v18 = 0;
        unint64_t v20 = 0xE000000000000000;
        goto LABEL_39;
      }
    }

LABEL_33:
LABEL_42:
    long long v34 = (unsigned int *)&enum case for IntentParameter.ignore(_:);
    goto LABEL_43;
  }
  __break(1u);
}

uint64_t sub_9038()
{
  uint64_t v0 = sub_72B8(0, &qword_185E0);
  return static SuggestionTransformers.mapINIntentValue<A>(extractor:)(sub_8CA4, 0, v0);
}

void sub_90A0(void *a1@<X0>, uint64_t *a2@<X8>)
{
  self;
  uint64_t v4 = swift_dynamicCastObjCClass();
  if (!v4)
  {
    uint64_t v12 = enum case for IntentParameter.ignore(_:);
LABEL_44:
    uint64_t v40 = sub_111B0();
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v40 - 8) + 104))(a2, v12, v40);
    return;
  }
  uint64_t v5 = (void *)v4;
  id v6 = a1;
  id v7 = [v5 mediaItems];
  if (!v7)
  {
LABEL_12:
    id v11 = [v5 mediaContainer];
    if (!v11) {
      goto LABEL_42;
    }
    goto LABEL_13;
  }
  os_log_type_t v8 = v7;
  sub_72B8(0, &qword_185E8);
  unint64_t v9 = sub_11450();

  if (!(v9 >> 62))
  {
    if (*(void *)((char *)&dword_10 + (v9 & 0xFFFFFFFFFFFFFF8))) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_11540();
  swift_bridgeObjectRelease();
  if (!v13)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
LABEL_5:
  if ((v9 & 0xC000000000000001) != 0)
  {
    id v10 = (id)sub_11510();
    goto LABEL_8;
  }
  if (*(void *)((char *)&dword_10 + (v9 & 0xFFFFFFFFFFFFFF8)))
  {
    id v10 = *(id *)(v9 + 32);
LABEL_8:
    id v11 = v10;
    swift_bridgeObjectRelease();
LABEL_13:
    if ([v11 type] == (char *)&dword_0 + 1)
    {
      id v14 = [v11 artist];
      if (v14)
      {
        uint64_t v15 = sub_113E0();
        unint64_t v17 = v16;

        id v14 = (id)(v15 & 0xFFFFFFFFFFFFLL);
      }
      else
      {
        unint64_t v17 = 0xE000000000000000;
      }
      swift_bridgeObjectRelease();
      uint64_t v18 = HIBYTE(v17) & 0xF;
      if ((v17 & 0x2000000000000000) == 0) {
        uint64_t v18 = (uint64_t)v14;
      }
      if (v18) {
        goto LABEL_27;
      }
    }
    if ([v11 type] == (char *)&dword_0 + 3)
    {
      id v19 = [v11 title];
      if (v19)
      {
        uint64_t v20 = sub_113E0();
        unint64_t v22 = v21;

        id v19 = (id)(v20 & 0xFFFFFFFFFFFFLL);
      }
      else
      {
        unint64_t v22 = 0xE000000000000000;
      }
      swift_bridgeObjectRelease();
      uint64_t v23 = HIBYTE(v22) & 0xF;
      if ((v22 & 0x2000000000000000) == 0) {
        uint64_t v23 = (uint64_t)v19;
      }
      if (v23)
      {
LABEL_27:
        id v24 = [v11 artist];
        if (v24)
        {
LABEL_28:
          os_log_type_t v25 = v24;
          uint64_t v26 = sub_113E0();
          uint64_t v28 = v27;

LABEL_40:
          a2[3] = sub_68C4(&qword_185B0);

          *a2 = v26;
          a2[1] = v28;
          long long v39 = (unsigned int *)&enum case for IntentParameter.directAssignment(_:);
LABEL_43:
          uint64_t v12 = *v39;
          goto LABEL_44;
        }
LABEL_39:
        uint64_t v26 = 0;
        uint64_t v28 = 0;
        goto LABEL_40;
      }
    }
    if ([v11 type] == &dword_10)
    {
      id v29 = [v11 title];
      if (v29)
      {
        uint64_t v30 = sub_113E0();
        unint64_t v32 = v31;

        id v29 = (id)(v30 & 0xFFFFFFFFFFFFLL);
      }
      else
      {
        unint64_t v32 = 0xE000000000000000;
      }
      swift_bridgeObjectRelease();
      uint64_t v33 = HIBYTE(v32) & 0xF;
      if ((v32 & 0x2000000000000000) == 0) {
        uint64_t v33 = (uint64_t)v29;
      }
      if (v33)
      {
        id v34 = [v11 identifier];
        if (v34)
        {
          uint64_t v35 = v34;
          uint64_t v36 = sub_113E0();
          uint64_t v38 = v37;

          sub_9620();
          LOBYTE(v35) = sub_114F0();
          swift_bridgeObjectRelease();
          if (v35)
          {
            id v24 = objc_msgSend(v11, "title", 0xD000000000000018, 0x8000000000012560, v36, v38);
            if (v24) {
              goto LABEL_28;
            }
            goto LABEL_39;
          }
        }
      }
    }

LABEL_42:
    long long v39 = (unsigned int *)&enum case for IntentParameter.ignore(_:);
    goto LABEL_43;
  }
  __break(1u);
}

uint64_t sub_94B4()
{
  uint64_t v0 = sub_72B8(0, &qword_185E0);
  return static SuggestionTransformers.mapINIntentValue<A>(extractor:)(sub_90A0, 0, v0);
}

uint64_t storeEnumTagSinglePayload for ArtistNameParameterBuilder(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a3 + 65281 <= 0xFFFEFFFF) {
    int v3 = 2;
  }
  else {
    int v3 = 4;
  }
  if (a3 + 65281 < 0xFF0000) {
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
    unsigned int v6 = ((a2 - 255) >> 16) + 1;
    *(_WORD *)uint64_t result = a2 - 255;
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
        JUMPOUT(0x95E8);
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
          *(unsigned char *)(result + 1) = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ArtistNameParameterBuilder()
{
  return &type metadata for ArtistNameParameterBuilder;
}

unint64_t sub_9620()
{
  unint64_t result = qword_186E0;
  if (!qword_186E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_186E0);
  }
  return result;
}

uint64_t Logger.audio.unsafeMutableAddressor()
{
  if (qword_18328 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_113C0();
  return sub_8A0C(v0, (uint64_t)static Logger.audio);
}

uint64_t sub_96D8()
{
  uint64_t v0 = sub_113C0();
  sub_9804(v0, static Logger.audio);
  sub_8A0C(v0, (uint64_t)static Logger.audio);
  return sub_113B0();
}

uint64_t static Logger.audio.getter@<X0>(uint64_t a1@<X8>)
{
  if (qword_18328 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_113C0();
  uint64_t v3 = sub_8A0C(v2, (uint64_t)static Logger.audio);
  unsigned int v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 16);
  return v4(a1, v3, v2);
}

uint64_t *sub_9804(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t initializeBufferWithCopyOfBuffer for AudioSuggestionsExecutionParameters(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 initializeWithCopy for AudioSuggestionsExecutionParameters(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_WORD *)(a1 + 32) = *(_WORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for AudioSuggestionsExecutionParameters(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 34)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 33);
  BOOL v4 = v3 >= 2;
  int v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4) {
    int v5 = -1;
  }
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for AudioSuggestionsExecutionParameters(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(_WORD *)(result + 32) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 34) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 34) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 33) = a2 + 1;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AudioSuggestionsExecutionParameters()
{
  return &type metadata for AudioSuggestionsExecutionParameters;
}

unint64_t sub_995C()
{
  sub_68C4(&qword_186E8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_11CE0;
  strcpy((char *)(inited + 32), "songIsDisliked");
  *(unsigned char *)(inited + 47) = -18;
  sub_69BC(v0, (uint64_t)&v16, &qword_186F0);
  uint64_t v2 = sub_68C4(&qword_186F0);
  *(void *)(inited + 72) = v2;
  uint64_t v3 = sub_9CD8(&qword_186F8, &qword_186F0);
  *(void *)(inited + 80) = v3;
  uint64_t v4 = sub_9CD8(&qword_18700, &qword_186F0);
  *(void *)(inited + 88) = v4;
  sub_69BC((uint64_t)&v16, inited + 48, &qword_186F0);
  *(void *)(inited + 96) = 0x694C7349676E6F73;
  *(void *)(inited + 104) = 0xEB0000000064656BLL;
  sub_69BC(v0 + 1, (uint64_t)&v15, &qword_186F0);
  *(void *)(inited + 136) = v2;
  *(void *)(inited + 144) = v3;
  *(void *)(inited + 152) = v4;
  sub_69BC((uint64_t)&v15, inited + 112, &qword_186F0);
  strcpy((char *)(inited + 160), "mediaItemType");
  *(_WORD *)(inited + 174) = -4864;
  uint64_t v5 = sub_68C4(&qword_18708);
  *(void *)(inited + 200) = v5;
  uint64_t v6 = sub_9CD8(&qword_18710, &qword_18708);
  *(void *)(inited + 208) = v6;
  uint64_t v7 = sub_9CD8(&qword_18718, &qword_18708);
  *(void *)(inited + 216) = v7;
  sub_69BC(v0 + 8, (uint64_t)v14, &qword_186A8);
  sub_69BC((uint64_t)v14, (uint64_t)&v17, &qword_186A8);
  char v8 = v18;
  uint64_t v9 = v17;
  if (v18) {
    uint64_t v9 = 0;
  }
  *(void *)(inited + 176) = v9;
  *(unsigned char *)(inited + 184) = v8;
  *(void *)(inited + 224) = 0xD000000000000016;
  *(void *)(inited + 232) = 0x80000000000125A0;
  sub_69BC(v0 + 17, (uint64_t)&v13, &qword_186F0);
  *(void *)(inited + 264) = v2;
  *(void *)(inited + 272) = v3;
  *(void *)(inited + 280) = v4;
  sub_69BC((uint64_t)&v13, inited + 240, &qword_186F0);
  *(void *)(inited + 288) = 0x6E654C6575657571;
  *(void *)(inited + 296) = 0xEB00000000687467;
  sub_69BC(v0 + 24, (uint64_t)v12, &qword_18708);
  *(void *)(inited + 328) = v5;
  *(void *)(inited + 336) = v6;
  *(void *)(inited + 344) = v7;
  sub_69BC((uint64_t)v12, inited + 304, &qword_18708);
  *(void *)(inited + 352) = 0xD000000000000016;
  *(void *)(inited + 360) = 0x80000000000125C0;
  char v10 = *(unsigned char *)(v0 + 33);
  *(void *)(inited + 392) = &type metadata for Bool;
  *(void *)(inited + 400) = &protocol witness table for Bool;
  *(void *)(inited + 408) = &protocol witness table for Bool;
  *(unsigned char *)(inited + 368) = v10;
  return sub_BD58(inited);
}

uint64_t sub_9C90(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_9CD8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_9C90(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_9D38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (!*(void *)(a1 + 16))
  {
    char v5 = 2;
    goto LABEL_19;
  }
  unint64_t v4 = sub_F950(0x69447349676E6F73, 0xEE0064656B696C73);
  char v5 = 2;
  if (v6)
  {
    sub_A144(*(void *)(a1 + 56) + 48 * v4, (uint64_t)&v27);
    sub_68C4(&qword_186B0);
    if (swift_dynamicCast()) {
      char v5 = v26;
    }
    else {
      char v5 = 2;
    }
  }
  if (!*(void *)(a1 + 16))
  {
LABEL_19:
    char v8 = 2;
    char v11 = 2;
    if (!*(void *)(a1 + 16)) {
      goto LABEL_25;
    }
    goto LABEL_20;
  }
  unint64_t v7 = sub_F950(0x694C7349676E6F73, 0xEB0000000064656BLL);
  char v8 = 2;
  if (v9)
  {
    sub_A144(*(void *)(a1 + 56) + 48 * v7, (uint64_t)&v27);
    sub_68C4(&qword_186B0);
    if (swift_dynamicCast()) {
      char v8 = v26;
    }
    else {
      char v8 = 2;
    }
  }
  if (!*(void *)(a1 + 16))
  {
    char v11 = 2;
    goto LABEL_25;
  }
  unint64_t v10 = sub_F950(0xD000000000000016, 0x80000000000125A0);
  char v11 = 2;
  if (v12)
  {
    sub_A144(*(void *)(a1 + 56) + 48 * v10, (uint64_t)&v27);
    sub_68C4(&qword_186B0);
    if (swift_dynamicCast()) {
      char v11 = v26;
    }
    else {
      char v11 = 2;
    }
  }
  if (!*(void *)(a1 + 16))
  {
LABEL_25:
    uint64_t v16 = 0;
    char v15 = 1;
    if (*(void *)(a1 + 16)) {
      goto LABEL_26;
    }
LABEL_23:
    uint64_t v17 = 0;
    char v18 = 1;
    goto LABEL_35;
  }
LABEL_20:
  unint64_t v13 = sub_F950(0x657449616964656DLL, 0xED0000657079546DLL);
  if ((v14 & 1) == 0) {
    goto LABEL_25;
  }
  sub_A144(*(void *)(a1 + 56) + 48 * v13, (uint64_t)&v27);
  sub_68C4(&qword_186B0);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_25;
  }
  char v15 = 0;
  uint64_t v16 = v26;
  if (!*(void *)(a1 + 16)) {
    goto LABEL_23;
  }
LABEL_26:
  unint64_t v19 = sub_F950(0x6E654C6575657571, 0xEB00000000687467);
  if (v20)
  {
    sub_A144(*(void *)(a1 + 56) + 48 * v19, (uint64_t)&v27);
    sub_68C4(&qword_186B0);
    int v21 = swift_dynamicCast();
    if (v21) {
      uint64_t v17 = v26;
    }
    else {
      uint64_t v17 = 0;
    }
    char v18 = v21 ^ 1;
    if (!*(void *)(a1 + 16)) {
      goto LABEL_35;
    }
  }
  else
  {
    uint64_t v17 = 0;
    char v18 = 1;
    if (!*(void *)(a1 + 16)) {
      goto LABEL_35;
    }
  }
  unint64_t v22 = sub_F950(0xD000000000000016, 0x80000000000125C0);
  if (v23)
  {
    sub_A144(*(void *)(a1 + 56) + 48 * v22, (uint64_t)&v27);
    goto LABEL_36;
  }
LABEL_35:
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
LABEL_36:
  swift_bridgeObjectRelease();
  if (!*((void *)&v28 + 1))
  {
    uint64_t result = sub_A0E4((uint64_t)&v27);
    goto LABEL_40;
  }
  sub_68C4(&qword_186B0);
  uint64_t result = swift_dynamicCast();
  if (!result)
  {
LABEL_40:
    char v25 = 0;
    goto LABEL_41;
  }
  char v25 = v26;
LABEL_41:
  *(unsigned char *)a2 = v5;
  *(unsigned char *)(a2 + 1) = v8;
  *(void *)(a2 + 8) = v16;
  *(unsigned char *)(a2 + 16) = v15;
  *(unsigned char *)(a2 + 17) = v11;
  *(void *)(a2 + 24) = v17;
  *(unsigned char *)(a2 + 32) = v18;
  *(unsigned char *)(a2 + 33) = v25;
  return result;
}

uint64_t sub_A0E4(uint64_t a1)
{
  uint64_t v2 = sub_68C4(&qword_18720);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_A144(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t storeEnumTagSinglePayload for PlaylistNameParameterBuilder(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a3 + 65281 <= 0xFFFEFFFF) {
    int v3 = 2;
  }
  else {
    int v3 = 4;
  }
  if (a3 + 65281 < 0xFF0000) {
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
    unsigned int v6 = ((a2 - 255) >> 16) + 1;
    *(_WORD *)uint64_t result = a2 - 255;
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
        JUMPOUT(0xA274);
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
          *(unsigned char *)(result + 1) = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PlaylistNameParameterBuilder()
{
  return &type metadata for PlaylistNameParameterBuilder;
}

void sub_A2AC(void *a1@<X0>, uint64_t *a2@<X8>)
{
  self;
  uint64_t v4 = swift_dynamicCastObjCClass();
  if (!v4) {
    goto LABEL_58;
  }
  uint64_t v5 = (void *)v4;
  id v6 = a1;
  id v7 = [v5 mediaContainer];
  if (v7) {
    goto LABEL_3;
  }
  id v12 = [v5 mediaItems];
  if (!v12)
  {

    goto LABEL_58;
  }
  unint64_t v13 = v12;
  sub_72B8(0, &qword_185E8);
  unint64_t v14 = sub_11450();

  if (!(v14 >> 62))
  {
    if (*(void *)((char *)&dword_10 + (v14 & 0xFFFFFFFFFFFFFF8))) {
      goto LABEL_9;
    }
LABEL_57:

    swift_bridgeObjectRelease();
    goto LABEL_58;
  }
  swift_bridgeObjectRetain();
  uint64_t v38 = sub_11540();
  swift_bridgeObjectRelease();
  if (!v38) {
    goto LABEL_57;
  }
LABEL_9:
  if ((v14 & 0xC000000000000001) != 0)
  {
    id v15 = (id)sub_11510();
    goto LABEL_12;
  }
  if (*(void *)((char *)&dword_10 + (v14 & 0xFFFFFFFFFFFFFF8)))
  {
    id v15 = *(id *)(v14 + 32);
LABEL_12:
    id v7 = v15;
    swift_bridgeObjectRelease();
    if ([v7 type] != (char *)&dword_4 + 1) {
      goto LABEL_19;
    }
LABEL_3:
    id v8 = [v7 title];
    if (v8)
    {
      uint64_t v9 = sub_113E0();
      unint64_t v11 = v10;

      id v8 = (id)(v9 & 0xFFFFFFFFFFFFLL);
    }
    else
    {
      unint64_t v11 = 0xE000000000000000;
    }
    swift_bridgeObjectRelease();
    uint64_t v16 = HIBYTE(v11) & 0xF;
    if ((v11 & 0x2000000000000000) == 0) {
      uint64_t v16 = (uint64_t)v8;
    }
    if (v16)
    {
      id v17 = [v7 title];
      if (v17)
      {
        char v18 = v17;
        uint64_t v41 = sub_113E0();
        long long v44 = v19;
      }
      else
      {
        uint64_t v41 = 0;
        long long v44 = (void *)0xE000000000000000;
      }
      id v20 = [v7 identifier];
      if (v20)
      {
        int v21 = v20;
        sub_113E0();

        sub_9620();
        LOBYTE(v21) = sub_114F0();
        swift_bridgeObjectRelease();
        if (v21)
        {
          unint64_t v22 = (unint64_t)v44;
          if (v41 == 0x657469726F766146 && v44 == (void *)0xED000078694D2073 || (sub_11580() & 1) != 0)
          {
            uint64_t v42 = 2128237;
            unint64_t v43 = 0xE300000000000000;
            v23._countAndFlagsBits = v41;
            v23._object = v44;
LABEL_28:
            sub_11410(v23);
            swift_bridgeObjectRelease();
            uint64_t v24 = v42;
            unint64_t v22 = v43;
            a2[3] = (uint64_t)&type metadata for String;
LABEL_38:

            *a2 = v24;
LABEL_39:
            a2[1] = v22;
            uint64_t v33 = (unsigned int *)&enum case for IntentParameter.directAssignment(_:);
LABEL_59:
            uint64_t v39 = *v33;
            uint64_t v40 = sub_111B0();
            (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v40 - 8) + 104))(a2, v39, v40);
            return;
          }
          if (*(void *)"Chill MiGet Up! FavoriteNew Musix" != v41 || *(void **)"x" != v44)
          {
            char v34 = sub_11580();
            swift_bridgeObjectRelease();
            if (v34) {
              goto LABEL_47;
            }
            if (*(void *)"Get Up! FavoriteNew Musix" != v41 || v44 != (void *)0xEB0000000078694DLL)
            {
              char v35 = sub_11580();
              swift_bridgeObjectRelease();
              if (v35) {
                goto LABEL_47;
              }
              if (*(void *)"FavoriteNew Musix" != v41 || v44 != (void *)0xED000078694D2073)
              {
                char v36 = sub_11580();
                swift_bridgeObjectRelease();
                if (v36) {
                  goto LABEL_47;
                }
                if (*(void *)"New Musix" != v41 || v44 != (void *)0xED000078694D2063)
                {
                  char v37 = sub_11580();
                  swift_bridgeObjectRelease();
                  if ((v37 & 1) == 0)
                  {
                    uint64_t v42 = 543516788;
                    unint64_t v43 = 0xE400000000000000;
                    v46._countAndFlagsBits = v41;
                    v46._object = v44;
                    sub_11410(v46);
                    swift_bridgeObjectRelease();
                    swift_bridgeObjectRetain();
                    v23._countAndFlagsBits = 0x73696C79616C7020;
                    v23._object = (void *)0xE900000000000074;
                    goto LABEL_28;
                  }
LABEL_47:
                  a2[3] = (uint64_t)&type metadata for String;

                  *a2 = v41;
                  goto LABEL_39;
                }
              }
            }
          }
          swift_bridgeObjectRelease();
          goto LABEL_47;
        }
      }
      id v25 = [v7 identifier];
      if (v25)
      {
        uint64_t v26 = v25;
        sub_113E0();

        sub_9620();
        LOBYTE(v26) = sub_114F0();
        swift_bridgeObjectRelease();
        if (v26) {
          goto LABEL_35;
        }
      }
      id v27 = [v7 identifier];
      if (v27)
      {
        long long v28 = v27;
        sub_113E0();

        sub_9620();
        LOBYTE(v28) = sub_114F0();
        swift_bridgeObjectRelease();
        if (v28) {
          goto LABEL_35;
        }
      }
      id v29 = [v7 identifier];
      if (v29)
      {
        uint64_t v30 = v29;
        sub_113E0();

        sub_9620();
        LOBYTE(v30) = sub_114F0();
        swift_bridgeObjectRelease();
        if (v30)
        {
LABEL_35:
          sub_113F0();
          v45._countAndFlagsBits = 0x7473696C79616C70;
          v45._object = (void *)0xE800000000000000;
          BOOL v31 = sub_11430(v45);
          swift_bridgeObjectRelease();
          v32._countAndFlagsBits = v41;
          v32._object = v44;
          if (!v31)
          {
            sub_11410(v32);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRetain();
            v32._countAndFlagsBits = 0x73696C79616C7020;
            v32._object = (void *)0xE900000000000074;
          }
          sub_11410(v32);
          swift_bridgeObjectRelease();
          uint64_t v24 = 2128237;
          unint64_t v22 = 0xE300000000000000;
          a2[3] = (uint64_t)&type metadata for String;
          goto LABEL_38;
        }
      }

      swift_bridgeObjectRelease();
    }
    else
    {
LABEL_19:
    }
LABEL_58:
    uint64_t v33 = (unsigned int *)&enum case for IntentParameter.ignore(_:);
    goto LABEL_59;
  }
  __break(1u);
}

uint64_t sub_AAA8()
{
  uint64_t v0 = sub_72B8(0, &qword_185E0);
  return static SuggestionTransformers.mapINIntentValue<A>(extractor:)(sub_A2AC, 0, v0);
}

uint64_t sub_AB10(char a1)
{
  return *(void *)&aChillMigetUpFa_0[8 * a1];
}

uint64_t sub_AB30()
{
  sub_68C4(&qword_187C8);
  sub_110F0();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_11DE0;
  sub_110E0();
  sub_110E0();
  sub_110E0();
  sub_110E0();
  sub_110E0();
  sub_110E0();
  sub_110E0();
  sub_110E0();
  sub_110E0();
  sub_110E0();
  sub_110E0();
  sub_110E0();
  uint64_t result = sub_110E0();
  qword_190C8 = v0;
  return result;
}

uint64_t sub_AD58()
{
  sub_68C4(&qword_187C8);
  sub_110F0();
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_11DF0;
  sub_110E0();
  sub_110E0();
  sub_110E0();
  sub_110E0();
  sub_110E0();
  sub_110E0();
  sub_110E0();
  sub_110E0();
  sub_110E0();
  sub_110E0();
  sub_110E0();
  sub_110E0();
  sub_110E0();
  sub_110E0();
  sub_110E0();
  sub_110E0();
  sub_110E0();
  sub_110E0();
  sub_110E0();
  sub_110E0();
  sub_110E0();
  sub_110E0();
  sub_110E0();
  sub_110E0();
  sub_110E0();
  sub_110E0();
  sub_110E0();
  sub_110E0();
  sub_110E0();
  sub_110E0();
  sub_110E0();
  sub_110E0();
  sub_110E0();
  sub_110E0();
  sub_110E0();
  sub_110E0();
  sub_110E0();
  sub_110E0();
  sub_110E0();
  sub_110E0();
  uint64_t result = sub_110E0();
  qword_190D0 = v0;
  return result;
}

uint64_t sub_B294()
{
  sub_68C4(&qword_187C0);
  uint64_t v0 = sub_11130();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = *(void *)(v1 + 72);
  unint64_t v3 = (*(unsigned __int8 *)(v1 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_11E00;
  unint64_t v5 = v4 + v3;
  id v6 = *(void (**)(unint64_t, void, uint64_t))(v1 + 104);
  v6(v5, enum case for DeviceType.iPhone(_:), v0);
  v6(v5 + v2, enum case for DeviceType.iPad(_:), v0);
  v6(v5 + 2 * v2, enum case for DeviceType.watch(_:), v0);
  v6(v5 + 3 * v2, enum case for DeviceType.pod(_:), v0);
  v6(v5 + 4 * v2, enum case for DeviceType.mac(_:), v0);
  v6(v5 + 5 * v2, enum case for DeviceType.homepod(_:), v0);
  v6(v5 + 6 * v2, enum case for DeviceType.appleTV(_:), v0);
  uint64_t result = ((uint64_t (*)(unint64_t, void, uint64_t))v6)(v5 + 7 * v2, enum case for DeviceType.carPlay(_:), v0);
  qword_190D8 = v4;
  return result;
}

uint64_t sub_B480()
{
  sub_11150();
  swift_allocObject();
  uint64_t result = sub_11160();
  qword_190E0 = result;
  return result;
}

unint64_t sub_B4D8(char a1)
{
  unint64_t result = 0xD000000000000012;
  switch(a1)
  {
    case 1:
    case 2:
      return result;
    case 3:
      unint64_t result = 0x646E61702E6D6F63;
      break;
    case 4:
      unint64_t result = 0xD000000000000020;
      break;
    default:
      unint64_t result = 0x6C7070612E6D6F63;
      break;
  }
  return result;
}

uint64_t type metadata accessor for AudioSuggestionsConstants()
{
  return self;
}

uint64_t storeEnumTagSinglePayload for RadioNameParameterBuilder(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a3 + 65281 <= 0xFFFEFFFF) {
    int v3 = 2;
  }
  else {
    int v3 = 4;
  }
  if (a3 + 65281 < 0xFF0000) {
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
    unsigned int v6 = ((a2 - 255) >> 16) + 1;
    *(_WORD *)unint64_t result = a2 - 255;
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
        JUMPOUT(0xB684);
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
          *(unsigned char *)(result + 1) = a2 + 1;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RadioNameParameterBuilder()
{
  return &type metadata for RadioNameParameterBuilder;
}

void sub_B6BC(void *a1@<X0>, uint64_t *a2@<X8>)
{
  self;
  uint64_t v4 = swift_dynamicCastObjCClass();
  if (!v4)
  {
    uint64_t v12 = enum case for IntentParameter.ignore(_:);
LABEL_29:
    uint64_t v25 = sub_111B0();
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(void *)(v25 - 8) + 104))(a2, v12, v25);
    return;
  }
  uint64_t v5 = (void *)v4;
  id v6 = a1;
  id v7 = [v5 mediaItems];
  if (!v7)
  {
LABEL_12:
    id v11 = [v5 mediaContainer];
    if (!v11) {
      goto LABEL_24;
    }
    goto LABEL_13;
  }
  id v8 = v7;
  sub_72B8(0, &qword_185E8);
  unint64_t v9 = sub_11450();

  if (!(v9 >> 62))
  {
    if (*(void *)((char *)&dword_10 + (v9 & 0xFFFFFFFFFFFFFF8))) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  uint64_t v13 = sub_11540();
  swift_bridgeObjectRelease();
  if (!v13)
  {
LABEL_11:
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
LABEL_5:
  if ((v9 & 0xC000000000000001) != 0)
  {
    id v10 = (id)sub_11510();
    goto LABEL_8;
  }
  if (*(void *)((char *)&dword_10 + (v9 & 0xFFFFFFFFFFFFFF8)))
  {
    id v10 = *(id *)(v9 + 32);
LABEL_8:
    id v11 = v10;
    swift_bridgeObjectRelease();
LABEL_13:
    if ([v11 type] == &dword_10)
    {
      id v14 = [v11 title];
      if (v14)
      {
        uint64_t v15 = sub_113E0();
        unint64_t v17 = v16;

        id v14 = (id)(v15 & 0xFFFFFFFFFFFFLL);
      }
      else
      {
        unint64_t v17 = 0xE000000000000000;
      }
      swift_bridgeObjectRelease();
      uint64_t v18 = HIBYTE(v17) & 0xF;
      if ((v17 & 0x2000000000000000) == 0) {
        uint64_t v18 = (uint64_t)v14;
      }
      if (v18)
      {
        id v19 = [v11 title];
        if (v19)
        {
          id v20 = v19;
          uint64_t v21 = sub_113E0();
          unint64_t v23 = v22;

          a2[3] = (uint64_t)&type metadata for String;
          if (v23)
          {

LABEL_27:
            *a2 = v21;
            a2[1] = v23;
            uint64_t v24 = (unsigned int *)&enum case for IntentParameter.directAssignment(_:);
            goto LABEL_28;
          }
        }
        else
        {
          a2[3] = (uint64_t)&type metadata for String;
        }

        uint64_t v21 = 0;
        unint64_t v23 = 0xE000000000000000;
        goto LABEL_27;
      }
    }

LABEL_24:
    uint64_t v24 = (unsigned int *)&enum case for IntentParameter.ignore(_:);
LABEL_28:
    uint64_t v12 = *v24;
    goto LABEL_29;
  }
  __break(1u);
}

uint64_t sub_B960()
{
  uint64_t v0 = sub_72B8(0, &qword_185E0);
  return static SuggestionTransformers.mapINIntentValue<A>(extractor:)(sub_B6BC, 0, v0);
}

unint64_t sub_B9C8(char a1)
{
  unint64_t result = 0xD000000000000010;
  switch(a1)
  {
    case 1:
      unint64_t result = 0x6E69666661736964;
      break;
    case 2:
      unint64_t result = 2036427888;
      break;
    case 3:
      unint64_t result = 0x646F504179616C70;
      break;
    case 4:
      return result;
    case 5:
      unint64_t result = 0x6973754D79616C70;
      break;
    case 6:
      unint64_t result = 0x5979425879616C70;
      break;
    case 7:
      unint64_t result = 0x6974724179616C70;
      break;
    case 8:
      unint64_t result = 0x6964615279616C70;
      break;
    case 9:
      unint64_t result = 0x79616C5079616C70;
      break;
    case 10:
      unint64_t result = 0x4E65685479616C70;
      break;
    case 11:
      unint64_t result = 0x6572616873;
      break;
    case 12:
      unint64_t result = 0x656C6666756873;
      break;
    case 13:
      unint64_t result = 0x676E6F5374616877;
      break;
    default:
      unint64_t result = 0x7974696E69666661;
      break;
  }
  return result;
}

uint64_t sub_BBAC(char a1)
{
  return *(void *)&aSongnameartist_0[8 * a1];
}

uint64_t sub_BBCC(char a1, char a2)
{
  if (*(void *)&aSongnameartist_0[8 * a1] == *(void *)&aSongnameartist_0[8 * a2]
    && *(void *)&aSongnameartist_0[8 * a1 + 40] == *(void *)&aSongnameartist_0[8 * a2 + 40])
  {
    char v3 = 1;
  }
  else
  {
    char v3 = sub_11580();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

unint64_t sub_BC54(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_68C4(&qword_188C0);
  uint64_t v2 = (void *)sub_11550();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (void *)(a1 + 40);
  while (1)
  {
    char v5 = *((unsigned char *)v4 - 8);
    uint64_t v6 = *v4;
    swift_bridgeObjectRetain();
    unint64_t result = sub_F8C8(v5);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(unsigned char *)(v2[6] + result) = v5;
    *(void *)(v2[7] + 8 * result) = v6;
    uint64_t v9 = v2[2];
    BOOL v10 = __OFADD__(v9, 1);
    uint64_t v11 = v9 + 1;
    if (v10) {
      goto LABEL_11;
    }
    v2[2] = v11;
    v4 += 2;
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

unint64_t sub_BD58(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_68C4(&qword_188E0);
  uint64_t v2 = sub_11550();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_10AE0(v6, (uint64_t)&v15, &qword_188E8);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_F950(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_10AC8(v17, (_OWORD *)(v3[7] + 48 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 64;
    if (!--v4)
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

unint64_t sub_BE9C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_68C4(&qword_188F0);
  uint64_t v2 = sub_11550();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_10AE0(v6, (uint64_t)&v15, &qword_188F8);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_F950(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_6DD0(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
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

Swift::Int sub_BFD4()
{
  return sub_115A0();
}

uint64_t sub_C040()
{
  sub_11400();
  return swift_bridgeObjectRelease();
}

Swift::Int sub_C094()
{
  return sub_115A0();
}

Swift::Int sub_C0FC()
{
  char v1 = *v0;
  sub_11590();
  sub_B9C8(v1);
  sub_11400();
  swift_bridgeObjectRelease();
  return sub_115A0();
}

uint64_t sub_C160()
{
  sub_B9C8(*v0);
  sub_11400();
  return swift_bridgeObjectRelease();
}

Swift::Int sub_C1B4()
{
  char v1 = *v0;
  sub_11590();
  sub_B9C8(v1);
  sub_11400();
  swift_bridgeObjectRelease();
  return sub_115A0();
}

uint64_t sub_C214@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10E44(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

unint64_t sub_C244@<X0>(unint64_t *a1@<X8>)
{
  unint64_t result = sub_B9C8(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_C270(char *a1, char *a2)
{
  char v2 = *a2;
  unint64_t v3 = sub_B9C8(*a1);
  uint64_t v5 = v4;
  if (v3 == sub_B9C8(v2) && v5 == v6) {
    char v8 = 1;
  }
  else {
    char v8 = sub_11580();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

Swift::Int sub_C2FC()
{
  return sub_BFD4();
}

uint64_t sub_C304()
{
  return sub_C040();
}

Swift::Int sub_C30C()
{
  return sub_C094();
}

uint64_t sub_C314@<X0>(uint64_t a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_10E90(*(void *)a1, *(void **)(a1 + 8));
  *a2 = result;
  return result;
}

uint64_t sub_C344@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_BBAC(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_C370(char *a1, char *a2)
{
  return sub_BBCC(*a1, *a2);
}

uint64_t sub_C37C()
{
  if (qword_18338 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_190D0;
  uint64_t v1 = qword_18340;
  swift_bridgeObjectRetain();
  if (v1 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_190D8;
  uint64_t v3 = qword_183C0;
  swift_bridgeObjectRetain();
  if (v3 != -1) {
    swift_once();
  }
  uint64_t v4 = off_187D0;
  if (*(void *)((char *)&dword_10 + (void)off_187D0))
  {
    unint64_t v5 = sub_F8C8(0);
    if (v6)
    {
      uint64_t v7 = *(void **)(*(void *)&stru_20.segname[(void)v4 + 16] + 8 * v5);
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v7 = &_swiftEmptyArrayStorage;
    }
  }
  else
  {
    uint64_t v7 = &_swiftEmptyArrayStorage;
  }
  sub_68C4(&qword_188D0);
  sub_111F0();
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_118A0;
  sub_11200();
  sub_68C4(&qword_188D8);
  uint64_t v9 = sub_111A0();
  uint64_t v10 = *(void *)(v9 - 8);
  unint64_t v11 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_118A0;
  unint64_t v13 = v12 + v11;
  uint64_t v14 = enum case for SiriHintsMode.display(_:);
  uint64_t v15 = sub_11120();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 104))(v13, v14, v15);
  uint64_t result = (*(uint64_t (**)(unint64_t, void, uint64_t))(v10 + 104))(v13, enum case for DeliveryVehicle.siriHints(_:), v9);
  *(void *)&xmmword_190E8 = 0xD000000000000019;
  *((void *)&xmmword_190E8 + 1) = 0x80000000000129C0;
  qword_190F8 = 0xD000000000000056;
  unk_19100 = 0x8000000000012760;
  *(void *)&xmmword_19108 = v0;
  *((void *)&xmmword_19108 + 1) = v2;
  *(void *)&xmmword_19118 = v7;
  *((void *)&xmmword_19118 + 1) = 0x7974696E69666661;
  *(void *)&xmmword_19128 = 0xE800000000000000;
  *((void *)&xmmword_19128 + 1) = 0xD000000000000010;
  *(void *)&xmmword_19138 = 0x80000000000127C0;
  WORD4(xmmword_19138) = 256;
  xmmword_19148 = 0uLL;
  *(void *)&xmmword_19158 = &off_147F0;
  *((void *)&xmmword_19158 + 1) = v8;
  *(void *)&xmmword_19168 = v12;
  *((void *)&xmmword_19168 + 1) = sub_C6F8;
  xmmword_19178 = 0uLL;
  *(void *)&xmmword_19188 = 0xE000000000000000;
  *((void *)&xmmword_19188 + 1) = &_swiftEmptyArrayStorage;
  qword_19198 = (uint64_t)&_swiftEmptyArrayStorage;
  return result;
}

uint64_t sub_C6F8(uint64_t a1)
{
  sub_10A60(a1 + 1, (uint64_t)&v6);
  sub_10A60((uint64_t)&v6, (uint64_t)&v7);
  if ((v7 == 2 || (sub_10A60((uint64_t)&v6, (uint64_t)&v3), (v3 & 1) == 0))
    && ((sub_10A60(a1, (uint64_t)&v5), sub_10A60((uint64_t)&v5, (uint64_t)&v8), v8 == 2)
     || (sub_10A60((uint64_t)&v5, (uint64_t)&v4), (v4 & 1) == 0)))
  {
    return *(unsigned __int8 *)(a1 + 33);
  }
  else
  {
    return 0;
  }
}

uint64_t sub_C79C()
{
  if (qword_18338 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_190D0;
  uint64_t v1 = qword_18340;
  swift_bridgeObjectRetain();
  if (v1 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_190D8;
  sub_68C4(&qword_188D0);
  sub_111F0();
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_118A0;
  swift_bridgeObjectRetain();
  sub_11200();
  sub_68C4(&qword_188D8);
  uint64_t v4 = sub_111A0();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_118A0;
  unint64_t v8 = v7 + v6;
  uint64_t v9 = enum case for SiriHintsMode.display(_:);
  uint64_t v10 = sub_11120();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 104))(v8, v9, v10);
  uint64_t result = (*(uint64_t (**)(unint64_t, void, uint64_t))(v5 + 104))(v8, enum case for DeliveryVehicle.siriHints(_:), v4);
  *(void *)&xmmword_191A0 = 0xD00000000000001CLL;
  *((void *)&xmmword_191A0 + 1) = 0x80000000000129A0;
  qword_191B0 = 0xD000000000000056;
  unk_191B8 = 0x8000000000012760;
  *(void *)&xmmword_191C0 = v0;
  *((void *)&xmmword_191C0 + 1) = v2;
  *(void *)&xmmword_191D0 = &_swiftEmptyArrayStorage;
  *((void *)&xmmword_191D0 + 1) = 0x6E69666661736964;
  *(void *)&xmmword_191E0 = 0xEB00000000797469;
  *((void *)&xmmword_191E0 + 1) = 0xD000000000000010;
  *(void *)&xmmword_191F0 = 0x80000000000127C0;
  WORD4(xmmword_191F0) = 257;
  xmmword_19200 = 0uLL;
  *(void *)&xmmword_19210 = &off_14848;
  *((void *)&xmmword_19210 + 1) = v3;
  *(void *)&xmmword_19220 = v7;
  *((void *)&xmmword_19220 + 1) = variable initialization expression of AudioSuggestionsExecutionParameters.supportsAffinityIntent;
  xmmword_19230 = 0uLL;
  *(void *)&xmmword_19240 = 0xE000000000000000;
  *((void *)&xmmword_19240 + 1) = &_swiftEmptyArrayStorage;
  qword_19250 = (uint64_t)&_swiftEmptyArrayStorage;
  return result;
}

double sub_CAA8()
{
  if (qword_18330 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_190C8;
  uint64_t v1 = qword_18340;
  swift_bridgeObjectRetain();
  if (v1 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_190D8;
  uint64_t v3 = qword_183C0;
  swift_bridgeObjectRetain();
  if (v3 != -1) {
    swift_once();
  }
  if (*(void *)((char *)&dword_10 + (void)off_187D0))
  {
    sub_F8C8(2);
    if (v4) {
      uint64_t v5 = (void *)swift_bridgeObjectRetain();
    }
    else {
      uint64_t v5 = &_swiftEmptyArrayStorage;
    }
  }
  else
  {
    uint64_t v5 = &_swiftEmptyArrayStorage;
  }
  *(void *)&xmmword_19258 = 0xD000000000000015;
  *((void *)&xmmword_19258 + 1) = 0x8000000000012980;
  qword_19268 = 0xD000000000000056;
  unk_19270 = 0x8000000000012760;
  *(void *)&xmmword_19278 = v0;
  *((void *)&xmmword_19278 + 1) = v2;
  *(void *)&xmmword_19288 = v5;
  *((void *)&xmmword_19288 + 1) = 2036427888;
  *(void *)&xmmword_19298 = 0xE400000000000000;
  *((void *)&xmmword_19298 + 1) = 0xD000000000000010;
  *(void *)&xmmword_192A8 = 0x80000000000127C0;
  WORD4(xmmword_192A8) = 258;
  double result = 0.0;
  xmmword_192B8 = 0u;
  xmmword_192C8 = 0u;
  *(void *)&xmmword_192D8 = 0;
  *((void *)&xmmword_192D8 + 1) = variable initialization expression of ArtistNameParameterBuilder.parameterName;
  xmmword_192E8 = 0uLL;
  *(void *)&xmmword_192F8 = 0xE000000000000000;
  *((void *)&xmmword_192F8 + 1) = &_swiftEmptyArrayStorage;
  qword_19308 = (uint64_t)&_swiftEmptyArrayStorage;
  return result;
}

double sub_CC68()
{
  if (qword_18330 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_190C8;
  uint64_t v1 = qword_18340;
  swift_bridgeObjectRetain();
  if (v1 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_190D8;
  uint64_t v3 = qword_183C0;
  swift_bridgeObjectRetain();
  if (v3 != -1) {
    swift_once();
  }
  char v4 = off_187D0;
  if (*(void *)((char *)&dword_10 + (void)off_187D0))
  {
    unint64_t v5 = sub_F8C8(3);
    if (v6)
    {
      uint64_t v7 = *(void **)(*(void *)&stru_20.segname[(void)v4 + 16] + 8 * v5);
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v7 = &_swiftEmptyArrayStorage;
    }
  }
  else
  {
    uint64_t v7 = &_swiftEmptyArrayStorage;
  }
  sub_68C4(&qword_188A8);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_118A0;
  *(void *)(v8 + 56) = &type metadata for PodcastNameParameterBuilder;
  *(void *)(v8 + 64) = &off_14CB0;
  *(_WORD *)(v8 + 32) = 4;
  *(void *)&xmmword_19310 = 0xD00000000000001DLL;
  *((void *)&xmmword_19310 + 1) = 0x8000000000012960;
  qword_19320 = 0xD000000000000056;
  unk_19328 = 0x8000000000012760;
  *(void *)&xmmword_19330 = v0;
  *((void *)&xmmword_19330 + 1) = v2;
  *(void *)&xmmword_19340 = v7;
  *((void *)&xmmword_19340 + 1) = 0x646F504179616C70;
  *(void *)&xmmword_19350 = 0xEC00000074736163;
  *((void *)&xmmword_19350 + 1) = 0xD000000000000010;
  *(void *)&xmmword_19360 = 0x80000000000127C0;
  WORD4(xmmword_19360) = 259;
  double result = 0.0;
  xmmword_19370 = 0u;
  xmmword_19380 = 0u;
  *(void *)&xmmword_19390 = 0;
  *((void *)&xmmword_19390 + 1) = variable initialization expression of ArtistNameParameterBuilder.parameterName;
  *(void *)&xmmword_193A0 = 0;
  *((void *)&xmmword_193A0 + 1) = 0xD000000000000024;
  *(void *)&xmmword_193B0 = 0x8000000000012800;
  *((void *)&xmmword_193B0 + 1) = v8;
  qword_193C0 = (uint64_t)&_swiftEmptyArrayStorage;
  return result;
}

uint64_t sub_CE8C()
{
  if (qword_18338 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_190D0;
  uint64_t v1 = qword_18340;
  swift_bridgeObjectRetain();
  if (v1 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_190D8;
  sub_68C4(&qword_188D0);
  sub_111F0();
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_118A0;
  swift_bridgeObjectRetain();
  sub_11200();
  sub_68C4(&qword_188D8);
  uint64_t v4 = sub_111A0();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_118A0;
  unint64_t v8 = v7 + v6;
  uint64_t v9 = enum case for SiriHintsMode.display(_:);
  uint64_t v10 = sub_11120();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 104))(v8, v9, v10);
  uint64_t result = (*(uint64_t (**)(unint64_t, void, uint64_t))(v5 + 104))(v8, enum case for DeliveryVehicle.siriHints(_:), v4);
  *(void *)&xmmword_193C8 = 0xD000000000000021;
  *((void *)&xmmword_193C8 + 1) = 0x8000000000012930;
  qword_193D8 = 0xD000000000000056;
  unk_193E0 = 0x8000000000012760;
  *(void *)&xmmword_193E8 = v0;
  *((void *)&xmmword_193E8 + 1) = v2;
  *(void *)&xmmword_193F8 = &_swiftEmptyArrayStorage;
  *((void *)&xmmword_193F8 + 1) = 0xD000000000000010;
  *(void *)&xmmword_19408 = 0x8000000000012140;
  *((void *)&xmmword_19408 + 1) = 0xD000000000000010;
  *(void *)&xmmword_19418 = 0x80000000000127C0;
  WORD4(xmmword_19418) = 260;
  xmmword_19428 = 0uLL;
  *(void *)&xmmword_19438 = &off_14880;
  *((void *)&xmmword_19438 + 1) = v3;
  *(void *)&xmmword_19448 = v7;
  *((void *)&xmmword_19448 + 1) = variable initialization expression of ArtistNameParameterBuilder.parameterName;
  *(void *)&xmmword_19458 = 0;
  *((void *)&xmmword_19458 + 1) = 0xD000000000000024;
  *(void *)&xmmword_19468 = 0x8000000000012800;
  *((void *)&xmmword_19468 + 1) = &_swiftEmptyArrayStorage;
  qword_19478 = (uint64_t)&_swiftEmptyArrayStorage;
  return result;
}

void *sub_D19C()
{
  if (qword_18330 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_190C8;
  uint64_t v1 = qword_18340;
  swift_bridgeObjectRetain();
  if (v1 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_190D8;
  uint64_t v3 = qword_183C0;
  swift_bridgeObjectRetain();
  if (v3 != -1) {
    swift_once();
  }
  if (*(void *)((char *)&dword_10 + (void)off_187D0))
  {
    sub_F8C8(5);
    if (v4) {
      uint64_t result = (void *)swift_bridgeObjectRetain();
    }
    else {
      uint64_t result = &_swiftEmptyArrayStorage;
    }
  }
  else
  {
    uint64_t result = &_swiftEmptyArrayStorage;
  }
  *(void *)&xmmword_19480 = 0xD00000000000001ALL;
  *((void *)&xmmword_19480 + 1) = 0x8000000000012910;
  qword_19490 = 0xD000000000000056;
  unk_19498 = 0x8000000000012760;
  *(void *)&xmmword_194A0 = v0;
  *((void *)&xmmword_194A0 + 1) = v2;
  *(void *)&xmmword_194B0 = result;
  *((void *)&xmmword_194B0 + 1) = 0x6973754D79616C70;
  *(void *)&xmmword_194C0 = 0xE900000000000063;
  *((void *)&xmmword_194C0 + 1) = 0xD000000000000010;
  *(void *)&xmmword_194D0 = 0x80000000000127C0;
  WORD4(xmmword_194D0) = 261;
  *(void *)&xmmword_194E0 = 0xD000000000000011;
  *((void *)&xmmword_194E0 + 1) = 0x80000000000127E0;
  unk_19500 = 0;
  xmmword_194F0 = 0uLL;
  qword_19508 = (uint64_t)variable initialization expression of ArtistNameParameterBuilder.parameterName;
  unk_19510 = 0;
  qword_19518 = 0xD000000000000024;
  unk_19520 = 0x8000000000012800;
  qword_19528 = (uint64_t)&_swiftEmptyArrayStorage;
  qword_19530 = (uint64_t)&_swiftEmptyArrayStorage;
  return result;
}

double sub_D38C()
{
  if (qword_18330 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_190C8;
  uint64_t v1 = qword_18340;
  swift_bridgeObjectRetain();
  if (v1 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_190D8;
  uint64_t v3 = qword_183C0;
  swift_bridgeObjectRetain();
  if (v3 != -1) {
    swift_once();
  }
  char v4 = off_187D0;
  if (*(void *)((char *)&dword_10 + (void)off_187D0))
  {
    unint64_t v5 = sub_F8C8(6);
    if (v6)
    {
      uint64_t v7 = *(void **)(*(void *)&stru_20.segname[(void)v4 + 16] + 8 * v5);
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v7 = &_swiftEmptyArrayStorage;
    }
  }
  else
  {
    uint64_t v7 = &_swiftEmptyArrayStorage;
  }
  sub_68C4(&qword_188A8);
  uint64_t v8 = swift_allocObject();
  *(void *)&double result = 2;
  *(_OWORD *)(v8 + 16) = xmmword_11EE0;
  *(void *)(v8 + 56) = &type metadata for SongNameParameterBuilder;
  *(void *)(v8 + 64) = &off_14C08;
  *(_WORD *)(v8 + 32) = 256;
  *(void *)(v8 + 96) = &type metadata for ArtistNameParameterBuilder;
  *(void *)(v8 + 104) = &off_14CD8;
  *(_WORD *)(v8 + 72) = 1;
  *(void *)&xmmword_19538 = 0xD000000000000019;
  *((void *)&xmmword_19538 + 1) = 0x8000000000012870;
  qword_19548 = 0xD000000000000056;
  unk_19550 = 0x8000000000012760;
  *(void *)&xmmword_19558 = v0;
  *((void *)&xmmword_19558 + 1) = v2;
  *(void *)&xmmword_19568 = v7;
  *((void *)&xmmword_19568 + 1) = 0x5979425879616C70;
  *(void *)&xmmword_19578 = 0xE800000000000000;
  *((void *)&xmmword_19578 + 1) = 0xD000000000000010;
  *(void *)&xmmword_19588 = 0x80000000000127C0;
  WORD4(xmmword_19588) = 262;
  *(void *)&xmmword_19598 = 0xD000000000000011;
  *((void *)&xmmword_19598 + 1) = 0x80000000000127E0;
  xmmword_195A8 = 0uLL;
  *(void *)&xmmword_195B8 = 0;
  *((void *)&xmmword_195B8 + 1) = variable initialization expression of ArtistNameParameterBuilder.parameterName;
  *(void *)&xmmword_195C8 = 0;
  *((void *)&xmmword_195C8 + 1) = 0xD000000000000024;
  *(void *)&xmmword_195D8 = 0x8000000000012800;
  *((void *)&xmmword_195D8 + 1) = v8;
  qword_195E8 = (uint64_t)&_swiftEmptyArrayStorage;
  return result;
}

double sub_D5D8()
{
  if (qword_18330 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_190C8;
  uint64_t v1 = qword_18340;
  swift_bridgeObjectRetain();
  if (v1 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_190D8;
  uint64_t v3 = qword_183C0;
  swift_bridgeObjectRetain();
  if (v3 != -1) {
    swift_once();
  }
  char v4 = off_187D0;
  if (*(void *)((char *)&dword_10 + (void)off_187D0))
  {
    unint64_t v5 = sub_F8C8(7);
    if (v6)
    {
      uint64_t v7 = *(void **)(*(void *)&stru_20.segname[(void)v4 + 16] + 8 * v5);
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v7 = &_swiftEmptyArrayStorage;
    }
  }
  else
  {
    uint64_t v7 = &_swiftEmptyArrayStorage;
  }
  sub_68C4(&qword_188A8);
  uint64_t v8 = swift_allocObject();
  *(void *)&double result = 1;
  *(_OWORD *)(v8 + 16) = xmmword_118A0;
  *(void *)(v8 + 56) = &type metadata for ArtistNameParameterBuilder;
  *(void *)(v8 + 64) = &off_14CD8;
  *(_WORD *)(v8 + 32) = 257;
  *(void *)&xmmword_195F0 = 0xD00000000000001BLL;
  *((void *)&xmmword_195F0 + 1) = 0x8000000000012850;
  qword_19600 = 0xD000000000000056;
  unk_19608 = 0x8000000000012760;
  *(void *)&xmmword_19610 = v0;
  *((void *)&xmmword_19610 + 1) = v2;
  *(void *)&xmmword_19620 = v7;
  *((void *)&xmmword_19620 + 1) = 0x6974724179616C70;
  *(void *)&xmmword_19630 = 0xEA00000000007473;
  *((void *)&xmmword_19630 + 1) = 0xD000000000000010;
  *(void *)&xmmword_19640 = 0x80000000000127C0;
  WORD4(xmmword_19640) = 263;
  *(void *)&xmmword_19650 = 0xD000000000000011;
  *((void *)&xmmword_19650 + 1) = 0x80000000000127E0;
  xmmword_19660 = 0uLL;
  *(void *)&xmmword_19670 = 0;
  *((void *)&xmmword_19670 + 1) = variable initialization expression of ArtistNameParameterBuilder.parameterName;
  *(void *)&xmmword_19680 = 0;
  *((void *)&xmmword_19680 + 1) = 0xD000000000000024;
  *(void *)&xmmword_19690 = 0x8000000000012800;
  *((void *)&xmmword_19690 + 1) = v8;
  qword_196A0 = (uint64_t)&_swiftEmptyArrayStorage;
  return result;
}

double sub_D80C()
{
  if (qword_18330 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_190C8;
  uint64_t v1 = qword_18340;
  swift_bridgeObjectRetain();
  if (v1 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_190D8;
  uint64_t v3 = qword_183C0;
  swift_bridgeObjectRetain();
  if (v3 != -1) {
    swift_once();
  }
  char v4 = off_187D0;
  if (*(void *)((char *)&dword_10 + (void)off_187D0))
  {
    unint64_t v5 = sub_F8C8(8);
    if (v6)
    {
      uint64_t v7 = *(void **)(*(void *)&stru_20.segname[(void)v4 + 16] + 8 * v5);
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v7 = &_swiftEmptyArrayStorage;
    }
  }
  else
  {
    uint64_t v7 = &_swiftEmptyArrayStorage;
  }
  sub_68C4(&qword_188A8);
  uint64_t v8 = swift_allocObject();
  *(void *)&double result = 1;
  *(_OWORD *)(v8 + 16) = xmmword_118A0;
  *(void *)(v8 + 56) = &type metadata for RadioNameParameterBuilder;
  *(void *)(v8 + 64) = &off_14F38;
  *(_WORD *)(v8 + 32) = 258;
  *(void *)&xmmword_196A8 = 0xD00000000000001ALL;
  *((void *)&xmmword_196A8 + 1) = 0x8000000000012830;
  qword_196B8 = 0xD000000000000056;
  unk_196C0 = 0x8000000000012760;
  *(void *)&xmmword_196C8 = v0;
  *((void *)&xmmword_196C8 + 1) = v2;
  *(void *)&xmmword_196D8 = v7;
  *((void *)&xmmword_196D8 + 1) = 0x6964615279616C70;
  *(void *)&xmmword_196E8 = 0xE90000000000006FLL;
  *((void *)&xmmword_196E8 + 1) = 0xD000000000000010;
  *(void *)&xmmword_196F8 = 0x80000000000127C0;
  WORD4(xmmword_196F8) = 264;
  *(void *)&xmmword_19708 = 0xD000000000000011;
  *((void *)&xmmword_19708 + 1) = 0x80000000000127E0;
  xmmword_19718 = 0uLL;
  *(void *)&xmmword_19728 = 0;
  *((void *)&xmmword_19728 + 1) = variable initialization expression of ArtistNameParameterBuilder.parameterName;
  *(void *)&xmmword_19738 = 0;
  *((void *)&xmmword_19738 + 1) = 0xD000000000000024;
  *(void *)&xmmword_19748 = 0x8000000000012800;
  *((void *)&xmmword_19748 + 1) = v8;
  qword_19758 = (uint64_t)&_swiftEmptyArrayStorage;
  return result;
}

double sub_DA40()
{
  if (qword_18330 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_190C8;
  uint64_t v1 = qword_18340;
  swift_bridgeObjectRetain();
  if (v1 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_190D8;
  uint64_t v3 = qword_183C0;
  swift_bridgeObjectRetain();
  if (v3 != -1) {
    swift_once();
  }
  char v4 = off_187D0;
  if (*(void *)((char *)&dword_10 + (void)off_187D0))
  {
    unint64_t v5 = sub_F8C8(9);
    if (v6)
    {
      uint64_t v7 = *(void **)(*(void *)&stru_20.segname[(void)v4 + 16] + 8 * v5);
      swift_bridgeObjectRetain();
    }
    else
    {
      uint64_t v7 = &_swiftEmptyArrayStorage;
    }
  }
  else
  {
    uint64_t v7 = &_swiftEmptyArrayStorage;
  }
  sub_68C4(&qword_188A8);
  uint64_t v8 = swift_allocObject();
  *(void *)&double result = 1;
  *(_OWORD *)(v8 + 16) = xmmword_118A0;
  *(void *)(v8 + 56) = &type metadata for PlaylistNameParameterBuilder;
  *(void *)(v8 + 64) = &off_14E90;
  *(_WORD *)(v8 + 32) = 259;
  *(void *)&xmmword_19760 = 0xD00000000000001DLL;
  *((void *)&xmmword_19760 + 1) = 0x8000000000012740;
  qword_19770 = 0xD000000000000056;
  unk_19778 = 0x8000000000012760;
  *(void *)&xmmword_19780 = v0;
  *((void *)&xmmword_19780 + 1) = v2;
  *(void *)&xmmword_19790 = v7;
  *((void *)&xmmword_19790 + 1) = 0x79616C5079616C70;
  *(void *)&xmmword_197A0 = 0xEC0000007473696CLL;
  *((void *)&xmmword_197A0 + 1) = 0xD000000000000010;
  *(void *)&xmmword_197B0 = 0x80000000000127C0;
  WORD4(xmmword_197B0) = 265;
  *(void *)&xmmword_197C0 = 0xD000000000000011;
  *((void *)&xmmword_197C0 + 1) = 0x80000000000127E0;
  xmmword_197D0 = 0uLL;
  *(void *)&xmmword_197E0 = 0;
  *((void *)&xmmword_197E0 + 1) = variable initialization expression of ArtistNameParameterBuilder.parameterName;
  *(void *)&xmmword_197F0 = 0;
  *((void *)&xmmword_197F0 + 1) = 0xD000000000000024;
  *(void *)&xmmword_19800 = 0x8000000000012800;
  *((void *)&xmmword_19800 + 1) = v8;
  qword_19810 = (uint64_t)&_swiftEmptyArrayStorage;
  return result;
}

double sub_DC78()
{
  if (qword_18330 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_190C8;
  uint64_t v1 = qword_18340;
  swift_bridgeObjectRetain();
  if (v1 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_190D8;
  uint64_t v3 = qword_183C0;
  swift_bridgeObjectRetain();
  if (v3 != -1) {
    swift_once();
  }
  if (*(void *)((char *)&dword_10 + (void)off_187D0))
  {
    sub_F8C8(10);
    if (v4) {
      unint64_t v5 = (void *)swift_bridgeObjectRetain();
    }
    else {
      unint64_t v5 = &_swiftEmptyArrayStorage;
    }
  }
  else
  {
    unint64_t v5 = &_swiftEmptyArrayStorage;
  }
  *(void *)&xmmword_19818 = 0xD00000000000001CLL;
  *((void *)&xmmword_19818 + 1) = 0x80000000000128F0;
  qword_19828 = 0xD000000000000056;
  unk_19830 = 0x8000000000012760;
  *(void *)&xmmword_19838 = v0;
  *((void *)&xmmword_19838 + 1) = v2;
  *(void *)&xmmword_19848 = v5;
  *((void *)&xmmword_19848 + 1) = 0x4E65685479616C70;
  *(void *)&xmmword_19858 = 0xEB00000000737765;
  *((void *)&xmmword_19858 + 1) = 0xD000000000000010;
  *(void *)&xmmword_19868 = 0x80000000000127C0;
  WORD4(xmmword_19868) = 266;
  double result = 0.0;
  xmmword_19878 = 0u;
  xmmword_19888 = 0u;
  *(void *)&xmmword_19898 = 0;
  *((void *)&xmmword_19898 + 1) = variable initialization expression of ArtistNameParameterBuilder.parameterName;
  *(void *)&xmmword_198A8 = 0;
  *((void *)&xmmword_198A8 + 1) = 0xD000000000000024;
  *(void *)&xmmword_198B8 = 0x8000000000012800;
  *((void *)&xmmword_198B8 + 1) = &_swiftEmptyArrayStorage;
  qword_198C8 = (uint64_t)&_swiftEmptyArrayStorage;
  return result;
}

uint64_t sub_DE54()
{
  if (qword_18338 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_190D0;
  uint64_t v1 = qword_18340;
  swift_bridgeObjectRetain();
  if (v1 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_190D8;
  sub_68C4(&qword_188D0);
  sub_111F0();
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_118A0;
  swift_bridgeObjectRetain();
  sub_11200();
  sub_68C4(&qword_188D8);
  uint64_t v4 = sub_111A0();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_118A0;
  unint64_t v8 = v7 + v6;
  uint64_t v9 = enum case for SiriHintsMode.display(_:);
  uint64_t v10 = sub_11120();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 104))(v8, v9, v10);
  uint64_t result = (*(uint64_t (**)(unint64_t, void, uint64_t))(v5 + 104))(v8, enum case for DeliveryVehicle.siriHints(_:), v4);
  *(void *)&xmmword_198D0 = 0xD000000000000016;
  *((void *)&xmmword_198D0 + 1) = 0x80000000000128D0;
  qword_198E0 = 0xD000000000000056;
  unk_198E8 = 0x8000000000012760;
  *(void *)&xmmword_198F0 = v0;
  *((void *)&xmmword_198F0 + 1) = v2;
  *(void *)&xmmword_19900 = &_swiftEmptyArrayStorage;
  *((void *)&xmmword_19900 + 1) = 0x6572616873;
  *(void *)&xmmword_19910 = 0xE500000000000000;
  *((void *)&xmmword_19910 + 1) = 0xD000000000000010;
  *(void *)&xmmword_19920 = 0x80000000000127C0;
  WORD4(xmmword_19920) = 267;
  xmmword_19930 = 0uLL;
  *(void *)&xmmword_19940 = &off_148D0;
  *((void *)&xmmword_19940 + 1) = v3;
  *(void *)&xmmword_19950 = v7;
  *((void *)&xmmword_19950 + 1) = variable initialization expression of AudioSuggestionsExecutionParameters.supportsAffinityIntent;
  xmmword_19960 = 0uLL;
  *(void *)&xmmword_19970 = 0xE000000000000000;
  *((void *)&xmmword_19970 + 1) = &_swiftEmptyArrayStorage;
  qword_19980 = (uint64_t)&_swiftEmptyArrayStorage;
  return result;
}

uint64_t sub_E154()
{
  if (qword_18338 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_190D0;
  uint64_t v1 = qword_18340;
  swift_bridgeObjectRetain();
  if (v1 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_190D8;
  sub_68C4(&qword_188D0);
  sub_111F0();
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_118A0;
  swift_bridgeObjectRetain();
  sub_11200();
  sub_68C4(&qword_188D8);
  uint64_t v4 = sub_111A0();
  uint64_t v5 = *(void *)(v4 - 8);
  unint64_t v6 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_118A0;
  unint64_t v8 = v7 + v6;
  uint64_t v9 = enum case for SiriHintsMode.display(_:);
  uint64_t v10 = sub_11120();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 104))(v8, v9, v10);
  uint64_t result = (*(uint64_t (**)(unint64_t, void, uint64_t))(v5 + 104))(v8, enum case for DeliveryVehicle.siriHints(_:), v4);
  *(void *)&xmmword_19988 = 0xD000000000000018;
  *((void *)&xmmword_19988 + 1) = 0x80000000000128B0;
  qword_19998 = 0xD000000000000056;
  unk_199A0 = 0x8000000000012760;
  *(void *)&xmmword_199A8 = v0;
  *((void *)&xmmword_199A8 + 1) = v2;
  *(void *)&xmmword_199B8 = &_swiftEmptyArrayStorage;
  *((void *)&xmmword_199B8 + 1) = 0x656C6666756873;
  *(void *)&xmmword_199C8 = 0xE700000000000000;
  *((void *)&xmmword_199C8 + 1) = 0xD000000000000010;
  *(void *)&xmmword_199D8 = 0x80000000000127C0;
  WORD4(xmmword_199D8) = 268;
  xmmword_199E8 = 0uLL;
  *(void *)&xmmword_199F8 = &off_14908;
  *((void *)&xmmword_199F8 + 1) = v3;
  *(void *)&xmmword_19A08 = v7;
  *((void *)&xmmword_19A08 + 1) = sub_E458;
  xmmword_19A18 = 0uLL;
  *(void *)&xmmword_19A28 = 0xE000000000000000;
  *((void *)&xmmword_19A28 + 1) = &_swiftEmptyArrayStorage;
  qword_19A38 = (uint64_t)&_swiftEmptyArrayStorage;
  return result;
}

BOOL sub_E458(uint64_t a1)
{
  if ((*(unsigned char *)(a1 + 32) & 1) != 0 || *(uint64_t *)(a1 + 24) < 5) {
    return 0;
  }
  int v1 = *(unsigned __int8 *)(a1 + 17);
  return v1 != 2 && (v1 & 1) == 0;
}

double sub_E48C()
{
  if (qword_18330 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_190C8;
  uint64_t v1 = qword_18340;
  swift_bridgeObjectRetain();
  if (v1 != -1) {
    swift_once();
  }
  uint64_t v2 = qword_190D8;
  uint64_t v3 = qword_183C0;
  swift_bridgeObjectRetain();
  if (v3 != -1) {
    swift_once();
  }
  if (*(void *)((char *)&dword_10 + (void)off_187D0))
  {
    sub_F8C8(13);
    if (v4) {
      uint64_t v5 = (void *)swift_bridgeObjectRetain();
    }
    else {
      uint64_t v5 = &_swiftEmptyArrayStorage;
    }
  }
  else
  {
    uint64_t v5 = &_swiftEmptyArrayStorage;
  }
  *(void *)&xmmword_19A40 = 0xD00000000000001FLL;
  *((void *)&xmmword_19A40 + 1) = 0x8000000000012890;
  qword_19A50 = 0xD000000000000056;
  unk_19A58 = 0x8000000000012760;
  *(void *)&xmmword_19A60 = v0;
  *((void *)&xmmword_19A60 + 1) = v2;
  *(void *)&xmmword_19A70 = v5;
  *((void *)&xmmword_19A70 + 1) = 0x676E6F5374616877;
  *(void *)&xmmword_19A80 = 0xEE00736968547349;
  *((void *)&xmmword_19A80 + 1) = 0xD000000000000010;
  *(void *)&xmmword_19A90 = 0x80000000000127C0;
  WORD4(xmmword_19A90) = 269;
  double result = 0.0;
  xmmword_19AA0 = 0u;
  xmmword_19AB0 = 0u;
  *(void *)&xmmword_19AC0 = 0;
  *((void *)&xmmword_19AC0 + 1) = variable initialization expression of ArtistNameParameterBuilder.parameterName;
  *(void *)&xmmword_19AD0 = 0;
  *((void *)&xmmword_19AD0 + 1) = 0xD000000000000024;
  *(void *)&xmmword_19AE0 = 0x8000000000012800;
  *((void *)&xmmword_19AE0 + 1) = &_swiftEmptyArrayStorage;
  qword_19AF0 = (uint64_t)&_swiftEmptyArrayStorage;
  return result;
}

uint64_t type metadata accessor for AudioSuggestions()
{
  return self;
}

uint64_t destroy for AudioSuggestion()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for AudioSuggestion(uint64_t a1, uint64_t a2)
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
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v6;
  uint64_t v7 = *(void *)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(void *)(a1 + 72) = v7;
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(_WORD *)(a1 + 88) = *(_WORD *)(a2 + 88);
  uint64_t v8 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v8;
  uint64_t v9 = *(void *)(a2 + 120);
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  *(void *)(a1 + 120) = v9;
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  uint64_t v10 = *(void *)(a2 + 152);
  *(void *)(a1 + 144) = *(void *)(a2 + 144);
  *(void *)(a1 + 152) = v10;
  uint64_t v12 = *(void *)(a2 + 168);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  *(void *)(a1 + 168) = v12;
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for AudioSuggestion(uint64_t a1, uint64_t a2)
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
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(unsigned char *)(a1 + 89) = *(unsigned char *)(a2 + 89);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 112) = *(void *)(a2 + 112);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 120) = *(void *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 128) = *(void *)(a2 + 128);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 144);
  *(void *)(a1 + 136) = *(void *)(a2 + 136);
  *(void *)(a1 + 144) = v4;
  swift_retain();
  swift_release();
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  *(void *)(a1 + 160) = *(void *)(a2 + 160);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 168) = *(void *)(a2 + 168);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for AudioSuggestion(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[1];
  long long v4 = a2[3];
  *(_OWORD *)(a1 + 32) = a2[2];
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)a1 = v2;
  *(_OWORD *)(a1 + 16) = v3;
  long long v5 = a2[4];
  long long v6 = a2[5];
  long long v7 = a2[7];
  *(_OWORD *)(a1 + 96) = a2[6];
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  __n128 result = (__n128)a2[8];
  long long v9 = a2[9];
  long long v10 = a2[10];
  *(void *)(a1 + 176) = *((void *)a2 + 22);
  *(_OWORD *)(a1 + 144) = v9;
  *(_OWORD *)(a1 + 160) = v10;
  *(__n128 *)(a1 + 128) = result;
  return result;
}

uint64_t assignWithTake for AudioSuggestion(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 64);
  *(void *)(a1 + 56) = *(void *)(a2 + 56);
  *(void *)(a1 + 64) = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(a2 + 80);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);
  *(void *)(a1 + 80) = v6;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 88) = *(unsigned char *)(a2 + 88);
  *(unsigned char *)(a1 + 89) = *(unsigned char *)(a2 + 89);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 104) = *(_OWORD *)(a2 + 104);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 120) = *(_OWORD *)(a2 + 120);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  swift_release();
  *(void *)(a1 + 152) = *(void *)(a2 + 152);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  swift_bridgeObjectRelease();
  *(void *)(a1 + 176) = *(void *)(a2 + 176);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AudioSuggestion(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 184)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AudioSuggestion(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
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
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 184) = 1;
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
    *(unsigned char *)(result + 184) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AudioSuggestion()
{
  return &type metadata for AudioSuggestion;
}

unsigned char *initializeBufferWithCopyOfBuffer for AudioSuggestion.SuggestionType(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AudioSuggestion.ParameterName(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for AudioSuggestion.ParameterName(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 4;
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
        JUMPOUT(0xEDC8);
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
          *__n128 result = a2 + 4;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AudioSuggestion.ParameterName()
{
  return &type metadata for AudioSuggestion.ParameterName;
}

unint64_t sub_EE08()
{
  unint64_t result = qword_188A0;
  if (!qword_188A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_188A0);
  }
  return result;
}

int *sub_EE5C()
{
  sub_68C4(&qword_188B0);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_11EF0;
  *(unsigned char *)(inited + 32) = 0;
  sub_68C4(&qword_188B8);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_11F00;
  if (qword_183C8 != -1) {
    swift_once();
  }
  *(void *)(v1 + 32) = qword_187D8;
  sub_11460();
  *(void *)(inited + 40) = v1;
  *(unsigned char *)(inited + 48) = 2;
  uint64_t v2 = qword_183F0;
  swift_retain();
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v6 = qword_18800;
  swift_retain_n();
  swift_bridgeObjectRetain();
  sub_11440();
  if (*(void *)((char *)&dword_10 + (v6 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                + (v6 & 0xFFFFFFFFFFFFFF8)) >> 1)
    sub_11470();
  sub_11480();
  sub_11460();
  swift_release();
  *(void *)(inited + 56) = v6;
  *(unsigned char *)(inited + 64) = 3;
  uint64_t v3 = qword_18800;
  if (qword_183D0 != -1) {
    swift_once();
  }
  swift_retain_n();
  swift_bridgeObjectRetain();
  sub_11440();
  if (*(void *)((char *)&dword_10 + (v3 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                + (v3 & 0xFFFFFFFFFFFFFF8)) >> 1)
    sub_11470();
  sub_11480();
  sub_11460();
  swift_release();
  *(void *)(inited + 72) = v3;
  *(unsigned char *)(inited + 80) = 5;
  uint64_t v7 = qword_18800;
  swift_retain_n();
  swift_bridgeObjectRetain();
  sub_11440();
  if (*(void *)((char *)&dword_10 + (v7 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                + (v7 & 0xFFFFFFFFFFFFFF8)) >> 1)
    sub_11470();
  sub_11480();
  sub_11460();
  swift_release();
  *(void *)(inited + 88) = v7;
  *(unsigned char *)(inited + 96) = 4;
  uint64_t v8 = qword_18800;
  swift_retain_n();
  swift_bridgeObjectRetain();
  sub_11440();
  if (*(void *)((char *)&dword_10 + (v8 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                + (v8 & 0xFFFFFFFFFFFFFF8)) >> 1)
    sub_11470();
  sub_11480();
  sub_11460();
  swift_release();
  *(void *)(inited + 104) = v8;
  *(unsigned char *)(inited + 112) = 6;
  uint64_t v9 = qword_18800;
  swift_retain_n();
  swift_bridgeObjectRetain();
  sub_11440();
  if (*(void *)((char *)&dword_10 + (v9 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                + (v9 & 0xFFFFFFFFFFFFFF8)) >> 1)
    sub_11470();
  sub_11480();
  sub_11460();
  swift_release();
  *(void *)(inited + 120) = v9;
  *(unsigned char *)(inited + 128) = 7;
  uint64_t v10 = qword_18800;
  swift_retain_n();
  swift_bridgeObjectRetain();
  sub_11440();
  if (*(void *)((char *)&dword_10 + (v10 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                 + (v10 & 0xFFFFFFFFFFFFFF8)) >> 1)
    sub_11470();
  sub_11480();
  sub_11460();
  swift_release();
  *(void *)(inited + 136) = v10;
  *(unsigned char *)(inited + 144) = 8;
  uint64_t v11 = qword_18800;
  swift_retain_n();
  swift_bridgeObjectRetain();
  sub_11440();
  if (*(void *)((char *)&dword_10 + (v11 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                 + (v11 & 0xFFFFFFFFFFFFFF8)) >> 1)
    sub_11470();
  sub_11480();
  sub_11460();
  swift_release();
  *(void *)(inited + 152) = v11;
  *(unsigned char *)(inited + 160) = 9;
  uint64_t v12 = qword_18800;
  swift_retain_n();
  swift_bridgeObjectRetain();
  sub_11440();
  if (*(void *)((char *)&dword_10 + (v12 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                 + (v12 & 0xFFFFFFFFFFFFFF8)) >> 1)
    sub_11470();
  sub_11480();
  sub_11460();
  swift_release();
  *(void *)(inited + 168) = v12;
  *(unsigned char *)(inited + 176) = 10;
  uint64_t v4 = qword_18800;
  *(void *)(inited + 184) = qword_18800;
  *(unsigned char *)(inited + 192) = 13;
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  sub_11440();
  if (*(void *)((char *)&dword_10 + (v4 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                + (v4 & 0xFFFFFFFFFFFFFF8)) >> 1)
    sub_11470();
  sub_11480();
  sub_11460();
  swift_release();
  *(void *)(inited + 200) = v4;
  *(unsigned char *)(inited + 208) = 12;
  uint64_t v13 = qword_18800;
  swift_retain_n();
  swift_bridgeObjectRetain();
  sub_11440();
  if (*(void *)((char *)&dword_10 + (v13 & 0xFFFFFFFFFFFFFF8)) >= *(void *)((char *)&dword_18
                                                                                 + (v13 & 0xFFFFFFFFFFFFFF8)) >> 1)
    sub_11470();
  sub_11480();
  sub_11460();
  swift_release();
  *(void *)(inited + 216) = v13;
  unint64_t result = (int *)sub_BC54(inited);
  off_187D0 = result;
  return result;
}

uint64_t sub_F518()
{
  uint64_t v0 = sub_11190();
  v3[3] = v0;
  v3[4] = sub_10DFC(&qword_188C8, (void (*)(uint64_t))&type metadata accessor for CoreSignalTypes);
  uint64_t v1 = sub_6908(v3);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v0 - 8) + 104))(v1, enum case for CoreSignalTypes.app(_:), v0);
  sub_11360();
  uint64_t result = sub_11330();
  qword_187D8 = result;
  return result;
}

uint64_t sub_F608()
{
  sub_11360();
  uint64_t v0 = sub_11190();
  v3[3] = v0;
  v3[4] = sub_10DFC(&qword_188C8, (void (*)(uint64_t))&type metadata accessor for CoreSignalTypes);
  uint64_t v1 = sub_6908(v3);
  (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v0 - 8) + 104))(v1, enum case for CoreSignalTypes.app(_:), v0);
  uint64_t result = sub_11330();
  qword_187E0 = result;
  return result;
}

uint64_t sub_F6F0()
{
  sub_11360();
  uint64_t result = sub_11340();
  qword_187E8 = result;
  return result;
}

uint64_t sub_F724()
{
  sub_11360();
  uint64_t result = sub_11350();
  qword_187F0 = result;
  return result;
}

uint64_t sub_F758()
{
  sub_11360();
  uint64_t result = sub_11320();
  qword_187F8 = result;
  return result;
}

uint64_t sub_F78C()
{
  sub_68C4(&qword_188B8);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_11F10;
  if (qword_183D8 != -1) {
    swift_once();
  }
  *(void *)(v0 + 32) = qword_187E8;
  uint64_t v1 = qword_183E0;
  swift_retain();
  if (v1 != -1) {
    swift_once();
  }
  *(void *)(v0 + 40) = qword_187F0;
  uint64_t v2 = qword_183E8;
  swift_retain();
  if (v2 != -1) {
    swift_once();
  }
  *(void *)(v0 + 48) = qword_187F8;
  sub_11460();
  qword_18800 = v0;
  return swift_retain();
}

unint64_t sub_F8C8(char a1)
{
  sub_11590();
  sub_B9C8(a1);
  sub_11400();
  swift_bridgeObjectRelease();
  Swift::Int v2 = sub_115A0();
  return sub_F9C8(a1, v2);
}

unint64_t sub_F950(uint64_t a1, uint64_t a2)
{
  sub_11590();
  sub_11400();
  Swift::Int v4 = sub_115A0();
  return sub_FEAC(a1, a2, v4);
}

unint64_t sub_F9C8(unsigned __int8 a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    uint64_t v6 = a1;
    while (1)
    {
      unint64_t v7 = 0x8000000000012140;
      unint64_t v8 = 0xD000000000000010;
      switch(*(unsigned char *)(*(void *)(v2 + 48) + v4))
      {
        case 1:
          unint64_t v8 = 0x6E69666661736964;
          unint64_t v7 = 0xEB00000000797469;
          break;
        case 2:
          unint64_t v7 = 0xE400000000000000;
          unint64_t v8 = 2036427888;
          break;
        case 3:
          unint64_t v8 = 0x646F504179616C70;
          unint64_t v7 = 0xEC00000074736163;
          break;
        case 4:
          break;
        case 5:
          unint64_t v8 = 0x6973754D79616C70;
          unint64_t v7 = 0xE900000000000063;
          break;
        case 6:
          unint64_t v7 = 0xE800000000000000;
          unint64_t v8 = 0x5979425879616C70;
          break;
        case 7:
          unint64_t v8 = 0x6974724179616C70;
          unint64_t v7 = 0xEA00000000007473;
          break;
        case 8:
          unint64_t v7 = 0xE90000000000006FLL;
          unint64_t v8 = 0x6964615279616C70;
          break;
        case 9:
          unint64_t v7 = 0xEC0000007473696CLL;
          unint64_t v8 = 0x79616C5079616C70;
          break;
        case 0xA:
          unint64_t v8 = 0x4E65685479616C70;
          unint64_t v7 = 0xEB00000000737765;
          break;
        case 0xB:
          unint64_t v7 = 0xE500000000000000;
          unint64_t v8 = 0x6572616873;
          break;
        case 0xC:
          unint64_t v7 = 0xE700000000000000;
          unint64_t v8 = 0x656C6666756873;
          break;
        case 0xD:
          unint64_t v8 = 0x676E6F5374616877;
          unint64_t v7 = 0xEE00736968547349;
          break;
        default:
          unint64_t v7 = 0xE800000000000000;
          unint64_t v8 = 0x7974696E69666661;
          break;
      }
      unint64_t v9 = 0x8000000000012140;
      unint64_t v10 = 0xD000000000000010;
      switch(v6)
      {
        case 1:
          uint64_t v11 = 0x6E69666661736964;
          uint64_t v12 = 7959657;
          goto LABEL_36;
        case 2:
          unint64_t v9 = 0xE400000000000000;
          if (v8 != 2036427888) {
            goto LABEL_43;
          }
          goto LABEL_42;
        case 3:
          unint64_t v9 = 0xEC00000074736163;
          if (v8 != 0x646F504179616C70) {
            goto LABEL_43;
          }
          goto LABEL_42;
        case 4:
          goto LABEL_41;
        case 5:
          unint64_t v9 = 0xE900000000000063;
          if (v8 != 0x6973754D79616C70) {
            goto LABEL_43;
          }
          goto LABEL_42;
        case 6:
          unint64_t v9 = 0xE800000000000000;
          if (v8 != 0x5979425879616C70) {
            goto LABEL_43;
          }
          goto LABEL_42;
        case 7:
          unint64_t v9 = 0xEA00000000007473;
          if (v8 != 0x6974724179616C70) {
            goto LABEL_43;
          }
          goto LABEL_42;
        case 8:
          unint64_t v9 = 0xE90000000000006FLL;
          if (v8 != 0x6964615279616C70) {
            goto LABEL_43;
          }
          goto LABEL_42;
        case 9:
          unint64_t v9 = 0xEC0000007473696CLL;
          if (v8 != 0x79616C5079616C70) {
            goto LABEL_43;
          }
          goto LABEL_42;
        case 10:
          uint64_t v11 = 0x4E65685479616C70;
          uint64_t v12 = 7567205;
LABEL_36:
          unint64_t v9 = v12 & 0xFFFFFFFFFFFFLL | 0xEB00000000000000;
          if (v8 != v11) {
            goto LABEL_43;
          }
          goto LABEL_42;
        case 11:
          unint64_t v9 = 0xE500000000000000;
          if (v8 != 0x6572616873) {
            goto LABEL_43;
          }
          goto LABEL_42;
        case 12:
          unint64_t v9 = 0xE700000000000000;
          unint64_t v10 = 0x656C6666756873;
LABEL_41:
          if (v8 == v10) {
            goto LABEL_42;
          }
          goto LABEL_43;
        case 13:
          unint64_t v9 = 0xEE00736968547349;
          if (v8 != 0x676E6F5374616877) {
            goto LABEL_43;
          }
          goto LABEL_42;
        default:
          unint64_t v9 = 0xE800000000000000;
          if (v8 != 0x7974696E69666661) {
            goto LABEL_43;
          }
LABEL_42:
          if (v7 == v9)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            return v4;
          }
LABEL_43:
          char v13 = sub_11580();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v13) {
            return v4;
          }
          unint64_t v4 = (v4 + 1) & v5;
          if (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) == 0) {
            return v4;
          }
          break;
      }
    }
  }
  return v4;
}

unint64_t sub_FEAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_11580() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        char v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_11580() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_FF90()
{
  sub_68C4(&qword_186C0);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_11F20;
  if (qword_18350 != -1) {
    swift_once();
  }
  long long v1 = xmmword_19158;
  v128[8] = xmmword_19168;
  v128[9] = xmmword_19178;
  long long v2 = xmmword_19178;
  v128[10] = xmmword_19188;
  long long v3 = xmmword_19128;
  long long v4 = xmmword_19118;
  v128[4] = xmmword_19128;
  v128[5] = xmmword_19138;
  long long v5 = xmmword_19138;
  long long v6 = xmmword_19148;
  v128[6] = xmmword_19148;
  v128[7] = xmmword_19158;
  v128[0] = xmmword_190E8;
  v128[1] = *(_OWORD *)&qword_190F8;
  long long v8 = xmmword_190E8;
  long long v7 = *(_OWORD *)&qword_190F8;
  long long v9 = xmmword_19108;
  v128[2] = xmmword_19108;
  v128[3] = xmmword_19118;
  *(_OWORD *)(v0 + 160) = xmmword_19168;
  *(_OWORD *)(v0 + 176) = v2;
  *(_OWORD *)(v0 + 192) = xmmword_19188;
  *(_OWORD *)(v0 + 96) = v3;
  *(_OWORD *)(v0 + 112) = v5;
  *(_OWORD *)(v0 + 128) = v6;
  *(_OWORD *)(v0 + 144) = v1;
  *(_OWORD *)(v0 + 32) = v8;
  *(_OWORD *)(v0 + 48) = v7;
  uint64_t v129 = qword_19198;
  *(void *)(v0 + 208) = qword_19198;
  *(_OWORD *)(v0 + 64) = v9;
  *(_OWORD *)(v0 + 80) = v4;
  sub_66D0((uint64_t)v128);
  if (qword_18358 != -1) {
    swift_once();
  }
  long long v10 = xmmword_19210;
  v130[8] = xmmword_19220;
  v130[9] = xmmword_19230;
  long long v11 = xmmword_19230;
  v130[10] = xmmword_19240;
  long long v12 = xmmword_191E0;
  long long v13 = xmmword_191D0;
  v130[4] = xmmword_191E0;
  v130[5] = xmmword_191F0;
  long long v14 = xmmword_191F0;
  long long v15 = xmmword_19200;
  v130[6] = xmmword_19200;
  v130[7] = xmmword_19210;
  v130[0] = xmmword_191A0;
  v130[1] = *(_OWORD *)&qword_191B0;
  long long v17 = xmmword_191A0;
  long long v16 = *(_OWORD *)&qword_191B0;
  long long v18 = xmmword_191C0;
  v130[2] = xmmword_191C0;
  v130[3] = xmmword_191D0;
  *(_OWORD *)(v0 + 344) = xmmword_19220;
  *(_OWORD *)(v0 + 360) = v11;
  *(_OWORD *)(v0 + 376) = xmmword_19240;
  *(_OWORD *)(v0 + 280) = v12;
  *(_OWORD *)(v0 + 296) = v14;
  *(_OWORD *)(v0 + 312) = v15;
  *(_OWORD *)(v0 + 328) = v10;
  *(_OWORD *)(v0 + 216) = v17;
  *(_OWORD *)(v0 + 232) = v16;
  uint64_t v131 = qword_19250;
  *(void *)(v0 + 392) = qword_19250;
  *(_OWORD *)(v0 + 248) = v18;
  *(_OWORD *)(v0 + 264) = v13;
  sub_66D0((uint64_t)v130);
  if (qword_18360 != -1) {
    swift_once();
  }
  long long v19 = xmmword_192C8;
  v132[8] = xmmword_192D8;
  v132[9] = xmmword_192E8;
  long long v20 = xmmword_192E8;
  v132[10] = xmmword_192F8;
  long long v21 = xmmword_19298;
  long long v22 = xmmword_19288;
  v132[4] = xmmword_19298;
  v132[5] = xmmword_192A8;
  long long v23 = xmmword_192A8;
  long long v24 = xmmword_192B8;
  v132[6] = xmmword_192B8;
  v132[7] = xmmword_192C8;
  v132[0] = xmmword_19258;
  v132[1] = *(_OWORD *)&qword_19268;
  long long v26 = xmmword_19258;
  long long v25 = *(_OWORD *)&qword_19268;
  long long v27 = xmmword_19278;
  v132[2] = xmmword_19278;
  v132[3] = xmmword_19288;
  *(_OWORD *)(v0 + 528) = xmmword_192D8;
  *(_OWORD *)(v0 + 544) = v20;
  *(_OWORD *)(v0 + 560) = xmmword_192F8;
  *(_OWORD *)(v0 + 464) = v21;
  *(_OWORD *)(v0 + 480) = v23;
  *(_OWORD *)(v0 + 496) = v24;
  *(_OWORD *)(v0 + 512) = v19;
  *(_OWORD *)(v0 + 400) = v26;
  *(_OWORD *)(v0 + 416) = v25;
  uint64_t v133 = qword_19308;
  *(void *)(v0 + 576) = qword_19308;
  *(_OWORD *)(v0 + 432) = v27;
  *(_OWORD *)(v0 + 448) = v22;
  sub_66D0((uint64_t)v132);
  if (qword_18368 != -1) {
    swift_once();
  }
  long long v28 = xmmword_19380;
  v134[8] = xmmword_19390;
  v134[9] = xmmword_193A0;
  long long v29 = xmmword_193A0;
  v134[10] = xmmword_193B0;
  long long v30 = xmmword_19350;
  long long v31 = xmmword_19340;
  v134[4] = xmmword_19350;
  v134[5] = xmmword_19360;
  long long v32 = xmmword_19360;
  long long v33 = xmmword_19370;
  v134[6] = xmmword_19370;
  v134[7] = xmmword_19380;
  v134[0] = xmmword_19310;
  v134[1] = *(_OWORD *)&qword_19320;
  long long v35 = xmmword_19310;
  long long v34 = *(_OWORD *)&qword_19320;
  long long v36 = xmmword_19330;
  v134[2] = xmmword_19330;
  v134[3] = xmmword_19340;
  *(_OWORD *)(v0 + 712) = xmmword_19390;
  *(_OWORD *)(v0 + 728) = v29;
  *(_OWORD *)(v0 + 744) = xmmword_193B0;
  *(_OWORD *)(v0 + 648) = v30;
  *(_OWORD *)(v0 + 664) = v32;
  *(_OWORD *)(v0 + 680) = v33;
  *(_OWORD *)(v0 + 696) = v28;
  *(_OWORD *)(v0 + 584) = v35;
  *(_OWORD *)(v0 + 600) = v34;
  uint64_t v135 = qword_193C0;
  *(void *)(v0 + 760) = qword_193C0;
  *(_OWORD *)(v0 + 616) = v36;
  *(_OWORD *)(v0 + 632) = v31;
  sub_66D0((uint64_t)v134);
  if (qword_18370 != -1) {
    swift_once();
  }
  long long v37 = xmmword_19438;
  v136[8] = xmmword_19448;
  v136[9] = xmmword_19458;
  long long v38 = xmmword_19458;
  v136[10] = xmmword_19468;
  long long v39 = xmmword_19408;
  long long v40 = xmmword_193F8;
  v136[4] = xmmword_19408;
  v136[5] = xmmword_19418;
  long long v41 = xmmword_19418;
  long long v42 = xmmword_19428;
  v136[6] = xmmword_19428;
  v136[7] = xmmword_19438;
  v136[0] = xmmword_193C8;
  v136[1] = *(_OWORD *)&qword_193D8;
  long long v44 = xmmword_193C8;
  long long v43 = *(_OWORD *)&qword_193D8;
  long long v45 = xmmword_193E8;
  v136[2] = xmmword_193E8;
  v136[3] = xmmword_193F8;
  *(_OWORD *)(v0 + 896) = xmmword_19448;
  *(_OWORD *)(v0 + 912) = v38;
  *(_OWORD *)(v0 + 928) = xmmword_19468;
  *(_OWORD *)(v0 + 832) = v39;
  *(_OWORD *)(v0 + 848) = v41;
  *(_OWORD *)(v0 + 864) = v42;
  *(_OWORD *)(v0 + 880) = v37;
  *(_OWORD *)(v0 + 768) = v44;
  *(_OWORD *)(v0 + 784) = v43;
  uint64_t v137 = qword_19478;
  *(void *)(v0 + 944) = qword_19478;
  *(_OWORD *)(v0 + 800) = v45;
  *(_OWORD *)(v0 + 816) = v40;
  sub_66D0((uint64_t)v136);
  if (qword_18378 != -1) {
    swift_once();
  }
  long long v46 = xmmword_194F0;
  v138[8] = unk_19500;
  v138[9] = unk_19510;
  long long v47 = unk_19510;
  v138[10] = unk_19520;
  long long v48 = xmmword_194C0;
  long long v49 = xmmword_194B0;
  v138[4] = xmmword_194C0;
  v138[5] = xmmword_194D0;
  long long v50 = xmmword_194D0;
  long long v51 = xmmword_194E0;
  v138[6] = xmmword_194E0;
  v138[7] = xmmword_194F0;
  v138[0] = xmmword_19480;
  v138[1] = *(_OWORD *)&qword_19490;
  long long v53 = xmmword_19480;
  long long v52 = *(_OWORD *)&qword_19490;
  long long v54 = xmmword_194A0;
  v138[2] = xmmword_194A0;
  v138[3] = xmmword_194B0;
  *(_OWORD *)(v0 + 1080) = unk_19500;
  *(_OWORD *)(v0 + 1096) = v47;
  *(_OWORD *)(v0 + 1112) = unk_19520;
  *(_OWORD *)(v0 + 1016) = v48;
  *(_OWORD *)(v0 + 1032) = v50;
  *(_OWORD *)(v0 + 1048) = v51;
  *(_OWORD *)(v0 + 1064) = v46;
  *(_OWORD *)(v0 + 952) = v53;
  *(_OWORD *)(v0 + 968) = v52;
  uint64_t v139 = qword_19530;
  *(void *)(v0 + 1128) = qword_19530;
  *(_OWORD *)(v0 + 984) = v54;
  *(_OWORD *)(v0 + 1000) = v49;
  sub_66D0((uint64_t)v138);
  if (qword_183A0 != -1) {
    swift_once();
  }
  long long v55 = xmmword_19888;
  v140[8] = xmmword_19898;
  v140[9] = xmmword_198A8;
  long long v56 = xmmword_198A8;
  v140[10] = xmmword_198B8;
  long long v57 = xmmword_19858;
  long long v58 = xmmword_19848;
  v140[4] = xmmword_19858;
  v140[5] = xmmword_19868;
  long long v59 = xmmword_19868;
  long long v60 = xmmword_19878;
  v140[6] = xmmword_19878;
  v140[7] = xmmword_19888;
  v140[0] = xmmword_19818;
  v140[1] = *(_OWORD *)&qword_19828;
  long long v62 = xmmword_19818;
  long long v61 = *(_OWORD *)&qword_19828;
  long long v63 = xmmword_19838;
  v140[2] = xmmword_19838;
  v140[3] = xmmword_19848;
  *(_OWORD *)(v0 + 1264) = xmmword_19898;
  *(_OWORD *)(v0 + 1280) = v56;
  *(_OWORD *)(v0 + 1296) = xmmword_198B8;
  *(_OWORD *)(v0 + 1200) = v57;
  *(_OWORD *)(v0 + 1216) = v59;
  *(_OWORD *)(v0 + 1232) = v60;
  *(_OWORD *)(v0 + 1248) = v55;
  *(_OWORD *)(v0 + 1136) = v62;
  *(_OWORD *)(v0 + 1152) = v61;
  uint64_t v141 = qword_198C8;
  *(void *)(v0 + 1312) = qword_198C8;
  *(_OWORD *)(v0 + 1168) = v63;
  *(_OWORD *)(v0 + 1184) = v58;
  sub_66D0((uint64_t)v140);
  if (qword_183A8 != -1) {
    swift_once();
  }
  long long v64 = xmmword_19940;
  v142[8] = xmmword_19950;
  v142[9] = xmmword_19960;
  long long v65 = xmmword_19960;
  v142[10] = xmmword_19970;
  long long v66 = xmmword_19910;
  long long v67 = xmmword_19900;
  v142[4] = xmmword_19910;
  v142[5] = xmmword_19920;
  long long v68 = xmmword_19920;
  long long v69 = xmmword_19930;
  v142[6] = xmmword_19930;
  v142[7] = xmmword_19940;
  v142[0] = xmmword_198D0;
  v142[1] = *(_OWORD *)&qword_198E0;
  long long v71 = xmmword_198D0;
  long long v70 = *(_OWORD *)&qword_198E0;
  long long v72 = xmmword_198F0;
  v142[2] = xmmword_198F0;
  v142[3] = xmmword_19900;
  *(_OWORD *)(v0 + 1448) = xmmword_19950;
  *(_OWORD *)(v0 + 1464) = v65;
  *(_OWORD *)(v0 + 1480) = xmmword_19970;
  *(_OWORD *)(v0 + 1384) = v66;
  *(_OWORD *)(v0 + 1400) = v68;
  *(_OWORD *)(v0 + 1416) = v69;
  *(_OWORD *)(v0 + 1432) = v64;
  *(_OWORD *)(v0 + 1320) = v71;
  *(_OWORD *)(v0 + 1336) = v70;
  uint64_t v143 = qword_19980;
  *(void *)(v0 + 1496) = qword_19980;
  *(_OWORD *)(v0 + 1352) = v72;
  *(_OWORD *)(v0 + 1368) = v67;
  sub_66D0((uint64_t)v142);
  if (qword_183B0 != -1) {
    swift_once();
  }
  long long v73 = xmmword_199F8;
  v144[8] = xmmword_19A08;
  v144[9] = xmmword_19A18;
  long long v74 = xmmword_19A18;
  v144[10] = xmmword_19A28;
  long long v75 = xmmword_199C8;
  long long v76 = xmmword_199B8;
  v144[4] = xmmword_199C8;
  v144[5] = xmmword_199D8;
  long long v77 = xmmword_199D8;
  long long v78 = xmmword_199E8;
  v144[6] = xmmword_199E8;
  v144[7] = xmmword_199F8;
  v144[0] = xmmword_19988;
  v144[1] = *(_OWORD *)&qword_19998;
  long long v80 = xmmword_19988;
  long long v79 = *(_OWORD *)&qword_19998;
  long long v81 = xmmword_199A8;
  v144[2] = xmmword_199A8;
  v144[3] = xmmword_199B8;
  *(_OWORD *)(v0 + 1632) = xmmword_19A08;
  *(_OWORD *)(v0 + 1648) = v74;
  *(_OWORD *)(v0 + 1664) = xmmword_19A28;
  *(_OWORD *)(v0 + 1568) = v75;
  *(_OWORD *)(v0 + 1584) = v77;
  *(_OWORD *)(v0 + 1600) = v78;
  *(_OWORD *)(v0 + 1616) = v73;
  *(_OWORD *)(v0 + 1504) = v80;
  *(_OWORD *)(v0 + 1520) = v79;
  uint64_t v145 = qword_19A38;
  *(void *)(v0 + 1680) = qword_19A38;
  *(_OWORD *)(v0 + 1536) = v81;
  *(_OWORD *)(v0 + 1552) = v76;
  sub_66D0((uint64_t)v144);
  if (qword_183B8 != -1) {
    swift_once();
  }
  long long v82 = xmmword_19AB0;
  v146[8] = xmmword_19AC0;
  v146[9] = xmmword_19AD0;
  long long v83 = xmmword_19AD0;
  v146[10] = xmmword_19AE0;
  long long v84 = xmmword_19A80;
  long long v85 = xmmword_19A70;
  v146[4] = xmmword_19A80;
  v146[5] = xmmword_19A90;
  long long v86 = xmmword_19A90;
  long long v87 = xmmword_19AA0;
  v146[6] = xmmword_19AA0;
  v146[7] = xmmword_19AB0;
  v146[0] = xmmword_19A40;
  v146[1] = *(_OWORD *)&qword_19A50;
  long long v89 = xmmword_19A40;
  long long v88 = *(_OWORD *)&qword_19A50;
  long long v90 = xmmword_19A60;
  v146[2] = xmmword_19A60;
  v146[3] = xmmword_19A70;
  *(_OWORD *)(v0 + 1816) = xmmword_19AC0;
  *(_OWORD *)(v0 + 1832) = v83;
  *(_OWORD *)(v0 + 1848) = xmmword_19AE0;
  *(_OWORD *)(v0 + 1752) = v84;
  *(_OWORD *)(v0 + 1768) = v86;
  *(_OWORD *)(v0 + 1784) = v87;
  *(_OWORD *)(v0 + 1800) = v82;
  *(_OWORD *)(v0 + 1688) = v89;
  *(_OWORD *)(v0 + 1704) = v88;
  uint64_t v147 = qword_19AF0;
  *(void *)(v0 + 1864) = qword_19AF0;
  *(_OWORD *)(v0 + 1720) = v90;
  *(_OWORD *)(v0 + 1736) = v85;
  sub_66D0((uint64_t)v146);
  if (qword_18380 != -1) {
    swift_once();
  }
  long long v91 = xmmword_195A8;
  v148[8] = xmmword_195B8;
  v148[9] = xmmword_195C8;
  long long v92 = xmmword_195C8;
  v148[10] = xmmword_195D8;
  long long v93 = xmmword_19578;
  long long v94 = xmmword_19568;
  v148[4] = xmmword_19578;
  v148[5] = xmmword_19588;
  long long v95 = xmmword_19588;
  long long v96 = xmmword_19598;
  v148[6] = xmmword_19598;
  v148[7] = xmmword_195A8;
  v148[0] = xmmword_19538;
  v148[1] = *(_OWORD *)&qword_19548;
  long long v98 = xmmword_19538;
  long long v97 = *(_OWORD *)&qword_19548;
  long long v99 = xmmword_19558;
  v148[2] = xmmword_19558;
  v148[3] = xmmword_19568;
  *(_OWORD *)(v0 + 2000) = xmmword_195B8;
  *(_OWORD *)(v0 + 2016) = v92;
  *(_OWORD *)(v0 + 2032) = xmmword_195D8;
  *(_OWORD *)(v0 + 1936) = v93;
  *(_OWORD *)(v0 + 1952) = v95;
  *(_OWORD *)(v0 + 1968) = v96;
  *(_OWORD *)(v0 + 1984) = v91;
  *(_OWORD *)(v0 + 1872) = v98;
  *(_OWORD *)(v0 + 1888) = v97;
  uint64_t v149 = qword_195E8;
  *(void *)(v0 + 2048) = qword_195E8;
  *(_OWORD *)(v0 + 1904) = v99;
  *(_OWORD *)(v0 + 1920) = v94;
  sub_66D0((uint64_t)v148);
  if (qword_18388 != -1) {
    swift_once();
  }
  long long v100 = xmmword_19660;
  v150[8] = xmmword_19670;
  v150[9] = xmmword_19680;
  long long v101 = xmmword_19680;
  v150[10] = xmmword_19690;
  long long v102 = xmmword_19630;
  long long v103 = xmmword_19620;
  v150[4] = xmmword_19630;
  v150[5] = xmmword_19640;
  long long v104 = xmmword_19640;
  long long v105 = xmmword_19650;
  v150[6] = xmmword_19650;
  v150[7] = xmmword_19660;
  v150[0] = xmmword_195F0;
  v150[1] = *(_OWORD *)&qword_19600;
  long long v107 = xmmword_195F0;
  long long v106 = *(_OWORD *)&qword_19600;
  long long v108 = xmmword_19610;
  v150[2] = xmmword_19610;
  v150[3] = xmmword_19620;
  *(_OWORD *)(v0 + 2184) = xmmword_19670;
  *(_OWORD *)(v0 + 2200) = v101;
  *(_OWORD *)(v0 + 2216) = xmmword_19690;
  *(_OWORD *)(v0 + 2120) = v102;
  *(_OWORD *)(v0 + 2136) = v104;
  *(_OWORD *)(v0 + 2152) = v105;
  *(_OWORD *)(v0 + 2168) = v100;
  *(_OWORD *)(v0 + 2056) = v107;
  *(_OWORD *)(v0 + 2072) = v106;
  uint64_t v151 = qword_196A0;
  *(void *)(v0 + 2232) = qword_196A0;
  *(_OWORD *)(v0 + 2088) = v108;
  *(_OWORD *)(v0 + 2104) = v103;
  sub_66D0((uint64_t)v150);
  if (qword_18390 != -1) {
    swift_once();
  }
  long long v109 = xmmword_19718;
  v152[8] = xmmword_19728;
  v152[9] = xmmword_19738;
  long long v110 = xmmword_19738;
  v152[10] = xmmword_19748;
  long long v111 = xmmword_196E8;
  long long v112 = xmmword_196D8;
  v152[4] = xmmword_196E8;
  v152[5] = xmmword_196F8;
  long long v113 = xmmword_196F8;
  long long v114 = xmmword_19708;
  v152[6] = xmmword_19708;
  v152[7] = xmmword_19718;
  v152[0] = xmmword_196A8;
  v152[1] = *(_OWORD *)&qword_196B8;
  long long v116 = xmmword_196A8;
  long long v115 = *(_OWORD *)&qword_196B8;
  long long v117 = xmmword_196C8;
  v152[2] = xmmword_196C8;
  v152[3] = xmmword_196D8;
  *(_OWORD *)(v0 + 2368) = xmmword_19728;
  *(_OWORD *)(v0 + 2384) = v110;
  *(_OWORD *)(v0 + 2400) = xmmword_19748;
  *(_OWORD *)(v0 + 2304) = v111;
  *(_OWORD *)(v0 + 2320) = v113;
  *(_OWORD *)(v0 + 2336) = v114;
  *(_OWORD *)(v0 + 2352) = v109;
  *(_OWORD *)(v0 + 2240) = v116;
  *(_OWORD *)(v0 + 2256) = v115;
  uint64_t v153 = qword_19758;
  *(void *)(v0 + 2416) = qword_19758;
  *(_OWORD *)(v0 + 2272) = v117;
  *(_OWORD *)(v0 + 2288) = v112;
  sub_66D0((uint64_t)v152);
  if (qword_18398 != -1) {
    swift_once();
  }
  long long v118 = xmmword_197D0;
  v154[8] = xmmword_197E0;
  v154[9] = xmmword_197F0;
  long long v119 = xmmword_197F0;
  v154[10] = xmmword_19800;
  long long v120 = xmmword_197A0;
  long long v121 = xmmword_19790;
  v154[4] = xmmword_197A0;
  v154[5] = xmmword_197B0;
  long long v122 = xmmword_197B0;
  long long v123 = xmmword_197C0;
  v154[6] = xmmword_197C0;
  v154[7] = xmmword_197D0;
  v154[0] = xmmword_19760;
  v154[1] = *(_OWORD *)&qword_19770;
  long long v125 = xmmword_19760;
  long long v124 = *(_OWORD *)&qword_19770;
  long long v126 = xmmword_19780;
  v154[2] = xmmword_19780;
  v154[3] = xmmword_19790;
  *(_OWORD *)(v0 + 2552) = xmmword_197E0;
  *(_OWORD *)(v0 + 2568) = v119;
  *(_OWORD *)(v0 + 2584) = xmmword_19800;
  *(_OWORD *)(v0 + 2488) = v120;
  *(_OWORD *)(v0 + 2504) = v122;
  *(_OWORD *)(v0 + 2520) = v123;
  *(_OWORD *)(v0 + 2536) = v118;
  *(_OWORD *)(v0 + 2424) = v125;
  *(_OWORD *)(v0 + 2440) = v124;
  uint64_t v155 = qword_19810;
  *(void *)(v0 + 2600) = qword_19810;
  *(_OWORD *)(v0 + 2456) = v126;
  *(_OWORD *)(v0 + 2472) = v121;
  sub_66D0((uint64_t)v154);
  return v0;
}

uint64_t sub_10A60(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_68C4(&qword_186F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

_OWORD *sub_10AC8(long long *a1, _OWORD *a2)
{
  long long v2 = *a1;
  long long v3 = a1[2];
  a2[1] = a1[1];
  a2[2] = v3;
  *a2 = v2;
  return a2;
}

uint64_t sub_10AE0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_68C4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void *sub_10B44(uint64_t a1)
{
  uint64_t v2 = sub_FF90();
  uint64_t v3 = *(void *)(v2 + 16);
  if (!v3)
  {
    swift_bridgeObjectRelease();
    return &_swiftEmptyArrayStorage;
  }
  uint64_t v4 = v3 - 1;
  uint64_t v5 = &_swiftEmptyArrayStorage;
  for (uint64_t i = 32; ; i += 184)
  {
    long long v7 = *(_OWORD *)(v2 + i);
    long long v8 = *(_OWORD *)(v2 + i + 16);
    long long v9 = *(_OWORD *)(v2 + i + 48);
    long long v34 = *(_OWORD *)(v2 + i + 32);
    long long v35 = v9;
    long long v32 = v7;
    long long v33 = v8;
    long long v10 = *(_OWORD *)(v2 + i + 64);
    long long v11 = *(_OWORD *)(v2 + i + 80);
    long long v12 = *(_OWORD *)(v2 + i + 112);
    long long v38 = *(_OWORD *)(v2 + i + 96);
    long long v39 = v12;
    long long v36 = v10;
    long long v37 = v11;
    long long v13 = *(_OWORD *)(v2 + i + 128);
    long long v14 = *(_OWORD *)(v2 + i + 144);
    long long v15 = *(_OWORD *)(v2 + i + 160);
    uint64_t v43 = *(void *)(v2 + i + 176);
    long long v41 = v14;
    long long v42 = v15;
    long long v40 = v13;
    if (!(void)v12) {
      goto LABEL_10;
    }
    sub_68C4(&qword_18900);
    uint64_t v16 = swift_allocObject();
    *(_OWORD *)(v16 + 16) = xmmword_118A0;
    *(void *)(v16 + 32) = a1;
    sub_66D0((uint64_t)&v32);
    swift_bridgeObjectRetain();
    sub_68C4(&qword_18908);
    sub_10DA0();
    sub_10DFC(&qword_18918, (void (*)(uint64_t))type metadata accessor for INMediaItemType);
    char v17 = sub_114A0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v17 & 1) == 0) {
      break;
    }
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    long long v44 = v5;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      sub_800C(0, v5[2] + 1, 1);
      uint64_t v5 = v44;
    }
    unint64_t v20 = v5[2];
    unint64_t v19 = v5[3];
    if (v20 >= v19 >> 1)
    {
      sub_800C(v19 > 1, v20 + 1, 1);
      uint64_t v5 = v44;
    }
    v5[2] = v20 + 1;
    long long v21 = (char *)&v5[23 * v20];
    long long v22 = v32;
    long long v23 = v33;
    long long v24 = v35;
    *((_OWORD *)v21 + 4) = v34;
    *((_OWORD *)v21 + 5) = v24;
    *((_OWORD *)v21 + 2) = v22;
    *((_OWORD *)v21 + 3) = v23;
    long long v25 = v36;
    long long v26 = v37;
    long long v27 = v39;
    *((_OWORD *)v21 + 8) = v38;
    *((_OWORD *)v21 + 9) = v27;
    *((_OWORD *)v21 + 6) = v25;
    *((_OWORD *)v21 + 7) = v26;
    long long v28 = v40;
    long long v29 = v41;
    long long v30 = v42;
    *((void *)v21 + 26) = v43;
    *((_OWORD *)v21 + 11) = v29;
    *((_OWORD *)v21 + 12) = v30;
    *((_OWORD *)v21 + 10) = v28;
LABEL_10:
    if (!v4) {
      goto LABEL_14;
    }
LABEL_13:
    --v4;
  }
  sub_67C8((uint64_t)&v32);
  if (v4) {
    goto LABEL_13;
  }
LABEL_14:
  swift_bridgeObjectRelease();
  return v5;
}

unint64_t sub_10DA0()
{
  unint64_t result = qword_18910;
  if (!qword_18910)
  {
    sub_9C90(&qword_18908);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18910);
  }
  return result;
}

uint64_t sub_10DFC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10E44(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_14960;
  v6._object = a2;
  unint64_t v4 = sub_11570(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 0xE) {
    return 14;
  }
  else {
    return v4;
  }
}

uint64_t sub_10E90(uint64_t a1, void *a2)
{
  v6._countAndFlagsBits = a1;
  v3._rawValue = &off_14AD0;
  v6._object = a2;
  unint64_t v4 = sub_11570(v3, v6);
  swift_bridgeObjectRelease();
  if (v4 >= 5) {
    return 5;
  }
  else {
    return v4;
  }
}

uint64_t getEnumTagSinglePayload for AudioSuggestion.SuggestionType(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF3) {
    goto LABEL_17;
  }
  if (a2 + 13 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 13) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 13;
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
      return (*a1 | (v4 << 8)) - 13;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 13;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 0xE;
  int v8 = v6 - 14;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AudioSuggestion.SuggestionType(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 13 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 13) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF2)
  {
    unsigned int v6 = ((a2 - 243) >> 8) + 1;
    *uint64_t result = a2 + 13;
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
        JUMPOUT(0x11038);
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
          *uint64_t result = a2 + 13;
        break;
    }
  }
  return result;
}

uint64_t sub_11060(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_11068(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for AudioSuggestion.SuggestionType()
{
  return &type metadata for AudioSuggestion.SuggestionType;
}

unint64_t sub_11084()
{
  unint64_t result = qword_18920;
  if (!qword_18920)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_18920);
  }
  return result;
}

uint64_t sub_110E0()
{
  return Locale.init(identifier:)();
}

uint64_t sub_110F0()
{
  return type metadata accessor for Locale();
}

uint64_t sub_11100()
{
  return dispatch thunk of SiriHelpSuggestionDetailsBuilderExtension.enableThirdPartyIntents(_:)();
}

uint64_t sub_11110()
{
  return dispatch thunk of SiriHelpSuggestionDetailsBuilderExtension.register(signals:)();
}

uint64_t sub_11120()
{
  return type metadata accessor for SiriHintsMode();
}

uint64_t sub_11130()
{
  return type metadata accessor for DeviceType();
}

uint64_t sub_11140()
{
  return type metadata accessor for IntentType();
}

uint64_t sub_11150()
{
  return type metadata accessor for DomainOwner();
}

uint64_t sub_11160()
{
  return DomainOwner.init(_:)();
}

uint64_t sub_11170()
{
  return dispatch thunk of Interaction.executionParameters.getter();
}

uint64_t sub_11180()
{
  return dispatch thunk of Interaction.verb.getter();
}

uint64_t sub_11190()
{
  return type metadata accessor for CoreSignalTypes();
}

uint64_t sub_111A0()
{
  return type metadata accessor for DeliveryVehicle();
}

uint64_t sub_111B0()
{
  return type metadata accessor for IntentParameter();
}

uint64_t sub_111C0()
{
  return dispatch thunk of CandidateSuggestion.context.getter();
}

uint64_t sub_111D0()
{
  return ResolvableParameter.__allocating_init(typeIdentifier:required:intentTransformer:)();
}

uint64_t sub_111E0()
{
  return type metadata accessor for ResolvableParameter();
}

uint64_t sub_111F0()
{
  return type metadata accessor for VersionedInvocation();
}

uint64_t sub_11200()
{
  return static VersionedInvocations.HintsDawnA.getter();
}

uint64_t sub_11210()
{
  return static OwnerDefinitionFactory.createOwnerDefinitions()();
}

uint64_t sub_11230()
{
  return dispatch thunk of SuggestionDetailsBuilder.templateRoot(_:)();
}

uint64_t sub_11240()
{
  return dispatch thunk of SuggestionDetailsBuilder.enabledDevices(_:)();
}

uint64_t sub_11250()
{
  return dispatch thunk of SuggestionDetailsBuilder.enabledLocales(_:)();
}

uint64_t sub_11260()
{
  return dispatch thunk of SuggestionDetailsBuilder.intentIdentifier(_:)();
}

uint64_t sub_11270()
{
  return dispatch thunk of SuggestionDetailsBuilder.loggingIdentifier(_:)();
}

uint64_t sub_11280()
{
  return dispatch thunk of SuggestionDetailsBuilder.enabledDeliveryVehicles(_:)();
}

uint64_t sub_11290()
{
  return dispatch thunk of SuggestionDetailsBuilder.validForInvocationTypes(_:)();
}

uint64_t sub_112A0()
{
  return dispatch thunk of SuggestionDetailsBuilder.exampleUtteranceDialogId(_:)();
}

uint64_t sub_112B0()
{
  return dispatch thunk of SuggestionDetailsBuilder.requiresNetworkConnection()();
}

uint64_t sub_112C0()
{
  return dispatch thunk of SuggestionDetailsBuilder.filter(_:)();
}

uint64_t sub_112D0()
{
  return SuggestionDetailsBuilder.parameter(parameterName:resolver:resolveParam:)();
}

uint64_t sub_112E0()
{
  return CandidateSuggestionFactory.create(suggestionId:params:objective:)();
}

uint64_t sub_112F0()
{
  return dispatch thunk of SuggestionOwnerDefinitionBuilder.withConversationalGenerator(_:)();
}

uint64_t sub_11300()
{
  return dispatch thunk of SuggestionOwnerDefinitionBuilder.add(suggestionId:catId:builder:)();
}

uint64_t sub_11310()
{
  return dispatch thunk of SuggestionOwnerDefinitionBuilder.build()();
}

uint64_t sub_11320()
{
  return static Signal.HomeScreen.getter();
}

uint64_t sub_11330()
{
  return Signal.__allocating_init(signalType:signalValue:fallbackSignals:)();
}

uint64_t sub_11340()
{
  return static Signal.DeviceLocked.getter();
}

uint64_t sub_11350()
{
  return static Signal.Fallback.getter();
}

uint64_t sub_11360()
{
  return type metadata accessor for Signal();
}

uint64_t sub_11370()
{
  return Context.getIntentParameter(name:)();
}

uint64_t sub_11380()
{
  return type metadata accessor for Objective();
}

uint64_t sub_11390()
{
  return Wrappable.getRoot()();
}

uint64_t sub_113A0()
{
  return Logger.logObject.getter();
}

uint64_t sub_113B0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_113C0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_113D0()
{
  return Dictionary.description.getter();
}

uint64_t sub_113E0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_113F0()
{
  return String.lowercased()()._countAndFlagsBits;
}

uint64_t sub_11400()
{
  return String.hash(into:)();
}

void sub_11410(Swift::String a1)
{
}

Swift::Int sub_11420()
{
  return String.UTF8View._foreignCount()();
}

BOOL sub_11430(Swift::String a1)
{
  return String.hasSuffix(_:)(a1);
}

uint64_t sub_11440()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_11450()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_11460()
{
  return specialized Array._endMutation()();
}

uint64_t sub_11470()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_11480()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_11490()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_114A0()
{
  return Collection<>.contains<A>(_:)();
}

uint64_t sub_114B0()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_114C0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_114D0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_114E0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_114F0()
{
  return StringProtocol.contains<A>(_:)();
}

uint64_t sub_11500()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_11510()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_11520()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_11530()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_11540()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_11550()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_11560()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_11570(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_11580()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_11590()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_115A0()
{
  return Hasher._finalize()();
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

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
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

uint64_t swift_retain_n()
{
  return _swift_retain_n();
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

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}