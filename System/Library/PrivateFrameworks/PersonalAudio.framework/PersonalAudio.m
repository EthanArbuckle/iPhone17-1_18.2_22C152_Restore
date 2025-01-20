id paPairedDevicesSupportingTransparencyAccommodations()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;
  uint64_t vars8;

  v12 = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F2B998] sharedInstance];
  v1 = [v0 pairedDevices];

  v2 = [v1 indexesOfObjectsPassingTest:&__block_literal_global_2];
  v3 = [v1 objectsAtIndexes:v2];
  PAInitializeLogging();
  v4 = [NSString stringWithFormat:@"Found transparency devices %@", v3];
  v5 = [NSString stringWithFormat:@"%s:%d %@", "NSArray<BluetoothDevice *> *paPairedDevicesSupportingTransparencyAccommodations(void)", 437, v4];
  v6 = (void *)*MEMORY[0x263F472C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
  {
    v7 = v5;
    v8 = v6;
    *(_DWORD *)buf = 136446210;
    v11 = [v7 UTF8String];
    _os_log_impl(&dword_20CD3E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  return v3;
}

void __paRoutesOfSubtypeOrProduct_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x2020000000;
    v7 = (void *)getHURouteKeyRouteCurrentlyPickedSymbolLoc_ptr;
    uint64_t v43 = getHURouteKeyRouteCurrentlyPickedSymbolLoc_ptr;
    if (!getHURouteKeyRouteCurrentlyPickedSymbolLoc_ptr)
    {
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      v45 = __getHURouteKeyRouteCurrentlyPickedSymbolLoc_block_invoke;
      v46 = &unk_264103250;
      v47 = &v40;
      v8 = (void *)HearingUtilitiesLibrary_0();
      v9 = dlsym(v8, "HURouteKeyRouteCurrentlyPicked");
      *(void *)(v47[1] + 24) = v9;
      getHURouteKeyRouteCurrentlyPickedSymbolLoc_ptr = *(void *)(v47[1] + 24);
      v7 = (void *)v41[3];
    }
    _Block_object_dispose(&v40, 8);
    if (!v7) {
      goto LABEL_28;
    }
    v10 = [v6 objectForKey:*v7];
    int v11 = [v10 BOOLValue];

    if (!v11) {
      goto LABEL_27;
    }
  }
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  v12 = (id *)getHURouteKeyAudioRouteSubTypeSymbolLoc_ptr;
  uint64_t v43 = getHURouteKeyAudioRouteSubTypeSymbolLoc_ptr;
  if (!getHURouteKeyAudioRouteSubTypeSymbolLoc_ptr)
  {
    *(void *)&long long buf = MEMORY[0x263EF8330];
    *((void *)&buf + 1) = 3221225472;
    v45 = __getHURouteKeyAudioRouteSubTypeSymbolLoc_block_invoke;
    v46 = &unk_264103250;
    v47 = &v40;
    v13 = (void *)HearingUtilitiesLibrary_0();
    v14 = dlsym(v13, "HURouteKeyAudioRouteSubType");
    *(void *)(v47[1] + 24) = v14;
    getHURouteKeyAudioRouteSubTypeSymbolLoc_ptr = *(void *)(v47[1] + 24);
    v12 = (id *)v41[3];
  }
  _Block_object_dispose(&v40, 8);
  if (!v12)
  {
LABEL_28:
    __paRoutesOfSubtypeOrProduct_block_invoke_cold_1();
    goto LABEL_31;
  }
  id v15 = *v12;
  v16 = [v6 objectForKey:v15];

  v17 = *(void **)(a1 + 32);
  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __paRoutesOfSubtypeOrProduct_block_invoke_2;
  v38[3] = &unk_264103440;
  id v18 = v16;
  id v39 = v18;
  v19 = [v17 objectsPassingTest:v38];
  if ([v19 count]) {
    v20 = v6;
  }
  else {
    v20 = 0;
  }
  if (!v20)
  {
    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x2020000000;
    v22 = (id *)getHURouteKeyBTDetails_ProductIDSymbolLoc_ptr;
    uint64_t v43 = getHURouteKeyBTDetails_ProductIDSymbolLoc_ptr;
    if (!getHURouteKeyBTDetails_ProductIDSymbolLoc_ptr)
    {
      *(void *)&long long buf = MEMORY[0x263EF8330];
      *((void *)&buf + 1) = 3221225472;
      v45 = __getHURouteKeyBTDetails_ProductIDSymbolLoc_block_invoke;
      v46 = &unk_264103250;
      v47 = &v40;
      v23 = (void *)HearingUtilitiesLibrary_0();
      v24 = dlsym(v23, "HURouteKeyBTDetails_ProductID");
      *(void *)(v47[1] + 24) = v24;
      getHURouteKeyBTDetails_ProductIDSymbolLoc_ptr = *(void *)(v47[1] + 24);
      v22 = (id *)v41[3];
    }
    _Block_object_dispose(&v40, 8);
    if (v22)
    {
      id v25 = *v22;
      v26 = [v6 valueForKey:v25];

      if ([v26 length])
      {
        v27 = *(void **)(a1 + 40);
        v36[0] = MEMORY[0x263EF8330];
        v36[1] = 3221225472;
        v36[2] = __paRoutesOfSubtypeOrProduct_block_invoke_3;
        v36[3] = &unk_264103440;
        id v37 = v26;
        uint64_t v28 = [v27 objectsPassingTest:v36];

        v19 = (void *)v28;
      }
      if ([v19 count]) {
        v29 = v6;
      }
      else {
        v29 = 0;
      }
      id v21 = v29;

      goto LABEL_23;
    }
    __paRoutesOfSubtypeOrProduct_block_invoke_cold_1();
LABEL_31:
    __break(1u);
  }
  id v21 = v6;
LABEL_23:
  PAInitializeLogging();
  v30 = [NSString stringWithFormat:@"Checking route %d = %@", v21 != 0, v6];
  v31 = [NSString stringWithFormat:@"%s:%d %@", "NSArray<NSDictionary *> *paRoutesOfSubtypeOrProduct(NSSet *__strong, NSSet *__strong, BOOL)_block_invoke", 218, v30];
  v32 = (void *)*MEMORY[0x263F472C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
  {
    id v33 = v31;
    v34 = v32;
    uint64_t v35 = [v33 UTF8String];
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = v35;
    _os_log_impl(&dword_20CD3E000, v34, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);
  }
  if (v21)
  {
    [*(id *)(a1 + 48) addObject:v21];
  }
LABEL_27:
}

void sub_20CD43FE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id paRoutesOfSubtypeOrProduct(void *a1, void *a2, char a3)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  v7 = [getHUUtilitiesClass() sharedUtilities];
  v8 = [v7 currentPickableAudioRoutes];

  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __paRoutesOfSubtypeOrProduct_block_invoke;
  v21[3] = &unk_264103468;
  char v25 = a3;
  id v10 = v5;
  id v22 = v10;
  id v11 = v6;
  id v23 = v11;
  id v12 = v9;
  id v24 = v12;
  [v8 enumerateKeysAndObjectsUsingBlock:v21];
  if (![v12 count] && objc_msgSend(MEMORY[0x263F472B0], "isInternalInstall"))
  {
    PAInitializeLogging();
    v13 = [NSString stringWithFormat:@"Route not supported %@ - %@ = %@", v10, v11, v8];
    v14 = [NSString stringWithFormat:@"%s:%d %@", "NSArray<NSDictionary *> *paRoutesOfSubtypeOrProduct(NSSet *__strong, NSSet *__strong, BOOL)", 228, v13];
    id v15 = (void *)*MEMORY[0x263F472C8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
    {
      id v16 = v14;
      v17 = v15;
      uint64_t v18 = [v16 UTF8String];
      *(_DWORD *)long long buf = 136446210;
      uint64_t v27 = v18;
      _os_log_impl(&dword_20CD3E000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }
  }
  v19 = (void *)[v12 copy];

  return v19;
}

id paRouteOfSubtypeOrProduct(void *a1, void *a2, char a3)
{
  v3 = paRoutesOfSubtypeOrProduct(a1, a2, a3);
  v4 = [v3 lastObject];

  return v4;
}

id paProductsIdentifiersSupportingTransparencyAccommodations()
{
  v0 = (void *)paProductsIdentifiersSupportingTransparencyAccommodations_AudioRouteProductIDs;
  if (!paProductsIdentifiersSupportingTransparencyAccommodations_AudioRouteProductIDs)
  {
    uint64_t v1 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", @"76,8206", @"76,8212", @"76,8228", 0);
    v2 = (void *)paProductsIdentifiersSupportingTransparencyAccommodations_AudioRouteProductIDs;
    paProductsIdentifiersSupportingTransparencyAccommodations_AudioRouteProductIDs = v1;

    v0 = (void *)paProductsIdentifiersSupportingTransparencyAccommodations_AudioRouteProductIDs;
  }
  return v0;
}

id paCurrentRouteSupportingTransparencyAccommodations()
{
  v0 = paProductsIdentifiersSupportingTransparencyAccommodations();
  uint64_t v1 = paRouteOfSubtypeOrProduct(0, v0, 1);

  return v1;
}

id paCurrentBluetoothDeviceSupportingTransparencyAccommodations()
{
  v0 = paCurrentRouteSupportingTransparencyAccommodations();
  uint64_t v1 = getHURouteKeyRouteUID();
  v2 = [v0 objectForKey:v1];
  v3 = [v2 stringByReplacingOccurrencesOfString:@"-" withString:@":"];

  v4 = paPairedDevicesSupportingTransparencyAccommodations();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __paCurrentBluetoothDeviceSupportingTransparencyAccommodations_block_invoke;
  v9[3] = &unk_264103508;
  id v5 = v3;
  id v10 = v5;
  uint64_t v6 = [v4 indexOfObjectPassingTest:v9];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    v7 = [v4 objectAtIndex:v6];
  }

  return v7;
}

id getHUUtilitiesClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getHUUtilitiesClass_softClass;
  uint64_t v7 = getHUUtilitiesClass_softClass;
  if (!getHUUtilitiesClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getHUUtilitiesClass_block_invoke;
    v3[3] = &unk_264103250;
    v3[4] = &v4;
    __getHUUtilitiesClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_20CD44724(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getHURouteKeyRouteUID()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (void **)getHURouteKeyRouteUIDSymbolLoc_ptr;
  uint64_t v8 = getHURouteKeyRouteUIDSymbolLoc_ptr;
  if (!getHURouteKeyRouteUIDSymbolLoc_ptr)
  {
    id v1 = (void *)HearingUtilitiesLibrary_0();
    v6[3] = (uint64_t)dlsym(v1, "HURouteKeyRouteUID");
    getHURouteKeyRouteUIDSymbolLoc_ptr = v6[3];
    v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    uint64_t v4 = (_Unwind_Exception *)__paRoutesOfSubtypeOrProduct_block_invoke_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = *v0;
  return v2;
}

id getHUAccessoryManagerClass()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getHUAccessoryManagerClass_softClass;
  uint64_t v7 = getHUAccessoryManagerClass_softClass;
  if (!getHUAccessoryManagerClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getHUAccessoryManagerClass_block_invoke;
    v3[3] = &unk_264103250;
    v3[4] = &v4;
    __getHUAccessoryManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_20CD44910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getHUAccessoryManagerClass_0()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getHUAccessoryManagerClass_softClass_0;
  uint64_t v7 = getHUAccessoryManagerClass_softClass_0;
  if (!getHUAccessoryManagerClass_softClass_0)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getHUAccessoryManagerClass_block_invoke_0;
    v3[3] = &unk_264103250;
    v3[4] = &v4;
    __getHUAccessoryManagerClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_20CD449F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CD45948(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20CD46124(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  _Block_object_dispose((const void *)(v15 - 152), 8);
  objc_destroyWeak(v14);
  objc_destroyWeak(v13);
  objc_destroyWeak(v12);
  objc_destroyWeak(v11);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v15 - 216));
  _Unwind_Resume(a1);
}

Class __getHUAccessoryManagerClass_block_invoke(uint64_t a1)
{
  HearingUtilitiesLibrary();
  Class result = objc_getClass("HUAccessoryManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHUAccessoryManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getHUAccessoryManagerClass_block_invoke_cold_1();
    return (Class)HearingUtilitiesLibrary();
  }
  return result;
}

uint64_t HearingUtilitiesLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!HearingUtilitiesLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __HearingUtilitiesLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_264103270;
    uint64_t v5 = 0;
    HearingUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = HearingUtilitiesLibraryCore_frameworkLibrary;
  id v1 = (void *)v3[0];
  if (!HearingUtilitiesLibraryCore_frameworkLibrary)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __HearingUtilitiesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  HearingUtilitiesLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getAXHearingAidAudioRoutesChangedNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)HearingUtilitiesLibrary();
  uint64_t result = dlsym(v2, "AXHearingAidAudioRoutesChangedNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getAXHearingAidAudioRoutesChangedNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_20CD48234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id paBundle()
{
  uint64_t v0 = (void *)paBundle_PABundle;
  if (!paBundle_PABundle)
  {
    uint64_t v1 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v2 = (void *)paBundle_PABundle;
    paBundle_PABundle = v1;

    uint64_t v0 = (void *)paBundle_PABundle;
  }
  return v0;
}

id paLocString(void *a1)
{
  id v1 = a1;
  v2 = paBundle();
  v3 = [v2 localizedStringForKey:v1 value:v1 table:@"PersonalAudio"];

  return v3;
}

__CFString *paDescriptionForLevel(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
  {
    v2 = &stru_26C1E7618;
  }
  else
  {
    paLocString(off_2641036D8[a1 - 1]);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

__CFString *paDescriptionForShape(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
  {
    v2 = &stru_26C1E7618;
  }
  else
  {
    paLocString(off_2641036F0[a1 - 1]);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

uint64_t paKeyFromNodeParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(NSString, "stringWithFormat:", @"%lu-%lu_%lu", a1, a2, a3);
}

uint64_t __paRoutesOfSubtypeOrProduct_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsString:a2];
}

uint64_t __paRoutesOfSubtypeOrProduct_block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 containsString:*(void *)(a1 + 32)]) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = [*(id *)(a1 + 32) containsString:v3];
  }

  return v4;
}

