@interface PKIdentityDocumentDetailsViewController
- (BOOL)shouldMapSection:(unint64_t)a3;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (PKIdentityDocumentDetailsViewController)initWithPass:(id)a3 dataProvider:(id)a4 detailViewStyle:(int64_t)a5;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_elementAtIndexPath:(id)a3;
- (id)_elementsForSection:(unint64_t)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_formatDataElementsForISO18013:(id)a3 withCompletion:(id)a4;
- (void)_formatDataElementsForISO23220:(id)a3 withCompletion:(id)a4;
- (void)preflightWithCompletion:(id)a3;
- (void)viewDidLoad;
@end

@implementation PKIdentityDocumentDetailsViewController

- (PKIdentityDocumentDetailsViewController)initWithPass:(id)a3 dataProvider:(id)a4 detailViewStyle:(int64_t)a5
{
  id v9 = a3;
  id v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PKIdentityDocumentDetailsViewController;
  v11 = -[PKSectionTableViewController initWithStyle:numberOfSections:](&v16, sel_initWithStyle_numberOfSections_, objc_msgSend(MEMORY[0x1E4FB1D00], "pkui_groupedStyleWithRoundedCorners:", 1), 8);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_pass, a3);
    v12->_detailViewStyle = a5;
    objc_storeStrong((id *)&v12->_dataProvider, a4);
    v12->_inBridge = v12->_detailViewStyle == 2;
    unint64_t v13 = [(PKSecureElementPass *)v12->_pass identityType];
    if (v13 > 3)
    {
      v14 = 0;
    }
    else
    {
      v14 = PKLocalizedIdentityString(&off_1E59D08F0[v13]->isa);
    }
    [(PKIdentityDocumentDetailsViewController *)v12 setTitle:v14];
  }
  return v12;
}

- (void)preflightWithCompletion:(id)a3
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    v5 = [(PKSecureElementPass *)self->_pass devicePaymentApplications];
    v6 = (void *)[v5 countByEnumeratingWithState:&v66 objects:v71 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v67;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v67 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(void **)(*((void *)&v66 + 1) + 8 * i);
          if ([v9 paymentType] == 1002)
          {
            id v10 = [v9 subcredentials];
            v11 = [v10 anyObject];
            v6 = [v11 identifier];

            goto LABEL_12;
          }
        }
        v6 = (void *)[v5 countByEnumeratingWithState:&v66 objects:v71 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    if ([v6 length])
    {
      *(void *)buf = 0;
      v61 = buf;
      uint64_t v62 = 0x3032000000;
      v63 = __Block_byref_object_copy__10;
      v64 = __Block_byref_object_dispose__10;
      id v65 = 0;
      v58[0] = 0;
      v58[1] = v58;
      v58[2] = 0x3032000000;
      v58[3] = __Block_byref_object_copy__10;
      v58[4] = __Block_byref_object_dispose__10;
      id v59 = 0;
      v56[0] = 0;
      v56[1] = v56;
      v56[2] = 0x2020000000;
      char v57 = 0;
      v54[0] = 0;
      v54[1] = v54;
      v54[2] = 0x2020000000;
      char v55 = 0;
      v52[0] = 0;
      v52[1] = v52;
      v52[2] = 0x2020000000;
      char v53 = 0;
      v50[0] = 0;
      v50[1] = v50;
      v50[2] = 0x2020000000;
      char v51 = 0;
      id v12 = objc_alloc_init(MEMORY[0x1E4F84518]);
      id v13 = objc_alloc(MEMORY[0x1E4F5C0F8]);
      uint64_t v70 = *MEMORY[0x1E4F872A8];
      v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1];
      v15 = (void *)[v13 initWithPartitions:v14];

      objc_initWeak(&location, self);
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke;
      v43[3] = &unk_1E59D06F0;
      id v16 = v15;
      id v44 = v16;
      id v17 = v6;
      id v45 = v17;
      objc_copyWeak(&v48, &location);
      v46 = v56;
      v47 = v54;
      [v12 addOperation:v43];
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_78;
      v37[3] = &unk_1E59D06F0;
      objc_copyWeak(&v42, &location);
      v40 = v56;
      id v18 = v16;
      id v38 = v18;
      id v19 = v17;
      id v39 = v19;
      v41 = buf;
      [v12 addOperation:v37];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_81;
      v36[3] = &unk_1E59D0740;
      v36[4] = v56;
      v36[5] = v50;
      [v12 addOperation:v36];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_85;
      v34[3] = &unk_1E59D0808;
      objc_copyWeak(&v35, &location);
      v34[4] = v56;
      v34[5] = buf;
      v34[6] = v50;
      v34[7] = v58;
      v34[8] = v52;
      [v12 addOperation:v34];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_2_112;
      v29[3] = &unk_1E59CF7C0;
      id v20 = v18;
      id v30 = v20;
      id v31 = v19;
      v32 = v58;
      objc_copyWeak(&v33, &location);
      [v12 addOperation:v29];
      v21 = [MEMORY[0x1E4F1CA98] null];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_5;
      v25[3] = &unk_1E59D08A8;
      v27 = v54;
      id v26 = v4;
      v28 = v52;
      id v22 = (id)[v12 evaluateWithInput:v21 completion:v25];

      objc_destroyWeak(&v33);
      objc_destroyWeak(&v35);

      objc_destroyWeak(&v42);
      objc_destroyWeak(&v48);

      objc_destroyWeak(&location);
      _Block_object_dispose(v50, 8);
      _Block_object_dispose(v52, 8);
      _Block_object_dispose(v54, 8);
      _Block_object_dispose(v56, 8);
      _Block_object_dispose(v58, 8);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      v23 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19F450000, v23, OS_LOG_TYPE_DEFAULT, "No subcredential in a pass expecting at least one.", buf, 2u);
      }

      v24 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKIdentityDocumentDetailsErrorDomain" code:0 userInfo:0];
      (*((void (**)(id, void *))v4 + 2))(v4, v24);
    }
  }
}

void __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_2;
  v14[3] = &unk_1E59D06A0;
  objc_copyWeak(&v18, (id *)(a1 + 64));
  id v12 = v9;
  id v16 = v12;
  id v13 = v8;
  id v15 = v13;
  long long v17 = *(_OWORD *)(a1 + 48);
  [v10 propertiesOfCredential:v11 completion:v14];

  objc_destroyWeak(&v18);
}

void __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (v6)
    {
      id v8 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412290;
        id v14 = v6;
        _os_log_impl(&dword_19F450000, v8, OS_LOG_TYPE_DEFAULT, "Could not recover credential properties with error %@", (uint8_t *)&v13, 0xCu);
      }
    }
    id v9 = [v5 options];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v9 payloadProtectionPolicy] == 1;

    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      id v10 = [v5 options];
      if ([v10 presentmentAuthPolicy] == 2) {
        char v11 = [v5 hasUsablePresentmentAuthPolicy] ^ 1;
      }
      else {
        char v11 = 0;
      }
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v11;
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
    }
    id v12 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    id v12 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v12();
}

