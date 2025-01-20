@interface PKPaymentSetupProductModel(PKUIUtilities)
- (id)filteredPaymentSetupProductModelWithLocalCredentials:()PKUIUtilities setupContext:webService:mobileCarrierRegion:deviceRegion:;
- (uint64_t)_localCredentials:()PKUIUtilities containProduct:;
@end

@implementation PKPaymentSetupProductModel(PKUIUtilities)

- (id)filteredPaymentSetupProductModelWithLocalCredentials:()PKUIUtilities setupContext:webService:mobileCarrierRegion:deviceRegion:
{
  uint64_t v174 = *MEMORY[0x1E4F143B8];
  id v111 = a3;
  id v12 = a5;
  id v124 = a6;
  id v123 = a7;
  id v107 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v114 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  int IsBridge = PKPaymentSetupContextIsBridge();
  int IsSetupAssistant = PKPaymentSetupContextIsSetupAssistant();
  int IsMerchantApp = PKPaymentSetupContextIsMerchantApp();
  int IsAvailable = PKFelicaSecureElementIsAvailable();
  uint64_t v118 = [v12 paymentSetupSupportedInRegion];
  v105 = v12;
  v13 = [v12 targetDevice];
  v14 = [v13 appleAccountInformation];
  int v125 = [v14 isManagedAppleAccount];

  if (PKIsPhone()) {
    char v130 = 1;
  }
  else {
    char v130 = PKIsWatch();
  }
  int v127 = PKPaymentSetupContextIsiOSSetupAssistant();
  v106 = [[PKSecurityCapabilitiesController alloc] initWithRequirements:4 context:a4];
  if ([v111 count])
  {
    long long v160 = 0u;
    long long v161 = 0u;
    long long v158 = 0u;
    long long v159 = 0u;
    v15 = [a1 allSetupProducts];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v158 objects:v173 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v159;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v159 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v158 + 1) + 8 * i);
          if ([a1 _localCredentials:v111 containProduct:v20]) {
            [v114 addObject:v20];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v158 objects:v173 count:16];
      }
      while (v17);
    }
  }
  v116 = a1;
  [a1 filteredPaymentSetupProductModel:v105 mobileCarrierRegion:v124 deviceRegion:v123 cardOnFiles:v114];
  long long v154 = 0u;
  long long v155 = 0u;
  long long v156 = 0u;
  long long v157 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  unint64_t v21 = 0x1E4F1C000;
  uint64_t v136 = [obj countByEnumeratingWithState:&v154 objects:v172 count:16];
  if (v136)
  {
    BOOL v23 = (a4 & 0xFFFFFFFFFFFFFFF7) == 0 || a4 == 3;
    BOOL v128 = v23;
    uint64_t v133 = *(void *)v155;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v155 != v133) {
          objc_enumerationMutation(obj);
        }
        v25 = *(void **)(*((void *)&v154 + 1) + 8 * v24);
        int v26 = [v114 containsObject:v25];
        if (PKPaymentSetupMergeProductsPartnersAPIEnabled())
        {
          v27 = [v25 configuration];
          if ([v27 type] != 7)
          {
            int v30 = 0;
            int v31 = 1;
            goto LABEL_38;
          }
          v28 = [v25 configuration];
          uint64_t v29 = [v28 featureIdentifier];

          if (v29 != 2) {
            goto LABEL_29;
          }
        }
        else if ([v25 supportedProvisioningMethods] != 4)
        {
LABEL_29:
          int v30 = 0;
          int v31 = 1;
          goto LABEL_39;
        }
        if (a4 <= 8 && ((1 << a4) & 0x109) != 0)
        {
          int v30 = 1;
          int v31 = v128;
          goto LABEL_39;
        }
        v27 = PKLogFacilityTypeGetObject();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          id v32 = [v25 displayName];
          *(_DWORD *)buf = 138412290;
          id v164 = v32;
          _os_log_impl(&dword_19F450000, v27, OS_LOG_TYPE_DEFAULT, "Product: %@ is not supported in context", buf, 0xCu);
        }
        int v30 = 1;
        int v31 = v128;
LABEL_38:

LABEL_39:
        if (PKPaymentSetupMergeProductsPartnersAPIEnabled())
        {
          LODWORD(v33) = [v25 supportsProvisioningMethodForType:2];
          if (v33)
          {
            v34 = [v25 provisioningMethods];
            BOOL v35 = [v34 count] == 1;
          }
          else
          {
            BOOL v35 = 0;
          }
          if ([v25 supportsProvisioningMethodForType:16])
          {
            v37 = [v25 provisioningMethods];
            BOOL v36 = [v37 count] == 1;

            if (v30) {
              goto LABEL_49;
            }
          }
          else
          {
            BOOL v36 = 0;
            if (v30)
            {
LABEL_49:
              char v38 = 1;
              if (a4 > 8 || ((1 << a4) & 0x109) == 0) {
                goto LABEL_57;
              }
            }
          }
        }
        else
        {
          unint64_t v33 = ((unint64_t)[v25 supportedProvisioningMethods] >> 1) & 1;
          BOOL v35 = [v25 supportedProvisioningMethods] == 2;
          BOOL v36 = [v25 supportedProvisioningMethods] == 16;
          if (v30) {
            goto LABEL_49;
          }
        }
        if (((v35 || v36) & IsSetupAssistant) == 1)
        {
          v39 = PKLogFacilityTypeGetObject();
          BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
          if (!v26)
          {
            if (v40)
            {
              id v48 = [v25 displayName];
              *(_DWORD *)buf = 138412290;
              id v164 = v48;
              v49 = v39;
              v50 = "Product: %@ is not supported in setup context due to lack of card on file";
              goto LABEL_100;
            }
            goto LABEL_102;
          }
          if (v40)
          {
            id v41 = [v25 displayName];
            *(_DWORD *)buf = 138412290;
            id v164 = v41;
            _os_log_impl(&dword_19F450000, v39, OS_LOG_TYPE_DEFAULT, "Product: %@ is supported due to matching card on file (DCI / In-App check)", buf, 0xCu);
          }
          char v38 = 0;
          int v31 = 1;
        }
        else
        {
          char v38 = 1;
        }
LABEL_57:
        if (((v31 ^ 1 | v33 | IsSetupAssistant) & 1) != 0
          || ([v25 allSupportedProtocols] & 4) == 0
          || IsAvailable)
        {
          if ((v31 & 1) == 0)
          {
            v39 = PKLogFacilityTypeGetObject();
            goto LABEL_103;
          }
        }
        else
        {
          v39 = PKLogFacilityTypeGetObject();
          BOOL v42 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
          if (!v26)
          {
            if (v42)
            {
              id v48 = [v25 displayName];
              *(_DWORD *)buf = 138412290;
              id v164 = v48;
              v49 = v39;
              v50 = "Product: %@ is not supported due to lack of card on file and Type F support";
              goto LABEL_100;
            }
            goto LABEL_102;
          }
          if (v42)
          {
            id v43 = [v25 displayName];
            *(_DWORD *)buf = 138412290;
            id v164 = v43;
            _os_log_impl(&dword_19F450000, v39, OS_LOG_TYPE_DEFAULT, "Product: %@ is supported due to matching card on file (type f support check)", buf, 0xCu);
          }
          char v38 = 0;
        }
        if (!PKSecureElementIsAvailable())
        {
          v39 = PKLogFacilityTypeGetObject();
          BOOL v44 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
          if ((v26 & IsBridge) != 1)
          {
            if (v44)
            {
              id v48 = [v25 displayName];
              *(_DWORD *)buf = 138412290;
              id v164 = v48;
              v49 = v39;
              v50 = "Product: %@ is not supported due to lack of SE";
              goto LABEL_100;
            }
            goto LABEL_102;
          }
          if (v44)
          {
            id v45 = [v25 displayName];
            *(_DWORD *)buf = 138412290;
            id v164 = v45;
            _os_log_impl(&dword_19F450000, v39, OS_LOG_TYPE_DEFAULT, "Product: %@ is supported due to matching card on file and bridge context (SE check)", buf, 0xCu);
          }
          char v38 = 0;
        }
        if (v127
          && [v25 hsa2Requirement] == 2
          && ![(PKSecurityCapabilitiesController *)v106 isHSA2Enabled])
        {
          v39 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            id v48 = [v25 displayName];
            *(_DWORD *)buf = 138412290;
            id v164 = v48;
            v49 = v39;
            v50 = "Product: %@ is not supported in setup context due to HSA requirement";
LABEL_100:
            _os_log_impl(&dword_19F450000, v49, OS_LOG_TYPE_DEFAULT, v50, buf, 0xCu);

LABEL_101:
          }
