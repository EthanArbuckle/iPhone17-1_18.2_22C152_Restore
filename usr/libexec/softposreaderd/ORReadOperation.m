@interface ORReadOperation
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (_TtC9SPREngine15ORReadOperation)init;
- (void)cancel;
- (void)dealloc;
- (void)handleSessionReachedTimeLimit;
- (void)readerSession:(id)a3 didEnd:(id)a4;
- (void)readerSession:(id)a3 didReceiveThermalIndication:(BOOL)a4;
- (void)readerSession:(id)a3 didStart:(id)a4;
- (void)readerSession:(id)a3 receivedData:(id)a4 fromApplet:(id)a5;
- (void)secureElementReaderSessionDidEndUnexpectedly:(id)a3;
- (void)setExecuting:(BOOL)a3;
- (void)setFinished:(BOOL)a3;
- (void)start;
@end

@implementation ORReadOperation

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isExecuting
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9SPREngine15ORReadOperation_lockedState);
  v3 = (os_unfair_lock_s *)(v2 + 20);
  v4 = self;
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 20));
  LOBYTE(v2) = *(unsigned char *)(v2 + 16);
  os_unfair_lock_unlock(v3);

  return v2;
}

- (void)setExecuting:(BOOL)a3
{
  v4 = self;
  NSString v5 = String._bridgeToObjectiveC()();
  [(ORReadOperation *)v4 willChangeValueForKey:v5];

  uint64_t v6 = *(uint64_t *)((char *)&v4->super.super.isa + OBJC_IVAR____TtC9SPREngine15ORReadOperation_lockedState);
  os_unfair_lock_lock((os_unfair_lock_t)(v6 + 20));
  *(unsigned char *)(v6 + 16) = a3;
  os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 20));
  NSString v7 = String._bridgeToObjectiveC()();
  [(ORReadOperation *)v4 didChangeValueForKey:v7];
}

- (BOOL)isFinished
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9SPREngine15ORReadOperation_lockedState);
  v3 = (os_unfair_lock_s *)(v2 + 20);
  v4 = self;
  os_unfair_lock_lock((os_unfair_lock_t)(v2 + 20));
  LOBYTE(v2) = *(unsigned char *)(v2 + 17);
  os_unfair_lock_unlock(v3);

  return v2;
}

- (void)setFinished:(BOOL)a3
{
  v4 = self;
  NSString v5 = String._bridgeToObjectiveC()();
  [(ORReadOperation *)v4 willChangeValueForKey:v5];

  uint64_t v6 = *(uint64_t *)((char *)&v4->super.super.isa + OBJC_IVAR____TtC9SPREngine15ORReadOperation_lockedState);
  os_unfair_lock_lock((os_unfair_lock_t)(v6 + 20));
  *(unsigned char *)(v6 + 17) = a3;
  os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 20));
  NSString v7 = String._bridgeToObjectiveC()();
  [(ORReadOperation *)v4 didChangeValueForKey:v7];
}

- (void)dealloc
{
  uint64_t v2 = self;
  sub_10002E534();
}

- (void).cxx_destruct
{
  swift_release();

  swift_unknownObjectRelease();
  swift_release();
  sub_100006520((uint64_t)self + OBJC_IVAR____TtC9SPREngine15ORReadOperation_managedData);

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9SPREngine15ORReadOperation_provisionError);
}

- (void)cancel
{
  uint64_t v2 = self;
  sub_10002E758();
}

- (void)start
{
  uint64_t v2 = self;
  sub_100030470();
}

- (void)handleSessionReachedTimeLimit
{
  uint64_t v2 = self;
  sub_10003222C();
}

- (void)readerSession:(id)a3 didReceiveThermalIndication:(BOOL)a4
{
  id v6 = a3;
  NSString v7 = self;
  sub_100032550((uint64_t)v6, a4);
}

- (void)secureElementReaderSessionDidEndUnexpectedly:(id)a3
{
  id v4 = a3;
  NSString v5 = self;
  sub_100032B6C();
}

- (void)readerSession:(id)a3 didStart:(id)a4
{
}

- (void)readerSession:(id)a3 didEnd:(id)a4
{
}

- (void)readerSession:(id)a3 receivedData:(id)a4 fromApplet:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17 = self;
  uint64_t v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v13 = v12;

  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v16 = v15;

  sub_100033C00((uint64_t)v8, v11, v13, v14, v16);
  swift_bridgeObjectRelease();
  sub_100006628(v11, v13);
}

- (_TtC9SPREngine15ORReadOperation)init
{
  result = (_TtC9SPREngine15ORReadOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end