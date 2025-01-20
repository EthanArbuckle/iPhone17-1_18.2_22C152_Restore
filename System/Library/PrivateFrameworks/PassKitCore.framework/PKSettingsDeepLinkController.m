@interface PKSettingsDeepLinkController
- (PKSettingsDeepLinkController)init;
- (PKSettingsDeepLinkController)initWithDataSource:(id)a3 delegate:(id)a4;
- (id)_percentEncodeReferrerIdentifier:(id)a3;
- (void)_presentPayLaterPassOrFinancingPlanWithIdenifier:(id)a3 dataSource:(id)a4 delegate:(id)a5;
- (void)_presentTransactionDetailsForTransactionWithIdentifier:(id)a3;
- (void)_presentTransactionDetailsForTransactionWithServiceIdentifier:(id)a3 transactionSourceIdentifier:(id)a4;
- (void)handleDeepLinkResourceDictionary:(id)a3 withCompletion:(id)a4;
@end

@implementation PKSettingsDeepLinkController

- (PKSettingsDeepLinkController)init
{
  return 0;
}

- (PKSettingsDeepLinkController)initWithDataSource:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PKSettingsDeepLinkController;
  v8 = [(PKSettingsDeepLinkController *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_dataSource, v6);
    objc_storeWeak((id *)&v9->_delegate, v7);
  }

  return v9;
}

- (void)handleDeepLinkResourceDictionary:(id)a3 withCompletion:(id)a4
{
  uint64_t v248 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v230 = objc_loadWeakRetained((id *)&self->_dataSource);
  v8 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v247 = v6;
    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "Processing resourceDictionary %{public}@", buf, 0xCu);
  }

  v228 = [v6 objectForKeyedSubscript:@"path"];
  v9 = [v228 componentsSeparatedByString:@"/"];
  unint64_t v10 = [v9 count];
  objc_super v11 = [v9 firstObject];
  v12 = @"payment_setup_IDMS_card_on_file";
  if (v11 == v12)
  {

    goto LABEL_9;
  }
  v13 = v12;
  if (!v11 || !v12)
  {

    goto LABEL_12;
  }
  int v14 = [(__CFString *)v11 isEqualToString:v12];

  if (v14)
  {
LABEL_9:
    v15 = v230;
    if (v10 < 2)
    {
      v16 = 0;
    }
    else
    {
      v16 = [v9 objectAtIndex:1];
    }
    v21 = WeakRetained;
    v22 = [MEMORY[0x1E4F1CAD0] set];
    [WeakRetained openPaymentSetupWithMode:2 referrerIdentifier:v16 allowedFeatureIdentifiers:v22];
    goto LABEL_19;
  }
LABEL_12:
  id v227 = v7;
  v17 = v11;
  v18 = @"payment_setup";
  if (v17 == v18)
  {

    goto LABEL_22;
  }
  v19 = v18;
  if (!v11 || !v18)
  {

    goto LABEL_26;
  }
  int v20 = [(__CFString *)v17 isEqualToString:v18];

  if (v20)
  {
LABEL_22:
    v21 = WeakRetained;
    [WeakRetained openPaymentSetupWithMode:0 referrerIdentifier:0 allowedFeatureIdentifiers:0];
LABEL_23:
    id v7 = v227;
LABEL_24:
    v15 = v230;
    goto LABEL_127;
  }
LABEL_26:
  v23 = v17;
  v24 = v23;
  if (v23 == @"card")
  {
    int v25 = 1;
  }
  else
  {
    if (!v11 || !@"card")
    {

      BOOL v26 = v10 > 1;
      goto LABEL_40;
    }
    int v25 = [(__CFString *)v23 isEqualToString:@"card"];
  }

  BOOL v26 = v10 > 1;
  if (v25)
  {
    id v7 = v227;
    if (v10 >= 2)
    {
      v15 = v230;
      if (v10 == 3)
      {
        v27 = [v9 objectAtIndex:2];
        v28 = @"cardInformation";
        if (v27 == v28)
        {

          goto LABEL_72;
        }
        v29 = v28;
        if (v27 && v28)
        {
          int v30 = [(__CFString *)v27 isEqualToString:v28];

          if (!v30) {
            goto LABEL_78;
          }
LABEL_72:
          v16 = [v9 objectAtIndex:1];
          v22 = [v230 paymentPassWithUniqueIdentifier:v16];
          v21 = WeakRetained;
          v50 = WeakRetained;
          v51 = v22;
          uint64_t v52 = 1;
LABEL_79:
          [v50 presentPassDetailsViewControllerForPass:v51 presentationStyle:2 presentingView:v52 animated:0];
LABEL_19:

LABEL_20:
          goto LABEL_127;
        }
      }
LABEL_78:
      v16 = [v9 objectAtIndex:1];
      v22 = [v230 paymentPassWithUniqueIdentifier:v16];
      v21 = WeakRetained;
      v50 = WeakRetained;
      v51 = v22;
      uint64_t v52 = 0;
      goto LABEL_79;
    }
  }
