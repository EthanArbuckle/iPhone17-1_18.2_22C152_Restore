@interface WFToggleSettingContextualAction
+ (BOOL)supportsSecureCoding;
+ (id)spotlightDomainIdentifierForBundleIdentifier:(id)a3;
- (BOOL)availableFromLockedContext;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReversible;
- (WFToggleSettingContextualAction)initWithCoder:(id)a3;
- (WFToggleSettingContextualAction)initWithSetting:(unint64_t)a3 operation:(unint64_t)a4;
- (WFToggleSettingContextualAction)initWithSetting:(unint64_t)a3 operation:(unint64_t)a4 unconfigured:(BOOL)a5;
- (id)associatedSettingsPreference;
- (id)settingBiomeStreamIdentifier;
- (id)uniqueIdentifier;
- (unint64_t)hash;
- (unint64_t)operation;
- (unint64_t)setting;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFToggleSettingContextualAction

- (unint64_t)operation
{
  return self->_operation;
}

- (unint64_t)setting
{
  return self->_setting;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)WFToggleSettingContextualAction;
  id v4 = a3;
  [(WFContextualAction *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeInteger:forKey:", self->_setting, @"setting", v5.receiver, v5.super_class);
  [v4 encodeInteger:self->_operation forKey:@"operation"];
}

- (WFToggleSettingContextualAction)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFToggleSettingContextualAction;
  objc_super v5 = [(WFContextualAction *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeIntegerForKey:@"setting"];
    uint64_t v7 = [v4 decodeIntegerForKey:@"operation"];
    v5->_setting = v6;
    v5->_operation = v7;
    v8 = v5;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFToggleSettingContextualAction;
  if ([(WFContextualAction *)&v10 isEqual:v4])
  {
    id v5 = v4;
    if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v6 = [v5 setting];
      if (v6 == [(WFToggleSettingContextualAction *)self setting])
      {
        uint64_t v7 = [v5 operation];
        BOOL v8 = v7 == [(WFToggleSettingContextualAction *)self operation];
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {

      id v5 = 0;
    }
    BOOL v8 = 0;
    goto LABEL_9;
  }
  BOOL v8 = 0;
LABEL_10:

  return v8;
}

- (unint64_t)hash
{
  v3 = objc_opt_new();
  v9.receiver = self;
  v9.super_class = (Class)WFToggleSettingContextualAction;
  id v4 = (id)objc_msgSend(v3, "combineInteger:", -[WFContextualAction hash](&v9, sel_hash));
  id v5 = (id)objc_msgSend(v3, "combineInteger:", -[WFToggleSettingContextualAction setting](self, "setting"));
  id v6 = (id)objc_msgSend(v3, "combineInteger:", -[WFToggleSettingContextualAction operation](self, "operation"));
  unint64_t v7 = [v3 finalize];

  return v7;
}

- (BOOL)availableFromLockedContext
{
  return 1;
}

- (id)associatedSettingsPreference
{
  unint64_t v2 = [(WFToggleSettingContextualAction *)self setting];
  if (v2 > 8) {
    return 0;
  }
  else {
    return off_1E60775E8[v2];
  }
}

- (BOOL)isReversible
{
  unint64_t v2 = [(WFToggleSettingContextualAction *)self setting];
  return (v2 < 0xA) & (0x20Eu >> v2);
}

- (id)uniqueIdentifier
{
  v9[2] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(WFToggleSettingContextualAction *)self operation];
  if (v3 > 2) {
    id v4 = @"unknown_operation";
  }
  else {
    id v4 = off_1E60775D0[v3];
  }
  id v5 = [(WFContextualAction *)self identifier];
  v9[0] = v5;
  v9[1] = v4;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];

  unint64_t v7 = [v6 componentsJoinedByString:@"."];

  return v7;
}

