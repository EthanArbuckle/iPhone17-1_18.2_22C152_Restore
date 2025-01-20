@interface MicroPayment
+ (BOOL)responseIsValid:(id)a3;
+ (id)paymentEntityFromContext:(id)a3;
- (BOOL)isEqualToResponse:(id)a3 compareAllFields:(BOOL)a4;
- (BOOL)isReady;
- (BOOL)isTransientFailed;
- (NSString)matchingIdentifier;
- (id)_temporaryIdentifier;
- (id)copyPaymentTransaction;
- (int64_t)_clientStateForServerState:(int64_t)a3;
- (int64_t)_serverStateForClientState:(int64_t)a3;
- (void)_updateDownloadsFromResponse:(id)a3;
- (void)awakeFromInsert;
- (void)dealloc;
- (void)mergeValuesFromResponse:(id)a3;
- (void)setFailedWithError:(id)a3;
- (void)setTransactionIdentifier:(id)a3;
- (void)setTransientFailed:(BOOL)a3;
- (void)setValuesWithPaymentTransaction:(id)a3;
@end

@implementation MicroPayment

- (void)dealloc
{
  self->_temporaryIdentifier = 0;
  v3.receiver = self;
  v3.super_class = (Class)MicroPayment;
  [(MicroPayment *)&v3 dealloc];
}

+ (id)paymentEntityFromContext:(id)a3
{
  id v3 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "persistentStoreCoordinator"), "managedObjectModel"), "entitiesByName");

  return [v3 objectForKey:@"MicroPayment"];
}

+ (BOOL)responseIsValid:(id)a3
{
  return [a3 objectForKey:@"offer-name"]
      || [a3 objectForKey:@"item-id"] != 0;
}

- (id)copyPaymentTransaction
{
  id v3 = objc_alloc_init((Class)sub_100174DE8());
  objc_msgSend(v3, "setApplicationUsername:", -[MicroPayment applicationUsername](self, "applicationUsername"));
  objc_msgSend(v3, "setPartnerIdentifier:", -[MicroPayment partnerIdentifier](self, "partnerIdentifier"));
  objc_msgSend(v3, "setPartnerTransactionIdentifier:", -[MicroPayment partnerTransactionIdentifier](self, "partnerTransactionIdentifier"));
  objc_msgSend(v3, "setProductIdentifier:", -[MicroPayment productIdentifier](self, "productIdentifier"));
  objc_msgSend(v3, "setQuantity:", objc_msgSend(-[MicroPayment quantity](self, "quantity"), "integerValue"));
  objc_msgSend(v3, "setRequestData:", -[MicroPayment requestData](self, "requestData"));
  objc_msgSend(v3, "setSimulatesAskToBuyInSandbox:", objc_msgSend(-[MicroPayment simulatesAskToBuyInSandbox](self, "simulatesAskToBuyInSandbox"), "BOOLValue"));
  if ([(MicroPayment *)self discountIdentifier])
  {
    id v4 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", -[MicroPayment discountNonceString](self, "discountNonceString"));
    id v5 = objc_msgSend(objc_alloc((Class)sub_100174DF4()), "initWithIdentifier:keyIdentifier:nonce:signature:timestamp:", -[MicroPayment discountIdentifier](self, "discountIdentifier"), -[MicroPayment discountKeyIdentifier](self, "discountKeyIdentifier"), v4, -[MicroPayment discountSignature](self, "discountSignature"), -[MicroPayment discountTimestamp](self, "discountTimestamp"));
    [v3 setPaymentDiscount:v5];
  }
  id v6 = [(MicroPayment *)self actionParams];
  if (v6)
  {
    id v7 = +[NSURL copyDictionaryForQueryString:v6 unescapedValues:1];
    [v3 setRequestParameters:v7];
  }
  id v8 = [objc_alloc((Class)sub_100174E0C()) initWithPayment:v3];
  objc_msgSend(v8, "_setError:", sub_100174DC4((uint64_t)-[MicroPayment errorData](self, "errorData")));
  objc_msgSend(v8, "_setTransactionDate:", -[MicroPayment purchaseDate](self, "purchaseDate"));
  objc_msgSend(v8, "_setTransactionReceipt:", -[MicroPayment receiptData](self, "receiptData"));
  objc_msgSend(v8, "_setTransactionState:", -[MicroPayment _clientStateForServerState:](self, "_clientStateForServerState:", objc_msgSend(-[MicroPayment state](self, "state"), "integerValue")));
  id v9 = [(MicroPayment *)self transactionIdentifier];
  if (v9) {
    [v8 _setTransactionIdentifier:v9];
  }
  else {
    objc_msgSend(v8, "_setTemporaryIdentifier:", -[MicroPayment _temporaryIdentifier](self, "_temporaryIdentifier"));
  }
  id v10 = [(MicroPayment *)self originalTransactionIdentifier];
  if (v10)
  {
    id v11 = v10;
    id v12 = objc_alloc_init((Class)sub_100174E0C());
    objc_msgSend(v12, "_setTransactionDate:", -[MicroPayment originalPurchaseDate](self, "originalPurchaseDate"));
    [v12 _setTransactionIdentifier:v11];
    [v8 _setOriginalTransaction:v12];
  }
  id v13 = [(MicroPayment *)self downloads];
  if ([v13 count])
  {
    id v14 = objc_alloc_init((Class)NSMutableArray);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v15)
    {
      id v16 = v15;
      uint64_t v17 = *(void *)v23;
      do
      {
        v18 = 0;
        do
        {
          if (*(void *)v23 != v17) {
            objc_enumerationMutation(v13);
          }
          id v19 = [*(id *)(*((void *)&v22 + 1) + 8 * (void)v18) copySKDownload];
          if (v19)
          {
            v20 = v19;
            [v14 addObject:v19];
          }
          v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        id v16 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v16);
    }
    [v8 _setDownloads:v14];
  }
  return v8;
}

