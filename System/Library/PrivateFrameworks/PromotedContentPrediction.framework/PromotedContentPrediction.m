uint64_t sub_1BBC45644(uint64_t a1, const char *a2)
{
  uint64_t v2;
  void *v3;
  void v5[5];

  v2 = *(void *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1BBC4873C;
  v5[3] = &unk_1E624A7D8;
  v5[4] = v2;
  return objc_msgSend_loadPersistentStoresWithCompletionHandler_(v3, a2, (uint64_t)v5);
}

uint64_t sub_1BBC45714()
{
  qword_1EB9F98A0 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return MEMORY[0x1F41817F8]();
}

void sub_1BBC457A4(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend_environment(*(void **)(a1 + 32), a2, a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend_objectForKeyedSubscript_(v5, v3, @"XCTestConfigurationFilePath");
  byte_1EB9F98D0 = v4 != 0;
}

void sub_1BBC45D84(uint64_t a1, const char *a2, uint64_t a3)
{
  v4 = objc_msgSend_sharedInstance(APOdmlDatabaseConfiguration, a2, a3);
  char isDaemonProcess = objc_msgSend_isDaemonProcess(v4, v5, v6);

  if ((isDaemonProcess & 1) == 0)
  {
    v10 = objc_msgSend_sharedAssetManagerCoordinator(APOdmlAssetManagerCoordinator, v8, v9);
    v12 = objc_msgSend_assetManagerForPlacementType_assetManagerType_(v10, v11, *(void *)(a1 + 32), *(void *)(a1 + 40));
    v15 = objc_msgSend_currentMLModel(v12, v13, v14);

    if (!v15)
    {
      v16 = OdmlLogForCategory(5uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_1BBC44000, v16, OS_LOG_TYPE_ERROR, "Unable to prewarm ML model", v17, 2u);
      }
    }
  }
}

id sub_1BBC460D4(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = OdmlLogForCategory(5uLL);
  os_signpost_id_t v7 = os_signpost_id_generate(v6);

  v8 = OdmlLogForCategory(5uLL);
  uint64_t v9 = v8;
  unint64_t v10 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BBC44000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "ML Model Loading", (const char *)&unk_1BBC77EAD, buf, 2u);
  }

  id v12 = objc_alloc_init(MEMORY[0x1E4F1E990]);
  if (a4)
  {
    v13 = OdmlLogForCategory(5uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = objc_opt_class();
      *(_DWORD *)buf = 138412290;
      v30 = v14;
      id v15 = v14;
      _os_log_impl(&dword_1BBC44000, v13, OS_LOG_TYPE_DEFAULT, "[%@] Current model is explicitly asked to perform prediction on CPU only.", buf, 0xCu);
    }
    objc_msgSend_setComputeUnits_(v12, v16, 0);
  }
  id v28 = 0;
  v17 = objc_msgSend_modelWithContentsOfURL_configuration_error_(MEMORY[0x1E4F1E968], v11, (uint64_t)v5, v12, &v28);
  id v18 = v28;
  if (v18)
  {
    v19 = OdmlLogForCategory(0);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v30 = v20;
      __int16 v31 = 2112;
      id v32 = v18;
      id v21 = v20;
      _os_log_impl(&dword_1BBC44000, v19, OS_LOG_TYPE_ERROR, "[%@] Error reading compiled MLModel from URL %@", buf, 0x16u);
    }
    v22 = OdmlLogForCategory(5uLL);
    v23 = v22;
    if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBC44000, v23, OS_SIGNPOST_INTERVAL_END, v7, "ML Model Loading", (const char *)&unk_1BBC77EAD, buf, 2u);
    }

    id v24 = 0;
  }
  else
  {
    v25 = OdmlLogForCategory(5uLL);
    v26 = v25;
    if (v10 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBC44000, v26, OS_SIGNPOST_INTERVAL_END, v7, "ML Model Loading", (const char *)&unk_1BBC77EAD, buf, 2u);
    }

    id v24 = v17;
  }

  return v24;
}

void sub_1BBC46674()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v26 = 0;
    _os_log_impl(&dword_1BBC44000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Initializing log categories.", v26, 2u);
  }
  os_log_t v0 = os_log_create("com.apple.adplatforms", "AssetManager");
  v1 = (void *)qword_1EB9F9828[0];
  qword_1EB9F9828[0] = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.adplatforms", "Request");
  v3 = (void *)qword_1EB9F9830;
  qword_1EB9F9830 = (uint64_t)v2;

  os_log_t v4 = os_log_create("com.apple.adplatforms", "Vectors");
  id v5 = (void *)qword_1EB9F9838;
  qword_1EB9F9838 = (uint64_t)v4;

  os_log_t v6 = os_log_create("com.apple.adplatforms", "FeatureCalculation");
  os_signpost_id_t v7 = (void *)qword_1EB9F9840;
  qword_1EB9F9840 = (uint64_t)v6;

  os_log_t v8 = os_log_create("com.apple.adplatforms", "FeatureStorage");
  uint64_t v9 = (void *)qword_1EB9F9848;
  qword_1EB9F9848 = (uint64_t)v8;

  os_log_t v10 = os_log_create("com.apple.adplatforms", "Response");
  v11 = (void *)qword_1EB9F9850;
  qword_1EB9F9850 = (uint64_t)v10;

  os_log_t v12 = os_log_create("com.apple.adplatforms", "Extensions");
  v13 = (void *)qword_1EB9F9858;
  qword_1EB9F9858 = (uint64_t)v12;

  os_log_t v14 = os_log_create("com.apple.adplatforms", "AllowList");
  id v15 = (void *)qword_1EB9F9860;
  qword_1EB9F9860 = (uint64_t)v14;

  os_log_t v16 = os_log_create("com.apple.adplatforms", "Analytics");
  v17 = (void *)qword_1EB9F9868;
  qword_1EB9F9868 = (uint64_t)v16;

  os_log_t v18 = os_log_create("com.apple.adplatforms", "DODMLLogging");
  v19 = (void *)qword_1EB9F9870;
  qword_1EB9F9870 = (uint64_t)v18;

  os_log_t v20 = os_log_create("com.apple.adplatforms", "FatalError");
  id v21 = (void *)qword_1EB9F9878;
  qword_1EB9F9878 = (uint64_t)v20;

  os_log_t v22 = os_log_create("com.apple.adplatforms", "APOdmlSearchResultsExtension");
  v23 = (void *)qword_1EB9F9880;
  qword_1EB9F9880 = (uint64_t)v22;

  os_log_t v24 = os_log_create("com.apple.adplatforms", "BiomeStorage");
  v25 = (void *)qword_1EB9F9888;
  qword_1EB9F9888 = (uint64_t)v24;
}

void sub_1BBC4739C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBC4873C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  os_signpost_id_t v7 = OdmlLogForCategory(4uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    os_log_t v8 = objc_opt_class();
    id v9 = v8;
    os_log_t v12 = objc_msgSend_options(v5, v10, v11);
    int v47 = 138478083;
    v48 = v8;
    __int16 v49 = 2113;
    id v50 = v12;
    _os_log_impl(&dword_1BBC44000, v7, OS_LOG_TYPE_DEFAULT, "[%{private}@] NSPersistentStoreDescription: %{private}@", (uint8_t *)&v47, 0x16u);
  }
  v13 = OdmlLogForCategory(4uLL);
  os_log_t v14 = v13;
  if (v6)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      id v15 = objc_opt_class();
      int v47 = 138478083;
      v48 = v15;
      __int16 v49 = 2112;
      id v50 = v6;
      id v16 = v15;
      _os_log_impl(&dword_1BBC44000, v14, OS_LOG_TYPE_ERROR, "[%{private}@] Failed to load Core Data stack with error: %@", (uint8_t *)&v47, 0x16u);
    }
    os_log_t v18 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v17, @"APOdmlFeatureStorageErrorDomain", 5002, 0);
    v19 = (void *)MEMORY[0x1E4F1C9E8];
    os_log_t v20 = NSNumber;
    uint64_t v23 = objc_msgSend_numLaunchesAttempted(*(void **)(a1 + 32), v21, v22);
    v25 = objc_msgSend_numberWithInt_(v20, v24, v23);
    v27 = objc_msgSend_dictionaryWithObject_forKey_(v19, v26, (uint64_t)v25, @"numberAttempts");

    objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsFeatureStorage, v28, (uint64_t)v18, v27);
    uint64_t v29 = *(void *)(a1 + 32);
    id v30 = v6;
    id v31 = *(id *)(v29 + 24);
    *(void *)(v29 + 24) = v30;
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v32 = objc_opt_class();
      int v47 = 138477827;
      v48 = v32;
      id v33 = v32;
      _os_log_impl(&dword_1BBC44000, v14, OS_LOG_TYPE_DEFAULT, "[%{private}@] Successfully loaded Core Data stack", (uint8_t *)&v47, 0xCu);
    }
    os_log_t v18 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v34, @"APOdmlFeatureStorageErrorDomain", 5003, 0);
    v35 = (void *)MEMORY[0x1E4F1C9E8];
    v36 = NSNumber;
    v38 = *(void **)(a1 + 32);
    v37 = (id *)(a1 + 32);
    uint64_t v41 = objc_msgSend_numLaunchesAttempted(v38, v39, v40);
    v43 = objc_msgSend_numberWithInt_(v36, v42, v41);
    v27 = objc_msgSend_dictionaryWithObject_forKey_(v35, v44, (uint64_t)v43, @"numberAttempts");

    objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsFeatureStorage, v45, (uint64_t)v18, v27);
    id v31 = *v37;
    objc_sync_enter(v31);
    objc_msgSend_setCoreDataIsInitialized_(*v37, v46, 1);
    objc_sync_exit(v31);
  }
}

void sub_1BBC48A94(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id OdmlLogForCategory(unint64_t a1)
{
  if (a1 >= 0xD) {
    sub_1BBC70E8C();
  }
  if (qword_1EB9F9818 != -1) {
    dispatch_once(&qword_1EB9F9818, &unk_1F14FE7D8);
  }
  os_log_t v2 = (void *)qword_1EB9F9828[a1];

  return v2;
}

uint64_t sub_1BBC48C74()
{
  qword_1EB9F9820 = objc_alloc_init(APOdmlAssetManagerCoordinator);

  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1BBC48CB0()
{
  qword_1EB9F98C8 = objc_alloc_init(APOdmlAllowList);

  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1BBC48CEC(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1BBC457A4;
  block[3] = &unk_1E624A800;
  block[4] = a1;
  if (qword_1EB9F98D8 != -1) {
    dispatch_once(&qword_1EB9F98D8, block);
  }
  return byte_1EB9F98D0;
}

uint64_t sub_1BBC49250()
{
  qword_1EB9F9898 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return MEMORY[0x1F41817F8]();
}

uint64_t sub_1BBC49A90(void *a1, const char *a2, uint64_t a3)
{
  os_log_t v4 = objc_msgSend_evaluationMetrics(a1, a2, a3);
  uint64_t v7 = objc_msgSend_count(v4, v5, v6);

  if (v7 < 1)
  {
    double v11 = 0.0;
  }
  else
  {
    uint64_t v10 = 0;
    double v11 = 0.0;
    do
    {
      os_log_t v12 = objc_msgSend_evaluationMetrics(a1, v8, v9);
      os_log_t v14 = objc_msgSend_featuresAtIndex_(v12, v13, v10);

      id v16 = objc_msgSend_featureValueForName_(v14, v15, @"Identity_1");
      v19 = objc_msgSend_multiArrayValue(v16, v17, v18);
      id v21 = objc_msgSend_objectAtIndexedSubscript_(v19, v20, 0);

      objc_msgSend_doubleValue(v21, v22, v23);
      double v11 = v11 + v24;

      ++v10;
    }
    while (v7 != v10);
  }
  v25 = NSNumber;

  return objc_msgSend_numberWithDouble_(v25, v8, v9, v11 / (double)v7);
}

id sub_1BBC49BA4(void *a1, uint64_t a2, void *a3)
{
  id v55 = a3;
  uint64_t v6 = objc_msgSend_evaluationMetrics(a1, v4, v5);
  uint64_t v9 = objc_msgSend_count(v6, v7, v8);

  if (v9 < 1)
  {
    int v56 = 0;
  }
  else
  {
    int v56 = 0;
    uint64_t v12 = 0;
    uint64_t v54 = v9;
    do
    {
      v13 = objc_msgSend_evaluationMetrics(a1, v10, v11);
      id v15 = objc_msgSend_featuresAtIndex_(v13, v14, v12);

      v17 = objc_msgSend_featureValueForName_(v15, v16, @"Identity_0");
      os_log_t v20 = v17;
      if (v17)
      {
        id v21 = objc_msgSend_multiArrayValue(v17, v18, v19);
        uint64_t v23 = objc_msgSend_objectAtIndexedSubscript_(v21, v22, 0);
        objc_msgSend_doubleValue(v23, v24, v25);
        double v27 = v26;
        uint64_t v30 = objc_msgSend_count(v21, v28, v29);

        uint64_t v33 = objc_msgSend_count(v21, v31, v32);
        v35 = objc_msgSend_featuresAtIndex_(v55, v34, v12);
        v37 = objc_msgSend_featureValueForName_(v35, v36, @"label_input_0");
        uint64_t v40 = v37;
        if (v37)
        {
          double v41 = v27 + (double)(v30 * v12);
          double v42 = v41 + (double)v33;
          if (v41 >= v42) {
            double v42 = v27 + (double)(v30 * v12);
          }
          v43 = a1;
          int v44 = (int)(v42 - v41);
          v45 = objc_msgSend_multiArrayValue(v37, v38, v39);
          int v47 = objc_msgSend_objectAtIndexedSubscript_(v45, v46, 0);

          BOOL v50 = objc_msgSend_intValue(v47, v48, v49) == v44;
          a1 = v43;
          uint64_t v9 = v54;
          if (v50) {
            int v51 = v56 + 1;
          }
          else {
            int v51 = v56;
          }
          int v56 = v51;
        }
      }

      ++v12;
    }
    while (v9 != v12);
  }
  v52 = objc_msgSend_numberWithInteger_(NSNumber, v10, v56 / v9);

  return v52;
}

BOOL sub_1BBC4A3C0(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_msgSend_isAppStoreVendable(v2, v3, v4))
  {
    uint64_t v9 = objc_msgSend_bundleIdentifier(v2, v5, v6);
    if (v9)
    {
      uint64_t v10 = objc_msgSend_bundleIdentifier(v2, v7, v8);
      BOOL v13 = objc_msgSend_length(v10, v11, v12) != 0;
    }
    else
    {
      BOOL v13 = 0;
    }
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

void sub_1BBC4A480(uint64_t a1, const char *a2, uint64_t a3)
{
  if (objc_msgSend_respondToRefreshNotification(*(void **)(a1 + 32), a2, a3))
  {
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = (void *)MEMORY[0x1E4F1C978];
    objc_msgSend_numberWithUnsignedLong_(NSNumber, v4, 0);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = objc_msgSend_arrayWithObjects_(v6, v7, (uint64_t)v10, 0);
    objc_msgSend_refreshTrialClientForPlacementTypes_(v5, v9, (uint64_t)v8);
  }
}

void sub_1BBC4A5F8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_msgSend_trialClient(WeakRetained, v1, v2);
  objc_msgSend_refresh(v3, v4, v5);
}

void sub_1BBC4A9DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BBC4AF00(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BBC4B08C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BBC4B2B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1BBC4B4B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_1BBC4B82C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }

  _Unwind_Resume(a1);
}

void sub_1BBC4BA64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  BOOL v13 = v12;

  _Unwind_Resume(a1);
}

void sub_1BBC4BC68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  a9.super_class = (Class)APOdmlEspressoIOBufferController;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1BBC4BCD4(uint64_t a1, const char *a2, void *a3)
{
  v3 = objc_msgSend_bufferPointer(a3, a2, (uint64_t)a3);
  if (v3)
  {
    free(v3);
  }
  else
  {
    uint64_t v4 = OdmlLogForCategory(0xBuLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_1BBC44000, v4, OS_LOG_TYPE_ERROR, "Input buffer is released too early.", v5, 2u);
    }
  }
}

