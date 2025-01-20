@interface TUSimulatedIDSBatchIDQueryController
- (IDSBatchIDQueryControllerDelegate)delegate;
- (NSString)serviceName;
- (OS_dispatch_queue)queue;
- (TUSimulatedIDSBatchIDQueryController)initWithService:(id)a3 delegate:(id)a4 queue:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setDestinations:(id)a3;
- (void)setQueue:(id)a3;
- (void)setServiceName:(id)a3;
@end

@implementation TUSimulatedIDSBatchIDQueryController

- (TUSimulatedIDSBatchIDQueryController)initWithService:(id)a3 delegate:(id)a4 queue:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = (OS_dispatch_queue *)a5;
  v15.receiver = self;
  v15.super_class = (Class)TUSimulatedIDSBatchIDQueryController;
  v12 = [(TUSimulatedIDSBatchIDQueryController *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_serviceName, a3);
    objc_storeWeak((id *)&v13->_delegate, v10);
    v13->_queue = v11;
  }

  return v13;
}

- (void)setDestinations:(id)a3
{
  id v4 = a3;
  v5 = [(TUSimulatedIDSBatchIDQueryController *)self queue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__TUSimulatedIDSBatchIDQueryController_setDestinations___block_invoke;
  v7[3] = &unk_1E58E5C08;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __56__TUSimulatedIDSBatchIDQueryController_setDestinations___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) delegate];
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = _validDictionaryForDestinations(*(void **)(a1 + 40));
  id v4 = [*(id *)(a1 + 32) serviceName];
  [v5 batchQueryController:v2 updatedDestinationsStatus:v3 onService:v4 error:0];
}

- (NSString)serviceName
{
  return self->_serviceName;
}

- (void)setServiceName:(id)a3
{
}

- (IDSBatchIDQueryControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IDSBatchIDQueryControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  self->_queue = (OS_dispatch_queue *)a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_serviceName, 0);
}

@end