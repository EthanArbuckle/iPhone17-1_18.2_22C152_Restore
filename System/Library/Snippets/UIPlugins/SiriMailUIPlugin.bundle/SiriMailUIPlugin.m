uint64_t sub_1CF0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  void (*v35)(void);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(void);
  NSObject *v41;
  os_log_type_t v42;
  _WORD *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void (*v50)(void);
  uint64_t v51;
  NSObject *v52;
  os_log_type_t v53;
  uint8_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void (*v64)(void);
  NSObject *v65;
  os_log_type_t v66;
  _WORD *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t (**v71)(void);
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  void (*v79)(void);
  NSObject *v80;
  os_log_type_t v81;
  uint8_t *v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  long long v105;
  long long v106;
  uint64_t v107;
  unsigned char v108[40];
  long long v109;
  long long v110;
  uint64_t v111;

  v94 = a2;
  v104 = a1;
  v98 = sub_3710();
  sub_35C8();
  ((void (*)(void))__chkstk_darwin)();
  sub_35F4();
  sub_3618(v2);
  v90 = sub_3730();
  sub_35C8();
  ((void (*)(void))__chkstk_darwin)();
  sub_3628();
  sub_3608();
  v3 = ((uint64_t (*)(void))__chkstk_darwin)();
  v100 = (uint64_t)&v84 - v4;
  __chkstk_darwin(v3);
  v101 = (uint64_t)&v84 - v5;
  v93 = sub_36B0();
  sub_35C8();
  __chkstk_darwin(v6);
  sub_35F4();
  sub_3618(v7);
  v88 = sub_36E0();
  sub_35C8();
  __chkstk_darwin(v8);
  sub_35F4();
  sub_3618(v9);
  sub_3770();
  sub_35D8();
  v102 = v11;
  v103 = v10;
  __chkstk_darwin(v10);
  sub_3628();
  sub_3608();
  __chkstk_darwin(v12);
  sub_3608();
  __chkstk_darwin(v13);
  sub_3608();
  __chkstk_darwin(v14);
  v85 = (char *)&v84 - v15;
  v16 = sub_2A3C(&qword_8130);
  __chkstk_darwin(v16 - 8);
  sub_35F4();
  sub_3618(v17);
  v18 = sub_3690();
  sub_35C8();
  __chkstk_darwin(v19);
  sub_3628();
  sub_3608();
  __chkstk_darwin(v20);
  sub_3618((uint64_t)&v84 - v21);
  sub_36D0();
  sub_35C8();
  __chkstk_darwin(v22);
  v24 = (char *)&v84 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = sub_3750();
  sub_35D8();
  v27 = v26;
  v29 = __chkstk_darwin(v28);
  __chkstk_darwin(v29);
  v31 = (char *)&v84 - v30;
  sub_3680();
  sub_35C8();
  __chkstk_darwin(v32);
  v34 = (uint64_t *)((char *)&v84 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_33F0(v104, (uint64_t)v34, (void (*)(void))&type metadata accessor for MailPluginModel);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      v60 = v102;
      if (*(void *)(*v34 + 16) != 1) {
        goto LABEL_11;
      }
      v61 = v89;
      sub_28B4(*v34, v89);
      if (sub_3308(v61, 1, v18) == 1)
      {
        sub_3330(v61);
LABEL_11:
        sub_3740();
        v62 = v91;
        v63 = v103;
        sub_3654();
        v64();
        v65 = sub_3760();
        v66 = sub_37B0();
        if (os_log_type_enabled(v65, v66))
        {
          v67 = (_WORD *)swift_slowAlloc();
          *v67 = 0;
          sub_3660(&dword_0, v68, v69, "Picking ReadMessagesView");
          sub_363C((uint64_t)v67);
        }

        (*(void (**)(uint64_t, uint64_t))(v60 + 8))(v62, v63);
        v70 = v92;
        sub_36A0();
        sub_3450(&qword_8148, (void (*)(uint64_t))&type metadata accessor for MessageListView);
        v36 = sub_3780();
        v71 = &type metadata accessor for MessageListView;
        v72 = v70;
        goto LABEL_16;
      }
      swift_bridgeObjectRelease();
      v76 = v86;
      sub_3390(v61, v86, (void (*)(void))&type metadata accessor for WidgetMessage);
      sub_3740();
      v77 = v85;
      v78 = v103;
      sub_3654();
      v79();
      v80 = sub_3760();
      v81 = sub_37B0();
      if (os_log_type_enabled(v80, v81))
      {
        v82 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v82 = 0;
        _os_log_impl(&dword_0, v80, v81, "Picking MessageDetailView", v82, 2u);
        sub_363C((uint64_t)v82);
      }

      (*(void (**)(char *, uint64_t))(v60 + 8))(v77, v78);
      sub_33F0(v76, v84, (void (*)(void))&type metadata accessor for WidgetMessage);
      v83 = v87;
      sub_36F0();
      sub_3450(&qword_8150, (void (*)(uint64_t))&type metadata accessor for MessageDetailView);
      v36 = sub_3780();
      sub_3498(v83, (void (*)(void))&type metadata accessor for MessageDetailView);
      v71 = &type metadata accessor for WidgetMessage;
      v72 = v76;
LABEL_16:
      sub_3498(v72, (void (*)(void))v71);
      return v36;
    case 2u:
      sub_3740();
      v38 = v102;
      v37 = v103;
      v39 = v95;
      sub_3654();
      v40();
      v41 = sub_3760();
      v42 = sub_37B0();
      if (os_log_type_enabled(v41, v42))
      {
        v43 = (_WORD *)swift_slowAlloc();
        *v43 = 0;
        sub_3660(&dword_0, v44, v45, "Picking DisambiguationRecipientView");
        sub_363C((uint64_t)v43);
      }

      (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v39, v37);
      sub_3720();
      v109 = *(_OWORD *)&v108[8];
      v110 = *(_OWORD *)&v108[24];
      v111 = *(void *)v108;
      v105 = *(_OWORD *)v108;
      v106 = *(_OWORD *)&v108[16];
      v107 = *(void *)&v108[32];
      sub_3238();
      v36 = sub_3780();
      sub_3284((uint64_t)&v111);
      sub_32B0((uint64_t)&v109);
      sub_32DC((id *)&v110);
      return v36;
    case 3u:
      v46 = v101;
      sub_3390((uint64_t)v34, v101, (void (*)(void))&type metadata accessor for DisambiguateHandlesDataModel);
      sub_3740();
      v48 = v102;
      v47 = v103;
      v49 = v99;
      sub_3654();
      v50();
      v51 = v100;
      sub_33F0(v46, v100, (void (*)(void))&type metadata accessor for DisambiguateHandlesDataModel);
      v52 = sub_3760();
      v53 = sub_37B0();
      if (os_log_type_enabled(v52, v53))
      {
        v54 = (uint8_t *)swift_slowAlloc();
        v55 = swift_slowAlloc();
        *(void *)v108 = v55;
        *(_DWORD *)v54 = 136315138;
        v56 = v51;
        v57 = v96;
        sub_33F0(v56, v96, (void (*)(void))&type metadata accessor for DisambiguateHandlesDataModel);
        v58 = sub_3790();
        *(void *)&v105 = sub_2A80(v58, v59, (uint64_t *)v108);
        sub_37C0();
        swift_bridgeObjectRelease();
        sub_3498(v100, (void (*)(void))&type metadata accessor for DisambiguateHandlesDataModel);
        _os_log_impl(&dword_0, v52, v53, "Picking DisambiguationHandleView: %s", v54, 0xCu);
        swift_arrayDestroy();
        sub_363C(v55);
        sub_363C((uint64_t)v54);

        (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v99, v103);
      }
      else
      {
        sub_3498(v51, (void (*)(void))&type metadata accessor for DisambiguateHandlesDataModel);

        (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v49, v47);
        v57 = v96;
      }
      v73 = v101;
      sub_33F0(v101, v57, (void (*)(void))&type metadata accessor for DisambiguateHandlesDataModel);
      v74 = v97;
      sub_3700();
      sub_3450(&qword_8138, (void (*)(uint64_t))&type metadata accessor for DisambiguateHandlesView);
      v36 = sub_3780();
      sub_3498(v74, (void (*)(void))&type metadata accessor for DisambiguateHandlesView);
      v71 = &type metadata accessor for DisambiguateHandlesDataModel;
      v72 = v73;
      goto LABEL_16;
    default:
      (*(void (**)(char *, uint64_t *, uint64_t))(v27 + 32))(v31, v34, v25);
      sub_3654();
      v35();
      sub_36C0();
      sub_3450(&qword_8158, (void (*)(uint64_t))&type metadata accessor for SendMessageView);
      v36 = sub_3780();
      sub_3498((uint64_t)v24, (void (*)(void))&type metadata accessor for SendMessageView);
      (*(void (**)(char *, uint64_t))(v27 + 8))(v31, v25);
      return v36;
  }
}