void sub_1BBC4BD6C(void *a1)
{
}

void *sub_1BBC4BE98(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_1BBC4BF10(a1, a2);
    uint64_t v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_1BBC4BEF4(_Unwind_Exception *exception_object)
{
  v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_1BBC4BF10(void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_1BBC4BF54();
  }
  result = (char *)sub_1BBC4BF6C((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void sub_1BBC4BF54()
{
}

void *sub_1BBC4BF6C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    sub_1BBC4C034();
  }
  return operator new(8 * a2);
}

void sub_1BBC4BFA4(const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_1BBC4C000(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E624A4C8, MEMORY[0x1E4FBA1C8]);
}

void sub_1BBC4BFEC(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_1BBC4C000(std::logic_error *a1, const char *a2)
{
  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E4FBA4D0] + 16);
  return result;
}

void sub_1BBC4C034()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  uint64_t v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E4FBA350], MEMORY[0x1E4FBA1F8]);
}

uint64_t sub_1BBC4C28C()
{
  return 1;
}

id sub_1BBC4C770(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v32[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v32[0] = v5;
  uint64_t v7 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v6, (uint64_t)v32, 1);
  id v8 = objc_alloc(MEMORY[0x1E4F1E9A8]);
  id v27 = 0;
  id v10 = objc_msgSend_initWithShape_dataType_error_(v8, v9, (uint64_t)v7, 65600, &v27);
  id v13 = v27;
  if (v13)
  {
    os_log_t v14 = OdmlLogForCategory(6uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      uint64_t v29 = v15;
      __int16 v30 = 2112;
      id v31 = v13;
      id v16 = v15;
      _os_log_impl(&dword_1BBC44000, v14, OS_LOG_TYPE_ERROR, "[%@] Error creating multiarray: %@", buf, 0x16u);
    }
    id v17 = 0;
  }
  else
  {
    if (objc_msgSend_unsignedLongValue(v5, v11, v12))
    {
      unint64_t v21 = 0;
      do
      {
        LODWORD(v20) = *(_DWORD *)(a3 + 4 * v21);
        uint64_t v22 = objc_msgSend_numberWithFloat_(NSNumber, v18, v19, v20);
        objc_msgSend_setObject_atIndexedSubscript_(v10, v23, (uint64_t)v22, v21);

        ++v21;
      }
      while (v21 < objc_msgSend_unsignedLongValue(v5, v24, v25));
    }
    id v17 = v10;
  }

  return v17;
}

id sub_1BBC4C938(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void v32[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  v32[0] = &unk_1F1506668;
  v32[1] = v5;
  uint64_t v7 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v6, (uint64_t)v32, 2);
  id v8 = objc_alloc(MEMORY[0x1E4F1E9A8]);
  id v27 = 0;
  id v10 = objc_msgSend_initWithShape_dataType_error_(v8, v9, (uint64_t)v7, 65600, &v27);
  id v13 = v27;
  if (v13)
  {
    os_log_t v14 = OdmlLogForCategory(6uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      id v15 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      uint64_t v29 = v15;
      __int16 v30 = 2112;
      id v31 = v13;
      id v16 = v15;
      _os_log_impl(&dword_1BBC44000, v14, OS_LOG_TYPE_ERROR, "[%@] Error creating multiarray: %@", buf, 0x16u);
    }
    id v17 = 0;
  }
  else
  {
    if (objc_msgSend_unsignedLongValue(v5, v11, v12))
    {
      unint64_t v21 = 0;
      do
      {
        LODWORD(v20) = *(_DWORD *)(a3 + 4 * v21);
        uint64_t v22 = objc_msgSend_numberWithFloat_(NSNumber, v18, v19, v20);
        objc_msgSend_setObject_atIndexedSubscript_(v10, v23, (uint64_t)v22, v21);

        ++v21;
      }
      while (v21 < objc_msgSend_unsignedLongValue(v5, v24, v25));
    }
    id v17 = v10;
  }

  return v17;
}

id sub_1BBC4CB08(uint64_t a1, uint64_t a2, void *a3)
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = NSNumber;
  uint64_t v7 = objc_msgSend_count(v3, v5, v6);
  uint64_t v9 = objc_msgSend_numberWithUnsignedInteger_(v4, v8, v7);
  v34[0] = v9;
  uint64_t v11 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v10, (uint64_t)v34, 1);
  id v12 = objc_alloc(MEMORY[0x1E4F1E9A8]);
  id v29 = 0;
  os_log_t v14 = objc_msgSend_initWithShape_dataType_error_(v12, v13, (uint64_t)v11, 65600, &v29);
  id v17 = v29;
  if (v17)
  {
    uint64_t v18 = OdmlLogForCategory(6uLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      id v31 = v19;
      __int16 v32 = 2112;
      id v33 = v17;
      id v20 = v19;
      _os_log_impl(&dword_1BBC44000, v18, OS_LOG_TYPE_ERROR, "[%@] Error creating multiarray: %@", buf, 0x16u);
    }
    id v21 = 0;
  }
  else
  {
    if (objc_msgSend_count(v3, v15, v16))
    {
      unint64_t v23 = 0;
      do
      {
        double v24 = objc_msgSend_objectAtIndexedSubscript_(v3, v22, v23);
        objc_msgSend_setObject_atIndexedSubscript_(v14, v25, (uint64_t)v24, v23);

        ++v23;
      }
      while (v23 < objc_msgSend_count(v3, v26, v27));
    }
    id v21 = v14;
  }

  return v21;
}

id sub_1BBC4CCEC(uint64_t a1, uint64_t a2, void *a3)
{
  void v34[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = NSNumber;
  uint64_t v7 = objc_msgSend_count(v3, v5, v6);
  uint64_t v9 = objc_msgSend_numberWithUnsignedInteger_(v4, v8, v7);
  v34[0] = &unk_1F1506668;
  v34[1] = v9;
  uint64_t v11 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v10, (uint64_t)v34, 2);
  id v12 = objc_alloc(MEMORY[0x1E4F1E9A8]);
  id v29 = 0;
  os_log_t v14 = objc_msgSend_initWithShape_dataType_error_(v12, v13, (uint64_t)v11, 65600, &v29);
  id v17 = v29;
  if (v17)
  {
    uint64_t v18 = OdmlLogForCategory(6uLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      id v31 = v19;
      __int16 v32 = 2112;
      id v33 = v17;
      id v20 = v19;
      _os_log_impl(&dword_1BBC44000, v18, OS_LOG_TYPE_ERROR, "[%@] Error creating multiarray: %@", buf, 0x16u);
    }
    id v21 = 0;
  }
  else
  {
    if (objc_msgSend_count(v3, v15, v16))
    {
      unint64_t v23 = 0;
      do
      {
        double v24 = objc_msgSend_objectAtIndexedSubscript_(v3, v22, v23);
        objc_msgSend_setObject_atIndexedSubscript_(v14, v25, (uint64_t)v24, v23);

        ++v23;
      }
      while (v23 < objc_msgSend_count(v3, v26, v27));
    }
    id v21 = v14;
  }

  return v21;
}

id sub_1BBC4CED8(uint64_t a1, uint64_t a2, void *a3)
{
  v37[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc(NSNumber);
  uint64_t v7 = objc_msgSend_doubleValuesCount(v3, v5, v6);
  uint64_t v9 = objc_msgSend_initWithUnsignedLong_(v4, v8, v7);
  v37[0] = &unk_1F1506668;
  v37[1] = v9;
  uint64_t v11 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v10, (uint64_t)v37, 2);
  id v12 = objc_alloc(MEMORY[0x1E4F1E9A8]);
  id v32 = 0;
  os_log_t v14 = objc_msgSend_initWithShape_dataType_error_(v12, v13, (uint64_t)v11, 65600, &v32);
  id v17 = v32;
  if (v17)
  {
    uint64_t v18 = OdmlLogForCategory(6uLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v34 = v19;
      __int16 v35 = 2112;
      id v36 = v17;
      id v20 = v19;
      _os_log_impl(&dword_1BBC44000, v18, OS_LOG_TYPE_ERROR, "[%@] Error creating multiarray: %@", buf, 0x16u);
    }
    id v21 = 0;
  }
  else
  {
    if (objc_msgSend_doubleValuesCount(v3, v15, v16))
    {
      unint64_t v22 = 0;
      do
      {
        id v23 = objc_alloc(NSNumber);
        objc_msgSend_doubleValueAtIndex_(v3, v24, v22);
        uint64_t v27 = objc_msgSend_initWithDouble_(v23, v25, v26);
        objc_msgSend_setObject_atIndexedSubscript_(v14, v28, (uint64_t)v27, v22);

        ++v22;
      }
      while (v22 < objc_msgSend_doubleValuesCount(v3, v29, v30));
    }
    id v21 = v14;
  }

  return v21;
}

id sub_1BBC4D0DC(uint64_t a1, uint64_t a2, void *a3)
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc(NSNumber);
  uint64_t v7 = objc_msgSend_doubleValuesCount(v3, v5, v6);
  uint64_t v9 = objc_msgSend_initWithUnsignedLong_(v4, v8, v7);
  v37[0] = v9;
  uint64_t v11 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v10, (uint64_t)v37, 1);
  id v12 = objc_alloc(MEMORY[0x1E4F1E9A8]);
  id v32 = 0;
  os_log_t v14 = objc_msgSend_initWithShape_dataType_error_(v12, v13, (uint64_t)v11, 65600, &v32);
  id v17 = v32;
  if (v17)
  {
    uint64_t v18 = OdmlLogForCategory(6uLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v34 = v19;
      __int16 v35 = 2112;
      id v36 = v17;
      id v20 = v19;
      _os_log_impl(&dword_1BBC44000, v18, OS_LOG_TYPE_ERROR, "[%@] Error creating multiarray: %@", buf, 0x16u);
    }
    id v21 = 0;
  }
  else
  {
    if (objc_msgSend_doubleValuesCount(v3, v15, v16))
    {
      unint64_t v22 = 0;
      do
      {
        id v23 = objc_alloc(NSNumber);
        objc_msgSend_doubleValueAtIndex_(v3, v24, v22);
        uint64_t v27 = objc_msgSend_initWithDouble_(v23, v25, v26);
        objc_msgSend_setObject_atIndexedSubscript_(v14, v28, (uint64_t)v27, v22);

        ++v22;
      }
      while (v22 < objc_msgSend_doubleValuesCount(v3, v29, v30));
    }
    id v21 = v14;
  }

  return v21;
}

id sub_1BBC4D2D8(void *a1, const char *a2, uint64_t a3)
{
  id v4 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, a3);
  if (objc_msgSend_count(a1, v5, v6) >= 1)
  {
    uint64_t v9 = 0;
    do
    {
      id v10 = objc_msgSend_objectAtIndexedSubscript_(a1, v7, v9);
      objc_msgSend_addObject_(v4, v11, (uint64_t)v10);

      ++v9;
    }
    while (v9 < objc_msgSend_count(a1, v12, v13));
  }
  os_log_t v14 = objc_msgSend_copy(v4, v7, v8);

  return v14;
}

uint64_t sub_1BBC4D41C(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3 = objc_msgSend_length(a1, a2, a3);
  return objc_msgSend_stringWithFormat_(NSString, v4, @"Binary data, %ld bytes, ...", v3);
}

void sub_1BBC4D604(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  objc_msgSend_dictionary(a2, (const char *)a2, a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, uint64_t))(v4 + 16))(v4, v5, a3);
}

uint64_t sub_1BBC4D76C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = objc_msgSend_dictionary(a2, (const char *)a2, a3);
  uint64_t v5 = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  return v5;
}

