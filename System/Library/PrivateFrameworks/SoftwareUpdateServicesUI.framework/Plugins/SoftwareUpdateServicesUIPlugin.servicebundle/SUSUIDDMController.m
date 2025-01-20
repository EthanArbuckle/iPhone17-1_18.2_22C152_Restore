@interface SUSUIDDMController
+ (BOOL)_isDeclarationRelevant:(id)a3;
+ (id)sharedInstance;
+ (id)sharedInstance:(id)a3 withQueue:(id)a4;
+ (unint64_t)_alertStyleForWindow:(unint64_t)a3;
- (BOOL)_isUpdateRelevant:(id)a3;
- (BOOL)_presentAlert:(id)a3;
- (BOOL)_reallyShouldEnforceNow;
- (BOOL)pendingUnlockToShowAlert;
- (BOOL)shouldEnforceUpdate;
- (NSArray)scheduling;
- (SUSUIDDMController)initWithSUSUIController:(id)a3 withQueue:(id)a4;
- (id)_getScheduledAlertInfo;
- (id)_localizedRelativeEnforcedDateRelativeTo:(id)a3;
- (id)_schedulingUnitWithIntervalFromEnforcedDate:(double)a3;
- (id)alertBodyLocallizedStrWithUpdateName:(id)a3;
- (id)descriptor;
- (id)enforcedInstallDate;
- (id)schduledAlertDate;
- (id)stringFromRightsOwner:(unint64_t)a3;
- (int64_t)schedulingIndex;
- (unint64_t)_alertStyleForCurrentWindow;
- (unint64_t)currentReminderWindow;
- (unint64_t)decideAlertConflictWithAlertFlow:(unint64_t)a3;
- (unint64_t)scheduledAlertStyle;
- (void)_disarm;
- (void)_doInstall:(id)a3;
- (void)_installNow;
- (void)_makeScheduling;
- (void)_scheduleNextDDMAlert;
- (void)_setPasscodePolicyToRequiredIfNeeded;
- (void)_showDDMAlert:(id)a3;
- (void)_showDDMAlertNowOrInstallIfNecessary:(BOOL)a3;
- (void)installDidFail:(id)a3;
- (void)installDidFinish:(id)a3;
- (void)installDidStart:(id)a3;
- (void)installNow;
- (void)notifyAlertWasPresented;
- (void)setDeclaration:(id)a3;
- (void)setScheduling:(id)a3;
- (void)setSchedulingIndex:(int64_t)a3;
- (void)showDDMAlert:(int64_t)a3 install:(BOOL)a4;
- (void)showNextDDMAlert:(BOOL)a3;
@end

@implementation SUSUIDDMController

+ (id)sharedInstance
{
  return objc_msgSend((id)objc_opt_class(), "sharedInstance:withQueue:", 0);
}

+ (id)sharedInstance:(id)a3 withQueue:(id)a4
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  if (!qword_703D0)
  {
    v4 = [SUSUIDDMController alloc];
    v5 = [(SUSUIDDMController *)v4 initWithSUSUIController:location[0] withQueue:v10];
    v6 = (void *)qword_703D0;
    qword_703D0 = (uint64_t)v5;
  }
  id v8 = (id)qword_703D0;
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);

  return v8;
}

- (SUSUIDDMController)initWithSUSUIController:(id)a3 withQueue:(id)a4
{
  id v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v18 = 0;
  objc_storeStrong(&v18, a4);
  if (location[0])
  {
    if (v18)
    {
      id v4 = v20;
      id v20 = 0;
      v11.receiver = v4;
      v11.super_class = (Class)SUSUIDDMController;
      v6 = [(SUSUIDDMController *)&v11 init];
      id v20 = v6;
      objc_storeStrong(&v20, v6);
      if (v6)
      {
        objc_storeStrong((id *)v20 + 1, 0);
        objc_storeStrong((id *)v20 + 3, 0);
        objc_storeStrong((id *)v20 + 4, v18);
        objc_storeStrong((id *)v20 + 2, location[0]);
        id v10 = +[NSDate dateWithTimeIntervalSince1970:0.0];
        objc_storeStrong((id *)v20 + 6, 0);
        objc_storeStrong((id *)v20 + 5, 0);
        objc_storeStrong((id *)v20 + 7, v10);
        *((unsigned char *)v20 + 88) = 0;
        objc_storeStrong(&v10, 0);
      }
      v21 = (SUSUIDDMController *)v20;
      int v14 = 1;
    }
    else
    {
      id v13 = (id)SUSUILog();
      os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
      {
        sub_1A68C((uint64_t)v22, (uint64_t)"-[SUSUIDDMController initWithSUSUIController:withQueue:]");
        _os_log_impl(&def_46F0, (os_log_t)v13, v12, "%s: [DDM] First init of SUSUIDDMController missing queue", v22, 0xCu);
      }
      objc_storeStrong(&v13, 0);
      v21 = 0;
      int v14 = 1;
    }
  }
  else
  {
    id v17 = (id)SUSUILog();
    os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
    {
      log = v17;
      os_log_type_t type = v16;
      id v15 = (id)objc_opt_class();
      sub_1A638((uint64_t)v23, (uint64_t)"-[SUSUIDDMController initWithSUSUIController:withQueue:]", (uint64_t)v15);
      _os_log_impl(&def_46F0, log, type, "%s: [DDM] First init of SUSUIDDMController missing %@ delegate", v23, 0x16u);
      objc_storeStrong(&v15, 0);
    }
    objc_storeStrong(&v17, 0);
    v21 = 0;
    int v14 = 1;
  }
  objc_storeStrong(&v18, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v20, 0);
  return v21;
}

