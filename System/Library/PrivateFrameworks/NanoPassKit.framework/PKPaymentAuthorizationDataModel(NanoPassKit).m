@interface PKPaymentAuthorizationDataModel(NanoPassKit)
- (BOOL)_hasNonPeerPaymentAcceptedPasses;
- (BOOL)npkIsCardOnFilePayment;
- (BOOL)npkIsCompanionAuthForTvOS;
- (BOOL)npkIsExternalContextAuthorization;
- (BOOL)npkIsOutgoingPeerPayment;
- (BOOL)npkIsPeerPayment;
- (BOOL)npkIsSkeletonPeerPayment;
- (BOOL)npkIsSplitPeerPayment;
- (BOOL)npkIsTopUp;
- (uint64_t)npkIsNearbyPeerPayment;
- (uint64_t)npkIsSplitPeerPaymentWithAnotherPaymentMethod;
- (uint64_t)npkIsSplitPeerPaymentWithoutAnotherPaymentMethod;
- (void)npkSetPassAndPaymentApplicationForAID:()NanoPassKit;
@end

@implementation PKPaymentAuthorizationDataModel(NanoPassKit)

- (void)npkSetPassAndPaymentApplicationForAID:()NanoPassKit
{
  id v4 = a3;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__6;
  v24 = __Block_byref_object_dispose__6;
  id v25 = 0;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__6;
  v18 = __Block_byref_object_dispose__6;
  id v19 = 0;
  v5 = [a1 acceptedPasses];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __86__PKPaymentAuthorizationDataModel_NanoPassKit__npkSetPassAndPaymentApplicationForAID___block_invoke;
  v10[3] = &unk_2644D4458;
  id v6 = v4;
  id v11 = v6;
  v12 = &v20;
  v13 = &v14;
  [v5 enumerateObjectsUsingBlock:v10];

  [a1 beginUpdates];
  if ([(id)v21[5] isPeerPaymentPass])
  {
    v7 = NPKSharedPeerPaymentAccountManager();
    v8 = [v7 account];
    v9 = [v8 currentBalance];
    [(id)v21[5] setPeerPaymentBalance:v9];
  }
  [a1 setPass:v21[5]];
  [a1 setPaymentApplication:v15[5]];
  [a1 endUpdates];

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
}

- (BOOL)npkIsPeerPayment
{
  v1 = [a1 peerPaymentQuote];
  BOOL v2 = v1 != 0;

  return v2;
}

- (uint64_t)npkIsNearbyPeerPayment
{
  v1 = [a1 paymentRequest];
  BOOL v2 = [v1 peerPaymentRequest];

  if (v2) {
    uint64_t v3 = [v2 hasUndeterminedRecipient];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (BOOL)npkIsSkeletonPeerPayment
{
  if (![a1 npkIsPeerPayment]) {
    return 0;
  }
  BOOL v2 = [a1 paymentRequest];
  uint64_t v3 = [v2 paymentSummaryItems];
  id v4 = [v3 lastObject];
  BOOL v5 = [v4 type] == 1;

  return v5;
}

- (BOOL)npkIsTopUp
{
  BOOL v2 = [a1 peerPaymentQuote];
  uint64_t v3 = [v2 firstQuoteItemOfType:1];
  if (v3)
  {
    id v4 = [a1 peerPaymentQuote];
    BOOL v5 = [v4 firstQuoteItemOfType:2];
    BOOL v6 = v5 == 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)npkIsSplitPeerPayment
{
  BOOL v2 = [a1 peerPaymentQuote];
  uint64_t v3 = [v2 firstQuoteItemOfType:1];
  if (v3)
  {
    id v4 = [a1 peerPaymentQuote];
    BOOL v5 = [v4 firstQuoteItemOfType:2];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (uint64_t)npkIsSplitPeerPaymentWithAnotherPaymentMethod
{
  uint64_t result = [a1 npkIsSplitPeerPayment];
  if (result)
  {
    return [a1 _hasNonPeerPaymentAcceptedPasses];
  }
  return result;
}

- (uint64_t)npkIsSplitPeerPaymentWithoutAnotherPaymentMethod
{
  uint64_t result = [a1 npkIsSplitPeerPayment];
  if (result) {
    return [a1 _hasNonPeerPaymentAcceptedPasses] ^ 1;
  }
  return result;
}

- (BOOL)_hasNonPeerPaymentAcceptedPasses
{
  v1 = [a1 acceptedPasses];
  BOOL v2 = [v1 npkFindFirstObjectMatchingCondition:&__block_literal_global_9];

  return v2 != 0;
}

- (BOOL)npkIsOutgoingPeerPayment
{
  if (![a1 npkIsPeerPayment]) {
    return 0;
  }
  BOOL v2 = [a1 peerPaymentQuote];
  uint64_t v3 = [v2 recipient];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)npkIsCardOnFilePayment
{
  v1 = [a1 paymentRequest];
  BOOL v2 = [v1 requestType] == 1;

  return v2;
}

- (BOOL)npkIsExternalContextAuthorization
{
  v1 = [a1 paymentRequest];
  BOOL v2 = [v1 requestType] == 7;

  return v2;
}

- (BOOL)npkIsCompanionAuthForTvOS
{
  v1 = [a1 paymentRequest];
  BOOL v2 = [v1 requestorDeviceType] == 1;

  return v2;
}

@end