@interface TCCDReminderMonitor
+ (double)positiveDoubleValueAtPreferenceKey:(id)a3 withFallback:(double)a4;
- (TCCDReminderMonitor)init;
- (double)lastReminderTime;
- (double)serviceCooldown;
- (double)systemCooldown;
- (id)reportResourceUsage:(id)a3;
- (void)setLastReminderTime:(double)a3;
- (void)setReminderCooldownPeriod:(int64_t)a3 with:(int64_t)a4;
- (void)setServiceCooldown:(double)a3;
- (void)setSystemCooldown:(double)a3;
- (void)showReminderPrompt:(id)a3 result:(id)a4;
@end

@implementation TCCDReminderMonitor

- (TCCDReminderMonitor)init
{
  v6.receiver = self;
  v6.super_class = (Class)TCCDReminderMonitor;
  v2 = [(TCCDReminderMonitor *)&v6 init];
  if (v2)
  {
    v2->_lastReminderTime = CFAbsoluteTimeGetCurrent();
    +[TCCDReminderMonitor positiveDoubleValueAtPreferenceKey:@"reminderSystemCooldown" withFallback:604800.0];
    v2->_systemCooldown = v3;
    +[TCCDReminderMonitor positiveDoubleValueAtPreferenceKey:@"reminderServiceCooldown" withFallback:15552000.0];
    v2->_serviceCooldown = v4;
  }
  return v2;
}