uint64_t sub_28B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 16);
  uint64_t v5 = sub_3690();
  uint64_t v6 = v5;
  if (v4)
  {
    sub_33F0(a1+ ((*(unsigned __int8 *)(*(void *)(v5 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v5 - 8) + 80)), a2, (void (*)(void))&type metadata accessor for WidgetMessage);
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = 1;
  }

  return sub_34F0(a2, v7, 1, v6);
}

uint64_t sub_2970()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for SiriMailUIPlugin()
{
  return self;
}

uint64_t sub_29A4()
{
  return swift_allocObject();
}

uint64_t sub_29B4()
{
  return sub_3450(&qword_8128, (void (*)(uint64_t))&type metadata accessor for MailPluginModel);
}

uint64_t sub_29FC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_29A4();
  *a1 = result;
  return result;
}

uint64_t sub_2A24(uint64_t a1, uint64_t a2)
{
  return sub_1CF0(a1, a2);
}

uint64_t sub_2A3C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_2A80(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2B54(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_3568((uint64_t)v12, *a3);
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
      sub_3568((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_3518(v12);
  return v7;
}

uint64_t sub_2B54(void *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_2CAC((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_37D0();
      uint64_t result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    uint64_t result = (uint64_t)sub_2D84(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    uint64_t v8 = sub_37F0();
    if (!v8)
    {
      uint64_t result = sub_3800();
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

void *sub_2CAC(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_3810();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

void *sub_2D84(uint64_t a1, unint64_t a2)
{
  v2 = sub_2E1C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    v2 = sub_2FF8(0, v2[2] + 1, 1, (uint64_t)v2);
  }
  unint64_t v4 = v2[2];
  unint64_t v3 = v2[3];
  if (v4 >= v3 >> 1) {
    v2 = sub_2FF8((char *)(v3 > 1), v4 + 1, 1, (uint64_t)v2);
  }
  v2[2] = v4 + 1;
  *((unsigned char *)v2 + v4 + 32) = 0;
  return v2;
}

void *sub_2E1C(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0)
  {
    Swift::Int v2 = sub_37A0();
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
  unint64_t v3 = sub_2F90(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    unint64_t v4 = v3;
    uint64_t v5 = sub_37E0();
    if ((v6 & 1) != 0 || v5 != v2) {
      goto LABEL_14;
    }
    return v4;
  }
  sub_3810();
  __break(1u);
LABEL_14:
  uint64_t result = (void *)sub_3800();
  __break(1u);
  return result;
}

void *sub_2F90(uint64_t a1, uint64_t a2)
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
  sub_2A3C((uint64_t *)&unk_8160);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_2FF8(char *result, int64_t a2, char a3, uint64_t a4)
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
    sub_2A3C((uint64_t *)&unk_8160);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if (v5)
  {
    sub_31A8(v13, v8, v12);
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_30D0(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_30D0(char *__src, size_t __n, char *__dst)
{
  if ((__n & 0x8000000000000000) != 0 || (&__dst[__n] > __src ? (BOOL v3 = &__src[__n] > __dst) : (BOOL v3 = 0), v3))
  {
    uint64_t result = (void *)sub_3810();
    __break(1u);
  }
  else
  {
    return memcpy(__dst, __src, __n);
  }
  return result;
}

char *sub_31A8(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_3810();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

unint64_t sub_3238()
{
  unint64_t result = qword_8140;
  if (!qword_8140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_8140);
  }
  return result;
}

uint64_t sub_3284(uint64_t a1)
{
  return a1;
}

uint64_t sub_32B0(uint64_t a1)
{
  return a1;
}

id *sub_32DC(id *a1)
{
  return a1;
}

uint64_t sub_3308(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_3330(uint64_t a1)
{
  uint64_t v2 = sub_2A3C(&qword_8130);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_3390(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_35C8();
  (*(void (**)(uint64_t, uint64_t))(v5 + 32))(a2, a1);
  return a2;
}

uint64_t sub_33F0(uint64_t a1, uint64_t a2, void (*a3)(void))
{
  a3(0);
  sub_35C8();
  (*(void (**)(uint64_t, uint64_t))(v5 + 16))(a2, a1);
  return a2;
}

uint64_t sub_3450(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_3498(uint64_t a1, void (*a2)(void))
{
  a2(0);
  sub_35C8();
  (*(void (**)(uint64_t))(v3 + 8))(a1);
  return a1;
}

uint64_t sub_34F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_3518(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return _swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_3568(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_3608()
{
  *(void *)(v1 - 256) = v0;
}

uint64_t sub_3618@<X0>(uint64_t a1@<X8>)
{
  *(void *)(v1 - 256) = a1;
  return 0;
}

uint64_t sub_363C(uint64_t a1)
{
  return _swift_slowDealloc(a1, -1, -1);
}

void sub_3660(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_impl(a1, v4, v5, a4, v6, 2u);
}

uint64_t sub_3680()
{
  return type metadata accessor for MailPluginModel();
}

uint64_t sub_3690()
{
  return type metadata accessor for WidgetMessage();
}

uint64_t sub_36A0()
{
  return MessageListView.init(mode:messages:numberOfSummaryLines:)();
}

uint64_t sub_36B0()
{
  return type metadata accessor for MessageListView();
}

uint64_t sub_36C0()
{
  return SendMessageView.init(message:)();
}

uint64_t sub_36D0()
{
  return type metadata accessor for SendMessageView();
}

uint64_t sub_36E0()
{
  return type metadata accessor for MessageDetailView();
}

uint64_t sub_36F0()
{
  return MessageDetailView.init(_:numberOfSummaryLines:)();
}

uint64_t sub_3700()
{
  return DisambiguateHandlesView.init(model:)();
}

uint64_t sub_3710()
{
  return type metadata accessor for DisambiguateHandlesView();
}

uint64_t sub_3720()
{
  return DisambiguateRecipientView.init(model:)();
}

uint64_t sub_3730()
{
  return type metadata accessor for DisambiguateHandlesDataModel();
}

uint64_t sub_3740()
{
  return Logger.siriMail.unsafeMutableAddressor();
}

uint64_t sub_3750()
{
  return type metadata accessor for _SiriMailMessage();
}

uint64_t sub_3760()
{
  return Logger.logObject.getter();
}

uint64_t sub_3770()
{
  return type metadata accessor for Logger();
}

uint64_t sub_3780()
{
  return View.eraseToAnyView()();
}

uint64_t sub_3790()
{
  return String.init<A>(describing:)();
}

Swift::Int sub_37A0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_37B0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_37C0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_37D0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_37E0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_37F0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_3800()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_3810()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
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

uint64_t self
{
  return _self;
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}