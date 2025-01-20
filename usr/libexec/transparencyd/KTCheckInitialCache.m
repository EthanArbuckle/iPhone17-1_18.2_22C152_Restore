@interface KTCheckInitialCache
- (KTCheckInitialCache)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 stateMachine:(id)a6;
- (KTStateString)intendedState;
- (KTStateString)nextState;
- (void)setNextState:(id)a3;
- (void)setPendingFlag:(id)a3 stateMachine:(id)a4;
@end

@implementation KTCheckInitialCache

- (void)setPendingFlag:(id)a3 stateMachine:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[KTPendingFlag alloc] initWithFlag:v6 conditions:2 delayInSeconds:60.0];

  [v5 _onqueueHandlePendingFlagLater:v7];
}

- (KTCheckInitialCache)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 stateMachine:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  v21.receiver = self;
  v21.super_class = (Class)KTCheckInitialCache;
  v12 = [(KTGroupOperation *)&v21 init];
  v13 = v12;
  if (v12)
  {
    [(KTCheckInitialCache *)v12 setNextState:v10];
    v14 = [v9 smDataStore];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10017065C;
    v18[3] = &unk_1002C3490;
    v15 = v13;
    v19 = v15;
    id v20 = v11;
    [v14 fetchIDMSDeviceList:v18];

    v16 = v15;
  }

  return v13;
}

- (KTStateString)intendedState
{
  return (KTStateString *)objc_getProperty(self, a2, 120, 1);
}

- (KTStateString)nextState
{
  return (KTStateString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setNextState:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextState, 0);

  objc_storeStrong((id *)&self->_intendedState, 0);
}

@end