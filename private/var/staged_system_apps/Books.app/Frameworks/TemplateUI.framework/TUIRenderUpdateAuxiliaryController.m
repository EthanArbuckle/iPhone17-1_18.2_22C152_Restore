@interface TUIRenderUpdateAuxiliaryController
- (OS_dispatch_queue)accessQueue;
- (TUIRenderModelAuxiliary)currentModel;
- (TUIRenderUpdateAuxiliaryController)init;
- (TUIRenderUpdateAuxiliaryControllerDelegate)delegate;
- (id)registerDelegate:(id)a3;
- (void)unregisterDelegate:(id)a3;
- (void)updateWithRenderModel:(id)a3 transactionGroup:(id)a4;
@end

@implementation TUIRenderUpdateAuxiliaryController

- (TUIRenderUpdateAuxiliaryController)init
{
  v8.receiver = self;
  v8.super_class = (Class)TUIRenderUpdateAuxiliaryController;
  v2 = [(TUIRenderUpdateAuxiliaryController *)&v8 init];
  v3 = v2;
  if (v2)
  {
    currentModel = v2->_currentModel;
    v2->_currentModel = 0;

    dispatch_queue_t v5 = dispatch_queue_create("TUIRenderUpdateAuxiliaryController.accessQueue", 0);
    accessQueue = v3->_accessQueue;
    v3->_accessQueue = (OS_dispatch_queue *)v5;
  }
  return v3;
}

- (id)registerDelegate:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = sub_F9444;
  v16 = sub_F9454;
  id v17 = 0;
  accessQueue = self->_accessQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_F945C;
  block[3] = &unk_251800;
  block[4] = self;
  id v10 = v4;
  v11 = &v12;
  id v6 = v4;
  dispatch_sync(accessQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)unregisterDelegate:(id)a3
{
  id v4 = a3;
  accessQueue = self->_accessQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_F9544;
  v7[3] = &unk_251828;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync(accessQueue, v7);
}

- (void)updateWithRenderModel:(id)a3 transactionGroup:(id)a4
{
  v9 = (TUIRenderModelAuxiliary *)a3;
  id v7 = a4;
  if (self->_currentModel != v9 || ![(TUIRenderModelAuxiliary *)v9 isEqualToRenderModel:v9])
  {
    objc_storeStrong((id *)&self->_currentModel, a3);
    id v8 = [(TUIRenderUpdateAuxiliaryController *)self delegate];
    [v8 applyUpdate:v9];
  }
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (TUIRenderUpdateAuxiliaryControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TUIRenderUpdateAuxiliaryControllerDelegate *)WeakRetained;
}

- (TUIRenderModelAuxiliary)currentModel
{
  return self->_currentModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentModel, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_accessQueue, 0);
}

@end