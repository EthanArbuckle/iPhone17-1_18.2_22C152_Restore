@interface PXDisplayAssetViewModelHighlightTimeRangeController
- (PXDisplayAssetViewModelHighlightTimeRangeController)init;
- (PXDisplayAssetViewModelHighlightTimeRangeController)initWithViewModel:(id)a3;
@end

@implementation PXDisplayAssetViewModelHighlightTimeRangeController

- (PXDisplayAssetViewModelHighlightTimeRangeController)initWithViewModel:(id)a3
{
  id v3 = a3;
  sub_1AA038730();
}

- (PXDisplayAssetViewModelHighlightTimeRangeController)init
{
  result = (PXDisplayAssetViewModelHighlightTimeRangeController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___PXDisplayAssetViewModelHighlightTimeRangeController_analysisProgress));
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PXDisplayAssetViewModelHighlightTimeRangeController_analyzer);
}

@end