+ (double)positiveDoubleValueAtPreferenceKey:(id)a3 withFallback:(double)a4
{
  v5 = (__CFString *)a3;
  double valuePtr = 0.0;
  double v6 = 0.0;
  if (os_variant_allows_internal_security_policies())
  {
    CFPropertyListRef v7 = CFPreferencesCopyValue(v5, @"com.apple.tccd", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
    if (v7)
    {
      v8 = v7;
      CFTypeID TypeID = CFNumberGetTypeID();
      if (TypeID == CFGetTypeID(v8) && !CFNumberGetValue((CFNumberRef)v8, kCFNumberDoubleType, &valuePtr)) {
        double valuePtr = 0.0;
      }
      CFRelease(v8);
      double v6 = valuePtr;
    }
  }
  if (v6 > 0.0) {
    a4 = v6;
  }

  return a4;
}

- (id)reportResourceUsage:(id)a3
{
  id v4 = a3;
  v5 = [v4 subjectIdentity];
  [v4 attributionChain];
  uint64_t v6 = v34 = self;
  v69[0] = 0;
  v69[1] = v69;
  v69[2] = 0x3032000000;
  v69[3] = sub_10000F8D4;
  v69[4] = sub_10000F87C;
  id v70 = 0;
  v67[0] = 0;
  v67[1] = v67;
  v67[2] = 0x2020000000;
  int v68 = 0;
  uint64_t v63 = 0;
  v64 = &v63;
  uint64_t v65 = 0x2020000000;
  char v66 = 0;
  uint64_t v59 = 0;
  v60 = &v59;
  uint64_t v61 = 0x2020000000;
  int v62 = 0;
  uint64_t v55 = 0;
  v56 = &v55;
  uint64_t v57 = 0x2020000000;
  int v58 = 0;
  uint64_t v51 = 0;
  v52 = &v51;
  uint64_t v53 = 0x2020000000;
  int v54 = 1;
  uint64_t v47 = 0;
  v48 = (double *)&v47;
  uint64_t v49 = 0x2020000000;
  CFAbsoluteTime Current = 0.0;
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_10002B3A0;
  v44[3] = &unk_100095228;
  id v7 = v5;
  id v45 = v7;
  id v46 = v4;
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_10002B4E8;
  v35[3] = &unk_100095AC0;
  v38 = v67;
  v39 = &v59;
  v40 = &v55;
  v41 = &v51;
  v42 = &v47;
  v43 = &v63;
  v37 = v69;
  v35[4] = self;
  id v8 = v46;
  id v36 = v8;
  v9 = (void *)v6;
  if (db_eval((uint64_t)"SELECT client, client_type, last_reminded, last_modified, flags, auth_version FROM access WHERE auth_value = ? and client = ? and service = ? and (auth_reason = ? or auth_reason = ?)", v44, v35))
  {
    v10 = tcc_access_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = [v8 service];
      sub_10002BC64((uint64_t)v9, v11, buf, v10);
    }
    v12 = 0;
  }
  else
  {
    if (&_TMIsAutomaticTimeEnabled && *((unsigned char *)v64 + 24) && !TMIsAutomaticTimeEnabled())
    {
      v13 = tcc_access_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v72 = "-[TCCDReminderMonitor reportResourceUsage:]";
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: automatic time is disabled, not surfacing reminder prompt", buf, 0xCu);
      }

      *((unsigned char *)v64 + 24) = 0;
    }
    v14 = tcc_access_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = *((unsigned __int8 *)v64 + 24);
      *(_DWORD *)buf = 136315394;
      v72 = "-[TCCDReminderMonitor reportResourceUsage:]";
      __int16 v73 = 1024;
      LODWORD(v74) = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: shouldRemind: %d", buf, 0x12u);
    }

    if (*((unsigned char *)v64 + 24))
    {
      v16 = self;
      objc_sync_enter(v16);
      double v17 = v48[3];
      double lastReminderTime = v16->_lastReminderTime;
      [(TCCDReminderMonitor *)v16 systemCooldown];
      BOOL v20 = v17 - lastReminderTime <= v19;
      if (v17 - lastReminderTime <= v19)
      {
        v21 = tcc_access_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = (const char *)*((void *)v48 + 3);
          double v23 = v16->_lastReminderTime;
          [(TCCDReminderMonitor *)v16 systemCooldown];
          double v24 = v48[3] - v16->_lastReminderTime;
          *(_DWORD *)buf = 134218752;
          v72 = v22;
          __int16 v73 = 2048;
          double v74 = v23;
          __int16 v75 = 2048;
          uint64_t v76 = v25;
          __int16 v77 = 2048;
          double v78 = v24;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "reminder cooldown not expired: now %f, last_reminded %f, cooldown interval %f, elapsed %f", buf, 0x2Au);
          self = v34;
        }
      }
      else
      {
        v26 = tcc_access_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v28 = (const char *)*((void *)v48 + 3);
          double v29 = v16->_lastReminderTime;
          [(TCCDReminderMonitor *)v16 systemCooldown];
          double v30 = v48[3] - v16->_lastReminderTime;
          *(_DWORD *)buf = 134218752;
          v72 = v28;
          __int16 v73 = 2048;
          double v74 = v29;
          __int16 v75 = 2048;
          uint64_t v76 = v31;
          __int16 v77 = 2048;
          double v78 = v30;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "reminder cooldown expired: now %f, last_reminded %f, cooldown interval %f, elapsed: %f", buf, 0x2Au);
          self = v34;
        }

        v16->_double lastReminderTime = v48[3];
      }
      objc_sync_exit(v16);
    }
    else
    {
      BOOL v20 = 1;
    }
    v12 = objc_opt_new();
    [v12 setPreviousAuthorization:2];
    [v12 setDatabaseFlags:*((unsigned int *)v56 + 6)];
    [v12 setAuthorizationVersion:*((int *)v52 + 6)];
    [v12 setLastReminderTime:*((unsigned int *)v60 + 6)];
    [v12 setPromptType:3];
    if (*((unsigned char *)v64 + 24)) {
      char v32 = v20;
    }
    else {
      char v32 = 1;
    }
    if ((v32 & 1) == 0)
    {
      [(TCCDReminderMonitor *)self showReminderPrompt:v8 result:v12];
      [v12 setLastReminderTime:(int)v48[3]];
    }
    v10 = tcc_access_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v72 = "-[TCCDReminderMonitor reportResourceUsage:]";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&v63, 8);
  _Block_object_dispose(v67, 8);
  _Block_object_dispose(v69, 8);

  return v12;
}

