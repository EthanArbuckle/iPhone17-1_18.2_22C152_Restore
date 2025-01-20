id SFRuntimeAbsoluteFilePathForPath(void *a1)
{
  id v1;
  uint64_t vars8;

  v1 = a1;
  return v1;
}

id getSTManagementState()
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2050000000;
  v0 = (void *)getSTManagementStateClass_softClass;
  uint64_t v8 = getSTManagementStateClass_softClass;
  if (!getSTManagementStateClass_softClass)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __getSTManagementStateClass_block_invoke;
    v4[3] = &unk_264247868;
    v4[4] = &v5;
    __getSTManagementStateClass_block_invoke((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v5, 8);
  v2 = objc_opt_new();
  return v2;
}

void sub_2154DB600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSTManagementStateClass_block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!ScreenTimeCoreLibraryCore_frameworkLibrary)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = __ScreenTimeCoreLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_264247888;
    uint64_t v5 = 0;
    ScreenTimeCoreLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!ScreenTimeCoreLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_8:
      __getSTManagementStateClass_block_invoke_cold_1();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("STManagementState");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  getSTManagementStateClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __SpringBoardPreferenceDomain_block_invoke()
{
  uint64_t result = CPCopySharedResourcesPreferencesDomainForDomain();
  SpringBoardPreferenceDomain_springBoardDomain = result;
  return result;
}

id SFObjectAndOffsetForURLPair(void *a1)
{
  id v1 = [a1 componentsSeparatedByString:@"#"];
  v2 = [v1 objectAtIndex:0];
  if ([v1 count] == 2)
  {
    v3 = [v1 objectAtIndex:1];
    [v3 floatValue];
  }
  else
  {
    v3 = 0;
    double v4 = 0.0;
  }
  uint64_t v5 = NSDictionary;
  uint64_t v6 = [NSNumber numberWithFloat:v4];
  uint64_t v7 = objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", v2, @"object", v3, @"offsetItem", v6, @"offsetValue", 0);

  return v7;
}

id _SFBuiltInRegulatoryImage(void *a1, void *a2)
{
  v74[2] = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  uint64_t v5 = [MEMORY[0x263F1C920] mainScreen];
  [v5 scale];
  double v7 = v6;

  uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"_%uonly_", v7);
  v9 = SFLogForCategory(3uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    _SFBuiltInRegulatoryImage_cold_2();
  }

  if (v4)
  {
    v10 = [@"RegulatoryInfo-" stringByAppendingFormat:@"%@-%@%@", v3, v4, v8];
    v11 = (void *)MEMORY[0x263F1C6B0];
    v12 = SFRuntimeAbsoluteFilePathForPath(@"/System/Library/ProductDocuments/RegulatoryImages");
    v13 = [v12 stringByAppendingPathComponent:v10];
    id v14 = [v11 imageWithContentsOfFile:v13];

    v15 = SFLogForCategory(3uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v64 = "UIImage *_SFBuiltInRegulatoryImage(NSString *__strong, NSString *__strong)";
      __int16 v65 = 2112;
      id v66 = v10;
      _os_log_impl(&dword_2154D9000, v15, OS_LOG_TYPE_DEFAULT, "%{Public}s: Looked up '%{Public}@'", buf, 0x16u);
    }

    if (v14)
    {
      id v61 = v3;
      v16 = [@"RegulatoryInfo-" stringByAppendingFormat:@"%@-%@_dark%@", v3, v4, v8];
      v17 = (void *)MEMORY[0x263F1C6B0];
      v18 = SFRuntimeAbsoluteFilePathForPath(@"/System/Library/ProductDocuments/RegulatoryImages");
      v19 = [v18 stringByAppendingPathComponent:v16];
      v20 = [v17 imageWithContentsOfFile:v19];

      if (v20)
      {
        v59 = v16;
        v60 = v8;
        id v62 = v4;
        uint64_t v57 = [MEMORY[0x263F1CB00] currentTraitCollection];
        v21 = [MEMORY[0x263F1CB00] traitCollectionWithDisplayScale:v7];
        id v22 = objc_alloc_init(MEMORY[0x263F1C6B8]);
        v23 = (void *)MEMORY[0x263F1CB00];
        v74[0] = v21;
        v24 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:1];
        v74[1] = v24;
        v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v74 count:2];
        v26 = [v23 traitCollectionWithTraitsFromCollections:v25];
        [v22 registerImage:v14 withTraitCollection:v26];

        v27 = (void *)MEMORY[0x263F1CB00];
        v73[0] = v21;
        v28 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:2];
        v73[1] = v28;
        v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v73 count:2];
        v30 = [v27 traitCollectionWithTraitsFromCollections:v29];
        [v22 registerImage:v20 withTraitCollection:v30];

        v31 = (void *)v57;
        uint64_t v32 = [v22 imageWithTraitCollection:v57];
        v33 = (void *)_SFBuiltInRegulatoryImage_styleSensitiveImage;
        _SFBuiltInRegulatoryImage_styleSensitiveImage = v32;

        v34 = SFLogForCategory(3uLL);
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v64 = "UIImage *_SFBuiltInRegulatoryImage(NSString *__strong, NSString *__strong)";
          __int16 v65 = 2112;
          id v66 = v10;
          _os_log_impl(&dword_2154D9000, v34, OS_LOG_TYPE_DEFAULT, "%{Public}s: Resolved to style-sensitive Regulatory Image with base name '%{Public}@'.", buf, 0x16u);
        }

        v35 = (void *)_SFBuiltInRegulatoryImage_styleSensitiveImage;
LABEL_20:
        id v54 = v35;

        id v3 = v61;
        id v4 = v62;
        v16 = v59;
        uint64_t v8 = v60;
        goto LABEL_28;
      }
      id v3 = v61;
LABEL_25:
      v55 = SFLogForCategory(3uLL);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v64 = "UIImage *_SFBuiltInRegulatoryImage(NSString *__strong, NSString *__strong)";
        __int16 v65 = 2112;
        id v66 = v10;
        _os_log_impl(&dword_2154D9000, v55, OS_LOG_TYPE_DEFAULT, "%{Public}s: Resolved to Regulatory Image with name '%{Public}@'.", buf, 0x16u);
      }
      goto LABEL_27;
    }
    id v62 = v4;
    id v4 = v10;
  }
  else
  {
    id v62 = 0;
  }
  v36 = SFLogForCategory(3uLL);
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
    _SFBuiltInRegulatoryImage_cold_1();
  }

  v10 = [@"RegulatoryInfo-" stringByAppendingFormat:@"%@%@", v3, v8];

  v37 = (void *)MEMORY[0x263F1C6B0];
  v38 = SFRuntimeAbsoluteFilePathForPath(@"/System/Library/ProductDocuments/RegulatoryImages");
  v39 = [v38 stringByAppendingPathComponent:v10];
  id v14 = [v37 imageWithContentsOfFile:v39];

  if (v14)
  {
    v16 = [@"RegulatoryInfo-" stringByAppendingFormat:@"%@_dark%@", v3, v8];
    v40 = (void *)MEMORY[0x263F1C6B0];
    v41 = SFRuntimeAbsoluteFilePathForPath(@"/System/Library/ProductDocuments/RegulatoryImages");
    v42 = [v41 stringByAppendingPathComponent:v16];
    v20 = [v40 imageWithContentsOfFile:v42];

    if (v20)
    {
      v59 = v16;
      v60 = v8;
      id v61 = v3;
      uint64_t v58 = [MEMORY[0x263F1CB00] currentTraitCollection];
      v21 = [MEMORY[0x263F1CB00] traitCollectionWithDisplayScale:v7];
      id v22 = objc_alloc_init(MEMORY[0x263F1C6B8]);
      v43 = (void *)MEMORY[0x263F1CB00];
      v72[0] = v21;
      v44 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:1];
      v72[1] = v44;
      v45 = [MEMORY[0x263EFF8C0] arrayWithObjects:v72 count:2];
      v46 = [v43 traitCollectionWithTraitsFromCollections:v45];
      [v22 registerImage:v14 withTraitCollection:v46];

      v47 = (void *)MEMORY[0x263F1CB00];
      v71[0] = v21;
      v48 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:2];
      v71[1] = v48;
      v49 = [MEMORY[0x263EFF8C0] arrayWithObjects:v71 count:2];
      v50 = [v47 traitCollectionWithTraitsFromCollections:v49];
      [v22 registerImage:v20 withTraitCollection:v50];

      v31 = (void *)v58;
      uint64_t v51 = [v22 imageWithTraitCollection:v58];
      v52 = (void *)_SFBuiltInRegulatoryImage_styleSensitiveImage_330;
      _SFBuiltInRegulatoryImage_styleSensitiveImage_330 = v51;

      v53 = SFLogForCategory(3uLL);
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        v64 = "UIImage *_SFBuiltInRegulatoryImage(NSString *__strong, NSString *__strong)";
        __int16 v65 = 2112;
        id v66 = v10;
        _os_log_impl(&dword_2154D9000, v53, OS_LOG_TYPE_DEFAULT, "%{Public}s: Resolved to style-sensitive Regulatory Image with base name '%{Public}@'.", buf, 0x16u);
      }

      v35 = (void *)_SFBuiltInRegulatoryImage_styleSensitiveImage_330;
      goto LABEL_20;
    }
    id v4 = v62;
    goto LABEL_25;
  }
  v55 = SFLogForCategory(3uLL);
  if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315906;
    v64 = "UIImage *_SFBuiltInRegulatoryImage(NSString *__strong, NSString *__strong)";
    __int16 v65 = 2112;
    id v66 = v3;
    __int16 v67 = 2112;
    id v4 = v62;
    id v68 = v62;
    __int16 v69 = 2112;
    v70 = v10;
    _os_log_error_impl(&dword_2154D9000, v55, OS_LOG_TYPE_ERROR, "%{Public}s: Failed to resolve to a Built-in Regulatory Image '%{Public}@-%{Public}@' with name '%{Public}@'", buf, 0x2Au);
    id v14 = 0;
    v16 = 0;
  }
  else
  {
    id v14 = 0;
    v16 = 0;
    id v4 = v62;
  }
LABEL_27:

  id v14 = v14;
  id v54 = v14;
LABEL_28:

  return v54;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

BOOL SFDeviceSupportsFall2019OrLaterELabel()
{
  return MGGetBoolAnswer() && !MGIsDeviceOneOfType();
}

BOOL SFDeviceSupportsFall2020OrLaterELabel()
{
  return MGGetBoolAnswer() && !MGIsDeviceOneOfType();
}

BOOL SFDeviceSupportsSpring2021OrLaterELabel()
{
  return MGGetBoolAnswer() && !MGIsDeviceOneOfType();
}

uint64_t SFDeviceSupportsShipsWithoutAdapterRoHSELabel()
{
  if (!MGGetBoolAnswer()) {
    return 0;
  }
  v0 = [MEMORY[0x263F1C5C0] currentDevice];
  if (objc_msgSend(v0, "sf_isiPhone")) {
    uint64_t v1 = MGIsDeviceOneOfType() ^ 1;
  }
  else {
    uint64_t v1 = 0;
  }

  return v1;
}

