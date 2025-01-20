void sub_100001F7C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;
  uint64_t v10;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_1000021AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15, void *a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000021F0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100002200(uint64_t a1)
{
}

void sub_100002208(uint64_t a1)
{
  v2 = +[_ANEProgramCacheKey programCacheKeyWithModel:*(void *)(a1 + 32) bundleID:*(void *)(a1 + 40)];
  v3 = +[NSString stringWithFormat:@"%p", *(void *)(a1 + 48)];
  id v4 = [(id)qword_100032BC0 objectForKeyedSubscript:v3];
  if (!v4)
  {
    id v4 = [&__NSDictionary0__struct mutableCopy];
    [qword_100032BC0 setObject:forKeyedSubscript:];
  }
  uint64_t v5 = [v4 objectForKeyedSubscript:v2];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    uint64_t v8 = objc_opt_new();
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    [v4 setObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) forKeyedSubscript:v2];
  }
  v11 = +[_ANELog daemon];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = NSStringFromSelector(*(SEL *)(a1 + 64));
    uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    *(_DWORD *)buf = 138413314;
    v15 = v12;
    __int16 v16 = 2112;
    v17 = v3;
    __int16 v18 = 2112;
    v19 = v2;
    __int16 v20 = 2112;
    id v21 = v4;
    __int16 v22 = 2112;
    uint64_t v23 = v13;
    _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%@: connStr=%@ : cacheKey=%@ : dict=%@ : p=%@", buf, 0x34u);
  }
}

void sub_1000023FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100002530(uint64_t a1)
{
  __int16 v22 = +[_ANEProgramCacheKey programCacheKeyWithModel:*(void *)(a1 + 32) bundleID:*(void *)(a1 + 40)];
  id v21 = +[NSString stringWithFormat:@"%p", *(void *)(a1 + 48)];
  v2 = [qword_100032BC0 objectForKeyedSubscript:];
  v3 = +[_ANELog daemon];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v19 = NSStringFromSelector(*(SEL *)(a1 + 56));
    *(_DWORD *)buf = 138413058;
    v27 = v19;
    __int16 v28 = 2112;
    v29 = v21;
    __int16 v30 = 2112;
    v31 = v22;
    __int16 v32 = 2112;
    v33 = v2;
    _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%@: connStr=%@ : cacheKey=%@ : dict=%@", buf, 0x2Au);
  }
  if (v2)
  {
    id v4 = [v2 objectForKeyedSubscript:v22];
    id v5 = [v4 removeCachedReference];
    unsigned int v6 = [v4 isNewInstance];
    CFStringRef v7 = @"modelUnload";
    if (v6) {
      CFStringRef v7 = @"newInstanceModelUnload";
    }
    CFStringRef v20 = v7;
    if (v6) {
      CFStringRef v8 = @"newInstanceUnloaded";
    }
    else {
      CFStringRef v8 = @"modelUnloaded";
    }
    uint64_t v9 = [*(id *)(a1 + 32) modelURL];
    v10 = *(void **)(a1 + 32);
    if (v9) {
      [v10 modelURL];
    }
    else {
    v11 = [v10 sourceURL];
    }
    uint64_t v23 = &stru_10002CA38;
    id v12 = +[_ANEStrings trimmedModelPath:v11 trimmedPath:&v23];
    uint64_t v13 = v23;

    uint64_t v14 = *(void *)(a1 + 40);
    v24[0] = @"csIdentity";
    v24[1] = @"modelURL";
    v25[0] = v14;
    v25[1] = v13;
    v24[2] = @"privacy_score";
    v15 = +[NSNumber numberWithBool:v12];
    v25[2] = v15;
    v24[3] = @"programHandle";
    __int16 v16 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v4 programHandle]);
    v25[3] = v16;
    v24[4] = v8;
    v17 = +[NSNumber numberWithBool:v5];
    v25[4] = v17;
    __int16 v18 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:5];
    +[_ANEDataReporter reportTelemetryToPPS:v20 playload:v18];

    if (v5) {
      [v2 removeObjectForKey:v22];
    }
  }
}

void sub_10000285C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1000029BC(uint64_t a1)
{
  v2 = +[NSString stringWithFormat:@"%p", *(void *)(a1 + 32)];
  v3 = +[_ANELog daemon];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v4 = NSStringFromSelector(*(SEL *)(a1 + 40));
    sub_10001B540(v4, (uint64_t)v2, buf, v3);
  }

  id v5 = [(id)qword_100032BC0 objectForKeyedSubscript:v2];
  [v5 enumerateKeysAndObjectsUsingBlock:&stru_10002C620];
  [(id)qword_100032BC0 removeObjectForKey:v2];
}

void sub_100002AB4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100002AE8(id a1, _ANEProgramCacheKey *a2, _ANEProgramForLoad *a3, BOOL *a4)
{
}

void sub_100002BB8(uint64_t a1)
{
  id v3 = +[NSString stringWithFormat:@"%p", *(void *)(a1 + 32)];
  v2 = [qword_100032BC0 objectForKeyedSubscript:];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count];
}

void sub_100002C44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100002D20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100003040(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  a9.super_class = (Class)_ANEProgramForLoad;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_1000030C4(void *a1)
{
}

id sub_10000314C(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) programInstance];
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = (char *)[v3 refcount] + 1;
    return [v3 setRefcount:v4];
  }
  return result;
}

uint64_t sub_100003258(uint64_t a1)
{
  uint64_t result = (uint64_t)[*(id *)(a1 + 32) programInstance];
  if (result)
  {
    [*(id *)(a1 + 32) setRefcount:((char *)[*(id *)(a1 + 32) refcount]) - 1];
    uint64_t result = (uint64_t)[*(id *)(a1 + 32) refcount];
    if (result >= 1) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    }
  }
  return result;
}

void sub_100003360(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100003914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, void *a20,void *a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,void *a29,void *a30,void *a31,void *a32,void *a33,void *a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,id a46,char a47)
{
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a47, 8);

  _Unwind_Resume(a1);
}

