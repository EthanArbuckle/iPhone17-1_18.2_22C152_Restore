@interface PKApplePayTrustSession
- (BOOL)deleteKeyWithIdentifier:(id)a3;
- (PKApplePayTrustSession)initWithInternalSession:(id)a3 targetQueue:(id)a4;
- (id)createKeyWithRequest:(id)a3 error:(id *)a4;
- (id)keyWithIdentifier:(id)a3;
- (id)signatureForRequest:(id)a3 withAuthorization:(id)a4;
@end

@implementation PKApplePayTrustSession

- (PKApplePayTrustSession)initWithInternalSession:(id)a3 targetQueue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 nfSession];
  PKGetClassNFTrustSession();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    [v6 endSession];

    id v6 = 0;
  }
  v12.receiver = self;
  v12.super_class = (Class)PKApplePayTrustSession;
  v10 = [(PKPaymentSession *)&v12 initWithInternalSession:v6 targetQueue:v7];

  return v10;
}

- (id)createKeyWithRequest:(id)a3 error:(id *)a4
{
  v43[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__48;
  v38 = __Block_byref_object_dispose__48;
  id v39 = 0;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__48;
  v32 = __Block_byref_object_dispose__48;
  id v33 = 0;
  id v5 = PKGetClassNFTrustLocalValidation();
  id v6 = PKGetClassNFTrustKeyRequest();
  id v7 = [v4 subjectIdentifier];
  v8 = [v5 localValidationWithPassCode];
  v42 = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v42 count:1];
  v43[0] = v9;
  v10 = [v5 localValidationWithTouchID];
  v41 = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
  v43[1] = v11;
  objc_super v12 = [v5 localValidationWithFaceID];
  v40 = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
  v43[2] = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:3];
  v15 = [v6 keyRequestWithSubjectIdentifier:v7 discretionaryData:0 localValidations:v14 counterLimit:&unk_1EE22C020];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __53__PKApplePayTrustSession_createKeyWithRequest_error___block_invoke;
  v23[3] = &unk_1E56ED0A8;
  id v16 = v4;
  id v24 = v16;
  id v17 = v15;
  id v25 = v17;
  v26 = &v34;
  v27 = &v28;
  [(PKPaymentSession *)self performBlockSyncOnInternalSession:v23];
  v18 = v35;
  if (a4 && !v35[5])
  {
    *a4 = (id) v29[5];
    v18 = v35;
  }
  id v19 = (id)v18[5];

  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&v34, 8);

  return v19;
}

void __53__PKApplePayTrustSession_createKeyWithRequest_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [a2 nfSession];
  id v4 = [*(id *)(a1 + 32) keyIdentifier];
  uint64_t v5 = *(void *)(a1 + 40);
  id v15 = 0;
  id v6 = [v3 createKey:v4 request:v5 error:&v15];
  id v7 = v15;

  if (v6)
  {
    v8 = [[PKApplePayTrustKey alloc] initWithKey:v6];
    uint64_t v9 = *(void *)(a1 + 48);
  }
  else
  {
    v10 = PKLogFacilityTypeGetObject(0xFuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v12 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v17 = v11;
      __int16 v18 = 2112;
      uint64_t v19 = v12;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Failed to create Apple Pay Trust key: %@ Error: %@", buf, 0x16u);
    }

    v8 = (PKApplePayTrustKey *)[v7 copy];
    uint64_t v9 = *(void *)(a1 + 56);
  }
  uint64_t v13 = *(void *)(v9 + 8);
  v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = v8;
}

- (id)keyWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__48;
  id v16 = __Block_byref_object_dispose__48;
  id v17 = 0;
  if (v4)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __44__PKApplePayTrustSession_keyWithIdentifier___block_invoke;
    v9[3] = &unk_1E56DB730;
    id v10 = v4;
    uint64_t v11 = &v12;
    [(PKPaymentSession *)self performBlockSyncOnInternalSession:v9];

    id v6 = (void *)v13[5];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __44__PKApplePayTrustSession_keyWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [a2 nfSession];
  uint64_t v4 = *(void *)(a1 + 32);
  id v12 = 0;
  uint64_t v5 = [v3 getKey:v4 error:&v12];
  id v6 = v12;

  if (v6) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v5 == 0;
  }
  if (v7)
  {
    uint64_t v11 = PKLogFacilityTypeGetObject(0xFuLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v14 = v8;
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, "Failed to get key with keyIdentifier: %@, error: %@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v9 = [[PKApplePayTrustKey alloc] initWithKey:v5];
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v11 = *(NSObject **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
}

- (BOOL)deleteKeyWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  if (v4)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __50__PKApplePayTrustSession_deleteKeyWithIdentifier___block_invoke;
    v8[3] = &unk_1E56DB7D0;
    uint64_t v10 = &v11;
    id v9 = v4;
    [(PKPaymentSession *)self performBlockSyncOnInternalSession:v8];

    BOOL v6 = *((unsigned char *)v12 + 24) != 0;
  }
  else
  {
    BOOL v6 = 0;
  }
  _Block_object_dispose(&v11, 8);

  return v6;
}

