@interface JSSearchLandingUpsell
@end

@implementation JSSearchLandingUpsell

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore21JSSearchLandingUpsell__marketingID;
  uint64_t v4 = sub_100063814(&qword_10109C170);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC11MusicJSCore21JSSearchLandingUpsell__headline, v4);
  v5((char *)self + OBJC_IVAR____TtC11MusicJSCore21JSSearchLandingUpsell__subtitle, v4);
  v5((char *)self + OBJC_IVAR____TtC11MusicJSCore21JSSearchLandingUpsell__primaryButtonTitle, v4);
  v5((char *)self + OBJC_IVAR____TtC11MusicJSCore21JSSearchLandingUpsell__accessoryButtonTitle, v4);
  v6 = (char *)self + OBJC_IVAR____TtC11MusicJSCore21JSSearchLandingUpsell__tallArtwork;
  uint64_t v7 = sub_100063814(&qword_1010D2FE8);
  v8 = *(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8);
  v8(v6, v7);
  v8((char *)self + OBJC_IVAR____TtC11MusicJSCore21JSSearchLandingUpsell__wideArtwork, v7);
  v9 = (char *)self + OBJC_IVAR____TtC11MusicJSCore21JSSearchLandingUpsell__tallVideoArtwork;
  uint64_t v10 = sub_100063814(&qword_1010D3010);
  v11 = *(void (**)(char *, uint64_t))(*(void *)(v10 - 8) + 8);
  v11(v9, v10);
  v11((char *)self + OBJC_IVAR____TtC11MusicJSCore21JSSearchLandingUpsell__wideVideoArtwork, v10);
  v12 = (char *)self + OBJC_IVAR____TtC11MusicJSCore21JSSearchLandingUpsell__shouldDisplayCloseButton;
  uint64_t v13 = sub_100063814(&qword_10109C180);
  v14 = *(void (**)(char *, uint64_t))(*(void *)(v13 - 8) + 8);

  v14(v12, v13);
}

@end