@interface NIDevicePresenceNotifier
- (NIDevicePresenceNotifier)initWithParentSession:(id)a3;
- (void)notifyBluetoothSample:(id)a3;
@end

@implementation NIDevicePresenceNotifier

- (NIDevicePresenceNotifier)initWithParentSession:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NIDevicePresenceNotifier;
  v5 = [(NIDevicePresenceNotifier *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->parentSession, v4);
  }

  return v6;
}

- (void)notifyBluetoothSample:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  v7 = WeakRetained;
  if (WeakRetained)
  {
    objc_super v8 = [WeakRetained getInternalConnectionQueue];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1002EF490;
    v10[3] = &unk_100846588;
    id v11 = v7;
    id v12 = v5;
    dispatch_sync(v8, v10);
  }
  else
  {
    v9 = +[NSAssertionHandler currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"NISession.mm" lineNumber:2448 description:@"Parent session is nil"];
  }
}

- (void).cxx_destruct
{
}

@end