uint64_t SFShouldShowEyesightWarning()
{
  v0 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v1 = objc_msgSend(v0, "sf_regionCode");

  if (SFDeviceSupportsFall2019OrLaterELabel() && (MGIsDeviceOneOfType() & 1) == 0) {
    uint64_t v2 = objc_msgSend(&unk_26C6105C0, "containsObject:", v1, 0);
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t SFShouldShowMonthOfManufacture()
{
  v0 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v1 = objc_msgSend(v0, "sf_regionCode");

  if (SFDeviceSupportsFall2019OrLaterELabel() && (MGIsDeviceOneOfType() & 1) == 0) {
    uint64_t v2 = objc_msgSend(&unk_26C6105D8, "containsObject:", v1, 0);
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t SFShouldShowAlertMark()
{
  uint64_t v148 = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v1 = objc_msgSend(v0, "sf_regionCode");

  if (SFDeviceSupportsFall2019OrLaterELabel()) {
    goto LABEL_3;
  }
  int v147 = -1418383976;
  long long v146 = xmmword_2154ED07C;
  int v145 = -1213485500;
  long long v144 = xmmword_2154ED0A4;
  int v143 = -232427879;
  long long v142 = xmmword_2154ECCE4;
  int v141 = -427474227;
  long long v140 = xmmword_2154ECCF8;
  int v139 = 1477534141;
  long long v138 = xmmword_2154ECD0C;
  int v137 = -61007701;
  long long v136 = xmmword_2154ECD20;
  int v135 = -235416490;
  long long v134 = xmmword_2154ECD34;
  int v133 = -1403227947;
  long long v132 = xmmword_2154ED018;
  int v131 = 729118884;
  long long v130 = xmmword_2154ED02C;
  int v129 = 1046806126;
  long long v128 = xmmword_2154ED040;
  int v127 = -188760945;
  long long v126 = xmmword_2154ED054;
  int v125 = -489993439;
  long long v124 = xmmword_2154ECFF0;
  int v123 = 886875686;
  long long v122 = xmmword_2154ED004;
  int v121 = -1843102369;
  long long v120 = xmmword_2154ECD48;
  int v119 = -820493242;
  long long v118 = xmmword_2154ECD5C;
  int v117 = 1532898719;
  long long v116 = xmmword_2154ECD70;
  int v115 = -1157300313;
  long long v114 = xmmword_2154ECD84;
  int v113 = -2132668294;
  long long v112 = xmmword_2154ECD98;
  int v111 = 1278131292;
  long long v110 = xmmword_2154ED0B8;
  int v109 = -1841712216;
  long long v108 = xmmword_2154ED0CC;
  int v107 = 659506830;
  long long v106 = xmmword_2154ED0E0;
  int v105 = 213746202;
  long long v104 = xmmword_2154ED0F4;
  int v103 = 2030516999;
  long long v102 = xmmword_2154ECDAC;
  int v101 = -1276010597;
  long long v100 = xmmword_2154ECDC0;
  int v99 = -762483149;
  long long v98 = xmmword_2154ECDD4;
  int v97 = -1926937532;
  long long v96 = xmmword_2154ECDE8;
  int v95 = -1902732724;
  long long v94 = xmmword_2154ECDFC;
  int v93 = -342357580;
  long long v92 = xmmword_2154ECE10;
  int v91 = 300442574;
  long long v90 = xmmword_2154ECE24;
  int v89 = -1294188889;
  long long v88 = xmmword_2154ECE38;
  int v87 = 401945557;
  long long v86 = xmmword_2154ECFA0;
  int v85 = 338555555;
  long long v84 = xmmword_2154ECE4C;
  int v83 = -679691073;
  long long v82 = xmmword_2154ECE60;
  int v81 = 729903963;
  long long v80 = xmmword_2154ECE74;
  int v79 = 1908474541;
  long long v78 = xmmword_2154ECE88;
  int v77 = -414334491;
  long long v76 = xmmword_2154ECE9C;
  int v75 = -1509831889;
  long long v74 = xmmword_2154ECEB0;
  int v73 = 289690957;
  long long v72 = xmmword_2154ECEC4;
  int v71 = 586720268;
  long long v70 = xmmword_2154ECED8;
  int v69 = -1282800328;
  long long v68 = xmmword_2154ECEEC;
  int v67 = 1711910369;
  long long v66 = xmmword_2154ECF00;
  int v65 = 710807826;
  long long v64 = xmmword_2154ECF14;
  int v63 = 470738981;
  long long v62 = xmmword_2154ECF28;
  int v61 = -2085056298;
  long long v60 = xmmword_2154ECF3C;
  int v59 = 1860682089;
  long long v58 = xmmword_2154ECF50;
  int v57 = -1742178852;
  long long v56 = xmmword_2154ECF64;
  int v55 = 2146530832;
  long long v54 = xmmword_2154ECF78;
  int v53 = -2114570942;
  long long v52 = xmmword_2154ED108;
  v50 = &v52;
  uint64_t v51 = 0;
  v48 = &v56;
  v49 = &v54;
  v46 = &v60;
  v47 = &v58;
  v44 = &v64;
  v45 = &v62;
  v42 = &v68;
  v43 = &v66;
  v40 = &v72;
  v41 = &v70;
  v38 = &v76;
  v39 = &v74;
  v36 = &v80;
  v37 = &v78;
  v34 = &v84;
  v35 = &v82;
  uint64_t v32 = &v88;
  v33 = &v86;
  v30 = &v92;
  v31 = &v90;
  v28 = &v96;
  v29 = &v94;
  v26 = &v100;
  v27 = &v98;
  v24 = &v104;
  v25 = &v102;
  id v22 = &v108;
  v23 = &v106;
  v20 = &v112;
  v21 = &v110;
  v18 = &v116;
  v19 = &v114;
  v16 = &v120;
  v17 = &v118;
  id v14 = &v124;
  v15 = &v122;
  v12 = &v128;
  v13 = &v126;
  v10 = &v132;
  v11 = &v130;
  uint64_t v8 = &v136;
  uint64_t v9 = &v134;
  double v6 = &v140;
  double v7 = &v138;
  id v4 = &v144;
  uint64_t v5 = &v142;
  if (MGIsDeviceOneOfType()) {
LABEL_3:
  }
    uint64_t v2 = objc_msgSend(&unk_26C6105F0, "containsObject:", v1, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19,
           v20,
           v21,
           v22,
           v23,
           v24,
           v25,
           v26,
           v27,
           v28,
           v29,
           v30,
           v31,
           v32,
           v33,
           v34,
           v35,
           v36,
           v37,
           v38,
           v39,
           v40,
           v41,
           v42,
           v43,
           v44,
           v45,
           v46,
           v47,
           v48,
           v49,
           v50,
           v51);
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t SFShouldShowIndiaBIS()
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v1 = objc_msgSend(v0, "sf_regionCode");

  int v40 = 317289457;
  long long v39 = xmmword_2154ECF8C;
  int v38 = 401945557;
  long long v37 = xmmword_2154ECFA0;
  id v4 = &v37;
  uint64_t v5 = 0;
  if (MGIsDeviceOneOfType()) {
    goto LABEL_4;
  }
  int v36 = 1214363620;
  long long v35 = xmmword_2154ECFB4;
  int v34 = -798153473;
  long long v33 = xmmword_2154ECFC8;
  int v32 = -776721724;
  long long v31 = xmmword_2154ECFDC;
  int v30 = -489993439;
  long long v29 = xmmword_2154ECFF0;
  int v28 = 886875686;
  long long v27 = xmmword_2154ED004;
  int v26 = -1403227947;
  long long v25 = xmmword_2154ED018;
  int v24 = 729118884;
  long long v23 = xmmword_2154ED02C;
  int v22 = 1046806126;
  long long v21 = xmmword_2154ED040;
  int v20 = -188760945;
  long long v19 = xmmword_2154ED054;
  int v18 = -1418383976;
  long long v17 = xmmword_2154ED07C;
  int v16 = -1213485500;
  long long v15 = xmmword_2154ED0A4;
  v13 = &v15;
  uint64_t v14 = 0;
  v12 = &v17;
  v10 = &v21;
  v11 = &v19;
  uint64_t v8 = &v25;
  uint64_t v9 = &v23;
  double v6 = &v29;
  double v7 = &v27;
  id v4 = &v33;
  uint64_t v5 = &v31;
  if ((MGIsDeviceOneOfType() & 1) != 0 || MGGetBoolAnswer()) {
LABEL_4:
  }
    uint64_t v2 = objc_msgSend(&unk_26C610608, "containsObject:", v1, v4, v5, v6, v7, v8, v9, v10, v11, v12, v13, v14);
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t SFShouldShowYearOfManufacture()
{
  v0 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v1 = objc_msgSend(v0, "sf_regionCode");

  uint64_t v2 = +[SFDeviceRegulatoryAttributes currentDeviceAttributes];
  uint64_t v3 = [v2 yearOfManufacture];

  if ((MGIsDeviceOneOfType() & 1) != 0 || MGGetBoolAnswer())
  {
    unsigned int v4 = objc_msgSend(&unk_26C610620, "containsObject:", v1, 0);
    if (v3) {
      uint64_t v5 = v4;
    }
    else {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

uint64_t SFShouldShowCountryOfOrigin()
{
  uint64_t v0 = +[SFDeviceRegulatoryAttributes currentDeviceAttributes];
  uint64_t v1 = [(id)v0 countryOfOriginString];

  objc_opt_class();
  LOBYTE(v0) = objc_opt_isKindOfClass();

  return v0 & 1;
}

uint64_t SFShouldShowRoHSCompliance()
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v0 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v1 = objc_msgSend(v0, "sf_regionCode");

  int v11 = -350584140;
  long long v10 = xmmword_2154ED068;
  int v9 = -1418383976;
  long long v8 = xmmword_2154ED07C;
  int v7 = 368778837;
  long long v6 = xmmword_2154ED090;
  int v5 = -1213485500;
  long long v4 = xmmword_2154ED0A4;
  if ((MGIsDeviceOneOfType() & 1) != 0 || MGGetBoolAnswer()) {
    uint64_t v2 = objc_msgSend(&unk_26C610638, "containsObject:", v1, &v8, &v6, &v4, 0);
  }
  else {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t SFShouldShowBuiltInApps()
{
  uint64_t v0 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v1 = objc_msgSend(v0, "sf_regionCode");

  uint64_t v2 = [&unk_26C610650 containsObject:v1];
  return v2;
}

id SFLicenseFilePath()
{
  if (SFLicenseFilePath_onceToken != -1) {
    dispatch_once(&SFLicenseFilePath_onceToken, &__block_literal_global_0);
  }
  uint64_t v0 = (void *)SFLicenseFilePath___path;
  return v0;
}

uint64_t __SFLicenseFilePath_block_invoke()
{
  SFLicenseFilePath___path = _SFLicenseFilePathForBundleWithName(@"iOS");
  return MEMORY[0x270F9A758]();
}

__CFString *_SFLicenseFilePathForBundleWithName(void *a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v1 = a1;
  uint64_t v2 = [(__CFString *)v1 length];
  uint64_t v3 = SFLogForCategory(1uLL);
  long long v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      int v24 = "NSString *_SFLicenseFilePathForBundleWithName(NSString *__strong)";
      __int16 v25 = 2114;
      int v26 = v1;
      _os_log_impl(&dword_2154D9000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s: Resolving license file path for bundle name: '%{public}@'", buf, 0x16u);
    }

    int v5 = NSURL;
    long long v6 = SFRuntimeAbsoluteFilePathForPath(@"/System/Library/ProductDocuments/SoftwareLicenseAgreements");
    long long v4 = [v5 fileURLWithPath:v6];

    int v7 = [NSString stringWithFormat:@"%@.bundle", v1];
    long long v8 = [v4 URLByAppendingPathComponent:v7];

    int v9 = SFLogForCategory(1uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      long long v10 = [v8 path];
      *(_DWORD *)buf = 136446466;
      int v24 = "NSString *_SFLicenseFilePathForBundleWithName(NSString *__strong)";
      __int16 v25 = 2114;
      int v26 = v10;
      _os_log_impl(&dword_2154D9000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s: License bundle path URL: '%{public}@'", buf, 0x16u);
    }
    int v11 = [MEMORY[0x263F086E0] bundleWithURL:v8];
    uint64_t v12 = SFLogForCategory(1uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      int v24 = "NSString *_SFLicenseFilePathForBundleWithName(NSString *__strong)";
      __int16 v25 = 2114;
      int v26 = @"html";
      _os_log_impl(&dword_2154D9000, v12, OS_LOG_TYPE_DEFAULT, "%{public}s: Looking for license file with file extension: '%{public}@'", buf, 0x16u);
    }

    v13 = [v11 pathForResource:@"License" ofType:@"html"];
    uint64_t v14 = SFLogForCategory(1uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      int v24 = "NSString *_SFLicenseFilePathForBundleWithName(NSString *__strong)";
      __int16 v25 = 2114;
      int v26 = v13;
      _os_log_impl(&dword_2154D9000, v14, OS_LOG_TYPE_DEFAULT, "%{public}s: License file resolved to file at path: '%{public}@'", buf, 0x16u);
    }
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      _SFLicenseFilePathForBundleWithName_cold_1(v4, v15, v16, v17, v18, v19, v20, v21);
    }
    v13 = 0;
  }

  return v13;
}

id SFLicenseVersionNumber()
{
  if (SFLicenseVersionNumber_onceToken != -1) {
    dispatch_once(&SFLicenseVersionNumber_onceToken, &__block_literal_global_240);
  }
  uint64_t v0 = (void *)SFLicenseVersionNumber___licenseVersion;
  return v0;
}

uint64_t __SFLicenseVersionNumber_block_invoke()
{
  SFLicenseVersionNumber___licenseVersion = _SFLicenseVersionNumberForBundleWithName(@"iOS");
  return MEMORY[0x270F9A758]();
}

NSObject *_SFLicenseVersionNumberForBundleWithName(void *a1)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = [v1 length];
  uint64_t v3 = SFLogForCategory(1uLL);
  long long v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      long long v29 = "NSString *_SFLicenseVersionNumberForBundleWithName(NSString *__strong)";
      __int16 v30 = 2114;
      id v31 = v1;
      _os_log_impl(&dword_2154D9000, v4, OS_LOG_TYPE_DEFAULT, "%{public}s: Resolving license version number for bundle name: '%{public}@'", buf, 0x16u);
    }

    int v5 = NSURL;
    long long v6 = SFRuntimeAbsoluteFilePathForPath(@"/System/Library/ProductDocuments/SoftwareLicenseAgreements");
    int v7 = [v5 fileURLWithPath:v6];

    long long v8 = [NSString stringWithFormat:@"%@.bundle", v1];
    int v9 = [v7 URLByAppendingPathComponent:v8];

    long long v10 = [MEMORY[0x263F086E0] bundleWithURL:v9];
    uint64_t v11 = [v10 pathForResource:@"License_version" ofType:0];
    uint64_t v12 = (void *)_SFLicenseVersionNumberForBundleWithName_licenseVersionPath;
    _SFLicenseVersionNumberForBundleWithName_licenseVersionPath = v11;

    v13 = SFLogForCategory(1uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      _SFLicenseVersionNumberForBundleWithName_cold_4((uint64_t)v1, v13);
    }

    if (_SFLicenseVersionNumberForBundleWithName_licenseVersionPath)
    {
      id v27 = 0;
      uint64_t v14 = [NSString stringWithContentsOfFile:_SFLicenseVersionNumberForBundleWithName_licenseVersionPath encoding:4 error:&v27];
      uint64_t v15 = v27;
      if (v15)
      {
        uint64_t v16 = SFLogForCategory(1uLL);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          _SFLicenseVersionNumberForBundleWithName_cold_3((uint64_t)v15, v16);
        }
      }
    }
    else
    {
      uint64_t v15 = SFLogForCategory(1uLL);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        _SFLicenseVersionNumberForBundleWithName_cold_2(v9, v15);
      }
      uint64_t v14 = 0;
    }

    __int16 v25 = SFLogForCategory(1uLL);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      long long v29 = "NSString *_SFLicenseVersionNumberForBundleWithName(NSString *__strong)";
      __int16 v30 = 2114;
      id v31 = v1;
      __int16 v32 = 2114;
      long long v33 = v14;
      _os_log_impl(&dword_2154D9000, v25, OS_LOG_TYPE_DEFAULT, "%{public}s: License version for '%{public}@' resolved to: '%{public}@' .", buf, 0x20u);
    }

    long long v4 = v14;
    int v24 = v4;
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      _SFLicenseVersionNumberForBundleWithName_cold_1(v4, v17, v18, v19, v20, v21, v22, v23);
    }
    int v24 = 0;
  }

  return v24;
}

id SFAudioAccessoryLicenseFilePath()
{
  if (SFAudioAccessoryLicenseFilePath_onceToken != -1) {
    dispatch_once(&SFAudioAccessoryLicenseFilePath_onceToken, &__block_literal_global_242);
  }
  uint64_t v0 = (void *)SFAudioAccessoryLicenseFilePath___path;
  return v0;
}

uint64_t __SFAudioAccessoryLicenseFilePath_block_invoke()
{
  SFAudioAccessoryLicenseFilePath___path = _SFLicenseFilePathForBundleWithName(@"AudioAccessory");
  return MEMORY[0x270F9A758]();
}

id SFAudioAccessoryLicenseVersionNumber()
{
  if (SFAudioAccessoryLicenseVersionNumber_onceToken != -1) {
    dispatch_once(&SFAudioAccessoryLicenseVersionNumber_onceToken, &__block_literal_global_247);
  }
  uint64_t v0 = (void *)SFAudioAccessoryLicenseVersionNumber___licenseVersion;
  return v0;
}

uint64_t __SFAudioAccessoryLicenseVersionNumber_block_invoke()
{
  SFAudioAccessoryLicenseVersionNumber___licenseVersion = _SFLicenseVersionNumberForBundleWithName(@"AudioAccessory");
  return MEMORY[0x270F9A758]();
}

id SFWarrantyFilePath()
{
  if (SFWarrantyFilePath_onceToken != -1) {
    dispatch_once(&SFWarrantyFilePath_onceToken, &__block_literal_global_249);
  }
  uint64_t v0 = (void *)SFWarrantyFilePath___path;
  return v0;
}

void __SFWarrantyFilePath_block_invoke()
{
  id v6 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v0 = [v6 objectForKey:*MEMORY[0x263EFF4D0]];
  id v1 = [v0 uppercaseString];

  uint64_t v2 = [v6 objectForKey:*MEMORY[0x263EFF508]];
  uint64_t v3 = [v2 lowercaseString];

  uint64_t v4 = _SFWarrantyFilePathForBundleWithName(@"iPhone", v1, v3);
  int v5 = (void *)SFWarrantyFilePath___path;
  SFWarrantyFilePath___path = v4;
}

id _SFWarrantyFilePathForBundleWithName(void *a1, void *a2, void *a3)
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  id v5 = a1;
  id v6 = a2;
  id v7 = a3;
  uint64_t v8 = [v5 length];
  int v9 = SFLogForCategory(1uLL);
  long long v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      int v75 = "NSString *_SFWarrantyFilePathForBundleWithName(NSString *__strong, NSString *__strong, NSString *__strong)";
      __int16 v76 = 2114;
      id v77 = v5;
      _os_log_impl(&dword_2154D9000, v10, OS_LOG_TYPE_DEFAULT, "%{public}s: Resolving warranty file path for bundle name: '%{public}@'", buf, 0x16u);
    }

    uint64_t v11 = NSURL;
    uint64_t v12 = SFRuntimeAbsoluteFilePathForPath(@"/System/Library/ProductDocuments/Warranties");
    long long v10 = [v11 fileURLWithPath:v12];

    v13 = [NSString stringWithFormat:@"%@.bundle", v5];
    uint64_t v14 = [v10 URLByAppendingPathComponent:v13];

    uint64_t v15 = SFLogForCategory(1uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [v14 path];
      *(_DWORD *)buf = 136446466;
      int v75 = "NSString *_SFWarrantyFilePathForBundleWithName(NSString *__strong, NSString *__strong, NSString *__strong)";
      __int16 v76 = 2114;
      id v77 = v16;
      _os_log_impl(&dword_2154D9000, v15, OS_LOG_TYPE_DEFAULT, "%{public}s: Warranty bundle path URL: '%{public}@'", buf, 0x16u);
    }
    uint64_t v17 = [MEMORY[0x263F086E0] bundleWithURL:v14];
    uint64_t v18 = SFLogForCategory(1uLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      int v75 = "NSString *_SFWarrantyFilePathForBundleWithName(NSString *__strong, NSString *__strong, NSString *__strong)";
      __int16 v76 = 2114;
      id v77 = v6;
      __int16 v78 = 2114;
      id v79 = v7;
      _os_log_impl(&dword_2154D9000, v18, OS_LOG_TYPE_DEFAULT, "%{public}s: Current countryCode '%{public}@', languageCode '%{public}@'.", buf, 0x20u);
    }

    long long v64 = [v17 URLForResource:@"Warranties" withExtension:@"plist"];
    int v63 = objc_msgSend(NSDictionary, "dictionaryWithContentsOfURL:");
    uint64_t v19 = [v63 objectForKeyedSubscript:v6];
    uint64_t v20 = [v19 objectForKeyedSubscript:v7];
    if ([v20 length])
    {
      uint64_t v21 = [v17 pathForResource:v20 ofType:0];
      uint64_t v22 = SFLogForCategory(1uLL);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        int v75 = "NSString *_SFWarrantyFilePathForBundleWithName(NSString *__strong, NSString *__strong, NSString *__strong)";
        __int16 v76 = 2114;
        id v77 = v21;
        _os_log_impl(&dword_2154D9000, v22, OS_LOG_TYPE_DEFAULT, "%{public}s: Warranty file resolved (using currentLocale) to file at path: '%{public}@'", buf, 0x16u);
      }
    }
    else
    {
      __int16 v30 = SFLogForCategory(1uLL);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446722;
        int v75 = "NSString *_SFWarrantyFilePathForBundleWithName(NSString *__strong, NSString *__strong, NSString *__strong)";
        __int16 v76 = 2114;
        id v77 = v6;
        __int16 v78 = 2114;
        id v79 = v7;
        _os_log_impl(&dword_2154D9000, v30, OS_LOG_TYPE_DEFAULT, "%{public}s: No warranty file found for '%{public}@-%{public}@' locale in lookup file.", buf, 0x20u);
      }
      long long v62 = v17;
      long long v58 = v14;
      id v59 = v7;
      id v60 = v5;

      [MEMORY[0x263F50758] preferredLanguagesForRegion:v6];
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v72 = 0u;
      uint64_t v22 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v31 = [v22 countByEnumeratingWithState:&v69 objects:v82 count:16];
      id v61 = v6;
      if (v31)
      {
        uint64_t v32 = v31;
        uint64_t v33 = *(void *)v70;
        while (2)
        {
          uint64_t v34 = 0;
          long long v35 = v20;
          do
          {
            if (*(void *)v70 != v33) {
              objc_enumerationMutation(v22);
            }
            int v36 = *(void **)(*((void *)&v69 + 1) + 8 * v34);
            long long v37 = [v36 lowercaseString];
            uint64_t v20 = [v19 objectForKeyedSubscript:v37];

            if ([v20 length])
            {
              uint64_t v21 = [v62 pathForResource:v20 ofType:0];
              v42 = SFLogForCategory(1uLL);
              id v6 = v61;
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136446978;
                int v75 = "NSString *_SFWarrantyFilePathForBundleWithName(NSString *__strong, NSString *__strong, NSString *__strong)";
                __int16 v76 = 2114;
                id v77 = v61;
                __int16 v78 = 2114;
                id v79 = v36;
                __int16 v80 = 2114;
                int v81 = v21;
                _os_log_impl(&dword_2154D9000, v42, OS_LOG_TYPE_DEFAULT, "%{public}s: Warranty file resolved (using countryCode '%{public}@' and fallback languageCode '%{public}@') to file at path: '%{public}@'", buf, 0x2Au);
              }

              uint64_t v41 = v22;
              goto LABEL_33;
            }
            ++v34;
            long long v35 = v20;
          }
          while (v32 != v34);
          uint64_t v32 = [v22 countByEnumeratingWithState:&v69 objects:v82 count:16];
          id v6 = v61;
          if (v32) {
            continue;
          }
          break;
        }
      }

      int v38 = SFLogForCategory(1uLL);
      uint64_t v17 = v62;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        int v75 = "NSString *_SFWarrantyFilePathForBundleWithName(NSString *__strong, NSString *__strong, NSString *__strong)";
        __int16 v76 = 2114;
        id v77 = v6;
        _os_log_impl(&dword_2154D9000, v38, OS_LOG_TYPE_DEFAULT, "%{public}s: No warranty file found in lookup file for preferred languages of '%{public}@' countryCode.", buf, 0x16u);
      }

      long long v39 = [v19 objectForKeyedSubscript:@"en"];

      if (v39)
      {
        uint64_t v40 = [v19 objectForKeyedSubscript:@"en"];

        uint64_t v21 = [v62 pathForResource:v40 ofType:0];
        uint64_t v41 = SFLogForCategory(1uLL);
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446722;
          int v75 = "NSString *_SFWarrantyFilePathForBundleWithName(NSString *__strong, NSString *__strong, NSString *__strong)";
          __int16 v76 = 2114;
          id v77 = v6;
          __int16 v78 = 2114;
          id v79 = v21;
          _os_log_impl(&dword_2154D9000, v41, OS_LOG_TYPE_DEFAULT, "%{public}s: Warranty file resolved (using English fallback with countryCode '%{public}@') to file at path: '%{public}@'", buf, 0x20u);
        }
        uint64_t v20 = (void *)v40;
      }
      else
      {
        v44 = SFLogForCategory(1uLL);
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          int v75 = "NSString *_SFWarrantyFilePathForBundleWithName(NSString *__strong, NSString *__strong, NSString *__strong)";
          __int16 v76 = 2114;
          id v77 = v6;
          _os_log_impl(&dword_2154D9000, v44, OS_LOG_TYPE_DEFAULT, "%{public}s: No warranty file found in lookup file for English language of '%{public}@' countryCode.", buf, 0x16u);
        }

        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        uint64_t v41 = [v19 allKeys];
        uint64_t v45 = [v41 countByEnumeratingWithState:&v65 objects:v73 count:16];
        if (v45)
        {
          uint64_t v46 = v45;
          uint64_t v47 = *(void *)v66;
          while (2)
          {
            uint64_t v48 = 0;
            v49 = v20;
            do
            {
              if (*(void *)v66 != v47) {
                objc_enumerationMutation(v41);
              }
              v50 = *(void **)(*((void *)&v65 + 1) + 8 * v48);
              uint64_t v20 = [v19 objectForKeyedSubscript:v50];

              if ([v20 length])
              {
                uint64_t v21 = [v62 pathForResource:v20 ofType:0];
                int v55 = SFLogForCategory(1uLL);
                id v6 = v61;
                if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136446978;
                  int v75 = "NSString *_SFWarrantyFilePathForBundleWithName(NSString *__strong, NSString *__strong, NSString *__strong)";
                  __int16 v76 = 2114;
                  id v77 = v61;
                  __int16 v78 = 2114;
                  id v79 = v50;
                  __int16 v80 = 2114;
                  int v81 = v21;
                  _os_log_impl(&dword_2154D9000, v55, OS_LOG_TYPE_DEFAULT, "%{public}s: Warranty file resolved (using countryCode '%{public}@' and mapping file languageCode '%{public}@') to file at path: '%{public}@'", buf, 0x2Au);
                }
                goto LABEL_56;
              }
              ++v48;
              v49 = v20;
            }
            while (v46 != v48);
            uint64_t v46 = [v41 countByEnumeratingWithState:&v65 objects:v73 count:16];
            if (v46) {
              continue;
            }
            break;
          }
        }

        uint64_t v51 = SFLogForCategory(1uLL);
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446210;
          int v75 = "NSString *_SFWarrantyFilePathForBundleWithName(NSString *__strong, NSString *__strong, NSString *__strong)";
          _os_log_impl(&dword_2154D9000, v51, OS_LOG_TYPE_DEFAULT, "%{public}s: No warranty file found, falling back to default.", buf, 0xCu);
        }

        long long v52 = NSURL;
        int v53 = SFRuntimeAbsoluteFilePathForPath(@"/System/Library/ProductDocuments/Notices");
        uint64_t v41 = [v52 fileURLWithPath:v53];

        long long v54 = [NSString stringWithFormat:@"%@.bundle", @"Warranty"];
        int v55 = [v41 URLByAppendingPathComponent:v54];

        long long v56 = [MEMORY[0x263F086E0] bundleWithURL:v55];
        uint64_t v21 = [v56 pathForResource:@"Warranty" ofType:@"html"];
        int v57 = SFLogForCategory(1uLL);
        id v6 = v61;
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          int v75 = "NSString *_SFWarrantyFilePathForBundleWithName(NSString *__strong, NSString *__strong, NSString *__strong)";
          __int16 v76 = 2114;
          id v77 = v21;
          _os_log_impl(&dword_2154D9000, v57, OS_LOG_TYPE_DEFAULT, "%{public}s: Warranty file resolved to default file at path: '%{public}@'", buf, 0x16u);
        }

