int main(int argc, const char **argv, const char **envp)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  Swift::String v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint8_t *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;

  v3 = type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
  v20 = *(void *)(v3 - 8);
  v21 = v3;
  __chkstk_darwin(v3);
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for OS_dispatch_queue.Attributes();
  __chkstk_darwin(v6);
  v7 = type metadata accessor for DispatchQoS();
  __chkstk_darwin(v7 - 8);
  qword_1000100C0 = 0xD00000000000001FLL;
  *(void *)algn_1000100C8 = 0x800000010000B5E0;
  qword_1000100D0 = 0xD00000000000001ALL;
  *(void *)algn_1000100D8 = 0x800000010000B600;
  qword_1000100E0 = 0x7368637465667464;
  *(void *)algn_1000100E8 = 0xEF64736C6F626D79;
  v8 = type metadata accessor for Logger();
  sub_100005020(v8, qword_1000100F0);
  sub_100005084(v8, (uint64_t)qword_1000100F0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  Logger.init(subsystem:category:)();
  v22 = (void *)qword_1000100D0;
  v23 = *(void *)algn_1000100D8;
  sub_1000050BC();
  swift_bridgeObjectRetain();
  v9._countAndFlagsBits = 0x72656C646E61682ELL;
  v9._object = (void *)0xED00006575657551;
  String.append(_:)(v9);
  static DispatchQoS.unspecified.getter();
  v22 = &_swiftEmptyArrayStorage;
  sub_10000A958(&qword_100010008, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_1000050FC(&qword_100010010);
  sub_100005140();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  (*(void (**)(char *, void, uint64_t))(v20 + 104))(v5, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v21);
  qword_100010108 = OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
  v10 = Logger.logObject.getter();
  v11 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, v11, "Startup", v12, 2u);
    swift_slowDealloc();
  }

  qword_100010110 = 0;
  qword_100010118 = 0;
  type metadata accessor for RemoteXPCListenerConnection();
  qword_100010120 = static RemoteXPCConnection.remoteServiceListenerConnection(serviceName:targetQueue:)();
  *(void *)algn_100010128 = v13;
  v14 = Logger.logObject.getter();
  v15 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Created listener", v16, 2u);
    swift_slowDealloc();
  }

  dispatch thunk of XPCListenerConnection.setPeerConnectionHandler(_:)();
  v17 = Logger.logObject.getter();
  v18 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v17, v18))
  {
    v19 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v19 = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, v18, "Activate the listener and do dispatchMain", v19, 2u);
    swift_slowDealloc();
  }

  dispatch thunk of XPCConnection.activate()();
  dispatch_main();
}

uint64_t *sub_100005020(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100005084(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_1000050BC()
{
  unint64_t result = qword_100010000;
  if (!qword_100010000)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100010000);
  }
  return result;
}

uint64_t sub_1000050FC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100005140()
{
  unint64_t result = qword_100010018;
  if (!qword_100010018)
  {
    sub_10000519C(&qword_100010010);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010018);
  }
  return result;
}

uint64_t sub_10000519C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_1000051E4(uint64_t a1)
{
  uint64_t v2 = sub_1000050FC(&qword_100010020);
  uint64_t v3 = __chkstk_darwin(v2);
  v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v3);
  v8 = (char *)&v28 - v7;
  uint64_t v9 = __chkstk_darwin(v6);
  v11 = (char *)&v28 - v10;
  __chkstk_darwin(v9);
  v13 = (uint64_t *)((char *)&v28 - v12);
  uint64_t v14 = type metadata accessor for Logger();
  sub_100005084(v14, (uint64_t)&unk_1000100F0);
  sub_10000A278(a1, (uint64_t)v13, &qword_100010020);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_100008034((uint64_t)v13, &qword_100010020);
    sub_10000A278(a1, (uint64_t)v11, &qword_100010020);
    v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      *(_DWORD *)v17 = 136315138;
      sub_10000A278((uint64_t)v11, (uint64_t)v5, &qword_100010020);
      uint64_t v18 = String.init<A>(describing:)();
      uint64_t v30 = sub_10000799C(v18, v19, &v31);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      sub_100008034((uint64_t)v11, &qword_100010020);
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Unexpected peer connection %s, ignoring.", v17, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      sub_100008034((uint64_t)v11, &qword_100010020);
    }
  }
  else
  {
    uint64_t v20 = *v13;
    uint64_t v21 = v13[1];
    sub_10000A278(a1, (uint64_t)v8, &qword_100010020);
    v22 = Logger.logObject.getter();
    os_log_type_t v23 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v29 = v21;
      v24 = (uint8_t *)swift_slowAlloc();
      uint64_t v31 = swift_slowAlloc();
      *(_DWORD *)v24 = 136315138;
      sub_10000A278((uint64_t)v8, (uint64_t)v5, &qword_100010020);
      uint64_t v25 = String.init<A>(describing:)();
      uint64_t v30 = sub_10000799C(v25, v26, &v31);
      uint64_t v21 = v29;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      sub_100008034((uint64_t)v8, &qword_100010020);
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "Received new connection: %s", v24, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      sub_100008034((uint64_t)v8, &qword_100010020);
    }
    uint64_t v27 = swift_allocObject();
    *(void *)(v27 + 16) = v20;
    *(void *)(v27 + 24) = v21;
    swift_retain();
    dispatch thunk of XPCPeerConnection.setEventHandler(_:)();
    swift_release();
    swift_retain();
    dispatch thunk of XPCConnection.activate()();
    swift_release_n();
  }
}

