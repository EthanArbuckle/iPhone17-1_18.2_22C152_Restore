uint64_t sub_1000027F4()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  NSString v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  char *v15;
  char *v16;
  char *v17;
  NSObject *v18;
  os_log_type_t v19;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  id v25;
  char *v26;
  char *v27;
  NSObject *v28;
  os_log_type_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v39;
  unint64_t v40;
  void *v41;
  char *v42;
  unint64_t *v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSURL *v49;
  void *v50;
  void *v51;
  id v52;
  NSObject *v53;
  os_log_type_t v54;
  uint8_t *v55;
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v62;
  char *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  Swift::String v69;
  Swift::String v70;

  v1 = *(void *)(sub_100006D9C(&qword_10000C1F0) - 8);
  v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  v4 = (char *)&v62 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  v6 = (char *)&v62 - v5;
  v67 = &_swiftEmptyArrayStorage;
  v7 = [self defaultManager];
  v9 = *(void *)&v0[OBJC_IVAR____TtC13STSDiagnostic22STSDiagnosticExtension_logPath];
  v8 = *(void *)&v0[OBJC_IVAR____TtC13STSDiagnostic22STSDiagnosticExtension_logPath + 8];
  v10 = sub_1000070F8();
  v68 = 0;
  v11 = [v7 contentsOfDirectoryAtPath:v10 error:&v68];

  v12 = (id)v68;
  if (v11)
  {
    v13 = sub_100007158();
    v14 = v12;

    v15 = &v0[OBJC_IVAR____TtC13STSDiagnostic22STSDiagnosticExtension_logger];
    v16 = v0;
    swift_bridgeObjectRetain_n();
    v17 = v16;
    v64 = v15;
    v18 = sub_1000070B8();
    v19 = sub_1000071B8();
    v20 = os_log_type_enabled(v18, v19);
    v65 = v13;
    v62 = v1;
    v63 = v17;
    if (v20)
    {
      v21 = swift_slowAlloc();
      v68 = swift_slowAlloc();
      *(_DWORD *)v21 = 136315394;
      swift_bridgeObjectRetain();
      v66 = sub_100003CD8(v9, v8, &v68);
      sub_1000071C8();

      swift_bridgeObjectRelease();
      *(_WORD *)(v21 + 12) = 2080;
      swift_bridgeObjectRetain();
      v22 = sub_100007168();
      v24 = v23;
      swift_bridgeObjectRelease();
      v66 = sub_100003CD8(v22, v24, &v68);
      sub_1000071C8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v18, v19, "#STS DE# content of path %s %s", (uint8_t *)v21, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      v13 = v65;
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }
    v32 = *(void *)(v13 + 16);
    v33 = &_swiftEmptyArrayStorage;
    if (v32)
    {
      v34 = (uint64_t *)(v13 + 40);
      v35 = &_swiftEmptyArrayStorage;
      do
      {
        v37 = *(v34 - 1);
        v36 = *v34;
        swift_bridgeObjectRetain();
        v69._countAndFlagsBits = 6709603;
        v69._object = (void *)0xE300000000000000;
        if (sub_100007128(v69)
          || (v70._countAndFlagsBits = 0x6E6970736C696174,
              v70._object = (void *)0xE800000000000000,
              sub_100007128(v70)))
        {
          isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
          v68 = (uint64_t)v35;
          if ((isUniquelyReferenced_nonNull_native & 1) == 0)
          {
            sub_1000044E8(0, v35[2] + 1, 1);
            v35 = (void *)v68;
          }
          v40 = v35[2];
          v39 = v35[3];
          if (v40 >= v39 >> 1)
          {
            sub_1000044E8(v39 > 1, v40 + 1, 1);
            v35 = (void *)v68;
          }
          v35[2] = v40 + 1;
          v41 = &v35[2 * v40];
          v41[4] = v37;
          v41[5] = v36;
        }
        else
        {
          swift_bridgeObjectRelease();
        }
        v34 += 2;
        --v32;
      }
      while (v32);
    }
    else
    {
      v35 = &_swiftEmptyArrayStorage;
    }
    swift_bridgeObjectRelease();
    v42 = v63;
    v43 = sub_1000066F4((uint64_t)v35, (uint64_t)v42);
    swift_release();

    v68 = (uint64_t)&_swiftEmptyArrayStorage;
    v44 = v43[2];
    if (v44)
    {
      v45 = (uint64_t)v43 + ((*(unsigned __int8 *)(v62 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v62 + 80));
      v46 = *(void *)(v62 + 72);
      v65 = (uint64_t)v43;
      swift_bridgeObjectRetain();
      do
      {
        sub_100006E38(v45, (uint64_t)v6);
        sub_100006E38((uint64_t)v6, (uint64_t)v4);
        v47 = sub_100007078();
        v48 = *(void *)(v47 - 8);
        v50 = 0;
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v48 + 48))(v4, 1, v47) != 1)
        {
          sub_100007068(v49);
          v50 = v51;
          (*(void (**)(char *, uint64_t))(v48 + 8))(v4, v47);
        }
        v52 = [objc_allocWithZone((Class)DEAttachmentItem) initWithPathURL:v50];

        sub_100006EA0((uint64_t)v6);
        if (v52)
        {
          sub_100007138();
          if (*(void *)((v68 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v68 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_100007188();
          }
          sub_1000071A8();
          sub_100007178();
        }
        v45 += v46;
        --v44;
      }
      while (v44);
      swift_bridgeObjectRelease();
      v33 = (id)v68;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain_n();
    v53 = sub_1000070B8();
    v54 = sub_1000071B8();
    if (os_log_type_enabled(v53, v54))
    {
      v55 = (uint8_t *)swift_slowAlloc();
      v68 = swift_slowAlloc();
      *(_DWORD *)v55 = 136315138;
      sub_100006F00();
      swift_bridgeObjectRetain();
      v56 = sub_100007168();
      v58 = v57;
      swift_bridgeObjectRelease();
      v66 = sub_100003CD8(v56, v58, &v68);
      sub_1000071C8();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v53, v54, "#STS DE# filtered %s", v55, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    sub_10000317C((unint64_t)v33);
    v59 = v67;
  }
  else
  {
    v25 = (id)v68;
    sub_100007048();

    swift_willThrow();
    v26 = v0;
    swift_errorRetain();
    v27 = v26;
    swift_errorRetain();
    v28 = sub_1000070B8();
    v29 = sub_1000071B8();
    if (os_log_type_enabled(v28, v29))
    {
      v30 = swift_slowAlloc();
      v64 = (void *)swift_slowAlloc();
      v65 = swift_slowAlloc();
      v68 = v65;
      *(_DWORD *)v30 = 138412546;
      swift_errorRetain();
      v31 = _swift_stdlib_bridgeErrorToNSError();
      v66 = v31;
      sub_1000071C8();
      *v64 = v31;
      swift_errorRelease();
      swift_errorRelease();
      *(_WORD *)(v30 + 12) = 2080;
      swift_bridgeObjectRetain();
      v66 = sub_100003CD8(v9, v8, &v68);
      sub_1000071C8();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v28, v29, "#STS DE# attachmentList error: %@ at %s", (uint8_t *)v30, 0x16u);
      sub_100006D9C(&qword_10000C1F8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();

      swift_errorRelease();
      swift_errorRelease();
    }
    v59 = &_swiftEmptyArrayStorage;
  }
  v60 = sub_100003348((unint64_t)v59);
  swift_bridgeObjectRelease();
  return v60;
}

uint64_t sub_10000317C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_100007238();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v4 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v5 = v4 + v3;
    if (!__OFADD__(v4, v3)) {
      goto LABEL_5;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_100007238();
  swift_bridgeObjectRelease();
  uint64_t v5 = v15 + v3;
  if (__OFADD__(v15, v3)) {
    goto LABEL_21;
  }
LABEL_5:
  unint64_t v6 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  uint64_t *v1 = v6;
  if (isUniquelyReferenced_nonNull_bridgeObject)
  {
    if ((v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
    {
      uint64_t v8 = v6 & 0xFFFFFFFFFFFFFF8;
      if (v5 <= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        goto LABEL_11;
      }
    }
  }
  if (v6 >> 62) {
    goto LABEL_23;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_100007208();
    swift_bridgeObjectRelease();
    uint64_t *v1 = v9;
    uint64_t v8 = v9 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_1000064DC(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    sub_100007238();
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
  return sub_100007178();
}

uint64_t sub_100003348(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_100007238();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v3 = &_swiftEmptyArrayStorage;
  if (!v2) {
    return (uint64_t)v3;
  }
  BOOL v13 = &_swiftEmptyArrayStorage;
  uint64_t result = sub_1000044A8(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        sub_1000071F8();
        sub_100006F00();
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1000044A8(0, v3[2] + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v7 = v3[2];
        unint64_t v6 = v3[3];
        if (v7 >= v6 >> 1)
        {
          sub_1000044A8(v6 > 1, v7 + 1, 1);
          uint64_t v3 = v13;
        }
        v3[2] = v7 + 1;
        sub_100006DE4(v12, &v3[4 * v7 + 4]);
      }
    }
    else
    {
      uint64_t v8 = (id *)(a1 + 32);
      sub_100006F00();
      do
      {
        id v9 = *v8;
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1000044A8(0, v3[2] + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v11 = v3[2];
        unint64_t v10 = v3[3];
        if (v11 >= v10 >> 1)
        {
          sub_1000044A8(v10 > 1, v11 + 1, 1);
          uint64_t v3 = v13;
        }
        v3[2] = v11 + 1;
        sub_100006DE4(v12, &v3[4 * v11 + 4]);
        ++v8;
        --v2;
      }
      while (v2);
    }
    return (uint64_t)v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_1000035EC(void *a1, void *a2)
{
  uint64_t v4 = sub_100006D9C(&qword_10000C1E0);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  unint64_t v7 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v5);
  unint64_t v10 = (char *)&v33 - v9;
  uint64_t v11 = __chkstk_darwin(v8);
  BOOL v13 = (char *)&v33 - v12;
  uint64_t v14 = __chkstk_darwin(v11);
  v16 = (char *)&v33 - v15;
  uint64_t v17 = __chkstk_darwin(v14);
  v19 = (char *)&v33 - v18;
  __chkstk_darwin(v17);
  v21 = (char *)&v33 - v20;
  sub_100006DF4(a1, a1[3]);
  v22 = (void *)sub_100007268();
  if (([v22 respondsToSelector:"modificationDate"] & 1) == 0)
  {
    swift_unknownObjectRelease();
    __break(1u);
LABEL_13:
    __break(1u);
    goto LABEL_14;
  }
  id v23 = [v22 modificationDate];
  swift_unknownObjectRelease();
  if (v23)
  {
    sub_100007098();

    uint64_t v24 = sub_1000070A8();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v16, 0, 1, v24);
  }
  else
  {
    uint64_t v24 = sub_1000070A8();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56))(v16, 1, 1, v24);
  }
  sub_100006FE4((uint64_t)v16, (uint64_t)v19, &qword_10000C1E0);
  sub_100006FE4((uint64_t)v19, (uint64_t)v21, &qword_10000C1E0);
  sub_1000070A8();
  uint64_t v25 = *(void *)(v24 - 8);
  v26 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48);
  if (v26(v21, 1, v24) == 1) {
    goto LABEL_13;
  }
  sub_100006DF4(a2, a2[3]);
  v27 = (void *)sub_100007268();
  if (([v27 respondsToSelector:"modificationDate"] & 1) == 0)
  {
LABEL_14:
    uint64_t result = swift_unknownObjectRelease();
    __break(1u);
    goto LABEL_15;
  }
  id v28 = [v27 modificationDate];
  swift_unknownObjectRelease();
  if (v28)
  {
    sub_100007098();

    uint64_t v29 = 0;
  }
  else
  {
    uint64_t v29 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v25 + 56))(v7, v29, 1, v24);
  sub_100006FE4((uint64_t)v7, (uint64_t)v10, &qword_10000C1E0);
  sub_100006FE4((uint64_t)v10, (uint64_t)v13, &qword_10000C1E0);
  uint64_t result = ((uint64_t (*)(char *, uint64_t, uint64_t))v26)(v13, 1, v24);
  if (result != 1)
  {
    char v31 = sub_100007088();
    v32 = *(void (**)(char *, uint64_t))(v25 + 8);
    v32(v13, v24);
    v32(v21, v24);
    return v31 & 1;
  }
LABEL_15:
  __break(1u);
  return result;
}

id sub_100003B30()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for STSDiagnosticExtension();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_100003BEC()
{
  return type metadata accessor for STSDiagnosticExtension();
}

uint64_t type metadata accessor for STSDiagnosticExtension()
{
  uint64_t result = qword_10000C238;
  if (!qword_10000C238) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100003C40()
{
  uint64_t result = sub_1000070D8();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100003CD8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100003DAC(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100006D40((uint64_t)v12, *a3);
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
      sub_100006D40((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100006CF0((uint64_t)v12);
  return v7;
}

uint64_t sub_100003DAC(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1000071D8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100003F68(a5, a6);
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
  uint64_t v8 = sub_100007218();
  if (!v8)
  {
    sub_100007228();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100007248();
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

uint64_t sub_100003F68(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100004000(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000041E0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_1000041E0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100004000(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100004178(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1000071E8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100007228();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100007118();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100007248();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100007228();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100004178(uint64_t a1, uint64_t a2)
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
  sub_100006D9C(&qword_10000C1D0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1000041E0(char a1, int64_t a2, char a3, char *a4)
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
    sub_100006D9C(&qword_10000C1D0);
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
  BOOL v13 = a4 + 32;
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
  uint64_t result = sub_100007248();
  __break(1u);
  return result;
}

void *sub_100004330(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v4 = a4 >> 1;
  uint64_t v5 = (a4 >> 1) - a3;
  if (!__OFSUB__(a4 >> 1, a3))
  {
    if (!v5) {
      return &_swiftEmptyArrayStorage;
    }
    uint64_t v8 = 4 * v5;
    if (v5 <= 0)
    {
      int64_t v9 = &_swiftEmptyArrayStorage;
      if (v4 != a3)
      {
LABEL_7:
        if (v5 < 0) {
          goto LABEL_19;
        }
        unint64_t v12 = a2 + 32 * a3;
        if (v12 < (unint64_t)&v9[v8 + 4] && (unint64_t)(v9 + 4) < v12 + v8 * 8) {
          goto LABEL_19;
        }
        swift_arrayInitWithCopy();
        return v9;
      }
    }
    else
    {
      sub_100006D9C(&qword_10000C1D8);
      int64_t v9 = (void *)swift_allocObject();
      int64_t v10 = j__malloc_size(v9);
      uint64_t v11 = v10 - 32;
      if (v10 < 32) {
        uint64_t v11 = v10 - 1;
      }
      v9[2] = v5;
      v9[3] = 2 * (v11 >> 5);
      if (v4 != a3) {
        goto LABEL_7;
      }
    }
    __break(1u);
  }
  __break(1u);
LABEL_19:
  uint64_t result = (void *)sub_100007248();
  __break(1u);
  return result;
}

uint64_t sub_1000044A8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100004508(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_1000044C8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100004678(a1, a2, a3, (void *)*v3);
  *unint64_t v3 = result;
  return result;
}

uint64_t sub_1000044E8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_1000048C0(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_100004508(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    sub_100006D9C(&qword_10000C1D8);
    int64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    int64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  BOOL v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_100007248();
  __break(1u);
  return result;
}

uint64_t sub_100004678(char a1, int64_t a2, char a3, void *a4)
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
    BOOL v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_100006D9C(&qword_10000C220);
  uint64_t v10 = *(void *)(sub_100006D9C(&qword_10000C1F0) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  BOOL v13 = (void *)swift_allocObject();
  size_t v14 = j__malloc_size(v13);
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
  uint64_t v16 = *(void *)(sub_100006D9C(&qword_10000C1F0) - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  uint64_t v18 = (char *)v13 + v17;
  v19 = (char *)a4 + v17;
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
  v21 = &v18[v20];
  unint64_t v22 = (unint64_t)&v19[v20];
  if (v19 >= v21 || (unint64_t)v18 >= v22)
  {
    swift_arrayInitWithCopy();
LABEL_32:
    swift_release();
    return (uint64_t)v13;
  }
LABEL_36:
  uint64_t result = sub_100007248();
  __break(1u);
  return result;
}

uint64_t sub_1000048C0(char a1, int64_t a2, char a3, char *a4)
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
        goto LABEL_32;
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
    sub_100006D9C(&qword_10000C208);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  BOOL v13 = v10 + 32;
  size_t v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_100007248();
  __break(1u);
  return result;
}

Swift::Int sub_100004A2C(uint64_t *a1)
{
  uint64_t v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_1000066E0(v2);
  }
  uint64_t v3 = *(void *)(v2 + 16);
  v5[0] = v2 + 32;
  v5[1] = v3;
  Swift::Int result = sub_100004A98(v5);
  *a1 = v2;
  return result;
}

Swift::Int sub_100004A98(uint64_t *a1)
{
  uint64_t v2 = sub_100006D9C(&qword_10000C1E0);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v155 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v3);
  uint64_t v174 = (uint64_t)&v155 - v7;
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v155 - v9;
  uint64_t v11 = __chkstk_darwin(v8);
  v176 = (char *)&v155 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v175 = (uint64_t)&v155 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  unint64_t v17 = (char *)&v155 - v16;
  uint64_t v18 = __chkstk_darwin(v15);
  uint64_t v20 = (char *)&v155 - v19;
  uint64_t v21 = __chkstk_darwin(v18);
  uint64_t v163 = (uint64_t)&v155 - v22;
  uint64_t v23 = __chkstk_darwin(v21);
  uint64_t v162 = (uint64_t)&v155 - v24;
  uint64_t v25 = __chkstk_darwin(v23);
  v165 = (char *)&v155 - v26;
  uint64_t v27 = __chkstk_darwin(v25);
  uint64_t v164 = (uint64_t)&v155 - v28;
  __chkstk_darwin(v27);
  uint64_t v168 = (uint64_t)&v155 - v29;
  Swift::Int v30 = a1[1];
  Swift::Int result = sub_100007258(v30);
  if (result >= v30)
  {
    if (v30 < 0) {
      goto LABEL_161;
    }
    if (v30) {
      return sub_1000059CC(0, v30, 1, a1);
    }
    return result;
  }
  if (v30 >= 0) {
    uint64_t v32 = v30;
  }
  else {
    uint64_t v32 = v30 + 1;
  }
  if (v30 < -1) {
    goto LABEL_177;
  }
  Swift::Int v157 = result;
  v158 = v20;
  if (v30 < 2)
  {
    v169 = (char *)&_swiftEmptyArrayStorage[4];
    v156 = _swiftEmptyArrayStorage;
    if (v30 != 1)
    {
      unint64_t v93 = _swiftEmptyArrayStorage[2];
      v36 = (char *)_swiftEmptyArrayStorage;
LABEL_124:
      if (v93 >= 2)
      {
        uint64_t v147 = *a1;
        while (1)
        {
          unint64_t v148 = v93 - 2;
          if (v93 < 2) {
            goto LABEL_155;
          }
          if (!v147) {
            goto LABEL_176;
          }
          v149 = v36;
          uint64_t v150 = *(void *)&v36[16 * v148 + 32];
          uint64_t v151 = *(void *)&v36[16 * v93 + 24];
          uint64_t v152 = v170;
          sub_100005EBC((char *)(v147 + 32 * v150), (char *)(v147 + 32 * *(void *)&v36[16 * v93 + 16]), v147 + 32 * v151, v169);
          uint64_t v170 = v152;
          if (v152) {
            goto LABEL_138;
          }
          if (v151 < v150) {
            goto LABEL_157;
          }
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            v149 = sub_100006390((uint64_t)v149);
          }
          if (v148 >= *((void *)v149 + 2)) {
            goto LABEL_158;
          }
          v153 = &v149[16 * v148 + 32];
          *(void *)v153 = v150;
          *((void *)v153 + 1) = v151;
          unint64_t v154 = *((void *)v149 + 2);
          if (v93 > v154) {
            goto LABEL_159;
          }
          memmove(&v149[16 * v93 + 16], &v149[16 * v93 + 32], 16 * (v154 - v93));
          v36 = v149;
          *((void *)v149 + 2) = v154 - 1;
          unint64_t v93 = v154 - 1;
          if (v154 <= 2) {
            goto LABEL_138;
          }
        }
      }
      goto LABEL_138;
    }
  }
  else
  {
    uint64_t v33 = v32 >> 1;
    uint64_t v34 = sub_100007198();
    *(void *)(v34 + 16) = v33;
    v156 = (void *)v34;
    v169 = (char *)(v34 + 32);
  }
  Swift::Int v35 = 0;
  v36 = (char *)_swiftEmptyArrayStorage;
  v177 = a1;
  v172 = v10;
  v173 = v5;
  v171 = v17;
  while (1)
  {
    Swift::Int v37 = v35++;
    v160 = v36;
    Swift::Int v166 = v37;
    if (v35 >= v30) {
      goto LABEL_42;
    }
    uint64_t v38 = *a1;
    sub_100006D40(*a1 + 32 * v35, (uint64_t)&v180);
    sub_100006D40(v38 + 32 * v37, (uint64_t)v178);
    LODWORD(v167) = sub_1000035EC(&v180, v178);
    if (v170)
    {
      sub_100006CF0((uint64_t)v178);
      sub_100006CF0((uint64_t)&v180);
LABEL_138:
      swift_bridgeObjectRelease();
      v156[2] = 0;
      return swift_bridgeObjectRelease();
    }
    sub_100006CF0((uint64_t)v178);
    sub_100006CF0((uint64_t)&v180);
    Swift::Int v35 = v37 + 2;
    Swift::Int v159 = v30;
    uint64_t v161 = v38;
    if (v37 + 2 < v30)
    {
      uint64_t v39 = v38 + 32 * v37 + 32;
      while (1)
      {
        sub_100006D40(v39 + 32, (uint64_t)&v180);
        uint64_t v182 = v39;
        sub_100006D40(v39, (uint64_t)v178);
        sub_100006DF4(&v180, v181);
        v40 = (void *)sub_100007268();
        if (([v40 respondsToSelector:"modificationDate"] & 1) == 0) {
          goto LABEL_171;
        }
        id v41 = [v40 modificationDate];
        swift_unknownObjectRelease();
        v42 = v165;
        if (v41)
        {
          sub_100007098();

          uint64_t v43 = sub_1000070A8();
          (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(v42, 0, 1, v43);
        }
        else
        {
          uint64_t v43 = sub_1000070A8();
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(v42, 1, 1, v43);
        }
        uint64_t v44 = (uint64_t)v42;
        uint64_t v45 = v164;
        sub_100006FE4(v44, v164, &qword_10000C1E0);
        uint64_t v46 = v168;
        sub_100006FE4(v45, v168, &qword_10000C1E0);
        sub_1000070A8();
        uint64_t v47 = *(void *)(v43 - 8);
        v48 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v47 + 48);
        if (v48(v46, 1, v43) == 1) {
          goto LABEL_172;
        }
        sub_100006DF4(v178, v179);
        v49 = (void *)sub_100007268();
        if (([v49 respondsToSelector:"modificationDate"] & 1) == 0) {
          goto LABEL_174;
        }
        id v50 = [v49 modificationDate];
        swift_unknownObjectRelease();
        if (v50)
        {
          uint64_t v51 = (uint64_t)v158;
          sub_100007098();

          uint64_t v52 = 0;
        }
        else
        {
          uint64_t v52 = 1;
          uint64_t v51 = (uint64_t)v158;
        }
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v47 + 56))(v51, v52, 1, v43);
        uint64_t v53 = v163;
        sub_100006FE4(v51, v163, &qword_10000C1E0);
        uint64_t v54 = v53;
        uint64_t v55 = v162;
        sub_100006FE4(v54, v162, &qword_10000C1E0);
        if (v48(v55, 1, v43) == 1) {
          goto LABEL_173;
        }
        uint64_t v56 = v168;
        int v57 = sub_100007088();
        uint64_t v58 = v55;
        int v59 = v57;
        v60 = *(void (**)(uint64_t, uint64_t))(v47 + 8);
        v60(v58, v43);
        v60(v56, v43);
        sub_100006CF0((uint64_t)v178);
        sub_100006CF0((uint64_t)&v180);
        if ((v167 ^ v59)) {
          break;
        }
        ++v35;
        uint64_t v39 = v182 + 32;
        Swift::Int v30 = v159;
        if (v159 == v35)
        {
          Swift::Int v35 = v159;
          Swift::Int v37 = v166;
          goto LABEL_31;
        }
      }
      Swift::Int v37 = v166;
      Swift::Int v30 = v159;
LABEL_31:
      uint64_t v38 = v161;
    }
    if (v167)
    {
      if (v35 < v37) {
        goto LABEL_164;
      }
      if (v37 < v35)
      {
        uint64_t v61 = 32 * v35 - 32;
        uint64_t v62 = 32 * v37;
        Swift::Int v63 = v35;
        do
        {
          if (v37 != --v63)
          {
            if (!v38) {
              goto LABEL_175;
            }
            v64 = (_OWORD *)(v38 + v62);
            v65 = (_OWORD *)(v161 + v61);
            sub_100006DE4(v64, &v180);
            long long v66 = v65[1];
            _OWORD *v64 = *v65;
            v64[1] = v66;
            uint64_t v38 = v161;
            sub_100006DE4(&v180, v65);
          }
          ++v37;
          v61 -= 32;
          v62 += 32;
        }
        while (v37 < v63);
        Swift::Int v37 = v166;
        Swift::Int v30 = v159;
      }
    }
LABEL_42:
    if (v35 >= v30) {
      goto LABEL_70;
    }
    if (__OFSUB__(v35, v37)) {
      goto LABEL_160;
    }
    if (v35 - v37 >= v157) {
      goto LABEL_70;
    }
    if (__OFADD__(v37, v157)) {
      goto LABEL_162;
    }
    Swift::Int v67 = v37 + v157 >= v30 ? v30 : v37 + v157;
    if (v67 < v37) {
      break;
    }
    if (v35 != v67)
    {
      uint64_t v68 = 32 * v35 - 32;
      uint64_t v161 = v67;
      do
      {
        uint64_t v182 = v35;
        Swift::Int v69 = v37;
        uint64_t v167 = v68;
        while (1)
        {
          uint64_t v70 = *a1 + v68;
          sub_100006D40(v70 + 32, (uint64_t)&v180);
          sub_100006D40(v70, (uint64_t)v178);
          sub_100006DF4(&v180, v181);
          v71 = (void *)sub_100007268();
          if (([v71 respondsToSelector:"modificationDate"] & 1) == 0) {
            goto LABEL_165;
          }
          id v72 = [v71 modificationDate];
          swift_unknownObjectRelease();
          v73 = v176;
          if (v72)
          {
            sub_100007098();

            uint64_t v74 = sub_1000070A8();
            (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v74 - 8) + 56))(v73, 0, 1, v74);
          }
          else
          {
            uint64_t v74 = sub_1000070A8();
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v74 - 8) + 56))(v73, 1, 1, v74);
          }
          uint64_t v75 = (uint64_t)v73;
          uint64_t v76 = v175;
          sub_100006FE4(v75, v175, &qword_10000C1E0);
          sub_100006FE4(v76, (uint64_t)v17, &qword_10000C1E0);
          sub_1000070A8();
          uint64_t v77 = *(void *)(v74 - 8);
          v78 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v77 + 48);
          if (v78(v17, 1, v74) == 1) {
            goto LABEL_166;
          }
          sub_100006DF4(v178, v179);
          v79 = (void *)sub_100007268();
          if (([v79 respondsToSelector:"modificationDate"] & 1) == 0) {
            goto LABEL_168;
          }
          id v80 = [v79 modificationDate];
          swift_unknownObjectRelease();
          if (v80)
          {
            uint64_t v81 = (uint64_t)v173;
            sub_100007098();

            uint64_t v82 = 0;
          }
          else
          {
            uint64_t v82 = 1;
            uint64_t v81 = (uint64_t)v173;
          }
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v77 + 56))(v81, v82, 1, v74);
          uint64_t v83 = v174;
          sub_100006FE4(v81, v174, &qword_10000C1E0);
          uint64_t v84 = (uint64_t)v172;
          sub_100006FE4(v83, (uint64_t)v172, &qword_10000C1E0);
          if (v78((char *)v84, 1, v74) == 1) {
            goto LABEL_167;
          }
          unint64_t v17 = v171;
          char v85 = sub_100007088();
          v86 = *(void (**)(uint64_t, uint64_t))(v77 + 8);
          v86(v84, v74);
          v86((uint64_t)v17, v74);
          sub_100006CF0((uint64_t)v178);
          sub_100006CF0((uint64_t)&v180);
          uint64_t v87 = v182;
          if ((v85 & 1) == 0) {
            break;
          }
          a1 = v177;
          uint64_t v88 = *v177;
          if (!*v177) {
            goto LABEL_169;
          }
          v89 = (_OWORD *)(v88 + v68);
          sub_100006DE4((_OWORD *)(v88 + v68 + 32), &v180);
          long long v90 = v89[1];
          v89[2] = *v89;
          v89[3] = v90;
          sub_100006DE4(&v180, v89);
          v68 -= 32;
          if (v87 == ++v69) {
            goto LABEL_53;
          }
        }
        a1 = v177;
LABEL_53:
        Swift::Int v35 = v87 + 1;
        Swift::Int v37 = v166;
        uint64_t v68 = v167 + 32;
      }
      while (v35 != v161);
      Swift::Int v35 = v161;
    }
LABEL_70:
    if (v35 < v37) {
      goto LABEL_156;
    }
    if (swift_isUniquelyReferenced_nonNull_native()) {
      v36 = v160;
    }
    else {
      v36 = sub_1000061D8(0, *((void *)v160 + 2) + 1, 1, v160);
    }
    unint64_t v92 = *((void *)v36 + 2);
    unint64_t v91 = *((void *)v36 + 3);
    unint64_t v93 = v92 + 1;
    if (v92 >= v91 >> 1) {
      v36 = sub_1000061D8((char *)(v91 > 1), v92 + 1, 1, v36);
    }
    *((void *)v36 + 2) = v93;
    v94 = v36 + 32;
    v95 = &v36[16 * v92 + 32];
    *(void *)v95 = v37;
    *((void *)v95 + 1) = v35;
    if (v92)
    {
      uint64_t v182 = v35;
      while (1)
      {
        unint64_t v96 = v93 - 1;
        if (v93 >= 4)
        {
          v101 = &v94[16 * v93];
          uint64_t v102 = *((void *)v101 - 8);
          uint64_t v103 = *((void *)v101 - 7);
          BOOL v107 = __OFSUB__(v103, v102);
          uint64_t v104 = v103 - v102;
          if (v107) {
            goto LABEL_144;
          }
          uint64_t v106 = *((void *)v101 - 6);
          uint64_t v105 = *((void *)v101 - 5);
          BOOL v107 = __OFSUB__(v105, v106);
          uint64_t v99 = v105 - v106;
          char v100 = v107;
          if (v107) {
            goto LABEL_145;
          }
          unint64_t v108 = v93 - 2;
          v109 = &v94[16 * v93 - 32];
          uint64_t v111 = *(void *)v109;
          uint64_t v110 = *((void *)v109 + 1);
          BOOL v107 = __OFSUB__(v110, v111);
          uint64_t v112 = v110 - v111;
          if (v107) {
            goto LABEL_147;
          }
          BOOL v107 = __OFADD__(v99, v112);
          uint64_t v113 = v99 + v112;
          if (v107) {
            goto LABEL_150;
          }
          if (v113 >= v104)
          {
            v131 = &v94[16 * v96];
            uint64_t v133 = *(void *)v131;
            uint64_t v132 = *((void *)v131 + 1);
            BOOL v107 = __OFSUB__(v132, v133);
            uint64_t v134 = v132 - v133;
            if (v107) {
              goto LABEL_154;
            }
            BOOL v124 = v99 < v134;
            goto LABEL_108;
          }
        }
        else
        {
          if (v93 != 3)
          {
            uint64_t v125 = *((void *)v36 + 4);
            uint64_t v126 = *((void *)v36 + 5);
            BOOL v107 = __OFSUB__(v126, v125);
            uint64_t v118 = v126 - v125;
            char v119 = v107;
            goto LABEL_102;
          }
          uint64_t v98 = *((void *)v36 + 4);
          uint64_t v97 = *((void *)v36 + 5);
          BOOL v107 = __OFSUB__(v97, v98);
          uint64_t v99 = v97 - v98;
          char v100 = v107;
        }
        if (v100) {
          goto LABEL_146;
        }
        unint64_t v108 = v93 - 2;
        v114 = &v94[16 * v93 - 32];
        uint64_t v116 = *(void *)v114;
        uint64_t v115 = *((void *)v114 + 1);
        BOOL v117 = __OFSUB__(v115, v116);
        uint64_t v118 = v115 - v116;
        char v119 = v117;
        if (v117) {
          goto LABEL_149;
        }
        v120 = &v94[16 * v96];
        uint64_t v122 = *(void *)v120;
        uint64_t v121 = *((void *)v120 + 1);
        BOOL v107 = __OFSUB__(v121, v122);
        uint64_t v123 = v121 - v122;
        if (v107) {
          goto LABEL_152;
        }
        if (__OFADD__(v118, v123)) {
          goto LABEL_153;
        }
        if (v118 + v123 >= v99)
        {
          BOOL v124 = v99 < v123;
LABEL_108:
          if (v124) {
            unint64_t v96 = v108;
          }
          goto LABEL_110;
        }
LABEL_102:
        if (v119) {
          goto LABEL_148;
        }
        v127 = &v94[16 * v96];
        uint64_t v129 = *(void *)v127;
        uint64_t v128 = *((void *)v127 + 1);
        BOOL v107 = __OFSUB__(v128, v129);
        uint64_t v130 = v128 - v129;
        if (v107) {
          goto LABEL_151;
        }
        if (v130 < v118) {
          goto LABEL_119;
        }
LABEL_110:
        unint64_t v135 = v96 - 1;
        if (v96 - 1 >= v93)
        {
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
LABEL_158:
          __break(1u);
LABEL_159:
          __break(1u);
LABEL_160:
          __break(1u);
LABEL_161:
          __break(1u);
LABEL_162:
          __break(1u);
          goto LABEL_163;
        }
        uint64_t v136 = *a1;
        if (!*a1) {
          goto LABEL_170;
        }
        v137 = v36;
        v138 = v94;
        v139 = &v94[16 * v135];
        uint64_t v140 = *(void *)v139;
        v141 = v138;
        unint64_t v142 = v96;
        v143 = &v138[16 * v96];
        uint64_t v144 = *((void *)v143 + 1);
        uint64_t v145 = v170;
        sub_100005EBC((char *)(v136 + 32 * *(void *)v139), (char *)(v136 + 32 * *(void *)v143), v136 + 32 * v144, v169);
        uint64_t v170 = v145;
        if (v145) {
          goto LABEL_138;
        }
        if (v144 < v140) {
          goto LABEL_141;
        }
        if (v142 > *((void *)v137 + 2)) {
          goto LABEL_142;
        }
        *(void *)v139 = v140;
        *(void *)&v141[16 * v135 + 8] = v144;
        unint64_t v146 = *((void *)v137 + 2);
        if (v142 >= v146) {
          goto LABEL_143;
        }
        v94 = v141;
        unint64_t v93 = v146 - 1;
        memmove(v143, v143 + 16, 16 * (v146 - 1 - v142));
        v36 = v137;
        *((void *)v137 + 2) = v146 - 1;
        Swift::Int v35 = v182;
        a1 = v177;
        if (v146 <= 2) {
          goto LABEL_119;
        }
      }
    }
    unint64_t v93 = 1;
LABEL_119:
    Swift::Int v30 = a1[1];
    if (v35 >= v30) {
      goto LABEL_124;
    }
  }