LABEL_56:
LABEL_33:
        uint64_t v17 = v62;
      }

      id v7 = v59;
      id v5 = v60;
      uint64_t v14 = v58;
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      _SFWarrantyFilePathForBundleWithName_cold_1(v10, v23, v24, v25, v26, v27, v28, v29);
    }
    uint64_t v21 = 0;
  }

  return v21;
}

id SFAudioAccessoryWarrantyFilePath()
{
  if (SFAudioAccessoryWarrantyFilePath_onceToken != -1) {
    dispatch_once(&SFAudioAccessoryWarrantyFilePath_onceToken, &__block_literal_global_255);
  }
  uint64_t v0 = (void *)SFAudioAccessoryWarrantyFilePath___path;
  return v0;
}

void __SFAudioAccessoryWarrantyFilePath_block_invoke()
{
  id v6 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v0 = [v6 objectForKey:*MEMORY[0x263EFF4D0]];
  id v1 = [v0 uppercaseString];

  uint64_t v2 = [v6 objectForKey:*MEMORY[0x263EFF508]];
  uint64_t v3 = [v2 lowercaseString];

  uint64_t v4 = _SFWarrantyFilePathForBundleWithName(@"HomePod", v1, v3);
  id v5 = (void *)SFAudioAccessoryWarrantyFilePath___path;
  SFAudioAccessoryWarrantyFilePath___path = v4;
}

