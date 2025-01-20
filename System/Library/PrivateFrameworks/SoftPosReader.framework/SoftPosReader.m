void sub_221249F00(void *a1, uint64_t a2, long long *a3, void *a4)
{
  void *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  long long v15;
  uint64_t v16;

  v5 = (void *)MEMORY[0x263F087B0];
  v15 = *a3;
  LODWORD(v16) = *((_DWORD *)a3 + 4);
  v6 = a4;
  v11 = objc_msgSend_decimalNumberWithDecimal_(v5, v7, (uint64_t)&v15, v8, v9, v10);
  objc_msgSend_encodeObject_forKey_(a1, v12, (uint64_t)v11, (uint64_t)v6, v13, v14, v15, v16);
}

void sub_221249F7C(void *a1@<X0>, void *a2@<X2>, uint64_t a3@<X8>)
{
  id v5 = a2;
  uint64_t v6 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(a1, v7, v6, (uint64_t)v5, v8, v9);
  id v16 = (id)objc_claimAutoreleasedReturnValue();

  v15 = v16;
  if (v16
    || (objc_msgSend_notANumber(MEMORY[0x263F087B0], v10, v11, v12, v13, v14),
        (v15 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v17 = v15;
    objc_msgSend_decimalValue(v15, v10, v11, v12, v13, v14);
  }
  else
  {
    *(void *)a3 = 0;
    *(void *)(a3 + 8) = 0;
    *(_DWORD *)(a3 + 16) = 0;
  }
}

void sub_22124A108(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v9[15] = *MEMORY[0x263EF8340];
  v8[0] = &unk_26D3234F0;
  v8[1] = &unk_26D323508;
  v9[0] = @"Applet select failed";
  v9[1] = @"Attestation failed";
  v8[2] = &unk_26D323520;
  v8[3] = &unk_26D323538;
  v9[2] = @"Bad applet response";
  v9[3] = @"PIN length exceeded";
  v8[4] = &unk_26D323550;
  v8[5] = &unk_26D323568;
  v9[4] = @"Remove from empty buffer";
  v9[5] = @"Add digit failed";
  v8[6] = &unk_26D323580;
  v8[7] = &unk_26D323598;
  v9[6] = @"Digit out of range";
  v9[7] = @"Too few digits";
  v8[8] = &unk_26D3235B0;
  v8[9] = &unk_26D3235C8;
  v9[8] = @"Invalid key algorithm";
  v9[9] = @"Invalid format";
  v8[10] = &unk_26D3235E0;
  v8[11] = &unk_26D3235F8;
  v9[10] = @"Internal error";
  v9[11] = @"Key creation failed";
  v8[12] = &unk_26D323610;
  v8[13] = &unk_26D323628;
  v9[12] = @"Signature verification failed";
  v9[13] = @"XPC service disconnected";
  v8[14] = &unk_26D323640;
  v9[14] = @"XPC service unavailable";
  uint64_t v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, a2, (uint64_t)v9, (uint64_t)v8, 15, a6);
  v7 = (void *)qword_267F494D8;
  qword_267F494D8 = v6;
}

BOOL SPRHTTPStatusIsSuccess(uint64_t a1)
{
  return (unint64_t)(a1 - 200) < 0x64;
}

BOOL SPRHTTPStatusIsClientError(uint64_t a1)
{
  return (unint64_t)(a1 - 400) < 0x64;
}

BOOL SPRHTTPStatusIsServerError(uint64_t a1)
{
  return (unint64_t)(a1 - 500) < 0x64;
}

id sub_22124DC6C(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  id v5 = (void *)MEMORY[0x263EFF980];
  uint64_t v11 = objc_msgSend_count(v3, v6, v7, v8, v9, v10);
  id v16 = objc_msgSend_arrayWithCapacity_(v5, v12, v11, v13, v14, v15);
  if (objc_msgSend_count(v3, v17, v18, v19, v20, v21))
  {
    unint64_t v22 = 0;
    do
    {
      v23 = objc_opt_new();
      v28 = objc_msgSend_objectAtIndexedSubscript_(v3, v24, v22, v25, v26, v27);
      objc_msgSend_setMerchantId_(v23, v29, (uint64_t)v28, v30, v31, v32);

      if (v22 < objc_msgSend_count(v4, v33, v34, v35, v36, v37))
      {
        v42 = NSURL;
        v43 = NSString;
        v44 = objc_msgSend_objectAtIndexedSubscript_(v4, v38, v22, v39, v40, v41);
        v49 = objc_msgSend_stringWithFormat_(v43, v45, @"%@", v46, v47, v48, v44);
        v54 = objc_msgSend_URLWithString_(v42, v50, (uint64_t)v49, v51, v52, v53);
        objc_msgSend_setVasUrl_(v23, v55, (uint64_t)v54, v56, v57, v58);
      }
      objc_msgSend_setVasTerminalProtocol_(v23, v38, 0x26D323670, v39, v40, v41);
      objc_msgSend_addObject_(v16, v59, (uint64_t)v23, v60, v61, v62);

      ++v22;
    }
    while (v22 < objc_msgSend_count(v3, v63, v64, v65, v66, v67));
  }

  return v16;
}

uint64_t sub_22124E7E0(uint64_t a1, uint64_t a2, unsigned char *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], (const char *)a2, *(void *)(a2 + 8), *(void *)(a2 + 16), a5, a6);
  *a3 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return 0;
}

uint64_t sub_22124E944(uint64_t a1, uint64_t a2, unsigned char *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v8 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], (const char *)a2, *(void *)(a2 + 8), *(void *)(a2 + 16), a5, a6);
  *a3 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();

  return 0;
}

void sub_22124F274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_22124F298(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_22124F2A8(uint64_t a1)
{
}

void sub_22124F2B0(uint64_t a1, void *a2)
{
}

void sub_22124F2C0(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7 && v8)
  {
    uint64_t v10 = [SPRPINCrypto alloc];
    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    id obj = *(id *)(v11 + 40);
    uint64_t v14 = objc_msgSend_initWithAttestationData_casdCertificate_error_(v10, v12, (uint64_t)v7, (uint64_t)v8, (uint64_t)&obj, v13);
    objc_storeStrong((id *)(v11 + 40), obj);
    uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a4);
  }
}

void sub_22124F69C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_22124F6CC(uint64_t a1, void *a2)
{
}

void sub_22124F6DC(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2 == 0;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
}

void sub_22124F874(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_22124F898(uint64_t a1, void *a2)
{
}

void sub_22124F8A8(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2 == 0;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
}

void sub_22124FAA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_22124FACC(uint64_t a1, void *a2)
{
}

void sub_22124FADC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_22124FC0C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v9 = objc_msgSend_xpcClient(SPRLogger, v4, v5, v6, v7, v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_22127D204(a1, (uint64_t)v3, v9);
  }
}

void sub_22124FE10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_22124FE34(uint64_t a1, void *a2)
{
}

void sub_22124FE44(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2 == 0;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
}

void sub_22124FFFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_221250020(uint64_t a1, void *a2)
{
}

void sub_221250030(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2 == 0;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
}

id sub_221250068(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = (void *)MEMORY[0x263F089D8];
  uint64_t v8 = objc_msgSend_length(a1, a2, a3, a4, a5, a6);
  uint64_t v13 = objc_msgSend_stringWithCapacity_(v7, v9, 2 * v8, v10, v11, v12);
  if (objc_msgSend_length(a1, v14, v15, v16, v17, v18))
  {
    unint64_t v19 = 0;
    do
    {
      id v20 = a1;
      uint64_t v26 = objc_msgSend_bytes(v20, v21, v22, v23, v24, v25);
      objc_msgSend_appendFormat_(v13, v27, @"%02X", v28, v29, v30, *(unsigned __int8 *)(v26 + v19++));
    }
    while (v19 < objc_msgSend_length(v20, v31, v32, v33, v34, v35));
  }
  return v13;
}

id sub_221250124(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  uint64_t v9 = objc_msgSend_UTF8String(v3, v4, v5, v6, v7, v8);
  uint64_t v15 = 0;
  if (v3)
  {
    uint64_t v16 = v9;
    if (v9)
    {
      if ((objc_msgSend_length(v3, v10, v11, v12, v13, v14) & 1) == 0)
      {
        if (objc_msgSend_length(v3, v17, v18, v19, v20, v21))
        {
          char v59 = 0;
          unint64_t v27 = objc_msgSend_length(v3, v22, v23, v24, v25, v26);
          uint64_t v28 = malloc_type_malloc(v27 >> 1, 0xE07566B0uLL);
          unint64_t v34 = objc_msgSend_length(v3, v29, v30, v31, v32, v33);
          bzero(v28, v34 >> 1);
          if (objc_msgSend_length(v3, v35, v36, v37, v38, v39))
          {
            unint64_t v45 = 0;
            uint64_t v46 = MEMORY[0x263EF8318];
            while (1)
            {
              *(_WORD *)__str = *(_WORD *)(v16 + v45);
              if (__str[0] < 0
                || (*(_DWORD *)(v46 + 4 * __str[0] + 60) & 0x10000) == 0
                || *(__int16 *)__str < 0
                || (*(_DWORD *)(v46 + ((4 * __str[1]) & 0x3FFFFFFFCLL) + 60) & 0x10000) == 0)
              {
                break;
              }
              *((unsigned char *)v28 + (v45 >> 1)) = strtoul(__str, 0, 16);
              v45 += 2;
              if (v45 >= objc_msgSend_length(v3, v47, v48, v49, v50, v51)) {
                goto LABEL_12;
              }
            }
            free(v28);
            goto LABEL_16;
          }
LABEL_12:
          uint64_t v52 = (void *)MEMORY[0x263EFF8F8];
          unint64_t v53 = objc_msgSend_length(v3, v40, v41, v42, v43, v44);
          uint64_t v56 = objc_msgSend_dataWithBytesNoCopy_length_freeWhenDone_(v52, v54, (uint64_t)v28, v53 >> 1, 1, v55);
        }
        else
        {
          uint64_t v56 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v22, 0, 0, v25, v26);
        }
        uint64_t v15 = (void *)v56;
        goto LABEL_17;
      }
LABEL_16:
      uint64_t v15 = 0;
    }
  }
LABEL_17:

  return v15;
}

uint64_t sub_221250DC0(void *a1, const char *a2, uint64_t a3, unsigned char *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = objc_msgSend_objectForKey_(a1, a2, a3, (uint64_t)a4, a5, a6);
  uint64_t v13 = (void *)v7;
  if (v7)
  {
    objc_opt_class();
    LOBYTE(v7) = objc_opt_isKindOfClass();
  }
  if (a4) {
    *a4 = v7 & 1;
  }
  if (v7) {
    uint64_t v14 = objc_msgSend_BOOLValue(v13, v8, v9, v10, v11, v12);
  }
  else {
    uint64_t v14 = 0;
  }

  return v14;
}

uint64_t sub_221250E34(void *a1, const char *a2, uint64_t a3, unsigned char *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = objc_msgSend_objectForKey_(a1, a2, a3, (uint64_t)a4, a5, a6);
  uint64_t v13 = (void *)v7;
  if (v7)
  {
    objc_opt_class();
    LOBYTE(v7) = objc_opt_isKindOfClass();
  }
  if (a4) {
    *a4 = v7 & 1;
  }
  if (v7) {
    uint64_t v14 = objc_msgSend_integerValue(v13, v8, v9, v10, v11, v12);
  }
  else {
    uint64_t v14 = 0;
  }

  return v14;
}

void sub_221250EA8(void *a1@<X0>, const char *a2@<X1>, uint64_t a3@<X2>, unsigned char *a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v9 = objc_msgSend_objectForKey_(a1, a2, a3, (uint64_t)a4, a5, a6);
  id v16 = (id)v9;
  if (v9)
  {
    objc_opt_class();
    LOBYTE(v9) = objc_opt_isKindOfClass();
  }
  if (a4) {
    *a4 = v9 & 1;
  }
  if ((v9 & 1) == 0)
  {
    *(void *)a7 = 0;
    *(void *)(a7 + 8) = 0;
    *(_DWORD *)(a7 + 16) = 0;
    goto LABEL_9;
  }
  uint64_t v15 = v16;
  if (v16)
  {
    objc_msgSend_decimalValue(v16, v10, v11, v12, v13, v14);
LABEL_9:
    uint64_t v15 = v16;
    goto LABEL_11;
  }
  *(void *)a7 = 0;
  *(void *)(a7 + 8) = 0;
  *(_DWORD *)(a7 + 16) = 0;
LABEL_11:
}

double sub_221250F4C(void *a1, const char *a2, uint64_t a3, unsigned char *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v7 = objc_msgSend_objectForKey_(a1, a2, a3, (uint64_t)a4, a5, a6);
  uint64_t v13 = (void *)v7;
  if (v7)
  {
    objc_opt_class();
    LOBYTE(v7) = objc_opt_isKindOfClass();
  }
  if (a4) {
    *a4 = v7 & 1;
  }
  double v14 = 0.0;
  if (v7)
  {
    objc_msgSend_doubleValue(v13, v8, v9, v10, v11, v12);
    double v14 = v15;
  }

  return v14;
}

uint64_t sub_221250FC4(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = NSString;
  uint64_t v7 = objc_msgSend_BOOLValue(a1, a2, a3, a4, a5, a6);
  return MEMORY[0x270F9A6D0](v6, sel_stringWithBool_, v7, v8, v9, v10);
}

__CFString *sub_221251004(uint64_t a1, uint64_t a2, int a3)
{
  if (a3) {
    return @"true";
  }
  else {
    return @"false";
  }
}

void sub_2212510C0(uint64_t a1)
{
  id v1 = objc_alloc(*(Class *)(a1 + 32));
  v2 = (void *)MEMORY[0x263F086E0];
  uint64_t v3 = objc_opt_class();
  objc_msgSend_bundleForClass_(v2, v4, v3, v5, v6, v7);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = objc_msgSend_initWithBundle_timestamp_(v1, v8, (uint64_t)v13, @"Wed Dec 31 16:00:00 1969", v9, v10);
  uint64_t v12 = (void *)qword_26AD433F8;
  qword_26AD433F8 = v11;
}

void sub_221251884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2212518A8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_2212518B8(uint64_t a1)
{
}

void sub_2212518C0(uint64_t a1, void *a2)
{
}

void sub_2212518D0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_221251B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_221251B6C(uint64_t a1, void *a2)
{
}

void sub_221251B7C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_221251D4C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_221251E0C;
  v7[3] = &unk_26459CC10;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t sub_221251E0C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void sub_221251E24(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_221251F08;
  block[3] = &unk_26459CC60;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t sub_221251F08(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_221252094(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_221252154;
  v6[3] = &unk_26459CCB0;
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t sub_221252154(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_onFailureWithError_, *(void *)(a1 + 40), a4, a5, a6);
}

void sub_221252160(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_221252244;
  block[3] = &unk_26459CD00;
  id v11 = v5;
  id v12 = *(id *)(a1 + 40);
  id v13 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, block);
}

void *sub_221252244(void *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = result[4];
  if (v6) {
    return (void *)MEMORY[0x270F9A6D0](result[5], sel_onSuccessWithInstallData_, v6, a4, a5, a6);
  }
  uint64_t v7 = result[6];
  if (v7) {
    return (void *)MEMORY[0x270F9A6D0](result[5], sel_onFailureWithError_, v7, a4, a5, a6);
  }
  return result;
}

void sub_221252468(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_22125248C(uint64_t a1, void *a2)
{
}

void sub_22125249C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

__CFString *SPRTransactionTypeCopyDescription(int a1)
{
  if (a1 > 22)
  {
    switch(a1)
    {
      case 23:
        return @"pre-authorization completion";
      case 32:
        return @"refund";
      case 34:
        return @"purchase correction";
    }
  }
  else
  {
    switch(a1)
    {
      case 0:
        return @"purchase";
      case 2:
        return @"refund correction";
      case 3:
        return @"pre-authorization";
    }
  }
  return @"invalid";
}

void sub_22125288C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_2212528B0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_2212528C0(uint64_t a1)
{
}

void sub_2212528C8(uint64_t a1, void *a2)
{
}

void sub_2212528D8(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2 == 0;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
}

void spr_releaseCFObject(CFTypeRef cf)
{
  if (cf) {
    CFRelease(cf);
  }
}

void sub_221252AC4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_221252B84;
  v7[3] = &unk_26459CC10;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t sub_221252B84(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void sub_221252B9C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_221252C80;
  block[3] = &unk_26459CC60;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t sub_221252C80(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_221252E0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_221252E30(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_221252E40(uint64_t a1)
{
}

void sub_221252E48(uint64_t a1, void *a2)
{
}

void sub_221252E58(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2 == 0;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
}

void sub_221252F8C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_22125304C;
  v7[3] = &unk_26459CC10;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t sub_22125304C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void sub_221253064(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_221253148;
  block[3] = &unk_26459CC60;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t sub_221253148(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_221253318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_22125333C(uint64_t a1, void *a2)
{
}

void sub_22125334C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

__CFString *SPRReaderModeCopyDescription(unint64_t a1)
{
  if (a1 > 3) {
    return @"invalid";
  }
  else {
    return off_26459CEB8[a1];
  }
}

void sub_221253AB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_221253AD0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_221253AE0(uint64_t a1)
{
}

void sub_221253AE8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v9 = objc_msgSend_xpcClient(SPRLogger, v4, v5, v6, v7, v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_22127D290(a1, (uint64_t)v3, v9);
  }
}

void sub_221253B54(uint64_t a1, void *a2)
{
}

void sub_221253C08(uint64_t a1)
{
  v2 = [SPRProvider alloc];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_221253CA8;
  v10[3] = &unk_26459CF30;
  v10[4] = *(void *)(a1 + 32);
  uint64_t v7 = objc_msgSend_initWithConnector_(v2, v3, (uint64_t)v10, v4, v5, v6);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 32);
  *(void *)(v8 + 32) = v7;
}

id sub_221253CA8(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  unint64_t v27 = sub_221253AD0;
  uint64_t v28 = sub_221253AE0;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = sub_221253AD0;
  uint64_t v22 = sub_221253AE0;
  id v23 = 0;
  uint64_t v7 = *(void **)(a1 + 32);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_221253E80;
  v17[3] = &unk_26459CAD0;
  v17[4] = &v24;
  uint64_t v8 = objc_msgSend_syncProxyWithErrorHandler_(v7, a2, (uint64_t)v17, a4, a5, a6);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_221253E90;
  v16[3] = &unk_26459CF08;
  v16[4] = &v18;
  objc_msgSend_providerProxyWithReply_(v8, v9, (uint64_t)v16, v10, v11, v12);

  if (a2)
  {
    uint64_t v13 = (void *)v25[5];
    if (v13) {
      *(void *)a2 = v13;
    }
  }
  id v14 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v14;
}

void sub_221253E5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_221253E80(uint64_t a1, void *a2)
{
}

void sub_221253E90(uint64_t a1, void *a2)
{
}

void sub_221254100(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_221254118(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = sub_221253AD0;
  unint64_t v34 = sub_221253AE0;
  id v35 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  unint64_t v27 = sub_221253AD0;
  uint64_t v28 = sub_221253AE0;
  id v29 = 0;
  uint64_t v8 = objc_msgSend_shared(SPRServiceClient, a2, a3, a4, a5, a6);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = sub_221254328;
  v23[3] = &unk_26459CAD0;
  v23[4] = &v30;
  uint64_t v13 = objc_msgSend_syncProxyWithErrorHandler_(v8, v9, (uint64_t)v23, v10, v11, v12);
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void *)(*(void *)(v14 + 8) + 40);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = sub_221254338;
  v22[3] = &unk_26459CF80;
  v22[4] = &v24;
  v22[5] = v14;
  v22[6] = &v30;
  objc_msgSend_primerProxyWithConfiguration_reply_(v13, v16, v15, (uint64_t)v22, v17, v18);

  if (a2)
  {
    uint64_t v19 = (void *)v31[5];
    if (v19) {
      *(void *)a2 = v19;
    }
  }
  id v20 = (id)v25[5];
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  return v20;
}

void sub_221254304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_221254328(uint64_t a1, void *a2)
{
}

void sub_221254338(void *a1, void *a2, void *a3, void *a4)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a2);
  if (v8)
  {
    id v30 = v10;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v11 = v9;
    uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v31, (uint64_t)v35, 16, v13);
    if (v14)
    {
      uint64_t v19 = v14;
      uint64_t v20 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v32 != v20) {
            objc_enumerationMutation(v11);
          }
          uint64_t v22 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          id v23 = *(void **)(*(void *)(a1[5] + 8) + 40);
          uint64_t v24 = objc_msgSend_objectForKeyedSubscript_(v11, v15, v22, v16, v17, v18);
          objc_msgSend_setValue_forKey_(v23, v25, (uint64_t)v24, v22, v26, v27);
        }
        uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v15, (uint64_t)&v31, (uint64_t)v35, 16, v18);
      }
      while (v19);
    }

    id v10 = v30;
  }
  uint64_t v28 = *(void *)(a1[6] + 8);
  id v29 = *(void **)(v28 + 40);
  *(void *)(v28 + 40) = v10;
}

id sub_221254728(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = sub_221253AD0;
  uint64_t v28 = sub_221253AE0;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = sub_221253AD0;
  uint64_t v22 = sub_221253AE0;
  id v23 = 0;
  uint64_t v7 = *(void **)(a1 + 32);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_221254908;
  v17[3] = &unk_26459CAD0;
  v17[4] = &v24;
  id v8 = objc_msgSend_syncProxyWithErrorHandler_(v7, a2, (uint64_t)v17, a4, a5, a6);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_221254918;
  v16[3] = &unk_26459CFD0;
  v16[4] = &v18;
  void v16[5] = &v24;
  objc_msgSend_secureChannelProxyWithReply_(v8, v9, (uint64_t)v16, v10, v11, v12);

  if (a2)
  {
    uint64_t v13 = (void *)v25[5];
    if (v13) {
      *(void *)a2 = v13;
    }
  }
  id v14 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v14;
}

void sub_2212548E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_221254908(uint64_t a1, void *a2)
{
}

void sub_221254918(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

id sub_221254AE8(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = sub_221254CC8;
  uint64_t v28 = sub_221254CD8;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = sub_221254CC8;
  uint64_t v22 = sub_221254CD8;
  id v23 = 0;
  uint64_t v7 = *(void **)(a1 + 32);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_221254CE0;
  v17[3] = &unk_26459CAD0;
  v17[4] = &v24;
  id v8 = objc_msgSend_syncProxyWithErrorHandler_(v7, a2, (uint64_t)v17, a4, a5, a6);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_221254CF0;
  v16[3] = &unk_26459D020;
  v16[4] = &v18;
  void v16[5] = &v24;
  objc_msgSend_configuratorProxyWithReply_(v8, v9, (uint64_t)v16, v10, v11, v12);

  if (a2)
  {
    uint64_t v13 = (void *)v25[5];
    if (v13) {
      *(void *)a2 = v13;
    }
  }
  id v14 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v14;
}

void sub_221254CA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_221254CC8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_221254CD8(uint64_t a1)
{
}

void sub_221254CE0(uint64_t a1, void *a2)
{
}

void sub_221254CF0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

id sub_221254E2C(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = sub_221254CC8;
  uint64_t v28 = sub_221254CD8;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = sub_221254CC8;
  uint64_t v22 = sub_221254CD8;
  id v23 = 0;
  uint64_t v7 = *(void **)(a1 + 32);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_22125500C;
  v17[3] = &unk_26459CAD0;
  v17[4] = &v24;
  id v8 = objc_msgSend_syncProxyWithErrorHandler_(v7, a2, (uint64_t)v17, a4, a5, a6);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_22125501C;
  v16[3] = &unk_26459D070;
  v16[4] = &v18;
  void v16[5] = &v24;
  objc_msgSend_monitorProxyWithReply_(v8, v9, (uint64_t)v16, v10, v11, v12);

  if (a2)
  {
    uint64_t v13 = (void *)v25[5];
    if (v13) {
      *(void *)a2 = v13;
    }
  }
  id v14 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v14;
}

void sub_221254FE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_22125500C(uint64_t a1, void *a2)
{
}

void sub_22125501C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

id sub_221255158(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = sub_221254CC8;
  uint64_t v28 = sub_221254CD8;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = sub_221254CC8;
  uint64_t v22 = sub_221254CD8;
  id v23 = 0;
  uint64_t v7 = *(void **)(a1 + 32);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_221255338;
  v17[3] = &unk_26459CAD0;
  v17[4] = &v24;
  id v8 = objc_msgSend_syncProxyWithErrorHandler_(v7, a2, (uint64_t)v17, a4, a5, a6);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_221255348;
  v16[3] = &unk_26459D0C0;
  v16[4] = &v18;
  void v16[5] = &v24;
  objc_msgSend_readerProxyWithReply_(v8, v9, (uint64_t)v16, v10, v11, v12);

  if (a2)
  {
    uint64_t v13 = (void *)v25[5];
    if (v13) {
      *(void *)a2 = v13;
    }
  }
  id v14 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v14;
}

void sub_221255314(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_221255338(uint64_t a1, void *a2)
{
}

void sub_221255348(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

id sub_221255484(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = sub_221254CC8;
  uint64_t v28 = sub_221254CD8;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = sub_221254CC8;
  uint64_t v22 = sub_221254CD8;
  id v23 = 0;
  uint64_t v7 = *(void **)(a1 + 32);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_221255664;
  v17[3] = &unk_26459CAD0;
  v17[4] = &v24;
  id v8 = objc_msgSend_syncProxyWithErrorHandler_(v7, a2, (uint64_t)v17, a4, a5, a6);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_221255674;
  v16[3] = &unk_26459D110;
  v16[4] = &v18;
  void v16[5] = &v24;
  objc_msgSend_pinControllerProxyWithReply_(v8, v9, (uint64_t)v16, v10, v11, v12);

  if (a2)
  {
    uint64_t v13 = (void *)v25[5];
    if (v13) {
      *(void *)a2 = v13;
    }
  }
  id v14 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v14;
}

void sub_221255640(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_221255664(uint64_t a1, void *a2)
{
}

void sub_221255674(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

id sub_2212557B0(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = sub_221254CC8;
  uint64_t v28 = sub_221254CD8;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = sub_221254CC8;
  uint64_t v22 = sub_221254CD8;
  id v23 = 0;
  uint64_t v7 = *(void **)(a1 + 32);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_221255990;
  v17[3] = &unk_26459CAD0;
  v17[4] = &v18;
  id v8 = objc_msgSend_syncProxyWithErrorHandler_(v7, a2, (uint64_t)v17, a4, a5, a6);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_2212559A0;
  v16[3] = &unk_26459D160;
  v16[4] = &v24;
  void v16[5] = &v18;
  objc_msgSend_oasisReaderProxyWithReply_(v8, v9, (uint64_t)v16, v10, v11, v12);

  if (a2)
  {
    uint64_t v13 = (void *)v19[5];
    if (v13) {
      *(void *)a2 = v13;
    }
  }
  id v14 = (id)v25[5];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v14;
}

void sub_22125596C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_221255990(uint64_t a1, void *a2)
{
}

void sub_2212559A0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_221255C5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_221255C80(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_221255C90(uint64_t a1)
{
}

void sub_221255C98(uint64_t a1, void *a2)
{
}

void sub_221255CA8(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2 == 0;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
}

void sub_221255E2C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_221255EEC;
  v6[3] = &unk_26459CCB0;
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v5 = v3;
  dispatch_async(v4, v6);
}

uint64_t sub_221255EEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel_onFailureWithError_, *(void *)(a1 + 40), a4, a5, a6);
}

void sub_221255EF8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_221255FDC;
  block[3] = &unk_26459CD00;
  id v11 = v5;
  id v12 = *(id *)(a1 + 40);
  id v13 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, block);
}

void *sub_221255FDC(void *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = result[4];
  if (v6) {
    return (void *)MEMORY[0x270F9A6D0](result[5], sel_onSuccessWithTransactionData_, v6, a4, a5, a6);
  }
  uint64_t v7 = result[6];
  if (v7) {
    return (void *)MEMORY[0x270F9A6D0](result[5], sel_onFailureWithError_, v7, a4, a5, a6);
  }
  return result;
}

void sub_221256140(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_221256200;
  v7[3] = &unk_26459CC10;
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t sub_221256200(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void sub_221256218(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_2212562FC;
  block[3] = &unk_26459CC60;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t sub_2212562FC(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_221256488(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_2212564AC(uint64_t a1, void *a2)
{
}

void sub_2212564BC(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2 == 0;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
}

void sub_2212566CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_2212566F0(uint64_t a1, void *a2)
{
}

void sub_221256700(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_2212569CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

void sub_2212569F0(uint64_t a1, void *a2)
{
}

void sub_221256A00(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_221256C5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_221256C80(uint64_t a1, void *a2)
{
}

void sub_221256C90(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2 == 0;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
}

void sub_221256EE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_221256F0C(uint64_t a1, void *a2)
{
}

void sub_221256F1C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

void sub_221257164(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_221257188(uint64_t a1, void *a2)
{
}

void sub_221257198(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2 == 0;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
}

void sub_221257328(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_221257340(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v8 = objc_msgSend_xpcClient(SPRLogger, v3, v4, v5, v6, v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_22127D31C();
  }
}

void sub_2212573AC(uint64_t a1, void *a2)
{
}

void sub_2212574A4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v8 = objc_msgSend_xpcClient(SPRLogger, v3, v4, v5, v6, v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_22127D388();
  }
}

void sub_221257510(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    id v8 = objc_msgSend_xpcClient(SPRLogger, v2, v3, v4, v5, v6);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_22127D3F4();
    }
  }
}

void sub_221257744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_221257768(uint64_t a1, void *a2)
{
}

void sub_221257778(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2 == 0;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
}

void sub_2212577C8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_221257A38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_221257A5C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_221257A6C(uint64_t a1)
{
}

void sub_221257A74(uint64_t a1, void *a2)
{
}

void sub_221257A84(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

uint64_t sub_221257D38()
{
  v0 = [SPRServiceClient alloc];
  qword_267F494E8 = objc_msgSend_initWithConnector_(v0, v1, (uint64_t)&unk_26D31D8E8, v2, v3, v4);
  return MEMORY[0x270F9A758]();
}

id sub_221257D80()
{
  id v0 = objc_alloc(MEMORY[0x263F08D68]);
  id v6 = objc_msgSend_machServiceName(SPRServiceXPC, v1, v2, v3, v4, v5);
  id v10 = objc_msgSend_initWithMachServiceName_options_(v0, v7, (uint64_t)v6, 4096, v8, v9);

  uint64_t v16 = objc_msgSend_interface(SPRServiceXPC, v11, v12, v13, v14, v15);
  objc_msgSend_setRemoteObjectInterface_(v10, v17, (uint64_t)v16, v18, v19, v20);

  objc_msgSend_resume(v10, v21, v22, v23, v24, v25);
  return v10;
}

void sub_221257F20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_221257F38(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_221257F48(uint64_t a1)
{
}

void sub_221257F50(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v8 = objc_msgSend_xpcClient(SPRLogger, v3, v4, v5, v6, v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_22127D460((uint64_t)v2, v8);
  }
}

void sub_221257FAC(uint64_t a1, void *a2)
{
}

void sub_22125806C(uint64_t a1)
{
  id v2 = [SPRPrimer alloc];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_22125810C;
  v10[3] = &unk_26459CF30;
  v10[4] = *(void *)(a1 + 32);
  uint64_t v7 = objc_msgSend_initWithConnector_(v2, v3, (uint64_t)v10, v4, v5, v6);
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void **)(v8 + 32);
  *(void *)(v8 + 32) = v7;
}

id sub_22125810C(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = sub_221257F38;
  uint64_t v28 = sub_221257F48;
  id v29 = 0;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = sub_221257F38;
  uint64_t v22 = sub_221257F48;
  id v23 = 0;
  uint64_t v7 = *(void **)(a1 + 32);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_2212582E4;
  v17[3] = &unk_26459CAD0;
  v17[4] = &v24;
  uint64_t v8 = objc_msgSend_syncProxyWithErrorHandler_(v7, a2, (uint64_t)v17, a4, a5, a6);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_2212582F4;
  v16[3] = &unk_26459D2E0;
  v16[4] = &v18;
  objc_msgSend_sharedPrimerProxyWithReply_(v8, v9, (uint64_t)v16, v10, v11, v12);

  if (a2)
  {
    uint64_t v13 = (void *)v25[5];
    if (v13) {
      *(void *)a2 = v13;
    }
  }
  id v14 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v14;
}

void sub_2212582C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_2212582E4(uint64_t a1, void *a2)
{
}

void sub_2212582F4(uint64_t a1, void *a2)
{
}

void sub_221258758()
{
  id v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  objc_msgSend_setWithObjects_(v0, v6, v1, v7, v8, v9, v2, v3, v4, v5, 0);
  id v96 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = (void *)MEMORY[0x263EFFA08];
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_opt_class();
  v94 = objc_msgSend_setWithObjects_(v10, v13, v11, v14, v15, v16, v12, 0);
  v95 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x263F08D80], v17, (uint64_t)&unk_26D3280B0, v18, v19, v20);
  v93 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x263F08D80], v21, (uint64_t)&unk_26D32AB40, v22, v23, v24);
  objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_(v93, v25, (uint64_t)v95, (uint64_t)sel_installWithToken_force_delegate_reply_, 2, 0);
  v92 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x263F08D80], v26, (uint64_t)&unk_26D32ABA0, v27, v28, v29);
  long long v34 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x263F08D80], v30, (uint64_t)&unk_26D3281A8, v31, v32, v33);
  uint64_t v39 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x263F08D80], v35, (uint64_t)&unk_26D32AC00, v36, v37, v38);
  objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_(v39, v40, (uint64_t)v34, (uint64_t)sel_readCardWithParameter_delegate_reply_, 1, 0);
  objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_(v39, v41, (uint64_t)v34, (uint64_t)sel_cancelReadWithCallback_reply_, 0, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v39, v42, (uint64_t)v94, (uint64_t)sel_getStoreAndForwardResultsBlobWithTrxHashes_sessionId_activationId_mid_partnerId_virtualTerminalId_reply_, 0, 0);
  uint64_t v47 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x263F08D80], v43, (uint64_t)&unk_26D32AC60, v44, v45, v46);
  uint64_t v52 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x263F08D80], v48, (uint64_t)&unk_26D32AD08, v49, v50, v51);
  uint64_t v57 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x263F08D80], v53, (uint64_t)&unk_26D32AD68, v54, v55, v56);
  objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_(v57, v58, (uint64_t)v52, (uint64_t)sel_provisionCardWithParameters_delegate_reply_, 1, 0);
  v63 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x263F08D80], v59, (uint64_t)&unk_26D32ADC8, v60, v61, v62);
  objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_(v63, v64, (uint64_t)v93, (uint64_t)sel_configuratorProxyWithReply_, 0, 1);
  objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_(v63, v65, (uint64_t)v92, (uint64_t)sel_monitorProxyWithReply_, 0, 1);
  objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_(v63, v66, (uint64_t)v39, (uint64_t)sel_readerProxyWithReply_, 0, 1);
  objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_(v63, v67, (uint64_t)v47, (uint64_t)sel_pinControllerProxyWithReply_, 0, 1);
  objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_(v63, v68, (uint64_t)v57, (uint64_t)sel_oasisReaderProxyWithReply_, 0, 1);
  v73 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x263F08D80], v69, (uint64_t)&unk_26D32AE28, v70, v71, v72);
  v78 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x263F08D80], v74, (uint64_t)&unk_26D32AE88, v75, v76, v77);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(v78, v79, (uint64_t)v96, (uint64_t)sel_copyConfigurationWithReply_, 0, 1);
  objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_(v78, v80, (uint64_t)v63, (uint64_t)sel_providerProxyWithReply_, 0, 1);
  objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_(v78, v81, (uint64_t)v73, (uint64_t)sel_secureChannelProxyWithReply_, 0, 1);
  uint64_t v86 = objc_msgSend_interfaceWithProtocol_(MEMORY[0x263F08D80], v82, (uint64_t)&unk_26D32AEE8, v83, v84, v85);
  v87 = (void *)qword_267F494F8;
  qword_267F494F8 = v86;

  objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_((void *)qword_267F494F8, v88, (uint64_t)v78, (uint64_t)sel_sharedPrimerProxyWithReply_, 0, 1);
  objc_msgSend_setInterface_forSelector_argumentIndex_ofReply_((void *)qword_267F494F8, v89, (uint64_t)v78, (uint64_t)sel_primerProxyWithConfiguration_reply_, 0, 1);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_((void *)qword_267F494F8, v90, (uint64_t)v96, (uint64_t)sel_primerProxyWithConfiguration_reply_, 0, 0);
  objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_((void *)qword_267F494F8, v91, (uint64_t)v96, (uint64_t)sel_primerProxyWithConfiguration_reply_, 1, 1);
}

void sub_221258ED4(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  objc_msgSend_subsystem(*(void **)(a1 + 32), a2, a3, a4, a5, a6);
  id v14 = objc_claimAutoreleasedReturnValue();
  uint64_t v11 = (const char *)objc_msgSend_UTF8String(v14, v6, v7, v8, v9, v10);
  os_log_t v12 = os_log_create(v11, "pin_crypto");
  uint64_t v13 = (void *)qword_267F49508;
  qword_267F49508 = (uint64_t)v12;
}

void sub_221258FD8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  objc_msgSend_subsystem(*(void **)(a1 + 32), a2, a3, a4, a5, a6);
  id v14 = objc_claimAutoreleasedReturnValue();
  uint64_t v11 = (const char *)objc_msgSend_UTF8String(v14, v6, v7, v8, v9, v10);
  os_log_t v12 = os_log_create(v11, "xpc_client");
  uint64_t v13 = (void *)qword_267F49518;
  qword_267F49518 = (uint64_t)v12;
}

void sub_22125A1C8(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = *(void *)(a1 + 40);
  objc_msgSend_mapXPCConnectionError_(*(void **)(a1 + 32), a2, (uint64_t)a2, a4, a5, a6);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
}

void sub_22125A2FC(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = *(void *)(a1 + 40);
  objc_msgSend_mapXPCConnectionError_(*(void **)(a1 + 32), a2, (uint64_t)a2, a4, a5, a6);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
}

void sub_22125A4F8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22125A6E4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22125A770(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

uint64_t sub_22125A8B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MEMORY[0x270F9A6D0](*(void *)(*(void *)(a1 + 32) + 8), sel_onUpdateWithEvent_, *(void *)(a1 + 40), a4, a5, a6);
}

uint64_t sub_22125A934(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1[4] + 8), sel_onUpdateWithEvent_progress_, a1[5], a1[6], a5, a6);
}

uint64_t sub_22125A9E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MEMORY[0x270F9A6D0](*(void *)(*(void *)(a1 + 32) + 8), sel_onSuccessWithInstallData_, *(void *)(a1 + 40), a4, a5, a6);
}

uint64_t sub_22125AA84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MEMORY[0x270F9A6D0](*(void *)(*(void *)(a1 + 32) + 8), sel_onFailureWithError_, *(void *)(a1 + 40), a4, a5, a6);
}

uint64_t sub_22125ABC8(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1[4] + 8), sel_onUpdateWithEvent_mode_, a1[5], a1[6], a5, a6);
}

uint64_t sub_22125AC74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MEMORY[0x270F9A6D0](*(void *)(*(void *)(a1 + 32) + 8), sel_onSuccessWithTransactionData_, *(void *)(a1 + 40), a4, a5, a6);
}

uint64_t sub_22125AD18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return MEMORY[0x270F9A6D0](*(void *)(*(void *)(a1 + 32) + 8), sel_onFailureWithError_, *(void *)(a1 + 40), a4, a5, a6);
}

uint64_t SPRTransactionOutcomeStatus.description.getter(int a1)
{
  HIDWORD(v1) = a1;
  LODWORD(v1) = (a1 << 24) + 0x10000000;
  uint64_t result = 0;
  switch((v1 >> 28))
  {
    case 0u:
      unsigned int v3 = 544501582;
      goto LABEL_8;
    case 1u:
      return result;
    case 2u:
      return 0x6465766F72707041;
    case 3u:
      return 0x64656E696C636544;
    case 4u:
      return 0x5220656E696C6E4FLL;
    case 5u:
      unsigned int v3 = 543452741;
LABEL_8:
      uint64_t result = v3 | 0x6C70704100000000;
      break;
    case 6u:
      uint64_t result = 0x4E207463656C6553;
      break;
    case 7u:
      uint64_t result = 0xD000000000000015;
      break;
    case 8u:
      uint64_t result = 0x6961674120797254;
      break;
    default:
      type metadata accessor for SPRTransactionOutcomeStatus(0);
      sub_22127DFC8();
      __break(1u);
      JUMPOUT(0x22125B134);
  }
  return result;
}

void type metadata accessor for SPRTransactionOutcomeStatus(uint64_t a1)
{
}

uint64_t sub_22125B16C()
{
  return SPRTransactionOutcomeStatus.description.getter(*v0);
}

void type metadata accessor for SPRVASTerminalProtocol(uint64_t a1)
{
}

void type metadata accessor for ORProvisionEvent(uint64_t a1)
{
}

void type metadata accessor for SPRPaymentApplicationType(uint64_t a1)
{
}

void type metadata accessor for SPRTransactionMessage(uint64_t a1)
{
}

void type metadata accessor for SPRReaderMode(uint64_t a1)
{
}

void type metadata accessor for SPRTransactionType(uint64_t a1)
{
}

void type metadata accessor for SPRCardEffectiveState(uint64_t a1)
{
}

void type metadata accessor for SPRCardExpirationState(uint64_t a1)
{
}

void type metadata accessor for SPRInstallEvent(uint64_t a1)
{
}

void type metadata accessor for SPRPayAppletStatus(uint64_t a1)
{
}

void type metadata accessor for SPRReadEvent(uint64_t a1)
{
}

void type metadata accessor for SPRTransactionCVMType(uint64_t a1)
{
}

void type metadata accessor for SPRHTTPError(uint64_t a1)
{
}

id sub_22125B278()
{
  return *v0;
}

uint64_t sub_22125B280@<X0>(uint64_t result@<X0>, void *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t sub_22125B288(uint64_t a1)
{
  uint64_t v2 = sub_22125BCEC(&qword_267F49098, type metadata accessor for SecurityError);
  return MEMORY[0x270EF2670](a1, v2);
}

uint64_t sub_22125B2F4(uint64_t a1)
{
  uint64_t v2 = sub_22125BCEC(&qword_267F49098, type metadata accessor for SecurityError);
  return MEMORY[0x270EF2668](a1, v2);
}

uint64_t sub_22125B364(uint64_t a1)
{
  uint64_t v2 = sub_22125BCEC(&qword_267F490C8, type metadata accessor for SecurityError);
  return MEMORY[0x270EEF788](a1, v2);
}

uint64_t sub_22125B3D0()
{
  return sub_22127D958();
}

uint64_t sub_22125B41C()
{
  return sub_22127D948();
}

uint64_t sub_22125B474()
{
  return sub_22127E0A8();
}

id sub_22125B4DC(void *a1, id *a2)
{
  *a2 = a1;
  return a1;
}

uint64_t sub_22125B528(void *a1, id *a2)
{
  *a2 = a1;
  id v4 = a1;
  return 1;
}

id sub_22125B560@<X0>(id result@<X0>, id *a2@<X8>)
{
  if (result)
  {
    *a2 = result;
    return result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void *sub_22125B570@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

id sub_22125B57C@<X0>(void **a1@<X8>)
{
  uint64_t v2 = *v1;
  *a1 = *v1;
  return v2;
}

uint64_t sub_22125B588()
{
  return sub_22127DA88();
}

uint64_t sub_22125B598()
{
  sub_22125BCEC(&qword_267F49050, type metadata accessor for SPRHTTPError);
  return sub_22127D7B8();
}

uint64_t sub_22125B604(uint64_t a1)
{
  uint64_t v2 = sub_22125BCEC(&qword_267F49050, type metadata accessor for SPRHTTPError);
  return MEMORY[0x270EEF7A0](a1, v2);
}

uint64_t sub_22125B670(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_22125BCEC(&qword_267F49050, type metadata accessor for SPRHTTPError);
  id v5 = a1;
  return MEMORY[0x270EEF790](v5, a2, v4);
}

uint64_t sub_22125B700()
{
  id v1 = *v0;
  uint64_t v2 = sub_22127DD38();

  return v2;
}

uint64_t sub_22125B738(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22125BCEC(&qword_267F49050, type metadata accessor for SPRHTTPError);
  return MEMORY[0x270EEF7D0](a1, a2, v4);
}

void *sub_22125B7B8@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_22125B7C8(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_22125B7D4()
{
  return sub_22127DA88();
}

uint64_t sub_22125B7E4()
{
  sub_22125BCEC(&qword_267F490C8, type metadata accessor for SecurityError);
  return sub_22127D7B8();
}

uint64_t sub_22125B850(uint64_t a1)
{
  uint64_t v2 = sub_22125BCEC(&qword_267F490C8, type metadata accessor for SecurityError);
  return MEMORY[0x270EEF7A0](a1, v2);
}

uint64_t sub_22125B8BC(void *a1, uint64_t a2)
{
  uint64_t v4 = sub_22125BCEC(&qword_267F490C8, type metadata accessor for SecurityError);
  id v5 = a1;
  return MEMORY[0x270EEF790](v5, a2, v4);
}

uint64_t sub_22125B94C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22125BCEC(&qword_267F490C8, type metadata accessor for SecurityError);
  return MEMORY[0x270EEF7D0](a1, a2, v4);
}

uint64_t sub_22125B9C8()
{
  return sub_22127E0A8();
}

uint64_t sub_22125BA28()
{
  swift_getWitnessTable();
  return sub_22127D938();
}

uint64_t sub_22125BA94(uint64_t a1)
{
  uint64_t v2 = sub_22125BCEC(&qword_267F49018, type metadata accessor for SPRHTTPError);
  return MEMORY[0x270EF2670](a1, v2);
}

uint64_t sub_22125BB00(uint64_t a1)
{
  uint64_t v2 = sub_22125BCEC(&qword_267F49018, type metadata accessor for SPRHTTPError);
  return MEMORY[0x270EF2668](a1, v2);
}

uint64_t sub_22125BB6C(uint64_t a1)
{
  uint64_t v2 = sub_22125BCEC(&qword_267F49050, type metadata accessor for SPRHTTPError);
  return MEMORY[0x270EEF788](a1, v2);
}

uint64_t sub_22125BBD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22125BCEC(&qword_267F49050, type metadata accessor for SPRHTTPError);
  return MEMORY[0x270EEF7B8](a1, a2, a3, v6);
}

uint64_t sub_22125BC5C()
{
  return sub_22125BCEC(&qword_267F48FF8, type metadata accessor for SPRHTTPError);
}

uint64_t sub_22125BCA4()
{
  return sub_22125BCEC(&qword_267F49000, type metadata accessor for SPRHTTPError);
}

uint64_t sub_22125BCEC(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

BOOL sub_22125BD34(void *a1, void *a2)
{
  return *a1 == *a2;
}

uint64_t sub_22125BD48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_22125BCEC(&qword_267F490C8, type metadata accessor for SecurityError);
  return MEMORY[0x270EEF7B8](a1, a2, a3, v6);
}

uint64_t sub_22125BDCC(uint64_t a1)
{
  uint64_t v2 = sub_22125BCEC(&qword_267F49058, type metadata accessor for SPRVASTerminalProtocol);
  return MEMORY[0x270F9F190](a1, v2);
}

uint64_t sub_22125BE48()
{
  return sub_22125BCEC(&qword_267F49008, type metadata accessor for SPRVASTerminalProtocol);
}

uint64_t sub_22125BE90()
{
  return sub_22125BCEC(&qword_267F49010, type metadata accessor for SPRVASTerminalProtocol);
}

uint64_t sub_22125BED8()
{
  return sub_22125BCEC(&qword_267F49018, type metadata accessor for SPRHTTPError);
}

uint64_t sub_22125BF20()
{
  return sub_22125BCEC(&qword_267F49020, type metadata accessor for SPRHTTPError);
}

uint64_t sub_22125BF68()
{
  return sub_22125BCEC(&qword_267F49028, type metadata accessor for SPRHTTPError);
}

uint64_t sub_22125BFB0()
{
  return sub_22125BCEC(&qword_267F49030, type metadata accessor for Code);
}

void type metadata accessor for Code(uint64_t a1)
{
}

uint64_t sub_22125C00C()
{
  return sub_22125BCEC(&qword_267F49038, type metadata accessor for Code);
}

unint64_t sub_22125C058()
{
  unint64_t result = qword_267F49040;
  if (!qword_267F49040)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F49040);
  }
  return result;
}

uint64_t sub_22125C0AC()
{
  return sub_22125BCEC(&qword_267F49048, type metadata accessor for Code);
}

uint64_t sub_22125C0F4()
{
  return sub_22125BCEC(&qword_267F49050, type metadata accessor for SPRHTTPError);
}

void type metadata accessor for CFError(uint64_t a1)
{
}

void type metadata accessor for SecurityError(uint64_t a1)
{
}

void type metadata accessor for CFString(uint64_t a1)
{
}

uint64_t sub_22125C178()
{
  return sub_22125BCEC(&qword_267F49080, type metadata accessor for SecurityError);
}

uint64_t sub_22125C1C0()
{
  return sub_22125BCEC(&qword_267F49088, type metadata accessor for SecurityError);
}

uint64_t sub_22125C208()
{
  return sub_22125BCEC(&qword_267F49090, type metadata accessor for CFString);
}

uint64_t sub_22125C250()
{
  return sub_22125BCEC(&qword_267F49098, type metadata accessor for SecurityError);
}

uint64_t sub_22125C298()
{
  return sub_22125BCEC(&qword_267F490A0, type metadata accessor for SecurityError);
}

uint64_t sub_22125C2E0()
{
  return sub_22125BCEC(&qword_267F490A8, type metadata accessor for SecurityError);
}

uint64_t sub_22125C328()
{
  return sub_22125BCEC(&qword_267F490B0, _s3__C4CodeOMa_0);
}

void _s3__C4CodeOMa_0(uint64_t a1)
{
}

void sub_22125C384(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_22125C3CC()
{
  return sub_22125BCEC(&qword_267F490B8, _s3__C4CodeOMa_0);
}

uint64_t sub_22125C414()
{
  return sub_22125BCEC(&qword_267F490C0, _s3__C4CodeOMa_0);
}

uint64_t sub_22125C45C()
{
  return sub_22125BCEC(&qword_267F490C8, type metadata accessor for SecurityError);
}

uint64_t sub_22125C4A4()
{
  return sub_22125BCEC(&qword_267F490D0, type metadata accessor for CFString);
}

id related decl 'e' for SPRHTTPErrorCode.init(_:serverCode:payload:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  sub_22125C7C4(MEMORY[0x263F8EE78]);
  if (a5 >> 60 != 15)
  {
    sub_22125D744(a4, a5);
    swift_bridgeObjectRelease();
    uint64_t v10 = self;
    uint64_t v11 = (void *)sub_22127D898();
    *(void *)&long long v24 = 0;
    id v12 = objc_msgSend(v10, sel_JSONObjectWithData_options_error_, v11, 0, &v24);

    id v13 = (id)v24;
    if (v12)
    {
      sub_22127DE38();
      swift_unknownObjectRelease();
    }
    else
    {
      id v14 = v13;
      uint64_t v15 = (void *)sub_22127D7E8();

      swift_willThrow();
      long long v24 = 0u;
      long long v25 = 0u;
    }
    sub_22125DEE8((uint64_t)&v24, (uint64_t)&v22, &qword_267F490E0);
    if (v23)
    {
      sub_22125D79C(&qword_267F490E8);
      if (swift_dynamicCast()) {
        goto LABEL_10;
      }
    }
    else
    {
      sub_22125D7E0((uint64_t)&v22);
    }
    sub_22125C7C4(MEMORY[0x263F8EE78]);
LABEL_10:
    sub_22125C8FC(a4, a5);
    sub_22125D7E0((uint64_t)&v24);
  }
  if (a3)
  {
    *((void *)&v25 + 1) = MEMORY[0x263F8D310];
    *(void *)&long long v24 = a2;
    *((void *)&v24 + 1) = a3;
    sub_22125C968(&v24, &v22);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_22125D5F0(&v22, 1701080931, 0xE400000000000000, isUniquelyReferenced_nonNull_native);
    swift_bridgeObjectRelease();
  }
  sub_22127DA88();
  id v17 = objc_allocWithZone(MEMORY[0x263F087E8]);
  uint64_t v18 = (void *)sub_22127DA78();
  swift_bridgeObjectRelease();
  uint64_t v19 = (void *)sub_22127D9E8();
  swift_bridgeObjectRelease();
  id v20 = objc_msgSend(v17, sel_initWithDomain_code_userInfo_, v18, a1, v19);

  sub_22125C8FC(a4, a5);
  return v20;
}

unint64_t sub_22125C7C4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unsigned int v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  sub_22125D79C(&qword_267F49120);
  uint64_t v2 = sub_22127DF38();
  unsigned int v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_22125DEE8(v6, (uint64_t)&v15, &qword_267F49128);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_22125D0DC(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_22125C968(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_22125C8FC(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_22125C910(a1, a2);
  }
  return a1;
}

uint64_t sub_22125C910(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }
  return swift_release();
}

_OWORD *sub_22125C968(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_22125C978(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    unsigned int v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  sub_22125D79C(&qword_267F49110);
  uint64_t v2 = sub_22127DF38();
  unsigned int v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_22125DEE8(v6, (uint64_t)&v13, &qword_267F49118);
    uint64_t v7 = v13;
    unint64_t result = sub_22125D154(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_22125C968(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_22125CAA8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  sub_22125D79C(&qword_267F49100);
  uint64_t v2 = (void *)sub_22127DF38();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = (void *)*(v4 - 1);
    uint64_t v6 = *v4;
    id v7 = v5;
    unint64_t result = sub_22125D208(v5);
    if (v9) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v10 = 8 * result;
    *(void *)(v2[6] + v10) = v5;
    *(void *)(v2[7] + v10) = v6;
    uint64_t v11 = v2[2];
    BOOL v12 = __OFADD__(v11, 1);
    uint64_t v13 = v11 + 1;
    if (v12) {
      goto LABEL_11;
    }
    v4 += 2;
    v2[2] = v13;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t related decl 'e' for SPRHTTPErrorCode.serverCode.getter(uint64_t a1)
{
  return sub_22125CBCC(a1, 1701080931, 0xE400000000000000);
}

uint64_t related decl 'e' for SPRHTTPErrorCode.serverReason.getter(uint64_t a1)
{
  return sub_22125CBCC(a1, 0x6E6F73616572, 0xE600000000000000);
}

uint64_t sub_22125CBCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)&long long v10 = a1;
  type metadata accessor for SPRHTTPError(0);
  sub_22125D89C(&qword_267F49050, type metadata accessor for SPRHTTPError);
  uint64_t v5 = sub_22127D7A8();
  if (*(void *)(v5 + 16) && (unint64_t v6 = sub_22125D0DC(a2, a3), (v7 & 1) != 0))
  {
    sub_22125D840(*(void *)(v5 + 56) + 32 * v6, (uint64_t)&v10);
  }
  else
  {
    long long v10 = 0u;
    long long v11 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v11 + 1))
  {
    if (swift_dynamicCast()) {
      return v9;
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_22125D7E0((uint64_t)&v10);
    return 0;
  }
}

uint64_t related decl 'e' for SPRHTTPErrorCode.atsFailureCodes.getter(uint64_t a1)
{
  *(void *)&long long v6 = a1;
  type metadata accessor for SPRHTTPError(0);
  sub_22125D89C(&qword_267F49050, type metadata accessor for SPRHTTPError);
  uint64_t v1 = sub_22127D7A8();
  if (*(void *)(v1 + 16) && (unint64_t v2 = sub_22125D0DC(0x436572756C696166, 0xEC0000007365646FLL), (v3 & 1) != 0))
  {
    sub_22125D840(*(void *)(v1 + 56) + 32 * v2, (uint64_t)&v6);
  }
  else
  {
    long long v6 = 0u;
    long long v7 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((void *)&v7 + 1))
  {
    sub_22125D79C(&qword_267F490F0);
    if (swift_dynamicCast()) {
      return v5;
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_22125D7E0((uint64_t)&v6);
    return 0;
  }
}

uint64_t related decl 'e' for SPRHTTPErrorCode.atsBanExpirationTime.getter(uint64_t a1)
{
  return sub_22125CBCC(a1, 0xD000000000000011, 0x80000002212830B0);
}

uint64_t related decl 'e' for SPRHTTPErrorCode.isClientError.getter(uint64_t a1)
{
  return sub_22125CE4C(a1, (uint64_t (*)(uint64_t))SPRHTTPStatusIsClientError);
}

uint64_t related decl 'e' for SPRHTTPErrorCode.isServerError.getter(uint64_t a1)
{
  return sub_22125CE4C(a1, (uint64_t (*)(uint64_t))SPRHTTPStatusIsServerError);
}

uint64_t sub_22125CE4C(uint64_t a1, uint64_t (*a2)(uint64_t))
{
  type metadata accessor for SPRHTTPError(0);
  sub_22125D89C(&qword_267F49050, type metadata accessor for SPRHTTPError);
  uint64_t v3 = sub_22127D7B8();
  return a2(v3);
}

uint64_t related decl 'e' for SPRHTTPErrorCode.isTimeTokenError.getter(uint64_t a1)
{
  type metadata accessor for SPRHTTPError(0);
  sub_22125D89C(&qword_267F49050, type metadata accessor for SPRHTTPError);
  uint64_t v2 = sub_22127D7B8();
  if (SPRHTTPStatusIsClientError(v2) && (uint64_t v3 = related decl 'e' for SPRHTTPErrorCode.serverCode.getter(a1), v4))
  {
    uint64_t v5 = v3;
    uint64_t v6 = v4;
    sub_22125D79C(&qword_267F490F8);
    uint64_t inited = swift_initStackObject();
    *(void *)(inited + 32) = 0x313034342D474144;
    *(_OWORD *)(inited + 16) = xmmword_221280E60;
    *(void *)(inited + 40) = 0xE800000000000000;
    *(void *)(inited + 48) = 0x333034342D474144;
    *(void *)(inited + 56) = 0xE800000000000000;
    char v8 = sub_22125D014(v5, v6, (void *)inited);
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v8 = 0;
  }
  return v8 & 1;
}

uint64_t sub_22125D014(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_22127DFA8();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  uint64_t v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_22127DFA8() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_22125D0DC(uint64_t a1, uint64_t a2)
{
  sub_22127E078();
  sub_22127DB28();
  uint64_t v4 = sub_22127E0A8();
  return sub_22125D950(a1, a2, v4);
}

unint64_t sub_22125D154(uint64_t a1)
{
  sub_22127E078();
  type metadata accessor for CFString(0);
  sub_22125D89C(&qword_267F49108, type metadata accessor for CFString);
  sub_22127D948();
  uint64_t v2 = sub_22127E0A8();
  return sub_22125DA34(a1, v2);
}

unint64_t sub_22125D208(void *a1)
{
  sub_22127E078();
  sub_22127E098();
  if (a1)
  {
    type metadata accessor for CFString(0);
    sub_22125D89C(&qword_267F49108, type metadata accessor for CFString);
    id v2 = a1;
    sub_22127D948();
  }
  uint64_t v3 = sub_22127E0A8();
  return sub_22125DB90((uint64_t)a1, v3);
}

uint64_t sub_22125D2F0(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_22125D79C(&qword_267F49120);
  uint64_t v6 = sub_22127DF28();
  uint64_t v7 = v6;
  if (*(void *)(v5 + 16))
  {
    uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
    long long v34 = (void *)(v5 + 64);
    if (v8 < 64) {
      uint64_t v9 = ~(-1 << v8);
    }
    else {
      uint64_t v9 = -1;
    }
    unint64_t v10 = v9 & *(void *)(v5 + 64);
    int64_t v33 = (unint64_t)(v8 + 63) >> 6;
    uint64_t v11 = v6 + 64;
    uint64_t result = swift_retain();
    int64_t v13 = 0;
    while (1)
    {
      if (v10)
      {
        unint64_t v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        unint64_t v17 = v16 | (v13 << 6);
      }
      else
      {
        int64_t v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33) {
          goto LABEL_34;
        }
        unint64_t v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          int64_t v13 = v18 + 1;
          if (v18 + 1 >= v33) {
            goto LABEL_34;
          }
          unint64_t v19 = v34[v13];
          if (!v19)
          {
            int64_t v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              uint64_t v3 = v2;
              if (a2)
              {
                uint64_t v32 = 1 << *(unsigned char *)(v5 + 32);
                if (v32 >= 64) {
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *long long v34 = -1 << v32;
                }
                *(void *)(v5 + 16) = 0;
              }
              break;
            }
            unint64_t v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                int64_t v13 = v20 + 1;
                if (__OFADD__(v20, 1)) {
                  goto LABEL_41;
                }
                if (v13 >= v33) {
                  goto LABEL_34;
                }
                unint64_t v19 = v34[v13];
                ++v20;
                if (v19) {
                  goto LABEL_21;
                }
              }
            }
            int64_t v13 = v20;
          }
        }
LABEL_21:
        unint64_t v10 = (v19 - 1) & v19;
        unint64_t v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      uint64_t v21 = (uint64_t *)(*(void *)(v5 + 48) + 16 * v17);
      uint64_t v23 = *v21;
      uint64_t v22 = v21[1];
      long long v24 = (_OWORD *)(*(void *)(v5 + 56) + 32 * v17);
      if (a2)
      {
        sub_22125C968(v24, v35);
      }
      else
      {
        sub_22125D840((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_22127E078();
      sub_22127DB28();
      uint64_t result = sub_22127E0A8();
      uint64_t v25 = -1 << *(unsigned char *)(v7 + 32);
      unint64_t v26 = result & ~v25;
      unint64_t v27 = v26 >> 6;
      if (((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        unint64_t v14 = __clz(__rbit64((-1 << v26) & ~*(void *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v28 = 0;
        unint64_t v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          BOOL v30 = v27 == v29;
          if (v27 == v29) {
            unint64_t v27 = 0;
          }
          v28 |= v30;
          uint64_t v31 = *(void *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        unint64_t v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(void *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      uint64_t v15 = (void *)(*(void *)(v7 + 48) + 16 * v14);
      void *v15 = v23;
      v15[1] = v22;
      uint64_t result = (uint64_t)sub_22125C968(v35, (_OWORD *)(*(void *)(v7 + 56) + 32 * v14));
      ++*(void *)(v7 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

_OWORD *sub_22125D5F0(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_22125D0DC(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_22125DCB0();
      goto LABEL_7;
    }
    sub_22125D2F0(v15, a4 & 1);
    unint64_t v21 = sub_22125D0DC(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      unint64_t v12 = v21;
      int64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = (_OWORD *)sub_22127DFE8();
    __break(1u);
    return result;
  }
LABEL_7:
  int64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    unint64_t v19 = (_OWORD *)(v18[7] + 32 * v12);
    sub_22125DE98((uint64_t)v19);
    return sub_22125C968(a1, v19);
  }
LABEL_13:
  sub_22125D8E4(v12, a2, a3, a1, v18);
  return (_OWORD *)swift_bridgeObjectRetain();
}

uint64_t sub_22125D744(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_22125D79C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_22125D7E0(uint64_t a1)
{
  uint64_t v2 = sub_22125D79C(&qword_267F490E0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_22125D840(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_22125D89C(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

_OWORD *sub_22125D8E4(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  uint64_t v6 = (void *)(a5[6] + 16 * a1);
  *uint64_t v6 = a2;
  v6[1] = a3;
  uint64_t result = sub_22125C968(a4, (_OWORD *)(a5[7] + 32 * a1));
  uint64_t v8 = a5[2];
  BOOL v9 = __OFADD__(v8, 1);
  uint64_t v10 = v8 + 1;
  if (v9) {
    __break(1u);
  }
  else {
    a5[2] = v10;
  }
  return result;
}

unint64_t sub_22125D950(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_22127DFA8() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_22127DFA8() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_22125DA34(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t i = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    type metadata accessor for CFString(0);
    unint64_t v6 = *(void **)(*(void *)(v2 + 48) + 8 * i);
    sub_22125D89C(&qword_267F49108, type metadata accessor for CFString);
    id v7 = v6;
    char v8 = sub_22127D938();

    if ((v8 & 1) == 0)
    {
      uint64_t v9 = ~v4;
      for (unint64_t i = (i + 1) & v9; ((*(void *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v9)
      {
        id v10 = *(id *)(*(void *)(v2 + 48) + 8 * i);
        char v11 = sub_22127D938();

        if (v11) {
          break;
        }
      }
    }
  }
  return i;
}

unint64_t sub_22125DB90(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = v2;
    uint64_t v8 = ~v4;
    do
    {
      uint64_t v9 = *(void **)(*(void *)(v6 + 48) + 8 * v5);
      if (v9)
      {
        if (a1)
        {
          type metadata accessor for CFString(0);
          sub_22125D89C(&qword_267F49108, type metadata accessor for CFString);
          id v10 = v9;
          char v11 = sub_22127D938();

          if (v11) {
            return v5;
          }
        }
      }
      else if (!a1)
      {
        return v5;
      }
      unint64_t v5 = (v5 + 1) & v8;
    }
    while (((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5) & 1) != 0);
  }
  return v5;
}

void *sub_22125DCB0()
{
  uint64_t v1 = v0;
  sub_22125D79C(&qword_267F49120);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_22127DF18();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = (void *)swift_release();
LABEL_28:
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t v25 = v1;
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      int64_t v9 = v22 + 1;
      if (v22 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v23 = *(void *)(v6 + 8 * v9);
      if (!v23) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v23 - 1) & v23;
    unint64_t v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = 32 * v15;
    sub_22125D840(*(void *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    unint64_t v21 = (void *)(*(void *)(v4 + 48) + v16);
    *unint64_t v21 = v19;
    v21[1] = v18;
    sub_22125C968(v26, (_OWORD *)(*(void *)(v4 + 56) + v20));
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    uint64_t v1 = v25;
    goto LABEL_28;
  }
  unint64_t v23 = *(void *)(v6 + 8 * v24);
  if (v23)
  {
    int64_t v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v24 + 1;
    if (__OFADD__(v24, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v23 = *(void *)(v6 + 8 * v9);
    ++v24;
    if (v23) {
      goto LABEL_25;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_22125DE98(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_22125DEE8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_22125D79C(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t SPRTransactionCVMType.description.getter(unsigned __int8 a1)
{
  uint64_t result = 0xD000000000000010;
  if (a1 > 0x2Fu)
  {
    switch(a1)
    {
      case 0x30u:
        return 0xD00000000000001ALL;
      case 0xF0u:
        return 0x6C70704120746F4ELL;
      case 0xFFu:
        return 0;
    }
    goto LABEL_14;
  }
  if (!a1) {
    return 0x4D5643206F4ELL;
  }
  if (a1 != 16)
  {
    if (a1 == 32) {
      return 0x5020656E696C6E4FLL;
    }
LABEL_14:
    type metadata accessor for SPRTransactionCVMType(0);
    uint64_t result = sub_22127DFC8();
    __break(1u);
  }
  return result;
}

uint64_t sub_22125E050()
{
  return SPRTransactionCVMType.description.getter(*v0);
}

__CFString *SPRTransactionType.description.getter(unsigned __int8 a1)
{
  uint64_t result = SPRTransactionTypeCopyDescription(a1);
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = sub_22127DA88();

    return (__CFString *)v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

__CFString *sub_22125E0B0()
{
  uint64_t result = SPRTransactionTypeCopyDescription(*v0);
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = sub_22127DA88();

    return (__CFString *)v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

__CFString *SPRReaderMode.description.getter(unint64_t a1)
{
  uint64_t result = SPRReaderModeCopyDescription(a1);
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = sub_22127DA88();

    return (__CFString *)v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

__CFString *sub_22125E15C()
{
  uint64_t result = SPRReaderModeCopyDescription(*v0);
  if (result)
  {
    uint64_t v2 = result;
    uint64_t v3 = sub_22127DA88();

    return (__CFString *)v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_22125E1B4()
{
  uint64_t v0 = sub_22127D988();
  sub_221260558(v0, qword_267F49130);
  sub_22125F288(v0, (uint64_t)qword_267F49130);
  return sub_22127D978();
}

unint64_t sub_22125E230(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v6 = v5;
  unint64_t v7 = v4;
  if (qword_267F48F80 != -1) {
    swift_once();
  }
  uint64_t v12 = sub_22127D988();
  sub_22125F288(v12, (uint64_t)qword_267F49130);
  sub_22125D744(a1, a2);
  sub_22125D744(a3, a4);
  sub_22125D744(a1, a2);
  sub_22125D744(a3, a4);
  int64_t v13 = sub_22127D968();
  os_log_type_t v14 = sub_22127DD08();
  unint64_t v15 = v14;
  if (os_log_type_enabled(v13, v14))
  {
    uint64_t v16 = swift_slowAlloc();
    id v64 = (id)swift_slowAlloc();
    id v69 = v64;
    *(_DWORD *)uint64_t v16 = 136315394;
    uint64_t v17 = sub_22126A778(a1, a2);
    sub_22125F5AC(v17, v18, (uint64_t *)&v69);
    sub_22127DDA8();
    swift_bridgeObjectRelease();
    sub_22125C910(a1, a2);
    sub_22125C910(a1, a2);
    *(_WORD *)(v16 + 12) = 2080;
    uint64_t v19 = sub_22126A778(a3, a4);
    sub_22125F5AC(v19, v20, (uint64_t *)&v69);
    sub_22127DDA8();
    uint64_t v6 = v5;
    swift_bridgeObjectRelease();
    sub_22125C910(a3, a4);
    sub_22125C910(a3, a4);
    _os_log_impl(&dword_221247000, v13, (os_log_type_t)v15, "SPRPINCrypto.init(attestationData: %s, casdCertificate: %s)", (uint8_t *)v16, 0x16u);
    unint64_t v15 = (unint64_t)v64;
    swift_arrayDestroy();
    MEMORY[0x223C7D900](v64, -1, -1);
    MEMORY[0x223C7D900](v16, -1, -1);
  }
  else
  {
    sub_22125C910(a1, a2);
    sub_22125C910(a1, a2);
    sub_22125C910(a3, a4);
    sub_22125C910(a3, a4);
  }
  id v21 = objc_allocWithZone((Class)SPRKeyAttestationInfo);
  sub_22125D744(a1, a2);
  id v22 = sub_22125FC04();
  if (v6)
  {
    sub_22125C910(a1, a2);
    sub_22125C910(a3, a4);
    sub_22125C910(a1, a2);
    goto LABEL_12;
  }
  unint64_t v23 = v22;
  sub_22125C910(a1, a2);
  type metadata accessor for TLV();
  id v69 = sub_22126DA90(a3, a4);
  sub_2212768CC();
  uint64_t v66 = a3;
  sub_22125D79C(&qword_267F49168);
  os_log_t log = (os_log_t)a4;
  sub_2212605BC();
  uint64_t v30 = sub_221270A28();
  swift_bridgeObjectRelease();
  if (!v30)
  {
LABEL_9:
    int64_t v24 = sub_22127D968();
    os_log_type_t v25 = sub_22127DD18();
    if (os_log_type_enabled(v24, v25))
    {
      uint64_t v26 = a3;
      unint64_t v27 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v27 = 0;
      _os_log_impl(&dword_221247000, v24, v25, "CASD certificate has unexpected format", v27, 2u);
      char v28 = v27;
      a3 = v26;
      MEMORY[0x223C7D900](v28, -1, -1);
    }

    type metadata accessor for SecurityError(0);
    unint64_t v15 = sub_22125F2C0(MEMORY[0x263F8EE78]);
    sub_2212604A4(&qword_267F490C8, type metadata accessor for SecurityError);
    sub_22127D7C8();
    swift_willThrow();
    sub_22125C910(a3, a4);
    sub_22125C910(a1, a2);

    goto LABEL_12;
  }
  uint64_t v31 = sub_2212768E0();
  uint64_t v32 = (*(uint64_t (**)(void))(*(void *)v30 + 200))(*v31);
  if (!v32)
  {
    swift_release();
    goto LABEL_9;
  }
  id v67 = v7;
  uint64_t v33 = (*(uint64_t (**)(void))(*(void *)v32 + 144))();
  unint64_t v35 = v34;
  swift_release();
  sub_22125D744(v33, v35);
  sub_22125D744(v33, v35);
  uint64_t v36 = sub_22127D968();
  os_log_type_t v37 = sub_22127DD08();
  unint64_t v63 = v35;
  uint64_t v65 = v33;
  if (os_log_type_enabled(v36, v37))
  {
    uint64_t v38 = v33;
    uint64_t v39 = (uint8_t *)swift_slowAlloc();
    id v62 = (id)swift_slowAlloc();
    id v69 = v62;
    *(_DWORD *)uint64_t v39 = 136315138;
    uint64_t v40 = sub_22126A778(v38, v35);
    sub_22125F5AC(v40, v41, (uint64_t *)&v69);
    sub_22127DDA8();
    swift_bridgeObjectRelease();
    sub_22125C910(v38, v35);
    sub_22125C910(v38, v35);
    _os_log_impl(&dword_221247000, v36, v37, "casdPublicKeyData: %s", v39, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x223C7D900](v62, -1, -1);
    MEMORY[0x223C7D900](v39, -1, -1);
  }
  else
  {
    sub_22125C910(v33, v35);
    sub_22125C910(v33, v35);
  }

  id v42 = objc_msgSend(v23, sel_signature);
  uint64_t v43 = sub_22127D8B8();
  unint64_t v45 = v44;

  id v46 = objc_msgSend(v23, sel_request);
  id v47 = objc_msgSend(v46, sel_derRepresentation);

  uint64_t v48 = sub_22127D8B8();
  unint64_t v50 = v49;

  sub_22125FCC4();
  sub_22125C910(v48, v50);
  sub_22125C910(v43, v45);
  id v51 = objc_msgSend(v23, sel_request);
  id v52 = objc_msgSend(v51, sel_publicKeyInfo);

  uint64_t v53 = sub_22127D8B8();
  unint64_t v55 = v54;

  uint64_t v56 = (void *)sub_22127D898();
  sub_22125C910(v53, v55);
  uint64_t v57 = (void *)SecKeyCreateFromSubjectPublicKeyInfoData();
  if (v57)
  {
    id v58 = v57;
    unint64_t v15 = (unint64_t)objc_msgSend(v67, sel_initWithPeerPublicKey_, v58);
    sub_22125C910(v66, (unint64_t)log);
    sub_22125C910(a1, a2);
    swift_release();
    sub_22125C910(v65, v63);

    return v15;
  }
  char v59 = sub_22127D968();
  os_log_type_t v60 = sub_22127DD18();
  if (os_log_type_enabled(v59, v60))
  {
    uint64_t v61 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v61 = 0;
    _os_log_impl(&dword_221247000, v59, v60, "SecKeyCreateFromSubjectPublicKeyInfoData on attestationInfo.request.publicKeyInfo failed", v61, 2u);
    MEMORY[0x223C7D900](v61, -1, -1);
  }

  type metadata accessor for SecurityError(0);
  unint64_t v15 = sub_22125F2C0(MEMORY[0x263F8EE78]);
  sub_2212604A4(&qword_267F490C8, type metadata accessor for SecurityError);
  sub_22127D7C8();
  swift_willThrow();
  sub_22125C910(v66, (unint64_t)log);
  sub_22125C910(a1, a2);
  swift_release();
  sub_22125C910(v65, v63);

LABEL_12:
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v15;
}

uint64_t sub_22125ECC8()
{
  uint64_t v1 = v0;
  uint64_t v23 = *MEMORY[0x263EF8340];
  if (qword_267F48F80 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_22127D988();
  sub_22125F288(v2, (uint64_t)qword_267F49130);
  uint64_t v3 = sub_22127D968();
  os_log_type_t v4 = sub_22127DD08();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_221247000, v3, v4, "SPRPINCrypto.encryptDigit(_:)", v5, 2u);
    MEMORY[0x223C7D900](v5, -1, -1);
  }

  uint64_t v21 = sub_221260318(16);
  unint64_t v22 = v6;
  sub_22127D878();
  sub_22127D878();
  sub_22125D79C(&qword_267F49148);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_221280F10;
  uint64_t v8 = (void *)*MEMORY[0x263F173D0];
  *(void *)(inited + 32) = *MEMORY[0x263F173D0];
  *(void *)(inited + 40) = 128;
  id v9 = v8;
  sub_22125CAA8(inited);
  uint64_t v20 = 0;
  id v10 = objc_msgSend(v1, sel_peerPublicKey);
  sub_22125D744(v21, v22);
  uint64_t v11 = (void *)sub_22127D898();
  sub_22125C910(v21, v22);
  sub_22125D79C(&qword_267F49150);
  sub_2212603B8();
  uint64_t v12 = (void *)sub_22127D9E8();
  swift_bridgeObjectRelease();
  EncryptedDataWithParameters = (void *)SecKeyCreateEncryptedDataWithParameters();

  if (!EncryptedDataWithParameters)
  {
    __break(1u);
    JUMPOUT(0x22125F1A8);
  }
  switch(v22 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(v21), v21)) {
        goto LABEL_16;
      }
      uint64_t v14 = (int)v21;
      uint64_t v15 = HIDWORD(v21) - (int)v21;
LABEL_11:
      if (v15 < v14)
      {
        __break(1u);
        goto LABEL_15;
      }
      if (v14 < 0)
      {
LABEL_15:
        __break(1u);
LABEL_16:
        __break(1u);
LABEL_17:
        __break(1u);
      }
LABEL_13:
      sub_22127D838();
      id v17 = EncryptedDataWithParameters;
      uint64_t v18 = sub_22127D8B8();

      sub_22125C910(v21, v22);
      return v18;
    case 2uLL:
      uint64_t v14 = *(void *)(v21 + 16);
      uint64_t v16 = *(void *)(v21 + 24);
      uint64_t v15 = v16 - v14;
      if (!__OFSUB__(v16, v14)) {
        goto LABEL_11;
      }
      goto LABEL_17;
    default:
      goto LABEL_13;
  }
}

uint64_t sub_22125F288(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

unint64_t sub_22125F2C0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  sub_22125D79C(&qword_267F49120);
  uint64_t v2 = sub_22127DF38();
  uint64_t v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_2212604F0(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_22125F3EC(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    *uint64_t v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_22125C968(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_22125F3EC(uint64_t a1, uint64_t a2)
{
  sub_22127E078();
  sub_22127DB28();
  uint64_t v4 = sub_22127E0A8();
  return sub_22125F464(a1, a2, v4);
}

unint64_t sub_22125F464(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (sub_22127DFA8() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      unint64_t i = (i + 1) & v12;
      if ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
      {
        BOOL v13 = (void *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (sub_22127DFA8() & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v12; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v12)
          {
            uint64_t v15 = (void *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2) {
              break;
            }
            if (sub_22127DFA8()) {
              break;
            }
          }
        }
      }
    }
  }
  return i;
}

uint64_t sub_22125F5AC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_22125F680(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_22125D840((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = MEMORY[0x263F8DBE0];
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_22125D840((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_22125DE98((uint64_t)v12);
  return v7;
}

uint64_t sub_22125F680(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_22127DDB8();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_22125F83C(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = sub_22127DE88();
  if (!v8)
  {
    sub_22127DEF8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_22127DF48();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_22125F83C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_22125F8D4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_22125FAB4(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_22125FAB4(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_22125F8D4(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_22125FA4C(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_22127DE68();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_22127DEF8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_22127DB88();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_22127DF48();
    __break(1u);
LABEL_14:
    uint64_t result = sub_22127DEF8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_22125FA4C(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return (void *)MEMORY[0x263F8EE78];
  }
  sub_22125D79C(&qword_267F49160);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_22125FAB4(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_22125D79C(&qword_267F49160);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v12 = v10 + 32;
  BOOL v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = sub_22127DF48();
  __break(1u);
  return result;
}

id sub_22125FC04()
{
  v6[1] = *(id *)MEMORY[0x263EF8340];
  uint64_t v1 = (void *)sub_22127D898();
  v6[0] = 0;
  id v2 = objc_msgSend(v0, sel_initWithDERRepresentation_error_, v1, v6);

  if (v2)
  {
    id v3 = v6[0];
  }
  else
  {
    id v4 = v6[0];
    sub_22127D7E8();

    swift_willThrow();
  }
  return v2;
}

void sub_22125FCC4()
{
  error[20] = *(CFErrorRef *)MEMORY[0x263EF8340];
  if (qword_267F48F80 != -1) {
    swift_once();
  }
  uint64_t v0 = sub_22127D988();
  sub_22125F288(v0, (uint64_t)qword_267F49130);
  uint64_t v1 = sub_22127D968();
  os_log_type_t v2 = sub_22127DD08();
  if (os_log_type_enabled(v1, v2))
  {
    id v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_221247000, v1, v2, "SPRPINCrypto.verify(signature:request:key:)", v3, 2u);
    MEMORY[0x223C7D900](v3, -1, -1);
  }

  sub_22125D79C(&qword_267F49178);
  uint64_t inited = swift_initStackObject();
  size_t v5 = (void **)MEMORY[0x263F16FA8];
  *(_OWORD *)(inited + 16) = xmmword_221280F20;
  unint64_t v6 = *v5;
  *(void *)(inited + 32) = *v5;
  int64_t v7 = (void *)*MEMORY[0x263F16FB0];
  type metadata accessor for CFString(0);
  int64_t v8 = (void **)MEMORY[0x263F16F68];
  *(void *)(inited + 40) = v7;
  int64_t v9 = *v8;
  *(void *)(inited + 64) = v10;
  *(void *)(inited + 72) = v9;
  size_t v11 = (void *)*MEMORY[0x263F16F80];
  *(void *)(inited + 80) = *MEMORY[0x263F16F80];
  uint64_t v12 = (void *)*MEMORY[0x263F16F98];
  *(void *)(inited + 104) = v10;
  *(void *)(inited + 112) = v12;
  *(void *)(inited + 144) = MEMORY[0x263F8D6C8];
  *(void *)(inited + 120) = 256;
  id v13 = v6;
  id v14 = v7;
  id v15 = v9;
  id v16 = v11;
  id v17 = v12;
  sub_22125C978(inited);
  error[0] = 0;
  CFDataRef v18 = (const __CFData *)sub_22127D898();
  sub_2212604A4(&qword_267F49090, type metadata accessor for CFString);
  CFDictionaryRef v19 = (const __CFDictionary *)sub_22127D9E8();
  swift_bridgeObjectRelease();
  uint64_t v20 = SecKeyCreateWithData(v18, v19, error);

  if (v20)
  {
    CFStringRef v21 = (const __CFString *)*MEMORY[0x263F172E8];
    CFDataRef v22 = (const __CFData *)sub_22127D898();
    CFDataRef v23 = (const __CFData *)sub_22127D898();
    LODWORD(v21) = SecKeyVerifySignature(v20, v21, v22, v23, error);

    if (v21)
    {

      return;
    }
    if (error[0])
    {
      uint64_t v31 = error[0];
      uint64_t v32 = sub_22127D968();
      os_log_type_t v33 = sub_22127DD18();
      if (os_log_type_enabled(v32, v33))
      {
        unint64_t v34 = (uint8_t *)swift_slowAlloc();
        uint64_t v35 = swift_slowAlloc();
        uint64_t v39 = v35;
        *(_DWORD *)unint64_t v34 = 136315138;
        type metadata accessor for CFError(0);
        uint64_t v36 = v31;
        uint64_t v37 = sub_22127DAE8();
        sub_22125F5AC(v37, v38, &v39);
        sub_22127DDA8();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_221247000, v32, v33, "SecKeyVerifySignature error: %s", v34, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x223C7D900](v35, -1, -1);
        MEMORY[0x223C7D900](v34, -1, -1);
      }
      else
      {
      }
      type metadata accessor for SecurityError(0);
      sub_22125F2C0(MEMORY[0x263F8EE78]);
      sub_2212604A4(&qword_267F490C8, type metadata accessor for SecurityError);
      sub_22127D7C8();
      swift_willThrow();

LABEL_18:
      return;
    }
  }
  else
  {
    if (error[0])
    {
      uint64_t v20 = error[0];
      int64_t v24 = sub_22127D968();
      os_log_type_t v25 = sub_22127DD18();
      if (os_log_type_enabled(v24, v25))
      {
        uint64_t v26 = (uint8_t *)swift_slowAlloc();
        uint64_t v27 = swift_slowAlloc();
        uint64_t v39 = v27;
        *(_DWORD *)uint64_t v26 = 136315138;
        type metadata accessor for CFError(0);
        char v28 = v20;
        uint64_t v29 = sub_22127DAE8();
        sub_22125F5AC(v29, v30, &v39);
        sub_22127DDA8();

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_221247000, v24, v25, "SecKeyCreateWithData error: %s", v26, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x223C7D900](v27, -1, -1);
        MEMORY[0x223C7D900](v26, -1, -1);
      }
      else
      {
      }
      type metadata accessor for SecurityError(0);
      sub_22125F2C0(MEMORY[0x263F8EE78]);
      sub_2212604A4(&qword_267F490C8, type metadata accessor for SecurityError);
      sub_22127D7C8();
      swift_willThrow();
      goto LABEL_18;
    }
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_221260318(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result <= 14)
    {
      if (result < 0) {
        __break(1u);
      }
      else {
        return 0;
      }
    }
    else
    {
      sub_22127D738();
      swift_allocObject();
      sub_22127D6F8();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_22127D828();
        uint64_t result = swift_allocObject();
        *(void *)(result + 16) = 0;
        *(void *)(result + 24) = v1;
      }
      else
      {
        return v1 << 32;
      }
    }
  }
  return result;
}

unint64_t sub_2212603B8()
{
  unint64_t result = qword_267F49158;
  if (!qword_267F49158)
  {
    sub_22126045C(&qword_267F49150);
    sub_2212604A4(&qword_267F49090, type metadata accessor for CFString);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F49158);
  }
  return result;
}

uint64_t sub_22126045C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_2212604A4(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_2212604F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22125D79C(&qword_267F49128);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t *sub_221260558(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_2212605BC()
{
  unint64_t result = qword_267F49170;
  if (!qword_267F49170)
  {
    sub_22126045C(&qword_267F49168);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F49170);
  }
  return result;
}

unint64_t SPRTransactionMessage.description.getter(unint64_t result)
{
  unint64_t result = result;
  switch((char)result)
  {
    case 0:
      return result;
    case 1:
    case 2:
    case 4:
    case 5:
    case 8:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 17:
    case 18:
    case 19:
    case 31:
      goto LABEL_4;
    case 3:
    case 26:
      unint64_t result = 0x4445564F52505041;
      break;
    case 6:
      unint64_t result = 0x5252452044524143;
      break;
    case 7:
      unint64_t result = 0x44454E494C434544;
      break;
    case 9:
      unint64_t result = 0xD000000000000015;
      break;
    case 15:
      unint64_t result = 0xD000000000000010;
      break;
    case 16:
    case 28:
      unint64_t result = 0xD000000000000012;
      break;
    case 20:
      unint64_t result = 0x656D6F636C6557;
      break;
    case 21:
      unint64_t result = 0x20746E6573657250;
      break;
    case 22:
      unint64_t result = 0x69737365636F7250;
      break;
    case 23:
      unint64_t result = 0x4145522044524143;
      break;
    case 24:
      unint64_t result = 0xD00000000000001BLL;
      break;
    case 25:
      unint64_t result = 0xD00000000000001CLL;
      break;
    case 27:
      unint64_t result = 0xD000000000000019;
      break;
    case 29:
      unint64_t result = 0x4320545245534E49;
      break;
    case 30:
      unint64_t result = 0x4944205241454C43;
      break;
    case 32:
      unint64_t result = 0x4E4F485020454553;
      break;
    case 33:
      unint64_t result = 0x4941474120595254;
      break;
    default:
      if (result == 255) {
        unint64_t result = 4271950;
      }
      else {
LABEL_4:
      }
        unint64_t result = 0x206E776F6E6B6E55;
      break;
  }
  return result;
}

unint64_t sub_221260914()
{
  return SPRTransactionMessage.description.getter(*v0);
}

uint64_t SPRPaymentApplicationType.description.getter(uint64_t result)
{
  unint64_t result = result;
  switch((char)result)
  {
    case 0:
      return result;
    case 2:
      unint64_t result = 0x616372657473616DLL;
      break;
    case 3:
      unint64_t result = 1634953590;
      break;
    case 4:
      unint64_t result = 2019913057;
      break;
    case 5:
      unint64_t result = 6447978;
      break;
    case 6:
      unint64_t result = 0x7265766F63736964;
      break;
    case 13:
      unint64_t result = 0x736F70746665;
      break;
    case 14:
      unint64_t result = 0x73726568746FLL;
      break;
    case 15:
      unint64_t result = 0x63617265746E69;
      break;
    default:
      unint64_t result = 0x6E676F6365726E75;
      break;
  }
  return result;
}

uint64_t sub_221260A58()
{
  return SPRPaymentApplicationType.description.getter(*v0);
}

unint64_t SPRReadEvent.description.getter(uint64_t a1)
{
  unint64_t result = 0xD000000000000013;
  switch(a1)
  {
    case 0:
      unint64_t result = 0x7964616572;
      break;
    case 1:
      unint64_t result = 0x6465746365746564;
      break;
    case 2:
      unint64_t result = 0x656C6C65636E6163;
      break;
    case 3:
      unint64_t result = 0x6465736F6C63;
      break;
    case 4:
      unint64_t result = 0x6465766F6D6572;
      break;
    case 5:
      unint64_t result = 0x7261655464726163;
      break;
    case 6:
      unint64_t result = 0x6E69616741797274;
      break;
    case 7:
      unint64_t result = 0x726143726568746FLL;
      break;
    case 8:
      unint64_t result = 0x656E6F6850656573;
      break;
    case 9:
      return result;
    case 10:
      unint64_t result = 0x6F72724564726163;
      break;
    default:
      type metadata accessor for SPRReadEvent(0);
      sub_22127DFC8();
      __break(1u);
      JUMPOUT(0x221260BD0);
  }
  return result;
}

unint64_t sub_221260BFC()
{
  return SPRReadEvent.description.getter(*v0);
}

uint64_t ORProvisionEvent.description.getter(uint64_t a1)
{
  uint64_t result = 0;
  switch(a1)
  {
    case 0:
      uint64_t result = 0x7964616572;
      break;
    case 1:
      uint64_t result = 0x6465746365746564;
      break;
    case 2:
      uint64_t result = 0x656C6C65636E6163;
      break;
    case 3:
      uint64_t result = 0x6465736F6C63;
      break;
    case 4:
      uint64_t result = 0x614365766F6D6572;
      break;
    case 5:
      uint64_t result = 0x7261655464726163;
      break;
    case 9:
      uint64_t result = 0x6574656C706D6F63;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_221260D08()
{
  return ORProvisionEvent.description.getter(*v0);
}

unint64_t SPRMonitorEvent.eventString.getter(unsigned __int16 a1)
{
  int v1 = a1 - 13;
  unint64_t result = 0xD000000000000017;
  switch(v1)
  {
    case 0:
      return result;
    case 2:
      unint64_t result = 0xD000000000000013;
      break;
    case 5:
      unint64_t result = 0x5F45524150455250;
      break;
    case 6:
      unint64_t result = 0xD000000000000015;
      break;
    case 7:
      unint64_t result = 0xD000000000000013;
      break;
    case 8:
      unint64_t result = 0xD000000000000015;
      break;
    case 10:
      unint64_t result = 0xD00000000000001ALL;
      break;
    case 14:
      unint64_t result = 0xD000000000000021;
      break;
    case 15:
      unint64_t result = 0xD000000000000020;
      break;
    case 16:
      unint64_t result = 0xD000000000000025;
      break;
    case 19:
      unint64_t result = 0x415F524544414552;
      break;
    case 20:
      unint64_t result = 0x495F524544414552;
      break;
    case 21:
      unint64_t result = 0x524154535F43464ELL;
      break;
    case 22:
      unint64_t result = 0x444145525F43464ELL;
      break;
    case 23:
      unint64_t result = 0x534F4C435F43464ELL;
      break;
    case 24:
      unint64_t result = 0xD000000000000016;
      break;
    case 25:
      unint64_t result = 0xD000000000000016;
      break;
    case 26:
      unint64_t result = 0xD000000000000016;
      break;
    case 27:
      unint64_t result = 0xD00000000000001ELL;
      break;
    case 28:
      unint64_t result = 0xD000000000000014;
      break;
    case 29:
      unint64_t result = 0x53554C465F474F4CLL;
      break;
    case 30:
    case 37:
    case 40:
    case 42:
      unint64_t result = 0xD000000000000012;
      break;
    case 31:
      unint64_t result = 0x435F48544C414548;
      break;
    case 32:
      unint64_t result = 0xD00000000000001ELL;
      break;
    case 33:
      unint64_t result = 0xD000000000000018;
      break;
    case 34:
      unint64_t result = 0xD000000000000017;
      break;
    case 35:
      unint64_t result = 0xD000000000000015;
      break;
    case 36:
      unint64_t result = 0xD000000000000015;
      break;
    case 38:
      unint64_t result = 0xD000000000000014;
      break;
    case 41:
      unint64_t result = 0xD000000000000010;
      break;
    default:
      unint64_t result = 0xD000000000000018;
      break;
  }
  return result;
}

uint64_t static SPRMonitorEvent.getEventFromString(_:)(uint64_t a1, uint64_t a2)
{
  if (a1 == 0xD000000000000017 && a2 == 0x8000000221283820 || (sub_22127DFA8() & 1) != 0) {
    return 13;
  }
  if (a1 == 0xD000000000000013 && a2 == 0x8000000221283800 || (sub_22127DFA8() & 1) != 0) {
    return 15;
  }
  if (a1 == 0x5F45524150455250 && a2 == 0xEE00524544414552 || (sub_22127DFA8() & 1) != 0) {
    return 18;
  }
  if (a1 == 0xD000000000000015 && a2 == 0x80000002212837E0 || (sub_22127DFA8() & 1) != 0) {
    return 19;
  }
  if (a1 == 0xD000000000000013 && a2 == 0x80000002212837C0 || (sub_22127DFA8() & 1) != 0) {
    return 20;
  }
  if (a1 == 0xD000000000000015 && a2 == 0x80000002212837A0 || (sub_22127DFA8() & 1) != 0) {
    return 21;
  }
  if (a1 == 0xD00000000000001ALL && a2 == 0x8000000221283780 || (sub_22127DFA8() & 1) != 0) {
    return 23;
  }
  if (a1 == 0xD000000000000021 && a2 == 0x8000000221283750 || (sub_22127DFA8() & 1) != 0) {
    return 27;
  }
  if (a1 == 0xD000000000000020 && a2 == 0x8000000221283720 || (sub_22127DFA8() & 1) != 0) {
    return 28;
  }
  if (a1 == 0xD000000000000025 && a2 == 0x80000002212836F0 || (sub_22127DFA8() & 1) != 0) {
    return 29;
  }
  if (a1 == 0x415F524544414552 && a2 == 0xED00004556495443 || (sub_22127DFA8() & 1) != 0) {
    return 32;
  }
  if (a1 == 0x495F524544414552 && a2 == 0xEF4556495443414ELL || (sub_22127DFA8() & 1) != 0) {
    return 33;
  }
  if (a1 == 0x524154535F43464ELL && a2 == 0xE900000000000054 || (sub_22127DFA8() & 1) != 0) {
    return 34;
  }
  if (a1 == 0x444145525F43464ELL && a2 == 0xE800000000000000 || (sub_22127DFA8() & 1) != 0) {
    return 35;
  }
  if (a1 == 0x534F4C435F43464ELL && a2 == 0xE900000000000045 || (sub_22127DFA8() & 1) != 0) {
    return 36;
  }
  if (a1 == 0xD000000000000016 && a2 == 0x80000002212836D0 || (sub_22127DFA8() & 1) != 0) {
    return 37;
  }
  if (a1 == 0xD000000000000016 && a2 == 0x80000002212836B0 || (sub_22127DFA8() & 1) != 0) {
    return 38;
  }
  if (a1 == 0xD000000000000016 && a2 == 0x8000000221283690 || (sub_22127DFA8() & 1) != 0) {
    return 39;
  }
  if (a1 == 0xD00000000000001ELL && a2 == 0x8000000221283670 || (sub_22127DFA8() & 1) != 0) {
    return 40;
  }
  if (a1 == 0xD000000000000014 && a2 == 0x8000000221283650 || (sub_22127DFA8() & 1) != 0) {
    return 41;
  }
  if (a1 == 0x53554C465F474F4CLL && a2 == 0xE900000000000048 || (sub_22127DFA8() & 1) != 0) {
    return 42;
  }
  if (a1 == 0xD000000000000012 && a2 == 0x8000000221283630 || (sub_22127DFA8() & 1) != 0) {
    return 43;
  }
  if (a1 == 0x435F48544C414548 && a2 == 0xEC0000004B434548 || (sub_22127DFA8() & 1) != 0) {
    return 44;
  }
  if (a1 == 0xD00000000000001ELL && a2 == 0x8000000221283610 || (sub_22127DFA8() & 1) != 0) {
    return 45;
  }
  if (a1 == 0xD000000000000018 && a2 == 0x80000002212835F0 || (sub_22127DFA8() & 1) != 0) {
    return 46;
  }
  if (a1 == 0xD000000000000017 && a2 == 0x80000002212835D0 || (sub_22127DFA8() & 1) != 0) {
    return 47;
  }
  if (a1 == 0xD000000000000015 && a2 == 0x80000002212835B0 || (sub_22127DFA8() & 1) != 0) {
    return 48;
  }
  if (a1 == 0xD000000000000015 && a2 == 0x8000000221283590 || (sub_22127DFA8() & 1) != 0) {
    return 49;
  }
  if (a1 == 0xD000000000000012 && a2 == 0x8000000221283570 || (sub_22127DFA8() & 1) != 0) {
    return 50;
  }
  if (a1 == 0xD000000000000014 && a2 == 0x8000000221283550 || (sub_22127DFA8() & 1) != 0) {
    return 51;
  }
  if (a1 == 0xD000000000000012 && a2 == 0x8000000221283530 || (sub_22127DFA8() & 1) != 0) {
    return 53;
  }
  if (a1 == 0xD000000000000010 && a2 == 0x8000000221283510 || (sub_22127DFA8() & 1) != 0) {
    return 54;
  }
  uint64_t v4 = 55;
  if (a1 != 0xD000000000000012 || a2 != 0x80000002212834F0)
  {
    if (sub_22127DFA8()) {
      return 55;
    }
    else {
      return 44;
    }
  }
  return v4;
}

unint64_t SPRPayAppletStatus.description.getter(unint64_t result)
{
  unint64_t result = result;
  switch((char)result)
  {
    case 0:
      return result;
    case 6:
      unint64_t result = 0xD000000000000014;
      break;
    case 7:
    case 30:
      unint64_t result = 0xD000000000000011;
      break;
    case 21:
      unint64_t result = 0x432065766F6D6552;
      break;
    case 29:
      unint64_t result = 0x656C7069746C754DLL;
      break;
    default:
      type metadata accessor for SPRPayAppletStatus(0);
      sub_22127DFC8();
      __break(1u);
      JUMPOUT(0x221261C28);
  }
  return result;
}

unint64_t sub_221261CA4()
{
  return SPRPayAppletStatus.description.getter(*v0);
}

uint64_t SPRInstallEvent.description.getter(unint64_t a1)
{
  if (a1 < 4) {
    return *(void *)&aCheckingcreati[8 * a1];
  }
  type metadata accessor for SPRInstallEvent(0);
  uint64_t result = sub_22127DFC8();
  __break(1u);
  return result;
}

uint64_t sub_221261D1C()
{
  return SPRInstallEvent.description.getter(*v0);
}

uint64_t SPRCardExpirationState.description.getter(uint64_t result)
{
  uint64_t result = result;
  switch((char)result)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = 0x7269707845746F6ELL;
      break;
    case 2:
      uint64_t result = 0x64657269707865;
      break;
    case 4:
      uint64_t result = 0x64696C61766E69;
      break;
    case 8:
      uint64_t result = 0x6E776F6E6B6E75;
      break;
    default:
      type metadata accessor for SPRCardExpirationState(0);
      sub_22127DFC8();
      __break(1u);
      JUMPOUT(0x221261E00);
  }
  return result;
}

uint64_t sub_221261E24()
{
  return SPRCardExpirationState.description.getter(*v0);
}

uint64_t SymmetricKey.description.getter()
{
  return 0x676E6968746F6ELL;
}

uint64_t sub_221261E44()
{
  return SymmetricKey.description.getter();
}

uint64_t SPRVASTerminalProtocol.description.getter(void *a1)
{
  sub_221261FBC();
  os_log_type_t v2 = &unk_26D323670;
  id v3 = a1;
  char v4 = sub_22127DD28();

  if (v4) {
    return 0x6C6F636F746F7270;
  }
  id v6 = v3;
  int64_t v7 = &unk_26D323658;
  char v8 = sub_22127DD28();

  if (v8) {
    return 0x6E4F70556E676973;
  }
  else {
    return 0x64696C61766E69;
  }
}

uint64_t sub_221261F50()
{
  return SPRVASTerminalProtocol.description.getter(*v0);
}

uint64_t sub_221261F58(void **a1, void **a2)
{
  os_log_type_t v2 = *a1;
  id v3 = *a2;
  sub_221261FBC();
  id v4 = v2;
  id v5 = v3;
  char v6 = sub_22127DD28();

  return v6 & 1;
}

unint64_t sub_221261FBC()
{
  unint64_t result = qword_267F49180;
  if (!qword_267F49180)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_267F49180);
  }
  return result;
}

uint64_t SPRCardEffectiveState.description.getter(uint64_t result)
{
  if (result <= 0x1Fu)
  {
    if (!(_BYTE)result) {
      return result;
    }
    if (result == 16) {
      return 0x657669746361;
    }
  }
  else
  {
    switch(result)
    {
      case 0x20u:
        return 0x6576697463616E69;
      case 0x40u:
        return 0x64696C61766E69;
      case 0x80u:
        return 0x6E776F6E6B6E75;
    }
  }
  type metadata accessor for SPRCardEffectiveState(0);
  unint64_t result = sub_22127DFC8();
  __break(1u);
  return result;
}

uint64_t sub_2212620D0()
{
  return SPRCardEffectiveState.description.getter(*v0);
}

uint64_t sub_2212620D8(int a1)
{
  unsigned int v11 = 0;
  uint64_t v10 = 0;
  sub_221262648();
  if (byte_267F4A948)
  {
    uint64_t v2 = sub_22126236C(&v11);
    if (v2)
    {
      uint64_t v3 = v2;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        sub_2212648C4();
      }
    }
    else
    {
      uint64_t v3 = 0;
      switch(a1)
      {
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
        case 6:
        case 8:
        case 9:
        case 10:
        case 18:
        case 19:
        case 20:
        case 21:
        case 22:
        case 23:
        case 24:
          return v3;
        case 7:
        case 11:
        case 15:
        case 26:
        case 27:
        case 28:
          unsigned int v4 = HIWORD(v11);
          goto LABEL_8;
        case 12:
        case 25:
          BOOL v5 = v11 > 1;
          goto LABEL_26;
        case 13:
        case 14:
          BOOL v5 = v11 > 2;
          goto LABEL_26;
        case 16:
        case 35:
        case 36:
        case 37:
        case 38:
        case 39:
          unsigned int v4 = v11 >> 18;
          goto LABEL_8;
        case 17:
        case 40:
          unsigned int v6 = v11;
          unsigned int v7 = 393215;
          goto LABEL_25;
        case 29:
        case 30:
        case 31:
          unsigned int v4 = v11 >> 17;
          goto LABEL_8;
        case 32:
        case 45:
        case 46:
        case 47:
        case 48:
          unsigned int v4 = v11 >> 19;
LABEL_8:
          if (v4) {
            return 0;
          }
          else {
            return 4294967279;
          }
        case 33:
          unsigned int v6 = v11;
          unsigned int v7 = 655359;
          goto LABEL_25;
        case 34:
          uint64_t v8 = sub_2212624BC(&v10);
          if (v8)
          {
            uint64_t v3 = v8;
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              sub_22126482C();
            }
          }
          else if (v10)
          {
            return 0;
          }
          else
          {
            return 4294967279;
          }
          return v3;
        case 41:
        case 42:
          BOOL v5 = HIWORD(v11) > 4u;
          goto LABEL_26;
        case 43:
        case 44:
          unsigned int v6 = v11;
          unsigned int v7 = 458751;
          goto LABEL_25;
        case 49:
          unsigned int v6 = v11;
          unsigned int v7 = 589823;
LABEL_25:
          BOOL v5 = v6 > v7;
LABEL_26:
          if (v5) {
            uint64_t v3 = 0;
          }
          else {
            uint64_t v3 = 4294967279;
          }
          break;
        default:
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            sub_221264794();
          }
          return 4294967279;
      }
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      sub_2212646FC();
    }
    return 4294967279;
  }
  return v3;
}

uint64_t sub_22126236C(_DWORD *a1)
{
  if (dword_267F4A930)
  {
    uint64_t v2 = 0;
    goto LABEL_10;
  }
  uint64_t inputStruct = 0x153534563;
  unsigned int outputStruct = 0;
  uint64_t v3 = sub_221262648();
  if (v3)
  {
    uint64_t v2 = v3;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      sub_221264B24();
    }
  }
  else
  {
    size_t outputStructCnt = 4;
    uint64_t v4 = IOConnectCallStructMethod(dword_267F4A934, 0, &inputStruct, 8uLL, &outputStruct, &outputStructCnt);
    if (!v4)
    {
      if (outputStructCnt == 4)
      {
        int v5 = outputStruct;
        if (outputStruct)
        {
          uint64_t v2 = 0;
          if (outputStruct >= 0xA0000) {
            int v5 = 655360;
          }
          dword_267F4A930 = v5;
          goto LABEL_10;
        }
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          sub_22126495C();
        }
      }
      else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        sub_2212649F4();
      }
      uint64_t v2 = 4294967290;
      goto LABEL_10;
    }
    uint64_t v2 = v4;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      sub_221264A8C();
    }
  }
LABEL_10:
  if (a1) {
    *a1 = dword_267F4A930;
  }
  return v2;
}

uint64_t sub_2212624BC(void *a1)
{
  if (a1)
  {
    if (byte_267F4A958)
    {
LABEL_10:
      uint64_t v5 = 0;
      *a1 = qword_267F4A950;
      return v5;
    }
    unsigned int v10 = 0;
    uint64_t v2 = sub_22126236C(&v10);
    if (v2)
    {
      uint64_t v5 = v2;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        sub_221264E1C();
      }
    }
    else
    {
      if (v10 < 0x30000)
      {
LABEL_9:
        byte_267F4A958 = 1;
        goto LABEL_10;
      }
      uint64_t outputStruct = 0;
      uint64_t inputStruct = 0x1E53534563;
      uint64_t v3 = sub_221262648();
      if (v3)
      {
        uint64_t v5 = v3;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          sub_221264D84();
        }
      }
      else
      {
        size_t v7 = 8;
        uint64_t v4 = IOConnectCallStructMethod(dword_267F4A934, 0, &inputStruct, 8uLL, &outputStruct, &v7);
        if (v4)
        {
          uint64_t v5 = v4;
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            sub_221264CEC();
          }
        }
        else
        {
          if (v7 == 8)
          {
            qword_267F4A950 = outputStruct;
            goto LABEL_9;
          }
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            sub_221264C54();
          }
          return 4294967290;
        }
      }
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      sub_221264BBC();
    }
    return 4294967292;
  }
  return v5;
}

uint64_t sub_221262648()
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if ((byte_267F4A959 & 1) == 0)
  {
    if (qword_267F4A970 != -1) {
      dispatch_once(&qword_267F4A970, &unk_26D31D848);
    }
    if ((byte_267F4A96C & 1) != 0 || byte_267F4B1B0)
    {
      byte_267F4A948 = 1;
    }
    else
    {
      if (qword_267F4A980 != -1) {
        dispatch_once(&qword_267F4A980, &unk_26D31D868);
      }
      byte_267F4A948 = byte_267F4A978;
      if (!byte_267F4A978)
      {
        byte_267F4A959 = 1;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          sub_221265114();
        }
        goto LABEL_13;
      }
    }
    mach_port_t v1 = *MEMORY[0x263F0EC90];
    CFDictionaryRef v2 = IOServiceMatching("AppleSSE");
    io_service_t MatchingService = IOServiceGetMatchingService(v1, v2);
    if (!MatchingService)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        sub_221264EB4();
      }
      uint64_t v0 = 4294967276;
      goto LABEL_14;
    }
    io_object_t v4 = MatchingService;
    uint64_t v5 = IOServiceOpen(MatchingService, *MEMORY[0x263EF8960], 0, (io_connect_t *)&dword_267F4A934);
    if (v5)
    {
      uint64_t v0 = v5;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        sub_22126507C();
      }
      IOObjectRelease(v4);
      goto LABEL_14;
    }
    unsigned int v6 = IONotificationPortCreate(v1);
    qword_267F4A960 = (uint64_t)v6;
    if (v6) {
      goto LABEL_24;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      sub_221264FE4();
    }
    unsigned int v6 = (IONotificationPort *)qword_267F4A960;
    if (qword_267F4A960)
    {
LABEL_24:
      size_t v7 = dispatch_get_global_queue(21, 0);
      IONotificationPortSetDispatchQueue(v6, v7);

      if (IOServiceAddInterestNotification((IONotificationPortRef)qword_267F4A960, v4, "IOGeneralInterest", (IOServiceInterestCallback)sub_221263D5C, 0, (io_object_t *)&dword_267F4A968)&& os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        sub_221264F4C();
      }
    }
    if (qword_267F4A980 != -1) {
      dispatch_once(&qword_267F4A980, &unk_26D31D868);
    }
    if (byte_267F4A979)
    {
      if (qword_267F4A970 != -1) {
        dispatch_once(&qword_267F4A970, &unk_26D31D848);
      }
      if ((byte_267F4A96C & 1) == 0)
      {
        qword_267F4A988 = (uint64_t)fopen("/var/mobile/Library/Logs/AppleSSE.log", "a");
        if (qword_267F4A988)
        {
          if (MEMORY[0x223C7D1F0]() < 1) {
            chmod("/var/mobile/Library/Logs/AppleSSE.log", 0x1B6u);
          }
          else {
            fputs("\n", (FILE *)qword_267F4A988);
          }
          v18[1] = 0;
          *(void *)CFDictionaryRef v19 = 0x4100000001;
          size_t v17 = 16;
          v18[0] = 0;
          sysctl(v19, 2u, v18, &v17, 0, 0);
          sub_2212640D4("AppleSSE Log Starts - System Version %s", v8, v9, v10, v11, v12, v13, v14, (char)v18);
          sub_2212641C0(0, 0);
        }
      }
    }
    byte_267F4A959 = 1;
    id v15 = dispatch_get_global_queue(21, 0);
    dispatch_async(v15, &unk_26D31D828);

    IOObjectRelease(v4);
    return 0;
  }
  if (byte_267F4A948) {
    return 0;
  }
LABEL_13:
  uint64_t v0 = 4294967279;
LABEL_14:
  if (dword_267F4A968)
  {
    IOObjectRelease(dword_267F4A968);
    dword_267F4A968 = 0;
  }
  if (qword_267F4A960)
  {
    IONotificationPortDestroy((IONotificationPortRef)qword_267F4A960);
    qword_267F4A960 = 0;
  }
  if (dword_267F4A934)
  {
    IOServiceClose(dword_267F4A934);
    dword_267F4A934 = 0;
  }
  return v0;
}

uint64_t sub_221262A60(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((a2 || a3) && qword_267F4A988)
  {
    sub_2212640D4("%s() -> %d", a2, a3, a4, a5, a6, a7, a8, result);
    return sub_2212641C0(a4, a5);
  }
  return result;
}

uint64_t sub_221262AD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (qword_267F4A998 != -1) {
    dispatch_once(&qword_267F4A998, &unk_26D31D8A8);
  }
  uint64_t v6 = qword_267F4A990;
  if (!qword_267F4A990) {
    return 4294967290;
  }
  return MEMORY[0x270F9A6D0](v6, sel_prepare, a3, a4, a5, a6);
}

uint64_t sub_221262B3C(const char *a1, const char *a2, void *a3, _DWORD *a4, uint64_t a5, uint64_t a6)
{
  id v13 = (id)objc_msgSend_array(MEMORY[0x263EFF980], a2, (uint64_t)a3, (uint64_t)a4, a5, a6);
  if (!a1)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      sub_2212651AC();
    }
    goto LABEL_32;
  }
  if (!a2)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      sub_221265244();
    }
    goto LABEL_32;
  }
  if (a1 > a2)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      sub_2212652DC();
    }
    goto LABEL_32;
  }
  if (!a3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      sub_221265374();
    }
    goto LABEL_32;
  }
  if (!a4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      sub_22126540C();
    }
LABEL_32:
    uint64_t v25 = 4294967292;
    goto LABEL_16;
  }
  if (a1 < a2)
  {
    if ((unint64_t)(a2 - a1) <= 3)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        sub_2212654A4();
      }
LABEL_21:
      uint64_t v25 = 4294967290;
      goto LABEL_16;
    }
    int v14 = *(_DWORD *)a1;
    if (*(_DWORD *)a1)
    {
      int v15 = 0;
      id v16 = a1 + 4;
      while ((unint64_t)(a2 - v16) > 3)
      {
        unsigned int v19 = *(_DWORD *)v16;
        uint64_t v17 = (uint64_t)(v16 + 4);
        uint64_t v18 = v19;
        if ((uint64_t)&a2[-v17] < v19)
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            sub_2212655D4();
          }
          goto LABEL_21;
        }
        id v20 = (id)objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v10, v17, v18, v11, v12);
        objc_msgSend_addObject_(v13, v21, (uint64_t)v20, v22, v23, v24);

        id v16 = (const char *)(v17 + v18);
        v15 += v18 + 4;
        if (!--v14) {
          goto LABEL_15;
        }
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        sub_22126553C();
      }
      goto LABEL_21;
    }
  }
  int v15 = 0;
LABEL_15:
  uint64_t v25 = 0;
  *a3 = v13;
  *a4 = v15;
LABEL_16:

  return v25;
}

uint64_t sub_221262D58(const __CFData *a1, CFDataRef *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v16 = 0;
  memset(inputStruct, 0, sizeof(inputStruct));
  int v14 = 0;
  memset(outputStruct, 0, sizeof(outputStruct));
  size_t outputStructCnt = 0;
  if (!a1)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      sub_22126566C();
    }
    goto LABEL_19;
  }
  if (!a2)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      sub_221265704();
    }
    goto LABEL_19;
  }
  uint64_t v4 = sub_221262648();
  if (v4)
  {
    uint64_t v10 = v4;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      sub_221265A94();
    }
    goto LABEL_10;
  }
  inputStruct[0] = 1397966179;
  LOWORD(inputStruct[1]) = 16;
  if ((unint64_t)CFDataGetLength(a1) >= 0x19)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      sub_22126579C();
    }
LABEL_19:
    uint64_t v10 = 4294967292;
    goto LABEL_10;
  }
  v18.length = CFDataGetLength(a1);
  v18.location = 0;
  CFDataGetBytes(a1, v18, (UInt8 *)&inputStruct[2]);
  uint64_t v16 = 0;
  size_t outputStructCnt = 260;
  uint64_t v5 = IOConnectCallStructMethod(dword_267F4A934, 0, inputStruct, 0x28uLL, outputStruct, &outputStructCnt);
  if (!v5)
  {
    if (outputStructCnt <= 3)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        sub_221265834();
      }
    }
    else
    {
      if (outputStructCnt == LODWORD(outputStruct[0]) + 4)
      {
        CFDataRef v6 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)outputStruct + 4, LODWORD(outputStruct[0]));
        if (v6)
        {
          uint64_t v10 = 0;
          *a2 = v6;
        }
        else
        {
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            sub_2212658CC();
          }
          uint64_t v10 = 4294967291;
        }
        goto LABEL_10;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        sub_221265964();
      }
    }
    uint64_t v10 = 4294967290;
    goto LABEL_10;
  }
  uint64_t v10 = v5;
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    sub_2212659FC();
  }
LABEL_10:
  sub_221262A60((uint64_t)"SSEGetSignedDeviceData", v10, 0, 0, (uint64_t)&inputStruct[2], v7, v8, v9);
  return v10;
}

uint64_t sub_221262FE4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (qword_267F4A998 != -1) {
    dispatch_once(&qword_267F4A998, &unk_26D31D8A8);
  }
  uint64_t v6 = qword_267F4A990;
  if (!qword_267F4A990) {
    return 4294967290;
  }
  return MEMORY[0x270F9A6D0](v6, sel_issueNewCertificate, a3, a4, a5, a6);
}

void sub_221263D5C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  if (a3 == -469794813)
  {
    uint64_t v5 = (id)qword_267F4A940;
    uint64_t v6 = v5;
    if (!v5) {
      uint64_t v6 = dispatch_get_global_queue(21, 0);
    }
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = sub_2212640B0;
    v9[3] = &unk_26459CB98;
    v9[4] = a4;
    uint64_t v7 = v9;
    goto LABEL_10;
  }
  if (a3 == -469794814)
  {
    if (!byte_267F4B1B1)
    {
      uint64_t v8 = dispatch_get_global_queue(21, 0);
      dispatch_async(v8, &unk_26D31D888);
    }
    goto LABEL_14;
  }
  if (a3 != -469794815)
  {
LABEL_14:
    uint64_t v5 = 0;
    goto LABEL_15;
  }
  uint64_t v5 = (id)qword_267F4A938;
  uint64_t v6 = v5;
  if (!v5) {
    uint64_t v6 = dispatch_get_global_queue(21, 0);
  }
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_221264088;
  v10[3] = &unk_26459CB98;
  v10[4] = a4;
  uint64_t v7 = v10;
LABEL_10:
  dispatch_async(v6, v7);
  if (!v5) {

  }
LABEL_15:
}

const char *sub_221263F18()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  size_t v2 = 1024;
  unint64_t result = (const char *)sysctlbyname("kern.bootargs", __str, &v2, 0, 0);
  if (!result)
  {
    __lasts = 0;
    unint64_t result = strtok_r(__str, " \t", &__lasts);
    if (result)
    {
      while (1)
      {
        unint64_t result = (const char *)strcmp(result, "rd=md0");
        if (!result) {
          break;
        }
        unint64_t result = strtok_r(0, " \t", &__lasts);
        if (!result) {
          return result;
        }
      }
      byte_267F4A96C = 1;
    }
  }
  return result;
}

void *sub_221263FF8()
{
  unint64_t result = dlopen("/usr/lib/libMobileGestalt.dylib", 1);
  if (result)
  {
    mach_port_t v1 = result;
    size_t v2 = (uint64_t (*)(__CFString *))dlsym(result, "MGGetBoolAnswer");
    if (v2)
    {
      uint64_t v3 = v2;
      byte_267F4A978 = v2(@"0dnM19zBqLw5ZPhIo4GEkg");
      byte_267F4A979 = v3(@"InternalBuild");
    }
    return (void *)dlclose(v1);
  }
  return result;
}

uint64_t sub_221264088()
{
  uint64_t result = qword_267F4A920;
  if (qword_267F4A920) {
    return (*(uint64_t (**)(void))(qword_267F4A920 + 16))();
  }
  return result;
}

uint64_t sub_2212640B0()
{
  uint64_t result = qword_267F4A928;
  if (qword_267F4A928) {
    return (*(uint64_t (**)(void))(qword_267F4A928 + 16))();
  }
  return result;
}

const char *sub_2212640D4(const char *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (qword_267F4A988)
  {
    uint64_t v9 = result;
    *(_OWORD *)int v14 = 0u;
    long long v15 = 0u;
    time_t v13 = time(0);
    uint64_t v10 = localtime(&v13);
    strftime(v14, 0x20uLL, "%F %T (%z)", v10);
    uint64_t v11 = (FILE *)qword_267F4A988;
    uint64_t v12 = getprogname();
    fprintf(v11, "%s [%s]: ", v14, v12);
    vfprintf((FILE *)qword_267F4A988, v9, &a9);
    fputs("\n", (FILE *)qword_267F4A988);
    return (const char *)fflush((FILE *)qword_267F4A988);
  }
  return result;
}

uint64_t sub_2212641C0(uint64_t result, uint64_t a2)
{
  if (qword_267F4A988)
  {
    uint64_t v3 = (_DWORD *)result;
    uint64_t inputStruct = 0x953534563;
    long long v7 = 0u;
    long long v8 = 0u;
    long long outputStruct = 0u;
    size_t outputStructCnt = 48;
    uint64_t result = IOConnectCallStructMethod(dword_267F4A934, 0, &inputStruct, 8uLL, &outputStruct, &outputStructCnt);
    if (!result)
    {
      if (v3) {
        fprintf((FILE *)qword_267F4A988, "\tuserID        = %u\n", *v3);
      }
      if (a2)
      {
        fwrite("\tseid          = ", 0x11uLL, 1uLL, (FILE *)qword_267F4A988);
        for (uint64_t i = 0; i != 24; ++i)
          fprintf((FILE *)qword_267F4A988, "%02x", *(unsigned __int8 *)(a2 + i));
        fputs("\n", (FILE *)qword_267F4A988);
      }
      fprintf((FILE *)qword_267F4A988, "\tsseKey hash   = %016llx\n", (void)outputStruct);
      fprintf((FILE *)qword_267F4A988, "\tauthRand hash = %016llx\n", *((void *)&outputStruct + 1));
      fprintf((FILE *)qword_267F4A988, "\tsubcounter    = %llu\n", (void)v7);
      fprintf((FILE *)qword_267F4A988, "\tentropy hash  = %016llx\n", *((void *)&v7 + 1));
      fprintf((FILE *)qword_267F4A988, "\tkeybag hash   = %016llx\n", (void)v8);
      fprintf((FILE *)qword_267F4A988, "\tnoPasscodeCnt = %u\n", DWORD2(v8));
      return fflush((FILE *)qword_267F4A988);
    }
  }
  return result;
}

void sub_221264354()
{
  if (qword_267F4A970 != -1) {
    dispatch_once(&qword_267F4A970, &unk_26D31D848);
  }
  if ((byte_267F4A96C & 1) == 0)
  {
    sub_221262648();
    if (byte_267F4A948)
    {
      if (qword_267F4A9A8[0] != -1) {
        dispatch_once(qword_267F4A9A8, &unk_26D31D8C8);
      }
      if (byte_267F4A9A0 == 1)
      {
        if (dlopen("/usr/lib/libAppleSSEExt.dylib", 1))
        {
          Class Class = objc_getClass("BAASupport");
          qword_267F4A990 = (uint64_t)Class;
          if (!Class)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              sub_221266FF4();
            }
            Class Class = (Class)qword_267F4A990;
          }
          uint64_t v1 = objc_opt_class();
          objc_msgSend_setDelegate_(Class, v2, v1, v3, v4, v5);
        }
        else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          sub_221266F5C();
        }
      }
    }
  }
}

void sub_221264478(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v6 = (id)objc_msgSend_processInfo(MEMORY[0x263F08AB0], a2, a3, a4, a5, a6);
  id v12 = (id)objc_msgSend_processName(v6, v7, v8, v9, v10, v11);
  int isEqualToString = objc_msgSend_isEqualToString_(v12, v13, @"nfcd", v14, v15, v16);

  if (isEqualToString)
  {
    byte_267F4A9A0 = 1;
  }
  else
  {
    CFRange v18 = dlopen("/System/Library/Frameworks/Security.framework/Security", 1);
    if (v18)
    {
      unsigned int v19 = v18;
      id v20 = (uint64_t (*)(void))dlsym(v18, "SecTaskCreateFromSelf");
      if (v20)
      {
        uint64_t v21 = v20(*MEMORY[0x263EFFB08]);
        if (v21)
        {
          uint64_t v22 = (const void *)v21;
          uint64_t v23 = (uint64_t (*)(const void *, __CFString *, void))dlsym(v19, "SecTaskCopyValueForEntitlement");
          if (v23)
          {
            uint64_t v24 = v23;
            uint64_t v25 = (void *)v23(v22, @"com.apple.private.applesse.allow", 0);
            uint64_t v26 = (void *)v24(v22, @"com.apple.private.applesse.baa", 0);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              if (objc_msgSend_BOOLValue(v25, v27, v28, v29, v30, v31))
              {
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  if (objc_msgSend_BOOLValue(v26, v32, v33, v34, v35, v36)) {
                    byte_267F4A9A0 = 1;
                  }
                }
              }
            }
          }
          CFRelease(v22);
        }
      }
      dlclose(v19);
    }
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    v37[0] = 67109120;
    v37[1] = byte_267F4A9A0;
    _os_log_impl(&dword_221247000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "isEntitledForBAA(): entitled = %u", (uint8_t *)v37, 8u);
  }
}

void sub_2212646C0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x30u);
}

void sub_2212646FC()
{
  sub_22126468C();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_221264794()
{
  sub_22126468C();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_22126482C()
{
  sub_2212646DC();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_2212648C4()
{
  sub_2212646DC();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_22126495C()
{
  sub_22126468C();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_2212649F4()
{
  sub_22126468C();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_221264A8C()
{
  sub_2212646DC();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_221264B24()
{
  sub_2212646DC();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_221264BBC()
{
  sub_22126468C();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_221264C54()
{
  sub_22126468C();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_221264CEC()
{
  sub_2212646DC();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_221264D84()
{
  sub_2212646DC();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_221264E1C()
{
  sub_2212646DC();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_221264EB4()
{
  sub_22126468C();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_221264F4C()
{
  sub_2212646DC();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_221264FE4()
{
  sub_22126468C();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_22126507C()
{
  sub_2212646DC();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_221265114()
{
  sub_22126468C();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_2212651AC()
{
  sub_22126468C();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_221265244()
{
  sub_22126468C();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_2212652DC()
{
  sub_22126468C();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_221265374()
{
  sub_22126468C();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_22126540C()
{
  sub_22126468C();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_2212654A4()
{
  sub_22126468C();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_22126553C()
{
  sub_22126468C();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_2212655D4()
{
  sub_22126468C();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_22126566C()
{
  sub_22126468C();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_221265704()
{
  sub_22126468C();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_22126579C()
{
  sub_22126468C();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_221265834()
{
  sub_22126468C();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_2212658CC()
{
  sub_22126468C();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_221265964()
{
  sub_22126468C();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_2212659FC()
{
  sub_2212646DC();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_221265A94()
{
  sub_2212646DC();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_221265B2C()
{
  sub_22126468C();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_221265BC4()
{
  sub_22126468C();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_221265C5C()
{
  sub_22126468C();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_221265CF4()
{
  sub_22126468C();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_221265D8C()
{
  sub_22126468C();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_221265E24()
{
  sub_22126468C();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_221265EBC()
{
  sub_22126468C();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_221265F54()
{
  sub_22126468C();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_221265FEC()
{
  sub_22126468C();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_221266084()
{
  sub_2212646DC();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_22126611C()
{
  sub_2212646DC();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_2212661B4()
{
  sub_22126468C();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_22126624C()
{
  sub_2212646DC();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_2212662E4()
{
  sub_22126468C();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_22126637C()
{
  sub_22126468C();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_221266414()
{
  sub_22126468C();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_2212664AC()
{
  sub_22126468C();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_221266544()
{
  sub_2212646DC();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_2212665DC()
{
  sub_22126468C();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_221266674()
{
  sub_22126468C();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_22126670C()
{
  sub_2212646DC();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_2212667A4()
{
  sub_2212646DC();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_22126683C()
{
  sub_22126468C();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_2212668D4()
{
  sub_22126468C();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_22126696C()
{
  sub_2212646DC();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_221266A04()
{
  sub_2212646DC();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_221266A9C()
{
  sub_2212646DC();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_221266B34()
{
  sub_2212646DC();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_221266BCC()
{
  sub_2212646DC();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_221266C64()
{
  sub_22126468C();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_221266CFC()
{
  sub_22126468C();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_221266D94()
{
  sub_22126468C();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_221266E2C()
{
  sub_2212646DC();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_221266EC4()
{
  sub_2212646DC();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_221266F5C()
{
  sub_22126468C();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

void sub_221266FF4()
{
  sub_22126468C();
  sub_2212646AC();
  sub_2212646C0(&dword_221247000, &_os_log_internal, v0, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n", v1, v2, v3, v4, v5);
}

uint64_t sub_22126708C(uint64_t a1, unint64_t *a2)
{
  return sub_221267094(a1, a2, 0);
}

uint64_t sub_221267094(uint64_t result, unint64_t *a2, unint64_t *a3)
{
  unint64_t v3 = *(void *)(result + 8);
  if (v3 < 2) {
    return 3;
  }
  uint64_t v4 = *(unsigned char **)result;
  if (*(void *)result == -1) {
    goto LABEL_68;
  }
  uint8_t v5 = &v4[v3];
  id v6 = v4 + 1;
  unint64_t v7 = v3 - 1;
  unint64_t v8 = *v4 & 0x1F;
  if ((*v4 & 0x1F) != 0x1F)
  {
    id v12 = v4 + 1;
LABEL_20:
    *a2 = v8 | ((unint64_t)(*v4 & 0xE0) << 56);
    if (v12 != (char *)-1)
    {
      if (v12 >= v5 || v12 < v4) {
        goto LABEL_69;
      }
      uint64_t v14 = v12 + 1;
      unint64_t v15 = *v12;
      unint64_t v16 = v7 - 1;
      if ((*v12 & 0x80000000) == 0)
      {
        if (a3 || v16 >= v15)
        {
          if (v16 >= v15) {
            unint64_t v17 = *v12;
          }
          else {
            unint64_t v17 = v7 - 1;
          }
          BOOL v10 = v5 >= v14;
          unint64_t v18 = v5 - v14;
          if (v10 && v4 <= v14 && v17 <= v18)
          {
            a2[1] = (unint64_t)v14;
            a2[2] = v17;
            if (!a3) {
              return 0;
            }
LABEL_34:
            uint64_t result = 0;
            *a3 = v15;
            return result;
          }
LABEL_69:
          __break(0x5519u);
LABEL_70:
          __break(0x5515u);
          return result;
        }
        return 3;
      }
      unint64_t v19 = v15 & 0x7F;
      if ((v15 & 0x7F) > 8) {
        return 3;
      }
      if ((v15 & 0x7F) == 0 || v16 < v19) {
        return 3;
      }
      if (v14 >= v5 || v14 < v4) {
        goto LABEL_69;
      }
      if (!*v14) {
        return 3;
      }
      unint64_t v15 = 0;
      uint64_t v21 = (v19 - 1);
      unint64_t v22 = v7 - v21 - 2;
      unint64_t v23 = (unint64_t)&v12[v21 + 2];
      while (v14 != (unsigned char *)-1)
      {
        if (v14 >= v5) {
          goto LABEL_69;
        }
        BOOL v10 = v16-- != 0;
        if (!v10) {
          goto LABEL_70;
        }
        unsigned int v24 = *v14++;
        unint64_t v15 = (v15 << 8) | v24;
        LODWORD(v19) = v19 - 1;
        if (!v19)
        {
          if (a3) {
            BOOL v25 = 0;
          }
          else {
            BOOL v25 = v15 > v22;
          }
          char v26 = v25;
          uint64_t result = 3;
          if (v15 < 0x80 || (v26 & 1) != 0) {
            return result;
          }
          if (v15 >= v22) {
            unint64_t v27 = v22;
          }
          else {
            unint64_t v27 = v15;
          }
          BOOL v10 = (unint64_t)v5 >= v23;
          uint64_t v28 = &v5[-v23];
          if (!v10 || (unint64_t)v4 > v23 || v27 > (unint64_t)v28) {
            goto LABEL_69;
          }
          a2[1] = v23;
          a2[2] = v27;
          if (a3) {
            goto LABEL_34;
          }
          return 0;
        }
      }
    }
LABEL_68:
    __break(0x5513u);
    goto LABEL_69;
  }
  unsigned int v9 = *v6;
  BOOL v10 = v9 != 128 && v9 >= 0x1F;
  if (!v10) {
    return 3;
  }
  unint64_t v8 = 0;
  uint64_t result = 3;
  while (v7 >= 2)
  {
    unint64_t v11 = v8;
    if (v8 >> 57) {
      break;
    }
    if (v6 == (unsigned __int8 *)-1) {
      goto LABEL_68;
    }
    if (v6 >= v5 || v6 < v4) {
      goto LABEL_69;
    }
    id v12 = (char *)(v6 + 1);
    --v7;
    unsigned __int8 v13 = *v6;
    unint64_t v8 = *v6++ & 0x7F | (v8 << 7);
    if ((v13 & 0x80) == 0)
    {
      if (v11 >> 54) {
        return 3;
      }
      goto LABEL_20;
    }
  }
  return result;
}

uint64_t sub_221267284(uint64_t result, unint64_t *a2, unsigned char *a3)
{
  *a3 = 0;
  *a2 = 0;
  a2[1] = 0;
  if (!*(void *)(result + 8)) {
    return 3;
  }
  unsigned int v3 = **(unsigned __int8 **)result;
  *a3 = v3;
  uint64_t v4 = *(void *)(result + 8);
  if (v4 != 1)
  {
    if (v3 <= 7)
    {
      unint64_t v5 = v4 - 1;
      if (!v4)
      {
LABEL_20:
        __break(0x5515u);
        goto LABEL_21;
      }
      unint64_t v6 = *(void *)result;
      unint64_t v7 = *(void *)result + v4;
      unint64_t v8 = (unsigned __int8 *)(*(void *)result + v5);
      if ((unint64_t)v8 >= v7 || (unint64_t)v8 < v6)
      {
LABEL_19:
        __break(0x5519u);
        goto LABEL_20;
      }
      if (((0xFFu >> (8 - v3)) & *v8) == 0)
      {
        if (v6 == -1)
        {
LABEL_21:
          __break(0x5513u);
          return result;
        }
        unint64_t v10 = v6 + 1;
        if (v6 + 1 <= v7 && v6 <= v10)
        {
          uint64_t result = 0;
          *a2 = v10;
          a2[1] = v5;
          return result;
        }
        goto LABEL_19;
      }
    }
    return 3;
  }
  if (v3) {
    return 3;
  }
  else {
    return 0;
  }
}

uint64_t sub_221267344(char **a1, _DWORD *a2)
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = 0xAAAAAAAAAAAAAAAALL;
  uint64_t result = sub_2212673C8(a1, v4);
  if (!result)
  {
    if (HIDWORD(v4[0]))
    {
      return 7;
    }
    else
    {
      uint64_t result = 0;
      *a2 = v4[0];
    }
  }
  return result;
}

uint64_t sub_2212673C8(char **a1, unint64_t *a2)
{
  unint64_t v2 = (unint64_t)a1[1];
  if (!v2) {
    return 3;
  }
  unsigned int v3 = (unsigned __int8 *)*a1;
  if (**a1 < 0) {
    return 3;
  }
  if (**a1)
  {
    if (v2 > 8) {
      return 7;
    }
    goto LABEL_10;
  }
  if (v2 >= 2)
  {
    if (((char)v3[1] & 0x80000000) == 0) {
      return 3;
    }
    if (v2 > 9) {
      return 7;
    }
  }
LABEL_10:
  unint64_t v5 = 0;
  do
  {
    unsigned int v6 = *v3++;
    unint64_t v5 = v6 | (v5 << 8);
    --v2;
  }
  while (v2);
  uint64_t result = 0;
  *a2 = v5;
  return result;
}

uint64_t sub_221267430(uint64_t a1, void *a2, void *a3)
{
  v8[3] = *MEMORY[0x263EF8340];
  memset(v8, 170, 24);
  uint64_t result = sub_221267094(a1, v8, 0);
  if (!result)
  {
    unint64_t v6 = v8[0];
    *a2 = v8[0];
    if (v6 >> 1 == 0x1000000000000008)
    {
      if (__CFADD__(v8[1], v8[2]))
      {
        __break(0x5513u);
      }
      else
      {
        unint64_t v7 = v8[1] + v8[2];
        if (v8[1] <= v8[1] + v8[2])
        {
          uint64_t result = 0;
          *a3 = v8[1];
          a3[1] = v7;
          return result;
        }
      }
      __break(0x5519u);
    }
    else
    {
      return 2;
    }
  }
  return result;
}

uint64_t sub_2212674EC(unint64_t *a1, unint64_t *a2)
{
  v10[2] = *MEMORY[0x263EF8340];
  v10[0] = 0;
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  if (*a1 >= v3) {
    return 1;
  }
  v10[0] = *a1;
  v10[1] = v3 - v2;
  uint64_t result = sub_221267094((uint64_t)v10, a2, 0);
  if (!result)
  {
    unint64_t v8 = a2[1];
    unint64_t v7 = a2[2];
    if (!__CFADD__(v8, v7))
    {
      unint64_t v9 = v8 + v7;
      if (v9 <= a1[1] && *a1 <= v9)
      {
        uint64_t result = 0;
        *a1 = v9;
        return result;
      }
      __break(0x5519u);
    }
    __break(0x5513u);
  }
  return result;
}

uint64_t sub_2212675AC(uint64_t a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  uint64_t v12[3] = *MEMORY[0x263EF8340];
  memset(v12, 170, 24);
  uint64_t result = sub_221267094(a1, v12, 0);
  if (!result)
  {
    if (v12[0] == 0x2000000000000010) {
      return sub_221267678(&v12[1], a2, a3, a4, a5, a6);
    }
    else {
      return 2;
    }
  }
  return result;
}

uint64_t sub_221267678(unint64_t *a1, unsigned int a2, uint64_t a3, unint64_t a4, unint64_t a5, size_t a6)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  unint64_t v32 = 0;
  if (a6)
  {
    if (a6 > a5) {
      goto LABEL_59;
    }
    bzero((void *)a4, a6);
  }
  unint64_t v10 = *a1;
  unint64_t v11 = a1[1];
  if (__CFADD__(*a1, v11)) {
    goto LABEL_58;
  }
  unint64_t v12 = v10 + v11;
  if (v10 > v12) {
LABEL_59:
  }
    __break(0x5519u);
  unint64_t v32 = *a1;
  unint64_t v33 = v12;
  if (a2)
  {
    unsigned __int16 v13 = 0;
    uint64_t v29 = (char *)(a4 + a5);
    while (1)
    {
      memset(v31, 170, sizeof(v31));
      unint64_t v15 = v32;
      unint64_t v14 = v33;
      uint64_t result = sub_2212674EC(&v32, v31);
      if (result) {
        break;
      }
      if (a2 <= v13) {
        return 2;
      }
      while (1)
      {
        if (24 * (__int16)v13 > (unint64_t)~a3) {
          goto LABEL_58;
        }
        unsigned __int16 v17 = v13;
        __int16 v18 = *(_WORD *)(a3 + 24 * v13 + 16);
        if ((v18 & 2) != 0 || v31[0] == *(void *)(a3 + 24 * v13 + 8)) {
          break;
        }
        uint64_t result = 2;
        if (v18)
        {
          ++v13;
          if (a2 > (unsigned __int16)(v17 + 1)) {
            continue;
          }
        }
        return result;
      }
      if ((v18 & 4) == 0)
      {
        unint64_t v19 = *(void *)(a3 + 24 * v13);
        if (v19 > 0xFFFFFFFFFFFFFFEFLL || v19 + 16 > a5) {
          return 7;
        }
        if (v19 > ~a4) {
          goto LABEL_58;
        }
        uint64_t v21 = (char *)(a4 + v19);
        if (v21 >= v29 || (unint64_t)v21 < a4) {
          goto LABEL_59;
        }
        *(_OWORD *)uint64_t v21 = *(_OWORD *)&v31[1];
        if ((v18 & 8) != 0)
        {
          if (v15 >= v31[1])
          {
            if (v21 + 16 <= v29 && v14 >= v15 && *((void *)v21 + 1) <= v14 - v15)
            {
              *(void *)uint64_t v21 = v15;
              return 3;
            }
            goto LABEL_59;
          }
          if (v21 + 16 > v29) {
            goto LABEL_59;
          }
          uint64_t v23 = *((void *)v21 + 1);
          unint64_t v24 = v23 + v31[1] - v15;
          if (__CFADD__(v23, v31[1] - v15))
          {
            __break(0x5500u);
            return result;
          }
          if (v14 < v15 || v24 > v14 - v15) {
            goto LABEL_59;
          }
          *(void *)uint64_t v21 = v15;
          *((void *)v21 + 1) = v24;
        }
      }
      ++v13;
      if (a2 == (unsigned __int16)(v17 + 1))
      {
        if (!__CFADD__(v31[1], v31[2]))
        {
          unint64_t v28 = a1[1];
          if (!__CFADD__(*a1, v28))
          {
            unint64_t v10 = v31[1] + v31[2];
            unint64_t v12 = *a1 + v28;
            goto LABEL_47;
          }
        }
LABEL_58:
        __break(0x5513u);
        goto LABEL_59;
      }
      if (a2 <= (unsigned __int16)(v17 + 1))
      {
        unint64_t v10 = v32;
        unint64_t v12 = v33;
        goto LABEL_47;
      }
    }
    if (result == 1)
    {
      if (a2 <= v13)
      {
        return 0;
      }
      else
      {
        BOOL v25 = (__int16 *)(a3 + 24 * v13 + 16);
        unint64_t v26 = a2 - (unint64_t)v13;
        uint64_t result = 0;
        while (1)
        {
          __int16 v27 = *v25;
          v25 += 12;
          if ((v27 & 1) == 0) {
            break;
          }
          if (!--v26) {
            return result;
          }
        }
        return 5;
      }
    }
  }
  else
  {
LABEL_47:
    if (v10 == v12) {
      return 0;
    }
    else {
      return 3;
    }
  }
  return result;
}

uint64_t sub_22126794C(uint64_t result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4) {
    return sub_2212675AC(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  }
  __break(0x5519u);
  return result;
}

unint64_t *sub_22126796C(unint64_t *result, unsigned int a2, uint64_t a3, unint64_t a4, size_t a5)
{
  if ((a4 | 0x7FFFFFFFFFFFFFFFLL) >= a4) {
    return (unint64_t *)sub_221267678(result, a2, a3, a4, ~a4 & 0x7FFFFFFFFFFFFFFFLL, a5);
  }
  __break(0x5519u);
  return result;
}

uint64_t sub_22126798C(uint64_t a1, uint64_t a2)
{
  v4[3] = *MEMORY[0x263EF8340];
  memset(v4, 170, 24);
  uint64_t result = sub_221267094(a1, v4, 0);
  if (!result)
  {
    if (v4[0] - 0x2000000000000012 >= 0xFFFFFFFFFFFFFFFELL) {
      return sub_221267A2C(&v4[1], a2);
    }
    else {
      return 2;
    }
  }
  return result;
}

uint64_t sub_221267A2C(unint64_t *a1, uint64_t a2)
{
  v9[2] = *MEMORY[0x263EF8340];
  v9[0] = 0;
  unint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  if (__CFADD__(*a1, v3))
  {
    __break(0x5513u);
LABEL_13:
    __break(0x5519u);
  }
  unint64_t v4 = v2 + v3;
  if (v2 > v4) {
    goto LABEL_13;
  }
  v9[0] = *a1;
  v9[1] = v4;
  memset(v8, 170, sizeof(v8));
  char v7 = 0;
  while (1)
  {
    LODWORD(result) = sub_2212674EC(v9, v8);
    if (result) {
      break;
    }
    LODWORD(result) = (*(uint64_t (**)(uint64_t, unint64_t *, char *))(a2 + 16))(a2, v8, &v7);
    if (result) {
      break;
    }
    if (v7) {
      return 0;
    }
  }
  if (result <= 1) {
    return 0;
  }
  else {
    return result;
  }
}

unint64_t sub_221267AFC(unint64_t result, unint64_t a2, unint64_t a3, uint64_t *a4)
{
  if (result >= 0x80)
  {
    uint64_t v5 = 0;
    unint64_t v6 = result;
    do
    {
      --v5;
      BOOL v7 = v6 > 0xFF;
      v6 >>= 8;
    }
    while (v7);
    unint64_t v8 = -v5;
    uint64_t v9 = 7;
    if (-v5 < a3 && v8 <= 0x7E)
    {
      if (*a4)
      {
        uint64_t v4 = 1 - v5;
        *(unsigned char *)a2 = -(char)v5 | 0x80;
        if (v8 < ~a2)
        {
          unint64_t v10 = (unsigned char *)(a2 - v5);
          if (a2 - v5 != -2)
          {
            unint64_t v11 = (unsigned char *)(a2 + *a4);
            while (v10 != (unsigned char *)-1)
            {
              if (v10 >= v11 || (unint64_t)v10 < a2) {
                goto LABEL_23;
              }
              *v10-- = result;
              BOOL v7 = result > 0xFF;
              result >>= 8;
              if (!v7)
              {
                if (v8 >= *a4) {
                  goto LABEL_23;
                }
                goto LABEL_19;
              }
            }
          }
        }
        __break(0x5513u);
      }
      goto LABEL_23;
    }
    return v9;
  }
  if (!a3) {
    return 7;
  }
  if (*a4)
  {
    *(unsigned char *)a2 = result;
    if (*a4)
    {
      uint64_t v4 = 1;
LABEL_19:
      uint64_t v9 = 0;
      *a4 = v4;
      return v9;
    }
  }
LABEL_23:
  __break(0x5519u);
  return result;
}

unint64_t sub_221267BF0(unint64_t result, unint64_t a2)
{
  unint64_t v2 = result & 0x1FFFFFFFFFFFFFFFLL;
  uint64_t v3 = 1;
  if ((result & 0x1FFFFFFFFFFFFFFFLL) >= 0x1F)
  {
    do
    {
      ++v3;
      BOOL v4 = v2 > 0x7F;
      v2 >>= 7;
    }
    while (v4);
  }
  uint64_t v5 = 1;
  if (a2 >= 0x80)
  {
    unint64_t v6 = a2;
    do
    {
      ++v5;
      BOOL v4 = v6 > 0xFF;
      v6 >>= 8;
    }
    while (v4);
  }
  BOOL v7 = __CFADD__(v3, v5);
  uint64_t v8 = v3 + v5;
  if (v7 || (uint64_t result = v8 + a2, __CFADD__(v8, a2))) {
    __break(0x5500u);
  }
  return result;
}

uint64_t sub_221267C50(unint64_t a1, unint64_t a2, const void *a3, unint64_t a4, unint64_t *a5)
{
  return sub_221267C5C(a1, a2, a3, a4, *a5, a5);
}

uint64_t sub_221267C5C(unint64_t a1, unint64_t a2, const void *a3, unint64_t a4, unint64_t a5, unint64_t *a6)
{
  v22[1] = *MEMORY[0x263EF8340];
  unint64_t v12 = *a6;
  unint64_t v13 = sub_221267BF0(a1, a2);
  if (v13 > a5) {
    return 7;
  }
  unint64_t v15 = v13;
  if (v13 > *a6) {
    goto LABEL_20;
  }
  *a6 = v13;
  v22[0] = v13;
  if (v13 > v12) {
    goto LABEL_20;
  }
  uint64_t result = sub_221267DC8(a1, a4, (unint64_t *)v22);
  if (result) {
    return result;
  }
  uint64_t v16 = v22[0];
  if (__CFADD__(a4, v22[0]))
  {
LABEL_21:
    __break(0x5513u);
    goto LABEL_22;
  }
  BOOL v17 = v15 >= v22[0];
  unint64_t v18 = v15 - v22[0];
  if (!v17) {
    goto LABEL_22;
  }
  unint64_t v19 = a4 + v12;
  unint64_t v20 = a4 + v22[0];
  v22[0] = v18;
  if (a4 + v16 > a4 + v12 || v20 < a4 || v18 > v19 - v20) {
LABEL_20:
  }
    __break(0x5519u);
  uint64_t result = sub_221267AFC(a2, v20, v18, v22);
  if (result) {
    return result;
  }
  if (__CFADD__(v20, v22[0])) {
    goto LABEL_21;
  }
  if (v18 < v22[0])
  {
LABEL_22:
    __break(0x5515u);
    return result;
  }
  uint64_t v21 = (void *)(v20 + v22[0]);
  if (v19 < v20 + v22[0] || (unint64_t)v21 < a4 || v19 - (v20 + v22[0]) < a2) {
    goto LABEL_20;
  }
  memmove(v21, a3, a2);
  return 0;
}

uint64_t sub_221267DC8(uint64_t result, unint64_t a2, unint64_t *a3)
{
  unint64_t v3 = result & 0x1FFFFFFFFFFFFFFFLL;
  if ((result & 0x1FFFFFFFFFFFFFFFuLL) < 0x1F)
  {
    if (*a3)
    {
      *(unsigned char *)a2 = HIBYTE(result) & 0xE0 | result;
      unint64_t v8 = 1;
      goto LABEL_17;
    }
    return 7;
  }
  unint64_t v4 = 0;
  unint64_t v5 = result & 0x1FFFFFFFFFFFFFFFLL;
  do
  {
    ++v4;
    BOOL v6 = v5 > 0x7F;
    v5 >>= 7;
  }
  while (v6);
  unint64_t v7 = *a3;
  if (v4 >= *a3) {
    return 7;
  }
  if (v4 >= ~a2 || (*(unsigned char *)a2 = HIBYTE(result) | 0x1F, a2 + v4 == -2))
  {
LABEL_20:
    __break(0x5513u);
    goto LABEL_21;
  }
  if (a2 + v4 >= a2)
  {
    unint64_t v8 = v4 + 1;
    *(unsigned char *)(a2 + v4) = result & 0x7F;
    if (v3 >= 0x80)
    {
      uint64_t v9 = (unsigned char *)(a2 + v4 - 1);
      unint64_t v10 = (unsigned char *)(a2 + v7);
      while (v9 != (unsigned char *)-2)
      {
        if (v9 >= v10 || (unint64_t)v9 < a2) {
          goto LABEL_21;
        }
        unint64_t v11 = v3 >> 14;
        v3 >>= 7;
        *v9-- = v3 | 0x80;
        if (!v11) {
          goto LABEL_17;
        }
      }
      goto LABEL_20;
    }
LABEL_17:
    if (v8 <= *a3)
    {
      uint64_t result = 0;
      *a3 = v8;
      return result;
    }
  }
LABEL_21:
  __break(0x5519u);
  return result;
}

uint64_t sub_221267EBC(uint64_t a1, unint64_t a2, unint64_t a3, unsigned int a4, uint64_t a5, unint64_t a6, unint64_t a7, unint64_t *a8)
{
  v45[1] = *MEMORY[0x263EF8340];
  unint64_t v8 = ~a6;
  if (~a6 < a7) {
    goto LABEL_73;
  }
  unint64_t v11 = *a8;
  unint64_t v44 = a7;
  v45[0] = 0;
  if (v11 < a7) {
    goto LABEL_74;
  }
  uint64_t result = sub_221267DC8(a1, a6, &v44);
  if (result) {
    return result;
  }
  if (v44 > v8) {
    goto LABEL_73;
  }
  unint64_t v17 = a7 - v44;
  if (a7 < v44) {
    goto LABEL_75;
  }
  unint64_t v18 = a6 + a7;
  unint64_t v19 = a6 + v44;
  if (a6 + v44 < v18)
  {
    uint64_t result = sub_221268290(a2, a3, a4, a5, v45);
    if (result) {
      return result;
    }
    unint64_t v44 = v17;
    if (v19 > a6 + v11 || v19 < a6 || v17 > a6 + v11 - v19) {
      goto LABEL_74;
    }
    unint64_t v42 = a6 + v11;
    unint64_t v20 = v45[0];
    uint64_t result = sub_221267AFC(v45[0], v19, v17, (uint64_t *)&v44);
    if (result) {
      return result;
    }
    unint64_t v21 = v42;
    if (__CFADD__(v19, v44))
    {
LABEL_73:
      __break(0x5513u);
      goto LABEL_74;
    }
    unint64_t v22 = v17 - v44;
    if (v17 >= v44)
    {
      uint64_t v23 = (unsigned char *)(v19 + v44);
      if (!__CFADD__(v19 + v44, v20))
      {
        if ((unint64_t)&v23[v20] > v18) {
          return 7;
        }
        if (a4)
        {
          unint64_t v24 = 0;
          unint64_t v25 = a2 + a3;
          uint64_t v41 = 24 * a4;
          while (1)
          {
            if (v24 > ~a5) {
              goto LABEL_73;
            }
            unint64_t v26 = *(void *)(a5 + v24);
            if (v26 > ~a2) {
              goto LABEL_73;
            }
            __int16 v27 = (const void **)(a2 + v26);
            __int16 v28 = *(_WORD *)(a5 + v24 + 16);
            if ((v28 & 0x200) != 0) {
              break;
            }
            if ((v28 & 1) == 0) {
              goto LABEL_29;
            }
            if ((unint64_t)v27 < a2 || (unint64_t)(v27 + 2) > v25) {
              goto LABEL_74;
            }
            if (v27[1])
            {
LABEL_29:
              unint64_t v44 = v22;
              if ((unint64_t)v23 > v21 || (unint64_t)v23 < a6 || v22 > v21 - (unint64_t)v23) {
                goto LABEL_74;
              }
              uint64_t result = sub_221267DC8(*(void *)(a5 + v24 + 8), (unint64_t)v23, &v44);
              if (result) {
                return result;
              }
              if (__CFADD__(v23, v44)) {
                goto LABEL_73;
              }
              unint64_t v30 = v22 - v44;
              if (v22 < v44) {
                goto LABEL_75;
              }
              if ((unint64_t)v27 < a2 || (unint64_t)(v27 + 2) > v25) {
                goto LABEL_74;
              }
              unint64_t v31 = (unint64_t)v27[1];
              v45[0] = v31;
              char v32 = 1;
              if ((v28 & 0x100) != 0 && v31 && *(char *)*v27 < 0)
              {
                char v32 = 0;
                v45[0] = ++v31;
              }
              unint64_t v33 = (unint64_t)&v23[v44];
              unint64_t v44 = v30;
              if (v33 > v42 || v33 < a6 || v30 > v42 - v33) {
                goto LABEL_74;
              }
              uint64_t result = sub_221267AFC(v31, v33, v30, (uint64_t *)&v44);
              if (result) {
                return result;
              }
              unint64_t v34 = v44;
              if (__CFADD__(v33, v44)) {
                goto LABEL_73;
              }
              unint64_t v35 = v30 - v44;
              if (v30 < v44) {
                goto LABEL_75;
              }
              uint64_t v23 = (unsigned char *)(v33 + v44);
              if ((v32 & 1) == 0)
              {
                if (v23 == (unsigned char *)-1) {
                  goto LABEL_73;
                }
                if ((unint64_t)v23 >= v42 || (unint64_t)v23 < a6) {
                  goto LABEL_74;
                }
                unsigned char *v23 = 0;
                --v35;
                if (v30 == v34) {
                  goto LABEL_75;
                }
                ++v23;
              }
              if ((unint64_t)v23 > v42) {
                goto LABEL_74;
              }
              if ((unint64_t)v23 < a6) {
                goto LABEL_74;
              }
              size_t v36 = (size_t)v27[1];
              if (v36 > v42 - (unint64_t)v23) {
                goto LABEL_74;
              }
              uint64_t result = (uint64_t)memmove(v23, *v27, v36);
              unint64_t v21 = v42;
              unint64_t v37 = (unint64_t)v27[1];
              if (__CFADD__(v23, v37)) {
                goto LABEL_73;
              }
              unint64_t v22 = v35 - v37;
              if (v35 < v37) {
                goto LABEL_75;
              }
              goto LABEL_69;
            }
LABEL_70:
            v24 += 24;
            if (v41 == v24) {
              goto LABEL_71;
            }
          }
          if ((unint64_t)v27 < a2 || (unint64_t)(v27 + 2) > v25) {
            goto LABEL_74;
          }
          if ((unint64_t)v23 > v21) {
            goto LABEL_74;
          }
          if ((unint64_t)v23 < a6) {
            goto LABEL_74;
          }
          size_t v39 = (size_t)v27[1];
          if (v39 > v21 - (unint64_t)v23) {
            goto LABEL_74;
          }
          uint64_t result = (uint64_t)memmove(v23, *v27, v39);
          unint64_t v21 = v42;
          unint64_t v37 = (unint64_t)v27[1];
          if (__CFADD__(v23, v37)) {
            goto LABEL_73;
          }
          BOOL v40 = v22 >= v37;
          v22 -= v37;
          if (!v40) {
            goto LABEL_75;
          }
LABEL_69:
          v23 += v37;
          goto LABEL_70;
        }
LABEL_71:
        if ((unint64_t)&v23[-a6] <= *a8)
        {
          uint64_t result = 0;
          *a8 = (unint64_t)&v23[-a6];
          return result;
        }
LABEL_74:
        __break(0x5519u);
      }
      goto LABEL_73;
    }
LABEL_75:
    __break(0x5515u);
    return result;
  }
  return 7;
}

unint64_t sub_221268290(unint64_t result, unint64_t a2, int a3, uint64_t a4, void *a5)
{
  uint64_t v5 = 0;
  if (!a3)
  {
LABEL_38:
    uint64_t result = 0;
LABEL_40:
    *a5 = v5;
    return result;
  }
  unsigned int v6 = 0;
  unint64_t v7 = result + a2;
  while (24 * (unint64_t)v6 <= ~a4)
  {
    unint64_t v8 = *(void *)(a4 + 24 * v6);
    BOOL v9 = v8 > 0xFFFFFFFFFFFFFFEFLL || v8 + 16 > a2;
    if (v9)
    {
      uint64_t v5 = 0;
      uint64_t result = 7;
      goto LABEL_40;
    }
    if (v8 > ~result) {
      break;
    }
    unint64_t v10 = (unsigned __int8 **)(result + v8);
    __int16 v11 = *(_WORD *)(a4 + 24 * v6 + 16);
    if ((v11 & 0x200) == 0)
    {
      if (v11)
      {
        if ((unint64_t)v10 < result || (unint64_t)(v10 + 2) > v7) {
          goto LABEL_43;
        }
        if (!v10[1]) {
          goto LABEL_37;
        }
      }
      unint64_t v13 = *(void *)(a4 + 24 * v6 + 8) & 0x1FFFFFFFFFFFFFFFLL;
      uint64_t v14 = 1;
      if (v13 >= 0x1F)
      {
        do
        {
          ++v14;
          BOOL v9 = v13 > 0x7F;
          v13 >>= 7;
        }
        while (v9);
      }
      BOOL v15 = __CFADD__(v5, v14);
      uint64_t v16 = v5 + v14;
      if (v15) {
        goto LABEL_42;
      }
      if ((unint64_t)v10 < result || (unint64_t)(v10 + 2) > v7) {
        goto LABEL_43;
      }
      unint64_t v17 = (unint64_t)v10[1];
      if ((*(_WORD *)(a4 + 24 * v6 + 16) & 0x100) != 0)
      {
        if (v17)
        {
          v17 += (unint64_t)**v10 >> 7;
          goto LABEL_24;
        }
LABEL_25:
        uint64_t v18 = 1;
      }
      else
      {
LABEL_24:
        if (v17 < 0x80) {
          goto LABEL_25;
        }
        uint64_t v18 = 1;
        unint64_t v21 = v17;
        do
        {
          ++v18;
          BOOL v9 = v21 > 0xFF;
          v21 >>= 8;
        }
        while (v9);
      }
      BOOL v15 = __CFADD__(v16, v18);
      uint64_t v22 = v16 + v18;
      if (v15) {
        goto LABEL_42;
      }
      BOOL v15 = __CFADD__(v22, v17);
      uint64_t v5 = v22 + v17;
      if (v15) {
        goto LABEL_42;
      }
      goto LABEL_37;
    }
    if ((unint64_t)v10 < result || (unint64_t)(v10 + 2) > v7) {
      goto LABEL_43;
    }
    unint64_t v20 = v10[1];
    BOOL v15 = __CFADD__(v5, v20);
    v5 += (uint64_t)v20;
    if (v15) {
      goto LABEL_42;
    }
LABEL_37:
    if (++v6 == a3) {
      goto LABEL_38;
    }
  }
  __break(0x5513u);
LABEL_42:
  __break(0x5500u);
LABEL_43:
  __break(0x5519u);
  return result;
}

uint64_t sub_2212683FC(uint64_t result, unint64_t a2, unsigned int a3, uint64_t a4, unint64_t a5, unint64_t *a6)
{
  if ((a2 | 0x7FFFFFFFFFFFFFFFLL) >= a2) {
    return sub_221267EBC(result, a2, ~a2 & 0x7FFFFFFFFFFFFFFFLL, a3, a4, a5, *a6, a6);
  }
  __break(0x5519u);
  return result;
}

unint64_t sub_22126842C(uint64_t a1, unint64_t a2, unint64_t a3, int a4, uint64_t a5, uint64_t *a6)
{
  v17[1] = *MEMORY[0x263EF8340];
  v17[0] = 0;
  unint64_t result = sub_221268290(a2, a3, a4, a5, v17);
  if (!result)
  {
    unint64_t v9 = a1 & 0x1FFFFFFFFFFFFFFFLL;
    uint64_t v10 = 1;
    if ((a1 & 0x1FFFFFFFFFFFFFFFuLL) >= 0x1F)
    {
      do
      {
        ++v10;
        BOOL v11 = v9 > 0x7F;
        v9 >>= 7;
      }
      while (v11);
    }
    uint64_t v12 = 1;
    if (v17[0] >= 0x80uLL)
    {
      unint64_t v13 = v17[0];
      do
      {
        ++v12;
        BOOL v11 = v13 > 0xFF;
        v13 >>= 8;
      }
      while (v11);
    }
    BOOL v14 = __CFADD__(v10, v12);
    uint64_t v15 = v10 + v12;
    if (v14 || (BOOL v14 = __CFADD__(v15, v17[0]), v16 = v15 + v17[0], v14))
    {
      __break(0x5500u);
    }
    else
    {
      unint64_t result = 0;
      *a6 = v16;
    }
  }
  return result;
}

uint64_t sub_221268510(uint64_t a1, unint64_t a2, int a3, uint64_t a4)
{
  v5[1] = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if ((a2 | 0x7FFFFFFFFFFFFFFFLL) < a2) {
    __break(0x5519u);
  }
  if (sub_22126842C(a1, a2, ~a2 & 0x7FFFFFFFFFFFFFFFLL, a3, a4, v5)) {
    return 0;
  }
  else {
    return v5[0];
  }
}

BOOL sub_221268590(uint64_t a1, uint64_t a2)
{
  BOOL result = 0;
  if (a1 && a2)
  {
    size_t v4 = *(void *)(a1 + 8);
    return v4 == *(void *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, v4) == 0;
  }
  return result;
}

uint64_t sub_2212685E4(uint64_t a1, unint64_t a2)
{
  return a1;
}

uint64_t sub_221268614(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return a3;
}

uint64_t sub_22126861C()
{
  return 0;
}

uint64_t sub_22126862C(uint64_t a1, unint64_t a2, char a3)
{
  sub_22125D79C(&qword_267F49160);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_221280F10;
  *(unsigned char *)(v6 + 32) = a3;
  uint64_t v7 = sub_22126A180(v6);
  unint64_t v9 = v8;
  swift_bridgeObjectRelease();
  sub_22125D744(a1, a2);
  sub_22125D744(v7, v9);
  sub_2212690F4(a1, a2);
  sub_22125C910(a1, a2);
  sub_22125C910(v7, v9);
  return v7;
}

uint64_t sub_2212686F4(uint64_t a1, unint64_t a2)
{
  v28[5] = *MEMORY[0x263EF8340];
  v28[3] = MEMORY[0x263F06F78];
  v28[4] = MEMORY[0x263F06F68];
  v28[0] = a1;
  v28[1] = a2;
  size_t v4 = sub_22126A4B8(v28, MEMORY[0x263F06F78]);
  uint64_t v5 = *v4;
  unint64_t v6 = v4[1];
  switch(v6 >> 62)
  {
    case 1uLL:
      if (v5 >> 32 < (int)v5)
      {
        __break(1u);
LABEL_29:
        __break(1u);
LABEL_30:
        __break(1u);
        goto LABEL_31;
      }
      sub_22125D744(a1, a2);
      sub_22125D744(v5, v6);
      unint64_t v8 = (unsigned char *)sub_22127D6E8();
      if (v8)
      {
        uint64_t v9 = sub_22127D718();
        if (!__OFSUB__((int)v5, v9))
        {
          v8 += (int)v5 - v9;
          goto LABEL_7;
        }
LABEL_31:
        __break(1u);
      }
LABEL_7:
      uint64_t v10 = sub_22127D708();
      if (v10 >= (v5 >> 32) - (int)v5) {
        uint64_t v11 = (v5 >> 32) - (int)v5;
      }
      else {
        uint64_t v11 = v10;
      }
      uint64_t v12 = &v8[v11];
      if (v8) {
        unint64_t v13 = v12;
      }
      else {
        unint64_t v13 = 0;
      }
      sub_22127B034(v8, v13, &v27);
      sub_22125C910(v5, v6);
LABEL_27:
      sub_22125C910(a1, a2);
      uint64_t v24 = v27;
      sub_22125DE98((uint64_t)v28);
      return v24;
    case 2uLL:
      uint64_t v14 = *(void *)(v5 + 16);
      uint64_t v15 = *(void *)(v5 + 24);
      sub_22125D744(a1, a2);
      swift_retain();
      swift_retain();
      uint64_t v16 = (unsigned char *)sub_22127D6E8();
      if (!v16) {
        goto LABEL_17;
      }
      uint64_t v17 = sub_22127D718();
      if (__OFSUB__(v14, v17)) {
        goto LABEL_30;
      }
      v16 += v14 - v17;
LABEL_17:
      BOOL v18 = __OFSUB__(v15, v14);
      uint64_t v19 = v15 - v14;
      if (v18) {
        goto LABEL_29;
      }
      uint64_t v20 = sub_22127D708();
      if (v20 >= v19) {
        uint64_t v21 = v19;
      }
      else {
        uint64_t v21 = v20;
      }
      uint64_t v22 = &v16[v21];
      if (v16) {
        uint64_t v23 = v22;
      }
      else {
        uint64_t v23 = 0;
      }
      sub_22127B034(v16, v23, &v27);
      swift_release();
      swift_release();
      goto LABEL_27;
    case 3uLL:
      memset(v26, 0, 14);
      sub_22125D744(a1, a2);
      uint64_t v7 = v26;
      goto LABEL_26;
    default:
      v26[0] = *v4;
      LOWORD(v26[1]) = v6;
      BYTE2(v26[1]) = BYTE2(v6);
      BYTE3(v26[1]) = BYTE3(v6);
      BYTE4(v26[1]) = BYTE4(v6);
      BYTE5(v26[1]) = BYTE5(v6);
      sub_22125D744(a1, a2);
      uint64_t v7 = (char *)v26 + BYTE6(v6);
LABEL_26:
      sub_22127B034(v26, v7, &v27);
      goto LABEL_27;
  }
}

uint64_t sub_2212689A8(uint64_t a1, uint64_t a2)
{
  unint64_t v8[3] = MEMORY[0x263F8D3E8];
  unint64_t v8[4] = MEMORY[0x263F07B80];
  v8[0] = a1;
  v8[1] = a2;
  unint64_t v2 = sub_22126A4B8(v8, MEMORY[0x263F8D3E8]);
  unint64_t v3 = (unsigned char *)*v2;
  if (*v2 && (v4 = (unsigned char *)v2[1], uint64_t v5 = v4 - v3, v4 != v3))
  {
    if (v5 <= 14)
    {
      uint64_t v6 = sub_22127B158(v3, v4);
    }
    else if ((unint64_t)v5 >= 0x7FFFFFFF)
    {
      uint64_t v6 = sub_22127B21C((uint64_t)v3, (uint64_t)v4);
    }
    else
    {
      uint64_t v6 = sub_22127B298((uint64_t)v3, (uint64_t)v4);
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  sub_22125DE98((uint64_t)v8);
  return v6;
}

uint64_t sub_221268A64(uint64_t a1)
{
  v22[5] = *MEMORY[0x263EF8340];
  *(void *)&long long v19 = a1;
  swift_bridgeObjectRetain();
  sub_22125D79C(&qword_267F492C8);
  sub_22125D79C(&qword_267F492D0);
  if (!swift_dynamicCast())
  {
    uint64_t v21 = 0;
    memset(v20, 0, sizeof(v20));
    sub_22126A6C0((uint64_t)v20, &qword_267F492D8);
    *(void *)&v20[0] = sub_221260318(*(void *)(a1 + 16));
    *((void *)&v20[0] + 1) = v1;
    MEMORY[0x270FA5388](v2, v3);
    size_t v4 = sub_22126971C((void *(*)(uint64_t *__return_ptr, char *, char *))sub_22126A5A4);
    uint64_t v7 = *((void *)&v20[0] + 1) >> 62;
    unint64_t v8 = v4;
    uint64_t v9 = v5;
    switch(*((void *)&v20[0] + 1) >> 62)
    {
      case 1:
        LODWORD(v10) = DWORD1(v20[0]) - LODWORD(v20[0]);
        if (__OFSUB__(DWORD1(v20[0]), v20[0])) {
          goto LABEL_37;
        }
        uint64_t v10 = (int)v10;
LABEL_8:
        if (v6 == v10)
        {
LABEL_14:
          memset(v22, 0, 15);
          if (!v5)
          {
LABEL_29:
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            return *(void *)&v20[0];
          }
          if (!__OFSUB__(v5, 1))
          {
            if (v5 - 1 < 0)
            {
LABEL_31:
              __break(1u);
            }
            else
            {
              LOBYTE(v15) = 0;
              while (1)
              {
                uint64_t v16 = v9 - 1;
                if ((unint64_t)(v9 - 1) >= *((void *)v8 + 2)) {
                  break;
                }
                *((unsigned char *)v22 + v15) = v8[v9 + 31];
                __int16 v15 = v15 + 1;
                if ((v15 & 0x100) != 0) {
                  goto LABEL_33;
                }
                if (v15 == 14)
                {
                  sub_22127D858();
                  if (v9 == 1) {
                    goto LABEL_29;
                  }
                  LOBYTE(v15) = 0;
                }
                else if (v9 == 1)
                {
                  goto LABEL_34;
                }
                --v9;
                if (v16 < 1) {
                  goto LABEL_31;
                }
              }
            }
            __break(1u);
LABEL_33:
            __break(1u);
LABEL_34:
            sub_22127D858();
            goto LABEL_29;
          }
        }
        else
        {
          if (v7)
          {
            if (v7 == 1) {
              uint64_t v14 = *(uint64_t *)&v20[0] >> 32;
            }
            else {
              uint64_t v14 = *(void *)(*(void *)&v20[0] + 24);
            }
          }
          else
          {
            uint64_t v14 = BYTE14(v20[0]);
          }
LABEL_27:
          if (v14 >= v6)
          {
            sub_22127D848();
            goto LABEL_29;
          }
          __break(1u);
        }
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
        return result;
      case 2:
        uint64_t v12 = *(void *)(*(void *)&v20[0] + 16);
        uint64_t v11 = *(void *)(*(void *)&v20[0] + 24);
        BOOL v13 = __OFSUB__(v11, v12);
        uint64_t v10 = v11 - v12;
        if (!v13) {
          goto LABEL_8;
        }
        goto LABEL_38;
      case 3:
        if (!v6) {
          goto LABEL_14;
        }
        uint64_t v14 = 0;
        goto LABEL_27;
      default:
        uint64_t v10 = BYTE14(v20[0]);
        goto LABEL_8;
    }
  }
  sub_22126A4A0(v20, (uint64_t)v22);
  sub_22126A4B8(v22, v22[3]);
  sub_22127D748();
  swift_bridgeObjectRelease();
  v20[0] = v19;
  sub_22125DE98((uint64_t)v22);
  return *(void *)&v20[0];
}

BOOL sub_221268DBC(uint64_t a1, uint64_t a2)
{
  return sub_22126A018(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16), *(void *)a2, *(void *)(a2 + 8), *(unsigned char *)(a2 + 16));
}

unint64_t sub_221268DD8(uint64_t a1)
{
  uint64_t v2 = sub_22125D79C(&qword_267F492B8);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(a1 + 16))
  {
    uint64_t v7 = (void *)MEMORY[0x263F8EE80];
    goto LABEL_9;
  }
  sub_22125D79C(&qword_267F492C0);
  uint64_t v6 = sub_22127DF38();
  uint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  uint64_t v9 = &v5[*(int *)(v2 + 48)];
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v22[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_22126A3FC(v12, (uint64_t)v5);
    unint64_t result = sub_221269B40((uint64_t)v5);
    if (v15) {
      break;
    }
    unint64_t v16 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v17 = v7[6];
    uint64_t v18 = sub_22127DED8();
    (*(void (**)(unint64_t, char *, uint64_t))(*(void *)(v18 - 8) + 32))(v17 + *(void *)(*(void *)(v18 - 8) + 72) * v16, v5, v18);
    unint64_t result = (unint64_t)sub_22125C968(v9, (_OWORD *)(v7[7] + 32 * v16));
    uint64_t v19 = v7[2];
    BOOL v20 = __OFADD__(v19, 1);
    uint64_t v21 = v19 + 1;
    if (v20) {
      goto LABEL_11;
    }
    v7[2] = v21;
    v12 += v13;
    if (!--v8)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_221268FCC()
{
  return 0;
}

uint64_t sub_221268FD4()
{
  return 1;
}

uint64_t sub_221268FDC()
{
  return 2;
}

uint64_t sub_221268FE4()
{
  return 3;
}

uint64_t sub_221268FEC()
{
  return 4;
}

uint64_t sub_221268FF4()
{
  return 6;
}

uint64_t sub_221268FFC()
{
  return 12;
}

uint64_t sub_221269004()
{
  return 5;
}

uint64_t sub_22126900C()
{
  return sub_22127DE48();
}

unint64_t sub_2212690E8()
{
  return sub_221268DD8(MEMORY[0x263F8EE78]);
}

uint64_t sub_2212690F4(uint64_t a1, unint64_t a2)
{
  void v10[5] = *MEMORY[0x263EF8340];
  void v10[3] = MEMORY[0x263F06F78];
  v10[4] = MEMORY[0x263F06F68];
  v10[0] = a1;
  v10[1] = a2;
  uint64_t v4 = sub_22126A4B8(v10, MEMORY[0x263F06F78]);
  uint64_t v5 = *v4;
  unint64_t v6 = v4[1];
  switch(v6 >> 62)
  {
    case 1uLL:
      if (v5 >> 32 < (int)v5) {
        __break(1u);
      }
      sub_22125D744(a1, a2);
      sub_22125D744(v5, v6);
      sub_221269D3C((int)v5, v5 >> 32);
      sub_22125C910(v5, v6);
      break;
    case 2uLL:
      uint64_t v7 = *(void *)(v5 + 16);
      uint64_t v8 = *(void *)(v5 + 24);
      sub_22125D744(a1, a2);
      swift_retain();
      swift_retain();
      sub_221269D3C(v7, v8);
      swift_release();
      swift_release();
      break;
    default:
      sub_22125D744(a1, a2);
      sub_22127D858();
      break;
  }
  return sub_22125DE98((uint64_t)v10);
}

uint64_t sub_221269318(uint64_t a1)
{
  v30[5] = *MEMORY[0x263EF8340];
  swift_bridgeObjectRetain();
  sub_22125D79C(&qword_267F492C8);
  sub_22125D79C(&qword_267F492D0);
  if (swift_dynamicCast())
  {
    sub_22126A4A0(v28, (uint64_t)v30);
    sub_22126A4B8(v30, v30[3]);
    MEMORY[0x270FA5388](v2, v3);
    sub_22127D748();
    return sub_22125DE98((uint64_t)v30);
  }
  uint64_t v29 = 0;
  memset(v28, 0, sizeof(v28));
  sub_22126A6C0((uint64_t)v28, &qword_267F492D8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v6 = *v1;
  unint64_t v7 = v1[1];
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  switch(v7 >> 62)
  {
    case 1uLL:
      if (__OFSUB__(HIDWORD(v6), v6)) {
        goto LABEL_47;
      }
      uint64_t v9 = HIDWORD(v6) - (int)v6;
      uint64_t v8 = v6 >> 32;
LABEL_8:
      if (__OFADD__(v8, v5))
      {
        __break(1u);
        goto LABEL_41;
      }
      if (v8 + v5 < v8)
      {
LABEL_41:
        __break(1u);
        goto LABEL_42;
      }
      if (v8 < 0)
      {
LABEL_42:
        __break(1u);
LABEL_43:
        __break(1u);
LABEL_44:
        __break(1u);
        goto LABEL_45;
      }
      sub_22127D838();
      MEMORY[0x270FA5388](v12, v13);
      uint64_t v14 = (uint64_t)sub_22126971C((void *(*)(uint64_t *__return_ptr, char *, char *))sub_22126A464);
      uint64_t v18 = v14;
      if (v16 != v5)
      {
        uint64_t v17 = *v1;
        unint64_t v22 = v1[1];
        uint64_t v23 = 0;
        switch(v22 >> 62)
        {
          case 1uLL:
            uint64_t v23 = (int)v17;
            break;
          case 2uLL:
            uint64_t v23 = *(void *)(v17 + 16);
            break;
          default:
            break;
        }
        BOOL v24 = __OFADD__(v23, v9);
        uint64_t v25 = v23 + v9;
        if (!v24)
        {
          uint64_t v14 = v25 + v16;
          if (!__OFADD__(v25, v16))
          {
            uint64_t v26 = 0;
            switch(v22 >> 62)
            {
              case 1uLL:
                goto LABEL_32;
              case 2uLL:
                uint64_t v26 = *(void *)(v17 + 24);
                break;
              case 3uLL:
                goto LABEL_34;
              default:
                uint64_t v26 = BYTE6(v22);
                break;
            }
            goto LABEL_34;
          }
LABEL_45:
          __break(1u);
          goto LABEL_46;
        }
        goto LABEL_43;
      }
      uint64_t v19 = v15;
      memset(v30, 0, 15);
      if (v15)
      {
        if (!__OFSUB__(v15, 1))
        {
          if (((v15 - 1) & 0x8000000000000000) == 0)
          {
            LOBYTE(v20) = 0;
            while (1)
            {
              uint64_t v21 = v19 - 1;
              uint64_t v17 = *(void *)(v18 + 16);
              if (v19 - 1 >= (unint64_t)v17) {
                goto LABEL_31;
              }
              *((unsigned char *)v30 + v20) = *(unsigned char *)(v18 + v19 + 31);
              __int16 v20 = v20 + 1;
              if ((v20 & 0x100) != 0) {
                break;
              }
              uint64_t v17 = v20;
              if (v20 == 14)
              {
                *(void *)&v28[0] = v30[0];
                DWORD2(v28[0]) = v30[1];
                WORD6(v28[0]) = WORD2(v30[1]);
                uint64_t v14 = sub_22127D858();
                if (v19 == 1) {
                  return swift_bridgeObjectRelease();
                }
                LOBYTE(v20) = 0;
              }
              else if (v19 == 1)
              {
                goto LABEL_39;
              }
              --v19;
              if (v21 < 1) {
                goto LABEL_30;
              }
            }
            __break(1u);
LABEL_39:
            *(void *)&v28[0] = v30[0];
            DWORD2(v28[0]) = v30[1];
            WORD6(v28[0]) = WORD2(v30[1]);
            sub_22127D858();
            return swift_bridgeObjectRelease();
          }
LABEL_30:
          __break(1u);
LABEL_31:
          __break(1u);
LABEL_32:
          uint64_t v26 = v17 >> 32;
LABEL_34:
          if (v26 >= v14)
          {
            sub_22127D848();
            return swift_bridgeObjectRelease();
          }
LABEL_46:
          __break(1u);
LABEL_47:
          __break(1u);
LABEL_48:
          __break(1u);
        }
        goto LABEL_44;
      }
      return swift_bridgeObjectRelease();
    case 2uLL:
      uint64_t v11 = v6 + 16;
      uint64_t v10 = *(void *)(v6 + 16);
      uint64_t v8 = *(void *)(v11 + 8);
      uint64_t v9 = v8 - v10;
      if (!__OFSUB__(v8, v10)) {
        goto LABEL_8;
      }
      goto LABEL_48;
    case 3uLL:
      goto LABEL_8;
    default:
      uint64_t v8 = BYTE6(v7);
      uint64_t v9 = BYTE6(v7);
      goto LABEL_8;
  }
}

char *sub_22126971C(void *(*a1)(uint64_t *__return_ptr, char *, char *))
{
  v16[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = *v1;
  unint64_t v3 = v1[1];
  uint64_t v5 = v1;
  switch(v3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)uint64_t v1 = xmmword_2212811B0;
      char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      uint64_t v11 = v4 >> 32;
      if (isUniquelyReferenced_nonNull_native) {
        goto LABEL_16;
      }
      if (v11 < (int)v4) {
        goto LABEL_23;
      }
      if (sub_22127D6E8() && __OFSUB__((int)v4, sub_22127D718())) {
        goto LABEL_24;
      }
      sub_22127D738();
      swift_allocObject();
      uint64_t v13 = sub_22127D6C8();
      swift_release();
      uint64_t v9 = v13;
      uint64_t v11 = v4 >> 32;
LABEL_16:
      if (v11 < (int)v4)
      {
        __break(1u);
LABEL_23:
        __break(1u);
LABEL_24:
        __break(1u);
      }
      unint64_t result = sub_221269A8C((int)v4, v11, a1);
      unint64_t v12 = v9 | 0x4000000000000000;
      if (v2)
      {
        *uint64_t v5 = v4;
        goto LABEL_19;
      }
      *uint64_t v5 = v4;
      v5[1] = v12;
      break;
    case 2uLL:
      uint64_t v14 = *v1;
      uint64_t v15 = v3 & 0x3FFFFFFFFFFFFFFFLL;
      sub_22127D7F8();
      unint64_t result = sub_221269A8C(*(void *)(v14 + 16), *(void *)(v14 + 24), a1);
      unint64_t v12 = v15 | 0x8000000000000000;
      if (v2)
      {
        *uint64_t v1 = v14;
LABEL_19:
        v5[1] = v12;
      }
      else
      {
        *uint64_t v1 = v14;
        v1[1] = v12;
      }
      break;
    case 3uLL:
      memset(v16, 0, 15);
      unint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16);
      if (!v2) {
        return (char *)v14;
      }
      return result;
    default:
      v16[0] = *v1;
      LOWORD(v16[1]) = v3;
      BYTE2(v16[1]) = BYTE2(v3);
      BYTE3(v16[1]) = BYTE3(v3);
      BYTE4(v16[1]) = BYTE4(v3);
      BYTE5(v16[1]) = BYTE5(v3);
      BYTE6(v16[1]) = BYTE6(v3);
      unint64_t result = (char *)a1(&v14, (char *)v16, (char *)v16 + BYTE6(v3));
      if (!v2) {
        unint64_t result = (char *)v14;
      }
      unint64_t v8 = LODWORD(v16[1]) | ((unint64_t)BYTE4(v16[1]) << 32) | ((unint64_t)BYTE5(v16[1]) << 40) | ((unint64_t)BYTE6(v16[1]) << 48);
      *uint64_t v1 = v16[0];
      v1[1] = v8;
      return result;
  }
  return result;
}

void *sub_221269A1C(void *(*a1)(uint64_t *__return_ptr, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3)
  {
    unint64_t result = a1(&v6, a3, a4 - a3);
    if (v4) {
      return result;
    }
    return (void *)v6;
  }
  unint64_t result = a1(&v6, 0, 0);
  if (!v4) {
    return (void *)v6;
  }
  return result;
}

char *sub_221269A8C(uint64_t a1, uint64_t a2, void *(*a3)(uint64_t *__return_ptr, char *, char *))
{
  unint64_t result = (char *)sub_22127D6E8();
  if (!result) {
    goto LABEL_12;
  }
  unint64_t v8 = result;
  unint64_t result = (char *)sub_22127D718();
  uint64_t v9 = a1 - (void)result;
  if (__OFSUB__(a1, result))
  {
    __break(1u);
    goto LABEL_11;
  }
  BOOL v10 = __OFSUB__(a2, a1);
  uint64_t v11 = a2 - a1;
  if (v10)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  uint64_t v12 = sub_22127D708();
  if (v12 >= v11) {
    uint64_t v13 = v11;
  }
  else {
    uint64_t v13 = v12;
  }
  unint64_t result = (char *)a3(&v14, &v8[v9], &v8[v9 + v13]);
  if (!v3) {
    return (char *)v14;
  }
  return result;
}

unint64_t sub_221269B40(uint64_t a1)
{
  sub_22127DED8();
  uint64_t v2 = sub_22127D9F8();
  return sub_221269BA4(a1, v2);
}

unint64_t sub_221269BA4(uint64_t a1, uint64_t a2)
{
  uint64_t v21 = a1;
  uint64_t v4 = sub_22127DED8();
  MEMORY[0x270FA5388]();
  unint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = v2;
  uint64_t v8 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v9 = a2 & ~v8;
  uint64_t v20 = v2 + 64;
  if ((*(void *)(v2 + 64 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    uint64_t v10 = ~v8;
    uint64_t v13 = *(void (**)(char *, unint64_t, uint64_t))(v5 + 16);
    uint64_t v11 = v5 + 16;
    uint64_t v12 = v13;
    uint64_t v14 = *(void *)(v11 + 56);
    uint64_t v15 = (void (**)(char *, uint64_t))(v11 - 8);
    do
    {
      uint64_t v16 = v11;
      v12(v7, *(void *)(v22 + 48) + v14 * v9, v4);
      char v17 = sub_22127DA68();
      (*v15)(v7, v4);
      if (v17) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v10;
      uint64_t v11 = v16;
    }
    while (((*(void *)(v20 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  return v9;
}

uint64_t sub_221269D3C(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_22127D6E8();
  if (!result || (uint64_t result = sub_22127D718(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_22127D708();
      return sub_22127D858();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

void *sub_221269DD0(void *result, unsigned char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = *(void *)(a4 + 16);
  if (!a2)
  {
    unint64_t v5 = *(void *)(a4 + 16);
    uint64_t v4 = 0;
LABEL_30:
    *uint64_t result = a4;
    result[1] = v5;
    return (void *)v4;
  }
  if (!a3)
  {
    unint64_t v5 = *(void *)(a4 + 16);
LABEL_29:
    uint64_t v4 = a3;
    goto LABEL_30;
  }
  if ((a3 & 0x8000000000000000) == 0)
  {
    if (!v4)
    {
LABEL_31:
      unint64_t v5 = 0;
      goto LABEL_30;
    }
    unint64_t v5 = v4 - 1;
    *a2 = *(unsigned char *)(a4 + v4 - 1 + 32);
    unint64_t v6 = a3 - 1;
    if (a3 != 1)
    {
      unint64_t v7 = a3 - 2;
      if (a3 - 2 >= v5) {
        unint64_t v8 = v4 - 1;
      }
      else {
        unint64_t v8 = a3 - 2;
      }
      if (v8 >= v6) {
        unint64_t v8 = a3 - 1;
      }
      unint64_t v9 = v8 + 1;
      if (v9 <= 0x10) {
        goto LABEL_18;
      }
      uint64_t v10 = (int8x16_t *)(a2 + 1);
      if (v7 >= v5) {
        unint64_t v7 = v4 - 1;
      }
      if (v7 < v6) {
        unint64_t v6 = v7;
      }
      if ((unint64_t)v10 >= v4 + a4 + 31 || v4 - v6 + a4 + 30 >= (unint64_t)&a2[v6 + 2])
      {
        uint64_t v12 = v9 & 0xF;
        if ((v9 & 0xF) == 0) {
          uint64_t v12 = 16;
        }
        unint64_t v13 = v9 - v12;
        uint64_t v11 = v13 + 1;
        v5 -= v13;
        a2 += v13;
        uint64_t v14 = (int8x16_t *)(v4 + a4 + 15);
        do
        {
          int8x16_t v15 = *v14--;
          int8x16_t v16 = vrev64q_s8(v15);
          *v10++ = vextq_s8(v16, v16, 8uLL);
          v13 -= 16;
        }
        while (v13);
      }
      else
      {
LABEL_18:
        uint64_t v11 = 1;
      }
      char v17 = a2 + 1;
      unint64_t v18 = v5;
      while (a3 != v11)
      {
        if (!v18) {
          goto LABEL_31;
        }
        ++v11;
        unint64_t v5 = v18 - 1;
        *v17++ = *(unsigned char *)(a4 + 31 + v18--);
        if (a3 == v11) {
          goto LABEL_29;
        }
      }
      __break(1u);
      goto LABEL_33;
    }
    goto LABEL_29;
  }
LABEL_33:
  __break(1u);
  return result;
}

uint64_t sub_221269F04(uint64_t a1, unint64_t a2)
{
  sub_22125D744(a1, a2);
  __int16 v4 = sub_22126B5E8(a1, a2);
  sub_22125C910(a1, a2);
  if ((v4 & 0x100) != 0)
  {
    uint64_t result = a1;
    unint64_t v6 = a2;
  }
  else
  {
    sub_221274F04(1, a1, a2, &v10);
    uint64_t result = v10;
    unint64_t v6 = v11;
    if (v4 <= 7u)
    {
      switch(v11 >> 62)
      {
        case 1uLL:
          uint64_t v7 = (int)v10;
          uint64_t v8 = v10 >> 32;
          goto LABEL_12;
        case 2uLL:
          uint64_t v7 = *(void *)(v10 + 16);
          uint64_t v8 = *(void *)(v10 + 24);
LABEL_12:
          if (v7 == v8 && v4 != 0) {
            break;
          }
          return result;
        case 3uLL:
          if ((_BYTE)v4) {
            break;
          }
          return result;
        default:
          if ((v11 & 0xFF000000000000) == 0 && (_BYTE)v4) {
            break;
          }
          return result;
      }
    }
  }
  sub_22125C910(result, v6);
  return 0;
}

BOOL sub_22126A018(uint64_t a1, unint64_t a2, char a3, uint64_t a4, unint64_t a5, char a6)
{
  uint64_t v12 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v12) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_18:
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        __break(1u);
        JUMPOUT(0x22126A160);
      }
      uint64_t v12 = (int)v12;
LABEL_6:
      switch(a5 >> 62)
      {
        case 1uLL:
          LODWORD(v16) = HIDWORD(a4) - a4;
          if (__OFSUB__(HIDWORD(a4), a4)) {
            goto LABEL_19;
          }
          uint64_t v16 = (int)v16;
LABEL_11:
          if (v12 == v16 && (v12 < 1 || (sub_22125D744(a4, a5), (sub_221272A90(a1, a2, a4, a5) & 1) != 0))) {
            return a3 == a6;
          }
          else {
            return 0;
          }
        case 2uLL:
          uint64_t v18 = *(void *)(a4 + 16);
          uint64_t v17 = *(void *)(a4 + 24);
          BOOL v15 = __OFSUB__(v17, v18);
          uint64_t v16 = v17 - v18;
          if (!v15) {
            goto LABEL_11;
          }
          goto LABEL_20;
        case 3uLL:
          if (v12) {
            return 0;
          }
          return a3 == a6;
        default:
          uint64_t v16 = BYTE6(a5);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v14 = *(void *)(a1 + 16);
      uint64_t v13 = *(void *)(a1 + 24);
      BOOL v15 = __OFSUB__(v13, v14);
      uint64_t v12 = v13 - v14;
      if (!v15) {
        goto LABEL_6;
      }
      goto LABEL_18;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v12 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_22126A180(uint64_t a1)
{
  uint64_t v9 = sub_22125D79C(&qword_267F492E8);
  uint64_t v10 = sub_22126A71C(&qword_267F492F0, &qword_267F492E8);
  v8[0] = a1;
  uint64_t v2 = sub_22126A4B8(v8, v9);
  uint64_t v3 = (unsigned char *)(*v2 + 32);
  __int16 v4 = &v3[*(void *)(*v2 + 16)];
  swift_bridgeObjectRetain();
  sub_22127B034(v3, v4, &v7);
  uint64_t v5 = v7;
  sub_22125DE98((uint64_t)v8);
  return v5;
}

uint64_t destroy for BitString(uint64_t a1)
{
  return sub_22125C910(*(void *)a1, *(void *)(a1 + 8));
}

uint64_t _s7SPRBase9BitStringVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  unint64_t v5 = *(void *)(a2 + 8);
  sub_22125D744(*(void *)a2, v5);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t assignWithCopy for BitString(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a2;
  unint64_t v5 = *(void *)(a2 + 8);
  sub_22125D744(*(void *)a2, v5);
  uint64_t v6 = *(void *)a1;
  unint64_t v7 = *(void *)(a1 + 8);
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = v5;
  sub_22125C910(v6, v7);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

__n128 initializeWithTake for BitString(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for BitString(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)a1;
  unint64_t v5 = *(void *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_22125C910(v4, v5);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for BitString(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xD && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 13);
  }
  unsigned int v3 = (((*(void *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(void *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for BitString(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 13;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xD) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2)
    {
      *(void *)__n128 result = 0;
      *(void *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BitString()
{
  return &type metadata for BitString;
}

uint64_t sub_22126A3FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22125D79C(&qword_267F492B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_22126A464@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t result = sub_22126A518(a1, a2, *(void *)(v3 + 16), **(void **)(v3 + 32));
  if (!v4)
  {
    *a3 = result;
    a3[1] = v7;
    a3[2] = v8;
  }
  return result;
}

uint64_t sub_22126A4A0(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

void *sub_22126A4B8(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_22126A4FC()
{
  return sub_2212781F8();
}

uint64_t sub_22126A518(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!result)
  {
    uint64_t v4 = a4;
    goto LABEL_5;
  }
  if (!__OFSUB__(a2 - result, a3))
  {
    sub_221269DD0(&v5, (unsigned char *)(result + a3), a2 - result - a3, a4);
    uint64_t v4 = v5;
LABEL_5:
    swift_bridgeObjectRetain();
    return v4;
  }
  __break(1u);
  return result;
}

void *sub_22126A5A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v9 = **(void **)(v3 + 16);
  v8[2] = &v9;
  uint64_t result = sub_221269A1C((void *(*)(uint64_t *__return_ptr, uint64_t, uint64_t))sub_22126A610, (uint64_t)v8, a1, a2);
  *a3 = result;
  a3[1] = v6;
  a3[2] = v7;
  return result;
}

uint64_t sub_22126A610@<X0>(unsigned char *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  uint64_t v5 = sub_221269DD0(v8, a1, a2, **(void **)(v3 + 16));
  uint64_t v6 = v8[1];
  *a3 = v8[0];
  a3[1] = v6;
  a3[2] = v5;
  return swift_bridgeObjectRetain();
}

uint64_t sub_22126A678(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_22126A6C0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_22125D79C(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_22126A71C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_22126045C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_22126A764()
{
  off_267F492F8 = &unk_26D31D1C0;
}

uint64_t sub_22126A778(uint64_t a1, unint64_t a2)
{
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v2) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_9;
      }
      uint64_t v2 = (int)v2;
LABEL_6:
      if (v2 + 0x4000000000000000 < 0)
      {
        __break(1u);
LABEL_9:
        __break(1u);
LABEL_10:
        __break(1u);
        JUMPOUT(0x22126A84CLL);
      }
LABEL_7:
      MEMORY[0x270FA5388]();
      return sub_22127DB18();
    case 2uLL:
      uint64_t v4 = *(void *)(a1 + 16);
      uint64_t v3 = *(void *)(a1 + 24);
      BOOL v5 = __OFSUB__(v3, v4);
      uint64_t v2 = v3 - v4;
      if (!v5) {
        goto LABEL_6;
      }
      goto LABEL_10;
    case 3uLL:
      goto LABEL_7;
    default:
      uint64_t v2 = BYTE6(a2);
      goto LABEL_6;
  }
}

uint64_t sub_22126A85C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v7 = sub_22127D918();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  switch(a4 >> 62)
  {
    case 1uLL:
    case 2uLL:
      sub_22125D744(a3, a4);
      break;
    default:
      break;
  }
  sub_22127D928();
  uint64_t v11 = 0;
  while (1)
  {
    __int16 v12 = sub_22127D908();
    if ((v12 & 0x100) != 0) {
      break;
    }
    unsigned __int8 v13 = v12;
    if (qword_267F49248 != -1) {
      swift_once();
    }
    unint64_t v14 = v13 >> 4;
    unint64_t v15 = *((void *)off_267F492F8 + 2);
    if (v15 <= v14)
    {
      __break(1u);
LABEL_14:
      __break(1u);
LABEL_15:
      __break(1u);
      JUMPOUT(0x22126AA30);
    }
    uint64_t v16 = (char *)off_267F492F8 + 32;
    *(unsigned char *)(a1 + v11) = *((unsigned char *)off_267F492F8 + v14 + 32);
    if (v15 <= (v13 & 0xFu)) {
      goto LABEL_14;
    }
    *(unsigned char *)(a1 + v11 + 1) = v16[v13 & 0xF];
    BOOL v17 = __OFADD__(v11, 2);
    v11 += 2;
    if (v17) {
      goto LABEL_15;
    }
  }
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v11;
}

char *sub_22126AA40(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_22127D918();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v7 = &v16[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  switch(a2 >> 62)
  {
    case 1uLL:
    case 2uLL:
      sub_22125D744(a1, a2);
      sub_22125D744(a1, a2);
      break;
    default:
      break;
  }
  sub_22127D928();
  sub_22125C910(a1, a2);
  sub_22126B534();
  sub_22127DD98();
  if (v17)
  {
    uint64_t v8 = (char *)MEMORY[0x263F8EE78];
  }
  else
  {
    uint64_t v8 = (char *)MEMORY[0x263F8EE78];
    do
    {
      unsigned int v10 = v16[14];
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v8 = sub_22126AEB4(0, *((void *)v8 + 2) + 1, 1, v8);
      }
      unint64_t v12 = *((void *)v8 + 2);
      unint64_t v11 = *((void *)v8 + 3);
      int64_t v13 = v11 >> 1;
      unint64_t v14 = v12 + 1;
      if (v11 >> 1 <= v12)
      {
        uint64_t v8 = sub_22126AEB4((char *)(v11 > 1), v12 + 1, 1, v8);
        unint64_t v11 = *((void *)v8 + 3);
        int64_t v13 = v11 >> 1;
      }
      *((void *)v8 + 2) = v14;
      v8[v12 + 32] = v10 >> 4;
      int64_t v15 = v12 + 2;
      if (v13 < v15) {
        uint64_t v8 = sub_22126AEB4((char *)(v11 > 1), v15, 1, v8);
      }
      *((void *)v8 + 2) = v15;
      v8[v14 + 32] = v10 & 0xF;
      sub_22127DD98();
    }
    while (v17 != 1);
  }
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
  return v8;
}

uint64_t sub_22126AC9C(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 < 2)
  {
    uint64_t v13 = 0;
    unint64_t v14 = 0xC000000000000000;
    if (!v2) {
      goto LABEL_16;
    }
LABEL_10:
    if (v2 != 1) {
      goto LABEL_11;
    }
    goto LABEL_16;
  }
  if (v2 <= 0x1D)
  {
    uint64_t v13 = 0;
    unint64_t v14 = 0;
LABEL_11:
    uint64_t v6 = 32;
    unint64_t v7 = v2;
    while (v6 - 31 < v7)
    {
      char v9 = *(unsigned char *)(a1 + v6 + 1) | (16 * *(unsigned char *)(a1 + v6));
      uint64_t v10 = sub_22125D79C(&qword_267F49300);
      uint64_t v12[3] = v10;
      unint64_t v12[4] = sub_22126B58C();
      LOBYTE(v12[0]) = v9;
      sub_22126A4B8(v12, v10);
      sub_22127D848();
      sub_22125DE98((uint64_t)v12);
      uint64_t v8 = v6 - 31;
      if (v6 - 30 == v2) {
        goto LABEL_16;
      }
      unint64_t v7 = *(void *)(a1 + 16);
      if (v6 - 30 >= v7) {
        goto LABEL_18;
      }
      v6 += 2;
      if (v8 + 2 == v2) {
        goto LABEL_16;
      }
    }
    __break(1u);
LABEL_18:
    __break(1u);
  }
  sub_22127D738();
  swift_allocObject();
  uint64_t v3 = sub_22127D728();
  if (v2 > 0xFFFFFFFD)
  {
    sub_22127D828();
    uint64_t v4 = swift_allocObject();
    unint64_t v5 = v3 | 0x8000000000000000;
    *(void *)(v4 + 16) = 0;
    *(void *)(v4 + 24) = 0;
  }
  else
  {
    uint64_t v4 = 0;
    unint64_t v5 = v3 | 0x4000000000000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  uint64_t v13 = v4;
  unint64_t v14 = v5;
  if (v2) {
    goto LABEL_10;
  }
LABEL_16:
  swift_bridgeObjectRelease();
  return v13;
}

char *sub_22126AEB4(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_22125D79C(&qword_267F49160);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_22126AFA0(char *a1, int64_t a2, char a3, char *a4)
{
  return sub_22126AFAC(a1, a2, a3, a4, &qword_267F49310);
}

char *sub_22126AFAC(char *result, int64_t a2, char a3, char *a4, uint64_t *a5)
{
  char v6 = (char)result;
  if (a3)
  {
    unint64_t v7 = *((void *)a4 + 3);
    int64_t v8 = v7 >> 1;
    if ((uint64_t)(v7 >> 1) < a2)
    {
      if (v8 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v7 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v8 = a2;
      }
    }
  }
  else
  {
    int64_t v8 = a2;
  }
  uint64_t v9 = *((void *)a4 + 2);
  if (v8 <= v9) {
    uint64_t v10 = *((void *)a4 + 2);
  }
  else {
    uint64_t v10 = v8;
  }
  if (v10)
  {
    sub_22125D79C(a5);
    size_t v11 = (char *)swift_allocObject();
    int64_t v12 = j__malloc_size(v11);
    uint64_t v13 = v12 - 32;
    if (v12 < 32) {
      uint64_t v13 = v12 - 25;
    }
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = 2 * (v13 >> 3);
  }
  else
  {
    size_t v11 = (char *)MEMORY[0x263F8EE78];
  }
  unint64_t v14 = v11 + 32;
  uint64_t v15 = a4 + 32;
  if (v6)
  {
    if (v11 != a4 || v14 >= &v15[8 * v9]) {
      memmove(v14, v15, 8 * v9);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v14, v15, 8 * v9);
  }
  swift_bridgeObjectRelease();
  return v11;
}

char *sub_22126B0A4(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_22125D79C(&qword_267F49318);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  uint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_22126B1A8(uint64_t result)
{
  if (result)
  {
    unint64_t v1 = result;
    if (result < 15)
    {
      return 0;
    }
    else
    {
      sub_22127D738();
      swift_allocObject();
      sub_22127D728();
      if (v1 >= 0x7FFFFFFF)
      {
        sub_22127D828();
        uint64_t result = swift_allocObject();
        *(void *)(result + 16) = 0;
        *(void *)(result + 24) = 0;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t sub_22126B244(uint64_t a1, unint64_t a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if (sub_22127DB38() < 1 || (sub_22127DB38() & 1) != 0) {
    goto LABEL_13;
  }
  uint64_t v4 = HIBYTE(a2) & 0xF;
  v23[0] = a1;
  v23[1] = a2;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v4 = a1 & 0xFFFFFFFFFFFFLL;
  }
  v23[2] = 0;
  uint64_t v24 = v4;
  swift_bridgeObjectRetain();
  char v5 = (char *)MEMORY[0x263F8EE78];
  while (1)
  {
    sub_22127DB78();
    if (!v6) {
      break;
    }
    uint64_t v7 = sub_22127DA18();
    char v9 = v8;
    swift_bridgeObjectRelease();
    if ((v9 & 1) == 0)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        char v5 = sub_22126AFAC(0, *((void *)v5 + 2) + 1, 1, v5, &qword_267F49320);
      }
      unint64_t v11 = *((void *)v5 + 2);
      unint64_t v10 = *((void *)v5 + 3);
      if (v11 >= v10 >> 1) {
        char v5 = sub_22126AFAC((char *)(v10 > 1), v11 + 1, 1, v5, &qword_267F49320);
      }
      *((void *)v5 + 2) = v11 + 1;
      *(void *)&v5[8 * v11 + 32] = v7;
    }
  }
  swift_bridgeObjectRelease();
  unint64_t v14 = *((void *)v5 + 2);
  uint64_t v15 = sub_22127DB38();
  swift_bridgeObjectRelease();
  if (v14 != v15)
  {
LABEL_13:
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    uint64_t v16 = sub_22126B1A8(v14 >> 1);
    uint64_t v26 = v16;
    uint64_t v27 = v17;
    if (v14)
    {
      unint64_t v18 = 0;
      do
      {
        unint64_t v20 = *((void *)v5 + 2);
        if (v18 >= v20)
        {
          __break(1u);
LABEL_28:
          __break(1u);
LABEL_29:
          __break(1u);
LABEL_30:
          __break(1u);
        }
        unint64_t v21 = v18 + 1;
        if (v18 + 1 >= v20) {
          goto LABEL_28;
        }
        unint64_t v22 = *(void *)&v5[8 * v18 + 40] | (16 * *(void *)&v5[8 * v18 + 32]);
        if ((v22 & 0x8000000000000000) != 0) {
          goto LABEL_29;
        }
        if (v22 > 0xFF) {
          goto LABEL_30;
        }
        uint64_t v19 = sub_22125D79C(&qword_267F49300);
        uint64_t v24 = v19;
        unint64_t v25 = sub_22126B58C();
        LOBYTE(v23[0]) = v22;
        sub_22126A4B8(v23, v19);
        sub_22127D848();
        sub_22125DE98((uint64_t)v23);
        unint64_t v18 = v21 + 1;
      }
      while (v21 + 1 < v14);
      swift_bridgeObjectRelease();
      return v26;
    }
    else
    {
      uint64_t v12 = v16;
      swift_bridgeObjectRelease();
    }
  }
  return v12;
}

uint64_t sub_22126B518(uint64_t a1, uint64_t a2)
{
  return sub_22126A85C(a1, a2, *(void *)(v2 + 16), *(void *)(v2 + 24));
}

unint64_t sub_22126B534()
{
  unint64_t result = qword_267F492E0;
  if (!qword_267F492E0)
  {
    sub_22127D918();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F492E0);
  }
  return result;
}

unint64_t sub_22126B58C()
{
  unint64_t result = qword_267F49308;
  if (!qword_267F49308)
  {
    sub_22126045C(&qword_267F49300);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F49308);
  }
  return result;
}

uint64_t sub_22126B5E8(uint64_t a1, unint64_t a2)
{
  int v2 = 1;
  unsigned __int8 v3 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      uint64_t v4 = (int)a1;
      if ((int)a1 != a1 >> 32) {
        goto LABEL_15;
      }
      unsigned __int8 v3 = 0;
      return v3 | (v2 << 8);
    case 2uLL:
      uint64_t v4 = *(void *)(a1 + 16);
      uint64_t v5 = *(void *)(a1 + 24);
      if (v4 != v5)
      {
        if (a2 >> 62 == 2)
        {
          if (v4 >= v5) {
            goto LABEL_23;
          }
          uint64_t v6 = sub_22127D6E8();
          if (!v6) {
            goto LABEL_25;
          }
          uint64_t v7 = v6;
          a1 = sub_22127D718();
          uint64_t v8 = v4 - a1;
          if (!__OFSUB__(v4, a1)) {
            goto LABEL_19;
          }
          __break(1u);
        }
LABEL_15:
        if (v4 < (int)a1 || v4 >= a1 >> 32)
        {
          __break(1u);
LABEL_22:
          __break(1u);
LABEL_23:
          __break(1u);
        }
        uint64_t v9 = sub_22127D6E8();
        if (v9)
        {
          uint64_t v7 = v9;
          uint64_t v10 = sub_22127D718();
          uint64_t v8 = v4 - v10;
          if (!__OFSUB__(v4, v10))
          {
LABEL_19:
            int v2 = 0;
            unsigned __int8 v3 = *(unsigned char *)(v7 + v8);
            return v3 | (v2 << 8);
          }
          goto LABEL_22;
        }
        __break(1u);
LABEL_25:
        __break(1u);
        JUMPOUT(0x22126B730);
      }
      unsigned __int8 v3 = 0;
      int v2 = 1;
      return v3 | (v2 << 8);
    case 3uLL:
      return v3 | (v2 << 8);
    default:
      int v2 = (a2 & 0xFF000000000000) == 0;
      if ((a2 & 0xFF000000000000) != 0) {
        unsigned __int8 v3 = a1;
      }
      else {
        unsigned __int8 v3 = 0;
      }
      return v3 | (v2 << 8);
  }
}

uint64_t sub_22126B740(uint64_t a1, unint64_t a2)
{
  sub_22125D744(a1, a2);
  unsigned int v4 = sub_22126B5E8(a1, a2);
  sub_22125C910(a1, a2);
  if ((v4 & 0x100) != 0) {
    return 0;
  }
  else {
    return v4;
  }
}

uint64_t sub_22126B794(char a1, uint64_t a2, unint64_t a3)
{
  _OWORD v26[2] = *MEMORY[0x263EF8340];
  sub_22125D744(a2, a3);
  uint64_t v6 = sub_2212686F4(a2, a3);
  uint64_t v8 = v6;
  unint64_t v9 = v7;
  if ((a1 & 1) == 0)
  {
    switch(v7 >> 62)
    {
      case 1uLL:
        if ((int)v6 > v6 >> 32)
        {
          __break(1u);
LABEL_34:
          __break(1u);
        }
        else
        {
          uint64_t v10 = sub_22127D6E8();
          if (!v10) {
            goto LABEL_10;
          }
          uint64_t v11 = sub_22127D718();
          if (!__OFSUB__((int)v8, v11))
          {
            v10 += (int)v8 - v11;
LABEL_10:
            sub_22127D708();
            uint64_t v12 = (unsigned __int16 *)v10;
LABEL_17:
            uint64_t v17 = sub_22126BAC0(v12);
            goto LABEL_31;
          }
        }
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
        return result;
      case 2uLL:
        uint64_t v13 = *(void *)(v6 + 16);
        swift_retain();
        swift_retain();
        unint64_t v14 = (unsigned __int16 *)sub_22127D6E8();
        if (!v14) {
          goto LABEL_14;
        }
        uint64_t v15 = sub_22127D718();
        if (__OFSUB__(v13, v15)) {
          goto LABEL_36;
        }
        unint64_t v14 = (unsigned __int16 *)((char *)v14 + v13 - v15);
LABEL_14:
        sub_22127D708();
        uint64_t v16 = sub_22126BAC0(v14);
        goto LABEL_27;
      case 3uLL:
        memset(v26, 0, 14);
        goto LABEL_16;
      default:
        v26[0] = v6;
        LOWORD(v26[1]) = v7;
        BYTE2(v26[1]) = BYTE2(v7);
        BYTE3(v26[1]) = BYTE3(v7);
        BYTE4(v26[1]) = BYTE4(v7);
        BYTE5(v26[1]) = BYTE5(v7);
LABEL_16:
        uint64_t v12 = (unsigned __int16 *)v26;
        goto LABEL_17;
    }
  }
  switch(v7 >> 62)
  {
    case 1uLL:
      if ((int)v6 > v6 >> 32) {
        goto LABEL_34;
      }
      uint64_t v18 = sub_22127D6E8();
      if (!v18) {
        goto LABEL_22;
      }
      uint64_t v19 = sub_22127D718();
      if (__OFSUB__((int)v8, v19)) {
        goto LABEL_37;
      }
      v18 += (int)v8 - v19;
LABEL_22:
      sub_22127D708();
      unint64_t v20 = (unsigned __int16 *)v18;
LABEL_30:
      uint64_t v17 = sub_22126BAC8(v20);
      break;
    case 2uLL:
      uint64_t v21 = *(void *)(v6 + 16);
      swift_retain();
      swift_retain();
      unint64_t v22 = (unsigned __int16 *)sub_22127D6E8();
      if (!v22) {
        goto LABEL_26;
      }
      uint64_t v23 = sub_22127D718();
      if (__OFSUB__(v21, v23)) {
        goto LABEL_38;
      }
      unint64_t v22 = (unsigned __int16 *)((char *)v22 + v21 - v23);
LABEL_26:
      sub_22127D708();
      uint64_t v16 = sub_22126BAC8(v22);
LABEL_27:
      uint64_t v24 = v16;
      swift_release();
      swift_release();
      goto LABEL_32;
    case 3uLL:
      memset(v26, 0, 14);
      goto LABEL_29;
    default:
      v26[0] = v6;
      LOWORD(v26[1]) = v7;
      BYTE2(v26[1]) = BYTE2(v7);
      BYTE3(v26[1]) = BYTE3(v7);
      BYTE4(v26[1]) = BYTE4(v7);
      BYTE5(v26[1]) = BYTE5(v7);
LABEL_29:
      unint64_t v20 = (unsigned __int16 *)v26;
      goto LABEL_30;
  }
LABEL_31:
  uint64_t v24 = v17;
LABEL_32:
  sub_22125C910(v8, v9);
  return v24;
}

uint64_t sub_22126BAC0(unsigned __int16 *a1)
{
  return *a1;
}

uint64_t sub_22126BAC8(unsigned __int16 *a1)
{
  return bswap32(*a1) >> 16;
}

uint64_t sub_22126BAD8(char a1, uint64_t a2, unint64_t a3)
{
  _OWORD v26[2] = *MEMORY[0x263EF8340];
  sub_22125D744(a2, a3);
  uint64_t v6 = sub_2212686F4(a2, a3);
  uint64_t v8 = v6;
  unint64_t v9 = v7;
  if ((a1 & 1) == 0)
  {
    switch(v7 >> 62)
    {
      case 1uLL:
        if ((int)v6 > v6 >> 32)
        {
          __break(1u);
LABEL_33:
          __break(1u);
LABEL_34:
          __break(1u);
LABEL_35:
          __break(1u);
        }
        else
        {
          uint64_t v10 = (unsigned int *)sub_22127D6E8();
          if (!v10)
          {
LABEL_10:
            sub_22127D708();
            uint64_t v12 = sub_22126BE30(v10);
            goto LABEL_30;
          }
          uint64_t v11 = sub_22127D718();
          if (!__OFSUB__((int)v8, v11))
          {
            uint64_t v10 = (unsigned int *)((char *)v10 + (int)v8 - v11);
            goto LABEL_10;
          }
        }
        __break(1u);
LABEL_37:
        __break(1u);
        return result;
      case 2uLL:
        uint64_t v13 = *(void *)(v6 + 16);
        swift_retain();
        swift_retain();
        unint64_t v14 = (unsigned int *)sub_22127D6E8();
        if (!v14) {
          goto LABEL_14;
        }
        uint64_t v15 = sub_22127D718();
        if (__OFSUB__(v13, v15)) {
          goto LABEL_34;
        }
        unint64_t v14 = (unsigned int *)((char *)v14 + v13 - v15);
LABEL_14:
        sub_22127D708();
        uint64_t v16 = sub_22126BE30(v14);
        goto LABEL_26;
      case 3uLL:
        memset(v26, 0, 14);
        goto LABEL_16;
      default:
        v26[0] = v6;
        LOWORD(v26[1]) = v7;
        BYTE2(v26[1]) = BYTE2(v7);
        BYTE3(v26[1]) = BYTE3(v7);
        BYTE4(v26[1]) = BYTE4(v7);
        BYTE5(v26[1]) = BYTE5(v7);
LABEL_16:
        uint64_t v12 = sub_22126BE30((unsigned int *)v26);
        goto LABEL_30;
    }
  }
  switch(v7 >> 62)
  {
    case 1uLL:
      if ((int)v6 > v6 >> 32) {
        goto LABEL_33;
      }
      uint64_t v17 = sub_22127D6E8();
      if (!v17) {
        goto LABEL_21;
      }
      uint64_t v18 = sub_22127D718();
      if (__OFSUB__((int)v8, v18)) {
        goto LABEL_37;
      }
      v17 += (int)v8 - v18;
LABEL_21:
      sub_22127D708();
      uint64_t v19 = (unsigned int *)v17;
LABEL_29:
      uint64_t v12 = sub_22126BE38(v19);
      break;
    case 2uLL:
      uint64_t v20 = *(void *)(v6 + 16);
      swift_retain();
      swift_retain();
      uint64_t v21 = (unsigned int *)sub_22127D6E8();
      if (!v21) {
        goto LABEL_25;
      }
      uint64_t v22 = sub_22127D718();
      if (__OFSUB__(v20, v22)) {
        goto LABEL_35;
      }
      uint64_t v21 = (unsigned int *)((char *)v21 + v20 - v22);
LABEL_25:
      sub_22127D708();
      uint64_t v16 = sub_22126BE38(v21);
LABEL_26:
      uint64_t v23 = v16;
      swift_release();
      swift_release();
      sub_22125C910(v8, v9);
      return v23;
    case 3uLL:
      memset(v26, 0, 14);
      goto LABEL_28;
    default:
      v26[0] = v6;
      LOWORD(v26[1]) = v7;
      BYTE2(v26[1]) = BYTE2(v7);
      BYTE3(v26[1]) = BYTE3(v7);
      BYTE4(v26[1]) = BYTE4(v7);
      BYTE5(v26[1]) = BYTE5(v7);
LABEL_28:
      uint64_t v19 = (unsigned int *)v26;
      goto LABEL_29;
  }
LABEL_30:
  uint64_t v25 = v12;
  sub_22125C910(v8, v9);
  return v25;
}

uint64_t sub_22126BE30(unsigned int *a1)
{
  return *a1;
}

uint64_t sub_22126BE38(unsigned int *a1)
{
  return bswap32(*a1);
}

unint64_t sub_22126BE44(char a1, uint64_t a2, unint64_t a3)
{
  _OWORD v26[2] = *MEMORY[0x263EF8340];
  sub_22125D744(a2, a3);
  uint64_t v6 = sub_2212686F4(a2, a3);
  uint64_t v8 = v6;
  unint64_t v9 = v7;
  if ((a1 & 1) == 0)
  {
    switch(v7 >> 62)
    {
      case 1uLL:
        if ((int)v6 > v6 >> 32)
        {
          __break(1u);
LABEL_33:
          __break(1u);
LABEL_34:
          __break(1u);
LABEL_35:
          __break(1u);
        }
        else
        {
          uint64_t v10 = sub_22127D6E8();
          if (!v10)
          {
LABEL_10:
            sub_22127D708();
            unint64_t v12 = sub_22126C19C(v10);
            goto LABEL_30;
          }
          uint64_t v11 = sub_22127D718();
          if (!__OFSUB__((int)v8, v11))
          {
            v10 += (int)v8 - v11;
            goto LABEL_10;
          }
        }
        __break(1u);
LABEL_37:
        __break(1u);
        return result;
      case 2uLL:
        uint64_t v13 = *(void *)(v6 + 16);
        swift_retain();
        swift_retain();
        uint64_t v14 = sub_22127D6E8();
        if (!v14) {
          goto LABEL_14;
        }
        uint64_t v15 = sub_22127D718();
        if (__OFSUB__(v13, v15)) {
          goto LABEL_34;
        }
        v14 += v13 - v15;
LABEL_14:
        sub_22127D708();
        unint64_t v16 = sub_22126C19C(v14);
        goto LABEL_26;
      case 3uLL:
        memset(v26, 0, 14);
        goto LABEL_16;
      default:
        v26[0] = v6;
        LOWORD(v26[1]) = v7;
        BYTE2(v26[1]) = BYTE2(v7);
        BYTE3(v26[1]) = BYTE3(v7);
        BYTE4(v26[1]) = BYTE4(v7);
        BYTE5(v26[1]) = BYTE5(v7);
LABEL_16:
        unint64_t v12 = sub_22126C19C((uint64_t)v26);
        goto LABEL_30;
    }
  }
  switch(v7 >> 62)
  {
    case 1uLL:
      if ((int)v6 > v6 >> 32) {
        goto LABEL_33;
      }
      uint64_t v17 = sub_22127D6E8();
      if (!v17) {
        goto LABEL_21;
      }
      uint64_t v18 = sub_22127D718();
      if (__OFSUB__((int)v8, v18)) {
        goto LABEL_37;
      }
      v17 += (int)v8 - v18;
LABEL_21:
      sub_22127D708();
      uint64_t v19 = (unint64_t *)v17;
LABEL_29:
      unint64_t v12 = sub_22126C1A4(v19);
      break;
    case 2uLL:
      uint64_t v20 = *(void *)(v6 + 16);
      swift_retain();
      swift_retain();
      uint64_t v21 = (unint64_t *)sub_22127D6E8();
      if (!v21) {
        goto LABEL_25;
      }
      uint64_t v22 = sub_22127D718();
      if (__OFSUB__(v20, v22)) {
        goto LABEL_35;
      }
      uint64_t v21 = (unint64_t *)((char *)v21 + v20 - v22);
LABEL_25:
      sub_22127D708();
      unint64_t v16 = sub_22126C1A4(v21);
LABEL_26:
      unint64_t v23 = v16;
      swift_release();
      swift_release();
      sub_22125C910(v8, v9);
      return v23;
    case 3uLL:
      memset(v26, 0, 14);
      goto LABEL_28;
    default:
      v26[0] = v6;
      LOWORD(v26[1]) = v7;
      BYTE2(v26[1]) = BYTE2(v7);
      BYTE3(v26[1]) = BYTE3(v7);
      BYTE4(v26[1]) = BYTE4(v7);
      BYTE5(v26[1]) = BYTE5(v7);
LABEL_28:
      uint64_t v19 = v26;
      goto LABEL_29;
  }
LABEL_30:
  unint64_t v25 = v12;
  sub_22125C910(v8, v9);
  return v25;
}

uint64_t sub_22126C19C(uint64_t a1)
{
  return *(void *)a1;
}

unint64_t sub_22126C1A4(unint64_t *a1)
{
  return bswap64(*a1);
}

BOOL sub_22126C1B0(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

uint64_t sub_22126C1C0()
{
  return sub_22127E088();
}

uint64_t sub_22126C1E8()
{
  return sub_22127E0A8();
}

BOOL sub_22126C230(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_22126C248()
{
  return sub_22127E0A8();
}

uint64_t sub_22126C290()
{
  return sub_22127E088();
}

uint64_t sub_22126C2BC()
{
  return sub_22127E0A8();
}

uint64_t sub_22126C300(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a1 < 0) {
    return 0;
  }
  uint64_t v3 = 0;
  switch(a3 >> 62)
  {
    case 1uLL:
      LODWORD(v4) = HIDWORD(a2) - a2;
      if (__OFSUB__(HIDWORD(a2), a2))
      {
        __break(1u);
LABEL_13:
        __break(1u);
        JUMPOUT(0x22126C3A8);
      }
      uint64_t v4 = (int)v4;
LABEL_8:
      if (v4 <= a1) {
        uint64_t v3 = 0;
      }
      else {
        uint64_t v3 = sub_22127D8F8();
      }
      break;
    case 2uLL:
      uint64_t v6 = *(void *)(a2 + 16);
      uint64_t v5 = *(void *)(a2 + 24);
      BOOL v7 = __OFSUB__(v5, v6);
      uint64_t v4 = v5 - v6;
      if (!v7) {
        goto LABEL_8;
      }
      goto LABEL_13;
    case 3uLL:
      return v3;
    default:
      uint64_t v4 = BYTE6(a3);
      goto LABEL_8;
  }
  return v3;
}

uint64_t sub_22126C3B8(uint64_t result, uint64_t a2, unint64_t a3)
{
  if (result < 0) {
    return result;
  }
  uint64_t v4 = *v3;
  unint64_t v5 = v3[1];
  unint64_t v6 = v5 >> 62;
  switch(v5 >> 62)
  {
    case 1uLL:
      LODWORD(v7) = HIDWORD(v4) - v4;
      if (__OFSUB__(HIDWORD(v4), v4)) {
        goto LABEL_31;
      }
      uint64_t v7 = (int)v7;
LABEL_7:
      if (v7 <= result) {
        return result;
      }
      break;
    case 2uLL:
      uint64_t v9 = *(void *)(v4 + 16);
      uint64_t v8 = *(void *)(v4 + 24);
      BOOL v10 = __OFSUB__(v8, v9);
      uint64_t v7 = v8 - v9;
      if (!v10) {
        goto LABEL_7;
      }
      goto LABEL_32;
    case 3uLL:
      return result;
    default:
      uint64_t v7 = BYTE6(v5);
      goto LABEL_7;
  }
  uint64_t v11 = 0;
  switch(a3 >> 62)
  {
    case 1uLL:
      LODWORD(v11) = HIDWORD(a2) - a2;
      if (__OFSUB__(HIDWORD(a2), a2)) {
        goto LABEL_37;
      }
      uint64_t v11 = (int)v11;
LABEL_13:
      if (v6)
      {
        if (v6 == 1)
        {
          LODWORD(v14) = HIDWORD(v4) - v4;
          if (__OFSUB__(HIDWORD(v4), v4))
          {
LABEL_35:
            __break(1u);
            goto LABEL_36;
          }
          uint64_t v14 = (int)v14;
        }
        else
        {
          uint64_t v17 = v4 + 16;
          uint64_t v16 = *(void *)(v4 + 16);
          uint64_t v15 = *(void *)(v17 + 8);
          BOOL v10 = __OFSUB__(v15, v16);
          uint64_t v14 = v15 - v16;
          if (v10)
          {
LABEL_36:
            __break(1u);
LABEL_37:
            __break(1u);
LABEL_38:
            __break(1u);
LABEL_39:
            __break(1u);
LABEL_40:
            __break(1u);
            JUMPOUT(0x22126C578);
          }
        }
      }
      else
      {
        uint64_t v14 = BYTE6(v5);
      }
      BOOL v10 = __OFSUB__(v14, result);
      uint64_t v18 = v14 - result;
      if (v10)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
LABEL_33:
        __break(1u);
LABEL_34:
        __break(1u);
        goto LABEL_35;
      }
      if (v18 >= v11)
      {
        uint64_t v19 = 0;
        switch(a3 >> 62)
        {
          case 1uLL:
            if (__OFSUB__(HIDWORD(a2), a2)) {
              goto LABEL_39;
            }
            uint64_t v19 = HIDWORD(a2) - (int)a2;
LABEL_26:
            if (__OFADD__(result, v19)) {
              goto LABEL_33;
            }
            if (result + v19 < result) {
              goto LABEL_34;
            }
            unint64_t result = sub_22126C5A8(a2, a3);
            break;
          case 2uLL:
            uint64_t v21 = *(void *)(a2 + 16);
            uint64_t v20 = *(void *)(a2 + 24);
            BOOL v10 = __OFSUB__(v20, v21);
            uint64_t v19 = v20 - v21;
            if (!v10) {
              goto LABEL_26;
            }
            goto LABEL_40;
          case 3uLL:
            goto LABEL_26;
          default:
            uint64_t v19 = BYTE6(a3);
            goto LABEL_26;
        }
      }
      return result;
    case 2uLL:
      uint64_t v13 = *(void *)(a2 + 16);
      uint64_t v12 = *(void *)(a2 + 24);
      BOOL v10 = __OFSUB__(v12, v13);
      uint64_t v11 = v12 - v13;
      if (!v10) {
        goto LABEL_13;
      }
      goto LABEL_38;
    case 3uLL:
      goto LABEL_13;
    default:
      uint64_t v11 = BYTE6(a3);
      goto LABEL_13;
  }
}

uint64_t sub_22126C5A8(uint64_t a1, unint64_t a2)
{
  switch(a2 >> 62)
  {
    case 1uLL:
      if (a1 >> 32 < (int)a1) {
        __break(1u);
      }
      swift_retain();
      sub_22126C9C0((int)a1, a1 >> 32);
      uint64_t result = sub_22125C910(a1, a2);
      break;
    case 2uLL:
      uint64_t v5 = *(void *)(a1 + 16);
      uint64_t v6 = *(void *)(a1 + 24);
      swift_retain();
      swift_retain();
      sub_22126C9C0(v5, v6);
      swift_release();
      uint64_t result = swift_release();
      break;
    default:
      uint64_t result = sub_22127D848();
      break;
  }
  return result;
}

unint64_t sub_22126C7B4()
{
  unint64_t result = qword_267F49328;
  if (!qword_267F49328)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F49328);
  }
  return result;
}

unsigned char *_s10EndiannessOwCP(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t _s10EndiannessOwet(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s10EndiannessOwst(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x22126C974);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_22126C99C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_22126C9A4(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *_s10EndiannessOMa()
{
  return &_s10EndiannessON;
}

uint64_t sub_22126C9C0(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_22127D6E8();
  if (!result || (uint64_t result = sub_22127D718(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_22127D708();
      return sub_22127D848();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_22126CA68()
{
  return *(void *)(v0 + 16);
}

void *sub_22126CA70(uint64_t a1, uint64_t a2, uint64_t a3)
{
  type metadata accessor for TLV();
  uint64_t result = (void *)swift_allocObject();
  result[2] = a1;
  result[3] = a2;
  result[4] = a3;
  return result;
}

uint64_t type metadata accessor for TLV()
{
  return self;
}

void *sub_22126CADC(uint64_t a1, uint64_t a2)
{
  type metadata accessor for TLV();
  uint64_t result = (void *)swift_allocObject();
  result[2] = a1;
  result[3] = a2;
  result[4] = 0x2000000000000000;
  return result;
}

void sub_22126CB1C(uint64_t a1, unint64_t a2)
{
  id v5 = objc_allocWithZone(MEMORY[0x263EFF950]);
  unsigned int v6 = (void *)sub_22127D898();
  id v7 = objc_msgSend(v5, sel_initWithData_, v6);

  objc_msgSend(v7, sel_open);
  uint64_t v8 = sub_22126CCD4();
  if (v2) {
    goto LABEL_6;
  }
  if ((v9 & 1) != 0
    || (v10 = v8, id v11 = sub_22126CE58(), (v12 & 1) != 0)
    || (id v13 = sub_221273AC4((uint64_t)v11), v15 = v14, v14 >> 60 == 15))
  {
    sub_22126CE04();
    swift_allocError();
    *uint64_t v16 = 0;
    swift_willThrow();
LABEL_6:
    sub_22125C910(a1, a2);
LABEL_7:

    return;
  }
  uint64_t v17 = (uint64_t)v13;
  if ((sub_22126CFD4() & 0x100) == 0)
  {
    sub_22126CE04();
    swift_allocError();
    *uint64_t v18 = 1;
    swift_willThrow();
    sub_22125C910(a1, a2);
    sub_22125C8FC(v17, v15);
    goto LABEL_7;
  }
  objc_msgSend(v7, sel_close);
  sub_22125C910(a1, a2);

  type metadata accessor for TLV();
  uint64_t v19 = (void *)swift_allocObject();
  int v19[2] = v10;
  v19[3] = v17;
  v19[4] = v15;
}

uint64_t sub_22126CCD4()
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t result = sub_22126CFD4();
  if (!v1)
  {
    if ((result & 0x100) != 0) {
      return 0;
    }
    uint64_t v3 = result;
    if ((~result & 0x1F) != 0)
    {
      return result;
    }
    else
    {
      while (1)
      {
        unsigned __int8 v6 = 0;
        id v4 = objc_msgSend(v0, sel_read_maxLength_, &v6, 1);
        if (v4 != (id)1) {
          break;
        }
        uint64_t result = v6 | (unint64_t)(v3 << 8);
        uint64_t v3 = result;
        if (((char)v6 & 0x80000000) == 0) {
          return result;
        }
      }
      if (v4 != (id)-1)
      {
        sub_22126CE04();
        swift_allocError();
        *id v5 = 0;
        return swift_willThrow();
      }
      uint64_t result = (uint64_t)objc_msgSend(v0, sel_streamError);
      if (result) {
        return swift_willThrow();
      }
      __break(1u);
    }
  }
  return result;
}

unint64_t sub_22126CE04()
{
  unint64_t result = qword_267F49330;
  if (!qword_267F49330)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F49330);
  }
  return result;
}

id sub_22126CE58()
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  __int16 v3 = sub_22126CFD4();
  if (v1) {
    return (id)v2;
  }
  if ((v3 & 0x100) != 0) {
    return 0;
  }
  unsigned int v4 = v3;
  if ((v3 & 0x80) == 0) {
    return (id)v3;
  }
  if (v3 == 128)
  {
    sub_22126CE04();
    swift_allocError();
    *unsigned __int8 v6 = 2;
LABEL_18:
    swift_willThrow();
    return (id)v2;
  }
  unint64_t v2 = 0;
  unsigned int v7 = 128;
  while (1)
  {
    if (v7 >= v4) {
      __break(1u);
    }
    unsigned __int8 v10 = 0;
    id v8 = objc_msgSend(v0, sel_read_maxLength_, &v10, 1);
    if (v8 != (id)1) {
      break;
    }
    ++v7;
    unint64_t v2 = v10 | (v2 << 8);
    if (v7 == v4) {
      return (id)v2;
    }
  }
  if (v8 != (id)-1)
  {
    sub_22126CE04();
    swift_allocError();
    *char v9 = 0;
    goto LABEL_18;
  }
  id result = objc_msgSend(v0, sel_streamError);
  if (result) {
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

uint64_t sub_22126CFD4()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  unsigned __int8 v3 = 0;
  id v1 = objc_msgSend(v0, sel_read_maxLength_, &v3, 1);
  if (v1 == (id)1) {
    return v3;
  }
  if (v1 != (id)-1) {
    return 256;
  }
  uint64_t result = (uint64_t)objc_msgSend(v0, sel_streamError);
  if (result) {
    return swift_willThrow();
  }
  __break(1u);
  return result;
}

uint64_t sub_22126D0A4()
{
  unint64_t v2 = *(void *)(v0 + 24);
  unint64_t v3 = *(void *)(v0 + 32);
  if ((v3 & 0x2000000000000000) == 0)
  {
    switch(v3 >> 62)
    {
      case 1uLL:
        if (__OFSUB__(HIDWORD(v2), v2)) {
          goto LABEL_42;
        }
        return HIDWORD(v2) - (int)v2;
      case 2uLL:
        uint64_t v15 = *(void *)(v2 + 16);
        uint64_t v14 = *(void *)(v2 + 24);
        uint64_t v4 = v14 - v15;
        if (!__OFSUB__(v14, v15)) {
          return v4;
        }
        __break(1u);
        goto LABEL_23;
      case 3uLL:
        goto LABEL_39;
      default:
        sub_22126D398(*(void *)(v0 + 24), *(void *)(v0 + 32));
        return BYTE6(v3);
    }
  }
  if (v2 >> 62)
  {
LABEL_37:
    sub_22126D38C(v2, v3);
    swift_bridgeObjectRetain();
    uint64_t v1 = sub_22127DF08();
    if (v1) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v1 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    sub_22126D38C(*(void *)(v0 + 24), *(void *)(v0 + 32));
    swift_bridgeObjectRetain();
    if (v1)
    {
LABEL_6:
      if (v1 < 1)
      {
        __break(1u);
LABEL_42:
        __break(1u);
        JUMPOUT(0x22126D314);
      }
      if ((v2 & 0xC000000000000001) != 0)
      {
        uint64_t v5 = 0;
        uint64_t v4 = 0;
        while (1)
        {
          uint64_t v6 = MEMORY[0x223C7CCC0](v5, v2);
          int64_t v7 = sub_22126D0A4(v6);
          unint64_t v8 = *(void *)(v6 + 16);
          swift_unknownObjectRelease();
          if (v8)
          {
            unint64_t v9 = 8 - (__clz(v8) >> 3);
            if (v7 <= 127)
            {
              unint64_t v10 = 1;
              goto LABEL_14;
            }
          }
          else
          {
            unint64_t v10 = 1;
            unint64_t v9 = 1;
            if (v7 < 128) {
              goto LABEL_14;
            }
          }
          unint64_t v10 = 9 - (__clz(v7) >> 3);
LABEL_14:
          unint64_t v11 = v9 + v10;
          BOOL v12 = __OFADD__(v11, v7);
          unint64_t v13 = v11 + v7;
          if (v12)
          {
            __break(1u);
LABEL_34:
            __break(1u);
LABEL_35:
            __break(1u);
            goto LABEL_36;
          }
          BOOL v12 = __OFADD__(v4, v13);
          v4 += v13;
          if (v12) {
            goto LABEL_34;
          }
          if (v1 == ++v5) {
            goto LABEL_32;
          }
        }
      }
LABEL_23:
      uint64_t v4 = 0;
      uint64_t v16 = (uint64_t *)(v2 + 32);
      while (1)
      {
        uint64_t v17 = *v16;
        uint64_t v18 = swift_retain();
        int64_t v19 = sub_22126D0A4(v18);
        unint64_t v20 = *(void *)(v17 + 16);
        swift_release();
        if (v20)
        {
          unint64_t v21 = 8 - (__clz(v20) >> 3);
          if (v19 > 127) {
            goto LABEL_28;
          }
          unint64_t v22 = 1;
        }
        else
        {
          unint64_t v22 = 1;
          unint64_t v21 = 1;
          if (v19 >= 128) {
LABEL_28:
          }
            unint64_t v22 = 9 - (__clz(v19) >> 3);
        }
        unint64_t v23 = v21 + v22;
        BOOL v12 = __OFADD__(v23, v19);
        unint64_t v24 = v23 + v19;
        if (v12) {
          goto LABEL_35;
        }
        BOOL v12 = __OFADD__(v4, v24);
        v4 += v24;
        if (v12)
        {
LABEL_36:
          __break(1u);
          goto LABEL_37;
        }
        ++v16;
        if (!--v1)
        {
LABEL_32:
          sub_22126D398(v2, v3);
          sub_22126D398(v2, v3);
          return v4;
        }
      }
    }
  }
  sub_22126D398(v2, v3);
LABEL_39:
  sub_22126D398(v2, v3);
  return 0;
}

unint64_t sub_22126D324()
{
  int64_t v1 = sub_22126D0A4();
  unint64_t v2 = *(void *)(v0 + 16);
  if (v2)
  {
    unint64_t v3 = 8 - (__clz(v2) >> 3);
    if (v1 < 128)
    {
      unint64_t v4 = 1;
      goto LABEL_6;
    }
  }
  else
  {
    unint64_t v3 = 1;
    unint64_t v4 = 1;
    if (v1 < 128) {
      goto LABEL_6;
    }
  }
  unint64_t v4 = 9 - (__clz(v1) >> 3);
LABEL_6:
  unint64_t v5 = v3 + v4;
  BOOL v6 = __OFADD__(v5, v1);
  unint64_t result = v5 + v1;
  if (v6) {
    __break(1u);
  }
  return result;
}

uint64_t sub_22126D38C(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x2000000000000000) != 0) {
    return swift_bridgeObjectRetain();
  }
  else {
    return sub_22125D744(a1, a2);
  }
}

uint64_t sub_22126D398(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x2000000000000000) != 0) {
    return swift_bridgeObjectRelease();
  }
  else {
    return sub_22125C910(a1, a2);
  }
}

uint64_t sub_22126D3A4()
{
  unint64_t v1 = *(void *)(v0 + 24);
  unint64_t v2 = *(void *)(v0 + 32);
  if ((v2 & 0x2000000000000000) == 0)
  {
    sub_22125D744(*(void *)(v0 + 24), *(void *)(v0 + 32));
    return v1;
  }
  unint64_t v3 = self;
  swift_bridgeObjectRetain();
  id v4 = objc_msgSend(v3, sel_outputStreamToMemory);
  objc_msgSend(v4, sel_open);
  if (v1 >> 62) {
    goto LABEL_16;
  }
  uint64_t v5 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v5)
  {
LABEL_5:
    uint64_t v6 = 4;
    do
    {
      uint64_t v7 = v6 - 4;
      if ((v1 & 0xC000000000000001) != 0)
      {
        unint64_t v8 = (unint64_t *)MEMORY[0x223C7CCC0](v6 - 4, v1);
        BOOL v9 = __OFADD__(v7, 1);
        uint64_t v10 = v6 - 3;
        if (v9) {
          goto LABEL_15;
        }
      }
      else
      {
        unint64_t v8 = *(unint64_t **)(v1 + 8 * v6);
        swift_retain();
        BOOL v9 = __OFADD__(v7, 1);
        uint64_t v10 = v6 - 3;
        if (v9)
        {
LABEL_15:
          __break(1u);
LABEL_16:
          swift_bridgeObjectRetain();
          uint64_t v5 = sub_22127DF08();
          sub_22126D398(v1, v2);
          if (!v5) {
            break;
          }
          goto LABEL_5;
        }
      }
      sub_22126D5A8(v8);
      swift_release();
      ++v6;
    }
    while (v10 != v5);
  }
  sub_22126D398(v1, v2);
  objc_msgSend(v4, sel_close);
  if (objc_msgSend(v4, sel_propertyForKey_, *MEMORY[0x263EFF590]))
  {
    sub_22127DE38();

    swift_unknownObjectRelease();
    sub_22125C968(&v13, &v14);
    swift_dynamicCast();
    return v12;
  }
  __break(1u);
  uint64_t result = swift_unexpectedError();
  __break(1u);
  return result;
}

uint64_t sub_22126D5A8(unint64_t *a1)
{
  uint64_t result = sub_221271764(a1[2]);
  if (!v1)
  {
    uint64_t v4 = sub_22126D0A4();
    sub_221271B98(v4);
    unint64_t v6 = a1[3];
    unint64_t v5 = a1[4];
    if ((v5 & 0x2000000000000000) == 0)
    {
      sub_22125D744(v6, v5);
      sub_2212720B0(v6, v5);
      goto LABEL_16;
    }
    if (v6 >> 62) {
      goto LABEL_15;
    }
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    for (; v7; uint64_t v7 = sub_22127DF08())
    {
      unint64_t v13 = v5;
      for (uint64_t i = 4; ; ++i)
      {
        uint64_t v9 = i - 4;
        if ((v6 & 0xC000000000000001) == 0) {
          break;
        }
        uint64_t v10 = MEMORY[0x223C7CCC0](i - 4, v6);
        unint64_t v5 = i - 3;
        if (__OFADD__(v9, 1)) {
          goto LABEL_14;
        }
LABEL_12:
        sub_22126D5A8(v10);
        swift_release();
        if (v5 == v7)
        {
          uint64_t v11 = v6;
          unint64_t v12 = v13;
          return sub_22126D398(v11, v12);
        }
      }
      uint64_t v10 = *(void *)(v6 + 8 * i);
      swift_retain();
      unint64_t v5 = i - 3;
      if (!__OFADD__(v9, 1)) {
        goto LABEL_12;
      }
LABEL_14:
      __break(1u);
LABEL_15:
      swift_bridgeObjectRetain();
    }
LABEL_16:
    uint64_t v11 = v6;
    unint64_t v12 = v5;
    return sub_22126D398(v11, v12);
  }
  return result;
}

uint64_t sub_22126D72C(unint64_t *a1)
{
  uint64_t result = sub_2212719B0(a1[2]);
  if (!v1)
  {
    int64_t v4 = sub_22126D0A4();
    sub_221271C58(v4);
    unint64_t v6 = a1[3];
    unint64_t v5 = a1[4];
    if ((v5 & 0x2000000000000000) == 0)
    {
      swift_beginAccess();
      sub_22125D744(v6, v5);
      sub_2212690F4(v6, v5);
      swift_endAccess();
      goto LABEL_16;
    }
    if (v6 >> 62) {
      goto LABEL_15;
    }
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    for (; v7; uint64_t v7 = sub_22127DF08())
    {
      unint64_t v13 = v5;
      for (uint64_t i = 4; ; ++i)
      {
        uint64_t v9 = i - 4;
        if ((v6 & 0xC000000000000001) == 0) {
          break;
        }
        uint64_t v10 = MEMORY[0x223C7CCC0](i - 4, v6);
        unint64_t v5 = i - 3;
        if (__OFADD__(v9, 1)) {
          goto LABEL_14;
        }
LABEL_12:
        sub_22126D72C(v10);
        swift_release();
        if (v5 == v7)
        {
          uint64_t v11 = v6;
          unint64_t v12 = v13;
          return sub_22126D398(v11, v12);
        }
      }
      uint64_t v10 = *(void *)(v6 + 8 * i);
      swift_retain();
      unint64_t v5 = i - 3;
      if (!__OFADD__(v9, 1)) {
        goto LABEL_12;
      }
LABEL_14:
      __break(1u);
LABEL_15:
      swift_bridgeObjectRetain();
    }
LABEL_16:
    uint64_t v11 = v6;
    unint64_t v12 = v5;
    return sub_22126D398(v11, v12);
  }
  return result;
}

uint64_t sub_22126D8CC()
{
  uint64_t v0 = sub_22126D3A4();
  uint64_t v4 = v0;
  unint64_t v5 = v1;
  switch(v1 >> 62)
  {
    case 1uLL:
      LODWORD(v6) = HIDWORD(v0) - v0;
      if (__OFSUB__(HIDWORD(v0), v0)) {
        goto LABEL_9;
      }
      uint64_t v6 = (int)v6;
LABEL_6:
      if (v6 + 0x4000000000000000 < 0)
      {
        __break(1u);
LABEL_9:
        __break(1u);
LABEL_10:
        __break(1u);
        JUMPOUT(0x22126D9CCLL);
      }
LABEL_7:
      MEMORY[0x270FA5388](v2, v3);
      uint64_t v10 = sub_22127DB18();
      sub_22125C910(v4, v5);
      return v10;
    case 2uLL:
      uint64_t v8 = *(void *)(v0 + 16);
      uint64_t v7 = *(void *)(v0 + 24);
      BOOL v9 = __OFSUB__(v7, v8);
      uint64_t v6 = v7 - v8;
      if (!v9) {
        goto LABEL_6;
      }
      goto LABEL_10;
    case 3uLL:
      goto LABEL_7;
    default:
      uint64_t v6 = BYTE6(v1);
      goto LABEL_6;
  }
}

id sub_22126D9DC()
{
  uint64_t v1 = *(void *)(v0 + 24);
  unint64_t v2 = *(void *)(v0 + 32);
  if ((v2 & 0x2000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    sub_22126D38C(*(void *)(v0 + 24), *(void *)(v0 + 32));
    id v3 = sub_221273174(v1, v2);
    sub_22126D398(v1, v2);
    uint64_t v4 = *(void *)(v0 + 24);
    unint64_t v5 = *(void *)(v0 + 32);
    *(void *)(v0 + 24) = v3;
    *(void *)(v0 + 32) = 0x2000000000000000;
    swift_bridgeObjectRetain();
    sub_22126D398(v4, v5);
    return v3;
  }
  return (id)v1;
}

id sub_22126DA90(uint64_t a1, unint64_t a2)
{
  return sub_221273174(a1, a2);
}

uint64_t sub_22126DAA8()
{
  uint64_t v1 = v0;
  int64_t v2 = sub_22126D324();
  type metadata accessor for DERMemoryWriter();
  uint64_t inited = swift_initStackObject();
  if (v2)
  {
    if (v2 <= 14)
    {
      uint64_t v5 = 0;
      unint64_t v6 = 0;
    }
    else
    {
      sub_22127D738();
      swift_allocObject();
      uint64_t v4 = sub_22127D728();
      if ((unint64_t)v2 > 0x7FFFFFFE)
      {
        sub_22127D828();
        uint64_t v5 = swift_allocObject();
        unint64_t v6 = v4 | 0x8000000000000000;
        *(void *)(v5 + 16) = 0;
        *(void *)(v5 + 24) = 0;
      }
      else
      {
        uint64_t v5 = 0;
        unint64_t v6 = v4 | 0x4000000000000000;
      }
    }
  }
  else
  {
    uint64_t v5 = 0;
    unint64_t v6 = 0xC000000000000000;
  }
  *(void *)(inited + 16) = v5;
  *(void *)(inited + 24) = v6;
  sub_22126D72C(v1);
  swift_beginAccess();
  return *(void *)(inited + 16);
}

id sub_22126DBC8()
{
  uint64_t v1 = *(void *)(v0 + 24);
  unint64_t v2 = *(void *)(v0 + 32);
  if ((v2 & 0x2000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
  }
  else
  {
    sub_22126D38C(*(void *)(v0 + 24), *(void *)(v0 + 32));
    id v3 = sub_221273174(v1, v2);
    sub_22126D398(v1, v2);
    uint64_t v4 = *(void *)(v0 + 24);
    unint64_t v5 = *(void *)(v0 + 32);
    *(void *)(v0 + 24) = v3;
    *(void *)(v0 + 32) = 0x2000000000000000;
    swift_bridgeObjectRetain();
    sub_22126D398(v4, v5);
    return v3;
  }
  return (id)v1;
}

uint64_t sub_22126DC80(uint64_t a1)
{
  sub_22127E088();
  unint64_t v3 = *(void *)(v1 + 24);
  unint64_t v4 = *(void *)(v1 + 32);
  if ((v4 & 0x2000000000000000) != 0)
  {
    if (v3 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t result = sub_22127DF08();
      uint64_t v5 = result;
      if (!result) {
        goto LABEL_12;
      }
    }
    else
    {
      uint64_t v5 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t result = swift_bridgeObjectRetain();
      if (!v5) {
        goto LABEL_12;
      }
    }
    if (v5 < 1)
    {
      __break(1u);
      return result;
    }
    if ((v3 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        MEMORY[0x223C7CCC0](i, v3);
        sub_22126DC80(a1);
        swift_unknownObjectRelease();
      }
    }
    else
    {
      unint64_t v8 = v3 + 32;
      do
      {
        v8 += 8;
        swift_retain();
        sub_22126DC80(a1);
        swift_release();
        --v5;
      }
      while (v5);
    }
  }
  else
  {
    sub_22125D744(v3, v4);
    sub_22127D8C8();
  }
LABEL_12:
  return sub_22126D398(v3, v4);
}

uint64_t sub_22126DDB0()
{
  uint64_t v1 = v0;
  unint64_t v2 = v0[3];
  unint64_t v3 = v0[4];
  if ((v3 & 0x2000000000000000) != 0)
  {
    if (v2 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_22127DF08();
      if (v8) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v8 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v8)
      {
LABEL_5:
        uint64_t v28 = MEMORY[0x263F8EE78];
        sub_221272DA4(0, v8 & ~(v8 >> 63), 0);
        if (v8 < 0)
        {
LABEL_29:
          __break(1u);
LABEL_30:
          __break(1u);
LABEL_31:
          __break(1u);
LABEL_32:
          __break(1u);
LABEL_33:
          __break(1u);
          JUMPOUT(0x22126E294);
        }
        uint64_t v9 = 0;
        do
        {
          if ((v2 & 0xC000000000000001) != 0) {
            uint64_t v10 = MEMORY[0x223C7CCC0](v9, v2);
          }
          else {
            uint64_t v10 = swift_retain();
          }
          uint64_t v11 = sub_22126DDB0(v10);
          uint64_t v13 = v12;
          swift_release();
          unint64_t v15 = *(void *)(v28 + 16);
          unint64_t v14 = *(void *)(v28 + 24);
          if (v15 >= v14 >> 1) {
            sub_221272DA4((char *)(v14 > 1), v15 + 1, 1);
          }
          ++v9;
          *(void *)(v28 + 16) = v15 + 1;
          uint64_t v16 = v28 + 16 * v15;
          *(void *)(v16 + 32) = v11;
          *(void *)(v16 + 40) = v13;
        }
        while (v8 != v9);
        sub_22126D398(v2, v3);
        uint64_t v1 = v0;
LABEL_26:
        sub_22125D79C(&qword_267F490F0);
        sub_22127343C();
        sub_22127DA28();
        swift_bridgeObjectRelease();
        sub_22127DE58();
        swift_bridgeObjectRelease();
        uint64_t v23 = v1[2];
        sub_22125D79C(&qword_267F49340);
        uint64_t v24 = swift_allocObject();
        uint64_t v25 = MEMORY[0x263F8D9D0];
        *(_OWORD *)(v24 + 16) = xmmword_221280F10;
        uint64_t v26 = MEMORY[0x263F8DA20];
        *(void *)(v24 + 56) = v25;
        *(void *)(v24 + 64) = v26;
        *(void *)(v24 + 32) = v23;
        sub_22127DAB8();
        sub_22127DB68();
        swift_bridgeObjectRelease();
        sub_22127DB68();
        sub_22127DB68();
        swift_bridgeObjectRelease();
        sub_22127DB68();
        return 0x203A676174207BLL;
      }
    }
    sub_22126D398(v2, v3);
    goto LABEL_26;
  }
  sub_22125D744(v2, v3);
  sub_22127DE58();
  swift_bridgeObjectRelease();
  uint64_t v4 = v0[2];
  sub_22125D79C(&qword_267F49340);
  uint64_t v5 = swift_allocObject();
  uint64_t v6 = MEMORY[0x263F8D9D0];
  *(_OWORD *)(v5 + 16) = xmmword_221280F10;
  uint64_t v7 = MEMORY[0x263F8DA20];
  *(void *)(v5 + 56) = v6;
  *(void *)(v5 + 64) = v7;
  *(void *)(v5 + 32) = v4;
  sub_22127DAB8();
  sub_22127DB68();
  swift_bridgeObjectRelease();
  sub_22127DB68();
  switch(v3 >> 62)
  {
    case 1uLL:
      if (!__OFSUB__(HIDWORD(v2), v2)) {
        break;
      }
      goto LABEL_30;
    case 2uLL:
      if (!__OFSUB__(*(void *)(v2 + 24), *(void *)(v2 + 16))) {
        break;
      }
      goto LABEL_31;
    default:
      break;
  }
  sub_22127DF88();
  sub_22127DB68();
  swift_bridgeObjectRelease();
  sub_22127DB68();
  switch(v3 >> 62)
  {
    case 0uLL:
      uint64_t v19 = BYTE6(v3);
      goto LABEL_22;
    case 1uLL:
      LODWORD(v19) = HIDWORD(v2) - v2;
      if (__OFSUB__(HIDWORD(v2), v2)) {
        goto LABEL_32;
      }
      uint64_t v19 = (int)v19;
LABEL_22:
      if (v19 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
LABEL_23:
      MEMORY[0x270FA5388](v17, v18);
      sub_22127DB18();
      sub_22127DB68();
      swift_bridgeObjectRelease();
      sub_22127DB68();
      sub_22126D398(v2, v3);
      return 0x203A676174207BLL;
    case 2uLL:
      uint64_t v21 = *(void *)(v2 + 16);
      uint64_t v20 = *(void *)(v2 + 24);
      BOOL v22 = __OFSUB__(v20, v21);
      uint64_t v19 = v20 - v21;
      if (!v22) {
        goto LABEL_22;
      }
      goto LABEL_33;
    case 3uLL:
      goto LABEL_23;
    default:
      JUMPOUT(0);
  }
}

uint64_t sub_22126E2B4(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  uint64_t v2 = sub_22126D3A4();
  unint64_t v4 = v3;
  uint64_t v5 = sub_22126D3A4();
  unint64_t v7 = v6;
  char v8 = sub_221273018(v2, v4, v5, v6);
  sub_22125C910(v5, v7);
  sub_22125C910(v2, v4);
  return v8 & 1;
}

uint64_t sub_22126E350(uint64_t a1)
{
  unint64_t v3 = *(void *)(v1 + 24);
  unint64_t v4 = *(void *)(v1 + 32);
  if ((v4 & 0x2000000000000000) != 0)
  {
    swift_bridgeObjectRetain();
    if (v3 >> 62) {
      goto LABEL_17;
    }
  }
  else
  {
    sub_22126D38C(*(void *)(v1 + 24), *(void *)(v1 + 32));
    unint64_t v5 = (unint64_t)sub_221273174(v3, v4);
    sub_22126D398(v3, v4);
    uint64_t v11 = *(void *)(v1 + 24);
    unint64_t v12 = *(void *)(v1 + 32);
    *(void *)(v1 + 24) = v5;
    *(void *)(v1 + 32) = 0x2000000000000000;
    swift_bridgeObjectRetain();
    sub_22126D398(v11, v12);
    unint64_t v3 = v5;
    if (v5 >> 62)
    {
LABEL_17:
      swift_bridgeObjectRetain();
      uint64_t v6 = sub_22127DF08();
      if (!v6) {
        goto LABEL_23;
      }
      goto LABEL_5;
    }
  }
  uint64_t v6 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v6)
  {
LABEL_23:
    swift_bridgeObjectRelease_n();
    return 0;
  }
LABEL_5:
  unint64_t v7 = v3 & 0xC000000000000001;
  if ((v3 & 0xC000000000000001) != 0) {
    goto LABEL_28;
  }
  uint64_t v8 = *(void *)(v3 + 32);
  swift_retain();
  while (*(void *)(v8 + 16) != a1)
  {
    swift_release();
    if (v6 == 1) {
      goto LABEL_23;
    }
    if (v7)
    {
      unint64_t v7 = 1;
      while (1)
      {
        uint64_t v9 = MEMORY[0x223C7CCC0](v7, v3);
        unint64_t v10 = v7 + 1;
        if (__OFADD__(v7, 1)) {
          break;
        }
        uint64_t v8 = v9;
        if (*(void *)(v9 + 16) == a1) {
          goto LABEL_8;
        }
        swift_unknownObjectRelease();
        ++v7;
        if (v10 == v6) {
          goto LABEL_23;
        }
      }
      __break(1u);
    }
    else
    {
      uint64_t v13 = 5;
      while (1)
      {
        uint64_t v14 = v13 - 3;
        if (__OFADD__(v13 - 4, 1)) {
          break;
        }
        uint64_t v8 = *(void *)(v3 + 8 * v13);
        if (*(void *)(v8 + 16) == a1)
        {
          swift_retain();
          goto LABEL_8;
        }
        ++v13;
        if (v14 == v6) {
          goto LABEL_23;
        }
      }
    }
    __break(1u);
LABEL_28:
    uint64_t v8 = MEMORY[0x223C7CCC0](0, v3);
  }
LABEL_8:
  swift_bridgeObjectRelease_n();
  return v8;
}

uint64_t sub_22126E540(uint64_t a1)
{
  unint64_t v3 = *(void *)(v1 + 24);
  unint64_t v4 = *(void *)(v1 + 32);
  if ((v4 & 0x2000000000000000) != 0)
  {
    uint64_t result = swift_bridgeObjectRetain();
  }
  else
  {
    sub_22126D38C(*(void *)(v1 + 24), *(void *)(v1 + 32));
    id v5 = sub_221273174(v3, v4);
    sub_22126D398(v3, v4);
    uint64_t v6 = *(void *)(v1 + 24);
    unint64_t v7 = *(void *)(v1 + 32);
    *(void *)(v1 + 24) = v5;
    *(void *)(v1 + 32) = 0x2000000000000000;
    swift_bridgeObjectRetain();
    uint64_t result = sub_22126D398(v6, v7);
    unint64_t v3 = (unint64_t)v5;
  }
  uint64_t v12 = MEMORY[0x263F8EE78];
  if (!(v3 >> 62))
  {
    uint64_t v9 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v9) {
      goto LABEL_6;
    }
LABEL_18:
    swift_bridgeObjectRelease();
    return v12;
  }
  swift_bridgeObjectRetain();
  uint64_t v9 = sub_22127DF08();
  uint64_t result = swift_bridgeObjectRelease();
  if (!v9) {
    goto LABEL_18;
  }
LABEL_6:
  if (v9 >= 1)
  {
    if ((v3 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)(MEMORY[0x223C7CCC0](i, v3) + 16) == a1)
        {
          sub_22127DE98();
          sub_22127DEB8();
          sub_22127DEC8();
          sub_22127DEA8();
        }
        else
        {
          swift_unknownObjectRelease();
        }
      }
    }
    else
    {
      for (uint64_t j = 0; j != v9; ++j)
      {
        if (*(void *)(*(void *)(v3 + 8 * j + 32) + 16) == a1)
        {
          swift_retain();
          sub_22127DE98();
          sub_22127DEB8();
          sub_22127DEC8();
          sub_22127DEA8();
        }
      }
    }
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

void *sub_22126E740(uint64_t a1, char a2)
{
  sub_22125D79C(&qword_267F49160);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_221280F10;
  *(unsigned char *)(v4 + 32) = a2;
  uint64_t v5 = sub_22126A180(v4);
  uint64_t v7 = v6;
  swift_bridgeObjectRelease();
  type metadata accessor for TLV();
  uint64_t result = (void *)swift_allocObject();
  result[2] = a1;
  result[3] = v5;
  result[4] = v7;
  return result;
}

void *sub_22126E7C4(uint64_t a1, unsigned int a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  __int16 v7 = bswap32(a2) >> 16;
  uint64_t v3 = sub_2212689A8((uint64_t)&v7, (uint64_t)&v8);
  uint64_t v5 = v4;
  type metadata accessor for TLV();
  uint64_t result = (void *)swift_allocObject();
  result[2] = a1;
  result[3] = v3;
  result[4] = v5;
  return result;
}

void *sub_22126E85C(uint64_t a1, unsigned int a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  unsigned int v7 = bswap32(a2);
  uint64_t v3 = sub_2212689A8((uint64_t)&v7, (uint64_t)&v8);
  uint64_t v5 = v4;
  type metadata accessor for TLV();
  uint64_t result = (void *)swift_allocObject();
  result[2] = a1;
  result[3] = v3;
  result[4] = v5;
  return result;
}

void *sub_22126E8F0(uint64_t a1, unint64_t a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  unint64_t v7 = bswap64(a2);
  uint64_t v3 = sub_2212689A8((uint64_t)&v7, (uint64_t)&v8);
  uint64_t v5 = v4;
  type metadata accessor for TLV();
  uint64_t result = (void *)swift_allocObject();
  result[2] = a1;
  result[3] = v3;
  result[4] = v5;
  return result;
}

uint64_t sub_22126E984()
{
  uint64_t v0 = sub_22126D3A4();
  unint64_t v2 = v1;
  __int16 v3 = sub_22126B5E8(v0, v1);
  sub_22125C910(v0, v2);
  return v3 & 0x1FF;
}

uint64_t sub_22126E9D4()
{
  unint64_t v1 = *(void *)(v0 + 24);
  unint64_t v2 = *(void *)(v0 + 32);
  if ((v2 & 0x2000000000000000) != 0)
  {
    __int16 v3 = self;
    swift_bridgeObjectRetain();
    id v4 = objc_msgSend(v3, sel_outputStreamToMemory);
    objc_msgSend(v4, sel_open);
    if (v1 >> 62) {
      goto LABEL_25;
    }
    uint64_t v5 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v5)
    {
LABEL_12:
      sub_22126D398(v1, v2);
      objc_msgSend(v4, sel_close);
      if (!objc_msgSend(v4, sel_propertyForKey_, *MEMORY[0x263EFF590])) {
        goto LABEL_29;
      }
      sub_22127DE38();

      swift_unknownObjectRelease();
      sub_22125C968(&v23, &v24);
      swift_dynamicCast();
      unint64_t v1 = v21;
      unint64_t v2 = v22;
      goto LABEL_14;
    }
LABEL_5:
    uint64_t v6 = 4;
    while (1)
    {
      uint64_t v7 = v6 - 4;
      if ((v1 & 0xC000000000000001) != 0)
      {
        uint64_t v8 = (unint64_t *)MEMORY[0x223C7CCC0](v6 - 4, v1);
        BOOL v9 = __OFADD__(v7, 1);
        uint64_t v10 = v6 - 3;
        if (v9) {
          goto LABEL_24;
        }
      }
      else
      {
        uint64_t v8 = *(unint64_t **)(v1 + 8 * v6);
        swift_retain();
        BOOL v9 = __OFADD__(v7, 1);
        uint64_t v10 = v6 - 3;
        if (v9)
        {
LABEL_24:
          __break(1u);
LABEL_25:
          swift_bridgeObjectRetain();
          uint64_t v5 = sub_22127DF08();
          sub_22126D398(v1, v2);
          if (!v5) {
            goto LABEL_12;
          }
          goto LABEL_5;
        }
      }
      sub_22126D5A8(v8);
      swift_release();
      ++v6;
      if (v10 == v5) {
        goto LABEL_12;
      }
    }
  }
  sub_22125D744(*(void *)(v0 + 24), *(void *)(v0 + 32));
LABEL_14:
  switch(v2 >> 62)
  {
    case 1uLL:
      sub_22125C910(v1, v2);
      LODWORD(v11) = HIDWORD(v1) - v1;
      if (__OFSUB__(HIDWORD(v1), v1))
      {
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
        swift_unexpectedError();
        __break(1u);
        JUMPOUT(0x22126ECA8);
      }
      uint64_t v11 = (int)v11;
LABEL_19:
      if (v11 == 2)
      {
        uint64_t v14 = sub_22126D3A4();
        unint64_t v16 = v15;
        unsigned __int16 v17 = sub_22126B794(1, v14, v15);
        sub_22125C910(v14, v16);
        int v18 = 0;
        int v19 = v17;
      }
      else
      {
LABEL_22:
        int v19 = 0;
        int v18 = 1;
      }
      return v19 | (v18 << 16);
    case 2uLL:
      uint64_t v13 = *(void *)(v1 + 16);
      uint64_t v12 = *(void *)(v1 + 24);
      sub_22125C910(v1, v2);
      uint64_t v11 = v12 - v13;
      if (!__OFSUB__(v12, v13)) {
        goto LABEL_19;
      }
      goto LABEL_28;
    case 3uLL:
      sub_22125C910(v1, v2);
      goto LABEL_22;
    default:
      sub_22125C910(v1, v2);
      uint64_t v11 = BYTE6(v2);
      goto LABEL_19;
  }
}

unint64_t sub_22126ECB8()
{
  unint64_t v1 = *(void *)(v0 + 24);
  unint64_t v2 = *(void *)(v0 + 32);
  if ((v2 & 0x2000000000000000) != 0)
  {
    __int16 v3 = self;
    swift_bridgeObjectRetain();
    id v4 = objc_msgSend(v3, sel_outputStreamToMemory);
    objc_msgSend(v4, sel_open);
    if (v1 >> 62) {
      goto LABEL_25;
    }
    uint64_t v5 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v5)
    {
LABEL_12:
      sub_22126D398(v1, v2);
      objc_msgSend(v4, sel_close);
      if (!objc_msgSend(v4, sel_propertyForKey_, *MEMORY[0x263EFF590])) {
        goto LABEL_29;
      }
      sub_22127DE38();

      swift_unknownObjectRelease();
      sub_22125C968(&v23, &v24);
      swift_dynamicCast();
      unint64_t v1 = v21;
      unint64_t v2 = v22;
      goto LABEL_14;
    }
LABEL_5:
    uint64_t v6 = 4;
    while (1)
    {
      uint64_t v7 = v6 - 4;
      if ((v1 & 0xC000000000000001) != 0)
      {
        uint64_t v8 = (unint64_t *)MEMORY[0x223C7CCC0](v6 - 4, v1);
        BOOL v9 = __OFADD__(v7, 1);
        uint64_t v10 = v6 - 3;
        if (v9) {
          goto LABEL_24;
        }
      }
      else
      {
        uint64_t v8 = *(unint64_t **)(v1 + 8 * v6);
        swift_retain();
        BOOL v9 = __OFADD__(v7, 1);
        uint64_t v10 = v6 - 3;
        if (v9)
        {
LABEL_24:
          __break(1u);
LABEL_25:
          swift_bridgeObjectRetain();
          uint64_t v5 = sub_22127DF08();
          sub_22126D398(v1, v2);
          if (!v5) {
            goto LABEL_12;
          }
          goto LABEL_5;
        }
      }
      sub_22126D5A8(v8);
      swift_release();
      ++v6;
      if (v10 == v5) {
        goto LABEL_12;
      }
    }
  }
  sub_22125D744(*(void *)(v0 + 24), *(void *)(v0 + 32));
LABEL_14:
  switch(v2 >> 62)
  {
    case 1uLL:
      sub_22125C910(v1, v2);
      LODWORD(v11) = HIDWORD(v1) - v1;
      if (__OFSUB__(HIDWORD(v1), v1))
      {
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
        swift_unexpectedError();
        __break(1u);
        JUMPOUT(0x22126EF94);
      }
      uint64_t v11 = (int)v11;
LABEL_19:
      if (v11 == 4)
      {
        uint64_t v14 = sub_22126D3A4();
        unint64_t v16 = v15;
        unsigned int v17 = sub_22126BAD8(1, v14, v15);
        sub_22125C910(v14, v16);
        unsigned __int8 v18 = 0;
        uint64_t v19 = v17;
      }
      else
      {
LABEL_22:
        uint64_t v19 = 0;
        unsigned __int8 v18 = 1;
      }
      LOBYTE(v24) = v18;
      return v19 | ((unint64_t)v18 << 32);
    case 2uLL:
      uint64_t v13 = *(void *)(v1 + 16);
      uint64_t v12 = *(void *)(v1 + 24);
      sub_22125C910(v1, v2);
      uint64_t v11 = v12 - v13;
      if (!__OFSUB__(v12, v13)) {
        goto LABEL_19;
      }
      goto LABEL_28;
    case 3uLL:
      sub_22125C910(v1, v2);
      goto LABEL_22;
    default:
      sub_22125C910(v1, v2);
      uint64_t v11 = BYTE6(v2);
      goto LABEL_19;
  }
}

unint64_t sub_22126EFA4()
{
  unint64_t v1 = *(void *)(v0 + 24);
  unint64_t v2 = *(void *)(v0 + 32);
  if ((v2 & 0x2000000000000000) != 0)
  {
    __int16 v3 = self;
    swift_bridgeObjectRetain();
    id v4 = objc_msgSend(v3, sel_outputStreamToMemory);
    objc_msgSend(v4, sel_open);
    if (v1 >> 62) {
      goto LABEL_25;
    }
    uint64_t v5 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v5)
    {
LABEL_12:
      sub_22126D398(v1, v2);
      objc_msgSend(v4, sel_close);
      if (!objc_msgSend(v4, sel_propertyForKey_, *MEMORY[0x263EFF590])) {
        goto LABEL_29;
      }
      sub_22127DE38();

      swift_unknownObjectRelease();
      sub_22125C968(&v21, &v22);
      swift_dynamicCast();
      unint64_t v1 = v19;
      unint64_t v2 = v20;
      goto LABEL_14;
    }
LABEL_5:
    uint64_t v6 = 4;
    while (1)
    {
      uint64_t v7 = v6 - 4;
      if ((v1 & 0xC000000000000001) != 0)
      {
        uint64_t v8 = (unint64_t *)MEMORY[0x223C7CCC0](v6 - 4, v1);
        BOOL v9 = __OFADD__(v7, 1);
        uint64_t v10 = v6 - 3;
        if (v9) {
          goto LABEL_24;
        }
      }
      else
      {
        uint64_t v8 = *(unint64_t **)(v1 + 8 * v6);
        swift_retain();
        BOOL v9 = __OFADD__(v7, 1);
        uint64_t v10 = v6 - 3;
        if (v9)
        {
LABEL_24:
          __break(1u);
LABEL_25:
          swift_bridgeObjectRetain();
          uint64_t v5 = sub_22127DF08();
          sub_22126D398(v1, v2);
          if (!v5) {
            goto LABEL_12;
          }
          goto LABEL_5;
        }
      }
      sub_22126D5A8(v8);
      swift_release();
      ++v6;
      if (v10 == v5) {
        goto LABEL_12;
      }
    }
  }
  sub_22125D744(*(void *)(v0 + 24), *(void *)(v0 + 32));
LABEL_14:
  switch(v2 >> 62)
  {
    case 1uLL:
      sub_22125C910(v1, v2);
      LODWORD(v11) = HIDWORD(v1) - v1;
      if (__OFSUB__(HIDWORD(v1), v1))
      {
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
        swift_unexpectedError();
        __break(1u);
        JUMPOUT(0x22126F274);
      }
      uint64_t v11 = (int)v11;
LABEL_19:
      if (v11 != 8) {
        return 0;
      }
      uint64_t v14 = sub_22126D3A4();
      unint64_t v16 = v15;
      unint64_t v17 = sub_22126BE44(1, v14, v15);
      sub_22125C910(v14, v16);
      return v17;
    case 2uLL:
      uint64_t v13 = *(void *)(v1 + 16);
      uint64_t v12 = *(void *)(v1 + 24);
      sub_22125C910(v1, v2);
      uint64_t v11 = v12 - v13;
      if (!__OFSUB__(v12, v13)) {
        goto LABEL_19;
      }
      goto LABEL_28;
    case 3uLL:
      sub_22125C910(v1, v2);
      return 0;
    default:
      sub_22125C910(v1, v2);
      uint64_t v11 = BYTE6(v2);
      goto LABEL_19;
  }
}

uint64_t sub_22126F284()
{
  type metadata accessor for TLV();
  uint64_t result = swift_initStaticObject();
  qword_267F4B1B8 = result;
  return result;
}

uint64_t *sub_22126F2B0()
{
  if (qword_267F49250 != -1) {
    swift_once();
  }
  return &qword_267F4B1B8;
}

uint64_t sub_22126F2FC()
{
  type metadata accessor for TLV();
  return swift_initStaticObject();
}

void *sub_22126F32C(uint64_t a1, char *a2, char *a3, uint64_t a4)
{
  uint64_t v81 = a1;
  unint64_t v6 = *(void *)(a4 + 8);
  uint64_t v7 = *(void (**)(void, void))(*(void *)(v6 + 24) + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11.n128_f64[0] = MEMORY[0x270FA5388](v9, v10);
  v92 = (char *)&v80 - v12;
  uint64_t v85 = *((void *)a3 - 1);
  v14.n128_f64[0] = MEMORY[0x270FA5388](v11, v13);
  uint64_t v83 = (char *)&v80 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17.n128_f64[0] = MEMORY[0x270FA5388](v14, v16);
  uint64_t v86 = (char *)&v80 - v18;
  v20.n128_f64[0] = MEMORY[0x270FA5388](v17, v19);
  v90 = (char *)&v80 - v21;
  v23.n128_f64[0] = MEMORY[0x270FA5388](v20, v22);
  uint64_t v25 = (char *)&v80 - v24;
  v27.n128_f64[0] = MEMORY[0x270FA5388](v23, v26);
  uint64_t v29 = (char *)&v80 - v28;
  v31.n128_f64[0] = MEMORY[0x270FA5388](v27, v30);
  unint64_t v33 = (char *)&v80 - v32;
  MEMORY[0x270FA5388](v31, v34);
  v89 = (char *)&v80 - v35;
  char v36 = sub_22127DE28();
  v87 = v7;
  v88 = v25;
  uint64_t v91 = AssociatedTypeWitness;
  v93 = v33;
  if (v36)
  {
    if (sub_22127DE18() >= 64)
    {
      uint64_t v98 = 0;
      sub_221273498();
      sub_22127DDD8();
      sub_22127DA48();
      (*(void (**)(char *, char *))(v85 + 8))(v33, a3);
    }
    else
    {
      uint64_t v37 = v85;
      (*(void (**)(char *, char *, char *))(v85 + 16))(v33, a2, a3);
      sub_22127DE08();
      (*(void (**)(char *, char *))(v37 + 8))(v33, a3);
    }
  }
  else
  {
    char v38 = sub_22127DE28();
    uint64_t v39 = sub_22127DE18();
    if (v38)
    {
      if (v39 <= 64)
      {
        swift_getAssociatedConformanceWitness();
        sub_22127DFD8();
        unint64_t v42 = v93;
        sub_22127DF98();
        char v43 = sub_22127DA48();
        uint64_t v44 = v85;
        unint64_t v45 = *(void (**)(char *, char *))(v85 + 8);
        v45(v42, a3);
        (*(void (**)(char *, char *, char *))(v44 + 16))(v29, a2, a3);
        if ((v43 & 1) == 0) {
          sub_22127DE08();
        }
        v45(v29, a3);
        uint64_t v7 = v87;
        uint64_t v25 = v88;
      }
      else
      {
        uint64_t v98 = 0;
        sub_221273498();
        BOOL v40 = v93;
        sub_22127DDD8();
        sub_22127DA48();
        (*(void (**)(char *, char *))(v85 + 8))(v40, a3);
      }
    }
    else if (v39 < 64)
    {
      uint64_t v41 = v85;
      (*(void (**)(char *, char *, char *))(v85 + 16))(v93, a2, a3);
      sub_22127DE08();
      (*(void (**)(char *, char *))(v41 + 8))(v93, a3);
    }
  }
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  sub_22127DFD8();
  sub_22127DF98();
  uint64_t v48 = v85 + 16;
  id v47 = *(void (**)(char *, char *, char *))(v85 + 16);
  v80 = a2;
  uint64_t v84 = v47;
  v47(v25, a2, a3);
  v94 = (char **)(v48 - 8);
  uint64_t v85 = v48;
  v82 = (void (**)(char *, char *, char *))(v48 + 16);
  unint64_t v49 = (char *)MEMORY[0x263F8EE78];
  uint64_t v95 = AssociatedConformanceWitness;
  do
  {
    id v96 = v49;
    sub_22127DFD8();
    unint64_t v50 = v93;
    sub_22127DF98();
    id v51 = (char *)v7;
    id v52 = v90;
    sub_22127DDE8();
    char v53 = (char)v94;
    unint64_t v49 = *v94;
    ((void (*)(char *, char *))*v94)(v50, a3);
    if (sub_22127DE28())
    {
      sub_22127DFD8();
      sub_22127DF98();
      int64_t v54 = sub_22127DA58();
      ((void (*)(char *, char *))v49)(v50, a3);
      if ((v54 & 1) == 0)
      {
        __break(1u);
LABEL_39:
        __break(1u);
        goto LABEL_40;
      }
    }
    v97 = v49;
    if (sub_22127DE18() >= 8)
    {
      v84(v86, v52, a3);
      LOBYTE(v98) = -1;
      char v56 = sub_22127DE28();
      uint64_t v57 = sub_22127DE18();
      if (v56)
      {
        char v53 = (char)v94;
        if (v57 <= 8)
        {
          sub_22127DFD8();
          id v58 = v93;
          sub_22127DF98();
          char v59 = v86;
          char v60 = sub_22127DA38();
          uint64_t v61 = a3;
          unint64_t v49 = a3;
          id v62 = v97;
          ((void (*)(char *, char *))v97)(v58, v61);
          unsigned int v63 = v98;
          char v64 = v53;
          uint64_t v65 = v83;
          (*v82)(v83, v59, v49);
          if (v60)
          {
            int64_t v54 = sub_22127DE08();
            ((void (*)(char *, char *))v62)(v65, v49);
            id v52 = v90;
            char v53 = v64;
            a3 = v49;
            if (v63 < v54) {
              goto LABEL_39;
            }
          }
          else
          {
            ((void (*)(char *, char *))v62)(v65, v49);
            id v52 = v90;
            a3 = v49;
          }
          goto LABEL_28;
        }
LABEL_23:
        sub_2212734EC();
        uint64_t v66 = v93;
        sub_22127DDD8();
        id v67 = v86;
        int64_t v54 = sub_22127DA48();
        v68 = v66;
        id v69 = v97;
        ((void (*)(char *, char *))v97)(v68, a3);
        ((void (*)(char *, char *))v69)(v67, a3);
        if (v54) {
          goto LABEL_39;
        }
        goto LABEL_28;
      }
      char v53 = (char)v94;
      if (v57 >= 9) {
        goto LABEL_23;
      }
      uint64_t v70 = v86;
      int64_t v54 = sub_22127DE08();
      ((void (*)(char *, char *))v97)(v70, a3);
      unint64_t v55 = v98;
      if (v98 < v54) {
        goto LABEL_39;
      }
    }
LABEL_28:
    char v71 = sub_22127DE08();
    id v51 = v97;
    ((void (*)(char *, char *))v97)(v52, a3);
    unint64_t v49 = v96;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      unint64_t v49 = sub_22126AEB4(0, *((void *)v49 + 2) + 1, 1, v49);
    }
    unint64_t v73 = *((void *)v49 + 2);
    unint64_t v72 = *((void *)v49 + 3);
    if (v73 >= v72 >> 1) {
      unint64_t v49 = sub_22126AEB4((char *)(v72 > 1), v73 + 1, 1, v49);
    }
    *((void *)v49 + 2) = v73 + 1;
    v49[v73 + 32] = v71;
    uint64_t v98 = 8;
    sub_221273498();
    char v53 = (char)v88;
    sub_22127DDF8();
    char v74 = sub_22127DA68();
    uint64_t v7 = v87;
  }
  while ((v74 & 1) == 0);
  int64_t v54 = (int64_t)v89;
  int v75 = sub_22127DE08();
  unint64_t v6 = *((void *)v49 + 2);
  if (!v6)
  {
LABEL_40:
    __break(1u);
LABEL_41:
    unint64_t v49 = sub_22126AEB4((char *)(v55 > 1), v54, 1, v49);
    goto LABEL_36;
  }
  char v53 = v75;
  if (((v49[v6 + 31] ^ v75) & 0x80) == 0) {
    goto LABEL_37;
  }
  unint64_t v55 = *((void *)v49 + 3);
  int64_t v54 = v6 + 1;
  if (v6 >= v55 >> 1) {
    goto LABEL_41;
  }
LABEL_36:
  *((void *)v49 + 2) = v54;
  v49[v6 + 32] = v53;
LABEL_37:
  uint64_t v76 = sub_221268A64((uint64_t)v49);
  uint64_t v78 = v77;
  ((void (*)(char *, char *))v51)(v80, a3);
  ((void (*)(char *, char *))v51)(v88, a3);
  ((void (*)(char *, char *))v51)(v89, a3);
  type metadata accessor for TLV();
  uint64_t result = (void *)swift_allocObject();
  result[2] = v81;
  result[3] = v76;
  result[4] = v78;
  return result;
}

void *sub_22126FE2C(uint64_t a1, uint64_t a2, unint64_t a3, char a4)
{
  sub_22125D79C(&qword_267F49160);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_221280F10;
  *(unsigned char *)(v8 + 32) = a4;
  uint64_t v9 = sub_22126A180(v8);
  unint64_t v11 = v10;
  swift_bridgeObjectRelease();
  sub_22125D744(a2, a3);
  sub_22125D744(v9, v11);
  sub_2212690F4(a2, a3);
  sub_22125C910(a2, a3);
  sub_22125C910(v9, v11);
  sub_22125C910(a2, a3);
  type metadata accessor for TLV();
  uint64_t result = (void *)swift_allocObject();
  result[2] = a1;
  result[3] = v9;
  result[4] = v11;
  return result;
}

void *sub_22126FF24(uint64_t a1, void *a2)
{
  uint64_t v3 = sub_22127BA9C(a2);
  uint64_t v5 = v4;
  swift_bridgeObjectRelease();
  type metadata accessor for TLV();
  uint64_t result = (void *)swift_allocObject();
  result[2] = a1;
  result[3] = v3;
  result[4] = v5;
  return result;
}

void *sub_22126FF80(uint64_t a1)
{
  uint64_t v2 = sub_22127DAD8();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v4, v5);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22127DAC8();
  uint64_t v8 = sub_22127DA98();
  unint64_t v10 = v9;
  swift_bridgeObjectRelease();
  uint64_t result = (void *)(*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v7, v2);
  if (v10 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    type metadata accessor for TLV();
    uint64_t result = (void *)swift_allocObject();
    result[2] = a1;
    result[3] = v8;
    result[4] = v10;
  }
  return result;
}

BOOL sub_2212700A8()
{
  uint64_t v1 = *(void *)(v0 + 24);
  unint64_t v2 = *(void *)(v0 + 32);
  if ((v2 & 0x2000000000000000) == 0)
  {
    sub_22125D744(*(void *)(v0 + 24), *(void *)(v0 + 32));
    goto LABEL_14;
  }
  uint64_t v3 = self;
  swift_bridgeObjectRetain();
  id v4 = objc_msgSend(v3, sel_outputStreamToMemory);
  objc_msgSend(v4, sel_open);
  if ((unint64_t)v1 >> 62) {
    goto LABEL_21;
  }
  uint64_t v5 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v5)
  {
LABEL_5:
    uint64_t v6 = 4;
    do
    {
      uint64_t v7 = v6 - 4;
      if ((v1 & 0xC000000000000001) != 0)
      {
        uint64_t v8 = (unint64_t *)MEMORY[0x223C7CCC0](v6 - 4, v1);
        BOOL v9 = __OFADD__(v7, 1);
        uint64_t v10 = v6 - 3;
        if (v9) {
          goto LABEL_20;
        }
      }
      else
      {
        uint64_t v8 = *(unint64_t **)(v1 + 8 * v6);
        swift_retain();
        BOOL v9 = __OFADD__(v7, 1);
        uint64_t v10 = v6 - 3;
        if (v9)
        {
LABEL_20:
          __break(1u);
LABEL_21:
          swift_bridgeObjectRetain();
          uint64_t v5 = sub_22127DF08();
          sub_22126D398(v1, v2);
          if (!v5) {
            break;
          }
          goto LABEL_5;
        }
      }
      sub_22126D5A8(v8);
      swift_release();
      ++v6;
    }
    while (v10 != v5);
  }
  sub_22126D398(v1, v2);
  objc_msgSend(v4, sel_close);
  if (!objc_msgSend(v4, sel_propertyForKey_, *MEMORY[0x263EFF590]))
  {
    __break(1u);
    swift_unexpectedError();
    __break(1u);
    JUMPOUT(0x221270328);
  }
  sub_22127DE38();

  swift_unknownObjectRelease();
  sub_22125C968(&v16, &v17);
  swift_dynamicCast();
  uint64_t v1 = v14;
  unint64_t v2 = v15;
LABEL_14:
  switch(v2 >> 62)
  {
    case 1uLL:
      sub_22125C910(v1, v2);
      uint64_t v11 = (int)v1;
      uint64_t v12 = v1 >> 32;
      break;
    case 2uLL:
      uint64_t v11 = *(void *)(v1 + 16);
      uint64_t v12 = *(void *)(v1 + 24);
      sub_22125C910(v1, v2);
      break;
    case 3uLL:
      sub_22125C910(v1, v2);
      uint64_t v12 = 0;
      uint64_t v11 = 0;
      break;
    default:
      sub_22125C910(v1, v2);
      uint64_t v11 = 0;
      uint64_t v12 = BYTE6(v2);
      break;
  }
  return v11 == v12;
}

uint64_t sub_221270338()
{
  uint64_t v0 = sub_22126D3A4();
  unint64_t v2 = v1;
  __int16 v3 = sub_22126B5E8(v0, v1);
  sub_22125C910(v0, v2);
  if ((v3 & 0x100) != 0) {
    return 2;
  }
  else {
    return v3 != 0;
  }
}

uint64_t sub_221270390()
{
  uint64_t v0 = sub_22127D918();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v2, v3);
  uint64_t v5 = &v24[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_22126D3A4();
  unint64_t v8 = v7;
  __int16 v9 = sub_22126B5E8(v6, v7);
  sub_22125C910(v6, v8);
  if ((v9 & 0x100) != 0) {
    return 0;
  }
  unint64_t v10 = sub_22126D3A4();
  int v12 = v10;
  unsigned __int8 v13 = BYTE6(v11);
  switch(v11 >> 62)
  {
    case 1uLL:
      unint64_t v15 = HIDWORD(v10);
      sub_22125C910(v10, v11);
      LODWORD(v14) = v15 - v12;
      if (__OFSUB__(v15, v12))
      {
        __break(1u);
LABEL_17:
        __break(1u);
        JUMPOUT(0x221270644);
      }
      uint64_t v14 = (int)v14;
LABEL_7:
      if (v14 > 7) {
        return 0;
      }
LABEL_10:
      uint64_t v19 = sub_22126D3A4();
      uint64_t v18 = (uint64_t)(__int16)(v9 << 8) >> 15;
      uint64_t v21 = v19;
      unint64_t v22 = v20;
      switch(v20 >> 62)
      {
        case 1uLL:
        case 2uLL:
          sub_22125D744(v19, v20);
          sub_22125D744(v21, v22);
          break;
        default:
          break;
      }
      sub_22127D928();
      sub_22125C910(v21, v22);
      sub_22127361C((unint64_t *)&qword_267F492E0, 255, MEMORY[0x263F06F40]);
      sub_22127DD98();
      if ((v25 & 1) == 0)
      {
        do
        {
          uint64_t v18 = v24[14] | (unint64_t)(v18 << 8);
          sub_22127DD98();
        }
        while (v25 != 1);
      }
      (*(void (**)(unsigned char *, uint64_t))(v1 + 8))(v5, v0);
      sub_22125C910(v21, v22);
      break;
    case 2uLL:
      uint64_t v17 = *(void *)(v10 + 16);
      uint64_t v16 = *(void *)(v10 + 24);
      sub_22125C910(v10, v11);
      uint64_t v14 = v16 - v17;
      if (!__OFSUB__(v16, v17)) {
        goto LABEL_7;
      }
      goto LABEL_17;
    case 3uLL:
      sub_22125C910(v10, v11);
      goto LABEL_10;
    default:
      sub_22125C910(v10, v11);
      uint64_t v14 = v13;
      goto LABEL_7;
  }
  return v18;
}

uint64_t sub_221270664()
{
  uint64_t v0 = sub_22126D3A4();
  return sub_221269F04(v0, v1);
}

uint64_t sub_22127068C()
{
  uint64_t v0 = sub_22126D3A4();
  return sub_22127CAF0(v0, v1);
}

uint64_t sub_2212706B4()
{
  sub_22127DAD8();
  MEMORY[0x270FA5388](v0, v1);
  uint64_t v2 = sub_22126D3A4();
  unint64_t v4 = v3;
  sub_22127DAC8();
  uint64_t v5 = sub_22127DAA8();
  sub_22125C910(v2, v4);
  return v5;
}

uint64_t sub_221270760()
{
  sub_22126D398(*(void *)(v0 + 24), *(void *)(v0 + 32));
  return v0;
}

uint64_t sub_221270780()
{
  sub_22126D398(*(void *)(v0 + 24), *(void *)(v0 + 32));
  return MEMORY[0x270FA0228](v0, 40, 7);
}

uint64_t sub_2212707B8()
{
  sub_22127E078();
  sub_22126DC80((uint64_t)v1);
  return sub_22127E0A8();
}

uint64_t sub_2212707F8(uint64_t a1, uint64_t a2)
{
  if (*(void *)(*(void *)a1 + 16) != *(void *)(*(void *)a2 + 16)) {
    return 0;
  }
  uint64_t v2 = sub_22126D3A4();
  unint64_t v4 = v3;
  uint64_t v5 = sub_22126D3A4();
  unint64_t v7 = v6;
  char v8 = sub_221273018(v2, v4, v5, v6);
  sub_22125C910(v5, v7);
  sub_22125C910(v2, v4);
  return v8 & 1;
}

uint64_t sub_221270894()
{
  sub_22127E078();
  sub_22126DC80((uint64_t)v1);
  return sub_22127E0A8();
}

uint64_t sub_2212708D8(uint64_t a1)
{
  return sub_22126DC80(a1);
}

uint64_t sub_2212708FC()
{
  sub_22127E078();
  sub_22126DC80((uint64_t)v1);
  return sub_22127E0A8();
}

uint64_t sub_22127093C()
{
  return sub_22126DDB0();
}

uint64_t sub_221270960()
{
  sub_22127DC68();
  return v1;
}

uint64_t sub_2212709CC()
{
  uint64_t v0 = sub_22126DAA8();
  unint64_t v2 = v1;
  sub_22127D8E8();
  return sub_22125C910(v0, v2);
}

uint64_t sub_221270A28()
{
  sub_22127DC48();
  return v1;
}

uint64_t sub_221270A84(uint64_t a1, uint64_t a2, __n128 a3, __n128 a4)
{
  double v7 = MEMORY[0x270FA5388](a3, a4);
  (*(void (**)(unsigned char *, uint64_t, uint64_t, double))(v9 + 16))(&v11[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)], v4, a2, v7);
  uint64_t v12 = a1;
  return sub_22127DC58();
}

uint64_t sub_221270B7C(uint64_t a1)
{
  sub_22127DD98();
  uint64_t result = v4;
  if (v4)
  {
    if (*(void *)(v4 + 16) == a1) {
      return result;
    }
    swift_release();
  }
  sub_22126CE04();
  swift_allocError();
  *unint64_t v3 = 3;
  return swift_willThrow();
}

uint64_t sub_221270C04(uint64_t a1)
{
  uint64_t result = sub_221270B7C(a1);
  if (!v1)
  {
    uint64_t v3 = sub_22126D3A4();
    swift_release();
    return v3;
  }
  return result;
}

uint64_t sub_221270C58(uint64_t a1)
{
  sub_221270B7C(a1);
  if (!v1)
  {
    uint64_t v3 = sub_22126D3A4();
    unint64_t v5 = v4;
    uint64_t v2 = sub_22126B5E8(v3, v4);
    sub_22125C910(v3, v5);
    swift_release();
    if ((v2 & 0x100) != 0)
    {
      sub_22126CE04();
      swift_allocError();
      *unint64_t v6 = 4;
      swift_willThrow();
    }
  }
  return v2;
}

uint64_t sub_221270CF8(uint64_t a1)
{
  sub_221270B7C(a1);
  if (!v2)
  {
    uint64_t v1 = sub_22126E9D4();
    swift_release();
    if ((v1 & 0x10000) != 0)
    {
      sub_22126CE04();
      swift_allocError();
      *uint64_t v3 = 4;
      swift_willThrow();
    }
  }
  return v1;
}

unint64_t sub_221270D7C(uint64_t a1)
{
  sub_221270B7C(a1);
  if (!v2)
  {
    unint64_t v1 = sub_22126ECB8();
    swift_release();
    if ((v1 & 0x100000000) != 0)
    {
      sub_22126CE04();
      swift_allocError();
      *uint64_t v3 = 4;
      swift_willThrow();
    }
  }
  return v1;
}

uint64_t sub_221270E00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2212710AC(a1, a2, a3, (uint64_t (*)(void))sub_22126EFA4);
}

char *sub_221270E2C(uint64_t a1)
{
  sub_22127DAD8();
  MEMORY[0x270FA5388](v3, v4);
  unint64_t v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_221270B7C(a1);
  if (!v1)
  {
    uint64_t v7 = sub_22126D3A4();
    unint64_t v9 = v8;
    sub_22127DAC8();
    unint64_t v6 = (char *)sub_22127DAA8();
    uint64_t v11 = v10;
    sub_22125C910(v7, v9);
    swift_release();
    if (!v11)
    {
      sub_22126CE04();
      swift_allocError();
      *unsigned __int8 v13 = 4;
      swift_willThrow();
    }
  }
  return v6;
}

uint64_t sub_221270F58(uint64_t a1)
{
  uint64_t result = sub_221270B7C(a1);
  if (!v1)
  {
    BOOL v3 = sub_2212700A8();
    uint64_t result = swift_release();
    if (!v3)
    {
      sub_22126CE04();
      swift_allocError();
      *__n128 v4 = 4;
      return swift_willThrow();
    }
  }
  return result;
}

BOOL sub_221270FD4(uint64_t a1)
{
  sub_221270B7C(a1);
  if (!v1)
  {
    uint64_t v3 = sub_22126D3A4();
    unint64_t v5 = v4;
    __int16 v6 = sub_22126B5E8(v3, v4);
    sub_22125C910(v3, v5);
    swift_release();
    if ((v6 & 0x100) != 0)
    {
      sub_22126CE04();
      swift_allocError();
      unsigned char *v7 = 4;
      swift_willThrow();
    }
    else
    {
      return v6 != 0;
    }
  }
  return v2;
}

uint64_t sub_221271080(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2212710AC(a1, a2, a3, sub_221270390);
}

uint64_t sub_2212710AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  sub_221270B7C(a1);
  if (!v5)
  {
    uint64_t v4 = a4();
    char v8 = v7;
    swift_release();
    if (v8)
    {
      sub_22126CE04();
      swift_allocError();
      *unint64_t v9 = 4;
      swift_willThrow();
    }
  }
  return v4;
}

uint64_t sub_22127113C(uint64_t a1)
{
  sub_221270B7C(a1);
  if (!v2)
  {
    uint64_t v3 = sub_22126D3A4();
    uint64_t v1 = sub_221269F04(v3, v4);
    unint64_t v6 = v5;
    swift_release();
    if (v6 >> 60 == 15)
    {
      sub_22126CE04();
      swift_allocError();
      unsigned char *v7 = 4;
      swift_willThrow();
    }
  }
  return v1;
}

uint64_t sub_2212711E4(uint64_t a1)
{
  sub_221270B7C(a1);
  if (!v2)
  {
    uint64_t v1 = sub_22126D3A4();
    unint64_t v4 = v3;
    swift_release();
    if (v4 >> 60 == 15)
    {
      sub_22126CE04();
      swift_allocError();
      *unint64_t v5 = 4;
      swift_willThrow();
    }
  }
  return v1;
}

uint64_t sub_221271278(uint64_t a1)
{
  sub_221270B7C(a1);
  if (!v1)
  {
    uint64_t v3 = sub_22126D3A4();
    uint64_t v2 = sub_22127CAF0(v3, v4);
    swift_release();
    if (!v2)
    {
      sub_22126CE04();
      swift_allocError();
      *unint64_t v6 = 4;
      swift_willThrow();
    }
  }
  return v2;
}

uint64_t sub_221271304(uint64_t a1)
{
  uint64_t v3 = sub_221270B7C(a1);
  if (!v1)
  {
    uint64_t v4 = v3;
    uint64_t v2 = *(void *)(v3 + 24);
    unint64_t v5 = *(void *)(v3 + 32);
    if ((v5 & 0x2000000000000000) != 0)
    {
      swift_bridgeObjectRetain();
    }
    else
    {
      sub_22125D744(*(void *)(v3 + 24), v5);
      id v6 = sub_221273174(v2, v5);
      sub_22126D398(v2, v5);
      uint64_t v7 = *(void *)(v4 + 24);
      unint64_t v8 = *(void *)(v4 + 32);
      *(void *)(v4 + 24) = v6;
      *(void *)(v4 + 32) = 0x2000000000000000;
      swift_bridgeObjectRetain();
      sub_22126D398(v7, v8);
      uint64_t v2 = (uint64_t)v6;
    }
    swift_release();
  }
  return v2;
}

uint64_t sub_2212713E4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 24);
  unint64_t v1 = *(void *)(a1 + 32);
  if ((v1 & 0x2000000000000000) != 0)
  {
    if ((unint64_t)v2 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v3 = sub_22127DF08();
      if (!v3) {
        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (!v3) {
        goto LABEL_15;
      }
    }
    if (v3 < 1)
    {
      __break(1u);
LABEL_22:
      __break(1u);
    }
    for (uint64_t i = 0; i != v3; ++i)
    {
      if ((v2 & 0xC000000000000001) != 0)
      {
        uint64_t v5 = MEMORY[0x223C7CCC0](i, v2);
      }
      else
      {
        uint64_t v5 = *(void *)(v2 + 8 * i + 32);
        swift_retain();
      }
      sub_2212713E4(v5);
      swift_release();
    }
  }
  else
  {
    switch(v1 >> 62)
    {
      case 1uLL:
        if (v2 >> 32 < (int)v2) {
          goto LABEL_22;
        }
        sub_22125D744(*(void *)(a1 + 24), v1);
        sub_22125D744(v2, v1);
        sub_221272CC0((int)v2, v2 >> 32);
LABEL_14:
        sub_22126D398(v2, v1);
        break;
      case 2uLL:
        uint64_t v6 = *(void *)(v2 + 16);
        uint64_t v7 = *(void *)(v2 + 24);
        sub_22126D38C(*(void *)(a1 + 24), v1);
        sub_22126D38C(v2, v1);
        swift_retain();
        swift_retain();
        sub_221272CC0(v6, v7);
        swift_release();
        swift_release();
        goto LABEL_14;
      default:
        sub_22127D9D8();
        sub_22127361C(&qword_267F49358, 255, MEMORY[0x263F047F8]);
        sub_22127D998();
        sub_22126D398(v2, v1);
        return sub_22126D398(v2, v1);
    }
  }
LABEL_15:
  return sub_22126D398(v2, v1);
}

uint64_t sub_221271764(unint64_t a1)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  sub_22127D658();
  MEMORY[0x270FA5388](v3, v4);
  uint64_t v5 = sub_22127D668();
  uint64_t v6 = *(void *)(v5 - 8);
  double v9 = MEMORY[0x270FA5388](v7, v8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    unint64_t v17 = bswap64(a1);
    uint64_t v12 = sub_221274E74(__clz(a1) >> 3, (uint64_t)&v17, (uint64_t)&v18);
    return (uint64_t)sub_221272524(v12, v13, v14, v15);
  }
  LOBYTE(v17) = 0;
  uint64_t result = (uint64_t)objc_msgSend(v1, sel_write_maxLength_, &v17, 1, v9);
  if (result < 0)
  {
    uint64_t result = (uint64_t)objc_msgSend(v1, sel_streamError);
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  else
  {
    if (result == 1) {
      return result;
    }
    sub_22127D648();
    sub_22125F2C0(MEMORY[0x263F8EE78]);
    sub_22127361C((unint64_t *)&qword_267F49378, 255, MEMORY[0x263F06060]);
    sub_22127D7C8();
    sub_22127D638();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  }
  return swift_willThrow();
}

uint64_t sub_2212719B0(unint64_t a1)
{
  *(void *)&v21[23] = *MEMORY[0x263EF8340];
  if (a1)
  {
    unint64_t v15 = bswap64(a1);
    uint64_t v1 = sub_221274E74(__clz(a1) >> 3, (uint64_t)&v15, (uint64_t)v16);
    uint64_t v3 = v2;
    uint64_t v5 = v4;
    uint64_t v7 = v6;
    swift_beginAccess();
    uint64_t v8 = sub_22125D79C(&qword_267F49368);
    uint64_t v18 = v8;
    unint64_t v19 = sub_2212735A0();
    double v9 = (void *)swift_allocObject();
    v17[0] = v9;
    v9[2] = v1;
    unint64_t v9[3] = v3;
    v9[4] = v5;
    void v9[5] = v7;
    sub_22126A4B8(v17, v8);
    MEMORY[0x270FA5388](v10, v11);
    long long v13 = v12[1];
    v16[0] = *v12;
    v16[1] = v13;
    sub_22127E068();
    sub_22125DE98((uint64_t)v17);
  }
  else
  {
    char v20 = 0;
    swift_beginAccess();
    uint64_t v18 = MEMORY[0x263F8D3E8];
    unint64_t v19 = MEMORY[0x263F07B80];
    v17[0] = &v20;
    v17[1] = v21;
    sub_22126A4B8(v17, MEMORY[0x263F8D3E8]);
    sub_22127D858();
    sub_22125DE98((uint64_t)v17);
  }
  return swift_endAccess();
}

char *sub_221271B98(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a1 > 127)
  {
    unint64_t v4 = __clz(a1) >> 3;
    uint64_t result = (char *)sub_221271E94(-120 - v4);
    if (!v1)
    {
      unint64_t v9 = bswap64(a1);
      uint64_t v5 = sub_221274E74(v4, (uint64_t)&v9, (uint64_t)&v10);
      return sub_221272524(v5, v6, v7, v8);
    }
  }
  else
  {
    if (a1 < 0) {
      __break(1u);
    }
    return (char *)sub_221271E94(a1);
  }
  return result;
}

uint64_t sub_221271C58(int64_t a1)
{
  *(void *)&v24[23] = *MEMORY[0x263EF8340];
  if (a1 > 127)
  {
    unint64_t v2 = __clz(a1) >> 3;
    LOBYTE(v18[0]) = -120 - v2;
    swift_beginAccess();
    uint64_t v21 = MEMORY[0x263F8D3E8];
    unint64_t v22 = MEMORY[0x263F07B80];
    unint64_t v19 = (char *)v18;
    char v20 = (char *)v18 + 1;
    sub_22126A4B8(&v19, MEMORY[0x263F8D3E8]);
    sub_22127D858();
    sub_22125DE98((uint64_t)&v19);
    unint64_t v17 = bswap64(a1);
    uint64_t v3 = sub_221274E74(v2, (uint64_t)&v17, (uint64_t)v18);
    uint64_t v5 = v4;
    uint64_t v7 = v6;
    uint64_t v9 = v8;
    uint64_t v10 = sub_22125D79C(&qword_267F49368);
    uint64_t v21 = v10;
    unint64_t v22 = sub_2212735A0();
    __n128 v11 = (char *)swift_allocObject();
    unint64_t v19 = v11;
    *((void *)v11 + 2) = v3;
    *((void *)v11 + 3) = v5;
    *((void *)v11 + 4) = v7;
    *((void *)v11 + 5) = v9;
    sub_22126A4B8(&v19, v10);
    MEMORY[0x270FA5388](v12, v13);
    long long v15 = v14[1];
    v18[0] = *v14;
    v18[1] = v15;
    sub_22127E068();
    sub_22125DE98((uint64_t)&v19);
  }
  else
  {
    if (a1 < 0) {
      __break(1u);
    }
    char v23 = a1;
    swift_beginAccess();
    uint64_t v21 = MEMORY[0x263F8D3E8];
    unint64_t v22 = MEMORY[0x263F07B80];
    unint64_t v19 = &v23;
    char v20 = v24;
    sub_22126A4B8(&v19, MEMORY[0x263F8D3E8]);
    sub_22127D858();
    sub_22125DE98((uint64_t)&v19);
  }
  return swift_endAccess();
}

uint64_t sub_221271E94(char a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  sub_22127D658();
  MEMORY[0x270FA5388](v3, v4);
  uint64_t v5 = sub_22127D668();
  uint64_t v6 = *(void *)(v5 - 8);
  double v9 = MEMORY[0x270FA5388](v7, v8);
  __n128 v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  HIBYTE(v13) = a1;
  uint64_t result = (uint64_t)objc_msgSend(v1, sel_write_maxLength_, (char *)&v13 + 7, 1, v9);
  if (result < 0)
  {
    uint64_t result = (uint64_t)objc_msgSend(v1, sel_streamError);
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  else
  {
    if (result == 1) {
      return result;
    }
    sub_22127D648();
    sub_22125F2C0(MEMORY[0x263F8EE78]);
    sub_22127361C((unint64_t *)&qword_267F49378, 255, MEMORY[0x263F06060]);
    sub_22127D7C8();
    sub_22127D638();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  }
  return swift_willThrow();
}

uint64_t sub_2212720B0(uint64_t a1, unint64_t a2)
{
  v31[2] = *MEMORY[0x263EF8340];
  sub_22127D658();
  MEMORY[0x270FA5388](v6, v7);
  uint64_t v9 = (uint64_t)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_22127D668();
  id v11 = *(id *)(v10 - 8);
  double v14 = MEMORY[0x270FA5388](v12, v13);
  uint64_t v16 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = v9;
  switch(a2 >> 62)
  {
    case 1uLL:
      id v29 = v11;
      if (a1 >> 32 < (int)a1)
      {
        __break(1u);
LABEL_23:
        __break(1u);
      }
      uint64_t v28 = v10;
      uint64_t v9 = v2;
      sub_22125D744(a1, a2);
      __n128 v27 = sub_221272F80((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, (void *)v9);
      if (v3) {
        goto LABEL_26;
      }
      unint64_t v18 = (unint64_t)v27;

      uint64_t v10 = v28;
      id v11 = v29;
      if ((v18 & 0x8000000000000000) != 0)
      {
LABEL_19:
        if (objc_msgSend(v2, sel_streamError))
        {
          swift_willThrow();
          return sub_22125C910(a1, a2);
        }
        __break(1u);
LABEL_25:
        swift_release();
        swift_release();

        __break(1u);
LABEL_26:

        __break(1u);
        JUMPOUT(0x221272514);
      }
      uint64_t result = sub_22125C910(a1, a2);
      if (__OFSUB__(HIDWORD(a1), a1)) {
        goto LABEL_23;
      }
      uint64_t v9 = HIDWORD(a1) - (int)a1;
LABEL_17:
      if (v18 != v9)
      {
LABEL_18:
        sub_22127D648();
        sub_22125F2C0(MEMORY[0x263F8EE78]);
        sub_22127361C((unint64_t *)&qword_267F49378, 255, MEMORY[0x263F06060]);
        sub_22127D7C8();
        sub_22127D638();
        (*((void (**)(char *, uint64_t))v11 + 1))(v16, v10);
        return swift_willThrow();
      }
      return result;
    case 2uLL:
      uint64_t v28 = v10;
      id v29 = v11;
      uint64_t v9 = a2 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t v21 = *(void *)(a1 + 16);
      uint64_t v20 = *(void *)(a1 + 24);
      id v11 = v2;
      sub_22125D744(a1, a2);
      swift_retain();
      swift_retain();
      unint64_t v22 = sub_221272F80(v21, v20, a2 & 0x3FFFFFFFFFFFFFFFLL, v11);
      if (v3) {
        goto LABEL_25;
      }
      unint64_t v18 = (unint64_t)v22;
      swift_release();
      swift_release();

      uint64_t v10 = v28;
      id v11 = v29;
      if ((v18 & 0x8000000000000000) != 0) {
        goto LABEL_19;
      }
      uint64_t result = sub_22125C910(a1, a2);
      uint64_t v24 = *(void *)(a1 + 16);
      uint64_t v23 = *(void *)(a1 + 24);
      uint64_t v9 = v23 - v24;
      if (!__OFSUB__(v23, v24)) {
        goto LABEL_17;
      }
      __break(1u);
LABEL_9:
      memset(v31, 0, 14);
      unint64_t v25 = (unint64_t)objc_msgSend(v2, sel_write_maxLength_, v31, 0, v14);
      if ((v25 & 0x8000000000000000) != 0) {
        goto LABEL_19;
      }
      unint64_t v26 = v25;
      uint64_t result = sub_22125C910(a1, a2);
      if (!v26) {
        return result;
      }
      goto LABEL_18;
    case 3uLL:
      goto LABEL_9;
    default:
      v31[0] = a1;
      LOWORD(v31[1]) = a2;
      BYTE2(v31[1]) = BYTE2(a2);
      BYTE3(v31[1]) = BYTE3(a2);
      BYTE4(v31[1]) = BYTE4(a2);
      uint64_t v9 = BYTE6(a2);
      BYTE5(v31[1]) = BYTE5(a2);
      unint64_t v17 = (unint64_t)objc_msgSend(v2, sel_write_maxLength_, v31, BYTE6(a2), v14);
      if ((v17 & 0x8000000000000000) != 0) {
        goto LABEL_19;
      }
      unint64_t v18 = v17;
      uint64_t result = sub_22125C910(a1, a2);
      goto LABEL_17;
  }
}

char *sub_221272524(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  sub_22127D658();
  ((void (*)(void))MEMORY[0x270FA5388])();
  unint64_t v25 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_22127D668();
  uint64_t v26 = *(void *)(v11 - 8);
  uint64_t v27 = v11;
  ((void (*)(void))MEMORY[0x270FA5388])();
  uint64_t v24 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = a1;
  uint64_t v29 = a2;
  *(void *)&long long v33 = a1;
  *((void *)&v33 + 1) = a2;
  uint64_t v30 = a3;
  uint64_t v31 = a4;
  *(void *)&long long v34 = a3;
  *((void *)&v34 + 1) = a4;
  sub_22125D79C(&qword_267F49368);
  sub_221273664();
  uint64_t v13 = sub_22127E058();
  uint64_t v14 = *(void *)(v13 + 16);
  uint64_t v32 = v13;
  uint64_t v15 = 0;
  if (v14)
  {
    uint64_t v16 = (__n128 *)(v13 + 48);
    while (1)
    {
      *(double *)&long long v17 = MEMORY[0x270FA5388](v16[-1], *v16);
      *(&v23 - 2) = (uint64_t)v5;
      long long v33 = v17;
      long long v34 = v18;
      uint64_t result = (char *)sub_22127E068();
      if (v35 < 0) {
        break;
      }
      BOOL v20 = __OFADD__(v15, v35);
      v15 += v35;
      if (v20)
      {
        __break(1u);
        goto LABEL_12;
      }
      v16 += 2;
      if (!--v14) {
        goto LABEL_6;
      }
    }
    uint64_t result = (char *)objc_msgSend(v5, sel_streamError);
    if (result)
    {
      swift_willThrow();
      return (char *)swift_bridgeObjectRelease();
    }
LABEL_12:
    __break(1u);
  }
  else
  {
LABEL_6:
    swift_bridgeObjectRelease();
    uint64_t result = (char *)sub_221275C28(v28, v29, v30, v31);
    if (v15 != result)
    {
      sub_22127D648();
      sub_22125F2C0(MEMORY[0x263F8EE78]);
      sub_22127361C((unint64_t *)&qword_267F49378, 255, MEMORY[0x263F06060]);
      uint64_t v21 = v24;
      uint64_t v22 = v27;
      sub_22127D7C8();
      sub_22127D638();
      (*(void (**)(char *, uint64_t))(v26 + 8))(v21, v22);
      return (char *)swift_willThrow();
    }
  }
  return result;
}

uint64_t sub_22127281C@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  __n128 v7 = (const void *)__s1;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = (a2 >> 32) - (int)a2;
      if (a2 >> 32 < (int)a2)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      sub_22125D744(a2, a3);
      uint64_t v10 = (char *)sub_22127D6E8();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = sub_22127D718();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = sub_22127D708();
      if (v12 >= v9) {
        size_t v13 = (a2 >> 32) - (int)a2;
      }
      else {
        size_t v13 = v12;
      }
      if (!v7)
      {
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        JUMPOUT(0x221272A80);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = sub_22125C910(a2, a3);
      BOOL v8 = v14 == 0;
LABEL_24:
      char v24 = v8;
LABEL_29:
      *a4 = v24;
      return __s1;
    case 2uLL:
      uint64_t v15 = *(void *)(a2 + 16);
      uint64_t v16 = *(void *)(a2 + 24);
      swift_retain();
      swift_retain();
      long long v17 = (char *)sub_22127D6E8();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = sub_22127D718();
      if (__OFSUB__(v15, v18)) {
        goto LABEL_32;
      }
      v17 += v15 - v18;
LABEL_17:
      BOOL v19 = __OFSUB__(v16, v15);
      int64_t v20 = v16 - v15;
      if (v19) {
        goto LABEL_31;
      }
      uint64_t v21 = sub_22127D708();
      if (v21 >= v20) {
        size_t v22 = v20;
      }
      else {
        size_t v22 = v21;
      }
      if (!v7) {
        goto LABEL_37;
      }
      if (!v17) {
        goto LABEL_38;
      }
      int v23 = memcmp(v7, v17, v22);
      swift_release();
      __s1 = swift_release();
      BOOL v8 = v23 == 0;
      goto LABEL_24;
    case 3uLL:
      if (!__s1) {
        goto LABEL_39;
      }
      char v24 = 1;
      goto LABEL_29;
    default:
      uint64_t __s2 = a2;
      __int16 v26 = a3;
      char v27 = BYTE2(a3);
      char v28 = BYTE3(a3);
      char v29 = BYTE4(a3);
      char v30 = BYTE5(a3);
      if (__s1)
      {
        __s1 = memcmp((const void *)__s1, &__s2, BYTE6(a3));
        BOOL v8 = __s1 == 0;
        goto LABEL_24;
      }
      __break(1u);
      goto LABEL_35;
  }
}

uint64_t sub_221272A90(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  __s1[2] = *MEMORY[0x263EF8340];
  switch(a2 >> 62)
  {
    case 1uLL:
      if (a1 >> 32 < (int)a1) {
        __break(1u);
      }
      sub_22125D744(a1, a2);
      char v5 = sub_221272EC8((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
      sub_22125C910(a1, a2);
      goto LABEL_6;
    case 2uLL:
      uint64_t v10 = a2 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t v11 = *(void *)(a1 + 16);
      uint64_t v12 = *(void *)(a1 + 24);
      swift_retain();
      swift_retain();
      char v5 = sub_221272EC8(v11, v12, v10, a3, a4);
      swift_release();
      swift_release();
LABEL_6:
      sub_22125C910(a3, a4);
      return v5 & 1;
    case 3uLL:
      memset(__s1, 0, 14);
      goto LABEL_8;
    default:
      __s1[0] = a1;
      LOWORD(__s1[1]) = a2;
      BYTE2(__s1[1]) = BYTE2(a2);
      BYTE3(__s1[1]) = BYTE3(a2);
      BYTE4(__s1[1]) = BYTE4(a2);
      BYTE5(__s1[1]) = BYTE5(a2);
LABEL_8:
      sub_22127281C((uint64_t)__s1, a3, a4, &v14);
      sub_22125C910(a3, a4);
      if (!v4) {
        char v5 = v14;
      }
      return v5 & 1;
  }
}

uint64_t sub_221272CC0(uint64_t a1, uint64_t a2)
{
  uint64_t result = sub_22127D6E8();
  if (!result || (uint64_t result = sub_22127D718(), !__OFSUB__(a1, result)))
  {
    if (!__OFSUB__(a2, a1))
    {
      sub_22127D708();
      sub_22127D9D8();
      sub_22127361C(&qword_267F49358, 255, MEMORY[0x263F047F8]);
      return sub_22127D998();
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

char *sub_221272DA4(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_221272DC4(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_221272DC4(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_22125D79C(&qword_267F490F8);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  }
  size_t v13 = v10 + 32;
  char v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_221272EC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = sub_22127D6E8();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = sub_22127D718();
    if (__OFSUB__(a1, result))
    {
LABEL_9:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  sub_22127D708();
  sub_22127281C(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

char *sub_221272F80(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t result = (char *)sub_22127D6E8();
  uint64_t v8 = result;
  if (result)
  {
    uint64_t result = (char *)sub_22127D718();
    if (__OFSUB__(a1, result))
    {
LABEL_11:
      __break(1u);
      goto LABEL_12;
    }
    v8 += a1 - (void)result;
  }
  BOOL v9 = __OFSUB__(a2, a1);
  uint64_t v10 = a2 - a1;
  if (v9)
  {
    __break(1u);
    goto LABEL_11;
  }
  uint64_t result = (char *)sub_22127D708();
  if (!v8)
  {
LABEL_12:
    __break(1u);
    return result;
  }
  if ((uint64_t)result >= v10) {
    id v11 = (id)v10;
  }
  else {
    id v11 = result;
  }
  return (char *)objc_msgSend(a4, sel_write_maxLength_, v8, v11);
}

uint64_t sub_221273018(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v8) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
        JUMPOUT(0x221273154);
      }
      uint64_t v8 = (int)v8;
LABEL_6:
      switch(a4 >> 62)
      {
        case 1uLL:
          LODWORD(v12) = HIDWORD(a3) - a3;
          if (__OFSUB__(HIDWORD(a3), a3)) {
            goto LABEL_20;
          }
          uint64_t v12 = (int)v12;
LABEL_11:
          if (v8 == v12)
          {
            if (v8 < 1)
            {
              char v15 = 1;
            }
            else
            {
              sub_22125D744(a3, a4);
              char v15 = sub_221272A90(a1, a2, a3, a4);
            }
          }
          else
          {
            char v15 = 0;
          }
          return v15 & 1;
        case 2uLL:
          uint64_t v14 = *(void *)(a3 + 16);
          uint64_t v13 = *(void *)(a3 + 24);
          BOOL v11 = __OFSUB__(v13, v14);
          uint64_t v12 = v13 - v14;
          if (!v11) {
            goto LABEL_11;
          }
          goto LABEL_21;
        case 3uLL:
          char v15 = v8 == 0;
          return v15 & 1;
        default:
          uint64_t v12 = BYTE6(a4);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v10 = *(void *)(a1 + 16);
      uint64_t v9 = *(void *)(a1 + 24);
      BOOL v11 = __OFSUB__(v9, v10);
      uint64_t v8 = v9 - v10;
      if (!v11) {
        goto LABEL_6;
      }
      goto LABEL_19;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v8 = BYTE6(a2);
      goto LABEL_6;
  }
}

id sub_221273174(uint64_t a1, unint64_t a2)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v23 = MEMORY[0x263F8EE78];
  id v5 = objc_allocWithZone(MEMORY[0x263EFF950]);
  sub_22125D744(a1, a2);
  unint64_t v6 = (void *)sub_22127D898();
  id v7 = objc_msgSend(v5, sel_initWithData_, v6);
  sub_22125C910(a1, a2);

  objc_msgSend(v7, sel_open);
  while (1)
  {
    unsigned __int8 v22 = 0;
    id v8 = objc_msgSend(v7, sel_read_maxLength_, &v22, 1);
    if (v8 != (id)1)
    {
      if (v8 == (id)-1)
      {
        if (objc_msgSend(v7, sel_streamError)) {
          goto LABEL_18;
        }
        __break(1u);
      }
      objc_msgSend(v7, sel_close);

      return (id)v23;
    }
    unint64_t v9 = v22;
    if ((~v22 & 0x1F) == 0) {
      break;
    }
    unint64_t v11 = v22;
LABEL_8:
    id v12 = sub_22126CE58();
    if (v2) {
      goto LABEL_19;
    }
    if (v13) {
      goto LABEL_17;
    }
    id v14 = sub_221273AC4((uint64_t)v12);
    unint64_t v16 = v15;
    if (v15 >> 60 == 15) {
      goto LABEL_17;
    }
    id v17 = v14;
    type metadata accessor for TLV();
    uint64_t v18 = (void *)swift_allocObject();
    _OWORD v18[2] = v11;
    v18[3] = v17;
    v18[4] = v16;
    uint64_t v19 = swift_retain();
    MEMORY[0x223C7CAD0](v19);
    if (*(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v23 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_22127DCA8();
    }
    sub_22127DCC8();
    sub_22127DC98();
    swift_release();
  }
  while (1)
  {
    unsigned __int8 v22 = 0;
    id v10 = objc_msgSend(v7, sel_read_maxLength_, &v22, 1);
    if (v10 != (id)1) {
      break;
    }
    unint64_t v11 = v22 | (v9 << 8);
    unint64_t v9 = v11;
    if (((char)v22 & 0x80000000) == 0) {
      goto LABEL_8;
    }
  }
  if (v10 != (id)-1)
  {
LABEL_17:
    sub_22126CE04();
    swift_allocError();
    *uint64_t v21 = 0;
LABEL_18:
    swift_willThrow();
LABEL_19:

    return (id)swift_bridgeObjectRelease();
  }
  id result = objc_msgSend(v7, sel_streamError);
  if (result) {
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

unint64_t sub_22127343C()
{
  unint64_t result = qword_267F49338;
  if (!qword_267F49338)
  {
    sub_22126045C(&qword_267F490F0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F49338);
  }
  return result;
}

unint64_t sub_221273498()
{
  unint64_t result = qword_267F49348;
  if (!qword_267F49348)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F49348);
  }
  return result;
}

unint64_t sub_2212734EC()
{
  unint64_t result = qword_267F49350;
  if (!qword_267F49350)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F49350);
  }
  return result;
}

BOOL sub_221273540(uint64_t a1)
{
  return *(void *)(*(void *)a1 + 16) == *(void *)(v1 + 16);
}

uint64_t sub_221273558(uint64_t a1, uint64_t a2)
{
  return sub_22127361C(&qword_267F49360, a2, (void (*)(uint64_t))type metadata accessor for TLV);
}

unint64_t sub_2212735A0()
{
  unint64_t result = qword_267F49370;
  if (!qword_267F49370)
  {
    sub_22126045C(&qword_267F49368);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F49370);
  }
  return result;
}

uint64_t sub_22127360C()
{
  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_22127361C(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a3(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_221273664()
{
  unint64_t result = qword_267F49380;
  if (!qword_267F49380)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F49380);
  }
  return result;
}

id sub_2212736B8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  return sub_2212779C8(*(id *)(v3 + 16), a1, a2, a3);
}

uint64_t sub_2212736D4()
{
  return sub_22126A4FC();
}

BOOL sub_2212736EC(uint64_t a1)
{
  return sub_221273540(a1);
}

uint64_t sub_221273708(uint64_t a1, uint64_t a2)
{
  return sub_22126B518(a1, a2);
}

void *sub_221273720(uint64_t a1, uint64_t a2)
{
  void *(*v5)(uint64_t *__return_ptr, void, void, unint64_t, unint64_t, uint64_t, uint64_t);
  unint64_t v6;
  unint64_t v7;
  void *result;
  unint64_t v9;
  unsigned char *v10;
  uint64_t v11;

  id v5 = *(void *(**)(uint64_t *__return_ptr, void, void, unint64_t, unint64_t, uint64_t, uint64_t))(a2 + 8);
  unint64_t v6 = sub_221273878();
  id v7 = sub_2212738CC();
  unint64_t result = v5((uint64_t *)((char *)&v11 + 2), MEMORY[0x263F8E778], MEMORY[0x263F8E778], v6, v7, a1, a2);
  if (!v2)
  {
    if ((v11 & 0x1000000) != 0)
    {
      return 0;
    }
    else
    {
      unint64_t v9 = BYTE2(v11);
      if ((~BYTE2(v11) & 0x1F) != 0)
      {
        return (void *)BYTE2(v11);
      }
      else
      {
        while (1)
        {
          v5(&v11, MEMORY[0x263F8E778], MEMORY[0x263F8E778], v6, v7, a1, a2);
          if ((v11 & 0x100) != 0) {
            break;
          }
          unint64_t result = (void *)(v11 | (v9 << 8));
          unint64_t v9 = (unint64_t)result;
          if (((char)v11 & 0x80000000) == 0) {
            return result;
          }
        }
        sub_22126CE04();
        swift_allocError();
        char *v10 = 0;
        return (void *)swift_willThrow();
      }
    }
  }
  return result;
}

unint64_t sub_221273878()
{
  unint64_t result = qword_267F49388;
  if (!qword_267F49388)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F49388);
  }
  return result;
}

unint64_t sub_2212738CC()
{
  unint64_t result = qword_267F49390;
  if (!qword_267F49390)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F49390);
  }
  return result;
}

void *sub_221273920(uint64_t a1, uint64_t a2)
{
  void *(*v6)(uint64_t *__return_ptr, void, void, unint64_t, unint64_t, uint64_t, uint64_t);
  unint64_t v7;
  unint64_t v8;
  void *result;
  uint64_t v10;
  unsigned char *v11;
  unsigned int v12;
  uint64_t v13;
  unsigned char *v14;
  void *(*v15)(uint64_t *__return_ptr, void, void, unint64_t, unint64_t, uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;

  unint64_t v6 = *(void *(**)(uint64_t *__return_ptr, void, void, unint64_t, unint64_t, uint64_t, uint64_t))(a2 + 8);
  id v7 = sub_221273878();
  id v8 = sub_2212738CC();
  unint64_t result = v6((uint64_t *)((char *)&v17 + 2), MEMORY[0x263F8E778], MEMORY[0x263F8E778], v7, v8, a1, a2);
  if (v2) {
    return (void *)v3;
  }
  if ((v17 & 0x1000000) != 0) {
    return 0;
  }
  id v10 = BYTE2(v17);
  if ((v17 & 0x800000) == 0) {
    return (void *)BYTE2(v17);
  }
  if (BYTE2(v17) == 128)
  {
    sub_22126CE04();
    swift_allocError();
    *unint64_t v11 = 2;
LABEL_15:
    swift_willThrow();
    return (void *)v3;
  }
  unint64_t v15 = v6;
  unint64_t v16 = a1;
  unint64_t v3 = 0;
  id v12 = 128;
  while (v12 < v10)
  {
    char v13 = v10;
    unint64_t result = v15(&v17, MEMORY[0x263F8E778], MEMORY[0x263F8E778], v7, v8, v16, a2);
    if ((v17 & 0x100) != 0)
    {
      sub_22126CE04();
      swift_allocError();
      *id v14 = 0;
      goto LABEL_15;
    }
    ++v12;
    unint64_t v3 = v17 | (v3 << 8);
    id v10 = v13;
    if (v12 == v13) {
      return (void *)v3;
    }
  }
  __break(1u);
  return result;
}

id sub_221273AC4(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a1 < 1) {
    return 0;
  }
  v10[0] = 0;
  *(void *)&long long v9 = 0;
  unsigned int v3 = objc_msgSend(v1, sel_getBuffer_length_, v10, &v9);
  uint64_t v4 = v9;
  if (!v3) {
    uint64_t v4 = 1000000;
  }
  if (v4 < a1) {
    return 0;
  }
  *(void *)&long long v9 = sub_221260318(a1);
  *((void *)&v9 + 1) = v5;
  sub_221274560(&v9, 0);
  *(_OWORD *)id v10 = v9;
  id v6 = v1;
  id v7 = sub_2212747E8(v10, v6);

  if (v7 == (id)-1)
  {
    id result = objc_msgSend(v6, sel_streamError);
    if (result)
    {
      swift_willThrow();
      return (id)sub_22125C910(v10[0], v10[1]);
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    id result = (id)v10[0];
    if (v7 != (id)a1)
    {
      sub_22125C910(v10[0], v10[1]);
      return 0;
    }
  }
  return result;
}

id sub_221273C1C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v15 = a2;
  uint64_t v19 = *MEMORY[0x263EF8340];
  swift_getAssociatedTypeWitness();
  v6.n128_f64[0] = MEMORY[0x270FA5388](v4, v5);
  uint64_t v7 = *(void *)(a1 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6, v9);
  swift_getAssociatedConformanceWitness();
  sub_22127DFD8();
  sub_22127DF98();
  uint64_t v18 = v2;
  sub_221274050((uint64_t)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)sub_221274B74, (uint64_t)v17, a1, MEMORY[0x263F8E628], MEMORY[0x263F8D6C8], MEMORY[0x263F8E658], v10);
  if (v16 == -1)
  {
    id result = objc_msgSend(v2, sel_streamError);
    if (result)
    {
      swift_willThrow();
      return (id)(*(uint64_t (**)(char *, uint64_t))(v7 + 8))((char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    if (v8 == v16)
    {
      uint64_t v11 = v15;
      (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v15, (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
      uint64_t v12 = 0;
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v7 + 8))((char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
      uint64_t v12 = 1;
      uint64_t v11 = v15;
    }
    return (id)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(v11, v12, 1, a1);
  }
  return result;
}

void *sub_221273EDC(uint64_t a1, uint64_t a2)
{
  id result = sub_221273720(a1, a2);
  if (!v2)
  {
    if (v6)
    {
      return 0;
    }
    else
    {
      uint64_t v7 = result;
      uint64_t v8 = sub_221273920(a1, a2);
      if ((v9 & 1) != 0
        || (uint64_t v10 = (*(uint64_t (**)(void *, uint64_t, uint64_t))(a2 + 16))(v8, a1, a2),
            unint64_t v12 = v11,
            v11 >> 60 == 15))
      {
        sub_22126CE04();
        swift_allocError();
        *char v13 = 0;
        return (void *)swift_willThrow();
      }
      else
      {
        uint64_t v14 = v10;
        type metadata accessor for TLV();
        id result = (void *)swift_allocObject();
        result[2] = v7;
        result[3] = v14;
        result[4] = v12;
      }
    }
  }
  return result;
}

uint64_t sub_221273FD8()
{
  v3[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = 0;
  v3[0] = 0;
  if (objc_msgSend(v0, sel_getBuffer_length_, v3, &v2)) {
    return v2;
  }
  else {
    return 1000000;
  }
}

uint64_t sub_221274050(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = *(void *)(a5 - 8);
  uint64_t v12 = MEMORY[0x270FA5388]();
  uint64_t v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = v16(v12, v12 + *(void *)(*(void *)(v15 - 8) + 64), v14);
  if (v8) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a8, v14, a5);
  }
  return result;
}

id sub_221274144@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  return sub_221273C1C(a1, a2);
}

id sub_221274168(uint64_t a1)
{
  return sub_221273AC4(a1);
}

uint64_t sub_22127418C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v5 = *(void *)(a1 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t result = sub_22127DCE8();
  if (!v2)
  {
    unint64_t v11 = v8;
    if (v8 >> 60 != 15)
    {
      uint64_t v12 = result;
      switch(v8 >> 62)
      {
        case 1uLL:
          LODWORD(v13) = HIDWORD(result) - result;
          if (__OFSUB__(HIDWORD(result), result))
          {
            __break(1u);
LABEL_15:
            __break(1u);
            JUMPOUT(0x221274350);
          }
          uint64_t v13 = (int)v13;
LABEL_8:
          if (v13 == v6)
          {
LABEL_9:
            MEMORY[0x270FA5388](v9, v10);
            sub_22127D888();
            sub_22125C8FC(v12, v11);
            return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v5 + 56))(a2, 0, 1, a1);
          }
LABEL_11:
          sub_22125C8FC(result, v8);
          break;
        case 2uLL:
          uint64_t v15 = *(void *)(result + 16);
          uint64_t v14 = *(void *)(result + 24);
          BOOL v16 = __OFSUB__(v14, v15);
          uint64_t v13 = v14 - v15;
          if (!v16) {
            goto LABEL_8;
          }
          goto LABEL_15;
        case 3uLL:
          if (v6) {
            goto LABEL_11;
          }
          goto LABEL_9;
        default:
          uint64_t v13 = BYTE6(v8);
          goto LABEL_8;
      }
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v5 + 56))(a2, 1, 1, a1);
  }
  return result;
}

uint64_t sub_221274360(__n128 a1, __n128 a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = *(void *)(a5 - 8);
  MEMORY[0x270FA5388](a1, a2);
  unint64_t v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22127DC78();
  sub_22127DEE8();
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, a5);
}

uint64_t sub_221274458(uint64_t a1)
{
  uint64_t result = sub_22127DCE8();
  if (!v1)
  {
    if (v4 >> 60 != 15)
    {
      switch(v4 >> 62)
      {
        case 1uLL:
          LODWORD(v5) = HIDWORD(result) - result;
          if (__OFSUB__(HIDWORD(result), result))
          {
            __break(1u);
LABEL_15:
            __break(1u);
            JUMPOUT(0x221274508);
          }
          uint64_t v5 = (int)v5;
LABEL_8:
          if (v5 == a1) {
            return result;
          }
LABEL_11:
          sub_22125C8FC(result, v4);
          break;
        case 2uLL:
          uint64_t v7 = *(void *)(result + 16);
          uint64_t v6 = *(void *)(result + 24);
          BOOL v8 = __OFSUB__(v6, v7);
          uint64_t v5 = v6 - v7;
          if (!v8) {
            goto LABEL_8;
          }
          goto LABEL_15;
        case 3uLL:
          if (a1) {
            goto LABEL_11;
          }
          return result;
        default:
          uint64_t v5 = BYTE6(v4);
          goto LABEL_8;
      }
    }
    return 0;
  }
  return result;
}

uint64_t sub_221274518@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  return sub_22127418C(a1, a2);
}

uint64_t sub_22127453C(uint64_t a1)
{
  return sub_221274458(a1);
}

void *sub_221274560(void *result, int __c)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t v2 = result[1];
  unint64_t v4 = result;
  switch(v2 >> 62)
  {
    case 1uLL:
      uint64_t __b = *result;
      uint64_t v19 = v2 & 0x3FFFFFFFFFFFFFFFLL;
      uint64_t result = sub_221274754((int *)&__b, __c);
      uint64_t v5 = __b;
      unint64_t v6 = v19 | 0x4000000000000000;
      goto LABEL_4;
    case 2uLL:
      uint64_t __b = *result;
      uint64_t v19 = v2 & 0x3FFFFFFFFFFFFFFFLL;
      sub_22127D7F8();
      uint64_t v7 = v19;
      uint64_t v8 = *(void *)(__b + 16);
      uint64_t v9 = *(void *)(__b + 24);
      uint64_t v10 = sub_22127D6E8();
      if (!v10)
      {
        __break(1u);
        JUMPOUT(0x221274744);
      }
      uint64_t v11 = v10;
      uint64_t v12 = sub_22127D718();
      uint64_t v13 = v8 - v12;
      if (__OFSUB__(v8, v12))
      {
        __break(1u);
LABEL_14:
        __break(1u);
      }
      BOOL v14 = __OFSUB__(v9, v8);
      int64_t v15 = v9 - v8;
      if (v14) {
        goto LABEL_14;
      }
      uint64_t v16 = sub_22127D708();
      if (v16 >= v15) {
        size_t v17 = v15;
      }
      else {
        size_t v17 = v16;
      }
      uint64_t result = memset((void *)(v11 + v13), __c, v17);
      *unint64_t v4 = __b;
      v4[1] = v7 | 0x8000000000000000;
      return result;
    case 3uLL:
      return result;
    default:
      uint64_t __b = *result;
      LOWORD(v19) = v2;
      BYTE2(v19) = BYTE2(v2);
      BYTE3(v19) = BYTE3(v2);
      BYTE4(v19) = BYTE4(v2);
      BYTE5(v19) = BYTE5(v2);
      BYTE6(v19) = BYTE6(v2);
      uint64_t result = memset(&__b, __c, BYTE6(v2));
      uint64_t v5 = __b;
      unint64_t v6 = v19 | ((unint64_t)BYTE4(v19) << 32) | ((unint64_t)BYTE5(v19) << 40) | ((unint64_t)BYTE6(v19) << 48);
LABEL_4:
      *unint64_t v4 = v5;
      v4[1] = v6;
      return result;
  }
}

char *sub_221274754(int *a1, int a2)
{
  uint64_t result = (char *)sub_22127D808();
  uint64_t v5 = *a1;
  uint64_t v6 = a1[1];
  if ((int)v6 < (int)v5)
  {
    __break(1u);
    goto LABEL_11;
  }
  uint64_t result = (char *)sub_22127D6E8();
  if (!result)
  {
LABEL_12:
    __break(1u);
    return result;
  }
  uint64_t v7 = result;
  uint64_t result = (char *)sub_22127D718();
  uint64_t v8 = v5 - (void)result;
  if (__OFSUB__(v5, result))
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  int64_t v9 = v6 - v5;
  uint64_t v10 = sub_22127D708();
  if (v10 >= v9) {
    size_t v11 = v9;
  }
  else {
    size_t v11 = v10;
  }
  return (char *)memset(&v7[v8], a2, v11);
}

id sub_2212747E8(uint64_t *a1, id a2)
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a1;
  unint64_t v2 = a1[1];
  switch(v2 >> 62)
  {
    case 1uLL:
      uint64_t v7 = v2 & 0x3FFFFFFFFFFFFFFFLL;
      *(_OWORD *)a1 = xmmword_2212811B0;
      id v8 = a2;
      uint64_t v9 = v3 >> 32;
      if (swift_isUniquelyReferenced_nonNull_native()) {
        goto LABEL_18;
      }
      uint64_t v34 = v9 - (int)v3;
      if (v9 < (int)v3) {
        goto LABEL_29;
      }
      if (sub_22127D6E8() && __OFSUB__((int)v3, sub_22127D718())) {
        goto LABEL_30;
      }
      sub_22127D738();
      swift_allocObject();
      uint64_t v24 = sub_22127D6C8();
      swift_release();
      uint64_t v7 = v24;
LABEL_18:
      uint64_t v25 = v9 - (int)v3;
      if (v9 < (int)v3) {
        goto LABEL_26;
      }
      id v26 = v8;
      uint64_t v27 = sub_22127D6E8();
      if (!v27) {
        goto LABEL_32;
      }
      uint64_t v28 = v27;
      uint64_t v29 = sub_22127D718();
      uint64_t v30 = (int)v3 - v29;
      if (__OFSUB__((int)v3, v29)) {
        goto LABEL_28;
      }
      uint64_t v31 = sub_22127D708();
      if (v31 >= v25) {
        uint64_t v32 = v25;
      }
      else {
        uint64_t v32 = v31;
      }
      id v33 = objc_msgSend(v26, sel_read_maxLength_, v28 + v30, v32, v34);

      *a1 = v3;
      a1[1] = v7 | 0x4000000000000000;
      return v33;
    case 2uLL:
      *(void *)&long long v35 = *a1;
      *((void *)&v35 + 1) = v2 & 0x3FFFFFFFFFFFFFFFLL;
      id v10 = a2;
      sub_22127D7F8();
      uint64_t v11 = *((void *)&v35 + 1);
      uint64_t v12 = *(void *)(v35 + 16);
      uint64_t v13 = *(void *)(v35 + 24);
      id v14 = v10;
      uint64_t v15 = sub_22127D6E8();
      if (!v15)
      {
        __break(1u);
LABEL_32:
        __break(1u);
        JUMPOUT(0x221274B64);
      }
      uint64_t v16 = v15;
      uint64_t v17 = sub_22127D718();
      uint64_t v18 = v12 - v17;
      if (__OFSUB__(v12, v17))
      {
        __break(1u);
LABEL_26:
        __break(1u);
        goto LABEL_27;
      }
      BOOL v19 = __OFSUB__(v13, v12);
      uint64_t v20 = v13 - v12;
      if (v19)
      {
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
LABEL_30:
        __break(1u);
      }
      uint64_t v21 = sub_22127D708();
      if (v21 >= v20) {
        uint64_t v22 = v20;
      }
      else {
        uint64_t v22 = v21;
      }
      id v23 = objc_msgSend(v14, sel_read_maxLength_, v16 + v18, v22);

      *a1 = v35;
      a1[1] = v11 | 0x8000000000000000;
      return v23;
    case 3uLL:
      *(void *)((char *)&v35 + 7) = 0;
      *(void *)&long long v35 = 0;
      return objc_msgSend(a2, sel_read_maxLength_, &v35, 0);
    default:
      *(void *)&long long v35 = *a1;
      WORD4(v35) = v2;
      BYTE10(v35) = BYTE2(v2);
      BYTE11(v35) = BYTE3(v2);
      BYTE12(v35) = BYTE4(v2);
      BYTE13(v35) = BYTE5(v2);
      BYTE14(v35) = BYTE6(v2);
      id result = objc_msgSend(a2, sel_read_maxLength_, &v35, BYTE6(v2));
      unint64_t v6 = DWORD2(v35) | ((unint64_t)BYTE12(v35) << 32) | ((unint64_t)BYTE13(v35) << 40) | ((unint64_t)BYTE14(v35) << 48);
      *a1 = v35;
      a1[1] = v6;
      return result;
  }
}

id sub_221274B74@<X0>(id result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  if (result)
  {
    id result = objc_msgSend(*(id *)(v3 + 16), sel_read_maxLength_, result, a2 - (void)result);
    *a3 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_221274BC0(uint64_t a1, uint64_t a2, __n128 a3, __n128 a4)
{
  return sub_221274360(a3, a4, a1, a2, *(void *)(v4 + 16));
}

BOOL sub_221274BE0(char a1, char a2)
{
  return a1 == a2;
}

uint64_t sub_221274BF0()
{
  return sub_22127E088();
}

uint64_t sub_221274C18()
{
  return sub_22127E0A8();
}

unint64_t sub_221274C64()
{
  unint64_t result = qword_267F49398;
  if (!qword_267F49398)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F49398);
  }
  return result;
}

BOOL sub_221274CC4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t getEnumTagSinglePayload for TLVError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFC) {
    goto LABEL_17;
  }
  if (a2 + 4 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 4) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 4;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 4;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 5;
  int v8 = v6 - 5;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for TLVError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 4 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 4) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFC) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFB)
  {
    unsigned int v6 = ((a2 - 252) >> 8) + 1;
    *unint64_t result = a2 + 4;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x221274E34);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 4;
        break;
    }
  }
  return result;
}

unsigned char *sub_221274E5C(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for TLVError()
{
  return &type metadata for TLVError;
}

uint64_t sub_221274E74(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result < 0)
  {
    __break(1u);
LABEL_13:
    __break(1u);
    return result;
  }
  uint64_t v5 = a3 - a2;
  if (a2) {
    uint64_t v6 = a3 - a2;
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t result = sub_221275BA0(0, result, v6, a2, a3);
  if (v7)
  {
    unint64_t result = v5;
    if (!a2) {
      return 0;
    }
  }
  else if (!a2)
  {
    uint64_t v5 = 0;
  }
  if (v5 < result) {
    goto LABEL_13;
  }
  return result;
}

uint64_t sub_221274F04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_16;
  }
  unint64_t v5 = a3 >> 62;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v10 = (int)a2;
      uint64_t v9 = a2 >> 32;
      break;
    case 2uLL:
      uint64_t v10 = *(void *)(a2 + 16);
      uint64_t v9 = *(void *)(a2 + 24);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v10 = 0;
      uint64_t v9 = BYTE6(a3);
      break;
  }
  uint64_t v11 = sub_221275AB4(v10, v9, a2, a3);
  if (!a1 || v11 < 0 || v11 >= a1)
  {
    uint64_t v12 = sub_221275A38(v10, a1, a2, a3);
    uint64_t v13 = 0;
    switch((int)v5)
    {
      case 1:
        uint64_t v13 = a2 >> 32;
        break;
      case 2:
        uint64_t v13 = *(void *)(a2 + 24);
        break;
      case 3:
        break;
      default:
        uint64_t v13 = BYTE6(a3);
        break;
    }
    if (v13 < v12)
    {
LABEL_16:
      __break(1u);
      JUMPOUT(0x221275084);
    }
  }
  uint64_t v14 = sub_22127D868();
  uint64_t v16 = v15;
  uint64_t result = sub_22125C910(a2, a3);
  *a4 = v14;
  a4[1] = v16;
  return result;
}

void *sub_2212750B4()
{
  return &unk_26459D470;
}

unint64_t sub_2212750C0()
{
  return 0xD00000000000001BLL;
}

void *sub_2212750DC()
{
  return &unk_26459D480;
}

unint64_t sub_2212750E8()
{
  return 0xD000000000000019;
}

uint64_t sub_221275104()
{
  CFDataRef v1 = SecCertificateCopyData(v0);
  uint64_t v2 = sub_22127D8B8();

  return v2;
}

unint64_t sub_22127514C()
{
  CFDataRef v1 = SecCertificateCopyData(v0);
  uint64_t v2 = sub_22127D8B8();
  unint64_t v4 = v3;

  sub_22127D8A8();
  sub_22127DB68();
  swift_bridgeObjectRelease();
  sub_22127DB68();
  sub_22127DB68();
  sub_22125C910(v2, v4);
  return 0xD00000000000001CLL;
}

uint64_t sub_221275218()
{
  CFDataRef v1 = SecCertificateCopyData(v0);
  uint64_t v2 = sub_22127D8B8();
  unint64_t v4 = v3;

  uint64_t v5 = sub_22127A60C(v2, v4);
  sub_22125C910(v2, v4);
  return v5;
}

SecKeyRef sub_221275280()
{
  return SecCertificateCopyKey(v0);
}

SecCertificateRef sub_221275288()
{
  CFAllocatorRef v0 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDataRef v1 = (const __CFData *)sub_22127D898();
  SecCertificateRef v2 = SecCertificateCreateWithData(v0, v1);

  return v2;
}

SecCertificateRef sub_2212752D0()
{
  uint64_t v0 = sub_22127D818();
  if (v1 >> 60 == 15) {
    return 0;
  }
  uint64_t v3 = v0;
  unint64_t v4 = v1;
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
  CFDataRef v6 = (const __CFData *)sub_22127D898();
  SecCertificateRef v2 = SecCertificateCreateWithData(v5, v6);

  sub_22125C8FC(v3, v4);
  return v2;
}

uint64_t sub_221275350(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22127D6A8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v6, v7);
  uint64_t v9 = (char *)v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51[0] = a1;
  v51[1] = a2;
  sub_22127D698();
  sub_2212759E4();
  uint64_t v10 = sub_22127DDC8();
  unint64_t v12 = v11;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v9, v4);
  uint64_t v13 = sub_22127DB38();
  uint64_t v14 = sub_22127DB38();
  uint64_t result = sub_22127DB38();
  if (__OFADD__(v14, result))
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  if (v13 < v14 + result) {
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  uint64_t v16 = sub_22127DB38();
  unint64_t v17 = sub_221275D0C(v16);
  unint64_t v19 = v18;
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  swift_bridgeObjectRelease();
  char v24 = sub_221275DA8(v17, v19, v21, v23, 0xD00000000000001BLL, 0x8000000221283F20);
  swift_bridgeObjectRelease();
  if ((v24 & 1) == 0) {
    goto LABEL_11;
  }
  swift_bridgeObjectRetain();
  unint64_t v25 = sub_22127DB38();
  unint64_t v26 = sub_221275E20(v25, v10, v12);
  unint64_t v28 = v27;
  uint64_t v30 = v29;
  uint64_t v32 = v31;
  swift_bridgeObjectRelease();
  LOBYTE(v26) = sub_221275DA8(v26, v28, v30, v32, 0xD000000000000019, 0x8000000221283F40);
  swift_bridgeObjectRelease();
  if ((v26 & 1) == 0) {
    goto LABEL_11;
  }
  unint64_t v33 = sub_22127DB38();
  unint64_t v34 = sub_221275C5C(v33, v10, v12);
  swift_bridgeObjectRelease();
  uint64_t result = sub_22127DB38();
  if (result < 0) {
    goto LABEL_15;
  }
  uint64_t result = sub_22127DD78();
  if (v35) {
    unint64_t v36 = v34;
  }
  else {
    unint64_t v36 = result;
  }
  if (v36 >> 14 >= v34 >> 14)
  {
    uint64_t v37 = sub_22127DD88();
    uint64_t v39 = v38;
    uint64_t v41 = v40;
    uint64_t v43 = v42;
    swift_bridgeObjectRelease();
    MEMORY[0x223C7C940](v37, v39, v41, v43);
    swift_bridgeObjectRelease();
    uint64_t v44 = sub_22127D818();
    if (v45 >> 60 != 15)
    {
      uint64_t v47 = v44;
      unint64_t v48 = v45;
      CFAllocatorRef v49 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFDataRef v50 = (const __CFData *)sub_22127D898();
      SecCertificateRef v46 = SecCertificateCreateWithData(v49, v50);

      sub_22125C8FC(v47, v48);
      goto LABEL_12;
    }
LABEL_11:
    SecCertificateRef v46 = 0;
LABEL_12:
    swift_bridgeObjectRelease();
    return (uint64_t)v46;
  }
LABEL_16:
  __break(1u);
  return result;
}

uint64_t sub_2212756E4()
{
  uint64_t v0 = sub_22127D6A8();
  uint64_t v1 = *(void *)(v0 - 8);
  MEMORY[0x270FA5388](v2, v3);
  uint64_t v5 = (char *)&v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = objc_allocWithZone(MEMORY[0x263F08B08]);
  swift_bridgeObjectRetain();
  __n128 v7 = (void *)sub_22127DA78();
  swift_bridgeObjectRelease();
  id v8 = objc_msgSend(v6, sel_initWithString_, v7);

  sub_22127D698();
  uint64_t v9 = (void *)sub_22127D688();
  (*(void (**)(char *, uint64_t))(v1 + 8))(v5, v0);
  objc_msgSend(v8, sel_setCharactersToBeSkipped_, v9);

  uint64_t v10 = MEMORY[0x263F8EE78];
  uint64_t v26 = MEMORY[0x263F8EE78];
  if (objc_msgSend(v8, sel_isAtEnd))
  {
LABEL_2:
  }
  else
  {
    CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
    while (1)
    {
      sub_22127DD48();
      uint64_t v13 = v12;
      swift_bridgeObjectRelease();
      if (!v13) {
        goto LABEL_14;
      }
      sub_22127DD58();
      if (!v14) {
        goto LABEL_14;
      }
      uint64_t v15 = sub_22127D818();
      if (v16 >> 60 == 15)
      {
        swift_bridgeObjectRelease();
LABEL_14:

        goto LABEL_15;
      }
      uint64_t v17 = v15;
      unint64_t v18 = v16;
      CFDataRef v19 = (const __CFData *)sub_22127D898();
      SecCertificateRef v20 = SecCertificateCreateWithData(v11, v19);

      sub_22125C8FC(v17, v18);
      swift_bridgeObjectRelease();
      if (!v20) {
        goto LABEL_14;
      }
      sub_22127DD48();
      uint64_t v22 = v21;
      swift_bridgeObjectRelease();
      if (!v22) {
        break;
      }
      uint64_t v23 = v20;
      MEMORY[0x223C7CAD0]();
      if (*(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v26 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_22127DCA8();
      }
      sub_22127DCC8();
      sub_22127DC98();

      if (objc_msgSend(v8, sel_isAtEnd))
      {
        uint64_t v10 = v26;
        goto LABEL_2;
      }
    }

LABEL_15:
    swift_bridgeObjectRelease();
    return 0;
  }
  return v10;
}

unint64_t sub_2212759E4()
{
  unint64_t result = qword_267F493A0;
  if (!qword_267F493A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F493A0);
  }
  return result;
}

uint64_t sub_221275A38(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  BOOL v4 = __OFADD__(a1, a2);
  uint64_t result = a1 + a2;
  if (v4)
  {
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  switch(a4 >> 62)
  {
    case 1uLL:
      uint64_t v7 = (int)a3;
      uint64_t v6 = a3 >> 32;
      break;
    case 2uLL:
      uint64_t v7 = *(void *)(a3 + 16);
      uint64_t v6 = *(void *)(a3 + 24);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v7 = 0;
      uint64_t v6 = BYTE6(a4);
      break;
  }
  if (v6 < result || result < v7)
  {
LABEL_10:
    __break(1u);
    JUMPOUT(0x221275AA4);
  }
  return result;
}

uint64_t sub_221275AB4(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v4 = 0;
  uint64_t v5 = 0;
  switch(a4 >> 62)
  {
    case 1uLL:
      uint64_t v5 = (int)a3;
      uint64_t v4 = a3 >> 32;
      break;
    case 2uLL:
      uint64_t v5 = *(void *)(a3 + 16);
      uint64_t v4 = *(void *)(a3 + 24);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v5 = 0;
      uint64_t v4 = BYTE6(a4);
      break;
  }
  if (v4 < a1 || v5 > a1)
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  switch(a4 >> 62)
  {
    case 1uLL:
      uint64_t v7 = (int)a3;
      uint64_t v6 = a3 >> 32;
      break;
    case 2uLL:
      uint64_t v7 = *(void *)(a3 + 16);
      uint64_t v6 = *(void *)(a3 + 24);
      break;
    case 3uLL:
      break;
    default:
      uint64_t v7 = 0;
      uint64_t v6 = BYTE6(a4);
      break;
  }
  if (v6 < a2 || v7 > a2) {
    goto LABEL_16;
  }
  BOOL v8 = __OFSUB__(a2, a1);
  uint64_t result = a2 - a1;
  if (v8)
  {
LABEL_17:
    __break(1u);
    JUMPOUT(0x221275B80);
  }
  return result;
}

uint64_t sub_221275BA0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = a5 - a4;
  if (!a4) {
    uint64_t v5 = 0;
  }
  if (result < 0 || v5 < result)
  {
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (a3 < 0 || v5 < a3) {
    goto LABEL_19;
  }
  uint64_t v6 = a3 - result;
  if (a2 > 0)
  {
    if (v6 < 0 || v6 >= (unint64_t)a2) {
      goto LABEL_14;
    }
    return 0;
  }
  if (v6 <= 0 && v6 > a2) {
    return 0;
  }
LABEL_14:
  BOOL v7 = __OFADD__(result, a2);
  result += a2;
  if (v7)
  {
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    return result;
  }
  if (result < 0 || v5 < result) {
    goto LABEL_21;
  }
  return result;
}

uint64_t sub_221275C28(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4 - a3;
  if (!a3) {
    uint64_t v4 = 0;
  }
  if (result < 0 || v4 < result)
  {
    __break(1u);
  }
  else if ((a2 & 0x8000000000000000) == 0 && v4 >= a2)
  {
    return a2 - result;
  }
  __break(1u);
  return result;
}

unint64_t sub_221275C5C(unint64_t result, uint64_t a2, unint64_t a3)
{
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return result;
  }
  if ((a3 & 0x2000000000000000) != 0) {
    uint64_t v3 = HIBYTE(a3) & 0xF;
  }
  else {
    uint64_t v3 = a2 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t v4 = 7;
  if (((a3 >> 60) & ((a2 & 0x800000000000000) == 0)) != 0) {
    uint64_t v4 = 11;
  }
  unint64_t v5 = v4 | (v3 << 16);
  uint64_t result = sub_22127DB58();
  if (v6) {
    uint64_t result = v5;
  }
  if (4 * v3 < result >> 14) {
    goto LABEL_14;
  }
  return sub_22127DC08();
}

uint64_t sub_221275D0C(uint64_t result)
{
  if (result < 0)
  {
    __break(1u);
  }
  else
  {
    sub_22127DB58();
    return sub_22127DC08();
  }
  return result;
}

uint64_t sub_221275DA8(unint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0) {
    uint64_t v6 = HIBYTE(a6) & 0xF;
  }
  else {
    uint64_t v6 = a5 & 0xFFFFFFFFFFFFLL;
  }
  if (a3 == a5 && a4 == a6 && !(a1 >> 16) && a2 >> 16 == v6) {
    return 1;
  }
  else {
    return sub_22127DF78() & 1;
  }
}

unint64_t sub_221275E20(unint64_t result, uint64_t a2, unint64_t a3)
{
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_12:
    __break(1u);
    return result;
  }
  if ((a3 & 0x2000000000000000) != 0) {
    uint64_t v3 = HIBYTE(a3) & 0xF;
  }
  else {
    uint64_t v3 = a2 & 0xFFFFFFFFFFFFLL;
  }
  uint64_t result = sub_22127DB58();
  if (v4) {
    uint64_t result = 15;
  }
  if (4 * v3 < result >> 14) {
    goto LABEL_12;
  }
  return sub_22127DC08();
}

void *sub_221275EDC()
{
  return &unk_221281470;
}

void *sub_221275EE8()
{
  return &unk_221281450;
}

void *sub_221275EF4()
{
  return &unk_221281458;
}

void *sub_221275F00()
{
  return &unk_221281460;
}

void *sub_221275F0C()
{
  return &unk_221281468;
}

void *sub_221275F18()
{
  return &unk_221281478;
}

void *sub_221275F24()
{
  return &unk_221281480;
}

uint64_t sub_221275F30(uint64_t a1)
{
  sub_22125D79C(&qword_267F49340);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_221280F10;
  uint64_t v3 = MEMORY[0x263F8DA20];
  *(void *)(v2 + 56) = MEMORY[0x263F8D9D0];
  *(void *)(v2 + 64) = v3;
  *(void *)(v2 + 32) = a1;
  return sub_22127DAB8();
}

uint64_t sub_221275FAC(unint64_t a1)
{
  uint64_t v2 = sub_22126AEB4(0, 1, 1, MEMORY[0x263F8EE78]);
  unint64_t v3 = *((void *)v2 + 2);
  do
  {
    unint64_t v4 = *((void *)v2 + 3);
    if (v3 >= v4 >> 1) {
      uint64_t v2 = sub_22126AEB4((char *)(v4 > 1), v3 + 1, 1, v2);
    }
    *((void *)v2 + 2) = v3 + 1;
    v2[v3++ + 32] = a1;
    BOOL v5 = a1 > 0xFF;
    a1 >>= 8;
  }
  while (v5);
  return sub_221268A64((uint64_t)v2);
}

void *sub_221276058()
{
  return &unk_221281488;
}

uint64_t sub_221276064()
{
  return 48;
}

void *sub_22127606C()
{
  return &unk_221281490;
}

uint64_t sub_221276078()
{
  return 49;
}

void *sub_221276080()
{
  return &unk_221281498;
}

uint64_t sub_22127608C()
{
  return 19;
}

void *sub_221276094()
{
  return &unk_2212814A0;
}

uint64_t sub_2212760A0()
{
  return 20;
}

void *sub_2212760A8()
{
  return &unk_2212814A8;
}

uint64_t sub_2212760B4()
{
  return 22;
}

void *sub_2212760BC()
{
  return &unk_2212814B0;
}

uint64_t sub_2212760C8()
{
  return 23;
}

void *sub_2212760D0()
{
  return &unk_2212814B8;
}

uint64_t sub_2212760DC()
{
  return 79;
}

void *sub_2212760E4()
{
  return &unk_2212814C0;
}

uint64_t sub_2212760F0()
{
  return 80;
}

void *sub_2212760F8()
{
  return &unk_2212814C8;
}

uint64_t sub_221276104()
{
  return 24362;
}

void *sub_22127610C()
{
  return &unk_2212814D0;
}

uint64_t sub_221276118()
{
  return 24365;
}

void *sub_221276120()
{
  return &unk_2212814D8;
}

uint64_t sub_22127612C()
{
  return 111;
}

void *sub_221276134()
{
  return &unk_2212814E0;
}

uint64_t sub_221276140()
{
  return 130;
}

void *sub_221276148()
{
  return &unk_2212814E8;
}

uint64_t sub_221276154()
{
  return 149;
}

void *sub_22127615C()
{
  return &unk_2212814F0;
}

uint64_t sub_221276168()
{
  return 154;
}

void *sub_221276170()
{
  return &unk_2212814F8;
}

uint64_t sub_22127617C()
{
  return 156;
}

void *sub_221276184()
{
  return &unk_221281500;
}

uint64_t sub_221276190()
{
  return 40706;
}

void *sub_221276198()
{
  return &unk_221281508;
}

uint64_t sub_2212761A4()
{
  return 40707;
}

void *sub_2212761AC()
{
  return &unk_221281510;
}

uint64_t sub_2212761B8()
{
  return 40720;
}

void *sub_2212761C0()
{
  return &unk_221281518;
}

uint64_t sub_2212761CC()
{
  return 40722;
}

void *sub_2212761D4()
{
  return &unk_221281520;
}

uint64_t sub_2212761E0()
{
  return 40725;
}

void *sub_2212761E8()
{
  return &unk_221281528;
}

uint64_t sub_2212761F4()
{
  return 40730;
}

void *sub_2212761FC()
{
  return &unk_221281530;
}

uint64_t sub_221276208()
{
  return 40734;
}

void *sub_221276210()
{
  return &unk_221281538;
}

uint64_t sub_22127621C()
{
  return 40737;
}

void *sub_221276224()
{
  return &unk_221281540;
}

uint64_t sub_221276230()
{
  return 40743;
}

void *sub_221276238()
{
  return &unk_221281548;
}

uint64_t sub_221276244()
{
  return 40756;
}

void *sub_22127624C()
{
  return &unk_221281550;
}

uint64_t sub_221276258()
{
  return 40759;
}

void *sub_221276260()
{
  return &unk_221281558;
}

uint64_t sub_22127626C()
{
  return 40814;
}

void *sub_221276274()
{
  return &unk_221281560;
}

uint64_t sub_221276280()
{
  return 40803;
}

void *sub_221276288()
{
  return &unk_221281568;
}

uint64_t sub_221276294()
{
  return 40816;
}

void *sub_22127629C()
{
  return &unk_221281570;
}

uint64_t sub_2212762A8()
{
  return 40817;
}

void *sub_2212762B0()
{
  return &unk_221281578;
}

uint64_t sub_2212762BC()
{
  return 14647573;
}

void *sub_2212762C8()
{
  return &unk_221281580;
}

uint64_t sub_2212762D4()
{
  return 14647574;
}

void *sub_2212762E0()
{
  return &unk_221281588;
}

uint64_t sub_2212762EC()
{
  return 14647593;
}

void *sub_2212762F8()
{
  return &unk_221281590;
}

void *sub_221276304()
{
  return &unk_221281598;
}

uint64_t sub_221276310()
{
  return 24352;
}

void *sub_221276318()
{
  return &unk_2212815A0;
}

uint64_t sub_221276324()
{
  return 32560;
}

void *sub_22127632C()
{
  return &unk_2212815A8;
}

uint64_t sub_221276338()
{
  return 160;
}

void *sub_221276340()
{
  return &unk_2212815B0;
}

uint64_t sub_22127634C()
{
  return 161;
}

void *sub_221276354()
{
  return &unk_2212815B8;
}

uint64_t sub_221276360()
{
  return 177;
}

void *sub_221276368()
{
  return &unk_2212815C0;
}

uint64_t sub_221276374()
{
  return 190;
}

void *sub_22127637C()
{
  return &unk_2212815C8;
}

uint64_t sub_221276388()
{
  return 48946;
}

void *sub_221276390()
{
  return &unk_2212815D0;
}

uint64_t sub_22127639C()
{
  return 193;
}

void *sub_2212763A4()
{
  return &unk_2212815D8;
}

void *sub_2212763B0()
{
  return &unk_2212815E0;
}

uint64_t sub_2212763BC()
{
  return 194;
}

void *sub_2212763C4()
{
  return &unk_2212815E8;
}

uint64_t sub_2212763D0()
{
  return 196;
}

void *sub_2212763D8()
{
  return &unk_2212815F0;
}

uint64_t sub_2212763E4()
{
  return 197;
}

void *sub_2212763EC()
{
  return &unk_2212815F8;
}

void *sub_2212763F8()
{
  return &unk_221281600;
}

uint64_t sub_221276404()
{
  return 200;
}

void *sub_22127640C()
{
  return &unk_221281608;
}

uint64_t sub_221276418()
{
  return 201;
}

void *sub_221276420()
{
  return &unk_221281610;
}

uint64_t sub_22127642C()
{
  return 208;
}

void *sub_221276434()
{
  return &unk_221281618;
}

void *sub_221276440()
{
  return &unk_221281620;
}

uint64_t sub_22127644C()
{
  return 209;
}

void *sub_221276454()
{
  return &unk_221281628;
}

void *sub_221276460()
{
  return &unk_221281630;
}

uint64_t sub_22127646C()
{
  return 224;
}

void *sub_221276474()
{
  return &unk_221281638;
}

uint64_t sub_221276480()
{
  return 57137;
}

void *sub_221276488()
{
  return &unk_221281640;
}

uint64_t sub_221276494()
{
  return 57139;
}

void *sub_22127649C()
{
  return &unk_221281648;
}

uint64_t sub_2212764A8()
{
  return 14647806;
}

void *sub_2212764B4()
{
  return &unk_221281650;
}

uint64_t sub_2212764C0()
{
  return 14647807;
}

void *sub_2212764CC()
{
  return &unk_221281658;
}

uint64_t sub_2212764D8()
{
  return 14647805;
}

void *sub_2212764E4()
{
  return &unk_221281660;
}

void *sub_2212764F0()
{
  return &unk_221281668;
}

uint64_t sub_2212764FC()
{
  return 195;
}

void *sub_221276504()
{
  return &unk_221281670;
}

void *sub_221276510()
{
  return &unk_221281678;
}

uint64_t sub_22127651C()
{
  return 203;
}

void *sub_221276524()
{
  return &unk_221281680;
}

uint64_t sub_221276530()
{
  return 204;
}

void *sub_221276538()
{
  return &unk_221281688;
}

uint64_t sub_221276544()
{
  return 205;
}

void *sub_22127654C()
{
  return &unk_221281690;
}

void *sub_221276558()
{
  return &unk_221281698;
}

void *sub_221276564()
{
  return &unk_2212816A0;
}

void *sub_221276570()
{
  return &unk_2212816A8;
}

void *sub_22127657C()
{
  return &unk_2212816B0;
}

uint64_t sub_221276588()
{
  return 198;
}

void *sub_221276590()
{
  return &unk_2212816B8;
}

void *sub_22127659C()
{
  return &unk_2212816C0;
}

uint64_t sub_2212765A8()
{
  return 210;
}

void *sub_2212765B0()
{
  return &unk_2212816C8;
}

uint64_t sub_2212765BC()
{
  return 239;
}

void *sub_2212765C4()
{
  return &unk_2212816D0;
}

void *sub_2212765D0()
{
  return &unk_2212816D8;
}

void *sub_2212765DC()
{
  return &unk_2212816E0;
}

uint64_t sub_2212765E8()
{
  return 206;
}

void *sub_2212765F0()
{
  return &unk_2212816E8;
}

uint64_t sub_2212765FC()
{
  return 192;
}

void *sub_221276604()
{
  return &unk_2212816F0;
}

void *sub_221276610()
{
  return &unk_2212816F8;
}

void *sub_22127661C()
{
  return &unk_221281700;
}

void *sub_221276628()
{
  return &unk_221281708;
}

void *sub_221276634()
{
  return &unk_221281710;
}

void *sub_221276640()
{
  return &unk_221281718;
}

void *sub_22127664C()
{
  return &unk_221281720;
}

void *sub_221276658()
{
  return &unk_221281728;
}

uint64_t sub_221276664()
{
  return 15;
}

void *sub_22127666C()
{
  return &unk_221281729;
}

uint64_t sub_221276678()
{
  return 240;
}

void *sub_221276680()
{
  return &unk_221281730;
}

uint64_t sub_22127668C()
{
  uint64_t result = sub_22126B244(0x3030303030303030, 0xEC00000030303030);
  if (v1 >> 60 == 15)
  {
    __break(1u);
  }
  else
  {
    qword_267F4B1C0 = result;
    *(void *)algn_267F4B1C8 = v1;
  }
  return result;
}

uint64_t *sub_2212766D0()
{
  if (qword_267F49258 != -1) {
    swift_once();
  }
  return &qword_267F4B1C0;
}

uint64_t sub_22127671C()
{
  if (qword_267F49258 != -1) {
    swift_once();
  }
  uint64_t v0 = qword_267F4B1C0;
  sub_22125D744(qword_267F4B1C0, *(unint64_t *)algn_267F4B1C8);
  return v0;
}

void *sub_221276788()
{
  return &unk_221281738;
}

void *sub_221276794()
{
  return &unk_221281740;
}

void *sub_2212767A0()
{
  return &unk_221281748;
}

uint64_t sub_2212767AC()
{
  return 8;
}

void *sub_2212767B4()
{
  return &unk_221281750;
}

void *sub_2212767C0()
{
  return &unk_221281758;
}

void *sub_2212767CC()
{
  return &unk_221281760;
}

void *sub_2212767D8()
{
  return &unk_221281768;
}

void *sub_2212767E4()
{
  return &unk_221281770;
}

void *sub_2212767F0()
{
  return &unk_221281778;
}

void *sub_2212767FC()
{
  return &unk_221281780;
}

void *sub_221276808()
{
  return &unk_221281788;
}

void *sub_221276814()
{
  return &unk_221281790;
}

uint64_t sub_221276820()
{
  return 63;
}

void *sub_221276828()
{
  return &unk_221281791;
}

void *sub_221276834()
{
  return &unk_221281798;
}

void *sub_221276840()
{
  return &unk_2212817A0;
}

uint64_t sub_22127684C()
{
  return 7;
}

void *sub_221276854()
{
  return &unk_2212817A8;
}

void *sub_221276860()
{
  return &unk_2212817B0;
}

void *sub_22127686C()
{
  return &unk_2212817B8;
}

uint64_t sub_221276878()
{
  return 3;
}

void *sub_221276884()
{
  return &unk_2212817C8;
}

uint64_t sub_221276890()
{
  return 5;
}

void *sub_22127689C()
{
  return &unk_2212817D8;
}

void *sub_2212768A8()
{
  return &unk_2212817E0;
}

void *sub_2212768B4()
{
  return &unk_2212817E8;
}

void *sub_2212768C0()
{
  return &unk_2212817E9;
}

void *sub_2212768CC()
{
  return &unk_2212817F0;
}

uint64_t sub_2212768D8()
{
  return 32585;
}

void *sub_2212768E0()
{
  return &unk_2212817F8;
}

uint64_t sub_2212768EC()
{
  return 176;
}

uint64_t sub_2212768F4(unint64_t a1, char a2)
{
  uint64_t v2 = 64;
  if (a2) {
    uint64_t v2 = 96;
  }
  if (a1 <= 0x1F) {
    return v2 | a1;
  }
  uint64_t v4 = v2 | 0x1F;
  if (a1 < 0x80) {
    return a1 | (v4 << 8);
  }
  do
  {
    uint64_t v4 = a1 & 0x7F | (v4 << 8) | 0x80;
    unint64_t v5 = a1 >> 7;
    BOOL v6 = a1 >= 0x4000;
    a1 >>= 7;
  }
  while (v6);
  return v5 | (v4 << 8);
}

uint64_t sub_221276950(unint64_t a1, char a2)
{
  uint64_t v2 = 128;
  if (a2) {
    uint64_t v2 = 160;
  }
  if (a1 <= 0x1F) {
    return v2 | a1;
  }
  uint64_t v4 = v2 | 0x1F;
  if (a1 < 0x80) {
    return a1 | (v4 << 8);
  }
  do
  {
    uint64_t v4 = a1 & 0x7F | (v4 << 8) | 0x80;
    unint64_t v5 = a1 >> 7;
    BOOL v6 = a1 >= 0x4000;
    a1 >>= 7;
  }
  while (v6);
  return v5 | (v4 << 8);
}

uint64_t sub_2212769AC(unint64_t a1, char a2)
{
  uint64_t v2 = 192;
  if (a2) {
    uint64_t v2 = 224;
  }
  if (a1 <= 0x1F) {
    return v2 | a1;
  }
  uint64_t v4 = v2 | 0x1F;
  if (a1 < 0x80) {
    return a1 | (v4 << 8);
  }
  do
  {
    uint64_t v4 = a1 & 0x7F | (v4 << 8) | 0x80;
    unint64_t v5 = a1 >> 7;
    BOOL v6 = a1 >= 0x4000;
    a1 >>= 7;
  }
  while (v6);
  return v5 | (v4 << 8);
}

uint64_t sub_221276A08()
{
  uint64_t v1 = *v0;
  sub_22125D79C(&qword_267F49340);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_221280F10;
  uint64_t v3 = MEMORY[0x263F8DA20];
  *(void *)(v2 + 56) = MEMORY[0x263F8D9D0];
  *(void *)(v2 + 64) = v3;
  *(void *)(v2 + 32) = v1;
  return sub_22127DAB8();
}

ValueMetadata *type metadata accessor for TLVTag()
{
  return &type metadata for TLVTag;
}

uint64_t sub_221276A94(unint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = sub_221276E1C(a1[2], a2, a3);
  if (!v3)
  {
    int64_t v8 = sub_22126D0A4();
    sub_221276F10(v8, a2, a3);
    unint64_t v10 = a1[3];
    unint64_t i = a1[4];
    if ((i & 0x2000000000000000) == 0)
    {
      v20[0] = a1[3];
      v20[1] = i;
      CFAllocatorRef v11 = *(void (**)(void *, void, unint64_t, uint64_t, uint64_t))(a3 + 16);
      sub_22125D744(v10, i);
      unint64_t v12 = sub_22127706C();
      v11(v20, MEMORY[0x263F06F78], v12, a2, a3);
      goto LABEL_16;
    }
    if (v10 >> 62) {
      goto LABEL_15;
    }
    uint64_t v13 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    for (; v13; uint64_t v13 = sub_22127DF08())
    {
      unint64_t v18 = i;
      unint64_t v19 = v10;
      unint64_t v21 = v10 & 0xC000000000000001;
      for (unint64_t i = 4; ; ++i)
      {
        unint64_t v14 = i - 4;
        if (!v21) {
          break;
        }
        unint64_t v10 = MEMORY[0x223C7CCC0](i - 4, v10);
        unint64_t v15 = i - 3;
        if (__OFADD__(v14, 1)) {
          goto LABEL_14;
        }
LABEL_12:
        sub_221276A94(v10, a2, a3);
        swift_release();
        unint64_t v10 = v19;
        if (v15 == v13)
        {
          uint64_t v16 = v19;
          unint64_t v17 = v18;
          return sub_22126D398(v16, v17);
        }
      }
      unint64_t v10 = *(void *)(v10 + 8 * i);
      swift_retain();
      unint64_t v15 = i - 3;
      if (!__OFADD__(v14, 1)) {
        goto LABEL_12;
      }
LABEL_14:
      __break(1u);
LABEL_15:
      swift_bridgeObjectRetain();
    }
LABEL_16:
    uint64_t v16 = v10;
    unint64_t v17 = i;
    return sub_22126D398(v16, v17);
  }
  return result;
}

uint64_t sub_221276C68(uint64_t a1)
{
  uint64_t v2 = swift_allocObject();
  if (a1)
  {
    if (a1 <= 14)
    {
      uint64_t v4 = 0;
      unint64_t v5 = 0;
    }
    else
    {
      sub_22127D738();
      swift_allocObject();
      uint64_t v3 = sub_22127D728();
      if ((unint64_t)a1 > 0x7FFFFFFE)
      {
        sub_22127D828();
        uint64_t v4 = swift_allocObject();
        unint64_t v5 = v3 | 0x8000000000000000;
        *(void *)(v4 + 16) = 0;
        *(void *)(v4 + 24) = 0;
      }
      else
      {
        uint64_t v4 = 0;
        unint64_t v5 = v3 | 0x4000000000000000;
      }
    }
  }
  else
  {
    uint64_t v4 = 0;
    unint64_t v5 = 0xC000000000000000;
  }
  *(void *)(v2 + 16) = v4;
  *(void *)(v2 + 24) = v5;
  return v2;
}

uint64_t sub_221276D28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11 = *(void *)(a5 - 8);
  uint64_t v12 = MEMORY[0x270FA5388]();
  unint64_t v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = v16(v12, v12 + *(void *)(*(void *)(v15 - 8) + 64), v14);
  if (v8) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a8, v14, a5);
  }
  return result;
}

uint64_t sub_221276E1C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  if (a1)
  {
    unint64_t v11 = bswap64(a1);
    return sub_2212770C0((uint64_t)&v11, (uint64_t)&v12, v3, __clz(a1) >> 3, a2, a3, &v10);
  }
  else
  {
    LOBYTE(v11) = 0;
    BOOL v7 = *(uint64_t (**)(unint64_t *, void, unint64_t, unint64_t, uint64_t, uint64_t))(a3 + 8);
    unint64_t v8 = sub_221273878();
    unint64_t v9 = sub_2212738CC();
    return v7(&v11, MEMORY[0x263F8E778], v8, v9, a2, a3);
  }
}

uint64_t sub_221276F10(int64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (a1 > 127)
  {
    unint64_t v12 = __clz(a1) >> 3;
    LOBYTE(v17) = -120 - v12;
    uint64_t v13 = *(uint64_t (**)(unint64_t *, void, unint64_t, unint64_t, uint64_t, uint64_t))(a3 + 8);
    unint64_t v14 = sub_221273878();
    unint64_t v15 = sub_2212738CC();
    uint64_t result = v13(&v17, MEMORY[0x263F8E778], v14, v15, a2, a3);
    if (!v4)
    {
      unint64_t v17 = bswap64(a1);
      return sub_2212770C0((uint64_t)&v17, (uint64_t)&v18, v3, v12, a2, a3, &v16);
    }
  }
  else
  {
    if (a1 < 0) {
      __break(1u);
    }
    LOBYTE(v17) = a1;
    unint64_t v8 = *(uint64_t (**)(unint64_t *, void, unint64_t, unint64_t, uint64_t, uint64_t))(a3 + 8);
    unint64_t v9 = sub_221273878();
    unint64_t v10 = sub_2212738CC();
    return v8(&v17, MEMORY[0x263F8E778], v9, v10, a2, a3);
  }
  return result;
}

unint64_t sub_22127706C()
{
  unint64_t result = qword_267F493A8;
  if (!qword_267F493A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F493A8);
  }
  return result;
}

uint64_t sub_2212770C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  v18[0] = sub_221274E74(a4, a1, a2);
  v18[1] = v11;
  _OWORD v18[2] = v12;
  v18[3] = v13;
  unint64_t v14 = *(uint64_t (**)(void *, uint64_t, unint64_t, uint64_t, uint64_t))(a6 + 16);
  uint64_t v15 = sub_22125D79C(&qword_267F49368);
  unint64_t v16 = sub_221278224();
  uint64_t result = v14(v18, v15, v16, a5, a6);
  if (v7) {
    *a7 = v7;
  }
  return result;
}

id sub_221277174(uint64_t a1, uint64_t a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  sub_22127D658();
  MEMORY[0x270FA5388](v4, v5);
  uint64_t v18 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_22127D668();
  uint64_t v19 = *(void *)(v7 - 8);
  v10.n128_f64[0] = MEMORY[0x270FA5388](v8, v9);
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *(void *)(a2 - 8);
  uint64_t v14 = *(void *)(v13 + 64);
  MEMORY[0x270FA5388](v10, v15);
  sub_22127DEE8();
  uint64_t v22 = v2;
  sub_221276D28((uint64_t)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t)sub_221277BB4, (uint64_t)v21, a2, MEMORY[0x263F8E628], MEMORY[0x263F8D6C8], MEMORY[0x263F8E658], v16);
  id result = (id)(*(uint64_t (**)(char *, uint64_t))(v13 + 8))((char *)&v18 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0), a2);
  if (v20 < 0)
  {
    id result = objc_msgSend(v2, sel_streamError);
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  else
  {
    if (v20 == v14) {
      return result;
    }
    sub_22127D648();
    sub_22125F2C0(MEMORY[0x263F8EE78]);
    sub_2212780EC();
    sub_22127D7C8();
    sub_22127D638();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v12, v7);
  }
  return (id)swift_willThrow();
}

char *sub_221277440(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v45 = a1;
  sub_22127D658();
  MEMORY[0x270FA5388](v5, v6);
  v40[1] = (char *)v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_22127D668();
  uint64_t v41 = *(void *)(v8 - 8);
  uint64_t v42 = v8;
  MEMORY[0x270FA5388](v9, v10);
  v40[0] = (char *)v40 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = a3;
  uint64_t v51 = a2;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v44 = *(void *)(AssociatedTypeWitness - 8);
  MEMORY[0x270FA5388](v13, v14);
  uint64_t v16 = (char *)v40 - v15;
  sub_22127DD68();
  MEMORY[0x270FA5388](v17, v18);
  uint64_t v20 = (char *)v40 - v19;
  swift_checkMetadataState();
  MEMORY[0x270FA5388](v21, v22);
  uint64_t v23 = swift_getAssociatedTypeWitness();
  uint64_t v43 = *(void *)(v23 - 8);
  MEMORY[0x270FA5388](v24, v25);
  unint64_t v27 = (char *)v40 - v26;
  sub_22127D6B8();
  unint64_t v48 = v27;
  sub_22127DC18();
  uint64_t v49 = v23;
  uint64_t AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  unint64_t v28 = 0;
  uint64_t v29 = (unsigned int (**)(char *, uint64_t, uint64_t))(v44 + 48);
  uint64_t v30 = (double (**)(char *, char *, uint64_t))(v44 + 32);
  uint64_t v31 = (void (**)(char *, uint64_t))(v44 + 8);
  while (1)
  {
    sub_22127DD98();
    if ((*v29)(v20, 1, AssociatedTypeWitness) == 1) {
      goto LABEL_7;
    }
    v32.n128_f64[0] = (*v30)(v16, v20, AssociatedTypeWitness);
    MEMORY[0x270FA5388](v32, v33);
    v40[-2] = v46;
    swift_getAssociatedConformanceWitness();
    uint64_t v34 = v52;
    sub_22127D748();
    uint64_t v52 = v34;
    uint64_t v35 = v53;
    if (v53 < 0) {
      break;
    }
    (*v31)(v16, AssociatedTypeWitness);
    BOOL v36 = __OFADD__(v28, v35);
    v28 += v35;
    if (v36)
    {
      __break(1u);
LABEL_7:
      (*(void (**)(char *, uint64_t))(v43 + 8))(v48, v49);
      id result = (char *)sub_22127DCD8();
      if (v28 != result)
      {
        sub_22127D648();
        sub_22125F2C0(MEMORY[0x263F8EE78]);
        sub_2212780EC();
        uint64_t v38 = v40[0];
        uint64_t v39 = v42;
        sub_22127D7C8();
        sub_22127D638();
        (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v38, v39);
        return (char *)swift_willThrow();
      }
      return result;
    }
  }
  id result = (char *)objc_msgSend(v46, sel_streamError);
  if (result)
  {
    swift_willThrow();
    (*v31)(v16, AssociatedTypeWitness);
    return (char *)(*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v48, v49);
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_2212779C8@<X0>(id a1@<X2>, id result@<X0>, uint64_t a3@<X1>, void *a4@<X8>)
{
  if (result)
  {
    id result = objc_msgSend(a1, sel_write_maxLength_, result, a3 - (void)result);
    *a4 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_221277A18(uint64_t a1, uint64_t a2)
{
  return sub_221277174(a1, a2);
}

char *sub_221277A30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_221277440(a1, a2, a3);
}

uint64_t sub_221277A48(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = a1[1];
  uint64_t v4 = *a2;
  swift_beginAccess();
  uint64_t v5 = *(void *)(v4 + 16);
  unint64_t v6 = *(void *)(v4 + 24);
  *(void *)(v4 + 16) = v2;
  *(void *)(v4 + 24) = v3;
  sub_22125D744(v2, v3);
  return sub_22125C910(v5, v6);
}

uint64_t sub_221277AB8()
{
  swift_beginAccess();
  uint64_t v1 = *(void *)(v0 + 16);
  sub_22125D744(v1, *(void *)(v0 + 24));
  return v1;
}

uint64_t sub_221277B08(uint64_t a1)
{
  uint64_t v2 = v1;
  if (a1)
  {
    unint64_t v3 = a1;
    if (a1 <= 14)
    {
      a1 = 0;
      unint64_t v5 = 0;
    }
    else
    {
      sub_22127D738();
      swift_allocObject();
      uint64_t v4 = sub_22127D728();
      if (v3 > 0x7FFFFFFE)
      {
        sub_22127D828();
        a1 = swift_allocObject();
        unint64_t v5 = v4 | 0x8000000000000000;
        *(void *)(a1 + 16) = 0;
        *(void *)(a1 + 24) = 0;
      }
      else
      {
        a1 = 0;
        unint64_t v5 = v4 | 0x4000000000000000;
      }
    }
  }
  else
  {
    unint64_t v5 = 0xC000000000000000;
  }
  *(void *)(v2 + 16) = a1;
  *(void *)(v2 + 24) = v5;
  return v2;
}

id sub_221277BB4@<X0>(id result@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  if (result)
  {
    id result = objc_msgSend(*(id *)(v3 + 16), sel_write_maxLength_, result, a2 - (void)result);
    *a3 = result;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_221277C00(__n128 a1, __n128 a2, uint64_t a3, uint64_t a4)
{
  v11[1] = *MEMORY[0x263EF8340];
  uint64_t v6 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](a1, a2);
  uint64_t v8 = (char *)v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22127DEE8();
  sub_221276D28((uint64_t)v8, (uint64_t)sub_221278144, v4, a4, MEMORY[0x263F8E628], MEMORY[0x263F8EE60] + 8, MEMORY[0x263F8E658], v9);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, a4);
}

uint64_t sub_221277D50(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  v5[3] = MEMORY[0x263F8D3E8];
  v5[4] = MEMORY[0x263F07B80];
  v5[0] = a1;
  v5[1] = a2;
  sub_22126A4B8(v5, MEMORY[0x263F8D3E8]);
  sub_22127D858();
  sub_22125DE98((uint64_t)v5);
  return swift_endAccess();
}

uint64_t sub_221277DE4()
{
  return swift_endAccess();
}

uint64_t sub_221277E68()
{
  sub_22125C910(*(void *)(v0 + 16), *(void *)(v0 + 24));
  return v0;
}

uint64_t sub_221277E88()
{
  sub_22125C910(*(void *)(v0 + 16), *(void *)(v0 + 24));
  return MEMORY[0x270FA0228](v0, 32, 7);
}

uint64_t sub_221277EC0(uint64_t a1, uint64_t a2, __n128 a3, __n128 a4)
{
  return sub_221277C00(a3, a4, a1, a2);
}

uint64_t sub_221277ED8()
{
  return sub_221277DE4();
}

uint64_t sub_221277EF0(__n128 a1, __n128 a2, uint64_t a3, uint64_t a4)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v6 = *(void *)(a4 - 8);
  MEMORY[0x270FA5388](a1, a2);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22127DEE8();
  uint64_t v14 = v4;
  uint64_t v9 = sub_22125D79C(&qword_267F493B0);
  sub_221276D28((uint64_t)v8, (uint64_t)sub_221278164, (uint64_t)v13, a4, v9, MEMORY[0x263F8EE60] + 8, MEMORY[0x263F8E4E0], (uint64_t)&v12);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, a4);
}

uint64_t sub_221278058(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  sub_221273664();
  uint64_t result = sub_22127DCF8();
  if (v4) {
    *a4 = v4;
  }
  return result;
}

uint64_t sub_2212780BC(uint64_t a1, uint64_t a2, __n128 a3, __n128 a4)
{
  return sub_221277EF0(a3, a4, a1, a2);
}

uint64_t sub_2212780D4()
{
  return sub_22127DCF8();
}

unint64_t sub_2212780EC()
{
  unint64_t result = qword_267F49378;
  if (!qword_267F49378)
  {
    sub_22127D668();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F49378);
  }
  return result;
}

uint64_t sub_221278144(uint64_t a1, uint64_t a2)
{
  return sub_221277D50(a1, a2);
}

uint64_t sub_221278164(uint64_t a1, uint64_t a2, void *a3)
{
  return sub_221278058(a1, a2, *(void *)(v3 + 16), a3);
}

uint64_t sub_221278184@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_beginAccess();
  uint64_t v4 = *(void *)(v3 + 16);
  unint64_t v5 = *(void *)(v3 + 24);
  *a2 = v4;
  a2[1] = v5;
  return sub_22125D744(v4, v5);
}

uint64_t type metadata accessor for DERMemoryWriter()
{
  return self;
}

uint64_t sub_2212781F8()
{
  return sub_22127D858();
}

unint64_t sub_221278224()
{
  unint64_t result = qword_267F493B8[0];
  if (!qword_267F493B8[0])
  {
    sub_22126045C(&qword_267F49368);
    sub_221273664();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_267F493B8);
  }
  return result;
}

uint64_t sub_221278298@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  v11.n128_f64[0] = MEMORY[0x270FA5388](v9, v10);
  __n128 v13 = (char *)&v20 - v12;
  double v15 = MEMORY[0x270FA5388](v11, v14);
  __n128 v17 = (char *)&v20 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v18 + 16))(v17, v3, a2, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v13, a1, AssociatedTypeWitness);
  return sub_221278964((uint64_t)v17, (uint64_t)v13, a2, a3);
}

uint64_t sub_221278434@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v16 = a2;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = sub_22127DD68();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v7, v8);
  __n128 v10 = (char *)&v15 - v9;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  sub_22127DD98();
  uint64_t v11 = *(void *)(AssociatedTypeWitness - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v10, 1, AssociatedTypeWitness) == 1)
  {
    uint64_t v12 = v2 + *(int *)(a1 + 36);
    uint64_t v13 = v16;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v16, v12, AssociatedTypeWitness);
    (*(void (**)(char *, uint64_t))(v6 + 8))(v10, v5);
  }
  else
  {
    uint64_t v13 = v16;
    (*(void (**)(uint64_t, char *, uint64_t))(v11 + 32))(v16, v10, AssociatedTypeWitness);
  }
  return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v11 + 56))(v13, 0, 1, AssociatedTypeWitness);
}

uint64_t sub_22127864C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 32))(a3, a1, AssociatedTypeWitness);
  uint64_t v7 = a3 + *(int *)(type metadata accessor for LazyPaddedSequence.Iterator() + 36);
  uint64_t v8 = swift_getAssociatedTypeWitness();
  uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 32);
  return v9(v7, a2, v8);
}

uint64_t sub_221278758@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = v2;
  uint64_t v24 = a2;
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  v10.n128_f64[0] = MEMORY[0x270FA5388](v8, v9);
  uint64_t v12 = (char *)&v23 - v11;
  uint64_t v13 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v10, v14);
  uint64_t v16 = (char *)&v23 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getAssociatedTypeWitness();
  double v19 = MEMORY[0x270FA5388](v17, v18);
  __n128 v21 = (char *)&v23 - v20;
  (*(void (**)(char *, uint64_t, uint64_t, double))(v13 + 16))(v16, v3, v5, v19);
  sub_22127DC18();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v12, v3 + *(int *)(a1 + 36), AssociatedTypeWitness);
  return sub_22127864C((uint64_t)v21, (uint64_t)v12, v24);
}

uint64_t sub_221278964@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a3 - 8) + 32))(a4, a1);
  uint64_t v6 = a4 + *(int *)(type metadata accessor for LazyPaddedSequence() + 36);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  __n128 v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(AssociatedTypeWitness - 8) + 32);
  return v8(v6, a2, AssociatedTypeWitness);
}

uint64_t sub_221278A40()
{
  return swift_getWitnessTable();
}

uint64_t sub_221278A60()
{
  return swift_getWitnessTable();
}

uint64_t sub_221278A7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_221278758(a1, a2);
  uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(a1 - 8) + 8);
  return v4(v2, a1);
}

uint64_t sub_221278ADC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_22127A5D8(v2, a1, a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(a1 - 8) + 8))(v2, a1);
  return v4;
}

uint64_t sub_221278B50()
{
  return sub_22127DC38();
}

uint64_t sub_221278B74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA01A8](a1, a2, a3, 24);
}

uint64_t sub_221278B7C()
{
  uint64_t AssociatedTypeWitness = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return AssociatedTypeWitness;
}

uint64_t *sub_221278C6C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v9 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v10 = *(_DWORD *)(v9 + 80);
  uint64_t v11 = v7 + v10;
  uint64_t v12 = (*(unsigned char *)(v6 + 80) | *(unsigned char *)(v9 + 80));
  if (v12 > 7
    || ((*(_DWORD *)(v6 + 80) | *(_DWORD *)(v9 + 80)) & 0x100000) != 0
    || (v11 & (unint64_t)~v10) + *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64) > 0x18)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v12 + 16) & ~v12));
    swift_retain();
  }
  else
  {
    uint64_t v16 = AssociatedTypeWitness;
    uint64_t v17 = ~v10;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 16))(((unint64_t)a1 + v11) & v17, ((unint64_t)a2 + v11) & v17, v16);
  }
  return a1;
}

uint64_t sub_221278DEC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(*(void *)(a2 + 16) - 8) + 8;
  (*(void (**)(uint64_t, void))v3)(a1, *(void *)(a2 + 16));
  uint64_t v4 = *(void *)(v3 + 56) + a1;
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v6 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v7 = *(uint64_t (**)(unint64_t, uint64_t))(v6 + 8);
  uint64_t v8 = AssociatedTypeWitness;
  unint64_t v9 = (v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  return v7(v9, v8);
}

uint64_t sub_221278EB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 16;
  (*(void (**)(uint64_t, uint64_t, void))v5)(a1, a2, *(void *)(a3 + 16));
  uint64_t v6 = *(void *)(v5 + 48);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 16))((v6 + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (v6 + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), AssociatedTypeWitness);
  return a1;
}

uint64_t sub_221278F8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 24;
  (*(void (**)(uint64_t, uint64_t, void))v5)(a1, a2, *(void *)(a3 + 16));
  uint64_t v6 = *(void *)(v5 + 40);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 24))((v6 + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (v6 + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), AssociatedTypeWitness);
  return a1;
}

uint64_t sub_221279060(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 32;
  (*(void (**)(uint64_t, uint64_t, void))v5)(a1, a2, *(void *)(a3 + 16));
  uint64_t v6 = *(void *)(v5 + 32);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 32))((v6 + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (v6 + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), AssociatedTypeWitness);
  return a1;
}

uint64_t sub_221279134(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(*(void *)(a3 + 16) - 8) + 40;
  (*(void (**)(uint64_t, uint64_t, void))v5)(a1, a2, *(void *)(a3 + 16));
  uint64_t v6 = *(void *)(v5 + 24);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(AssociatedTypeWitness - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 40))((v6 + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (v6 + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), AssociatedTypeWitness);
  return a1;
}

uint64_t sub_221279208(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int *)(v6 + 84);
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v9 = *(void *)(AssociatedTypeWitness - 8);
  unsigned int v10 = *(_DWORD *)(v9 + 84);
  if (v10 <= v7) {
    unsigned int v11 = v7;
  }
  else {
    unsigned int v11 = *(_DWORD *)(v9 + 84);
  }
  uint64_t v12 = *(unsigned __int8 *)(v9 + 80);
  if (!a2) {
    return 0;
  }
  uint64_t v13 = *(void *)(v6 + 64) + v12;
  if (a2 <= v11) {
    goto LABEL_24;
  }
  uint64_t v14 = (v13 & ~v12) + *(void *)(*(void *)(AssociatedTypeWitness - 8) + 64);
  char v15 = 8 * v14;
  if (v14 <= 3)
  {
    unsigned int v17 = ((a2 - v11 + ~(-1 << v15)) >> v15) + 1;
    if (HIWORD(v17))
    {
      int v16 = *(_DWORD *)((char *)a1 + v14);
      if (!v16) {
        goto LABEL_24;
      }
      goto LABEL_14;
    }
    if (v17 > 0xFF)
    {
      int v16 = *(unsigned __int16 *)((char *)a1 + v14);
      if (!*(unsigned __int16 *)((char *)a1 + v14)) {
        goto LABEL_24;
      }
      goto LABEL_14;
    }
    if (v17 < 2)
    {
LABEL_24:
      if (v11)
      {
        if (v7 >= v10)
        {
          uint64_t v23 = *(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(v6 + 48);
          return v23(a1, v7, v5);
        }
        else
        {
          __n128 v21 = *(uint64_t (**)(unint64_t))(v9 + 48);
          return v21(((unint64_t)a1 + v13) & ~v12);
        }
      }
      return 0;
    }
  }
  int v16 = *((unsigned __int8 *)a1 + v14);
  if (!*((unsigned char *)a1 + v14)) {
    goto LABEL_24;
  }
LABEL_14:
  int v18 = (v16 - 1) << v15;
  if (v14 > 3) {
    int v18 = 0;
  }
  if (v14)
  {
    if (v14 <= 3) {
      int v19 = v14;
    }
    else {
      int v19 = 4;
    }
    switch(v19)
    {
      case 2:
        int v20 = *a1;
        break;
      case 3:
        int v20 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        int v20 = *(_DWORD *)a1;
        break;
      default:
        int v20 = *(unsigned __int8 *)a1;
        break;
    }
  }
  else
  {
    int v20 = 0;
  }
  return v11 + (v20 | v18) + 1;
}

void sub_22127949C(unsigned char *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a4 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v24 = v8;
  uint64_t v9 = *(unsigned int *)(v8 + 84);
  uint64_t v10 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  uint64_t v11 = v10;
  unsigned int v12 = *(_DWORD *)(v10 + 84);
  if (v12 <= v9) {
    unsigned int v13 = v9;
  }
  else {
    unsigned int v13 = *(_DWORD *)(v10 + 84);
  }
  uint64_t v14 = *(unsigned __int8 *)(v10 + 80);
  uint64_t v15 = *(void *)(v8 + 64) + v14;
  size_t v16 = (v15 & ~v14) + *(void *)(v10 + 64);
  if (a3 <= v13)
  {
    int v17 = 0;
  }
  else if (v16 <= 3)
  {
    unsigned int v20 = ((a3 - v13 + ~(-1 << (8 * v16))) >> (8 * v16)) + 1;
    if (HIWORD(v20))
    {
      int v17 = 4;
    }
    else if (v20 >= 0x100)
    {
      int v17 = 2;
    }
    else
    {
      int v17 = v20 > 1;
    }
  }
  else
  {
    int v17 = 1;
  }
  if (v13 < a2)
  {
    unsigned int v18 = ~v13 + a2;
    if (v16 < 4)
    {
      int v19 = (v18 >> (8 * v16)) + 1;
      if (v16)
      {
        int v21 = v18 & ~(-1 << (8 * v16));
        bzero(a1, v16);
        if (v16 == 3)
        {
          *(_WORD *)a1 = v21;
          a1[2] = BYTE2(v21);
        }
        else if (v16 == 2)
        {
          *(_WORD *)a1 = v21;
        }
        else
        {
          *a1 = v21;
        }
      }
    }
    else
    {
      bzero(a1, v16);
      *(_DWORD *)a1 = v18;
      int v19 = 1;
    }
    switch(v17)
    {
      case 1:
        a1[v16] = v19;
        return;
      case 2:
        *(_WORD *)&a1[v16] = v19;
        return;
      case 3:
        goto LABEL_41;
      case 4:
        *(_DWORD *)&a1[v16] = v19;
        return;
      default:
        return;
    }
  }
  switch(v17)
  {
    case 1:
      a1[v16] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 2:
      *(_WORD *)&a1[v16] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_41:
      __break(1u);
      JUMPOUT(0x2212797B0);
    case 4:
      *(_DWORD *)&a1[v16] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        if (v9 >= v12)
        {
          uint64_t v23 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v24 + 56);
          v23(a1, a2, v9, v7);
        }
        else
        {
          __n128 v22 = *(void (**)(unint64_t, uint64_t))(v11 + 56);
          v22((unint64_t)&a1[v15] & ~v14, a2);
        }
      }
      return;
  }
}

uint64_t type metadata accessor for LazyPaddedSequence()
{
  return sub_22127A5DC();
}

uint64_t sub_2212797F0()
{
  uint64_t result = swift_getAssociatedTypeWitness();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_getAssociatedTypeWitness();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_2212798F4(uint64_t *a1, uint64_t *a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(_DWORD *)(v8 + 80);
  uint64_t v10 = v6 + v9;
  uint64_t v11 = (*(unsigned char *)(v5 + 80) | *(unsigned char *)(v8 + 80));
  if (v11 > 7
    || ((*(_DWORD *)(v5 + 80) | *(_DWORD *)(v8 + 80)) & 0x100000) != 0
    || ((v6 + v9) & (unint64_t)~v9) + *(void *)(*(void *)(v7 - 8) + 64) > 0x18)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v11 + 16) & ~v11));
    swift_retain();
  }
  else
  {
    uint64_t v15 = v7;
    uint64_t v16 = ~v9;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v5 + 16))(a1, a2, AssociatedTypeWitness);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 16))(((unint64_t)a1 + v10) & v16, ((unint64_t)a2 + v10) & v16, v15);
  }
  return a1;
}

uint64_t sub_221279A9C(uint64_t a1)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v3 = *(void *)(AssociatedTypeWitness - 8) + 8;
  (*(void (**)(uint64_t, uint64_t))v3)(a1, AssociatedTypeWitness);
  uint64_t v4 = *(void *)(v3 + 56) + a1;
  uint64_t v5 = swift_getAssociatedTypeWitness();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(uint64_t (**)(unint64_t, uint64_t))(v6 + 8);
  uint64_t v8 = v5;
  unint64_t v9 = (v4 + *(unsigned __int8 *)(v6 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  return v7(v9, v8);
}

uint64_t sub_221279B90(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8) + 16;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v5)(a1, a2, AssociatedTypeWitness);
  uint64_t v6 = *(void *)(v5 + 48);
  uint64_t v7 = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 16))((v6 + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (v6 + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), v7);
  return a1;
}

uint64_t sub_221279C88(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8) + 24;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v5)(a1, a2, AssociatedTypeWitness);
  uint64_t v6 = *(void *)(v5 + 40);
  uint64_t v7 = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 24))((v6 + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (v6 + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), v7);
  return a1;
}

uint64_t sub_221279D80(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8) + 32;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v5)(a1, a2, AssociatedTypeWitness);
  uint64_t v6 = *(void *)(v5 + 32);
  uint64_t v7 = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 32))((v6 + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (v6 + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), v7);
  return a1;
}

uint64_t sub_221279E78(uint64_t a1, uint64_t a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8) + 40;
  (*(void (**)(uint64_t, uint64_t, uint64_t))v5)(a1, a2, AssociatedTypeWitness);
  uint64_t v6 = *(void *)(v5 + 24);
  uint64_t v7 = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(v7 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v8 + 40))((v6 + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (v6 + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), v7);
  return a1;
}

uint64_t sub_221279F70(unsigned __int16 *a1, unsigned int a2)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v5 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v6 = *(unsigned int *)(v5 + 84);
  uint64_t v7 = swift_getAssociatedTypeWitness();
  uint64_t v8 = *(void *)(v7 - 8);
  unsigned int v9 = *(_DWORD *)(v8 + 84);
  if (v9 <= v6) {
    unsigned int v10 = v6;
  }
  else {
    unsigned int v10 = *(_DWORD *)(v8 + 84);
  }
  uint64_t v11 = *(unsigned __int8 *)(v8 + 80);
  if (!a2) {
    return 0;
  }
  uint64_t v12 = *(void *)(v5 + 64) + v11;
  if (a2 <= v10) {
    goto LABEL_24;
  }
  uint64_t v13 = (v12 & ~v11) + *(void *)(*(void *)(v7 - 8) + 64);
  char v14 = 8 * v13;
  if (v13 <= 3)
  {
    unsigned int v16 = ((a2 - v10 + ~(-1 << v14)) >> v14) + 1;
    if (HIWORD(v16))
    {
      int v15 = *(_DWORD *)((char *)a1 + v13);
      if (!v15) {
        goto LABEL_24;
      }
      goto LABEL_14;
    }
    if (v16 > 0xFF)
    {
      int v15 = *(unsigned __int16 *)((char *)a1 + v13);
      if (!*(unsigned __int16 *)((char *)a1 + v13)) {
        goto LABEL_24;
      }
      goto LABEL_14;
    }
    if (v16 < 2)
    {
LABEL_24:
      if (v10)
      {
        if (v6 >= v9)
        {
          __n128 v22 = *(uint64_t (**)(unsigned __int16 *, uint64_t, uint64_t))(v5 + 48);
          return v22(a1, v6, AssociatedTypeWitness);
        }
        else
        {
          unsigned int v20 = *(uint64_t (**)(unint64_t))(v8 + 48);
          return v20(((unint64_t)a1 + v12) & ~v11);
        }
      }
      return 0;
    }
  }
  int v15 = *((unsigned __int8 *)a1 + v13);
  if (!*((unsigned char *)a1 + v13)) {
    goto LABEL_24;
  }
LABEL_14:
  int v17 = (v15 - 1) << v14;
  if (v13 > 3) {
    int v17 = 0;
  }
  if (v13)
  {
    if (v13 <= 3) {
      int v18 = v13;
    }
    else {
      int v18 = 4;
    }
    switch(v18)
    {
      case 2:
        int v19 = *a1;
        break;
      case 3:
        int v19 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        int v19 = *(_DWORD *)a1;
        break;
      default:
        int v19 = *(unsigned __int8 *)a1;
        break;
    }
  }
  else
  {
    int v19 = 0;
  }
  return v10 + (v19 | v17) + 1;
}

void sub_22127A24C(unsigned char *a1, uint64_t a2, unsigned int a3)
{
  uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  uint64_t v7 = *(void *)(AssociatedTypeWitness - 8);
  uint64_t v8 = *(unsigned int *)(v7 + 84);
  uint64_t v9 = *(void *)(swift_getAssociatedTypeWitness() - 8);
  uint64_t v10 = v9;
  unsigned int v11 = *(_DWORD *)(v9 + 84);
  if (v11 <= v8) {
    unsigned int v12 = v8;
  }
  else {
    unsigned int v12 = *(_DWORD *)(v9 + 84);
  }
  uint64_t v13 = *(unsigned __int8 *)(v9 + 80);
  uint64_t v14 = *(void *)(v7 + 64) + v13;
  size_t v15 = (v14 & ~v13) + *(void *)(v9 + 64);
  if (a3 <= v12)
  {
    int v16 = 0;
  }
  else if (v15 <= 3)
  {
    unsigned int v19 = ((a3 - v12 + ~(-1 << (8 * v15))) >> (8 * v15)) + 1;
    if (HIWORD(v19))
    {
      int v16 = 4;
    }
    else if (v19 >= 0x100)
    {
      int v16 = 2;
    }
    else
    {
      int v16 = v19 > 1;
    }
  }
  else
  {
    int v16 = 1;
  }
  if (v12 < a2)
  {
    unsigned int v17 = ~v12 + a2;
    if (v15 < 4)
    {
      int v18 = (v17 >> (8 * v15)) + 1;
      if (v15)
      {
        int v20 = v17 & ~(-1 << (8 * v15));
        bzero(a1, v15);
        if (v15 == 3)
        {
          *(_WORD *)a1 = v20;
          a1[2] = BYTE2(v20);
        }
        else if (v15 == 2)
        {
          *(_WORD *)a1 = v20;
        }
        else
        {
          *a1 = v20;
        }
      }
    }
    else
    {
      bzero(a1, v15);
      *(_DWORD *)a1 = v17;
      int v18 = 1;
    }
    switch(v16)
    {
      case 1:
        a1[v15] = v18;
        return;
      case 2:
        *(_WORD *)&a1[v15] = v18;
        return;
      case 3:
        goto LABEL_41;
      case 4:
        *(_DWORD *)&a1[v15] = v18;
        return;
      default:
        return;
    }
  }
  switch(v16)
  {
    case 1:
      a1[v15] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 2:
      *(_WORD *)&a1[v15] = 0;
      if (!a2) {
        return;
      }
      goto LABEL_24;
    case 3:
LABEL_41:
      __break(1u);
      JUMPOUT(0x22127A598);
    case 4:
      *(_DWORD *)&a1[v15] = 0;
      goto LABEL_23;
    default:
LABEL_23:
      if (a2)
      {
LABEL_24:
        if (v8 >= v11)
        {
          __n128 v22 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
          v22(a1, a2, v8, AssociatedTypeWitness);
        }
        else
        {
          int v21 = *(void (**)(unint64_t, uint64_t))(v10 + 56);
          v21((unint64_t)&a1[v14] & ~v13, a2);
        }
      }
      return;
  }
}

uint64_t type metadata accessor for LazyPaddedSequence.Iterator()
{
  return sub_22127A5DC();
}

uint64_t sub_22127A5DC()
{
  return swift_getGenericMetadata();
}

uint64_t sub_22127A60C(uint64_t a1, unint64_t a2)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_22127D9D8();
  uint64_t v23 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v5, v6);
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_22127D9C8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v11, v12);
  uint64_t v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22127B0AC(&qword_267F49358, MEMORY[0x263F047F8]);
  sub_22127D9B8();
  switch(a2 >> 62)
  {
    case 1uLL:
      uint64_t v22 = v10;
      if (a1 >> 32 < (int)a1) {
        __break(1u);
      }
      uint64_t v21 = 0;
      sub_22125D744(a1, a2);
      sub_221272CC0((int)a1, a1 >> 32);
      sub_22125C910(a1, a2);
      uint64_t v10 = v22;
      goto LABEL_9;
    case 2uLL:
      uint64_t v21 = 0;
      uint64_t v22 = v10;
      uint64_t v16 = *(void *)(a1 + 16);
      uint64_t v15 = *(void *)(a1 + 24);
      sub_22125D744(a1, a2);
      swift_retain();
      swift_retain();
      uint64_t v17 = v16;
      uint64_t v10 = v22;
      sub_221272CC0(v17, v15);
      swift_release();
      swift_release();
      goto LABEL_8;
    case 3uLL:
      memset(v25, 0, 14);
      goto LABEL_7;
    default:
      v25[0] = a1;
      LOWORD(v25[1]) = a2;
      BYTE2(v25[1]) = BYTE2(a2);
      BYTE3(v25[1]) = BYTE3(a2);
      BYTE4(v25[1]) = BYTE4(a2);
      BYTE5(v25[1]) = BYTE5(a2);
LABEL_7:
      sub_22127D998();
LABEL_8:
      sub_22125C910(a1, a2);
LABEL_9:
      sub_22127D9A8();
      (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v4);
      uint64_t v26 = v9;
      uint64_t v27 = sub_22127B0AC(&qword_267F494C0, MEMORY[0x263F045C0]);
      int v18 = sub_22127B0F4(v25);
      (*(void (**)(uint64_t *, char *, uint64_t))(v10 + 16))(v18, v14, v9);
      sub_22126A4B8(v25, v26);
      sub_22127D748();
      (*(void (**)(char *, uint64_t))(v10 + 8))(v14, v9);
      uint64_t v19 = v24;
      sub_22125DE98((uint64_t)v25);
      return v19;
  }
}

uint64_t sub_22127AA4C(uint64_t result, unint64_t a2)
{
  unsigned __int8 v31 = BYTE6(a2);
  uint64_t v3 = *v2;
  unint64_t v4 = v2[1];
  unint64_t v5 = v4 >> 62;
  uint64_t v6 = result;
  switch(v4 >> 62)
  {
    case 1uLL:
      LODWORD(v7) = HIDWORD(v3) - v3;
      if (__OFSUB__(HIDWORD(v3), v3)) {
        goto LABEL_79;
      }
      uint64_t v7 = (int)v7;
LABEL_6:
      if (!v7) {
        return result;
      }
      break;
    case 2uLL:
      uint64_t v9 = *(void *)(v3 + 16);
      uint64_t v8 = *(void *)(v3 + 24);
      BOOL v10 = __OFSUB__(v8, v9);
      uint64_t v7 = v8 - v9;
      if (!v10) {
        goto LABEL_6;
      }
      goto LABEL_80;
    case 3uLL:
      return result;
    default:
      uint64_t v7 = BYTE6(v4);
      goto LABEL_6;
  }
  unint64_t v11 = a2 >> 62;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v12) = HIDWORD(result) - result;
      if (__OFSUB__(HIDWORD(result), result)) {
        goto LABEL_82;
      }
      uint64_t v12 = (int)v12;
LABEL_12:
      if (!v12) {
        return result;
      }
      if (v5)
      {
        if (v5 == 1)
        {
          LODWORD(v15) = HIDWORD(v3) - v3;
          if (__OFSUB__(HIDWORD(v3), v3))
          {
LABEL_84:
            __break(1u);
            goto LABEL_85;
          }
          uint64_t v15 = (int)v15;
        }
        else
        {
          uint64_t v17 = *(void *)(v3 + 16);
          uint64_t v16 = *(void *)(v3 + 24);
          BOOL v10 = __OFSUB__(v16, v17);
          uint64_t v15 = v16 - v17;
          if (v10)
          {
LABEL_85:
            __break(1u);
            goto LABEL_86;
          }
        }
      }
      else
      {
        uint64_t v15 = BYTE6(v4);
      }
      if (v11)
      {
        if (v11 == 1)
        {
          LODWORD(v18) = HIDWORD(result) - result;
          if (__OFSUB__(HIDWORD(result), result))
          {
LABEL_86:
            __break(1u);
            goto LABEL_87;
          }
          uint64_t v18 = (int)v18;
        }
        else
        {
          uint64_t v20 = *(void *)(result + 16);
          uint64_t v19 = *(void *)(result + 24);
          BOOL v10 = __OFSUB__(v19, v20);
          uint64_t v18 = v19 - v20;
          if (v10)
          {
LABEL_87:
            __break(1u);
            goto LABEL_88;
          }
        }
      }
      else
      {
        uint64_t v18 = BYTE6(a2);
      }
      if (v15 != v18) {
        return result;
      }
      if (v5)
      {
        if (v5 == 1)
        {
          if (__OFSUB__(HIDWORD(v3), v3))
          {
LABEL_88:
            __break(1u);
LABEL_89:
            __break(1u);
          }
          uint64_t v21 = HIDWORD(v3) - (int)v3;
        }
        else
        {
          uint64_t v24 = v3 + 16;
          uint64_t v23 = *(void *)(v3 + 16);
          uint64_t v22 = *(void *)(v24 + 8);
          uint64_t v21 = v22 - v23;
          if (__OFSUB__(v22, v23)) {
            goto LABEL_89;
          }
        }
        if (v21 < 0) {
          goto LABEL_81;
        }
      }
      else
      {
        uint64_t v21 = BYTE6(v4);
      }
      if (!v21) {
        return result;
      }
      int64_t v25 = 0;
      int64_t v30 = (int)result;
      uint64_t v29 = result >> 32;
      break;
    case 2uLL:
      uint64_t v14 = *(void *)(result + 16);
      uint64_t v13 = *(void *)(result + 24);
      BOOL v10 = __OFSUB__(v13, v14);
      uint64_t v12 = v13 - v14;
      if (!v10) {
        goto LABEL_12;
      }
      goto LABEL_83;
    case 3uLL:
      return result;
    default:
      uint64_t v12 = BYTE6(a2);
      goto LABEL_12;
  }
  while (2)
  {
    if (v21 == v25)
    {
      __break(1u);
LABEL_68:
      __break(1u);
LABEL_69:
      __break(1u);
LABEL_70:
      __break(1u);
LABEL_71:
      __break(1u);
LABEL_72:
      __break(1u);
LABEL_73:
      __break(1u);
LABEL_74:
      __break(1u);
LABEL_75:
      __break(1u);
LABEL_76:
      __break(1u);
LABEL_77:
      __break(1u);
LABEL_78:
      __break(1u);
LABEL_79:
      __break(1u);
LABEL_80:
      __break(1u);
LABEL_81:
      __break(1u);
LABEL_82:
      __break(1u);
LABEL_83:
      __break(1u);
      goto LABEL_84;
    }
    uint64_t v26 = v25;
    if (v11)
    {
      if (v11 == 1)
      {
        if (v25 < v30 || v25 >= v29) {
          goto LABEL_68;
        }
        if (!sub_22127D6E8())
        {
          __break(1u);
LABEL_91:
          __break(1u);
LABEL_92:
          __break(1u);
LABEL_93:
          __break(1u);
LABEL_94:
          __break(1u);
          JUMPOUT(0x22127AF50);
        }
        if (__OFSUB__(v25, sub_22127D718())) {
          goto LABEL_71;
        }
      }
      else
      {
        if (v25 < *(void *)(v6 + 16)) {
          goto LABEL_70;
        }
        if (v25 >= *(void *)(v6 + 24)) {
          goto LABEL_72;
        }
        if (!sub_22127D6E8()) {
          goto LABEL_91;
        }
        if (__OFSUB__(v25, sub_22127D718())) {
          goto LABEL_73;
        }
      }
    }
    else if (v25 >= (unint64_t)v31)
    {
      goto LABEL_69;
    }
    ++v25;
    uint64_t v28 = *v2;
    unint64_t v27 = v2[1];
    switch(v27 >> 62)
    {
      case 1uLL:
        if (v26 >= v28 >> 32 || v26 < (int)v28) {
          goto LABEL_75;
        }
        if (!sub_22127D6E8()) {
          goto LABEL_93;
        }
        if (!__OFSUB__(v26, sub_22127D718())) {
          goto LABEL_35;
        }
        goto LABEL_77;
      case 2uLL:
        if (v26 < *(void *)(v28 + 16)) {
          goto LABEL_76;
        }
        if (v26 >= *(void *)(v28 + 24)) {
          goto LABEL_78;
        }
        if (!sub_22127D6E8()) {
          goto LABEL_94;
        }
        uint64_t result = sub_22127D718();
        if (!__OFSUB__(v26, result))
        {
LABEL_35:
          uint64_t result = sub_22127D878();
          if (v21 == v25) {
            return result;
          }
          continue;
        }
        __break(1u);
        return result;
      case 3uLL:
        goto LABEL_92;
      default:
        if (v26 < (unint64_t)BYTE6(v27)) {
          goto LABEL_35;
        }
        goto LABEL_74;
    }
  }
}

uint64_t sub_22127AF80(size_t a1)
{
  if ((a1 & 0x8000000000000000) == 0)
  {
    size_t v1 = a1;
    if (a1)
    {
      uint64_t v2 = sub_22127DCB8();
      *(void *)(v2 + 16) = v1;
      bzero((void *)(v2 + 32), v1);
    }
    else
    {
      uint64_t v2 = MEMORY[0x263F8EE78];
      size_t v1 = *(void *)(MEMORY[0x263F8EE78] + 16);
    }
    if (!SecRandomCopyBytes((SecRandomRef)*MEMORY[0x263F17510], v1, (void *)(v2 + 32)))
    {
      uint64_t v3 = sub_22126A180(v2);
      swift_bridgeObjectRelease();
      return v3;
    }
    swift_bridgeObjectRelease();
  }
  return 0;
}

unsigned char *sub_22127B034@<X0>(unsigned char *result@<X0>, unsigned char *a2@<X1>, void *a3@<X8>)
{
  if (!result) {
    goto LABEL_4;
  }
  uint64_t v4 = a2 - result;
  if (a2 == result)
  {
    uint64_t result = 0;
LABEL_4:
    unint64_t v5 = 0xC000000000000000;
    goto LABEL_5;
  }
  if (v4 <= 14)
  {
    uint64_t result = (unsigned char *)sub_22127B158(result, a2);
    unint64_t v5 = v7 & 0xFFFFFFFFFFFFFFLL;
  }
  else if ((unint64_t)v4 >= 0x7FFFFFFF)
  {
    uint64_t result = (unsigned char *)sub_22127B21C((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v8 | 0x8000000000000000;
  }
  else
  {
    uint64_t result = (unsigned char *)sub_22127B298((uint64_t)result, (uint64_t)a2);
    unint64_t v5 = v6 | 0x4000000000000000;
  }
LABEL_5:
  *a3 = result;
  a3[1] = v5;
  return result;
}

uint64_t sub_22127B0AC(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t *sub_22127B0F4(uint64_t *a1)
{
  size_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_22127B158(unsigned char *__src, unsigned char *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (__src) {
    unint64_t v2 = a2 - __src;
  }
  else {
    unint64_t v2 = 0;
  }
  if ((v2 & 0x8000000000000000) != 0)
  {
    __break(1u);
LABEL_11:
    __break(1u);
  }
  if (v2 > 0xFF) {
    goto LABEL_11;
  }
  memset(__dst, 0, sizeof(__dst));
  char v5 = v2;
  if (__src && a2 != __src) {
    memcpy(__dst, __src, a2 - __src);
  }
  return *(void *)__dst;
}

uint64_t sub_22127B21C(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_22127D738();
  swift_allocObject();
  uint64_t result = sub_22127D6D8();
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    sub_22127D828();
    uint64_t result = swift_allocObject();
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = v2;
  }
  return result;
}

uint64_t sub_22127B298(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a2 - a1;
  }
  else {
    uint64_t v2 = 0;
  }
  sub_22127D738();
  swift_allocObject();
  uint64_t result = sub_22127D6D8();
  if (v2 < (uint64_t)0xFFFFFFFF80000000)
  {
    __break(1u);
    goto LABEL_9;
  }
  if (v2 > 0x7FFFFFFF)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if ((v2 & 0x80000000) == 0) {
    return v2 << 32;
  }
LABEL_10:
  __break(1u);
  return result;
}

uint64_t sub_22127B31C(uint64_t a1, unint64_t a2)
{
  uint64_t v19 = 46;
  unint64_t v20 = 0xE100000000000000;
  _OWORD v18[2] = &v19;
  swift_bridgeObjectRetain();
  uint64_t v4 = sub_22127B474(0x7FFFFFFFFFFFFFFFLL, 1, sub_22127B9FC, (uint64_t)v18, a1, a2);
  char v5 = v4;
  if (*((void *)v4 + 2) != 3)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    return a1;
  }
  uint64_t v6 = *((void *)v4 + 4);
  uint64_t v7 = *((void *)v4 + 5);
  uint64_t v8 = *((void *)v4 + 6);
  uint64_t v9 = *((void *)v4 + 7);
  swift_bridgeObjectRetain();
  uint64_t v10 = MEMORY[0x223C7C940](v6, v7, v8, v9);
  unint64_t v12 = v11;
  swift_bridgeObjectRelease();
  uint64_t v19 = v10;
  unint64_t v20 = v12;
  uint64_t result = sub_22127DB68();
  if (*((void *)v5 + 2) >= 2uLL)
  {
    uint64_t v14 = *((void *)v5 + 8);
    uint64_t v15 = *((void *)v5 + 9);
    uint64_t v16 = *((void *)v5 + 10);
    uint64_t v17 = *((void *)v5 + 11);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    MEMORY[0x223C7C940](v14, v15, v16, v17);
    sub_22127DB68();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v19;
  }
  __break(1u);
  return result;
}

char *sub_22127B474(uint64_t a1, char a2, uint64_t (*a3)(void *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  v46[3] = a4;
  if (a1 < 0)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  uint64_t v11 = a5;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = MEMORY[0x263F8EE78];
  uint64_t v43 = swift_allocObject();
  *(void *)(v43 + 16) = 15;
  uint64_t v15 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (uint64_t v16 = HIBYTE(a6) & 0xF) : (uint64_t v16 = v11 & 0xFFFFFFFFFFFFLL), !v16))
  {
    if ((a6 & 0x2000000000000000) == 0) {
      uint64_t v15 = v11 & 0xFFFFFFFFFFFFLL;
    }
    uint64_t v30 = 7;
    if (((a6 >> 60) & ((v11 & 0x800000000000000) == 0)) != 0) {
      uint64_t v30 = 11;
    }
    sub_22127B894(v30 | (v15 << 16), v43, a2 & 1, v14);
    swift_bridgeObjectRelease();
    uint64_t v10 = *(char **)(v14 + 16);
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_38;
  }
  uint64_t v38 = a1;
  uint64_t v39 = v14;
  unint64_t v44 = 4 * v16;
  uint64_t v10 = (char *)MEMORY[0x263F8EE78];
  unint64_t v9 = 15;
  unint64_t v8 = 15;
  unint64_t v17 = 15;
  while (1)
  {
    v46[0] = sub_22127DBE8();
    v46[1] = v18;
    uint64_t v19 = a3(v46);
    if (v7)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return v10;
    }
    uint64_t v6 = v19;
    swift_bridgeObjectRelease();
    if (v6) {
      break;
    }
    unint64_t v9 = sub_22127DB48();
LABEL_9:
    if (v44 == v9 >> 14) {
      goto LABEL_29;
    }
  }
  if (v8 >> 14 == v9 >> 14 && (a2 & 1) != 0)
  {
    unint64_t v9 = sub_22127DB48();
    *(void *)(v43 + 16) = v9;
    unint64_t v8 = v9;
    unint64_t v17 = v9;
    goto LABEL_9;
  }
  if (v9 >> 14 < v8 >> 14)
  {
    __break(1u);
    goto LABEL_41;
  }
  uint64_t v20 = sub_22127DC08();
  uint64_t v40 = v21;
  uint64_t v41 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v10 = sub_22126B0A4(0, *((void *)v10 + 2) + 1, 1, v10);
  }
  unint64_t v27 = *((void *)v10 + 2);
  unint64_t v26 = *((void *)v10 + 3);
  uint64_t v6 = v27 + 1;
  if (v27 >= v26 >> 1) {
    uint64_t v10 = sub_22126B0A4((char *)(v26 > 1), v27 + 1, 1, v10);
  }
  *((void *)v10 + 2) = v6;
  uint64_t v28 = &v10[32 * v27];
  *((void *)v28 + 4) = v41;
  *((void *)v28 + 5) = v23;
  *((void *)v28 + 6) = v25;
  *((void *)v28 + 7) = v40;
  *(void *)(v39 + 16) = v10;
  uint64_t v29 = sub_22127DB48();
  unint64_t v9 = v29;
  *(void *)(v43 + 16) = v29;
  if (*((void *)v10 + 2) != v38)
  {
    unint64_t v8 = v29;
    unint64_t v17 = v29;
    goto LABEL_9;
  }
  unint64_t v17 = v29;
  unint64_t v8 = v29;
LABEL_29:
  if (v44 == v8 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_37;
  }
  if (v44 >= v17 >> 14)
  {
    uint64_t v6 = sub_22127DC08();
    unint64_t v8 = v31;
    unint64_t v9 = v32;
    uint64_t v11 = v33;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      goto LABEL_43;
    }
    goto LABEL_34;
  }
LABEL_42:
  __break(1u);
LABEL_43:
  uint64_t v10 = sub_22126B0A4(0, *((void *)v10 + 2) + 1, 1, v10);
LABEL_34:
  unint64_t v35 = *((void *)v10 + 2);
  unint64_t v34 = *((void *)v10 + 3);
  if (v35 >= v34 >> 1) {
    uint64_t v10 = sub_22126B0A4((char *)(v34 > 1), v35 + 1, 1, v10);
  }
  *((void *)v10 + 2) = v35 + 1;
  BOOL v36 = &v10[32 * v35];
  *((void *)v36 + 4) = v6;
  *((void *)v36 + 5) = v8;
  *((void *)v36 + 6) = v9;
  *((void *)v36 + 7) = v11;
  *(void *)(v39 + 16) = v10;
LABEL_37:
  swift_bridgeObjectRetain();
  swift_release();
LABEL_38:
  swift_release();
  return v10;
}

uint64_t sub_22127B894(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v10 = *(void *)(a2 + 16) >> 14;
  int v11 = (v10 == a1 >> 14) & a3;
  if (v11 == 1) {
    return v11 ^ 1u;
  }
  if (a1 >> 14 < v10)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v4 = a4;
  uint64_t v5 = sub_22127DC08();
  uint64_t v6 = v12;
  uint64_t v7 = v13;
  uint64_t v8 = v14;
  unint64_t v9 = *(char **)(v4 + 16);
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *(void *)(v4 + 16) = v9;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
LABEL_9:
    unint64_t v9 = sub_22126B0A4(0, *((void *)v9 + 2) + 1, 1, v9);
    *(void *)(v4 + 16) = v9;
  }
  unint64_t v17 = *((void *)v9 + 2);
  unint64_t v16 = *((void *)v9 + 3);
  if (v17 >= v16 >> 1)
  {
    unint64_t v9 = sub_22126B0A4((char *)(v16 > 1), v17 + 1, 1, v9);
    *(void *)(v4 + 16) = v9;
  }
  *((void *)v9 + 2) = v17 + 1;
  uint64_t v18 = &v9[32 * v17];
  *((void *)v18 + 4) = v5;
  *((void *)v18 + 5) = v6;
  *((void *)v18 + 6) = v7;
  *((void *)v18 + 7) = v8;
  return v11 ^ 1u;
}

uint64_t sub_22127B9A4(void *a1, void *a2)
{
  if (*a1 == *a2 && a1[1] == a2[1]) {
    return 1;
  }
  else {
    return sub_22127DFA8() & 1;
  }
}

uint64_t sub_22127B9FC(void *a1)
{
  uint64_t v2 = *(void **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1]) {
    return 1;
  }
  else {
    return sub_22127DFA8() & 1;
  }
}

uint64_t sub_22127BA54()
{
  swift_bridgeObjectRelease();
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22127BA8C()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_22127BA9C(void *a1)
{
  sub_22125D79C(&qword_267F49160);
  uint64_t result = swift_allocObject();
  *(_OWORD *)(result + 16) = xmmword_221280F10;
  unint64_t v3 = a1[2];
  if (!v3)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v5 = a1 + 4;
  unint64_t v4 = a1[4];
  if (!is_mul_ok(v4, 0x28uLL))
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  if (v3 < 2)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v6 = 40 * v4;
  uint64_t v7 = a1[5];
  BOOL v8 = __CFADD__(v6, v7);
  unint64_t v9 = v6 + v7;
  if (v8)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  if (v9 <= 0xFF)
  {
    *(unsigned char *)(result + 32) = v9;
    uint64_t v10 = sub_22126A180(result);
    unint64_t v12 = v11;
    swift_bridgeObjectRelease();
    if (v3 < 3) {
      return v10;
    }
    unint64_t v13 = 2;
    swift_bridgeObjectRetain_n();
    uint64_t result = sub_22125D744(v10, v12);
    uint64_t v14 = (char *)MEMORY[0x263F8EE78];
    while (v13 < v3)
    {
      unint64_t v15 = v5[v13];
      unint64_t v16 = sub_22126AEB4(0, 1, 1, v14);
      unint64_t v18 = *((void *)v16 + 2);
      unint64_t v17 = *((void *)v16 + 3);
      if (v18 >= v17 >> 1) {
        unint64_t v16 = sub_22126AEB4((char *)(v17 > 1), v18 + 1, 1, v16);
      }
      *((void *)v16 + 2) = v18 + 1;
      v16[v18 + 32] = v15 & 0x7F;
      if (v15 >= 0x80)
      {
        unint64_t v19 = v18 + 33;
        do
        {
          unint64_t v20 = *((void *)v16 + 3);
          if (v19 - 32 >= v20 >> 1) {
            unint64_t v16 = sub_22126AEB4((char *)(v20 > 1), v19 - 31, 1, v16);
          }
          unint64_t v21 = v15 >> 14;
          v15 >>= 7;
          *((void *)v16 + 2) = v19 - 31;
          v16[v19++] = v15 | 0x80;
        }
        while (v21);
      }
      ++v13;
      sub_221269318((uint64_t)v16);
      uint64_t result = swift_bridgeObjectRelease();
      if (v13 == v3)
      {
        swift_bridgeObjectRelease();
        sub_22125C910(v10, v12);
        swift_bridgeObjectRelease();
        return v10;
      }
    }
    __break(1u);
    goto LABEL_21;
  }
LABEL_25:
  __break(1u);
  return result;
}

char *sub_22127BCD0(uint64_t a1, unint64_t a2)
{
  uint64_t v23 = 46;
  uint64_t v24 = 0xE100000000000000;
  v21[2] = &v23;
  swift_bridgeObjectRetain();
  unint64_t v4 = sub_22127B474(0x7FFFFFFFFFFFFFFFLL, 0, sub_22127CD60, (uint64_t)v21, a1, a2);
  swift_bridgeObjectRelease();
  uint64_t v5 = *((void *)v4 + 2);
  if (v5)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = (unint64_t *)(v4 + 56);
    uint64_t v7 = (char *)MEMORY[0x263F8EE78];
    while (1)
    {
      unint64_t v9 = *(v6 - 3);
      unint64_t v8 = *(v6 - 2);
      if ((v8 ^ v9) >= 0x4000)
      {
        unint64_t v11 = *(v6 - 1);
        unint64_t v10 = *v6;
        if ((*v6 & 0x1000000000000000) != 0)
        {
          swift_bridgeObjectRetain();
          uint64_t v13 = (uint64_t)sub_22127C218(v9, v8, v11, v10, 10);
          char v18 = v17;
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0) {
            goto LABEL_12;
          }
        }
        else
        {
          if ((v10 & 0x2000000000000000) != 0)
          {
            uint64_t v23 = *(v6 - 1);
            uint64_t v24 = v10 & 0xFFFFFFFFFFFFFFLL;
            unint64_t v12 = &v23;
          }
          else if ((v11 & 0x1000000000000000) != 0)
          {
            unint64_t v12 = (uint64_t *)((v10 & 0xFFFFFFFFFFFFFFFLL) + 32);
          }
          else
          {
            unint64_t v12 = (uint64_t *)sub_22127DE88();
          }
          uint64_t v13 = sub_22127CD80((uint64_t)v12, v9, v8, v11, v10, 10);
          char v22 = v14 & 1;
          if ((v14 & 1) == 0)
          {
LABEL_12:
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              uint64_t v7 = sub_22126AFA0(0, *((void *)v7 + 2) + 1, 1, v7);
            }
            unint64_t v16 = *((void *)v7 + 2);
            unint64_t v15 = *((void *)v7 + 3);
            if (v16 >= v15 >> 1) {
              uint64_t v7 = sub_22126AFA0((char *)(v15 > 1), v16 + 1, 1, v7);
            }
            *((void *)v7 + 2) = v16 + 1;
            *(void *)&v7[8 * v16 + 32] = v13;
          }
        }
      }
      v6 += 4;
      if (!--v5)
      {
        swift_bridgeObjectRelease();
        uint64_t v19 = *((void *)v4 + 2);
        goto LABEL_21;
      }
    }
  }
  uint64_t v19 = 0;
  uint64_t v7 = (char *)MEMORY[0x263F8EE78];
LABEL_21:
  swift_bridgeObjectRelease();
  if (v19 != *((void *)v7 + 2))
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return v7;
}

void sub_22127BEF4()
{
  qword_267F4B1D0 = (uint64_t)&unk_26D31D2B8;
}

uint64_t *sub_22127BF08()
{
  if (qword_267F49260 != -1) {
    swift_once();
  }
  return &qword_267F4B1D0;
}

uint64_t sub_22127BF54()
{
  return sub_22127BFFC(&qword_267F49260);
}

void sub_22127BF78()
{
  qword_267F4B1D8 = (uint64_t)&unk_26D31D2F8;
}

uint64_t *sub_22127BF8C()
{
  if (qword_267F49268 != -1) {
    swift_once();
  }
  return &qword_267F4B1D8;
}

uint64_t sub_22127BFD8()
{
  return sub_22127BFFC(&qword_267F49268);
}

uint64_t sub_22127BFFC(void *a1)
{
  if (*a1 != -1) {
    swift_once();
  }
  return swift_bridgeObjectRetain();
}

uint64_t sub_22127C048(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    uint64_t v11 = MEMORY[0x263F8EE78];
    swift_bridgeObjectRetain();
    sub_221272DA4(0, v1, 0);
    uint64_t v2 = 0;
    do
    {
      uint64_t v3 = sub_22127DF88();
      uint64_t v5 = v4;
      unint64_t v7 = *(void *)(v11 + 16);
      unint64_t v6 = *(void *)(v11 + 24);
      if (v7 >= v6 >> 1) {
        sub_221272DA4((char *)(v6 > 1), v7 + 1, 1);
      }
      ++v2;
      *(void *)(v11 + 16) = v7 + 1;
      uint64_t v8 = v11 + 16 * v7;
      *(void *)(v8 + 32) = v3;
      *(void *)(v8 + 40) = v5;
    }
    while (v1 != v2);
    swift_bridgeObjectRelease();
  }
  sub_22125D79C(&qword_267F490F0);
  sub_22127343C();
  uint64_t v9 = sub_22127DA28();
  swift_bridgeObjectRelease();
  return v9;
}

BOOL sub_22127C198(void *a1, void *a2)
{
  uint64_t v2 = a1[2];
  if (v2 != a2[2]) {
    return 0;
  }
  if (!v2 || a1 == a2) {
    return 1;
  }
  if (a1[4] != a2[4]) {
    return 0;
  }
  if (v2 == 1) {
    return 1;
  }
  uint64_t v4 = v2 - 2;
  uint64_t v5 = a1 + 5;
  unint64_t v6 = a2 + 5;
  do
  {
    uint64_t v8 = *v5++;
    uint64_t v7 = v8;
    uint64_t v10 = *v6++;
    uint64_t v9 = v10;
    BOOL v12 = v4-- != 0;
    BOOL result = v7 == v9;
  }
  while (v7 == v9 && v12);
  return result;
}

BOOL sub_22127C20C(void **a1, void **a2)
{
  return sub_22127C198(*a1, *a2);
}

unsigned __int8 *sub_22127C218(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int64_t a5)
{
  uint64_t v15 = a1;
  uint64_t v16 = a2;
  uint64_t v17 = a3;
  uint64_t v18 = a4;
  sub_22127D1B0();
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_22127DBF8();
  unint64_t v8 = v6;
  if ((v6 & 0x1000000000000000) == 0)
  {
    if ((v6 & 0x2000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v10 = HIBYTE(v8) & 0xF;
    uint64_t v15 = v7;
    uint64_t v16 = v8 & 0xFFFFFFFFFFFFFFLL;
    uint64_t v9 = (unsigned __int8 *)&v15;
    goto LABEL_7;
  }
  uint64_t v7 = sub_22127C588();
  unint64_t v12 = v11;
  swift_bridgeObjectRelease();
  unint64_t v8 = v12;
  if ((v12 & 0x2000000000000000) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v7 & 0x1000000000000000) != 0)
  {
    uint64_t v9 = (unsigned __int8 *)((v8 & 0xFFFFFFFFFFFFFFFLL) + 32);
    uint64_t v10 = v7 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    uint64_t v9 = (unsigned __int8 *)sub_22127DE88();
  }
LABEL_7:
  uint64_t v13 = sub_22127C30C(v9, v10, a5);
  swift_bridgeObjectRelease();
  return v13;
}

unsigned __int8 *sub_22127C30C(unsigned __int8 *result, uint64_t a2, int64_t a3)
{
  uint64_t v3 = a2;
  int v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        uint64_t v5 = a2 - 1;
        if (a2 != 1)
        {
          unsigned __int8 v6 = a3 + 48;
          unsigned __int8 v7 = a3 + 55;
          unsigned __int8 v8 = a3 + 87;
          if (a3 > 10)
          {
            unsigned __int8 v6 = 58;
          }
          else
          {
            unsigned __int8 v8 = 97;
            unsigned __int8 v7 = 65;
          }
          if (result)
          {
            unint64_t v9 = 0;
            for (unint64_t i = result + 1; ; ++i)
            {
              unsigned int v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  uint64_t v13 = 0;
                  if (v11 < 0x61 || v11 >= v8) {
                    return (unsigned __int8 *)v13;
                  }
                  char v12 = -87;
                }
                else
                {
                  char v12 = -55;
                }
              }
              else
              {
                char v12 = -48;
              }
              if (!is_mul_ok(v9, a3)) {
                return 0;
              }
              unint64_t v14 = v9 * a3;
              unsigned __int8 v15 = v11 + v12;
              BOOL v16 = v14 >= v15;
              unint64_t v9 = v14 - v15;
              if (!v16) {
                return 0;
              }
              if (!--v5) {
                return (unsigned __int8 *)v9;
              }
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_67;
    }
    if (a2)
    {
      unsigned __int8 v26 = a3 + 48;
      unsigned __int8 v27 = a3 + 55;
      unsigned __int8 v28 = a3 + 87;
      if (a3 > 10)
      {
        unsigned __int8 v26 = 58;
      }
      else
      {
        unsigned __int8 v28 = 97;
        unsigned __int8 v27 = 65;
      }
      if (result)
      {
        unint64_t v29 = 0;
        do
        {
          unsigned int v30 = *result;
          if (v30 < 0x30 || v30 >= v26)
          {
            if (v30 < 0x41 || v30 >= v27)
            {
              uint64_t v13 = 0;
              if (v30 < 0x61 || v30 >= v28) {
                return (unsigned __int8 *)v13;
              }
              char v31 = -87;
            }
            else
            {
              char v31 = -55;
            }
          }
          else
          {
            char v31 = -48;
          }
          if (!is_mul_ok(v29, a3)) {
            return 0;
          }
          unint64_t v32 = v29 * a3;
          unsigned __int8 v33 = v30 + v31;
          BOOL v16 = __CFADD__(v32, v33);
          unint64_t v29 = v32 + v33;
          if (v16) {
            return 0;
          }
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)v29;
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_67:
    __break(1u);
    return result;
  }
  uint64_t v17 = a2 - 1;
  if (a2 == 1) {
    return 0;
  }
  unsigned __int8 v18 = a3 + 48;
  unsigned __int8 v19 = a3 + 55;
  unsigned __int8 v20 = a3 + 87;
  if (a3 > 10)
  {
    unsigned __int8 v18 = 58;
  }
  else
  {
    unsigned __int8 v20 = 97;
    unsigned __int8 v19 = 65;
  }
  if (!result) {
    return 0;
  }
  unint64_t v9 = 0;
  unint64_t v21 = result + 1;
  do
  {
    unsigned int v22 = *v21;
    if (v22 < 0x30 || v22 >= v18)
    {
      if (v22 < 0x41 || v22 >= v19)
      {
        uint64_t v13 = 0;
        if (v22 < 0x61 || v22 >= v20) {
          return (unsigned __int8 *)v13;
        }
        char v23 = -87;
      }
      else
      {
        char v23 = -55;
      }
    }
    else
    {
      char v23 = -48;
    }
    if (!is_mul_ok(v9, a3)) {
      return 0;
    }
    unint64_t v24 = v9 * a3;
    unsigned __int8 v25 = v22 + v23;
    BOOL v16 = __CFADD__(v24, v25);
    unint64_t v9 = v24 + v25;
    if (v16) {
      return 0;
    }
    ++v21;
    --v17;
  }
  while (v17);
  return (unsigned __int8 *)v9;
}

uint64_t sub_22127C588()
{
  unint64_t v0 = sub_22127DC08();
  uint64_t v4 = sub_22127C608(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_22127C608(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  if ((a4 & 0x1000000000000000) != 0)
  {
    unint64_t v9 = sub_22127C760(a1, a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      unsigned int v11 = sub_22125FA4C(v9, 0);
      unint64_t v12 = sub_22127C860((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
LABEL_11:
        sub_22127DE88();
LABEL_4:
        JUMPOUT(0x223C7C950);
      }
    }
    else
    {
      unsigned int v11 = (void *)MEMORY[0x263F8EE78];
    }
    uint64_t v13 = MEMORY[0x223C7C950](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x223C7C950]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_22127C760(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7 = result;
  uint64_t v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0) {
    LOBYTE(v8) = 1;
  }
  uint64_t v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    BOOL result = sub_22127CA74(result, a3, a4);
    unint64_t v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    BOOL result = sub_22127CA74(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0) {
      return (a2 >> 16) - (v7 >> 16);
    }
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  unint64_t v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0) {
    unint64_t v10 = a3 & 0xFFFFFFFFFFFFLL;
  }
  if (v10 < v7 >> 16)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v10 < a2 >> 16)
  {
LABEL_17:
    __break(1u);
    return result;
  }
  return sub_22127DBB8();
}

unint64_t sub_22127C860(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  uint64_t v9 = (void *)result;
  if (!a2) {
    goto LABEL_5;
  }
  if (!a3)
  {
    unint64_t v12 = a4;
    uint64_t v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0) {
    goto LABEL_36;
  }
  unint64_t v10 = a5 >> 14;
  unint64_t v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    uint64_t v11 = 0;
    unint64_t v12 = a4;
LABEL_33:
    *uint64_t v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    unint64_t v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  uint64_t v11 = 0;
  uint64_t v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0) {
    LOBYTE(v14) = 1;
  }
  uint64_t v15 = 4 << v14;
  uint64_t v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  uint64_t v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  uint64_t v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0) {
    uint64_t v16 = a6 & 0xFFFFFFFFFFFFLL;
  }
  unint64_t v23 = v16;
  uint64_t v26 = a3 - 1;
  unint64_t v12 = a4;
  while (1)
  {
    unint64_t v17 = v12 & 0xC;
    BOOL result = v12;
    if (v17 == v15) {
      BOOL result = sub_22127CA74(v12, a6, a7);
    }
    if (result >> 14 < v27 || result >> 14 >= v10) {
      break;
    }
    if ((a7 & 0x1000000000000000) != 0)
    {
      BOOL result = sub_22127DBC8();
      char v19 = result;
      if (v17 != v15) {
        goto LABEL_23;
      }
    }
    else
    {
      unint64_t v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        char v19 = *((unsigned char *)v28 + v18);
        if (v17 != v15) {
          goto LABEL_23;
        }
      }
      else
      {
        BOOL result = v21;
        if ((a6 & 0x1000000000000000) == 0) {
          BOOL result = sub_22127DE88();
        }
        char v19 = *(unsigned char *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0) {
            goto LABEL_24;
          }
          goto LABEL_27;
        }
      }
    }
    BOOL result = sub_22127CA74(v12, a6, a7);
    unint64_t v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      unint64_t v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16) {
      goto LABEL_35;
    }
    unint64_t v12 = sub_22127DB98();
LABEL_29:
    *(unsigned char *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      uint64_t v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14) {
      goto LABEL_33;
    }
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_22127CA74(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_22127DBD8();
    uint64_t v11 = v10 + (v4 << 16);
    unint64_t v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v13 = v12;
    }
    return v13 | 4;
  }
  else
  {
    uint64_t v5 = MEMORY[0x223C7C9F0](15, a1 >> 16);
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

uint64_t sub_22127CAF0(uint64_t a1, unint64_t a2)
{
  uint64_t v4 = sub_22127D918();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v6, v7);
  uint64_t v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22125D744(a1, a2);
  __int16 v10 = sub_22126B5E8(a1, a2);
  sub_22125C910(a1, a2);
  if ((v10 & 0x100) != 0)
  {
    sub_22125C910(a1, a2);
    return 0;
  }
  sub_22125D79C(&qword_267F49310);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_221280E60;
  *(void *)(v11 + 32) = v10 / 0x28u;
  *(void *)(v11 + 40) = v10 % 0x28u;
  sub_22125D744(a1, a2);
  sub_221274F04(1, a1, a2, &v20);
  uint64_t v12 = v20;
  unint64_t v13 = v21;
  switch(v21 >> 62)
  {
    case 1uLL:
    case 2uLL:
      sub_22125D744(v20, v21);
      break;
    default:
      break;
  }
  sub_22127D928();
  sub_22125C910(v12, v13);
LABEL_6:
  unint64_t v14 = 0;
  while (1)
  {
    __int16 v15 = sub_22127D908();
    if ((v15 & 0x100) != 0) {
      break;
    }
    unint64_t v16 = v15 & 0x7F | (v14 << 7);
    unint64_t v14 = v16;
    if ((v15 & 0x80) == 0)
    {
      unint64_t v18 = *(void *)(v11 + 16);
      unint64_t v17 = *(void *)(v11 + 24);
      if (v18 >= v17 >> 1) {
        uint64_t v11 = (uint64_t)sub_22126AFA0((char *)(v17 > 1), v18 + 1, 1, (char *)v11);
      }
      *(void *)(v11 + 16) = v18 + 1;
      *(void *)(v11 + 8 * v18 + 32) = v16;
      goto LABEL_6;
    }
  }
  sub_22125C910(a1, a2);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v9, v4);
  if (v14)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return v11;
}

uint64_t sub_22127CD60(void *a1)
{
  return sub_22127B9A4(a1, *(void **)(v1 + 16)) & 1;
}

uint64_t sub_22127CD80(uint64_t result, unint64_t a2, unint64_t a3, unint64_t a4, unint64_t a5, int64_t a6)
{
  unint64_t v10 = a2;
  uint64_t v11 = result;
  uint64_t v12 = (a4 >> 59) & 1;
  if ((a5 & 0x1000000000000000) == 0) {
    LOBYTE(v12) = 1;
  }
  uint64_t v13 = 4 << v12;
  unint64_t v14 = a2 & 0xC;
  if (v14 == 4 << v12)
  {
    BOOL result = sub_22127CA74(a2, a4, a5);
    a2 = result;
    if ((a5 & 0x1000000000000000) == 0)
    {
LABEL_5:
      int64_t v15 = a2 >> 16;
      if (v14 != v13) {
        goto LABEL_6;
      }
      goto LABEL_14;
    }
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
    goto LABEL_5;
  }
  unint64_t v16 = a4 & 0xFFFFFFFFFFFFLL;
  if ((a5 & 0x2000000000000000) != 0) {
    unint64_t v16 = HIBYTE(a5) & 0xF;
  }
  if (v16 < a2 >> 16) {
    goto LABEL_96;
  }
  BOOL result = sub_22127DBB8();
  int64_t v15 = result;
  if (v14 == v13)
  {
LABEL_14:
    BOOL result = sub_22127CA74(v10, a4, a5);
    unint64_t v10 = result;
  }
LABEL_6:
  if ((a3 & 0xC) == v13)
  {
    BOOL result = sub_22127CA74(a3, a4, a5);
    a3 = result;
    if ((a5 & 0x1000000000000000) == 0) {
      goto LABEL_8;
    }
  }
  else if ((a5 & 0x1000000000000000) == 0)
  {
LABEL_8:
    BOOL result = (a3 >> 16) - (v10 >> 16);
    goto LABEL_21;
  }
  unint64_t v17 = HIBYTE(a5) & 0xF;
  if ((a5 & 0x2000000000000000) == 0) {
    unint64_t v17 = a4 & 0xFFFFFFFFFFFFLL;
  }
  if (v17 < v10 >> 16) {
    goto LABEL_92;
  }
  if (v17 < a3 >> 16)
  {
LABEL_93:
    __break(1u);
    goto LABEL_94;
  }
  BOOL result = sub_22127DBB8();
LABEL_21:
  int64_t v18 = v15 + result;
  if (__OFADD__(v15, result))
  {
    __break(1u);
    goto LABEL_91;
  }
  if (v18 < v15)
  {
LABEL_91:
    __break(1u);
LABEL_92:
    __break(1u);
    goto LABEL_93;
  }
  char v19 = (unsigned __int8 *)(v11 + v15);
  if (!v11) {
    char v19 = 0;
  }
  int v20 = *v19;
  if (v20 == 43)
  {
    if (result >= 1)
    {
      if (result != 1)
      {
        unsigned __int8 v33 = a6 + 48;
        unsigned __int8 v34 = a6 + 55;
        unsigned __int8 v35 = a6 + 87;
        if (a6 > 10)
        {
          unsigned __int8 v33 = 58;
        }
        else
        {
          unsigned __int8 v35 = 97;
          unsigned __int8 v34 = 65;
        }
        if (v19)
        {
          unint64_t v24 = 0;
          BOOL v36 = v19 + 1;
          uint64_t v37 = result - 1;
          do
          {
            unsigned int v38 = *v36;
            if (v38 < 0x30 || v38 >= v33)
            {
              if (v38 < 0x41 || v38 >= v34)
              {
                uint64_t v29 = 0;
                if (v38 < 0x61 || v38 >= v35) {
                  return v29;
                }
                char v39 = -87;
              }
              else
              {
                char v39 = -55;
              }
            }
            else
            {
              char v39 = -48;
            }
            if (!is_mul_ok(v24, a6)) {
              return 0;
            }
            unint64_t v40 = v24 * a6;
            unsigned __int8 v41 = v38 + v39;
            BOOL v32 = __CFADD__(v40, v41);
            unint64_t v24 = v40 + v41;
            if (v32) {
              return 0;
            }
            ++v36;
            --v37;
          }
          while (v37);
          return v24;
        }
        return 0;
      }
      return 0;
    }
    goto LABEL_95;
  }
  if (v20 != 45)
  {
    if (v18 != v15)
    {
      unsigned __int8 v42 = a6 + 48;
      unsigned __int8 v43 = a6 + 55;
      unsigned __int8 v44 = a6 + 87;
      if (a6 > 10)
      {
        unsigned __int8 v42 = 58;
      }
      else
      {
        unsigned __int8 v44 = 97;
        unsigned __int8 v43 = 65;
      }
      if (v19)
      {
        unint64_t v24 = 0;
        while (1)
        {
          unsigned int v45 = *v19;
          if (v45 < 0x30 || v45 >= v42)
          {
            if (v45 < 0x41 || v45 >= v43)
            {
              uint64_t v29 = 0;
              if (v45 < 0x61 || v45 >= v44) {
                return v29;
              }
              char v46 = -87;
            }
            else
            {
              char v46 = -55;
            }
          }
          else
          {
            char v46 = -48;
          }
          if (!is_mul_ok(v24, a6)) {
            return 0;
          }
          unint64_t v47 = v24 * a6;
          unsigned __int8 v48 = v45 + v46;
          BOOL v32 = __CFADD__(v47, v48);
          unint64_t v24 = v47 + v48;
          if (v32) {
            return 0;
          }
          ++v19;
          if (!--result) {
            return v24;
          }
        }
      }
      return 0;
    }
    return 0;
  }
  if (result >= 1)
  {
    if (result != 1)
    {
      unsigned __int8 v21 = a6 + 48;
      unsigned __int8 v22 = a6 + 55;
      unsigned __int8 v23 = a6 + 87;
      if (a6 > 10)
      {
        unsigned __int8 v21 = 58;
      }
      else
      {
        unsigned __int8 v23 = 97;
        unsigned __int8 v22 = 65;
      }
      if (v19)
      {
        unint64_t v24 = 0;
        unsigned __int8 v25 = v19 + 1;
        uint64_t v26 = result - 1;
        while (1)
        {
          unsigned int v27 = *v25;
          if (v27 < 0x30 || v27 >= v21)
          {
            if (v27 < 0x41 || v27 >= v22)
            {
              uint64_t v29 = 0;
              if (v27 < 0x61 || v27 >= v23) {
                return v29;
              }
              char v28 = -87;
            }
            else
            {
              char v28 = -55;
            }
          }
          else
          {
            char v28 = -48;
          }
          if (!is_mul_ok(v24, a6)) {
            return 0;
          }
          unint64_t v30 = v24 * a6;
          unsigned __int8 v31 = v27 + v28;
          BOOL v32 = v30 >= v31;
          unint64_t v24 = v30 - v31;
          if (!v32) {
            return 0;
          }
          ++v25;
          if (!--v26) {
            return v24;
          }
        }
      }
      return 0;
    }
    return 0;
  }
LABEL_94:
  __break(1u);
LABEL_95:
  __break(1u);
LABEL_96:
  __break(1u);
  return result;
}

ValueMetadata *type metadata accessor for OID()
{
  return &type metadata for OID;
}

unint64_t sub_22127D1B0()
{
  unint64_t result = qword_267F494C8;
  if (!qword_267F494C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_267F494C8);
  }
  return result;
}

void sub_22127D204(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_221247000, log, OS_LOG_TYPE_ERROR, "[%@ cancelPINCapture]: XPC failed: %@", (uint8_t *)&v4, 0x16u);
}

void sub_22127D290(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_221247000, log, OS_LOG_TYPE_ERROR, "[%@ configuration] proxy failed: %@", (uint8_t *)&v4, 0x16u);
}

void sub_22127D31C()
{
  sub_2212577B0();
  sub_2212577C8(&dword_221247000, v0, v1, "[%@ getCardReaderBlobWithTxnBlob:]: XPC failed: %@");
}

void sub_22127D388()
{
  sub_2212577B0();
  sub_2212577C8(&dword_221247000, v0, v1, "[%@ cancelReadWithCallback:]: XPC failed: %@");
}

void sub_22127D3F4()
{
  sub_2212577B0();
  sub_2212577C8(&dword_221247000, v0, v1, "[%@ cancelReadWithCallback:] failed: %@");
}

void sub_22127D460(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_221247000, a2, OS_LOG_TYPE_ERROR, "Proxy error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_22127D4D8(void *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v8 = objc_msgSend_proxyDescription(a1, a2, a3, a4, a5, a6);
  int v9 = 138412546;
  unint64_t v10 = a1;
  __int16 v11 = 2112;
  uint64_t v12 = v8;
  _os_log_error_impl(&dword_221247000, (os_log_t)a2, OS_LOG_TYPE_ERROR, "%@.deinit: Disconnecting from %@", (uint8_t *)&v9, 0x16u);
}

void sub_22127D588(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_221247000, log, OS_LOG_TYPE_ERROR, "%@ unavailable", buf, 0xCu);
}

void sub_22127D5E0(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_221247000, log, OS_LOG_TYPE_ERROR, "%@ disconnected", buf, 0xCu);
}

uint64_t sub_22127D638()
{
  return MEMORY[0x270EED980]();
}

uint64_t sub_22127D648()
{
  return MEMORY[0x270EEDA48]();
}

uint64_t sub_22127D658()
{
  return MEMORY[0x270EEDA90]();
}

uint64_t sub_22127D668()
{
  return MEMORY[0x270EEDAA0]();
}

uint64_t sub_22127D678()
{
  return MEMORY[0x270EEDE58]();
}

uint64_t sub_22127D688()
{
  return MEMORY[0x270EEE158]();
}

uint64_t sub_22127D698()
{
  return MEMORY[0x270EEE188]();
}

uint64_t sub_22127D6A8()
{
  return MEMORY[0x270EEE258]();
}

uint64_t sub_22127D6B8()
{
  return MEMORY[0x270EEE260]();
}

uint64_t sub_22127D6C8()
{
  return MEMORY[0x270EEE618]();
}

uint64_t sub_22127D6D8()
{
  return MEMORY[0x270EEE628]();
}

uint64_t sub_22127D6E8()
{
  return MEMORY[0x270EEE638]();
}

uint64_t sub_22127D6F8()
{
  return MEMORY[0x270EEE648]();
}

uint64_t sub_22127D708()
{
  return MEMORY[0x270EEE658]();
}

uint64_t sub_22127D718()
{
  return MEMORY[0x270EEE670]();
}

uint64_t sub_22127D728()
{
  return MEMORY[0x270EEE680]();
}

uint64_t sub_22127D738()
{
  return MEMORY[0x270EEE688]();
}

uint64_t sub_22127D748()
{
  return MEMORY[0x270EEEA60]();
}

uint64_t sub_22127D7A8()
{
  return MEMORY[0x270EEF7E0]();
}

uint64_t sub_22127D7B8()
{
  return MEMORY[0x270EEF7E8]();
}

uint64_t sub_22127D7C8()
{
  return MEMORY[0x270EEF800]();
}

uint64_t sub_22127D7D8()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_22127D7E8()
{
  return MEMORY[0x270EEF840]();
}

uint64_t sub_22127D7F8()
{
  return MEMORY[0x270EEFFB0]();
}

uint64_t sub_22127D808()
{
  return MEMORY[0x270EF0000]();
}

uint64_t sub_22127D818()
{
  return MEMORY[0x270EF0060]();
}

uint64_t sub_22127D828()
{
  return MEMORY[0x270EF0070]();
}

uint64_t sub_22127D838()
{
  return MEMORY[0x270EF0078]();
}

uint64_t sub_22127D848()
{
  return MEMORY[0x270EF0090]();
}

uint64_t sub_22127D858()
{
  return MEMORY[0x270EF00B0]();
}

uint64_t sub_22127D868()
{
  return MEMORY[0x270EF00D0]();
}

uint64_t sub_22127D878()
{
  return MEMORY[0x270EF00E8]();
}

uint64_t sub_22127D888()
{
  return MEMORY[0x270EF00F8]();
}

uint64_t sub_22127D898()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_22127D8A8()
{
  return MEMORY[0x270EF0130]();
}

uint64_t sub_22127D8B8()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_22127D8C8()
{
  return MEMORY[0x270EF0190]();
}

uint64_t sub_22127D8D8()
{
  return MEMORY[0x270EF01D0]();
}

uint64_t sub_22127D8E8()
{
  return MEMORY[0x270EF01E0]();
}

uint64_t sub_22127D8F8()
{
  return MEMORY[0x270EF0218]();
}

uint64_t sub_22127D908()
{
  return MEMORY[0x270EF0220]();
}

uint64_t sub_22127D918()
{
  return MEMORY[0x270EF0238]();
}

uint64_t sub_22127D928()
{
  return MEMORY[0x270EF0248]();
}

uint64_t sub_22127D938()
{
  return MEMORY[0x270FA06B8]();
}

uint64_t sub_22127D948()
{
  return MEMORY[0x270FA06C8]();
}

uint64_t sub_22127D958()
{
  return MEMORY[0x270FA06D8]();
}

uint64_t sub_22127D968()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_22127D978()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_22127D988()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_22127D998()
{
  return MEMORY[0x270EEAA78]();
}

uint64_t sub_22127D9A8()
{
  return MEMORY[0x270EEAA80]();
}

uint64_t sub_22127D9B8()
{
  return MEMORY[0x270EEAA98]();
}

uint64_t sub_22127D9C8()
{
  return MEMORY[0x270EEAAA8]();
}

uint64_t sub_22127D9D8()
{
  return MEMORY[0x270EEB090]();
}

uint64_t sub_22127D9E8()
{
  return MEMORY[0x270EF1818]();
}

uint64_t sub_22127D9F8()
{
  return MEMORY[0x270F9D318]();
}

uint64_t sub_22127DA08()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_22127DA18()
{
  return MEMORY[0x270F9D398]();
}

uint64_t sub_22127DA28()
{
  return MEMORY[0x270F9D478]();
}

uint64_t sub_22127DA38()
{
  return MEMORY[0x270F9D480]();
}

uint64_t sub_22127DA48()
{
  return MEMORY[0x270F9D488]();
}

uint64_t sub_22127DA58()
{
  return MEMORY[0x270F9D490]();
}

uint64_t sub_22127DA68()
{
  return MEMORY[0x270F9D598]();
}

uint64_t sub_22127DA78()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_22127DA88()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_22127DA98()
{
  return MEMORY[0x270EF19F8]();
}

uint64_t sub_22127DAA8()
{
  return MEMORY[0x270EF1A10]();
}

uint64_t sub_22127DAB8()
{
  return MEMORY[0x270EF1A50]();
}

uint64_t sub_22127DAC8()
{
  return MEMORY[0x270EF1AA8]();
}

uint64_t sub_22127DAD8()
{
  return MEMORY[0x270EF1AD0]();
}

uint64_t sub_22127DAE8()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_22127DAF8()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_22127DB08()
{
  return MEMORY[0x270F9D6B8]();
}

uint64_t sub_22127DB18()
{
  return MEMORY[0x270F9D6E0]();
}

uint64_t sub_22127DB28()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_22127DB38()
{
  return MEMORY[0x270F9D740]();
}

uint64_t sub_22127DB48()
{
  return MEMORY[0x270F9D748]();
}

uint64_t sub_22127DB58()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_22127DB68()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_22127DB78()
{
  return MEMORY[0x270F9D7D8]();
}

uint64_t sub_22127DB88()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_22127DB98()
{
  return MEMORY[0x270F9D7E8]();
}

uint64_t sub_22127DBA8()
{
  return MEMORY[0x270F9D800]();
}

uint64_t sub_22127DBB8()
{
  return MEMORY[0x270F9D808]();
}

uint64_t sub_22127DBC8()
{
  return MEMORY[0x270F9D810]();
}

uint64_t sub_22127DBD8()
{
  return MEMORY[0x270F9D860]();
}

uint64_t sub_22127DBE8()
{
  return MEMORY[0x270F9D8B0]();
}

uint64_t sub_22127DBF8()
{
  return MEMORY[0x270F9D8E0]();
}

uint64_t sub_22127DC08()
{
  return MEMORY[0x270F9D8F0]();
}

uint64_t sub_22127DC18()
{
  return MEMORY[0x270F9D8F8]();
}

uint64_t sub_22127DC28()
{
  return MEMORY[0x270F9D948]();
}

uint64_t sub_22127DC38()
{
  return MEMORY[0x270F9D968]();
}

uint64_t sub_22127DC48()
{
  return MEMORY[0x270F9D988]();
}

uint64_t sub_22127DC58()
{
  return MEMORY[0x270F9D990]();
}

uint64_t sub_22127DC68()
{
  return MEMORY[0x270F9D9A0]();
}

uint64_t sub_22127DC78()
{
  return MEMORY[0x270F9DA40]();
}

uint64_t sub_22127DC88()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_22127DC98()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_22127DCA8()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_22127DCB8()
{
  return MEMORY[0x270F9DC20]();
}

uint64_t sub_22127DCC8()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_22127DCD8()
{
  return MEMORY[0x270F9E0A0]();
}

uint64_t sub_22127DCE8()
{
  return MEMORY[0x270EF1E30]();
}

uint64_t sub_22127DCF8()
{
  return MEMORY[0x270EF1E40]();
}

uint64_t sub_22127DD08()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_22127DD18()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_22127DD28()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_22127DD38()
{
  return MEMORY[0x270FA11A0]();
}

uint64_t sub_22127DD48()
{
  return MEMORY[0x270EF2350]();
}

uint64_t sub_22127DD58()
{
  return MEMORY[0x270EF2380]();
}

uint64_t sub_22127DD68()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_22127DD78()
{
  return MEMORY[0x270F9E4B0]();
}

uint64_t sub_22127DD88()
{
  return MEMORY[0x270F9E508]();
}

uint64_t sub_22127DD98()
{
  return MEMORY[0x270F9E518]();
}

uint64_t sub_22127DDA8()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_22127DDB8()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_22127DDC8()
{
  return MEMORY[0x270EF2478]();
}

uint64_t sub_22127DDD8()
{
  return MEMORY[0x270F9E5B8]();
}

uint64_t sub_22127DDE8()
{
  return MEMORY[0x270F9E5C0]();
}

uint64_t sub_22127DDF8()
{
  return MEMORY[0x270F9E620]();
}

uint64_t sub_22127DE08()
{
  return MEMORY[0x270F9E640]();
}

uint64_t sub_22127DE18()
{
  return MEMORY[0x270F9E648]();
}

uint64_t sub_22127DE28()
{
  return MEMORY[0x270F9E650]();
}

uint64_t sub_22127DE38()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_22127DE48()
{
  return MEMORY[0x270F9E7E8]();
}

uint64_t sub_22127DE58()
{
  return MEMORY[0x270F9E9A8]();
}

uint64_t sub_22127DE68()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_22127DE78()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_22127DE88()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_22127DE98()
{
  return MEMORY[0x270F9EB98]();
}

uint64_t sub_22127DEA8()
{
  return MEMORY[0x270F9EBC0]();
}

uint64_t sub_22127DEB8()
{
  return MEMORY[0x270F9EC08]();
}

uint64_t sub_22127DEC8()
{
  return MEMORY[0x270F9EC10]();
}

uint64_t sub_22127DED8()
{
  return MEMORY[0x270F9EDF8]();
}

uint64_t sub_22127DEE8()
{
  return MEMORY[0x270F9EE78]();
}

uint64_t sub_22127DEF8()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_22127DF08()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_22127DF18()
{
  return MEMORY[0x270F9F098]();
}

uint64_t sub_22127DF28()
{
  return MEMORY[0x270F9F0A0]();
}

uint64_t sub_22127DF38()
{
  return MEMORY[0x270F9F0B0]();
}

uint64_t sub_22127DF48()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_22127DF58()
{
  return MEMORY[0x270F9F138]();
}

uint64_t sub_22127DF78()
{
  return MEMORY[0x270F9F4D0]();
}

uint64_t sub_22127DF88()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_22127DF98()
{
  return MEMORY[0x270F9F7B0]();
}

uint64_t sub_22127DFA8()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_22127DFB8()
{
  return MEMORY[0x270F9FA28]();
}

uint64_t sub_22127DFC8()
{
  return MEMORY[0x270F9FA68]();
}

uint64_t sub_22127DFD8()
{
  return MEMORY[0x270F9FA80]();
}

uint64_t sub_22127DFE8()
{
  return MEMORY[0x270F9FB18]();
}

uint64_t sub_22127E018()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_22127E028()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_22127E038()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_22127E048()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_22127E058()
{
  return MEMORY[0x270EF2708]();
}

uint64_t sub_22127E068()
{
  return MEMORY[0x270EF2710]();
}

uint64_t sub_22127E078()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_22127E088()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_22127E098()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_22127E0A8()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t AMFIIsDeveloperModeEnabled()
{
  return MEMORY[0x270F0E860]();
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B30](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B38](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B40](c, data, *(void *)&len);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

void CFRelease(CFTypeRef cf)
{
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F40](*(void *)&connection, *(void *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x270EF47B8](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x270EF4A80](notifyPort, *(void *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x270EF4A98](*(void *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x270EF4AB0](*(void *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x270EF4AE0](*(void *)&service, *(void *)&owningTask, *(void *)&type, connect);
}

void NSLog(NSString *format, ...)
{
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x270EFD710](certificate);
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return (SecKeyRef)MEMORY[0x270EFD758](certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x270EFD7E0](allocator, data);
}

uint64_t SecKeyCreateEncryptedDataWithParameters()
{
  return MEMORY[0x270EFDA18]();
}

uint64_t SecKeyCreateFromSubjectPublicKeyInfoData()
{
  return MEMORY[0x270EFDA28]();
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x270EFDA60](keyData, attributes, error);
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x270EFDAC8](key, algorithm, signedData, signature, error);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x270EFDC20](rnd, count, bytes);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
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

void bzero(void *a1, size_t a2)
{
}

int chmod(const char *a1, mode_t a2)
{
  return MEMORY[0x270ED8EC8](a1, a2);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

int dlclose(void *__handle)
{
  return MEMORY[0x270ED9618](__handle);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x270ED9628](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

int fflush(FILE *a1)
{
  return MEMORY[0x270ED9938](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x270ED99F0](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x270ED9A20](a1, a2);
}

void free(void *a1)
{
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x270ED9B18](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x270ED9D00]();
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x270EDA098](a1);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x270EDA378](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)((uint64_t (*)(id, SEL))MEMORY[0x270F9A6D0])(a1, a2);
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

uint64_t self
{
  return MEMORY[0x270F9A730]();
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

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
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

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x270EDAA60](log);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x270EDB5F0](a1, a2, a3, a4);
}

char *__cdecl strtok_r(char *__str, const char *__sep, char **__lasts)
{
  return (char *)MEMORY[0x270EDB6D0](__str, __sep, __lasts);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB708](__str, __endptr, *(void *)&__base);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x270FA0180]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x270FA0190]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x270FA01C8]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x270FA01E0]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x270FA01E8]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x270FA01F0]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x270FA01F8]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x270FA0200]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x270FA0208]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x270FA0240]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x270FA02C0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x270FA02C8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x270FA02F8]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x270FA0300]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x270FA03B0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x270FA03E0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x270FA0448]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x270FA0450]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x270FA0478]();
}

uint64_t swift_initStaticObject()
{
  return MEMORY[0x270FA0480]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x270FA0488]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x270FA04C8]();
}

uint64_t swift_once()
{
  return MEMORY[0x270FA04F0]();
}

uint64_t swift_release()
{
  return MEMORY[0x270FA0520]();
}

uint64_t swift_retain()
{
  return MEMORY[0x270FA0530]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x270FA0550]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x270FA0558]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x270FA0560]();
}

uint64_t swift_unexpectedError()
{
  return MEMORY[0x270FA0588]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x270FA0670]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x270EDB7D0](a1, *(void *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}

uint64_t terminate_with_reason()
{
  return MEMORY[0x270EDB8D8]();
}

time_t time(time_t *a1)
{
  return MEMORY[0x270EDB930](a1);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return MEMORY[0x270EDBA70](a1, a2, a3);
}