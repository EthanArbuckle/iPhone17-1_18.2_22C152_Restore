@interface NISystemEventNotifier
- (NISystemEventNotifier)initWithParentSession:(id)a3;
- (void)_notifyResourceUsageLimitExceeded:(BOOL)a3 forSessionConfigurationType:(Class)a4;
- (void)notifyPassiveAccessIntent:(unsigned int)a3;
@end

@implementation NISystemEventNotifier

- (NISystemEventNotifier)initWithParentSession:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NISystemEventNotifier;
  v5 = [(NISystemEventNotifier *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->parentSession, v4);
  }

  return v6;
}

- (void)notifyPassiveAccessIntent:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  if (WeakRetained)
  {
    v16[0] = &off_100878958;
    v15[0] = @"SystemEventDictKey_EventType";
    v15[1] = @"SystemEventDictKey_PassiveAccessIntentOptions";
    v7 = +[NSNumber numberWithUnsignedInt:v3];
    v16[1] = v7;
    objc_super v8 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];

    v9 = [WeakRetained getInternalConnectionQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002F0E50;
    block[3] = &unk_100846588;
    id v13 = WeakRetained;
    id v14 = v8;
    id v10 = v8;
    dispatch_sync(v9, block);
  }
  else
  {
    v11 = +[NSAssertionHandler currentHandler];
    [v11 handleFailureInMethod:a2 object:self file:@"NISession.mm" lineNumber:2727 description:@"Parent session is nil"];
  }
}

- (void)_notifyResourceUsageLimitExceeded:(BOOL)a3 forSessionConfigurationType:(Class)a4
{
  BOOL v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->parentSession);
  if (WeakRetained)
  {
    v19[0] = &off_100878970;
    v18[0] = @"SystemEventDictKey_EventType";
    v18[1] = @"SystemEventDictKey_ResourceUsageLimitExceededValue";
    v9 = +[NSNumber numberWithBool:v5];
    v19[1] = v9;
    v18[2] = @"SystemEventDictKey_ConfigurationType";
    id v10 = NSStringFromClass(a4);
    v19[2] = v10;
    v11 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];

    v12 = [WeakRetained getInternalConnectionQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002F10EC;
    block[3] = &unk_100846588;
    id v16 = WeakRetained;
    id v17 = v11;
    id v13 = v11;
    dispatch_sync(v12, block);
  }
  else
  {
    id v14 = +[NSAssertionHandler currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"NISession.mm" lineNumber:2743 description:@"Parent session is nil"];
  }
}

- (void).cxx_destruct
{
}

@end