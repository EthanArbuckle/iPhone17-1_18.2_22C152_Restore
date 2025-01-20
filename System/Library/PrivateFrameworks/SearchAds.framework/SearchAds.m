uint64_t sub_236758CD4()
{
  uint64_t vars8;

  qword_26AC299D0 = (uint64_t)objc_alloc_init((Class)objc_opt_class());
  return MEMORY[0x270F9A758]();
}

void sub_236758D64(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x263F61F00]);
  id v8 = (id)objc_msgSend_initWithPlacementType_assetManagerType_(v2, v3, 0, 0, v4);
  objc_msgSend_setOdmlSettings_(*(void **)(a1 + 32), v5, (uint64_t)v8, v6, v7);
}

void sub_236759030(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend_sharedInstance(MEMORY[0x263F241D8], a2, a3, a4, a5);
  v11 = objc_msgSend_idForClientType_(v6, v7, 4, v8, v9);
  if (v11)
  {
    v12 = 0;
  }
  else
  {
    v12 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x263F087E8], v10, *MEMORY[0x263F24138], 2, 0);
  }
  v13 = APLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 138412290;
    v16 = v11;
    _os_log_impl(&dword_236756000, v13, OS_LOG_TYPE_DEFAULT, "requestUserTargetingIdentifier %@", (uint8_t *)&v15, 0xCu);
  }

  uint64_t v14 = *(void *)(a1 + 32);
  if (v14) {
    (*(void (**)(uint64_t, void *, void *))(v14 + 16))(v14, v11, v12);
  }
}

void sub_236759E10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_23675B704()
{
  qword_26AC299E8 = objc_alloc_init(ADMetricManager);
  return MEMORY[0x270F9A758]();
}

void sub_23675BC74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23675BCA0(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    if (v7 && objc_msgSend_length(v7, v2, v3, v4, v5))
    {
      id v8 = objc_alloc(MEMORY[0x263F241D0]);
      v12 = objc_msgSend_initWithIdentifier_(v8, v9, *(void *)(a1 + 32), v10, v11);
      uint64_t v17 = objc_msgSend_capData(WeakRetained, v13, v14, v15, v16);
      objc_msgSend_addCapDataObject_ofKind_(v17, v18, (uint64_t)v12, *(void *)(a1 + 56), v19);

      uint64_t v20 = *(void *)(a1 + 40);
      if (v20)
      {
        v21 = *(void (**)(void))(v20 + 16);
LABEL_14:
        v21();
        goto LABEL_15;
      }
      goto LABEL_15;
    }
    v22 = APLogForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      int v32 = 138412290;
      uint64_t v33 = objc_opt_class();
      _os_log_impl(&dword_236756000, v22, OS_LOG_TYPE_ERROR, "[%@] We received a nil data object.", (uint8_t *)&v32, 0xCu);
    }

    id v23 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v26 = objc_msgSend_initWithAdCode_andDescription_(v23, v24, 16, @"We received a nil data object.", v25);
  }
  else
  {
    v27 = APLogForCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      int v32 = 138412546;
      uint64_t v33 = objc_opt_class();
      __int16 v34 = 2112;
      v35 = @"ERROR: we have lost ourselves";
      _os_log_impl(&dword_236756000, v27, OS_LOG_TYPE_ERROR, "[%@] %@", (uint8_t *)&v32, 0x16u);
    }

    id v28 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v26 = objc_msgSend_initWithAdCode_andDescription_(v28, v29, 16, @"ERROR: we have lost ourselves", v30);
  }
  v12 = (void *)v26;
  uint64_t v31 = *(void *)(a1 + 40);
  if (v31)
  {
    v21 = *(void (**)(void))(v31 + 16);
    goto LABEL_14;
  }
LABEL_15:
}

void sub_23675C030(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23675C05C(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v7 = WeakRetained;
  if (*(void *)(a1 + 56))
  {
    if (WeakRetained)
    {
      id v8 = *(void **)(a1 + 32);
      if (v8 && objc_msgSend_length(v8, v3, v4, v5, v6))
      {
        id v9 = objc_alloc(MEMORY[0x263F241D0]);
        v13 = objc_msgSend_initWithIdentifier_(v9, v10, *(void *)(a1 + 32), v11, v12);
        objc_msgSend_setDownloadType_(v13, v14, *(void *)(a1 + 56), v15, v16);
        v21 = objc_msgSend_capData(v7, v17, v18, v19, v20);
        objc_msgSend_addCapDataObject_ofKind_(v21, v22, (uint64_t)v13, 2, v23);

        uint64_t v24 = *(void *)(a1 + 40);
        if (v24)
        {
          uint64_t v25 = *(void (**)(void))(v24 + 16);
LABEL_19:
          v25();
          goto LABEL_20;
        }
        goto LABEL_20;
      }
      uint64_t v31 = APLogForCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        int v38 = 138412290;
        v39 = (__CFString *)objc_opt_class();
        _os_log_impl(&dword_236756000, v31, OS_LOG_TYPE_ERROR, "[%@] We received a nil data object.", (uint8_t *)&v38, 0xCu);
      }

      id v32 = objc_alloc(MEMORY[0x263F087E8]);
      v35 = @"We received a nil data object.";
    }
    else
    {
      uint64_t v36 = APLogForCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        int v38 = 138412546;
        v39 = (__CFString *)objc_opt_class();
        __int16 v40 = 2112;
        v41 = @"ERROR: we have lost ourselves";
        _os_log_impl(&dword_236756000, v36, OS_LOG_TYPE_ERROR, "[%@] %@", (uint8_t *)&v38, 0x16u);
      }

      id v32 = objc_alloc(MEMORY[0x263F087E8]);
      v35 = @"ERROR: we have lost ourselves";
    }
    uint64_t v30 = objc_msgSend_initWithAdCode_andDescription_(v32, v33, 16, (uint64_t)v35, v34);
  }
  else
  {
    uint64_t v26 = APLogForCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      int v38 = 138412290;
      v39 = @"ERROR: We were passed a download type of None";
      _os_log_impl(&dword_236756000, v26, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v38, 0xCu);
    }

    id v27 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v30 = objc_msgSend_initWithAdCode_andDescription_(v27, v28, 15, @"ERROR: We were passed a download type of None", v29);
  }
  v13 = (void *)v30;
  uint64_t v37 = *(void *)(a1 + 40);
  if (v37)
  {
    uint64_t v25 = *(void (**)(void))(v37 + 16);
    goto LABEL_19;
  }
LABEL_20:
}

