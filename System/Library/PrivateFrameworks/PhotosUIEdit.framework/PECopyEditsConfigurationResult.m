@interface PECopyEditsConfigurationResult
- (BOOL)smartCopyEnabled;
- (NSDictionary)analyticsPayload;
- (PECopyEditsConfigurationResult)initWithCompositionController:(id)a3;
- (PICompositionController)compositionController;
- (void)setAnalyticsPayload:(id)a3;
- (void)setSmartCopyEnabled:(BOOL)a3;
@end

@implementation PECopyEditsConfigurationResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsPayload, 0);
  objc_storeStrong((id *)&self->_compositionController, 0);
}

- (void)setAnalyticsPayload:(id)a3
{
}

- (NSDictionary)analyticsPayload
{
  return self->_analyticsPayload;
}

- (void)setSmartCopyEnabled:(BOOL)a3
{
  self->_smartCopyEnabled = a3;
}

- (BOOL)smartCopyEnabled
{
  return self->_smartCopyEnabled;
}

- (PICompositionController)compositionController
{
  return self->_compositionController;
}

- (PECopyEditsConfigurationResult)initWithCompositionController:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PECopyEditsConfigurationResult;
  v5 = [(PECopyEditsConfigurationResult *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    compositionController = v5->_compositionController;
    v5->_compositionController = (PICompositionController *)v6;

    v5->_smartCopyEnabled = 0;
  }

  return v5;
}

@end