id SFBuiltInRegulatoryImageForModelAndVariant(void *a1, void *a2)
{
  v112[2] = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  id v5 = [MEMORY[0x263F1C920] mainScreen];
  [v5 scale];
  double v7 = v6;

  uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"_%uonly_", v7);
  int v9 = SFLogForCategory(1uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    SFBuiltInRegulatoryImageForModelAndVariant_cold_4();
  }

  if (([v3 isEqualToString:@"B482"] & 1) != 0
    || [v3 isEqualToString:@"B532"])
  {
    long long v10 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v11 = objc_msgSend(v10, "sf_screenClassString");
    uint64_t v12 = [v11 substringToIndex:9];

    v13 = SFLogForCategory(1uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      SFBuiltInRegulatoryImageForModelAndVariant_cold_3();
    }

    uint64_t v14 = [@"RegulatoryInfo-" stringByAppendingFormat:@"%@_%@_LT_@2x", v3, v12];
    uint64_t v15 = (void *)MEMORY[0x263F1C6B0];
    uint64_t v16 = SFRuntimeAbsoluteFilePathForPath(@"/System/Library/ProductDocuments/RegulatoryImages");
    uint64_t v17 = [v16 stringByAppendingPathComponent:v14];
    id v18 = [v15 imageWithContentsOfFile:v17];

    if (v18)
    {
      id v101 = v3;
      uint64_t v19 = [@"RegulatoryInfo-" stringByAppendingFormat:@"%@_%@_DK_@2x", v3, v12];
      uint64_t v20 = (void *)MEMORY[0x263F1C6B0];
      uint64_t v21 = SFRuntimeAbsoluteFilePathForPath(@"/System/Library/ProductDocuments/RegulatoryImages");
      uint64_t v22 = [v21 stringByAppendingPathComponent:v19];
      uint64_t v23 = [v20 imageWithContentsOfFile:v22];

      if (v23)
      {
        int v99 = (void *)v19;
        id v100 = v4;
        long long v102 = v8;
        int v97 = [MEMORY[0x263F1CB00] currentTraitCollection];
        uint64_t v24 = [MEMORY[0x263F1CB00] traitCollectionWithDisplayScale:v7];
        id v25 = objc_alloc_init(MEMORY[0x263F1C6B8]);
        uint64_t v26 = (void *)MEMORY[0x263F1CB00];
        v112[0] = v24;
        uint64_t v27 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:1];
        v112[1] = v27;
        uint64_t v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v112 count:2];
        uint64_t v29 = [v26 traitCollectionWithTraitsFromCollections:v28];
        [v25 registerImage:v18 withTraitCollection:v29];

        __int16 v30 = (void *)MEMORY[0x263F1CB00];
        v111[0] = v24;
        uint64_t v31 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:2];
        v111[1] = v31;
        uint64_t v32 = [MEMORY[0x263EFF8C0] arrayWithObjects:v111 count:2];
        uint64_t v33 = [v30 traitCollectionWithTraitsFromCollections:v32];
        [v25 registerImage:v23 withTraitCollection:v33];

        uint64_t v34 = [v25 imageWithTraitCollection:v97];
        long long v35 = (void *)SFBuiltInRegulatoryImageForModelAndVariant_styleSensitiveImage;
        SFBuiltInRegulatoryImageForModelAndVariant_styleSensitiveImage = v34;

        int v36 = SFLogForCategory(1uLL);
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          long long v108 = "UIImage * _Nonnull SFBuiltInRegulatoryImageForModelAndVariant(NSString *__strong _Nonnull, NSString *__"
                 "strong _Nonnull)";
          __int16 v109 = 2112;
          uint64_t v110 = (uint64_t)v14;
          _os_log_impl(&dword_2154D9000, v36, OS_LOG_TYPE_DEFAULT, "%{Public}s: Resolved to style-sensitive Regulatory Image with base name '%{Public}@'.", buf, 0x16u);
        }

        id v37 = (id)SFBuiltInRegulatoryImageForModelAndVariant_styleSensitiveImage;
LABEL_22:

LABEL_33:
        id v4 = v100;
        id v3 = v101;
        uint64_t v8 = v102;
        int v38 = v99;
        goto LABEL_43;
      }
      int v38 = (void *)v19;
      id v3 = v101;
    }
    else
    {
      int v38 = 0;
    }

    if (!v4)
    {
      if (v18) {
        goto LABEL_39;
      }
      goto LABEL_26;
    }
    goto LABEL_17;
  }
  id v18 = 0;
  uint64_t v14 = 0;
  int v38 = 0;
  if (v4)
  {
LABEL_17:
    long long v39 = v8;
    uint64_t v40 = v14;
    uint64_t v14 = [@"RegulatoryInfo-" stringByAppendingFormat:@"%@-%@%@", v3, v4, v39];

    uint64_t v41 = (void *)MEMORY[0x263F1C6B0];
    v42 = SFRuntimeAbsoluteFilePathForPath(@"/System/Library/ProductDocuments/RegulatoryImages");
    v43 = [v42 stringByAppendingPathComponent:v14];
    uint64_t v44 = [v41 imageWithContentsOfFile:v43];

    long long v98 = (void *)v44;
    if (v44)
    {
      long long v102 = v39;
      uint64_t v45 = [@"RegulatoryInfo-" stringByAppendingFormat:@"%@-%@_dark%@", v3, v4, v39];

      uint64_t v46 = (void *)MEMORY[0x263F1C6B0];
      uint64_t v47 = SFRuntimeAbsoluteFilePathForPath(@"/System/Library/ProductDocuments/RegulatoryImages");
      uint64_t v48 = [v47 stringByAppendingPathComponent:v45];
      uint64_t v23 = [v46 imageWithContentsOfFile:v48];

      if (v23)
      {
        int v99 = (void *)v45;
        id v100 = v4;
        id v101 = v3;
        v49 = [MEMORY[0x263F1CB00] currentTraitCollection];
        v50 = [MEMORY[0x263F1CB00] traitCollectionWithDisplayScale:v7];
        id v51 = objc_alloc_init(MEMORY[0x263F1C6B8]);
        long long v52 = (void *)MEMORY[0x263F1CB00];
        v106[0] = v50;
        int v53 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:1];
        v106[1] = v53;
        long long v54 = [MEMORY[0x263EFF8C0] arrayWithObjects:v106 count:2];
        int v55 = [v52 traitCollectionWithTraitsFromCollections:v54];
        id v18 = v98;
        [v51 registerImage:v98 withTraitCollection:v55];

        long long v56 = (void *)MEMORY[0x263F1CB00];
        v105[0] = v50;
        int v57 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:2];
        v105[1] = v57;
        long long v58 = [MEMORY[0x263EFF8C0] arrayWithObjects:v105 count:2];
        id v59 = [v56 traitCollectionWithTraitsFromCollections:v58];
        [v51 registerImage:v23 withTraitCollection:v59];

        uint64_t v60 = [v51 imageWithTraitCollection:v49];
        id v61 = (void *)SFBuiltInRegulatoryImageForModelAndVariant_styleSensitiveImage_291;
        SFBuiltInRegulatoryImageForModelAndVariant_styleSensitiveImage_291 = v60;

        long long v62 = SFLogForCategory(1uLL);
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          long long v108 = "UIImage * _Nonnull SFBuiltInRegulatoryImageForModelAndVariant(NSString *__strong _Nonnull, NSString *__"
                 "strong _Nonnull)";
          __int16 v109 = 2112;
          uint64_t v110 = (uint64_t)v14;
          _os_log_impl(&dword_2154D9000, v62, OS_LOG_TYPE_DEFAULT, "%{Public}s: Resolved to style-sensitive Regulatory Image with base name '%{Public}@'.", buf, 0x16u);
        }

        id v37 = (id)SFBuiltInRegulatoryImageForModelAndVariant_styleSensitiveImage_291;
        goto LABEL_22;
      }
      int v38 = (void *)v45;
      uint64_t v8 = v102;
      id v18 = v98;
      goto LABEL_39;
    }
    uint64_t v8 = v39;
  }
LABEL_26:
  int v63 = SFLogForCategory(1uLL);
  if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG)) {
    SFBuiltInRegulatoryImageForModelAndVariant_cold_2();
  }

  uint64_t v64 = [@"RegulatoryInfo-" stringByAppendingFormat:@"%@%@", v3, v8];

  long long v65 = v8;
  long long v66 = (void *)MEMORY[0x263F1C6B0];
  long long v67 = SFRuntimeAbsoluteFilePathForPath(@"/System/Library/ProductDocuments/RegulatoryImages");
  long long v68 = [v67 stringByAppendingPathComponent:v64];
  id v18 = [v66 imageWithContentsOfFile:v68];

  if (!v18)
  {
    long long v88 = SFLogForCategory(1uLL);
    if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR)) {
      SFBuiltInRegulatoryImageForModelAndVariant_cold_1(v88, v89, v90, v91, v92, v93, v94, v95);
    }
    id v18 = 0;
    uint64_t v8 = v65;
    goto LABEL_42;
  }
  long long v102 = v65;
  uint64_t v69 = [@"RegulatoryInfo-" stringByAppendingFormat:@"%@_dark%@", v3, v65];

  long long v70 = (void *)MEMORY[0x263F1C6B0];
  long long v71 = SFRuntimeAbsoluteFilePathForPath(@"/System/Library/ProductDocuments/RegulatoryImages");
  long long v72 = [v71 stringByAppendingPathComponent:v69];
  int v73 = [v70 imageWithContentsOfFile:v72];

  if (v73)
  {
    int v99 = (void *)v69;
    id v100 = v4;
    id v101 = v3;
    long long v74 = [MEMORY[0x263F1CB00] currentTraitCollection];
    int v75 = [MEMORY[0x263F1CB00] traitCollectionWithDisplayScale:v7];
    id v76 = objc_alloc_init(MEMORY[0x263F1C6B8]);
    id v77 = (void *)MEMORY[0x263F1CB00];
    v104[0] = v75;
    __int16 v78 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:1];
    v104[1] = v78;
    id v79 = [MEMORY[0x263EFF8C0] arrayWithObjects:v104 count:2];
    __int16 v80 = [v77 traitCollectionWithTraitsFromCollections:v79];
    [v76 registerImage:v18 withTraitCollection:v80];

    int v81 = (void *)MEMORY[0x263F1CB00];
    v103[0] = v75;
    long long v82 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:2];
    v103[1] = v82;
    uint64_t v83 = [MEMORY[0x263EFF8C0] arrayWithObjects:v103 count:2];
    long long v84 = [v81 traitCollectionWithTraitsFromCollections:v83];
    [v76 registerImage:v73 withTraitCollection:v84];

    uint64_t v85 = [v76 imageWithTraitCollection:v74];
    long long v86 = (void *)SFBuiltInRegulatoryImageForModelAndVariant_styleSensitiveImage_298;
    SFBuiltInRegulatoryImageForModelAndVariant_styleSensitiveImage_298 = v85;

    int v87 = SFLogForCategory(1uLL);
    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      long long v108 = "UIImage * _Nonnull SFBuiltInRegulatoryImageForModelAndVariant(NSString *__strong _Nonnull, NSString *__strong _Nonnull)";
      __int16 v109 = 2112;
      uint64_t v110 = v64;
      _os_log_impl(&dword_2154D9000, v87, OS_LOG_TYPE_DEFAULT, "%{Public}s: Resolved to style-sensitive Regulatory Image with base name '%{Public}@'.", buf, 0x16u);
    }

    id v37 = (id)SFBuiltInRegulatoryImageForModelAndVariant_styleSensitiveImage_298;
    uint64_t v14 = (void *)v64;
    goto LABEL_33;
  }
  int v38 = (void *)v69;
  uint64_t v14 = (void *)v64;
  uint64_t v8 = v102;
