@interface PKMockPeerPaymentController
- (BOOL)shouldGenerateMockTransactions;
- (PKCurrencyAmount)mockBalance;
- (PKMockPeerPaymentController)initWithPeerPaymentWebService:(id)a3;
- (id)_quoteItemDictionaryWithType:(unint64_t)a3 amount:(id)a4 alternateFundingSource:(id)a5 featureDescriptor:(id)a6;
- (void)_adjustBalanceForAuthorizedTransferQuote:(id)a3;
- (void)_insertPaymentTransactionForSecondaryFundingSourceIfNecessary:(id)a3;
- (void)_insertPeerPaymentTransactionForAuthroizedTransferQuote:(id)a3;
- (void)formalRequestTokenForAmount:(id)a3 source:(unint64_t)a4 completion:(id)a5;
- (void)identifyRecipientWithAddress:(id)a3 senderAddress:(id)a4 completion:(id)a5;
- (void)paymentAuthorizationCoordinator:(id *)a3 didAuthorizePeerPaymentQuote:(id)a4 handler:(id)a5;
- (void)paymentAuthorizationCoordinator:(id *)a3 didSelectPaymentMethod:(id)a4 handler:(id)a5;
- (void)performAction:(id)a3 withPaymentIdentifier:(id)a4 completion:(id)a5;
- (void)quoteWithAmount:(id)a3 source:(unint64_t)a4 requestToken:(id)a5 alternateFundingSource:(id)a6 recurringPaymentIdentifier:(id)a7 frequency:(unint64_t)a8 startDate:(id)a9 threshold:(id)a10 completion:(id)a11;
- (void)setMockBalance:(id)a3;
- (void)setShouldGenerateMockTransactions:(BOOL)a3;
@end

@implementation PKMockPeerPaymentController

- (PKMockPeerPaymentController)initWithPeerPaymentWebService:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKMockPeerPaymentController;
  v5 = [(PKPeerPaymentController *)&v8 initWithPeerPaymentWebService:v4];
  if (v5)
  {
    v6 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      v10 = v5;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "PKMockPeerPaymentController: %p initWithPeerPaymentWebService: %@", buf, 0x16u);
    }

    v5->_shouldGenerateMockTransactions = 1;
  }

  return v5;
}

- (void)identifyRecipientWithAddress:(id)a3 senderAddress:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_time_t v11 = dispatch_time(0, 10000000);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __85__PKMockPeerPaymentController_identifyRecipientWithAddress_senderAddress_completion___block_invoke;
  v15[3] = &unk_1E56D8BA8;
  id v16 = v8;
  v17 = self;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_after(v11, MEMORY[0x1E4F14428], v15);
}

void __85__PKMockPeerPaymentController_identifyRecipientWithAddress_senderAddress_completion___block_invoke(uint64_t a1)
{
  obj = objc_alloc_init(PKPeerPaymentRecipient);
  [(PKPeerPaymentRecipient *)obj setStatus:1];
  [(PKPeerPaymentRecipient *)obj setIdentifier:@"aaa"];
  [(PKPeerPaymentRecipient *)obj setReceiveCurrency:@"USD"];
  [(PKPeerPaymentRecipient *)obj setPhoneOrEmail:*(void *)(a1 + 32)];
  v2 = [*(id *)(a1 + 40) displayNameForRecipientAddress:*(void *)(a1 + 32)];
  [(PKPeerPaymentRecipient *)obj setDisplayName:v2];

  [(PKPeerPaymentRecipient *)obj setAllowsFormalPaymentRequests:1];
  v3 = [*(id *)(a1 + 40) internalState];
  objc_storeStrong(v3 + 5, obj);

  id v4 = *(void **)(a1 + 32);
  v5 = [*(id *)(a1 + 40) internalState];
  objc_storeStrong(v5 + 4, v4);

  v6 = *(void **)(a1 + 48);
  v7 = [*(id *)(a1 + 40) internalState];
  objc_storeStrong(v7 + 3, v6);

  [*(id *)(a1 + 40) _setState:2 notify:1];
  uint64_t v8 = *(void *)(a1 + 56);
  if (v8) {
    (*(void (**)(uint64_t, unint64_t, PKPeerPaymentRecipient *, void))(v8 + 16))(v8, [(PKPeerPaymentRecipient *)obj status], obj, 0);
  }
}

