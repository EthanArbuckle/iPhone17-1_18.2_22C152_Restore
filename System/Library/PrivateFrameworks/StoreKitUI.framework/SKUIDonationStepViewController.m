@interface SKUIDonationStepViewController
- (NSOperationQueue)operationQueue;
- (SKUIDonationConfiguration)donationConfiguration;
- (SKUIDonationStepViewController)initWithCharity:(id)a3 configuration:(id)a4;
- (SKUIDonationViewController)donationViewController;
- (SKUIGiftCharity)charity;
- (void)setOperationQueue:(id)a3;
@end

@implementation SKUIDonationStepViewController

- (SKUIDonationStepViewController)initWithCharity:(id)a3 configuration:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIDonationStepViewController initWithCharity:configuration:]();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUIDonationStepViewController;
  v9 = [(SKUIDonationStepViewController *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_charity, a3);
    objc_storeStrong((id *)&v10->_configuration, a4);
  }

  return v10;
}

- (SKUIDonationViewController)donationViewController
{
  v2 = [(SKUIDonationStepViewController *)self navigationController];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (SKUIDonationViewController *)v3;
}

- (SKUIGiftCharity)charity
{
  return self->_charity;
}

- (SKUIDonationConfiguration)donationConfiguration
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

- (void)initWithCharity:configuration:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIDonationStepViewController initWithCharity:configuration:]";
}

@end