LABEL_39:
  long long v88 = SFLogForCategory(1uLL);
  if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    long long v108 = "UIImage * _Nonnull SFBuiltInRegulatoryImageForModelAndVariant(NSString *__strong _Nonnull, NSString *__strong _Nonnull)";
    __int16 v109 = 2112;
    uint64_t v110 = (uint64_t)v14;
    _os_log_impl(&dword_2154D9000, v88, OS_LOG_TYPE_DEFAULT, "%{Public}s: Resolved to Regulatory Image with name '%{Public}@'.", buf, 0x16u);
  }
  uint64_t v64 = (uint64_t)v14;
LABEL_42:

  id v18 = v18;
  uint64_t v14 = (void *)v64;
  id v37 = v18;
LABEL_43:

  return v37;
}

id SFBuiltInRegulatoryImageForApplePencilModel(void *a1)
{
  v50[2] = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x263F1C920] mainScreen];
  [v2 scale];
  double v4 = v3;

  id v5 = objc_msgSend(NSString, "stringWithFormat:", @"%d", MGGetSInt32Answer());
  double v6 = objc_msgSend(NSString, "stringWithFormat:", @"%d", MGGetSInt32Answer());
  double v7 = [NSString stringWithFormat:@"%@x%@", v5, v6];
  uint64_t v8 = [@"RegulatoryInfo-" stringByAppendingFormat:@"%@-%@", v1, v7];
  int v9 = (void *)MEMORY[0x263F1C6B0];
  long long v10 = SFRuntimeAbsoluteFilePathForPath(@"/System/Library/ProductDocuments/RegulatoryImages");
  uint64_t v11 = [v10 stringByAppendingPathComponent:v8];
  uint64_t v12 = [v9 imageWithContentsOfFile:v11];

  if (!v12)
  {
    uint64_t v32 = SFLogForCategory(1uLL);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      SFBuiltInRegulatoryImageForApplePencilModel_cold_1(v32, v33, v34, v35, v36, v37, v38, v39);
    }
    v13 = 0;
    goto LABEL_12;
  }
  v43 = v5;
  uint64_t v44 = v8;
  v13 = [@"RegulatoryInfo-" stringByAppendingFormat:@"%@-%@_dark", v1, v7];
  uint64_t v14 = (void *)MEMORY[0x263F1C6B0];
  uint64_t v15 = SFRuntimeAbsoluteFilePathForPath(@"/System/Library/ProductDocuments/RegulatoryImages");
  uint64_t v16 = [v15 stringByAppendingPathComponent:v13];
  uint64_t v17 = [v14 imageWithContentsOfFile:v16];

  if (!v17)
  {
    uint64_t v32 = SFLogForCategory(1uLL);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v46 = "UIImage * _Nonnull SFBuiltInRegulatoryImageForApplePencilModel(NSString *__strong _Nonnull)";
      __int16 v47 = 2112;
      uint64_t v8 = v44;
      uint64_t v48 = v44;
      _os_log_impl(&dword_2154D9000, v32, OS_LOG_TYPE_DEFAULT, "%{Public}s: Resolved to Regulatory Image with name '%{Public}@'.", buf, 0x16u);
      id v5 = v43;
    }
    else
    {
      id v5 = v43;
      uint64_t v8 = v44;
    }
LABEL_12:

    id v31 = v12;
    goto LABEL_13;
  }
  v42 = v6;
  uint64_t v41 = [MEMORY[0x263F1CB00] currentTraitCollection];
  id v18 = [MEMORY[0x263F1CB00] traitCollectionWithDisplayScale:v4];
  id v19 = objc_alloc_init(MEMORY[0x263F1C6B8]);
  uint64_t v20 = (void *)MEMORY[0x263F1CB00];
  v50[0] = v18;
  uint64_t v21 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:1];
  v50[1] = v21;
  uint64_t v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:2];
  uint64_t v23 = [v20 traitCollectionWithTraitsFromCollections:v22];
  [v19 registerImage:v12 withTraitCollection:v23];

  uint64_t v24 = (void *)MEMORY[0x263F1CB00];
  v49[0] = v18;
  id v25 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:2];
  v49[1] = v25;
  uint64_t v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:2];
  uint64_t v27 = [v24 traitCollectionWithTraitsFromCollections:v26];
  [v19 registerImage:v17 withTraitCollection:v27];

  uint64_t v28 = [v19 imageWithTraitCollection:v41];
  uint64_t v29 = (void *)SFBuiltInRegulatoryImageForApplePencilModel_styleSensitiveImage;
  SFBuiltInRegulatoryImageForApplePencilModel_styleSensitiveImage = v28;

  __int16 v30 = SFLogForCategory(1uLL);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v46 = "UIImage * _Nonnull SFBuiltInRegulatoryImageForApplePencilModel(NSString *__strong _Nonnull)";
    __int16 v47 = 2112;
    uint64_t v48 = v44;
    _os_log_impl(&dword_2154D9000, v30, OS_LOG_TYPE_DEFAULT, "%{Public}s: Resolved to style-sensitive Regulatory Image with base name '%{Public}@'.", buf, 0x16u);
  }

  id v31 = (id)SFBuiltInRegulatoryImageForApplePencilModel_styleSensitiveImage;
  id v5 = v43;
  double v6 = v42;
  uint64_t v8 = v44;
LABEL_13:

  return v31;
}

id SFRegulatoryImage()
{
  uint64_t v0 = +[SFDeviceRegulatoryAttributes currentDeviceAttributes];
  id v1 = [v0 regulatoryImage];

  return v1;
}

BOOL SFIsRegulatoryImageFromLockdown()
{
  uint64_t v115 = *MEMORY[0x263EF8340];
  uint64_t v100 = 1;
  uint64_t v0 = container_system_group_path_for_identifier();
  if (v0)
  {
    id v1 = (char *)v0;
    uint64_t v2 = [NSString stringWithUTF8String:v0];
    int v3 = chmod(v1, 0x1FFu);
    free(v1);
    if (v3 && *__error() != 1)
    {
      double v4 = SFLogForCategory(1uLL);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        SFIsRegulatoryImageFromLockdown_cold_9(v4);
      }
    }
    if (v2)
    {
      id v5 = [v2 stringByAppendingPathComponent:@"Library"];
      double v6 = [v5 stringByAppendingPathComponent:@"RegulatoryImages"];
      double v7 = [v6 stringByAppendingPathComponent:@"regulatory_images.plist"];

      uint64_t v8 = SFLogForCategory(1uLL);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        long long v112 = "UIImage *_SFGetRegulatoryImageFromLockdown(BOOL *)";
        __int16 v113 = 2112;
        long long v114 = v7;
        _os_log_impl(&dword_2154D9000, v8, OS_LOG_TYPE_DEFAULT, "%{Public}s: Lockdown Regulatory Images at '%@'", buf, 0x16u);
      }

      int v9 = [NSDictionary dictionaryWithContentsOfFile:v7];
      long long v10 = v9;
      if (v9)
      {
        uint64_t v11 = [v9 objectForKeyedSubscript:@"RegulatoryImages"];
        if (!v11)
        {
          uint64_t v12 = SFLogForCategory(1uLL);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
            SFIsRegulatoryImageFromLockdown_cold_3(v12, v56, v57, v58, v59, v60, v61, v62);
          }
          uint64_t v46 = 0;
          goto LABEL_78;
        }
        uint64_t v12 = MGCopyAnswer();
        v13 = (void *)MGCopyAnswer();
        uint64_t v94 = [v12 stringByAppendingFormat:@"-%@", v13];
        uint64_t v14 = [v12 length];
        uint64_t v15 = SFLogForCategory(1uLL);
        uint64_t v16 = v15;
        if (!v14)
        {
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            SFIsRegulatoryImageFromLockdown_cold_4(v16, v63, v64, v65, v66, v67, v68, v69);
          }
          goto LABEL_76;
        }
        uint64_t v91 = v10;
        uint64_t v92 = v13;
        uint64_t v89 = v7;
        uint64_t v90 = v2;
        uint64_t v17 = v94;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          long long v112 = "UIImage *_SFGetRegulatoryImageFromLockdown(BOOL *)";
          __int16 v113 = 2112;
          long long v114 = v94;
          _os_log_impl(&dword_2154D9000, v16, OS_LOG_TYPE_DEFAULT, "%{Public}s: Looking for Lockdown Regulatory Image '%@'", buf, 0x16u);
        }

        id v18 = [MEMORY[0x263F1C920] mainScreen];
        [v18 scale];
        double v20 = v19;

        long long v98 = 0u;
        long long v99 = 0u;
        long long v96 = 0u;
        long long v97 = 0u;
        uint64_t v93 = v11;
        obj = v11;
        uint64_t v21 = [obj countByEnumeratingWithState:&v96 objects:buf count:16];
        if (!v21)
        {
LABEL_43:

          uint64_t v2 = v90;
          long long v10 = v91;
          v13 = v92;
          uint64_t v11 = v93;
          goto LABEL_74;
        }
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v97;
LABEL_17:
        uint64_t v24 = 0;
        while (1)
        {
          if (*(void *)v97 != v23) {
            objc_enumerationMutation(obj);
          }
          id v25 = *(void **)(*((void *)&v96 + 1) + 8 * v24);
          uint64_t v26 = [v25 objectForKey:@"ImageId"];
          uint64_t v27 = SFLogForCategory(1uLL);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)int v107 = 136315394;
            long long v108 = "UIImage *_SFGetRegulatoryImageFromLockdown(BOOL *)";
            __int16 v109 = 2112;
            uint64_t v110 = v26;
            _os_log_impl(&dword_2154D9000, v27, OS_LOG_TYPE_DEFAULT, "%{Public}s: Candidate Lockdown Regulatory Image '%@'", v107, 0x16u);
          }

          if ([v12 caseInsensitiveCompare:v26]
            && [v17 caseInsensitiveCompare:v26])
          {
            goto LABEL_41;
          }
          CFDataRef v28 = [v25 objectForKey:@"ImageData"];
          uint64_t v29 = [v25 objectForKey:@"ImageDelta"];
          [v29 BOOLValue];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            __int16 v30 = CGImageSourceCreateWithData(v28, 0);
            if (v30)
            {
              id v31 = v30;
              size_t Count = CGImageSourceGetCount(v30);
              if (Count)
              {
                size_t v33 = Count;
                CGImageRef ImageAtIndex = CGImageSourceCreateImageAtIndex(v31, 0, 0);
                uint64_t v35 = ImageAtIndex;
                if (v33 == 2)
                {
                  CGImageRef v70 = CGImageSourceCreateImageAtIndex(v31, 1uLL, 0);
                  long long v71 = v70;
                  if (v35 && v70)
                  {
                    *(void *)int v87 = [objc_alloc(MEMORY[0x263F1C6B0]) initWithCGImage:v35 scale:0 orientation:v20];
                    long long v88 = (void *)[objc_alloc(MEMORY[0x263F1C6B0]) initWithCGImage:v71 scale:0 orientation:v20];
                    uint64_t v85 = [MEMORY[0x263F1CB00] currentTraitCollection];
                    [MEMORY[0x263F1CB00] traitCollectionWithDisplayScale:v20];
                    long long v72 = image = v71;
                    id v73 = objc_alloc_init(MEMORY[0x263F1C6B8]);
                    long long v74 = (void *)MEMORY[0x263F1CB00];
                    v106[0] = v72;
                    int v75 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:1];
                    v106[1] = v75;
                    id v76 = [MEMORY[0x263EFF8C0] arrayWithObjects:v106 count:2];
                    id v77 = [v74 traitCollectionWithTraitsFromCollections:v76];
                    [v73 registerImage:*(void *)v87 withTraitCollection:v77];

                    __int16 v78 = (void *)MEMORY[0x263F1CB00];
                    v105[0] = v72;
                    id v79 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:2];
                    v105[1] = v79;
                    __int16 v80 = [MEMORY[0x263EFF8C0] arrayWithObjects:v105 count:2];
                    int v81 = [v78 traitCollectionWithTraitsFromCollections:v80];
                    [v73 registerImage:v88 withTraitCollection:v81];

                    uint64_t v46 = [v73 imageWithTraitCollection:v85];
                    CGImageRelease(v35);
                    CGImageRelease(image);
                    CFRelease(v31);
                    long long v82 = SFLogForCategory(1uLL);
                    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)int v107 = 136315394;
                      long long v108 = "UIImage *_SFGetRegulatoryImageFromLockdown(BOOL *)";
                      __int16 v109 = 2112;
                      uint64_t v110 = v26;
                      _os_log_impl(&dword_2154D9000, v82, OS_LOG_TYPE_DEFAULT, "%{Public}s: Matched style-sensitive Lockdown Regulatory Image '%{Public}@'", v107, 0x16u);
                    }

                    double v7 = v89;
                    uint64_t v2 = v90;
                    long long v10 = v91;
                    uint64_t v83 = *(NSObject **)v87;
                  }
                  else
                  {
                    if (v35) {
                      CGImageRelease(v35);
                    }
                    long long v10 = v91;
                    if (v71) {
                      CGImageRelease(v71);
                    }
                    CFRelease(v31);
                    uint64_t v83 = SFLogForCategory(1uLL);
                    if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
                      SFIsRegulatoryImageFromLockdown_cold_7();
                    }
                    uint64_t v46 = 0;
                    double v7 = v89;
                    uint64_t v2 = v90;
                  }
