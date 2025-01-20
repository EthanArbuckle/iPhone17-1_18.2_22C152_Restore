@interface PKAuxiliaryCapabilityRegistrationStateResponse
- (NSArray)unregisteredRequirements;
- (PKAuxiliaryCapabilityRegistrationStateResponse)initWithData:(id)a3;
- (void)setUnregisteredRequirements:(id)a3;
@end

@implementation PKAuxiliaryCapabilityRegistrationStateResponse

- (PKAuxiliaryCapabilityRegistrationStateResponse)initWithData:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)PKAuxiliaryCapabilityRegistrationStateResponse;
  v3 = [(PKWebServiceResponse *)&v15 initWithData:a3];
  v4 = v3;
  if (v3)
  {
    v5 = [(PKWebServiceResponse *)v3 JSONObject];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      v7 = [v6 PKArrayContaining:objc_opt_class() forKey:@"unregisteredRequirements"];

      uint64_t v8 = objc_msgSend(v7, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_34);
      p_super = &v4->_unregisteredRequirements->super;
      v4->_unregisteredRequirements = (NSArray *)v8;
    }
    else
    {
      p_super = PKLogFacilityTypeGetObject(0x1CuLL);
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        v10 = (objc_class *)objc_opt_class();
        v11 = NSStringFromClass(v10);
        v12 = (objc_class *)objc_opt_class();
        v13 = NSStringFromClass(v12);
        *(_DWORD *)buf = 138543618;
        v17 = v11;
        __int16 v18 = 2114;
        v19 = v13;
        _os_log_impl(&dword_190E10000, p_super, OS_LOG_TYPE_DEFAULT, "Malformed %{public}@: expected dictionary and received %{public}@", buf, 0x16u);
      }
      v7 = v4;
      v4 = 0;
    }
  }
  return v4;
}

PKAuxiliaryCapabilityUnregisteredRequirements *__63__PKAuxiliaryCapabilityRegistrationStateResponse_initWithData___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [[PKAuxiliaryCapabilityUnregisteredRequirements alloc] initWithDictionary:v2];

  return v3;
}

- (NSArray)unregisteredRequirements
{
  return self->_unregisteredRequirements;
}

- (void)setUnregisteredRequirements:(id)a3
{
}

- (void).cxx_destruct
{
}

@end