@interface INUpdateMediaAffinityIntentHandler
- (_TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler)init;
- (void)handleUpdateMediaAffinity:(id)a3 completion:(id)a4;
- (void)resolveMediaItemsForUpdateMediaAffinity:(id)a3 withCompletion:(id)a4;
@end

@implementation INUpdateMediaAffinityIntentHandler

- (_TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler)init
{
  uint64_t v2 = sub_2355BC5D0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  v8 = (char *)&v14 - v7;
  sub_2355BC7C0();
  sub_2355BC7B0();
  sub_2355BC5C0();
  sub_2355BC900();
  swift_allocObject();
  uint64_t v9 = sub_2355BC8F0();
  sub_2355BCAE0();
  uint64_t v10 = sub_2355BCAD0();
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
  uint64_t v11 = swift_retain();
  v12 = (_TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler *)sub_23557C000(v11, (uint64_t)v6, v9, v10);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  swift_release();
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v12;
}

- (void)resolveMediaItemsForUpdateMediaAffinity:(id)a3 withCompletion:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  id v8 = a3;
  uint64_t v9 = self;
  INUpdateMediaAffinityIntentHandler.resolveMediaItems(for:with:)(v8, (uint64_t)sub_23557D688, v7);

  swift_release();
}

- (void)handleUpdateMediaAffinity:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  _Block_copy(v6);
  id v7 = a3;
  id v8 = self;
  sub_23557C6D8(v7, (char *)v8, (void (**)(id, id))v6);
  _Block_release(v6);
  _Block_release(v6);
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler_mediaRemoteAPIProvider);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler_playbackController);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)self + OBJC_IVAR____TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler_nowPlayingProvider);
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC17SiriAudioInternal34INUpdateMediaAffinityIntentHandler_favoriteEntityProvider;
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v3);
}

@end