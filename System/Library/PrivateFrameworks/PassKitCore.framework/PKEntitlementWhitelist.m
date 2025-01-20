@interface PKEntitlementWhitelist
+ (BOOL)supportsSecureCoding;
- (BOOL)AMPCardEnrollment;
- (BOOL)_BOOLValueOfEntitlement:(id)a3 fromSecTask:(__SecTask *)a4;
- (BOOL)_probeEntitlementsWithAuditToken:(id *)a3;
- (BOOL)allAccess;
- (BOOL)appleMediaServicesPrivate;
- (BOOL)applePayTrustAllAccess;
- (BOOL)badgeCountItemsAccess;
- (BOOL)carKeyCredentialProvisioning;
- (BOOL)carKeyPassThroughAccess;
- (BOOL)cardOnFilePayments;
- (BOOL)credentialStateAccess;
- (BOOL)entitledToPerformPassAction:(unint64_t)a3 pass:(id)a4;
- (BOOL)entitledToPerformPassAction:(unint64_t)a3 passTypeID:(id)a4 teamID:(id)a5 associatedPassTypeIdentifiers:(id)a6 associatedApplicationIdentifiers:(id)a7;
- (BOOL)externalizedContextPayments;
- (BOOL)featuresAllAccess;
- (BOOL)generateSecurePassData;
- (BOOL)inAppPayments;
- (BOOL)inAppPaymentsPrivate;
- (BOOL)isEntitledForAnyFromUniquePassTypeIDs:(id)a3;
- (BOOL)isEntitledForMerchantSession:(id)a3;
- (BOOL)isEntitledForPassTypeID:(id)a3;
- (BOOL)isEntitledForPaymentRequest:(id)a3;
- (BOOL)passPresentationSuppression;
- (BOOL)passPresentationSuppressionFromBackground;
- (BOOL)passesAddSilently;
- (BOOL)passesAddUnsigned;
- (BOOL)passesAllAccess;
- (BOOL)passesEntangledAccess;
- (BOOL)passesOverviewAccess;
- (BOOL)payLaterPayInFourMerchandising;
- (BOOL)paymentAllAccess;
- (BOOL)paymentConfiguration;
- (BOOL)paymentPassProvisioning;
- (BOOL)paymentPresentation;
- (BOOL)peerPaymentAllAccess;
- (BOOL)remoteNetworkPaymentInitiate;
- (BOOL)searchAllAccess;
- (BOOL)secureElementPassProvisioning;
- (BOOL)secureElementPassProvisioningForMAIDs;
- (BOOL)shareableCredentialProvisioning;
- (BOOL)sharingAllAccess;
- (BOOL)supportsWebPayments;
- (BOOL)trustedDeviceEnrollmentInfo;
- (BOOL)webPayments;
- (BOOL)winterpegPayments;
- (NSArray)merchantIdentifiers;
- (NSArray)passTypeIDPrefixes;
- (NSArray)passTypeIDs;
- (NSArray)teamIDs;
- (NSString)applicationID;
- (NSString)developerTeamID;
- (PKEntitlementWhitelist)init;
- (PKEntitlementWhitelist)initWithConnection:(id)a3;
- (PKEntitlementWhitelist)initWithProcessIdentifier:(int)a3 auditToken:(id *)a4;
- (id)_arrayValueOfEntitlement:(id)a3 fromSecTask:(__SecTask *)a4;
- (id)_stringValueOfEntitlement:(id)a3 fromSecTask:(__SecTask *)a4;
- (void)_copyValueOfEntitlement:(id)a3 fromSecTask:(__SecTask *)a4;
@end

@implementation PKEntitlementWhitelist

- (BOOL)paymentAllAccess
{
  return self->_paymentAllAccess;
}

- (BOOL)passesAllAccess
{
  return self->_passesAllAccess;
}

- (BOOL)secureElementPassProvisioningForMAIDs
{
  return self->_secureElementPassProvisioningForMAIDs;
}

