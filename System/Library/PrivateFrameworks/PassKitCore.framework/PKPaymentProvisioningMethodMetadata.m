@interface PKPaymentProvisioningMethodMetadata
- (NSArray)requiredFields;
- (NSDecimalNumber)depositAmount;
- (NSDecimalNumber)maxLoadedBalance;
- (NSDecimalNumber)minLoadedBalance;
- (NSDecimalNumber)minimumReaderModeBalance;
- (NSDictionary)readerModeMetadata;
- (NSDictionary)readerModeResources;
- (NSString)currency;
- (NSString)productIdentifier;
- (PKPaymentDigitalIssuanceMetadata)digitalIssuanceMetadata;
- (PKPaymentProvisioningMethodMetadata)initWithDictionary:(id)a3;
- (unint64_t)depositType;
@end

@implementation PKPaymentProvisioningMethodMetadata

- (PKPaymentProvisioningMethodMetadata)initWithDictionary:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v57.receiver = self;
  v57.super_class = (Class)PKPaymentProvisioningMethodMetadata;
  v5 = [(PKPaymentProvisioningMethodMetadata *)&v57 init];
  if (!v5) {
    goto LABEL_30;
  }
  uint64_t v6 = [v4 PKStringForKey:@"productIdentifier"];
  productIdentifier = v5->_productIdentifier;
  v5->_productIdentifier = (NSString *)v6;

  uint64_t v8 = [v4 PKStringForKey:@"currency"];
  currency = v5->_currency;
  v5->_currency = (NSString *)v8;

  v10 = [v4 PKStringForKey:@"depositType"];
  v11 = v5->_productIdentifier;
  id v12 = v10;
  v13 = v11;
  v14 = v13;
  if (!v12)
  {
    if (v13)
    {
      uint64_t v15 = [(NSString *)v13 isEqualToString:@"59F12F58E2D04C9180CFD6C2096C125F-caprieightball-DC5AC19A6D2D477D8765687C3C2D4CA5"];
      goto LABEL_14;
    }
LABEL_13:
    uint64_t v15 = 0;
    goto LABEL_14;
  }
  if (([v12 isEqualToString:@"RefundableDeposit"] & 1) == 0)
  {
    if (([v12 isEqualToString:@"RefundableServiceFee"] & 1) == 0)
    {
      if ([v12 isEqualToString:@"ServiceFee"])
      {
        uint64_t v15 = 2;
        goto LABEL_14;
      }
      v16 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v60 = v12;
        _os_log_impl(&dword_190E10000, v16, OS_LOG_TYPE_DEFAULT, "Unknown depositType %{public}@", buf, 0xCu);
      }
    }
    goto LABEL_13;
  }
  uint64_t v15 = 1;
