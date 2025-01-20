@interface Library.Tab.PlaylistTab
@end

@implementation Library.Tab.PlaylistTab

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtCCE5MusicO9MusicCore7Library3Tab11PlaylistTab_playlist;
  uint64_t v4 = type metadata accessor for Playlist();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtCCE5MusicO9MusicCore7Library3Tab11PlaylistTab_loadedArtworkInfo, &qword_1010A5380);
}

@end