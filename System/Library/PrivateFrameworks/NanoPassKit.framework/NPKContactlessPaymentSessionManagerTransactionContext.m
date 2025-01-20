@interface NPKContactlessPaymentSessionManagerTransactionContext
+ (id)_NPKTransactionContextActionDescriptionForNPKTransactionContextAction:(unint64_t)a3;
- (BOOL)authenticationRequested;
- (NPKContactlessPaymentSessionManagerTransactionContext)init;
- (NPKPaymentBarcode)paymentBarcode;
- (NSArray)displayablePassItems;
- (NSString)paymentMethodDescription;
- (NSString)transactionDescription;
- (PKHMAccessory)accessory;
- (PKPass)transactionPass;
- (PKPass)valueAddedServicePass;
- (PKPassTile)passTile;
- (PKPaymentTransaction)paymentTransaction;
- (STS18013ReaderAuthInfo)readerAuthInfo;
- (STSTransaction18013Request)releaseDataRequest;
- (id)description;
- (unint64_t)action;
- (unint64_t)releaseDataStatus;
- (unint64_t)transactionStatus;
- (unint64_t)transactionType;
- (void)forceToTransitTypeTransactionWithTransactionStatus:(unint64_t)a3;
- (void)setAccessory:(id)a3;
- (void)setAction:(unint64_t)a3;
- (void)setAuthenticationRequested:(BOOL)a3;
- (void)setDisplayablePassItems:(id)a3;
- (void)setPassTile:(id)a3;
- (void)setPaymentBarcode:(id)a3;
- (void)setPaymentMethodDescription:(id)a3;
- (void)setPaymentTransaction:(id)a3;
- (void)setReaderAuthInfo:(id)a3;
- (void)setReleaseDataRequest:(id)a3;
- (void)setReleaseDataStatus:(unint64_t)a3;
- (void)setTransactionDescription:(id)a3;
- (void)setTransactionPass:(id)a3;
- (void)setTransactionStatus:(unint64_t)a3;
- (void)setTransactionType:(unint64_t)a3;
- (void)setValueAddedServicePass:(id)a3;
- (void)updateWithConcreteTransactions:(id)a3 ephemeralTransaction:(id)a4 updatedPassTransitItems:(id)a5 paymentApplication:(id)a6;
@end

@implementation NPKContactlessPaymentSessionManagerTransactionContext

- (NPKContactlessPaymentSessionManagerTransactionContext)init
{
  v5.receiver = self;
  v5.super_class = (Class)NPKContactlessPaymentSessionManagerTransactionContext;
  v2 = [(NPKContactlessPaymentSessionManagerTransactionContext *)&v5 init];
  v3 = v2;
  if (v2) {
    [(NPKContactlessPaymentSessionManagerTransactionContext *)v2 setTransactionStatus:2];
  }
  return v3;
}