- (id)settingBiomeStreamIdentifier
{
  if ([(WFToggleSettingContextualAction *)self operation] == 2)
  {
    switch([(WFToggleSettingContextualAction *)self setting])
    {
      case 0uLL:
        id v4 = WFBiomeLibrary();
        id v5 = [v4 Device];
        id v6 = [v5 Wireless];
        unint64_t v7 = [v6 AirplaneMode];
        goto LABEL_13;
      case 1uLL:
        id v4 = WFBiomeLibrary();
        id v5 = [v4 Device];
        id v6 = [v5 Power];
        unint64_t v7 = [v6 EnergyMode];
        goto LABEL_13;
      case 2uLL:
        id v4 = WFBiomeLibrary();
        id v5 = [v4 Device];
        id v6 = [v5 Display];
        unint64_t v7 = [v6 Appearance];
        goto LABEL_13;
      case 3uLL:
        id v4 = WFBiomeLibrary();
        id v5 = [v4 Device];
        id v6 = [v5 Display];
        unint64_t v7 = [v6 AlwaysOn];
        goto LABEL_13;
      case 4uLL:
        id v4 = WFBiomeLibrary();
        id v5 = [v4 Device];
        id v6 = [v5 Wireless];
        unint64_t v7 = [v6 WiFiAvailabilityStatus];
        goto LABEL_13;
      case 5uLL:
        id v4 = WFBiomeLibrary();
        id v5 = [v4 Device];
        id v6 = [v5 Wireless];
        unint64_t v7 = [v6 BluetoothPowerEnabled];
        goto LABEL_13;
      case 6uLL:
        id v4 = WFBiomeLibrary();
        id v5 = [v4 Device];
        id v6 = [v5 Wireless];
        unint64_t v7 = [v6 CellularDataEnabled];
        goto LABEL_13;
      case 7uLL:
        id v4 = WFBiomeLibrary();
        id v5 = [v4 Device];
        id v6 = [v5 Display];
        unint64_t v7 = [v6 TrueTone];
        goto LABEL_13;
      case 8uLL:
        id v4 = WFBiomeLibrary();
        id v5 = [v4 Device];
        id v6 = [v5 Display];
        unint64_t v7 = [v6 NightShift];
LABEL_13:
        BOOL v8 = v7;
        unint64_t v2 = [v7 identifier];

        goto LABEL_14;
      case 9uLL:
        id v4 = WFBiomeLibrary();
        id v5 = [v4 Device];
        id v6 = [v5 SilentMode];
        unint64_t v2 = [v6 identifier];
LABEL_14:

        break;
      default:
        break;
    }
  }
  else
  {
    unint64_t v2 = 0;
  }
  return v2;
}