void sub_23675D984(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23675D9B0(uint64_t a1)
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    uint64_t v7 = objc_msgSend_error(*(void **)(a1 + 40), v2, v3, v4, v5);

    if (v7)
    {
      if (*(void *)(a1 + 64)) {
        id v8 = @"ad tap";
      }
      else {
        id v8 = @"frequency cap update";
      }
      id v9 = v8;
      uint64_t v10 = APLogForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v11 = objc_opt_class();
        uint64_t v16 = objc_msgSend_error(*(void **)(a1 + 40), v12, v13, v14, v15);
        int v55 = 138412802;
        uint64_t v56 = v11;
        __int16 v57 = 2112;
        v58 = v9;
        __int16 v59 = 2112;
        v60 = v16;
        _os_log_impl(&dword_236756000, v10, OS_LOG_TYPE_ERROR, "[%@] We received an error with the %@ : %@", (uint8_t *)&v55, 0x20u);
      }
      uint64_t v21 = *(void *)(a1 + 48);
      if (v21)
      {
        v22 = objc_msgSend_error(*(void **)(a1 + 40), v17, v18, v19, v20);
        (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);
      }
    }
    else
    {
      id v28 = [ADResponseData alloc];
      uint64_t v33 = objc_msgSend_adResponseInUse(*(void **)(a1 + 40), v29, v30, v31, v32);
      id v9 = (__CFString *)objc_msgSend_initWithDict_(v28, v34, (uint64_t)v33, v35, v36);

      id v37 = objc_alloc(MEMORY[0x263F241D0]);
      uint64_t v42 = objc_msgSend_lineItem(v9, v38, v39, v40, v41);
      v46 = objc_msgSend_initWithIdentifier_(v37, v43, (uint64_t)v42, v44, v45);

      v51 = objc_msgSend_capData(*(void **)(a1 + 32), v47, v48, v49, v50);
      objc_msgSend_addCapDataObject_ofKind_(v51, v52, (uint64_t)v46, *(void *)(a1 + 64), v53);

      uint64_t v54 = *(void *)(a1 + 48);
      if (v54) {
        (*(void (**)(uint64_t, void))(v54 + 16))(v54, 0);
      }
    }
  }
  else
  {
    uint64_t v23 = APLogForCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      int v55 = 138412546;
      uint64_t v56 = objc_opt_class();
      __int16 v57 = 2112;
      v58 = @"ERROR: we have lost ourselves";
      _os_log_impl(&dword_236756000, v23, OS_LOG_TYPE_ERROR, "[%@] %@", (uint8_t *)&v55, 0x16u);
    }

    id v24 = objc_alloc(MEMORY[0x263F087E8]);
    id v9 = (__CFString *)objc_msgSend_initWithAdCode_andDescription_(v24, v25, 16, @"ERROR: we have lost ourselves", v26);
    uint64_t v27 = *(void *)(a1 + 48);
    if (v27) {
      (*(void (**)(uint64_t, __CFString *))(v27 + 16))(v27, v9);
    }
  }
}

void sub_23675DE5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_23675DE88(uint64_t a1)
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v7 = WeakRetained;
  if (!*(void *)(a1 + 72))
  {
    uint64_t v23 = APLogForCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      int v50 = 138412290;
      v51 = @"ERROR: We were passed a download type of None";
      _os_log_impl(&dword_236756000, v23, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v50, 0xCu);
    }

    id v24 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v27 = objc_msgSend_initWithAdCode_andDescription_(v24, v25, 15, @"ERROR: We were passed a download type of None", v26);
LABEL_17:
    uint64_t v32 = (void *)v27;
    uint64_t v49 = *(void *)(a1 + 56);
    if (v49)
    {
      uint64_t v44 = *(void (**)(void))(v49 + 16);
      goto LABEL_19;
    }
LABEL_20:

    goto LABEL_21;
  }
  if (!WeakRetained)
  {
    uint64_t v45 = APLogForCategory();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      int v50 = 138412546;
      v51 = (__CFString *)objc_opt_class();
      __int16 v52 = 2112;
      uint64_t v53 = @"ERROR: we have lost ourselves";
      _os_log_impl(&dword_236756000, v45, OS_LOG_TYPE_ERROR, "[%@] %@", (uint8_t *)&v50, 0x16u);
    }

    id v46 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v27 = objc_msgSend_initWithAdCode_andDescription_(v46, v47, 16, @"ERROR: we have lost ourselves", v48);
    goto LABEL_17;
  }
  id v8 = *(void **)(a1 + 40);
  if (!v8
    || (objc_msgSend_error(v8, v3, v4, v5, v6), id v9 = objc_claimAutoreleasedReturnValue(), v9, !v9))
  {
    id v28 = objc_alloc(MEMORY[0x263F241D0]);
    uint64_t v32 = objc_msgSend_initWithIdentifier_(v28, v29, *(void *)(a1 + 48), v30, v31);
    objc_msgSend_setDownloadType_(v32, v33, *(void *)(a1 + 72), v34, v35);
    uint64_t v40 = objc_msgSend_capData(v7, v36, v37, v38, v39);
    objc_msgSend_addCapDataObject_ofKind_(v40, v41, (uint64_t)v32, 2, v42);

    uint64_t v43 = *(void *)(a1 + 56);
    if (v43)
    {
      uint64_t v44 = *(void (**)(void))(v43 + 16);
LABEL_19:
      v44();
      goto LABEL_20;
    }
    goto LABEL_20;
  }
  uint64_t v10 = APLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    uint64_t v11 = objc_opt_class();
    uint64_t v16 = objc_msgSend_error(*(void **)(a1 + 40), v12, v13, v14, v15);
    int v50 = 138412802;
    v51 = (__CFString *)v11;
    __int16 v52 = 2112;
    uint64_t v53 = @"download data update";
    __int16 v54 = 2112;
    int v55 = v16;
    _os_log_impl(&dword_236756000, v10, OS_LOG_TYPE_ERROR, "[%@] We received an error with the %@ : %@", (uint8_t *)&v50, 0x20u);
  }
  uint64_t v21 = *(void *)(a1 + 56);
  if (v21)
  {
    v22 = objc_msgSend_error(*(void **)(a1 + 40), v17, v18, v19, v20);
    (*(void (**)(uint64_t, void *))(v21 + 16))(v21, v22);
  }
LABEL_21:
}

void sub_23675E8F8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend_frequencyCapUpdated(*(void **)(a1 + 32), a2, a3, a4, a5);
  char v10 = objc_msgSend_containsObject_(v6, v7, *(void *)(a1 + 40), v8, v9);

  if ((v10 & 1) == 0)
  {
    uint64_t v15 = objc_msgSend_activeAdvertisementsByInstanceID(*(void **)(a1 + 32), v11, v12, v13, v14);
    uint64_t v19 = objc_msgSend_objectForKey_(v15, v16, *(void *)(a1 + 40), v17, v18);

    if (v19)
    {
      if (*(double *)(a1 + 48) < 1.0)
      {
LABEL_8:

        return;
      }
      id v24 = objc_msgSend_desRecordManager(*(void **)(a1 + 32), v20, v21, v22, v23);
      uint64_t v29 = objc_msgSend_adamID(v19, v25, v26, v27, v28);
      objc_msgSend_updateDESRecord_forEvent_(v24, v30, (uint64_t)v29, 1, v31);

      uint64_t v36 = objc_msgSend_capService(*(void **)(a1 + 32), v32, v33, v34, v35);
      uint64_t v41 = objc_msgSend_adData(v19, v37, v38, v39, v40);
      objc_msgSend_updateFrequencyCapData_completionHandler_(v36, v42, (uint64_t)v41, 0, v43);

      uint64_t v48 = objc_msgSend_frequencyCapUpdated(*(void **)(a1 + 32), v44, v45, v46, v47);
      objc_msgSend_addObject_(v48, v49, *(void *)(a1 + 40), v50, v51);
    }
    else
    {
      uint64_t v48 = APLogForCategory();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      {
        uint64_t v52 = *(void *)(a1 + 40);
        int v53 = 138412290;
        uint64_t v54 = v52;
        _os_log_impl(&dword_236756000, v48, OS_LOG_TYPE_ERROR, "[Ad %@] Error: Tried to send metric visible but the Ad was not found.", (uint8_t *)&v53, 0xCu);
      }
    }

    goto LABEL_8;
  }
}

