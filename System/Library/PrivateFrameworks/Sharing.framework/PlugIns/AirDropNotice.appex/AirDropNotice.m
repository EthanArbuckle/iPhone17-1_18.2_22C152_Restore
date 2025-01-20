uint64_t sub_1000056A0()
{
  uint64_t v0;

  v0 = sub_10000D0D0();
  sub_10000B0E8(v0, qword_100014AA8);
  sub_10000A948(v0, (uint64_t)qword_100014AA8);
  return sub_10000D0C0();
}

BOOL sub_100005724(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_10000573C()
{
  Swift::UInt v1 = *v0;
  sub_10000D2C0();
  sub_10000D2D0(v1);
  return sub_10000D2E0();
}

void sub_100005784()
{
  sub_10000D2D0(*v0);
}

Swift::Int sub_1000057B0()
{
  Swift::UInt v1 = *v0;
  sub_10000D2C0();
  sub_10000D2D0(v1);
  return sub_10000D2E0();
}

uint64_t sub_1000057F4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_10000D110();
  swift_release();
  swift_release();
  return v1;
}

unint64_t sub_100005868(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000B0A0(&qword_1000150F8);
  v2 = (void *)sub_10000D280();
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
    swift_retain();
    unint64_t result = sub_10000B184(v5, v6);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (uint64_t *)(v2[6] + 16 * result);
    uint64_t *v10 = v5;
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

unint64_t sub_100005984(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000B0A0(&qword_100015100);
  v2 = (void *)sub_10000D280();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (_OWORD *)(a1 + 48);
  while (1)
  {
    uint64_t v5 = *((void *)v4 - 2);
    uint64_t v6 = *((void *)v4 - 1);
    long long v13 = *v4;
    swift_bridgeObjectRetain();
    swift_retain();
    unint64_t result = sub_10000B184(v5, v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    char v9 = (uint64_t *)(v2[6] + 16 * result);
    *char v9 = v5;
    v9[1] = v6;
    *(_OWORD *)(v2[7] + 16 * result) = v13;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v2[2] = v12;
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

id sub_100005AB0()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = sub_10000B0A0(&qword_100015108);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v0[OBJC_IVAR____TtC13AirDropNotice35WolfAirDropNoticeSessionsController_connection] = 0;
  *(void *)&v0[OBJC_IVAR____TtC13AirDropNotice35WolfAirDropNoticeSessionsController_server] = 0;
  uint64_t v6 = &v0[OBJC_IVAR____TtC13AirDropNotice35WolfAirDropNoticeSessionsController__airDropSessionsByID];
  uint64_t v7 = v0;
  unint64_t v13 = sub_100005868((uint64_t)&_swiftEmptyArrayStorage);
  sub_10000B0A0(&qword_100014B20);
  sub_10000D0F0();
  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v6, v5, v2);
  uint64_t v8 = OBJC_IVAR____TtC13AirDropNotice35WolfAirDropNoticeSessionsController_unassociatedDismissalHandler;
  *(void *)&v7[v8] = sub_100005984((uint64_t)&_swiftEmptyArrayStorage);

  v12.receiver = v7;
  v12.super_class = ObjectType;
  id v9 = objc_msgSendSuper2(&v12, "init");
  sub_100005C2C();

  return v9;
}

void sub_100005C2C()
{
  uint64_t v1 = v0;
  if (qword_100014AA0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10000D0D0();
  sub_10000A948(v2, (uint64_t)qword_100014AA8);
  uint64_t v3 = sub_10000D0B0();
  os_log_type_t v4 = sub_10000D1D0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Activating connection", v5, 2u);
    swift_slowDealloc();
  }

  NSString v6 = sub_10000D160();
  v47 = [self interfaceWithIdentifier:v6];

  uint64_t v7 = self;
  id v8 = [v7 protocolForProtocol:&OBJC_PROTOCOL___SFAirDropNoticeServer];
  [v47 setServer:v8];

  id v9 = [v7 protocolForProtocol:&OBJC_PROTOCOL___SFAirDropNoticeClient];
  [v47 setClient:v9];

  [v47 setClientMessagingExpectation:1];
  NSString v10 = sub_10000D160();
  NSString v11 = sub_10000D160();
  id v12 = [self endpointForMachName:v10 service:v11 instance:0];

  if (v12)
  {
    id v13 = v12;
    v14 = sub_10000D0B0();
    os_log_type_t v15 = sub_10000D1B0();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "WolfAirDropNoticeSessionsController: endpoint created!", v16, 2u);
      swift_slowDealloc();
    }

    id v17 = [self connectionWithEndpoint:v13];
    if (v17)
    {
      v18 = v17;
      aBlock[6] = &OBJC_PROTOCOL___BSServiceConnectionClient;
      uint64_t v19 = swift_dynamicCastObjCProtocolConditional();
      if (v19)
      {
        v20 = (void *)v19;
        id v21 = v18;
        v22 = sub_10000D0B0();
        os_log_type_t v23 = sub_10000D1B0();
        if (os_log_type_enabled(v22, v23))
        {
          v24 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v24 = 0;
          _os_log_impl((void *)&_mh_execute_header, v22, v23, "WolfAirDropNoticeSessionsController: connection created", v24, 2u);
          swift_slowDealloc();
        }

        uint64_t v25 = swift_allocObject();
        *(void *)(v25 + 16) = v47;
        *(void *)(v25 + 24) = v1;
        uint64_t v26 = swift_allocObject();
        *(void *)(v26 + 16) = sub_10000CE6C;
        *(void *)(v26 + 24) = v25;
        aBlock[4] = sub_10000CE84;
        aBlock[5] = v26;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = sub_100006D68;
        aBlock[3] = &unk_100010740;
        v27 = _Block_copy(aBlock);
        id v28 = v21;
        v29 = v47;
        v30 = v1;
        swift_retain();
        swift_release();
        [v20 configureConnection:v27];

        _Block_release(v27);
        LOBYTE(v27) = swift_isEscapingClosureAtFileLocation();
        swift_release();
        if (v27)
        {
          __break(1u);
        }
        else
        {
          v48 = v29;
          uint64_t v31 = OBJC_IVAR____TtC13AirDropNotice35WolfAirDropNoticeSessionsController_connection;
          if (*(void *)&v30[OBJC_IVAR____TtC13AirDropNotice35WolfAirDropNoticeSessionsController_connection])
          {
            v32 = sub_10000D0B0();
            os_log_type_t v33 = sub_10000D1C0();
            if (os_log_type_enabled(v32, v33))
            {
              v34 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v34 = 0;
              _os_log_impl((void *)&_mh_execute_header, v32, v33, "WolfAirDropNoticeSessionsController: Previous connection present while trying to activate. Ending previous then activating new connection", v34, 2u);
              swift_slowDealloc();
            }

            sub_100006A84();
            v35 = *(void **)&v30[v31];
          }
          else
          {
            v35 = 0;
          }
          *(void *)&v30[v31] = v20;
          id v42 = v28;

          v43 = sub_10000D0B0();
          os_log_type_t v44 = sub_10000D1D0();
          if (os_log_type_enabled(v43, v44))
          {
            v45 = (uint8_t *)swift_slowAlloc();
            *(_WORD *)v45 = 0;
            _os_log_impl((void *)&_mh_execute_header, v43, v44, "WolfAirDropNoticeSessionsController: Activating Session", v45, 2u);
            swift_slowDealloc();
          }

          [v20 activate];
          swift_release();
        }
        return;
      }
    }
    v39 = sub_10000D0B0();
    os_log_type_t v40 = sub_10000D1C0();
    if (os_log_type_enabled(v39, v40))
    {
      v41 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v41 = 0;
      _os_log_impl((void *)&_mh_execute_header, v39, v40, "Could not create a connection with the AirDropNotice endpoint", v41, 2u);
      swift_slowDealloc();
    }
    else
    {
    }
    return;
  }
  oslog = sub_10000D0B0();
  os_log_type_t v36 = sub_10000D1C0();
  if (os_log_type_enabled(oslog, v36))
  {
    v37 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v37 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v36, "Could not find endpoint for AirDropNotice. It may not be loaded.", v37, 2u);
    swift_slowDealloc();

    v38 = oslog;
  }
  else
  {

    v38 = v47;
  }
}