LABEL_40:
  BOOL v225 = v26;
  v31 = v24;
  v32 = @"transaction";
  if (v31 == v32)
  {
  }
  else
  {
    v33 = v32;
    if (!v11 || !v32)
    {

      goto LABEL_49;
    }
    int v34 = [(__CFString *)v31 isEqualToString:v32];

    if (!v34)
    {
LABEL_49:
      v38 = v31;
      v39 = @"apple-cash";
      if (v38 == v39)
      {
      }
      else
      {
        v40 = v39;
        if (!v11 || !v39)
        {

          goto LABEL_60;
        }
        int v41 = [(__CFString *)v38 isEqualToString:v39];

        if (!v41)
        {
LABEL_60:
          v43 = v38;
          v44 = @"peerPaymentTopUp";
          if (v43 == v44)
          {
          }
          else
          {
            v45 = v44;
            if (!v11 || !v44)
            {

              goto LABEL_92;
            }
            int v46 = [(__CFString *)v43 isEqualToString:v44];

            if (!v46)
            {
LABEL_92:
              v62 = v43;
              v63 = @"peerPaymentVerifyIdentity";
              if (v62 == v63)
              {
              }
              else
              {
                v64 = v63;
                if (!v11 || !v63)
                {

LABEL_100:
                  v66 = v62;
                  v67 = @"peerPaymentTermsAcceptance";
                  if (v66 == v67)
                  {
                  }
                  else
                  {
                    v68 = v67;
                    if (!v11 || !v67)
                    {

                      goto LABEL_131;
                    }
                    int v69 = [(__CFString *)v66 isEqualToString:v67];

                    if (!v69)
                    {
LABEL_131:
                      v82 = v66;
                      v83 = @"peerPaymentSetup";
                      if (v82 == v83)
                      {
                      }
                      else
                      {
                        v84 = v83;
                        if (!v11 || !v83)
                        {

                          goto LABEL_148;
                        }
                        int v85 = [(__CFString *)v82 isEqualToString:v83];

                        if (!v85)
                        {
LABEL_148:
                          v94 = v82;
                          v95 = @"dailyCash";
                          if (v94 == v95)
                          {
                          }
                          else
                          {
                            v96 = v95;
                            if (!v11 || !v95)
                            {

                              goto LABEL_162;
                            }
                            int v97 = [(__CFString *)v94 isEqualToString:v95];

                            if (!v97)
                            {
LABEL_162:
                              v110 = v94;
                              v111 = @"credit";
                              if (v110 == v111)
                              {
                              }
                              else
                              {
                                v112 = v111;
                                if (!v11 || !v111)
                                {

                                  goto LABEL_175;
                                }
                                int v113 = [(__CFString *)v110 isEqualToString:v111];

                                if (!v113)
                                {
LABEL_175:
                                  v115 = v110;
                                  v116 = @"savings";
                                  if (v115 == v116)
                                  {
                                  }
                                  else
                                  {
                                    v117 = v116;
                                    if (!v11 || !v116)
                                    {

                                      goto LABEL_189;
                                    }
                                    int v118 = [(__CFString *)v115 isEqualToString:v116];

                                    if (!v118)
                                    {
LABEL_189:
                                      v121 = v115;
                                      v122 = v121;
                                      if (v121 == @"virtualCard")
                                      {
                                        int v123 = 1;
                                      }
                                      else
                                      {
                                        if (!v11 || !@"virtualCard")
                                        {

                                          BOOL v224 = v10 == 3;
                                          goto LABEL_221;
                                        }
                                        int v123 = [(__CFString *)v121 isEqualToString:@"virtualCard"];
                                      }

                                      BOOL v224 = v10 == 3;
                                      if (v123 && v10 == 3)
                                      {
                                        v131 = [v9 objectAtIndex:1];
                                        v8 = [v9 objectAtIndex:2];
                                        v132 = @"details";
                                        if (v8 == v132)
                                        {
                                        }
                                        else
                                        {
                                          v133 = v132;
                                          if (!v8 || !v132)
                                          {

                                            v160 = v8;
                                            goto LABEL_255;
                                          }
                                          int v134 = [v8 isEqualToString:v132];

                                          if (!v134) {
                                            goto LABEL_256;
                                          }
                                        }
                                        v159 = +[PKAccountService sharedInstance];
                                        v237[0] = MEMORY[0x1E4F143A8];
                                        v237[1] = 3221225472;
                                        v237[2] = __80__PKSettingsDeepLinkController_handleDeepLinkResourceDictionary_withCompletion___block_invoke_24;
                                        v237[3] = &unk_1E56E1AF0;
                                        v238 = v230;
                                        id v239 = WeakRetained;
                                        [v159 accountWithVirtualCardIdentifier:v131 completion:v237];

                                        v160 = v238;
LABEL_255:

LABEL_256:
LABEL_257:

LABEL_292:
                                        id v7 = v227;
                                        goto LABEL_293;
                                      }
LABEL_221:
                                      v139 = v122;
                                      v140 = @"setup";
                                      if (v139 == v140)
                                      {
                                      }
                                      else
                                      {
                                        v141 = v140;
                                        if (!v11 || !v140)
                                        {

                                          goto LABEL_234;
                                        }
                                        int v142 = [(__CFString *)v139 isEqualToString:v140];

                                        if (!v142)
                                        {
LABEL_234:
                                          v149 = v139;
                                          v150 = @"express_transit_settings";
                                          if (v149 == v150)
                                          {
                                          }
                                          else
                                          {
                                            v151 = v150;
                                            if (!v11 || !v150)
                                            {

LABEL_259:
                                              v162 = v149;
                                              v163 = @"importSafariCardConsent";
                                              if (v162 == v163)
                                              {
                                              }
                                              else
                                              {
                                                v164 = v163;
                                                if (!v11 || !v163)
                                                {

LABEL_297:
                                                  v178 = v162;
                                                  v179 = @"addPaymentCard";
                                                  if (v178 == v179)
                                                  {
                                                  }
                                                  else
                                                  {
                                                    v180 = v179;
                                                    if (!v11 || !v179)
                                                    {

LABEL_321:
                                                      if ([(__CFString *)v178 isEqual:@"payLaterFinancingPlan"])
                                                      {
                                                        v54 = [v6 objectForKeyedSubscript:@"transactionIdentifier"];
                                                        if (!v54)
                                                        {
                                                          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
                                                          {
                                                            *(_DWORD *)buf = 138412290;
                                                            id v247 = v6;
                                                            _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "PKPassbookDeepLinkController: Unhandled evaluation of Settings url from resource dictionary: %@\nPay Later financing plan was not defined on the URL", buf, 0xCu);
                                                          }
                                                        }
                                                        goto LABEL_372;
                                                      }
                                                      v198 = v178;
                                                      v199 = @"payLater";
                                                      if (v198 == v199) {
                                                        goto LABEL_367;
                                                      }
                                                      v200 = v199;
                                                      if (v11 && v199)
                                                      {
                                                        char v201 = [(__CFString *)v198 isEqualToString:v199];

                                                        if (v201) {
                                                          goto LABEL_368;
                                                        }
                                                      }
                                                      else
                                                      {
                                                      }
                                                      v205 = v198;
                                                      v206 = @"fps";
                                                      if (v205 == v206)
                                                      {
LABEL_367:
                                                      }
                                                      else
                                                      {
                                                        v207 = v206;
                                                        if (!v11 || !v206)
                                                        {

                                                          goto LABEL_376;
                                                        }
                                                        char v208 = [(__CFString *)v205 isEqualToString:v206];

                                                        if ((v208 & 1) == 0)
                                                        {
LABEL_376:
                                                          v212 = v205;
                                                          v213 = @"hide_my_email_settings";
                                                          if (v212 == v213)
                                                          {
                                                          }
                                                          else
                                                          {
                                                            v214 = v213;
                                                            if (!v11 || !v213)
                                                            {

                                                              goto LABEL_384;
                                                            }
                                                            int v215 = [(__CFString *)v212 isEqualToString:v213];

                                                            if (!v215)
                                                            {
LABEL_384:
                                                              v216 = v212;
                                                              v217 = @"bankConnect";
                                                              if (v216 == v217)
                                                              {
                                                              }
                                                              else
                                                              {
                                                                v218 = v217;
                                                                if (!v11 || !v217)
                                                                {

                                                                  goto LABEL_394;
                                                                }
                                                                int v219 = [(__CFString *)v216 isEqualToString:v217];

                                                                if (!v219)
                                                                {
LABEL_394:
                                                                  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
                                                                  {
                                                                    *(_DWORD *)buf = 138412290;
                                                                    id v247 = v6;
                                                                    _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "PKPassbookDeepLinkController: Unhandled evaluation of unexpected Settings URL in resource dictionary: %@", buf, 0xCu);
                                                                  }
                                                                  goto LABEL_291;
                                                                }
                                                              }
                                                              if (![v228 hasSuffix:@"/issuer/authorization"])
                                                              {
                                                                id v7 = v227;
                                                                v21 = WeakRetained;
                                                                v15 = v230;
                                                                if (!v225) {
                                                                  goto LABEL_127;
                                                                }
                                                                v222 = [v9 objectAtIndex:1];
                                                                if (v224)
                                                                {
                                                                  v223 = [v9 objectAtIndex:2];
                                                                }
                                                                else
                                                                {
                                                                  v223 = 0;
                                                                }
                                                                v21 = WeakRetained;
                                                                id v7 = v227;
                                                                [WeakRetained presentBankConnectManagementForInstitution:v222 accountIdentifier:v223 completion:v227];

                                                                goto LABEL_24;
                                                              }
                                                              v220 = (void *)MEMORY[0x1E4F1CB10];
                                                              v221 = [v6 objectForKeyedSubscript:@"redirectURL"];
                                                              v131 = [v220 URLWithString:v221];

                                                              if (v131)
                                                              {
                                                                [WeakRetained presentAuthorizationFlowWithRedirectURL:v131 completion:v227 animated:0];
                                                                goto LABEL_257;
                                                              }
                                                              if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                                                              {
                                                                *(_WORD *)buf = 0;
                                                                _os_log_error_impl(&dword_190E10000, v8, OS_LOG_TYPE_ERROR, "Failed to handle BankConnect auth redirect. The redirectURL is nil.", buf, 2u);
                                                              }
                                                              goto LABEL_256;
                                                            }
                                                          }
                                                          v131 = objc_loadWeakRetained((id *)&self->_delegate);
                                                          [v131 openTransactionDefaultsEmailSettings];
                                                          goto LABEL_257;
                                                        }
                                                      }
LABEL_368:
                                                      uint64_t v209 = [v9 indexOfObject:@"loan"];
                                                      if (v209 == 0x7FFFFFFFFFFFFFFFLL
                                                        || (uint64_t v210 = v209 + 1,
                                                            v209 + 1 >= (unint64_t)[v9 count]))
                                                      {
                                                        v54 = 0;
                                                      }
                                                      else
                                                      {
                                                        v54 = [v9 objectAtIndexedSubscript:v210];
                                                      }
LABEL_372:
                                                      v211 = self;
                                                      v21 = WeakRetained;
                                                      v15 = v230;
                                                      [(PKSettingsDeepLinkController *)v211 _presentPayLaterPassOrFinancingPlanWithIdenifier:v54 dataSource:v230 delegate:WeakRetained];
                                                      goto LABEL_125;
                                                    }
                                                    int v181 = [(__CFString *)v178 isEqualToString:v179];

                                                    if (!v181) {
                                                      goto LABEL_321;
                                                    }
                                                  }
                                                  v161 = objc_alloc_init(PKPaymentService);
                                                  [(PKPaymentService *)v161 clearSafariCardImportNotificationsWithCompletion:0];
                                                  v21 = WeakRetained;
                                                  [WeakRetained openPaymentSetupWithMode:0 referrerIdentifier:0 allowedFeatureIdentifiers:0];
                                                  goto LABEL_319;
                                                }
                                                int v165 = [(__CFString *)v162 isEqualToString:v163];

                                                if (!v165) {
                                                  goto LABEL_297;
                                                }
                                              }
                                              v161 = objc_alloc_init(PKPaymentService);
                                              [(PKPaymentService *)v161 clearSafariCardImportNotificationsWithCompletion:0];
                                              v21 = WeakRetained;
                                              [WeakRetained presentImportSafariCardConsentAnimated:1 completion:0];
LABEL_319:

                                              goto LABEL_23;
                                            }
                                            int v152 = [(__CFString *)v149 isEqualToString:v150];

                                            if (!v152) {
                                              goto LABEL_259;
                                            }
                                          }
                                          v161 = [v6 objectForKeyedSubscript:@"passUniqueID"];
                                          v21 = WeakRetained;
                                          [WeakRetained openExpressTransitSettingsForPassUniqueIdentifier:v161];
                                          goto LABEL_319;
                                        }
                                      }
                                      v143 = [v6 objectForKey:@"referrer"];
                                      v144 = [(PKSettingsDeepLinkController *)self _percentEncodeReferrerIdentifier:v143];

                                      if (v10 < 3)
                                      {
                                        uint64_t v154 = 0;
                                        v8 = 0;
LABEL_287:
                                        v175 = PKFeatureIdentifierToString(2);
                                        int v176 = [v8 containsObject:v175];

                                        if (v176)
                                        {
                                          v177 = +[PKAccountService sharedInstance];
                                          v231[0] = MEMORY[0x1E4F143A8];
                                          v231[1] = 3221225472;
                                          v231[2] = __80__PKSettingsDeepLinkController_handleDeepLinkResourceDictionary_withCompletion___block_invoke_3;
                                          v231[3] = &unk_1E56EEAF0;
                                          id v232 = v230;
                                          id v233 = WeakRetained;
                                          id v234 = v144;
                                          v235 = v8;
                                          uint64_t v236 = v154;
                                          [v177 defaultAccountForFeature:2 completion:v231];
                                        }
                                        else
                                        {
                                          [WeakRetained openPaymentSetupWithMode:v154 referrerIdentifier:v144 allowedFeatureIdentifiers:v8];
                                        }

LABEL_291:
                                        goto LABEL_292;
                                      }
                                      v145 = [v9 objectAtIndex:1];
                                      v146 = @"feature";
                                      if (v145 == v146)
                                      {
                                      }
                                      else
                                      {
                                        v147 = v146;
                                        if (!v145 || !v146)
                                        {

LABEL_282:
                                          uint64_t v154 = 0;
                                          goto LABEL_283;
                                        }
                                        int v148 = [(__CFString *)v145 isEqualToString:v146];

                                        if (!v148) {
                                          goto LABEL_282;
                                        }
                                      }
                                      uint64_t v154 = 4;
LABEL_283:
                                      v174 = [v9 objectAtIndex:2];
                                      if (PKFeatureIdentifierFromString(v174)) {
                                        v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v174, 0);
                                      }
                                      else {
                                        v8 = 0;
                                      }

                                      goto LABEL_287;
                                    }
                                  }
                                  if (v225)
                                  {
                                    v120 = [v9 objectAtIndex:1];
                                    if (v10 != 2)
                                    {
                                      v99 = [v9 objectAtIndex:2];
                                      goto LABEL_195;
                                    }
                                  }
                                  else
                                  {
                                    v120 = 0;
                                  }
                                  v99 = 0;
LABEL_195:
                                  v100 = v120;
                                  v124 = @"details";
                                  if (v100 == v124)
                                  {
                                  }
                                  else
                                  {
                                    v125 = v124;
                                    if (!v100 || !v124)
                                    {

                                      goto LABEL_215;
                                    }
                                    int v126 = [(__CFString *)v100 isEqualToString:v124];

                                    if (!v126)
                                    {
LABEL_215:
                                      v135 = v100;
                                      v136 = @"documents";
                                      if (v135 == v136)
                                      {
                                      }
                                      else
                                      {
                                        v137 = v136;
                                        if (!v100 || !v136)
                                        {

                                          goto LABEL_243;
                                        }
                                        char v138 = [(__CFString *)v135 isEqualToString:v136];

                                        if ((v138 & 1) == 0)
                                        {
LABEL_243:
                                          v155 = v135;
                                          v156 = @"addMoney";
                                          if (v155 == v156)
                                          {
                                          }
                                          else
                                          {
                                            v157 = v156;
                                            if (!v100 || !v156)
                                            {

                                              goto LABEL_272;
                                            }
                                            char v158 = [(__CFString *)v155 isEqualToString:v156];

                                            if ((v158 & 1) == 0)
                                            {
LABEL_272:
                                              v170 = v155;
                                              v171 = @"withdrawMoney";
                                              if (v170 == v171)
                                              {
                                              }
                                              else
                                              {
                                                v172 = v171;
                                                if (!v100 || !v171)
                                                {

LABEL_310:
                                                  v186 = v170;
                                                  v187 = @"fccStepUp";
                                                  if (v186 == v187)
                                                  {
                                                  }
                                                  else
                                                  {
                                                    v188 = v187;
                                                    if (!v100 || !v187)
                                                    {

LABEL_329:
                                                      v190 = v186;
                                                      v191 = @"bankVerification";
                                                      if (v190 == v191)
                                                      {

                                                        goto LABEL_347;
                                                      }
                                                      v192 = v191;
                                                      if (v100 && v191)
                                                      {
                                                        int v193 = [(__CFString *)v190 isEqualToString:v191];

                                                        if (!v193) {
                                                          goto LABEL_356;
                                                        }
LABEL_347:
                                                        if (v10 < 3)
                                                        {
                                                          v105 = 0;
                                                        }
                                                        else
                                                        {
                                                          v105 = [v9 objectAtIndex:2];
                                                        }
                                                        uint64_t v153 = 12;
                                                        goto LABEL_357;
                                                      }

                                                      goto LABEL_355;
                                                    }
                                                    char v189 = [(__CFString *)v186 isEqualToString:v187];

                                                    if ((v189 & 1) == 0) {
                                                      goto LABEL_329;
                                                    }
                                                  }
                                                  v105 = 0;
                                                  uint64_t v153 = 11;
LABEL_357:
                                                  id v7 = v227;
                                                  v21 = WeakRetained;
                                                  v15 = v230;
                                                  [WeakRetained presentAccountForFeature:5 destination:v153 fundingSourceIdentifier:v105 animated:1];
                                                  goto LABEL_358;
                                                }
                                                char v173 = [(__CFString *)v170 isEqualToString:v171];

                                                if ((v173 & 1) == 0) {
                                                  goto LABEL_310;
                                                }
                                              }
                                              v105 = 0;
                                              uint64_t v153 = 3;
                                              goto LABEL_357;
                                            }
                                          }
                                          v105 = 0;
                                          uint64_t v153 = 2;
                                          goto LABEL_357;
                                        }
                                      }
                                      v105 = 0;
                                      uint64_t v153 = 6;
                                      goto LABEL_357;
                                    }
                                  }
                                  if (!v99) {
                                    goto LABEL_356;
                                  }
                                  v127 = v99;
                                  v128 = @"addBankAccount";
                                  if (v127 == v128)
                                  {
                                  }
                                  else
                                  {
                                    v129 = v128;
                                    if (!v128)
                                    {

                                      goto LABEL_267;
                                    }
                                    char v130 = [(__CFString *)v127 isEqualToString:v128];

                                    if ((v130 & 1) == 0)
                                    {
LABEL_267:
                                      v166 = v127;
                                      v167 = @"accountInfo";
                                      if (v166 == v167)
                                      {
                                      }
                                      else
                                      {
                                        v168 = v167;
                                        if (!v167)
                                        {

                                          goto LABEL_305;
                                        }
                                        char v169 = [(__CFString *)v166 isEqualToString:v167];

                                        if ((v169 & 1) == 0)
                                        {
LABEL_305:
                                          v182 = v166;
                                          v183 = @"businessChat";
                                          if (v182 == v183)
                                          {
                                          }
                                          else
                                          {
                                            v184 = v183;
                                            if (!v183)
                                            {

                                              goto LABEL_335;
                                            }
                                            char v185 = [(__CFString *)v182 isEqualToString:v183];

                                            if ((v185 & 1) == 0)
                                            {
LABEL_335:
                                              v194 = v182;
                                              v195 = @"accountNumbers";
                                              if (v194 == v195)
                                              {
                                              }
                                              else
                                              {
                                                v196 = v195;
                                                if (!v195)
                                                {

LABEL_351:
                                                  v190 = v194;
                                                  v202 = @"addBeneficiary";
                                                  if (v190 == v202)
                                                  {

                                                    goto LABEL_374;
                                                  }
                                                  v203 = v202;
                                                  if (!v202)
                                                  {
LABEL_355:

                                                    goto LABEL_356;
                                                  }
                                                  int v204 = [(__CFString *)v190 isEqualToString:v202];

                                                  if (v204)
                                                  {
LABEL_374:
                                                    v105 = 0;
                                                    uint64_t v153 = 13;
                                                    goto LABEL_357;
                                                  }
LABEL_356:
                                                  v105 = 0;
                                                  uint64_t v153 = 1;
                                                  goto LABEL_357;
                                                }
                                                char v197 = [(__CFString *)v194 isEqualToString:v195];

                                                if ((v197 & 1) == 0) {
                                                  goto LABEL_351;
                                                }
                                              }
                                              v105 = 0;
                                              uint64_t v153 = 10;
                                              goto LABEL_357;
                                            }
                                          }
                                          v105 = 0;
                                          uint64_t v153 = 7;
                                          goto LABEL_357;
                                        }
                                      }
                                      v105 = 0;
                                      uint64_t v153 = 5;
                                      goto LABEL_357;
                                    }
                                  }
                                  v105 = 0;
                                  uint64_t v153 = 4;
                                  goto LABEL_357;
                                }
                              }
                              v114 = +[PKAccountService sharedInstance];
                              v240[0] = MEMORY[0x1E4F143A8];
                              v240[1] = 3221225472;
                              v240[2] = __80__PKSettingsDeepLinkController_handleDeepLinkResourceDictionary_withCompletion___block_invoke;
                              v240[3] = &unk_1E56EEAF0;
                              id v241 = v6;
                              v15 = v230;
                              id v242 = v230;
                              unint64_t v245 = v10;
                              id v243 = v9;
                              v21 = WeakRetained;
                              id v244 = WeakRetained;
                              [v114 defaultAccountForFeature:2 completion:v240];

                              goto LABEL_126;
                            }
                          }
                          v98 = [v6 objectForKeyedSubscript:@"date"];
                          v99 = v98;
                          if (!v98) {
                            goto LABEL_157;
                          }
                          _PKParseW3CDTSCompleteDatePlusHoursMinutesAndOptionalSeconds(v98, 0, 0);
                          v100 = (__CFString *)objc_claimAutoreleasedReturnValue();
                          if (!v100)
                          {
                            id v101 = objc_alloc_init(MEMORY[0x1E4F28D48]);
                            [v101 setFormatOptions:275];
                            v102 = [MEMORY[0x1E4F1C9A8] currentCalendar];
                            v103 = [v102 timeZone];
                            [v101 setTimeZone:v103];

                            v100 = [v101 dateFromString:v99];

                            if (!v100)
                            {
LABEL_157:
                              v100 = [MEMORY[0x1E4F1C9C8] date];
                            }
                          }
                          v104 = [MEMORY[0x1E4F1C9A8] currentCalendar];
                          v105 = [v104 components:30 fromDate:v100];

                          v106 = [v6 objectForKeyedSubscript:@"redemptionType"];
                          unint64_t v107 = [v106 integerValue];

                          BOOL v108 = v107 == 3;
                          v15 = v230;
                          if (v107 >= 3)
                          {
                            id v7 = v227;
                            v21 = WeakRetained;
                            if (v108) {
                              [WeakRetained openDailyCashForDateComponents:v105 feature:5];
                            }
                          }
                          else
                          {
                            v109 = [v6 objectForKeyedSubscript:@"passUniqueID"];
                            id v7 = v227;
                            if (v109) {
                              [v230 paymentPassWithUniqueIdentifier:v109];
                            }
                            else {
                            v119 = [v230 peerPaymentPass];
                            }
                            if (!v119)
                            {

LABEL_293:
                              v21 = WeakRetained;
                              goto LABEL_24;
                            }
                            [WeakRetained openDailyCashForDateComponents:v105 onPass:v119];

                            v21 = WeakRetained;
                            v15 = v230;
                          }
LABEL_358:

                          goto LABEL_127;
                        }
                      }
                      uint64_t v86 = [v6 objectForKeyedSubscript:@"setupAmount"];
                      v87 = [v6 objectForKeyedSubscript:@"setupCurreny"];
                      v88 = [v6 objectForKeyedSubscript:@"setupFlowState"];
                      uint64_t v89 = PKPeerPaymentRegistrationFlowStateFromString(v88);

                      v90 = [v6 objectForKeyedSubscript:@"setupSenderAddress"];
                      v226 = (void *)v86;
                      v91 = [MEMORY[0x1E4F28C28] decimalNumberWithString:v86];
                      v92 = v91;
                      v93 = 0;
                      if (v91)
                      {
                        id v7 = v227;
                        if (v87)
                        {
                          v93 = PKCurrencyAmountCreate(v91, v87, 0);
                        }
                      }
                      else
                      {
                        id v7 = v227;
                      }
                      v21 = WeakRetained;
                      [WeakRetained openPeerPaymentSetupWithCurrencyAmount:v93 state:v89 senderAddress:v90];

                      goto LABEL_24;
                    }
                  }
                  v15 = v230;
                  v54 = [v230 peerPaymentPass];
                  v21 = WeakRetained;
                  v55 = WeakRetained;
                  v56 = v54;
                  uint64_t v57 = 3;
LABEL_124:
                  [v55 presentPassDetailsViewControllerForPass:v56 presentationStyle:2 presentingView:v57 animated:0];
LABEL_125:

LABEL_126:
                  id v7 = v227;
                  goto LABEL_127;
                }
                int v65 = [(__CFString *)v62 isEqualToString:v63];

                if (!v65) {
                  goto LABEL_100;
                }
              }
              v15 = v230;
              v54 = [v230 peerPaymentPass];
              v21 = WeakRetained;
              v55 = WeakRetained;
              v56 = v54;
              uint64_t v57 = 5;
              goto LABEL_124;
            }
          }
          v15 = v230;
          v54 = [v230 peerPaymentPass];
          v21 = WeakRetained;
          v55 = WeakRetained;
          v56 = v54;
          uint64_t v57 = 4;
          goto LABEL_124;
        }
      }
      if ((unint64_t)[v9 count] < 2)
      {
        v42 = 0;
      }
      else
      {
        v42 = [v9 objectAtIndex:1];
      }
      id v7 = v227;
      v15 = v230;
      v16 = v42;
      v47 = @"autoReload";
      if (v16 == v47)
      {
      }
      else
      {
        v48 = v47;
        if (!v16 || !v47)
        {

          goto LABEL_81;
        }
        int v49 = [(__CFString *)v16 isEqualToString:v47];

        if (!v49)
        {
LABEL_81:
          if (!v225) {
            goto LABEL_109;
          }
          v58 = [v9 objectAtIndex:1];
          v59 = @"recurringPayment";
          if (v58 == v59)
          {
          }
          else
          {
            v60 = v59;
            if (!v58 || !v59)
            {

              goto LABEL_109;
            }
            int v61 = [(__CFString *)v58 isEqualToString:v59];

            if (!v61)
            {
LABEL_109:
              v70 = v16;
              v71 = @"cardInformation";
              if (v70 == v71)
              {
              }
              else
              {
                v72 = v71;
                if (!v16 || !v71)
                {

                  goto LABEL_117;
                }
                int v73 = [(__CFString *)v70 isEqualToString:v71];

                if (!v73)
                {
LABEL_117:
                  v77 = v70;
                  v78 = @"transferToBank";
                  if (v77 == v78)
                  {
                  }
                  else
                  {
                    v79 = v78;
                    if (!v16 || !v78)
                    {

LABEL_139:
                      v53 = [v230 peerPaymentPass];
                      v21 = WeakRetained;
                      v74 = WeakRetained;
                      v75 = v53;
                      uint64_t v76 = 0;
                      goto LABEL_140;
                    }
                    int v80 = [(__CFString *)v77 isEqualToString:v78];

                    if (!v80) {
                      goto LABEL_139;
                    }
                  }
                  v53 = [v230 peerPaymentPass];
                  v21 = WeakRetained;
                  [WeakRetained presentPeerPaymentTransferToBankWithPass:v53];
LABEL_141:
                  id v7 = v227;
                  goto LABEL_142;
                }
              }
              v53 = [v230 peerPaymentPass];
              v21 = WeakRetained;
              v74 = WeakRetained;
              v75 = v53;
              uint64_t v76 = 1;
LABEL_140:
              [v74 presentPassDetailsViewControllerForPass:v75 presentationStyle:2 presentingView:v76 animated:1];
              goto LABEL_141;
            }
          }
          if (v10 < 3)
          {
            v53 = 0;
          }
          else
          {
            v53 = [v9 objectAtIndex:2];
          }
          id v7 = v227;
          v21 = WeakRetained;
          v81 = [v230 peerPaymentPass];
          [WeakRetained presentPeerPaymentRecurringPaymentWithPass:v81 presentationStyle:2 recurringPaymentIdentifier:v53 animated:1];

          goto LABEL_142;
        }
      }
      v53 = [v230 peerPaymentPass];
      v21 = WeakRetained;
      [WeakRetained presentPassDetailsViewControllerForPass:v53 presentationStyle:2 presentingView:16 animated:1];
