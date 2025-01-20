@interface PKContactlessCardIngester
+ (id)debugDescriptionForStatus:(unint64_t)a3;
- (PKContactlessCardIngester)initWithPaymentSetupProduct:(id)a3 delegate:(id)a4;
- (id)_displayableErrorForSPStatusCode:(unint64_t)a3 seldError:(id)a4;
- (void)_cancelCardIngestion;
- (void)_ingestCardWithCardSessionToken:(id)a3 completion:(id)a4;
- (void)_ingestCardWithCompletion:(id)a3;
- (void)_startListeningToRemoteAdminEventsIfRequired;
- (void)_stopListeningToRemoteAdminEvents;
- (void)ingestCardWithCardSessionToken:(id)a3 successHandler:(id)a4;
- (void)ingestCardWithSuccessHandler:(id)a3;
- (void)invalidate;
- (void)readerModeCardIngestionStatus:(unint64_t)a3;
- (void)readerModeCardSessionToken:(id)a3;
@end

@implementation PKContactlessCardIngester

- (PKContactlessCardIngester)initWithPaymentSetupProduct:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PKContactlessCardIngester;
  v8 = [(PKContactlessCardIngester *)&v17 init];
  if (v8)
  {
    v9 = [PKGetClassNFRemoteAdminManager() sharedRemoteAdminManager];
    uint64_t v10 = [v9 primaryRegionTopic];
    pushTopic = v8->_pushTopic;
    v8->_pushTopic = (NSString *)v10;

    uint64_t v12 = [v6 provisioningMethodMetadataForType:@"readerMode"];
    readerModeProvisioningMetadata = v8->_readerModeProvisioningMetadata;
    v8->_readerModeProvisioningMetadata = (PKPaymentProvisioningMethodMetadata *)v12;

    objc_storeWeak((id *)&v8->_delegate, v7);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.passkit.contactlesscardingester", 0);
    contactlessCardIngesterQueue = v8->_contactlessCardIngesterQueue;
    v8->_contactlessCardIngesterQueue = (OS_dispatch_queue *)v14;
  }
  return v8;
}

- (void)invalidate
{
  [(PKContactlessCardIngester *)self _cancelCardIngestion];
  [(PKContactlessCardIngester *)self _stopListeningToRemoteAdminEvents];
}

- (void)ingestCardWithSuccessHandler:(id)a3
{
  id v4 = a3;
  contactlessCardIngesterQueue = self->_contactlessCardIngesterQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__PKContactlessCardIngester_ingestCardWithSuccessHandler___block_invoke;
  v8[3] = &unk_1E56D8A18;
  v8[4] = self;
  id v9 = v4;
  id v6 = v8;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_21;
  block[3] = &unk_1E56D8360;
  id v11 = v6;
  id v7 = v4;
  dispatch_async(contactlessCardIngesterQueue, block);
}

uint64_t __58__PKContactlessCardIngester_ingestCardWithSuccessHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _startListeningToRemoteAdminEventsIfRequired];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  return [v2 _ingestCardWithCompletion:v3];
}

- (void)ingestCardWithCardSessionToken:(id)a3 successHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  contactlessCardIngesterQueue = self->_contactlessCardIngesterQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__PKContactlessCardIngester_ingestCardWithCardSessionToken_successHandler___block_invoke;
  v12[3] = &unk_1E56D89F0;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v9 = v12;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_21;
  block[3] = &unk_1E56D8360;
  id v16 = v9;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(contactlessCardIngesterQueue, block);
}

uint64_t __75__PKContactlessCardIngester_ingestCardWithCardSessionToken_successHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _startListeningToRemoteAdminEventsIfRequired];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  return [v2 _ingestCardWithCardSessionToken:v3 completion:v4];
}

- (void)_cancelCardIngestion
{
  contactlessCardIngesterQueue = self->_contactlessCardIngesterQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__PKContactlessCardIngester__cancelCardIngestion__block_invoke;
  v4[3] = &unk_1E56D8AE0;
  v4[4] = self;
  uint64_t v3 = v4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_21;
  block[3] = &unk_1E56D8360;
  id v6 = v3;
  dispatch_async(contactlessCardIngesterQueue, block);
}

