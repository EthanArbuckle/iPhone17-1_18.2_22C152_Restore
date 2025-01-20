@interface PKPassDeleteHelper
+ (BOOL)_canDeletePaymentPass:(id)a3 transitPassProperties:(id)a4;
+ (BOOL)hasAppleCashMerchantTokenForMerchantTokensResponse:(id)a3;
+ (BOOL)hasPositiveBalanceForTransitPassProperties:(id)a3 transitBalanceModel:(id)a4;
+ (void)deletePaymentPass:(id)a3 withDeleteHander:(id)a4 passLibraryDataProvider:(id)a5 presentingViewController:(id)a6;
+ (void)deletePaymentPassAlertCopyForPass:(id)a3 webService:(id)a4 paymentServiceDataProvider:(id)a5 isBridge:(BOOL)a6 completion:(id)a7;
+ (void)deletePaymentPassAlertCopyForPass:(id)a3 withAccount:(id)a4 paymentServiceDataProvider:(id)a5 transitBalanceModel:(id)a6 transitPassProperties:(id)a7 merchantTokensResponse:(id)a8 fkInstitution:(id)a9 isBridge:(BOOL)a10 completion:(id)a11;
+ (void)presentDeleteBarcodePassAlertForPass:(id)a3 withHandler:(id)a4 presentingViewController:(id)a5;
+ (void)presentDeletePaymentPassAlertForPass:(id)a3 withAccount:(id)a4 paymentServiceDataProvider:(id)a5 transitBalanceModel:(id)a6 transitPassProperties:(id)a7 fkInstitution:(id)a8 detailViewStyle:(int64_t)a9 deleteHander:(id)a10 passLibraryDataProvider:(id)a11 presentingViewController:(id)a12;
+ (void)presentMerchantTokenDeletePaymentPassAlertForPass:(id)a3 withAccount:(id)a4 merchantTokensResponse:(id)a5 deleteHander:(id)a6 passLibraryDataProvider:(id)a7 navigationController:(id)a8 presentingViewController:(id)a9 isBridge:(BOOL)a10;
@end

@implementation PKPassDeleteHelper

+ (void)presentDeleteBarcodePassAlertForPass:(id)a3 withHandler:(id)a4 presentingViewController:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (PKStoreDemoModeEnabled())
  {
    v10 = (void *)MEMORY[0x1E4FB1418];
    v11 = PKLocalizedString(&cfstr_RemoveSheetDem.isa);
    v12 = [v10 alertControllerWithTitle:v11 message:0 preferredStyle:1];

    v13 = (void *)MEMORY[0x1E4FB1410];
    v14 = PKLocalizedString(&cfstr_RemoveSheetDem_0.isa);
    v15 = [v13 actionWithTitle:v14 style:1 handler:0];
    [v12 addAction:v15];

    [v9 presentViewController:v12 animated:1 completion:0];
  }
  else
  {
    v12 = PKLocalizedString(&cfstr_RemoveSheetTit.isa);
    v16 = PKLocalizedString(&cfstr_RemoveSheetCan.isa);
    v17 = PKLocalizedString(&cfstr_RemoveSheetCon.isa);
    v18 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v12 message:0 preferredStyle:0];
    v19 = [MEMORY[0x1E4FB1410] actionWithTitle:v16 style:1 handler:0];
    [v18 addAction:v19];

    v20 = (void *)MEMORY[0x1E4FB1410];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __96__PKPassDeleteHelper_presentDeleteBarcodePassAlertForPass_withHandler_presentingViewController___block_invoke;
    v23[3] = &unk_1E59CAC80;
    id v24 = v8;
    id v25 = v7;
    id v21 = v9;
    id v26 = v21;
    v22 = [v20 actionWithTitle:v17 style:2 handler:v23];
    [v18 addAction:v22];

    [v21 presentViewController:v18 animated:1 completion:0];
  }
}

void *__96__PKPassDeleteHelper_presentDeleteBarcodePassAlertForPass_withHandler_presentingViewController___block_invoke(void *a1)
{
  result = (void *)a1[4];
  if (result) {
    return (void *)[result handleDeletePassRequestWithPass:a1[5] forViewController:a1[6]];
  }
  return result;
}

