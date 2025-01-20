@interface CLAvengerScannerClient
- (BOOL)getOptedIn;
- (BOOL)hasPowerAssertion;
- (BOOL)isScanning;
- (BOOL)performNotOptedInBOMScan;
- (BOOL)performTemporaryAggressiveScan;
- (BOOL)performTemporaryHawkeyeLowEnergyScan;
- (BOOL)performTemporaryLongAggressiveScan;
- (BOOL)poweredOn;
- (BOOL)startBTFindingScan;
- (BOOL)stopBTFindingScan;
- (BOOL)stopTemporaryLongAggressiveScan;
- (CBCentralManager)centralManager;
- (CLAvengerReconciler)reconciler;
- (CLAvengerScannerClient)initWithDelegate:(id)a3 queue:(id)a4;
- (CLAvengerScannerClient)initWithDelegate:(id)a3 queue:(id)a4 optedIn:(BOOL)a5;
- (CLAvengerScannerClientController)controller;
- (CLAvengerScannerClientDelegateProtocol)delegate;
- (OS_dispatch_queue)queue;
- (id).cxx_construct;
- (id)clientIdentifier;
- (id)getPowerAssertionIdentifier;
- (void)centralManager:(id)a3 didDiscoverMultiplePeripherals:(id)a4;
- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6;
- (void)centralManager:(id)a3 didFailToScanWithError:(id)a4;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)dealloc;
- (void)onAdvertisementBufferEmptied;
- (void)onAggressiveScanEnded;
- (void)onAggressiveScanStarted;
- (void)onAvengerAdvertisement:(id)a3 reconciledInformation:(id)a4;
- (void)onNotOptedInBOMScanEnded;
- (void)onUpdatedPowerState;
- (void)releasePowerAssertion;
- (void)setCentralManager:(id)a3;
- (void)setController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setOptedIn:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setReconciler:(id)a3;
- (void)takePowerAssertion;
@end

@implementation CLAvengerScannerClient

- (void)onAvengerAdvertisement:(id)a3 reconciledInformation:(id)a4
{
  v6 = [(CLAvengerScannerClient *)self delegate];

  [(CLAvengerScannerClientDelegateProtocol *)v6 onAvengerAdvertisement:a3 reconciledInformation:a4];
}

- (CLAvengerScannerClientDelegateProtocol)delegate
{
  return (CLAvengerScannerClientDelegateProtocol *)objc_loadWeak((id *)&self->_delegate);
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  v10 = [(CLAvengerScannerClient *)self controller];
  v11 = [(CLAvengerScannerClient *)self centralManager];

  [(CLAvengerScannerClientController *)v10 centralManager:v11 didDiscoverPeripheral:a4 advertisementData:a5 RSSI:a6];
}

- (CLAvengerScannerClientController)controller
{
  return self->_controller;
}

- (CBCentralManager)centralManager
{
  return self->_centralManager;
}

- (CLAvengerScannerClient)initWithDelegate:(id)a3 queue:(id)a4
{
  return [(CLAvengerScannerClient *)self initWithDelegate:a3 queue:a4 optedIn:0];
}

- (CLAvengerScannerClient)initWithDelegate:(id)a3 queue:(id)a4 optedIn:(BOOL)a5
{
  BOOL v5 = a5;
  v13.receiver = self;
  v13.super_class = (Class)CLAvengerScannerClient;
  v8 = [(CLAvengerScannerClient *)&v13 init];
  result = 0;
  if (a3 && v8)
  {
    objc_storeWeak((id *)&v8->_delegate, a3);
    v8->_queue = (OS_dispatch_queue *)a4;
    id v10 = objc_alloc((Class)CBCentralManager);
    queue = v8->_queue;
    uint64_t v14 = CBManagerNeedsRestrictedStateOperation;
    v15 = &__kCFBooleanTrue;
    v8->_centralManager = (CBCentralManager *)[v10 initWithDelegate:v8 queue:queue options:+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1)];
    v8->_reconciler = [[CLAvengerReconciler alloc] initWithQueue:v8->_queue];
    value = v8->_powerAssertion.__ptr_.__value_;
    v8->_powerAssertion.__ptr_.__value_ = 0;
    if (value) {
      (*(void (**)(CLPowerAssertion *))(*(void *)value + 8))(value);
    }
    v8->_controller = [[CLAvengerScannerClientController alloc] initWithDelegate:v8 centralManager:v8->_centralManager optedIn:v5 reconciler:v8->_reconciler queue:v8->_queue powerAssertionDelegate:v8];
    return v8;
  }
  return result;
}

- (void)dealloc
{
  self->_centralManager = 0;
  self->_controller = 0;

  self->_reconciler = 0;
  v3.receiver = self;
  v3.super_class = (Class)CLAvengerScannerClient;
  [(CLAvengerScannerClient *)&v3 dealloc];
}

- (BOOL)performTemporaryAggressiveScan
{
  v2 = [(CLAvengerScannerClient *)self controller];

  return [(CLAvengerScannerClientController *)v2 performTemporaryAggressiveScan];
}

- (BOOL)performTemporaryLongAggressiveScan
{
  v2 = [(CLAvengerScannerClient *)self controller];

  return [(CLAvengerScannerClientController *)v2 performTemporaryLongAggressiveScan];
}

- (BOOL)stopTemporaryLongAggressiveScan
{
  v2 = [(CLAvengerScannerClient *)self controller];

  return [(CLAvengerScannerClientController *)v2 stopTemporaryLongAggressiveScan];
}

