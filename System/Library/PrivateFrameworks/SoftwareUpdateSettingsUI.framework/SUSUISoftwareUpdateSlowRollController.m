@interface SUSUISoftwareUpdateSlowRollController
- (BOOL)hasAlternateUpdate;
- (BOOL)presentingStatefulDescriptorPromotedAsAlternate;
- (BOOL)shouldShowAlternateUpdateCellForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4;
- (BOOL)shouldShowAlternateUpdateGroupForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4;
- (BOOL)shouldShowAutomaticUpdatesSpecifierForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4;
- (BOOL)shouldShowBetaUpdatesCellSpecifierForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4;
- (BOOL)shouldShowNonPromotedCellForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4;
- (BOOL)shouldShowNonPromotedGroupForUIState:(unint64_t)a3 escriptorState:(unint64_t)a4;
- (BOOL)supportsPullToRefresh;
- (SUSUISoftwareUpdateSlowRollControllerDelegate)delegate;
- (id)analyticsDownloadAndInstallNowTappedString;
- (id)analyticsDownloadAndInstallTonightTappedString;
- (id)analyticsDownloadOnlyTappedString;
- (id)analyticsOpenStorageTappedString;
- (id)installLaterTappedString;
- (id)installNowTappedString;
- (id)learnMoreTappedString;
- (id)navigationController;
- (id)paneTitle;
- (id)presentingAlternateStatefulDescriptor;
- (id)presentingStatefulDescriptor;
- (unint64_t)currentUIState;
- (unint64_t)slowRollUpdateType;
- (void)setDelegate:(id)a3;
- (void)setSlowRollUpdateType:(unint64_t)a3;
- (void)statefulUIManager:(id)a3 descriptor:(id)a4 didTransitionFromDescriptorState:(unint64_t)a5 toState:(unint64_t)a6;
- (void)statefulUIManager:(id)a3 didFailToScanForUpdatesWithError:(id)a4;
- (void)statefulUIManager:(id)a3 didFinishScanningForUpdatesWithResults:(id)a4;
- (void)statefulUIManager:(id)a3 didStartDownloadForDescriptor:(id)a4 withDownload:(id)a5;
- (void)viewDidLoad;
@end

@implementation SUSUISoftwareUpdateSlowRollController

- (void)viewDidLoad
{
  v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)SUSUISoftwareUpdateSlowRollController;
  [(SUSUISoftwareUpdateController *)&v2 viewDidLoad];
  [(SUSUISoftwareUpdateController *)v4 refreshPane];
}