- (void)setDeclaration:(id)a3
{
  os_log_type_t v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = v12->_controllerClientQueue;
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  v7 = sub_1A7D0;
  id v8 = &unk_5CFB0;
  id v9 = location[0];
  id v10 = v12;
  dispatch_async(queue, &v4);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

+ (BOOL)_isDeclarationRelevant:(id)a3
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v5 = 0;
  BOOL v4 = 0;
  if (location[0])
  {
    id v6 = [location[0] enforcedInstallDate];
    char v5 = 1;
    BOOL v4 = v6 != 0;
  }
  if (v5) {

  }
  BOOL v8 = v4;
  objc_storeStrong(location, 0);
  return v8;
}

- (id)_localizedRelativeEnforcedDateRelativeTo:(id)a3
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = (id)objc_opt_new();
  objc_msgSend(v8, "setDateTimeStyle:");
  [v8 setFormattingContext:1];
  id v4 = v8;
  id v5 = [(SUSUIDDMController *)v10 enforcedInstallDate];
  id v7 = objc_msgSend(v4, "localizedStringForDate:relativeToDate:");

  id v6 = v7;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);

  return v6;
}

- (id)_schedulingUnitWithIntervalFromEnforcedDate:(double)a3
{
  v21 = self;
  SEL v20 = a2;
  double v19 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_controllerClientQueue);
  id v3 = [(SUCoreDDMDeclaration *)v21->_declaration enforcedInstallDate];
  BOOL v15 = v3 != 0;

  if (v15)
  {
    id v18 = @"%@";
    id v17 = objc_alloc_init(_DDMAlertSchedulingUnit);
    id v14 = [(SUCoreDDMDeclaration *)v21->_declaration enforcedInstallDate];
    id v13 = [v14 dateByAddingTimeInterval:v19];
    -[_DDMAlertSchedulingUnit setDate:](v17, "setDate:");

    [(_DDMAlertSchedulingUnit *)v17 setWindow:0];
    if (v19 == 0.0)
    {
      id v12 = sub_1F310();
      id v11 = [v12 localizedStringForKey:@"SOFTWARE_UPDATE_INSTALL_ALERT_ENFORCED_NOW" value:&stru_62DF0 table:@"ui_alerts"];
      -[_DDMAlertSchedulingUnit setAlertMsgFormat:](v17, "setAlertMsgFormat:");

      [(_DDMAlertSchedulingUnit *)v17 setWindow:1];
    }
    else
    {
      uint64_t v16 = (uint64_t)(-v19 / 3600.0);
      id v10 = sub_1F310();
      id v9 = [v10 localizedStringForKey:@"SOFTWARE_UPDATE_INSTALL_ALERT_ENFORCED_REMINDER" value:&stru_62DF0 table:@"ui_alerts"];
      id v8 = [(_DDMAlertSchedulingUnit *)v17 date];
      id v7 = -[SUSUIDDMController _localizedRelativeEnforcedDateRelativeTo:](v21, "_localizedRelativeEnforcedDateRelativeTo:");
      id v6 = +[NSString localizedStringWithValidatedFormat:v9, @"%@ %@", 0, v18, v7 validFormatSpecifiers error];
      -[_DDMAlertSchedulingUnit setAlertMsgFormat:](v17, "setAlertMsgFormat:");

      if (v16 < 24)
      {
        if (v16 >= 0) {
          [(_DDMAlertSchedulingUnit *)v17 setWindow:2];
        }
      }
      else
      {
        [(_DDMAlertSchedulingUnit *)v17 setWindow:3];
      }
    }
    v22 = v17;
    objc_storeStrong((id *)&v17, 0);
    objc_storeStrong(&v18, 0);
  }
  else
  {
    v22 = 0;
  }
  id v4 = v22;

  return v4;
}

- (void)_makeScheduling
{
  id v17 = self;
  v16[1] = (id)a2;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_controllerClientQueue);
  v16[0] = [(SUCoreDDMDeclaration *)v17->_declaration enforcedInstallDate];
  if (!v16[0]) {
    objc_storeStrong((id *)&v17->_scheduling, 0);
  }
  id v15 = objc_alloc_init((Class)NSMutableArray);
  for (uint64_t i = 23; i > 0; --i)
  {
    id v10 = [(SUSUIDDMController *)v17 _schedulingUnitWithIntervalFromEnforcedDate:(double)(-3600 * i)];
    objc_msgSend(v15, "addObject:");
  }
  id v6 = [(SUSUIDDMController *)v17 _schedulingUnitWithIntervalFromEnforcedDate:-1800.0];
  objc_msgSend(v15, "addObject:");

  id v7 = [(SUSUIDDMController *)v17 _schedulingUnitWithIntervalFromEnforcedDate:-600.0];
  objc_msgSend(v15, "addObject:");

  id v8 = [(SUSUIDDMController *)v17 _schedulingUnitWithIntervalFromEnforcedDate:-300.0];
  objc_msgSend(v15, "addObject:");

  id v9 = [(SUSUIDDMController *)v17 _schedulingUnitWithIntervalFromEnforcedDate:0.0];
  objc_msgSend(v15, "addObject:");

  objc_storeStrong((id *)&v17->_scheduling, v15);
  v17->_schedulingIndex = (int64_t)[v15 count];
  for (unint64_t j = 0; ; ++j)
  {
    unint64_t v5 = j;
    if (v5 >= (unint64_t)[v15 count]) {
      break;
    }
    id v4 = [v15 objectAtIndex:j];
    id location = [v4 date];

    [location timeIntervalSinceNow];
    if (v2 < 0.0)
    {
      int v11 = 0;
    }
    else
    {
      v17->_schedulingIndex = j;
      int v11 = 5;
    }
    objc_storeStrong(&location, 0);
    if (v11) {
      break;
    }
  }
  [v16[0] timeIntervalSinceNow];
  if ((uint64_t)v3 / 86400 >= 1) {
    v17->_schedulingIndex = (uint64_t)v3 / -86400;
  }
  objc_storeStrong(&v15, 0);
  objc_storeStrong(v16, 0);
}