LABEL_163:
  __break(1u);
LABEL_164:
  __break(1u);
LABEL_165:
  swift_unknownObjectRelease();
  __break(1u);
LABEL_166:
  __break(1u);
LABEL_167:
  __break(1u);
LABEL_168:
  swift_unknownObjectRelease();
  __break(1u);
LABEL_169:
  __break(1u);
LABEL_170:
  __break(1u);
LABEL_171:
  swift_unknownObjectRelease();
  __break(1u);
LABEL_172:
  __break(1u);
LABEL_173:
  __break(1u);
LABEL_174:
  swift_unknownObjectRelease();
  __break(1u);
LABEL_175:
  __break(1u);
LABEL_176:
  __break(1u);
LABEL_177:
  Swift::Int result = sub_100007228();
  __break(1u);
  return result;
}

uint64_t sub_1000059CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v54 = a4;
  uint64_t v47 = a1;
  uint64_t v6 = sub_100006D9C(&qword_10000C1E0);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  id v50 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v51 = (uint64_t)&v45 - v10;
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v45 - v12;
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v16 = (char *)&v45 - v15;
  uint64_t v17 = __chkstk_darwin(v14);
  uint64_t v52 = (uint64_t)&v45 - v18;
  uint64_t result = __chkstk_darwin(v17);
  uint64_t v59 = (uint64_t)&v45 - v20;
  uint64_t v53 = a3;
  uint64_t v46 = a2;
  if (a3 != a2)
  {
    uint64_t v21 = 32 * v53 - 32;
    uint64_t v22 = &STSDiagnosticExtension;
    v49 = v16;
LABEL_5:
    uint64_t v55 = v47;
    uint64_t v48 = v21;
    while (1)
    {
      uint64_t v23 = *v54 + v21;
      sub_100006D40(v23 + 32, (uint64_t)&v57);
      sub_100006D40(v23, (uint64_t)v56);
      sub_100006DF4(&v57, v58);
      uint64_t v24 = (void *)sub_100007268();
      if (([v24 respondsToSelector:v22[2].base_meths] & 1) == 0) {
        break;
      }
      id v25 = objc_msgSend(v24, (SEL)v22[2].base_meths);
      swift_unknownObjectRelease();
      if (v25)
      {
        sub_100007098();

        uint64_t v26 = sub_1000070A8();
        (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v16, 0, 1, v26);
      }
      else
      {
        uint64_t v26 = sub_1000070A8();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v26 - 8) + 56))(v16, 1, 1, v26);
      }
      uint64_t v27 = v52;
      sub_100006FE4((uint64_t)v16, v52, &qword_10000C1E0);
      uint64_t v28 = v59;
      sub_100006FE4(v27, v59, &qword_10000C1E0);
      sub_1000070A8();
      uint64_t v29 = *(void *)(v26 - 8);
      Swift::Int v30 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v29 + 48);
      if (v30(v28, 1, v26) == 1) {
        goto LABEL_21;
      }
      sub_100006DF4(v56, v56[3]);
      char v31 = (void *)sub_100007268();
      if (([v31 respondsToSelector:"modificationDate"] & 1) == 0) {
        goto LABEL_22;
      }
      uint64_t v32 = (uint64_t)v13;
      id v33 = [v31 modificationDate];
      swift_unknownObjectRelease();
      if (v33)
      {
        uint64_t v34 = v50;
        sub_100007098();

        uint64_t v35 = 0;
      }
      else
      {
        uint64_t v35 = 1;
        uint64_t v34 = v50;
      }
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v29 + 56))(v34, v35, 1, v26);
      uint64_t v36 = (uint64_t)v34;
      uint64_t v37 = v51;
      sub_100006FE4(v36, v51, &qword_10000C1E0);
      uint64_t v13 = (char *)v32;
      sub_100006FE4(v37, v32, &qword_10000C1E0);
      uint64_t result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v30)(v32, 1, v26);
      if (result == 1) {
        goto LABEL_23;
      }
      uint64_t v38 = v59;
      char v39 = sub_100007088();
      v40 = *(void (**)(uint64_t, uint64_t))(v29 + 8);
      v40(v32, v26);
      uint64_t v41 = v38;
      uint64_t v22 = &STSDiagnosticExtension;
      v40(v41, v26);
      sub_100006CF0((uint64_t)v56);
      uint64_t result = sub_100006CF0((uint64_t)&v57);
      uint64_t v16 = v49;
      if (v39)
      {
        uint64_t v42 = *v54;
        if (!*v54) {
          goto LABEL_24;
        }
        uint64_t v43 = (_OWORD *)(v42 + v21);
        sub_100006DE4((_OWORD *)(v42 + v21 + 32), &v57);
        long long v44 = v43[1];
        v43[2] = *v43;
        v43[3] = v44;
        uint64_t result = (uint64_t)sub_100006DE4(&v57, v43);
        v21 -= 32;
        if (v53 != ++v55) {
          continue;
        }
      }
      uint64_t v21 = v48 + 32;
      if (++v53 == v46) {
        return result;
      }
      goto LABEL_5;
    }
    swift_unknownObjectRelease();
    __break(1u);
