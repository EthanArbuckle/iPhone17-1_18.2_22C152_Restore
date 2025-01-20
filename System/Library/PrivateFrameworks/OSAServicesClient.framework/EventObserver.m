@interface EventObserver
- (BOOL)matches:(id)a3;
- (EventObserver)initWithObserver:(id)a3 bugTypes:(id)a4;
- (NSSet)bugTypes;
- (OSADiagnosticEventObserver)observer;
- (void)deliverEvent:(id)a3 on:(id)a4;
@end

@implementation EventObserver

- (EventObserver)initWithObserver:(id)a3 bugTypes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)EventObserver;
  v8 = [(EventObserver *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_observer, v6);
    uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
    bugTypes = v9->_bugTypes;
    v9->_bugTypes = (NSSet *)v10;
  }
  return v9;
}

- (BOOL)matches:(id)a3
{
  id v4 = a3;
  id v5 = [(EventObserver *)self observer];

  return v5 == v4;
}

- (void)deliverEvent:(id)a3 on:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  bugTypes = self->_bugTypes;
  v9 = [v6 identity];
  uint64_t v10 = [v9 bugType];
  LODWORD(bugTypes) = [(NSSet *)bugTypes containsObject:v10];

  if (bugTypes)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __33__EventObserver_deliverEvent_on___block_invoke;
    v11[3] = &unk_1E60C4580;
    v11[4] = self;
    id v12 = v6;
    dispatch_async(v7, v11);
  }
}

void __33__EventObserver_deliverEvent_on___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v2 = [*(id *)(a1 + 40) identity];
  v3 = [v2 incidentID];
  id v4 = [*(id *)(a1 + 40) identity];
  id v5 = [v4 bugType];
  id v6 = [*(id *)(a1 + 40) details];
  [WeakRetained didReceiveDiagnosticLog:v3 ofType:v5 details:v6];
}

- (OSADiagnosticEventObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (OSADiagnosticEventObserver *)WeakRetained;
}

- (NSSet)bugTypes
{
  return self->_bugTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bugTypes, 0);
  objc_destroyWeak((id *)&self->_observer);
}

@end