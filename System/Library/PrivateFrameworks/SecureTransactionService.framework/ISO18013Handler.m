@interface ISO18013Handler
- (BOOL)activateChildSessionOnSetActiveCredential;
- (id)activateWithHandoffToken:(id)a3;
- (id)startTransactionWithAuthorization:(id)a3 options:(unint64_t)a4;
- (id)stopTransaction;
- (unsigned)supportedCredentialType;
- (void)alternativeCarrierConnectedWithStatus:(unint64_t)a3;
- (void)alternativeCarrierDisconnectedWithStatus:(unint64_t)a3;
- (void)alternativeCarrierReceived:(id)a3 dataPending:(BOOL)a4;
- (void)connectionHandoverCompleted:(id)a3;
- (void)notificationClientConnected;
- (void)processISO18013CredentialProposals:(id)a3 readerAuthInfo:(id)a4;
- (void)session:(id)a3 connectionHandoverProcessFailure:(id)a4;
- (void)session:(id)a3 fieldChange:(BOOL)a4;
- (void)session:(id)a3 fieldNotification:(id)a4;
- (void)session:(id)a3 tnepService:(id)a4;
- (void)tearDownWithCompletion:(id)a3;
- (void)transactionEndedWithIdentifier:(id)a3 error:(id)a4;
- (void)transactionStarted:(unint64_t)a3;
- (void)xpcInterrupted;
- (void)xpcInvalidated;
@end

@implementation ISO18013Handler

- (id)activateWithHandoffToken:(id)a3
{
  id v4 = a3;
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler activateWithHandoffToken:]", 194, self, &stru_26D2FDEC0, v5, v6, v8);
  [(STSHandler *)self setHandoffToken:v4];

  return 0;
}

- (BOOL)activateChildSessionOnSetActiveCredential
{
  return 0;
}

- (id)stopTransaction
{
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler stopTransaction]", 231, self, &stru_26D2FDEC0, v2, v3, (uint64_t)v8.receiver);
  v8.receiver = self;
  v8.super_class = (Class)ISO18013Handler;
  id v5 = [(STSTransactionHandler *)&v8 stopTransaction];
  if (self && self->_transactionState - 1 <= 1)
  {
    uint64_t v6 = [(STSTransactionHandler *)self parent];
    [v6 fireSessionDidEndUnexpectedlyEventWithStatus:3];
  }
  sub_221182C18((os_unfair_lock_s *)self, 0);
  return 0;
}

- (void)tearDownWithCompletion:(id)a3
{
  id v7 = a3;
  sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[ISO18013Handler tearDownWithCompletion:]", 246, self, &stru_26D2FDEC0, v4, v5, v6);
  sub_221182C18((os_unfair_lock_s *)self, v7);
}

- (unsigned)supportedCredentialType
{
  return 2;
}

- (id)startTransactionWithAuthorization:(id)a3 options:(unint64_t)a4
{
  v26[4] = *MEMORY[0x263EF8340];
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler startTransactionWithAuthorization:options:]", 287, self, @"options = 0x%04x", v4, v5, a4);
  if ((a4 & 4) != 0)
  {
    sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[ISO18013Handler startTransactionWithAuthorization:options:]", 289, self, @"QRCodeHandoff", v9, v10, a4);
    v14 = 0;
  }
  else
  {
    v11 = [(STSHandler *)self handoffToken];

    if (v11)
    {
      if (self) {
        self->_startTransactionOption = a4;
      }
      id v12 = [(STSHandler *)self handoffToken];
      v13 = v12;
      if (self)
      {
        v22[0] = MEMORY[0x263EF8330];
        v22[1] = 3221225472;
        v22[2] = sub_221182218;
        v22[3] = &unk_264594968;
        v22[4] = self;
        v24 = sel__start18013TransactionWithToken_;
        id v23 = v12;
        os_unfair_lock_lock(&self->_handoverSessionMutex);
        v14 = ((void (*)(void *))sub_221182218)(v22);
        os_unfair_lock_unlock(&self->_handoverSessionMutex);
      }
      else
      {
        v14 = 0;
      }
    }
    else
    {
      v15 = (void *)MEMORY[0x263F087E8];
      v16 = [NSString stringWithUTF8String:"STS.fwk"];
      v25[0] = *MEMORY[0x263F08320];
      v17 = [NSString stringWithUTF8String:"Invalid State"];
      v26[0] = v17;
      v26[1] = &unk_26D307CD8;
      v25[1] = @"Line";
      v25[2] = @"Method";
      v18 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
      v26[2] = v18;
      v25[3] = *MEMORY[0x263F07F80];
      v19 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 294);
      v26[3] = v19;
      v20 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:4];
      v14 = [v15 errorWithDomain:v16 code:9 userInfo:v20];
    }
  }
  return v14;
}

