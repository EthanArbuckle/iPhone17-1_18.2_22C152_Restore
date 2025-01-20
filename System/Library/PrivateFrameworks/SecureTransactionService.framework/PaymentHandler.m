@interface PaymentHandler
- (id)setActiveCredential:(id)a3;
- (id)startNFSessionWithCompletion:(id)a3;
- (id)startTransactionWithAuthorization:(id)a3 options:(unint64_t)a4;
- (id)stopTransaction;
- (unsigned)supportedCredentialType;
- (void)loyaltyAndPaymentSession:(id)a3 didDetectField:(BOOL)a4;
- (void)loyaltyAndPaymentSession:(id)a3 didEndTransaction:(id)a4;
- (void)loyaltyAndPaymentSession:(id)a3 didEnterFieldWithNotification:(id)a4;
- (void)loyaltyAndPaymentSession:(id)a3 didExpireTransactionForApplet:(id)a4;
- (void)loyaltyAndPaymentSession:(id)a3 didExpressModeStateChange:(unsigned int)a4 withObject:(id)a5;
- (void)loyaltyAndPaymentSession:(id)a3 didFailDeferredAuthorization:(BOOL)a4;
- (void)loyaltyAndPaymentSession:(id)a3 didFelicaStateChange:(id)a4;
- (void)loyaltyAndPaymentSession:(id)a3 didPerformValueAddedServiceTransactions:(id)a4;
- (void)loyaltyAndPaymentSession:(id)a3 didSelectApplet:(id)a4;
- (void)loyaltyAndPaymentSession:(id)a3 didSelectValueAddedService:(BOOL)a4;
- (void)loyaltyAndPaymentSession:(id)a3 didStartTransaction:(id)a4;
- (void)loyaltyAndPaymentSessionDidReceiveActivityTimeout:(id)a3 result:(id)a4;
- (void)loyaltyAndPaymentSessionHasPendingServerRequest:(id)a3;
@end

@implementation PaymentHandler

- (id)startNFSessionWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(STSHandler *)self nfHardwareManager];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_221188CC4;
  v9[3] = &unk_264594BF0;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  v7 = [v5 startLoyaltyAndContactlessPaymentSession:v9];

  return v7;
}

- (unsigned)supportedCredentialType
{
  return 1;
}

