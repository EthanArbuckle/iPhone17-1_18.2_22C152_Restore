@interface HAPProtocolMessages
+ (BOOL)_parseEmptyResponse:(id)a3 expectedTID:(unsigned __int8)a4 withHeader:(BOOL)a5;
+ (BOOL)parseTokenResponse:(id)a3 expectedTID:(unsigned __int8)a4 withHeader:(BOOL)a5 outToken:(id *)a6 outUUID:(id *)a7;
+ (BOOL)parseTokenUpdateResponse:(id)a3 expectedTID:(unsigned __int8)a4 withHeader:(BOOL)a5;
+ (id)constructInfoRequest:(id)a3 outTID:(char *)a4;
+ (id)constructInfoRequest:(id)a3 serviceUUID:(id)a4 outTID:(char *)a5;
+ (id)constructRequestHeaderFor:(unint64_t)a3 instanceID:(id)a4 outTID:(char *)a5;
+ (id)constructTokenRequest:(id)a3 outTID:(char *)a4;
+ (id)constructTokenUpdateRequest:(id)a3 token:(id)a4 outTID:(char *)a5;
+ (id)logCategory;
+ (id)parseInfoResponse:(id)a3 expectedTID:(unsigned __int8)a4 withHeader:(BOOL)a5;
@end

@implementation HAPProtocolMessages

+ (id)constructTokenRequest:(id)a3 outTID:(char *)a4
{
  return +[HAPProtocolMessages constructRequestHeaderFor:16 instanceID:a3 outTID:a4];
}

+ (id)constructInfoRequest:(id)a3 outTID:(char *)a4
{
  return +[HAPProtocolMessages constructRequestHeaderFor:18 instanceID:a3 outTID:a4];
}

+ (id)constructInfoRequest:(id)a3 serviceUUID:(id)a4 outTID:(char *)a5
{
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v13 = 0u;
  id v7 = a4;
  v8 = +[HAPProtocolMessages constructRequestHeaderFor:18 instanceID:a3 outTID:a5];
  __int16 v11 = 18;
  [v8 appendBytes:&v11 length:2];
  TLV8BufferInit();
  [v7 getUUIDBytes:v12];

  if (TLV8BufferAppend())
  {
    TLV8BufferFree();
    id v9 = 0;
  }
  else
  {
    [v8 appendBytes:v13 length:];
    TLV8BufferFree();
    id v9 = v8;
  }

  return v9;
}

+ (id)constructTokenUpdateRequest:(id)a3 token:(id)a4 outTID:(char *)a5
{
  id v8 = a3;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v40 = 0u;
  id v33 = a4;
  unsigned __int16 v9 = (unsigned __int16)[v33 length];
  __int16 v10 = v9 / 0xFFu;
  __int16 v11 = v9 % 0xFFu;
  if (v9 % 0xFFu) {
    LOBYTE(v10) = v10 + 1;
  }
  unsigned int v12 = v10;
  __int16 v34 = v9 + 2 * v10;
  id v32 = v8;
  long long v31 = +[HAPProtocolMessages constructRequestHeaderFor:17 instanceID:v8 outTID:a5];
  [v31 appendBytes:&v34 length:2];
  TLV8BufferInit();
  if (v12)
  {
    uint64_t v13 = 0;
    uint64_t v14 = 255 * (v12 - 1);
    uint64_t v15 = 255 * v12;
    while (1)
    {
      if (v11) {
        BOOL v16 = v14 == v13;
      }
      else {
        BOOL v16 = 0;
      }
      if (v16) {
        unsigned __int8 v17 = v11;
      }
      else {
        unsigned __int8 v17 = -1;
      }
      int v18 = v17;
      [v33 getBytes:v39 range:v13];
      id v19 = a1;
      long long v20 = sub_100083F74();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        long long v21 = sub_100083FD0(v19);
        *(_DWORD *)buf = 138543618;
        v36 = v21;
        __int16 v37 = 1024;
        int v38 = v18;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%{public}@Adding token TLV length: %u", buf, 0x12u);
      }
      int v22 = TLV8BufferAppend();
      if (v22) {
        break;
      }
      v13 += 255;
      if (v15 == v13) {
        goto LABEL_15;
      }
    }
    int v26 = v22;
    TLV8BufferFree();
    id v27 = v19;
    long long v28 = sub_100083F74();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      long long v29 = sub_100083FD0(v27);
      *(_DWORD *)buf = 138543618;
      v36 = v29;
      __int16 v37 = 1024;
      int v38 = v26;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%{public}@Failed to construct token update request status: %d", buf, 0x12u);
    }
    id v24 = 0;
    long long v23 = v31;
    long long v25 = v32;
  }
  else
  {
LABEL_15:
    long long v23 = v31;
    [v31 appendBytes:v40];
    TLV8BufferFree();
    id v24 = v31;
    long long v25 = v32;
  }

  return v24;
}