- (void)transactionStarted:(unint64_t)a3
{
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler transactionStarted:]", 303, self, @"status=%lu", v3, v4, a3);
  if (self)
  {
    unint64_t transactionState = self->_transactionState;
    if (transactionState && transactionState != 3) {
      sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler transactionStarted:]", 307, self, @"Unexpected transaction state=%d", v7, v8, self->_transactionState);
    }
  }
  v11 = [(STSTransactionHandler *)self parent];
  if (a3 == 9)
  {
    id v17 = v11;
    [v11 fireRequestHandoverConfirmation];
  }
  else
  {
    if (a3) {
      goto LABEL_17;
    }
    id v17 = v11;
    if (self && self->_transactionState)
    {
      sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler transactionStarted:]", 318, self, @"Unexpected state, dropping start event", v12, v13, v16);
    }
    else
    {
      v14 = objc_opt_new();
      v15 = [(STSHandler *)self activeSTSCredential];
      [v14 setCredential:v15];

      [v14 setTransactionMode:4];
      [v17 fireTransactionStartEvent:v14];
      if (self) {
        self->_unint64_t transactionState = 1;
      }
    }
  }
  v11 = v17;
LABEL_17:
}

- (void)transactionEndedWithIdentifier:(id)a3 error:(id)a4
{
  id v22 = a3;
  id v8 = a4;
  if (!self)
  {
    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler transactionEndedWithIdentifier:error:]", 341, 0, @"keyIdentifier: %@, error: %@", v6, v7, (uint64_t)v22);
    goto LABEL_8;
  }
  if (self->_transactionState - 3 <= 1)
  {
    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler transactionEndedWithIdentifier:error:]", 337, self, @"Dropping transaction end event, keyIdentifier: %@, error: %@", v6, v7, (uint64_t)v22);
    goto LABEL_22;
  }
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler transactionEndedWithIdentifier:error:]", 341, self, @"keyIdentifier: %@, error: %@", v6, v7, (uint64_t)v22);
  uint64_t v9 = self->_releasedCredential;
  if (!v9)
  {
LABEL_8:
    v11 = [(STSHandler *)self activeSTSCredential];
    if (v11) {
      goto LABEL_6;
    }
LABEL_9:
    v11 = +[STSCredential credentialWithType:2 identifier:0x26D2FEE00 subIdentifier:v22];
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013Handler transactionEndedWithIdentifier:error:]", 351, self, @"A credential is not available.  Creating a credential for event - credential=%@", v13, v14, (uint64_t)v11);
    uint64_t v12 = 5;
    goto LABEL_10;
  }
  uint64_t v10 = v9;
  v11 = self->_releasedCredential;

  if (!v11) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v12 = 0;
