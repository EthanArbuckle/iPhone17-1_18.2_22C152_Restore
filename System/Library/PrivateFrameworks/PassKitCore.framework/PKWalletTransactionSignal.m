@interface PKWalletTransactionSignal
+ (void)_donateSignalForPass:(id)a3 transactionType:(int)a4 transactionDate:(id)a5 transactionID:(id)a6 merchantCategory:(int64_t)a7 merchantDetailedCategory:(id)a8 queue:(id)a9 completion:(id)a10;
+ (void)donateSignalForPass:(id)a3 transaction:(id)a4 queue:(id)a5 completion:(id)a6;
+ (void)donateSignalForPass:(id)a3 transactionType:(int)a4 queue:(id)a5 completion:(id)a6;
@end

@implementation PKWalletTransactionSignal

+ (void)donateSignalForPass:(id)a3 transaction:(id)a4 queue:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = [v12 transactionType];
  if (v14 == 2) {
    unsigned int v15 = 3;
  }
  else {
    unsigned int v15 = v14 == 0;
  }
  if (v14 == 15) {
    uint64_t v16 = 6;
  }
  else {
    uint64_t v16 = v15;
  }
  id v21 = [v12 merchant];
  v17 = [v12 transactionDate];
  v18 = [v12 identifier];

  uint64_t v19 = [v21 category];
  v20 = [v21 detailedCategory];
  [a1 _donateSignalForPass:v13 transactionType:v16 transactionDate:v17 transactionID:v18 merchantCategory:v19 merchantDetailedCategory:v20 queue:v11 completion:v10];
}

+ (void)donateSignalForPass:(id)a3 transactionType:(int)a4 queue:(id)a5 completion:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v10 = (void *)MEMORY[0x1E4F1C9C8];
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  id v14 = [v10 now];
  [a1 _donateSignalForPass:v13 transactionType:v7 transactionDate:v14 transactionID:0 merchantCategory:0 merchantDetailedCategory:0 queue:v12 completion:v11];
}

+ (void)_donateSignalForPass:(id)a3 transactionType:(int)a4 transactionDate:(id)a5 transactionID:(id)a6 merchantCategory:(int64_t)a7 merchantDetailedCategory:(id)a8 queue:(id)a9 completion:(id)a10
{
  id v14 = a3;
  id v15 = a6;
  id v16 = a8;
  id v17 = a10;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __155__PKWalletTransactionSignal__donateSignalForPass_transactionType_transactionDate_transactionID_merchantCategory_merchantDetailedCategory_queue_completion___block_invoke;
  v22[3] = &unk_1E56F1060;
  int v28 = a4;
  id v26 = v17;
  int64_t v27 = a7;
  id v23 = v14;
  id v24 = v15;
  id v25 = v16;
  id v18 = v17;
  id v19 = v16;
  id v20 = v15;
  id v21 = v14;
  dispatch_async((dispatch_queue_t)a9, v22);
}

void __155__PKWalletTransactionSignal__donateSignalForPass_transactionType_transactionDate_transactionID_merchantCategory_merchantDetailedCategory_queue_completion___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(unsigned int *)(a1 + 72);
  switch((int)v2)
  {
    case 1:
    case 2:
    case 3:
    case 5:
    case 6:
      int v3 = 0;
      int v4 = 0;
      break;
    case 4:
      int v4 = 0;
      int v3 = 1;
      break;
    default:
      int v3 = 0;
      uint64_t v2 = 0;
      int v4 = 1;
      break;
  }
  if ((unint64_t)(*(void *)(a1 + 64) - 1) < 7) {
    uint64_t v5 = *(unsigned int *)(a1 + 64);
  }
  else {
    uint64_t v5 = 0;
  }
  v6 = [*(id *)(a1 + 32) uniqueID];
  uint64_t v7 = [*(id *)(a1 + 32) secureElementPass];
  v8 = v7;
  if (v3 && v7)
  {
    if (([v7 isAccessPass] & 1) == 0)
    {
      v9 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138412290;
        id v20 = v6;
        _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "PKWalletTransactionSignal: Correcting transaction type of %@ for open loop transit", (uint8_t *)&v19, 0xCu);
      }

LABEL_14:
      uint64_t v2 = 3;
      goto LABEL_19;
    }
LABEL_18:
    uint64_t v2 = 4;
    goto LABEL_19;
  }
  if (!v4) {
    goto LABEL_19;
  }
  if ([v7 isTransitPass]) {
    goto LABEL_14;
  }
  if ([v8 isAccessPass]) {
    goto LABEL_18;
  }
  if ([v8 isEMoneyPass])
  {
    uint64_t v2 = 5;
  }
  else
  {
    int v18 = [v8 isIdentityPass];
    if (v18) {
      uint64_t v2 = 6;
    }
    else {
      uint64_t v2 = 1;
    }
    if (!v8 && (v18 & 1) == 0)
    {
      if ([*(id *)(a1 + 32) hasValidNFCPayload]) {
        uint64_t v2 = 2;
      }
      else {
        uint64_t v2 = 0;
      }
    }
  }
LABEL_19:
  id v10 = BiomeLibrary();
  id v11 = [v10 Wallet];
  id v12 = [v11 Transaction];

  id v13 = [v12 source];
  id v14 = objc_alloc(MEMORY[0x1E4F50190]);
  id v15 = [*(id *)(a1 + 32) localizedDescription];
  id v16 = (void *)[v14 initWithPassUniqueID:v6 passLocalizedDescription:v15 transactionType:v2 transactionID:*(void *)(a1 + 40) merchantType:v5 poiCategory:*(void *)(a1 + 48)];

  [v13 sendEvent:v16];
  uint64_t v17 = *(void *)(a1 + 56);
  if (v17) {
    (*(void (**)(uint64_t, void))(v17 + 16))(v17, 0);
  }
}

@end