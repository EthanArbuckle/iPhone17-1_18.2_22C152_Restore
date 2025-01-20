@interface HideMyEmailSignupBlueprintViewHeaderFooterProvider
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (_TtC16NewsSubscription50HideMyEmailSignupBlueprintViewHeaderFooterProvider)init;
@end

@implementation HideMyEmailSignupBlueprintViewHeaderFooterProvider

- (_TtC16NewsSubscription50HideMyEmailSignupBlueprintViewHeaderFooterProvider)init
{
  result = (_TtC16NewsSubscription50HideMyEmailSignupBlueprintViewHeaderFooterProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC16NewsSubscription50HideMyEmailSignupBlueprintViewHeaderFooterProvider_headerRenderer);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self+ OBJC_IVAR____TtC16NewsSubscription50HideMyEmailSignupBlueprintViewHeaderFooterProvider_footerRenderer);
  v3 = (char *)self + OBJC_IVAR____TtC16NewsSubscription50HideMyEmailSignupBlueprintViewHeaderFooterProvider_delegate;
  sub_1BFA51A44((uint64_t)v3);
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v9 = sub_1BFBD1DD8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  v12 = (char *)v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BFBD1D98();
  if (a6) {
    goto LABEL_5;
  }
  uint64_t v13 = MEMORY[0x1C18BCCA0]((char *)self + OBJC_IVAR____TtC16NewsSubscription50HideMyEmailSignupBlueprintViewHeaderFooterProvider_delegate);
  if (!v13) {
    goto LABEL_5;
  }
  uint64_t v14 = *__swift_project_boxed_opaque_existential_1((void *)(*(void *)(v13 + OBJC_IVAR____TtC16NewsSubscription31HideMyEmailSignupViewController_eventHandler)+ 48), *(void *)(*(void *)(v13 + OBJC_IVAR____TtC16NewsSubscription31HideMyEmailSignupViewController_eventHandler)+ 72));
  uint64_t v15 = *(void *)(v14 + 48);
  v20[1] = *(id *)(v14 + 56);
  __swift_project_boxed_opaque_existential_1((void *)(v14 + 24), v15);
  sub_1BFBA71DC();
  v20[0] = a3;
  v16 = self;
  BOOL result = sub_1BFBD24F8();
  if (v22)
  {
    sub_1BFA6ADEC(&v21, (uint64_t)v23);
    uint64_t v18 = v24;
    uint64_t v19 = v25;
    __swift_project_boxed_opaque_existential_1(v23, v24);
    (*(void (**)(char *, uint64_t, uint64_t))(v19 + 24))(v12, v18, v19);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v23);

    swift_unknownObjectRelease();
LABEL_5:
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    return a6 != 0;
  }
  __break(1u);
  return result;
}

@end