id paRouteSubtypesSupportingAudioAccommodations()
{
  uint64_t v0 = (void *)paRouteSubtypesSupportingAudioAccommodations_AudioRouteSubtypes;
  if (!paRouteSubtypesSupportingAudioAccommodations_AudioRouteSubtypes)
  {
    uint64_t v1 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", @"b60", @"b60f", @"b60g", @"b225", 0);
    v2 = (void *)paRouteSubtypesSupportingAudioAccommodations_AudioRouteSubtypes;
    paRouteSubtypesSupportingAudioAccommodations_AudioRouteSubtypes = v1;

    uint64_t v0 = (void *)paRouteSubtypesSupportingAudioAccommodations_AudioRouteSubtypes;
  }
  return v0;
}

id paProductsIdentifiersSupportingAudioAccommodations()
{
  uint64_t v0 = (void *)paProductsIdentifiersSupportingAudioAccommodations_AudioRouteProductIDs;
  if (!paProductsIdentifiersSupportingAudioAccommodations_AudioRouteProductIDs)
  {
    uint64_t v1 = objc_msgSend(objc_alloc(MEMORY[0x263EFFA08]), "initWithObjects:", @"76,8207", @"76,8206", @"76,8203", @"76,8203", @"76,8204", @"76,8205", @"76,8202", @"76,8211", @"76,8212", @"76,8210", @"76,8228", @"76,8214", @"76,8230", @"76,8221", @"76,8217", @"76,8219", @"76,8222",
           @"76,8223",
           0);
    v2 = (void *)paProductsIdentifiersSupportingAudioAccommodations_AudioRouteProductIDs;
    paProductsIdentifiersSupportingAudioAccommodations_AudioRouteProductIDs = v1;

    uint64_t v0 = (void *)paProductsIdentifiersSupportingAudioAccommodations_AudioRouteProductIDs;
  }
  return v0;
}

