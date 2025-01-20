@interface SKPaymentTransaction
- (BOOL)canMergeWithTransaction:(id)a3;
- (BOOL)mergeWithServerTransaction:(id)a3;
- (BOOL)mergeWithTransaction:(id)a3;
- (NSArray)downloads;
- (NSData)transactionReceipt;
- (NSDate)transactionDate;
- (NSError)error;
- (NSString)_transactionIdentifier;
- (NSString)matchingIdentifier;
- (NSString)transactionIdentifier;
- (SKPayment)payment;
- (SKPaymentTransaction)init;
- (SKPaymentTransaction)initWithPayment:(id)a3;
- (SKPaymentTransaction)initWithServerTransaction:(id)a3;
- (SKPaymentTransaction)initWithXPCEncoding:(id)a3;
- (SKPaymentTransaction)originalTransaction;
- (SKPaymentTransactionState)transactionState;
- (id)UUID;
- (id)copyXPCEncoding;
- (id)getPaymentDiscountFromTransactionXPCEncoding:(id)a3;
- (void)_setDownloads:(id)a3;
- (void)_setError:(id)a3;
- (void)_setOriginalTransaction:(id)a3;
- (void)_setTemporaryIdentifier:(id)a3;
- (void)_setTransactionDate:(id)a3;
- (void)_setTransactionIdentifier:(id)a3;
- (void)_setTransactionReceipt:(id)a3;
- (void)_setTransactionState:(int64_t)a3;
@end

@implementation SKPaymentTransaction

- (SKPaymentTransaction)init
{
  v6.receiver = self;
  v6.super_class = (Class)SKPaymentTransaction;
  v2 = [(SKPaymentTransaction *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(SKPaymentTransactionInternal);
    id internal = v2->_internal;
    v2->_id internal = v3;
  }
  return v2;
}

- (SKPaymentTransaction)initWithPayment:(id)a3
{
  id v4 = a3;
  v5 = [(SKPaymentTransaction *)self init];
  objc_super v6 = v5;
  if (v5)
  {
    v7 = v5->_internal;
    id v8 = [v4 copy];
    v9 = (void *)v7[5];
    v7[5] = v8;
  }
  return v6;
}

- (NSArray)downloads
{
  return (NSArray *)*((id *)self->_internal + 2);
}

- (NSError)error
{
  return (NSError *)*((id *)self->_internal + 3);
}

- (SKPaymentTransaction)originalTransaction
{
  return (SKPaymentTransaction *)*((id *)self->_internal + 4);
}

- (SKPayment)payment
{
  return (SKPayment *)*((id *)self->_internal + 5);
}

- (NSDate)transactionDate
{
  return (NSDate *)*((id *)self->_internal + 7);
}

- (NSString)transactionIdentifier
{
  return (NSString *)*((id *)self->_internal + 8);
}

- (NSData)transactionReceipt
{
  return (NSData *)*((id *)self->_internal + 9);
}

- (SKPaymentTransactionState)transactionState
{
  return *((void *)self->_internal + 10);
}

- (id)UUID
{
  return *((id *)self->_internal + 1);
}

- (BOOL)canMergeWithTransaction:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v6 = *((id *)self->_internal + 5);
  id v7 = *(id *)(v4[1] + 40);
  id v8 = v7;
  if (isKindOfClass)
  {
    if (v6 == v7) {
      unsigned int v9 = 1;
    }
    else {
      unsigned int v9 = [v6 isEqual:v7];
    }
  }
  else
  {
    unsigned int v9 = 0;
  }
  id v10 = *((id *)self->_internal + 8);

  if (v10)
  {
    id v11 = *(id *)(v4[1] + 64);

    if (v9)
    {
      if (v10 == v11)
      {
        LOBYTE(v9) = 1;
        id v11 = v10;
      }
      else
      {
        LOBYTE(v9) = [v10 isEqualToString:v11];
      }
    }
  }
  else
  {
    id v11 = v8;
  }

  return v9;
}

- (NSString)matchingIdentifier
{
  id v3 = *((id *)self->_internal + 8);
  if (!v3) {
    id v3 = *((id *)self->_internal + 6);
  }

  return (NSString *)v3;
}

