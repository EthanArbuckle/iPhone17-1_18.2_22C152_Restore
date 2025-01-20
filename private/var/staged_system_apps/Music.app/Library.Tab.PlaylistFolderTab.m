@interface Library.Tab.PlaylistFolderTab
@end

@implementation Library.Tab.PlaylistFolderTab

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtCCE5MusicO9MusicCore7Library3Tab17PlaylistFolderTab_folder;
  uint64_t v3 = type metadata accessor for Playlist.Folder();
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end