LABEL_102:

LABEL_103:
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            id v60 = [v25 displayName];
            *(_DWORD *)buf = 138412290;
            id v164 = v60;
            _os_log_impl(&dword_19F450000, v39, OS_LOG_TYPE_DEFAULT, "Product: %@ is unsupported and will not be shown in the flow picker", buf, 0xCu);
          }
          goto LABEL_105;
        }
        v46 = [v25 configuration];
        uint64_t v47 = [v46 state];

        if ((unint64_t)(v47 - 3) >= 2)
        {
          if (v47 == 2)
          {
            v51 = [v25 featureApplications];
            uint64_t v52 = [v51 count];

            v39 = PKLogFacilityTypeGetObject();
            BOOL v53 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
            if (!v52)
            {
              if (v53)
              {
                id v48 = [v25 displayName];
                PKPaymentSetupProductStateToString();
                v61 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                id v164 = v48;
                __int16 v165 = 2114;
                v166 = v61;
                _os_log_impl(&dword_19F450000, v39, OS_LOG_TYPE_DEFAULT, "Product: %{public}@ is set as: %{public}@ not including", buf, 0x16u);

                goto LABEL_101;
              }
              goto LABEL_102;
            }
            if (v53)
            {
              id v54 = [v25 displayName];
              PKPaymentSetupProductStateToString();
              v55 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              id v164 = v54;
              __int16 v165 = 2114;
              v166 = v55;
              _os_log_impl(&dword_19F450000, v39, OS_LOG_TYPE_DEFAULT, "Product: %{public}@ is set as: %{public}@ but has existing featureApplications so including", buf, 0x16u);
            }
          }
        }
        else if (((IsSetupAssistant ^ 1 | v26) & 1) == 0)
        {
          v39 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            id v48 = [v25 displayName];
            *(_DWORD *)buf = 138543362;
            id v164 = v48;
            v49 = v39;
            v50 = "Product: %{public}@ is set allowed during setup assistant as it requires onboarding";
            goto LABEL_100;
          }
          goto LABEL_102;
        }
        v56 = v25;
        v57 = v56;
        if (v38)
        {
          v39 = v56;
        }
        else
        {
          v39 = [v56 copy];

          if (PKPaymentSetupMergeProductsPartnersAPIEnabled()) {
            [v39 addProvisioningMethodType:0];
          }
          else {
            [v39 setSupportedProvisioningMethods:0];
          }
          v58 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
          {
            id v59 = [v57 displayName];
            *(_DWORD *)buf = 138412290;
            id v164 = v59;
            _os_log_impl(&dword_19F450000, v58, OS_LOG_TYPE_DEFAULT, "Product: %@ is supported due to matching card but cannot be manually provisioned", buf, 0xCu);
          }
        }
        [v107 addObject:v39];