- (void)updateWithConcreteTransactions:(id)a3 ephemeralTransaction:(id)a4 updatedPassTransitItems:(id)a5 paymentApplication:(id)a6
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__8;
  v58 = __Block_byref_object_dispose__8;
  id v59 = 0;
  uint64_t v50 = 0;
  v51 = &v50;
  uint64_t v52 = 0x2020000000;
  uint64_t v53 = 0;
  uint64_t v44 = 0;
  v45 = &v44;
  uint64_t v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__8;
  v48 = __Block_byref_object_dispose__8;
  id v49 = 0;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  uint64_t v43 = 0;
  v14 = [MEMORY[0x263F08A98] predicateWithBlock:&__block_literal_global_10];
  v15 = [v12 filteredArrayUsingPredicate:v14];

  v16 = pk_General_log();
  BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

  if (v17)
  {
    v18 = pk_General_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      *(void *)v61 = v10;
      *(_WORD *)&v61[8] = 2112;
      *(void *)&v61[10] = v11;
      *(_WORD *)&v61[18] = 2112;
      *(void *)&v61[20] = v12;
      *(_WORD *)&v61[28] = 2112;
      *(void *)&v61[30] = v13;
      _os_log_impl(&dword_21E92F000, v18, OS_LOG_TYPE_DEFAULT, "Notice: NPKPaymentView: updateWithConcreteTransactions:%@ ephemeralTransaction:%@ updatedPassTransitItems:%@ paymentApplication:%@", buf, 0x2Au);
    }
  }
  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __152__NPKContactlessPaymentSessionManagerTransactionContext_updateWithConcreteTransactions_ephemeralTransaction_updatedPassTransitItems_paymentApplication___block_invoke_375;
  v34[3] = &unk_2644D4700;
  v36 = &v50;
  v37 = &v40;
  v38 = &v44;
  id v19 = v13;
  id v35 = v19;
  v39 = &v54;
  v20 = (void (**)(void, void))MEMORY[0x223C37380](v34);
  v21 = v20;
  if (v11)
  {
    ((void (**)(void, id))v20)[2](v20, v11);
  }
  else
  {
    uint64_t v29 = MEMORY[0x263EF8330];
    uint64_t v30 = 3221225472;
    v31 = __152__NPKContactlessPaymentSessionManagerTransactionContext_updateWithConcreteTransactions_ephemeralTransaction_updatedPassTransitItems_paymentApplication___block_invoke_393;
    v32 = &unk_2644D4728;
    v33 = v20;
    [v10 enumerateObjectsUsingBlock:&v29];
  }
  -[NPKContactlessPaymentSessionManagerTransactionContext setPaymentTransaction:](self, "setPaymentTransaction:", v55[5], v29, v30, v31, v32);
  [(NPKContactlessPaymentSessionManagerTransactionContext *)self setTransactionType:v51[3]];
  [(NPKContactlessPaymentSessionManagerTransactionContext *)self setTransactionDescription:v45[5]];
  [(NPKContactlessPaymentSessionManagerTransactionContext *)self setDisplayablePassItems:v15];
  [(NPKContactlessPaymentSessionManagerTransactionContext *)self setAction:v41[3]];
  v22 = pk_Payment_log();
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);

  if (v23)
  {
    v24 = pk_Payment_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      int v25 = *((_DWORD *)v51 + 6);
      v26 = [(id)objc_opt_class() _NPKTransactionContextActionDescriptionForNPKTransactionContextAction:v41[3]];
      uint64_t v27 = v45[5];
      uint64_t v28 = v55[5];
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)v61 = v25;
      *(_WORD *)&v61[4] = 2112;
      *(void *)&v61[6] = v15;
      *(_WORD *)&v61[14] = 2112;
      *(void *)&v61[16] = v26;
      *(_WORD *)&v61[24] = 2112;
      *(void *)&v61[26] = v27;
      *(_WORD *)&v61[34] = 2112;
      *(void *)&v61[36] = v28;
      _os_log_impl(&dword_21E92F000, v24, OS_LOG_TYPE_DEFAULT, "Notice: Transaction complete context: got transaction type %d displayable pass Items %@ action %@ transactionDescription:\"%@\" transactions:%@", buf, 0x30u);
    }
  }

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v54, 8);
}

uint64_t __152__NPKContactlessPaymentSessionManagerTransactionContext_updateWithConcreteTransactions_ephemeralTransaction_updatedPassTransitItems_paymentApplication___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 conformsToProtocol:&unk_26D078108])
  {
    uint64_t v3 = 1;
  }
  else if ([v2 conformsToProtocol:&unk_26D078270])
  {
    uint64_t v3 = [v2 isCountBasedCommutePlan];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

void __152__NPKContactlessPaymentSessionManagerTransactionContext_updateWithConcreteTransactions_ephemeralTransaction_updatedPassTransitItems_paymentApplication___block_invoke_375(uint64_t a1, void *a2)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = a2;
  objc_super v5 = pk_ui_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    v7 = pk_ui_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [v4 transitType];
      uint64_t v9 = [v4 transitType];
      id v10 = [v4 amount];
      id v11 = [v4 amounts];
      int v29 = 138413314;
      id v30 = v4;
      __int16 v31 = 2048;
      uint64_t v32 = v8;
      __int16 v33 = 2048;
      uint64_t v34 = v9;
      __int16 v35 = 2112;
      v36 = v10;
      __int16 v37 = 2112;
      v38 = v11;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: NPKPaymentView: Evaluate transaction %@ with type:%ld transitSubtype:%ld amount:%@ amounts: %@ ", (uint8_t *)&v29, 0x34u);
    }
  }
  if ([v4 transactionType] == 2)
  {
    uint64_t v12 = [v4 transitType];
    if (v12 == 1025)
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      if (([v4 enRoute] & 1) == 0) {
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 2;
      }
      id v13 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoPassKitUI"];
      v14 = v13;
      v15 = @"TRANSIT_TRANSACTION_TITLE_GREEN_CAR";
      goto LABEL_14;
    }
    if (v12 == 257)
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 2;
      if (([v4 enRoute] & 1) == 0) {
        *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 2;
      }
      id v13 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.NanoPassKitUI"];
      v14 = v13;
      v15 = @"TRANSIT_TRANSACTION_TITLE_SHINKANSEN";
