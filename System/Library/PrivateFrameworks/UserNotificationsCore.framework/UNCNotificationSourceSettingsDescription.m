@interface UNCNotificationSourceSettingsDescription
- (BOOL)alwaysShowPreviews;
- (BOOL)isEqual:(id)a3;
- (BOOL)modalAlertStyle;
- (BOOL)providesAppNotificationSettings;
- (BOOL)supportsAlerts;
- (BOOL)supportsBadges;
- (BOOL)supportsCarPlay;
- (BOOL)supportsCriticalAlerts;
- (BOOL)supportsLockScreen;
- (BOOL)supportsNotificationCenter;
- (BOOL)supportsSounds;
- (BOOL)supportsSpoken;
- (BOOL)supportsTimeSensitive;
- (id)description;
- (unint64_t)hash;
- (void)setAlwaysShowPreviews:(BOOL)a3;
- (void)setModalAlertStyle:(BOOL)a3;
- (void)setProvidesAppNotificationSettings:(BOOL)a3;
- (void)setSupportsAlerts:(BOOL)a3;
- (void)setSupportsBadges:(BOOL)a3;
- (void)setSupportsCarPlay:(BOOL)a3;
- (void)setSupportsCriticalAlerts:(BOOL)a3;
- (void)setSupportsLockScreen:(BOOL)a3;
- (void)setSupportsNotificationCenter:(BOOL)a3;
- (void)setSupportsSounds:(BOOL)a3;
- (void)setSupportsSpoken:(BOOL)a3;
- (void)setSupportsTimeSensitive:(BOOL)a3;
@end

@implementation UNCNotificationSourceSettingsDescription

- (void)setSupportsTimeSensitive:(BOOL)a3
{
  self->_supportsTimeSensitive = a3;
}

- (void)setSupportsSpoken:(BOOL)a3
{
  self->_supportsSpoken = a3;
}

- (void)setSupportsSounds:(BOOL)a3
{
  self->_supportsSounds = a3;
}

- (void)setSupportsNotificationCenter:(BOOL)a3
{
  self->_supportsNotificationCenter = a3;
}

- (void)setSupportsLockScreen:(BOOL)a3
{
  self->_supportsLockScreen = a3;
}

- (void)setSupportsCriticalAlerts:(BOOL)a3
{
  self->_supportsCriticalAlerts = a3;
}

- (void)setSupportsCarPlay:(BOOL)a3
{
  self->_supportsCarPlay = a3;
}

- (void)setSupportsBadges:(BOOL)a3
{
  self->_supportsBadges = a3;
}

- (void)setSupportsAlerts:(BOOL)a3
{
  self->_supportsAlerts = a3;
}

- (void)setProvidesAppNotificationSettings:(BOOL)a3
{
  self->_providesAppNotificationSettings = a3;
}

- (void)setModalAlertStyle:(BOOL)a3
{
  self->_modalAlertStyle = a3;
}

- (void)setAlwaysShowPreviews:(BOOL)a3
{
  self->_alwaysShowPreviews = a3;
}

- (BOOL)supportsSounds
{
  return self->_supportsSounds;
}

- (BOOL)supportsNotificationCenter
{
  return self->_supportsNotificationCenter;
}

- (BOOL)supportsLockScreen
{
  return self->_supportsLockScreen;
}

- (BOOL)supportsCarPlay
{
  return self->_supportsCarPlay;
}

- (BOOL)supportsBadges
{
  return self->_supportsBadges;
}

- (BOOL)supportsAlerts
{
  return self->_supportsAlerts;
}

- (BOOL)supportsTimeSensitive
{
  return self->_supportsTimeSensitive;
}