void __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_78(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      id v9 = *(void **)(a1 + 32);
      uint64_t v10 = *(void *)(a1 + 40);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_2_79;
      v13[3] = &unk_1E59D06C8;
      id v15 = v7;
      id v11 = v6;
      uint64_t v12 = *(void *)(a1 + 56);
      id v14 = v11;
      uint64_t v16 = v12;
      [v9 payloadAuthACLForCredential:v10 completion:v13];
    }
    else
    {
      (*((void (**)(id, id, void))v7 + 2))(v7, v6, 0);
    }
  }
  else
  {
    (*((void (**)(id, id, uint64_t))v7 + 2))(v7, v6, 1);
  }
}

void __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_2_79(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = v7;
  if (!v6 || v7)
  {
    uint64_t v10 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 138412290;
      uint64_t v12 = v8;
      _os_log_impl(&dword_19F450000, v10, OS_LOG_TYPE_DEFAULT, "Could not recover the auth ACL with error %@", (uint8_t *)&v11, 0xCu);
    }

    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
    id v9 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v9();
}

void __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_81(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F5C0E8]);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_2_83;
    v12[3] = &unk_1E59D0718;
    uint64_t v10 = *(void *)(a1 + 40);
    id v13 = v9;
    uint64_t v16 = v10;
    id v15 = v8;
    id v14 = v6;
    id v11 = v9;
    [v11 globalAuthACLWithCompletion:v12];
  }
  else
  {
    (*((void (**)(id, id, void))v7 + 2))(v7, v6, 0);
  }
}

void __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_2_83(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl(&dword_19F450000, v7, OS_LOG_TYPE_DEFAULT, "Could not fetch global ACL with error %@", (uint8_t *)&v9, 0xCu);
    }
  }
  if (v5) {
    BOOL v8 = [v5 aclType] == 2;
  }
  else {
    BOOL v8 = 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v8;
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_85(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  int v9 = a4;
  id v10 = (id *)(a1 + 72);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v12 = WeakRetained;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)
    || (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) ? (BOOL v13 = WeakRetained == 0) : (BOOL v13 = 1), v13))
  {
    v9[2](v9, v8, 0);
  }
  else
  {
    uint64_t v43 = 0;
    id v14 = (void *)SecAccessControlCreateFromData();
    id v15 = PKLogFacilityTypeGetObject();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        LOWORD(buf) = 0;
        _os_log_impl(&dword_19F450000, v15, OS_LOG_TYPE_DEFAULT, "Using custom ACL for ID details", (uint8_t *)&buf, 2u);
      }

      v41[0] = 0;
      v41[1] = v41;
      v41[2] = 0x2020000000;
      char v42 = 0;
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v45 = 0x3032000000;
      v46 = __Block_byref_object_copy__86;
      v47 = __Block_byref_object_dispose__87;
      id v48 = 0;
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_88;
      aBlock[3] = &unk_1E59D0790;
      objc_copyWeak(v40, (id *)(a1 + 72));
      long long v17 = v9;
      id v35 = v17;
      id v18 = v8;
      id v34 = v18;
      uint64_t v20 = *(void *)(a1 + 64);
      id v19 = (void *)(a1 + 64);
      long long v36 = *((_OWORD *)v19 - 1);
      uint64_t v37 = v20;
      id v38 = v41;
      v40[1] = v14;
      p_long long buf = &buf;
      v21 = _Block_copy(aBlock);
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_108;
      v27[3] = &unk_1E59D07E0;
      objc_copyWeak(&v32, v10);
      v29 = v17;
      id v22 = v18;
      uint64_t v23 = *v19;
      id v28 = v22;
      uint64_t v31 = v23;
      v24 = v21;
      id v30 = v24;
      v25 = _Block_copy(v27);
      id v26 = *(void **)(*((void *)&buf + 1) + 40);
      *(void *)(*((void *)&buf + 1) + 40) = v25;

      v24[2](v24);
      objc_destroyWeak(&v32);

      objc_destroyWeak(v40);
      _Block_object_dispose(&buf, 8);

      _Block_object_dispose(v41, 8);
    }
    else
    {
      if (v16)
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = 0;
        _os_log_impl(&dword_19F450000, v15, OS_LOG_TYPE_DEFAULT, "Could not create access control ref from provided data with error %@", (uint8_t *)&buf, 0xCu);
      }

      v9[2](v9, v8, 1);
    }
  }
}

void __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_88(uint64_t a1)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 88);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
  if (WeakRetained)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F30B50]);
    id v5 = (void *)WeakRetained[148];
    WeakRetained[148] = v4;

    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      uint64_t v20 = &unk_1EF2B8D18;
      id v6 = PKLocalizedIdentityString(&cfstr_PresentmentFoo.isa);
      v21[0] = v6;
      id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    }
    else
    {
      v18[0] = &unk_1EF2B8D30;
      id v6 = PKLocalizedIdentityString(&cfstr_IdentityDetail.isa);
      v18[1] = &unk_1EF2B8D48;
      v19[0] = v6;
      id v8 = PKLocalizedIdentityString(&cfstr_IdentityDetail_0.isa);
      v19[1] = v8;
      id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
    }
    int v9 = (void *)WeakRetained[148];
    uint64_t v10 = *(void *)(a1 + 96);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_105;
    v12[3] = &unk_1E59D0768;
    objc_copyWeak(&v17, v2);
    id v14 = *(id *)(a1 + 40);
    id v13 = *(id *)(a1 + 32);
    long long v11 = *(_OWORD *)(a1 + 72);
    long long v15 = *(_OWORD *)(a1 + 56);
    long long v16 = v11;
    [v9 evaluateAccessControl:v10 operation:4 options:v7 reply:v12];

    objc_destroyWeak(&v17);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_105(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 80));
  id v7 = WeakRetained;
  if (!WeakRetained)
  {
    uint64_t v10 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_30:
    v10();
    goto LABEL_31;
  }
  if (a2) {
    BOOL v8 = v5 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  int v9 = v8;
  if (v8)
  {
    id v11 = [WeakRetained[148] externalizedContext];
  }
  else
  {
    id v11 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v11);
  if (v9) {
    goto LABEL_13;
  }
  if (!v5) {
    goto LABEL_29;
  }
  uint64_t v12 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    id v19 = v5;
    _os_log_impl(&dword_19F450000, v12, OS_LOG_TYPE_DEFAULT, "Failed to auth to view details with error %@", (uint8_t *)&v18, 0xCu);
  }

  id v13 = [v5 domain];
  id v14 = (void *)*MEMORY[0x1E4F30B38];
  id v11 = v13;
  id v15 = v14;
  if (v11 == v15)
  {
  }
  else
  {
    long long v16 = v15;
    if (!v11 || !v15)
    {

LABEL_13:
LABEL_29:
      uint64_t v10 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
      goto LABEL_30;
    }
    int v17 = [v11 isEqualToString:v15];

    if (!v17) {
      goto LABEL_29;
    }
  }
  if ([v5 code] == -2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    goto LABEL_29;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) || [v5 code] != -8) {
    goto LABEL_29;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  (*(void (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) + 16))();
LABEL_31:
}

