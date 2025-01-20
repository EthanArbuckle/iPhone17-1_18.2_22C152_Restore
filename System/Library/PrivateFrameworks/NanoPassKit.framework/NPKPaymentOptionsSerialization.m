@interface NPKPaymentOptionsSerialization
+ (id)_billingAddressDictionaryFromEncodedData:(id)a3;
+ (id)_contactFromEncodedData:(id)a3;
+ (id)setTransactionDefaultsRequest;
+ (void)_deleteAllDefaultBillingAddresses:(id)a3;
+ (void)handleSetTransactionDefaultsRequest:(id)a3;
@end

@implementation NPKPaymentOptionsSerialization

+ (id)setTransactionDefaultsRequest
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v2 = objc_alloc_init(MEMORY[0x263F5C038]);
  v3 = objc_alloc_init(NPKProtoSetTransactionDefaultsRequest);
  v4 = [v2 defaultShippingAddress];
  if (v4)
  {
    v5 = pk_Payment_log();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

    if (v6)
    {
      v7 = pk_Payment_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v31[0]) = 0;
        _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Sending default shipping address", (uint8_t *)v31, 2u);
      }
    }
    v8 = NPKSecureArchiveObject(v4);
    [(NPKProtoSetTransactionDefaultsRequest *)v3 setDefaultShippingAddress:v8];
  }
  v9 = [v2 defaultContactEmail];
  if (v9)
  {
    v10 = pk_Payment_log();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

    if (v11)
    {
      v12 = pk_Payment_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v31[0]) = 0;
        _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Sending default contact email", (uint8_t *)v31, 2u);
      }
    }
    v13 = NPKSecureArchiveObject(v9);
    [(NPKProtoSetTransactionDefaultsRequest *)v3 setDefaultContactEmail:v13];
  }
  v14 = [v2 defaultContactPhone];
  if (v14)
  {
    v15 = pk_Payment_log();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);

    if (v16)
    {
      v17 = pk_Payment_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v31[0]) = 0;
        _os_log_impl(&dword_21E92F000, v17, OS_LOG_TYPE_DEFAULT, "Notice: Sending default contact phone", (uint8_t *)v31, 2u);
      }
    }
    v18 = NPKSecureArchiveObject(v14);
    [(NPKProtoSetTransactionDefaultsRequest *)v3 setDefaultContactPhone:v18];
  }
  v19 = [v2 defaultContactName];
  if (v19)
  {
    v20 = pk_Payment_log();
    BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

    if (v21)
    {
      v22 = pk_Payment_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v31[0]) = 0;
        _os_log_impl(&dword_21E92F000, v22, OS_LOG_TYPE_DEFAULT, "Notice: Sending default contact name", (uint8_t *)v31, 2u);
      }
    }
    v23 = NPKSecureArchiveObject(v19);
    [(NPKProtoSetTransactionDefaultsRequest *)v3 setDefaultContactName:v23];
  }
  v24 = [v2 _rawDefaultBillingAddresses];
  if (v24)
  {
    v25 = pk_Payment_log();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);

    if (v26)
    {
      v27 = pk_Payment_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        int v28 = [v24 count];
        v31[0] = 67109120;
        v31[1] = v28;
        _os_log_impl(&dword_21E92F000, v27, OS_LOG_TYPE_DEFAULT, "Notice: Sending %d default billing addresses", (uint8_t *)v31, 8u);
      }
    }
    v29 = NPKSecureArchiveObject(v24);
    [(NPKProtoSetTransactionDefaultsRequest *)v3 setDefaultBillingAddresses:v29];
  }
  return v3;
}

