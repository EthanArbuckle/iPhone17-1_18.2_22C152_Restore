@interface SPRKeyAttestationInfo
- (NSData)derRepresentation;
- (NSData)signature;
- (SPRKeyAttestationInfo)initWithDERRepresentation:(id)a3 error:(id *)a4;
- (SPRKeyAttestationInfo)initWithRequest:(id)a3 signature:(id)a4;
- (SPRKeyAttestationRequest)request;
@end

@implementation SPRKeyAttestationInfo

- (SPRKeyAttestationInfo)initWithDERRepresentation:(id)a3 error:(id *)a4
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v12 = objc_msgSend_pinCrypto(SPRLogger, v7, v8, v9, v10, v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v18 = objc_msgSend_asHexString(v6, v13, v14, v15, v16, v17);
    *(_DWORD *)buf = 138412290;
    *(void *)&buf[4] = v18;
    _os_log_impl(&dword_221247000, v12, OS_LOG_TYPE_INFO, "SPRKeyAttestationInfo.init(derRepresentation:%@)", buf, 0xCu);
  }
  long long v54 = 0u;
  long long v55 = 0u;
  *(_OWORD *)buf = 0u;
  id v19 = v6;
  v52[0] = objc_msgSend_bytes(v19, v20, v21, v22, v23, v24);
  v52[1] = objc_msgSend_length(v19, v25, v26, v27, v28, v29);
  if (sub_22126794C((uint64_t)v52, 3u, (uint64_t)&unk_221280530, (unint64_t)buf, 0x30uLL))
  {
    v33 = @"attestation";
LABEL_13:
    objc_msgSend_errorWithCode_reason_(SPRError, v30, 10005, (uint64_t)v33, v31, v32);
    goto LABEL_14;
  }
  memset(v51, 0, sizeof(v51));
  if (sub_22126796C((unint64_t *)&v54, 2u, (uint64_t)&unk_221281168, (unint64_t)v51, 0x20uLL))
  {
    v33 = @"signingAlg";
    goto LABEL_13;
  }
  uint64_t v49 = 0;
  uint64_t v50 = 0;
  char v48 = 0;
  if (sub_221267284((uint64_t)&v55, (unint64_t *)&v49, &v48) || v48)
  {
    v33 = @"signature";
    goto LABEL_13;
  }
  v34 = [SPRKeyAttestationRequest alloc];
  v38 = (SPRKeyAttestationRequest *)objc_msgSend_initWithSequence_error_(v34, v35, (uint64_t)buf, (uint64_t)a4, v36, v37);
  request = self->_request;
  self->_request = v38;

  if (!self->_request)
  {
    id v46 = 0;
    if (a4) {
      goto LABEL_15;
    }
    goto LABEL_17;
  }
  if (!sub_221268590((uint64_t)v51, (uint64_t)&off_26459D3F0))
  {
    objc_msgSend_errorWithCode_reason_(SPRError, v40, 10008, @"signingAlg", v41, v42);
LABEL_14:
    id v46 = (id)objc_claimAutoreleasedReturnValue();
    if (a4)
    {
LABEL_15:
      id v46 = v46;
      v45 = 0;
      *a4 = v46;
      goto LABEL_18;
    }
LABEL_17:
    v45 = 0;
    goto LABEL_18;
  }
  objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v40, v49, v50, v41, v42);
  v43 = (NSData *)objc_claimAutoreleasedReturnValue();
  signature = self->_signature;
  self->_signature = v43;

  v45 = self;
  id v46 = 0;
LABEL_18:

  return v45;
}

- (SPRKeyAttestationInfo)initWithRequest:(id)a3 signature:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = (SPRKeyAttestationRequest *)a3;
  v7 = (NSData *)a4;
  v13 = objc_msgSend_pinCrypto(SPRLogger, v8, v9, v10, v11, v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v18 = 138412546;
    id v19 = v6;
    __int16 v20 = 2112;
    uint64_t v21 = v7;
    _os_log_impl(&dword_221247000, v13, OS_LOG_TYPE_INFO, "SPRKeyAttestationInfo.init(request:%@, signature:%@)", (uint8_t *)&v18, 0x16u);
  }

  request = self->_request;
  self->_request = v6;
  uint64_t v15 = v6;

  signature = self->_signature;
  self->_signature = v7;

  return self;
}

- (NSData)derRepresentation
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  unint64_t v53 = 16;
  sub_221267C50(6uLL, 8uLL, &unk_2212811A0, (unint64_t)v54, &v53);
  v7 = objc_msgSend_dataWithLength_(MEMORY[0x263EFF990], v3, 1, v4, v5, v6);
  objc_msgSend_appendData_(v7, v8, (uint64_t)self->_signature, v9, v10, v11);
  objc_msgSend_derRepresentation(self->_request, v12, v13, v14, v15, v16);
  id v17 = objc_claimAutoreleasedReturnValue();
  v52[0] = objc_msgSend_bytes(v17, v18, v19, v20, v21, v22);
  v52[1] = objc_msgSend_length(v17, v23, v24, v25, v26, v27);
  void v52[2] = v54;
  v52[3] = v53;
  id v28 = v7;
  v52[4] = objc_msgSend_bytes(v28, v29, v30, v31, v32, v33);
  v52[5] = objc_msgSend_length(v28, v34, v35, v36, v37, v38);
  uint64_t v51 = sub_221268510(0x2000000000000010, (unint64_t)v52, 3, (uint64_t)&unk_221280578);
  objc_msgSend_dataWithLength_(MEMORY[0x263EFF990], v39, v51, v40, v41, v42);
  id v43 = objc_claimAutoreleasedReturnValue();
  unint64_t v49 = objc_msgSend_mutableBytes(v43, v44, v45, v46, v47, v48);
  sub_2212683FC(0x2000000000000010, (unint64_t)v52, 3u, (uint64_t)&unk_221280578, v49, (unint64_t *)&v51);

  return (NSData *)v43;
}

- (SPRKeyAttestationRequest)request
{
  return self->_request;
}

- (NSData)signature
{
  return self->_signature;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end