uint64_t sub_23675EC0C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_23675ED18(uint64_t a1)
{
  uint64_t v96 = *MEMORY[0x263EF8340];
  id v2 = APLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = objc_msgSend_buttonStateToString_(*(void **)(a1 + 40), v3, *(void *)(a1 + 56), v4, v5);
    *(_DWORD *)buf = 138412546;
    uint64_t v93 = v6;
    __int16 v94 = 2112;
    v95 = v7;
    _os_log_impl(&dword_236756000, v2, OS_LOG_TYPE_DEFAULT, "[Ad %@] Ad is being downloaded with button state %@.", buf, 0x16u);
  }
  uint64_t v12 = objc_msgSend_downloadCapUpdated(*(void **)(a1 + 40), v8, v9, v10, v11);
  int v16 = objc_msgSend_containsObject_(v12, v13, *(void *)(a1 + 32), v14, v15);

  if (v16)
  {
    uint64_t v21 = *(void *)(a1 + 48);
    if (v21) {
      (*(void (**)(uint64_t, void))(v21 + 16))(v21, 0);
    }
  }
  else
  {
    uint64_t v22 = objc_msgSend_activeAdvertisementsByInstanceID(*(void **)(a1 + 40), v17, v18, v19, v20);
    uint64_t v26 = objc_msgSend_objectForKey_(v22, v23, *(void *)(a1 + 32), v24, v25);

    if (v26)
    {
      uint64_t v31 = objc_msgSend_downloadCapUpdated(*(void **)(a1 + 40), v27, v28, v29, v30);
      objc_msgSend_addObject_(v31, v32, *(void *)(a1 + 32), v33, v34);

      uint64_t v39 = objc_msgSend_desRecordManager(*(void **)(a1 + 40), v35, v36, v37, v38);
      uint64_t v44 = objc_msgSend_adamID(v26, v40, v41, v42, v43);
      objc_msgSend_updateDESRecord_forEvent_(v39, v45, (uint64_t)v44, 2, v46);

      uint64_t v50 = objc_msgSend_buttonStateToDownloadType_(*(void **)(a1 + 40), v47, *(void *)(a1 + 56), v48, v49);
      uint64_t v51 = [ADResponseData alloc];
      uint64_t v56 = objc_msgSend_adData(v26, v52, v53, v54, v55);
      uint64_t v61 = objc_msgSend_adResponseInUse(v56, v57, v58, v59, v60);
      v65 = objc_msgSend_initWithDict_(v51, v62, (uint64_t)v61, v63, v64);

      objc_msgSend_updateStoreKitAttribution_targetAdvertisement_(*(void **)(a1 + 40), v66, *(void *)(a1 + 32), (uint64_t)v26, v67);
      v72 = objc_msgSend_capService(*(void **)(a1 + 40), v68, v69, v70, v71);
      v77 = objc_msgSend_adData(v26, v73, v74, v75, v76);
      v82 = objc_msgSend_lineItem(v65, v78, v79, v80, v81);
      v90[0] = MEMORY[0x263EF8330];
      v90[1] = 3221225472;
      v90[2] = sub_23675F060;
      v90[3] = &unk_264CADBE8;
      id v91 = *(id *)(a1 + 48);
      objc_msgSend_updateDownloadData_identifier_forType_completionHandler_(v72, v83, (uint64_t)v77, (uint64_t)v82, v50, v90);
    }
    else
    {
      v84 = APLogForCategory();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR))
      {
        uint64_t v85 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v93 = v85;
        _os_log_impl(&dword_236756000, v84, OS_LOG_TYPE_ERROR, "[Ad %@] Error: Tried to send metric getApp but the Ad was not found.", buf, 0xCu);
      }

      id v86 = objc_alloc(MEMORY[0x263F087E8]);
      v65 = objc_msgSend_initWithAdCode_andDescription_(v86, v87, 17, @"ERROR: Tried to send metric getApp but the Ad was not found.", v88);
      uint64_t v89 = *(void *)(a1 + 48);
      if (v89) {
        (*(void (**)(uint64_t, void *))(v89 + 16))(v89, v65);
      }
    }
  }
}

uint64_t sub_23675F060(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

void sub_23675F134(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v2 = APLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v19 = 138412290;
    uint64_t v20 = v3;
    _os_log_impl(&dword_236756000, v2, OS_LOG_TYPE_DEFAULT, "[Ad %@] Ad is tapped.", (uint8_t *)&v19, 0xCu);
  }

  uint64_t v8 = objc_msgSend_activeAdvertisementsByInstanceID(*(void **)(a1 + 40), v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_objectForKey_(v8, v9, *(void *)(a1 + 32), v10, v11);

  if (v12)
  {
    objc_msgSend_updateStoreKitAttribution_targetAdvertisement_(*(void **)(a1 + 40), v13, *(void *)(a1 + 32), (uint64_t)v12, v14);
    objc_msgSend_updateClickCap_targetAdvertisement_(*(void **)(a1 + 40), v15, *(void *)(a1 + 32), (uint64_t)v12, v16);
  }
  else
  {
    uint64_t v17 = APLogForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      int v19 = 138412290;
      uint64_t v20 = v18;
      _os_log_impl(&dword_236756000, v17, OS_LOG_TYPE_ERROR, "[Ad %@] Error: Tried to send metric interacted but the Ad was not found.", (uint8_t *)&v19, 0xCu);
    }
  }
}

void sub_23675F3A0(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = APLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412546;
      uint64_t v7 = v5;
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_impl(&dword_236756000, v4, OS_LOG_TYPE_ERROR, "[Ad %@] Error: Failed to record StoreKit ad interaction with %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

void sub_23675F5CC(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = APLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412546;
      uint64_t v7 = v5;
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_impl(&dword_236756000, v4, OS_LOG_TYPE_ERROR, "[Ad %@] Error: Click data update failed with %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

void sub_23675F7D4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v10[1] = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void **)(a1 + 32);
  v10[0] = *(void *)(a1 + 40);
  int v6 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x263EFF8C0], a2, (uint64_t)v10, 1, a5);
  objc_msgSend_deactivateAdvertisementsByInstanceIDs_(v5, v7, (uint64_t)v6, v8, v9);
}

void sub_23675FBA8(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v9 = objc_msgSend_clickCapUpdated(v3, v5, v6, v7, v8);
  objc_msgSend_removeObject_(v9, v10, (uint64_t)v4, v11, v12);

  uint64_t v17 = objc_msgSend_downloadCapUpdated(*(void **)(a1 + 32), v13, v14, v15, v16);
  objc_msgSend_removeObject_(v17, v18, (uint64_t)v4, v19, v20);

  objc_msgSend_frequencyCapUpdated(*(void **)(a1 + 32), v21, v22, v23, v24);
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObject_(v28, v25, (uint64_t)v4, v26, v27);
}

void sub_23675FCF8(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  uint64_t v9 = objc_msgSend_clickCapUpdated(v3, v5, v6, v7, v8);
  objc_msgSend_removeObject_(v9, v10, (uint64_t)v4, v11, v12);

  uint64_t v17 = objc_msgSend_downloadCapUpdated(*(void **)(a1 + 32), v13, v14, v15, v16);
  objc_msgSend_removeObject_(v17, v18, (uint64_t)v4, v19, v20);

  objc_msgSend_frequencyCapUpdated(*(void **)(a1 + 32), v21, v22, v23, v24);
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObject_(v28, v25, (uint64_t)v4, v26, v27);
}

