@interface IdentityWatchSessionManagementListener
- (_TtC8coreidvd38IdentityWatchSessionManagementListener)init;
- (void)lockStateMonitor:(id)a3 deviceLockDidUpdate:(BOOL)a4 watchPairingID:(id)a5;
- (void)manager:(id)a3 didCompleteAuthenticationForSessionWithID:(id)a4;
- (void)manager:(id)a3 didFailAuthenticationForSessionWithID:(id)a4 error:(id)a5;
- (void)manager:(id)a3 didStartAuthenticationForSessionWithID:(id)a4;
@end

@implementation IdentityWatchSessionManagementListener

- (_TtC8coreidvd38IdentityWatchSessionManagementListener)init
{
  return (_TtC8coreidvd38IdentityWatchSessionManagementListener *)sub_10044B858();
}

- (void)lockStateMonitor:(id)a3 deviceLockDidUpdate:(BOOL)a4 watchPairingID:(id)a5
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = v8;
  id v11 = a3;
  v10 = self;
  sub_100461B14(v7, v9);
  swift_bridgeObjectRelease();
}

- (void)manager:(id)a3 didStartAuthenticationForSessionWithID:(id)a4
{
  uint64_t v6 = type metadata accessor for UUID();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  id v11 = self;
  sub_1004637E4(v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)manager:(id)a3 didCompleteAuthenticationForSessionWithID:(id)a4
{
  uint64_t v6 = sub_100007764(&qword_10071FEE0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for UUID();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  uint64_t v12 = __chkstk_darwin(v9);
  v13 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v15 = (char *)&v21 - v14;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v8, 1, 1, v16);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
  unint64_t v17 = (*(unsigned __int8 *)(v10 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v18 = (char *)swift_allocObject();
  *((void *)v18 + 2) = 0;
  *((void *)v18 + 3) = 0;
  *((void *)v18 + 4) = self;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v18[v17], v13, v9);
  v19 = self;
  id v20 = a3;
  sub_10014043C((uint64_t)v8, (uint64_t)&unk_10072EE00, (uint64_t)v18);
  swift_release();

  (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

- (void)manager:(id)a3 didFailAuthenticationForSessionWithID:(id)a4 error:(id)a5
{
  id v26 = a3;
  uint64_t v7 = sub_100007764(&qword_10071FEE0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for UUID();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(void *)(v11 + 64);
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v25 - v15;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v17 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v9, 1, 1, v17);
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v14, v16, v10);
  unint64_t v18 = (*(unsigned __int8 *)(v11 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  unint64_t v19 = (v12 + v18 + 7) & 0xFFFFFFFFFFFFFFF8;
  id v20 = (char *)swift_allocObject();
  *((void *)v20 + 2) = 0;
  *((void *)v20 + 3) = 0;
  *((void *)v20 + 4) = self;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v20[v18], v14, v10);
  *(void *)&v20[v19] = a5;
  id v21 = a5;
  v22 = self;
  id v23 = v21;
  id v24 = v26;
  sub_10014043C((uint64_t)v9, (uint64_t)&unk_10072EDF0, (uint64_t)v20);
  swift_release();

  (*(void (**)(char *, uint64_t))(v11 + 8))(v16, v10);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8coreidvd38IdentityWatchSessionManagementListener_remoteSessionService));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8coreidvd38IdentityWatchSessionManagementListener_deviceLockStateMonitor));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8coreidvd38IdentityWatchSessionManagementListener_biometricStore));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8coreidvd38IdentityWatchSessionManagementListener_rangingManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC8coreidvd38IdentityWatchSessionManagementListener_rangingQueue));
  v3 = (char *)self + OBJC_IVAR____TtC8coreidvd38IdentityWatchSessionManagementListener_rangingSessionID;

  sub_10045CEC4((uint64_t)v3);
}

@end