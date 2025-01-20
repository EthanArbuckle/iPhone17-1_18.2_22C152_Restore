@interface _TUITransactionAutoProxy
- (BOOL)isCommittedAndIfNotNotifyWithBlock:(id)a3;
- (NSDate)creationDate;
- (TUITransactionDependencyToken)dependencyToken;
- (TUITransactionOptions)options;
- (_TUITransaction)tx;
- (_TUITransactionAutoProxy)initWithTransaction:(id)a3;
- (unint64_t)flags;
- (void)addCategory:(id)a3;
- (void)addCompletion:(id)a3 queue:(id)a4;
- (void)addCompletionDeferral;
- (void)addSubTransaction:(id)a3 completionQueue:(id)a4;
- (void)addSubTransactionCompletion:(id)a3 queue:(id)a4;
- (void)addSubTransactionCompletionDeferral;
- (void)commit;
- (void)dealloc;
- (void)dependentOn:(id)a3;
- (void)removeCompletionDeferral;
- (void)removeSubTransactionCompletionDeferral;
@end

@implementation _TUITransactionAutoProxy

- (_TUITransactionAutoProxy)initWithTransaction:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TUITransactionAutoProxy;
  v6 = [(_TUITransactionAutoProxy *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_tx, a3);
  }

  return v7;
}

- (void)dealloc
{
  [(_TUITransaction *)self->_tx commit];
  v3.receiver = self;
  v3.super_class = (Class)_TUITransactionAutoProxy;
  [(_TUITransactionAutoProxy *)&v3 dealloc];
}

- (NSDate)creationDate
{
  return [(_TUITransaction *)self->_tx creationDate];
}

- (TUITransactionOptions)options
{
  return [(_TUITransaction *)self->_tx options];
}

- (unint64_t)flags
{
  return [(_TUITransaction *)self->_tx flags];
}

- (void)addCategory:(id)a3
{
}

- (void)addCompletion:(id)a3 queue:(id)a4
{
}

- (void)addCompletionDeferral
{
}

- (void)addSubTransaction:(id)a3 completionQueue:(id)a4
{
}

- (void)addSubTransactionCompletion:(id)a3 queue:(id)a4
{
}

- (void)commit
{
}

- (TUITransactionDependencyToken)dependencyToken
{
  return [(_TUITransaction *)self->_tx dependencyToken];
}

- (void)dependentOn:(id)a3
{
}

- (void)removeCompletionDeferral
{
}

- (void)addSubTransactionCompletionDeferral
{
}

- (void)removeSubTransactionCompletionDeferral
{
}

- (BOOL)isCommittedAndIfNotNotifyWithBlock:(id)a3
{
  return [(_TUITransaction *)self->_tx isCommittedAndIfNotNotifyWithBlock:a3];
}

- (_TUITransaction)tx
{
  return self->_tx;
}

- (void).cxx_destruct
{
}

@end