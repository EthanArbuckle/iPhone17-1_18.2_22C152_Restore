@interface CSDFaceTimeInviteDemuxer
- (BOOL)destinationIDsCanUseV2Blobs:(id)a3;
- (CSDFaceTimeInviteDemuxer)init;
- (void)idsPeersForHandle:(id)a3 video:(BOOL)a4 fromID:(id)a5 completionHandler:(id)a6;
@end

@implementation CSDFaceTimeInviteDemuxer

- (CSDFaceTimeInviteDemuxer)init
{
  return (CSDFaceTimeInviteDemuxer *)sub_1003436E8();
}

- (void)idsPeersForHandle:(id)a3 video:(BOOL)a4 fromID:(id)a5 completionHandler:(id)a6
{
  BOOL v6 = a4;
  v9 = _Block_copy(a6);
  uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v12 = v11;
  _Block_copy(v9);
  id v13 = a3;
  v14 = self;
  sub_100343A38(v13, v6, v10, v12, (char *)v14, v9);
  _Block_release(v9);

  swift_bridgeObjectRelease();
}

- (BOOL)destinationIDsCanUseV2Blobs:(id)a3
{
  return 0;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CSDFaceTimeInviteDemuxer____lazy_storage___pushTokenForSelf);
  uint64_t v4 = *(void *)&self->featureFlags[OBJC_IVAR___CSDFaceTimeInviteDemuxer____lazy_storage___pushTokenForSelf];

  sub_1003478B4(v3, v4);
}

@end