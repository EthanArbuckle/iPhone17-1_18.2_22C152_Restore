@interface PSUIRemoveCellularPlanSpecifier
- (BOOL)popViewControllerOnPlanDeletion;
- (CTCellularPlanManager)cellularPlanManager;
- (PSListController)hostController;
- (PSUICellularPlanManagerCache)planManagerCache;
- (PSUICellularPlanUniversalReference)planReference;
- (PSUIRemoveCellularPlanSpecifier)initWithPlanUniversalReference:(id)a3 cellularPlanManager:(id)a4 planManagerCache:(id)a5 hostController:(id)a6 popViewControllerOnPlanDeletion:(BOOL)a7;
- (id)getLogger;
- (void)_didRemoveSessionComplete;
- (void)alignLeft;
- (void)prepareToShowRemap:(id)a3 completion:(id)a4;
- (void)remap:(id)a3 to:(id)a4 completion:(id)a5;
- (void)removeCellularPlan:(id)a3;
- (void)removeCellularPlanConfirmed:(id)a3;
- (void)setCellularPlanManager:(id)a3;
- (void)setHostController:(id)a3;
- (void)setPlanManagerCache:(id)a3;
- (void)setPlanReference:(id)a3;
- (void)setPopViewControllerOnPlanDeletion:(BOOL)a3;
- (void)showRemapFor:(id)a3 withList:(id)a4 completion:(id)a5;
@end

@implementation PSUIRemoveCellularPlanSpecifier