+ (void)deletePaymentPassAlertCopyForPass:(id)a3 webService:(id)a4 paymentServiceDataProvider:(id)a5 isBridge:(BOOL)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = objc_alloc_init(MEMORY[0x1E4F84518]);
  v78[0] = 0;
  v78[1] = v78;
  v78[2] = 0x3032000000;
  v78[3] = __Block_byref_object_copy__1;
  v78[4] = __Block_byref_object_dispose__1;
  id v79 = 0;
  v76[0] = 0;
  v76[1] = v76;
  v76[2] = 0x3032000000;
  v76[3] = __Block_byref_object_copy__1;
  v76[4] = __Block_byref_object_dispose__1;
  id v77 = 0;
  v74[0] = 0;
  v74[1] = v74;
  v74[2] = 0x3032000000;
  v74[3] = __Block_byref_object_copy__1;
  v74[4] = __Block_byref_object_dispose__1;
  id v75 = 0;
  v72[0] = 0;
  v72[1] = v72;
  v72[2] = 0x3032000000;
  v72[3] = __Block_byref_object_copy__1;
  v72[4] = __Block_byref_object_dispose__1;
  id v73 = 0;
  v70[0] = 0;
  v70[1] = v70;
  v70[2] = 0x3032000000;
  v70[3] = __Block_byref_object_copy__1;
  v70[4] = __Block_byref_object_dispose__1;
  id v71 = 0;
  v68[0] = 0;
  v68[1] = v68;
  v68[2] = 0x3032000000;
  v68[3] = __Block_byref_object_copy__1;
  v68[4] = __Block_byref_object_dispose__1;
  id v69 = 0;
  v64[0] = MEMORY[0x1E4F143A8];
  v64[1] = 3221225472;
  v64[2] = __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke;
  v64[3] = &unk_1E59CC7D8;
  id v17 = v12;
  id v65 = v17;
  id v18 = v13;
  id v66 = v18;
  v67 = v78;
  [v16 addOperation:v64];
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_3;
  v60[3] = &unk_1E59CC7D8;
  id v19 = v14;
  id v61 = v19;
  id v20 = v17;
  id v62 = v20;
  v63 = v76;
  [v16 addOperation:v60];
  v56[0] = MEMORY[0x1E4F143A8];
  v56[1] = 3221225472;
  v56[2] = __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_5;
  v56[3] = &unk_1E59CC7D8;
  id v21 = v19;
  id v57 = v21;
  id v22 = v20;
  id v58 = v22;
  v59 = v70;
  [v16 addOperation:v56];
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_7;
  v52[3] = &unk_1E59CC7D8;
  id v23 = v21;
  id v53 = v23;
  id v24 = v22;
  id v54 = v24;
  v55 = v68;
  [v16 addOperation:v52];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_9;
  v47[3] = &unk_1E59CC878;
  id v25 = v24;
  id v48 = v25;
  v49 = v68;
  v50 = v70;
  v51 = v74;
  [v16 addOperation:v47];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_10;
  v43[3] = &unk_1E59CC7D8;
  id v26 = v25;
  id v44 = v26;
  id v27 = v18;
  id v45 = v27;
  v46 = v72;
  [v16 addOperation:v43];
  v28 = [MEMORY[0x1E4F1CA98] null];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_12;
  v33[3] = &unk_1E59CC8F0;
  id v41 = a1;
  id v29 = v26;
  id v34 = v29;
  v37 = v78;
  id v30 = v23;
  id v35 = v30;
  v38 = v74;
  v39 = v76;
  v40 = v72;
  BOOL v42 = a6;
  id v31 = v15;
  id v36 = v31;
  id v32 = (id)[v16 evaluateWithInput:v28 completion:v33];

  _Block_object_dispose(v68, 8);
  _Block_object_dispose(v70, 8);

  _Block_object_dispose(v72, 8);
  _Block_object_dispose(v74, 8);

  _Block_object_dispose(v76, 8);
  _Block_object_dispose(v78, 8);
}

void __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [*(id *)(a1 + 32) associatedAccountServiceAccountIdentifier];
  if (v8)
  {
    id v9 = [*(id *)(a1 + 40) targetDevice];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_2;
    v10[3] = &unk_1E59CC7B0;
    uint64_t v13 = *(void *)(a1 + 48);
    id v12 = v7;
    id v11 = v6;
    [v9 accountWithIdentifier:v8 completion:v10];
  }
  else
  {
    (*((void (**)(id, id, void))v7 + 2))(v7, v6, 0);
  }
}

void __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_2(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    id v8 = [*(id *)(a1 + 40) devicePrimaryPaymentApplication];
    id v9 = *(void **)(a1 + 32);
    v10 = [*(id *)(a1 + 40) uniqueID];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_4;
    v13[3] = &unk_1E59CC800;
    id v11 = *(void **)(a1 + 40);
    uint64_t v18 = *(void *)(a1 + 48);
    id v14 = v8;
    id v15 = v11;
    id v17 = v7;
    id v16 = v6;
    id v12 = v8;
    [v9 transitStateWithPassUniqueIdentifier:v10 paymentApplication:v12 completion:v13];
  }
  else
  {
    (*((void (**)(id, id, void))v7 + 2))(v7, v6, 0);
  }
}

uint64_t __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_4(void *a1, void *a2)
{
  uint64_t v3 = [a2 transitPassPropertiesWithPaymentApplication:a1[4] pass:a1[5]];
  uint64_t v4 = *(void *)(a1[8] + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = *(uint64_t (**)(void))(a1[7] + 16);

  return v6();
}

void __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_5(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    id v8 = *(void **)(a1 + 32);
    id v9 = [*(id *)(a1 + 40) uniqueID];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_6;
    v10[3] = &unk_1E59CC828;
    uint64_t v13 = *(void *)(a1 + 48);
    id v12 = v7;
    id v11 = v6;
    [v8 balancesForPaymentPassWithUniqueIdentifier:v9 completion:v10];
  }
  else
  {
    (*((void (**)(id, id, void))v7 + 2))(v7, v6, 0);
  }
}

void __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_6(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_7(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  if (objc_opt_respondsToSelector())
  {
    id v8 = *(void **)(a1 + 32);
    id v9 = [*(id *)(a1 + 40) uniqueID];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_8;
    v10[3] = &unk_1E59CC850;
    uint64_t v13 = *(void *)(a1 + 48);
    id v12 = v7;
    id v11 = v6;
    [v8 plansForPaymentPassWithUniqueIdentifier:v9 completion:v10];
  }
  else
  {
    (*((void (**)(id, id, void))v7 + 2))(v7, v6, 0);
  }
}

void __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_8(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_9(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v10 = a3;
  id v6 = a4;
  if ([*(id *)(a1 + 32) isStoredValuePass]
    && ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count]
     || [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count]))
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x1E4F850D0]) initWithPass:*(void *)(a1 + 32)];
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setDynamicBalances:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
    [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) updateWithDynamicCommutePlans:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  }
  v6[2](v6, v10, 0);
}

void __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_10(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  if ([*(id *)(a1 + 32) hasMerchantTokens])
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F84F40]);
    [v8 setPass:*(void *)(a1 + 32)];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_11;
    v10[3] = &unk_1E59CC8A0;
    id v9 = *(void **)(a1 + 40);
    uint64_t v13 = *(void *)(a1 + 48);
    id v12 = v7;
    id v11 = v6;
    [v9 retrieveMerchantTokensWithRequest:v8 completion:v10];
  }
  else
  {
    (*((void (**)(id, id, void))v7 + 2))(v7, v6, 0);
  }
}

