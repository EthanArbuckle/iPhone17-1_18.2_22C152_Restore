int main(int argc, const char **argv, const char **envp)
{
  sub_10000393C(0, &qword_1000082F0);
  qword_1000083E0 = sub_100003A40();
  xpc_main((xpc_connection_handler_t)sub_1000030F4);
}

uint64_t sub_1000030F4(_xpc_connection_s *a1)
{
  swift_unknownObjectRetain();
  sub_100003A00();
  sub_100003980();
  uint64_t v2 = swift_allocObject();
  *(void *)(v2 + 16) = a1;
  v5[4] = sub_10000366C;
  v5[5] = v2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 1107296256;
  v5[2] = sub_1000036B8;
  v5[3] = &unk_100004260;
  v3 = _Block_copy(v5);
  swift_unknownObjectRetain();
  swift_release();
  xpc_connection_set_event_handler(a1, v3);
  _Block_release(v3);
  xpc_connection_resume(a1);
  return swift_unknownObjectRelease();
}

uint64_t sub_10000320C(void *a1, uint64_t a2)
{
  uint64_t v24 = a2;
  uint64_t v3 = sub_1000039C0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000039F0();
  uint64_t v25 = *(void *)(v7 - 8);
  __chkstk_darwin();
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000039D0();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin();
  v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  xpc_type_t type = xpc_get_type(a1);
  if (type == (xpc_type_t)sub_100003990())
  {
    uint64_t v21 = sub_1000039A0();
    swift_unknownObjectRelease();
    if ((void *)v21 == a1 || (v22 = sub_1000039B0(), uint64_t result = swift_unknownObjectRelease(), (void *)v22 == a1))
    {
      sub_100003A00();
      return sub_100003980();
    }
  }
  else
  {
    sub_10000393C(0, &qword_100008358);
    (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, enum case for DispatchQoS.QoSClass.userInitiated(_:), v10);
    uint64_t v15 = sub_100003A20();
    uint64_t v23 = v7;
    v16 = (void *)v15;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    uint64_t v17 = swift_allocObject();
    uint64_t v18 = v24;
    *(void *)(v17 + 16) = a1;
    *(void *)(v17 + 24) = v18;
    aBlock[4] = sub_100003770;
    aBlock[5] = v17;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100003674;
    aBlock[3] = &unk_1000042B0;
    v19 = _Block_copy(aBlock);
    swift_unknownObjectRetain();
    swift_unknownObjectRetain();
    sub_1000039E0();
    v26 = &_swiftEmptyArrayStorage;
    sub_1000037FC();
    sub_100003854(&qword_100008368);
    sub_100003898();
    sub_100003A50();
    sub_100003A10();
    _Block_release(v19);

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    (*(void (**)(char *, uint64_t))(v25 + 8))(v9, v23);
    return swift_release();
  }
  return result;
}

uint64_t sub_100003634()
{
  swift_unknownObjectRelease();
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10000366C(void *a1)
{
  return sub_10000320C(a1, *(void *)(v1 + 16));
}

uint64_t sub_100003674(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_1000036B8(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  uint64_t v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_100003718(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100003728()
{
  return swift_release();
}

uint64_t sub_100003730()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100003770()
{
  uint64_t v1 = *(_xpc_connection_s **)(v0 + 24);
  xpc_object_t reply = xpc_dictionary_create_reply(*(xpc_object_t *)(v0 + 16));
  if (!reply) {
    xpc_object_t reply = xpc_dictionary_create_empty();
  }
  sub_10000393C(0, &qword_100008378);
  sub_100003A30();
  xpc_connection_send_message(v1, reply);
  return swift_unknownObjectRelease();
}

unint64_t sub_1000037FC()
{
  unint64_t result = qword_100008360;
  if (!qword_100008360)
  {
    sub_1000039C0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008360);
  }
  return result;
}

uint64_t sub_100003854(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100003898()
{
  unint64_t result = qword_100008370;
  if (!qword_100008370)
  {
    sub_1000038F4(&qword_100008368);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100008370);
  }
  return result;
}

uint64_t sub_1000038F4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000393C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100003980()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_100003990()
{
  return XPC_TYPE_ERROR.getter();
}

uint64_t sub_1000039A0()
{
  return XPC_ERROR_CONNECTION_INVALID.getter();
}

uint64_t sub_1000039B0()
{
  return XPC_ERROR_TERMINATION_IMMINENT.getter();
}

uint64_t sub_1000039C0()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_1000039D0()
{
  return type metadata accessor for DispatchQoS.QoSClass();
}

uint64_t sub_1000039E0()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_1000039F0()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_100003A00()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_100003A10()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_100003A20()
{
  return static OS_dispatch_queue.global(qos:)();
}

uint64_t sub_100003A30()
{
  return static TTSAsset.handleProxy(event:reply:connection:)();
}

uint64_t sub_100003A40()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_100003A50()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t self
{
  return _self;
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
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

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return _xpc_dictionary_create_empty();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return _xpc_dictionary_create_reply(original);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_main(xpc_connection_handler_t handler)
{
}