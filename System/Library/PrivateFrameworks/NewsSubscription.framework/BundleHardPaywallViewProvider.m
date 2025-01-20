@interface BundleHardPaywallViewProvider
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (_TtC16NewsSubscription29BundleHardPaywallViewProvider)init;
- (void)scrollViewDidScroll:(id)a3;
@end

@implementation BundleHardPaywallViewProvider

- (_TtC16NewsSubscription29BundleHardPaywallViewProvider)init
{
  result = (_TtC16NewsSubscription29BundleHardPaywallViewProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16NewsSubscription29BundleHardPaywallViewProvider_bundleHardPaywallView));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription29BundleHardPaywallViewProvider_renderer);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription29BundleHardPaywallViewProvider_layoutAttributesFactory);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1BFA51124((uint64_t)self + OBJC_IVAR____TtC16NewsSubscription29BundleHardPaywallViewProvider_videoFileURL, &qword_1EBA88B80, MEMORY[0x1E4F276F0]);
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  uint64_t v9 = sub_1BFBD1DD8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1BFBD1D98();
  id v13 = a3;
  v14 = self;
  LOBYTE(a6) = sub_1BFA67F50((uint64_t)v12, a6);

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return a6 & 1;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1BFA67FE8();
}

@end