LABEL_14:
      uint64_t v16 = [v13 localizedStringForKey:v15 value:&stru_26CFEBA18 table:@"NanoPassKitUI-Transit"];
      uint64_t v17 = *(void *)(*(void *)(a1 + 56) + 8);
      v18 = *(void **)(v17 + 40);
      *(void *)(v17 + 40) = v16;

      goto LABEL_15;
    }
    uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
    if (!*(void *)(v19 + 24)) {
      *(void *)(v19 + 24) = 3;
    }
    uint64_t v20 = [v4 amount];
    if (v20)
    {
      v21 = (void *)v20;
      v22 = [v4 currencyCode];

      if (!v22)
      {
        BOOL v23 = [*(id *)(a1 + 32) appletCurrencyCode];
        [v4 setCurrencyCode:v23];
      }
    }
    v24 = [v4 amount];
    if (v24 && ([v4 currencyCode], (int v25 = objc_claimAutoreleasedReturnValue()) != 0))
    {
    }
    else
    {
      v26 = [v4 amounts];
      if (![v26 count])
      {
        uint64_t v27 = [v4 plans];
        uint64_t v28 = [v27 count];

        if (v24) {
        if (!v28)
        }
          goto LABEL_28;
        goto LABEL_27;
      }

      if (!v24)
      {
LABEL_27:
        objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
LABEL_28:
        if ([v4 enRoute]) {
          *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
        }
        goto LABEL_15;
      }
    }

    goto LABEL_27;
  }
LABEL_15:
}

uint64_t __152__NPKContactlessPaymentSessionManagerTransactionContext_updateWithConcreteTransactions_ephemeralTransaction_updatedPassTransitItems_paymentApplication___block_invoke_393(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)forceToTransitTypeTransactionWithTransactionStatus:(unint64_t)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  objc_super v5 = pk_General_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);

  if (v6)
  {
    v7 = pk_General_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 134217984;
      unint64_t v9 = a3;
      _os_log_impl(&dword_21E92F000, v7, OS_LOG_TYPE_DEFAULT, "Notice: Requested forceToTransitTypeTransactionWithTransactionStatus:%lu", (uint8_t *)&v8, 0xCu);
    }
  }
  if (a3 <= 5) {
    [(NPKContactlessPaymentSessionManagerTransactionContext *)self setTransactionStatus:qword_21EBB1720[a3]];
  }
}

+ (id)_NPKTransactionContextActionDescriptionForNPKTransactionContextAction:(unint64_t)a3
{
  if (a3 - 1 > 4) {
    return @"None";
  }
  else {
    return off_2644D4A00[a3 - 1];
  }
}

- (id)description
{
  v17.receiver = self;
  v17.super_class = (Class)NPKContactlessPaymentSessionManagerTransactionContext;
  uint64_t v3 = [(NPKContactlessPaymentSessionManagerTransactionContext *)&v17 description];
  id v4 = (void *)[v3 mutableCopy];

  objc_super v5 = [(NPKContactlessPaymentSessionManagerTransactionContext *)self transactionPass];
  BOOL v6 = [(NPKContactlessPaymentSessionManagerTransactionContext *)self valueAddedServicePass];
  v7 = [(NPKContactlessPaymentSessionManagerTransactionContext *)self transactionDescription];
  int v8 = NSStringFromNPKContactlessPaymentSessionTransactionType([(NPKContactlessPaymentSessionManagerTransactionContext *)self transactionType]);
  unint64_t v9 = [(NPKContactlessPaymentSessionManagerTransactionContext *)self transactionDescription];
  uint64_t v10 = [(NPKContactlessPaymentSessionManagerTransactionContext *)self displayablePassItems];
  id v11 = NSStringFromNPKTransactionContextStatus([(NPKContactlessPaymentSessionManagerTransactionContext *)self transactionStatus]);
  [v4 appendFormat:@" (transactionPass %@ valueAddedServicePass %@ paymentMethodDescription %@ transactionType %@ transactionDescription %@ displayablePassItems %@ transactionStatus: %@)\n", v5, v6, v7, v8, v9, v10, v11];

  uint64_t v12 = [(NPKContactlessPaymentSessionManagerTransactionContext *)self paymentBarcode];
  [v4 appendFormat:@" (Barcode payment related: paymentBarcode %@ authentication requested %d)", v12, -[NPKContactlessPaymentSessionManagerTransactionContext authenticationRequested](self, "authenticationRequested")];

  id v13 = NSStringFromNPKDataReleaseStatus([(NPKContactlessPaymentSessionManagerTransactionContext *)self releaseDataStatus]);
  [v4 appendFormat:@" (releaseDataStatus:%@)\n", v13];

  v14 = objc_msgSend((id)objc_opt_class(), "_NPKTransactionContextActionDescriptionForNPKTransactionContextAction:", -[NPKContactlessPaymentSessionManagerTransactionContext action](self, "action"));
  [v4 appendFormat:@" (Action :%@)", v14];
  v15 = [(NPKContactlessPaymentSessionManagerTransactionContext *)self accessory];
  [v4 appendFormat:@" (Accessory :%@)", v15];

  return v4;
}

