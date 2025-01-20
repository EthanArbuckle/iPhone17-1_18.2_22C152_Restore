@interface PKPaymentTransactionBankConnectMetadata
- (BOOL)isEqual:(id)a3;
- (CNPostalAddress)bankMerchantAddress;
- (NSNumber)bankMerchantCategoryCode;
- (NSString)bankCategoryDescription;
- (NSString)bankMerchantName;
- (NSString)bankMerchantNumber;
- (NSString)bankStandardIndustrialClassificationCode;
- (NSString)originalTransactionDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setBankCategoryDescription:(id)a3;
- (void)setBankMerchantAddress:(id)a3;
- (void)setBankMerchantCategoryCode:(id)a3;
- (void)setBankMerchantName:(id)a3;
- (void)setBankMerchantNumber:(id)a3;
- (void)setBankStandardIndustrialClassificationCode:(id)a3;
- (void)setOriginalTransactionDescription:(id)a3;
@end

@implementation PKPaymentTransactionBankConnectMetadata

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  uint64_t v6 = [(NSString *)self->_originalTransactionDescription copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_bankCategoryDescription copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(CNPostalAddress *)self->_bankMerchantAddress copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

  uint64_t v12 = [(NSNumber *)self->_bankMerchantCategoryCode copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  uint64_t v14 = [(NSString *)self->_bankMerchantName copyWithZone:a3];
  v15 = (void *)v5[5];
  v5[5] = v14;

  uint64_t v16 = [(NSString *)self->_bankMerchantNumber copyWithZone:a3];
  v17 = (void *)v5[6];
  v5[6] = v16;

  uint64_t v18 = [(NSString *)self->_bankStandardIndustrialClassificationCode copyWithZone:a3];
  v19 = (void *)v5[7];
  v5[7] = v18;

  return v5;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_originalTransactionDescription];
  [v3 safelyAddObject:self->_bankCategoryDescription];
  [v3 safelyAddObject:self->_bankMerchantAddress];
  [v3 safelyAddObject:self->_bankMerchantCategoryCode];
  [v3 safelyAddObject:self->_bankMerchantName];
  [v3 safelyAddObject:self->_bankMerchantNumber];
  [v3 safelyAddObject:self->_bankStandardIndustrialClassificationCode];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKPaymentTransactionBankConnectMetadata *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v6 = v5;
        originalTransactionDescription = self->_originalTransactionDescription;
        uint64_t v8 = v6->_originalTransactionDescription;
        if (originalTransactionDescription && v8)
        {
          if ((-[NSString isEqual:](originalTransactionDescription, "isEqual:") & 1) == 0) {
            goto LABEL_38;
          }
        }
        else if (originalTransactionDescription != v8)
        {
          goto LABEL_38;
        }
        bankCategoryDescription = self->_bankCategoryDescription;
        v11 = v6->_bankCategoryDescription;
        if (bankCategoryDescription && v11)
        {
          if ((-[NSString isEqual:](bankCategoryDescription, "isEqual:") & 1) == 0) {
            goto LABEL_38;
          }
        }
        else if (bankCategoryDescription != v11)
        {
          goto LABEL_38;
        }
        bankMerchantAddress = self->_bankMerchantAddress;
        v13 = v6->_bankMerchantAddress;
        if (bankMerchantAddress && v13)
        {
          if ((-[CNPostalAddress isEqual:](bankMerchantAddress, "isEqual:") & 1) == 0) {
            goto LABEL_38;
          }
        }
        else if (bankMerchantAddress != v13)
        {
          goto LABEL_38;
        }
        bankMerchantCategoryCode = self->_bankMerchantCategoryCode;
        v15 = v6->_bankMerchantCategoryCode;
        if (bankMerchantCategoryCode && v15)
        {
          if ((-[NSNumber isEqual:](bankMerchantCategoryCode, "isEqual:") & 1) == 0) {
            goto LABEL_38;
          }
        }
        else if (bankMerchantCategoryCode != v15)
        {
          goto LABEL_38;
        }
        bankMerchantName = self->_bankMerchantName;
        v17 = v6->_bankMerchantName;
        if (bankMerchantName && v17)
        {
          if ((-[NSString isEqual:](bankMerchantName, "isEqual:") & 1) == 0) {
            goto LABEL_38;
          }
        }
        else if (bankMerchantName != v17)
        {
          goto LABEL_38;
        }
        bankMerchantNumber = self->_bankMerchantNumber;
        v19 = v6->_bankMerchantNumber;
        if (bankMerchantNumber && v19)
        {
          if (-[NSString isEqual:](bankMerchantNumber, "isEqual:"))
          {
LABEL_34:
            bankStandardIndustrialClassificationCode = self->_bankStandardIndustrialClassificationCode;
            v21 = v6->_bankStandardIndustrialClassificationCode;
            if (bankStandardIndustrialClassificationCode && v21) {
              char v9 = -[NSString isEqual:](bankStandardIndustrialClassificationCode, "isEqual:");
            }
            else {
              char v9 = bankStandardIndustrialClassificationCode == v21;
            }
            goto LABEL_39;
          }
        }
        else if (bankMerchantNumber == v19)
        {
          goto LABEL_34;
        }
LABEL_38:
        char v9 = 0;
LABEL_39:

        goto LABEL_40;
      }
    }
    char v9 = 0;
  }
LABEL_40:

  return v9;
}

- (NSString)originalTransactionDescription
{
  return self->_originalTransactionDescription;
}

- (void)setOriginalTransactionDescription:(id)a3
{
}

- (NSString)bankCategoryDescription
{
  return self->_bankCategoryDescription;
}

- (void)setBankCategoryDescription:(id)a3
{
}

- (CNPostalAddress)bankMerchantAddress
{
  return self->_bankMerchantAddress;
}

- (void)setBankMerchantAddress:(id)a3
{
}

- (NSNumber)bankMerchantCategoryCode
{
  return self->_bankMerchantCategoryCode;
}

- (void)setBankMerchantCategoryCode:(id)a3
{
}

- (NSString)bankMerchantName
{
  return self->_bankMerchantName;
}

- (void)setBankMerchantName:(id)a3
{
}

- (NSString)bankMerchantNumber
{
  return self->_bankMerchantNumber;
}

- (void)setBankMerchantNumber:(id)a3
{
}

- (NSString)bankStandardIndustrialClassificationCode
{
  return self->_bankStandardIndustrialClassificationCode;
}

- (void)setBankStandardIndustrialClassificationCode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bankStandardIndustrialClassificationCode, 0);
  objc_storeStrong((id *)&self->_bankMerchantNumber, 0);
  objc_storeStrong((id *)&self->_bankMerchantName, 0);
  objc_storeStrong((id *)&self->_bankMerchantCategoryCode, 0);
  objc_storeStrong((id *)&self->_bankMerchantAddress, 0);
  objc_storeStrong((id *)&self->_bankCategoryDescription, 0);
  objc_storeStrong((id *)&self->_originalTransactionDescription, 0);
}

@end