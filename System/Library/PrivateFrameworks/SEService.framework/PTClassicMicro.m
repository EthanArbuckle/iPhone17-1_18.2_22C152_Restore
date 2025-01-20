@interface PTClassicMicro
+ (BOOL)isError:(uint64_t)a1;
+ (BOOL)select:(void *)a3 seHandle:(uint64_t)a4 error:;
+ (id)getACLfromAssetACL:(id)a3 error:(id *)a4;
+ (id)getNonce:(void *)a3 error:;
+ (id)sign:(id)a3 designatedKey:(id)a4 extAuth:(id)a5 seHandle:(id)a6 seid:(id)a7 error:(id *)a8;
+ (id)sign:(void *)a3 aid:(unsigned int)a4 slotNumber:(void *)a5 assetACL:(void *)a6 assetACLAttesetation:(unsigned __int8)a7 operationApprovalVersion:(void *)a8 extAuth:(void *)a9 seHandle:(void *)a10 seid:(void *)a11 error:;
+ (uint64_t)evaluateSecureElementACL:(void *)a3 assetACLAttesetation:(void *)a4 extAuth:(void *)a5 seid:(void *)a6 operation:(void *)a7 nonce:(unsigned __int8)a8 operationApprovalVersion:(void *)a9 outOperationApproval:(void *)a10 outOperationApprovalAttestation:(void *)a11 error:;
+ (void)executeCommand:(uint64_t)a3 itemData:(uint64_t)a4 spec:(void *)a5 seHandle:(void *)a6 error:;
@end

@implementation PTClassicMicro

+ (id)sign:(id)a3 designatedKey:(id)a4 extAuth:(id)a5 seHandle:(id)a6 seid:(id)a7 error:(id *)a8
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = [v15 aid];
  unsigned int v18 = [v15 slotNumber];
  v19 = [v15 assetACL];
  v20 = [v15 assetACLAttestation];
  unsigned __int8 v21 = [v15 operationApprovalVersion];

  v22 = +[PTClassicMicro sign:aid:slotNumber:assetACL:assetACLAttesetation:operationApprovalVersion:extAuth:seHandle:seid:error:]((uint64_t)PTClassicMicro, v16, v17, v18, v19, v20, v21, v14, v13, v12, a8);

  return v22;
}