- (PSUIRemoveCellularPlanSpecifier)initWithPlanUniversalReference:(id)a3 cellularPlanManager:(id)a4 planManagerCache:(id)a5 hostController:(id)a6 popViewControllerOnPlanDeletion:(BOOL)a7
{
  id v13 = a3;
  id v38 = a4;
  id v37 = a5;
  id v14 = a6;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v17 = v16;
  if (isKindOfClass)
  {
    v18 = @"DELETE";
    v19 = @"Cellular";
  }
  else
  {
    v18 = @"DELETE_ESIM";
    v19 = @"Gemini-Gemini";
  }
  v20 = [v16 localizedStringForKey:v18 value:&stru_26D410CA0 table:v19];

  v39.receiver = self;
  v39.super_class = (Class)PSUIRemoveCellularPlanSpecifier;
  v21 = [(PSUIRemoveCellularPlanSpecifier *)&v39 initWithName:v20 target:self set:0 get:0 detail:0 cell:13 edit:0];
  v22 = v21;
  if (v21)
  {
    id v36 = v13;
    objc_storeStrong((id *)&v21->_planReference, a3);
    objc_storeStrong((id *)&v22->_cellularPlanManager, a4);
    objc_storeStrong((id *)&v22->_planManagerCache, a5);
    objc_storeWeak((id *)&v22->_hostController, v14);
    v22->_popViewControllerOnPlanDeletion = a7;
    [(PSUIRemoveCellularPlanSpecifier *)v22 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    [(PSUIRemoveCellularPlanSpecifier *)v22 setIdentifier:@"REMOVE_PLAN_BUTTON_ID"];
    v23 = [(PSUICellularPlanManagerCache *)v22->_planManagerCache planFromReference:v22->_planReference];
    v24 = [v23 plan];
    v25 = [v24 carrierName];

    v26 = [v23 phoneNumber];
    v27 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v28 = [v27 localizedStringForKey:@"DELETE_ESIM" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
    [(PSConfirmationSpecifier *)v22 setTitle:v28];

    if ([v25 length] && objc_msgSend(v26, "length"))
    {
      v29 = NSString;
      v30 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v31 = [v30 localizedStringForKey:@"DELETE_ESIM_MESSAGE_CARRIER_%@_%@" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
      v32 = objc_msgSend(v29, "stringWithFormat:", v31, v26, v25);
      [(PSConfirmationSpecifier *)v22 setPrompt:v32];
    }
    else
    {
      v30 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v31 = [v30 localizedStringForKey:@"DELETE_ESIM_MESSAGE" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
      [(PSConfirmationSpecifier *)v22 setPrompt:v31];
    }

    v33 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v34 = [v33 localizedStringForKey:@"CANCEL" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
    [(PSConfirmationSpecifier *)v22 setCancelButton:v34];

    [(PSUIRemoveCellularPlanSpecifier *)v22 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60000]];
    [(PSUIRemoveCellularPlanSpecifier *)v22 setConfirmationAction:sel_removeCellularPlan_];

    id v13 = v36;
  }

  return v22;
}

- (void)alignLeft
{
}

- (void)removeCellularPlan:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v4 = [(PSUIRemoveCellularPlanSpecifier *)self getLogger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v14 = "-[PSUIRemoveCellularPlanSpecifier removeCellularPlan:]";
    _os_log_impl(&dword_221B17000, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v5 = [MEMORY[0x263F5FB40] preferenceSpecifierNamed:0 target:self set:0 get:0 detail:0 cell:13 edit:0];
  v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v7 = [v6 localizedStringForKey:@"DELETE_ESIM" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
  [v5 setTitle:v7];

  v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"DELETE_ESIM_CONFIRMATION" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
  [v5 setPrompt:v9];

  v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v11 = [v10 localizedStringForKey:@"CANCEL" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
  [v5 setCancelButton:v11];

  [v5 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F60000]];
  [v5 setConfirmationAction:sel_removeCellularPlanConfirmed_];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  [WeakRetained showConfirmationViewForSpecifier:v5];
}

- (void)removeCellularPlanConfirmed:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(PSUIRemoveCellularPlanSpecifier *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[PSUIRemoveCellularPlanSpecifier removeCellularPlanConfirmed:]";
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v12 = 0x3032000000;
  id v13 = __Block_byref_object_copy__2;
  id v14 = __Block_byref_object_dispose__2;
  id v15 = 0;
  id v15 = [(PSUICellularPlanManagerCache *)self->_planManagerCache planFromReference:self->_planReference];
  id location = 0;
  objc_initWeak(&location, self);
  cellularPlanManager = self->_cellularPlanManager;
  uint64_t v7 = *(void *)(*((void *)&buf + 1) + 40);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __63__PSUIRemoveCellularPlanSpecifier_removeCellularPlanConfirmed___block_invoke;
  v8[3] = &unk_2645E1598;
  v8[4] = self;
  v8[5] = &buf;
  objc_copyWeak(&v9, &location);
  [(CTCellularPlanManager *)cellularPlanManager didDeletePlanItem:v7 completion:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  _Block_object_dispose(&buf, 8);
}

void __63__PSUIRemoveCellularPlanSpecifier_removeCellularPlanConfirmed___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    char v7 = [WeakRetained popViewControllerOnPlanDeletion];

    if ((v7 & 1) == 0)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __63__PSUIRemoveCellularPlanSpecifier_removeCellularPlanConfirmed___block_invoke_37;
      block[3] = &unk_2645E0CD0;
      objc_copyWeak(&v16, (id *)(a1 + 48));
      dispatch_async(MEMORY[0x263EF83A0], block);
      objc_destroyWeak(&v16);
    }
    id v8 = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __63__PSUIRemoveCellularPlanSpecifier_removeCellularPlanConfirmed___block_invoke_2;
    v13[3] = &unk_2645E0CD0;
    objc_copyWeak(&v14, (id *)(a1 + 48));
    [v8 prepareToShowRemap:v9 completion:v13];

    objc_destroyWeak(&v14);
  }
  else
  {
    v10 = [*(id *)(a1 + 32) getLogger];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v18 = v11;
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_impl(&dword_221B17000, v10, OS_LOG_TYPE_DEFAULT, "Failed to remove plan item %@. Error: %@", buf, 0x16u);
    }

    id v12 = objc_loadWeakRetained((id *)(a1 + 48));
    [v12 _didRemoveSessionComplete];
  }
}

void __63__PSUIRemoveCellularPlanSpecifier_removeCellularPlanConfirmed___block_invoke_37(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained hostController];
  [v1 reloadSpecifiers];
}

void __63__PSUIRemoveCellularPlanSpecifier_removeCellularPlanConfirmed___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didRemoveSessionComplete];
}

- (void)_didRemoveSessionComplete
{
  if ([(PSUIRemoveCellularPlanSpecifier *)self popViewControllerOnPlanDeletion])
  {
    id location = 0;
    objc_initWeak(&location, self);
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __60__PSUIRemoveCellularPlanSpecifier__didRemoveSessionComplete__block_invoke;
    v3[3] = &unk_2645E0CD0;
    objc_copyWeak(&v4, &location);
    dispatch_async(MEMORY[0x263EF83A0], v3);
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

void __60__PSUIRemoveCellularPlanSpecifier__didRemoveSessionComplete__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained hostController];
  v2 = [v1 navigationController];
  id v3 = (id)[v2 popViewControllerAnimated:1];
}