- (id)navigationController
{
  v13 = self;
  SEL v12 = a2;
  id v5 = (id)[(SUSUISoftwareUpdateSlowRollController *)self parentController];
  char v10 = 0;
  char isKindOfClass = 0;
  if (v5)
  {
    id v11 = (id)[(SUSUISoftwareUpdateSlowRollController *)v13 parentController];
    char v10 = 1;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  if (v10) {

  }
  if ((isKindOfClass & 1) == 0
    || ((id v4 = (id)-[SUSUISoftwareUpdateSlowRollController parentController](v13, "parentController"), location = (id)[v4 navigationController], v4, !location)? (v8 = 0): (v14 = location, v8 = 1), objc_storeStrong(&location, 0), !v8))
  {
    v7.receiver = v13;
    v7.super_class = (Class)SUSUISoftwareUpdateSlowRollController;
    id v14 = [(SUSUISoftwareUpdateSlowRollController *)&v7 navigationController];
  }
  objc_super v2 = v14;
  return v2;
}

- (id)paneTitle
{
  char v10 = 0;
  char v8 = 0;
  char v6 = 0;
  char v4 = 0;
  if (self->_slowRollUpdateType)
  {
    id v7 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    char v6 = 1;
    id v5 = (id)[v7 localizedStringForKey:@"SOFTWARE_UPDATE" value:&stru_26DCD7690 table:@"Software Update"];
    char v4 = 1;
    id v2 = v5;
  }
  else
  {
    id v11 = (id)[MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    char v10 = 1;
    id v9 = (id)[v11 localizedStringForKey:@"AVAILABLE_UPDATE" value:&stru_26DCD7690 table:@"Software Update"];
    char v8 = 1;
    id v2 = v9;
  }
  SEL v12 = v2;
  if (v4) {

  }
  if (v6) {
  if (v8)
  }

  if (v10) {
  return v12;
  }
}

- (id)presentingStatefulDescriptor
{
  char v10 = 0;
  char v8 = 0;
  char v6 = 0;
  char v4 = 0;
  if (self->_slowRollUpdateType)
  {
    id v7 = [(SUSUISoftwareUpdateController *)self manager];
    char v6 = 1;
    id v5 = [(SUSettingsStatefulUIManager *)v7 preferredStatefulDescriptor];
    char v4 = 1;
    id v2 = v5;
  }
  else
  {
    id v11 = [(SUSUISoftwareUpdateController *)self manager];
    char v10 = 1;
    id v9 = [(SUSettingsStatefulUIManager *)v11 alternateStatefulDescriptor];
    char v8 = 1;
    id v2 = v9;
  }
  SEL v12 = v2;
  if (v4) {

  }
  if (v6) {
  if (v8)
  }

  if (v10) {
  return v12;
  }
}

- (id)presentingAlternateStatefulDescriptor
{
  return 0;
}

- (BOOL)presentingStatefulDescriptorPromotedAsAlternate
{
  return 0;
}

- (BOOL)hasAlternateUpdate
{
  return 0;
}

- (BOOL)supportsPullToRefresh
{
  return 0;
}

- (void)statefulUIManager:(id)a3 didFinishScanningForUpdatesWithResults:(id)a4
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  v94 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v92 = 0;
  objc_storeStrong(&v92, a4);
  id v62 = (id)[v92 preferredDescriptor];
  char v90 = 0;
  BOOL v63 = 0;
  if (!v62)
  {
    id v91 = (id)[v92 alternateDescriptor];
    char v90 = 1;
    BOOL v63 = v91 == 0;
  }
  if (v90) {

  }
  if (v63)
  {
    os_log_t oslog = (os_log_t)_SUSUILoggingFacility();
    os_log_type_t type = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      log = oslog;
      os_log_type_t v47 = type;
      char v4 = (objc_class *)objc_opt_class();
      v60 = NSStringFromClass(v4);
      v42 = v60;
      v87 = v42;
      v43 = v94;
      v59 = SUSettingsUIStateToString([(SUSUISoftwareUpdateSlowRollController *)v94 currentUIState]);
      v44 = v59;
      v86 = v44;
      uint64_t v45 = [(SUSUISoftwareUpdateSlowRollController *)v94 currentUIState];
      id v58 = [(SUSUISoftwareUpdateSlowRollController *)v94 presentingStatefulDescriptor];
      id v57 = [(SUSUISoftwareUpdateSlowRollController *)v94 presentingStatefulDescriptor];
      id v56 = [(SUSUISoftwareUpdateSlowRollController *)v94 presentingAlternateStatefulDescriptor];
      id v55 = [(SUSUISoftwareUpdateSlowRollController *)v94 presentingAlternateStatefulDescriptor];
      v54 = [(SUSUISoftwareUpdateController *)v94 manager];
      v53 = [(SUSettingsStatefulUIManager *)v54 currentDownload];
      v52 = [(SUDownload *)v53 descriptor];
      id v51 = (id)[(SUDescriptor *)v52 humanReadableUpdateName];
      id v40 = v51;
      id v85 = v40;
      v50 = [(SUSUISoftwareUpdateController *)v94 manager];
      v49 = [(SUSettingsStatefulUIManager *)v50 currentDownload];
      v48 = [(SUSUISoftwareUpdateController *)v94 manager];
      BOOL v5 = [(SUSettingsStatefulUIManager *)v48 isTargetedUpdateScheduledForAutoInstall];
      char v6 = "YES";
      if (!v5) {
        char v6 = "NO";
      }
      uint64_t v41 = (uint64_t)v6;
      id v84 = (id)objc_opt_class();
      __os_log_helper_16_2_14_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_66_8_66((uint64_t)v96, (uint64_t)"-[SUSUISoftwareUpdateSlowRollController statefulUIManager:didFinishScanningForUpdatesWithResults:]", (uint64_t)v42, (uint64_t)v43, (uint64_t)v44, v45, (uint64_t)v58, (uint64_t)v57, (uint64_t)v56, (uint64_t)v55, (uint64_t)v40, (uint64_t)v49, v41, (uint64_t)v84, (uint64_t)v92);
      _os_log_impl(&dword_228401000, log, v47, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\nA new scan results points to no new updates. Popping out %{public}@.\nSUSettingsFullScanResults: %{public}@", v96, 0x8Eu);

      objc_storeStrong(&v84, 0);
      objc_storeStrong(&v85, 0);
      objc_storeStrong((id *)&v86, 0);
      objc_storeStrong((id *)&v87, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v39 = [(SUSUISoftwareUpdateSlowRollController *)v94 navigationController];
    id v7 = (id)[v39 popViewControllerAnimated:1];

    int v83 = 1;
  }
  else
  {
    char v82 = 0;
    BOOL v8 = v94->_slowRollUpdateType != 1;
    char v80 = 0;
    char v78 = 0;
    char v76 = 0;
    char v38 = 0;
    if (!v8)
    {
      char v38 = 0;
      if ([location[0] isPreferredUpdatePromotedAsAlternate])
      {
        id v81 = [(SUSUISoftwareUpdateSlowRollController *)v94 presentingStatefulDescriptor];
        char v80 = 1;
        id v79 = (id)[location[0] preferredStatefulDescriptor];
        char v78 = 1;
        id v77 = (id)[v79 descriptor];
        char v76 = 1;
        char v38 = objc_msgSend(v81, "isEqualToDescriptor:");
      }
    }
    if (v76) {

    }
    if (v78) {
    if (v80)
    }

    char v82 = v38 & 1;
    char v75 = 0;
    BOOL v9 = v94->_slowRollUpdateType != 0;
    char v73 = 0;
    char v71 = 0;
    char v69 = 0;
    char v37 = 0;
    if (!v9)
    {
      char v37 = 0;
      if (([location[0] isPreferredUpdatePromotedAsAlternate] & 1) == 0)
      {
        id v74 = [(SUSUISoftwareUpdateSlowRollController *)v94 presentingStatefulDescriptor];
        char v73 = 1;
        id v72 = (id)[location[0] alternateStatefulDescriptor];
        char v71 = 1;
        id v70 = (id)[v72 descriptor];
        char v69 = 1;
        char v37 = objc_msgSend(v74, "isEqualToDescriptor:");
      }
    }
    if (v69) {

    }
    if (v71) {
    if (v73)
    }

    char v75 = v37 & 1;
    os_log_t v68 = (os_log_t)_SUSUILoggingFacility();
    os_log_type_t v67 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
    {
      v22 = v68;
      os_log_type_t v23 = v67;
      char v10 = (objc_class *)objc_opt_class();
      v36 = NSStringFromClass(v10);
      v18 = v36;
      v66 = v18;
      v19 = v94;
      v35 = SUSettingsUIStateToString([(SUSUISoftwareUpdateSlowRollController *)v94 currentUIState]);
      v20 = v35;
      v65 = v20;
      uint64_t v21 = [(SUSUISoftwareUpdateSlowRollController *)v94 currentUIState];
      id v34 = [(SUSUISoftwareUpdateSlowRollController *)v94 presentingStatefulDescriptor];
      id v33 = [(SUSUISoftwareUpdateSlowRollController *)v94 presentingStatefulDescriptor];
      id v32 = [(SUSUISoftwareUpdateSlowRollController *)v94 presentingAlternateStatefulDescriptor];
      id v31 = [(SUSUISoftwareUpdateSlowRollController *)v94 presentingAlternateStatefulDescriptor];
      v30 = [(SUSUISoftwareUpdateController *)v94 manager];
      v29 = [(SUSettingsStatefulUIManager *)v30 currentDownload];
      v28 = [(SUDownload *)v29 descriptor];
      id v27 = (id)[(SUDescriptor *)v28 humanReadableUpdateName];
      id v17 = v27;
      id v64 = v17;
      v26 = [(SUSUISoftwareUpdateController *)v94 manager];
      v25 = [(SUSettingsStatefulUIManager *)v26 currentDownload];
      v24 = [(SUSUISoftwareUpdateController *)v94 manager];
      BOOL v11 = [(SUSettingsStatefulUIManager *)v24 isTargetedUpdateScheduledForAutoInstall];
      SEL v12 = "YES";
      if (v11) {
        v13 = "YES";
      }
      else {
        v13 = "NO";
      }
      if (v82) {
        id v14 = "YES";
      }
      else {
        id v14 = "NO";
      }
      if ((v75 & 1) == 0) {
        SEL v12 = "NO";
      }
      __os_log_helper_16_2_14_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34_8_32_8_32((uint64_t)v95, (uint64_t)"-[SUSUISoftwareUpdateSlowRollController statefulUIManager:didFinishScanningForUpdatesWithResults:]", (uint64_t)v18, (uint64_t)v19, (uint64_t)v20, v21, (uint64_t)v34, (uint64_t)v33, (uint64_t)v32, (uint64_t)v31, (uint64_t)v17, (uint64_t)v25, (uint64_t)v13, (uint64_t)v14, (uint64_t)v12);
      _os_log_impl(&dword_228401000, v22, v23, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\ndoesShowUpToDateNonPromotedUpdate? %s, doesShowUpToDateAlternateUpdate? %s", v95, 0x8Eu);

      objc_storeStrong(&v64, 0);
      objc_storeStrong((id *)&v65, 0);
      objc_storeStrong((id *)&v66, 0);
    }
    objc_storeStrong((id *)&v68, 0);
    if ((v82 & 1) == 0 && (v75 & 1) == 0)
    {
      id v16 = [(SUSUISoftwareUpdateSlowRollController *)v94 navigationController];
      id v15 = (id)[v16 popViewControllerAnimated:1];
    }
    int v83 = 0;
  }
  objc_storeStrong(&v92, 0);
  objc_storeStrong(location, 0);
}

- (void)statefulUIManager:(id)a3 didFailToScanForUpdatesWithError:(id)a4
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  char v37 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v35 = 0;
  objc_storeStrong(&v35, a4);
  id v34 = _SUSUILoggingFacility();
  os_log_type_t v33 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v34, OS_LOG_TYPE_DEFAULT))
  {
    log = v34;
    os_log_type_t type = v33;
    char v4 = (objc_class *)objc_opt_class();
    v28 = NSStringFromClass(v4);
    char v10 = v28;
    id v32 = v10;
    BOOL v11 = v37;
    id v27 = SUSettingsUIStateToString([(SUSUISoftwareUpdateSlowRollController *)v37 currentUIState]);
    SEL v12 = v27;
    id v31 = v12;
    uint64_t v13 = [(SUSUISoftwareUpdateSlowRollController *)v37 currentUIState];
    id v26 = [(SUSUISoftwareUpdateSlowRollController *)v37 presentingStatefulDescriptor];
    id v25 = [(SUSUISoftwareUpdateSlowRollController *)v37 presentingStatefulDescriptor];
    id v24 = [(SUSUISoftwareUpdateSlowRollController *)v37 presentingAlternateStatefulDescriptor];
    id v23 = [(SUSUISoftwareUpdateSlowRollController *)v37 presentingAlternateStatefulDescriptor];
    v22 = [(SUSUISoftwareUpdateController *)v37 manager];
    uint64_t v21 = [(SUSettingsStatefulUIManager *)v22 currentDownload];
    v20 = [(SUDownload *)v21 descriptor];
    id v19 = (id)[(SUDescriptor *)v20 humanReadableUpdateName];
    id v9 = v19;
    id v30 = v9;
    v18 = [(SUSUISoftwareUpdateController *)v37 manager];
    id v17 = [(SUSettingsStatefulUIManager *)v18 currentDownload];
    id v16 = [(SUSUISoftwareUpdateController *)v37 manager];
    BOOL v5 = [(SUSettingsStatefulUIManager *)v16 isTargetedUpdateScheduledForAutoInstall];
    char v6 = "YES";
    if (!v5) {
      char v6 = "NO";
    }
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v38, (uint64_t)"-[SUSUISoftwareUpdateSlowRollController statefulUIManager:didFailToScanForUpdatesWithError:]", (uint64_t)v10, (uint64_t)v11, (uint64_t)v12, v13, (uint64_t)v26, (uint64_t)v25, (uint64_t)v24, (uint64_t)v23, (uint64_t)v9, (uint64_t)v17, (uint64_t)v6);
    _os_log_impl(&dword_228401000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\n", v38, 0x7Au);

    objc_storeStrong(&v30, 0);
    objc_storeStrong((id *)&v31, 0);
    objc_storeStrong((id *)&v32, 0);
  }
  objc_storeStrong(&v34, 0);
  id v8 = [(SUSUISoftwareUpdateSlowRollController *)v37 navigationController];
  id v7 = (id)[v8 popViewControllerAnimated:1];

  objc_storeStrong(&v35, 0);
  objc_storeStrong(location, 0);
}

- (void)statefulUIManager:(id)a3 didStartDownloadForDescriptor:(id)a4 withDownload:(id)a5
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v40 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v38 = 0;
  objc_storeStrong(&v38, a4);
  id v37 = 0;
  objc_storeStrong(&v37, a5);
  id v36 = _SUSUILoggingFacility();
  os_log_type_t v35 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_DEFAULT))
  {
    log = v36;
    os_log_type_t type = v35;
    BOOL v5 = (objc_class *)objc_opt_class();
    v29 = NSStringFromClass(v5);
    BOOL v11 = v29;
    id v34 = v11;
    SEL v12 = v40;
    v28 = SUSettingsUIStateToString([(SUSUISoftwareUpdateSlowRollController *)v40 currentUIState]);
    uint64_t v13 = v28;
    os_log_type_t v33 = v13;
    uint64_t v14 = [(SUSUISoftwareUpdateSlowRollController *)v40 currentUIState];
    id v27 = [(SUSUISoftwareUpdateSlowRollController *)v40 presentingStatefulDescriptor];
    id v26 = [(SUSUISoftwareUpdateSlowRollController *)v40 presentingStatefulDescriptor];
    id v25 = [(SUSUISoftwareUpdateSlowRollController *)v40 presentingAlternateStatefulDescriptor];
    id v24 = [(SUSUISoftwareUpdateSlowRollController *)v40 presentingAlternateStatefulDescriptor];
    id v23 = [(SUSUISoftwareUpdateController *)v40 manager];
    v22 = [(SUSettingsStatefulUIManager *)v23 currentDownload];
    uint64_t v21 = [(SUDownload *)v22 descriptor];
    id v20 = (id)[(SUDescriptor *)v21 humanReadableUpdateName];
    id v10 = v20;
    id v32 = v10;
    id v19 = [(SUSUISoftwareUpdateController *)v40 manager];
    v18 = [(SUSettingsStatefulUIManager *)v19 currentDownload];
    id v17 = [(SUSUISoftwareUpdateController *)v40 manager];
    BOOL v6 = [(SUSettingsStatefulUIManager *)v17 isTargetedUpdateScheduledForAutoInstall];
    id v7 = "YES";
    if (!v6) {
      id v7 = "NO";
    }
    __os_log_helper_16_2_12_8_32_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_66_8_0_8_34((uint64_t)v41, (uint64_t)"-[SUSUISoftwareUpdateSlowRollController statefulUIManager:didStartDownloadForDescriptor:withDownload:]", (uint64_t)v11, (uint64_t)v12, (uint64_t)v13, v14, (uint64_t)v27, (uint64_t)v26, (uint64_t)v25, (uint64_t)v24, (uint64_t)v10, (uint64_t)v18, (uint64_t)v7);
    _os_log_impl(&dword_228401000, log, type, "%s: Controller Checkpoint\n\tCaller: %{public}@ (%p)\n\tmanager currentUIState: %{public}@ (%ld)\n\tpresentingStatefulDescriptor: %{public}@ (%p)\n\tpresentingAlternateStatefulDescriptor: %{public}@ (%p)\n\ttargetedUpdateDownload: %{public}@ (%p)\n\ttargetedUpdateScheduled: %{public}s\n\n", v41, 0x7Au);

    objc_storeStrong(&v32, 0);
    objc_storeStrong((id *)&v33, 0);
    objc_storeStrong((id *)&v34, 0);
  }
  objc_storeStrong(&v36, 0);
  id v9 = [(SUSUISoftwareUpdateSlowRollController *)v40 navigationController];
  id v8 = (id)[v9 popViewControllerAnimated:1];

  objc_storeStrong(&v37, 0);
  objc_storeStrong(&v38, 0);
  objc_storeStrong(location, 0);
}