void __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_11(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v4 = a2;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_12(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_13;
  block[3] = &unk_1E59CC8C8;
  uint64_t v11 = *(void *)(a1 + 88);
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 56);
  id v5 = v2;
  uint64_t v8 = v3;
  id v6 = *(id *)(a1 + 40);
  long long v9 = *(_OWORD *)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 80);
  char v12 = *(unsigned char *)(a1 + 96);
  id v7 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __114__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_webService_paymentServiceDataProvider_isBridge_completion___block_invoke_13(uint64_t a1)
{
  LOBYTE(v2) = *(unsigned char *)(a1 + 96);
  return [*(id *)(a1 + 88) deletePaymentPassAlertCopyForPass:*(void *)(a1 + 32) withAccount:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) paymentServiceDataProvider:*(void *)(a1 + 40) transitBalanceModel:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) transitPassProperties:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) merchantTokensResponse:*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) fkInstitution:0 isBridge:v2 completion:*(void *)(a1 + 48)];
}

+ (BOOL)hasPositiveBalanceForTransitPassProperties:(id)a3 transitBalanceModel:(id)a4
{
  id v5 = a4;
  id v6 = [a3 balanceAmount];
  id v7 = [v6 amount];

  if (v7
    && ([MEMORY[0x1E4F28C28] zero],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 compare:v7],
        v8,
        v9 == -1))
  {
    char v10 = 1;
  }
  else
  {
    char v10 = [v5 hasPositiveBalance];
  }

  return v10;
}

+ (void)deletePaymentPassAlertCopyForPass:(id)a3 withAccount:(id)a4 paymentServiceDataProvider:(id)a5 transitBalanceModel:(id)a6 transitPassProperties:(id)a7 merchantTokensResponse:(id)a8 fkInstitution:(id)a9 isBridge:(BOOL)a10 completion:(id)a11
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  id v24 = a11;
  if (PKStoreDemoModeEnabled())
  {
    id v25 = PKLocalizedString(&cfstr_RemoveSheetDem.isa);
    (*((void (**)(id, void *, void, void))v24 + 2))(v24, v25, 0, 0);
LABEL_6:

    goto LABEL_7;
  }
  if (([a1 _canDeletePaymentPass:v17 transitPassProperties:v21] & 1) == 0)
  {
    id v25 = PKLocalizedPaymentString(&cfstr_CardInTransit.isa);
    v28 = PKLocalizedPaymentString(&cfstr_CardInTransitM.isa);
    (*((void (**)(id, void *, void *, void))v24 + 2))(v24, v25, v28, 0);

    goto LABEL_6;
  }
  char v30 = PKUserInterfaceIdiomSupportsLargeLayouts();
  id v29 = objc_alloc_init(MEMORY[0x1E4F84518]);
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x3032000000;
  v50[3] = __Block_byref_object_copy__1;
  v50[4] = __Block_byref_object_dispose__1;
  id v51 = 0;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x3032000000;
  v48[3] = __Block_byref_object_copy__1;
  v48[4] = __Block_byref_object_dispose__1;
  id v49 = 0;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __194__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_withAccount_paymentServiceDataProvider_transitBalanceModel_transitPassProperties_merchantTokensResponse_fkInstitution_isBridge_completion___block_invoke;
  v35[3] = &unk_1E59CC968;
  id v36 = v20;
  v43 = v50;
  id v37 = v17;
  id v44 = v48;
  id v45 = a1;
  id v38 = v21;
  id v39 = v22;
  id v40 = v18;
  char v46 = v30;
  id v41 = v19;
  BOOL v47 = a10;
  id v42 = v23;
  [v29 addOperation:v35];
  id v26 = [MEMORY[0x1E4F1CA98] null];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __194__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_withAccount_paymentServiceDataProvider_transitBalanceModel_transitPassProperties_merchantTokensResponse_fkInstitution_isBridge_completion___block_invoke_4;
  v31[3] = &unk_1E59CC9B8;
  id v32 = v24;
  v33 = v50;
  id v34 = v48;
  id v27 = (id)[v29 evaluateWithInput:v26 completion:v31];

  _Block_object_dispose(v48, 8);
  _Block_object_dispose(v50, 8);

LABEL_7:
}

