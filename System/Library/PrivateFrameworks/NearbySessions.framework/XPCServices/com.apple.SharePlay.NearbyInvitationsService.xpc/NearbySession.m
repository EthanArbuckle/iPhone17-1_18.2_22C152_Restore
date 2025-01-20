@interface NearbySession
- (_TtC44com_apple_SharePlay_NearbyInvitationsService13NearbySession)init;
- (void)session:(id)a3 didDiscoverNearbyObject:(id)a4;
- (void)session:(id)a3 didFailWithError:(id)a4;
- (void)session:(id)a3 didInvalidateWithError:(id)a4;
- (void)session:(id)a3 didUpdateAlgorithmState:(id)a4 forObject:(id)a5;
- (void)session:(id)a3 object:(id)a4 didUpdateRegion:(id)a5 previousRegion:(id)a6;
- (void)session:(id)a3 suspendedWithReason:(int64_t)a4;
- (void)session:(id)a3 suspensionReasonEnded:(int64_t)a4 isNoLongerSuspended:(BOOL)a5;
- (void)sessionDidStartRunning:(id)a3;
@end

@implementation NearbySession

- (_TtC44com_apple_SharePlay_NearbyInvitationsService13NearbySession)init
{
  result = (_TtC44com_apple_SharePlay_NearbyInvitationsService13NearbySession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService13NearbySession__isRunning;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CurrentSubject<Bool>);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService13NearbySession__rangedDevice;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for CurrentSubject<NearbySession.RangedDevice?>);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  v7 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC44com_apple_SharePlay_NearbyInvitationsService13NearbySession_session);
}

- (void)sessionDidStartRunning:(id)a3
{
  id v4 = a3;
  v5 = self;
  NearbySession.sessionDidStartRunning(_:)((NISession)v4);
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  v7 = self;
  NearbySession.session(_:didFailWithError:)(v6, (uint64_t)v8);
}

- (void)session:(id)a3 didInvalidateWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  v7 = self;
  NearbySession.session(_:didInvalidateWith:)(v6, (uint64_t)v8);
}

- (void)session:(id)a3 suspendedWithReason:(int64_t)a4
{
  id v5 = a3;
  id v6 = self;
  NearbySession.session(_:suspendedWith:)(v5);
}

- (void)session:(id)a3 suspensionReasonEnded:(int64_t)a4 isNoLongerSuspended:(BOOL)a5
{
  id v8 = a3;
  v9 = self;
  NearbySession.session(_:suspensionReasonEnded:isNoLongerSuspended:)(v8, a4, a5);
}

- (void)session:(id)a3 didDiscoverNearbyObject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  NearbySession.session(_:didDiscover:)((NISession)v6, (NINearbyObject)v7);
}

- (void)session:(id)a3 object:(id)a4 didUpdateRegion:(id)a5 previousRegion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = self;
  specialized NearbySession.session(_:object:didUpdateRegion:previousRegion:)(v11, a5);
}

- (void)session:(id)a3 didUpdateAlgorithmState:(id)a4 forObject:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  specialized NearbySession.session(_:didUpdateAlgorithmState:for:)(v9);
}

@end