- (id)_quoteItemDictionaryWithType:(unint64_t)a3 amount:(id)a4 alternateFundingSource:(id)a5 featureDescriptor:(id)a6
{
  v42[16] = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a6;
  dispatch_time_t v11 = [a5 devicePrimaryPaymentApplication];
  id v12 = [v9 amount];
  id v13 = [MEMORY[0x1E4F28C28] zero];
  if (a5 && [v11 paymentType] != 1)
  {
    id v14 = [v9 currency];
    __int16 v15 = PKMaximumFractionDigitsForCurrencyCode(v14);

    id v16 = [MEMORY[0x1E4F28C30] decimalNumberHandlerWithRoundingMode:0 scale:v15 raiseOnExactness:0 raiseOnOverflow:0 raiseOnUnderflow:0 raiseOnDivideByZero:0];
    v17 = [MEMORY[0x1E4F28C28] decimalNumberWithString:@"0.03"];
    id v18 = [v9 amount];
    uint64_t v19 = [v18 decimalNumberByMultiplyingBy:v17 withBehavior:v16];

    id v13 = (void *)v19;
  }
  v20 = [v9 amount];
  v21 = [v20 decimalNumberByAdding:v13];

  v41[0] = @"type";
  v38 = PKPeerPaymentQuoteItemTypeToString(a3);
  v42[0] = v38;
  v42[1] = @"1";
  v41[1] = @"exchangeRate";
  v41[2] = @"sendAmount";
  v37 = [v12 stringValue];
  v42[2] = v37;
  v41[3] = @"sendAmountCurrency";
  v36 = [v9 currency];
  v42[3] = v36;
  v41[4] = @"receiveAmount";
  v35 = [v9 amount];
  v34 = [v35 stringValue];
  v42[4] = v34;
  v41[5] = @"receiveAmountCurrency";
  v22 = [v9 currency];
  v42[5] = v22;
  v41[6] = @"totalAmount";
  v39 = v21;
  v23 = [v21 stringValue];
  v42[6] = v23;
  v41[7] = @"totalAmountCurrency";
  v24 = [v9 currency];
  v42[7] = v24;
  v41[8] = @"dpanIdentifier";
  v40 = v12;
  v33 = v11;
  if (v11) {
    [v11 dpanIdentifier];
  }
  else {
  v25 = [MEMORY[0x1E4F1CA98] null];
  }
  v42[8] = v25;
  v41[9] = @"fees";
  v26 = [v13 stringValue];
  v42[9] = v26;
  v41[10] = @"feesCurrency";
  v27 = [v9 currency];
  v42[10] = v27;
  v41[11] = @"supportedNetworks";
  [v10 supportedNetworks];
  v28 = v32 = v13;
  v42[11] = v28;
  v42[12] = &unk_1EE22AD00;
  v41[12] = @"merchantCapabilities";
  v41[13] = @"merchantIdentifier";
  v29 = [v10 merchantIdentifier];

  v42[13] = v29;
  v42[14] = @"342f5544";
  v41[14] = @"nonce";
  v41[15] = @"countryCode";
  v42[15] = @"US";
  v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:16];

  return v30;
}