void __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_108(uint64_t a1)
{
  v14[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F30B50]);
    id v4 = (void *)WeakRetained[148];
    WeakRetained[148] = v3;

    v13[0] = &unk_1EF2B8D18;
    id v5 = PKLocalizedIdentityString(&cfstr_PresentmentFoo.isa);
    v13[1] = &unk_1EF2B8D60;
    v14[0] = v5;
    v14[1] = MEMORY[0x1E4F1CC38];
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:2];

    id v7 = (void *)WeakRetained[148];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_111;
    v8[3] = &unk_1E59D07B8;
    uint64_t v12 = *(void *)(a1 + 56);
    id v10 = *(id *)(a1 + 40);
    id v9 = *(id *)(a1 + 32);
    id v11 = *(id *)(a1 + 48);
    [v7 evaluatePolicy:2 options:v6 reply:v8];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_111(void *a1, uint64_t a2, uint64_t a3)
{
  if (a2 && !a3) {
    return (*(uint64_t (**)(void))(a1[6] + 16))();
  }
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = 1;
  return (*(uint64_t (**)(void, void, uint64_t))(a1[5] + 16))(a1[5], a1[4], 1);
}

void __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_2_112(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = *(void **)(a1 + 32);
  uint64_t v11 = *(void *)(a1 + 40);
  uint64_t v12 = PKISO_ViewableElements();
  uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_3;
  v16[3] = &unk_1E59D0880;
  objc_copyWeak(&v19, (id *)(a1 + 56));
  id v14 = v9;
  id v18 = v14;
  id v15 = v8;
  id v17 = v15;
  [v10 elementsOfCredential:v11 elementIdentifiers:v12 authData:v13 completion:v16];

  objc_destroyWeak(&v19);
}

void __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_3(id *a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v8 = WeakRetained;
  if (v6 || !WeakRetained)
  {
    id v19 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v33 = v6;
      _os_log_impl(&dword_19F450000, v19, OS_LOG_TYPE_DEFAULT, "Could not get identity elements from credential with error %@", buf, 0xCu);
    }

    (*((void (**)(void))a1[5] + 2))();
  }
  else
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_113;
    aBlock[3] = &unk_1E59D0858;
    id v9 = v5;
    id v27 = v9;
    id v10 = (void (**)(void *, void))_Block_copy(aBlock);
    uint64_t v11 = *MEMORY[0x1E4F87428];
    uint64_t v12 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F87428]];
    uint64_t v13 = [v12 count];

    if (v13)
    {
      v30[0] = v11;
      id v14 = v10[2](v10, v11);
      v31[0] = v14;
      v30[1] = *MEMORY[0x1E4F87420];
      id v15 = ((void (*)(void (**)(void *, void)))v10[2])(v10);
      v31[1] = v15;
      long long v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_3_118;
      v23[3] = &unk_1E59CAD68;
      id v17 = &v25;
      id v25 = a1[5];
      id v18 = &v24;
      id v24 = a1[4];
      [v8 _formatDataElementsForISO23220:v16 withCompletion:v23];
    }
    else
    {
      v28[0] = *MEMORY[0x1E4F873A0];
      id v14 = ((void (*)(void (**)(void *, void)))v10[2])(v10);
      v29[0] = v14;
      v28[1] = *MEMORY[0x1E4F87398];
      id v15 = ((void (*)(void (**)(void *, void)))v10[2])(v10);
      v29[1] = v15;
      long long v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_4;
      v20[3] = &unk_1E59CAD68;
      id v17 = &v22;
      id v22 = a1[5];
      id v18 = &v21;
      id v21 = a1[4];
      [v8 _formatDataElementsForISO18013:v16 withCompletion:v20];
    }
  }
}

id __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_113(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a2;
  id v5 = objc_alloc_init(v3);
  id v6 = [*(id *)(a1 + 32) objectForKey:v4];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_2_115;
  v10[3] = &unk_1E59D0830;
  id v11 = v5;
  id v7 = v5;
  [v6 enumerateObjectsUsingBlock:v10];

  id v8 = (void *)[v7 copy];

  return v8;
}

void __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_2_115(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 elementIdentifier];
  [v2 setObject:v3 forKey:v4];
}

uint64_t __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_3_118(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void __67__PKIdentityDocumentDetailsViewController_preflightWithCompletion___block_invoke_5(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v14 = a3;
  id v6 = a4;
  id v7 = v6;
  if (*(unsigned char *)(*(void *)(a1[5] + 8) + 24))
  {
    uint64_t v8 = a1[4];
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = 1;
LABEL_5:
    id v11 = [v9 errorWithDomain:@"PKIdentityDocumentDetailsErrorDomain" code:v10 userInfo:0];
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v11);
LABEL_6:

    goto LABEL_7;
  }
  if (*(unsigned char *)(*(void *)(a1[6] + 8) + 24))
  {
    uint64_t v8 = a1[4];
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = 2;
    goto LABEL_5;
  }
  int v12 = [v6 isCanceled];
  uint64_t v13 = a1[4];
  if (v12)
  {
    id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKIdentityDocumentDetailsErrorDomain" code:0 userInfo:0];
    (*(void (**)(uint64_t, void *))(v13 + 16))(v13, v11);
    goto LABEL_6;
  }
  (*(void (**)(uint64_t, void))(v13 + 16))(v13, 0);
LABEL_7:
}