LABEL_10:
  v15 = objc_alloc_init(STSTransactionEndEvent);
  [(STSTransactionEndEvent *)v15 setCredential:v11];
  [(STSTransactionEndEvent *)v15 setStatus:v12];
  if (v8)
  {
    uint64_t v16 = [v8 domain];
    int v17 = [v16 isEqual:@"STSXPCHelperErrorDomain"];

    if (v17)
    {
      uint64_t v18 = [v8 code];
      uint64_t v19 = 3;
      if (v18 == 14) {
        uint64_t v19 = 4;
      }
      if (v18 == 15) {
        uint64_t v20 = 6;
      }
      else {
        uint64_t v20 = v19;
      }
    }
    else
    {
      uint64_t v20 = 2;
    }
    [(STSTransactionEndEvent *)v15 setStatus:v20];
  }
  v21 = [(STSTransactionHandler *)self parent];
  [v21 fireTransactionEndEvent:v15];

  if (self) {
    self->_unint64_t transactionState = 3;
  }

LABEL_22:
}

- (void)notificationClientConnected
{
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler notificationClientConnected]", 380, self, &stru_26D2FDEC0, v2, v3, v7);
  if (self && (self->_startTransactionOption & 2) != 0) {
    id v5 = [(STSXPCClientNotificationListener *)self->_stsNotificationListener setRequestHandoverConfirmation:1];
  }
  sub_221183A50((id *)&self->super.super.super.isa);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [(STSTransactionHandler *)self parent];
  [v8 stsSessionNotificationListenerStarted:v6];
}

- (void)alternativeCarrierReceived:(id)a3 dataPending:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler alternativeCarrierReceived:dataPending:]", 389, self, @"dataPending=%d", v7, v8, v4);
  id v10 = [(STSTransactionHandler *)self parent];
  uint64_t v9 = sub_221183A50((id *)&self->super.super.super.isa);
  [v9 stsSession:v10 receivedFromAlternativeCarrier:v6 dataPending:v4];
}

- (void)alternativeCarrierConnectedWithStatus:(unint64_t)a3
{
  v19[4] = *MEMORY[0x263EF8340];
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler alternativeCarrierConnectedWithStatus:]", 398, self, @"status=%lu", v3, v4, a3);
  if (a3)
  {
    uint64_t v8 = (void *)MEMORY[0x263F087E8];
    uint64_t v9 = [NSString stringWithUTF8String:"STS.fwk"];
    v18[0] = *MEMORY[0x263F08320];
    id v10 = [NSString stringWithUTF8String:"Unexpected Result"];
    v19[0] = v10;
    v19[1] = &unk_26D307CF0;
    v18[1] = @"Line";
    v18[2] = @"Method";
    v11 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v19[2] = v11;
    v18[3] = *MEMORY[0x263F07F80];
    uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 402);
    v19[3] = v12;
    uint64_t v13 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:4];
    uint64_t v14 = [v8 errorWithDomain:v9 code:10 userInfo:v13];
  }
  else
  {
    uint64_t v14 = 0;
  }
  v15 = [(STSTransactionHandler *)self parent];
  uint64_t v16 = sub_221183A50((id *)&self->super.super.super.isa);
  [v16 stsSession:v15 connectedAlternativeCarrierWithStatus:v14];

  if (a3)
  {
    if (a3 == 3) {
      uint64_t v17 = 1;
    }
    else {
      uint64_t v17 = 2;
    }
    [v15 fireSessionDidEndUnexpectedlyEventWithStatus:v17];
    sub_221182C18((os_unfair_lock_s *)self, 0);
  }
}

