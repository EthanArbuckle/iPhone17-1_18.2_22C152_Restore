@interface UISDisplaySingleRectShape
@end

@implementation UISDisplaySingleRectShape

void __67__UISDisplaySingleRectShape_SpringBoard__sb_thisDeviceDisplayShape__block_invoke(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(*(id *)(a1 + 32), "sb_displayShapeForScreenType:", SBHScreenTypeForCurrentDevice());
  v2 = (void *)sb_thisDeviceDisplayShape_sThisDeviceScreenType;
  sb_thisDeviceDisplayShape_sThisDeviceScreenType = v1;
}

@end