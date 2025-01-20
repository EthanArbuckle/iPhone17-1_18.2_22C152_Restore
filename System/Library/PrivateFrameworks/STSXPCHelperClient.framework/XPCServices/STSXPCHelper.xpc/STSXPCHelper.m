void sub_100004DA4(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

void sub_100004DB4(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 16), a2);
  }
}

STSWifiAwareConfiguration *sub_100004E38(uint64_t a1, void *a2, BOOL a3, void *a4)
{
  id v6 = a4;
  id v7 = a2;
  self;
  v8 = [STSWifiAwareConfiguration alloc];
  id v9 = v7;
  v10 = (id *)v6;
  if (v8)
  {
    v19.receiver = v8;
    v19.super_class = (Class)STSWifiAwareConfiguration;
    v11 = (STSWifiAwareConfiguration *)objc_msgSendSuper2(&v19, "init");
    v8 = v11;
    if (v11)
    {
      v11->_publisher = a3;
      objc_storeStrong((id *)&v11->_serviceName, a2);
      if (v10)
      {
        objc_storeStrong((id *)&v8->_securityInfo, v10[1]);
        id v12 = v10[2];
      }
      else
      {
        securityInfo = v8->_securityInfo;
        v8->_securityInfo = 0;

        id v12 = 0;
      }
      objc_storeStrong((id *)&v8->_channelInfo, v12);
      if (v10)
      {
        objc_storeStrong((id *)&v8->_transportKey, v10[3]);
        id v13 = v10[4];
      }
      else
      {
        transportKey = v8->_transportKey;
        v8->_transportKey = 0;

        id v13 = 0;
      }
      objc_storeStrong((id *)&v8->_peerDHInfo, v13);
      if (v10)
      {
        objc_storeStrong((id *)&v8->_serviceSpecificInfo, v10[5]);
        id v14 = v10[6];
      }
      else
      {
        serviceSpecificInfo = v8->_serviceSpecificInfo;
        v8->_serviceSpecificInfo = 0;

        id v14 = 0;
      }
      objc_storeStrong((id *)&v8->_portNumber, v14);
    }
  }

  return v8;
}

void sub_100005448(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 64), a2);
  }
}

unsigned char *sub_1000054D8(unsigned char *a1, void *a2, char a3)
{
  v5 = a2;
  if (a1)
  {
    v11.receiver = a1;
    v11.super_class = (Class)STSISO18013Handler;
    id v6 = objc_msgSendSuper2(&v11, "init");
    a1 = v6;
    if (v6)
    {
      objc_storeWeak((id *)v6 + 2, v5);
      a1[8] = a3;
      a1[11] = 0;
      id v7 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.sts"];
      v8 = v7;
      if (v5 && v5[13]) {
        char v9 = [v7 BOOLForKey:@"DisableEncryption"] ^ 1;
      }
      else {
        char v9 = 1;
      }
      a1[9] = v9;
    }
  }

  return a1;
}

uint64_t *sub_1000055A4(uint64_t *result, uint64_t a2)
{
  if (result)
  {
    v3 = result;
    v4 = (void *)result[4];
    result[4] = 0;

    v3[3] = a2;
    return (uint64_t *)sub_1000055F0(v3, v5, v6, v7, v8, v9, v10, v11);
  }
  return result;
}

uint64_t *sub_1000055F0(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    uint64_t v8 = a1;
    uint64_t v9 = (void *)a1[4];
    if (!v9)
    {
      sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"[(STSISO18013Handler *)"Creating presentment session idvSession], a7, a8, a1[3]);
      uint64_t v12 = v8[3];
      if (v12)
      {
        uint64_t v13 = 0;
        if (*((unsigned char *)v8 + 11)) {
          uint64_t v14 = 3;
        }
        else {
          uint64_t v14 = 2;
        }
      }
      else
      {
        uint64_t v14 = *((unsigned char *)v8 + 9) == 0;
        uint64_t v13 = 1;
      }
      sub_100025F04(OS_LOG_TYPE_DEFAULT, 1, (uint64_t)"[(STSISO18013Handler *)"encMode=%lu idvSession], v10, v11, v14);
      uint64_t v37 = 0;
      v38 = &v37;
      uint64_t v39 = 0x2050000000;
      v15 = (void *)qword_100066278;
      uint64_t v40 = qword_100066278;
      if (!qword_100066278)
      {
        v32 = _NSConcreteStackBlock;
        uint64_t v33 = 3221225472;
        v34 = sub_1000097C4;
        v35 = &unk_1000548E8;
        v36 = &v37;
        sub_1000097C4((uint64_t)&v32);
        v15 = (void *)v38[3];
      }
      BOOL v16 = v12 == 0;
      v17 = v15;
      _Block_object_dispose(&v37, 8);
      id v18 = [[v17 alloc] initWithSessionEncryptionMode:v14 readerAuthenticationPolicy:v13];
      objc_super v19 = v18;
      if (v16) {
        [v18 setElementFallbackModes:2];
      }
      uint64_t v20 = v8[3];
      if (v20 == 1)
      {
        if (*((unsigned char *)v8 + 11)) {
          uint64_t v21 = 1;
        }
        else {
          uint64_t v21 = 2;
        }
        [v19 setMessageEncodingFormat:v21];
        uint64_t v20 = v8[3];
      }
      if (v20)
      {
        CFStringRef v41 = @"ua";
        v22 = &v41;
      }
      else
      {
        CFStringRef v42 = @"identity";
        v22 = &v42;
      }
      v23 = +[NSArray arrayWithObjects:v22 count:1];
      sub_100025F04(OS_LOG_TYPE_DEFAULT, 1, (uint64_t)"[(STSISO18013Handler *)"partitionList=%@ idvSession], v24, v25, (uint64_t)v23);
      uint64_t v37 = 0;
      v38 = &v37;
      uint64_t v39 = 0x2050000000;
      v26 = (void *)qword_100066280;
      uint64_t v40 = qword_100066280;
      if (!qword_100066280)
      {
        v32 = _NSConcreteStackBlock;
        uint64_t v33 = 3221225472;
        v34 = sub_100009834;
        v35 = &unk_1000548E8;
        v36 = &v37;
        sub_100009834((uint64_t)&v32);
        v26 = (void *)v38[3];
      }
      v27 = v26;
      _Block_object_dispose(&v37, 8);
      id v28 = [[v27 alloc] initWithPartitions:v23 presentmentType:0 options:v19];
      v30 = (void *)v8[4];
      v29 = (void **)(v8 + 4);
      *v29 = v28;

      uint64_t v9 = *v29;
    }
    a1 = v9;
  }

  return a1;
}

void sub_100005914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100005938(id *a1, void *a2, void *a3, void *a4)
{
  if (a1)
  {
    id obj = a4;
    id v7 = a3;
    id v8 = a2;
    sub_100025F04(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSISO18013Handler setConnectionHandoverDeviceEngagement:nfcHandoverRequest:nfcHandoverSelect:]", 104, a1, &stru_100055900, v9, v10, v11);
    objc_storeWeak(a1 + 6, v8);

    objc_storeWeak(a1 + 7, v7);
    objc_storeWeak(a1 + 8, obj);
  }
}

void sub_1000059F4(id *a1, void *a2, void *a3)
{
  id v10 = a2;
  id v8 = a3;
  if (a1)
  {
    sub_100025F04(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSISO18013Handler setUnifiedAccessIKM:endpointIdentifier:]", 113, a1, &stru_100055900, v6, v7, v9);
    objc_storeStrong(a1 + 10, a2);
    objc_storeStrong(a1 + 11, a3);
  }
}

void sub_100005A94(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    sub_10001D97C((uint64_t)ISOSessionEstablishment, v5);
    uint64_t v9 = (id *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      id v10 = 0;
    }
    else
    {
      sub_10001DF08((uint64_t)ISOSessionData, v5);
      id v10 = (id *)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v11 = *(void *)(a1 + 24);
    if (!v11)
    {
      if (v9)
      {
        if (*(unsigned char *)(a1 + 9))
        {
          id v17 = v9[1];

          if (!v17)
          {
            sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSISO18013Handler processMDocRequest:callback:]", 131, (void *)a1, @"Missing reader key", v7, v8, v39);
            NSErrorUserInfoKey v40 = NSLocalizedDescriptionKey;
            CFStringRef v41 = off_1000661A8;
            v32 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
            uint64_t v33 = 11;
            goto LABEL_34;
          }
        }
      }
      if (!*(void *)(a1 + 96) && v10)
      {
        id v18 = @"No valid reader key before Session Data";
        uint64_t v19 = 136;
LABEL_33:
        sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSISO18013Handler processMDocRequest:callback:]", v19, (void *)a1, v18, v7, v8, v39);
        NSErrorUserInfoKey v40 = NSLocalizedDescriptionKey;
        CFStringRef v41 = off_100066160;
        v32 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
        uint64_t v33 = 2;
LABEL_34:
        v34 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:v33 userInfo:v32];

        (*((void (**)(id, void, void, void *, uint64_t))v6 + 2))(v6, 0, 0, v34, 1);
LABEL_42:

        goto LABEL_43;
      }
      uint64_t v11 = *(void *)(a1 + 24);
    }
    if (v11 != 1 || [*(id *)(a1 + 80) length])
    {
      if (v9)
      {
        uint64_t v12 = v9;
        id v13 = v6;
        sub_100025F04(OS_LOG_TYPE_DEFAULT, 1, (uint64_t)"-[STSISO18013Handler _processSessionEstablishment:callback:]", 165, (void *)a1, @"%@", v14, v15, (uint64_t)v12);
        if (*(void *)(a1 + 24))
        {
          id v16 = *(id *)(a1 + 96);
          *(void *)(a1 + 96) = 0;
        }
        else
        {
          id v16 = v12[1];
          uint64_t v28 = +[NSData dataWithCOSEKey:v16];
          v29 = *(void **)(a1 + 96);
          *(void *)(a1 + 96) = v28;
        }
        id v30 = sub_100006060((id)a1, *(void **)(a1 + 96));
        v31 = sub_10001DEB0((uint64_t)NSData, v12);
        sub_100006318((uint64_t *)a1, v31, v13);
      }
      else if (v10)
      {
        id v10 = v10;
        id v20 = v6;
        sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSISO18013Handler _processSessionData:callback:]", 178, (void *)a1, @"SessionData=%@", v21, v22, (uint64_t)v10);
        unint64_t v23 = sub_10001E1F4(v10);
        if (v23 && !*(unsigned char *)(a1 + 10))
        {
          BOOL v25 = v23 == 20 || (v23 & 0xFFFFFFFFFFFFFFFELL) == 10;
          *(unsigned char *)(a1 + 10) = v25;
        }
        id v26 = v10[1];

        if (v26)
        {
          v27 = sub_10001E570((uint64_t)NSData, v10);
          sub_100006318((uint64_t *)a1, v27, v20);
        }
        else
        {
          if (*(unsigned char *)(a1 + 10))
          {
            NSErrorUserInfoKey v40 = NSLocalizedDescriptionKey;
            CFStringRef v41 = off_1000661D8;
            v36 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
            uint64_t v37 = 17;
          }
          else
          {
            NSErrorUserInfoKey v40 = NSLocalizedDescriptionKey;
            CFStringRef v41 = off_1000661A8;
            v36 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
            uint64_t v37 = 11;
          }
          v38 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:v37 userInfo:v36];

          (*((void (**)(id, void, void, void *, uint64_t))v20 + 2))(v20, 0, 0, v38, 1);
        }
      }
      else
      {
        sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSISO18013Handler processMDocRequest:callback:]", 153, (void *)a1, @"Invalid Session Establishment or Session Data", v7, v8, v39);
        NSErrorUserInfoKey v40 = NSLocalizedDescriptionKey;
        CFStringRef v41 = off_1000661A8;
        v35 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
        id v10 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:11 userInfo:v35];

        (*((void (**)(id, void, void, id *, uint64_t))v6 + 2))(v6, 0, 0, v10, 1);
      }
      goto LABEL_42;
    }
    id v18 = @"Missing IKM";
    uint64_t v19 = 143;
    goto LABEL_33;
  }
LABEL_43:
}

id sub_100006060(id a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    if (*((unsigned char *)a1 + 11))
    {
      id v4 = objc_alloc_init((Class)NSData);
      id v5 = (void *)*((void *)a1 + 9);
      *((void *)a1 + 9) = v4;

      id v6 = (void *)*((void *)a1 + 9);
LABEL_5:
      a1 = v6;
      goto LABEL_6;
    }
    id v6 = (void *)*((void *)a1 + 9);
    if (v6) {
      goto LABEL_5;
    }
    id WeakRetained = objc_loadWeakRetained((id *)a1 + 6);
    id v9 = objc_loadWeakRetained((id *)a1 + 8);
    id v10 = objc_loadWeakRetained((id *)a1 + 7);
    uint64_t v11 = objc_opt_new();
    uint64_t v12 = [WeakRetained cborEncodeToBstrCbor];
    [v11 addObject:v12];

    if (!*((void *)a1 + 3))
    {
      if (!v3)
      {
        sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSISO18013Handler generateSessionTranscriptBytesWithReaderKey:]", 679, a1, @"Missing reader ephemeral key; default to zero-length data",
          v13,
          v14,
          v24);
        id v3 = objc_alloc_init((Class)NSData);
      }
      uint64_t v15 = [v3 cborEncodeToBstrCbor];
      [v11 addObject:v15];
    }
    if ([v9 length])
    {
      if ([v10 length]) {
        +[CBOR cborWithData:v10];
      }
      else {
      id v16 = +[CBOR cborNil];
      }
      id v17 = +[CBOR cborWithData:v9];
      v25[0] = v17;
      v25[1] = v16;
      id v18 = +[NSArray arrayWithObjects:v25 count:2];

      uint64_t v19 = +[CBOR cborWithArray:v18];
      [v11 addObject:v19];
    }
    else
    {
      id v16 = +[CBOR cborNil];
      [v11 addObject:v16];
    }

    id v20 = +[CBOR cborWithArray:v11];
    uint64_t v21 = +[NSData dataWithCBOR:v20];

    uint64_t v22 = [v21 encodeToBstrCbor];
    unint64_t v23 = (void *)*((void *)a1 + 9);
    *((void *)a1 + 9) = v22;

    a1 = *((id *)a1 + 9);
  }
LABEL_6:

  return a1;
}

void sub_100006318(uint64_t *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2050000000;
  uint64_t v7 = (void *)qword_100066250;
  uint64_t v26 = qword_100066250;
  if (!qword_100066250)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10000939C;
    v22[3] = &unk_1000548E8;
    v22[4] = &v23;
    sub_10000939C((uint64_t)v22);
    uint64_t v7 = (void *)v24[3];
  }
  uint64_t v8 = v7;
  _Block_object_dispose(&v23, 8);
  id v9 = [[v8 alloc] initWithSessionEstablishment:v5 sessionTranscript:a1[9]];
  id v17 = v9;
  if (a1[3] == 1)
  {
    [v9 setSessionEncryptionIntermediateKeyMaterial:a1[10]];
    [v17 setRequiredPublicKeyIdentifier:a1[11]];
  }
  id v18 = sub_1000055F0(a1, v10, v11, v12, v13, v14, v15, v16);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100006588;
  v20[3] = &unk_1000547F8;
  id v19 = v6;
  v20[4] = a1;
  id v21 = v19;
  [v18 interpretRequest:v17 completion:v20];
}

void sub_1000064B8(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1000064D0(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSISO18013Handler configureForACWGEngagement:]", 200, (void *)a1, @"isAcwg = %ld", a7, a8, a2);
    if ((*(unsigned char *)(a1 + 11) != 0) != a2)
    {
      sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSISO18013Handler configureForACWGEngagement:]", 202, (void *)a1, @" isAcwg param does not match stored value.", v10, v11, v21);
      uint64_t v12 = *(void **)(a1 + 32);
      *(void *)(a1 + 32) = 0;

      *(unsigned char *)(a1 + 11) = a2;
      id v20 = sub_1000055F0((uint64_t *)a1, v13, v14, v15, v16, v17, v18, v19);
    }
  }
}

void sub_100006588(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v6)
  {
    if ([v6 code] == (id)-5104 || objc_msgSend(v7, "code") == (id)-5105)
    {
      NSErrorUserInfoKey v67 = NSUnderlyingErrorKey;
      v68 = v7;
      uint64_t v8 = +[NSDictionary dictionaryWithObjects:&v68 forKeys:&v67 count:1];
      uint64_t v9 = 14;
    }
    else
    {
      NSErrorUserInfoKey v65 = NSUnderlyingErrorKey;
      v66 = v7;
      uint64_t v8 = +[NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
      uint64_t v9 = 10;
    }
    v32 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:v9 userInfo:v8];

    uint64_t v33 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_11;
  }
  if (![v5 count])
  {
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSISO18013Handler _interpretPresentmentRequest:callback:]_block_invoke", 242, *(void **)(a1 + 32), @"DCP returns 0 proposals", v10, v11, v52);
    uint64_t v34 = *(void *)(a1 + 40);
    *(void *)&long long v70 = NSLocalizedDescriptionKey;
    v69[0] = off_1000661A0;
    v35 = +[NSDictionary dictionaryWithObjects:v69 forKeys:&v70 count:1];
    v32 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:10 userInfo:v35];

    uint64_t v33 = *(void (**)(void))(v34 + 16);
LABEL_11:
    v33();
    goto LABEL_26;
  }
  id v12 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = v5;
  id v58 = v5;
  uint64_t v59 = a1;
  v60 = v14;
  id v63 = v12;
  if (v13)
  {
    uint64_t v15 = [v14 firstObject];
    v55 = v15;
    if (v15)
    {
      uint64_t v16 = v15;
      v54 = [v15 readerAnalytics];
      uint64_t v17 = [ReaderAnalyticsData alloc];
      char v18 = [v54 isTrusted];
      uint64_t v19 = [v54 untrustedIdentifier];
      id v20 = [v54 untrustedOrganization];
      uint64_t v21 = [v54 untrustedIssuerIdentifier];
      uint64_t v22 = [v54 untrustedIssuerOrganization];
      obja = sub_10000F568(v17, v18, v19, v20, v21, v22);

      uint64_t v23 = [v16 readerMetadata];
      v56 = [ISO18013ReaderAuthInfo alloc];
      uint64_t v24 = [v23 identifier];
      uint64_t v25 = [v23 organization];
      uint64_t v26 = [v23 organizationalUnit];
      v53 = [v23 iconData];
      v27 = [v23 iconURL];
      uint64_t v28 = [v23 iconMediaType];
      v29 = [v23 privacyPolicyURL];
      id v30 = [v23 merchantCategoryCode];
      v31 = [v16 readerAuthCertificateData];
      v57 = sub_10000F994((id *)&v56->super.isa, v24, v25, v26, v53, v27, v28, v29, v30, v31, obja);

      id v14 = v60;
    }
    else
    {
      v57 = 0;
    }
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id obj = v14;
    id v36 = [obj countByEnumeratingWithState:&v70 objects:v69 count:16];
    if (v36)
    {
      id v37 = v36;
      uint64_t v38 = *(void *)v71;
      do
      {
        for (i = 0; i != v37; i = (char *)i + 1)
        {
          if (*(void *)v71 != v38) {
            objc_enumerationMutation(obj);
          }
          NSErrorUserInfoKey v40 = *(void **)(*((void *)&v70 + 1) + 8 * i);
          CFStringRef v41 = objc_opt_new();
          CFStringRef v42 = [v40 elements];
          v64[0] = _NSConcreteStackBlock;
          v64[1] = 3221225472;
          v64[2] = sub_100009064;
          v64[3] = &unk_100054960;
          v64[4] = v41;
          [v42 enumerateKeysAndObjectsUsingBlock:v64];

          v43 = [STSISO18013CredRequest alloc];
          v44 = [v40 credentialIdentifier];
          v45 = [v40 authACL];
          v46 = [v40 docType];
          v47 = sub_10000F1EC((id *)&v43->super.super.isa, v44, v41, v45, v46);

          [v63 addObject:v47];
        }
        id v37 = [obj countByEnumeratingWithState:&v70 objects:v69 count:16];
      }
      while (v37);
    }
  }
  else
  {
    v57 = 0;
  }
  v32 = v63;

  v48 = v57;
  uint64_t v49 = *(void *)(v59 + 40);
  if (*(unsigned char *)(*(void *)(v59 + 32) + 10))
  {
    *(void *)&long long v70 = NSLocalizedDescriptionKey;
    v69[0] = off_1000661D8;
    v50 = +[NSDictionary dictionaryWithObjects:v69 forKeys:&v70 count:1];
    v51 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:17 userInfo:v50];

    (*(void (**)(uint64_t, id, id *, void *, void))(v49 + 16))(v49, v63, v48, v51, 0);
  }
  else
  {
    (*(void (**)(void, id, id *, void, void))(v49 + 16))(*(void *)(v59 + 40), v63, v48, 0, 0);
  }
  uint64_t v7 = 0;
  id v5 = v58;

LABEL_26:
}

uint64_t *sub_100006C6C(uint64_t *a1, void *a2)
{
  v2 = a1;
  if (a1)
  {
    uint64_t v45 = 0;
    v46 = &v45;
    uint64_t v47 = 0x3032000000;
    v48 = sub_100007118;
    uint64_t v49 = sub_100007128;
    id v50 = 0;
    uint64_t v39 = 0;
    NSErrorUserInfoKey v40 = &v39;
    uint64_t v41 = 0x3032000000;
    CFStringRef v42 = sub_100007118;
    v43 = sub_100007128;
    id v44 = 0;
    dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
    id v12 = sub_1000055F0(v2, v5, v6, v7, v8, v9, v10, v11);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_100007130;
    v35[3] = &unk_100054820;
    id v37 = &v45;
    uint64_t v38 = &v39;
    uint64_t v13 = v4;
    id v36 = v13;
    [v12 generateTransportKeyForSpecification:1 completion:v35];

    dispatch_time_t v14 = dispatch_time(0, 5000000000);
    if (dispatch_semaphore_wait(v13, v14))
    {
      NSErrorUserInfoKey v53 = NSLocalizedDescriptionKey;
      v54 = off_100066188;
      uint64_t v15 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
      uint64_t v16 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:7 userInfo:v15];

      uint64_t v17 = (void *)v40[5];
      v40[5] = v16;
    }
    else
    {
      uint64_t v18 = v40[5];
      if (!v18) {
        goto LABEL_9;
      }
      v51[0] = NSLocalizedDescriptionKey;
      v51[1] = NSUnderlyingErrorKey;
      v52[0] = @"Key generation error";
      v52[1] = v18;
      uint64_t v17 = +[NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:2];
      uint64_t v19 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:9 userInfo:v17];
      id v20 = (void *)v40[5];
      v40[5] = v19;
    }
    if (v40[5])
    {
      sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSISO18013Handler generateEphemeralDeviceCOSEKey:]", 287, v2, @"error=%@", v21, v22, v40[5]);
      v2 = 0;
      if (a2) {
        *a2 = (id) v40[5];
      }
      goto LABEL_16;
    }
LABEL_9:
    id v23 = objc_alloc((Class)COSEKey);
    id v24 = [v23 initWithData:v46[5]];
    if ([v24 type] == (id)2)
    {
      uint64_t v27 = +[NSData dataWithCOSEKey:v24];
      uint64_t v28 = (void *)v46[5];
      v46[5] = v27;

      sub_100025F04(OS_LOG_TYPE_DEFAULT, 1, (uint64_t)"-[STSISO18013Handler generateEphemeralDeviceCOSEKey:]", 301, v2, @"DeviceKey=%@", v29, v30, (uint64_t)v24);
      v2 = (uint64_t *)(id)v46[5];
    }
    else
    {
      sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSISO18013Handler generateEphemeralDeviceCOSEKey:]", 294, v2, @"Unexpected key type generated, key=%@", v25, v26, (uint64_t)v24);
      if (a2)
      {
        NSErrorUserInfoKey v53 = NSLocalizedDescriptionKey;
        v54 = off_1000661A8;
        v31 = +[NSDictionary dictionaryWithObjects:&v54 forKeys:&v53 count:1];
        v32 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:11 userInfo:v31];

        id v33 = v32;
        v2 = 0;
        *a2 = v33;
      }
      else
      {
        v2 = 0;
      }
    }

LABEL_16:
    _Block_object_dispose(&v39, 8);

    _Block_object_dispose(&v45, 8);
  }

  return v2;
}

void sub_1000070E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100007118(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100007128(uint64_t a1)
{
}

void sub_100007130(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000071CC(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v8 = a3;
  if (a1)
  {
    sub_100025F04(OS_LOG_TYPE_DEFAULT, 1, (uint64_t)"-[STSISO18013Handler processCredentialSelect:callback:]", 313, a1, &stru_100055900, v6, v7, v28);
    if (v5)
    {
      uint64_t v34 = 0;
      v35 = &v34;
      uint64_t v36 = 0x2050000000;
      uint64_t v9 = (void *)qword_100066260;
      uint64_t v37 = qword_100066260;
      if (!qword_100066260)
      {
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_10000958C;
        v33[3] = &unk_1000548E8;
        v33[4] = &v34;
        sub_10000958C((uint64_t)v33);
        uint64_t v9 = (void *)v35[3];
      }
      uint64_t v10 = v9;
      _Block_object_dispose(&v34, 8);
      id v11 = [v10 alloc];
      id v12 = v5[1];
      id v13 = v5[2];
      id v14 = v5[3];
      id WeakRetained = objc_loadWeakRetained(a1 + 2);
      uint64_t v16 = WeakRetained;
      if (WeakRetained) {
        uint64_t v17 = (void *)*((void *)WeakRetained + 5);
      }
      else {
        uint64_t v17 = 0;
      }
      id v18 = v17;
      id v19 = [v11 initWithCredentialIdentifier:v12 elementsToPresent:v13 authData:v14 seAccessEndpoint:v18];

      uint64_t v27 = sub_1000055F0((uint64_t *)a1, v20, v21, v22, v23, v24, v25, v26);
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_100007544;
      v29[3] = &unk_100054898;
      v29[4] = a1;
      id v30 = v8;
      [v27 buildResponseForSelection:v19 completion:v29];
    }
    else
    {
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_10000746C;
      v31[3] = &unk_100054848;
      id v32 = v8;
      sub_100007480((uint64_t *)a1, 20, v31);
      id v19 = v32;
    }
  }
}

void sub_100007454(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000746C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100007480(uint64_t *a1, uint64_t a2, void *a3)
{
  id v12 = a3;
  if (a1)
  {
    id v13 = sub_1000055F0(a1, v5, v6, v7, v8, v9, v10, v11);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000923C;
    v14[3] = &unk_1000548C0;
    v14[4] = a1;
    uint64_t v16 = a2;
    id v15 = v12;
    [v13 buildErrorResponseWithStatus:0 completion:v14];
  }
}

void sub_100007544(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  sub_100025F04(OS_LOG_TYPE_INFO, 1, (uint64_t)"-[STSISO18013Handler processCredentialSelect:callback:]_block_invoke_2", 334, *(void **)(a1 + 32), @"In idvSession:buildResponseForSelection:completion .response = %@ error = %@", v7, v8, (uint64_t)v5);
  if (v6)
  {
    NSErrorUserInfoKey v17 = NSUnderlyingErrorKey;
    id v18 = v6;
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    uint64_t v10 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:10 userInfo:v9];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000076E8;
    v14[3] = &unk_100054870;
    uint64_t v11 = *(uint64_t **)(a1 + 32);
    id v12 = *(id *)(a1 + 40);
    id v15 = v10;
    id v16 = v12;
    id v13 = v10;
    sub_100007480(v11, 20, v14);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t sub_1000076E8(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32));
}

id sub_1000076FC(uint64_t a1)
{
  if (a1)
  {
    id v2 = [objc_alloc((Class)sub_100007880()) initWithRole:0 curve:0 variant:*(void *)(a1 + 24) != 0];
    id v3 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = v2;

    dispatch_semaphore_t v4 = [*(id *)(a1 + 40) publicKey];
    unint64_t v5 = (unint64_t)[v4 length] >> 1;

    id v6 = [*(id *)(a1 + 40) publicKey];
    uint64_t v7 = objc_msgSend(v6, "subdataWithRange:", 0, v5);

    uint64_t v8 = [*(id *)(a1 + 40) publicKey];
    uint64_t v9 = objc_msgSend(v8, "subdataWithRange:", v5, v5);

    id v10 = [objc_alloc((Class)COSEKey) initEC2WithAlgorithm:0 curveIdentifier:1 x:v7 y:v9 d:0 keyOperations:0 keyIdentifier:0];
    uint64_t v11 = +[NSData dataWithCOSEKey:v10];
    id v12 = sub_10000C008(v10);
    sub_100025F04(OS_LOG_TYPE_DEFAULT, 1, (uint64_t)"-[STSISO18013Handler generateEphemeralReaderKey:]", 378, (void *)a1, @"EC2 type ReaderKey=%@", v13, v14, (uint64_t)v12);
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

id sub_100007880()
{
  uint64_t v4 = 0;
  unint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_100066268;
  uint64_t v7 = qword_100066268;
  if (!qword_100066268)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1000095FC;
    v3[3] = &unk_1000548E8;
    v3[4] = &v4;
    sub_1000095FC((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_10000794C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100007964(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = v5;
  if (a1)
  {
    uint64_t v7 = sub_10000C008(v5);
    sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSISO18013Handler generateEphemeralReaderKeyBasedOfDeviceCOSEKey:error:]", 391, (void *)a1, @"deviceCOSEKey=%@", v8, v9, (uint64_t)v7);

    if ([v6 type] == (id)2)
    {
      id v10 = [v6 ecCurveIdentifier];
      unsigned int v11 = [v10 intValue];

      uint64_t v12 = v11 - 1;
      if (v12 >= 3)
      {
        uint64_t v13 = [v6 ecCurveIdentifier];
        sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSISO18013Handler generateEphemeralReaderKeyBasedOfDeviceCOSEKey:error:]", 410, (void *)a1, @"Unsupported EC Curve Identifier %@. ", v14, v15, (uint64_t)v13);
LABEL_18:

        goto LABEL_19;
      }
    }
    else
    {
      if ([v6 type] != (id)1)
      {
        id v18 = [v6 type];
        sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSISO18013Handler generateEphemeralReaderKeyBasedOfDeviceCOSEKey:error:]", 430, (void *)a1, @"Unsupported Curve Identifier with type %d. ", v19, v20, (uint64_t)v18);
LABEL_19:
        NSErrorUserInfoKey v48 = NSLocalizedDescriptionKey;
        uint64_t v49 = off_100066158;
        id v44 = +[NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
        uint64_t v45 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:1 userInfo:v44];

        id v46 = v45;
        a1 = 0;
        *a3 = v46;
        goto LABEL_20;
      }
      id v16 = [v6 okpCurveIdentifier];
      unsigned int v17 = [v16 intValue];

      if (v17 == 4)
      {
        uint64_t v12 = 3;
      }
      else
      {
        if (v17 != 5)
        {
          uint64_t v13 = [v6 okpCurveIdentifier];
          sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSISO18013Handler generateEphemeralReaderKeyBasedOfDeviceCOSEKey:error:]", 425, (void *)a1, @"Unsupported OKP Curve Identifier %@. ", v42, v43, (uint64_t)v13);
          goto LABEL_18;
        }
        uint64_t v12 = 4;
      }
    }
    id v21 = [objc_alloc((Class)sub_100007880()) initWithRole:0 curve:v12 variant:*(void *)(a1 + 24) != 0];
    uint64_t v22 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = v21;

    if ([v6 type] == (id)2)
    {
      uint64_t v23 = [*(id *)(a1 + 40) publicKey];
      unint64_t v24 = (unint64_t)[v23 length] >> 1;

      uint64_t v25 = [*(id *)(a1 + 40) publicKey];
      objc_msgSend(v25, "subdataWithRange:", 0, v24);
      id v26 = (id)objc_claimAutoreleasedReturnValue();

      uint64_t v27 = [*(id *)(a1 + 40) publicKey];
      uint64_t v28 = objc_msgSend(v27, "subdataWithRange:", v24, v24);

      id v29 = objc_alloc((Class)COSEKey);
      id v30 = [v6 ecCurveIdentifier];
      id v31 = objc_msgSend(v29, "initEC2WithAlgorithm:curveIdentifier:x:y:d:keyOperations:keyIdentifier:", 0, (int)objc_msgSend(v30, "intValue"), v26, v28, 0, 0, 0);

      id v32 = sub_10000C008(v31);
      sub_100025F04(OS_LOG_TYPE_DEFAULT, 1, (uint64_t)"-[STSISO18013Handler generateEphemeralReaderKeyBasedOfDeviceCOSEKey:error:]", 453, (void *)a1, @"EC2 type ReaderKey=%@", v33, v34, (uint64_t)v32);

      a1 = +[NSData dataWithCOSEKey:v31];
    }
    else
    {
      if ([v6 type] != (id)1)
      {
        a1 = 0;
        goto LABEL_20;
      }
      id v35 = objc_alloc((Class)COSEKey);
      uint64_t v36 = [v6 okpCurveIdentifier];
      uint64_t v37 = (int)[v36 intValue];
      uint64_t v38 = [*(id *)(a1 + 40) publicKey];
      id v26 = [v35 initOKPWithAlgorithm:0 curveIdentifier:v37 x:v38 d:0 keyOperations:0 keyIdentifier:0];

      uint64_t v39 = sub_10000C008(v26);
      sub_100025F04(OS_LOG_TYPE_DEFAULT, 1, (uint64_t)"-[STSISO18013Handler generateEphemeralReaderKeyBasedOfDeviceCOSEKey:error:]", 462, (void *)a1, @"OKP type ReaderKey=%@", v40, v41, (uint64_t)v39);

      a1 = +[NSData dataWithCOSEKey:v26];
    }
  }
LABEL_20:

  return (id)a1;
}

void sub_100007E08(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = a4;
  if (a1)
  {
    id v10 = sub_10001DF08((uint64_t)ISOSessionData, v7);
    sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSISO18013Handler processMDocResponse:deviceCOSEKey:callback:]", 479, (void *)a1, @"SessionData=%@", v11, v12, (uint64_t)v10);
    unint64_t v13 = sub_10001E1F4(v10);
    if (v13)
    {
      uint64_t v14 = v13;
      id v17 = [objc_alloc((Class)NSNumber) initWithUnsignedInteger:v13];
      if (v14 != 20)
      {
        sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSISO18013Handler processMDocResponse:deviceCOSEKey:callback:]", 489, (void *)a1, @"response contains failure status: %lu", v15, v16, v14);
        sub_100008440((void *)a1, (uint64_t)v7);
        id v18 = (id)objc_claimAutoreleasedReturnValue();
        v9[2](v9, v7, v17, v18, 0);
        goto LABEL_15;
      }
    }
    else
    {
      id v17 = 0;
    }
    if (*(unsigned char *)(a1 + 9))
    {
      id v19 = [objc_alloc((Class)COSEKey) initWithData:v8];
      uint64_t v20 = sub_10000C008(v19);
      sub_100025F04(OS_LOG_TYPE_DEFAULT, 1, (uint64_t)"-[STSISO18013Handler processMDocResponse:deviceCOSEKey:callback:]", 497, (void *)a1, @"DeviceKey=%@", v21, v22, (uint64_t)v20);

      uint64_t v23 = objc_opt_new();
      id v62 = v17;
      if ([v19 type] == (id)2)
      {
        unint64_t v24 = [v19 ecCurveX];
        [v23 appendData:v24];

        [v19 ecCurveY];
      }
      else
      {
        [v19 okpCurveX];
      id v30 = };
      [v23 appendData:v30];

      id v31 = *(void **)(a1 + 40);
      id v65 = 0;
      id v32 = v31;
      unsigned __int8 v33 = [v32 setRemoteKey:v23 error:&v65];
      id v34 = v65;

      if (v33)
      {
        id v60 = v8;
        v61 = v23;
        uint64_t v37 = *(void **)(a1 + 40);
        uint64_t v38 = *(void **)(a1 + 72);
        id v64 = v34;
        id v39 = v38;
        id v40 = v37;
        unsigned __int8 v41 = [v40 deriveSessionKeysFromSessionTranscript:v39 error:&v64];
        id v42 = v64;

        if (v41)
        {
          id v45 = *(id *)(a1 + 40);
          if (v10) {
            id v46 = (void *)v10[1];
          }
          else {
            id v46 = 0;
          }
          id v47 = v46;
          id v63 = v42;
          uint64_t v48 = [v45 decryptData:v47 error:&v63];
          id v49 = v63;

          if (v49)
          {
            sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSISO18013Handler processMDocResponse:deviceCOSEKey:callback:]", 524, (void *)a1, @"error=%@", v50, v51, (uint64_t)v49);
            NSErrorUserInfoKey v66 = NSLocalizedDescriptionKey;
            NSErrorUserInfoKey v67 = off_1000661A0;
            +[NSDictionary dictionaryWithObjects:&v67 forKeys:&v66 count:1];
            v53 = uint64_t v52 = (void *)v48;
            v54 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:10 userInfo:v53];

            v55 = 0;
            id v8 = v60;
            id v17 = v62;
            v56 = v52;
          }
          else
          {
            v55 = sub_100008440((void *)a1, v48);
            v54 = 0;
            v56 = (void *)v48;
            id v8 = v60;
            id v17 = v62;
          }
          ((void (**)(id, id, id, id, void *))v9)[2](v9, v56, v17, v55, v54);

          goto LABEL_27;
        }
        sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSISO18013Handler processMDocResponse:deviceCOSEKey:callback:]", 515, (void *)a1, @"error=%@", v43, v44, (uint64_t)v42);
        NSErrorUserInfoKey v66 = NSLocalizedDescriptionKey;
        NSErrorUserInfoKey v67 = off_1000661A0;
        uint64_t v59 = +[NSDictionary dictionaryWithObjects:&v67 forKeys:&v66 count:1];
        id v58 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:10 userInfo:v59];

        id v34 = v42;
        id v8 = v60;
        uint64_t v23 = v61;
      }
      else
      {
        sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSISO18013Handler processMDocResponse:deviceCOSEKey:callback:]", 509, (void *)a1, @"error=%@", v35, v36, (uint64_t)v34);
        NSErrorUserInfoKey v66 = NSLocalizedDescriptionKey;
        NSErrorUserInfoKey v67 = off_1000661A0;
        v57 = +[NSDictionary dictionaryWithObjects:&v67 forKeys:&v66 count:1];
        id v58 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:10 userInfo:v57];
      }
      ((void (**)(id, id, id, id, void *))v9)[2](v9, 0, 0, 0, v58);

      id v17 = v62;
LABEL_27:

      goto LABEL_28;
    }
    if (v10) {
      uint64_t v25 = (void *)v10[1];
    }
    else {
      uint64_t v25 = 0;
    }
    id v26 = v25;
    sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSISO18013Handler processMDocResponse:deviceCOSEKey:callback:]", 535, (void *)a1, @"Encryption not enabled data: %@", v27, v28, (uint64_t)v26);

    if (v10) {
      id v29 = (void *)v10[1];
    }
    else {
      id v29 = 0;
    }
    id v18 = v29;
    v9[2](v9, v18, 0, 0, 0);
LABEL_15:

    goto LABEL_27;
  }
LABEL_28:
}

id sub_100008440(void *a1, uint64_t a2)
{
  id v3 = +[CBOR decodeFromData:a2];
  uint64_t v6 = v3;
  if (v3)
  {
    id v7 = [v3 dictionary];
    id v8 = +[CBOR cborWithUTF8String:@"version"];
    uint64_t v9 = [v7 objectForKey:v8];

    if (v9
      && [v9 type] == (id)3
      && ([v9 string],
          uint64_t v12 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v13 = [v12 isEqualToString:@"1.0"],
          v12,
          (v13 & 1) != 0))
    {
      uint64_t v14 = [v6 dictionary];
      uint64_t v15 = +[CBOR cborWithUTF8String:@"status"];
      uint64_t v16 = [v14 objectForKey:v15];

      if (v16 && ([v16 isWholeNumber] & 1) != 0)
      {
        id v19 = [v16 numeric];
      }
      else
      {
        sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSISO18013Handler _extractDeviceResponseStatus:]", 874, a1, @"Invalid DeviceResponse status", v17, v18, v21);
        id v19 = 0;
      }
    }
    else
    {
      sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSISO18013Handler _extractDeviceResponseStatus:]", 868, a1, @"Invalid DeviceResponse version", v10, v11, v21);
      id v19 = 0;
    }
  }
  else
  {
    sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSISO18013Handler _extractDeviceResponseStatus:]", 862, a1, @"Decode failure", v4, v5, v21);
    id v19 = 0;
  }

  return v19;
}

id sub_100008610(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a2;
  id v9 = [objc_alloc((Class)COSEKey) initWithData:v8];

  if ([v9 type] == (id)2 || objc_msgSend(v9, "type") == (id)1)
  {
    uint64_t v10 = objc_opt_new();
    if ([v9 type] == (id)2)
    {
      uint64_t v11 = [v9 ecCurveX];
      [v10 appendData:v11];

      [v9 ecCurveY];
    }
    else
    {
      [v9 okpCurveX];
    uint64_t v12 = };
    [v10 appendData:v12];

    unsigned __int8 v13 = (void *)a1[5];
    id v46 = 0;
    id v14 = v13;
    unsigned __int8 v15 = [v14 setRemoteKey:v10 error:&v46];
    id v16 = v46;

    if (v15)
    {
      id v19 = (void *)a1[5];
      uint64_t v20 = (void *)a1[9];
      id v45 = v16;
      id v21 = v20;
      id v22 = v19;
      unsigned __int8 v23 = [v22 deriveSessionKeysFromSessionTranscript:v21 error:&v45];
      id v24 = v45;

      if (v23)
      {
        uint64_t v27 = (void *)a1[5];
        id v44 = v24;
        id v28 = v27;
        id v29 = [v28 encryptData:v7 error:&v44];
        id v30 = v44;

        id v31 = v29;
        *a4 = v31;
        if (v30)
        {
          sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSISO18013Handler _encryptWithDeviceCOSEKey:inputData:encryptedData:]", 573, a1, @"error=%@", v32, v33, (uint64_t)v30);
          NSErrorUserInfoKey v47 = NSLocalizedDescriptionKey;
          uint64_t v48 = off_1000661A0;
          id v34 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
          uint64_t v35 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:10 userInfo:v34];
        }
        else
        {
          uint64_t v35 = 0;
        }
        id v16 = v35;
        uint64_t v37 = v16;
      }
      else
      {
        sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSISO18013Handler _encryptWithDeviceCOSEKey:inputData:encryptedData:]", 567, a1, @"error=%@", v25, v26, (uint64_t)v24);
        NSErrorUserInfoKey v47 = NSLocalizedDescriptionKey;
        uint64_t v48 = off_1000661A0;
        id v42 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
        uint64_t v37 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:10 userInfo:v42];

        id v16 = v24;
      }
    }
    else
    {
      sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSISO18013Handler _encryptWithDeviceCOSEKey:inputData:encryptedData:]", 563, a1, @"error=%@", v17, v18, (uint64_t)v16);
      NSErrorUserInfoKey v47 = NSLocalizedDescriptionKey;
      uint64_t v48 = off_1000661A0;
      uint64_t v36 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
      uint64_t v37 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:10 userInfo:v36];
    }
  }
  else
  {
    id v38 = [v9 type];
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSISO18013Handler _encryptWithDeviceCOSEKey:inputData:encryptedData:]", 547, a1, @"Unsupported key type=%d", v39, v40, (uint64_t)v38);
    NSErrorUserInfoKey v47 = NSLocalizedDescriptionKey;
    uint64_t v48 = off_1000661A0;
    unsigned __int8 v41 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    uint64_t v37 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:10 userInfo:v41];
  }

  return v37;
}

void sub_100008AD8(unsigned char *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = a5;
  if (a1)
  {
    if (![v10 length] || !objc_msgSend(v11, "length"))
    {
      sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSISO18013Handler generateSessionEstablishment:readerCOSEKey:deviceCOSEKey:callback:]", 591, a1, @"Missing required keys", v13, v14, v27);
      NSErrorUserInfoKey v29 = NSLocalizedDescriptionKey;
      id v30 = off_100066178;
      id v21 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      id v20 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:5 userInfo:v21];

      v12[2](v12, 0, v20);
LABEL_14:

      goto LABEL_15;
    }
    id v15 = sub_100006060(a1, v10);
    id v18 = [objc_alloc((Class)COSEKey) initWithData:v10];
    if (a1[9])
    {
      id v28 = 0;
      id v19 = sub_100008610(a1, v11, v9, &v28);
      id v20 = v28;
      if (v19) {
        goto LABEL_12;
      }
    }
    else
    {
      sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSISO18013Handler generateSessionEstablishment:readerCOSEKey:deviceCOSEKey:callback:]", 604, a1, @"Session encryption disabled", v16, v17, v27);
      id v20 = v9;
    }
    if ([v20 length])
    {
      id v22 = sub_10001DBA4((id *)[ISOSessionEstablishment alloc], v18, v20);
      unsigned __int8 v23 = [v22 description];
      sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSISO18013Handler generateSessionEstablishment:readerCOSEKey:deviceCOSEKey:callback:]", 612, a1, @"ISOSessionEstablishment=%@", v24, v25, (uint64_t)v23);

      uint64_t v26 = sub_10001DEB0((uint64_t)NSData, v22);

      id v19 = 0;
LABEL_13:
      ((void (**)(id, void *, id))v12)[2](v12, v26, v19);

      goto LABEL_14;
    }
    id v19 = 0;
LABEL_12:
    uint64_t v26 = 0;
    goto LABEL_13;
  }
LABEL_15:
}

void sub_100008DA0(unsigned char *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = a5;
  if (a1)
  {
    if (![v11 length])
    {
      sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSISO18013Handler generateSessionData:status:deviceCOSEKey:callback:]", 630, a1, @"Missing required keys", v13, v14, (uint64_t)v22);
      NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
      uint64_t v24 = off_100066178;
      id v19 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
      id v16 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:5 userInfo:v19];

      v12[2](v12, 0, v16);
LABEL_18:

      goto LABEL_19;
    }
    if (a1[9] && [v9 length])
    {
      id v22 = 0;
      id v15 = sub_100008610(a1, v11, v9, &v22);
      id v16 = v22;
      if (v15) {
        goto LABEL_11;
      }
    }
    else
    {
      id v16 = v9;
    }
    id v17 = [v16 length];
    if (v10 || v17)
    {
      if (v10) {
        id v20 = [v10 unsignedIntegerValue];
      }
      else {
        id v20 = 0;
      }
      id v21 = sub_10001E150([ISOSessionData alloc], v16, (uint64_t)v20);
      id v18 = sub_10001E570((uint64_t)NSData, v21);

      id v15 = 0;
      goto LABEL_17;
    }
    id v15 = 0;
LABEL_11:
    id v18 = 0;
LABEL_17:
    ((void (**)(id, void *, id))v12)[2](v12, v18, v15);

    goto LABEL_18;
  }
LABEL_19:
}

void sub_100008FF0(uint64_t a1)
{
  if (a1)
  {
    id v2 = *(void **)(a1 + 32);
    *(void *)(a1 + 32) = 0;

    objc_storeWeak((id *)(a1 + 48), 0);
    objc_storeWeak((id *)(a1 + 64), 0);
    objc_storeWeak((id *)(a1 + 56), 0);
    id v3 = *(void **)(a1 + 72);
    *(void *)(a1 + 72) = 0;

    uint64_t v4 = *(void **)(a1 + 96);
    *(void *)(a1 + 96) = 0;

    *(unsigned char *)(a1 + 10) = 0;
  }
}

void sub_100009064(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = a1;
  id v18 = a2;
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v20;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v11, "intentToRetain", v17) == (id)1)
        {
          __int16 v12 = 1;
        }
        else if ([v11 intentToRetain] == (id)2)
        {
          __int16 v12 = 2;
        }
        else if ([v11 intentToRetain] == (id)3)
        {
          __int16 v12 = 3;
        }
        else
        {
          __int16 v12 = 0;
        }
        uint64_t v13 = [ISO18013RequestElement alloc];
        uint64_t v14 = [v11 elementIdentifier];
        id v15 = sub_10000F068(v13, v14, v12);

        [v5 addObject:v15];
      }
      id v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  id v16 = [v5 copy];
  [*(id *)(v17 + 32) setObject:v16 forKeyedSubscript:v18];
}

void sub_10000923C(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  if (a3) {
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSISO18013Handler generateSessionDataErrorResponse:completion:]_block_invoke", 842, *(void **)(a1 + 32), @"Error in building DeviceResponse: %@", v5, v6, a3);
  }
  id v7 = sub_10001E150([ISOSessionData alloc], v9, *(void *)(a1 + 48));
  id v8 = sub_10001E570((uint64_t)NSData, v7);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10000939C(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("DCPresentmentRequest");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100066250 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    abort_report_np();
    sub_10000940C();
  }
}

void sub_10000940C()
{
  v1[0] = 0;
  if (!qword_100066258)
  {
    v1[1] = _NSConcreteStackBlock;
    v1[2] = 3221225472;
    v1[3] = sub_100009518;
    v1[4] = &unk_100054920;
    v1[5] = v1;
    long long v2 = off_100054908;
    uint64_t v3 = 0;
    qword_100066258 = _sl_dlopen();
    v0 = (void *)v1[0];
    if (qword_100066258)
    {
      if (!v1[0]) {
        return;
      }
    }
    else
    {
      v0 = (void *)abort_report_np();
    }
    free(v0);
  }
}

uint64_t sub_100009518()
{
  uint64_t result = _sl_dlopen();
  qword_100066258 = result;
  return result;
}

Class sub_10000958C(uint64_t a1)
{
  sub_10000940C();
  Class result = objc_getClass("DCPresentmentSelection");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100066260 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return sub_1000095FC(v3);
  }
  return result;
}

Class sub_1000095FC(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_100066270)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_100009750;
    v4[4] = &unk_100054920;
    v4[5] = v4;
    long long v5 = off_100054940;
    uint64_t v6 = 0;
    qword_100066270 = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!qword_100066270)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("CIDCSessionCryptarch");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)abort_report_np();
LABEL_8:
    free(v2);
  }
  qword_100066268 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100009750()
{
  uint64_t result = _sl_dlopen();
  qword_100066270 = result;
  return result;
}

Class sub_1000097C4(uint64_t a1)
{
  sub_10000940C();
  Class result = objc_getClass("DCPresentmentSessionOptions");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100066278 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)sub_100009834(v3);
  }
  return result;
}

Class sub_100009834(uint64_t a1)
{
  sub_10000940C();
  Class result = objc_getClass("DCPresentmentSession");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100066280 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = abort_report_np();
    return (Class)sub_1000098A4(v3);
  }
  return result;
}

unsigned char *sub_1000098A4(unsigned char *result, char a2)
{
  if (result)
  {
    v3.receiver = result;
    v3.super_class = (Class)ReaderPeripheral;
    Class result = objc_msgSendSuper2(&v3, "initWithWorkQueue:callbackQueue:");
    if (result) {
      result[136] = a2;
    }
  }
  return result;
}

id sub_100009900(id result, uint64_t a2)
{
  if (result)
  {
    v2.receiver = result;
    v2.super_class = (Class)ReaderPeripheral;
    return objc_msgSendSuper2(&v2, "writeData:toUUID:", a2, @"00000007-A123-48CE-896B-4C76973373E6");
  }
  return result;
}

void *sub_10000AD48()
{
  self;
  v0 = [ISOKey alloc];
  if (!v0) {
    goto LABEL_5;
  }
  v10.receiver = v0;
  v10.super_class = (Class)ISOKey;
  id v1 = objc_msgSendSuper2(&v10, "init");
  if (!v1) {
    goto LABEL_7;
  }
  ccrng();
  objc_super v2 = (void *)ccec_cp_256();
  id v3 = [objc_alloc((Class)NSMutableData) initWithLength:(32 * *v2) | 0x10];
  id v4 = [v3 mutableBytes];
  v1[3] = v4;
  void *v4 = v2;
  uint64_t key = ccec_generate_key();
  if (key)
  {
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISOKey initWithRandomEC]", 72, v1, @"Random key generaiton error: %d", v6, v7, key);

LABEL_5:
    id v1 = 0;
    goto LABEL_7;
  }
  id v8 = (void *)v1[2];
  v1[1] = 0;
  v1[2] = v3;

  *((unsigned char *)v1 + 32) = 1;
LABEL_7:

  return v1;
}

id sub_10000AE6C(id a1, void *a2)
{
  id v3 = a2;
  uint64_t v6 = v3;
  if (a1)
  {
    if (!v3)
    {
      uint64_t v13 = @"Invalid X963 key input";
      uint64_t v14 = 205;
      goto LABEL_10;
    }
    v17.receiver = a1;
    v17.super_class = (Class)ISOKey;
    a1 = objc_msgSendSuper2(&v17, "init");
    if (a1)
    {
      uint64_t v7 = (char *)[v6 length] - 1;
      id v8 = (void *)ccec_cp_256();
      if (v7 == (char *)(16 * *v8)
        || (id v8 = (void *)ccec_cp_384(), v7 == (char *)(16 * *v8))
        || (id v8 = (void *)ccec_cp_521(), v7 == (char *)(16 * *v8)))
      {
        id v9 = [objc_alloc((Class)NSMutableData) initWithLength:24 * *v8 + 16];
        objc_super v10 = [v9 mutableBytes];
        *((void *)a1 + 3) = v10;
        void *v10 = v8;
        [v6 length];
        [v6 bytes];
        if (!ccec_x963_import_pub())
        {
          id v16 = (void *)*((void *)a1 + 2);
          *((void *)a1 + 1) = 0;
          *((void *)a1 + 2) = v9;

          *((unsigned char *)a1 + 32) = 0;
          goto LABEL_12;
        }
        sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISOKey initWithECPublicKeyX963:]", 235, a1, @"Key import error: x963 EC key not supported", v11, v12, (uint64_t)v17.receiver);

        goto LABEL_11;
      }
      uint64_t v13 = @"Key import error: x963 EC key not supported";
      uint64_t v14 = 220;
LABEL_10:
      sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISOKey initWithECPublicKeyX963:]", v14, a1, v13, v4, v5, (uint64_t)v17.receiver);
LABEL_11:

      a1 = 0;
    }
  }
LABEL_12:

  return a1;
}

CFDataRef sub_10000B01C(uint64_t a1)
{
  if (!a1) {
    goto LABEL_7;
  }
  uint64_t v2 = *(void *)(a1 + 8);
  if (v2 == 2)
  {
    CFErrorRef error = 0;
    CFDataRef v3 = SecKeyCopyExternalRepresentation(*(SecKeyRef *)(a1 + 16), &error);
    CFDataRef v6 = v3;
    if (error)
    {
      sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISOKey publicKey]", 335, (void *)a1, @"publicKey error: %@", v4, v5, (uint64_t)error);
      CFRelease(error);
      CFDataRef v7 = 0;
    }
    else
    {
      CFDataRef v7 = v3;
    }

    goto LABEL_12;
  }
  if (v2)
  {
LABEL_7:
    CFDataRef v7 = 0;
  }
  else
  {
    CFDataRef v7 = (const __CFData *)[objc_alloc((Class)NSMutableData) initWithLength:((unint64_t)(cczp_bitlen() + 7) >> 2) | 1];
    [(__CFData *)v7 mutableBytes];
    ccec_export_pub();
    if (!v7) {
      sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISOKey publicKey]", 324, (void *)a1, @"Fail to get public key", v8, v9, v11);
    }
  }
LABEL_12:

  return v7;
}

id sub_10000B190(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = a2;
  self;
  if (a3 == 2)
  {
    id v7 = v4;
    CC_SHA512([v7 bytes], (CC_LONG)objc_msgSend(v7, "length"), md);
    uint64_t v6 = 64;
  }
  else if (a3 == 1)
  {
    id v8 = v4;
    CC_SHA384([v8 bytes], (CC_LONG)objc_msgSend(v8, "length"), md);
    uint64_t v6 = 48;
  }
  else
  {
    if (!a3)
    {
      id v5 = v4;
      CC_SHA256([v5 bytes], (CC_LONG)objc_msgSend(v5, "length"), md);
    }
    uint64_t v6 = 32;
  }
  uint64_t v9 = +[NSData dataWithBytes:md length:v6];

  return v9;
}

void *sub_10000B2DC(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = a3;
  self;
  if (v7)
  {
    uint64_t v9 = v7[1];
    switch(v9)
    {
      case 2:
        if (a5)
        {
          long long v22 = off_1000661E8;
          NSErrorUserInfoKey v41 = NSLocalizedFailureReasonErrorKey;
          CFStringRef v42 = @"Not implemented";
          NSErrorUserInfoKey v23 = &v42;
          uint64_t v24 = &v41;
LABEL_19:
          uint64_t v25 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v24 count:1];
          *a5 = +[NSError errorWithDomain:v22 code:2 userInfo:v25];

          goto LABEL_20;
        }
        break;
      case 1:
LABEL_20:
        id v15 = 0;
        goto LABEL_21;
      case 0:
        goto LABEL_5;
      default:
        if (a5)
        {
          long long v22 = off_1000661E8;
          NSErrorUserInfoKey v39 = NSLocalizedFailureReasonErrorKey;
          CFStringRef v40 = @"Compute shared secret failure: Invalid key type";
          NSErrorUserInfoKey v23 = &v40;
          uint64_t v24 = &v39;
          goto LABEL_19;
        }
        break;
    }
    id v15 = 0;
    goto LABEL_23;
  }
LABEL_5:
  if (!v8 || v8[1] || (id v16 = (void *)v8[3]) == 0)
  {
    objc_super v10 = sub_10000B01C((uint64_t)v8);
    uint64_t v11 = (char *)[v10 length] - 1;
    uint64_t v12 = (void *)ccec_cp_256();
    uint64_t v13 = *v12;
    if (v11 == (char *)(24 * *v12)
      || (uint64_t v12 = (void *)ccec_cp_384(), v13 = *v12, v11 == (char *)(24 * *v12))
      || (uint64_t v12 = (void *)ccec_cp_521(), v13 = *v12, v11 == (char *)(24 * *v12)))
    {
      uint64_t v14 = v12;
      id v15 = [objc_alloc((Class)NSMutableData) initWithLength:(32 * v13) | 0x10];
      id v16 = [v15 mutableBytes];
      *id v16 = v14;
      [v10 length];
      id v17 = v10;
      [v17 bytes];
      if (!ccec_import_pub())
      {

        goto LABEL_29;
      }
      if (!a5) {
        goto LABEL_14;
      }
      id v18 = off_1000661E8;
      NSErrorUserInfoKey v47 = NSLocalizedFailureReasonErrorKey;
      long long v19 = +[NSString stringWithFormat:@"Compute shared secret failure: fail to read public key"];
      uint64_t v48 = v19;
      long long v20 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
      long long v21 = +[NSError errorWithDomain:v18 code:2 userInfo:v20];
    }
    else
    {
      if (!a5)
      {
        id v15 = 0;
        goto LABEL_14;
      }
      uint64_t v37 = off_1000661E8;
      NSErrorUserInfoKey v49 = NSLocalizedFailureReasonErrorKey;
      long long v19 = +[NSString stringWithFormat:@"Compute shared secret failure: fail to read public key"];
      uint64_t v50 = v19;
      long long v20 = +[NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];
      long long v21 = +[NSError errorWithDomain:v37 code:2 userInfo:v20];
      id v15 = 0;
    }
    *a5 = v21;

LABEL_14:
LABEL_21:
    a5 = 0;
    goto LABEL_23;
  }
  id v15 = 0;
LABEL_29:
  if (v7 && !v7[1]) {
    uint64_t v27 = (void *)v7[3];
  }
  else {
    uint64_t v27 = 0;
  }
  if (*v16 == *v27)
  {
    uint64_t v38 = 8 * *(void *)*v16;
    id v31 = [objc_alloc((Class)NSMutableData) initWithLength:v38];
    ccrng();
    id v32 = v31;
    [v32 mutableBytes];
    uint64_t v33 = ccecdh_compute_shared_secret();
    if (v33)
    {
      if (a5)
      {
        id v34 = off_1000661E8;
        NSErrorUserInfoKey v43 = NSLocalizedFailureReasonErrorKey;
        uint64_t v35 = +[NSString stringWithFormat:@"Compute shared secret failure: %d", v33];
        id v44 = v35;
        uint64_t v36 = +[NSDictionary dictionaryWithObjects:&v44 forKeys:&v43 count:1];
        *a5 = +[NSError errorWithDomain:v34 code:2 userInfo:v36];

        a5 = 0;
      }
    }
    else
    {
      a5 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", [v32 bytes], v38);
    }
  }
  else if (a5)
  {
    id v28 = off_1000661E8;
    NSErrorUserInfoKey v45 = NSLocalizedFailureReasonErrorKey;
    NSErrorUserInfoKey v29 = +[NSString stringWithFormat:@"Compute shared secret failure: curve point mismatch"];
    id v46 = v29;
    id v30 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    *a5 = +[NSError errorWithDomain:v28 code:2 userInfo:v30];

    goto LABEL_21;
  }
LABEL_23:

  return a5;
}

void *sub_10000B850(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8 = a2;
  id v9 = a3;
  self;
  if (a4 == 2)
  {
    uint64_t v10 = 64;
    ccsha512_di();
  }
  else if (a4 == 1)
  {
    uint64_t v10 = 48;
    ccsha384_di();
  }
  else
  {
    if (a4)
    {
      if (!a5) {
        goto LABEL_15;
      }
      id v17 = off_1000661E8;
      NSErrorUserInfoKey v21 = NSLocalizedFailureReasonErrorKey;
      id v12 = +[NSString stringWithFormat:@"x963 KDF failure: invalid algorithm - %ld", a4];
      id v22 = v12;
      id v15 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      *a5 = +[NSError errorWithDomain:v17 code:2 userInfo:v15];
      goto LABEL_13;
    }
    uint64_t v10 = 64;
    ccsha256_di();
  }
  id v11 = [objc_alloc((Class)NSMutableData) initWithLength:v10];
  [v8 length];
  [v8 bytes];
  [v9 length];
  [v9 bytes];
  id v12 = v11;
  [v12 mutableBytes];
  uint64_t v13 = ccansikdf_x963();
  if (v13)
  {
    if (a5)
    {
      uint64_t v14 = off_1000661E8;
      id v15 = +[NSString stringWithFormat:@"x963 KDF failure: %d", v13, NSLocalizedFailureReasonErrorKey];
      long long v20 = v15;
      id v16 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
      *a5 = +[NSError errorWithDomain:v14 code:2 userInfo:v16];

LABEL_13:
      a5 = 0;
    }
  }
  else
  {
    a5 = +[NSData dataWithData:v12];
  }

LABEL_15:

  return a5;
}

void *sub_10000BB00(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v12 = a2;
  id v13 = a3;
  id v14 = a4;
  self;
  switch(a5)
  {
    case 2:
      uint64_t v24 = a7;
      ccsha512_di();
      goto LABEL_7;
    case 1:
      uint64_t v24 = a7;
      ccsha384_di();
      goto LABEL_7;
    case 0:
      uint64_t v24 = a7;
      ccsha256_di();
LABEL_7:
      id v15 = [objc_alloc((Class)NSMutableData) initWithLength:a6];
      [v12 length];
      [v12 bytes];
      [v13 length];
      id v25 = v13;
      [v13 bytes];
      [v14 length];
      [v14 bytes];
      id v16 = v15;
      [v16 mutableBytes];
      uint64_t v17 = cchkdf();
      if (v17)
      {
        if (v24)
        {
          id v18 = off_1000661E8;
          NSErrorUserInfoKey v26 = NSLocalizedFailureReasonErrorKey;
          uint64_t v19 = +[NSString stringWithFormat:@"HKDF failure: %d", v17];
          uint64_t v27 = v19;
          long long v20 = +[NSDictionary dictionaryWithObjects:&v27 forKeys:&v26 count:1];
          *uint64_t v24 = +[NSError errorWithDomain:v18 code:3 userInfo:v20];
        }
        a7 = 0;
      }
      else
      {
        id v16 = v16;
        a7 = v16;
      }
      id v13 = v25;
      goto LABEL_13;
  }
  if (a7)
  {
    id v22 = off_1000661E8;
    NSErrorUserInfoKey v28 = NSLocalizedFailureReasonErrorKey;
    id v16 = +[NSString stringWithFormat:@"HKDF failure: invalid algorithm - %ld", a5];
    id v29 = v16;
    NSErrorUserInfoKey v23 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    *a7 = +[NSError errorWithDomain:v22 code:2 userInfo:v23];

    a7 = 0;
LABEL_13:
  }

  return a7;
}

id sub_10000C008(id a1)
{
  id v1 = a1;
  if (a1)
  {
    uint64_t v2 = objc_opt_new();
    int has_internal_ui = os_variant_has_internal_ui();
    id v4 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.sts"];
    unsigned int v5 = [v4 BOOLForKey:@"debug.log-crypto-params"];
    switch((unint64_t)[v1 type])
    {
      case 0uLL:
        CFStringRef v6 = @"Reserved";
        goto LABEL_15;
      case 1uLL:
        [v2 setObject:@"OKP" forKeyedSubscript:@"KTYType"];
        id v7 = [v1 okpCurveIdentifier];

        if (v7)
        {
          id v8 = [v1 okpCurveIdentifier];
          [v2 setObject:v8 forKeyedSubscript:@"okpCurveIdentifier"];
        }
        id v9 = [v1 okpCurveX];

        if (v9)
        {
          if ((has_internal_ui & v5) == 1)
          {
            uint64_t v10 = [v1 okpCurveX];
            id v11 = [v10 debugDescription];
          }
          else
          {
            id v21 = objc_alloc((Class)NSString);
            uint64_t v10 = [v1 okpCurveX];
            id v11 = [v21 initWithFormat:@"REDACTED, size=%lu", objc_msgSend(v10, "length")];
          }
          id v22 = v11;
          [v2 setObject:v11 forKeyedSubscript:@"okpCurveX"];
        }
        NSErrorUserInfoKey v23 = [v1 okpCurveD];

        if (!v23) {
          goto LABEL_39;
        }
        if ((has_internal_ui & v5) == 1)
        {
          id v18 = [v1 okpCurveD];
          uint64_t v19 = [v18 debugDescription];
          CFStringRef v20 = @"okpCurveD";
          goto LABEL_36;
        }
        id v33 = objc_alloc((Class)NSString);
        id v30 = [v1 okpCurveD];
        id v31 = [v33 initWithFormat:@"REDACTED, size=%lu", objc_msgSend(v30, "length")];
        CFStringRef v32 = @"okpCurveD";
        goto LABEL_38;
      case 2uLL:
        [v2 setObject:@"EC2" forKeyedSubscript:@"KTYType"];
        id v12 = [v1 ecCurveIdentifier];

        if (v12)
        {
          id v13 = [v1 ecCurveIdentifier];
          [v2 setObject:v13 forKeyedSubscript:@"ecCurveIdentifier"];
        }
        id v14 = [v1 ecCurveX];

        if (v14)
        {
          if ((has_internal_ui & v5) == 1)
          {
            id v15 = [v1 ecCurveX];
            id v16 = [v15 debugDescription];
          }
          else
          {
            id v24 = objc_alloc((Class)NSString);
            id v15 = [v1 ecCurveX];
            id v16 = [v24 initWithFormat:@"REDACTED, size=%lu", objc_msgSend(v15, "length")];
          }
          id v25 = v16;
          [v2 setObject:v16 forKeyedSubscript:@"ecCurveX"];
        }
        NSErrorUserInfoKey v26 = [v1 ecCurveY];

        if (v26)
        {
          if ((has_internal_ui & v5) == 1)
          {
            uint64_t v27 = [v1 ecCurveY];
            id v28 = [v27 debugDescription];
          }
          else
          {
            id v34 = objc_alloc((Class)NSString);
            uint64_t v27 = [v1 ecCurveY];
            id v28 = [v34 initWithFormat:@"REDACTED, size=%lu", objc_msgSend(v27, "length")];
          }
          uint64_t v35 = v28;
          [v2 setObject:v28 forKeyedSubscript:@"ecCurveY"];
        }
        uint64_t v36 = [v1 ecCurveD];

        if (!v36) {
          goto LABEL_39;
        }
        if ((has_internal_ui & v5) == 1)
        {
          id v18 = [v1 ecCurveD];
          uint64_t v19 = [v18 debugDescription];
          CFStringRef v20 = @"ecCurveD";
          goto LABEL_36;
        }
        id v37 = objc_alloc((Class)NSString);
        id v30 = [v1 ecCurveD];
        id v31 = [v37 initWithFormat:@"REDACTED, size=%lu", objc_msgSend(v30, "length")];
        CFStringRef v32 = @"ecCurveD";
        goto LABEL_38;
      case 3uLL:
        CFStringRef v6 = @"RSA";
LABEL_15:
        [v2 setObject:v6 forKeyedSubscript:@"KTYType"];
        goto LABEL_39;
      case 4uLL:
        [v2 setObject:@"Symmetric" forKeyedSubscript:@"KTYType"];
        uint64_t v17 = [v1 symmetricKey];

        if (!v17) {
          goto LABEL_39;
        }
        if ((has_internal_ui & v5) == 1)
        {
          id v18 = [v1 symmetricKey];
          uint64_t v19 = [v18 debugDescription];
          CFStringRef v20 = @"symmetricKey";
LABEL_36:
          [v2 setObject:v19 forKeyedSubscript:v20];
        }
        else
        {
          id v29 = objc_alloc((Class)NSString);
          id v30 = [v1 symmetricKey];
          id v31 = [v29 initWithFormat:@"REDACTED, size=%lu", objc_msgSend(v30, "length")];
          CFStringRef v32 = @"symmetricKey";
LABEL_38:
          [v2 setObject:v31 forKeyedSubscript:v32];
        }
LABEL_39:
        uint64_t v38 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v1 algorithm]);
        [v2 setObject:v38 forKeyedSubscript:@"algo"];

        NSErrorUserInfoKey v39 = [v1 identifier];

        if (v39)
        {
          CFStringRef v40 = [v1 identifier];
          NSErrorUserInfoKey v41 = [v40 debugDescription];
          [v2 setObject:v41 forKeyedSubscript:@"identifier"];
        }
        CFStringRef v42 = [v1 operations];
        id v43 = [v42 count];

        if (v43)
        {
          id v44 = [v1 operations];
          [v2 setObject:v44 forKeyedSubscript:@"operations"];
        }
        NSErrorUserInfoKey v45 = [v1 baseInitializationVector];

        if (v45)
        {
          id v46 = [v1 baseInitializationVector];
          NSErrorUserInfoKey v47 = [v46 debugDescription];
          [v2 setObject:v47 forKeyedSubscript:@"baseInitializationVector"];
        }
        id v1 = [v2 debugDescription];

        break;
      default:
        goto LABEL_39;
    }
  }

  return v1;
}

STSCHWiFiAwareSecurityInfo *sub_10000C6C8(void *a1, void *a2, char a3)
{
  id v5 = a2;
  CFStringRef v6 = v5;
  if (!a1) {
    goto LABEL_12;
  }
  id v7 = [v5 cipherSuite];
  id v8 = [v7 count];

  if (!v8) {
    goto LABEL_12;
  }
  char v59 = a3;
  id v9 = 0;
  unint64_t v10 = 0;
  do
  {
    id v11 = [v6 cipherSuite];
    id v12 = [v11 objectAtIndexedSubscript:v10];
    if ([v12 integerValue] == (id)3)
    {
      id v13 = [v6 dhInfo];
      id v14 = [v13 objectAtIndexedSubscript:v10];
      id v15 = [v14 publicKeyGroup];

      if (v15 != (id)19) {
        goto LABEL_8;
      }
      sub_100025F04(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[ISOKey(WifiSecurity) generateInfoWithPeerSecurityInfo:nanPublisher:]", 1190, a1, @"Found NCS_PK_2WDH_128 with matching key group %lu", v16, v17, 19);
      id v11 = [v6 dhInfo];
      [v11 objectAtIndexedSubscript:v10];
      id v9 = v12 = v9;
    }

LABEL_8:
    ++v10;
    id v18 = [v6 cipherSuite];
    id v19 = [v18 count];
  }
  while (v10 < (unint64_t)v19);
  if (!v9)
  {
LABEL_12:
    id v29 = 0;
    goto LABEL_28;
  }
  CFStringRef v20 = [ISOKey alloc];
  id v21 = [v9 publicKey];
  id v22 = sub_10000AE6C(v20, v21);

  id v64 = 0;
  id v24 = sub_10000B2DC((uint64_t)ISOKey, a1, v22, v23, &v64);
  id v25 = v64;
  if (v25)
  {
    id v28 = v25;
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISOKey(WifiSecurity) generateInfoWithPeerSecurityInfo:nanPublisher:]", 1205, a1, @"Share secret compute failed: %@", v26, v27, (uint64_t)v25);
    id v29 = 0;
  }
  else
  {
    id v63 = 0;
    id v30 = sub_10000B850((uint64_t)ISOKey, v24, 0, 0, &v63);
    id v31 = v63;
    if (v31)
    {
      id v28 = v31;
      sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISOKey(WifiSecurity) generateInfoWithPeerSecurityInfo:nanPublisher:]", 1214, a1, @"Sym key hash generation failed: %@", v32, v33, (uint64_t)v31);
      id v29 = 0;
    }
    else
    {
      id v58 = v30;
      id v34 = [@"OWE Key Generation" dataUsingEncoding:4];
      id v35 = objc_alloc((Class)NSMutableData);
      if (v59)
      {
        uint64_t v36 = sub_10000B01C((uint64_t)a1);
        id v37 = [v35 initWithData:v36];

        uint64_t v38 = a1;
        uint64_t v39 = (uint64_t)v22;
      }
      else
      {
        CFStringRef v40 = sub_10000B01C((uint64_t)v22);
        id v37 = [v35 initWithData:v40];

        uint64_t v38 = a1;
        uint64_t v39 = (uint64_t)a1;
      }
      NSErrorUserInfoKey v41 = sub_10000B01C(v39);
      [v37 appendData:v41];

      v62[0] = [v9 publicKeyGroup];
      v62[1] = (unsigned __int16)[v9 publicKeyGroup] >> 8;
      [v37 appendBytes:v62 length:2];
      id v61 = 0;
      id v30 = v58;
      v57 = v34;
      CFStringRef v42 = sub_10000BB00((uint64_t)ISOKey, v58, v37, v34, 0, 32, &v61);
      id v43 = v61;
      id v28 = v43;
      if (v43 || !v42)
      {
        sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISOKey(WifiSecurity) generateInfoWithPeerSecurityInfo:nanPublisher:]", 1235, v38, @"HKDF error: %@", v44, v45, (uint64_t)v43);
        id v29 = 0;
      }
      else
      {
        v56 = v42;
        id v46 = objc_alloc((Class)NSMutableData);
        if (v59)
        {
          NSErrorUserInfoKey v47 = sub_10000B01C((uint64_t)v38);
          id v48 = [v46 initWithData:v47];

          uint64_t v49 = (uint64_t)v22;
        }
        else
        {
          sub_10000B01C((uint64_t)v22);
          v51 = uint64_t v50 = (uint64_t)v38;
          id v48 = [v46 initWithData:v51];

          uint64_t v49 = v50;
        }
        uint64_t v52 = sub_10000B01C(v49);
        [v48 appendData:v52];
        id v60 = v48;

        NSErrorUserInfoKey v53 = sub_10000B190((uint64_t)ISOKey, v48, 0);
        v54 = objc_msgSend(v53, "subdataWithRange:", 0, 16);
        id v29 = [[STSCHWiFiAwareSecurityInfo alloc] initWithPMK:v56 pmkID:v54];

        CFStringRef v42 = v56;
        id v30 = v58;
      }
    }
  }

LABEL_28:

  return v29;
}

id *sub_10000CBC8(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (!a1) {
    goto LABEL_5;
  }
  v25.receiver = a1;
  v25.super_class = (Class)STSXPClientNotification;
  unint64_t v10 = (id *)objc_msgSendSuper2(&v25, "init");
  a1 = v10;
  if (!v10) {
    goto LABEL_4;
  }
  objc_storeWeak(v10 + 3, v8);
  objc_storeStrong(a1 + 7, a4);
  *((_DWORD *)a1 + 3) = 0;
  id v11 = v7;
  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSXPClientNotification setupConnectWithXPCServiceEndpoint:]", 336, a1, @"Connect to handover notification listener", v12, v13, v24);
  id v14 = [objc_alloc((Class)NSXPCConnection) initWithListenerEndpoint:v11];
  id v15 = a1[8];
  a1[8] = v14;

  uint64_t v16 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___STSXPCClientNotificationListenerProtocol];
  uint64_t v17 = objc_opt_class();
  id v18 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v17, objc_opt_class(), 0);
  [v16 setClasses:v18 forSelector:"processCredentialRequestList:readerAuthInfo:" argumentIndex:0 ofReply:0];

  [a1[8] setRemoteObjectInterface:v16];
  id v19 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___STSXPCClientNotificationListenerCallbackProtocol];
  CFStringRef v20 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", objc_opt_class(), 0);
  [v19 setClasses:v20 forSelector:"sendCredentialSelect:callback:" argumentIndex:0 ofReply:0];

  [a1[8] setExportedInterface:v19];
  [a1[8] setExportedObject:a1];
  objc_initWeak(location, a1);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10000EBE8;
  v33[3] = &unk_100054AC0;
  objc_copyWeak(&v34, location);
  [a1[8] setInvalidationHandler:v33];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10000ED98;
  v31[3] = &unk_100054AC0;
  objc_copyWeak(&v32, location);
  [a1[8] setInterruptionHandler:v31];
  [a1[8] _setQueue:a1[7]];
  [a1[8] resume];
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 1;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10000EE20;
  v26[3] = &unk_1000549F8;
  v26[4] = a1;
  v26[5] = &v27;
  id v21 = sub_10000DA8C((uint64_t)a1, v26);
  [v21 dummyStart];

  LODWORD(v21) = *((unsigned __int8 *)v28 + 24);
  _Block_object_dispose(&v27, 8);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&v34);
  objc_destroyWeak(location);

  if (v21)
  {
LABEL_4:
    a1 = a1;
    id v22 = a1;
  }
  else
  {
LABEL_5:
    id v22 = 0;
  }

  return v22;
}

void sub_10000CF6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak((id *)(v21 - 112));
  _Unwind_Resume(a1);
}

void sub_10000D000(os_unfair_lock_s *a1)
{
  if (a1)
  {
    id v1 = a1 + 3;
    v2[0] = _NSConcreteStackBlock;
    v2[1] = 3221225472;
    v2[2] = sub_10000D094;
    v2[3] = &unk_1000549A8;
    v2[4] = a1;
    os_unfair_lock_lock(a1 + 3);
    ((void (*)(void *))sub_10000D094)(v2);
    os_unfair_lock_unlock(v1);
  }
}

void *sub_10000D094(void *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v8 = result;
  uint64_t v9 = result[4];
  if (v9)
  {
    if (*(unsigned char *)(v9 + 9)) {
      return result;
    }
    *(unsigned char *)(v9 + 9) = 1;
    unint64_t v10 = (void *)result[4];
  }
  else
  {
    unint64_t v10 = 0;
  }
  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSXPClientNotification invalidate]_block_invoke", 66, v10, @"Invalidate client notification", a7, a8, v13);
  uint64_t v11 = v8[4];
  if (v11) {
    uint64_t v12 = *(void **)(v11 + 64);
  }
  else {
    uint64_t v12 = 0;
  }

  return [v12 invalidate];
}

void sub_10000D128(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10000D1BC;
    v4[3] = &unk_1000549D0;
    v4[4] = a1;
    CFDataRef v3 = sub_10000D200(a1, v4);
    [v3 transactionStarted:a2];
  }
}

void sub_10000D1BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

id sub_10000D200(uint64_t a1, void *a2)
{
  CFDataRef v3 = a2;
  if (a1)
  {
    uint64_t v13 = 0;
    id v14 = &v13;
    uint64_t v15 = 0x2020000000;
    char v16 = 0;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    uint64_t v9 = sub_10000EBC4;
    unint64_t v10 = &unk_100054A98;
    uint64_t v11 = a1;
    uint64_t v12 = &v13;
    id v4 = v8;
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 12));
    v9((uint64_t)v4);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 12));

    if (*((unsigned char *)v14 + 24))
    {
      NSErrorUserInfoKey v17 = NSLocalizedDescriptionKey;
      id v18 = off_100066170;
      id v5 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      CFStringRef v6 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:4 userInfo:v5];

      v3[2](v3, v6);
      a1 = 0;
    }
    else
    {
      a1 = [*(id *)(a1 + 64) remoteObjectProxyWithErrorHandler:v3];
    }
    _Block_object_dispose(&v13, 8);
  }

  return (id)a1;
}

void sub_10000D3D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
}

void sub_10000D3F0(uint64_t a1, void *a2, void *a3)
{
  if (a1)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    void v8[2] = sub_10000D4B0;
    v8[3] = &unk_1000549D0;
    v8[4] = a1;
    id v5 = a3;
    id v6 = a2;
    id v7 = sub_10000D200(a1, v8);
    [v7 processCredentialRequestList:v6 readerAuthInfo:v5];
  }
}

void sub_10000D4B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000D4F4(uint64_t a1, void *a2, void *a3)
{
  if (a1)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    void v8[2] = sub_10000D5B4;
    v8[3] = &unk_1000549D0;
    v8[4] = a1;
    id v5 = a3;
    id v6 = a2;
    id v7 = sub_10000D200(a1, v8);
    [v7 transactionEndedWithIdentifier:v6 error:v5];
  }
}

void sub_10000D5B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000D5F8(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10000D68C;
    v4[3] = &unk_1000549D0;
    v4[4] = a1;
    CFDataRef v3 = sub_10000D200(a1, v4);
    [v3 alternativeCarrierConnectedWithStatus:a2];
  }
}

void sub_10000D68C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000D6D0(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10000D764;
    v4[3] = &unk_1000549D0;
    v4[4] = a1;
    CFDataRef v3 = sub_10000D200(a1, v4);
    [v3 alternativeCarrierDisconnectedWithStatus:a2];
  }
}

void sub_10000D764(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000D7A8(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v10 = a4;
  if (a1)
  {
    sub_100025F04(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSXPClientNotification alternativeCarrierReceivedData:dataPending:completion:]", 113, a1, @"data: %@", v8, v9, (uint64_t)v7);
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3032000000;
    v17[3] = sub_10000D968;
    v17[4] = sub_10000D978;
    id v18 = 0;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000D980;
    v16[3] = &unk_1000549F8;
    v16[4] = a1;
    v16[5] = v17;
    uint64_t v11 = sub_10000DA8C((uint64_t)a1, v16);
    [v11 receivedRawDataFromAlternativeCarrier:v7 dataPending:a3];

    uint64_t v12 = a1[7];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000DC78;
    block[3] = &unk_100054A20;
    id v14 = v10;
    uint64_t v15 = v17;
    dispatch_async(v12, block);

    _Block_object_dispose(v17, 8);
  }
}

void sub_10000D950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000D968(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000D978(uint64_t a1)
{
}

void sub_10000D980(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSXPClientNotification alternativeCarrierReceivedData:dataPending:completion:]_block_invoke", 134, *(void **)(a1 + 32), @"XPC Error: %@", a7, a8, a2);
  NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
  id v14 = off_100066170;
  uint64_t v9 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  uint64_t v10 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:4 userInfo:v9];

  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

id sub_10000DA8C(uint64_t a1, void *a2)
{
  CFDataRef v3 = a2;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  uint64_t v10 = sub_10000EBA0;
  uint64_t v11 = &unk_100054A98;
  uint64_t v12 = a1;
  NSErrorUserInfoKey v13 = &v14;
  id v4 = v9;
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 12));
  v10((uint64_t)v4);
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 12));

  if (*((unsigned char *)v15 + 24))
  {
    NSErrorUserInfoKey v18 = NSLocalizedDescriptionKey;
    id v19 = off_100066170;
    id v5 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    id v6 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:4 userInfo:v5];

    v3[2](v3, v6);
    id v7 = 0;
  }
  else
  {
    id v7 = [*(id *)(a1 + 64) synchronousRemoteObjectProxyWithErrorHandler:v3];
  }
  _Block_object_dispose(&v14, 8);

  return v7;
}

void sub_10000DC58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
}

uint64_t sub_10000DC78(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void sub_10000DC94(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (a1)
  {
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x3032000000;
    v22[3] = sub_10000D968;
    v22[4] = sub_10000D978;
    id v23 = 0;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10000DE6C;
    v21[3] = &unk_1000549F8;
    v21[4] = a1;
    v21[5] = v22;
    uint64_t v16 = sub_10000DA8C(a1, v21);
    [v16 iso18013DecryptedDeviceResponse:v11 sessionDataStatus:v12 mDocResponseStatus:v13 error:v14];

    if (v15)
    {
      char v17 = *(NSObject **)(a1 + 56);
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_10000DF78;
      v18[3] = &unk_100054A20;
      id v19 = v15;
      CFStringRef v20 = v22;
      dispatch_async(v17, v18);
    }
    _Block_object_dispose(v22, 8);
  }
}

void sub_10000DE54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000DE6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSXPClientNotification iso18013ReaderReceived:sessionDataStatus:mDocResponseStatus:error:completion:]_block_invoke", 150, *(void **)(a1 + 32), @"XPC error: %@", a7, a8, a2);
  NSErrorUserInfoKey v13 = NSLocalizedDescriptionKey;
  id v14 = off_100066170;
  uint64_t v9 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  uint64_t v10 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:4 userInfo:v9];

  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

uint64_t sub_10000DF78(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void sub_10000DF94(uint64_t a1, void *a2)
{
  if (a1)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10000E038;
    v5[3] = &unk_1000549D0;
    v5[4] = a1;
    id v3 = a2;
    id v4 = sub_10000D200(a1, v5);
    [v4 sessionTranscriptGenerated:v3];
  }
}

void sub_10000E038(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000E27C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 64));
  _Unwind_Resume(a1);
}

void sub_10000E2A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSXPClientNotification sendRawDataToAlternativeCarrier:callback:]_block_invoke", 187, *(void **)(a1 + 32), @"Lost of ref. to self", v4, v5, v10);
    uint64_t v7 = *(void *)(a1 + 40);
    NSErrorUserInfoKey v11 = NSLocalizedDescriptionKey;
    id v12 = off_100066160;
    uint64_t v8 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    uint64_t v9 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:2 userInfo:v8];

    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v9);
  }
}

uint64_t sub_10000E704(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000EBA0(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1) {
    LOBYTE(v1) = *(unsigned char *)(v1 + 9) != 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v1;
  return result;
}

uint64_t sub_10000EBC4(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1) {
    LOBYTE(v1) = *(unsigned char *)(v1 + 9) != 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v1;
  return result;
}

void sub_10000EBE8(uint64_t a1)
{
  uint64_t v2 = _os_activity_create((void *)&_mh_execute_header, "STSXPClientNotification xpcInvalidated", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v2, &state);
  os_activity_scope_leave(&state);

  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = (os_unfair_lock_s *)WeakRetained;
  if (WeakRetained)
  {
    sub_10000ECE0(WeakRetained, 1u, WeakRetained[8]);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10000ED70;
    v5[3] = &unk_1000549A8;
    v5[4] = v4;
    os_unfair_lock_lock(v4 + 3);
    sub_10000ED70((uint64_t)v5);
    os_unfair_lock_unlock(v4 + 3);
  }
}

void sub_10000ECE0(id *a1, unsigned int a2, void *a3)
{
  [a3 processIdentifier];
  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSXPClientNotification didInvalidateXPC:connection:]", 382, a1, @"Invalidated=%d, connection(PID)=%d", v5, v6, a2);
  id WeakRetained = objc_loadWeakRetained(a1 + 3);
  id v8 = WeakRetained;
  if (a2) {
    [WeakRetained xpcInvalidated];
  }
  else {
    [WeakRetained xpcInterrupted];
  }
}

void sub_10000ED70(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    *(unsigned char *)(v1 + 9) = 1;
    uint64_t v2 = *(void *)(a1 + 32);
    if (v2) {
      objc_storeStrong((id *)(v2 + 64), 0);
    }
  }
}

void sub_10000ED98(uint64_t a1)
{
  uint64_t v2 = _os_activity_create((void *)&_mh_execute_header, "STSXPClientNotification xpcInterrupted", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v5.opaque[0] = 0;
  v5.opaque[1] = 0;
  os_activity_scope_enter(v2, &v5);
  os_activity_scope_leave(&v5);

  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained) {
    sub_10000ECE0(WeakRetained, 0, WeakRetained[8]);
  }
}

void sub_10000EE20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSXPClientNotification setupConnectWithXPCServiceEndpoint:]_block_invoke_4", 372, *(void **)(a1 + 32), @"XPC error=%@", a7, a8, a2);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

id *sub_10000EEEC(id *a1, void *a2, void *a3)
{
  id v6 = a3;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)STSCredentialRequest;
    uint64_t v7 = (id *)objc_msgSendSuper2(&v9, "init");
    a1 = v7;
    if (v7)
    {
      v7[1] = a2;
      objc_storeStrong(v7 + 2, a3);
    }
  }

  return a1;
}

_WORD *sub_10000F068(_WORD *a1, void *a2, __int16 a3)
{
  id v6 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)ISO18013RequestElement;
    id v7 = objc_msgSendSuper2(&v9, "init");
    a1 = v7;
    if (v7)
    {
      objc_storeStrong((id *)v7 + 2, a2);
      a1[4] = a3;
    }
  }

  return a1;
}

id *sub_10000F1EC(id *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a1)
  {
    NSErrorUserInfoKey v13 = sub_10000EEEC(a1, 0, a2);
    id v14 = v13;
    if (v13)
    {
      objc_storeStrong(v13 + 3, a3);
      objc_storeStrong(v14 + 4, a4);
      objc_storeStrong(v14 + 6, a5);
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

void *sub_10000F568(void *a1, char a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if (a1)
  {
    v25.receiver = a1;
    v25.super_class = (Class)ReaderAnalyticsData;
    id v15 = objc_msgSendSuper2(&v25, "init");
    a1 = v15;
    if (v15)
    {
      *((unsigned char *)v15 + 8) = a2;
      id v16 = [v11 copy];
      char v17 = (void *)a1[2];
      a1[2] = v16;

      id v18 = [v12 copy];
      id v19 = (void *)a1[3];
      a1[3] = v18;

      id v20 = [v13 copy];
      uint64_t v21 = (void *)a1[4];
      a1[4] = v20;

      id v22 = [v14 copy];
      id v23 = (void *)a1[5];
      a1[5] = v22;
    }
  }

  return a1;
}

id *sub_10000F994(id *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9, void *a10, void *a11)
{
  id v33 = a2;
  id v32 = a3;
  id v24 = a4;
  id v31 = a4;
  id v25 = a5;
  id v30 = a5;
  id v29 = a6;
  id v26 = a7;
  id v28 = a7;
  id v27 = a8;
  id v18 = a9;
  id v19 = a10;
  id v20 = a11;
  if (a1)
  {
    v34.receiver = a1;
    v34.super_class = (Class)ISO18013ReaderAuthInfo;
    uint64_t v21 = (id *)objc_msgSendSuper2(&v34, "init");
    a1 = v21;
    if (v21)
    {
      objc_storeStrong(v21 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      objc_storeStrong(a1 + 3, v24);
      objc_storeStrong(a1 + 4, v25);
      objc_storeStrong(a1 + 5, a6);
      objc_storeStrong(a1 + 6, v26);
      objc_storeStrong(a1 + 7, a8);
      objc_storeStrong(a1 + 8, a9);
      objc_storeStrong(a1 + 9, a10);
      objc_storeStrong(a1 + 10, a11);
    }
  }

  return a1;
}

id *sub_10000FF24(id *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a4;
  id v11 = a5;
  if (a1)
  {
    v21.receiver = a1;
    v21.super_class = (Class)STSBluetoothSession;
    id v12 = (id *)objc_msgSendSuper2(&v21, "init");
    a1 = v12;
    if (v12)
    {
      v12[3] = a3;
      objc_storeWeak(v12 + 2, v9);
      objc_storeWeak(a1 + 5, v10);
      if (v11)
      {
        id v13 = v11;
        id v14 = a1[4];
        a1[4] = v13;
      }
      else
      {
        id v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        id v15 = dispatch_queue_attr_make_with_qos_class(v14, QOS_CLASS_USER_INTERACTIVE, 0);
        dispatch_queue_t v16 = dispatch_queue_create("STSBluetoothSession", v15);
        id v17 = a1[4];
        a1[4] = v16;
      }
      dispatch_queue_t v18 = dispatch_queue_create("LE queue", 0);
      id v19 = a1[11];
      a1[11] = v18;

      *((_DWORD *)a1 + 3) = 0;
    }
  }

  return a1;
}

id sub_100010054(uint64_t a1, void *a2, void *a3, char a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v56 = a5;
  if (a1)
  {
    objc_initWeak(&location, (id)a1);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 12));
    *(unsigned char *)(a1 + 8) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 12));
    sub_100025F04(OS_LOG_TYPE_DEFAULT, 1, (uint64_t)"-[STSBluetoothSession beginWithUUID:targetAddress:l2CapEnable:readerIdentCharacteristic:]", 70, (void *)a1, @"uuid: %@  target:%@  l2cap:%d", v11, v12, (uint64_t)v9);
    v71[0] = _NSConcreteStackBlock;
    v71[1] = 3221225472;
    v71[2] = sub_1000107EC;
    v71[3] = &unk_100054AE8;
    objc_copyWeak(&v72, &location);
    v71[4] = a1;
    id v13 = objc_retainBlock(v71);
    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472;
    v69[2] = sub_100010A38;
    v69[3] = &unk_100054AE8;
    objc_copyWeak(&v70, &location);
    v69[4] = a1;
    id v14 = objc_retainBlock(v69);
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472;
    v67[2] = sub_100010EDC;
    v67[3] = &unk_100054B10;
    objc_copyWeak(&v68, &location);
    v67[4] = a1;
    id v15 = objc_retainBlock(v67);
    v62[0] = _NSConcreteStackBlock;
    v62[1] = 3221225472;
    unsigned char v62[2] = sub_100011094;
    v62[3] = &unk_100054B38;
    id v16 = v56;
    id v63 = v16;
    id v17 = v13;
    id v64 = v17;
    dispatch_queue_t v18 = v14;
    id v65 = v18;
    id v19 = v15;
    id v66 = v19;
    v55 = objc_retainBlock(v62);
    v57[0] = _NSConcreteStackBlock;
    v57[1] = 3221225472;
    v57[2] = sub_1000110A4;
    v57[3] = &unk_100054B60;
    id v58 = v16;
    v54 = v17;
    id v59 = v54;
    id v20 = v18;
    id v60 = v20;
    objc_super v21 = v19;
    id v61 = v21;
    id v22 = objc_retainBlock(v57);
    id v23 = [v9 length];
    uint64_t v24 = *(void *)(a1 + 24);
    id v25 = v10;
    if (v23)
    {
      switch(v24)
      {
        case 0:
          goto LABEL_7;
        case 1:
          id v26 = [ReaderPeripheral alloc];
          id v27 = *(id *)(a1 + 88);
          id v28 = *(id *)(a1 + 32);
          id v29 = sub_1000098A4(v26, a4);
          id v30 = (id *)(a1 + 56);
          objc_storeStrong(v30, v29);

          id v31 = *v30;
          char v32 = ((uint64_t (*)(void *, id, id, id))v22[2])(v22, v31, v9, v25);

          goto LABEL_10;
        case 2:
          goto LABEL_8;
        case 3:
          id v46 = [ISOPeripheral alloc];
          id v47 = *(id *)(a1 + 88);
          id v48 = *(id *)(a1 + 32);
          uint64_t v49 = sub_100018DAC(v46, a4);
          uint64_t v50 = (id *)(a1 + 72);
          objc_storeStrong(v50, v49);

          id v51 = *v50;
          char v32 = ((uint64_t (*)(void *, id, id, id))v22[2])(v22, v51, v9, v25);

          goto LABEL_10;
        default:
          goto LABEL_12;
      }
    }
    switch(v24)
    {
      case 0:
LABEL_7:
        objc_super v34 = [ReaderCentral alloc];
        id v35 = *(id *)(a1 + 88);
        id v36 = *(id *)(a1 + 32);
        id v37 = [(ISO18013_3_Central *)v34 initWithWorkQueue:v35 callbackQueue:v36];
        uint64_t v38 = (id *)(a1 + 48);
        objc_storeStrong(v38, v37);

        id v39 = *v38;
        char v32 = ((uint64_t (*)(void *, id, id, id))v55[2])(v55, v39, v25, v9);

        goto LABEL_10;
      case 1:
      case 3:
        NSErrorUserInfoKey v74 = NSLocalizedDescriptionKey;
        v75 = off_100066178;
        id v33 = +[NSDictionary dictionaryWithObjects:&v75 forKeys:&v74 count:1];
        a1 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:5 userInfo:v33];

        break;
      case 2:
LABEL_8:
        CFStringRef v40 = [ISOCentral alloc];
        id v41 = *(id *)(a1 + 88);
        id v42 = *(id *)(a1 + 32);
        id v43 = [(ISO18013_3_Central *)v40 initWithWorkQueue:v41 callbackQueue:v42];
        uint64_t v44 = (id *)(a1 + 64);
        objc_storeStrong(v44, v43);

        id v45 = *v44;
        char v32 = ((uint64_t (*)(void *, id, id, id))v55[2])(v55, v45, v25, v9);

LABEL_10:
        if ((v32 & 1) == 0) {
          goto LABEL_12;
        }
        id v10 = v25;
        a1 = 0;
        break;
      default:
LABEL_12:
        NSErrorUserInfoKey v74 = NSLocalizedDescriptionKey;
        v75 = off_100066160;
        uint64_t v52 = +[NSDictionary dictionaryWithObjects:&v75 forKeys:&v74 count:1];
        a1 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:2 userInfo:v52];

        id v10 = v25;
        break;
    }

    objc_destroyWeak(&v68);
    objc_destroyWeak(&v70);

    objc_destroyWeak(&v72);
    objc_destroyWeak(&location);
  }

  return (id)a1;
}

void sub_10001078C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *a13, id *a14, id *location)
{
  objc_destroyWeak((id *)(v15 - 136));
  _Unwind_Resume(a1);
}

void sub_1000107EC(uint64_t a1, uint64_t a2)
{
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  os_activity_scope_state_s v5 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 3);
    LOBYTE(v5[2]._os_unfair_lock_opaque) = 1;
    os_unfair_lock_unlock(v5 + 3);
    id v6 = sub_1000261A8();
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "BT_Connected", "", buf, 2u);
    }

    uint64_t v7 = *(void *)(a1 + 32);
    if (v7)
    {
      id v8 = +[NSDate now];
      id v9 = objc_loadWeakRetained((id *)(v7 + 40));
      [v9 altCarrierConnectedWithStatus:a2];

      uint64_t v10 = *(void *)(v7 + 24);
      if ((v10 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        v19[0] = @"transactionStartEventTime";
        v19[1] = @"transportType";
        *(void *)buf = v8;
        objc_super v21 = &off_10005ADA0;
        uint64_t v11 = +[NSDictionary dictionaryWithObjects:buf forKeys:v19 count:2];
        uint64_t v12 = +[STSAnalyticsLogger sharedCALogger];
        [v12 postISOTransactionEvent:v11 prepOnly:1];

        uint64_t v10 = *(void *)(v7 + 24);
      }
      switch(v10)
      {
        case 0:
          id v13 = *(void **)(v7 + 48);
          goto LABEL_12;
        case 1:
          id v13 = *(void **)(v7 + 56);
          goto LABEL_12;
        case 2:
          id v13 = *(void **)(v7 + 64);
          goto LABEL_12;
        case 3:
          id v13 = *(void **)(v7 + 72);
LABEL_12:
          id v18 = 0;
          id v14 = v13;
          uint64_t v15 = [v14 getBluetoothStatusDict:&v18];
          id v16 = v18;

          if (v15)
          {
            id v17 = +[STSAnalyticsLogger sharedCALogger];
            [v17 postISOBTStatusEvent:v15];
          }
          break;
        default:
          break;
      }
    }
  }
}

void sub_100010A38(uint64_t a1, uint64_t a2)
{
  id WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  os_activity_scope_state_s v5 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 3);
    LOBYTE(v5[2]._os_unfair_lock_opaque) = 0;
    os_unfair_lock_unlock(v5 + 3);
    switch(a2)
    {
      case 2:
        v23[0] = NSLocalizedDescriptionKey;
        *(void *)&long long buf = off_1000661D0;
        id v6 = +[NSDictionary dictionaryWithObjects:&buf forKeys:v23 count:1];
        uint64_t v7 = 16;
        goto LABEL_8;
      case 3:
        v23[0] = NSLocalizedDescriptionKey;
        *(void *)&long long buf = off_100066188;
        id v6 = +[NSDictionary dictionaryWithObjects:&buf forKeys:v23 count:1];
        uint64_t v7 = 7;
        goto LABEL_8;
      case 4:
        id v9 = +[NSError errorWithDomain:@"BluetoothDomain" code:0 userInfo:0];
        v23[0] = NSLocalizedDescriptionKey;
        v23[1] = NSUnderlyingErrorKey;
        *(void *)&long long buf = @"Bluetooth specific error";
        *((void *)&buf + 1) = v9;
        uint64_t v10 = +[NSDictionary dictionaryWithObjects:&buf forKeys:v23 count:2];
        id v8 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:12 userInfo:v10];

        break;
      case 5:
        v23[0] = NSLocalizedDescriptionKey;
        *(void *)&long long buf = off_1000661C8;
        id v6 = +[NSDictionary dictionaryWithObjects:&buf forKeys:v23 count:1];
        uint64_t v7 = 15;
LABEL_8:
        id v8 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:v7 userInfo:v6];

        break;
      default:
        id v8 = 0;
        break;
    }
    sub_100010E6C(v5, v8);
    uint64_t v11 = sub_1000261A8();
    if (os_signpost_enabled(v11))
    {
      uint64_t v12 = [v8 description];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v12;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "BT_Disconnected", "error=%@", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v13 = *(void *)(a1 + 32);
    if (v13) {
      id v14 = objc_loadWeakRetained((id *)(v13 + 40));
    }
    else {
      id v14 = 0;
    }
    [v14 altCarrierDisconnectedWithStatus:a2];

    uint64_t v15 = *(void *)(a1 + 32);
    if (v15 && (*(void *)(v15 + 24) & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      id v16 = +[NSDate now];
      CFStringRef v20 = @"transactionEndEventTime";
      CFStringRef v21 = @"errorCode";
      v22[0] = v16;
      if (v8)
      {
        +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v8, "code", v20, v21, v22[0]));
        id v17 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v17 = &off_10005AD88;
      }
      v22[1] = v17;
      id v18 = +[NSDictionary dictionaryWithObjects:v22 forKeys:&v20 count:2];
      if (v8) {

      }
      id v19 = +[STSAnalyticsLogger sharedCALogger];
      [v19 postISOTransactionEvent:v18 prepOnly:0];
    }
  }
}

uint64_t sub_100010E6C(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = v3;
  if (a1)
  {
    id v3 = (void (**)(void))a1[10];
    if (v3)
    {
      uint64_t v7 = v4;
      v3[2]();
      objc_setProperty_nonatomic_copy(a1, v5, 0, 80);
      uint64_t v4 = v7;
    }
  }

  return _objc_release_x1(v3, v4);
}

void sub_100010EDC(uint64_t a1, void *a2)
{
  id v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained(v3);
  sub_100010E6C(WeakRetained, 0);
  if (WeakRetained)
  {
    id v6 = v4;
    id v7 = [v6 length];
    sub_100025F04(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSBluetoothSession _forwardReceivedDataToNotificationListener:]", 56, WeakRetained, @"Recv %ld bytes", v8, v9, (uint64_t)v7);
    id v10 = objc_loadWeakRetained(WeakRetained + 5);
    [v10 altCarrierReceived:v6 status:0];
  }
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11 && (*(void *)(v11 + 24) | 2) != 2)
  {
    uint64_t v12 = +[STSAnalyticsLogger sharedCALogger];
    v16[0] = @"btL2Cap";
    v16[1] = @"btCentral";
    v17[0] = &__kCFBooleanFalse;
    v17[1] = &__kCFBooleanFalse;
    uint64_t v13 = v17;
    id v14 = v16;
  }
  else
  {
    uint64_t v12 = +[STSAnalyticsLogger sharedCALogger];
    v18[0] = @"btL2Cap";
    v18[1] = @"btCentral";
    v19[0] = &__kCFBooleanFalse;
    v19[1] = &__kCFBooleanTrue;
    uint64_t v13 = v19;
    id v14 = v18;
  }
  uint64_t v15 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v14 count:2];
  [v12 postISOTransactionEvent:v15 prepOnly:1];
}

id sub_100011094(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return [a2 connectBLEAddress:a3 advertiseServiceUUID:a4 readerIdentCharacteristic:a1[4] onDeviceConnection:a1[5] onDisconnect:a1[6] onDataRx:a1[7]];
}

id sub_1000110A4(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  return [a2 advertise:a3 readerIdentCharacteristic:a1[4] centralAddress:a4 onDeviceConnection:a1[5] onDisconnect:a1[6] onDataRx:a1[7]];
}

void sub_1000110B8(id *a1, uint64_t a2)
{
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 2);
    SEL v5 = WeakRetained;
    if (WeakRetained) {
      id v6 = (void *)*((void *)WeakRetained + 4);
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;
    sub_10000D6D0((uint64_t)v7, 1);

    [a1[8] invalidateAndUpdateStateSignal:a2];
    id v8 = a1[8];
    a1[8] = 0;

    [a1[9] invalidateAndUpdateStateSignal:a2];
    id v9 = a1[9];
    a1[9] = 0;

    [a1[6] invalidateAndUpdateStateSignal:a2];
    id v10 = a1[6];
    a1[6] = 0;

    [a1[7] invalidateAndUpdateStateSignal:a2];
    id v11 = a1[7];
    a1[7] = 0;
  }
}

uint64_t sub_10001118C()
{
  self;
  v0 = [ISO18013_3_Central alloc];
  dispatch_queue_t v1 = dispatch_queue_create("LE queue", 0);
  uint64_t v2 = dispatch_get_global_queue(33, 0);
  id v3 = [(ISO18013_3_Central *)v0 initWithWorkQueue:v1 callbackQueue:v2];

  id v4 = [(ISO18013_3_Central *)v3 hardwareAvailable];
  if (v4 == (id)1) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 2 * (v4 == (id)2);
  }

  return v5;
}

void sub_100011844(id a1)
{
  qword_100066288 = objc_opt_new();

  _objc_release_x1();
}

id sub_1000122A4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postReaderTransactionEvent:*(void *)(a1 + 40) prepOnly:*(unsigned __int8 *)(a1 + 48)];
}

id sub_10001234C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postReaderSessionEvent:*(void *)(a1 + 40)];
}

id sub_100014238(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100026000(OS_LOG_TYPE_INFO, 0, (uint64_t)"+[CALogger postCAEventFor:eventInput:]_block_invoke", 20, @"Posting for %@ = %@", a6, a7, a8, *(void *)(a1 + 32));
  id v9 = *(void **)(a1 + 40);

  return v9;
}

void sub_1000142F0(id a1)
{
  qword_1000662C8 = objc_opt_new();

  _objc_release_x1();
}

id sub_1000153C0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postISOHandoverEvent:*(void *)(a1 + 40) prepOnly:*(unsigned __int8 *)(a1 + 48)];
}

id sub_100015478(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postISOTransactionEvent:*(void *)(a1 + 40) prepOnly:*(unsigned __int8 *)(a1 + 48)];
}

id sub_100015520(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postISOBTStatusEvent:*(void *)(a1 + 40)];
}

id sub_10001561C(id a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)WifiP2PController;
    a1 = objc_msgSendSuper2(&v13, "init");
    if (a1)
    {
      if (v6)
      {
        id v7 = v6;
        id v8 = *((void *)a1 + 11);
        *((void *)a1 + 11) = v7;
      }
      else
      {
        id v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        id v9 = dispatch_queue_attr_make_with_qos_class(v8, QOS_CLASS_USER_INITIATED, 0);
        dispatch_queue_t v10 = dispatch_queue_create("WifiP2PController", v9);
        id v11 = (void *)*((void *)a1 + 11);
        *((void *)a1 + 11) = v10;
      }
      objc_storeWeak((id *)a1 + 2, v5);
    }
  }

  return a1;
}

id sub_100015708(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    *(_OWORD *)dispatch_queue_t v10 = 0u;
    memset(v11, 0, sizeof(v11));
    id v5 = v3;
    id v6 = inet_ntop(30, [v5 bytes], v10, 0x2Eu);
    if (v6)
    {
      a1 = +[NSString stringWithCString:v6 encoding:4];
    }
    else
    {
      sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[WifiP2PController ipAddrStringFromData:]", 75, a1, @"Invalidate address=%@", v7, v8, (uint64_t)v5);
      a1 = 0;
    }
  }

  return a1;
}

id sub_100015808(void *a1, uint64_t a2)
{
  if (a1)
  {
    id v3 = a1;
    *(void *)uint64_t v8 = 0;
    uint64_t v9 = 0;
    id v4 = if_indextoname(a2, v8);
    if (v4)
    {
      a1 = +[NSString stringWithCString:v4 encoding:4];
    }
    else
    {
      sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[WifiP2PController interfaceNameFromIndex:]", 87, v3, @"Invalid interface index=%d", v5, v6, a2);
      a1 = 0;
    }
  }

  return a1;
}

void sub_1000158D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10 && *(unsigned char *)(v10 + 10)) {
    return;
  }
  if ([*(id *)(a1 + 40) furtherServiceDiscoveryRequired]) {
    sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[WifiP2PController _startDataSessionWithDiscoveryResult:]_block_invoke", 149, *(void **)(a1 + 32), @"Further discovery required", v11, v12, v53);
  }
  if ([*(id *)(a1 + 40) datapathSupported])
  {
    unsigned int v15 = [*(id *)(a1 + 40) datapathSecurityRequired];
    id v18 = *(void **)(a1 + 32);
    if (!v15)
    {
      sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[WifiP2PController _startDataSessionWithDiscoveryResult:]_block_invoke", 180, v18, @"Discovery datapath without security", v16, v17, v53);
      id v26 = [objc_alloc((Class)WiFiAwareDataSession) initWithDiscoveryResult:*(void *)(a1 + 40) serviceType:1 serviceSpecificInfo:0];
      sub_100015C38(*(void *)(a1 + 32), v26);
      goto LABEL_16;
    }
    if (v18) {
      id v19 = (void *)v18[4];
    }
    else {
      id v19 = 0;
    }
    CFStringRef v20 = [v19 passphrase];

    id v23 = *(void **)(a1 + 32);
    if (v20)
    {
      sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[WifiP2PController _startDataSessionWithDiscoveryResult:]_block_invoke", 159, v23, @"Discovery datapath with passphrase", v21, v22, v53);
      uint64_t v24 = *(void *)(a1 + 32);
      if (v24) {
        id v25 = *(void **)(v24 + 32);
      }
      else {
        id v25 = 0;
      }
      id v26 = [v25 passphrase];
      id v27 = [objc_alloc((Class)WiFiAwareDataSession) initWithDiscoveryResult:*(void *)(a1 + 40) serviceType:1 serviceSpecificInfo:0 passphrase:v26];
      sub_100015C38(*(void *)(a1 + 32), v27);
LABEL_13:

LABEL_16:
LABEL_17:
      uint64_t v31 = *(void *)(a1 + 32);
      if (v31) {
        char v32 = *(void **)(v31 + 72);
      }
      else {
        char v32 = 0;
      }
      objc_msgSend(v32, "setDelegate:");
      uint64_t v33 = *(void *)(a1 + 32);
      if (v33) {
        objc_super v34 = *(void **)(v33 + 72);
      }
      else {
        objc_super v34 = 0;
      }
      [v34 start];
      id v28 = *(void **)(a1 + 32);
      id v29 = @"Subscriber started data session...";
      uint64_t v30 = 189;
      goto LABEL_22;
    }
    if (v23) {
      id v35 = (void *)v23[4];
    }
    else {
      id v35 = 0;
    }
    id v36 = v35;
    uint64_t v37 = [v36 datapathPmk];
    if (v37)
    {
      uint64_t v38 = (void *)v37;
      uint64_t v39 = *(void *)(a1 + 32);
      if (v39) {
        CFStringRef v40 = *(void **)(v39 + 32);
      }
      else {
        CFStringRef v40 = 0;
      }
      id v41 = [v40 datapathPmkID];

      if (v41)
      {
        sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[WifiP2PController _startDataSessionWithDiscoveryResult:]_block_invoke", 167, *(void **)(a1 + 32), @"Discovery datapath with PMK", v42, v43, v53);
        id v44 = objc_alloc((Class)WiFiAwareDataSession);
        id v45 = *(void **)(a1 + 32);
        uint64_t v46 = *(void *)(a1 + 40);
        if (v45) {
          id v45 = (void *)v45[4];
        }
        id v26 = v45;
        id v27 = [v26 datapathPmk];
        id v47 = *(void **)(a1 + 32);
        if (v47) {
          id v47 = (void *)v47[4];
        }
        id v48 = v47;
        uint64_t v49 = [v48 datapathPmkID];
        id v50 = [v44 initWithDiscoveryResult:v46 serviceType:1 serviceSpecificInfo:0 pmk:v27 pmkID:v49];
        sub_100015C38(*(void *)(a1 + 32), v50);

        goto LABEL_13;
      }
    }
    else
    {
    }
    sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[WifiP2PController _startDataSessionWithDiscoveryResult:]_block_invoke", 176, *(void **)(a1 + 32), @"Datapth required security but missing related configuration. Invalidating suscriber", v42, v43, v53);
    uint64_t v51 = *(void *)(a1 + 32);
    if (v51) {
      uint64_t v52 = *(void **)(v51 + 64);
    }
    else {
      uint64_t v52 = 0;
    }
    [v52 stop];
    goto LABEL_17;
  }
  id v28 = *(void **)(a1 + 32);
  id v29 = @"Endpoint does not support datapath";
  uint64_t v30 = 153;
LABEL_22:

  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[WifiP2PController _startDataSessionWithDiscoveryResult:]_block_invoke", v30, v28, v29, v13, v14, a9);
}

void sub_100015C38(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 72), a2);
  }
}

void sub_100015C48(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (a1)
  {
    uint64_t v8 = *(NSObject **)(a1 + 88);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100015D10;
    block[3] = &unk_100054D30;
    void block[4] = a1;
    id v11 = v6;
    id v10 = v5;
    dispatch_async(v8, block);
  }
}

void sub_100015D10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(unsigned char **)(a1 + 32);
  if (!v9 || !v9[8])
  {
    sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[WifiP2PController startPublisherWithConfiguration:completionHandler:]_block_invoke", 202, v9, @"config=%@", a7, a8, *(void *)(a1 + 40));
    id v14 = objc_alloc((Class)WiFiAwarePublishConfiguration);
    unsigned int v15 = *(void **)(a1 + 40);
    if (v15) {
      unsigned int v15 = (void *)v15[2];
    }
    uint64_t v16 = v15;
    id v13 = [v14 initWithServiceName:v16];

    uint64_t v17 = *(void **)(a1 + 40);
    if (v17) {
      uint64_t v17 = (void *)v17[3];
    }
    id v18 = v17;
    id v19 = [v18 passphrase];

    if (v19)
    {
      sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[WifiP2PController startPublisherWithConfiguration:completionHandler:]_block_invoke", 212, *(void **)(a1 + 32), @"Enabling passhprase security", v20, v21, v99);
      id v22 = objc_alloc((Class)WiFiAwarePublishDatapathSecurityConfiguration);
      id v23 = +[NSArray array];
      uint64_t v24 = *(void **)(a1 + 40);
      if (v24) {
        uint64_t v24 = (void *)v24[3];
      }
      id v25 = v24;
      id v26 = [v25 passphrase];
      v102 = v26;
      id v27 = +[NSArray arrayWithObjects:&v102 count:1];
      id v28 = [v22 initWithPMKList:v23 passphraseList:v27];
LABEL_12:
      id v29 = v28;

      goto LABEL_13;
    }
    uint64_t v66 = *(void *)(a1 + 40);
    if (v66)
    {
      id v67 = *(id *)(v66 + 48);
      if (v67)
      {
        id v68 = v67;
        v69 = *(void **)(a1 + 40);
        if (v69) {
          v69 = (void *)v69[5];
        }
        id v70 = v69;

        if (v70)
        {
          sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[WifiP2PController startPublisherWithConfiguration:completionHandler:]_block_invoke", 217, *(void **)(a1 + 32), @"Enabling cipher suite security", v71, v72, v99);
          long long v73 = *(void **)(a1 + 40);
          if (v73) {
            long long v73 = (void *)v73[6];
          }
          NSErrorUserInfoKey v74 = v73;
          sub_100016528(*(void *)(a1 + 32), v74);

          v76 = *(void **)(a1 + 32);
          v75 = *(void **)(a1 + 40);
          if (v75) {
            v75 = (void *)v75[5];
          }
          v77 = v75;
          v78 = *(void **)(a1 + 32);
          if (v78) {
            v78 = (void *)v78[5];
          }
          id v100 = 0;
          id v101 = 0;
          v79 = v78;
          int v80 = sub_100016538(v76, 1, v77, v79, &v101, &v100);
          id v29 = v101;
          id v30 = v100;

          if (!v80)
          {
            sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[WifiP2PController startPublisherWithConfiguration:completionHandler:]_block_invoke", 227, *(void **)(a1 + 32), @"Security info derivation failed", v81, v82, v99);
            uint64_t v84 = *(void *)(a1 + 48);
            v103[0] = NSLocalizedDescriptionKey;
            v104[0] = off_100066198;
            v85 = +[NSDictionary dictionaryWithObjects:v104 forKeys:v103 count:1];
            id v41 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:9 userInfo:v85];

            id v65 = *(void (**)(void))(v84 + 16);
            goto LABEL_45;
          }
          id v83 = [objc_alloc((Class)WiFiAwarePublishDatapathSecurityConfiguration) initWithPMK:v29 andPMKID:v30];

          id v29 = v83;
LABEL_13:
          id v30 = [objc_alloc((Class)WiFiAwarePublishDatapathConfiguration) initWithServiceType:1 securityConfiguration:v29];
          uint64_t v31 = *(void **)(a1 + 40);
          if (v31) {
            uint64_t v31 = (void *)v31[8];
          }
          char v32 = v31;
          id v33 = [v32 unsignedShortValue];

          if (v33)
          {
            id v34 = [objc_alloc((Class)WiFiAwarePublishDatapathServiceSpecificInfo) initWithProtocolType:0 servicePort:v33];
            [v30 setServiceSpecificInfo:v34];
          }
          [v13 setDatapathConfiguration:v30];
          id v35 = *(void **)(a1 + 40);
          if (v35) {
            id v35 = (void *)v35[7];
          }
          id v36 = v35;
          id v37 = [v36 length];

          if (v37)
          {
            uint64_t v38 = objc_opt_new();
            uint64_t v39 = *(void **)(a1 + 40);
            if (v39) {
              uint64_t v39 = (void *)v39[7];
            }
            CFStringRef v40 = v39;
            [v38 setBlob:v40];

            [v13 setServiceSpecificInfo:v38];
          }
          [v13 setAuthenticationType:0];
          id v41 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.sts"];
          if ([v41 BOOLForKey:@"DisableWifiFastDiscovery"])
          {
            sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[WifiP2PController startPublisherWithConfiguration:completionHandler:]_block_invoke", 267, *(void **)(a1 + 32), @"Fast discovery disabled", v42, v43, v99);
          }
          else
          {
            id v44 = *(void **)(a1 + 40);
            if (v44) {
              id v44 = (void *)v44[4];
            }
            id v45 = v44;

            if (v45)
            {
              id v46 = objc_alloc_init((Class)WiFiAwareFastDiscoveryConfiguration);
              id v47 = *(void **)(a1 + 40);
              if (v47) {
                id v47 = (void *)v47[4];
              }
              id v48 = v47;
              uint64_t v49 = [v48 channelNumber];
              [v46 setInstantCommunicationChannel:v49];

              id v50 = *(void **)(a1 + 40);
              if (v50) {
                id v50 = (void *)v50[4];
              }
              uint64_t v51 = v50;
              uint64_t v52 = [v51 supportedBands];
              objc_msgSend(v46, "setPeerBandInformation:", objc_msgSend(v52, "unsignedCharValue"));

              [v13 setFastDiscoveryConfiguration:v46];
            }
          }
          uint64_t v53 = *(void **)(a1 + 40);
          if (v53) {
            uint64_t v53 = (void *)v53[2];
          }
          v54 = v53;
          sub_100016878(*(void *)(a1 + 32), v54);

          id v55 = [objc_alloc((Class)WiFiAwarePublisher) initWithConfiguration:v13];
          uint64_t v56 = *(void *)(a1 + 32);
          if (v56) {
            objc_storeStrong((id *)(v56 + 48), v55);
          }

          uint64_t v57 = *(void *)(a1 + 32);
          if (v57) {
            id v58 = *(void **)(v57 + 48);
          }
          else {
            id v58 = 0;
          }
          objc_msgSend(v58, "setDelegate:");
          sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[WifiP2PController startPublisherWithConfiguration:completionHandler:]_block_invoke", 282, *(void **)(a1 + 32), @"Starting P2P publisher", v59, v60, v99);
          uint64_t v61 = *(void *)(a1 + 32);
          if (v61) {
            id v62 = *(void **)(v61 + 48);
          }
          else {
            id v62 = 0;
          }
          [v62 start];
          uint64_t v63 = *(void *)(a1 + 32);
          if (v63) {
            *(unsigned char *)(v63 + 8) = 1;
          }
          uint64_t v64 = *(void *)(a1 + 48);
          if (!v64) {
            goto LABEL_46;
          }
          id v65 = *(void (**)(void))(v64 + 16);
LABEL_45:
          v65();
LABEL_46:

          goto LABEL_47;
        }
      }
    }
    v86 = *(void **)(a1 + 40);
    if (v86) {
      v86 = (void *)v86[3];
    }
    v87 = v86;
    v88 = [v87 datapathPmk];
    if ([v88 length])
    {
      v89 = *(void **)(a1 + 40);
      if (v89) {
        v89 = (void *)v89[3];
      }
      v90 = v89;
      v91 = [v90 datapathPmkID];
      id v92 = [v91 length];

      if (v92)
      {
        sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[WifiP2PController startPublisherWithConfiguration:completionHandler:]_block_invoke", 233, *(void **)(a1 + 32), @"Enabling explicit PMK", v93, v94, v99);
        id v95 = objc_alloc((Class)WiFiAwarePublishDatapathSecurityConfiguration);
        v96 = *(void **)(a1 + 40);
        if (v96) {
          v96 = (void *)v96[3];
        }
        id v23 = v96;
        id v25 = [v23 datapathPmk];
        v97 = *(void **)(a1 + 40);
        if (v97) {
          v97 = (void *)v97[3];
        }
        id v26 = v97;
        id v27 = [v26 datapathPmkID];
        id v28 = [v95 initWithPMK:v25 andPMKID:v27];
        goto LABEL_12;
      }
    }
    else
    {
    }
    id v29 = 0;
    goto LABEL_13;
  }
  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[WifiP2PController startPublisherWithConfiguration:completionHandler:]_block_invoke", 197, v9, @"Publisher has previously started", a7, a8, v98);
  uint64_t v10 = *(void *)(a1 + 48);
  id v11 = +[NSError errorWithDomain:@"WifiDomain" code:1 userInfo:0];
  v103[0] = NSLocalizedDescriptionKey;
  v103[1] = NSUnderlyingErrorKey;
  v104[0] = @"Wifi specific error";
  v104[1] = v11;
  uint64_t v12 = +[NSDictionary dictionaryWithObjects:v104 forKeys:v103 count:2];
  id v13 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:12 userInfo:v12];

  (*(void (**)(uint64_t, id))(v10 + 16))(v10, v13);
LABEL_47:
}

void sub_100016528(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 40), a2);
  }
}

uint64_t sub_100016538(void *a1, int a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a3;
  id v12 = a4;
  if (a1)
  {
    id v13 = [ISOKey alloc];
    id v14 = [v12 publicKey];
    id v15 = sub_10000AE6C(v13, v14);

    id v51 = 0;
    uint64_t v16 = sub_10000B2DC((uint64_t)ISOKey, v11, v15, 0, &v51);
    id v17 = v51;
    if (v17)
    {
      uint64_t v20 = v17;
      sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[WifiP2PController _derviveWifiKeysAsPublisher:transportKey:peerDHInfo:outPMK:outPMkId:]", 405, a1, @"Share secret compute failed: %@", v18, v19, (uint64_t)v17);
      unsigned __int8 v52 = 0;
    }
    else
    {
      id v47 = a5;
      id v50 = 0;
      uint64_t v21 = sub_10000B850((uint64_t)ISOKey, v16, 0, 0, &v50);
      id v22 = v50;
      if (v22)
      {
        uint64_t v20 = v22;
        sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[WifiP2PController _derviveWifiKeysAsPublisher:transportKey:peerDHInfo:outPMK:outPMkId:]", 414, a1, @"Sym key hash generation failed: %@", v23, v24, (uint64_t)v22);
        unsigned __int8 v52 = 0;
      }
      else
      {
        uint64_t v42 = a6;
        id v25 = [@"OWE Key Generation" dataUsingEncoding:4];
        if (a2) {
          uint64_t v26 = (uint64_t)v11;
        }
        else {
          uint64_t v26 = (uint64_t)v15;
        }
        if (a2) {
          uint64_t v27 = (uint64_t)v15;
        }
        else {
          uint64_t v27 = (uint64_t)v11;
        }
        uint64_t v28 = sub_10000B01C(v26);
        uint64_t v29 = sub_10000B01C(v27);
        id v46 = (void *)v28;
        id v30 = [objc_alloc((Class)NSMutableData) initWithData:v28];
        id v45 = (void *)v29;
        [v30 appendData:v29];
        v49[0] = [v12 publicKeyGroup];
        v49[1] = (unsigned __int16)[v12 publicKeyGroup] >> 8;
        [v30 appendBytes:v49 length:2];
        id v48 = 0;
        uint64_t v43 = v25;
        id v44 = v21;
        uint64_t v31 = sub_10000BB00((uint64_t)ISOKey, v21, v30, v25, 0, 32, &v48);
        id v32 = v48;
        uint64_t v20 = v32;
        if (v32) {
          BOOL v35 = 1;
        }
        else {
          BOOL v35 = v31 == 0;
        }
        char v36 = !v35;
        if (v35)
        {
          sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[WifiP2PController _derviveWifiKeysAsPublisher:transportKey:peerDHInfo:outPMK:outPMkId:]", 436, a1, @"HKDF error: %@", v33, v34, (uint64_t)v32);
        }
        else
        {
          void *v47 = v31;
          id v37 = [objc_alloc((Class)NSMutableData) initWithData:v46];
          [v37 appendData:v45];
          sub_10000B190((uint64_t)ISOKey, v37, 0);
          uint64_t v39 = v38 = v36;
          objc_msgSend(v39, "subdataWithRange:", 0, 16);
          *uint64_t v42 = (id)objc_claimAutoreleasedReturnValue();

          char v36 = v38;
        }
        unsigned __int8 v52 = v36;

        uint64_t v21 = v44;
      }
    }
    uint64_t v40 = v52;
  }
  else
  {
    uint64_t v40 = 0;
  }

  return v40;
}

void sub_100016878(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 24), a2);
  }
}

void sub_100016888(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (a1)
  {
    uint64_t v8 = *(NSObject **)(a1 + 88);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100016950;
    block[3] = &unk_100054D30;
    void block[4] = a1;
    id v11 = v6;
    id v10 = v5;
    dispatch_async(v8, block);
  }
}

void sub_100016950(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = (unsigned char *)a1[4];
  if (v9 && v9[9])
  {
    sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[WifiP2PController startSubscriberWithConfiguration:completionHandler:]_block_invoke", 294, v9, @"Subscribed has previously started...", a7, a8, v67);
    uint64_t v10 = a1[6];
    NSErrorUserInfoKey v70 = NSLocalizedDescriptionKey;
    uint64_t v71 = off_100066160;
    id v11 = +[NSDictionary dictionaryWithObjects:&v71 forKeys:&v70 count:1];
    id v12 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:2 userInfo:v11];

    (*(void (**)(uint64_t, id))(v10 + 16))(v10, v12);
    goto LABEL_46;
  }
  id v13 = objc_alloc((Class)WiFiAwareSubscribeConfiguration);
  id v14 = (void *)a1[5];
  if (v14) {
    id v14 = (void *)v14[2];
  }
  id v15 = v14;
  id v12 = [v13 initWithServiceName:v15];

  [v12 setAuthenticationType:0];
  uint64_t v16 = (void *)a1[5];
  if (v16) {
    uint64_t v16 = (void *)v16[4];
  }
  id v17 = v16;

  if (v17)
  {
    uint64_t v19 = (void *)a1[4];
    uint64_t v18 = (void *)a1[5];
    if (v18) {
      uint64_t v18 = (void *)v18[4];
    }
    uint64_t v20 = v18;
    sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[WifiP2PController startSubscriberWithConfiguration:completionHandler:]_block_invoke", 304, v19, @"%@", v21, v22, (uint64_t)v20);

    id v23 = objc_alloc_init((Class)WiFiAwareFastDiscoveryConfiguration);
    uint64_t v24 = (void *)a1[5];
    if (v24) {
      uint64_t v24 = (void *)v24[4];
    }
    id v25 = v24;
    uint64_t v26 = [v25 channelNumber];
    [v23 setInstantCommunicationChannel:v26];

    uint64_t v27 = (void *)a1[5];
    if (v27) {
      uint64_t v27 = (void *)v27[4];
    }
    uint64_t v28 = v27;
    uint64_t v29 = [v28 supportedBands];
    objc_msgSend(v23, "setPeerBandInformation:", objc_msgSend(v29, "unsignedCharValue"));

    [v12 setFastDiscoveryConfiguration:v23];
  }
  id v30 = (void *)a1[5];
  if (v30) {
    id v30 = (void *)v30[2];
  }
  uint64_t v31 = v30;
  sub_100016878(a1[4], v31);

  id v32 = [objc_alloc((Class)WiFiAwareSubscriber) initWithConfiguration:v12];
  uint64_t v33 = a1[4];
  if (v33) {
    objc_storeStrong((id *)(v33 + 64), v32);
  }

  uint64_t v34 = a1[4];
  if (v34) {
    BOOL v35 = *(void **)(v34 + 64);
  }
  else {
    BOOL v35 = 0;
  }
  objc_msgSend(v35, "setDelegate:");
  char v36 = (void *)a1[5];
  if (v36) {
    char v36 = (void *)v36[6];
  }
  id v37 = v36;
  sub_100016528(a1[4], v37);

  char v38 = (void *)a1[5];
  if (v38) {
    char v38 = (void *)v38[3];
  }
  uint64_t v39 = v38;
  sub_100016EA4(a1[4], v39);

  uint64_t v42 = a1[5];
  if (v42)
  {
    id v43 = *(id *)(v42 + 40);
    if (v43)
    {
      id v44 = v43;
      uint64_t v45 = a1[5];
      if (v45)
      {
        id v46 = *(id *)(v45 + 48);
        if (v46)
        {
          id v47 = v46;
          id v48 = (void *)a1[5];
          if (v48) {
            id v48 = (void *)v48[3];
          }
          uint64_t v49 = v48;

          if (v49) {
            goto LABEL_40;
          }
          sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[WifiP2PController startSubscriberWithConfiguration:completionHandler:]_block_invoke", 321, (void *)a1[4], @"Derive PMK from peer DH info", v40, v41, v67);
          id v51 = (void *)a1[4];
          id v50 = (void *)a1[5];
          if (v50) {
            id v50 = (void *)v50[5];
          }
          unsigned __int8 v52 = v50;
          uint64_t v53 = (void *)a1[4];
          if (v53) {
            uint64_t v53 = (void *)v53[5];
          }
          id v68 = 0;
          id v69 = 0;
          v54 = v53;
          int v55 = sub_100016538(v51, 0, v52, v54, &v69, &v68);
          id v44 = v69;
          id v56 = v68;

          if (!v55)
          {
            sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[WifiP2PController startSubscriberWithConfiguration:completionHandler:]_block_invoke", 330, (void *)a1[4], @"Security info derivation failed", v57, v58, v67);
            uint64_t v64 = a1[6];
            NSErrorUserInfoKey v70 = NSLocalizedDescriptionKey;
            uint64_t v71 = off_100066198;
            id v65 = +[NSDictionary dictionaryWithObjects:&v71 forKeys:&v70 count:1];
            uint64_t v66 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:9 userInfo:v65];

            (*(void (**)(uint64_t, void *))(v64 + 16))(v64, v66);
            goto LABEL_46;
          }
          uint64_t v59 = [[STSCHWiFiAwareSecurityInfo alloc] initWithPMK:v44 pmkID:v56];
          sub_100016EA4(a1[4], v59);
        }
      }
    }
  }
LABEL_40:
  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[WifiP2PController startSubscriberWithConfiguration:completionHandler:]_block_invoke", 337, (void *)a1[4], @"Starting P2P subscriber", v40, v41, v67);
  uint64_t v60 = a1[4];
  if (v60) {
    uint64_t v61 = *(void **)(v60 + 64);
  }
  else {
    uint64_t v61 = 0;
  }
  [v61 start];
  uint64_t v62 = a1[4];
  if (v62) {
    *(unsigned char *)(v62 + 9) = 1;
  }
  uint64_t v63 = a1[6];
  if (v63) {
    (*(void (**)(uint64_t, void))(v63 + 16))(v63, 0);
  }
LABEL_46:
}

void sub_100016EA4(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

void sub_100016EB4(uint64_t a1)
{
  if (a1)
  {
    dispatch_queue_t v1 = *(NSObject **)(a1 + 88);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100016F30;
    block[3] = &unk_1000549A8;
    void block[4] = a1;
    dispatch_async(v1, block);
  }
}

void sub_100016F30(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2) {
    goto LABEL_20;
  }
  if (*(unsigned char *)(v2 + 8))
  {
    uint64_t v3 = *(void *)(v2 + 56);
    if (v3
      && (id v4 = *(id *)(v2 + 48),
          [v4 terminateDataSession:v3 completionHandler:0],
          v4,
          (uint64_t v2 = *(void *)(a1 + 32)) == 0))
    {
      id v5 = 0;
    }
    else
    {
      id v5 = *(void **)(v2 + 48);
    }
    [v5 stop];
    uint64_t v6 = *(void *)(a1 + 32);
    if (!v6) {
      goto LABEL_20;
    }
    *(unsigned char *)(v6 + 8) = 0;
    uint64_t v2 = *(void *)(a1 + 32);
    if (!v2) {
      goto LABEL_20;
    }
  }
  if (*(unsigned char *)(v2 + 10))
  {
    [*(id *)(v2 + 72) stop];
    uint64_t v7 = *(void *)(a1 + 32);
    if (!v7) {
      goto LABEL_20;
    }
    *(unsigned char *)(v7 + 10) = 0;
    uint64_t v2 = *(void *)(a1 + 32);
    if (!v2) {
      goto LABEL_20;
    }
  }
  if (!*(unsigned char *)(v2 + 9)
    || ([*(id *)(v2 + 64) stop], (uint64_t v8 = *(void *)(a1 + 32)) != 0)
    && (*(unsigned char *)(v8 + 9) = 0, (uint64_t v2 = *(void *)(a1 + 32)) != 0))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 16));
  }
  else
  {
LABEL_20:
    id WeakRetained = 0;
  }
  id v10 = WeakRetained;
  if (objc_opt_respondsToSelector()) {
    [v10 wifiP2PControllerDidStop];
  }
  sub_100016EA4(*(void *)(a1 + 32), 0);
  sub_100016528(*(void *)(a1 + 32), 0);
}

WifiP2PControllerProperties *sub_100017060()
{
  self;
  uint64_t v3 = +[WiFiAwareDeviceCapabilities currentDeviceCapabilities];
  if (v3)
  {
    id v4 = objc_alloc_init(WifiP2PControllerProperties);
    id v5 = [v3 operatingChannel];
    uint64_t v6 = v5;
    if (v4)
    {
      objc_storeStrong((id *)&v4->_operatingChannel, v5);

      v4->_supportedBandsBitmap = [v3 supportedBands];
      uint64_t v7 = [v3 supportedCipherSuites];
      objc_storeStrong((id *)&v4->_supportedCiphterSuites, v7);

      v4->_operatingClass = 81;
    }
    else
    {

      [v3 supportedBands];
      [v3 supportedCipherSuites];
    }
  }
  else
  {
    sub_100026000(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"+[WifiP2PController hardwareProperties]", 378, @"Capabilities not available", v0, v1, v2, v9);
    id v4 = 0;
  }

  return v4;
}

uint64_t sub_100017240(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1) {
    *(unsigned char *)(v1 + 10) = 1;
  }
  return result;
}

void sub_100017404(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) ipv6LinkLocalAddress];
  sub_100015708(v2, v3);
  id v24 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v4 = sub_100015808(*(void **)(a1 + 32), (uint64_t)[*(id *)(a1 + 48) localInterfaceIndex]);
  uint64_t v7 = (void *)v4;
  if (v24) {
    BOOL v8 = v4 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[WifiP2PController dataSession:confirmedForPeerDataAddress:serviceSpecificInfo:]_block_invoke", 475, *(void **)(a1 + 32), @"Can't establish datapath, stopping data set session", v5, v6, v23);
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      id v10 = *(void **)(v9 + 72);
    }
    else {
      id v10 = 0;
    }
    [v10 stop];
  }
  else
  {
    uint64_t v11 = +[NSString stringWithFormat:@"%@%%%@", v24, v4];
    id v13 = (void *)v11;
    id v14 = *(void **)(a1 + 32);
    if (v14) {
      objc_setProperty_nonatomic_copy(v14, v12, v13, 80);
    }

    uint64_t v17 = *(void *)(a1 + 32);
    if (v17) {
      id WeakRetained = objc_loadWeakRetained((id *)(v17 + 16));
    }
    else {
      id WeakRetained = 0;
    }
    uint64_t v19 = *(void **)(a1 + 56);
    if (v19)
    {
      uint64_t v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%d", [v19 servicePort]);
    }
    else
    {
      uint64_t v20 = 0;
    }
    sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[WifiP2PController dataSession:confirmedForPeerDataAddress:serviceSpecificInfo:]_block_invoke", 487, *(void **)(a1 + 32), @"MAC=%@, interface=%@, IPv6 Addr=%@, port=%@", v15, v16, (uint64_t)v24);
    uint64_t v21 = *(void *)(a1 + 32);
    if (v21) {
      uint64_t v22 = *(void *)(v21 + 80);
    }
    else {
      uint64_t v22 = 0;
    }
    [WeakRetained wifiP2PController:v21 didConnectTo:v22 port:v20];
  }
}

uint64_t sub_1000176C4(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1) {
    *(unsigned char *)(v1 + 10) = 0;
  }
  return result;
}

void sub_1000177C0(uint64_t a1, const char *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3
    && (*(unsigned char *)(v3 + 10) = 0, (uint64_t v4 = *(void **)(a1 + 32)) != 0)
    && (objc_setProperty_nonatomic_copy(v4, a2, 0, 80), (uint64_t v5 = *(void *)(a1 + 32)) != 0))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v5 + 16));
    uint64_t v7 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v7 = 0;
    id WeakRetained = 0;
  }
  BOOL v8 = +[NSString stringWithFormat:@"termination reason=%ld", *(void *)(a1 + 40)];
  CFStringRef v15 = @"P2PError";
  uint64_t v16 = v8;
  uint64_t v9 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  id v10 = +[NSError errorWithDomain:@"WifiDomain" code:2 userInfo:v9];

  NSErrorUserInfoKey v13 = NSUnderlyingErrorKey;
  id v14 = v10;
  uint64_t v11 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  id v12 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:12 userInfo:v11];

  [WeakRetained wifiP2PControllerDidDisconnect:v7 error:v12];
}

void sub_100017A50(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 16));
  }
  else {
    id WeakRetained = 0;
  }
  id v4 = WeakRetained;
  if (objc_opt_respondsToSelector()) {
    [v4 wifiP2PController:*(void *)(a1 + 32) didStart:0];
  }
}

void sub_100017BB4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    uint64_t v3 = *(void **)(v2 + 48);
  }
  else {
    uint64_t v3 = 0;
  }
  [v3 stop];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4 && (*(unsigned char *)(v4 + 8) = 0, (uint64_t v5 = *(void *)(a1 + 32)) != 0)) {
    id WeakRetained = objc_loadWeakRetained((id *)(v5 + 16));
  }
  else {
    id WeakRetained = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v7 = *(void *)(a1 + 32);
    BOOL v8 = +[NSString stringWithFormat:@"error=%ld", *(void *)(a1 + 40)];
    CFStringRef v15 = @"P2PError";
    uint64_t v16 = v8;
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    id v10 = +[NSError errorWithDomain:@"WifiDomain" code:2 userInfo:v9];

    NSErrorUserInfoKey v13 = NSUnderlyingErrorKey;
    id v14 = v10;
    uint64_t v11 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    id v12 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:12 userInfo:v11];

    [WeakRetained wifiP2PController:v7 didStart:v12];
  }
}

uint64_t sub_100017E58(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1) {
    *(unsigned char *)(v1 + 8) = 0;
  }
  return result;
}

void sub_1000180A8(uint64_t a1)
{
  sub_100018290(*(void *)(a1 + 32), *(void **)(a1 + 40));
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) initiatorDataAddress];
  uint64_t v4 = [v3 ipv6LinkLocalAddress];
  sub_100015708(v2, v4);
  id v25 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v5 = sub_100015808(*(void **)(a1 + 32), *(unsigned int *)(a1 + 56));
  BOOL v8 = (void *)v5;
  if (v25) {
    BOOL v9 = v5 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[WifiP2PController publisher:dataConfirmedForHandle:localInterfaceIndex:serviceSpecificInfo:]_block_invoke", 585, *(void **)(a1 + 32), @"Can't establish datapath, force terminate", v6, v7, v24);
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10) {
      uint64_t v11 = *(void **)(v10 + 48);
    }
    else {
      uint64_t v11 = 0;
    }
    [v11 terminateDataSession:*(void *)(a1 + 40) completionHandler:0];
  }
  else
  {
    uint64_t v12 = +[NSString stringWithFormat:@"%@%%%@", v25, v5];
    id v14 = (void *)v12;
    CFStringRef v15 = *(void **)(a1 + 32);
    if (v15) {
      objc_setProperty_nonatomic_copy(v15, v13, v14, 80);
    }

    uint64_t v18 = *(void *)(a1 + 32);
    if (v18) {
      id WeakRetained = objc_loadWeakRetained((id *)(v18 + 16));
    }
    else {
      id WeakRetained = 0;
    }
    uint64_t v20 = *(void **)(a1 + 48);
    if (v20)
    {
      uint64_t v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%d", [v20 servicePort]);
    }
    else
    {
      uint64_t v21 = 0;
    }
    sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[WifiP2PController publisher:dataConfirmedForHandle:localInterfaceIndex:serviceSpecificInfo:]_block_invoke", 596, *(void **)(a1 + 32), @"MAC=%@, interface=%@, IPv6 Addr=%@, port=%@", v16, v17, (uint64_t)v25);
    uint64_t v22 = *(void *)(a1 + 32);
    if (v22) {
      uint64_t v23 = *(void *)(v22 + 80);
    }
    else {
      uint64_t v23 = 0;
    }
    [WeakRetained wifiP2PController:v22 didConnectTo:v23 port:v21];
  }
}

void sub_100018290(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

void sub_100018398(uint64_t a1, const char *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_setProperty_nonatomic_copy(v3, a2, 0, 80);
    uint64_t v3 = *(void **)(a1 + 32);
  }
  sub_100018290((uint64_t)v3, 0);
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v4 + 16));
    uint64_t v6 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v6 = 0;
    id WeakRetained = 0;
  }
  uint64_t v7 = +[NSString stringWithFormat:@"termination reason=%ld", *(void *)(a1 + 40)];
  CFStringRef v14 = @"P2PError";
  CFStringRef v15 = v7;
  BOOL v8 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  BOOL v9 = +[NSError errorWithDomain:@"WifiDomain" code:2 userInfo:v8];

  NSErrorUserInfoKey v12 = NSUnderlyingErrorKey;
  NSErrorUserInfoKey v13 = v9;
  uint64_t v10 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  uint64_t v11 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:12 userInfo:v10];

  [WeakRetained wifiP2PControllerDidDisconnect:v6 error:v11];
}

void sub_1000186F4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2 && (*(unsigned char *)(v2 + 9) = 0, (uint64_t v3 = *(void *)(a1 + 32)) != 0)) {
    id WeakRetained = objc_loadWeakRetained((id *)(v3 + 16));
  }
  else {
    id WeakRetained = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = +[NSString stringWithFormat:@"error=%ld", *(void *)(a1 + 40)];
    CFStringRef v13 = @"P2PError";
    CFStringRef v14 = v6;
    uint64_t v7 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    BOOL v8 = +[NSError errorWithDomain:@"WifiDomain" code:2 userInfo:v7];

    NSErrorUserInfoKey v11 = NSUnderlyingErrorKey;
    NSErrorUserInfoKey v12 = v8;
    BOOL v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
    uint64_t v10 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:12 userInfo:v9];

    [WeakRetained wifiP2PController:v5 didStart:v10];
  }
}

void sub_100018984(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1 && *(unsigned char *)(v1 + 10))
  {
    [*(id *)(v1 + 72) stop];
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4
      && (*(unsigned char *)(v4 + 10) = 0, (uint64_t v5 = *(void **)(a1 + 32)) != 0)
      && (objc_setProperty_nonatomic_copy(v5, v3, 0, 80), (uint64_t v6 = *(void *)(a1 + 32)) != 0))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v6 + 16));
      uint64_t v8 = *(void *)(a1 + 32);
    }
    else
    {
      uint64_t v8 = 0;
      id WeakRetained = 0;
    }
    BOOL v9 = +[NSError errorWithDomain:@"WifiDomain" code:0 userInfo:0];
    v12[0] = NSLocalizedDescriptionKey;
    v12[1] = NSUnderlyingErrorKey;
    v13[0] = @"Wifi specific error";
    v13[1] = v9;
    uint64_t v10 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
    NSErrorUserInfoKey v11 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:12 userInfo:v10];

    [WeakRetained wifiP2PControllerDidDisconnect:v8 error:v11];
  }
}

uint64_t sub_100018CFC(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1) {
    *(unsigned char *)(v1 + 9) = 0;
  }
  return result;
}

unsigned char *sub_100018DAC(unsigned char *result, char a2)
{
  if (result)
  {
    v3.receiver = result;
    v3.super_class = (Class)ISOPeripheral;
    Class result = objc_msgSendSuper2(&v3, "initWithWorkQueue:callbackQueue:");
    if (result) {
      result[136] = a2;
    }
  }
  return result;
}

id sub_100018E08(id result, uint64_t a2)
{
  if (result)
  {
    v2.receiver = result;
    v2.super_class = (Class)ISOPeripheral;
    return objc_msgSendSuper2(&v2, "writeData:toUUID:", a2, @"00000003-A123-48CE-896B-4C76973373E6");
  }
  return result;
}

HTTPServerProtocolH1 *sub_100019284(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  id v8 = a3;
  id v9 = a2;
  self;
  uint64_t v10 = [HTTPServerProtocolH1 alloc];
  id v11 = v9;
  id v12 = v8;
  id v13 = v7;
  if (v10)
  {
    v16.receiver = v10;
    v16.super_class = (Class)HTTPServerProtocolH1;
    CFStringRef v14 = (HTTPServerProtocolH1 *)objc_msgSendSuper2(&v16, "init");
    uint64_t v10 = v14;
    if (v14)
    {
      objc_storeWeak((id *)&v14->_connectionHandle, v11);
      objc_storeWeak((id *)&v10->_responseHandler, v12);
      objc_storeStrong((id *)&v10->_workQueue, a4);
    }
  }

  return v10;
}

void sub_100019394(void *a1)
{
  if (a1)
  {
    objc_super v2 = (void *)a1[6];
    a1[6] = 0;

    a1[7] = 0;
    objc_super v3 = a1[3];
    if (v3 && dispatch_data_get_size(v3))
    {
      sub_10001942C((uint64_t)a1);
    }
    else
    {
      sub_10001990C((uint64_t)a1);
    }
  }
}

void sub_10001942C(uint64_t a1)
{
  if (!a1) {
    return;
  }
  objc_super v2 = *(NSObject **)(a1 + 24);
  if (!v2 || !dispatch_data_get_size(v2)) {
    goto LABEL_27;
  }
  id v3 = *(id *)(a1 + 48);
  if (!v3 || (uint64_t v4 = *(void *)(a1 + 56), v3, v4 < 1))
  {
    buffer_ptr = 0;
    size_t size_ptr = 0;
    dispatch_data_t v5 = dispatch_data_create_map(*(dispatch_data_t *)(a1 + 24), (const void **)&buffer_ptr, &size_ptr);
    uint64_t v6 = +[NSData dataWithBytesNoCopy:buffer_ptr length:size_ptr freeWhenDone:0];
    id v7 = [@"\r\n\r\n" dataUsingEncoding:4];
    id v8 = objc_msgSend(v6, "rangeOfData:options:range:", v7, 0, 0, objc_msgSend(v6, "length"));
    uint64_t v10 = v9;

    if (v8 == (id)0x7FFFFFFFFFFFFFFFLL && !v10)
    {

      goto LABEL_27;
    }
    id v11 = objc_alloc((Class)NSString);
    size_t v12 = (size_t)v8 + v10;
    id v13 = objc_msgSend(v6, "subdataWithRange:", 0, v12);
    id v14 = [v11 initWithData:v13 encoding:4];

    int64_t v15 = (int64_t)[v6 length] - v12;
    objc_super v16 = *(NSObject **)(a1 + 24);
    if (v15 < 1)
    {
      dispatch_data_t subrange = 0;
    }
    else
    {
      dispatch_data_t subrange = dispatch_data_create_subrange(v16, v12, v15);
      objc_super v16 = *(NSObject **)(a1 + 24);
    }
    *(void *)(a1 + 24) = subrange;

    block = _NSConcreteStackBlock;
    uint64_t v43 = 3221225472;
    id v44 = sub_100019F74;
    uint64_t v45 = &unk_100054DD0;
    uint64_t v46 = a1;
    [v14 enumerateLinesUsingBlock:&block];
    uint64_t v18 = [*(id *)(a1 + 48) valueForHTTPHeaderField:@"Content-Length"];
    uint64_t v19 = v18;
    if (v18)
    {
      *(void *)(a1 + 56) = [v18 integerValue];
    }
    else
    {
      uint64_t v20 = [*(id *)(a1 + 48) valueForHTTPHeaderField:@"Connection"];
      id v21 = [v20 caseInsensitiveCompare:@"close"];

      if (v21) {
        *(void *)(a1 + 56) = 0;
      }
      else {
        *(void *)(a1 + 56) = -1;
      }
    }
  }
  if (!*(void *)(a1 + 48)) {
    goto LABEL_27;
  }
  uint64_t v22 = *(NSObject **)(a1 + 56);
  if (v22 == -1)
  {
    if (*(unsigned char *)(a1 + 8))
    {
      uint64_t v29 = *(id *)(a1 + 24);
      goto LABEL_31;
    }
LABEL_27:
    if (!*(unsigned char *)(a1 + 8))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));

      if (WeakRetained)
      {
        uint64_t v31 = *(NSObject **)(a1 + 40);
        v41[0] = (uint64_t)_NSConcreteStackBlock;
        v41[1] = 3221225472;
        v41[2] = (uint64_t)sub_100019F6C;
        v41[3] = (uint64_t)&unk_1000549A8;
        v41[4] = a1;
        dispatch_async(v31, v41);
      }
    }
    return;
  }
  if (!v22)
  {
LABEL_34:
    uint64_t v34 = 0;
    goto LABEL_35;
  }
  uint64_t v23 = *(NSObject **)(a1 + 24);
  if (!v23 || dispatch_data_get_size(v23) < (unint64_t)v22) {
    goto LABEL_27;
  }
  uint64_t v24 = *(NSObject **)(a1 + 24);
  if ((unint64_t)v22 > dispatch_data_get_size(v24))
  {
    uint64_t v22 = dispatch_data_create_subrange(v24, 0, (size_t)v22);
    id v25 = *(NSObject **)(a1 + 24);
    size_t v26 = *(void *)(a1 + 56);
    size_t size = dispatch_data_get_size(v25);
    dispatch_data_t v28 = dispatch_data_create_subrange(v25, v26, size - v26);
    goto LABEL_32;
  }
  uint64_t v29 = v24;
LABEL_31:
  uint64_t v22 = v29;
  dispatch_data_t v28 = 0;
LABEL_32:
  id v32 = *(void **)(a1 + 24);
  *(void *)(a1 + 24) = v28;

  if (!v22) {
    goto LABEL_34;
  }
  buffer_ptr = 0;
  size_t size_ptr = 0;
  dispatch_data_t v33 = dispatch_data_create_map(v22, (const void **)&buffer_ptr, &size_ptr);
  uint64_t v34 = +[NSData dataWithBytes:buffer_ptr length:size_ptr];

LABEL_35:
  [*(id *)(a1 + 48) setHTTPBody:v34];
  id v35 = objc_loadWeakRetained((id *)(a1 + 32));
  id v36 = objc_loadWeakRetained((id *)(a1 + 16));
  if (objc_opt_respondsToSelector())
  {
    [v35 processRequest:*(void *)(a1 + 48) connection:v36];
  }
  else if (objc_opt_respondsToSelector())
  {
    uint64_t v39 = [v35 responseForRequest:*(void *)(a1 + 48)];
    sub_1000199CC(a1, v39, 0);
  }
  else
  {
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[HTTPServerProtocolH1 _requestFinish]", 173, (void *)a1, @"Unexpected state; dropping input",
      v37,
      v38,
      v41[0]);
    if (!*(unsigned char *)(a1 + 8) && v36)
    {
      uint64_t v40 = *(NSObject **)(a1 + 40);
      block = _NSConcreteStackBlock;
      uint64_t v43 = 3221225472;
      id v44 = sub_100019A9C;
      uint64_t v45 = &unk_1000549A8;
      uint64_t v46 = a1;
      dispatch_async(v40, &block);
    }
  }
}

void sub_10001990C(uint64_t a1)
{
  if (a1)
  {
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 16));
    id v3 = WeakRetained;
    if (WeakRetained)
    {
      if (!*(unsigned char *)(a1 + 8))
      {
        uint64_t v4 = WeakRetained[2];
        completion[0] = _NSConcreteStackBlock;
        completion[1] = 3221225472;
        completion[2] = sub_10001A1D0;
        completion[3] = &unk_100054DF8;
        completion[4] = a1;
        nw_connection_receive(v4, 1u, 0x203A0u, completion);
      }
    }
  }
}

void sub_1000199CC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    sub_100019AA4(a1, v5, v6);
    if (!*(unsigned char *)(a1 + 8))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));

      if (WeakRetained)
      {
        id v8 = *(NSObject **)(a1 + 40);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100019F64;
        block[3] = &unk_1000549A8;
        void block[4] = a1;
        dispatch_async(v8, block);
      }
    }
  }
}

uint64_t sub_100019A9C(uint64_t a1)
{
  return sub_100019394(*(void *)(a1 + 32));
}

void sub_100019AA4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 16));
    id v8 = WeakRetained;
    if (WeakRetained)
    {
      uint64_t v42 = WeakRetained;
      uint64_t v43 = v6;
      id v44 = v5;
      id v9 = v5;
      uint64_t v10 = [v9 response];
      id v11 = [v10 statusCode];
      size_t v12 = [v9 response];
      id v13 = +[NSHTTPURLResponse localizedStringForStatusCode:](NSHTTPURLResponse, "localizedStringForStatusCode:", [v12 statusCode]);
      id v14 = +[NSString stringWithFormat:@"HTTP/1.1 %ld %@\r\n", v11, v13];

      uint64_t v41 = v14;
      int64_t v15 = [v14 dataUsingEncoding:4];
      id v45 = [v15 _createDispatchData];

      objc_super v16 = [v9 response];
      uint64_t v17 = [v16 allHeaderFields];

      uint64_t v18 = +[NSMutableString string];
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v19 = v17;
      id v20 = [v19 countByEnumeratingWithState:&v50 objects:v49 count:16];
      if (v20)
      {
        id v21 = v20;
        uint64_t v22 = *(void *)v51;
        do
        {
          for (i = 0; i != v21; i = (char *)i + 1)
          {
            if (*(void *)v51 != v22) {
              objc_enumerationMutation(v19);
            }
            uint64_t v24 = *(void *)(*((void *)&v50 + 1) + 8 * i);
            id v25 = [v19 objectForKeyedSubscript:v24];
            [v18 appendFormat:@"%@: %@\r\n", v24, v25];
          }
          id v21 = [v19 countByEnumeratingWithState:&v50 objects:v49 count:16];
        }
        while (v21);
      }

      [v18 appendFormat:@"\r\n"];
      size_t v26 = v45;
      uint64_t v27 = [v18 dataUsingEncoding:4];
      dispatch_data_t v28 = [v27 _createDispatchData];

      concat = dispatch_data_create_concat(v26, v28);
      if ([v9 bodyType] == (id)1)
      {
        id v30 = concat;

        uint64_t v31 = [v9 bodyData];
        id v32 = [v31 _createDispatchData];

        concat = dispatch_data_create_concat(v30, v32);
        size_t v26 = v30;
      }
      else
      {
        [v9 bodyType];
      }

      if (*(unsigned char *)(a1 + 8)) {
        BOOL v34 = *(void *)(a1 + 24) == 0;
      }
      else {
        BOOL v34 = 0;
      }
      id v6 = v43;
      id v5 = v44;
      id v8 = v42;
      id v35 = [v9 response];
      id v36 = [v35 allHeaderFields];

      uint64_t v37 = [v36 objectForKeyedSubscript:@"Connection"];
      uint64_t v38 = v37;
      if (v34)
      {
        BOOL v39 = 1;
      }
      else if (v37)
      {
        BOOL v39 = [v37 caseInsensitiveCompare:@"close"] == 0;
      }
      else
      {
        BOOL v39 = 0;
      }
      uint64_t v40 = v42[2];
      completion[0] = _NSConcreteStackBlock;
      completion[1] = 3221225472;
      completion[2] = sub_10001A2A8;
      completion[3] = &unk_100054E20;
      BOOL v48 = v39;
      completion[4] = a1;
      void completion[5] = v42;
      id v47 = v43;
      nw_connection_send(v40, concat, _nw_content_context_default_stream, v39, completion);
    }
    else
    {
      if (!v6)
      {
LABEL_25:

        goto LABEL_26;
      }
      *(void *)&long long v50 = NSLocalizedDescriptionKey;
      v49[0] = off_100066160;
      dispatch_data_t v33 = +[NSDictionary dictionaryWithObjects:v49 forKeys:&v50 count:1];
      concat = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:2 userInfo:v33];

      (*((void (**)(id, void, NSObject *))v6 + 2))(v6, 0, concat);
    }

    goto LABEL_25;
  }
LABEL_26:
}

void sub_100019F64(uint64_t a1)
{
}

void sub_100019F6C(uint64_t a1)
{
}

uint64_t sub_100019F74(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v24 = v3;
  if (v4 && *(void *)(v4 + 48))
  {
    if (![v3 length]) {
      goto LABEL_16;
    }
    id v5 = (char *)[v24 rangeOfString:@":"];
    if (v5 == (char *)0x7FFFFFFFFFFFFFFFLL || v6 != 1) {
      __assert_rtn("-[HTTPServerProtocolH1 _requestParse]_block_invoke", "HTTPServerProtocolH1.m", 313, "delimRange.location != NSNotFound && delimRange.length == 1");
    }
    id v7 = v5;
    id v8 = [v24 substringToIndex:v5];
    id v9 = +[NSCharacterSet whitespaceCharacterSet];
    uint64_t v10 = [v8 stringByTrimmingCharactersInSet:v9];

    id v11 = [v24 substringFromIndex:v7 + 1];
    size_t v12 = +[NSCharacterSet whitespaceCharacterSet];
    id v13 = [v11 stringByTrimmingCharactersInSet:v12];

    uint64_t v14 = *(void *)(a1 + 32);
    if (v14) {
      int64_t v15 = *(void **)(v14 + 48);
    }
    else {
      int64_t v15 = 0;
    }
    [v15 addValue:v13 forHTTPHeaderField:v10];
  }
  else
  {
    objc_super v16 = +[NSCharacterSet whitespaceCharacterSet];
    uint64_t v10 = [v24 componentsSeparatedByCharactersInSet:v16];

    if ([v10 count] != (id)3) {
      __assert_rtn("-[HTTPServerProtocolH1 _requestParse]_block_invoke", "HTTPServerProtocolH1.m", 298, "[pieces count] == 3");
    }
    id v13 = [v10 objectAtIndexedSubscript:0];
    uint64_t v17 = [v10 objectAtIndexedSubscript:1];
    uint64_t v18 = +[NSURL URLWithString:v17];
    id v19 = +[NSMutableURLRequest requestWithURL:v18];
    uint64_t v20 = *(void *)(a1 + 32);
    if (v20) {
      objc_storeStrong((id *)(v20 + 48), v19);
    }

    uint64_t v21 = *(void *)(a1 + 32);
    if (v21) {
      uint64_t v22 = *(void **)(v21 + 48);
    }
    else {
      uint64_t v22 = 0;
    }
    [v22 setHTTPMethod:v13];
  }
LABEL_16:

  return _objc_release_x1();
}

void sub_10001A1D0(uint64_t a1, void *a2, void *a3, int a4, void *a5)
{
  data2 = a2;
  id v9 = a3;
  id v10 = a5;
  if (data2)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    size_t v12 = *(NSObject **)(v11 + 24);
    if (v12)
    {
      dispatch_data_t concat = dispatch_data_create_concat(v12, data2);
      uint64_t v14 = *(void *)(a1 + 32);
      int64_t v15 = *(void **)(v14 + 24);
      *(void *)(v14 + 24) = concat;
    }
    else
    {
      objc_super v16 = data2;
      int64_t v15 = *(void **)(v11 + 24);
      *(void *)(v11 + 24) = v16;
    }
  }
  if (v10 || a4)
  {
    uint64_t v17 = *(void *)(a1 + 32);
    if (v17) {
      *(unsigned char *)(v17 + 8) = 1;
    }
  }
  sub_10001942C(*(void *)(a1 + 32));
}

uint64_t sub_10001A2A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v6 = v3;
  size_t v12 = v3;
  if (v3 || *(unsigned char *)(a1 + 56))
  {
    sub_100025F04(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[HTTPServerProtocolH1 _writeResponse:completion:]_block_invoke", 476, *(void **)(a1 + 32), @"Ending connection, error=%@", v4, v5, (uint64_t)v3);
    id v7 = *(void **)(a1 + 40);
    if (v7) {
      id v7 = (void *)v7[2];
    }
    id v8 = v7;
    nw_connection_cancel(v8);

    uint64_t v6 = v12;
  }
  uint64_t v9 = *(void *)(a1 + 48);
  if (v9)
  {
    if (v6)
    {
      CFErrorRef v10 = nw_error_copy_cf_error(v6);
      uint64_t v9 = *(void *)(a1 + 48);
    }
    else
    {
      CFErrorRef v10 = 0;
    }
    (*(void (**)(uint64_t, void, CFErrorRef))(v9 + 16))(v9, *(void *)(a1 + 40), v10);
  }

  return _objc_release_x1();
}

id sub_10001A3E0(id a1, void *a2)
{
  id v2 = a1;
  if (a1)
  {
    id v3 = a2;
    id v4 = [objc_alloc((Class)NSMutableData) initWithData:v3];

    [v4 appendData:v2];
    id v2 = [v4 copy];
  }

  return v2;
}

uint64_t sub_10001A530(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 12));
    int v8 = *(unsigned __int8 *)(a1 + 8);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 12));
    if (v8)
    {
      sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[BLESender writeData:usingSender:]", 71, (void *)a1, @"Sender already invalidated. ", v9, v10, v20);
LABEL_4:
      a1 = 0;
      goto LABEL_12;
    }
    id v11 = [v6 length];
    sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[BLESender writeData:usingSender:]", 77, (void *)a1, @"LE: writing %lu bytes", v12, v13, (uint64_t)v11);
    objc_storeStrong((id *)(a1 + 40), a2);
    id v14 = objc_retainBlock(v7);
    int64_t v15 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = v14;

    objc_super v16 = sub_1000261A8();
    if (os_signpost_enabled(v16))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "BT_SendData", "", buf, 2u);
    }

    if (*(void *)(a1 + 24))
    {
      sub_10001A75C(a1);
    }
    else if (!*(void *)(a1 + 16) || !sub_10001A9BC(a1))
    {
      id v19 = sub_1000261A8();
      if (os_signpost_enabled(v19))
      {
        *(_WORD *)uint64_t v21 = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "BT_SendData", "Write failure", v21, 2u);
      }

      goto LABEL_4;
    }
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v17 = sub_1000261A8();
    if (os_signpost_enabled(v17))
    {
      *(_WORD *)uint64_t v22 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "BT_SendData", "Success", v22, 2u);
    }

    a1 = 1;
  }
LABEL_12:

  return a1;
}

void sub_10001A75C(uint64_t a1)
{
  id v2 = (os_unfair_lock_s *)(a1 + 12);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 12));
  char v25 = 0;
  int v3 = (unsigned __int16)(*(_WORD *)(a1 + 10) - 1);
  id v4 = sub_10001AE4C(a1, 0, v3, (BOOL *)&v25);
  unint64_t v5 = 0;
  uint64_t v6 = [*(id *)(a1 + 40) length] != 0;
  while (1)
  {
    id v7 = sub_10001AE00(v25);
    int v8 = sub_10001A3E0(v4, v7);

    uint64_t v9 = [*(id *)(a1 + 24) outputStream];
    id v10 = v8;
    id v11 = objc_msgSend(v9, "write:maxLength:", objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"));

    if ((uint64_t)v11 <= 0) {
      break;
    }
    v5 += (unint64_t)[v4 length];
    sub_10001AE4C(a1, v5, v3, (BOOL *)&v25);
    id v23 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v16 = (uint64_t)v23;
    if (v23)
    {
      if (v5 != v6)
      {
        id v4 = v23;
        if (!*(unsigned char *)(a1 + 8)) {
          continue;
        }
      }
    }
    goto LABEL_11;
  }
  if (*(unsigned char *)(a1 + 8))
  {
    uint64_t v17 = @"LE: L2CAP Tx Invalidated";
    os_log_type_t v18 = OS_LOG_TYPE_INFO;
    uint64_t v19 = 174;
  }
  else
  {
    uint64_t v17 = @"LE: L2CAP write error";
    os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
    uint64_t v19 = 176;
  }
  sub_100025F04(v18, 0, (uint64_t)"-[BLESender sendL2CAPData]", v19, (void *)a1, v17, v12, v13, (uint64_t)v23);

  uint64_t v16 = (uint64_t)v4;
LABEL_11:
  if (v5 == v6)
  {
    sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[BLESender sendL2CAPData]", 181, (void *)a1, @"LE: Done TX", v14, v15, v16);
    uint64_t v20 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = 0;

    os_unfair_lock_unlock(v2);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
  else
  {
    sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[BLESender sendL2CAPData]", 186, (void *)a1, @"Failed to TX.. buffer full .. returning true", v14, v15, v16);
    uint64_t v21 = objc_msgSend(*(id *)(a1 + 40), "subdataWithRange:", v5, (char *)objc_msgSend(*(id *)(a1 + 40), "length") - v5);
    uint64_t v22 = *(void **)(a1 + 40);
    *(void *)(a1 + 40) = v21;

    os_unfair_lock_unlock(v2);
  }
}

uint64_t sub_10001A9BC(uint64_t a1)
{
  char v20 = 0;
  int v2 = (unsigned __int16)(*(_WORD *)(a1 + 10) - 1);
  int v3 = sub_10001AE4C(a1, 0, v2, (BOOL *)&v20);
  char v4 = 0;
  if (!v3) {
    goto LABEL_19;
  }
  LODWORD(v5) = 0;
  BOOL v6 = 0;
  char v7 = 0;
  do
  {
    id v8 = [v3 length];
    if ((v7 & 1) != 0 || v6 || !v8) {
      break;
    }
    id v11 = sub_10001AE00(v20);
    uint64_t v12 = sub_10001A3E0(v3, v11);

    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 12));
    BOOL v6 = *(unsigned char *)(a1 + 8) != 0;
    if (*(unsigned char *)(a1 + 8))
    {
      char v7 = 0;
    }
    else
    {
      if (((*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))() & 1) == 0)
      {
        uint64_t v16 = objc_msgSend(*(id *)(a1 + 40), "subdataWithRange:", v5, (char *)objc_msgSend(*(id *)(a1 + 40), "length") - v5);
        uint64_t v17 = *(void **)(a1 + 40);
        *(void *)(a1 + 40) = v16;

        char v7 = 0;
LABEL_13:

        int v3 = 0;
        char v4 = 1;
        goto LABEL_14;
      }
      unint64_t v5 = v5 + [v3 length];
      uint64_t v13 = sub_10001AE4C(a1, v5, v2, (BOOL *)&v20);

      if (!v13)
      {
        sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[BLESender sendTruncatedData]", 227, (void *)a1, @"LE: Done TX", v14, v15, v19);
        int v3 = *(void **)(a1 + 40);
        *(void *)(a1 + 40) = 0;
        char v7 = 1;
        goto LABEL_13;
      }
      char v7 = 0;
      char v4 = 1;
      int v3 = (void *)v13;
    }
LABEL_14:
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 12));
  }
  while (v3);
  if (v6)
  {
    char v4 = 1;
    sub_100025F04(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[BLESender sendTruncatedData]", 236, (void *)a1, @"LE: Tx Invalidated", v9, v10, v19);
  }
  else if (v7)
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
LABEL_19:

  return v4 & 1;
}

void *sub_10001ABC0(void *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (result)
  {
    id v8 = result;
    sub_100025F04(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[BLESender invalidate]", 101, result, &stru_100055900, a7, a8, v10);
    os_unfair_lock_lock((os_unfair_lock_t)v8 + 3);
    *((unsigned char *)v8 + 8) = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)v8 + 3);
    uint64_t v9 = *((void *)v8 + 4);
    return (void *)dispatch_semaphore_signal(v9);
  }
  return result;
}

os_unfair_lock_s *sub_10001AC44(os_unfair_lock_s *a1)
{
  uint64_t v1 = a1;
  if (a1)
  {
    int v2 = a1 + 3;
    os_unfair_lock_lock(a1 + 3);
    uint64_t v1 = (os_unfair_lock_s *)([*(id *)&v1[10]._os_unfair_lock_opaque length] != 0);
    os_unfair_lock_unlock(v2);
  }
  return v1;
}

void sub_10001ACF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (!a1) {
    return;
  }
  uint64_t v10 = (os_unfair_lock_s *)(a1 + 12);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 12));
  int v11 = *(unsigned __int8 *)(a1 + 8);
  id v12 = [*(id *)(a1 + 40) length];
  os_unfair_lock_unlock(v10);
  if (v11)
  {
    uint64_t v15 = @"Session invalidated";
    uint64_t v16 = 133;
LABEL_4:
    sub_100025F04(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[BLESender spaceIsAvailable]", v16, (void *)a1, v15, v13, v14, a9);
    return;
  }
  if (!v12)
  {
    uint64_t v15 = @"Data unavailable";
    uint64_t v16 = 137;
    goto LABEL_4;
  }
  if (*(void *)(a1 + 24))
  {
    sub_10001A75C(a1);
  }
  else if (*(void *)(a1 + 16))
  {
    sub_10001A9BC(a1);
  }
}

id sub_10001AE00(char a1)
{
  char v3 = a1 ^ 1;
  uint64_t v1 = +[NSData dataWithBytes:&v3 length:1];

  return v1;
}

id sub_10001AE4C(uint64_t a1, unint64_t a2, int a3, BOOL *a4)
{
  LODWORD(v5) = a3;
  if ((unint64_t)[*(id *)(a1 + 40) length] <= a2)
  {
    uint64_t v10 = 0;
  }
  else
  {
    id v8 = (id)(a2 + v5);
    if ([*(id *)(a1 + 40) length] >= v8)
    {
      unint64_t v5 = v5;
      *a4 = [*(id *)(a1 + 40) length] == v8;
      uint64_t v9 = *(void **)(a1 + 40);
    }
    else
    {
      *a4 = 1;
      uint64_t v9 = *(void **)(a1 + 40);
      unint64_t v5 = (unint64_t)[v9 length] - a2;
    }
    uint64_t v10 = objc_msgSend(v9, "subdataWithRange:", a2, v5);
  }

  return v10;
}

void sub_10001C240(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v29 = a2;
  id v7 = a3;
  id v8 = [v29 string];

  if (v8)
  {
    uint64_t v9 = [v29 string];
  }
  else
  {
    if (![v29 isWholeNumber])
    {
      sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISOReaderEngagement initWithData:type:]_block_invoke", 55, *(void **)(a1 + 32), @"Unexpected key type: %@", v10, v11, (uint64_t)v29);
      *a4 = 1;
      goto LABEL_15;
    }
    uint64_t v9 = [v29 numeric];
  }
  id v12 = v9;
  id v13 = [v9 integerValue];

  if (v13)
  {
    sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISOReaderEngagement initWithData:type:]_block_invoke", 76, *(void **)(a1 + 32), @"Proprietary info: key=%@, value=%@", v14, v15, (uint64_t)v29);
  }
  else
  {
    uint64_t v16 = +[NSString stringWithFormat:@"%ld.%ld"];
    uint64_t v17 = [v7 string];
    if (!v17
      || (char v20 = (void *)v17,
          [v7 string],
          uint64_t v21 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v22 = [v21 isEqualToString:v16],
          v21,
          v20,
          (v22 & 1) == 0))
    {
      sub_100025F04(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[ISOReaderEngagement initWithData:type:]_block_invoke", 65, *(void **)(a1 + 32), @"device engagement version mismatch", v18, v19, 1);
      id v23 = [v7 string];
      id v24 = +[NSDecimalNumber decimalNumberWithString:v23];

      id v25 = [v24 integerValue];
      dispatch_data_t v28 = *(void **)(a1 + 32);
      if (v25 == (id)1)
      {
        sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISOReaderEngagement initWithData:type:]_block_invoke", 72, v28, @"Minor version mismatch. Version %@. Proceeding further", v26, v27, (uint64_t)v7);
      }
      else
      {
        sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISOReaderEngagement initWithData:type:]_block_invoke", 69, v28, @"Unsupported device engagement version %@", v26, v27, (uint64_t)v7);
        *a4 = 1;
      }
    }
  }
LABEL_15:
}

void sub_10001C71C(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = [v7 string];

  if (v9)
  {
    uint64_t v10 = [v7 string];
  }
  else
  {
    if (![v7 isWholeNumber])
    {
      id v36 = *(void **)(a1 + 32);
      uint64_t v39 = (uint64_t)v7;
      uint64_t v37 = @"Unexpected key type: %@";
      uint64_t v38 = 148;
      goto LABEL_28;
    }
    uint64_t v10 = [v7 numeric];
  }
  id v13 = v10;
  id v14 = [v10 integerValue];

  if (v14 != (id)-1)
  {
    sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[UnifiedAccessReaderEngagement initWithData:]_block_invoke", 169, *(void **)(a1 + 32), @"Proprietary info: key=%@, value=%@", v15, v16, (uint64_t)v7);
    goto LABEL_29;
  }
  if ([v8 type] != (id)4
    || ([v8 array],
        uint64_t v17 = objc_claimAutoreleasedReturnValue(),
        id v18 = [v17 count],
        v17,
        !v18))
  {
    id v36 = *(void **)(a1 + 32);
    uint64_t v37 = @"Invalid cipher suites";
    uint64_t v38 = 155;
LABEL_28:
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[UnifiedAccessReaderEngagement initWithData:]_block_invoke", v38, v36, v37, v11, v12, v39);
    *a4 = 1;
    goto LABEL_29;
  }
  id v41 = v7;
  id v19 = objc_alloc_init((Class)NSMutableArray);
  sub_10001CA30(*(void *)(a1 + 32), v19);

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v40 = v8;
  char v20 = [v8 array];
  id v21 = [v20 countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v43;
    do
    {
      id v24 = 0;
      do
      {
        if (*(void *)v43 != v23) {
          objc_enumerationMutation(v20);
        }
        id v25 = *(void **)(*((void *)&v42 + 1) + 8 * (void)v24);
        unsigned __int8 v26 = [v25 isWholeNumber];
        id v29 = *(void **)(a1 + 32);
        if (v26)
        {
          if (v29) {
            id v30 = (void *)v29[4];
          }
          else {
            id v30 = 0;
          }
          id v31 = v30;
          id v32 = [v25 numeric];
          [v31 addObject:v32];
        }
        else
        {
          sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[UnifiedAccessReaderEngagement initWithData:]_block_invoke", 162, v29, @"Invalid cipher suite: %@", v27, v28, (uint64_t)v25);
        }
        id v24 = (char *)v24 + 1;
      }
      while (v22 != v24);
      id v33 = [v20 countByEnumeratingWithState:&v42 objects:v46 count:16];
      id v22 = v33;
    }
    while (v33);
  }

  BOOL v34 = *(void **)(a1 + 32);
  if (v34) {
    BOOL v34 = (void *)v34[4];
  }
  id v7 = v41;
  id v35 = v34;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v35 count] != 0;

  id v8 = v40;
LABEL_29:
}

void sub_10001CA30(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 32), a2);
  }
}

UnifiedAccessReaderEngagement *sub_10001CA48(uint64_t a1, void *a2)
{
  id v2 = a2;
  self;
  char v3 = [UnifiedAccessReaderEngagement alloc];
  id v4 = v2;
  if (v3)
  {
    v18.receiver = v3;
    v18.super_class = (Class)UnifiedAccessReaderEngagement;
    id v5 = objc_msgSendSuper2(&v18, "initWithData:type:", v4, 0);
    BOOL v6 = v5;
    if (!v5) {
      goto LABEL_4;
    }
    uint64_t v14 = 0;
    uint64_t v15 = &v14;
    uint64_t v16 = 0x2020000000;
    char v17 = 0;
    id v7 = [v5 cborObj];
    id v8 = [v7 dictionary];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10001C71C;
    v11[3] = &unk_100054E70;
    uint64_t v9 = v6;
    uint64_t v12 = v9;
    id v13 = &v14;
    [v8 enumerateKeysAndObjectsUsingBlock:v11];

    LODWORD(v7) = *((unsigned __int8 *)v15 + 24);
    _Block_object_dispose(&v14, 8);
    if (!v7)
    {
      char v3 = 0;
    }
    else
    {
LABEL_4:
      uint64_t v9 = v6;
      char v3 = v9;
    }
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v3;
}

void sub_10001CBD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

STSWifiHandoverConnectionHandle *sub_10001D00C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  self;
  id v7 = [STSWifiHandoverConnectionHandle alloc];
  id v8 = v6;
  id v9 = v5;
  if (v7)
  {
    v12.receiver = v7;
    v12.super_class = (Class)STSWifiHandoverConnectionHandle;
    uint64_t v10 = (STSWifiHandoverConnectionHandle *)objc_msgSendSuper2(&v12, "init");
    id v7 = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_connection, a3);
      objc_storeWeak((id *)&v7->_session, v8);
    }
  }

  return v7;
}

id sub_10001D0E8(nw_connection_t *a1)
{
  if (a1)
  {
    id v2 = nw_connection_copy_endpoint(a1[2]);
    id v5 = v2;
    if (v2)
    {
      nw_endpoint_type_t type = nw_endpoint_get_type(v2);
      if (type == nw_endpoint_type_url)
      {
        url = nw_endpoint_get_url(v5);
        if (url)
        {
          id v9 = +[NSString stringWithUTF8String:url];
          id v10 = +[NSURLComponents componentsWithString:v9];
          goto LABEL_12;
        }
        uint64_t v15 = @"Fail to obtain URL string";
        uint64_t v16 = 77;
      }
      else
      {
        if (type != nw_endpoint_type_address)
        {
LABEL_9:
          char v17 = 0;
LABEL_13:

          goto LABEL_14;
        }
        id v7 = nw_endpoint_copy_address_string(v5);
        if (v7)
        {
          id v8 = v7;
          id v9 = +[NSString stringWithUTF8String:v7];
          free(v8);
          id v10 = objc_alloc_init((Class)NSURLComponents);
          [v10 setScheme:@"http"];
          uint64_t v11 = +[NSString stringWithFormat:@"[%@]", v9];
          objc_super v12 = +[NSCharacterSet URLHostAllowedCharacterSet];
          id v13 = [v11 stringByAddingPercentEncodingWithAllowedCharacters:v12];
          [v10 setEncodedHost:v13];

          uint64_t v14 = +[NSNumber numberWithInt:nw_endpoint_get_port(v5)];
          [v10 setPort:v14];

LABEL_12:
          char v17 = [v10 URL];

          goto LABEL_13;
        }
        uint64_t v15 = @"Fail to obtain address string";
        uint64_t v16 = 54;
      }
    }
    else
    {
      uint64_t v15 = @"Fail to obtain endpoint";
      uint64_t v16 = 44;
    }
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSWifiHandoverConnectionHandle remoteEndpoint]", v16, a1, v15, v3, v4, v20);
    goto LABEL_9;
  }
  char v17 = 0;
LABEL_14:

  return v17;
}

void sub_10001D30C(uint64_t a1, void *a2, void *a3)
{
  if (a1)
  {
    id v5 = (id *)(a1 + 8);
    id v6 = a3;
    id v7 = a2;
    id WeakRetained = objc_loadWeakRetained(v5);
    sub_100026CE0(WeakRetained, v7, *(void **)(a1 + 16), v6);
  }
}

void sub_10001D394(uint64_t a1, void *a2)
{
  if (a1)
  {
    uint64_t v3 = (id *)(a1 + 8);
    id v4 = a2;
    id WeakRetained = objc_loadWeakRetained(v3);
    sub_1000270C0((uint64_t)WeakRetained, *(void **)(a1 + 16), v4);
  }
}

void sub_10001D408(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v7 = a3;
  if (a1)
  {
    if (*(void *)(a1 + 24))
    {
      sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSWifiHandoverConnectionHandle startHTTPServerWithDelegate:queue:]", 109, (void *)a1, @"Handle already init'ed", v5, v6, v10);
    }
    else
    {
      sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSWifiHandoverConnectionHandle startHTTPServerWithDelegate:queue:]", 115, (void *)a1, @"Starting HTTP server on connection %@", v5, v6, *(void *)(a1 + 16));
      uint64_t v8 = sub_100019284((uint64_t)HTTPServerProtocolH1, (void *)a1, v11, v7);
      id v9 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v8;

      [*(id *)(a1 + 24) start];
    }
  }
}

void sub_10001D4EC(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v9 = a1[3];
    if (a1[3])
    {
      v15[0] = (uint64_t)_NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = (uint64_t)sub_10001D7B0;
      v15[3] = (uint64_t)&unk_100054EC0;
      v15[4] = (uint64_t)a1;
      id v16 = v6;
      sub_1000199CC((uint64_t)v9, v5, v15);
      uint64_t v10 = v16;
    }
    else
    {
      sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSWifiHandoverConnectionHandle httpReply:completion:]", 132, a1, @"Server not started", v7, v8, v15[0]);
      if (!v6)
      {
LABEL_9:

        goto LABEL_10;
      }
      id WeakRetained = objc_loadWeakRetained(a1 + 1);
      objc_super v12 = WeakRetained;
      if (WeakRetained) {
        id v13 = (void *)*((void *)WeakRetained + 6);
      }
      else {
        id v13 = 0;
      }
      uint64_t v14 = v13;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10001D678;
      block[3] = &unk_100054EE8;
      void block[4] = v9;
      id v18 = v6;
      dispatch_async(v14, block);

      uint64_t v10 = v18;
    }

    goto LABEL_9;
  }
LABEL_10:
}

void sub_10001D678(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  if (v1) {
    id WeakRetained = objc_loadWeakRetained((id *)(v1 + 16));
  }
  else {
    id WeakRetained = 0;
  }
  id v4 = +[NSError errorWithDomain:@"WifiDomain" code:4 userInfo:0];
  v7[0] = NSLocalizedDescriptionKey;
  v7[1] = NSUnderlyingErrorKey;
  v8[0] = @"Wifi specific error";
  v8[1] = v4;
  id v5 = +[NSDictionary dictionaryWithObjects:v8 forKeys:v7 count:2];
  id v6 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:12 userInfo:v5];

  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, WeakRetained, v6);
}

void sub_10001D7B0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(id **)(a1 + 32);
  if (v7)
  {
    id WeakRetained = (id **)objc_loadWeakRetained(v7 + 1);
    id v9 = WeakRetained;
    if (WeakRetained) {
      uint64_t v7 = WeakRetained[6];
    }
    else {
      uint64_t v7 = 0;
    }
  }
  else
  {
    id v9 = 0;
  }
  uint64_t v10 = v7;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D8C8;
  block[3] = &unk_100054E98;
  id v11 = *(id *)(a1 + 40);
  id v16 = v6;
  id v17 = v11;
  id v15 = v5;
  id v12 = v6;
  id v13 = v5;
  dispatch_async(v10, block);
}

uint64_t sub_10001D8C8(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_10001D8E0(uint64_t a1)
{
  if (a1)
  {
    nw_connection_cancel(*(nw_connection_t *)(a1 + 16));
    [*(id *)(a1 + 24) stop];
    uint64_t v2 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;
  }
}

id *sub_10001D97C(uint64_t a1, void *a2)
{
  id v2 = a2;
  self;
  uint64_t v3 = +[CBOR decodeFromData:v2];

  if (!v3 || [v3 type] != (id)5)
  {
    sub_100026000(OS_LOG_TYPE_ERROR, 0, (uint64_t)"+[ISOSessionEstablishment decodeFromData:]", 22, @"Invalid ISOSessionEstablishment", v4, v5, v6, v25);
    id v16 = 0;
    goto LABEL_15;
  }
  uint64_t v7 = [v3 dictionary];
  uint64_t v8 = +[CBOR cborWithUTF8String:@"eReaderKey"];
  id v9 = [v7 objectForKey:v8];

  if (!v9)
  {
    id v15 = 0;
LABEL_8:
    id v17 = [v3 dictionary];
    id v18 = +[CBOR cborWithUTF8String:@"data"];
    id v19 = [v17 objectForKey:v18];

    if (v19 && [v19 type] == (id)2)
    {
      uint64_t v23 = [v19 data];
      id v16 = sub_10001DBA4((id *)[ISOSessionEstablishment alloc], v15, v23);
    }
    else
    {
      sub_100026000(OS_LOG_TYPE_ERROR, 0, (uint64_t)"+[ISOSessionEstablishment decodeFromData:]", 38, @"Invalid Data type", v20, v21, v22, v25);
      id v16 = 0;
    }

    goto LABEL_14;
  }
  if ([v9 type] == (id)2)
  {
    id v13 = objc_alloc((Class)COSEKey);
    uint64_t v14 = [v9 data];
    id v15 = [v13 initWithData:v14];

    goto LABEL_8;
  }
  sub_100026000(OS_LOG_TYPE_ERROR, 0, (uint64_t)"+[ISOSessionEstablishment decodeFromData:]", 29, @"Unexpected DeviceKey type", v10, v11, v12, v25);
  id v16 = 0;
LABEL_14:

LABEL_15:

  return v16;
}

id *sub_10001DBA4(id *a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)ISOSessionEstablishment;
    uint64_t v8 = (id *)objc_msgSendSuper2(&v10, "init");
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
    }
  }

  return a1;
}

id *sub_10001DC40(id *a1)
{
  uint64_t v1 = a1;
  if (a1)
  {
    id v2 = objc_alloc((Class)NSMutableDictionary);
    uint64_t v3 = +[CBOR cborWithUTF8String:@"data"];
    id v13 = v3;
    id v4 = v1[2];
    uint64_t v5 = +[CBOR cborWithData:v4];
    uint64_t v14 = v5;
    id v6 = +[NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    id v7 = [v2 initWithDictionary:v6];

    if (v1[1])
    {
      uint64_t v8 = +[NSData dataWithCOSEKey:](NSData, "dataWithCOSEKey:");
      id v9 = [v8 cborEncodeToBstrCbor];
      objc_super v10 = +[CBOR cborWithUTF8String:@"eReaderKey"];
      [v7 setObject:v9 forKeyedSubscript:v10];
    }
    uint64_t v11 = +[CBOR cborWithDictionary:v7];
    uint64_t v1 = +[NSData dataWithCBOR:v11];
  }

  return v1;
}

id sub_10001DEB0(uint64_t a1, void *a2)
{
  id v2 = a2;
  self;
  uint64_t v3 = sub_10001DC40(v2);

  return v3;
}

id *sub_10001DF08(uint64_t a1, void *a2)
{
  id v2 = a2;
  self;
  uint64_t v3 = +[CBOR decodeFromData:v2];

  if (!v3 || [v3 type] != (id)5)
  {
    sub_100026000(OS_LOG_TYPE_ERROR, 0, (uint64_t)"+[ISOSessionData decodeFromData:]", 18, @"Invalid ISOSessionData", v4, v5, v6, v25);
    uint64_t v21 = 0;
    goto LABEL_21;
  }
  id v7 = [v3 dictionary];
  uint64_t v8 = +[CBOR cborWithUTF8String:@"data"];
  id v9 = [v7 objectForKey:v8];

  if (!v9 || [v9 type] == (id)2)
  {
    id v13 = [v3 dictionary];
    uint64_t v14 = +[CBOR cborWithUTF8String:@"status"];
    id v15 = [v13 objectForKey:v14];

    if (v15)
    {
      if ([v15 type])
      {
        id v19 = @"Invalid Data type";
        uint64_t v20 = 33;
LABEL_18:
        sub_100026000(OS_LOG_TYPE_ERROR, 0, (uint64_t)"+[ISOSessionData decodeFromData:]", v20, v19, v16, v17, v18, v25);
        uint64_t v21 = 0;
        goto LABEL_19;
      }
      uint64_t v21 = (id *)objc_opt_new();
      if (!v9)
      {
LABEL_16:
        uint64_t v23 = [v15 numeric];
        [v21 setStatus:v23];

LABEL_19:
        goto LABEL_20;
      }
    }
    else
    {
      if (!v9)
      {
        id v19 = @"Data or Error must be present";
        uint64_t v20 = 47;
        goto LABEL_18;
      }
      uint64_t v21 = (id *)objc_opt_new();
    }
    uint64_t v22 = [v9 data];
    if (v21) {
      objc_storeStrong(v21 + 1, v22);
    }

    if (!v15) {
      goto LABEL_19;
    }
    goto LABEL_16;
  }
  sub_100026000(OS_LOG_TYPE_ERROR, 0, (uint64_t)"+[ISOSessionData decodeFromData:]", 25, @"Invalid Data type", v10, v11, v12, v25);
  uint64_t v21 = 0;
LABEL_20:

LABEL_21:

  return v21;
}

void *sub_10001E150(void *a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (a1)
  {
    v11.receiver = a1;
    v11.super_class = (Class)ISOSessionData;
    id v7 = objc_msgSendSuper2(&v11, "init");
    a1 = v7;
    if (v7)
    {
      objc_storeStrong((id *)v7 + 1, a2);
      id v8 = [objc_alloc((Class)NSNumber) initWithInteger:a3];
      id v9 = (void *)a1[2];
      a1[2] = v8;

      sub_10001E1F4(a1);
    }
  }

  return a1;
}

unint64_t sub_10001E1F4(void *a1)
{
  if (!a1) {
    return 0;
  }
  unint64_t v2 = [a1 status];

  if (v2)
  {
    uint64_t v3 = [a1 status];
    unint64_t v2 = (unint64_t)[v3 unsignedIntegerValue];

    if (v2 > 0x14 || ((1 << v2) & 0x100C01) == 0)
    {
      uint64_t v5 = [a1 status];
      id v6 = [v5 unsignedIntegerValue];
      sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISOSessionData statusCode]", 82, a1, @"Unexpected error code detected: %lu", v7, v8, (uint64_t)v6);

      __assert_rtn("-[ISOSessionData statusCode]", "ISOSessionData.m", 83, "false");
    }
  }
  return v2;
}

void *sub_10001E2E4(void *a1)
{
  uint64_t v1 = a1;
  if (a1)
  {
    unint64_t v2 = [a1 status];
    if (v2)
    {
    }
    else if (!v1[1])
    {
      sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISOSessionData _encode]", 89, v1, @"Data or Error must be present", v3, v4, v14);
      uint64_t v1 = 0;
      goto LABEL_10;
    }
    uint64_t v5 = objc_opt_new();
    if (v1[1])
    {
      id v6 = +[CBOR cborWithData:](CBOR, "cborWithData:");
      uint64_t v7 = +[CBOR cborWithUTF8String:@"data"];
      [v5 setObject:v6 forKeyedSubscript:v7];
    }
    uint64_t v8 = [v1 status];

    if (v8)
    {
      id v9 = [v1 status];
      uint64_t v10 = +[CBOR cborWithInteger:](CBOR, "cborWithInteger:", [v9 unsignedIntegerValue]);
      objc_super v11 = +[CBOR cborWithUTF8String:@"status"];
      [v5 setObject:v10 forKeyedSubscript:v11];
    }
    uint64_t v12 = +[CBOR cborWithDictionary:v5];
    uint64_t v1 = +[NSData dataWithCBOR:v12];
  }
LABEL_10:

  return v1;
}

id sub_10001E570(uint64_t a1, void *a2)
{
  unint64_t v2 = a2;
  self;
  uint64_t v3 = sub_10001E2E4(v2);

  return v3;
}

id sub_10001FFDC(uint64_t a1)
{
  [*(id *)(a1 + 32) _activateDisconnectBlock:*(void *)(a1 + 40)];
  unint64_t v2 = *(void **)(a1 + 32);

  return [v2 invalidateAndUpdateStateSignal:0];
}

void sub_100020FEC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(unsigned char **)(a1 + 32);
  if (v8[9])
  {
    sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013_3_Peripheral invalidateAndUpdateStateSignal:reason:]_block_invoke", 348, v8, @"updateStateSignal=%d, status=%lu", a7, a8, *(unsigned __int8 *)(a1 + 48));
    if (*(unsigned char *)(a1 + 48)) {
      [*(id *)(a1 + 32) _signalConnectionStateChange:2];
    }
    [*(id *)(a1 + 32) _activateDisconnectBlock:*(void *)(a1 + 40)];
    if ([*(id *)(a1 + 32) getL2CAPEnable]) {
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 32), "unpublishL2CAPChannel:", objc_msgSend(*(id *)(a1 + 32), "l2CapPSM"));
    }
    [*(id *)(*(void *)(a1 + 32) + 32) removeAllServices];
    if ([*(id *)(*(void *)(a1 + 32) + 32) isAdvertising]) {
      [*(id *)(*(void *)(a1 + 32) + 32) stopAdvertising];
    }
    uint64_t v10 = *(void *)(a1 + 32);
    objc_super v11 = *(void **)(v10 + 32);
    *(void *)(v10 + 32) = 0;

    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = *(void **)(v12 + 128);
    *(void *)(v12 + 128) = 0;

    *(unsigned char *)(*(void *)(a1 + 32) + 9) = 0;
  }
}

void sub_1000215D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 224), 8);
  _Block_object_dispose((const void *)(v39 - 192), 8);
  _Block_object_dispose((const void *)(v39 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100021620(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100021630(uint64_t a1)
{
}

void sub_100021638(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = *(void **)(v9 + 56);
  if (!v10 || (v11 = [v10 count], uint64_t v9 = *(void *)(a1 + 32), !v11))
  {
    uint64_t v12 = @"LE: No centrals connected.";
    uint64_t v13 = 413;
    goto LABEL_8;
  }
  if (*(unsigned char *)(v9 + 9) != 1)
  {
    uint64_t v12 = @"LE: Session not in connected state";
    uint64_t v13 = 419;
    goto LABEL_8;
  }
  if (*(void *)(v9 + 64))
  {
    uint64_t v12 = @"LE: data pending.";
    uint64_t v13 = 425;
LABEL_8:
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISO18013_3_Peripheral writeData:toUUID:]_block_invoke", v13, (void *)v9, v12, a7, a8, v36);
LABEL_9:
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    return;
  }
  if (!*(unsigned char *)(v9 + 8))
  {
    sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013_3_Peripheral writeData:toUUID:]_block_invoke", 431, (void *)v9, @"Alt carrier no longer connected. Bail out", a7, a8, v36);
    uint64_t v22 = *(void *)(a1 + 32);
    uint64_t v23 = *(void **)(v22 + 64);
    *(void *)(v22 + 64) = 0;

    goto LABEL_9;
  }
  uint64_t v14 = [*(id *)(a1 + 32) getCharacteristic:*(void *)(a1 + 40)];
  uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  uint64_t v17 = objc_opt_new();
  uint64_t v18 = *(void *)(a1 + 32);
  id v19 = *(void **)(v18 + 64);
  *(void *)(v18 + 64) = v17;

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 64));
  uint64_t v20 = *(void *)(a1 + 32);
  uint64_t v21 = *(void **)(v20 + 72);
  if (v21)
  {
    sub_100016878(*(void *)(v20 + 64), v21);
  }
  else
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v24 = *(id *)(v20 + 56);
    id v25 = [v24 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v38;
      unint64_t v28 = 495;
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v38 != v27) {
            objc_enumerationMutation(v24);
          }
          id v30 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          if ((unint64_t)[v30 maximumUpdateValueLength] < v28) {
            unint64_t v28 = (unsigned __int16)[v30 maximumUpdateValueLength];
          }
        }
        id v26 = [v24 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v26);
    }
    else
    {
      LOWORD(v28) = 495;
    }

    id v31 = +[NSUserDefaults standardUserDefaults];
    uint64_t v32 = (uint64_t)[v31 integerForKey:@"BTMtuOverride"];

    if (v32 >= 1)
    {
      sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013_3_Peripheral writeData:toUUID:]_block_invoke", 456, *(void **)(a1 + 32), @"LE: user default MTU override=%d", v33, v34, v32);
      LOWORD(v28) = v32;
    }
    sub_100004DB4(*(void *)(*(void *)(a1 + 32) + 64), *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
    uint64_t v35 = *(void *)(*(void *)(a1 + 32) + 64);
    if (v35) {
      *(_WORD *)(v35 + 10) = v28;
    }
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 32));
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 56));
}

id sub_100021950(void *a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1[4] + 8) + 40) updateValue:a2 forCharacteristic:*(void *)(*(void *)(a1[5] + 8) + 40) onSubscribedCentrals:*(void *)(*(void *)(a1[6] + 8) + 40)];
}

void sub_10002197C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  unint64_t v2 = *(void **)(v1 + 64);
  *(void *)(v1 + 64) = 0;
}

void sub_100021A94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100021AAC(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v6 = a3;
  uint64_t v9 = v6;
  if (v6)
  {
    sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013_3_Peripheral getBluetoothStatusDict:]_block_invoke", 512, *(void **)(a1 + 32), @"LEStatus error:%@", v7, v8, (uint64_t)v6);
    if (*(void *)(a1 + 48)) {
      **(void **)(a1 + 48) = v9;
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

uint64_t sub_100021D4C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t sub_100021E70(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t sub_100021F4C(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 80) + 16))();
  *(void *)(*(void *)(a1 + 32) + 128) = objc_alloc_init((Class)NSMutableData);

  return _objc_release_x1();
}

void sub_100022870(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100022890(uint64_t a1)
{
  unint64_t v2 = _os_activity_create((void *)&_mh_execute_header, "ServiceDelegate xpcInvalidated", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v2, &state);
  os_activity_scope_leave(&state);

  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (v4 && (uint64_t v5 = *(void *)(v4 + 16)) != 0) {
      id v6 = objc_loadWeakRetained((id *)(v5 + 24));
    }
    else {
      id v6 = 0;
    }
    id v7 = [v6 processIdentifier];
    sub_100026000(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ServiceDelegate listener:shouldAcceptNewConnection:]_block_invoke", 107, @"XPC(PID=%d) invalidated", v8, v9, v10, (uint64_t)v7);

    id v11 = *(id *)(a1 + 32);
    id v12 = [WeakRetained[1] indexOfObject:v11];
    if (v12 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ServiceDelegate _findActiveConnection:removeFromActiveList:]", 128, WeakRetained, @"Missing XPC connection in registry", v13, v14, v19);
      uint64_t v15 = 0;
    }
    else
    {
      id v16 = v12;
      uint64_t v17 = [WeakRetained[1] objectAtIndex:v12];
      uint64_t v15 = (void *)v17;
      if (v17)
      {
        uint64_t v18 = *(os_unfair_lock_s **)(v17 + 16);
        if (v18) {
          -[STSXPCHelper xpcInvalidated]_0(v18);
        }
      }
      [WeakRetained[1] removeObjectAtIndex:v16];
    }
  }
}

void sub_1000229F0(id a1)
{
  uint64_t v1 = _os_activity_create((void *)&_mh_execute_header, "ServiceDelegate xpcInterrupted", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v2.opaque[0] = 0;
  v2.opaque[1] = 0;
  os_activity_scope_enter(v1, &v2);
  os_activity_scope_leave(&v2);
}

uint64_t start(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100026000(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"int main(int, const char **)", 145, @"Starting XPC Helper", a6, a7, a8, v11);
  uint64_t v8 = objc_opt_new();
  uint64_t v9 = +[NSXPCListener serviceListener];
  [v9 setDelegate:v8];
  [v9 resume];

  return 0;
}

id *sub_100022AD8(id *a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v9 = a2;
  uint64_t v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a1)
  {
    v25.receiver = a1;
    v25.super_class = (Class)STSWifiSession;
    uint64_t v13 = (id *)objc_msgSendSuper2(&v25, "init");
    a1 = v13;
    if (v13)
    {
      objc_storeWeak(v13 + 2, v9);
      if (v12)
      {
        id v14 = v12;
        uint64_t v15 = a1[4];
        a1[4] = v14;
      }
      else
      {
        uint64_t v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        dispatch_queue_t v16 = dispatch_queue_create("STSWifiSession", v15);
        id v17 = a1[4];
        a1[4] = v16;
      }
      objc_storeWeak(a1 + 3, v11);
      uint64_t v18 = sub_100026630((uint64_t)STSWifiHandoverSession, v10, a1, a1[4]);
      id v19 = a1[5];
      a1[5] = (id)v18;

      if (!v10 || !v10[8])
      {
        *((unsigned char *)a1 + 8) = 0;
        goto LABEL_13;
      }
      if (v9)
      {
        uint64_t v20 = v9[4];
        if (v20)
        {
          BOOL v21 = v20[8] == 0;
LABEL_11:
          *((unsigned char *)a1 + 8) = v21;

LABEL_13:
          uint64_t v22 = objc_opt_new();
          id v23 = a1[8];
          a1[8] = (id)v22;

          *((_DWORD *)a1 + 3) = 0;
          goto LABEL_14;
        }
      }
      else
      {
        uint64_t v20 = 0;
      }
      BOOL v21 = 1;
      goto LABEL_11;
    }
  }
LABEL_14:

  return a1;
}

uint64_t sub_100022C60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1) {
    sub_10002681C(*(void *)(a1 + 40), a2, a3, a4, a5, a6, a7, a8, vars0);
  }
  return 0;
}

id **sub_100022DE8(id **a1)
{
  if (a1)
  {
    sub_1000267EC(a1[5]);
    a1 = (id **)objc_claimAutoreleasedReturnValue();
    uint64_t v1 = vars8;
  }
  return a1;
}

uint64_t sub_100022E1C()
{
  self;
  uint64_t v0 = sub_100017060();

  if (v0)
  {
    uint64_t v1 = objc_opt_new();
    [v1 activate];
    unsigned int v2 = [v1 powerOn];
    [v1 invalidate];
    sub_100026000(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"+[STSWifiSession hardwareAvailable]", 114, @"wifiOn=%d", v3, v4, v5, v2);
    if (v2) {
      uint64_t v0 = 1;
    }
    else {
      uint64_t v0 = 2;
    }
  }
  return v0;
}

STSCHWiFiAwareDiscoveryChannelInfo *sub_100022EC4()
{
  self;
  uint64_t v0 = sub_100017060();
  sub_100026000(OS_LOG_TYPE_INFO, 0, (uint64_t)"+[STSWifiSession advertiseChannelInfo]", 121, @"%@", v1, v2, v3, v0);
  if (v0)
  {
    uint64_t v4 = +[NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v0 + 9)];
    uint64_t v5 = +[NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(v0 + 8)];
    id v6 = *(id *)(v0 + 16);
  }
  else
  {
    id v6 = 0;
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  id v7 = [[STSCHWiFiAwareDiscoveryChannelInfo alloc] initWithSupportedBands:v4 operatingClass:v5 channelNumber:v6];

  return v7;
}

void sub_100022FC4(void *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    objc_initWeak(&location, a1);
    sub_100025F04(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSWifiSession _receiveRawData:]", 135, a1, @"Wait on raw data receive", v4, v5, v6[0]);
    v6[0] = (uint64_t)_NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = (uint64_t)sub_1000230D8;
    v6[3] = (uint64_t)&unk_100055040;
    objc_copyWeak(&v8, &location);
    v6[4] = (uint64_t)a1;
    id v7 = v3;
    sub_10001D394((uint64_t)v7, v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void sub_1000230B4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1000230D8(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v14 = a2;
  id v6 = a4;
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v10 = (os_unfair_lock_s *)WeakRetained;
  if (v6 || !WeakRetained)
  {
    sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSWifiSession _receiveRawData:]_block_invoke", 140, *(void **)(a1 + 32), @"Invalid state, error=%@", v8, v9, (uint64_t)v6);
  }
  else
  {
    dispatch_assert_queue_V2(WeakRetained[4]);
    uint64_t v11 = *(void *)(a1 + 32);
    if (v11) {
      id v12 = objc_loadWeakRetained((id *)(v11 + 24));
    }
    else {
      id v12 = 0;
    }
    [v12 altCarrierReceived:v14 status:0];

    os_unfair_lock_lock(v10 + 3);
    uint64_t v13 = *(void *)&v10[12]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v10 + 3);
    if (v13 == 1) {
      sub_100022FC4(v10, *(void *)(a1 + 40));
    }
  }
}

void sub_100023FA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id location)
{
  _Block_object_dispose((const void *)(v35 - 160), 8);
  objc_destroyWeak(v34);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100023FDC(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = sub_1000261A8();
  if (os_signpost_enabled(v5))
  {
    *(_DWORD *)long long buf = 138412290;
    *(void *)&buf[4] = v4;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "WifiSession_SendData", "error=%@", buf, 0xCu);
  }

  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    id v7 = *(NSObject **)(v6 + 32);
  }
  else {
    id v7 = 0;
  }
  dispatch_assert_queue_V2(v7);
  if (v4)
  {
    uint64_t v8 = [v4 description];
    CFStringRef v18 = @"P2PError";
    *(void *)long long buf = v8;
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v18 count:1];
    uint64_t v10 = +[NSError errorWithDomain:@"WifiDomain" code:2 userInfo:v9];

    NSErrorUserInfoKey v16 = NSUnderlyingErrorKey;
    id v17 = v10;
    uint64_t v11 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    id v12 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:12 userInfo:v11];
  }
  else
  {
    id v12 = 0;
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  sub_100018290(*(void *)(a1 + 32), 0);
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 12));
  if (v12) {
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSWifiSession altCarrierSendData:completion:]_block_invoke", 285, *(void **)(a1 + 32), @"error=%@", v13, v14, (uint64_t)v12);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_100024210(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (*(void *)(a1 + 32)) {
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSWifiSession altCarrierSendData:completion:]_block_invoke", 304, *(void **)(a1 + 40), @"error=%@", a7, a8, *(void *)(a1 + 32));
  }
  uint64_t v9 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v9();
}

void sub_100024290(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_1000261A8();
  if (os_signpost_enabled(v4))
  {
    CFStringRef v5 = @"Success";
    if (!v3) {
      CFStringRef v5 = 0;
    }
    *(_DWORD *)long long buf = 138412290;
    *(void *)&buf[4] = v5;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "WifiSession_SendData", "status=%@", buf, 0xCu);
  }

  if (v3)
  {
    uint64_t v6 = [v3 description];
    CFStringRef v18 = @"P2PError";
    *(void *)long long buf = v6;
    id v7 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v18 count:1];
    uint64_t v8 = +[NSError errorWithDomain:@"WifiDomain" code:2 userInfo:v7];

    NSErrorUserInfoKey v16 = NSUnderlyingErrorKey;
    id v17 = v8;
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    uint64_t v10 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:12 userInfo:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v11 = *(void *)(a1 + 32);
  if (v11) {
    id v12 = *(NSObject **)(v11 + 32);
  }
  else {
    id v12 = 0;
  }
  dispatch_assert_queue_V2(v12);
  if (v10) {
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSWifiSession altCarrierSendData:completion:]_block_invoke", 320, *(void **)(a1 + 32), @"error=%@", v13, v14, (uint64_t)v10);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1000245D8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id v3 = *(NSObject **)(v2 + 32);
  }
  else {
    id v3 = 0;
  }
  dispatch_assert_queue_V2(v3);
  uint64_t v4 = *(void *)(a1 + 32);

  -[STSWifiSession connectionEstablishmentTimedout]_0(v4);
}

void sub_100024934(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 24));
  }
  else {
    id WeakRetained = 0;
  }
  id v3 = [*(id *)(a1 + 40) HTTPBody];
  [WeakRetained altCarrierReceived:v3 status:0];
}

uint64_t sub_1000249B0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000249C0(uint64_t a1)
{
}

void sub_1000249C8(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v11 = a4;
  if (v11) {
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSWifiSession _send:remoteURL:]_block_invoke", 438, *(void **)(a1 + 32), @"response=%@, error=%@", v9, v10, (uint64_t)v8);
  }
  id v12 = v8;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100024D5C;
  v28[3] = &unk_100055090;
  uint64_t v14 = *(void *)(a1 + 40);
  v28[4] = WeakRetained;
  v28[5] = v14;
  uint64_t v15 = objc_retainBlock(v28);
  NSErrorUserInfoKey v16 = [v12 MIMEType];
  id v17 = [v16 caseInsensitiveCompare:@"application/CBOR"];

  if (v17)
  {
    CFStringRef v18 = *(void **)(a1 + 32);
    id v19 = [v12 MIMEType];
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSWifiSession _send:remoteURL:]_block_invoke", 456, v18, @"NSURLSession: Unexpected MIMEType, %@", v20, v21, (uint64_t)v19);

    NSErrorUserInfoKey v33 = NSLocalizedDescriptionKey;
    uint64_t v34 = off_1000661A8;
    uint64_t v22 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    id v23 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:11 userInfo:v22];

    ((void (*)(void *, id, void *))v15[2])(v15, v7, v23);
  }
  else if (v11)
  {
    NSErrorUserInfoKey v31 = NSUnderlyingErrorKey;
    id v32 = v11;
    id v24 = +[NSDictionary dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    uint64_t v25 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:12 userInfo:v24];

    ((void (*)(void *, id, uint64_t))v15[2])(v15, v7, v25);
    id v11 = (id)v25;
  }
  else if ([v12 statusCode] == (id)200)
  {
    ((void (*)(void *, id, void))v15[2])(v15, v7, 0);
    id v11 = 0;
  }
  else
  {
    NSErrorUserInfoKey v29 = NSLocalizedDescriptionKey;
    id v26 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"HTTP status error=%ld", [v12 statusCode]);
    id v30 = v26;
    uint64_t v27 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    id v11 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:12 userInfo:v27];

    ((void (*)(void *, id, id))v15[2])(v15, v7, v11);
  }
}

void sub_100024D5C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) cancel];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    uint64_t v10 = *(NSObject **)(v9 + 32);
  }
  else {
    uint64_t v10 = 0;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100024E58;
  block[3] = &unk_100055108;
  void block[4] = v9;
  id v14 = v5;
  id v15 = v6;
  id v11 = v6;
  id v12 = v5;
  dispatch_async(v10, block);
}

void sub_100024E58(void *a1)
{
  uint64_t v2 = a1[4];
  if (v2) {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 24));
  }
  else {
    id WeakRetained = 0;
  }
  id v4 = WeakRetained;
  [WeakRetained altCarrierReceived:a1[5] status:a1[6]];
}

id *sub_100024F30(id *a1, void *a2, void *a3, void *a4)
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)STSCredentialSelect;
    id v11 = (id *)objc_msgSendSuper2(&v13, "init");
    a1 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      objc_storeStrong(a1 + 3, a4);
    }
  }

  return a1;
}

id sub_1000251F0(id a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    v16.receiver = a1;
    v16.super_class = (Class)STSXPCHelperEntitlementChecker;
    a1 = objc_msgSendSuper2(&v16, "init");
    if (a1)
    {
      *((_DWORD *)a1 + 3) = [v3 processIdentifier];
      if (v3) {
        [v3 auditToken];
      }
      else {
        memset(&token, 0, sizeof(token));
      }
      SecTaskRef v4 = SecTaskCreateWithAuditToken(kCFAllocatorDefault, &token);
      if (v4)
      {
        uint64_t v7 = v4;
        id v8 = @"com.apple.sts.xpcservice.client";
        CFErrorRef error = 0;
        CFTypeRef v11 = SecTaskCopyValueForEntitlement(v7, @"com.apple.sts.xpcservice.client", &error);
        if (error)
        {
          sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSXPCHelperEntitlementChecker _copyValueOfEntitlement:secTask:]", 34, a1, @"Failed to get entitlements: %@", v9, v10, (uint64_t)error);
          CFRelease(error);
        }
        if (v11)
        {
          CFTypeID v12 = CFGetTypeID(v11);
          BOOL v13 = v12 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v11) != 0;
          CFRelease(v11);
        }
        else
        {
          BOOL v13 = 0;
        }

        *((unsigned char *)a1 + 8) = v13;
        CFRelease(v7);
      }
      else
      {
        sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSXPCHelperEntitlementChecker initWithConnection:]", 88, a1, @"Cannot create SecTaskRef with XPC Connection: %@", v5, v6, (uint64_t)v3);

        a1 = 0;
      }
    }
  }

  return a1;
}

void sub_100025D8C(id a1)
{
  dword_1000662DC = arc4random();
}

void sub_100025DAC(os_log_type_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (qword_1000662F0 != -1) {
    dispatch_once(&qword_1000662F0, &stru_100055170);
  }
  id v6 = [objc_alloc((Class)NSString) initWithFormat:v5 arguments:a3];
  id v7 = [v6 UTF8String];
  id v8 = qword_1000662E8;
  if (os_log_type_enabled((os_log_t)qword_1000662E8, a1))
  {
    int v9 = 136446210;
    id v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, a1, "%{public}s", (uint8_t *)&v9, 0xCu);
  }
}

void sub_100025EC0(id a1)
{
  qword_1000662E8 = (uint64_t)os_log_create("com.apple.sts", "logging");

  _objc_release_x1();
}

void sub_100025F04(os_log_type_t a1, int a2, uint64_t a3, uint64_t a4, void *a5, void *a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v14 = a5;
  id v15 = a6;
  if (!a2) {
    goto LABEL_5;
  }
  if (qword_100066308 != -1) {
    dispatch_once(&qword_100066308, &stru_1000551B0);
  }
  if (byte_1000662D8 == 1)
  {
LABEL_5:
    id v16 = v15;
    id v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%08x [%s]:%d %@", [v14 objectInstanceID], a3, a4, v16);

    sub_100025DAC(a1, v17, (uint64_t)&a9);
  }
}

void sub_100026000(os_log_type_t a1, int a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v13 = a5;
  if (!a2) {
    goto LABEL_5;
  }
  if (qword_100066308 != -1) {
    dispatch_once(&qword_100066308, &stru_1000551B0);
  }
  if (byte_1000662D8 == 1)
  {
LABEL_5:
    id v14 = +[NSString stringWithFormat:@"%s : %d : %@", a3, a4, v13];
    sub_100025DAC(a1, v14, (uint64_t)&a9);
  }
}

void sub_1000260CC(os_log_type_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (!a2) {
    goto LABEL_5;
  }
  if (qword_100066308 != -1) {
    dispatch_once(&qword_100066308, &stru_1000551B0);
  }
  if (byte_1000662D8 == 1)
  {
LABEL_5:
    id v13 = +[NSString stringWithCString:a5 encoding:4];
    id v14 = +[NSString stringWithFormat:@"%s : %d : %@", a3, a4, v13];

    sub_100025DAC(a1, v14, (uint64_t)&a9);
  }
}

id sub_1000261A8()
{
  if (qword_100066300 != -1) {
    dispatch_once(&qword_100066300, &stru_100055190);
  }
  uint64_t v0 = (void *)qword_1000662F8;

  return v0;
}

void sub_1000261FC(id a1)
{
  qword_1000662F8 = (uint64_t)os_log_create("com.apple.sts.signpost", "GeneralSignposts");

  _objc_release_x1();
}

void sub_100026240(id a1)
{
  if (MGGetBoolAnswer()) {
    byte_1000662D8 = 1;
  }
}

void sub_10002644C(dispatch_queue_t *a1, void *a2)
{
  id v3 = a2;
  SecTaskRef v4 = v3;
  if (a1)
  {
    nw_connection_set_queue(v3, a1[7]);
    id v5 = sub_10001D00C(0x100065000, a1, v4);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100027654;
    handler[3] = &unk_100055250;
    handler[4] = a1;
    id v6 = v4;
    id v8 = v6;
    int v9 = v5;
    nw_connection_set_state_changed_handler(v6, handler);
    nw_connection_start(v6);
  }
}

void sub_100026588(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSWifiHandoverSession invalidate]", 126, a1, &stru_100055900, a7, a8, v10);
    int v9 = a1[7];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100026C70;
    block[3] = &unk_1000549A8;
    void block[4] = a1;
    dispatch_async(v9, block);
  }
}

STSWifiHandoverSession *sub_100026630(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = a3;
  id v8 = a2;
  self;
  int v9 = [STSWifiHandoverSession alloc];
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  if (v9)
  {
    v24.receiver = v9;
    v24.super_class = (Class)STSWifiHandoverSession;
    int v9 = (STSWifiHandoverSession *)objc_msgSendSuper2(&v24, "init");
    if (v9)
    {
      if (v11)
      {
        id v13 = (OS_dispatch_queue *)v11;
        callbackQueue = v9->_callbackQueue;
        v9->_callbackQueue = v13;
      }
      else
      {
        callbackQueue = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        dispatch_queue_t v15 = dispatch_queue_create("com.apple.nfc.wifihandover.cb", callbackQueue);
        id v16 = v9->_callbackQueue;
        v9->_callbackQueue = (OS_dispatch_queue *)v15;
      }
      id v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      CFStringRef v18 = dispatch_queue_attr_make_with_qos_class(v17, QOS_CLASS_USER_INITIATED, 0);
      dispatch_queue_t v19 = dispatch_queue_create("com.apple.nfc.wifihandover.wq", v18);
      workQueue = v9->_workQueue;
      v9->_workQueue = (OS_dispatch_queue *)v19;

      v9->_nw_endpoint_type_t type = 0;
      objc_storeStrong(&v9->_configObject, a2);
      objc_storeWeak((id *)&v9->_delegate, v10);
    }
  }

  if (v9)
  {
    uint64_t v21 = (WifiP2PController *)sub_10001561C([WifiP2PController alloc], v9, 0);
    p2pController = v9->_p2pController;
    v9->_p2pController = v21;
  }

  return v9;
}

id *sub_1000267EC(id *a1)
{
  if (a1)
  {
    a1 = (id *)a1[4];
    uint64_t v1 = vars8;
  }
  return a1;
}

void sub_10002681C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (a1)
  {
    if (!*(void *)(a1 + 24))
    {
      id v10 = *(id *)(a1 + 32);
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        id v12 = (id *)*(id *)(a1 + 32);
        dispatch_queue_t v15 = v12;
        if (v12)
        {
          int v16 = *((unsigned __int8 *)v12 + 8);
          *(unsigned char *)(a1 + 8) = v16;
          if (v16)
          {
            sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSWifiHandoverSession begin]", 108, (void *)a1, @"Start publisher", v13, v14, v35);
            id v17 = v15[8];
            uint64_t v36 = [v17 unsignedShortValue];
            id v18 = +[NSString stringWithFormat:@"%d"];
            uint64_t v21 = sub_10002759C(a1);
            if (v18)
            {
              if ([v18 length])
              {
                sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSWifiHandoverSession _create_and_start_listener:]", 359, (void *)a1, @"Listening on port %@", v22, v23, (uint64_t)v18);
                nw_listener_t v24 = nw_listener_create_with_port((const char *)[v18 UTF8String], v21);
LABEL_14:
                uint64_t v25 = *(void **)(a1 + 64);
                *(void *)(a1 + 64) = v24;

                id v26 = *(NSObject **)(a1 + 56);
                uint64_t v27 = *(id *)(a1 + 64);
                nw_listener_set_queue(v27, v26);

                unint64_t v28 = *(NSObject **)(a1 + 64);
                handler = _NSConcreteStackBlock;
                uint64_t v40 = 3221225472;
                id v41 = sub_1000279D8;
                long long v42 = &unk_1000552A0;
                long long v43 = (void *)a1;
                nw_listener_set_state_changed_handler(v28, &handler);
                NSErrorUserInfoKey v29 = *(NSObject **)(a1 + 64);
                v38[0] = _NSConcreteStackBlock;
                v38[1] = 3221225472;
                v38[2] = sub_100027FD0;
                v38[3] = &unk_1000552C8;
                v38[4] = a1;
                nw_listener_set_new_connection_handler(v29, v38);
                nw_listener_start(*(nw_listener_t *)(a1 + 64));

LABEL_20:
                return;
              }
            }
            else
            {
              sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSWifiHandoverSession _create_and_start_listener:]", 355, (void *)a1, @"Use default port 0", v19, v20, v36);
            }
            sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSWifiHandoverSession _create_and_start_listener:]", 362, (void *)a1, @"Listening on random port", v22, v23, v36);
            nw_listener_t v24 = nw_listener_create(v21);
            goto LABEL_14;
          }
        }
        else
        {
          *(unsigned char *)(a1 + 8) = 0;
        }
        sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSWifiHandoverSession begin]", 111, (void *)a1, @"Start subscriber", v13, v14, v35);
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = sub_100026C24;
        v37[3] = &unk_1000549D0;
        v37[4] = a1;
        id v17 = v37;
        if (*(void *)(a1 + 24))
        {
          sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSWifiHandoverSession _startWifiAwareSubscriberWithCompletion:]", 179, (void *)a1, @"Unsupported type=%lu", v30, v31, *(void *)(a1 + 24));
          id v32 = *(NSObject **)(a1 + 48);
          handler = _NSConcreteStackBlock;
          uint64_t v40 = 3221225472;
          id v41 = sub_1000273CC;
          long long v42 = &unk_100055228;
          long long v43 = v17;
          dispatch_async(v32, &handler);
          id v33 = v43;
        }
        else
        {
          uint64_t v34 = *(void *)(a1 + 40);
          id v33 = *(id *)(a1 + 32);
          sub_100016888(v34, v33, v17);
        }

        goto LABEL_20;
      }
    }
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSWifiHandoverSession begin]", 120, (void *)a1, @"Not support", a7, a8, a9);
  }
}

void sub_100026C24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2) {
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSWifiHandoverSession begin]_block_invoke", 115, *(void **)(a1 + 32), @"error=%@", a7, a8, a2);
  }
}

void sub_100026C70(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  if (v1)
  {
    id v3 = v1[8];
    if (!v3 || (nw_listener_cancel(v3), (uint64_t v1 = *(void **)(a1 + 32)) != 0))
    {
      SecTaskRef v4 = v1[9];
      if (!v4 || (nw_connection_cancel(v4), (uint64_t v1 = *(void **)(a1 + 32)) != 0))
      {
        uint64_t v5 = v1[5];
        sub_100016EB4(v5);
      }
    }
  }
}

void sub_100026CE0(void *a1, void *a2, void *a3, void *a4)
{
  id v7 = a4;
  if (a1)
  {
    id v8 = a3;
    id v9 = a2;
    [v9 length];
    sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSWifiHandoverSession sendData:connection:completionHandler:]", 142, a1, @"Sending data=%@, length=%lu", v10, v11, (uint64_t)v9);
    id v12 = v9;
    id v13 = [v12 bytes];
    id v14 = [v12 length];

    dispatch_data_t v15 = dispatch_data_create(v13, (size_t)v14, 0, 0);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    void v16[2] = sub_100026E1C;
    v16[3] = &unk_1000550E0;
    v16[4] = a1;
    id v17 = v7;
    sub_100026EF4((uint64_t)a1, v8, v15, v16);
  }
}

void sub_100026E1C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    uint64_t v5 = *(NSObject **)(v4 + 48);
  }
  else {
    uint64_t v5 = 0;
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  void v8[2] = sub_100026EE0;
  v8[3] = &unk_100054EE8;
  id v6 = *(id *)(a1 + 40);
  id v9 = v3;
  id v10 = v6;
  id v7 = v3;
  dispatch_async(v5, v8);
}

uint64_t sub_100026EE0(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_100026EF4(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    size_t size = dispatch_data_get_size(v8);
    if (HIDWORD(size))
    {
      dispatch_data_t subrange = dispatch_data_create_subrange(v8, 0xFFFFFFFFuLL, size - 0xFFFFFFFF);
      id v12 = dispatch_data_create_subrange(v8, 0, 0xFFFFFFFFuLL);
      completion[0] = _NSConcreteStackBlock;
      completion[1] = 3221225472;
      completion[2] = sub_100028048;
      completion[3] = &unk_1000552F0;
      id v19 = v9;
      completion[4] = a1;
      id v17 = v7;
      dispatch_data_t v18 = subrange;
      id v13 = subrange;
      nw_connection_send(v17, v12, _nw_content_context_default_message, 1, completion);
    }
    else
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000280F8;
      v14[3] = &unk_100055318;
      dispatch_data_t v15 = v9;
      nw_connection_send(v7, v8, _nw_content_context_default_message, 1, v14);
      id v13 = v15;
    }
  }
}

void sub_1000270C0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a1)
  {
    id v6 = a2;
    dispatch_data_t v7 = dispatch_data_create(0, 0, 0, 0);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    void v8[2] = sub_10002719C;
    v8[3] = &unk_100055200;
    void v8[4] = a1;
    id v9 = v5;
    sub_1000272EC(a1, v6, v7, 0x1000u, v8);
  }
}

void sub_10002719C(uint64_t a1, void *a2, char a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  id v9 = *(void **)(a1 + 32);
  id v10 = [v7 length];
  sub_100025F04(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSWifiHandoverSession receiveDataFromConnection:completionHandler:]_block_invoke", 167, v9, @"Recv byte len=%ld, isCompeleted=%d, error=%@", v11, v12, (uint64_t)v10);
  uint64_t v13 = *(void *)(a1 + 32);
  if (v13) {
    id v14 = *(NSObject **)(v13 + 48);
  }
  else {
    id v14 = 0;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000272D0;
  block[3] = &unk_1000551D8;
  id v15 = *(id *)(a1 + 40);
  id v20 = v8;
  id v21 = v15;
  char v22 = a3;
  id v19 = v7;
  id v16 = v8;
  id v17 = v7;
  dispatch_async(v14, block);
}

uint64_t sub_1000272D0(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 40));
}

void sub_1000272EC(uint64_t a1, NSObject *a2, void *a3, uint32_t a4, void *a5)
{
  id v9 = a3;
  id v10 = a5;
  if (a1)
  {
    if (a4 <= 1) {
      a4 = 1;
    }
    completion[0] = _NSConcreteStackBlock;
    completion[1] = 3221225472;
    completion[2] = sub_10002817C;
    completion[3] = &unk_100055340;
    id v12 = v9;
    uint64_t v13 = a1;
    id v14 = v10;
    nw_connection_receive(a2, 1u, a4, completion);
  }
}

void sub_1000273CC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  NSErrorUserInfoKey v4 = NSLocalizedDescriptionKey;
  id v5 = off_100066160;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  id v3 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:2 userInfo:v2];

  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v3);
}

void sub_1000274B4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  NSErrorUserInfoKey v4 = NSLocalizedDescriptionKey;
  id v5 = off_100066160;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];
  id v3 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:2 userInfo:v2];

  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v3);
}

NSObject *sub_10002759C(uint64_t a1)
{
  id v2 = objc_retainBlock(_nw_parameters_configure_protocol_disable);
  secure_tcp = nw_parameters_create_secure_tcp(v2, _nw_parameters_configure_protocol_default_configuration);
  nw_parameters_set_include_peer_to_peer(secure_tcp, 1);
  nw_parameters_set_service_class(secure_tcp, nw_service_class_responsive_data);
  NSErrorUserInfoKey v4 = nw_parameters_copy_default_protocol_stack(secure_tcp);
  id v5 = nw_protocol_stack_copy_transport_protocol(v4);
  nw_tcp_options_set_enable_keepalive(v5, 1);
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    uint32_t v7 = *(double *)(v6 + 72);
  }
  else {
    uint32_t v7 = 0;
  }
  nw_tcp_options_set_connection_timeout(v5, v7);

  return secure_tcp;
}

void sub_100027654(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5) {
    int error_code = nw_error_get_error_code(v5);
  }
  else {
    int error_code = 0;
  }
  *__error() = error_code;
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    id WeakRetained = objc_loadWeakRetained((id *)(v10 + 16));
  }
  else {
    id WeakRetained = 0;
  }
  switch(a2)
  {
    case 1:
      sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSWifiHandoverSession _start_connection:]_block_invoke", 287, *(void **)(a1 + 32), @"connection waiting", v8, v9, v28[0]);
      break;
    case 3:
      id v12 = sub_1000261A8();
      if (os_signpost_enabled(v12))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NetworkSocket_ConnectionReady", "", buf, 2u);
      }

      sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSWifiHandoverSession _start_connection:]_block_invoke", 307, *(void **)(a1 + 32), @"connection ready", v13, v14, v28[0]);
      if (objc_opt_respondsToSelector())
      {
        uint64_t v15 = *(void *)(a1 + 32);
        if (v15) {
          id v16 = *(NSObject **)(v15 + 48);
        }
        else {
          id v16 = 0;
        }
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_1000279C0;
        v29[3] = &unk_100054C50;
        uint64_t v17 = *(void *)(a1 + 48);
        v29[4] = WeakRetained;
        void v29[5] = v17;
        dispatch_data_t v18 = v29;
        goto LABEL_25;
      }
      break;
    case 4:
      id v19 = sub_1000261A8();
      if (os_signpost_enabled(v19))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NetworkSocket_ConnectionFailed", "", buf, 2u);
      }

      sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSWifiHandoverSession _start_connection:]_block_invoke", 296, *(void **)(a1 + 32), @"connection failed", v20, v21, v28[0]);
      nw_connection_cancel(*(nw_connection_t *)(a1 + 40));
      break;
    case 5:
      char v22 = sub_1000261A8();
      if (os_signpost_enabled(v22))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NetworkSocket_ConnectionCancelled", "", buf, 2u);
      }

      sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSWifiHandoverSession _start_connection:]_block_invoke", 324, *(void **)(a1 + 32), @"connection cancelled", v23, v24, v28[0]);
      uint64_t v25 = *(void *)(a1 + 32);
      if (!v25 || !*(unsigned char *)(v25 + 8))
      {
        sub_100015C38(v25, 0);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v26 = *(void *)(a1 + 32);
          if (v26) {
            id v16 = *(NSObject **)(v26 + 48);
          }
          else {
            id v16 = 0;
          }
          v28[0] = (uint64_t)_NSConcreteStackBlock;
          v28[1] = 3221225472;
          v28[2] = (uint64_t)sub_1000279CC;
          v28[3] = (uint64_t)&unk_100054C50;
          uint64_t v27 = *(void *)(a1 + 48);
          v28[4] = (uint64_t)WeakRetained;
          v28[5] = v27;
          dispatch_data_t v18 = v28;
LABEL_25:
          dispatch_async(v16, v18);
        }
      }
      break;
    default:
      break;
  }
}

id sub_1000279C0(uint64_t a1)
{
  return [*(id *)(a1 + 32) sessionDidConnect:*(void *)(a1 + 40)];
}

id sub_1000279CC(uint64_t a1)
{
  return [*(id *)(a1 + 32) connectionCancelled:*(void *)(a1 + 40)];
}

void sub_1000279D8(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5) {
    int error_code = nw_error_get_error_code(v5);
  }
  else {
    int error_code = 0;
  }
  *__error() = error_code;
  switch(a2)
  {
    case 1:
      sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSWifiHandoverSession _create_and_start_listener:]_block_invoke", 371, *(void **)(a1 + 32), @"listener waiting", v8, v9, v41);
      break;
    case 2:
      uint64_t v16 = *(void *)(a1 + 32);
      if (v16) {
        uint64_t v17 = *(NSObject **)(v16 + 64);
      }
      else {
        uint64_t v17 = 0;
      }
      uint64_t port = nw_listener_get_port(v17);
      uint64_t v21 = *(void **)(a1 + 32);
      if (v21) {
        uint64_t v22 = v21[8];
      }
      else {
        uint64_t v22 = 0;
      }
      sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"[(STSWifiHandoverSession *)"listener ready _create_and_start_listener:activePort=%d""], v18, v19, v22);
      uint64_t v23 = *(void *)(a1 + 32);
      v43[0] = _NSConcreteStackBlock;
      v43[1] = 3221225472;
      v43[2] = sub_100027DC4;
      v43[3] = &unk_100055278;
      v43[4] = v23;
      __int16 v44 = port;
      uint64_t v26 = v43;
      if (v23)
      {
        if (*(void *)(v23 + 24))
        {
          sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSWifiHandoverSession _startWifiAwarePublisherWithPort:completion:]", 194, (void *)v23, @"Unsupported type=%lu", v24, v25, *(void *)(v23 + 24));
          uint64_t v27 = *(NSObject **)(v23 + 48);
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000274B4;
          block[3] = &unk_100055228;
          uint64_t v46 = v26;
          dispatch_async(v27, block);
          id v28 = v46;
        }
        else
        {
          id v28 = *(id *)(v23 + 32);
          uint64_t v40 = +[NSNumber numberWithUnsignedShort:port];
          sub_100005448((uint64_t)v28, v40);

          sub_100015C48(*(void *)(v23 + 40), v28, v26);
        }
      }
      break;
    case 3:
      uint64_t v10 = *(void **)(a1 + 32);
      uint64_t v11 = __error();
      sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSWifiHandoverSession _create_and_start_listener:]_block_invoke", 380, v10, @"listener failed, errno=%d", v12, v13, *v11);
      uint64_t v14 = *(void *)(a1 + 32);
      if (v14)
      {
        uint64_t v15 = *(NSObject **)(v14 + 64);
        if (v15) {
          nw_listener_cancel(v15);
        }
      }
      break;
    case 4:
      NSErrorUserInfoKey v29 = *(void **)(a1 + 32);
      uint64_t v30 = __error();
      sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSWifiHandoverSession _create_and_start_listener:]_block_invoke", 411, v29, @"listener cancelled, errno=%d", v31, v32, *v30);
      uint64_t v33 = *(void *)(a1 + 32);
      if (v33) {
        objc_storeStrong((id *)(v33 + 64), 0);
      }
      uint64_t v34 = sub_1000261A8();
      if (os_signpost_enabled(v34))
      {
        LOWORD(block[0]) = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v34, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "NetworkSocket_ConnectionListenerCancelled", "", (uint8_t *)block, 2u);
      }

      uint64_t v35 = *(void *)(a1 + 32);
      if (v35) {
        id WeakRetained = objc_loadWeakRetained((id *)(v35 + 16));
      }
      else {
        id WeakRetained = 0;
      }
      char v37 = objc_opt_respondsToSelector();

      if (v37)
      {
        uint64_t v38 = *(void *)(a1 + 32);
        if (v38) {
          long long v39 = *(NSObject **)(v38 + 48);
        }
        else {
          long long v39 = 0;
        }
        v42[0] = _NSConcreteStackBlock;
        v42[1] = 3221225472;
        v42[2] = sub_100027E94;
        v42[3] = &unk_1000549A8;
        v42[4] = v38;
        dispatch_async(v39, v42);
      }
      break;
    default:
      break;
  }
}

void sub_100027DC4(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (v9)
  {
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSWifiHandoverSession _create_and_start_listener:]_block_invoke_2", 394, *(void **)(a1 + 32), @"error=%@, cancel listener", v3, v4, (uint64_t)v9);
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      uint64_t v6 = *(NSObject **)(v5 + 64);
    }
    else {
      uint64_t v6 = 0;
    }
    nw_listener_cancel(v6);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    id WeakRetained = objc_loadWeakRetained((id *)(v7 + 16));
  }
  else {
    id WeakRetained = 0;
  }
  if (objc_opt_respondsToSelector()) {
    [WeakRetained publisherStarted:*(unsigned __int16 *)(a1 + 40) error:v9];
  }
}

void sub_100027E94(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v1 + 16));
    uint64_t v4 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v4 = 0;
    id WeakRetained = 0;
  }
  uint64_t v5 = +[NSError errorWithDomain:@"WifiDomain" code:0 userInfo:0];
  v8[0] = NSLocalizedDescriptionKey;
  v8[1] = NSUnderlyingErrorKey;
  v9[0] = @"Wifi specific error";
  v9[1] = v5;
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
  uint64_t v7 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:12 userInfo:v6];

  [WeakRetained sessionDidInvalidate:v4 error:v7];
}

void sub_100027FD0(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v7 = a2;
  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSWifiHandoverSession _create_and_start_listener:]_block_invoke_2", 428, v3, @"Accepting new connection", v4, v5, v6);
  sub_10002644C(*(dispatch_queue_t **)(a1 + 32), v7);
}

void sub_100028048(void *a1, nw_error_t error)
{
  if (error)
  {
    uint64_t v2 = a1[7];
    id v7 = +[NSError errorWithDomain:@"Network" code:nw_error_get_error_code(error) userInfo:0];
    (*(void (**)(uint64_t, id))(v2 + 16))(v2, v7);
  }
  else
  {
    uint64_t v3 = a1[5];
    uint64_t v4 = a1[6];
    uint64_t v5 = a1[7];
    uint64_t v6 = a1[4];
    sub_100026EF4(v6, v3, v4, v5);
  }
}

void sub_1000280F8(uint64_t a1, nw_error_t error)
{
  if (error)
  {
    CFErrorRef error = +[NSError errorWithDomain:@"Network" code:nw_error_get_error_code(error) userInfo:0];
  }
  nw_error_t v3 = error;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10002817C(void *a1, void *a2, void *a3, int a4, void *a5)
{
  data2 = a2;
  id v9 = a3;
  uint64_t v10 = a5;
  uint64_t v11 = a1[4];
  if (data2) {
    dispatch_data_t concat = dispatch_data_create_concat(v11, data2);
  }
  else {
    dispatch_data_t concat = v11;
  }
  uint64_t v13 = concat;
  if (v9) {
    BOOL is_final = nw_content_context_get_is_final(v9);
  }
  else {
    BOOL is_final = 0;
  }
  uint64_t v15 = (void *)a1[5];
  if (data2) {
    size_t size = dispatch_data_get_size(data2);
  }
  else {
    size_t size = 0;
  }
  dispatch_data_get_size(v13);
  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"[(STSWifiHandoverSession *)"Recv %lu _receiveFromConnection:error=%@ dispatchData:isCompleted=%d length:context=%@ completionHandler:finalContext=%d""], v17, v18, size);
  if ((a4 & is_final) == 1)
  {
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    if (v10)
    {
      uint64_t v19 = +[NSError errorWithDomain:@"NetworkController" code:nw_error_get_error_code(v10) userInfo:0];
    }
    else
    {
      uint64_t v19 = 0;
    }
    (*(void (**)(void))(a1[6] + 16))();
  }
}

id sub_1000283AC(id a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)STSXPCHelper;
    a1 = objc_msgSendSuper2(&v12, "init");
    if (a1)
    {
      if (v5)
      {
        id v7 = v5;
        uint64_t v8 = *((void *)a1 + 8);
        *((void *)a1 + 8) = v7;
      }
      else
      {
        uint64_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        dispatch_queue_t v9 = dispatch_queue_create("com.apple.STSXPCHelper.main", v8);
        uint64_t v10 = (void *)*((void *)a1 + 8);
        *((void *)a1 + 8) = v9;
      }
      *((unsigned char *)a1 + 9) = 0;
      objc_storeWeak((id *)a1 + 18, v6);
      *((_DWORD *)a1 + 4) = 0;
      *((unsigned char *)a1 + 13) = MGGetBoolAnswer();
    }
  }

  return a1;
}

void sub_100028BB0(uint64_t a1, void *a2)
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 104), a2);
  }
}

void sub_100028E88(uint64_t a1, void *a2)
{
  id v3 = a2;
  sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSXPCHelper processUnifiedAccessStepupSessionEstablishment:forAcwg:endpointIdentifier:intermediateKeyMaterial:callback:]_block_invoke", 183, *(void **)(a1 + 32), @"Processing error: %@", v4, v5, (uint64_t)v3);
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    id v7 = *(uint64_t **)(v6 + 56);
  }
  else {
    id v7 = 0;
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100028F80;
  v11[3] = &unk_100055368;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v12 = v3;
  uint64_t v13 = v9;
  id v14 = v8;
  id v10 = v3;
  sub_100007480(v7, 20, v11);
}

void sub_100028F80(void *a1)
{
  (*(void (**)(void))(a1[6] + 16))();
  uint64_t v2 = a1[5];
  if (v2) {
    uint64_t v3 = *(void *)(v2 + 32);
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = (void *)a1[4];

  sub_10000D4F4(v3, 0, v4);
}

void sub_100028FE0(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if ((!v9 || [v9 code] == (id)17) && objc_msgSend(v7, "count"))
  {
    uint64_t v11 = *(id **)(a1 + 32);
    id v12 = [v7 firstObject];
    uint64_t v13 = v12;
    if (v11)
    {
      id v14 = v12;
      id v15 = objc_alloc_init((Class)NSMutableDictionary);
      if (v14) {
        uint64_t v16 = (void *)v14[3];
      }
      else {
        uint64_t v16 = 0;
      }
      id v17 = v16;
      *(void *)&long long buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472;
      uint64_t v30 = sub_10002FCDC;
      uint64_t v31 = &unk_100054960;
      id v32 = v15;
      id v18 = v15;
      [v17 enumerateKeysAndObjectsUsingBlock:&buf];

      uint64_t v19 = [STSCredentialSelect alloc];
      if (v14) {
        uint64_t v20 = (void *)v14[2];
      }
      else {
        uint64_t v20 = 0;
      }
      id v21 = v20;

      uint64_t v11 = sub_100024F30((id *)&v19->super.isa, v21, v18, 0);
    }

    uint64_t v22 = sub_1000261A8();
    if (os_signpost_enabled(v22))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ISO18013_ProcessMDocRequest", "", (uint8_t *)&buf, 2u);
    }

    uint64_t v23 = *(void *)(a1 + 32);
    if (v23) {
      uint64_t v24 = *(id **)(v23 + 56);
    }
    else {
      uint64_t v24 = 0;
    }
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100029308;
    v26[3] = &unk_100055390;
    id v27 = *(id *)(a1 + 40);
    id v28 = *(id *)(a1 + 48);
    sub_1000071CC(v24, v11, v26);
  }
  else
  {
    uint64_t v25 = sub_1000261A8();
    if (os_signpost_enabled(v25))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v10;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ISO18013_ProcessMDocRequest", "Failed, Error=%@", (uint8_t *)&buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t sub_100029308(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

id sub_100029D58(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (!a1)
  {
    id v13 = 0;
    goto LABEL_24;
  }
  id v7 = *(void **)(a1 + 136);
  if (!v7)
  {
    sub_100025F04(OS_LOG_TYPE_INFO, 1, (uint64_t)"-[STSXPCHelper _connectToSelectedACWithTimestamp:]", 1502, (void *)a1, @"Missing selected AC", v4, v5, v27);
    v30[0] = NSLocalizedDescriptionKey;
    v31[0] = off_100066160;
    id v12 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:1];
    id v13 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:2 userInfo:v12];

    goto LABEL_24;
  }
  if ([v7 type] == (id)1)
  {
    id v8 = sub_10002B9A8(a1, *(void **)(a1 + 136), 1);
    id v9 = *(void **)(a1 + 96);
    if (v9) {
LABEL_5:
    }
      id v9 = (void *)v9[4];
LABEL_6:
    id v10 = v9;
    uint64_t v11 = v10;
    if (!v8 && v10)
    {
      sub_10002ADDC((id *)a1, v10);
      id v8 = 0;
    }
    goto LABEL_16;
  }
  if ([*(id *)(a1 + 136) type] == (id)2)
  {
    id v14 = *(void **)(a1 + 136);
    id v15 = *(id *)(a1 + 80);
    id v16 = v14;
    if (v15) {
      BOOL v17 = v15[8] != 0;
    }
    else {
      BOOL v17 = 0;
    }
    id v8 = sub_10002A948(a1, v16, v17);

    id v9 = *(void **)(a1 + 88);
    if (v9) {
      goto LABEL_5;
    }
    goto LABEL_6;
  }
  id v8 = 0;
  uint64_t v11 = 0;
LABEL_16:
  id v13 = v8;
  id v18 = v6;
  v31[0] = v18;
  v30[0] = @"processHandoverEventTime";
  v30[1] = @"transportSelected";
  id v19 = *(id *)(a1 + 136);
  if (v19)
  {
    id v2 = *(id *)(a1 + 136);
    +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v2 type]);
    uint64_t v20 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v20 = &off_10005AED8;
  }
  v31[1] = v20;
  v30[2] = @"errorCode";
  id v21 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v13 code]);
  v31[2] = v21;
  uint64_t v22 = +[NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:3];

  if (v19)
  {
  }
  uint64_t v23 = +[STSAnalyticsLogger sharedCALogger];
  [v23 postISOHandoverEvent:v22 prepOnly:1];

  if (v13)
  {
    CFStringRef v28 = @"handoverEndEventTime";
    id v29 = v18;
    uint64_t v24 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    uint64_t v25 = +[STSAnalyticsLogger sharedCALogger];
    [v25 postISOHandoverEvent:v24 prepOnly:0];
  }
LABEL_24:

  return v13;
}

id sub_10002A948(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a1)
  {
    id v7 = (char *)[v5 leRole];
    if (a3)
    {
      if ((unint64_t)(v7 - 1) < 3)
      {
        CFStringRef v8 = @"ReaderPeripheral";
        uint64_t v9 = 1;
        goto LABEL_16;
      }
      if (v7 != (char *)4)
      {
        CFStringRef v10 = @"ReaderCentral";
        BOOL v11 = v7 == 0;
        uint64_t v9 = 0;
LABEL_13:
        if (v11) {
          CFStringRef v8 = v10;
        }
        else {
          CFStringRef v8 = 0;
        }
LABEL_16:
        id v12 = sub_10000FF24((id *)[STSBluetoothSession alloc], (void *)a1, (void *)v9, (void *)a1, 0);
        id v13 = *(void **)(a1 + 88);
        *(void *)(a1 + 88) = v12;

        uint64_t v14 = *(void *)(a1 + 80);
        if (v14) {
          unint64_t v15 = *(void *)(v14 + 16) & 8;
        }
        else {
          unint64_t v15 = 0;
        }
        uint64_t v16 = *(void *)(a1 + 32);
        id v17 = *(id *)(a1 + 88);
        if (v16) {
          objc_storeWeak((id *)(v16 + 16), v17);
        }

        objc_storeWeak((id *)(a1 + 152), *(id *)(a1 + 88));
        id v18 = *(void **)(a1 + 80);
        id v39 = 0;
        id v19 = v18;
        uint64_t v20 = sub_10003A93C(v19, &v39);
        id v21 = v39;

        if (v21)
        {
          v49[0] = NSLocalizedDescriptionKey;
          v49[1] = NSUnderlyingErrorKey;
          v50[0] = @"Reader Ident calculation error";
          v50[1] = v21;
          uint64_t v22 = +[NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:2];
          a1 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:6 userInfo:v22];
        }
        else
        {
          CFStringRef v37 = v8;
          uint64_t v38 = v20;
          CFStringRef v47 = @"credentialType";
          uint64_t v23 = +[NSNumber numberWithUnsignedChar:*(unsigned __int8 *)(a1 + 8)];
          BOOL v48 = v23;
          uint64_t v22 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];

          uint64_t v24 = +[STSAnalyticsLogger sharedCALogger];
          [v24 postISOTransactionEvent:v22 prepOnly:1];

          uint64_t v25 = sub_1000261A8();
          if (os_signpost_enabled(v25))
          {
            uint64_t v26 = [v6 advertiseUUID];
            uint64_t v27 = [v6 leAddr];
            *(_DWORD *)long long buf = 138413058;
            uint64_t v28 = (uint64_t)v37;
            *(void *)&buf[4] = v37;
            __int16 v41 = 1024;
            int v42 = v15 >> 3;
            __int16 v43 = 2112;
            __int16 v44 = v26;
            __int16 v45 = 2112;
            uint64_t v46 = v27;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v25, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "StartBleSession", "%@,l2Cap=%d,selected advertiseUUID=%@,selected leAddr=%@", buf, 0x26u);
          }
          else
          {
            uint64_t v28 = (uint64_t)v37;
          }

          id v29 = [v6 advertiseUUID];
          uint64_t v36 = [v6 leAddr];
          sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSXPCHelper _startBleSession:isoReader:]", 1162, (void *)a1, @"Starting %@,l2Cap=%d,selected advertiseUUID=%@,selected leAddr=%@", v30, v31, v28);

          id v32 = *(id *)(a1 + 88);
          uint64_t v33 = [v6 humanReadableAdvertiseUUID];
          uint64_t v34 = [v6 humanReadableLEAddress];
          uint64_t v20 = v38;
          a1 = sub_100010054((uint64_t)v32, v33, v34, v15 != 0, v38);
        }
        goto LABEL_28;
      }
    }
    else
    {
      if ((unint64_t)(v7 - 1) < 3)
      {
        CFStringRef v8 = @"DeviceCentral";
        uint64_t v9 = 2;
        goto LABEL_16;
      }
      if (v7 != (char *)4)
      {
        CFStringRef v10 = @"DevicePeripheral";
        BOOL v11 = v7 == 0;
        if (v7) {
          uint64_t v9 = 0;
        }
        else {
          uint64_t v9 = 3;
        }
        goto LABEL_13;
      }
    }
    NSErrorUserInfoKey v51 = NSLocalizedDescriptionKey;
    *(void *)long long buf = off_100066160;
    id v21 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v51 count:1];
    a1 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:2 userInfo:v21];
LABEL_28:
  }

  return (id)a1;
}

void sub_10002ADDC(id *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    objc_initWeak(&location, a1);
    sub_100025F04(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSXPCHelper startConnectionEstablishmentTimer:]", 1436, a1, &stru_100055900, v4, v5, v10);
    id v6 = [STSTimer alloc];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10002FE34;
    v11[3] = &unk_100055548;
    void v11[4] = a1;
    objc_copyWeak(&v12, &location);
    id v7 = [(STSTimer *)v6 initWithCallback:v11 queue:v3];
    id v8 = a1[15];
    a1[15] = v7;

    id v9 = a1[15];
    [v9 startTimer:30.0];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void sub_10002AEF8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_10002B828(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v18 = v3;
  if (!v3)
  {
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = 0;
LABEL_8:
    sub_10000D128(v13, v14);
LABEL_19:
    id v6 = v18;
    goto LABEL_20;
  }
  uint64_t v4 = [v3 domain];
  unsigned int v5 = [v4 isEqual:@"STSXPCHelperErrorDomain"];

  id v6 = v18;
  if (!v5) {
    goto LABEL_20;
  }
  if ([v18 code] == (id)12)
  {
    id v7 = [v18 userInfo];
    id v8 = [v7 objectForKeyedSubscript:NSUnderlyingErrorKey];

    id v9 = [v8 domain];
    if ([v9 isEqualToString:@"WifiDomain"])
    {
      id v10 = [v8 code];

      if (v10 == (id)3)
      {
        uint64_t v11 = *(void *)(a1 + 32);
        uint64_t v12 = 2;
        goto LABEL_16;
      }
    }
    else
    {
    }
    uint64_t v16 = [v8 domain];
    if (![v16 isEqualToString:@"BluetoothDomain"])
    {

      goto LABEL_18;
    }
    id v17 = [v8 code];

    if (v17)
    {
LABEL_18:

      goto LABEL_19;
    }
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = 3;
LABEL_16:
    sub_10000D128(v11, v12);
    goto LABEL_18;
  }
  BOOL v15 = [v18 code] == (id)6;
  id v6 = v18;
  if (v15)
  {
    uint64_t v13 = *(void *)(a1 + 32);
    uint64_t v14 = 1;
    goto LABEL_8;
  }
LABEL_20:
}

id sub_10002B9A8(uint64_t a1, void *a2, BOOL a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 80);
  if (v6 && v6[11] == 1)
  {
    id v33 = 0;
    id v7 = v6;
    id v8 = sub_10003AA98(v7, &v33);
    id v9 = v33;

    if (v9)
    {
      id v10 = v9;
    }
    else
    {
      uint64_t v11 = sub_1000261A8();
      if (os_signpost_enabled(v11))
      {
        uint64_t v12 = [v5 securityInfo];
        *(_DWORD *)long long buf = 138412546;
        *(void *)&buf[4] = v8;
        __int16 v35 = 2112;
        uint64_t v36 = v12;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "StartWiFiSession", "serviceName=%@, securityInfo=%@", buf, 0x16u);
      }
      id v32 = [v5 securityInfo];
      sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSXPCHelper _startWifiSession:publisherRole:]", 1078, (void *)a1, @"Starting Wifi: serviceName=%@, securityInfo=%@", v13, v14, (uint64_t)v8);

      BOOL v15 = objc_alloc_init(STSWifiAwareConfigurationParams);
      uint64_t v16 = [v5 securityInfo];
      sub_100004DA4((uint64_t)v15, v16);

      id v17 = [v5 discoveryChannelInfo];
      sub_100004DB4((uint64_t)v15, v17);

      uint64_t v18 = sub_100004E38((uint64_t)STSWifiAwareConfiguration, v8, a3, v15);
      id v19 = (void *)v18;
      if (v18) {
        *(_OWORD *)(v18 + 72) = xmmword_1000522D0;
      }
      uint64_t v20 = sub_100022AD8((id *)[STSWifiSession alloc], (void *)a1, (void *)v18, (void *)a1, 0);
      id v21 = *(void **)(a1 + 96);
      *(void *)(a1 + 96) = v20;

      uint64_t v22 = *(void *)(a1 + 32);
      id v23 = *(id *)(a1 + 96);
      if (v22) {
        objc_storeWeak((id *)(v22 + 16), v23);
      }

      objc_storeWeak((id *)(a1 + 152), *(id *)(a1 + 96));
      sub_100022C60(*(void *)(a1 + 96), v24, v25, v26, v27, v28, v29, v30);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    NSErrorUserInfoKey v37 = NSLocalizedDescriptionKey;
    *(void *)long long buf = off_100066180;
    id v9 = +[NSDictionary dictionaryWithObjects:buf forKeys:&v37 count:1];
    id v10 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:6 userInfo:v9];
  }

  return v10;
}

void sub_10002CC18(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_10002D0E8(uint64_t a1)
{
  uint64_t v2 = sub_1000261A8();
  if (os_signpost_enabled(v2))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ReceivedDataFromAlternateCarrier", "", (uint8_t *)&buf, 2u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (!v5)
  {
    uint64_t v8 = *(void *)(a1 + 40);
    if (v8) {
      goto LABEL_9;
    }
    goto LABEL_40;
  }
  uint64_t v6 = *(void *)(v5 + 72);
  if (v6 == 1)
  {
    uint64_t v9 = *(void *)(v5 + 32);
    if (v9 && *(unsigned char *)(v9 + 8)) {
      goto LABEL_12;
    }
    uint64_t v13 = *(void **)(a1 + 40);
    id v14 = *(id *)(a1 + 48);
    id v15 = v13;
    sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSXPCHelper _iso18013ReaderProcessResponse:altCarrierStatus:]", 1325, (void *)v5, &stru_100055900, v16, v17, v62);
    *(void *)&long long v72 = 0;
    *((void *)&v72 + 1) = &v72;
    uint64_t v73 = 0x3032000000;
    NSErrorUserInfoKey v74 = sub_10002F9F4;
    v75 = sub_10002FA04;
    id v76 = (id)objc_opt_new();
    id v18 = [v14 length];
    id v19 = +[NSNumber numberWithInteger:v18];
    [*(id *)(*((void *)&v72 + 1) + 40) setObject:v19 forKeyedSubscript:@"responseSize"];

    uint64_t v20 = +[STSReaderAnalyticsLogger sharedCALogger];
    [v20 postReaderTransactionEvent:*(void *)(*((void *)&v72 + 1) + 40) prepOnly:1];

    if (v15) {
      sub_100025F04(OS_LOG_TYPE_DEFAULT, 1, (uint64_t)"-[STSXPCHelper _iso18013ReaderProcessResponse:altCarrierStatus:]", 1333, (void *)v5, @"AC receive status=%@", v21, v22, (uint64_t)v15);
    }
    if (!*(void *)(v5 + 56))
    {
      sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSXPCHelper _iso18013ReaderProcessResponse:altCarrierStatus:]", 1337, (void *)v5, @"Dropping message", v21, v22, v63);
LABEL_38:
      _Block_object_dispose(&v72, 8);

      return;
    }
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472;
    v65[2] = sub_10002FA0C;
    v65[3] = &unk_1000554F8;
    v65[4] = v5;
    id v23 = objc_retainBlock(v65);
    if (v15)
    {
      id v24 = +[NSDate now];
      [*(id *)(*((void *)&v72 + 1) + 40) setObject:v24 forKeyedSubscript:@"transactionEndEventTime"];
      uint64_t v25 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v15 code]);
      [*(id *)(*((void *)&v72 + 1) + 40) setObject:v25 forKeyedSubscript:@"errorCode"];

      uint64_t v26 = +[STSReaderAnalyticsLogger sharedCALogger];
      [v26 postReaderTransactionEvent:*(void *)(*((void *)&v72 + 1) + 40) prepOnly:0];

      ((void (*)(void *, id, void, void, id))v23[2])(v23, v14, 0, 0, v15);
LABEL_37:

      goto LABEL_38;
    }
    id v30 = *(id *)(v5 + 112);
    BOOL v31 = [v30 length] == 0;

    if (!v31)
    {
      id v32 = *(id *)(v5 + 112);
      BOOL v33 = (unint64_t)[v32 length] > 0x100000;

      if (!v33)
      {
        id v40 = *(id *)(v5 + 112);
        [v40 appendData:v14];

        int v38 = 0;
        id v39 = *(void **)(v5 + 112);
        goto LABEL_28;
      }
      sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSXPCHelper _iso18013ReaderProcessResponse:altCarrierStatus:]", 1369, (void *)v5, @"Buffer size is full therefore dropping all previous data", v34, v35, v63);
      id v36 = *(id *)(v5 + 112);
      id v37 = *(id *)(v5 + 112);
      objc_msgSend(v36, "replaceBytesInRange:withBytes:length:", 0, objc_msgSend(v37, "length"), 0, 0);
    }
    int v38 = 1;
    id v39 = v14;
LABEL_28:
    id v24 = v39;
    __int16 v43 = +[CBOR decodeFromData:v24];
    if (v43)
    {
      __int16 v44 = *(void **)(v5 + 112);
      *(void *)(v5 + 112) = 0;

      __int16 v45 = sub_1000261A8();
      if (os_signpost_enabled(v45))
      {
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = v18;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v45, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ISO18013_ProcessMDocResponse", "responseSize = %lu", (uint8_t *)&buf, 0xCu);
      }

      id v46 = *(id *)(v5 + 56);
      id v47 = *(id *)(v5 + 80);
      BOOL v48 = v47;
      if (v47) {
        uint64_t v49 = (void *)*((void *)v47 + 4);
      }
      else {
        uint64_t v49 = 0;
      }
      id v50 = v49;
      *(void *)&long long buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472;
      uint64_t v67 = sub_10002FAE4;
      id v68 = &unk_100055520;
      uint64_t v71 = &v72;
      uint64_t v69 = v5;
      NSErrorUserInfoKey v70 = v23;
      sub_100007E08((uint64_t)v46, v24, v50, &buf);
    }
    else
    {
      sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSXPCHelper _iso18013ReaderProcessResponse:altCarrierStatus:]", 1380, (void *)v5, @"Incomplete CBOR data, waiting for more", v41, v42, v63);
      if (v38)
      {
        id v51 = *(id *)(v5 + 112);
        [v51 appendData:v14];
      }
    }

    goto LABEL_37;
  }
  if (!v6)
  {
    uint64_t v7 = *(void *)(v5 + 32);
    if (!v7 || !*(unsigned char *)(v7 + 8))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      if (v8)
      {
LABEL_9:
        sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSXPCHelper altCarrierReceived:status:]_block_invoke", 752, (void *)v5, @"Data received error=%@; dropping",
          v3,
          v4,
          v8);
        return;
      }
      if (*(unsigned char *)(v5 + 11))
      {
        id v29 = *(id *)(a1 + 48);
        goto LABEL_42;
      }
LABEL_40:
      sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSXPCHelper altCarrierReceived:status:]_block_invoke", 757, *(void **)(a1 + 32), @"Received SessionEstablishment", v3, v4, v62);
      uint64_t v52 = *(void *)(a1 + 32);
      if (v52)
      {
        *(unsigned char *)(v52 + 11) = 1;
        uint64_t v5 = *(void *)(a1 + 32);
        id v29 = *(id *)(a1 + 48);
        if (v5)
        {
LABEL_42:
          if (*(void *)(v5 + 56))
          {
            sub_100025F04(OS_LOG_TYPE_DEFAULT, 1, (uint64_t)"-[STSXPCHelper _iso18013DeviceProcessRequest:]", 1225, (void *)v5, &stru_100055900, v27, v28, v62);
            sub_1000064D0(*(void *)(v5 + 56), 0, v53, v54, v55, v56, v57, v58);
            uint64_t v59 = sub_1000261A8();
            if (os_signpost_enabled(v59))
            {
              uint64_t v60 = *(void *)(v5 + 72);
              LODWORD(v72) = 134217984;
              *(void *)((char *)&v72 + 4) = v60;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v59, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ISO18013_ProcessMDocRequest", "type=%lul", (uint8_t *)&v72, 0xCu);
            }

            *(void *)&long long buf = _NSConcreteStackBlock;
            *((void *)&buf + 1) = 3221225472;
            uint64_t v67 = sub_10002F5AC;
            id v68 = &unk_1000554A8;
            uint64_t v69 = v5;
            uint64_t v61 = objc_retainBlock(&buf);
            sub_100005A94(*(void *)(v5 + 56), v29, v61);
          }
          else
          {
            sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSXPCHelper _iso18013DeviceProcessRequest:]", 1221, (void *)v5, @"Dropping message", v27, v28, v62);
          }
        }
      }
      else
      {
        id v29 = *(id *)(a1 + 48);
      }

      return;
    }
  }
LABEL_12:
  sub_100025F04(OS_LOG_TYPE_DEFAULT, 1, (uint64_t)"-[STSXPCHelper altCarrierReceived:status:]_block_invoke", 766, *(void **)(a1 + 32), @"Process raw receive", v3, v4, v62);
  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    uint64_t v11 = *(void **)(v10 + 32);
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = *(void **)(a1 + 48);
  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472;
  v64[2] = sub_10002D960;
  v64[3] = &unk_1000549D0;
  v64[4] = v10;
  sub_10000D7A8(v11, v12, 0, v64);
}

void sub_10002D930(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_10002D960(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2) {
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSXPCHelper altCarrierReceived:status:]_block_invoke_2", 771, *(void **)(a1 + 32), @"error= %@", a7, a8, a2);
  }
}

void sub_10002D9AC(uint64_t a1, dispatch_block_t block, dispatch_qos_class_t qos_class)
{
  if (a1)
  {
    dispatch_block_t v4 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, qos_class, 0, block);
    dispatch_async(*(dispatch_queue_t *)(a1 + 64), v4);
  }
}

void sub_10002DA84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100025F04(OS_LOG_TYPE_DEFAULT, 1, (uint64_t)"-[STSXPCHelper altCarrierConnectedWithStatus:]_block_invoke", 789, *(void **)(a1 + 32), @"status=%lu", a7, a8, *(void *)(a1 + 40));
  sub_10002DE34(*(id **)(a1 + 32), v9, v10, v11, v12, v13, v14, v15);
  uint64_t v16 = *(void **)(a1 + 32);
  if (v16) {
    uint64_t v17 = (void *)v16[4];
  }
  else {
    uint64_t v17 = 0;
  }
  uint64_t v18 = *(void *)(a1 + 40);
  id v19 = v17;
  uint64_t v20 = sub_10002DEB0(v16, v18);
  sub_10000D5F8((uint64_t)v19, v20);

  if (*(void *)(a1 + 40)) {
    return;
  }
  id v54 = (id)objc_opt_new();
  uint64_t v21 = +[NSDate now];
  [v54 setObject:v21 forKeyedSubscript:@"altCarrierStartEventTime"];
  uint64_t v22 = +[STSReaderAnalyticsLogger sharedCALogger];
  [v22 postReaderTransactionEvent:v54 prepOnly:1];

  id v23 = *(void **)(a1 + 32);
  if (v23) {
    id v23 = (void *)v23[8];
  }
  id v24 = v23;
  uint64_t v25 = *(void **)(a1 + 32);
  if (!v25)
  {
    id WeakRetained = 0;
    goto LABEL_14;
  }
  uint64_t v26 = v25[4];
  if (v26)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v26 + 16));
    uint64_t v25 = *(void **)(a1 + 32);
    if (!v25) {
      goto LABEL_10;
    }
  }
  else
  {
    id WeakRetained = 0;
  }
  uint64_t v25 = (void *)v25[11];
LABEL_10:
  uint64_t v28 = v25;
  if (WeakRetained != v28)
  {
    id v29 = v28;
LABEL_22:

    goto LABEL_23;
  }
LABEL_14:
  id v30 = *(void **)(a1 + 32);
  if (v30)
  {
    id v30 = (void *)v30[11];
    if (v30) {
      id v30 = (void *)v30[4];
    }
  }
  BOOL v31 = v30;

  if (v31)
  {
    uint64_t v32 = *(void *)(a1 + 32);
    if (v32)
    {
      id v33 = *(id *)(v32 + 88);
      id v29 = v33;
      if (v33)
      {
        uint64_t v34 = (void *)*((void *)v33 + 4);
LABEL_21:
        uint64_t v35 = v34;

        id v24 = v35;
        goto LABEL_22;
      }
    }
    else
    {
      id v29 = 0;
    }
    uint64_t v34 = 0;
    goto LABEL_21;
  }
LABEL_23:
  id v36 = *(void **)(a1 + 32);
  if (v36) {
    id v36 = (void *)v36[12];
  }
  id v37 = v36;
  if (WeakRetained == v37)
  {
    id v39 = *(void **)(a1 + 32);
    if (v39)
    {
      id v39 = (void *)v39[12];
      if (v39) {
        id v39 = (void *)v39[4];
      }
    }
    id v40 = v39;

    if (!v40) {
      goto LABEL_36;
    }
    uint64_t v41 = *(void *)(a1 + 32);
    if (v41)
    {
      id v42 = *(id *)(v41 + 96);
      int v38 = v42;
      if (v42)
      {
        __int16 v43 = (void *)*((void *)v42 + 4);
LABEL_34:
        __int16 v44 = v43;

        id v24 = v44;
        goto LABEL_35;
      }
    }
    else
    {
      int v38 = 0;
    }
    __int16 v43 = 0;
    goto LABEL_34;
  }
  int v38 = v37;
LABEL_35:

LABEL_36:
  if (v24)
  {
    __int16 v45 = *(id **)(a1 + 32);
    id v46 = v24;
    if (v45)
    {
      objc_initWeak(&location, v45);
      sub_100025F04(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSXPCHelper startAltCarrierSessionTimer:]", 1460, v45, &stru_100055900, v47, v48, v53);
      uint64_t v49 = [STSTimer alloc];
      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472;
      v55[2] = sub_10002FECC;
      v55[3] = &unk_100055548;
      v55[4] = v45;
      objc_copyWeak(&v56, &location);
      id v50 = [(STSTimer *)v49 initWithCallback:v55 queue:v46];
      id v51 = v45[16];
      v45[16] = v50;

      id v52 = v45[16];
      [v52 startTimer:300.0];

      objc_destroyWeak(&v56);
      objc_destroyWeak(&location);
    }
  }
}

void sub_10002DE0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002DE34(id *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 && a1[15])
  {
    sub_100025F04(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSXPCHelper invalidateConnectionEstablishmentTimer]", 1452, a1, &stru_100055900, a7, a8, v10);
    [a1[15] stopTimer];
    id v9 = a1[15];
    a1[15] = 0;
  }
}

uint64_t sub_10002DEB0(void *a1, uint64_t a2)
{
  if (!a1) {
    return 0;
  }
  uint64_t v2 = a2;
  switch(a2)
  {
    case 1:
    case 2:
    case 3:
      return v2;
    case 4:
      uint64_t v4 = a1[4];
      if (v4) {
        id WeakRetained = objc_loadWeakRetained((id *)(v4 + 16));
      }
      else {
        id WeakRetained = 0;
      }
      if (WeakRetained == (id)a1[11])
      {
        uint64_t v2 = 6;
      }
      else if (WeakRetained == (id)a1[12])
      {
        uint64_t v2 = 5;
      }
      else
      {
        uint64_t v2 = 4;
      }

      break;
    case 5:
      uint64_t v2 = 7;
      break;
    default:
      return 0;
  }
  return v2;
}

void sub_10002DFDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100025F04(OS_LOG_TYPE_DEFAULT, 1, (uint64_t)"-[STSXPCHelper altCarrierDisconnectedWithStatus:]_block_invoke", 823, *(void **)(a1 + 32), @"status=%lu", a7, a8, *(void *)(a1 + 40));
  id v9 = *(void **)(a1 + 32);
  if (v9) {
    uint64_t v10 = (void *)v9[4];
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = *(void *)(a1 + 40);
  id v12 = v10;
  uint64_t v13 = sub_10002DEB0(v9, v11);
  sub_10000D6D0((uint64_t)v12, v13);

  uint64_t v21 = *(id **)(a1 + 32);

  sub_10002E084(v21, v14, v15, v16, v17, v18, v19, v20);
}

void sub_10002E084(id *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1 && a1[16])
  {
    sub_100025F04(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSXPCHelper invalidateAltCarrierSessionTimer]", 1476, a1, &stru_100055900, a7, a8, v10);
    [a1[16] stopTimer];
    id v9 = a1[16];
    a1[16] = 0;
  }
}

void sub_10002E1C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100025F04(OS_LOG_TYPE_DEFAULT, 1, (uint64_t)"-[STSXPCHelper receivedCredentialSelection:callback:]_block_invoke", 843, *(void **)(a1 + 32), &stru_100055900, a7, a8, v15);
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    uint64_t v10 = *(id **)(v9 + 56);
  }
  else {
    uint64_t v10 = 0;
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  void v16[2] = sub_10002E2AC;
  v16[3] = &unk_100055430;
  uint64_t v11 = *(void **)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = *(void **)(a1 + 40);
  id v18 = v12;
  v16[4] = v13;
  id v17 = v14;
  sub_1000071CC(v10, v11, v16);
}

void sub_10002E2AC(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = sub_1000261A8();
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ProcessCredentialSelection", "", buf, 2u);
  }

  (*(void (**)(void))(a1[6] + 16))();
  id v8 = [v5 length];
  uint64_t v9 = (id *)a1[4];
  if (v8)
  {
    if (v9)
    {
      uint64_t v10 = (id *)v9[4];
      uint64_t v11 = v10;
      if (v10)
      {
        id WeakRetained = objc_loadWeakRetained(v10 + 2);
LABEL_7:
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_10002E4B8;
        v20[3] = &unk_1000553E0;
        uint64_t v13 = (void *)a1[5];
        v20[4] = a1[4];
        id v14 = v13;

        id v21 = v14;
        [WeakRetained altCarrierSendData:v5 completion:v20];

        goto LABEL_15;
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
    id WeakRetained = 0;
    goto LABEL_7;
  }
  if (v9) {
    uint64_t v9 = (id *)v9[4];
  }
  uint64_t v15 = a1[5];
  uint64_t v16 = v9;
  if (v15) {
    id v17 = *(void **)(v15 + 8);
  }
  else {
    id v17 = 0;
  }
  id v18 = v17;
  sub_10000D4F4((uint64_t)v16, v18, v6);

  uint64_t v19 = sub_1000261A8();
  if (os_signpost_enabled(v19))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ISO18013_AltCarrierProcessing", "", buf, 2u);
  }

LABEL_15:
}

void sub_10002E4B8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (v3) {
    uint64_t v3 = (void *)v3[4];
  }
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = v3;
  id v6 = a2;
  if (v4) {
    uint64_t v7 = *(void **)(v4 + 8);
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;
  sub_10000D4F4((uint64_t)v5, v8, v6);

  uint64_t v9 = sub_1000261A8();
  if (os_signpost_enabled(v9))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ISO18013_AltCarrierProcessing", "", v10, 2u);
  }
}

void sub_10002E77C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100025F04(OS_LOG_TYPE_DEFAULT, 1, (uint64_t)"-[STSXPCHelper iso18013ReaderSendSessionEstablishment:callback:]_block_invoke", 898, *(void **)(a1 + 32), @"readerSend: %@", a7, a8, *(void *)(a1 + 40));
  uint64_t v9 = *(void **)(a1 + 32);
  if (v9) {
    uint64_t v9 = (void *)v9[7];
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = *(void **)(a1 + 40);
  if (v11)
  {
    id v13 = *(id *)(v11 + 80);
    id v14 = v13;
    if (v13)
    {
      uint64_t v15 = (void *)*((void *)v13 + 5);
      goto LABEL_6;
    }
  }
  else
  {
    id v14 = 0;
  }
  uint64_t v15 = 0;
LABEL_6:
  id v16 = v15;
  uint64_t v17 = *(void *)(a1 + 32);
  if (!v17)
  {
    uint64_t v19 = 0;
    goto LABEL_13;
  }
  id v18 = *(id *)(v17 + 80);
  uint64_t v19 = v18;
  if (!v18)
  {
LABEL_13:
    uint64_t v20 = 0;
    goto LABEL_9;
  }
  uint64_t v20 = (void *)*((void *)v18 + 4);
LABEL_9:
  id v21 = v20;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  void v23[2] = sub_10002E8E0;
  v23[3] = &unk_100055408;
  id v22 = *(id *)(a1 + 48);
  v23[4] = *(void *)(a1 + 32);
  id v24 = v22;
  sub_100008AD8(v10, v12, v16, v21, v23);
}

void sub_10002E8E0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id WeakRetained = sub_1000261A8();
    if (os_signpost_enabled(WeakRetained))
    {
      *(_DWORD *)long long buf = 138412290;
      id v18 = v6;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, WeakRetained, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ISO18013_GenerateMDocRequest", "Failed, Error=%@", buf, 0xCu);
    }
    goto LABEL_14;
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (!v8)
  {
    uint64_t v10 = 0;
LABEL_9:
    uint64_t v13 = *(void *)(a1 + 32);
    if (v13)
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v13 + 152));
      id v12 = 0;
    }
    else
    {
      id v12 = 0;
      id WeakRetained = 0;
    }
    goto LABEL_11;
  }
  uint64_t v9 = (id *)*(id *)(v8 + 32);
  uint64_t v10 = v9;
  if (!v9) {
    goto LABEL_9;
  }
  id v11 = objc_loadWeakRetained(v9 + 2);
  if (!v11) {
    goto LABEL_9;
  }
  id v12 = v11;
  id WeakRetained = v12;
LABEL_11:

  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSXPCHelper iso18013ReaderSendSessionEstablishment:callback:]_block_invoke", 913, *(void **)(a1 + 32), @"readerSend AC: %@", v14, v15, (uint64_t)WeakRetained);
  [WeakRetained altCarrierSendData:v5 completion:*(void *)(a1 + 40)];
  id v16 = sub_1000261A8();
  if (os_signpost_enabled(v16))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ISO18013_GenerateMDocRequest", "", buf, 2u);
  }

LABEL_14:
}

void sub_10002EBAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100025F04(OS_LOG_TYPE_DEFAULT, 1, (uint64_t)"-[STSXPCHelper iso18013ReaderSendSessionData:status:callback:]_block_invoke", 936, *(void **)(a1 + 32), @"readerSend: %@, status=%@", a7, a8, *(void *)(a1 + 40));
  uint64_t v9 = *(void **)(a1 + 32);
  if (v9)
  {
    uint64_t v10 = (void *)v9[7];
    uint64_t v9 = (void *)v9[10];
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v11 = *(void **)(a1 + 40);
  id v12 = *(void **)(a1 + 48);
  uint64_t v13 = v9;
  uint64_t v14 = v10;
  if (v13) {
    uint64_t v15 = (void *)v13[4];
  }
  else {
    uint64_t v15 = 0;
  }
  id v16 = v15;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  void v19[2] = sub_10002ECE8;
  v19[3] = &unk_100055430;
  id v17 = *(id *)(a1 + 48);
  uint64_t v18 = *(void *)(a1 + 32);
  id v20 = v17;
  uint64_t v21 = v18;
  id v22 = *(id *)(a1 + 56);
  sub_100008DA0(v14, v11, v12, v16, v19);
}

void sub_10002ECE8(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  if ([*(id *)(a1 + 32) integerValue] == (id)20
    || [*(id *)(a1 + 32) integerValue] == (id)10
    || [*(id *)(a1 + 32) integerValue] == (id)11)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6)
    {
      uint64_t v7 = *(void *)(v6 + 56);
      if (v7) {
        *(unsigned char *)(v7 + 10) = 1;
      }
    }
  }
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_13;
  }
  uint64_t v8 = *(void *)(a1 + 40);
  if (!v8)
  {
    uint64_t v10 = 0;
    goto LABEL_17;
  }
  uint64_t v9 = (id *)*(id *)(v8 + 32);
  uint64_t v10 = v9;
  if (!v9)
  {
LABEL_17:
    id WeakRetained = 0;
    goto LABEL_12;
  }
  id WeakRetained = objc_loadWeakRetained(v9 + 2);
LABEL_12:
  [WeakRetained altCarrierSendData:v12 completion:*(void *)(a1 + 48)];

LABEL_13:
}

NSXPCInterface *sub_10002EF58()
{
  self;

  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___STSHelperProtocol];
}

NSXPCInterface *sub_10002EF90()
{
  self;

  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___STSHelperCallbackProtocol];
}

uint64_t sub_10002EFC8(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1) {
    LOBYTE(v1) = *(unsigned char *)(v1 + 12) != 0;
  }
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = v1;
  uint64_t v2 = *(void *)(result + 32);
  if (v2) {
    *(unsigned char *)(v2 + 12) = 1;
  }
  return result;
}

void sub_10002EFFC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10002F06C;
  v2[3] = &unk_1000549D0;
  v2[4] = v1;
  sub_10002F248(v1, v2);
}

void sub_10002F06C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v6 = v3;
  if (v3) {
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSXPCHelper _invalidate]_block_invoke_3", 1030, *(void **)(a1 + 32), @"AC send error=%@", v4, v5, (uint64_t)v3);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    uint64_t v8 = *(NSObject **)(v7 + 64);
  }
  else {
    uint64_t v8 = 0;
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002F130;
  block[3] = &unk_1000549A8;
  void block[4] = v7;
  dispatch_async(v8, block);
}

void sub_10002F130(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!v1) {
    return;
  }
  uint64_t v2 = *(void **)(v1 + 80);
  *(void *)(v1 + 80) = 0;

  id v3 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;

  sub_10000D000(*(os_unfair_lock_s **)(v1 + 32));
  uint64_t v4 = *(void **)(v1 + 32);
  *(void *)(v1 + 32) = 0;

  uint64_t v5 = *(void *)(v1 + 56);
  if (v5)
  {
    uint64_t v6 = *(id **)(v1 + 88);
    if (*(unsigned char *)(v5 + 10))
    {
      if (v6)
      {
        uint64_t v7 = 0;
LABEL_10:
        sub_1000110B8(v6, v7);
        goto LABEL_11;
      }
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v6 = *(id **)(v1 + 88);
  }
  if (v6)
  {
    uint64_t v7 = 1;
    goto LABEL_10;
  }
LABEL_11:
  uint64_t v8 = *(void **)(v1 + 88);
  *(void *)(v1 + 88) = 0;

  -[STSWifiSession connectionEstablishmentTimedout]_0(*(void *)(v1 + 96));
  uint64_t v9 = *(void **)(v1 + 96);
  *(void *)(v1 + 96) = 0;

  uint64_t v10 = *(void **)(v1 + 104);
  *(void *)(v1 + 104) = 0;

  id v11 = *(void **)(v1 + 112);
  *(void *)(v1 + 112) = 0;

  sub_100008FF0(*(void *)(v1 + 56));
  id v12 = *(void **)(v1 + 56);
  *(void *)(v1 + 56) = 0;

  sub_10002DE34((id *)v1, v13, v14, v15, v16, v17, v18, v19);
  sub_10002E084((id *)v1, v20, v21, v22, v23, v24, v25, v26);
  id WeakRetained = objc_loadWeakRetained((id *)(v1 + 144));
  [WeakRetained didInvalidate];
}

void sub_10002F248(uint64_t a1, void *a2)
{
  uint64_t v5 = a2;
  if (a1)
  {
    if (*(void *)(a1 + 56))
    {
      uint64_t v6 = (id *)*(id *)(a1 + 32);
      if (v6 && (uint64_t v9 = v6, WeakRetained = objc_loadWeakRetained(v6 + 2), v9, WeakRetained))
      {
        if ([WeakRetained isConnected])
        {
          if (*(unsigned char *)(a1 + 10))
          {
            sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSXPCHelper _sendSessionError:completion:]", 1301, (void *)a1, @"Session termination sent previously", v11, v12, v19);
            v5[2](v5, 0);
          }
          else
          {
            if (!*(unsigned char *)(a1 + 11) && !*(void *)(a1 + 72))
            {
              uint64_t v15 = *(void *)(a1 + 32);
              if (!v15 || !*(unsigned char *)(v15 + 8)) {
                sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSXPCHelper _sendSessionError:completion:]", 1308, (void *)a1, @"SessionTermination before SessionEstablishment received", v11, v12, v19);
              }
            }
            *(unsigned char *)(a1 + 10) = 1;
            uint64_t v16 = *(uint64_t **)(a1 + 56);
            v20[0] = _NSConcreteStackBlock;
            v20[1] = 3221225472;
            v20[2] = sub_10002F9E4;
            v20[3] = &unk_1000554D0;
            id WeakRetained = WeakRetained;
            id v21 = WeakRetained;
            uint64_t v22 = v5;
            sub_100007480(v16, 20, v20);
          }
        }
        else
        {
          sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSXPCHelper _sendSessionError:completion:]", 1295, (void *)a1, @"AC connection is disconnected", v11, v12, v19);
          NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
          uint64_t v24 = off_100066190;
          uint64_t v13 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
          uint64_t v14 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:8 userInfo:v13];

          ((void (**)(id, void *))v5)[2](v5, v14);
        }
      }
      else
      {
        sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSXPCHelper _sendSessionError:completion:]", 1289, (void *)a1, @"AC connection has not started", v7, v8, v19);
        NSErrorUserInfoKey v23 = NSLocalizedDescriptionKey;
        uint64_t v24 = off_100066190;
        uint64_t v17 = +[NSDictionary dictionaryWithObjects:&v24 forKeys:&v23 count:1];
        uint64_t v18 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:8 userInfo:v17];

        ((void (**)(id, void *))v5)[2](v5, v18);
        id WeakRetained = 0;
      }
    }
    else
    {
      sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSXPCHelper _sendSessionError:completion:]", 1281, (void *)a1, @"iso18013Handler has not started", v3, v4, v19);
      v5[2](v5, 0);
    }
  }
}

void sub_10002F5AC(uint64_t a1, void *a2, void *a3, void *a4, char a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = *(void *)(a1 + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002F6A8;
  block[3] = &unk_100055480;
  id v17 = v11;
  uint64_t v18 = v12;
  id v19 = v9;
  id v20 = v10;
  char v21 = a5;
  id v13 = v10;
  id v14 = v9;
  id v15 = v11;
  sub_10002D9AC(v12, block, QOS_CLASS_USER_INITIATED);
}

void sub_10002F6A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (!*(void *)(a1 + 32)
    || (sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSXPCHelper _iso18013DeviceProcessRequest:]_block_invoke_2", 1239, *(void **)(a1 + 40), @"Processing error: %@", a7, a8, *(void *)(a1 + 32)), !*(void *)(a1 + 32))|| [*(id *)(a1 + 48) count]|| *(void *)(a1 + 56)|| (uint64_t v9 = *(void *)(a1 + 40)) != 0 && *(unsigned char *)(v9 + 12))
  {
    id v10 = sub_1000261A8();
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ISO18013_ProcessMDocRequest", "", buf, 2u);
    }

    if (*(unsigned char *)(a1 + 64))
    {
      sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSXPCHelper _iso18013DeviceProcessRequest:]_block_invoke", 1265, *(void **)(a1 + 40), @"Stop further processing", v11, v12, v16);
    }
    else
    {
      id v13 = *(void **)(a1 + 56);
      if (!v13) {
        __assert_rtn("-[STSXPCHelper _iso18013DeviceProcessRequest:]_block_invoke", "STSXPCHelper.m", 1270, "readerAuthInfo != nil");
      }
      uint64_t v14 = *(void *)(a1 + 40);
      if (v14) {
        uint64_t v15 = *(void *)(v14 + 32);
      }
      else {
        uint64_t v15 = 0;
      }
      sub_10000D3F0(v15, *(void **)(a1 + 48), v13);
    }
  }
  else
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    void v18[2] = sub_10002F860;
    v18[3] = &unk_1000553E0;
    void v18[4] = v9;
    id v19 = *(id *)(a1 + 32);
    sub_10002F248(v9, v18);
  }
}

void sub_10002F860(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v6 = v3;
  if (v3) {
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSXPCHelper _iso18013DeviceProcessRequest:]_block_invoke_3", 1246, *(void **)(a1 + 32), @"AC send error=%@", v4, v5, (uint64_t)v3);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    uint64_t v8 = *(void *)(v7 + 32);
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = v6;
  if (!v6) {
    uint64_t v9 = *(void **)(a1 + 40);
  }
  sub_10000D4F4(v8, &stru_100055900, v9);
  id v10 = sub_1000261A8();
  if (os_signpost_enabled(v10))
  {
    uint64_t v11 = *(void *)(a1 + 40);
    *(_DWORD *)long long buf = 138412546;
    uint64_t v14 = v11;
    __int16 v15 = 2112;
    uint64_t v16 = v6;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ISO18013_ProcessMDocRequest", "Failed, ProcessRequestError=%@, acSendError=%@", buf, 0x16u);
  }

  uint64_t v12 = sub_1000261A8();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ISO18013_AltCarrierProcessing", "", buf, 2u);
  }
}

id sub_10002F9E4(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) altCarrierSendData:a2 completion:*(void *)(a1 + 40)];
}

uint64_t sub_10002F9F4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10002FA04(uint64_t a1)
{
}

void sub_10002FA0C(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    uint64_t v10 = *(void *)(v9 + 32);
  }
  else {
    uint64_t v10 = 0;
  }
  id v11 = a4;
  id v12 = a3;
  id v15 = a2;
  sub_10000DC94(v10, v15, v12, v11, a5, 0);
  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSXPCHelper _iso18013ReaderProcessResponse:altCarrierStatus:]_block_invoke", 1350, *(void **)(a1 + 32), @"SessionData=%@, sessionDataStatus=%@, deviceResponseStatus=%@", v13, v14, (uint64_t)v15);
}

void sub_10002FAE4(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = +[NSDate now];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v13 forKeyedSubscript:@"transactionEndEventTime"];
  uint64_t v14 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v12 code]);
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setObject:v14 forKeyedSubscript:@"errorCode"];

  id v15 = +[STSReaderAnalyticsLogger sharedCALogger];
  [v15 postReaderTransactionEvent:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) prepOnly:0];

  uint64_t v16 = sub_1000261A8();
  if (os_signpost_enabled(v16))
  {
    *(_DWORD *)long long buf = 138412290;
    id v20 = v12;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "ISO18013_ProcessMDocResponse", "error=%@", buf, 0xCu);
  }

  if (v12) {
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSXPCHelper _iso18013ReaderProcessResponse:altCarrierStatus:]_block_invoke", 1405, *(void **)(a1 + 32), @"SessionData decoding failure, error=%@", v17, v18, (uint64_t)v12);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10002FCDC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)NSMutableArray);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v12);
        if (v13) {
          uint64_t v13 = (void *)v13[2];
        }
        uint64_t v14 = v13;
        objc_msgSend(v7, "addObject:", v14, (void)v15);

        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  [*(id *)(a1 + 32) setObject:v7 forKey:v5];
}

void sub_10002FE34(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSXPCHelper startConnectionEstablishmentTimer:]_block_invoke", 1439, *(void **)(a1 + 32), @"Connection establishment timeout after %fs", a7, a8, 0x403E000000000000);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v11 = WeakRetained;
  if (WeakRetained)
  {
    [*((id *)WeakRetained + 12) connectionEstablishmentTimedout];
    id v10 = (void *)v11[11];
  }
  else
  {
    [0 connectionEstablishmentTimedout];
    id v10 = 0;
  }
  [v10 connectionEstablishmentTimedout];
}

void sub_10002FECC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSXPCHelper startAltCarrierSessionTimer:]_block_invoke", 1463, *(void **)(a1 + 32), @"AC session timeout after %fs", a7, a8, 0x4072C00000000000);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v11 = WeakRetained;
  if (WeakRetained)
  {
    [*((id *)WeakRetained + 12) sessionTimedout];
    id v10 = (void *)v11[11];
  }
  else
  {
    [0 sessionTimedout];
    id v10 = 0;
  }
  [v10 sessionTimedout];
}

id *sub_100030048(id *a1, void *a2)
{
  id v4 = a2;
  if (a1)
  {
    v8.receiver = a1;
    v8.super_class = (Class)BTAddressUpdateObserver;
    a1 = (id *)objc_msgSendSuper2(&v8, "init");
    if (a1)
    {
      uint64_t v5 = objc_opt_new();
      id v6 = a1[1];
      a1[1] = (id)v5;

      objc_storeStrong(a1 + 3, a2);
    }
  }

  return a1;
}

id *sub_1000302CC(id *a1)
{
  uint64_t v1 = a1;
  if (a1)
  {
    [a1[1] lock];
    id v2 = v1[2];
    [v1[1] unlock];
    if (v2)
    {
      uint64_t v1 = (id *)v2;
    }
    else
    {
      id v3 = v1[3];
      [v3 addObserver:v1 forKeyPath:@"advertisingAddress" options:0 context:v3];

      id v4 = [objc_alloc((Class)NSDate) initWithTimeIntervalSinceNow:1.0];
      id v5 = 0;
      if ([v1[1] waitUntilDate:v4]) {
        id v5 = v1[2];
      }
      [v1[1] unlock];
      id v6 = v1[3];
      [v6 removeObserver:v1 forKeyPath:@"advertisingAddress" context:v6];

      uint64_t v1 = (id *)v5;
    }
  }

  return v1;
}

id sub_100030424(id result, uint64_t a2)
{
  if (result)
  {
    v2.receiver = result;
    v2.super_class = (Class)ISOCentral;
    return objc_msgSendSuper2(&v2, "writeData:toUUID:", a2, @"00000006-A123-48CE-896B-4C76973373E6");
  }
  return result;
}

id sub_1000304AC(id result, uint64_t a2)
{
  if (result)
  {
    v2.receiver = result;
    v2.super_class = (Class)ReaderCentral;
    return objc_msgSendSuper2(&v2, "writeData:toUUID:", a2, @"00000002-A123-48CE-896B-4C76973373E6");
  }
  return result;
}

id *sub_100030D98(id *a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  if (a1)
  {
    v29.receiver = a1;
    v29.super_class = (Class)ISODeviceEngagement;
    id v6 = (id *)objc_msgSendSuper2(&v29, "init");
    a1 = v6;
    if (v6)
    {
      uint64_t v25 = 0;
      uint64_t v26 = &v25;
      uint64_t v27 = 0x2020000000;
      char v28 = 0;
      v6[1] = (id)a3;
      uint64_t v7 = +[CBOR decodeFromData:v5];
      id v8 = a1[9];
      a1[9] = (id)v7;

      id v11 = a1[9];
      if (!v11 || [v11 type] != (id)5)
      {
        sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISODeviceEngagement initWithData:type:]", 86, a1, @"Invalid CBOR type", v9, v10, (uint64_t)v17);
        goto LABEL_9;
      }
      id v12 = objc_opt_new();
      uint64_t v13 = [a1[9] dictionary];
      long long v17 = _NSConcreteStackBlock;
      uint64_t v18 = 3221225472;
      id v19 = sub_100030FA0;
      id v20 = &unk_1000555B0;
      a1 = a1;
      NSErrorUserInfoKey v23 = &v25;
      unint64_t v24 = a3;
      char v21 = a1;
      uint64_t v22 = v12;
      [v13 enumerateKeysAndObjectsUsingBlock:&v17];

      if (((a3 & 0xFFFFFFFFFFFFFFFDLL) != 0 || !a1[2]) && !*((unsigned char *)v26 + 24))
      {

LABEL_9:
        _Block_object_dispose(&v25, 8);

        a1 = 0;
        goto LABEL_14;
      }
      if (objc_msgSend(v12, "count", v17, v18, v19, v20))
      {
        id v14 = [v12 copy];
        id v15 = a1[6];
        a1[6] = v14;
      }
      _Block_object_dispose(&v25, 8);
    }
  }
LABEL_14:

  return a1;
}

void sub_100030F84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100030FA0(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = [v7 string];

  if (v9)
  {
    uint64_t v10 = [v7 string];
  }
  else
  {
    if (![v7 isWholeNumber])
    {
      sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISODeviceEngagement initWithData:type:]_block_invoke", 99, *(void **)(a1 + 32), @"Unexpected key type: %@", v11, v12, (uint64_t)v7);
LABEL_32:
      *a4 = 1;
      goto LABEL_40;
    }
    uint64_t v10 = [v7 numeric];
  }
  uint64_t v13 = v10;
  id v14 = [v10 integerValue];

  switch((unint64_t)v14)
  {
    case 0uLL:
      long long v17 = +[NSString stringWithFormat:@"%ld.%ld"];
      uint64_t v18 = [v8 string];
      if (v18)
      {
        char v21 = (void *)v18;
        uint64_t v22 = [v8 string];
        unsigned __int8 v23 = [v22 isEqualToString:v17];

        if (v23) {
          goto LABEL_39;
        }
      }
      sub_100025F04(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[ISODeviceEngagement initWithData:type:]_block_invoke", 109, *(void **)(a1 + 32), @"device engagement version mismatch", v19, v20, 1);
      unint64_t v24 = [v8 string];
      uint64_t v25 = +[NSDecimalNumber decimalNumberWithString:v24];

      id v26 = [v25 integerValue];
      objc_super v29 = *(void **)(a1 + 32);
      if (v26 == (id)1)
      {
        sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISODeviceEngagement initWithData:type:]_block_invoke", 116, v29, @"Minor version mismatch. Version %@. Proceeding further", v27, v28, (uint64_t)v8);
      }
      else
      {
        sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISODeviceEngagement initWithData:type:]_block_invoke", 113, v29, @"Unsupported device engagement version %@", v27, v28, (uint64_t)v8);
        *a4 = 1;
      }
      goto LABEL_34;
    case 1uLL:
      if ([v8 type] != (id)4
        || ([v8 array],
            uint64_t v32 = objc_claimAutoreleasedReturnValue(),
            id v33 = [v32 count],
            v32,
            v33 != (id)2))
      {
        uint64_t v60 = *(void **)(a1 + 32);
        uint64_t v61 = @"Invalid device engagement security structure";
        uint64_t v62 = 122;
        goto LABEL_31;
      }
      uint64_t v34 = [v8 array];
      long long v17 = [v34 objectAtIndex:0];

      if (v17 && ([v17 isWholeNumber] & 1) != 0)
      {
        id v37 = objc_alloc((Class)NSMutableArray);
        int v38 = [v17 numeric];
        id v39 = [v37 initWithObjects:v38];
        uint64_t v40 = *(void *)(a1 + 32);
        uint64_t v41 = *(void **)(v40 + 32);
        *(void *)(v40 + 32) = v39;

        *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
        if ((*(void *)(a1 + 56) | 2) == 2)
        {
          id v42 = [v8 array];
          uint64_t v25 = [v42 objectAtIndex:1];

          if (v25
            && [v25 type] == (id)2
            && ([v25 tag],
                __int16 v45 = objc_claimAutoreleasedReturnValue(),
                [v45 numeric],
                id v46 = objc_claimAutoreleasedReturnValue(),
                unsigned int v47 = [v46 intValue],
                v46,
                v45,
                v47 == 24))
          {
            uint64_t v48 = [v25 data];
            uint64_t v49 = +[CBOR decodeFromData:v48];

            if (v49 && [v49 type] == (id)5)
            {
              id v52 = [objc_alloc((Class)COSEKey) initWithCBOR:v49];
              uint64_t v53 = *(void *)(a1 + 32);
              id v54 = *(void **)(v53 + 16);
              *(void *)(v53 + 16) = v52;
            }
            else
            {
              sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISODeviceEngagement initWithData:type:]_block_invoke", 147, *(void **)(a1 + 32), @"Invalid device engagement security structure: public key", v50, v51, 0);
              *a4 = 1;
            }
          }
          else
          {
            sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISODeviceEngagement initWithData:type:]_block_invoke", 140, *(void **)(a1 + 32), @"Invalid device engagement security structure: public key", v43, v44, 0);
            *a4 = 1;
          }
LABEL_34:
        }
      }
      else
      {
        sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISODeviceEngagement initWithData:type:]_block_invoke", 129, *(void **)(a1 + 32), @"Invalid device engagement security structure: cipher suite", v35, v36, v65);
        *a4 = 1;
      }
      goto LABEL_39;
    case 2uLL:
      if ([v8 type] != (id)4)
      {
        uint64_t v60 = *(void **)(a1 + 32);
        uint64_t v61 = @"Device retrieval method not valid";
        uint64_t v62 = 155;
LABEL_31:
        sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISODeviceEngagement initWithData:type:]_block_invoke", v62, v60, v61, v30, v31, v65);
        goto LABEL_32;
      }
      long long v17 = [v8 array];
      uint64_t v74 = 0;
      v75 = &v74;
      uint64_t v76 = 0x3032000000;
      v77 = sub_100031640;
      v78 = sub_100031650;
      id v79 = 0;
      uint64_t v70 = 0;
      uint64_t v71 = &v70;
      uint64_t v72 = 0x2020000000;
      char v73 = 0;
      v66[0] = _NSConcreteStackBlock;
      v66[1] = 3221225472;
      v66[2] = sub_100031658;
      v66[3] = &unk_100055588;
      id v67 = *(id *)(a1 + 32);
      id v68 = &v70;
      uint64_t v69 = &v74;
      [v17 enumerateObjectsUsingBlock:v66];
      if (*((unsigned char *)v71 + 24)) {
        goto LABEL_25;
      }
      uint64_t v63 = (void *)v75[5];
      uint64_t v64 = *(id **)(a1 + 32);
      if (v63)
      {
        objc_storeStrong(v64 + 8, v63);
      }
      else
      {
        sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISODeviceEngagement initWithData:type:]_block_invoke_2", 208, v64, @"Device retrieval method not found", v55, v56, v65);
LABEL_25:
        *a4 = 1;
      }

      _Block_object_dispose(&v70, 8);
      _Block_object_dispose(&v74, 8);

LABEL_39:
      break;
    case 3uLL:
      uint64_t v57 = *(void **)(a1 + 32);
      uint64_t v58 = @"Ignore ServerRetrievalMethods";
      uint64_t v59 = 213;
      goto LABEL_28;
    case 4uLL:
      uint64_t v57 = *(void **)(a1 + 32);
      uint64_t v58 = @"Ignore ProtocolInfo";
      uint64_t v59 = 215;
LABEL_28:
      sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISODeviceEngagement initWithData:type:]_block_invoke_2", v59, v57, v58, v15, v16, v65);
      break;
    default:
      [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v7];
      break;
  }
LABEL_40:
}

void sub_100031608(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100031640(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100031650(uint64_t a1)
{
}

void sub_100031658(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v36 = a2;
  if ([v36 type] != (id)4) {
    goto LABEL_10;
  }
  uint64_t v9 = [v36 array];
  if ([v9 count] != (id)3)
  {

    goto LABEL_10;
  }
  uint64_t v10 = [v36 array];
  uint64_t v11 = [v10 objectAtIndexedSubscript:2];
  id v12 = [v11 type];

  if (v12 != (id)5)
  {
LABEL_10:
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISODeviceEngagement initWithData:type:]_block_invoke", 166, *(void **)(a1 + 32), @"Invalid DeviceRetrievalMethod envelope at index %lu", v7, v8, a3);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
    goto LABEL_11;
  }
  uint64_t v13 = [v36 array];
  uint64_t v14 = [v13 objectAtIndexedSubscript:1];
  uint64_t v15 = [v14 numeric];
  id v16 = [v15 integerValue];

  if (v16 != (id)1)
  {
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISODeviceEngagement initWithData:type:]_block_invoke", 173, *(void **)(a1 + 32), @"Invalid DeviceRetrievalMethod version %lu at index %lu", v17, v18, (uint64_t)v16);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
    goto LABEL_11;
  }
  uint64_t v19 = [v36 array];
  uint64_t v20 = [v19 objectAtIndexedSubscript:2];
  char v21 = [v20 dictionary];

  uint64_t v22 = [v36 array];
  unsigned __int8 v23 = [v22 objectAtIndexedSubscript:0];
  unint64_t v24 = [v23 numeric];
  id v25 = [v24 integerValue];

  if (v25 == (id)3)
  {
    uint64_t v28 = *(void **)(a1 + 32);
    objc_super v29 = @"WiFi DeviceRetrievalMethod supplied. Not supported. Skipping.";
    uint64_t v30 = 195;
    goto LABEL_16;
  }
  if (v25 == (id)2)
  {
    id v31 = sub_10003190C([ISODeviceRetrievalMethodBLE alloc], v21);
    uint64_t v32 = +[NSArray arrayWithObject:v31];
    uint64_t v33 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v34 = *(void **)(v33 + 40);
    *(void *)(v33 + 40) = v32;

    goto LABEL_18;
  }
  if (v25 == (id)1)
  {
    uint64_t v28 = *(void **)(a1 + 32);
    objc_super v29 = @"NFC DeviceRetrievalMethod supplied. Not supported. Skipping.";
    uint64_t v30 = 186;
LABEL_16:
    sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISODeviceEngagement initWithData:type:]_block_invoke", v30, v28, v29, v26, v27, v35);
  }
LABEL_18:

LABEL_11:
}

id sub_10003190C(void *a1, void *a2)
{
  id v3 = a2;
  if (!a1)
  {
    id v15 = 0;
    goto LABEL_14;
  }
  id v4 = +[CBOR cborWithInteger:0];
  id v5 = +[CBOR cborWithInteger:1];
  id v6 = +[CBOR cborWithInteger:10];
  uint64_t v7 = +[CBOR cborWithInteger:11];
  uint64_t v8 = +[CBOR cborWithInteger:20];
  uint64_t v9 = [v3 objectForKeyedSubscript:v4];
  unsigned int v10 = [v9 BOOLValue];

  uint64_t v11 = [v3 objectForKeyedSubscript:v5];
  unsigned int v12 = [v11 BOOLValue];

  if (v10 & 1) != 0 || (v12)
  {
    uint64_t v35 = v5;
    id v36 = v4;
    id v37 = v8;
    if (v10)
    {
      id v16 = [v3 objectForKeyedSubscript:v6];
      uint64_t v17 = [v16 data];

      uint64_t v18 = [v3 objectForKeyedSubscript:v8];
      uint64_t v19 = [v18 data];

      if (!v12)
      {
LABEL_7:
        uint64_t v20 = 0;
LABEL_10:
        unint64_t v24 = (void *)v17;
        id v25 = [a1 initWithType:2 version:1];
        uint64_t v26 = v25;
        id v4 = v36;
        if (v25)
        {
          v25[24] = v10;
          id v27 = [v24 copy];
          uint64_t v28 = (void *)v26[4];
          void v26[4] = v27;

          *((unsigned char *)v26 + 25) = v12;
          id v29 = [v20 copy];
          uint64_t v30 = (void *)v26[5];
          v26[5] = v29;

          id v31 = [v19 copy];
          uint64_t v32 = (void *)v26[6];
          void v26[6] = v31;
        }
        a1 = v26;

        id v15 = a1;
        uint64_t v8 = v37;
        id v5 = v35;
        goto LABEL_13;
      }
    }
    else
    {
      uint64_t v17 = 0;
      uint64_t v19 = 0;
      if (!v12) {
        goto LABEL_7;
      }
    }
    [v3 objectForKeyedSubscript:v7];
    char v21 = v7;
    v23 = uint64_t v22 = v6;
    uint64_t v20 = [v23 data];

    id v6 = v22;
    uint64_t v7 = v21;
    goto LABEL_10;
  }
  sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[ISODeviceRetrievalMethodBLE initWithOptions:]", 428, a1, @"Invalid BLE device retrieval method: supports neither peripheral nor central modes", v13, v14, v34);
  id v15 = 0;
LABEL_13:

LABEL_14:
  return v15;
}

void *sub_100031BB0(void *a1, void *a2, void *a3, uint64_t a4)
{
  id v8 = a2;
  id v9 = a3;
  if (a1)
  {
    v14.receiver = a1;
    v14.super_class = (Class)ISODeviceEngagement;
    id v10 = objc_msgSendSuper2(&v14, "init");
    a1 = v10;
    if (v10)
    {
      objc_storeStrong((id *)v10 + 2, a2);
      id v11 = [objc_alloc((Class)NSMutableArray) initWithArray:v9];
      unsigned int v12 = (void *)a1[4];
      a1[4] = v11;

      a1[1] = a4;
    }
  }

  return a1;
}

id *sub_100031CF4(id *a1)
{
  if (a1)
  {
    a1 = (id *)a1[2];
    uint64_t v1 = vars8;
  }
  return a1;
}

id *sub_100032020(uint64_t a1, void *a2)
{
  id v2 = a2;
  self;
  id v3 = sub_100030D98((id *)[ISODeviceEngagementNFC alloc], v2, 0);

  return v3;
}

void *sub_100032084(void *a1, void *a2, uint64_t a3)
{
  id v3 = a1;
  if (a1)
  {
    id v5 = a2;
    id v6 = +[NSNumber numberWithInteger:a3];
    id v10 = v6;
    uint64_t v7 = +[NSArray arrayWithObjects:&v10 count:1];
    id v8 = sub_100031BB0(v3, v5, v7, 0);

    id v3 = v8;
  }
  return v3;
}

id sub_100032320(id a1, char a2, char a3, void *a4, void *a5, void *a6)
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (a1)
  {
    objc_super v14 = [a1 initWithType:2 version:1];
    a1 = v14;
    if (v14)
    {
      v14[24] = a2;
      id v15 = [v11 copy];
      id v16 = (void *)*((void *)a1 + 4);
      *((void *)a1 + 4) = v15;

      *((unsigned char *)a1 + 25) = a3;
      id v17 = [v12 copy];
      uint64_t v18 = (void *)*((void *)a1 + 5);
      *((void *)a1 + 5) = v17;

      id v19 = [v13 copy];
      uint64_t v20 = (void *)*((void *)a1 + 6);
      *((void *)a1 + 6) = v19;
    }
  }

  return a1;
}

id *sub_100032774(uint64_t a1, void *a2)
{
  id v2 = a2;
  self;
  id v3 = sub_100030D98((id *)[ISODeviceEngagementQRCode alloc], v2, 2uLL);

  return v3;
}

void *sub_1000327D8(void *a1, void *a2, uint64_t a3, void *a4)
{
  if (!a1) {
    return 0;
  }
  id v7 = a4;
  id v8 = a2;
  id v9 = +[NSNumber numberWithInteger:a3];
  unsigned __int8 v23 = v9;
  id v10 = +[NSArray arrayWithObjects:&v23 count:1];
  id v11 = v8;
  id v12 = v10;
  id v13 = v7;
  v22.receiver = a1;
  v22.super_class = (Class)ISODeviceEngagement;
  id v14 = objc_msgSendSuper2(&v22, "init");
  id v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)v14 + 2, a2);
    id v16 = [objc_alloc((Class)NSMutableArray) initWithArray:v12];
    id v17 = (void *)v15[4];
    v15[4] = v16;

    v15[1] = 2;
    id v18 = [v13 copy];
    id v19 = (void *)v15[8];
    v15[8] = v18;
  }
  uint64_t v20 = v15;

  return v20;
}

id *sub_10003294C(uint64_t a1, void *a2)
{
  id v2 = a2;
  self;
  id v3 = sub_100030D98((id *)[UnifiedAccessDeviceEngagement alloc], v2, 1uLL);

  return v3;
}

id sub_1000329B0(uint64_t a1, void *a2)
{
  id v2 = a2;
  self;
  if (v2)
  {
    uint64_t v6 = *((void *)v2 + 1);
    if (v6 == 2)
    {
      id v9 = (void *)*((void *)v2 + 9);
      if (v9)
      {
        id v8 = v9;
      }
      else
      {
        uint64_t v26 = +[CBOR cborWithUnsignedInteger:0];
        id v27 = +[CBOR cborWithUnsignedInteger:1];
        uint64_t v72 = +[CBOR cborWithUnsignedInteger:2];
        id v28 = objc_alloc_init((Class)NSMutableDictionary);
        uint64_t v69 = 1;
        uint64_t v71 = +[NSString stringWithFormat:@"%ld.%ld"];
        id v29 = +[CBOR cborWithUTF8String:](CBOR, "cborWithUTF8String:");
        uint64_t v76 = (void *)v26;
        [v28 setObject:v29 forKeyedSubscript:v26];

        uint64_t v30 = +[NSData dataWithCOSEKey:*((void *)v2 + 2)];
        id v31 = *((id *)v2 + 4);
        uint64_t v32 = [v31 firstObject];
        uint64_t v33 = +[CBOR cborWithInteger:](CBOR, "cborWithInteger:", [v32 integerValue]);
        v86[0] = v33;
        uint64_t v70 = v30;
        uint64_t v34 = [v30 cborEncodeToBstrCbor];
        v86[1] = v34;
        uint64_t v35 = +[NSArray arrayWithObjects:v86 count:2];
        id v36 = +[CBOR cborWithArray:v35];
        [v28 setObject:v36 forKeyedSubscript:v27];

        id v37 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [*((id *)v2 + 8) count]);
        long long v82 = 0u;
        long long v83 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        id v38 = *((id *)v2 + 8);
        id v39 = [v38 countByEnumeratingWithState:&v82 objects:v81 count:16];
        if (v39)
        {
          id v40 = v39;
          uint64_t v41 = *(void *)v83;
          do
          {
            for (i = 0; i != v40; i = (char *)i + 1)
            {
              if (*(void *)v83 != v41) {
                objc_enumerationMutation(v38);
              }
              uint64_t v43 = [*(id *)(*((void *)&v82 + 1) + 8 * i) encode];
              [v37 addObject:v43];
            }
            id v40 = [v38 countByEnumeratingWithState:&v82 objects:v81 count:16];
          }
          while (v40);
        }

        uint64_t v44 = +[CBOR cborWithArray:v37];
        [v28 setObject:v44 forKeyedSubscript:v72];

        if ([*((id *)v2 + 6) count]) {
          [v28 addEntriesFromDictionary:*((void *)v2 + 6)];
        }
        v78 = v76;
        id v79 = v27;
        int v80 = v72;
        __int16 v45 = +[NSArray arrayWithObjects:&v78 count:3];
        uint64_t v46 = +[CBOR cborWithDictionary:v28 keyOrderList:v45];
        unsigned int v47 = (void *)*((void *)v2 + 9);
        *((void *)v2 + 9) = v46;

        id v8 = *((id *)v2 + 9);
      }
      CFStringRef v25 = @"QRCode";
      if (!v8) {
        goto LABEL_41;
      }
      goto LABEL_27;
    }
    if (v6 == 1)
    {
      id v10 = (void *)*((void *)v2 + 9);
      if (v10)
      {
        id v8 = v10;
      }
      else
      {
        uint64_t v53 = +[CBOR cborWithUnsignedInteger:0];
        id v54 = +[CBOR cborWithInteger:1];
        id v55 = objc_alloc_init((Class)NSMutableDictionary);
        uint64_t v69 = 1;
        uint64_t v74 = +[NSString stringWithFormat:@"%ld.%ld"];
        uint64_t v56 = +[CBOR cborWithUTF8String:](CBOR, "cborWithUTF8String:");
        v77 = (void *)v53;
        [v55 setObject:v56 forKeyedSubscript:v53];

        id v57 = objc_alloc_init((Class)NSMutableArray);
        long long v84 = 0u;
        long long v85 = 0u;
        long long v82 = 0u;
        long long v83 = 0u;
        id v58 = *((id *)v2 + 4);
        id v59 = [v58 countByEnumeratingWithState:&v82 objects:v81 count:16];
        if (v59)
        {
          id v60 = v59;
          uint64_t v61 = *(void *)v83;
          do
          {
            for (j = 0; j != v60; j = (char *)j + 1)
            {
              if (*(void *)v83 != v61) {
                objc_enumerationMutation(v58);
              }
              uint64_t v63 = +[CBOR cborWithInteger:](CBOR, "cborWithInteger:", [*(id *)(*((void *)&v82 + 1) + 8 * (void)j) integerValue]);
              [v57 addObject:v63];
            }
            id v60 = [v58 countByEnumeratingWithState:&v82 objects:v81 count:16];
          }
          while (v60);
        }

        uint64_t v64 = +[CBOR cborWithArray:v57];
        [v55 setObject:v64 forKeyedSubscript:v54];

        if ([*((id *)v2 + 6) count]) {
          [v55 addEntriesFromDictionary:*((void *)v2 + 6)];
        }
        v78 = v77;
        id v79 = v54;
        uint64_t v65 = +[NSArray arrayWithObjects:&v78 count:2];
        uint64_t v66 = +[CBOR cborWithDictionary:v55 keyOrderList:v65];
        id v67 = (void *)*((void *)v2 + 9);
        *((void *)v2 + 9) = v66;

        id v8 = *((id *)v2 + 9);
      }
      CFStringRef v25 = @"UA";
      if (!v8) {
        goto LABEL_41;
      }
      goto LABEL_27;
    }
    if (v6)
    {
LABEL_41:
      sub_100026000(OS_LOG_TYPE_ERROR, 0, (uint64_t)"+[NSData(ISODeviceEngagement) dataWithISODeviceEngagement:]", 672, @"Only NFC, UnifiedAccess and QRCode device engagement are supported", v3, v4, v5, v69);
      id v52 = 0;
      goto LABEL_42;
    }
    id v7 = (void *)*((void *)v2 + 9);
    if (v7)
    {
      id v8 = v7;
    }
    else
    {
      uint64_t v11 = +[CBOR cborWithUnsignedInteger:0];
      id v12 = +[CBOR cborWithUnsignedInteger:1];
      id v13 = objc_alloc_init((Class)NSMutableDictionary);
      uint64_t v69 = 1;
      char v73 = +[NSString stringWithFormat:@"%ld.%ld"];
      id v14 = +[CBOR cborWithUTF8String:](CBOR, "cborWithUTF8String:");
      v75 = (void *)v11;
      [v13 setObject:v14 forKeyedSubscript:v11];

      id v15 = +[NSData dataWithCOSEKey:*((void *)v2 + 2)];
      id v16 = *((id *)v2 + 4);
      id v17 = [v16 firstObject];
      id v18 = +[CBOR cborWithInteger:](CBOR, "cborWithInteger:", [v17 integerValue]);
      v81[0] = v18;
      id v19 = [v15 cborEncodeToBstrCbor];
      v81[1] = v19;
      uint64_t v20 = +[NSArray arrayWithObjects:v81 count:2];
      char v21 = +[CBOR cborWithArray:v20];
      [v13 setObject:v21 forKeyedSubscript:v12];

      if ([*((id *)v2 + 6) count]) {
        [v13 addEntriesFromDictionary:*((void *)v2 + 6)];
      }
      *(void *)&long long v82 = v75;
      *((void *)&v82 + 1) = v12;
      objc_super v22 = +[NSArray arrayWithObjects:&v82 count:2];
      uint64_t v23 = +[CBOR cborWithDictionary:v13 keyOrderList:v22];
      unint64_t v24 = (void *)*((void *)v2 + 9);
      *((void *)v2 + 9) = v23;

      id v8 = *((id *)v2 + 9);
    }
  }
  else
  {
    id v8 = 0;
  }
  CFStringRef v25 = @"NFC";
  if (!v8) {
    goto LABEL_41;
  }
LABEL_27:
  id v48 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.sts"];
  if ([v48 BOOLForKey:@"LogDeviceEngagement"]) {
    sub_1000260CC(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"+[NSData(ISODeviceEngagement) dataWithISODeviceEngagement:]", 679, (uint64_t)"[Type=%@] %@", v49, v50, v51, (uint64_t)v25);
  }
  id v52 = +[NSData dataWithCBOR:v8];

LABEL_42:

  return v52;
}

void *sub_100035C70(void *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  id v8 = (unsigned char *)result[4];
  if (!v8[9])
  {
    id v9 = result;
    sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013_3_Central invalidateAndUpdateStateSignal:reason:]_block_invoke", 633, v8, @"updateStateSignal=%d, status=%lu", a7, a8, *((unsigned __int8 *)result + 48));
    uint64_t v10 = v9[4];
    if (*(void *)(v10 + 48))
    {
      if (*((unsigned char *)v9 + 48))
      {
        [(id)v10 _signalConnectionStateChange:2];
        uint64_t v10 = v9[4];
      }
      [(id)v10 invalidatePeripheral];
      uint64_t v11 = v9[4];
      id v12 = *(void **)(v11 + 48);
      *(void *)(v11 + 48) = 0;

      uint64_t v10 = v9[4];
    }
    if ([*(id *)(v10 + 56) isScanning]) {
      [*(id *)(v9[4] + 56) stopScan];
    }
    uint64_t v13 = v9[4];
    id v14 = *(void **)(v13 + 56);
    *(void *)(v13 + 56) = 0;

    *(unsigned char *)(v9[4] + 9) = 1;
    unsigned int v15 = [(id)v9[4] isConnected];
    id v16 = (void *)v9[4];
    uint64_t v17 = v9[5];
    if (v15)
    {
      return [v16 _activateDisconnectBlock:v17];
    }
    else
    {
      return [v16 _activateConnectionBlock:v17 connectionState:0];
    }
  }
  return result;
}

void sub_1000361D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 160), 8);
  _Block_object_dispose((const void *)(v35 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100036208(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100036218(uint64_t a1)
{
}

void sub_100036220(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  if (*(void *)(v9 + 72))
  {
    uint64_t v10 = @"LE: data pending.";
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    uint64_t v12 = 688;
LABEL_3:
    sub_100025F04(v11, 0, (uint64_t)"-[ISO18013_3_Central writeData:toUUID:]_block_invoke", v12, (void *)v9, v10, a7, a8, v30);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    return;
  }
  if (!*(unsigned char *)(v9 + 8))
  {
    uint64_t v10 = @"Alt carrier no longer connected. Bail out";
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    uint64_t v12 = 694;
    goto LABEL_3;
  }
  uint64_t v13 = [*(id *)(a1 + 32) getCharacteristic:*(void *)(a1 + 40)];
  uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
  unsigned int v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  uint64_t v16 = objc_opt_new();
  uint64_t v17 = *(void *)(a1 + 32);
  id v18 = *(void **)(v17 + 72);
  *(void *)(v17 + 72) = v16;

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 72));
  uint64_t v19 = *(void *)(a1 + 32);
  uint64_t v20 = *(void *)(v19 + 72);
  char v21 = *(void **)(v19 + 80);
  if (v21)
  {
    sub_100016878(v20, v21);
  }
  else
  {
    sub_100004DB4(v20, *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40));
    unsigned __int16 v24 = (unsigned __int16)[*(id *)(*(void *)(a1 + 32) + 48) maximumWriteValueLengthForType:1];
    if ((v24 & 0xFFF0u) >= 0x1F0uLL)
    {
      sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013_3_Central writeData:toUUID:]_block_invoke", 711, *(void **)(a1 + 32), @"LE: Read MTU=%d is too large; override to MAX_ATTRIBUTE_SIZE",
        v22,
        v23,
        v30);
      unsigned __int16 v24 = 495;
    }
    CFStringRef v25 = +[NSUserDefaults standardUserDefaults];
    uint64_t v26 = (uint64_t)[v25 integerForKey:@"BTMtuOverride"];

    if (v26 >= 1)
    {
      sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013_3_Central writeData:toUUID:]_block_invoke", 718, *(void **)(a1 + 32), @"LE: user default MTU override=%d", v27, v28, v26);
      unsigned __int16 v24 = v26;
    }
    uint64_t v29 = *(void *)(*(void *)(a1 + 32) + 72);
    if (v29) {
      *(_WORD *)(v29 + 10) = v24;
    }
  }
}

void sub_100036400(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 72);
  *(void *)(v1 + 72) = 0;
}

id sub_100036410(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 48) canSendWriteWithoutResponse];
  if (v4) {
    [*(id *)(*(void *)(a1 + 32) + 48) writeValue:v3 forCharacteristic:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) type:1];
  }

  return v4;
}

void sub_100036478(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(void **)(v1 + 72);
  *(void *)(v1 + 72) = 0;
}

void sub_100036584(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10003659C(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v6 = a3;
  uint64_t v9 = v6;
  if (v6)
  {
    sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[ISO18013_3_Central getBluetoothStatusDict:]_block_invoke", 779, *(void **)(a1 + 32), @"LEStatus error:%@", v7, v8, (uint64_t)v6);
    if (*(void *)(a1 + 48)) {
      **(void **)(a1 + 48) = v9;
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

uint64_t sub_10003683C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t sub_100036938(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t sub_100036A14(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 104) + 16))();
  id v2 = objc_alloc_init((Class)NSMutableData);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 136);
  *(void *)(v3 + 136) = v2;

  return _objc_release_x1(v2, v4);
}

unsigned char *sub_100036EFC(unsigned char *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a1)
  {
    v8.receiver = a1;
    v8.super_class = (Class)STSConnectionHandoverHandler;
    id v6 = objc_msgSendSuper2(&v8, "init");
    a1 = v6;
    if (v6)
    {
      *((void *)v6 + 2) = a2;
      objc_storeWeak((id *)v6 + 3, v5);
      a1[8] = (a2 & 0x40) != 0;
    }
  }

  return a1;
}

uint64_t sub_100036F80(uint64_t a1, uint64_t a2, void *a3)
{
  if (a1 && a3)
  {
    NSErrorUserInfoKey v7 = NSLocalizedDescriptionKey;
    objc_super v8 = off_100066158;
    uint64_t v4 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
    id v5 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:1 userInfo:v4];

    *a3 = v5;
  }
  return 0;
}

id sub_100037068(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8 = a2;
  if (a1)
  {
    uint64_t v9 = +[STSConnectionHandover connectionHandoverWithData:v8];
    id v10 = v9;
    if (v9)
    {
      if ([v9 majorVersion] == (id)1)
      {
        v104 = a4;
        uint64_t v120 = *(void *)(a1 + 16);
        id v13 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.sts"];
        uint64_t v14 = [v13 stringForKey:@"DeviceEngagement"];
        unsigned int v15 = +[NSData STS_dataFromHexString:v14];
        if ([v15 length])
        {
          uint64_t v16 = [v14 debugDescription];
          sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSConnectionHandoverHandler _generateDeviceEngagementRecord]", 950, (void *)a1, @"Device Engagement override: %@", v17, v18, (uint64_t)v16);
        }
        id v106 = a2;
        v107 = a3;
        if ((*(unsigned char *)(a1 + 16) & 0x20) != 0)
        {
          CFStringRef v25 = [UnifiedAccessDeviceEngagement alloc];
          if (v25) {
            uint64_t v19 = sub_100031BB0(v25, 0, &off_10005B0B0, 1);
          }
          else {
            uint64_t v19 = 0;
          }
          if ([v15 length])
          {
            id v26 = v15;
          }
          else
          {
            sub_1000329B0((uint64_t)NSData, v19);
            id v26 = (id)objc_claimAutoreleasedReturnValue();
          }
          uint64_t v20 = *(void **)(a1 + 48);
          *(void *)(a1 + 48) = v26;
        }
        else
        {
          uint64_t v19 = [objc_alloc((Class)COSEKey) initWithData:*(void *)(a1 + 32)];
          uint64_t v20 = sub_100032084([ISODeviceEngagementNFC alloc], v19, 1);
          if ([v15 length])
          {
            id v21 = v15;
          }
          else
          {
            sub_1000329B0((uint64_t)NSData, v20);
            id v21 = (id)objc_claimAutoreleasedReturnValue();
          }
          uint64_t v27 = *(void **)(a1 + 48);
          *(void *)(a1 + 48) = v21;
        }
        uint64_t v28 = +[NSData dataWithBytes:"iso.org:18013:deviceengagement" length:30];
        uint64_t v29 = +[NSData dataWithBytes:"mdoc" length:4];
        v114 = [[STSNDEFRecord alloc] initWithFormat:4 type:v28 identifier:v29 payload:*(void *)(a1 + 48)];

        if ((v120 & 6) != 0) {
          int v30 = 1;
        }
        else {
          int v30 = v120 & 1;
        }
        if (v30) {
          sub_100037D1C((void *)a1);
        }
        long long v124 = 0u;
        long long v125 = 0u;
        long long v122 = 0u;
        long long v123 = 0u;
        v108 = v10;
        id obj = [v10 alternativeCarriers];
        id v31 = [obj countByEnumeratingWithState:&v122 objects:v129 count:16];
        uint64_t v112 = a1;
        uint64_t v32 = v114;
        if (v31)
        {
          id v33 = v31;
          id v105 = v8;
          uint64_t v34 = 0;
          v118 = 0;
          uint64_t v35 = 0;
          char v36 = 0;
          char v37 = 0;
          v113 = 0;
          uint64_t v38 = *(void *)v123;
          while (1)
          {
            for (i = 0; i != v33; i = (char *)i + 1)
            {
              if (*(void *)v123 != v38) {
                objc_enumerationMutation(obj);
              }
              id v40 = *(void **)(*((void *)&v122 + 1) + 8 * i);
              id v41 = [v40 type];
              if ((v37 & 1) == 0 && v41 == (id)2) {
                char v37 = 1;
              }
              id v43 = [v40 type];
              if ((v36 & 1) == 0 && v43 == (id)1) {
                char v36 = 1;
              }
              if ((v120 & 6) != 0 && !v35 && *(void *)(a1 + 96) == 1 && [v40 type] == (id)2)
              {
                uint64_t v115 = v34;
                id v45 = v40;
                v117 = v32;
                id v46 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.sts"];
                if ([v46 BOOLForKey:@"ReaderBTDevEngagementRequestOverride"])
                {
                  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSConnectionHandoverHandler _matchBTCapabilityWithRequest:deviceEngagementRecord:]", 765, (void *)a1, @"Reader BT device engagement override enable", v47, v48, v103);
                  LOBYTE(v49) = 1;
                  LOBYTE(a1) = 1;
                }
                else
                {
                  unint64_t v51 = *(void *)(a1 + 16);
                  uint64_t v49 = (v51 >> 1) & 1;
                  a1 = (v51 >> 2) & 1;
                }
                id v52 = (char *)[v45 leRole];
                if ((unint64_t)(v52 - 2) < 2)
                {
LABEL_61:
                  if ((v49 & 1) == 0) {
                    goto LABEL_68;
                  }
                  int v55 = 0;
                  int v56 = 1;
                  uint64_t v110 = 1;
                }
                else
                {
                  if (v52 != (char *)1)
                  {
                    if (!v52) {
                      goto LABEL_61;
                    }
LABEL_68:
                    a1 = v112;
                    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSConnectionHandoverHandler _matchBTCapabilityWithRequest:deviceEngagementRecord:]", 788, (void *)v112, @"Invalid BLE role", v53, v54, v103);
                    uint64_t v35 = 0;
LABEL_81:
                    uint64_t v32 = v114;

                    if (v35)
                    {
                      uint64_t v69 = [v45 leAddr];

                      v113 = (void *)v69;
                    }
                    uint64_t v34 = v115;
                    continue;
                  }
                  if ((a1 & 1) == 0) {
                    goto LABEL_68;
                  }
                  int v56 = 0;
                  uint64_t v110 = 0;
                  int v55 = 1;
                }
                uint64_t v57 = +[ISO18013_3_Peripheral getAddress];
                uint64_t v111 = v57;
                if (v56)
                {
                  id v60 = [v45 advertiseUUID];
                  id v61 = [v60 length];

                  if (v61 == (id)16)
                  {
                    uint64_t v62 = [v45 advertiseUUID];
                  }
                  else
                  {
                    uint64_t v62 = 0;
                  }
                  uint64_t v63 = v111;
                  a1 = v112;
                  CFStringRef v64 = @"Central";
                  if (!(v111 | v62))
                  {
                    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSConnectionHandoverHandler _matchBTCapabilityWithRequest:deviceEngagementRecord:]", 800, (void *)v112, @"No valid advertise address nor UUID found", v58, v59, v103);
                    uint64_t v35 = 0;
LABEL_80:

                    goto LABEL_81;
                  }
                }
                else
                {
                  uint64_t v63 = v57;
                  if (v55)
                  {
                    uint64_t v62 = sub_100039D3C();
                  }
                  else
                  {
                    uint64_t v62 = 0;
                  }
                  CFStringRef v64 = @"Peripheral";
                  a1 = v112;
                }
                id v109 = v46;
                sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSConnectionHandoverHandler _matchBTCapabilityWithRequest:deviceEngagementRecord:]", 808, (void *)a1, @"Role=%@, advertiseUUID: %@, advertiseAddress: %@", v58, v59, (uint64_t)v64);
                uint64_t v65 = [STSCHBluetoothAlternativeCarrier alloc];
                uint64_t v66 = v63;
                id v67 = v65;
                if (v114)
                {
                  v131[0] = v117;
                  id v68 = +[NSArray arrayWithObjects:v131 count:1];
                  uint64_t v35 = [(STSCHBluetoothAlternativeCarrier *)v67 initWithAddress:v66 advertiseUUID:v62 role:v110 powerState:1 auxiliaryRecords:v68];

                  a1 = v112;
                }
                else
                {
                  uint64_t v35 = [(STSCHBluetoothAlternativeCarrier *)v65 initWithAddress:v66 advertiseUUID:v62 role:v110 powerState:1 auxiliaryRecords:&__NSArray0__struct];
                }

                id v46 = v109;
                goto LABEL_80;
              }
              if ((v120 & 1) != 0 && !v34 && *(void *)(a1 + 88) == 1 && [v40 type] == (id)1)
              {
                uint64_t v34 = sub_100037EE8((void *)a1, v40, v32);
              }
              else if ((v120 & 0x20) != 0 && [v40 type] == (id)3)
              {
                uint64_t v50 = sub_1000380FC((unsigned char *)a1, v40, v32);

                v118 = (void *)v50;
              }
            }
            id v33 = [obj countByEnumeratingWithState:&v122 objects:v129 count:16];
            if (!v33)
            {
              unsigned int v70 = v36 & 1;
              int v71 = v37 & 1;
              id v8 = v105;
              goto LABEL_88;
            }
          }
        }
        uint64_t v34 = 0;
        v118 = 0;
        uint64_t v35 = 0;
        unsigned int v70 = 0;
        int v71 = 0;
        v113 = 0;
LABEL_88:

        if ((v120 & 0x20) != 0)
        {
          char v73 = 0;
          uint64_t v72 = v118;
        }
        else
        {
          if (v34) {
            uint64_t v72 = (void *)v34;
          }
          else {
            uint64_t v72 = v35;
          }
          if (v34) {
            char v73 = 0;
          }
          else {
            char v73 = -1;
          }
          if (!v34 && !v35)
          {
            id v74 = 0;
            char v73 = 0;
LABEL_100:
            id v75 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.sts"];
            id v76 = [v75 integerForKey:@"ACConfigOverride"];
            v116 = (void *)v34;
            char v121 = v73;
            if (v76 == (id)1 && v35)
            {
              sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSConnectionHandoverHandler processHandoverRequestMessage:response:outError:]", 164, (void *)v112, @"Forcing Ble config", v77, v78, v103);
              id v79 = v35;
LABEL_106:
              id v80 = v79;

              id v74 = v80;
LABEL_107:
              id v128 = v74;
              long long v83 = +[NSArray arrayWithObjects:&v128 count:1];
LABEL_108:
              sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSConnectionHandoverHandler processHandoverRequestMessage:response:outError:]", 188, (void *)v112, @"Selected AC: %@, readerRequestedWifi=%d, readerRequestedBt=%d, wifiState=%lu, btState=%lu", v81, v82, (uint64_t)v74);
              long long v84 = [v75 stringForKey:@"HandoverSelectOverride"];
              long long v85 = +[NSData STS_dataFromHexString:v84];
              if ([v85 length]) {
                sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSConnectionHandoverHandler processHandoverRequestMessage:response:outError:]", 193, (void *)v112, @"Handover select override: %@", v86, v87, (uint64_t)v84);
              }
              if (!v85)
              {
                long long v85 = +[STSConnectionHandover selectWithAlternativeCarriers:v83 error:0];
              }
              if (v121) {
                [v74 setLeAddr:v113];
              }
              objc_storeStrong((id *)(v112 + 56), v106);
              objc_storeStrong((id *)(v112 + 64), v85);
              id v88 = v85;
              void *v107 = v88;
              uint64_t v89 = 2;
              if (!v71) {
                uint64_t v89 = 0;
              }
              CFStringRef v126 = @"readerRequestedTransport";
              v90 = +[NSNumber numberWithUnsignedInteger:v89 | v70];
              v127 = v90;
              v91 = +[NSDictionary dictionaryWithObjects:&v127 forKeys:&v126 count:1];

              id v92 = +[STSAnalyticsLogger sharedCALogger];
              [v92 postISOHandoverEvent:v91 prepOnly:1];

              id v24 = v74;
              id v10 = v108;
              goto LABEL_117;
            }
            if (v76 == (id)2 && v34)
            {
              sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSConnectionHandoverHandler processHandoverRequestMessage:response:outError:]", 167, (void *)v112, @"Forcing Wifi config", v77, v78, v103);
              id v79 = (void *)v34;
              goto LABEL_106;
            }
            if (v74) {
              goto LABEL_107;
            }
            v130[0] = NSLocalizedDescriptionKey;
            v131[0] = off_100066180;
            uint64_t v94 = +[NSDictionary dictionaryWithObjects:v131 forKeys:v130 count:1];
            id v95 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:6 userInfo:v94];

            if (v70 && sub_1000383F0() && *(void *)(v112 + 88) == 2)
            {
              uint64_t v98 = +[NSError errorWithDomain:@"WifiDomain" code:3 userInfo:0];
              uint64_t v99 = (void *)v98;
              CFStringRef v100 = @"Wifi specific error";
            }
            else
            {
              if (!v71 || *(void *)(v112 + 96) != 2) {
                goto LABEL_130;
              }
              uint64_t v98 = +[NSError errorWithDomain:@"BluetoothDomain" code:0 userInfo:0];
              uint64_t v99 = (void *)v98;
              CFStringRef v100 = @"Bluetooth specific error";
            }
            v130[0] = NSLocalizedDescriptionKey;
            v130[1] = NSUnderlyingErrorKey;
            v131[0] = v100;
            v131[1] = v98;
            id v101 = +[NSDictionary dictionaryWithObjects:v131 forKeys:v130 count:2];
            uint64_t v102 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:12 userInfo:v101];

            id v95 = (void *)v102;
LABEL_130:
            if (v104) {
              void *v104 = v95;
            }
            sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSConnectionHandoverHandler processHandoverRequestMessage:response:outError:]", 181, (void *)v112, @"Unable to find a matching carrier, %@", v96, v97, (uint64_t)v95);

            id v74 = 0;
            long long v83 = &__NSArray0__struct;
            goto LABEL_108;
          }
        }
        id v74 = v72;
        goto LABEL_100;
      }
      sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSConnectionHandoverHandler processHandoverRequestMessage:response:outError:]", 92, (void *)a1, @"CH major version not supported", v11, v12, v103);
    }
    *a3 = +[STSConnectionHandover selectWithAlternativeCarriers:&__NSArray0__struct error:0];
    if (a4)
    {
      v130[0] = NSLocalizedDescriptionKey;
      v131[0] = off_1000661A8;
      uint64_t v22 = +[NSDictionary dictionaryWithObjects:v131 forKeys:v130 count:1];
      uint64_t v23 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:11 userInfo:v22];

      id v24 = 0;
      *a4 = v23;
    }
    else
    {
      id v24 = 0;
    }
LABEL_117:

    goto LABEL_118;
  }
  id v24 = 0;
LABEL_118:

  return v24;
}

void sub_100037D1C(void *a1)
{
  if (!a1) {
    return;
  }
  uint64_t v2 = a1[2] & 6;
  if ((a1[2] & 1) == 0) {
    goto LABEL_9;
  }
  if (sub_1000383F0())
  {
    uint64_t v3 = sub_1000261A8();
    if (os_signpost_enabled(v3))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "WifiHWStateCheck", "", buf, 2u);
    }

    a1[11] = sub_100022E1C();
    uint64_t v4 = sub_1000261A8();
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "WifiHWStateCheck", "", v9, 2u);
    }

LABEL_9:
    if (!v2) {
      return;
    }
    goto LABEL_12;
  }
  a1[11] = 0;
  if (!v2) {
    return;
  }
LABEL_12:
  id v5 = sub_1000261A8();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)id v8 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "BleHWStateCheck", "", v8, 2u);
  }

  a1[12] = sub_10001118C();
  id v6 = sub_1000261A8();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)NSErrorUserInfoKey v7 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "BleHWStateCheck", "", v7, 2u);
  }
}

STSCHWiFiAwareAlternativeCarrier *sub_100037EE8(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  sub_100025F04(OS_LOG_TYPE_DEFAULT, 1, (uint64_t)"-[STSConnectionHandoverHandler _matchWifiCapabilityWithSubscriber:deviceEngagementRecord:]", 884, a1, @"subscriber=%@", v7, v8, (uint64_t)v6);
  uint64_t v9 = sub_10000AD48();
  id v10 = [v6 securityInfo];

  uint64_t v11 = sub_10000C6C8(v9, v10, 1);

  [v11 setCipherSuite:&off_10005B098];
  uint64_t v12 = [STSDiffieHellmanParameter alloc];
  id v13 = sub_10000B01C((uint64_t)v9);
  uint64_t v14 = [(STSDiffieHellmanParameter *)v12 initWithKeyGroup:19 key:v13];

  uint64_t v23 = v14;
  unsigned int v15 = +[NSArray arrayWithObjects:&v23 count:1];
  [v11 setDhInfo:v15];

  uint64_t v16 = sub_100022EC4();
  uint64_t v17 = [STSCHWiFiAwareAlternativeCarrier alloc];
  uint64_t v18 = v17;
  if (v5)
  {
    id v22 = v5;
    uint64_t v19 = +[NSArray arrayWithObjects:&v22 count:1];
    uint64_t v20 = [(STSCHWiFiAwareAlternativeCarrier *)v18 initWithSecurityInfo:v11 discoveryChannelInfo:v16 powerState:1 auxiliaryRecords:v19];
  }
  else
  {
    uint64_t v20 = [(STSCHWiFiAwareAlternativeCarrier *)v17 initWithSecurityInfo:v11 discoveryChannelInfo:v16 powerState:1 auxiliaryRecords:&__NSArray0__struct];
  }

  return v20;
}

STSCHNfcAlternativeCarrier *sub_1000380FC(unsigned char *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v8 = a3;
  if ((a1[16] & 0x20) == 0)
  {
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSConnectionHandoverHandler _matchNfcReader:deviceEngagementRecord:]", 915, a1, @"NFC not supported", v6, v7, v28);
LABEL_23:
    uint64_t v23 = 0;
    goto LABEL_28;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v9 = [v5 auxiliaryRecords];
  id v10 = [v9 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v10)
  {
    id v11 = v10;
    id v29 = v8;
    id v30 = v5;
    uint64_t v12 = *(void *)v36;
    LOBYTE(v13) = 1;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v36 != v12) {
          objc_enumerationMutation(v9);
        }
        unsigned int v15 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        if ([v15 isISO18013ReaderEngagementRecord])
        {
          uint64_t v16 = [v15 payload];
          uint64_t v17 = sub_10001CA48((uint64_t)UnifiedAccessReaderEngagement, v16);

          sub_100025F04(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSConnectionHandoverHandler _matchNfcReader:deviceEngagementRecord:]", 925, a1, @"reader DE=%@", v18, v19, (uint64_t)v17);
          long long v33 = 0u;
          long long v34 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          uint64_t v20 = [v17 cipherSuites];
          id v13 = [v20 countByEnumeratingWithState:&v31 objects:v40 count:16];
          if (v13)
          {
            uint64_t v21 = *(void *)v32;
            while (2)
            {
              for (j = 0; j != v13; j = (char *)j + 1)
              {
                if (*(void *)v32 != v21) {
                  objc_enumerationMutation(v20);
                }
                if ([*(id *)(*((void *)&v31 + 1) + 8 * (void)j) integerValue] == (id)-10)
                {
                  LOBYTE(v13) = 1;
                  goto LABEL_19;
                }
              }
              id v13 = [v20 countByEnumeratingWithState:&v31 objects:v40 count:16];
              if (v13) {
                continue;
              }
              break;
            }
          }
LABEL_19:
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v11);

    id v8 = v29;
    id v5 = v30;
    if ((v13 & 1) == 0) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  id v24 = [STSCHNfcAlternativeCarrier alloc];
  CFStringRef v25 = v24;
  if (v8)
  {
    id v39 = v8;
    id v26 = +[NSArray arrayWithObjects:&v39 count:1];
    uint64_t v23 = [(STSCHNfcAlternativeCarrier *)v25 initWithMaxLcField:0 maxLeField:0 auxiliaryRecords:v26];
  }
  else
  {
    uint64_t v23 = [(STSCHNfcAlternativeCarrier *)v24 initWithMaxLcField:0 maxLeField:0 auxiliaryRecords:&__NSArray0__struct];
  }
LABEL_28:

  return v23;
}

uint64_t sub_1000383F0()
{
  uint64_t result = os_variant_has_internal_ui();
  if (result)
  {
    id v1 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.sts"];
    id v2 = [v1 BOOLForKey:@"EnableWifi"];

    return (uint64_t)v2;
  }
  return result;
}

id sub_100038450(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8 = a2;
  if (a1)
  {
    if (*(unsigned char *)(a1 + 8))
    {
      objc_storeStrong((id *)(a1 + 48), a2);
      sub_100032774((uint64_t)ISODeviceEngagementQRCode, v8);
      uint64_t v9 = (id *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        *a3 = +[STSConnectionHandover selectWithAlternativeCarriers:&__NSArray0__struct error:0];
        if (a4)
        {
          v151[0] = NSLocalizedDescriptionKey;
          v152[0] = off_1000661E0;
          +[NSDictionary dictionaryWithObjects:v152 forKeys:v151 count:1];
          v86 = long long v85 = a4;
          uint64_t v87 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:18 userInfo:v86];

          id v84 = 0;
          void *v85 = v87;
        }
        else
        {
          id v84 = 0;
        }
LABEL_113:

        goto LABEL_114;
      }
      long long v122 = a4;
      long long v123 = a3;
      long long v125 = v8;
      id v126 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.sts"];
      if ([v126 BOOLForKey:@"LogDeviceEngagement"]) {
        sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSConnectionHandoverHandler processQRCodeHandoverRequestMessage:response:outError:]", 249, (void *)a1, @"[Type=QRCode] %@", v10, v11, (uint64_t)v9);
      }
      id v12 = objc_alloc((Class)NSMutableArray);
      id v13 = v9[8];
      id v133 = objc_msgSend(v12, "initWithCapacity:", objc_msgSend(v13, "count"));

      long long v144 = 0u;
      long long v145 = 0u;
      long long v142 = 0u;
      long long v143 = 0u;
      long long v124 = v9;
      id v14 = v9[8];
      id v15 = [v14 countByEnumeratingWithState:&v142 objects:v150 count:16];
      v130 = (void *)a1;
      if (v15)
      {
        id v18 = v15;
        uint64_t v19 = *(void *)v143;
        uint64_t v20 = "-[STSConnectionHandoverHandler processQRCodeHandoverRequestMessage:response:outError:]";
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v143 != v19) {
              objc_enumerationMutation(v14);
            }
            id v22 = *(void **)(*((void *)&v142 + 1) + 8 * i);
            if (v22)
            {
              uint64_t v23 = v22[1];
              switch(v23)
              {
                case 1:
                  uint64_t v41 = (uint64_t)v20;
                  uint64_t v42 = 292;
                  id v43 = (void *)a1;
                  uint64_t v44 = @"NFC DeviceRetrievalMethod supplied. Not supported. Skipping.";
LABEL_31:
                  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, v41, v42, v43, v44, v16, v17, v120);
                  continue;
                case 3:
                  uint64_t v41 = (uint64_t)v20;
                  uint64_t v42 = 288;
                  id v43 = (void *)a1;
                  uint64_t v44 = @"WiFi DeviceRetrievalMethod supplied. Not supported. Skipping.";
                  goto LABEL_31;
                case 2:
                  id v24 = v22;
                  CFStringRef v25 = v24;
                  int v26 = *((unsigned __int8 *)v24 + 24);
                  if (v26 | *((unsigned __int8 *)v24 + 25))
                  {
                    if (*((unsigned char *)v24 + 25)) {
                      BOOL v27 = v26 == 0;
                    }
                    else {
                      BOOL v27 = 1;
                    }
                    uint64_t v28 = 2;
                    if (v27) {
                      uint64_t v28 = 0;
                    }
                    BOOL v29 = v26 == 0;
                    if (*((unsigned char *)v24 + 24)) {
                      uint64_t v30 = v28;
                    }
                    else {
                      uint64_t v30 = 1;
                    }
                    uint64_t v135 = v30;
                    long long v31 = &OBJC_IVAR___ISODeviceRetrievalMethodBLE__centralClientModeUUID;
                    if (!v29) {
                      long long v31 = &OBJC_IVAR___ISODeviceRetrievalMethodBLE__peripheralServerModeUUID;
                    }
                    id v32 = *(id *)((char *)v24 + *v31);
                    id v121 = v25[6];
                    sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)v20, 277, (void *)a1, @"BT advertiseUUID: %@, advertisePerihperhalAddress: %@", v33, v34, (uint64_t)v32);

                    long long v35 = [STSCHBluetoothAlternativeCarrier alloc];
                    id v36 = v25[6];
                    objc_msgSend(v32, "STS_reverseBytes");
                    id v37 = v14;
                    id v39 = v38 = v20;
                    id v40 = [(STSCHBluetoothAlternativeCarrier *)v35 initWithAddress:v36 advertiseUUID:v39 role:v135 powerState:1 auxiliaryRecords:&__NSArray0__struct];

                    uint64_t v20 = v38;
                    id v14 = v37;

                    a1 = (uint64_t)v130;
                    [v133 addObject:v40];
                  }
                  break;
              }
            }
          }
          id v18 = [v14 countByEnumeratingWithState:&v142 objects:v150 count:16];
        }
        while (v18);
      }

      id v45 = v133;
      id v46 = sub_10003916C((unsigned char *)a1, v125);
      sub_100016EA4(a1, v46);

      uint64_t v47 = *(void *)(a1 + 16);
      uint64_t v48 = v47 & 6;
      char v132 = v47;
      uint64_t v49 = v47 & 1;
      uint64_t v134 = v49;
      uint64_t v136 = v48;
      if (v48) {
        LODWORD(v49) = 1;
      }
      if (v49) {
        sub_100037D1C((void *)a1);
      }
      long long v140 = 0u;
      long long v141 = 0u;
      long long v138 = 0u;
      long long v139 = 0u;
      id v50 = v45;
      id v51 = [v50 countByEnumeratingWithState:&v138 objects:v149 count:16];
      id v128 = v50;
      id v52 = 0;
      uint64_t v53 = 0;
      if (v51)
      {
        v131 = 0;
        char v54 = 0;
        char v55 = 0;
        uint64_t v56 = *(void *)v139;
        do
        {
          for (j = 0; j != v51; j = (char *)j + 1)
          {
            if (*(void *)v139 != v56) {
              objc_enumerationMutation(v50);
            }
            uint64_t v58 = *(void **)(*((void *)&v138 + 1) + 8 * (void)j);
            id v59 = [v58 type];
            if ((v55 & 1) == 0 && v59 == (id)2) {
              char v55 = 1;
            }
            id v61 = [v58 type];
            if ((v54 & 1) == 0 && v61 == (id)1) {
              char v54 = 1;
            }
            if (v136 && !v52 && *(void *)(a1 + 96) == 1 && [v58 type] == (id)2)
            {
              uint64_t v129 = v53;
              id v63 = v58;
              id v64 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.sts"];
              if ([v64 BOOLForKey:@"ReaderBTDevEngagementRequestOverride"])
              {
                sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSConnectionHandoverHandler _matchQRCodeBTCapabilityWithRequest:deviceEngagementRecord:]", 831, (void *)a1, @"Reader BT device engagement override enable", v65, v66, v120);
                LOBYTE(v67) = 1;
                LOBYTE(a1) = 1;
              }
              else
              {
                unint64_t v69 = *(void *)(a1 + 16);
                uint64_t v67 = (v69 >> 1) & 1;
                a1 = (v69 >> 2) & 1;
              }
              switch((unint64_t)[v63 leRole])
              {
                case 0uLL:
                case 2uLL:
                  if ((v67 & 1) == 0) {
                    goto LABEL_78;
                  }
                  uint64_t v72 = [v63 advertiseUUID];
                  id v73 = [v72 length];

                  if (v73 == (id)16)
                  {
                    uint64_t v76 = [v63 advertiseUUID];
                    if (v76)
                    {
                      uint64_t v77 = (void *)v76;
                      uint64_t v127 = 1;
                      CFStringRef v78 = @"Central";
                      goto LABEL_77;
                    }
                  }
                  a1 = (uint64_t)v130;
                  sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSConnectionHandoverHandler _matchQRCodeBTCapabilityWithRequest:deviceEngagementRecord:]", 864, v130, @"No valid advertise address nor UUID found", v74, v75, v120);
                  uint64_t v77 = 0;
                  uint64_t v127 = 1;
                  CFStringRef v78 = @"Central";
                  goto LABEL_80;
                case 1uLL:
                case 3uLL:
                  if ((a1 & 1) == 0) {
                    goto LABEL_78;
                  }
                  uint64_t v77 = [v63 advertiseUUID];
                  uint64_t v127 = 0;
                  CFStringRef v78 = @"Peripheral";
LABEL_77:
                  a1 = (uint64_t)v130;
LABEL_80:
                  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSConnectionHandoverHandler _matchQRCodeBTCapabilityWithRequest:deviceEngagementRecord:]", 871, (void *)a1, @"Role=%@, advertiseUUID: %@, advertiseAddress: %@", v74, v75, (uint64_t)v78);
                  id v52 = [[STSCHBluetoothAlternativeCarrier alloc] initWithAddress:0 advertiseUUID:v77 role:v127 powerState:1 auxiliaryRecords:&__NSArray0__struct];

                  break;
                default:
LABEL_78:
                  a1 = (uint64_t)v130;
                  sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSConnectionHandoverHandler _matchQRCodeBTCapabilityWithRequest:deviceEngagementRecord:]", 852, v130, @"Invalid BLE role", v70, v71, v120);
                  id v52 = 0;
                  break;
              }

              id v50 = v128;
              uint64_t v53 = v129;
            }
            else if (v134 && !v53 && *(void *)(a1 + 88) == 1 && [v58 type] == (id)1)
            {
              uint64_t v53 = sub_100037EE8((void *)a1, v58, 0);
            }
            else if ((v132 & 0x20) != 0 && [v58 type] == (id)3)
            {
              uint64_t v68 = sub_1000380FC((unsigned char *)a1, v58, 0);

              v131 = (void *)v68;
            }
          }
          id v51 = [v50 countByEnumeratingWithState:&v138 objects:v149 count:16];
        }
        while (v51);
        unsigned int v79 = v54 & 1;
        LODWORD(v51) = v55 & 1;
        id v80 = v131;
      }
      else
      {
        id v80 = 0;
        unsigned int v79 = 0;
      }

      id v88 = v80;
      if ((v132 & 0x20) != 0 || (!v53 ? (id v88 = v52) : (id v88 = (void *)v53), v53 || v52)) {
        id v89 = v88;
      }
      else {
        id v89 = 0;
      }
      id v90 = [v126 integerForKey:@"ACConfigOverride"];
      v137 = v52;
      if (v90 == (id)1 && v52)
      {
        sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSConnectionHandoverHandler processQRCodeHandoverRequestMessage:response:outError:]", 365, v130, @"Forcing Ble config", v91, v92, v120);
        uint64_t v93 = v52;
LABEL_104:
        uint64_t v94 = (void *)v53;
        id v95 = v93;

        id v89 = v95;
LABEL_105:
        id v148 = v89;
        uint64_t v98 = +[NSArray arrayWithObjects:&v148 count:1];
        uint64_t v99 = 0;
LABEL_106:
        uint64_t v100 = v79;
        sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"[(STSConnectionHandoverHandler *)"Selected AC: %@ processQRCodeHandoverRequestMessage:readerRequestedBt=%d response:wifiState=%lu outError:btState=%lu""], v96, v97, (uint64_t)v89);
        id v101 = [v126 stringForKey:@"HandoverSelectOverride"];
        uint64_t v102 = +[NSData STS_dataFromHexString:v101];
        if ([v102 length]) {
          sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSConnectionHandoverHandler processQRCodeHandoverRequestMessage:response:outError:]", 394, v130, @"Handover select override: %@", v103, v104, (uint64_t)v101);
        }
        if (!v102)
        {
          uint64_t v102 = +[STSConnectionHandover selectWithAlternativeCarriers:v98 error:0];
        }
        id v105 = v102;
        *long long v123 = v105;
        uint64_t v106 = 2;
        if (!v51) {
          uint64_t v106 = 0;
        }
        CFStringRef v146 = @"readerRequestedTransport";
        v107 = +[NSNumber numberWithUnsignedInteger:v106 | v100];
        v147 = v107;
        v108 = +[NSDictionary dictionaryWithObjects:&v147 forKeys:&v146 count:1];

        id v109 = +[STSAnalyticsLogger sharedCALogger];
        [v109 postISOHandoverEvent:v108 prepOnly:1];

        id v84 = v89;
        uint64_t v9 = v124;
        id v8 = v125;
        goto LABEL_113;
      }
      if (v90 == (id)2 && v53)
      {
        sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSConnectionHandoverHandler processQRCodeHandoverRequestMessage:response:outError:]", 368, v130, @"Forcing Wifi config", v91, v92, v120);
        uint64_t v93 = (void *)v53;
        goto LABEL_104;
      }
      uint64_t v94 = (void *)v53;
      if (v89) {
        goto LABEL_105;
      }
      v151[0] = NSLocalizedDescriptionKey;
      v152[0] = off_100066180;
      uint64_t v111 = +[NSDictionary dictionaryWithObjects:v152 forKeys:v151 count:1];
      uint64_t v112 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:6 userInfo:v111];

      if (v79 && sub_1000383F0() && v130[11] == 2)
      {
        uint64_t v115 = +[NSError errorWithDomain:@"WifiDomain" code:3 userInfo:0];
        v116 = (void *)v115;
        CFStringRef v117 = @"Wifi specific error";
      }
      else
      {
        if (!v51 || v130[12] != 2) {
          goto LABEL_128;
        }
        uint64_t v115 = +[NSError errorWithDomain:@"BluetoothDomain" code:0 userInfo:0];
        v116 = (void *)v115;
        CFStringRef v117 = @"Bluetooth specific error";
      }
      v151[0] = NSLocalizedDescriptionKey;
      v151[1] = NSUnderlyingErrorKey;
      v152[0] = v117;
      v152[1] = v115;
      v118 = +[NSDictionary dictionaryWithObjects:v152 forKeys:v151 count:2];
      uint64_t v119 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:12 userInfo:v118];

      uint64_t v112 = (void *)v119;
LABEL_128:
      if (v122) {
        *long long v122 = v112;
      }
      uint64_t v99 = v112;
      sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSConnectionHandoverHandler processQRCodeHandoverRequestMessage:response:outError:]", 382, v130, @"Unable to find a matching carrier, %@", v113, v114, (uint64_t)v112);
      id v89 = 0;
      uint64_t v98 = &__NSArray0__struct;
      goto LABEL_106;
    }
    *a3 = +[STSConnectionHandover selectWithAlternativeCarriers:&__NSArray0__struct error:0];
    if (a4)
    {
      v151[0] = NSLocalizedDescriptionKey;
      v152[0] = off_100066160;
      +[NSDictionary dictionaryWithObjects:v152 forKeys:v151 count:1];
      v82 = uint64_t v81 = a4;
      long long v83 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:2 userInfo:v82];

      id v84 = 0;
      *uint64_t v81 = v83;
      goto LABEL_114;
    }
  }
  id v84 = 0;
LABEL_114:

  return v84;
}

id sub_10003916C(unsigned char *a1, void *a2)
{
  id v3 = a2;
  if (a1[8]) {
    sub_100032774((uint64_t)ISODeviceEngagementQRCode, v3);
  }
  else {
    sub_100032020((uint64_t)ISODeviceEngagementNFC, v3);
  }
  uint64_t v4 = (id *)objc_claimAutoreleasedReturnValue();
  sub_100025F04(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSConnectionHandoverHandler _extractDeviceKeyFromDeviceEngagement:outError:]", 1036, a1, @"Device Engagement: %@", v5, v6, (uint64_t)v4);
  uint64_t v7 = sub_100031CF4(v4);
  id v8 = sub_10000C008(v7);
  sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSConnectionHandoverHandler _extractDeviceKeyFromDeviceEngagement:outError:]", 1038, a1, @"coseKey=%@", v9, v10, (uint64_t)v8);

  uint64_t v11 = +[NSData dataWithCOSEKey:v7];
  id v12 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.sts"];
  if ([v12 BOOLForKey:@"debug.log-crypto-params"]
    && os_variant_has_internal_ui())
  {
    id v29 = v12;
    long long v31 = v7;
    id v32 = v4;
    id v33 = v3;
    id v13 = [v11 length];
    uint64_t v30 = v11;
    id v14 = v11;
    id v15 = (unsigned __int8 *)[v14 bytes];
    [v14 length];
    sub_1000260CC(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSConnectionHandoverHandler _extractDeviceKeyFromDeviceEngagement:outError:]", 1044, (uint64_t)"%s %lu bytes", v16, v17, v18, (uint64_t)"deviceKey=");
    if (v13)
    {
      uint64_t v19 = 0;
      do
      {
        unint64_t v20 = 0;
        uint64_t v21 = &v34[__sprintf_chk(v34, 0, 0x30uLL, "%04lX: ", v19)];
        do
        {
          unint64_t v22 = v20 + 1;
          unint64_t v23 = v20 + 1 + v19;
          int v24 = sprintf(v21, "0x%02X ", v15[v19 + v20]);
          if (v20 > 6) {
            break;
          }
          v21 += v24;
          ++v20;
        }
        while (v23 < (unint64_t)v13);
        sub_1000260CC(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSConnectionHandoverHandler _extractDeviceKeyFromDeviceEngagement:outError:]", 1044, (uint64_t)"%s", v25, v26, v27, (uint64_t)v34);
        v19 += v22;
      }
      while (v23 < (unint64_t)v13);
    }
    uint64_t v4 = v32;
    id v3 = v33;
    uint64_t v11 = v30;
    uint64_t v7 = v31;
    id v12 = v29;
  }

  return v11;
}

id sub_100039418(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    sub_100025F04(OS_LOG_TYPE_DEFAULT, 1, (uint64_t)"-[STSConnectionHandoverHandler generateHandoverRequest:]", 416, (void *)a1, @"configuration=0x%lx", a7, a8, *(void *)(a1 + 16));
    uint64_t v10 = sub_10000AD48();
    objc_storeStrong((id *)(a1 + 80), (id)v10);

    uint64_t v11 = *(void *)(a1 + 16);
    LODWORD(v10) = (v11 & 0x20) == 0;
    id v80 = objc_opt_new();
    uint64_t v81 = a1;
    unsigned int v14 = *(_DWORD *)(a1 + 16);
    int v15 = v14 & v10;
    int v16 = v10 & (v14 >> 1);
    int v17 = v10 & (v14 >> 2);
    if ((v17 & 1) != 0 || (v15 & 1) != 0 || v16)
    {
      sub_100037D1C((void *)a1);
      if (!v15) {
        goto LABEL_11;
      }
    }
    else if (!v15)
    {
      goto LABEL_11;
    }
    if (sub_1000383F0() && *(void *)(a1 + 88) == 1)
    {
      uint64_t v18 = [STSDiffieHellmanParameter alloc];
      uint64_t v19 = sub_10000B01C(*(void *)(a1 + 80));
      unint64_t v20 = [(STSDiffieHellmanParameter *)v18 initWithKeyGroup:19 key:v19];

      uint64_t v21 = [STSCHWiFiAwareSecurityInfo alloc];
      id v88 = v20;
      unint64_t v22 = +[NSArray arrayWithObjects:&v88 count:1];
      unint64_t v23 = [(STSCHWiFiAwareSecurityInfo *)v21 initWithCipherSuites:&off_10005B080 dhInfo:v22 passphrase:0];

      int v24 = sub_100022EC4();
      uint64_t v25 = [[STSCHWiFiAwareAlternativeCarrier alloc] initWithSecurityInfo:v23 discoveryChannelInfo:v24 powerState:1 auxiliaryRecords:&__NSArray0__struct];
      [v80 addObject:v25];
    }
LABEL_11:
    if ((v16 | v17) != 1 || *(void *)(v81 + 96) != 1)
    {
LABEL_23:
      uint64_t v34 = v80;
      uint64_t v33 = v81;
      if ((*(unsigned char *)(v81 + 16) & 0x10) != 0)
      {
        if ((v11 & 0x20) == 0)
        {
          sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSConnectionHandoverHandler generateHandoverRequest:]", 492, (void *)v81, @"Not implemented", v12, v13, v77);
          if (a2)
          {
            *(void *)&long long v90 = NSLocalizedDescriptionKey;
            v89[0] = off_100066178;
            long long v35 = +[NSDictionary dictionaryWithObjects:v89 forKeys:&v90 count:1];
            id v36 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:5 userInfo:v35];

            id v37 = v36;
            id v38 = 0;
            *a2 = v37;
          }
          else
          {
            id v38 = 0;
          }
          goto LABEL_74;
        }
        id v39 = [[STSCHNfcAlternativeCarrier alloc] initWithMaxLcField:4096 maxLeField:4096 auxiliaryRecords:&__NSArray0__struct];
        [v80 addObject:v39];

        uint64_t v33 = v81;
      }
      sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSConnectionHandoverHandler generateHandoverRequest:]", 503, (void *)v33, @"Generated AC list: %@", v12, v13, (uint64_t)v80);
      if ([v80 count])
      {
        id v42 = [v80 copy];
        objc_storeStrong((id *)(v33 + 72), v42);

        id v43 = +[STSConnectionHandover requestWithAlternativeCarriers:*(void *)(v33 + 72)];
        objc_storeStrong((id *)(v33 + 56), v43);
        if (!*(unsigned char *)(v33 + 8))
        {
          id v38 = v43;
LABEL_73:

          goto LABEL_74;
        }
        uint64_t v44 = (void *)v33;
        unsigned int v79 = v43;
        uint64_t v87 = objc_opt_new();
        long long v90 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
        long long v93 = 0u;
        id v45 = *(id *)(v33 + 72);
        id v46 = [v45 countByEnumeratingWithState:&v90 objects:v89 count:16];
        if (!v46) {
          goto LABEL_63;
        }
        id v47 = v46;
        uint64_t v48 = *(void *)v91;
        id v86 = v45;
LABEL_32:
        uint64_t v49 = 0;
        while (1)
        {
          if (*(void *)v91 != v48) {
            objc_enumerationMutation(v45);
          }
          id v50 = *(void **)(*((void *)&v90 + 1) + 8 * v49);
          id v51 = [v50 type];
          if (v51 == (id)1) {
            break;
          }
          if (v51 == (id)3)
          {
            uint64_t v56 = 558;
            uint64_t v57 = v44;
            uint64_t v58 = @"NFC DeviceRetrievalMethod supplied. Not supported. Skipping.";
LABEL_43:
            sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSConnectionHandoverHandler generateQRCodeHandoverRequest:]", v56, v57, v58, v52, v53, v78);
            goto LABEL_61;
          }
          if (v51 == (id)2)
          {
            sub_100037D1C(v44);
            id v54 = v50;
            BOOL v55 = ![v54 leRole]
               || [v54 leRole] == (id)2
               || [v54 leRole] == (id)3;
            BOOL v59 = [v54 leRole] == (id)1
               || [v54 leRole] == (id)2
               || [v54 leRole] == (id)3;
            id v60 = [ISODeviceRetrievalMethodBLE alloc];
            if (v55)
            {
              long long v85 = [v54 advertiseUUID];
              id v61 = objc_msgSend(v85, "STS_reverseBytes");
              long long v83 = v61;
              if (!v59) {
                goto LABEL_51;
              }
LABEL_55:
              id v84 = [v54 advertiseUUID];
              uint64_t v62 = objc_msgSend(v84, "STS_reverseBytes");
              uint64_t v82 = v62;
              if (v55) {
                goto LABEL_56;
              }
LABEL_52:
              id v63 = sub_100032320(v60, 0, v59, v61, v62, 0);
              if (!v59) {
                goto LABEL_58;
              }
            }
            else
            {
              id v61 = 0;
              if (v59) {
                goto LABEL_55;
              }
LABEL_51:
              uint64_t v62 = 0;
              if (!v55) {
                goto LABEL_52;
              }
LABEL_56:
              id v64 = [v54 leAddr];
              id v63 = sub_100032320(v60, 1, v59, v61, v62, v64);

              uint64_t v44 = (void *)v81;
              if (!v59)
              {
LABEL_58:
                if (v55)
                {
                }
                [v87 addObject:v63];

                id v45 = v86;
                goto LABEL_61;
              }
            }

            goto LABEL_58;
          }
LABEL_61:
          if (v47 == (id)++v49)
          {
            id v47 = [v45 countByEnumeratingWithState:&v90 objects:v89 count:16];
            if (!v47)
            {
LABEL_63:

              id v65 = [objc_alloc((Class)COSEKey) initWithData:v44[4]];
              uint64_t v66 = (id *)v44;
              uint64_t v67 = sub_1000327D8([ISODeviceEngagementQRCode alloc], v65, 1, v87);
              sub_1000329B0((uint64_t)NSData, v67);
              id v38 = (id)objc_claimAutoreleasedReturnValue();
              objc_storeStrong(v66 + 6, v38);
              id v68 = v66[7];
              v66[7] = 0;

              id v69 = v66[8];
              v66[8] = 0;

              id v43 = v79;
              uint64_t v34 = v80;
              goto LABEL_73;
            }
            goto LABEL_32;
          }
        }
        uint64_t v56 = 554;
        uint64_t v57 = v44;
        uint64_t v58 = @"WiFi DeviceRetrievalMethod supplied. Not supported. Skipping.";
        goto LABEL_43;
      }
      sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSConnectionHandoverHandler generateHandoverRequest:]", 505, (void *)v33, @"No available AC", v40, v41, v78);
      if (v15 && sub_1000383F0())
      {
        if (a2)
        {
          uint64_t v70 = +[NSError errorWithDomain:@"WifiDomain" code:3 userInfo:0];
          uint64_t v71 = (void *)v70;
          NSErrorUserInfoKey v72 = NSLocalizedDescriptionKey;
          CFStringRef v73 = @"Wifi specific error";
LABEL_70:
          *(void *)&long long v90 = v72;
          *((void *)&v90 + 1) = NSUnderlyingErrorKey;
          v89[0] = v73;
          v89[1] = v70;
          uint64_t v74 = +[NSDictionary dictionaryWithObjects:v89 forKeys:&v90 count:2];
          uint64_t v75 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:12 userInfo:v74];

          *a2 = v75;
        }
      }
      else if (a2)
      {
        uint64_t v70 = +[NSError errorWithDomain:@"BluetoothDomain" code:0 userInfo:0];
        uint64_t v71 = (void *)v70;
        NSErrorUserInfoKey v72 = NSLocalizedDescriptionKey;
        CFStringRef v73 = @"Bluetooth specific error";
        goto LABEL_70;
      }
      id v38 = objc_alloc_init((Class)NSData);
LABEL_74:

      goto LABEL_75;
    }
    uint64_t v28 = +[ISO18013_3_Peripheral getAddress];
    if ((v16 & v17) == 1)
    {
      uint64_t v29 = 2;
      uint64_t v30 = sub_100039D3C();
    }
    else
    {
      if (v16)
      {
        long long v31 = v80;
        if (*(unsigned char *)(v81 + 8))
        {
          uint64_t v30 = sub_100039D3C();

          uint64_t v28 = 0;
        }
        else
        {
          uint64_t v30 = 0;
        }
        uint64_t v29 = 1;
        goto LABEL_22;
      }
      uint64_t v30 = sub_100039D3C();
      uint64_t v29 = 0;
    }
    long long v31 = v80;
LABEL_22:
    sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSConnectionHandoverHandler generateHandoverRequest:]", 478, (void *)v81, @"BT advertiseUUID: %@, advertisePerihperhalAddress: %@", v26, v27, (uint64_t)v30);
    id v32 = [[STSCHBluetoothAlternativeCarrier alloc] initWithAddress:v28 advertiseUUID:v30 role:v29 powerState:1 auxiliaryRecords:&__NSArray0__struct];
    [v31 addObject:v32];

    goto LABEL_23;
  }
  id v38 = 0;
LABEL_75:

  return v38;
}

id sub_100039D3C()
{
  arc4random_buf(__buf, 0x10uLL);
  uint64_t v0 = +[NSData dataWithBytes:__buf length:16];

  return v0;
}

id *sub_100039DB8(id *a1, void *a2, void *a3)
{
  id v6 = a2;
  if (a1)
  {
    uint64_t v7 = +[STSConnectionHandover connectionHandoverWithData:v6];
    uint64_t v10 = v7;
    if (v7
      && ([v7 alternativeCarriers],
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          id v12 = [v11 count],
          v11,
          v12))
    {
      if ([v10 majorVersion] == (id)1)
      {
        sub_100025F04(OS_LOG_TYPE_DEFAULT, 1, (uint64_t)"-[STSConnectionHandoverHandler processHandoverSelectMessage:outError:]", 592, a1, &stru_100055900, v8, v9, v70);
        id obj = a1[2];
        uint64_t v13 = [v10 alternativeCarriers];
        id v14 = [v13 count];

        if (v14 != (id)1) {
          sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSConnectionHandoverHandler processHandoverSelectMessage:outError:]", 599, a1, @"More than 1 AC found; force using 1st one in list",
        }
            v15,
            v16,
            v71);
        int v17 = [v10 alternativeCarriers];
        uint64_t v18 = [v17 firstObject];

        long long v83 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        long long v86 = 0u;
        id v76 = v18;
        uint64_t v19 = [v76 auxiliaryRecords];
        id v20 = [v19 countByEnumeratingWithState:&v83 objects:v82 count:16];
        if (v20)
        {
          id v21 = v20;
          uint64_t v22 = *(void *)v84;
          while (2)
          {
            for (i = 0; i != v21; i = (char *)i + 1)
            {
              if (*(void *)v84 != v22) {
                objc_enumerationMutation(v19);
              }
              int v24 = *(void **)(*((void *)&v83 + 1) + 8 * i);
              if ([v24 isISO18013DeviceEngagementRecord])
              {
                uint64_t v34 = [v24 payload];
                long long v35 = [v34 debugDescription];
                sub_100025F04(OS_LOG_TYPE_DEFAULT, 1, (uint64_t)"-[STSConnectionHandoverHandler _extractDeviceEngagmentFromAlternativeCarrier:outError:]", 1022, a1, @"deviceEngagement=%@", v36, v37, (uint64_t)v35);

                uint64_t v28 = [v24 payload];

                id v27 = 0;
                goto LABEL_22;
              }
            }
            id v21 = [v19 countByEnumeratingWithState:&v83 objects:v82 count:16];
            if (v21) {
              continue;
            }
            break;
          }
        }

        NSErrorUserInfoKey v87 = NSLocalizedDescriptionKey;
        id v88 = off_1000661B8;
        uint64_t v25 = +[NSDictionary dictionaryWithObjects:&v88 forKeys:&v87 count:1];
        uint64_t v26 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:13 userInfo:v25];

        id v27 = v26;
        uint64_t v28 = 0;
LABEL_22:

        id v38 = v27;
        objc_storeStrong(a1 + 6, v28);

        if (v38)
        {
          if (a3)
          {
            id v38 = v38;
            a1 = 0;
            *a3 = v38;
          }
          else
          {
            a1 = 0;
          }
          goto LABEL_48;
        }
        id v39 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.sts"];
        if ([v39 BOOLForKey:@"LogDeviceEngagement"])
        {
          id v40 = a1[6];
          if ((obj & 0x20) != 0)
          {
            uint64_t v41 = sub_10003294C((uint64_t)UnifiedAccessDeviceEngagement, v40);
            sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSConnectionHandoverHandler processHandoverSelectMessage:outError:]", 615, a1, @"[Type=UA] %@", v42, v43, (uint64_t)v41);

LABEL_30:
            if ([v76 type] != (id)3) {
              goto LABEL_44;
            }
            id v46 = v76;
            goto LABEL_41;
          }
          id v47 = sub_100032020((uint64_t)ISODeviceEngagementNFC, v40);
          sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSConnectionHandoverHandler processHandoverSelectMessage:outError:]", 618, a1, @"[Type=NFC] %@", v48, v49, (uint64_t)v47);
        }
        else if ((obj & 0x20) != 0)
        {
          goto LABEL_30;
        }
        id v50 = a1[6];
        id v51 = sub_10003916C(a1, v50);

        objc_storeStrong(a1 + 4, v51);
        if (a1[12] == (id)1 && (obj & 0x20) == 0 && [v76 type] == (id)2)
        {
          id v52 = v76;
          uint64_t v53 = [v52 advertiseUUID];
          id v54 = [v53 length];

          if (v54 == (id)16)
          {
            BOOL v55 = [v52 advertiseUUID];
            sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSConnectionHandoverHandler processHandoverSelectMessage:outError:]", 633, a1, @"Remote advertise UUID: %@", v56, v57, (uint64_t)v55);
          }
          else
          {
            NSErrorUserInfoKey v72 = v52;
            id v73 = v39;
            long long v79 = 0u;
            long long v80 = 0u;
            long long v77 = 0u;
            long long v78 = 0u;
            id obja = a1[9];
            id v61 = [obja countByEnumeratingWithState:&v77 objects:v81 count:16];
            if (v61)
            {
              id v62 = v61;
              uint64_t v63 = *(void *)v78;
              while (2)
              {
                for (j = 0; j != v62; j = (char *)j + 1)
                {
                  if (*(void *)v78 != v63) {
                    objc_enumerationMutation(obja);
                  }
                  id v65 = *(void **)(*((void *)&v77 + 1) + 8 * (void)j);
                  if ([v65 type] == (id)2)
                  {
                    uint64_t v66 = [v65 advertiseUUID];
                    id v52 = v72;
                    [v72 setAdvertiseUUID:v66];

                    uint64_t v67 = [v72 advertiseUUID];
                    sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSConnectionHandoverHandler processHandoverSelectMessage:outError:]", 638, a1, @"Peripheral advertise UUID: %@", v68, v69, (uint64_t)v67);

                    id v39 = v73;
                    goto LABEL_42;
                  }
                }
                id v62 = [obja countByEnumeratingWithState:&v77 objects:v81 count:16];
                if (v62) {
                  continue;
                }
                break;
              }
            }

            id v52 = v72;
            id v39 = v73;
          }
LABEL_42:
          if (v52)
          {
            objc_storeStrong(a1 + 8, a2);
LABEL_47:
            a1 = (id *)v52;

            id v38 = 0;
LABEL_48:

LABEL_49:
            goto LABEL_50;
          }
LABEL_44:
          sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSConnectionHandoverHandler processHandoverSelectMessage:outError:]", 651, a1, @"Unable to find suitable AC from CH select", v44, v45, v71);
          if (a3)
          {
            *(void *)&long long v83 = NSLocalizedDescriptionKey;
            v82[0] = off_1000661A0;
            uint64_t v58 = +[NSDictionary dictionaryWithObjects:v82 forKeys:&v83 count:1];
            BOOL v59 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:10 userInfo:v58];

            id v52 = 0;
            *a3 = v59;
          }
          else
          {
            id v52 = 0;
          }
          goto LABEL_47;
        }
        if (a1[11] != (id)1 || [v76 type] != (id)1) {
          goto LABEL_44;
        }
        sub_10003A5A8(a1, v76);
        id v46 = (id)objc_claimAutoreleasedReturnValue();
LABEL_41:
        id v52 = v46;
        goto LABEL_42;
      }
      uint64_t v29 = @"No valid CH version found";
      uint64_t v30 = 587;
    }
    else
    {
      uint64_t v29 = @"No valid CH Select message found";
      uint64_t v30 = 581;
    }
    sub_100025F04(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSConnectionHandoverHandler processHandoverSelectMessage:outError:]", v30, a1, v29, v8, v9, v70);
    if (a3)
    {
      *(void *)&long long v83 = NSLocalizedDescriptionKey;
      v82[0] = off_100066190;
      long long v31 = +[NSDictionary dictionaryWithObjects:v82 forKeys:&v83 count:1];
      id v32 = +[NSError errorWithDomain:@"STSXPCHelperErrorDomain" code:8 userInfo:v31];

      id v33 = v32;
      a1 = 0;
      *a3 = v33;
    }
    else
    {
      a1 = 0;
    }
    goto LABEL_49;
  }
LABEL_50:

  return a1;
}

STSCHWiFiAwareAlternativeCarrier *sub_10003A5A8(id *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 securityInfo];
  uint64_t v5 = [v4 cipherSuite];
  id v6 = [v5 count];
  uint64_t v7 = [v3 securityInfo];
  uint64_t v8 = [v7 dhInfo];
  id v9 = [v8 count];

  if (v6 != v9)
  {
    unint64_t v23 = @"# of cipher suites does not match with DH info count";
    os_log_type_t v24 = OS_LOG_TYPE_ERROR;
    uint64_t v25 = 983;
LABEL_19:
    sub_100025F04(v24, 0, (uint64_t)"-[STSConnectionHandoverHandler _matchWifiCapabilityWithPublisher:]", v25, a1, v23, v10, v11, v47);
    uint64_t v36 = 0;
    goto LABEL_20;
  }
  id v12 = [v3 securityInfo];
  uint64_t v13 = [v12 cipherSuite];
  id v14 = [v13 count];

  if (!v14) {
    goto LABEL_18;
  }
  unint64_t v15 = 0;
  while (1)
  {
    uint64_t v16 = [v3 securityInfo];
    int v17 = [v16 cipherSuite];
    uint64_t v18 = [v17 objectAtIndexedSubscript:v15];
    id v19 = [v18 integerValue];

    if (v19 == (id)3) {
      break;
    }
    ++v15;
    id v20 = [v3 securityInfo];
    id v21 = [v20 cipherSuite];
    id v22 = [v21 count];

    if (v15 >= (unint64_t)v22) {
      goto LABEL_18;
    }
  }
  uint64_t v26 = [v3 securityInfo];
  id v27 = [v26 dhInfo];
  uint64_t v28 = [v27 objectAtIndexedSubscript:v15];

  if (!v28)
  {
LABEL_18:
    unint64_t v23 = @"Cannot find valid wifi security info";
    os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
    uint64_t v25 = 995;
    goto LABEL_19;
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v29 = a1[9];
  id v30 = [v29 countByEnumeratingWithState:&v47 objects:v51 count:16];
  if (v30)
  {
    id v31 = v30;
    uint64_t v32 = *(void *)v48;
    while (2)
    {
      for (i = 0; i != v31; i = (char *)i + 1)
      {
        if (*(void *)v48 != v32) {
          objc_enumerationMutation(v29);
        }
        uint64_t v34 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        if (objc_msgSend(v34, "type", (void)v47) == (id)1)
        {
          id v38 = a1[10];
          id v39 = v34;
          id v40 = [v3 securityInfo];
          uint64_t v41 = sub_10000C6C8(v38, v40, 0);

          uint64_t v42 = [STSCHWiFiAwareAlternativeCarrier alloc];
          uint64_t v43 = [v3 discoveryChannelInfo];
          id v44 = [v39 powerState];
          uint64_t v45 = [v39 auxiliaryRecords];

          long long v35 = [(STSCHWiFiAwareAlternativeCarrier *)v42 initWithSecurityInfo:v41 discoveryChannelInfo:v43 powerState:v44 auxiliaryRecords:v45];
          goto LABEL_24;
        }
      }
      id v31 = [v29 countByEnumeratingWithState:&v47 objects:v51 count:16];
      if (v31) {
        continue;
      }
      break;
    }
  }
  long long v35 = 0;
LABEL_24:

  id v46 = a1[10];
  a1[10] = 0;

  uint64_t v36 = v35;
LABEL_20:

  return v36;
}

id *sub_10003A93C(id *a1, void *a2)
{
  id v2 = a1;
  if (a1)
  {
    uint64_t v4 = [a1[4] encodeToBstrCbor];
    uint64_t v5 = [v4 base64EncodedStringWithOptions:0];
    sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSConnectionHandoverHandler generateBTIdentCharacteristic:]", 667, v2, @"devKeyBytes=%@", v6, v7, (uint64_t)v5);

    uint64_t v8 = [@"BLEIdent" dataUsingEncoding:4];
    id v14 = 0;
    id v9 = sub_10000BB00((uint64_t)ISOKey, v4, 0, v8, 0, 16, &v14);
    id v10 = v14;

    if (v10)
    {
      id v2 = 0;
      if (a2) {
        *a2 = v10;
      }
    }
    else
    {
      sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSConnectionHandoverHandler generateBTIdentCharacteristic:]", 678, v2, @"BLE Ident=%@", v11, v12, (uint64_t)v9);
      id v2 = v9;
    }
  }

  return v2;
}

id sub_10003AA98(id *a1, void *a2)
{
  if (a1)
  {
    uint64_t v4 = [a1[4] encodeToBstrCbor];
    uint64_t v5 = [@"NANService" dataUsingEncoding:4];
    id v12 = 0;
    uint64_t v6 = sub_10000BB00((uint64_t)ISOKey, v4, 0, v5, 0, 16, &v12);
    id v7 = v12;

    if (v7)
    {
      uint64_t v8 = 0;
      if (a2) {
        *a2 = v7;
      }
    }
    else
    {
      uint64_t v8 = objc_msgSend(v6, "STS_asHexString");
      sub_100025F04(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSConnectionHandoverHandler generateWifiNANServiceName:]", 703, a1, @"serviceName=%@", v9, v10, (uint64_t)v8);
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA256(data, len, md);
}

unsigned __int8 *__cdecl CC_SHA384(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA384(data, len, md);
}

unsigned __int8 *__cdecl CC_SHA512(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return _CC_SHA512(data, len, md);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

void CFReadStreamSetDispatchQueue(CFReadStreamRef stream, dispatch_queue_t q)
{
}

void CFRelease(CFTypeRef cf)
{
}

void CFWriteStreamSetDispatchQueue(CFWriteStreamRef stream, dispatch_queue_t q)
{
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

CFDataRef SecKeyCopyExternalRepresentation(SecKeyRef key, CFErrorRef *error)
{
  return _SecKeyCopyExternalRepresentation(key, error);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return ___error();
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return ___sprintf_chk(a1, a2, a3, a4);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return __os_activity_create(dso, description, activity, flags);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

uint32_t arc4random(void)
{
  return _arc4random();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

void bzero(void *a1, size_t a2)
{
}

uint64_t ccansikdf_x963()
{
  return _ccansikdf_x963();
}

uint64_t ccec_cp_256()
{
  return _ccec_cp_256();
}

uint64_t ccec_cp_384()
{
  return _ccec_cp_384();
}

uint64_t ccec_cp_521()
{
  return _ccec_cp_521();
}

uint64_t ccec_export_pub()
{
  return _ccec_export_pub();
}

uint64_t ccec_generate_key()
{
  return _ccec_generate_key();
}

uint64_t ccec_import_pub()
{
  return _ccec_import_pub();
}

uint64_t ccec_x963_import_pub()
{
  return _ccec_x963_import_pub();
}

uint64_t ccecdh_compute_shared_secret()
{
  return _ccecdh_compute_shared_secret();
}

uint64_t cchkdf()
{
  return _cchkdf();
}

uint64_t ccrng()
{
  return _ccrng();
}

uint64_t ccsha256_di()
{
  return _ccsha256_di();
}

uint64_t ccsha384_di()
{
  return _ccsha384_di();
}

uint64_t ccsha512_di()
{
  return _ccsha512_di();
}

uint64_t cczp_bitlen()
{
  return _cczp_bitlen();
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return _dispatch_block_create_with_qos_class(flags, qos_class, relative_priority, block);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return _dispatch_data_create(buffer, size, queue, destructor);
}

dispatch_data_t dispatch_data_create_concat(dispatch_data_t data1, dispatch_data_t data2)
{
  return _dispatch_data_create_concat(data1, data2);
}

dispatch_data_t dispatch_data_create_map(dispatch_data_t data, const void **buffer_ptr, size_t *size_ptr)
{
  return _dispatch_data_create_map(data, buffer_ptr, size_ptr);
}

dispatch_data_t dispatch_data_create_subrange(dispatch_data_t data, size_t offset, size_t length)
{
  return _dispatch_data_create_subrange(data, offset, length);
}

size_t dispatch_data_get_size(dispatch_data_t data)
{
  return _dispatch_data_get_size(data);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

uint64_t dispatch_time_to_nsec()
{
  return _dispatch_time_to_nsec();
}

void free(void *a1)
{
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return _if_indextoname(a1, a2);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return _inet_ntop(a1, a2, a3, a4);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

void nw_connection_cancel(nw_connection_t connection)
{
}

nw_endpoint_t nw_connection_copy_endpoint(nw_connection_t connection)
{
  return _nw_connection_copy_endpoint(connection);
}

nw_connection_t nw_connection_create(nw_endpoint_t endpoint, nw_parameters_t parameters)
{
  return _nw_connection_create(endpoint, parameters);
}

void nw_connection_receive(nw_connection_t connection, uint32_t minimum_incomplete_length, uint32_t maximum_length, nw_connection_receive_completion_t completion)
{
}

void nw_connection_send(nw_connection_t connection, dispatch_data_t content, nw_content_context_t context, BOOL is_complete, nw_connection_send_completion_t completion)
{
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
}

void nw_connection_set_state_changed_handler(nw_connection_t connection, nw_connection_state_changed_handler_t handler)
{
}

void nw_connection_start(nw_connection_t connection)
{
}

BOOL nw_content_context_get_is_final(nw_content_context_t context)
{
  return _nw_content_context_get_is_final(context);
}

char *__cdecl nw_endpoint_copy_address_string(nw_endpoint_t endpoint)
{
  return _nw_endpoint_copy_address_string(endpoint);
}

nw_endpoint_t nw_endpoint_create_host(const char *hostname, const char *port)
{
  return _nw_endpoint_create_host(hostname, port);
}

uint16_t nw_endpoint_get_port(nw_endpoint_t endpoint)
{
  return _nw_endpoint_get_port(endpoint);
}

nw_endpoint_type_t nw_endpoint_get_type(nw_endpoint_t endpoint)
{
  return _nw_endpoint_get_type(endpoint);
}

const char *__cdecl nw_endpoint_get_url(nw_endpoint_t endpoint)
{
  return _nw_endpoint_get_url(endpoint);
}

CFErrorRef nw_error_copy_cf_error(nw_error_t error)
{
  return _nw_error_copy_cf_error(error);
}

int nw_error_get_error_code(nw_error_t error)
{
  return _nw_error_get_error_code(error);
}

void nw_listener_cancel(nw_listener_t listener)
{
}

nw_listener_t nw_listener_create(nw_parameters_t parameters)
{
  return _nw_listener_create(parameters);
}

nw_listener_t nw_listener_create_with_port(const char *port, nw_parameters_t parameters)
{
  return _nw_listener_create_with_port(port, parameters);
}

uint16_t nw_listener_get_port(nw_listener_t listener)
{
  return _nw_listener_get_port(listener);
}

void nw_listener_set_new_connection_handler(nw_listener_t listener, nw_listener_new_connection_handler_t handler)
{
}

void nw_listener_set_queue(nw_listener_t listener, dispatch_queue_t queue)
{
}

void nw_listener_set_state_changed_handler(nw_listener_t listener, nw_listener_state_changed_handler_t handler)
{
}

void nw_listener_start(nw_listener_t listener)
{
}

nw_protocol_stack_t nw_parameters_copy_default_protocol_stack(nw_parameters_t parameters)
{
  return _nw_parameters_copy_default_protocol_stack(parameters);
}

nw_parameters_t nw_parameters_create_secure_tcp(nw_parameters_configure_protocol_block_t configure_tls, nw_parameters_configure_protocol_block_t configure_tcp)
{
  return _nw_parameters_create_secure_tcp(configure_tls, configure_tcp);
}

void nw_parameters_set_include_peer_to_peer(nw_parameters_t parameters, BOOL include_peer_to_peer)
{
}

void nw_parameters_set_service_class(nw_parameters_t parameters, nw_service_class_t service_class)
{
}

nw_protocol_options_t nw_protocol_stack_copy_transport_protocol(nw_protocol_stack_t stack)
{
  return _nw_protocol_stack_copy_transport_protocol(stack);
}

void nw_tcp_options_set_connection_timeout(nw_protocol_options_t options, uint32_t connection_timeout)
{
}

void nw_tcp_options_set_enable_keepalive(nw_protocol_options_t options, BOOL enable_keepalive)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

const char *__cdecl object_getClassName(id a1)
{
  return _object_getClassName(a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_ui()
{
  return _os_variant_has_internal_ui();
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int sprintf(char *a1, const char *a2, ...)
{
  return _sprintf(a1, a2);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return _strtoul(__str, __endptr, __base);
}

id objc_msgSend_HTTPBody(void *a1, const char *a2, ...)
{
  return [a1 HTTPBody];
}

id objc_msgSend_HTTPBodyStream(void *a1, const char *a2, ...)
{
  return [a1 HTTPBodyStream];
}

id objc_msgSend_HTTPMethod(void *a1, const char *a2, ...)
{
  return [a1 HTTPMethod];
}

id objc_msgSend_MIMEType(void *a1, const char *a2, ...)
{
  return [a1 MIMEType];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_URLHostAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 URLHostAllowedCharacterSet];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__createCarrierConfigurationRecord(void *a1, const char *a2, ...)
{
  return [a1 _createCarrierConfigurationRecord];
}

id objc_msgSend__createDispatchData(void *a1, const char *a2, ...)
{
  return [a1 _createDispatchData];
}

id objc_msgSend__idLengthPresent(void *a1, const char *a2, ...)
{
  return [a1 _idLengthPresent];
}

id objc_msgSend__queue(void *a1, const char *a2, ...)
{
  return [a1 _queue];
}

id objc_msgSend__startCBCentralManager(void *a1, const char *a2, ...)
{
  return [a1 _startCBCentralManager];
}

id objc_msgSend__startCBPeripheralManager(void *a1, const char *a2, ...)
{
  return [a1 _startCBPeripheralManager];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_advertiseUUID(void *a1, const char *a2, ...)
{
  return [a1 advertiseUUID];
}

id objc_msgSend_advertisingAddress(void *a1, const char *a2, ...)
{
  return [a1 advertisingAddress];
}

id objc_msgSend_advertisingAddressType(void *a1, const char *a2, ...)
{
  return [a1 advertisingAddressType];
}

id objc_msgSend_algorithm(void *a1, const char *a2, ...)
{
  return [a1 algorithm];
}

id objc_msgSend_allHTTPHeaderFields(void *a1, const char *a2, ...)
{
  return [a1 allHTTPHeaderFields];
}

id objc_msgSend_allHeaderFields(void *a1, const char *a2, ...)
{
  return [a1 allHeaderFields];
}

id objc_msgSend_alternativeCarriers(void *a1, const char *a2, ...)
{
  return [a1 alternativeCarriers];
}

id objc_msgSend_alternativeRecord(void *a1, const char *a2, ...)
{
  return [a1 alternativeRecord];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_asData(void *a1, const char *a2, ...)
{
  return [a1 asData];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_authACL(void *a1, const char *a2, ...)
{
  return [a1 authACL];
}

id objc_msgSend_auxiliaryRecords(void *a1, const char *a2, ...)
{
  return [a1 auxiliaryRecords];
}

id objc_msgSend_baseInitializationVector(void *a1, const char *a2, ...)
{
  return [a1 baseInitializationVector];
}

id objc_msgSend_bodyData(void *a1, const char *a2, ...)
{
  return [a1 bodyData];
}

id objc_msgSend_bodyType(void *a1, const char *a2, ...)
{
  return [a1 bodyType];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_broadcast(void *a1, const char *a2, ...)
{
  return [a1 broadcast];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_canSendWriteWithoutResponse(void *a1, const char *a2, ...)
{
  return [a1 canSendWriteWithoutResponse];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_cborEncodeToBstrCbor(void *a1, const char *a2, ...)
{
  return [a1 cborEncodeToBstrCbor];
}

id objc_msgSend_cborFalse(void *a1, const char *a2, ...)
{
  return [a1 cborFalse];
}

id objc_msgSend_cborNil(void *a1, const char *a2, ...)
{
  return [a1 cborNil];
}

id objc_msgSend_cborObj(void *a1, const char *a2, ...)
{
  return [a1 cborObj];
}

id objc_msgSend_cborTrue(void *a1, const char *a2, ...)
{
  return [a1 cborTrue];
}

id objc_msgSend_central(void *a1, const char *a2, ...)
{
  return [a1 central];
}

id objc_msgSend_centralCallbackLock(void *a1, const char *a2, ...)
{
  return [a1 centralCallbackLock];
}

id objc_msgSend_channelNumber(void *a1, const char *a2, ...)
{
  return [a1 channelNumber];
}

id objc_msgSend_characteristic(void *a1, const char *a2, ...)
{
  return [a1 characteristic];
}

id objc_msgSend_characteristics(void *a1, const char *a2, ...)
{
  return [a1 characteristics];
}

id objc_msgSend_chunked(void *a1, const char *a2, ...)
{
  return [a1 chunked];
}

id objc_msgSend_cipherSuite(void *a1, const char *a2, ...)
{
  return [a1 cipherSuite];
}

id objc_msgSend_cipherSuites(void *a1, const char *a2, ...)
{
  return [a1 cipherSuites];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_configurationRecord(void *a1, const char *a2, ...)
{
  return [a1 configurationRecord];
}

id objc_msgSend_connectionEstablishmentTimedout(void *a1, const char *a2, ...)
{
  return [a1 connectionEstablishmentTimedout];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createAlternativeCarrierRecord(void *a1, const char *a2, ...)
{
  return [a1 createAlternativeCarrierRecord];
}

id objc_msgSend_createNdefRecordBundle(void *a1, const char *a2, ...)
{
  return [a1 createNdefRecordBundle];
}

id objc_msgSend_credentialIdentifier(void *a1, const char *a2, ...)
{
  return [a1 credentialIdentifier];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_currentDeviceCapabilities(void *a1, const char *a2, ...)
{
  return [a1 currentDeviceCapabilities];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_datapathPmk(void *a1, const char *a2, ...)
{
  return [a1 datapathPmk];
}

id objc_msgSend_datapathPmkID(void *a1, const char *a2, ...)
{
  return [a1 datapathPmkID];
}

id objc_msgSend_datapathSecurityRequired(void *a1, const char *a2, ...)
{
  return [a1 datapathSecurityRequired];
}

id objc_msgSend_datapathSupported(void *a1, const char *a2, ...)
{
  return [a1 datapathSupported];
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return [a1 debugDescription];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dhInfo(void *a1, const char *a2, ...)
{
  return [a1 dhInfo];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_didInvalidate(void *a1, const char *a2, ...)
{
  return [a1 didInvalidate];
}

id objc_msgSend_discoveryChannelInfo(void *a1, const char *a2, ...)
{
  return [a1 discoveryChannelInfo];
}

id objc_msgSend_docType(void *a1, const char *a2, ...)
{
  return [a1 docType];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_dummyStart(void *a1, const char *a2, ...)
{
  return [a1 dummyStart];
}

id objc_msgSend_ecCurveD(void *a1, const char *a2, ...)
{
  return [a1 ecCurveD];
}

id objc_msgSend_ecCurveIdentifier(void *a1, const char *a2, ...)
{
  return [a1 ecCurveIdentifier];
}

id objc_msgSend_ecCurveX(void *a1, const char *a2, ...)
{
  return [a1 ecCurveX];
}

id objc_msgSend_ecCurveY(void *a1, const char *a2, ...)
{
  return [a1 ecCurveY];
}

id objc_msgSend_elementIdentifier(void *a1, const char *a2, ...)
{
  return [a1 elementIdentifier];
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return [a1 elements];
}

id objc_msgSend_encode(void *a1, const char *a2, ...)
{
  return [a1 encode];
}

id objc_msgSend_encodeOptions(void *a1, const char *a2, ...)
{
  return [a1 encodeOptions];
}

id objc_msgSend_encodeToBstrCbor(void *a1, const char *a2, ...)
{
  return [a1 encodeToBstrCbor];
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 ephemeralSessionConfiguration];
}

id objc_msgSend_errorRecord(void *a1, const char *a2, ...)
{
  return [a1 errorRecord];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_furtherServiceDiscoveryRequired(void *a1, const char *a2, ...)
{
  return [a1 furtherServiceDiscoveryRequired];
}

id objc_msgSend_getAddress(void *a1, const char *a2, ...)
{
  return [a1 getAddress];
}

id objc_msgSend_getAuxiliaryDataReferencesFromAlternativeCarrierRecord(void *a1, const char *a2, ...)
{
  return [a1 getAuxiliaryDataReferencesFromAlternativeCarrierRecord];
}

id objc_msgSend_getCarrierDataReferenceFromAlternativeCarrierRecord(void *a1, const char *a2, ...)
{
  return [a1 getCarrierDataReferenceFromAlternativeCarrierRecord];
}

id objc_msgSend_getCarrierPowerStateFromAlternativeCarrierRecord(void *a1, const char *a2, ...)
{
  return [a1 getCarrierPowerStateFromAlternativeCarrierRecord];
}

id objc_msgSend_getIdentifierCharacteristicUUID(void *a1, const char *a2, ...)
{
  return [a1 getIdentifierCharacteristicUUID];
}

id objc_msgSend_getIncomingDataCharacteristicUUID(void *a1, const char *a2, ...)
{
  return [a1 getIncomingDataCharacteristicUUID];
}

id objc_msgSend_getL2CAPCharacteristicUUID(void *a1, const char *a2, ...)
{
  return [a1 getL2CAPCharacteristicUUID];
}

id objc_msgSend_getL2CAPEnable(void *a1, const char *a2, ...)
{
  return [a1 getL2CAPEnable];
}

id objc_msgSend_getOutgoingDataCharacteristicUUID(void *a1, const char *a2, ...)
{
  return [a1 getOutgoingDataCharacteristicUUID];
}

id objc_msgSend_getStateCharacteristicUUID(void *a1, const char *a2, ...)
{
  return [a1 getStateCharacteristicUUID];
}

id objc_msgSend_hardwareAvailable(void *a1, const char *a2, ...)
{
  return [a1 hardwareAvailable];
}

id objc_msgSend_hasBytesAvailable(void *a1, const char *a2, ...)
{
  return [a1 hasBytesAvailable];
}

id objc_msgSend_header(void *a1, const char *a2, ...)
{
  return [a1 header];
}

id objc_msgSend_hostname(void *a1, const char *a2, ...)
{
  return [a1 hostname];
}

id objc_msgSend_humanReadableAdvertiseUUID(void *a1, const char *a2, ...)
{
  return [a1 humanReadableAdvertiseUUID];
}

id objc_msgSend_humanReadableLEAddress(void *a1, const char *a2, ...)
{
  return [a1 humanReadableLEAddress];
}

id objc_msgSend_iconData(void *a1, const char *a2, ...)
{
  return [a1 iconData];
}

id objc_msgSend_iconMediaType(void *a1, const char *a2, ...)
{
  return [a1 iconMediaType];
}

id objc_msgSend_iconURL(void *a1, const char *a2, ...)
{
  return [a1 iconURL];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_initiatorDataAddress(void *a1, const char *a2, ...)
{
  return [a1 initiatorDataAddress];
}

id objc_msgSend_inputStream(void *a1, const char *a2, ...)
{
  return [a1 inputStream];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_intentToRetain(void *a1, const char *a2, ...)
{
  return [a1 intentToRetain];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidatePeripheral(void *a1, const char *a2, ...)
{
  return [a1 invalidatePeripheral];
}

id objc_msgSend_ipv6LinkLocalAddress(void *a1, const char *a2, ...)
{
  return [a1 ipv6LinkLocalAddress];
}

id objc_msgSend_isAdvertising(void *a1, const char *a2, ...)
{
  return [a1 isAdvertising];
}

id objc_msgSend_isAlternativeCarrierRecord(void *a1, const char *a2, ...)
{
  return [a1 isAlternativeCarrierRecord];
}

id objc_msgSend_isBluetoothLEConfigurationRecord(void *a1, const char *a2, ...)
{
  return [a1 isBluetoothLEConfigurationRecord];
}

id objc_msgSend_isCollisionResolutionRecord(void *a1, const char *a2, ...)
{
  return [a1 isCollisionResolutionRecord];
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return [a1 isConnected];
}

id objc_msgSend_isHandoverRequestRecord(void *a1, const char *a2, ...)
{
  return [a1 isHandoverRequestRecord];
}

id objc_msgSend_isHandoverSelectErrorRecord(void *a1, const char *a2, ...)
{
  return [a1 isHandoverSelectErrorRecord];
}

id objc_msgSend_isHandoverSelectRecord(void *a1, const char *a2, ...)
{
  return [a1 isHandoverSelectRecord];
}

id objc_msgSend_isISO18013DeviceEngagementRecord(void *a1, const char *a2, ...)
{
  return [a1 isISO18013DeviceEngagementRecord];
}

id objc_msgSend_isISO18013ReaderEngagementRecord(void *a1, const char *a2, ...)
{
  return [a1 isISO18013ReaderEngagementRecord];
}

id objc_msgSend_isNfcConfigurationRecord(void *a1, const char *a2, ...)
{
  return [a1 isNfcConfigurationRecord];
}

id objc_msgSend_isNotifying(void *a1, const char *a2, ...)
{
  return [a1 isNotifying];
}

id objc_msgSend_isScanning(void *a1, const char *a2, ...)
{
  return [a1 isScanning];
}

id objc_msgSend_isTrusted(void *a1, const char *a2, ...)
{
  return [a1 isTrusted];
}

id objc_msgSend_isWholeNumber(void *a1, const char *a2, ...)
{
  return [a1 isWholeNumber];
}

id objc_msgSend_isWiFiAwareConfigurationRecord(void *a1, const char *a2, ...)
{
  return [a1 isWiFiAwareConfigurationRecord];
}

id objc_msgSend_l2CapPSM(void *a1, const char *a2, ...)
{
  return [a1 l2CapPSM];
}

id objc_msgSend_l2capChannel(void *a1, const char *a2, ...)
{
  return [a1 l2capChannel];
}

id objc_msgSend_leAddr(void *a1, const char *a2, ...)
{
  return [a1 leAddr];
}

id objc_msgSend_leRole(void *a1, const char *a2, ...)
{
  return [a1 leRole];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localInterfaceIndex(void *a1, const char *a2, ...)
{
  return [a1 localInterfaceIndex];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_majorVersion(void *a1, const char *a2, ...)
{
  return [a1 majorVersion];
}

id objc_msgSend_maxLc(void *a1, const char *a2, ...)
{
  return [a1 maxLc];
}

id objc_msgSend_maxLe(void *a1, const char *a2, ...)
{
  return [a1 maxLe];
}

id objc_msgSend_maxLen(void *a1, const char *a2, ...)
{
  return [a1 maxLen];
}

id objc_msgSend_maximumUpdateValueLength(void *a1, const char *a2, ...)
{
  return [a1 maximumUpdateValueLength];
}

id objc_msgSend_merchantCategoryCode(void *a1, const char *a2, ...)
{
  return [a1 merchantCategoryCode];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return [a1 message];
}

id objc_msgSend_messageBegin(void *a1, const char *a2, ...)
{
  return [a1 messageBegin];
}

id objc_msgSend_messageEnd(void *a1, const char *a2, ...)
{
  return [a1 messageEnd];
}

id objc_msgSend_minLen(void *a1, const char *a2, ...)
{
  return [a1 minLen];
}

id objc_msgSend_minorVersion(void *a1, const char *a2, ...)
{
  return [a1 minorVersion];
}

id objc_msgSend_monotonic(void *a1, const char *a2, ...)
{
  return [a1 monotonic];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_numeric(void *a1, const char *a2, ...)
{
  return [a1 numeric];
}

id objc_msgSend_objectInstanceID(void *a1, const char *a2, ...)
{
  return [a1 objectInstanceID];
}

id objc_msgSend_okpCurveD(void *a1, const char *a2, ...)
{
  return [a1 okpCurveD];
}

id objc_msgSend_okpCurveIdentifier(void *a1, const char *a2, ...)
{
  return [a1 okpCurveIdentifier];
}

id objc_msgSend_okpCurveX(void *a1, const char *a2, ...)
{
  return [a1 okpCurveX];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return [a1 open];
}

id objc_msgSend_operatingChannel(void *a1, const char *a2, ...)
{
  return [a1 operatingChannel];
}

id objc_msgSend_operatingClass(void *a1, const char *a2, ...)
{
  return [a1 operatingClass];
}

id objc_msgSend_operations(void *a1, const char *a2, ...)
{
  return [a1 operations];
}

id objc_msgSend_organization(void *a1, const char *a2, ...)
{
  return [a1 organization];
}

id objc_msgSend_organizationalUnit(void *a1, const char *a2, ...)
{
  return [a1 organizationalUnit];
}

id objc_msgSend_outputStream(void *a1, const char *a2, ...)
{
  return [a1 outputStream];
}

id objc_msgSend_passphrase(void *a1, const char *a2, ...)
{
  return [a1 passphrase];
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return [a1 payload];
}

id objc_msgSend_peripheralCallbackLock(void *a1, const char *a2, ...)
{
  return [a1 peripheralCallbackLock];
}

id objc_msgSend_peripheralServiceUUID(void *a1, const char *a2, ...)
{
  return [a1 peripheralServiceUUID];
}

id objc_msgSend_popTimeInSeconds(void *a1, const char *a2, ...)
{
  return [a1 popTimeInSeconds];
}

id objc_msgSend_powerOn(void *a1, const char *a2, ...)
{
  return [a1 powerOn];
}

id objc_msgSend_powerState(void *a1, const char *a2, ...)
{
  return [a1 powerState];
}

id objc_msgSend_privacyPolicyURL(void *a1, const char *a2, ...)
{
  return [a1 privacyPolicyURL];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return [a1 properties];
}

id objc_msgSend_protocolType(void *a1, const char *a2, ...)
{
  return [a1 protocolType];
}

id objc_msgSend_publicKey(void *a1, const char *a2, ...)
{
  return [a1 publicKey];
}

id objc_msgSend_publicKeyGroup(void *a1, const char *a2, ...)
{
  return [a1 publicKeyGroup];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_readerAnalytics(void *a1, const char *a2, ...)
{
  return [a1 readerAnalytics];
}

id objc_msgSend_readerAuthCertificateData(void *a1, const char *a2, ...)
{
  return [a1 readerAuthCertificateData];
}

id objc_msgSend_readerMetadata(void *a1, const char *a2, ...)
{
  return [a1 readerMetadata];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeAllServices(void *a1, const char *a2, ...)
{
  return [a1 removeAllServices];
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return [a1 response];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_roleString(void *a1, const char *a2, ...)
{
  return [a1 roleString];
}

id objc_msgSend_securityInfo(void *a1, const char *a2, ...)
{
  return [a1 securityInfo];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_servicePort(void *a1, const char *a2, ...)
{
  return [a1 servicePort];
}

id objc_msgSend_services(void *a1, const char *a2, ...)
{
  return [a1 services];
}

id objc_msgSend_sessionTimedout(void *a1, const char *a2, ...)
{
  return [a1 sessionTimedout];
}

id objc_msgSend_setReady(void *a1, const char *a2, ...)
{
  return [a1 setReady];
}

id objc_msgSend_sharedCALogger(void *a1, const char *a2, ...)
{
  return [a1 sharedCALogger];
}

id objc_msgSend_shortRecord(void *a1, const char *a2, ...)
{
  return [a1 shortRecord];
}

id objc_msgSend_specRole(void *a1, const char *a2, ...)
{
  return [a1 specRole];
}

id objc_msgSend_src(void *a1, const char *a2, ...)
{
  return [a1 src];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startHandoff(void *a1, const char *a2, ...)
{
  return [a1 startHandoff];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_stopAdvertising(void *a1, const char *a2, ...)
{
  return [a1 stopAdvertising];
}

id objc_msgSend_stopScan(void *a1, const char *a2, ...)
{
  return [a1 stopScan];
}

id objc_msgSend_stopTimer(void *a1, const char *a2, ...)
{
  return [a1 stopTimer];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_supportedBands(void *a1, const char *a2, ...)
{
  return [a1 supportedBands];
}

id objc_msgSend_supportedCipherSuites(void *a1, const char *a2, ...)
{
  return [a1 supportedCipherSuites];
}

id objc_msgSend_symmetricKey(void *a1, const char *a2, ...)
{
  return [a1 symmetricKey];
}

id objc_msgSend_tag(void *a1, const char *a2, ...)
{
  return [a1 tag];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_typeNameFormat(void *a1, const char *a2, ...)
{
  return [a1 typeNameFormat];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_unsignedCharValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedCharValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedShortValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedShortValue];
}

id objc_msgSend_untrustedIdentifier(void *a1, const char *a2, ...)
{
  return [a1 untrustedIdentifier];
}

id objc_msgSend_untrustedIssuerIdentifier(void *a1, const char *a2, ...)
{
  return [a1 untrustedIssuerIdentifier];
}

id objc_msgSend_untrustedIssuerOrganization(void *a1, const char *a2, ...)
{
  return [a1 untrustedIssuerOrganization];
}

id objc_msgSend_untrustedOrganization(void *a1, const char *a2, ...)
{
  return [a1 untrustedOrganization];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_wait(void *a1, const char *a2, ...)
{
  return [a1 wait];
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 whitespaceCharacterSet];
}

id objc_msgSend_wifiP2PControllerDidStop(void *a1, const char *a2, ...)
{
  return [a1 wifiP2PControllerDidStop];
}

id objc_msgSend_xpcInterrupted(void *a1, const char *a2, ...)
{
  return [a1 xpcInterrupted];
}

id objc_msgSend_xpcInvalidated(void *a1, const char *a2, ...)
{
  return [a1 xpcInvalidated];
}