uint64_t sub_100003A04(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100003A14(uint64_t a1)
{
}

void sub_100003A1C(uint64_t a1)
{
  if ([*(id *)(a1 + 32) programInstance]) {
    return;
  }
  v2 = *(void **)(a1 + 40);
  if (!v2 || ![v2 length])
  {
    uint64_t v13 = +[_ANELog daemon];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v73 = NSStringFromSelector(*(SEL *)(a1 + 104));
      v74 = *(void **)(a1 + 40);
      *(_DWORD *)v105 = 138412802;
      *(void *)&v105[4] = v73;
      *(_WORD *)&v105[12] = 2112;
      *(void *)&v105[14] = v74;
      __int16 v106 = 2048;
      id v107 = [v74 length];
      _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%@: No Cached Model Data : %@ : %lu ", v105, 0x20u);
    }
    uint64_t v14 = NSStringFromSelector(*(SEL *)(a1 + 104));
    uint64_t v15 = +[_ANEErrors programLoadErrorForMethod:v14 code:2];
    uint64_t v16 = *(void *)(*(void *)(a1 + 88) + 8);
    v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

    goto LABEL_14;
  }
  id v3 = [*(id *)(a1 + 32) controller];
  id v4 = [v3 device];

  if (!v4)
  {
    __int16 v18 = +[_ANELog daemon];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 104));
      objc_claimAutoreleasedReturnValue();
      sub_10001B5EC();
    }

    v19 = NSStringFromSelector(*(SEL *)(a1 + 104));
    uint64_t v20 = +[_ANEErrors programLoadErrorForMethod:v19 code:3];
    uint64_t v21 = *(void *)(*(void *)(a1 + 88) + 8);
    __int16 v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;

    goto LABEL_14;
  }
  id v5 = [*(id *)(a1 + 32) txn];

  if (!v5)
  {
    unsigned int v6 = [*(id *)(a1 + 48) csIdentity];
    id v7 = [*(id *)(a1 + 48) processIdentifier];
    CFStringRef v8 = [*(id *)(a1 + 48) modelIdentifier];
    uint64_t v9 = +[NSString stringWithFormat:@"%@.%d.%@", v6, v7, v8];

    id v10 = v9;
    [v10 UTF8String];
    v11 = (void *)os_transaction_create();
    [*(id *)(a1 + 32) setTxn:v11];
  }
  if ((unint64_t)[*(id *)(a1 + 56) length] >= 0x400)
  {
    id v12 = +[_ANELog daemon];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 104));
      objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 56) length];
      sub_10001B630();
    }

    goto LABEL_14;
  }
  bzero(&v105[16], 0xD60uLL);
  *(void *)v105 = [*(id *)(a1 + 40) bytes];
  *(void *)&v105[8] = [*(id *)(a1 + 40) length];
  v105[16] = *(unsigned char *)(a1 + 132);
  int v115 = *(_DWORD *)(a1 + 120);
  strlcpy(v118, (const char *)[*(id *)(a1 + 56) UTF8String], 0x400uLL);
  uint64_t v23 = [*(id *)(a1 + 48) teamIdentity];
  +[_ANEHashEncoding copySHA256For:v23 toBuffer:&v105[17]];

  v24 = [*(id *)(a1 + 48) csIdentity];
  +[_ANEHashEncoding copySHA256For:v24 toBuffer:v108];

  v25 = *(void **)(a1 + 64);
  int v26 = *(_DWORD *)(a1 + 128);
  int v110 = *(_DWORD *)(a1 + 124);
  int v109 = 16 * *(unsigned __int8 *)(a1 + 133);
  *(_DWORD *)&v108[35] = v26;
  uint64_t v111 = *(void *)(a1 + 112);
  v27 = (long long *)[v25 UTF8String];
  id v28 = [*(id *)(a1 + 64) length];
  if ((unint64_t)v28 < 0x100)
  {
    memcpy(v112, v27, (size_t)v28);
  }
  else
  {
    v29 = +[_ANELog daemon];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 104));
      objc_claimAutoreleasedReturnValue();
      sub_10001B7C4();
    }

    long long v30 = v27[8];
    long long v31 = v27[9];
    long long v32 = v27[11];
    v112[10] = v27[10];
    v112[11] = v32;
    long long v33 = v27[12];
    long long v34 = v27[13];
    long long v35 = v27[14];
    *(_OWORD *)&v113[15] = *(long long *)((char *)v27 + 239);
    v112[13] = v34;
    *(_OWORD *)v113 = v35;
    v112[12] = v33;
    long long v36 = *v27;
    long long v37 = v27[1];
    long long v38 = v27[2];
    v112[3] = v27[3];
    v112[2] = v38;
    v112[1] = v37;
    v112[0] = v36;
    long long v39 = v27[4];
    long long v40 = v27[5];
    long long v41 = v27[6];
    v112[7] = v27[7];
    v112[6] = v41;
    v112[5] = v40;
    v112[4] = v39;
    v112[9] = v31;
    v112[8] = v30;
    char v114 = 0;
  }
  v42 = *(void **)(a1 + 72);
  if (v42)
  {
    id v43 = [v42 UTF8String];
    id v44 = [*(id *)(a1 + 72) length];
    if ((unint64_t)v44 < 0x400)
    {
      memcpy(v117, v43, (size_t)v44);
      v46 = +[_ANELog daemon];
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
      {
        v82 = NSStringFromSelector(*(SEL *)(a1 + 104));
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v82;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = v43;
        *(_WORD *)&buf[22] = 2048;
        *(void *)&uint8_t buf[24] = v44;
        _os_log_debug_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEBUG, "%@: aotCacheUrlIdentifier is %s with len %lu", buf, 0x20u);
      }
    }
    else
    {
      v45 = +[_ANELog daemon];
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        NSStringFromSelector(*(SEL *)(a1 + 104));
        objc_claimAutoreleasedReturnValue();
        sub_10001B780();
      }

      memcpy(v117, v43, 0x3FFuLL);
      v117[1023] = 0;
    }
  }
  id v47 = [*(id *)(a1 + 80) UTF8String];
  id v48 = [*(id *)(a1 + 80) length];
  if ((unint64_t)v48 < 0x400)
  {
    memcpy(v116, v47, (size_t)v48);
  }
  else
  {
    v49 = +[_ANELog daemon];
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 104));
      objc_claimAutoreleasedReturnValue();
      sub_10001B73C();
    }

    memcpy(v116, v47, 0x3FFuLL);
    v116[1023] = 0;
  }
  v50 = +[_ANELog daemon];
  if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
  {
    v51 = NSStringFromSelector(*(SEL *)(a1 + 104));
    int v52 = *(_DWORD *)(a1 + 128);
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v51;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 277;
    *(_WORD *)&buf[18] = 1024;
    *(_DWORD *)&buf[20] = v52;
    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "%@ %d Stats mask value: %u ", buf, 0x18u);
  }
  v53 = [*(id *)(a1 + 32) controller];
  id v54 = [v53 device];
  if (!v54 || !*(void *)v54)
  {

    uint64_t v55 = 2;
    goto LABEL_56;
  }
  uint64_t v55 = (*(uint64_t (**)(id, unsigned char *, uint64_t))(*(void *)v54 + 16))(v54, v105, *(void *)(a1 + 32) + 56);

  if (v55)
  {
LABEL_56:
    v68 = +[_ANELog daemon];
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 104));
      objc_claimAutoreleasedReturnValue();
      sub_10001B69C();
    }

    +[_ANEDataReporter reportErrorMsg:0 status:v55];
    [*(id *)(a1 + 32) setProgramInstance:0];
    v69 = NSStringFromSelector(*(SEL *)(a1 + 104));
    uint64_t v70 = +[_ANEErrors programLoadErrorForMethod:v69 code:(v55 << 16) | 4];
    uint64_t v71 = *(void *)(*(void *)(a1 + 88) + 8);
    v72 = *(void **)(v71 + 40);
    *(void *)(v71 + 40) = v70;

    goto LABEL_14;
  }
  if (![*(id *)(a1 + 32) programInstance])
  {
    uint64_t v55 = 0;
    goto LABEL_56;
  }
  if (!*((void *)[*(id *)(a1 + 32) programInstance] + 2))
  {
    v56 = +[_ANELog daemon];
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(*(SEL *)(a1 + 104));
      objc_claimAutoreleasedReturnValue();
      sub_10001B6EC();
    }
  }
  v57 = +[_ANELog daemon];
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
  {
    NSStringFromSelector(*(SEL *)(a1 + 104));
    id v88 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v89 = **((void **)[*(id *)(a1 + 32) programInstance] + 6);
    uint64_t v90 = *((void *)[*(id *)(a1 + 32) programInstance] + 2);
    uint64_t v91 = **((void **)[*(id *)(a1 + 32) programInstance] + 11);
    *(_DWORD *)buf = 138413314;
    *(void *)&uint8_t buf[4] = v88;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 298;
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = v89;
    *(_WORD *)&buf[28] = 2048;
    *(void *)&buf[30] = v90;
    *(_WORD *)&buf[38] = 2048;
    uint64_t v97 = v91;
    _os_log_debug_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEBUG, "%@: %d Input[0] size %zu Inter size %zu output[0] size %zu", buf, 0x30u);
  }
  if (*(unsigned char *)(a1 + 134)) {
    goto LABEL_50;
  }
  memset(buf, 0, 32);
  unsigned int v75 = +[_ANEQoSMapper programPriorityForQoS:*(unsigned int *)(a1 + 124)];
  int v76 = *(_DWORD *)(a1 + 124);
  *(_DWORD *)&uint8_t buf[4] = 0;
  *(_DWORD *)&buf[8] = v76;
  *(_DWORD *)buf = v75;
  buf[12] = 1;
  *(void *)&buf[16] = [*(id *)(a1 + 32) intermediateBufferHandle];
  uint8_t buf[24] = *(unsigned char *)(a1 + 135);
  v77 = (uint64_t (***)(void))[*(id *)(a1 + 32) programInstance];
  if (!v77 || !*v77)
  {
    uint64_t v78 = 2;
LABEL_65:
    v79 = +[_ANELog daemon];
    if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
    {
      v92 = NSStringFromSelector(*(SEL *)(a1 + 104));
      id v93 = [*(id *)(a1 + 32) programInstance];
      *(_DWORD *)v99 = 138412802;
      v100 = v92;
      __int16 v101 = 2048;
      id v102 = v93;
      __int16 v103 = 1024;
      int v104 = v78;
      _os_log_error_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_ERROR, "%@: Could not prepare ANE program=%p : ret=0x%x", v99, 0x1Cu);
    }
    +[_ANEDataReporter reportErrorMsg:0 status:v78];
    id v80 = [*(id *)(a1 + 32) programInstance];
    if (v80 && *(void *)v80)
    {
      int v81 = (*(uint64_t (**)(void))(*(void *)v80 + 24))();
      if (!v81)
      {
LABEL_75:
        [*(id *)(a1 + 32) setProgramInstance:0];
        v84 = NSStringFromSelector(*(SEL *)(a1 + 104));
        uint64_t v85 = +[_ANEErrors programLoadErrorForMethod:v84 code:(v81 << 16) | 5];
        uint64_t v86 = *(void *)(*(void *)(a1 + 88) + 8);
        v87 = *(void **)(v86 + 40);
        *(void *)(v86 + 40) = v85;

LABEL_14:
        *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 0;
        return;
      }
    }
    else
    {
      int v81 = 2;
    }
    v83 = +[_ANELog daemon];
    if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
    {
      v94 = NSStringFromSelector(*(SEL *)(a1 + 104));
      id v95 = [*(id *)(a1 + 32) programInstance];
      *(_DWORD *)v99 = 138412802;
      v100 = v94;
      __int16 v101 = 2048;
      id v102 = v95;
      __int16 v103 = 1024;
      int v104 = v81;
      _os_log_error_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_ERROR, "%@: Could not destroy ANE program=%p : ret=0x%x", v99, 0x1Cu);
    }
    goto LABEL_75;
  }
  uint64_t v78 = (**v77)();
  if (v78) {
    goto LABEL_65;
  }
LABEL_50:
  [*(id *)(a1 + 32) setProgramHandle:*(void *)(*(void *)(*(void *)(a1 + 32) + 56) + 112)];
  if (![*(id *)(a1 + 32) intermediateBufferHandle]) {
    [*(id *)(a1 + 32) setIntermediateBufferHandle:*(void *)(*(void *)(*(void *)(a1 + 32) + 56) + 152)];
  }
  v58 = (id *)(a1 + 32);
  [*(id *)(a1 + 32) setQueueDepth:127];
  [*v58 setNumInputs:*(unsigned __int8 *)(*((void *)*v58 + 7) + 32)];
  [*v58 setNumOutputs:*(unsigned __int8 *)(*((void *)*v58 + 7) + 72)];
  [*(id *)(a1 + 32) setRefcount:1];
  [*(id *)(a1 + 32) setWiredMemory:*(char *)(objc_msgSend(*(id *)(a1 + 40), "length")+ *(objc_msgSend(*(id *)(a1 + 32), "programInstance") + 2))];
  v59 = +[_ANELog daemon];
  if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 104));
    id v60 = (id)objc_claimAutoreleasedReturnValue();
    id v61 = [*(id *)(a1 + 32) programHandle];
    v62 = *(void **)(a1 + 32);
    int v63 = *(char *)(v62[7] + 144);
    unsigned int v64 = [v62 numInputs];
    unsigned int v65 = [*(id *)(a1 + 32) numOutputs];
    unsigned int v66 = [*(id *)(a1 + 32) queueDepth];
    id v67 = [*(id *)(a1 + 32) wiredMemory];
    *(_DWORD *)buf = 138413826;
    *(void *)&uint8_t buf[4] = v60;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v61;
    *(_WORD *)&buf[22] = 1024;
    *(_DWORD *)&uint8_t buf[24] = v63;
    *(_WORD *)&buf[28] = 1024;
    *(_DWORD *)&buf[30] = v64;
    *(_WORD *)&buf[34] = 1024;
    *(_DWORD *)&buf[36] = v65;
    LOWORD(v97) = 1024;
    *(_DWORD *)((char *)&v97 + 2) = v66;
    HIWORD(v97) = 2048;
    id v98 = v67;
    _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_INFO, "%@: programHandle=%llu : queueDepth=%d : numInputs=%d : numOutputs=%d : adjustedQueueDepth=%d : wiredMemory=%ld", buf, 0x38u);
  }
}

void sub_100004700(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100004CAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,void *a23,void *a24,void *a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,id a36,char a37)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a37, 8);

  _Unwind_Resume(a1);
}

