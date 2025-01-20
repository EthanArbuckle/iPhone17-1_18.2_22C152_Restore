@interface FREnableNotificationsAlertPresenter
- (BOOL)isPresenting;
- (UIWindow)window;
- (void)presentEnableNotificationsAlertWithEnableNotificationsContext:(int64_t)a3 channelID:(id)a4 channelName:(id)a5 window:(id)a6 completionBlock:(id)a7;
- (void)setPresenting:(BOOL)a3;
@end

@implementation FREnableNotificationsAlertPresenter

- (void)presentEnableNotificationsAlertWithEnableNotificationsContext:(int64_t)a3 channelID:(id)a4 channelName:(id)a5 window:(id)a6 completionBlock:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (!v12 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100077728();
    if (v13) {
      goto LABEL_6;
    }
  }
  else if (v13)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100077648();
  }
LABEL_6:
  if (![(FREnableNotificationsAlertPresenter *)self isPresenting])
  {
    [(FREnableNotificationsAlertPresenter *)self setPresenting:1];
    v16 = [v14 rootViewController];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10004ED04;
    v17[3] = &unk_1000C8B80;
    v17[4] = self;
    id v18 = v15;
    FRShowEnableNotificationsAlert(v16, a3, v12, v13, v17);
  }
}

- (UIWindow)window
{
  return self->_window;
}

- (BOOL)isPresenting
{
  return self->_presenting;
}

- (void)setPresenting:(BOOL)a3
{
  self->_presenting = a3;
}

- (void).cxx_destruct
{
}

@end