LABEL_73:

                  v13 = v92;
                  uint64_t v11 = v93;
                  if (v46) {
                    goto LABEL_77;
                  }
LABEL_74:
                  uint64_t v16 = SFLogForCategory(1uLL);
                  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
                    SFIsRegulatoryImageFromLockdown_cold_5();
                  }
LABEL_76:

                  uint64_t v46 = 0;
LABEL_77:

LABEL_78:
LABEL_79:

                  goto LABEL_80;
                }
                uint64_t v17 = v94;
                if (ImageAtIndex)
                {
                  uint64_t v46 = (void *)[objc_alloc(MEMORY[0x263F1C6B0]) initWithCGImage:ImageAtIndex scale:0 orientation:v20];
                  CGImageRelease(v35);
                  CFRelease(v31);
                  uint64_t v83 = SFLogForCategory(1uLL);
                  if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)int v107 = 136315394;
                    long long v108 = "UIImage *_SFGetRegulatoryImageFromLockdown(BOOL *)";
                    __int16 v109 = 2112;
                    uint64_t v110 = v26;
                    _os_log_impl(&dword_2154D9000, v83, OS_LOG_TYPE_DEFAULT, "%{Public}s: Matched Lockdown Regulatory Image '%@'", v107, 0x16u);
                  }
                  uint64_t v2 = v90;
                  long long v10 = v91;
                  goto LABEL_73;
                }
                uint64_t v36 = SFLogForCategory(1uLL);
                if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)int v107 = 136315394;
                  long long v108 = "UIImage *_SFGetRegulatoryImageFromLockdown(BOOL *)";
                  __int16 v109 = 2112;
                  uint64_t v110 = v26;
                  _os_log_error_impl(&dword_2154D9000, v36, OS_LOG_TYPE_ERROR, "%{Public}s: Failed decoding Lockdown Regulatory Image '%{Public}@'", v107, 0x16u);
                }
              }
              else
              {
                uint64_t v36 = SFLogForCategory(1uLL);
                if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)int v107 = 136315394;
                  long long v108 = "UIImage *_SFGetRegulatoryImageFromLockdown(BOOL *)";
                  __int16 v109 = 2112;
                  uint64_t v110 = v26;
                  _os_log_error_impl(&dword_2154D9000, v36, OS_LOG_TYPE_ERROR, "%{Public}s: Empty Lockdown Regulatory Image '%{Public}@'", v107, 0x16u);
                }
                uint64_t v17 = v94;
              }

              CFRelease(v31);
              goto LABEL_40;
            }
            uint64_t v37 = SFLogForCategory(1uLL);
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
              SFIsRegulatoryImageFromLockdown_cold_6(v103, &v104, v37);
            }
          }
          else
          {
            uint64_t v37 = SFLogForCategory(1uLL);
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
              SFIsRegulatoryImageFromLockdown_cold_8(v101, &v102, v37);
            }
          }

LABEL_40:
LABEL_41:

          if (v22 == ++v24)
          {
            uint64_t v22 = [obj countByEnumeratingWithState:&v96 objects:buf count:16];
            if (v22) {
              goto LABEL_17;
            }
            goto LABEL_43;
          }
        }
      }
      __int16 v47 = [MEMORY[0x263F08850] defaultManager];
      int v48 = [v47 fileExistsAtPath:v7];

      if (v48)
      {
        uint64_t v11 = SFLogForCategory(1uLL);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          SFIsRegulatoryImageFromLockdown_cold_2(v11, v49, v50, v51, v52, v53, v54, v55);
        }
        uint64_t v46 = 0;
        goto LABEL_79;
      }
      uint64_t v46 = 0;
LABEL_80:
    }
    else
    {
      uint64_t v46 = 0;
    }
    uint64_t v38 = v46;

    uint64_t v45 = v38;
  }
  else
  {
    uint64_t v38 = SFLogForCategory(1uLL);
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
      SFIsRegulatoryImageFromLockdown_cold_1((uint64_t)&v100, v38, v39, v40, v41, v42, v43, v44);
    }
    uint64_t v45 = 0;
  }

  return v45 != 0;
}

id SFIndiaBISNumber()
{
  uint64_t v0 = +[SFDeviceRegulatoryAttributes currentDeviceAttributes];
  id v1 = [v0 indiaBISRegulatoryNumber];

  return v1;
}

id SFIndiaBISRegulatoryImage()
{
  uint64_t v0 = (void *)MEMORY[0x263F1C6B0];
  id v1 = SFRuntimeAbsoluteFilePathForPath(@"/System/Library/ProductDocuments/RegulatoryImages");
  uint64_t v2 = [v1 stringByAppendingPathComponent:@"IndiaBISMarking"];
  int v3 = [v0 imageWithContentsOfFile:v2];

  return v3;
}

id SFCountryOfOrigin()
{
  uint64_t v0 = +[SFDeviceRegulatoryAttributes currentDeviceAttributes];
  id v1 = [v0 countryOfOriginString];

  return v1;
}

id SFAcknowledgementsDocumentFilePath()
{
  if (SFAcknowledgementsDocumentFilePath_onceToken != -1) {
    dispatch_once(&SFAcknowledgementsDocumentFilePath_onceToken, &__block_literal_global_321);
  }
  uint64_t v0 = (void *)SFAcknowledgementsDocumentFilePath___path;
  return v0;
}

void __SFAcknowledgementsDocumentFilePath_block_invoke()
{
  uint64_t v0 = NSURL;
  id v1 = SFRuntimeAbsoluteFilePathForPath(@"/System/Library/ProductDocuments/Notices");
  id v7 = [v0 fileURLWithPath:v1];

  uint64_t v2 = [NSString stringWithFormat:@"%@.bundle", @"Acknowledgements"];
  int v3 = [v7 URLByAppendingPathComponent:v2];

  double v4 = [MEMORY[0x263F086E0] bundleWithURL:v3];
  uint64_t v5 = [v4 pathForResource:@"Acknowledgements" ofType:@"html"];
  double v6 = (void *)SFAcknowledgementsDocumentFilePath___path;
  SFAcknowledgementsDocumentFilePath___path = v5;
}

id SFAudioAccessoryAcknowledgementsDocumentFilePath()
{
  if (SFAudioAccessoryAcknowledgementsDocumentFilePath_onceToken != -1) {
    dispatch_once(&SFAudioAccessoryAcknowledgementsDocumentFilePath_onceToken, &__block_literal_global_337);
  }
  uint64_t v0 = (void *)SFAudioAccessoryAcknowledgementsDocumentFilePath___path;
  return v0;
}

void __SFAudioAccessoryAcknowledgementsDocumentFilePath_block_invoke()
{
  uint64_t v0 = NSURL;
  id v1 = SFRuntimeAbsoluteFilePathForPath(@"/System/Library/ProductDocuments/Notices");
  id v7 = [v0 fileURLWithPath:v1];

  uint64_t v2 = [NSString stringWithFormat:@"%@.bundle", @"AudioAccessoryAcknowledgements"];
  int v3 = [v7 URLByAppendingPathComponent:v2];

  double v4 = [MEMORY[0x263F086E0] bundleWithURL:v3];
  uint64_t v5 = [v4 pathForResource:@"Acknowledgements" ofType:@"html"];
  double v6 = (void *)SFAudioAccessoryAcknowledgementsDocumentFilePath___path;
  SFAudioAccessoryAcknowledgementsDocumentFilePath___path = v5;
}

id SFRoHSComplianceDocumentFilePath()
{
  if (SFRoHSComplianceDocumentFilePath_onceToken != -1) {
    dispatch_once(&SFRoHSComplianceDocumentFilePath_onceToken, &__block_literal_global_342);
  }
  uint64_t v0 = (void *)SFRoHSComplianceDocumentFilePath___path;
  return v0;
}

void __SFRoHSComplianceDocumentFilePath_block_invoke()
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v0 = NSURL;
  id v1 = SFRuntimeAbsoluteFilePathForPath(@"/System/Library/ProductDocuments/Notices");
  uint64_t v2 = [v0 fileURLWithPath:v1];

  int v3 = [NSString stringWithFormat:@"%@.bundle", @"RoHS"];
  double v4 = [v2 URLByAppendingPathComponent:v3];

  uint64_t v5 = [MEMORY[0x263F086E0] bundleWithURL:v4];
  int v18 = 1278131292;
  long long v17 = xmmword_2154ED0B8;
  int v16 = -1841712216;
  long long v15 = xmmword_2154ED0CC;
  int v14 = 659506830;
  long long v13 = xmmword_2154ED0E0;
  int v12 = 213746202;
  long long v11 = xmmword_2154ED0F4;
  if (MGIsDeviceOneOfType())
  {
    double v6 = @"rohs-compliance-2019";
  }
  else
  {
    LODWORD(v10) = -2114570942;
    long long v9 = xmmword_2154ED108;
    if (MGIsDeviceOfType())
    {
      double v6 = @"rohs-compliance-2019a";
    }
    else if (SFDeviceSupportsShipsWithoutAdapterRoHSELabel())
    {
      double v6 = @"rohs-compliance-2020";
    }
    else
    {
      double v6 = @"rohs-compliance";
    }
  }
  uint64_t v7 = objc_msgSend(v5, "pathForResource:ofType:", v6, @"html", &v15, &v13, &v11, 0, v9, v10);
  uint64_t v8 = (void *)SFRoHSComplianceDocumentFilePath___path;
  SFRoHSComplianceDocumentFilePath___path = v7;
}

id SFBuiltInAppsDocumentFilePath()
{
  if (SFBuiltInAppsDocumentFilePath_onceToken != -1) {
    dispatch_once(&SFBuiltInAppsDocumentFilePath_onceToken, &__block_literal_global_364);
  }
  uint64_t v0 = (void *)SFBuiltInAppsDocumentFilePath___path;
  return v0;
}

void __SFBuiltInAppsDocumentFilePath_block_invoke()
{
  uint64_t v0 = NSURL;
  id v1 = SFRuntimeAbsoluteFilePathForPath(@"/System/Library/ProductDocuments/Notices");
  id v7 = [v0 fileURLWithPath:v1];

  uint64_t v2 = [NSString stringWithFormat:@"%@.bundle", @"BuiltInApps"];
  int v3 = [v7 URLByAppendingPathComponent:v2];

  double v4 = [MEMORY[0x263F086E0] bundleWithURL:v3];
  uint64_t v5 = [v4 pathForResource:@"builtinapps" ofType:@"html"];
  double v6 = (void *)SFBuiltInAppsDocumentFilePath___path;
  SFBuiltInAppsDocumentFilePath___path = v5;
}

id SFLocalizedMultipickerStringForKey(void *a1)
{
  uint64_t v1 = SFLocalizedMultipickerStringForKey_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&SFLocalizedMultipickerStringForKey_onceToken, &__block_literal_global_372);
  }
  int v3 = [(id)SFLocalizedMultipickerStringForKey___multipickerBundle localizedStringForKey:v2 value:0 table:@"Multiterms"];

  return v3;
}

void __SFLocalizedMultipickerStringForKey_block_invoke()
{
  uint64_t v0 = NSURL;
  uint64_t v1 = SFRuntimeAbsoluteFilePathForPath(@"/System/Library/ProductDocuments/MultipickerStrings");
  id v6 = [v0 fileURLWithPath:v1];

  id v2 = [NSString stringWithFormat:@"%@.bundle", @"iPhone"];
  int v3 = [v6 URLByAppendingPathComponent:v2];

  uint64_t v4 = [MEMORY[0x263F086E0] bundleWithURL:v3];
  uint64_t v5 = (void *)SFLocalizedMultipickerStringForKey___multipickerBundle;
  SFLocalizedMultipickerStringForKey___multipickerBundle = v4;
}