- (void)quoteWithAmount:(id)a3 source:(unint64_t)a4 requestToken:(id)a5 alternateFundingSource:(id)a6 recurringPaymentIdentifier:(id)a7 frequency:(unint64_t)a8 startDate:(id)a9 threshold:(id)a10 completion:(id)a11
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v44 = a5;
  id v16 = a6;
  id v17 = a7;
  id v43 = a9;
  id v18 = a10;
  id v19 = a11;
  if (!v16)
  {
    id v16 = [(PKPeerPaymentController *)self _defaultAlternateFundingSourceForMode:[(PKPeerPaymentController *)self mode]];
  }
  v20 = [(PKPeerPaymentController *)self account];
  v21 = v20;
  mockBalance = self->_mockBalance;
  if (mockBalance)
  {
    v23 = mockBalance;
  }
  else
  {
    v23 = [v20 currentBalance];
  }
  v24 = v23;
  if ([(PKPeerPaymentController *)self mode] == 5)
  {
    uint64_t v25 = 0;
  }
  else
  {
    if ([(PKPeerPaymentController *)self mode] != 1) {
      goto LABEL_17;
    }
    [v15 amount];
    v41 = v21;
    id v26 = v15;
    id v27 = v18;
    v29 = id v28 = v17;
    v30 = [(PKCurrencyAmount *)v24 amount];
    uint64_t v31 = [v30 compare:v29];

    BOOL v32 = v31 == -1;
    BOOL v33 = v31 != -1;
    uint64_t v25 = v32 ? 40301 : 0;

    id v17 = v28;
    id v18 = v27;
    id v15 = v26;
    v21 = v41;
    if (v33) {
      goto LABEL_17;
    }
  }
  if (v16)
  {
LABEL_17:
    dispatch_time_t v40 = dispatch_time(0, 300000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __158__PKMockPeerPaymentController_quoteWithAmount_source_requestToken_alternateFundingSource_recurringPaymentIdentifier_frequency_startDate_threshold_completion___block_invoke;
    block[3] = &unk_1E56D8BF8;
    block[4] = self;
    id v46 = v15;
    id v47 = v16;
    id v48 = v21;
    v49 = v24;
    id v50 = v19;
    dispatch_after(v40, MEMORY[0x1E4F14428], block);

    goto LABEL_18;
  }
  id v42 = v18;
  id v34 = v17;
  v35 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v52 = self;
    _os_log_impl(&dword_190E10000, v35, OS_LOG_TYPE_DEFAULT, "PKMockPeerPaymentController %p: Failed to quote requiring alternative funding source as no suitable payment cards were found.", buf, 0xCu);
  }

  v36 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"PKPeerPaymentWebServiceErrorDomain" code:v25 userInfo:0];
  v37 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentNoC.isa, 0);
  v38 = PKLocalizedPeerPaymentString(&cfstr_PeerPaymentNoC_0.isa, 0);
  v39 = PKDisplayableErrorCustomWithType(-1, v37, v38, v36, 0);

  (*((void (**)(id, void, void, void *))v19 + 2))(v19, 0, 0, v39);
  id v17 = v34;
  id v18 = v42;
LABEL_18:
}

