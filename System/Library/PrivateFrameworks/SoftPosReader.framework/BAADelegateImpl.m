@interface BAADelegateImpl
+ (BOOL)isInternal;
+ (int)confirmSigKey:(unsigned int)a3 status:(int)a4;
+ (int)generateSigKey:(unsigned int)a3 keyData:(id *)a4 attestation:(id *)a5 pubKey:(id *)a6;
+ (int)getBlessedUser:(unsigned int *)a3 keybagUUID:(unsigned __int8)a4[16];
+ (int)getSigKeyCertificates:(unsigned int)a3 certificates:(id *)a4;
+ (int)getSigKeyExpDate:(unsigned int)a3 expirationDate:(unint64_t *)a4;
+ (int)setSigKey:(unsigned int)a3 expirationDate:(unint64_t)a4 keyData:(id)a5 certificates:(id)a6;
@end

@implementation BAADelegateImpl

+ (BOOL)isInternal
{
  if (qword_267F4A980 != -1) {
    dispatch_once(&qword_267F4A980, &unk_26D31D868);
  }
  return byte_267F4A979;
}

+ (int)generateSigKey:(unsigned int)a3 keyData:(id *)a4 attestation:(id *)a5 pubKey:(id *)a6
{
  unsigned int v41 = 0;
  size_t outputStructCnt = 0;
  uint64_t inputStruct = 0;
  if (!a4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      sub_221265B2C();
    }
    goto LABEL_21;
  }
  if (!a5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      sub_221265BC4();
    }
    goto LABEL_21;
  }
  if (!a6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      sub_221265C5C();
    }
LABEL_21:
    uint64_t v34 = 4294967292;
    goto LABEL_14;
  }
  v10 = (unsigned int *)malloc_type_calloc(0x4000uLL, 1uLL, 0xD72640C9uLL);
  if (v10)
  {
    v11 = v10;
    uint64_t v12 = sub_221262648();
    if (v12)
    {
      uint64_t v34 = v12;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        sub_22126611C();
      }
      goto LABEL_13;
    }
    LODWORD(inputStruct) = 1397966179;
    WORD2(inputStruct) = 18;
    unsigned int v41 = a3;
    size_t outputStructCnt = 0x4000;
    uint64_t v13 = IOConnectCallStructMethod(dword_267F4A934, 0, &inputStruct, 0xCuLL, v11, &outputStructCnt);
    if (v13)
    {
      uint64_t v34 = v13;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        sub_221266084();
      }
      goto LABEL_13;
    }
    if (outputStructCnt <= 0xB)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        sub_221265D8C();
      }
    }
    else
    {
      uint64_t v17 = *v11;
      if (outputStructCnt == v17 + v11[1] + v11[2] + 12)
      {
        id v18 = (id)objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v14, (uint64_t)(v11 + 3), v17, v15, v16);
        if (v18)
        {
          v22 = v18;
          uint64_t v23 = (uint64_t)v11 + *v11 + 12;
          id v24 = (id)objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v19, v23, v11[1], v20, v21);
          if (v24)
          {
            v28 = v24;
            id v29 = (id)objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v25, v23 + v11[1], v11[2], v26, v27);
            if (v29)
            {
              v30 = v29;
              id v31 = v22;
              *a4 = v31;
              id v32 = v28;
              *a5 = v32;
              id v33 = v30;
              *a6 = v33;

              uint64_t v34 = 0;
LABEL_13:
              free(v11);
              goto LABEL_14;
            }
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              sub_221265F54();
            }
          }
          else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
          {
            sub_221265EBC();
          }
        }
        else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
        {
          sub_221265E24();
        }
        uint64_t v34 = 4294967291;
        goto LABEL_13;
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        sub_221265FEC();
      }
    }
    uint64_t v34 = 4294967290;
    goto LABEL_13;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    sub_221265CF4();
  }
  uint64_t v34 = 4294967291;
LABEL_14:
  sub_221262A60((uint64_t)"generateSigKey", v34, 0, 0, 0, v35, v36, v37);
  return v34;
}