void sub_1000063BC(void *a1, uint64_t a2, uint64_t a3)
{
  if (qword_100014AA0 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_10000D0D0();
  sub_10000A948(v6, (uint64_t)qword_100014AA8);
  uint64_t v7 = sub_10000D0B0();
  os_log_type_t v8 = sub_10000D1B0();
  if (os_log_type_enabled(v7, v8))
  {
    id v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "WolfAirDropNoticeSessionsController: configuring session...", v9, 2u);
    swift_slowDealloc();
  }

  NSString v10 = sub_10000D160();
  [a1 setName:v10];

  id v11 = [self userInitiated];
  [a1 setServiceQuality:v11];

  [a1 setInterface:a2];
  [a1 setInterfaceTarget:a3];
  uint64_t v12 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v22 = sub_10000CEFC;
  uint64_t v23 = v12;
  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 1107296256;
  v20 = sub_100006910;
  id v21 = &unk_100010790;
  id v13 = _Block_copy(&v18);
  swift_release();
  [a1 setActivationHandler:v13];
  _Block_release(v13);
  uint64_t v14 = swift_allocObject();
  swift_unknownObjectUnownedInit();
  v22 = sub_10000CF3C;
  uint64_t v23 = v14;
  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 1107296256;
  v20 = sub_100006910;
  id v21 = &unk_1000107E0;
  os_log_type_t v15 = _Block_copy(&v18);
  swift_release();
  [a1 setInvalidationHandler:v15];
  _Block_release(v15);
  v22 = sub_100006C80;
  uint64_t v23 = 0;
  v18 = _NSConcreteStackBlock;
  uint64_t v19 = 1107296256;
  v20 = sub_100006910;
  id v21 = &unk_100010808;
  v16 = _Block_copy(&v18);
  [a1 setInterruptionHandler:v16];
  _Block_release(v16);
  sub_10000CF44(0, &qword_100015170);
  id v17 = (void *)sub_10000D1E0();
  [a1 setTargetQueue:v17];
}

uint64_t sub_100006748(void *a1)
{
  if (qword_100014AA0 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_10000D0D0();
  sub_10000A948(v2, (uint64_t)qword_100014AA8);
  uint64_t v3 = sub_10000D0B0();
  os_log_type_t v4 = sub_10000D1B0();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "WolfAirDropNoticeSessionsController connection activated!", v5, 2u);
    swift_slowDealloc();
  }

  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v7 = (char *)result;
    if ([a1 remoteTarget])
    {
      sub_10000D210();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v11, 0, sizeof(v11));
    }
    sub_10000CF80((uint64_t)v11, (uint64_t)v12);
    if (v13)
    {
      sub_10000B0A0((uint64_t *)&unk_100015180);
      int v8 = swift_dynamicCast();
      uint64_t v9 = v10;
      if (!v8) {
        uint64_t v9 = 0;
      }
    }
    else
    {
      sub_10000CFE8((uint64_t)v12);
      uint64_t v9 = 0;
    }
    *(void *)&v7[OBJC_IVAR____TtC13AirDropNotice35WolfAirDropNoticeSessionsController_server] = v9;

    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_100006910(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

void sub_100006978()
{
  if (qword_100014AA0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10000D0D0();
  sub_10000A948(v0, (uint64_t)qword_100014AA8);
  uint64_t v1 = sub_10000D0B0();
  os_log_type_t v2 = sub_10000D1D0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "WolfAirDropNoticeSessionsController connection invalidated with endpoint!", v3, 2u);
    swift_slowDealloc();
  }

  id Strong = (id)swift_unknownObjectUnownedLoadStrong();
  sub_100006A84();
}

void sub_100006A84()
{
  uint64_t v1 = OBJC_IVAR____TtC13AirDropNotice35WolfAirDropNoticeSessionsController_connection;
  os_log_type_t v2 = *(void **)(v0 + OBJC_IVAR____TtC13AirDropNotice35WolfAirDropNoticeSessionsController_connection);
  if (v2)
  {
    uint64_t v3 = v0;
    uint64_t v4 = qword_100014AA0;
    id v5 = v2;
    if (v4 != -1) {
      swift_once();
    }
    uint64_t v6 = sub_10000D0D0();
    sub_10000A948(v6, (uint64_t)qword_100014AA8);
    uint64_t v7 = sub_10000D0B0();
    os_log_type_t v8 = sub_10000D1D0();
    if (os_log_type_enabled(v7, v8))
    {
      uint64_t v9 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "WolfAirDropNoticeSessionsController: Invalidating connection", v9, 2u);
      swift_slowDealloc();
    }

    [v5 invalidate];
    *(void *)(v3 + OBJC_IVAR____TtC13AirDropNotice35WolfAirDropNoticeSessionsController_server) = 0;
    swift_unknownObjectRelease();
    uint64_t v10 = *(NSObject **)(v3 + v1);
    *(void *)(v3 + v1) = 0;
  }
  else
  {
    if (qword_100014AA0 != -1) {
      swift_once();
    }
    uint64_t v11 = sub_10000D0D0();
    sub_10000A948(v11, (uint64_t)qword_100014AA8);
    oslog = sub_10000D0B0();
    os_log_type_t v12 = sub_10000D1B0();
    if (os_log_type_enabled(oslog, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, oslog, v12, "XPC Connection not available, skipping end.", v13, 2u);
      swift_slowDealloc();
    }
    uint64_t v10 = oslog;
  }
}

void sub_100006C80()
{
  if (qword_100014AA0 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_10000D0D0();
  sub_10000A948(v0, (uint64_t)qword_100014AA8);
  oslog = sub_10000D0B0();
  os_log_type_t v1 = sub_10000D1D0();
  if (os_log_type_enabled(oslog, v1))
  {
    os_log_type_t v2 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)os_log_type_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, oslog, v1, "Client received interruption", v2, 2u);
    swift_slowDealloc();
  }
}

uint64_t sub_100006D68(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_unknownObjectRetain();
  v3(a2);

  return swift_unknownObjectRelease();
}

id sub_100006DBC()
{
  os_log_type_t v1 = v0;
  ObjectType = (objc_class *)swift_getObjectType();
  if (qword_100014AA0 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_10000D0D0();
  sub_10000A948(v3, (uint64_t)qword_100014AA8);
  uint64_t v4 = sub_10000D0B0();
  os_log_type_t v5 = sub_10000D1D0();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "WolfAirDropNoticeSessionsController deinit", v6, 2u);
    swift_slowDealloc();
  }

  sub_100006A84();
  v8.receiver = v1;
  v8.super_class = ObjectType;
  return objc_msgSendSuper2(&v8, "dealloc");
}

uint64_t sub_10000708C()
{
  return type metadata accessor for WolfAirDropNoticeSessionsController(0);
}

uint64_t type metadata accessor for WolfAirDropNoticeSessionsController(uint64_t a1)
{
  return sub_100009AE0(a1, (uint64_t *)&unk_100014B08);
}

