@interface OTRemovePeersOperation
- (NSOperation)finishedOp;
- (NSSet)peerIDs;
- (OTOperationDependencies)deps;
- (OTRemovePeersOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 peerIDs:(id)a6;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setNextState:(id)a3;
- (void)setPeerIDs:(id)a3;
@end

@implementation OTRemovePeersOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_peerIDs, 0);
  objc_storeStrong((id *)&self->_nextState, 0);

  objc_storeStrong((id *)&self->_intendedState, 0);
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

- (void)setPeerIDs:(id)a3
{
}

- (NSSet)peerIDs
{
  return (NSSet *)objc_getProperty(self, a2, 144, 1);
}

- (void)setNextState:(id)a3
{
}

- (OctagonStateString)nextState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 136, 1);
}

- (OctagonStateString)intendedState
{
  return (OctagonStateString *)objc_getProperty(self, a2, 128, 1);
}

- (void)groupStart
{
  v3 = sub_10000B070("octagon");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = [(OTRemovePeersOperation *)self peerIDs];
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Attempting to remove peers: %@", buf, 0xCu);
  }
  id v5 = objc_alloc_init((Class)NSOperation);
  [(OTRemovePeersOperation *)self setFinishedOp:v5];

  v6 = [(OTRemovePeersOperation *)self finishedOp];
  [(CKKSGroupOperation *)self dependOnBeforeGroupFinished:v6];

  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  v7 = [(OTRemovePeersOperation *)self deps];
  v8 = [v7 cuttlefishXPCWrapper];
  v9 = [(OTRemovePeersOperation *)self deps];
  v10 = [v9 activeAccount];
  v11 = [(OTRemovePeersOperation *)self peerIDs];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100163520;
  v12[3] = &unk_100307258;
  objc_copyWeak(&v13, (id *)buf);
  [v8 distrustPeerIDsWithSpecificUser:v10 peerIDs:v11 reply:v12];

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

- (OTRemovePeersOperation)initWithDependencies:(id)a3 intendedState:(id)a4 errorState:(id)a5 peerIDs:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)OTRemovePeersOperation;
  v15 = [(CKKSGroupOperation *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_deps, a3);
    objc_storeStrong((id *)&v16->_intendedState, a4);
    objc_storeStrong((id *)&v16->_nextState, a5);
    uint64_t v17 = +[NSSet setWithArray:v14];
    peerIDs = v16->_peerIDs;
    v16->_peerIDs = (NSSet *)v17;
  }
  return v16;
}

@end