- (PKPass)transactionPass
{
  return self->_transactionPass;
}

- (void)setTransactionPass:(id)a3
{
}

- (PKPass)valueAddedServicePass
{
  return self->_valueAddedServicePass;
}

- (void)setValueAddedServicePass:(id)a3
{
}

- (NSString)paymentMethodDescription
{
  return self->_paymentMethodDescription;
}

- (void)setPaymentMethodDescription:(id)a3
{
}

- (PKPaymentTransaction)paymentTransaction
{
  return self->_paymentTransaction;
}

- (void)setPaymentTransaction:(id)a3
{
}

- (unint64_t)transactionStatus
{
  return self->_transactionStatus;
}

- (void)setTransactionStatus:(unint64_t)a3
{
  self->_transactionStatus = a3;
}

- (unint64_t)transactionType
{
  return self->_transactionType;
}

- (void)setTransactionType:(unint64_t)a3
{
  self->_transactionType = a3;
}

- (unint64_t)action
{
  return self->_action;
}

- (void)setAction:(unint64_t)a3
{
  self->_action = a3;
}

- (NSString)transactionDescription
{
  return self->_transactionDescription;
}

- (void)setTransactionDescription:(id)a3
{
}

- (NSArray)displayablePassItems
{
  return self->_displayablePassItems;
}

- (void)setDisplayablePassItems:(id)a3
{
}

- (NPKPaymentBarcode)paymentBarcode
{
  return self->_paymentBarcode;
}

- (void)setPaymentBarcode:(id)a3
{
}

- (BOOL)authenticationRequested
{
  return self->_authenticationRequested;
}

- (void)setAuthenticationRequested:(BOOL)a3
{
  self->_authenticationRequested = a3;
}

- (unint64_t)releaseDataStatus
{
  return self->_releaseDataStatus;
}

- (void)setReleaseDataStatus:(unint64_t)a3
{
  self->_releaseDataStatus = a3;
}

- (STSTransaction18013Request)releaseDataRequest
{
  return self->_releaseDataRequest;
}

- (void)setReleaseDataRequest:(id)a3
{
}

- (STS18013ReaderAuthInfo)readerAuthInfo
{
  return self->_readerAuthInfo;
}

- (void)setReaderAuthInfo:(id)a3
{
}

- (PKPassTile)passTile
{
  return self->_passTile;
}

- (void)setPassTile:(id)a3
{
}

- (PKHMAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_storeStrong((id *)&self->_passTile, 0);
  objc_storeStrong((id *)&self->_readerAuthInfo, 0);
  objc_storeStrong((id *)&self->_releaseDataRequest, 0);
  objc_storeStrong((id *)&self->_paymentBarcode, 0);
  objc_storeStrong((id *)&self->_displayablePassItems, 0);
  objc_storeStrong((id *)&self->_transactionDescription, 0);
  objc_storeStrong((id *)&self->_paymentTransaction, 0);
  objc_storeStrong((id *)&self->_paymentMethodDescription, 0);
  objc_storeStrong((id *)&self->_valueAddedServicePass, 0);
  objc_storeStrong((id *)&self->_transactionPass, 0);
}

@end