- (void)statefulUIManager:(id)a3 descriptor:(id)a4 didTransitionFromDescriptorState:(unint64_t)a5 toState:(unint64_t)a6
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  unint64_t v12 = a5;
  unint64_t v11 = a6;
  if (a5 == 1 && v11 >= 2)
  {
    int v10 = 1;
  }
  else
  {
    v9.receiver = v15;
    v9.super_class = (Class)SUSUISoftwareUpdateSlowRollController;
    [(SUSUISoftwareUpdateController *)&v9 statefulUIManager:location[0] descriptor:v13 didTransitionFromDescriptorState:v12 toState:v11];
    int v10 = 0;
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (BOOL)shouldShowAutomaticUpdatesSpecifierForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  return 0;
}

- (BOOL)shouldShowBetaUpdatesCellSpecifierForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  return 0;
}

- (BOOL)shouldShowAlternateUpdateGroupForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  return 0;
}

- (BOOL)shouldShowAlternateUpdateCellForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  return 0;
}

- (BOOL)shouldShowNonPromotedGroupForUIState:(unint64_t)a3 escriptorState:(unint64_t)a4
{
  return 0;
}

- (BOOL)shouldShowNonPromotedCellForUIState:(unint64_t)a3 descriptorState:(unint64_t)a4
{
  return 0;
}

- (unint64_t)currentUIState
{
  return 4;
}

- (id)analyticsDownloadOnlyTappedString
{
  return (id)*MEMORY[0x263F78378];
}

- (id)analyticsDownloadAndInstallTonightTappedString
{
  return (id)*MEMORY[0x263F78370];
}

- (id)analyticsDownloadAndInstallNowTappedString
{
  return (id)*MEMORY[0x263F78368];
}

- (id)analyticsOpenStorageTappedString
{
  return (id)*MEMORY[0x263F78490];
}

- (id)learnMoreTappedString
{
  return (id)*MEMORY[0x263F78390];
}

- (id)installNowTappedString
{
  return (id)*MEMORY[0x263F78388];
}

- (id)installLaterTappedString
{
  return (id)*MEMORY[0x263F78380];
}

- (SUSUISoftwareUpdateSlowRollControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SUSUISoftwareUpdateSlowRollControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)slowRollUpdateType
{
  return self->_slowRollUpdateType;
}

- (void)setSlowRollUpdateType:(unint64_t)a3
{
  self->_slowRollUpdateType = a3;
}

- (void).cxx_destruct
{
}

@end