void __158__PKMockPeerPaymentController_quoteWithAmount_source_requestToken_alternateFundingSource_recurringPaymentIdentifier_frequency_startDate_threshold_completion___block_invoke(uint64_t a1)
{
  v83[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) mode];
  v3 = *(void **)(a1 + 32);
  unint64_t v4 = 0x1E4F28000uLL;
  uint64_t v71 = a1;
  if (v2 == 5)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    v7 = [*(id *)(a1 + 56) loadFromCardFeatureDescriptor];
    uint64_t v8 = [v3 _quoteItemDictionaryWithType:1 amount:v5 alternateFundingSource:v6 featureDescriptor:v7];
    v83[0] = v8;
    id v9 = (void *)MEMORY[0x1E4F1C978];
    id v10 = (PKCurrencyAmount **)v83;
  }
  else
  {
    if ([v3 mode] != 1)
    {
      v20 = 0;
      goto LABEL_11;
    }
    dispatch_time_t v11 = [*(id *)(a1 + 64) amount];
    [MEMORY[0x1E4F28C28] zero];
    v13 = uint64_t v12 = a1;
    uint64_t v14 = [v11 compare:v13];

    if (v14 == 1)
    {
      id v15 = [*(id *)(v12 + 64) amount];
      id v16 = [*(id *)(v12 + 40) amount];
      uint64_t v17 = [v15 compare:v16];

      id v18 = *(void **)(v12 + 40);
      if (v17 == -1)
      {
        id v51 = *(id *)(v12 + 64);
        v52 = [v18 amount];
        uint64_t v53 = [v51 amount];
        [v52 decimalNumberBySubtracting:v53];
        v7 = uint64_t v54 = v12;

        v55 = [PKCurrencyAmount alloc];
        v56 = [*(id *)(v12 + 40) currency];
        uint64_t v8 = [(PKCurrencyAmount *)v55 initWithAmount:v7 currency:v56 exponent:0];

        v57 = *(void **)(v54 + 32);
        v58 = [*(id *)(v54 + 56) sendToUserFeatureDescriptor];
        v59 = [v57 _quoteItemDictionaryWithType:2 amount:v51 alternateFundingSource:0 featureDescriptor:v58];
        v81[0] = v59;
        v60 = *(void **)(v54 + 32);
        uint64_t v61 = *(void *)(v54 + 48);
        v62 = [*(id *)(v54 + 56) sendToUserFeatureDescriptor];
        v63 = [v60 _quoteItemDictionaryWithType:1 amount:v8 alternateFundingSource:v61 featureDescriptor:v62];
        v81[1] = v63;
        v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:2];

        unint64_t v4 = 0x1E4F28000uLL;
        goto LABEL_10;
      }
      id v19 = *(void **)(v12 + 32);
      v7 = [*(id *)(v12 + 56) sendToUserFeatureDescriptor];
      uint64_t v8 = [v19 _quoteItemDictionaryWithType:2 amount:v18 alternateFundingSource:0 featureDescriptor:v7];
      v80 = v8;
      id v9 = (void *)MEMORY[0x1E4F1C978];
      id v10 = &v80;
    }
    else
    {
      v21 = *(void **)(v12 + 32);
      uint64_t v22 = *(void *)(v12 + 40);
      uint64_t v23 = *(void *)(v12 + 48);
      v7 = [*(id *)(v12 + 56) sendToUserFeatureDescriptor];
      uint64_t v8 = [v21 _quoteItemDictionaryWithType:1 amount:v22 alternateFundingSource:v23 featureDescriptor:v7];
      v82 = v8;
      id v9 = (void *)MEMORY[0x1E4F1C978];
      id v10 = &v82;
    }
  }
  v20 = [v9 arrayWithObjects:v10 count:1];
LABEL_10:

LABEL_11:
  v24 = [MEMORY[0x1E4F28C28] zero];
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id obj = v20;
  uint64_t v25 = [obj countByEnumeratingWithState:&v73 objects:v79 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v74;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v74 != v27) {
          objc_enumerationMutation(obj);
        }
        v29 = [*(id *)(*((void *)&v73 + 1) + 8 * i) objectForKeyedSubscript:@"fees"];
        if (v29)
        {
          v30 = [*(id *)(v4 + 3112) decimalNumberWithString:v29];
          if (v30)
          {
            unint64_t v31 = v4;
            BOOL v32 = [*(id *)(v4 + 3112) notANumber];
            char v33 = [v30 isEqualToNumber:v32];

            if ((v33 & 1) == 0)
            {
              uint64_t v34 = [v24 decimalNumberByAdding:v30];

              v24 = (void *)v34;
            }
            unint64_t v4 = v31;
          }
        }
        else
        {
          v30 = 0;
        }
      }
      uint64_t v26 = [obj countByEnumeratingWithState:&v73 objects:v79 count:16];
    }
    while (v26);
  }

  v35 = [*(id *)(v71 + 64) amount];
  uint64_t v36 = [v35 stringValue];

  v77[0] = @"quoteIdentifier";
  v77[1] = @"requiresIdentityVerification";
  v78[0] = @"quoteIdentifier";
  v78[1] = MEMORY[0x1E4F1CC28];
  v77[2] = @"validUntil";
  v69 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:500.0];
  v70 = (void *)v36;
  v78[2] = v69;
  v78[3] = @"disclosureText";
  v77[3] = @"disclosureText";
  v77[4] = @"disclosureURL";
  v78[4] = @"disclosureURL";
  v78[5] = v36;
  v77[5] = @"currentBalance";
  v77[6] = @"currentBalanceCurrency";
  v68 = [*(id *)(v71 + 64) currency];
  v78[6] = v68;
  v77[7] = @"totalFees";
  v67 = [v24 stringValue];
  v78[7] = v67;
  v77[8] = @"totalFeesCurrency";
  v66 = [*(id *)(v71 + 40) currency];
  v78[8] = v66;
  v77[9] = @"totalReceiveAmount";
  v65 = [*(id *)(v71 + 40) amount];
  v64 = [v65 stringValue];
  v78[9] = v64;
  v77[10] = @"totalReceiveAmountCurrency";
  v37 = [*(id *)(v71 + 40) currency];
  v78[10] = v37;
  v77[11] = @"appleHash";
  v38 = objc_msgSend(@"1234567890ABCDEF", "pk_decodeHexadecimal");
  v39 = [v38 SHA256Hash];
  dispatch_time_t v40 = [v39 hexEncoding];
  v78[11] = v40;
  v77[12] = @"externalHash";
  v41 = objc_msgSend(@"1234567890ABCDEF", "pk_decodeHexadecimal");
  id v42 = [v41 SHA256Hash];
  uint64_t v43 = [v42 hexEncoding];
  id v44 = (void *)v43;
  v77[13] = @"quoteItems";
  id v45 = (id)MEMORY[0x1E4F1CBF0];
  if (obj) {
    id v45 = obj;
  }
  v78[12] = v43;
  v78[13] = v45;
  id v46 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v78 forKeys:v77 count:14];

  id v47 = [[PKPeerPaymentQuote alloc] initWithDictionary:v46];
  id v48 = [*(id *)(v71 + 32) valueForKey:@"recipient"];
  [(PKPeerPaymentQuote *)v47 setRecipient:v48];

  v49 = [*(id *)(v71 + 32) internalState];
  objc_storeStrong(v49 + 8, v47);

  [*(id *)(v71 + 32) _setState:4 notify:1];
  uint64_t v50 = *(void *)(v71 + 72);
  if (v50) {
    (*(void (**)(uint64_t, uint64_t, PKPeerPaymentQuote *, void))(v50 + 16))(v50, 1, v47, 0);
  }
}

- (void)formalRequestTokenForAmount:(id)a3 source:(unint64_t)a4 completion:(id)a5
{
  id v6 = a5;
  if ([(PKPeerPaymentController *)self _ensureState:6])
  {
    dispatch_time_t v7 = dispatch_time(0, 300000000);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __77__PKMockPeerPaymentController_formalRequestTokenForAmount_source_completion___block_invoke;
    v8[3] = &unk_1E56D83D8;
    v8[4] = self;
    id v9 = v6;
    dispatch_after(v7, MEMORY[0x1E4F14428], v8);
  }
}

void __77__PKMockPeerPaymentController_formalRequestTokenForAmount_source_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [PKPeerPaymentRequestToken alloc];
  v3 = [MEMORY[0x1E4F29128] UUID];
  unint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v5 = [(PKPeerPaymentRequestToken *)v2 initWithRequestToken:@"aaaaaffff" deviceScoreIdentifier:v3 expiryDate:v4];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v6 = [*(id *)(a1 + 32) internalState];
  dispatch_time_t v7 = (void *)v6[7];
  v6[7] = v5;
  uint64_t v8 = v5;

  [*(id *)(a1 + 32) _setState:7 notify:1];
}

- (void)paymentAuthorizationCoordinator:(id *)a3 didAuthorizePeerPaymentQuote:(id)a4 handler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  dispatch_time_t v9 = dispatch_time(0, 300000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__PKMockPeerPaymentController_paymentAuthorizationCoordinator_didAuthorizePeerPaymentQuote_handler___block_invoke;
  block[3] = &unk_1E56D89F0;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_after(v9, MEMORY[0x1E4F14428], block);
}