id SFRFExposureDocumentHTMLString()
{
  uint64_t v0 = [MEMORY[0x263F089D8] string];
  uint64_t v1 = [MEMORY[0x263F1C5C0] modelSpecificLocalizedStringKeyForKey:@"RF_INTRO"];
  if ([(__CFString *)v1 isEqualToString:@"RF_INTRO_IPHONE"])
  {
    if (SFDeviceSupportsFall2020OrLaterELabel())
    {

      uint64_t v1 = @"RF_INTRO_IPHONE_2020";
    }
    id v2 = [NSNumber numberWithInt:10];
    int v3 = (void *)MGCopyAnswer();
    uint64_t v4 = v3;
    if (v3)
    {
      id v5 = v3;

      id v2 = v5;
    }
    else
    {
      id v6 = SFLogForCategory(1uLL);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        SFRFExposureDocumentHTMLString_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
      }
    }
    int v14 = [MEMORY[0x263F08A30] localizedStringFromNumber:v2 numberStyle:0];
    long long v15 = NSString;
    int v16 = _SFRFExposureDocumentLocalizedStringForKey(v1);
    long long v17 = objc_msgSend(v15, "stringWithFormat:", v16, v14, v14);

    [v0 appendString:v17];
  }
  else
  {
    if ([(__CFString *)v1 isEqualToString:@"RF_INTRO_IPAD"]
      && SFDeviceSupportsSpring2021OrLaterELabel())
    {

      uint64_t v1 = @"RF_INTRO_IPAD_2021";
    }
    id v2 = _SFRFExposureDocumentLocalizedStringForKey(v1);
    [v0 appendString:v2];
  }

  int v18 = _SFRFExposureDocumentLocalizedStringForKey(@"RF_URL_INFO");
  uint64_t v19 = [MEMORY[0x263EFF960] _deviceLanguage];
  double v20 = NSString;
  uint64_t v21 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v22 = objc_msgSend(v21, "sf_productType");
  uint64_t v23 = [v20 stringWithFormat:@"www.apple.com/legal/rfexposure/%@/%@/", v22, v19];

  uint64_t v24 = [NSString stringWithFormat:@"<a href=\"http://%@\">%@</a>", v23, v23];

  objc_msgSend(v0, "appendFormat:", v18, v24);
  if ((MGGetBoolAnswer() & 1) != 0 || MGGetBoolAnswer())
  {
    if (MGGetBoolAnswer()
      && MGGetBoolAnswer()
      && !SFDeviceSupportsSpring2021OrLaterELabel())
    {
      id v25 = @"CELLULAR_INFO_WPT";
    }
    else if ([(__CFString *)v1 hasPrefix:@"RF_INTRO_IPHONE"] {
           && SFDeviceSupportsFall2020OrLaterELabel())
    }
    {
      id v25 = @"CELLULAR_INFO_2020";
    }
    else
    {
      id v25 = @"CELLULAR_INFO";
    }
    uint64_t v26 = _SFRFExposureDocumentLocalizedStringForKey(v25);
    [v0 appendString:v26];
  }
  uint64_t v27 = [MEMORY[0x263F1C408] sharedApplication];
  uint64_t v28 = [v27 userInterfaceLayoutDirection];
  uint64_t v29 = @"ltr";
  if (v28 == 1) {
    uint64_t v29 = @"rtl";
  }
  __int16 v30 = v29;

  objc_msgSend(NSString, "stringWithFormat:", @"<!DOCTYPE html><html dir=\"%@\"><head><meta name=\"viewport\" content=\"width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no\"/><meta charset=\"utf-8\"><title></title><style type=\"text/css\">:root { supported-color-schemes: light dark; } body  { font: -apple-system-body; word-wrap: break-word;-khtml-nbsp-mode: space;-khtml-line-break: after-white-space; color: -apple-system-label; } p.indented { margin-right: 37.0px; }</style></head><body>%@</body></html>",
    v30,
  id v31 = v0);

  return v31;
}

id _SFRFExposureDocumentLocalizedStringForKey(void *a1)
{
  uint64_t v1 = _SFRFExposureDocumentLocalizedStringForKey_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&_SFRFExposureDocumentLocalizedStringForKey_onceToken, &__block_literal_global_488);
  }
  int v3 = [(id)_SFRFExposureDocumentLocalizedStringForKey___rfExposureBundle localizedStringForKey:v2 value:0 table:@"RFExposure"];

  return v3;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_2154E6D10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __ScreenTimeCoreLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ScreenTimeCoreLibraryCore_frameworkLibrary = result;
  return result;
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

uint64_t SFPerformSelector(const char *a1, void *a2, uint64_t a3)
{
  return SFPerformSelector2(a1, a2, a3, 0);
}

uint64_t SFPerformSelector2(const char *a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (!a2) {
    return 0;
  }
  uint64_t v8 = SFLogForCategory(2uLL);
  os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, "SFPerformSelector");
  uint64_t v10 = SFLogForCategory(2uLL);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v11 = v10;
    if (os_signpost_enabled(v10))
    {
      uint64_t v12 = (objc_class *)objc_opt_class();
      int v22 = 138543618;
      uint64_t v23 = NSStringFromClass(v12);
      __int16 v24 = 2114;
      id v25 = NSStringFromSelector(a1);
      _os_signpost_emit_with_name_impl(&dword_2154D9000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "SFPerformSelector2", "Target: %{public}@, Selector: %{public}@", (uint8_t *)&v22, 0x16u);
    }
  }
  uint64_t v13 = (uint64_t (*)(void *, const char *, uint64_t, uint64_t))[a2 methodForSelector:a1];
  uint64_t v14 = objc_msgSend((id)objc_msgSend(a2, "methodSignatureForSelector:", a1), "methodReturnLength");
  if (a4)
  {
    uint64_t v15 = v13(a2, a1, a3, a4);
  }
  else if (a3)
  {
    uint64_t v15 = ((uint64_t (*)(void *, const char *, uint64_t))v13)(a2, a1, a3);
  }
  else
  {
    uint64_t v15 = ((uint64_t (*)(void *, const char *))v13)(a2, a1);
  }
  uint64_t v17 = v15;
  int v18 = SFLogForCategory(2uLL);
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    uint64_t v19 = v18;
    if (os_signpost_enabled(v18))
    {
      LOWORD(v22) = 0;
      _os_signpost_emit_with_name_impl(&dword_2154D9000, v19, OS_SIGNPOST_INTERVAL_END, v9, "SFPerformSelector2", (const char *)&unk_2154EFF12, (uint8_t *)&v22, 2u);
    }
  }
  double v20 = NSStringFromSelector(a1);
  uint64_t v21 = (objc_class *)objc_opt_class();
  +[SFSettingsAnalytics trackingPerformSelector:v20 targetString:NSStringFromClass(v21)];
  if (v14) {
    return v17;
  }
  else {
    return 0;
  }
}

id SF_LocalizedStringForCountryOfOriginAssembledIn(void *a1)
{
  id v1 = a1;
  id v2 = SFBundleForSettingsFoundationFramework();
  int v3 = [v2 localizedStringForKey:v1 value:0 table:@"CountryOfOriginAssembledIn"];

  return v3;
}

id SFBundleForSettingsFoundationFramework()
{
  if (SFBundleForSettingsFoundationFramework_onceToken != -1) {
    dispatch_once(&SFBundleForSettingsFoundationFramework_onceToken, &__block_literal_global_2);
  }
  uint64_t v0 = (void *)SFBundleForSettingsFoundationFramework__settingsFoundationFrameworkBundle;
  return v0;
}

id SF_LocalizedStringForCountryOfOriginMadeIn(void *a1)
{
  id v1 = a1;
  id v2 = SFBundleForSettingsFoundationFramework();
  int v3 = [v2 localizedStringForKey:v1 value:0 table:@"CountryOfOriginMadeIn"];

  return v3;
}

id SF_LocalizedStringForSettingsFoundation(void *a1)
{
  id v1 = a1;
  id v2 = SFBundleForSettingsFoundationFramework();
  int v3 = [v2 localizedStringForKey:v1 value:0 table:@"SettingsFoundation"];

  return v3;
}

uint64_t __SFBundleForSettingsFoundationFramework_block_invoke()
{
  SFBundleForSettingsFoundationFramework__settingsFoundationFrameworkBundle = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  return MEMORY[0x270F9A758]();
}

id SFLogForCategory(unint64_t a1)
{
  if (a1 >= 5) {
    SFLogForCategory_cold_1();
  }
  if (SFLogForCategory_loggingToken != -1) {
    dispatch_once(&SFLogForCategory_loggingToken, &__block_literal_global_3);
  }
  id v2 = (void *)SFLogForCategory_logObjects[a1];
  return v2;
}

uint64_t __SFLogForCategory_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.settings.SettingsFoundation", "Base");
  id v1 = (void *)SFLogForCategory_logObjects[0];
  SFLogForCategory_logObjects[0] = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.settings.SettingsFoundation", "Legal");
  int v3 = (void *)qword_26AA810D0;
  qword_26AA810D0 = (uint64_t)v2;

  os_log_t v4 = os_log_create("com.apple.settings.SettingsFoundation", "Signposts");
  id v5 = (void *)qword_26AA810D8;
  qword_26AA810D8 = (uint64_t)v4;

  os_log_t v6 = os_log_create("com.apple.settings.SettingsFoundation", "DeviceAttributes");
  uint64_t v7 = (void *)qword_26AA810E0;
  qword_26AA810E0 = (uint64_t)v6;

  qword_26AA810E8 = (uint64_t)os_log_create("com.apple.settings.SettingsFoundation", "SettingsAnalytics");
  return MEMORY[0x270F9A758]();
}

uint64_t SFAppTintColor()
{
  return [MEMORY[0x263F1C550] systemBlueColor];
}

id SFTintedImageFromMask(void *a1)
{
  id v1 = (void *)MEMORY[0x263F1C550];
  id v2 = a1;
  int v3 = [v1 systemBlueColor];
  os_log_t v4 = _SFTintedImageFromMaskWithColor(v2, v3);

  return v4;
}

id _SFTintedImageFromMaskWithColor(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  [v4 size];
  double v6 = v5;
  double v8 = v7;
  CGFloat v9 = *MEMORY[0x263F00148];
  CGFloat v10 = *(double *)(MEMORY[0x263F00148] + 8);
  [v4 scale];
  CGFloat v12 = v11;
  v18.width = 29.0;
  v18.height = 29.0;
  UIGraphicsBeginImageContextWithOptions(v18, 0, v12);
  float v13 = (29.0 - v6) * 0.5;
  float v14 = (29.0 - v8) * 0.5;
  objc_msgSend(v4, "drawInRect:", floorf(v13), floorf(v14), v6, v8);

  [v3 setFill];
  v19.size.width = 29.0;
  v19.size.height = 29.0;
  v19.origin.x = v9;
  v19.origin.y = v10;
  UIRectFillUsingBlendMode(v19, kCGBlendModeSourceIn);
  uint64_t v15 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return v15;
}

id SFSelectedTintedImageFromMask(void *a1)
{
  id v1 = (void *)MEMORY[0x263F1C550];
  id v2 = a1;
  id v3 = [v1 whiteColor];
  id v4 = _SFTintedImageFromMaskWithColor(v2, v3);

  return v4;
}

id SFLocalizableWAPIStringKeyForKey(void *a1)
{
  id v1 = a1;
  if (SFLocalizableWAPIStringKeyForKey___wapiCapabilityToken != -1) {
    dispatch_once(&SFLocalizableWAPIStringKeyForKey___wapiCapabilityToken, &__block_literal_global_5);
  }
  int v2 = SFLocalizableWAPIStringKeyForKey___wapi | CFPreferencesGetAppBooleanValue(@"fakeWapi", @"com.apple.preferences.cn", 0);
  SFLocalizableWAPIStringKeyForKey___wapi = v2 != 0;
  if (v2)
  {
    uint64_t v3 = [v1 stringByReplacingOccurrencesOfString:@"WIFI" withString:@"WLAN"];

    id v1 = (id)v3;
  }
  return v1;
}

uint64_t __SFLocalizableWAPIStringKeyForKey_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  SFLocalizableWAPIStringKeyForKey___wapi = result;
  return result;
}

uint64_t SFProcessIDForProcessNamed(void *a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v1 = a1;
  if ([v1 length])
  {
    int v2 = (const char *)[v1 UTF8String];
    uint64_t v3 = 0;
    *(_OWORD *)double v20 = xmmword_2154ED140;
    uint64_t v21 = 0;
    size_t size = 0;
    int v4 = -5;
    while (1)
    {
      uint64_t v5 = sysctl(v20, 3u, 0, &size, 0, 0);
      if (v5)
      {
        uint64_t v9 = v5;
        goto LABEL_29;
      }
      double v6 = (char *)malloc_type_realloc(v3, size, 0x7B3B72B2uLL);
      if (!v6) {
        break;
      }
      double v7 = v6;
      uint64_t v8 = sysctl(v20, 3u, v6, &size, 0, 0);
      if (!v8) {
        goto LABEL_21;
      }
      uint64_t v9 = v8;
      if (*__error() != 12) {
        goto LABEL_27;
      }
      CGFloat v10 = SFLogForCategory(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2154D9000, v10, OS_LOG_TYPE_DEFAULT, "sysctl() returned ENOMEM. Process table grew during SFProcessIDForProcessNamed().", buf, 2u);
      }

      if (__CFADD__(v4++, 1))
      {
        float v13 = SFLogForCategory(0);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2154D9000, v13, OS_LOG_TYPE_DEFAULT, "SFProcessIDForProcessNamed() was unable to get the full process list even after retries!", buf, 2u);
        }

LABEL_21:
        if (size < 0x288)
        {
LABEL_26:
          uint64_t v9 = 0xFFFFFFFFLL;
        }
        else
        {
          size_t v14 = size / 0x288;
          uint64_t v15 = v7 + 243;
          while (1)
          {
            uint64_t v9 = *(unsigned int *)(v15 - 203);
            if ((int)v9 >= 1 && !strncmp(v2, v15, 0x10uLL)) {
              break;
            }
            v15 += 648;
            if (!--v14) {
              goto LABEL_26;
            }
          }
        }
LABEL_27:
        uint64_t v3 = (char *)v7;
LABEL_28:
        free(v3);
        goto LABEL_29;
      }
      uint64_t v3 = (char *)v7;
      if (*__error() != 12) {
        goto LABEL_21;
      }
    }
    CGFloat v12 = SFLogForCategory(0);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      size_t v19 = size;
      _os_log_impl(&dword_2154D9000, v12, OS_LOG_TYPE_DEFAULT, "Unable to realloc buffer to %lld size", buf, 0xCu);
    }

    uint64_t v9 = 0xFFFFFFFFLL;
    if (v3) {
      goto LABEL_28;
    }
  }
  else
  {
    uint64_t v9 = 0xFFFFFFFFLL;
  }
