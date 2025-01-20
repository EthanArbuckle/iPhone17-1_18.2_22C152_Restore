@interface EditingEnvironment
- (_TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD418EditingEnvironment)init;
@end

@implementation EditingEnvironment

- (_TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD418EditingEnvironment)init
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  sub_10000CE80((uint64_t)self+ OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD418EditingEnvironment_posterDescriptor, &qword_10001FD98);
  sub_10000CE80((uint64_t)self+ OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD418EditingEnvironment_sourcePosterConfiguration, (uint64_t *)&unk_10001FDA0);
  v3 = (char *)self
     + OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD418EditingEnvironment_sourceAssetDirectory;
  uint64_t v4 = sub_1000113B0();
  v6 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v6)((void *)(v4 - 8), v3, v4);
  v5 = (char *)self
     + OBJC_IVAR____TtC31AmbientPhotoFramePosterProviderP33_7CD6DA06E7A58C5800FB180BD1A66BD418EditingEnvironment_targetAssetDirectory;
  v6(v5, v4);
}

@end