+ (int)setSigKey:(unsigned int)a3 expirationDate:(unint64_t)a4 keyData:(id)a5 certificates:(id)a6
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  id v9 = a5;
  id v10 = a6;
  id v11 = v9;
  id v12 = v10;
  uint64_t v13 = (char *)malloc_type_calloc(0x4000uLL, 1uLL, 0xE63C3C98uLL);
  if (!v13)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      sub_2212661B4();
    }
    uint64_t v83 = 4294967291;
    goto LABEL_32;
  }
  v14 = v13;
  uint64_t v15 = sub_221262648();
  if (v15)
  {
    uint64_t v83 = v15;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      sub_221266544();
    }
    goto LABEL_31;
  }
  *(_DWORD *)v14 = 1397966179;
  *((_WORD *)v14 + 2) = 19;
  *((_DWORD *)v14 + 2) = a3;
  *(void *)(v14 + 12) = a4;
  uint64_t v21 = v14 + 28;
  if (v11)
  {
    if ((unint64_t)objc_msgSend_length(v11, v16, v17, v18, v19, v20) >= 0x3FE5)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        sub_2212664AC();
      }
      uint64_t v83 = 4294967292;
      goto LABEL_31;
    }
    *((_DWORD *)v14 + 5) = objc_msgSend_length(v11, v22, v23, v24, v25, v26);
    uint64_t v32 = objc_msgSend_length(v11, v27, v28, v29, v30, v31);
    objc_msgSend_getBytes_length_(v11, v33, (uint64_t)(v14 + 28), v32, v34, v35);
    v21 += objc_msgSend_length(v11, v36, v37, v38, v39, v40);
  }
  else
  {
    *((_DWORD *)v14 + 5) = 0;
  }
  if (!objc_msgSend_count(v12, v16, v17, v18, v19, v20))
  {
    *((_DWORD *)v14 + 6) = 0;
    goto LABEL_20;
  }
  *((_DWORD *)v14 + 6) = objc_msgSend_count(v12, v41, v42, v43, v44, v45);
  long long v90 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  id v89 = v12;
  id v46 = v12;
  uint64_t v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v47, (uint64_t)&v90, (uint64_t)v94, 16, v48);
  if (!v49) {
    goto LABEL_18;
  }
  uint64_t v50 = v49;
  v51 = v14 + 0x4000;
  uint64_t v52 = *(void *)v91;
  while (2)
  {
    for (uint64_t i = 0; i != v50; ++i)
    {
      if (*(void *)v91 != v52) {
        objc_enumerationMutation(v46);
      }
      v54 = *(void **)(*((void *)&v90 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          sub_221266414();
        }
        goto LABEL_30;
      }
      if ((unint64_t)(v51 - v21) <= 3)
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          sub_2212662E4();
        }
        goto LABEL_30;
      }
      *(_DWORD *)uint64_t v21 = objc_msgSend_length(v54, v55, v56, v57, v58, v59);
      uint64_t v60 = (uint64_t)(v21 + 4);
      if (objc_msgSend_length(v54, v61, v62, v63, v64, v65) > (unint64_t)&v51[-v60])
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          sub_22126637C();
        }
LABEL_30:

        uint64_t v83 = 4294967292;
        id v12 = v89;
        goto LABEL_31;
      }
      uint64_t v71 = objc_msgSend_length(v54, v66, v67, v68, v69, v70);
      objc_msgSend_getBytes_length_(v54, v72, v60, v71, v73, v74);
      uint64_t v21 = (char *)(v60 + objc_msgSend_length(v54, v75, v76, v77, v78, v79));
    }
    uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v80, (uint64_t)&v90, (uint64_t)v94, 16, v81);
    if (v50) {
      continue;
    }
    break;
  }
LABEL_18:

  id v12 = v89;
LABEL_20:
  uint64_t v82 = IOConnectCallStructMethod(dword_267F4A934, 0, v14, v21 - v14, 0, 0);
  uint64_t v83 = 0;
  if (v82)
  {
    uint64_t v84 = v82;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      sub_22126624C();
    }
    uint64_t v83 = v84;
  }
LABEL_31:
  free(v14);
LABEL_32:
  sub_221262A60((uint64_t)"setSigKey", v83, 0, 0, 0, v85, v86, v87);

  return v83;
}

+ (int)getSigKeyExpDate:(unsigned int)a3 expirationDate:(unint64_t *)a4
{
  unsigned int v16 = 0;
  unint64_t outputStruct = 0;
  uint64_t inputStruct = 0;
  size_t v13 = 0;
  if (a4)
  {
    uint64_t v6 = sub_221262648();
    if (v6)
    {
      uint64_t v11 = v6;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        sub_2212667A4();
      }
    }
    else
    {
      LODWORD(inputStruct) = 1397966179;
      WORD2(inputStruct) = 20;
      unsigned int v16 = a3;
      size_t v13 = 8;
      uint64_t v7 = IOConnectCallStructMethod(dword_267F4A934, 0, &inputStruct, 0xCuLL, &outputStruct, &v13);
      if (v7)
      {
        uint64_t v11 = v7;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          sub_22126670C();
        }
      }
      else if (v13 == 8)
      {
        uint64_t v11 = 0;
        *a4 = outputStruct;
      }
      else
      {
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          sub_221266674();
        }
        uint64_t v11 = 4294967290;
      }
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      sub_2212665DC();
    }
    uint64_t v11 = 4294967292;
  }
  sub_221262A60((uint64_t)"getSigKeyExpDate", v11, 0, 0, 0, v8, v9, v10);
  return v11;
}

