@interface NPKPeerPaymentQuickTypeParser
- (NPKPeerPaymentQuickTypeParser)initWithSupportedCurrencyCodes:(id)a3 allowedPayloadIDs:(id)a4;
- (NSSet)allowedPayloadIDs;
- (NSSet)supportedCurrencyCodes;
- (id)parsePayload:(id)a3 payloadID:(id)a4;
- (id)parsePayload:(id)a3 payloadID:(id)a4 maxCount:(unint64_t)a5;
@end

@implementation NPKPeerPaymentQuickTypeParser

- (NPKPeerPaymentQuickTypeParser)initWithSupportedCurrencyCodes:(id)a3 allowedPayloadIDs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)NPKPeerPaymentQuickTypeParser;
  v8 = [(NPKPeerPaymentQuickTypeParser *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x263EFFA08] setWithArray:v6];
    supportedCurrencyCodes = v8->_supportedCurrencyCodes;
    v8->_supportedCurrencyCodes = (NSSet *)v9;

    uint64_t v11 = [MEMORY[0x263EFFA08] setWithArray:v7];
    allowedPayloadIDs = v8->_allowedPayloadIDs;
    v8->_allowedPayloadIDs = (NSSet *)v11;
  }
  return v8;
}

- (id)parsePayload:(id)a3 payloadID:(id)a4
{
  return [(NPKPeerPaymentQuickTypeParser *)self parsePayload:a3 payloadID:a4 maxCount:0];
}

- (id)parsePayload:(id)a3 payloadID:(id)a4 maxCount:(unint64_t)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  v10 = pk_General_log();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);

  if (v11)
  {
    v12 = pk_General_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v33 = v9;
      __int16 v34 = 2112;
      id v35 = v8;
      _os_log_impl(&dword_21E92F000, v12, OS_LOG_TYPE_DEFAULT, "Notice: Starting Parse payload for PayloadID:%@ payload:%@", buf, 0x16u);
    }
  }
  v13 = [MEMORY[0x263EFF980] array];
  objc_super v14 = [(NPKPeerPaymentQuickTypeParser *)self allowedPayloadIDs];
  id v15 = v9;
  id v16 = v14;
  if (![v16 count])
  {

    goto LABEL_10;
  }
  if (!v15)
  {

    goto LABEL_13;
  }
  int v17 = [v16 containsObject:v15];

  if (v17)
  {
LABEL_10:
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    v20 = [(NPKPeerPaymentQuickTypeParser *)self supportedCurrencyCodes];
    v21 = objc_msgSend(v8, "npk_objectForKey:class:", @"Currency", objc_opt_class());
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __65__NPKPeerPaymentQuickTypeParser_parsePayload_payloadID_maxCount___block_invoke;
    v26[3] = &unk_2644D3858;
    uint64_t v29 = v18;
    uint64_t v30 = v19;
    id v27 = v20;
    id v28 = v13;
    unint64_t v31 = a5;
    id v22 = v20;
    [v21 enumerateObjectsUsingBlock:v26];

LABEL_11:
    goto LABEL_16;
  }
LABEL_13:
  v23 = pk_General_log();
  BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);

  if (v24)
  {
    v21 = pk_General_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v15;
      _os_log_impl(&dword_21E92F000, v21, OS_LOG_TYPE_DEFAULT, "Warning: PayloadID:%@ Not allowed", buf, 0xCu);
    }
    goto LABEL_11;
  }
LABEL_16:

  return v13;
}

void __65__NPKPeerPaymentQuickTypeParser_parsePayload_payloadID_maxCount___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a2;
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v6 npk_objectForKey:@"CurrencyType" class:*(void *)(a1 + 56)];
    id v8 = *(void **)(a1 + 32);
    id v9 = v7;
    id v10 = v8;
    BOOL v11 = v10;
    if (v9)
    {
      if (![v10 count])
      {

        goto LABEL_11;
      }
      int v12 = [v11 containsObject:v9];

      if (v12)
      {
LABEL_11:
        id v15 = [v6 npk_objectForKey:@"CurrencyValue" class:*(void *)(a1 + 56)];
        if (v15)
        {
          id v16 = [MEMORY[0x263F087B0] decimalNumberWithString:v15];
          if (v16)
          {
            int v17 = [MEMORY[0x263F087B0] notANumber];
            char v18 = [(NSDecimalNumber *)v16 isEqual:v17];

            if ((v18 & 1) == 0)
            {
              uint64_t v19 = PKCurrencyAmountCreate(v16, (NSString *)v9);
              if (v19) {
                [*(id *)(a1 + 40) addObject:v19];
              }
              v20 = pk_General_log();
              BOOL v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);

              if (v21)
              {
                id v22 = pk_General_log();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                {
                  int v26 = 138412290;
                  id v27 = v19;
                  _os_log_impl(&dword_21E92F000, v22, OS_LOG_TYPE_DEFAULT, "Notice: found valid amount:%@", (uint8_t *)&v26, 0xCu);
                }
              }
              uint64_t v23 = *(void *)(a1 + 64);
              if (v23) {
                LOBYTE(v23) = [*(id *)(a1 + 40) count] == *(void *)(a1 + 64);
              }
              *a4 = v23;
              goto LABEL_27;
            }
          }
        }
        else
        {
          id v16 = 0;
        }
        BOOL v24 = pk_General_log();
        BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);

        if (!v25)
        {
LABEL_28:

          goto LABEL_29;
        }
        uint64_t v19 = pk_General_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          int v26 = 138412290;
          id v27 = v6;
          _os_log_impl(&dword_21E92F000, v19, OS_LOG_TYPE_DEFAULT, "Warning: Not supported value from info:%@", (uint8_t *)&v26, 0xCu);
        }
LABEL_27:

        goto LABEL_28;
      }
    }
    else
    {
    }
    v13 = pk_General_log();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);

    if (!v14)
    {
LABEL_30:

      goto LABEL_31;
    }
    id v15 = pk_General_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 138412290;
      id v27 = v6;
      _os_log_impl(&dword_21E92F000, v15, OS_LOG_TYPE_DEFAULT, "Warning: Not supported currency code from info:%@", (uint8_t *)&v26, 0xCu);
    }
LABEL_29:

    goto LABEL_30;
  }
LABEL_31:
}

- (NSSet)supportedCurrencyCodes
{
  return self->_supportedCurrencyCodes;
}

- (NSSet)allowedPayloadIDs
{
  return self->_allowedPayloadIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedPayloadIDs, 0);
  objc_storeStrong((id *)&self->_supportedCurrencyCodes, 0);
}

@end