id paCurrentRouteSupportingAudioAccommodations()
{
  uint64_t v0 = paRouteSubtypesSupportingAudioAccommodations();
  uint64_t v1 = paProductsIdentifiersSupportingAudioAccommodations();
  v2 = paRouteOfSubtypeOrProduct(v0, v1, 1);

  return v2;
}

BOOL paCurrentRouteSupportsAudioAccommodations()
{
  uint64_t v0 = paCurrentRouteSupportingAudioAccommodations();
  BOOL v1 = v0 != 0;

  return v1;
}

void paCurrentRouteSupportingAudioAccommodationsAsync(void *a1)
{
  id v1 = a1;
  if (v1)
  {
    v2 = [MEMORY[0x263F472B0] bluetoothManagerQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __paCurrentRouteSupportingAudioAccommodationsAsync_block_invoke;
    block[3] = &unk_264103490;
    id v4 = v1;
    dispatch_async(v2, block);
  }
}

void __paCurrentRouteSupportingAudioAccommodationsAsync_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  paRouteSubtypesSupportingAudioAccommodations();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = paProductsIdentifiersSupportingAudioAccommodations();
  id v3 = paRouteOfSubtypeOrProduct(v4, v2, 1);
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v3);
}

void paCurrentRouteSupportsAudioAccommodationsAsync(void *a1)
{
  id v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __paCurrentRouteSupportsAudioAccommodationsAsync_block_invoke;
    v3[3] = &unk_2641034B8;
    id v4 = v1;
    paCurrentRouteSupportingAudioAccommodationsAsync(v3);
  }
}

