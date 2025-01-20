@interface AudioQueueStateManager
- (_TtC21SiriInformationSearch22AudioQueueStateManager)init;
- (void)nowPlayingObserver:(id)a3 playbackStateDidChangeFrom:(int64_t)a4 to:(int64_t)a5 lastPlayingDate:(id)a6;
@end

@implementation AudioQueueStateManager

- (void)nowPlayingObserver:(id)a3 playbackStateDidChangeFrom:(int64_t)a4 to:(int64_t)a5 lastPlayingDate:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Date?);
  MEMORY[0x1F4188790](v11 - 8);
  v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a6)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v14 = type metadata accessor for Date();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 0, 1, v14);
  }
  else
  {
    uint64_t v15 = type metadata accessor for Date();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v13, 1, 1, v15);
  }
  if (a3)
  {
    *((void *)&v20 + 1) = type metadata accessor for SOMediaNowPlayingObserver();
    v21 = &protocol witness table for SOMediaNowPlayingObserver;
    *(void *)&long long v19 = a3;
  }
  else
  {
    v21 = 0;
    long long v19 = 0u;
    long long v20 = 0u;
  }
  v16 = *(void (**)(long long *, int64_t, int64_t, char *))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa)
                                                                                  + 0x130);
  id v17 = a3;
  v18 = self;
  v16(&v19, a4, a5, v13);
  outlined destroy of MediaUserStateCenter?((uint64_t)&v19, &demangling cache variable for type metadata for MediaNowPlayingObserving?);

  outlined destroy of MediaUserStateCenter?((uint64_t)v13, &demangling cache variable for type metadata for Date?);
}

- (_TtC21SiriInformationSearch22AudioQueueStateManager)init
{
  result = (_TtC21SiriInformationSearch22AudioQueueStateManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21SiriInformationSearch22AudioQueueStateManager_updateAudioQueueStateCacheGroup));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC21SiriInformationSearch22AudioQueueStateManager_queueStateObserver);

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21SiriInformationSearch22AudioQueueStateManager_nowPlayingInfoCache));

  swift_bridgeObjectRelease();
}

@end