void __100__PKMockPeerPaymentController_paymentAuthorizationCoordinator_didAuthorizePeerPaymentQuote_handler___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_alloc_init(PKPaymentAuthorizationResult);
  [(PKPaymentAuthorizationResult *)v2 setStatus:0];
  uint64_t v3 = [*(id *)(a1 + 32) mode];
  unint64_t v4 = *(unsigned char **)(a1 + 32);
  if (v3 == 1 && v4[152])
  {
    [v4 _adjustBalanceForAuthorizedTransferQuote:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) _insertPeerPaymentTransactionForAuthroizedTransferQuote:*(void *)(a1 + 40)];
    unint64_t v4 = *(unsigned char **)(a1 + 32);
  }
  [v4 _setPerformQuoteSuccess:1];
  uint64_t v5 = objc_alloc_init(PKPeerPaymentPerformResponse);
  id v6 = [*(id *)(a1 + 32) internalState];
  id v7 = (void *)v6[10];
  v6[10] = v5;
  id v8 = v5;

  dispatch_time_t v9 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "PKMockPeerPaymentController: Perform quote succeeded. Returning: PKPaymentAuthorizationStatusSuccess to the authorization controller.", v10, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_adjustBalanceForAuthorizedTransferQuote:(id)a3
{
  id v11 = [a3 peerPaymentQuote];
  unint64_t v4 = [v11 firstQuoteItemOfType:2];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 totalAmount];
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F28C28]) initWithMantissa:1 exponent:0 isNegative:1];
    id v8 = [v6 decimalNumberByMultiplyingBy:v7];
    dispatch_time_t v9 = [(PKPeerPaymentController *)self webService];
    id v10 = [v9 peerPaymentService];
    [v10 updateMockAccountBalanceByAddingAmount:v8 completion:0];
  }
}

- (void)_insertPeerPaymentTransactionForAuthroizedTransferQuote:(id)a3
{
  id v33 = a3;
  uint64_t v3 = +[PKPassLibrary sharedInstance];
  unint64_t v4 = [v3 peerPaymentPassUniqueID];
  uint64_t v5 = [v3 passWithUniqueID:v4];
  id v6 = [v5 paymentPass];

  if (v6)
  {
    id v7 = [v33 peerPaymentQuote];
    id v8 = [v7 firstQuoteItemOfType:2];
    dispatch_time_t v9 = [v7 firstQuoteItemOfType:1];
    uint64_t v10 = [v9 dpanIdentifier];
    BOOL v32 = (void *)v10;
    if (v10)
    {
      id v11 = [v3 passWithDPANIdentifier:v10];
    }
    else
    {
      id v11 = 0;
    }
    unint64_t v31 = [v11 devicePrimaryInAppPaymentApplication];
    uint64_t v12 = objc_alloc_init(PKPaymentTransaction);
    id v13 = [v7 totalReceiveAmount];
    [(PKPaymentTransaction *)v12 setAmount:v13];

    id v14 = [v7 totalReceiveAmountCurrency];
    [(PKPaymentTransaction *)v12 setCurrencyCode:v14];

    [(PKPaymentTransaction *)v12 setTransactionType:3];
    [(PKPaymentTransaction *)v12 setPeerPaymentType:1];
    id v15 = [v7 recipient];
    id v16 = [v15 phoneOrEmail];
    [(PKPaymentTransaction *)v12 setPeerPaymentCounterpartHandle:v16];

    v30 = v8;
    if (v8)
    {
      uint64_t v17 = [v8 totalAmount];
      [(PKPaymentTransaction *)v12 setPrimaryFundingSourceAmount:v17];

      [v8 totalAmountCurrency];
    }
    else
    {
      id v18 = [MEMORY[0x1E4F28C28] zero];
      [(PKPaymentTransaction *)v12 setPrimaryFundingSourceAmount:v18];

      [v7 totalReceiveAmountCurrency];
    id v19 = };
    [(PKPaymentTransaction *)v12 setPrimaryFundingSourceCurrencyCode:v19];

    v20 = [v9 totalAmount];
    [(PKPaymentTransaction *)v12 setSecondaryFundingSourceAmount:v20];

    v21 = [v9 totalAmountCurrency];
    [(PKPaymentTransaction *)v12 setSecondaryFundingSourceCurrencyCode:v21];

    -[PKPaymentTransaction setSecondaryFundingSourceNetwork:](v12, "setSecondaryFundingSourceNetwork:", [v31 paymentNetworkIdentifier]);
    uint64_t v22 = [v11 deviceAccountNumberSuffix];
    [(PKPaymentTransaction *)v12 setSecondaryFundingSourceDPANSuffix:v22];

    uint64_t v23 = [v11 localizedDescription];
    [(PKPaymentTransaction *)v12 setSecondaryFundingSourceDescription:v23];

    v24 = [MEMORY[0x1E4F1C9C8] date];
    [(PKPaymentTransaction *)v12 setTransactionDate:v24];

    [(PKPaymentTransaction *)v12 setTransactionSource:2];
    [(PKPaymentTransaction *)v12 setHasNotificationServiceData:1];
    [(PKPaymentTransaction *)v12 setProcessedForLocation:1];
    [(PKPaymentTransaction *)v12 setProcessedForMerchantCleanup:1];
    [(PKPaymentTransaction *)v12 setPeerPaymentStatus:1];
    uint64_t v25 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v26 = [v25 UUIDString];
    [(PKPaymentTransaction *)v12 setServiceIdentifier:v26];

    uint64_t v27 = objc_alloc_init(PKPaymentService);
    id v28 = [v6 uniqueID];
    v29 = [v6 devicePrimaryInAppPaymentApplication];
    [(PKPaymentService *)v27 insertOrUpdatePaymentTransaction:v12 forPassUniqueIdentifier:v28 paymentApplication:v29 completion:0];
  }
}