- (void)_formatDataElementsForISO18013:(id)a3 withCompletion:(id)a4
{
  uint64_t v263 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v203 = a4;
  id v6 = [v5 objectForKey:*MEMORY[0x1E4F873A0]];
  v209 = v5;
  id v7 = [v5 objectForKey:*MEMORY[0x1E4F87398]];
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v9 = objc_alloc(MEMORY[0x1E4FB1818]);
  uint64_t v10 = [v6 objectForKey:*MEMORY[0x1E4F873A8]];
  id v11 = [v10 dataValue];
  uint64_t v12 = [v9 initWithData:v11];

  id v214 = v8;
  v206 = (void *)v12;
  if (v12)
  {
    uint64_t v13 = [[PKIdentityDocumentDataElement alloc] initWithImage:v12];
    [v8 addObject:v13];
  }
  else
  {
    uint64_t v13 = 0;
  }
  id v218 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v14 = [v6 objectForKey:*MEMORY[0x1E4F87328]];
  id v15 = [v14 stringValue];
  long long v16 = objc_msgSend(v15, "pk_zString");

  id v17 = [v6 objectForKey:*MEMORY[0x1E4F87378]];
  id v18 = [v17 stringValue];
  id v19 = objc_msgSend(v18, "pk_zString");

  v204 = v19;
  v205 = v16;
  if ([v16 length] || objc_msgSend(v19, "length"))
  {
    id v20 = objc_alloc_init(MEMORY[0x1E4F28F30]);
    if ([v16 length]) {
      [v20 setGivenName:v16];
    }
    if ([v19 length]) {
      [v20 setFamilyName:v19];
    }
    id v21 = objc_alloc_init(MEMORY[0x1E4F28F38]);
    id v22 = [PKIdentityDocumentDataElement alloc];
    uint64_t v23 = PKLocalizedIdentityString(&cfstr_DriverLicenseN.isa);
    id v24 = [v21 stringFromPersonNameComponents:v20];
    uint64_t v25 = [(PKIdentityDocumentDataElement *)v22 initWithLocalizedLabel:v23 text:v24];

    [v218 addObject:v25];
    uint64_t v13 = (PKIdentityDocumentDataElement *)v25;
  }
  id v26 = objc_alloc_init(MEMORY[0x1E4F1BA58]);
  id v27 = [v6 objectForKey:*MEMORY[0x1E4F872D0]];
  id v28 = [v27 stringValue];
  v29 = objc_msgSend(v28, "pk_zString");
  [v26 setStreet:v29];

  id v30 = [v6 objectForKey:*MEMORY[0x1E4F872F0]];
  uint64_t v31 = [v30 stringValue];
  id v32 = objc_msgSend(v31, "pk_zString");
  [v26 setCity:v32];

  id v33 = [v6 objectForKey:*MEMORY[0x1E4F872F8]];
  uint64_t v34 = [v33 stringValue];
  id v35 = objc_msgSend(v34, "pk_zString");

  [v26 setISOCountryCode:v35];
  long long v36 = [v6 objectForKey:*MEMORY[0x1E4F873B0]];
  uint64_t v37 = [v36 stringValue];
  id v38 = objc_msgSend(v37, "pk_zString");

  id v39 = v35;
  v201 = v39;
  if (v39 == @"US"
    || (v40 = v39) != 0
    && (uint64_t v41 = [(__CFString *)v39 caseInsensitiveCompare:@"US"], v40,
                                                                                                  !v41))
  {
    if ([v38 length] == 9)
    {
      char v42 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
      uint64_t v43 = [v42 invertedSet];

      if ([v38 rangeOfCharacterFromSet:v43] == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v44 = [v38 substringToIndex:5];
        uint64_t v45 = objc_msgSend(v44, "pk_zString");

        v46 = [v38 substringFromIndex:5];
        objc_msgSend(v46, "pk_zString");
        id v48 = v47 = v26;

        uint64_t v49 = PKLocalizedIdentityString(&cfstr_DriverLicenseZ.isa, &stru_1EF1B5770.isa, v45, v48);
        uint64_t v50 = objc_msgSend(v49, "pk_zString");
        char v51 = v38;
        id v38 = (void *)v50;

        id v26 = v47;
      }
    }
  }
  [v26 setPostalCode:v38];
  v52 = [v6 objectForKey:*MEMORY[0x1E4F873D0]];
  char v53 = [v52 stringValue];
  v54 = objc_msgSend(v53, "pk_zString");
  [v26 setState:v54];

  char v55 = [MEMORY[0x1E4F1BA88] stringFromPostalAddress:v26 style:0];
  v202 = v26;
  if ([v55 length])
  {
    v56 = [PKIdentityDocumentDataElement alloc];
    char v57 = PKLocalizedIdentityString(&cfstr_DriverLicenseA.isa);
    uint64_t v58 = [(PKIdentityDocumentDataElement *)v56 initWithLocalizedLabel:v57 text:v55];

    id v59 = v218;
    [v218 addObject:v58];
    uint64_t v13 = (PKIdentityDocumentDataElement *)v58;
  }
  else
  {
    id v59 = v218;
  }
  _PKAddDateToElements(v6, v59, *MEMORY[0x1E4F87300], @"DRIVER_LICENSE_DOB");
  v60 = [v6 objectForKey:*MEMORY[0x1E4F872D8]];
  v61 = [v60 numberValue];

  v199 = v55;
  v212 = v61;
  if (v61)
  {
    if (objc_msgSend(v61, "pk_isNotANumber"))
    {
      uint64_t v62 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v262 = v61;
        _os_log_impl(&dword_19F450000, v62, OS_LOG_TYPE_DEFAULT, "Age in years is not a number %@", buf, 0xCu);
      }
    }
    else
    {
      v63 = [PKIdentityDocumentDataElement alloc];
      v64 = PKLocalizedIdentityString(&cfstr_DriverLicenseA_0.isa);
      id v65 = [MEMORY[0x1E4F28EE0] localizedStringFromNumber:v212 numberStyle:0];
      uint64_t v66 = [(PKIdentityDocumentDataElement *)v63 initWithLocalizedLabel:v64 text:v65];

      [v218 addObject:v66];
      uint64_t v13 = (PKIdentityDocumentDataElement *)v66;
    }
  }
  id v217 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v67 = [v7 objectForKey:*MEMORY[0x1E4F873C8]];
  long long v68 = [v67 numberValue];

  if (v68)
  {
    if (objc_msgSend(v68, "pk_isNotANumber"))
    {
      long long v69 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v262 = v68;
        uint64_t v70 = "Sex is not a number %@";
LABEL_35:
        _os_log_impl(&dword_19F450000, v69, OS_LOG_TYPE_DEFAULT, v70, buf, 0xCu);
        goto LABEL_36;
      }
      goto LABEL_36;
    }
  }
  else
  {
    v71 = [v6 objectForKey:*MEMORY[0x1E4F873C0]];
    long long v68 = [v71 numberValue];

    if (!v68)
    {
LABEL_37:
      uint64_t v72 = 0;
      goto LABEL_39;
    }
    if (objc_msgSend(v68, "pk_isNotANumber"))
    {
      long long v69 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v262 = v68;
        uint64_t v70 = "Sex(AAMVA) is not a number %@";
        goto LABEL_35;
      }
LABEL_36:

      goto LABEL_37;
    }
  }
  uint64_t v72 = SexDisplayableValueFromInteger([v68 unsignedIntegerValue]);
