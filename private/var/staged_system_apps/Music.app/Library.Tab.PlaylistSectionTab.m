@interface Library.Tab.PlaylistSectionTab
@end

@implementation Library.Tab.PlaylistSectionTab

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super
                     + OBJC_IVAR____TtCCE5MusicO9MusicCore7Library3Tab18PlaylistSectionTab_allPlaylistsTab));
  v3 = *(void **)((char *)&self->super
                + OBJC_IVAR____TtCCE5MusicO9MusicCore7Library3Tab18PlaylistSectionTab_userPlaylistsTabGroup);
}

@end