void sub_2367601AC(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_msgSend_sharedInstance(ADSearchAdsSettings, a2, a3, a4, a5);
  id v64 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_checkAndUpdateToroID(a1, v6, v7, v8, v9);
  id v10 = a1;
  objc_sync_enter(v10);
  uint64_t v15 = objc_msgSend_downloadData(v10, v11, v12, v13, v14);
  uint64_t v20 = objc_msgSend_count(v15, v16, v17, v18, v19);

  uint64_t v25 = objc_msgSend_downloadData(v10, v21, v22, v23, v24);
  uint64_t v30 = objc_msgSend_searchSettings(v64, v26, v27, v28, v29);
  uint64_t v35 = objc_msgSend_maxClickCapElements(v30, v31, v32, v33, v34);
  uint64_t v40 = objc_msgSend_searchSettings(v64, v36, v37, v38, v39);
  objc_msgSend_clickExpirationThresholdInSeconds(v40, v41, v42, v43, v44);
  uint64_t v47 = objc_msgSend_filteredCapData_maxItems_expirationThresholdInSeconds_(v10, v45, (uint64_t)v25, v35, v46);
  objc_msgSend_setDownloadData_(v10, v48, (uint64_t)v47, v49, v50);

  uint64_t v55 = objc_msgSend_downloadData(v10, v51, v52, v53, v54);
  uint64_t v60 = objc_msgSend_count(v55, v56, v57, v58, v59);

  if (v20 != v60) {
    objc_msgSend_saveCapDataWithReason_(v10, v61, @"Download Data Cleanup", v62, v63);
  }
  objc_sync_exit(v10);
}

void sub_2367602EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_236760304(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = objc_msgSend_sharedInstance(ADSearchAdsSettings, a2, a3, a4, a5);
  objc_msgSend_checkAndUpdateToroID(a1, v7, v8, v9, v10);
  id v11 = a1;
  objc_sync_enter(v11);
  uint64_t v16 = objc_msgSend_frequencyCapData(v11, v12, v13, v14, v15);
  uint64_t v21 = objc_msgSend_count(v16, v17, v18, v19, v20);

  uint64_t v26 = objc_msgSend_frequencyCapData(v11, v22, v23, v24, v25);
  uint64_t v31 = objc_msgSend_searchSettings(v6, v27, v28, v29, v30);
  uint64_t v36 = objc_msgSend_maxFrequencyCapElements(v31, v32, v33, v34, v35);
  uint64_t v41 = objc_msgSend_searchSettings(v6, v37, v38, v39, v40);
  objc_msgSend_frequencyCapExpirationInSeconds(v41, v42, v43, v44, v45);
  uint64_t v48 = objc_msgSend_filteredCapData_maxItems_expirationThresholdInSeconds_(v11, v46, (uint64_t)v26, v36, v47);
  objc_msgSend_setFrequencyCapData_(v11, v49, (uint64_t)v48, v50, v51);

  uint64_t v56 = objc_msgSend_frequencyCapData(v11, v52, v53, v54, v55);
  uint64_t v61 = objc_msgSend_count(v56, v57, v58, v59, v60);

  if (v61 != v21) {
    objc_msgSend_saveCapDataWithReason_(v11, v62, @"Frequency Cap Cleanup", v64, v65);
  }
  v66 = objc_msgSend_frequencyCapData(v11, v62, v63, v64, v65);
  uint64_t v70 = objc_msgSend_capDataJSON_(v11, v67, (uint64_t)v66, v68, v69);

  objc_sync_exit(v11);
  return v70;
}

void sub_236760470(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_236760488(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = objc_msgSend_sharedInstance(ADSearchAdsSettings, a2, a3, a4, a5);
  objc_msgSend_checkAndUpdateToroID(a1, v7, v8, v9, v10);
  id v11 = a1;
  objc_sync_enter(v11);
  uint64_t v16 = objc_msgSend_clickCountData(v11, v12, v13, v14, v15);
  uint64_t v21 = objc_msgSend_count(v16, v17, v18, v19, v20);

  uint64_t v26 = objc_msgSend_clickCountData(v11, v22, v23, v24, v25);
  uint64_t v31 = objc_msgSend_searchSettings(v6, v27, v28, v29, v30);
  uint64_t v36 = objc_msgSend_maxClickCapElements(v31, v32, v33, v34, v35);
  uint64_t v41 = objc_msgSend_searchSettings(v6, v37, v38, v39, v40);
  objc_msgSend_clickExpirationThresholdInSeconds(v41, v42, v43, v44, v45);
  uint64_t v48 = objc_msgSend_filteredCapData_maxItems_expirationThresholdInSeconds_(v11, v46, (uint64_t)v26, v36, v47);
  objc_msgSend_setClickCountData_(v11, v49, (uint64_t)v48, v50, v51);

  uint64_t v56 = objc_msgSend_clickCountData(v11, v52, v53, v54, v55);
  uint64_t v61 = objc_msgSend_count(v56, v57, v58, v59, v60);

  if (v61 != v21) {
    objc_msgSend_saveCapDataWithReason_(v11, v62, @"Toro Click Cleanup", v64, v65);
  }
  v66 = objc_msgSend_clickCountData(v11, v62, v63, v64, v65);
  uint64_t v70 = objc_msgSend_capDataJSON_(v11, v67, (uint64_t)v66, v68, v69);

  objc_sync_exit(v11);
  return v70;
}

void sub_2367605F4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2367607A0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = objc_msgSend_sharedInputModeController(MEMORY[0x263F828C0], v1, v2, v3, v4);
  uint64_t v10 = objc_msgSend_normalizedEnabledInputModeIdentifiers(v5, v6, v7, v8, v9);
  objc_msgSend_setUserKeyboards_(WeakRetained, v11, (uint64_t)v10, v12, v13);
}

void sub_236760818(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = objc_msgSend_sharedInstance(MEMORY[0x263F241D8], a2, a3, a4, a5);
  id v7 = objc_alloc_init(MEMORY[0x263F24198]);
  uint64_t v12 = objc_msgSend_clientSettings(*(void **)(a1 + 32), v8, v9, v10, v11);
  uint64_t v17 = objc_msgSend_searchAdsSettingsParams(v12, v13, v14, v15, v16);
  objc_msgSend_setCurrentSettingParams_(v7, v18, (uint64_t)v17, v19, v20);

  uint64_t v25 = objc_msgSend_clientSettings(*(void **)(a1 + 32), v21, v22, v23, v24);
  uint64_t v30 = objc_msgSend_searchLandingAdsSettingsParams(v25, v26, v27, v28, v29);
  objc_msgSend_setCurrentSearchLandingAdsSettingParams_(v7, v31, (uint64_t)v30, v32, v33);

  uint64_t v37 = objc_msgSend_idForClientType_(v6, v34, 0, v35, v36);
  objc_msgSend_setIAdIDString_(v7, v38, (uint64_t)v37, v39, v40);

  uint64_t v41 = *(void **)(a1 + 40);
  uint64_t v46 = objc_msgSend_defaultToroServerURL(*(void **)(a1 + 32), v42, v43, v44, v45);
  v48[0] = MEMORY[0x263EF8330];
  v48[1] = 3221225472;
  v48[2] = sub_236760988;
  v48[3] = &unk_264CADD10;
  v48[4] = *(void *)(a1 + 32);
  id v49 = *(id *)(a1 + 48);
  objc_msgSend_handleRequest_serverURL_responseHandler_(v41, v47, (uint64_t)v7, (uint64_t)v46, (uint64_t)v48);
}