- (BOOL)_probeEntitlementsWithAuditToken:(id *)a3
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  long long v5 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v5;
  SecTaskRef v6 = SecTaskCreateWithAuditToken(v4, &token);
  if (v6)
  {
    self->_passesAllAccess = [(PKEntitlementWhitelist *)self _BOOLValueOfEntitlement:@"com.apple.cards.all-access" fromSecTask:v6];
    self->_passesOverviewAccess = [(PKEntitlementWhitelist *)self _BOOLValueOfEntitlement:@"com.apple.cards.overview-access" fromSecTask:v6];
    self->_passesEntangledAccess = [(PKEntitlementWhitelist *)self _BOOLValueOfEntitlement:@"com.apple.passes.entangled-access" fromSecTask:v6];
    self->_passesAddSilently = [(PKEntitlementWhitelist *)self _BOOLValueOfEntitlement:@"com.apple.passes.add-silently" fromSecTask:v6];
    self->_passesAddUnsigned = [(PKEntitlementWhitelist *)self _BOOLValueOfEntitlement:@"com.apple.passes.add-unsigned" fromSecTask:v6];
    self->_passPresentationSuppression = [(PKEntitlementWhitelist *)self _BOOLValueOfEntitlement:@"com.apple.developer.passkit.pass-presentation-suppression" fromSecTask:v6];
    self->_passPresentationSuppressionFromBackground = [(PKEntitlementWhitelist *)self _BOOLValueOfEntitlement:@"com.apple.private.passkit.pass-presentation-suppress-from-background" fromSecTask:v6];
    self->_paymentConfiguration = [(PKEntitlementWhitelist *)self _BOOLValueOfEntitlement:@"com.apple.payment.configuration" fromSecTask:v6];
    self->_paymentPresentation = [(PKEntitlementWhitelist *)self _BOOLValueOfEntitlement:@"com.apple.payment.presentation" fromSecTask:v6];
    self->_paymentAllAccess = [(PKEntitlementWhitelist *)self _BOOLValueOfEntitlement:@"com.apple.payment.all-access" fromSecTask:v6];
    self->_applePayTrustAllAccess = [(PKEntitlementWhitelist *)self _BOOLValueOfEntitlement:@"com.apple.apple-pay-trust.all-access" fromSecTask:v6];
    self->_inAppPaymentsPrivate = [(PKEntitlementWhitelist *)self _BOOLValueOfEntitlement:@"com.apple.private.in-app-payments" fromSecTask:v6];
    self->_cardOnFilePayments = [(PKEntitlementWhitelist *)self _BOOLValueOfEntitlement:@"com.apple.payment.card-on-file" fromSecTask:v6];
    self->_externalizedContextPayments = [(PKEntitlementWhitelist *)self _BOOLValueOfEntitlement:@"com.apple.payment.externalized-context" fromSecTask:v6];
    self->_trustedDeviceEnrollmentInfo = [(PKEntitlementWhitelist *)self _BOOLValueOfEntitlement:@"com.apple.private.passkit.trusted-device-enrollment-info" fromSecTask:v6];
    self->_peerPaymentAllAccess = [(PKEntitlementWhitelist *)self _BOOLValueOfEntitlement:@"com.apple.peerpayment.all-access" fromSecTask:v6];
    v7 = [(PKEntitlementWhitelist *)self _stringValueOfEntitlement:@"application-identifier" fromSecTask:v6];
    v8 = (NSString *)[v7 copy];
    applicationID = self->_applicationID;
    self->_applicationID = v8;

    self->_AMPCardEnrollment = [(PKEntitlementWhitelist *)self _BOOLValueOfEntitlement:@"com.apple.payment.amp-card-enrollment" fromSecTask:v6];
    self->_searchAllAccess = [(PKEntitlementWhitelist *)self _BOOLValueOfEntitlement:@"com.apple.passkit.search.all-access" fromSecTask:v6];
    BOOL v10 = [(PKEntitlementWhitelist *)self _BOOLValueOfEntitlement:@"com.apple.features.all-access" fromSecTask:v6]|| [(PKEntitlementWhitelist *)self _BOOLValueOfEntitlement:@"com.apple.wallet.features.all-access" fromSecTask:v6];
    self->_featuresAllAccess = v10;
    self->_secureElementPassProvisioning = [(PKEntitlementWhitelist *)self _BOOLValueOfEntitlement:@"com.apple.developer.contactless-payment-pass-provisioning" fromSecTask:v6];
    self->_secureElementPassProvisioningForMAIDs = [(PKEntitlementWhitelist *)self _BOOLValueOfEntitlement:@"com.apple.developer.contactless-payment-pass-provisioning.maids" fromSecTask:v6];
    v11 = [(PKEntitlementWhitelist *)self _arrayValueOfEntitlement:@"com.apple.developer.contactless-payment-pass-provisioning" fromSecTask:v6];
    self->_shareableCredentialProvisioning = [v11 containsObject:@"shareablecredential"];

    v12 = [(PKEntitlementWhitelist *)self _arrayValueOfEntitlement:@"com.apple.developer.contactless-payment-pass-provisioning" fromSecTask:v6];
    self->_carKeyCredentialProvisioning = [v12 containsObject:@"carkey"];

    self->_paymentPassProvisioning = [(PKEntitlementWhitelist *)self _BOOLValueOfEntitlement:@"com.apple.developer.payment-pass-provisioning" fromSecTask:v6];
    if (self->_secureElementPassProvisioning)
    {
      self->_secureElementPassProvisioning = 1;
    }
    else
    {
      v13 = [(PKEntitlementWhitelist *)self _arrayValueOfEntitlement:@"com.apple.developer.contactless-payment-pass-provisioning" fromSecTask:v6];
      self->_secureElementPassProvisioning = [v13 containsObject:@"carkey"];
    }
    self->_credentialStateAccess = [(PKEntitlementWhitelist *)self _BOOLValueOfEntitlement:@"com.apple.private.credential-state-access" fromSecTask:v6];
    self->_sharingAllAccess = [(PKEntitlementWhitelist *)self _BOOLValueOfEntitlement:@"com.apple.private.sharing.all-access" fromSecTask:v6];
    self->_appleMediaServicesPrivate = [(PKEntitlementWhitelist *)self _BOOLValueOfEntitlement:@"com.apple.private.applemediaservices" fromSecTask:v6];
    self->_carKeyPassThroughAccess = [(PKEntitlementWhitelist *)self _BOOLValueOfEntitlement:@"com.apple.developer.car-key-passthrough-access" fromSecTask:v6];
    v14 = [(PKEntitlementWhitelist *)self _arrayValueOfEntitlement:@"com.apple.developer.pay-later-merchandising" fromSecTask:v6];
    self->_payLaterPayInFourMerchandising = [v14 containsObject:@"payinfour-merchandising"];

    self->_badgeCountItemsAccess = [(PKEntitlementWhitelist *)self _BOOLValueOfEntitlement:@"com.apple.private.wallet-badge-count-items" fromSecTask:v6];
    self->_remoteNetworkPaymentInitiate = [(PKEntitlementWhitelist *)self _BOOLValueOfEntitlement:@"com.apple.private.payment.remote-network-payment-initiate" fromSecTask:v6];
    v15 = [(PKEntitlementWhitelist *)self _stringValueOfEntitlement:@"com.apple.developer.team-identifier" fromSecTask:v6];
    if (!v15)
    {
      v16 = self->_applicationID;
      if (v16 && (uint64_t v17 = [(NSString *)v16 rangeOfString:@"."], v17 != 0x7FFFFFFFFFFFFFFFLL))
      {
        v15 = [(NSString *)self->_applicationID substringToIndex:v17];
      }
      else
      {
        v15 = 0;
      }
    }
    if ((unint64_t)[v15 length] <= 9)
    {

      v15 = 0;
    }
    objc_storeStrong((id *)&self->_developerTeamID, v15);
    v18 = [(PKEntitlementWhitelist *)self _arrayValueOfEntitlement:@"com.apple.developer.in-app-payments" fromSecTask:v6];
    v69 = v18;
    if (v18)
    {
      self->_inAppPayments = 1;
      id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v86 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      id v20 = v18;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v86 objects:v93 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v87;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v87 != v23) {
              objc_enumerationMutation(v20);
            }
            uint64_t v25 = *(void *)(*((void *)&v86 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v19 addObject:v25];
            }
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v86 objects:v93 count:16];
        }
        while (v22);
      }

      v26 = (NSArray *)[v19 copy];
      merchantIdentifiers = self->_merchantIdentifiers;
      self->_merchantIdentifiers = v26;

      v28 = PKLogFacilityTypeGetObject(4uLL);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        v29 = self->_merchantIdentifiers;
        token.val[0] = 138412290;
        *(void *)&token.val[1] = v29;
        _os_log_impl(&dword_190E10000, v28, OS_LOG_TYPE_INFO, "Client has in-app payments entitlement for identifiers: %@", (uint8_t *)&token, 0xCu);
      }

      v18 = v69;
    }
    self->_winterpegPayments = [(PKEntitlementWhitelist *)self _BOOLValueOfEntitlement:@"com.apple.payment.winterpeg" fromSecTask:v6];
    self->_webPayments = [(PKEntitlementWhitelist *)self _BOOLValueOfEntitlement:@"com.apple.developer.web-payments" fromSecTask:v6];
    uint64_t v30 = [(PKEntitlementWhitelist *)self _arrayValueOfEntitlement:@"com.apple.developer.pass-type-identifiers" fromSecTask:v6];
    if (v30)
    {
      v31 = (void *)v30;
      v66 = v15;
      v67 = self;
      v68 = v6;
      uint64_t v32 = objc_opt_class();
      v85[0] = MEMORY[0x1E4F143A8];
      v85[1] = 3221225472;
      v85[2] = __59__PKEntitlementWhitelist__probeEntitlementsWithAuditToken___block_invoke;
      v85[3] = &__block_descriptor_40_e25_B32__0__NSString_8Q16_B24lu32l8;
      v85[4] = v32;
      v33 = objc_msgSend(v31, "pk_objectsPassingTest:", v85);

      id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v70 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      long long v81 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      long long v84 = 0u;
      obuint64_t j = v33;
      uint64_t v35 = [obj countByEnumeratingWithState:&v81 objects:v92 count:16];
      if (v35)
      {
        uint64_t v36 = v35;
        uint64_t v37 = *(void *)v82;
        do
        {
          for (uint64_t j = 0; j != v36; ++j)
          {
            if (*(void *)v82 != v37) {
              objc_enumerationMutation(obj);
            }
            v39 = *(void **)(*((void *)&v81 + 1) + 8 * j);
            uint64_t v40 = objc_msgSend(v39, "rangeOfString:", @".", v66);
            if (v40 != 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v41 = v40;
              v42 = [v39 substringToIndex:v40];
              if ([v42 length])
              {
                v43 = [v39 substringFromIndex:v41 + 1];
                if ([v43 length])
                {
                  if ([v43 isEqualToString:@"*"])
                  {
                    [v34 addObject:v42];
                  }
                  else
                  {
                    id v44 = [v70 objectForKeyedSubscript:v42];
                    if (!v44)
                    {
                      id v44 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                      [v70 setObject:v44 forKeyedSubscript:v42];
                    }
                    [v44 addObject:v43];
                  }
                }
              }
            }
          }
          uint64_t v36 = [obj countByEnumeratingWithState:&v81 objects:v92 count:16];
        }
        while (v36);
      }

      id v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v77 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      id v46 = v70;
      uint64_t v47 = [v46 countByEnumeratingWithState:&v77 objects:v91 count:16];
      if (v47)
      {
        uint64_t v48 = v47;
        uint64_t v49 = *(void *)v78;
        do
        {
          uint64_t v50 = 0;
          uint64_t v71 = v48;
          do
          {
            if (*(void *)v78 != v49) {
              objc_enumerationMutation(v46);
            }
            uint64_t v51 = *(void *)(*((void *)&v77 + 1) + 8 * v50);
            if ((objc_msgSend(v34, "containsObject:", v51, v66) & 1) == 0)
            {
              id v52 = v34;
              long long v75 = 0u;
              long long v76 = 0u;
              long long v73 = 0u;
              long long v74 = 0u;
              id v53 = v46;
              v54 = [v46 objectForKeyedSubscript:v51];
              uint64_t v55 = [v54 countByEnumeratingWithState:&v73 objects:v90 count:16];
              if (v55)
              {
                uint64_t v56 = v55;
                uint64_t v57 = *(void *)v74;
                do
                {
                  for (uint64_t k = 0; k != v56; ++k)
                  {
                    if (*(void *)v74 != v57) {
                      objc_enumerationMutation(v54);
                    }
                    uint64_t v59 = *(void *)(*((void *)&v73 + 1) + 8 * k);
                    if (([v45 containsObject:v59] & 1) == 0) {
                      [v45 addObject:v59];
                    }
                  }
                  uint64_t v56 = [v54 countByEnumeratingWithState:&v73 objects:v90 count:16];
                }
                while (v56);
              }

              id v34 = v52;
              id v46 = v53;
              uint64_t v48 = v71;
            }
            ++v50;
          }
          while (v50 != v48);
          uint64_t v48 = [v46 countByEnumeratingWithState:&v77 objects:v91 count:16];
        }
        while (v48);
      }

      uint64_t v60 = [v34 copy];
      teamIDs = v67->_teamIDs;
      v67->_teamIDs = (NSArray *)v60;

      uint64_t v62 = [v45 copy];
      passTypeIDs = v67->_passTypeIDs;
      v67->_passTypeIDs = (NSArray *)v62;

      passTypeIDPrefixes = v67->_passTypeIDPrefixes;
      v67->_passTypeIDPrefixes = (NSArray *)MEMORY[0x1E4F1CBF0];

      SecTaskRef v6 = v68;
      v18 = v69;
      v15 = v66;
    }
    CFRelease(v6);
  }
  return v6 != 0;
}

