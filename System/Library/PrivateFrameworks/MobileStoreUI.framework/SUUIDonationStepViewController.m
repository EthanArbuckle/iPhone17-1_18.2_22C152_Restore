@interface SUUIDonationStepViewController
- (NSOperationQueue)operationQueue;
- (SUUIDonationConfiguration)donationConfiguration;
- (SUUIDonationStepViewController)initWithCharity:(id)a3 configuration:(id)a4;
- (SUUIDonationViewController)donationViewController;
- (SUUIGiftCharity)charity;
- (void)setOperationQueue:(id)a3;
@end

@implementation SUUIDonationStepViewController

- (SUUIDonationStepViewController)initWithCharity:(id)a3 configuration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SUUIDonationStepViewController;
  v9 = [(SUUIDonationStepViewController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_charity, a3);
    objc_storeStrong((id *)&v10->_configuration, a4);
  }

  return v10;
}

- (SUUIDonationViewController)donationViewController
{
  v2 = [(SUUIDonationStepViewController *)self navigationController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (SUUIDonationViewController *)v3;
}

- (SUUIGiftCharity)charity
{
  return self->_charity;
}

- (SUUIDonationConfiguration)donationConfiguration
{
  return self->_configuration;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void)setOperationQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_charity, 0);
}

@end