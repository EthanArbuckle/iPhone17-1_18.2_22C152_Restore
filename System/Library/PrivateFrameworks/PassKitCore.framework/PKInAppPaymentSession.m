@interface PKInAppPaymentSession
- (PKInAppPaymentSession)initWithInternalSession:(id)a3 targetQueue:(id)a4;
- (id)_appletForPaymentApplication:(id)a3;
- (id)_appletWithIdentifier:(id)a3;
- (id)authorizePaymentRequest:(id)a3 forPaymentApplication:(id)a4 usingNonce:(id)a5 withAuthenticationCredential:(id)a6;
- (id)authorizePaymentRequest:(id)a3 forPaymentApplication:(id)a4 usingNonce:(id)a5 withAuthenticationCredential:(id)a6 isFeatureNotSupportedError:(BOOL *)a7;
- (id)authorizePaymentRequest:(id)a3 forPaymentApplication:(id)a4 withAuthorizationParameters:(id)a5;
- (id)authorizeWithRequest:(id)a3 authorizationParameters:(id)a4;
@end

@implementation PKInAppPaymentSession

- (PKInAppPaymentSession)initWithInternalSession:(id)a3 targetQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 nfSession];
  PKGetClassNFECommercePaymentSession();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    [v6 endSession];

    id v6 = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)PKInAppPaymentSession;
  v10 = [(PKPaymentSession *)&v12 initWithInternalSession:v6 targetQueue:v7];

  return v10;
}

- (id)authorizePaymentRequest:(id)a3 forPaymentApplication:(id)a4 usingNonce:(id)a5 withAuthenticationCredential:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [[PKInAppPaymentSessionAuthorizeParamaters alloc] initWithNonce:v11 authenticationCredential:v10 networkMerchantIdentifier:0 cryptogramType:0];

  v15 = [(PKInAppPaymentSession *)self authorizePaymentRequest:v13 forPaymentApplication:v12 withAuthorizationParameters:v14];

  return v15;
}

- (id)authorizePaymentRequest:(id)a3 forPaymentApplication:(id)a4 usingNonce:(id)a5 withAuthenticationCredential:(id)a6 isFeatureNotSupportedError:(BOOL *)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = [[PKInAppPaymentSessionAuthorizeParamaters alloc] initWithNonce:v13 authenticationCredential:v12 networkMerchantIdentifier:0 cryptogramType:0];

  [(PKInAppPaymentSessionAuthorizeParamaters *)v16 setIsFeatureNotSupportedError:a7];
  v17 = [(PKInAppPaymentSession *)self authorizePaymentRequest:v15 forPaymentApplication:v14 withAuthorizationParameters:v16];

  return v17;
}

- (id)authorizePaymentRequest:(id)a3 forPaymentApplication:(id)a4 withAuthorizationParameters:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init(PKInAppPaymentSessionAuthorizationRequest);
  [(PKInAppPaymentSessionAuthorizationRequest *)v11 setPaymentApplication:v9];

  id v12 = [v10 currencyCode];
  [(PKInAppPaymentSessionAuthorizationRequest *)v11 setCurrencyCode:v12];

  id v13 = [v10 countryCode];
  [(PKInAppPaymentSessionAuthorizationRequest *)v11 setCountryCode:v13];

  id v14 = [v10 _transactionAmount];
  [(PKInAppPaymentSessionAuthorizationRequest *)v11 setTransactionAmount:v14];

  -[PKInAppPaymentSessionAuthorizationRequest setMerchantCapabilities:](v11, "setMerchantCapabilities:", [v10 merchantCapabilities]);
  id v15 = [v10 supportedNetworks];
  [(PKInAppPaymentSessionAuthorizationRequest *)v11 setSupportedNetworks:v15];

  v16 = [v10 merchantIdentifier];
  [(PKInAppPaymentSessionAuthorizationRequest *)v11 setMerchantIdentifier:v16];

  v17 = [v10 applicationData];
  [(PKInAppPaymentSessionAuthorizationRequest *)v11 setApplicationData:v17];

  v18 = [v10 merchantSession];

  [(PKInAppPaymentSessionAuthorizationRequest *)v11 setMerchantSession:v18];
  v19 = [(PKInAppPaymentSession *)self authorizeWithRequest:v11 authorizationParameters:v8];

  return v19;
}

