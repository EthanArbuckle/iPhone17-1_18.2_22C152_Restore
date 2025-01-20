@interface NPDCardSetupReminderNotificationScheduler
- (BOOL)_hasReminderWithName:(id)a3;
- (NPDCardSetupReminderNotificationScheduler)init;
- (NPDCardSetupReminderNotificationSchedulerDelegate)delegate;
- (id)_firstReminderNameForWatchPaymentPassWithUniqueID:(id)a3;
- (id)_reminderNameForCompanionPaymentPassWithUniqueID:(id)a3;
- (id)_secondReminderNameForWatchPaymentPassWithUniqueID:(id)a3;
- (void)_handleSetupReminderForCompanionPaymentPassWithUniqueID:(id)a3;
- (void)_handleVerificationReminderForWatchPaymentPassWithUniqueID:(id)a3;
- (void)_removeReminderWithName:(id)a3;
- (void)_scheduleReminderWithName:(id)a3 forDate:(id)a4;
- (void)dealloc;
- (void)noteCompanionPaymentPassActivatedWithUniqueID:(id)a3 pairedTerminalIdentifier:(id)a4;
- (void)noteCompanionPaymentPassAddedWithUniqueID:(id)a3 pairedTerminalIdentifier:(id)a4;
- (void)noteCompanionPaymentPassRemovedWithUniqueID:(id)a3;
- (void)noteOfferDisplayedForCompanionPaymentPassWithUniqueID:(id)a3;
- (void)noteWatchPaymentPassNeedsVerificationWithUniqueID:(id)a3;
- (void)noteWatchPaymentPassRemovedWithUniqueID:(id)a3;
- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation NPDCardSetupReminderNotificationScheduler

- (NPDCardSetupReminderNotificationScheduler)init
{
  v4.receiver = self;
  v4.super_class = (Class)NPDCardSetupReminderNotificationScheduler;
  v2 = [(NPDCardSetupReminderNotificationScheduler *)&v4 init];
  if (v2) {
    PDScheduledActivityClientRegister();
  }
  return v2;
}

- (void)dealloc
{
  PDScheduledActivityClientRemove();
  v3.receiver = self;
  v3.super_class = (Class)NPDCardSetupReminderNotificationScheduler;
  [(NPDCardSetupReminderNotificationScheduler *)&v3 dealloc];
}

- (void)performScheduledActivityWithIdentifier:(id)a3 activityCriteria:(id)a4
{
  id v8 = a3;
  if ([v8 hasPrefix:@"companion-"])
  {
    uint64_t v5 = [v8 substringFromIndex:objc_msgSend(@"companion-", "length")];

    [(NPDCardSetupReminderNotificationScheduler *)self _handleSetupReminderForCompanionPaymentPassWithUniqueID:v5];
LABEL_8:
    v7 = (void *)v5;
    goto LABEL_9;
  }
  if ([v8 hasPrefix:@"watch-"])
  {
    v6 = @"watch-";
LABEL_7:
    uint64_t v5 = objc_msgSend(v8, "substringFromIndex:", -[__CFString length](v6, "length"));

    [(NPDCardSetupReminderNotificationScheduler *)self _handleVerificationReminderForWatchPaymentPassWithUniqueID:v5];
    goto LABEL_8;
  }
  if ([v8 hasPrefix:@"2nd-watch-"])
  {
    v6 = @"2nd-watch-";
    goto LABEL_7;
  }
  v7 = v8;
LABEL_9:
}

- (void)noteCompanionPaymentPassAddedWithUniqueID:(id)a3 pairedTerminalIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NPDCardSetupReminderNotificationScheduler *)self _reminderNameForCompanionPaymentPassWithUniqueID:v6];
  v9 = pk_Payment_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    v11 = pk_Payment_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v25 = v6;
      __int16 v26 = 2112;
      id v27 = v7;
      __int16 v28 = 2112;
      v29 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Notice: Companion pass added with unique ID %@ pairedTerminalIdentifier %@. Checking for reminder %@", buf, 0x20u);
    }
  }
  v12 = [(NPDCardSetupReminderNotificationScheduler *)self delegate];
  unsigned int v13 = [v12 hasWatchPaymentPassWithUniqueID:v6];

  if (v7)
  {
    v14 = [(NPDCardSetupReminderNotificationScheduler *)self delegate];
    unsigned int v15 = [v14 hasWatchPaymentPassWithPairedTerminalIdentifier:v7];
  }
  else
  {
    unsigned int v15 = 0;
  }
  if ((v13 | v15))
  {
    v16 = pk_Payment_log();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

    if (v17)
    {
      v18 = pk_Payment_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v8;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Notice: Matching watch pass found; no need to schedule add reminder %@",
          buf,
          0xCu);
      }
    }
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v19 = [(NPDCardSetupReminderNotificationScheduler *)self delegate];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100005230;
    v20[3] = &unk_10006CD28;
    objc_copyWeak(&v23, (id *)buf);
    id v21 = v8;
    id v22 = v6;
    [v19 doesWatchSupportPassLikeCompanionPassWithUniqueID:v22 withCompletion:v20];

    objc_destroyWeak(&v23);
    objc_destroyWeak((id *)buf);
  }
}

