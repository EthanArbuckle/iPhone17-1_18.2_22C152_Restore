@interface MicaPlayerCoordinator
- (_TtC14iCloudSettings21MicaPlayerCoordinator)init;
- (void)micaPlayerDidChangePlaybackTime:(id)a3;
- (void)micaPlayerDidStartPlaying:(id)a3;
- (void)micaPlayerDidStopPlaying:(id)a3;
@end

@implementation MicaPlayerCoordinator

- (void)micaPlayerDidChangePlaybackTime:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2629C894C(v4);
}

- (void)micaPlayerDidStartPlaying:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2629C9484((uint64_t)&unk_270DE9BC8, (uint64_t)sub_2629C9788, (uint64_t)&block_descriptor_23);
}

- (void)micaPlayerDidStopPlaying:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2629C9484((uint64_t)&unk_270DE9B78, (uint64_t)sub_2629C9720, (uint64_t)&block_descriptor_13);
}

- (_TtC14iCloudSettings21MicaPlayerCoordinator)init
{
  result = (_TtC14iCloudSettings21MicaPlayerCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end