void __194__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_withAccount_paymentServiceDataProvider_transitBalanceModel_transitPassProperties_merchantTokensResponse_fkInstitution_isBridge_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if ([*(id *)(a1 + 32) hasDeviceBoundCommutePlans])
  {
    uint64_t v10 = PKPassLocalizedStringWithFormat();
    uint64_t v11 = *(void *)(*(void *)(a1 + 88) + 8);
    char v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    uint64_t v13 = PKPassLocalizedStringWithFormat();
    goto LABEL_9;
  }
  if ([*(id *)(a1 + 40) isStoredValuePass]
    && [*(id *)(a1 + 104) hasPositiveBalanceForTransitPassProperties:*(void *)(a1 + 48) transitBalanceModel:*(void *)(a1 + 32)])
  {
    uint64_t v14 = PKLocalizedPaymentString(&cfstr_DeleteCardWith.isa);
    uint64_t v15 = *(void *)(*(void *)(a1 + 88) + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    uint64_t v13 = PKLocalizedPaymentString(&cfstr_DeleteCardWith_0.isa);
    goto LABEL_9;
  }
  if (*(void *)(a1 + 56))
  {
    if (*(void *)(a1 + 64))
    {
      uint64_t v17 = PKLocalizedMerchantTokensString(&cfstr_DeleteMerchant.isa);
      uint64_t v18 = *(void *)(*(void *)(a1 + 88) + 8);
      id v19 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v17;

      uint64_t v13 = PKLocalizedMerchantTokensString(&cfstr_DeleteMerchant_0.isa);
      goto LABEL_9;
    }
    if (objc_msgSend(*(id *)(a1 + 104), "hasAppleCashMerchantTokenForMerchantTokensResponse:"))
    {
      char v30 = [*(id *)(a1 + 56) merchantTokens];
      uint64_t v31 = [v30 count];

      if (v31 != 1)
      {
        id v45 = NSString;
        char v46 = PKLocalizedMerchantTokensString(&cfstr_DeleteMerchant_0.isa);
        BOOL v47 = PKLocalizedPeerPaymentRecurringString(&cfstr_RemoveCardAler_0.isa);
        uint64_t v37 = [v45 stringWithFormat:@"%@\n\n%@", v46, v47];

        goto LABEL_34;
      }
      uint64_t v32 = PKLocalizedPeerPaymentRecurringString(&cfstr_RemoveCardAler.isa);
    }
    else
    {
      uint64_t v32 = PKLocalizedMerchantTokensString(&cfstr_DeleteMerchant_0.isa);
    }
    uint64_t v37 = v32;
LABEL_34:
    if (*(unsigned char *)(a1 + 112))
    {
      id v48 = [*(id *)(a1 + 40) localizedDescription];
      uint64_t v49 = PKLocalizedMerchantTokensString(&cfstr_DeleteMerchant_1.isa, &stru_1EF1B4C70.isa, v48);
      uint64_t v50 = *(void *)(*(void *)(a1 + 88) + 8);
      id v51 = *(void **)(v50 + 40);
      *(void *)(v50 + 40) = v49;

      uint64_t v52 = *(void *)(a1 + 96);
    }
    else
    {
      uint64_t v52 = *(void *)(a1 + 88);
    }
    uint64_t v53 = *(void *)(v52 + 8);
    id v22 = *(void **)(v53 + 40);
    *(void *)(v53 + 40) = v37;
    goto LABEL_11;
  }
  if ([*(id *)(a1 + 72) supportsTransactionsForPass:*(void *)(a1 + 40)])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __194__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_withAccount_paymentServiceDataProvider_transitBalanceModel_transitPassProperties_merchantTokensResponse_fkInstitution_isBridge_completion___block_invoke_2;
    aBlock[3] = &unk_1E59CC918;
    char v79 = *(unsigned char *)(a1 + 112);
    uint64_t v77 = *(void *)(a1 + 88);
    id v23 = *(id *)(a1 + 40);
    uint64_t v24 = *(void *)(a1 + 96);
    id v76 = v23;
    uint64_t v78 = v24;
    id v25 = _Block_copy(aBlock);
    id v26 = *(void **)(a1 + 64);
    if (v26)
    {
      uint64_t v69 = 0;
      v70 = &v69;
      uint64_t v71 = 0x3032000000;
      v72 = __Block_byref_object_copy__1;
      id v73 = __Block_byref_object_dispose__1;
      [v26 feature];
      PKLocalizedFeatureString();
      id v74 = (id)objc_claimAutoreleasedReturnValue();
      int v27 = [*(id *)(a1 + 40) isAppleCardPass];
      char v28 = v27;
      if (v27)
      {
        id v29 = [MEMORY[0x1E4F84270] sharedInstance];
        v63[0] = MEMORY[0x1E4F143A8];
        v63[1] = 3221225472;
        v63[2] = __194__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_withAccount_paymentServiceDataProvider_transitBalanceModel_transitPassProperties_merchantTokensResponse_fkInstitution_isBridge_completion___block_invoke_3;
        v63[3] = &unk_1E59CC940;
        v68 = &v69;
        id v64 = *(id *)(a1 + 64);
        id v66 = v25;
        id v67 = v9;
        id v65 = v8;
        [v29 defaultAccountForFeature:5 completion:v63];
      }
      else
      {
        if ([*(id *)(a1 + 64) feature] == 3)
        {
          id v54 = PKPrimaryAppleAccountEmail();
          uint64_t v55 = PKLocalizedCocoonString(&cfstr_AccountService_43.isa, &stru_1EF1B4C70.isa, v54);
          v56 = (void *)v70[5];
          void v70[5] = v55;
        }
        (*((void (**)(void *, uint64_t))v25 + 2))(v25, v70[5]);
      }
      _Block_object_dispose(&v69, 8);

      if (v28)
      {

        goto LABEL_13;
      }
      goto LABEL_58;
    }
    id v38 = [*(id *)(a1 + 40) localizedDescription];
    if ([*(id *)(a1 + 40) supportsBarcodePayment])
    {
      uint64_t v39 = PKLocalizedAquamanString(&cfstr_DeleteAccountS.isa, &stru_1EF1B4C70.isa, v38);
LABEL_31:
      id v40 = (void *)v39;
LABEL_57:
      (*((void (**)(void *, void *))v25 + 2))(v25, v40);

LABEL_58:
      goto LABEL_12;
    }
    if ([*(id *)(a1 + 40) isIdentityPass])
    {
      unint64_t v57 = [*(id *)(a1 + 40) identityType];
      if (v57 < 2)
      {
        int v58 = *(unsigned __int8 *)(a1 + 113);
        v59 = @"DELETE_DL_SHEET_MESSAGE";
      }
      else if (v57 == 3)
      {
        int v58 = *(unsigned __int8 *)(a1 + 113);
        v59 = @"DELETE_NID_SHEET_MESSAGE";
      }
      else
      {
        if (v57 != 2)
        {
          id v40 = 0;
          goto LABEL_57;
        }
        int v58 = *(unsigned __int8 *)(a1 + 113);
        v59 = @"DELETE_STATE_ID_SHEET_MESSAGE";
      }
      PKDeviceSpecificLocalizedStringKeyForKey(v59, v58);
      id v61 = (NSString *)objc_claimAutoreleasedReturnValue();
      uint64_t v62 = PKLocalizedIdentityString(v61, &stru_1EF1B4C70.isa, v38);
    }
    else
    {
      v60 = *(void **)(a1 + 80);
      if (!v60)
      {
        uint64_t v39 = PKLocalizedPaymentString(&cfstr_DeleteCardShee_1.isa);
        goto LABEL_31;
      }
      id v61 = [v60 name];
      uint64_t v62 = PKLocalizedBankConnectString(&cfstr_BankConnectDel.isa, &stru_1EF1B4C70.isa, v61);
    }
    id v40 = (void *)v62;

    goto LABEL_57;
  }
  if ([*(id *)(a1 + 40) areCredentialsStoredInKML]
    && [*(id *)(a1 + 40) isCarKeyPass])
  {
    if (*(unsigned char *)(a1 + 113)) {
      v33 = @"CARKEY_DELETE_CARD_SHEET_TITLE_WATCH";
    }
    else {
      v33 = @"CARKEY_DELETE_CARD_SHEET_TITLE";
    }
    uint64_t v13 = PKLocalizedCredentialString(&v33->isa);
    uint64_t v20 = *(void *)(a1 + 88);
    goto LABEL_10;
  }
  if ([*(id *)(a1 + 40) accessType] != 3)
  {
    id v41 = [*(id *)(a1 + 40) localizedDescription];
    uint64_t v42 = PKLocalizedPaymentString(&cfstr_DeleteCardShee_0.isa, &stru_1EF1B4C70.isa, v41);
    uint64_t v43 = *(void *)(*(void *)(a1 + 88) + 8);
    id v44 = *(void **)(v43 + 40);
    *(void *)(v43 + 40) = v42;

    goto LABEL_12;
  }
  uint64_t v34 = PKLocalizedHomeKeyString(&cfstr_DeleteKeySheet.isa);
  uint64_t v35 = *(void *)(*(void *)(a1 + 88) + 8);
  id v36 = *(void **)(v35 + 40);
  *(void *)(v35 + 40) = v34;

  uint64_t v13 = PKLocalizedHomeKeyString(&cfstr_DeleteKeySheet_0.isa);