- (void)alternativeCarrierDisconnectedWithStatus:(unint64_t)a3
{
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler alternativeCarrierDisconnectedWithStatus:]", 420, self, @"status=%d, transactionState=%lu", v3, v4, a3);
  id v20 = [(STSTransactionHandler *)self parent];
  uint64_t v7 = sub_221183A50((id *)&self->super.super.super.isa);
  [v7 stsSessionAlternativeCarrierDisconnected:v20];

  if (self && self->_transactionState - 1 <= 1)
  {
    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler alternativeCarrierDisconnectedWithStatus:]", 426, self, @"Transaction end unexpectedly", v8, v9, v18);
    switch(a3)
    {
      case 0uLL:
        int v10 = 0;
        uint64_t v11 = 7;
        break;
      case 1uLL:
      case 2uLL:
      case 4uLL:
      case 5uLL:
      case 9uLL:
        int v10 = 0;
        uint64_t v11 = 2;
        break;
      case 3uLL:
        int v10 = 0;
        uint64_t v11 = 1;
        break;
      case 6uLL:
      case 7uLL:
        int v10 = 0;
        uint64_t v11 = 12;
        break;
      case 8uLL:
        int v10 = 0;
        uint64_t v11 = 6;
        break;
      default:
        uint64_t v11 = 0;
        int v10 = 1;
        break;
    }
    uint64_t v12 = objc_alloc_init(STSTransactionEndEvent);
    [(STSTransactionEndEvent *)v12 setStatus:v11];
    if (self->_releasedCredential)
    {
      -[STSTransactionEndEvent setCredential:](v12, "setCredential:");
    }
    else
    {
      uint64_t v13 = [(STSHandler *)self activeSTSCredential];

      if (v13)
      {
        uint64_t v14 = [(STSHandler *)self activeSTSCredential];
        [(STSTransactionEndEvent *)v12 setCredential:v14];
      }
      else
      {
        v15 = +[STSCredential credentialWithType:2 identifier:0x26D2FEE00 subIdentifier:0];
        [(STSTransactionEndEvent *)v12 setCredential:v15];

        sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013Handler alternativeCarrierDisconnectedWithStatus:]", 462, self, @"Neither an active nor a released credential are set.", v16, v17, v19);
        if (v10) {
          [(STSTransactionEndEvent *)v12 setStatus:5];
        }
      }
    }
    [v20 fireTransactionEndEvent:v12];
  }
  sub_221182C18((os_unfair_lock_s *)self, 0);
}

- (void)processISO18013CredentialProposals:(id)a3 readerAuthInfo:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler processISO18013CredentialProposals:readerAuthInfo:]", 477, self, &stru_26D2FDEC0, v8, v9, v12);
  int v10 = sub_22119847C();
  if (os_signpost_enabled(v10))
  {
    LOWORD(v12) = 0;
    _os_signpost_emit_with_name_impl(&dword_221170000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ProcessCredentialProposals", (const char *)&unk_2211AD787, (uint8_t *)&v12, 2u);
  }

  if (self) {
    self->_unint64_t transactionState = 2;
  }
  uint64_t v11 = [(STSTransactionHandler *)self parent];
  [v11 fireDidReceive18013Requests:v7 readerAuthInfo:v6];
}

- (void)xpcInvalidated
{
  if (!self || self->_transactionState != 4)
  {
    uint64_t v3 = [(STSTransactionHandler *)self parent];
    [v3 fireSessionDidEndUnexpectedlyEventWithStatus:2];

    sub_221182C18((os_unfair_lock_s *)self, 0);
  }
}

- (void)xpcInterrupted
{
  if (!self || self->_transactionState != 4)
  {
    uint64_t v3 = [(STSTransactionHandler *)self parent];
    [v3 fireSessionDidEndUnexpectedlyEventWithStatus:2];

    sub_221182C18((os_unfair_lock_s *)self, 0);
  }
}

- (void)session:(id)a3 fieldChange:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v6 = sub_22119847C();
  if (os_signpost_enabled(v6))
  {
    id v7 = "no";
    if (v4) {
      id v7 = "yes";
    }
    int v9 = 136315138;
    int v10 = v7;
    _os_signpost_emit_with_name_impl(&dword_221170000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ISO18013Handler_FieldChange", "fieldPresent=%s", (uint8_t *)&v9, 0xCu);
  }

  if (v4)
  {
    if (self) {
      stsNotificationListener = self->_stsNotificationListener;
    }
    else {
      stsNotificationListener = 0;
    }
    [(STSXPCClientNotificationListener *)stsNotificationListener sendConnectionHandoverStarted];
  }
}

