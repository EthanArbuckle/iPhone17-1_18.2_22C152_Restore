@interface MediaPlayerSyncCoordinator.AVCoordinatorDelegateBridge
- (_TtCC12SeymourMedia26MediaPlayerSyncCoordinatorP33_75A9D0B74F4CEE621C27366C52243E4627AVCoordinatorDelegateBridge)init;
- (id)localParticipantUUIDForPlaybackCoordinator:(id)a3;
- (void)playbackCoordinator:(id)a3 broadcastLocalParticipantStateDictionary:(id)a4;
- (void)playbackCoordinator:(id)a3 broadcastTransportControlStateDictionary:(id)a4 forItemWithIdentifier:(id)a5;
- (void)playbackCoordinator:(id)a3 reloadTransportControlStateForItemWithIdentifier:(id)a4 completionHandler:(id)a5;
@end

@implementation MediaPlayerSyncCoordinator.AVCoordinatorDelegateBridge

- (id)localParticipantUUIDForPlaybackCoordinator:(id)a3
{
  v3 = (void *)sub_226297050();

  return v3;
}

- (void)playbackCoordinator:(id)a3 broadcastLocalParticipantStateDictionary:(id)a4
{
  type metadata accessor for AVPlaybackCoordinationParticipantStateKey(0);
  sub_226218E44(&qword_268122EA0, type metadata accessor for AVPlaybackCoordinationParticipantStateKey);
  sub_226299950();
  uint64_t v6 = MEMORY[0x22A64B9D0]((char *)self+ OBJC_IVAR____TtCC12SeymourMedia26MediaPlayerSyncCoordinatorP33_75A9D0B74F4CEE621C27366C52243E4627AVCoordinatorDelegateBridge_delegate);
  if (v6)
  {
    MEMORY[0x270FA5388](v6);
    id v7 = a3;
    v8 = self;
    sub_226298BF0();

    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
  }
}

- (void)playbackCoordinator:(id)a3 broadcastTransportControlStateDictionary:(id)a4 forItemWithIdentifier:(id)a5
{
  type metadata accessor for AVPlaybackCoordinationTransportControlStateKey(0);
  sub_226218E44(&qword_268122E90, type metadata accessor for AVPlaybackCoordinationTransportControlStateKey);
  sub_226299950();
  sub_226299A00();
  uint64_t v7 = MEMORY[0x22A64B9D0]((char *)self+ OBJC_IVAR____TtCC12SeymourMedia26MediaPlayerSyncCoordinatorP33_75A9D0B74F4CEE621C27366C52243E4627AVCoordinatorDelegateBridge_delegate);
  if (v7)
  {
    MEMORY[0x270FA5388](v7);
    id v8 = a3;
    v9 = self;
    sub_226298BF0();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

- (void)playbackCoordinator:(id)a3 reloadTransportControlStateForItemWithIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t v7 = _Block_copy(a5);
  uint64_t v8 = sub_226299A00();
  uint64_t v10 = v9;
  uint64_t v11 = MEMORY[0x22A64B9D0]((char *)self+ OBJC_IVAR____TtCC12SeymourMedia26MediaPlayerSyncCoordinatorP33_75A9D0B74F4CEE621C27366C52243E4627AVCoordinatorDelegateBridge_delegate);
  if (v11)
  {
    uint64_t v12 = v11;
    _Block_copy(v7);
    id v13 = a3;
    v14 = self;
    sub_226217DC4(v8, v10, v12, (void (**)(void))v7);
    swift_unknownObjectRelease();
    _Block_release(v7);
  }
  else
  {
    id v15 = a3;
    v16 = self;
  }
  _Block_release(v7);

  swift_bridgeObjectRelease();
}

- (_TtCC12SeymourMedia26MediaPlayerSyncCoordinatorP33_75A9D0B74F4CEE621C27366C52243E4627AVCoordinatorDelegateBridge)init
{
  result = (_TtCC12SeymourMedia26MediaPlayerSyncCoordinatorP33_75A9D0B74F4CEE621C27366C52243E4627AVCoordinatorDelegateBridge *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self
     + OBJC_IVAR____TtCC12SeymourMedia26MediaPlayerSyncCoordinatorP33_75A9D0B74F4CEE621C27366C52243E4627AVCoordinatorDelegateBridge_localParticipantID;
  uint64_t v4 = sub_226297070();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self
     + OBJC_IVAR____TtCC12SeymourMedia26MediaPlayerSyncCoordinatorP33_75A9D0B74F4CEE621C27366C52243E4627AVCoordinatorDelegateBridge_delegate;

  sub_226209908((uint64_t)v5);
}

@end