void __49__PKContactlessCardIngester__cancelCardIngestion__block_invoke(uint64_t a1)
{
  v2 = [PKGetClassNFRemoteAdminManager() sharedRemoteAdminManager];
  [v2 cancelCardIngestion];

  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 56);
  *(void *)(v3 + 56) = 0;

  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = 0;
}

+ (id)debugDescriptionForStatus:(unint64_t)a3
{
  if (a3 - 1 > 0xC) {
    uint64_t v3 = @"Unknown";
  }
  else {
    uint64_t v3 = off_1E56F4988[a3 - 1];
  }
  return (id)[NSString stringWithFormat:@"%lu - %@", a3, v3];
}

- (void)_ingestCardWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _Block_copy(v4);
  id cardSessionTokenCompletionHandler = self->_cardSessionTokenCompletionHandler;
  self->_id cardSessionTokenCompletionHandler = v5;

  objc_initWeak(&location, self);
  id v7 = PKGetClassNFRemoteAdminCardIngestionRequest();
  pushTopic = self->_pushTopic;
  id v9 = [(PKPaymentProvisioningMethodMetadata *)self->_readerModeProvisioningMetadata readerModeMetadata];
  id v10 = [v7 cardIngestionRequestWithServerIdentifier:pushTopic sessionToken:0 readerModeMetadata:v9 maxDetectionTimeout:60000];

  id v11 = [PKGetClassNFRemoteAdminManager() sharedRemoteAdminManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__PKContactlessCardIngester__ingestCardWithCompletion___block_invoke;
  v12[3] = &unk_1E56F4968;
  v12[4] = self;
  objc_copyWeak(&v13, &location);
  [v11 ingestCard:v10 withCompletionHandler:v12];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __55__PKContactlessCardIngester__ingestCardWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 48);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__PKContactlessCardIngester__ingestCardWithCompletion___block_invoke_2;
  v10[3] = &unk_1E56E1C78;
  objc_copyWeak(v12, (id *)(a1 + 40));
  uint64_t v7 = *(void *)(a1 + 32);
  v12[1] = a3;
  v10[4] = v7;
  id v11 = v5;
  v8 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_21;
  block[3] = &unk_1E56D8360;
  id v14 = v8;
  id v9 = v5;
  dispatch_async(v6, block);

  objc_destroyWeak(v12);
}

void __55__PKContactlessCardIngester__ingestCardWithCompletion___block_invoke_2(uint64_t a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained && WeakRetained[7])
  {
    id v4 = [*(id *)(a1 + 32) _displayableErrorForSPStatusCode:*(void *)(a1 + 56) seldError:*(void *)(a1 + 40)];
    if (v4)
    {
      id v5 = (void *)*((void *)v3 + 7);
      *((void *)v3 + 7) = 0;

      id v6 = objc_loadWeakRetained((id *)v3 + 5);
      char v7 = objc_opt_respondsToSelector();

      if (v7)
      {
        id v8 = objc_loadWeakRetained((id *)v3 + 5);
        [v8 contactlessCardIngester:v3 didFailToIngestCardWithError:v4 resetProvisioning:1 isRecoverable:(*(void *)(a1 + 56) > 0xCuLL) | (0x103u >> *(void *)(a1 + 56)) & 1];
      }
    }
  }
  if (*(void *)(a1 + 56) != -1)
  {
    id v11 = @"code";
    id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    v12[0] = v9;
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    AnalyticsSendEvent();
  }
}

