@interface PurchaseResponseInfo
- (BOOL)didPasswordAuthenticate;
- (BOOL)shouldRetryForDelayedGoto;
- (BOOL)shouldRetryForMachineData;
- (BOOL)shouldRetryWithOriginalProductOwnerAccount;
- (ISDialog)dialog;
- (NSString)changedBuyParameters;
- (NSString)machineDataSyncState;
- (NSURL)redirectURL;
- (int64_t)delayedGotoRetryCount;
- (int64_t)machineDataRetryCount;
- (void)reset;
- (void)setChangedBuyParameters:(id)a3;
- (void)setDelayedGotoRetryCount:(int64_t)a3;
- (void)setDialog:(id)a3;
- (void)setDidPasswordAuthenticate:(BOOL)a3;
- (void)setMachineDataRetryCount:(int64_t)a3;
- (void)setMachineDataSyncState:(id)a3;
- (void)setRedirectURL:(id)a3;
- (void)setShouldRetryForDelayedGoto:(BOOL)a3;
- (void)setShouldRetryForMachineData:(BOOL)a3;
- (void)setShouldRetryWithOriginalProductOwnerAccount:(BOOL)a3;
@end

@implementation PurchaseResponseInfo

- (void)reset
{
  [(PurchaseResponseInfo *)self setChangedBuyParameters:0];
  [(PurchaseResponseInfo *)self setDialog:0];
  [(PurchaseResponseInfo *)self setShouldRetryForDelayedGoto:0];

  [(PurchaseResponseInfo *)self setShouldRetryForMachineData:0];
}

- (NSString)changedBuyParameters
{
  return self->_changedBuyParameters;
}

- (void)setChangedBuyParameters:(id)a3
{
}

- (int64_t)delayedGotoRetryCount
{
  return self->_delayedGotoRetryCount;
}

- (void)setDelayedGotoRetryCount:(int64_t)a3
{
  self->_delayedGotoRetryCount = a3;
}

- (ISDialog)dialog
{
  return self->_dialog;
}

- (void)setDialog:(id)a3
{
}

- (BOOL)didPasswordAuthenticate
{
  return self->_didPasswordAuthenticate;
}

- (void)setDidPasswordAuthenticate:(BOOL)a3
{
  self->_didPasswordAuthenticate = a3;
}

- (int64_t)machineDataRetryCount
{
  return self->_machineDataRetryCount;
}

- (void)setMachineDataRetryCount:(int64_t)a3
{
  self->_machineDataRetryCount = a3;
}

- (NSString)machineDataSyncState
{
  return self->_machineDataSyncState;
}

- (void)setMachineDataSyncState:(id)a3
{
}

- (NSURL)redirectURL
{
  return self->_redirectURL;
}

- (void)setRedirectURL:(id)a3
{
}

- (BOOL)shouldRetryForDelayedGoto
{
  return self->_shouldRetryForDelayedGoto;
}

- (void)setShouldRetryForDelayedGoto:(BOOL)a3
{
  self->_shouldRetryForDelayedGoto = a3;
}

- (BOOL)shouldRetryForMachineData
{
  return self->_shouldRetryForMachineData;
}

- (void)setShouldRetryForMachineData:(BOOL)a3
{
  self->_shouldRetryForMachineData = a3;
}

- (BOOL)shouldRetryWithOriginalProductOwnerAccount
{
  return self->_shouldRetryWithOriginalProductOwnerAccount;
}

- (void)setShouldRetryWithOriginalProductOwnerAccount:(BOOL)a3
{
  self->_shouldRetryWithOriginalProductOwnerAccount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_redirectURL, 0);
  objc_storeStrong((id *)&self->_machineDataSyncState, 0);
  objc_storeStrong((id *)&self->_dialog, 0);

  objc_storeStrong((id *)&self->_changedBuyParameters, 0);
}

@end