void sub_1BBC4D7BC(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  objc_msgSend_dictionary(a2, (const char *)a2, a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, uint64_t))(v4 + 16))(v4, v5, a3);
}

uint64_t sub_1BBC4D974(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = objc_msgSend_eventBody(a2, (const char *)a2, a3);
  uint64_t v5 = (*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v4);

  return v5;
}

uint64_t sub_1BBC4D9D0()
{
  return 1;
}

uint64_t sub_1BBC4DA6C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = objc_msgSend_dictionary(a2, (const char *)a2, a3);
  uint64_t v6 = (*(uint64_t (**)(uint64_t, void *, uint64_t))(v4 + 16))(v4, v5, a3);

  return v6;
}

uint64_t sub_1BBC4DB78(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = objc_msgSend_eventBody(a2, (const char *)a2, a3);
  uint64_t v6 = (*(uint64_t (**)(uint64_t, void *, uint64_t))(v4 + 16))(v4, v5, a3);

  return v6;
}

void sub_1BBC4DD64(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1BBC4DD7C(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (objc_msgSend_state(v3, v4, v5))
  {
    uint64_t v6 = OdmlLogForCategory(0xCuLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = *(void **)(a1 + 32);
      id v9 = v7;
      id v12 = objc_msgSend_streamName(v8, v10, v11);
      id v15 = objc_msgSend_error(v3, v13, v14);
      uint64_t v18 = objc_msgSend_code(v15, v16, v17);
      id v21 = objc_msgSend_error(v3, v19, v20);
      double v24 = objc_msgSend_localizedDescription(v21, v22, v23);
      int v25 = 138478595;
      uint64_t v26 = v7;
      __int16 v27 = 2114;
      id v28 = v12;
      __int16 v29 = 2048;
      uint64_t v30 = v18;
      __int16 v31 = 2114;
      id v32 = v24;
      _os_log_impl(&dword_1BBC44000, v6, OS_LOG_TYPE_ERROR, "[%{private}@] Stream %{public}@ failed with error %ld: %{public}@", (uint8_t *)&v25, 0x2Au);
    }
  }
}

BOOL sub_1BBC4DEE8(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = objc_msgSend_eventBody(a2, (const char *)a2, a3);
  (*(void (**)(uint64_t, void *, uint64_t))(v4 + 16))(v4, v5, *(void *)(*(void *)(a1 + 40) + 8) + 24);

  return *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == 0;
}

unint64_t sub_1BBC4E874(void *a1, const char *a2, uint64_t a3)
{
  unint64_t result = objc_msgSend_count(a1, a2, a3);
  if (result >= 2)
  {
    unint64_t v5 = result;
    uint64_t v6 = 0;
    do
    {
      uint32_t v7 = arc4random_uniform(v5);
      unint64_t result = objc_msgSend_exchangeObjectAtIndex_withObjectAtIndex_(a1, v8, v6, v6 + v7);
      ++v6;
      --v5;
    }
    while (v5 != 1);
  }
  return result;
}

void sub_1BBC4EBD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1BBC4EC0C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1BBC4EC1C(uint64_t a1)
{
}

uint64_t sub_1BBC4EC24(uint64_t a1, const char *a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend_value(*(void **)(a1 + 32), a2, a3);

  return MEMORY[0x1F41817F8]();
}

void sub_1BBC4EFE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  objc_sync_exit(v29);
  _Unwind_Resume(a1);
}

uint64_t sub_1BBC4F01C(uint64_t a1, const char *a2, uint64_t a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_msgSend_value(*(void **)(a1 + 32), a2, a3);

  return MEMORY[0x1F41817F8]();
}