- (BOOL)isEqualToResponse:(id)a3 compareAllFields:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = [(MicroPayment *)self productIdentifier];
  id v8 = [a3 objectForKey:@"offer-name"];
  if (!v8) {
    id v8 = [a3 objectForKey:@"item-id"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = [v8 stringValue];
  }
  if (v7 == v8) {
    unsigned int v9 = 1;
  }
  else {
    unsigned int v9 = [v7 isEqualToString:v8];
  }
  id v10 = [(MicroPayment *)self quantity];
  id v11 = [a3 objectForKey:@"quantity"];
  if (v9)
  {
    if (v10 == v11) {
      unsigned int v9 = 1;
    }
    else {
      unsigned int v9 = [v10 isEqual:v11];
    }
  }
  id v12 = [(MicroPayment *)self transactionIdentifier];
  id v13 = v12;
  if (v4 || v12 && objc_msgSend(-[MicroPayment state](self, "state"), "integerValue") != (id)8)
  {
    id v14 = [a3 objectForKey:@"transaction-id"];
    if (v9)
    {
      if (v13 == v14) {
        unsigned int v9 = 1;
      }
      else {
        unsigned int v9 = [v13 isEqual:v14];
      }
    }
  }
  id v15 = [(MicroPayment *)self userDSID];
  if (!v15 && !v4) {
    return v9;
  }
  id v16 = [a3 objectForKey:@"dsid"];
  if (!v9) {
    return v9;
  }
  if (v15 == v16)
  {
    LOBYTE(v9) = 1;
    return v9;
  }

  return [v15 isEqual:v16];
}

- (void)mergeValuesFromResponse:(id)a3
{
  id v5 = [a3 objectForKey:@"offer-name"];
  if (!v5) {
    id v5 = [a3 objectForKey:@"item-id"];
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_7;
    }
    id v5 = [v5 stringValue];
  }
  [(MicroPayment *)self setProductIdentifier:v5];
