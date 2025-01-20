@interface UIColor
+ (id)crl_insertPaneBackgroundColor;
+ (id)crl_mediaBrowserChickletDarkColor;
+ (id)crl_mediaBrowserChickletLightColor;
+ (id)crl_mediaBrowserChickletTitleDarkColor;
+ (id)crl_mediaBrowserChickletTitleLightColor;
+ (id)crl_mediaBrowserNavigationBarTintColor;
+ (id)crl_mediaBrowserNavigationBarTitleColor;
+ (id)crl_mediaBrowserPrimaryContentColor;
+ (id)crl_mediaBrowserSecondaryContentColor;
+ (id)crl_navigatorSelectionFocusedHighlightColor;
+ (id)crl_navigatorSelectionHighlightColor;
+ (id)crl_rowItemDividersColor;
+ (id)crl_sidebarActiveTintColor;
+ (id)crl_sidebarBackgroundColor;
+ (id)crl_sidebarCellBackgroundColor;
+ (id)crl_sidebarHighContrastBackgroundColor;
+ (id)crl_sidebarInactiveCellTintColor;
+ (id)crl_sidebarInactiveTintColor;
+ (id)crl_sidebarNavigationBarBackgroundColor;
+ (id)crl_sidebarNavigationBarTintColor;
+ (id)crl_sidebarNavigationBarTitleColor;
+ (id)crl_sidebarPlaybackButtonTintColor;
+ (id)crl_sidebarPopoverDimmingColor;
+ (id)crl_sidebarPressedStateColor;
+ (id)crl_sidebarPrimaryContentColor;
+ (id)crl_sidebarSecondaryContentColor;
+ (id)crl_sidebarSegmentedCellTintColor;
+ (id)crl_sidebarSegmentedControlTintColor;
+ (id)crl_sidebarTableViewCellTintColor;
+ (id)crl_sidebarTopTabTextColor;
+ (id)crl_sliderMaximumTrackTintColor;
+ (id)crl_sliderMinimumTrackTintColor;
+ (id)crl_sliderThumbTintColor;
+ (id)crl_styleUpdateButton6ptBlackColor;
+ (id)crl_styleUpdateButtonDarkColor;
+ (id)crl_styleUpdateButtonLightColor;
+ (id)crl_switchOffOutlineColor;
+ (id)crl_switchOnTintColor;
+ (id)crl_switchTintColor;
+ (id)crl_tableViewCellDarkBlueTextColor;
- (id)crl_withReducedAlpha:(double)a3;
@end

@implementation UIColor

+ (id)crl_tableViewCellDarkBlueTextColor
{
  v2 = (void *)qword_1016A95B0;
  if (!qword_1016A95B0)
  {
    uint64_t v3 = +[UIColor colorWithRed:0.219607843 green:0.329411765 blue:0.529411765 alpha:1.0];
    v4 = (void *)qword_1016A95B0;
    qword_1016A95B0 = v3;

    v2 = (void *)qword_1016A95B0;
  }

  return v2;
}

- (id)crl_withReducedAlpha:(double)a3
{
  [(UIColor *)self alphaComponent];
  double v6 = v5 * a3;

  return [(UIColor *)self colorWithAlphaComponent:v6];
}

+ (id)crl_switchOnTintColor
{
  return +[UIColor colorWithRed:0.0 green:0.478431373 blue:1.0 alpha:1.0];
}

+ (id)crl_switchTintColor
{
  return +[UIColor colorWithRed:0.125490196 green:0.125490196 blue:0.125490196 alpha:1.0];
}