LABEL_9:
  uint64_t v20 = *(void *)(a1 + 96);
LABEL_10:
  uint64_t v21 = *(void *)(v20 + 8);
  id v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v13;
LABEL_11:

LABEL_12:
  (*((void (**)(id, id, void))v9 + 2))(v9, v8, 0);
LABEL_13:
}

void __194__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_withAccount_paymentServiceDataProvider_transitBalanceModel_transitPassProperties_merchantTokensResponse_fkInstitution_isBridge_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 56))
  {
    id v4 = [*(id *)(a1 + 32) localizedDescription];
    uint64_t v5 = PKLocalizedPaymentString(&cfstr_DeleteCardShee_0.isa, &stru_1EF1B4C70.isa, v4);
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    uint64_t v8 = *(void *)(a1 + 48);
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 40);
  }
  uint64_t v9 = *(void *)(v8 + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v3;
}

uint64_t __194__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_withAccount_paymentServiceDataProvider_transitBalanceModel_transitPassProperties_merchantTokensResponse_fkInstitution_isBridge_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) feature];
    uint64_t v3 = PKLocalizedFeatureString();
    uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  uint64_t v6 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v6();
}

void __194__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_withAccount_paymentServiceDataProvider_transitBalanceModel_transitPassProperties_merchantTokensResponse_fkInstitution_isBridge_completion___block_invoke_4(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __194__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_withAccount_paymentServiceDataProvider_transitBalanceModel_transitPassProperties_merchantTokensResponse_fkInstitution_isBridge_completion___block_invoke_5;
  block[3] = &unk_1E59CC990;
  id v3 = *(id *)(a1 + 32);
  long long v4 = *(_OWORD *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __194__PKPassDeleteHelper_deletePaymentPassAlertCopyForPass_withAccount_paymentServiceDataProvider_transitBalanceModel_transitPassProperties_merchantTokensResponse_fkInstitution_isBridge_completion___block_invoke_5(void *a1)
{
  return (*(uint64_t (**)(void, void, void, uint64_t))(a1[4] + 16))(a1[4], *(void *)(*(void *)(a1[5] + 8) + 40), *(void *)(*(void *)(a1[6] + 8) + 40), 1);
}

+ (void)presentDeletePaymentPassAlertForPass:(id)a3 withAccount:(id)a4 paymentServiceDataProvider:(id)a5 transitBalanceModel:(id)a6 transitPassProperties:(id)a7 fkInstitution:(id)a8 detailViewStyle:(int64_t)a9 deleteHander:(id)a10 passLibraryDataProvider:(id)a11 presentingViewController:(id)a12
{
  id v15 = a3;
  id v16 = a10;
  id v17 = a11;
  id v18 = a12;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __232__PKPassDeleteHelper_presentDeletePaymentPassAlertForPass_withAccount_paymentServiceDataProvider_transitBalanceModel_transitPassProperties_fkInstitution_detailViewStyle_deleteHander_passLibraryDataProvider_presentingViewController___block_invoke;
  v27[3] = &unk_1E59CCA08;
  id v31 = v17;
  id v32 = a1;
  id v28 = v18;
  id v29 = v15;
  id v30 = v16;
  id v19 = v17;
  id v20 = v16;
  id v21 = v15;
  id v22 = v18;
  LOBYTE(v23) = a9 == 2;
  +[PKPassDeleteHelper deletePaymentPassAlertCopyForPass:v21 withAccount:a4 paymentServiceDataProvider:a5 transitBalanceModel:a6 transitPassProperties:a7 merchantTokensResponse:0 fkInstitution:a8 isBridge:v23 completion:v27];
}

void __232__PKPassDeleteHelper_presentDeletePaymentPassAlertForPass_withAccount_paymentServiceDataProvider_transitBalanceModel_transitPassProperties_fkInstitution_detailViewStyle_deleteHander_passLibraryDataProvider_presentingViewController___block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a3;
  id v9 = a2;
  unsigned int v10 = objc_msgSend(v7, "pkui_userInterfaceIdiomSupportsLargeLayouts");
  uint64_t v11 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v9 message:v8 preferredStyle:v10];

  char v12 = (void *)MEMORY[0x1E4FB1410];
  if (a4)
  {
    uint64_t v13 = PKLocalizedPaymentString(&cfstr_DeleteCardShee_2.isa);
    uint64_t v14 = [v12 actionWithTitle:v13 style:1 handler:0];
    [v11 addAction:v14];

    id v15 = (void *)MEMORY[0x1E4FB1410];
    id v16 = PKLocalizedPaymentString(&cfstr_DeleteCardShee.isa);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __232__PKPassDeleteHelper_presentDeletePaymentPassAlertForPass_withAccount_paymentServiceDataProvider_transitBalanceModel_transitPassProperties_fkInstitution_detailViewStyle_deleteHander_passLibraryDataProvider_presentingViewController___block_invoke_2;
    v20[3] = &unk_1E59CC9E0;
    uint64_t v25 = *(void *)(a1 + 64);
    id v21 = *(id *)(a1 + 40);
    id v22 = *(id *)(a1 + 48);
    id v23 = *(id *)(a1 + 56);
    id v24 = *(id *)(a1 + 32);
    id v17 = [v15 actionWithTitle:v16 style:2 handler:v20];
    [v11 addAction:v17];
  }
  else
  {
    id v18 = PKLocalizedPaymentString(&cfstr_PassActionUnav.isa);
    id v19 = [v12 actionWithTitle:v18 style:0 handler:0];
    [v11 addAction:v19];
  }
  [*(id *)(a1 + 32) presentViewController:v11 animated:1 completion:0];
}

