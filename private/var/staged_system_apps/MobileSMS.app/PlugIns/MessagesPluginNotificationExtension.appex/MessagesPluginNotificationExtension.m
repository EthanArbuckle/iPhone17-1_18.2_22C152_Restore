void sub_1000053C0(id a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  id v7;

  v1 = objc_alloc_init((Class)IMTimingCollection);
  [v1 startTimingForKey:@"plugin-notif-imagent-connection"];
  v2 = +[IMDaemonController sharedInstance];
  [v2 addListenerID:@"MessagesPluginNotificationExtension" capabilities:CKListenerPaginatedChatRegistryCapabilities()];

  v3 = +[IMDaemonController sharedInstance];
  [v3 blockUntilConnected];

  v4 = +[IMDaemonController sharedInstance];
  [v4 _setBlocksConnectionAtResume:1];

  [v1 stopTimingForKey:@"plugin-notif-imagent-connection"];
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = v1;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Initialized imagent connection from custom plugin notification %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

uint64_t sub_100005BC4()
{
  uint64_t v0 = sub_100009F90();
  sub_100007FE0(v0, qword_100010AA0);
  sub_100007EB4(v0, (uint64_t)qword_100010AA0);
  return sub_100009F80();
}

id sub_100005C48()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for AskToNotificationManager()) init];
  qword_100010AC0 = (uint64_t)result;
  return result;
}