- (BOOL)_BOOLValueOfEntitlement:(id)a3 fromSecTask:(__SecTask *)a4
{
  CFBooleanRef v4 = [(PKEntitlementWhitelist *)self _copyValueOfEntitlement:a3 fromSecTask:a4];
  if (!v4) {
    return 0;
  }
  CFBooleanRef v5 = v4;
  CFTypeID v6 = CFGetTypeID(v4);
  BOOL v7 = v6 == CFBooleanGetTypeID() && CFBooleanGetValue(v5) != 0;
  CFRelease(v5);
  return v7;
}

- (void)_copyValueOfEntitlement:(id)a3 fromSecTask:(__SecTask *)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  CFTypeID v6 = (__CFString *)a3;
  CFErrorRef error = 0;
  CFTypeRef v7 = SecTaskCopyValueForEntitlement(a4, v6, &error);
  CFErrorRef v8 = error;
  if (error)
  {
    v9 = PKLogFacilityTypeGetObject(4uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t processIdentifier = self->_processIdentifier;
      *(_DWORD *)buf = 138412802;
      v14 = v6;
      __int16 v15 = 2048;
      uint64_t v16 = processIdentifier;
      __int16 v17 = 2112;
      CFErrorRef v18 = v8;
      _os_log_impl(&dword_190E10000, v9, OS_LOG_TYPE_DEFAULT, "Failed to copy value of entitlement: %@ process: %lu error: %@", buf, 0x20u);
    }

    CFRelease(error);
  }

  return (void *)v7;
}