uint64_t __paCurrentRouteSupportsAudioAccommodationsAsync_block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 != 0);
}

BOOL paAnyRouteSupportsAudioAccommodations()
{
  uint64_t v0 = paRouteSubtypesSupportingAudioAccommodations();
  id v1 = paProductsIdentifiersSupportingAudioAccommodations();
  v2 = paRouteOfSubtypeOrProduct(v0, v1, 0);
  BOOL v3 = v2 != 0;

  return v3;
}

uint64_t paHeadphoneRouteAvailable()
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  uint64_t v0 = [getHUUtilitiesClass() sharedUtilities];
  id v1 = [v0 currentPickableAudioRoutes];

  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __paHeadphoneRouteAvailable_block_invoke;
  v4[3] = &unk_2641034E0;
  v4[4] = &v5;
  [v1 enumerateKeysAndObjectsUsingBlock:v4];
  uint64_t v2 = *((unsigned __int8 *)v6 + 24);

  _Block_object_dispose(&v5, 8);
  return v2;
}

void sub_20CD4BC1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __paHeadphoneRouteAvailable_block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  id v9 = (void *)getHURouteKeyRouteNameSymbolLoc_ptr;
  uint64_t v22 = getHURouteKeyRouteNameSymbolLoc_ptr;
  if (!getHURouteKeyRouteNameSymbolLoc_ptr)
  {
    id v10 = (void *)HearingUtilitiesLibrary_0();
    v20[3] = (uint64_t)dlsym(v10, "HURouteKeyRouteName");
    getHURouteKeyRouteNameSymbolLoc_ptr = v20[3];
    id v9 = (void *)v20[3];
  }
  _Block_object_dispose(&v19, 8);
  if (!v9)
  {
    __paRoutesOfSubtypeOrProduct_block_invoke_cold_1();
LABEL_16:
    __paRoutesOfSubtypeOrProduct_block_invoke_cold_1();
    goto LABEL_17;
  }
  id v11 = [v8 valueForKey:*v9];
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  id v12 = (id *)getHURouteKeyAudioRouteName_HeadsetSymbolLoc_ptr;
  uint64_t v22 = getHURouteKeyAudioRouteName_HeadsetSymbolLoc_ptr;
  if (!getHURouteKeyAudioRouteName_HeadsetSymbolLoc_ptr)
  {
    v13 = (void *)HearingUtilitiesLibrary_0();
    v20[3] = (uint64_t)dlsym(v13, "HURouteKeyAudioRouteName_Headset");
    getHURouteKeyAudioRouteName_HeadsetSymbolLoc_ptr = v20[3];
    id v12 = (id *)v20[3];
  }
  _Block_object_dispose(&v19, 8);
  if (!v12) {
    goto LABEL_16;
  }
  id v14 = *v12;
  if ([v11 hasPrefix:v14])
  {

LABEL_13:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
    goto LABEL_14;
  }
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v15 = (void *)getHURouteKeyAudioRouteName_HeadphoneSymbolLoc_ptr;
  uint64_t v22 = getHURouteKeyAudioRouteName_HeadphoneSymbolLoc_ptr;
  if (!getHURouteKeyAudioRouteName_HeadphoneSymbolLoc_ptr)
  {
    id v16 = (void *)HearingUtilitiesLibrary_0();
    v20[3] = (uint64_t)dlsym(v16, "HURouteKeyAudioRouteName_Headphone");
    getHURouteKeyAudioRouteName_HeadphoneSymbolLoc_ptr = v20[3];
    uint64_t v15 = (void *)v20[3];
  }
  _Block_object_dispose(&v19, 8);
  if (!v15)
  {
LABEL_17:
    uint64_t v18 = (_Unwind_Exception *)__paRoutesOfSubtypeOrProduct_block_invoke_cold_1();
    _Block_object_dispose(&v19, 8);
    _Unwind_Resume(v18);
  }
  int v17 = [v11 hasPrefix:*v15];

  if (v17) {
    goto LABEL_13;
  }
