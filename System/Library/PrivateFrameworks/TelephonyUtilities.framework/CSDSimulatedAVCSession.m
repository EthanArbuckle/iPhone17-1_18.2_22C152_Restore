@interface CSDSimulatedAVCSession
- (BOOL)containsRemoteParticipantWithIdentifier:(unint64_t)a3;
- (BOOL)isAudioEnabled;
- (BOOL)isAudioPaused;
- (BOOL)isAudioReady;
- (BOOL)isOneToOneModeEnabled;
- (BOOL)isRelaying;
- (BOOL)isScreenEnabled;
- (BOOL)isScreening;
- (BOOL)isUplinkMuted;
- (BOOL)isVideo;
- (BOOL)isVideoEnabled;
- (BOOL)isVideoPaused;
- (CGRect)presentationRect;
- (CSDSimulatedAVCSession)init;
- (CSDSimulatedAVCSession)initWithDelegate:(id)a3 queue:(id)a4 videoEnabled:(BOOL)a5 oneToOneModeEnabled:(BOOL)a6;
- (NSData)localParticipantData;
- (NSString)sessionIdentifier;
- (id)localParticipantDataWithVersion:(unint64_t)a3;
- (id)pendingRemovedRemoteParticipantByIdentififer:(unint64_t)a3;
- (int)presentationState;
- (int64_t)localCaptionsToken;
- (int64_t)maxVideoDecodesAllowed;
- (int64_t)sessionToken;
- (void)addParticipant:(id)a3 withVideoEnabled:(BOOL)a4 audioPaused:(BOOL)a5 screenEnabled:(BOOL)a6;
- (void)removeParticipant:(id)a3;
- (void)setAudioEnabled:(BOOL)a3;
- (void)setAudioPaused:(BOOL)a3;
- (void)setAudioReady:(BOOL)a3;
- (void)setOneToOneModeEnabled:(BOOL)a3;
- (void)setPresentationRect:(CGRect)a3;
- (void)setPresentationState:(int)a3;
- (void)setRelaying:(BOOL)a3;
- (void)setScreening:(BOOL)a3;
- (void)setUplinkMuted:(BOOL)a3;
- (void)setVideo:(BOOL)a3;
- (void)setVideoEnabled:(BOOL)a3;
- (void)setVideoPaused:(BOOL)a3;
- (void)start;
- (void)stop;
- (void)stopWithError:(id)a3;
@end

@implementation CSDSimulatedAVCSession

- (CSDSimulatedAVCSession)initWithDelegate:(id)a3 queue:(id)a4 videoEnabled:(BOOL)a5 oneToOneModeEnabled:(BOOL)a6
{
  swift_unknownObjectRetain();
  id v7 = a4;
  sub_10024987C();
  return result;
}

- (NSData)localParticipantData
{
  v2.super.isa = Data._bridgeToObjectiveC()().super.isa;
  sub_1001F7498(0, 0xC000000000000000);

  return (NSData *)v2.super.isa;
}

- (NSString)sessionIdentifier
{
  sub_100249B88();
  if (v2)
  {
    NSString v3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v3 = 0;
  }

  return (NSString *)v3;
}

- (int64_t)sessionToken
{
  return 1;
}

- (int64_t)maxVideoDecodesAllowed
{
  return 100;
}

- (BOOL)isVideo
{
  return sub_100249C04() & 1;
}

- (void)setVideo:(BOOL)a3
{
}

- (BOOL)isAudioReady
{
  return sub_100249C6C() & 1;
}

- (void)setAudioReady:(BOOL)a3
{
}

- (BOOL)isUplinkMuted
{
  return sub_100249CD4() & 1;
}

- (void)setUplinkMuted:(BOOL)a3
{
}

- (BOOL)isAudioEnabled
{
  return sub_100249D3C() & 1;
}

- (void)setAudioEnabled:(BOOL)a3
{
}

- (BOOL)isVideoEnabled
{
  return sub_100249DA4() & 1;
}

- (void)setVideoEnabled:(BOOL)a3
{
}

- (BOOL)isScreenEnabled
{
  return 0;
}

- (BOOL)isVideoPaused
{
  return sub_100249E14() & 1;
}

- (void)setVideoPaused:(BOOL)a3
{
}

- (BOOL)isAudioPaused
{
  return sub_100249E7C() & 1;
}

- (void)setAudioPaused:(BOOL)a3
{
}

- (BOOL)isOneToOneModeEnabled
{
  return sub_100249EE4() & 1;
}

- (void)setOneToOneModeEnabled:(BOOL)a3
{
}

- (BOOL)isRelaying
{
  return sub_100249F4C() & 1;
}

- (void)setRelaying:(BOOL)a3
{
}

- (BOOL)isScreening
{
  return sub_100249FB4() & 1;
}

- (void)setScreening:(BOOL)a3
{
}

- (int64_t)localCaptionsToken
{
  return 1;
}

- (int)presentationState
{
  return sub_10024A020();
}

- (void)setPresentationState:(int)a3
{
}

- (CGRect)presentationRect
{
  double v2 = sub_10024A08C();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setPresentationRect:(CGRect)a3
{
}

- (id)localParticipantDataWithVersion:(unint64_t)a3
{
  v3.super.isa = Data._bridgeToObjectiveC()().super.isa;
  sub_1001F7498(0, 0xC000000000000000);

  return v3.super.isa;
}

- (BOOL)containsRemoteParticipantWithIdentifier:(unint64_t)a3
{
  return sub_10024A12C(a3) & 1;
}

- (void)addParticipant:(id)a3 withVideoEnabled:(BOOL)a4 audioPaused:(BOOL)a5 screenEnabled:(BOOL)a6
{
  id v7 = a3;
  v8 = self;
  sub_10024A1C8();
}

- (void)removeParticipant:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_10024A618();
}

- (id)pendingRemovedRemoteParticipantByIdentififer:(unint64_t)a3
{
  return 0;
}

- (void)start
{
  double v2 = self;
  sub_10024AA34();
}

- (void)stop
{
  double v2 = self;
  sub_10024AD30();
}

- (void)stopWithError:(id)a3
{
  id v4 = self;
  id v5 = a3;
  sub_10024AD80();
}

- (CSDSimulatedAVCSession)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  sub_100222678((uint64_t)self + OBJC_IVAR___CSDSimulatedAVCSession_delegate);

  swift_bridgeObjectRelease();
}

@end