- (id)setActiveCredential:(id)a3
{
  v53[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v47.receiver = self;
  v47.super_class = (Class)PaymentHandler;
  id v6 = [(STSHandler *)&v47 setActiveCredential:v5];
  if (!v5) {
    goto LABEL_13;
  }
  v7 = [v5 identifier];

  if (!v7) {
    goto LABEL_13;
  }
  v8 = [v5 identifier];
  if ([v8 hasPrefix:0x26D2FEE20])
  {

LABEL_6:
    v11 = [v5 identifier];
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[PaymentHandler setActiveCredential:]", 60, self, @"AID is not supported by payment handler - %@", v12, v13, (uint64_t)v11);

    v14 = (void *)MEMORY[0x263F087E8];
    v15 = [NSString stringWithUTF8String:"STS.fwk"];
    v52[0] = *MEMORY[0x263F08320];
    v16 = [NSString stringWithUTF8String:"Invalid Parameter"];
    v53[0] = v16;
    v53[1] = &unk_26D307DB0;
    v52[1] = @"Line";
    v52[2] = @"Method";
    v17 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v53[2] = v17;
    v52[3] = *MEMORY[0x263F07F80];
    v18 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 61);
    v53[3] = v18;
    v19 = [NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:4];
    id v20 = [v14 errorWithDomain:v15 code:8 userInfo:v19];

    goto LABEL_17;
  }
  v9 = [v5 identifier];
  int v10 = [v9 hasPrefix:0x26D2FEE40];

  if (v10) {
    goto LABEL_6;
  }
  uint64_t v21 = 56;
  nfSession = self->_nfSession;
  v23 = [v5 identifier];
  v15 = [(NFLoyaltyAndPaymentSession *)nfSession appletWithIdentifier:v23];

  if (!v15)
  {
LABEL_13:
    v38 = [v5 identifier];
    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[PaymentHandler setActiveCredential:]", 74, self, @"applet not found for identifier = %@", v39, v40, (uint64_t)v38);

    v41 = (void *)MEMORY[0x263F087E8];
    v31 = [NSString stringWithUTF8String:"STS.fwk"];
    v48[0] = *MEMORY[0x263F08320];
    v32 = [NSString stringWithUTF8String:"Invalid Parameter"];
    v49[0] = v32;
    v49[1] = &unk_26D307DE0;
    v48[1] = @"Line";
    v48[2] = @"Method";
    uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v49[2] = v21;
    v48[3] = *MEMORY[0x263F07F80];
    v33 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 75);
    v49[3] = v33;
    v42 = [NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:4];
    uint64_t v37 = [v41 errorWithDomain:v31 code:8 userInfo:v42];

    v15 = 0;
LABEL_14:

LABEL_15:
    id v28 = (id)v37;
    goto LABEL_16;
  }
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[PaymentHandler setActiveCredential:]", 68, self, @"applet %@", v24, v25, (uint64_t)v15);
  v26 = self->_nfSession;
  id v46 = v6;
  char v27 = [(NFLoyaltyAndPaymentSession *)v26 setActivePaymentApplet:v15 error:&v46];
  id v28 = v46;

  if ((v27 & 1) == 0)
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[PaymentHandler setActiveCredential:]", 70, self, @"set active applet failed = %@", v29, v30, (uint64_t)v28);
    v45 = (void *)MEMORY[0x263F087E8];
    v31 = [NSString stringWithUTF8String:"STS.fwk"];
    v50[0] = *MEMORY[0x263F08320];
    v32 = [NSString stringWithUTF8String:"Unexpected Result"];
    v51[0] = v32;
    v50[1] = *MEMORY[0x263F08608];
    v33 = v28;
    if (!v28)
    {
      v34 = (void *)MEMORY[0x263F087E8];
      uint64_t v21 = [NSString stringWithUTF8String:"STS.fwk"];
      v33 = [v34 errorWithDomain:v21 code:5 userInfo:0];
    }
    v51[1] = v33;
    v51[2] = &unk_26D307DC8;
    v50[2] = @"Line";
    v50[3] = @"Method";
    v44 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v51[3] = v44;
    v50[4] = *MEMORY[0x263F07F80];
    v35 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 71);
    v51[4] = v35;
    v36 = [NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:5];
    uint64_t v37 = [v45 errorWithDomain:v31 code:10 userInfo:v36];

    if (v28) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_16:
  id v20 = v28;
  id v6 = v20;
LABEL_17:

  return v20;
}