- (void)_insertPaymentTransactionForSecondaryFundingSourceIfNecessary:(id)a3
{
  id v19 = [a3 peerPaymentQuote];
  uint64_t v3 = [v19 firstQuoteItemOfType:1];
  unint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 totalAmount];
    id v6 = [MEMORY[0x1E4F28C28] zero];
    uint64_t v7 = [v5 compare:v6];

    if (v7 == 1)
    {
      id v8 = [v4 dpanIdentifier];
      if (v8)
      {
        dispatch_time_t v9 = +[PKPassLibrary sharedInstance];
        uint64_t v10 = [v9 passWithDPANIdentifier:v8];
      }
      else
      {
        uint64_t v10 = 0;
      }
      id v11 = objc_alloc_init(PKPaymentTransaction);
      uint64_t v12 = [v4 totalAmount];
      [(PKPaymentTransaction *)v11 setAmount:v12];

      id v13 = [v4 totalAmountCurrency];
      [(PKPaymentTransaction *)v11 setCurrencyCode:v13];

      [(PKPaymentTransaction *)v11 setTransactionType:0];
      id v14 = objc_alloc_init(PKMerchant);
      [(PKMerchant *)v14 setRawName:@"Apple, Inc."];
      [(PKMerchant *)v14 setName:@"Apple, Inc."];
      [(PKPaymentTransaction *)v11 setMerchant:v14];
      id v15 = [MEMORY[0x1E4F1C9C8] date];
      [(PKPaymentTransaction *)v11 setTransactionDate:v15];

      [(PKPaymentTransaction *)v11 setTransactionSource:2];
      [(PKPaymentTransaction *)v11 setHasNotificationServiceData:1];
      [(PKPaymentTransaction *)v11 setProcessedForLocation:1];
      [(PKPaymentTransaction *)v11 setProcessedForMerchantCleanup:1];
      [(PKPaymentTransaction *)v11 setPeerPaymentStatus:1];
      id v16 = objc_alloc_init(PKPaymentService);
      uint64_t v17 = [v10 uniqueID];
      id v18 = [v10 devicePrimaryInAppPaymentApplication];
      [(PKPaymentService *)v16 insertOrUpdatePaymentTransaction:v11 forPassUniqueIdentifier:v17 paymentApplication:v18 completion:0];
    }
  }
}