- (void)session:(id)a3 fieldNotification:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a4;
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler session:fieldNotification:]", 533, self, @"field=%@", v6, v7, (uint64_t)v5);
  uint64_t v8 = sub_22119847C();
  if (os_signpost_enabled(v8))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v5;
    _os_signpost_emit_with_name_impl(&dword_221170000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ISO18013Handler_FieldDetect", "field=%@", buf, 0xCu);
  }

  int v9 = sub_221199468(v5);
  int v10 = [(STSTransactionHandler *)self parent];
  [v10 fireFieldNotificationEvent:v9];
}

- (void)session:(id)a3 tnepService:(id)a4
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = sub_22119847C();
  if (os_signpost_enabled(v6))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v5;
    _os_signpost_emit_with_name_impl(&dword_221170000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ISO18013Handler_TnepService_Selected", "service=%@", buf, 0xCu);
  }

  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler session:tnepService:]", 543, self, @"service=%@", v7, v8, (uint64_t)v5);
}

- (void)session:(id)a3 connectionHandoverProcessFailure:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a4;
  uint64_t v6 = sub_22119847C();
  if (os_signpost_enabled(v6))
  {
    *(_DWORD *)buf = 138412290;
    id v19 = v5;
    _os_signpost_emit_with_name_impl(&dword_221170000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ISO18013Handler_HandoverFailure", "error=%@", buf, 0xCu);
  }

  if ([v5 code] != 2 && objc_msgSend(v5, "code") != 8)
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013Handler session:connectionHandoverProcessFailure:]", 556, self, @"error=%@", v7, v8, (uint64_t)v5);
    if ([v5 code] == 6)
    {
      uint64_t v9 = 4;
LABEL_20:
      sub_2211841CC((os_unfair_lock_s *)self);
      uint64_t v16 = [(STSTransactionHandler *)self parent];
      [v16 fireSessionDidEndUnexpectedlyEventWithStatus:v9];

      goto LABEL_21;
    }
    if ([v5 code] != 12)
    {
      uint64_t v9 = 0;
      goto LABEL_20;
    }
    id v10 = [v5 userInfo];
    uint64_t v11 = [v10 objectForKeyedSubscript:*MEMORY[0x263F08608]];

    id v12 = [v11 domain];
    if ([v12 isEqualToString:@"WifiDomain"])
    {
      uint64_t v13 = [v11 code];

      if (v13 == 3)
      {
        uint64_t v9 = 5;
LABEL_19:

        goto LABEL_20;
      }
    }
    else
    {
    }
    uint64_t v14 = [v11 domain];
    if ([v14 isEqualToString:@"BluetoothDomain"])
    {
      uint64_t v15 = [v11 code];

      if (v15) {
        uint64_t v9 = 0;
      }
      else {
        uint64_t v9 = 6;
      }
    }
    else
    {

      uint64_t v9 = 0;
    }
    goto LABEL_19;
  }
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler session:connectionHandoverProcessFailure:]", 553, self, @"Allows reader to retry", v7, v8, v17);
LABEL_21:
}

- (void)connectionHandoverCompleted:(id)a3
{
  BOOL v4 = sub_22119847C();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_221170000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ISO18013Handler_HandoverCompleted", (const char *)&unk_2211AD787, buf, 2u);
  }

  if (self)
  {
    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler connectionHandoverCompleted:]", 578, self, @"transactionState=%lu", v5, v6, self->_transactionState);
    [(STSXPCClientNotificationListener *)self->_stsNotificationListener sendConnectionHandoverCompleted];
    if (self->_transactionState) {
      sub_2211841CC((os_unfair_lock_s *)self);
    }
  }
  else
  {
    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013Handler connectionHandoverCompleted:]", 578, 0, @"transactionState=%lu", v5, v6, 0);
    [0 sendConnectionHandoverCompleted];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_releasedCredential, 0);
  objc_storeStrong((id *)&self->_handoverSession, 0);
  objc_destroyWeak((id *)&self->_notificationTesterDelegate);
  objc_storeStrong((id *)&self->_stsHelper, 0);
  objc_storeStrong((id *)&self->_stsNotificationListener, 0);
}

@end