void sub_236760988(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = v9;
  if (!v7 || v9)
  {
    uint64_t v39 = APLogForCategory();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      int v42 = 138412546;
      id v43 = (id)objc_opt_class();
      __int16 v44 = 2112;
      uint64_t v45 = v10;
      id v40 = v43;
      _os_log_impl(&dword_236756000, v39, OS_LOG_TYPE_ERROR, "[%@]: ADClientSettingsRequest failed with error: %@.", (uint8_t *)&v42, 0x16u);
    }
    uint64_t v41 = *(void *)(a1 + 40);
    if (v41)
    {
      uint64_t v38 = *(void (**)(void))(v41 + 16);
      goto LABEL_15;
    }
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x263F241A0]);
    uint64_t v15 = objc_msgSend_initWithData_(v11, v12, (uint64_t)v7, v13, v14);
    objc_msgSend_setClientSettings_(*(void **)(a1 + 32), v16, (uint64_t)v15, v17, v18);

    uint64_t v19 = APLogForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v24 = objc_msgSend_clientSettings(*(void **)(a1 + 32), v20, v21, v22, v23);
      uint64_t v29 = objc_msgSend_AD_jsonString(v24, v25, v26, v27, v28);
      int v42 = 138412290;
      id v43 = v29;
      _os_log_impl(&dword_236756000, v19, OS_LOG_TYPE_DEFAULT, "Received response for ADClientSettingsRequest: %@", (uint8_t *)&v42, 0xCu);
    }
    int v30 = ADWriteDataToKeychain();
    if (v30)
    {
      int v35 = v30;
      uint64_t v36 = APLogForCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        int v42 = 67109120;
        LODWORD(v43) = v35;
        _os_log_impl(&dword_236756000, v36, OS_LOG_TYPE_ERROR, "Error saving Client Settings to keychain: %d", (uint8_t *)&v42, 8u);
      }
    }
    objc_msgSend_applyClientSettings(*(void **)(a1 + 32), v31, v32, v33, v34);
    uint64_t v37 = *(void *)(a1 + 40);
    if (v37)
    {
      uint64_t v38 = *(void (**)(void))(v37 + 16);
LABEL_15:
      v38();
    }
  }
}

void sub_236761480(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = *(void **)(a1 + 32);
  objc_msgSend_AD_jsonDictionary(a2, (const char *)a2, a3, a4, a5);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v5, v6, (uint64_t)v9, v7, v8);
}

void sub_2367614D8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_msgSend_sharedInstance(ADMetricManager, a2, a3, a4, a5);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_activateAdvertisements_(v9, v6, *(void *)(a1 + 32), v7, v8);
}

void sub_2367617A4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = OdmlLogForCategory();
  uint64_t v12 = objc_msgSend_ident(*(void **)(a1 + 32), v8, v9, v10, v11);
  if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v13 = v12;
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_236756000, v7, OS_SIGNPOST_INTERVAL_END, v13, "App Store Total Reranking", (const char *)&unk_23676A48F, buf, 2u);
    }
  }

  uint64_t v14 = APLogForCategory();
  uint64_t v15 = v14;
  if (v6)
  {
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    __int16 v60 = 0;
    uint64_t v16 = "Reranking Failure; reporting ODMLSuccess FALSE to Figaro.";
    uint64_t v17 = (uint8_t *)&v60;
    uint64_t v18 = v15;
    os_log_type_t v19 = OS_LOG_TYPE_ERROR;
  }
  else
  {
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    *(_WORD *)uint64_t v61 = 0;
    uint64_t v16 = "Reranking Success; reporting ODMLSuccess TRUE to Figaro.";
    uint64_t v17 = v61;
    uint64_t v18 = v15;
    os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
  }
  _os_log_impl(&dword_236756000, v18, v19, v16, v17, 2u);
LABEL_10:

  uint64_t v24 = objc_msgSend_desRecordManager(*(void **)(a1 + 32), v20, v21, v22, v23);
  uint64_t v29 = objc_msgSend_sharedInstance(ADMetricManager, v25, v26, v27, v28);
  objc_msgSend_setDesRecordManager_(v29, v30, (uint64_t)v24, v31, v32);

  uint64_t v37 = objc_msgSend_desRecordManager(*(void **)(a1 + 32), v33, v34, v35, v36);
  int v42 = objc_msgSend_advertisements(*(void **)(a1 + 32), v38, v39, v40, v41);
  uint64_t v47 = objc_msgSend_organics(*(void **)(a1 + 32), v43, v44, v45, v46);
  uint64_t v52 = objc_msgSend_firstObject(v47, v48, v49, v50, v51);
  uint64_t v57 = objc_msgSend_adamID(v52, v53, v54, v55, v56);
  objc_msgSend_createRecords_firstOrganicId_error_(v37, v58, (uint64_t)v42, (uint64_t)v57, (uint64_t)v6);

  uint64_t v59 = *(void *)(a1 + 40);
  if (v59) {
    (*(void (**)(uint64_t, id, id))(v59 + 16))(v59, v5, v6);
  }
}

void sub_236761B50(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = OdmlLogForCategory();
  uint64_t v12 = objc_msgSend_ident(*(void **)(a1 + 32), v8, v9, v10, v11);
  if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v13 = v12;
    if (os_signpost_enabled(v7))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_236756000, v7, OS_SIGNPOST_INTERVAL_END, v13, "App Store Total Reranking", (const char *)&unk_23676A48F, buf, 2u);
    }
  }

  uint64_t v14 = APLogForCategory();
  uint64_t v15 = v14;
  if (v6)
  {
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_10;
    }
    __int16 v60 = 0;
    uint64_t v16 = "Reranking Failure; reporting ODMLSuccess FALSE to Figaro.";
    uint64_t v17 = (uint8_t *)&v60;
    uint64_t v18 = v15;
    os_log_type_t v19 = OS_LOG_TYPE_ERROR;
  }
  else
  {
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    *(_WORD *)uint64_t v61 = 0;
    uint64_t v16 = "Reranking Success; reporting ODMLSuccess TRUE to Figaro.";
    uint64_t v17 = v61;
    uint64_t v18 = v15;
    os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
  }
  _os_log_impl(&dword_236756000, v18, v19, v16, v17, 2u);
LABEL_10:

  uint64_t v24 = objc_msgSend_desRecordManager(*(void **)(a1 + 32), v20, v21, v22, v23);
  uint64_t v29 = objc_msgSend_sharedInstance(ADMetricManager, v25, v26, v27, v28);
  objc_msgSend_setDesRecordManager_(v29, v30, (uint64_t)v24, v31, v32);

  uint64_t v37 = objc_msgSend_desRecordManager(*(void **)(a1 + 32), v33, v34, v35, v36);
  int v42 = objc_msgSend_advertisements(*(void **)(a1 + 32), v38, v39, v40, v41);
  uint64_t v47 = objc_msgSend_organics(*(void **)(a1 + 32), v43, v44, v45, v46);
  uint64_t v52 = objc_msgSend_firstObject(v47, v48, v49, v50, v51);
  uint64_t v57 = objc_msgSend_adamID(v52, v53, v54, v55, v56);
  objc_msgSend_createRecords_firstOrganicId_error_(v37, v58, (uint64_t)v42, (uint64_t)v57, (uint64_t)v6);

  uint64_t v59 = *(void *)(a1 + 40);
  if (v59) {
    (*(void (**)(uint64_t, id, BOOL))(v59 + 16))(v59, v5, v6 == 0);
  }
}

