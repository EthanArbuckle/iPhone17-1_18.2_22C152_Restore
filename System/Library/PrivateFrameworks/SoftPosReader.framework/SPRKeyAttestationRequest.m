@interface SPRKeyAttestationRequest
- (NSData)derRepresentation;
- (NSData)publicKeyInfo;
- (SPRKeyAttestationRequest)initWithDERRepresentation:(id)a3 error:(id *)a4;
- (SPRKeyAttestationRequest)initWithPublicKeyInfo:(id)a3;
- (SPRKeyAttestationRequest)initWithSequence:(id *)a3 error:(id *)a4;
@end

@implementation SPRKeyAttestationRequest

- (SPRKeyAttestationRequest)initWithSequence:(id *)a3 error:(id *)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v9 = objc_msgSend_pinCrypto(SPRLogger, a2, (uint64_t)a3, (uint64_t)a4, v4, v5);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    unint64_t var1 = a3->var1;
    *(_DWORD *)buf = 134217984;
    *(void *)&buf[4] = var1;
    _os_log_impl(&dword_221247000, v9, OS_LOG_TYPE_INFO, "SPRKeyAttestationRequest.init(sequence:[%lu bytes])", buf, 0xCu);
  }

  v31[0] = 0;
  v31[1] = 0;
  *(_OWORD *)buf = 0u;
  long long v33 = 0u;
  if (sub_22126794C((uint64_t)a3, 2u, (uint64_t)&unk_2212802B8, (unint64_t)v31, 0x10uLL))
  {
    objc_msgSend_errorWithCode_reason_(SPRError, v11, 10005, @"request", v12, v13);
  }
  else if (sub_22126796C(v31, 0xAu, (uint64_t)&unk_2212802E8, (unint64_t)buf, 0x20uLL))
  {
    objc_msgSend_errorWithCode_reason_(SPRError, v14, 10005, @"appletData", v15, v16);
  }
  else
  {
    int v30 = 0;
    if (!sub_221267344((char **)buf, &v30) && v30 == 1)
    {
      objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v17, v33, *((uint64_t *)&v33 + 1), v18, v19);
      v20 = (NSData *)objc_claimAutoreleasedReturnValue();
      publicKeyInfo = self->_publicKeyInfo;
      self->_publicKeyInfo = v20;

      objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v22, (uint64_t)a3->var0, a3->var1, v23, v24);
      v25 = (NSData *)objc_claimAutoreleasedReturnValue();
      derRepresentation = self->_derRepresentation;
      self->_derRepresentation = v25;

      v27 = self;
      id v28 = 0;
      goto LABEL_14;
    }
    objc_msgSend_errorWithCode_reason_(SPRError, v17, 10005, @"appletDataVersion", v18, v19);
  }
  id v28 = (id)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    id v28 = v28;
    v27 = 0;
    *a4 = v28;
  }
  else
  {
    v27 = 0;
  }
LABEL_14:

  return v27;
}

- (SPRKeyAttestationRequest)initWithDERRepresentation:(id)a3 error:(id *)a4
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v12 = objc_msgSend_pinCrypto(SPRLogger, v7, v8, v9, v10, v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = objc_msgSend_asHexString(v6, v13, v14, v15, v16, v17);
    int v36 = 138412290;
    *(void *)v37 = v18;
    _os_log_impl(&dword_221247000, v12, OS_LOG_TYPE_INFO, "SPRKeyAttestationRequest.init(derRepresentation:%@)", (uint8_t *)&v36, 0xCu);
  }
  id v19 = v6;
  uint64_t v25 = objc_msgSend_bytes(v19, v20, v21, v22, v23, v24);
  *(void *)&v37[4] = objc_msgSend_length(v19, v26, v27, v28, v29, v30, v25);
  uint64_t v34 = (SPRKeyAttestationRequest *)objc_msgSend_initWithSequence_error_(self, v31, (uint64_t)&v36, (uint64_t)a4, v32, v33);

  return v34;
}

- (SPRKeyAttestationRequest)initWithPublicKeyInfo:(id)a3
{
  uint64_t v76 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v10 = objc_msgSend_pinCrypto(SPRLogger, v5, v6, v7, v8, v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_221247000, v10, OS_LOG_TYPE_INFO, "SPRKeyAttestationRequest.init(publicKeyInfo:%@)", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = &unk_2212803D8;
  *((void *)&buf + 1) = 1;
  v62 = &unk_2212803D9;
  uint64_t v63 = 24;
  v64 = &unk_2212803F8;
  uint64_t v65 = 8;
  v66 = &unk_221280400;
  uint64_t v67 = 4;
  v68 = &unk_221280404;
  uint64_t v69 = 4;
  v70 = &unk_221280408;
  uint64_t v71 = 1;
  uint64_t v11 = (NSData *)v4;
  uint64_t v72 = objc_msgSend_bytes(v11, v12, v13, v14, v15, v16);
  uint64_t v73 = objc_msgSend_length(v11, v17, v18, v19, v20, v21);
  v74 = &unk_221280409;
  uint64_t v75 = 15;
  uint64_t v60 = sub_221268510(0x2000000000000010, (unint64_t)&buf, 8, (uint64_t)&unk_221280440);
  objc_msgSend_dataWithLength_(MEMORY[0x263EFF990], v22, v60, v23, v24, v25);
  id v26 = objc_claimAutoreleasedReturnValue();
  unint64_t v32 = objc_msgSend_mutableBytes(v26, v27, v28, v29, v30, v31);
  sub_2212683FC(0x2000000000000010, (unint64_t)&buf, 8u, (uint64_t)&unk_221280440, v32, (unint64_t *)&v60);
  id v33 = v26;
  v59[0] = objc_msgSend_mutableBytes(v33, v34, v35, v36, v37, v38);
  v59[1] = objc_msgSend_length(v33, v39, v40, v41, v42, v43);
  v59[2] = &unk_221280418;
  v59[3] = 40;
  uint64_t v60 = sub_221268510(0x2000000000000010, (unint64_t)v59, 2, (uint64_t)&unk_221280500);
  objc_msgSend_dataWithLength_(MEMORY[0x263EFF990], v44, v60, v45, v46, v47);
  v48 = (NSData *) objc_claimAutoreleasedReturnValue();
  unint64_t v54 = objc_msgSend_mutableBytes(v48, v49, v50, v51, v52, v53);
  sub_2212683FC(0x2000000000000010, (unint64_t)v59, 2u, (uint64_t)&unk_221280500, v54, (unint64_t *)&v60);
  derRepresentation = self->_derRepresentation;
  self->_derRepresentation = v48;
  v56 = v48;

  publicKeyInfo = self->_publicKeyInfo;
  self->_publicKeyInfo = v11;

  return self;
}

- (NSData)derRepresentation
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (NSData)publicKeyInfo
{
  return self->_publicKeyInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicKeyInfo, 0);
  objc_storeStrong((id *)&self->_derRepresentation, 0);
}

@end