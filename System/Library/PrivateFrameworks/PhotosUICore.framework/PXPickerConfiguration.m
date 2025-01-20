@interface PXPickerConfiguration
- (PXPickerConfiguration)init;
@end

@implementation PXPickerConfiguration

- (PXPickerConfiguration)init
{
  return (PXPickerConfiguration *)PickerConfiguration.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  sub_1A9D6D380((uint64_t)self + OBJC_IVAR___PXPickerConfiguration_selectionDelegate);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PXPickerConfiguration_collectionList);
}

@end