void sub_23676293C(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6)
{
  objc_msgSend_checkAndUpdateToroID(a1, a2, a3, a4, a5);
  id obj = a1;
  objc_sync_enter(obj);
  os_signpost_id_t v13 = objc_msgSend_downloadData(obj, v9, v10, v11, v12);
  uint64_t v18 = objc_msgSend_count(v13, v14, v15, v16, v17);

  uint64_t v23 = objc_msgSend_downloadData(obj, v19, v20, v21, v22);
  uint64_t v26 = objc_msgSend_filteredCapData_maxItems_expirationThresholdInSeconds_(obj, v24, (uint64_t)v23, a3, v25, a6);
  objc_msgSend_setDownloadData_(obj, v27, (uint64_t)v26, v28, v29);

  uint64_t v34 = objc_msgSend_downloadData(obj, v30, v31, v32, v33);
  uint64_t v39 = objc_msgSend_count(v34, v35, v36, v37, v38);

  if (v18 != v39) {
    objc_msgSend_saveCapDataWithReason_(obj, v40, @"Download Data Cleanup", v41, v42);
  }
  objc_sync_exit(obj);
}

void sub_236762A38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

id sub_236762A50(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6)
{
  objc_msgSend_checkAndUpdateToroID(a1, a2, a3, a4, a5);
  id v9 = a1;
  objc_sync_enter(v9);
  uint64_t v14 = objc_msgSend_frequencyCapData(v9, v10, v11, v12, v13);
  uint64_t v19 = objc_msgSend_count(v14, v15, v16, v17, v18);

  uint64_t v24 = objc_msgSend_frequencyCapData(v9, v20, v21, v22, v23);
  uint64_t v27 = objc_msgSend_filteredCapData_maxItems_expirationThresholdInSeconds_(v9, v25, (uint64_t)v24, a3, v26, a6);
  objc_msgSend_setFrequencyCapData_(v9, v28, (uint64_t)v27, v29, v30);

  uint64_t v35 = objc_msgSend_frequencyCapData(v9, v31, v32, v33, v34);
  uint64_t v40 = objc_msgSend_count(v35, v36, v37, v38, v39);

  if (v40 != v19) {
    objc_msgSend_saveCapDataWithReason_(v9, v41, @"Frequency Cap Cleanup", v43, v44);
  }
  uint64_t v45 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v46 = objc_msgSend_frequencyCapData(v9, v41, v42, v43, v44);
  uint64_t v50 = objc_msgSend_capData_(v9, v47, (uint64_t)v46, v48, v49);
  uint64_t v54 = objc_msgSend_dictionaryWithDictionary_(v45, v51, (uint64_t)v50, v52, v53);

  objc_sync_exit(v9);
  return v54;
}

void sub_236762B90(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id sub_236762BAC(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6)
{
  objc_msgSend_checkAndUpdateToroID(a1, a2, a3, a4, a5);
  id v9 = a1;
  objc_sync_enter(v9);
  uint64_t v14 = objc_msgSend_clickCountData(v9, v10, v11, v12, v13);
  uint64_t v19 = objc_msgSend_count(v14, v15, v16, v17, v18);

  uint64_t v24 = objc_msgSend_clickCountData(v9, v20, v21, v22, v23);
  uint64_t v27 = objc_msgSend_filteredCapData_maxItems_expirationThresholdInSeconds_(v9, v25, (uint64_t)v24, a3, v26, a6);
  objc_msgSend_setClickCountData_(v9, v28, (uint64_t)v27, v29, v30);

  uint64_t v35 = objc_msgSend_clickCountData(v9, v31, v32, v33, v34);
  uint64_t v40 = objc_msgSend_count(v35, v36, v37, v38, v39);

  if (v40 != v19) {
    objc_msgSend_saveCapDataWithReason_(v9, v41, @"Landing Click Cleanup", v43, v44);
  }
  uint64_t v45 = (void *)MEMORY[0x263EFF9A0];
  uint64_t v46 = objc_msgSend_clickCountData(v9, v41, v42, v43, v44);
  uint64_t v50 = objc_msgSend_capData_(v9, v47, (uint64_t)v46, v48, v49);
  uint64_t v54 = objc_msgSend_dictionaryWithDictionary_(v45, v51, (uint64_t)v50, v52, v53);

  objc_sync_exit(v9);
  return v54;
}

void sub_236762CEC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_236763268(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained && !*((unsigned char *)WeakRetained + 16))
  {
    *((unsigned char *)WeakRetained + 16) = 1;
    uint64_t v3 = APLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_236756000, v3, OS_LOG_TYPE_DEFAULT, "A notification was received to update to the current user. Waiting 1 second for the DSID to update.", buf, 2u);
    }

    dispatch_time_t v4 = dispatch_time(0, 1000000000);
    id v5 = v2[1];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_23676337C;
    block[3] = &unk_264CADD88;
    uint64_t v7 = v2;
    dispatch_after(v4, v5, block);
  }
}

uint64_t sub_23676337C(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = objc_msgSend_startUpdatingIDs(*(void **)(a1 + 32), a2, a3, a4, a5);
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 0;
  return result;
}

void sub_236764008(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_msgSend_sharedInstance(ADMetricManager, a2, a3, a4, a5);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deactivateAllAdvertisements(v9, v5, v6, v7, v8);
}