LABEL_7:
  id v6 = [a3 objectForKey:@"quantity"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(MicroPayment *)self setQuantity:v6];
  }
  id v7 = [a3 objectForKey:@"receipt-data"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(MicroPayment *)self setReceiptData:v7];
  }
  id v8 = [a3 objectForKey:@"request-data"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(MicroPayment *)self setRequestData:v8];
  }
  id v9 = [a3 objectForKey:@"dsid"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(MicroPayment *)self setUserDSID:v9];
  }
  id v10 = [a3 objectForKey:@"applicationUsername"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(MicroPayment *)self setApplicationUsername:v10];
  }
  id v11 = [a3 objectForKey:@"purchase-date"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(MicroPayment *)self setPurchaseDate:v11];
  }
  id v12 = [a3 objectForKey:@"original-purchase-date"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ([v12 isEqual:v11] & 1) == 0) {
    [(MicroPayment *)self setOriginalPurchaseDate:v12];
  }
  id v13 = [a3 objectForKey:@"transaction-id"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(MicroPayment *)self setTransactionIdentifier:v13];
  }
  id v14 = [a3 objectForKey:@"original-transaction-id"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ([v14 isEqual:v13] & 1) == 0) {
    [(MicroPayment *)self setOriginalTransactionIdentifier:v14];
  }

  [(MicroPayment *)self _updateDownloadsFromResponse:a3];
}

- (BOOL)isReady
{
  id v3 = objc_msgSend(-[MicroPayment state](self, "state"), "integerValue");
  return (unint64_t)v3 <= 3 && v3 != (id)2 && !self->_transientFailed;
}

- (NSString)matchingIdentifier
{
  result = (NSString *)[(MicroPayment *)self transactionIdentifier];
  if (!result)
  {
    return (NSString *)[(MicroPayment *)self _temporaryIdentifier];
  }
  return result;
}

- (void)setFailedWithError:(id)a3
{
  if (ISErrorIsEqual())
  {
    id v5 = [a3 userInfo];
    -[MicroPayment setAskPermissionRequestIdentifier:](self, "setAskPermissionRequestIdentifier:", [v5 objectForKey:SSErrorAskPermissionRequestIdentifier]);
    id v6 = &off_1003C8FB8;
  }
  else
  {
    uint64_t v7 = sub_100050134(a3);
    [(MicroPayment *)self setErrorData:sub_100174DC0(v7)];
    id v6 = &off_1003C8FD0;
  }
  [(MicroPayment *)self setState:v6];
  id v8 = [(MicroPayment *)self matchingIdentifier];

  [(MicroPayment *)self setTransactionIdentifier:v8];
}

- (void)awakeFromInsert
{
  v3.receiver = self;
  v3.super_class = (Class)MicroPayment;
  [(MicroPayment *)&v3 awakeFromInsert];
  [(MicroPayment *)self setInsertDate:+[NSDate date]];
}

- (void)setTransactionIdentifier:(id)a3
{
  id v4 = a3;
  if (a3)
  {

    self->_temporaryIdentifier = 0;
  }
  [(MicroPayment *)self willChangeValueForKey:@"transactionIdentifier"];
  [(MicroPayment *)self setPrimitiveValue:a3 forKey:@"transactionIdentifier"];
  [(MicroPayment *)self didChangeValueForKey:@"transactionIdentifier"];
}