- (void)showReminderPrompt:(id)a3 result:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 service];
  id v8 = [TCCDAccessIdentity alloc];
  v9 = [v5 attributionChain];
  v10 = -[TCCDAccessIdentity initWithAttributionChain:preferMostSpecificIdentifier:](v8, "initWithAttributionChain:preferMostSpecificIdentifier:", v9, [v7 hasParanoidSecurityPolicy]);

  v11 = [(TCCDAccessIdentity *)v10 displayName];
  if (v11)
  {
    id v23 = v6;
    v12 = [v7 reminderTitleTextLocalizationKey];
    if (!v12)
    {
      v12 = [v7 requestTitleTextLocalizationKey];
    }
    v13 = [v7 reminderLimitedButtonTitleTextLocalizationKey];
    if (!v13)
    {
      v13 = objc_msgSend(v7, "buttonTitleLocalizationKeyForAuthorization:desiredAuth:", objc_msgSend(v7, "downgradeAuthRight"), 2);
    }
    v22 = [v7 localizedTextWithKey:v13];
    id v14 = [v7 downgradeAuthRight];
    int v15 = [v7 reminderAllowButtonTitleTextLocalizationKey];
    if (!v15)
    {
      int v15 = [v7 allowAuthorizationButtonTitleLocalizationKey];
    }
    v21 = [v7 localizedTextWithKey:v15];
    v16 = [v7 localizedTextWithKey:v12];
    if (!v16)
    {
      double v17 = tcc_access_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v25 = (const char *)v7;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Could not find localized string for service: %@", buf, 0xCu);
      }
      goto LABEL_20;
    }
    double v17 = +[NSString stringWithValidatedFormat:v16, @"%@", 0, v11 validFormatSpecifiers error];
    if (v17)
    {
      [v5 setReminderPrompt:1];
      [v5 presentSynchronousPromptWithHeader:v17 message:0 aButtonTitle:v21 aButtonAuth:v14 bButtonTitle:v22 bButtonAuth:2 currentAuth:2 updatingResult:v23];
      v18 = tcc_access_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v25 = "-[TCCDReminderMonitor showReminderPrompt:result:]";
        double v19 = "%s";
LABEL_18:
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v19, buf, 0xCu);
      }
    }
    else
    {
      v18 = tcc_access_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v25 = (const char *)v7;
        double v19 = "Could not find localized request string for service: %@";
        goto LABEL_18;
      }
    }

LABEL_20:
    id v6 = v23;
    goto LABEL_21;
  }
  v12 = tcc_access_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v20 = [(TCCDAccessIdentity *)v10 identifier];
    *(_DWORD *)buf = 138412546;
    uint64_t v25 = v20;
    __int16 v26 = 2112;
    v27 = v7;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "reminder prompt: cannot find display name: %@ service: %@", buf, 0x16u);
  }
LABEL_21:
}

- (void)setReminderCooldownPeriod:(int64_t)a3 with:(int64_t)a4
{
  if (a4 | a3)
  {
    if (a3 < 1 || a4 < 1) {
      return;
    }
    [(TCCDReminderMonitor *)self setSystemCooldown:(double)a3];
    double v6 = (double)a4;
  }
  else
  {
    [(TCCDReminderMonitor *)self setSystemCooldown:604800.0];
    double v6 = 15552000.0;
  }
  [(TCCDReminderMonitor *)self setServiceCooldown:v6];
}

- (double)systemCooldown
{
  return self->_systemCooldown;
}

- (void)setSystemCooldown:(double)a3
{
  self->_systemCooldown = a3;
}

- (double)serviceCooldown
{
  return self->_serviceCooldown;
}

- (void)setServiceCooldown:(double)a3
{
  self->_serviceCooldown = a3;
}

- (double)lastReminderTime
{
  return self->_lastReminderTime;
}

- (void)setLastReminderTime:(double)a3
{
  self->_double lastReminderTime = a3;
}

@end