- (id)authorizeWithRequest:(id)a3 authorizationParameters:(id)a4
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v53 = 0;
  v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__64;
  v57 = __Block_byref_object_dispose__64;
  id v58 = 0;
  if (PKMockOsloSecureElementAuth())
  {
    id v7 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "PKInAppPaymentSession authorizePaymentRequest: mocking wrapped payment data", buf, 2u);
    }

    id v8 = objc_alloc_init(PKWrappedPayment);
    id v9 = (void *)v54[5];
    v54[5] = (uint64_t)v8;

    id v10 = (void *)v54[5];
    id v11 = [@"000000000000000000000000000000000000000000000000" dataUsingEncoding:4];
    [v10 setTransactionData:v11];

    [(id)v54[5] setTransactionIdentifier:@"0123456789ABCDEF"];
    id v12 = (void *)v54[5];
    id v13 = [v5 countryCode];
    [v12 setMerchantCountryCode:v13];

    id v14 = (id)v54[5];
  }
  else
  {
    v43 = [v5 paymentApplication];
    v44 = -[PKInAppPaymentSession _appletForPaymentApplication:](self, "_appletForPaymentApplication:");
    id v15 = [v6 nonce];
    v41 = [v6 authenticationCredential];
    v16 = [v6 networkMerchantIdentifier];
    uint64_t v40 = [v6 isFeatureNotSupportedError];
    uint64_t v42 = [v6 cryptogramType];
    id v17 = v5;
    id v45 = v16;
    id v18 = v15;
    v19 = [v17 paymentApplication];
    *(_DWORD *)buf = 0;
    [v18 getBytes:buf length:4];

    *(_DWORD *)buf = bswap32(*(unsigned int *)buf);
    id v20 = objc_alloc_init((Class)PKGetClassNFECommercePaymentRequest());
    v21 = [PKPaymentMerchantData alloc];
    v22 = [v17 merchantIdentifier];
    v23 = [v17 applicationData];
    v24 = [v17 merchantSession];
    v25 = [(PKPaymentMerchantData *)v21 initWithMerchantIdentifier:v22 applicationData:v23 merchantSession:v24];

    v26 = [v19 applicationIdentifier];
    [v20 setAppletIdentifier:v26];

    v27 = [(PKPaymentMerchantData *)v25 encode];
    [v20 setMerchantData:v27];

    v28 = [v17 currencyCode];
    [v20 setCurrencyCode:v28];

    v29 = [v17 countryCode];
    [v20 setCountryCode:v29];

    v30 = [v17 transactionAmount];
    [v20 setTransactionAmount:v30];

    int v31 = [v17 merchantCapabilities];
    if ((~v31 & 3) == 0)
    {
      v32 = [v17 supportedNetworks];
      if ([v32 containsObject:@"ChinaUnionPay"])
      {
        BOOL v33 = [v19 paymentNetworkIdentifier] == 11;

        if (!v33) {
          LOBYTE(v31) = v31 ^ 2;
        }
      }
      else
      {
      }
    }
    char v34 = v31 | 0x40;
    if (v42 != 1) {
      char v34 = v31;
    }
    [v20 setMerchantCapabilities:v34 & 0x43];
    [v20 setUnpredictableNumber:*(unsigned int *)buf];
    v35 = [MEMORY[0x1E4F1C9C8] date];
    [v20 setTransactionDate:v35];

    [v20 setNetworkMerchantIdentifier:v45];
    v36 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      id v60 = v20;
      __int16 v61 = 2112;
      v62 = v43;
      __int16 v63 = 2112;
      v64 = v44;
      __int16 v65 = 2112;
      id v66 = v18;
      _os_log_impl(&dword_190E10000, v36, OS_LOG_TYPE_DEFAULT, "Authorizing Payment Request: %@ for Payment Application %@ (Applet: %@) with nonce: %@", buf, 0x2Au);
    }

    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __70__PKInAppPaymentSession_authorizeWithRequest_authorizationParameters___block_invoke;
    v47[3] = &unk_1E56DEA18;
    id v37 = v41;
    id v48 = v37;
    id v38 = v20;
    id v49 = v38;
    v51 = &v53;
    id v50 = v17;
    uint64_t v52 = v40;
    [(PKPaymentSession *)self performBlockSyncOnInternalSession:v47];
    id v14 = (id)v54[5];
  }
  _Block_object_dispose(&v53, 8);

  return v14;
}