- (id)_arrayValueOfEntitlement:(id)a3 fromSecTask:(__SecTask *)a4
{
  CFBooleanRef v4 = [(PKEntitlementWhitelist *)self _copyValueOfEntitlement:a3 fromSecTask:a4];
  CFBooleanRef v5 = v4;
  if (v4)
  {
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 != CFArrayGetTypeID())
    {
      CFRelease(v5);
      CFBooleanRef v5 = 0;
    }
  }
  return v5;
}

- (id)_stringValueOfEntitlement:(id)a3 fromSecTask:(__SecTask *)a4
{
  CFBooleanRef v4 = [(PKEntitlementWhitelist *)self _copyValueOfEntitlement:a3 fromSecTask:a4];
  CFBooleanRef v5 = v4;
  if (v4)
  {
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 != CFStringGetTypeID())
    {
      CFRelease(v5);
      CFBooleanRef v5 = 0;
    }
  }
  return v5;
}

- (PKEntitlementWhitelist)initWithConnection:(id)a3
{
  id v4 = a3;
  CFBooleanRef v5 = (void *)MEMORY[0x192FDC630]();
  if (v4)
  {
    uint64_t v6 = [v4 processIdentifier];
    long long v10 = 0u;
    long long v11 = 0u;
    [v4 auditToken];
  }
  else
  {
    long long v10 = 0u;
    long long v11 = 0u;
    uint64_t v6 = 0xFFFFFFFFLL;
  }
  v9[0] = v10;
  v9[1] = v11;
  CFTypeRef v7 = [(PKEntitlementWhitelist *)self initWithProcessIdentifier:v6 auditToken:v9];

  return v7;
}