- (id)startTransactionWithAuthorization:(id)a3 options:(unint64_t)a4
{
  v51[4] = *MEMORY[0x263EF8340];
  id v7 = a3;
  v45.receiver = self;
  v45.super_class = (Class)PaymentHandler;
  int v10 = [(STSTransactionHandler *)&v45 startTransactionWithAuthorization:v7 options:a4];
  if (!self->_nfSession)
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[PaymentHandler startTransactionWithAuthorization:options:]", 85, self, @"NF session does not exist!", v8, v9, v41);
    uint64_t v25 = (void *)MEMORY[0x263F087E8];
    v26 = [NSString stringWithUTF8String:"STS.fwk"];
    v50[0] = *MEMORY[0x263F08320];
    char v27 = [NSString stringWithUTF8String:"Invalid State"];
    v51[0] = v27;
    v51[1] = &unk_26D307DF8;
    v50[1] = @"Line";
    v50[2] = @"Method";
    id v28 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v51[2] = v28;
    v50[3] = *MEMORY[0x263F07F80];
    uint64_t v29 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 86);
    v51[3] = v29;
    uint64_t v30 = [NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:4];
    id v31 = [v25 errorWithDomain:v26 code:9 userInfo:v30];

    goto LABEL_16;
  }
  if (a4)
  {
    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[PaymentHandler startTransactionWithAuthorization:options:]", 91, self, @"deferred auth: %@", v8, v9, (uint64_t)v7);
    nfSession = self->_nfSession;
    id v44 = v10;
    char v33 = [(NFLoyaltyAndPaymentSession *)nfSession startDeferredCardEmulation:1 authorization:v7 error:&v44];
    id v13 = v44;

    if ((v33 & 1) == 0)
    {
      sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[PaymentHandler startTransactionWithAuthorization:options:]", 95, self, @"start deferred transaction failed = %@", v34, v35, (uint64_t)v13);
      v36 = (void *)MEMORY[0x263F087E8];
      v17 = [NSString stringWithUTF8String:"STS.fwk"];
      v48[0] = *MEMORY[0x263F08320];
      v18 = [NSString stringWithUTF8String:"Unexpected Result"];
      v49[0] = v18;
      v48[1] = *MEMORY[0x263F08608];
      v19 = v13;
      if (!v13)
      {
        uint64_t v37 = (void *)MEMORY[0x263F087E8];
        v42 = [NSString stringWithUTF8String:"STS.fwk"];
        v19 = objc_msgSend(v37, "errorWithDomain:code:userInfo:");
      }
      v49[1] = v19;
      v49[2] = &unk_26D307E10;
      v48[2] = @"Line";
      v48[3] = @"Method";
      uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
      v49[3] = v21;
      void v48[4] = *MEMORY[0x263F07F80];
      v38 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 96);
      void v49[4] = v38;
      uint64_t v39 = [NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:5];
      uint64_t v24 = [v36 errorWithDomain:v17 code:10 userInfo:v39];

      goto LABEL_12;
    }
  }
  else
  {
    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[PaymentHandler startTransactionWithAuthorization:options:]", 100, self, @"auth: %@", v8, v9, (uint64_t)v7);
    v11 = self->_nfSession;
    id v43 = v10;
    char v12 = [(NFLoyaltyAndPaymentSession *)v11 startCardEmulation:1 authorization:v7 error:&v43];
    id v13 = v43;

    if ((v12 & 1) == 0)
    {
      sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[PaymentHandler startTransactionWithAuthorization:options:]", 102, self, @"start transaction failed = %@", v14, v15, (uint64_t)v13);
      v16 = (void *)MEMORY[0x263F087E8];
      v17 = [NSString stringWithUTF8String:"STS.fwk"];
      v46[0] = *MEMORY[0x263F08320];
      v18 = [NSString stringWithUTF8String:"Unexpected Result"];
      v47[0] = v18;
      v46[1] = *MEMORY[0x263F08608];
      v19 = v13;
      if (!v13)
      {
        id v20 = (void *)MEMORY[0x263F087E8];
        v42 = [NSString stringWithUTF8String:"STS.fwk"];
        v19 = objc_msgSend(v20, "errorWithDomain:code:userInfo:");
      }
      v47[1] = v19;
      v47[2] = &unk_26D307E28;
      v46[2] = @"Line";
      v46[3] = @"Method";
      uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
      v47[3] = v21;
      v46[4] = *MEMORY[0x263F07F80];
      v22 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 103);
      v47[4] = v22;
      v23 = [NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:5];
      uint64_t v24 = [v16 errorWithDomain:v17 code:10 userInfo:v23];

LABEL_12:
      if (!v13)
      {
      }
      id v13 = (id)v24;
    }
  }
  id v31 = v13;
  int v10 = v31;
LABEL_16:

  return v31;
}

- (id)stopTransaction
{
  v21[4] = *MEMORY[0x263EF8340];
  v19.receiver = self;
  v19.super_class = (Class)PaymentHandler;
  id v6 = [(STSTransactionHandler *)&v19 stopTransaction];
  if (self->_nfSession)
  {
    sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[PaymentHandler stopTransaction]", 118, self, &stru_26D2FDEC0, v4, v5, v17);
    nfSession = self->_nfSession;
    id v18 = v6;
    [(NFLoyaltyAndPaymentSession *)nfSession stopCardEmulation:&v18];
    id v8 = v18;

    id v9 = v8;
    id v6 = v9;
  }
  else
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[PaymentHandler stopTransaction]", 114, self, @"NF session does not exist!", v4, v5, v17);
    int v10 = (void *)MEMORY[0x263F087E8];
    v11 = [NSString stringWithUTF8String:"STS.fwk"];
    v20[0] = *MEMORY[0x263F08320];
    char v12 = [NSString stringWithUTF8String:"Invalid State"];
    v21[0] = v12;
    v21[1] = &unk_26D307E40;
    v20[1] = @"Line";
    v20[2] = @"Method";
    id v13 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v21[2] = v13;
    v20[3] = *MEMORY[0x263F07F80];
    uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 115);
    v21[3] = v14;
    uint64_t v15 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:4];
    id v9 = [v10 errorWithDomain:v11 code:9 userInfo:v15];
  }
  return v9;
}