- (BOOL)mergeWithTransaction:(id)a3
{
  id v4 = (id *)a3;
  v5 = (id *)self->_internal;
  id v6 = v4[1];
  id v7 = (id)v6[3];
  if (v5[3] != v7) {
    objc_storeStrong(v5 + 3, v7);
  }
  id v8 = v5[10];
  id v9 = (id)v6[10];
  BOOL v10 = v8 != v9;
  if (v8 != v9) {
    v5[10] = v9;
  }
  id v11 = (id)v6[4];
  if (v5[4] != v11) {
    objc_storeStrong(v5 + 4, v11);
  }
  id v12 = (id)v6[7];
  if (v5[7] != v12) {
    objc_storeStrong(v5 + 7, v12);
  }
  id v13 = (id)v6[8];
  if (v5[8] != v13)
  {
    id v14 = [v13 copy];
    id v15 = v5[8];
    v5[8] = v14;
  }
  id v16 = (id)v6[6];
  if (v5[6] != v16)
  {
    id v17 = [v16 copy];
    id v18 = v5[6];
    v5[6] = v17;
  }
  id v19 = (id)v6[9];
  if (v5[9] != v19) {
    objc_storeStrong(v5 + 9, v19);
  }
  id v20 = v5[2];
  if (v20 != (id)v6[2] && (objc_msgSend(v20, "isEqualToArray:") & 1) == 0)
  {
    [(SKPaymentTransaction *)self _setDownloads:v6[2]];
    BOOL v10 = 1;
  }

  return v10;
}

- (void)_setDownloads:(id)a3
{
  id internal = (id *)self->_internal;
  id v4 = internal[2];
  if (v4 != a3)
  {
    BOOL v10 = internal;
    id v7 = a3;
    [v4 makeObjectsPerformSelector:"_setTransaction:" withObject:0];
    id v8 = [v7 copy];

    id v9 = internal[2];
    internal[2] = v8;

    [internal[2] makeObjectsPerformSelector:"_setTransaction:" withObject:self];
  }
}

- (void)_setError:(id)a3
{
  id v5 = a3;
  id internal = (char *)self->_internal;
  id v8 = (id)*((void *)internal + 3);
  id v7 = (id *)(internal + 24);
  if (v8 != v5)
  {
    id v9 = v5;
    objc_storeStrong(v7, a3);
    id v5 = v9;
  }

  _objc_release_x1(v7, v5);
}

- (void)_setOriginalTransaction:(id)a3
{
  id v5 = a3;
  id internal = (char *)self->_internal;
  id v8 = (id)*((void *)internal + 4);
  id v7 = (id *)(internal + 32);
  if (v8 != v5)
  {
    id v9 = v5;
    objc_storeStrong(v7, a3);
    id v5 = v9;
  }

  _objc_release_x1(v7, v5);
}

- (void)_setTemporaryIdentifier:(id)a3
{
  id internal = self->_internal;
  if ((id)internal[6] != a3)
  {
    id v7 = internal;
    id v5 = [a3 copy];
    id v6 = (void *)internal[6];
    internal[6] = v5;
  }
}

- (void)_setTransactionDate:(id)a3
{
  id v5 = a3;
  id internal = (char *)self->_internal;
  id v8 = (id)*((void *)internal + 7);
  id v7 = (id *)(internal + 56);
  if (v8 != v5)
  {
    id v9 = v5;
    objc_storeStrong(v7, a3);
    id v5 = v9;
  }

  _objc_release_x1(v7, v5);
}

- (void)_setTransactionIdentifier:(id)a3
{
  id internal = self->_internal;
  if ((id)internal[8] != a3)
  {
    id v7 = internal;
    id v5 = [a3 copy];
    id v6 = (void *)internal[8];
    internal[8] = v5;
  }
}

- (void)_setTransactionReceipt:(id)a3
{
  id internal = self->_internal;
  if ((id)internal[9] != a3)
  {
    id v7 = internal;
    id v5 = [a3 copy];
    id v6 = (void *)internal[9];
    internal[9] = v5;
  }
}

- (void)_setTransactionState:(int64_t)a3
{
  *((void *)self->_internal + 10) = a3;
}

- (NSString)_transactionIdentifier
{
  return (NSString *)*((id *)self->_internal + 8);
}

- (SKPaymentTransaction)initWithServerTransaction:(id)a3
{
  id v4 = a3;
  id v5 = [(SKPaymentTransaction *)self init];
  id v6 = v5;
  if (v5) {
    [(SKPaymentTransaction *)v5 mergeWithServerTransaction:v4];
  }

  return v6;
}

