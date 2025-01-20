@interface Coordinator
- (BOOL)shouldHandleCardSectionEngagement:(id)a3;
- (_TtC26ResponseGenerationUIPlugin11Coordinator)init;
- (void)cardViewController:(id)a3 preferredContentSizeDidChange:(CGSize)a4 animated:(BOOL)a5;
@end

@implementation Coordinator

- (void)cardViewController:(id)a3 preferredContentSizeDidChange:(CGSize)a4 animated:(BOOL)a5
{
  id v7 = a3;
  v8 = self;
  sub_BCB8(a3);
}

- (BOOL)shouldHandleCardSectionEngagement:(id)a3
{
  id v3 = a3;
  id v5 = a3;
  v6 = self;
  LOBYTE(v3) = sub_A518(v3);

  return v3 & 1;
}

- (_TtC26ResponseGenerationUIPlugin11Coordinator)init
{
  result = (_TtC26ResponseGenerationUIPlugin11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  id v3 = (char *)self + OBJC_IVAR____TtC26ResponseGenerationUIPlugin11Coordinator_interactionDelegate;
  uint64_t v4 = sub_1E578();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();

  swift_unknownObjectWeakDestroy();
}

@end