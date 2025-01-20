@interface ICFastSyncPresenceController
+ (uint64_t)setUp;
- (ICFastSyncPresenceController)init;
- (void)realtimeCollaborationControllerDidChangeSelectionState:(id)a3;
- (void)realtimeCollaborationControllerSessionDidBegin:(id)a3;
- (void)realtimeCollaborationControllerSessionDidTerminate:(id)a3;
- (void)realtimeCollaborationControllerSessionWillBegin:(id)a3;
@end

@implementation ICFastSyncPresenceController

+ (uint64_t)setUp
{
  uint64_t v0 = sub_10002F214(&qword_1006A09A0);
  __chkstk_darwin(v0 - 8);
  v2 = (char *)&v26 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  v9 = (char *)&v26 - v8;
  id v10 = [self sharedContext];
  if (v10)
  {
    v11 = v10;
    static Logger.fastSyncPresence.getter();
    id v12 = objc_allocWithZone((Class)type metadata accessor for FastSyncPresenceController(0));
    id v13 = v11;
    id v14 = sub_10000CBEC((uint64_t)v9, 0xD000000000000010, 0x8000000100559250, v13);

    uint64_t v15 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v2, 1, 1, v15);
    v16 = (void *)swift_allocObject();
    v16[2] = 0;
    v16[3] = 0;
    v16[4] = v14;
    id v17 = v14;
    uint64_t v18 = sub_100005A94((uint64_t)v2, (uint64_t)&unk_1006A40C8, (uint64_t)v16);
    sub_10002B754((uint64_t)v2, &qword_1006A09A0);
    qword_1006A3F38 = v18;

    return swift_release();
  }
  else
  {
    static Logger.fastSyncPresence.getter();
    os_log_type_t v20 = static os_log_type_t.fault.getter();
    v21 = Logger.logObject.getter();
    os_log_type_t v22 = v20;
    if (os_log_type_enabled(v21, v20))
    {
      uint64_t v23 = swift_slowAlloc();
      uint64_t v27 = swift_slowAlloc();
      *(_DWORD *)uint64_t v23 = 136315650;
      uint64_t v24 = StaticString.description.getter();
      unint64_t v26 = sub_10045DA1C(v24, v25, &v27);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      *(_WORD *)(v23 + 12) = 2048;
      unint64_t v26 = 71;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v23 + 22) = 2080;
      unint64_t v26 = sub_10045DA1C(0xD00000000000004CLL, 0x8000000100559200, &v27);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "Failed assertion at %s:%lu: %s", (uint8_t *)v23, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v7, v3);
  }
}

- (ICFastSyncPresenceController)init
{
  result = (ICFastSyncPresenceController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR___ICFastSyncPresenceController_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
  sub_10002B754((uint64_t)self + OBJC_IVAR___ICFastSyncPresenceController_controllerPool, &qword_1006A3F40);
  sub_10002B754((uint64_t)self + OBJC_IVAR___ICFastSyncPresenceController_editorActivityChanges, &qword_1006A4088);
  sub_10002B754((uint64_t)self + OBJC_IVAR___ICFastSyncPresenceController_noteActivityShareChanges, &qword_1006A4090);
}

- (void)realtimeCollaborationControllerSessionWillBegin:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  FastSyncPresenceController.realtimeCollaborationControllerSessionWillBegin(_:)(v4);
}

- (void)realtimeCollaborationControllerSessionDidBegin:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  FastSyncPresenceController.realtimeCollaborationControllerSessionDidBegin(_:)(v4);
}

- (void)realtimeCollaborationControllerSessionDidTerminate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  FastSyncPresenceController.realtimeCollaborationControllerSessionDidTerminate(_:)(v4);
}

- (void)realtimeCollaborationControllerDidChangeSelectionState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  FastSyncPresenceController.realtimeCollaborationControllerDidChangeSelectionState(_:)(v4);
}

@end