LABEL_14:
}

id paCurrentBluetoothDeviceSupportingANCAndHeadphoneAccommodations()
{
  uint64_t v0 = paCurrentRouteSupportingAudioAccommodations();
  id v1 = getHURouteKeyRouteUID();
  uint64_t v2 = [v0 objectForKey:v1];
  BOOL v3 = [v2 stringByReplacingOccurrencesOfString:@"-" withString:@":"];

  id v4 = [MEMORY[0x263F2B998] sharedInstance];
  uint64_t v5 = [v4 pairedDevices];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __paCurrentBluetoothDeviceSupportingANCAndHeadphoneAccommodations_block_invoke;
  v10[3] = &unk_264103508;
  id v6 = v3;
  id v11 = v6;
  uint64_t v7 = [v5 indexOfObjectPassingTest:v10];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = 0;
  }
  else
  {
    id v8 = [v5 objectAtIndex:v7];
  }

  return v8;
}

uint64_t __paCurrentBluetoothDeviceSupportingANCAndHeadphoneAccommodations_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%d,%d", objc_msgSend(v3, "vendorId"), objc_msgSend(v3, "productId"));
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = [v3 address];
  if ([v5 containsString:v6])
  {
    uint64_t v7 = paProductsIdentifiersSupportingAudioAccommodations();
    if ([v7 containsObject:v4]
      && [v3 featureCapability:16])
    {
      uint64_t v8 = [v3 isAppleAudioDevice];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void setCurrentDeviceToTransparencyMode()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v0 = paCurrentBluetoothDeviceSupportingANCAndHeadphoneAccommodations();
  PAInitializeLogging();
  id v1 = [NSString stringWithFormat:@"Setting ANC for %@", v0];
  uint64_t v2 = [NSString stringWithFormat:@"%s:%d %@", "void setCurrentDeviceToTransparencyMode(void)", 396, v1];
  id v3 = (void *)*MEMORY[0x263F472C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v2;
    uint64_t v5 = v3;
    *(_DWORD *)long long buf = 136446210;
    uint64_t v7 = [v4 UTF8String];
    _os_log_impl(&dword_20CD3E000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  [v0 setListeningMode:2];
}

uint64_t __paPairedDevicesSupportingTransparencyAccommodations_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_msgSend(NSString, "stringWithFormat:", @"%d,%d", objc_msgSend(v2, "vendorId"), objc_msgSend(v2, "productId"));
  if ([v2 isTemporaryPaired])
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v5 = paProductsIdentifiersSupportingTransparencyAccommodations();
    if ([v5 containsObject:v3]
      && [v2 featureCapability:33])
    {
      uint64_t v4 = [v2 isAppleAudioDevice];
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  return v4;
}

BOOL paPairedDeviceSupportsTransparencyAccommodations()
{
  uint64_t v0 = paPairedDevicesSupportingTransparencyAccommodations();
  BOOL v1 = [v0 count] != 0;

  return v1;
}

uint64_t __paCurrentBluetoothDeviceSupportingTransparencyAccommodations_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 address];
  if ([v4 containsString:v5]) {
    uint64_t v6 = [v3 isAppleAudioDevice];
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

void paCurrentBluetoothDeviceSupportingTransparencyAccommodationsAsync(void *a1)
{
  id v1 = a1;
  id v2 = [MEMORY[0x263F472B0] bluetoothManagerQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __paCurrentBluetoothDeviceSupportingTransparencyAccommodationsAsync_block_invoke;
  block[3] = &unk_264103490;
  id v5 = v1;
  id v3 = v1;
  dispatch_async(v2, block);
}

void __paCurrentBluetoothDeviceSupportingTransparencyAccommodationsAsync_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
  }
}

id paAvailableBluetoothDevicesSupportingTransparencyAccommodations()
{
  uint64_t v0 = [MEMORY[0x263EFF980] array];
  uint64_t v1 = paProductsIdentifiersSupportingTransparencyAccommodations();
  id v2 = paRoutesOfSubtypeOrProduct(0, v1, 1);

  id v3 = paPairedDevicesSupportingTransparencyAccommodations();
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __paAvailableBluetoothDevicesSupportingTransparencyAccommodations_block_invoke;
  v9[3] = &unk_264103550;
  id v10 = v3;
  id v4 = v0;
  id v11 = v4;
  id v5 = v3;
  [v2 enumerateObjectsUsingBlock:v9];
  uint64_t v6 = v11;
  id v7 = v4;

  return v7;
}

void __paAvailableBluetoothDevicesSupportingTransparencyAccommodations_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = getHURouteKeyRouteUID();
  id v5 = [v3 objectForKey:v4];

  uint64_t v6 = [v5 stringByReplacingOccurrencesOfString:@"-" withString:@":"];

  id v7 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __paAvailableBluetoothDevicesSupportingTransparencyAccommodations_block_invoke_2;
  v11[3] = &unk_264103508;
  id v8 = v6;
  id v12 = v8;
  uint64_t v9 = [v7 indexOfObjectPassingTest:v11];
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = [*(id *)(a1 + 32) objectAtIndex:v9];
    if (v10 && ([*(id *)(a1 + 40) containsObject:v10] & 1) == 0) {
      [*(id *)(a1 + 40) addObject:v10];
    }
  }
}