- (unint64_t)currentReminderWindow
{
  return [(_DDMAlertSchedulingUnit *)self->_scheduledAlertInfo window];
}

+ (unint64_t)_alertStyleForWindow:(unint64_t)a3
{
  if (a3 == 1) {
    return 4;
  }
  if (a3 - 2 <= 1) {
    return 5;
  }
  return 0;
}

- (unint64_t)_alertStyleForCurrentWindow
{
  return (unint64_t)objc_msgSend((id)objc_opt_class(), "_alertStyleForWindow:", -[SUSUIDDMController currentReminderWindow](self, "currentReminderWindow"));
}

- (id)enforcedInstallDate
{
  return [(SUCoreDDMDeclaration *)self->_declaration enforcedInstallDate];
}

- (BOOL)shouldEnforceUpdate
{
  return [(SUCoreDDMDeclaration *)self->_declaration isInstallOverdue] & 1;
}

- (void)_scheduleNextDDMAlert
{
  SEL v20 = self;
  location[1] = (id)a2;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_controllerClientQueue);
  if (v20->_schedulingIndex >= 0)
  {
    unint64_t schedulingIndex = v20->_schedulingIndex;
    if (schedulingIndex >= [(NSArray *)v20->_scheduling count])
    {
      if (!v20->_scheduledAlertInfo)
      {
        id v7 = objc_alloc_init(_DDMAlertSchedulingUnit);
        scheduledAlertInfo = v20->_scheduledAlertInfo;
        v20->_scheduledAlertInfo = v7;
      }
      id v15 = +[NSDate dateWithTimeIntervalSinceNow:300.0];
      -[_DDMAlertSchedulingUnit setDate:](v20->_scheduledAlertInfo, "setDate:");

      [(_DDMAlertSchedulingUnit *)v20->_scheduledAlertInfo setWindow:1];
      id v17 = sub_1F310();
      id v16 = [v17 localizedStringForKey:@"SOFTWARE_UPDATE_INSTALL_ALERT_ENFORCED_NOW" value:&stru_62DF0 table:@"ui_alerts"];
      -[_DDMAlertSchedulingUnit setAlertMsgFormat:](v20->_scheduledAlertInfo, "setAlertMsgFormat:");
    }
    else
    {
      scheduling = v20->_scheduling;
      ++v20->_schedulingIndex;
      unint64_t v5 = (_DDMAlertSchedulingUnit *)-[NSArray objectAtIndex:](scheduling, "objectAtIndex:");
      id v6 = v20->_scheduledAlertInfo;
      v20->_scheduledAlertInfo = v5;
    }
  }
  else
  {
    double v2 = (_DDMAlertSchedulingUnit *)[(SUSUIDDMController *)v20 _schedulingUnitWithIntervalFromEnforcedDate:(double)(86400 * v20->_schedulingIndex)];
    double v3 = v20->_scheduledAlertInfo;
    v20->_scheduledAlertInfo = v2;

    ++v20->_schedulingIndex;
  }
  location[0] = (id)SUSUILog();
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_1A638((uint64_t)v21, (uint64_t)"-[SUSUIDDMController _scheduleNextDDMAlert]", (uint64_t)v20->_scheduledAlertInfo);
    _os_log_impl(&def_46F0, (os_log_t)location[0], OS_LOG_TYPE_DEFAULT, "%s: [DDM] Next alert info: %@", v21, 0x16u);
  }
  objc_storeStrong(location, 0);
  if (!v20->_ddmTimer)
  {
    id v9 = (PCPersistentTimer *)objc_alloc((Class)PCPersistentTimer);
    ddmTimer = v20->_ddmTimer;
    v20->_ddmTimer = v9;
  }
  id v13 = v20->_ddmTimer;
  id v14 = [(_DDMAlertSchedulingUnit *)v20->_scheduledAlertInfo date];
  int v11 = -[PCPersistentTimer initWithFireDate:serviceIdentifier:target:selector:userInfo:](v13, "initWithFireDate:serviceIdentifier:target:selector:userInfo:");
  id v12 = v20->_ddmTimer;
  v20->_ddmTimer = v11;

  [(PCPersistentTimer *)v20->_ddmTimer setUserVisible:1];
  [(PCPersistentTimer *)v20->_ddmTimer setMinimumEarlyFireProportion:1.0];
  [(PCPersistentTimer *)v20->_ddmTimer scheduleInQueue:v20->_controllerClientQueue];
}