LABEL_142:

      goto LABEL_20;
    }
  }
  v35 = [v6 objectForKeyedSubscript:@"transactionIdentifier"];
  v36 = [v6 objectForKeyedSubscript:@"serviceIdentifier"];
  v37 = [v6 objectForKeyedSubscript:@"transactionSourceIdentifier"];
  if ([v35 length])
  {
    [(PKSettingsDeepLinkController *)self _presentTransactionDetailsForTransactionWithIdentifier:v35];
    id v7 = v227;
  }
  else
  {
    id v7 = v227;
    if ([v36 length])
    {
      [(PKSettingsDeepLinkController *)self _presentTransactionDetailsForTransactionWithServiceIdentifier:v36 transactionSourceIdentifier:v37];
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v247 = v6;
        _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "PKPassbookDeepLinkController: Unhandled evaluation of Settings transaction url. Couldn't find transactionID or serviceID. Resource dictionary: %@", buf, 0xCu);
      }
    }
  }
  v15 = v230;

  v21 = WeakRetained;
LABEL_127:
}

void __80__PKSettingsDeepLinkController_handleDeepLinkResourceDictionary_withCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __80__PKSettingsDeepLinkController_handleDeepLinkResourceDictionary_withCompletion___block_invoke_21;
    v11[3] = &unk_1E56EE7E8;
    v12 = v5;
    id v13 = *(id *)(a1 + 40);
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 64);
    id v14 = v7;
    uint64_t v17 = v8;
    id v15 = *(id *)(a1 + 48);
    id v16 = *(id *)(a1 + 56);
    dispatch_async(MEMORY[0x1E4F14428], v11);

    v9 = v12;
  }
  else
  {
    v9 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v19 = v10;
      __int16 v20 = 2112;
      id v21 = v6;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "PKPassbookDeepLinkController: Unhandled evaluation of Settings url from resource dictionary: %@\nApple Card account returned nil with error: %@", buf, 0x16u);
    }
  }
}

