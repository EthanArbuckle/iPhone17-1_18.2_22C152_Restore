@interface JSParagraphViewModel
@end

@implementation JSParagraphViewModel

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore20JSParagraphViewModel__title;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_DD74E0);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC11MusicJSCore20JSParagraphViewModel__text, v4);
  v6 = (char *)self + OBJC_IVAR____TtC11MusicJSCore20JSParagraphViewModel__backgroundStyle;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_E01020);
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  v8 = (char *)self + OBJC_IVAR____TtC11MusicJSCore20JSParagraphViewModel__textStyle;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_E01038);
  (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  v10 = (char *)self + OBJC_IVAR____TtC11MusicJSCore20JSParagraphViewModel__textSize;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_E01050);
  v12 = *(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8);
  v12(v10, v11);
  v12((char *)self + OBJC_IVAR____TtC11MusicJSCore20JSParagraphViewModel__titleSize, v11);
  v13 = (char *)self + OBJC_IVAR____TtC11MusicJSCore20JSParagraphViewModel__shouldHideDivider;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_DE0398);
  v18 = *(void (**)(char *, uint64_t))(*(void *)(v14 - 8) + 8);
  ((void (*)(void *__return_ptr, char *, uint64_t))v18)((void *)(v14 - 8), v13, v14);
  v18((char *)self + OBJC_IVAR____TtC11MusicJSCore20JSParagraphViewModel__shouldTruncate, v14);
  v15 = (char *)self + OBJC_IVAR____TtC11MusicJSCore20JSParagraphViewModel__allowedNumberOfLinesBeforeTruncating;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_DFE6F0);
  (*(void (**)(char *, uint64_t))(*(void *)(v16 - 8) + 8))(v15, v16);
  v17 = (char *)self + OBJC_IVAR____TtC11MusicJSCore20JSParagraphViewModel__displayingEditorialNotes;

  v18(v17, v14);
}

@end