- (void)_showDDMAlert:(id)a3
{
  id v4 = (dispatch_queue_t *)self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  dispatch_assert_queue_V2(v4[4]);
  [(dispatch_queue_t *)v4 _setPasscodePolicyToRequiredIfNeeded];
  [(dispatch_queue_t *)v4 _showDDMAlertNowOrInstallIfNecessary:1];
  [(dispatch_queue_t *)v4 _scheduleNextDDMAlert];
  objc_storeStrong(location, 0);
}

- (void)_setPasscodePolicyToRequiredIfNeeded
{
  id v9 = self;
  v8[1] = (id)a2;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_controllerClientQueue);
  if ([(SUSUISoftwareUpdateController *)v9->_controller isInstallationKeybagRequired])
  {
    v8[0] = (id)SUSUILog();
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v8[0], OS_LOG_TYPE_DEFAULT))
    {
      log = v8[0];
      os_log_type_t type = v7;
      id v4 = [(SUSUIDDMController *)v9 enforcedInstallDate];
      id v6 = v4;
      sub_1A638((uint64_t)v11, (uint64_t)"-[SUSUIDDMController _setPasscodePolicyToRequiredIfNeeded]", (uint64_t)v6);
      _os_log_impl(&def_46F0, log, type, "%s: [DDM] Set passcode policy to SUPasscodePolicyTypeRequired for the enforced date %@", v11, 0x16u);

      objc_storeStrong(&v6, 0);
    }
    objc_storeStrong(v8, 0);
    [(SUSUISoftwareUpdateController *)v9->_controller _setPasscodePolicyType:2];
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)SUSUILog();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_1A68C((uint64_t)v10, (uint64_t)"-[SUSUIDDMController _setPasscodePolicyToRequiredIfNeeded]");
      _os_log_impl(&def_46F0, oslog, OS_LOG_TYPE_DEFAULT, "%s: [DDM] No need to change passcode policy as we don't need a keybag", v10, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
}

- (void)_doInstall:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(SUSUISoftwareUpdateController *)v4->_controller installNowFromSource:1 options:location[0]];
  objc_storeStrong(location, 0);
}

- (void)_installNow
{
  v23 = self;
  location[1] = (id)a2;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_controllerClientQueue);
  location[0] = (id)SUSUILog();
  os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_1A68C((uint64_t)v25, (uint64_t)"-[SUSUIDDMController _installNow]");
    _os_log_impl(&def_46F0, (os_log_t)location[0], v21, "%s: [DDM] was called", v25, 0xCu);
  }
  objc_storeStrong(location, 0);
  id v20 = [(SUSUIDDMController *)v23 descriptor];
  id v7 = [(SUSUISoftwareUpdateController *)v23->_controller _download];
  id v6 = [v7 descriptor];
  BOOL v8 = (objc_msgSend(v20, "isEqualToDescriptor:") & 1) != 0;

  if (v8)
  {
    id v16 = objc_alloc_init(SUSUISoftwareUpdateInstallOptions);
    [(SUSUISoftwareUpdateInstallOptions *)v16 setIgnorableConstraints:1056];
    controller = v23->_controller;
    double v2 = v16;
    id v9 = _NSConcreteStackBlock;
    int v10 = -1073741824;
    int v11 = 0;
    id v12 = sub_1C320;
    id v13 = &unk_5F328;
    id v14 = v16;
    id v15 = v23;
    [(SUSUISoftwareUpdateController *)controller _isUpdateInstallableWithInstallOptions:v2 andResponse:&v9];
    objc_storeStrong((id *)&v15, 0);
    objc_storeStrong((id *)&v14, 0);
    objc_storeStrong((id *)&v16, 0);
    int v17 = 0;
  }
  else
  {
    id v19 = (id)SUSUILog();
    os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [(SUSUISoftwareUpdateController *)v23->_controller _download];
      id v4 = [v5 descriptor];
      sub_1ADDC((uint64_t)v24, (uint64_t)"-[SUSUIDDMController _installNow]", (uint64_t)v20, (uint64_t)v4);
      _os_log_impl(&def_46F0, (os_log_t)v19, v18, "%s: [DDM] Skipping. SUDDMManager descriptor (%@) mismatches downloaded descriptor (%@)", v24, 0x20u);
    }
    objc_storeStrong(&v19, 0);
    int v17 = 1;
  }
  objc_storeStrong(&v20, 0);
}