+ (void)handleSetTransactionDefaultsRequest:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F5C038]);
  if ([v4 hasDefaultShippingAddress])
  {
    BOOL v6 = [v4 defaultShippingAddress];
    v7 = [a1 _contactFromEncodedData:v6];

    if (v7)
    {
      v8 = pk_Payment_log();
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

      if (v9)
      {
        v10 = pk_Payment_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v32[0]) = 0;
          _os_log_impl(&dword_21E92F000, v10, OS_LOG_TYPE_DEFAULT, "Notice: Decoded default shipping address", (uint8_t *)v32, 2u);
        }
      }
      [v5 setDefaultShippingAddress:v7];
    }
  }
  else
  {
    [v5 deleteDefaultShippingAddress];
  }
  if ([v4 hasDefaultContactEmail])
  {
    BOOL v11 = [v4 defaultContactEmail];
    v12 = [a1 _contactFromEncodedData:v11];

    if (v12)
    {
      v13 = pk_Payment_log();
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

      if (v14)
      {
        v15 = pk_Payment_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v32[0]) = 0;
          _os_log_impl(&dword_21E92F000, v15, OS_LOG_TYPE_DEFAULT, "Notice: Decoded default contact email", (uint8_t *)v32, 2u);
        }
      }
      [v5 setDefaultContactEmail:v12];
    }
  }
  else
  {
    [v5 deleteDefaultContactEmail];
  }
  if ([v4 hasDefaultContactPhone])
  {
    BOOL v16 = [v4 defaultContactPhone];
    v17 = [a1 _contactFromEncodedData:v16];

    if (v17)
    {
      v18 = pk_Payment_log();
      BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

      if (v19)
      {
        v20 = pk_Payment_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v32[0]) = 0;
          _os_log_impl(&dword_21E92F000, v20, OS_LOG_TYPE_DEFAULT, "Notice: Decoded default contact phone", (uint8_t *)v32, 2u);
        }
      }
      [v5 setDefaultContactPhone:v17];
    }
  }
  else
  {
    [v5 deleteDefaultContactPhone];
  }
  if ([v4 hasDefaultContactName])
  {
    BOOL v21 = [v4 defaultContactName];
    v22 = [a1 _contactFromEncodedData:v21];

    if (v22)
    {
      v23 = pk_Payment_log();
      BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);

      if (v24)
      {
        v25 = pk_Payment_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v32[0]) = 0;
          _os_log_impl(&dword_21E92F000, v25, OS_LOG_TYPE_DEFAULT, "Notice: Decoded default contact name", (uint8_t *)v32, 2u);
        }
      }
      [v5 setDefaultContactName:v22];
    }
  }
  else
  {
    [v5 deleteDefaultContactName];
  }
  if ([v4 hasDefaultBillingAddresses])
  {
    BOOL v26 = [v4 defaultBillingAddresses];
    v27 = [a1 _billingAddressDictionaryFromEncodedData:v26];

    if (v27)
    {
      int v28 = pk_Payment_log();
      BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);

      if (v29)
      {
        v30 = pk_Payment_log();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          int v31 = [v27 count];
          v32[0] = 67109120;
          v32[1] = v31;
          _os_log_impl(&dword_21E92F000, v30, OS_LOG_TYPE_DEFAULT, "Notice: Decoded %d default billing addresses", (uint8_t *)v32, 8u);
        }
      }
      [v5 _setRawDefaultBillingAddresses:v27];
    }
  }
  else
  {
    [a1 _deleteAllDefaultBillingAddresses:v5];
  }
}

+ (void)_deleteAllDefaultBillingAddresses:(id)a3
{
  v3 = NSDictionary;
  id v4 = a3;
  id v5 = [v3 dictionary];
  [v4 _setRawDefaultBillingAddresses:v5];
}

+ (id)_contactFromEncodedData:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_class();
  id v5 = NPKSecureUnarchiveObject(v3, v4);

  return v5;
}

+ (id)_billingAddressDictionaryFromEncodedData:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x263F08928]) initForReadingFromData:v3 error:0];
  id v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, objc_opt_class(), 0);
  BOOL v11 = [v4 decodeObjectOfClasses:v10 forKey:*MEMORY[0x263F081D0]];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = pk_General_log();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);

    if (v13)
    {
      BOOL v14 = pk_General_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E92F000, v14, OS_LOG_TYPE_ERROR, "Error: Billing address is not a dictionary", buf, 2u);
      }
    }
    BOOL v11 = 0;
  }

  return v11;
}

@end