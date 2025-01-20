@interface JSSongDetail
@end

@implementation JSSongDetail

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore12JSSongDetail__creditsSections;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_DFF898);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC11MusicJSCore12JSSongDetail__title;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_DFDB48);
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
  v7((char *)self + OBJC_IVAR____TtC11MusicJSCore12JSSongDetail__subtitle, v6);
  v8 = (char *)self + OBJC_IVAR____TtC11MusicJSCore12JSSongDetail__backgroundArtwork;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_DFD4B8);
  v10 = *(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8);

  v10(v8, v9);
}

@end