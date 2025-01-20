@interface UIColor(PencilPairingUI)
+ (id)batteryBodyColor;
+ (id)batteryTextColorLowPower:()PencilPairingUI;
+ (id)fingerDrawingInkColor;
+ (id)platterContainerColor;
+ (id)platterStrokeColor;
+ (id)scratchpadBackgroundColor;
+ (id)toastLabelTextColor;
+ (id)tuckViewColorTransparencyEnabled:()PencilPairingUI;
+ (uint64_t)_pnp_betaLabelTextColor;
+ (uint64_t)_pnp_betaLabelTextEncapsulationColor;
+ (uint64_t)coloredButtonTitleColor;
+ (uint64_t)defaultBottomLabelColor;
+ (uint64_t)defaultButtonColor;
+ (uint64_t)defaultButtonPressedColor;
+ (uint64_t)dimmingViewColorWithAlpha:()PencilPairingUI;
+ (uint64_t)headlineColor;
+ (uint64_t)iconTintColor;
+ (uint64_t)platterShadowColor;
+ (uint64_t)scratchpadFrameColor;
+ (uint64_t)toolBackgroundColor;
@end

@implementation UIColor(PencilPairingUI)

+ (uint64_t)defaultBottomLabelColor
{
  return [MEMORY[0x263F1C550] systemGrayColor];
}

+ (uint64_t)defaultButtonColor
{
  return [MEMORY[0x263F1C550] systemBlueColor];
}

+ (uint64_t)defaultButtonPressedColor
{
  return [MEMORY[0x263F1C550] systemGrayColor];
}

+ (id)scratchpadBackgroundColor
{
  v0 = (void *)MEMORY[0x263F1C550];
  v1 = PencilPairingUIBundle();
  v2 = [v0 colorNamed:@"scratchpad_background_color" inBundle:v1 compatibleWithTraitCollection:0];

  return v2;
}

+ (uint64_t)toolBackgroundColor
{
  return [MEMORY[0x263F1C550] scratchpadBackgroundColor];
}

+ (id)toastLabelTextColor
{
  v0 = (void *)MEMORY[0x263F1C550];
  v1 = PencilPairingUIBundle();
  v2 = [v0 colorNamed:@"toast_label_color" inBundle:v1 compatibleWithTraitCollection:0];

  return v2;
}

+ (id)tuckViewColorTransparencyEnabled:()PencilPairingUI
{
  if (a3) {
    [MEMORY[0x263F1C550] systemWhiteColor];
  }
  else {
  v3 = [MEMORY[0x263F1C550] clearColor];
  }
  return v3;
}

+ (uint64_t)headlineColor
{
  return [MEMORY[0x263F1C550] labelColor];
}

+ (uint64_t)iconTintColor
{
  return [MEMORY[0x263F1C550] systemBlueColor];
}

+ (uint64_t)coloredButtonTitleColor
{
  return [MEMORY[0x263F1C550] systemWhiteColor];
}

+ (id)platterContainerColor
{
  v0 = (void *)MEMORY[0x263F1C550];
  v1 = PencilPairingUIBundle();
  v2 = [v0 colorNamed:@"platter_background_color" inBundle:v1 compatibleWithTraitCollection:0];

  return v2;
}

+ (id)platterStrokeColor
{
  v0 = (void *)MEMORY[0x263F1C550];
  v1 = PencilPairingUIBundle();
  v2 = [v0 colorNamed:@"platter_stroke_color" inBundle:v1 compatibleWithTraitCollection:0];

  return v2;
}

+ (uint64_t)dimmingViewColorWithAlpha:()PencilPairingUI
{
  return [MEMORY[0x263F1C550] colorWithRed:0.015625 green:0.015625 blue:0.05859375 alpha:a1];
}

+ (id)batteryTextColorLowPower:()PencilPairingUI
{
  if (a3) {
    [MEMORY[0x263F1C550] systemRedColor];
  }
  else {
  v3 = [MEMORY[0x263F1C550] systemGrayColor];
  }
  return v3;
}

+ (id)fingerDrawingInkColor
{
  v0 = [MEMORY[0x263F1C550] blackColor];
  v1 = [v0 colorWithAlphaComponent:0.1];

  return v1;
}

+ (uint64_t)scratchpadFrameColor
{
  return [MEMORY[0x263F1C550] platterContainerColor];
}

+ (uint64_t)platterShadowColor
{
  return [MEMORY[0x263F1C550] blackColor];
}

+ (id)batteryBodyColor
{
  v0 = [MEMORY[0x263F1C550] labelColor];
  v1 = [v0 colorWithAlphaComponent:0.4];

  return v1;
}

+ (uint64_t)_pnp_betaLabelTextColor
{
  return [MEMORY[0x263F1C550] colorWithDynamicProvider:&__block_literal_global_10];
}

+ (uint64_t)_pnp_betaLabelTextEncapsulationColor
{
  return [MEMORY[0x263F1C550] colorWithDynamicProvider:&__block_literal_global_12];
}

@end