void sub_100004D6C(uint64_t a1)
{
  if ([*(id *)(a1 + 32) programInstance])
  {
    v2 = +[_ANELog daemon];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(*(SEL *)(a1 + 80));
      objc_claimAutoreleasedReturnValue();
      [*(id *)(a1 + 32) programInstance];
      sub_10001B8EC();
    }
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) controller];
    id v4 = [v3 device];

    if (v4)
    {
      id v5 = [*(id *)(a1 + 32) txn];

      if (!v5)
      {
        unsigned int v6 = [*(id *)(a1 + 40) csIdentity];
        id v7 = [*(id *)(a1 + 40) processIdentifier];
        CFStringRef v8 = [*(id *)(a1 + 40) modelIdentifier];
        uint64_t v9 = +[NSString stringWithFormat:@"%@.%d.%@", v6, v7, v8];

        id v10 = v9;
        [v10 UTF8String];
        v11 = (void *)os_transaction_create();
        [*(id *)(a1 + 32) setTxn:v11];
      }
      operator new();
    }
    id v12 = +[_ANELog daemon];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 80));
      objc_claimAutoreleasedReturnValue();
      sub_10001B5EC();
    }

    uint64_t v13 = NSStringFromSelector(*(SEL *)(a1 + 80));
    uint64_t v14 = +[_ANEErrors programLoadNewInstanceErrorForMethod:v13 code:3];
    uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
  }
}

void sub_1000060A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1000066A0(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) programInstance];
  if (result)
  {
    id v3 = [*(id *)(a1 + 32) programInstance];
    if (v3 && *(void *)v3)
    {
      uint64_t v4 = (*(uint64_t (**)(id))(*(void *)v3 + 24))(v3);
      if (!v4)
      {
LABEL_10:
        id v7 = *(void **)(a1 + 32);
        unsigned int v6 = (id *)(a1 + 32);
        [v7 setProgramInstance:0];
        [*v6 setRefcount:0];
        return [*v6 setTxn:0];
      }
    }
    else
    {
      uint64_t v4 = 2;
    }
    id v5 = +[_ANELog daemon];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      objc_claimAutoreleasedReturnValue();
      sub_10001B93C();
    }

    +[_ANEDataReporter reportErrorMsg:0 status:v4];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    goto LABEL_10;
  }
  return result;
}

void sub_1000067B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000068E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006FB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, void *a17, void *a18, void *a19, void *a20,void *a21,void *a22)
{
  _Unwind_Resume(a1);
}

void sub_100007BAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  for (uint64_t i = 8216; i != 24; i -= 32)
  _Unwind_Resume(a1);
}

uint64_t sub_100007FC4(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a2 = a4;
  *(void *)(a2 + 4) = result;
  *(_WORD *)(a2 + 12) = 2048;
  *(void *)(a2 + 14) = a3;
  *(_WORD *)(a2 + 22) = 1024;
  *(_DWORD *)(a2 + 24) = 1023;
  return result;
}

void sub_100007FEC(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_debug_impl(a1, a4, OS_LOG_TYPE_DEBUG, a2, a3, 0x16u);
}

void sub_100008008(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

uint64_t sub_100008024(uint64_t result, float a2, uint64_t a3, uint64_t a4)
{
  *(float *)a4 = a2;
  *(void *)(a4 + 4) = result;
  *(_WORD *)(a4 + 12) = 2048;
  *(void *)(a4 + 14) = v4;
  return result;
}

uint64_t sub_10000803C(uint64_t result, uint64_t a2, int a3, float a4)
{
  *(float *)a2 = a4;
  *(void *)(a2 + 4) = result;
  *(_WORD *)(a2 + 12) = 1024;
  *(_DWORD *)(a2 + 14) = a3;
  return result;
}

void sub_100008054(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x1Cu);
}

uint64_t sub_100008080(uint64_t result, float a2, uint64_t a3, uint64_t a4)
{
  *(float *)a4 = a2;
  *(void *)(a4 + 4) = result;
  return result;
}

uint64_t sub_10000808C(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(void *)(a2 + 4) = result;
  return result;
}

void sub_10000896C(uint64_t a1)
{
  [*(id *)(a1 + 32) UTF8String];
  id v3 = (id)os_transaction_create();
  [*(id *)(a1 + 40) removeStaleModels];
}

void sub_100009654(uint64_t a1, void *a2)
{
  id v3 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v3);
  if (state)
  {
    if (state == 2)
    {
      *(void *)&long long v24 = 0;
      *((void *)&v24 + 1) = &v24;
      uint64_t v25 = 0x2020000000;
      BOOL v26 = 0;
      BOOL v26 = xpc_activity_set_state(v3, 4);
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_100009934;
      v16[3] = &unk_10002C760;
      id v17 = *(id *)(a1 + 32);
      __int16 v18 = v3;
      v19 = &v24;
      uint64_t v5 = objc_retainBlock(v16);
      unsigned int v6 = +[_ANELog daemon];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        id v7 = [*(id *)(a1 + 32) name];
        int v8 = *(unsigned __int8 *)(*((void *)&v24 + 1) + 24);
        *(_DWORD *)buf = 138412546;
        uint64_t v21 = v7;
        __int16 v22 = 1024;
        int v23 = v8;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Running activity %@, extended=%d", buf, 0x12u);
      }
      if (*(unsigned char *)(*((void *)&v24 + 1) + 24))
      {
        uint64_t v9 = [*(id *)(a1 + 32) queue];
        dispatch_async(v9, v5);
      }
      else
      {
        ((void (*)(void *))v5[2])(v5);
      }

      _Block_object_dispose(&v24, 8);
    }
  }
  else
  {
    id v10 = +[_ANELog daemon];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = [*(id *)(a1 + 32) name];
      LODWORD(v24) = 138412290;
      *(void *)((char *)&v24 + 4) = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Checking-in activity %@", (uint8_t *)&v24, 0xCu);
    }
    xpc_object_t v12 = xpc_activity_copy_criteria(v3);
    if (!v12
      || ([*(id *)(a1 + 32) executionCriteria],
          uint64_t v13 = objc_claimAutoreleasedReturnValue(),
          BOOL v14 = xpc_equal(v12, v13),
          v13,
          !v14))
    {
      uint64_t v15 = [*(id *)(a1 + 32) executionCriteria];
      xpc_activity_set_criteria(v3, v15);
    }
  }
}

void sub_10000990C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100009934(uint64_t a1)
{
  getpid();
  proc_set_cpumon_params();
  id v2 = [*(id *)(a1 + 32) name];
  [v2 UTF8String];
  id v3 = (void *)os_transaction_create();

  uint64_t v5 = [*(id *)(a1 + 32) handler];
  v5[2]();

  getpid();
  proc_set_cpumon_defaults();
  xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 5);
  unsigned int v6 = +[_ANELog daemon];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [*(id *)(a1 + 32) name];
    int v8 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    int v9 = 138412546;
    id v10 = v7;
    __int16 v11 = 1024;
    int v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Done running activity %@, extended=%d", (uint8_t *)&v9, 0x12u);
  }
}

void sub_10000A18C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000A1C4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = +[_ANELog daemon];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10001BB6C(a1, WeakRetained);
  }

  if (WeakRetained) {
    +[_ANEProgramCache removeAllProgramsForConnection:WeakRetained];
  }
}

void sub_10000A248(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = +[_ANELog daemon];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10001BC20(a1, WeakRetained);
  }

  if (WeakRetained) {
    +[_ANEProgramCache removeAllProgramsForConnection:WeakRetained];
  }
}

void sub_10000A3A0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x26u);
}

void sub_10000A770(uint64_t a1)
{
  id v2 = (void *)os_transaction_create();
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = *(id *)(a1 + 32);
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      int v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(a1 + 40) doCleanupDirectory:*(void *)(*((void *)&v9 + 1) + 8 * (void)v8), (void)v9];
        int v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

void sub_10000A91C(id a1)
{
  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.aned.storageAsyncIO", v1);
  id v3 = (void *)qword_100032BD8;
  qword_100032BD8 = (uint64_t)v2;

  qword_100032BE0 = +[_ANELog daemon];

  _objc_release_x1();
}

void sub_10000B23C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000B288(uint64_t a1, void *a2, size_t a3)
{
  if (munmap(a2, a3) == -1)
  {
    id v6 = (void *)qword_100032BE0;
    if (os_log_type_enabled((os_log_t)qword_100032BE0, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(const char **)(a1 + 32);
      int v8 = v6;
      long long v9 = NSStringFromSelector(v7);
      uint64_t v10 = *(void *)(a1 + 40);
      int v11 = *__error();
      long long v12 = __error();
      uint64_t v13 = strerror(*v12);
      int v14 = 138413570;
      uint64_t v15 = v9;
      __int16 v16 = 2080;
      uint64_t v17 = v10;
      __int16 v18 = 2048;
      v19 = a2;
      __int16 v20 = 2048;
      size_t v21 = a3;
      __int16 v22 = 1024;
      int v23 = v11;
      __int16 v24 = 2080;
      uint64_t v25 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@: munmap(%s) failed. bytes=%p : len=%lu errno=%d : %s", (uint8_t *)&v14, 0x3Au);
    }
  }
}

uint64_t sub_10000B3C8(uint64_t a1)
{
  return close(*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
}

void sub_10000B8CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000B904(uint64_t a1, void *a2, size_t a3)
{
  if (munmap(a2, a3) == -1)
  {
    id v6 = (void *)qword_100032BE0;
    if (os_log_type_enabled((os_log_t)qword_100032BE0, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(const char **)(a1 + 32);
      int v8 = v6;
      long long v9 = NSStringFromSelector(v7);
      uint64_t v10 = *(void *)(a1 + 40);
      int v11 = *__error();
      long long v12 = __error();
      uint64_t v13 = strerror(*v12);
      int v14 = 138413570;
      uint64_t v15 = v9;
      __int16 v16 = 2080;
      uint64_t v17 = v10;
      __int16 v18 = 2048;
      v19 = a2;
      __int16 v20 = 2048;
      size_t v21 = a3;
      __int16 v22 = 1024;
      int v23 = v11;
      __int16 v24 = 2080;
      uint64_t v25 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%@: munmap(%s) failed. bytes=%p : len=%lu errno=%d : %s", (uint8_t *)&v14, 0x3Au);
    }
  }
}

uint64_t sub_10000BA44(uint64_t a1)
{
  return close(*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
}

uint64_t sub_10000C9E0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)qword_100032BE0;
  if (os_log_type_enabled((os_log_t)qword_100032BE0, OS_LOG_TYPE_ERROR))
  {
    long long v9 = *(const char **)(a1 + 32);
    uint64_t v10 = v7;
    int v11 = NSStringFromSelector(v9);
    int v12 = 138412802;
    uint64_t v13 = v11;
    __int16 v14 = 2112;
    id v15 = v5;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@: URL=%@ : error=%@", (uint8_t *)&v12, 0x20u);
  }
  return 1;
}

void sub_10000DF28(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void sub_10000DF98(id a1)
{
  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v2 = dispatch_queue_create("com.apple.aned.modelCacheAsyncIO", v1);
  id v3 = (void *)qword_100032BF0;
  qword_100032BF0 = (uint64_t)v2;

  qword_100032BF8 = +[_ANELog daemon];

  _objc_release_x1();
}

void sub_10000E708(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

uint64_t sub_10000E73C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000E74C(uint64_t a1)
{
}

void sub_10000E754(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 copy];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  int v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  id v9 = [v5 copy];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  int v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

void sub_10000F8D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)qword_100032BF8;
  if (os_log_type_enabled((os_log_t)qword_100032BF8, OS_LOG_TYPE_ERROR)) {
    sub_10001C450(a1, v4, (uint64_t)v3);
  }
}

void sub_10000F930(uint64_t a1, uint64_t a2)
{
  id v4 = (void *)qword_100032BF8;
  if (os_log_type_enabled((os_log_t)qword_100032BF8, OS_LOG_TYPE_INFO))
  {
    id v5 = *(const char **)(a1 + 32);
    id v6 = v4;
    uint64_t v7 = NSStringFromSelector(v5);
    int v8 = +[NSNumber numberWithBool:a2];
    int v9 = 138412546;
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    int v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%@: status=%@", (uint8_t *)&v9, 0x16u);
  }
}

void sub_10000FB00(uint64_t a1)
{
  [*(id *)(a1 + 32) UTF8String];
  id v3 = (id)os_transaction_create();
  [*(id *)(a1 + 40) startDanglingModelGC];
}

uint64_t sub_1000103F0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)qword_100032BF8;
  if (os_log_type_enabled((os_log_t)qword_100032BF8, OS_LOG_TYPE_ERROR))
  {
    int v9 = *(const char **)(a1 + 32);
    uint64_t v10 = v7;
    __int16 v11 = NSStringFromSelector(v9);
    int v12 = 138412802;
    uint64_t v13 = v11;
    __int16 v14 = 2112;
    id v15 = v5;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@: URL=%@ : error=%@", (uint8_t *)&v12, 0x20u);
  }
  return 0;
}

