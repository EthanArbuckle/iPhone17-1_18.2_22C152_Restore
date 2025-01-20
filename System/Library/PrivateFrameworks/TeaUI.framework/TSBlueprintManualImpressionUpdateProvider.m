@interface TSBlueprintManualImpressionUpdateProvider
- (TSBlueprintManualImpressionUpdateProvider)init;
- (void)endImpressions;
- (void)setVisibileViewAccessor:(id)a3 visibleRectAccessor:(id)a4;
- (void)updateImpressionsForView:(id)a3 withVisibleRect:(CGRect)a4;
@end

@implementation TSBlueprintManualImpressionUpdateProvider

- (void)setVisibileViewAccessor:(id)a3 visibleRectAccessor:(id)a4
{
  v6 = _Block_copy(a3);
  v7 = _Block_copy(a4);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v6;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  v10 = self;
  BlueprintManualImpressionUpdateProvider.set(visibleViewAccessor:visibleRectAccessor:)((uint64_t)sub_1B5E4F58C, v8, (uint64_t)sub_1B5E4F594, v9);

  swift_release();
  swift_release();
}

- (void)updateImpressionsForView:(id)a3 withVisibleRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  uint64_t v9 = (UIView *)a3;
  v10 = self;
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  BlueprintManualImpressionUpdateProvider.updateImpressions(for:with:)(v9, v12);
}

- (void)endImpressions
{
  v2 = self;
  BlueprintManualImpressionUpdateProvider.endImpressions()();
}

- (TSBlueprintManualImpressionUpdateProvider)init
{
  return (TSBlueprintManualImpressionUpdateProvider *)BlueprintManualImpressionUpdateProvider.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B5E3799C(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___TSBlueprintManualImpressionUpdateProvider_visibleViewAccessor));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___TSBlueprintManualImpressionUpdateProvider_visibleRectAccessor);
  sub_1B5E3799C(v3);
}

@end