void __80__PKSettingsDeepLinkController_handleDeepLinkResourceDictionary_withCompletion___block_invoke_21(uint64_t a1)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) associatedPassUniqueID];
  v3 = [*(id *)(a1 + 40) paymentPassWithUniqueIdentifier:v2];
  if (!v3)
  {
    uint64_t v8 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 48);
      int v56 = 138412290;
      uint64_t v57 = v9;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "PKPassbookDeepLinkController: Unhandled evaluation of Settings url from resource dictionary: %@\nApple Card account pass was nil", (uint8_t *)&v56, 0xCu);
    }
    goto LABEL_112;
  }
  PKSetPassDetailsLastSelectedSegment(@"info");
  if (*(void *)(a1 + 72) <= 1uLL)
  {
    v4 = @"details";
    goto LABEL_11;
  }
  v4 = [*(id *)(a1 + 56) objectAtIndex:1];
  id v5 = @"details";
  if (v4 == v5)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v6 = v5;
  if (!v4 || !v5)
  {

    goto LABEL_20;
  }
  int v7 = [(__CFString *)v4 isEqualToString:v5];

  if (v7)
  {
LABEL_12:
    uint64_t v8 = v4;
    if (*(void *)(a1 + 72) < 3uLL)
    {
      uint64_t v14 = 0;
LABEL_110:
      uint64_t v22 = *(void **)(a1 + 64);
      v23 = v3;
      uint64_t v24 = v14;
      uint64_t v32 = 1;
      goto LABEL_111;
    }
    uint64_t v10 = [*(id *)(a1 + 56) objectAtIndex:2];
    objc_super v11 = @"makeDefaultAtApple";
    if (v10 == v11)
    {
    }
    else
    {
      v12 = v11;
      if (!v10 || !v11)
      {

        goto LABEL_28;
      }
      char v13 = [(__CFString *)v10 isEqualToString:v11];

      if ((v13 & 1) == 0)
      {
LABEL_28:
        v18 = v10;
        uint64_t v19 = @"scheduledPayments";
        if (v18 == v19)
        {
        }
        else
        {
          __int16 v20 = v19;
          if (!v10 || !v19)
          {

            goto LABEL_44;
          }
          char v21 = [(__CFString *)v18 isEqualToString:v19];

          if ((v21 & 1) == 0)
          {
LABEL_44:
            v28 = v18;
            v29 = @"order";
            if (v28 == v29)
            {
            }
            else
            {
              int v30 = v29;
              if (!v10 || !v29)
              {

                goto LABEL_61;
              }
              char v31 = [(__CFString *)v28 isEqualToString:v29];

              if ((v31 & 1) == 0)
              {
LABEL_61:
                v36 = v28;
                v37 = @"replace";
                if (v36 == v37)
                {
                }
                else
                {
                  v38 = v37;
                  if (!v10 || !v37)
                  {

                    goto LABEL_80;
                  }
                  char v39 = [(__CFString *)v36 isEqualToString:v37];

                  if ((v39 & 1) == 0)
                  {
LABEL_80:
                    v44 = v36;
                    v45 = @"track";
                    if (v44 == v45)
                    {
                    }
                    else
                    {
                      int v46 = v45;
                      if (!v10 || !v45)
                      {

LABEL_96:
                        v51 = v44;
                        uint64_t v52 = @"activate";
                        if (v51 == v52)
                        {
                        }
                        else
                        {
                          v53 = v52;
                          if (!v10 || !v52)
                          {

LABEL_108:
                            uint64_t v14 = 0;
                            goto LABEL_109;
                          }
                          int v54 = [(__CFString *)v51 isEqualToString:v52];

                          if (!v54) {
                            goto LABEL_108;
                          }
                        }
                        uint64_t v14 = 13;
LABEL_109:

                        goto LABEL_110;
                      }
                      char v47 = [(__CFString *)v44 isEqualToString:v45];

                      if ((v47 & 1) == 0) {
                        goto LABEL_96;
                      }
                    }
                    uint64_t v14 = 14;
                    goto LABEL_109;
                  }
                }
                uint64_t v14 = 17;
                goto LABEL_109;
              }
            }
            uint64_t v14 = 12;
            goto LABEL_109;
          }
        }
        uint64_t v14 = 6;
        goto LABEL_109;
      }
    }
    uint64_t v14 = 11;
    goto LABEL_109;
  }