- (WFToggleSettingContextualAction)initWithSetting:(unint64_t)a3 operation:(unint64_t)a4 unconfigured:(BOOL)a5
{
  BOOL v5 = a5;
  v55[2] = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 0uLL:
      BOOL v8 = WFLocalizedString(@"Airplane Mode");
      objc_super v9 = @"OnValue";
      objc_super v10 = @"airplane_mode";
      v11 = @"is.workflow.actions.airplanemode.set";
      v12 = @"airplane";
      goto LABEL_16;
    case 1uLL:
      BOOL v8 = WFLocalizedString(@"Low Power Mode");
      objc_super v9 = @"OnValue";
      objc_super v10 = @"low_power_mode";
      v11 = @"is.workflow.actions.lowpowermode.set";
      v12 = @"battery.25";
      goto LABEL_16;
    case 2uLL:
      BOOL v8 = WFLocalizedStringWithKey(@"Contextual Action Title: Dark Mode", @"Dark Mode");
      objc_super v9 = @"OnValue";
      objc_super v10 = @"dark_mode";
      v11 = @"is.workflow.actions.appearance";
      v12 = @"appearance";
      goto LABEL_16;
    case 3uLL:
      BOOL v8 = WFLocalizedString(@"Always On Display");
      objc_super v9 = @"OnValue";
      objc_super v10 = @"always_on_display";
      v11 = @"is.workflow.actions.display.always-on.set";
      v12 = @"iphone.always.on.display";
      goto LABEL_16;
    case 4uLL:
      BOOL v14 = a5;
      v15 = +[WFDevice currentDevice];
      int v16 = [v15 hasCapability:@"WAPI"];

      if (v16)
      {
        v17 = @"Contextual Action Title: WLAN";
        v18 = @"WLAN";
      }
      else
      {
        v17 = @"Contextual Action Title: Wi-Fi";
        v18 = @"Wi-Fi";
      }
      BOOL v8 = WFLocalizedStringWithKey(v17, v18);
      objc_super v9 = @"OnValue";
      v12 = @"wifi";
      objc_super v10 = @"wifi";
      BOOL v5 = v14;
      v11 = @"is.workflow.actions.wifi.set";
      goto LABEL_16;
    case 5uLL:
      BOOL v8 = WFLocalizedStringWithKey(@"Contextual Action Title: Bluetooth", @"Bluetooth");
      objc_super v9 = @"OnValue";
      v11 = @"is.workflow.actions.bluetooth.set";
      v12 = @"bluetooth";
      objc_super v10 = @"bluetooth";
      goto LABEL_16;
    case 6uLL:
      BOOL v8 = WFLocalizedStringWithKey(@"Contextual Action Title: Cellular Data", @"Cellular Data");
      objc_super v9 = @"OnValue";
      objc_super v10 = @"cellular_data";
      v11 = @"is.workflow.actions.cellulardata.set";
      v12 = @"antenna.radiowaves.left.and.right";
      goto LABEL_16;
    case 7uLL:
      BOOL v8 = WFLocalizedStringWithKey(@"Contextual Action Title: True Tone", @"True Tone");
      objc_super v9 = @"OnValue";
      objc_super v10 = @"true_tone";
      v11 = @"is.workflow.actions.truetone.set";
      v12 = @"truetone";
      goto LABEL_16;
    case 8uLL:
      BOOL v8 = WFLocalizedStringWithKey(@"Contextual Action Title: Night Shift", @"Night Shift");
      objc_super v9 = @"OnValue";
      objc_super v10 = @"night_shift";
      v11 = @"is.workflow.actions.nightshift.set";
      v12 = @"nightshift";
      goto LABEL_16;
    case 9uLL:
      BOOL v8 = WFLocalizedStringWithKey(@"Contextual Action Title: Silent Mode", @"Silent Mode");
      v11 = @"com.apple.ShortcutsActions.SetSilentModeAction";
      v19 = @"com.apple.ShortcutsActions.SetSilentModeAction";
      objc_super v9 = @"state";
      objc_super v10 = @"silent_mode";
      v12 = @"bell.slash.fill";
LABEL_16:
      v13 = +[WFContextualActionIcon iconWithSystemName:v12];
      break;
    default:
      v11 = 0;
      objc_super v10 = 0;
      BOOL v8 = 0;
      v13 = 0;
      objc_super v9 = @"OnValue";
      break;
  }
  switch(a4)
  {
    case 2uLL:
      v46 = v11;
      v47 = v10;
      BOOL v20 = v5;
      v29 = NSString;
      v30 = WFLocalizedStringWithKey(@"Toggle (System Setting)", @"%@");
      objc_msgSend(v29, "stringWithFormat:", v30, v8);
      id v23 = (id)objc_claimAutoreleasedReturnValue();

      WFLocalizedStringWithKey(@"Toggle (System Setting, Subtitle)", @"Toggle");
      v24 = (WFContextualActionParameter *)objc_claimAutoreleasedReturnValue();
      v31 = [[WFContextualActionParameter alloc] initWithType:@"WFNumberContentItem" displayString:0 wfParameterKey:v9 wfSerializedRepresentation:&unk_1F0CAE088];
      v51[0] = v31;
      v32 = [[WFContextualActionParameter alloc] initWithType:@"WFStringContentItem" displayString:0 wfParameterKey:@"operation" wfSerializedRepresentation:@"toggle"];
      v51[1] = v32;
      v33 = v51;
LABEL_29:
      v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];

      BOOL v5 = v20;
      v11 = v46;
      objc_super v10 = v47;
      goto LABEL_30;
    case 1uLL:
      v46 = v11;
      v47 = v10;
      BOOL v20 = v5;
      v34 = NSString;
      v35 = WFLocalizedStringWithKey(@"Turn Off (System Setting)", @"Turn Off %@");
      objc_msgSend(v34, "stringWithFormat:", v35, v8);
      id v23 = (id)objc_claimAutoreleasedReturnValue();

      WFLocalizedStringWithKey(@"Turn Off (System Setting, Subtitle)", @"Turn Off");
      v24 = (WFContextualActionParameter *)objc_claimAutoreleasedReturnValue();
      if (a3 == 2)
      {
        v36 = WFLocalizedString(@"Set to Light");

        id v23 = v36;
        v24 = [[WFContextualActionParameter alloc] initWithType:@"WFStringContentItem" displayString:0 wfParameterKey:@"operation" wfSerializedRepresentation:@"set"];
        v53[0] = v24;
        v26 = [[WFContextualActionParameter alloc] initWithType:@"WFStringContentItem" displayString:0 wfParameterKey:@"style" wfSerializedRepresentation:@"light"];
        v53[1] = v26;
        v27 = (void *)MEMORY[0x1E4F1C978];
        v28 = v53;
        goto LABEL_25;
      }
      v31 = [[WFContextualActionParameter alloc] initWithType:@"WFNumberContentItem" displayString:0 wfParameterKey:v9 wfSerializedRepresentation:&unk_1F0CAE0A0];
      v52[0] = v31;
      v32 = [[WFContextualActionParameter alloc] initWithType:@"WFStringContentItem" displayString:0 wfParameterKey:@"operation" wfSerializedRepresentation:@"set"];
      v52[1] = v32;
      v33 = v52;
      goto LABEL_29;
    case 0uLL:
      v46 = v11;
      v47 = v10;
      BOOL v20 = v5;
      v21 = NSString;
      v22 = WFLocalizedStringWithKey(@"Turn On (System Setting)", @"Turn On %@");
      objc_msgSend(v21, "stringWithFormat:", v22, v8);
      id v23 = (id)objc_claimAutoreleasedReturnValue();

      WFLocalizedStringWithKey(@"Turn On (System Setting, Subtitle)", @"Turn On");
      v24 = (WFContextualActionParameter *)objc_claimAutoreleasedReturnValue();
      if (a3 == 2)
      {
        v25 = WFLocalizedString(@"Set to Dark");

        id v23 = v25;
        v24 = [[WFContextualActionParameter alloc] initWithType:@"WFStringContentItem" displayString:0 wfParameterKey:@"operation" wfSerializedRepresentation:@"set"];
        v55[0] = v24;
        v26 = [[WFContextualActionParameter alloc] initWithType:@"WFStringContentItem" displayString:0 wfParameterKey:@"style" wfSerializedRepresentation:@"dark"];
        v55[1] = v26;
        v27 = (void *)MEMORY[0x1E4F1C978];
        v28 = v55;
LABEL_25:
        v37 = [v27 arrayWithObjects:v28 count:2];

        uint64_t v38 = (uint64_t)v23;
        v11 = v46;
        objc_super v10 = v47;
LABEL_33:

        v24 = (WFContextualActionParameter *)v38;
        goto LABEL_34;
      }
      v31 = [[WFContextualActionParameter alloc] initWithType:@"WFNumberContentItem" displayString:0 wfParameterKey:v9 wfSerializedRepresentation:&unk_1F0CAE088];
      v54[0] = v31;
      v32 = [[WFContextualActionParameter alloc] initWithType:@"WFStringContentItem" displayString:0 wfParameterKey:@"operation" wfSerializedRepresentation:@"set"];
      v54[1] = v32;
      v33 = v54;
      goto LABEL_29;
  }
  id v23 = 0;
  v24 = 0;
  v37 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_30:
  if (a3 == 3 && v5)
  {
    uint64_t v38 = WFLocalizedString(@"Turn On & Off");
    goto LABEL_33;
  }