uint64_t __232__PKPassDeleteHelper_presentDeletePaymentPassAlertForPass_withAccount_paymentServiceDataProvider_transitBalanceModel_transitPassProperties_fkInstitution_detailViewStyle_deleteHander_passLibraryDataProvider_presentingViewController___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 64) deletePaymentPass:*(void *)(a1 + 32) withDeleteHander:*(void *)(a1 + 40) passLibraryDataProvider:*(void *)(a1 + 48) presentingViewController:*(void *)(a1 + 56)];
}

+ (void)presentMerchantTokenDeletePaymentPassAlertForPass:(id)a3 withAccount:(id)a4 merchantTokensResponse:(id)a5 deleteHander:(id)a6 passLibraryDataProvider:(id)a7 navigationController:(id)a8 presentingViewController:(id)a9 isBridge:(BOOL)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  if ([v16 hasMerchantTokens])
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __199__PKPassDeleteHelper_presentMerchantTokenDeletePaymentPassAlertForPass_withAccount_merchantTokensResponse_deleteHander_passLibraryDataProvider_navigationController_presentingViewController_isBridge___block_invoke;
    v25[3] = &unk_1E59CCA78;
    id v26 = v22;
    id v27 = v18;
    id v32 = a1;
    id v28 = v21;
    id v29 = v16;
    id v30 = v19;
    id v31 = v20;
    LOBYTE(v24) = !a10;
    +[PKPassDeleteHelper deletePaymentPassAlertCopyForPass:v29 withAccount:v17 paymentServiceDataProvider:0 transitBalanceModel:0 transitPassProperties:0 merchantTokensResponse:v27 fkInstitution:0 isBridge:v24 completion:v25];

    id v23 = v26;
  }
  else
  {
    id v23 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19F450000, v23, OS_LOG_TYPE_DEFAULT, "Incorrect deletePaymentPassAlert shown, this pass doesn't have any merchant tokens associated with it", buf, 2u);
    }
  }
}

void __199__PKPassDeleteHelper_presentMerchantTokenDeletePaymentPassAlertForPass_withAccount_merchantTokensResponse_deleteHander_passLibraryDataProvider_navigationController_presentingViewController_isBridge___block_invoke(id *a1, void *a2, void *a3, int a4)
{
  v58[1] = *MEMORY[0x1E4F143B8];
  id v7 = a1[4];
  id v8 = a3;
  id v9 = a2;
  unsigned int v10 = objc_msgSend(v7, "pkui_userInterfaceIdiomSupportsLargeLayouts");
  uint64_t v11 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v9 message:v8 preferredStyle:v10];

  char v12 = (void *)MEMORY[0x1E4FB1410];
  if (!a4)
  {
    id v22 = PKLocalizedPaymentString(&cfstr_PassActionUnav.isa);
    id v23 = [v12 actionWithTitle:v22 style:0 handler:0];
    [v11 addAction:v23];

    goto LABEL_15;
  }
  uint64_t v13 = PKLocalizedPaymentString(&cfstr_DeleteCardShee_2.isa);
  uint64_t v36 = [v12 actionWithTitle:v13 style:1 handler:&__block_literal_global_21];

  uint64_t v14 = [a1[5] merchantTokens];
  if ([v14 count] != 1)
  {

    goto LABEL_7;
  }
  int v15 = [a1[10] hasAppleCashMerchantTokenForMerchantTokensResponse:a1[5]];

  if (!v15)
  {
LABEL_7:
    uint64_t v24 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v25 = PKLocalizedMerchantTokensString(&cfstr_DeleteMerchant_2.isa);
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __199__PKPassDeleteHelper_presentMerchantTokenDeletePaymentPassAlertForPass_withAccount_merchantTokensResponse_deleteHander_passLibraryDataProvider_navigationController_presentingViewController_isBridge___block_invoke_6;
    v47[3] = &unk_1E59CCA50;
    id v18 = &v48;
    id v48 = a1[7];
    id v19 = &v49;
    id v49 = a1[5];
    id v20 = &v50;
    id v50 = a1[4];
    id v51 = a1[6];
    id v21 = [v24 actionWithTitle:v25 style:0 handler:v47];

    id v17 = v51;
    goto LABEL_8;
  }
  id v16 = (void *)MEMORY[0x1E4FB1410];
  id v17 = PKLocalizedPeerPaymentRecurringString(&cfstr_RemoveCardAler_1.isa);
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __199__PKPassDeleteHelper_presentMerchantTokenDeletePaymentPassAlertForPass_withAccount_merchantTokensResponse_deleteHander_passLibraryDataProvider_navigationController_presentingViewController_isBridge___block_invoke_3;
  v52[3] = &unk_1E59CAC80;
  id v18 = &v53;
  id v53 = a1[5];
  id v19 = &v54;
  id v54 = a1[4];
  id v20 = &v55;
  id v55 = a1[6];
  id v21 = [v16 actionWithTitle:v17 style:0 handler:v52];