void sub_1000070B4()
{
  sub_100009EB0(319, &qword_100014B18, &qword_100014B20);
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

uint64_t sub_10000716C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000071B4@<X0>(uint64_t *a1@<X8>)
{
  swift_getObjectType();
  uint64_t result = sub_10000D0E0();
  *a1 = result;
  return result;
}

uint64_t sub_1000071F4(uint64_t a1, unint64_t a2, void *a3, void *a4, uint64_t a5, void *a6, uint64_t a7, unint64_t a8, uint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, unint64_t a14)
{
  os_log_type_t v15 = v14;
  unint64_t v88 = a8;
  uint64_t v94 = a7;
  id v86 = a6;
  *(void *)&long long v85 = a5;
  uint64_t v20 = sub_10000D0D0();
  uint64_t v90 = *(void *)(v20 - 8);
  __chkstk_darwin();
  v93 = (char *)&v83 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100014AA0 != -1) {
    swift_once();
  }
  uint64_t v22 = sub_10000A948(v20, (uint64_t)qword_100014AA8);
  swift_bridgeObjectRetain_n();
  uint64_t v92 = v22;
  uint64_t v23 = sub_10000D0B0();
  os_log_type_t v24 = sub_10000D1D0();
  BOOL v25 = os_log_type_enabled(v23, v24);
  uint64_t v91 = v20;
  uint64_t v89 = a1;
  if (v25)
  {
    v84 = a4;
    uint64_t v26 = (uint8_t *)swift_slowAlloc();
    uint64_t v27 = swift_slowAlloc();
    v87 = v15;
    v96 = (void *)v27;
    *(_DWORD *)uint64_t v26 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v95 = sub_10000A99C(a1, a2, (uint64_t *)&v96);
    a4 = v84;
    sub_10000D1F0();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v23, v24, "WolfAirDropNoticeSessionsController: Start session with identifier: %s", v26, 0xCu);
    swift_arrayDestroy();
    os_log_type_t v15 = v87;
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  v87 = a10;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  sub_10000D110();
  swift_release();
  swift_release();
  if (v96[2])
  {
    uint64_t v28 = v89;
    sub_10000B184(v89, a2);
    char v30 = v29;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v30)
    {
      swift_bridgeObjectRetain_n();
      uint64_t v31 = sub_10000D0B0();
      os_log_type_t v32 = sub_10000D1C0();
      if (os_log_type_enabled(v31, v32))
      {
        os_log_type_t v33 = (uint8_t *)swift_slowAlloc();
        v96 = (void *)swift_slowAlloc();
        v84 = a4;
        *(_DWORD *)os_log_type_t v33 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v95 = sub_10000A99C(v89, a2, (uint64_t *)&v96);
        uint64_t v28 = v89;
        a4 = v84;
        sub_10000D1F0();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v31, v32, "Tried to start a session with an existing transfer: %s. Ending existing session, and starting new one", v33, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        swift_bridgeObjectRelease_n();
      }
      sub_100007DF4(v28, a2);
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v28 = v89;
  }
  id v34 = [a4 unsignedIntegerValue];
  swift_bridgeObjectRetain();
  int v35 = [a3 BOOLValue];
  unint64_t v36 = v88;
  swift_bridgeObjectRetain();
  int v37 = [v86 BOOLValue];
  id v38 = [(id)v85 integerValue];
  type metadata accessor for WolfAirDropNoticeSession(0);
  uint64_t v39 = swift_allocObject();
  os_log_type_t v40 = v15;
  id v86 = v34;
  uint64_t v41 = sub_10000C0B8(v28, a2, v35, v94, v36, v34, v37, 0, v38, v40, v39);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  swift_retain();
  id v42 = (void (*)(void **, void))sub_10000D100();
  os_log_type_t v44 = v43;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v46 = *v44;
  uint64_t v94 = v41;
  uint64_t v95 = (uint64_t)v46;
  *os_log_type_t v44 = (void *)0x8000000000000000;
  sub_10000BB60(v41, v28, a2, isUniquelyReferenced_nonNull_native);
  *os_log_type_t v44 = (void *)v95;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v42(&v96, 0);
  swift_release();
  swift_release();
  unint64_t v88 = (unint64_t)v40;
  v47 = &v40[OBJC_IVAR____TtC13AirDropNotice35WolfAirDropNoticeSessionsController_unassociatedDismissalHandler];
  swift_beginAccess();
  uint64_t v48 = *(void *)v47;
  unint64_t v49 = (unint64_t)v87;
  if (*(void *)(*(void *)v47 + 16))
  {
    swift_bridgeObjectRetain();
    unint64_t v50 = sub_10000B184(v28, a2);
    if (v51)
    {
      unint64_t v52 = v50;
      uint64_t v53 = *(void *)(v48 + 56);
      uint64_t v54 = swift_allocObject();
      long long v85 = *(_OWORD *)(v53 + 16 * v52);
      *(_OWORD *)(v54 + 16) = v85;
      swift_endAccess();
      swift_retain();
      swift_bridgeObjectRelease();
      uint64_t v55 = v94;
      uint64_t v56 = *(void *)(v94 + 16);
      *(void *)(v94 + 16) = sub_10000CE04;
      *(void *)(v55 + 24) = v54;
      swift_retain();
      sub_10000B14C(v56);
      swift_beginAccess();
      swift_bridgeObjectRetain();
      uint64_t v57 = sub_10000B3B0(v28, a2);
      swift_endAccess();
      swift_bridgeObjectRelease();
      sub_10000B14C(v57);
      swift_release();
      goto LABEL_18;
    }
    swift_bridgeObjectRelease();
  }
  swift_endAccess();
LABEL_18:
  uint64_t v58 = v90;
  if (v49)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    v96 = (void *)a9;
    unint64_t v97 = v49;
    swift_bridgeObjectRetain();
    swift_retain();
    sub_10000D120();
    unint64_t v59 = v49;
  }
  else
  {
    unint64_t v59 = 0xEE006E6F69747069;
  }
  unint64_t v60 = a12;
  uint64_t v61 = v91;
  (*(void (**)(char *, uint64_t, uint64_t))(v58 + 16))(v93, v92, v91);
  swift_bridgeObjectRetain_n();
  v62 = sub_10000D0B0();
  os_log_type_t v63 = sub_10000D1D0();
  if (os_log_type_enabled(v62, v63))
  {
    uint64_t v64 = swift_slowAlloc();
    uint64_t v65 = swift_slowAlloc();
    uint64_t v89 = a12;
    *(_DWORD *)uint64_t v64 = 136315394;
    uint64_t v95 = (uint64_t)v86;
    v96 = (void *)v65;
    type metadata accessor for SFAirDropTransferState(0);
    uint64_t v66 = sub_10000D180();
    uint64_t v95 = sub_10000A99C(v66, v67, (uint64_t *)&v96);
    sub_10000D1F0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v64 + 12) = 2080;
    if (v49) {
      uint64_t v68 = a9;
    }
    else {
      uint64_t v68 = 0x7263736564206F6ELL;
    }
    swift_bridgeObjectRetain();
    uint64_t v95 = sub_10000A99C(v68, v59, (uint64_t *)&v96);
    sub_10000D1F0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v62, v63, "Transfer started: state:%s description: %s", (uint8_t *)v64, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v90 + 8))(v93, v91);
    unint64_t v60 = v89;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v58 + 8))(v93, v61);
  }
  if (v60 >> 60 != 15)
  {
    id v69 = objc_allocWithZone((Class)UIImage);
    sub_10000CD74(a11, v60);
    Class isa = sub_10000D060().super.isa;
    v71 = [v69 initWithData:isa];

    v72 = sub_10000D0B0();
    os_log_type_t v73 = sub_10000D1D0();
    BOOL v74 = os_log_type_enabled(v72, v73);
    if (v71)
    {
      if (v74)
      {
        v75 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v75 = 0;
        _os_log_impl((void *)&_mh_execute_header, v72, v73, "Preview image found and decoded", v75, 2u);
        swift_slowDealloc();
      }

      swift_getKeyPath();
      swift_getKeyPath();
      v96 = v71;
      swift_retain();
      v76 = v71;
      sub_10000D120();
      sub_10000C04C(a11, v60);
    }
    else if (v74)
    {
      v77 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v77 = 0;
      _os_log_impl((void *)&_mh_execute_header, v72, v73, "Could not decode preview image data", v77, 2u);
      swift_slowDealloc();

      sub_10000C04C(a11, v60);
    }
    else
    {
      sub_10000C04C(a11, v60);
    }
  }
  swift_getKeyPath();
  swift_getKeyPath();
  v96 = (void *)a13;
  unint64_t v97 = a14;
  swift_bridgeObjectRetain();
  swift_retain();
  sub_10000D120();
  swift_getObjectType();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v79 = [self bundleForClass:ObjCClassFromMetadata];
  NSString v80 = sub_10000D160();
  v81 = [self imageNamed:v80 inBundle:v79 withConfiguration:0];

  swift_getKeyPath();
  swift_getKeyPath();
  v96 = v81;
  return sub_10000D120();
}

