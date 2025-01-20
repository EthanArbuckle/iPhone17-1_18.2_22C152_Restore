@interface PXSurveyQuestionConfigurationHandlers
- (id)didSelectAssetHandler;
- (id)presentViewControllerHandler;
- (id)pushViewControllerHandler;
- (void)setDidSelectAssetHandler:(id)a3;
- (void)setPresentViewControllerHandler:(id)a3;
- (void)setPushViewControllerHandler:(id)a3;
@end

@implementation PXSurveyQuestionConfigurationHandlers

- (void)setPushViewControllerHandler:(id)a3
{
}

- (void)setPresentViewControllerHandler:(id)a3
{
}

- (void)setDidSelectAssetHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_presentViewControllerHandler, 0);
  objc_storeStrong(&self->_pushViewControllerHandler, 0);
  objc_storeStrong(&self->_didSelectAssetHandler, 0);
}

- (id)presentViewControllerHandler
{
  return self->_presentViewControllerHandler;
}

- (id)pushViewControllerHandler
{
  return self->_pushViewControllerHandler;
}

- (id)didSelectAssetHandler
{
  return self->_didSelectAssetHandler;
}

@end