LABEL_21:
    __break(1u);
LABEL_22:
    uint64_t result = swift_unknownObjectRelease();
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
  }
  return result;
}

uint64_t sub_100005EBC(char *__src, char *a2, unint64_t a3, char *__dst)
{
  uint64_t v5 = __dst;
  uint64_t v7 = a2;
  int64_t v9 = a2 - __src;
  int64_t v10 = a2 - __src + 31;
  if (a2 - __src >= 0) {
    int64_t v10 = a2 - __src;
  }
  uint64_t v11 = v10 >> 5;
  uint64_t v12 = a3 - (void)a2;
  uint64_t v13 = a3 - (void)a2 + 31;
  if ((uint64_t)(a3 - (void)a2) >= 0) {
    uint64_t v13 = a3 - (void)a2;
  }
  uint64_t v14 = v13 >> 5;
  uint64_t v37 = __src;
  uint64_t v36 = __dst;
  if (v11 >= v13 >> 5)
  {
    if (v12 >= -31)
    {
      if (__dst != a2 || &a2[32 * v14] <= __dst) {
        memmove(__dst, a2, 32 * v14);
      }
      uint64_t v23 = &v5[32 * v14];
      uint64_t v35 = v23;
      uint64_t v37 = v7;
      if (__src >= v7 || v12 < 32) {
        goto LABEL_48;
      }
      uint64_t v24 = (char *)(a3 - 32);
      while (1)
      {
        sub_100006D40((uint64_t)(v23 - 32), (uint64_t)v34);
        uint64_t v26 = v7 - 32;
        sub_100006D40((uint64_t)(v7 - 32), (uint64_t)v33);
        char v27 = sub_1000035EC(v34, v33);
        if (v4) {
          goto LABEL_47;
        }
        char v28 = v27;
        uint64_t v29 = v24 + 32;
        sub_100006CF0((uint64_t)v33);
        sub_100006CF0((uint64_t)v34);
        if (v28)
        {
          if (v29 != v7 || v24 >= v7)
          {
            long long v25 = *((_OWORD *)v7 - 1);
            *(_OWORD *)uint64_t v24 = *(_OWORD *)v26;
            *((_OWORD *)v24 + 1) = v25;
          }
          v37 -= 32;
          uint64_t v23 = v35;
          if (v35 <= v5) {
            goto LABEL_48;
          }
        }
        else
        {
          unint64_t v30 = (unint64_t)v35;
          uint64_t v23 = v35 - 32;
          v35 -= 32;
          if ((unint64_t)v29 < v30 || (unint64_t)v24 >= v30 || v29 != (char *)v30)
          {
            long long v31 = *((_OWORD *)v23 + 1);
            *(_OWORD *)uint64_t v24 = *(_OWORD *)v23;
            *((_OWORD *)v24 + 1) = v31;
          }
          uint64_t v26 = v7;
          if (v23 <= v5) {
            goto LABEL_48;
          }
        }
        v24 -= 32;
        uint64_t v7 = v26;
        if (v26 <= __src) {
          goto LABEL_48;
        }
      }
    }
  }
  else if (v9 >= -31)
  {
    if (__dst != __src || &__src[32 * v11] <= __dst) {
      memmove(__dst, __src, 32 * v11);
    }
    unint64_t v15 = (unint64_t)&v5[32 * v11];
    uint64_t v35 = (char *)v15;
    if ((unint64_t)v7 >= a3 || v9 < 32) {
      goto LABEL_48;
    }
    while (1)
    {
      sub_100006D40((uint64_t)v7, (uint64_t)v34);
      sub_100006D40((uint64_t)v5, (uint64_t)v33);
      char v16 = sub_1000035EC(v34, v33);
      if (v4) {
        break;
      }
      char v17 = v16;
      sub_100006CF0((uint64_t)v33);
      sub_100006CF0((uint64_t)v34);
      uint64_t v18 = v37;
      if (v17)
      {
        unint64_t v19 = (unint64_t)(v7 + 32);
        if (v37 >= v7 && (unint64_t)v37 < v19 && v37 == v7)
        {
          uint64_t v18 = v7;
        }
        else
        {
          long long v20 = *((_OWORD *)v7 + 1);
          *(_OWORD *)uint64_t v37 = *(_OWORD *)v7;
          *((_OWORD *)v18 + 1) = v20;
        }
      }
      else
      {
        uint64_t v21 = v36 + 32;
        if (v37 != v36 || v37 >= v21)
        {
          long long v22 = *((_OWORD *)v36 + 1);
          *(_OWORD *)uint64_t v37 = *(_OWORD *)v36;
          *((_OWORD *)v18 + 1) = v22;
        }
        uint64_t v36 = v21;
        unint64_t v19 = (unint64_t)v7;
      }
      uint64_t v37 = v18 + 32;
      uint64_t v5 = v36;
      if ((unint64_t)v36 < v15)
      {
        uint64_t v7 = (char *)v19;
        if (v19 < a3) {
          continue;
        }
      }
      goto LABEL_48;
    }
LABEL_47:
    sub_100006CF0((uint64_t)v33);
    sub_100006CF0((uint64_t)v34);
LABEL_48:
    sub_1000062D4((void **)&v37, (const void **)&v36, &v35);
    return 1;
  }
  uint64_t result = sub_100007248();
  __break(1u);
  return result;
}

