@interface JSMovieClipItem
@end

@implementation JSMovieClipItem

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC11MusicJSCore15JSMovieClipItem_movieStoreItemMetadata));
  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC11MusicJSCore15JSMovieClipItem_storeItemMovieClip);
}

@end