LABEL_29:

  return v9;
}

uint64_t SFTerminateProcessNamed(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ((SFProcessIDForProcessNamed(a1) & 0x80000000) != 0)
  {
    uint64_t v5 = 3;
  }
  else
  {
    [v4 UTF8String];
    uint64_t v5 = terminate_with_reason();
  }

  return v5;
}

uint64_t SFKillProcessNamed(void *a1)
{
  return SFTerminateProcessNamed(a1, 0, &stru_26C60E030);
}

uint64_t SFIsAppWithBundleIDInstalled(void *a1)
{
  id v1 = a1;
  int v2 = [MEMORY[0x263F53C50] sharedConnection];
  uint64_t v3 = [v2 effectiveBlockedAppBundleIDs];

  if ([v3 containsObject:v1])
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v5 = [MEMORY[0x263F01880] defaultWorkspace];
    uint64_t v4 = [v5 applicationIsInstalled:v1];
  }
  return v4;
}

id SFLocalizedStringFromTableInBundleForLanguage(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (![v7 length] || !objc_msgSend(v8, "length") || !objc_msgSend(v10, "length")) {
    goto LABEL_9;
  }
  CFArrayRef v11 = [v9 localizations];
  CFArrayRef v12 = [MEMORY[0x263EFF8C0] arrayWithObject:v10];
  CFArrayRef v13 = CFBundleCopyLocalizationsForPreferences(v11, v12);
  if (![(__CFArray *)v13 count]) {
    goto LABEL_7;
  }
  size_t v14 = [(__CFArray *)v13 objectAtIndex:0];
  uint64_t v15 = [v9 pathForResource:v8 ofType:@"strings" inDirectory:0 forLocalization:v14];

  if (v15)
  {
    int v16 = [NSDictionary dictionaryWithContentsOfFile:v15];
    uint64_t v17 = [v16 objectForKey:v7];
  }
  else
  {
LABEL_7:
    uint64_t v17 = 0;
  }

  if (!v17)
  {
LABEL_9:
    uint64_t v17 = [v9 localizedStringForKey:v7 value:&stru_26C60E030 table:v8];
  }

  return v17;
}

__CFString *SFDeveloperSettingsBundlesDirectoryPath()
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  os_log_t v0 = [MEMORY[0x263F08850] defaultManager];
  id v1 = @"/System/Library/PreferenceBundles/";
  int v2 = [@"/System/Library/PreferenceBundles/" stringByAppendingPathComponent:@"DeveloperSettings.bundle"];
  char v3 = [v0 fileExistsAtPath:v2];

  if ((v3 & 1) == 0)
  {
    uint64_t v4 = [MEMORY[0x263F08850] defaultManager];
    id v1 = @"/System/Developer/Library/PreferenceBundles/";
    char v5 = [v4 fileExistsAtPath:@"/System/Developer/Library/PreferenceBundles/"];

    if ((v5 & 1) == 0)
    {
      double v6 = [MEMORY[0x263F08850] defaultManager];
      int v7 = [v6 fileExistsAtPath:@"/Developer/Library/PreferenceBundles/"];

      if (v7) {
        id v1 = @"/Developer/Library/PreferenceBundles/";
      }
      else {
        id v1 = 0;
      }
    }
  }
  id v8 = SFLogForCategory(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    CFArrayRef v11 = "NSString * _Nullable SFDeveloperSettingsBundlesDirectoryPath(void)";
    __int16 v12 = 2114;
    CFArrayRef v13 = v1;
    _os_log_impl(&dword_2154D9000, v8, OS_LOG_TYPE_DEFAULT, "%s: Resolved Developer Settings Directory Path '%{public}@'", (uint8_t *)&v10, 0x16u);
  }

  return v1;
}

id SFDeveloperSettingsBundlePath()
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  os_log_t v0 = SFDeveloperSettingsBundlesDirectoryPath();
  if ([v0 isEqualToString:@"/System/Library/PreferenceBundles/"])
  {
    id v1 = @"DeveloperSettings.bundle";
LABEL_5:
    int v2 = [v0 stringByAppendingPathComponent:v1];
    goto LABEL_6;
  }
  if (v0)
  {
    id v1 = @"Developer Settings.bundle";
    goto LABEL_5;
  }
  int v2 = 0;
LABEL_6:
  char v3 = SFLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315394;
    double v6 = "NSString * _Nullable SFDeveloperSettingsBundlePath(void)";
    __int16 v7 = 2114;
    id v8 = v2;
    _os_log_impl(&dword_2154D9000, v3, OS_LOG_TYPE_DEFAULT, "%s: Resolved Developer Settings Path '%{public}@'", (uint8_t *)&v5, 0x16u);
  }

  return v2;
}

void _SFBuiltInRegulatoryImage_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2154D9000, v0, v1, "%{Public}s: No Regulatory Image found using variant, using model instead '%{Public}@'.", v2, v3, v4, v5, 2u);
}

void _SFBuiltInRegulatoryImage_cold_2()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_0();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_debug_impl(&dword_2154D9000, v2, OS_LOG_TYPE_DEBUG, "%{Public}s: Looking up Built-in Regulatory Image for '%{Public}@-%{Public}@'.", (uint8_t *)v3, 0x20u);
}

void _SFLicenseFilePathForBundleWithName_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _SFLicenseVersionNumberForBundleWithName_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void _SFLicenseVersionNumberForBundleWithName_cold_2(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 path];
  int v4 = 136446722;
  uint64_t v5 = "NSString *_SFLicenseVersionNumberForBundleWithName(NSString *__strong)";
  __int16 v6 = 2114;
  __int16 v7 = @"License_version";
  __int16 v8 = 2114;
  uint64_t v9 = v3;
  _os_log_error_impl(&dword_2154D9000, a2, OS_LOG_TYPE_ERROR, "%{public}s: Cannot resolve '%{public}@' inside bundle '%{public}@'", (uint8_t *)&v4, 0x20u);
}

void _SFLicenseVersionNumberForBundleWithName_cold_3(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = 136446722;
  uint64_t v3 = "NSString *_SFLicenseVersionNumberForBundleWithName(NSString *__strong)";
  __int16 v4 = 2114;
  uint64_t v5 = _SFLicenseVersionNumberForBundleWithName_licenseVersionPath;
  __int16 v6 = 2114;
  uint64_t v7 = a1;
  _os_log_error_impl(&dword_2154D9000, a2, OS_LOG_TYPE_ERROR, "%{public}s: Cannot load contents of %{public}@, error: %{public}@", (uint8_t *)&v2, 0x20u);
}

void _SFLicenseVersionNumberForBundleWithName_cold_4(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v2 = 136446722;
  uint64_t v3 = "NSString *_SFLicenseVersionNumberForBundleWithName(NSString *__strong)";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  __int16 v6 = 2114;
  uint64_t v7 = _SFLicenseVersionNumberForBundleWithName_licenseVersionPath;
  _os_log_debug_impl(&dword_2154D9000, a2, OS_LOG_TYPE_DEBUG, "%{public}s: License version path for '%{public}@' resolved to: '%{public}@' .", (uint8_t *)&v2, 0x20u);
}

void _SFWarrantyFilePathForBundleWithName_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SFBuiltInRegulatoryImageForModelAndVariant_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SFBuiltInRegulatoryImageForModelAndVariant_cold_2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_2154D9000, v0, OS_LOG_TYPE_DEBUG, "%{Public}s: No Regulatory Image found using variant, using model instead '%{Public}@'.", (uint8_t *)v1, 0x16u);
}

void SFBuiltInRegulatoryImageForModelAndVariant_cold_3()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_0();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_debug_impl(&dword_2154D9000, v2, OS_LOG_TYPE_DEBUG, "%{Public}s: Looking up Built-in Regulatory Image for variant '%{Public}@' '%{Public}@'.", (uint8_t *)v3, 0x20u);
}

void SFBuiltInRegulatoryImageForModelAndVariant_cold_4()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_0();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl(&dword_2154D9000, v1, OS_LOG_TYPE_DEBUG, "%{Public}s: Looking up Built-in Regulatory Image for variant '%{Public}@' @%{Public}dx.", (uint8_t *)v2, 0x1Cu);
}

void SFBuiltInRegulatoryImageForApplePencilModel_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SFIsRegulatoryImageFromLockdown_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_2154D9000, a2, a3, "%{Public}s: Failed to get group path for Lockdown Regulatory Images! error = %llu", a5, a6, a7, a8, 2u);
}

void SFIsRegulatoryImageFromLockdown_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SFIsRegulatoryImageFromLockdown_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SFIsRegulatoryImageFromLockdown_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SFIsRegulatoryImageFromLockdown_cold_5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_2154D9000, v0, v1, "%{Public}s: No matching Lockdown Regulatory Image for '%{Public}@'", v2, v3, v4, v5, 2u);
}

void SFIsRegulatoryImageFromLockdown_cold_6(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "UIImage *_SFGetRegulatoryImageFromLockdown(BOOL *)";
  _os_log_error_impl(&dword_2154D9000, log, OS_LOG_TYPE_ERROR, "%{Public}s: No Lockdown Regulatory Image source", buf, 0xCu);
}

void SFIsRegulatoryImageFromLockdown_cold_7()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_2(&dword_2154D9000, v0, v1, "%{Public}s: Failed decoding style-sensitive Lockdown Regulatory Image '%{Public}@'", v2, v3, v4, v5, 2u);
}

void SFIsRegulatoryImageFromLockdown_cold_8(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "UIImage *_SFGetRegulatoryImageFromLockdown(BOOL *)";
  _os_log_error_impl(&dword_2154D9000, log, OS_LOG_TYPE_ERROR, "%{Public}s: Lockdown Regulatory Image not data", buf, 0xCu);
}

void SFIsRegulatoryImageFromLockdown_cold_9(NSObject *a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v2 = *__error();
  int v3 = 136315394;
  uint64_t v4 = "UIImage *_SFGetRegulatoryImageFromLockdown(BOOL *)";
  __int16 v5 = 1024;
  int v6 = v2;
  _os_log_error_impl(&dword_2154D9000, a1, OS_LOG_TYPE_ERROR, "%{Public}s: Failed to set permissions on Lockdown Regulatory Images group path, errno %i", (uint8_t *)&v3, 0x12u);
}

void SFRFExposureDocumentHTMLString_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __getSTManagementStateClass_block_invoke_cold_1()
{
}

void SFLogForCategory_cold_1()
{
}

uint64_t ADClientAddValueForScalarKey()
{
  return MEMORY[0x270F0B6B0]();
}

uint64_t AMFIIsDeveloperModeEnabled()
{
  return MEMORY[0x270F0E860]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

CFArrayRef CFBundleCopyLocalizationsForPreferences(CFArrayRef locArray, CFArrayRef prefArray)
{
  return (CFArrayRef)MEMORY[0x270EE4570](locArray, prefArray);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x270EE4838]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59A8](retstr, sx, sy);
}

void CGImageRelease(CGImageRef image)
{
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x270EF5018](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x270EF5030](data, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return MEMORY[0x270EF5048](isrc);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  MEMORY[0x270EE7230]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

uint64_t CPCopySharedResourcesPreferencesDomainForDomain()
{
  return MEMORY[0x270F0CD20]();
}

uint64_t GSSendAppPreferencesChanged()
{
  return MEMORY[0x270F30690]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

uint64_t MGCopyMultipleAnswers()
{
  return MEMORY[0x270F95FB0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x270F95FF8]();
}

uint64_t MGIsDeviceOfType()
{
  return MEMORY[0x270F96008]();
}

uint64_t MGIsDeviceOneOfType()
{
  return MEMORY[0x270F96010]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x270EFD970](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x270EFD978](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x270EFD980](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x270EFD988](query, attributesToUpdate);
}

uint64_t SecKeyFromPassphraseDataHMACSHA1()
{
  return MEMORY[0x270EFDA78]();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F06038]();
}

void UIRectFillUsingBlendMode(CGRect rect, CGBlendMode blendMode)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
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

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

void bzero(void *a1, size_t a2)
{
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x270ED8EC8](a1, a2);
}

uint64_t container_system_group_path_for_identifier()
{
  return MEMORY[0x270ED90F0]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
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

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x270EDAA68](log, ptr);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x270EDB7D0](a1, *(void *)&a2, a3, a4, a5, a6);
}

uint64_t terminate_with_reason()
{
  return MEMORY[0x270EDB8D8]();
}