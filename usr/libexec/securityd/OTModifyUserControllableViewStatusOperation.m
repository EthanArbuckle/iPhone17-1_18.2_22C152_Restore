@interface OTModifyUserControllableViewStatusOperation
- (OTModifyUserControllableViewStatusOperation)initWithDependencies:(id)a3 intendedViewStatus:(int)a4 intendedState:(id)a5 peerMissingState:(id)a6 errorState:(id)a7;
- (OTOperationDependencies)deps;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (OctagonStateString)peerMissingState;
- (int)intendedViewStatus;
- (void)groupStart;
- (void)performWithStatus:(int)a3;
- (void)setDeps:(id)a3;
- (void)setIntendedViewStatus:(int)a3;
- (void)setNextState:(id)a3;
- (void)setPeerMissingState:(id)a3;
@end

@implementation OTModifyUserControllableViewStatusOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_deps + 4), 0);
  objc_storeStrong((id *)((char *)&self->_nextState + 4), 0);
  objc_storeStrong((id *)((char *)&self->_intendedState + 4), 0);

  objc_storeStrong((id *)(&self->_intendedViewStatus + 1), 0);
}

- (void)setIntendedViewStatus:(int)a3
{
  self->_intendedViewStatus = a3;
}

- (int)intendedViewStatus
{
  return self->_intendedViewStatus;
}

- (void)setPeerMissingState:(id)a3
{
}

- (OctagonStateString)peerMissingState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 156, 1);
}

- (void)setDeps:(id)a3
{
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 148, 1);
}

- (void)setNextState:(id)a3
{
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 140, 1);
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 132, 1);
}

- (void)performWithStatus:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v5 = sub_10000B070("octagon-ckks");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(OTModifyUserControllableViewStatusOperation *)self intendedViewStatus];
    if (v6 >= 4)
    {
      v7 = +[NSString stringWithFormat:@"(unknown: %i)", v6];
    }
    else
    {
      v7 = *(&off_1002F7DA0 + v6);
    }
    *(_DWORD *)buf = 138412290;
    v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting user-controllable views to %@", buf, 0xCu);
  }
  v8 = [(OTModifyUserControllableViewStatusOperation *)self deps];
  v9 = [v8 cuttlefishXPCWrapper];
  v10 = [(OTModifyUserControllableViewStatusOperation *)self deps];
  v11 = [v10 activeAccount];
  v12 = +[NSNumber numberWithInt:v3];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10003A5E0;
  v13[3] = &unk_100306EC8;
  objc_copyWeak(&v14, &location);
  [v9 updateWithSpecificUser:v11 forceRefetch:0 deviceName:0 serialNumber:0 osVersion:0 policyVersion:0 policySecrets:0 syncUserControllableViews:v12 secureElementIdentity:0 walrusSetting:0 webAccess:0 reply:v13];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)groupStart
{
  if ([(OTModifyUserControllableViewStatusOperation *)self intendedViewStatus] == 3)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    uint64_t v3 = [(OTModifyUserControllableViewStatusOperation *)self deps];
    v4 = [v3 sosAdapter];
    unsigned int v5 = [v4 sosEnabled];

    if (v5)
    {
      uint64_t v6 = [(OTModifyUserControllableViewStatusOperation *)self deps];
      v7 = [v6 sosAdapter];
      id v28 = 0;
      unsigned int v8 = [v7 safariViewSyncingEnabled:&v28];
      v9 = (__CFString *)v28;

      if (v9)
      {
        v10 = sub_10000B070("SecError");
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v31 = v9;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "octagon-ckks: Unable to fetch SOS Safari view status: %@", buf, 0xCu);
        }

        [(CKKSResultOperation *)self setError:v9];
      }
      else
      {
        v22 = sub_10000B070("octagon-ckks");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          CFStringRef v23 = @"disabled";
          if (v8) {
            CFStringRef v23 = @"enabled";
          }
          *(_DWORD *)buf = 138412290;
          CFStringRef v31 = v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Currently SOS believes the safari view is '%@'", buf, 0xCu);
        }

        if (v8) {
          uint64_t v24 = 2;
        }
        else {
          uint64_t v24 = 1;
        }
        [(OTModifyUserControllableViewStatusOperation *)self performWithStatus:v24];
        v9 = 0;
      }
    }
    else
    {
      v12 = [(OTModifyUserControllableViewStatusOperation *)self deps];
      v13 = [v12 stateHolder];
      id v27 = 0;
      id v14 = [v13 loadOrCreateAccountMetadata:&v27];
      v9 = (__CFString *)v27;

      if (!v14 || v9)
      {
        v16 = sub_10000B070("octagon-ckks");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v31 = v9;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Failed to load account metadata: %@", buf, 0xCu);
        }

        id v15 = 0;
      }
      else
      {
        id v15 = [v14 isInheritedAccount];
      }
      v17 = sub_10000B070("octagon-ckks");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Determining peers' user-controllable views policy", buf, 2u);
      }

      v18 = [(OTModifyUserControllableViewStatusOperation *)self deps];
      v19 = [v18 cuttlefishXPCWrapper];
      v20 = [(OTModifyUserControllableViewStatusOperation *)self deps];
      v21 = [v20 activeAccount];
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10003AF08;
      v25[3] = &unk_1002FA7B8;
      objc_copyWeak(&v26, &location);
      [v19 fetchCurrentPolicyWithSpecificUser:v21 modelIDOverride:0 isInheritedAccount:v15 reply:v25];

      objc_destroyWeak(&v26);
    }

    objc_destroyWeak(&location);
  }
  else
  {
    uint64_t v11 = [(OTModifyUserControllableViewStatusOperation *)self intendedViewStatus];
    [(OTModifyUserControllableViewStatusOperation *)self performWithStatus:v11];
  }
}

- (OTModifyUserControllableViewStatusOperation)initWithDependencies:(id)a3 intendedViewStatus:(int)a4 intendedState:(id)a5 peerMissingState:(id)a6 errorState:(id)a7
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v20.receiver = self;
  v20.super_class = (Class)OTModifyUserControllableViewStatusOperation;
  v17 = [(CKKSGroupOperation *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)(v17 + 148), a3);
    *((_DWORD *)v18 + 32) = a4;
    objc_storeStrong((id *)(v18 + 132), a5);
    objc_storeStrong((id *)(v18 + 156), a6);
    objc_storeStrong((id *)(v18 + 140), a7);
  }

  return (OTModifyUserControllableViewStatusOperation *)v18;
}

@end