LABEL_20:
  uint64_t v8 = v4;
  id v15 = @"balance";
  if (v8 == v15)
  {

    goto LABEL_34;
  }
  id v16 = v15;
  if (!v4 || !v15)
  {

    goto LABEL_36;
  }
  int v17 = [v8 isEqualToString:v15];

  if (v17)
  {
LABEL_34:
    uint64_t v22 = *(void **)(a1 + 64);
    v23 = v3;
    uint64_t v24 = 7;
LABEL_51:
    uint64_t v32 = 0;
LABEL_111:
    [v22 presentPassDetailsViewControllerForPass:v23 presentationStyle:2 presentingView:v24 animated:v32];
    goto LABEL_112;
  }
LABEL_36:
  uint64_t v8 = v8;
  int v25 = @"billPayment";
  if (v8 == v25)
  {

LABEL_50:
    uint64_t v22 = *(void **)(a1 + 64);
    v23 = v3;
    uint64_t v24 = 9;
    goto LABEL_51;
  }
  BOOL v26 = v25;
  if (!v4 || !v25)
  {

    goto LABEL_53;
  }
  int v27 = [v8 isEqualToString:v25];

  if (v27) {
    goto LABEL_50;
  }
LABEL_53:
  uint64_t v8 = v8;
  v33 = @"statement";
  if (v8 == v33)
  {

LABEL_67:
    if (*(void *)(a1 + 72) >= 3uLL)
    {
      v40 = [*(id *)(a1 + 56) objectAtIndex:2];
      [*(id *)(a1 + 64) presentStatementDetailsViewControllerForPass:v3 presentationStyle:2 withIdentifier:v40 animated:0];
LABEL_104:

      goto LABEL_112;
    }
    goto LABEL_70;
  }
  int v34 = v33;
  if (!v4 || !v33)
  {

    goto LABEL_70;
  }
  int v35 = [v8 isEqualToString:v33];

  if (v35) {
    goto LABEL_67;
  }