void sub_10001061C(_Unwind_Exception *a1)
{
  id v6 = v4;

  _Unwind_Resume(a1);
}

void sub_100010668()
{
}

void sub_100010730(_Unwind_Exception *a1)
{
  id v6 = v4;

  _Unwind_Resume(a1);
}

void sub_10001077C()
{
}

void sub_10001149C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _Unwind_Exception *exception_object, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_100011944(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100011C78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000120A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_1000122F4(_Unwind_Exception *a1)
{
  id v4 = v3;

  _Unwind_Resume(a1);
}

id sub_1000123D0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleIOKitEvent:*(void *)(a1 + 40)];
}

void sub_100012540(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100012814(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100012A8C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100012CC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100012F20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000130DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000136D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id a23)
{
  long long v32 = v29;

  _Block_object_dispose(&a18, 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);

  _Unwind_Resume(a1);
}

uint64_t sub_100013818(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100013828(uint64_t a1)
{
}

void sub_100013830(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  id v6 = [v12 copy];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  int v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  id v9 = [v5 copy];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  __int16 v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

void sub_1000138BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001405C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_10001474C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_1000162D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,void *a33,void *a34,uint64_t a35,void *a36,uint64_t a37,uint64_t a38,void *a39,uint64_t a40,void *a41,void *a42,void *a43,uint64_t a44,void *a45,uint64_t a46,void *a47,void *a48,void *a49)
{
  _Unwind_Resume(a1);
}

void sub_1000175D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, uint64_t a14, void *a15, void *a16, uint64_t a17, void *a18, uint64_t a19, void *a20,void *a21,void *a22,uint64_t a23,void *a24,void *a25,void *a26,void *a27)
{
  _Unwind_Resume(a1);
}

void sub_100017F88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, void *a12)
{
  _Unwind_Resume(a1);
}

void sub_10001850C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, void *a13)
{
  _Unwind_Resume(a1);
}

void sub_1000188DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100018C48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100019520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17)
{
  _Block_object_dispose((const void *)(v21 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1000196D4(uint64_t a1, char a2, void *a3, void *a4, void *a5)
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    [*(id *)(a1 + 32) setCacheURLIdentifier:v10];
  }
  else
  {
    id v12 = (id)qword_100032C00;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      __int16 v14 = NSStringFromSelector(*(SEL *)(a1 + 56));
      uint64_t v15 = *(void *)(a1 + 32);
      int v16 = 138413314;
      id v17 = v14;
      __int16 v18 = 2112;
      uint64_t v19 = v15;
      __int16 v20 = 2112;
      id v21 = v9;
      __int16 v22 = 2112;
      id v23 = v11;
      __int16 v24 = 2112;
      id v25 = v10;
      _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@: Compilation failed. model=%@ : attr=%@ : err=%@ : cacheURLIdentifier=%@", (uint8_t *)&v16, 0x34u);
    }
    if (v11) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a5);
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = 5;
  }
  [*(id *)(a1 + 32) updateModelAttributes:v9 state:v13];
}

void sub_10001986C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001A580(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17, uint64_t a18, uint64_t a19, void *a20,void *a21,void *a22,uint64_t a23,void *a24,void *a25,void *a26,uint64_t a27,void *a28,void *a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,void *a59,void *a60)
{
  _Unwind_Resume(a1);
}

void sub_10001A8AC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = qword_100032C00;
  if (os_log_type_enabled((os_log_t)qword_100032C00, OS_LOG_TYPE_ERROR)) {
    sub_10001D834(a1, (uint64_t)v3, v4);
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, void, void *, void, id))(v5 + 16))(v5, 0, &__NSDictionary0__struct, 0, v3);
  }
}

void sub_10001A934(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001A944(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  id v6 = [v12 copy];
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  int v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  id v9 = [v5 copy];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

void sub_10001A9D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10001A9E8(uint64_t a1, char a2, void *a3, void *a4)
{
  id v8 = a3;
  id v9 = a4;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  uint64_t v10 = qword_100032C00;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)qword_100032C00, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Compilation success: attr=%@", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100032C00, OS_LOG_TYPE_ERROR)) {
      sub_10001D8C0();
    }
    if (v9) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a4);
    }
  }
  [*(id *)(a1 + 32) string_id];
  kdebug_trace();
}

void sub_10001AB38(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10001AC28(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  return result;
}

void sub_10001AC40(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x16u);
}

uint64_t sub_10001AC78(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(void *)(a2 + 4) = result;
  *(_WORD *)(a2 + 12) = 2112;
  return result;
}

uint64_t sub_10001AC8C(uint64_t result, float a2)
{
  *(float *)uint64_t v2 = a2;
  *(void *)(v2 + 4) = result;
  *(_WORD *)(v2 + 12) = 2112;
  *(void *)(v2 + 14) = v3;
  return result;
}

void sub_10001ACA4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void sub_10001ACC4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_10001ACE0(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  _os_log_debug_impl(a1, v4, OS_LOG_TYPE_DEBUG, a4, v5, 0x16u);
}

id sub_10001AD14(id a1)
{
  return a1;
}

uint64_t sub_10001AD3C(uint64_t result, char a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(void *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 1024;
  *(_DWORD *)(a3 + 14) = a2 & 1;
  return result;
}

void sub_10001AD58(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void start()
{
  uint64_t v1 = (void *)os_transaction_create();
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10001B01C;
  handler[3] = &unk_10002C788;
  id v2 = (id)objc_opt_new();
  handler[4] = v2;
  xpc_set_event_stream_handler("com.apple.distnoted.matching", (dispatch_queue_t)&_dispatch_main_q, handler);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10001B1BC;
  v24[3] = &unk_10002C788;
  id v3 = v2;
  v24[4] = v3;
  xpc_set_event_stream_handler("com.apple.iokit.matching", (dispatch_queue_t)&_dispatch_main_q, v24);

  +[_ANEStrings cacheDeleteServiceName];
  uint64_t v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  id v21 = sub_10001B294;
  __int16 v22 = &unk_10002C9D8;
  id v23 = v3;
  __int16 v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  int v16 = sub_10001B2C8;
  id v17 = &unk_10002C9D8;
  id v18 = v23;
  uint64_t v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  int v11 = sub_10001B300;
  id v12 = &unk_10002C9D8;
  id v4 = v18;
  id v13 = v4;
  int v5 = CacheDeleteRegisterInfoCallbacks();
  uint64_t v6 = +[_ANELog daemon];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8[0] = 67109120;
    v8[1] = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "CacheDeleteRegisterInfoCallbacks() returned %d", (uint8_t *)v8, 8u);
  }

  signal(15, (void (__cdecl *)(int))1);
  uint64_t v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);

  dispatch_source_set_event_handler(v7, &stru_10002CA18);
  dispatch_resume(v7);
  [v4 start];
  dispatch_main();
}

void sub_10001B01C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)os_transaction_create();
  string = xpc_dictionary_get_string(v3, _xpc_event_key_name);
  if (string)
  {
    uint64_t v6 = string;
    uint64_t v7 = xpc_dictionary_get_value(v3, "UserInfo");
    id v8 = v7;
    if (v7)
    {
      if (xpc_get_type(v7) == (xpc_type_t)&_xpc_type_dictionary)
      {
        uint64_t v9 = _CFXPCCreateCFObjectFromXPCObject();
        if (v9)
        {
          uint64_t v31 = *(void **)(a1 + 32);
          long long v32 = +[NSString stringWithUTF8String:v6];
          [v31 handleLaunchServicesEvent:v32 userInfo:v9];
        }
        else
        {
          long long v33 = +[_ANELog daemon];
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
            sub_10001DA18(v33, v34, v35, v36, v37, v38, v39, v40);
          }
        }
      }
      else
      {
        uint64_t v9 = +[_ANELog daemon];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_10001DA90(v9, v10, v11, v12, v13, v14, v15, v16);
        }
      }
    }
    else
    {
      uint64_t v9 = +[_ANELog daemon];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10001D9A0(v9, v24, v25, v26, v27, v28, v29, v30);
      }
    }
  }
  else
  {
    id v8 = +[_ANELog daemon];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10001D928(v8, v17, v18, v19, v20, v21, v22, v23);
    }
  }
}

void sub_10001B1BC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)os_transaction_create();
  string = xpc_dictionary_get_string(v3, _xpc_event_key_name);
  if (string)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    id v8 = +[NSString stringWithUTF8String:string];
    [v7 handleIOKitEvent:v8];
  }
  else
  {
    uint64_t v9 = +[_ANELog daemon];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_10001DB08(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
}

uint64_t sub_10001B294(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_claimAutoreleasedReturnValue();
}

uint64_t sub_10001B2C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_claimAutoreleasedReturnValue();
}

