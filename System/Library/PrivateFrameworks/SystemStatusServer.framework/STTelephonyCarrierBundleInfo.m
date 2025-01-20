@interface STTelephonyCarrierBundleInfo
- (BOOL)LTEConnectionShows4G;
- (BOOL)isReinitiatingActivationDisabled;
- (BOOL)suppressSOSOnlyWithLimitedService;
- (NSArray)disabledApplicationIDs;
- (NSString)carrierName;
- (NSString)customerServicePhoneNumber;
- (NSString)description;
- (NSString)homeCountryCode;
- (STTelephonyCarrierBundleInfo)init;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)initWithCarrierBundleInfo:(id)a1;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
@end

@implementation STTelephonyCarrierBundleInfo

- (BOOL)suppressSOSOnlyWithLimitedService
{
  return self->_suppressSOSOnlyWithLimitedService;
}

- (BOOL)isReinitiatingActivationDisabled
{
  return self->_reinitiatingActivationDisabled;
}

- (id)initWithCarrierBundleInfo:(id)a1
{
  id v3 = a2;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)STTelephonyCarrierBundleInfo;
    a1 = objc_msgSendSuper2(&v17, sel_init);
    if (a1)
    {
      *((unsigned char *)a1 + 8) = [v3 LTEConnectionShows4G];
      *((unsigned char *)a1 + 9) = [v3 suppressSOSOnlyWithLimitedService];
      *((unsigned char *)a1 + 10) = [v3 isReinitiatingActivationDisabled];
      v4 = [v3 customerServicePhoneNumber];
      uint64_t v5 = [v4 copy];
      v6 = (void *)*((void *)a1 + 2);
      *((void *)a1 + 2) = v5;

      v7 = [v3 disabledApplicationIDs];
      uint64_t v8 = [v7 copy];
      v9 = (void *)*((void *)a1 + 3);
      *((void *)a1 + 3) = v8;

      v10 = [v3 carrierName];
      uint64_t v11 = [v10 copy];
      v12 = (void *)*((void *)a1 + 4);
      *((void *)a1 + 4) = v11;

      v13 = [v3 homeCountryCode];
      uint64_t v14 = [v13 copy];
      v15 = (void *)*((void *)a1 + 5);
      *((void *)a1 + 5) = v14;
    }
  }

  return a1;
}

- (NSString)homeCountryCode
{
  return self->_homeCountryCode;
}

- (NSArray)disabledApplicationIDs
{
  return self->_disabledApplicationIDs;
}

- (NSString)customerServicePhoneNumber
{
  return self->_customerServicePhoneNumber;
}

- (NSString)carrierName
{
  return self->_carrierName;
}

- (BOOL)LTEConnectionShows4G
{
  return self->_LTEConnectionShows4G;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeCountryCode, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_disabledApplicationIDs, 0);
  objc_storeStrong((id *)&self->_customerServicePhoneNumber, 0);
}

- (STTelephonyCarrierBundleInfo)init
{
  return (STTelephonyCarrierBundleInfo *)-[STTelephonyCarrierBundleInfo initWithCarrierBundleInfo:](self, 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = +[STMutableTelephonyCarrierBundleInfo allocWithZone:a3];
  return -[STTelephonyCarrierBundleInfo initWithCarrierBundleInfo:](v4, self);
}

- (NSString)description
{
  return (NSString *)[(STTelephonyCarrierBundleInfo *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(STTelephonyCarrierBundleInfo *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  id v3 = [(STTelephonyCarrierBundleInfo *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(STTelephonyCarrierBundleInfo *)self succinctDescriptionBuilder];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__STTelephonyCarrierBundleInfo_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E6AD1EE0;
  id v6 = v5;
  id v10 = v6;
  uint64_t v11 = self;
  [v6 appendBodySectionWithName:0 multilinePrefix:v4 block:v9];

  id v7 = v6;
  return v7;
}

void __70__STTelephonyCarrierBundleInfo_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "LTEConnectionShows4G"), @"LTEConnectionShows4G");
  id v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "suppressSOSOnlyWithLimitedService"), @"suppressSOSOnlyWithLimitedService");
  id v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isReinitiatingActivationDisabled"), @"reinitiatingActivationDisabled");
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) customerServicePhoneNumber];
  [v5 appendString:v6 withName:@"customerServicePhoneNumber"];

  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = [*(id *)(a1 + 40) disabledApplicationIDs];
  [v7 appendArraySection:v8 withName:@"disabledApplicationIDs" skipIfEmpty:0];

  v9 = *(void **)(a1 + 32);
  id v10 = [*(id *)(a1 + 40) carrierName];
  [v9 appendString:v10 withName:@"carrierName"];

  uint64_t v11 = *(void **)(a1 + 32);
  id v12 = [*(id *)(a1 + 40) homeCountryCode];
  [v11 appendString:v12 withName:@"homeCountryCode"];
}

@end