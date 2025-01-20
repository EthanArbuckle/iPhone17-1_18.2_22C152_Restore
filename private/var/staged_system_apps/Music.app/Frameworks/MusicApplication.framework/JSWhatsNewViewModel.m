@interface JSWhatsNewViewModel
@end

@implementation JSWhatsNewViewModel

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC11MusicJSCore19JSWhatsNewViewModel__title;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_DD74E0);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC11MusicJSCore19JSWhatsNewViewModel__displayName, v4);
  v6 = (char *)self + OBJC_IVAR____TtC11MusicJSCore19JSWhatsNewViewModel__featuredItems;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_E00130);
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  v5((char *)self + OBJC_IVAR____TtC11MusicJSCore19JSWhatsNewViewModel__buttonTitle, v4);
  v8 = (char *)self + OBJC_IVAR____TtC11MusicJSCore19JSWhatsNewViewModel__isModalInPresentation;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_DE0398);
  (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  uint64_t v10 = *(uint64_t *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC11MusicJSCore19JSWhatsNewViewModel_pendingWhatsNewPresentationContext);
  uint64_t v11 = *(void *)&self->super.super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore19JSWhatsNewViewModel_pendingWhatsNewPresentationContext];
  uint64_t v12 = *(void *)&self->super.super.nativeBridgeIdentifier[OBJC_IVAR____TtC11MusicJSCore19JSWhatsNewViewModel_pendingWhatsNewPresentationContext
                                                           + 8];
  uint64_t v13 = *(void *)&self->super.super.isNativeOnly[OBJC_IVAR____TtC11MusicJSCore19JSWhatsNewViewModel_pendingWhatsNewPresentationContext];
  v14 = *(void **)&self->super.playActivityFeatureName[OBJC_IVAR____TtC11MusicJSCore19JSWhatsNewViewModel_pendingWhatsNewPresentationContext];

  sub_998FCC(v10, v11, v12, v13, v14);
}

@end