+ (id)constructRequestHeaderFor:(unint64_t)a3 instanceID:(id)a4 outTID:(char *)a5
{
  unint64_t v15 = a3;
  id v6 = a4;
  id v7 = +[NSMutableData dataWithCapacity:5];
  char v14 = 0;
  [v7 appendBytes:&v14 length:1];
  [v7 appendBytes:&v15 length:1];
  id v8 = +[HAPBTLETransactionIdentifier randomTransactionIdentifier];
  unsigned __int8 v9 = [v8 unsignedCharValue];

  char v13 = v9;
  [v7 appendBytes:&v13 length:1];
  if (a5) {
    *a5 = v13;
  }
  unsigned __int16 v10 = (unsigned __int16)[v6 unsignedShortValue];

  unsigned __int16 v12 = v10;
  [v7 appendBytes:&v12 length:2];

  return v7;
}

+ (BOOL)parseTokenResponse:(id)a3 expectedTID:(unsigned __int8)a4 withHeader:(BOOL)a5 outToken:(id *)a6 outUUID:(id *)a7
{
  BOOL v7 = a5;
  int v8 = a4;
  id v10 = a3;
  __int16 v29 = 0;
  unsigned __int8 v28 = 0;
  unsigned __int16 v11 = (unsigned __int16)[v10 length];
  unsigned __int16 v27 = v11;
  if (v7)
  {
    sub_10001FE3C(v10, (unsigned char *)&v29 + 1, (uint64_t)&v29, (uint64_t)&v28);
    id v12 = (id)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      id v12 = a1;
      char v13 = sub_100083F74();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
LABEL_21:

        goto LABEL_22;
      }
      char v14 = sub_100083FD0(v12);
      *(_DWORD *)buf = 138543362;
      long long v31 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed parsing headers", buf, 0xCu);
      goto LABEL_20;
    }
    if (v29 != v8)
    {
      char v13 = a1;
      char v14 = sub_100083F74();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        unint64_t v15 = sub_100083FD0(v13);
        *(_DWORD *)buf = 138543874;
        long long v31 = v15;
        __int16 v32 = 1024;
        *(_DWORD *)id v33 = v29;
        *(_WORD *)&v33[4] = 1024;
        *(_DWORD *)&v33[6] = v8;
        BOOL v16 = "%{public}@Unexpected TID: 0x%02x expected: 0x%02x";
        unsigned __int8 v17 = v14;
        uint32_t v18 = 24;
        goto LABEL_19;
      }
