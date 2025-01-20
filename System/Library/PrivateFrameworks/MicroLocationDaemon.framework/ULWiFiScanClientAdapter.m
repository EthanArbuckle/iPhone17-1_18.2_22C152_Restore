@interface ULWiFiScanClientAdapter
- (id)didReceiveWifiScanErrorBlock;
- (id)didReceiveWifiScanErrorBusyBlock;
- (id)didStopWifiRssiScanningBlock;
- (id)didStopWifiScanTimerBlock;
- (id)didUpdateWiFiAssociatedStateBlock;
- (id)didUpdateWifiAPsBlock;
- (void)didReceiveWifiScanError;
- (void)didReceiveWifiScanErrorBusy;
- (void)didStopWifiRssiScanning;
- (void)didStopWifiScanTimer;
- (void)didUpdateWiFiAssociatedState:(id)a3;
- (void)didUpdateWifiAPs:(void *)a3 withDate:(id)a4;
- (void)setDidReceiveWifiScanErrorBlock:(id)a3;
- (void)setDidReceiveWifiScanErrorBusyBlock:(id)a3;
- (void)setDidStopWifiRssiScanningBlock:(id)a3;
- (void)setDidStopWifiScanTimerBlock:(id)a3;
- (void)setDidUpdateWiFiAssociatedStateBlock:(id)a3;
- (void)setDidUpdateWifiAPsBlock:(id)a3;
@end

@implementation ULWiFiScanClientAdapter

- (void)didStopWifiRssiScanning
{
  v2 = [(ULWiFiScanClientAdapter *)self didStopWifiRssiScanningBlock];
  v2[2]();
}

- (void)didStopWifiScanTimer
{
  v2 = [(ULWiFiScanClientAdapter *)self didStopWifiScanTimerBlock];
  v2[2]();
}

- (void)didUpdateWifiAPs:(void *)a3 withDate:(id)a4
{
  id v7 = a4;
  v6 = [(ULWiFiScanClientAdapter *)self didUpdateWifiAPsBlock];
  ((void (**)(void, void *, id))v6)[2](v6, a3, v7);
}

- (void)didReceiveWifiScanError
{
  v2 = [(ULWiFiScanClientAdapter *)self didReceiveWifiScanErrorBlock];
  v2[2]();
}

- (void)didReceiveWifiScanErrorBusy
{
  v2 = [(ULWiFiScanClientAdapter *)self didReceiveWifiScanErrorBlock];
  v2[2]();
}

- (void)didUpdateWiFiAssociatedState:(id)a3
{
  id v5 = a3;
  v4 = [(ULWiFiScanClientAdapter *)self didUpdateWiFiAssociatedStateBlock];
  ((void (**)(void, id))v4)[2](v4, v5);
}

- (id)didStopWifiRssiScanningBlock
{
  return self->_didStopWifiRssiScanningBlock;
}

- (void)setDidStopWifiRssiScanningBlock:(id)a3
{
}

- (id)didStopWifiScanTimerBlock
{
  return self->_didStopWifiScanTimerBlock;
}

- (void)setDidStopWifiScanTimerBlock:(id)a3
{
}

- (id)didUpdateWifiAPsBlock
{
  return self->_didUpdateWifiAPsBlock;
}

- (void)setDidUpdateWifiAPsBlock:(id)a3
{
}

- (id)didReceiveWifiScanErrorBlock
{
  return self->_didReceiveWifiScanErrorBlock;
}

- (void)setDidReceiveWifiScanErrorBlock:(id)a3
{
}

- (id)didReceiveWifiScanErrorBusyBlock
{
  return self->_didReceiveWifiScanErrorBusyBlock;
}

- (void)setDidReceiveWifiScanErrorBusyBlock:(id)a3
{
}

- (id)didUpdateWiFiAssociatedStateBlock
{
  return self->_didUpdateWiFiAssociatedStateBlock;
}

- (void)setDidUpdateWiFiAssociatedStateBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didUpdateWiFiAssociatedStateBlock, 0);
  objc_storeStrong(&self->_didReceiveWifiScanErrorBusyBlock, 0);
  objc_storeStrong(&self->_didReceiveWifiScanErrorBlock, 0);
  objc_storeStrong(&self->_didUpdateWifiAPsBlock, 0);
  objc_storeStrong(&self->_didStopWifiScanTimerBlock, 0);
  objc_storeStrong(&self->_didStopWifiRssiScanningBlock, 0);
}

@end