uint64_t sub_10001B300(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_claimAutoreleasedReturnValue();
}

void sub_10001B334(id a1)
{
  uint64_t v1 = +[_ANELog daemon];
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Got SIGTERM; Exiting...", v2, 2u);
  }

  exit(0);
}

void sub_10001B39C()
{
  sub_100001F9C();
  uint64_t v1 = NSStringFromSelector(v0);
  sub_100001F64();
  sub_100001F7C((void *)&_mh_execute_header, v2, v3, "%@: client(%d) : SecTaskCreateWithAuditToken() failed", v4, v5, v6, v7, v8);
}

void sub_10001B428()
{
  sub_100001F9C();
  uint64_t v1 = NSStringFromSelector(v0);
  sub_100001F64();
  sub_100001F7C((void *)&_mh_execute_header, v2, v3, "%@: client(%d) : missing signingIdentifier", v4, v5, v6, v7, v8);
}

void sub_10001B4B4()
{
  sub_100001F9C();
  uint64_t v1 = NSStringFromSelector(v0);
  sub_100001F64();
  sub_100001F7C((void *)&_mh_execute_header, v2, v3, "%@: client(%d) : missing teamIdentity", v4, v5, v6, v7, v8);
}

void sub_10001B540(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%@: connStr=%@", buf, 0x16u);
}

void sub_10001B5A8()
{
  sub_100008098();
  sub_100008024(v1, 5.778e-34, v2, v3);
  sub_100007FEC((void *)&_mh_execute_header, "%@: Destroying the program=%p", v4, v5);
}

void sub_10001B5EC()
{
  sub_100007FB8();
  sub_10000808C(v1, v2, 5.7779e-34);
  sub_100008008((void *)&_mh_execute_header, v3, v4, "%@: ANE device not open", v5);
}

void sub_10001B630()
{
  sub_100007FA8();
  *(_DWORD *)uint64_t v1 = 138412802;
  *(void *)(v1 + 4) = v2;
  *(_WORD *)(v1 + 12) = 2048;
  *(void *)(v1 + 14) = v3;
  *(_WORD *)(v1 + 22) = 2048;
  *(void *)(v1 + 24) = 1024;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%@: filePath length(%lu) is longer than or equal to PATH_MAX (%lu)", v4, 0x20u);
}

void sub_10001B69C()
{
  sub_100007FA8();
  sub_10000803C(v1, v2, v3, 5.778e-34);
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%@: ANEProgramCreate() failed ret=0x%x", v4, 0x12u);
}

void sub_10001B6EC()
{
  sub_100007FB8();
  sub_10000808C(v1, v2, 5.7779e-34);
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%@: Intermediate buffer size is 0 !!!", v4, 0xCu);
}

void sub_10001B73C()
{
  sub_100007FA8();
  sub_100007FC4(v1, v2, v3, 5.7781e-34);
  sub_100008054((void *)&_mh_execute_header, "%@: ANEProgramCreate() cacheURLIdentifier size %lu is larger than buffer size, will be truncated to %d", v4, v5);
}

void sub_10001B780()
{
  sub_100007FA8();
  sub_100007FC4(v1, v2, v3, 5.7781e-34);
  sub_100008054((void *)&_mh_execute_header, "%@: aotCacheUrlIdentifier size %lu is larger than buffer size, will be truncated to %d", v4, v5);
}

void sub_10001B7C4()
{
  sub_100007FA8();
  *(_DWORD *)uint64_t v1 = 138412802;
  *(void *)(v1 + 4) = v2;
  *(_WORD *)(v1 + 12) = 2048;
  *(void *)(v1 + 14) = v3;
  *(_WORD *)(v1 + 22) = 1024;
  *(_DWORD *)(v1 + 24) = 255;
  sub_100008054((void *)&_mh_execute_header, "%@: ANEProgramCreate() modelIdentityStr size %lu is larger than buffer size, will be truncated to %d", v4, v5);
}

void sub_10001B828()
{
  sub_100008098();
  sub_100008080(v1, 5.778e-34, v2, v3);
  *(_WORD *)(v4 + 12) = 2112;
  *(void *)(v4 + 14) = v5;
  _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%@: consumeSandboxExtension error=%@", v6, 0x16u);
}

void sub_10001B88C(void *a1, void *a2, uint64_t a3)
{
  sub_100008080((uint64_t)a1, 5.778e-34, (uint64_t)a2, a3);
  *(_WORD *)(v5 + 12) = 2112;
  *(void *)(v5 + 14) = v6;
  sub_100007FEC((void *)&_mh_execute_header, "%@:instanceName:%@", v7, v8);
}

void sub_10001B8EC()
{
  sub_100008070();
  sub_100008080(v1, 5.778e-34, v2, v3);
  *(_WORD *)(v4 + 12) = 2048;
  *(void *)(v4 + 14) = v5;
  sub_100007FEC((void *)&_mh_execute_header, "%@:programInstance:%p", v6, v7);
}

void sub_10001B93C()
{
  sub_100007FA8();
  sub_10000803C(v1, v2, v3, 5.778e-34);
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%@: Could not destroy ANE program ret=0x%x", v4, 0x12u);
}

void sub_10001B98C()
{
  sub_100008070();
  sub_100008024(v1, 5.778e-34, v2, v3);
  sub_100007FEC((void *)&_mh_execute_header, "%@: procedures=%p", v4, v5);
}

void sub_10001B9D4()
{
  sub_100008070();
  sub_100008080(v1, 5.7785e-34, v2, v3);
  *(_WORD *)(v4 + 12) = 2048;
  *(void *)(v4 + 14) = v5;
  *(_WORD *)(v4 + 22) = 1024;
  *(_DWORD *)(v4 + 24) = v6;
  *(_WORD *)(v4 + 28) = 1024;
  *(_DWORD *)(v4 + 30) = v7;
  *(_WORD *)(v4 + 34) = 1024;
  *(_DWORD *)(v4 + 36) = v8;
  *(_WORD *)(v4 + 40) = 1024;
  *(_DWORD *)(v4 + 42) = v9;
  _os_log_debug_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "%@: intermediateBufferSize=%zu : numInputs=%d : numOutputs=%d : numProcedures=%d queueDepth=%d", v10, 0x2Eu);
}

void sub_10001BA68()
{
  sub_100007FB8();
  sub_10000808C(v1, v2, 5.7779e-34);
  sub_100008008((void *)&_mh_execute_header, v3, v4, "%@: ANEProgramChainingPrepare() Failed", v5);
}

void sub_10001BAAC(void *a1, void *a2, NSObject *a3)
{
  unsigned int v5 = [a1 processIdentifier];
  int v6 = [a2 entitlementString];
  v7[0] = 67109378;
  v7[1] = v5;
  __int16 v8 = 2112;
  int v9 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Rejecting XPC connection requests from client(%d) : missing entitlement(%@)", (uint8_t *)v7, 0x12u);
}

void sub_10001BB6C(uint64_t a1, void *a2)
{
  os_log_t v4 = NSStringFromSelector(*(SEL *)(a1 + 48));
  unsigned int v5 = [*(id *)(a1 + 32) serviceName];
  [a2 processIdentifier];
  sub_10000A374();
  sub_10000A3A0((void *)&_mh_execute_header, v6, v7, "%@: interruptHandler : %@ : %d : %@", v8, v9, v10, v11, v12);
}

void sub_10001BC20(uint64_t a1, void *a2)
{
  os_log_t v4 = NSStringFromSelector(*(SEL *)(a1 + 48));
  unsigned int v5 = [*(id *)(a1 + 32) serviceName];
  [a2 processIdentifier];
  sub_10000A374();
  sub_10000A3A0((void *)&_mh_execute_header, v6, v7, "%@: invalidationHandler : %@ : %d : %@", v8, v9, v10, v11, v12);
}

void sub_10001BCD4(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%@: +updateAccessTimeForFilePath:%@ failed", buf, 0x16u);
}

void sub_10001BD3C(void *a1, const char *a2)
{
  int v3 = a1;
  os_log_t v4 = NSStringFromSelector(a2);
  sub_10000DF40();
  sub_10000DF28((void *)&_mh_execute_header, v3, v5, "%@: modelFilePath=%@", v6);
}

void sub_10001BDE8(void *a1, const char *a2)
{
  int v3 = a1;
  os_log_t v4 = NSStringFromSelector(a2);
  sub_10000DF40();
  sub_10000DF28((void *)&_mh_execute_header, v3, v5, "%@: weightFilePath=%@", v6);
}

void sub_10001BE94(void *a1, const char *a2)
{
  int v3 = a1;
  os_log_t v4 = NSStringFromSelector(a2);
  int v5 = 138412290;
  uint64_t v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%@: +setAccessTime:forFilePath failed", (uint8_t *)&v5, 0xCu);
}

void sub_10001BF3C(void *a1, const char *a2)
{
  int v3 = a1;
  os_log_t v4 = NSStringFromSelector(a2);
  sub_10000DF58();
  sub_10000DF28((void *)&_mh_execute_header, v3, v5, "%@: Skipping update for filePath=%@", v6);
}

void sub_10001BFE4(void *a1, const char *a2)
{
  int v3 = a1;
  os_log_t v4 = NSStringFromSelector(a2);
  sub_10000DF58();
  sub_10000DF28((void *)&_mh_execute_header, v3, v5, "%@: filePath=%@", v6);
}

void sub_10001C08C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to remove %@ : error=%@", (uint8_t *)&v3, 0x16u);
}

void sub_10001C114(uint64_t a1, void *a2)
{
  int v3 = a2;
  int v4 = *__error();
  int v5 = 136315394;
  uint64_t v6 = a1;
  __int16 v7 = 1024;
  int v8 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Fail to open %s %{darwin.errno}d", (uint8_t *)&v5, 0x12u);
}

void sub_10001C1BC(uint64_t a1, uint64_t *a2, NSObject *a3)
{
  uint64_t v3 = *a2;
  int v4 = 136315394;
  uint64_t v5 = a1;
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  sub_10000DF28((void *)&_mh_execute_header, a3, (uint64_t)a3, "Mark %s as purgeable (flags 0x%llx)", (uint8_t *)&v4);
}

void sub_10001C240(void *a1, const char *a2)
{
  uint64_t v3 = a1;
  int v4 = NSStringFromSelector(a2);
  int v5 = 138412290;
  __int16 v6 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%@: nil currentConnection", (uint8_t *)&v5, 0xCu);
}