- (BOOL)modalAlertStyle
{
  return self->_modalAlertStyle;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F29C58] builderWithObject:v4 ofExpectedClass:objc_opt_class()];
  BOOL v6 = [(UNCNotificationSourceSettingsDescription *)self supportsSounds];
  v68[0] = MEMORY[0x263EF8330];
  v68[1] = 3221225472;
  v68[2] = __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke;
  v68[3] = &unk_2655681F0;
  id v7 = v4;
  id v69 = v7;
  id v8 = (id)[v5 appendBool:v6 counterpart:v68];
  BOOL v9 = [(UNCNotificationSourceSettingsDescription *)self supportsAlerts];
  v66[0] = MEMORY[0x263EF8330];
  v66[1] = 3221225472;
  v66[2] = __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke_2;
  v66[3] = &unk_2655681F0;
  id v10 = v7;
  id v67 = v10;
  id v11 = (id)[v5 appendBool:v9 counterpart:v66];
  BOOL v12 = [(UNCNotificationSourceSettingsDescription *)self supportsBadges];
  v64[0] = MEMORY[0x263EF8330];
  v64[1] = 3221225472;
  v64[2] = __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke_3;
  v64[3] = &unk_2655681F0;
  id v13 = v10;
  id v65 = v13;
  id v14 = (id)[v5 appendBool:v12 counterpart:v64];
  BOOL v15 = [(UNCNotificationSourceSettingsDescription *)self supportsLockScreen];
  v62[0] = MEMORY[0x263EF8330];
  v62[1] = 3221225472;
  v62[2] = __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke_4;
  v62[3] = &unk_2655681F0;
  id v16 = v13;
  id v63 = v16;
  id v17 = (id)[v5 appendBool:v15 counterpart:v62];
  BOOL v18 = [(UNCNotificationSourceSettingsDescription *)self supportsNotificationCenter];
  v60[0] = MEMORY[0x263EF8330];
  v60[1] = 3221225472;
  v60[2] = __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke_5;
  v60[3] = &unk_2655681F0;
  id v19 = v16;
  id v61 = v19;
  id v20 = (id)[v5 appendBool:v18 counterpart:v60];
  BOOL v21 = [(UNCNotificationSourceSettingsDescription *)self supportsCarPlay];
  v58[0] = MEMORY[0x263EF8330];
  v58[1] = 3221225472;
  v58[2] = __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke_6;
  v58[3] = &unk_2655681F0;
  id v22 = v19;
  id v59 = v22;
  id v23 = (id)[v5 appendBool:v21 counterpart:v58];
  BOOL v24 = [(UNCNotificationSourceSettingsDescription *)self supportsSpoken];
  v56[0] = MEMORY[0x263EF8330];
  v56[1] = 3221225472;
  v56[2] = __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke_7;
  v56[3] = &unk_2655681F0;
  id v25 = v22;
  id v57 = v25;
  id v26 = (id)[v5 appendBool:v24 counterpart:v56];
  BOOL v27 = [(UNCNotificationSourceSettingsDescription *)self modalAlertStyle];
  v54[0] = MEMORY[0x263EF8330];
  v54[1] = 3221225472;
  v54[2] = __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke_8;
  v54[3] = &unk_2655681F0;
  id v28 = v25;
  id v55 = v28;
  id v29 = (id)[v5 appendBool:v27 counterpart:v54];
  BOOL v30 = [(UNCNotificationSourceSettingsDescription *)self alwaysShowPreviews];
  v52[0] = MEMORY[0x263EF8330];
  v52[1] = 3221225472;
  v52[2] = __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke_9;
  v52[3] = &unk_2655681F0;
  id v31 = v28;
  id v53 = v31;
  id v32 = (id)[v5 appendBool:v30 counterpart:v52];
  BOOL v33 = [(UNCNotificationSourceSettingsDescription *)self providesAppNotificationSettings];
  v50[0] = MEMORY[0x263EF8330];
  v50[1] = 3221225472;
  v50[2] = __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke_10;
  v50[3] = &unk_2655681F0;
  id v34 = v31;
  id v51 = v34;
  id v35 = (id)[v5 appendBool:v33 counterpart:v50];
  BOOL v36 = [(UNCNotificationSourceSettingsDescription *)self supportsTimeSensitive];
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke_11;
  v48[3] = &unk_2655681F0;
  id v37 = v34;
  id v49 = v37;
  id v38 = (id)[v5 appendBool:v36 counterpart:v48];
  BOOL v39 = [(UNCNotificationSourceSettingsDescription *)self supportsCriticalAlerts];
  uint64_t v43 = MEMORY[0x263EF8330];
  uint64_t v44 = 3221225472;
  v45 = __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke_12;
  v46 = &unk_2655681F0;
  id v47 = v37;
  id v40 = v37;
  id v41 = (id)[v5 appendBool:v39 counterpart:&v43];
  LOBYTE(v37) = objc_msgSend(v5, "isEqual", v43, v44, v45, v46);

  return (char)v37;
}

uint64_t __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) supportsSounds];
}

uint64_t __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) supportsAlerts];
}

