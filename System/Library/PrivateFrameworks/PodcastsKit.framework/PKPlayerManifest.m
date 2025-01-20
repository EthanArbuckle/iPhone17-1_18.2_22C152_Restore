@interface PKPlayerManifest
+ (id)manifestForEpisode:(id)a3;
+ (id)manifestForEpisodeStoreId:(id)a3 assetInfo:(id)a4;
+ (id)manifestForEpisodeStoreId:(id)a3 siriContext:(id)a4;
+ (id)manifestForPlayMyPodcastsWithSiriContext:(id)a3;
+ (id)manifestForShow:(id)a3;
+ (id)manifestForShowStoreId:(id)a3 assetInfo:(id)a4;
+ (id)manifestForShowStoreId:(id)a3 siriContext:(id)a4;
+ (id)manifestForShowUuid:(id)a3 siriContext:(id)a4;
+ (id)manifestForStationId:(id)a3 siriContext:(id)a4;
- (PKPlayerManifest)init;
@end

@implementation PKPlayerManifest

+ (id)manifestForEpisode:(id)a3
{
  id v3 = a3;
  id v4 = sub_23F0B7B54(v3, (uint64_t)&off_26F2CBF08);

  return v4;
}

+ (id)manifestForShow:(id)a3
{
  id v3 = a3;
  id v4 = sub_23F0B7B54(v3, (uint64_t)&off_26F2CBF18);

  return v4;
}

+ (id)manifestForShowUuid:(id)a3 siriContext:(id)a4
{
  return sub_23F0B77B4((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, void *))_s11PodcastsKit14PlayerManifestC19manifestForShowUuid_11siriContextACSS_AA04SiriJ0CSgtFZ_0);
}

+ (id)manifestForPlayMyPodcastsWithSiriContext:(id)a3
{
  id v4 = a3;
  id v5 = _s11PodcastsKit14PlayerManifestC017manifestForPlayMyA011siriContextAcA04SiriJ0CSg_tFZ_0(a3);

  return v5;
}

+ (id)manifestForEpisodeStoreId:(id)a3 siriContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_23F0B7FF4(v5, a4, (uint64_t (*)(void))type metadata accessor for EpisodeStoreId, (uint64_t)&off_26F2CBF38);

  return v7;
}

+ (id)manifestForStationId:(id)a3 siriContext:(id)a4
{
  return sub_23F0B77B4((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, a4, (uint64_t (*)(uint64_t, uint64_t, void *))_s11PodcastsKit14PlayerManifestC8manifest3for11siriContextACSS_AA04SiriH0CSgtFZ_0);
}

+ (id)manifestForEpisodeStoreId:(id)a3 assetInfo:(id)a4
{
  return sub_23F0B7994((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(void))type metadata accessor for EpisodeStoreId, (uint64_t)&off_26F2CBF38);
}

+ (id)manifestForShowStoreId:(id)a3 siriContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_23F0B7FF4(v5, a4, (uint64_t (*)(void))type metadata accessor for ShowStoreId, (uint64_t)&off_26F2CBF28);

  return v7;
}

+ (id)manifestForShowStoreId:(id)a3 assetInfo:(id)a4
{
  return sub_23F0B7994((uint64_t)a1, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(void))type metadata accessor for ShowStoreId, (uint64_t)&off_26F2CBF28);
}

- (PKPlayerManifest)init
{
  result = (PKPlayerManifest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR___PKPlayerManifest_playableContent);
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PKPlayerManifest_siriContext);
}

@end