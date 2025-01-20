@interface UIColor(TSUDarkSidebar)
+ (uint64_t)tsu_darkInsertSwatchBackgroundColor;
+ (uint64_t)tsu_darkToolbarBackgroundColor;
+ (uint64_t)tsu_insertPaneBackgroundColor;
+ (uint64_t)tsu_keynoteCanvasBackgroundColor;
+ (uint64_t)tsu_keynoteCanvasDarkBackgroundColor;
+ (uint64_t)tsu_keynoteNavigatorBackgroundColor;
+ (uint64_t)tsu_keynoteNavigatorDividerColor;
+ (uint64_t)tsu_mediaBrowserNavigationBarTintColor;
+ (uint64_t)tsu_mediaBrowserNavigationBarTitleColor;
+ (uint64_t)tsu_mediaBrowserPrimaryContentColor;
+ (uint64_t)tsu_mediaBrowserSecondaryContentColor;
+ (uint64_t)tsu_navigatorSelectionFocusedHighlightColor;
+ (uint64_t)tsu_navigatorSelectionHighlightColor;
+ (uint64_t)tsu_progressViewTintColor;
+ (uint64_t)tsu_progressViewTrackTintColor;
+ (uint64_t)tsu_rowItemDividersColor;
+ (uint64_t)tsu_sidebarActiveTintColor;
+ (uint64_t)tsu_sidebarBackgroundColor;
+ (uint64_t)tsu_sidebarCellBackgroundColor;
+ (uint64_t)tsu_sidebarInactiveCellTintColor;
+ (uint64_t)tsu_sidebarInactiveTintColor;
+ (uint64_t)tsu_sidebarNavigationBarBackgroundColor;
+ (uint64_t)tsu_sidebarNavigationBarTintColor;
+ (uint64_t)tsu_sidebarNavigationBarTitleColor;
+ (uint64_t)tsu_sidebarPlaybackButtonTintColor;
+ (uint64_t)tsu_sidebarPressedStateColor;
+ (uint64_t)tsu_sidebarPrimaryContentColor;
+ (uint64_t)tsu_sidebarSecondaryContentColor;
+ (uint64_t)tsu_sidebarSegmentedCellTintColor;
+ (uint64_t)tsu_sidebarSegmentedControlTintColor;
+ (uint64_t)tsu_sidebarTableViewCellTintColor;
+ (uint64_t)tsu_sidebarTopTabTextColor;
+ (uint64_t)tsu_sliderMaximumTrackTintColor;
+ (uint64_t)tsu_sliderMinimumTrackTintColor;
+ (uint64_t)tsu_sliderThumbTintColor;
+ (uint64_t)tsu_switchOffOutlineColor;
+ (uint64_t)tsu_switchOnTintColor;
+ (uint64_t)tsu_switchTintColor;
@end

@implementation UIColor(TSUDarkSidebar)

+ (uint64_t)tsu_switchOnTintColor
{
  return [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.478431373 blue:1.0 alpha:1.0];
}

+ (uint64_t)tsu_switchTintColor
{
  return [MEMORY[0x263F1C550] colorWithRed:0.149019608 green:0.149019608 blue:0.149019608 alpha:1.0];
}

+ (uint64_t)tsu_switchOffOutlineColor
{
  return [MEMORY[0x263F1C550] colorWithRed:0.149019608 green:0.149019608 blue:0.149019608 alpha:1.0];
}

+ (uint64_t)tsu_sliderMinimumTrackTintColor
{
  return [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.478431373 blue:1.0 alpha:1.0];
}

+ (uint64_t)tsu_sliderMaximumTrackTintColor
{
  return [MEMORY[0x263F1C550] colorWithRed:0.149019608 green:0.149019608 blue:0.149019608 alpha:1.0];
}