char *sub_1000061D8(char *result, int64_t a2, char a3, char *a4)
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
    sub_100006D9C(&qword_10000C1E8);
    int64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    int64_t v10 = (char *)&_swiftEmptyArrayStorage;
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

char *sub_1000062D4(void **a1, const void **a2, void *a3)
{
  uint64_t v3 = (char *)*a2;
  uint64_t v4 = *a3 - (void)v3;
  uint64_t v5 = v4 + 31;
  if (v4 >= 0) {
    uint64_t v5 = *a3 - (void)v3;
  }
  if (v4 <= -32)
  {
    uint64_t result = (char *)sub_100007248();
    __break(1u);
  }
  else
  {
    uint64_t result = (char *)*a1;
    uint64_t v7 = v5 >> 5;
    if (result != v3 || result >= &v3[32 * v7])
    {
      return (char *)memmove(result, v3, 32 * v7);
    }
  }
  return result;
}

char *sub_100006390(uint64_t a1)
{
  return sub_1000061D8(0, *(void *)(a1 + 16), 0, (char *)a1);
}

void (*sub_1000063A4(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_100006454(v6, a2, a3);
  return sub_10000640C;
}

void sub_10000640C(void *a1)
{
  unint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_100006454(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)sub_1000071F8();
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
    return sub_1000064D4;
  }
  __break(1u);
  return result;
}