void sub_1BBC4F750(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1BBC4F7AC(void *a1, const char *a2)
{
  id v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  uint64_t v5 = *(void *)(a1[7] + 8);
  id obj = *(id *)(v5 + 40);
  uint64_t v6 = objc_msgSend_executeFetchRequest_error_(v3, a2, v4, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  uint64_t v7 = *(void *)(a1[6] + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void sub_1BBC4FB9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBC4FBDC(uint64_t a1, const char *a2)
{
  id v3 = objc_msgSend_insertNewObjectForEntityForName_inManagedObjectContext_(MEMORY[0x1E4F1C0A8], a2, @"Feature", *(void *)(a1 + 32));
  uint64_t v6 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v4, v5);
  objc_msgSend_setCreatedAt_(v3, v7, (uint64_t)v6);

  uint64_t v10 = objc_msgSend_deploymentID(*(void **)(a1 + 40), v8, v9);
  objc_msgSend_setDeploymentID_(v3, v11, v10);
  uint64_t v14 = objc_msgSend_experimentID(*(void **)(a1 + 40), v12, v13);
  objc_msgSend_setExperimentID_(v3, v15, (uint64_t)v14);

  uint64_t v18 = objc_msgSend_treatmentID(*(void **)(a1 + 40), v16, v17);
  objc_msgSend_setTreatmentID_(v3, v19, (uint64_t)v18);

  objc_msgSend_setFeatureType_(v3, v20, *(void *)(a1 + 48));
  objc_msgSend_setValue_(v3, v21, *(void *)(a1 + 56));
  unint64_t v22 = *(void **)(a1 + 32);
  uint64_t v23 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v23 + 40);
  objc_msgSend_save_(v22, v24, (uint64_t)&obj);
  objc_storeStrong((id *)(v23 + 40), obj);
}

void sub_1BBC50154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

uint64_t sub_1BBC50198(uint64_t a1)
{
  return MEMORY[0x1F4181798](*(void *)(a1 + 32), sel_deleteObject_, *(void *)(a1 + 40));
}

void sub_1BBC501A4(uint64_t a1, const char *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id obj = *(id *)(v3 + 40);
  objc_msgSend_save_(v2, a2, (uint64_t)&obj);
  objc_storeStrong((id *)(v3 + 40), obj);
}

uint64_t sub_1BBC502E4()
{
  return MGGetBoolAnswer();
}

uint64_t sub_1BBC502F0(uint64_t a1, const char *a2)
{
  return objc_msgSend_setWithObjects_(MEMORY[0x1E4F1CAD0], a2, @"AppDownloadVector", @"AppInstalledVector", @"AppUsageVector", @"appUsageVector", 0);
}

uint64_t sub_1BBC50350(uint64_t a1, const char *a2)
{
  return objc_msgSend_setWithObjects_(MEMORY[0x1E4F1CAD0], a2, @"DupeFirstOrganic", @"Installed", @"Tapped", @"Tap", @"Impressed", 0);
}

uint64_t sub_1BBC503C0(uint64_t a1, const char *a2)
{
  return objc_msgSend_setWithObjects_(MEMORY[0x1E4F1CAD0], a2, @"DupeFirstOrganic", @"Installed", @"Tapped", 0);
}

void sub_1BBC52050(uint64_t a1, void *a2)
{
  id v8 = a2;
  uint64_t v3 = objc_opt_class();
  uint64_t v5 = objc_msgSend_translateFeatureKeyToDESKey_(v3, v4, (uint64_t)v8);
  if (objc_msgSend_containsObject_(*(void **)(a1 + 32), v6, (uint64_t)v5)) {
    objc_msgSend_setObject_forKeyedSubscript_(*(void **)(a1 + 40), v7, (uint64_t)v5, v8);
  }
}

void sub_1BBC527AC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BBC52AAC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BBC537E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,void *a21,void *a22,void *a23,void *a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29)
{
  _Unwind_Resume(a1);
}

void sub_1BBC53B7C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BBC53D60(_Unwind_Exception *a1)
{
  uint64_t v7 = v6;

  _Unwind_Resume(a1);
}

void sub_1BBC558B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BBC55B70(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BBC55C68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BBC55F94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,void *a23,uint64_t a24,uint64_t a25,void *a26,uint64_t a27,uint64_t a28,void *a29,uint64_t a30)
{
  if (__p) {
    operator delete(__p);
  }
  if (a20) {
    operator delete(a20);
  }
  if (a23) {
    operator delete(a23);
  }
  if (a26) {
    operator delete(a26);
  }
  if (a29) {
    operator delete(a29);
  }
  uint64_t v33 = *(void **)(v31 - 136);
  if (v33)
  {
    *(void *)(v31 - 128) = v33;
    operator delete(v33);
  }

  _Unwind_Resume(a1);
}

void sub_1BBC5615C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BBC5632C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BBC56578(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BBC5699C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  _Unwind_Resume(a1);
}

void sub_1BBC56C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1BBC56DCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BBC56EF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BBC57310(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1BBC57684(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BBC57948(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(a1);
}

void sub_1BBC57E58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BBC57F68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BBC58030(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_1BBC5816C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)APOdmlEspressoFacade;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void *sub_1BBC58238(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    sub_1BBC582EC();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    uint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    uint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void sub_1BBC582EC()
{
}

void *sub_1BBC58304(void *a1, unint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_1BBC5837C(a1, a2);
    size_t v4 = (char *)a1[1];
    bzero(v4, 4 * a2);
    a1[1] = &v4[4 * a2];
  }
  return a1;
}

void sub_1BBC58360(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *sub_1BBC5837C(void *a1, unint64_t a2)
{
  if (a2 >> 62) {
    sub_1BBC4BF54();
  }
  unint64_t result = (char *)sub_1BBC583C0((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void *sub_1BBC583C0(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    sub_1BBC4C034();
  }
  return operator new(4 * a2);
}

void *sub_1BBC583F8(void *result, const void *a2, uint64_t a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    unint64_t result = sub_1BBC4BF10(result, a4);
    uint64_t v7 = v6[1];
    size_t v8 = a3 - (void)a2;
    if (v8) {
      unint64_t result = memmove((void *)v6[1], a2, v8);
    }
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1BBC58458(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void *sub_1BBC58474(void *a1, unint64_t a2, _DWORD *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    sub_1BBC5837C(a1, a2);
    uint64_t v6 = (_DWORD *)a1[1];
    uint64_t v7 = &v6[a2];
    uint64_t v8 = 4 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 4;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_1BBC584DC(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void sub_1BBC596AC(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  objc_msgSend_adamIDtoBundleID(v4, v7, v8);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setObject_forKeyedSubscript_(v10, v9, (uint64_t)v6, v5);
}

__CFString *sub_1BBC59B5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = @"Unknown";
  if (a3 == 1) {
    uint64_t v3 = @"Counterfactual";
  }
  if (a3) {
    return v3;
  }
  else {
    return @"Runtime";
  }
}

__CFString *sub_1BBC59B88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = @"Unknown";
  if (a3 == 1) {
    uint64_t v3 = @"SLP";
  }
  if (a3) {
    return v3;
  }
  else {
    return @"SRP";
  }
}

__CFString *sub_1BBC59BB4(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a3 > 2) {
    return @"Unknown";
  }
  else {
    return off_1E624A938[a3];
  }
}

void APOdmlSimulateCrash(uint64_t a1, void *a2, int a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = OdmlLogForCategory(0xAuLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v13 = 138412290;
    id v14 = v4;
    _os_log_impl(&dword_1BBC44000, v5, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v13, 0xCu);
  }

  uint64_t v8 = objc_msgSend_processInfo(MEMORY[0x1E4F28F80], v6, v7);
  int isRunningTests = objc_msgSend_isRunningTests(v8, v9, v10);

  if (isRunningTests)
  {
    id v12 = OdmlLogForCategory(0xAuLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1BBC44000, v12, OS_LOG_TYPE_ERROR, "SimCrash called; we should exit at this point. If you see this log outside of the Unit Tests, Please file a radar...",
        (uint8_t *)&v13,
        2u);
    }
  }
  else
  {
    getpid();
    SimulateCrash();
    if (a3) {
      exit(1);
    }
  }
}

uint64_t ADOdmlResponseV2ReadFrom(unsigned char *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  id v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    do
    {
      if (*(unsigned char *)(a2 + *v5)) {
        break;
      }
      char v8 = 0;
      unsigned int v9 = 0;
      unint64_t v10 = 0;
      while (1)
      {
        uint64_t v11 = *v3;
        unint64_t v12 = *(void *)(a2 + v11);
        if (v12 == -1 || v12 >= *(void *)(a2 + *v4)) {
          break;
        }
        char v13 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
        *(void *)(a2 + v11) = v12 + 1;
        v10 |= (unint64_t)(v13 & 0x7F) << v8;
        if ((v13 & 0x80) == 0) {
          goto LABEL_12;
        }
        v8 += 7;
        BOOL v14 = v9++ >= 9;
        if (v14)
        {
          unint64_t v10 = 0;
          int v15 = *(unsigned __int8 *)(a2 + *v5);
          goto LABEL_14;
        }
      }
      *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
      int v15 = *(unsigned __int8 *)(a2 + *v5);
      if (*(unsigned char *)(a2 + *v5)) {
        unint64_t v10 = 0;
      }
LABEL_14:
      if (v15 || (v10 & 7) == 4) {
        break;
      }
      if ((v10 >> 3) == 2)
      {
        uint64_t v23 = objc_alloc_init(ADFeature);
        objc_msgSend_addFeatures_(a1, v24, (uint64_t)v23);
        if (!PBReaderPlaceMark() || (ADFeatureReadFrom((char *)v23, a2) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
      }
      else if ((v10 >> 3) == 1)
      {
        char v17 = 0;
        unsigned int v18 = 0;
        uint64_t v19 = 0;
        a1[20] |= 1u;
        while (1)
        {
          uint64_t v20 = *v3;
          unint64_t v21 = *(void *)(a2 + v20);
          if (v21 == -1 || v21 >= *(void *)(a2 + *v4)) {
            break;
          }
          char v22 = *(unsigned char *)(*(void *)(a2 + *v7) + v21);
          *(void *)(a2 + v20) = v21 + 1;
          v19 |= (unint64_t)(v22 & 0x7F) << v17;
          if ((v22 & 0x80) == 0) {
            goto LABEL_33;
          }
          v17 += 7;
          BOOL v14 = v18++ >= 9;
          if (v14)
          {
            uint64_t v19 = 0;
            goto LABEL_35;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_33:
        if (*(unsigned char *)(a2 + *v5)) {
          uint64_t v19 = 0;
        }
LABEL_35:
        a1[16] = v19 != 0;
      }
      else
      {
        uint64_t result = PBReaderSkipValueWithTag();
        if (!result) {
          return result;
        }
      }
    }
    while (*(void *)(a2 + *v3) < *(void *)(a2 + *v4));
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

id sub_1BBC5BA14(void *a1, const char *a2, uint64_t a3)
{
  id v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, a3);
  uint64_t v7 = objc_msgSend_appUsageVector(a1, v5, v6);
  char v8 = objc_opt_class();
  unint64_t v10 = objc_msgSend_keyForType_(v8, v9, @"appUsageVector");
  objc_msgSend_setObject_forKey_(v4, v11, (uint64_t)v7, v10);

  BOOL v14 = objc_msgSend_appDownloadVector(a1, v12, v13);
  int v15 = objc_opt_class();
  char v17 = objc_msgSend_keyForType_(v15, v16, @"appDownloadVector");
  objc_msgSend_setObject_forKey_(v4, v18, (uint64_t)v14, v17);

  unint64_t v21 = objc_msgSend_installedAppVector(a1, v19, v20);
  char v22 = objc_opt_class();
  double v24 = objc_msgSend_keyForType_(v22, v23, @"installedAppVector");
  objc_msgSend_setObject_forKey_(v4, v25, (uint64_t)v21, v24);

  id v28 = objc_msgSend_userQueryVector(a1, v26, v27);
  objc_msgSend_setObject_forKey_(v4, v29, (uint64_t)v28, @"userQueryVector");

  id v32 = objc_msgSend_copy(v4, v30, v31);

  return v32;
}

id sub_1BBC5BB78(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F28DB0];
  id v4 = objc_msgSend_dictionaryRepresentation(a1, a2, a3);
  id v11 = 0;
  uint64_t v6 = objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(v3, v5, (uint64_t)v4, 1, &v11);
  id v7 = v11;

  if (v7)
  {
    char v8 = OdmlLogForCategory(0xCuLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v7;
      _os_log_impl(&dword_1BBC44000, v8, OS_LOG_TYPE_ERROR, "Failed to archive training row data %@", buf, 0xCu);
    }

    id v9 = 0;
  }
  else
  {
    id v9 = v6;
  }

  return v9;
}

id sub_1BBC5BC98(void *a1, const char *a2, uint64_t a3)
{
  v91[4] = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, a3);
  id v7 = objc_msgSend_onDeviceFeatures(a1, v5, v6);
  objc_msgSend_setObject_forKey_(v4, v8, (uint64_t)v7, @"OnDeviceFeatures");

  id v9 = (void *)MEMORY[0x1E4F28DC0];
  unint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
  v91[0] = objc_opt_class();
  v91[1] = objc_opt_class();
  v91[2] = objc_opt_class();
  v91[3] = objc_opt_class();
  unint64_t v12 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v11, (uint64_t)v91, 4);
  uint64_t v14 = objc_msgSend_setWithArray_(v10, v13, (uint64_t)v12);
  char v17 = objc_msgSend_serverResponse(a1, v15, v16);
  id v86 = 0;
  uint64_t v19 = objc_msgSend_unarchivedObjectOfClasses_fromData_error_(v9, v18, (uint64_t)v14, v17, &v86);
  id v20 = v86;

  if (v20)
  {
    uint64_t v23 = OdmlLogForCategory(0xCuLL);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      double v24 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v88 = v24;
      __int16 v89 = 2112;
      id v90 = v20;
      id v25 = v24;
      _os_log_impl(&dword_1BBC44000, v23, OS_LOG_TYPE_ERROR, "[%@] Failed to unarchive server response: %@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v23 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v21, v22);
    id v28 = objc_msgSend_featureValues(v19, v26, v27);
    objc_msgSend_setValue_forKey_(v23, v29, (uint64_t)v28, @"ServerResponse");

    id v32 = objc_msgSend_adamID(a1, v30, v31);

    if (v32)
    {
      __int16 v35 = objc_msgSend_adamID(a1, v33, v34);
      objc_msgSend_setValue_forKey_(v23, v36, (uint64_t)v35, @"AdamID");
    }
    v37 = NSNumber;
    uint64_t v38 = objc_msgSend_impressed(a1, v33, v34);
    uint64_t v40 = objc_msgSend_numberWithBool_(v37, v39, v38);
    objc_msgSend_setValue_forKey_(v23, v41, (uint64_t)v40, @"Impressed");

    double v42 = NSNumber;
    uint64_t v45 = objc_msgSend_tapped(a1, v43, v44);
    int v47 = objc_msgSend_numberWithBool_(v42, v46, v45);
    objc_msgSend_setValue_forKey_(v23, v48, (uint64_t)v47, @"Tapped");

    uint64_t v49 = NSNumber;
    uint64_t v52 = objc_msgSend_dupe(a1, v50, v51);
    uint64_t v54 = objc_msgSend_numberWithBool_(v49, v53, v52);
    objc_msgSend_setValue_forKey_(v23, v55, (uint64_t)v54, @"Dupe");

    int v56 = NSNumber;
    uint64_t v59 = objc_msgSend_installed(a1, v57, v58);
    v61 = objc_msgSend_numberWithBool_(v56, v60, v59);
    objc_msgSend_setValue_forKey_(v23, v62, (uint64_t)v61, @"AppInstalled");

    v63 = NSNumber;
    if (objc_msgSend_hasErrorCode(a1, v64, v65)) {
      objc_msgSend_errorCode(a1, v66, v67);
    }
    else {
      double v68 = (double)0;
    }
    v69 = objc_msgSend_numberWithDouble_(v63, v66, v67, v68);
    objc_msgSend_setValue_forKey_(v23, v70, (uint64_t)v69, @"rerankingErrorCode");

    v73 = objc_msgSend_recordID(a1, v71, v72);
    objc_msgSend_setValue_forKey_(v23, v74, (uint64_t)v73, @"InstanceID");

    v75 = (void *)MEMORY[0x1E4F1CA60];
    v78 = objc_msgSend_adamID(a1, v76, v77);
    v80 = objc_msgSend_dictionaryWithObjectsAndKeys_(v75, v79, (uint64_t)v23, v78, 0);

    objc_msgSend_setValue_forKey_(v4, v81, (uint64_t)v80, @"AdRecords");
  }

  v84 = objc_msgSend_copy(v4, v82, v83);

  return v84;
}

uint64_t sub_1BBC5C0F8(uint64_t a1, const char *a2, uint64_t a3)
{
  return objc_msgSend_keyForTypes_placementType_assetManagerType_(APOdmlPFLUtilities, a2, a3, 0, 0);
}

id sub_1BBC5D2A4(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v3 = objc_msgSend_objectForKey_(a1, a2, a3);
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

uint64_t sub_1BBC5D304(void *a1, const char *a2)
{
  return objc_msgSend_mlJSONStringWithPrettyPrint_(a1, a2, 1);
}

__CFString *sub_1BBC5D30C(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F28D90];
  uint64_t v6 = objc_msgSend_mlDictionaryForJSON(a1, a2, a3);
  id v21 = 0;
  char v8 = objc_msgSend_dataWithJSONObject_options_error_(v5, v7, (uint64_t)v6, v4, &v21);
  id v9 = v21;

  if (v9)
  {
    unint64_t v10 = OdmlLogForCategory(6uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v13 = objc_msgSend_localizedDescription(v9, v11, v12);
      uint64_t v16 = objc_msgSend_mlDictionaryForJSON(a1, v14, v15);
      *(_DWORD *)buf = 138412546;
      uint64_t v23 = v13;
      __int16 v24 = 2112;
      id v25 = v16;
      _os_log_impl(&dword_1BBC44000, v10, OS_LOG_TYPE_ERROR, "There was an error serializing the following dictionary into JSON (%@):\n%@", buf, 0x16u);
    }
  }
  if (v8)
  {
    id v17 = [NSString alloc];
    uint64_t v19 = (__CFString *)objc_msgSend_initWithData_encoding_(v17, v18, (uint64_t)v8, 4);
  }
  else
  {
    uint64_t v19 = @"{}";
  }

  return v19;
}

id sub_1BBC5D48C(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], a2, a3);
  long long v86 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v5 = a1;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v86, v94, 16);
  if (!v7) {
    goto LABEL_53;
  }
  uint64_t v9 = v7;
  uint64_t v10 = *(void *)v87;
  while (2)
  {
    uint64_t v11 = 0;
    do
    {
      if (*(void *)v87 != v10) {
        objc_enumerationMutation(v5);
      }
      uint64_t v12 = *(void **)(*((void *)&v86 + 1) + 8 * v11);
      id v13 = objc_msgSend_objectForKey_(v5, v8, (uint64_t)v12);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_msgSend_stringValue(v12, v14, v15);
        uint64_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_opt_class();
        id v17 = @"UNKNOWN_KEY";
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_11;
        }
        uint64_t v16 = v12;
      }
      id v17 = v16;
LABEL_11:
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v20 = objc_msgSend_mlDictionaryForJSON(v13, v18, v19);
LABEL_19:
        id v28 = (id)v20;
        objc_msgSend_setObject_forKey_(v4, v21, v20, v17);
LABEL_20:

        goto LABEL_21;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v20 = objc_msgSend_APOdml_arrayForJSON(v13, v22, v23);
        goto LABEL_19;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v20 = objc_msgSend_APOdml_dataStringForJSON(v13, v24, v25);
        goto LABEL_19;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v20 = objc_msgSend_absoluteString(v13, v26, v27);
        goto LABEL_19;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_26;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_msgSend_doubleValue(v13, v30, v31);
        if (fabs(v32) == INFINITY)
        {
          v75 = OdmlLogForCategory(6uLL);
          if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
          {
            v76 = objc_opt_class();
            *(_DWORD *)buf = 138412546;
            v91 = v13;
            __int16 v92 = 2112;
            v93 = v76;
            id v77 = v76;
            _os_log_impl(&dword_1BBC44000, v75, OS_LOG_TYPE_ERROR, "JSON array validation failed infinity check with the following value: %@ (%@).", buf, 0x16u);
          }
          objc_msgSend_setObject_forKey_(v4, v78, @"∞", v17);

          goto LABEL_53;
        }
LABEL_26:
        objc_msgSend_setObject_forKey_(v4, v29, (uint64_t)v13, v17);
        goto LABEL_21;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v28 = v13;
        if (objc_msgSend_isUndefined(v28, v33, v34))
        {
          objc_msgSend_setObject_forKey_(v4, v35, @"UNDEFINED", v17);
          goto LABEL_20;
        }
        id v84 = v28;
        if (objc_msgSend_type(v28, v35, v36) == 2)
        {
          v81 = NSNumber;
          objc_msgSend_doubleValue(v28, v43, v44);
          uint64_t v47 = objc_msgSend_numberWithDouble_(v81, v45, v46);
LABEL_34:
          uint64_t v49 = (void *)v47;
          objc_msgSend_setObject_forKey_(v4, v48, v47, v17);

          id v28 = v84;
          goto LABEL_20;
        }
        if (objc_msgSend_type(v28, v43, v44) == 5)
        {
          v82 = objc_msgSend_multiArrayValue(v28, v53, v54);
          v57 = objc_msgSend_arrayFromMultiarray(v82, v55, v56);
          goto LABEL_42;
        }
        if (objc_msgSend_type(v28, v53, v54) == 7)
        {
          v82 = objc_msgSend_sequenceValue(v28, v60, v61);
          v57 = objc_msgSend_stringValues(v82, v62, v63);
LABEL_42:
          v64 = objc_msgSend_APOdml_arrayForJSON(v57, v58, v59, v57);
          objc_msgSend_setObject_forKey_(v4, v65, (uint64_t)v64, v17);

          id v28 = v84;
        }
        else
        {
          if (objc_msgSend_type(v28, v60, v61) != 6)
          {
            if (objc_msgSend_type(v28, v66, v67) != 3) {
              goto LABEL_20;
            }
            uint64_t v47 = objc_msgSend_stringValue(v28, v72, v73);
            goto LABEL_34;
          }
          v82 = objc_msgSend_dictionaryValue(v28, v66, v67);
          v70 = objc_msgSend_mlDictionaryForJSON(v82, v68, v69);
          objc_msgSend_setObject_forKey_(v4, v71, (uint64_t)v70, v17);

          id v28 = v84;
        }

        goto LABEL_20;
      }
      if (objc_opt_respondsToSelector())
      {
        uint64_t v83 = objc_msgSend_dictionaryRepresentation(v13, v37, v38);
        double v41 = objc_msgSend_mlDictionaryForJSON(v83, v39, v40);
        objc_msgSend_setObject_forKey_(v4, v42, (uint64_t)v41, v17);
      }
      else
      {
        BOOL v50 = OdmlLogForCategory(6uLL);
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
        {
          uint64_t v51 = objc_opt_class();
          *(_DWORD *)buf = 138412546;
          v91 = v13;
          __int16 v92 = 2112;
          v93 = v51;
          id v85 = v51;
          _os_log_impl(&dword_1BBC44000, v50, OS_LOG_TYPE_ERROR, "WARNING: Unable to serialize the following object into JSON.\n%@ (%@)", buf, 0x16u);
        }
        objc_msgSend_setObject_forKey_(v4, v52, @"INVALID", v17);
      }
LABEL_21:

      ++v11;
    }
    while (v9 != v11);
    uint64_t v74 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v86, v94, 16);
    uint64_t v9 = v74;
    if (v74) {
      continue;
    }
    break;
  }
LABEL_53:

  return v4;
}

void sub_1BBC5DB5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BBC5DC10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1BBC5DD10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1BBC5DD50(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, a3);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v5 = a1;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v41, v49, 16);
  if (!v7) {
    goto LABEL_29;
  }
  uint64_t v9 = v7;
  uint64_t v10 = *(void *)v42;
  unint64_t v11 = 0x1E4F1C000uLL;
  *(void *)&long long v8 = 138412546;
  long long v40 = v8;
  while (2)
  {
    uint64_t v12 = 0;
    do
    {
      if (*(void *)v42 != v10) {
        objc_enumerationMutation(v5);
      }
      id v13 = *(void **)(*((void *)&v41 + 1) + 8 * v12);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v16 = objc_msgSend_APOdml_arrayForJSON(v13, v14, v15);
LABEL_14:
        __int16 v24 = (void *)v16;
        objc_msgSend_addObject_(v4, v17, v16, (void)v40);

        goto LABEL_15;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v16 = objc_msgSend_mlDictionaryForJSON(v13, v18, v19);
        goto LABEL_14;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v16 = objc_msgSend_APOdml_dataStringForJSON(v13, v20, v21);
        goto LABEL_14;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v16 = objc_msgSend_absoluteString(v13, v22, v23);
        goto LABEL_14;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_20;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_msgSend_doubleValue(v13, v27, v28);
        if (fabs(v29) == INFINITY)
        {
          __int16 v35 = OdmlLogForCategory(6uLL);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            uint64_t v36 = objc_opt_class();
            *(_DWORD *)buf = v40;
            uint64_t v46 = v13;
            __int16 v47 = 2112;
            v48 = v36;
            id v37 = v36;
            _os_log_impl(&dword_1BBC44000, v35, OS_LOG_TYPE_ERROR, "JSON array validation failed infinity check with the following value: %@ (%@).", buf, 0x16u);
          }
          objc_msgSend_addObject_(v4, v38, @"∞");
          goto LABEL_29;
        }
LABEL_20:
        objc_msgSend_addObject_(v4, v26, (uint64_t)v13, v40, (void)v41);
        goto LABEL_15;
      }
      unint64_t v30 = v11;
      uint64_t v31 = OdmlLogForCategory(6uLL);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        double v32 = objc_opt_class();
        *(_DWORD *)buf = v40;
        uint64_t v46 = v13;
        __int16 v47 = 2112;
        v48 = v32;
        id v33 = v32;
        _os_log_impl(&dword_1BBC44000, v31, OS_LOG_TYPE_ERROR, "WARNING: Unable to serialize the following object into JSON.\n%@ (%@)", buf, 0x16u);
      }
      unint64_t v11 = v30;
