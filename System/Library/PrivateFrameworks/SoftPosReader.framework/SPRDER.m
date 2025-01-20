@interface SPRDER
+ (BOOL)DERDecodeSequenceContentWithData:(id)a3 block:(id)a4;
+ (BOOL)DERDecodeSequenceWithData:(id)a3 block:(id)a4;
+ (BOOL)DERParseSEFWSequence:(id *)a3 info:(id *)a4;
+ (BOOL)DERParseScriptSequence:(id *)a3 info:(id *)a4;
+ (id)DERDecodeData:(id)a3;
+ (id)DERDecodeData:(id)a3 expectedSingleByteTag:(unsigned __int8)a4;
+ (id)DERDecodeData:(id)a3 expectedTag:(unint64_t)a4;
+ (id)DEREncodeData:(id)a3 singleByteTag:(unsigned __int8)a4;
+ (id)DEREncodeData:(id)a3 tag:(unint64_t)a4;
+ (id)DERParseScriptInfo:(id)a3;
@end

@implementation SPRDER

+ (id)DERDecodeData:(id)a3 expectedSingleByteTag:(unsigned __int8)a4
{
  return (id)((uint64_t (*)(id, char *, id, unint64_t))MEMORY[0x270F9A6D0])(a1, sel_DERDecodeData_expectedTag_, a3, a4 & 0x1F | ((unint64_t)((a4 & 0xE0) >> 5) << 61));
}

+ (id)DERDecodeData:(id)a3 expectedTag:(unint64_t)a4
{
  unint64_t v24 = 0;
  uint64_t v25 = 0;
  uint64_t v26 = 0;
  id v5 = a3;
  v23[0] = objc_msgSend_bytes(v5, v6, v7, v8, v9, v10);
  uint64_t v16 = objc_msgSend_length(v5, v11, v12, v13, v14, v15);

  v23[1] = v16;
  uint64_t v17 = sub_22126708C((uint64_t)v23, &v24);
  if (v17)
  {
    NSLog(&cfstr_DerdecodedataN.isa, v17);
LABEL_3:
    v21 = 0;
    goto LABEL_4;
  }
  if (a4 != -1 && v24 != a4)
  {
    NSLog(&cfstr_DerdecodedataU.isa, v24);
    goto LABEL_3;
  }
  if (!v26)
  {
    NSLog(&cfstr_DerdecodedataN_0.isa);
    goto LABEL_3;
  }
  v21 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v18, v25, v26, v19, v20);
LABEL_4:
  return v21;
}

+ (id)DERDecodeData:(id)a3
{
  return (id)((uint64_t (*)(id, char *, id, uint64_t))MEMORY[0x270F9A6D0])(a1, sel_DERDecodeData_expectedTag_, a3, -1);
}

+ (id)DEREncodeData:(id)a3 tag:(unint64_t)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  uint64_t v25 = 512;
  id v5 = a3;
  unint64_t v11 = objc_msgSend_length(v5, v6, v7, v8, v9, v10);
  id v12 = v5;
  v18 = (const void *)objc_msgSend_bytes(v12, v13, v14, v15, v16, v17);

  uint64_t v19 = sub_221267C50(a4, v11, v18, (unint64_t)v26, (unint64_t *)&v25);
  if (v19)
  {
    NSLog(&cfstr_DerencodedataN.isa, v19);
LABEL_3:
    v23 = 0;
    goto LABEL_6;
  }
  if (!v25)
  {
    NSLog(&cfstr_DerencodedataN_0.isa);
    goto LABEL_3;
  }
  v23 = objc_msgSend_dataWithBytes_length_(MEMORY[0x263EFF8F8], v20, (uint64_t)v26, v25, v21, v22);
LABEL_6:
  return v23;
}

+ (id)DEREncodeData:(id)a3 singleByteTag:(unsigned __int8)a4
{
  return (id)((uint64_t (*)(id, char *, id, unint64_t))MEMORY[0x270F9A6D0])(a1, sel_DEREncodeData_tag_, a3, a4 & 0x1F | ((unint64_t)((a4 & 0xE0) >> 5) << 61));
}

+ (BOOL)DERParseSEFWSequence:(id *)a3 info:(id *)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v7[2] = 0;
  uint64_t v9 = 0;
  v7[0] = 0;
  v7[1] = 0x8000000000000000;
  long long v8 = xmmword_2212801E0;
  uint64_t v4 = sub_22126794C((uint64_t)a3, 2u, (uint64_t)v7, (unint64_t)a4, 0);
  int v5 = v4;
  if (v4) {
    NSLog(&cfstr_NonDrSuccessRe.isa, v4);
  }
  return v5 == 0;
}