LABEL_39:
  v198 = v68;
  v200 = v38;
  v197 = v72;
  if ([v72 length])
  {
    v73 = [PKIdentityDocumentDataElement alloc];
    v74 = PKLocalizedIdentityString(&cfstr_DriverLicenseS.isa);
    uint64_t v75 = [(PKIdentityDocumentDataElement *)v73 initWithLocalizedLabel:v74 text:v72];

    [v217 addObject:v75];
    uint64_t v13 = (PKIdentityDocumentDataElement *)v75;
  }
  v76 = (void *)MEMORY[0x1E4F1CA20];
  v77 = [MEMORY[0x1E4F1CA20] currentLocale];
  v78 = [v77 localeIdentifier];
  v79 = [v76 componentsFromLocaleIdentifier:v78];
  v80 = (void *)[v79 mutableCopy];

  v81 = [(PKSecureElementPass *)self->_pass issuerCountryCode];
  [v80 setObject:v81 forKey:*MEMORY[0x1E4F1C400]];

  v196 = v80;
  v195 = [MEMORY[0x1E4F1CA20] localeIdentifierFromComponents:v80];
  uint64_t v82 = [objc_alloc(MEMORY[0x1E4F1CA20]) initWithLocaleIdentifier:v195];
  id v83 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  [v83 setLocale:v82];
  [v83 setNumberStyle:0];
  id v84 = objc_alloc_init(MEMORY[0x1E4F28E30]);
  v211 = (void *)v82;
  [v84 setLocale:v82];
  v193 = v84;
  [v84 setNumberFormatter:v83];
  id v85 = objc_alloc_init(MEMORY[0x1E4F28DE8]);
  [v85 setUnitStyle:1];
  [v85 setForPersonHeightUse:1];
  v210 = v85;
  v194 = v83;
  [v85 setNumberFormatter:v83];
  uint64_t v86 = *MEMORY[0x1E4F87348];
  v87 = [v6 objectForKey:*MEMORY[0x1E4F87348]];
  v88 = [v87 numberValue];

  v192 = v88;
  if (v88)
  {
    unint64_t v89 = 0x1E4F1C000;
    if (objc_msgSend(v88, "pk_isNotANumber"))
    {
      v90 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
      {
        id v91 = [v6 objectForKey:v86];
        *(_DWORD *)long long buf = 138412290;
        id v262 = v91;
        _os_log_impl(&dword_19F450000, v90, OS_LOG_TYPE_DEFAULT, "Height is not a number %@", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v92 = [v88 unsignedIntegerValue];
      if ((unint64_t)(v92 - 1) > 0x3E6)
      {
        v90 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_19F450000, v90, OS_LOG_TYPE_DEFAULT, "Height is not a valid number", buf, 2u);
        }
      }
      else
      {
        unint64_t v93 = v92;
        id v94 = objc_alloc(MEMORY[0x1E4F28E28]);
        v95 = [MEMORY[0x1E4F291E0] centimeters];
        v90 = [v94 initWithDoubleValue:v95 unit:(double)v93];

        if ([v211 usesMetricSystem])
        {
          v96 = [MEMORY[0x1E4F291E0] meters];
          v97 = [v90 measurementByConvertingToUnit:v96];
        }
        else
        {
          v98 = [MEMORY[0x1E4F291E0] inches];
          v96 = [v90 measurementByConvertingToUnit:v98];

          id v99 = objc_alloc(MEMORY[0x1E4F28E28]);
          [v96 doubleValue];
          double v101 = round(v100);
          v102 = [MEMORY[0x1E4F291E0] inches];
          v103 = (void *)[v99 initWithDoubleValue:v102 unit:v101];

          v104 = [MEMORY[0x1E4F291E0] meters];
          v97 = [v103 measurementByConvertingToUnit:v104];
        }
        [v97 doubleValue];
        v105 = objc_msgSend(v210, "stringFromMeters:");
        v106 = [PKIdentityDocumentDataElement alloc];
        v107 = PKLocalizedIdentityString(&cfstr_DriverLicenseH.isa);
        uint64_t v108 = [(PKIdentityDocumentDataElement *)v106 initWithLocalizedLabel:v107 text:v105];

        [v217 addObject:v108];
        uint64_t v13 = (PKIdentityDocumentDataElement *)v108;
        unint64_t v89 = 0x1E4F1C000uLL;
      }
    }
  }
  else
  {
    unint64_t v89 = 0x1E4F1C000;
  }
  _PKAddStringToElements(v6, v217, *MEMORY[0x1E4F87320], @"DRIVER_LICENSE_EYE_COLOR");
  _PKAddStringToElements(v6, v217, *MEMORY[0x1E4F87340], @"DRIVER_LICENSE_HAIR_COLOR");
  id v191 = objc_alloc_init(*(Class *)(v89 + 2632));
  id v109 = objc_alloc_init(*(Class *)(v89 + 2632));
  _PKAddStringToElements(v6, v109, *MEMORY[0x1E4F87350], @"DRIVER_LICENSE_ID_NUMBER");
  _PKAddStringToElements(v6, v109, *MEMORY[0x1E4F87358], @"DRIVER_LICENSE_ISSUING_AUTHORITY");
  _PKAddDateToElements(v6, v109, *MEMORY[0x1E4F87368], @"DRIVER_LICENSE_ID_ISSUE_DATE");
  v216 = v109;
  _PKAddDateToElements(v6, v109, *MEMORY[0x1E4F87318], @"DRIVER_LICENSE_ID_EXPIRATION_DATE");
  v110 = [v7 objectForKey:*MEMORY[0x1E4F873B8]];
  v111 = [v110 stringValue];
  v112 = v111;
  v113 = @"DRIVER_LICENSE_ATTRIBUTE_YES";
  if (v111 != @"F")
  {
    if (v111)
    {
      if (![@"F" isEqualToString:v111]) {
        v113 = @"DRIVER_LICENSE_ATTRIBUTE_NO";
      }
    }
    else
    {
      v113 = @"DRIVER_LICENSE_ATTRIBUTE_NO";
    }
  }

  v114 = [PKIdentityDocumentDataElement alloc];
  v115 = PKLocalizedIdentityString(&cfstr_DriverLicenseR.isa);
  v116 = PKLocalizedIdentityString(&v113->isa);
  v117 = [(PKIdentityDocumentDataElement *)v114 initWithLocalizedLabel:v115 text:v116];

  v118 = v216;
  [v216 addObject:v117];
  v119 = [v7 objectForKey:*MEMORY[0x1E4F873E0]];
  v120 = [v119 numberValue];

  v190 = v120;
  if ([v120 isEqualToNumber:&unk_1EF2B8D78])
  {
    v121 = PKLocalizedIdentityString(&cfstr_DriverLicenseA_1.isa);
    v122 = off_1E59C3000;
    v123 = [PKIdentityDocumentDataElement alloc];
    v124 = PKLocalizedIdentityString(&cfstr_DriverLicenseV.isa);
    uint64_t v125 = [(PKIdentityDocumentDataElement *)v123 initWithLocalizedLabel:v124 text:v121];

    v118 = v216;
    [v216 addObject:v125];

    v117 = (PKIdentityDocumentDataElement *)v125;
  }
  else
  {
    v122 = off_1E59C3000;
  }
  v126 = v214;
  v127 = v218;
  id v213 = objc_alloc_init(*(Class *)(v89 + 2632));
  id v128 = objc_alloc_init(*(Class *)(v89 + 2632));
  id v229 = objc_alloc_init(*(Class *)(v89 + 2632));
  uint64_t v129 = [v7 objectForKey:*MEMORY[0x1E4F87308]];
  v219 = v128;
  v207 = v7;
  v208 = v6;
  v189 = (void *)v129;
  if (v129)
  {
    v130 = (void *)v129;
    if (objc_opt_respondsToSelector())
    {
      v131 = [v130 performSelector:sel_arrayValue];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_70:
        v133 = v213;
        long long v254 = 0u;
        long long v255 = 0u;
        long long v256 = 0u;
        long long v257 = 0u;
        id v134 = v131;
        uint64_t v231 = [v134 countByEnumeratingWithState:&v254 objects:v260 count:16];
        if (!v231)
        {
          v232 = v133;
          goto LABEL_140;
        }
        uint64_t v135 = *(void *)v255;
        v232 = v133;
        v225 = v133;
        uint64_t v230 = *(void *)v255;
        id v220 = v134;
        while (1)
        {
          for (uint64_t i = 0; i != v231; uint64_t i = v162 + 1)
          {
            if (*(void *)v255 != v135) {
              objc_enumerationMutation(v134);
            }
            uint64_t v233 = i;
            v137 = *(void **)(*((void *)&v254 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v138 = [v137 objectForKey:@"vehicle_category_code"];
              objc_opt_class();
              v234 = v138;
              if ((objc_opt_isKindOfClass() & 1) != 0 && [v138 length])
              {
                id v139 = objc_alloc(v122[212]);
                v140 = PKLocalizedIdentityString(&cfstr_DriverLicenseD_0.isa);
                uint64_t v141 = [v139 initWithLocalizedLabel:v140 text:v138];

                v133 = v225;
                [v232 addObject:v141];
                v117 = (PKIdentityDocumentDataElement *)v141;
                goto LABEL_106;
              }
              v143 = [v137 objectForKey:@"domestic_vehicle_class"];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v144 = [v143 objectForKey:@"domestic_vehicle_class_code"];
              }
              else
              {
                id v144 = 0;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0 || ![v144 length])
              {
                v160 = v144;
                v161 = PKLogFacilityTypeGetObject();
                if (os_log_type_enabled(v161, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)long long buf = 138412290;
                  id v262 = v143;
                  _os_log_impl(&dword_19F450000, v161, OS_LOG_TYPE_DEFAULT, "Invalid vehicle class: %@", buf, 0xCu);
                }

LABEL_106:
                uint64_t v135 = v230;
                uint64_t v162 = v233;
LABEL_134:

                continue;
              }
              id v145 = v144;
              id v146 = objc_alloc(v122[212]);
              v147 = PKLocalizedIdentityString(&cfstr_DriverLicenseD_0.isa);
              v224 = v145;
              uint64_t v148 = [v146 initWithLocalizedLabel:v147 text:v145];

              uint64_t v149 = (uint64_t)v122;
              v226 = (void *)v148;
              [v232 addObject:v148];
              v150 = [v137 objectForKey:@"domestic_vehicle_restrictions"];
              objc_opt_class();
              v228 = v150;
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_108;
              }
              long long v252 = 0u;
              long long v253 = 0u;
              long long v250 = 0u;
              long long v251 = 0u;
              id v151 = v150;
              uint64_t v152 = [v151 countByEnumeratingWithState:&v250 objects:v259 count:16];
              if (!v152)
              {

                goto LABEL_108;
              }
              uint64_t v153 = v152;
              v221 = v143;
              v154 = 0;
              uint64_t v155 = *(void *)v251;
              do
              {
                for (uint64_t j = 0; j != v153; ++j)
                {
                  if (*(void *)v251 != v155) {
                    objc_enumerationMutation(v151);
                  }
                  v157 = *(void **)(*((void *)&v250 + 1) + 8 * j);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0
                    && ([v157 objectForKey:@"domestic_vehicle_restriction_code"],
                        v158 = (id)objc_claimAutoreleasedReturnValue(),
                        v158,
                        v158))
                  {
                    if (v154)
                    {
                      uint64_t v159 = [v154 stringByAppendingFormat:@", %@", v158];

                      v154 = (void *)v159;
                    }
                    else
                    {
                      v158 = v158;
                      v154 = v158;
                    }
                  }
                  else
                  {
                    v158 = PKLogFacilityTypeGetObject();
                    if (os_log_type_enabled(v158, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)long long buf = 138412290;
                      id v262 = v157;
                      _os_log_impl(&dword_19F450000, v158, OS_LOG_TYPE_DEFAULT, "Invalid vehicle restrictions: %@", buf, 0xCu);
                    }
                  }
                }
                uint64_t v153 = [v151 countByEnumeratingWithState:&v250 objects:v259 count:16];
              }
              while (v153);

              uint64_t v149 = 0x1E59C3000;
              id v128 = v219;
              v143 = v221;
              if (!v154)
              {
LABEL_108:
                v154 = PKLocalizedIdentityString(&cfstr_DriverLicenseD_1.isa);
              }
              id v163 = objc_alloc(*(Class *)(v149 + 1696));
              v164 = PKLocalizedIdentityString(&cfstr_DriverLicenseD_2.isa);
              uint64_t v165 = [v163 initWithLocalizedLabel:v164 text:v154];

              v223 = (void *)v165;
              [v232 addObject:v165];
              v166 = [v137 objectForKey:@"domestic_vehicle_endorsements"];
              objc_opt_class();
              v227 = v166;
              if ((objc_opt_isKindOfClass() & 1) == 0) {
                goto LABEL_127;
              }
              long long v248 = 0u;
              long long v249 = 0u;
              long long v246 = 0u;
              long long v247 = 0u;
              id v167 = v166;
              uint64_t v168 = [v167 countByEnumeratingWithState:&v246 objects:v258 count:16];
              if (!v168)
              {

                goto LABEL_127;
              }
              uint64_t v169 = v168;
              v222 = v143;
              v170 = 0;
              uint64_t v171 = *(void *)v247;
              do
              {
                for (uint64_t k = 0; k != v169; ++k)
                {
                  if (*(void *)v247 != v171) {
                    objc_enumerationMutation(v167);
                  }
                  v173 = *(void **)(*((void *)&v246 + 1) + 8 * k);
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0
                    && ([v173 objectForKey:@"domestic_vehicle_endorsement_code"],
                        v174 = (id)objc_claimAutoreleasedReturnValue(),
                        v174,
                        v174))
                  {
                    if (v170)
                    {
                      uint64_t v175 = [v170 stringByAppendingFormat:@", %@", v174];

                      v170 = (void *)v175;
                    }
                    else
                    {
                      v174 = v174;
                      v170 = v174;
                    }
                  }
                  else
                  {
                    v174 = PKLogFacilityTypeGetObject();
                    if (os_log_type_enabled(v174, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)long long buf = 138412290;
                      id v262 = v173;
                      _os_log_impl(&dword_19F450000, v174, OS_LOG_TYPE_DEFAULT, "Invalid vehicle endorsements: %@", buf, 0xCu);
                    }
                  }
                }
                uint64_t v169 = [v167 countByEnumeratingWithState:&v246 objects:v258 count:16];
              }
              while (v169);

              uint64_t v149 = 0x1E59C3000;
              id v128 = v219;
              v143 = v222;
              if (!v170)
              {
LABEL_127:
                v170 = PKLocalizedIdentityString(&cfstr_DriverLicenseD_1.isa);
              }
              v122 = (__objc2_class **)v149;
              id v176 = objc_alloc(*(Class *)(v149 + 1696));
              v177 = PKLocalizedIdentityString(&cfstr_DriverLicenseD_3.isa);
              uint64_t v178 = [v176 initWithLocalizedLabel:v177 text:v170];

              v117 = (PKIdentityDocumentDataElement *)v178;
              [v232 addObject:v178];

              id v134 = v220;
              v133 = v225;
              uint64_t v135 = v230;
              v142 = v234;
              goto LABEL_129;
            }
            v142 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v142, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 138412290;
              id v262 = v137;
              _os_log_impl(&dword_19F450000, v142, OS_LOG_TYPE_DEFAULT, "Invalid driving privilege: %@", buf, 0xCu);
            }