void sub_1000064D4(id *a1)
{
}

uint64_t sub_1000064DC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_100007238();
    swift_bridgeObjectRelease();
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
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_100007238();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_100006F40();
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_100006D9C(&qword_10000C210);
          uint64_t v12 = sub_1000063A4(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_100006F00();
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_100007248();
  __break(1u);
  return result;
}

uint64_t sub_1000066E0(uint64_t a1)
{
  return sub_100004508(0, *(void *)(a1 + 16), 0, (char *)a1);
}

unint64_t *sub_1000066F4(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *(void *)(sub_100006D9C(&qword_10000C1F0) - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v8 = *(void *)(a1 + 16);
  uint64_t v9 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (v8)
  {
    uint64_t v19 = v2;
    uint64_t v23 = (unint64_t *)&_swiftEmptyArrayStorage;
    sub_1000044C8(0, v8, 0);
    uint64_t v9 = v23;
    uint64_t v10 = *(void *)(a2 + OBJC_IVAR____TtC13STSDiagnostic22STSDiagnosticExtension_logPath);
    uint64_t v11 = *(void *)(a2 + OBJC_IVAR____TtC13STSDiagnostic22STSDiagnosticExtension_logPath + 8);
    uint64_t v20 = v10;
    uint64_t v12 = (void **)(a1 + 40);
    do
    {
      uint64_t v13 = (uint64_t)*(v12 - 1);
      id v14 = *v12;
      uint64_t v21 = v20;
      uint64_t v22 = v11;
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v24._countAndFlagsBits = v13;
      v24._object = v14;
      sub_100007108(v24);
      sub_100007058();
      swift_bridgeObjectRelease();
      uint64_t v15 = sub_100007078();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v7, 0, 1, v15);
      swift_bridgeObjectRelease();
      uint64_t v23 = v9;
      unint64_t v17 = v9[2];
      unint64_t v16 = v9[3];
      if (v17 >= v16 >> 1)
      {
        sub_1000044C8(v16 > 1, v17 + 1, 1);
        uint64_t v9 = v23;
      }
      v12 += 2;
      v9[2] = v17 + 1;
      sub_100006FE4((uint64_t)v7, (uint64_t)v9+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v17, &qword_10000C1F0);
      --v8;
    }
    while (v8);
  }
  return v9;
}