LABEL_15:
      ++v12;
    }
    while (v9 != v12);
    uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v25, (uint64_t)&v41, v49, 16);
    uint64_t v9 = v34;
    if (v34) {
      continue;
    }
    break;
  }
LABEL_29:

  return v4;
}

__CFString *sub_1BBC5E12C(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F28D90];
  uint64_t v6 = objc_msgSend_APOdml_arrayForJSON(a1, a2, a3);
  id v21 = 0;
  long long v8 = objc_msgSend_dataWithJSONObject_options_error_(v5, v7, (uint64_t)v6, v4, &v21);
  id v9 = v21;

  if (v9)
  {
    uint64_t v10 = OdmlLogForCategory(6uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v13 = objc_msgSend_localizedDescription(v9, v11, v12);
      uint64_t v16 = objc_msgSend_APOdml_arrayForJSON(a1, v14, v15);
      *(_DWORD *)buf = 138412546;
      uint64_t v23 = v13;
      __int16 v24 = 2112;
      uint64_t v25 = v16;
      _os_log_impl(&dword_1BBC44000, v10, OS_LOG_TYPE_ERROR, "There was an error serializing the following array into JSON (%@):\n%@", buf, 0x16u);
    }
  }
  if (v8)
  {
    id v17 = [NSString alloc];
    uint64_t v19 = (__CFString *)objc_msgSend_initWithData_encoding_(v17, v18, (uint64_t)v8, 4);
  }
  else
  {
    uint64_t v19 = @"[]";
  }

  return v19;
}

uint64_t sub_1BBC5E2AC(uint64_t a1)
{
  return MEMORY[0x1F4181798](a1, sel_APOdml_jsonStringWithPrettyPrint_, 1);
}

uint64_t sub_1BBC5F254(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1F4181798](*(void *)(a1 + 32), sel_saveUserQueryVector, a3);
}

void sub_1BBC5F25C(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend_dictionary(*(void **)(a1 + 32), a2, a3);
  uint64_t v6 = objc_msgSend_objectAtIndexedSubscript_(*(void **)(a1 + 40), v5, *(void *)(a1 + 64));
  objc_msgSend_logModelInputWithAdamID_adamID_(APOdmlLogUtility, v7, (uint64_t)v4, v6);

  long long v8 = *(void **)(a1 + 48);
  objc_msgSend_objectAtIndexedSubscript_(*(void **)(a1 + 56), v9, *(void *)(a1 + 64));
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_saveFeaturesFromResponse_(v8, v10, (uint64_t)v11);
}

BOOL sub_1BBC60C34(void *a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend_decimalDigitCharacterSet(MEMORY[0x1E4F28E58], a2, a3);
  objc_msgSend_addCharactersInString_(v4, v5, @".");
  long long v8 = objc_msgSend_invertedSet(v4, v6, v7);
  BOOL v10 = objc_msgSend_rangeOfCharacterFromSet_(a1, v9, (uint64_t)v8) == 0x7FFFFFFFFFFFFFFFLL;

  return v10;
}

uint64_t sub_1BBC62354()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  uint64_t v1 = (void *)qword_1E9F8A260;
  qword_1E9F8A260 = (uint64_t)v0;

  objc_msgSend_setNumberStyle_((void *)qword_1E9F8A260, v2, 1);
  uint64_t v3 = qword_1E9F8A260;

  return MEMORY[0x1F4181798](v3, sel_setDecimalSeparator_, @".");
}

uint64_t sub_1BBC6265C(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 8) = 1;
  return result;
}

