@interface JSComponentController
@end

@implementation JSComponentController

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore21JSComponentController__headerItem;
  uint64_t v4 = sub_100063814(&qword_1010D62F0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  v5 = (char *)self + OBJC_IVAR____TtC11MusicJSCore21JSComponentController__viewModelKind;
  uint64_t v6 = sub_100063814(&qword_1010D4FF0);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC11MusicJSCore21JSComponentController__pageIdentifier;
  uint64_t v8 = sub_100063814(&qword_10109C170);
  v9 = *(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8);
  v9(v7, v8);
  v9((char *)self + OBJC_IVAR____TtC11MusicJSCore21JSComponentController__pageType, v8);
  v10 = (char *)self + OBJC_IVAR____TtC11MusicJSCore21JSComponentController__pageURL;
  uint64_t v11 = sub_100063814(&qword_1010D3AA0);
  (*(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  v12 = (char *)self + OBJC_IVAR____TtC11MusicJSCore21JSComponentController__pageDetails;
  uint64_t v13 = sub_100063814(&qword_1010D6290);
  (*(void (**)(char *, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  sub_100046744((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore21JSComponentController_delegate);
  swift_release();
  sub_1000637B8((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore21JSComponentController____lazy_storage___signpost, &qword_1010BA540);
}

@end