uint64_t sub_100006908()
{
  id v1 = [v0 attachmentList];
  if (v1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = sub_100007158();

    uint64_t v23 = v3;
    swift_bridgeObjectRetain();
    sub_100004A2C(&v23);
    swift_bridgeObjectRelease();
    uint64_t v4 = v23;
    swift_retain_n();
    uint64_t v5 = sub_1000070B8();
    os_log_type_t v6 = sub_1000071B8();
    uint64_t v7 = &loc_100007000;
    if (os_log_type_enabled(v5, v6))
    {
      int64_t v8 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      *(_DWORD *)int64_t v8 = 136315138;
      swift_retain();
      uint64_t v9 = sub_100007168();
      unint64_t v11 = v10;
      swift_release();
      sub_100003CD8(v9, v11, &v23);
      sub_1000071C8();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "#STS DE# Preparing... %s}", v8, 0xCu);
      uint64_t v7 = (void *)&loc_100007000;
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_release_n();
    }

    if (*(void *)(v4 + 16) >= 0x14uLL) {
      uint64_t v12 = 20;
    }
    else {
      uint64_t v12 = *(void *)(v4 + 16);
    }
    sub_100007278();
    swift_unknownObjectRetain_n();
    uint64_t v13 = (void *)swift_dynamicCastClass();
    if (!v13)
    {
      swift_release();
      uint64_t v13 = _swiftEmptyArrayStorage;
    }
    uint64_t v14 = v13[2];
    swift_release();
    if (v14 == v12)
    {
      uint64_t v15 = (void *)swift_dynamicCastClass();
      if (!v15)
      {
        swift_release();
        uint64_t v15 = _swiftEmptyArrayStorage;
      }
    }
    else
    {
      swift_release();
      uint64_t v15 = sub_100004330(v4, v4 + 32, 0, (2 * v12) | 1);
    }
    swift_release();
    swift_bridgeObjectRetain_n();
    unint64_t v16 = sub_1000070B8();
    os_log_type_t v17 = sub_1000071B8();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = (uint8_t *)swift_slowAlloc();
      uint64_t v23 = swift_slowAlloc();
      *(_DWORD *)uint64_t v18 = v7[215];
      swift_bridgeObjectRetain();
      uint64_t v19 = sub_100007168();
      unint64_t v21 = v20;
      swift_release();
      sub_100003CD8(v19, v21, &v23);
      sub_1000071C8();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "#STS DE# Attaching: %s", v18, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_release_n();
    }

    return (uint64_t)v15;
  }
  else
  {
    __break(1u);
    uint64_t result = swift_release();
    __break(1u);
  }
  return result;
}