- (void)prepareToShowRemap:(id)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  char v7 = (void (**)(void))a4;
  id v8 = [(PSUIRemoveCellularPlanSpecifier *)self getLogger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    v29 = "-[PSUIRemoveCellularPlanSpecifier prepareToShowRemap:completion:]";
    _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  v10 = [(PSUICellularPlanManagerCache *)self->_planManagerCache planItems];
  uint64_t v11 = [v10 count];

  if (v11 == 1) {
    goto LABEL_17;
  }
  uint64_t v21 = self;
  v22 = v7;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = [(PSUICellularPlanManagerCache *)self->_planManagerCache planItems];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v17 isSelected])
        {
          uint64_t v18 = [v6 iccid];
          __int16 v19 = [v17 iccid];
          char v20 = [v18 isEqualToString:v19];

          if ((v20 & 1) == 0) {
            [v9 addObject:v17];
          }
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v14);
  }

  if (![v9 count])
  {
    char v7 = v22;
LABEL_17:
    v7[2](v7);
    goto LABEL_18;
  }
  char v7 = v22;
  [(PSUIRemoveCellularPlanSpecifier *)v21 showRemapFor:v6 withList:v9 completion:v22];
LABEL_18:
}

- (void)showRemapFor:(id)a3 withList:(id)a4 completion:(id)a5
{
  uint64_t v80 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v54 = a5;
  v10 = [(PSUIRemoveCellularPlanSpecifier *)self getLogger];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    v77 = "-[PSUIRemoveCellularPlanSpecifier showRemapFor:withList:completion:]";
    __int16 v78 = 2048;
    uint64_t v79 = [v9 count];
    _os_log_impl(&dword_221B17000, v10, OS_LOG_TYPE_DEFAULT, "%s active plans is  %lu", buf, 0x16u);
  }

  uint64_t v11 = NSString;
  id v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v13 = [v12 localizedStringForKey:@"REMAP_DETAIL_MESSAGE" value:&stru_26D410CA0 table:@"Cellular"];
  uint64_t v14 = [v11 stringWithFormat:v13];

  uint64_t v15 = (void *)MEMORY[0x263F82418];
  id v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v17 = (void *)v14;
  uint64_t v18 = [v16 localizedStringForKey:@"REMAP" value:&stru_26D410CA0 table:@"Cellular"];
  __int16 v19 = [v15 alertControllerWithTitle:v18 message:v14 preferredStyle:1];

  unint64_t v20 = 0x263F82000uLL;
  v50 = v17;
  if ([v9 count] == 1)
  {
    uint64_t v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v22 = [v21 localizedStringForKey:@"REMAP_TO_SINGLE_SIM" value:&stru_26D410CA0 table:@"Cellular"];

    long long v23 = (void *)MEMORY[0x263F82400];
    v71[0] = MEMORY[0x263EF8330];
    v71[1] = 3221225472;
    v71[2] = __68__PSUIRemoveCellularPlanSpecifier_showRemapFor_withList_completion___block_invoke;
    v71[3] = &unk_2645E15C0;
    v71[4] = self;
    id v72 = v8;
    id v73 = v9;
    long long v24 = v54;
    id v74 = v54;
    long long v25 = [v23 actionWithTitle:v22 style:0 handler:v71];
    [v19 addAction:v25];

    unint64_t v26 = 0x263F08000uLL;
LABEL_14:
    v40 = v9;
    v41 = &unk_221B9F000;
    goto LABEL_15;
  }
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id v22 = v9;
  uint64_t v55 = [v22 countByEnumeratingWithState:&v67 objects:v75 count:16];
  if (!v55)
  {
    long long v24 = v54;
    unint64_t v26 = 0x263F08000uLL;
    goto LABEL_14;
  }
  id v49 = v9;
  uint64_t v52 = *(void *)v68;
  v53 = self;
  id obj = v22;
  v27 = self;
  do
  {
    for (uint64_t i = 0; i != v55; ++i)
    {
      v29 = v19;
      uint64_t v30 = v8;
      if (*(void *)v68 != v52) {
        objc_enumerationMutation(obj);
      }
      v31 = *(void **)(*((void *)&v67 + 1) + 8 * i);
      v32 = NSString;
      v33 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v34 = [v33 localizedStringForKey:@"REMAP_TO_SIM_%@" value:&stru_26D410CA0 table:@"Cellular"];
      v35 = [v31 userLabel];
      id v36 = [v35 label];
      id v37 = objc_msgSend(v32, "stringWithFormat:", v34, v36);

      id v38 = (void *)MEMORY[0x263F82400];
      v63[0] = MEMORY[0x263EF8330];
      v63[1] = 3221225472;
      v63[2] = __68__PSUIRemoveCellularPlanSpecifier_showRemapFor_withList_completion___block_invoke_2;
      v63[3] = &unk_2645E15C0;
      v63[4] = v27;
      id v8 = v30;
      id v64 = v30;
      v65 = v31;
      id v66 = v54;
      objc_super v39 = [v38 actionWithTitle:v37 style:0 handler:v63];
      __int16 v19 = v29;
      [v29 addAction:v39];
    }
    uint64_t v55 = [obj countByEnumeratingWithState:&v67 objects:v75 count:16];
  }
  while (v55);
  v40 = v49;
  self = v53;
  long long v24 = v54;
  unint64_t v26 = 0x263F08000;
  v41 = (void *)&unk_221B9F000;
  unint64_t v20 = 0x263F82000;
  id v22 = obj;
