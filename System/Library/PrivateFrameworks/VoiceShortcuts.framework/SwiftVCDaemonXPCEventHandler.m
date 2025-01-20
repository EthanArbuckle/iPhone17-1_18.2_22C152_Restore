@interface SwiftVCDaemonXPCEventHandler
- (NSArray)streams;
- (SwiftVCDaemonXPCEventHandler)init;
- (SwiftVCDaemonXPCEventHandler)initWithStreams:(id)a3;
- (SwiftVCDaemonXPCEventHandler)initWithStreams:(id)a3 queue:(id)a4;
- (void)activate;
- (void)addObserver:(id)a3 selector:(SEL)a4 name:(id)a5;
- (void)removeObserver:(id)a3;
- (void)removeObserver:(id)a3 name:(id)a4;
@end

@implementation SwiftVCDaemonXPCEventHandler

- (NSArray)streams
{
  DaemonXPCEventHandler.streams.getter();
  type metadata accessor for VCXPCEventStream(0);
  v2 = (void *)sub_1C7E993B0();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (SwiftVCDaemonXPCEventHandler)initWithStreams:(id)a3 queue:(id)a4
{
  type metadata accessor for VCXPCEventStream(0);
  uint64_t v5 = sub_1C7E993C0();
  return (SwiftVCDaemonXPCEventHandler *)DaemonXPCEventHandler.init(streams:queue:)(v5, a4);
}

- (SwiftVCDaemonXPCEventHandler)initWithStreams:(id)a3
{
  return (SwiftVCDaemonXPCEventHandler *)DaemonXPCEventHandler.init(streams:)();
}

- (void)addObserver:(id)a3 selector:(SEL)a4 name:(id)a5
{
  swift_unknownObjectRetain();
  id v9 = a5;
  v10 = self;
  sub_1C7D8B104((uint64_t)a3, (uint64_t)a4, v9);
  swift_unknownObjectRelease();
}

- (void)removeObserver:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  sub_1C7D8BB6C();
  swift_unknownObjectRelease();
}

- (void)removeObserver:(id)a3 name:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  v7 = self;
  sub_1C7D8BBDC();
  swift_unknownObjectRelease();
}

- (void)activate
{
  v2 = self;
  sub_1C7D8C438();
}

- (SwiftVCDaemonXPCEventHandler)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
}

@end