LABEL_129:

            uint64_t v162 = v233;
            if ([v133 count])
            {
              v234 = v128;
            }
            else
            {
              v234 = v232;
            }
            if ([v128 count])
            {
              v232 = v229;
              goto LABEL_134;
            }
            v232 = v234;
          }
          uint64_t v231 = [v134 countByEnumeratingWithState:&v254 objects:v260 count:16];
          if (!v231)
          {
LABEL_140:

            v126 = v214;
            v127 = v218;
            v118 = v216;
            goto LABEL_141;
          }
        }
      }

      v132 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v262 = 0;
        _os_log_impl(&dword_19F450000, v132, OS_LOG_TYPE_DEFAULT, "Invalid driving privileges: %@", buf, 0xCu);
      }
    }
    v131 = 0;
    goto LABEL_70;
  }
LABEL_141:
  v179 = MEMORY[0x1E4F14428];
  id v180 = MEMORY[0x1E4F14428];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__PKIdentityDocumentDetailsViewController__formatDataElementsForISO18013_withCompletion___block_invoke;
  block[3] = &unk_1E59D08D0;
  block[4] = self;
  id v235 = v126;
  id v237 = v235;
  id v181 = v127;
  id v238 = v181;
  id v182 = v217;
  id v239 = v182;
  id v183 = v191;
  id v240 = v183;
  id v184 = v118;
  id v241 = v184;
  id v185 = v213;
  id v242 = v185;
  id v186 = v219;
  id v243 = v186;
  id v187 = v229;
  id v244 = v187;
  id v188 = v203;
  id v245 = v188;
  dispatch_async(v179, block);
}

