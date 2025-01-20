@interface PBCFUserNotificationPasteNotifier
- (PBCFUserNotificationPasteNotifier)init;
- (void)_notificationDismissed:(__CFUserNotification *)a3;
- (void)_notifyWithAnnouncement:(id)a3;
- (void)_withNotifications:(id)a3;
- (void)notifyDeniedPaste;
- (void)notifyPaste:(id)a3;
@end

@implementation PBCFUserNotificationPasteNotifier

- (PBCFUserNotificationPasteNotifier)init
{
  v7.receiver = self;
  v7.super_class = (Class)PBCFUserNotificationPasteNotifier;
  v2 = [(PBCFUserNotificationPasteNotifier *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_notificationLock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
    notifications = v3->_notifications;
    v3->_notifications = v4;
  }
  return v3;
}

- (void)_withNotifications:(id)a3
{
  p_notificationLock = &self->_notificationLock;
  v5 = (void (**)(id, NSMutableOrderedSet *))a3;
  os_unfair_lock_lock(p_notificationLock);
  v5[2](v5, self->_notifications);

  os_unfair_lock_unlock(p_notificationLock);
}

- (void)_notificationDismissed:(__CFUserNotification *)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001A158;
  v3[3] = &unk_100031BF0;
  v3[4] = a3;
  [(PBCFUserNotificationPasteNotifier *)self _withNotifications:v3];
}

- (void)_notifyWithAnnouncement:(id)a3
{
  if (a3)
  {
    v3 = [a3 localizedAnnouncementText];
    v4 = &stru_100032C78;
  }
  else
  {
    v5 = +[PBEnterpriseInfo sharedInstance];
    v6 = [v5 orgName];

    objc_super v7 = sub_10001A2B0();
    v4 = [v7 localizedStringForKey:@"PASTE_ANNOUNCEMENT_NOT_ALLOWED" value:@"Pasting this content is restricted" table:@"Localizable"];

    if (v6)
    {
      v8 = sub_10001A2B0();
      v9 = [v8 localizedStringForKey:@"PASTE_ANNOUNCEMENT_MANAGED_BY" value:@"Managed by ”%@”" table:@"Localizable"];

      uint64_t v10 = 0;
      v3 = +[NSString stringWithValidatedFormat:v9, @"%@", &v10, v6 validFormatSpecifiers error];
    }
    else
    {
      v3 = &stru_100032C78;
    }
  }
  CFUserNotificationDisplayNotice(PBAuthorizationTimeoutInterval, 3uLL, 0, 0, 0, v4, v3, 0);
}

- (void)notifyDeniedPaste
{
}

- (void)notifyPaste:(id)a3
{
}

- (void).cxx_destruct
{
}

@end