LABEL_70:
  uint64_t v8 = v8;
  int v41 = @"installment";
  if (v8 == v41)
  {

    goto LABEL_78;
  }
  v42 = v41;
  if (v4 && v41)
  {
    int v43 = [v8 isEqualToString:v41];

    if (!v43) {
      goto LABEL_86;
    }
LABEL_78:
    [*(id *)(a1 + 64) presentInstallmentPlansDetailsViewControllerForPass:v3 presentationStyle:2 forFeature:2 animated:0];
    goto LABEL_112;
  }

LABEL_86:
  uint64_t v8 = v8;
  v48 = @"numbers";
  if (v8 == v48)
  {
  }
  else
  {
    int v49 = v48;
    if (!v4 || !v48)
    {

      goto LABEL_102;
    }
    int v50 = [v8 isEqualToString:v48];

    if (!v50)
    {
LABEL_102:
      v40 = PKLogFacilityTypeGetObject(0);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v55 = *(void *)(a1 + 48);
        int v56 = 138412546;
        uint64_t v57 = v55;
        __int16 v58 = 2112;
        v59 = v8;
        _os_log_impl(&dword_190E10000, v40, OS_LOG_TYPE_DEFAULT, "PKPassbookDeepLinkController: Failed to handle url from resource dictionary: %@\nApple Card destination (%@) is not supported.", (uint8_t *)&v56, 0x16u);
      }
      goto LABEL_104;
    }
  }
  [*(id *)(a1 + 64) presentCreditPaymentPassNumbersViewControllerForPass:v3 presentationStyle:2 animated:0];
LABEL_112:
}

