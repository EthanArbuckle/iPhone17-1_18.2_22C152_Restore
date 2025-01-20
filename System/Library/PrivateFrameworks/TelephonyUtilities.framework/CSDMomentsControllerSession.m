@interface CSDMomentsControllerSession
- (BOOL)isRegistered;
- (CSDAVCMoments)moments;
- (CSDMomentsControllerSession)init;
- (CSDMomentsControllerSession)initWithMoments:(id)a3 remoteIDSDestinations:(id)a4 callCenterObserver:(id)a5;
- (NSDictionary)activeRequestsByTransactionID;
- (NSDictionary)remoteIDSDestinations;
- (NSString)description;
- (id)remoteRequesteeIDSDestinationFor:(id)a3;
- (id)remoteRequesterIDSDestinationFor:(id)a3;
- (void)removeActiveRequestForTransactionID:(id)a3;
- (void)setActiveRequest:(id)a3 forTransactionID:(id)a4;
- (void)setActiveRequestsByTransactionID:(id)a3;
- (void)setIsRegistered:(BOOL)a3;
- (void)setRemoteIDSDestinations:(id)a3;
@end

@implementation CSDMomentsControllerSession

- (CSDAVCMoments)moments
{
  v2 = (void *)sub_1002F0BCC();

  return (CSDAVCMoments *)v2;
}

- (NSDictionary)remoteIDSDestinations
{
  sub_1002F0DAC();
  v2.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSDictionary *)v2.super.isa;
}

- (void)setRemoteIDSDestinations:(id)a3
{
  uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = self;
  sub_1001FE028(v4, &OBJC_IVAR___CSDMomentsControllerSession_remoteIDSDestinations);
}

- (BOOL)isRegistered
{
  return sub_1002F0CEC() & 1;
}

- (void)setIsRegistered:(BOOL)a3
{
}

- (NSDictionary)activeRequestsByTransactionID
{
  sub_1002F0DAC();
  type metadata accessor for MomentsRequest();
  v2.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return (NSDictionary *)v2.super.isa;
}

- (void)setActiveRequestsByTransactionID:(id)a3
{
  type metadata accessor for MomentsRequest();
  uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = self;
  sub_1001FE028(v4, &OBJC_IVAR___CSDMomentsControllerSession_activeRequestsByTransactionID);
}

- (NSString)description
{
  NSDictionary v2 = self;
  sub_1002F0EE4();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (CSDMomentsControllerSession)initWithMoments:(id)a3 remoteIDSDestinations:(id)a4 callCenterObserver:(id)a5
{
  uint64_t v7 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  return (CSDMomentsControllerSession *)sub_1002F1244((uint64_t)a3, v7, (uint64_t)a5);
}

- (id)remoteRequesteeIDSDestinationFor:(id)a3
{
  return sub_1002F1A50(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_requesteeID);
}

- (id)remoteRequesterIDSDestinationFor:(id)a3
{
  return sub_1002F1A50(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_requesterID);
}

- (void)setActiveRequest:(id)a3 forTransactionID:(id)a4
{
  uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v8 = v7;
  id v9 = a3;
  v10 = self;
  sub_1002F1AE4(v9, v6, v8);

  swift_bridgeObjectRelease();
}

- (void)removeActiveRequestForTransactionID:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  sub_1002F1BC8(v4, v6);

  swift_bridgeObjectRelease();
}

- (CSDMomentsControllerSession)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

@end