- (void)noteCompanionPaymentPassActivatedWithUniqueID:(id)a3 pairedTerminalIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(NPDCardSetupReminderNotificationScheduler *)self _reminderNameForCompanionPaymentPassWithUniqueID:v6];
  v9 = pk_Payment_log();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

  if (v10)
  {
    v11 = pk_Payment_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v8;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Notice: Companion payment pass activated with unique ID %@", buf, 0xCu);
    }
  }
  if ([(NPDCardSetupReminderNotificationScheduler *)self _hasReminderWithName:v8])
  {
    v12 = [(NPDCardSetupReminderNotificationScheduler *)self delegate];
    unsigned int v13 = [v12 hasWatchPaymentPassWithUniqueID:v6];

    if (v7)
    {
      v14 = [(NPDCardSetupReminderNotificationScheduler *)self delegate];
      unsigned int v15 = [v14 hasWatchPaymentPassWithPairedTerminalIdentifier:v7];
    }
    else
    {
      unsigned int v15 = 0;
    }
    if ((v13 | v15) == 1)
    {
      [(NPDCardSetupReminderNotificationScheduler *)self _removeReminderWithName:v8];
    }
    else
    {
      objc_initWeak((id *)buf, self);
      v16 = [(NPDCardSetupReminderNotificationScheduler *)self delegate];
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_1000055A8;
      v17[3] = &unk_10006CD28;
      objc_copyWeak(&v20, (id *)buf);
      id v18 = v8;
      id v19 = v6;
      [v16 doesWatchSupportPassLikeCompanionPassWithUniqueID:v19 withCompletion:v17];

      objc_destroyWeak(&v20);
      objc_destroyWeak((id *)buf);
    }
  }
}

- (void)noteCompanionPaymentPassRemovedWithUniqueID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: Companion payment pass removed with unique ID %@", (uint8_t *)&v9, 0xCu);
    }
  }
  [(NPDCardSetupReminderNotificationScheduler *)self _removeReminderWithName:v4];
  id v8 = [(NPDCardSetupReminderNotificationScheduler *)self delegate];
  [v8 removeReminderNotificationForPassWithUniqueID:v4];
}

- (void)noteOfferDisplayedForCompanionPaymentPassWithUniqueID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: Watch offer displayed for companion pass with unique ID %@", (uint8_t *)&v10, 0xCu);
    }
  }
  id v8 = [(NPDCardSetupReminderNotificationScheduler *)self _reminderNameForCompanionPaymentPassWithUniqueID:v4];
  [(NPDCardSetupReminderNotificationScheduler *)self _removeReminderWithName:v8];
  int v9 = [(NPDCardSetupReminderNotificationScheduler *)self delegate];
  [v9 removeReminderNotificationForPassWithUniqueID:v4];
}

- (void)noteWatchPaymentPassNeedsVerificationWithUniqueID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NPDCardSetupReminderNotificationScheduler *)self _firstReminderNameForWatchPaymentPassWithUniqueID:v4];
  BOOL v6 = [(NPDCardSetupReminderNotificationScheduler *)self _secondReminderNameForWatchPaymentPassWithUniqueID:v4];

  id v7 = pk_Payment_log();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

  if (v8)
  {
    int v9 = pk_Payment_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412546;
      unsigned int v15 = v5;
      __int16 v16 = 2112;
      BOOL v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Notice: Watch payment pass verification reminders scheduled: %@ and %@", (uint8_t *)&v14, 0x16u);
    }
  }
  int v10 = +[NSDate dateWithTimeIntervalSinceNow:3600.0];
  id v11 = +[NSDate dateWithTimeIntervalSinceNow:86400.0];
  if (PKShortenRemindersEnabled())
  {
    uint64_t v12 = +[NSDate dateWithTimeIntervalSinceNow:60.0];

    uint64_t v13 = +[NSDate dateWithTimeIntervalSinceNow:300.0];

    int v10 = (void *)v12;
    id v11 = (void *)v13;
  }
  [(NPDCardSetupReminderNotificationScheduler *)self _scheduleReminderWithName:v5 forDate:v10];
  [(NPDCardSetupReminderNotificationScheduler *)self _scheduleReminderWithName:v6 forDate:v11];
}

- (void)noteWatchPaymentPassRemovedWithUniqueID:(id)a3
{
  id v4 = a3;
  id v7 = [(NPDCardSetupReminderNotificationScheduler *)self _firstReminderNameForWatchPaymentPassWithUniqueID:v4];
  uint64_t v5 = [(NPDCardSetupReminderNotificationScheduler *)self _secondReminderNameForWatchPaymentPassWithUniqueID:v4];
  [(NPDCardSetupReminderNotificationScheduler *)self _removeReminderWithName:v7];
  [(NPDCardSetupReminderNotificationScheduler *)self _removeReminderWithName:v5];
  BOOL v6 = [(NPDCardSetupReminderNotificationScheduler *)self delegate];
  [v6 removeReminderNotificationForPassWithUniqueID:v4];
}