- (BOOL)mergeWithServerTransaction:(id)a3
{
  id v4 = a3;
  id v5 = (id *)self->_internal;
  id v6 = [v4 objectForKeyedSubscript:@"uuid"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong(v5 + 1, v6);
  }
  id v7 = [v4 objectForKeyedSubscript:@"tid"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong(v5 + 8, v7);
  }
  id v8 = [v4 objectForKeyedSubscript:@"state"];

  if (objc_opt_respondsToSelector()) {
    v5[10] = [v8 integerValue];
  }
  id v9 = [v4 objectForKeyedSubscript:@"assets"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v45 = v9;
    v46 = self;
    id v47 = v4;
    id v10 = v9;
    v48 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v10 count]);
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id obj = v10;
    id v11 = [obj countByEnumeratingWithState:&v50 objects:v54 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v51;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v51 != v13) {
            objc_enumerationMutation(obj);
          }
          id v15 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          id v16 = objc_msgSend(v15, "objectForKeyedSubscript:", @"hosted-id", v45);
          uint64_t v17 = [v5[5] productIdentifier];
          id v18 = (void *)v17;
          if (v16) {
            BOOL v19 = v17 == 0;
          }
          else {
            BOOL v19 = 1;
          }
          if (!v19)
          {
            id v20 = v5;
            v21 = objc_alloc_init(SKDownload);
            [(SKDownload *)v21 _setDownloadID:v16];
            [(SKDownload *)v21 _setContentIdentifier:v18];
            v22 = [v15 objectForKeyedSubscript:@"hosted-content-length"];
            [(SKDownload *)v21 _setContentLength:v22];

            v23 = [v15 objectForKeyedSubscript:@"hosted-version"];
            [(SKDownload *)v21 _setVersion:v23];

            [v48 addObject:v21];
            id v5 = v20;
          }
        }
        id v12 = [obj countByEnumeratingWithState:&v50 objects:v54 count:16];
      }
      while (v12);
    }

    [(SKPaymentTransaction *)v46 _setDownloads:v48];
    id v4 = v47;
    id v9 = v45;
  }
  v24 = objc_msgSend(v4, "objectForKeyedSubscript:", @"error", v45);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v25 = sub_1000F6638(v24);
    id v26 = v5[3];
    v5[3] = (id)v25;
  }
  v27 = [v4 objectForKeyedSubscript:@"odate"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong(v5 + 7, v27);
  }
  v28 = [v4 objectForKeyedSubscript:@"rcpt"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_storeStrong(v5 + 9, v28);
  }
  v29 = [v4 objectForKeyedSubscript:@"date"];
  v30 = [v4 objectForKeyedSubscript:@"otid"];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    v31 = objc_alloc_init(SKPaymentTransaction);
    id internal = v31->_internal;
    id v33 = v29;
    v34 = (void *)internal[7];
    internal[7] = v33;
    v35 = internal;

    id v36 = [v30 copy];
    v37 = (void *)v35[8];
    v35[8] = v36;

    v35[10] = 1;
  }
  else
  {
    v31 = 0;
  }
  v38 = [v4 objectForKeyedSubscript:@"id"];
  v39 = [v4 objectForKeyedSubscript:@"qty"];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    v40 = v4;
    v41 = objc_alloc_init(SKMutablePayment);
    [(SKMutablePayment *)v41 setProductIdentifier:v38];
    -[SKMutablePayment setQuantity:](v41, "setQuantity:", [v39 integerValue]);
    v42 = [v40 objectForKeyedSubscript:@"rdata"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(SKMutablePayment *)v41 setRequestData:v42];
    }
    objc_storeStrong(v5 + 5, v41);
    if (v31) {
      objc_storeStrong((id *)v31->_internal + 5, v41);
    }

    id v4 = v40;
  }
  else
  {
    v42 = v28;
  }
  id v43 = v5[4];
  v5[4] = v31;

  return 1;
}

- (SKPaymentTransaction)initWithXPCEncoding:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4 || xpc_get_type(v4) != (xpc_type_t)&_xpc_type_dictionary)
  {

    id v6 = 0;
    goto LABEL_4;
  }
  id v8 = [(SKPaymentTransaction *)self init];
  id v6 = v8;
  if (!v8) {
    goto LABEL_4;
  }
  id v9 = v8->_internal;
  objc_opt_class();
  CFDictionaryRef v10 = sub_10010B0C0(v5, "2");
  CFDictionaryRef v11 = v10;
  if (v10)
  {
    uint64_t v12 = sub_10010A78C((uint64_t)v10);
    uint64_t v13 = (void *)*((void *)v9 + 3);
    *((void *)v9 + 3) = v12;
  }
  objc_opt_class();
  CFDictionaryRef v14 = sub_10010B0C0(v5, "6");

  if (v14) {
    objc_storeStrong((id *)v9 + 7, v14);
  }
  CFDictionaryRef v15 = sub_10010B088(v5, "11");

  if (objc_opt_respondsToSelector())
  {
    id v16 = [(__CFDictionary *)v15 integerValue];
    *((void *)v9 + 10) = v16;
    if (v16 == (id)10000)
    {
      int v17 = _CFExecutableLinkedOnOrAfter();
      uint64_t v18 = 3;
      if (v17) {
        uint64_t v18 = 1;
      }
      *((void *)v9 + 10) = v18;
    }
  }
  objc_opt_class();
  CFDictionaryRef v19 = sub_10010B0C0(v5, "13");

  if (v19)
  {
    CFDictionaryRef v20 = v19;
    v21 = (void *)*((void *)v9 + 8);
    *((void *)v9 + 8) = v20;
  }
  else
  {
    objc_opt_class();
    CFDictionaryRef v22 = sub_10010B0C0(v5, "12");
    if (!v22)
    {
      CFDictionaryRef v20 = 0;
      goto LABEL_20;
    }
    CFDictionaryRef v20 = v22;
    v21 = (void *)*((void *)v9 + 6);
    *((void *)v9 + 6) = v20;
  }