- (void)setValuesWithPaymentTransaction:(id)a3
{
  id v5 = [a3 payment];
  id v6 = [a3 error];
  if (v6)
  {
    [(MicroPayment *)self setFailedWithError:v6];
  }
  else
  {
    -[MicroPayment setErrorData:](self, "setErrorData:");
    -[MicroPayment setState:](self, "setState:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[MicroPayment _serverStateForClientState:](self, "_serverStateForClientState:", [a3 transactionState])));
  }
  -[MicroPayment setApplicationUsername:](self, "setApplicationUsername:", [v5 applicationUsername]);
  -[MicroPayment setPartnerIdentifier:](self, "setPartnerIdentifier:", [v5 partnerIdentifier]);
  -[MicroPayment setPartnerTransactionIdentifier:](self, "setPartnerTransactionIdentifier:", [v5 partnerTransactionIdentifier]);
  -[MicroPayment setProductIdentifier:](self, "setProductIdentifier:", [v5 productIdentifier]);
  -[MicroPayment setPurchaseDate:](self, "setPurchaseDate:", [a3 transactionDate]);
  -[MicroPayment setQuantity:](self, "setQuantity:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 quantity]));
  -[MicroPayment setReceiptData:](self, "setReceiptData:", [a3 transactionReceipt]);
  -[MicroPayment setRequestData:](self, "setRequestData:", [v5 requestData]);
  -[MicroPayment setTransactionIdentifier:](self, "setTransactionIdentifier:", [a3 transactionIdentifier]);
  -[MicroPayment setSimulatesAskToBuyInSandbox:](self, "setSimulatesAskToBuyInSandbox:", +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 simulatesAskToBuyInSandbox]));
  -[MicroPayment setDiscountIdentifier:](self, "setDiscountIdentifier:", objc_msgSend(objc_msgSend(v5, "paymentDiscount"), "identifier"));
  -[MicroPayment setDiscountKeyIdentifier:](self, "setDiscountKeyIdentifier:", objc_msgSend(objc_msgSend(v5, "paymentDiscount"), "keyIdentifier"));
  -[MicroPayment setDiscountNonceString:](self, "setDiscountNonceString:", objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend(v5, "paymentDiscount"), "nonce"), "UUIDString"), "lowercaseString"));
  -[MicroPayment setDiscountSignature:](self, "setDiscountSignature:", objc_msgSend(objc_msgSend(v5, "paymentDiscount"), "signature"));
  -[MicroPayment setDiscountTimestamp:](self, "setDiscountTimestamp:", objc_msgSend(objc_msgSend(v5, "paymentDiscount"), "timestamp"));
  id v7 = objc_msgSend(objc_msgSend(v5, "requestParameters"), "mutableCopy");
  if ([v5 isStoreOriginated])
  {
    if (!v7) {
      id v7 = (id)objc_opt_new();
    }
    [v7 setObject:&__kCFBooleanTrue forKey:@"isStoreOriginated"];
  }
  if (v7)
  {
    [(MicroPayment *)self setActionParams:+[NSURL queryStringForDictionary:v7 escapedValues:1]];
  }
  id v8 = [a3 originalTransaction];
  -[MicroPayment setOriginalPurchaseDate:](self, "setOriginalPurchaseDate:", [v8 transactionDate]);
  id v9 = [v8 transactionIdentifier];

  [(MicroPayment *)self setOriginalTransactionIdentifier:v9];
}

- (int64_t)_clientStateForServerState:(int64_t)a3
{
  int64_t result = 0;
  switch(a3)
  {
    case 2:
      int64_t result = 1;
      break;
    case 5:
      int64_t result = 2;
      break;
    case 6:
      int64_t result = 3;
      break;
    case 7:
      int64_t result = 10000;
      break;
    case 8:
      if (objc_msgSend(-[MicroPayment supportsDeferredPayment](self, "supportsDeferredPayment", v3, v4), "BOOLValue"))int64_t result = 4; {
      else
      }
        int64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

- (int64_t)_serverStateForClientState:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      int64_t result = 2;
      break;
    case 2:
      int64_t result = 5;
      break;
    case 3:
      int64_t result = 6;
      break;
    case 4:
      int64_t result = 8;
      break;
    default:
      if (a3 == 10000) {
        int64_t result = 7;
      }
      else {
        int64_t result = 1;
      }
      break;
  }
  return result;
}