LABEL_8:

  id v26 = (void *)MEMORY[0x1E4FB1410];
  id v27 = PKLocalizedMerchantTokensString(&cfstr_DeleteMerchant_3.isa);
  uint64_t v38 = MEMORY[0x1E4F143A8];
  uint64_t v39 = 3221225472;
  id v40 = __199__PKPassDeleteHelper_presentMerchantTokenDeletePaymentPassAlertForPass_withAccount_merchantTokensResponse_deleteHander_passLibraryDataProvider_navigationController_presentingViewController_isBridge___block_invoke_7;
  id v41 = &unk_1E59CC9E0;
  id v46 = a1[10];
  id v42 = a1[7];
  id v43 = a1[8];
  id v44 = a1[9];
  id v45 = a1[4];
  id v28 = [v26 actionWithTitle:v27 style:2 handler:&v38];

  if (v10) {
    id v29 = v28;
  }
  else {
    id v29 = v21;
  }
  if (v10) {
    id v30 = v21;
  }
  else {
    id v30 = v28;
  }
  objc_msgSend(v11, "addAction:", v29, v36, v38, v39, v40, v41);
  [v11 addAction:v30];
  [v11 addAction:v37];
  [v11 setPreferredAction:v28];

LABEL_15:
  id v31 = (void *)MEMORY[0x1E4F843E0];
  v58[0] = *MEMORY[0x1E4F87038];
  id v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:1];
  uint64_t v33 = *MEMORY[0x1E4F86730];
  v56[0] = *MEMORY[0x1E4F86308];
  v56[1] = v33;
  uint64_t v34 = *MEMORY[0x1E4F86758];
  v57[0] = *MEMORY[0x1E4F864A0];
  v57[1] = v34;
  uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:2];
  [v31 subjects:v32 sendEvent:v35];

  [a1[4] presentViewController:v11 animated:1 completion:0];
}

void __199__PKPassDeleteHelper_presentMerchantTokenDeletePaymentPassAlertForPass_withAccount_merchantTokensResponse_deleteHander_passLibraryDataProvider_navigationController_presentingViewController_isBridge___block_invoke_2()
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F843E0];
  v8[0] = *MEMORY[0x1E4F87038];
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  uint64_t v2 = *MEMORY[0x1E4F86380];
  uint64_t v3 = *MEMORY[0x1E4F86120];
  v6[0] = *MEMORY[0x1E4F86308];
  v6[1] = v3;
  uint64_t v4 = *MEMORY[0x1E4F86148];
  v7[0] = v2;
  v7[1] = v4;
  v6[2] = *MEMORY[0x1E4F86730];
  v7[2] = *MEMORY[0x1E4F86758];
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];
  [v0 subjects:v1 sendEvent:v5];
}

void __199__PKPassDeleteHelper_presentMerchantTokenDeletePaymentPassAlertForPass_withAccount_merchantTokensResponse_deleteHander_passLibraryDataProvider_navigationController_presentingViewController_isBridge___block_invoke_3(id *a1)
{
  uint64_t v2 = [a1[4] merchantTokens];
  uint64_t v3 = [v2 firstObject];

  uint64_t v4 = [[PKMerchantTokenDetailViewController alloc] initWithMerchantToken:v3];
  if ([a1[5] conformsToProtocol:&unk_1EF39C1E0]) {
    [(PKMerchantTokenDetailViewController *)v4 setDelegate:a1[5]];
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __199__PKPassDeleteHelper_presentMerchantTokenDeletePaymentPassAlertForPass_withAccount_merchantTokensResponse_deleteHander_passLibraryDataProvider_navigationController_presentingViewController_isBridge___block_invoke_4;
  void v6[3] = &unk_1E59CAEA8;
  id v7 = a1[6];
  id v8 = v4;
  uint64_t v5 = v4;
  [(PKMerchantTokenDetailViewController *)v5 preflightWithCompletion:v6];
}

void __199__PKPassDeleteHelper_presentMerchantTokenDeletePaymentPassAlertForPass_withAccount_merchantTokensResponse_deleteHander_passLibraryDataProvider_navigationController_presentingViewController_isBridge___block_invoke_4(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __199__PKPassDeleteHelper_presentMerchantTokenDeletePaymentPassAlertForPass_withAccount_merchantTokensResponse_deleteHander_passLibraryDataProvider_navigationController_presentingViewController_isBridge___block_invoke_5;
  v2[3] = &unk_1E59CA870;
  id v3 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

uint64_t __199__PKPassDeleteHelper_presentMerchantTokenDeletePaymentPassAlertForPass_withAccount_merchantTokensResponse_deleteHander_passLibraryDataProvider_navigationController_presentingViewController_isBridge___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) pushViewController:*(void *)(a1 + 40) animated:1];
}

