@interface NNMKBAAManager
+ (void)appleAuthHeaderFrom:(id)a3 completion:(id)a4;
+ (void)signRequestData:(id)a3 completion:(id)a4;
@end

@implementation NNMKBAAManager

+ (void)appleAuthHeaderFrom:(id)a3 completion:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __49__NNMKBAAManager_appleAuthHeaderFrom_completion___block_invoke;
  v8[3] = &unk_264E9A750;
  id v9 = v6;
  id v7 = v6;
  [a1 signRequestData:a3 completion:v8];
}

void __49__NNMKBAAManager_appleAuthHeaderFrom_completion___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  v23[3] = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  if (a4)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    if ([v7 count] == 2)
    {
      id v9 = NSString;
      v10 = [v7 objectAtIndexedSubscript:0];
      v11 = [v10 base64EncodedStringWithOptions:0];
      v12 = [v9 stringWithFormat:@"%@=%@", @"LeafCert", v11];

      v13 = NSString;
      v14 = [v7 objectAtIndexedSubscript:1];
      v15 = [v14 base64EncodedStringWithOptions:0];
      v16 = [v13 stringWithFormat:@"%@=%@", @"IntermediateCert", v15];

      v17 = NSString;
      v18 = [v8 base64EncodedStringWithOptions:0];
      v19 = [v17 stringWithFormat:@"%@=%@", @"Signature", v18];

      v23[0] = v16;
      v23[1] = v12;
      v23[2] = v19;
      v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:3];
      v21 = [v20 componentsJoinedByString:@","];

      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
    else
    {
      uint64_t v22 = *(void *)(a1 + 32);
      v12 = [MEMORY[0x263F087E8] genericErrorWithMessage:@"Invalid cert count"];
      (*(void (**)(uint64_t, void, void *))(v22 + 16))(v22, 0, v12);
    }
  }
}

