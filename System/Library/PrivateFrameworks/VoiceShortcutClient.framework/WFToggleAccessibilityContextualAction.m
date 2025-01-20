@interface WFToggleAccessibilityContextualAction
+ (BOOL)supportsSecureCoding;
+ (id)spotlightDomainIdentifierForBundleIdentifier:(id)a3;
- (BOOL)availableFromLockedContext;
- (WFToggleAccessibilityContextualAction)initWithCoder:(id)a3;
- (WFToggleAccessibilityContextualAction)initWithSetting:(unint64_t)a3;
- (id)associatedSettingsPreference;
- (id)settingBiomeStreamIdentifier;
- (unint64_t)setting;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFToggleAccessibilityContextualAction

- (unint64_t)setting
{
  return self->_setting;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFToggleAccessibilityContextualAction;
  id v4 = a3;
  [(WFContextualAction *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_setting, @"setting", v5.receiver, v5.super_class);
}

- (WFToggleAccessibilityContextualAction)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeIntegerForKey:@"setting"];
  return [(WFToggleAccessibilityContextualAction *)self initWithSetting:v4];
}

- (BOOL)availableFromLockedContext
{
  return 1;
}

- (id)associatedSettingsPreference
{
  unint64_t v2 = [(WFToggleAccessibilityContextualAction *)self setting];
  if (v2 > 9) {
    return 0;
  }
  else {
    return off_1E6078128[v2];
  }
}

- (id)settingBiomeStreamIdentifier
{
  switch([(WFToggleAccessibilityContextualAction *)self setting])
  {
    case 0uLL:
      v3 = WFBiomeLibrary_8362();
      uint64_t v4 = [v3 Accessibility];
      objc_super v5 = [v4 ReduceMotion];
      goto LABEL_12;
    case 1uLL:
      v3 = WFBiomeLibrary_8362();
      uint64_t v4 = [v3 Accessibility];
      objc_super v5 = [v4 ReduceTransparency];
      goto LABEL_12;
    case 2uLL:
      v3 = WFBiomeLibrary_8362();
      uint64_t v4 = [v3 Accessibility];
      objc_super v5 = [v4 ColorFilters];
      goto LABEL_12;
    case 3uLL:
      v3 = WFBiomeLibrary_8362();
      uint64_t v4 = [v3 Accessibility];
      objc_super v5 = [v4 SmartInvert];
      goto LABEL_12;
    case 4uLL:
      v3 = WFBiomeLibrary_8362();
      uint64_t v4 = [v3 Accessibility];
      objc_super v5 = [v4 VoiceOver];
      goto LABEL_12;
    case 5uLL:
      v3 = WFBiomeLibrary_8362();
      uint64_t v4 = [v3 Accessibility];
      objc_super v5 = [v4 Zoom];
      goto LABEL_12;
    case 6uLL:
      v3 = WFBiomeLibrary_8362();
      uint64_t v4 = [v3 Accessibility];
      objc_super v5 = [v4 VoiceControl];
      goto LABEL_12;
    case 7uLL:
      v3 = WFBiomeLibrary_8362();
      uint64_t v4 = [v3 Accessibility];
      objc_super v5 = [v4 Contrast];
      goto LABEL_12;
    case 8uLL:
      v3 = WFBiomeLibrary_8362();
      uint64_t v4 = [v3 Accessibility];
      objc_super v5 = [v4 ClassicInvert];
      goto LABEL_12;
    case 9uLL:
      v3 = WFBiomeLibrary_8362();
      uint64_t v4 = [v3 Accessibility];
      objc_super v5 = [v4 WhitePoint];
LABEL_12:
      v6 = v5;
      unint64_t v2 = [v5 identifier];

      break;
    default:
      break;
  }
  return v2;
}