void __199__PKPassDeleteHelper_presentMerchantTokenDeletePaymentPassAlertForPass_withAccount_merchantTokensResponse_deleteHander_passLibraryDataProvider_navigationController_presentingViewController_isBridge___block_invoke_6(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F843E0];
  v10[0] = *MEMORY[0x1E4F87038];
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  uint64_t v4 = *MEMORY[0x1E4F86380];
  uint64_t v5 = *MEMORY[0x1E4F86120];
  v8[0] = *MEMORY[0x1E4F86308];
  v8[1] = v5;
  v9[0] = v4;
  v9[1] = @"learnMore";
  void v8[2] = *MEMORY[0x1E4F86730];
  v9[2] = *MEMORY[0x1E4F86758];
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];
  [v2 subjects:v3 sendEvent:v6];

  id v7 = [[PKMerchantTokensViewController alloc] initWithPass:*(void *)(a1 + 32) merchantTokensResponse:*(void *)(a1 + 40)];
  if ([*(id *)(a1 + 48) conformsToProtocol:&unk_1EF3C1CD8]) {
    [(PKMerchantTokensViewController *)v7 setDelegate:*(void *)(a1 + 48)];
  }
  [*(id *)(a1 + 56) pushViewController:v7 animated:1];
}

uint64_t __199__PKPassDeleteHelper_presentMerchantTokenDeletePaymentPassAlertForPass_withAccount_merchantTokensResponse_deleteHander_passLibraryDataProvider_navigationController_presentingViewController_isBridge___block_invoke_7(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1E4F843E0];
  v10[0] = *MEMORY[0x1E4F87038];
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  uint64_t v4 = *MEMORY[0x1E4F86380];
  uint64_t v5 = *MEMORY[0x1E4F86120];
  v8[0] = *MEMORY[0x1E4F86308];
  v8[1] = v5;
  v9[0] = v4;
  v9[1] = @"confirmRemoveCard";
  void v8[2] = *MEMORY[0x1E4F86730];
  v9[2] = *MEMORY[0x1E4F86758];
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];
  [v2 subjects:v3 sendEvent:v6];

  return [*(id *)(a1 + 64) deletePaymentPass:*(void *)(a1 + 32) withDeleteHander:*(void *)(a1 + 40) passLibraryDataProvider:*(void *)(a1 + 48) presentingViewController:*(void *)(a1 + 56)];
}

+ (void)deletePaymentPass:(id)a3 withDeleteHander:(id)a4 passLibraryDataProvider:(id)a5 presentingViewController:(id)a6
{
  v36[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (v10 && ([v10 handleDeletePassRequestWithPass:v9 forViewController:v12] & 1) != 0)
  {
    int v13 = 1;
  }
  else
  {
    [v11 removePass:v9];
    uint64_t v14 = [v12 navigationController];
    int v15 = [v14 viewControllers];
    uint64_t v16 = [v15 count];

    if (v16)
    {
      id v17 = [v12 navigationController];
      id v18 = (id)[v17 popViewControllerAnimated:1];
    }
    else
    {
      [v12 dismissViewControllerAnimated:1 completion:0];
    }

    int v13 = 0;
  }
  MEMORY[0x1A6220EC0](*MEMORY[0x1E4F85D28], &unk_1EF2BA3B0);
  int v19 = [v9 hasMerchantTokens];
  id v20 = (void *)MEMORY[0x1E4F843E0];
  if (v19)
  {
    v36[0] = *MEMORY[0x1E4F87038];
    id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:1];
    id v22 = (uint64_t *)MEMORY[0x1E4F86188];
    if (!v13) {
      id v22 = (uint64_t *)MEMORY[0x1E4F86180];
    }
    uint64_t v23 = *v22;
    uint64_t v24 = *MEMORY[0x1E4F86730];
    v34[0] = *MEMORY[0x1E4F86308];
    v34[1] = v24;
    uint64_t v25 = *MEMORY[0x1E4F86758];
    v35[0] = v23;
    v35[1] = v25;
    id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v35 forKeys:v34 count:2];
    [v20 subjects:v21 sendEvent:v26];
LABEL_16:

    goto LABEL_17;
  }
  id v21 = [MEMORY[0x1E4F843E0] subjectToReportDashboardAnalyticsForPass:v9];
  if (v21)
  {
    id v27 = (void *)MEMORY[0x1E4F843E0];
    id v28 = (uint64_t *)MEMORY[0x1E4F86188];
    if (!v13) {
      id v28 = (uint64_t *)MEMORY[0x1E4F86180];
    }
    uint64_t v29 = *v28;
    uint64_t v30 = *MEMORY[0x1E4F86730];
    v32[0] = *MEMORY[0x1E4F86308];
    v32[1] = v30;
    uint64_t v31 = *MEMORY[0x1E4F86758];
    v33[0] = v29;
    v33[1] = v31;
    id v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];
    [v27 subject:v21 sendEvent:v26];
    goto LABEL_16;
  }
LABEL_17:
}

+ (BOOL)_canDeletePaymentPass:(id)a3 transitPassProperties:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v6 = [a3 devicePrimaryContactlessPaymentApplication];
  unint64_t v7 = [v6 state];

  BOOL v8 = 1;
  if (v7 <= 0xF && ((1 << v7) & 0x83DE) != 0 && v5 && [v5 isEnRoute])
  {
    id v9 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_19F450000, v9, OS_LOG_TYPE_DEFAULT, "Pass can not be deleted as it is en route", (uint8_t *)&v13, 2u);
    }

    BOOL v8 = 0;
  }
  id v10 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = @"NO";
    if (v8) {
      id v11 = @"YES";
    }
    int v13 = 138543618;
    uint64_t v14 = v11;
    __int16 v15 = 2050;
    unint64_t v16 = v7;
    _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "Pass deletion allowed: %{public}@ for state: %{public}lu", (uint8_t *)&v13, 0x16u);
  }

  return v8;
}

+ (BOOL)hasAppleCashMerchantTokenForMerchantTokensResponse:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = objc_msgSend(a3, "merchantTokens", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if ([*(id *)(*((void *)&v8 + 1) + 8 * i) isAppleCashPaymentToken])
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

@end