- (BOOL)_reallyShouldEnforceNow
{
  BOOL v8 = self;
  SEL v7 = a2;
  BOOL v6 = 0;
  [(NSDate *)self->_reallyEnforcedDate timeIntervalSinceNow];
  BOOL v6 = v2 <= 0.0;
  os_log_t oslog = (os_log_t)(id)SUSUILog();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    if (v6) {
      CFStringRef v3 = @"YES";
    }
    else {
      CFStringRef v3 = @"NO";
    }
    sub_1A638((uint64_t)v9, (uint64_t)"-[SUSUIDDMController _reallyShouldEnforceNow]", (uint64_t)v3);
    _os_log_impl(&def_46F0, oslog, OS_LOG_TYPE_DEFAULT, "%s: [DDM] result = %@", v9, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  return v6;
}

- (BOOL)_presentAlert:(id)a3
{
  os_log_type_t v21 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([(SUSUISoftwareUpdateController *)v21->_controller settingsForeground])
  {
    id v19 = (id)SUSUILog();
    os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v19, OS_LOG_TYPE_DEFAULT))
    {
      sub_1A68C((uint64_t)v26, (uint64_t)"-[SUSUIDDMController _presentAlert:]");
      _os_log_impl(&def_46F0, (os_log_t)v19, v18, "%s: [DDM] [Install Alert] Settings, safe", v26, 0xCu);
    }
    objc_storeStrong(&v19, 0);
  }
  else if ([(SUSUISoftwareUpdateController *)v21->_controller _homescreenForeground])
  {
    id v17 = (id)SUSUILog();
    os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v17, OS_LOG_TYPE_DEFAULT))
    {
      sub_1A68C((uint64_t)v25, (uint64_t)"-[SUSUIDDMController _presentAlert:]");
      _os_log_impl(&def_46F0, (os_log_t)v17, v16, "%s: [DDM] [Install Alert] Homescreen, safe", v25, 0xCu);
    }
    objc_storeStrong(&v17, 0);
  }
  else
  {
    id v15 = [(SUSUISoftwareUpdateController *)v21->_controller _foregroundBundleID];
    id v14 = (id)SUSUILog();
    os_log_type_t v13 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
    {
      sub_1C8D0((uint64_t)v24, (uint64_t)"-[SUSUIDDMController _presentAlert:]", (uint64_t)v15);
      _os_log_impl(&def_46F0, (os_log_t)v14, v13, "%s: [DDM] [Install Alert] fgApp = %{public}@, presenting a notification (follow-up) ...", v24, 0x16u);
    }
    objc_storeStrong(&v14, 0);
    id v12 = objc_alloc_init(SUSUIFollowUpDDMUpdate);
    id v5 = [location[0] title];
    -[SUSUIFollowUpDDMUpdate setNotificationTitle:](v12, "setNotificationTitle:");

    id v6 = [location[0] message];
    -[SUSUIFollowUpDDMUpdate setNotificationInformativeText:](v12, "setNotificationInformativeText:");

    int v11 = +[SUSUIFollowUpPresenter sharedInstance];
    SEL v7 = v11;
    id v9 = +[SUSUIFollowUpDDMUpdate uniqueIdentifier];
    id v23 = v9;
    BOOL v8 = +[NSArray arrayWithObjects:&v23 count:1];
    -[SUSUIFollowUpPresenter clearFollowUpWithIdentifiers:](v7, "clearFollowUpWithIdentifiers:");

    [(SUSUIFollowUpPresenter *)v11 presentFollowUp:v12 error:0];
    objc_storeStrong((id *)&v11, 0);
    objc_storeStrong((id *)&v12, 0);
    objc_storeStrong(&v15, 0);
  }
  os_log_t oslog = (os_log_t)(id)SUSUILog();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_1C8D0((uint64_t)v22, (uint64_t)"-[SUSUIDDMController _presentAlert:]", (uint64_t)location[0]);
    _os_log_impl(&def_46F0, oslog, OS_LOG_TYPE_DEFAULT, "%s: [DDM] [Install Alert] calling controller to present %{public}@", v22, 0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  unsigned __int8 v4 = [(SUSUISoftwareUpdateController *)v21->_controller presentAlert:location[0]];
  objc_storeStrong(location, 0);
  return v4 & 1;
}