+ (id)sign:(void *)a3 aid:(unsigned int)a4 slotNumber:(void *)a5 assetACL:(void *)a6 assetACLAttesetation:(unsigned __int8)a7 operationApprovalVersion:(void *)a8 extAuth:(void *)a9 seHandle:(void *)a10 seid:(void *)a11 error:
{
  id v40 = a2;
  id v17 = a3;
  id v43 = a5;
  id v42 = a6;
  id v41 = a8;
  id v18 = a9;
  id v19 = a10;
  self;
  v52[0] = 0;
  BOOL v20 = +[PTClassicMicro select:seHandle:error:]((uint64_t)PTClassicMicro, v17, v18, (uint64_t)v52);
  id v21 = v52[0];
  if (v20)
  {
    id v51 = v21;
    v22 = +[PTClassicMicro getNonce:error:]((uint64_t)PTClassicMicro, v18, &v51);
    id v23 = v51;

    if (v22 && !v23)
    {
      id v49 = 0;
      id v50 = 0;
      id v48 = 0;
      int v24 = +[PTClassicMicro evaluateSecureElementACL:assetACLAttesetation:extAuth:seid:operation:nonce:operationApprovalVersion:outOperationApproval:outOperationApprovalAttestation:error:]((uint64_t)PTClassicMicro, v43, v42, v41, v19, @"osgn", v22, a7, &v50, &v49, &v48);
      id v25 = v50;
      id v39 = v49;
      id v26 = v48;
      id v21 = v26;
      if (!v24 || !v25 || !v39 || v26)
      {
        if (a11)
        {
          v34 = SESDefaultLogObject();
          SESCreateAndLogError();
          *a11 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_26;
      }
      char v47 = 1;
      __int16 v46 = bswap32(a4) >> 16;
      v27 = [@"0001" hexStringAsData];
      v45[0] = &v47;
      v45[1] = 1;
      v45[2] = &v46;
      v45[3] = 2;
      v45[4] = [v40 DERItem];
      v45[5] = v28;
      v45[6] = [v27 DERItem];
      v45[7] = v29;
      v45[8] = [v25 DERItem];
      v45[9] = v30;
      v45[10] = [v39 DERItem];
      v45[11] = v31;
      id v44 = 0;
      v32 = +[PTClassicMicro executeCommand:itemData:spec:seHandle:error:]((uint64_t)PTClassicMicro, 0xC000u, (uint64_t)v45, (uint64_t)&PTSignInputSpec, v18, &v44);
      id v33 = v44;
      id v21 = v33;
      if (!v32 || v33)
      {
        if (!a11)
        {
LABEL_25:

LABEL_26:
          goto LABEL_27;
        }
        v35 = SESDefaultLogObject();
        SESCreateAndLogError();
        *a11 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        [v32 DERItem];
        DERParseSequenceSpec();
        if (!a11) {
          goto LABEL_25;
        }
        uint64_t v38 = SESDefaultLogObject();
        v37 = [v32 asHexString];
        v35 = (void *)v38;
        SESCreateAndLogError();
        *a11 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_25;
    }
    if (!a11)
    {
      id v21 = v23;
LABEL_28:

      goto LABEL_29;
    }
    SESDefaultLogObject();
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    SESCreateAndLogError();
    *a11 = (id)objc_claimAutoreleasedReturnValue();
    id v21 = v23;
LABEL_27:

    goto LABEL_28;
  }
  if (a11)
  {
    v22 = SESDefaultLogObject();
    id v25 = [v17 asHexString];
    SESCreateAndLogError();
    *a11 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
LABEL_29:

  return 0;
}

+ (BOOL)select:(void *)a3 seHandle:(uint64_t)a4 error:
{
  id v6 = a3;
  id v7 = a2;
  self;
  v8 = [MEMORY[0x263EFF990] dataWithBytes:&select_seHandle_error__selectHdr length:4];
  objc_msgSend(v8, "appendU8:", objc_msgSend(v7, "length"));
  [v8 appendData:v7];

  v9 = [v6 transceive:v8 error:a4];

  BOOL v10 = !+[PTClassicMicro isError:]((uint64_t)PTClassicMicro, v9);
  return v10;
}

+ (id)getNonce:(void *)a3 error:
{
  id v4 = a2;
  self;
  v5 = +[PTClassicMicro executeCommand:itemData:spec:seHandle:error:]((uint64_t)PTClassicMicro, 0x2000u, 0, 0, v4, a3);

  return v5;
}

+ (uint64_t)evaluateSecureElementACL:(void *)a3 assetACLAttesetation:(void *)a4 extAuth:(void *)a5 seid:(void *)a6 operation:(void *)a7 nonce:(unsigned __int8)a8 operationApprovalVersion:(void *)a9 outOperationApproval:(void *)a10 outOperationApprovalAttestation:(void *)a11 error:
{
  CFDataRef v17 = a7;
  id v18 = a6;
  CFDataRef v19 = a5;
  CFDataRef v20 = a4;
  CFDataRef v21 = a3;
  CFDataRef v22 = a2;
  self;
  id v27 = 0;
  id v28 = 0;
  int v23 = SSEEvaluateSecureElementACL(v20, -1, v19, v22, v21, v18, v17, a8, (const __CFData **)&v28, (const __CFData **)&v27);

  *a9 = v28;
  id v24 = v27;
  *a10 = v24;
  if (!v23 && *a9 && v24) {
    return 1;
  }
  if (a11)
  {
    id v25 = SESDefaultLogObject();
    SESCreateAndLogError();
    *a11 = (id)objc_claimAutoreleasedReturnValue();
  }
  return 0;
}

+ (void)executeCommand:(uint64_t)a3 itemData:(uint64_t)a4 spec:(void *)a5 seHandle:(void *)a6 error:
{
  __int16 v32 = a2;
  id v10 = a5;
  self;
  v11 = 0;
  if (a3 && a4 && (encodeSequenceSpec(), (v11 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    a6 = 0;
  }
  else
  {
    char v31 = 1;
    __int16 v32 = __rev16(a2);
    id v25 = &v31;
    uint64_t v26 = 1;
    id v27 = &v32;
    uint64_t v28 = 2;
    uint64_t v29 = [v11 DERItem];
    uint64_t v30 = v12;
    id v13 = encodeSequenceSpec();
    char v24 = 0;
    int v23 = 8429696;
    id v14 = [MEMORY[0x263EFF990] dataWithBytes:&v23 length:5];
    objc_msgSend(v14, "appendU16BE:", (unsigned __int16)objc_msgSend(v13, "length"));
    [v14 appendData:v13];
    [v14 appendU16BE:0];
    id v22 = 0;
    id v15 = [v10 transceive:v14 error:&v22];
    id v16 = v22;
    CFDataRef v17 = v16;
    if (!v15 || v16 || +[PTClassicMicro isError:]((uint64_t)PTClassicMicro, v15))
    {
      if (a6)
      {
        id v18 = SESDefaultLogObject();
        CFDataRef v19 = [v15 asHexString];
        CFDataRef v21 = [v14 asHexString];
        SESCreateAndLogError();
        *a6 = (id)objc_claimAutoreleasedReturnValue();

        a6 = 0;
      }
    }
    else
    {
      a6 = objc_msgSend(v15, "subdataWithRange:", 0, objc_msgSend(v15, "length") - 2);
    }
  }
  return a6;
}

+ (BOOL)isError:(uint64_t)a1
{
  id v2 = a2;
  self;
  if ((unint64_t)[v2 length] >= 2)
  {
    id v4 = v2;
    uint64_t v5 = [v4 bytes];
    BOOL v3 = *(unsigned __int16 *)([v4 length] + v5 - 2) != 144;
  }
  else
  {
    BOOL v3 = 1;
  }

  return v3;
}

+ (id)getACLfromAssetACL:(id)a3 error:(id *)a4
{
  id v5 = a3;
  memset(v9, 0, sizeof(v9));
  if (DERParseSequenceSpec())
  {
    if (a4)
    {
      id v6 = SESDefaultLogObject();
      v8 = [v5 base64];
      SESCreateAndLogError();
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0;
    }
  }
  else
  {
    a4 = [MEMORY[0x263EFF8F8] dataWithDERItem:v9];
  }

  return a4;
}

@end