- (void)paymentAuthorizationCoordinator:(id *)a3 didSelectPaymentMethod:(id)a4 handler:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = [a4 paymentPass];
  dispatch_time_t v9 = [v8 devicePrimaryInAppPaymentApplication];
  uint64_t v10 = [v9 dpanIdentifier];

  id v11 = [(PKPeerPaymentController *)self quote];
  uint64_t v12 = [v11 firstQuoteItemOfType:1];
  id v13 = [v12 dpanIdentifier];
  id v14 = v13;
  if (v10 && ([v13 isEqualToString:v10] & 1) == 0)
  {
    id v16 = [v11 totalReceiveAmount];
    v20 = [v11 totalReceiveAmountCurrency];
    id v19 = [[PKCurrencyAmount alloc] initWithAmount:v16 currency:v20 exponent:0];
    uint64_t v17 = [(PKPeerPaymentController *)self internalState];
    id v18 = v17[7];

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __94__PKMockPeerPaymentController_paymentAuthorizationCoordinator_didSelectPaymentMethod_handler___block_invoke;
    v21[3] = &unk_1E56E1300;
    v21[4] = self;
    id v22 = v7;
    [(PKPeerPaymentController *)self quoteWithAmount:v19 requestToken:v18 alternateFundingSource:v8 completion:v21];
  }
  else
  {
    id v15 = PKLogFacilityTypeGetObject(0xBuLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v24 = self;
      _os_log_impl(&dword_190E10000, v15, OS_LOG_TYPE_DEFAULT, "PKMockPeerPaymentController %p: New quote request is not required. Returning: PKPaymentAuthorizationStatusSuccess to the authorization controller.", buf, 0xCu);
    }

    id v16 = objc_alloc_init(PKPaymentRequestPaymentMethodUpdate);
    [(PKPaymentRequestUpdate *)v16 setStatus:0];
    (*((void (**)(id, PKPaymentRequestPaymentMethodUpdate *))v7 + 2))(v7, v16);
  }
}

void __94__PKMockPeerPaymentController_paymentAuthorizationCoordinator_didSelectPaymentMethod_handler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = objc_alloc_init(PKPaymentRequestPaymentMethodUpdate);
  [(PKPaymentRequestPaymentMethodUpdate *)v5 setPeerPaymentQuote:v4];
  id v6 = [*(id *)(a1 + 32) summaryItemsForQuote:v4];

  [(PKPaymentRequestUpdate *)v5 setPaymentSummaryItems:v6];
  [(PKPaymentRequestUpdate *)v5 setStatus:0];
  id v7 = PKLogFacilityTypeGetObject(0xBuLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "PKMockPeerPaymentController: Get updated quote succeeded. Returning: PKPaymentAuthorizationStatusSuccess to the authorization controller.", v8, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)performAction:(id)a3 withPaymentIdentifier:(id)a4 completion:(id)a5
{
  id v5 = a5;
  dispatch_time_t v6 = dispatch_time(0, 800000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__PKMockPeerPaymentController_performAction_withPaymentIdentifier_completion___block_invoke;
  block[3] = &unk_1E56D8360;
  id v9 = v5;
  id v7 = v5;
  dispatch_after(v6, MEMORY[0x1E4F14428], block);
}

uint64_t __78__PKMockPeerPaymentController_performAction_withPaymentIdentifier_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, void))(result + 16))(result, 1, 1, 0);
  }
  return result;
}

- (PKCurrencyAmount)mockBalance
{
  return self->_mockBalance;
}

- (void)setMockBalance:(id)a3
{
}

- (BOOL)shouldGenerateMockTransactions
{
  return self->_shouldGenerateMockTransactions;
}

- (void)setShouldGenerateMockTransactions:(BOOL)a3
{
  self->_shouldGenerateMockTransactions = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mockBalance, 0);
  objc_storeStrong(&self->_performCompletion, 0);
}

@end