+ (void)signRequestData:(id)a3 completion:(id)a4
{
  v99[6] = *MEMORY[0x263EF8340];
  id v82 = a3;
  id v5 = a4;
  uint64_t v92 = 0;
  v93 = &v92;
  uint64_t v94 = 0x2020000000;
  id v6 = (uint64_t (*)(void))getDeviceIdentityIsSupportedSymbolLoc_ptr;
  v95 = getDeviceIdentityIsSupportedSymbolLoc_ptr;
  if (!getDeviceIdentityIsSupportedSymbolLoc_ptr)
  {
    uint64_t v87 = MEMORY[0x263EF8330];
    uint64_t v88 = 3221225472;
    v89 = __getDeviceIdentityIsSupportedSymbolLoc_block_invoke;
    v90 = &unk_264E9A7A0;
    v91 = &v92;
    id v7 = (void *)DeviceIdentityLibrary();
    v93[3] = (uint64_t)dlsym(v7, "DeviceIdentityIsSupported");
    getDeviceIdentityIsSupportedSymbolLoc_ptr = *(_UNKNOWN **)(v91[1] + 24);
    id v6 = (uint64_t (*)(void))v93[3];
  }
  _Block_object_dispose(&v92, 8);
  if (!v6)
  {
    +[NNMKBAAManager signRequestData:completion:]();
    goto LABEL_68;
  }
  if (v6())
  {
    CFErrorRef error = 0;
    SecAccessControlRef v8 = SecAccessControlCreateWithFlags(0, (CFTypeRef)*MEMORY[0x263F16EA0], 0x40000000uLL, &error);
    if (!v8)
    {
      v73 = qword_26AC21860;
      if (os_log_type_enabled((os_log_t)qword_26AC21860, OS_LOG_TYPE_ERROR)) {
        +[NNMKBAAManager signRequestData:completion:]((uint64_t)&error, v73, v74, v75, v76, v77, v78, v79);
      }
      id v67 = [MEMORY[0x263F087E8] genericErrorWithMessage:@"Failed to create access control"];
      (*((void (**)(id, void, void, id))v5 + 2))(v5, 0, 0, v67);
      goto LABEL_53;
    }
    uint64_t v92 = 0;
    v93 = &v92;
    uint64_t v94 = 0x2020000000;
    id v9 = (uint64_t (*)(void))getDeviceIdentityUCRTAttestationSupportedSymbolLoc_ptr;
    v95 = getDeviceIdentityUCRTAttestationSupportedSymbolLoc_ptr;
    if (!getDeviceIdentityUCRTAttestationSupportedSymbolLoc_ptr)
    {
      uint64_t v87 = MEMORY[0x263EF8330];
      uint64_t v88 = 3221225472;
      v89 = __getDeviceIdentityUCRTAttestationSupportedSymbolLoc_block_invoke;
      v90 = &unk_264E9A7A0;
      v91 = &v92;
      v10 = (void *)DeviceIdentityLibrary();
      v11 = dlsym(v10, "DeviceIdentityUCRTAttestationSupported");
      *(void *)(v91[1] + 24) = v11;
      getDeviceIdentityUCRTAttestationSupportedSymbolLoc_ptr = *(_UNKNOWN **)(v91[1] + 24);
      id v9 = (uint64_t (*)(void))v93[3];
    }
    _Block_object_dispose(&v92, 8);
    if (!v9) {
      goto LABEL_56;
    }
    int v12 = v9();
    v13 = (void *)MEMORY[0x263EFF9A0];
    uint64_t v92 = 0;
    v93 = &v92;
    uint64_t v94 = 0x2020000000;
    v14 = (id *)getkMAOptionsBAAKeychainLabelSymbolLoc_ptr;
    v95 = (void *)getkMAOptionsBAAKeychainLabelSymbolLoc_ptr;
    if (!getkMAOptionsBAAKeychainLabelSymbolLoc_ptr)
    {
      uint64_t v87 = MEMORY[0x263EF8330];
      uint64_t v88 = 3221225472;
      v89 = __getkMAOptionsBAAKeychainLabelSymbolLoc_block_invoke;
      v90 = &unk_264E9A7A0;
      v91 = &v92;
      v15 = (void *)DeviceIdentityLibrary();
      v16 = dlsym(v15, "kMAOptionsBAAKeychainLabel");
      *(void *)(v91[1] + 24) = v16;
      getkMAOptionsBAAKeychainLabelSymbolLoc_ptr = *(void *)(v91[1] + 24);
      v14 = (id *)v93[3];
    }
    _Block_object_dispose(&v92, 8);
    if (!v14) {
      goto LABEL_56;
    }
    id v80 = *v14;
    v97[0] = v80;
    v99[0] = @"NanoMail";
    uint64_t v92 = 0;
    v93 = &v92;
    uint64_t v94 = 0x2020000000;
    v17 = (id *)getkMAOptionsBAAIgnoreExistingKeychainItemsSymbolLoc_ptr;
    v95 = (void *)getkMAOptionsBAAIgnoreExistingKeychainItemsSymbolLoc_ptr;
    if (!getkMAOptionsBAAIgnoreExistingKeychainItemsSymbolLoc_ptr)
    {
      uint64_t v87 = MEMORY[0x263EF8330];
      uint64_t v88 = 3221225472;
      v89 = __getkMAOptionsBAAIgnoreExistingKeychainItemsSymbolLoc_block_invoke;
      v90 = &unk_264E9A7A0;
      v91 = &v92;
      v18 = (void *)DeviceIdentityLibrary();
      v19 = dlsym(v18, "kMAOptionsBAAIgnoreExistingKeychainItems");
      *(void *)(v91[1] + 24) = v19;
      getkMAOptionsBAAIgnoreExistingKeychainItemsSymbolLoc_ptr = *(void *)(v91[1] + 24);
      v17 = (id *)v93[3];
    }
    _Block_object_dispose(&v92, 8);
    if (!v17) {
      goto LABEL_56;
    }
    id v20 = *v17;
    v97[1] = v20;
    v99[1] = MEMORY[0x263EFFA80];
    uint64_t v92 = 0;
    v93 = &v92;
    uint64_t v94 = 0x2020000000;
    v21 = (id *)getkMAOptionsBAANetworkTimeoutIntervalSymbolLoc_ptr;
    v95 = (void *)getkMAOptionsBAANetworkTimeoutIntervalSymbolLoc_ptr;
    if (!getkMAOptionsBAANetworkTimeoutIntervalSymbolLoc_ptr)
    {
      uint64_t v87 = MEMORY[0x263EF8330];
      uint64_t v88 = 3221225472;
      v89 = __getkMAOptionsBAANetworkTimeoutIntervalSymbolLoc_block_invoke;
      v90 = &unk_264E9A7A0;
      v91 = &v92;
      uint64_t v22 = (void *)DeviceIdentityLibrary();
      v23 = dlsym(v22, "kMAOptionsBAANetworkTimeoutInterval");
      *(void *)(v91[1] + 24) = v23;
      getkMAOptionsBAANetworkTimeoutIntervalSymbolLoc_ptr = *(void *)(v91[1] + 24);
      v21 = (id *)v93[3];
    }
    _Block_object_dispose(&v92, 8);
    if (!v21) {
      goto LABEL_56;
    }
    id v24 = *v21;
    v97[2] = v24;
    v99[2] = &unk_26F131868;
    uint64_t v92 = 0;
    v93 = &v92;
    uint64_t v94 = 0x2020000000;
    v25 = (id *)getkMAOptionsBAAValiditySymbolLoc_ptr;
    v95 = (void *)getkMAOptionsBAAValiditySymbolLoc_ptr;
    if (!getkMAOptionsBAAValiditySymbolLoc_ptr)
    {
      uint64_t v87 = MEMORY[0x263EF8330];
      uint64_t v88 = 3221225472;
      v89 = __getkMAOptionsBAAValiditySymbolLoc_block_invoke;
      v90 = &unk_264E9A7A0;
      v91 = &v92;
      v26 = (void *)DeviceIdentityLibrary();
      v27 = dlsym(v26, "kMAOptionsBAAValidity");
      *(void *)(v91[1] + 24) = v27;
      getkMAOptionsBAAValiditySymbolLoc_ptr = *(void *)(v91[1] + 24);
      v25 = (id *)v93[3];
    }
    _Block_object_dispose(&v92, 8);
    if (!v25) {
      goto LABEL_56;
    }
    id v28 = *v25;
    v97[3] = v28;
    v99[3] = &unk_26F131880;
    uint64_t v92 = 0;
    v93 = &v92;
    uint64_t v94 = 0x2020000000;
    v29 = (id *)getkMAOptionsBAASCRTAttestationSymbolLoc_ptr;
    v95 = (void *)getkMAOptionsBAASCRTAttestationSymbolLoc_ptr;
    if (!getkMAOptionsBAASCRTAttestationSymbolLoc_ptr)
    {
      uint64_t v87 = MEMORY[0x263EF8330];
      uint64_t v88 = 3221225472;
      v89 = __getkMAOptionsBAASCRTAttestationSymbolLoc_block_invoke;
      v90 = &unk_264E9A7A0;
      v91 = &v92;
      v30 = (void *)DeviceIdentityLibrary();
      v31 = dlsym(v30, "kMAOptionsBAASCRTAttestation");
      *(void *)(v91[1] + 24) = v31;
      getkMAOptionsBAASCRTAttestationSymbolLoc_ptr = *(void *)(v91[1] + 24);
      v29 = (id *)v93[3];
    }
    _Block_object_dispose(&v92, 8);
    if (!v29) {
      goto LABEL_56;
    }
    uint64_t v32 = v12 ^ 1u;
    id v33 = *v29;
    v97[4] = v33;
    v34 = [NSNumber numberWithBool:v32];
    v99[4] = v34;
    uint64_t v92 = 0;
    v93 = &v92;
    uint64_t v94 = 0x2020000000;
    v35 = (id *)getkMAOptionsBAAAccessControlsSymbolLoc_ptr;
    v95 = (void *)getkMAOptionsBAAAccessControlsSymbolLoc_ptr;
    if (!getkMAOptionsBAAAccessControlsSymbolLoc_ptr)
    {
      uint64_t v87 = MEMORY[0x263EF8330];
      uint64_t v88 = 3221225472;
      v89 = __getkMAOptionsBAAAccessControlsSymbolLoc_block_invoke;
      v90 = &unk_264E9A7A0;
      v91 = &v92;
      v36 = (void *)DeviceIdentityLibrary();
      v37 = dlsym(v36, "kMAOptionsBAAAccessControls");
      *(void *)(v91[1] + 24) = v37;
      getkMAOptionsBAAAccessControlsSymbolLoc_ptr = *(void *)(v91[1] + 24);
      v35 = (id *)v93[3];
    }
    _Block_object_dispose(&v92, 8);
    if (!v35) {
      goto LABEL_56;
    }
    id v98 = *v35;
    v99[5] = v8;
    v38 = NSDictionary;
    id v39 = v98;
    v40 = [v38 dictionaryWithObjects:v99 forKeys:v97 count:6];

    v81 = [v13 dictionaryWithDictionary:v40];

    id v41 = objc_alloc(MEMORY[0x263EFF980]);
    uint64_t v92 = 0;
    v93 = &v92;
    uint64_t v94 = 0x2020000000;
    v42 = (id *)getkMAOptionsBAAOIDIMG4ManifestSymbolLoc_ptr;
    v95 = (void *)getkMAOptionsBAAOIDIMG4ManifestSymbolLoc_ptr;
    if (!getkMAOptionsBAAOIDIMG4ManifestSymbolLoc_ptr)
    {
      uint64_t v87 = MEMORY[0x263EF8330];
      uint64_t v88 = 3221225472;
      v89 = __getkMAOptionsBAAOIDIMG4ManifestSymbolLoc_block_invoke;
      v90 = &unk_264E9A7A0;
      v91 = &v92;
      v43 = (void *)DeviceIdentityLibrary();
      v44 = dlsym(v43, "kMAOptionsBAAOIDIMG4Manifest");
      *(void *)(v91[1] + 24) = v44;
      getkMAOptionsBAAOIDIMG4ManifestSymbolLoc_ptr = *(void *)(v91[1] + 24);
      v42 = (id *)v93[3];
    }
    _Block_object_dispose(&v92, 8);
    if (!v42) {
      goto LABEL_56;
    }
    id v45 = *v42;
    v96[0] = v45;
    uint64_t v92 = 0;
    v93 = &v92;
    uint64_t v94 = 0x2020000000;
    v46 = (id *)getkMAOptionsBAAOIDHardwarePropertiesSymbolLoc_ptr;
    v95 = (void *)getkMAOptionsBAAOIDHardwarePropertiesSymbolLoc_ptr;
    if (!getkMAOptionsBAAOIDHardwarePropertiesSymbolLoc_ptr)
    {
      uint64_t v87 = MEMORY[0x263EF8330];
      uint64_t v88 = 3221225472;
      v89 = __getkMAOptionsBAAOIDHardwarePropertiesSymbolLoc_block_invoke;
      v90 = &unk_264E9A7A0;
      v91 = &v92;
      v47 = (void *)DeviceIdentityLibrary();
      v48 = dlsym(v47, "kMAOptionsBAAOIDHardwareProperties");
      *(void *)(v91[1] + 24) = v48;
      getkMAOptionsBAAOIDHardwarePropertiesSymbolLoc_ptr = *(void *)(v91[1] + 24);
      v46 = (id *)v93[3];
    }
    _Block_object_dispose(&v92, 8);
    if (!v46) {
      goto LABEL_56;
    }
    id v49 = *v46;
    v96[1] = v49;
    uint64_t v92 = 0;
    v93 = &v92;
    uint64_t v94 = 0x2020000000;
    v50 = (id *)getkMAOptionsBAAOIDKeyUsagePropertiesSymbolLoc_ptr;
    v95 = (void *)getkMAOptionsBAAOIDKeyUsagePropertiesSymbolLoc_ptr;
    if (!getkMAOptionsBAAOIDKeyUsagePropertiesSymbolLoc_ptr)
    {
      uint64_t v87 = MEMORY[0x263EF8330];
      uint64_t v88 = 3221225472;
      v89 = __getkMAOptionsBAAOIDKeyUsagePropertiesSymbolLoc_block_invoke;
      v90 = &unk_264E9A7A0;
      v91 = &v92;
      v51 = (void *)DeviceIdentityLibrary();
      v52 = dlsym(v51, "kMAOptionsBAAOIDKeyUsageProperties");
      *(void *)(v91[1] + 24) = v52;
      getkMAOptionsBAAOIDKeyUsagePropertiesSymbolLoc_ptr = *(void *)(v91[1] + 24);
      v50 = (id *)v93[3];
    }
    _Block_object_dispose(&v92, 8);
    if (!v50) {
      goto LABEL_56;
    }
    id v53 = *v50;
    v96[2] = v53;
    uint64_t v92 = 0;
    v93 = &v92;
    uint64_t v94 = 0x2020000000;
    v54 = (id *)getkMAOptionsBAAOIDAccessControlsSymbolLoc_ptr;
    v95 = (void *)getkMAOptionsBAAOIDAccessControlsSymbolLoc_ptr;
    if (!getkMAOptionsBAAOIDAccessControlsSymbolLoc_ptr)
    {
      uint64_t v87 = MEMORY[0x263EF8330];
      uint64_t v88 = 3221225472;
      v89 = __getkMAOptionsBAAOIDAccessControlsSymbolLoc_block_invoke;
      v90 = &unk_264E9A7A0;
      v91 = &v92;
      v55 = (void *)DeviceIdentityLibrary();
      v56 = dlsym(v55, "kMAOptionsBAAOIDAccessControls");
      *(void *)(v91[1] + 24) = v56;
      getkMAOptionsBAAOIDAccessControlsSymbolLoc_ptr = *(void *)(v91[1] + 24);
      v54 = (id *)v93[3];
    }
    _Block_object_dispose(&v92, 8);
    if (!v54) {
      goto LABEL_56;
    }
    id v57 = *v54;
    v96[3] = v57;
    uint64_t v92 = 0;
    v93 = &v92;
    uint64_t v94 = 0x2020000000;
    v58 = (id *)getkMAOptionsBAAOIDDeviceOSInformationSymbolLoc_ptr;
    v95 = (void *)getkMAOptionsBAAOIDDeviceOSInformationSymbolLoc_ptr;
    if (!getkMAOptionsBAAOIDDeviceOSInformationSymbolLoc_ptr)
    {
      uint64_t v87 = MEMORY[0x263EF8330];
      uint64_t v88 = 3221225472;
      v89 = __getkMAOptionsBAAOIDDeviceOSInformationSymbolLoc_block_invoke;
      v90 = &unk_264E9A7A0;
      v91 = &v92;
      v59 = (void *)DeviceIdentityLibrary();
      v60 = dlsym(v59, "kMAOptionsBAAOIDDeviceOSInformation");
      *(void *)(v91[1] + 24) = v60;
      getkMAOptionsBAAOIDDeviceOSInformationSymbolLoc_ptr = *(void *)(v91[1] + 24);
      v58 = (id *)v93[3];
    }
    _Block_object_dispose(&v92, 8);
    if (!v58) {
      goto LABEL_56;
    }
    id v61 = *v58;
    v96[4] = v61;
    v62 = [MEMORY[0x263EFF8C0] arrayWithObjects:v96 count:5];
    v63 = (void *)[v41 initWithArray:v62];
    uint64_t v92 = 0;
    v93 = &v92;
    uint64_t v94 = 0x2020000000;
    v64 = (void *)getkMAOptionsBAAOIDSToIncludeSymbolLoc_ptr;
    v95 = (void *)getkMAOptionsBAAOIDSToIncludeSymbolLoc_ptr;
    if (!getkMAOptionsBAAOIDSToIncludeSymbolLoc_ptr)
    {
      uint64_t v87 = MEMORY[0x263EF8330];
      uint64_t v88 = 3221225472;
      v89 = __getkMAOptionsBAAOIDSToIncludeSymbolLoc_block_invoke;
      v90 = &unk_264E9A7A0;
      v91 = &v92;
      v65 = (void *)DeviceIdentityLibrary();
      v66 = dlsym(v65, "kMAOptionsBAAOIDSToInclude");
      *(void *)(v91[1] + 24) = v66;
      getkMAOptionsBAAOIDSToIncludeSymbolLoc_ptr = *(void *)(v91[1] + 24);
      v64 = (void *)v93[3];
    }
    _Block_object_dispose(&v92, 8);
    if (v64)
    {
      [v81 setObject:v63 forKeyedSubscript:*v64];

      v83[0] = MEMORY[0x263EF8330];
      v83[1] = 3221225472;
      v83[2] = __45__NNMKBAAManager_signRequestData_completion___block_invoke;
      v83[3] = &unk_264E9A778;
      id v85 = v5;
      id v84 = v82;
      id v67 = v81;
      v68 = v83;
      uint64_t v92 = 0;
      v93 = &v92;
      uint64_t v94 = 0x2020000000;
      v69 = getDeviceIdentityIssueClientCertificateWithCompletionSymbolLoc_ptr;
      v95 = getDeviceIdentityIssueClientCertificateWithCompletionSymbolLoc_ptr;
      if (!getDeviceIdentityIssueClientCertificateWithCompletionSymbolLoc_ptr)
      {
        uint64_t v87 = MEMORY[0x263EF8330];
        uint64_t v88 = 3221225472;
        v89 = __getDeviceIdentityIssueClientCertificateWithCompletionSymbolLoc_block_invoke;
        v90 = &unk_264E9A7A0;
        v91 = &v92;
        v70 = (void *)DeviceIdentityLibrary();
        v71 = dlsym(v70, "DeviceIdentityIssueClientCertificateWithCompletion");
        *(void *)(v91[1] + 24) = v71;
        getDeviceIdentityIssueClientCertificateWithCompletionSymbolLoc_ptr = *(_UNKNOWN **)(v91[1] + 24);
        v69 = (void *)v93[3];
      }
      _Block_object_dispose(&v92, 8);
      if (v69)
      {
        ((void (*)(void, id, void *))v69)(0, v67, v68);

LABEL_53:
        goto LABEL_54;
      }
      +[NNMKBAAManager signRequestData:completion:]();
    }
    else
    {
LABEL_56:
      +[NNMKBAAManager signRequestData:completion:]();
    }
LABEL_68:
    __break(1u);
  }
  v72 = [MEMORY[0x263F087E8] genericErrorWithMessage:@"DeviceIdentity not supported on this platform."];
  (*((void (**)(id, void, void, void *))v5 + 2))(v5, 0, 0, v72);

LABEL_54:
}

