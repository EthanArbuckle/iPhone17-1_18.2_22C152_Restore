@interface PKDynamicProvisioningFieldsPageContent
- (PKDynamicProvisioningFieldsPageContent)initWithDictionary:(id)a3 fieldOptions:(id)a4 businessChatIdentifier:(id)a5;
- (PKPaymentSetupFieldsModel)fieldModel;
- (void)setFieldModel:(id)a3;
@end

@implementation PKDynamicProvisioningFieldsPageContent

- (PKDynamicProvisioningFieldsPageContent)initWithDictionary:(id)a3 fieldOptions:(id)a4 businessChatIdentifier:(id)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v39.receiver = self;
  v39.super_class = (Class)PKDynamicProvisioningFieldsPageContent;
  v11 = [(PKDynamicProvisioningPageContent *)&v39 initWithDictonary:v8];
  if (v11)
  {
    id v33 = v10;
    id v34 = v8;
    v12 = [v8 PKArrayContaining:objc_opt_class() forKey:@"requiredFields"];
    v13 = [MEMORY[0x1E4F1CA48] array];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v14 = v12;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v36 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          v20 = objc_msgSend(v9, "PKDictionaryForKey:", v19, v33);
          v21 = +[PKPaymentSetupField paymentSetupFieldWithIdentifier:v19 configuration:v20];
          [v13 safelyAddObject:v21];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v16);
    }

    v22 = [(PKDynamicProvisioningPageContent *)v11 learnMore];
    v23 = [v22 buttonTitle];
    id v10 = v33;
    if (v23)
    {
      v24 = [[PKPaymentSetupFieldLabel alloc] initWithIdentifier:v23];
      [(PKPaymentSetupFieldLabel *)v24 setButtonTitle:v23];
      v25 = [v22 title];
      [(PKPaymentSetupFieldLabel *)v24 setDetailTitle:v25];

      v26 = [v22 subtitle];
      [(PKPaymentSetupFieldLabel *)v24 setDetailSubtitle:v26];

      v27 = [v22 body];
      [(PKPaymentSetupFieldLabel *)v24 setDetailBody:v27];

      [(PKPaymentSetupFieldLabel *)v24 setBusinessChatIdentifier:v33];
      v28 = [v22 businessChatIntentName];
      [(PKPaymentSetupFieldLabel *)v24 setBusinessChatIntentName:v28];

      v29 = [v22 businessChatButtonTitle];
      [(PKPaymentSetupFieldLabel *)v24 setBusinessChatButtonTitle:v29];

      [v13 safelyAddObject:v24];
    }
    v30 = [[PKPaymentSetupFieldsModel alloc] initWithPaymentSetupFields:v13];
    fieldModel = v11->_fieldModel;
    v11->_fieldModel = v30;

    id v8 = v34;
  }

  return v11;
}

- (PKPaymentSetupFieldsModel)fieldModel
{
  return self->_fieldModel;
}

- (void)setFieldModel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end