void __80__PKSettingsDeepLinkController_handleDeepLinkResourceDictionary_withCompletion___block_invoke_24(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__PKSettingsDeepLinkController_handleDeepLinkResourceDictionary_withCompletion___block_invoke_2;
  block[3] = &unk_1E56D8AB8;
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __80__PKSettingsDeepLinkController_handleDeepLinkResourceDictionary_withCompletion___block_invoke_2(id *a1)
{
  id v5 = [a1[4] associatedPassUniqueID];
  uint64_t v2 = [v5 length];
  id v3 = v5;
  if (v2)
  {
    id v4 = [a1[5] paymentPassWithUniqueIdentifier:v5];
    if (v4)
    {
      [a1[6] presentPassDetailsViewControllerForPass:v4 presentationStyle:1 presentingView:0 animated:0];
    }
    else if (PKSecureElementIsAvailable())
    {
      [a1[6] presentAppleCardUpsellAlertForAccount:a1[4]];
    }

    id v3 = v5;
  }
}

void __80__PKSettingsDeepLinkController_handleDeepLinkResourceDictionary_withCompletion___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__PKSettingsDeepLinkController_handleDeepLinkResourceDictionary_withCompletion___block_invoke_4;
  v7[3] = &unk_1E56EE7E8;
  id v8 = v3;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  id v12 = v4;
  uint64_t v13 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __80__PKSettingsDeepLinkController_handleDeepLinkResourceDictionary_withCompletion___block_invoke_4(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  if (v2)
  {
    id v3 = (void *)a1[5];
    id v4 = [v2 associatedPassUniqueID];
    id v10 = [v3 paymentPassWithUniqueIdentifier:v4];

    uint64_t v5 = (void *)a1[6];
    if (v10) {
      [v5 presentPassDetailsViewControllerForPass:v10 presentationStyle:1 presentingView:0 animated:1];
    }
    else {
      [v5 openPaymentSetupWithMode:0 referrerIdentifier:a1[7] allowedFeatureIdentifiers:a1[8]];
    }
  }
  else
  {
    id v6 = (void *)a1[6];
    uint64_t v7 = a1[7];
    uint64_t v9 = a1[8];
    uint64_t v8 = a1[9];
    [v6 openPaymentSetupWithMode:v8 referrerIdentifier:v7 allowedFeatureIdentifiers:v9];
  }
}

- (void)_presentTransactionDetailsForTransactionWithIdentifier:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v4;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "PKPassbookDeepLinkController: Preparing for presentation of transaction details for transactionID %@", buf, 0xCu);
    }

    id v6 = objc_alloc_init(PKPaymentService);
    objc_initWeak((id *)buf, self);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __87__PKSettingsDeepLinkController__presentTransactionDetailsForTransactionWithIdentifier___block_invoke;
    v10[3] = &unk_1E56EEB40;
    objc_copyWeak(&v13, (id *)buf);
    uint64_t v8 = v6;
    id v11 = v8;
    id v9 = WeakRetained;
    id v12 = v9;
    [(PKPaymentService *)v8 transactionWithTransactionIdentifier:v4 completion:v10];

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
  }
}

void __87__PKSettingsDeepLinkController__presentTransactionDetailsForTransactionWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = [v3 transactionSourceIdentifier];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __87__PKSettingsDeepLinkController__presentTransactionDetailsForTransactionWithIdentifier___block_invoke_2;
    v7[3] = &unk_1E56EEB18;
    id v8 = *(id *)(a1 + 40);
    id v9 = v3;
    [v5 transactionSourceTypeForTransactionSourceIdentifier:v6 completion:v7];
  }
}

void __87__PKSettingsDeepLinkController__presentTransactionDetailsForTransactionWithIdentifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__PKSettingsDeepLinkController__presentTransactionDetailsForTransactionWithIdentifier___block_invoke_3;
  block[3] = &unk_1E56DF798;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = a2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __87__PKSettingsDeepLinkController__presentTransactionDetailsForTransactionWithIdentifier___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentTransactionDetailsForTransaction:*(void *)(a1 + 40) transactionSourceType:*(void *)(a1 + 48)];
}

- (void)_presentTransactionDetailsForTransactionWithServiceIdentifier:(id)a3 transactionSourceIdentifier:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v6;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v7;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "PKPassbookDeepLinkController: Preparing for presentation of transaction details for serviceIdentifier %@, transactionSourceIdentifier %@", buf, 0x16u);
    }

    objc_initWeak(&location, self);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v34[0] = 0;
    v34[1] = v34;
    v34[2] = 0x2020000000;
    v34[3] = 0;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v37 = __Block_byref_object_copy__56;
    v38 = __Block_byref_object_dispose__56;
    id v39 = 0;
    id v10 = objc_alloc_init(PKPaymentService);
    id v11 = dispatch_group_create();
    dispatch_group_enter(v11);
    dispatch_group_enter(v11);
    if (v7)
    {
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __122__PKSettingsDeepLinkController__presentTransactionDetailsForTransactionWithServiceIdentifier_transactionSourceIdentifier___block_invoke;
      v31[3] = &unk_1E56EEB68;
      id v12 = &v33;
      objc_copyWeak(&v33, &location);
      v32[1] = v34;
      id v13 = v11;
      v32[0] = v13;
      [(PKPaymentService *)v10 transactionSourceTypeForTransactionSourceIdentifier:v7 completion:v31];
      dispatch_group_enter(v13);
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __122__PKSettingsDeepLinkController__presentTransactionDetailsForTransactionWithServiceIdentifier_transactionSourceIdentifier___block_invoke_2;
      v27[3] = &unk_1E56EEB90;
      objc_copyWeak(&v30, &location);
      v29 = buf;
      v28 = v13;
      [(PKPaymentService *)v10 transactionWithServiceIdentifier:v6 transactionSourceIdentifier:v7 completion:v27];

      objc_destroyWeak(&v30);
      uint64_t v14 = (id *)v32;
    }
    else
    {
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __122__PKSettingsDeepLinkController__presentTransactionDetailsForTransactionWithServiceIdentifier_transactionSourceIdentifier___block_invoke_3;
      v20[3] = &unk_1E56EEBB8;
      id v12 = &v26;
      objc_copyWeak(&v26, &location);
      uint64_t v24 = buf;
      char v21 = v10;
      id v22 = 0;
      int v25 = v34;
      v23 = v11;
      [(PKPaymentService *)v21 ambiguousTransactionWithServiceIdentifier:v6 completion:v20];

      uint64_t v14 = (id *)&v21;
    }

    objc_destroyWeak(v12);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __122__PKSettingsDeepLinkController__presentTransactionDetailsForTransactionWithServiceIdentifier_transactionSourceIdentifier___block_invoke_5;
    v16[3] = &unk_1E56EEBE0;
    id v17 = WeakRetained;
    v18 = buf;
    uint64_t v19 = v34;
    id v15 = WeakRetained;
    dispatch_group_notify(v11, MEMORY[0x1E4F14428], v16);

    _Block_object_dispose(buf, 8);
    _Block_object_dispose(v34, 8);
    objc_destroyWeak(&location);
  }
}

void __122__PKSettingsDeepLinkController__presentTransactionDetailsForTransactionWithServiceIdentifier_transactionSourceIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __122__PKSettingsDeepLinkController__presentTransactionDetailsForTransactionWithServiceIdentifier_transactionSourceIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __122__PKSettingsDeepLinkController__presentTransactionDetailsForTransactionWithServiceIdentifier_transactionSourceIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  if (WeakRetained) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
  }
  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __122__PKSettingsDeepLinkController__presentTransactionDetailsForTransactionWithServiceIdentifier_transactionSourceIdentifier___block_invoke_4;
  v8[3] = &unk_1E56EEB68;
  objc_copyWeak(&v11, (id *)(a1 + 72));
  uint64_t v10 = *(void *)(a1 + 64);
  id v9 = *(id *)(a1 + 48);
  [v6 transactionSourceTypeForTransactionSourceIdentifier:v7 completion:v8];

  objc_destroyWeak(&v11);
}

void __122__PKSettingsDeepLinkController__presentTransactionDetailsForTransactionWithServiceIdentifier_transactionSourceIdentifier___block_invoke_4(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __122__PKSettingsDeepLinkController__presentTransactionDetailsForTransactionWithServiceIdentifier_transactionSourceIdentifier___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentTransactionDetailsForTransaction:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) transactionSourceType:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
}