uint64_t __paAvailableBluetoothDevicesSupportingTransparencyAccommodations_block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [v3 address];
  if ([v4 containsString:v5]) {
    uint64_t v6 = [v3 isAppleAudioDevice];
  }
  else {
    uint64_t v6 = 0;
  }

  return v6;
}

BOOL paCurrentRouteSupportsTransparencyAccommodations()
{
  uint64_t v0 = paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
  BOOL v1 = v0 != 0;

  return v1;
}

uint64_t paBluetoothDeviceSupportsSSL(void *a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  unsigned int v1 = [a1 getAACPCapabilityInteger:6];
  PAInitializeLogging();
  id v2 = NSString;
  id v3 = [NSNumber numberWithUnsignedInteger:v1];
  id v4 = [v2 stringWithFormat:@"Found PSE version %@", v3];

  id v5 = [NSString stringWithFormat:@"%s:%d %@", "BOOL paBluetoothDeviceSupportsSSL(BluetoothDevice *__strong _Nonnull)", 523, v4];
  uint64_t v6 = (void *)*MEMORY[0x263F472C8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F472C8], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = v5;
    id v8 = v6;
    *(_DWORD *)long long buf = 136446210;
    uint64_t v11 = [v7 UTF8String];
    _os_log_impl(&dword_20CD3E000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  LODWORD(result) = _os_feature_enabled_impl();
  if (v1 > 2) {
    return result;
  }
  else {
    return 0;
  }
}

id getHKUnitClass()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)getHKUnitClass_softClass;
  uint64_t v7 = getHKUnitClass_softClass;
  if (!getHKUnitClass_softClass)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getHKUnitClass_block_invoke;
    v3[3] = &unk_264103250;
    void v3[4] = &v4;
    __getHKUnitClass_block_invoke((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_20CD4CEAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20CD4D2C8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Block_object_dispose((const void *)(v1 - 168), 8);
  _Unwind_Resume(a1);
}

Class __getHUUtilitiesClass_block_invoke(uint64_t a1)
{
  HearingUtilitiesLibrary_0();
  Class result = objc_getClass("HUUtilities");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getHUUtilitiesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getHUUtilitiesClass_block_invoke_cold_1();
    return (Class)HearingUtilitiesLibrary_0();
  }
  return result;
}

