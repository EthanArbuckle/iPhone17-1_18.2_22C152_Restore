@interface PKIDSBatchIDQueryControllerWrapper
- (void)batchQueryController:(id)a3 updatedDestinationsStatus:(id)a4 onService:(id)a5 error:(id)a6;
- (void)reachableDestinationsForDestination:(id)a3 service:(id)a4 queue:(id)a5 completion:(id)a6;
@end

@implementation PKIDSBatchIDQueryControllerWrapper

- (void)reachableDestinationsForDestination:(id)a3 service:(id)a4 queue:(id)a5 completion:(id)a6
{
  v26[1] = *MEMORY[0x1E4F143B8];
  if (!self->_hasRunQuery)
  {
    self->_hasRunQuery = 1;
    v10 = (objc_class *)MEMORY[0x1E4F6AAD8];
    id v11 = a6;
    id v12 = a5;
    id v13 = a4;
    id v14 = a3;
    v15 = (IDSBatchIDQueryController *)[[v10 alloc] initWithService:v13 delegate:self queue:v12];

    batchIDQueryController = self->_batchIDQueryController;
    self->_batchIDQueryController = v15;

    v17 = PKIDSNormalizedAddress(v14);

    v18 = self->_batchIDQueryController;
    v26[0] = v17;
    v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
    [(IDSBatchIDQueryController *)v18 setDestinations:v19];

    v20 = _Block_copy(v11);
    id completion = self->_completion;
    self->_id completion = v20;

    objc_initWeak(&location, self);
    dispatch_time_t v22 = dispatch_time(0, 20000000000);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __99__PKIDSBatchIDQueryControllerWrapper_reachableDestinationsForDestination_service_queue_completion___block_invoke;
    v23[3] = &unk_1E56DD818;
    objc_copyWeak(&v24, &location);
    dispatch_after(v22, MEMORY[0x1E4F14428], v23);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
}

void __99__PKIDSBatchIDQueryControllerWrapper_reachableDestinationsForDestination_service_queue_completion___block_invoke(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained && WeakRetained[1])
  {
    v3 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "PKIDSBatchIDQueryControllerWrapper: ERROR timed out waiting for IDS batch query callback", v4, 2u);
    }

    (*(void (**)(void))(v2[1] + 16))();
  }
}

- (void)batchQueryController:(id)a3 updatedDestinationsStatus:(id)a4 onService:(id)a5 error:(id)a6
{
  if (self->_completion)
  {
    id v8 = a6;
    v9 = [a4 keysOfEntriesPassingTest:&__block_literal_global_112];
    id v12 = [v9 allObjects];

    id v10 = v12;
    if (v8) {
      id v10 = 0;
    }
    (*((void (**)(id, id, id))self->_completion + 2))(self->_completion, v10, v8);

    id completion = self->_completion;
    self->_id completion = 0;
  }
}

BOOL __101__PKIDSBatchIDQueryControllerWrapper_batchQueryController_updatedDestinationsStatus_onService_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 integerValue] == 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_batchIDQueryController, 0);
  objc_storeStrong(&self->_completion, 0);
}

@end