uint64_t sub_10000565C(uint64_t a1, uint64_t a2)
{
  uint64_t v58 = a2;
  uint64_t v3 = sub_1000050FC(&qword_100010028);
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v56 = (uint64_t)&v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v4);
  v57 = (char *)&v54 - v7;
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v54 - v8;
  uint64_t v10 = type metadata accessor for XPCDictionary();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v54 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v12);
  v17 = (char *)&v54 - v16;
  __chkstk_darwin(v15);
  unint64_t v19 = (char *)&v54 - v18;
  uint64_t v20 = type metadata accessor for Logger();
  uint64_t v21 = sub_100005084(v20, (uint64_t)&unk_1000100F0);
  sub_10000A278(a1, (uint64_t)v9, &qword_100010028);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v19, v9, v10);
    uint64_t v29 = v10;
    uint64_t v55 = v11;
    uint64_t v30 = *(void (**)(char *, char *, uint64_t))(v11 + 16);
    v30(v17, v19, v10);
    uint64_t v31 = Logger.logObject.getter();
    os_log_type_t v32 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = swift_slowAlloc();
      uint64_t v56 = v21;
      v34 = (uint8_t *)v33;
      uint64_t v60 = swift_slowAlloc();
      v57 = v19;
      *(_DWORD *)v34 = 136315138;
      v54 = v34 + 4;
      v30(v14, v17, v10);
      uint64_t v35 = String.init<A>(describing:)();
      uint64_t v59 = sub_10000799C(v35, v36, &v60);
      unint64_t v19 = v57;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v37 = *(void (**)(char *, uint64_t))(v55 + 8);
      v37(v17, v29);
      _os_log_impl((void *)&_mh_execute_header, v31, v32, "Received new message: %s", v34, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      v37 = *(void (**)(char *, uint64_t))(v55 + 8);
      v37(v17, v29);
    }
    if (qword_1000101A0 != -1) {
      swift_once();
    }
    if ((XPCDictionary.subscript.getter() & 1) == 0)
    {
      if (qword_100010188 != -1) {
        swift_once();
      }
      if (XPCDictionary.subscript.getter())
      {
        swift_unknownObjectRelease();
        if (!qword_100010110)
        {
          qword_100010110 = os_transaction_create();
          swift_unknownObjectRelease();
        }
        if (!__OFADD__(qword_100010118, 1))
        {
          ++qword_100010118;
          sub_100006080((uint64_t)v19, v58);
          return ((uint64_t (*)(char *, uint64_t))v37)(v19, v29);
        }
        __break(1u);
      }
      else if (qword_100010190 == -1)
      {
LABEL_26:
        if (!XPCDictionary.subscript.getter())
        {
          if (qword_100010198 != -1) {
            swift_once();
          }
          XPCDictionary.subscript.getter();
        }
        swift_unknownObjectRelease();
        return ((uint64_t (*)(char *, uint64_t))v37)(v19, v29);
      }
      swift_once();
      goto LABEL_26;
    }
    if (qword_100010110)
    {
      uint64_t v39 = qword_100010118;
      uint64_t v40 = qword_100010118 - 1;
      if (qword_100010118 >= 1)
      {
        --qword_100010118;
        uint64_t v39 = v40;
      }
      if (!v39)
      {
        qword_100010110 = 0;
        swift_unknownObjectRelease();
        v51 = Logger.logObject.getter();
        os_log_type_t v52 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v51, v52))
        {
          v53 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v53 = 0;
          _os_log_impl((void *)&_mh_execute_header, v51, v52, "Doing fast exit, per OS reviewers.", v53, 2u);
          swift_slowDealloc();
        }

        xpc_transaction_exit_clean();
        return ((uint64_t (*)(void, void))v37)(v19, v29);
      }
      v41 = Logger.logObject.getter();
      os_log_type_t v42 = static os_log_type_t.info.getter();
      if (!os_log_type_enabled(v41, v42)) {
        goto LABEL_34;
      }
      v43 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v43 = 134217984;
      uint64_t v60 = qword_100010118;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      v44 = "Not exiting yet because of %ld outstanding transactions.";
      v45 = v41;
      os_log_type_t v46 = v42;
      v47 = v43;
      uint32_t v48 = 12;
    }
    else
    {
      v41 = Logger.logObject.getter();
      os_log_type_t v49 = static os_log_type_t.error.getter();
      if (!os_log_type_enabled(v41, v49))
      {
LABEL_34:

        return ((uint64_t (*)(void, void))v37)(v19, v29);
      }
      v50 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v50 = 0;
      v44 = "There is no ongoing transaction to cancel, ignoring";
      v45 = v41;
      os_log_type_t v46 = v49;
      v47 = v50;
      uint32_t v48 = 2;
    }
    _os_log_impl((void *)&_mh_execute_header, v45, v46, v44, v47, v48);
    swift_slowDealloc();
    goto LABEL_34;
  }
  sub_100008034((uint64_t)v9, &qword_100010028);
  uint64_t v22 = a1;
  uint64_t v23 = (uint64_t)v57;
  sub_10000A278(v22, (uint64_t)v57, &qword_100010028);
  v24 = Logger.logObject.getter();
  os_log_type_t v25 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v24, v25))
  {
    unint64_t v26 = (uint8_t *)swift_slowAlloc();
    uint64_t v60 = swift_slowAlloc();
    *(_DWORD *)unint64_t v26 = 136315138;
    sub_10000A278(v23, v56, &qword_100010028);
    uint64_t v27 = String.init<A>(describing:)();
    uint64_t v59 = sub_10000799C(v27, v28, &v60);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    sub_100008034(v23, &qword_100010028);
    _os_log_impl((void *)&_mh_execute_header, v24, v25, "Received error message: %s, cancelling.", v26, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    sub_100008034(v23, &qword_100010028);
  }

  return dispatch thunk of XPCConnection.cancel()();
}

uint64_t *DTFetchSymbolsD.TransferDoneKey.unsafeMutableAddressor()
{
  if (qword_1000101A0 != -1) {
    swift_once();
  }
  return &static DTFetchSymbolsD.TransferDoneKey;
}

uint64_t *DTFetchSymbolsD.DSCFilePathsKey.unsafeMutableAddressor()
{
  if (qword_100010188 != -1) {
    swift_once();
  }
  return &static DTFetchSymbolsD.DSCFilePathsKey;
}