void __50__PKApplePayTrustSession_deleteKeyWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [a2 nfSession];
  uint64_t v4 = *(void *)(a1 + 32);
  id v12 = 0;
  char v5 = [v3 deleteKey:v4 error:&v12];
  id v6 = v12;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;

  LODWORD(v3) = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  BOOL v7 = PKLogFacilityTypeGetObject(0xFuLL);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      id v9 = "Successfully deleted Apple Pay Trust key.";
      uint64_t v10 = v7;
      uint32_t v11 = 2;
LABEL_6:
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
    }
  }
  else if (v8)
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v6;
    id v9 = "Failed to delete Apple Pay Trust key with Error: %@";
    uint64_t v10 = v7;
    uint32_t v11 = 12;
    goto LABEL_6;
  }
}

- (id)signatureForRequest:(id)a3 withAuthorization:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__48;
  id v33 = __Block_byref_object_dispose__48;
  id v34 = 0;
  if (PKMockOsloSecureElementAuth())
  {
    BOOL v8 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "PKApplePayTrustSession signatureForRequest: mocking signature", buf, 2u);
    }

    id v9 = [PKApplePayTrustSignature alloc];
    uint64_t v10 = [@"000000000000000000000000000000000000000000000000" dataUsingEncoding:4];
    uint64_t v11 = [(PKApplePayTrustSignature *)v9 initWithSignatureRequest:v6 signature:v10];
    id v12 = (void *)v30[5];
    v30[5] = v11;

    id v13 = (id)v30[5];
  }
  else
  {
    id v14 = [v6 nonce];
    unint64_t v15 = [v14 length];
    if (v15 > 7)
    {
      id v17 = v14;
    }
    else
    {
      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
      [v16 increaseLengthBy:8 - v15];
      [v16 appendData:v14];
      id v17 = (id)[v16 copy];
    }
    id v18 = PKGetClassNFTrustSignRequest();
    uint64_t v19 = [v6 manifestHash];
    uint64_t v20 = [v18 signRequestWithChallenge:v17 data:v19];

    v21 = PKLogFacilityTypeGetObject(0xFuLL);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v36 = v20;
      _os_log_impl(&dword_190E10000, v21, OS_LOG_TYPE_DEFAULT, "Signing Apple Pay Trust Request: %@", buf, 0xCu);
    }

    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __64__PKApplePayTrustSession_signatureForRequest_withAuthorization___block_invoke;
    v24[3] = &unk_1E56ED0D0;
    id v25 = v6;
    id v22 = v20;
    id v26 = v22;
    id v27 = v7;
    uint64_t v28 = &v29;
    [(PKPaymentSession *)self performBlockSyncOnInternalSession:v24];
    id v13 = (id)v30[5];
  }
  _Block_object_dispose(&v29, 8);

  return v13;
}

void __64__PKApplePayTrustSession_signatureForRequest_withAuthorization___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [a2 nfSession];
  uint64_t v4 = [*(id *)(a1 + 32) keyIdentifier];
  uint64_t v5 = *(void *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v15 = 0;
  id v7 = [v3 signWithKey:v4 request:v5 authorization:v6 error:&v15];
  id v8 = v15;

  if (v7)
  {
    id v9 = [v7 rawData];
    uint64_t v10 = objc_msgSend(v9, "pk_decodeHexadecimal");

    uint64_t v11 = [[PKApplePayTrustSignature alloc] initWithSignatureRequest:*(void *)(a1 + 32) signature:v10];
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
    id v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
  else
  {
    uint64_t v10 = PKLogFacilityTypeGetObject(0xFuLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v17 = v14;
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_impl(&dword_190E10000, v10, OS_LOG_TYPE_DEFAULT, "Failed to sign Apple Pay Trust Signature Request: %@ Error: %@", buf, 0x16u);
    }
  }
}

@end