- (void)_showDDMAlertNowOrInstallIfNecessary:(BOOL)a3
{
  v44 = self;
  SEL v43 = a2;
  BOOL v42 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_controllerClientQueue);
  id location = (id)SUSUILog();
  os_log_type_t type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
  {
    sub_1A68C((uint64_t)v53, (uint64_t)"-[SUSUIDDMController _showDDMAlertNowOrInstallIfNecessary:]");
    _os_log_impl(&def_46F0, (os_log_t)location, type, "%s: [DDM] was called", v53, 0xCu);
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong((id *)&v44->_presentedAlert, 0);
  [(SUSUISoftwareUpdateController *)v44->_controller _dismissAllAlerts];
  if (v44->_shouldPauseAlert)
  {
    id v39 = (id)SUSUILog();
    os_log_type_t v38 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v39, OS_LOG_TYPE_DEFAULT))
    {
      sub_1A68C((uint64_t)v52, (uint64_t)"-[SUSUIDDMController _showDDMAlertNowOrInstallIfNecessary:]");
      _os_log_impl(&def_46F0, (os_log_t)v39, v38, "%s: [DDM] Can't show DDM alert since we are asked to pause", v52, 0xCu);
    }
    objc_storeStrong(&v39, 0);
    return;
  }
  if (![(SUSUIDDMController *)v44 currentReminderWindow])
  {
    id v36 = (id)SUSUILog();
    os_log_type_t v35 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v36, OS_LOG_TYPE_DEFAULT))
    {
      sub_1A68C((uint64_t)v51, (uint64_t)"-[SUSUIDDMController _showDDMAlertNowOrInstallIfNecessary:]");
      _os_log_impl(&def_46F0, (os_log_t)v36, v35, "%s: [DDM] Can't show DDM alert with style None. If you got here, there's probably a bug and you should open a radar to: SoftwareUpdateServicesUI | all", v51, 0xCu);
    }
    objc_storeStrong(&v36, 0);
    return;
  }
  if (!v44->_lastClassicAlertDate
    || ((double v34 = 0.0,
         [(NSDate *)v44->_lastClassicAlertDate timeIntervalSinceNow],
         double v34 = v3,
         v3 >= 0.0)
      ? (double v18 = v34)
      : (double v18 = -v34),
        oslog[1] = *(os_log_t *)&v18,
        v18 >= 60.0))
  {
    id v31 = 0;
    char v30 = 0;
    id v29 = [(SUSUIDDMController *)v44 descriptor];
    if (!v29)
    {
      os_log_t v28 = (os_log_t)(id)SUSUILog();
      os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        sub_1A638((uint64_t)v49, (uint64_t)"-[SUSUIDDMController _showDDMAlertNowOrInstallIfNecessary:]", (uint64_t)v44->_declaration);
        _os_log_impl(&def_46F0, v28, v27, "%s: [DDM] Can't show DDM alert when there's no descriptor (from the SUDDMManager) for our %@", v49, 0x16u);
      }
      objc_storeStrong((id *)&v28, 0);
      int v26 = 1;
LABEL_45:
      objc_storeStrong(&v29, 0);
      objc_storeStrong(&v31, 0);
      return;
    }
    id v4 = [(SUSUISoftwareUpdateController *)v44->_controller _download];
    BOOL v17 = v4 != 0;

    if (v17)
    {
      id v15 = [(SUSUISoftwareUpdateController *)v44->_controller _download];
      id v14 = [v15 descriptor];
      unsigned __int8 v16 = [v14 isEqualToDescriptor:v29];

      if ((v16 & 1) == 0)
      {
        os_log_t v21 = (os_log_t)(id)SUSUILog();
        os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t declaration = (uint64_t)v44->_declaration;
          id v13 = [(SUSUISoftwareUpdateController *)v44->_controller _download];
          id v12 = [v13 descriptor];
          sub_1D8AC((uint64_t)v46, (uint64_t)"-[SUSUIDDMController _showDDMAlertNowOrInstallIfNecessary:]", (uint64_t)v29, declaration, (uint64_t)v12);
          _os_log_impl(&def_46F0, v21, v20, "%s: [DDM] WARNING WARNING WARNING!!! We found a descriptor\n%@\nfor declaration\n%@\nbut we downloaded something else\n%@\nDon't show the alert...", v46, 0x2Au);
        }
        objc_storeStrong((id *)&v21, 0);
        int v26 = 1;
        goto LABEL_45;
      }
      if (v42 && [(SUSUIDDMController *)v44 _reallyShouldEnforceNow])
      {
        [(SUSUIDDMController *)v44 _installNow];
      }
      else
      {
        id v9 = [SUSUISoftwareUpdateInstallAlertItem alloc];
        id v10 = [(SUSUISoftwareUpdateController *)v44->_controller _download];
        SEL v7 = -[SUSUISoftwareUpdateInstallAlertItem initWithDownload:style:softwareUpdateController:tryTonightInstallOperationForecast:installOptions:](v9, "initWithDownload:style:softwareUpdateController:tryTonightInstallOperationForecast:installOptions:", v10, [(SUSUIDDMController *)v44 scheduledAlertStyle], v44->_controller, 0);
        id v8 = v31;
        id v31 = v7;

        char v30 = [(SUSUIDDMController *)v44 _presentAlert:v31];
      }
    }
    else
    {
      if (![(_DDMAlertSchedulingUnit *)v44->_scheduledAlertInfo window])
      {
        os_log_t v25 = (os_log_t)(id)SUSUILog();
        os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          sub_1A638((uint64_t)v48, (uint64_t)"-[SUSUIDDMController _showDDMAlertNowOrInstallIfNecessary:]", (uint64_t)v44->_scheduledAlertInfo);
          _os_log_impl(&def_46F0, v25, v24, "%s: [DDM] Cannot show alert because of the invalid alert info %@", v48, 0x16u);
        }
        objc_storeStrong((id *)&v25, 0);
        int v26 = 1;
        goto LABEL_45;
      }
      id v5 = [[SUSUIDDMAvailableAlertItem alloc] initWithDescriptor:v29 softwareUpdateController:v44->_controller alertWindow:[(_DDMAlertSchedulingUnit *)v44->_scheduledAlertInfo window]];
      id v6 = v31;
      id v31 = v5;

      os_log_t v23 = (os_log_t)(id)SUSUILog();
      os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        sub_1C8D0((uint64_t)v47, (uint64_t)"-[SUSUIDDMController _showDDMAlertNowOrInstallIfNecessary:]", (uint64_t)v31);
        _os_log_impl(&def_46F0, v23, v22, "%s: [DDM] [Available Alert] Presenting %{public}@", v47, 0x16u);
      }
      objc_storeStrong((id *)&v23, 0);
      char v30 = [(SUSUISoftwareUpdateController *)v44->_controller presentAlert:v31];
    }
    if (v30)
    {
      objc_storeStrong((id *)&v44->_presentedAlert, v31);
    }
    else
    {
      os_log_t v19 = (os_log_t)(id)SUSUILog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        sub_1A68C((uint64_t)v45, (uint64_t)"-[SUSUIDDMController _showDDMAlertNowOrInstallIfNecessary:]");
        _os_log_impl(&def_46F0, v19, OS_LOG_TYPE_DEFAULT, "%s: [DDM] Failed to/Didn't show DDM alert.", v45, 0xCu);
      }
      objc_storeStrong((id *)&v19, 0);
    }
    int v26 = 1;
    goto LABEL_45;
  }
  oslog[0] = (os_log_t)(id)SUSUILog();
  os_log_type_t v32 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_1A68C((uint64_t)v50, (uint64_t)"-[SUSUIDDMController _showDDMAlertNowOrInstallIfNecessary:]");
    _os_log_impl(&def_46F0, oslog[0], v32, "%s: [DDM] Another classic alert was just shown/will be shown shortly, skip this DDM alert... (This is very tricky and likely buggy)", v50, 0xCu);
  }
  objc_storeStrong((id *)oslog, 0);
}