- (id)_temporaryIdentifier
{
  if (!self->_temporaryIdentifier)
  {
    CFUUIDRef v3 = CFUUIDCreate(0);
    if (v3)
    {
      CFUUIDRef v4 = v3;
      self->_temporaryIdentifier = (NSString *)CFUUIDCreateString(0, v3);
      CFRelease(v4);
    }
  }
  return self->_temporaryIdentifier;
}

- (void)_updateDownloadsFromResponse:(id)a3
{
  id v4 = [a3 objectForKey:@"assetList"];
  objc_opt_class();
  id obj = v4;
  if (objc_opt_isKindOfClass())
  {
    id v25 = objc_alloc_init((Class)NSMutableSet);
    id v23 = [(MicroPayment *)self managedObjectContext];
    id v22 = +[MicroPaymentDownload downloadEntityFromContext:](MicroPaymentDownload, "downloadEntityFromContext:");
    id v5 = [(MicroPayment *)self downloads];
    if ([v5 count] == (id)1 && (unint64_t)objc_msgSend(v4, "count") <= 1)
    {
      if ([v4 count] == (id)1)
      {
        id v6 = [v5 anyObject];
        objc_msgSend(v6, "setValuesWithAssetDictionary:", objc_msgSend(v4, "objectAtIndex:", 0));
        [v6 setPayment:self];
        [v25 addObject:v6];
      }
    }
    else
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v7 = [v4 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v7)
      {
        id v8 = v7;
        uint64_t v9 = *(void *)v32;
        uint64_t v24 = *(void *)v32;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(void *)v32 != v9) {
              objc_enumerationMutation(obj);
            }
            id v11 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v12 = [v11 objectForKey:@"URL"];
              if (v12)
              {
                id v13 = v12;
                id v14 = self;
                long long v29 = 0u;
                long long v30 = 0u;
                long long v27 = 0u;
                long long v28 = 0u;
                id v15 = [v5 countByEnumeratingWithState:&v27 objects:v35 count:16];
                if (v15)
                {
                  id v16 = v15;
                  uint64_t v17 = *(void *)v28;
LABEL_18:
                  uint64_t v18 = 0;
                  while (1)
                  {
                    if (*(void *)v28 != v17) {
                      objc_enumerationMutation(v5);
                    }
                    id v19 = *(void **)(*((void *)&v27 + 1) + 8 * v18);
                    if (objc_msgSend(v13, "isEqualToString:", objc_msgSend(v19, "remoteURL"))) {
                      break;
                    }
                    if (v16 == (id)++v18)
                    {
                      id v16 = [v5 countByEnumeratingWithState:&v27 objects:v35 count:16];
                      if (v16) {
                        goto LABEL_18;
                      }
                      goto LABEL_27;
                    }
                  }
                  v20 = v19;
                  if (!v20) {
                    goto LABEL_27;
                  }
                  v21 = v20;
                  [(MicroPaymentDownload *)v20 setValuesWithAssetDictionary:v11];
                  self = v14;
                  [(MicroPaymentDownload *)v21 setPayment:v14];
                }
                else
                {
LABEL_27:
                  v21 = [[MicroPaymentDownload alloc] initWithEntity:v22 insertIntoManagedObjectContext:v23];
                  self = v14;
                  [(MicroPaymentDownload *)v21 setPayment:v14];
                  [(MicroPaymentDownload *)v21 setValuesWithAssetDictionary:v11];
                }
                [v25 addObject:v21];

                uint64_t v9 = v24;
              }
            }
          }
          id v8 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
        }
        while (v8);
      }
    }
    [(MicroPayment *)self setDownloads:v25];
  }
  else
  {
    [(MicroPayment *)self setDownloads:0];
  }
}

- (BOOL)isTransientFailed
{
  return self->_transientFailed;
}

- (void)setTransientFailed:(BOOL)a3
{
  self->_transientFailed = a3;
}

@end