- (BOOL)performTemporaryHawkeyeLowEnergyScan
{
  v2 = [(CLAvengerScannerClient *)self controller];

  return [(CLAvengerScannerClientController *)v2 performTemporaryHawkeyeLowEnergyScan];
}

- (BOOL)startBTFindingScan
{
  v2 = [(CLAvengerScannerClient *)self controller];

  return [(CLAvengerScannerClientController *)v2 startBTFindingScan];
}

- (BOOL)stopBTFindingScan
{
  v2 = [(CLAvengerScannerClient *)self controller];

  return [(CLAvengerScannerClientController *)v2 stopBTFindingScan];
}

- (BOOL)isScanning
{
  v2 = [(CLAvengerScannerClient *)self controller];

  return [(CLAvengerScannerClientController *)v2 isScanning];
}

- (BOOL)getOptedIn
{
  v2 = [(CLAvengerScannerClient *)self controller];

  return [(CLAvengerScannerClientController *)v2 getOptedIn];
}

- (void)setOptedIn:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [(CLAvengerScannerClient *)self controller];

  [(CLAvengerScannerClientController *)v4 setOptedIn:v3];
}

- (BOOL)poweredOn
{
  v2 = [(CLAvengerScannerClient *)self controller];

  return [(CLAvengerScannerClientController *)v2 poweredOn];
}

- (BOOL)performNotOptedInBOMScan
{
  v2 = [(CLAvengerScannerClient *)self controller];

  return [(CLAvengerScannerClientController *)v2 performNotOptedInBOMScan];
}

- (void)centralManager:(id)a3 didDiscoverMultiplePeripherals:(id)a4
{
  v6 = [(CLAvengerScannerClient *)self controller];

  [(CLAvengerScannerClientController *)v6 centralManager:a3 didDiscoverMultiplePeripherals:a4];
}

- (void)centralManagerDidUpdateState:(id)a3
{
  v4 = [(CLAvengerScannerClient *)self controller];

  [(CLAvengerScannerClientController *)v4 centralManagerDidUpdateState:a3];
}

- (void)centralManager:(id)a3 didFailToScanWithError:(id)a4
{
  v6 = [(CLAvengerScannerClient *)self controller];

  [(CLAvengerScannerClientController *)v6 centralManager:a3 didFailToScanWithError:a4];
}

- (id)clientIdentifier
{
  v2 = [(CLAvengerScannerClient *)self delegate];

  return [(CLAvengerScannerClientDelegateProtocol *)v2 clientIdentifier];
}

- (void)onAggressiveScanStarted
{
  [(CLAvengerScannerClient *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [(CLAvengerScannerClient *)self delegate];
    [(CLAvengerScannerClientDelegateProtocol *)v3 onAggressiveScanStarted];
  }
}

- (void)onAggressiveScanEnded
{
  [(CLAvengerScannerClient *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [(CLAvengerScannerClient *)self delegate];
    [(CLAvengerScannerClientDelegateProtocol *)v3 onAggressiveScanEnded];
  }
}

- (void)onAdvertisementBufferEmptied
{
  [(CLAvengerScannerClient *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [(CLAvengerScannerClient *)self delegate];
    [(CLAvengerScannerClientDelegateProtocol *)v3 onAdvertisementBufferEmptied];
  }
}

- (void)onUpdatedPowerState
{
  [(CLAvengerScannerClient *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [(CLAvengerScannerClient *)self delegate];
    [(CLAvengerScannerClientDelegateProtocol *)v3 onUpdatedPowerState];
  }
}

- (void)onNotOptedInBOMScanEnded
{
  [(CLAvengerScannerClient *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [(CLAvengerScannerClient *)self delegate];
    [(CLAvengerScannerClientDelegateProtocol *)v3 onNotOptedInBOMScanEnded];
  }
}

- (id)getPowerAssertionIdentifier
{
  id v2 = [(CLAvengerScannerClientDelegateProtocol *)[(CLAvengerScannerClient *)self delegate] clientIdentifier];

  return [@"CLAvengerScannerClient/" stringByAppendingString:v2];
}

- (BOOL)hasPowerAssertion
{
  return self->_powerAssertion.__ptr_.__value_ != 0;
}

- (void)takePowerAssertion
{
  if ([(CLAvengerScannerClient *)self hasPowerAssertion]) {
    [(CLAvengerScannerClient *)self releasePowerAssertion];
  }
  [self getPowerAssertionIdentifier];
  operator new();
}

- (void)releasePowerAssertion
{
  if ([(CLAvengerScannerClient *)self hasPowerAssertion])
  {
    value = self->_powerAssertion.__ptr_.__value_;
    self->_powerAssertion.__ptr_.__value_ = 0;
    if (value)
    {
      v4 = *(void (**)(void))(*(void *)value + 8);
      v4();
    }
  }
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

- (void)setCentralManager:(id)a3
{
  self->_centralManager = (CBCentralManager *)a3;
}

- (void)setController:(id)a3
{
  self->_controller = (CLAvengerScannerClientController *)a3;
}

- (CLAvengerReconciler)reconciler
{
  return self->_reconciler;
}

- (void)setReconciler:(id)a3
{
  self->_reconciler = (CLAvengerReconciler *)a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  value = self->_powerAssertion.__ptr_.__value_;
  self->_powerAssertion.__ptr_.__value_ = 0;
  if (value)
  {
    v4 = *(void (**)(void))(*(void *)value + 8);
    v4();
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

@end