void sub_10001C2EC(void *a1, const char *a2, uint64_t a3)
{
  int v5 = a1;
  __int16 v6 = NSStringFromSelector(a2);
  sub_100010508();
  uint64_t v8 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%@: FAILED creating %@", v7, 0x16u);
}

void sub_10001C3A0(void *a1, const char *a2)
{
  uint64_t v3 = a1;
  int v4 = NSStringFromSelector(a2);
  sub_100010508();
  CFStringRef v6 = @"com.apple.private.ANEStorageMaintainer";
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%@: Could not create connection to %@", v5, 0x16u);
}

void sub_10001C450(uint64_t a1, void *a2, uint64_t a3)
{
  int v5 = *(const char **)(a1 + 40);
  CFStringRef v6 = a2;
  uint64_t v7 = NSStringFromSelector(v5);
  uint64_t v8 = *(void *)(a1 + 32);
  int v9 = 138412802;
  uint64_t v10 = v7;
  __int16 v11 = 2112;
  uint64_t v12 = v8;
  __int16 v13 = 2112;
  uint64_t v14 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%@: Could not create connection to %@ : error=%@", (uint8_t *)&v9, 0x20u);
}

void sub_10001C520()
{
  int v2 = 136315650;
  sub_10001AC5C();
  sub_10001ACA4((void *)&_mh_execute_header, v0, v1, "%s: cloneDirectory=%@ FAILED : err=%@", v2);
}

void sub_10001C594()
{
  int v2 = 136315650;
  sub_10001AC5C();
  sub_10001ACA4((void *)&_mh_execute_header, v0, v1, "%s: tempDirectory=%@ FAILED : err=%@", v2);
}

void sub_10001C608()
{
  int v2 = 136315650;
  sub_10001AC5C();
  sub_10001ACA4((void *)&_mh_execute_header, v0, v1, "%s: inMemoryModelCacheDirectory=%@ FAILED : err=%@", v2);
}

void sub_10001C67C()
{
  int v2 = 136315650;
  sub_10001AC5C();
  sub_10001ACA4((void *)&_mh_execute_header, v0, v1, "%s: modelAssetsCacheDirectory=%@ FAILED : err=%@", v2);
}

void sub_10001C6F0()
{
  int v2 = 136315650;
  sub_10001AC5C();
  sub_10001ACA4((void *)&_mh_execute_header, v0, v1, "%s: buildSpecificModelStorageDirectory=%@ FAILED : err=%@", v2);
}

void sub_10001C764(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3 = 136315394;
  int v4 = "convertToDataVaultAsNeeded";
  __int16 v5 = 2080;
  uint64_t v6 = a1;
  sub_10000DF28((void *)&_mh_execute_header, a2, a3, "%s: cacheDirectory=%s EXISTS", (uint8_t *)&v3);
}

void sub_10001C7E8()
{
  int v2 = 136315650;
  sub_10001AC5C();
  sub_10001ACA4((void *)&_mh_execute_header, v0, v1, "%s: pathToDataVault=%@ FAILED : err=%@", v2);
}

void sub_10001C85C()
{
  sub_100007FB8();
  sub_10001AC78(v1, v2, 5.778e-34);
  *(void *)(v3 + 14) = @"com.apple.aned.danglingModelsGC";
  sub_10000DF28((void *)&_mh_execute_header, v4, (uint64_t)v4, "%@: Registering danglingModelGCTaskName=%@", v5);
}

void sub_10001C8B0()
{
  sub_100007FB8();
  sub_10001AC78(v1, v2, 5.778e-34);
  *(void *)(v3 + 14) = @"com.apple.aned.modelCacheGC";
  sub_10000DF28((void *)&_mh_execute_header, v4, (uint64_t)v4, "%@: Registering modelCacheGCTaskName=%@", v5);
}

void sub_10001C904()
{
  sub_100007FB8();
  sub_10001AC78(v1, v2, 5.778e-34);
  *(void *)(v3 + 14) = @"com.apple.aned.temporaryFilesMaintenance";
  sub_10000DF28((void *)&_mh_execute_header, v4, (uint64_t)v4, "%@: Registering cullingTaskName=%@", v5);
}

void sub_10001C958()
{
  sub_100007FB8();
  sub_10001AC78(v1, v2, 5.778e-34);
  *(void *)(v3 + 14) = @"com.apple.aneuserd.danglingModelsGC";
  sub_10000DF28((void *)&_mh_execute_header, v4, (uint64_t)v4, "%@: Registering danglingModelGCTaskName=%@", v5);
}

void sub_10001C9AC()
{
  sub_100007FB8();
  sub_10001AC78(v1, v2, 5.778e-34);
  *(void *)(v3 + 14) = @"com.apple.aneuserd.modelCacheGC";
  sub_10000DF28((void *)&_mh_execute_header, v4, (uint64_t)v4, "%@: Registering modelCacheGCTaskName=%@", v5);
}

void sub_10001CA00()
{
  sub_100007FB8();
  sub_10001AC78(v1, v2, 5.778e-34);
  *(void *)(v3 + 14) = @"com.apple.aneuserd.temporaryFilesMaintenance";
  sub_10000DF28((void *)&_mh_execute_header, v4, (uint64_t)v4, "%@: Registering cullingTaskName=%@", v5);
}

void sub_10001CA54()
{
  sub_100008070();
  sub_10001AC28(v1, v2, v3, 5.778e-34);
  sub_10000DF28((void *)&_mh_execute_header, v6, v4, "%@: %@", v5);
}

void sub_10001CA9C()
{
  sub_100007FB8();
  sub_10000808C(v1, v2, 5.7779e-34);
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "%@: userInfo kLSNotificationBundleIDsKey is not NSArray", v4, 0xCu);
}

void sub_10001CAEC()
{
  sub_10001AD30();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "Received %@ : ANEServicesInit(0, NULL) returned %d", v2, 0x12u);
}

void sub_10001CB70()
{
  sub_10001AD30();
  sub_10001ACC4((void *)&_mh_execute_header, v0, v1, "Received %@ : Calling ANEServicesInit(0, NULL)", v2, v3, v4, v5, v6);
}

void sub_10001CBD8()
{
  sub_10001AD30();
  sub_10001ACC4((void *)&_mh_execute_header, v0, v1, "Received %@ : unsupported", v2, v3, v4, v5, v6);
}

void sub_10001CC40()
{
  sub_100008070();
  sub_10001AC28(v1, v2, v3, 5.778e-34);
  sub_10001AC40((void *)&_mh_execute_header, "%@: CacheDelete dictionary=%@", v4, v5);
}

void sub_10001CC84()
{
  sub_100007FB8();
  sub_10000808C(v1, v2, 5.7779e-34);
  sub_100008008((void *)&_mh_execute_header, v3, v4, "%@: nil currentConnection", v5);
}

void sub_10001CCC8()
{
  sub_100007FB8();
  sub_10000808C(v1, v2, 5.7779e-34);
  sub_100008008((void *)&_mh_execute_header, v3, v4, "%@: nil csIdentity", v5);
}

void sub_10001CD0C()
{
  sub_100008070();
  *(_DWORD *)uint64_t v2 = 138412546;
  *(void *)(v2 + 4) = v3;
  *(_WORD *)(v2 + 12) = 2048;
  *(void *)(v2 + 14) = v1 & 1;
  sub_10000DF28((void *)&_mh_execute_header, v5, v2, "%@: -scanAllPartitionsForModel:expunge: returned (%ld) ", v4);
}

void sub_10001CD68()
{
  sub_10001AD30();
  sub_10001ACC4((void *)&_mh_execute_header, v0, v1, "Checking All Segments at modelFilePath=%@", v2, v3, v4, v5, v6);
}

void sub_10001CDD0()
{
  sub_10001AD30();
  sub_10001ACC4((void *)&_mh_execute_header, v0, v1, "Checking modelFilePath=%@", v2, v3, v4, v5, v6);
}

void sub_10001CE38()
{
  sub_100008070();
  sub_10001AC28(v1, v2, v3, 5.778e-34);
  sub_10001AC40((void *)&_mh_execute_header, "%@: system model (%@) may not be purged", v4, v5);
}

void sub_10001CE7C()
{
  sub_100007FB8();
  sub_10000808C(v1, v2, 5.7779e-34);
  sub_100008008((void *)&_mh_execute_header, v3, v4, "%@: -scanAllPartitionsForModel:expunge: failed ", v5);
}

void sub_10001CEC0()
{
  sub_10001AD30();
  sub_10001ACC4((void *)&_mh_execute_header, v0, v1, "Removing modelFilePath=%@", v2, v3, v4, v5, v6);
}

void sub_10001CF28()
{
  sub_100008070();
  sub_10001AC28(v1, v2, v3, 5.778e-34);
  sub_10001AC40((void *)&_mh_execute_header, "%@: shared model in system folder (%@) may not be purged", v4, v5);
}

void sub_10001CF6C()
{
  sub_10001AD00();
  sub_10001AC28(v2, v3, v4, 5.778e-34);
  sub_10001AC40((void *)&_mh_execute_header, "%@: Invalid model key (%@)", v5, v6);
}

void sub_10001CFB4()
{
  sub_100007FB8();
  sub_10000803C(v1, v2, v3, 5.778e-34);
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%@: client(%d) : missing signingIdentifier", v4, 0x12u);
}

void sub_10001D008()
{
  sub_100008070();
  sub_10001AC28(v1, v2, v3, 5.778e-34);
  sub_10001AC40((void *)&_mh_execute_header, "%@: loadModel failed because inMemoryModelIdentifier is NULL: .. model=%@", v4, v5);
}

void sub_10001D04C()
{
  sub_100008070();
  sub_10001AC28(v1, v2, v3, 5.778e-34);
  sub_10001AC40((void *)&_mh_execute_header, "%@: loadModel failed because csIdentity contains: ../ model=%@", v4, v5);
}

void sub_10001D090()
{
  sub_100008070();
  sub_10001AC28(v1, v2, v3, 5.778e-34);
  sub_10001AC40((void *)&_mh_execute_header, "%@: loadModel failed because inMemoryModelIdentifier contains: .. model=%@", v4, v5);
}

void sub_10001D0D4()
{
  sub_100008070();
  sub_10001AD3C(v1, v2, v3, 5.778e-34);
  _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%@: skipPreparePhase=%d ", v4, 0x12u);
}

void sub_10001D128()
{
  sub_100008070();
  sub_10001AD3C(v1, v2, v3, 5.778e-34);
  _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%@: enableLateLatch=%d", v4, 0x12u);
}

