@interface AppReviewRequestManager
- (_TtC7NewsUI223AppReviewRequestManager)init;
- (void)appleAccountChanged;
@end

@implementation AppReviewRequestManager

- (void)appleAccountChanged
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI223AppReviewRequestManager__userIsAuthenticatedToAppStore) = 2;
}

- (_TtC7NewsUI223AppReviewRequestManager)init
{
  result = (_TtC7NewsUI223AppReviewRequestManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI223AppReviewRequestManager_store);

  swift_unknownObjectRelease();
  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC7NewsUI223AppReviewRequestManager____lazy_storage___appReviewRequestConfig);
  sub_1DF2C5184(v3);
}

@end