LABEL_105:

        ++v24;
        unint64_t v21 = 0x1E4F1C000uLL;
      }
      while (v136 != v24);
      uint64_t v62 = [obj countByEnumeratingWithState:&v154 objects:v172 count:16];
      uint64_t v136 = v62;
    }
    while (v62);
  }

  id v132 = objc_alloc_init(MEMORY[0x1E4F84CB0]);
  [v132 updatePaymentSetupProducts:v107];
  id v110 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v150 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  long long v153 = 0u;
  id v108 = [v116 allSections];
  uint64_t v113 = [v108 countByEnumeratingWithState:&v150 objects:v171 count:16];
  if (v113)
  {
    uint64_t v112 = *(void *)v151;
    uint64_t v122 = *MEMORY[0x1E4F87BD8];
    uint64_t v119 = *MEMORY[0x1E4F87BD0];
    do
    {
      uint64_t v63 = 0;
      do
      {
        if (*(void *)v151 != v112) {
          objc_enumerationMutation(v108);
        }
        uint64_t v117 = v63;
        v64 = *(void **)(*((void *)&v150 + 1) + 8 * v63);
        id v120 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v146 = 0u;
        long long v147 = 0u;
        long long v148 = 0u;
        long long v149 = 0u;
        v115 = v64;
        id v129 = [v64 categories];
        uint64_t v137 = [v129 countByEnumeratingWithState:&v146 objects:v170 count:16];
        if (v137)
        {
          uint64_t v134 = *(void *)v147;
          do
          {
            for (uint64_t j = 0; j != v137; ++j)
            {
              if (*(void *)v147 != v134) {
                objc_enumerationMutation(v129);
              }
              v66 = *(void **)(*((void *)&v146 + 1) + 8 * j);
              if (IsSetupAssistant
                && ([*(id *)(*((void *)&v146 + 1) + 8 * j) excludedContexts] & 1) != 0)
              {
                v68 = PKLogFacilityTypeGetObject();
                if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
                {
                  id v69 = [v66 identifier];
                  *(_DWORD *)buf = 138412290;
                  id v164 = v69;
                  v70 = v68;
                  v71 = "Dropping category: %@ as it is not supported in setup assistant";
LABEL_141:
                  _os_log_impl(&dword_19F450000, v70, OS_LOG_TYPE_DEFAULT, v71, buf, 0xCu);
                }
              }
              else if (IsBridge && ([v66 excludedContexts] & 2) != 0)
              {
                v68 = PKLogFacilityTypeGetObject();
                if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
                {
                  id v69 = [v66 identifier];
                  *(_DWORD *)buf = 138412290;
                  id v164 = v69;
                  v70 = v68;
                  v71 = "Dropping category: %@ as it is not supported in bridge";
                  goto LABEL_141;
                }
              }
              else if (v130 & 1) == 0 && ([v66 capabilities])
              {
                v68 = PKLogFacilityTypeGetObject();
                if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
                {
                  id v69 = [v66 identifier];
                  *(_DWORD *)buf = 138412290;
                  id v164 = v69;
                  v70 = v68;
                  v71 = "Dropping category: %@ as it requires NFC support";
                  goto LABEL_141;
                }
              }
              else if (IsMerchantApp && ([v66 excludedContexts] & 4) != 0)
              {
                v68 = PKLogFacilityTypeGetObject();
                if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
                {
                  id v69 = [v66 identifier];
                  *(_DWORD *)buf = 138412290;
                  id v164 = v69;
                  v70 = v68;
                  v71 = "Dropping category: %@ as it is not supported in merchant apps";
                  goto LABEL_141;
                }
              }
              else
              {
                if (!v125 || ([v66 allowOnManagedAccount] & 1) != 0)
                {
                  int v67 = 1;
                  goto LABEL_143;
                }
                v68 = PKLogFacilityTypeGetObject();
                if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
                {
                  id v69 = [v66 identifier];
                  *(_DWORD *)buf = 138412290;
                  id v164 = v69;
                  v70 = v68;
                  v71 = "Dropping category: %@ as it is not supported on managed account";
                  goto LABEL_141;
                }
              }

              int v67 = 0;
LABEL_143:
              v72 = [v66 productIdentifiers];
              v73 = [v132 productsForProductIdentifiers:v72];

              v74 = [v66 regions];
              v75 = (void *)[v74 mutableCopy];
              v76 = v75;
              if (v75)
              {
                id v77 = v75;
              }
              else
              {
                id v77 = objc_alloc_init(*(Class *)(v21 + 2688));
              }
              long long v144 = 0u;
              long long v145 = 0u;
              long long v142 = 0u;
              long long v143 = 0u;
              id v78 = v73;
              uint64_t v79 = [v78 countByEnumeratingWithState:&v142 objects:v169 count:16];
              if (v79)
              {
                uint64_t v80 = v79;
                uint64_t v81 = *(void *)v143;
                do
                {
                  for (uint64_t k = 0; k != v80; ++k)
                  {
                    if (*(void *)v143 != v81) {
                      objc_enumerationMutation(v78);
                    }
                    v83 = [*(id *)(*((void *)&v142 + 1) + 8 * k) regions];
                    if (v83) {
                      [v77 unionSet:v83];
                    }
                  }
                  uint64_t v80 = [v78 countByEnumeratingWithState:&v142 objects:v169 count:16];
                }
                while (v80);
              }

              if (v67)
              {
                if (![v77 count]) {
                  goto LABEL_169;
                }
                v84 = [v66 identifier];
                if ([v84 isEqualToString:v122])
                {
                  char v85 = 1;
                }
                else
                {
                  v86 = [v66 identifier];
                  char v85 = [v86 isEqualToString:v119];
                }
                if (v123) {
                  int v87 = objc_msgSend(v77, "containsObject:");
                }
                else {
                  int v87 = 0;
                }
                char v88 = v85 ^ 1;
                if (!v124) {
                  char v88 = 1;
                }
                int v89 = (v88 & 1) != 0 ? 0 : objc_msgSend(v77, "containsObject:");
                if (((v87 | v89) & 1) == 0)
                {
                  v90 = PKLogFacilityTypeGetObject();
                  if (os_log_type_enabled(v90, OS_LOG_TYPE_DEFAULT))
                  {
                    id v97 = [v66 identifier];
                    *(_DWORD *)buf = 138412802;
                    id v164 = v97;
                    __int16 v165 = 2112;
                    v166 = @"NO";
                    __int16 v167 = 2112;
                    v168 = @"NO";
                    _os_log_impl(&dword_19F450000, v90, OS_LOG_TYPE_DEFAULT, "Dropping category: %@ as it was not in device region: %@ carrier region: %@", buf, 0x20u);
                  }
                }
                else
                {
LABEL_169:
                  v90 = objc_alloc_init(*(Class *)(v21 + 2688));
                  long long v138 = 0u;
                  long long v139 = 0u;
                  long long v140 = 0u;
                  long long v141 = 0u;
                  id v91 = v78;
                  uint64_t v92 = [v91 countByEnumeratingWithState:&v138 objects:v162 count:16];
                  if (v92)
                  {
                    uint64_t v93 = v92;
                    uint64_t v94 = *(void *)v139;
                    do
                    {
                      for (uint64_t m = 0; m != v93; ++m)
                      {
                        if (*(void *)v139 != v94) {
                          objc_enumerationMutation(v91);
                        }
                        v96 = [*(id *)(*((void *)&v138 + 1) + 8 * m) productIdentifier];
                        [v90 addObject:v96];
                      }
                      uint64_t v93 = [v91 countByEnumeratingWithState:&v138 objects:v162 count:16];
                    }
                    while (v93);
                  }

                  [v66 setProductIdentifiers:v90];
                  if ([v90 count])
                  {
LABEL_177:

                    [v120 addObject:v66];
                    unint64_t v21 = 0x1E4F1C000;
                    goto LABEL_189;
                  }
                  if ([v66 needsProducts])
                  {
                    v98 = PKLogFacilityTypeGetObject();
                    if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
                    {
                      id v99 = [v66 identifier];
                      *(_DWORD *)buf = 138412290;
                      id v164 = v99;
                      v100 = v98;
                      v101 = "Dropping category: %@ as it has no products that are supported";
                      goto LABEL_186;
                    }
                  }
                  else
                  {
                    if (v118 == 1) {
                      goto LABEL_177;
                    }
                    v98 = PKLogFacilityTypeGetObject();
                    if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
                    {
                      id v99 = [v66 identifier];
                      *(_DWORD *)buf = 138412290;
                      id v164 = v99;
                      v100 = v98;
                      v101 = "Dropping category: %@ as it has no products and apple pay unsupported";
LABEL_186:
                      _os_log_impl(&dword_19F450000, v100, OS_LOG_TYPE_DEFAULT, v101, buf, 0xCu);
                    }
                  }
                  unint64_t v21 = 0x1E4F1C000;
                }
              }
LABEL_189:
            }
            uint64_t v137 = [v129 countByEnumeratingWithState:&v146 objects:v170 count:16];
          }
          while (v137);
        }

        if ([v120 count])
        {
          [v115 setCategories:v120];
          [v110 addObject:v115];
        }
        else
        {
          v102 = PKLogFacilityTypeGetObject();
          if (os_log_type_enabled(v102, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19F450000, v102, OS_LOG_TYPE_DEFAULT, "Dropping section all its categories have no products", buf, 2u);
          }
        }
        uint64_t v63 = v117 + 1;
      }
      while (v117 + 1 != v113);
      uint64_t v113 = [v108 countByEnumeratingWithState:&v150 objects:v171 count:16];
    }
    while (v113);
  }

  [v132 setAllSections:v110];
  id v103 = v132;

  return v103;
}

- (uint64_t)_localCredentials:()PKUIUtilities containProduct:
{
  id v5 = a3;
  v6 = [a4 configuration];
  v7 = [v6 productIdentifier];

  if (v7)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __78__PKPaymentSetupProductModel_PKUIUtilities___localCredentials_containProduct___block_invoke;
    v10[3] = &unk_1E59DC928;
    id v11 = v7;
    uint64_t v8 = objc_msgSend(v5, "pk_containsObjectPassingTest:", v10);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

@end