void sub_10001D17C(void *a1)
{
  id v1 = sub_10001AD14(a1);
  sub_10001AC8C((uint64_t)v1, 5.778e-34);
  sub_10001ACE0((void *)&_mh_execute_header, v2, v3, "%@: modelIdentityStr=%@ : ");
}

void sub_10001D1D0(void *a1)
{
  id v1 = sub_10001AD14(a1);
  sub_10001AC8C((uint64_t)v1, 5.778e-34);
  sub_10001ACE0((void *)&_mh_execute_header, v2, v3, "%@:  programForConnection: %@");
}

void sub_10001D224(void *a1)
{
  id v1 = sub_10001AD14(a1);
  sub_10001AC8C((uint64_t)v1, 5.778e-34);
  sub_10001ACE0((void *)&_mh_execute_header, v2, v3, "%@: consumeSandboxExtension error=%@");
}

void sub_10001D278(void *a1)
{
  id v1 = sub_10001AD14(a1);
  sub_10001AC8C((uint64_t)v1, 5.778e-34);
  sub_10001ACE0((void *)&_mh_execute_header, v2, v3, "%@: cacheURLIdentifier generated for PreCompiledModel:%@");
}

void sub_10001D2CC(void *a1)
{
  id v3 = sub_10001AD14(a1);
  sub_10001AC8C((uint64_t)v3, 5.7781e-34);
  *(_WORD *)(v2 + 22) = 1024;
  *(_DWORD *)(v2 + 24) = 1;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "%@: Loading in-memory model modelFilePath=%@ : existsInCache=%d", (uint8_t *)v2, 0x1Cu);
}

void sub_10001D340()
{
  sub_10001AD30();
  sub_10001AD58((void *)&_mh_execute_header, v0, v1, "No model pathName? %@", v2, v3, v4, v5, v6);
}

void sub_10001D3A8()
{
  sub_100007FB8();
  sub_10001AC78(v1, v2, 5.778e-34);
  *(void *)(v3 + 14) = 0;
  _os_log_error_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%@: modelIdentifier(%@) : missing base model identifier", v5, 0x16u);
}

void sub_10001D3FC()
{
  sub_100008070();
  sub_10001AC28(v1, v2, v3, 5.778e-34);
  sub_10000DF28((void *)&_mh_execute_header, v6, v4, "%@:  programForConnection: %@", v5);
}

void sub_10001D444()
{
  sub_100007FB8();
  sub_10000808C(v1, v2, 5.778e-34);
  *(_WORD *)(v3 + 12) = 2048;
  *(void *)(v3 + 14) = v4;
  sub_10000DF28((void *)&_mh_execute_header, v6, v4, "%@:  intermediateBufferHandle shared: 0x%llu", v5);
}

void sub_10001D49C()
{
  sub_10001AD00();
  sub_10001AC28(v2, v3, v4, 5.778e-34);
  sub_10000DF28((void *)&_mh_execute_header, v7, v5, "%@: Internal Build with boot-arg: %@ set to true. Skipping entitlement check", v6);
}

void sub_10001D4E8()
{
  sub_100007FB8();
  sub_10000808C(v1, v2, 5.7779e-34);
  sub_100008008((void *)&_mh_execute_header, v3, v4, "%@: nil _ANEModel", v5);
}

void sub_10001D52C()
{
  sub_100008070();
  sub_10001AC28(v1, v2, v3, 5.778e-34);
  sub_10001AC40((void *)&_mh_execute_header, "%@: timed out (%@)", v4, v5);
}

void sub_10001D570()
{
  sub_100008070();
  sub_10001AC28(v1, v2, v3, 5.778e-34);
  sub_10000DF28((void *)&_mh_execute_header, v6, v4, "%@: Checking modelFilePath=%@", v5);
}

void sub_10001D5B8()
{
  sub_100008070();
  sub_10001AC28(v1, v2, v3, 5.778e-34);
  sub_10000DF28((void *)&_mh_execute_header, v6, v4, "%@: Removing modelFilePath=%@", v5);
}

void sub_10001D600()
{
  sub_100008070();
  sub_10001AC28(v1, v2, v3, 5.778e-34);
  sub_10001AC40((void *)&_mh_execute_header, "%@: Compilation failed because csIdentity contains: ../ model=%@", v4, v5);
}

void sub_10001D644()
{
  sub_100008070();
  sub_10001AC28(v1, v2, v3, 5.778e-34);
  sub_10001AC40((void *)&_mh_execute_header, "%@: cachedModelFilePath=%@ does not exist", v4, v5);
}

void sub_10001D688()
{
  sub_10001AD30();
  sub_10001ACC4((void *)&_mh_execute_header, v0, v1, "Loading modelFilePath=%@", v2, v3, v4, v5, v6);
}

void sub_10001D6F0()
{
  sub_100008070();
  sub_10001AC28(v1, v2, v3, 5.778e-34);
  sub_10001AC40((void *)&_mh_execute_header, "%@: Compilation failed because inMemoryModelIdentifier contains: .. model=%@", v4, v5);
}

void sub_10001D734()
{
  sub_100008070();
  sub_10001AC28(v1, v2, v3, 5.778e-34);
  sub_10001AC40((void *)&_mh_execute_header, "%@: CompileModel failed because csIdentity contains: ../ model=%@", v4, v5);
}

void sub_10001D778()
{
  sub_100008070();
  sub_10001AC28(v1, v2, v3, 5.778e-34);
  sub_10001AC40((void *)&_mh_execute_header, "%@: CompileModel failed because inMemoryModelIdentifier contains: .. model=%@", v4, v5);
}

void sub_10001D7BC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001D834(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not create connection to %@ : error=%@", (uint8_t *)&v4, 0x16u);
}

void sub_10001D8C0()
{
  sub_10001AD30();
  sub_10001AD58((void *)&_mh_execute_header, v0, v1, "Compilation failed: error=%@", v2, v3, v4, v5, v6);
}

