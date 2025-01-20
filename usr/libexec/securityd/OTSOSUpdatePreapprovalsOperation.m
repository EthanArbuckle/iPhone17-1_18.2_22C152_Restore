@interface OTSOSUpdatePreapprovalsOperation
- (NSOperation)finishedOp;
- (OTOperationDependencies)deps;
- (OTSOSUpdatePreapprovalsOperation)initWithDependencies:(id)a3 intendedState:(id)a4 sosNotPresentState:(id)a5 errorState:(id)a6;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (OctagonStateString)sosNotPresentState;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setNextState:(id)a3;
- (void)setSosNotPresentState:(id)a3;
@end

@implementation OTSOSUpdatePreapprovalsOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_sosNotPresentState, 0);
  objc_storeStrong((id *)&self->_intendedState, 0);

  objc_storeStrong((id *)&self->_nextState, 0);
}

- (void)setFinishedOp:(id)a3
{
}

- (NSOperation)finishedOp
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

- (void)setSosNotPresentState:(id)a3
{
}

- (OctagonStateString)sosNotPresentState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 144, 1);
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
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = [(OTSOSUpdatePreapprovalsOperation *)self deps];
  v4 = [v3 sosAdapter];
  unsigned __int8 v5 = [v4 sosEnabled];

  if (v5)
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000CD388;
    v24[3] = &unk_1003077A0;
    objc_copyWeak(&v25, &location);
    v6 = +[NSBlockOperation blockOperationWithBlock:v24];
    [(OTSOSUpdatePreapprovalsOperation *)self setFinishedOp:v6];

    v7 = [(OTSOSUpdatePreapprovalsOperation *)self finishedOp];
    [(CKKSGroupOperation *)self dependOnBeforeGroupFinished:v7];

    v8 = [(OTSOSUpdatePreapprovalsOperation *)self deps];
    v9 = [v8 sosAdapter];
    id v23 = 0;
    v10 = +[OTSOSAdapterHelpers peerPublicSigningKeySPKIsForCircle:v9 error:&v23];
    id v11 = v23;

    if (!v10 || v11)
    {
      v18 = sub_10000B070("SecError");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v11;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "octagon-sos: Can't fetch trusted peers; stopping preapproved key update: %@",
          buf,
          0xCu);
      }

      [(CKKSResultOperation *)self setError:v11];
      v19 = [(OTSOSUpdatePreapprovalsOperation *)self sosNotPresentState];
      [(OTSOSUpdatePreapprovalsOperation *)self setNextState:v19];

      v20 = [(OTSOSUpdatePreapprovalsOperation *)self finishedOp];
      [(CKKSGroupOperation *)self runBeforeGroupFinished:v20];
    }
    else
    {
      v12 = sub_10000B070("octagon-sos");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v10;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Updating SOS preapproved keys to %@", buf, 0xCu);
      }

      v13 = [(OTSOSUpdatePreapprovalsOperation *)self deps];
      v14 = [v13 cuttlefishXPCWrapper];
      v15 = [(OTSOSUpdatePreapprovalsOperation *)self deps];
      v16 = [v15 activeAccount];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1000CD57C;
      v21[3] = &unk_1002F96E8;
      objc_copyWeak(&v22, &location);
      [v14 setPreapprovedKeysWithSpecificUser:v16 preapprovedKeys:v10 reply:v21];

      objc_destroyWeak(&v22);
    }

    objc_destroyWeak(&v25);
  }
  else
  {
    v17 = sub_10000B070("octagon-sos");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "SOS not enabled on this platform?", buf, 2u);
    }
  }
  objc_destroyWeak(&location);
}

- (OTSOSUpdatePreapprovalsOperation)initWithDependencies:(id)a3 intendedState:(id)a4 sosNotPresentState:(id)a5 errorState:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)OTSOSUpdatePreapprovalsOperation;
  v15 = [(CKKSGroupOperation *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_deps, a3);
    objc_storeStrong((id *)&v16->_intendedState, a4);
    objc_storeStrong((id *)&v16->_sosNotPresentState, a5);
    objc_storeStrong((id *)&v16->_nextState, a6);
  }

  return v16;
}

@end