@interface GroupSessionUIManagerImplementation
- (_TtC12mediaremotedP33_1851BD08EF6F7A41CF08D64ADE37688B35GroupSessionUIManagerImplementation)init;
- (void)bannerWithRequestIdentifier:(id)a3 didReceiveEvent:(unint64_t)a4;
- (void)beginObservingSession:(id)a3;
- (void)dealloc;
- (void)dismissDiscoveredSession:(id)a3;
- (void)dismissJoinRequest:(id)a3;
- (void)displayDiscoveredSession:(id)a3 dismissalHandler:(id)a4;
- (void)displayJoinRequest:(id)a3 handler:(id)a4;
- (void)handleDisplayMonitorChangeNotification:(id)a3;
- (void)nearbyGroupSessionDismissed:(id)a3;
- (void)openMusicForDiscoveredSession:(id)a3 foreground:(BOOL)a4 completion:(id)a5;
- (void)openMusicParticipantManagementWithCompletion:(id)a3;
- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation GroupSessionUIManagerImplementation

- (void)handleDisplayMonitorChangeNotification:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10000E854();
}

- (_TtC12mediaremotedP33_1851BD08EF6F7A41CF08D64ADE37688B35GroupSessionUIManagerImplementation)init
{
  return (_TtC12mediaremotedP33_1851BD08EF6F7A41CF08D64ADE37688B35GroupSessionUIManagerImplementation *)sub_10031CDF0();
}

- (void)dealloc
{
  v2 = self;
  sub_10031D450();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12mediaremotedP33_1851BD08EF6F7A41CF08D64ADE37688B35GroupSessionUIManagerImplementation_notificationCenter));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12mediaremotedP33_1851BD08EF6F7A41CF08D64ADE37688B35GroupSessionUIManagerImplementation_bannerCenter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12mediaremotedP33_1851BD08EF6F7A41CF08D64ADE37688B35GroupSessionUIManagerImplementation_queue));
  sub_100325888(*(void **)((char *)&self->super.isa+ OBJC_IVAR____TtC12mediaremotedP33_1851BD08EF6F7A41CF08D64ADE37688B35GroupSessionUIManagerImplementation_discoveredSessionContext), *(void **)&self->notificationCenter[OBJC_IVAR____TtC12mediaremotedP33_1851BD08EF6F7A41CF08D64ADE37688B35GroupSessionUIManagerImplementation_discoveredSessionContext]);
  sub_1001B9788((uint64_t)self+ OBJC_IVAR____TtC12mediaremotedP33_1851BD08EF6F7A41CF08D64ADE37688B35GroupSessionUIManagerImplementation_observedSession);
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void)beginObservingSession:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_10031D6D0(a3);
  swift_unknownObjectRelease();
}

- (void)displayDiscoveredSession:(id)a3 dismissalHandler:(id)a4
{
}

- (void)dismissDiscoveredSession:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  v7 = self;
  sub_10031DB64(v4, v6);

  swift_bridgeObjectRelease();
}

- (void)displayJoinRequest:(id)a3 handler:(id)a4
{
}

- (void)dismissJoinRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10031F6A0(v4);
}

- (void)openMusicForDiscoveredSession:(id)a3 foreground:(BOOL)a4 completion:(id)a5
{
  v8 = (uint64_t (*)())_Block_copy(a5);
  if (v8)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    v8 = sub_10023A230;
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = a3;
  v11 = self;
  sub_10031F9D4((uint64_t)v10, a4, (uint64_t)v8, v9);
  sub_1001924CC((uint64_t)v8);
}

- (void)openMusicParticipantManagementWithCompletion:(id)a3
{
  uint64_t v5 = sub_100013A80(&qword_10047C4A8);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  if (v8)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    v8 = sub_100239790;
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v10 = self;
  URL.init(string:)();
  uint64_t v11 = type metadata accessor for URL();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v7, 1, v11) == 1)
  {
    __break(1u);
  }
  else
  {
    sub_10031FE38((uint64_t)v7, 1, (uint64_t)v8, v9);
    (*(void (**)(char *, uint64_t))(v12 + 8))(v7, v11);
    sub_1001924CC((uint64_t)v8);
  }
}

- (void)bannerWithRequestIdentifier:(id)a3 didReceiveEvent:(unint64_t)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;
  uint64_t v9 = self;
  sub_1003213E0(v6, v8, a4);

  swift_bridgeObjectRelease();
}

- (void)nearbyGroupSessionDismissed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10032199C(v4);
}

- (void)userNotificationCenter:(id)a3 didReceiveNotificationResponse:(id)a4 withCompletionHandler:(id)a5
{
  unint64_t v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = self;
  sub_100323F4C(v11, v9);

  swift_release();
}

@end