LABEL_34:
  v50[0] = @"com.apple.shortcuts.toggle-setting";
  v50[1] = v10;
  v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
  v40 = [v39 componentsJoinedByString:@"."];

  v49.receiver = self;
  v49.super_class = (Class)WFToggleSettingContextualAction;
  BYTE2(v45) = 0;
  LOWORD(v45) = 0;
  v41 = -[WFContextualAction initWithIdentifier:wfActionIdentifier:associatedAppBundleIdentifier:parameters:displayFormatString:title:subtitleFormatString:icon:accessoryIcon:actionShowsUserInterface:actionHasResult:isReversible:](&v49, sel_initWithIdentifier_wfActionIdentifier_associatedAppBundleIdentifier_parameters_displayFormatString_title_subtitleFormatString_icon_accessoryIcon_actionShowsUserInterface_actionHasResult_isReversible_, v40, v11, @"com.apple.Preferences", v37, v23, v8, v24, v13, 0, v45);
  v42 = v41;
  if (v41)
  {
    v41->_setting = a3;
    v41->_operation = a4;
    v43 = v41;
  }

  return v42;
}

- (WFToggleSettingContextualAction)initWithSetting:(unint64_t)a3 operation:(unint64_t)a4
{
  return [(WFToggleSettingContextualAction *)self initWithSetting:a3 operation:a4 unconfigured:0];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)spotlightDomainIdentifierForBundleIdentifier:(id)a3
{
  return @"settings-toggles";
}

@end