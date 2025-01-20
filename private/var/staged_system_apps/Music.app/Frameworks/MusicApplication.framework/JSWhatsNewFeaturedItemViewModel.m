@interface JSWhatsNewFeaturedItemViewModel
@end

@implementation JSWhatsNewFeaturedItemViewModel

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore31JSWhatsNewFeaturedItemViewModel__title;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_DD74E0);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC11MusicJSCore31JSWhatsNewFeaturedItemViewModel__subtitle, v4);
  v5((char *)self + OBJC_IVAR____TtC11MusicJSCore31JSWhatsNewFeaturedItemViewModel__imageName, v4);
  v6 = (char *)self + OBJC_IVAR____TtC11MusicJSCore31JSWhatsNewFeaturedItemViewModel__imageContext;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_DFDB38);
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  v8 = (char *)self + OBJC_IVAR____TtC11MusicJSCore31JSWhatsNewFeaturedItemViewModel__additionalDescription;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_DFDB48);
  v10 = *(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8);
  v10(v8, v9);
  v10((char *)self + OBJC_IVAR____TtC11MusicJSCore31JSWhatsNewFeaturedItemViewModel__additionalDescriptionLinkTitle, v9);
  v11 = (char *)self + OBJC_IVAR____TtC11MusicJSCore31JSWhatsNewFeaturedItemViewModel__nativeFeature;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_DFDB68);
  (*(void (**)(char *, uint64_t))(*(void *)(v12 - 8) + 8))(v11, v12);
  v13 = (char *)self + OBJC_IVAR____TtC11MusicJSCore31JSWhatsNewFeaturedItemViewModel__imageBundleIdentifier;
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_DFDB80);
  v15 = *(void (**)(char *, uint64_t))(*(void *)(v14 - 8) + 8);

  v15(v13, v14);
}

@end