uint64_t ADFeatureReadFrom(char *a1, uint64_t a2)
{
  uint64_t v3 = (int *)MEMORY[0x1E4F940E8];
  uint64_t v4 = (int *)MEMORY[0x1E4F940E0];
  id v5 = (int *)MEMORY[0x1E4F940C8];
  if (*(void *)(a2 + (int)*MEMORY[0x1E4F940E8]) < *(void *)(a2 + (int)*MEMORY[0x1E4F940E0]))
  {
    uint64_t v7 = (int *)MEMORY[0x1E4F940B8];
    while (2)
    {
      if (!*(unsigned char *)(a2 + *v5))
      {
        char v8 = 0;
        unsigned int v9 = 0;
        unint64_t v10 = 0;
        while (1)
        {
          uint64_t v11 = *v3;
          uint64_t v12 = *(void *)(a2 + v11);
          unint64_t v13 = v12 + 1;
          if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
            break;
          }
          char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
          *(void *)(a2 + v11) = v13;
          v10 |= (unint64_t)(v14 & 0x7F) << v8;
          if ((v14 & 0x80) == 0) {
            goto LABEL_12;
          }
          v8 += 7;
          if (v9++ >= 9)
          {
            unint64_t v10 = 0;
            uint64_t v16 = *v5;
            int v17 = *(unsigned __int8 *)(a2 + v16);
            goto LABEL_14;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
        uint64_t v16 = *v5;
        int v17 = *(unsigned __int8 *)(a2 + v16);
        if (*(unsigned char *)(a2 + v16)) {
          unint64_t v10 = 0;
        }
LABEL_14:
        int v18 = v10 & 7;
        if (!v17 && v18 != 4)
        {
          switch((v10 >> 3))
          {
            case 1u:
              uint64_t v20 = PBReaderReadString();
              uint64_t v21 = 48;
              goto LABEL_35;
            case 2u:
              if (v18 == 2)
              {
                uint64_t result = PBReaderPlaceMark();
                if (!result) {
                  return result;
                }
                while (1)
                {
                  uint64_t v22 = (unint64_t *)(a2 + *v3);
                  unint64_t v23 = *v22;
                  unint64_t v24 = *(void *)(a2 + *v4);
                  if (*v22 >= v24) {
                    break;
                  }
                  uint64_t v25 = *v5;
                  if (*(unsigned char *)(a2 + v25)) {
                    break;
                  }
                  if (v23 > 0xFFFFFFFFFFFFFFF7 || v23 + 8 > v24) {
                    *(unsigned char *)(a2 + v25) = 1;
                  }
                  else {
                    unint64_t *v22 = v23 + 8;
                  }
                  PBRepeatedDoubleAdd();
                }
                PBReaderRecallMark();
              }
              else
              {
                uint64_t v29 = *v3;
                unint64_t v30 = *(void *)(a2 + v29);
                if (v30 <= 0xFFFFFFFFFFFFFFF7 && v30 + 8 <= *(void *)(a2 + *v4)) {
                  *(void *)(a2 + v29) = v30 + 8;
                }
                else {
                  *(unsigned char *)(a2 + v16) = 1;
                }
                PBRepeatedDoubleAdd();
              }
LABEL_42:
              if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
                return *(unsigned char *)(a2 + *v5) == 0;
              }
              continue;
            case 3u:
              uint64_t v27 = PBReaderReadString();
              if (v27) {
                objc_msgSend_addStringValue_(a1, v26, (uint64_t)v27);
              }

              goto LABEL_42;
            case 4u:
              uint64_t v20 = PBReaderReadString();
              uint64_t v21 = 32;
LABEL_35:
              uint64_t v28 = *(void **)&a1[v21];
              *(void *)&a1[v21] = v20;

              goto LABEL_42;
            default:
              if (PBReaderSkipValueWithTag()) {
                goto LABEL_42;
              }
              return 0;
          }
        }
      }
      break;
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

uint64_t sub_1BBC64EA0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_1BBC65298(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1BBC652B0(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  unint64_t v10 = objc_msgSend_taskDeferred(*(void **)(a1 + 32), v8, v9);

  if (v10)
  {
    uint64_t v13 = *(void *)(a1 + 40);
    if (v13) {
      (*(void (**)(void))(v13 + 16))();
    }
    *a4 = 1;
  }
  else
  {
    char v14 = objc_msgSend_operationQueue(*(void **)(a1 + 32), v11, v12);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_1BBC653C8;
    v16[3] = &unk_1E624AA48;
    v16[4] = *(void *)(a1 + 32);
    id v17 = v7;
    uint64_t v19 = a3;
    id v18 = *(id *)(a1 + 40);
    objc_msgSend_addOperationWithBlock_(v14, v15, (uint64_t)v16);
  }
}

void sub_1BBC653C8(uint64_t a1, const char *a2)
{
  objc_msgSend_runFeatureCalculator_(*(void **)(a1 + 32), a2, *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v6 = objc_msgSend_validFeatureCalculators(*(void **)(a1 + 32), v4, v5);
  uint64_t v9 = objc_msgSend_count(v6, v7, v8) - 1;

  if (v3 == v9)
  {
    uint64_t v12 = objc_msgSend_operationQueue(*(void **)(a1 + 32), v10, v11);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1BBC654AC;
    v14[3] = &unk_1E624AA20;
    v14[4] = *(void *)(a1 + 32);
    id v15 = *(id *)(a1 + 48);
    objc_msgSend_addOperationWithBlock_(v12, v13, (uint64_t)v14);
  }
}

uint64_t sub_1BBC654AC(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_calculatorErrors(*(void **)(a1 + 32), a2, a3);
  uint64_t v7 = objc_msgSend_count(v4, v5, v6);

  uint64_t v8 = OdmlLogForCategory(3uLL);
  uint64_t v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      unint64_t v10 = objc_opt_class();
      uint64_t v11 = *(void **)(a1 + 32);
      id v12 = v10;
      id v15 = objc_msgSend_calculatorErrors(v11, v13, v14);
      int v18 = 138478083;
      id v19 = v10;
      __int16 v20 = 2113;
      uint64_t v21 = v15;
      _os_log_impl(&dword_1BBC44000, v9, OS_LOG_TYPE_ERROR, "[%{private}@] ERROR: Failed to calculate features with the following errors: %{private}@", (uint8_t *)&v18, 0x16u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138477827;
    id v19 = (id)objc_opt_class();
    id v16 = v19;
    _os_log_impl(&dword_1BBC44000, v9, OS_LOG_TYPE_DEFAULT, "[%{private}@] Successfully calculated all features.", (uint8_t *)&v18, 0xCu);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1BBC65A1C(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend_sharedAssetManagerCoordinator(APOdmlAssetManagerCoordinator, a2, a3);
  uint64_t v7 = objc_msgSend_placementType(*(void **)(a1 + 32), v5, v6);
  uint64_t v10 = objc_msgSend_assetManagerType(*(void **)(a1 + 32), v8, v9);
  objc_msgSend_assetManagerForPlacementType_assetManagerType_(v4, v11, v7, v10);
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v13 = objc_msgSend_doubleValueForFactor_(v15, v12, @"LookbackWindow");
  objc_msgSend_deleteExpiredFeaturesForName_lookbackWindow_(v15, v14, @"appUsageVector", v13);
}

void sub_1BBC678A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BBC67900(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BBC67978(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BBC679E0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BBC67A3C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BBC67B30(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend_workQueue(*(void **)(a1 + 32), a2, a3);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1BBC67BE8;
  v7[3] = &unk_1E624AF28;
  uint64_t v5 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v5;
  id v9 = *(id *)(a1 + 48);
  objc_msgSend_addOperationWithBlock_(v4, v6, (uint64_t)v7);
}

void sub_1BBC67BE8(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  uint64_t v3 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v3 + 8) && (objc_msgSend_isEqualToDate_(*(void **)(a1 + 40), v2, *(void *)(v3 + 32)) & 1) != 0)
  {
    objc_sync_exit(obj);

    int shouldDefer = objc_msgSend_shouldDefer(*(void **)(a1 + 32), v4, v5);
    id v9 = *(void **)(a1 + 32);
    if (shouldDefer)
    {
      objc_msgSend_endBackgroundDeferralCheck(v9, v6, v7);
      objc_msgSend_deferTask(*(void **)(a1 + 32), v10, v11);
      uint64_t v12 = *(void *)(a1 + 48);
      if (v12)
      {
        uint64_t v13 = *(void (**)(void))(v12 + 16);
        v13();
      }
    }
    else
    {
      uint64_t v15 = *(void *)(a1 + 40);
      uint64_t v16 = *(void *)(a1 + 48);
      objc_msgSend__backgroundDeferralCheck_completion_(v9, v6, v15, v16);
    }
  }
  else
  {
    uint64_t v14 = *(void *)(a1 + 48);
    if (v14) {
      (*(void (**)(uint64_t, void))(v14 + 16))(v14, 0);
    }
    objc_sync_exit(obj);
  }
}

void sub_1BBC67D08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_1BBC67E34(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1BBC6900C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1BBC6903C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1BBC6904C(uint64_t a1)
{
}

void sub_1BBC69054(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if (objc_msgSend_state(v2, v3, v4) == 1)
  {
    uint64_t v5 = OdmlLogForCategory(0xCuLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v8 = objc_msgSend_error(v2, v6, v7);
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl(&dword_1BBC44000, v5, OS_LOG_TYPE_ERROR, "Failed to query TrainingRow data: %@", (uint8_t *)&v9, 0xCu);
    }
  }
}

void sub_1BBC6912C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_opt_class();
  objc_msgSend_eventBody(v3, v5, v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_combineRecords_andSaveTo_(v4, v7, (uint64_t)v8, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void sub_1BBC691B4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v8 = a2;
  uint64_t v6 = objc_opt_class();
  objc_msgSend_trainingRowsFromBiomeEvent_recordID_requiredFeatures_andSaveTo_(v6, v7, (uint64_t)v5, v8, *(void *)(a1 + 40), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
}

void sub_1BBC6971C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = NSString;
  id v6 = a2;
  id v8 = objc_msgSend_stringWithFormat_(v5, v7, @"_%ld", a3);
  objc_msgSend_stringByAppendingString_(v4, v9, (uint64_t)v8);
  id v11 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setRowID_(v6, v10, (uint64_t)v11);
}

uint64_t sub_1BBC69898(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result = objc_msgSend_isValidRow_(a2, (const char *)a2, *(void *)(a1 + 32));
  if ((result & 1) == 0)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    return MEMORY[0x1F4181798](v6, sel_addIndex_, a3);
  }
  return result;
}

uint64_t sub_1BBC69D04(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = objc_msgSend_lastPathComponent(a2, (const char *)a2, a3);
  uint64_t isEqualToString = objc_msgSend_isEqualToString_(v4, v5, *(void *)(a1 + 32));

  return isEqualToString;
}

id sub_1BBC69D68(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = (objc_class *)MEMORY[0x1E4F1E9A8];
  id v4 = a3;
  id v5 = [v3 alloc];
  uint64_t v12 = 0;
  uint64_t v7 = objc_msgSend_initWithShape_dataType_error_(v5, v6, (uint64_t)&unk_1F1506740, 65600, &v12);
  objc_msgSend_setObject_atIndexedSubscript_(v7, v8, (uint64_t)v4, 0);

  uint64_t v10 = objc_msgSend_featureValueWithMultiArray_(MEMORY[0x1E4F1E950], v9, (uint64_t)v7);

  return v10;
}

uint64_t sub_1BBC69EA4()
{
  qword_1EB9F98A8 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return MEMORY[0x1F41817F8]();
}

void sub_1BBC6A2D0(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_listeningLock(*(void **)(a1 + 32), a2, a3);
  objc_msgSend_lock(v4, v5, v6);

  if (objc_msgSend_isListening(*(void **)(a1 + 32), v7, v8))
  {
    if (objc_msgSend_isListening(*(void **)(a1 + 32), v9, v10)
      && (objc_msgSend_listeningError(*(void **)(a1 + 32), v11, v12),
          uint64_t v13 = objc_claimAutoreleasedReturnValue(),
          v13,
          !v13))
    {
      unint64_t v30 = OdmlLogForCategory(4uLL);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138477827;
        *(void *)&uint8_t buf[4] = objc_opt_class();
        id v31 = *(id *)&buf[4];
        _os_log_impl(&dword_1BBC44000, v30, OS_LOG_TYPE_DEFAULT, "[%{private}@] StoreServer startListening call while server is listening, and did not have an error on previous attempt.", buf, 0xCu);
      }
      uint64_t v34 = objc_msgSend_listeningLock(*(void **)(a1 + 32), v32, v33);
      objc_msgSend_unlock(v34, v35, v36);
    }
    else if (objc_msgSend_isListening(*(void **)(a1 + 32), v11, v12))
    {
      uint64_t v16 = objc_msgSend_listeningError(*(void **)(a1 + 32), v14, v15);

      if (v16)
      {
        id v17 = OdmlLogForCategory(4uLL);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138477827;
          *(void *)&uint8_t buf[4] = objc_opt_class();
          id v18 = *(id *)&buf[4];
          _os_log_impl(&dword_1BBC44000, v17, OS_LOG_TYPE_DEFAULT, "[%{private}@] StoreServer startListening call while server is listening, but had an error on previous attempt.", buf, 0xCu);
        }
        id v19 = *(void **)(a1 + 32);
        uint64_t v22 = objc_msgSend_modelURL(v19, v20, v21);
        unint64_t v24 = objc_msgSend_storeServerForModelURL_(v19, v23, (uint64_t)v22);
        objc_msgSend_setStoreServer_(*(void **)(a1 + 32), v25, (uint64_t)v24);

        objc_msgSend__startListening_(*(void **)(a1 + 32), v26, (uint64_t)v37, MEMORY[0x1E4F143A8], 3221225472, sub_1BBC6A614, &unk_1E624A800, *(void *)(a1 + 32), v38[0], v38[1], v38[2], v38[3], v38[4], *(_OWORD *)buf);
      }
    }
  }
  else
  {
    uint64_t v27 = OdmlLogForCategory(4uLL);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      *(void *)&uint8_t buf[4] = objc_opt_class();
      id v28 = *(id *)&buf[4];
      _os_log_impl(&dword_1BBC44000, v27, OS_LOG_TYPE_DEFAULT, "[%{private}@] StoreServer startListening call while server is not listening; first attempt to launch the server.",
        buf,
        0xCu);
    }
    objc_msgSend__startListening_(*(void **)(a1 + 32), v29, (uint64_t)v38, v37[0], v37[1], v37[2], v37[3], v37[4], MEMORY[0x1E4F143A8], 3221225472, sub_1BBC6A5D0, &unk_1E624A800, *(void *)(a1 + 32), *(_OWORD *)buf);
  }
}

void sub_1BBC6A5D0(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend_listeningLock(*(void **)(a1 + 32), a2, a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v5, v3, v4);
}

void sub_1BBC6A614(uint64_t a1, const char *a2, uint64_t a3)
{
  objc_msgSend_listeningLock(*(void **)(a1 + 32), a2, a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unlock(v5, v3, v4);
}

void sub_1BBC6A864(uint64_t a1, void *a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = OdmlLogForCategory(4uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    id v9 = v8;
    uint64_t v12 = objc_msgSend_options(v5, v10, v11);
    int v27 = 138478083;
    id v28 = v8;
    __int16 v29 = 2113;
    id v30 = v12;
    _os_log_impl(&dword_1BBC44000, v7, OS_LOG_TYPE_DEFAULT, "[%{private}@] NSPersistentStoreDescription: %{private}@", (uint8_t *)&v27, 0x16u);
  }
  objc_msgSend_startListening(*(void **)(*(void *)(a1 + 32) + 16), v13, v14);
  uint64_t v15 = OdmlLogForCategory(4uLL);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = objc_opt_class();
    int v27 = 138477827;
    id v28 = v16;
    id v17 = v16;
    _os_log_impl(&dword_1BBC44000, v15, OS_LOG_TYPE_DEFAULT, "[%{private}@] StoreServer began listening.", (uint8_t *)&v27, 0xCu);
  }
  objc_msgSend_setIsListening_(*(void **)(a1 + 32), v18, 1);
  objc_msgSend_setListeningError_(*(void **)(a1 + 32), v19, (uint64_t)v6);
  if (v6)
  {
    __int16 v20 = OdmlLogForCategory(4uLL);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = objc_opt_class();
      int v27 = 138478083;
      id v28 = v21;
      __int16 v29 = 2112;
      id v30 = v6;
      id v22 = v21;
      _os_log_impl(&dword_1BBC44000, v20, OS_LOG_TYPE_ERROR, "[%{private}@] StoreServer failed to initialize DB with error: %@", (uint8_t *)&v27, 0x16u);
    }
    unint64_t v24 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v23, @"APOdmlFeatureStorageErrorDomain", 5011, 0);
    objc_msgSend_sendEvent_additionalDetails_(APOdmlAnalyticsFeatureStorage, v25, (uint64_t)v24, 0);
  }
  uint64_t v26 = *(void *)(a1 + 40);
  if (v26) {
    (*(void (**)(void))(v26 + 16))();
  }
}

void sub_1BBC6AF60(uint64_t a1)
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v2 = OdmlLogForCategory(5uLL);
  uint64_t v5 = objc_msgSend_ident(*(void **)(a1 + 32), v3, v4);
  if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v6 = v5;
    if (os_signpost_enabled(v2))
    {
      LOWORD(v55) = 0;
      _os_signpost_emit_with_name_impl(&dword_1BBC44000, v2, OS_SIGNPOST_INTERVAL_END, v6, "GCD Overhead", (const char *)&unk_1BBC77EAD, (uint8_t *)&v55, 2u);
    }
  }

  if (objc_msgSend_count(*(void **)(a1 + 40), v7, v8))
  {
    objc_msgSend_setOriginalAds_(*(void **)(a1 + 32), v9, *(void *)(a1 + 40));
    uint64_t v12 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v10, v11);
    objc_msgSend_setRerankingStartDate_(*(void **)(a1 + 32), v13, (uint64_t)v12);

    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t isPersonalizedAdsEnabled = objc_msgSend_isPersonalizedAdsEnabled(*(void **)(a1 + 32), v15, v16);
    __int16 v20 = objc_msgSend_assetManager(*(void **)(a1 + 32), v18, v19);
    id v22 = objc_msgSend_BOOLeanValueForFactor_(v20, v21, @"KillSwitch");
    uint64_t v25 = objc_msgSend_BOOLValue(v22, v23, v24);
    uint64_t v27 = objc_msgSend_permissionCheck_personalizedAdsEnabled_trialKillswitch_(APOdmlValidator, v26, v14, isPersonalizedAdsEnabled, v25);

    if (!v27)
    {
      __int16 v29 = objc_msgSend_predictAndExplore_(*(void **)(a1 + 32), v28, *(void *)(a1 + 40));
      objc_msgSend_setRerankedAds_(*(void **)(a1 + 32), v30, (uint64_t)v29);

      uint64_t v31 = *(void **)(a1 + 32);
      uint64_t v34 = objc_msgSend_rerankedAds(v31, v32, v33);
      LODWORD(v31) = objc_msgSend_sendRerankResponseIfAvailable_error_(v31, v35, (uint64_t)v34, 0);

      if (v31)
      {
        uint64_t v38 = objc_msgSend_rerankingStartDate(*(void **)(a1 + 32), v36, v37);
        long long v41 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v39, v40);
        objc_msgSend_sendTimedEvent_statusSuccess_additionalDetails_startDate_endDate_(APOdmlAnalyticsReranking, v42, 0, 0, 0, v38, v41);
      }
      return;
    }
    v48 = OdmlLogForCategory(5uLL);
    BOOL v49 = os_log_type_enabled(v48, OS_LOG_TYPE_ERROR);
    if (v27 == 2003)
    {
      if (v49)
      {
        uint64_t v50 = objc_opt_class();
        int v55 = 138412290;
        uint64_t v56 = v50;
        id v51 = v50;
        uint64_t v52 = "[%@] Reranking Error: Reranking not permitted.";
LABEL_16:
        _os_log_impl(&dword_1BBC44000, v48, OS_LOG_TYPE_ERROR, v52, (uint8_t *)&v55, 0xCu);
      }
    }
    else if (v49)
    {
      v53 = objc_opt_class();
      int v55 = 138412290;
      uint64_t v56 = v53;
      id v51 = v53;
      uint64_t v52 = "[%@] Reranking Error: Reranking not enabled.";
      goto LABEL_16;
    }

    objc_msgSend__handleError_(*(void **)(a1 + 32), v54, v27);
    return;
  }
  long long v43 = OdmlLogForCategory(5uLL);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
  {
    long long v44 = objc_opt_class();
    uint64_t v45 = *(void *)(a1 + 40);
    int v55 = 138412546;
    uint64_t v56 = v44;
    __int16 v57 = 2112;
    uint64_t v58 = v45;
    id v46 = v44;
    _os_log_impl(&dword_1BBC44000, v43, OS_LOG_TYPE_ERROR, "[%@] Reranking Error: Rankable objects list %@ is empty or nil.", (uint8_t *)&v55, 0x16u);
  }
  objc_msgSend__handleError_(*(void **)(a1 + 32), v47, 2004);
}