- (PKEntitlementWhitelist)initWithProcessIdentifier:(int)a3 auditToken:(id *)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)PKEntitlementWhitelist;
  uint64_t v6 = [(PKEntitlementWhitelist *)&v11 init];
  CFTypeRef v7 = v6;
  if (v6)
  {
    v6->_uint64_t processIdentifier = a3;
    long long v8 = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)buf = *(_OWORD *)a4->var0;
    long long v13 = v8;
    if (![(PKEntitlementWhitelist *)v6 _probeEntitlementsWithAuditToken:buf])
    {
      v9 = PKLogFacilityTypeGetObject(0);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = a3;
        _os_log_error_impl(&dword_190E10000, v9, OS_LOG_TYPE_ERROR, "Failed to probe entitlements for process: %lu.", buf, 0xCu);
      }
    }
  }
  return v7;
}

- (BOOL)peerPaymentAllAccess
{
  return self->_peerPaymentAllAccess;
}

- (BOOL)passesAddUnsigned
{
  return self->_passesAddUnsigned;
}

uint64_t __59__PKEntitlementWhitelist__probeEntitlementsWithAuditToken___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passTypeIDPrefixes, 0);
  objc_storeStrong((id *)&self->_passTypeIDs, 0);
  objc_storeStrong((id *)&self->_teamIDs, 0);
  objc_storeStrong((id *)&self->_merchantIdentifiers, 0);
  objc_storeStrong((id *)&self->_developerTeamID, 0);
  objc_storeStrong((id *)&self->_applicationID, 0);
}

- (PKEntitlementWhitelist)init
{
  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)allAccess
{
  return self->_passesAllAccess;
}

- (BOOL)supportsWebPayments
{
  return self->_webPayments || self->_winterpegPayments || self->_inAppPaymentsPrivate || self->_paymentAllAccess;
}

- (BOOL)shareableCredentialProvisioning
{
  return self->_shareableCredentialProvisioning || self->_secureElementPassProvisioning;
}

- (BOOL)carKeyCredentialProvisioning
{
  return self->_carKeyCredentialProvisioning || self->_secureElementPassProvisioning;
}

- (BOOL)passesOverviewAccess
{
  return self->_passesOverviewAccess;
}

