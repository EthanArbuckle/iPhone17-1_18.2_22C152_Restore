@interface SUStorePageDataProvider
- (BOOL)parseData:(id)a3 returningError:(id *)a4;
- (BOOL)shouldProcessTouchIDDialogs;
- (ISPropertyListProvider)propertyListDataProvider;
- (SUClientInterface)clientInterface;
- (int64_t)outputType;
- (void)_loadPersonalizedStoreOffersForPage:(id)a3;
- (void)setClientInterface:(id)a3;
- (void)setOutputType:(int64_t)a3;
- (void)setPropertyListDataProvider:(id)a3;
@end

@implementation SUStorePageDataProvider

- (BOOL)parseData:(id)a3 returningError:(id *)a4
{
  id v6 = a3;
  v7 = [(ISDataProvider *)self contentType];
  if ([v7 isEqualToString:@"text/html"])
  {
    [(ISDataProvider *)self setOutput:v6];
    LOBYTE(v8) = 1;
    [(SUStorePageDataProvider *)self setOutputType:1];
    goto LABEL_7;
  }
  if (![v7 hasPrefix:@"image"])
  {
    if ([v7 rangeOfString:@"itml" options:1] != 0x7FFFFFFFFFFFFFFFLL)
    {
      [(ISDataProvider *)self setOutput:v6];
      [(SUStorePageDataProvider *)self setOutputType:5];
      id v10 = 0;
      LOBYTE(v8) = 1;
      if (!a4) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
    v12 = [(SUStorePageDataProvider *)self propertyListDataProvider];
    id v13 = (id)[v12 copy];

    if (!v13) {
      id v13 = objc_alloc_init(MEMORY[0x263F89508]);
    }
    [v13 configureFromProvider:self];
    [v13 setShouldPostFooterSectionChanged:0];
    int v30 = [v13 shouldProcessAuthenticationDialogs];
    BOOL v33 = [(SUStorePageDataProvider *)self shouldProcessTouchIDDialogs];
    int v31 = [v13 shouldProcessDialogs];
    v14 = [(SUStorePageDataProvider *)self clientInterface];
    if (v14)
    {
      [v13 setShouldProcessAuthenticationDialogs:0];
      [v13 setShouldProcessDialogs:0];
    }
    id v41 = 0;
    int v8 = [v13 parseData:v6 returningError:&v41];
    id v10 = v41;
    v15 = [v13 output];
    if (!v8)
    {
LABEL_27:
      if (!v14) {
        goto LABEL_53;
      }
      v19 = [v15 objectForKey:*MEMORY[0x263F89580]];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_52:

LABEL_53:
        if (!a4) {
          goto LABEL_9;
        }
        goto LABEL_8;
      }
      v27 = v19;
      v20 = (void *)[objc_alloc(MEMORY[0x263F89488]) initWithDialogDictionary:v19];
      v29 = v20;
      if ([v20 kind] == 1)
      {
        if (v33)
        {
          uint64_t v21 = [v15 objectForKey:*MEMORY[0x263F89598]];
          v34 = [v15 objectForKey:*MEMORY[0x263F89590]];
          objc_opt_class();
          v32 = (void *)v21;
          if (objc_opt_isKindOfClass()) {
            uint64_t v22 = [objc_alloc(MEMORY[0x263F89530]) initWithDialogDictionary:v21];
          }
          else {
            uint64_t v22 = 0;
          }
          v19 = v27;
          id v40 = v10;
          v28 = (void *)v22;
          int v8 = [(ISDataProvider *)self runTouchIDAuthorizationDialog:v22 fallbackDialog:v29 metricsDictionary:v34 error:&v40];
          id v26 = v40;

          if (v26) {
            int v25 = 1;
          }
          else {
            int v25 = v8;
          }
          if (v25) {
            id v10 = v26;
          }
          else {
            id v10 = 0;
          }
          if ((v25 & 1) == 0 && ((v30 ^ 1) & 1) == 0)
          {
            id v39 = 0;
            LOBYTE(v8) = [(ISDataProvider *)self runAuthorizationDialog:v29 error:&v39];
            id v10 = v39;
          }

          v23 = v28;
          goto LABEL_50;
        }
        if (v30)
        {
          id v38 = v10;
          LOBYTE(v8) = [(ISDataProvider *)self runAuthorizationDialog:v20 error:&v38];
          id v24 = v38;
          v23 = v10;
          id v10 = v24;
          goto LABEL_37;
        }
      }
      else if (v31)
      {
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __52__SUStorePageDataProvider_parseData_returningError___block_invoke;
        block[3] = &unk_264812290;
        id v36 = v14;
        id v37 = v20;
        dispatch_async(MEMORY[0x263EF83A0], block);

        v23 = v36;
LABEL_37:
        v19 = v27;
LABEL_50:

        goto LABEL_51;
      }
      v19 = v27;
LABEL_51:

      goto LABEL_52;
    }
    if (+[SUStructuredPage pageTypeForStorePageDictionary:v15] == 6)
    {
      [(ISDataProvider *)self setOutput:v15];
      v16 = self;
      uint64_t v17 = 3;
    }
    else
    {
      if ([v7 caseInsensitiveCompare:@"application/json"])
      {
        v18 = objc_alloc_init(SUStructuredPage);
        if ([(SUStructuredPage *)v18 loadFromDictionary:v15]) {
          [(SUStorePageDataProvider *)self _loadPersonalizedStoreOffersForPage:v18];
        }
        [(ISDataProvider *)self setOutput:v18];
        [(SUStorePageDataProvider *)self setOutputType:0];

        goto LABEL_26;
      }
      [(ISDataProvider *)self setOutput:v15];
      v16 = self;
      uint64_t v17 = 4;
    }
    [(SUStorePageDataProvider *)v16 setOutputType:v17];
LABEL_26:
    [(ISDataProvider *)self migrateOutputFromSubProvider:v13];
    goto LABEL_27;
  }
  v9 = (void *)[objc_alloc(MEMORY[0x263F1C6B0]) initWithData:v6];
  LOBYTE(v8) = v9 != 0;
  if (v9)
  {
    [(ISDataProvider *)self setOutput:v9];
    [(SUStorePageDataProvider *)self setOutputType:2];
  }

LABEL_7:
  id v10 = 0;
  if (a4) {
LABEL_8:
  }
    *a4 = v10;
LABEL_9:

  return v8;
}

