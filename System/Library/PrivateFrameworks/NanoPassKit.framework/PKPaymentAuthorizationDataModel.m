@interface PKPaymentAuthorizationDataModel
@end

@implementation PKPaymentAuthorizationDataModel

void __86__PKPaymentAuthorizationDataModel_NanoPassKit__npkSetPassAndPaymentApplicationForAID___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  v7 = [v6 deviceInAppPaymentApplications];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __86__PKPaymentAuthorizationDataModel_NanoPassKit__npkSetPassAndPaymentApplicationForAID___block_invoke_2;
  v9[3] = &unk_2644D4430;
  id v10 = *(id *)(a1 + 32);
  id v11 = v6;
  long long v12 = *(_OWORD *)(a1 + 40);
  uint64_t v13 = a4;
  id v8 = v6;
  [v7 enumerateObjectsUsingBlock:v9];
}

void __86__PKPaymentAuthorizationDataModel_NanoPassKit__npkSetPassAndPaymentApplicationForAID___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  v5 = [a2 applicationIdentifier];
  int v6 = [v5 isEqualToString:*(void *)(a1 + 32)];

  if (v6)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(a1 + 40));
    uint64_t v7 = [*(id *)(a1 + 40) devicePrimaryInAppPaymentApplication];
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    *a3 = 1;
    **(unsigned char **)(a1 + 64) = 1;
  }
}

uint64_t __80__PKPaymentAuthorizationDataModel_NanoPassKit___hasNonPeerPaymentAcceptedPasses__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isPeerPaymentPass] ^ 1;
}

@end