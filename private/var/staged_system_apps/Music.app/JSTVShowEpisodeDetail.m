@interface JSTVShowEpisodeDetail
@end

@implementation JSTVShowEpisodeDetail

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore21JSTVShowEpisodeDetail__item;
  uint64_t v4 = sub_100063814(&qword_1010D6460);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11MusicJSCore21JSTVShowEpisodeDetail_containerDetailLink);
}

@end