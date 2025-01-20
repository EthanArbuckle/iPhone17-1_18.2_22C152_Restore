@interface CRLMiniFormatterDynamicOperationViewHelper
- (NSArray)decoratorOverlayRenderables;
- (_TtC8Freeform42CRLMiniFormatterDynamicOperationViewHelper)init;
- (void)didEndDynamicOperation;
- (void)willBeginDynamicOperation;
@end

@implementation CRLMiniFormatterDynamicOperationViewHelper

- (NSArray)decoratorOverlayRenderables
{
  sub_10050E85C();
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;

  return (NSArray *)v2.super.isa;
}

- (void)willBeginDynamicOperation
{
  NSArray v2 = self;
  sub_10057B75C();
}

- (void)didEndDynamicOperation
{
  NSArray v2 = self;
  sub_10057B864();
}

- (_TtC8Freeform42CRLMiniFormatterDynamicOperationViewHelper)init
{
  result = (_TtC8Freeform42CRLMiniFormatterDynamicOperationViewHelper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  v3 = (char *)self + OBJC_IVAR____TtC8Freeform42CRLMiniFormatterDynamicOperationViewHelper_delegate;

  sub_100523398((uint64_t)v3);
}

@end