void sub_1BBC6B49C(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_rerankedAds(*(void **)(a1 + 32), a2, a3);

  uint64_t v7 = *(void **)(a1 + 32);
  if (v4)
  {
    uint64_t v8 = objc_msgSend_rerankedAds(*(void **)(a1 + 32), v5, v6);
    int v10 = objc_msgSend_sendRerankResponseIfAvailable_error_(v7, v9, (uint64_t)v8, 0);

    if (v10)
    {
      objc_msgSend_rerankingStartDate(*(void **)(a1 + 32), v11, v12);
      id v45 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v15 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v13, v14);
      objc_msgSend_sendTimedEvent_statusSuccess_additionalDetails_startDate_endDate_(APOdmlAnalyticsReranking, v16, 0, 0, 0, v45, v15);
    }
  }
  else
  {
    id v17 = objc_msgSend_rerankerError(*(void **)(a1 + 32), v5, v6);

    if (v17)
    {
      __int16 v20 = *(void **)(a1 + 32);
      uint64_t v21 = objc_msgSend_originalAds(v20, v18, v19);
      uint64_t v24 = objc_msgSend_rerankerError(*(void **)(a1 + 32), v22, v23);
      LODWORD(v20) = objc_msgSend_sendRerankResponseIfAvailable_error_(v20, v25, (uint64_t)v21, v24);

      if (v20)
      {
        uint64_t v26 = OdmlLogForCategory(5uLL);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          uint64_t v27 = objc_opt_class();
          id v28 = *(void **)(a1 + 32);
          id v29 = v27;
          double v32 = objc_msgSend_rerankerError(v28, v30, v31);
          *(_DWORD *)buf = 138412546;
          __int16 v47 = v27;
          __int16 v48 = 2048;
          uint64_t v49 = objc_msgSend_code(v32, v33, v34);
          _os_log_impl(&dword_1BBC44000, v26, OS_LOG_TYPE_ERROR, "[%@] Reranking Error: %ld.", buf, 0x16u);
        }
        uint64_t v37 = objc_msgSend_rerankerError(*(void **)(a1 + 32), v35, v36);
        uint64_t v40 = objc_msgSend_rerankingStartDate(*(void **)(a1 + 32), v38, v39);
        long long v43 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v41, v42);
        objc_msgSend_sendTimedEvent_statusSuccess_additionalDetails_startDate_endDate_(APOdmlAnalyticsReranking, v44, (uint64_t)v37, 0, 0, v40, v43);
      }
    }
  }
}

void sub_1BBC6B72C(uint64_t a1, const char *a2, uint64_t a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_rerankDispatchGroup(*(void **)(a1 + 32), a2, a3);
  dispatch_time_t v5 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 40) * 1000000000.0));
  intptr_t v6 = dispatch_group_wait(v4, v5);

  uint64_t v7 = OdmlLogForCategory(5uLL);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      int v13 = 138412290;
      id v14 = (id)objc_opt_class();
      id v9 = v14;
      _os_log_impl(&dword_1BBC44000, v7, OS_LOG_TYPE_INFO, "[%@] Reranker failed to complete before SLA was reached", (uint8_t *)&v13, 0xCu);
    }
    objc_msgSend_rerankResponseTimeout(*(void **)(a1 + 32), v10, v11);
  }
  else
  {
    if (v8)
    {
      int v13 = 138412290;
      id v14 = (id)objc_opt_class();
      id v12 = v14;
      _os_log_impl(&dword_1BBC44000, v7, OS_LOG_TYPE_INFO, "[%@] Reranker completed before SLA was reached", (uint8_t *)&v13, 0xCu);
    }
  }
}

void sub_1BBC6C3F8()
{
  id v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INTERACTIVE, 0);

  dispatch_queue_t v1 = dispatch_queue_create("com.apple.ap.reranking", attr);
  id v2 = (void *)qword_1EB9F97F0;
  qword_1EB9F97F0 = (uint64_t)v1;
}

void sub_1BBC6C4D0()
{
  id v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_USER_INTERACTIVE, 0);

  dispatch_queue_t v1 = dispatch_queue_create("com.apple.ap.rerankingTimeout", attr);
  id v2 = (void *)qword_1EB9F97E8;
  qword_1EB9F97E8 = (uint64_t)v1;
}

void *get_espresso_buffer_shape@<X0>(void *a1@<X8>)
{
  return sub_1BBC4BE98(a1, 0);
}

float accuracy_in_batch(uint64_t *a1, void *a2)
{
  get_espresso_buffer_shape(&v20);
  float v4 = 0.0;
  if ((unint64_t)(v21 - (char *)v20) >= 0x10)
  {
    unint64_t v5 = *v20;
    if (*v20)
    {
      uint64_t v6 = 0;
      int v7 = 0;
      unint64_t v8 = v20[1];
      uint64_t v9 = *a1;
      do
      {
        int v10 = (float *)(v9 + 4 * v6 * v8);
        if (v8 >= 2)
        {
          id v12 = v10 + 1;
          float v13 = *v10;
          uint64_t v14 = 4 * v8 - 4;
          uint64_t v11 = (float *)(v9 + 4 * v6 * v8);
          uint64_t v15 = v10 + 1;
          do
          {
            float v16 = *v15++;
            float v17 = v16;
            if (v13 < v16)
            {
              float v13 = v17;
              uint64_t v11 = v12;
            }
            id v12 = v15;
            v14 -= 4;
          }
          while (v14);
        }
        else
        {
          uint64_t v11 = (float *)(v9 + 4 * v6 * v8);
        }
        if (((unint64_t)((char *)v11 - (char *)v10) >> 2) == llroundf(*(float *)(*a2 + 4 * v6))) {
          ++v7;
        }
        ++v6;
      }
      while (v6 != v5);
      float v18 = (float)v7;
    }
    else
    {
      float v18 = 0.0;
    }
    float v4 = v18 / (float)v5;
  }
  if (v20)
  {
    uint64_t v21 = (char *)v20;
    operator delete(v20);
  }
  return v4;
}

void print_espresso_buffer(char *a1@<X0>, float **a2@<X1>, std::string *a3@<X8>)
{
  get_espresso_buffer_shape(&v37);
  uint64_t v6 = v37;
  unsigned int v7 = 1;
  while (v6 != v38)
  {
    int v8 = *(_DWORD *)v6++;
    v7 *= v8;
  }
  if (v7 >= 5) {
    uint64_t v9 = 5;
  }
  else {
    uint64_t v9 = v7;
  }
  int v10 = *a2;
  if (a1[23] >= 0) {
    uint64_t v11 = a1;
  }
  else {
    uint64_t v11 = *(char **)a1;
  }
  sub_1BBC58238(&v34, v11);
  sub_1BBC6CB78(&v37, &v31);
  if ((v31.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    id v12 = &v31;
  }
  else {
    id v12 = (std::string *)v31.__r_.__value_.__r.__words[0];
  }
  sub_1BBC58238(v32, (char *)v12);
  if ((v33 & 0x80u) == 0) {
    float v13 = v32;
  }
  else {
    float v13 = (void **)v32[0];
  }
  if ((v33 & 0x80u) == 0) {
    std::string::size_type v14 = v33;
  }
  else {
    std::string::size_type v14 = (std::string::size_type)v32[1];
  }
  uint64_t v15 = std::string::append(&v34, (const std::string::value_type *)v13, v14);
  long long v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
  v35.__r_.__value_.__r.__words[2] = v15->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v35.__r_.__value_.__l.__data_ = v16;
  v15->__r_.__value_.__l.__size_ = 0;
  v15->__r_.__value_.__r.__words[2] = 0;
  v15->__r_.__value_.__r.__words[0] = 0;
  float v17 = std::string::append(&v35, ": ");
  long long v18 = *(_OWORD *)&v17->__r_.__value_.__l.__data_;
  v36.__r_.__value_.__r.__words[2] = v17->__r_.__value_.__r.__words[2];
  *(_OWORD *)&v36.__r_.__value_.__l.__data_ = v18;
  v17->__r_.__value_.__l.__size_ = 0;
  v17->__r_.__value_.__r.__words[2] = 0;
  v17->__r_.__value_.__r.__words[0] = 0;
  sub_1BBC58238(v26, "[");
  if (v7 <= 5) {
    uint64_t v19 = "]";
  }
  else {
    uint64_t v19 = "...]";
  }
  sub_1BBC58238(v24, v19);
  sub_1BBC6CC38(v10, &v10[v9], (uint64_t)v26, (uint64_t)v24, &v28);
  if ((v28.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    __int16 v20 = &v28;
  }
  else {
    __int16 v20 = (std::string *)v28.__r_.__value_.__r.__words[0];
  }
  sub_1BBC58238(__p, (char *)v20);
  if ((v30 & 0x80u) == 0) {
    uint64_t v21 = __p;
  }
  else {
    uint64_t v21 = (void **)__p[0];
  }
  if ((v30 & 0x80u) == 0) {
    std::string::size_type v22 = v30;
  }
  else {
    std::string::size_type v22 = (std::string::size_type)__p[1];
  }
  uint64_t v23 = std::string::append(&v36, (const std::string::value_type *)v21, v22);
  *a3 = *v23;
  v23->__r_.__value_.__l.__size_ = 0;
  v23->__r_.__value_.__r.__words[2] = 0;
  v23->__r_.__value_.__r.__words[0] = 0;
  if ((char)v30 < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v28.__r_.__value_.__l.__data_);
  }
  if (v25 < 0) {
    operator delete(v24[0]);
  }
  if (v27 < 0) {
    operator delete(v26[0]);
  }
  if (SHIBYTE(v36.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v36.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v35.__r_.__value_.__l.__data_);
  }
  if ((char)v33 < 0) {
    operator delete(v32[0]);
  }
  if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v31.__r_.__value_.__l.__data_);
  }
  if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v34.__r_.__value_.__l.__data_);
  }
  if (v37)
  {
    uint64_t v38 = v37;
    operator delete(v37);
  }
}

void sub_1BBC6CA84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *__p,uint64_t a29,int a30,__int16 a31,char a32,char a33,void *a34,uint64_t a35,int a36,__int16 a37,char a38,char a39,void *a40,uint64_t a41,int a42,__int16 a43,char a44,char a45,void *a46,uint64_t a47,int a48,__int16 a49,char a50,char a51)
{
  if (a33 < 0) {
    operator delete(__p);
  }
  if (a27 < 0) {
    operator delete(a22);
  }
  if (a15 < 0) {
    operator delete(a10);
  }
  if (a21 < 0) {
    operator delete(a16);
  }
  if (*(char *)(v51 - 73) < 0) {
    operator delete(*(void **)(v51 - 96));
  }
  if (*(char *)(v51 - 105) < 0) {
    operator delete(*(void **)(v51 - 128));
  }
  if (a45 < 0) {
    operator delete(a40);
  }
  if (a39 < 0) {
    operator delete(a34);
  }
  if (a51 < 0) {
    operator delete(a46);
  }
  v53 = *(void **)(v51 - 72);
  if (v53)
  {
    *(void *)(v51 - 64) = v53;
    operator delete(v53);
  }
  _Unwind_Resume(exception_object);
}

void sub_1BBC6CB70()
{
}

void sub_1BBC6CB78(unint64_t **a1@<X0>, std::string *a2@<X8>)
{
  id v3 = *a1;
  float v4 = a1[1];
  sub_1BBC58238(v7, "(");
  sub_1BBC58238(__p, ")");
  sub_1BBC6CF60(v3, v4, (uint64_t)v7, (uint64_t)__p, a2);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
  if (v8 < 0) {
    operator delete(v7[0]);
  }
}

void sub_1BBC6CC04(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20)
{
  if (a14 < 0) {
    operator delete(__p);
  }
  if (a20 < 0) {
    operator delete(a15);
  }
  _Unwind_Resume(exception_object);
}

void sub_1BBC6CC38(float *a1@<X0>, float *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, std::string *a5@<X8>)
{
  sub_1BBC58238(__p, ", ");
  std::to_string(&v26, *a1);
  int v10 = *(char *)(a3 + 23);
  if (v10 >= 0) {
    uint64_t v11 = (const std::string::value_type *)a3;
  }
  else {
    uint64_t v11 = *(const std::string::value_type **)a3;
  }
  if (v10 >= 0) {
    std::string::size_type v12 = *(unsigned __int8 *)(a3 + 23);
  }
  else {
    std::string::size_type v12 = *(void *)(a3 + 8);
  }
  float v13 = std::string::insert(&v26, 0, v11, v12);
  long long v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
  a5->__r_.__value_.__r.__words[2] = v13->__r_.__value_.__r.__words[2];
  *(_OWORD *)&a5->__r_.__value_.__l.__data_ = v14;
  v13->__r_.__value_.__l.__size_ = 0;
  v13->__r_.__value_.__r.__words[2] = 0;
  v13->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v26.__r_.__value_.__l.__data_);
  }
  for (i = a1 + 1; i != a2; ++i)
  {
    std::to_string(&v25, *i);
    if ((v28 & 0x80u) == 0) {
      long long v16 = __p;
    }
    else {
      long long v16 = (void **)__p[0];
    }
    if ((v28 & 0x80u) == 0) {
      std::string::size_type v17 = v28;
    }
    else {
      std::string::size_type v17 = (std::string::size_type)__p[1];
    }
    long long v18 = std::string::insert(&v25, 0, (const std::string::value_type *)v16, v17);
    long long v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
    v26.__r_.__value_.__r.__words[2] = v18->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v26.__r_.__value_.__l.__data_ = v19;
    v18->__r_.__value_.__l.__size_ = 0;
    v18->__r_.__value_.__r.__words[2] = 0;
    v18->__r_.__value_.__r.__words[0] = 0;
    if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      __int16 v20 = &v26;
    }
    else {
      __int16 v20 = (std::string *)v26.__r_.__value_.__r.__words[0];
    }
    if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(v26.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = v26.__r_.__value_.__l.__size_;
    }
    std::string::append(a5, (const std::string::value_type *)v20, size);
    if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v26.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v25.__r_.__value_.__l.__data_);
    }
  }
  int v22 = *(char *)(a4 + 23);
  if (v22 >= 0) {
    uint64_t v23 = (const std::string::value_type *)a4;
  }
  else {
    uint64_t v23 = *(const std::string::value_type **)a4;
  }
  if (v22 >= 0) {
    std::string::size_type v24 = *(unsigned __int8 *)(a4 + 23);
  }
  else {
    std::string::size_type v24 = *(void *)(a4 + 8);
  }
  std::string::append(a5, v23, v24);
  if ((char)v28 < 0) {
    operator delete(__p[0]);
  }
}