- (BOOL)passesEntangledAccess
{
  return self->_passesEntangledAccess;
}

- (BOOL)passesAddSilently
{
  return self->_passesAddSilently;
}

- (BOOL)passPresentationSuppression
{
  return self->_passPresentationSuppression;
}

- (BOOL)passPresentationSuppressionFromBackground
{
  return self->_passPresentationSuppressionFromBackground;
}

- (BOOL)paymentConfiguration
{
  return self->_paymentConfiguration;
}

- (BOOL)paymentPresentation
{
  return self->_paymentPresentation;
}

- (BOOL)applePayTrustAllAccess
{
  return self->_applePayTrustAllAccess;
}

- (BOOL)inAppPayments
{
  return self->_inAppPayments;
}

- (BOOL)inAppPaymentsPrivate
{
  return self->_inAppPaymentsPrivate;
}

- (BOOL)webPayments
{
  return self->_webPayments;
}

- (BOOL)winterpegPayments
{
  return self->_winterpegPayments;
}

- (BOOL)cardOnFilePayments
{
  return self->_cardOnFilePayments;
}

- (BOOL)AMPCardEnrollment
{
  return self->_AMPCardEnrollment;
}

- (BOOL)externalizedContextPayments
{
  return self->_externalizedContextPayments;
}

- (BOOL)trustedDeviceEnrollmentInfo
{
  return self->_trustedDeviceEnrollmentInfo;
}

- (BOOL)featuresAllAccess
{
  return self->_featuresAllAccess;
}

- (BOOL)searchAllAccess
{
  return self->_searchAllAccess;
}

- (BOOL)secureElementPassProvisioning
{
  return self->_secureElementPassProvisioning;
}

- (BOOL)paymentPassProvisioning
{
  return self->_paymentPassProvisioning;
}

- (BOOL)sharingAllAccess
{
  return self->_sharingAllAccess;
}

- (BOOL)appleMediaServicesPrivate
{
  return self->_appleMediaServicesPrivate;
}

- (BOOL)carKeyPassThroughAccess
{
  return self->_carKeyPassThroughAccess;
}

- (BOOL)generateSecurePassData
{
  return self->_generateSecurePassData;
}

- (BOOL)payLaterPayInFourMerchandising
{
  return self->_payLaterPayInFourMerchandising;
}

- (BOOL)badgeCountItemsAccess
{
  return self->_badgeCountItemsAccess;
}

- (BOOL)remoteNetworkPaymentInitiate
{
  return self->_remoteNetworkPaymentInitiate;
}

- (BOOL)credentialStateAccess
{
  return self->_credentialStateAccess;
}

- (NSString)applicationID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)developerTeamID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSArray)merchantIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (NSArray)teamIDs
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (NSArray)passTypeIDs
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (NSArray)passTypeIDPrefixes
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (BOOL)isEntitledForPassTypeID:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    if ([(NSArray *)self->_passTypeIDs containsObject:v4])
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      uint64_t v6 = self->_passTypeIDPrefixes;
      uint64_t v5 = [(NSArray *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5)
      {
        uint64_t v7 = *(void *)v11;
        while (2)
        {
          for (uint64_t i = 0; i != v5; ++i)
          {
            if (*(void *)v11 != v7) {
              objc_enumerationMutation(v6);
            }
            if (objc_msgSend(v4, "hasPrefix:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10))
            {
              LOBYTE(v5) = 1;
              goto LABEL_15;
            }
          }
          uint64_t v5 = [(NSArray *)v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
          if (v5) {
            continue;
          }
          break;
        }
      }
LABEL_15:
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)isEntitledForAnyFromUniquePassTypeIDs:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 count];
  if (v5)
  {
    if (v5 == 1)
    {
      id v6 = [v4 anyObject];
      BOOL v7 = [(PKEntitlementWhitelist *)self isEntitledForPassTypeID:v6];
    }
    else
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v8 = self->_passTypeIDs;
      uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v33 objects:v39 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v34;
        while (2)
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v34 != v11) {
              objc_enumerationMutation(v8);
            }
            if ([v4 containsObject:*(void *)(*((void *)&v33 + 1) + 8 * i)])
            {

              BOOL v7 = 1;
              goto LABEL_31;
            }
          }
          uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v33 objects:v39 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }

      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v6 = v4;
      uint64_t v13 = [v6 countByEnumeratingWithState:&v29 objects:v38 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v30;
        uint64_t v24 = *(void *)v30;
        do
        {
          for (uint64_t j = 0; j != v14; ++j)
          {
            if (*(void *)v30 != v15) {
              objc_enumerationMutation(v6);
            }
            __int16 v17 = *(void **)(*((void *)&v29 + 1) + 8 * j);
            long long v25 = 0u;
            long long v26 = 0u;
            long long v27 = 0u;
            long long v28 = 0u;
            CFErrorRef v18 = self->_passTypeIDPrefixes;
            uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v25 objects:v37 count:16];
            if (v19)
            {
              uint64_t v20 = v19;
              uint64_t v21 = *(void *)v26;
              while (2)
              {
                for (uint64_t k = 0; k != v20; ++k)
                {
                  if (*(void *)v26 != v21) {
                    objc_enumerationMutation(v18);
                  }
                  if ([v17 hasPrefix:*(void *)(*((void *)&v25 + 1) + 8 * k)])
                  {

                    BOOL v7 = 1;
                    goto LABEL_4;
                  }
                }
                uint64_t v20 = [(NSArray *)v18 countByEnumeratingWithState:&v25 objects:v37 count:16];
                if (v20) {
                  continue;
                }
                break;
              }
            }

            uint64_t v15 = v24;
          }
          uint64_t v14 = [v6 countByEnumeratingWithState:&v29 objects:v38 count:16];
          BOOL v7 = 0;
        }
        while (v14);
      }
      else
      {
        BOOL v7 = 0;
      }
    }
