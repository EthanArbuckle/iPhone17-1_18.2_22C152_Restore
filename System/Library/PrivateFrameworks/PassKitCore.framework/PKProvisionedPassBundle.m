@interface PKProvisionedPassBundle
- (BOOL)ampEnrollmentAvailable;
- (BOOL)expressEnabled;
- (BOOL)expressModeSetupOptional;
- (NSArray)moreInfoItems;
- (NSOrderedSet)provisionedPasses;
- (PKPaymentProvisioningResponse)provisioningResponse;
- (PKProvisionedPassBundle)init;
- (id)_init;
- (void)setAmpEnrollmentAvailable:(BOOL)a3;
- (void)setExpressEnabled:(BOOL)a3;
- (void)setExpressModeSetupOptional:(BOOL)a3;
- (void)setMoreInfoItems:(id)a3;
- (void)setProvisionedPasses:(id)a3;
- (void)setProvisioningResponse:(id)a3;
@end

@implementation PKProvisionedPassBundle

- (PKProvisionedPassBundle)init
{
  return 0;
}

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)PKProvisionedPassBundle;
  v2 = [(PKProvisionedPassBundle *)&v6 init];
  if (v2)
  {
    v3 = (NSOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CAA0]);
    provisionedPasses = v2->_provisionedPasses;
    v2->_provisionedPasses = v3;
  }
  return v2;
}

- (PKPaymentProvisioningResponse)provisioningResponse
{
  return self->_provisioningResponse;
}

- (void)setProvisioningResponse:(id)a3
{
}

- (NSOrderedSet)provisionedPasses
{
  return self->_provisionedPasses;
}

- (void)setProvisionedPasses:(id)a3
{
}

- (NSArray)moreInfoItems
{
  return self->_moreInfoItems;
}

- (void)setMoreInfoItems:(id)a3
{
}

- (BOOL)expressModeSetupOptional
{
  return self->_expressModeSetupOptional;
}

- (void)setExpressModeSetupOptional:(BOOL)a3
{
  self->_expressModeSetupOptional = a3;
}

- (BOOL)expressEnabled
{
  return self->_expressEnabled;
}

- (void)setExpressEnabled:(BOOL)a3
{
  self->_expressEnabled = a3;
}

- (BOOL)ampEnrollmentAvailable
{
  return self->_ampEnrollmentAvailable;
}

- (void)setAmpEnrollmentAvailable:(BOOL)a3
{
  self->_ampEnrollmentAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moreInfoItems, 0);
  objc_storeStrong((id *)&self->_provisionedPasses, 0);
  objc_storeStrong((id *)&self->_provisioningResponse, 0);
}

@end