uint64_t sub_100006CF0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100006D40(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100006D9C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

_OWORD *sub_100006DE4(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void *sub_100006DF4(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100006E38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100006D9C(&qword_10000C1F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006EA0(uint64_t a1)
{
  uint64_t v2 = sub_100006D9C(&qword_10000C1F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100006F00()
{
  unint64_t result = qword_10000C200;
  if (!qword_10000C200)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10000C200);
  }
  return result;
}

unint64_t sub_100006F40()
{
  unint64_t result = qword_10000C218;
  if (!qword_10000C218)
  {
    sub_100006F9C(&qword_10000C210);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C218);
  }
  return result;
}

uint64_t sub_100006F9C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100006FE4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100006D9C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_100007048()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100007058()
{
  return URL.init(fileURLWithPath:)();
}

void sub_100007068(NSURL *retstr@<X8>)
{
}

uint64_t sub_100007078()
{
  return type metadata accessor for URL();
}

uint64_t sub_100007088()
{
  return static Date.< infix(_:_:)();
}

uint64_t sub_100007098()
{
  return static Date._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000070A8()
{
  return type metadata accessor for Date();
}

uint64_t sub_1000070B8()
{
  return Logger.logObject.getter();
}

uint64_t sub_1000070C8()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_1000070D8()
{
  return type metadata accessor for Logger();
}

uint64_t sub_1000070E8()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString sub_1000070F8()
{
  return String._bridgeToObjectiveC()();
}

void sub_100007108(Swift::String a1)
{
}

Swift::Int sub_100007118()
{
  return String.UTF8View._foreignCount()();
}

BOOL sub_100007128(Swift::String a1)
{
  return String.hasSuffix(_:)(a1);
}

uint64_t sub_100007138()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_100007148()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100007158()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100007168()
{
  return Array.description.getter();
}

uint64_t sub_100007178()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100007188()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100007198()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_1000071A8()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_1000071B8()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_1000071C8()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_1000071D8()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_1000071E8()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_1000071F8()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100007208()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100007218()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100007228()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100007238()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100007248()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

Swift::Int sub_100007258(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_100007268()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_100007278()
{
  return type metadata accessor for __ContiguousArrayStorageBase();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
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

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
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

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
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

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}