void __70__PKInAppPaymentSession_authorizeWithRequest_authorizationParameters___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v3 = [a2 nfSession];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v28 = 0;
  id v6 = [v3 performECommercePayment:v4 request:v5 error:&v28];
  id v7 = v28;

  if (v6)
  {
    id v8 = *(id *)(a1 + 48);
    id v9 = v6;
    id v10 = objc_alloc_init(PKWrappedPayment);
    id v11 = [v9 transactionIdentifier];
    [(PKWrappedPayment *)v10 setTransactionIdentifier:v11];

    id v12 = [v9 transactionData];
    [(PKWrappedPayment *)v10 setTransactionData:v12];

    id v13 = [v9 confirmationBlobSignature];
    [(PKWrappedPayment *)v10 setTransactionInstructionsSignature:v13];

    id v14 = [PKSecureElementCertificateSet alloc];
    id v15 = [v9 certs];
    v16 = [(PKSecureElementCertificateSet *)v14 initWithDictionary:v15];
    [(PKWrappedPayment *)v10 setCertificates:v16];

    id v17 = [v8 countryCode];

    [(PKWrappedPayment *)v10 setMerchantCountryCode:v17];
    id v18 = [v9 SEPcerts];
    [(PKWrappedPayment *)v10 setSEPCertificates:v18];

    v19 = [v9 confirmationBlobHash];
    [(PKWrappedPayment *)v10 setConfirmationBlobHash:v19];

    uint64_t v20 = [v9 confirmationBlobVersion];
    [(PKWrappedPayment *)v10 setConfirmationBlobVersion:v20];
    uint64_t v21 = *(void *)(*(void *)(a1 + 56) + 8);
    v22 = *(NSObject **)(v21 + 40);
    *(void *)(v21 + 40) = v10;
  }
  else
  {
    v22 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v30 = v23;
      __int16 v31 = 2112;
      id v32 = v7;
      _os_log_impl(&dword_190E10000, v22, OS_LOG_TYPE_DEFAULT, "Failed to Authorize Payment Request: %@ Error: %@", buf, 0x16u);
    }
  }

  v24 = *(unsigned char **)(a1 + 64);
  if (v24)
  {
    if (v7)
    {
      v25 = [v7 domain];
      v26 = [NSString stringWithUTF8String:"nfcd"];
      if ([v25 isEqualToString:v26]) {
        BOOL v27 = [v7 code] == 14;
      }
      else {
        BOOL v27 = 0;
      }
      **(unsigned char **)(a1 + 64) = v27;
    }
    else
    {
      unsigned char *v24 = 0;
    }
  }
}

- (id)_appletForPaymentApplication:(id)a3
{
  uint64_t v4 = [a3 applicationIdentifier];
  uint64_t v5 = [(PKInAppPaymentSession *)self _appletWithIdentifier:v4];

  return v5;
}

- (id)_appletWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__64;
  id v15 = __Block_byref_object_dispose__64;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __47__PKInAppPaymentSession__appletWithIdentifier___block_invoke;
  v8[3] = &unk_1E56DB7D0;
  id v10 = &v11;
  id v5 = v4;
  id v9 = v5;
  [(PKPaymentSession *)self performBlockSyncOnInternalSession:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __47__PKInAppPaymentSession__appletWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v6 = [a2 nfSession];
  uint64_t v3 = [v6 appletWithIdentifier:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

@end