LABEL_20:
  objc_opt_class();
  CFDictionaryRef v23 = sub_10010B0C0(v5, "8");

  if (v23) {
    objc_storeStrong((id *)v9 + 9, v23);
  }
  objc_opt_class();
  CFDictionaryRef v24 = sub_10010B0C0(v5, "4");
  objc_opt_class();
  CFDictionaryRef v25 = sub_10010B0C0(v5, "5");
  CFDictionaryRef v26 = v25;
  v27 = 0;
  CFDictionaryRef v51 = v24;
  if (v24 && v25)
  {
    v27 = objc_alloc_init(SKPaymentTransaction);
    CFDictionaryRef v28 = v26;
    id internal = v27->_internal;
    CFDictionaryRef v30 = v51;
    v31 = (void *)internal[7];
    internal[7] = v30;
    v32 = internal;

    id v33 = [(__CFDictionary *)v28 copy];
    v34 = (void *)v32[8];
    v32[8] = v33;

    v32[10] = 1;
    CFDictionaryRef v26 = v28;
  }
  objc_opt_class();
  CFDictionaryRef v35 = sub_10010B0C0(v5, "3");
  CFDictionaryRef v36 = sub_10010B088(v5, "7");
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    CFDictionaryRef v50 = v26;
    v37 = objc_alloc_init(SKMutablePayment);
    [(SKMutablePayment *)v37 setProductIdentifier:v35];
    [(SKMutablePayment *)v37 setQuantity:[(__CFDictionary *)v36 integerValue]];
    objc_opt_class();
    CFDictionaryRef v38 = sub_10010B0C0(v5, "9");

    if (v38) {
      [(SKMutablePayment *)v37 setRequestData:v38];
    }
    objc_opt_class();
    CFDictionaryRef v39 = sub_10010B0C0(v5, "10");

    if (v39) {
      [(SKMutablePayment *)v37 setRequestParameters:v39];
    }
    objc_opt_class();
    CFDictionaryRef v40 = sub_10010B0C0(v5, "0");

    if (v40) {
      [(SKMutablePayment *)v37 setApplicationUsername:v40];
    }
    objc_opt_class();
    CFDictionaryRef v41 = sub_10010B0C0(v5, "14");

    if (v41) {
      [(SKMutablePayment *)v37 setPartnerIdentifier:v41];
    }
    objc_opt_class();
    CFDictionaryRef v42 = sub_10010B0C0(v5, "15");

    if (v42) {
      [(SKMutablePayment *)v37 setPartnerTransactionIdentifier:v42];
    }
    CFDictionaryRef v23 = sub_10010B088(v5, "16");

    if (objc_opt_respondsToSelector()) {
      [(SKMutablePayment *)v37 setSimulatesAskToBuyInSandbox:[(__CFDictionary *)v23 BOOLValue]];
    }
    [(SKMutablePayment *)v37 setIsStoreOriginated:xpc_dictionary_get_BOOL(v5, "17")];
    id v43 = [(SKPaymentTransaction *)v6 getPaymentDiscountFromTransactionXPCEncoding:v5];
    [(SKMutablePayment *)v37 setPaymentDiscount:v43];
    id v44 = [(SKMutablePayment *)v37 copy];
    objc_storeStrong((id *)v9 + 5, v44);
    if (v27) {
      objc_storeStrong((id *)v27->_internal + 5, v44);
    }

    CFDictionaryRef v26 = v50;
  }
  objc_storeStrong((id *)v9 + 4, v27);
  v45 = xpc_dictionary_get_value(v5, "1");
  v46 = v45;
  if (v45 && xpc_get_type(v45) == (xpc_type_t)&_xpc_type_array)
  {
    CFDictionaryRef v47 = v36;
    CFDictionaryRef v48 = v26;
    applier[0] = _NSConcreteStackBlock;
    applier[1] = 3221225472;
    applier[2] = sub_10004605C;
    applier[3] = &unk_1003A4180;
    id v49 = objc_alloc_init((Class)NSMutableArray);
    id v53 = v49;
    xpc_array_apply(v46, applier);
    if ([v49 count]) {
      [(SKPaymentTransaction *)v6 _setDownloads:v49];
    }

    CFDictionaryRef v26 = v48;
    CFDictionaryRef v36 = v47;
  }