- (void)notifyAlertWasPresented
{
  double v2 = +[NSDate date];
  lastClassicAlertDate = self->_lastClassicAlertDate;
  self->_lastClassicAlertDate = v2;
}

- (unint64_t)decideAlertConflictWithAlertFlow:(unint64_t)a3
{
  id v36 = self;
  SEL v35 = a2;
  unint64_t v34 = a3;
  id v33 = (id)SUSUILog();
  os_log_type_t v32 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v33, OS_LOG_TYPE_DEFAULT))
  {
    log = v33;
    os_log_type_t type = v32;
    BOOL v17 = SUSUIStringForInstallAlertFlow(v34);
    id v13 = v17;
    id v31 = v13;
    unsigned __int8 v16 = SUSUIStringForInstallAlertInstallStyle([(SUSUIDDMController *)v36 _alertStyleForCurrentWindow]);
    char v30 = v16;
    sub_1ADDC((uint64_t)v39, (uint64_t)"-[SUSUIDDMController decideAlertConflictWithAlertFlow:]", (uint64_t)v13, (uint64_t)v30);
    _os_log_impl(&def_46F0, log, type, "%s: [DDM] Deciding conflict between classic flow (%@) and DDM (%@) alerts", v39, 0x20u);

    objc_storeStrong((id *)&v30, 0);
    objc_storeStrong((id *)&v31, 0);
  }
  objc_storeStrong(&v33, 0);
  uint64_t v29 = 0;
  id v28 = [(SUSUIDDMController *)v36 descriptor];
  char v26 = 0;
  char v24 = 0;
  BOOL v12 = 1;
  if (v28)
  {
    id v27 = [(SUSUISoftwareUpdateController *)v36->_controller _download];
    char v26 = 1;
    id v25 = [v27 descriptor];
    char v24 = 1;
    BOOL v12 = (objc_msgSend(v28, "isEqualToDescriptor:") & 1) == 0;
  }
  if (v24) {

  }
  if (v26) {
  if (v12)
  }
  {
    id v23 = (id)SUSUILog();
    os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [(SUSUISoftwareUpdateController *)v36->_controller _download];
      id v10 = [v11 descriptor];
      sub_1ADDC((uint64_t)v38, (uint64_t)"-[SUSUIDDMController decideAlertConflictWithAlertFlow:]", (uint64_t)v28, (uint64_t)v10);
      _os_log_impl(&def_46F0, (os_log_t)v23, v22, "%s: [DDM] Deciding no conflicts. Downloaded descriptor (%@) mismatches SUDDMManager descriptor (%@)", v38, 0x20u);
    }
    objc_storeStrong(&v23, 0);
    uint64_t v29 = 0;
  }
  else if (v36->_declaration && !v36->_shouldPauseAlert && v34)
  {
    uint64_t v21 = 0;
    if (v34 == 2 || v34 == 3 || v34 == 5)
    {
      uint64_t v9 = 2;
    }
    else
    {
      if (v34 == 4) {
        uint64_t v8 = 3;
      }
      else {
        uint64_t v8 = v34 == 1;
      }
      uint64_t v9 = v8;
    }
    uint64_t v21 = v9;
    if (v9 == 2)
    {
      uint64_t v29 = 2;
    }
    else if ((char *)[(_DDMAlertSchedulingUnit *)v36->_scheduledAlertInfo window] - 1 > (unsigned char *)&def_46F0 + 1)
    {
      uint64_t v29 = 2;
    }
    else
    {
      uint64_t v29 = 1;
    }
  }
  else
  {
    uint64_t v29 = 0;
  }
  os_log_t oslog = (os_log_t)(id)SUSUILog();
  os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = oslog;
    os_log_type_t v6 = v19;
    id v7 = [(SUSUIDDMController *)v36 stringFromRightsOwner:v29];
    id v18 = v7;
    sub_1A638((uint64_t)v37, (uint64_t)"-[SUSUIDDMController decideAlertConflictWithAlertFlow:]", (uint64_t)v18);
    _os_log_impl(&def_46F0, v5, v6, "%s: [DDM] Owner decision: %@", v37, 0x16u);

    objc_storeStrong(&v18, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  unint64_t v4 = v29;
  objc_storeStrong(&v28, 0);
  return v4;
}

- (id)stringFromRightsOwner:(unint64_t)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      unint64_t v4 = @"DDM-Alert";
    }
    else if (a3 == 2)
    {
      unint64_t v4 = @"Classic-Alert";
    }
  }
  else
  {
    unint64_t v4 = @"No-Conflicts";
  }

  return v4;
}

- (void)_disarm
{
  self->_shouldPauseAlert = 0;
  objc_storeStrong((id *)&self->_scheduledAlertInfo, 0);
  objc_storeStrong((id *)&self->_scheduling, 0);
}

- (id)descriptor
{
  return [(SUSUISoftwareUpdateController *)self->_controller getDDMUpdateDescriptor];
}

