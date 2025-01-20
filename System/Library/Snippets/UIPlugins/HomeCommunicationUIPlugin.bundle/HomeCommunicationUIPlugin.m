uint64_t sub_1808()
{
  return 1;
}

Swift::Int sub_1810()
{
  return sub_3650();
}

void sub_1854()
{
}

Swift::Int sub_187C()
{
  return sub_3650();
}

uint64_t HomeCommunicationUIPlugin.__allocating_init()()
{
  return swift_allocObject();
}

uint64_t HomeCommunicationUIPlugin.deinit()
{
  return v0;
}

NSObject *HomeCommunicationUIPlugin.snippet(for:mode:idiom:)(uint64_t a1)
{
  return sub_1FA8(a1);
}

uint64_t HomeCommunicationUIPlugin.__deallocating_deinit()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t sub_191C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = swift_allocObject();
  *a1 = result;
  return result;
}

uint64_t sub_1950(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_1A24(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_2F18((uint64_t)v12, *a3);
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
      sub_2F18((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_2EC8(v12);
  return v7;
}

uint64_t sub_1A24(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_3590();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1BE0(a5, a6);
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
  uint64_t v8 = sub_35B0();
  if (!v8)
  {
    sub_35C0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_35D0();
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

uint64_t sub_1BE0(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1C78(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1E58(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1E58(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1C78(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_1DF0(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_35A0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_35C0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_3550();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_35D0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_35C0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_1DF0(uint64_t a1, uint64_t a2)
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
  sub_2F74(&qword_8170);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1E58(char a1, int64_t a2, char a3, char *a4)
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
    sub_2F74(&qword_8170);
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
  v13 = a4 + 32;
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
  uint64_t result = sub_35D0();
  __break(1u);
  return result;
}

NSObject *sub_1FA8(uint64_t a1)
{
  uint64_t v3 = sub_34C0();
  uint64_t v75 = *(void *)(v3 - 8);
  ((void (*)(void))__chkstk_darwin)();
  v73 = (char *)&v65 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = sub_3500();
  uint64_t v72 = *(void *)(v74 - 8);
  uint64_t v5 = ((uint64_t (*)(void))__chkstk_darwin)();
  v70 = (char *)&v65 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v71 = (char *)&v65 - v7;
  uint64_t v8 = sub_3480();
  uint64_t v82 = *(void *)(v8 - 8);
  uint64_t v83 = v8;
  __chkstk_darwin(v8);
  v80 = (char *)&v65 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = sub_3490();
  uint64_t v79 = *(void *)(v81 - 8);
  uint64_t v10 = __chkstk_darwin(v81);
  v77 = (char *)&v65 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v78 = (char *)&v65 - v12;
  uint64_t v13 = sub_34E0();
  uint64_t v89 = *(void *)(v13 - 8);
  uint64_t v90 = v13;
  __chkstk_darwin(v13);
  v87 = (char *)&v65 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v88 = sub_34F0();
  uint64_t v86 = *(void *)(v88 - 8);
  uint64_t v15 = __chkstk_darwin(v88);
  v84 = (char *)&v65 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v85 = (char *)&v65 - v17;
  uint64_t v18 = sub_3450();
  uint64_t v96 = *(void *)(v18 - 8);
  uint64_t v97 = v18;
  __chkstk_darwin(v18);
  v94 = (char *)&v65 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v95 = sub_3460();
  uint64_t v93 = *(void *)(v95 - 8);
  uint64_t v20 = __chkstk_darwin(v95);
  v91 = (char *)&v65 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  v92 = (char *)&v65 - v22;
  uint64_t v23 = sub_34A0();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = __chkstk_darwin(v23);
  v76 = (char *)&v65 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __chkstk_darwin(v25);
  v100 = (char *)&v65 - v28;
  __chkstk_darwin(v27);
  v30 = (char *)&v65 - v29;
  if (qword_8098 != -1) {
    swift_once();
  }
  uint64_t v31 = sub_3530();
  uint64_t v32 = sub_2DF4(v31, (uint64_t)static Logger.siriHomeCommunicationUIPlugin);
  v98 = *(void (**)(char *, uint64_t, uint64_t))(v24 + 16);
  uint64_t v99 = a1;
  v98(v30, a1, v23);
  uint64_t v69 = v32;
  v33 = sub_3510();
  uint64_t v34 = v24;
  os_log_type_t v35 = sub_3560();
  if (os_log_type_enabled(v33, v35))
  {
    uint64_t v68 = v24;
    uint64_t v36 = swift_slowAlloc();
    uint64_t v66 = v3;
    v37 = (uint8_t *)v36;
    uint64_t v38 = swift_slowAlloc();
    uint64_t v67 = v1;
    uint64_t v102 = v38;
    *(_DWORD *)v37 = 136315138;
    v65 = v37 + 4;
    sub_2E80(&qword_8148, (void (*)(uint64_t))&type metadata accessor for HomeCommunicationSnippetModel);
    uint64_t v39 = sub_35E0();
    uint64_t v101 = sub_1950(v39, v40, &v102);
    sub_3580();
    swift_bridgeObjectRelease();
    uint64_t v34 = v68;
    v41 = *(void (**)(char *, uint64_t))(v68 + 8);
    v41(v30, v23);
    _os_log_impl(&dword_0, v33, v35, "#HomeCommunicationUIPlugin getting snippet for %s", v37, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v3 = v66;
    swift_slowDealloc();
  }
  else
  {
    v41 = *(void (**)(char *, uint64_t))(v24 + 8);
    v41(v30, v23);
  }

  uint64_t v42 = v34;
  uint64_t v43 = v99;
  v44 = v100;
  v45 = v98;
  v98(v100, v99, v23);
  int v46 = (*(uint64_t (**)(char *, uint64_t))(v42 + 88))(v44, v23);
  if (v46 == enum case for HomeCommunicationSnippetModel.appLaunch(_:))
  {
    (*(void (**)(char *, uint64_t))(v42 + 96))(v44, v23);
    v48 = v92;
    uint64_t v47 = v93;
    uint64_t v49 = v95;
    (*(void (**)(char *, char *, uint64_t))(v93 + 32))(v92, v44, v95);
    (*(void (**)(char *, char *, uint64_t))(v47 + 16))(v91, v48, v49);
    v50 = v94;
    sub_3440();
    sub_2E80(&qword_8168, (void (*)(uint64_t))&type metadata accessor for HomeAppLaunchView);
    uint64_t v51 = v97;
    v52 = sub_3540();
    uint64_t v53 = v96;
LABEL_12:
    (*(void (**)(char *, uint64_t))(v53 + 8))(v50, v51);
    (*(void (**)(char *, uint64_t))(v47 + 8))(v48, v49);
    return v52;
  }
  if (v46 == enum case for HomeCommunicationSnippetModel.carPlayIntercomControl(_:))
  {
    (*(void (**)(char *, uint64_t))(v42 + 96))(v44, v23);
    v48 = v85;
    uint64_t v47 = v86;
    uint64_t v49 = v88;
    (*(void (**)(char *, char *, uint64_t))(v86 + 32))(v85, v44, v88);
    (*(void (**)(char *, char *, uint64_t))(v47 + 16))(v84, v48, v49);
    v50 = v87;
    sub_34D0();
    sub_2E80(&qword_8160, (void (*)(uint64_t))&type metadata accessor for CarPlayIntercomControlView);
    uint64_t v51 = v90;
    v52 = sub_3540();
    uint64_t v53 = v89;
    goto LABEL_12;
  }
  if (v46 == enum case for HomeCommunicationSnippetModel.homeDisambiguation(_:))
  {
    (*(void (**)(char *, uint64_t))(v42 + 96))(v44, v23);
    uint64_t v47 = v79;
    v48 = v78;
    uint64_t v49 = v81;
    (*(void (**)(char *, char *, uint64_t))(v79 + 32))(v78, v44, v81);
    (*(void (**)(char *, char *, uint64_t))(v47 + 16))(v77, v48, v49);
    v50 = v80;
    sub_3470();
    sub_2E80(&qword_8158, (void (*)(uint64_t))&type metadata accessor for HomeDisambiguationView);
    uint64_t v51 = v83;
    v52 = sub_3540();
    uint64_t v53 = v82;
    goto LABEL_12;
  }
  if (v46 == enum case for HomeCommunicationSnippetModel.sendAnnouncementNeedsValue(_:))
  {
    (*(void (**)(char *, uint64_t))(v42 + 96))(v44, v23);
    uint64_t v55 = v72;
    v56 = v71;
    uint64_t v57 = v74;
    (*(void (**)(char *, char *, uint64_t))(v72 + 32))(v71, v44, v74);
    (*(void (**)(char *, char *, uint64_t))(v55 + 16))(v70, v56, v57);
    v58 = v73;
    sub_34B0();
    sub_2E80(&qword_8150, (void (*)(uint64_t))&type metadata accessor for SendAnnouncementView);
    v52 = sub_3540();
    (*(void (**)(char *, uint64_t))(v75 + 8))(v58, v3);
    (*(void (**)(char *, uint64_t))(v55 + 8))(v56, v57);
  }
  else
  {
    v59 = v76;
    v45(v76, v43, v23);
    v52 = sub_3510();
    os_log_type_t v60 = sub_3570();
    if (os_log_type_enabled(v52, v60))
    {
      uint64_t v61 = swift_slowAlloc();
      uint64_t v68 = v42;
      v62 = (uint8_t *)v61;
      uint64_t v102 = swift_slowAlloc();
      *(_DWORD *)v62 = 136315138;
      sub_2E80(&qword_8148, (void (*)(uint64_t))&type metadata accessor for HomeCommunicationSnippetModel);
      uint64_t v63 = sub_35E0();
      uint64_t v101 = sub_1950(v63, v64, &v102);
      v44 = v100;
      sub_3580();
      swift_bridgeObjectRelease();
      v41(v76, v23);
      _os_log_impl(&dword_0, v52, v60, "#HomeCommunicationUIPlugin unknown snippet model %s. Throwing.", v62, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      v41(v59, v23);
    }

    sub_2E2C();
    swift_allocError();
    swift_willThrow();
    v41(v44, v23);
  }
  return v52;
}

uint64_t sub_2D88()
{
  return sub_2E80(&qword_80A0, (void (*)(uint64_t))&type metadata accessor for HomeCommunicationSnippetModel);
}

uint64_t type metadata accessor for HomeCommunicationUIPlugin()
{
  return self;
}

uint64_t sub_2DF4(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_2E2C()
{
  unint64_t result = qword_8140;
  if (!qword_8140)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_8140);
  }
  return result;
}

uint64_t sub_2E80(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2EC8(void *a1)
{
  uint64_t v1 = *(void *)(a1[3] - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return _swift_release(*a1);
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_2F18(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_2F74(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t getEnumTagSinglePayload for HomeCommunicationUIPlugin.HomeCommunicationUIPluginError(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for HomeCommunicationUIPlugin.HomeCommunicationUIPluginError(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x30B0);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_30D8()
{
  return 0;
}

ValueMetadata *type metadata accessor for HomeCommunicationUIPlugin.HomeCommunicationUIPluginError()
{
  return &type metadata for HomeCommunicationUIPlugin.HomeCommunicationUIPluginError;
}

unint64_t sub_30FC()
{
  unint64_t result = qword_8178;
  if (!qword_8178)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_8178);
  }
  return result;
}

uint64_t Logger.siriHomeCommunicationUIPlugin.unsafeMutableAddressor()
{
  return sub_31BC(&qword_8098, (uint64_t)static Logger.siriHomeCommunicationUIPlugin);
}

uint64_t sub_3174(uint64_t a1)
{
  return sub_3258(a1, static Logger.siriHomeCommunicationUIFramework);
}

uint64_t Logger.siriHomeCommunicationUIFramework.unsafeMutableAddressor()
{
  return sub_31BC(&qword_8090, (uint64_t)static Logger.siriHomeCommunicationUIFramework);
}

uint64_t sub_31BC(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_3530();

  return sub_2DF4(v3, a2);
}

uint64_t static Logger.siriHomeCommunicationUIFramework.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_32F4(&qword_8090, (uint64_t)static Logger.siriHomeCommunicationUIFramework, a1);
}

uint64_t sub_3234(uint64_t a1)
{
  return sub_3258(a1, static Logger.siriHomeCommunicationUIPlugin);
}

uint64_t sub_3258(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_3530();
  sub_339C(v3, a2);
  sub_2DF4(v3, (uint64_t)a2);
  return sub_3520();
}

uint64_t static Logger.siriHomeCommunicationUIPlugin.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_32F4(&qword_8098, (uint64_t)static Logger.siriHomeCommunicationUIPlugin, a1);
}

uint64_t sub_32F4@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_3530();
  uint64_t v6 = sub_2DF4(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

ValueMetadata *type metadata accessor for Logger()
{
  return &type metadata for Logger;
}

uint64_t *sub_339C(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_3400()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t sub_3410()
{
  return LocalizedError.failureReason.getter();
}

uint64_t sub_3420()
{
  return LocalizedError.errorDescription.getter();
}

uint64_t sub_3430()
{
  return LocalizedError.recoverySuggestion.getter();
}

uint64_t sub_3440()
{
  return HomeAppLaunchView.init(model:)();
}

uint64_t sub_3450()
{
  return type metadata accessor for HomeAppLaunchView();
}

uint64_t sub_3460()
{
  return type metadata accessor for HomeAppLaunchModel();
}

uint64_t sub_3470()
{
  return HomeDisambiguationView.init(model:)();
}

uint64_t sub_3480()
{
  return type metadata accessor for HomeDisambiguationView();
}

uint64_t sub_3490()
{
  return type metadata accessor for HomeDisambiguationModel();
}

uint64_t sub_34A0()
{
  return type metadata accessor for HomeCommunicationSnippetModel();
}

uint64_t sub_34B0()
{
  return SendAnnouncementView.init(model:)();
}

uint64_t sub_34C0()
{
  return type metadata accessor for SendAnnouncementView();
}

uint64_t sub_34D0()
{
  return CarPlayIntercomControlView.init(model:)();
}

uint64_t sub_34E0()
{
  return type metadata accessor for CarPlayIntercomControlView();
}

uint64_t sub_34F0()
{
  return type metadata accessor for CarPlayIntercomControlModel();
}

uint64_t sub_3500()
{
  return type metadata accessor for SendAnnouncementNeedsValueModel();
}

uint64_t sub_3510()
{
  return Logger.logObject.getter();
}

uint64_t sub_3520()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_3530()
{
  return type metadata accessor for Logger();
}

uint64_t sub_3540()
{
  return View.eraseToAnyView()();
}

Swift::Int sub_3550()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_3560()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_3570()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_3580()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_3590()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_35A0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_35B0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_35C0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_35D0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_35E0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_35F0()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_3600()
{
  return Error._code.getter();
}

uint64_t sub_3610()
{
  return Error._domain.getter();
}

uint64_t sub_3620()
{
  return Error._userInfo.getter();
}

uint64_t sub_3630()
{
  return Hasher.init(_seed:)();
}

void sub_3640(Swift::UInt a1)
{
}

Swift::Int sub_3650()
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

uint64_t self
{
  return _self;
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

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
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

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}