unint64_t sub_100005CD4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100007534(&qword_1000109D8);
  v2 = (void *)sub_10000A290();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 48);
  while (1)
  {
    uint64_t v5 = (uint64_t)*(v4 - 2);
    uint64_t v6 = (uint64_t)*(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    id v8 = v7;
    unint64_t result = sub_100007DA4(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v11 = v5;
    v11[1] = v6;
    *(void *)(v2[7] + 8 * result) = v8;
    uint64_t v12 = v2[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v2[2] = v14;
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

unint64_t sub_100005DF0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100007534(&qword_1000109D0);
  v2 = (void *)sub_10000A290();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *(v4 - 2);
    uint64_t v6 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_100007DA4(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v10 = (uint64_t *)(v2[6] + 16 * result);
    *char v10 = v5;
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

uint64_t sub_100005F0C(void *a1, void *a2)
{
  uint64_t v3 = v2;
  unint64_t v5 = sub_100005CD4((uint64_t)&_swiftEmptyArrayStorage);
  uint64_t v6 = (void *)sub_10000A090();
  unint64_t v7 = sub_100009FA0();

  if (!(v7 >> 62))
  {
    uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v35 = v3;
    if (v8) {
      goto LABEL_3;
    }
LABEL_15:
    swift_bridgeObjectRelease();
    id v27 = [a1 request];
    id v28 = [v27 identifier];

    uint64_t v29 = sub_10000A0F0();
    uint64_t v31 = v30;

    v32 = (uint64_t *)(v35 + OBJC_IVAR___CKAskToNotificationManager_actionIdentifierToResponsePayloadMap);
    swift_beginAccess();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v39 = *v32;
    uint64_t *v32 = 0x8000000000000000;
    sub_100008874(v5, v29, v31, isUniquelyReferenced_nonNull_native);
    uint64_t *v32 = v39;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_endAccess();
  }
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_10000A260();
  swift_bridgeObjectRelease();
  uint64_t v35 = v3;
  if (!v8) {
    goto LABEL_15;
  }
LABEL_3:
  uint64_t result = sub_10000A0B0();
  if (v8 >= 1)
  {
    uint64_t v10 = 0;
    unint64_t v36 = v7 & 0xC000000000000001;
    unint64_t v37 = v7;
    do
    {
      if (v36) {
        id v11 = (id)sub_10000A230();
      }
      else {
        id v11 = *(id *)(v7 + 8 * v10 + 32);
      }
      BOOL v12 = v11;
      sub_10000A090();
      id v13 = objc_allocWithZone((Class)sub_10000A000());
      id v14 = v12;
      v15 = (void *)sub_100009FF0();
      uint64_t v16 = sub_10000A070();
      v17 = &_swiftEmptyArrayStorage;
      if (v16) {
        v17 = (void *)v16;
      }
      unint64_t v38 = (unint64_t)v17;
      id v18 = v15;
      sub_10000A120();
      if (*(void *)((v38 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v38 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_10000A160();
      }
      ++v10;
      sub_10000A170();
      sub_10000A150();
      swift_bridgeObjectRelease();
      id v19 = v18;
      id v20 = a2;
      v21 = (void *)sub_10000A080();
      uint64_t v22 = sub_100009FB0();
      uint64_t v24 = v23;
      id v25 = v21;
      char v26 = swift_isUniquelyReferenced_nonNull_native();
      sub_1000089E4((uint64_t)v25, v22, v24, v26);

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      unint64_t v7 = v37;
    }
    while (v8 != v10);
    goto LABEL_15;
  }
  __break(1u);
  return result;
}

id sub_100006230(void *a1)
{
  uint64_t v2 = sub_10000A060();
  uint64_t v54 = *(void *)(v2 - 8);
  uint64_t v55 = v2;
  __chkstk_darwin();
  v4 = (char *)&v49 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100007534(&qword_1000109A0);
  __chkstk_darwin();
  uint64_t v6 = (char *)&v49 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100009F60();
  uint64_t v56 = *(void *)(v7 - 8);
  __chkstk_darwin();
  char v9 = (char *)&v49 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = [a1 request];
  id v11 = [v10 content];

  id v12 = [v11 userInfo];
  uint64_t v13 = sub_10000A0C0();

  unint64_t v57 = 0xD000000000000018;
  unint64_t v58 = 0x800000010000AE90;
  sub_10000A210();
  if (*(void *)(v13 + 16) && (unint64_t v14 = sub_100007E1C((uint64_t)v59), (v15 & 1) != 0))
  {
    sub_100007F30(*(void *)(v13 + 56) + 32 * v14, (uint64_t)&v60);
  }
  else
  {
    long long v60 = 0u;
    long long v61 = 0u;
  }
  sub_100007E60((uint64_t)v59);
  if (!*((void *)&v61 + 1))
  {
    v17 = (uint64_t *)&unk_1000109A8;
    id v18 = (char *)&v60;
    goto LABEL_10;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_11:
    if (qword_100010A98 != -1) {
      swift_once();
    }
    uint64_t v19 = sub_100009F90();
    sub_100007EB4(v19, (uint64_t)qword_100010AA0);
    swift_bridgeObjectRetain();
    id v20 = sub_100009F70();
    os_log_type_t v21 = sub_10000A1B0();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      v59[0] = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v23 = sub_10000A0D0();
      unint64_t v25 = v24;
      swift_bridgeObjectRelease();
      *(void *)&long long v60 = sub_10000774C(v23, v25, (uint64_t *)v59);
      sub_10000A1D0();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "User info didn't have URL. userInfo: %s", v22, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return 0;
  }
  v53 = v4;
  sub_100009F50();
  swift_bridgeObjectRelease();
  uint64_t v16 = v56;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v56 + 48))(v6, 1, v7) == 1)
  {
    v17 = &qword_1000109A0;
    id v18 = v6;
LABEL_10:
    sub_100009D70((uint64_t)v18, v17);
    goto LABEL_11;
  }
  swift_bridgeObjectRelease();
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v9, v6, v7);
  sub_10000A050();
  sub_10000A0B0();
  sub_100007EEC(&qword_1000109B0);
  sub_100007EEC(&qword_1000109B8);
  sub_10000A040();
  uint64_t v26 = v16;
  id v27 = v59[0];
  id v28 = (void *)sub_10000A0A0();

  if (v28)
  {
    if (qword_100010A98 != -1) {
      swift_once();
    }
    uint64_t v29 = sub_100009F90();
    sub_100007EB4(v29, (uint64_t)qword_100010AA0);
    uint64_t v30 = sub_100009F70();
    os_log_type_t v31 = sub_10000A1B0();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v32 = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "Payload for notification not a request. Bailing.", v32, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v54 + 8))(v53, v55);
    (*(void (**)(char *, uint64_t))(v16 + 8))(v9, v7);
    return 0;
  }
  sub_100005F0C(a1, v27);
  v59[0] = &_swiftEmptyArrayStorage;
  v34 = (void *)sub_10000A090();
  unint64_t v35 = sub_100009FA0();

  if (v35 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v37 = sub_10000A260();
    unint64_t v36 = v35;
    swift_bridgeObjectRelease();
    if (v37) {
      goto LABEL_26;
    }
LABEL_39:
    swift_bridgeObjectRelease();
    unint64_t v47 = (unint64_t)&_swiftEmptyArrayStorage;
    goto LABEL_40;
  }
  unint64_t v36 = v35;
  uint64_t v37 = *(void *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v37) {
    goto LABEL_39;
  }
LABEL_26:
  id v49 = v27;
  id result = self;
  id v52 = result;
  if (v37 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v38 = 0;
  unint64_t v50 = v36 & 0xC000000000000001;
  uint64_t v51 = v37;
  do
  {
    if (v50) {
      id v39 = (id)sub_10000A230();
    }
    else {
      id v39 = *(id *)(v36 + 8 * v38 + 32);
    }
    v40 = v39;
    sub_100009FD0();
    int v41 = (unsigned __int16)sub_100009FC0();
    if (v41 == (unsigned __int16)sub_100009FC0()) {
      uint64_t v42 = 3;
    }
    else {
      uint64_t v42 = 1;
    }
    sub_100009FB0();
    sub_100009FE0();
    NSString v43 = sub_10000A0E0();
    swift_bridgeObjectRelease();
    NSString v44 = sub_10000A0E0();
    swift_bridgeObjectRelease();
    id v45 = [v52 actionWithIdentifier:v43 title:v44 options:v42];

    id v46 = v45;
    sub_10000A120();
    if (*(void *)(((unint64_t)v59[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)(((unint64_t)v59[0] & 0xFFFFFFFFFFFFFF8)
                                                                                           + 0x18) >> 1)
      sub_10000A160();
    ++v38;
    sub_10000A170();
    sub_10000A150();
  }
  while (v51 != v38);
  swift_bridgeObjectRelease();
  unint64_t v47 = (unint64_t)v59[0];
  uint64_t v26 = v56;
  id v27 = v49;
LABEL_40:
  if (v47 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v48 = sub_10000A260();
  }
  else
  {
    uint64_t v48 = *(void *)((v47 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
  }

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v54 + 8))(v53, v55);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v9, v7);
  id result = v59[0];
  if (!v48)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return result;
}

uint64_t sub_100006DA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[5] = a6;
  v7[6] = a7;
  v7[3] = a4;
  v7[4] = a5;
  return _swift_task_switch(sub_100006DCC, 0, 0);
}

uint64_t sub_100006DCC()
{
  sub_10000A030();
  swift_allocObject();
  v0[7] = sub_10000A020();
  v1 = (void *)swift_task_alloc();
  v0[8] = v1;
  void *v1 = v0;
  v1[1] = sub_100006E88;
  uint64_t v3 = v0[3];
  uint64_t v2 = v0[4];
  return ATDaemonConnectionManager.sendResponsePayloadViaIDS(_:to:)(v3, v2);
}

uint64_t sub_100006E88()
{
  *(void *)(*(void *)v1 + 72) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_100007010;
  }
  else {
    uint64_t v2 = sub_100006F9C;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_100006F9C()
{
  (*(void (**)(uint64_t))(v0 + 40))(1);
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100007010()
{
  if (qword_100010A98 != -1) {
    swift_once();
  }
  uint64_t v1 = sub_100009F90();
  sub_100007EB4(v1, (uint64_t)qword_100010AA0);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v2 = sub_100009F70();
  os_log_type_t v3 = sub_10000A1C0();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    uint64_t v5 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v4 = 138412290;
    swift_errorRetain();
    uint64_t v6 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 16) = v6;
    sub_10000A1D0();
    *uint64_t v5 = v6;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Error sending response payload: %@", v4, 0xCu);
    sub_100007534(&qword_1000109C0);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_errorRelease();
    swift_errorRelease();
  }

  (*(void (**)(void))(v0 + 40))(0);
  swift_release();
  swift_errorRelease();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_100007228(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10000A1A0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_10000A190();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100009D70(a1, &qword_1000109E0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_10000A180();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

id sub_1000074CC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AskToNotificationManager();
  [super dealloc];
}

uint64_t type metadata accessor for AskToNotificationManager()
{
  return self;
}

uint64_t sub_100007534(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100007578(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_100007654;
  return v6(a1);
}

uint64_t sub_100007654()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000774C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100007820(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100007F30((uint64_t)v12, *a3);
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
      sub_100007F30((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100007F8C((uint64_t)v12);
  return v7;
}

uint64_t sub_100007820(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_10000A1E0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1000079DC(a5, a6);
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
  uint64_t v8 = sub_10000A240();
  if (!v8)
  {
    sub_10000A250();
    __break(1u);
LABEL_17:
    uint64_t result = sub_10000A2A0();
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

uint64_t sub_1000079DC(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100007A74(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100007C54(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100007C54(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100007A74(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100007BEC(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_10000A220();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_10000A250();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_10000A110();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_10000A2A0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_10000A250();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100007BEC(uint64_t a1, uint64_t a2)
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
  sub_100007534(&qword_1000109C8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100007C54(char a1, int64_t a2, char a3, char *a4)
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
    sub_100007534(&qword_1000109C8);
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
  uint64_t result = sub_10000A2A0();
  __break(1u);
  return result;
}

unint64_t sub_100007DA4(uint64_t a1, uint64_t a2)
{
  sub_10000A2D0();
  sub_10000A100();
  Swift::Int v4 = sub_10000A2E0();

  return sub_100008044(a1, a2, v4);
}

unint64_t sub_100007E1C(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_10000A1F0(*(void *)(v2 + 40));

  return sub_100008128(a1, v4);
}

uint64_t sub_100007E60(uint64_t a1)
{
  return a1;
}

uint64_t sub_100007EB4(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_100007EEC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000A0B0();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100007F30(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100007F8C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t *sub_100007FE0(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_100008044(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_10000A2B0() & 1) == 0)
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
      while (!v14 && (sub_10000A2B0() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_100008128(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_1000081F0(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_10000A200();
      sub_100007E60((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_1000081F0(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10000824C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100007534(&qword_1000109D0);
  char v36 = a2;
  uint64_t v6 = sub_10000A280();
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
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void *)(*(void *)(v5 + 56) + 8 * v20);
    if ((v36 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_10000A2D0();
    sub_10000A100();
    uint64_t result = sub_10000A2E0();
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
    id v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *id v18 = v31;
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
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_100008564(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_100007534(&qword_1000109D8);
  char v38 = a2;
  uint64_t v6 = sub_10000A280();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v37 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  uint64_t v35 = v2;
  int64_t v36 = (unint64_t)(v8 + 63) >> 6;
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
    if (v21 >= v36) {
      break;
    }
    uint64_t v22 = (void *)(v5 + 64);
    unint64_t v23 = *(void *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      int64_t v13 = v21 + 1;
      if (v21 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v23 = *(void *)(v37 + 8 * v13);
      if (!v23)
      {
        int64_t v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v35;
          if ((v38 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v23 = *(void *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            int64_t v13 = v24 + 1;
            if (__OFADD__(v24, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v36) {
              goto LABEL_33;
            }
            unint64_t v23 = *(void *)(v37 + 8 * v13);
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
    uint64_t v29 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v20);
    uint64_t v31 = *v29;
    uint64_t v30 = v29[1];
    uint64_t v32 = *(void **)(*(void *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      id v33 = v32;
    }
    sub_10000A2D0();
    sub_10000A100();
    uint64_t result = sub_10000A2E0();
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
    id v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    *id v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v35;
  uint64_t v22 = (void *)(v5 + 64);
  if ((v38 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v34 = 1 << *(unsigned char *)(v5 + 32);
  if (v34 >= 64) {
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v22 = -1 << v34;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

uint64_t sub_100008874(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_100007DA4(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_100008B54();
LABEL_7:
    id v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_bridgeObjectRelease();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_10000824C(v15, a4 & 1);
  unint64_t v21 = sub_100007DA4(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_10000A2C0();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  id v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  unint64_t v23 = (uint64_t *)(v18[6] + 16 * v12);
  *unint64_t v23 = a2;
  v23[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v24 = v18[2];
  BOOL v25 = __OFADD__(v24, 1);
  uint64_t v26 = v24 + 1;
  if (v25)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v26;

  return swift_bridgeObjectRetain();
}

void sub_1000089E4(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_100007DA4(a2, a3);
  uint64_t v13 = *(void *)(v10 + 16);
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v16 = v11;
  uint64_t v17 = *(void *)(v10 + 24);
  if (v17 >= v15 && (a4 & 1) != 0) {
    goto LABEL_7;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_100008D0C();
LABEL_7:
    id v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];

      *(void *)(v19 + 8 * v12) = a1;
      return;
    }
    goto LABEL_11;
  }
  sub_100008564(v15, a4 & 1);
  unint64_t v20 = sub_100007DA4(a2, a3);
  if ((v16 & 1) != (v21 & 1))
  {
LABEL_17:
    sub_10000A2C0();
    __break(1u);
    return;
  }
  unint64_t v12 = v20;
  id v18 = (void *)*v5;
  if (v16) {
    goto LABEL_8;
  }
LABEL_11:
  v18[(v12 >> 6) + 8] |= 1 << v12;
  char v22 = (uint64_t *)(v18[6] + 16 * v12);
  *char v22 = a2;
  v22[1] = a3;
  *(void *)(v18[7] + 8 * v12) = a1;
  uint64_t v23 = v18[2];
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (v24)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v18[2] = v25;

  swift_bridgeObjectRetain();
}

void *sub_100008B54()
{
  uint64_t v1 = v0;
  sub_100007534(&qword_1000109D0);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10000A270();
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void *)(*(void *)(v2 + 56) + v19);
    char v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

id sub_100008D0C()
{
  uint64_t v1 = v0;
  sub_100007534(&qword_1000109D8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10000A270();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 64), 8 * v7);
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
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v18 = v17[1];
    uint64_t v19 = 8 * v15;
    uint64_t v20 = *(void **)(*(void *)(v2 + 56) + v19);
    char v21 = (void *)(*(void *)(v4 + 48) + v16);
    void *v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    id result = v20;
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13) {
    goto LABEL_26;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_100008EC0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100008EE0(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_100008EE0(char a1, int64_t a2, char a3, char *a4)
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
    sub_100007534(&qword_100010A10);
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
  int64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
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
  uint64_t result = sub_10000A2A0();
  __break(1u);
  return result;
}

void sub_10000904C(void *a1, uint64_t a2, void (**a3)(const void *, void))
{
  uint64_t v78 = a2;
  sub_100007534(&qword_1000109E0);
  __chkstk_darwin();
  v76 = (char *)&v76 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = swift_allocObject();
  *(void *)(v82 + 16) = a3;
  v80 = a3;
  _Block_copy(a3);
  id v79 = a1;
  id v6 = [a1 notification];
  id v7 = [v6 request];

  id v8 = [v7 content];
  id v9 = [v8 threadIdentifier];

  NSString v10 = v9;
  if (!v9)
  {
    sub_10000A0F0();
    NSString v10 = sub_10000A0E0();
    swift_bridgeObjectRelease();
  }
  uint64_t v11 = sub_10000A0F0();
  unint64_t v13 = v12;
  if (qword_100010A98 != -1) {
    swift_once();
  }
  uint64_t v14 = sub_100009F90();
  uint64_t v15 = sub_100007EB4(v14, (uint64_t)qword_100010AA0);
  swift_bridgeObjectRetain_n();
  uint64_t v81 = v15;
  uint64_t v16 = sub_100009F70();
  os_log_type_t v17 = sub_10000A1B0();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    v84[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v18 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v85 = sub_10000774C(v11, v13, v84);
    sub_10000A1D0();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Creating chat controller for identifier: %s", v18, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  id v19 = [self sharedRegistry];
  id v20 = [v19 existingChatWithChatIdentifier:v10];

  if (!v20)
  {
    swift_bridgeObjectRetain();
    uint64_t v35 = sub_100009F70();
    os_log_type_t v36 = sub_10000A1C0();
    if (os_log_type_enabled(v35, v36))
    {
      uint64_t v37 = (uint8_t *)swift_slowAlloc();
      v84[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v37 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v85 = sub_10000774C(v11, v13, v84);
      sub_10000A1D0();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v35, v36, "Couldn't find chat for identifier %s", v37, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v80[2](v80, 0);
    goto LABEL_24;
  }
  swift_bridgeObjectRelease();
  id v21 = [v20 participants];
  sub_100009EBC(0, &qword_1000109E8);
  unint64_t v22 = sub_10000A140();

  if (v22 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v23 = sub_10000A260();
    swift_bridgeObjectRelease();
    id v77 = v20;
    if (v23) {
      goto LABEL_11;
    }
LABEL_26:
    swift_bridgeObjectRelease();
    uint64_t v25 = &_swiftEmptyArrayStorage;
    goto LABEL_27;
  }
  uint64_t v23 = *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10);
  id v77 = v20;
  if (!v23) {
    goto LABEL_26;
  }
LABEL_11:
  v84[0] = (uint64_t)&_swiftEmptyArrayStorage;
  sub_100008EC0(0, v23 & ~(v23 >> 63), 0);
  if (v23 < 0)
  {
    __break(1u);
    return;
  }
  uint64_t v24 = 0;
  uint64_t v25 = (void *)v84[0];
  do
  {
    if ((v22 & 0xC000000000000001) != 0) {
      id v26 = (id)sub_10000A230();
    }
    else {
      id v26 = *(id *)(v22 + 8 * v24 + 32);
    }
    BOOL v27 = v26;
    id v28 = [v26 ID];
    uint64_t v29 = sub_10000A0F0();
    uint64_t v31 = v30;

    v84[0] = (uint64_t)v25;
    unint64_t v33 = v25[2];
    unint64_t v32 = v25[3];
    if (v33 >= v32 >> 1)
    {
      sub_100008EC0(v32 > 1, v33 + 1, 1);
      uint64_t v25 = (void *)v84[0];
    }
    ++v24;
    v25[2] = v33 + 1;
    uint64_t v34 = (char *)&v25[2 * v33];
    *((void *)v34 + 4) = v29;
    *((void *)v34 + 5) = v31;
  }
  while (v23 != v24);
  swift_bridgeObjectRelease();
  id v20 = v77;
LABEL_27:
  id v38 = v79;
  if (v25[2])
  {
    id v39 = [v79 notification];
    id v40 = [v39 request];

    id v41 = [v40 identifier];
    uint64_t v42 = sub_10000A0F0();
    uint64_t v44 = v43;

    id v45 = (uint64_t *)(v78 + OBJC_IVAR___CKAskToNotificationManager_actionIdentifierToResponsePayloadMap);
    swift_beginAccess();
    uint64_t v46 = *v45;
    if (*(void *)(*v45 + 16))
    {
      swift_bridgeObjectRetain();
      unint64_t v47 = sub_100007DA4(v42, v44);
      if (v48)
      {
        uint64_t v49 = *(void *)(*(void *)(v46 + 56) + 8 * v47);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        id v50 = [v38 actionIdentifier];
        uint64_t v51 = sub_10000A0F0();
        uint64_t v53 = v52;

        if (*(void *)(v49 + 16))
        {
          unint64_t v54 = sub_100007DA4(v51, v53);
          if (v55)
          {
            id v56 = *(id *)(*(void *)(v49 + 56) + 8 * v54);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            uint64_t v57 = sub_10000A1A0();
            uint64_t v58 = (uint64_t)v76;
            (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v57 - 8) + 56))(v76, 1, 1, v57);
            v59 = (void *)swift_allocObject();
            v59[2] = 0;
            v59[3] = 0;
            v59[4] = v56;
            id v59[5] = v25;
            uint64_t v60 = v82;
            v59[6] = sub_100009B68;
            v59[7] = v60;
            swift_retain();
            sub_100007228(v58, (uint64_t)&unk_1000109F8, (uint64_t)v59);
            swift_release();

LABEL_24:
            swift_release();
            return;
          }
        }
      }
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    id v68 = v38;
    v69 = sub_100009F70();
    os_log_type_t v70 = sub_10000A1C0();
    if (os_log_type_enabled(v69, v70))
    {
      v71 = (uint8_t *)swift_slowAlloc();
      uint64_t v85 = swift_slowAlloc();
      *(_DWORD *)v71 = 136315138;
      id v72 = [v68 actionIdentifier];
      uint64_t v73 = sub_10000A0F0();
      unint64_t v75 = v74;

      uint64_t v83 = sub_10000774C(v73, v75, &v85);
      sub_10000A1D0();

      id v20 = v77;
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v69, v70, "responsePayloadMap didn't have response payload for identifier %s", v71, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    v80[2](v80, 0);
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    long long v61 = v20;
    v62 = sub_100009F70();
    os_log_type_t v63 = sub_10000A1C0();
    if (os_log_type_enabled(v62, v63))
    {
      v64 = (uint8_t *)swift_slowAlloc();
      v65 = (void *)swift_slowAlloc();
      *(_DWORD *)v64 = 138412290;
      v84[0] = (uint64_t)v61;
      v66 = v61;
      sub_10000A1D0();
      void *v65 = v20;

      _os_log_impl((void *)&_mh_execute_header, v62, v63, "Recipient addresses was empty for chat %@", v64, 0xCu);
      sub_100007534(&qword_1000109C0);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      v62 = v61;
    }
    v67 = v80;

    v67[2](v67, 0);
    swift_release();
  }
}

uint64_t sub_100009B30()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100009B68()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_100009B7C()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_100009BCC()
{
  uint64_t v2 = swift_task_alloc();
  long long v3 = *(_OWORD *)(v0 + 32);
  long long v4 = *(_OWORD *)(v0 + 48);
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = sub_100009C7C;
  *(_OWORD *)(v2 + 40) = v4;
  *(_OWORD *)(v2 + 24) = v3;
  return _swift_task_switch(sub_100006DCC, 0, 0);
}

uint64_t sub_100009C7C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100009D70(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100007534(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100009DCC()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100009E04(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100009C7C;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100010A00 + dword_100010A00);
  return v6(a1, v4);
}

uint64_t sub_100009EBC(uint64_t a1, unint64_t *a2)
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

void type metadata accessor for UNNotificationContentExtensionResponseOption()
{
  if (!qword_100010A20)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_100010A20);
    }
  }
}

uint64_t sub_100009F50()
{
  return URL.init(string:)();
}

uint64_t sub_100009F60()
{
  return type metadata accessor for URL();
}

uint64_t sub_100009F70()
{
  return Logger.logObject.getter();
}

uint64_t sub_100009F80()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_100009F90()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100009FA0()
{
  return ATQuestion.answerChoices.getter();
}

uint64_t sub_100009FB0()
{
  return ATAnswerChoice.id.getter();
}

uint64_t sub_100009FC0()
{
  return ATAnswerChoice.Kind.rawValue.getter();
}

uint64_t sub_100009FD0()
{
  return ATAnswerChoice.kind.getter();
}

uint64_t sub_100009FE0()
{
  return ATAnswerChoice.title.getter();
}

uint64_t sub_100009FF0()
{
  return ATResponse.init(originalQuestion:responderHandle:chosenAnswer:)();
}

uint64_t sub_10000A000()
{
  return type metadata accessor for ATResponse();
}

uint64_t sub_10000A020()
{
  return ATDaemonConnectionManager.init()();
}

uint64_t sub_10000A030()
{
  return type metadata accessor for ATDaemonConnectionManager();
}

uint64_t sub_10000A040()
{
  return ATURL.Parser.parse<A>(_:from:)();
}

uint64_t sub_10000A050()
{
  return ATURL.Parser.init()();
}

uint64_t sub_10000A060()
{
  return type metadata accessor for ATURL.Parser();
}

uint64_t sub_10000A070()
{
  return ATPayload.allResponses.getter();
}

uint64_t sub_10000A080()
{
  return ATPayload.__allocating_init(originalPayload:newResponse:)();
}

uint64_t sub_10000A090()
{
  return ATPayload.question.getter();
}

uint64_t sub_10000A0A0()
{
  return ATPayload.response.getter();
}

uint64_t sub_10000A0B0()
{
  return type metadata accessor for ATPayload();
}

uint64_t sub_10000A0C0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000A0D0()
{
  return Dictionary.description.getter();
}

NSString sub_10000A0E0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10000A0F0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000A100()
{
  return String.hash(into:)();
}

Swift::Int sub_10000A110()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_10000A120()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_10000A130()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_10000A140()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000A150()
{
  return specialized Array._endMutation()();
}

uint64_t sub_10000A160()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_10000A170()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_10000A180()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_10000A190()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_10000A1A0()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_10000A1B0()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_10000A1C0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10000A1D0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10000A1E0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

Swift::Int sub_10000A1F0(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_10000A200()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_10000A210()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_10000A220()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10000A230()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_10000A240()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10000A250()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10000A260()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_10000A270()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_10000A280()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_10000A290()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_10000A2A0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_10000A2B0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10000A2C0()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10000A2D0()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_10000A2E0()
{
  return Hasher._finalize()();
}

uint64_t CKListenerPaginatedChatRegistryCapabilities()
{
  return _CKListenerPaginatedChatRegistryCapabilities();
}

uint64_t IMBalloonExtensionIDWithSuffix()
{
  return _IMBalloonExtensionIDWithSuffix();
}

uint64_t IMOSLoggingEnabled()
{
  return _IMOSLoggingEnabled();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t OSLogHandleForIMFoundationCategory()
{
  return _OSLogHandleForIMFoundationCategory();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_end_catch(void)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
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

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
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

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
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

id objc_msgSend__setBlocksConnectionAtResume_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setBlocksConnectionAtResume:");
}

id objc_msgSend_addListenerID_capabilities_(void *a1, const char *a2, ...)
{
  return [a1 addListenerID:capabilities:];
}

id objc_msgSend_blockUntilConnected(void *a1, const char *a2, ...)
{
  return _[a1 blockUntilConnected];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return _[a1 clearColor];
}

id objc_msgSend_connectIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 connectIfNeeded];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return _[a1 content];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_customNotificationManagerForBalloonBundleID_(void *a1, const char *a2, ...)
{
  return [a1 customNotificationManagerForBalloonBundleID:];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return _[a1 extensionContext];
}

id objc_msgSend_handleResponse_completion_(void *a1, const char *a2, ...)
{
  return [a1 handleResponse:completion:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_notification(void *a1, const char *a2, ...)
{
  return _[a1 notification];
}

id objc_msgSend_notificationActionsFromNotification_(void *a1, const char *a2, ...)
{
  return [a1 notificationActionsFromNotification:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return _[a1 request];
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundColor:];
}

id objc_msgSend_setNotificationActions_(void *a1, const char *a2, ...)
{
  return [a1 setNotificationActions:];
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return [a1 setView:];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedManager];
}

id objc_msgSend_startTimingForKey_(void *a1, const char *a2, ...)
{
  return [a1 startTimingForKey:];
}

id objc_msgSend_stopTimingForKey_(void *a1, const char *a2, ...)
{
  return [a1 stopTimingForKey:];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}