uint64_t sub_100001CE8()
{
  uint64_t v0;
  uint64_t result;

  sub_100002F08((uint64_t *)&unk_100008590);
  sub_100003390();
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_100003770;
  result = sub_100003380();
  qword_1000084C8 = v0;
  return result;
}

uint64_t sub_100001E70(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100003350();
  uint64_t v41 = *(void *)(v4 - 8);
  uint64_t v42 = v4;
  __chkstk_darwin();
  v40 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100003420();
  uint64_t v46 = *(void *)(v6 - 8);
  __chkstk_darwin();
  v8 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000033C0();
  uint64_t v45 = *(void *)(v9 - 8);
  __chkstk_darwin();
  v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100003410();
  uint64_t v50 = *(void *)(v12 - 8);
  __chkstk_darwin();
  v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000084D0 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_1000027D0(v12, (uint64_t)qword_100008600);
  (*(void (**)(char *, uint64_t, uint64_t))(v50 + 16))(v14, v15, v12);
  id v16 = a1;
  v48 = v14;
  v17 = sub_1000033F0();
  uint64_t v18 = v12;
  os_log_type_t v19 = sub_100003440();
  v47 = v17;
  BOOL v20 = os_log_type_enabled(v17, v19);
  v43 = v8;
  uint64_t v44 = v6;
  if (v20)
  {
    uint64_t v21 = swift_slowAlloc();
    uint64_t v39 = v9;
    uint64_t v22 = v21;
    v36 = (void *)swift_slowAlloc();
    v51[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v22 = 136315394;
    uint64_t v38 = v2;
    uint64_t v52 = sub_1000028B0(0x286D726F66726570, 0xEB00000000293A5FLL, v51);
    uint64_t v37 = v18;
    sub_100003450();
    *(_WORD *)(v22 + 12) = 2112;
    uint64_t v52 = (uint64_t)v16;
    id v23 = v16;
    uint64_t v2 = v38;
    uint64_t v24 = v46;
    sub_100003450();
    uint64_t v18 = (uint64_t)v36;
    void *v36 = v16;

    v25 = v47;
    _os_log_impl((void *)&_mh_execute_header, v47, v19, "SiriUserFeedbackLearningPlatformPlugin.%s mlrTask: %@", (uint8_t *)v22, 0x16u);
    sub_100002F08(&qword_100008570);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v9 = v39;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v50 + 8))(v48, v37);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v50 + 8))(v48, v18);
    uint64_t v24 = v46;
  }
  sub_100002808(v2 + OBJC_IVAR____TtC38SiriUserFeedbackLearningPlatformPlugin38SiriUserFeedbackLearningPlatformPlugin_usageLogger, (uint64_t)v51);
  id v26 = v16;
  uint64_t v27 = v49;
  sub_1000033B0();
  if (!v27)
  {
    uint64_t v28 = v2;
    v29 = v11;
    uint64_t v30 = *(void *)(v28
                    + OBJC_IVAR____TtC38SiriUserFeedbackLearningPlatformPlugin38SiriUserFeedbackLearningPlatformPlugin_pluginLauncher
                    + 24);
    uint64_t v50 = *(void *)(v28
                    + OBJC_IVAR____TtC38SiriUserFeedbackLearningPlatformPlugin38SiriUserFeedbackLearningPlatformPlugin_pluginLauncher
                    + 32);
    sub_10000286C((void *)(v28+ OBJC_IVAR____TtC38SiriUserFeedbackLearningPlatformPlugin38SiriUserFeedbackLearningPlatformPlugin_pluginLauncher), v30);
    if (qword_1000084C0 != -1) {
      swift_once();
    }
    sub_1000024B0(qword_1000084C8);
    v31 = v43;
    uint64_t v32 = v44;
    void *v43 = 300;
    (*(void (**)(void *, void, uint64_t))(v24 + 104))(v31, enum case for DispatchTimeInterval.seconds(_:), v32);
    sub_1000033A0();
    (*(void (**)(void *, uint64_t))(v24 + 8))(v31, v32);
    swift_bridgeObjectRelease();
    v34 = v40;
    sub_100003340();
    uint64_t v18 = sub_100003330();
    (*(void (**)(char *, uint64_t))(v41 + 8))(v34, v42);
    (*(void (**)(char *, uint64_t))(v45 + 8))(v29, v9);
  }
  return v18;
}