- (WFToggleAccessibilityContextualAction)initWithSetting:(unint64_t)a3
{
  v28[2] = *MEMORY[0x1E4F143B8];
  objc_super v5 = +[WFContextualActionIcon iconWithSystemName:@"accessibility"];
  v25 = self;
  switch(a3)
  {
    case 0uLL:
      v6 = WFLocalizedStringWithKey(@"Contextual Action Title: Reduce Motion", @"Reduce Motion");
      v24 = @"com.apple.AccessibilityUtilities.AXSettingsShortcuts.AXToggleReduceMotionIntent";
      v7 = @"reduce_motion";
      v8 = @"circle.dotted.and.circle";
      goto LABEL_13;
    case 1uLL:
      v6 = WFLocalizedStringWithKey(@"Contextual Action Title: Reduce Transparency", @"Reduce Transparency");
      v24 = @"com.apple.AccessibilityUtilities.AXSettingsShortcuts.AXToggleTransparencyIntent";
      v7 = @"reduce_transparency";
      v8 = @"square.on.square.intersection.dashed";
      goto LABEL_13;
    case 2uLL:
      v6 = WFLocalizedStringWithKey(@"Contextual Action Title: Color Filters", @"Color Filters");
      v24 = @"com.apple.AccessibilityUtilities.AXSettingsShortcuts.AXToggleColorFiltersIntent";
      v7 = @"color_filters";
      v8 = @"camera.filters";
      goto LABEL_13;
    case 3uLL:
      v6 = WFLocalizedStringWithKey(@"Contextual Action Title: Smart Invert", @"Smart Invert");
      v24 = @"com.apple.AccessibilityUtilities.AXSettingsShortcuts.AXToggleSmartInvertIntent";
      v7 = @"smart_invert";
      v8 = @"smart.invert";
      goto LABEL_13;
    case 4uLL:
      v6 = WFLocalizedStringWithKey(@"Contextual Action Title: VoiceOver", @"VoiceOver");
      v24 = @"com.apple.AccessibilityUtilities.AXSettingsShortcuts.AXToggleVoiceOverIntent";
      v7 = @"voice_over";
      v8 = @"voiceover";
      goto LABEL_13;
    case 5uLL:
      v6 = WFLocalizedStringWithKey(@"Contextual Action Title: Zoom", @"Zoom");
      v24 = @"com.apple.AccessibilityUtilities.AXSettingsShortcuts.AXToggleZoomIntent";
      v7 = @"zoom";
      v8 = @"arrowtriangles.up.right.down.left.magnifyingglass";
      goto LABEL_13;
    case 6uLL:
      v6 = WFLocalizedStringWithKey(@"Contextual Action Title: Voice Control", @"Voice Control");
      v24 = @"com.apple.AccessibilityUtilities.AXSettingsShortcuts.AXToggleVoiceControlIntent";
      v7 = @"voice_control";
      v8 = @"voice.control";
      goto LABEL_13;
    case 7uLL:
      v6 = WFLocalizedStringWithKey(@"Contextual Action Title: Increase Contrast", @"Increase Contrast");
      v24 = @"com.apple.AccessibilityUtilities.AXSettingsShortcuts.AXToggleContrastIntent";
      v7 = @"increase_contrast";
      v8 = @"circle.righthalf.filled";
      goto LABEL_13;
    case 8uLL:
      v6 = WFLocalizedStringWithKey(@"Contextual Action Title: Classic Invert", @"Classic Invert");
      v24 = @"com.apple.AccessibilityUtilities.AXSettingsShortcuts.AXToggleClassicInvertIntent";
      v7 = @"classic_invert";
      v8 = @"classic.invert";
      goto LABEL_13;
    case 9uLL:
      v6 = WFLocalizedStringWithKey(@"Contextual Action Title: Reduce White Point", @"Reduce White Point");
      v24 = @"com.apple.AccessibilityUtilities.AXSettingsShortcuts.AXToggleWhitePointIntent";
      v7 = @"white_point";
      v8 = @"sun.max.fill";
LABEL_13:
      uint64_t v9 = +[WFContextualActionIcon iconWithSystemName:v8];

      objc_super v5 = (void *)v9;
      break;
    default:
      v6 = 0;
      v7 = 0;
      v24 = 0;
      break;
  }
  v10 = NSString;
  v11 = WFLocalizedStringWithKey(@"Toggle (Accessibility Setting)", @"%@");
  v12 = objc_msgSend(v10, "stringWithFormat:", v11, v6);

  v13 = WFLocalizedStringWithKey(@"Toggle (System Setting, Subtitle)", @"Toggle");
  v28[0] = @"com.apple.shortcuts.toggle-acessibility";
  v28[1] = v7;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  v15 = [v14 componentsJoinedByString:@"."];

  v16 = [[WFContextualActionParameter alloc] initWithType:@"WFNumberContentItem" displayString:0 wfParameterKey:@"OnValue" wfSerializedRepresentation:&unk_1F0CB1A18];
  v27[0] = v16;
  v17 = [[WFContextualActionParameter alloc] initWithType:@"WFStringContentItem" displayString:0 wfParameterKey:@"operation" wfSerializedRepresentation:@"toggle"];
  v27[1] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];

  v26.receiver = v25;
  v26.super_class = (Class)WFToggleAccessibilityContextualAction;
  BYTE2(v23) = 0;
  LOWORD(v23) = 0;
  v19 = -[WFContextualAction initWithIdentifier:wfActionIdentifier:associatedAppBundleIdentifier:parameters:displayFormatString:title:subtitleFormatString:icon:accessoryIcon:actionShowsUserInterface:actionHasResult:isReversible:](&v26, sel_initWithIdentifier_wfActionIdentifier_associatedAppBundleIdentifier_parameters_displayFormatString_title_subtitleFormatString_icon_accessoryIcon_actionShowsUserInterface_actionHasResult_isReversible_, v15, v24, @"com.apple.Preferences", v18, v12, v6, v13, v5, 0, v23);
  v20 = v19;
  if (v19)
  {
    v19->_setting = a3;
    v21 = v19;
  }

  return v20;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)spotlightDomainIdentifierForBundleIdentifier:(id)a3
{
  return +[WFToggleSettingContextualAction spotlightDomainIdentifierForBundleIdentifier:a3];
}

@end