+ (id)crl_switchOffOutlineColor
{
  return +[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
}

+ (id)crl_sliderMinimumTrackTintColor
{
  return +[UIColor colorWithRed:0.0 green:0.478431373 blue:1.0 alpha:1.0];
}

+ (id)crl_sliderMaximumTrackTintColor
{
  v2 = +[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
  uint64_t v3 = [v2 colorWithAlphaComponent:0.15];

  return v3;
}

+ (id)crl_sliderThumbTintColor
{
  return +[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
}

+ (id)crl_sidebarBackgroundColor
{
  return +[UIColor colorWithRed:0.168627451 green:0.168627451 blue:0.168627451 alpha:1.0];
}

+ (id)crl_sidebarHighContrastBackgroundColor
{
  return +[UIColor colorWithRed:0.584313725 green:0.584313725 blue:0.584313725 alpha:1.0];
}

+ (id)crl_styleUpdateButtonDarkColor
{
  return +[UIColor colorWithRed:0.368627451 green:0.368627451 blue:0.368627451 alpha:1.0];
}

+ (id)crl_styleUpdateButtonLightColor
{
  return +[UIColor colorWithRed:0.960784314 green:0.960784314 blue:0.960784314 alpha:1.0];
}

+ (id)crl_styleUpdateButton6ptBlackColor
{
  return +[UIColor colorWithWhite:0.0 alpha:0.06];
}

+ (id)crl_sidebarNavigationBarTintColor
{
  return +[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
}

+ (id)crl_sidebarNavigationBarBackgroundColor
{
  return +[UIColor colorWithRed:0.168627451 green:0.168627451 blue:0.168627451 alpha:1.0];
}

+ (id)crl_insertPaneBackgroundColor
{
  return +[UIColor colorWithRed:0.168627451 green:0.168627451 blue:0.168627451 alpha:1.0];
}

+ (id)crl_sidebarCellBackgroundColor
{
  return +[UIColor colorWithRed:0.223529412 green:0.223529412 blue:0.22745098 alpha:1.0];
}

+ (id)crl_rowItemDividersColor
{
  return +[UIColor colorWithRed:0.141176471 green:0.141176471 blue:0.141176471 alpha:1.0];
}

+ (id)crl_mediaBrowserNavigationBarTitleColor
{
  return +[UIColor colorWithRed:0.670588235 green:0.670588235 blue:0.670588235 alpha:1.0];
}

+ (id)crl_mediaBrowserNavigationBarTintColor
{
  return +[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
}

+ (id)crl_mediaBrowserPrimaryContentColor
{
  return +[UIColor colorWithRed:0.670588235 green:0.670588235 blue:0.670588235 alpha:1.0];
}

+ (id)crl_mediaBrowserSecondaryContentColor
{
  return +[UIColor colorWithRed:0.670588235 green:0.670588235 blue:0.670588235 alpha:1.0];
}

+ (id)crl_mediaBrowserChickletLightColor
{
  return +[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.06];
}

+ (id)crl_mediaBrowserChickletDarkColor
{
  return +[UIColor colorWithRed:0.298039216 green:0.298039216 blue:0.298039216 alpha:1.0];
}

+ (id)crl_mediaBrowserChickletTitleLightColor
{
  return +[UIColor colorWithRed:0.670588235 green:0.670588235 blue:0.670588235 alpha:1.0];
}

+ (id)crl_mediaBrowserChickletTitleDarkColor
{
  return +[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
}

+ (id)crl_sidebarNavigationBarTitleColor
{
  return +[UIColor colorWithRed:0.949019608 green:0.949019608 blue:0.949019608 alpha:1.0];
}

+ (id)crl_sidebarActiveTintColor
{
  return +[UIColor colorWithRed:0.0 green:0.478431373 blue:1.0 alpha:1.0];
}

+ (id)crl_sidebarInactiveTintColor
{
  return +[UIColor colorWithRed:0.949019608 green:0.949019608 blue:0.949019608 alpha:1.0];
}

+ (id)crl_sidebarPlaybackButtonTintColor
{
  return +[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
}

+ (id)crl_sidebarPrimaryContentColor
{
  if (UIAccessibilityDarkerSystemColorsEnabled()) {
    double v2 = 0.784313725;
  }
  else {
    double v2 = 0.647058824;
  }
  uint64_t v3 = +[UIColor colorWithRed:v2 green:v2 blue:v2 alpha:1.0];

  return v3;
}

+ (id)crl_sidebarSecondaryContentColor
{
  return +[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
}

+ (id)crl_sidebarInactiveCellTintColor
{
  double v2 = +[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
  uint64_t v3 = [v2 colorWithAlphaComponent:0.2];

  return v3;
}

+ (id)crl_sidebarSegmentedControlTintColor
{
  return +[UIColor colorWithRed:0.42745098 green:0.42745098 blue:0.431372549 alpha:1.0];
}

+ (id)crl_sidebarSegmentedCellTintColor
{
  return +[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
}

+ (id)crl_sidebarTableViewCellTintColor
{
  return +[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
}

+ (id)crl_sidebarPressedStateColor
{
  return +[UIColor colorWithRed:0.2 green:0.2 blue:0.203921569 alpha:1.0];
}

+ (id)crl_sidebarTopTabTextColor
{
  return +[UIColor colorWithRed:0.949019608 green:0.949019608 blue:0.949019608 alpha:1.0];
}

+ (id)crl_sidebarPopoverDimmingColor
{
  return +[UIColor colorNamed:@"CRLSidebarPopoverDimmingColor"];
}

+ (id)crl_navigatorSelectionHighlightColor
{
  return +[UIColor colorWithRed:0.129411765 green:0.48627451 blue:0.956862745 alpha:1.0];
}

+ (id)crl_navigatorSelectionFocusedHighlightColor
{
  return +[UIColor colorWithRed:0.180392157 green:0.576470588 blue:1.0 alpha:1.0];
}

@end