uint64_t HearingUtilitiesLibrary_0()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!HearingUtilitiesLibraryCore_frameworkLibrary_0)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __HearingUtilitiesLibraryCore_block_invoke_0;
    void v3[4] = &__block_descriptor_40_e5_v8__0l;
    void v3[5] = v3;
    long long v4 = xmmword_2641036A8;
    uint64_t v5 = 0;
    HearingUtilitiesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  uint64_t v0 = HearingUtilitiesLibraryCore_frameworkLibrary_0;
  uint64_t v1 = (void *)v3[0];
  if (!HearingUtilitiesLibraryCore_frameworkLibrary_0)
  {
    uint64_t v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __HearingUtilitiesLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  HearingUtilitiesLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void *__getHURouteKeyRouteCurrentlyPickedSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)HearingUtilitiesLibrary_0();
  uint64_t result = dlsym(v2, "HURouteKeyRouteCurrentlyPicked");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHURouteKeyRouteCurrentlyPickedSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getHURouteKeyAudioRouteSubTypeSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)HearingUtilitiesLibrary_0();
  uint64_t result = dlsym(v2, "HURouteKeyAudioRouteSubType");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHURouteKeyAudioRouteSubTypeSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getHURouteKeyRouteNameSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)HearingUtilitiesLibrary_0();
  uint64_t result = dlsym(v2, "HURouteKeyRouteName");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHURouteKeyRouteNameSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getHURouteKeyRouteUIDSymbolLoc_block_invoke(uint64_t a1)
{
  id v2 = (void *)HearingUtilitiesLibrary_0();
  uint64_t result = dlsym(v2, "HURouteKeyRouteUID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getHURouteKeyRouteUIDSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getHKUnitClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!HealthKitLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __HealthKitLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_2641036C0;
    uint64_t v6 = 0;
    HealthKitLibraryCore_frameworkLibrary = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!HealthKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("HKUnit");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)__getHKUnitClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getHKUnitClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __HealthKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  HealthKitLibraryCore_frameworkLibrary = result;
  return result;
}

