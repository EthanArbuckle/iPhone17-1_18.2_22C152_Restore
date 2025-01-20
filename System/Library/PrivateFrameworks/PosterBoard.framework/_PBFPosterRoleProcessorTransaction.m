@interface _PBFPosterRoleProcessorTransaction
+ (_PBFPosterRoleProcessorTransaction)transactionWithReason:(id)a3 context:(id)a4 userInfo:(id)a5 observers:(id)a6 processor:(id)a7;
- (BOOL)isInvalidated;
- (NSArray)emittedEvents;
- (NSArray)executedChanges;
- (NSArray)observers;
- (NSCountedSet)affectedRoles;
- (NSDictionary)userInfo;
- (NSString)description;
- (NSString)reason;
- (NSString)shortIdentifier;
- (PBFPosterRoleCoordinatorTransitionContext)context;
- (PBFPosterRoleProcessor)processor;
- (PBFPosterRoleProcessorResult)results;
- (_PBFPosterRoleProcessorTransaction)init;
- (void)appendEmittedEvent:(id)a3;
- (void)appendExecutedChange:(id)a3;
- (void)cancel;
- (void)invalidate;
- (void)setResults:(id)a3;
@end

@implementation _PBFPosterRoleProcessorTransaction

+ (_PBFPosterRoleProcessorTransaction)transactionWithReason:(id)a3 context:(id)a4 userInfo:(id)a5 observers:(id)a6 processor:(id)a7
{
  id v12 = a4;
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a3;
  v17 = objc_alloc_init(_PBFPosterRoleProcessorTransaction);
  objc_storeWeak((id *)&v17->_processor, v13);

  uint64_t v18 = [v16 copy];
  reason = v17->_reason;
  v17->_reason = (NSString *)v18;

  objc_storeStrong((id *)&v17->_context, a4);
  uint64_t v20 = [v15 copy];

  userInfo = v17->_userInfo;
  v17->_userInfo = (NSDictionary *)v20;

  v22 = objc_msgSend(v12, "pbf_transitionContextIdentifier");
  v23 = [v22 UUIDString];
  uint64_t v24 = [v23 substringToIndex:7];
  shortIdentifier = v17->_shortIdentifier;
  v17->_shortIdentifier = (NSString *)v24;

  uint64_t v26 = [v14 copy];
  observers = v17->_observers;
  v17->_observers = (NSArray *)v26;

  if (objc_opt_respondsToSelector())
  {
    v28 = objc_msgSend(v12, "pbf_transitionAffectedRoles");
    if ([v28 count]) {
      objc_storeStrong((id *)&v17->_affectedRoles, v28);
    }
  }
  return v17;
}

- (_PBFPosterRoleProcessorTransaction)init
{
  v14.receiver = self;
  v14.super_class = (Class)_PBFPosterRoleProcessorTransaction;
  v2 = [(_PBFPosterRoleProcessorTransaction *)&v14 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F4F688]) initWithFlag:0];
    cancelFlag = v2->_cancelFlag;
    v2->_cancelFlag = (BSAtomicFlag *)v3;

    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F4F688]) initWithFlag:0];
    invalidationFlag = v2->_invalidationFlag;
    v2->_invalidationFlag = (BSAtomicFlag *)v5;

    uint64_t v7 = objc_opt_new();
    executedChanges = v2->_executedChanges;
    v2->_executedChanges = (NSMutableArray *)v7;

    uint64_t v9 = objc_opt_new();
    emittedEvents = v2->_emittedEvents;
    v2->_emittedEvents = (NSMutableArray *)v9;

    uint64_t v11 = objc_opt_new();
    affectedRoles = v2->_affectedRoles;
    v2->_affectedRoles = (NSCountedSet *)v11;
  }
  return v2;
}

- (void)appendEmittedEvent:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(BSAtomicFlag *)self->_invalidationFlag getFlag] & 1) == 0
    && ([(BSAtomicFlag *)self->_cancelFlag getFlag] & 1) == 0)
  {
    [(NSMutableArray *)self->_emittedEvents addObject:v4];
  }
}

- (NSArray)emittedEvents
{
  v2 = (void *)[(NSMutableArray *)self->_emittedEvents copy];
  return (NSArray *)v2;
}

- (void)appendExecutedChange:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(BSAtomicFlag *)self->_invalidationFlag getFlag] & 1) == 0
    && ([(BSAtomicFlag *)self->_cancelFlag getFlag] & 1) == 0)
  {
    [(NSMutableArray *)self->_executedChanges addObject:v4];
  }
}

- (NSArray)executedChanges
{
  v2 = (void *)[(NSMutableArray *)self->_executedChanges copy];
  return (NSArray *)v2;
}

- (void)cancel
{
  if ([(BSAtomicFlag *)self->_cancelFlag setFlag:1])
  {
    [(NSMutableArray *)self->_executedChanges removeAllObjects];
    [(NSMutableArray *)self->_emittedEvents removeAllObjects];
    objc_storeWeak((id *)&self->_processor, 0);
  }
}

- (BOOL)isInvalidated
{
  return [(BSAtomicFlag *)self->_invalidationFlag getFlag];
}

- (void)invalidate
{
  if ([(BSAtomicFlag *)self->_invalidationFlag setFlag:1])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_processor);
    [WeakRetained noteTransactionWasInvalidated:self];
  }
}

- (NSString)description
{
  uint64_t v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[BSAtomicFlag getFlag](self->_invalidationFlag, "getFlag"), @"isInvalidated");
  id v5 = (id)objc_msgSend(v3, "appendBool:withName:", -[BSAtomicFlag getFlag](self->_cancelFlag, "getFlag"), @"isCancelled");
  id v6 = (id)[v3 appendObject:self->_context withName:@"context" skipIfNil:1];
  id v7 = (id)[v3 appendObject:self->_executedChanges withName:@"executedChanges" skipIfNil:1];
  id v8 = (id)[v3 appendObject:self->_emittedEvents withName:@"emittedEvents" skipIfNil:1];
  [v3 appendString:self->_reason withName:@"reason"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_processor);
  id v10 = (id)[v3 appendPointer:WeakRetained withName:@"owner"];

  uint64_t v11 = [v3 build];

  return (NSString *)v11;
}

- (NSString)reason
{
  return self->_reason;
}

- (PBFPosterRoleCoordinatorTransitionContext)context
{
  return self->_context;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (NSString)shortIdentifier
{
  return self->_shortIdentifier;
}

- (PBFPosterRoleProcessor)processor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_processor);
  return (PBFPosterRoleProcessor *)WeakRetained;
}

- (NSCountedSet)affectedRoles
{
  return (NSCountedSet *)objc_getProperty(self, a2, 80, 1);
}

- (NSArray)observers
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (PBFPosterRoleProcessorResult)results
{
  return (PBFPosterRoleProcessorResult *)objc_getProperty(self, a2, 96, 1);
}

- (void)setResults:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_affectedRoles, 0);
  objc_destroyWeak((id *)&self->_processor);
  objc_storeStrong((id *)&self->_shortIdentifier, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_cancelFlag, 0);
  objc_storeStrong((id *)&self->_invalidationFlag, 0);
  objc_storeStrong((id *)&self->_executedChanges, 0);
  objc_storeStrong((id *)&self->_emittedEvents, 0);
}

@end