uint64_t __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) supportsBadges];
}

uint64_t __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) supportsLockScreen];
}

uint64_t __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) supportsNotificationCenter];
}

uint64_t __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) supportsCarPlay];
}

uint64_t __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) supportsSpoken];
}

uint64_t __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) modalAlertStyle];
}

uint64_t __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke_9(uint64_t a1)
{
  return [*(id *)(a1 + 32) alwaysShowPreviews];
}

uint64_t __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke_10(uint64_t a1)
{
  return [*(id *)(a1 + 32) providesAppNotificationSettings];
}

uint64_t __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke_11(uint64_t a1)
{
  return [*(id *)(a1 + 32) supportsTimeSensitive];
}

uint64_t __52__UNCNotificationSourceSettingsDescription_isEqual___block_invoke_12(uint64_t a1)
{
  return [*(id *)(a1 + 32) supportsCriticalAlerts];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x263F29C60] builder];
  id v4 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceSettingsDescription supportsSounds](self, "supportsSounds"));
  id v5 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceSettingsDescription supportsAlerts](self, "supportsAlerts"));
  id v6 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceSettingsDescription supportsBadges](self, "supportsBadges"));
  id v7 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceSettingsDescription supportsLockScreen](self, "supportsLockScreen"));
  id v8 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceSettingsDescription supportsNotificationCenter](self, "supportsNotificationCenter"));
  id v9 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceSettingsDescription supportsCarPlay](self, "supportsCarPlay"));
  id v10 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceSettingsDescription supportsSpoken](self, "supportsSpoken"));
  id v11 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceSettingsDescription modalAlertStyle](self, "modalAlertStyle"));
  id v12 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceSettingsDescription alwaysShowPreviews](self, "alwaysShowPreviews"));
  id v13 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceSettingsDescription providesAppNotificationSettings](self, "providesAppNotificationSettings"));
  id v14 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceSettingsDescription supportsTimeSensitive](self, "supportsTimeSensitive"));
  id v15 = (id)objc_msgSend(v3, "appendBool:", -[UNCNotificationSourceSettingsDescription supportsCriticalAlerts](self, "supportsCriticalAlerts"));
  unint64_t v16 = [v3 hash];

  return v16;
}

- (id)description
{
  v3 = [MEMORY[0x263F29C40] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceSettingsDescription supportsSounds](self, "supportsSounds"), @"supportsSounds");
  id v5 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceSettingsDescription supportsAlerts](self, "supportsAlerts"), @"supportsAlerts");
  id v6 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceSettingsDescription supportsBadges](self, "supportsBadges"), @"supportsBadges");
  id v7 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceSettingsDescription supportsLockScreen](self, "supportsLockScreen"), @"supportsLockScreen");
  id v8 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceSettingsDescription supportsNotificationCenter](self, "supportsNotificationCenter"), @"supportsNotificationCenter");
  id v9 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceSettingsDescription supportsCarPlay](self, "supportsCarPlay"), @"supportsCarPlay");
  id v10 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceSettingsDescription supportsSpoken](self, "supportsSpoken"), @"supportsSpoken");
  id v11 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceSettingsDescription modalAlertStyle](self, "modalAlertStyle"), @"modalAlertStyle");
  id v12 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceSettingsDescription alwaysShowPreviews](self, "alwaysShowPreviews"), @"alwaysShowPreviews");
  id v13 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceSettingsDescription providesAppNotificationSettings](self, "providesAppNotificationSettings"), @"providesAppNotificationSettings");
  id v14 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceSettingsDescription supportsTimeSensitive](self, "supportsTimeSensitive"), @"supportsTimeSensitive");
  id v15 = (id)objc_msgSend(v3, "appendBool:withName:", -[UNCNotificationSourceSettingsDescription supportsCriticalAlerts](self, "supportsCriticalAlerts"), @"supportsCriticalAlerts");
  unint64_t v16 = [v3 build];

  return v16;
}

- (BOOL)supportsSpoken
{
  return self->_supportsSpoken;
}

- (BOOL)alwaysShowPreviews
{
  return self->_alwaysShowPreviews;
}

- (BOOL)providesAppNotificationSettings
{
  return self->_providesAppNotificationSettings;
}

- (BOOL)supportsCriticalAlerts
{
  return self->_supportsCriticalAlerts;
}

@end