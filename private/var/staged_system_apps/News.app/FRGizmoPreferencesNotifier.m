@interface FRGizmoPreferencesNotifier
- (FRGizmoPreferencesNotifier)init;
- (FRGizmoPreferencesNotifierDelegate)delegate;
- (int)notifyToken;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation FRGizmoPreferencesNotifier

- (FRGizmoPreferencesNotifier)init
{
  v9.receiver = self;
  v9.super_class = (Class)FRGizmoPreferencesNotifier;
  v2 = [(FRGizmoPreferencesNotifier *)&v9 init];
  v3 = v2;
  if (v2)
  {
    v2->_notifyToken = -1;
    objc_initWeak(&location, v2);
    id v4 = &_dispatch_main_q;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000424DC;
    v6[3] = &unk_1000C8020;
    objc_copyWeak(&v7, &location);
    notify_register_dispatch("NanoNewsGizmoPrefsChanged", &v3->_notifyToken, (dispatch_queue_t)&_dispatch_main_q, v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)setDelegate:(id)a3
{
}

- (void)dealloc
{
  notify_cancel(self->_notifyToken);
  self->_notifyToken = -1;
  v3.receiver = self;
  v3.super_class = (Class)FRGizmoPreferencesNotifier;
  [(FRGizmoPreferencesNotifier *)&v3 dealloc];
}

- (FRGizmoPreferencesNotifierDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FRGizmoPreferencesNotifierDelegate *)WeakRetained;
}

- (int)notifyToken
{
  return self->_notifyToken;
}

- (void).cxx_destruct
{
}

@end