- (void)loyaltyAndPaymentSession:(id)a3 didDetectField:(BOOL)a4
{
  BOOL v6 = a4;
  if (a4) {
    id v8 = @"Field On";
  }
  else {
    id v8 = @"Field Off";
  }
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[PaymentHandler loyaltyAndPaymentSession:didDetectField:]", 252, self, v8, v4, v5, v9);
  id v10 = [(STSTransactionHandler *)self parent];
  [v10 fireFieldDetectEvent:v6];
}

- (void)loyaltyAndPaymentSession:(id)a3 didEnterFieldWithNotification:(id)a4
{
  id v5 = a4;
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[PaymentHandler loyaltyAndPaymentSession:didEnterFieldWithNotification:]", 258, self, @"%@", v6, v7, (uint64_t)v5);
  sub_221199468(v5);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  id v8 = [(STSTransactionHandler *)self parent];
  [v8 fireFieldNotificationEvent:v9];
}

- (void)loyaltyAndPaymentSession:(id)a3 didSelectApplet:(id)a4
{
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[PaymentHandler loyaltyAndPaymentSession:didSelectApplet:]", 264, self, @"SELECT: %@", v4, v5, (uint64_t)a4);
}

- (void)loyaltyAndPaymentSession:(id)a3 didExpireTransactionForApplet:(id)a4
{
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[PaymentHandler loyaltyAndPaymentSession:didExpireTransactionForApplet:]", 276, self, @"EXPIRED: %@", v4, v5, (uint64_t)a4);
  id v7 = [(STSTransactionHandler *)self parent];
  [v7 fireDidExpireTransaction:1];
}

- (void)loyaltyAndPaymentSession:(id)a3 didStartTransaction:(id)a4
{
  id v5 = a4;
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[PaymentHandler loyaltyAndPaymentSession:didStartTransaction:]", 282, self, @"START: %@", v6, v7, (uint64_t)v5);
  id v8 = [STSTransactionStartEvent alloc];
  id v9 = [(STSHandler *)self activeSTSCredential];
  v11 = [(STSTransactionStartEvent *)v8 initWithCredential:v9 andNearFieldStartEvent:v5];

  id v10 = [(STSTransactionHandler *)self parent];
  [v10 fireTransactionStartEvent:v11];
}

- (void)loyaltyAndPaymentSession:(id)a3 didEndTransaction:(id)a4
{
  id v5 = a4;
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[PaymentHandler loyaltyAndPaymentSession:didEndTransaction:]", 290, self, @"END: %@", v6, v7, (uint64_t)v5);
  id v8 = [STSTransactionEndEvent alloc];
  id v9 = [(STSHandler *)self activeSTSCredential];
  v11 = [(STSTransactionEndEvent *)v8 initWithCredential:v9 andNearFieldEndEvent:v5];

  id v10 = [(STSTransactionHandler *)self parent];
  [v10 fireTransactionEndEvent:v11];
}

- (void)loyaltyAndPaymentSession:(id)a3 didFailDeferredAuthorization:(BOOL)a4
{
  BOOL v6 = a4;
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[PaymentHandler loyaltyAndPaymentSession:didFailDeferredAuthorization:]", 297, self, @"Failed deferred authorization", v4, v5, v8);
  id v9 = [(STSTransactionHandler *)self parent];
  [v9 fireDidFailDeferredAuth:v6];
}

- (void)loyaltyAndPaymentSessionHasPendingServerRequest:(id)a3
{
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[PaymentHandler loyaltyAndPaymentSessionHasPendingServerRequest:]", 302, self, @"Pending priority server request", v3, v4, v6);
  id v7 = [(STSTransactionHandler *)self parent];
  [v7 fireHasPendingServerRequest:1];
}

- (void)loyaltyAndPaymentSession:(id)a3 didSelectValueAddedService:(BOOL)a4
{
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[PaymentHandler loyaltyAndPaymentSession:didSelectValueAddedService:]", 307, self, @"VAS selected = %d", v4, v5, a4);
}

