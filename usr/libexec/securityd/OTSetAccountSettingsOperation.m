@interface OTSetAccountSettingsOperation
- (NSOperation)finishOp;
- (OTAccountSettings)settings;
- (OTOperationDependencies)deps;
- (OTSetAccountSettingsOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 settings:(id)a6;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setFinishOp:(id)a3;
- (void)setNextState:(id)a3;
- (void)setSettings:(id)a3;
@end

@implementation OTSetAccountSettingsOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishOp, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);

  objc_storeStrong((id *)&self->_nextState, 0);
}

- (void)setFinishOp:(id)a3
{
}

- (NSOperation)finishOp
{
  return (NSOperation *)objc_getProperty(self, a2, 160, 1);
}

- (void)setDeps:(id)a3
{
}

- (OTOperationDependencies)deps
{
  return (OTOperationDependencies *)objc_getProperty(self, a2, 152, 1);
}

- (void)setSettings:(id)a3
{
}

- (OTAccountSettings)settings
{
  return self->_settings;
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 136, 1);
}

- (void)setNextState:(id)a3
{
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 128, 1);
}

- (void)groupStart
{
  id v3 = objc_alloc_init((Class)NSOperation);
  [(OTSetAccountSettingsOperation *)self setFinishOp:v3];

  v4 = [(OTSetAccountSettingsOperation *)self finishOp];
  [(CKKSGroupOperation *)self dependOnBeforeGroupFinished:v4];

  v5 = [(OTSetAccountSettingsOperation *)self settings];

  if (v5)
  {
    if ([(OTAccountSettings *)self->_settings hasWalrus])
    {
      id v6 = [(OTAccountSettings *)self->_settings walrus];

      if (v6)
      {
        id v6 = objc_alloc_init((Class)TPPBPeerStableInfoSetting);
        v7 = [(OTSetAccountSettingsOperation *)self settings];
        v8 = [v7 walrus];
        [v6 setValue:[v8 enabled]];
      }
    }
    else
    {
      id v6 = 0;
    }
    if ([(OTAccountSettings *)self->_settings hasWebAccess])
    {
      id v10 = [(OTAccountSettings *)self->_settings webAccess];

      if (v10)
      {
        id v10 = objc_alloc_init((Class)TPPBPeerStableInfoSetting);
        v11 = [(OTSetAccountSettingsOperation *)self settings];
        v12 = [v11 webAccess];
        [v10 setValue:[v12 enabled]];
      }
    }
    else
    {
      id v10 = 0;
    }
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v13 = [(OTSetAccountSettingsOperation *)self deps];
    v14 = [v13 cuttlefishXPCWrapper];
    v15 = [(OTSetAccountSettingsOperation *)self deps];
    v16 = [v15 activeAccount];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1001D02D0;
    v18[3] = &unk_100306EC8;
    objc_copyWeak(&v19, &location);
    [v14 updateWithSpecificUser:v16 forceRefetch:0 deviceName:0 serialNumber:0 osVersion:0 policyVersion:0 policySecrets:0 syncUserControllableViews:0 secureElementIdentity:0 walrusSetting:v6 webAccess:v10 reply:v18];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else
  {
    v9 = [(OTSetAccountSettingsOperation *)self intendedState];
    [(OTSetAccountSettingsOperation *)self setNextState:v9];

    id v17 = [(OTSetAccountSettingsOperation *)self finishOp];
    [(CKKSGroupOperation *)self runBeforeGroupFinished:v17];
  }
}

- (OTSetAccountSettingsOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 settings:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)OTSetAccountSettingsOperation;
  v15 = [(CKKSGroupOperation *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_deps, a3);
    objc_storeStrong((id *)&v16->_settings, a6);
    objc_storeStrong((id *)&v16->_deps, a3);
    objc_storeStrong((id *)&v16->_intendedState, a4);
    objc_storeStrong((id *)&v16->_nextState, a5);
  }

  return v16;
}

@end