void sub_100007DF4(uint64_t a1, unint64_t a2)
{
  if (qword_100014AA0 != -1) {
    swift_once();
  }
  uint64_t v4 = sub_10000D0D0();
  sub_10000A948(v4, (uint64_t)qword_100014AA8);
  swift_bridgeObjectRetain_n();
  os_log_type_t v5 = sub_10000D0B0();
  os_log_type_t v6 = sub_10000D1D0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    v18[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_10000A99C(a1, a2, v18);
    sub_10000D1F0();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v5, v6, "WolfAirDropNoticeSessionsController: Ending session with transfer identifier: %s.", v7, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  sub_10000D110();
  swift_release();
  swift_release();
  uint64_t v8 = v18[0];
  if (*(void *)(v18[0] + 16) && (unint64_t v9 = sub_10000B184(a1, a2), (v10 & 1) != 0))
  {
    uint64_t v11 = *(void *)(*(void *)(v8 + 56) + 8 * v9);
    swift_retain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_100006A84();
    os_log_type_t v12 = *(void (**)(uint64_t))(v11 + 16);
    if (v12)
    {
      uint64_t v13 = swift_retain();
      v12(v13);
      sub_10000B14C((uint64_t)v12);
    }
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v14 = (void (*)(uint64_t *, void))sub_10000D100();
    sub_10000B2E0(a1, a2);
    swift_release();
    v14(v18, 0);
    swift_release();
    swift_release();
    swift_release();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain_n();
    os_log_type_t v15 = sub_10000D0B0();
    os_log_type_t v16 = sub_10000D1C0();
    if (os_log_type_enabled(v15, v16))
    {
      id v17 = (uint8_t *)swift_slowAlloc();
      v18[0] = swift_slowAlloc();
      *(_DWORD *)id v17 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v19 = sub_10000A99C(a1, a2, v18);
      sub_10000D1F0();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "AirDrop transfer session not active for ID: %s, unable to end transfer", v17, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

void sub_1000083D8(uint64_t a1, unint64_t a2, void *a3, void *a4, void *a5, char *a6, uint64_t a7, uint64_t a8)
{
  uint64_t v56 = a1;
  id v51 = a5;
  unint64_t v52 = a6;
  id v49 = a3;
  id v50 = a4;
  uint64_t v11 = sub_10000D0D0();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin();
  uint64_t v14 = (char *)&v48 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_100014AA0 != -1) {
    swift_once();
  }
  uint64_t v15 = sub_10000A948(v11, (uint64_t)qword_100014AA8);
  swift_bridgeObjectRetain_n();
  os_log_type_t v16 = sub_10000D0B0();
  os_log_type_t v17 = sub_10000D1D0();
  BOOL v18 = os_log_type_enabled(v16, v17);
  uint64_t v54 = a8;
  if (v18)
  {
    uint64_t v19 = swift_slowAlloc();
    uint64_t v55 = v15;
    uint64_t v48 = v11;
    uint64_t v53 = v12;
    uint64_t v20 = (uint8_t *)v19;
    uint64_t v58 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v20 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v57 = sub_10000A99C(v56, a2, (uint64_t *)&v58);
    sub_10000D1F0();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "WolfAirDropNoticeSessionsController: Updating transfer with identifier %s", v20, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v12 = v53;
    uint64_t v11 = v48;
    uint64_t v15 = v55;
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  sub_10000D110();
  swift_release();
  swift_release();
  uint64_t v21 = v58;
  if (v58[2])
  {
    unint64_t v22 = sub_10000B184(v56, a2);
    if (v23)
    {
      uint64_t v24 = *(void *)(v21[7] + 8 * v22);
      swift_retain();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      id v25 = [v49 unsignedIntegerValue];
      char v26 = [v50 BOOLValue];
      id v27 = [v51 integerValue];
      id v28 = [v52 integerValue];
      uint64_t v29 = v54;
      uint64_t v56 = v24;
      sub_100008FB4((uint64_t)v25, v26, (uint64_t)v27, (uint64_t)v28, a7, v54);
      (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v14, v15, v11);
      swift_bridgeObjectRetain_n();
      char v30 = sub_10000D0B0();
      uint64_t v31 = (void *)a7;
      os_log_type_t v32 = sub_10000D1D0();
      if (os_log_type_enabled(v30, v32))
      {
        uint64_t v33 = swift_slowAlloc();
        id v50 = v31;
        uint64_t v34 = v33;
        id v51 = (id)swift_slowAlloc();
        unint64_t v52 = v14;
        uint64_t v57 = (uint64_t)v25;
        uint64_t v58 = v51;
        *(_DWORD *)uint64_t v34 = 136315394;
        unint64_t v35 = v29;
        type metadata accessor for SFAirDropTransferState(0);
        uint64_t v55 = v15;
        uint64_t v36 = sub_10000D180();
        uint64_t v53 = v12;
        uint64_t v57 = sub_10000A99C(v36, v37, (uint64_t *)&v58);
        sub_10000D1F0();
        swift_bridgeObjectRelease();
        *(_WORD *)(v34 + 12) = 2080;
        if (v29) {
          uint64_t v38 = (uint64_t)v50;
        }
        else {
          uint64_t v38 = 0x7263736564206F6ELL;
        }
        if (v35) {
          unint64_t v39 = v35;
        }
        else {
          unint64_t v39 = 0xEE006E6F69747069;
        }
        swift_bridgeObjectRetain();
        uint64_t v57 = sub_10000A99C(v38, v39, (uint64_t *)&v58);
        sub_10000D1F0();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v30, v32, "Transfer updated: state:%s description: %s", (uint8_t *)v34, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(char *, uint64_t))(v53 + 8))(v52, v11);
        if (v25 != (id)3) {
          goto LABEL_24;
        }
      }
      else
      {

        swift_bridgeObjectRelease_n();
        (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
        if (v25 != (id)3)
        {
LABEL_24:
          swift_release();
          return;
        }
      }
      v43 = sub_10000D0B0();
      os_log_type_t v44 = sub_10000D1B0();
      if (os_log_type_enabled(v43, v44))
      {
        v45 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v45 = 0;
        _os_log_impl((void *)&_mh_execute_header, v43, v44, "Transfer was cancelled by sender. Ending our session locally.", v45, 2u);
        swift_slowDealloc();
      }

      uint64_t v46 = *(void *)(v56 + 32);
      unint64_t v47 = *(void *)(v56 + 40);
      swift_bridgeObjectRetain();
      sub_100007DF4(v46, v47);
      swift_bridgeObjectRelease();
      goto LABEL_24;
    }
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain_n();
  os_log_type_t v40 = sub_10000D0B0();
  os_log_type_t v41 = sub_10000D1C0();
  if (os_log_type_enabled(v40, v41))
  {
    id v42 = (uint8_t *)swift_slowAlloc();
    uint64_t v58 = (void *)swift_slowAlloc();
    *(_DWORD *)id v42 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v57 = sub_10000A99C(v56, a2, (uint64_t *)&v58);
    sub_10000D1F0();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v40, v41, "AirDrop transfer session not active for ID: %s, returning", v42, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

uint64_t sub_100008C94()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_10000D110();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100008D08()
{
  return sub_100008D30();
}

uint64_t sub_100008D1C()
{
  return sub_100008D30();
}

uint64_t sub_100008D30()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_10000D110();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100008D9C()
{
  return sub_100008ED4();
}

uint64_t sub_100008DB0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_10000D110();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100008E24()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_10000D110();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100008E98()
{
  return sub_100008D30();
}

uint64_t sub_100008EAC()
{
  return sub_100008D30();
}

uint64_t sub_100008EC0()
{
  return sub_100008ED4();
}

uint64_t sub_100008ED4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_10000D110();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100008F40()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_10000D110();
  swift_release();
  swift_release();
  return v1;
}

void sub_100008FB4(uint64_t a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v11 = (id)SFAirDropTransferStateToString();
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = sub_10000D170();
    unint64_t v15 = v14;
  }
  else
  {
    unint64_t v15 = 0xE90000000000003ELL;
    uint64_t v13 = 0x6E776F6E6B6E553CLL;
  }
  if (qword_100014AA0 != -1) {
    swift_once();
  }
  uint64_t v16 = sub_10000D0D0();
  sub_10000A948(v16, (uint64_t)qword_100014AA8);
  swift_bridgeObjectRetain();
  os_log_type_t v17 = sub_10000D0B0();
  os_log_type_t v18 = sub_10000D1D0();
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v24 = a1;
    uint64_t v19 = (uint8_t *)swift_slowAlloc();
    uint64_t v26 = swift_slowAlloc();
    *(_DWORD *)uint64_t v19 = 136315138;
    swift_bridgeObjectRetain();
    sub_10000A99C(v13, v15, &v26);
    sub_10000D1F0();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "Updating: Transfer description: %s", v19, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    a1 = v24;
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_10000D110();
  swift_release();
  swift_release();
  if (v26 != a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v26 = a1;
    swift_retain();
    sub_10000D120();
    if (a1 == 2)
    {
      swift_getKeyPath();
      swift_getKeyPath();
      sub_10000D110();
      swift_release();
      swift_release();
      if ((v26 & 1) == 0)
      {
        sub_10000D150();
        sub_10000D140();
        swift_release();
      }
    }
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_10000D110();
  swift_release();
  swift_release();
  if (v26 != (a2 & 1))
  {
    swift_getKeyPath();
    swift_getKeyPath();
    LOBYTE(v26) = a2 & 1;
    swift_retain();
    sub_10000D120();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_10000D110();
  swift_release();
  swift_release();
  uint64_t v20 = v26;
  if (v26 != a3)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v26 = a3;
    swift_retain();
    sub_10000D120();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_10000D110();
  swift_release();
  swift_release();
  if (v26 == a4)
  {
    if (v20 == a3)
    {
      if (!a6) {
        return;
      }
      goto LABEL_23;
    }
  }
  else
  {
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t v26 = a4;
    swift_retain();
    sub_10000D120();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  sub_10000D110();
  swift_release();
  swift_release();
  uint64_t v21 = (void *)v26;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_10000D110();
  swift_release();
  swift_release();
  [v21 setCompletedUnitCount:v26];

  swift_getKeyPath();
  swift_getKeyPath();
  sub_10000D110();
  swift_release();
  swift_release();
  unint64_t v22 = (void *)v26;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_10000D110();
  swift_release();
  swift_release();
  [v22 setTotalUnitCount:v26];

  if (!a6) {
    return;
  }
LABEL_23:
  if ((unint64_t)(a1 - 1) > 1) {
    return;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain_n();
  sub_10000D110();
  swift_release();
  swift_release();
  if (v27)
  {
    if (v26 == a5 && v27 == a6)
    {
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      return;
    }
    char v23 = sub_10000D2A0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v23)
    {
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v26 = a5;
  uint64_t v27 = a6;
  swift_retain();
  sub_10000D120();
}

uint64_t sub_10000972C()
{
  return sub_10000D120();
}

uint64_t sub_1000097A0()
{
  sub_10000B14C(*(void *)(v0 + 16));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v1 = v0 + OBJC_IVAR____TtC13AirDropNotice24WolfAirDropNoticeSession__transferAccepted;
  uint64_t v2 = sub_10000B0A0(&qword_1000150C0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = v0 + OBJC_IVAR____TtC13AirDropNotice24WolfAirDropNoticeSession__numTotalItems;
  uint64_t v4 = sub_10000B0A0(&qword_1000150C8);
  os_log_type_t v5 = *(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5(v0 + OBJC_IVAR____TtC13AirDropNotice24WolfAirDropNoticeSession__numCompletedItems, v4);
  uint64_t v6 = v0 + OBJC_IVAR____TtC13AirDropNotice24WolfAirDropNoticeSession__localizedTransferDescription;
  uint64_t v7 = sub_10000B0A0(&qword_1000150D0);
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8);
  v8(v6, v7);
  uint64_t v9 = v0 + OBJC_IVAR____TtC13AirDropNotice24WolfAirDropNoticeSession__progress;
  uint64_t v10 = sub_10000B0A0(&qword_1000150D8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v10 - 8) + 8))(v9, v10);
  uint64_t v11 = v0 + OBJC_IVAR____TtC13AirDropNotice24WolfAirDropNoticeSession__transferState;
  uint64_t v12 = sub_10000B0A0(&qword_1000150E0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  uint64_t v13 = v0 + OBJC_IVAR____TtC13AirDropNotice24WolfAirDropNoticeSession__previewImage;
  uint64_t v14 = sub_10000B0A0(&qword_1000150E8);
  unint64_t v15 = *(void (**)(uint64_t, uint64_t))(*(void *)(v14 - 8) + 8);
  v15(v13, v14);
  v15(v0 + OBJC_IVAR____TtC13AirDropNotice24WolfAirDropNoticeSession__iconImage, v14);
  v8(v0 + OBJC_IVAR____TtC13AirDropNotice24WolfAirDropNoticeSession__contactIdentifier, v7);
  uint64_t v16 = v0 + OBJC_IVAR____TtC13AirDropNotice24WolfAirDropNoticeSession__state;
  uint64_t v17 = sub_10000B0A0(&qword_1000150F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v17 - 8) + 8))(v16, v17);
  sub_10000B15C(v0 + OBJC_IVAR____TtC13AirDropNotice24WolfAirDropNoticeSession_delegate);
  return v0;
}

uint64_t sub_100009A60()
{
  sub_1000097A0();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v1, v2);
}

uint64_t sub_100009AB8()
{
  return type metadata accessor for WolfAirDropNoticeSession(0);
}

uint64_t type metadata accessor for WolfAirDropNoticeSession(uint64_t a1)
{
  return sub_100009AE0(a1, (uint64_t *)&unk_100014CC0);
}

uint64_t sub_100009AE0(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100009B18()
{
  sub_100009F00(319, &qword_100014CD0, (uint64_t)&type metadata for Bool, (uint64_t (*)(void, uint64_t))&type metadata accessor for Published);
  if (v0 <= 0x3F)
  {
    sub_100009F00(319, &qword_100014CD8, (uint64_t)&type metadata for Int, (uint64_t (*)(void, uint64_t))&type metadata accessor for Published);
    if (v1 <= 0x3F)
    {
      sub_100009EB0(319, &qword_100014CE0, &qword_100014CE8);
      if (v2 <= 0x3F)
      {
        sub_100009DC8();
        if (v3 <= 0x3F)
        {
          sub_100009E30();
          if (v4 <= 0x3F)
          {
            sub_100009EB0(319, &qword_100014D08, &qword_100014D10);
            if (v5 <= 0x3F)
            {
              sub_100009F00(319, (unint64_t *)&unk_100014D18, (uint64_t)&type metadata for NoticeState, (uint64_t (*)(void, uint64_t))&type metadata accessor for Published);
              if (v6 <= 0x3F) {
                swift_updateClassMetadata2();
              }
            }
          }
        }
      }
    }
  }
}

void sub_100009DC8()
{
  if (!qword_100014CF0)
  {
    sub_10000CF44(255, &qword_100014CF8);
    unint64_t v0 = sub_10000D130();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100014CF0);
    }
  }
}

void sub_100009E30()
{
  if (!qword_100014D00)
  {
    type metadata accessor for SFAirDropTransferState(255);
    unint64_t v0 = sub_10000D130();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100014D00);
    }
  }
}

void type metadata accessor for SFAirDropTransferState(uint64_t a1)
{
}

void sub_100009EB0(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    sub_10000716C(a3);
    unint64_t v4 = sub_10000D130();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void sub_100009F00(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

unsigned char *initializeBufferWithCopyOfBuffer for NoticeState(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for NoticeState(unsigned __int8 *a1, unsigned int a2)
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
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for NoticeState(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10000A0B8);
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

uint64_t sub_10000A0E0(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000A0EC(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for NoticeState()
{
  return &type metadata for NoticeState;
}

uint64_t sub_10000A108@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for WolfAirDropNoticeSession(0);
  uint64_t result = sub_10000D0E0();
  *a1 = result;
  return result;
}

uint64_t sub_10000A148@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_10000D110();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_10000A1C8(uint64_t a1, void **a2)
{
  int v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  id v3 = v2;
  return sub_10000D120();
}

uint64_t sub_10000A240@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_10000D110();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_10000A2C0()
{
  return sub_10000D120();
}

uint64_t sub_10000A334@<X0>(void *a1@<X8>)
{
  return sub_10000A370(a1);
}

uint64_t sub_10000A348()
{
  return sub_10000A400();
}

uint64_t sub_10000A35C@<X0>(void *a1@<X8>)
{
  return sub_10000A370(a1);
}

uint64_t sub_10000A370@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_10000D110();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_10000A3EC()
{
  return sub_10000A400();
}

uint64_t sub_10000A400()
{
  return sub_10000D120();
}

uint64_t sub_10000A470@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_10000D110();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_10000A4F0(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  id v2 = v1;
  swift_retain();
  return sub_10000D120();
}

uint64_t sub_10000A568@<X0>(unsigned char *a1@<X8>)
{
  return sub_10000A5A4(a1);
}

uint64_t sub_10000A57C()
{
  return sub_10000A634();
}

uint64_t sub_10000A590@<X0>(unsigned char *a1@<X8>)
{
  return sub_10000A5A4(a1);
}

uint64_t sub_10000A5A4@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_10000D110();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_10000A620()
{
  return sub_10000A634();
}

uint64_t sub_10000A634()
{
  return sub_10000D120();
}

double sub_10000A6A4@<D0>(_OWORD *a1@<X8>)
{
  return sub_10000A7A4(a1);
}

uint64_t sub_10000A6B8()
{
  return sub_10000A834();
}

uint64_t sub_10000A6CC@<X0>(void *a1@<X8>)
{
  return sub_10000A370(a1);
}

uint64_t sub_10000A6E0(void **a1)
{
  return sub_10000A71C(a1);
}

uint64_t sub_10000A6F4@<X0>(void *a1@<X8>)
{
  return sub_10000A370(a1);
}

uint64_t sub_10000A708(void **a1)
{
  return sub_10000A71C(a1);
}

uint64_t sub_10000A71C(void **a1)
{
  uint64_t v1 = *a1;
  swift_getKeyPath();
  swift_getKeyPath();
  id v2 = v1;
  swift_retain();
  return sub_10000D120();
}

double sub_10000A790@<D0>(_OWORD *a1@<X8>)
{
  return sub_10000A7A4(a1);
}

double sub_10000A7A4@<D0>(_OWORD *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_10000D110();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_10000A820()
{
  return sub_10000A834();
}

uint64_t sub_10000A834()
{
  return sub_10000D120();
}

void *sub_10000A8B4@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_10000A8C4(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_10000A8D0(void *a1, void *a2)
{
  return *a1 == *a2;
}

unint64_t sub_10000A8E8()
{
  unint64_t result = qword_1000150B0;
  if (!qword_1000150B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000150B0);
  }
  return result;
}

void *sub_10000A93C()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_10000A948(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_10000A980()
{
  return sub_10000972C();
}

uint64_t sub_10000A99C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000AA70(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000B044((uint64_t)v12, *a3);
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
      sub_10000B044((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000AFF4((uint64_t)v12);
  return v7;
}

uint64_t sub_10000AA70(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_10000D200();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10000AC2C(a5, a6);
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
  uint64_t v8 = sub_10000D240();
  if (!v8)
  {
    sub_10000D250();
    __break(1u);
LABEL_17:
    uint64_t result = sub_10000D290();
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

uint64_t sub_10000AC2C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10000ACC4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10000AEA4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10000AEA4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10000ACC4(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10000AE3C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_10000D230();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_10000D250();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_10000D1A0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_10000D290();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_10000D250();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10000AE3C(uint64_t a1, uint64_t a2)
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
  sub_10000B0A0(&qword_1000150B8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10000AEA4(char a1, int64_t a2, char a3, char *a4)
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
    sub_10000B0A0(&qword_1000150B8);
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
  uint64_t result = sub_10000D290();
  __break(1u);
  return result;
}

uint64_t sub_10000AFF4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000B044(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10000B0A0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t *sub_10000B0E8(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_10000B14C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_10000B15C(uint64_t a1)
{
  return a1;
}

unint64_t sub_10000B184(uint64_t a1, uint64_t a2)
{
  sub_10000D2C0();
  sub_10000D190();
  Swift::Int v4 = sub_10000D2E0();

  return sub_10000B1FC(a1, a2, v4);
}

unint64_t sub_10000B1FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_10000D2A0() & 1) == 0)
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
      while (!v14 && (sub_10000D2A0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_10000B2E0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_10000B184(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_10000BCD0();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 8 * v6);
  sub_10000B7B0(v6, v9);
  *uint64_t v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_10000B3B0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_10000B184(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_10000BE88();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 16 * v6);
  sub_10000B988(v6, v9);
  *uint64_t v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_10000B498(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_10000B0A0(&qword_1000150F8);
  char v36 = a2;
  uint64_t v6 = sub_10000D270();
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
    unint64_t v22 = (void *)(v5 + 64);
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
      swift_retain();
    }
    sub_10000D2C0();
    sub_10000D190();
    uint64_t result = sub_10000D2E0();
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
    os_log_type_t v18 = (void *)(*(void *)(v7 + 48) + 16 * v17);
    void *v18 = v31;
    v18[1] = v30;
    *(void *)(*(void *)(v7 + 56) + 8 * v17) = v32;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  unint64_t v22 = (void *)(v5 + 64);
  if ((v36 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v33 = 1 << *(unsigned char *)(v5 + 32);
  if (v33 >= 64) {
    bzero(v22, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v22 = -1 << v33;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_10000B7B0(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_10000D220();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_10000D2C0();
        swift_bridgeObjectRetain();
        sub_10000D190();
        Swift::Int v9 = sub_10000D2E0();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          int64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          unint64_t v15 = (void *)(v14 + 8 * v3);
          unint64_t v16 = (void *)(v14 + 8 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *unint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *unint64_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_10000B988(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_10000D220();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_10000D2C0();
        swift_bridgeObjectRetain();
        sub_10000D190();
        Swift::Int v9 = sub_10000D2E0();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          int64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          unint64_t v15 = (_OWORD *)(v14 + 16 * v3);
          unint64_t v16 = (_OWORD *)(v14 + 16 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *unint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  *unint64_t v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_10000BB60(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = *v4;
  unint64_t v12 = sub_10000B184(a2, a3);
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
    sub_10000BCD0();
LABEL_7:
    uint64_t v18 = (void *)*v5;
    if (v16)
    {
LABEL_8:
      uint64_t v19 = v18[7];
      uint64_t result = swift_release();
      *(void *)(v19 + 8 * v12) = a1;
      return result;
    }
    goto LABEL_11;
  }
  sub_10000B498(v15, a4 & 1);
  unint64_t v21 = sub_10000B184(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_17:
    uint64_t result = sub_10000D2B0();
    __break(1u);
    return result;
  }
  unint64_t v12 = v21;
  uint64_t v18 = (void *)*v5;
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

void *sub_10000BCD0()
{
  uint64_t v1 = v0;
  sub_10000B0A0(&qword_1000150F8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10000D260();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = *v17;
    v21[1] = v18;
    *(void *)(*(void *)(v4 + 56) + v19) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_retain();
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

void *sub_10000BE88()
{
  uint64_t v1 = v0;
  sub_10000B0A0(&qword_100015100);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_10000D260();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
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
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    long long v20 = *(_OWORD *)(*(void *)(v2 + 56) + v16);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = v19;
    v21[1] = v18;
    *(_OWORD *)(*(void *)(v4 + 56) + v16) = v20;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_retain();
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

uint64_t sub_10000C04C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10000C060(a1, a2);
  }
  return a1;
}

uint64_t sub_10000C060(uint64_t a1, unint64_t a2)
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

uint64_t sub_10000C0B8(uint64_t a1, unint64_t a2, int a3, uint64_t a4, unint64_t a5, void *a6, int a7, void *a8, void *a9, void *a10, uint64_t a11)
{
  v87 = a6;
  unint64_t v88 = a8;
  int v91 = a3;
  int v92 = a7;
  unint64_t v100 = a5;
  uint64_t v85 = a1;
  unint64_t v86 = a2;
  id v98 = a10;
  uint64_t v89 = a9;
  uint64_t v90 = a4;
  uint64_t v11 = sub_10000D0D0();
  uint64_t v94 = *(void *)(v11 - 8);
  uint64_t v95 = v11;
  __chkstk_darwin();
  v93 = (char *)&v73 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v84 = sub_10000B0A0(&qword_1000150F0);
  uint64_t v83 = *(void *)(v84 - 8);
  __chkstk_darwin();
  v82 = (char *)&v73 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = sub_10000B0A0(&qword_1000150E8);
  uint64_t v80 = *(void *)(v81 - 8);
  __chkstk_darwin();
  id v79 = (char *)&v73 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10000B0A0(&qword_1000150E0);
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v96 = v15;
  uint64_t v97 = v16;
  __chkstk_darwin();
  v78 = (char *)&v73 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = sub_10000B0A0(&qword_1000150D0);
  v99 = *(void **)(v76 - 8);
  __chkstk_darwin();
  uint64_t v19 = (char *)&v73 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_10000B0A0(&qword_1000150C0);
  uint64_t v21 = *(void *)(v20 - 8);
  __chkstk_darwin();
  unint64_t v23 = (char *)&v73 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_10000D0A0();
  uint64_t v25 = *(void *)(v24 - 8);
  __chkstk_darwin();
  BOOL v27 = (char *)&v73 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(a11 + 16) = 0;
  *(void *)(a11 + 24) = 0;
  *(void *)(a11 + 48) = 0;
  *(void *)(a11 + 56) = 0;
  sub_10000D090();
  uint64_t v28 = sub_10000D080();
  uint64_t v30 = v29;
  (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v24);
  *(void *)(a11 + 72) = v28;
  *(void *)(a11 + 80) = v30;
  uint64_t v31 = a11 + OBJC_IVAR____TtC13AirDropNotice24WolfAirDropNoticeSession__transferAccepted;
  LOBYTE(v102) = 0;
  sub_10000D0F0();
  (*(void (**)(uint64_t, char *, uint64_t))(v21 + 32))(v31, v23, v20);
  uint64_t v32 = a11 + OBJC_IVAR____TtC13AirDropNotice24WolfAirDropNoticeSession__localizedTransferDescription;
  uint64_t v102 = 0;
  uint64_t v103 = 0;
  uint64_t v75 = sub_10000B0A0(&qword_100014CE8);
  sub_10000D0F0();
  uint64_t v33 = (void (*)(uint64_t, char *, uint64_t))v99[4];
  v99 += 4;
  BOOL v74 = v33;
  uint64_t v34 = v76;
  v33(v32, v19, v76);
  uint64_t v35 = a11 + OBJC_IVAR____TtC13AirDropNotice24WolfAirDropNoticeSession__transferState;
  uint64_t v102 = 1;
  type metadata accessor for SFAirDropTransferState(0);
  uint64_t v77 = v36;
  unint64_t v37 = v78;
  sub_10000D0F0();
  (*(void (**)(uint64_t, char *, uint64_t))(v97 + 32))(v35, v37, v96);
  uint64_t v38 = a11 + OBJC_IVAR____TtC13AirDropNotice24WolfAirDropNoticeSession__previewImage;
  uint64_t v102 = 0;
  sub_10000B0A0(&qword_100014D10);
  unint64_t v39 = v79;
  sub_10000D0F0();
  os_log_type_t v40 = *(void (**)(uint64_t, char *, uint64_t))(v80 + 32);
  uint64_t v41 = v81;
  v40(v38, v39, v81);
  uint64_t v42 = a11 + OBJC_IVAR____TtC13AirDropNotice24WolfAirDropNoticeSession__iconImage;
  uint64_t v102 = 0;
  sub_10000D0F0();
  v40(v42, v39, v41);
  uint64_t v43 = a11 + OBJC_IVAR____TtC13AirDropNotice24WolfAirDropNoticeSession__contactIdentifier;
  uint64_t v102 = 0;
  uint64_t v103 = 0;
  sub_10000D0F0();
  os_log_type_t v44 = v19;
  uint64_t v45 = v85;
  v74(v43, v44, v34);
  unint64_t v46 = v86;
  uint64_t v47 = a11 + OBJC_IVAR____TtC13AirDropNotice24WolfAirDropNoticeSession__state;
  LOBYTE(v102) = 0;
  uint64_t v48 = v82;
  sub_10000D0F0();
  (*(void (**)(uint64_t, char *, uint64_t))(v83 + 32))(v47, v48, v84);
  *(void *)(a11 + 32) = v45;
  *(void *)(a11 + 40) = v46;
  *(unsigned char *)(a11 + 64) = v91;
  unint64_t v49 = v100;
  *(void *)(a11 + 48) = v90;
  *(void *)(a11 + 56) = v49;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t))(v97 + 8))(v35, v96);
  id v50 = v87;
  id v101 = v87;
  sub_10000D0F0();
  swift_endAccess();
  *(unsigned char *)(a11 + 65) = v92;
  swift_beginAccess();
  id v51 = v88;
  id v101 = v88;
  sub_10000D0F0();
  swift_endAccess();
  swift_beginAccess();
  unint64_t v52 = v89;
  id v101 = v89;
  sub_10000D0F0();
  swift_endAccess();
  *(void *)(a11 + OBJC_IVAR____TtC13AirDropNotice24WolfAirDropNoticeSession_delegate + 8) = &off_1000106A8;
  swift_unknownObjectUnownedInit();
  id v53 = [self progressWithTotalUnitCount:v52];
  swift_beginAccess();
  id v101 = v53;
  sub_10000CF44(0, &qword_100014CF8);
  sub_10000D0F0();
  swift_endAccess();
  swift_getKeyPath();
  swift_getKeyPath();
  sub_10000D110();
  swift_release();
  swift_release();
  id v54 = (id)v102;
  [(id)v102 setCompletedUnitCount:v51];

  if (v50 == (void *)2)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    LOBYTE(v102) = 1;
    swift_retain();
    sub_10000D120();
  }
  id v55 = (id)SFAirDropTransferStateToString();
  if (v55)
  {
    uint64_t v56 = v55;
    uint64_t v57 = sub_10000D170();
    unint64_t v59 = v58;
  }
  else
  {
    unint64_t v59 = 0xE90000000000003ELL;
    uint64_t v57 = 0x6E776F6E6B6E553CLL;
  }
  uint64_t v61 = v94;
  uint64_t v60 = v95;
  v62 = v93;
  if (qword_100014AA0 != -1) {
    swift_once();
  }
  uint64_t v63 = sub_10000A948(v60, (uint64_t)qword_100014AA8);
  (*(void (**)(char *, uint64_t, uint64_t))(v61 + 16))(v62, v63, v60);
  swift_retain_n();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v64 = sub_10000D0B0();
  os_log_type_t v65 = sub_10000D1D0();
  if (os_log_type_enabled(v64, v65))
  {
    uint64_t v66 = swift_slowAlloc();
    v99 = (void *)swift_slowAlloc();
    uint64_t v102 = (uint64_t)v99;
    *(_DWORD *)uint64_t v66 = 136316418;
    swift_bridgeObjectRetain();
    id v101 = (id)sub_10000A99C(v45, v46, &v102);
    sub_10000D1F0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v66 + 12) = 2080;
    uint64_t v97 = v57;
    if (v100) {
      uint64_t v67 = v90;
    }
    else {
      uint64_t v67 = 7104878;
    }
    if (v100) {
      unint64_t v68 = v100;
    }
    else {
      unint64_t v68 = 0xE300000000000000;
    }
    swift_bridgeObjectRetain();
    id v101 = (id)sub_10000A99C(v67, v68, &v102);
    sub_10000D1F0();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v66 + 22) = 1024;
    LODWORD(v101) = v91 & 1;
    sub_10000D1F0();
    *(_WORD *)(v66 + 28) = 1024;
    LODWORD(v101) = v92 & 1;
    sub_10000D1F0();
    *(_WORD *)(v66 + 34) = 2048;
    swift_getKeyPath();
    swift_getKeyPath();
    sub_10000D110();
    swift_release();
    swift_release();
    id v69 = v101;
    [v101 fractionCompleted];
    v71 = v70;

    id v101 = v71;
    sub_10000D1F0();
    swift_release_n();
    *(_WORD *)(v66 + 44) = 2080;
    swift_bridgeObjectRetain();
    id v101 = (id)sub_10000A99C(v97, v59, &v102);
    sub_10000D1F0();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v64, v65, "Transfer session created for transfer %s with senderName: %s, isFromMe: %{BOOL}d, isDestinationDownloads: %{BOOL}d, completed: %f, transferState: %s", (uint8_t *)v66, 0x36u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v94 + 8))(v93, v95);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v61 + 8))(v62, v60);
  }
  return a11;
}

uint64_t sub_10000CD74(uint64_t a1, unint64_t a2)
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

uint64_t sub_10000CDCC()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000CE04()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10000CE2C()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_10000CE6C(void *a1)
{
  sub_1000063BC(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_10000CE74()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000CE84()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10000CEAC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000CEBC()
{
  return swift_release();
}

uint64_t sub_10000CEC4()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000CEFC(void *a1)
{
  return sub_100006748(a1);
}

uint64_t sub_10000CF04()
{
  swift_unknownObjectUnownedDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10000CF3C()
{
}

uint64_t sub_10000CF44(uint64_t a1, unint64_t *a2)
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

uint64_t sub_10000CF80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10000B0A0(&qword_100015178);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000CFE8(uint64_t a1)
{
  uint64_t v2 = sub_10000B0A0(&qword_100015178);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

NSData sub_10000D060()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_10000D070()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000D080()
{
  return UUID.uuidString.getter();
}

uint64_t sub_10000D090()
{
  return UUID.init()();
}

uint64_t sub_10000D0A0()
{
  return type metadata accessor for UUID();
}

uint64_t sub_10000D0B0()
{
  return Logger.logObject.getter();
}

uint64_t sub_10000D0C0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_10000D0D0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_10000D0E0()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t sub_10000D0F0()
{
  return Published.init(initialValue:)();
}

uint64_t sub_10000D100()
{
  return static Published.subscript.modify();
}

uint64_t sub_10000D110()
{
  return static Published.subscript.getter();
}

uint64_t sub_10000D120()
{
  return static Published.subscript.setter();
}

uint64_t sub_10000D130()
{
  return type metadata accessor for Published();
}

uint64_t sub_10000D140()
{
  return withAnimation<A>(_:_:)();
}

uint64_t sub_10000D150()
{
  return static Animation.default.getter();
}

NSString sub_10000D160()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10000D170()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10000D180()
{
  return String.init<A>(describing:)();
}

uint64_t sub_10000D190()
{
  return String.hash(into:)();
}

Swift::Int sub_10000D1A0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_10000D1B0()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_10000D1C0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10000D1D0()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_10000D1E0()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_10000D1F0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10000D200()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_10000D210()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_10000D220()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_10000D230()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10000D240()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10000D250()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10000D260()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_10000D270()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_10000D280()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_10000D290()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_10000D2A0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10000D2B0()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10000D2C0()
{
  return Hasher.init(_seed:)();
}

void sub_10000D2D0(Swift::UInt a1)
{
}

Swift::Int sub_10000D2E0()
{
  return Hasher._finalize()();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t SFAirDropTransferStateToString()
{
  return _SFAirDropTransferStateToString();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return _swift_dynamicCastObjCProtocolConditional();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
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

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
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

uint64_t swift_unknownObjectUnownedDestroy()
{
  return _swift_unknownObjectUnownedDestroy();
}

uint64_t swift_unknownObjectUnownedInit()
{
  return _swift_unknownObjectUnownedInit();
}

uint64_t swift_unknownObjectUnownedLoadStrong()
{
  return _swift_unknownObjectUnownedLoadStrong();
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