LABEL_15:

  v42 = *(void **)(v20 + 1024);
  v43 = [*(id *)(v26 + 1760) bundleForClass:objc_opt_class()];
  v44 = [v43 localizedStringForKey:@"CANCEL" value:&stru_26D410CA0 table:@"Cellular"];
  uint64_t v58 = MEMORY[0x263EF8330];
  uint64_t v59 = v41[95];
  uint64_t v45 = v59;
  v60 = __68__PSUIRemoveCellularPlanSpecifier_showRemapFor_withList_completion___block_invoke_3;
  v61 = &unk_2645E15E8;
  id v62 = v24;
  id v46 = v24;
  v47 = [v42 actionWithTitle:v44 style:1 handler:&v58];
  [v19 addAction:v47];

  block[0] = MEMORY[0x263EF8330];
  block[1] = v45;
  block[2] = __68__PSUIRemoveCellularPlanSpecifier_showRemapFor_withList_completion___block_invoke_4;
  block[3] = &unk_2645E0B60;
  void block[4] = self;
  id v57 = v19;
  id v48 = v19;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __68__PSUIRemoveCellularPlanSpecifier_showRemapFor_withList_completion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 48) objectAtIndexedSubscript:0];
  [v2 remap:v3 to:v4 completion:*(void *)(a1 + 56)];
}

uint64_t __68__PSUIRemoveCellularPlanSpecifier_showRemapFor_withList_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) remap:*(void *)(a1 + 40) to:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

uint64_t __68__PSUIRemoveCellularPlanSpecifier_showRemapFor_withList_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __68__PSUIRemoveCellularPlanSpecifier_showRemapFor_withList_completion___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 280));
  v2 = [WeakRetained navigationController];
  [v2 presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

- (void)remap:(id)a3 to:(id)a4 completion:(id)a5
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v24 = a4;
  long long v23 = (void (**)(void))a5;
  id v9 = [(PSUIRemoveCellularPlanSpecifier *)self getLogger];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    v33 = "-[PSUIRemoveCellularPlanSpecifier remap:to:completion:]";
    _os_log_impl(&dword_221B17000, v9, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  id v22 = self;
  [(CTCellularPlanManager *)self->_cellularPlanManager danglingPlanItemsShouldUpdate:0];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v16 = [v15 iccid];
        v17 = [v8 iccid];
        int v18 = [v16 isEqualToString:v17];

        if (v18)
        {
          __int16 v19 = v23;
          cellularPlanManager = v22->_cellularPlanManager;
          v25[0] = MEMORY[0x263EF8330];
          v25[1] = 3221225472;
          v25[2] = __55__PSUIRemoveCellularPlanSpecifier_remap_to_completion___block_invoke;
          v25[3] = &unk_2645E1610;
          unint64_t v26 = v23;
          unint64_t v20 = v24;
          [(CTCellularPlanManager *)cellularPlanManager remapSimLabel:v15 to:v24 completion:v25];

          goto LABEL_13;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  __int16 v19 = v23;
  v23[2](v23);
  unint64_t v20 = v24;
LABEL_13:
}

uint64_t __55__PSUIRemoveCellularPlanSpecifier_remap_to_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"RemoveCellularPlanSpecifier"];
}

- (PSUICellularPlanUniversalReference)planReference
{
  return self->_planReference;
}

- (void)setPlanReference:(id)a3
{
}

- (CTCellularPlanManager)cellularPlanManager
{
  return self->_cellularPlanManager;
}

- (void)setCellularPlanManager:(id)a3
{
}

- (PSUICellularPlanManagerCache)planManagerCache
{
  return self->_planManagerCache;
}

- (void)setPlanManagerCache:(id)a3
{
}

- (PSListController)hostController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  return (PSListController *)WeakRetained;
}

- (void)setHostController:(id)a3
{
}

- (BOOL)popViewControllerOnPlanDeletion
{
  return self->_popViewControllerOnPlanDeletion;
}

- (void)setPopViewControllerOnPlanDeletion:(BOOL)a3
{
  self->_popViewControllerOnPlanDeletion = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostController);
  objc_storeStrong((id *)&self->_planManagerCache, 0);
  objc_storeStrong((id *)&self->_cellularPlanManager, 0);
  objc_storeStrong((id *)&self->_planReference, 0);
}

@end