- (void)loyaltyAndPaymentSession:(id)a3 didPerformValueAddedServiceTransactions:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v5 = a4;
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[PaymentHandler loyaltyAndPaymentSession:didPerformValueAddedServiceTransactions:]", 313, self, @"HCE transactions: %@", v6, v7, (uint64_t)v5);
  id v31 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = v5;
  uint64_t v8 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v38;
    uint64_t v28 = *(void *)v38;
    uint64_t v29 = self;
    do
    {
      uint64_t v11 = 0;
      uint64_t v30 = v9;
      do
      {
        if (*(void *)v38 != v10) {
          objc_enumerationMutation(obj);
        }
        char v12 = *(void **)(*((void *)&v37 + 1) + 8 * v11);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = v12;
          long long v33 = 0u;
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          uint64_t v14 = self->_vasCredentials;
          id v15 = (id)[(NSArray *)v14 countByEnumeratingWithState:&v33 objects:v41 count:16];
          if (v15)
          {
            uint64_t v16 = *(void *)v34;
            while (2)
            {
              for (i = 0; i != v15; i = (char *)i + 1)
              {
                if (*(void *)v34 != v16) {
                  objc_enumerationMutation(v14);
                }
                id v18 = *(void **)(*((void *)&v33 + 1) + 8 * i);
                objc_super v19 = [v13 merchantId];
                id v20 = [v18 merchantId];
                int v21 = [v19 isEqualToData:v20];

                if (v21)
                {
                  id v15 = v18;
                  goto LABEL_18;
                }
              }
              id v15 = (id)[(NSArray *)v14 countByEnumeratingWithState:&v33 objects:v41 count:16];
              if (v15) {
                continue;
              }
              break;
            }
LABEL_18:
            uint64_t v10 = v28;
            self = v29;
            uint64_t v9 = v30;
          }

          uint64_t v25 = [v13 asDictionary];
          v26 = +[STSVASTransaction vasTransactionForCredential:v15 withDictionary:v25];

          [v31 addObject:v26];
        }
        else
        {
          v22 = (objc_class *)objc_opt_class();
          NSStringFromClass(v22);
          id v13 = (id)objc_claimAutoreleasedReturnValue();
          sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[PaymentHandler loyaltyAndPaymentSession:didPerformValueAddedServiceTransactions:]", 320, self, @"Wrong transaction class: %@", v23, v24, (uint64_t)v13);
        }

        ++v11;
      }
      while (v11 != v9);
      uint64_t v9 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v9);
  }

  char v27 = [(STSTransactionHandler *)self parent];
  [v27 fireDidPerformAuxiliaryTransactions:v31];
}

- (void)loyaltyAndPaymentSession:(id)a3 didFelicaStateChange:(id)a4
{
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[PaymentHandler loyaltyAndPaymentSession:didFelicaStateChange:]", 345, self, @"NOT USED Felica State: %@", v4, v5, (uint64_t)a4);
}

- (void)loyaltyAndPaymentSession:(id)a3 didExpressModeStateChange:(unsigned int)a4 withObject:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id v7 = a5;
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[PaymentHandler loyaltyAndPaymentSession:didExpressModeStateChange:withObject:]", 351, self, @"%d - %@", v8, v9, v5);
  uint64_t v10 = 0;
  if ((v5 - 1) <= 8) {
    uint64_t v10 = dword_2211A66C0[(int)v5 - 1];
  }
  char v12 = [[STSExpressEventInfoWithDetail alloc] initWithState:v10 detail:v7];

  uint64_t v11 = [(STSTransactionHandler *)self parent];
  [v11 fireExpressModeStateChangeWithInfo:v12];
}

- (void)loyaltyAndPaymentSessionDidReceiveActivityTimeout:(id)a3 result:(id)a4
{
  id v5 = a4;
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[PaymentHandler loyaltyAndPaymentSessionDidReceiveActivityTimeout:result:]", 359, self, @"Activity Timeout : %@", v6, v7, (uint64_t)v5);
  id v8 = [(STSTransactionHandler *)self parent];
  [v8 fireDidReceiveActivityTimeout:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vasCredentials, 0);
  objc_storeStrong((id *)&self->_nfSession, 0);
}

@end