void sub_1BBC6CDC0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (*(char *)(v27 + 23) < 0) {
    operator delete(*(void **)v27);
  }
  if (a27 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *get_espresso_blob_shape@<X0>(void *a1@<X8>)
{
  return sub_1BBC4BE98(a1, 0);
}

uint64_t *nd_shape_to_5d_shape@<X0>(uint64_t *result@<X0>, _DWORD *a2@<X8>)
{
  uint64_t v2 = *result;
  unint64_t v3 = result[1] - *result;
  if (!v3)
  {
    *a2 = 1;
    goto LABEL_8;
  }
  uint64_t v4 = (uint64_t)v3 >> 3;
  uint64_t v5 = v2 + 8 * ((uint64_t)v3 >> 3);
  *a2 = *(void *)(v5 - 8);
  if (v3 <= 8)
  {
LABEL_8:
    a2[1] = 1;
    goto LABEL_9;
  }
  a2[1] = *(void *)(v5 - 16);
  if (v3 <= 0x10)
  {
LABEL_9:
    a2[2] = 1;
    goto LABEL_10;
  }
  uint64_t v6 = v2 + 8 * v4;
  a2[2] = *(void *)(v6 - 24);
  if (v3 <= 0x18)
  {
LABEL_10:
    int v7 = 1;
    a2[3] = 1;
    goto LABEL_11;
  }
  a2[3] = *(void *)(v6 - 32);
  if (v3 < 0x21) {
    int v7 = 1;
  }
  else {
    int v7 = *(_DWORD *)(v2 + 8 * v4 - 40);
  }
LABEL_11:
  a2[4] = v7;
  a2[5] = v3 >> 3;
  return result;
}

void sub_1BBC6CF60(unint64_t *a1@<X0>, unint64_t *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, std::string *a5@<X8>)
{
  sub_1BBC58238(__p, ", ");
  std::to_string(&v26, *a1);
  int v10 = *(char *)(a3 + 23);
  if (v10 >= 0) {
    uint64_t v11 = (const std::string::value_type *)a3;
  }
  else {
    uint64_t v11 = *(const std::string::value_type **)a3;
  }
  if (v10 >= 0) {
    std::string::size_type v12 = *(unsigned __int8 *)(a3 + 23);
  }
  else {
    std::string::size_type v12 = *(void *)(a3 + 8);
  }
  float v13 = std::string::insert(&v26, 0, v11, v12);
  long long v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
  a5->__r_.__value_.__r.__words[2] = v13->__r_.__value_.__r.__words[2];
  *(_OWORD *)&a5->__r_.__value_.__l.__data_ = v14;
  v13->__r_.__value_.__l.__size_ = 0;
  v13->__r_.__value_.__r.__words[2] = 0;
  v13->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v26.__r_.__value_.__l.__data_);
  }
  for (i = a1 + 1; i != a2; ++i)
  {
    std::to_string(&v25, *i);
    if ((v28 & 0x80u) == 0) {
      long long v16 = __p;
    }
    else {
      long long v16 = (void **)__p[0];
    }
    if ((v28 & 0x80u) == 0) {
      std::string::size_type v17 = v28;
    }
    else {
      std::string::size_type v17 = (std::string::size_type)__p[1];
    }
    long long v18 = std::string::insert(&v25, 0, (const std::string::value_type *)v16, v17);
    long long v19 = *(_OWORD *)&v18->__r_.__value_.__l.__data_;
    v26.__r_.__value_.__r.__words[2] = v18->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v26.__r_.__value_.__l.__data_ = v19;
    v18->__r_.__value_.__l.__size_ = 0;
    v18->__r_.__value_.__r.__words[2] = 0;
    v18->__r_.__value_.__r.__words[0] = 0;
    if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      __int16 v20 = &v26;
    }
    else {
      __int16 v20 = (std::string *)v26.__r_.__value_.__r.__words[0];
    }
    if ((v26.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
      std::string::size_type size = HIBYTE(v26.__r_.__value_.__r.__words[2]);
    }
    else {
      std::string::size_type size = v26.__r_.__value_.__l.__size_;
    }
    std::string::append(a5, (const std::string::value_type *)v20, size);
    if (SHIBYTE(v26.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v26.__r_.__value_.__l.__data_);
    }
    if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0) {
      operator delete(v25.__r_.__value_.__l.__data_);
    }
  }
  int v22 = *(char *)(a4 + 23);
  if (v22 >= 0) {
    uint64_t v23 = (const std::string::value_type *)a4;
  }
  else {
    uint64_t v23 = *(const std::string::value_type **)a4;
  }
  if (v22 >= 0) {
    std::string::size_type v24 = *(unsigned __int8 *)(a4 + 23);
  }
  else {
    std::string::size_type v24 = *(void *)(a4 + 8);
  }
  std::string::append(a5, v23, v24);
  if ((char)v28 < 0) {
    operator delete(__p[0]);
  }
}

void sub_1BBC6D0E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *__p,uint64_t a23,int a24,__int16 a25,char a26,char a27)
{
  if (*(char *)(v27 + 23) < 0) {
    operator delete(*(void **)v27);
  }
  if (a27 < 0) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

id sub_1BBC6E81C(uint64_t a1, uint64_t a2, void *a3)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v11 = @"errorSource";
  v12[0] = a3;
  uint64_t v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  int v7 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v4, v6, (uint64_t)v12, &v11, 1);
  uint64_t v9 = objc_msgSend_errorWithDomain_code_userInfo_(v3, v8, @"APODMLDESPluginErrorDomain", 8034, v7);

  return v9;
}

id sub_1BBC6E90C(uint64_t a1, uint64_t a2, void *a3)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v11 = @"errorSource";
  v12[0] = a3;
  uint64_t v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  int v7 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v4, v6, (uint64_t)v12, &v11, 1);
  uint64_t v9 = objc_msgSend_errorWithDomain_code_userInfo_(v3, v8, @"APODMLDESPluginErrorDomain", 8035, v7);

  return v9;
}

id sub_1BBC6E9FC(uint64_t a1, uint64_t a2, void *a3)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v11 = @"errorSource";
  v12[0] = a3;
  uint64_t v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  int v7 = objc_msgSend_dictionaryWithObjects_forKeys_count_(v4, v6, (uint64_t)v12, &v11, 1);
  uint64_t v9 = objc_msgSend_errorWithDomain_code_userInfo_(v3, v8, @"APODMLDESPluginErrorDomain", 8036, v7);

  return v9;
}

id sub_1BBC6EAEC(uint64_t a1, uint64_t a2, void *a3)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (objc_msgSend_isEqualToString_(v3, v4, @"AppDownloadVector"))
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
    int v7 = &kAPODMLDESPluginBindADVInputFail;
LABEL_8:
    objc_msgSend_errorWithDomain_code_userInfo_(v6, v5, @"APODMLDESPluginErrorDomain", *v7, 0);
    char v8 = LABEL_9:;
    goto LABEL_10;
  }
  if (objc_msgSend_isEqualToString_(v3, v5, @"AppInstalledVector"))
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
    int v7 = &kAPODMLDESPluginBindIAVInputFail;
    goto LABEL_8;
  }
  if ((objc_msgSend_isEqualToString_(v3, v5, @"AppUsageVector") & 1) != 0
    || objc_msgSend_isEqualToString_(v3, v5, @"appUsageVector"))
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
    int v7 = &kAPODMLDESPluginBindAUVInputFail;
    goto LABEL_8;
  }
  if (objc_msgSend_isEqualToString_(v3, v5, @"DupeFirstOrganic"))
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
    int v7 = &kAPODMLDESPluginBindDupeFirstOrganicInputFail;
    goto LABEL_8;
  }
  if (objc_msgSend_isEqualToString_(v3, v5, @"Installed"))
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
    int v7 = &kAPODMLDESPluginBindInstalledInputFail;
    goto LABEL_8;
  }
  if (objc_msgSend_isEqualToString_(v3, v5, @"pTTRLogit"))
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
    int v7 = &kAPODMLDESPluginBindPTTRInputFail;
    goto LABEL_8;
  }
  if ((objc_msgSend_isEqualToString_(v3, v5, @"Tapped") & 1) != 0
    || objc_msgSend_isEqualToString_(v3, v5, @"Tap"))
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
    int v7 = &kAPODMLDESPluginBindLabelInputFail;
    goto LABEL_8;
  }
  int isEqualToString = objc_msgSend_isEqualToString_(v3, v5, @"AppVector");
  std::string::size_type v12 = (void *)MEMORY[0x1E4F28C58];
  if (isEqualToString)
  {
    objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v11, @"APODMLDESPluginErrorDomain", 8018, 0);
    goto LABEL_9;
  }
  uint64_t v15 = @"errorSource";
  v16[0] = v3;
  float v13 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v11, (uint64_t)v16, &v15, 1);
  char v8 = objc_msgSend_errorWithDomain_code_userInfo_(v12, v14, @"APODMLDESPluginErrorDomain", 8018, v13);

LABEL_10:

  return v8;
}

void sub_1BBC70E8C()
{
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1F410C8D0]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1F40D7E90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1F40D7EA0](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

uint64_t CPCopySharedResourcesPreferencesDomainForDomain()
{
  return MEMORY[0x1F41092D8]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1F40E7248](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

uint64_t PBDataWriterWriteBOOLField()
{
  return MEMORY[0x1F4147190]();
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x1F41471C0]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x1F4147220]();
}

uint64_t PBDataWriterWriteSubmessage()
{
  return MEMORY[0x1F4147230]();
}

uint64_t PBReaderPlaceMark()
{
  return MEMORY[0x1F4147268]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x1F4147280]();
}

uint64_t PBReaderRecallMark()
{
  return MEMORY[0x1F41472A0]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x1F41472A8]();
}

uint64_t PBRepeatedDoubleAdd()
{
  return MEMORY[0x1F41472F0]();
}

uint64_t PBRepeatedDoubleClear()
{
  return MEMORY[0x1F41472F8]();
}

uint64_t PBRepeatedDoubleCopy()
{
  return MEMORY[0x1F4147300]();
}

uint64_t PBRepeatedDoubleHash()
{
  return MEMORY[0x1F4147308]();
}

uint64_t PBRepeatedDoubleIsEqual()
{
  return MEMORY[0x1F4147310]();
}

uint64_t PBRepeatedDoubleNSArray()
{
  return MEMORY[0x1F4147318]();
}

uint64_t SimulateCrash()
{
  return MEMORY[0x1F4139E98]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1F417E448](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1F417E530](this);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x1F417E5B8](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E5C0](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x1F417E608](this, __pos, __s, __n);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, float __val)
{
  return (std::string *)MEMORY[0x1F417EE68](retstr, __val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unint64_t __val)
{
  return (std::string *)MEMORY[0x1F417EE88](retstr, __val);
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1F417EF30](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1F417EF48](a1);
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1F40CA3C0](*(void *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1F40CBA88]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBAC0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

double drand48(void)
{
  MEMORY[0x1F40CBDE8]();
  return result;
}

uint64_t espresso_buffer_unpack_tensor_shape()
{
  return MEMORY[0x1F4118638]();
}

uint64_t espresso_create_context()
{
  return MEMORY[0x1F4118668]();
}

uint64_t espresso_create_plan()
{
  return MEMORY[0x1F4118678]();
}

uint64_t espresso_get_input_blob_name()
{
  return MEMORY[0x1F41186B8]();
}

uint64_t espresso_network_bind_buffer()
{
  return MEMORY[0x1F41186E0]();
}

uint64_t espresso_network_bind_buffer_to_global()
{
  return MEMORY[0x1F41186F0]();
}

uint64_t espresso_network_change_input_blob_shapes_seq_rank()
{
  return MEMORY[0x1F4118748]();
}

uint64_t espresso_network_declare_output()
{
  return MEMORY[0x1F4118770]();
}

uint64_t espresso_network_query_blob_shape()
{
  return MEMORY[0x1F4118798]();
}

uint64_t espresso_network_set_function_name()
{
  return MEMORY[0x1F41187B8]();
}

uint64_t espresso_plan_add_network()
{
  return MEMORY[0x1F41187D8]();
}

uint64_t espresso_plan_build()
{
  return MEMORY[0x1F41187F0]();
}

uint64_t espresso_plan_destroy()
{
  return MEMORY[0x1F4118818]();
}

uint64_t espresso_plan_execute_sync()
{
  return MEMORY[0x1F4118828]();
}

void exit(int a1)
{
}

long double exp(long double __x)
{
  MEMORY[0x1F40CBFE0](__x);
  return result;
}

int fclose(FILE *a1)
{
  return MEMORY[0x1F40CC050](a1);
}

int feof(FILE *a1)
{
  return MEMORY[0x1F40CC098](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x1F40CC0A0](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1F40CC1C0](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1F40CC200](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
}

uint64_t get_main_function_name()
{
  return MEMORY[0x1F41188A8]();
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD10](__dst, __src, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1F4181718](object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1F41817C8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
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
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1F40CD558](log);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

void srand48(uint64_t a1)
{
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1F40CE588](a1);
}

void vDSP_dotpr(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Length __N)
{
}

void vDSP_svesq(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
}

void vDSP_vadd(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsmul(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

void vDSP_vsub(const float *__B, vDSP_Stride __IB, const float *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE990](activity);
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1F40CE9D0](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x1F40CE9E8](activity);
}