LABEL_14:

  v5->_depositType = v15;
  uint64_t v17 = [v4 PKDecimalNumberFromStringForKey:@"depositAmount"];
  depositAmount = v5->_depositAmount;
  v5->_depositAmount = (NSDecimalNumber *)v17;

  v19 = [v4 PKDecimalNumberFromStringForKey:@"minLoadedBalance"];
  v20 = [MEMORY[0x1E4F28C28] notANumber];
  char v21 = [v19 isEqual:v20];

  if ((v21 & 1) == 0) {
    objc_storeStrong((id *)&v5->_minLoadedBalance, v19);
  }
  v22 = [v4 PKDecimalNumberFromStringForKey:@"maxLoadedBalance"];
  v23 = [MEMORY[0x1E4F28C28] notANumber];
  char v24 = [v22 isEqual:v23];

  if ((v24 & 1) == 0) {
    objc_storeStrong((id *)&v5->_maxLoadedBalance, v22);
  }
  v25 = [v4 PKArrayForKey:@"requiredFields"];
  uint64_t v26 = [v25 count];

  if (v26)
  {
    v50 = v22;
    v51 = v19;
    v27 = [MEMORY[0x1E4F1CA48] array];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id obj = [v4 PKArrayContaining:objc_opt_class() forKey:@"requiredFields"];
    uint64_t v28 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v54 != v30) {
            objc_enumerationMutation(obj);
          }
          uint64_t v32 = *(void *)(*((void *)&v53 + 1) + 8 * i);
          [v4 PKDictionaryForKey:@"requiredFieldOptions"];
          v34 = id v33 = v4;
          v35 = [v34 PKDictionaryForKey:v32];

          id v4 = v33;
          v36 = +[PKPaymentSetupField paymentSetupFieldWithIdentifier:v32 configuration:v35];
          [v27 safelyAddObject:v36];
        }
        uint64_t v29 = [obj countByEnumeratingWithState:&v53 objects:v58 count:16];
      }
      while (v29);
    }

    uint64_t v37 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v27];
    requiredFields = v5->_requiredFields;
    v5->_requiredFields = (NSArray *)v37;

    v22 = v50;
    v19 = v51;
  }
  uint64_t v39 = [v4 PKDictionaryForKey:@"readerModeMetadata"];
  readerModeMetadata = v5->_readerModeMetadata;
  v5->_readerModeMetadata = (NSDictionary *)v39;

  uint64_t v41 = [v4 PKDictionaryForKey:@"readerModeResources"];
  readerModeResources = v5->_readerModeResources;
  v5->_readerModeResources = (NSDictionary *)v41;

  v43 = [v4 PKDictionaryForKey:@"digitalIssuanceMetadata"];
  v44 = [[PKPaymentDigitalIssuanceMetadata alloc] initWithDictionary:v43];
  digitalIssuanceMetadata = v5->_digitalIssuanceMetadata;
  v5->_digitalIssuanceMetadata = v44;

  v46 = [v4 PKDecimalNumberFromStringForKey:@"minimumReaderModeBalance"];
  v47 = [MEMORY[0x1E4F28C28] notANumber];
  char v48 = [v46 isEqual:v47];

  if ((v48 & 1) == 0) {
    objc_storeStrong((id *)&v5->_minimumReaderModeBalance, v46);
  }

LABEL_30:
  return v5;
}

- (NSString)productIdentifier
{
  return self->_productIdentifier;
}

- (NSString)currency
{
  return self->_currency;
}

- (unint64_t)depositType
{
  return self->_depositType;
}

- (NSDecimalNumber)depositAmount
{
  return self->_depositAmount;
}

- (NSDecimalNumber)minLoadedBalance
{
  return self->_minLoadedBalance;
}

- (NSDecimalNumber)maxLoadedBalance
{
  return self->_maxLoadedBalance;
}

- (NSArray)requiredFields
{
  return self->_requiredFields;
}

- (NSDictionary)readerModeMetadata
{
  return self->_readerModeMetadata;
}

- (PKPaymentDigitalIssuanceMetadata)digitalIssuanceMetadata
{
  return self->_digitalIssuanceMetadata;
}

- (NSDictionary)readerModeResources
{
  return self->_readerModeResources;
}

- (NSDecimalNumber)minimumReaderModeBalance
{
  return self->_minimumReaderModeBalance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minimumReaderModeBalance, 0);
  objc_storeStrong((id *)&self->_readerModeResources, 0);
  objc_storeStrong((id *)&self->_digitalIssuanceMetadata, 0);
  objc_storeStrong((id *)&self->_readerModeMetadata, 0);
  objc_storeStrong((id *)&self->_requiredFields, 0);
  objc_storeStrong((id *)&self->_maxLoadedBalance, 0);
  objc_storeStrong((id *)&self->_minLoadedBalance, 0);
  objc_storeStrong((id *)&self->_depositAmount, 0);
  objc_storeStrong((id *)&self->_currency, 0);
  objc_storeStrong((id *)&self->_productIdentifier, 0);
}

@end