@interface JSOrderedPlaylistSelector
@end

@implementation JSOrderedPlaylistSelector

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC11MusicJSCore25JSOrderedPlaylistSelector__items;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_E01200);
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end