- (void)_handleSetupReminderForCompanionPaymentPassWithUniqueID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: Handling setup reminder for companion payment pass with unique ID %@", buf, 0xCu);
    }
  }
  BOOL v8 = [(NPDCardSetupReminderNotificationScheduler *)self delegate];
  unsigned int v9 = [v8 hasCompanionPaymentPassWithUniqueID:v4];

  if (v9)
  {
    int v10 = [(NPDCardSetupReminderNotificationScheduler *)self delegate];
    unsigned int v11 = [v10 hasWatchPaymentPassWithUniqueID:v4];

    uint64_t v12 = [(NPDCardSetupReminderNotificationScheduler *)self delegate];
    uint64_t v13 = [v12 pairedTerminalIdentifierForCompanionPaymentPassWithUniqueID:v4];

    if (v13)
    {
      int v14 = [(NPDCardSetupReminderNotificationScheduler *)self delegate];
      unsigned int v15 = [v14 hasWatchPaymentPassWithPairedTerminalIdentifier:v13];
    }
    else
    {
      unsigned int v15 = 0;
    }
    if (((v11 | v15) & 1) == 0)
    {
      objc_initWeak((id *)buf, self);
      id v18 = [(NPDCardSetupReminderNotificationScheduler *)self delegate];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100005E3C;
      v19[3] = &unk_10006CD50;
      objc_copyWeak(&v21, (id *)buf);
      id v20 = v4;
      [v18 doesWatchSupportPassLikeCompanionPassWithUniqueID:v20 withCompletion:v19];

      objc_destroyWeak(&v21);
      objc_destroyWeak((id *)buf);
    }
LABEL_14:

    goto LABEL_15;
  }
  __int16 v16 = pk_Payment_log();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

  if (v17)
  {
    uint64_t v13 = pk_Payment_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v4;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Notice: Unable to find payment pass with unique ID %@ on the companion", buf, 0xCu);
    }
    goto LABEL_14;
  }
LABEL_15:
}

- (void)_handleVerificationReminderForWatchPaymentPassWithUniqueID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: Handling verification reminder for watch payment pass with unique ID %@", (uint8_t *)&v11, 0xCu);
    }
  }
  BOOL v8 = [(NPDCardSetupReminderNotificationScheduler *)self delegate];
  unsigned int v9 = [v8 hasWatchPaymentPassRequiringVerificationWithUniqueID:v4];

  if (v9)
  {
    int v10 = [(NPDCardSetupReminderNotificationScheduler *)self delegate];
    [v10 postVerifyReminderNotificationForPassWithUniqueID:v4];
  }
}

- (BOOL)_hasReminderWithName:(id)a3
{
  id v3 = a3;
  int v4 = PDScheduledActivityExists();
  uint64_t v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v8 = "no";
      if (v4) {
        BOOL v8 = "yes";
      }
      int v10 = 138412546;
      id v11 = v3;
      __int16 v12 = 2080;
      uint64_t v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: Do we have a reminder with name %@? %s", (uint8_t *)&v10, 0x16u);
    }
  }
  return v4;
}

- (void)_removeReminderWithName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = pk_Payment_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    id v7 = pk_Payment_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notice: Removing setup/verification reminder with name %@", (uint8_t *)&v8, 0xCu);
    }
  }
  if ([(NPDCardSetupReminderNotificationScheduler *)self _hasReminderWithName:v4]) {
    PDScheduledActivityRemove();
  }
}

- (void)_scheduleReminderWithName:(id)a3 forDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(NPDCardSetupReminderNotificationScheduler *)self _removeReminderWithName:v6];
  int v8 = pk_Payment_log();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

  if (v9)
  {
    int v10 = pk_Payment_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      id v13 = v6;
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Notice: Scheduling setup/verification reminder with name %@ for date %@", (uint8_t *)&v12, 0x16u);
    }
  }
  id v11 = +[PDScheduledActivityCriteria priorityActivityCriteriaWithStartDate:v7];
  PDScheduledActivityRegister();
}

- (id)_reminderNameForCompanionPaymentPassWithUniqueID:(id)a3
{
  return [@"companion-" stringByAppendingString:a3];
}

- (id)_firstReminderNameForWatchPaymentPassWithUniqueID:(id)a3
{
  return [@"watch-" stringByAppendingString:a3];
}

- (id)_secondReminderNameForWatchPaymentPassWithUniqueID:(id)a3
{
  return [@"2nd-watch-" stringByAppendingString:a3];
}

- (NPDCardSetupReminderNotificationSchedulerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NPDCardSetupReminderNotificationSchedulerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end