LABEL_20:

      goto LABEL_21;
    }
    if (v28)
    {
      char v13 = a1;
      char v14 = sub_100083F74();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        unint64_t v15 = sub_100083FD0(v13);
        *(_DWORD *)buf = 138543618;
        long long v31 = v15;
        __int16 v32 = 1024;
        *(_DWORD *)id v33 = v28;
        BOOL v16 = "%{public}@Unexpected Status: 0x%02x";
        unsigned __int8 v17 = v14;
        uint32_t v18 = 18;
LABEL_19:
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, v16, buf, v18);

        goto LABEL_20;
      }
      goto LABEL_20;
    }
    if ((unint64_t)[v12 length] < 2)
    {
      char v13 = a1;
      char v14 = sub_100083F74();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_20;
      }
      unint64_t v15 = sub_100083FD0(v13);
      *(_DWORD *)buf = 138543362;
      long long v31 = v15;
      BOOL v16 = "%{public}@Insufficinet body length";
      unsigned __int8 v17 = v14;
      uint32_t v18 = 12;
      goto LABEL_19;
    }
    [v12 getBytes:&v27 length:2];
    [v12 subdataWithRange:2, (char *)[v12 length] - 2];
    id v10 = (id)objc_claimAutoreleasedReturnValue();

    unsigned __int16 v19 = v27;
  }
  else
  {
    unsigned __int16 v19 = v11;
  }
  if ([v10 length] == (id)v19)
  {
    id v20 = v10;
    [v20 bytes];
    [v20 length];
    int v21 = TLV8GetOrCopyCoalesced();
    if (v21) {
      int v22 = v21;
    }
    else {
      int v22 = -6743;
    }
  }
  else
  {
    int v22 = -6742;
  }
  id v23 = a1;
  id v24 = sub_100083F74();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    long long v25 = sub_100083FD0(v23);
    *(_DWORD *)buf = 138543618;
    long long v31 = v25;
    __int16 v32 = 2048;
    *(void *)id v33 = v22;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "%{public}@Auth response failed status: %ld", buf, 0x16u);
  }
  id v12 = v10;
LABEL_22:

  return 0;
}

+ (BOOL)_parseEmptyResponse:(id)a3 expectedTID:(unsigned __int8)a4 withHeader:(BOOL)a5
{
  __int16 v19 = 0;
  unsigned __int8 v18 = 0;
  if (a5)
  {
    int v5 = a4;
    uint64_t v7 = sub_10001FE3C(a3, (unsigned char *)&v19 + 1, (uint64_t)&v19, (uint64_t)&v18);
    if (!v7)
    {
      id v13 = a1;
      id v10 = sub_100083F74();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        char v14 = sub_100083FD0(v13);
        *(_DWORD *)buf = 138543362;
        int v21 = v14;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed parsing headers", buf, 0xCu);
      }
      int v8 = 0;
      goto LABEL_14;
    }
    int v8 = (void *)v7;
    if (v19 != v5)
    {
      id v15 = a1;
      id v10 = sub_100083F74();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        BOOL v16 = sub_100083FD0(v15);
        *(_DWORD *)buf = 138543874;
        int v21 = v16;
        __int16 v22 = 1024;
        int v23 = v19;
        __int16 v24 = 1024;
        int v25 = v5;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}@Unexpected TID: 0x%02x expected: 0x%02x", buf, 0x18u);
      }
      goto LABEL_14;
    }
    if (v18)
    {
      id v9 = a1;
      id v10 = sub_100083F74();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        unsigned __int16 v11 = sub_100083FD0(v9);
        *(_DWORD *)buf = 138543618;
        int v21 = v11;
        __int16 v22 = 1024;
        int v23 = v18;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}@Unexpected Status: 0x%02x", buf, 0x12u);
      }
LABEL_14:

      BOOL v12 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    int v8 = 0;
  }
  BOOL v12 = 1;
LABEL_15:

  return v12;
}

+ (BOOL)parseTokenUpdateResponse:(id)a3 expectedTID:(unsigned __int8)a4 withHeader:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = a4;
  id v8 = a3;
  id v9 = a1;
  id v10 = sub_100083F74();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    unsigned __int16 v11 = sub_100083FD0(v9);
    CFStringRef v12 = @"No";
    int v15 = 138543874;
    BOOL v16 = v11;
    __int16 v17 = 2112;
    if (v5) {
      CFStringRef v12 = @"Yes";
    }
    id v18 = v8;
    __int16 v19 = 2112;
    CFStringRef v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%{public}@Received Token Update Response: %@ withHeader: %@", (uint8_t *)&v15, 0x20u);
  }
  unsigned __int8 v13 = [v9 _parseEmptyResponse:v8 expectedTID:v6 withHeader:v5];

  return v13;
}