LABEL_4:
  }
  else
  {
    BOOL v7 = 0;
  }
LABEL_31:

  return v7;
}

- (BOOL)entitledToPerformPassAction:(unint64_t)a3 pass:(id)a4
{
  id v6 = a4;
  BOOL v7 = [v6 passTypeIdentifier];
  long long v8 = [v6 teamID];
  uint64_t v9 = [v6 associatedPassTypeIdentifiers];
  uint64_t v10 = [v6 secureElementPass];

  uint64_t v11 = [v10 associatedApplicationIdentifiers];
  LOBYTE(a3) = [(PKEntitlementWhitelist *)self entitledToPerformPassAction:a3 passTypeID:v7 teamID:v8 associatedPassTypeIdentifiers:v9 associatedApplicationIdentifiers:v11];

  return a3;
}

- (BOOL)entitledToPerformPassAction:(unint64_t)a3 passTypeID:(id)a4 teamID:(id)a5 associatedPassTypeIdentifiers:(id)a6 associatedApplicationIdentifiers:(id)a7
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (self->_passesAllAccess || v13 && [(NSArray *)self->_teamIDs containsObject:v13]) {
    goto LABEL_2;
  }
  if (!v12)
  {
    if ((a3 & 7) == 0 || !v14) {
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  BOOL v18 = [(PKEntitlementWhitelist *)self isEntitledForPassTypeID:v12];
  if ((a3 & 7) != 0 && v14 && !v18) {
LABEL_13:
  }
    BOOL v18 = [(PKEntitlementWhitelist *)self isEntitledForAnyFromUniquePassTypeIDs:v14];
  if (v18) {
    goto LABEL_2;
  }
LABEL_15:
  if (PKPassTypeForPassTypeIdentifier(v12) != 1)
  {
LABEL_37:
    BOOL v16 = 0;
    goto LABEL_3;
  }
  if (self->_paymentAllAccess)
  {
LABEL_2:
    BOOL v16 = 1;
    goto LABEL_3;
  }
  if (a3 != 2) {
    goto LABEL_37;
  }
  uint64_t v19 = self->_applicationID;
  id v20 = v15;
  uint64_t v21 = v20;
  long long v36 = v19;
  if (v19 && [v20 count])
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    obuint64_t j = v21;
    uint64_t v22 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      long long v34 = v21;
      uint64_t v24 = *(void *)v38;
      while (2)
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v38 != v24) {
            objc_enumerationMutation(obj);
          }
          long long v26 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          if ([v26 hasSuffix:@".*"])
          {
            uint64_t v27 = objc_msgSend(v26, "substringToIndex:", objc_msgSend(v26, "length") - 1);
            if (v27)
            {
              long long v28 = (void *)v27;
              BOOL v29 = [(NSString *)v36 hasPrefix:v27];

              if (v29) {
                goto LABEL_41;
              }
            }
          }
          else
          {
            long long v30 = v36;
            long long v31 = v26;
            if (v31 == v30)
            {

LABEL_41:
              BOOL v16 = 1;
              goto LABEL_42;
            }
            long long v32 = v31;
            if (v31)
            {
              BOOL v33 = [(NSString *)v30 isEqualToString:v31];

              if (v33) {
                goto LABEL_41;
              }
            }
            else
            {
            }
          }
        }
        uint64_t v23 = [obj countByEnumeratingWithState:&v37 objects:v41 count:16];
        if (v23) {
          continue;
        }
        break;
      }
      BOOL v16 = 0;
