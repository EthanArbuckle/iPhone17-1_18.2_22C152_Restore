@interface JSListenNowMusicSiriUpsell
@end

@implementation JSListenNowMusicSiriUpsell

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore26JSListenNowMusicSiriUpsell__title;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_DD74E0);
  v6 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v6)((void *)(v4 - 8), v3, v4);
  v6((char *)self + OBJC_IVAR____TtC11MusicJSCore26JSListenNowMusicSiriUpsell__subtitle, v4);
  v5 = (char *)self + OBJC_IVAR____TtC11MusicJSCore26JSListenNowMusicSiriUpsell__buttonTitle;

  v6(v5, v4);
}

@end