- (void)_ingestCardWithCardSessionToken:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _Block_copy(v7);
  id disableCardCompletionHandler = self->_disableCardCompletionHandler;
  self->_id disableCardCompletionHandler = v8;

  objc_initWeak(&location, self);
  id v10 = PKGetClassNFRemoteAdminCardIngestionRequest();
  pushTopic = self->_pushTopic;
  uint64_t v12 = [(PKPaymentProvisioningMethodMetadata *)self->_readerModeProvisioningMetadata readerModeMetadata];
  id v13 = [v10 cardIngestionRequestWithServerIdentifier:pushTopic sessionToken:v6 readerModeMetadata:v12 maxDetectionTimeout:60000];

  id v14 = [PKGetClassNFRemoteAdminManager() sharedRemoteAdminManager];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__PKContactlessCardIngester__ingestCardWithCardSessionToken_completion___block_invoke;
  v15[3] = &unk_1E56F4968;
  v15[4] = self;
  objc_copyWeak(&v16, &location);
  [v14 ingestCard:v13 withCompletionHandler:v15];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __72__PKContactlessCardIngester__ingestCardWithCardSessionToken_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 48);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__PKContactlessCardIngester__ingestCardWithCardSessionToken_completion___block_invoke_2;
  v10[3] = &unk_1E56E1C78;
  objc_copyWeak(v12, (id *)(a1 + 40));
  uint64_t v7 = *(void *)(a1 + 32);
  v12[1] = a3;
  v10[4] = v7;
  id v11 = v5;
  id v8 = v10;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_21;
  block[3] = &unk_1E56D8360;
  id v14 = v8;
  id v9 = v5;
  dispatch_async(v6, block);

  objc_destroyWeak(v12);
}

void __72__PKContactlessCardIngester__ingestCardWithCardSessionToken_completion___block_invoke_2(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained && WeakRetained[8])
  {
    id v4 = [*(id *)(a1 + 32) _displayableErrorForSPStatusCode:*(void *)(a1 + 56) seldError:*(void *)(a1 + 40)];
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 56);
      id v6 = objc_loadWeakRetained(v3 + 5);
      char v7 = objc_opt_respondsToSelector();

      if (v7)
      {
        id v8 = objc_loadWeakRetained(v3 + 5);
        [v8 contactlessCardIngester:v3 didFailToIngestCardWithError:v4 resetProvisioning:v5 != 0 isRecoverable:(*(void *)(a1 + 56) > 0xCuLL) | (0x103u >> *(void *)(a1 + 56)) & 1];
      }
    }
    else
    {
      id v9 = (void (**)(void))v3[8];
      if (v9) {
        v9[2]();
      }
    }
    id v10 = v3[8];
    v3[8] = 0;
  }
  if (*(void *)(a1 + 56) != -1)
  {
    id v13 = @"code";
    id v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
    v14[0] = v11;
    uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    AnalyticsSendEvent();
  }
}

- (void)readerModeCardSessionToken:(id)a3
{
  id v4 = a3;
  contactlessCardIngesterQueue = self->_contactlessCardIngesterQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __56__PKContactlessCardIngester_readerModeCardSessionToken___block_invoke;
  v8[3] = &unk_1E56D8A90;
  v8[4] = self;
  id v9 = v4;
  id v6 = v8;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __dispatch_async_ar_block_invoke_21;
  block[3] = &unk_1E56D8360;
  id v11 = v6;
  id v7 = v4;
  dispatch_async(contactlessCardIngesterQueue, block);
}

uint64_t __56__PKContactlessCardIngester_readerModeCardSessionToken___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 56);
  if (v2)
  {
    (*(void (**)(uint64_t, void))(v2 + 16))(v2, *(void *)(a1 + 40));
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 56);
    *(void *)(v3 + 56) = 0;
  }
  return AnalyticsSendEvent();
}

- (void)readerModeCardIngestionStatus:(unint64_t)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    if (a3 - 1 >= 0xC) {
      a3 = 13;
    }
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    [v8 contactlessCardIngester:self didUpdateCardIngestionStatus:a3];
  }
}

- (void)_stopListeningToRemoteAdminEvents
{
  uint64_t v3 = [PKGetClassNFRemoteAdminManager() sharedRemoteAdminManager];
  [v3 unregisterEventListener:self];

  self->_listening = 0;
}

- (void)_startListeningToRemoteAdminEventsIfRequired
{
  if (!self->_listening)
  {
    uint64_t v3 = [PKGetClassNFRemoteAdminManager() sharedRemoteAdminManager];
    [v3 registerEventListener:self];

    self->_listening = 1;
  }
}