void sub_10001D928(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001D9A0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001DA18(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001DA90(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001DB08(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t ANECCreateModelDictionary()
{
  return _ANECCreateModelDictionary();
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t CacheDeleteRegisterInfoCallbacks()
{
  return _CacheDeleteRegisterInfoCallbacks();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return _SecTaskCopySigningIdentifier(task, error);
}

uint64_t SecTaskCopyTeamIdentifier()
{
  return _SecTaskCopyTeamIdentifier();
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

uint64_t _ANEDaemonInterface()
{
  return __ANEDaemonInterface();
}

uint64_t _ANEDaemonInterfacePrivate()
{
  return __ANEDaemonInterfacePrivate();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return __CFXPCCreateCFObjectFromXPCObject();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
}

void operator delete()
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

int *__error(void)
{
  return ___error();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void bzero(void *a1, size_t a2)
{
}

int chmod(const char *a1, mode_t a2)
{
  return _chmod(a1, a2);
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
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

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void exit(int a1)
{
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return _ffsctl(a1, a2, a3, a4);
}

int fstat(int a1, stat *a2)
{
  return _fstat(a1, a2);
}

pid_t getpid(void)
{
  return _getpid();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return _getxattr(path, name, value, size, position, options);
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return _mmap(a1, a2, a3, a4, a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return _munmap(a1, a2);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
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
  return [super a2];
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

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_unfair_lock_lock_with_options()
{
  return _os_unfair_lock_lock_with_options();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t proc_set_cpumon_defaults()
{
  return _proc_set_cpumon_defaults();
}

uint64_t proc_set_cpumon_params()
{
  return _proc_set_cpumon_params();
}

uint64_t rootless_check_datavault_flag()
{
  return _rootless_check_datavault_flag();
}

uint64_t rootless_convert_to_datavault()
{
  return _rootless_convert_to_datavault();
}

uint64_t rootless_mkdir_datavault()
{
  return _rootless_mkdir_datavault();
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return _setxattr(path, name, value, size, position, options);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return _strlcpy(__dst, __source, __size);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return _strncpy(__dst, __src, __n);
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return _xpc_activity_copy_criteria(activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return _xpc_activity_set_state(activity, state);
}

void xpc_activity_unregister(const char *identifier)
{
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return _xpc_BOOL_create(value);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return _xpc_dictionary_create(keys, values, count);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

BOOL xpc_equal(xpc_object_t object1, xpc_object_t object2)
{
  return _xpc_equal(object1, object2);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return _xpc_int64_create(value);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

xpc_object_t xpc_string_create(const char *string)
{
  return _xpc_string_create(string);
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 URLByDeletingLastPathComponent];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_adapterWeightsAccessEntitlement(void *a1, const char *a2, ...)
{
  return [a1 adapterWeightsAccessEntitlement];
}

id objc_msgSend_adapterWeightsAccessEntitlementBypassBootArg(void *a1, const char *a2, ...)
{
  return [a1 adapterWeightsAccessEntitlementBypassBootArg];
}

id objc_msgSend_addCachedReference(void *a1, const char *a2, ...)
{
  return [a1 addCachedReference];
}

id objc_msgSend_aggressivePowerSavingEntitlement(void *a1, const char *a2, ...)
{
  return [a1 aggressivePowerSavingEntitlement];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_aneRealTimeTaskQoS(void *a1, const char *a2, ...)
{
  return [a1 aneRealTimeTaskQoS];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_buildVersion(void *a1, const char *a2, ...)
{
  return [a1 buildVersion];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return [a1 bundleID];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cacheDeleteServiceName(void *a1, const char *a2, ...)
{
  return [a1 cacheDeleteServiceName];
}

id objc_msgSend_cacheDir(void *a1, const char *a2, ...)
{
  return [a1 cacheDir];
}

id objc_msgSend_cacheURLIdentifier(void *a1, const char *a2, ...)
{
  return [a1 cacheURLIdentifier];
}

id objc_msgSend_cloneDirectory(void *a1, const char *a2, ...)
{
  return [a1 cloneDirectory];
}

id objc_msgSend_common(void *a1, const char *a2, ...)
{
  return [a1 common];
}

id objc_msgSend_controller(void *a1, const char *a2, ...)
{
  return [a1 controller];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createModelCacheDictionary(void *a1, const char *a2, ...)
{
  return [a1 createModelCacheDictionary];
}

id objc_msgSend_createSymbolMapping(void *a1, const char *a2, ...)
{
  return [a1 createSymbolMapping];
}

id objc_msgSend_csIdentity(void *a1, const char *a2, ...)
{
  return [a1 csIdentity];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_daemon(void *a1, const char *a2, ...)
{
  return [a1 daemon];
}

id objc_msgSend_dataVaultStorageClass(void *a1, const char *a2, ...)
{
  return [a1 dataVaultStorageClass];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_entitlementString(void *a1, const char *a2, ...)
{
  return [a1 entitlementString];
}

id objc_msgSend_eventType(void *a1, const char *a2, ...)
{
  return [a1 eventType];
}

id objc_msgSend_executionCriteria(void *a1, const char *a2, ...)
{
  return [a1 executionCriteria];
}

id objc_msgSend_fileCreationDate(void *a1, const char *a2, ...)
{
  return [a1 fileCreationDate];
}

id objc_msgSend_fileSize(void *a1, const char *a2, ...)
{
  return [a1 fileSize];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_fwEnqueueDelay(void *a1, const char *a2, ...)
{
  return [a1 fwEnqueueDelay];
}

id objc_msgSend_getCacheURLIdentifier(void *a1, const char *a2, ...)
{
  return [a1 getCacheURLIdentifier];
}

id objc_msgSend_handler(void *a1, const char *a2, ...)
{
  return [a1 handler];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_identifierSource(void *a1, const char *a2, ...)
{
  return [a1 identifierSource];
}

id objc_msgSend_inMemoryModelCacheName(void *a1, const char *a2, ...)
{
  return [a1 inMemoryModelCacheName];
}

id objc_msgSend_inputBuffer(void *a1, const char *a2, ...)
{
  return [a1 inputBuffer];
}

id objc_msgSend_instanceName(void *a1, const char *a2, ...)
{
  return [a1 instanceName];
}

id objc_msgSend_interface(void *a1, const char *a2, ...)
{
  return [a1 interface];
}

id objc_msgSend_intermediateBufferHandle(void *a1, const char *a2, ...)
{
  return [a1 intermediateBufferHandle];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_ioSurface(void *a1, const char *a2, ...)
{
  return [a1 ioSurface];
}

id objc_msgSend_ioSurfaceObject(void *a1, const char *a2, ...)
{
  return [a1 ioSurfaceObject];
}

id objc_msgSend_isExcessivePowerDrainWhenIdle(void *a1, const char *a2, ...)
{
  return [a1 isExcessivePowerDrainWhenIdle];
}

id objc_msgSend_isInternalBuild(void *a1, const char *a2, ...)
{
  return [a1 isInternalBuild];
}

id objc_msgSend_isNewInstance(void *a1, const char *a2, ...)
{
  return [a1 isNewInstance];
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return [a1 key];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_launchIOKitEvent(void *a1, const char *a2, ...)
{
  return [a1 launchIOKitEvent];
}

id objc_msgSend_launchUserIOKitEvent(void *a1, const char *a2, ...)
{
  return [a1 launchUserIOKitEvent];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_loopbackInputSymbolIndex(void *a1, const char *a2, ...)
{
  return [a1 loopbackInputSymbolIndex];
}

id objc_msgSend_loopbackOutputSymbolIndex(void *a1, const char *a2, ...)
{
  return [a1 loopbackOutputSymbolIndex];
}

id objc_msgSend_machServiceName(void *a1, const char *a2, ...)
{
  return [a1 machServiceName];
}

id objc_msgSend_machServiceNamePrivate(void *a1, const char *a2, ...)
{
  return [a1 machServiceNamePrivate];
}

id objc_msgSend_modelAssetCacheManager(void *a1, const char *a2, ...)
{
  return [a1 modelAssetCacheManager];
}

id objc_msgSend_modelAssetsCacheName(void *a1, const char *a2, ...)
{
  return [a1 modelAssetsCacheName];
}

id objc_msgSend_modelAttributes(void *a1, const char *a2, ...)
{
  return [a1 modelAttributes];
}

id objc_msgSend_modelBinaryName(void *a1, const char *a2, ...)
{
  return [a1 modelBinaryName];
}

id objc_msgSend_modelCacheManager(void *a1, const char *a2, ...)
{
  return [a1 modelCacheManager];
}

id objc_msgSend_modelCacheRetainName(void *a1, const char *a2, ...)
{
  return [a1 modelCacheRetainName];
}

id objc_msgSend_modelDataVaultDirectory(void *a1, const char *a2, ...)
{
  return [a1 modelDataVaultDirectory];
}

id objc_msgSend_modelIdentifier(void *a1, const char *a2, ...)
{
  return [a1 modelIdentifier];
}

id objc_msgSend_modelKey(void *a1, const char *a2, ...)
{
  return [a1 modelKey];
}

id objc_msgSend_modelPath(void *a1, const char *a2, ...)
{
  return [a1 modelPath];
}

id objc_msgSend_modelPerfStatsMask(void *a1, const char *a2, ...)
{
  return [a1 modelPerfStatsMask];
}

id objc_msgSend_modelPurgeInAllPartitionsEntitlement(void *a1, const char *a2, ...)
{
  return [a1 modelPurgeInAllPartitionsEntitlement];
}

id objc_msgSend_modelSourceStoreName(void *a1, const char *a2, ...)
{
  return [a1 modelSourceStoreName];
}

id objc_msgSend_modelURL(void *a1, const char *a2, ...)
{
  return [a1 modelURL];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return [a1 nextObject];
}

id objc_msgSend_notRecentlyUsedSecondsThreshold(void *a1, const char *a2, ...)
{
  return [a1 notRecentlyUsedSecondsThreshold];
}

id objc_msgSend_numInputs(void *a1, const char *a2, ...)
{
  return [a1 numInputs];
}

id objc_msgSend_numOutputs(void *a1, const char *a2, ...)
{
  return [a1 numOutputs];
}

id objc_msgSend_outputBuffer(void *a1, const char *a2, ...)
{
  return [a1 outputBuffer];
}

id objc_msgSend_outputSets(void *a1, const char *a2, ...)
{
  return [a1 outputSets];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return [a1 pathComponents];
}

id objc_msgSend_perfStatsMask(void *a1, const char *a2, ...)
{
  return [a1 perfStatsMask];
}

id objc_msgSend_procedureArray(void *a1, const char *a2, ...)
{
  return [a1 procedureArray];
}

id objc_msgSend_procedureIndex(void *a1, const char *a2, ...)
{
  return [a1 procedureIndex];
}

id objc_msgSend_procedureSymbol(void *a1, const char *a2, ...)
{
  return [a1 procedureSymbol];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_processModelShareAccessEntitlement(void *a1, const char *a2, ...)
{
  return [a1 processModelShareAccessEntitlement];
}

id objc_msgSend_programHandle(void *a1, const char *a2, ...)
{
  return [a1 programHandle];
}

id objc_msgSend_programInstance(void *a1, const char *a2, ...)
{
  return [a1 programInstance];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_queueDepth(void *a1, const char *a2, ...)
{
  return [a1 queueDepth];
}

id objc_msgSend_refcount(void *a1, const char *a2, ...)
{
  return [a1 refcount];
}

id objc_msgSend_removeCachedReference(void *a1, const char *a2, ...)
{
  return [a1 removeCachedReference];
}

id objc_msgSend_removeStaleModels(void *a1, const char *a2, ...)
{
  return [a1 removeStaleModels];
}

id objc_msgSend_requiresEntitlement(void *a1, const char *a2, ...)
{
  return [a1 requiresEntitlement];
}

id objc_msgSend_restrictedAccessEntitlement(void *a1, const char *a2, ...)
{
  return [a1 restrictedAccessEntitlement];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_sandboxExtension(void *a1, const char *a2, ...)
{
  return [a1 sandboxExtension];
}

id objc_msgSend_secondaryANECompilerServiceAccessEntitlement(void *a1, const char *a2, ...)
{
  return [a1 secondaryANECompilerServiceAccessEntitlement];
}

id objc_msgSend_semaArray(void *a1, const char *a2, ...)
{
  return [a1 semaArray];
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return [a1 server];
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return [a1 serviceName];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedEvent(void *a1, const char *a2, ...)
{
  return [a1 sharedEvent];
}

id objc_msgSend_sharedPrivilegedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedPrivilegedConnection];
}

id objc_msgSend_signalEvents(void *a1, const char *a2, ...)
{
  return [a1 signalEvents];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return [a1 source];
}

id objc_msgSend_sourceURL(void *a1, const char *a2, ...)
{
  return [a1 sourceURL];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startDanglingModelGC(void *a1, const char *a2, ...)
{
  return [a1 startDanglingModelGC];
}

id objc_msgSend_startOffset(void *a1, const char *a2, ...)
{
  return [a1 startOffset];
}

id objc_msgSend_statsSurRef(void *a1, const char *a2, ...)
{
  return [a1 statsSurRef];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 stringByDeletingLastPathComponent];
}

id objc_msgSend_symbolIndex(void *a1, const char *a2, ...)
{
  return [a1 symbolIndex];
}

id objc_msgSend_systemLibraryPath(void *a1, const char *a2, ...)
{
  return [a1 systemLibraryPath];
}

id objc_msgSend_systemModelsCacheDirectory(void *a1, const char *a2, ...)
{
  return [a1 systemModelsCacheDirectory];
}

id objc_msgSend_teamIdentity(void *a1, const char *a2, ...)
{
  return [a1 teamIdentity];
}

id objc_msgSend_tempDirectory(void *a1, const char *a2, ...)
{
  return [a1 tempDirectory];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_txn(void *a1, const char *a2, ...)
{
  return [a1 txn];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedLongLongValue];
}

id objc_msgSend_userCloneDirectory(void *a1, const char *a2, ...)
{
  return [a1 userCloneDirectory];
}

id objc_msgSend_userMachServiceName(void *a1, const char *a2, ...)
{
  return [a1 userMachServiceName];
}

id objc_msgSend_userModelDataVaultDirectory(void *a1, const char *a2, ...)
{
  return [a1 userModelDataVaultDirectory];
}

id objc_msgSend_userTempDirectory(void *a1, const char *a2, ...)
{
  return [a1 userTempDirectory];
}

id objc_msgSend_validate(void *a1, const char *a2, ...)
{
  return [a1 validate];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_weightArray(void *a1, const char *a2, ...)
{
  return [a1 weightArray];
}

id objc_msgSend_weightSymbol(void *a1, const char *a2, ...)
{
  return [a1 weightSymbol];
}

id objc_msgSend_weightURL(void *a1, const char *a2, ...)
{
  return [a1 weightURL];
}

id objc_msgSend_wiredMemory(void *a1, const char *a2, ...)
{
  return [a1 wiredMemory];
}

id objc_msgSend_writeToFile_atomically_encoding_error_(void *a1, const char *a2, ...)
{
  return [a1 writeToFile:x0 atomically:x1 encoding:x2 error:x3];
}