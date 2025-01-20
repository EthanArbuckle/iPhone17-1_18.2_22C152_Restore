@interface PXSystemAVResourceReclamationController
- (AVResourceReclamationController)systemController;
- (AVResourceReclamationEventObserverToken)observerToken;
- (PXSystemAVResourceReclamationController)init;
- (id)takeAssertionPreventingResourceReclamationWithReason:(id)a3;
- (void)_handleMediaServicesWereResetNotification:(id)a3;
- (void)reclamationController:(id)a3 didReclaimObjectsWithEvent:(id)a4;
@end

@implementation PXSystemAVResourceReclamationController

- (PXSystemAVResourceReclamationController)init
{
  v17.receiver = self;
  v17.super_class = (Class)PXSystemAVResourceReclamationController;
  v2 = [(PXConcreteAVResourceReclamationController *)&v17 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v4 = *MEMORY[0x263EF90F8];
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    v13 = __47__PXSystemAVResourceReclamationController_init__block_invoke;
    v14 = &unk_265454FB0;
    objc_copyWeak(&v15, &location);
    id v5 = (id)[v3 addObserverForName:v4 object:0 queue:0 usingBlock:&v11];

    uint64_t v6 = objc_msgSend(MEMORY[0x263EFA868], "defaultController", v11, v12, v13, v14);
    systemController = v2->_systemController;
    v2->_systemController = (AVResourceReclamationController *)v6;

    if (PLIsMobileSlideShow()) {
      [(AVResourceReclamationController *)v2->_systemController permitReclamationWhileSuspended];
    }
    uint64_t v8 = [(AVResourceReclamationController *)v2->_systemController addReclamationEventObserver:v2];
    observerToken = v2->_observerToken;
    v2->_observerToken = (AVResourceReclamationEventObserverToken *)v8;

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observerToken, 0);
  objc_storeStrong((id *)&self->_systemController, 0);
}

- (AVResourceReclamationEventObserverToken)observerToken
{
  return self->_observerToken;
}

- (AVResourceReclamationController)systemController
{
  return self->_systemController;
}

- (void)reclamationController:(id)a3 didReclaimObjectsWithEvent:(id)a4
{
}

- (id)takeAssertionPreventingResourceReclamationWithReason:(id)a3
{
  id v4 = a3;
  id v5 = [(PXSystemAVResourceReclamationController *)self systemController];
  uint64_t v6 = [v5 takeAssertionPreventingResourceReclamationWithReason:v4];

  return v6;
}

- (void)_handleMediaServicesWereResetNotification:(id)a3
{
  ++_handleMediaServicesWereResetNotification__mediaServicesResetCount;
  id v4 = [NSString alloc];
  id v5 = (id)objc_msgSend(v4, "initWithFormat:", @"AVMediaServicesReset-%d", _handleMediaServicesWereResetNotification__mediaServicesResetCount);
  [(PXConcreteAVResourceReclamationController *)self reclamationEventDidOccur:v5];
}

void __47__PXSystemAVResourceReclamationController_init__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleMediaServicesWereResetNotification:v3];
}

@end