LABEL_42:
      uint64_t v21 = v34;
    }
    else
    {
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

LABEL_3:
  return v16;
}

- (BOOL)isEntitledForPaymentRequest:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 originatingURL];
  id v6 = [v5 scheme];

  switch([v4 requestType])
  {
    case 0:
    case 10:
      if (v6 && ![v6 caseInsensitiveCompare:@"https"]) {
        goto LABEL_25;
      }
      uint64_t v9 = [v4 merchantIdentifier];

      if (v9) {
        goto LABEL_22;
      }
      if (self->_inAppPayments || self->_paymentAllAccess || self->_inAppPaymentsPrivate) {
        goto LABEL_28;
      }
      goto LABEL_5;
    case 1:
      if (!self->_cardOnFilePayments) {
        goto LABEL_5;
      }
      goto LABEL_28;
    case 2:
    case 4:
    case 8:
    case 9:
    case 11:
    case 12:
    case 14:
      if (!self->_paymentAllAccess) {
        goto LABEL_5;
      }
      goto LABEL_28;
    case 3:
      if (!self->_AMPCardEnrollment) {
        goto LABEL_5;
      }
      goto LABEL_28;
    case 5:
      if (v6 && ![v6 caseInsensitiveCompare:@"https"])
      {
LABEL_25:
        id v13 = [v4 merchantSession];
        BOOL v14 = [(PKEntitlementWhitelist *)self isEntitledForMerchantSession:v13];

        if (v14) {
          goto LABEL_28;
        }
      }
      else
      {
        uint64_t v10 = [v4 merchantIdentifier];

        if (v10)
        {
LABEL_22:
          merchantIdentifiers = self->_merchantIdentifiers;
          id v12 = [v4 merchantIdentifier];
          if ([(NSArray *)merchantIdentifiers containsObject:v12] || self->_paymentAllAccess)
          {

LABEL_28:
            BOOL v8 = 1;
            goto LABEL_29;
          }
          BOOL inAppPaymentsPrivate = self->_inAppPaymentsPrivate;

          if (inAppPaymentsPrivate) {
            goto LABEL_28;
          }
        }
      }
LABEL_5:
      BOOL v7 = PKLogFacilityTypeGetObject(0);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int processIdentifier = self->_processIdentifier;
        v18[0] = 67109120;
        v18[1] = processIdentifier;
        _os_log_error_impl(&dword_190E10000, v7, OS_LOG_TYPE_ERROR, "Process %d not entitled for payment request", (uint8_t *)v18, 8u);
      }

      BOOL v8 = 0;
LABEL_29:

      return v8;
    case 6:
    case 7:
    case 13:
    case 15:
      if (!self->_externalizedContextPayments) {
        goto LABEL_5;
      }
      goto LABEL_28;
    default:
      goto LABEL_5;
  }
}

- (BOOL)isEntitledForMerchantSession:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 initiative];
  id v6 = [v5 lowercaseString];

  if ([v6 isEqualToString:@"messaging"])
  {
    if (!self->_winterpegPayments) {
      goto LABEL_9;
    }
LABEL_21:
    BOOL v8 = 1;
    goto LABEL_22;
  }
  if ([v6 isEqualToString:@"amp_enrollment"])
  {
    if (!self->_AMPCardEnrollment) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
  if (![v6 isEqualToString:@"amp_psd2"])
  {
    if ([v6 isEqualToString:@"in_app"])
    {
      if (self->_inAppPayments)
      {
        developerTeamID = self->_developerTeamID;
        uint64_t v10 = [v4 initiativeContext];
        if ([(NSString *)developerTeamID isEqualToString:v10]
          || (PKBypassCertValidation() & 1) != 0
          || self->_inAppPaymentsPrivate)
        {
        }
        else
        {
          BOOL paymentAllAccess = self->_paymentAllAccess;

          if (!paymentAllAccess) {
            goto LABEL_9;
          }
        }
        goto LABEL_21;
      }
    }
    else if (self->_webPayments)
    {
      goto LABEL_21;
    }
    if (!self->_inAppPaymentsPrivate && !self->_paymentAllAccess) {
      goto LABEL_9;
    }
    goto LABEL_21;
  }
  if (self->_cardOnFilePayments) {
    goto LABEL_21;
  }
LABEL_9:
  BOOL v7 = PKLogFacilityTypeGetObject(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    int processIdentifier = self->_processIdentifier;
    v14[0] = 67109120;
    v14[1] = processIdentifier;
    _os_log_error_impl(&dword_190E10000, v7, OS_LOG_TYPE_ERROR, "Process %d not entitled for merchant session", (uint8_t *)v14, 8u);
  }

  BOOL v8 = 0;
LABEL_22:

  return v8;
}

@end