+ (int)getSigKeyCertificates:(unsigned int)a3 certificates:(id *)a4
{
  unsigned int v21 = 0;
  size_t outputStructCnt = 0;
  uint64_t inputStruct = 0;
  id v18 = 0;
  if (a4)
  {
    uint64_t v6 = malloc_type_calloc(0x4000uLL, 1uLL, 0x7CCF5ECFuLL);
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = sub_221262648();
      if (v8)
      {
        uint64_t v12 = v8;
        if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
          sub_221266A9C();
        }
      }
      else
      {
        LODWORD(inputStruct) = 1397966179;
        WORD2(inputStruct) = 25;
        unsigned int v21 = a3;
        size_t outputStructCnt = 0x4000;
        uint64_t v9 = IOConnectCallStructMethod(dword_267F4A934, 0, &inputStruct, 0xCuLL, v7, &outputStructCnt);
        if (v9)
        {
          uint64_t v12 = v9;
          if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
            sub_221266A04();
          }
        }
        else
        {
          int v17 = 0;
          uint64_t v12 = sub_221262B3C((const char *)v7, (const char *)v7 + outputStructCnt, &v18, &v17, v10, v11);
          if (v12)
          {
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
              sub_22126696C();
            }
            if (v18) {
              CFRelease(v18);
            }
          }
          else
          {
            *a4 = v18;
          }
        }
      }
      free(v7);
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        sub_2212668D4();
      }
      uint64_t v12 = 4294967291;
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      sub_22126683C();
    }
    uint64_t v12 = 4294967292;
  }
  sub_221262A60((uint64_t)"getSigKeyCertificates", v12, 0, 0, 0, v13, v14, v15);
  return v12;
}

+ (int)confirmSigKey:(unsigned int)a3 status:(int)a4
{
  uint64_t v13 = 0;
  unint64_t v14 = 0;
  uint64_t v6 = sub_221262648();
  if (v6)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      sub_221266BCC();
    }
  }
  else
  {
    LODWORD(v13) = 1397966179;
    WORD2(v13) = 21;
    unint64_t v14 = __PAIR64__(a4, a3);
    uint64_t v7 = IOConnectCallStructMethod(dword_267F4A934, 0, &v13, 0x10uLL, 0, 0);
    if (v7)
    {
      uint64_t v12 = v7;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        sub_221266B34();
      }
      uint64_t v6 = v12;
    }
  }
  sub_221262A60((uint64_t)"confirmSigKey", v6, 0, 0, 0, v8, v9, v10);
  return v6;
}

+ (int)getBlessedUser:(unsigned int *)a3 keybagUUID:(unsigned __int8)a4[16]
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t inputStruct = 0;
  memset(outputStruct, 0, sizeof(outputStruct));
  size_t v13 = 0;
  if (!a3)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      sub_221266C64();
    }
    goto LABEL_12;
  }
  if (!a4)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      sub_221266CFC();
    }
LABEL_12:
    uint64_t v11 = 4294967292;
    goto LABEL_7;
  }
  uint64_t v6 = sub_221262648();
  if (v6)
  {
    uint64_t v11 = v6;
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      sub_221266EC4();
    }
  }
  else
  {
    LODWORD(inputStruct) = 1397966179;
    WORD2(inputStruct) = 24;
    size_t v13 = 20;
    uint64_t v7 = IOConnectCallStructMethod(dword_267F4A934, 0, &inputStruct, 8uLL, outputStruct, &v13);
    if (v7)
    {
      uint64_t v11 = v7;
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        sub_221266E2C();
      }
    }
    else if (v13 == 20)
    {
      uint64_t v11 = 0;
      *a3 = *(_DWORD *)outputStruct;
      *(_OWORD *)a4 = *(_OWORD *)&outputStruct[4];
    }
    else
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
        sub_221266D94();
      }
      uint64_t v11 = 4294967290;
    }
  }
LABEL_7:
  sub_221262A60((uint64_t)"getBlessedUser", v11, 0, 0, 0, v8, v9, v10);
  return v11;
}

@end