- (id)_percentEncodeReferrerIdentifier:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F28B88];
  id v4 = a3;
  id v5 = [v3 URLQueryAllowedCharacterSet];
  id v6 = (void *)[v5 mutableCopy];

  [v6 removeCharactersInString:@"=&"];
  uint64_t v7 = [v4 stringByAddingPercentEncodingWithAllowedCharacters:v6];

  return v7;
}

- (void)_presentPayLaterPassOrFinancingPlanWithIdenifier:(id)a3 dataSource:(id)a4 delegate:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = objc_alloc_init(PKAsyncUnaryOperationComposer);
  id v11 = +[PKAccountService sharedInstance];
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__56;
  v37[4] = __Block_byref_object_dispose__56;
  id v38 = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3032000000;
  v35[3] = __Block_byref_object_copy__56;
  v35[4] = __Block_byref_object_dispose__56;
  id v36 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x3032000000;
  v33[3] = __Block_byref_object_copy__56;
  v33[4] = __Block_byref_object_dispose__56;
  id v34 = 0;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __101__PKSettingsDeepLinkController__presentPayLaterPassOrFinancingPlanWithIdenifier_dataSource_delegate___block_invoke;
  v28[3] = &unk_1E56E11B8;
  id v12 = v11;
  id v29 = v12;
  char v31 = v33;
  uint64_t v32 = v37;
  id v13 = v8;
  id v30 = v13;
  [(PKAsyncUnaryOperationComposer *)v10 addOperation:v28];
  if (v7)
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __101__PKSettingsDeepLinkController__presentPayLaterPassOrFinancingPlanWithIdenifier_dataSource_delegate___block_invoke_35;
    v24[3] = &unk_1E56E0F90;
    id v25 = v12;
    id v26 = v7;
    int v27 = v35;
    [(PKAsyncUnaryOperationComposer *)v10 addOperation:v24];
  }
  uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __101__PKSettingsDeepLinkController__presentPayLaterPassOrFinancingPlanWithIdenifier_dataSource_delegate___block_invoke_40;
  v18[3] = &unk_1E56EECA8;
  char v21 = v33;
  id v15 = v7;
  id v19 = v15;
  id v22 = v37;
  v23 = v35;
  id v16 = v9;
  id v20 = v16;
  id v17 = [(PKAsyncUnaryOperationComposer *)v10 evaluateWithInput:v14 completion:v18];

  _Block_object_dispose(v33, 8);
  _Block_object_dispose(v35, 8);

  _Block_object_dispose(v37, 8);
}

void __101__PKSettingsDeepLinkController__presentPayLaterPassOrFinancingPlanWithIdenifier_dataSource_delegate___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __101__PKSettingsDeepLinkController__presentPayLaterPassOrFinancingPlanWithIdenifier_dataSource_delegate___block_invoke_2;
  v11[3] = &unk_1E56EEC30;
  id v14 = v7;
  id v12 = v6;
  long long v15 = *(_OWORD *)(a1 + 48);
  id v8 = *(void **)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  id v9 = v6;
  id v10 = v7;
  [v8 defaultAccountForFeature:3 completion:v11];
}

void __101__PKSettingsDeepLinkController__presentPayLaterPassOrFinancingPlanWithIdenifier_dataSource_delegate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __101__PKSettingsDeepLinkController__presentPayLaterPassOrFinancingPlanWithIdenifier_dataSource_delegate___block_invoke_3;
  v5[3] = &unk_1E56EEC08;
  id v6 = v3;
  id v9 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 32);
  long long v10 = *(_OWORD *)(a1 + 56);
  id v8 = *(id *)(a1 + 40);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __101__PKSettingsDeepLinkController__presentPayLaterPassOrFinancingPlanWithIdenifier_dataSource_delegate___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (!v2)
  {
    long long v10 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = 0;
      id v11 = "PKPassbookDeepLinkController: Pay later account is nil";
      id v12 = (uint8_t *)&v14;
LABEL_10:
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, v11, v12, 2u);
    }
LABEL_11:

    return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))(*(void *)(a1 + 56));
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v2);
  id v3 = *(void **)(a1 + 48);
  id v4 = [*(id *)(a1 + 32) associatedPassUniqueID];
  uint64_t v5 = [v3 paymentPassWithUniqueIdentifier:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 72) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    long long v10 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = 0;
      id v11 = "PKPassbookDeepLinkController: Pay Later pass was nil";
      id v12 = (uint8_t *)&v13;
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  id v8 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  return v8();
}

void __101__PKSettingsDeepLinkController__presentPayLaterPassOrFinancingPlanWithIdenifier_dataSource_delegate___block_invoke_35(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v9 = (void *)a1[4];
  id v8 = (void *)a1[5];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __101__PKSettingsDeepLinkController__presentPayLaterPassOrFinancingPlanWithIdenifier_dataSource_delegate___block_invoke_2_36;
  v13[3] = &unk_1E56EEC80;
  id v14 = v8;
  id v15 = v6;
  uint64_t v10 = a1[6];
  id v16 = v7;
  uint64_t v17 = v10;
  id v11 = v6;
  id v12 = v7;
  [v9 financingPlanForPlanIdentifier:v14 completion:v13];
}

void __101__PKSettingsDeepLinkController__presentPayLaterPassOrFinancingPlanWithIdenifier_dataSource_delegate___block_invoke_2_36(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __101__PKSettingsDeepLinkController__presentPayLaterPassOrFinancingPlanWithIdenifier_dataSource_delegate___block_invoke_3_37;
  block[3] = &unk_1E56EEC58;
  id v8 = v3;
  id v9 = *(id *)(a1 + 32);
  id v11 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 56);
  id v10 = v4;
  uint64_t v12 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __101__PKSettingsDeepLinkController__presentPayLaterPassOrFinancingPlanWithIdenifier_dataSource_delegate___block_invoke_3_37(void *a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)a1[4];
  if (v2)
  {
    objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), v2);
    id v3 = *(uint64_t (**)(void))(a1[7] + 16);
    return v3();
  }
  else
  {
    uint64_t v5 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = a1[5];
      int v7 = 138412290;
      uint64_t v8 = v6;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "PKPassbookDeepLinkController: There is no pay later financing plan with identifier: %@", (uint8_t *)&v7, 0xCu);
    }

    return (*(uint64_t (**)(void))(a1[7] + 16))();
  }
}

void __101__PKSettingsDeepLinkController__presentPayLaterPassOrFinancingPlanWithIdenifier_dataSource_delegate___block_invoke_40(void *a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v2 = PKCanShowPayLaterPassItemsForAccount(*(void **)(*(void *)(a1[6] + 8) + 40));
  if (!v2)
  {
    id v3 = PKLogFacilityTypeGetObject(0);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = a1[4];
      int v8 = 138412290;
      uint64_t v9 = v4;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "PKPassbookDeepLinkController: Cannot present loan details for %@ because of the account state.", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v5 = *(void *)(*(void *)(a1[7] + 8) + 40);
  if (v5)
  {
    char v6 = !v2;
    int v7 = (void *)a1[5];
    if (!*(void *)(*(void *)(a1[8] + 8) + 40)) {
      char v6 = 1;
    }
    if (v6) {
      [v7 presentPassDetailsViewControllerForPass:v5 presentationStyle:2 presentingView:0 animated:1];
    }
    else {
      objc_msgSend(v7, "presentPayLaterFinancingPlan:payLaterPass:");
    }
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

@end