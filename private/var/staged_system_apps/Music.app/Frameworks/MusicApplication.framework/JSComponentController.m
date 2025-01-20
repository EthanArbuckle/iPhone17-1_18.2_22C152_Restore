@interface JSComponentController
@end

@implementation JSComponentController

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore21JSComponentController__headerItem;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_E009F0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  v5 = (char *)self + OBJC_IVAR____TtC11MusicJSCore21JSComponentController__viewModelKind;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_DFF730);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC11MusicJSCore21JSComponentController__pageIdentifier;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_DD74E0);
  v9 = *(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8);
  v9(v7, v8);
  v9((char *)self + OBJC_IVAR____TtC11MusicJSCore21JSComponentController__pageType, v8);
  v10 = (char *)self + OBJC_IVAR____TtC11MusicJSCore21JSComponentController__pageURL;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_DFE178);
  (*(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  v12 = (char *)self + OBJC_IVAR____TtC11MusicJSCore21JSComponentController__pageDetails;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_E00990);
  (*(void (**)(char *, uint64_t))(*(void *)(v13 - 8) + 8))(v12, v13);
  sub_1A500((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore21JSComponentController_delegate);
  swift_release();
  sub_1A538((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore21JSComponentController____lazy_storage___signpost, &qword_DFC6A8);
}

@end