uint64_t sub_100006080(uint64_t a1, uint64_t a2)
{
  uint64_t v42 = a2;
  uint64_t v3 = sub_1000050FC(&qword_100010030);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v32 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for XPCDictionary();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v32 - v11;
  uint64_t v13 = type metadata accessor for Logger();
  sub_100005084(v13, (uint64_t)&unk_1000100F0);
  uint64_t v14 = XPCDictionary.sideChannel.getter();
  if (v2)
  {
    uint64_t v15 = Logger.logObject.getter();
    os_log_type_t v16 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v17 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Can't decode side channel, cancelling.", v17, 2u);
      swift_slowDealloc();
    }

    dispatch thunk of XPCConnection.cancel()();
    return swift_errorRelease();
  }
  else
  {
    uint64_t v19 = v14;
    if (v14)
    {
      swift_retain();
      XPCDictionary.createReply()();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
      {
        sub_100008034((uint64_t)v5, &qword_100010030);
        sub_1000076A4((uint64_t)&_swiftEmptyArrayStorage);
        type metadata accessor for XPCError();
        sub_10000A958(&qword_100010038, (void (*)(uint64_t))&type metadata accessor for XPCError);
        swift_allocError();
        static XPCError.unknown(_:from:userInfo:)();
        swift_bridgeObjectRelease();
        swift_willThrow();
        return swift_release_n();
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v12, v5, v6);
        uint64_t v23 = sub_100006D38();
        uint64_t v38 = 0;
        if (qword_100010188 != -1) {
          swift_once();
        }
        uint64_t v37 = v19;
        uint64_t v39 = v23[2];
        LOBYTE(v40) = 0;
        sub_100008090();
        swift_bridgeObjectRetain();
        XPCDictionary.subscript.setter();
        uint64_t v35 = v12;
        dispatch thunk of XPCConnection.send(message:)();
        type metadata accessor for XPCObjectEncoder();
        swift_allocObject();
        swift_retain();
        uint64_t v42 = XPCObjectEncoder.init(underlyingConnection:)();
        uint64_t v24 = v23[2];
        uint64_t v33 = v7;
        v34 = v23;
        if (v24)
        {
          unint64_t v36 = (void (**)(char *, uint64_t))(v7 + 8);
          os_log_type_t v25 = v23 + 6;
          while (1)
          {
            uint64_t v26 = v6;
            uint64_t v28 = *(v25 - 1);
            uint64_t v27 = *v25;
            uint64_t v29 = *(v25 - 2);
            swift_bridgeObjectRetain();
            swift_retain();
            XPCDictionary.init()();
            uint64_t v39 = v29;
            uint64_t v40 = v28;
            uint64_t v41 = v27;
            sub_1000080E4();
            swift_bridgeObjectRetain();
            uint64_t v30 = v38;
            XPCObjectEncoder.encode<A>(_:)();
            uint64_t v38 = v30;
            if (v30) {
              break;
            }
            XPCDictionary.subscript.setter();
            XPCSideChannel.send(message:)();
            swift_release();
            swift_bridgeObjectRelease();
            uint64_t v6 = v26;
            (*v36)(v10, v26);
            v25 += 3;
            if (!--v24) {
              goto LABEL_17;
            }
          }
          swift_bridgeObjectRelease();
          swift_release();
          swift_release_n();
          uint64_t v31 = *v36;
          (*v36)(v10, v26);
          swift_bridgeObjectRelease();
          v31(v35, v26);
          swift_release();
          return swift_bridgeObjectRelease();
        }
        else
        {
LABEL_17:
          swift_release();
          swift_release_n();
          swift_bridgeObjectRelease();
          return (*(uint64_t (**)(char *, uint64_t))(v33 + 8))(v35, v6);
        }
      }
    }
    else
    {
      uint64_t v20 = Logger.logObject.getter();
      uint64_t v21 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v20, (os_log_type_t)v21))
      {
        uint64_t v22 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v22 = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, (os_log_type_t)v21, "Side channel is nil, cancelling.", v22, 2u);
        swift_slowDealloc();
      }

      return dispatch thunk of XPCConnection.cancel()();
    }
  }
}

uint64_t *DTFetchSymbolsD.MachODylibsKey.unsafeMutableAddressor()
{
  if (qword_100010190 != -1) {
    swift_once();
  }
  return &static DTFetchSymbolsD.MachODylibsKey;
}

uint64_t *DTFetchSymbolsD.MachOSegmentsKey.unsafeMutableAddressor()
{
  if (qword_100010198 != -1) {
    swift_once();
  }
  return &static DTFetchSymbolsD.MachOSegmentsKey;
}

void sub_10000670C()
{
  static DTFetchSymbolsD.CompressionKey = 0x73736572706D6F43;
  *(void *)algn_100010138 = 0xEB000000006E6F69;
}

uint64_t *DTFetchSymbolsD.CompressionKey.unsafeMutableAddressor()
{
  if (qword_100010180 != -1) {
    swift_once();
  }
  return &static DTFetchSymbolsD.CompressionKey;
}

uint64_t static DTFetchSymbolsD.CompressionKey.getter()
{
  return sub_100006900(&qword_100010180, &static DTFetchSymbolsD.CompressionKey);
}

void sub_1000067AC()
{
  algn_100010148[5] = 0;
  *(_WORD *)&algn_100010148[6] = -5120;
}

uint64_t static DTFetchSymbolsD.DSCFilePathsKey.getter()
{
  return sub_100006900(&qword_100010188, &static DTFetchSymbolsD.DSCFilePathsKey);
}

void sub_100006800()
{
  static DTFetchSymbolsD.MachODylibsKey = 0x6C79444F6863614DLL;
  *(void *)algn_100010158 = 0xEB00000000736269;
}

uint64_t static DTFetchSymbolsD.MachODylibsKey.getter()
{
  return sub_100006900(&qword_100010190, &static DTFetchSymbolsD.MachODylibsKey);
}

void sub_100006854()
{
  *(_WORD *)&algn_100010168[6] = -4864;
}

uint64_t static DTFetchSymbolsD.MachOSegmentsKey.getter()
{
  return sub_100006900(&qword_100010198, &static DTFetchSymbolsD.MachOSegmentsKey);
}

void sub_1000068AC()
{
  algn_100010178[5] = 0;
  *(_WORD *)&algn_100010178[6] = -5120;
}

uint64_t static DTFetchSymbolsD.TransferDoneKey.getter()
{
  return sub_100006900(qword_1000101A0, &static DTFetchSymbolsD.TransferDoneKey);
}