unint64_t *sub_1000024B0(uint64_t a1)
{
  uint64_t v2 = sub_100003390();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v6 = *(void *)(a1 + 16);
  uint64_t v7 = (unint64_t *)&_swiftEmptyArrayStorage;
  if (v6)
  {
    uint64_t v22 = (unint64_t *)&_swiftEmptyArrayStorage;
    sub_100002FAC(0, v6, 0);
    uint64_t v7 = v22;
    uint64_t v10 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v8 = v3 + 16;
    uint64_t v9 = v10;
    uint64_t v11 = a1 + ((*(unsigned __int8 *)(v8 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 64));
    uint64_t v18 = *(void *)(v8 + 56);
    do
    {
      v9(v5, v11, v2);
      uint64_t v22 = v7;
      unint64_t v13 = v7[2];
      unint64_t v12 = v7[3];
      if (v13 >= v12 >> 1) {
        sub_100002FAC(v12 > 1, v13 + 1, 1);
      }
      uint64_t v20 = v2;
      uint64_t v21 = &protocol witness table for SiriUserFeedbackLearningMLRuntimePlugin;
      v14 = sub_100002FCC((uint64_t *)&v19);
      v9((char *)v14, (uint64_t)v5, v2);
      uint64_t v15 = v22;
      v22[2] = v13 + 1;
      sub_1000031D4(&v19, (uint64_t)&v15[5 * v13 + 4]);
      (*(void (**)(char *, uint64_t))(v8 - 8))(v5, v2);
      uint64_t v7 = v22;
      v11 += v18;
      --v6;
    }
    while (v6);
  }
  return v7;
}

id sub_100002738()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SiriUserFeedbackLearningPlatformPlugin();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SiriUserFeedbackLearningPlatformPlugin()
{
  return self;
}

uint64_t sub_1000027D0(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100002808(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_10000286C(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_1000028B0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100002984(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100002F4C((uint64_t)v12, *a3);
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
      sub_100002F4C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000031EC((uint64_t)v12);
  return v7;
}

uint64_t sub_100002984(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100003460();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100002B40(a5, a6);
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
  uint64_t v8 = sub_100003480();
  if (!v8)
  {
    sub_100003490();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1000034A0();
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

uint64_t sub_100002B40(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100002BD8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100002DB8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100002DB8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100002BD8(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100002D50(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100003470();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100003490();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100003430();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_1000034A0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100003490();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100002D50(uint64_t a1, uint64_t a2)
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
  sub_100002F08(&qword_100008578);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100002DB8(char a1, int64_t a2, char a3, char *a4)
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
    sub_100002F08(&qword_100008578);
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
  unint64_t v13 = a4 + 32;
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
  uint64_t result = sub_1000034A0();
  __break(1u);
  return result;
}

uint64_t sub_100002F08(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100002F4C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100002FAC(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100003030(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t *sub_100002FCC(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_100003030(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100002F08(&qword_100008580);
    uint64_t v10 = (void *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    uint64_t v10 = &_swiftEmptyArrayStorage;
  }
  unint64_t v12 = (unint64_t)(v10 + 4);
  unint64_t v13 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v12 >= v13 + 40 * v8) {
      memmove(v10 + 4, a4 + 4, 40 * v8);
    }
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 40 * v8 || v12 >= v13 + 40 * v8)
  {
    sub_100002F08(&qword_100008588);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_1000034A0();
  __break(1u);
  return result;
}

uint64_t sub_1000031D4(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_1000031EC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000323C()
{
  uint64_t v0 = sub_100003410();
  sub_1000032BC(v0, qword_100008600);
  sub_1000027D0(v0, (uint64_t)qword_100008600);
  return sub_100003400();
}

uint64_t *sub_1000032BC(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100003320()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_100003330()
{
  return SiriUserFeedbackLearningPlatformResult.mlrTaskResult.getter();
}

uint64_t sub_100003340()
{
  return SiriUserFeedbackLearningPlatformResult.init(result:)();
}

uint64_t sub_100003350()
{
  return type metadata accessor for SiriUserFeedbackLearningPlatformResult();
}

uint64_t sub_100003360()
{
  return SiriUserFeedbackLearningPluginLauncher.init()();
}

uint64_t sub_100003370()
{
  return type metadata accessor for SiriUserFeedbackLearningPluginLauncher();
}

uint64_t sub_100003380()
{
  return SiriUserFeedbackLearningMLRuntimePlugin.init(bundleIdentifier:)();
}

uint64_t sub_100003390()
{
  return type metadata accessor for SiriUserFeedbackLearningMLRuntimePlugin();
}

uint64_t sub_1000033A0()
{
  return dispatch thunk of SiriUserFeedbackLearningPluginLaunching.runPlugins(plugins:task:timeout:)();
}

uint64_t sub_1000033B0()
{
  return SiriUserFeedbackLearningTask.init(mlrTask:usageLogger:)();
}

uint64_t sub_1000033C0()
{
  return type metadata accessor for SiriUserFeedbackLearningTask();
}

uint64_t sub_1000033D0()
{
  return UsageLogger.init()();
}

uint64_t sub_1000033E0()
{
  return type metadata accessor for UsageLogger();
}

uint64_t sub_1000033F0()
{
  return Logger.logObject.getter();
}

uint64_t sub_100003400()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100003410()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100003420()
{
  return type metadata accessor for DispatchTimeInterval();
}

Swift::Int sub_100003430()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100003440()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100003450()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100003460()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100003470()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100003480()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100003490()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000034A0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
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

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t self
{
  return _self;
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
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

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
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