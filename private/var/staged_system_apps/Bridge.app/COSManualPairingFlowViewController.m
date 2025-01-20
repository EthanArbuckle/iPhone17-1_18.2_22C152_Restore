@interface COSManualPairingFlowViewController
- (COSManualPairingDelegate)pairingDelegate;
- (COSManualPairingFlowViewController)init;
- (COSManualPairingViewController)securePairingController;
- (Class)pairingControllerClass;
- (void)controllerCancelled:(id)a3;
- (void)setPairingDelegate:(id)a3;
@end

@implementation COSManualPairingFlowViewController

- (COSManualPairingFlowViewController)init
{
  id v3 = [objc_alloc(-[COSManualPairingFlowViewController pairingControllerClass](self, "pairingControllerClass")) initWithStyle:2];
  v10.receiver = self;
  v10.super_class = (Class)COSManualPairingFlowViewController;
  v4 = [(COSManualPairingFlowViewController *)&v10 initWithRootViewController:v3];
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_securePairingController, v3);
    v6 = [(COSManualPairingFlowViewController *)v5 navigationBar];
    sub_100031568(v6);

    v7 = [(COSManualPairingFlowViewController *)v5 view];
    v8 = BPSBackgroundColor();
    [v7 setBackgroundColor:v8];
  }
  return v5;
}

- (void)controllerCancelled:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pairingDelegate);
  [WeakRetained didCancelManualPairing];
}

- (Class)pairingControllerClass
{
  v2 = pbb_bridge_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[COSManualPairingFlowViewController pairingControllerClass]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s should be overridden by subclasses", (uint8_t *)&v4, 0xCu);
  }

  return 0;
}

- (COSManualPairingDelegate)pairingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pairingDelegate);

  return (COSManualPairingDelegate *)WeakRetained;
}

- (void)setPairingDelegate:(id)a3
{
}

- (COSManualPairingViewController)securePairingController
{
  return self->_securePairingController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_securePairingController, 0);

  objc_destroyWeak((id *)&self->_pairingDelegate);
}

@end