+ (BOOL)DERParseScriptSequence:(id *)a3 info:(id *)a4
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v7[6] = xmmword_221280258;
  v7[7] = unk_221280268;
  v7[8] = xmmword_221280278;
  v7[2] = xmmword_221280218;
  void v7[3] = unk_221280228;
  v7[4] = xmmword_221280238;
  v7[5] = unk_221280248;
  v7[0] = xmmword_2212801F8;
  v7[1] = *(_OWORD *)algn_221280208;
  uint64_t v4 = sub_22126794C((uint64_t)a3, 6u, (uint64_t)v7, (unint64_t)a4, 0);
  int v5 = v4;
  if (v4) {
    NSLog(&cfstr_NonDrSuccessRe.isa, v4);
  }
  return v5 == 0;
}

+ (BOOL)DERDecodeSequenceContentWithData:(id)a3 block:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v27[0] = objc_msgSend_bytes(v6, v7, v8, v9, v10, v11);
  uint64_t v17 = objc_msgSend_length(v6, v12, v13, v14, v15, v16);

  v27[1] = v17;
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  unint64_t v24 = sub_22124E7E0;
  uint64_t v25 = &unk_26459CAA8;
  id v18 = v5;
  id v26 = v18;
  uint64_t v19 = sub_221267A2C(v27, (uint64_t)&v22);
  int v20 = v19;
  if (v19) {
    NSLog(&cfstr_NonDrSuccessRe.isa, v19, v22, v23, v24, v25);
  }

  return v20 == 0;
}

+ (BOOL)DERDecodeSequenceWithData:(id)a3 block:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v27[0] = objc_msgSend_bytes(v6, v7, v8, v9, v10, v11);
  uint64_t v17 = objc_msgSend_length(v6, v12, v13, v14, v15, v16);

  v27[1] = v17;
  uint64_t v22 = MEMORY[0x263EF8330];
  uint64_t v23 = 3221225472;
  unint64_t v24 = sub_22124E944;
  uint64_t v25 = &unk_26459CAA8;
  id v18 = v5;
  id v26 = v18;
  uint64_t v19 = sub_22126798C((uint64_t)v27, (uint64_t)&v22);
  int v20 = v19;
  if (v19) {
    NSLog(&cfstr_NonDrSuccessRe.isa, v19, v22, v23, v24, v25);
  }

  return v20 == 0;
}

+ (id)DERParseScriptInfo:(id)a3
{
  id v4 = a3;
  v41[0] = objc_msgSend_bytes(v4, v5, v6, v7, v8, v9);
  uint64_t v15 = objc_msgSend_length(v4, v10, v11, v12, v13, v14);

  v41[1] = v15;
  long long v39 = 0u;
  long long v40 = 0u;
  if (objc_msgSend_DERParseSEFWSequence_info_(a1, v16, (uint64_t)v41, (uint64_t)&v39, v17, v18))
  {
    if (*((void *)&v39 + 1) == 4)
    {
      if (bswap32(*(_DWORD *)v39) - 3 > 0xFFFFFFFD)
      {
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        if (objc_msgSend_DERParseScriptSequence_info_(a1, v19, (uint64_t)&v40, (uint64_t)&v33, v20, v21))
        {
          if (*((void *)&v33 + 1) == 8)
          {
            unint64_t v24 = *(void *)v33;
            id v25 = [NSString alloc];
            v28 = objc_msgSend_initWithBytes_length_encoding_(v25, v26, v34, *((uint64_t *)&v34 + 1), 1, v27);
            if (*((void *)&v36 + 1) == 4)
            {
              uint64_t v29 = bswap32(*(_DWORD *)v36);
              v30 = [SPRScriptInfo alloc];
              uint64_t v22 = objc_msgSend_initWithScriptID_scriptName_apduCount_(v30, v31, bswap64(v24), (uint64_t)v28, v29, v32);
            }
            else
            {
              NSLog(&cfstr_ParseApduCount.isa);
              uint64_t v22 = 0;
            }

            goto LABEL_8;
          }
          NSLog(&cfstr_ParseScriptidF.isa);
        }
        else
        {
          NSLog(&cfstr_ParseScriptSeq.isa);
        }
      }
      else
      {
        NSLog(&cfstr_UnsupportedFor.isa);
      }
    }
    else
    {
      NSLog(&cfstr_ParseFormatVer.isa);
    }
  }
  else
  {
    NSLog(&cfstr_ParseSefwSeqFa.isa);
  }
  uint64_t v22 = 0;
LABEL_8:
  return v22;
}

@end