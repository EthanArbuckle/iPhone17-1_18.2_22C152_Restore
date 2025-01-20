@interface CKKSFixupLocalReloadOperation
- (CKKSFixupLocalReloadOperation)initWithOperationDependencies:(id)a3 fixupNumber:(unint64_t)a4 ckoperationGroup:(id)a5 entering:(id)a6;
- (CKKSOperationDependencies)deps;
- (CKOperationGroup)group;
- (OctagonStateString)intendedState;
- (OctagonStateString)nextState;
- (id)description;
- (unint64_t)fixupNumber;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setFixupNumber:(unint64_t)a3;
- (void)setGroup:(id)a3;
- (void)setNextState:(id)a3;
@end

@implementation CKKSFixupLocalReloadOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_nextState, 0);

  objc_storeStrong((id *)&self->_intendedState, 0);
}

- (void)setFixupNumber:(unint64_t)a3
{
  self->_fixupNumber = a3;
}

- (unint64_t)fixupNumber
{
  return self->_fixupNumber;
}

- (void)setGroup:(id)a3
{
}

- (CKOperationGroup)group
{
  return (CKOperationGroup *)objc_getProperty(self, a2, 152, 1);
}

- (void)setDeps:(id)a3
{
}

- (CKKSOperationDependencies)deps
{
  return (CKKSOperationDependencies *)objc_getProperty(self, a2, 144, 1);
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
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3 = [CKKSReloadAllItemsOperation alloc];
  v4 = [(CKKSFixupLocalReloadOperation *)self deps];
  v5 = [(CKKSReloadAllItemsOperation *)v3 initWithOperationDependencies:v4];

  [(CKKSGroupOperation *)self runBeforeGroupFinished:v5];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10016013C;
  v8[3] = &unk_100306AD0;
  objc_copyWeak(&v10, &location);
  v6 = v5;
  v9 = v6;
  v7 = +[CKKSResultOperation named:@"local-reload-cleanup" withBlock:v8];
  [v7 addNullableDependency:v6];
  [(CKKSGroupOperation *)self runBeforeGroupFinished:v7];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (id)description
{
  unint64_t v3 = [(CKKSFixupLocalReloadOperation *)self fixupNumber];
  v4 = [(CKKSFixupLocalReloadOperation *)self deps];
  v5 = [v4 views];
  v6 = +[NSString stringWithFormat:@"<CKKSFixup:LocalReload (%d)(%@)>", v3, v5];

  return v6;
}

- (CKKSFixupLocalReloadOperation)initWithOperationDependencies:(id)a3 fixupNumber:(unint64_t)a4 ckoperationGroup:(id)a5 entering:(id)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)CKKSFixupLocalReloadOperation;
  v14 = [(CKKSGroupOperation *)&v17 init];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_deps, a3);
    v15->_fixupNumber = a4;
    objc_storeStrong((id *)&v15->_group, a5);
    objc_storeStrong((id *)&v15->_intendedState, a6);
    objc_storeStrong((id *)&v15->_nextState, @"error");
  }

  return v15;
}

@end