void sub_236764050(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  v120[1] = *MEMORY[0x263EF8340];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = a2;
  uint64_t v13 = objc_alloc_init(ADSearchObject);
  objc_msgSend_setSponsoredSearchRequestData_(v13, v14, (uint64_t)v12, v15, v16);

  objc_msgSend_setRoutingInfoData_(v13, v17, (uint64_t)v11, v18, v19);
  objc_msgSend_setDeviceRequestID_(v13, v20, (uint64_t)v10, v21, v22);

  uint64_t v27 = objc_msgSend_sharedInstance(MEMORY[0x263F241D8], v23, v24, v25, v26);
  uint64_t v31 = objc_msgSend_idForClientType_(v27, v28, 4, v29, v30);
  objc_msgSend_setUserTargetingID_(v13, v32, (uint64_t)v31, v33, v34);

  objc_msgSend_setError_(v13, v35, (uint64_t)v9, v36, v37);
  uint64_t v42 = objc_msgSend_sharedInstance(MEMORY[0x263F241D8], v38, v39, v40, v41);
  uint64_t v47 = objc_msgSend_activeDSIDRecord(v42, v43, v44, v45, v46);

  uint64_t v52 = objc_msgSend_sharedInstance(MEMORY[0x263F241C0], v48, v49, v50, v51);
  if (objc_msgSend_isRestrictedRegion(v52, v53, v54, v55, v56))
  {
    uint64_t v61 = APLogForCategory();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v110 = 0;
      _os_log_impl(&dword_236756000, v61, OS_LOG_TYPE_DEFAULT, "This is a no services region. No ad requests allowed to server.", v110, 2u);
    }

    uint64_t v62 = (void *)MEMORY[0x263F087E8];
    uint64_t v63 = *MEMORY[0x263F24138];
    uint64_t v119 = *MEMORY[0x263F08320];
    v120[0] = @"This is a no services region. No search request to be made.";
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v64, (uint64_t)v120, (uint64_t)&v119, 1);
    goto LABEL_9;
  }
  if (objc_msgSend_accountIsU13(v47, v57, v58, v59, v60))
  {
    uint64_t v69 = APLogForCategory();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v110 = 0;
      _os_log_impl(&dword_236756000, v69, OS_LOG_TYPE_DEFAULT, "This is a U13 user. No ad requests allowed to server.", v110, 2u);
    }

    uint64_t v62 = (void *)MEMORY[0x263F087E8];
    uint64_t v63 = *MEMORY[0x263F24138];
    uint64_t v117 = *MEMORY[0x263F08320];
    v118 = @"This is a U13 account. No search request to be made.";
    objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v70, (uint64_t)&v118, (uint64_t)&v117, 1);
    goto LABEL_9;
  }
  v77 = objc_msgSend_userTargetingID(v13, v65, v66, v67, v68);
  if (v77 || (objc_msgSend_error(v13, v78, v79, v80, v81), (v77 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else
  {
    v103 = objc_msgSend_processInfo(MEMORY[0x263F08AB0], v82, v83, v84, v85);
    char isRunningTests = objc_msgSend_isRunningTests(v103, v104, v105, v106, v107);

    if ((isRunningTests & 1) == 0)
    {
      uint64_t v62 = (void *)MEMORY[0x263F087E8];
      uint64_t v63 = *MEMORY[0x263F24138];
      uint64_t v115 = *MEMORY[0x263F08320];
      v116 = @"We were unable to get the 'userTargetingIdentifier'.";
      objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v109, (uint64_t)&v116, (uint64_t)&v115, 1);
      uint64_t v71 = LABEL_9:;
      v73 = objc_msgSend_errorWithDomain_code_userInfo_(v62, v72, v63, 2, (uint64_t)v71);
      objc_msgSend_setError_(v13, v74, (uint64_t)v73, v75, v76);
    }
  }
  double v86 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 40);
  v113 = @"SearchTime";
  id v91 = objc_msgSend_numberWithDouble_(NSNumber, v87, v88, v89, v90, v86);
  v114 = v91;
  uint64_t v93 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v92, (uint64_t)&v114, (uint64_t)&v113, 1);
  AnalyticsSendEvent();

  if (v86 > 0.5)
  {
    v111 = @"ResponseTime";
    v98 = objc_msgSend_numberWithDouble_(NSNumber, v94, v95, v96, v97, v86);
    v112 = v98;
    v100 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v99, (uint64_t)&v112, (uint64_t)&v111, 1);

    CreateDiagnosticReport();
  }
  uint64_t v101 = *(void *)(a1 + 32);
  if (v101)
  {
    v102 = objc_msgSend_error(v13, v94, v95, v96, v97);
    (*(void (**)(uint64_t, ADSearchObject *, void *))(v101 + 16))(v101, v13, v102);
  }
}

void sub_2367645D8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_msgSend_sharedInstance(ADSearchAdsSettings, a2, a3, a4, a5);
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = objc_msgSend_sharedInstance(MEMORY[0x263F24230], v6, v7, v8, v9);
  uint64_t v11 = objc_opt_class();
  uint64_t v16 = objc_msgSend_defaultToroServerURL(v21, v12, v13, v14, v15);
  uint64_t v19 = objc_msgSend_serverURLForMessageClass_serverURL_(v10, v17, v11, (uint64_t)v16, v18);

  uint64_t v20 = *(void *)(a1 + 32);
  if (v20) {
    (*(void (**)(uint64_t, void *))(v20 + 16))(v20, v19);
  }
}

void sub_236764804(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  uint64_t v6 = objc_msgSend_sponsoredSearchRequestForLanguageLocale_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40), a4, a5);
  uint64_t v11 = objc_msgSend_sharedInstance(MEMORY[0x263F24230], v7, v8, v9, v10);
  uint64_t v16 = objc_msgSend_sharedInstance(ADSearchAdsSettings, v12, v13, v14, v15);
  id v17 = objc_alloc(MEMORY[0x263F24218]);
  uint64_t v22 = objc_msgSend_sharedInstance(MEMORY[0x263F241B8], v18, v19, v20, v21);
  uint64_t v25 = objc_msgSend_initWithRoutingType_preferencesStore_(v17, v23, 0, (uint64_t)v22, v24);
  uint64_t v30 = objc_msgSend_payload(v25, v26, v27, v28, v29);

  uint64_t v35 = objc_msgSend_sharedInstance(MEMORY[0x263F241D8], v31, v32, v33, v34);
  objc_msgSend_logIDs_(v35, v36, @"ADSponsoredSearchRequest Current IDs:", v37, v38);

  uint64_t v39 = APLogForCategory();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v40 = objc_opt_class();
    id v41 = v40;
    uint64_t v46 = objc_msgSend_AD_jsonString(v6, v42, v43, v44, v45);
    int v73 = 138412546;
    uint64_t v74 = v40;
    __int16 v75 = 2112;
    uint64_t v76 = v46;
    _os_log_impl(&dword_236756000, v39, OS_LOG_TYPE_DEFAULT, "[%@] Sending an ADSponsoredSearchRequest with Request: %@", (uint8_t *)&v73, 0x16u);
  }
  uint64_t v50 = objc_msgSend_serializeMessage_(v11, v47, (uint64_t)v6, v48, v49);
  uint64_t v54 = objc_msgSend_base64EncodedStringWithOptions_(v50, v51, 0, v52, v53);
  int isTest = objc_msgSend_isTest(v16, v55, v56, v57, v58);
  uint64_t v64 = *(void *)(a1 + 48);
  if (isTest)
  {
    if (v64)
    {
      uint64_t v65 = objc_msgSend_properties(v6, v60, v61, v62, v63);
      uint64_t v70 = objc_msgSend_deviceRequestID(v65, v66, v67, v68, v69);
      (*(void (**)(uint64_t, void *, void *, void *, void))(v64 + 16))(v64, v54, v30, v70, 0);
    }
  }
  else if (v64)
  {
    (*(void (**)(uint64_t, void *, void *, void, void))(v64 + 16))(v64, v54, v30, 0, 0);
  }
  uint64_t v71 = APLogForCategory();
  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
  {
    int v73 = 138412290;
    uint64_t v74 = v30;
    _os_log_impl(&dword_236756000, v71, OS_LOG_TYPE_DEFAULT, "ADSponsoredSearchRequest RoutingInfo Blob: %@", (uint8_t *)&v73, 0xCu);
  }

  v72 = APLogForCategory();
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
  {
    int v73 = 138412290;
    uint64_t v74 = v54;
    _os_log_impl(&dword_236756000, v72, OS_LOG_TYPE_DEFAULT, "ADSponsoredSearchRequest SSR Blob:         %@", (uint8_t *)&v73, 0xCu);
  }
}

