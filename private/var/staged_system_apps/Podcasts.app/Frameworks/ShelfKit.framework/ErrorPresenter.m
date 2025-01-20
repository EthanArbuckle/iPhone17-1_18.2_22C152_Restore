@interface ErrorPresenter
- (_TtC8ShelfKit14ErrorPresenter)init;
- (void)airplaneModeInquiryDidObserveChange:(id)a3;
@end

@implementation ErrorPresenter

- (void)airplaneModeInquiryDidObserveChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  ErrorPresenter.update()();
}

- (_TtC8ShelfKit14ErrorPresenter)init
{
  result = (_TtC8ShelfKit14ErrorPresenter *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  sub_8CED8((uint64_t)self + OBJC_IVAR____TtC8ShelfKit14ErrorPresenter__view);
  swift_errorRelease();
  v3 = (char *)self + OBJC_IVAR____TtC8ShelfKit14ErrorPresenter___observationRegistrar;
  uint64_t v4 = sub_3D3520();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end