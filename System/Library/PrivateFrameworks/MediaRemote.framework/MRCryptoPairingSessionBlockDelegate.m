@interface MRCryptoPairingSessionBlockDelegate
- (id)dataExchangeBlock;
- (id)exchangeCompleteBlock;
- (id)hideSetupCodeBlock;
- (id)promptForSetupCodeBlock;
- (id)showSetupCodeBlock;
- (void)pairingSession:(id)a3 didCompleteExchangeWithError:(id)a4;
- (void)pairingSession:(id)a3 didPrepareExchangeData:(id)a4;
- (void)pairingSession:(id)a3 promptForSetupCodeWithCompletion:(id)a4;
- (void)pairingSession:(id)a3 promptForSetupCodeWithDelay:(double)a4 completion:(id)a5;
- (void)pairingSession:(id)a3 showSetupCode:(id)a4;
- (void)pairingSessionHideSetupCode:(id)a3;
- (void)setDataExchangeBlock:(id)a3;
- (void)setExchangeCompleteBlock:(id)a3;
- (void)setHideSetupCodeBlock:(id)a3;
- (void)setPromptForSetupCodeBlock:(id)a3;
- (void)setShowSetupCodeBlock:(id)a3;
@end

@implementation MRCryptoPairingSessionBlockDelegate

- (void)pairingSession:(id)a3 didPrepareExchangeData:(id)a4
{
  dataExchangeBlock = (void (**)(id, id, id))self->_dataExchangeBlock;
  if (dataExchangeBlock) {
    dataExchangeBlock[2](dataExchangeBlock, a3, a4);
  }
}

- (void)pairingSession:(id)a3 showSetupCode:(id)a4
{
  showSetupCodeBlock = (void (**)(id, id, id))self->_showSetupCodeBlock;
  if (showSetupCodeBlock) {
    showSetupCodeBlock[2](showSetupCodeBlock, a3, a4);
  }
}

- (void)pairingSessionHideSetupCode:(id)a3
{
  hideSetupCodeBlock = (void (**)(id, id))self->_hideSetupCodeBlock;
  if (hideSetupCodeBlock) {
    hideSetupCodeBlock[2](hideSetupCodeBlock, a3);
  }
}

- (void)pairingSession:(id)a3 promptForSetupCodeWithCompletion:(id)a4
{
  promptForSetupCodeBlock = (void (**)(id, id, id, double))self->_promptForSetupCodeBlock;
  if (promptForSetupCodeBlock) {
    promptForSetupCodeBlock[2](promptForSetupCodeBlock, a3, a4, -1.0);
  }
}

- (void)pairingSession:(id)a3 promptForSetupCodeWithDelay:(double)a4 completion:(id)a5
{
  promptForSetupCodeBlock = (void (**)(id, id, id, double))self->_promptForSetupCodeBlock;
  if (promptForSetupCodeBlock) {
    promptForSetupCodeBlock[2](promptForSetupCodeBlock, a3, a5, a4);
  }
}

- (void)pairingSession:(id)a3 didCompleteExchangeWithError:(id)a4
{
  exchangeCompleteBlock = (void (**)(id, id, id))self->_exchangeCompleteBlock;
  if (exchangeCompleteBlock) {
    exchangeCompleteBlock[2](exchangeCompleteBlock, a3, a4);
  }
}

- (id)dataExchangeBlock
{
  return self->_dataExchangeBlock;
}

- (void)setDataExchangeBlock:(id)a3
{
}

- (id)showSetupCodeBlock
{
  return self->_showSetupCodeBlock;
}

- (void)setShowSetupCodeBlock:(id)a3
{
}

- (id)hideSetupCodeBlock
{
  return self->_hideSetupCodeBlock;
}

- (void)setHideSetupCodeBlock:(id)a3
{
}

- (id)promptForSetupCodeBlock
{
  return self->_promptForSetupCodeBlock;
}

- (void)setPromptForSetupCodeBlock:(id)a3
{
}

- (id)exchangeCompleteBlock
{
  return self->_exchangeCompleteBlock;
}

- (void)setExchangeCompleteBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_exchangeCompleteBlock, 0);
  objc_storeStrong(&self->_promptForSetupCodeBlock, 0);
  objc_storeStrong(&self->_hideSetupCodeBlock, 0);
  objc_storeStrong(&self->_showSetupCodeBlock, 0);

  objc_storeStrong(&self->_dataExchangeBlock, 0);
}

@end