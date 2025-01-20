@interface VKDataScannerViewControllerBridge
+ (BOOL)isCameraRestricted;
+ (BOOL)isOpticalFlowForTextEnabled;
- (VKDataScannerViewControllerBridge)init;
- (VKDataScannerViewControllerBridgeDelegate)delegate;
- (void)beginSessionForText:(BOOL)a3 barcodes:(BOOL)a4;
- (void)dealloc;
- (void)endSession;
- (void)setDelegate:(id)a3;
@end

@implementation VKDataScannerViewControllerBridge

- (VKDataScannerViewControllerBridge)init
{
  v9[1] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)VKDataScannerViewControllerBridge;
  v2 = [(VKDataScannerViewControllerBridge *)&v8 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    v9[0] = @"cameraRestriction";
    v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    id v4 = MEMORY[0x1E4F14428];
    objc_copyWeak(&v6, &location);
    v2->_notificationToken = (MGNotificationTokenStruct *)MGRegisterForUpdates();

    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __41__VKDataScannerViewControllerBridge_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained delegate];
  [v1 cameraRestrictedDidChange:WeakRetained];
}

- (void)dealloc
{
  MGCancelNotifications();
  [(VKDataScannerViewControllerBridge *)self endSession];
  v3.receiver = self;
  v3.super_class = (Class)VKDataScannerViewControllerBridge;
  [(VKDataScannerViewControllerBridge *)&v3 dealloc];
}

+ (BOOL)isCameraRestricted
{
  return (MGGetBoolAnswer() & 1) != 0 || +[VKAVCapture authorizationStatus]() == 2;
}

+ (BOOL)isOpticalFlowForTextEnabled
{
  int v2 = vk_supportsOpticalFlowTracking();
  if (v2)
  {
    if (vk_isInternalBuild())
    {
      LOBYTE(v2) = +[VKCInternalSettings isOpticalFlowForTextEnabled];
    }
    else
    {
      LOBYTE(v2) = 1;
    }
  }
  return v2;
}

- (void)beginSessionForText:(BOOL)a3 barcodes:(BOOL)a4
{
  if (!self->_sessionStartDate)
  {
    v7 = [MEMORY[0x1E4F1C9C8] now];
    sessionStartDate = self->_sessionStartDate;
    self->_sessionStartDate = v7;

    self->_isScanningForText = a3;
    self->_isScanningForBarcodes = a4;
  }
}

- (void)endSession
{
  if (self->_sessionStartDate)
  {
    objc_super v3 = [MEMORY[0x1E4F1C9C8] now];
    [v3 timeIntervalSinceDate:self->_sessionStartDate];
    double v5 = v4;

    objc_super v8 = [[VKAnalyticsDataScannerEvent alloc] initWithFeedDuration:self->_isScanningForText scannedForText:self->_isScanningForBarcodes scannedForBarcodes:0 customIdentifier:v5];
    if (![(VKAnalyticsDataScannerEvent *)v8 isHealth])
    {
      id v6 = objc_alloc_init(VKAnalyticsProcessor);
      [(VKAnalyticsProcessor *)v6 setIsPublicAPI:1];
      [(VKAnalyticsProcessor *)v6 processAndSendEvent:v8];
    }
    sessionStartDate = self->_sessionStartDate;
    self->_sessionStartDate = 0;
  }
}

- (VKDataScannerViewControllerBridgeDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VKDataScannerViewControllerBridgeDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sessionStartDate, 0);
}

@end