uint64_t __89__PKIdentityDocumentDetailsViewController__formatDataElementsForISO18013_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 1104);
  *(void *)(v3 + 1104) = v2;

  uint64_t v5 = [*(id *)(a1 + 48) copy];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 1112);
  *(void *)(v6 + 1112) = v5;

  uint64_t v8 = [*(id *)(a1 + 56) copy];
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(v9 + 1120);
  *(void *)(v9 + 1120) = v8;

  uint64_t v11 = [*(id *)(a1 + 64) copy];
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void **)(v12 + 1128);
  *(void *)(v12 + 1128) = v11;

  uint64_t v14 = [*(id *)(a1 + 72) copy];
  uint64_t v15 = *(void *)(a1 + 32);
  long long v16 = *(void **)(v15 + 1136);
  *(void *)(v15 + 1136) = v14;

  uint64_t v17 = [*(id *)(a1 + 80) copy];
  uint64_t v18 = *(void *)(a1 + 32);
  id v19 = *(void **)(v18 + 1144);
  *(void *)(v18 + 1144) = v17;

  uint64_t v20 = [*(id *)(a1 + 88) copy];
  uint64_t v21 = *(void *)(a1 + 32);
  id v22 = *(void **)(v21 + 1152);
  *(void *)(v21 + 1152) = v20;

  uint64_t v23 = [*(id *)(a1 + 96) copy];
  uint64_t v24 = *(void *)(a1 + 32);
  uint64_t v25 = *(void **)(v24 + 1160);
  *(void *)(v24 + 1160) = v23;

  if ([*(id *)(a1 + 32) isViewLoaded])
  {
    id v26 = [*(id *)(a1 + 32) tableView];
    [v26 reloadData];
  }
  uint64_t result = *(void *)(a1 + 104);
  if (result)
  {
    id v28 = *(uint64_t (**)(void))(result + 16);
    return v28();
  }
  return result;
}

- (void)_formatDataElementsForISO23220:(id)a3 withCompletion:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v53 = a4;
  uint64_t v5 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v6 = a3;
  id v7 = objc_alloc_init(v5);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v52 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v9 = [v6 objectForKey:*MEMORY[0x1E4F87428]];
  uint64_t v10 = [v6 objectForKey:*MEMORY[0x1E4F87420]];

  id v11 = objc_alloc(MEMORY[0x1E4FB1818]);
  uint64_t v12 = [v10 objectForKey:*MEMORY[0x1E4F87430]];
  uint64_t v13 = [v12 dataValue];
  uint64_t v14 = [v11 initWithData:v13];

  v56 = (void *)v14;
  if (v14)
  {
    uint64_t v15 = [[PKIdentityDocumentDataElement alloc] initWithImage:v14];
    [v7 addObject:v15];
  }
  else
  {
    uint64_t v15 = 0;
  }
  char v55 = v7;
  long long v16 = [v10 objectForKey:*MEMORY[0x1E4F87408]];
  uint64_t v17 = [v16 stringValue];
  uint64_t v18 = objc_msgSend(v17, "pk_zString");

  char v51 = v18;
  if ([v18 length])
  {
    id v19 = objc_alloc_init(MEMORY[0x1E4F28F30]);
    [v19 setFamilyName:v18];
    id v20 = objc_alloc_init(MEMORY[0x1E4F28F38]);
    uint64_t v21 = [PKIdentityDocumentDataElement alloc];
    id v22 = PKLocalizedIdentityString(&cfstr_DriverLicenseN.isa);
    uint64_t v23 = [v20 stringFromPersonNameComponents:v19];
    uint64_t v24 = [(PKIdentityDocumentDataElement *)v21 initWithLocalizedLabel:v22 text:v23];

    [v8 addObject:v24];
    uint64_t v15 = (PKIdentityDocumentDataElement *)v24;
  }
  uint64_t v25 = [v10 objectForKey:*MEMORY[0x1E4F87418]];
  id v26 = [v25 stringValue];
  id v27 = objc_msgSend(v26, "pk_zString");

  if ([v27 length])
  {
    id v28 = [PKIdentityDocumentDataElement alloc];
    v29 = PKLocalizedIdentityString(&cfstr_DriverLicenseA.isa);
    uint64_t v30 = [(PKIdentityDocumentDataElement *)v28 initWithLocalizedLabel:v29 text:v27];

    [v8 addObject:v30];
    uint64_t v15 = (PKIdentityDocumentDataElement *)v30;
  }
  _PKAddDateToElements(v9, v8, *MEMORY[0x1E4F87400], @"DRIVER_LICENSE_DOB");
  uint64_t v31 = [v9 objectForKey:*MEMORY[0x1E4F873F8]];
  id v32 = [v31 numberValue];

  uint64_t v49 = v27;
  if (v32)
  {
    if (objc_msgSend(v32, "pk_isNotANumber", v27, v51))
    {
      id v33 = PKLogFacilityTypeGetObject();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        v63 = v32;
        _os_log_impl(&dword_19F450000, v33, OS_LOG_TYPE_DEFAULT, "Age in years is not a number %@", buf, 0xCu);
      }
    }
    else
    {
      uint64_t v34 = [PKIdentityDocumentDataElement alloc];
      id v35 = PKLocalizedIdentityString(&cfstr_DriverLicenseA_0.isa);
      long long v36 = [MEMORY[0x1E4F28EE0] localizedStringFromNumber:v32 numberStyle:0];
      uint64_t v37 = [(PKIdentityDocumentDataElement *)v34 initWithLocalizedLabel:v35 text:v36];

      [v8 addObject:v37];
      uint64_t v15 = (PKIdentityDocumentDataElement *)v37;
    }
  }
  id v38 = v9;
  id v39 = objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E4F87438], v49);
  v40 = [v39 numberValue];

  uint64_t v41 = SexDisplayableValueFromInteger([v40 unsignedIntegerValue]);
  if ([v41 length])
  {
    char v42 = [PKIdentityDocumentDataElement alloc];
    uint64_t v43 = PKLocalizedIdentityString(&cfstr_DriverLicenseS.isa);
    uint64_t v44 = [(PKIdentityDocumentDataElement *)v42 initWithLocalizedLabel:v43 text:v41];

    [v8 addObject:v44];
    uint64_t v15 = (PKIdentityDocumentDataElement *)v44;
  }
  _PKAddStringToElements(v10, v52, *MEMORY[0x1E4F87410], @"NATIONAL_ID_JP_INDIVIDUAL_NUMBER");
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__PKIdentityDocumentDetailsViewController__formatDataElementsForISO23220_withCompletion___block_invoke;
  block[3] = &unk_1E59CF3E0;
  block[4] = self;
  id v58 = v55;
  id v59 = v8;
  id v60 = v52;
  id v61 = v53;
  id v45 = v53;
  id v46 = v52;
  id v47 = v8;
  id v48 = v55;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __89__PKIdentityDocumentDetailsViewController__formatDataElementsForISO23220_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 1104);
  *(void *)(v3 + 1104) = v2;

  uint64_t v5 = [*(id *)(a1 + 48) copy];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 1112);
  *(void *)(v6 + 1112) = v5;

  uint64_t v8 = [*(id *)(a1 + 56) copy];
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(v9 + 1120);
  *(void *)(v9 + 1120) = v8;

  if ([*(id *)(a1 + 32) isViewLoaded])
  {
    id v11 = [*(id *)(a1 + 32) tableView];
    [v11 reloadData];
  }
  uint64_t result = *(void *)(a1 + 64);
  if (result)
  {
    uint64_t v13 = *(uint64_t (**)(void))(result + 16);
    return v13();
  }
  return result;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PKIdentityDocumentDetailsViewController;
  [(PKSectionTableViewController *)&v4 viewDidLoad];
  uint64_t v3 = [(PKIdentityDocumentDetailsViewController *)self tableView];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"PortraitCellIdentifier"];
  [v3 registerClass:objc_opt_class() forCellReuseIdentifier:@"DataElementCellIdentifier"];
  [v3 reloadData];
}

