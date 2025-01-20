@interface FTMomentsControllerSession
- (BOOL)isRegistered;
- (FTAVCMomentsProtocol)moments;
- (FTMomentsControllerSession)init;
- (FTMomentsControllerSession)initWithMoments:(id)a3 remoteIDSDestinations:(id)a4 callCenter:(id)a5;
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

@implementation FTMomentsControllerSession

- (FTAVCMomentsProtocol)moments
{
  id v2 = sub_10002B074();

  return (FTAVCMomentsProtocol *)v2;
}

- (NSDictionary)remoteIDSDestinations
{
  sub_10002B254();
  v2.super.isa = sub_10003CF60().super.isa;
  swift_bridgeObjectRelease();

  return (NSDictionary *)v2.super.isa;
}

- (void)setRemoteIDSDestinations:(id)a3
{
  uint64_t v4 = sub_10003CF70();
  v5 = self;
  sub_10002B324(v4, &OBJC_IVAR___FTMomentsControllerSession_remoteIDSDestinations);
}

- (BOOL)isRegistered
{
  return sub_10002B194() & 1;
}

- (void)setIsRegistered:(BOOL)a3
{
}

- (NSDictionary)activeRequestsByTransactionID
{
  sub_10002B254();
  type metadata accessor for LivePhotosMomentsRequest();
  v2.super.isa = sub_10003CF60().super.isa;
  swift_bridgeObjectRelease();

  return (NSDictionary *)v2.super.isa;
}

- (void)setActiveRequestsByTransactionID:(id)a3
{
  type metadata accessor for LivePhotosMomentsRequest();
  uint64_t v4 = sub_10003CF70();
  v5 = self;
  sub_10002B324(v4, &OBJC_IVAR___FTMomentsControllerSession_activeRequestsByTransactionID);
}

- (NSString)description
{
  NSDictionary v2 = self;
  sub_10002B3DC();

  NSString v3 = sub_10003CFB0();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (FTMomentsControllerSession)initWithMoments:(id)a3 remoteIDSDestinations:(id)a4 callCenter:(id)a5
{
  uint64_t v7 = sub_10003CF70();
  return (FTMomentsControllerSession *)sub_10002B7A0((uint64_t)a3, v7, (uint64_t)a5);
}

- (id)remoteRequesteeIDSDestinationFor:(id)a3
{
  return sub_10002BF60(self, (uint64_t)a2, a3, (SEL *)&selRef_requesteeID);
}

- (id)remoteRequesterIDSDestinationFor:(id)a3
{
  return sub_10002BF60(self, (uint64_t)a2, a3, (SEL *)&selRef_requesterID);
}

- (void)setActiveRequest:(id)a3 forTransactionID:(id)a4
{
  uint64_t v6 = sub_10003CFC0();
  uint64_t v8 = v7;
  id v9 = a3;
  v10 = self;
  sub_10002BFF4(v9, v6, v8);

  swift_bridgeObjectRelease();
}

- (void)removeActiveRequestForTransactionID:(id)a3
{
  uint64_t v4 = sub_10003CFC0();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  sub_10002C0D8(v4, v6);

  swift_bridgeObjectRelease();
}

- (FTMomentsControllerSession)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  NSString v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___FTMomentsControllerSession_callCenter);
}

@end