@interface PKPeerPaymentRequiredFieldsPage
- (NSArray)actions;
- (NSArray)requiredFields;
- (NSString)localizedDescription;
- (NSString)localizedTitle;
- (NSString)requestToken;
- (NSString)status;
- (PKPeerPaymentRequiredFieldsPage)initWithDictionary:(id)a3 fieldOptions:(id)a4;
- (void)setActions:(id)a3;
- (void)setLocalizedDescription:(id)a3;
- (void)setLocalizedTitle:(id)a3;
- (void)setRequestToken:(id)a3;
- (void)setRequiredFields:(id)a3;
- (void)setStatus:(id)a3;
@end

@implementation PKPeerPaymentRequiredFieldsPage

- (PKPeerPaymentRequiredFieldsPage)initWithDictionary:(id)a3 fieldOptions:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v33 = a4;
  v38.receiver = self;
  v38.super_class = (Class)PKPeerPaymentRequiredFieldsPage;
  v7 = [(PKPeerPaymentRequiredFieldsPage *)&v38 init];
  if (v7)
  {
    uint64_t v8 = [v6 objectForKey:@"localizedTitle"];
    localizedTitle = v7->_localizedTitle;
    v7->_localizedTitle = (NSString *)v8;

    uint64_t v10 = [v6 objectForKey:@"localizedDescription"];
    localizedDescription = v7->_localizedDescription;
    v7->_localizedDescription = (NSString *)v10;

    v12 = [v6 PKArrayContaining:objc_opt_class() forKey:@"requiredFields"];
    v13 = [MEMORY[0x1E4F1CA48] array];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v14 = v12;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v34 objects:v41 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      v31 = v7;
      id v32 = v6;
      char v17 = 0;
      uint64_t v18 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v35 != v18) {
            objc_enumerationMutation(v14);
          }
          v20 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          v21 = [v20 lowercaseString];
          char v22 = [v21 isEqualToString:@"disclosure_footer"];

          v17 |= v22;
          v23 = [v33 PKDictionaryForKey:v20];
          v24 = +[PKPaymentSetupField paymentSetupFieldWithIdentifier:v20 configuration:v23];
          [v13 safelyAddObject:v24];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v34 objects:v41 count:16];
      }
      while (v16);

      v7 = v31;
      id v6 = v32;
      if (v17) {
        goto LABEL_13;
      }
    }
    else
    {
    }
    v39[0] = @"fieldType";
    v39[1] = @"position";
    v40[0] = @"footer";
    v40[1] = @"inline";
    v39[2] = @"defaultValue";
    v25 = PKLocalizedPeerPaymentString(&cfstr_IdentityVerifi_3.isa, 0);
    v40[2] = v25;
    v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:3];

    v27 = +[PKPaymentSetupField paymentSetupFieldWithIdentifier:@"disclosure_footer" configuration:v26];
    [v13 addObject:v27];

LABEL_13:
    uint64_t v28 = [v13 copy];
    requiredFields = v7->_requiredFields;
    v7->_requiredFields = (NSArray *)v28;
  }
  return v7;
}

- (NSArray)requiredFields
{
  return self->_requiredFields;
}

- (void)setRequiredFields:(id)a3
{
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
}

- (NSString)requestToken
{
  return self->_requestToken;
}

- (void)setRequestToken:(id)a3
{
}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_requestToken, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_requiredFields, 0);
}

@end