Class initHMDeviceConfigurations()
{
  if (HearingModeServiceLibrary_sOnce != -1) {
    dispatch_once(&HearingModeServiceLibrary_sOnce, &__block_literal_global_3);
  }
  Class result = objc_getClass("HMDeviceConfigurations");
  classHMDeviceConfigurations = (uint64_t)result;
  getHMDeviceConfigurationsClass = (uint64_t (*)())HMDeviceConfigurationsFunction;
  return result;
}

id HMDeviceConfigurationsFunction()
{
  return (id)classHMDeviceConfigurations;
}

void *__HearingModeServiceLibrary_block_invoke()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/HearingModeService.framework/HearingModeService", 2);
  HearingModeServiceLibrary_sLib = (uint64_t)result;
  return result;
}

double OUTLINED_FUNCTION_0(float a1)
{
  return a1;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_20CD53B50(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 56));
  _Unwind_Resume(a1);
}

void sub_20CD54960(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 72));
  _Unwind_Resume(a1);
}

Class __getHUAccessoryManagerClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!HearingUtilitiesLibraryCore_frameworkLibrary_1)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __HearingUtilitiesLibraryCore_block_invoke_1;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    void v4[5] = v4;
    long long v5 = xmmword_264103840;
    uint64_t v6 = 0;
    HearingUtilitiesLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!HearingUtilitiesLibraryCore_frameworkLibrary_1)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("HUAccessoryManager");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)__getHUAccessoryManagerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getHUAccessoryManagerClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __HearingUtilitiesLibraryCore_block_invoke_1()
{
  uint64_t result = _sl_dlopen();
  HearingUtilitiesLibraryCore_frameworkLibrary_1 = result;
  return result;
}

Class initHMServiceClient()
{
  if (HearingModeServiceLibrary_sOnce_0 != -1) {
    dispatch_once(&HearingModeServiceLibrary_sOnce_0, &__block_literal_global_87);
  }
  Class result = objc_getClass("HMServiceClient");
  classHMServiceClient = (uint64_t)result;
  getHMServiceClientClass = (uint64_t (*)())HMServiceClientFunction;
  return result;
}

id HMServiceClientFunction()
{
  return (id)classHMServiceClient;
}

void *__HearingModeServiceLibrary_block_invoke_0()
{
  Class result = dlopen("/System/Library/PrivateFrameworks/HearingModeService.framework/HearingModeService", 2);
  HearingModeServiceLibrary_sLib_0 = (uint64_t)result;
  return result;
}

Class initHMDeviceConfigurations_0()
{
  if (HearingModeServiceLibrary_sOnce_0 != -1) {
    dispatch_once(&HearingModeServiceLibrary_sOnce_0, &__block_literal_global_87);
  }
  Class result = objc_getClass("HMDeviceConfigurations");
  classHMDeviceConfigurations_0 = (uint64_t)result;
  getHMDeviceConfigurationsClass_0 = (uint64_t (*)())HMDeviceConfigurationsFunction_0;
  return result;
}

id HMDeviceConfigurationsFunction_0()
{
  return (id)classHMDeviceConfigurations_0;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

uint64_t __getHUAccessoryManagerClass_block_invoke_cold_1()
{
  return __paRoutesOfSubtypeOrProduct_block_invoke_cold_1();
}

uint64_t __paRoutesOfSubtypeOrProduct_block_invoke_cold_1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return __getHUUtilitiesClass_block_invoke_cold_1(v0);
}

uint64_t __getHUUtilitiesClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return __getHKUnitClass_block_invoke_cold_1(v0);
}

uint64_t __getHKUnitClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return -[PAConfiguration initWithCoder:](v0);
}

uint64_t AXLogCommon()
{
  return MEMORY[0x270F092D8]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t PAInitializeLogging()
{
  return MEMORY[0x270F390C0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
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

void objc_end_catch(void)
{
}

void objc_exception_throw(id exception)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}