- (id)_displayableErrorForSPStatusCode:(unint64_t)a3 seldError:(id)a4
{
  id v6 = a4;
  char v7 = PKLocalizedPaymentString(&cfstr_ReaderModeErro.isa, 0);
  id v8 = 0;
  switch(a3)
  {
    case 0xFFFFFFFFFFFFFFFFLL:
      if (v6)
      {
        if ([v6 code] == 4) {
          goto LABEL_2;
        }
        if ([v6 code] == 2) {
          uint64_t v10 = 2;
        }
        else {
          uint64_t v10 = 1;
        }
        id v8 = PKDisplayableErrorForCommonType(v10, v6);
        if (!v8) {
          break;
        }
      }
      else
      {
        id v8 = 0;
      }
      goto LABEL_23;
    case 0uLL:
      goto LABEL_23;
    case 1uLL:
      id v9 = @"READER_MODE_INGEST_ERROR_CARD_READ_ERROR";
      goto LABEL_21;
    case 2uLL:
    case 3uLL:
    case 6uLL:
LABEL_2:
      id v9 = @"READER_MODE_INGEST_ERROR_CARD_NOT_SUPPORTED_MESSAGE";
      goto LABEL_21;
    case 4uLL:
    case 5uLL:
      id v9 = @"READER_MODE_INGEST_ERROR_CARD_INACTIVE";
      goto LABEL_21;
    case 7uLL:
      id v9 = @"READER_MODE_INGEST_ERROR_CARD_INVALID";
      goto LABEL_21;
    case 8uLL:
      uint64_t v11 = PKLocalizedPaymentString(&cfstr_ReaderModeInge_8.isa, 0);

      id v8 = PKLocalizedPaymentString(&cfstr_ReaderModeInge_9.isa, 0);
      char v7 = (void *)v11;
      break;
    case 9uLL:
      id v9 = @"READER_MODE_INGEST_ERROR_SERVER_DOWN";
      goto LABEL_21;
    case 0xAuLL:
      uint64_t v12 = [(PKPaymentProvisioningMethodMetadata *)self->_readerModeProvisioningMetadata minimumReaderModeBalance];
      if (v12)
      {
        currencyNumberFormatter = self->_currencyNumberFormatter;
        if (!currencyNumberFormatter)
        {
          id v14 = [(PKPaymentProvisioningMethodMetadata *)self->_readerModeProvisioningMetadata currency];
          PKMutableNumberFormatterForCurrencyCode(v14);
          v15 = (NSNumberFormatter *)objc_claimAutoreleasedReturnValue();
          id v16 = self->_currencyNumberFormatter;
          self->_currencyNumberFormatter = v15;

          if (objc_msgSend(v12, "pk_isIntegralNumber")) {
            NSUInteger v17 = 0;
          }
          else {
            NSUInteger v17 = [(NSNumberFormatter *)self->_currencyNumberFormatter maximumFractionDigits];
          }
          [(NSNumberFormatter *)self->_currencyNumberFormatter setMinimumFractionDigits:v17];
          currencyNumberFormatter = self->_currencyNumberFormatter;
        }
        v20 = [(NSNumberFormatter *)currencyNumberFormatter stringFromNumber:v12];
        id v8 = PKLocalizedPaymentString(&cfstr_ReaderModeInge_0.isa, &stru_1EE0F6808.isa, v20);
      }
      else
      {
        id v8 = PKLocalizedPaymentString(&cfstr_ReaderModeInge_1.isa, 0);
      }

      break;
    case 0xBuLL:
      id v9 = @"READER_MODE_INGEST_ERROR_EXPIRED";
      goto LABEL_21;
    case 0xCuLL:
      id v9 = @"READER_MODE_INGEST_ERROR_RATE_LIMITED";
LABEL_21:
      id v8 = PKLocalizedPaymentString(&v9->isa, 0);
      break;
    default:
      break;
  }
  uint64_t v18 = PKDisplayableErrorCustomWithType(-1, v7, v8, 0, 0);

  id v8 = (void *)v18;
LABEL_23:

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_disableCardCompletionHandler, 0);
  objc_storeStrong(&self->_cardSessionTokenCompletionHandler, 0);
  objc_storeStrong((id *)&self->_contactlessCardIngesterQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currencyNumberFormatter, 0);
  objc_storeStrong((id *)&self->_readerModeProvisioningMetadata, 0);
  objc_storeStrong((id *)&self->_pushTopic, 0);
}

@end