+ (uint64_t)tsu_sliderThumbTintColor
{
  return [MEMORY[0x263F1C550] colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
}

+ (uint64_t)tsu_sidebarBackgroundColor
{
  return [MEMORY[0x263F1C550] colorWithRed:0.168627451 green:0.168627451 blue:0.168627451 alpha:1.0];
}

+ (uint64_t)tsu_sidebarNavigationBarTintColor
{
  return [MEMORY[0x263F1C550] colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
}

+ (uint64_t)tsu_sidebarNavigationBarBackgroundColor
{
  return [MEMORY[0x263F1C550] colorWithRed:0.168627451 green:0.168627451 blue:0.168627451 alpha:1.0];
}

+ (uint64_t)tsu_insertPaneBackgroundColor
{
  return [MEMORY[0x263F1C550] colorWithRed:0.168627451 green:0.168627451 blue:0.168627451 alpha:1.0];
}

+ (uint64_t)tsu_darkInsertSwatchBackgroundColor
{
  return [MEMORY[0x263F1C550] colorWithRed:0.6 green:0.6 blue:0.6 alpha:1.0];
}

+ (uint64_t)tsu_sidebarCellBackgroundColor
{
  return [MEMORY[0x263F1C550] colorWithRed:0.223529412 green:0.223529412 blue:0.22745098 alpha:1.0];
}

+ (uint64_t)tsu_rowItemDividersColor
{
  return [MEMORY[0x263F1C550] colorWithRed:0.141176471 green:0.141176471 blue:0.141176471 alpha:1.0];
}

+ (uint64_t)tsu_mediaBrowserNavigationBarTitleColor
{
  return [MEMORY[0x263F1C550] colorWithRed:0.670588235 green:0.670588235 blue:0.670588235 alpha:1.0];
}

+ (uint64_t)tsu_mediaBrowserNavigationBarTintColor
{
  return [MEMORY[0x263F1C550] colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
}

+ (uint64_t)tsu_mediaBrowserPrimaryContentColor
{
  return [MEMORY[0x263F1C550] colorWithRed:0.670588235 green:0.670588235 blue:0.670588235 alpha:1.0];
}

+ (uint64_t)tsu_mediaBrowserSecondaryContentColor
{
  return [MEMORY[0x263F1C550] colorWithRed:0.670588235 green:0.670588235 blue:0.670588235 alpha:1.0];
}

+ (uint64_t)tsu_sidebarNavigationBarTitleColor
{
  return [MEMORY[0x263F1C550] colorWithRed:0.949019608 green:0.949019608 blue:0.949019608 alpha:1.0];
}

+ (uint64_t)tsu_sidebarActiveTintColor
{
  return [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.478431373 blue:1.0 alpha:1.0];
}

+ (uint64_t)tsu_sidebarInactiveTintColor
{
  return [MEMORY[0x263F1C550] colorWithRed:0.949019608 green:0.949019608 blue:0.949019608 alpha:1.0];
}

+ (uint64_t)tsu_sidebarPlaybackButtonTintColor
{
  return [MEMORY[0x263F1C550] colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
}

+ (uint64_t)tsu_sidebarPrimaryContentColor
{
  return [MEMORY[0x263F1C550] colorWithRed:0.949019608 green:0.949019608 blue:0.949019608 alpha:1.0];
}

+ (uint64_t)tsu_sidebarSecondaryContentColor
{
  return [MEMORY[0x263F1C550] colorWithRed:0.670588235 green:0.670588235 blue:0.670588235 alpha:1.0];
}

+ (uint64_t)tsu_sidebarInactiveCellTintColor
{
  return [MEMORY[0x263F1C550] colorWithRed:0.498039216 green:0.498039216 blue:0.498039216 alpha:1.0];
}

+ (uint64_t)tsu_sidebarSegmentedControlTintColor
{
  return [MEMORY[0x263F1C550] colorWithRed:0.42745098 green:0.42745098 blue:0.431372549 alpha:1.0];
}

+ (uint64_t)tsu_sidebarSegmentedCellTintColor
{
  return [MEMORY[0x263F1C550] colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
}

+ (uint64_t)tsu_sidebarTableViewCellTintColor
{
  return [MEMORY[0x263F1C550] colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
}

+ (uint64_t)tsu_sidebarPressedStateColor
{
  return [MEMORY[0x263F1C550] colorWithRed:0.2 green:0.2 blue:0.203921569 alpha:1.0];
}

+ (uint64_t)tsu_sidebarTopTabTextColor
{
  return [MEMORY[0x263F1C550] colorWithRed:0.949019608 green:0.949019608 blue:0.949019608 alpha:1.0];
}

+ (uint64_t)tsu_progressViewTintColor
{
  return [MEMORY[0x263F1C550] colorWithRed:0.949019608 green:0.949019608 blue:0.949019608 alpha:1.0];
}

+ (uint64_t)tsu_progressViewTrackTintColor
{
  return [MEMORY[0x263F1C550] colorWithRed:0.168627451 green:0.168627451 blue:0.168627451 alpha:1.0];
}

+ (uint64_t)tsu_keynoteCanvasBackgroundColor
{
  return [MEMORY[0x263F1C550] colorWithRed:0.168627451 green:0.168627451 blue:0.168627451 alpha:1.0];
}

+ (uint64_t)tsu_keynoteCanvasDarkBackgroundColor
{
  return [MEMORY[0x263F1C550] colorWithRed:0.152941176 green:0.152941176 blue:0.152941176 alpha:1.0];
}

+ (uint64_t)tsu_keynoteNavigatorBackgroundColor
{
  return [MEMORY[0x263F1C550] colorWithRed:0.168627451 green:0.168627451 blue:0.168627451 alpha:1.0];
}

+ (uint64_t)tsu_keynoteNavigatorDividerColor
{
  return [MEMORY[0x263F1C550] colorWithRed:0.278431373 green:0.278431373 blue:0.28627451 alpha:1.0];
}

+ (uint64_t)tsu_navigatorSelectionHighlightColor
{
  return [MEMORY[0x263F1C550] colorWithRed:0.129411765 green:0.48627451 blue:0.956862745 alpha:1.0];
}

+ (uint64_t)tsu_navigatorSelectionFocusedHighlightColor
{
  return [MEMORY[0x263F1C550] colorWithRed:0.180392157 green:0.576470588 blue:1.0 alpha:1.0];
}

+ (uint64_t)tsu_darkToolbarBackgroundColor
{
  return [MEMORY[0x263F1C550] colorWithRed:0.168627451 green:0.168627451 blue:0.168627451 alpha:1.0];
}

@end