void __45__NNMKBAAManager_signRequestData_completion___block_invoke(uint64_t a1, __SecKey *a2, void *a3, void *a4)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    if (a2)
    {
      if ([v7 count] == 2)
      {
        v16 = objc_opt_new();
        long long v43 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v17 = v7;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v43 objects:v47 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v44;
          while (2)
          {
            for (uint64_t i = 0; i != v19; ++i)
            {
              if (*(void *)v44 != v20) {
                objc_enumerationMutation(v17);
              }
              CFDataRef v22 = SecCertificateCopyData(*(SecCertificateRef *)(*((void *)&v43 + 1) + 8 * i));
              if (!v22)
              {
                uint64_t v31 = *(void *)(a1 + 40);
                uint64_t v32 = [MEMORY[0x263F087E8] genericErrorWithMessage:@"Unable to convert certificate to data"];
                (*(void (**)(uint64_t, void, void, void *))(v31 + 16))(v31, 0, 0, v32);

                goto LABEL_31;
              }
              CFDataRef v23 = v22;
              [v16 addObject:v22];
            }
            uint64_t v19 = [v17 countByEnumeratingWithState:&v43 objects:v47 count:16];
            if (v19) {
              continue;
            }
            break;
          }
        }

        id v24 = qword_26AC21860;
        if (os_log_type_enabled((os_log_t)qword_26AC21860, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v42[0]) = 0;
          _os_log_impl(&dword_23D3DF000, v24, OS_LOG_TYPE_DEFAULT, "Certificate issued", (uint8_t *)v42, 2u);
        }
        v42[0] = 0;
        CFDataRef Signature = SecKeyCreateSignature(a2, (SecKeyAlgorithm)*MEMORY[0x263F172E8], *(CFDataRef *)(a1 + 32), v42);
        if (Signature)
        {
          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        }
        else
        {
          id v33 = qword_26AC21860;
          if (os_log_type_enabled((os_log_t)qword_26AC21860, OS_LOG_TYPE_ERROR)) {
            __45__NNMKBAAManager_signRequestData_completion___block_invoke_cold_2((uint64_t)v42, v33, v34, v35, v36, v37, v38, v39);
          }
          uint64_t v40 = *(void *)(a1 + 40);
          id v41 = [MEMORY[0x263F087E8] genericErrorWithMessage:@"Failed to create signature"];
          (*(void (**)(uint64_t, void, void, void *))(v40 + 16))(v40, 0, 0, v41);
        }
        goto LABEL_31;
      }
      v30 = (void *)qword_26AC21860;
      if (os_log_type_enabled((os_log_t)qword_26AC21860, OS_LOG_TYPE_ERROR)) {
        __45__NNMKBAAManager_signRequestData_completion___block_invoke_cold_3(v30, v7);
      }
      uint64_t v27 = *(void *)(a1 + 40);
      id v28 = (void *)MEMORY[0x263F087E8];
      v29 = @"Invalid cert count";
    }
    else
    {
      v26 = qword_26AC21860;
      if (os_log_type_enabled((os_log_t)qword_26AC21860, OS_LOG_TYPE_ERROR)) {
        __45__NNMKBAAManager_signRequestData_completion___block_invoke_cold_1(v26);
      }
      uint64_t v27 = *(void *)(a1 + 40);
      id v28 = (void *)MEMORY[0x263F087E8];
      v29 = @"Missing referenceKey";
    }
    v16 = [v28 genericErrorWithMessage:v29];
    (*(void (**)(uint64_t, void, void, void *))(v27 + 16))(v27, 0, 0, v16);
LABEL_31:

    goto LABEL_32;
  }
  id v9 = qword_26AC21860;
  if (os_log_type_enabled((os_log_t)qword_26AC21860, OS_LOG_TYPE_ERROR)) {
    __45__NNMKBAAManager_signRequestData_completion___block_invoke_cold_4((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_32:
}

+ (uint64_t)signRequestData:completion:.cold.1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return +[NNMKBAAManager signRequestData:completion:](v0);
}

+ (void)signRequestData:(uint64_t)a3 completion:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __45__NNMKBAAManager_signRequestData_completion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23D3DF000, log, OS_LOG_TYPE_ERROR, "Failed to obtain BAA certificates: no referenceKey", v1, 2u);
}

void __45__NNMKBAAManager_signRequestData_completion___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __45__NNMKBAAManager_signRequestData_completion___block_invoke_cold_3(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = a1;
  int v4 = 134217984;
  uint64_t v5 = [a2 count];
  _os_log_error_impl(&dword_23D3DF000, v3, OS_LOG_TYPE_ERROR, "Failed to obtain BAA certificates: invalid cert count: %lu", (uint8_t *)&v4, 0xCu);
}

void __45__NNMKBAAManager_signRequestData_completion___block_invoke_cold_4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end