uint64_t sub_100006900(void *a1, uint64_t *a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = *a2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t sub_100006954(char a1)
{
  if (a1) {
    return 0x6E617254656C6966;
  }
  else {
    return 0x68746150656C6966;
  }
}

BOOL sub_100006994(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_1000069AC()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_1000069F4()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100006A20()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

uint64_t sub_100006A64()
{
  return sub_100006954(*v0);
}

uint64_t sub_100006A6C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10000A5BC(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100006A94()
{
  return 0;
}

void sub_100006AA0(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_100006AAC(uint64_t a1)
{
  unint64_t v2 = sub_10000A568();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100006AE8(uint64_t a1)
{
  unint64_t v2 = sub_10000A568();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100006B24(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v11[0] = a4;
  uint64_t v6 = sub_1000050FC(&qword_1000100A0);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000A524(a1, a1[3]);
  sub_10000A568();
  dispatch thunk of Encoder.container<A>(keyedBy:)();
  char v13 = 0;
  KeyedEncodingContainer.encode(_:forKey:)();
  if (!v4)
  {
    v11[1] = v11[0];
    char v12 = 1;
    type metadata accessor for XPCFileTransfer();
    sub_10000A958(&qword_1000100A8, (void (*)(uint64_t))&type metadata accessor for XPCFileTransfer);
    KeyedEncodingContainer.encode<A>(_:forKey:)();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_100006CE8@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result = sub_10000A6B8(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
  }
  return result;
}

uint64_t sub_100006D18(void *a1)
{
  return sub_100006B24(a1, *v1, v1[1], v1[2]);
}

void *sub_100006D38()
{
  uint64_t v1 = type metadata accessor for URL();
  __chkstk_darwin(v1 - 8);
  uint64_t v30 = (char *)v28 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000050FC(&qword_100010050);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10000B450;
  uint64_t v4 = swift_allocObject();
  strcpy((char *)(inited + 32), "/usr/lib/dyld");
  *(_WORD *)(inited + 46) = -4864;
  Swift::Int v5 = sub_100009F40(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  *(void *)(v4 + 16) = v5;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = &_swiftEmptySetSingleton;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  *(void *)(v7 + 24) = v4;
  aBlock[4] = sub_10000A124;
  aBlock[5] = v7;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100007634;
  aBlock[3] = &unk_10000C6D0;
  uint64_t v8 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  dyld_for_each_installed_shared_cache();
  _Block_release(v8);
  swift_beginAccess();
  uint64_t v9 = *(void *)(v4 + 16);
  int64_t v10 = *(void *)(v9 + 16);
  if (v10)
  {
    v28[1] = v6;
    v28[2] = v4;
    uint64_t v35 = &_swiftEmptyArrayStorage;
    swift_bridgeObjectRetain();
    sub_100009C14(0, v10, 0);
    uint64_t v11 = (uint64_t)v35;
    uint64_t result = (void *)sub_100009DBC(v9);
    int64_t v14 = (int64_t)result;
    char v16 = v15 & 1;
    uint64_t v29 = v9 + 56;
    uint64_t v17 = v0;
    while ((v14 & 0x8000000000000000) == 0 && v14 < 1 << *(unsigned char *)(v9 + 32))
    {
      if (((*(void *)(v29 + (((unint64_t)v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v14) & 1) == 0) {
        goto LABEL_16;
      }
      if (*(_DWORD *)(v9 + 36) != v13) {
        goto LABEL_17;
      }
      uint64_t v32 = v13;
      int64_t v33 = v10;
      uint64_t v18 = (void *)v11;
      uint64_t v19 = (uint64_t *)(*(void *)(v9 + 48) + 16 * v14);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      swift_bridgeObjectRetain_n();
      URL.init(fileURLWithPath:)();
      type metadata accessor for XPCFileTransfer();
      uint64_t v11 = swift_allocObject();
      uint64_t v22 = XPCFileTransfer.init(forFileAt:)();
      if (v17)
      {
        swift_release();
        swift_release();
        swift_bridgeObjectRelease();
        swift_release();
        swift_bridgeObjectRelease_n();
        return (void *)v11;
      }
      uint64_t v23 = v22;
      uint64_t v31 = 0;
      swift_bridgeObjectRelease();
      uint64_t v11 = (uint64_t)v18;
      uint64_t v35 = v18;
      unint64_t v24 = v18[2];
      unint64_t v25 = *(void *)(v11 + 24);
      if (v24 >= v25 >> 1)
      {
        sub_100009C14(v25 > 1, v24 + 1, 1);
        uint64_t v11 = (uint64_t)v35;
      }
      *(void *)(v11 + 16) = v24 + 1;
      uint64_t v26 = (void *)(v11 + 24 * v24);
      v26[4] = v20;
      v26[5] = v21;
      v26[6] = v23;
      uint64_t result = (void *)sub_100009E5C(v14, v32, v16 & 1, v9);
      int64_t v14 = (int64_t)result;
      char v16 = v27 & 1;
      int64_t v10 = v33 - 1;
      uint64_t v17 = v31;
      if (v33 == 1)
      {
        sub_10000A144((uint64_t)result, v13, v27 & 1);
        swift_release();
        swift_release();
        swift_bridgeObjectRelease();
        return (void *)v11;
      }
    }
    __break(1u);
LABEL_16:
    __break(1u);
LABEL_17:
    __break(1u);
  }
  else
  {
    swift_release();
    swift_release();
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

uint64_t sub_100007158(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v19 = a3;
  uint64_t v4 = type metadata accessor for UUID();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v8 = (char *)&aBlock[-1] - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v11 = (char *)&aBlock[-1] - v10;
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&aBlock[-1] - v12;
  swift_slowAlloc();
  dyld_shared_cache_copy_uuid();
  UUID.init(uuid:)();
  swift_beginAccess();
  uint64_t v14 = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  char v15 = sub_100007418((uint64_t)v13, v14);
  swift_bridgeObjectRelease();
  if (v15) {
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v13, v4);
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v13, v4);
  swift_beginAccess();
  sub_100008170((uint64_t)v11, v8);
  swift_endAccess();
  uint64_t v17 = *(void (**)(char *, uint64_t))(v5 + 8);
  v17(v11, v4);
  swift_slowDealloc();
  aBlock[4] = sub_10000A154;
  aBlock[5] = v19;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000762C;
  aBlock[3] = &unk_10000C6F8;
  uint64_t v18 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  dyld_shared_cache_for_each_file();
  _Block_release(v18);
  return ((uint64_t (*)(char *, uint64_t))v17)(v13, v4);
}

uint64_t sub_100007418(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = type metadata accessor for UUID();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(a2 + 16)
    && (sub_10000A958(&qword_100010070, (void (*)(uint64_t))&type metadata accessor for UUID),
        uint64_t v7 = dispatch thunk of Hashable._rawHashValue(seed:)(),
        uint64_t v8 = -1 << *(unsigned char *)(a2 + 32),
        unint64_t v9 = v7 & ~v8,
        uint64_t v10 = a2 + 56,
        ((*(void *)(a2 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0))
  {
    uint64_t v17 = ~v8;
    uint64_t v18 = a2;
    uint64_t v11 = v4 + 16;
    uint64_t v12 = *(void (**)(char *, unint64_t, uint64_t))(v4 + 16);
    uint64_t v13 = *(void *)(v11 + 56);
    uint64_t v14 = (void (**)(char *, uint64_t))(v11 - 8);
    do
    {
      v12(v6, *(void *)(v18 + 48) + v13 * v9, v3);
      sub_10000A958(&qword_100010078, (void (*)(uint64_t))&type metadata accessor for UUID);
      char v15 = dispatch thunk of static Equatable.== infix(_:_:)();
      (*v14)(v6, v3);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v17;
    }
    while (((*(void *)(v10 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  else
  {
    char v15 = 0;
  }
  return v15 & 1;
}

uint64_t sub_10000762C(uint64_t a1, uint64_t a2)
{
  return sub_10000763C(a1, a2);
}

uint64_t sub_100007634(uint64_t a1, uint64_t a2)
{
  return sub_10000763C(a1, a2);
}

uint64_t sub_10000763C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

ValueMetadata *type metadata accessor for DTFetchSymbolsD()
{
  return &type metadata for DTFetchSymbolsD;
}

unint64_t sub_1000076A4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000050FC(&qword_100010088);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
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
    sub_10000A278(v6, (uint64_t)&v15, &qword_100010090);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_1000077DC(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_10000A2DC(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_1000077DC(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_100007854(a1, a2, v4);
}

unint64_t sub_100007854(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      unint64_t i = (i + 1) & v12;
      if ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
      {
        BOOL v13 = (void *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v12; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v12)
          {
            uint64_t v15 = (void *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2) {
              break;
            }
            if (_stringCompareWithSmolCheck(_:_:expecting:)()) {
              break;
            }
          }
        }
      }
    }
  }
  return i;
}

uint64_t sub_10000799C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100007A70(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10000A2EC((uint64_t)v12, *a3);
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
      sub_10000A2EC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10000A908((uint64_t)v12);
  return v7;
}

uint64_t sub_100007A70(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100007C2C(a5, a6);
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
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
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

uint64_t sub_100007C2C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100007CC4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100007EA4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100007EA4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100007CC4(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100007E3C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100007E3C(uint64_t a1, uint64_t a2)
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
  sub_1000050FC(&qword_100010098);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100007EA4(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000050FC(&qword_100010098);
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100007FF4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000802C(uint64_t a1)
{
  return sub_10000565C(a1, *(void *)(v1 + 16));
}

uint64_t sub_100008034(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000050FC(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_100008090()
{
  unint64_t result = qword_100010040;
  if (!qword_100010040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010040);
  }
  return result;
}

unint64_t sub_1000080E4()
{
  unint64_t result = qword_100010048;
  if (!qword_100010048)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010048);
  }
  return result;
}

uint64_t sub_100008138()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100008170(uint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  int64_t v9 = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_10000A958(&qword_100010070, (void (*)(uint64_t))&type metadata accessor for UUID);
  swift_bridgeObjectRetain();
  int64_t v33 = a2;
  uint64_t v11 = dispatch thunk of Hashable._rawHashValue(seed:)();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  uint64_t v32 = v10 + 56;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    uint64_t v28 = v2;
    uint64_t v29 = a1;
    uint64_t v30 = ~v12;
    uint64_t v27 = v7;
    uint64_t v16 = *(void (**)(void, void, void))(v7 + 16);
    uint64_t v15 = v7 + 16;
    uint64_t v14 = v16;
    uint64_t v31 = *(void *)(v15 + 56);
    long long v17 = (void (**)(char *, uint64_t))(v15 - 8);
    v26[1] = v15 & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    while (1)
    {
      uint64_t v18 = v10;
      unint64_t v19 = v31 * v13;
      uint64_t v20 = v14;
      v14(v9, *(void *)(v10 + 48) + v31 * v13, v6);
      sub_10000A958(&qword_100010078, (void (*)(uint64_t))&type metadata accessor for UUID);
      char v21 = dispatch thunk of static Equatable.== infix(_:_:)();
      uint64_t v22 = *v17;
      (*v17)(v9, v6);
      if (v21) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v30;
      uint64_t v10 = v18;
      uint64_t v14 = v20;
      if (((*(void *)(v32 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        uint64_t v3 = v28;
        a1 = v29;
        uint64_t v7 = v27;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    v22(v33, v6);
    v20(v29, *(void *)(*v28 + 48) + v19, v6);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v14 = *(void (**)(void, void, void))(v7 + 16);
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    unint64_t v24 = v33;
    v14(v9, v33, v6);
    uint64_t v34 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_100008D20((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v34;
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(a1, v24, v6);
    return 1;
  }
}

uint64_t sub_100008494(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  Swift::Int v8 = Hasher._finalize()();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
      Swift::Int v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_100008FC0(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_100008644()
{
  uint64_t v1 = v0;
  uint64_t v42 = type metadata accessor for UUID();
  uint64_t v2 = *(void *)(v42 - 8);
  __chkstk_darwin();
  uint64_t v41 = (char *)&v35 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = *v0;
  sub_1000050FC(&qword_100010080);
  uint64_t v5 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v6 = v5;
  if (*(void *)(v4 + 16))
  {
    uint64_t v7 = 1 << *(unsigned char *)(v4 + 32);
    uint64_t v8 = *(void *)(v4 + 56);
    uint64_t v37 = (void *)(v4 + 56);
    if (v7 < 64) {
      uint64_t v9 = ~(-1 << v7);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & v8;
    uint64_t v35 = v0;
    int64_t v36 = (unint64_t)(v7 + 63) >> 6;
    uint64_t v39 = v2;
    uint64_t v11 = v5 + 56;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    uint64_t v38 = v6;
    uint64_t v14 = v41;
    uint64_t v15 = v42;
    while (1)
    {
      if (v10)
      {
        unint64_t v17 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        int64_t v40 = v13;
        unint64_t v18 = v17 | (v13 << 6);
      }
      else
      {
        int64_t v19 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v19 >= v36) {
          goto LABEL_33;
        }
        unint64_t v20 = v37[v19];
        int64_t v21 = v13 + 1;
        if (!v20)
        {
          int64_t v21 = v13 + 2;
          if (v13 + 2 >= v36) {
            goto LABEL_33;
          }
          unint64_t v20 = v37[v21];
          if (!v20)
          {
            int64_t v21 = v13 + 3;
            if (v13 + 3 >= v36) {
              goto LABEL_33;
            }
            unint64_t v20 = v37[v21];
            if (!v20)
            {
              uint64_t v22 = v13 + 4;
              if (v13 + 4 >= v36)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v35;
                uint64_t v34 = 1 << *(unsigned char *)(v4 + 32);
                if (v34 > 63) {
                  bzero(v37, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v37 = -1 << v34;
                }
                *(void *)(v4 + 16) = 0;
                break;
              }
              unint64_t v20 = v37[v22];
              if (!v20)
              {
                while (1)
                {
                  int64_t v21 = v22 + 1;
                  if (__OFADD__(v22, 1)) {
                    goto LABEL_39;
                  }
                  if (v21 >= v36) {
                    goto LABEL_33;
                  }
                  unint64_t v20 = v37[v21];
                  ++v22;
                  if (v20) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v21 = v13 + 4;
            }
          }
        }
LABEL_23:
        unint64_t v10 = (v20 - 1) & v20;
        int64_t v40 = v21;
        unint64_t v18 = __clz(__rbit64(v20)) + (v21 << 6);
      }
      uint64_t v23 = v4;
      uint64_t v24 = *(void *)(v4 + 48);
      uint64_t v25 = *(void *)(v39 + 72);
      uint64_t v26 = *(void (**)(char *, unint64_t, uint64_t))(v39 + 32);
      v26(v14, v24 + v25 * v18, v15);
      uint64_t v6 = v38;
      sub_10000A958(&qword_100010070, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
      uint64_t v27 = -1 << *(unsigned char *)(v6 + 32);
      unint64_t v28 = result & ~v27;
      unint64_t v29 = v28 >> 6;
      if (((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6))) != 0)
      {
        unint64_t v16 = __clz(__rbit64((-1 << v28) & ~*(void *)(v11 + 8 * (v28 >> 6)))) | v28 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v30 = 0;
        unint64_t v31 = (unint64_t)(63 - v27) >> 6;
        do
        {
          if (++v29 == v31 && (v30 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v32 = v29 == v31;
          if (v29 == v31) {
            unint64_t v29 = 0;
          }
          v30 |= v32;
          uint64_t v33 = *(void *)(v11 + 8 * v29);
        }
        while (v33 == -1);
        unint64_t v16 = __clz(__rbit64(~v33)) + (v29 << 6);
      }
      *(void *)(v11 + ((v16 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v16;
      uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))v26)(*(void *)(v6 + 48) + v16 * v25, v41, v42);
      ++*(void *)(v6 + 16);
      uint64_t v4 = v23;
      int64_t v13 = v40;
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v6;
  return result;
}

uint64_t sub_100008A40()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1000050FC(&qword_100010068);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    char v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *char v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      int64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      Hasher.init(_seed:)();
      String.hash(into:)();
      uint64_t result = Hasher._finalize()();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v25 = 0;
        unint64_t v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      void *v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

uint64_t sub_100008D20(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v31 = a1;
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v10 = *(void *)(*v3 + 16);
  unint64_t v11 = *(void *)(*v3 + 24);
  uint64_t v28 = v3;
  uint64_t v29 = v7;
  if (v11 > v10 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_100008644();
  }
  else
  {
    if (v11 > v10)
    {
      sub_10000915C();
      goto LABEL_12;
    }
    sub_1000095B4();
  }
  uint64_t v12 = *v3;
  sub_10000A958(&qword_100010070, (void (*)(uint64_t))&type metadata accessor for UUID);
  uint64_t v13 = dispatch thunk of Hashable._rawHashValue(seed:)();
  uint64_t v14 = -1 << *(unsigned char *)(v12 + 32);
  a2 = v13 & ~v14;
  uint64_t v30 = v12;
  uint64_t v15 = v12 + 56;
  if ((*(void *)(v12 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v16 = ~v14;
    int64_t v19 = *(void (**)(char *, unint64_t, uint64_t))(v7 + 16);
    uint64_t v18 = v7 + 16;
    unint64_t v17 = v19;
    uint64_t v20 = *(void *)(v18 + 56);
    do
    {
      v17(v9, *(void *)(v30 + 48) + v20 * a2, v6);
      sub_10000A958(&qword_100010078, (void (*)(uint64_t))&type metadata accessor for UUID);
      char v21 = dispatch thunk of static Equatable.== infix(_:_:)();
      (*(void (**)(char *, uint64_t))(v18 - 8))(v9, v6);
      if (v21) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v16;
    }
    while (((*(void *)(v15 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v22 = v29;
  uint64_t v23 = *v28;
  *(void *)(v23 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(v22 + 32))(*(void *)(v23 + 48) + *(void *)(v22 + 72) * a2, v31, v6);
  uint64_t v25 = *(void *)(v23 + 16);
  BOOL v26 = __OFADD__(v25, 1);
  uint64_t v27 = v25 + 1;
  if (!v26)
  {
    *(void *)(v23 + 16) = v27;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
  __break(1u);
  return result;
}

Swift::Int sub_100008FC0(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_100008A40();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_100009400();
      goto LABEL_22;
    }
    sub_100009964();
  }
  uint64_t v11 = *v4;
  Hasher.init(_seed:)();
  String.hash(into:)();
  uint64_t result = Hasher._finalize()();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    uint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        uint64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  char v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  *char v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

void *sub_10000915C()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for UUID();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000050FC(&qword_100010080);
  uint64_t v6 = *v0;
  uint64_t v7 = static _SetStorage.copy(original:)();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_27:
    *uint64_t v1 = v8;
    return result;
  }
  uint64_t v22 = v1;
  uint64_t result = (void *)(v7 + 56);
  unint64_t v10 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v6 + 56 + 8 * v10) {
    uint64_t result = memmove(result, (const void *)(v6 + 56), 8 * v10);
  }
  uint64_t v23 = v6 + 56;
  int64_t v11 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v12 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v13 = -1;
  if (v12 < 64) {
    uint64_t v13 = ~(-1 << v12);
  }
  unint64_t v14 = v13 & *(void *)(v6 + 56);
  int64_t v24 = (unint64_t)(v12 + 63) >> 6;
  while (1)
  {
    if (v14)
    {
      unint64_t v15 = __clz(__rbit64(v14));
      v14 &= v14 - 1;
      unint64_t v16 = v15 | (v11 << 6);
      goto LABEL_9;
    }
    int64_t v18 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
      __break(1u);
      goto LABEL_29;
    }
    if (v18 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v18);
    ++v11;
    if (!v19)
    {
      int64_t v11 = v18 + 1;
      if (v18 + 1 >= v24) {
        goto LABEL_25;
      }
      unint64_t v19 = *(void *)(v23 + 8 * v11);
      if (!v19)
      {
        int64_t v11 = v18 + 2;
        if (v18 + 2 >= v24) {
          goto LABEL_25;
        }
        unint64_t v19 = *(void *)(v23 + 8 * v11);
        if (!v19) {
          break;
        }
      }
    }
LABEL_24:
    unint64_t v14 = (v19 - 1) & v19;
    unint64_t v16 = __clz(__rbit64(v19)) + (v11 << 6);
LABEL_9:
    unint64_t v17 = *(void *)(v3 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v3 + 16))(v5, *(void *)(v6 + 48) + v17, v2);
    uint64_t result = (void *)(*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(void *)(v8 + 48) + v17, v5, v2);
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v24)
  {
LABEL_25:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v22;
    goto LABEL_27;
  }
  unint64_t v19 = *(void *)(v23 + 8 * v20);
  if (v19)
  {
    int64_t v11 = v20;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v11 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v11 >= v24) {
      goto LABEL_25;
    }
    unint64_t v19 = *(void *)(v23 + 8 * v11);
    ++v20;
    if (v19) {
      goto LABEL_24;
    }
  }
LABEL_29:
  __break(1u);
  return result;
}

void *sub_100009400()
{
  uint64_t v1 = v0;
  sub_1000050FC(&qword_100010068);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
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
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    unint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    unint64_t v19 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1000095B4()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for UUID();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v33 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *v0;
  sub_1000050FC(&qword_100010080);
  uint64_t v7 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v8;
    return result;
  }
  uint64_t v9 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v10 = *(void *)(v6 + 56);
  uint64_t v34 = v0;
  uint64_t v35 = v6 + 56;
  if (v9 < 64) {
    uint64_t v11 = ~(-1 << v9);
  }
  else {
    uint64_t v11 = -1;
  }
  unint64_t v12 = v11 & v10;
  int64_t v36 = (unint64_t)(v9 + 63) >> 6;
  uint64_t v37 = v3 + 16;
  uint64_t v13 = v7 + 56;
  uint64_t v38 = v3;
  unint64_t v14 = (uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32);
  uint64_t result = swift_retain();
  int64_t v16 = 0;
  while (1)
  {
    if (v12)
    {
      unint64_t v18 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v19 = v18 | (v16 << 6);
      goto LABEL_24;
    }
    int64_t v20 = v16 + 1;
    if (__OFADD__(v16, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v20 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v20);
    ++v16;
    if (!v21)
    {
      int64_t v16 = v20 + 1;
      if (v20 + 1 >= v36) {
        goto LABEL_33;
      }
      unint64_t v21 = *(void *)(v35 + 8 * v16);
      if (!v21)
      {
        int64_t v16 = v20 + 2;
        if (v20 + 2 >= v36) {
          goto LABEL_33;
        }
        unint64_t v21 = *(void *)(v35 + 8 * v16);
        if (!v21) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v19 = __clz(__rbit64(v21)) + (v16 << 6);
LABEL_24:
    uint64_t v23 = v6;
    uint64_t v24 = *(void *)(v6 + 48);
    uint64_t v25 = *(void *)(v38 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v38 + 16))(v5, v24 + v25 * v19, v2);
    sub_10000A958(&qword_100010070, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
    uint64_t v26 = -1 << *(unsigned char *)(v8 + 32);
    unint64_t v27 = result & ~v26;
    unint64_t v28 = v27 >> 6;
    if (((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v27) & ~*(void *)(v13 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v29 = 0;
      unint64_t v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v31 = v28 == v30;
        if (v28 == v30) {
          unint64_t v28 = 0;
        }
        v29 |= v31;
        uint64_t v32 = *(void *)(v13 + 8 * v28);
      }
      while (v32 == -1);
      unint64_t v17 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(void *)(v13 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t result = (*v14)(*(void *)(v8 + 48) + v17 * v25, v5, v2);
    ++*(void *)(v8 + 16);
    uint64_t v6 = v23;
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v36)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v34;
    goto LABEL_35;
  }
  unint64_t v21 = *(void *)(v35 + 8 * v22);
  if (v21)
  {
    int64_t v16 = v22;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v16 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v16 >= v36) {
      goto LABEL_33;
    }
    unint64_t v21 = *(void *)(v35 + 8 * v16);
    ++v22;
    if (v21) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_100009964()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1000050FC(&qword_100010068);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
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
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    unint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    uint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    void *v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_100009C14(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100009C34(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_100009C34(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000050FC(&qword_100010058);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[24 * v8]) {
      memmove(v12, v13, 24 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[24 * v8] || v12 >= &v13[24 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t sub_100009DBC(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 56);
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
  unint64_t v1 = *(void *)(a1 + 64);
  if (v1)
  {
    uint64_t v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  if (v6 < 8) {
    return v3;
  }
  unint64_t v1 = *(void *)(a1 + 72);
  if (v1)
  {
    uint64_t v2 = 128;
    return __clz(__rbit64(v1)) + v2;
  }
  unint64_t v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 3) {
    unint64_t v7 = 3;
  }
  unint64_t v8 = v7 - 3;
  uint64_t v9 = (unint64_t *)(a1 + 80);
  uint64_t v2 = 128;
  while (v8)
  {
    unint64_t v10 = *v9++;
    unint64_t v1 = v10;
    --v8;
    v2 += 64;
    if (v10) {
      return __clz(__rbit64(v1)) + v2;
    }
  }
  return v3;
}

int64_t sub_100009E5C(int64_t result, int a2, char a3, uint64_t a4)
{
  if (a3) {
    goto LABEL_20;
  }
  unint64_t v4 = result;
  if (result < 0 || (uint64_t result = 1 << *(unsigned char *)(a4 + 32), result <= (uint64_t)v4))
  {
    __break(1u);
    goto LABEL_18;
  }
  unint64_t v5 = v4 >> 6;
  uint64_t v6 = a4 + 56;
  unint64_t v7 = *(void *)(a4 + 56 + 8 * (v4 >> 6));
  if (((v7 >> v4) & 1) == 0)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  if (*(_DWORD *)(a4 + 36) != a2)
  {
LABEL_19:
    __break(1u);
LABEL_20:
    __break(1u);
    return result;
  }
  unint64_t v8 = v7 & (-2 << (v4 & 0x3F));
  if (v8) {
    return __clz(__rbit64(v8)) | v4 & 0xFFFFFFFFFFFFFFC0;
  }
  unint64_t v9 = v5 + 1;
  unint64_t v10 = (unint64_t)(result + 63) >> 6;
  if (v5 + 1 < v10)
  {
    unint64_t v11 = *(void *)(v6 + 8 * v9);
    if (v11) {
      return __clz(__rbit64(v11)) + (v9 << 6);
    }
    unint64_t v9 = v5 + 2;
    if (v5 + 2 < v10)
    {
      unint64_t v11 = *(void *)(v6 + 8 * v9);
      if (v11) {
        return __clz(__rbit64(v11)) + (v9 << 6);
      }
      while (v10 - 3 != v5)
      {
        unint64_t v11 = *(void *)(a4 + 80 + 8 * v5++);
        if (v11)
        {
          unint64_t v9 = v5 + 2;
          return __clz(__rbit64(v11)) + (v9 << 6);
        }
      }
    }
  }
  return result;
}

Swift::Int sub_100009F40(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_1000050FC(&qword_100010068);
    uint64_t v3 = static _SetStorage.allocate(capacity:)();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v25 = a1 + 32;
    while (1)
    {
      uint64_t v6 = (uint64_t *)(v25 + 16 * v4);
      uint64_t v8 = *v6;
      uint64_t v7 = v6[1];
      Hasher.init(_seed:)();
      swift_bridgeObjectRetain();
      String.hash(into:)();
      Swift::Int result = Hasher._finalize()();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = result & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = *(void *)(v3 + 48);
        int64_t v16 = (void *)(v15 + 16 * v11);
        BOOL v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        uint64_t v18 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v18;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          unint64_t v19 = (void *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            Swift::Int result = _stringCompareWithSmolCheck(_:_:expecting:)();
            if ((result & 1) == 0) {
              continue;
            }
          }
          goto LABEL_3;
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      uint64_t v21 = (void *)(*(void *)(v3 + 48) + 16 * v11);
      *uint64_t v21 = v8;
      v21[1] = v7;
      uint64_t v22 = *(void *)(v3 + 16);
      BOOL v23 = __OFADD__(v22, 1);
      uint64_t v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1) {
        return v3;
      }
    }
  }
  return (Swift::Int)&_swiftEmptySetSingleton;
}

uint64_t sub_10000A0E4()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000A124(uint64_t a1)
{
  return sub_100007158(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_10000A12C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000A13C()
{
  return swift_release();
}

uint64_t sub_10000A144(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10000A154(uint64_t result)
{
  if (result)
  {
    Swift::Int v1 = String.init(cString:)();
    Swift::Int v3 = v2;
    strcpy((char *)v4, ".development");
    BYTE5(v4[1]) = 0;
    HIWORD(v4[1]) = -5120;
    sub_10000A224();
    if ((StringProtocol.contains<A>(_:)() & 1) == 0)
    {
      swift_beginAccess();
      sub_100008494(v4, v1, v3);
      swift_endAccess();
    }
    return swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_10000A224()
{
  unint64_t result = qword_100010060;
  if (!qword_100010060)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100010060);
  }
  return result;
}

uint64_t sub_10000A278(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000050FC(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_10000A2DC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_10000A2EC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t destroy for TransferResponseItem()
{
  swift_bridgeObjectRelease();

  return swift_release();
}

void *_s15dtfetchsymbolsd20TransferResponseItemVwCP_0(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for TransferResponseItem(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for TransferResponseItem(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for TransferResponseItem(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for TransferResponseItem(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 24)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for TransferResponseItem(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 24) = 1;
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
    *(unsigned char *)(result + 24) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for TransferResponseItem()
{
  return &type metadata for TransferResponseItem;
}

void *sub_10000A524(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_10000A568()
{
  unint64_t result = qword_1000102B0[0];
  if (!qword_1000102B0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000102B0);
  }
  return result;
}

uint64_t sub_10000A5BC(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x68746150656C6966 && a2 == 0xE800000000000000;
  if (v3 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E617254656C6966 && a2 == 0xEC00000072656673)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_10000A6B8(void *a1)
{
  uint64_t v3 = sub_1000050FC(&qword_1000100B0);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  char v6 = &v9[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = a1[4];
  sub_10000A524(a1, a1[3]);
  sub_10000A568();
  dispatch thunk of Decoder.container<A>(keyedBy:)();
  if (v1)
  {
    sub_10000A908((uint64_t)a1);
  }
  else
  {
    v9[31] = 0;
    uint64_t v7 = KeyedDecodingContainer.decode(_:forKey:)();
    type metadata accessor for XPCFileTransfer();
    v9[15] = 1;
    sub_10000A958(&qword_1000100B8, (void (*)(uint64_t))&type metadata accessor for XPCFileTransfer);
    swift_bridgeObjectRetain();
    KeyedDecodingContainer.decode<A>(_:forKey:)();
    (*(void (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
    swift_retain();
    sub_10000A908((uint64_t)a1);
    swift_release();
    swift_bridgeObjectRelease();
  }
  return v7;
}

uint64_t sub_10000A908(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_10000A958(unint64_t *a1, void (*a2)(uint64_t))
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

unsigned char *initializeBufferWithCopyOfBuffer for TransferResponseItem.CodingKeys(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for TransferResponseItem.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for TransferResponseItem.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x10000AB0CLL);
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

uint64_t sub_10000AB34(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000AB40(unsigned char *result, char a2)
{
  *uint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for TransferResponseItem.CodingKeys()
{
  return &type metadata for TransferResponseItem.CodingKeys;
}

unint64_t sub_10000AB60()
{
  unint64_t result = qword_1000103C0[0];
  if (!qword_1000103C0[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000103C0);
  }
  return result;
}

unint64_t sub_10000ABB8()
{
  unint64_t result = qword_1000104D0;
  if (!qword_1000104D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000104D0);
  }
  return result;
}

unint64_t sub_10000AC10()
{
  unint64_t result = qword_1000104D8[0];
  if (!qword_1000104D8[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_1000104D8);
  }
  return result;
}

uint64_t URL.init(fileURLWithPath:)()
{
  return URL.init(fileURLWithPath:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t UUID.init(uuid:)()
{
  return UUID.init(uuid:)();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t dispatch thunk of XPCConnection.send(message:)()
{
  return dispatch thunk of XPCConnection.send(message:)();
}

uint64_t dispatch thunk of XPCConnection.cancel()()
{
  return dispatch thunk of XPCConnection.cancel()();
}

uint64_t dispatch thunk of XPCConnection.activate()()
{
  return dispatch thunk of XPCConnection.activate()();
}

uint64_t XPCDictionary.createReply()()
{
  return XPCDictionary.createReply()();
}

uint64_t XPCDictionary.sideChannel.getter()
{
  return XPCDictionary.sideChannel.getter();
}

uint64_t XPCDictionary.init()()
{
  return XPCDictionary.init()();
}

uint64_t type metadata accessor for XPCDictionary()
{
  return type metadata accessor for XPCDictionary();
}

uint64_t XPCDictionary.subscript.getter()
{
  return XPCDictionary.subscript.getter();
}

{
  return XPCDictionary.subscript.getter();
}

uint64_t XPCDictionary.subscript.setter()
{
  return XPCDictionary.subscript.setter();
}

{
  return XPCDictionary.subscript.setter();
}

uint64_t XPCSideChannel.send(message:)()
{
  return XPCSideChannel.send(message:)();
}

uint64_t XPCFileTransfer.init(forFileAt:)()
{
  return XPCFileTransfer.init(forFileAt:)();
}

uint64_t type metadata accessor for XPCFileTransfer()
{
  return type metadata accessor for XPCFileTransfer();
}

uint64_t XPCObjectEncoder.init(underlyingConnection:)()
{
  return XPCObjectEncoder.init(underlyingConnection:)();
}

uint64_t XPCObjectEncoder.encode<A>(_:)()
{
  return XPCObjectEncoder.encode<A>(_:)();
}

uint64_t type metadata accessor for XPCObjectEncoder()
{
  return type metadata accessor for XPCObjectEncoder();
}

uint64_t dispatch thunk of XPCPeerConnection.setEventHandler(_:)()
{
  return dispatch thunk of XPCPeerConnection.setEventHandler(_:)();
}

uint64_t static RemoteXPCConnection.remoteServiceListenerConnection(serviceName:targetQueue:)()
{
  return static RemoteXPCConnection.remoteServiceListenerConnection(serviceName:targetQueue:)();
}

uint64_t dispatch thunk of XPCListenerConnection.setPeerConnectionHandler(_:)()
{
  return dispatch thunk of XPCListenerConnection.setPeerConnectionHandler(_:)();
}

uint64_t type metadata accessor for RemoteXPCListenerConnection()
{
  return type metadata accessor for RemoteXPCListenerConnection();
}

uint64_t static XPCError.unknown(_:from:userInfo:)()
{
  return static XPCError.unknown(_:from:userInfo:)();
}

uint64_t type metadata accessor for XPCError()
{
  return type metadata accessor for XPCError();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

uint64_t String.init<A>(describing:)()
{
  return String.init<A>(describing:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

uint64_t String.init(cString:)()
{
  return String.init(cString:)();
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t type metadata accessor for OS_dispatch_queue.Attributes()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t StringProtocol.contains<A>(_:)()
{
  return StringProtocol.contains<A>(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t KeyedDecodingContainer.decode(_:forKey:)()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t KeyedDecodingContainer.decode<A>(_:forKey:)()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode(_:forKey:)()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t KeyedEncodingContainer.encode<A>(_:forKey:)()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t dispatch thunk of Decoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t dispatch thunk of Encoder.container<A>(keyedBy:)()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
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

void dispatch_main(void)
{
}

uint64_t dyld_for_each_installed_shared_cache()
{
  return _dyld_for_each_installed_shared_cache();
}

uint64_t dyld_shared_cache_copy_uuid()
{
  return _dyld_shared_cache_copy_uuid();
}

uint64_t dyld_shared_cache_for_each_file()
{
  return _dyld_shared_cache_for_each_file();
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

uint64_t os_transaction_create()
{
  return _os_transaction_create();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
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

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}