uint64_t __52__SUStorePageDataProvider_parseData_returningError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentDialog:*(void *)(a1 + 40)];
}

- (BOOL)shouldProcessTouchIDDialogs
{
  v2 = [(ISDataProvider *)self biometricAuthenticationContext];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_loadPersonalizedStoreOffersForPage:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(ISDataProvider *)self authenticatedAccountDSID];
  if (v5) {
    goto LABEL_4;
  }
  id v6 = [(ISDataProvider *)self authenticationContext];
  uint64_t v5 = [v6 requiredUniqueIdentifier];

  if (v5) {
    goto LABEL_4;
  }
  v7 = [MEMORY[0x263F7B0E8] defaultStore];
  int v8 = [v7 activeAccount];
  uint64_t v5 = [v8 uniqueIdentifier];

  if (v5)
  {
LABEL_4:
    id v41 = objc_alloc_init(MEMORY[0x263F894F0]);
    [v41 setAccountIdentifier:v5];
    id v40 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v9 = [v4 itemList];
    id v10 = (id)[v9 copyItems];

    uint64_t v11 = [v4 item];
    id v36 = (void *)v11;
    id v37 = (void *)v5;
    if (v11)
    {
      uint64_t v12 = v11;
      if (!v10) {
        id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
      }
      [v10 addObject:v12];
    }
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    obuint64_t j = v10;
    uint64_t v13 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v47 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          v18 = [v17 defaultStoreOffer];
          if (v18)
          {
            v19 = objc_msgSend([NSString alloc], "initWithFormat:", @"%lld", objc_msgSend(v17, "itemIdentifier"));
            v20 = [v17 itemTypeString];
            [v41 addItemIdentifier:v19 forItemType:v20];

            [v40 setObject:v17 forKey:v19];
          }
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
      }
      while (v14);
    }

    uint64_t v21 = (void *)[objc_alloc(MEMORY[0x263F894E8]) initWithPersonalizeOffersRequest:v41];
    [v21 main];
    uint64_t v22 = [v21 response];
    if (v22)
    {
      v34 = v21;
      id v35 = v4;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v23 = v40;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v42 objects:v50 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v39 = *(void *)v43;
        do
        {
          for (uint64_t j = 0; j != v25; ++j)
          {
            if (*(void *)v43 != v39) {
              objc_enumerationMutation(v23);
            }
            uint64_t v27 = *(void *)(*((void *)&v42 + 1) + 8 * j);
            v28 = [v22 actionParametersForItemIdentifier:v27];
            if (v28)
            {
              v29 = [v23 objectForKey:v27];
              int v30 = [v29 defaultStoreOffer];
              [v30 setBuyParameters:v28];
              int v31 = [v29 itemTypeString];
              v32 = [v22 priceDisplayForItemType:v31];
              if (v32) {
                [v30 setPriceDisplay:v32];
              }
              BOOL v33 = [v22 actionDisplayNameForItemType:v31];
              [v30 setActionDisplayName:v33];
              [v30 setOneTapOffer:v33 == 0];
            }
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v42 objects:v50 count:16];
        }
        while (v25);
      }

      uint64_t v21 = v34;
      id v4 = v35;
    }
  }
}

- (SUClientInterface)clientInterface
{
  return (SUClientInterface *)objc_getProperty(self, a2, 112, 1);
}

- (void)setClientInterface:(id)a3
{
}

- (int64_t)outputType
{
  return self->_outputType;
}

- (void)setOutputType:(int64_t)a3
{
  self->_outputType = a3;
}

- (ISPropertyListProvider)propertyListDataProvider
{
  return (ISPropertyListProvider *)objc_getProperty(self, a2, 128, 1);
}

- (void)setPropertyListDataProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyListDataProvider, 0);

  objc_storeStrong((id *)&self->_clientInterface, 0);
}

@end