- (id)alertBodyLocallizedStrWithUpdateName:(id)a3
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  *(void *)&v9[4] = 0;
  double v3 = [(_DDMAlertSchedulingUnit *)v11->_scheduledAlertInfo alertMsgFormat];
  *(void *)uint64_t v9 = v3 != 0;

  if (v9[0])
  {
    uint64_t v8 = [(_DDMAlertSchedulingUnit *)v11->_scheduledAlertInfo alertMsgFormat];
    unint64_t v4 = +[NSString stringWithValidatedFormat:validFormatSpecifiers:error:](NSString, "stringWithValidatedFormat:validFormatSpecifiers:error:", location[0]);
    id v5 = *(void **)&v9[4];
    *(void *)&v9[4] = v4;
  }
  else
  {
    objc_storeStrong((id *)&v9[4], @"There is no alert message to show. This is a bug, please file a radar ;-"));
  }
  id v7 = *(id *)&v9[4];
  objc_storeStrong((id *)&v9[4], 0);
  objc_storeStrong(location, 0);

  return v7;
}

- (id)schduledAlertDate
{
  return [(_DDMAlertSchedulingUnit *)self->_scheduledAlertInfo date];
}

- (unint64_t)scheduledAlertStyle
{
  return (unint64_t)objc_msgSend((id)objc_opt_class(), "_alertStyleForWindow:", -[_DDMAlertSchedulingUnit window](self->_scheduledAlertInfo, "window"));
}

- (BOOL)_isUpdateRelevant:(id)a3
{
  id v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if ([(SUCoreDDMDeclaration *)v10->_declaration isValidDeclaration])
  {
    if (location[0])
    {
      id v8 = [(SUCoreDDMDeclaration *)v10->_declaration buildVersionString];

      if (v8)
      {
        id v7 = [(SUCoreDDMDeclaration *)v10->_declaration buildVersionString];
        id v6 = [location[0] productBuildVersion];
        char v11 = objc_msgSend(v7, "isEqualToString:") & 1;
      }
      else
      {
        id v5 = [(SUCoreDDMDeclaration *)v10->_declaration versionString];
        id v4 = [location[0] productVersion];
        char v11 = objc_msgSend(v5, "isEqualToString:") & 1;
      }
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 1;
  }
  objc_storeStrong(location, 0);
  return v11 & 1;
}

- (void)installDidStart:(id)a3
{
  BOOL v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = v12->_controllerClientQueue;
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_1E524;
  id v8 = &unk_5CFB0;
  id v9 = location[0];
  id v10 = v12;
  dispatch_async(queue, &v4);
  objc_storeStrong((id *)&v10, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)installDidFinish:(id)a3
{
  BOOL v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  queue = v12->_controllerClientQueue;
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_1E7D4;
  id v8 = &unk_5CFB0;
  id v9 = v12;
  id v10 = location[0];
  dispatch_async(queue, &v4);
  objc_storeStrong(&v10, 0);
  objc_storeStrong((id *)&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)installDidFail:(id)a3
{
  int v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)(id)SUSUILog();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [location[0] humanReadableUpdateName];
    sub_1A638((uint64_t)v7, (uint64_t)"-[SUSUIDDMController installDidFail:]", (uint64_t)v3);
    _os_log_impl(&def_46F0, oslog, OS_LOG_TYPE_DEFAULT, "%s: [DDM] Failed to install %@; resume showing alert...",
      v7,
      0x16u);
  }
  objc_storeStrong((id *)&oslog, 0);
  v6->_shouldPauseAlert = 0;
  objc_storeStrong(location, 0);
}

- (void)showDDMAlert:(int64_t)a3 install:(BOOL)a4
{
  id v15 = self;
  SEL v14 = a2;
  id v13 = (void *)a3;
  BOOL v12 = a4;
  queue = self->_controllerClientQueue;
  int v5 = _NSConcreteStackBlock;
  int v6 = -1073741824;
  int v7 = 0;
  id v8 = sub_1EBDC;
  id v9 = &unk_5F350;
  v10[0] = self;
  v10[1] = v13;
  BOOL v11 = v12;
  dispatch_async(queue, &v5);
  objc_storeStrong(v10, 0);
}

- (void)showNextDDMAlert:(BOOL)a3
{
  id v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  queue = self->_controllerClientQueue;
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  int v7 = sub_1EF7C;
  id v8 = &unk_5F378;
  id v9 = self;
  BOOL v10 = v11;
  dispatch_async(queue, &v4);
  objc_storeStrong((id *)&v9, 0);
}

- (id)_getScheduledAlertInfo
{
  return self->_scheduledAlertInfo;
}

- (void)installNow
{
  BOOL v11 = self;
  location[1] = (id)a2;
  location[0] = (id)SUSUILog();
  os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_1A68C((uint64_t)v12, (uint64_t)"-[SUSUIDDMController installNow]");
    _os_log_impl(&def_46F0, (os_log_t)location[0], v9, "%s: [DDM] was called", v12, 0xCu);
  }
  objc_storeStrong(location, 0);
  queue = v11->_controllerClientQueue;
  id v3 = _NSConcreteStackBlock;
  int v4 = -1073741824;
  int v5 = 0;
  int v6 = sub_1F15C;
  int v7 = &unk_5CC30;
  id v8 = v11;
  dispatch_async(queue, &v3);
  objc_storeStrong((id *)&v8, 0);
}

- (BOOL)pendingUnlockToShowAlert
{
  return self->_pendingUnlockToShowAlert;
}

- (NSArray)scheduling
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setScheduling:(id)a3
{
}

- (int64_t)schedulingIndex
{
  return self->_schedulingIndex;
}

- (void)setSchedulingIndex:(int64_t)a3
{
  self->_unint64_t schedulingIndex = a3;
}

- (void).cxx_destruct
{
}

@end