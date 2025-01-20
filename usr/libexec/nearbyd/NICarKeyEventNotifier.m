@interface NICarKeyEventNotifier
- (NICarKeyEventNotifier)initWithParentSession:(id)a3;
- (void)notifyRangingIntentSentToVehicleWithReason:(int64_t)a3;
- (void)notifyVehicleLockedWithReason:(int64_t)a3;
- (void)notifyVehicleReadyToDriveWithReason:(int64_t)a3;
- (void)notifyVehicleSentRangingSuspendedSubEvent;
- (void)notifyVehicleTerminatedRangingSession;
- (void)notifyVehicleUnlockedWithReason:(int64_t)a3;
@end

@implementation NICarKeyEventNotifier

- (NICarKeyEventNotifier)initWithParentSession:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NICarKeyEventNotifier;
  v5 = [(NICarKeyEventNotifier *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->parentSession, v4);
  }

  return v6;
}

- (void)notifyVehicleUnlockedWithReason:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  if (WeakRetained)
  {
    v16[0] = &off_100878958;
    v15[0] = @"CarKeyEventType";
    v15[1] = @"CarKeyEventReason";
    v7 = +[NSNumber numberWithInteger:a3];
    v16[1] = v7;
    objc_super v8 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

    v9 = [WeakRetained getInternalConnectionQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002ECF30;
    block[3] = &unk_100846588;
    id v13 = WeakRetained;
    id v14 = v8;
    id v10 = v8;
    dispatch_sync(v9, block);
  }
  else
  {
    v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"NISession.mm" lineNumber:2094 description:@"Parent session is nil"];
  }
}

- (void)notifyVehicleLockedWithReason:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  if (WeakRetained)
  {
    v16[0] = &off_100878970;
    v15[0] = @"CarKeyEventType";
    v15[1] = @"CarKeyEventReason";
    v7 = +[NSNumber numberWithInteger:a3];
    v16[1] = v7;
    objc_super v8 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

    v9 = [WeakRetained getInternalConnectionQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002ED18C;
    block[3] = &unk_100846588;
    id v13 = WeakRetained;
    id v14 = v8;
    id v10 = v8;
    dispatch_sync(v9, block);
  }
  else
  {
    v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"NISession.mm" lineNumber:2108 description:@"Parent session is nil"];
  }
}

- (void)notifyVehicleReadyToDriveWithReason:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  if (WeakRetained)
  {
    v16[0] = &off_100878988;
    v15[0] = @"CarKeyEventType";
    v15[1] = @"CarKeyEventReason";
    v7 = +[NSNumber numberWithInteger:a3];
    v16[1] = v7;
    objc_super v8 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

    v9 = [WeakRetained getInternalConnectionQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002ED3E8;
    block[3] = &unk_100846588;
    id v13 = WeakRetained;
    id v14 = v8;
    id v10 = v8;
    dispatch_sync(v9, block);
  }
  else
  {
    v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"NISession.mm" lineNumber:2122 description:@"Parent session is nil"];
  }
}

- (void)notifyRangingIntentSentToVehicleWithReason:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  if (WeakRetained)
  {
    v16[0] = &off_1008789A0;
    v15[0] = @"CarKeyEventType";
    v15[1] = @"CarKeyEventReason";
    v7 = +[NSNumber numberWithInteger:a3];
    v16[1] = v7;
    objc_super v8 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

    v9 = [WeakRetained getInternalConnectionQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002ED644;
    block[3] = &unk_100846588;
    id v13 = WeakRetained;
    id v14 = v8;
    id v10 = v8;
    dispatch_sync(v9, block);
  }
  else
  {
    v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"NISession.mm" lineNumber:2136 description:@"Parent session is nil"];
  }
}

- (void)notifyVehicleTerminatedRangingSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  if (WeakRetained)
  {
    CFStringRef v12 = @"CarKeyEventType";
    id v13 = &off_1008789B8;
    v5 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    v6 = [WeakRetained getInternalConnectionQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002ED868;
    block[3] = &unk_100846588;
    id v10 = WeakRetained;
    id v11 = v5;
    id v7 = v5;
    dispatch_sync(v6, block);
  }
  else
  {
    objc_super v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"NISession.mm" lineNumber:2150 description:@"Parent session is nil"];
  }
}

- (void)notifyVehicleSentRangingSuspendedSubEvent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  if (WeakRetained)
  {
    CFStringRef v12 = @"CarKeyEventType";
    id v13 = &off_1008789D0;
    v5 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
    v6 = [WeakRetained getInternalConnectionQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002EDA8C;
    block[3] = &unk_100846588;
    id v10 = WeakRetained;
    id v11 = v5;
    id v7 = v5;
    dispatch_sync(v6, block);
  }
  else
  {
    objc_super v8 = +[NSAssertionHandler currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"NISession.mm" lineNumber:2164 description:@"Parent session is nil"];
  }
}

- (void).cxx_destruct
{
}

@end