@interface PRNameLabelViewControllerTransition
- (BSUIVibrancyConfiguration)fromConfiguration;
- (BSUIVibrancyConfiguration)toConfiguration;
- (PRNameLabelViewController)viewController;
- (PRNameLabelViewControllerTransition)initWithViewController:(id)a3 fromVibrancyConfiguration:(id)a4 toVibrancyConfiguration:(id)a5;
- (void)cancelInteractiveTransition;
- (void)finishInteractiveTransition;
- (void)updateInteractiveTransition:(double)a3;
@end

@implementation PRNameLabelViewControllerTransition

- (PRNameLabelViewControllerTransition)initWithViewController:(id)a3 fromVibrancyConfiguration:(id)a4 toVibrancyConfiguration:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PRNameLabelViewControllerTransition;
  v12 = [(PRNameLabelViewControllerTransition *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_viewController, a3);
    objc_storeStrong((id *)&v13->_fromConfiguration, a4);
    objc_storeStrong((id *)&v13->_toConfiguration, a5);
  }

  return v13;
}

- (void)cancelInteractiveTransition
{
}

- (void)finishInteractiveTransition
{
}

- (void)updateInteractiveTransition:(double)a3
{
}

- (PRNameLabelViewController)viewController
{
  return self->_viewController;
}

- (BSUIVibrancyConfiguration)fromConfiguration
{
  return self->_fromConfiguration;
}

- (BSUIVibrancyConfiguration)toConfiguration
{
  return self->_toConfiguration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toConfiguration, 0);
  objc_storeStrong((id *)&self->_fromConfiguration, 0);
  objc_storeStrong((id *)&self->_viewController, 0);
}

@end