LABEL_4:
  return v6;
}

- (id)getPaymentDiscountFromTransactionXPCEncoding:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  CFDictionaryRef v4 = sub_10010B0C0(v3, "18");
  if (v4)
  {
    objc_opt_class();
    CFDictionaryRef v5 = sub_10010B0C0(v3, "19");
    if (v5)
    {
      objc_opt_class();
      CFDictionaryRef v6 = sub_10010B0C0(v3, "20");
      id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:v6];
      if (v7)
      {
        objc_opt_class();
        CFDictionaryRef v8 = sub_10010B0C0(v3, "21");
        if (v8)
        {
          objc_opt_class();
          CFDictionaryRef v9 = sub_10010B0C0(v3, "22");
          if (v9) {
            CFDictionaryRef v10 = [[SKPaymentDiscount alloc] initWithIdentifier:v4 keyIdentifier:v5 nonce:v7 signature:v8 timestamp:v9];
          }
          else {
            CFDictionaryRef v10 = 0;
          }
        }
        else
        {
          CFDictionaryRef v10 = 0;
        }
      }
      else
      {
        CFDictionaryRef v10 = 0;
      }
    }
    else
    {
      CFDictionaryRef v10 = 0;
    }
  }
  else
  {
    CFDictionaryRef v10 = 0;
  }

  return v10;
}

- (id)copyXPCEncoding
{
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  id internal = (id *)self->_internal;
  id v5 = internal[5];
  CFDictionaryRef v6 = internal;
  sub_10010B10C(v3, "0", (__CFString *)[v5 applicationUsername]);
  sub_10010B10C(v3, "1", (__CFString *)v6[2]);
  id v7 = (__CFString *)sub_10010A20C((uint64_t)v6[3]);
  sub_10010B10C(v3, "2", v7);
  sub_10010B10C(v3, "3", (__CFString *)[internal[5] productIdentifier]);
  sub_10010B10C(v3, "4", (__CFString *)[v6[4] transactionDate]);
  sub_10010B10C(v3, "5", (__CFString *)[v6[4] transactionIdentifier]);
  sub_10010B10C(v3, "14", (__CFString *)[internal[5] partnerIdentifier]);
  sub_10010B10C(v3, "15", (__CFString *)[internal[5] partnerTransactionIdentifier]);
  sub_10010B10C(v3, "6", (__CFString *)v6[7]);
  xpc_dictionary_set_int64(v3, "7", (int64_t)[internal[5] quantity]);
  sub_10010B10C(v3, "8", (__CFString *)v6[9]);
  sub_10010B10C(v3, "9", (__CFString *)[internal[5] requestData]);
  sub_10010B10C(v3, "10", (__CFString *)[internal[5] requestParameters]);
  xpc_dictionary_set_int64(v3, "11", (int64_t)v6[10]);
  sub_10010B10C(v3, "12", (__CFString *)v6[6]);
  sub_10010B10C(v3, "13", (__CFString *)v6[8]);
  xpc_dictionary_set_BOOL(v3, "16", (BOOL)[internal[5] simulatesAskToBuyInSandbox]);
  xpc_dictionary_set_BOOL(v3, "17", (BOOL)[internal[5] isStoreOriginated]);
  CFDictionaryRef v8 = [internal[5] paymentDiscount];

  sub_10010B10C(v3, "18", (__CFString *)[v8 identifier]);
  sub_10010B10C(v3, "19", (__CFString *)[v8 keyIdentifier]);
  CFDictionaryRef v9 = [v8 nonce];
  CFDictionaryRef v10 = [v9 UUIDString];
  sub_10010B10C(v3, "20", (__CFString *)[v10 lowercaseString]);

  sub_10010B10C(v3, "21", (__CFString *)[v8 signature]);
  sub_10010B10C(v3, "22", (__CFString *)[v8 timestamp]);

  return v3;
}

- (void).cxx_destruct
{
}

@end