- (id)_elementsForSection:(unint64_t)a3
{
  if (a3 > 7)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = *(id *)((char *)&self->super.super.super.super.super.isa + *off_1E59D0910[a3]);
  }
  return v4;
}

- (id)_elementAtIndexPath:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[PKIdentityDocumentDetailsViewController _elementsForSection:](self, "_elementsForSection:", -[PKSectionTableViewController sectionForIndex:](self, "sectionForIndex:", [v4 section]));
  unint64_t v6 = [v4 row];

  if ([v5 count] <= v6)
  {
    id v7 = 0;
  }
  else
  {
    id v7 = [v5 objectAtIndex:v6];
  }

  return v7;
}

- (BOOL)shouldMapSection:(unint64_t)a3
{
  uint64_t v3 = [(PKIdentityDocumentDetailsViewController *)self _elementsForSection:a3];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  BOOL v4 = [(PKIdentityDocumentDetailsViewController *)self _elementsForSection:[(PKSectionTableViewController *)self sectionForIndex:a4]];
  int64_t v5 = [v4 count];

  return v5;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 0;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PKIdentityDocumentDetailsViewController *)self _elementAtIndexPath:v7];
  uint64_t v9 = v8;
  if (v8)
  {
    if ([v8 type] == 1)
    {
      uint64_t v10 = [v6 dequeueReusableCellWithIdentifier:@"PortraitCellIdentifier" forIndexPath:v7];
      id v11 = [v10 imageView];
      uint64_t v12 = [v9 image];
      [v11 setImage:v12];

      objc_msgSend(v11, "pkui_setExcludedFromScreenCapture:andBroadcasting:", 1, 1);
    }
    else
    {
      uint64_t v10 = [v6 dequeueReusableCellWithIdentifier:@"DataElementCellIdentifier" forIndexPath:v7];
      id v11 = [MEMORY[0x1E4FB1948] subtitleCellConfiguration];
      uint64_t v13 = [v9 localizedLabel];
      [v11 setText:v13];

      uint64_t v14 = [v9 attributedText];

      if (v14)
      {
        uint64_t v15 = [v9 attributedText];
        [v11 setSecondaryAttributedText:v15];
      }
      else
      {
        uint64_t v15 = [v9 text];
        [v11 setSecondaryText:v15];
      }

      long long v16 = [v11 textProperties];
      uint64_t v17 = (void *)MEMORY[0x1E4FB08E0];
      uint64_t v18 = *MEMORY[0x1E4FB2950];
      id v19 = [v6 traitCollection];
      id v20 = [v17 preferredFontForTextStyle:v18 compatibleWithTraitCollection:v19];
      [v16 setFont:v20];

      uint64_t v21 = [v11 secondaryTextProperties];
      id v22 = (void *)MEMORY[0x1E4FB08E0];
      uint64_t v23 = *MEMORY[0x1E4FB28C8];
      uint64_t v24 = [v6 traitCollection];
      uint64_t v25 = [v22 preferredFontForTextStyle:v23 compatibleWithTraitCollection:v24];
      [v21 setFont:v25];

      id v26 = [v11 secondaryTextProperties];
      [v26 setNumberOfLines:0];

      objc_msgSend(v11, "setDirectionalLayoutMargins:", 8.0, 0.0, 8.0, 0.0);
      [v11 setAxesPreservingSuperviewLayoutMargins:1];
      [v11 setTextToSecondaryTextVerticalPadding:4.0];
      LODWORD(v26) = self->_inBridge;
      id v27 = [v11 textProperties];
      if (v26)
      {
        id v28 = PKBridgeAltTextColor();
        [v27 setColor:v28];

        v29 = [v11 secondaryTextProperties];
        PKBridgeTextColor();
      }
      else
      {
        uint64_t v30 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
        [v27 setColor:v30];

        v29 = [v11 secondaryTextProperties];
        [MEMORY[0x1E4FB1618] labelColor];
      uint64_t v31 = };
      [v29 setColor:v31];

      [v10 setContentConfiguration:v11];
      id v32 = [v10 contentView];
      objc_msgSend(v32, "pkui_setExcludedFromScreenCapture:andBroadcasting:", 1, 1);
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  BOOL v4 = [(PKIdentityDocumentDetailsViewController *)self _elementAtIndexPath:a4];
  if ([v4 type] == 1) {
    double v5 = 80.0;
  }
  else {
    double v5 = *MEMORY[0x1E4FB2F28];
  }

  return v5;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  unint64_t v4 = [(PKSectionTableViewController *)self sectionForIndex:a4];
  if (v4 == 5)
  {
    double v5 = @"DRIVER_LICENSE_DRIVING_PRIVILEGES";
    goto LABEL_5;
  }
  if (v4 == 3)
  {
    double v5 = @"DRIVER_LICENSE_ID_INFORMATION";
LABEL_5:
    id v6 = PKLocalizedIdentityString(&v5->isa);
    goto LABEL_7;
  }
  id v6 = 0;
LABEL_7:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_LAContext, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_drivingPrivilegesElements3, 0);
  objc_storeStrong((id *)&self->_drivingPrivilegesElements2, 0);
  objc_storeStrong((id *)&self->_drivingPrivilegesElements1, 0);
  objc_storeStrong((id *)&self->_idInfoElements, 0);
  objc_storeStrong((id *)&self->_additionalElements, 0);
  objc_storeStrong((id *)&self->_personalElements, 0);
  objc_storeStrong((id *)&self->_criticalElements, 0);
  objc_storeStrong((id *)&self->_portraitElements, 0);

  objc_storeStrong((id *)&self->_pass, 0);
}

@end