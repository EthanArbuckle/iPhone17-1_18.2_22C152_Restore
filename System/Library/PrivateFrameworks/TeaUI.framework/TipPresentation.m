@interface TipPresentation
- (_TtC5TeaUI15TipPresentation)init;
- (void)_observeScrollViewDidScroll:(id)a3;
@end

@implementation TipPresentation

- (_TtC5TeaUI15TipPresentation)init
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  sub_1B5E437C4((uint64_t)self + OBJC_IVAR____TtC5TeaUI15TipPresentation_delegate);
  swift_bridgeObjectRelease();
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  id v4 = a3;
  v5 = self;
  TipPresentation._observeScrollViewDidScroll(_:)((UIScrollView_optional *)v5);
}

@end