+ (id)parseInfoResponse:(id)a3 expectedTID:(unsigned __int8)a4 withHeader:(BOOL)a5
{
  BOOL v5 = a5;
  int v6 = a4;
  id v8 = a3;
  __int16 v27 = 0;
  unsigned __int8 v26 = 0;
  unsigned __int16 v9 = (unsigned __int16)[v8 length];
  unsigned __int16 v25 = v9;
  if (!v5)
  {
    unsigned __int16 v17 = v9;
    id v10 = v8;
    goto LABEL_8;
  }
  sub_10001FE3C(v8, (unsigned char *)&v27 + 1, (uint64_t)&v27, (uint64_t)&v26);
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    id v10 = a1;
    unsigned __int16 v11 = sub_100083F74();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_23;
    }
    CFStringRef v12 = sub_100083FD0(v10);
    *(_DWORD *)buf = 138543362;
    __int16 v29 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%{public}@Failed parsing headers", buf, 0xCu);
    goto LABEL_22;
  }
  if (v27 != v6)
  {
    unsigned __int16 v11 = a1;
    CFStringRef v12 = sub_100083F74();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v21 = sub_100083FD0(v11);
      *(_DWORD *)buf = 138543874;
      __int16 v29 = v21;
      __int16 v30 = 1024;
      *(_DWORD *)long long v31 = v27;
      *(_WORD *)&v31[4] = 1024;
      *(_DWORD *)&v31[6] = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}@Unexpected TID: 0x%02x expected: 0x%02x", buf, 0x18u);
    }
    goto LABEL_22;
  }
  if (!v26)
  {
    if ((unint64_t)[v10 length] < 2)
    {
      unsigned __int16 v11 = a1;
      CFStringRef v12 = sub_100083F74();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        goto LABEL_22;
      }
      unsigned __int8 v13 = sub_100083FD0(v11);
      *(_DWORD *)buf = 138543362;
      __int16 v29 = v13;
      char v14 = "%{public}@Insufficinet body length";
      int v15 = v12;
      uint32_t v16 = 12;
      goto LABEL_28;
    }
    [v10 getBytes:&v25 length:2];
    uint64_t v22 = [v10 subdataWithRange:2, [v10 length] - 2];

    unsigned __int16 v17 = v25;
    id v10 = (id)v22;
LABEL_8:
    if ([v10 length] == (id)v17)
    {
      id v18 = v10;
      [v18 bytes];
      [v18 length];
      int v19 = TLV8GetOrCopyCoalesced();
      if (v19)
      {
        int v20 = v19;
        unsigned __int16 v11 = 0;
      }
      else
      {
        unsigned __int16 v11 = 0;
        int v20 = -6743;
      }
    }
    else
    {
      unsigned __int16 v11 = 0;
      int v20 = -6742;
    }
    CFStringRef v12 = a1;
    unsigned __int8 v13 = sub_100083F74();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      int v23 = sub_100083FD0(v12);
      *(_DWORD *)buf = 138543618;
      __int16 v29 = v23;
      __int16 v30 = 1024;
      *(_DWORD *)long long v31 = v20;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%{public}@Acc Info Response failed status: %d", buf, 0x12u);
    }
    goto LABEL_21;
  }
  unsigned __int16 v11 = a1;
  CFStringRef v12 = sub_100083F74();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    unsigned __int8 v13 = sub_100083FD0(v11);
    *(_DWORD *)buf = 138543618;
    __int16 v29 = v13;
    __int16 v30 = 1024;
    *(_DWORD *)long long v31 = v26;
    char v14 = "%{public}@Unexpected Status: 0x%02x";
    int v15 = v12;
    uint32_t v16 = 18;
LABEL_28:
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, v14, buf, v16);
LABEL_21:
  }
LABEL_22:

LABEL_23:

  return 0;
}

+ (id)logCategory
{
  if (qword_1002AD648 != -1) {
    dispatch_once(&qword_1002AD648, &stru_100273128);
  }
  v2 = (void *)qword_1002AD650;

  return v2;
}

@end