void sub_23676696C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v8 = objc_msgSend_workQueue(MEMORY[0x263F24230], v4, v5, v6, v7);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_236766A38;
  v15[3] = &unk_264CADD38;
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(a1 + 40);
  id v16 = v3;
  uint64_t v17 = v9;
  id v18 = v10;
  id v11 = v3;
  objc_msgSend_addOperationWithBlock_(v8, v12, (uint64_t)v15, v13, v14);
}

uint64_t sub_236766A38(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = APLogForCategory();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    uint64_t v3 = objc_opt_class();
    uint64_t v4 = *(void *)(a1 + 32);
    int v10 = 138412546;
    uint64_t v11 = v3;
    __int16 v12 = 2112;
    uint64_t v13 = v4;
    uint64_t v5 = "[%@] An error was returned by StoreKit: %@";
    uint64_t v6 = v2;
    os_log_type_t v7 = OS_LOG_TYPE_ERROR;
    uint32_t v8 = 22;
  }
  else
  {
    uint64_t v2 = APLogForCategory();
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    int v10 = 138412290;
    uint64_t v11 = objc_opt_class();
    uint64_t v5 = "[%@] Install Attribution Update succeeded";
    uint64_t v6 = v2;
    os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
    uint32_t v8 = 12;
  }
  _os_log_impl(&dword_236756000, v6, v7, v5, (uint8_t *)&v10, v8);
LABEL_7:

  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

id ADJourneyMetricsHelper.__allocating_init(promotedContentIdentifier:)(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return ADJourneyMetricsHelper.init(promotedContentIdentifier:)(a1, a2);
}

id ADJourneyMetricsHelper.init(promotedContentIdentifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = a1;
  uint64_t v14 = a2;
  uint64_t v3 = sub_2367680B0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3, v5);
  os_log_type_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint32_t v8 = &v2[OBJC_IVAR___ADJourneyMetricsHelperInternal_appStoreSource];
  *(void *)uint32_t v8 = 3684153;
  *((void *)v8 + 1) = 0xE300000000000000;
  uint64_t v16 = 0;
  unint64_t v17 = 0xE000000000000000;
  uint64_t v9 = v2;
  sub_2367681D0();
  swift_bridgeObjectRelease();
  uint64_t v16 = 0x43676E697373696DLL;
  unint64_t v17 = 0xEF5F747865746E6FLL;
  sub_2367680A0();
  sub_236768090();
  int v10 = *(void (**)(char *, uint64_t))(v4 + 8);
  v10(v7, v3);
  sub_2367681A0();
  swift_bridgeObjectRelease();
  sub_2367680A0();
  sub_236768090();
  v10(v7, v3);
  sub_236768170();
  swift_bridgeObjectRetain();
  *(void *)&v9[OBJC_IVAR___ADJourneyMetricsHelperInternal_helper] = sub_2367680C0();

  uint64_t v11 = (objc_class *)type metadata accessor for ADJourneyMetricsHelper();
  v15.receiver = v9;
  v15.super_class = v11;
  return objc_msgSendSuper2(&v15, sel_init, v13, v14);
}

uint64_t type metadata accessor for ADJourneyMetricsHelper()
{
  return self;
}

uint64_t sub_2367674D4()
{
  return sub_236768100();
}

uint64_t sub_236767560()
{
  return sub_236768120();
}

uint64_t sub_2367675E4()
{
  return sub_236768160();
}

uint64_t sub_236767668()
{
  return sub_236768110();
}

uint64_t sub_2367677AC()
{
  return sub_2367680E0();
}

uint64_t sub_236767828()
{
  return sub_2367680F0();
}

uint64_t sub_2367678B4()
{
  return sub_2367680D0();
}

uint64_t sub_236767930()
{
  return sub_236768150();
}

uint64_t sub_2367679AC()
{
  return sub_236768140();
}

uint64_t sub_236767A30()
{
  return sub_236768130();
}

void sub_236767B3C()
{
  sub_2367681B0();
  sub_236767BEC();
  id v0 = (id)sub_2367681C0();
  sub_236768180();
}

unint64_t sub_236767BEC()
{
  unint64_t result = qword_2688973C8;
  if (!qword_2688973C8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2688973C8);
  }
  return result;
}

id ADJourneyMetricsHelper.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return objc_msgSend(v1, sel_init);
}

void ADJourneyMetricsHelper.init()()
{
}

id ADJourneyMetricsHelper.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ADJourneyMetricsHelper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for ADJourneyMetricsHelper(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for ADJourneyMetricsHelper);
}

uint64_t dispatch thunk of ADJourneyMetricsHelper.__allocating_init(promotedContentIdentifier:)()
{
  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of ADJourneyMetricsHelper.placed()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x68))();
}

uint64_t dispatch thunk of ADJourneyMetricsHelper.onScreen()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of ADJourneyMetricsHelper.offScreen()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of ADJourneyMetricsHelper.visible(starting:duration:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of ADJourneyMetricsHelper.adMarkerInteracted()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of ADJourneyMetricsHelper.getApp(buttonState:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of ADJourneyMetricsHelper.interacted()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of ADJourneyMetricsHelper.delivered()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of ADJourneyMetricsHelper.completed()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of ADJourneyMetricsHelper.received(adamId:impressionId:adMetadata:)()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of ADJourneyMetricsHelper.discarded()()
{
  return (*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & *v0) + 0xB8))();
}

uint64_t sub_236768070()
{
  return MEMORY[0x270EF0BA8]();
}

uint64_t sub_236768080()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_236768090()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_2367680A0()
{
  return MEMORY[0x270EF0D08]();
}

uint64_t sub_2367680B0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_2367680C0()
{
  return MEMORY[0x270F57FD0]();
}

uint64_t sub_2367680D0()
{
  return MEMORY[0x270F57FD8]();
}

uint64_t sub_2367680E0()
{
  return MEMORY[0x270F57FE0]();
}

uint64_t sub_2367680F0()
{
  return MEMORY[0x270F57FE8]();
}

uint64_t sub_236768100()
{
  return MEMORY[0x270F57FF0]();
}

uint64_t sub_236768110()
{
  return MEMORY[0x270F57FF8]();
}

uint64_t sub_236768120()
{
  return MEMORY[0x270F58000]();
}

uint64_t sub_236768130()
{
  return MEMORY[0x270F58008]();
}

uint64_t sub_236768140()
{
  return MEMORY[0x270F58010]();
}

uint64_t sub_236768150()
{
  return MEMORY[0x270F58018]();
}

uint64_t sub_236768160()
{
  return MEMORY[0x270F58020]();
}

uint64_t sub_236768170()
{
  return MEMORY[0x270F58028]();
}

uint64_t sub_236768180()
{
  return MEMORY[0x270FA2C78]();
}

uint64_t sub_236768190()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_2367681A0()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_2367681B0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_2367681C0()
{
  return MEMORY[0x270FA2F00]();
}

uint64_t sub_2367681D0()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t ADCopyDataFromKeychain()
{
  return MEMORY[0x270F0B320]();
}

uint64_t ADWriteDataToKeychain()
{
  return MEMORY[0x270F0B338]();
}

uint64_t APLogForCategory()
{
  return MEMORY[0x270F08BC8]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

uint64_t CreateDiagnosticReport()
{
  return MEMORY[0x270F08BE0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t OdmlLogForCategory()
{
  return MEMORY[0x270F58030]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x270FA0160]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)((uint64_t (*)(id, SEL))MEMORY[0x270F9A6D0])(a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x270EDAA60](log);
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}