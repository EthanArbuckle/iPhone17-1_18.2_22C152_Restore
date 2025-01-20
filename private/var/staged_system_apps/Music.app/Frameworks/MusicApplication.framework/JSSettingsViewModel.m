@interface JSSettingsViewModel
@end

@implementation JSSettingsViewModel

- (void).cxx_destruct
{
  sub_1A500((uint64_t)self + OBJC_IVAR____TtC11MusicJSCore19JSSettingsViewModel_delegate);
  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore19JSSettingsViewModel__sectionsForAuthenticatedState;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_DFCAF0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC11MusicJSCore19JSSettingsViewModel__unauthenticatedSections;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_DFCB10);
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);

  v7(v5, v6);
}

@end