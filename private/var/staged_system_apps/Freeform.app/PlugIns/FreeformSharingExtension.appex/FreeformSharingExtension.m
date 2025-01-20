id CRLAppGroupIdentifier()
{
  void *v0;
  uint64_t vars8;

  if (qword_10007DB18 != -1) {
    dispatch_once(&qword_10007DB18, &stru_100071698);
  }
  v0 = (void *)qword_10007DB10;

  return v0;
}

void sub_100004F70(id a1)
{
  uint64_t v1 = +[NSString stringWithUTF8String:"group.com.apple.freeform"];
  v2 = (void *)qword_10007DB10;
  qword_10007DB10 = v1;

  if (([(id)qword_10007DB10 hasPrefix:@"group.com.apple."] & 1) == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (CRLAssertCat_init_token != -1) {
      dispatch_once(&CRLAssertCat_init_token, &stru_1000716B8);
    }
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10005AD8C();
    }
    if (CRLAssertCat_init_token != -1) {
      dispatch_once(&CRLAssertCat_init_token, &stru_1000716D8);
    }
    v3 = CRLAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10005ACE8(v3);
    }
    uint64_t v13 = qword_10007DB10;
    CRLSetCrashReporterInfo((uint64_t)"Fatal Assertion failure: %{public}s %{public}s:%d App group identifier (%@) has unexpected prefix.", v4, v5, v6, v7, v8, v9, v10, (uint64_t)"NSString *CRLAppGroupIdentifier()_block_invoke");
    v11 = +[NSString stringWithUTF8String:"NSString *CRLAppGroupIdentifier()_block_invoke"];
    v12 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBundleUtilities.m"];
    +[CRLAssertionHandler handleFailureInFunction:v11, v12, 51, 1, "App group identifier (%@) has unexpected prefix.", qword_10007DB10, "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBundleUtilities.m", 51, v13 file lineNumber isFatal description];

    CRLCrashBreakpoint();
    abort();
  }
}

void sub_100005120(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_100005164(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_1000051E8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_1000055A0(id a1)
{
  size_t size = 0;
  sysctlbyname("kern.osversion", 0, &size, 0, 0);
  uint64_t v1 = malloc_type_malloc(size, 0xACBDD60AuLL);
  sysctlbyname("kern.osversion", v1, &size, 0, 0);
  id v2 = [objc_alloc((Class)NSString) initWithUTF8String:v1];
  v3 = (void *)qword_10007DB20;
  qword_10007DB20 = (uint64_t)v2;

  free(v1);
}

void sub_100005694(id a1)
{
  size_t size = 0;
  sysctlbyname("hw.model", 0, &size, 0, 0);
  uint64_t v1 = malloc_type_malloc(size, 0x3B240CF6uLL);
  sysctlbyname("hw.model", v1, &size, 0, 0);
  id v2 = [objc_alloc((Class)NSString) initWithUTF8String:v1];
  v3 = (void *)qword_10007DB30;
  qword_10007DB30 = (uint64_t)v2;

  free(v1);
}

void sub_100005B44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100005B60(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  uint64_t v9 = (void *)a1[4];
  uint64_t v10 = [a2 substringToIndex:1];
  [v9 appendString:v10];

  ++*(void *)(*(void *)(a1[5] + 8) + 24);
  unint64_t v11 = a1[6];
  if (v11) {
    LOBYTE(v11) = *(void *)(*(void *)(a1[5] + 8) + 24) >= v11;
  }
  *a7 = v11;
}

void sub_100005CE0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  id v14 = a2;
  if ((unint64_t)[v14 length] >= 2)
  {
    uint64_t v9 = +[NSBundle mainBundle];
    uint64_t v10 = [v9 localizedStringForKey:@"%@.%@" value:0 table:0];

    unint64_t v11 = *(void **)(a1 + 32);
    v12 = [v14 substringToIndex:1];
    uint64_t v13 = [*(id *)(a1 + 40) substringFromIndex:[v14 length]];
    [v11 appendFormat:v10, v12, v13];
  }
  *a7 = 1;
}

void sub_10000694C(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_100006990(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_100006ED0(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_100006F14(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_1000073E0(id a1)
{
  uint64_t v1 = +[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", @"*?+[(){}^$|\\./");
  objc_storeStrong((id *)&qword_10007DB40, v1);
  if (!qword_10007DB40)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (CRLAssertCat_init_token != -1) {
      dispatch_once(&CRLAssertCat_init_token, &stru_100071828);
    }
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10005B004();
    }
    if (CRLAssertCat_init_token != -1) {
      dispatch_once(&CRLAssertCat_init_token, &stru_100071848);
    }
    id v2 = CRLAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10005AE34(v2);
    }
    v3 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[NSString(CRLAdditions) crl_escapeForIcuRegex]_block_invoke");
    uint64_t v4 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSString_CRLAdditions.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v3, v4, 440, 0, "invalid nil value for '%{public}s'", "icuRegexCharSet");
  }
}

void sub_10000756C(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_1000075B0(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

CFStringTokenizerTokenType sub_100008DD0(uint64_t a1, CFStringTokenizerRef tokenizer)
{
  do
  {
    while (1)
    {
      CFStringTokenizerTokenType Token = CFStringTokenizerAdvanceToNextToken(tokenizer);
      CFStringTokenizerTokenType v5 = Token;
      if (Token) {
        break;
      }
      if (CFStringTokenizerGetCurrentTokenRange(tokenizer).location == -1) {
        return v5;
      }
    }
    if (*(unsigned char *)(a1 + 32)) {
      BOOL v6 = 1;
    }
    else {
      BOOL v6 = (Token & 0x10) == 0;
    }
  }
  while (!v6);
  return v5;
}

void sub_100008EA4(id a1)
{
  __int16 v3 = -4;
  id v1 = [objc_alloc((Class)NSString) initWithCharacters:&v3 length:1];
  id v2 = (void *)qword_10007DB50;
  qword_10007DB50 = (uint64_t)v1;
}

void sub_100009058(id a1)
{
  qword_10007DB68 = +[NSCharacterSet characterSetWithCharactersInString:@"ـ‑-‐–—"];

  _objc_release_x1();
}

void sub_10000910C(id a1)
{
  qword_10007DB78 = +[NSCharacterSet characterSetWithCharactersInString:@"'\"’‘‚“”„«»‹›」「』『"];

  _objc_release_x1();
}

void sub_100009878(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_1000098BC(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_100009D40(uint64_t a1, uint64_t a2, void *a3)
{
  id v9 = a3;
  id v5 = [*(id *)(a1 + 32) rangeOfString:a2];
  if (v5 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = *(void **)(a1 + 40);
    uint64_t v8 = +[NSValue valueWithRange:](NSValue, "valueWithRange:", v5, v6);
    [v7 setObject:v9 forKeyedSubscript:v8];
  }
}

int64_t sub_100009DD4(id a1, NSValue *a2, NSValue *a3)
{
  uint64_t v4 = a3;
  id v5 = [(NSValue *)a2 rangeValue];
  id v6 = [(NSValue *)v4 rangeValue];

  if (v5 > v6) {
    return -1;
  }
  else {
    return v5 < v6;
  }
}

void sub_10000A124(id a1)
{
  uint64_t v1 = +[NSMutableCharacterSet characterSetWithRange:](NSMutableCharacterSet, "characterSetWithRange:", 0, 32);
  id v2 = (void *)qword_10007DB80;
  qword_10007DB80 = v1;

  [(id)qword_10007DB80 addCharactersInString:@"\"\\""];
  int v4 = 539566120;
  id v3 = [objc_alloc((Class)NSString) initWithCharacters:&v4 length:2];
  [(id)qword_10007DB80 addCharactersInString:v3];
}

void sub_10000A354(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000A398(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000A9C8(id a1)
{
  CRLLogCreateCategory("CRLDefaultCat");
  CRLDefaultCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000AEC8(id a1)
{
  id v4 = 0;
  id v1 = [objc_alloc((Class)NSRegularExpression) initWithPattern:@"<REDACT .*? REDACT>" options:8 error:&v4];
  id v2 = v4;
  id v3 = (void *)qword_10007DB90;
  qword_10007DB90 = (uint64_t)v1;
}

void sub_10000B0FC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Cu);
}

uint64_t sub_10000B118()
{
  return v0;
}

void sub_10000B90C(id a1)
{
  CRLLogCreateCategory("CRLSharingExtensionCat");
  CRLSharingExtensionCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000B950(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (a3)
  {
    [*(id *)(a1 + 32) p_logItemProviderError:UTTypeURL error:a3];
  }
  else
  {
    id v5 = objc_alloc_init(CRLSEImportableItem);
    [(CRLSEImportableItem *)v5 setUrl:v6];
    [*(id *)(a1 + 40) addObject:v5];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_10000B9E8(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = *(void **)(a1 + 32);
  id v9 = v5;
  if (a3)
  {
    [v6 p_logItemProviderError:UTTypePlainText error:a3];
  }
  else if ((objc_msgSend(v6, "p_stringIsConsideredEmpty:", v5) & 1) == 0)
  {
    uint64_t v7 = objc_alloc_init(CRLSEImportableItem);
    id v8 = [objc_alloc((Class)NSAttributedString) initWithString:v9];
    [(CRLSEImportableItem *)v7 setAttributedText:v8];

    [(CRLSEImportableItem *)v7 setMediaUTI:UTTypePlainText];
    [*(id *)(a1 + 40) addObject:v7];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_10000BACC(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    [*(id *)(a1 + 32) p_logItemProviderError:UTTypePlainText error:a3];
    goto LABEL_36;
  }
  if (![v5 length])
  {
    if (CRLSharingExtensionCat_init_token != -1) {
      dispatch_once(&CRLSharingExtensionCat_init_token, &stru_100071AA0);
    }
    uint64_t v13 = CRLSharingExtensionCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLSharingExtensionCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10005B21C(v13);
    }
    goto LABEL_36;
  }
  uint64_t v7 = [*(id *)(a1 + 40) suggestedName];
  if ([v7 length])
  {
    id v8 = [*(id *)(a1 + 40) suggestedName];
    id v9 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
    uint64_t v10 = [v8 stringByTrimmingCharactersInSet:v9];
    id v11 = [v10 length];

    if (v11)
    {
      uint64_t v12 = [*(id *)(a1 + 40) suggestedName];
      goto LABEL_13;
    }
  }
  else
  {
  }
  uint64_t v12 = [*(id *)(a1 + 32) defaultImageFileName];
LABEL_13:
  id v14 = (void *)v12;
  v15 = +[NSFileManager defaultManager];
  v16 = [v15 temporaryDirectory];
  v17 = +[NSUUID UUID];
  v18 = [v17 UUIDString];
  v19 = [v16 URLByAppendingPathComponent:v18];

  v20 = [v19 URLByAppendingPathComponent:v14];
  uint64_t v21 = [v20 pathExtension];
  if (!v21
    || (v22 = (void *)v21,
        [v20 pathExtension],
        v23 = objc_claimAutoreleasedReturnValue(),
        id v24 = [v23 length],
        v23,
        v22,
        !v24))
  {
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    v25 = [*(id *)(a1 + 40) registeredTypeIdentifiers];
    id v26 = [v25 countByEnumeratingWithState:&v47 objects:v51 count:16];
    if (v26)
    {
      id v27 = v26;
      v42 = v15;
      v43 = v14;
      v44 = v6;
      uint64_t v45 = a1;
      uint64_t v28 = *(void *)v48;
      while (2)
      {
        for (i = 0; i != v27; i = (char *)i + 1)
        {
          if (*(void *)v48 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = +[UTType typeWithIdentifier:*(void *)(*((void *)&v47 + 1) + 8 * i)];
          if ([v30 conformsToType:UTTypeRAWImage])
          {
            uint64_t v31 = [v30 preferredFilenameExtension];
            if (v31)
            {
              v32 = (void *)v31;
              v33 = [v30 preferredFilenameExtension];
              id v34 = [v33 length];

              if (v34)
              {
                v35 = [v30 preferredFilenameExtension];

                id v6 = v44;
                a1 = v45;
                v15 = v42;
                id v14 = v43;
                goto LABEL_28;
              }
            }
          }
        }
        id v27 = [v25 countByEnumeratingWithState:&v47 objects:v51 count:16];
        if (v27) {
          continue;
        }
        break;
      }
      id v6 = v44;
      a1 = v45;
      v15 = v42;
      id v14 = v43;
    }
    v35 = @"raw";
LABEL_28:

    uint64_t v36 = [v20 URLByAppendingPathExtension:v35];

    v20 = (void *)v36;
  }
  id v46 = 0;
  unsigned int v37 = [v15 createDirectoryAtURL:v19 withIntermediateDirectories:1 attributes:0 error:&v46];
  id v38 = v46;
  if (v37)
  {
    v39 = [v20 path];
    [v15 createFileAtPath:v39 contents:v6 attributes:0];

    v40 = objc_alloc_init(CRLSEImportableItem);
    [(CRLSEImportableItem *)v40 setUrl:v20];
    [*(id *)(a1 + 48) addObject:v40];
  }
  else
  {
    if (CRLDefaultCat_init_token != -1) {
      dispatch_once(&CRLDefaultCat_init_token, &stru_100071AC0);
    }
    v41 = CRLDefaultCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLDefaultCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10005B2C8(v41, v38);
    }
  }

LABEL_36:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void sub_10000BF58(id a1)
{
  CRLLogCreateCategory("CRLSharingExtensionCat");
  CRLSharingExtensionCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000BF9C(id a1)
{
  CRLLogCreateCategory("CRLDefaultCat");
  CRLDefaultCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000BFE0(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (v6)
  {
    if (CRLSharingExtensionCat_init_token != -1) {
      dispatch_once(&CRLSharingExtensionCat_init_token, &stru_100071B08);
    }
    if (os_log_type_enabled((os_log_t)CRLSharingExtensionCat_log_t, OS_LOG_TYPE_DEBUG)) {
      sub_10005B37C();
    }
    if (objc_msgSend(*(id *)(a1 + 32), "p_file:conformsTo:", v6, UTTypeImage))
    {
      uint64_t v26 = 0;
      id v27 = (id *)&v26;
      uint64_t v28 = 0x3032000000;
      v29 = sub_10000C300;
      v30 = sub_10000C310;
      uint64_t v31 = 0;
      id v8 = [objc_alloc((Class)NSFileCoordinator) initWithFilePresenter:0];
      id v9 = v27;
      id v25 = v27[5];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10000C318;
      v19[3] = &unk_100071B70;
      id v10 = v6;
      id v24 = &v26;
      uint64_t v11 = *(void *)(a1 + 40);
      uint64_t v12 = *(void **)(a1 + 48);
      id v20 = v10;
      uint64_t v21 = v11;
      id v22 = v12;
      id v23 = *(id *)(a1 + 56);
      [v8 coordinateReadingItemAtURL:v10 options:1 error:&v25 byAccessor:v19];
      objc_storeStrong(v9 + 5, v25);

      _Block_object_dispose(&v26, 8);
      uint64_t v13 = v31;
    }
    else
    {
      id v14 = *(void **)(a1 + 40);
      v15 = [UTTypeData identifier];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10000C698;
      v16[3] = &unk_100071B98;
      v16[4] = *(void *)(a1 + 32);
      id v17 = *(id *)(a1 + 48);
      id v18 = *(id *)(a1 + 56);
      [v14 loadItemForTypeIdentifier:v15 options:0 completionHandler:v16];

      uint64_t v13 = v17;
    }
  }
  else
  {
    [*(id *)(a1 + 32) p_logItemProviderError:UTTypeImage error:v7];
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
  }
}

void sub_10000C2A4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_10000C2BC(id a1)
{
  CRLLogCreateCategory("CRLSharingExtensionCat");
  CRLSharingExtensionCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

uint64_t sub_10000C300(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000C310(uint64_t a1)
{
}

void sub_10000C318(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = *(id *)(a1 + 32);
    if (!v5)
    {
      id v16 = 0;
      goto LABEL_12;
    }
  }
  id v6 = [v5 lastPathComponent];
  id v7 = +[NSFileManager defaultManager];
  id v8 = [v7 temporaryDirectory];
  id v9 = +[NSUUID UUID];
  id v10 = [v9 UUIDString];
  uint64_t v11 = [v8 URLByAppendingPathComponent:v10];

  uint64_t v12 = [v11 URLByAppendingPathComponent:v6];
  uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v13 + 40);
  LODWORD(v10) = [v7 createDirectoryAtURL:v11 withIntermediateDirectories:1 attributes:0 error:&obj];
  objc_storeStrong((id *)(v13 + 40), obj);
  if (v10
    && (uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8),
        id v22 = *(id *)(v14 + 40),
        unsigned int v15 = [v7 copyItemAtURL:v5 toURL:v12 error:&v22],
        objc_storeStrong((id *)(v14 + 40), v22),
        v15))
  {
    id v16 = v12;

    if (CRLSharingExtensionCat_init_token != -1) {
      dispatch_once(&CRLSharingExtensionCat_init_token, &stru_100071B28);
    }
    if (os_log_type_enabled((os_log_t)CRLSharingExtensionCat_log_t, OS_LOG_TYPE_DEBUG)) {
      sub_10005B4F4();
    }
  }
  else
  {
    id v16 = v5;
  }

LABEL_12:
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    if (CRLDefaultCat_init_token != -1) {
      dispatch_once(&CRLDefaultCat_init_token, &stru_100071B48);
    }
    id v17 = CRLDefaultCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLDefaultCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10005B3F0(a1 + 64, v17);
    }
  }
  else
  {
    id v18 = [*(id *)(a1 + 40) registeredContentTypes];
    if ([v18 count] == (id)1)
    {
      v19 = [*(id *)(a1 + 40) registeredContentTypes];
      id v20 = [v19 objectAtIndexedSubscript:0];
    }
    else
    {
      id v20 = UTTypeImage;
    }

    uint64_t v21 = objc_alloc_init(CRLSEImportableItem);
    [(CRLSEImportableItem *)v21 setUrl:v16];
    [(CRLSEImportableItem *)v21 setMediaUTI:v20];
    [*(id *)(a1 + 48) addObject:v21];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void sub_10000C610(id a1)
{
  CRLLogCreateCategory("CRLSharingExtensionCat");
  CRLSharingExtensionCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000C654(id a1)
{
  CRLLogCreateCategory("CRLDefaultCat");
  CRLDefaultCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000C698(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (a3)
  {
    [*(id *)(a1 + 32) p_logItemProviderError:UTTypeData error:a3];
  }
  else
  {
    id v5 = objc_alloc_init(CRLSEImportableItem);
    [(CRLSEImportableItem *)v5 setImage:v6];
    [*(id *)(a1 + 40) addObject:v5];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_10000C730(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    [*(id *)(a1 + 32) p_logItemProviderError:UTTypeData error:a3];
    id v6 = [*(id *)(a1 + 40) registeredTypeIdentifiers];
    id v7 = [v6 componentsJoinedByString:@","];

    if (CRLSharingExtensionCat_init_token != -1) {
      dispatch_once(&CRLSharingExtensionCat_init_token, &stru_100071BE0);
    }
    if (os_log_type_enabled((os_log_t)CRLSharingExtensionCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10005B568();
    }
    goto LABEL_18;
  }
  id v8 = [*(id *)(a1 + 40) suggestedName];
  if (![v8 length])
  {

    goto LABEL_10;
  }
  id v9 = [*(id *)(a1 + 40) suggestedName];
  id v10 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  uint64_t v11 = [v9 stringByTrimmingCharactersInSet:v10];
  id v12 = [v11 length];

  if (!v12)
  {
LABEL_10:
    uint64_t v13 = +[NSUUID UUID];
    uint64_t v14 = [v13 UUIDString];
    id v7 = [v14 stringByAppendingString:@".pdf"];

    goto LABEL_11;
  }
  id v7 = [*(id *)(a1 + 40) suggestedName];
LABEL_11:
  unsigned int v15 = +[NSFileManager defaultManager];
  id v16 = [v15 temporaryDirectory];
  id v17 = +[NSUUID UUID];
  id v18 = [v17 UUIDString];
  v19 = [v16 URLByAppendingPathComponent:v18];

  id v20 = [v19 URLByAppendingPathComponent:v7];
  id v25 = 0;
  LODWORD(v18) = [v15 createDirectoryAtURL:v19 withIntermediateDirectories:1 attributes:0 error:&v25];
  id v21 = v25;
  if (v18)
  {
    id v22 = [v20 path];
    [v15 createFileAtPath:v22 contents:v5 attributes:0];

    id v23 = objc_alloc_init(CRLSEImportableItem);
    [(CRLSEImportableItem *)v23 setUrl:v20];
    [*(id *)(a1 + 48) addObject:v23];
  }
  else
  {
    if (CRLDefaultCat_init_token != -1) {
      dispatch_once(&CRLDefaultCat_init_token, &stru_100071C00);
    }
    id v24 = CRLDefaultCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLDefaultCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10005B2C8(v24, v21);
    }
  }

LABEL_18:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void sub_10000CA44(id a1)
{
  CRLLogCreateCategory("CRLSharingExtensionCat");
  CRLSharingExtensionCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000CA88(id a1)
{
  CRLLogCreateCategory("CRLDefaultCat");
  CRLDefaultCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000CACC(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (a3)
  {
    [*(id *)(a1 + 32) p_logItemProviderError:UTTypeData error:a3];
    id v6 = [*(id *)(a1 + 40) registeredTypeIdentifiers];
    id v7 = [v6 componentsJoinedByString:@","];

    if (CRLSharingExtensionCat_init_token != -1) {
      dispatch_once(&CRLSharingExtensionCat_init_token, &stru_100071C20);
    }
    if (os_log_type_enabled((os_log_t)CRLSharingExtensionCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10005B568();
    }
  }
  else
  {
    id v7 = objc_alloc_init(CRLSEImportableItem);
    [(CRLSEImportableItem *)v7 setUrl:v5];
    [*(id *)(a1 + 48) addObject:v7];
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void sub_10000CBD0(id a1)
{
  CRLLogCreateCategory("CRLSharingExtensionCat");
  CRLSharingExtensionCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

uint64_t sub_10000CC14(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

void sub_10000CCC8(id a1)
{
  CRLLogCreateCategory("CRLSharingExtensionCat");
  CRLSharingExtensionCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000D008(id a1)
{
  CRLLogCreateCategory("CRLSharingExtensionCat");
  CRLSharingExtensionCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000D314(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Au);
}

uint64_t sub_10000D340()
{
  return _objc_opt_class(v0);
}

void sub_10000D3AC(id a1)
{
  qword_10007DBA0 = objc_alloc_init(CRLLogHelper);

  _objc_release_x1();
}

void sub_10000D5B4(id a1)
{
  CRLLogCreateCategory("CRLPerformanceCat");
  CRLPerformanceCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000D5F4(id a1)
{
  CRLLogCreateCategory("CRLPerformanceCat");
  CRLPerformanceCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000DBA4(uint64_t a1)
{
  id v2 = *(void **)(a1 + 40);
  if (v2)
  {
    id v3 = *(NSObject **)(a1 + 32);
    if (v3)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000DC64;
      block[3] = &unk_100071D38;
      id v6 = v2;
      dispatch_async(v3, block);
    }
    else
    {
      id v4 = (void (*)(void))v2[2];
      v4();
    }
  }
}

uint64_t sub_10000DC64(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000E4E8(id a1)
{
  size_t size = 0;
  sysctlbyname("hw.machine", 0, &size, 0, 0);
  uint64_t v1 = malloc_type_malloc(size, 0xF2D9B89FuLL);
  sysctlbyname("hw.machine", v1, &size, 0, 0);
  id v2 = [objc_alloc((Class)NSString) initWithUTF8String:v1];
  free(v1);
  objc_storeStrong((id *)&qword_10007DBB0, v2);
  if (!qword_10007DBB0)
  {
    int v3 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (CRLAssertCat_init_token != -1) {
      dispatch_once(&CRLAssertCat_init_token, &stru_100071D78);
    }
    id v4 = CRLAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10005B874(v3, v4);
    }
    if (CRLAssertCat_init_token != -1) {
      dispatch_once(&CRLAssertCat_init_token, &stru_100071D98);
    }
    id v5 = CRLAssertCat_log_t;
    if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10005B7B0(v5, v3);
    }
    id v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[UIDevice(CRLAdditions) crl_platformString]_block_invoke");
    id v7 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/UIDevice_CRLAdditions.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 46, 0, "invalid nil value for '%{public}s'", "s_platformString");
  }
}

void sub_10000E6CC(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000E710(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000EC70(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000ECB4(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000ECF8(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000ED3C(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000EEEC(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000EF30(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000F158(id a1)
{
  qword_10007DBD8 = +[UITraitCollection traitCollectionWithUserInterfaceLevel:0];

  _objc_release_x1();
}

void sub_10000F1F0(id a1)
{
  qword_10007DBE0 = +[UITraitCollection traitCollectionWithUserInterfaceLevel:1];

  _objc_release_x1();
}

void sub_10000F264(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x36u);
}

id sub_10000F310(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) p_crl_uncachedScreenClass];
  qword_10007DBF8 = (uint64_t)result;
  return result;
}

void sub_10000FB3C(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000FB80(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000FBC4(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000FC08(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000FC4C(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000FC90(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000FCD4(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000FD18(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000FD5C(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000FDA0(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_10000FE28(id a1)
{
  BOOL v1 = (id)+[UIScreen crl_screenClass] == (id)3
    || (id)+[UIScreen crl_screenClass] == (id)5;
  byte_10007DC08 = v1;
}

void sub_10000FEBC(id a1)
{
  BOOL v1 = (id)+[UIScreen crl_screenClass] == (id)1
    || (id)+[UIScreen crl_screenClass] == (id)2;
  byte_10007DC18 = v1;
}

void sub_10000FF50(id a1)
{
  id v5 = +[UIScreen mainScreen];
  [v5 nativeScale];
  double v2 = v1;
  int v3 = +[UIScreen mainScreen];
  [v3 scale];
  *(double *)&qword_10007C5C0 = v2 / v4;
}

void sub_100010014(id a1)
{
  double v1 = +[UIScreen mainScreen];
  [v1 bounds];
  double v3 = v2;
  double v5 = v4;

  unsigned __int8 v6 = +[UIDevice crl_padUI];
  if (v3 >= v5) {
    double v7 = v3;
  }
  else {
    double v7 = v5;
  }
  if (v7 == 1080.0) {
    char v8 = v6;
  }
  else {
    char v8 = 0;
  }
  byte_10007DC30 = v8;
}

void sub_1000100CC(id a1)
{
  double v1 = +[UIScreen mainScreen];
  [v1 bounds];
  double v3 = v2;
  double v5 = v4;

  unsigned __int8 v6 = +[UIDevice crl_padUI];
  if (v3 >= v5) {
    double v7 = v3;
  }
  else {
    double v7 = v5;
  }
  if (v7 == 1112.0) {
    char v8 = v6;
  }
  else {
    char v8 = 0;
  }
  byte_10007DC40 = v8;
}

void sub_100010184(id a1)
{
  double v1 = +[UIScreen mainScreen];
  [v1 bounds];
  double v3 = v2;
  double v5 = v4;

  unsigned __int8 v6 = +[UIDevice crl_padUI];
  if (v3 >= v5) {
    double v7 = v3;
  }
  else {
    double v7 = v5;
  }
  if (v7 == 1180.0) {
    char v8 = v6;
  }
  else {
    char v8 = 0;
  }
  byte_10007DC50 = v8;
}

void sub_10001023C(id a1)
{
  double v1 = +[UIScreen mainScreen];
  [v1 bounds];
  double v3 = v2;
  double v5 = v4;

  unsigned __int8 v6 = +[UIDevice crl_padUI];
  if (v3 >= v5) {
    double v7 = v3;
  }
  else {
    double v7 = v5;
  }
  if (v7 == 1194.0) {
    char v8 = v6;
  }
  else {
    char v8 = 0;
  }
  byte_10007DC60 = v8;
}

void sub_1000102F4(id a1)
{
  double v1 = +[UIScreen mainScreen];
  [v1 bounds];
  double v3 = v2;
  double v5 = v4;

  unsigned __int8 v6 = +[UIDevice crl_padUI];
  if (v3 >= v5) {
    double v7 = v3;
  }
  else {
    double v7 = v5;
  }
  if (v7 == 1366.0) {
    char v8 = v6;
  }
  else {
    char v8 = 0;
  }
  byte_10007DC70 = v8;
}

void sub_1000103AC(id a1)
{
  double v1 = +[UIScreen mainScreen];
  [v1 bounds];
  double v3 = v2;
  double v5 = v4;

  unsigned __int8 v6 = +[UIDevice crl_padUI];
  if (v3 >= v5) {
    double v7 = v3;
  }
  else {
    double v7 = v5;
  }
  if (v7 >= 1366.0) {
    char v8 = v6;
  }
  else {
    char v8 = 0;
  }
  byte_10007DC80 = v8;
}

void sub_100010464(id a1)
{
  double v1 = +[UIScreen mainScreen];
  [v1 bounds];
  double v3 = v2;
  double v5 = v4;

  unsigned __int8 v6 = +[UIDevice crl_phoneUI];
  if (v3 >= v5) {
    double v7 = v3;
  }
  else {
    double v7 = v5;
  }
  if (v7 == 568.0) {
    char v8 = v6;
  }
  else {
    char v8 = 0;
  }
  byte_10007DC90 = v8;
}

void sub_10001051C(id a1)
{
  double v1 = +[UIScreen mainScreen];
  [v1 bounds];
  double v3 = v2;
  double v5 = v4;

  unsigned __int8 v6 = +[UIDevice crl_phoneUI];
  if (v3 >= v5) {
    double v7 = v3;
  }
  else {
    double v7 = v5;
  }
  if (v7 <= 568.0) {
    char v8 = v6;
  }
  else {
    char v8 = 0;
  }
  byte_10007DCA0 = v8;
}

void sub_1000105D4(id a1)
{
  double v1 = +[UIScreen mainScreen];
  [v1 bounds];
  double v3 = v2;
  double v5 = v4;

  unsigned __int8 v6 = +[UIDevice crl_phoneUI];
  if (v3 >= v5) {
    double v7 = v3;
  }
  else {
    double v7 = v5;
  }
  if (v7 == 667.0) {
    char v8 = v6;
  }
  else {
    char v8 = 0;
  }
  byte_10007DCB0 = v8;
}

void sub_10001068C(id a1)
{
  double v1 = +[UIScreen mainScreen];
  [v1 bounds];
  double v3 = v2;
  double v5 = v4;

  unsigned __int8 v6 = +[UIDevice crl_phoneUI];
  if (v3 >= v5) {
    double v7 = v3;
  }
  else {
    double v7 = v5;
  }
  if (v7 <= 667.0) {
    char v8 = v6;
  }
  else {
    char v8 = 0;
  }
  byte_10007DCC0 = v8;
}

void sub_100010744(id a1)
{
  double v1 = +[UIScreen mainScreen];
  [v1 bounds];
  double v3 = v2;
  double v5 = v4;

  unsigned __int8 v6 = +[UIDevice crl_phoneUI];
  if (v3 >= v5) {
    double v7 = v3;
  }
  else {
    double v7 = v5;
  }
  if (v7 == 693.0) {
    char v8 = v6;
  }
  else {
    char v8 = 0;
  }
  byte_10007DCD0 = v8;
}

void sub_1000107FC(id a1)
{
  double v1 = +[UIScreen mainScreen];
  [v1 bounds];
  double v3 = v2;
  double v5 = v4;

  unsigned __int8 v6 = +[UIDevice crl_phoneUI];
  if (v3 >= v5) {
    double v7 = v3;
  }
  else {
    double v7 = v5;
  }
  if (v7 == 736.0) {
    char v8 = v6;
  }
  else {
    char v8 = 0;
  }
  byte_10007DCE0 = v8;
}

void sub_1000108B4(id a1)
{
  double v1 = +[UIScreen mainScreen];
  [v1 bounds];
  double v3 = v2;
  double v5 = v4;

  unsigned __int8 v6 = +[UIDevice crl_phoneUI];
  if (v3 >= v5) {
    double v7 = v3;
  }
  else {
    double v7 = v5;
  }
  if (v7 == 812.0) {
    char v8 = v6;
  }
  else {
    char v8 = 0;
  }
  byte_10007DCF0 = v8;
}

void sub_10001096C(id a1)
{
  double v1 = +[UIScreen mainScreen];
  [v1 bounds];
  double v3 = v2;
  double v5 = v4;

  unsigned __int8 v6 = +[UIDevice crl_phoneUI];
  if (v3 >= v5) {
    double v7 = v3;
  }
  else {
    double v7 = v5;
  }
  if (v7 >= 812.0) {
    char v8 = v6;
  }
  else {
    char v8 = 0;
  }
  byte_10007DD00 = v8;
}

void sub_100010A24(id a1)
{
  double v1 = +[UIScreen mainScreen];
  [v1 bounds];
  double v3 = v2;
  double v5 = v4;

  unsigned __int8 v6 = +[UIDevice crl_phoneUI];
  if (v3 >= v5) {
    double v7 = v3;
  }
  else {
    double v7 = v5;
  }
  if (v7 == 844.0) {
    char v8 = v6;
  }
  else {
    char v8 = 0;
  }
  byte_10007DD10 = v8;
}

void sub_100010ADC(id a1)
{
  double v1 = +[UIScreen mainScreen];
  [v1 bounds];
  double v3 = v2;
  double v5 = v4;

  unsigned __int8 v6 = +[UIDevice crl_phoneUI];
  if (v3 >= v5) {
    double v7 = v3;
  }
  else {
    double v7 = v5;
  }
  if (v7 == 896.0) {
    char v8 = v6;
  }
  else {
    char v8 = 0;
  }
  byte_10007DD20 = v8;
}

void sub_100010B94(id a1)
{
  double v1 = +[UIScreen mainScreen];
  [v1 bounds];
  double v3 = v2;
  double v5 = v4;

  unsigned __int8 v6 = +[UIDevice crl_phoneUI];
  if (v3 >= v5) {
    double v7 = v3;
  }
  else {
    double v7 = v5;
  }
  if (v7 == 926.0) {
    char v8 = v6;
  }
  else {
    char v8 = 0;
  }
  byte_10007DD30 = v8;
}

void sub_100010E58(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_100010E9C(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_1000110B4(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_1000110F8(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

intptr_t CRLDynamicBaseAddress()
{
  uint64_t v0 = getsectbyname("__TEXT", "__text");
  uint64_t addr = v0->addr;
  uint64_t offset = v0->offset;
  bufsize_t size = 1024;
  if (_NSGetExecutablePath(buf, &bufsize))
  {
    intptr_t image_vmaddr_slide = -1;
  }
  else if (_dyld_image_count())
  {
    uint32_t v4 = 0;
    while (1)
    {
      image_name = _dyld_get_image_name(v4);
      if (!strcmp(image_name, buf)) {
        break;
      }
      if (++v4 >= _dyld_image_count()) {
        goto LABEL_7;
      }
    }
    intptr_t image_vmaddr_slide = _dyld_get_image_vmaddr_slide(v4);
  }
  else
  {
LABEL_7:
    intptr_t image_vmaddr_slide = 0;
  }
  return addr - offset + image_vmaddr_slide;
}

void sub_10001156C(uint64_t a1, void *a2, char a3)
{
  id v5 = a2;
  if (CRLAssertCat_init_token != -1) {
    dispatch_once(&CRLAssertCat_init_token, &stru_100072338);
  }
  unsigned __int8 v6 = CRLAssertCat_log_t;
  if (os_log_type_enabled((os_log_t)CRLAssertCat_log_t, OS_LOG_TYPE_ERROR))
  {
    sub_10005BEFC(v6);
    if (a3) {
      goto LABEL_5;
    }
  }
  else if (a3)
  {
LABEL_5:
    double v7 = *(void **)(a1 + 32);
    id v8 = +[NSString stringWithFormat:@"Terminating application due to %@", v5];
LABEL_9:
    uint64_t v9 = v8;
    [v7 addObject:v8];

    goto LABEL_10;
  }
  if (!*(unsigned char *)(a1 + 40))
  {
    double v7 = *(void **)(a1 + 32);
    id v8 = [v5 copy];
    goto LABEL_9;
  }
LABEL_10:
}

void sub_100011650(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_100011718(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_1000117F8(id a1)
{
  CRLLogCreateCategory("CRLAssertCat");
  CRLAssertCat_log_t = (_UNKNOWN *)objc_claimAutoreleasedReturnValue();

  _objc_release_x1();
}

void sub_100011F3C(id a1)
{
  uint64_t v1 = +[NSDictionary sharedKeySetForKeys:&off_100074668];
  double v2 = (void *)qword_10007DD50;
  qword_10007DD50 = v1;

  id v3 = objc_alloc_init((Class)NSMutableDictionary);
  uint32_t v4 = (void *)qword_10007DD58;
  qword_10007DD58 = (uint64_t)v3;

  dword_10007DD60 = 0;
}

void sub_100012028(id a1)
{
  uint64_t v1 = dlopen("/System/Library/PrivateFrameworks/CrashReporterSupport.framework/CrashReporterSupport", 2);
  if (v1) {
    uint64_t v1 = dlsym(v1, "SimulateCrash");
  }
  off_10007DD68 = v1;
}

void CRLSetCrashReporterInfov(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = a2;
  uint64_t v8 = a2;
  double v2 = +[NSString stringWithUTF8String:a1];
  id v3 = [objc_alloc((Class)NSString) crl_initRedactedWithFormat:v2 arguments:v7];
  uint32_t v4 = (const char *)[v3 UTF8String];
  unsigned __int8 v6 = 0;
  if (v4)
  {
    asprintf(&v6, "%s", v4);
    id v5 = v6;
  }
  else
  {
    id v5 = 0;
  }
  if (!v5) {
    id v5 = "CRLSetCrashReporterInfo: unknown reason";
  }
  __crashreporter_info__ = (uint64_t)v5;
}

void CRLSetCrashReporterInfo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

os_log_t CRLLogCreateCategory(char *category)
{
  os_log_t v1 = os_log_create("com.apple.freeform", category);

  return v1;
}

id sub_1000125E4(void *a1)
{
  id result = [*(id *)(a1[4] + 8) containsObject:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = (_BYTE)result;
  return result;
}

id sub_1000126C8(uint64_t a1)
{
  id result = [*(id *)(*(void *)(a1 + 32) + 8) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t sub_1000127F0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100012800(uint64_t a1)
{
}

uint64_t sub_100012808(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) allObjects];

  return _objc_release_x1();
}

uint64_t sub_100012948(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = +[NSSet setWithSet:*(void *)(*(void *)(a1 + 32) + 8)];

  return _objc_release_x1();
}

id sub_100012A38(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) addObject:*(void *)(a1 + 40)];
}

id sub_100012ADC(uint64_t a1)
{
  return _[*(id *)(*(void *)(a1 + 32) + 8) removeObject:*(void *)(a1 + 40)];
}

uint64_t sub_100012BD8(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(*(void *)(a1 + 32) + 8) description];

  return _objc_release_x1();
}

id CRLLogGetNameDictionary()
{
  if (qword_10007DD88[0] != -1) {
    dispatch_once(qword_10007DD88, &stru_100072478);
  }
  uint64_t v0 = (void *)qword_10007DD80;

  return v0;
}

void sub_100012CC0(id a1)
{
  qword_10007DD80 = +[NSMapTable strongToStrongObjectsMapTable];

  _objc_release_x1();
}

id CRLLogEnsureCreated(void *a1, id *a2, dispatch_once_t *a3)
{
  uint64_t v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  id v12 = sub_100012DD0;
  uint64_t v13 = &unk_1000724A0;
  uint64_t v14 = a1;
  unsigned int v15 = a2;
  dispatch_once_t v5 = *a3;
  id v6 = a1;
  if (v5 != -1) {
    dispatch_once(a3, &v10);
  }
  uint64_t v7 = CRLLogGetNameDictionary();
  [v7 setObject:v6 forKey:*a2];

  id v8 = *a2;
  return v8;
}

void sub_100012DD0(uint64_t a1)
{
  os_log_t v2 = os_log_create("com.apple.freeform", (const char *)[*(id *)(a1 + 32) UTF8String]);

  **(void **)(a1 + 40) = v2;
}

ValueMetadata *type metadata accessor for CRLSELibraryViewModel()
{
  return &type metadata for CRLSELibraryViewModel;
}

void *sub_100012E2C(void *a1, void *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v24 = *a2;
    *a1 = *a2;
    a1 = (void *)(v24 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = *(void *)(a3 - 8);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 3)
    {
      uint64_t v25 = sub_10005C3D0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v25 - 8) + 16))(a1, a2, v25);
      uint64_t v26 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
      uint64_t v27 = *(int *)(v26 + 48);
      uint64_t v28 = (void *)((char *)a1 + v27);
      v29 = (void *)((char *)a2 + v27);
      uint64_t v30 = v29[1];
      *uint64_t v28 = *v29;
      v28[1] = v30;
      uint64_t v31 = *(int *)(v26 + 64);
      v19 = (char *)a1 + v31;
      id v20 = (char *)a2 + v31;
      uint64_t v21 = sub_10005C390();
      uint64_t v22 = *(void *)(v21 - 8);
      v32 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48);
      swift_bridgeObjectRetain();
      if (v32(v20, 1, v21))
      {
LABEL_8:
        uint64_t v33 = sub_1000131E0((uint64_t *)&unk_10007D850);
        memcpy(v19, v20, *(void *)(*(void *)(v33 - 8) + 64));
LABEL_11:
        swift_storeEnumTagMultiPayload();
        return a1;
      }
LABEL_10:
      (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v19, v20, v21);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
      goto LABEL_11;
    }
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v8 = sub_10005C3D0();
      (*(void (**)(void *, void *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
      uint64_t v9 = *(int *)(type metadata accessor for CRLSEBoardIdentifierStorage(0) + 20);
      uint64_t v10 = (void *)((char *)a1 + v9);
      uint64_t v11 = (void *)((char *)a2 + v9);
      uint64_t v12 = v11[1];
      *uint64_t v10 = *v11;
      v10[1] = v12;
      swift_bridgeObjectRetain();
      uint64_t v13 = (int *)sub_1000131E0(&qword_10007D1D0);
      uint64_t v14 = v13[12];
      unsigned int v15 = (void *)((char *)a1 + v14);
      id v16 = (void *)((char *)a2 + v14);
      uint64_t v17 = v16[1];
      void *v15 = *v16;
      v15[1] = v17;
      *((unsigned char *)a1 + v13[16]) = *((unsigned char *)a2 + v13[16]);
      uint64_t v18 = v13[20];
      v19 = (char *)a1 + v18;
      id v20 = (char *)a2 + v18;
      uint64_t v21 = sub_10005C390();
      uint64_t v22 = *(void *)(v21 - 8);
      id v23 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48);
      swift_bridgeObjectRetain();
      if (v23(v20, 1, v21)) {
        goto LABEL_8;
      }
      goto LABEL_10;
    }
    memcpy(a1, a2, *(void *)(v6 + 64));
  }
  return a1;
}

uint64_t type metadata accessor for CRLSEBoardIdentifierStorage(uint64_t a1)
{
  return sub_10001762C(a1, qword_10007C9D8);
}

uint64_t sub_1000131E0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100013224(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result == 3)
  {
    uint64_t v6 = sub_10005C3D0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
    uint64_t v7 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
    swift_bridgeObjectRelease();
    uint64_t v5 = *(int *)(v7 + 64);
  }
  else
  {
    if (result != 2) {
      return result;
    }
    uint64_t v3 = sub_10005C3D0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
    type metadata accessor for CRLSEBoardIdentifierStorage(0);
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_1000131E0(&qword_10007D1D0);
    swift_bridgeObjectRelease();
    uint64_t v5 = *(int *)(v4 + 80);
  }
  uint64_t v8 = a1 + v5;
  uint64_t v9 = sub_10005C390();
  uint64_t v11 = *(void *)(v9 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v8, 1, v9);
  if (!result)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(v11 + 8);
    return v10(v8, v9);
  }
  return result;
}

unsigned char *sub_1000133CC(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 3)
  {
    uint64_t v23 = sub_10005C3D0();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v23 - 8) + 16))(a1, a2, v23);
    uint64_t v24 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
    uint64_t v25 = *(int *)(v24 + 48);
    uint64_t v26 = &a1[v25];
    uint64_t v27 = &a2[v25];
    uint64_t v28 = v27[1];
    *uint64_t v26 = *v27;
    v26[1] = v28;
    uint64_t v29 = *(int *)(v24 + 64);
    uint64_t v18 = &a1[v29];
    v19 = &a2[v29];
    uint64_t v20 = sub_10005C390();
    uint64_t v21 = *(void *)(v20 - 8);
    uint64_t v30 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48);
    swift_bridgeObjectRetain();
    if (v30(v19, 1, v20))
    {
LABEL_6:
      uint64_t v31 = sub_1000131E0((uint64_t *)&unk_10007D850);
      memcpy(v18, v19, *(void *)(*(void *)(v31 - 8) + 64));
LABEL_9:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
LABEL_8:
    (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v18, v19, v20);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v21 + 56))(v18, 0, 1, v20);
    goto LABEL_9;
  }
  if (EnumCaseMultiPayload == 2)
  {
    uint64_t v7 = sub_10005C3D0();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(type metadata accessor for CRLSEBoardIdentifierStorage(0) + 20);
    uint64_t v9 = &a1[v8];
    uint64_t v10 = &a2[v8];
    uint64_t v11 = v10[1];
    *uint64_t v9 = *v10;
    v9[1] = v11;
    swift_bridgeObjectRetain();
    uint64_t v12 = (int *)sub_1000131E0(&qword_10007D1D0);
    uint64_t v13 = v12[12];
    uint64_t v14 = &a1[v13];
    unsigned int v15 = &a2[v13];
    uint64_t v16 = v15[1];
    *uint64_t v14 = *v15;
    v14[1] = v16;
    a1[v12[16]] = a2[v12[16]];
    uint64_t v17 = v12[20];
    uint64_t v18 = &a1[v17];
    v19 = &a2[v17];
    uint64_t v20 = sub_10005C390();
    uint64_t v21 = *(void *)(v20 - 8);
    uint64_t v22 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48);
    swift_bridgeObjectRetain();
    if (v22(v19, 1, v20)) {
      goto LABEL_6;
    }
    goto LABEL_8;
  }
  memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  return a1;
}

unsigned char *sub_10001371C(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100016DA0((uint64_t)a1, type metadata accessor for CRLSELibraryViewModel.Item);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 3)
    {
      uint64_t v21 = sub_10005C3D0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v21 - 8) + 16))(a1, a2, v21);
      uint64_t v22 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
      uint64_t v23 = *(int *)(v22 + 48);
      uint64_t v24 = &a1[v23];
      uint64_t v25 = &a2[v23];
      *uint64_t v24 = *v25;
      v24[1] = v25[1];
      uint64_t v26 = *(int *)(v22 + 64);
      uint64_t v16 = &a1[v26];
      uint64_t v17 = &a2[v26];
      uint64_t v18 = sub_10005C390();
      uint64_t v19 = *(void *)(v18 - 8);
      uint64_t v27 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48);
      swift_bridgeObjectRetain();
      if (v27(v17, 1, v18))
      {
LABEL_7:
        uint64_t v28 = sub_1000131E0((uint64_t *)&unk_10007D850);
        memcpy(v16, v17, *(void *)(*(void *)(v28 - 8) + 64));
LABEL_10:
        swift_storeEnumTagMultiPayload();
        return a1;
      }
LABEL_9:
      (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v16, v17, v18);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v16, 0, 1, v18);
      goto LABEL_10;
    }
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v7 = sub_10005C3D0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
      uint64_t v8 = *(int *)(type metadata accessor for CRLSEBoardIdentifierStorage(0) + 20);
      uint64_t v9 = &a1[v8];
      uint64_t v10 = &a2[v8];
      *uint64_t v9 = *v10;
      v9[1] = v10[1];
      swift_bridgeObjectRetain();
      uint64_t v11 = (int *)sub_1000131E0(&qword_10007D1D0);
      uint64_t v12 = v11[12];
      uint64_t v13 = &a1[v12];
      uint64_t v14 = &a2[v12];
      *uint64_t v13 = *v14;
      v13[1] = v14[1];
      a1[v11[16]] = a2[v11[16]];
      uint64_t v15 = v11[20];
      uint64_t v16 = &a1[v15];
      uint64_t v17 = &a2[v15];
      uint64_t v18 = sub_10005C390();
      uint64_t v19 = *(void *)(v18 - 8);
      uint64_t v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48);
      swift_bridgeObjectRetain();
      if (v20(v17, 1, v18)) {
        goto LABEL_7;
      }
      goto LABEL_9;
    }
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

uint64_t type metadata accessor for CRLSELibraryViewModel.Item(uint64_t a1)
{
  return sub_10001762C(a1, (uint64_t *)&unk_10007C8B0);
}

unsigned char *sub_100013AC8(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 3)
  {
    uint64_t v15 = sub_10005C3D0();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v15 - 8) + 32))(a1, a2, v15);
    uint64_t v16 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
    *(_OWORD *)&a1[*(int *)(v16 + 48)] = *(_OWORD *)&a2[*(int *)(v16 + 48)];
    uint64_t v17 = *(int *)(v16 + 64);
    uint64_t v11 = &a1[v17];
    uint64_t v12 = &a2[v17];
    uint64_t v13 = sub_10005C390();
    uint64_t v14 = *(void *)(v13 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
    {
LABEL_6:
      uint64_t v18 = sub_1000131E0((uint64_t *)&unk_10007D850);
      memcpy(v11, v12, *(void *)(*(void *)(v18 - 8) + 64));
LABEL_9:
      swift_storeEnumTagMultiPayload();
      return a1;
    }
LABEL_8:
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v11, v12, v13);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
    goto LABEL_9;
  }
  if (EnumCaseMultiPayload == 2)
  {
    uint64_t v7 = sub_10005C3D0();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
    uint64_t v8 = type metadata accessor for CRLSEBoardIdentifierStorage(0);
    *(_OWORD *)&a1[*(int *)(v8 + 20)] = *(_OWORD *)&a2[*(int *)(v8 + 20)];
    uint64_t v9 = (int *)sub_1000131E0(&qword_10007D1D0);
    *(_OWORD *)&a1[v9[12]] = *(_OWORD *)&a2[v9[12]];
    a1[v9[16]] = a2[v9[16]];
    uint64_t v10 = v9[20];
    uint64_t v11 = &a1[v10];
    uint64_t v12 = &a2[v10];
    uint64_t v13 = sub_10005C390();
    uint64_t v14 = *(void *)(v13 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13)) {
      goto LABEL_6;
    }
    goto LABEL_8;
  }
  memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  return a1;
}

unsigned char *sub_100013DDC(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100016DA0((uint64_t)a1, type metadata accessor for CRLSELibraryViewModel.Item);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 3)
    {
      uint64_t v15 = sub_10005C3D0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v15 - 8) + 32))(a1, a2, v15);
      uint64_t v16 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
      *(_OWORD *)&a1[*(int *)(v16 + 48)] = *(_OWORD *)&a2[*(int *)(v16 + 48)];
      uint64_t v17 = *(int *)(v16 + 64);
      uint64_t v11 = &a1[v17];
      uint64_t v12 = &a2[v17];
      uint64_t v13 = sub_10005C390();
      uint64_t v14 = *(void *)(v13 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13))
      {
LABEL_7:
        uint64_t v18 = sub_1000131E0((uint64_t *)&unk_10007D850);
        memcpy(v11, v12, *(void *)(*(void *)(v18 - 8) + 64));
LABEL_10:
        swift_storeEnumTagMultiPayload();
        return a1;
      }
LABEL_9:
      (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v11, v12, v13);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
      goto LABEL_10;
    }
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v7 = sub_10005C3D0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v7 - 8) + 32))(a1, a2, v7);
      uint64_t v8 = type metadata accessor for CRLSEBoardIdentifierStorage(0);
      *(_OWORD *)&a1[*(int *)(v8 + 20)] = *(_OWORD *)&a2[*(int *)(v8 + 20)];
      uint64_t v9 = (int *)sub_1000131E0(&qword_10007D1D0);
      *(_OWORD *)&a1[v9[12]] = *(_OWORD *)&a2[v9[12]];
      a1[v9[16]] = a2[v9[16]];
      uint64_t v10 = v9[20];
      uint64_t v11 = &a1[v10];
      uint64_t v12 = &a2[v10];
      uint64_t v13 = sub_10005C390();
      uint64_t v14 = *(void *)(v13 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v12, 1, v13)) {
        goto LABEL_7;
      }
      goto LABEL_9;
    }
    memcpy(a1, a2, *(void *)(*(void *)(a3 - 8) + 64));
  }
  return a1;
}

uint64_t sub_100014114(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_10001413C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_10001416C()
{
  return swift_storeEnumTagMultiPayload();
}

void sub_10001417C()
{
  uint64_t v7 = &unk_100060B50;
  uint64_t v8 = &unk_100060B68;
  uint64_t v0 = type metadata accessor for CRLSEBoardIdentifierStorage(319);
  if (v1 <= 0x3F)
  {
    v5[4] = *(void *)(v0 - 8) + 64;
    v5[5] = &unk_100060B80;
    v5[6] = &unk_100060B98;
    sub_10001776C(319, (unint64_t *)&unk_10007C8C0, (void (*)(uint64_t))&type metadata accessor for Date);
    if (v3 <= 0x3F)
    {
      v5[7] = *(void *)(v2 - 8) + 64;
      swift_getTupleTypeLayout();
      uint64_t v9 = &v6;
      sub_10005C3D0();
      if (v4 <= 0x3F)
      {
        swift_getTupleTypeLayout3();
        uint64_t v10 = v5;
        swift_initEnumMetadataMultiPayload();
      }
    }
  }
}

uint64_t *sub_1000142FC(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4 = type metadata accessor for CRLSEBoardIdentifierStorage(0);
  int v5 = *(_DWORD *)(*(void *)(v4 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v6 = v4;
    uint64_t v7 = sub_10005C3D0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(v6 + 20);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    *uint64_t v9 = *v10;
    v9[1] = v11;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_1000143DC(uint64_t a1)
{
  uint64_t v2 = sub_10005C3D0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  type metadata accessor for CRLSEBoardIdentifierStorage(0);

  return swift_bridgeObjectRelease();
}

uint64_t sub_100014458(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10005C3D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  uint64_t v5 = *(int *)(type metadata accessor for CRLSEBoardIdentifierStorage(0) + 20);
  uint64_t v6 = (void *)(a1 + v5);
  uint64_t v7 = (void *)(a2 + v5);
  uint64_t v8 = v7[1];
  *uint64_t v6 = *v7;
  v6[1] = v8;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1000144DC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10005C3D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a1, a2, v4);
  uint64_t v5 = *(int *)(type metadata accessor for CRLSEBoardIdentifierStorage(0) + 20);
  uint64_t v6 = (void *)(a1 + v5);
  uint64_t v7 = (void *)(a2 + v5);
  *uint64_t v6 = *v7;
  v6[1] = v7[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100014574(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10005C3D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  uint64_t v5 = type metadata accessor for CRLSEBoardIdentifierStorage(0);
  *(_OWORD *)(a1 + *(int *)(v5 + 20)) = *(_OWORD *)(a2 + *(int *)(v5 + 20));
  return a1;
}

uint64_t sub_1000145EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10005C3D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a1, a2, v4);
  uint64_t v5 = *(int *)(type metadata accessor for CRLSEBoardIdentifierStorage(0) + 20);
  uint64_t v6 = (void *)(a1 + v5);
  uint64_t v7 = (uint64_t *)(a2 + v5);
  uint64_t v9 = *v7;
  uint64_t v8 = v7[1];
  *uint64_t v6 = v9;
  v6[1] = v8;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100014674(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100014688);
}

uint64_t sub_100014688(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CRLSEBoardIdentifierStorage(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t sub_1000146F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100014708);
}

uint64_t sub_100014708(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CRLSEBoardIdentifierStorage(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t type metadata accessor for CRLSEBoardIdentifier(uint64_t a1)
{
  return sub_10001762C(a1, qword_10007C948);
}

uint64_t sub_100014798()
{
  uint64_t result = type metadata accessor for CRLSEBoardIdentifierStorage(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_100014824(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v12 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_10005C3D0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (uint64_t *)((char *)a1 + v8);
    uint64_t v10 = (uint64_t *)((char *)a2 + v8);
    uint64_t v11 = v10[1];
    *uint64_t v9 = *v10;
    v9[1] = v11;
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_1000148FC(uint64_t a1)
{
  uint64_t v2 = sub_10005C3D0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);

  return swift_bridgeObjectRelease();
}

uint64_t sub_100014974(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10005C3D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = v9[1];
  *uint64_t v8 = *v9;
  v8[1] = v10;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1000149FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10005C3D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100014A98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10005C3D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(_OWORD *)(a1 + *(int *)(a3 + 20)) = *(_OWORD *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t sub_100014B14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10005C3D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100014BA0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100014BB4);
}

uint64_t sub_100014BB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10005C3D0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_100014C78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100014C8C);
}

uint64_t sub_100014C8C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_10005C3D0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t sub_100014D4C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000162CC(a1, a2, a3, (uint64_t (*)(uint64_t))&type metadata accessor for UUID);
}

uint64_t *sub_100014D6C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) == 0)
  {
    uint64_t v7 = type metadata accessor for CRLSELibraryViewModel.Item(0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 3)
    {
      uint64_t v25 = sub_10005C3D0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v25 - 8) + 16))(a1, a2, v25);
      uint64_t v26 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
      uint64_t v27 = *(int *)(v26 + 48);
      uint64_t v28 = (uint64_t *)((char *)a1 + v27);
      uint64_t v29 = (uint64_t *)((char *)a2 + v27);
      uint64_t v30 = v29[1];
      *uint64_t v28 = *v29;
      v28[1] = v30;
      uint64_t v31 = *(int *)(v26 + 64);
      __dst = (char *)a1 + v31;
      uint64_t v20 = (char *)a2 + v31;
      uint64_t v21 = sub_10005C390();
      uint64_t v22 = *(void *)(v21 - 8);
      v32 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48);
      swift_bridgeObjectRetain();
      if (v32(v20, 1, v21))
      {
LABEL_8:
        uint64_t v33 = sub_1000131E0((uint64_t *)&unk_10007D850);
        memcpy(__dst, v20, *(void *)(*(void *)(v33 - 8) + 64));
LABEL_11:
        swift_storeEnumTagMultiPayload();
        goto LABEL_12;
      }
    }
    else
    {
      if (EnumCaseMultiPayload != 2)
      {
        memcpy(a1, a2, *(void *)(*(void *)(v7 - 8) + 64));
LABEL_12:
        *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
        swift_bridgeObjectRetain();
        return a1;
      }
      uint64_t v9 = sub_10005C3D0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
      uint64_t v10 = *(int *)(type metadata accessor for CRLSEBoardIdentifierStorage(0) + 20);
      uint64_t v11 = (uint64_t *)((char *)a1 + v10);
      uint64_t v12 = (uint64_t *)((char *)a2 + v10);
      uint64_t v13 = v12[1];
      void *v11 = *v12;
      v11[1] = v13;
      swift_bridgeObjectRetain();
      uint64_t v14 = (int *)sub_1000131E0(&qword_10007D1D0);
      uint64_t v15 = v14[12];
      uint64_t v16 = (uint64_t *)((char *)a1 + v15);
      uint64_t v17 = (uint64_t *)((char *)a2 + v15);
      uint64_t v18 = v17[1];
      void *v16 = *v17;
      v16[1] = v18;
      *((unsigned char *)a1 + v14[16]) = *((unsigned char *)a2 + v14[16]);
      uint64_t v19 = v14[20];
      __dst = (char *)a1 + v19;
      uint64_t v20 = (char *)a2 + v19;
      uint64_t v21 = sub_10005C390();
      uint64_t v22 = *(void *)(v21 - 8);
      uint64_t v23 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48);
      swift_bridgeObjectRetain();
      if (v23(v20, 1, v21)) {
        goto LABEL_8;
      }
    }
    (*(void (**)(char *, char *, uint64_t))(v22 + 16))(__dst, v20, v21);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(__dst, 0, 1, v21);
    goto LABEL_11;
  }
  uint64_t v24 = *a2;
  *a1 = *a2;
  a1 = (uint64_t *)(v24 + ((v5 + 16) & ~(unint64_t)v5));
  swift_retain();
  return a1;
}

uint64_t sub_100015140(uint64_t a1)
{
  type metadata accessor for CRLSELibraryViewModel.Item(0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 3)
  {
    uint64_t v6 = sub_10005C3D0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(a1, v6);
    uint64_t v7 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
    swift_bridgeObjectRelease();
    uint64_t v5 = *(int *)(v7 + 64);
  }
  else
  {
    if (EnumCaseMultiPayload != 2) {
      goto LABEL_7;
    }
    uint64_t v3 = sub_10005C3D0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
    type metadata accessor for CRLSEBoardIdentifierStorage(0);
    swift_bridgeObjectRelease();
    uint64_t v4 = sub_1000131E0(&qword_10007D1D0);
    swift_bridgeObjectRelease();
    uint64_t v5 = *(int *)(v4 + 80);
  }
  uint64_t v8 = a1 + v5;
  uint64_t v9 = sub_10005C390();
  uint64_t v10 = *(void *)(v9 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9)) {
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  }
LABEL_7:

  return swift_bridgeObjectRelease();
}

unsigned char *sub_1000152FC(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 3)
  {
    uint64_t v25 = sub_10005C3D0();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v25 - 8) + 16))(a1, a2, v25);
    uint64_t v26 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
    uint64_t v27 = *(int *)(v26 + 48);
    uint64_t v28 = &a1[v27];
    uint64_t v29 = &a2[v27];
    uint64_t v30 = v29[1];
    *uint64_t v28 = *v29;
    v28[1] = v30;
    uint64_t v31 = *(int *)(v26 + 64);
    v32 = &a1[v31];
    uint64_t v33 = &a2[v31];
    uint64_t v34 = sub_10005C390();
    uint64_t v35 = *(void *)(v34 - 8);
    uint64_t v36 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48);
    swift_bridgeObjectRetain();
    if (v36(v33, 1, v34))
    {
      uint64_t v37 = sub_1000131E0((uint64_t *)&unk_10007D850);
      memcpy(v32, v33, *(void *)(*(void *)(v37 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v32, v33, v34);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v35 + 56))(v32, 0, 1, v34);
    }
    swift_storeEnumTagMultiPayload();
  }
  else if (EnumCaseMultiPayload == 2)
  {
    uint64_t v39 = a3;
    uint64_t v8 = sub_10005C3D0();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
    uint64_t v9 = *(int *)(type metadata accessor for CRLSEBoardIdentifierStorage(0) + 20);
    uint64_t v10 = &a1[v9];
    uint64_t v11 = &a2[v9];
    uint64_t v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    swift_bridgeObjectRetain();
    uint64_t v13 = (int *)sub_1000131E0(&qword_10007D1D0);
    uint64_t v14 = v13[12];
    uint64_t v15 = &a1[v14];
    uint64_t v16 = &a2[v14];
    uint64_t v17 = v16[1];
    void *v15 = *v16;
    v15[1] = v17;
    a1[v13[16]] = a2[v13[16]];
    uint64_t v18 = v13[20];
    uint64_t v19 = &a1[v18];
    uint64_t v20 = &a2[v18];
    uint64_t v21 = sub_10005C390();
    uint64_t v22 = *(void *)(v21 - 8);
    uint64_t v23 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48);
    swift_bridgeObjectRetain();
    if (v23(v20, 1, v21))
    {
      uint64_t v24 = sub_1000131E0((uint64_t *)&unk_10007D850);
      memcpy(v19, v20, *(void *)(*(void *)(v24 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v22 + 16))(v19, v20, v21);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
    }
    a3 = v39;
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  swift_bridgeObjectRetain();
  return a1;
}

unsigned char *sub_100015684(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100016DA0((uint64_t)a1, type metadata accessor for CRLSELibraryViewModel.Item);
    uint64_t v6 = type metadata accessor for CRLSELibraryViewModel.Item(0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 3)
    {
      uint64_t v21 = sub_10005C3D0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v21 - 8) + 16))(a1, a2, v21);
      uint64_t v22 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
      uint64_t v23 = *(int *)(v22 + 48);
      uint64_t v24 = &a1[v23];
      uint64_t v25 = &a2[v23];
      *uint64_t v24 = *v25;
      v24[1] = v25[1];
      uint64_t v26 = *(int *)(v22 + 64);
      __dst = &a1[v26];
      uint64_t v17 = &a2[v26];
      uint64_t v18 = sub_10005C390();
      uint64_t v19 = *(void *)(v18 - 8);
      uint64_t v27 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48);
      swift_bridgeObjectRetain();
      if (v27(v17, 1, v18))
      {
LABEL_7:
        uint64_t v28 = sub_1000131E0((uint64_t *)&unk_10007D850);
        memcpy(__dst, v17, *(void *)(*(void *)(v28 - 8) + 64));
LABEL_10:
        swift_storeEnumTagMultiPayload();
        goto LABEL_11;
      }
LABEL_9:
      (*(void (**)(char *, char *, uint64_t))(v19 + 16))(__dst, v17, v18);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(__dst, 0, 1, v18);
      goto LABEL_10;
    }
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v8 = sub_10005C3D0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v8 - 8) + 16))(a1, a2, v8);
      uint64_t v9 = *(int *)(type metadata accessor for CRLSEBoardIdentifierStorage(0) + 20);
      uint64_t v10 = &a1[v9];
      uint64_t v11 = &a2[v9];
      *uint64_t v10 = *v11;
      v10[1] = v11[1];
      swift_bridgeObjectRetain();
      uint64_t v12 = (int *)sub_1000131E0(&qword_10007D1D0);
      uint64_t v13 = v12[12];
      uint64_t v14 = &a1[v13];
      uint64_t v15 = &a2[v13];
      *uint64_t v14 = *v15;
      v14[1] = v15[1];
      a1[v12[16]] = a2[v12[16]];
      uint64_t v16 = v12[20];
      __dst = &a1[v16];
      uint64_t v17 = &a2[v16];
      uint64_t v18 = sub_10005C390();
      uint64_t v19 = *(void *)(v18 - 8);
      uint64_t v20 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48);
      swift_bridgeObjectRetain();
      if (v20(v17, 1, v18)) {
        goto LABEL_7;
      }
      goto LABEL_9;
    }
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
LABEL_11:
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

unsigned char *sub_100015A50(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 3)
  {
    uint64_t v16 = sub_10005C3D0();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v16 - 8) + 32))(a1, a2, v16);
    uint64_t v17 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
    *(_OWORD *)&a1[*(int *)(v17 + 48)] = *(_OWORD *)&a2[*(int *)(v17 + 48)];
    uint64_t v18 = *(int *)(v17 + 64);
    uint64_t v12 = &a1[v18];
    uint64_t v13 = &a2[v18];
    uint64_t v14 = sub_10005C390();
    uint64_t v15 = *(void *)(v14 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
    {
LABEL_6:
      uint64_t v19 = sub_1000131E0((uint64_t *)&unk_10007D850);
      memcpy(v12, v13, *(void *)(*(void *)(v19 - 8) + 64));
LABEL_9:
      swift_storeEnumTagMultiPayload();
      goto LABEL_10;
    }
LABEL_8:
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v12, v13, v14);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
    goto LABEL_9;
  }
  if (EnumCaseMultiPayload == 2)
  {
    uint64_t v8 = sub_10005C3D0();
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
    uint64_t v9 = type metadata accessor for CRLSEBoardIdentifierStorage(0);
    *(_OWORD *)&a1[*(int *)(v9 + 20)] = *(_OWORD *)&a2[*(int *)(v9 + 20)];
    uint64_t v10 = (int *)sub_1000131E0(&qword_10007D1D0);
    *(_OWORD *)&a1[v10[12]] = *(_OWORD *)&a2[v10[12]];
    a1[v10[16]] = a2[v10[16]];
    uint64_t v11 = v10[20];
    uint64_t v12 = &a1[v11];
    uint64_t v13 = &a2[v11];
    uint64_t v14 = sub_10005C390();
    uint64_t v15 = *(void *)(v14 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14)) {
      goto LABEL_6;
    }
    goto LABEL_8;
  }
  memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
LABEL_10:
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  return a1;
}

unsigned char *sub_100015D84(unsigned char *a1, unsigned char *a2, uint64_t a3)
{
  if (a1 != a2)
  {
    sub_100016DA0((uint64_t)a1, type metadata accessor for CRLSELibraryViewModel.Item);
    uint64_t v6 = type metadata accessor for CRLSELibraryViewModel.Item(0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    if (EnumCaseMultiPayload == 3)
    {
      uint64_t v16 = sub_10005C3D0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v16 - 8) + 32))(a1, a2, v16);
      uint64_t v17 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
      *(_OWORD *)&a1[*(int *)(v17 + 48)] = *(_OWORD *)&a2[*(int *)(v17 + 48)];
      uint64_t v18 = *(int *)(v17 + 64);
      uint64_t v12 = &a1[v18];
      uint64_t v13 = &a2[v18];
      uint64_t v14 = sub_10005C390();
      uint64_t v15 = *(void *)(v14 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
      {
LABEL_7:
        uint64_t v19 = sub_1000131E0((uint64_t *)&unk_10007D850);
        memcpy(v12, v13, *(void *)(*(void *)(v19 - 8) + 64));
LABEL_10:
        swift_storeEnumTagMultiPayload();
        goto LABEL_11;
      }
LABEL_9:
      (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v12, v13, v14);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
      goto LABEL_10;
    }
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v8 = sub_10005C3D0();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(*(void *)(v8 - 8) + 32))(a1, a2, v8);
      uint64_t v9 = type metadata accessor for CRLSEBoardIdentifierStorage(0);
      *(_OWORD *)&a1[*(int *)(v9 + 20)] = *(_OWORD *)&a2[*(int *)(v9 + 20)];
      uint64_t v10 = (int *)sub_1000131E0(&qword_10007D1D0);
      *(_OWORD *)&a1[v10[12]] = *(_OWORD *)&a2[v10[12]];
      a1[v10[16]] = a2[v10[16]];
      uint64_t v11 = v10[20];
      uint64_t v12 = &a1[v11];
      uint64_t v13 = &a2[v11];
      uint64_t v14 = sub_10005C390();
      uint64_t v15 = *(void *)(v14 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14)) {
        goto LABEL_7;
      }
      goto LABEL_9;
    }
    memcpy(a1, a2, *(void *)(*(void *)(v6 - 8) + 64));
  }
LABEL_11:
  *(void *)&a1[*(int *)(a3 + 20)] = *(void *)&a2[*(int *)(a3 + 20)];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1000160E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000160F8);
}

uint64_t sub_1000160F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_1000161B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000161CC);
}

uint64_t sub_1000161CC(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = type metadata accessor for CRLSELibraryViewModel.Item(0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for CRLSELibraryViewModeItemNode(uint64_t a1)
{
  return sub_10001762C(a1, qword_10007CA68);
}

uint64_t sub_1000162A8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000162CC(a1, a2, a3, type metadata accessor for CRLSELibraryViewModel.Item);
}

uint64_t sub_1000162CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t result = a4(319);
  if (v5 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

__n128 sub_100016360(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100016370(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100016390(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

uint64_t *sub_1000163CC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for CRLSEBoardIdentifier(0);
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = sub_1000131E0(&qword_10007D8B0);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      uint64_t v11 = sub_10005C3D0();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
      uint64_t v12 = *(int *)(type metadata accessor for CRLSEBoardIdentifierStorage(0) + 20);
      uint64_t v13 = (uint64_t *)((char *)a1 + v12);
      uint64_t v14 = (uint64_t *)((char *)a2 + v12);
      uint64_t v15 = v14[1];
      *uint64_t v13 = *v14;
      v13[1] = v15;
      uint64_t v16 = *(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56);
      swift_bridgeObjectRetain();
      v16(a1, 0, 1, v7);
    }
    uint64_t v17 = *(int *)(a3 + 20);
    uint64_t v18 = *(int *)(a3 + 24);
    uint64_t v19 = (uint64_t *)((char *)a1 + v17);
    uint64_t v20 = (uint64_t *)((char *)a2 + v17);
    uint64_t v21 = v20[1];
    void *v19 = *v20;
    v19[1] = v21;
    uint64_t v22 = (char *)a1 + v18;
    uint64_t v23 = (char *)a2 + v18;
    uint64_t v24 = sub_10005C3D0();
    uint64_t v25 = *(void *)(v24 - 8);
    uint64_t v26 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48);
    swift_bridgeObjectRetain();
    if (v26(v23, 1, v24))
    {
      uint64_t v27 = sub_1000131E0((uint64_t *)&unk_10007D8C0);
      memcpy(v22, v23, *(void *)(*(void *)(v27 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v25 + 16))(v22, v23, v24);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
    }
  }
  return a1;
}

uint64_t sub_10001666C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CRLSEBoardIdentifier(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48))(a1, 1, v4))
  {
    uint64_t v5 = sub_10005C3D0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8))(a1, v5);
    type metadata accessor for CRLSEBoardIdentifierStorage(0);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  uint64_t v6 = a1 + *(int *)(a2 + 24);
  uint64_t v7 = sub_10005C3D0();
  uint64_t v10 = *(void *)(v7 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v6, 1, v7);
  if (!result)
  {
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8);
    return v9(v6, v7);
  }
  return result;
}

char *sub_1000167D4(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for CRLSEBoardIdentifier(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_1000131E0(&qword_10007D8B0);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    uint64_t v9 = sub_10005C3D0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
    uint64_t v10 = *(int *)(type metadata accessor for CRLSEBoardIdentifierStorage(0) + 20);
    uint64_t v11 = &a1[v10];
    uint64_t v12 = &a2[v10];
    uint64_t v13 = *((void *)v12 + 1);
    *(void *)uint64_t v11 = *(void *)v12;
    *((void *)v11 + 1) = v13;
    uint64_t v14 = *(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56);
    swift_bridgeObjectRetain();
    v14(a1, 0, 1, v6);
  }
  uint64_t v15 = *(int *)(a3 + 20);
  uint64_t v16 = *(int *)(a3 + 24);
  uint64_t v17 = &a1[v15];
  uint64_t v18 = &a2[v15];
  uint64_t v19 = *((void *)v18 + 1);
  *(void *)uint64_t v17 = *(void *)v18;
  *((void *)v17 + 1) = v19;
  uint64_t v20 = &a1[v16];
  uint64_t v21 = &a2[v16];
  uint64_t v22 = sub_10005C3D0();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48);
  swift_bridgeObjectRetain();
  if (v24(v21, 1, v22))
  {
    uint64_t v25 = sub_1000131E0((uint64_t *)&unk_10007D8C0);
    memcpy(v20, v21, *(void *)(*(void *)(v25 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v23 + 16))(v20, v21, v22);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
  }
  return a1;
}

char *sub_100016A24(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for CRLSEBoardIdentifier(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      uint64_t v11 = sub_10005C3D0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 16))(a1, a2, v11);
      uint64_t v12 = *(int *)(type metadata accessor for CRLSEBoardIdentifierStorage(0) + 20);
      uint64_t v13 = &a1[v12];
      uint64_t v14 = &a2[v12];
      *(void *)uint64_t v13 = *(void *)v14;
      *((void *)v13 + 1) = *((void *)v14 + 1);
      uint64_t v15 = *(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56);
      swift_bridgeObjectRetain();
      v15(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    sub_100016DA0((uint64_t)a1, type metadata accessor for CRLSEBoardIdentifier);
LABEL_6:
    uint64_t v16 = sub_1000131E0(&qword_10007D8B0);
    memcpy(a1, a2, *(void *)(*(void *)(v16 - 8) + 64));
    goto LABEL_7;
  }
  uint64_t v30 = sub_10005C3D0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v30 - 8) + 24))(a1, a2, v30);
  uint64_t v31 = *(int *)(type metadata accessor for CRLSEBoardIdentifierStorage(0) + 20);
  v32 = &a1[v31];
  uint64_t v33 = &a2[v31];
  *(void *)v32 = *(void *)v33;
  *((void *)v32 + 1) = *((void *)v33 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_7:
  uint64_t v17 = *(int *)(a3 + 20);
  uint64_t v18 = &a1[v17];
  uint64_t v19 = &a2[v17];
  *(void *)uint64_t v18 = *(void *)v19;
  *((void *)v18 + 1) = *((void *)v19 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v20 = *(int *)(a3 + 24);
  uint64_t v21 = &a1[v20];
  uint64_t v22 = &a2[v20];
  uint64_t v23 = sub_10005C3D0();
  uint64_t v24 = *(void *)(v23 - 8);
  uint64_t v25 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v24 + 48);
  int v26 = v25(v21, 1, v23);
  int v27 = v25(v22, 1, v23);
  if (!v26)
  {
    if (!v27)
    {
      (*(void (**)(char *, char *, uint64_t))(v24 + 24))(v21, v22, v23);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v24 + 8))(v21, v23);
    goto LABEL_12;
  }
  if (v27)
  {
LABEL_12:
    uint64_t v28 = sub_1000131E0((uint64_t *)&unk_10007D8C0);
    memcpy(v21, v22, *(void *)(*(void *)(v28 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v21, v22, v23);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
  return a1;
}

uint64_t sub_100016DA0(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

char *sub_100016E00(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for CRLSEBoardIdentifier(0);
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_1000131E0(&qword_10007D8B0);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    uint64_t v9 = sub_10005C3D0();
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 32))(a1, a2, v9);
    uint64_t v10 = type metadata accessor for CRLSEBoardIdentifierStorage(0);
    *(_OWORD *)&a1[*(int *)(v10 + 20)] = *(_OWORD *)&a2[*(int *)(v10 + 20)];
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v11 = *(int *)(a3 + 24);
  *(_OWORD *)&a1[*(int *)(a3 + 20)] = *(_OWORD *)&a2[*(int *)(a3 + 20)];
  uint64_t v12 = &a1[v11];
  uint64_t v13 = &a2[v11];
  uint64_t v14 = sub_10005C3D0();
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    uint64_t v16 = sub_1000131E0((uint64_t *)&unk_10007D8C0);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v12, v13, v14);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  return a1;
}

char *sub_10001702C(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for CRLSEBoardIdentifier(0);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (v9)
  {
    if (!v10)
    {
      uint64_t v11 = sub_10005C3D0();
      (*(void (**)(char *, char *, uint64_t))(*(void *)(v11 - 8) + 32))(a1, a2, v11);
      uint64_t v12 = type metadata accessor for CRLSEBoardIdentifierStorage(0);
      *(_OWORD *)&a1[*(int *)(v12 + 20)] = *(_OWORD *)&a2[*(int *)(v12 + 20)];
      (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v10)
  {
    sub_100016DA0((uint64_t)a1, type metadata accessor for CRLSEBoardIdentifier);
LABEL_6:
    uint64_t v13 = sub_1000131E0(&qword_10007D8B0);
    memcpy(a1, a2, *(void *)(*(void *)(v13 - 8) + 64));
    goto LABEL_7;
  }
  uint64_t v29 = sub_10005C3D0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v29 - 8) + 40))(a1, a2, v29);
  uint64_t v30 = *(int *)(type metadata accessor for CRLSEBoardIdentifierStorage(0) + 20);
  uint64_t v31 = &a1[v30];
  v32 = &a2[v30];
  uint64_t v34 = *(void *)v32;
  uint64_t v33 = *((void *)v32 + 1);
  *(void *)uint64_t v31 = v34;
  *((void *)v31 + 1) = v33;
  swift_bridgeObjectRelease();
LABEL_7:
  uint64_t v14 = *(int *)(a3 + 20);
  uint64_t v15 = &a1[v14];
  uint64_t v16 = &a2[v14];
  uint64_t v18 = *(void *)v16;
  uint64_t v17 = *((void *)v16 + 1);
  *(void *)uint64_t v15 = v18;
  *((void *)v15 + 1) = v17;
  swift_bridgeObjectRelease();
  uint64_t v19 = *(int *)(a3 + 24);
  uint64_t v20 = &a1[v19];
  uint64_t v21 = &a2[v19];
  uint64_t v22 = sub_10005C3D0();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v23 + 48);
  int v25 = v24(v20, 1, v22);
  int v26 = v24(v21, 1, v22);
  if (!v25)
  {
    if (!v26)
    {
      (*(void (**)(char *, char *, uint64_t))(v23 + 40))(v20, v21, v22);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v23 + 8))(v20, v22);
    goto LABEL_12;
  }
  if (v26)
  {
LABEL_12:
    uint64_t v27 = sub_1000131E0((uint64_t *)&unk_10007D8C0);
    memcpy(v20, v21, *(void *)(*(void *)(v27 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v23 + 32))(v20, v21, v22);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
  return a1;
}

uint64_t sub_100017374(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100017388);
}

uint64_t sub_100017388(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000131E0(&qword_10007D8B0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else if (a2 == 0x7FFFFFFF)
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
  else
  {
    uint64_t v11 = sub_1000131E0((uint64_t *)&unk_10007D8C0);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a3 + 24);
    return v12(v14, a2, v13);
  }
}

uint64_t sub_1000174C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000174D4);
}

uint64_t sub_1000174D4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1000131E0(&qword_10007D8B0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else if (a3 == 0x7FFFFFFF)
  {
    *(void *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v11 = sub_1000131E0((uint64_t *)&unk_10007D8C0);
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = v11;
    uint64_t v14 = a1 + *(int *)(a4 + 24);
    return v12(v14, a2, a2, v13);
  }
  return result;
}

uint64_t type metadata accessor for CRLSEBoard(uint64_t a1)
{
  return sub_10001762C(a1, (uint64_t *)&unk_10007CB00);
}

uint64_t sub_10001762C(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100017664()
{
  sub_10001776C(319, &qword_10007CB10, (void (*)(uint64_t))type metadata accessor for CRLSEBoardIdentifier);
  if (v0 <= 0x3F)
  {
    sub_10001776C(319, (unint64_t *)&unk_10007CB18, (void (*)(uint64_t))&type metadata accessor for UUID);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_10001776C(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_10005CAB0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

uint64_t sub_1000177D0()
{
  if (*v0) {
    return 0x6E6572646C696863;
  }
  else {
    return 1835365481;
  }
}

uint64_t sub_100017804@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10001F8C4(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10001782C()
{
  return 0;
}

void sub_100017838(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_100017844(uint64_t a1)
{
  unint64_t v2 = sub_10001DE0C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100017880(uint64_t a1)
{
  unint64_t v2 = sub_10001DE0C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000178BC(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_1000131E0(&qword_10007CC98);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = &v10[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10001BB00(a1, a1[3]);
  sub_10001DE0C();
  sub_10005CEF0();
  char v12 = 0;
  type metadata accessor for CRLSELibraryViewModel.Item(0);
  sub_10001BAB8(&qword_10007CCA0, (void (*)(uint64_t))type metadata accessor for CRLSELibraryViewModel.Item);
  sub_10005CDA0();
  if (!v2)
  {
    uint64_t v11 = *(void *)(v3 + *(int *)(type metadata accessor for CRLSELibraryViewModeItemNode(0) + 20));
    v10[15] = 1;
    sub_1000131E0(&qword_10007CC88);
    sub_10001DEA8(&qword_10007CCA8, &qword_10007CCB0);
    sub_10005CDA0();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_100017ACC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v18 = a2;
  type metadata accessor for CRLSELibraryViewModel.Item(0);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000131E0(&qword_10007CC78);
  uint64_t v19 = *(void *)(v6 - 8);
  uint64_t v20 = v6;
  __chkstk_darwin();
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for CRLSELibraryViewModeItemNode(0);
  uint64_t v9 = __chkstk_darwin();
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = *(int *)(v9 + 28);
  *(void *)&v11[v21] = &_swiftEmptyArrayStorage;
  sub_10001BB00(a1, a1[3]);
  sub_10001DE0C();
  sub_10005CEE0();
  if (v2)
  {
    sub_10001BB98((uint64_t)a1);
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v12 = v19;
    char v24 = 0;
    sub_10001BAB8((unint64_t *)&unk_10007D890, (void (*)(uint64_t))type metadata accessor for CRLSELibraryViewModel.Item);
    uint64_t v13 = v20;
    sub_10005CD30();
    sub_10001BE48((uint64_t)v5, (uint64_t)v11, type metadata accessor for CRLSELibraryViewModel.Item);
    sub_1000131E0(&qword_10007CC88);
    char v23 = 1;
    sub_10001DEA8((unint64_t *)&qword_10007D8A0, &qword_10007CC90);
    sub_10005CD30();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v8, v13);
    uint64_t v15 = v21;
    uint64_t v14 = v22;
    swift_bridgeObjectRelease();
    *(void *)&v11[v15] = v14;
    sub_10001DCFC((uint64_t)v11, v18, type metadata accessor for CRLSELibraryViewModeItemNode);
    sub_10001BB98((uint64_t)a1);
    return sub_100016DA0((uint64_t)v11, type metadata accessor for CRLSELibraryViewModeItemNode);
  }
}

uint64_t sub_100017E44(void *a1)
{
  uint64_t v3 = sub_1000131E0(&qword_10007CC70);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10001BB00(a1, a1[3]);
  sub_10001DDB8();
  sub_10005CEF0();
  v8[15] = 0;
  sub_10005C3D0();
  sub_10001BAB8(&qword_10007CC08, (void (*)(uint64_t))&type metadata accessor for UUID);
  sub_10005CDA0();
  if (!v1)
  {
    type metadata accessor for CRLSEBoardIdentifierStorage(0);
    v8[14] = 1;
    sub_10005CD80();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_100017FFC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v23 = a2;
  uint64_t v4 = sub_10005C3D0();
  uint64_t v25 = *(void *)(v4 - 8);
  uint64_t v26 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_1000131E0(&qword_10007CC60);
  uint64_t v24 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  uint64_t v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for CRLSEBoardIdentifierStorage(0);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001BB00(a1, a1[3]);
  sub_10001DDB8();
  sub_10005CEE0();
  if (v2) {
    return sub_10001BB98((uint64_t)a1);
  }
  uint64_t v22 = v11;
  uint64_t v12 = v24;
  uint64_t v13 = v25;
  char v29 = 0;
  sub_10001BAB8(&qword_10007CBA0, (void (*)(uint64_t))&type metadata accessor for UUID);
  uint64_t v14 = v26;
  sub_10005CD30();
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v22, v6, v14);
  char v28 = 1;
  uint64_t v15 = sub_10005CD10();
  uint64_t v17 = v16;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v8, v27);
  uint64_t v19 = (uint64_t)v22;
  uint64_t v18 = v23;
  uint64_t v20 = (uint64_t *)&v22[*(int *)(v9 + 20)];
  uint64_t *v20 = v15;
  v20[1] = v17;
  sub_10001DCFC(v19, v18, type metadata accessor for CRLSEBoardIdentifierStorage);
  sub_10001BB98((uint64_t)a1);
  return sub_100016DA0(v19, type metadata accessor for CRLSEBoardIdentifierStorage);
}

uint64_t sub_100018344@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100017ACC(a1, a2);
}

uint64_t sub_10001835C(void *a1)
{
  return sub_1000178BC(a1);
}

uint64_t sub_100018374(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if ((sub_10001D61C(a1, a2) & 1) == 0) {
    return 0;
  }
  uint64_t v6 = *(int *)(a3 + 20);
  uint64_t v7 = *(void *)(a1 + v6);
  uint64_t v8 = *(void *)(a2 + v6);

  return sub_10001CEA8(v7, v8);
}

BOOL sub_1000183DC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_1000183F4()
{
  Swift::UInt v1 = *v0;
  sub_10005CE50();
  sub_10005CE60(v1);
  return sub_10005CE70();
}

void sub_10001843C()
{
  sub_10005CE60(*v0);
}

Swift::Int sub_100018468()
{
  Swift::UInt v1 = *v0;
  sub_10005CE50();
  sub_10005CE60(v1);
  return sub_10005CE70();
}

uint64_t sub_1000184AC()
{
  if (*v0) {
    return 0x6D614E72656E776FLL;
  }
  else {
    return 0x4955556472616F62;
  }
}

uint64_t sub_1000184F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10001F9A8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100018518(uint64_t a1)
{
  unint64_t v2 = sub_10001DDB8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100018554(uint64_t a1)
{
  unint64_t v2 = sub_10001DDB8();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100018590@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100017FFC(a1, a2);
}

uint64_t sub_1000185A8(void *a1)
{
  return sub_100017E44(a1);
}

uint64_t sub_1000185C0()
{
  return sub_10001BAB8(&qword_10007CB50, (void (*)(uint64_t))type metadata accessor for CRLSEBoardIdentifier);
}

uint64_t sub_100018608@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v13 = a2;
  uint64_t v4 = type metadata accessor for CRLSEBoardIdentifierStorage(0);
  __chkstk_darwin(v4);
  uint64_t v15 = (uint64_t)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000131E0(&qword_10007CC38);
  uint64_t v14 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for CRLSEBoardIdentifier(0);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v13 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001BB00(a1, a1[3]);
  sub_10001DD64();
  sub_10005CEE0();
  if (!v2)
  {
    sub_10001BAB8(&qword_10007CC48, (void (*)(uint64_t))type metadata accessor for CRLSEBoardIdentifierStorage);
    sub_10005CD30();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v6);
    sub_10001BE48(v15, (uint64_t)v11, type metadata accessor for CRLSEBoardIdentifierStorage);
    sub_10001BE48((uint64_t)v11, v13, type metadata accessor for CRLSEBoardIdentifier);
  }
  return sub_10001BB98((uint64_t)a1);
}

uint64_t sub_100018870()
{
  return 1;
}

void sub_10001887C()
{
}

uint64_t sub_1000188A8()
{
  return 0x656761726F7473;
}

uint64_t sub_1000188C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 0x656761726F7473 && a2 == 0xE700000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_10005CDF0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

void sub_100018958(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_100018964(uint64_t a1)
{
  unint64_t v2 = sub_10001DD64();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_1000189A0(uint64_t a1)
{
  unint64_t v2 = sub_10001DD64();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_1000189DC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100018608(a1, a2);
}

uint64_t sub_1000189F4(void *a1)
{
  uint64_t v2 = sub_1000131E0(&qword_10007CC50);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  char v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001BB00(a1, a1[3]);
  sub_10001DD64();
  sub_10005CEF0();
  type metadata accessor for CRLSEBoardIdentifierStorage(0);
  sub_10001BAB8(&qword_10007CC58, (void (*)(uint64_t))type metadata accessor for CRLSEBoardIdentifierStorage);
  sub_10005CDA0();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

Swift::Int sub_100018B6C()
{
  return sub_10005CE70();
}

uint64_t sub_100018C28()
{
  sub_10005C3D0();
  sub_10001BAB8((unint64_t *)&unk_10007D930, (void (*)(uint64_t))&type metadata accessor for UUID);
  sub_10005C7A0();
  type metadata accessor for CRLSEBoardIdentifierStorage(0);
  swift_bridgeObjectRetain();
  sub_10005C850();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100018CE0()
{
  return sub_10005CE70();
}

void sub_100018D98()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10005C3D0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  char v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for CRLSEBoardIdentifier(0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  __chkstk_darwin(v9);
  uint64_t v11 = (unsigned __int8 *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001DCFC(v1, (uint64_t)v11, type metadata accessor for CRLSELibraryViewModel.Item);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 2u:
      uint64_t v12 = sub_1000131E0(&qword_10007D1D0);
      swift_bridgeObjectRelease();
      uint64_t v13 = &v11[*(int *)(v12 + 80)];
      sub_10001BE48((uint64_t)v11, (uint64_t)v8, type metadata accessor for CRLSEBoardIdentifier);
      sub_10001BAB8((unint64_t *)&unk_10007D930, (void (*)(uint64_t))&type metadata accessor for UUID);
      sub_10005C7A0();
      type metadata accessor for CRLSEBoardIdentifierStorage(0);
      swift_bridgeObjectRetain();
      sub_10005C850();
      swift_bridgeObjectRelease();
      sub_100016DA0((uint64_t)v8, type metadata accessor for CRLSEBoardIdentifier);
      uint64_t v14 = (uint64_t)v13;
      goto LABEL_5;
    case 3u:
      uint64_t v15 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
      swift_bridgeObjectRelease();
      uint64_t v16 = &v11[*(int *)(v15 + 64)];
      (*(void (**)(char *, unsigned __int8 *, uint64_t))(v3 + 32))(v5, v11, v2);
      sub_10001BAB8((unint64_t *)&unk_10007D930, (void (*)(uint64_t))&type metadata accessor for UUID);
      sub_10005C7A0();
      (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
      uint64_t v14 = (uint64_t)v16;
LABEL_5:
      sub_10001E8C0(v14, (uint64_t *)&unk_10007D850);
      break;
    default:
      sub_10005CE60(*v11);
      break;
  }
}

uint64_t sub_1000190F4()
{
  uint64_t v1 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  __chkstk_darwin(v1);
  uint64_t v3 = (char *)&v10 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001DCFC(v0, (uint64_t)v3, type metadata accessor for CRLSELibraryViewModel.Item);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      uint64_t v4 = sub_100019490();
      goto LABEL_6;
    case 2u:
      uint64_t v5 = sub_1000131E0(&qword_10007D1D0);
      uint64_t v6 = *(void *)&v3[*(int *)(v5 + 48)];
      sub_10001E8C0((uint64_t)&v3[*(int *)(v5 + 80)], (uint64_t *)&unk_10007D850);
      sub_100016DA0((uint64_t)v3, type metadata accessor for CRLSEBoardIdentifier);
      break;
    case 3u:
      uint64_t v7 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
      uint64_t v6 = *(void *)&v3[*(int *)(v7 + 48)];
      sub_10001E8C0((uint64_t)&v3[*(int *)(v7 + 64)], (uint64_t *)&unk_10007D850);
      uint64_t v8 = sub_10005C3D0();
      (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v3, v8);
      break;
    default:
      uint64_t v4 = sub_1000192A0();
LABEL_6:
      uint64_t v6 = v4;
      break;
  }
  return v6;
}

uint64_t sub_1000192A0()
{
  type metadata accessor for CRLSEExtensionContextManager();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = [self bundleForClass:ObjCClassFromMetadata];
  NSString v2 = sub_10005C7D0();
  NSString v3 = sub_10005C7D0();
  NSString v4 = sub_10005C7D0();
  id v5 = [v1 localizedStringForKey:v2 value:v3 table:v4];

  uint64_t v6 = sub_10005C810();
  return v6;
}

uint64_t sub_100019490()
{
  type metadata accessor for CRLSEExtensionContextManager();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = [self bundleForClass:ObjCClassFromMetadata];
  NSString v2 = sub_10005C7D0();
  NSString v3 = sub_10005C7D0();
  NSString v4 = sub_10005C7D0();
  id v5 = [v1 localizedStringForKey:v2 value:v3 table:v4];

  uint64_t v6 = sub_10005C810();
  return v6;
}

unint64_t sub_10001978C()
{
  uint64_t v1 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  __chkstk_darwin(v1);
  NSString v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001DCFC(v0, (uint64_t)v3, type metadata accessor for CRLSELibraryViewModel.Item);
  unsigned int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  unint64_t v5 = EnumCaseMultiPayload;
  switch(EnumCaseMultiPayload)
  {
    case 1u:
      uint64_t v9 = self;
      NSString v10 = sub_10005C7D0();
      swift_bridgeObjectRelease();
      unint64_t v5 = (unint64_t)[v9 systemImageNamed:v10];

      break;
    case 2u:
      uint64_t v6 = sub_1000131E0(&qword_10007D1D0);
      swift_bridgeObjectRelease();
      sub_10001E8C0((uint64_t)&v3[*(int *)(v6 + 80)], (uint64_t *)&unk_10007D850);
      sub_100016DA0((uint64_t)v3, type metadata accessor for CRLSEBoardIdentifier);
      goto LABEL_4;
    case 3u:
      uint64_t v7 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
      swift_bridgeObjectRelease();
      sub_10001E8C0((uint64_t)&v3[*(int *)(v7 + 64)], (uint64_t *)&unk_10007D850);
      uint64_t v8 = sub_10005C3D0();
      (*(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8))(v3, v8);
LABEL_4:
      unint64_t v5 = 0;
      break;
    default:
      return v5;
  }
  return v5;
}

id sub_100019A18(char a1)
{
  id v1 = [self *(&off_100073090)[a1]];

  return v1;
}

uint64_t sub_100019A6C(void *a1)
{
  uint64_t v69 = sub_1000131E0(&qword_10007CBE0);
  uint64_t v60 = *(void *)(v69 - 8);
  __chkstk_darwin(v69);
  v68 = (char *)&v58 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10005C3D0();
  uint64_t v72 = *(void *)(v3 - 8);
  uint64_t v73 = v3;
  __chkstk_darwin(v3);
  v71 = (char *)&v58 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = sub_1000131E0(&qword_10007CBE8);
  uint64_t v59 = *(void *)(v67 - 8);
  __chkstk_darwin(v67);
  v65 = (char *)&v58 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000131E0((uint64_t *)&unk_10007D850);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v74 = (uint64_t)&v58 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v70 = (uint64_t)&v58 - v9;
  uint64_t v64 = type metadata accessor for CRLSEBoardIdentifier(0);
  __chkstk_darwin(v64);
  uint64_t v66 = (uint64_t)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000131E0(&qword_10007CBF0);
  uint64_t v62 = *(void *)(v11 - 8);
  uint64_t v63 = v11;
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v58 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1000131E0(&qword_10007CBF8);
  uint64_t v61 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v58 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  __chkstk_darwin(v17);
  uint64_t v19 = (char *)&v58 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = sub_1000131E0(&qword_10007CC00);
  uint64_t v75 = *(void *)(v79 - 8);
  __chkstk_darwin(v79);
  uint64_t v21 = (char *)&v58 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001BB00(a1, a1[3]);
  sub_10001BB44();
  v78 = v21;
  sub_10005CEF0();
  sub_10001DCFC(v77, (uint64_t)v19, type metadata accessor for CRLSELibraryViewModel.Item);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      char v26 = *v19;
      char v83 = 1;
      sub_10001BC90();
      char v28 = v78;
      uint64_t v27 = v79;
      sub_10005CD50();
      char v82 = v26;
      sub_10001BEB0();
      uint64_t v29 = v63;
      sub_10005CDA0();
      (*(void (**)(char *, uint64_t))(v62 + 8))(v13, v29);
      goto LABEL_9;
    case 2u:
      uint64_t v30 = (int *)sub_1000131E0(&qword_10007D1D0);
      uint64_t v77 = *(void *)&v19[v30[12]];
      LODWORD(v74) = v19[v30[16]];
      uint64_t v31 = (uint64_t)&v19[v30[20]];
      uint64_t v32 = v66;
      sub_10001BE48((uint64_t)v19, v66, type metadata accessor for CRLSEBoardIdentifier);
      uint64_t v33 = v70;
      sub_10001BDE0(v31, v70);
      char v88 = 2;
      sub_10001BC3C();
      uint64_t v34 = v65;
      char v28 = v78;
      uint64_t v27 = v79;
      sub_10005CD50();
      char v87 = 0;
      sub_10001BAB8(&qword_10007CC18, (void (*)(uint64_t))type metadata accessor for CRLSEBoardIdentifier);
      uint64_t v35 = v67;
      uint64_t v36 = v76;
      sub_10005CDA0();
      if (v36)
      {
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v59 + 8))(v34, v35);
        sub_10001E8C0(v33, (uint64_t *)&unk_10007D850);
        sub_100016DA0(v32, type metadata accessor for CRLSEBoardIdentifier);
LABEL_9:
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v75 + 8))(v28, v27);
      }
      else
      {
        char v86 = 1;
        sub_10005CD80();
        swift_bridgeObjectRelease();
        char v85 = 2;
        sub_10005CD90();
        uint64_t v51 = v70;
        char v84 = 3;
        sub_10005C390();
        sub_10001BAB8(&qword_10007CC10, (void (*)(uint64_t))&type metadata accessor for Date);
        sub_10005CD70();
        (*(void (**)(char *, uint64_t))(v59 + 8))(v34, v35);
        sub_10001E8C0(v51, (uint64_t *)&unk_10007D850);
        sub_100016DA0(v32, type metadata accessor for CRLSEBoardIdentifier);
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v75 + 8))(v28, v27);
      }
      break;
    case 3u:
      uint64_t v37 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
      id v38 = (uint64_t *)&v19[*(int *)(v37 + 48)];
      uint64_t v40 = *v38;
      uint64_t v39 = v38[1];
      uint64_t v70 = v40;
      uint64_t v77 = v39;
      uint64_t v41 = (uint64_t)&v19[*(int *)(v37 + 64)];
      v43 = v71;
      uint64_t v42 = v72;
      uint64_t v44 = v73;
      (*(void (**)(char *, char *, uint64_t))(v72 + 32))(v71, v19, v73);
      sub_10001BDE0(v41, v74);
      char v92 = 3;
      sub_10001BBE8();
      uint64_t v45 = v68;
      long long v47 = v78;
      uint64_t v46 = v79;
      sub_10005CD50();
      char v91 = 0;
      sub_10001BAB8(&qword_10007CC08, (void (*)(uint64_t))&type metadata accessor for UUID);
      uint64_t v48 = v69;
      uint64_t v49 = v76;
      sub_10005CDA0();
      if (v49)
      {
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v60 + 8))(v45, v48);
        sub_10001E8C0(v74, (uint64_t *)&unk_10007D850);
        (*(void (**)(char *, uint64_t))(v42 + 8))(v43, v44);
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v75 + 8))(v47, v46);
      }
      else
      {
        char v90 = 1;
        long long v50 = v45;
        sub_10005CD80();
        swift_bridgeObjectRelease();
        char v89 = 2;
        sub_10005C390();
        sub_10001BAB8(&qword_10007CC10, (void (*)(uint64_t))&type metadata accessor for Date);
        uint64_t v52 = v74;
        sub_10005CD70();
        v54 = v78;
        uint64_t v53 = v79;
        uint64_t v56 = v72;
        uint64_t v55 = v73;
        v57 = v71;
        (*(void (**)(char *, uint64_t))(v60 + 8))(v50, v48);
        sub_10001E8C0(v52, (uint64_t *)&unk_10007D850);
        (*(void (**)(char *, uint64_t))(v56 + 8))(v57, v55);
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v75 + 8))(v54, v53);
      }
      break;
    default:
      char v22 = *v19;
      char v81 = 0;
      sub_10001BD38();
      uint64_t v24 = v78;
      uint64_t v23 = v79;
      sub_10005CD50();
      char v80 = v22;
      sub_10001BF04();
      sub_10005CDA0();
      (*(void (**)(char *, uint64_t))(v61 + 8))(v16, v14);
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v75 + 8))(v24, v23);
      break;
  }
  return result;
}

uint64_t sub_10001A5F0@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v81 = a2;
  uint64_t v74 = sub_1000131E0(&qword_10007CB60);
  uint64_t v68 = *(void *)(v74 - 8);
  __chkstk_darwin(v74);
  char v80 = (char *)&v64 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v82 = sub_1000131E0(&qword_10007CB68);
  uint64_t v73 = *(void *)(v82 - 8);
  __chkstk_darwin(v82);
  uint64_t v79 = (char *)&v64 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000131E0(&qword_10007CB70);
  uint64_t v71 = *(void *)(v5 - 8);
  uint64_t v72 = v5;
  __chkstk_darwin(v5);
  uint64_t v76 = (uint64_t *)((char *)&v64 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = sub_1000131E0(&qword_10007CB78);
  uint64_t v69 = *(void *)(v7 - 8);
  uint64_t v70 = v7;
  __chkstk_darwin(v7);
  uint64_t v75 = (char *)&v64 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v83 = sub_1000131E0(&qword_10007CB80);
  uint64_t v78 = *(void *)(v83 - 8);
  __chkstk_darwin(v83);
  uint64_t v10 = (char *)&v64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  uint64_t v11 = __chkstk_darwin(v77);
  uint64_t v13 = (char *)&v64 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v16 = (char *)&v64 - v15;
  uint64_t v17 = __chkstk_darwin(v14);
  uint64_t v19 = (char *)&v64 - v18;
  uint64_t v20 = __chkstk_darwin(v17);
  char v22 = (char *)&v64 - v21;
  __chkstk_darwin(v20);
  uint64_t v24 = (char *)&v64 - v23;
  uint64_t v25 = a1[3];
  char v84 = a1;
  sub_10001BB00(a1, v25);
  sub_10001BB44();
  char v26 = v85;
  sub_10005CEE0();
  if (v26) {
    return sub_10001BB98((uint64_t)v84);
  }
  uint64_t v64 = v22;
  v65 = v19;
  uint64_t v66 = v24;
  uint64_t v67 = v13;
  char v85 = v16;
  uint64_t v27 = v79;
  char v28 = v80;
  uint64_t v29 = v81;
  uint64_t v30 = v83;
  uint64_t v31 = sub_10005CD40();
  uint64_t v32 = v31;
  if (*(void *)(v31 + 16) != 1)
  {
    uint64_t v37 = sub_10005CC10();
    swift_allocError();
    uint64_t v39 = v38;
    sub_1000131E0(&qword_10007CB90);
    uint64_t *v39 = v77;
    sub_10005CCE0();
    sub_10005CC00();
    (*(void (**)(uint64_t *, void, uint64_t))(*(void *)(v37 - 8) + 104))(v39, enum case for DecodingError.typeMismatch(_:), v37);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v78 + 8))(v10, v30);
    return sub_10001BB98((uint64_t)v84);
  }
  switch(*(unsigned char *)(v31 + 32))
  {
    case 1:
      uint64_t v33 = v29;
      char v89 = 1;
      sub_10001BC90();
      uint64_t v40 = (char *)v76;
      sub_10005CCD0();
      sub_10001BCE4();
      uint64_t v41 = v72;
      sub_10005CD30();
      (*(void (**)(char *, uint64_t))(v71 + 8))(v40, v41);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v78 + 8))(v10, v30);
      uint64_t v36 = (uint64_t)v65;
      unsigned char *v65 = v88;
      goto LABEL_7;
    case 2:
      char v94 = 2;
      sub_10001BC3C();
      sub_10005CCD0();
      type metadata accessor for CRLSEBoardIdentifier(0);
      char v93 = 0;
      sub_10001BAB8(&qword_10007CBB8, (void (*)(uint64_t))type metadata accessor for CRLSEBoardIdentifier);
      sub_10005CD30();
      uint64_t v46 = v78;
      char v92 = 1;
      uint64_t v51 = sub_10005CD10();
      uint64_t v53 = v52;
      char v80 = (char *)sub_1000131E0(&qword_10007D1D0);
      v54 = (uint64_t *)&v85[*((int *)v80 + 12)];
      uint64_t *v54 = v51;
      v54[1] = v53;
      char v91 = 2;
      char v55 = sub_10005CD20();
      uint64_t v76 = v54;
      uint64_t v62 = (uint64_t)v85;
      v85[*((int *)v80 + 16)] = v55 & 1;
      sub_10005C390();
      char v90 = 3;
      sub_10001BAB8(&qword_10007CBA8, (void (*)(uint64_t))&type metadata accessor for Date);
      sub_10005CD00();
      (*(void (**)(char *, uint64_t))(v73 + 8))(v27, v82);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v46 + 8))(v10, v83);
      swift_storeEnumTagMultiPayload();
      uint64_t v42 = (uint64_t)v66;
      sub_10001BE48(v62, (uint64_t)v66, type metadata accessor for CRLSELibraryViewModel.Item);
      uint64_t v43 = (uint64_t)v84;
      goto LABEL_12;
    case 3:
      char v98 = 3;
      sub_10001BBE8();
      sub_10005CCD0();
      char v85 = (char *)v32;
      sub_10005C3D0();
      char v97 = 0;
      sub_10001BAB8(&qword_10007CBA0, (void (*)(uint64_t))&type metadata accessor for UUID);
      long long v47 = v28;
      sub_10005CD30();
      uint64_t v48 = v78;
      char v96 = 1;
      uint64_t v49 = sub_10005CD10();
      uint64_t v50 = v68;
      uint64_t v56 = v49;
      uint64_t v58 = v57;
      uint64_t v59 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
      uint64_t v60 = (uint64_t *)&v67[*(int *)(v59 + 48)];
      uint64_t v79 = (char *)v60;
      uint64_t v82 = (uint64_t)&v67[*(int *)(v59 + 64)];
      *uint64_t v60 = v56;
      v60[1] = v58;
      sub_10005C390();
      char v95 = 2;
      sub_10001BAB8(&qword_10007CBA8, (void (*)(uint64_t))&type metadata accessor for Date);
      uint64_t v61 = v74;
      sub_10005CD00();
      (*(void (**)(char *, uint64_t))(v50 + 8))(v47, v61);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v48 + 8))(v10, v83);
      uint64_t v63 = (uint64_t)v67;
      swift_storeEnumTagMultiPayload();
      uint64_t v42 = (uint64_t)v66;
      sub_10001BE48(v63, (uint64_t)v66, type metadata accessor for CRLSELibraryViewModel.Item);
      uint64_t v43 = (uint64_t)v84;
LABEL_12:
      uint64_t v44 = v29;
      break;
    default:
      uint64_t v33 = v29;
      char v87 = 0;
      sub_10001BD38();
      uint64_t v34 = v75;
      sub_10005CCD0();
      sub_10001BD8C();
      uint64_t v35 = v70;
      sub_10005CD30();
      (*(void (**)(char *, uint64_t))(v69 + 8))(v34, v35);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v78 + 8))(v10, v30);
      uint64_t v36 = (uint64_t)v64;
      *uint64_t v64 = v86;
LABEL_7:
      swift_storeEnumTagMultiPayload();
      uint64_t v42 = (uint64_t)v66;
      sub_10001BE48(v36, (uint64_t)v66, type metadata accessor for CRLSELibraryViewModel.Item);
      uint64_t v43 = (uint64_t)v84;
      uint64_t v44 = v33;
      break;
  }
  sub_10001BE48(v42, v44, type metadata accessor for CRLSELibraryViewModel.Item);
  return sub_10001BB98(v43);
}

uint64_t sub_10001B424()
{
  uint64_t result = 0x6564496472616F62;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x656C746974;
      break;
    case 2:
      uint64_t result = 0x6465726168537369;
      break;
    case 3:
      uint64_t result = 0x746964457473616CLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10001B4C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10001FAAC(a1, a2);
  *a3 = result;
  return result;
}

void sub_10001B4E8(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_10001B4F4(uint64_t a1)
{
  unint64_t v2 = sub_10001BC3C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001B530(uint64_t a1)
{
  unint64_t v2 = sub_10001BC3C();

  return CodingKey.debugDescription.getter(a1, v2);
}

BOOL sub_10001B56C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_10001B580()
{
  uint64_t result = 0x7972617262696CLL;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x7265646C6F66;
      break;
    case 2:
      uint64_t result = 0x6472616F62;
      break;
    case 3:
      uint64_t result = 0x42676E69646E6570;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10001B610@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10001FC90(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10001B638(uint64_t a1)
{
  unint64_t v2 = sub_10001BB44();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001B674(uint64_t a1)
{
  unint64_t v2 = sub_10001BB44();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001B6B0()
{
  return 12383;
}

uint64_t sub_10001B6C0(uint64_t a1)
{
  unint64_t v2 = sub_10001BC90();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001B6FC(uint64_t a1)
{
  unint64_t v2 = sub_10001BC90();

  return CodingKey.debugDescription.getter(a1, v2);
}

Swift::Int sub_10001B738()
{
  return sub_10005CE70();
}

Swift::Int sub_10001B77C()
{
  return sub_10005CE70();
}

uint64_t sub_10001B7BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  if (a1 == 12383 && a2 == 0xE200000000000000)
  {
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = 0;
  }
  else
  {
    char v5 = sub_10005CDF0();
    uint64_t result = swift_bridgeObjectRelease();
    char v7 = v5 ^ 1;
  }
  *a3 = v7 & 1;
  return result;
}

uint64_t sub_10001B83C(uint64_t a1)
{
  unint64_t v2 = sub_10001BD38();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001B878(uint64_t a1)
{
  unint64_t v2 = sub_10001BD38();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001B8B4()
{
  uint64_t v1 = 0x656C746974;
  if (*v0 != 1) {
    uint64_t v1 = 0x746964457473616CLL;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x696669746E656469;
  }
}

uint64_t sub_10001B910@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10001FE54(a1, a2);
  *a3 = result;
  return result;
}

void sub_10001B938(unsigned char *a1@<X8>)
{
  *a1 = 3;
}

uint64_t sub_10001B944(uint64_t a1)
{
  unint64_t v2 = sub_10001BBE8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001B980(uint64_t a1)
{
  unint64_t v2 = sub_10001BBE8();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001B9BC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_10001A5F0(a1, a2);
}

uint64_t sub_10001B9D4(void *a1)
{
  return sub_100019A6C(a1);
}

Swift::Int sub_10001B9EC()
{
  return sub_10005CE70();
}

Swift::Int sub_10001BA30()
{
  return sub_10005CE70();
}

uint64_t sub_10001BA70()
{
  return sub_10001BAB8(&qword_10007CB58, (void (*)(uint64_t))type metadata accessor for CRLSELibraryViewModel.Item);
}

uint64_t sub_10001BAB8(unint64_t *a1, void (*a2)(uint64_t))
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

void *sub_10001BB00(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_10001BB44()
{
  unint64_t result = qword_10007CB88;
  if (!qword_10007CB88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CB88);
  }
  return result;
}

uint64_t sub_10001BB98(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_10001BBE8()
{
  unint64_t result = qword_10007CB98;
  if (!qword_10007CB98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CB98);
  }
  return result;
}

unint64_t sub_10001BC3C()
{
  unint64_t result = qword_10007CBB0;
  if (!qword_10007CBB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CBB0);
  }
  return result;
}

unint64_t sub_10001BC90()
{
  unint64_t result = qword_10007CBC0;
  if (!qword_10007CBC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CBC0);
  }
  return result;
}

unint64_t sub_10001BCE4()
{
  unint64_t result = qword_10007CBC8;
  if (!qword_10007CBC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CBC8);
  }
  return result;
}

unint64_t sub_10001BD38()
{
  unint64_t result = qword_10007CBD0;
  if (!qword_10007CBD0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CBD0);
  }
  return result;
}

unint64_t sub_10001BD8C()
{
  unint64_t result = qword_10007CBD8;
  if (!qword_10007CBD8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CBD8);
  }
  return result;
}

uint64_t sub_10001BDE0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000131E0((uint64_t *)&unk_10007D850);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001BE48(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_10001BEB0()
{
  unint64_t result = qword_10007CC20;
  if (!qword_10007CC20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CC20);
  }
  return result;
}

unint64_t sub_10001BF04()
{
  unint64_t result = qword_10007CC28;
  if (!qword_10007CC28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CC28);
  }
  return result;
}

uint64_t sub_10001BF58(void *a1, int a2)
{
  int v24 = a2;
  uint64_t v3 = sub_1000131E0(&qword_10007CEA0);
  uint64_t v22 = *(void *)(v3 - 8);
  uint64_t v23 = v3;
  __chkstk_darwin(v3);
  uint64_t v21 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000131E0(&qword_10007CEA8);
  uint64_t v19 = *(void *)(v5 - 8);
  uint64_t v20 = v5;
  __chkstk_darwin(v5);
  char v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000131E0(&qword_10007CEB0);
  uint64_t v18 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000131E0(&qword_10007CEB8);
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001BB00(a1, a1[3]);
  sub_100021204();
  sub_10005CEF0();
  if ((_BYTE)v24)
  {
    if (v24 == 1)
    {
      char v26 = 1;
      sub_1000212AC();
      sub_10005CD50();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v7, v20);
    }
    else
    {
      char v27 = 2;
      sub_100021258();
      uint64_t v15 = v21;
      sub_10005CD50();
      (*(void (**)(char *, uint64_t))(v22 + 8))(v15, v23);
    }
  }
  else
  {
    char v25 = 0;
    sub_100021300();
    sub_10005CD50();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v10, v8);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t sub_10001C2C4()
{
  uint64_t v1 = 0x6C61636F6CLL;
  if (*v0 != 1) {
    uint64_t v1 = 0x64756F6C4369;
  }
  if (*v0) {
    return v1;
  }
  else {
    return 0x6C616963657073;
  }
}

uint64_t sub_10001C318@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10001FFB8(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_10001C340(uint64_t a1)
{
  unint64_t v2 = sub_100021204();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001C37C(uint64_t a1)
{
  unint64_t v2 = sub_100021204();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001C3B8()
{
  return 0;
}

uint64_t sub_10001C3C4(uint64_t a1)
{
  unint64_t v2 = sub_100021258();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001C400(uint64_t a1)
{
  unint64_t v2 = sub_100021258();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001C43C(uint64_t a1)
{
  unint64_t v2 = sub_1000212AC();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001C478(uint64_t a1)
{
  unint64_t v2 = sub_1000212AC();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001C4B4(uint64_t a1)
{
  unint64_t v2 = sub_100021300();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001C4F0(uint64_t a1)
{
  unint64_t v2 = sub_100021300();

  return CodingKey.debugDescription.getter(a1, v2);
}

void *sub_10001C52C@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_100020100(a1);
  if (!v2) {
    *a2 = (_BYTE)result;
  }
  return result;
}

uint64_t sub_10001C558(void *a1)
{
  return sub_10001BF58(a1, *v1);
}

uint64_t sub_10001C574(void *a1, uint64_t a2)
{
  uint64_t v35 = a2;
  uint64_t v3 = sub_1000131E0(&qword_10007CE70);
  uint64_t v33 = *(void *)(v3 - 8);
  uint64_t v34 = v3;
  __chkstk_darwin(v3);
  uint64_t v32 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000131E0(&qword_10007CE78);
  uint64_t v30 = *(void *)(v5 - 8);
  uint64_t v31 = v5;
  __chkstk_darwin(v5);
  uint64_t v29 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000131E0(&qword_10007CE80);
  uint64_t v27 = *(void *)(v7 - 8);
  uint64_t v28 = v7;
  __chkstk_darwin(v7);
  char v26 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000131E0(&qword_10007CE88);
  uint64_t v24 = *(void *)(v9 - 8);
  uint64_t v25 = v9;
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000131E0(&qword_10007CE90);
  uint64_t v23 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1000131E0(&qword_10007CE98);
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v23 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10001BB00(a1, a1[3]);
  sub_10002100C();
  sub_10005CEF0();
  switch((char)v35)
  {
    case 1:
      char v37 = 1;
      sub_10002115C();
      sub_10005CD50();
      (*(void (**)(char *, uint64_t))(v24 + 8))(v11, v25);
      return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v15);
    case 2:
      char v38 = 2;
      sub_100021108();
      uint64_t v19 = v26;
      sub_10005CD50();
      uint64_t v21 = v27;
      uint64_t v20 = v28;
      goto LABEL_7;
    case 3:
      char v39 = 3;
      sub_1000210B4();
      uint64_t v19 = v29;
      sub_10005CD50();
      uint64_t v21 = v30;
      uint64_t v20 = v31;
      goto LABEL_7;
    case 4:
      char v40 = 4;
      sub_100021060();
      uint64_t v19 = v32;
      sub_10005CD50();
      uint64_t v21 = v33;
      uint64_t v20 = v34;
LABEL_7:
      (*(void (**)(char *, uint64_t))(v21 + 8))(v19, v20);
      break;
    default:
      char v36 = 0;
      sub_1000211B0();
      sub_10005CD50();
      (*(void (**)(char *, uint64_t))(v23 + 8))(v14, v12);
      break;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v15);
}

uint64_t sub_10001CA78(uint64_t a1)
{
  unint64_t v2 = sub_1000211B0();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001CAB4(uint64_t a1)
{
  unint64_t v2 = sub_1000211B0();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001CAF0()
{
  uint64_t result = 0x6472616F426C6C61;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x73746E65636572;
      break;
    case 2:
      uint64_t result = 0x657469726F766166;
      break;
    case 3:
      uint64_t result = 0x646572616873;
      break;
    case 4:
      uint64_t result = 0x796C746E65636572;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_10001CBA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100020670(a1, a2);
  *a3 = result;
  return result;
}

void sub_10001CBCC(unsigned char *a1@<X8>)
{
  *a1 = 5;
}

uint64_t sub_10001CBD8(uint64_t a1)
{
  unint64_t v2 = sub_10002100C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001CC14(uint64_t a1)
{
  unint64_t v2 = sub_10002100C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001CC50(uint64_t a1)
{
  unint64_t v2 = sub_100021108();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001CC8C(uint64_t a1)
{
  unint64_t v2 = sub_100021108();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001CCC8(uint64_t a1)
{
  unint64_t v2 = sub_100021060();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001CD04(uint64_t a1)
{
  unint64_t v2 = sub_100021060();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001CD40(uint64_t a1)
{
  unint64_t v2 = sub_10002115C();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001CD7C(uint64_t a1)
{
  unint64_t v2 = sub_10002115C();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001CDB8@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_10001CDE8(uint64_t a1)
{
  unint64_t v2 = sub_1000210B4();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10001CE24(uint64_t a1)
{
  unint64_t v2 = sub_1000210B4();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10001CE60@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t result = sub_1000208C4(a1);
  if (!v2) {
    *a2 = result;
  }
  return result;
}

uint64_t sub_10001CE8C(void *a1)
{
  return sub_10001C574(a1, *v1);
}

uint64_t sub_10001CEA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CRLSELibraryViewModeItemNode(0);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v10 = (char *)&v19 - v9;
  uint64_t v11 = *(void *)(a1 + 16);
  if (v11 != *(void *)(a2 + 16))
  {
LABEL_14:
    char v15 = 0;
    return v15 & 1;
  }
  if (v11 && a1 != a2)
  {
    unint64_t v12 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
    uint64_t v13 = *(void *)(v8 + 72);
    uint64_t v14 = v11 - 1;
    while (1)
    {
      sub_10001DCFC(a1 + v12, (uint64_t)v10, type metadata accessor for CRLSELibraryViewModeItemNode);
      sub_10001DCFC(a2 + v12, (uint64_t)v7, type metadata accessor for CRLSELibraryViewModeItemNode);
      if ((sub_10001D61C((uint64_t)v10, (uint64_t)v7) & 1) == 0) {
        break;
      }
      char v15 = sub_10001CEA8(*(void *)&v10[*(int *)(v4 + 20)], *(void *)&v7[*(int *)(v4 + 20)]);
      sub_100016DA0((uint64_t)v7, type metadata accessor for CRLSELibraryViewModeItemNode);
      sub_100016DA0((uint64_t)v10, type metadata accessor for CRLSELibraryViewModeItemNode);
      BOOL v17 = v14-- != 0;
      if (v15)
      {
        v12 += v13;
        if (v17) {
          continue;
        }
      }
      return v15 & 1;
    }
    sub_100016DA0((uint64_t)v7, type metadata accessor for CRLSELibraryViewModeItemNode);
    sub_100016DA0((uint64_t)v10, type metadata accessor for CRLSELibraryViewModeItemNode);
    goto LABEL_14;
  }
  char v15 = 1;
  return v15 & 1;
}

uint64_t sub_10001D090(uint64_t a1, uint64_t a2)
{
  return sub_10001D1FC(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_10001D0A8(uint64_t a1, id *a2)
{
  uint64_t result = sub_10005C7F0();
  *a2 = 0;
  return result;
}

uint64_t sub_10001D120(uint64_t a1, id *a2)
{
  char v3 = sub_10005C800();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_10001D1A0@<X0>(void *a1@<X8>)
{
  sub_10005C810();
  NSString v2 = sub_10005C7D0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_10001D1E4(uint64_t a1, uint64_t a2)
{
  return sub_10001D1FC(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_10001D1FC(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_10005C810();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_10001D240()
{
  sub_10005C810();
  sub_10005C850();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10001D294()
{
  sub_10005C810();
  sub_10005CE50();
  sub_10005C850();
  Swift::Int v0 = sub_10005CE70();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_10001D308()
{
  uint64_t v0 = sub_10005C810();
  uint64_t v2 = v1;
  if (v0 == sub_10005C810() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_10005CDF0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_10001D394@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_10005C7D0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_10001D3DC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10005C810();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_10001D408(uint64_t a1)
{
  uint64_t v2 = sub_10001BAB8(&qword_10007CEC0, type metadata accessor for URLResourceKey);
  uint64_t v3 = sub_10001BAB8(&qword_10007CEC8, type metadata accessor for URLResourceKey);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_10001D4C4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CRLSEBoardIdentifier(0);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v18 - v8;
  char v10 = sub_10005C3B0();
  sub_10001DCFC(a1, (uint64_t)v9, type metadata accessor for CRLSEBoardIdentifier);
  sub_10001DCFC(a2, (uint64_t)v7, type metadata accessor for CRLSEBoardIdentifier);
  if (v10)
  {
    uint64_t v11 = *(int *)(type metadata accessor for CRLSEBoardIdentifierStorage(0) + 20);
    uint64_t v12 = *(void *)&v9[v11];
    uint64_t v13 = *(void *)&v9[v11 + 8];
    uint64_t v14 = &v7[v11];
    if (v12 == *(void *)v14 && v13 == *((void *)v14 + 1)) {
      char v16 = 1;
    }
    else {
      char v16 = sub_10005CDF0();
    }
  }
  else
  {
    char v16 = 0;
  }
  sub_100016DA0((uint64_t)v7, type metadata accessor for CRLSEBoardIdentifier);
  sub_100016DA0((uint64_t)v9, type metadata accessor for CRLSEBoardIdentifier);
  return v16 & 1;
}

uint64_t sub_10001D61C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10005C3D0();
  uint64_t v65 = *(void *)(v4 - 8);
  uint64_t v66 = v4;
  uint64_t v5 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v60 = (char *)&v59 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v59 = (char *)&v59 - v7;
  uint64_t v8 = type metadata accessor for CRLSEBoardIdentifier(0);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v64 = (uint64_t)&v59 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v63 = (uint64_t)&v59 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v62 = (uint64_t)&v59 - v14;
  __chkstk_darwin(v13);
  uint64_t v61 = (uint64_t)&v59 - v15;
  uint64_t v16 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  uint64_t v17 = __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v59 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __chkstk_darwin(v17);
  uint64_t v22 = (char *)&v59 - v21;
  uint64_t v23 = __chkstk_darwin(v20);
  uint64_t v25 = (unsigned __int8 *)&v59 - v24;
  __chkstk_darwin(v23);
  uint64_t v27 = (unsigned __int8 *)&v59 - v26;
  uint64_t v28 = sub_1000131E0(&qword_10007CC30);
  uint64_t v29 = __chkstk_darwin(v28 - 8);
  uint64_t v31 = (char *)&v59 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = &v31[*(int *)(v29 + 56)];
  sub_10001DCFC(a1, (uint64_t)v31, type metadata accessor for CRLSELibraryViewModel.Item);
  sub_10001DCFC(a2, (uint64_t)v32, type metadata accessor for CRLSELibraryViewModel.Item);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_10001DCFC((uint64_t)v31, (uint64_t)v25, type metadata accessor for CRLSELibraryViewModel.Item);
      if (swift_getEnumCaseMultiPayload() != 1) {
        goto LABEL_16;
      }
      int v33 = *v25;
      goto LABEL_11;
    case 2u:
      sub_10001DCFC((uint64_t)v31, (uint64_t)v22, type metadata accessor for CRLSELibraryViewModel.Item);
      uint64_t v34 = sub_1000131E0(&qword_10007D1D0);
      swift_bridgeObjectRelease();
      uint64_t v35 = (uint64_t)&v22[*(int *)(v34 + 80)];
      if (swift_getEnumCaseMultiPayload() != 2)
      {
        sub_10001E8C0(v35, (uint64_t *)&unk_10007D850);
        sub_100016DA0((uint64_t)v22, type metadata accessor for CRLSEBoardIdentifier);
        goto LABEL_16;
      }
      swift_bridgeObjectRelease();
      uint64_t v36 = v61;
      sub_10001BE48((uint64_t)v22, v61, type metadata accessor for CRLSEBoardIdentifier);
      uint64_t v37 = v62;
      sub_10001BE48((uint64_t)v32, v62, type metadata accessor for CRLSEBoardIdentifier);
      char v38 = sub_10005C3B0();
      uint64_t v39 = v63;
      sub_10001DCFC(v36, v63, type metadata accessor for CRLSEBoardIdentifier);
      uint64_t v40 = v64;
      sub_10001DCFC(v37, v64, type metadata accessor for CRLSEBoardIdentifier);
      if (v38)
      {
        uint64_t v41 = *(int *)(type metadata accessor for CRLSEBoardIdentifierStorage(0) + 20);
        uint64_t v42 = *(void *)(v39 + v41);
        uint64_t v43 = *(void *)(v39 + v41 + 8);
        uint64_t v44 = (void *)(v40 + v41);
        if (v42 == *v44 && v43 == v44[1]) {
          char v45 = 1;
        }
        else {
          char v45 = sub_10005CDF0();
        }
      }
      else
      {
        char v45 = 0;
      }
      uint64_t v57 = (uint64_t)&v32[*(int *)(v34 + 80)];
      sub_100016DA0(v40, type metadata accessor for CRLSEBoardIdentifier);
      sub_100016DA0(v39, type metadata accessor for CRLSEBoardIdentifier);
      sub_100016DA0(v37, type metadata accessor for CRLSEBoardIdentifier);
      sub_100016DA0(v36, type metadata accessor for CRLSEBoardIdentifier);
      sub_10001E8C0(v57, (uint64_t *)&unk_10007D850);
      uint64_t v56 = v35;
      goto LABEL_20;
    case 3u:
      sub_10001DCFC((uint64_t)v31, (uint64_t)v19, type metadata accessor for CRLSELibraryViewModel.Item);
      uint64_t v46 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
      swift_bridgeObjectRelease();
      uint64_t v47 = (uint64_t)&v19[*(int *)(v46 + 64)];
      if (swift_getEnumCaseMultiPayload() == 3)
      {
        swift_bridgeObjectRelease();
        uint64_t v48 = (uint64_t)&v32[*(int *)(v46 + 64)];
        uint64_t v49 = v65;
        uint64_t v50 = *(void (**)(char *, char *, uint64_t))(v65 + 32);
        uint64_t v51 = v59;
        uint64_t v52 = v19;
        uint64_t v53 = v66;
        v50(v59, v52, v66);
        v54 = v60;
        v50(v60, v32, v53);
        char v45 = sub_10005C3B0();
        char v55 = *(void (**)(char *, uint64_t))(v49 + 8);
        v55(v54, v53);
        v55(v51, v53);
        sub_10001E8C0(v48, (uint64_t *)&unk_10007D850);
        uint64_t v56 = v47;
LABEL_20:
        sub_10001E8C0(v56, (uint64_t *)&unk_10007D850);
LABEL_21:
        sub_100016DA0((uint64_t)v31, type metadata accessor for CRLSELibraryViewModel.Item);
      }
      else
      {
        sub_10001E8C0(v47, (uint64_t *)&unk_10007D850);
        (*(void (**)(char *, uint64_t))(v65 + 8))(v19, v66);
LABEL_16:
        sub_10001E8C0((uint64_t)v31, &qword_10007CC30);
        char v45 = 0;
      }
      return v45 & 1;
    default:
      sub_10001DCFC((uint64_t)v31, (uint64_t)v27, type metadata accessor for CRLSELibraryViewModel.Item);
      if (swift_getEnumCaseMultiPayload()) {
        goto LABEL_16;
      }
      int v33 = *v27;
LABEL_11:
      char v45 = v33 == *v32;
      goto LABEL_21;
  }
}

uint64_t sub_10001DCFC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_10001DD64()
{
  unint64_t result = qword_10007CC40;
  if (!qword_10007CC40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CC40);
  }
  return result;
}

unint64_t sub_10001DDB8()
{
  unint64_t result = qword_10007CC68;
  if (!qword_10007CC68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CC68);
  }
  return result;
}

unint64_t sub_10001DE0C()
{
  unint64_t result = qword_10007CC80;
  if (!qword_10007CC80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CC80);
  }
  return result;
}

uint64_t sub_10001DE60(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10001DEA8(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10001DE60(&qword_10007CC88);
    sub_10001BAB8(a2, (void (*)(uint64_t))type metadata accessor for CRLSELibraryViewModeItemNode);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

BOOL sub_10001DF3C(uint64_t a1, uint64_t a2)
{
  uint64_t v76 = sub_10005C3D0();
  uint64_t v74 = *(void *)(v76 - 8);
  __chkstk_darwin(v76);
  uint64_t v66 = (char *)&v65 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = sub_1000131E0(&qword_10007CCB8);
  __chkstk_darwin(v71);
  uint64_t v75 = (uint64_t)&v65 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000131E0((uint64_t *)&unk_10007D8C0);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v67 = (uint64_t)&v65 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v72 = (uint64_t)&v65 - v10;
  __chkstk_darwin(v9);
  uint64_t v73 = (uint64_t)&v65 - v11;
  uint64_t v12 = type metadata accessor for CRLSEBoardIdentifier(0);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v68 = (uint64_t)&v65 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v69 = (uint64_t)&v65 - v17;
  __chkstk_darwin(v16);
  uint64_t v70 = (uint64_t)&v65 - v18;
  uint64_t v19 = sub_1000131E0(&qword_10007CCC0);
  uint64_t v20 = v19 - 8;
  __chkstk_darwin(v19);
  uint64_t v22 = (char *)&v65 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_1000131E0(&qword_10007D8B0);
  uint64_t v24 = __chkstk_darwin(v23 - 8);
  uint64_t v26 = (char *)&v65 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = __chkstk_darwin(v24);
  uint64_t v29 = (char *)&v65 - v28;
  __chkstk_darwin(v27);
  uint64_t v31 = (char *)&v65 - v30;
  uint64_t v77 = a1;
  sub_10001E85C(a1, (uint64_t)&v65 - v30, &qword_10007D8B0);
  uint64_t v78 = a2;
  sub_10001E85C(a2, (uint64_t)v29, &qword_10007D8B0);
  uint64_t v32 = (uint64_t)&v22[*(int *)(v20 + 56)];
  sub_10001E85C((uint64_t)v31, (uint64_t)v22, &qword_10007D8B0);
  sub_10001E85C((uint64_t)v29, v32, &qword_10007D8B0);
  int v33 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48);
  if (v33((uint64_t)v22, 1, v12) == 1)
  {
    sub_10001E8C0((uint64_t)v29, &qword_10007D8B0);
    sub_10001E8C0((uint64_t)v31, &qword_10007D8B0);
    if (v33(v32, 1, v12) == 1) {
      goto LABEL_3;
    }
LABEL_12:
    uint64_t v50 = &qword_10007CCC0;
    uint64_t v51 = (uint64_t)v22;
    goto LABEL_21;
  }
  sub_10001E85C((uint64_t)v22, (uint64_t)v26, &qword_10007D8B0);
  if (v33(v32, 1, v12) == 1)
  {
    sub_10001E8C0((uint64_t)v29, &qword_10007D8B0);
    sub_10001E8C0((uint64_t)v31, &qword_10007D8B0);
    sub_100016DA0((uint64_t)v26, type metadata accessor for CRLSEBoardIdentifier);
    goto LABEL_12;
  }
  uint64_t v52 = v70;
  sub_10001BE48(v32, v70, type metadata accessor for CRLSEBoardIdentifier);
  char v53 = sub_10005C3B0();
  uint64_t v54 = v69;
  sub_10001DCFC((uint64_t)v26, v69, type metadata accessor for CRLSEBoardIdentifier);
  uint64_t v55 = v68;
  sub_10001DCFC(v52, v68, type metadata accessor for CRLSEBoardIdentifier);
  if ((v53 & 1) == 0)
  {
    sub_100016DA0(v55, type metadata accessor for CRLSEBoardIdentifier);
    sub_100016DA0(v54, type metadata accessor for CRLSEBoardIdentifier);
    sub_100016DA0(v52, type metadata accessor for CRLSEBoardIdentifier);
    sub_10001E8C0((uint64_t)v29, &qword_10007D8B0);
    sub_10001E8C0((uint64_t)v31, &qword_10007D8B0);
    sub_100016DA0((uint64_t)v26, type metadata accessor for CRLSEBoardIdentifier);
    uint64_t v51 = (uint64_t)v22;
    uint64_t v50 = &qword_10007D8B0;
    goto LABEL_21;
  }
  uint64_t v56 = *(int *)(type metadata accessor for CRLSEBoardIdentifierStorage(0) + 20);
  uint64_t v57 = *(void *)(v54 + v56);
  uint64_t v58 = *(void *)(v54 + v56 + 8);
  uint64_t v59 = (void *)(v55 + v56);
  if (v57 != *v59 || v58 != v59[1])
  {
    char v61 = sub_10005CDF0();
    sub_100016DA0(v55, type metadata accessor for CRLSEBoardIdentifier);
    sub_100016DA0(v54, type metadata accessor for CRLSEBoardIdentifier);
    sub_100016DA0(v52, type metadata accessor for CRLSEBoardIdentifier);
    sub_10001E8C0((uint64_t)v29, &qword_10007D8B0);
    sub_10001E8C0((uint64_t)v31, &qword_10007D8B0);
    sub_100016DA0((uint64_t)v26, type metadata accessor for CRLSEBoardIdentifier);
    sub_10001E8C0((uint64_t)v22, &qword_10007D8B0);
    BOOL result = 0;
    uint64_t v34 = v77;
    uint64_t v35 = v78;
    if ((v61 & 1) == 0) {
      return result;
    }
    goto LABEL_4;
  }
  sub_100016DA0(v55, type metadata accessor for CRLSEBoardIdentifier);
  sub_100016DA0(v54, type metadata accessor for CRLSEBoardIdentifier);
  sub_100016DA0(v52, type metadata accessor for CRLSEBoardIdentifier);
  sub_10001E8C0((uint64_t)v29, &qword_10007D8B0);
  sub_10001E8C0((uint64_t)v31, &qword_10007D8B0);
  sub_100016DA0((uint64_t)v26, type metadata accessor for CRLSEBoardIdentifier);
LABEL_3:
  sub_10001E8C0((uint64_t)v22, &qword_10007D8B0);
  uint64_t v34 = v77;
  uint64_t v35 = v78;
LABEL_4:
  uint64_t v36 = type metadata accessor for CRLSEBoard(0);
  uint64_t v37 = *(int *)(v36 + 20);
  uint64_t v38 = *(void *)(v34 + v37);
  uint64_t v39 = *(void *)(v34 + v37 + 8);
  uint64_t v40 = (void *)(v35 + v37);
  if (v38 == *v40 && v39 == v40[1] || (v41 = sub_10005CDF0(), BOOL result = 0, (v41 & 1) != 0))
  {
    uint64_t v43 = v73;
    sub_10001E85C(v34 + *(int *)(v36 + 24), v73, (uint64_t *)&unk_10007D8C0);
    uint64_t v44 = v72;
    sub_10001E85C(v35 + *(int *)(v36 + 24), v72, (uint64_t *)&unk_10007D8C0);
    uint64_t v45 = v75;
    uint64_t v46 = v75 + *(int *)(v71 + 48);
    sub_10001E85C(v43, v75, (uint64_t *)&unk_10007D8C0);
    sub_10001E85C(v44, v46, (uint64_t *)&unk_10007D8C0);
    uint64_t v47 = v74;
    uint64_t v48 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v74 + 48);
    uint64_t v49 = v76;
    if (v48(v45, 1, v76) == 1)
    {
      sub_10001E8C0(v44, (uint64_t *)&unk_10007D8C0);
      sub_10001E8C0(v43, (uint64_t *)&unk_10007D8C0);
      if (v48(v46, 1, v49) == 1)
      {
        sub_10001E8C0(v45, (uint64_t *)&unk_10007D8C0);
        return 1;
      }
    }
    else
    {
      uint64_t v60 = v67;
      sub_10001E85C(v45, v67, (uint64_t *)&unk_10007D8C0);
      if (v48(v46, 1, v49) != 1)
      {
        uint64_t v62 = v66;
        (*(void (**)(char *, uint64_t, uint64_t))(v47 + 32))(v66, v46, v49);
        sub_10001BAB8(&qword_10007CCC8, (void (*)(uint64_t))&type metadata accessor for UUID);
        char v63 = sub_10005C7C0();
        uint64_t v64 = *(void (**)(char *, uint64_t))(v47 + 8);
        v64(v62, v49);
        sub_10001E8C0(v44, (uint64_t *)&unk_10007D8C0);
        sub_10001E8C0(v43, (uint64_t *)&unk_10007D8C0);
        v64((char *)v60, v49);
        sub_10001E8C0(v45, (uint64_t *)&unk_10007D8C0);
        return (v63 & 1) != 0;
      }
      sub_10001E8C0(v44, (uint64_t *)&unk_10007D8C0);
      sub_10001E8C0(v43, (uint64_t *)&unk_10007D8C0);
      (*(void (**)(uint64_t, uint64_t))(v47 + 8))(v60, v49);
    }
    uint64_t v50 = &qword_10007CCB8;
    uint64_t v51 = v45;
LABEL_21:
    sub_10001E8C0(v51, v50);
    return 0;
  }
  return result;
}

uint64_t sub_10001E85C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000131E0(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10001E8C0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000131E0(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10001E91C(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 sub_10001E950(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_10001E95C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_10001E97C(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

void type metadata accessor for URLResourceKey(uint64_t a1)
{
}

void type metadata accessor for CGColor(uint64_t a1)
{
}

unsigned char *initializeBufferWithCopyOfBuffer for CRLSELibraryViewModel.Library(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for CRLSELibraryViewModeItemNode.CodingKeys()
{
  return &type metadata for CRLSELibraryViewModeItemNode.CodingKeys;
}

uint64_t _s24FreeformSharingExtension28CRLSELibraryViewModeItemNodeV10CodingKeysOwet_0(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s24FreeformSharingExtension28CRLSELibraryViewModeItemNodeV10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 1;
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
        JUMPOUT(0x10001EB64);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_10001EB8C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10001EB94(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CRLSEBoardIdentifierStorage.CodingKeys()
{
  return &type metadata for CRLSEBoardIdentifierStorage.CodingKeys;
}

uint64_t sub_10001EBBC()
{
  return 0;
}

ValueMetadata *type metadata accessor for CRLSEBoardIdentifier.CodingKeys()
{
  return &type metadata for CRLSEBoardIdentifier.CodingKeys;
}

unsigned char *sub_10001EBDC(unsigned char *result, char a2)
{
  *__n128 result = a2;
  return result;
}

ValueMetadata *type metadata accessor for CRLSELibraryViewModel.Item.CodingKeys()
{
  return &type metadata for CRLSELibraryViewModel.Item.CodingKeys;
}

ValueMetadata *type metadata accessor for CRLSELibraryViewModel.Item.LibraryCodingKeys()
{
  return &type metadata for CRLSELibraryViewModel.Item.LibraryCodingKeys;
}

uint64_t getEnumTagSinglePayload for CRLSEiOSMainViewController.CollectionViewSection(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *_s24FreeformSharingExtension20CRLSEBoardIdentifierV10CodingKeysOwst_0(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *__n128 result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x10001ECF0);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for CRLSELibraryViewModel.Item.FolderCodingKeys()
{
  return &type metadata for CRLSELibraryViewModel.Item.FolderCodingKeys;
}

uint64_t getEnumTagSinglePayload for CRLSEImportManifest.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
  if (a2 + 3 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 3) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
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
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s24FreeformSharingExtension21CRLSELibraryViewModelV4ItemO10CodingKeysOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *__n128 result = a2 + 3;
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
        JUMPOUT(0x10001EE84);
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
          *__n128 result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CRLSELibraryViewModel.Item.BoardCodingKeys()
{
  return &type metadata for CRLSELibraryViewModel.Item.BoardCodingKeys;
}

ValueMetadata *type metadata accessor for CRLSELibraryViewModel.Item.PendingBoardCodingKeys()
{
  return &type metadata for CRLSELibraryViewModel.Item.PendingBoardCodingKeys;
}

ValueMetadata *type metadata accessor for CRLSELibraryViewModel.Folder()
{
  return &type metadata for CRLSELibraryViewModel.Folder;
}

ValueMetadata *type metadata accessor for CRLSELibraryViewModel.Library()
{
  return &type metadata for CRLSELibraryViewModel.Library;
}

unint64_t sub_10001EF00()
{
  unint64_t result = qword_10007CCE8;
  if (!qword_10007CCE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CCE8);
  }
  return result;
}

unint64_t sub_10001EF58()
{
  unint64_t result = qword_10007CCF0;
  if (!qword_10007CCF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CCF0);
  }
  return result;
}

unint64_t sub_10001EFB0()
{
  unint64_t result = qword_10007CCF8;
  if (!qword_10007CCF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CCF8);
  }
  return result;
}

unint64_t sub_10001F008()
{
  unint64_t result = qword_10007CD00;
  if (!qword_10007CD00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CD00);
  }
  return result;
}

unint64_t sub_10001F060()
{
  unint64_t result = qword_10007CD08;
  if (!qword_10007CD08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CD08);
  }
  return result;
}

unint64_t sub_10001F0B8()
{
  unint64_t result = qword_10007CD10;
  if (!qword_10007CD10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CD10);
  }
  return result;
}

unint64_t sub_10001F110()
{
  unint64_t result = qword_10007CD18;
  if (!qword_10007CD18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CD18);
  }
  return result;
}

unint64_t sub_10001F168()
{
  unint64_t result = qword_10007CD20;
  if (!qword_10007CD20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CD20);
  }
  return result;
}

unint64_t sub_10001F1C0()
{
  unint64_t result = qword_10007CD28;
  if (!qword_10007CD28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CD28);
  }
  return result;
}

unint64_t sub_10001F218()
{
  unint64_t result = qword_10007CD30;
  if (!qword_10007CD30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CD30);
  }
  return result;
}

uint64_t sub_10001F26C()
{
  return sub_10001BAB8(&qword_10007CD38, type metadata accessor for URLResourceKey);
}

uint64_t sub_10001F2B4()
{
  return sub_10001BAB8(&qword_10007CD40, type metadata accessor for URLResourceKey);
}

uint64_t sub_10001F2FC()
{
  return sub_10001BAB8(&qword_10007CD48, type metadata accessor for URLResourceKey);
}

unint64_t sub_10001F348()
{
  unint64_t result = qword_10007CD50;
  if (!qword_10007CD50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CD50);
  }
  return result;
}

unint64_t sub_10001F3A0()
{
  unint64_t result = qword_10007CD58;
  if (!qword_10007CD58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CD58);
  }
  return result;
}

unint64_t sub_10001F3F8()
{
  unint64_t result = qword_10007CD60;
  if (!qword_10007CD60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CD60);
  }
  return result;
}

unint64_t sub_10001F450()
{
  unint64_t result = qword_10007CD68;
  if (!qword_10007CD68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CD68);
  }
  return result;
}

unint64_t sub_10001F4A8()
{
  unint64_t result = qword_10007CD70;
  if (!qword_10007CD70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CD70);
  }
  return result;
}

unint64_t sub_10001F500()
{
  unint64_t result = qword_10007CD78;
  if (!qword_10007CD78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CD78);
  }
  return result;
}

unint64_t sub_10001F558()
{
  unint64_t result = qword_10007CD80;
  if (!qword_10007CD80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CD80);
  }
  return result;
}

unint64_t sub_10001F5B0()
{
  unint64_t result = qword_10007CD88;
  if (!qword_10007CD88)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CD88);
  }
  return result;
}

unint64_t sub_10001F608()
{
  unint64_t result = qword_10007CD90;
  if (!qword_10007CD90)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CD90);
  }
  return result;
}

unint64_t sub_10001F660()
{
  unint64_t result = qword_10007CD98;
  if (!qword_10007CD98)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CD98);
  }
  return result;
}

unint64_t sub_10001F6B8()
{
  unint64_t result = qword_10007CDA0;
  if (!qword_10007CDA0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CDA0);
  }
  return result;
}

unint64_t sub_10001F710()
{
  unint64_t result = qword_10007CDA8;
  if (!qword_10007CDA8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CDA8);
  }
  return result;
}

unint64_t sub_10001F768()
{
  unint64_t result = qword_10007CDB0;
  if (!qword_10007CDB0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CDB0);
  }
  return result;
}

unint64_t sub_10001F7C0()
{
  unint64_t result = qword_10007CDB8;
  if (!qword_10007CDB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CDB8);
  }
  return result;
}

unint64_t sub_10001F818()
{
  unint64_t result = qword_10007CDC0;
  if (!qword_10007CDC0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CDC0);
  }
  return result;
}

unint64_t sub_10001F870()
{
  unint64_t result = qword_10007CDC8;
  if (!qword_10007CDC8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CDC8);
  }
  return result;
}

uint64_t sub_10001F8C4(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 1835365481 && a2 == 0xE400000000000000;
  if (v2 || (sub_10005CDF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E6572646C696863 && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_10005CDF0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_10001F9A8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x4955556472616F62 && a2 == 0xE900000000000044;
  if (v2 || (sub_10005CDF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6D614E72656E776FLL && a2 == 0xE900000000000065)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else
  {
    char v6 = sub_10005CDF0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 1;
    }
    else {
      return 2;
    }
  }
}

uint64_t sub_10001FAAC(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6564496472616F62 && a2 == 0xEF7265696669746ELL;
  if (v2 || (sub_10005CDF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C746974 && a2 == 0xE500000000000000 || (sub_10005CDF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6465726168537369 && a2 == 0xE800000000000000 || (sub_10005CDF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x746964457473616CLL && a2 == 0xEA00000000006465)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_10005CDF0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_10001FC90(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x7972617262696CLL && a2 == 0xE700000000000000;
  if (v2 || (sub_10005CDF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7265646C6F66 && a2 == 0xE600000000000000 || (sub_10005CDF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x6472616F62 && a2 == 0xE500000000000000 || (sub_10005CDF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x42676E69646E6570 && a2 == 0xEC0000006472616FLL)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_10005CDF0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_10001FE54(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x696669746E656469 && a2 == 0xEA00000000007265 || (sub_10005CDF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C746974 && a2 == 0xE500000000000000 || (sub_10005CDF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x746964457473616CLL && a2 == 0xEA00000000006465)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v5 = sub_10005CDF0();
    swift_bridgeObjectRelease();
    if (v5) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

uint64_t sub_10001FFB8(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6C616963657073 && a2 == 0xE700000000000000;
  if (v2 || (sub_10005CDF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6C61636F6CLL && a2 == 0xE500000000000000 || (sub_10005CDF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x64756F6C4369 && a2 == 0xE600000000000000)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else
  {
    char v6 = sub_10005CDF0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 2;
    }
    else {
      return 3;
    }
  }
}

void *sub_100020100(void *a1)
{
  uint64_t v2 = sub_1000131E0(&qword_10007CE30);
  uint64_t v25 = *(void *)(v2 - 8);
  uint64_t v26 = v2;
  __chkstk_darwin(v2);
  uint64_t v29 = (char *)&v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_1000131E0(&qword_10007CE38);
  uint64_t v24 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  char v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000131E0(&qword_10007CE40);
  uint64_t v23 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  int v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000131E0(&qword_10007CE48);
  uint64_t v28 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v11 = (uint64_t *)((char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  sub_10001BB00(a1, a1[3]);
  sub_100021204();
  uint64_t v12 = (uint64_t)v30;
  sub_10005CEE0();
  if (v12) {
    goto LABEL_7;
  }
  uint64_t v22 = v6;
  uint64_t v13 = v29;
  uint64_t v30 = a1;
  uint64_t v14 = v11;
  uint64_t v15 = sub_10005CD40();
  if (*(void *)(v15 + 16) != 1)
  {
    uint64_t v17 = sub_10005CC10();
    swift_allocError();
    uint64_t v11 = v18;
    sub_1000131E0(&qword_10007CB90);
    void *v11 = &type metadata for CRLSELibraryViewModel.Library;
    sub_10005CCE0();
    sub_10005CC00();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v17 - 8) + 104))(v11, enum case for DecodingError.typeMismatch(_:), v17);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(void *, uint64_t))(v28 + 8))(v14, v9);
    a1 = v30;
LABEL_7:
    sub_10001BB98((uint64_t)a1);
    return v11;
  }
  uint64_t v11 = (void *)*(unsigned __int8 *)(v15 + 32);
  if (*(unsigned char *)(v15 + 32))
  {
    if (v11 == 1)
    {
      char v32 = 1;
      sub_1000212AC();
      sub_10005CCD0();
      uint64_t v16 = v28;
      (*(void (**)(char *, uint64_t))(v24 + 8))(v5, v27);
      swift_bridgeObjectRelease();
      (*(void (**)(void *, uint64_t))(v16 + 8))(v14, v9);
    }
    else
    {
      char v33 = 2;
      sub_100021258();
      sub_10005CCD0();
      uint64_t v20 = v28;
      (*(void (**)(char *, uint64_t))(v25 + 8))(v13, v26);
      swift_bridgeObjectRelease();
      (*(void (**)(void *, uint64_t))(v20 + 8))(v14, v9);
    }
  }
  else
  {
    char v31 = 0;
    sub_100021300();
    sub_10005CCD0();
    (*(void (**)(char *, uint64_t))(v23 + 8))(v8, v22);
    swift_bridgeObjectRelease();
    (*(void (**)(void *, uint64_t))(v28 + 8))(v14, v9);
  }
  sub_10001BB98((uint64_t)v30);
  return v11;
}

uint64_t sub_100020670(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x6472616F426C6C61 && a2 == 0xE900000000000073;
  if (v2 || (sub_10005CDF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x73746E65636572 && a2 == 0xE700000000000000 || (sub_10005CDF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x657469726F766166 && a2 == 0xE900000000000073 || (sub_10005CDF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x646572616873 && a2 == 0xE600000000000000 || (sub_10005CDF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x796C746E65636572 && a2 == 0xEF646574656C6544)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_10005CDF0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

uint64_t sub_1000208C4(void *a1)
{
  uint64_t v41 = sub_1000131E0(&qword_10007CDD0);
  uint64_t v34 = *(void *)(v41 - 8);
  __chkstk_darwin(v41);
  uint64_t v44 = (char *)&v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_1000131E0(&qword_10007CDD8);
  uint64_t v40 = *(void *)(v37 - 8);
  __chkstk_darwin(v37);
  uint64_t v43 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000131E0(&qword_10007CDE0);
  uint64_t v38 = *(void *)(v4 - 8);
  uint64_t v39 = v4;
  __chkstk_darwin(v4);
  uint64_t v42 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000131E0(&qword_10007CDE8);
  uint64_t v35 = *(void *)(v6 - 8);
  uint64_t v36 = v6;
  __chkstk_darwin(v6);
  int v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000131E0(&qword_10007CDF0);
  uint64_t v33 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000131E0(&qword_10007CDF8);
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (uint64_t)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = a1[3];
  uint64_t v45 = a1;
  sub_10001BB00(a1, v16);
  sub_10002100C();
  uint64_t v17 = v46;
  sub_10005CEE0();
  if (!v17)
  {
    uint64_t v46 = v11;
    uint64_t v31 = v9;
    uint64_t v32 = v13;
    uint64_t v18 = v8;
    uint64_t v20 = v42;
    uint64_t v19 = v43;
    uint64_t v21 = v44;
    uint64_t v22 = v15;
    uint64_t v23 = sub_10005CD40();
    if (*(void *)(v23 + 16) == 1)
    {
      uint64_t v15 = *(unsigned __int8 *)(v23 + 32);
      switch(*(unsigned char *)(v23 + 32))
      {
        case 1:
          uint64_t v30 = v32;
          char v48 = 1;
          sub_10002115C();
          sub_10005CCD0();
          (*(void (**)(char *, uint64_t))(v35 + 8))(v18, v36);
          goto LABEL_12;
        case 2:
          uint64_t v30 = v32;
          char v49 = 2;
          sub_100021108();
          sub_10005CCD0();
          (*(void (**)(char *, uint64_t))(v38 + 8))(v20, v39);
LABEL_12:
          swift_bridgeObjectRelease();
          uint64_t v24 = v30;
          goto LABEL_10;
        case 3:
          uint64_t v24 = v32;
          char v50 = 3;
          sub_1000210B4();
          sub_10005CCD0();
          (*(void (**)(char *, uint64_t))(v40 + 8))(v19, v37);
          goto LABEL_13;
        case 4:
          char v51 = 4;
          sub_100021060();
          sub_10005CCD0();
          (*(void (**)(char *, uint64_t))(v34 + 8))(v21, v41);
          swift_bridgeObjectRelease();
          (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v22, v12);
          break;
        default:
          uint64_t v24 = v32;
          char v47 = 0;
          sub_1000211B0();
          uint64_t v25 = v46;
          sub_10005CCD0();
          (*(void (**)(char *, uint64_t))(v33 + 8))(v25, v31);
LABEL_13:
          swift_bridgeObjectRelease();
LABEL_10:
          (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v22, v12);
          break;
      }
    }
    else
    {
      uint64_t v26 = sub_10005CC10();
      uint64_t v15 = swift_allocError();
      uint64_t v28 = v27;
      sub_1000131E0(&qword_10007CB90);
      *uint64_t v28 = &type metadata for CRLSELibraryViewModel.Folder;
      sub_10005CCE0();
      sub_10005CC00();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v26 - 8) + 104))(v28, enum case for DecodingError.typeMismatch(_:), v26);
      swift_willThrow();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v22, v12);
    }
  }
  sub_10001BB98((uint64_t)v45);
  return v15;
}

unint64_t sub_10002100C()
{
  unint64_t result = qword_10007CE00;
  if (!qword_10007CE00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CE00);
  }
  return result;
}

unint64_t sub_100021060()
{
  unint64_t result = qword_10007CE08;
  if (!qword_10007CE08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CE08);
  }
  return result;
}

unint64_t sub_1000210B4()
{
  unint64_t result = qword_10007CE10;
  if (!qword_10007CE10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CE10);
  }
  return result;
}

unint64_t sub_100021108()
{
  unint64_t result = qword_10007CE18;
  if (!qword_10007CE18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CE18);
  }
  return result;
}

unint64_t sub_10002115C()
{
  unint64_t result = qword_10007CE20;
  if (!qword_10007CE20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CE20);
  }
  return result;
}

unint64_t sub_1000211B0()
{
  unint64_t result = qword_10007CE28;
  if (!qword_10007CE28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CE28);
  }
  return result;
}

unint64_t sub_100021204()
{
  unint64_t result = qword_10007CE50;
  if (!qword_10007CE50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CE50);
  }
  return result;
}

unint64_t sub_100021258()
{
  unint64_t result = qword_10007CE58;
  if (!qword_10007CE58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CE58);
  }
  return result;
}

unint64_t sub_1000212AC()
{
  unint64_t result = qword_10007CE60;
  if (!qword_10007CE60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CE60);
  }
  return result;
}

unint64_t sub_100021300()
{
  unint64_t result = qword_10007CE68;
  if (!qword_10007CE68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CE68);
  }
  return result;
}

uint64_t _s24FreeformSharingExtension21CRLSELibraryViewModelV7LibraryOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
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
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s24FreeformSharingExtension21CRLSELibraryViewModelV7LibraryOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *unint64_t result = a2 + 2;
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
        JUMPOUT(0x1000214B0);
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
          *unint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CRLSELibraryViewModel.Library.CodingKeys()
{
  return &type metadata for CRLSELibraryViewModel.Library.CodingKeys;
}

ValueMetadata *type metadata accessor for CRLSELibraryViewModel.Library.SpecialCodingKeys()
{
  return &type metadata for CRLSELibraryViewModel.Library.SpecialCodingKeys;
}

ValueMetadata *type metadata accessor for CRLSELibraryViewModel.Library.LocalCodingKeys()
{
  return &type metadata for CRLSELibraryViewModel.Library.LocalCodingKeys;
}

ValueMetadata *type metadata accessor for CRLSELibraryViewModel.Library.ICloudCodingKeys()
{
  return &type metadata for CRLSELibraryViewModel.Library.ICloudCodingKeys;
}

uint64_t getEnumTagSinglePayload for CRLSEManifestItem.CodingKeys(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *_s24FreeformSharingExtension21CRLSELibraryViewModelV6FolderOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100021674);
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

ValueMetadata *type metadata accessor for CRLSELibraryViewModel.Folder.CodingKeys()
{
  return &type metadata for CRLSELibraryViewModel.Folder.CodingKeys;
}

ValueMetadata *type metadata accessor for CRLSELibraryViewModel.Folder.AllBoardsCodingKeys()
{
  return &type metadata for CRLSELibraryViewModel.Folder.AllBoardsCodingKeys;
}

ValueMetadata *type metadata accessor for CRLSELibraryViewModel.Folder.RecentsCodingKeys()
{
  return &type metadata for CRLSELibraryViewModel.Folder.RecentsCodingKeys;
}

ValueMetadata *type metadata accessor for CRLSELibraryViewModel.Folder.FavoritesCodingKeys()
{
  return &type metadata for CRLSELibraryViewModel.Folder.FavoritesCodingKeys;
}

ValueMetadata *type metadata accessor for CRLSELibraryViewModel.Folder.SharedCodingKeys()
{
  return &type metadata for CRLSELibraryViewModel.Folder.SharedCodingKeys;
}

ValueMetadata *type metadata accessor for CRLSELibraryViewModel.Folder.RecentlyDeletedCodingKeys()
{
  return &type metadata for CRLSELibraryViewModel.Folder.RecentlyDeletedCodingKeys;
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void sub_100021710(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

unint64_t sub_10002175C()
{
  unint64_t result = qword_10007CED8;
  if (!qword_10007CED8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CED8);
  }
  return result;
}

unint64_t sub_1000217B4()
{
  unint64_t result = qword_10007CEE0;
  if (!qword_10007CEE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CEE0);
  }
  return result;
}

unint64_t sub_10002180C()
{
  unint64_t result = qword_10007CEE8;
  if (!qword_10007CEE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CEE8);
  }
  return result;
}

unint64_t sub_100021864()
{
  unint64_t result = qword_10007CEF0;
  if (!qword_10007CEF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CEF0);
  }
  return result;
}

unint64_t sub_1000218BC()
{
  unint64_t result = qword_10007CEF8;
  if (!qword_10007CEF8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CEF8);
  }
  return result;
}

unint64_t sub_100021914()
{
  unint64_t result = qword_10007CF00;
  if (!qword_10007CF00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CF00);
  }
  return result;
}

unint64_t sub_10002196C()
{
  unint64_t result = qword_10007CF08;
  if (!qword_10007CF08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CF08);
  }
  return result;
}

unint64_t sub_1000219C4()
{
  unint64_t result = qword_10007CF10;
  if (!qword_10007CF10)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CF10);
  }
  return result;
}

unint64_t sub_100021A1C()
{
  unint64_t result = qword_10007CF18;
  if (!qword_10007CF18)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CF18);
  }
  return result;
}

unint64_t sub_100021A74()
{
  unint64_t result = qword_10007CF20;
  if (!qword_10007CF20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CF20);
  }
  return result;
}

unint64_t sub_100021ACC()
{
  unint64_t result = qword_10007CF28;
  if (!qword_10007CF28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CF28);
  }
  return result;
}

unint64_t sub_100021B24()
{
  unint64_t result = qword_10007CF30;
  if (!qword_10007CF30)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CF30);
  }
  return result;
}

unint64_t sub_100021B7C()
{
  unint64_t result = qword_10007CF38;
  if (!qword_10007CF38)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CF38);
  }
  return result;
}

unint64_t sub_100021BD4()
{
  unint64_t result = qword_10007CF40;
  if (!qword_10007CF40)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CF40);
  }
  return result;
}

unint64_t sub_100021C2C()
{
  unint64_t result = qword_10007CF48;
  if (!qword_10007CF48)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CF48);
  }
  return result;
}

unint64_t sub_100021C84()
{
  unint64_t result = qword_10007CF50;
  if (!qword_10007CF50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CF50);
  }
  return result;
}

unint64_t sub_100021CDC()
{
  unint64_t result = qword_10007CF58;
  if (!qword_10007CF58)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CF58);
  }
  return result;
}

unint64_t sub_100021D34()
{
  unint64_t result = qword_10007CF60;
  if (!qword_10007CF60)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CF60);
  }
  return result;
}

unint64_t sub_100021D8C()
{
  unint64_t result = qword_10007CF68;
  if (!qword_10007CF68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CF68);
  }
  return result;
}

unint64_t sub_100021DE4()
{
  unint64_t result = qword_10007CF70;
  if (!qword_10007CF70)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CF70);
  }
  return result;
}

unint64_t sub_100021E3C()
{
  unint64_t result = qword_10007CF78;
  if (!qword_10007CF78)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CF78);
  }
  return result;
}

unint64_t sub_100021E94()
{
  unint64_t result = qword_10007CF80;
  if (!qword_10007CF80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007CF80);
  }
  return result;
}

uint64_t Error.publicDescription.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v68 = a2;
  uint64_t v5 = sub_1000131E0(&qword_10007CF88);
  __chkstk_darwin(v5 - 8);
  uint64_t v69 = (uint64_t)&v57 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10005CEA0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v66 = v7;
  uint64_t v67 = v8;
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v65 = (char *)&v57 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v64 = (char *)&v57 - v11;
  uint64_t v12 = sub_10005CED0();
  uint64_t v63 = *(void *)(v12 - 8);
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v57 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = *(void *)(a1 - 8);
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v18 = (char *)&v57 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __chkstk_darwin(v16);
  uint64_t v21 = (char *)&v57 - v20;
  __chkstk_darwin(v19);
  uint64_t v23 = (char *)&v57 - v22;
  uint64_t v24 = v3;
  *(void *)&long long v72 = swift_getDynamicType();
  swift_getMetatypeMetadata();
  uint64_t v25 = sub_10005C830();
  uint64_t v27 = v26;
  sub_100022658();
  if (!swift_dynamicCastMetatype())
  {
    uint64_t v59 = v18;
    uint64_t v60 = v21;
    char v61 = v27;
    uint64_t v62 = v25;
    uint64_t v30 = v64;
    uint64_t v29 = v65;
    uint64_t v68 = v12;
    v73[1] = a1;
    uint64_t v31 = sub_100022698((uint64_t *)&v72);
    uint64_t v32 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v70 + 16);
    uint64_t v33 = v24;
    v32(v31, v24, a1);
    sub_10005CE80();
    uint64_t v34 = v69;
    sub_10005CEB0();
    uint64_t v36 = v66;
    uint64_t v35 = v67;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v67 + 48))(v34, 1, v66) == 1)
    {
      (*(void (**)(char *, uint64_t))(v63 + 8))(v15, v68);
      sub_10001E8C0(v69, &qword_10007CF88);
      return v62;
    }
    uint64_t v45 = a1;
    uint64_t v57 = v33;
    uint64_t v58 = v15;
    uint64_t v46 = v30;
    (*(void (**)(char *, uint64_t, uint64_t))(v35 + 32))(v30, v69, v36);
    (*(void (**)(char *, void, uint64_t))(v35 + 104))(v29, enum case for Mirror.DisplayStyle.enum(_:), v36);
    char v47 = sub_10005CE90();
    uint64_t v48 = v35 + 8;
    char v49 = *(void (**)(char *, uint64_t))(v35 + 8);
    v49(v29, v36);
    if ((v47 & 1) == 0)
    {
      *(void *)&long long v72 = 0;
      *((void *)&v72 + 1) = 0xE000000000000000;
      v77._countAndFlagsBits = v62;
      v77._object = v61;
      sub_10005C880(v77);
      swift_bridgeObjectRelease();
      v78._countAndFlagsBits = 40;
      v78._object = (void *)0xE100000000000000;
      sub_10005C880(v78);
      sub_10005CC70();
      v79._countAndFlagsBits = 41;
      v79._object = (void *)0xE100000000000000;
      sub_10005C880(v79);
      uint64_t v37 = v72;
      v49(v46, v36);
      (*(void (**)(char *, uint64_t))(v63 + 8))(v58, v68);
      return v37;
    }
    uint64_t v67 = v48;
    sub_10005CEC0();
    sub_1000226FC(&v72);
    swift_release();
    if (v73[3])
    {
      char v50 = (void *)*((void *)&v72 + 1);
      uint64_t v51 = v72;
      sub_10001BB98((uint64_t)v73);
      uint64_t v52 = v60;
      v32((uint64_t *)v60, v57, v45);
      char v53 = v59;
      if (v50)
      {
LABEL_16:
        (*(void (**)(char *, uint64_t))(v70 + 8))(v52, v45);
        uint64_t v55 = v68;
        uint64_t v56 = v63;
        *(void *)&long long v72 = v62;
        *((void *)&v72 + 1) = v61;
        v80._countAndFlagsBits = 46;
        v80._object = (void *)0xE100000000000000;
        sub_10005C880(v80);
        v81._countAndFlagsBits = v51;
        v81._object = v50;
        sub_10005C880(v81);
        swift_bridgeObjectRelease();
        uint64_t v37 = v72;
        v49(v46, v66);
        (*(void (**)(char *, uint64_t))(v56 + 8))(v58, v55);
        return v37;
      }
    }
    else
    {
      sub_10001E8C0((uint64_t)&v72, &qword_10007CF98);
      uint64_t v52 = v60;
      v32((uint64_t *)v60, v57, a1);
      char v53 = v59;
    }
    v32((uint64_t *)v53, (uint64_t)v52, v45);
    uint64_t v51 = sub_10005C820();
    char v50 = v54;
    goto LABEL_16;
  }
  swift_bridgeObjectRelease();
  uint64_t v28 = v70;
  (*(void (**)(char *, uint64_t, uint64_t))(v70 + 16))(v23, v3, a1);
  if (sub_10005CDD0())
  {
    (*(void (**)(char *, uint64_t))(v28 + 8))(v23, a1);
  }
  else
  {
    swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v28 + 32))(v38, v23, a1);
  }
  uint64_t v39 = (void *)sub_10005C1E0();
  swift_errorRelease();
  *(void *)&long long v72 = 0;
  *((void *)&v72 + 1) = 0xE000000000000000;
  sub_10005CBA0(25);
  swift_bridgeObjectRelease();
  *(void *)&long long v72 = 0x20726F727245534ELL;
  *((void *)&v72 + 1) = 0xEF3D6E69616D6F44;
  id v40 = [v39 domain];
  uint64_t v41 = sub_10005C810();
  uint64_t v43 = v42;

  v74._countAndFlagsBits = v41;
  v74._object = v43;
  sub_10005C880(v74);
  swift_bridgeObjectRelease();
  v75._countAndFlagsBits = 0x3D65646F4320;
  v75._object = (void *)0xE600000000000000;
  sub_10005C880(v75);
  id v71 = [v39 code];
  v76._countAndFlagsBits = sub_10005CDC0();
  sub_10005C880(v76);

  swift_bridgeObjectRelease();
  return v72;
}

unint64_t sub_100022658()
{
  unint64_t result = qword_10007CF90;
  if (!qword_10007CF90)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10007CF90);
  }
  return result;
}

uint64_t *sub_100022698(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_1000226FC@<X0>(_OWORD *a1@<X8>)
{
  swift_getObjectType();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  uint64_t v2 = sub_10005CBB0();
  swift_getObjectType();
  uint64_t result = sub_10005CBB0();
  if (v2 == result)
  {
    char v4 = sub_10005CBC0();
    swift_unknownObjectRelease();
    if (v4)
    {
      uint64_t result = swift_unknownObjectRelease();
      a1[1] = 0u;
      a1[2] = 0u;
      *a1 = 0u;
    }
    else
    {
      sub_10005CC80();
      return swift_unknownObjectRelease();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t Error.fullDescription.getter(uint64_t a1)
{
  __chkstk_darwin(a1);
  (*(void (**)(char *))(v2 + 16))((char *)&v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  return sub_10005C830();
}

UIFontTextStyle sub_1000228D0()
{
  qword_10007CFA0 = (uint64_t)UIFontTextStyleSubheadline;
  return UIFontTextStyleSubheadline;
}

id sub_1000228E8(uint64_t a1)
{
  return sub_100022910(a1, (SEL *)&selRef_secondarySystemGroupedBackgroundColor, &qword_10007CFA8);
}

id sub_1000228FC(uint64_t a1)
{
  return sub_100022910(a1, (SEL *)&selRef_systemGroupedBackgroundColor, &qword_10007CFB0);
}

id sub_100022910(uint64_t a1, SEL *a2, void *a3)
{
  id result = [self *a2];
  *a3 = result;
  return result;
}

void sub_100022954()
{
  off_10007CFB8 = &off_1000725B0;
}

uint64_t sub_100022968(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1000131E0(&qword_10007D0D8);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (uint64_t)v2 + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_selectedBoard;
  swift_beginAccess();
  sub_10002E0AC(a1, v7);
  swift_endAccess();
  id v8 = [v2 navigationItem];
  id v9 = [v8 rightBarButtonItem];

  if (v9)
  {
    sub_10001E85C(v7, (uint64_t)v6, &qword_10007D0D8);
    uint64_t v10 = type metadata accessor for CRLSEBoard(0);
    BOOL v11 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48))(v6, 1, v10) != 1;
    sub_10001E8C0((uint64_t)v6, &qword_10007D0D8);
    [v9 setEnabled:v11];
  }
  return sub_10001E8C0(a1, &qword_10007D0D8);
}

id sub_100022AEC()
{
  uint64_t v1 = OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController____lazy_storage___extensionContextManager;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController____lazy_storage___extensionContextManager);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController____lazy_storage___extensionContextManager);
  }
  else
  {
    id v4 = [objc_allocWithZone((Class)type metadata accessor for CRLSEExtensionContextManager()) init];
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_100022B60@<X0>(char *a1@<X8>)
{
  uint64_t v2 = sub_10005C300();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000131E0(&qword_10007D0E8);
  __chkstk_darwin(v6 - 8);
  id v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = [self defaultManager];
  id result = CRLAppGroupIdentifier();
  if (result)
  {
    BOOL v11 = result;
    id v12 = [v9 containerURLForSecurityApplicationGroupIdentifier:result];

    if (v12)
    {
      sub_10005C290();

      uint64_t v13 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
      v13(v8, v5, v2);
      uint64_t v14 = *(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56);
      v14(v8, 0, 1, v2);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2) != 1)
      {
        v13(a1, v8, v2);
        return (id)((uint64_t (*)(char *, void, uint64_t, uint64_t))v14)(a1, 0, 1, v2);
      }
    }
    else
    {
      uint64_t v14 = *(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56);
      v14(v8, 1, 1, v2);
    }
    sub_10001E8C0((uint64_t)v8, &qword_10007D0E8);
    if (qword_10007C6D8 != -1) {
      swift_once();
    }
    swift_beginAccess();
    id v15 = (id)static OS_os_log.crlSharingExtension;
    uint64_t v16 = sub_10005C9C0();
    sub_100050FE0((uint64_t)v15, (uint64_t)&_mh_execute_header, v16, (uint64_t)"Unable to resolve container URL", 31, 2, (uint64_t)&_swiftEmptyArrayStorage);

    return (id)((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v14)(a1, 1, 1, v2);
  }
  else
  {
    __break(1u);
  }
  return result;
}

char *sub_100022E5C()
{
  uint64_t v1 = sub_1000131E0(&qword_10007D0D8);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000131E0(&qword_10007D190);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_100062290;
  uint64_t v5 = v0 + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_selectedBoard;
  swift_beginAccess();
  sub_10001E85C(v5, (uint64_t)v3, &qword_10007D0D8);
  uint64_t v6 = type metadata accessor for CRLSEBoard(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48))(v3, 1, v6))
  {
    sub_10001E8C0((uint64_t)v3, &qword_10007D0D8);
    uint64_t v7 = 0;
    uint64_t v8 = 0;
  }
  else
  {
    id v9 = &v3[*(int *)(v6 + 20)];
    uint64_t v7 = *(void *)v9;
    uint64_t v8 = *((void *)v9 + 1);
    swift_bridgeObjectRetain();
    sub_10001E8C0((uint64_t)v3, &qword_10007D0D8);
  }
  *(void *)(inited + 32) = v7;
  *(void *)(inited + 40) = v8;
  type metadata accessor for CRLSEExtensionContextManager();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v11 = [self bundleForClass:ObjCClassFromMetadata];
  NSString v12 = sub_10005C7D0();
  NSString v13 = sub_10005C7D0();
  NSString v14 = sub_10005C7D0();
  id v15 = [v11 localizedStringForKey:v12 value:v13 table:v14];

  uint64_t v16 = sub_10005C810();
  uint64_t v18 = v17;

  *(void *)(inited + 48) = v16;
  *(void *)(inited + 56) = v18;
  uint64_t v19 = *(void *)(inited + 40);
  if (!v19)
  {
    uint64_t v21 = (char *)&_swiftEmptyArrayStorage;
    if (!v18) {
      goto LABEL_15;
    }
    goto LABEL_10;
  }
  uint64_t v20 = *(void *)(inited + 32);
  swift_bridgeObjectRetain();
  uint64_t v21 = sub_100053658(0, 1, 1, (char *)&_swiftEmptyArrayStorage);
  unint64_t v23 = *((void *)v21 + 2);
  unint64_t v22 = *((void *)v21 + 3);
  if (v23 >= v22 >> 1) {
    uint64_t v21 = sub_100053658((char *)(v22 > 1), v23 + 1, 1, v21);
  }
  *((void *)v21 + 2) = v23 + 1;
  uint64_t v24 = &v21[16 * v23];
  *((void *)v24 + 4) = v20;
  *((void *)v24 + 5) = v19;
  uint64_t v16 = *(void *)(inited + 48);
  uint64_t v18 = *(void *)(inited + 56);
  if (v18)
  {
LABEL_10:
    swift_bridgeObjectRetain();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v21 = sub_100053658(0, *((void *)v21 + 2) + 1, 1, v21);
    }
    unint64_t v26 = *((void *)v21 + 2);
    unint64_t v25 = *((void *)v21 + 3);
    if (v26 >= v25 >> 1) {
      uint64_t v21 = sub_100053658((char *)(v25 > 1), v26 + 1, 1, v21);
    }
    *((void *)v21 + 2) = v26 + 1;
    uint64_t v27 = &v21[16 * v26];
    *((void *)v27 + 4) = v16;
    *((void *)v27 + 5) = v18;
  }
LABEL_15:
  swift_bridgeObjectRelease();
  return v21;
}

void sub_1000231A8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000131E0(&qword_10007D0E8);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v123 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10005C300();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v123 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = (objc_class *)type metadata accessor for CRLSEiOSMainViewController();
  v134.receiver = v1;
  v134.super_class = v9;
  [super loadView];
  id v10 = [v1 extensionContext];

  if (!v10)
  {
    if (qword_10007C6D8 != -1) {
      swift_once();
    }
    swift_beginAccess();
    id v17 = (id)static OS_os_log.crlSharingExtension;
    uint64_t v18 = sub_10005C9C0();
    sub_100050FE0((uint64_t)v17, (uint64_t)&_mh_execute_header, v18, (uint64_t)"Unable to load NSExtensionContext. Cancelling request.", 54, 2, (uint64_t)&_swiftEmptyArrayStorage);

    uint64_t v19 = swift_allocObject();
    *(void *)(v19 + 16) = v1;
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      id v15 = (void *)Strong;
      v132 = sub_10002E638;
      uint64_t v133 = v19;
      *(void *)&long long aBlock = _NSConcreteStackBlock;
      *((void *)&aBlock + 1) = 1107296256;
      uint64_t v16 = &unk_100073490;
      goto LABEL_11;
    }
    goto LABEL_18;
  }
  sub_100022B60(v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_10001E8C0((uint64_t)v4, &qword_10007D0E8);
    if (qword_10007C6D8 != -1) {
      swift_once();
    }
    swift_beginAccess();
    id v11 = (id)static OS_os_log.crlSharingExtension;
    uint64_t v12 = sub_10005C9C0();
    sub_100050FE0((uint64_t)v11, (uint64_t)&_mh_execute_header, v12, (uint64_t)"Unable to resolve container URL. Cancelling request.", 52, 2, (uint64_t)&_swiftEmptyArrayStorage);

    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v1;
    uint64_t v14 = swift_unknownObjectWeakLoadStrong();
    if (v14)
    {
      id v15 = (void *)v14;
      v132 = sub_10002E638;
      uint64_t v133 = v13;
      *(void *)&long long aBlock = _NSConcreteStackBlock;
      *((void *)&aBlock + 1) = 1107296256;
      uint64_t v16 = &unk_1000734E0;
LABEL_11:
      *(void *)&long long v131 = sub_1000271D4;
      *((void *)&v131 + 1) = v16;
      uint64_t v21 = _Block_copy(&aBlock);
      id v22 = v1;
      swift_retain();
      swift_release();
      [v15 dismissViewControllerAnimated:1 completion:v21];
      swift_release();
      _Block_release(v21);

      return;
    }
LABEL_18:
    sub_100027728(v1);
    swift_release();
    return;
  }
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(v8, v4, v5);
  id v23 = sub_100022AEC();
  sub_10003D74C((uint64_t)v8);

  id v24 = [v1 view];
  if (!v24)
  {
    __break(1u);
LABEL_63:
    __break(1u);
LABEL_64:
    __break(1u);
    goto LABEL_65;
  }
  unint64_t v25 = v24;
  if (qword_10007C5E0 != -1) {
    swift_once();
  }
  uint64_t v125 = v5;
  [v25 setBackgroundColor:qword_10007CFB0, v6];

  id v26 = [v1 view];
  if (!v26) {
    goto LABEL_63;
  }
  uint64_t v27 = v26;
  [v26 setOpaque:0];

  [v1 setEdgesForExtendedLayout:0];
  id v28 = [v1 navigationItem];
  id v128 = self;
  id v29 = [v128 mainBundle];
  NSString v30 = sub_10005C7D0();
  id v31 = [v29 objectForInfoDictionaryKey:v30];

  if (v31)
  {
    sub_10005CB20();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v129, 0, sizeof(v129));
  }
  sub_10002E58C((uint64_t)v129, (uint64_t)&aBlock);
  v124 = v8;
  if (*((void *)&v131 + 1))
  {
    if (swift_dynamicCast())
    {
      NSString v32 = sub_10005C7D0();
      swift_bridgeObjectRelease();
      goto LABEL_25;
    }
  }
  else
  {
    sub_10001E8C0((uint64_t)&aBlock, (uint64_t *)&unk_10007D390);
  }
  NSString v32 = 0;
LABEL_25:
  [v28 setTitle:v32];

  id v33 = [v1 navigationItem];
  id v34 = [objc_allocWithZone((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:v1 action:"cancel:"];
  [v33 setLeftBarButtonItem:v34];

  type metadata accessor for CRLSEExtensionContextManager();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v35 = [v128 bundleForClass];
  NSString v36 = sub_10005C7D0();
  NSString v37 = sub_10005C7D0();
  v126 = "Recently Deleted";
  NSString v38 = sub_10005C7D0();
  id v39 = [v35 localizedStringForKey:v36 value:v37 table:v38];

  sub_10005C810();
  id v40 = [v1 navigationItem];
  *((void *)&v131 + 1) = v9;
  *(void *)&long long aBlock = v1;
  uint64_t v41 = v1;
  NSString v42 = sub_10005C7D0();
  swift_bridgeObjectRelease();
  uint64_t v43 = *((void *)&v131 + 1);
  if (*((void *)&v131 + 1))
  {
    uint64_t v44 = sub_10001BB00(&aBlock, *((uint64_t *)&v131 + 1));
    uint64_t v45 = *(void *)(v43 - 8);
    __chkstk_darwin(v44);
    char v47 = (char *)&v123 - ((v46 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v45 + 16))(v47);
    uint64_t v48 = sub_10005CDE0();
    (*(void (**)(char *, uint64_t))(v45 + 8))(v47, v43);
    sub_10001BB98((uint64_t)&aBlock);
  }
  else
  {
    uint64_t v48 = 0;
  }
  id v49 = [objc_allocWithZone((Class)UIBarButtonItem) initWithTitle:v42 style:2 target:v48 action:"save:"];

  swift_unknownObjectRelease();
  [v40 setRightBarButtonItem:v49];

  id v50 = [v128 bundleForClass:ObjCClassFromMetadata];
  NSString v51 = sub_10005C7D0();
  NSString v52 = sub_10005C7D0();
  NSString v53 = sub_10005C7D0();
  id v54 = [v50 localizedStringForKey:v51 value:v52 table:v53];

  sub_10005C810();
  id v55 = [v41 navigationItem];
  long long aBlock = 0u;
  long long v131 = 0u;
  NSString v56 = sub_10005C7D0();
  swift_bridgeObjectRelease();
  uint64_t v57 = *((void *)&v131 + 1);
  if (*((void *)&v131 + 1))
  {
    uint64_t v58 = sub_10001BB00(&aBlock, *((uint64_t *)&v131 + 1));
    uint64_t v59 = *(void *)(v57 - 8);
    __chkstk_darwin(v58);
    char v61 = (char *)&v123 - ((v60 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v59 + 16))(v61);
    uint64_t v62 = sub_10005CDE0();
    (*(void (**)(char *, uint64_t))(v59 + 8))(v61, v57);
    sub_10001BB98((uint64_t)&aBlock);
  }
  else
  {
    uint64_t v62 = 0;
  }
  id v63 = [objc_allocWithZone((Class)UIBarButtonItem) initWithTitle:v56 style:0 target:v62 action:0];

  swift_unknownObjectRelease();
  [v55 setBackBarButtonItem:v63];

  id v64 = [v41 navigationItem];
  id v65 = [v64 rightBarButtonItem];

  if (v65)
  {
    [v65 setEnabled:0];
  }
  id v66 = [objc_allocWithZone((Class)UIScrollView) init];
  uint64_t v67 = OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_scrollView;
  uint64_t v68 = *(void **)&v41[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_scrollView];
  *(void *)&v41[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_scrollView] = v66;

  uint64_t v69 = *(void **)&v41[v67];
  if (!v69) {
    goto LABEL_64;
  }
  [v69 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v70 = [v41 view];
  if (!v70)
  {
LABEL_65:
    __break(1u);
    goto LABEL_66;
  }
  if (!*(void *)&v41[v67])
  {
LABEL_66:
    __break(1u);
    goto LABEL_67;
  }
  id v71 = v70;
  [v70 addSubview:];

  id v72 = sub_100028DD4();
  uint64_t v73 = OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerView;
  Swift::String v74 = *(void **)&v41[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerView];
  *(void *)&v41[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerView] = v72;

  Swift::String v75 = *(void **)&v41[v67];
  if (!v75)
  {
LABEL_67:
    __break(1u);
    goto LABEL_68;
  }
  if (!*(void *)&v41[v73])
  {
LABEL_68:
    __break(1u);
    goto LABEL_69;
  }
  [v75 addSubview:];
  id v76 = [objc_allocWithZone((Class)UIView) init];
  uint64_t v77 = OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentView;
  Swift::String v78 = *(void **)&v41[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentView];
  *(void *)&v41[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentView] = v76;

  Swift::String v79 = *(void **)&v41[v77];
  if (!v79)
  {
LABEL_69:
    __break(1u);
    goto LABEL_70;
  }
  [v79 setTranslatesAutoresizingMaskIntoConstraints:0];
  Swift::String v80 = *(void **)&v41[v77];
  if (!v80)
  {
LABEL_70:
    __break(1u);
    goto LABEL_71;
  }
  [v80 setAccessibilityContainerType:4];
  Swift::String v81 = *(void **)&v41[v77];
  if (!v81)
  {
LABEL_71:
    __break(1u);
    goto LABEL_72;
  }
  [v81 setIsAccessibilityElement:0];
  uint64_t v82 = *(void **)&v41[v77];
  if (!v82)
  {
LABEL_72:
    __break(1u);
    goto LABEL_73;
  }
  id v83 = v82;
  id v84 = [v128 bundleForClass:ObjCClassFromMetadata];
  NSString v85 = sub_10005C7D0();
  NSString v86 = sub_10005C7D0();
  NSString v87 = sub_10005C7D0();
  id v88 = [v84 localizedStringForKey:v85 value:v86 table:v87];

  sub_10005C810();
  NSString v89 = sub_10005C7D0();
  swift_bridgeObjectRelease();
  [v83 setAccessibilityLabel:v89];

  char v90 = *(void **)&v41[v67];
  if (!v90)
  {
LABEL_73:
    __break(1u);
    goto LABEL_74;
  }
  if (!*(void *)&v41[v77])
  {
LABEL_74:
    __break(1u);
    goto LABEL_75;
  }
  [v90 addSubview:];
  id v91 = [objc_allocWithZone((Class)UITextView) init];
  uint64_t v92 = OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_sharedTextContent;
  char v93 = *(void **)&v41[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_sharedTextContent];
  *(void *)&v41[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_sharedTextContent] = v91;

  char v94 = *(void **)&v41[v92];
  if (!v94)
  {
LABEL_75:
    __break(1u);
    goto LABEL_76;
  }
  [v94 setTranslatesAutoresizingMaskIntoConstraints:0];
  char v95 = *(void **)&v41[v92];
  if (!v95)
  {
LABEL_76:
    __break(1u);
LABEL_77:
    __break(1u);
    goto LABEL_78;
  }
  uint64_t v96 = qword_10007C5D8;
  id v97 = v95;
  if (v96 != -1) {
    swift_once();
  }
  [v97 setBackgroundColor:qword_10007CFA8];

  char v98 = *(void **)&v41[v92];
  if (!v98) {
    goto LABEL_77;
  }
  id v99 = [v98 layer];
  [v99 setCornerRadius:12.0];

  v100 = *(void **)&v41[v92];
  if (!v100)
  {
LABEL_78:
    __break(1u);
    goto LABEL_79;
  }
  id v101 = v100;
  [v101 setTextContainerInset:16.0, 16.0, 16.0, 16.0];

  v102 = *(void **)&v41[v92];
  if (!v102)
  {
LABEL_79:
    __break(1u);
    goto LABEL_80;
  }
  v103 = self;
  id v104 = v102;
  id v105 = [v103 preferredFontForTextStyle:UIFontTextStyleBody];
  [v104 setFont:v105];

  v106 = *(void **)&v41[v92];
  if (!v106)
  {
LABEL_80:
    __break(1u);
    goto LABEL_81;
  }
  v107 = self;
  id v108 = v106;
  id v109 = [v107 labelColor];
  [v108 setTextColor:v109];

  v110 = *(void **)&v41[v92];
  uint64_t v111 = v125;
  if (!v110)
  {
LABEL_81:
    __break(1u);
    goto LABEL_82;
  }
  [v110 setScrollEnabled:0];
  v112 = *(void **)&v41[v92];
  if (!v112)
  {
LABEL_82:
    __break(1u);
    goto LABEL_83;
  }
  [v112 setContentMode:0];
  v113 = *(void **)&v41[v92];
  if (!v113)
  {
LABEL_83:
    __break(1u);
    goto LABEL_84;
  }
  [v113 setHidden:1];
  v114 = *(void **)&v41[v67];
  if (!v114)
  {
LABEL_84:
    __break(1u);
    goto LABEL_85;
  }
  v115 = v124;
  if (!*(void *)&v41[v92])
  {
LABEL_85:
    __break(1u);
    goto LABEL_86;
  }
  [v114 addSubview:];
  id v116 = [objc_allocWithZone((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:101];
  uint64_t v117 = OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_activityIndicator;
  v118 = *(void **)&v41[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_activityIndicator];
  *(void *)&v41[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_activityIndicator] = v116;

  v119 = *(void **)&v41[v117];
  if (!v119)
  {
LABEL_86:
    __break(1u);
    goto LABEL_87;
  }
  [v119 setTranslatesAutoresizingMaskIntoConstraints:0];
  v120 = *(void **)&v41[v117];
  if (!v120)
  {
LABEL_87:
    __break(1u);
    goto LABEL_88;
  }
  [v120 setHidesWhenStopped:1];
  id v121 = [v41 view];
  if (!v121)
  {
LABEL_88:
    __break(1u);
    goto LABEL_89;
  }
  if (*(void *)&v41[v117])
  {
    v122 = v121;
    [v121 addSubview:];

    (*(void (**)(char *, uint64_t))(v123 + 8))(v115, v111);
    return;
  }
LABEL_89:
  __break(1u);
}

void sub_1000242C8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000131E0(&qword_10007D198);
  __chkstk_darwin(v2 - 8);
  v248 = (char *)&v236 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000131E0(&qword_10007D0D0);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v236 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10005C3D0();
  uint64_t v246 = *(void *)(v8 - 8);
  uint64_t v247 = v8;
  __chkstk_darwin(v8);
  v245 = (char *)&v236 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v244 = type metadata accessor for CRLSEBoardIdentifier(0);
  uint64_t v243 = *(void *)(v244 - 8);
  __chkstk_darwin(v244);
  uint64_t v242 = (uint64_t)&v236 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000131E0((uint64_t *)&unk_10007D6F0);
  uint64_t v12 = __chkstk_darwin(v11 - 8);
  uint64_t v14 = (char *)&v236 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v236 - v15;
  uint64_t v17 = sub_1000131E0((uint64_t *)&unk_10007D1A0);
  uint64_t v18 = __chkstk_darwin(v17 - 8);
  v249 = (char *)&v236 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v236 - v20;
  uint64_t v22 = sub_1000131E0(&qword_10007D0D8);
  uint64_t v23 = __chkstk_darwin(v22 - 8);
  uint64_t v252 = (uint64_t)&v236 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v23);
  id v26 = (char *)&v236 - v25;
  uint64_t v27 = (uint64_t)&v0[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_selectedBoard];
  swift_beginAccess();
  sub_10001E85C(v27, (uint64_t)v26, &qword_10007D0D8);
  uint64_t v28 = type metadata accessor for CRLSEBoard(0);
  v250 = *(uint64_t (***)(char *, uint64_t))(v28 - 8);
  v251 = (int *)v28;
  LODWORD(v27) = v250[6](v26, 1);
  sub_10001E8C0((uint64_t)v26, &qword_10007D0D8);
  if (v27 == 1)
  {
    v239 = v21;
    uint64_t v240 = v5;
    uint64_t v241 = v4;
    id v29 = sub_100022AEC();
    uint64_t v30 = sub_1000437B0();

    uint64_t v31 = v30 + OBJC_IVAR____TtC24FreeformSharingExtension12CRLSELibrary_recents;
    swift_beginAccess();
    sub_10001E85C(v31, (uint64_t)v14, (uint64_t *)&unk_10007D6F0);
    uint64_t v32 = type metadata accessor for CRLSELibraryViewModeItemNode(0);
    uint64_t v33 = *(void *)(v32 - 8);
    id v34 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48);
    if (v34(v14, 1, v32))
    {
      sub_10001E8C0((uint64_t)v14, (uint64_t *)&unk_10007D6F0);
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v33 + 56))(v16, 1, 1, v32);
      swift_release();
    }
    else
    {
      uint64_t v35 = *(void *)&v14[*(int *)(v32 + 20)];
      swift_bridgeObjectRetain();
      sub_10001E8C0((uint64_t)v14, (uint64_t *)&unk_10007D6F0);
      if (*(void *)(v35 + 16))
      {
        sub_10002E3D4(v35 + ((*(unsigned __int8 *)(v33 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v33 + 80)), (uint64_t)v16, type metadata accessor for CRLSELibraryViewModeItemNode);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v33 + 56))(v16, 0, 1, v32);
      }
      else
      {
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v33 + 56))(v16, 1, 1, v32);
      }
      swift_release();
      swift_bridgeObjectRelease();
    }
    unsigned int v36 = v34(v16, 1, v32);
    uint64_t v5 = v240;
    if (v36 == 1)
    {
      sub_10001E8C0((uint64_t)v16, (uint64_t *)&unk_10007D6F0);
      uint64_t v37 = type metadata accessor for CRLSELibraryViewModel.Item(0);
      uint64_t v38 = (uint64_t)v239;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56))(v239, 1, 1, v37);
      uint64_t v4 = v241;
LABEL_16:
      uint64_t v63 = v252;
      ((void (*)(uint64_t, uint64_t, uint64_t, int *))v250[7])(v252, 1, 1, v251);
      sub_100022968(v63);
      goto LABEL_17;
    }
    uint64_t v38 = (uint64_t)v239;
    sub_10002E3D4((uint64_t)v16, (uint64_t)v239, type metadata accessor for CRLSELibraryViewModel.Item);
    sub_10002E43C((uint64_t)v16, type metadata accessor for CRLSELibraryViewModeItemNode);
    uint64_t v39 = type metadata accessor for CRLSELibraryViewModel.Item(0);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v39 - 8) + 56))(v38, 0, 1, v39);
    uint64_t v40 = (uint64_t)v249;
    sub_10001E85C(v38, (uint64_t)v249, (uint64_t *)&unk_10007D1A0);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    uint64_t v4 = v241;
    if (EnumCaseMultiPayload == 3)
    {
      uint64_t v50 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
      NSString v51 = (uint64_t *)(v40 + *(int *)(v50 + 48));
      uint64_t v53 = *v51;
      uint64_t v52 = v51[1];
      uint64_t v238 = v53;
      uint64_t v237 = v52;
      uint64_t v242 = v40 + *(int *)(v50 + 64);
      id v55 = v245;
      uint64_t v54 = v246;
      (*(void (**)(char *, uint64_t, uint64_t))(v246 + 32))(v245, v40, v247);
      uint64_t v56 = v252;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v243 + 56))(v252, 1, 1, v244);
      uint64_t v57 = v251;
      uint64_t v58 = v56 + v251[6];
      uint64_t v59 = v55;
      uint64_t v60 = v247;
      (*(void (**)(uint64_t, char *, uint64_t))(v54 + 16))(v58, v59, v247);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v54 + 56))(v58, 0, 1, v60);
      char v61 = (void *)(v56 + v57[5]);
      uint64_t v62 = v237;
      *char v61 = v238;
      v61[1] = v62;
      ((void (*)(uint64_t, void, uint64_t, int *))v250[7])(v56, 0, 1, v57);
      sub_100022968(v56);
      (*(void (**)(char *, uint64_t))(v54 + 8))(v245, v60);
      uint64_t v49 = v242;
    }
    else
    {
      if (EnumCaseMultiPayload != 2)
      {
        sub_10002E43C(v40, type metadata accessor for CRLSELibraryViewModel.Item);
        goto LABEL_16;
      }
      uint64_t v42 = sub_1000131E0(&qword_10007D1D0);
      uint64_t v43 = (uint64_t *)(v40 + *(int *)(v42 + 48));
      uint64_t v44 = v43[1];
      uint64_t v238 = *v43;
      v245 = (char *)(v40 + *(int *)(v42 + 80));
      uint64_t v45 = v242;
      sub_10002E36C(v40, v242, type metadata accessor for CRLSEBoardIdentifier);
      uint64_t v46 = v252;
      sub_10002E3D4(v45, v252, type metadata accessor for CRLSEBoardIdentifier);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v243 + 56))(v46, 0, 1, v244);
      char v47 = v251;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v246 + 56))(v46 + v251[6], 1, 1, v247);
      uint64_t v48 = (void *)(v46 + v47[5]);
      *uint64_t v48 = v238;
      v48[1] = v44;
      ((void (*)(uint64_t, void, uint64_t, int *))v250[7])(v46, 0, 1, v47);
      sub_100022968(v46);
      sub_10002E43C(v45, type metadata accessor for CRLSEBoardIdentifier);
      uint64_t v49 = (uint64_t)v245;
    }
    sub_10001E8C0(v49, (uint64_t *)&unk_10007D850);
LABEL_17:
    sub_10001E8C0(v38, (uint64_t *)&unk_10007D1A0);
  }
  uint64_t v64 = OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerView;
  id v65 = *(void **)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerView];
  if (!v65)
  {
    __break(1u);
LABEL_77:
    __break(1u);
LABEL_78:
    __break(1u);
LABEL_79:
    __break(1u);
    goto LABEL_80;
  }
  id v66 = v65;
  uint64_t v67 = sub_100027D2C(v66);

  uint64_t v68 = OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_dataSource;
  uint64_t v69 = *(void **)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_dataSource];
  *(void *)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_dataSource] = v67;

  sub_10002D900();
  sub_10005C6A0();
  v70._rawValue = &off_1000725E8;
  sub_10005C690(v70);
  sub_100022E5C();
  LOBYTE(v253[0]) = 0;
  sub_10005C680();
  swift_bridgeObjectRelease();
  id v71 = *(void **)&v1[v68];
  if (v71)
  {
    id v72 = v71;
    sub_10005C6F0();
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v252 = OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentView;
  uint64_t v73 = *(void **)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentView];
  if (!v73) {
    goto LABEL_77;
  }
  id v74 = [v73 widthAnchor];
  id v75 = [v1 traitCollection];
  unsigned __int8 v76 = [v75 crl_isCompactWidth];

  if (v76)
  {
    double v77 = 326.0;
  }
  else
  {
    unsigned int v78 = [self crl_landscapePhoneUI];
    double v77 = 624.0;
    if (v78) {
      double v77 = 326.0;
    }
  }
  id v79 = [v74 constraintLessThanOrEqualToConstant:v77];

  uint64_t v80 = OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentViewWidthConstraint;
  Swift::String v81 = *(void **)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentViewWidthConstraint];
  *(void *)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentViewWidthConstraint] = v79;
  uint64_t v82 = (uint64_t (**)(char *, uint64_t))v79;

  id v84 = *(void **)&v1[v80];
  if (v84)
  {
    LODWORD(v83) = 1132068864;
    [v84 setPriority:v83];
  }
  NSString v85 = *(void **)&v1[v252];
  if (!v85) {
    goto LABEL_78;
  }
  id v86 = [v85 heightAnchor];
  id v87 = [v1 traitCollection];
  unsigned __int8 v88 = [v87 crl_isCompactWidth];

  if (v88)
  {
    double v89 = 220.0;
  }
  else
  {
    unsigned int v90 = [self crl_landscapePhoneUI];
    double v89 = 360.0;
    if (v90) {
      double v89 = 220.0;
    }
  }
  id v91 = [v86 constraintEqualToConstant:v89];

  uint64_t v92 = *(void **)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentViewHeightConstraint];
  *(void *)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentViewHeightConstraint] = v91;
  char v93 = (char *)v91;

  char v94 = *(void **)&v1[v64];
  if (!v94) {
    goto LABEL_79;
  }
  id v95 = [v94 heightAnchor];
  uint64_t v96 = *((void *)sub_100022E5C() + 2);
  swift_bridgeObjectRelease();
  id v97 = [v95 constraintEqualToConstant:((double)v96 + 1.0) * 48.0];

  char v98 = *(void **)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerHeightContraint];
  *(void *)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerHeightContraint] = v97;
  id v99 = (int *)v97;

  sub_1000131E0((uint64_t *)&unk_10007D110);
  uint64_t v100 = swift_allocObject();
  *(_OWORD *)(v100 + 16) = xmmword_1000622A0;
  uint64_t v101 = OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_scrollView;
  v102 = *(void **)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_scrollView];
  if (!v102)
  {
LABEL_80:
    __break(1u);
    goto LABEL_81;
  }
  v250 = v82;
  v251 = v99;
  v249 = v93;
  id v103 = [v102 topAnchor];
  id v104 = [v1 view];
  if (!v104)
  {
LABEL_81:
    __break(1u);
    goto LABEL_82;
  }
  id v105 = v104;
  id v106 = [v104 safeAreaLayoutGuide];

  id v107 = [v106 topAnchor];
  id v108 = [v103 constraintEqualToAnchor:v107];

  *(void *)(v100 + 32) = v108;
  id v109 = *(void **)&v1[v101];
  if (!v109)
  {
LABEL_82:
    __break(1u);
    goto LABEL_83;
  }
  id v110 = [v109 leadingAnchor];
  id v111 = [v1 view];
  if (!v111)
  {
LABEL_83:
    __break(1u);
    goto LABEL_84;
  }
  v112 = v111;
  id v113 = [v111 safeAreaLayoutGuide];

  id v114 = [v113 leadingAnchor];
  id v115 = [v110 constraintEqualToAnchor:v114];

  *(void *)(v100 + 40) = v115;
  id v116 = *(void **)&v1[v101];
  if (!v116)
  {
LABEL_84:
    __break(1u);
    goto LABEL_85;
  }
  id v117 = [v116 bottomAnchor];
  id v118 = [v1 view];
  if (!v118)
  {
LABEL_85:
    __break(1u);
    goto LABEL_86;
  }
  v119 = v118;
  id v120 = [v118 safeAreaLayoutGuide];

  id v121 = [v120 bottomAnchor];
  id v122 = [v117 constraintEqualToAnchor:v121];

  *(void *)(v100 + 48) = v122;
  uint64_t v123 = *(void **)&v1[v101];
  if (!v123)
  {
LABEL_86:
    __break(1u);
    goto LABEL_87;
  }
  id v124 = [v123 trailingAnchor];
  id v125 = [v1 view];
  if (!v125)
  {
LABEL_87:
    __break(1u);
    goto LABEL_88;
  }
  v126 = v125;
  id v127 = [v125 safeAreaLayoutGuide];

  id v128 = [v127 trailingAnchor];
  id v129 = [v124 constraintEqualToAnchor:v128];

  *(void *)(v100 + 56) = v129;
  v130 = *(void **)&v1[v64];
  if (!v130)
  {
LABEL_88:
    __break(1u);
    goto LABEL_89;
  }
  id v131 = [v130 topAnchor];
  v132 = *(void **)&v1[v101];
  if (!v132)
  {
LABEL_89:
    __break(1u);
    goto LABEL_90;
  }
  id v133 = [v132 topAnchor];
  id v134 = [v131 constraintEqualToAnchor:v133 constant:16.0];

  *(void *)(v100 + 64) = v134;
  v135 = *(void **)&v1[v64];
  if (!v135)
  {
LABEL_90:
    __break(1u);
    goto LABEL_91;
  }
  id v136 = [v135 leadingAnchor];
  v137 = *(void **)&v1[v101];
  if (!v137)
  {
LABEL_91:
    __break(1u);
    goto LABEL_92;
  }
  id v138 = [v137 leadingAnchor];
  id v139 = [v136 constraintEqualToAnchor:v138];

  *(void *)(v100 + 72) = v139;
  v140 = *(void **)&v1[v64];
  if (!v140)
  {
LABEL_92:
    __break(1u);
    goto LABEL_93;
  }
  id v141 = [v140 trailingAnchor];
  v142 = *(void **)&v1[v101];
  if (!v142)
  {
LABEL_93:
    __break(1u);
    goto LABEL_94;
  }
  id v143 = [v142 trailingAnchor];
  id v144 = [v141 constraintEqualToAnchor:v143];

  *(void *)(v100 + 80) = v144;
  v145 = *(void **)&v1[v64];
  if (!v145)
  {
LABEL_94:
    __break(1u);
    goto LABEL_95;
  }
  id v146 = [v145 widthAnchor];
  v147 = *(void **)&v1[v101];
  if (!v147)
  {
LABEL_95:
    __break(1u);
    goto LABEL_96;
  }
  id v148 = [v147 widthAnchor];
  id v149 = [v146 constraintEqualToAnchor:v148];

  v150 = v251;
  *(void *)(v100 + 88) = v149;
  *(void *)(v100 + 96) = v150;
  uint64_t v151 = OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_sharedTextContent;
  v152 = *(void **)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_sharedTextContent];
  if (!v152)
  {
LABEL_96:
    __break(1u);
    goto LABEL_97;
  }
  v153 = v150;
  id v154 = [v152 topAnchor];
  v155 = *(void **)&v1[v64];
  if (!v155)
  {
LABEL_97:
    __break(1u);
    goto LABEL_98;
  }
  id v156 = [v155 bottomAnchor];
  id v157 = [v154 constraintEqualToAnchor:v156 constant:56.0];

  *(void *)(v100 + 104) = v157;
  v158 = *(void **)&v1[v151];
  if (!v158)
  {
LABEL_98:
    __break(1u);
    goto LABEL_99;
  }
  v251 = v153;
  id v159 = [v158 leadingAnchor];
  v160 = *(void **)&v1[v101];
  if (!v160)
  {
LABEL_99:
    __break(1u);
    goto LABEL_100;
  }
  id v161 = [v160 contentLayoutGuide];
  id v162 = [v161 leadingAnchor];

  id v163 = [v159 constraintEqualToAnchor:v162 constant:24.0];
  *(void *)(v100 + 112) = v163;
  v164 = *(void **)&v1[v151];
  if (!v164)
  {
LABEL_100:
    __break(1u);
    goto LABEL_101;
  }
  id v165 = [v164 trailingAnchor];
  v166 = *(void **)&v1[v101];
  if (!v166)
  {
LABEL_101:
    __break(1u);
    goto LABEL_102;
  }
  id v167 = [v166 contentLayoutGuide];
  id v168 = [v167 trailingAnchor];

  id v169 = [v165 constraintEqualToAnchor:v168 constant:-24.0];
  *(void *)(v100 + 120) = v169;
  v170 = *(void **)&v1[v151];
  if (!v170)
  {
LABEL_102:
    __break(1u);
    goto LABEL_103;
  }
  id v171 = [v170 bottomAnchor];
  v172 = *(void **)&v1[v101];
  uint64_t v173 = v252;
  if (!v172)
  {
LABEL_103:
    __break(1u);
    goto LABEL_104;
  }
  id v174 = [v172 contentLayoutGuide];
  id v175 = [v174 bottomAnchor];

  id v176 = [v171 constraintEqualToAnchor:v175 constant:-24.0];
  *(void *)(v100 + 128) = v176;
  v177 = *(void **)&v1[v173];
  if (!v177)
  {
LABEL_104:
    __break(1u);
    goto LABEL_105;
  }
  id v178 = [v177 topAnchor];
  v179 = *(void **)&v1[v64];
  if (!v179)
  {
LABEL_105:
    __break(1u);
    goto LABEL_106;
  }
  id v180 = [v179 bottomAnchor];
  id v181 = [v178 constraintEqualToAnchor:v180 constant:56.0];

  *(void *)(v100 + 136) = v181;
  v182 = *(void **)&v1[v173];
  if (!v182)
  {
LABEL_106:
    __break(1u);
    goto LABEL_107;
  }
  id v183 = [v182 leftAnchor];
  v184 = *(void **)&v1[v101];
  if (!v184)
  {
LABEL_107:
    __break(1u);
    goto LABEL_108;
  }
  id v185 = [v184 contentLayoutGuide];
  id v186 = [v185 leftAnchor];

  id v187 = [v183 constraintEqualToAnchor:v186];
  *(void *)(v100 + 144) = v187;
  v188 = *(void **)&v1[v173];
  if (!v188)
  {
LABEL_108:
    __break(1u);
    goto LABEL_109;
  }
  id v189 = [v188 rightAnchor];
  v190 = *(void **)&v1[v101];
  if (!v190)
  {
LABEL_109:
    __break(1u);
    goto LABEL_110;
  }
  id v191 = [v190 contentLayoutGuide];
  id v192 = [v191 rightAnchor];

  id v193 = [v189 constraintEqualToAnchor:v192];
  *(void *)(v100 + 152) = v193;
  v194 = *(void **)&v1[v173];
  if (!v194)
  {
LABEL_110:
    __break(1u);
    goto LABEL_111;
  }
  id v195 = [v194 bottomAnchor];
  v196 = *(void **)&v1[v101];
  if (!v196)
  {
LABEL_111:
    __break(1u);
    goto LABEL_112;
  }
  id v197 = [v196 contentLayoutGuide];
  id v198 = [v197 bottomAnchor];

  id v199 = [v195 constraintLessThanOrEqualToAnchor:v198 constant:-32.0];
  v201 = v249;
  v200 = v250;
  *(void *)(v100 + 160) = v199;
  *(void *)(v100 + 168) = v200;
  *(void *)(v100 + 176) = v201;
  uint64_t v202 = OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_activityIndicator;
  v203 = *(void **)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_activityIndicator];
  if (!v203)
  {
LABEL_112:
    __break(1u);
    goto LABEL_113;
  }
  v204 = v200;
  id v205 = v201;
  id v206 = [v203 centerXAnchor];
  id v207 = [v1 view];
  if (!v207)
  {
LABEL_113:
    __break(1u);
    goto LABEL_114;
  }
  v208 = v207;
  id v209 = [v207 centerXAnchor];

  id v210 = [v206 constraintEqualToAnchor:v209];
  *(void *)(v100 + 184) = v210;
  v211 = *(void **)&v1[v202];
  if (!v211)
  {
LABEL_114:
    __break(1u);
    goto LABEL_115;
  }
  id v212 = [v211 topAnchor];
  v213 = *(void **)&v1[v64];
  if (!v213)
  {
LABEL_115:
    __break(1u);
    goto LABEL_116;
  }
  v214 = v212;
  v215 = self;
  id v216 = [v213 bottomAnchor];
  id v217 = [v214 constraintEqualToAnchor:v216 constant:56.0];

  *(void *)(v100 + 192) = v217;
  v253[0] = v100;
  sub_10005C910();
  sub_10002DBB8(0, (unint64_t *)&qword_10007D3A0);
  Class isa = sub_10005C8F0().super.isa;
  swift_bridgeObjectRelease();
  [v215 activateConstraints:isa];

  id v219 = [v1 extensionContext];
  v220 = v251;
  if (v219)
  {
    v221 = v219;
    v222 = *(void **)&v1[v202];
    if (v222)
    {
      [v222 startAnimating];
      uint64_t v223 = sub_10005C990();
      uint64_t v224 = (uint64_t)v248;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v223 - 8) + 56))(v248, 1, 1, v223);
      sub_10005C970();
      v225 = v1;
      id v226 = v221;
      uint64_t v227 = sub_10005C960();
      v228 = (void *)swift_allocObject();
      v228[2] = v227;
      v228[3] = &protocol witness table for MainActor;
      v228[4] = v225;
      v228[5] = v226;
      sub_10002602C(v224, (uint64_t)&unk_10007D1B8, (uint64_t)v228);
      swift_release();

      goto LABEL_73;
    }
LABEL_116:
    __break(1u);
    return;
  }
LABEL_73:
  v229 = self;
  id v230 = [v229 defaultCenter];
  [v230 addObserver:v1 selector:"keyboardDidShowWithNotification:" name:UIKeyboardWillChangeFrameNotification object:0];

  id v231 = [v229 defaultCenter];
  [v231 addObserver:v1 selector:"keyboardWillHideWithNotification:" name:UIKeyboardWillHideNotification object:0];

  sub_1000131E0((uint64_t *)&unk_10007D730);
  uint64_t v232 = swift_allocObject();
  *(_OWORD *)(v232 + 16) = xmmword_100062290;
  *(void *)(v232 + 32) = sub_10005C670();
  *(void *)(v232 + 40) = &protocol witness table for UITraitHorizontalSizeClass;
  *(void *)(v232 + 48) = sub_10005C590();
  *(void *)(v232 + 56) = &protocol witness table for UITraitVerticalSizeClass;
  v253[3] = type metadata accessor for CRLSEiOSMainViewController();
  v253[0] = v1;
  v233 = v1;
  sub_10005CA10();
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  sub_10001BB98((uint64_t)v253);
  if (qword_10007C6D8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v234 = (id)static OS_os_log.crlSharingExtension;
  uint64_t v235 = sub_10005C9B0();
  sub_100050FE0((uint64_t)v234, (uint64_t)&_mh_execute_header, v235, (uint64_t)"Sharing Extension main view controller did load", 47, 2, (uint64_t)_swiftEmptyArrayStorage);
}

uint64_t sub_100025D0C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a4;
  v5[3] = a5;
  sub_10005C970();
  v5[4] = sub_10005C960();
  uint64_t v7 = sub_10005C950();
  v5[5] = v7;
  v5[6] = v6;
  return _swift_task_switch(sub_100025DA4, v7, v6);
}

uint64_t sub_100025DA4()
{
  v0[7] = sub_100022AEC();
  uint64_t v1 = (void *)swift_task_alloc();
  v0[8] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_100025E48;
  uint64_t v2 = v0[3];
  return sub_10003DC68(v2);
}

uint64_t sub_100025E48(uint64_t a1)
{
  uint64_t v2 = *v1;
  uint64_t v3 = *(void **)(*v1 + 56);
  *(void *)(*v1 + 72) = a1;
  swift_task_dealloc();

  uint64_t v4 = *(void *)(v2 + 48);
  uint64_t v5 = *(void *)(v2 + 40);
  return _swift_task_switch(sub_100025F90, v5, v4);
}

uint64_t sub_100025F90()
{
  uint64_t v1 = v0[9];
  uint64_t v2 = v0[2];
  swift_release();
  *(void *)(v2 + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_importItems) = v1;
  swift_bridgeObjectRelease();
  unint64_t v3 = swift_bridgeObjectRetain();
  sub_1000290F8(v3);
  swift_bridgeObjectRelease();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_10002602C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10005C990();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_10005C980();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10001E8C0(a1, &qword_10007D198);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_10005C950();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_100026220(char a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1000131E0(&qword_10007D0D8);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v19 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (objc_class *)type metadata accessor for CRLSEiOSMainViewController();
  v20.receiver = v2;
  v20.super_class = v7;
  [super viewWillAppear:a1 & 1];
  if (qword_10007C6D8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v8 = (id)static OS_os_log.crlSharingExtension;
  uint64_t v9 = sub_10005C9B0();
  sub_100050FE0((uint64_t)v8, (uint64_t)&_mh_execute_header, v9, (uint64_t)"Sharing Extension main view controller will appear", 50, 2, (uint64_t)_swiftEmptyArrayStorage);

  uint64_t v10 = *(void **)&v2[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerView];
  if (v10)
  {
    id v19 = *(id *)&v2[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerView];
    swift_getKeyPath();
    swift_allocObject();
    swift_unknownObjectWeakInit();
    id v11 = v10;
    uint64_t v12 = sub_10005C200();
    swift_release();
    swift_release();

    uint64_t v13 = *(void **)&v2[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerContentSizeObservation];
    *(void *)&v2[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerContentSizeObservation] = v12;

    id v14 = [v2 navigationItem];
    id v15 = [v14 rightBarButtonItem];

    if (v15)
    {
      uint64_t v16 = (uint64_t)&v2[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_selectedBoard];
      swift_beginAccess();
      sub_10001E85C(v16, (uint64_t)v6, &qword_10007D0D8);
      uint64_t v17 = type metadata accessor for CRLSEBoard(0);
      BOOL v18 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v17 - 8) + 48))(v6, 1, v17) != 1;
      sub_10001E8C0((uint64_t)v6, &qword_10007D0D8);
      [v15 setEnabled:v18];
    }
  }
  else
  {
    __break(1u);
  }
}

void sub_1000264DC(void **a1)
{
  uint64_t v1 = *a1;
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    unint64_t v3 = (void *)Strong;
    uint64_t v4 = *(void **)(Strong
                  + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerHeightContraint);
    if (v4)
    {
      [v4 constant];
      double v6 = v5;
    }
    else
    {
      double v6 = 0.0;
    }
    id v7 = [v1 collectionViewLayout];
    [v7 collectionViewContentSize];
    double v9 = v8;

    if (v9 > 0.0 && v9 != v6) {
      [v4 setConstant:v9];
    }
  }
}

void sub_100026618(char a1)
{
  uint64_t v2 = v1;
  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for CRLSEiOSMainViewController();
  [super viewWillDisappear:a1 & 1];
  uint64_t v4 = OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerContentSizeObservation;
  double v5 = *(void **)&v2[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerContentSizeObservation];
  if (v5)
  {
    id v6 = v5;
    sub_10005C1D0();

    double v5 = *(void **)&v2[v4];
  }
  *(void *)&v2[v4] = 0;
}

void sub_1000266EC()
{
  v11.receiver = v0;
  v11.super_class = (Class)type metadata accessor for CRLSEiOSMainViewController();
  [super viewDidLayoutSubviews];
  uint64_t v1 = *(void **)&v0[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerView];
  if (v1)
  {
    uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerHeightContraint];
    if (v2)
    {
      id v3 = v2;
      id v4 = v1;
      [v3 constant];
      double v6 = v5;
    }
    else
    {
      id v7 = v1;
      double v6 = 0.0;
    }
    id v8 = [v1 collectionViewLayout];
    [v8 collectionViewContentSize];
    double v10 = v9;

    if (v10 <= 0.0 || v10 == v6)
    {
    }
    else
    {
      [v2 setConstant:v10];

      uint64_t v2 = v1;
    }
  }
  else
  {
    __break(1u);
  }
}

id sub_10002683C()
{
  id v1 = [self defaultCenter];
  [v1 removeObserver:v0];

  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for CRLSEiOSMainViewController();
  return [super dealloc];
}

uint64_t sub_100026AA4()
{
  return type metadata accessor for CRLSEiOSMainViewController();
}

uint64_t type metadata accessor for CRLSEiOSMainViewController()
{
  uint64_t result = qword_10007D0A8;
  if (!qword_10007D0A8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id sub_100026AF8()
{
  id v1 = [v0 traitCollection];
  unsigned __int8 v2 = [v1 crl_isCompactWidth];

  if (v2)
  {
    double v3 = 220.0;
    double v4 = 326.0;
  }
  else
  {
    unsigned int v5 = [self crl_landscapePhoneUI];
    if (v5) {
      double v4 = 326.0;
    }
    else {
      double v4 = 624.0;
    }
    if (v5) {
      double v3 = 220.0;
    }
    else {
      double v3 = 360.0;
    }
  }
  double v6 = *(void **)&v0[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentViewWidthConstraint];
  if (v6) {
    [v6 setConstant:v4];
  }
  id v7 = *(void **)&v0[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentViewHeightConstraint];
  if (v7) {
    [v7 setConstant:v3];
  }
  id v8 = *(void **)&v0[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_previewViewWidthConstraint];
  if (v8) {
    [v8 setConstant:v4];
  }
  double v9 = *(void **)&v0[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_previewViewHeightConstraint];
  if (v9) {
    [v9 setConstant:v3];
  }
  id result = *(id *)&v0[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerView];
  if (result)
  {
    return [result reloadData];
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_100026CB0()
{
  id v1 = v0;
  uint64_t v2 = sub_10005C0D0();
  if (!v2) {
    return;
  }
  uint64_t v3 = v2;
  *(double *)&uint64_t v38 = COERCE_DOUBLE(sub_10005C810());
  double v39 = v4;
  sub_10005CB60();
  if (*(void *)(v3 + 16) && (unint64_t v5 = sub_10002CA90((uint64_t)v37), (v6 & 1) != 0))
  {
    sub_10002DFAC(*(void *)(v3 + 56) + 32 * v5, (uint64_t)&v42);
  }
  else
  {
    long long v42 = 0u;
    long long v43 = 0u;
  }
  sub_10002DF50((uint64_t)v37);
  if (!*((void *)&v43 + 1)) {
    goto LABEL_17;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_19:
    swift_bridgeObjectRelease();
    return;
  }
  double v7 = *(double *)&v38;
  *(double *)&uint64_t v38 = COERCE_DOUBLE(sub_10005C810());
  double v39 = v8;
  sub_10005CB60();
  if (*(void *)(v3 + 16) && (unint64_t v9 = sub_10002CA90((uint64_t)v37), (v10 & 1) != 0))
  {
    sub_10002DFAC(*(void *)(v3 + 56) + 32 * v9, (uint64_t)&v42);
  }
  else
  {
    long long v42 = 0u;
    long long v43 = 0u;
  }
  sub_10002DF50((uint64_t)v37);
  if (!*((void *)&v43 + 1))
  {
LABEL_17:
    swift_bridgeObjectRelease();
LABEL_18:
    sub_10001E8C0((uint64_t)&v42, (uint64_t *)&unk_10007D390);
    return;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_19;
  }
  uint64_t v11 = v38;
  *(double *)&uint64_t v38 = COERCE_DOUBLE(sub_10005C810());
  double v39 = v12;
  sub_10005CB60();
  if (*(void *)(v3 + 16) && (unint64_t v13 = sub_10002CA90((uint64_t)v37), (v14 & 1) != 0))
  {
    sub_10002DFAC(*(void *)(v3 + 56) + 32 * v13, (uint64_t)&v42);
  }
  else
  {
    long long v42 = 0u;
    long long v43 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10002DF50((uint64_t)v37);
  if (!*((void *)&v43 + 1)) {
    goto LABEL_18;
  }
  type metadata accessor for CGRect(0);
  if (swift_dynamicCast())
  {
    double v15 = *(double *)&v38;
    double v16 = v39;
    double v17 = v40;
    double v18 = v41;
    id v19 = [v1 view];
    if (v19)
    {
      objc_super v20 = v19;
      id v21 = [v1 view];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = v11 << 16;
        id v24 = [v21 window];

        [v20 convertRect:v24 fromView:v15, v16, v17, v18];
        uint64_t v26 = v25;
        uint64_t v28 = v27;
        uint64_t v30 = v29;
        uint64_t v32 = v31;

        uint64_t v33 = self;
        uint64_t v34 = swift_allocObject();
        swift_unknownObjectWeakInit();
        uint64_t v35 = (void *)swift_allocObject();
        v35[2] = v34;
        v35[3] = v26;
        v35[4] = v28;
        v35[5] = v30;
        v35[6] = v32;
        v37[4] = sub_10002E09C;
        v37[5] = v35;
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 1107296256;
        v37[2] = sub_1000271D4;
        v37[3] = &unk_1000733A0;
        unsigned int v36 = _Block_copy(v37);
        swift_release();
        [v33 animateWithDuration:v23 delay:v36 options:0 animations:v7 completion:0.0];
        _Block_release(v36);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
}

void sub_100027098(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    unint64_t v9 = (char *)Strong;
    uint64_t v10 = OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_scrollView;
    uint64_t v11 = *(void **)(Strong + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_scrollView);
    if (v11)
    {
      id v12 = v11;
      v20.origin.x = a1;
      v20.origin.y = a2;
      v20.size.width = a3;
      v20.size.height = a4;
      double Height = CGRectGetHeight(v20);
      id v14 = [v9 view];
      if (v14)
      {
        double v15 = v14;
        [v14 safeAreaInsets];
        double v17 = v16;

        [v12 setContentInset:0.0, 0.0, Height - v17, 0.0];
        double v18 = *(void **)&v9[v10];
        if (v18)
        {
          id v19 = v18;
          [v19 contentInset];
          [v19 setScrollIndicatorInsets:];

          return;
        }
LABEL_9:
        __break(1u);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_9;
  }
}

uint64_t sub_1000271D4(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_100027230()
{
  uint64_t v0 = sub_10005C0D0();
  if (v0)
  {
    uint64_t v1 = v0;
    uint64_t v14 = sub_10005C810();
    uint64_t v15 = v2;
    sub_10005CB60();
    if (*(void *)(v1 + 16) && (unint64_t v3 = sub_10002CA90((uint64_t)v13), (v4 & 1) != 0))
    {
      sub_10002DFAC(*(void *)(v1 + 56) + 32 * v3, (uint64_t)&v16);
    }
    else
    {
      long long v16 = 0u;
      long long v17 = 0u;
    }
    sub_10002DF50((uint64_t)v13);
    if (*((void *)&v17 + 1))
    {
      if ((swift_dynamicCast() & 1) == 0)
      {
        swift_bridgeObjectRelease();
        return;
      }
      double v5 = *(double *)&v14;
      uint64_t v14 = sub_10005C810();
      uint64_t v15 = v6;
      sub_10005CB60();
      if (*(void *)(v1 + 16) && (unint64_t v7 = sub_10002CA90((uint64_t)v13), (v8 & 1) != 0))
      {
        sub_10002DFAC(*(void *)(v1 + 56) + 32 * v7, (uint64_t)&v16);
      }
      else
      {
        long long v16 = 0u;
        long long v17 = 0u;
      }
      swift_bridgeObjectRelease();
      sub_10002DF50((uint64_t)v13);
      if (*((void *)&v17 + 1))
      {
        if (swift_dynamicCast())
        {
          uint64_t v9 = v14 << 16;
          uint64_t v10 = self;
          uint64_t v11 = swift_allocObject();
          swift_unknownObjectWeakInit();
          v13[4] = sub_10002DFA4;
          v13[5] = v11;
          v13[0] = _NSConcreteStackBlock;
          v13[1] = 1107296256;
          v13[2] = sub_1000271D4;
          v13[3] = &unk_100073350;
          id v12 = _Block_copy(v13);
          swift_release();
          [v10 animateWithDuration:v9 delay:v12 options:0 animations:v5 completion:0.0];
          _Block_release(v12);
        }
        return;
      }
    }
    else
    {
      swift_bridgeObjectRelease();
    }
    sub_10001E8C0((uint64_t)&v16, (uint64_t *)&unk_10007D390);
  }
}

void sub_1000274AC()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (char *)Strong;
    uint64_t v2 = OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_scrollView;
    unint64_t v3 = *(void **)(Strong + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_scrollView);
    if (v3)
    {
      [v3 setContentInset:UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right];
      char v4 = *(void **)&v1[v2];
      if (v4)
      {
        id v5 = v4;
        [v5 contentInset];
        [v5 setScrollIndicatorInsets:];

        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
}

uint64_t sub_100027578(void *a1, uint64_t a2, uint64_t a3, void (*a4)(char *))
{
  uint64_t v6 = sub_10005C0E0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10005C0C0();
  id v10 = a1;
  a4(v9);

  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

void sub_100027728(void *a1)
{
  sub_10005C810();
  id v2 = objc_allocWithZone((Class)NSError);
  NSString v3 = sub_10005C7D0();
  swift_bridgeObjectRelease();
  id v8 = [v2 initWithDomain:v3 code:3072 userInfo:0];

  id v4 = [a1 extensionContext];
  if (v4)
  {
    id v5 = v4;
    id v6 = v8;
    uint64_t v7 = (void *)sub_10005C1E0();

    [v5 cancelRequestWithError:v7];
  }
}

void sub_100027824()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_1000131E0(&qword_10007D0D8);
  __chkstk_darwin(v2 - 8);
  id v4 = (char *)aBlock - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0) + 32;
  uint64_t v5 = type metadata accessor for CRLSEBoard(0);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  id v8 = (char *)aBlock - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0) + 32;
  uint64_t v9 = (uint64_t)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_selectedBoard];
  swift_beginAccess();
  sub_10001E85C(v9, (uint64_t)v4, &qword_10007D0D8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
    sub_10001E8C0((uint64_t)v4, &qword_10007D0D8);
    return;
  }
  sub_10002E36C((uint64_t)v4, (uint64_t)v8, type metadata accessor for CRLSEBoard);
  id v10 = *(void **)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_sharedTextContent];
  if (v10)
  {
    id v11 = [v10 text];
    if (v11)
    {
      uint64_t v12 = v11;
      sub_10005C810();

      id v13 = objc_allocWithZone((Class)NSAttributedString);
      NSString v14 = sub_10005C7D0();
      swift_bridgeObjectRelease();
      id v15 = [v13 initWithString:v14];

      id v16 = sub_100022AEC();
      uint64_t v17 = *(void *)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_importItems];
      id v18 = v15;
      swift_bridgeObjectRetain();
      LOBYTE(v15) = sub_100040114((uint64_t)v8, v15, v17);

      swift_bridgeObjectRelease();
      if (v15)
      {
        id v19 = [objc_allocWithZone((Class)NSExtensionItem) init];
        sub_1000131E0((uint64_t *)&unk_10007D110);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_1000622B0;
        *(void *)(inited + 32) = v19;
        aBlock[0] = inited;
        sub_10005C910();
        unint64_t v21 = aBlock[0];
        id v22 = v19;
        id v23 = [v1 extensionContext];
        if (!v23)
        {
          sub_10002E43C((uint64_t)v8, type metadata accessor for CRLSEBoard);
          swift_bridgeObjectRelease();

          return;
        }
        id v24 = v23;
        sub_10003CCDC(v21);
        swift_bridgeObjectRelease();
        v25.super.Class isa = sub_10005C8F0().super.isa;
        swift_bridgeObjectRelease();
        [v24 completeRequestReturningItems:v25.super.isa completionHandler:0];
      }
      else
      {
        if (qword_10007C6D8 != -1) {
          swift_once();
        }
        swift_beginAccess();
        id v26 = (id)static OS_os_log.crlSharingExtension;
        uint64_t v27 = sub_10005C9C0();
        sub_100050FE0((uint64_t)v26, (uint64_t)&_mh_execute_header, v27, (uint64_t)"Unable to process shared content.  Cancelling request.", 54, 2, (uint64_t)_swiftEmptyArrayStorage);

        uint64_t v28 = swift_allocObject();
        *(void *)(v28 + 16) = v1;
        uint64_t Strong = (objc_class *)swift_unknownObjectWeakLoadStrong();
        if (!Strong)
        {
          sub_100027728(v1);

          swift_release();
          goto LABEL_15;
        }
        v25.super.Class isa = Strong;
        aBlock[4] = sub_10002DF48;
        aBlock[5] = v28;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = sub_1000271D4;
        aBlock[3] = &unk_100073328;
        uint64_t v30 = _Block_copy(aBlock);
        uint64_t v31 = v1;
        swift_retain();
        swift_release();
        [(objc_class *)v25.super.isa dismissViewControllerAnimated:1 completion:v30];
        swift_release();
        _Block_release(v30);
      }
LABEL_15:
      sub_10002E43C((uint64_t)v8, type metadata accessor for CRLSEBoard);
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_100027D2C(void *a1)
{
  id v43 = a1;
  uint64_t v1 = sub_1000131E0(&qword_10007D158);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  uint64_t v4 = __chkstk_darwin(v1);
  double v39 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __chkstk_darwin(v4);
  unsigned int v36 = (char *)&v36 - v6;
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v44 = (char *)&v36 - v8;
  __chkstk_darwin(v7);
  id v10 = (char *)&v36 - v9;
  uint64_t v42 = sub_1000131E0((uint64_t *)&unk_10007D160);
  uint64_t v11 = *(void *)(v42 - 8);
  uint64_t v40 = *(void *)(v11 + 64);
  uint64_t v12 = __chkstk_darwin(v42);
  double v41 = (char *)&v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v38 = (char *)&v36 - v14;
  sub_10005C810();
  sub_10002DBB8(0, &qword_10007D720);
  sub_10005C9E0();
  uint64_t v37 = v10;
  sub_10005C9D0();
  id v15 = v44;
  sub_10005C9D0();
  uint64_t v16 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v17 = *(void (**)(char *, char *, uint64_t))(v2 + 16);
  id v18 = v36;
  v17(v36, v10, v1);
  id v19 = v39;
  v17(v39, v15, v1);
  uint64_t v20 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v21 = (v20 + 24) & ~v20;
  uint64_t v22 = (v3 + v20 + v21) & ~v20;
  uint64_t v23 = swift_allocObject();
  *(void *)(v23 + 16) = v16;
  uint64_t v24 = v23 + v21;
  NSArray v25 = *(void (**)(uint64_t, char *, uint64_t))(v2 + 32);
  v25(v24, v18, v1);
  v25(v23 + v22, v19, v1);
  id v26 = objc_allocWithZone((Class)sub_1000131E0((uint64_t *)&unk_10007D170));
  id v27 = v43;
  uint64_t v28 = sub_10005C6B0();
  uint64_t v30 = v41;
  uint64_t v29 = v42;
  uint64_t v31 = v38;
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v41, v38, v42);
  unint64_t v32 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  uint64_t v33 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v33 + v32, v30, v29);
  sub_10005C6C0();
  uint64_t v34 = *(void (**)(char *, uint64_t))(v2 + 8);
  v34(v44, v1);
  v34(v37, v1);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v31, v29);
  return v28;
}

uint64_t sub_1000281AC(void *a1)
{
  uint64_t v2 = sub_10005C660();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v21[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10005CA80();
  type metadata accessor for CRLSEExtensionContextManager();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v7 = [self bundleForClass:ObjCClassFromMetadata];
  NSString v8 = sub_10005C7D0();
  NSString v9 = sub_10005C7D0();
  NSString v10 = sub_10005C7D0();
  id v11 = [v7 localizedStringForKey:v8 value:v9 table:v10];

  sub_10005C810();
  sub_10005C640();
  uint64_t v12 = self;
  if (qword_10007C5D0 != -1) {
    swift_once();
  }
  id v13 = [v12 preferredFontForTextStyle:qword_10007CFA0];
  uint64_t v14 = (void (*)(uint64_t *, void))sub_10005C5F0();
  sub_10005C5D0();
  v14(v21, 0);
  v21[3] = v2;
  v21[4] = (uint64_t)&protocol witness table for UIListContentConfiguration;
  id v15 = sub_100022698(v21);
  (*(void (**)(uint64_t *, char *, uint64_t))(v3 + 16))(v15, v5, v2);
  sub_10005CA50();
  UIAccessibilityTraits v16 = UIAccessibilityTraitHeader;
  unint64_t v17 = (unint64_t)[a1 accessibilityTraits];
  if ((v16 & ~v17) != 0) {
    UIAccessibilityTraits v18 = v16;
  }
  else {
    UIAccessibilityTraits v18 = 0;
  }
  [a1 setAccessibilityTraits:v18 | v17];
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_1000284A0()
{
  uint64_t v0 = sub_10005C660();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v11[-1] - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10005CA80();
  swift_bridgeObjectRetain();
  sub_10005C640();
  uint64_t v4 = (void (*)(uint64_t *, void))sub_10005C5F0();
  sub_10005C5C0();
  v4(v11, 0);
  uint64_t v5 = (void (*)(uint64_t *, void))sub_10005C5F0();
  sub_10005C5B0();
  v5(v11, 0);
  id v6 = [self secondaryLabelColor];
  id v7 = (void (*)(uint64_t *, void))sub_10005C630();
  sub_10005C5E0();
  v7(v11, 0);
  v11[3] = v0;
  v11[4] = (uint64_t)&protocol witness table for UIListContentConfiguration;
  NSString v8 = sub_100022698(v11);
  (*(void (**)(uint64_t *, char *, uint64_t))(v1 + 16))(v8, v3, v0);
  sub_10005CA50();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_10002868C(void *a1)
{
  uint64_t v2 = sub_10005C660();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v14[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10005CA80();
  swift_bridgeObjectRetain();
  sub_10005C640();
  id v6 = [self linkColor];
  id v7 = (void (*)(uint64_t *, void))sub_10005C5F0();
  sub_10005C5E0();
  v7(v14, 0);
  v14[3] = v2;
  v14[4] = (uint64_t)&protocol witness table for UIListContentConfiguration;
  NSString v8 = sub_100022698(v14);
  (*(void (**)(uint64_t *, char *, uint64_t))(v3 + 16))(v8, v5, v2);
  sub_10005CA50();
  UIAccessibilityTraits v9 = UIAccessibilityTraitButton;
  unint64_t v10 = (unint64_t)[a1 accessibilityTraits];
  if ((v9 & ~v10) != 0) {
    UIAccessibilityTraits v11 = v9;
  }
  else {
    UIAccessibilityTraits v11 = 0;
  }
  [a1 setAccessibilityTraits:v11 | v10];
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

id sub_100028850(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v38 = a6;
  uint64_t v39 = a1;
  v32[1] = a5;
  uint64_t v8 = sub_1000131E0((uint64_t *)&unk_10007D740);
  __chkstk_darwin(v8 - 8);
  uint64_t v35 = (char *)v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10005C570();
  uint64_t v36 = *(void *)(v10 - 8);
  uint64_t v37 = v10;
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)v32 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10005C530();
  uint64_t v33 = *(void *)(v13 - 8);
  uint64_t v34 = v13;
  __chkstk_darwin(v13);
  id v15 = (char *)v32 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_10005C460();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  id v19 = (char *)v32 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = *a3;
  uint64_t v21 = a3[1];
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v23 = (void *)Strong;
    unint64_t v24 = *((void *)sub_100022E5C() + 2);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, a2, v16);
    if (v24 < 2)
    {
      (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
    }
    else
    {
      uint64_t v25 = sub_10005C450();
      (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
      if (!v25)
      {
        uint64_t v40 = v20;
        uint64_t v41 = v21;
        sub_10002DBB8(0, &qword_10007D720);
        swift_bridgeObjectRetain();
        id v26 = (void *)sub_10005C9F0();
        swift_bridgeObjectRelease();
        sub_1000131E0((uint64_t *)&unk_10007D180);
        sub_10005C580();
        *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000622C0;
        uint64_t v28 = v33;
        uint64_t v27 = v34;
        (*(void (**)(char *, void, uint64_t))(v33 + 104))(v15, enum case for UICellAccessory.DisplayedState.always(_:), v34);
        uint64_t v29 = sub_10005C540();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v35, 1, 1, v29);
        id v30 = v26;
        sub_10005C560();
        sub_10005C550();
        (*(void (**)(char *, uint64_t))(v36 + 8))(v12, v37);
        (*(void (**)(char *, uint64_t))(v28 + 8))(v15, v27);
        sub_10005CA70();

LABEL_8:
        return v30;
      }
    }
    uint64_t v40 = v20;
    uint64_t v41 = v21;
    sub_10002DBB8(0, &qword_10007D720);
    swift_bridgeObjectRetain();
    id v30 = (id)sub_10005C9F0();
    swift_bridgeObjectRelease();
    goto LABEL_8;
  }
  return 0;
}

uint64_t sub_100028D10(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (sub_10005C810() == a2 && v4 == a3)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v6 = sub_10005CDF0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) == 0) {
      return 0;
    }
  }
  sub_10002DBB8(0, &qword_10007D720);
  return sub_10005CA00();
}

id sub_100028DD4()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10005C710();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10005C700();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10005C750();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for UICollectionLayoutListConfiguration.Appearance.insetGrouped(_:), v6);
  sub_10005C720();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for UICollectionLayoutListConfiguration.HeaderMode.supplementary(_:), v2);
  sub_10005C730();
  sub_10002DBB8(0, &qword_10007D150);
  uint64_t v14 = (void *)sub_10005CA90();
  id result = [v1 view];
  if (result)
  {
    uint64_t v16 = result;
    [result bounds];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;

    id v25 = [objc_allocWithZone((Class)UICollectionView) initWithFrame:v14 collectionViewLayout:v18];
    [v25 setCollectionViewLayout:v14];
    [v25 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v25 setScrollEnabled:0];
    [v25 setDelegate:v1];

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    return v25;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1000290F8(unint64_t a1)
{
  p_imp = v1;
  unint64_t v3 = a1;
  unint64_t v4 = a1 >> 62;
  if (a1 >> 62)
  {
LABEL_18:
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_10005CCA0();
    if (v5) {
      goto LABEL_3;
    }
LABEL_19:
    swift_bridgeObjectRelease();
    goto LABEL_20;
  }
  uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v5) {
    goto LABEL_19;
  }
LABEL_3:
  uint64_t v36 = p_imp;
  uint64_t v6 = 4;
  p_imp = &stru_100079FF0.imp;
  while (1)
  {
    if ((v3 & 0xC000000000000001) != 0) {
      id v7 = (id)sub_10005CBE0();
    }
    else {
      id v7 = *(id *)(v3 + 8 * v6);
    }
    uint64_t v8 = v7;
    uint64_t v9 = v6 - 3;
    if (__OFADD__(v6 - 4, 1))
    {
      __break(1u);
      goto LABEL_18;
    }
    id v10 = [v7 attributedText];
    if (v10) {
      break;
    }
LABEL_4:

    ++v6;
    if (v9 == v5)
    {
      swift_bridgeObjectRelease();
      p_imp = v36;
      goto LABEL_20;
    }
  }
  uint64_t v11 = v10;
  if ((uint64_t)[v10 length] <= 0)
  {

    goto LABEL_4;
  }
  p_imp = v36;
  uint64_t v12 = *(IMP *)((char *)v36 + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_sharedTextContent);
  if (!v12) {
    goto LABEL_43;
  }
  id v13 = v12;
  swift_bridgeObjectRelease();
  NSString v14 = [v11 string];
  if (!v14)
  {
    sub_10005C810();
    NSString v14 = sub_10005C7D0();
    swift_bridgeObjectRelease();
  }
  [v13 setText:v14];

LABEL_20:
  id v37 = (id)sub_1000295AC(v3);
  if (v4)
  {
    swift_bridgeObjectRetain();
    uint64_t v15 = sub_10005CCA0();
    swift_bridgeObjectRelease();
    if (!v5) {
      goto LABEL_29;
    }
  }
  else
  {
    uint64_t v15 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v5)
    {
LABEL_29:
      while (1)
      {
        uint64_t v18 = OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentView;
        double v19 = *(IMP *)((char *)p_imp + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentView);
        if (!v19) {
          goto LABEL_41;
        }
        [v19 setIsAccessibilityElement:1];
        type metadata accessor for CRLSEExtensionContextManager();
        uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
        id v21 = [self bundleForClass:ObjCClassFromMetadata];
        NSString v22 = sub_10005C7D0();
        NSString v23 = sub_10005C7D0();
        NSString v24 = sub_10005C7D0();
        id v25 = [v21 localizedStringForKey:v22 value:v23 table:v24];

        sub_10005C810();
        uint64_t v26 = sub_100033D84(v3);
        if (v27)
        {
          uint64_t v28 = *(IMP *)((char *)p_imp + v18);
          if (!v28) {
            goto LABEL_42;
          }
          uint64_t v29 = v26;
          uint64_t v30 = v27;
          sub_1000131E0(&qword_10007D870);
          uint64_t v31 = swift_allocObject();
          *(_OWORD *)(v31 + 16) = xmmword_1000622C0;
          *(void *)(v31 + 56) = &type metadata for String;
          *(void *)(v31 + 64) = sub_10002D9AC();
          *(void *)(v31 + 32) = v29;
          *(void *)(v31 + 40) = v30;
          unint64_t v3 = v28;
          sub_10005C7E0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          NSString v32 = sub_10005C7D0();
          swift_bridgeObjectRelease();
          [(id)v3 setAccessibilityLabel:v32];

          uint64_t v33 = *(IMP *)((char *)p_imp + v18);
          if (v33)
          {
LABEL_33:
            id v34 = v33;
            Class isa = sub_10005C8F0().super.isa;
            [v34 setAccessibilityElements:isa];

LABEL_34:
            sub_10002A27C(v37);

            return;
          }
        }
        else
        {
          swift_bridgeObjectRelease();
          uint64_t v33 = *(IMP *)((char *)p_imp + v18);
          if (v33) {
            goto LABEL_33;
          }
        }
        __break(1u);
LABEL_39:
        swift_bridgeObjectRetain();
        id v16 = (id)sub_10005CBE0();
        swift_bridgeObjectRelease();
LABEL_28:
        int v17 = sub_1000324F8();

        if (v17 == 2) {
          goto LABEL_34;
        }
      }
    }
  }
  if (v15 > 2) {
    goto LABEL_29;
  }
  if ((v3 & 0xC000000000000001) != 0) {
    goto LABEL_39;
  }
  if (*(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v16 = *(id *)(v3 + 32);
    goto LABEL_28;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
}

uint64_t sub_1000295AC(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_10005CCA0();
    swift_bridgeObjectRelease();
    if (v6 >= 2) {
      goto LABEL_3;
    }
    swift_bridgeObjectRetain();
    uint64_t result = sub_10005CCA0();
    uint64_t v2 = (void *)result;
    if (!result)
    {
LABEL_11:
      swift_bridgeObjectRelease();
      uint64_t v5 = sub_1000296BC(v2, 0);

      return v5;
    }
LABEL_7:
    if ((a1 & 0xC000000000000001) != 0)
    {
      id v4 = (id)sub_10005CBE0();
    }
    else
    {
      if (!*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        __break(1u);
        return result;
      }
      id v4 = *(id *)(a1 + 32);
    }
    uint64_t v2 = v4;
    goto LABEL_11;
  }
  uint64_t v2 = *(void **)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if ((unint64_t)v2 <= 1)
  {
    uint64_t result = swift_bridgeObjectRetain();
    if (!v2) {
      goto LABEL_11;
    }
    goto LABEL_7;
  }
LABEL_3:

  return sub_100029930(a1);
}

uint64_t sub_1000296BC(void *a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_10005C300();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000131E0(&qword_10007D0E8);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1) {
    return 0;
  }
  id v13 = a1;
  int v14 = sub_1000324F8();
  if (!v14)
  {
    uint64_t v15 = sub_10002A6A4(v13, a2 & 1);
    goto LABEL_9;
  }
  if (v14 == 1)
  {
    uint64_t v15 = sub_10002ACB8(v13, a2 & 1);
LABEL_9:
    uint64_t v18 = v15;

    return (uint64_t)v18;
  }
  id v16 = [v13 url];
  if (v16)
  {
    int v17 = v16;
    sub_10005C290();

    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v12, v9, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v12, 0, 1, v6);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v12, 1, v6) != 1)
    {
      sub_10001E8C0((uint64_t)v12, &qword_10007D0E8);
      uint64_t v15 = sub_10002CB9C(v13);
      goto LABEL_9;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v12, 1, 1, v6);
  }
  uint64_t result = sub_10001E8C0((uint64_t)v12, &qword_10007D0E8);
  double v20 = *(void **)(v3 + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_sharedTextContent);
  if (v20)
  {
    id v21 = v20;
    [v21 setHidden:0];

    return 0;
  }
  __break(1u);
  return result;
}

uint64_t sub_100029930(unint64_t a1)
{
  unint64_t v6 = a1;
  unint64_t v7 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v29 = sub_10005CCA0();
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_10005CCA0();
    uint64_t result = swift_bridgeObjectRelease();
    if (v12 < 0)
    {
      __break(1u);
      return result;
    }
    if (v29 >= 3) {
      uint64_t v31 = 3;
    }
    else {
      uint64_t v31 = v29;
    }
    if (v29 >= 0) {
      unint64_t v8 = v31;
    }
    else {
      unint64_t v8 = 3;
    }
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_10005CCA0();
    swift_bridgeObjectRelease();
    if (v17 < (uint64_t)v8)
    {
      __break(1u);
      goto LABEL_37;
    }
  }
  else
  {
    if (*(uint64_t *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10) >= 3) {
      unint64_t v8 = 3;
    }
    else {
      unint64_t v8 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRetain();
  }
  if ((v6 & 0xC000000000000001) != 0 && v8)
  {
    sub_10002DBB8(0, &qword_10007D120);
    Swift::Int v9 = 0;
    do
    {
      Swift::Int v10 = v9 + 1;
      sub_10005CBD0(v9);
      Swift::Int v9 = v10;
    }
    while (v8 != v10);
  }
  if (v7)
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = sub_10005CCB0();
    uint64_t v12 = v14;
    uint64_t v2 = v15;
    unint64_t v3 = v16;
    uint64_t v11 = v13;
    swift_bridgeObjectRelease_n();
  }
  else
  {
    uint64_t v2 = 0;
    uint64_t v11 = v6 & 0xFFFFFFFFFFFFFF8;
    uint64_t v12 = v11 + 32;
    unint64_t v3 = (2 * v8) | 1;
  }
  uint64_t v17 = (uint64_t)&AVMetadataIdentifierQuickTimeMetadataAlbum_ptr;
  p_imp = &stru_100079FF0.imp;
  id v5 = [objc_allocWithZone((Class)UIView) init];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 setAutoresizesSubviews:1];
  unint64_t v7 = v1;
  uint64_t v66 = v11;
  uint64_t v18 = v11;
  unint64_t v6 = 0;
  sub_10002CFBC(v18, v12, v2, v3, v7);
  unint64_t v8 = v19;

  unint64_t v73 = v8;
  if (!(v8 >> 62))
  {
    id v20 = *(id *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_15;
  }
LABEL_37:
  swift_bridgeObjectRetain();
  id v20 = (id)sub_10005CCA0();
  swift_bridgeObjectRelease();
LABEL_15:
  uint64_t v21 = (v3 >> 1) - v2;
  if (__OFSUB__(v3 >> 1, v2))
  {
    __break(1u);
    goto LABEL_39;
  }
  if (v21 < 2 || (uint64_t)v20 >= v21) {
    goto LABEL_20;
  }
  id v22 = [objc_allocWithZone(*(Class *)(v17 + 656)) init];
  id v23 = [self systemWhiteColor];
  [v22 setBackgroundColor:v23];

  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v12 = (uint64_t)v22;
  sub_10005C8E0();
  if (*(void *)((v73 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v73 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    goto LABEL_59;
  }
  while (1)
  {
    sub_10005C940();
    sub_10005C910();

    unint64_t v8 = v73;
LABEL_20:
    id v20 = (id)v7;
    unint64_t v24 = swift_bridgeObjectRetain();
    unint64_t v7 = (unint64_t)sub_10002D318(v24);
    swift_bridgeObjectRelease();

    if (v7 >> 62)
    {
LABEL_39:
      swift_bridgeObjectRetain();
      uint64_t v25 = sub_10005CCA0();
      if (!v25) {
        goto LABEL_40;
      }
    }
    else
    {
      uint64_t v25 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (!v25) {
        goto LABEL_40;
      }
    }
    if (v25 >= 1) {
      break;
    }
    __break(1u);
LABEL_59:
    sub_10005C920();
  }
  for (uint64_t i = 0; i != v25; ++i)
  {
    if ((v7 & 0xC000000000000001) != 0) {
      id v27 = (id)sub_10005CBE0();
    }
    else {
      id v27 = *(id *)(v7 + 8 * i + 32);
    }
    uint64_t v28 = v27;
    [v5 insertSubview:v27 atIndex:0];
  }
LABEL_40:
  swift_bridgeObjectRelease_n();
  id v32 = [v20 traitCollection];
  unsigned __int8 v33 = [v32 crl_isCompactWidth];

  if (v33)
  {
    double v34 = 184.0;
  }
  else if (objc_msgSend(self, "crl_landscapePhoneUI"))
  {
    double v34 = 184.0;
  }
  else
  {
    double v34 = 300.0;
  }
  uint64_t v69 = sub_1000131E0((uint64_t *)&unk_10007D110);
  uint64_t v35 = swift_allocObject();
  *(_OWORD *)(v35 + 16) = xmmword_1000622D0;
  id v36 = [v5 widthAnchor];
  id v37 = [v36 constraintEqualToConstant:v34];

  *(void *)(v35 + 32) = v37;
  id v38 = [v5 heightAnchor];
  id v39 = [v5 widthAnchor];
  id v40 = [v38 constraintEqualToAnchor:v39];

  *(void *)(v35 + 40) = v40;
  sub_10005C910();
  uint64_t v41 = &v63;
  uint64_t v42 = (void *)v35;
  id v72 = _swiftEmptyArrayStorage;
  if (v8 >> 62) {
    goto LABEL_55;
  }
  uint64_t v43 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain_n();
  for (unint64_t j = v6; v43; unint64_t j = v6)
  {
    uint64_t v63 = v41;
    uint64_t v64 = v42;
    id v70 = v5;
    unint64_t v44 = v8;
    unint64_t v68 = v8 & 0xC000000000000001;
    unint64_t v8 = 4;
    long long v67 = xmmword_1000622E0;
    while (1)
    {
      uint64_t v45 = v8 - 4;
      id v46 = v68 ? (id)sub_10005CBE0() : *(id *)(v44 + 8 * v8);
      char v47 = v46;
      unint64_t v6 = v8 - 3;
      if (__OFADD__(v45, 1)) {
        break;
      }
      double v48 = v34 + (double)v45 * -24.0;
      uint64_t v49 = swift_allocObject();
      *(_OWORD *)(v49 + 16) = v67;
      uint64_t v42 = (void *)v43;
      id v50 = [v47 widthAnchor];
      id v51 = [v50 constraintEqualToConstant:v48];

      *(void *)(v49 + 32) = v51;
      id v52 = [v47 heightAnchor];
      id v53 = [v52 constraintEqualToConstant:v48];

      *(void *)(v49 + 40) = v53;
      id v54 = [v47 centerXAnchor];
      id v5 = [v70 centerXAnchor];
      id v55 = [v54 constraintEqualToAnchor:v5];

      uint64_t v43 = (uint64_t)v42;
      *(void *)(v49 + 48) = v55;
      id v71 = (void *)v49;
      sub_10005C910();
      uint64_t v41 = v71;

      sub_100052134((unint64_t)v41);
      ++v8;
      if ((void *)v6 == v42)
      {
        swift_bridgeObjectRelease();
        uint64_t v56 = v72;
        id v5 = v70;
        uint64_t v42 = v64;
        goto LABEL_57;
      }
    }
    __break(1u);
LABEL_55:
    swift_bridgeObjectRetain_n();
    uint64_t v43 = sub_10005CCA0();
  }
  swift_bridgeObjectRelease();
  uint64_t v56 = _swiftEmptyArrayStorage;
LABEL_57:
  swift_bridgeObjectRelease();
  id v57 = [v5 subviews];
  sub_10002DBB8(0, &qword_10007D128);
  unint64_t v58 = sub_10005C900();

  __chkstk_darwin(v59);
  *(&v63 - 2) = v5;
  uint64_t v60 = sub_10002D4DC(v58, (void (*)(unint64_t, id))sub_10002DAA4);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v72 = v42;
  sub_100052134((unint64_t)v56);
  sub_100052134((unint64_t)v60);
  char v61 = self;
  sub_10002DBB8(0, (unint64_t *)&qword_10007D3A0);
  Class isa = sub_10005C8F0().super.isa;
  swift_bridgeObjectRelease();
  [v61 activateConstraints:isa];

  swift_unknownObjectRelease();
  return (uint64_t)v5;
}

id sub_10002A1D8(uint64_t a1, id a2, void *a3)
{
  double v4 = (double)a1 * 8.0;
  id v5 = [a2 topAnchor];
  id v6 = [a3 topAnchor];
  id v7 = [v5 constraintEqualToAnchor:v6 constant:v4];

  return v7;
}

void sub_10002A27C(void *a1)
{
  uint64_t v2 = v1;
  double v4 = *(void **)((char *)v2 + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_activityIndicator);
  if (!v4)
  {
    __break(1u);
LABEL_20:
    __break(1u);
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  [v4 stopAnimating];
  if (!a1) {
    return;
  }
  id v5 = *(void **)((char *)v2 + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentView);
  if (!v5) {
    goto LABEL_20;
  }
  id v37 = (char *)OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentView;
  id v6 = a1;
  [v5 addSubview:v6];
  id v7 = [v6 widthAnchor];
  id v8 = [v2 traitCollection];
  unsigned __int8 v9 = [v8 crl_isCompactWidth];

  if (v9)
  {
    double v10 = 326.0;
  }
  else
  {
    unsigned int v11 = [self crl_landscapePhoneUI];
    double v10 = 624.0;
    if (v11) {
      double v10 = 326.0;
    }
  }
  id v12 = [v7 constraintLessThanOrEqualToConstant:v10];

  id v13 = [v6 heightAnchor];
  id v14 = [v2 traitCollection];
  unsigned __int8 v15 = [v14 crl_isCompactWidth];

  if (v15)
  {
    double v16 = 220.0;
  }
  else
  {
    unsigned int v17 = [self crl_landscapePhoneUI];
    double v16 = 360.0;
    if (v17) {
      double v16 = 220.0;
    }
  }
  id v18 = [v13 constraintLessThanOrEqualToConstant:v16];

  unint64_t v19 = *(void **)((char *)v2
                 + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_previewViewWidthConstraint);
  *(void *)((char *)v2
            + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_previewViewWidthConstraint) = v12;
  id v36 = v12;

  id v20 = *(void **)((char *)v2
                 + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_previewViewHeightConstraint);
  *(void *)((char *)v2
            + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_previewViewHeightConstraint) = v18;
  id v21 = v18;

  sub_1000131E0((uint64_t *)&unk_10007D110);
  uint64_t v22 = swift_allocObject();
  *(_OWORD *)(v22 + 16) = xmmword_1000622F0;
  id v23 = [v6 topAnchor];
  unint64_t v24 = *(void **)&v37[(void)v2];
  if (!v24) {
    goto LABEL_21;
  }
  id v25 = [v24 topAnchor];
  id v26 = [v23 constraintEqualToAnchor:v25];

  *(void *)(v22 + 32) = v26;
  id v27 = [v6 centerXAnchor];
  uint64_t v28 = *(void **)&v37[(void)v2];
  if (!v28)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v29 = v27;
  uint64_t v30 = self;
  id v31 = [v28 centerXAnchor];
  id v32 = [v29 constraintEqualToAnchor:v31];

  *(void *)(v22 + 40) = v32;
  *(void *)(v22 + 48) = v36;
  *(void *)(v22 + 56) = v21;
  sub_10005C910();
  sub_10002DBB8(0, (unint64_t *)&qword_10007D3A0);
  id v33 = v36;
  id v38 = v21;
  Class isa = sub_10005C8F0().super.isa;
  swift_bridgeObjectRelease();
  [v30 activateConstraints:isa];

  uint64_t v35 = *(void **)((char *)v2 + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_sharedTextContent);
  if (!v35)
  {
LABEL_23:
    __break(1u);
    return;
  }
  [v35 setHidden:1];
}

void *sub_10002A6A4(void *a1, char a2)
{
  uint64_t v4 = sub_1000131E0(&qword_10007D0E8);
  __chkstk_darwin(v4 - 8);
  id v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10005C300();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  unsigned int v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  id v13 = (char *)&v28 - v12;
  id v14 = [a1 url];
  if (!v14)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
    goto LABEL_6;
  }
  unsigned __int8 v15 = v14;
  sub_10005C290();

  double v16 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
  v16(v6, v11, v7);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
LABEL_6:
    sub_10001E8C0((uint64_t)v6, &qword_10007D0E8);
    goto LABEL_7;
  }
  v16(v13, v6, v7);
  sub_10005C2B0();
  id v17 = objc_allocWithZone((Class)UIImage);
  NSString v18 = sub_10005C7D0();
  swift_bridgeObjectRelease();
  id v19 = [v17 initWithContentsOfFile:v18];

  if (v19)
  {
    id v20 = (void *)sub_10002A9F4(v19);

    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
    goto LABEL_10;
  }
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
LABEL_7:
  id v21 = [a1 image];
  if (v21)
  {
    uint64_t v22 = v21;
    id v20 = (void *)sub_10002A9F4(v21);
  }
  else
  {
    id v20 = 0;
  }
LABEL_10:
  id v23 = [objc_allocWithZone((Class)UIImageView) initWithImage:v20];
  unint64_t v24 = v23;
  if (v23)
  {
    [v23 setTranslatesAutoresizingMaskIntoConstraints:0];
    if (a2) {
      uint64_t v25 = 2;
    }
    else {
      uint64_t v25 = 1;
    }
    id v26 = v24;
    [v26 setContentMode:v25];
  }
  return v24;
}

uint64_t sub_10002A9F4(void *a1)
{
  id v3 = [v1 traitCollection];
  unsigned __int8 v4 = [v3 crl_isCompactWidth];

  if (v4)
  {
    double v5 = 220.0;
    double v6 = 326.0;
  }
  else
  {
    unsigned int v7 = [self crl_landscapePhoneUI];
    if (v7) {
      double v6 = 326.0;
    }
    else {
      double v6 = 624.0;
    }
    if (v7) {
      double v5 = 220.0;
    }
    else {
      double v5 = 360.0;
    }
  }
  [a1 size];
  if (v6 / v5 >= v8 / v9)
  {
    if (v8 / v9 < v6 / v5) {
      double v6 = v8 * (v5 / v9);
    }
  }
  else
  {
    double v5 = v9 * (v6 / v8);
  }
  id v10 = [objc_allocWithZone((Class)UIGraphicsImageRenderer) initWithSize:v6, v5];
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a1;
  *(double *)(v11 + 24) = v6;
  *(double *)(v11 + 32) = v5;
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = sub_10002DA38;
  *(void *)(v12 + 24) = v11;
  v17[4] = sub_10002DA64;
  v17[5] = v12;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 1107296256;
  v17[2] = sub_10002AC6C;
  v17[3] = &unk_1000731C0;
  id v13 = _Block_copy(v17);
  id v14 = a1;
  swift_retain();
  swift_release();
  id v15 = [v10 imageWithActions:v13];

  _Block_release(v13);
  LOBYTE(v10) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if ((v10 & 1) == 0) {
    return (uint64_t)v15;
  }
  __break(1u);
  return result;
}

void sub_10002AC6C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

char *sub_10002ACB8(void *a1, int a2)
{
  uint64_t v5 = sub_1000131E0(&qword_10007D0E8);
  __chkstk_darwin(v5 - 8);
  unsigned int v7 = (char *)&v69 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10005C300();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v69 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  id v14 = (char *)&v69 - v13;
  id v15 = [a1 url];
  if (v15)
  {
    double v16 = v15;
    sub_10005C290();

    id v17 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v17(v7, v12, v8);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) != 1)
    {
      id v72 = v2;
      LODWORD(v73) = a2;
      v17(v14, v7, v8);
      sub_10005C270(v18);
      id v20 = v19;
      id v21 = [self assetWithURL:v19];

      id v22 = [objc_allocWithZone((Class)AVAssetImageGenerator) initWithAsset:v21];
      CMTimeScale timescale = kCMTimeZero.timescale;
      CMTimeFlags flags = kCMTimeZero.flags;
      CMTimeEpoch epoch = kCMTimeZero.epoch;
      v78.value = kCMTimeZero.value;
      v78.CMTimeScale timescale = timescale;
      v78.CMTimeFlags flags = flags;
      v78.CMTimeEpoch epoch = epoch;
      [v22 setRequestedTimeToleranceAfter:&v78];
      v78.value = kCMTimeZero.value;
      v78.CMTimeScale timescale = timescale;
      v78.CMTimeFlags flags = flags;
      id v26 = v21;
      v78.CMTimeEpoch epoch = epoch;
      [v22 setRequestedTimeToleranceBefore:&v78];
      [v22 setAppliesPreferredTrackTransform:1];
      Class isa = (Class)[v21 commonMetadata];
      if (!isa)
      {
        sub_10002DBB8(0, (unint64_t *)&unk_10007D0F0);
        sub_10005C900();
        Class isa = sub_10005C8F0().super.isa;
        swift_bridgeObjectRelease();
      }
      sub_10002DBB8(0, (unint64_t *)&unk_10007D0F0);
      uint64_t v28 = sub_10005C900();
      if (objc_msgSend(v21, "crl_containsVideoTracks"))
      {

        CMTimeMake(&v78, 0, 1);
        id v77 = 0;
        id v29 = [v22 copyCGImageAtTime:&v78 actualTime:0 error:&v77];
        id v30 = v77;
        if (v29)
        {
          id v31 = v29;
          id v32 = objc_allocWithZone((Class)UIImage);
          id v33 = v30;
          id v34 = [v32 initWithCGImage:v31];

          if (!v34) {
            goto LABEL_27;
          }
LABEL_18:
          id v50 = v34;
          swift_bridgeObjectRelease();
          id v51 = (void *)sub_10002A9F4(v50);
          uint64_t v35 = (char *)[objc_allocWithZone((Class)UIImageView) initWithImage:v51];

          [v35 setTranslatesAutoresizingMaskIntoConstraints:0];
          if (v73) {
            uint64_t v52 = 2;
          }
          else {
            uint64_t v52 = 1;
          }
          [v35 setContentMode:v52];

          goto LABEL_28;
        }
        uint64_t v70 = v28;
        id v71 = v21;
        id v53 = v77;
        id v26 = (void *)sub_10005C1F0();

        swift_willThrow();
        if (qword_10007C6D8 == -1) {
          goto LABEL_23;
        }
        goto LABEL_32;
      }
      id v36 = [self metadataItemsFromArray:isa filteredByIdentifier:AVMetadataCommonIdentifierArtwork];

      unint64_t v37 = sub_10005C900();
      if (v37 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v66 = sub_10005CCA0();
        swift_bridgeObjectRelease();
        if (v66)
        {
LABEL_13:
          if ((v37 & 0xC000000000000001) != 0)
          {
            id v38 = (id)sub_10005CBE0();
          }
          else
          {
            if (!*(void *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x10))
            {
              __break(1u);
LABEL_32:
              swift_once();
LABEL_23:
              swift_beginAccess();
              id v54 = (void *)static OS_os_log.crlSharingExtension;
              sub_1000131E0(&qword_10007D870);
              uint64_t inited = swift_initStackObject();
              *(_OWORD *)(inited + 16) = xmmword_100062290;
              swift_getErrorValue();
              uint64_t v56 = v75;
              id v72 = v26;
              uint64_t v57 = v76;
              uint64_t v73 = v54;
              uint64_t v58 = Error.publicDescription.getter(v56, v57);
              uint64_t v60 = v59;
              *(void *)(inited + 56) = &type metadata for String;
              unint64_t v61 = sub_10002D9AC();
              *(void *)(inited + 64) = v61;
              *(void *)(inited + 32) = v58;
              *(void *)(inited + 40) = v60;
              swift_getErrorValue();
              uint64_t v62 = Error.fullDescription.getter(v74);
              *(void *)(inited + 96) = &type metadata for String;
              *(void *)(inited + 104) = v61;
              *(void *)(inited + 72) = v62;
              *(void *)(inited + 80) = v63;
              uint64_t v64 = sub_10005C9C0();
              id v65 = (void *)v73;
              sub_100050FE0(v73, (uint64_t)&_mh_execute_header, v64, (uint64_t)"Error creating video thumbnail : %{public}@ <%@>", 48, 2, inited);
              swift_setDeallocating();
              sub_1000131E0(&qword_10007D108);
              swift_arrayDestroy();

              swift_errorRelease();
              id v26 = v71;
              uint64_t v28 = v70;
              goto LABEL_27;
            }
            id v38 = *(id *)(v37 + 32);
          }
          id v39 = v38;
          swift_bridgeObjectRelease();
          id v40 = [v39 dataValue];
          if (v40)
          {
            uint64_t v41 = v40;
            uint64_t v42 = sub_10005C330();
            uint64_t v70 = v28;
            uint64_t v43 = v42;
            id v71 = v26;
            unint64_t v45 = v44;

            id v46 = objc_allocWithZone((Class)UIImage);
            Class v47 = sub_10005C320().super.isa;
            id v34 = [v46 initWithData:v47];
            uint64_t v48 = v43;
            uint64_t v28 = v70;
            unint64_t v49 = v45;
            id v26 = v71;
            sub_10002D954(v48, v49);

            if (v34) {
              goto LABEL_18;
            }
          }
          else
          {
          }
LABEL_27:
          (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
          id v67 = objc_allocWithZone((Class)type metadata accessor for CRLSEAudioPreviewView());
          uint64_t v35 = sub_100030A18(v28, v12, 220.0, 220.0);

LABEL_28:
          (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
          return v35;
        }
      }
      else if (*(void *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
        goto LABEL_13;
      }
      swift_bridgeObjectRelease();
      goto LABEL_27;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
  }
  sub_10001E8C0((uint64_t)v7, &qword_10007D0E8);
  return 0;
}

uint64_t sub_10002B548(void *a1, uint64_t a2, void *a3)
{
  uint64_t v6 = sub_10005C770();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10005C790();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t result = __chkstk_darwin(v10);
  id v14 = (char *)v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a2)
  {
    swift_errorRetain();
    if (qword_10007C6D8 != -1) {
      swift_once();
    }
    swift_beginAccess();
    id v15 = (void *)static OS_os_log.crlSharingExtension;
    sub_1000131E0(&qword_10007D870);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_100062290;
    swift_getErrorValue();
    uint64_t v17 = v34[6];
    uint64_t v18 = v34[7];
    id v19 = v15;
    uint64_t v20 = Error.publicDescription.getter(v17, v18);
    uint64_t v22 = v21;
    *(void *)(inited + 56) = &type metadata for String;
    unint64_t v23 = sub_10002D9AC();
    *(void *)(inited + 64) = v23;
    *(void *)(inited + 32) = v20;
    *(void *)(inited + 40) = v22;
    swift_getErrorValue();
    uint64_t v24 = Error.fullDescription.getter(v34[2]);
    *(void *)(inited + 96) = &type metadata for String;
    *(void *)(inited + 104) = v23;
    *(void *)(inited + 72) = v24;
    *(void *)(inited + 80) = v25;
    uint64_t v26 = sub_10005C9C0();
    sub_100050FE0((uint64_t)v19, (uint64_t)&_mh_execute_header, v26, (uint64_t)"Error loading link metadata: %{public}@ <%@>", 44, 2, inited);
    swift_setDeallocating();
    sub_1000131E0(&qword_10007D108);
    swift_arrayDestroy();

    return swift_errorRelease();
  }
  else if (a1)
  {
    sub_10002DBB8(0, &qword_10007D130);
    id v27 = a1;
    v34[0] = v7;
    id v28 = v27;
    id v29 = (void *)sub_10005CA30();
    uint64_t v30 = swift_allocObject();
    *(void *)(v30 + 16) = a3;
    *(void *)(v30 + 24) = v28;
    aBlock[4] = sub_10002DAF4;
    aBlock[5] = v30;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1000271D4;
    aBlock[3] = &unk_100073260;
    id v31 = _Block_copy(aBlock);
    id v32 = v28;
    id v33 = a3;
    swift_release();
    sub_10005C780();
    aBlock[0] = _swiftEmptyArrayStorage;
    sub_10002DB04();
    sub_1000131E0(&qword_10007D140);
    sub_10002DB5C();
    sub_10005CB30();
    sub_10005CA40();
    _Block_release(v31);

    (*(void (**)(char *, uint64_t))(v34[0] + 8))(v9, v6);
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v14, v10);
  }
  return result;
}

void sub_10002B984(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

void sub_10002BA10(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1000131E0(&qword_10007D0D0);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = &v19[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = sub_1000131E0(&qword_10007D0D8);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = &v19[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10002E3D4(a1, (uint64_t)v10, type metadata accessor for CRLSEBoard);
  uint64_t v11 = type metadata accessor for CRLSEBoard(0);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v10, 0, 1, v11);
  sub_100022968((uint64_t)v10);
  sub_10002D900();
  sub_10005C6A0();
  v12._rawValue = &off_100072688;
  sub_10005C690(v12);
  sub_100022E5C();
  v19[15] = 0;
  sub_10005C680();
  swift_bridgeObjectRelease();
  uint64_t v13 = *(void **)&v2[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_dataSource];
  if (v13)
  {
    id v14 = v13;
    sub_10005C6F0();
  }
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
  id v15 = [v2 view];
  if (v15)
  {
    double v16 = v15;
    [v15 setNeedsLayout];

    id v17 = [v2 view];
    if (v17)
    {
      uint64_t v18 = v17;
      [v17 layoutIfNeeded];

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_10002BC8C(void *a1, uint64_t a2)
{
  id v3 = v2;
  uint64_t v6 = type metadata accessor for CRLSELibraryViewModeItemNode(0);
  uint64_t v39 = *(void *)(v6 - 8);
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v37 = (uint64_t)&v37 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v38 = (uint64_t)&v37 - v9;
  uint64_t v10 = sub_1000131E0((uint64_t *)&unk_10007D6F0);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v13 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  id v15 = (char *)&v37 - v14;
  uint64_t v16 = sub_10005C460();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  id v19 = (char *)&v37 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  Class isa = sub_10005C430().super.isa;
  [a1 deselectItemAtIndexPath:isa animated:0];

  unint64_t v21 = *((void *)sub_100022E5C() + 2);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v19, a2, v16);
  if (v21 < 2)
  {
    (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
    goto LABEL_7;
  }
  uint64_t v22 = sub_10005C450();
  (*(void (**)(char *, uint64_t))(v17 + 8))(v19, v16);
  if (v22)
  {
LABEL_7:
    type metadata accessor for CRLSEiOSCreateBoardViewController();
    id v27 = (char *)[objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
    *(void *)&v27[OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController_delegate + 8] = &off_100073158;
    swift_unknownObjectWeakAssign();
    id v28 = [v3 navigationController];
    if (v28)
    {
      id v29 = v28;
      [v28 pushViewController:v27 animated:1];
    }
    return;
  }
  id v23 = sub_100022AEC();
  uint64_t v24 = sub_1000437B0();

  uint64_t v25 = v24 + OBJC_IVAR____TtC24FreeformSharingExtension12CRLSELibrary_allBoards;
  swift_beginAccess();
  sub_10001E85C(v25, (uint64_t)v15, (uint64_t *)&unk_10007D6F0);
  uint64_t v26 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v39 + 48);
  if (v26(v15, 1, v6))
  {
    sub_10001E8C0((uint64_t)v15, (uint64_t *)&unk_10007D6F0);
LABEL_5:
    swift_release();
    return;
  }
  uint64_t v30 = *(void *)&v15[*(int *)(v6 + 20)];
  swift_bridgeObjectRetain();
  sub_10001E8C0((uint64_t)v15, (uint64_t *)&unk_10007D6F0);
  uint64_t v31 = *(void *)(v30 + 16);
  swift_bridgeObjectRelease();
  if (!v31) {
    goto LABEL_5;
  }
  sub_100052300((uint64_t)v13);
  if (v26(v13, 1, v6) == 1)
  {
    swift_release();
    sub_10001E8C0((uint64_t)v13, (uint64_t *)&unk_10007D6F0);
  }
  else
  {
    uint64_t v32 = v38;
    sub_10002E36C((uint64_t)v13, v38, type metadata accessor for CRLSELibraryViewModeItemNode);
    uint64_t v33 = v37;
    sub_10002E3D4(v32, v37, type metadata accessor for CRLSELibraryViewModeItemNode);
    id v34 = (char *)sub_10003C21C(v33);
    *(void *)&v34[OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController_delegate + 8] = &off_100073148;
    swift_unknownObjectWeakAssign();
    id v35 = [v3 navigationController];
    if (v35)
    {
      id v36 = v35;
      [v35 pushViewController:v34 animated:1];

      swift_release();
      sub_10002E43C(v32, type metadata accessor for CRLSELibraryViewModeItemNode);
    }
    else
    {
      sub_10002E43C(v32, type metadata accessor for CRLSELibraryViewModeItemNode);
      swift_release();
    }
  }
}

id sub_10002C288(uint64_t a1, uint64_t a2, void *a3)
{
  swift_unknownObjectWeakInit();
  uint64_t v6 = &v3[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_selectedBoard];
  uint64_t v7 = type metadata accessor for CRLSEBoard(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  *(void *)&v3[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_importItems] = _swiftEmptyArrayStorage;
  *(void *)&v3[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController____lazy_storage___extensionContextManager] = 0;
  *(void *)&v3[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerContentSizeObservation] = 0;
  *(void *)&v3[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_scrollView] = 0;
  *(void *)&v3[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerView] = 0;
  *(void *)&v3[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_sharedTextContent] = 0;
  *(void *)&v3[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentView] = 0;
  *(void *)&v3[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_activityIndicator] = 0;
  *(void *)&v3[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerHeightContraint] = 0;
  *(void *)&v3[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentViewWidthConstraint] = 0;
  *(void *)&v3[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentViewHeightConstraint] = 0;
  *(void *)&v3[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_previewViewWidthConstraint] = 0;
  *(void *)&v3[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_previewViewHeightConstraint] = 0;
  *(void *)&v3[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_sharedTextConstraints] = _swiftEmptyArrayStorage;
  *(void *)&v3[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_sharedTextConstraintsCompact] = _swiftEmptyArrayStorage;
  *(void *)&v3[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_sharedTextConstraintsCompactLandscape] = _swiftEmptyArrayStorage;
  *(void *)&v3[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_dataSource] = 0;
  if (a2)
  {
    NSString v8 = sub_10005C7D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }
  v11.receiver = v3;
  v11.super_class = (Class)type metadata accessor for CRLSEiOSMainViewController();
  [super initWithNibName:v8 bundle:a3];

  return v9;
}

id sub_10002C4B4(void *a1)
{
  swift_unknownObjectWeakInit();
  id v3 = &v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_selectedBoard];
  uint64_t v4 = type metadata accessor for CRLSEBoard(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 1, 1, v4);
  *(void *)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_importItems] = _swiftEmptyArrayStorage;
  *(void *)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController____lazy_storage___extensionContextManager] = 0;
  *(void *)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerContentSizeObservation] = 0;
  *(void *)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_scrollView] = 0;
  *(void *)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerView] = 0;
  *(void *)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_sharedTextContent] = 0;
  *(void *)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentView] = 0;
  *(void *)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_activityIndicator] = 0;
  *(void *)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerHeightContraint] = 0;
  *(void *)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentViewWidthConstraint] = 0;
  *(void *)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentViewHeightConstraint] = 0;
  *(void *)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_previewViewWidthConstraint] = 0;
  *(void *)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_previewViewHeightConstraint] = 0;
  *(void *)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_sharedTextConstraints] = _swiftEmptyArrayStorage;
  *(void *)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_sharedTextConstraintsCompact] = _swiftEmptyArrayStorage;
  *(void *)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_sharedTextConstraintsCompactLandscape] = _swiftEmptyArrayStorage;
  *(void *)&v1[OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_dataSource] = 0;
  v7.receiver = v1;
  v7.super_class = (Class)type metadata accessor for CRLSEiOSMainViewController();
  [super initWithCoder:a1];

  return v5;
}

void sub_10002C66C()
{
  sub_10002C738();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_10002C738()
{
  if (!qword_10007D0B8)
  {
    type metadata accessor for CRLSEBoard(255);
    unint64_t v0 = sub_10005CAB0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10007D0B8);
    }
  }
}

unsigned char *storeEnumTagSinglePayload for CRLSEiOSMainViewController.CollectionViewSection(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x10002C82CLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for CRLSEiOSMainViewController.CollectionViewSection()
{
  return &type metadata for CRLSEiOSMainViewController.CollectionViewSection;
}

unint64_t sub_10002C868()
{
  unint64_t result = qword_10007D0C0;
  if (!qword_10007D0C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D0C0);
  }
  return result;
}

uint64_t sub_10002C8BC(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  unsigned int v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *unsigned int v4 = v2;
  v4[1] = sub_10002C998;
  return v6(a1);
}

uint64_t sub_10002C998()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_10002CA90(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_10005CB40(*(void *)(v2 + 40));

  return sub_10002CAD4(a1, v4);
}

unint64_t sub_10002CAD4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_10002E008(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_10005CB50();
      sub_10002DF50((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

id sub_10002CB9C(void *a1)
{
  uint64_t v2 = sub_1000131E0(&qword_10007D0E8);
  __chkstk_darwin(v2 - 8);
  unint64_t v4 = (char *)aBlock - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_10005C300();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  id v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  objc_super v11 = (char *)aBlock - v10;
  id v12 = [a1 url];
  if (!v12)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
    goto LABEL_5;
  }
  uint64_t v13 = v12;
  sub_10005C290();

  uint64_t v14 = *(void (**)(char *, char *, uint64_t))(v6 + 32);
  v14(v4, v9, v5);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v6 + 56))(v4, 0, 1, v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5) == 1)
  {
LABEL_5:
    sub_10001E8C0((uint64_t)v4, &qword_10007D0E8);
    return 0;
  }
  v14(v11, v4, v5);
  id v15 = objc_allocWithZone((Class)LPLinkView);
  sub_10005C270(v16);
  uint64_t v18 = v17;
  id v19 = [v15 initWithURL:v17];

  [v19 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v19 setAutoresizesSubviews:1];
  [v19 _setPreferredSizeClass:3];
  [v19 _setDisablePlayback:1];
  [v19 _setDisableLinkFollowing:1];
  [v19 _setDisableTapGesture:1];
  [v19 _setDisableAnimations:1];
  [v19 _setDisablePlayback:1];
  [v19 _setDisableAutoPlay:1];
  [v19 _setDisablePreviewGesture:1];
  [v19 _setDisableHighlightGesture:1];
  [v19 _setDisablePlaybackControls:1];
  id v20 = [objc_allocWithZone((Class)LPMetadataProvider) init];
  sub_10005C270(v21);
  id v23 = v22;
  uint64_t v24 = swift_allocObject();
  *(void *)(v24 + 16) = v19;
  aBlock[4] = sub_10002DAAC;
  aBlock[5] = v24;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10002B984;
  aBlock[3] = &unk_100073210;
  uint64_t v25 = _Block_copy(aBlock);
  id v26 = v19;
  swift_release();
  [v20 startFetchingMetadataForURL:v23 completionHandler:v25];
  _Block_release(v25);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v11, v5);
  return v26;
}

void sub_10002CFBC(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v34 = a5;
  uint64_t v33 = sub_10005C300();
  uint64_t v10 = *(void *)(v33 - 8);
  __chkstk_darwin(v33);
  uint64_t v31 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000131E0(&qword_10007D0E8);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)&v27 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v35 = (unint64_t)_swiftEmptyArrayStorage;
  int64_t v15 = a4 >> 1;
  if (a4 >> 1 == a3) {
    return;
  }
  id v29 = (void (**)(char *, char *, uint64_t))(v10 + 32);
  uint64_t v30 = OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_sharedTextContent;
  uint64_t v32 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56);
  id v28 = (unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48);
  swift_unknownObjectRetain();
  while (a3 < v15)
  {
    uint64_t v16 = v6;
    id v17 = *(id *)(a2 + 8 * a3);
    int v18 = sub_1000324F8();
    if (!v18)
    {
      id v19 = sub_10002A6A4(v17, 1);
      goto LABEL_13;
    }
    if (v18 == 1)
    {
      id v19 = sub_10002ACB8(v17, 1);
      goto LABEL_13;
    }
    id v20 = [v17 url];
    if (v20)
    {
      unint64_t v21 = v20;
      uint64_t v22 = v31;
      sub_10005C290();

      uint64_t v23 = v33;
      (*v29)(v14, v22, v33);
      (*v32)(v14, 0, 1, v23);
      if ((*v28)(v14, 1, v23) != 1)
      {
        sub_10001E8C0((uint64_t)v14, &qword_10007D0E8);
        id v19 = sub_10002CB9C(v17);
LABEL_13:
        uint64_t v24 = v19;

        if (v24)
        {
          sub_10005C8E0();
          if (*(void *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v35 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_10005C920();
          }
          sub_10005C940();
          sub_10005C910();
        }
        goto LABEL_4;
      }
    }
    else
    {
      (*v32)(v14, 1, 1, v33);
    }
    sub_10001E8C0((uint64_t)v14, &qword_10007D0E8);
    uint64_t v25 = *(void **)(v34 + v30);
    if (!v25) {
      goto LABEL_22;
    }
    id v26 = v25;
    [v26 setHidden:0];

LABEL_4:
    ++a3;
    uint64_t v6 = v16;
    if (v15 == a3)
    {
      swift_unknownObjectRelease();
      return;
    }
  }
  __break(1u);
LABEL_22:
  __break(1u);
}

void *sub_10002D318(unint64_t a1)
{
  sub_10005CC40();
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        id v4 = (id)sub_10005CBE0();
LABEL_7:
        uint64_t v5 = v4;
        id v6 = [v4 layer];
        if (qword_10007C5E8 != -1) {
          swift_once();
        }
        if (v3 >= *((void *)off_10007CFB8 + 2)) {
          goto LABEL_14;
        }
        [v6 setCornerRadius:*((double *)off_10007CFB8 + v3 + 4)];

        [v5 setClipsToBounds:1];
        sub_10005CC20();
        sub_10005CC50();
        sub_10005CC60();
        sub_10005CC30();
        if (v2 == ++v3) {
          goto LABEL_16;
        }
      }
      if (v3 < *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_14:
      __break(1u);
LABEL_15:
      swift_bridgeObjectRetain();
      uint64_t v2 = sub_10005CCA0();
      if (!v2) {
        goto LABEL_16;
      }
    }
    id v4 = *(id *)(a1 + 8 * v3 + 32);
    goto LABEL_7;
  }
LABEL_16:
  swift_bridgeObjectRelease();
  return _swiftEmptyArrayStorage;
}

void *sub_10002D4DC(unint64_t a1, void (*a2)(unint64_t, id))
{
  sub_10005CC40();
  if (a1 >> 62) {
    goto LABEL_13;
  }
  uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (v3)
  {
    while (1)
    {
      unint64_t v4 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        id v5 = (id)sub_10005CBE0();
LABEL_7:
        id v6 = v5;
        unint64_t v7 = v4 + 1;
        if (__OFADD__(v4, 1)) {
          goto LABEL_12;
        }
        a2(v4, v5);

        sub_10005CC20();
        sub_10005CC50();
        sub_10005CC60();
        sub_10005CC30();
        ++v4;
        if (v7 == v3) {
          goto LABEL_14;
        }
      }
      if (v4 < *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
        break;
      }
      __break(1u);
LABEL_12:
      __break(1u);
LABEL_13:
      swift_bridgeObjectRetain();
      uint64_t v3 = sub_10005CCA0();
      if (!v3) {
        goto LABEL_14;
      }
    }
    id v5 = *(id *)(a1 + 8 * v4 + 32);
    goto LABEL_7;
  }
LABEL_14:
  swift_bridgeObjectRelease();
  return _swiftEmptyArrayStorage;
}

void sub_10002D638()
{
  uint64_t v1 = sub_1000131E0(&qword_10007D0D8);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = (uint64_t)v0 + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_selectedBoard;
  swift_beginAccess();
  sub_10001E85C(v4, (uint64_t)v3, &qword_10007D0D8);
  uint64_t v5 = type metadata accessor for CRLSEBoard(0);
  LODWORD(v4) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v3, 1, v5);
  sub_10001E8C0((uint64_t)v3, &qword_10007D0D8);
  if (v4 == 1)
  {
    type metadata accessor for CRLSEiOSCreateBoardViewController();
    id v6 = (char *)[objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
    *(void *)&v6[OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController_delegate + 8] = &off_100073158;
    swift_unknownObjectWeakAssign();
    id v7 = [v0 navigationController];
    if (v7)
    {
      uint64_t v8 = v7;
      [v7 pushViewController:v6 animated:1];
    }
  }
  else
  {
    sub_100027824();
  }
}

void sub_10002D7BC()
{
  uint64_t v1 = swift_allocObject();
  *(void *)(v1 + 16) = v0;
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v3 = (void *)Strong;
    v6[4] = sub_10002E638;
    v6[5] = v1;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 1107296256;
    v6[2] = sub_1000271D4;
    v6[3] = &unk_1000733F0;
    uint64_t v4 = _Block_copy(v6);
    id v5 = v0;
    swift_retain();
    swift_release();
    [v3 dismissViewControllerAnimated:1 completion:v4];
    swift_release();
    _Block_release(v4);
  }
  else
  {
    sub_100027728(v0);
    swift_release();
  }
}

unint64_t sub_10002D900()
{
  unint64_t result = qword_10007D0E0;
  if (!qword_10007D0E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D0E0);
  }
  return result;
}

uint64_t sub_10002D954(uint64_t a1, unint64_t a2)
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

unint64_t sub_10002D9AC()
{
  unint64_t result = qword_10007D100;
  if (!qword_10007D100)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D100);
  }
  return result;
}

uint64_t sub_10002DA00()
{
  return _swift_deallocObject(v0, 40, 7);
}

id sub_10002DA38()
{
  return [*(id *)(v0 + 16) drawInRect:0.0, 0.0, *(double *)(v0 + 24), *(double *)(v0 + 32)];
}

uint64_t sub_10002DA54()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002DA64()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10002DA8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10002DA9C()
{
  return swift_release();
}

id sub_10002DAA4(uint64_t a1, void *a2)
{
  return sub_10002A1D8(a1, a2, *(void **)(v2 + 16));
}

uint64_t sub_10002DAAC(void *a1, uint64_t a2)
{
  return sub_10002B548(a1, a2, *(void **)(v2 + 16));
}

uint64_t sub_10002DAB4()
{
  return _swift_deallocObject(v0, 32, 7);
}

id sub_10002DAF4()
{
  return [*(id *)(v0 + 16) setMetadata:*(void *)(v0 + 24)];
}

unint64_t sub_10002DB04()
{
  unint64_t result = qword_10007D138;
  if (!qword_10007D138)
  {
    sub_10005C770();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D138);
  }
  return result;
}

unint64_t sub_10002DB5C()
{
  unint64_t result = qword_10007D148;
  if (!qword_10007D148)
  {
    sub_10001DE60(&qword_10007D140);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D148);
  }
  return result;
}

uint64_t sub_10002DBB8(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_10002DBF4()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002DC2C()
{
  uint64_t v1 = sub_1000131E0(&qword_10007D158);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  uint64_t v7 = (v5 + v3 + v4) & ~v3;
  uint64_t v8 = v7 + v5;
  swift_release();
  uint64_t v9 = v0 + v4;
  uint64_t v10 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v10(v9, v1);
  v10(v0 + v7, v1);

  return _swift_deallocObject(v0, v8, v6);
}

id sub_10002DD24(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v7 = *(void *)(sub_1000131E0(&qword_10007D158) - 8);
  uint64_t v8 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v9 = (v8 + 24) & ~v8;
  uint64_t v10 = *(void *)(v3 + 16);
  uint64_t v11 = v3 + ((*(void *)(v7 + 64) + v8 + v9) & ~v8);

  return sub_100028850(a1, a2, a3, v10, v3 + v9, v11);
}

uint64_t sub_10002DDE0()
{
  uint64_t v1 = sub_1000131E0((uint64_t *)&unk_10007D160);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10002DE74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_1000131E0((uint64_t *)&unk_10007D160);

  return sub_100028D10(a1, a2, a3);
}

uint64_t sub_10002DF10()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_10002DF48()
{
  sub_100027728(*(void **)(v0 + 16));
}

uint64_t sub_10002DF50(uint64_t a1)
{
  return a1;
}

void sub_10002DFA4()
{
}

uint64_t sub_10002DFAC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_10002E008(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10002E064()
{
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

void sub_10002E09C()
{
  sub_100027098(v0[3], v0[4], v0[5], v0[6]);
}

uint64_t sub_10002E0AC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000131E0(&qword_10007D0D8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

const char *sub_10002E114()
{
  return "contentSize";
}

id sub_10002E120@<X0>(id *a1@<X0>, void *a2@<X8>)
{
  id result = [*a1 contentSize];
  *a2 = v4;
  a2[1] = v5;
  return result;
}

id sub_10002E154(double *a1, id *a2)
{
  return [*a2 setContentSize:*a1 a1[1]];
}

void sub_10002E168(void **a1)
{
}

uint64_t sub_10002E170()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_10002E1B8(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_10002E278;
  return sub_100025D0C(a1, v4, v5, v7, v6);
}

uint64_t sub_10002E278()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10002E36C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10002E3D4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10002E43C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10002E49C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002E4D4(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10002E278;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10007D1D8 + dword_10007D1D8);
  return v6(a1, v4);
}

uint64_t sub_10002E58C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000131E0((uint64_t *)&unk_10007D390);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id sub_10002E648(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    NSString v5 = sub_10005C7D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  v12.receiver = v3;
  v12.super_class = (Class)type metadata accessor for CRLSEiOSViewController();
  [super initWithNibName:v5 bundle:a3];

  uint64_t v7 = qword_10007C6D8;
  id v8 = v6;
  if (v7 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v9 = (id)static OS_os_log.crlSharingExtension;
  uint64_t v10 = sub_10005C9B0();
  sub_100050FE0((uint64_t)v9, (uint64_t)&_mh_execute_header, v10, (uint64_t)"Sharing Extension view controller created", 41, 2, (uint64_t)_swiftEmptyArrayStorage);

  return v8;
}

id sub_10002E7C0(void *a1)
{
  v10.receiver = v1;
  v10.super_class = (Class)type metadata accessor for CRLSEiOSViewController();
  [super initWithCoder:a1];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = qword_10007C6D8;
    id v6 = v3;
    if (v5 != -1) {
      swift_once();
    }
    swift_beginAccess();
    id v7 = (id)static OS_os_log.crlSharingExtension;
    uint64_t v8 = sub_10005C9B0();
    sub_100050FE0((uint64_t)v7, (uint64_t)&_mh_execute_header, v8, (uint64_t)"Sharing Extension view controller created", 41, 2, (uint64_t)_swiftEmptyArrayStorage);

    a1 = v7;
  }

  return v4;
}

void sub_10002E8E0()
{
  v16.receiver = v0;
  v16.super_class = (Class)type metadata accessor for CRLSEiOSViewController();
  [super viewDidLoad];
  id v1 = [v0 view];
  if (!v1)
  {
    __break(1u);
    goto LABEL_8;
  }
  uint64_t v2 = v1;
  id v3 = self;
  id v4 = [v3 systemGroupedBackgroundColor];
  [v2 setBackgroundColor:v4];

  type metadata accessor for CRLSEiOSMainViewController();
  id v5 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
  swift_unknownObjectWeakAssign();
  id v6 = [objc_allocWithZone((Class)UINavigationController) initWithRootViewController:v5];
  id v7 = [v6 navigationBar];
  id v8 = [v3 systemBackgroundColor];
  [v7 setBackgroundColor:v8];

  id v9 = [v6 navigationBar];
  [v9 setTranslucent:1];

  [v0 addChildViewController:v6];
  id v10 = [v0 view];
  if (!v10)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v11 = v10;
  id v12 = [v6 view];
  if (!v12)
  {
LABEL_9:
    __break(1u);
    return;
  }
  uint64_t v13 = v12;
  [v11 addSubview:v12];

  [v6 didMoveToParentViewController:v0];
  [v0 setEdgesForExtendedLayout:0];
  if (qword_10007C6D8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v14 = (id)static OS_os_log.crlSharingExtension;
  uint64_t v15 = sub_10005C9B0();
  sub_100050FE0((uint64_t)v14, (uint64_t)&_mh_execute_header, v15, (uint64_t)"Sharing Extension view controller viewDidLoad", 45, 2, (uint64_t)_swiftEmptyArrayStorage);
}

id sub_10002ECCC()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CRLSEiOSViewController();
  [super dealloc];
}

uint64_t type metadata accessor for CRLSEiOSViewController()
{
  return self;
}

void sub_10002ED24()
{
  [v0 setEdgesForExtendedLayout:0];
  id v1 = [v0 view];
  if (!v1)
  {
    __break(1u);
    goto LABEL_22;
  }
  objc_super v2 = v1;
  id v64 = self;
  id v3 = [v64 systemGroupedBackgroundColor];
  [v2 setBackgroundColor:v3];

  id v4 = [v0 navigationItem];
  type metadata accessor for CRLSEExtensionContextManager();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v6 = self;
  id v7 = [v6 bundleForClass:ObjCClassFromMetadata];
  NSString v8 = sub_10005C7D0();
  NSString v9 = sub_10005C7D0();
  NSString v10 = sub_10005C7D0();
  id v11 = [v7 localizedStringForKey:v8 value:v9 table:v10];

  sub_10005C810();
  NSString v12 = sub_10005C7D0();
  swift_bridgeObjectRelease();
  [v4 setTitle:v12];

  id v13 = [v0 navigationItem];
  id v14 = [objc_allocWithZone((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:v0 action:"cancel:"];
  [v13 setLeftBarButtonItem:v14];

  id v15 = [v0 navigationItem];
  id v16 = [objc_allocWithZone((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:v0 action:"createBoardButtonAction:"];
  [v15 setRightBarButtonItem:v16];

  id v17 = [objc_allocWithZone((Class)UITextField) init];
  uint64_t v18 = OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController_newBoardTextField;
  id v19 = *(void **)&v0[OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController_newBoardTextField];
  *(void *)&v0[OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController_newBoardTextField] = v17;

  id v20 = *(void **)&v0[v18];
  if (!v20)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
  unint64_t v21 = *(void **)&v0[v18];
  if (!v21)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  id v22 = v21;
  id v23 = [v6 bundleForClass:ObjCClassFromMetadata];
  NSString v24 = sub_10005C7D0();
  NSString v25 = sub_10005C7D0();
  NSString v26 = sub_10005C7D0();
  id v27 = [v23 localizedStringForKey:v24 value:v25 table:v26];

  sub_10005C810();
  NSString v28 = sub_10005C7D0();
  swift_bridgeObjectRelease();
  [v22 setPlaceholder:v28];

  id v29 = *(void **)&v0[v18];
  if (!v29)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  [v29 setBorderStyle:3];
  uint64_t v30 = *(void **)&v0[v18];
  if (!v30)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  [v30 setClearButtonMode:1];
  uint64_t v31 = *(void **)&v0[v18];
  if (!v31)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  [v31 setAdjustsFontForContentSizeCategory:1];
  uint64_t v32 = *(void **)&v0[v18];
  if (!v32)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v33 = self;
  id v34 = v32;
  id v35 = [v33 preferredFontForTextStyle:UIFontTextStyleBody];
  [v34 setFont:v35];

  id v36 = *(void **)&v0[v18];
  if (!v36)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  id v37 = v36;
  id v38 = [v64 tertiarySystemBackgroundColor];
  [v37 setBackgroundColor:v38];

  uint64_t v39 = *(void **)&v0[v18];
  if (!v39)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  [v39 setDelegate:v0];
  id v40 = [v0 view];
  if (!v40)
  {
LABEL_30:
    __break(1u);
    goto LABEL_31;
  }
  if (!*(void *)&v0[v18])
  {
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  uint64_t v41 = v40;
  [v40 addSubview:];

  sub_1000131E0((uint64_t *)&unk_10007D110);
  uint64_t v42 = swift_allocObject();
  *(_OWORD *)(v42 + 16) = xmmword_1000622E0;
  uint64_t v43 = *(void **)&v0[v18];
  if (!v43)
  {
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  id v44 = [v43 leadingAnchor];
  id v45 = [v0 view];
  if (!v45)
  {
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  id v46 = v45;
  id v47 = [v45 safeAreaLayoutGuide];

  id v48 = [v47 leadingAnchor];
  id v49 = [v44 constraintEqualToAnchor:v48 constant:15.0];

  *(void *)(v42 + 32) = v49;
  id v50 = *(void **)&v0[v18];
  if (!v50)
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  id v51 = [v50 trailingAnchor];
  id v52 = [v0 view];
  if (!v52)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  id v53 = v52;
  id v54 = [v52 safeAreaLayoutGuide];

  id v55 = [v54 trailingAnchor];
  id v56 = [v51 constraintEqualToAnchor:v55 constant:-15.0];

  *(void *)(v42 + 40) = v56;
  uint64_t v57 = *(void **)&v0[v18];
  if (!v57)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  id v58 = [v57 topAnchor];
  id v59 = [v0 view];
  if (!v59)
  {
LABEL_37:
    __break(1u);
    return;
  }
  uint64_t v60 = v59;
  unint64_t v61 = self;
  id v62 = [v60 topAnchor];

  id v63 = [v58 constraintEqualToAnchor:v62 constant:32.0];
  *(void *)(v42 + 48) = v63;
  sub_10005C910();
  sub_100030798();
  Class isa = sub_10005C8F0().super.isa;
  swift_bridgeObjectRelease();
  [v61 activateConstraints:isa];
}

void sub_10002F550(char a1)
{
  v12.receiver = v1;
  v12.super_class = (Class)type metadata accessor for CRLSEiOSCreateBoardViewController();
  [super viewWillAppear:a1 & 1];
  uint64_t v3 = OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController_newBoardTextField;
  id v4 = *(void **)&v1[OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController_newBoardTextField];
  if (!v4)
  {
    __break(1u);
    goto LABEL_10;
  }
  [v4 becomeFirstResponder];
  id v5 = [v1 navigationItem];
  id v6 = [v5 rightBarButtonItem];

  if (!v6) {
    return;
  }
  id v7 = *(void **)&v1[v3];
  if (!v7)
  {
LABEL_10:
    __break(1u);
    return;
  }
  id v8 = [v7 text];
  if (v8)
  {
    NSString v9 = v8;
    sub_10005C810();

    uint64_t v10 = sub_10005C860();
    swift_bridgeObjectRelease();
    BOOL v11 = v10 > 0;
  }
  else
  {
    BOOL v11 = 0;
  }
  [v6 setEnabled:v11];
}

void sub_10002F6C0(char a1)
{
  v10.receiver = v1;
  v10.super_class = (Class)type metadata accessor for CRLSEiOSCreateBoardViewController();
  [super viewDidAppear:a1 & 1];
  uint64_t v3 = OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController_newBoardTextField;
  id v4 = *(void **)&v1[OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController_newBoardTextField];
  if (v4)
  {
    id v5 = v4;
    id v6 = [v5 beginningOfDocument];
    id v7 = *(void **)&v1[v3];
    if (v7)
    {
      id v8 = [v7 endOfDocument];
      id v9 = [v5 textRangeFromPosition:v6 toPosition:v8];

      [v5 setSelectedTextRange:v9];
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_10002FA18(void *a1)
{
  id v2 = [a1 text];
  if (v2)
  {
    uint64_t v3 = sub_10005C810();
    unint64_t v5 = v4;

    id v2 = (id)(v3 & 0xFFFFFFFFFFFFLL);
  }
  else
  {
    unint64_t v5 = 0xE000000000000000;
  }
  id v6 = [v1 navigationItem];
  id v8 = [v6 rightBarButtonItem];

  swift_bridgeObjectRelease();
  if (v8)
  {
    uint64_t v7 = HIBYTE(v5) & 0xF;
    if ((v5 & 0x2000000000000000) == 0) {
      uint64_t v7 = (uint64_t)v2;
    }
    [v8 setEnabled:v7 != 0];
  }
}

id sub_10002FB7C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_1000131E0(&qword_10007D0D8);
  __chkstk_darwin(v6 - 8);
  id v8 = (char *)v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for CRLSEBoard(0);
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  objc_super v12 = (char *)v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v24 = v10;
    id v13 = v2;
    id v14 = sub_100022AEC();
    v23[1] = a1;
    v23[2] = a2;
    a1 = sub_100044678(a1, a2);
    a2 = v15;
    swift_unknownObjectRelease();

    uint64_t v3 = v13;
    uint64_t v10 = v24;
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  id result = [v3 view];
  if (result)
  {
    id v17 = result;
    [result endEditing:1];

    uint64_t v18 = type metadata accessor for CRLSEBoardIdentifier(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v12, 1, 1, v18);
    id v19 = &v12[*(int *)(v9 + 24)];
    uint64_t v20 = sub_10005C3D0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v19, 1, 1, v20);
    unint64_t v21 = (uint64_t *)&v12[*(int *)(v9 + 20)];
    *unint64_t v21 = a1;
    v21[1] = a2;
    if (swift_unknownObjectWeakLoadStrong())
    {
      sub_100030678((uint64_t)v12, (uint64_t)v8);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v8, 0, 1, v9);
      sub_100022968((uint64_t)v8);
      sub_100027824();
      swift_unknownObjectRelease();
    }
    id v22 = [v3 navigationController];

    return (id)sub_1000306DC((uint64_t)v12);
  }
  else
  {
    __break(1u);
    __break(1u);
  }
  return result;
}

void sub_1000300F8()
{
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  NSString v1 = sub_10005C7D0();
  swift_bridgeObjectRelease();
  NSString v2 = sub_10005C7D0();
  swift_bridgeObjectRelease();
  id v3 = [self alertControllerWithTitle:v1 message:v2 preferredStyle:1];

  type metadata accessor for CRLSEExtensionContextManager();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v5 = [self bundleForClass:ObjCClassFromMetadata];
  NSString v6 = sub_10005C7D0();
  NSString v7 = sub_10005C7D0();
  NSString v8 = sub_10005C7D0();
  id v9 = [v5 localizedStringForKey:v6 value:v7 table:v8];

  sub_10005C810();
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v0;
  id v11 = v0;
  NSString v12 = sub_10005C7D0();
  swift_bridgeObjectRelease();
  v15[4] = sub_100030634;
  v15[5] = v10;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 1107296256;
  v15[2] = sub_10003039C;
  v15[3] = &unk_100073530;
  id v13 = _Block_copy(v15);
  swift_release();
  id v14 = [self actionWithTitle:v12 style:0 handler:v13];
  _Block_release(v13);

  [v3 addAction:v14];
  [v11 presentViewController:v3 animated:1 completion:0];
}

void sub_10003039C(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

id sub_100030558()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CRLSEiOSCreateBoardViewController();
  [super dealloc];
}

uint64_t type metadata accessor for CRLSEiOSCreateBoardViewController()
{
  return self;
}

uint64_t sub_1000305FC()
{
  return _swift_deallocObject(v0, 24, 7);
}

id sub_100030634()
{
  id result = *(id *)(*(void *)(v0 + 16)
                 + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController_newBoardTextField);
  if (result) {
    return [result becomeFirstResponder];
  }
  __break(1u);
  return result;
}

uint64_t sub_100030658(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100030668()
{
  return swift_release();
}

uint64_t sub_100030670()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_100030678(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for CRLSEBoard(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000306DC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CRLSEBoard(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100030738(uint64_t a1)
{
  uint64_t v2 = sub_1000131E0((uint64_t *)&unk_10007D390);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100030798()
{
  unint64_t result = qword_10007D3A0;
  if (!qword_10007D3A0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10007D3A0);
  }
  return result;
}

uint64_t sub_1000307D8(uint64_t a1)
{
  return a1;
}

void sub_100030800(uint64_t a1)
{
}

void sub_100030814()
{
  id v0 = [objc_allocWithZone((Class)UIColor) initWithRed:0.949019608 green:0.949019608 blue:0.968627451 alpha:1.0];
  id v1 = [v0 CGColor];

  qword_10007D3B8 = (uint64_t)v1;
}

void sub_100030888(uint64_t a1)
{
}

void sub_10003089C(uint64_t a1, SEL *a2, void *a3)
{
  id v4 = [self *a2];
  id v5 = [v4 CGColor];

  *a3 = v5;
}

UIFontTextStyle sub_100030908()
{
  qword_10007D3C8 = (uint64_t)UIFontTextStyleHeadline;
  return UIFontTextStyleHeadline;
}

UIFontTextStyle sub_100030920()
{
  qword_10007D3D0 = (uint64_t)UIFontTextStyleSubheadline;
  return UIFontTextStyleSubheadline;
}

double sub_100030938()
{
  double result = 0.0;
  xmmword_10007D3D8 = xmmword_1000624C0;
  return result;
}

void sub_100030950(uint64_t a1)
{
}

void sub_100030964(uint64_t a1)
{
}

void sub_100030978(uint64_t a1, SEL *a2, void *a3)
{
  id v4 = [self *a2];
  id v5 = [self traitCollectionWithUserInterfaceStyle:1];
  id v6 = [v4 resolvedColorWithTraitCollection:v5];

  *a3 = v6;
}

char *sub_100030A18(uint64_t a1, char *a2, double a3, double a4)
{
  uint64_t v9 = sub_1000131E0((uint64_t *)&unk_10007D8F0);
  __chkstk_darwin(v9 - 8);
  id v129 = (char *)&v127 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000131E0(&qword_10007D458);
  __chkstk_darwin(v11 - 8);
  v137 = (char *)&v127 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v132 = sub_10005C150();
  uint64_t v130 = *(void *)(v132 - 8);
  __chkstk_darwin(v132);
  id v128 = (char *)&v127 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10005C300();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = __chkstk_darwin(v14);
  id v133 = (char *)&v127 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  id v19 = (char *)&v127 - v18;
  *(void *)&v4[OBJC_IVAR____TtC24FreeformSharingExtension21CRLSEAudioPreviewView_gradientBackground] = 0;
  *(void *)&v4[OBJC_IVAR____TtC24FreeformSharingExtension21CRLSEAudioPreviewView_metadata] = a1;
  uint64_t v20 = *(void (**)(char *, uint64_t, uint64_t))(v15 + 16);
  id v131 = a2;
  v20(&v4[OBJC_IVAR____TtC24FreeformSharingExtension21CRLSEAudioPreviewView_url], (uint64_t)a2, v14);
  unint64_t v21 = (double *)&v4[OBJC_IVAR____TtC24FreeformSharingExtension21CRLSEAudioPreviewView_size];
  *unint64_t v21 = a3;
  v21[1] = a4;
  id v22 = (objc_class *)type metadata accessor for CRLSEAudioPreviewView();
  v140.receiver = v4;
  v140.super_class = v22;
  swift_bridgeObjectRetain();
  id v23 = [super initWithFrame:0.0, 0.0, 0.0, 0.0];
  uint64_t v24 = &v23[OBJC_IVAR____TtC24FreeformSharingExtension21CRLSEAudioPreviewView_url];
  v20(v19, (uint64_t)&v23[OBJC_IVAR____TtC24FreeformSharingExtension21CRLSEAudioPreviewView_url], v14);
  id v138 = v23;
  sub_10005C260();
  NSString v25 = *(void (**)(char *, uint64_t))(v15 + 8);
  uint64_t v135 = v15 + 8;
  uint64_t v136 = v14;
  id v134 = v25;
  v25(v19, v14);
  NSString v26 = sub_10005C7D0();
  swift_bridgeObjectRelease();
  id v27 = [v26 stringByDeletingPathExtension];

  uint64_t v28 = sub_10005C810();
  uint64_t v30 = v29;

  uint64_t v31 = self;
  sub_10002DBB8(0, (unint64_t *)&unk_10007D0F0);
  Class isa = sub_10005C8F0().super.isa;
  swift_bridgeObjectRelease();
  id v33 = [v31 crl_titleWithMetadataArray:isa];

  if (v33)
  {
    swift_bridgeObjectRelease();
    uint64_t v28 = sub_10005C810();
    uint64_t v30 = v34;
  }
  swift_bridgeObjectRetain();
  Class v35 = sub_10005C8F0().super.isa;
  swift_bridgeObjectRelease();
  id v36 = [v31 crl_creatorArtistOrAuthorWithMetadataArray:v35];

  if (v36)
  {
    uint64_t v130 = sub_10005C810();
    uint64_t v132 = v37;

LABEL_7:
    id v45 = &OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_sharedTextConstraints;
    goto LABEL_8;
  }
  sub_1000131E0(&qword_10007D460);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000622C0;
  *(void *)(inited + 32) = NSURLContentTypeKey;
  uint64_t v39 = NSURLContentTypeKey;
  sub_1000320C0(inited);
  swift_setDeallocating();
  type metadata accessor for URLResourceKey(0);
  swift_arrayDestroy();
  id v40 = v133;
  uint64_t v41 = v136;
  v20(v133, (uint64_t)v24, v136);
  id v42 = v137;
  sub_10005C250();
  swift_bridgeObjectRelease();
  v134(v40, v41);
  uint64_t v43 = v130;
  uint64_t v44 = v132;
  (*(void (**)(id, void, uint64_t, uint64_t))(v130 + 56))(v42, 0, 1, v132);
  if ((*(unsigned int (**)(id, uint64_t, uint64_t))(v43 + 48))(v42, 1, v44) == 1)
  {
    sub_10001E8C0((uint64_t)v42, &qword_10007D458);
    uint64_t v130 = 0;
    uint64_t v132 = 0xE000000000000000;
    goto LABEL_7;
  }
  id v115 = v128;
  (*(void (**)(char *, id, uint64_t))(v43 + 32))(v128, v42, v44);
  uint64_t v116 = (uint64_t)v129;
  sub_10005C140();
  uint64_t v117 = sub_10005C510();
  uint64_t v118 = *(void *)(v117 - 8);
  id v45 = &OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_sharedTextConstraints;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v118 + 48))(v116, 1, v117) == 1)
  {
    (*(void (**)(char *, uint64_t))(v43 + 8))(v115, v44);
    sub_10001E8C0(v116, (uint64_t *)&unk_10007D8F0);
    uint64_t v130 = 0;
    unint64_t v119 = 0xE000000000000000;
  }
  else
  {
    uint64_t v120 = sub_10005C490();
    id v121 = v115;
    uint64_t v122 = v120;
    unint64_t v124 = v123;
    (*(void (**)(char *, uint64_t))(v43 + 8))(v121, v44);
    (*(void (**)(uint64_t, uint64_t))(v118 + 8))(v116, v117);
    if (v124) {
      uint64_t v125 = v122;
    }
    else {
      uint64_t v125 = 0;
    }
    uint64_t v130 = v125;
    unint64_t v119 = 0xE000000000000000;
    if (v124) {
      unint64_t v119 = v124;
    }
  }
  uint64_t v132 = v119;
LABEL_8:
  id v46 = v138;
  [v138 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v47 = [objc_allocWithZone((Class)UIView) init];
  [v47 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v48 = [v46 layer];
  if (v48)
  {
    id v49 = v48;
    [v48 setMasksToBounds:0];
    if (qword_10007C600 != -1) {
      swift_once();
    }
    [v49 setShadowColor:qword_10007D3C0];
    if (qword_10007C618 != -1) {
      swift_once();
    }
    [v49 setShadowOffset:xmmword_10007D3D8];
    LODWORD(v50) = 0.25;
    [v49 setShadowOpacity:v50];
    [v49 setShadowRadius:3.0];
  }
  id v51 = [v47 layer];
  id v52 = v138;
  id v53 = sub_100031C48(v51);

  uint64_t v54 = v45[130];
  id v55 = *(void **)&v52[v54];
  *(void *)&v52[v54] = v53;

  [v52 addSubview:v47];
  sub_1000322F0();
  v137 = v56;
  [v47 addSubview:];
  if (qword_10007C620 != -1) {
    swift_once();
  }
  uint64_t v57 = qword_10007D3E8;
  if (qword_10007C608 != -1) {
    swift_once();
  }
  id v58 = (char *)sub_1000323FC(v28, v30, v57, qword_10007D3C8);
  swift_bridgeObjectRelease();
  [v47 addSubview:v58];
  sub_1000131E0((uint64_t *)&unk_10007D110);
  uint64_t v59 = swift_allocObject();
  *(_OWORD *)(v59 + 16) = xmmword_1000624D0;
  id v60 = [v47 topAnchor];
  unint64_t v61 = v138;
  id v62 = [v138 topAnchor];
  id v63 = [v60 constraintEqualToAnchor:v62];

  *(void *)(v59 + 32) = v63;
  id v64 = [v47 leadingAnchor];
  id v65 = [v61 leadingAnchor];
  id v66 = [v64 constraintEqualToAnchor:v65];

  *(void *)(v59 + 40) = v66;
  id v67 = [v47 trailingAnchor];
  id v68 = [v61 trailingAnchor];
  id v69 = [v67 constraintEqualToAnchor:v68];

  *(void *)(v59 + 48) = v69;
  id v70 = [v47 bottomAnchor];
  id v71 = [v61 bottomAnchor];
  id v72 = [v70 constraintEqualToAnchor:v71];

  *(void *)(v59 + 56) = v72;
  id v73 = [v58 topAnchor];
  id v74 = [v47 topAnchor];
  id v75 = [v73 constraintEqualToAnchor:v74 constant:16.0];

  *(void *)(v59 + 64) = v75;
  id v76 = [v58 leadingAnchor];
  id v77 = [v47 leadingAnchor];
  id v78 = [v76 constraintEqualToAnchor:v77 constant:16.0];

  *(void *)(v59 + 72) = v78;
  id v133 = v58;
  id v79 = [v58 trailingAnchor];
  id v80 = [v47 trailingAnchor];
  id v81 = [v79 constraintEqualToAnchor:v80 constant:-16.0];

  *(void *)(v59 + 80) = v81;
  id v82 = [v47 widthAnchor];
  id v83 = [v82 constraintEqualToConstant:a3];

  *(void *)(v59 + 88) = v83;
  id v84 = [v47 heightAnchor];
  id v85 = [v84 constraintEqualToConstant:a4];

  *(void *)(v59 + 96) = v85;
  id v86 = v137;
  id v87 = [v137 centerXAnchor];
  id v88 = [v47 centerXAnchor];
  id v89 = [v87 constraintEqualToAnchor:v88];

  *(void *)(v59 + 104) = v89;
  id v90 = [v86 centerYAnchor];
  id v91 = [v47 centerYAnchor];
  id v92 = [v90 constraintEqualToAnchor:v91 constant:16.0];

  *(void *)(v59 + 112) = v92;
  unint64_t v139 = v59;
  sub_10005C910();
  id v93 = [v61 traitCollection];
  id v94 = [v93 preferredContentSizeCategory];

  LOBYTE(v93) = sub_10005CA60();
  if ((v93 & 1) == 0)
  {
    swift_bridgeObjectRelease();
    uint64_t v96 = v133;
    goto LABEL_32;
  }
  if (qword_10007C628 != -1) {
    swift_once();
  }
  uint64_t v95 = qword_10007D3F0;
  uint64_t v96 = v133;
  if (qword_10007C610 != -1) {
    swift_once();
  }
  id v97 = sub_1000323FC(v130, v132, v95, qword_10007D3D0);
  swift_bridgeObjectRelease();
  [v47 addSubview:v97];
  id v98 = [v97 topAnchor];
  id v99 = [v96 bottomAnchor];
  id v100 = [v98 constraintEqualToAnchor:v99];

  id v101 = [v97 leadingAnchor];
  id v102 = [v47 leadingAnchor];
  id v103 = [v101 constraintEqualToAnchor:v102 constant:16.0];

  id v104 = [v97 trailingAnchor];
  id v105 = [v47 trailingAnchor];
  id v106 = [v104 constraintEqualToAnchor:v105 constant:-16.0];

  if (!(v139 >> 62))
  {
    uint64_t v107 = *(void *)((v139 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v108 = v107 + 3;
    if (!__OFADD__(v107, 3)) {
      goto LABEL_25;
    }
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
  swift_bridgeObjectRetain();
  uint64_t v126 = sub_10005CCA0();
  swift_bridgeObjectRelease();
  uint64_t v108 = v126 + 3;
  if (__OFADD__(v126, 3)) {
    goto LABEL_43;
  }
LABEL_25:
  sub_100032000(v108);
  sub_10005C910();
  id v100 = v100;
  sub_10005C8E0();
  if (*(void *)((v139 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v139 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
LABEL_44:
  }
    sub_10005C920();
  sub_10005C940();
  sub_10005C910();
  id v109 = v103;
  sub_10005C8E0();
  if (*(void *)((v139 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v139 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_10005C920();
  }
  sub_10005C940();
  sub_10005C910();
  id v110 = v106;
  sub_10005C8E0();
  if (*(void *)((v139 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v139 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
    sub_10005C920();
  }
  sub_10005C940();
  sub_10005C910();

LABEL_32:
  id v111 = self;
  sub_10002DBB8(0, (unint64_t *)&qword_10007D3A0);
  Class v112 = sub_10005C8F0().super.isa;
  swift_bridgeObjectRelease();
  [v111 activateConstraints:v112];

  id v113 = v138;
  v134(v131, v136);
  return v113;
}

id sub_100031C48(id a1)
{
  uint64_t v2 = v1;
  if (a1)
  {
    [a1 setMasksToBounds:1];
    [a1 setCornerRadius:16.0];
  }
  id v4 = [objc_allocWithZone((Class)CAGradientLayer) init];
  [v2 bounds];
  [v4 setFrame:];

  sub_1000131E0(&qword_10007D450);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100062290;
  if (qword_10007C5F0 != -1) {
    swift_once();
  }
  id v6 = (void *)qword_10007D3B0;
  type metadata accessor for CGColor(0);
  uint64_t v8 = v7;
  *(void *)(v5 + 56) = v7;
  *(void *)(v5 + 32) = v6;
  uint64_t v9 = qword_10007C5F8;
  id v10 = v6;
  if (v9 != -1) {
    swift_once();
  }
  uint64_t v11 = (void *)qword_10007D3B8;
  *(void *)(v5 + 88) = v8;
  *(void *)(v5 + 64) = v11;
  id v12 = v11;
  Class isa = sub_10005C8F0().super.isa;
  swift_bridgeObjectRelease();
  [v4 setColors:isa];

  if (a1) {
    [a1 insertSublayer:v4 atIndex:0];
  }
  return v4;
}

id sub_100031E30()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CRLSEAudioPreviewView();
  return [super dealloc];
}

uint64_t sub_100031EF8()
{
  return type metadata accessor for CRLSEAudioPreviewView();
}

uint64_t type metadata accessor for CRLSEAudioPreviewView()
{
  uint64_t result = qword_10007D440;
  if (!qword_10007D440) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100031F4C()
{
  uint64_t result = sub_10005C300();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_100032000(uint64_t a1)
{
  unint64_t v3 = *v1;
  uint64_t result = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *unint64_t v1 = v3;
  if ((result & 1) == 0
    || (v3 & 0x8000000000000000) != 0
    || (v3 & 0x4000000000000000) != 0
    || a1 > *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
  {
    if (v3 >> 62)
    {
      swift_bridgeObjectRetain();
      sub_10005CCA0();
      swift_bridgeObjectRelease();
    }
    uint64_t result = sub_10005CBF0();
    *unint64_t v1 = result;
  }
  return result;
}

void *sub_1000320C0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_1000131E0(&qword_10007D468);
    uint64_t v3 = sub_10005CB90();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v31 = v1;
    uint64_t v32 = a1 + 32;
    while (1)
    {
      id v6 = *(void **)(v32 + 8 * v4);
      sub_10005C810();
      sub_10005CE50();
      id v7 = v6;
      sub_10005C850();
      Swift::Int v8 = sub_10005CE70();
      uint64_t result = (void *)swift_bridgeObjectRelease();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = v8 & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = sub_10005C810();
        uint64_t v17 = v16;
        if (v15 == sub_10005C810() && v17 == v18)
        {
LABEL_3:
          swift_bridgeObjectRelease_n();
LABEL_4:

          goto LABEL_5;
        }
        char v20 = sub_10005CDF0();
        swift_bridgeObjectRelease();
        uint64_t result = (void *)swift_bridgeObjectRelease();
        if (v20) {
          goto LABEL_4;
        }
        uint64_t v21 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v21;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          uint64_t v22 = sub_10005C810();
          uint64_t v24 = v23;
          if (v22 == sub_10005C810() && v24 == v25) {
            goto LABEL_3;
          }
          char v27 = sub_10005CDF0();
          swift_bridgeObjectRelease();
          uint64_t result = (void *)swift_bridgeObjectRelease();
          if (v27) {
            goto LABEL_4;
          }
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      *(void *)(*(void *)(v3 + 48) + 8 * v11) = v7;
      uint64_t v28 = *(void *)(v3 + 16);
      BOOL v29 = __OFADD__(v28, 1);
      uint64_t v30 = v28 + 1;
      if (v29)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v30;
LABEL_5:
      if (++v4 == v31) {
        return (void *)v3;
      }
    }
  }
  return &_swiftEmptySetSingleton;
}

void sub_1000322F0()
{
  id v0 = [self configurationWithPointSize:4 weight:80.0];
  uint64_t v1 = self;
  id v2 = v0;
  NSString v3 = sub_10005C7D0();
  id v4 = [v1 systemImageNamed:v3 withConfiguration:v2];

  if (v4)
  {
    id v5 = [objc_allocWithZone((Class)UIImageView) initWithImage:v4];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  else
  {
    __break(1u);
  }
}

id sub_1000323FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v6 = [objc_allocWithZone((Class)UILabel) init];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v7 = [self preferredFontForTextStyle:a4];
  [v6 setFont:v7];

  [v6 setTextColor:a3];
  [v6 setTextAlignment:1];
  NSString v8 = sub_10005C7D0();
  [v6 setText:v8];

  return v6;
}

uint64_t sub_1000324F8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10005C510();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  id v6 = &v39[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v4);
  NSString v8 = &v39[-v7];
  uint64_t v9 = sub_1000131E0((uint64_t *)&unk_10007D8F0);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  unint64_t v12 = &v39[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v15 = &v39[-v14];
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v18 = &v39[-v17];
  __chkstk_darwin(v16);
  char v20 = &v39[-v19];
  id v21 = [v1 mediaUTI];
  if (v21)
  {
    uint64_t v22 = v21;
    sub_10005C4B0();

    uint64_t v23 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
    v23(v18, 0, 1, v2);
  }
  else
  {
    uint64_t v23 = *(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
    v23(v18, 1, 1, v2);
  }
  sub_100032924((uint64_t)v18, (uint64_t)v20);
  id v42 = *(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v3 + 48);
  if (v42(v20, 1, v2))
  {
    sub_10001E8C0((uint64_t)v20, (uint64_t *)&unk_10007D8F0);
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v3 + 16))(v8, v20, v2);
    sub_10001E8C0((uint64_t)v20, (uint64_t *)&unk_10007D8F0);
    sub_10005C4F0();
    int v40 = sub_10005C500();
    uint64_t v41 = v12;
    uint64_t v24 = v1;
    uint64_t v25 = v6;
    uint64_t v26 = v3;
    uint64_t v27 = v3;
    uint64_t v28 = v23;
    BOOL v29 = *(void (**)(unsigned char *, uint64_t))(v26 + 8);
    v29(v25, v2);
    v29(v8, v2);
    uint64_t v23 = v28;
    uint64_t v3 = v27;
    id v6 = v25;
    uint64_t v1 = v24;
    unint64_t v12 = v41;
    if (v40)
    {
      BOOL v30 = 1;
      goto LABEL_9;
    }
  }
  id v31 = [v1 image];

  BOOL v30 = v31 != 0;
LABEL_9:
  id v32 = [v1 mediaUTI];
  if (v32)
  {
    id v33 = v32;
    sub_10005C4B0();

    uint64_t v34 = 0;
  }
  else
  {
    uint64_t v34 = 1;
  }
  Class v35 = v42;
  v23(v12, v34, 1, v2);
  sub_100032924((uint64_t)v12, (uint64_t)v15);
  if (v35(v15, 1, v2))
  {
    sub_10001E8C0((uint64_t)v15, (uint64_t *)&unk_10007D8F0);
    if (v30) {
      return 0;
    }
  }
  else
  {
    (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v3 + 16))(v8, v15, v2);
    sub_10001E8C0((uint64_t)v15, (uint64_t *)&unk_10007D8F0);
    sub_10005C480();
    int v37 = sub_10005C500();
    id v38 = *(void (**)(unsigned char *, uint64_t))(v3 + 8);
    v38(v6, v2);
    v38(v8, v2);
    if ((v30 | v37)) {
      return !v30;
    }
  }
  return 2;
}

uint64_t sub_100032924(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000131E0((uint64_t *)&unk_10007D8F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10003298C(void *a1)
{
  uint64_t v3 = v1;
  uint64_t v5 = sub_1000131E0(&qword_10007D5F8);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  NSString v8 = &v11[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10001BB00(a1, a1[3]);
  sub_100036E98();
  sub_10005CEF0();
  char v15 = 0;
  sub_10005C3D0();
  sub_100036EEC(&qword_10007CC08, (void (*)(uint64_t))&type metadata accessor for UUID);
  sub_10005CD70();
  if (!v2)
  {
    uint64_t v9 = type metadata accessor for CRLSEImportManifest(0);
    char v14 = 1;
    sub_10005CD60();
    char v13 = 2;
    sub_10005CD80();
    uint64_t v12 = *(void *)(v3 + *(int *)(v9 + 28));
    v11[15] = 3;
    sub_1000131E0(&qword_10007D5E0);
    sub_100036F34(&qword_10007D600, &qword_10007D608);
    sub_10005CDA0();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t sub_100032C00@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v27 = a2;
  uint64_t v4 = sub_1000131E0((uint64_t *)&unk_10007D8C0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_1000131E0(&qword_10007D5D0);
  uint64_t v26 = *(void *)(v29 - 8);
  __chkstk_darwin(v29);
  NSString v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for CRLSEImportManifest(0);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10005C3D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  char v13 = (uint64_t *)&v11[*(int *)(v9 + 20)];
  *char v13 = 0;
  v13[1] = 0;
  uint64_t v28 = v9;
  uint64_t v30 = *(int *)(v9 + 28);
  id v31 = a1;
  *(void *)&v11[v30] = _swiftEmptyArrayStorage;
  sub_10001BB00(a1, a1[3]);
  sub_100036E98();
  sub_10005CEE0();
  if (v2)
  {
    sub_10001BB98((uint64_t)v31);
    sub_10001E8C0((uint64_t)v11, (uint64_t *)&unk_10007D8C0);
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v14 = v26;
    uint64_t v15 = v27;
    char v36 = 0;
    sub_100036EEC(&qword_10007CBA0, (void (*)(uint64_t))&type metadata accessor for UUID);
    sub_10005CD00();
    sub_10003701C((uint64_t)v6, (uint64_t)v11, (uint64_t *)&unk_10007D8C0);
    char v35 = 1;
    uint64_t v16 = sub_10005CCF0();
    uint64_t v18 = v17;
    swift_bridgeObjectRelease();
    *char v13 = v16;
    v13[1] = v18;
    char v34 = 2;
    uint64_t v19 = sub_10005CD10();
    char v20 = (uint64_t *)&v11[*(int *)(v28 + 24)];
    uint64_t *v20 = v19;
    v20[1] = v21;
    sub_1000131E0(&qword_10007D5E0);
    char v33 = 3;
    sub_100036F34(&qword_10007D5E8, &qword_10007D5F0);
    sub_10005CD30();
    (*(void (**)(char *, uint64_t))(v14 + 8))(v8, v29);
    uint64_t v22 = v32;
    uint64_t v23 = v30;
    swift_bridgeObjectRelease();
    *(void *)&v11[v23] = v22;
    sub_100037080((uint64_t)v11, v15, type metadata accessor for CRLSEImportManifest);
    sub_10001BB98((uint64_t)v31);
    return sub_1000370E8((uint64_t)v11, type metadata accessor for CRLSEImportManifest);
  }
}

uint64_t sub_10003305C()
{
  uint64_t result = 0x4955556472616F62;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x6D614E72656E776FLL;
      break;
    case 2:
      uint64_t result = 0x656C746974;
      break;
    case 3:
      uint64_t result = 0x736D657469;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1000330E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_100037560(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100033110(uint64_t a1)
{
  unint64_t v2 = sub_100036E98();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10003314C(uint64_t a1)
{
  unint64_t v2 = sub_100036E98();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100033188@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_100032C00(a1, a2);
}

uint64_t sub_1000331A0(void *a1)
{
  return sub_10003298C(a1);
}

uint64_t sub_1000331B8(void *a1)
{
  uint64_t v3 = sub_1000131E0(&qword_10007D638);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v8[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  sub_10001BB00(a1, a1[3]);
  sub_100036FC8();
  sub_10005CEF0();
  v8[15] = 0;
  sub_10005C3D0();
  sub_100036EEC(&qword_10007CC08, (void (*)(uint64_t))&type metadata accessor for UUID);
  sub_10005CDA0();
  if (!v1)
  {
    type metadata accessor for CRLSEManifestItem(0);
    v8[14] = 1;
    sub_10005CD60();
    v8[13] = 2;
    sub_10005C110();
    sub_100036EEC(&qword_10007D640, (void (*)(uint64_t))&type metadata accessor for AttributedString);
    sub_10005CD70();
    v8[12] = 3;
    sub_10005C300();
    sub_100036EEC(&qword_10007D648, (void (*)(uint64_t))&type metadata accessor for URL);
    sub_10005CD70();
    v8[11] = 4;
    sub_10005C510();
    sub_100036EEC(&qword_10007D650, (void (*)(uint64_t))&type metadata accessor for UTType);
    sub_10005CD70();
  }
  return (*(uint64_t (**)(unsigned char *, uint64_t))(v4 + 8))(v6, v3);
}

uint64_t sub_1000334DC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v41 = a2;
  uint64_t v3 = sub_1000131E0((uint64_t *)&unk_10007D8F0);
  __chkstk_darwin(v3 - 8);
  id v42 = (char *)v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000131E0(&qword_10007D0E8);
  __chkstk_darwin(v5 - 8);
  uint64_t v43 = (char *)v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000131E0(&qword_10007D510);
  __chkstk_darwin(v7 - 8);
  id v46 = (char *)v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = sub_10005C3D0();
  uint64_t v45 = *(void *)(v48 - 8);
  __chkstk_darwin(v48);
  id v47 = (char *)v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v50 = sub_1000131E0(&qword_10007D610);
  uint64_t v44 = *(void *)(v50 - 8);
  __chkstk_darwin(v50);
  uint64_t v11 = (char *)v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for CRLSEManifestItem(0);
  char v13 = (int *)(v12 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)v40 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = &v15[v13[7]];
  *(void *)uint64_t v16 = 0;
  *((void *)v16 + 1) = 0;
  id v55 = (uint64_t *)v16;
  uint64_t v17 = (uint64_t)&v15[v13[8]];
  uint64_t v18 = sub_10005C110();
  uint64_t v19 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  uint64_t v53 = v17;
  v19(v17, 1, 1, v18);
  uint64_t v20 = (uint64_t)&v15[v13[9]];
  uint64_t v21 = sub_10005C300();
  uint64_t v22 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56);
  uint64_t v52 = v20;
  v22(v20, 1, 1, v21);
  uint64_t v23 = (uint64_t)&v15[v13[10]];
  uint64_t v24 = sub_10005C510();
  uint64_t v25 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 56);
  uint64_t v51 = v23;
  v25(v23, 1, 1, v24);
  sub_10001BB00(a1, a1[3]);
  sub_100036FC8();
  id v49 = v11;
  uint64_t v26 = (uint64_t)v54;
  sub_10005CEE0();
  if (v26)
  {
    sub_10001BB98((uint64_t)a1);
    uint64_t v32 = v52;
    uint64_t v31 = v53;
    uint64_t v33 = v51;
    swift_bridgeObjectRelease();
    sub_10001E8C0(v31, &qword_10007D510);
    sub_10001E8C0(v32, &qword_10007D0E8);
    return sub_10001E8C0(v33, (uint64_t *)&unk_10007D8F0);
  }
  else
  {
    v40[1] = v24;
    v40[2] = v21;
    uint64_t v27 = v45;
    uint64_t v28 = (uint64_t)v46;
    uint64_t v54 = a1;
    char v60 = 0;
    sub_100036EEC(&qword_10007CBA0, (void (*)(uint64_t))&type metadata accessor for UUID);
    uint64_t v30 = v47;
    uint64_t v29 = v48;
    sub_10005CD30();
    (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v15, v30, v29);
    char v59 = 1;
    uint64_t v34 = sub_10005CCF0();
    char v35 = v55;
    *id v55 = v34;
    v35[1] = v36;
    char v58 = 2;
    sub_100036EEC(&qword_10007D620, (void (*)(uint64_t))&type metadata accessor for AttributedString);
    sub_10005CD00();
    sub_10003701C(v28, v53, &qword_10007D510);
    char v57 = 3;
    sub_100036EEC(&qword_10007D628, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t v37 = (uint64_t)v43;
    sub_10005CD00();
    sub_10003701C(v37, v52, &qword_10007D0E8);
    char v56 = 4;
    sub_100036EEC(&qword_10007D630, (void (*)(uint64_t))&type metadata accessor for UTType);
    uint64_t v38 = (uint64_t)v42;
    sub_10005CD00();
    (*(void (**)(char *, uint64_t))(v44 + 8))(v49, v50);
    sub_10003701C(v38, v51, (uint64_t *)&unk_10007D8F0);
    sub_100037080((uint64_t)v15, v41, type metadata accessor for CRLSEManifestItem);
    sub_10001BB98((uint64_t)v54);
    return sub_1000370E8((uint64_t)v15, type metadata accessor for CRLSEManifestItem);
  }
}

uint64_t sub_100033C0C()
{
  uint64_t result = 0x444955556D657469;
  switch(*v0)
  {
    case 1:
      uint64_t result = 0x656C746974;
      break;
    case 2:
      uint64_t result = 0x7475626972747461;
      break;
    case 3:
      uint64_t result = 7107189;
      break;
    case 4:
      uint64_t result = 0x495455616964656DLL;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100033CB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_10003771C(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_100033CDC(uint64_t a1)
{
  unint64_t v2 = sub_100036FC8();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_100033D18(uint64_t a1)
{
  unint64_t v2 = sub_100036FC8();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_100033D54@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_1000334DC(a1, a2);
}

uint64_t sub_100033D6C(void *a1)
{
  return sub_1000331B8(a1);
}

uint64_t sub_100033D84(unint64_t a1)
{
  uint64_t v2 = sub_10005C510();
  uint64_t v3 = *(char ***)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  id v85 = (char *)&v72 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  id v84 = (char *)&v72 - v6;
  uint64_t v7 = sub_1000131E0((uint64_t *)&unk_10007D8F0);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  uint64_t v10 = (char *)&v72 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v8);
  char v13 = (char *)&v72 - v12;
  uint64_t v14 = __chkstk_darwin(v11);
  uint64_t v16 = (char *)&v72 - v15;
  uint64_t result = __chkstk_darwin(v14);
  uint64_t v91 = (uint64_t)&v72 - v18;
  if (a1 >> 62)
  {
LABEL_57:
    swift_bridgeObjectRetain();
    uint64_t v19 = sub_10005CCA0();
    uint64_t result = swift_bridgeObjectRelease();
    if (v19) {
      goto LABEL_3;
    }
    return 0;
  }
  uint64_t v19 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v19) {
    return 0;
  }
LABEL_3:
  if (v19 >= 1)
  {
    unint64_t v20 = 0;
    unint64_t v88 = a1 & 0xC000000000000001;
    id v93 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 6);
    id v94 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 7);
    id v81 = (void (**)(char *, uint64_t))(v3 + 1);
    id v82 = (void (**)(char *, uint64_t, uint64_t))(v3 + 2);
    uint64_t v3 = &selRef_size;
    unint64_t v76 = 0x8000000100064420;
    unint64_t v77 = (unint64_t)"Recently Deleted";
    id v75 = (void *)0x8000000100063B00;
    long long v78 = xmmword_1000622C0;
    unint64_t v74 = 0x80000001000643E0;
    unint64_t v73 = 0x80000001000643B0;
    id v79 = (char *)_swiftEmptyArrayStorage;
    id v83 = v10;
    uint64_t v89 = v19;
    uint64_t v90 = v2;
    id v86 = v16;
    unint64_t v87 = a1;
    while (1)
    {
      if (v20 >= 3)
      {
        __break(1u);
        goto LABEL_57;
      }
      unint64_t v80 = v20;
      int v92 = *((unsigned __int8 *)&off_100072660 + v20 + 32);
      uint64_t v96 = (uint64_t)_swiftEmptyArrayStorage;
      swift_bridgeObjectRetain();
      uint64_t v22 = 0;
      do
      {
        if (v88) {
          id v23 = (id)sub_10005CBE0();
        }
        else {
          id v23 = *(id *)(a1 + 8 * v22 + 32);
        }
        uint64_t v24 = v3[164];
        id v95 = v23;
        id v25 = [v23 v24];
        if (v25)
        {
          uint64_t v26 = v25;
          sub_10005C4B0();

          uint64_t v27 = *v94;
          (*v94)(v16, 0, 1, v2);
        }
        else
        {
          uint64_t v27 = *v94;
          (*v94)(v16, 1, 1, v2);
        }
        uint64_t v28 = v13;
        uint64_t v29 = v91;
        sub_100032924((uint64_t)v16, v91);
        uint64_t v30 = *v93;
        if ((*v93)(v29, 1, v2))
        {
          sub_10001E8C0(v29, (uint64_t *)&unk_10007D8F0);
        }
        else
        {
          uint64_t v31 = v84;
          (*v82)(v84, v29, v2);
          sub_10001E8C0(v29, (uint64_t *)&unk_10007D8F0);
          uint64_t v32 = v85;
          sub_10005C4F0();
          char v33 = sub_10005C500();
          uint64_t v34 = *v81;
          char v35 = v32;
          uint64_t v10 = v83;
          (*v81)(v35, v2);
          v34(v31, v2);
          uint64_t v3 = &selRef_size;
          if (v33)
          {
            BOOL v36 = 1;
            id v37 = v95;
            goto LABEL_23;
          }
        }
        id v37 = v95;
        id v38 = [v95 image];

        BOOL v36 = v38 != 0;
LABEL_23:
        id v39 = [v37 v3[164]];
        char v13 = v28;
        if (v39)
        {
          int v40 = v39;
          sub_10005C4B0();

          uint64_t v41 = 0;
        }
        else
        {
          uint64_t v41 = 1;
        }
        uint64_t v42 = v89;
        uint64_t v2 = v90;
        v27(v10, v41, 1, v90);
        sub_100032924((uint64_t)v10, (uint64_t)v13);
        if (v30((uint64_t)v13, 1, v2))
        {
          sub_10001E8C0((uint64_t)v13, (uint64_t *)&unk_10007D8F0);
          if (v36) {
            goto LABEL_9;
          }
        }
        else
        {
          uint64_t v43 = v84;
          (*v82)(v84, (uint64_t)v13, v2);
          sub_10001E8C0((uint64_t)v13, (uint64_t *)&unk_10007D8F0);
          uint64_t v44 = v85;
          sub_10005C480();
          char v45 = sub_10005C500();
          id v46 = *v81;
          id v47 = v44;
          uint64_t v10 = v83;
          (*v81)(v47, v2);
          v46(v43, v2);
          uint64_t v3 = &selRef_size;
          if (v36)
          {
LABEL_9:
            uint64_t v16 = v86;
            if (v92) {
              goto LABEL_10;
            }
            goto LABEL_34;
          }
          if (v45)
          {
            uint64_t v16 = v86;
            if (v92 != 1) {
              goto LABEL_10;
            }
            goto LABEL_34;
          }
        }
        uint64_t v16 = v86;
        if (v92 != 2)
        {
LABEL_10:

          goto LABEL_11;
        }
LABEL_34:
        sub_10005CC20();
        sub_10005CC50();
        sub_10005CC60();
        sub_10005CC30();
LABEL_11:
        a1 = v87;
        ++v22;
      }
      while (v42 != v22);
      swift_bridgeObjectRelease();
      uint64_t v48 = v96;
      BOOL v49 = v96 < 0 || (v96 & 0x4000000000000000) != 0;
      if (v49)
      {
        swift_retain();
        uint64_t v68 = sub_10005CCA0();
        swift_release();
        if (!v68) {
          goto LABEL_5;
        }
LABEL_40:
        if (v92)
        {
          if (v92 == 1)
          {
            type metadata accessor for CRLSEExtensionContextManager();
            uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
            uint64_t v51 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
            v71._countAndFlagsBits = v74;
            v53.value._object = (void *)(v77 | 0x8000000000000000);
            v52._countAndFlagsBits = 0x6964656D20756C25;
            v52._object = (void *)0xEF736D6574692061;
            v53.value._countAndFlagsBits = 0xD000000000000010;
            v54.super.Class isa = v51;
            v55._countAndFlagsBits = 0x6964656D20756C25;
            v55._object = (void *)0xEF736D6574692061;
          }
          else
          {
            type metadata accessor for CRLSEExtensionContextManager();
            uint64_t v57 = swift_getObjCClassFromMetadata();
            uint64_t v51 = (objc_class *)[self bundleForClass:v57];
            v71._countAndFlagsBits = v73;
            v53.value._object = (void *)(v77 | 0x8000000000000000);
            v52._countAndFlagsBits = 0x6B6E696C20756C25;
            v52._object = (void *)0xE900000000000073;
            v53.value._countAndFlagsBits = 0xD000000000000010;
            v54.super.Class isa = v51;
            v55._countAndFlagsBits = 0x6B6E696C20756C25;
            v55._object = (void *)0xE900000000000073;
          }
        }
        else
        {
          type metadata accessor for CRLSEExtensionContextManager();
          uint64_t v56 = swift_getObjCClassFromMetadata();
          uint64_t v51 = (objc_class *)[self bundleForClass:v56];
          v71._countAndFlagsBits = v76;
          v52._countAndFlagsBits = 0x67616D6920756C25;
          v52._object = (void *)0xEA00000000007365;
          v53.value._countAndFlagsBits = 0xD000000000000010;
          v53.value._object = v75;
          v54.super.Class isa = v51;
          v55._countAndFlagsBits = 0x67616D6920756C25;
          v55._object = (void *)0xEA00000000007365;
        }
        sub_10005C130(v52, v53, v54, v55, v71);
        id v95 = v58;

        sub_1000131E0(&qword_10007D870);
        uint64_t v59 = swift_allocObject();
        *(_OWORD *)(v59 + 16) = v78;
        if (v49)
        {
          swift_bridgeObjectRetain();
          uint64_t v60 = sub_10005CCA0();
          swift_release();
        }
        else
        {
          uint64_t v60 = *(void *)(v48 + 16);
        }
        swift_release();
        *(void *)(v59 + 56) = &type metadata for Int;
        *(void *)(v59 + 64) = &protocol witness table for Int;
        *(void *)(v59 + 32) = v60;
        uint64_t v61 = sub_10005C7E0();
        uint64_t v63 = v62;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          id v79 = sub_100053658(0, *((void *)v79 + 2) + 1, 1, v79);
        }
        unint64_t v21 = v80;
        unint64_t v65 = *((void *)v79 + 2);
        unint64_t v64 = *((void *)v79 + 3);
        if (v65 >= v64 >> 1)
        {
          id v69 = sub_100053658((char *)(v64 > 1), v65 + 1, 1, v79);
          unint64_t v21 = v80;
          id v79 = v69;
        }
        id v66 = v79;
        *((void *)v79 + 2) = v65 + 1;
        id v67 = &v66[16 * v65];
        *((void *)v67 + 4) = v61;
        *((void *)v67 + 5) = v63;
      }
      else
      {
        if (*(void *)(v96 + 16)) {
          goto LABEL_40;
        }
LABEL_5:
        swift_release();
        unint64_t v21 = v80;
      }
      unint64_t v20 = v21 + 1;
      uint64_t v3 = &selRef_size;
      if (v20 == 3)
      {
        uint64_t v96 = (uint64_t)v79;
        sub_1000131E0(&qword_10007D470);
        sub_10003475C();
        uint64_t v70 = sub_10005C7B0();
        swift_bridgeObjectRelease();
        return v70;
      }
    }
  }
  __break(1u);
  return result;
}

unint64_t sub_10003475C()
{
  unint64_t result = qword_10007D770;
  if (!qword_10007D770)
  {
    sub_10001DE60(&qword_10007D470);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D770);
  }
  return result;
}

uint64_t *sub_1000347B8(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_10005C3D0();
    uint64_t v8 = *(void *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      uint64_t v9 = sub_1000131E0((uint64_t *)&unk_10007D8C0);
      memcpy(a1, a2, *(void *)(*(void *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    uint64_t v11 = a3[5];
    uint64_t v12 = a3[6];
    char v13 = (uint64_t *)((char *)a1 + v11);
    uint64_t v14 = (uint64_t *)((char *)a2 + v11);
    uint64_t v15 = v14[1];
    *char v13 = *v14;
    v13[1] = v15;
    uint64_t v16 = (uint64_t *)((char *)a1 + v12);
    uint64_t v17 = (uint64_t *)((char *)a2 + v12);
    uint64_t v18 = v17[1];
    void *v16 = *v17;
    v16[1] = v18;
    *(uint64_t *)((char *)a1 + a3[7]) = *(uint64_t *)((char *)a2 + a3[7]);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_100034968(uint64_t a1)
{
  uint64_t v2 = sub_10005C3D0();
  uint64_t v3 = *(void *)(v2 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(a1, 1, v2)) {
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

char *sub_100034A54(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_10005C3D0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_1000131E0((uint64_t *)&unk_10007D8C0);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v9 = a3[5];
  uint64_t v10 = a3[6];
  uint64_t v11 = &a1[v9];
  uint64_t v12 = &a2[v9];
  uint64_t v13 = *((void *)v12 + 1);
  *(void *)uint64_t v11 = *(void *)v12;
  *((void *)v11 + 1) = v13;
  uint64_t v14 = &a1[v10];
  uint64_t v15 = &a2[v10];
  uint64_t v16 = *((void *)v15 + 1);
  *(void *)uint64_t v14 = *(void *)v15;
  *((void *)v14 + 1) = v16;
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

char *sub_100034BB4(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_10005C3D0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    uint64_t v11 = sub_1000131E0((uint64_t *)&unk_10007D8C0);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  uint64_t v12 = a3[5];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  *(void *)uint64_t v13 = *(void *)v14;
  *((void *)v13 + 1) = *((void *)v14 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v15 = a3[6];
  uint64_t v16 = &a1[v15];
  uint64_t v17 = &a2[v15];
  *(void *)uint64_t v16 = *(void *)v17;
  *((void *)v16 + 1) = *((void *)v17 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

char *sub_100034DA8(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_10005C3D0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    uint64_t v8 = sub_1000131E0((uint64_t *)&unk_10007D8C0);
    memcpy(a1, a2, *(void *)(*(void *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  uint64_t v9 = a3[6];
  *(_OWORD *)&a1[a3[5]] = *(_OWORD *)&a2[a3[5]];
  *(_OWORD *)&a1[v9] = *(_OWORD *)&a2[v9];
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  return a1;
}

char *sub_100034EE4(char *a1, char *a2, int *a3)
{
  uint64_t v6 = sub_10005C3D0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  int v9 = v8(a1, 1, v6);
  int v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    uint64_t v11 = sub_1000131E0((uint64_t *)&unk_10007D8C0);
    memcpy(a1, a2, *(void *)(*(void *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  uint64_t v12 = a3[5];
  uint64_t v13 = &a1[v12];
  uint64_t v14 = &a2[v12];
  uint64_t v16 = *(void *)v14;
  uint64_t v15 = *((void *)v14 + 1);
  *(void *)uint64_t v13 = v16;
  *((void *)v13 + 1) = v15;
  swift_bridgeObjectRelease();
  uint64_t v17 = a3[6];
  uint64_t v18 = &a1[v17];
  uint64_t v19 = &a2[v17];
  uint64_t v21 = *(void *)v19;
  uint64_t v20 = *((void *)v19 + 1);
  *(void *)uint64_t v18 = v21;
  *((void *)v18 + 1) = v20;
  swift_bridgeObjectRelease();
  *(void *)&a1[a3[7]] = *(void *)&a2[a3[7]];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1000350B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000350C4);
}

uint64_t sub_1000350C4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_1000131E0((uint64_t *)&unk_10007D8C0);
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 24) + 8);
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t sub_10003518C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000351A0);
}

uint64_t sub_1000351A0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_1000131E0((uint64_t *)&unk_10007D8C0);
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 24) + 8) = (a2 - 1);
  }
  return result;
}

uint64_t type metadata accessor for CRLSEImportManifest(uint64_t a1)
{
  return sub_10001762C(a1, qword_10007D4D0);
}

void sub_100035284()
{
  sub_100036E44(319, (unint64_t *)&unk_10007CB18, (void (*)(uint64_t))&type metadata accessor for UUID);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t *sub_10003534C(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v19 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v19 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_10005C3D0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    unint64_t v10 = (uint64_t *)((char *)a1 + v8);
    uint64_t v11 = (uint64_t *)((char *)a2 + v8);
    uint64_t v12 = v11[1];
    *unint64_t v10 = *v11;
    v10[1] = v12;
    uint64_t v13 = (char *)a1 + v9;
    uint64_t v14 = (char *)a2 + v9;
    uint64_t v15 = sub_10005C110();
    uint64_t v16 = *(void *)(v15 - 8);
    uint64_t v17 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48);
    swift_bridgeObjectRetain();
    if (v17(v14, 1, v15))
    {
      uint64_t v18 = sub_1000131E0(&qword_10007D510);
      memcpy(v13, v14, *(void *)(*(void *)(v18 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v13, v14, v15);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
    }
    uint64_t v20 = a3[7];
    uint64_t v21 = (char *)a1 + v20;
    uint64_t v22 = (char *)a2 + v20;
    uint64_t v23 = sub_10005C300();
    uint64_t v24 = *(void *)(v23 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v22, 1, v23))
    {
      uint64_t v25 = sub_1000131E0(&qword_10007D0E8);
      memcpy(v21, v22, *(void *)(*(void *)(v25 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v21, v22, v23);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v24 + 56))(v21, 0, 1, v23);
    }
    uint64_t v26 = a3[8];
    uint64_t v27 = (char *)a1 + v26;
    uint64_t v28 = (char *)a2 + v26;
    uint64_t v29 = sub_10005C510();
    uint64_t v30 = *(void *)(v29 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29))
    {
      uint64_t v31 = sub_1000131E0((uint64_t *)&unk_10007D8F0);
      memcpy(v27, v28, *(void *)(*(void *)(v31 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v30 + 16))(v27, v28, v29);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v30 + 56))(v27, 0, 1, v29);
    }
  }
  return a1;
}

uint64_t sub_1000356EC(uint64_t a1, int *a2)
{
  uint64_t v4 = sub_10005C3D0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  swift_bridgeObjectRelease();
  uint64_t v5 = a1 + a2[6];
  uint64_t v6 = sub_10005C110();
  uint64_t v7 = *(void *)(v6 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6)) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  }
  uint64_t v8 = a1 + a2[7];
  uint64_t v9 = sub_10005C300();
  uint64_t v10 = *(void *)(v9 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9)) {
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  }
  uint64_t v11 = a1 + a2[8];
  uint64_t v12 = sub_10005C510();
  uint64_t v15 = *(void *)(v12 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v11, 1, v12);
  if (!result)
  {
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t))(v15 + 8);
    return v14(v11, v12);
  }
  return result;
}

uint64_t sub_100035934(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10005C3D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (void *)(a1 + v7);
  uint64_t v10 = (void *)(a2 + v7);
  uint64_t v11 = v10[1];
  *uint64_t v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = (void *)(a1 + v8);
  uint64_t v13 = (const void *)(a2 + v8);
  uint64_t v14 = sub_10005C110();
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v15 + 48);
  swift_bridgeObjectRetain();
  if (v16(v13, 1, v14))
  {
    uint64_t v17 = sub_1000131E0(&qword_10007D510);
    memcpy(v12, v13, *(void *)(*(void *)(v17 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v15 + 16))(v12, v13, v14);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  uint64_t v18 = a3[7];
  uint64_t v19 = (void *)(a1 + v18);
  uint64_t v20 = (const void *)(a2 + v18);
  uint64_t v21 = sub_10005C300();
  uint64_t v22 = *(void *)(v21 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21))
  {
    uint64_t v23 = sub_1000131E0(&qword_10007D0E8);
    memcpy(v19, v20, *(void *)(*(void *)(v23 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v22 + 16))(v19, v20, v21);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v22 + 56))(v19, 0, 1, v21);
  }
  uint64_t v24 = a3[8];
  uint64_t v25 = (void *)(a1 + v24);
  uint64_t v26 = (const void *)(a2 + v24);
  uint64_t v27 = sub_10005C510();
  uint64_t v28 = *(void *)(v27 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27))
  {
    uint64_t v29 = sub_1000131E0((uint64_t *)&unk_10007D8F0);
    memcpy(v25, v26, *(void *)(*(void *)(v29 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v28 + 16))(v25, v26, v27);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v28 + 56))(v25, 0, 1, v27);
  }
  return a1;
}

uint64_t sub_100035C84(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10005C3D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v10 = a3[6];
  uint64_t v11 = (void *)(a1 + v10);
  uint64_t v12 = (void *)(a2 + v10);
  uint64_t v13 = sub_10005C110();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v14 + 48);
  int v16 = v15(v11, 1, v13);
  int v17 = v15(v12, 1, v13);
  if (v16)
  {
    if (!v17)
    {
      (*(void (**)(void *, void *, uint64_t))(v14 + 16))(v11, v12, v13);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v17)
  {
    (*(void (**)(void *, uint64_t))(v14 + 8))(v11, v13);
LABEL_6:
    uint64_t v18 = sub_1000131E0(&qword_10007D510);
    memcpy(v11, v12, *(void *)(*(void *)(v18 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v14 + 24))(v11, v12, v13);
LABEL_7:
  uint64_t v19 = a3[7];
  uint64_t v20 = (void *)(a1 + v19);
  uint64_t v21 = (void *)(a2 + v19);
  uint64_t v22 = sub_10005C300();
  uint64_t v23 = *(void *)(v22 - 8);
  uint64_t v24 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v23 + 48);
  int v25 = v24(v20, 1, v22);
  int v26 = v24(v21, 1, v22);
  if (v25)
  {
    if (!v26)
    {
      (*(void (**)(void *, void *, uint64_t))(v23 + 16))(v20, v21, v22);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v26)
  {
    (*(void (**)(void *, uint64_t))(v23 + 8))(v20, v22);
LABEL_12:
    uint64_t v27 = sub_1000131E0(&qword_10007D0E8);
    memcpy(v20, v21, *(void *)(*(void *)(v27 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v23 + 24))(v20, v21, v22);
LABEL_13:
  uint64_t v28 = a3[8];
  uint64_t v29 = (void *)(a1 + v28);
  uint64_t v30 = (void *)(a2 + v28);
  uint64_t v31 = sub_10005C510();
  uint64_t v32 = *(void *)(v31 - 8);
  char v33 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v32 + 48);
  int v34 = v33(v29, 1, v31);
  int v35 = v33(v30, 1, v31);
  if (!v34)
  {
    if (!v35)
    {
      (*(void (**)(void *, void *, uint64_t))(v32 + 24))(v29, v30, v31);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v32 + 8))(v29, v31);
    goto LABEL_18;
  }
  if (v35)
  {
LABEL_18:
    uint64_t v36 = sub_1000131E0((uint64_t *)&unk_10007D8F0);
    memcpy(v29, v30, *(void *)(*(void *)(v36 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v32 + 16))(v29, v30, v31);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v32 + 56))(v29, 0, 1, v31);
  return a1;
}

uint64_t sub_1000360FC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10005C3D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = sub_10005C110();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = sub_1000131E0(&qword_10007D510);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  uint64_t v13 = a3[7];
  uint64_t v14 = (void *)(a1 + v13);
  uint64_t v15 = (const void *)(a2 + v13);
  uint64_t v16 = sub_10005C300();
  uint64_t v17 = *(void *)(v16 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16))
  {
    uint64_t v18 = sub_1000131E0(&qword_10007D0E8);
    memcpy(v14, v15, *(void *)(*(void *)(v18 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v17 + 32))(v14, v15, v16);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v17 + 56))(v14, 0, 1, v16);
  }
  uint64_t v19 = a3[8];
  uint64_t v20 = (void *)(a1 + v19);
  uint64_t v21 = (const void *)(a2 + v19);
  uint64_t v22 = sub_10005C510();
  uint64_t v23 = *(void *)(v22 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v23 + 48))(v21, 1, v22))
  {
    uint64_t v24 = sub_1000131E0((uint64_t *)&unk_10007D8F0);
    memcpy(v20, v21, *(void *)(*(void *)(v24 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v23 + 32))(v20, v21, v22);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v23 + 56))(v20, 0, 1, v22);
  }
  return a1;
}

uint64_t sub_100036434(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10005C3D0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (uint64_t *)(a2 + v7);
  uint64_t v11 = *v9;
  uint64_t v10 = v9[1];
  *uint64_t v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  uint64_t v12 = a3[6];
  uint64_t v13 = (void *)(a1 + v12);
  uint64_t v14 = (void *)(a2 + v12);
  uint64_t v15 = sub_10005C110();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v16 + 48);
  int v18 = v17(v13, 1, v15);
  int v19 = v17(v14, 1, v15);
  if (v18)
  {
    if (!v19)
    {
      (*(void (**)(void *, void *, uint64_t))(v16 + 32))(v13, v14, v15);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v19)
  {
    (*(void (**)(void *, uint64_t))(v16 + 8))(v13, v15);
LABEL_6:
    uint64_t v20 = sub_1000131E0(&qword_10007D510);
    memcpy(v13, v14, *(void *)(*(void *)(v20 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(void *, void *, uint64_t))(v16 + 40))(v13, v14, v15);
LABEL_7:
  uint64_t v21 = a3[7];
  uint64_t v22 = (void *)(a1 + v21);
  uint64_t v23 = (void *)(a2 + v21);
  uint64_t v24 = sub_10005C300();
  uint64_t v25 = *(void *)(v24 - 8);
  int v26 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v25 + 48);
  int v27 = v26(v22, 1, v24);
  int v28 = v26(v23, 1, v24);
  if (v27)
  {
    if (!v28)
    {
      (*(void (**)(void *, void *, uint64_t))(v25 + 32))(v22, v23, v24);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v25 + 56))(v22, 0, 1, v24);
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (v28)
  {
    (*(void (**)(void *, uint64_t))(v25 + 8))(v22, v24);
LABEL_12:
    uint64_t v29 = sub_1000131E0(&qword_10007D0E8);
    memcpy(v22, v23, *(void *)(*(void *)(v29 - 8) + 64));
    goto LABEL_13;
  }
  (*(void (**)(void *, void *, uint64_t))(v25 + 40))(v22, v23, v24);
LABEL_13:
  uint64_t v30 = a3[8];
  uint64_t v31 = (void *)(a1 + v30);
  uint64_t v32 = (void *)(a2 + v30);
  uint64_t v33 = sub_10005C510();
  uint64_t v34 = *(void *)(v33 - 8);
  int v35 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v34 + 48);
  int v36 = v35(v31, 1, v33);
  int v37 = v35(v32, 1, v33);
  if (!v36)
  {
    if (!v37)
    {
      (*(void (**)(void *, void *, uint64_t))(v34 + 40))(v31, v32, v33);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v34 + 8))(v31, v33);
    goto LABEL_18;
  }
  if (v37)
  {
LABEL_18:
    uint64_t v38 = sub_1000131E0((uint64_t *)&unk_10007D8F0);
    memcpy(v31, v32, *(void *)(*(void *)(v38 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v34 + 32))(v31, v32, v33);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v34 + 56))(v31, 0, 1, v33);
  return a1;
}

uint64_t sub_10003689C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_1000368B0);
}

uint64_t sub_1000368B0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_10005C3D0();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    uint64_t v10 = a1;
LABEL_14:
    return v9(v10, a2, v8);
  }
  if (a2 == 2147483646)
  {
    unint64_t v11 = *(void *)(a1 + a3[5] + 8);
    if (v11 >= 0xFFFFFFFF) {
      LODWORD(v11) = -1;
    }
    int v12 = v11 - 1;
    if (v12 < 0) {
      int v12 = -1;
    }
    return (v12 + 1);
  }
  uint64_t v14 = sub_1000131E0(&qword_10007D510);
  if (*(_DWORD *)(*(void *)(v14 - 8) + 84) == a2)
  {
    uint64_t v8 = v14;
    uint64_t v15 = *(void *)(v14 - 8);
    uint64_t v16 = a3[6];
LABEL_13:
    uint64_t v10 = a1 + v16;
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 48);
    goto LABEL_14;
  }
  uint64_t v17 = sub_1000131E0(&qword_10007D0E8);
  if (*(_DWORD *)(*(void *)(v17 - 8) + 84) == a2)
  {
    uint64_t v8 = v17;
    uint64_t v15 = *(void *)(v17 - 8);
    uint64_t v16 = a3[7];
    goto LABEL_13;
  }
  uint64_t v18 = sub_1000131E0((uint64_t *)&unk_10007D8F0);
  int v19 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 48);
  uint64_t v20 = v18;
  uint64_t v21 = a1 + a3[8];

  return v19(v21, a2, v20);
}

uint64_t sub_100036A98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100036AAC);
}

uint64_t sub_100036AAC(uint64_t a1, uint64_t a2, int a3, int *a4)
{
  uint64_t result = sub_10005C3D0();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = result;
    unint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    uint64_t v12 = a1;
LABEL_10:
    return v11(v12, a2, a2, v10);
  }
  if (a3 == 2147483646)
  {
    *(void *)(a1 + a4[5] + 8) = a2;
    return result;
  }
  uint64_t v13 = sub_1000131E0(&qword_10007D510);
  if (*(_DWORD *)(*(void *)(v13 - 8) + 84) == a3)
  {
    uint64_t v10 = v13;
    uint64_t v14 = *(void *)(v13 - 8);
    uint64_t v15 = a4[6];
LABEL_9:
    uint64_t v12 = a1 + v15;
    unint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    goto LABEL_10;
  }
  uint64_t v16 = sub_1000131E0(&qword_10007D0E8);
  if (*(_DWORD *)(*(void *)(v16 - 8) + 84) == a3)
  {
    uint64_t v10 = v16;
    uint64_t v14 = *(void *)(v16 - 8);
    uint64_t v15 = a4[7];
    goto LABEL_9;
  }
  uint64_t v17 = sub_1000131E0((uint64_t *)&unk_10007D8F0);
  uint64_t v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56);
  uint64_t v19 = v17;
  uint64_t v20 = a1 + a4[8];

  return v18(v20, a2, a2, v19);
}

uint64_t type metadata accessor for CRLSEManifestItem(uint64_t a1)
{
  return sub_10001762C(a1, (uint64_t *)&unk_10007D570);
}

void sub_100036CA8()
{
  sub_10005C3D0();
  if (v0 <= 0x3F)
  {
    sub_100036E44(319, &qword_10007D580, (void (*)(uint64_t))&type metadata accessor for AttributedString);
    if (v1 <= 0x3F)
    {
      sub_100036E44(319, (unint64_t *)&qword_10007D588, (void (*)(uint64_t))&type metadata accessor for URL);
      if (v2 <= 0x3F)
      {
        sub_100036E44(319, (unint64_t *)&unk_10007D590, (void (*)(uint64_t))&type metadata accessor for UTType);
        if (v3 <= 0x3F) {
          swift_initStructMetadata();
        }
      }
    }
  }
}

void sub_100036E44(uint64_t a1, unint64_t *a2, void (*a3)(uint64_t))
{
  if (!*a2)
  {
    a3(255);
    unint64_t v4 = sub_10005CAB0();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

unint64_t sub_100036E98()
{
  unint64_t result = qword_10007D5D8;
  if (!qword_10007D5D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D5D8);
  }
  return result;
}

uint64_t sub_100036EEC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100036F34(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10001DE60(&qword_10007D5E0);
    sub_100036EEC(a2, (void (*)(uint64_t))type metadata accessor for CRLSEManifestItem);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100036FC8()
{
  unint64_t result = qword_10007D618;
  if (!qword_10007D618)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D618);
  }
  return result;
}

uint64_t sub_10003701C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000131E0(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 40))(a2, a1, v5);
  return a2;
}

uint64_t sub_100037080(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1000370E8(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unsigned char *storeEnumTagSinglePayload for CRLSEManifestItem.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
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
        JUMPOUT(0x100037214);
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

ValueMetadata *type metadata accessor for CRLSEManifestItem.CodingKeys()
{
  return &type metadata for CRLSEManifestItem.CodingKeys;
}

unsigned char *storeEnumTagSinglePayload for CRLSEImportManifest.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 3 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 3) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFD) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFC)
  {
    unsigned int v6 = ((a2 - 253) >> 8) + 1;
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x100037318);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for CRLSEImportManifest.CodingKeys()
{
  return &type metadata for CRLSEImportManifest.CodingKeys;
}

unint64_t sub_100037354()
{
  unint64_t result = qword_10007D658;
  if (!qword_10007D658)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D658);
  }
  return result;
}

unint64_t sub_1000373AC()
{
  unint64_t result = qword_10007D660;
  if (!qword_10007D660)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D660);
  }
  return result;
}

unint64_t sub_100037404()
{
  unint64_t result = qword_10007D668;
  if (!qword_10007D668)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D668);
  }
  return result;
}

unint64_t sub_10003745C()
{
  unint64_t result = qword_10007D670;
  if (!qword_10007D670)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D670);
  }
  return result;
}

unint64_t sub_1000374B4()
{
  unint64_t result = qword_10007D678;
  if (!qword_10007D678)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D678);
  }
  return result;
}

unint64_t sub_10003750C()
{
  unint64_t result = qword_10007D680;
  if (!qword_10007D680)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D680);
  }
  return result;
}

uint64_t sub_100037560(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x4955556472616F62 && a2 == 0xE900000000000044;
  if (v2 || (sub_10005CDF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6D614E72656E776FLL && a2 == 0xE900000000000065 || (sub_10005CDF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x656C746974 && a2 == 0xE500000000000000 || (sub_10005CDF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x736D657469 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_10005CDF0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_10003771C(uint64_t a1, uint64_t a2)
{
  BOOL v2 = a1 == 0x444955556D657469 && a2 == 0xE800000000000000;
  if (v2 || (sub_10005CDF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x656C746974 && a2 == 0xE500000000000000 || (sub_10005CDF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x7475626972747461 && a2 == 0xEE00747865546465 || (sub_10005CDF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 7107189 && a2 == 0xE300000000000000 || (sub_10005CDF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x495455616964656DLL && a2 == 0xE800000000000000)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else
  {
    char v6 = sub_10005CDF0();
    swift_bridgeObjectRelease();
    if (v6) {
      return 4;
    }
    else {
      return 5;
    }
  }
}

id sub_100037948()
{
  return sub_100037968(&OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController____lazy_storage___shortDateFormatter, 1);
}

id sub_100037958()
{
  return sub_100037968(&OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController____lazy_storage___mediumDateFormatter, 2);
}

id sub_100037968(uint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *a1;
  unsigned int v4 = *(void **)(v2 + *a1);
  if (v4)
  {
    id v5 = *(id *)(v2 + *a1);
  }
  else
  {
    id v7 = [objc_allocWithZone((Class)NSDateFormatter) init];
    [v7 setDateStyle:a2];
    [v7 setTimeStyle:1];
    uint64_t v8 = *(void **)(v2 + v3);
    *(void *)(v2 + v3) = v7;
    id v5 = v7;

    unsigned int v4 = 0;
  }
  id v9 = v4;
  return v5;
}

id sub_100037A0C()
{
  uint64_t v1 = OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController____lazy_storage___localizedDateFormatter;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController____lazy_storage___localizedDateFormatter);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController____lazy_storage___localizedDateFormatter);
  }
  else
  {
    id v4 = [objc_allocWithZone((Class)NSDateFormatter) init];
    NSString v5 = sub_10005C7D0();
    [v4 setLocalizedDateFormatFromTemplate:v5];

    char v6 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v7 = v2;
  return v3;
}

id sub_100037B70()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v2 = sub_1000131E0(&qword_10007D718);
  uint64_t v82 = *(void *)(v2 - 8);
  uint64_t v83 = v2;
  uint64_t v3 = __chkstk_darwin(v2);
  v79[1] = v4;
  unint64_t v80 = (char *)v79 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  id v81 = (char *)v79 - v5;
  uint64_t v6 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  uint64_t v7 = __chkstk_darwin(v6);
  id v9 = (char *)v79 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)v79 - v11;
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v15 = (char *)v79 - v14;
  uint64_t v16 = __chkstk_darwin(v13);
  uint64_t v18 = (char *)v79 - v17;
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)v79 - v19;
  [v1 setEdgesForExtendedLayout:0];
  id result = [v1 view];
  if (!result)
  {
    __break(1u);
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  uint64_t v22 = result;
  id v23 = [self systemGroupedBackgroundColor];
  [v22 setBackgroundColor:v23];

  id v24 = [v1 navigationItem];
  uint64_t v25 = (uint64_t)v1 + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController_representedObject;
  sub_10003C0EC((uint64_t)v1 + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController_representedObject, (uint64_t)v20, type metadata accessor for CRLSELibraryViewModel.Item);
  sub_10003C0EC((uint64_t)v20, (uint64_t)v18, type metadata accessor for CRLSELibraryViewModel.Item);
  uint64_t v85 = v6;
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_10003C154((uint64_t)v20, type metadata accessor for CRLSELibraryViewModel.Item);
    sub_10003C0EC(v25, (uint64_t)v15, type metadata accessor for CRLSELibraryViewModel.Item);
    sub_1000190F4();
    sub_10003C154((uint64_t)v15, type metadata accessor for CRLSELibraryViewModel.Item);
  }
  else
  {
    sub_10003C154((uint64_t)v18, type metadata accessor for CRLSELibraryViewModel.Item);
    sub_10003C154((uint64_t)v20, type metadata accessor for CRLSELibraryViewModel.Item);
    type metadata accessor for CRLSEExtensionContextManager();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v27 = [self bundleForClass:ObjCClassFromMetadata];
    NSString v28 = sub_10005C7D0();
    NSString v29 = sub_10005C7D0();
    NSString v30 = sub_10005C7D0();
    id v31 = [v27 localizedStringForKey:v28 value:v29 table:v30];

    sub_10005C810();
  }
  NSString v32 = sub_10005C7D0();
  swift_bridgeObjectRelease();
  [v24 setTitle:v32];

  sub_10003C0EC(v25, (uint64_t)v12, type metadata accessor for CRLSELibraryViewModel.Item);
  sub_10003C0EC((uint64_t)v12, (uint64_t)v9, type metadata accessor for CRLSELibraryViewModel.Item);
  if (swift_getEnumCaseMultiPayload())
  {
    sub_10003C154((uint64_t)v9, type metadata accessor for CRLSELibraryViewModel.Item);
    sub_10003C154((uint64_t)v12, type metadata accessor for CRLSELibraryViewModel.Item);
    p_imp = (IMP *)(&stru_100079FF0 + 16);
    uint64_t v34 = &selRef_size;
  }
  else
  {
    sub_10003C154((uint64_t)v12, type metadata accessor for CRLSELibraryViewModel.Item);
    id v35 = [self mainBundle];
    NSString v36 = sub_10005C7D0();
    id v37 = [v35 objectForInfoDictionaryKey:v36];

    if (v37)
    {
      sub_10005CB20();
      swift_unknownObjectRelease();
    }
    else
    {
      memset(v88, 0, sizeof(v88));
    }
    p_imp = &stru_100079FF0.imp;
    uint64_t v34 = &selRef_size;
    sub_10003C51C((uint64_t)v88, (uint64_t)&v89, (uint64_t *)&unk_10007D390);
    if (*((void *)&v90 + 1))
    {
      int v38 = swift_dynamicCast();
      if (v38) {
        uint64_t v39 = v86;
      }
      else {
        uint64_t v39 = 0;
      }
      if (v38) {
        uint64_t v40 = v87;
      }
      else {
        uint64_t v40 = 0;
      }
    }
    else
    {
      sub_10001E8C0((uint64_t)&v89, (uint64_t *)&unk_10007D390);
      uint64_t v39 = 0;
      uint64_t v40 = 0;
    }
    id v41 = [v1 navigationItem];
    long long v89 = 0u;
    long long v90 = 0u;
    id v42 = objc_allocWithZone((Class)UIBarButtonItem);
    id v43 = sub_10003BF3C(v39, v40, 0, &v89, 0);
    [v41 setBackBarButtonItem:v43];
  }
  id v44 = [v1 v34[68]];
  id v45 = [objc_allocWithZone((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:v1 action:"cancel:"];
  [v44 setRightBarButtonItem:v45];

  id v46 = sub_10003904C();
  [v46 setDelegate:v1];
  id result = [v1 p_imp[491]];
  if (!result) {
    goto LABEL_26;
  }
  id v47 = result;
  [result addSubview:v46];

  sub_1000131E0((uint64_t *)&unk_10007D110);
  uint64_t v48 = swift_allocObject();
  *(_OWORD *)(v48 + 16) = xmmword_1000622F0;
  id v49 = [v46 topAnchor];
  id result = [v1 p_imp[491]];
  if (!result)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  uint64_t v50 = result;
  id v51 = [result topAnchor];

  id v52 = [v49 constraintEqualToAnchor:v51];
  *(void *)(v48 + 32) = v52;
  id v53 = [v46 bottomAnchor];
  id result = [v1 p_imp[491]];
  if (!result)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  NSBundle v54 = result;
  id v55 = [result bottomAnchor];

  id v56 = [v53 constraintEqualToAnchor:v55];
  *(void *)(v48 + 40) = v56;
  id v57 = [v46 leadingAnchor];
  id result = [v1 p_imp[491]];
  if (!result)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  char v58 = result;
  id v59 = [result leadingAnchor];

  id v60 = [v57 constraintEqualToAnchor:v59];
  *(void *)(v48 + 48) = v60;
  id v61 = [v46 trailingAnchor];
  id result = [v1 p_imp[491]];
  if (result)
  {
    uint64_t v62 = result;
    uint64_t v63 = self;
    id v64 = [v62 trailingAnchor];

    id v65 = [v61 constraintEqualToAnchor:v64];
    *(void *)(v48 + 56) = v65;
    *(void *)&long long v89 = v48;
    sub_10005C910();
    sub_10002DBB8(0, (unint64_t *)&qword_10007D3A0);
    Class isa = sub_10005C8F0().super.isa;
    swift_bridgeObjectRelease();
    [v63 activateConstraints:isa];

    *(void *)(swift_allocObject() + 16) = v1;
    sub_10002DBB8(0, &qword_10007D720);
    id v67 = v1;
    uint64_t v68 = v81;
    sub_10005C9D0();
    uint64_t v70 = v82;
    uint64_t v69 = v83;
    Swift::String v71 = v80;
    (*(void (**)(char *, char *, uint64_t))(v82 + 16))(v80, v68, v83);
    unint64_t v72 = (*(unsigned __int8 *)(v70 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v70 + 80);
    uint64_t v73 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v70 + 32))(v73 + v72, v71, v69);
    id v74 = objc_allocWithZone((Class)sub_1000131E0(&qword_10007D728));
    id v75 = v46;
    uint64_t v76 = sub_10005C6B0();
    (*(void (**)(char *, uint64_t))(v70 + 8))(v68, v69);
    unint64_t v77 = *(void **)&v67[OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController_dataSource];
    *(void *)&v67[OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController_dataSource] = v76;

    sub_1000387CC(0);
    sub_1000131E0((uint64_t *)&unk_10007D730);
    uint64_t v78 = swift_allocObject();
    *(_OWORD *)(v78 + 16) = xmmword_1000622C0;
    *(void *)(v78 + 32) = sub_10005C760();
    *(void *)(v78 + 40) = &protocol witness table for UITraitPreferredContentSizeCategory;
    sub_10005CA20();

    swift_bridgeObjectRelease();
    return (id)swift_unknownObjectRelease();
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1000387CC(int a1)
{
  int v67 = a1;
  uint64_t v72 = type metadata accessor for CRLSELibraryViewModeItemNode(0);
  uint64_t v69 = *(void *)(v72 - 8);
  uint64_t v1 = __chkstk_darwin(v72);
  uint64_t v3 = (char *)&v63 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __chkstk_darwin(v1);
  uint64_t v71 = (uint64_t)&v63 - v5;
  __chkstk_darwin(v4);
  uint64_t v77 = (uint64_t)&v63 - v6;
  uint64_t v7 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v63 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v63 - v13;
  uint64_t v15 = __chkstk_darwin(v12);
  uint64_t v17 = (char *)&v63 - v16;
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v63 - v18;
  uint64_t v20 = sub_1000131E0(&qword_10007D700);
  uint64_t v64 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  uint64_t v22 = (char *)&v63 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003C310();
  sub_10003C364();
  sub_10005C6A0();
  v23._rawValue = &off_1000726B0;
  id v65 = v22;
  uint64_t v66 = v20;
  uint64_t v24 = v72;
  sub_10005C690(v23);
  uint64_t v25 = v70 + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController_representedObject;
  sub_10003C0EC(v70 + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController_representedObject, (uint64_t)v19, type metadata accessor for CRLSELibraryViewModel.Item);
  uint64_t v76 = v19;
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v27 = *(void *)(v25 + *(int *)(v24 + 20));
  uint64_t v68 = v27;
  if (!EnumCaseMultiPayload)
  {
    uint64_t v76 = v17;
    id v74 = v14;
    uint64_t v78 = _swiftEmptyArrayStorage;
    uint64_t v34 = *(void *)(v27 + 16);
    uint64_t result = swift_bridgeObjectRetain();
    uint64_t v75 = v34;
    if (!v34)
    {
      uint64_t v48 = _swiftEmptyArrayStorage;
      uint64_t v38 = v69;
LABEL_27:
      swift_bridgeObjectRelease();
      int64_t v49 = v48[2];
      if (v49)
      {
        uint64_t v78 = _swiftEmptyArrayStorage;
        sub_1000455B8(0, v49, 0);
        uint64_t v50 = (uint64_t)v48
            + ((*(unsigned __int8 *)(v38 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80));
        uint64_t v51 = *(void *)(v38 + 72);
        uint64_t v52 = (uint64_t)v74;
        do
        {
          sub_10003C0EC(v50, (uint64_t)v3, type metadata accessor for CRLSELibraryViewModeItemNode);
          sub_10003C0EC((uint64_t)v3, v52, type metadata accessor for CRLSELibraryViewModel.Item);
          sub_10003C154((uint64_t)v3, type metadata accessor for CRLSELibraryViewModeItemNode);
          id v53 = v78;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_1000455B8(0, v53[2] + 1, 1);
            uint64_t v52 = (uint64_t)v74;
            id v53 = v78;
          }
          unint64_t v55 = v53[2];
          unint64_t v54 = v53[3];
          if (v55 >= v54 >> 1)
          {
            sub_1000455B8(v54 > 1, v55 + 1, 1);
            uint64_t v52 = (uint64_t)v74;
            id v53 = v78;
          }
          v53[2] = v55 + 1;
          sub_10003C1B4(v52, (uint64_t)v53+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(void *)(v8 + 72) * v55, type metadata accessor for CRLSELibraryViewModel.Item);
          v50 += v51;
          --v49;
        }
        while (v49);
      }
      swift_release();
      goto LABEL_35;
    }
    uint64_t v36 = v27;
    unint64_t v37 = 0;
    uint64_t v73 = _swiftEmptyArrayStorage;
    uint64_t v38 = v69;
    while (1)
    {
      if (v37 >= *(void *)(v36 + 16))
      {
        __break(1u);
LABEL_42:
        __break(1u);
LABEL_43:
        __break(1u);
        return result;
      }
      uint64_t v40 = v8;
      unint64_t v41 = (*(unsigned __int8 *)(v38 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v38 + 80);
      uint64_t v42 = *(void *)(v38 + 72);
      uint64_t v43 = v77;
      sub_10003C0EC(v36 + v41 + v42 * v37, v77, type metadata accessor for CRLSELibraryViewModeItemNode);
      id v44 = v76;
      sub_10003C0EC(v43, (uint64_t)v76, type metadata accessor for CRLSELibraryViewModel.Item);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v39 = v77;
        if (*v44 != 4 && *(void *)(*(void *)(v77 + *(int *)(v72 + 20)) + 16))
        {
          sub_10003C1B4(v77, v71, type metadata accessor for CRLSELibraryViewModeItemNode);
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
            sub_100045504(0, v73[2] + 1, 1);
          }
          uint64_t v73 = v78;
          unint64_t v46 = v78[2];
          unint64_t v45 = v78[3];
          if (v46 >= v45 >> 1)
          {
            sub_100045504(v45 > 1, v46 + 1, 1);
            uint64_t v73 = v78;
          }
          id v47 = v73;
          v73[2] = v46 + 1;
          uint64_t result = sub_10003C1B4(v71, (uint64_t)v47 + v41 + v46 * v42, type metadata accessor for CRLSELibraryViewModeItemNode);
          uint64_t v36 = v68;
          uint64_t v38 = v69;
          goto LABEL_15;
        }
      }
      else
      {
        sub_10003C154((uint64_t)v44, type metadata accessor for CRLSELibraryViewModel.Item);
        uint64_t v39 = v77;
      }
      uint64_t result = sub_10003C154(v39, type metadata accessor for CRLSELibraryViewModeItemNode);
LABEL_15:
      ++v37;
      uint64_t v8 = v40;
      if (v75 == v37)
      {
        uint64_t v48 = v78;
        goto LABEL_27;
      }
    }
  }
  int64_t v28 = *(void *)(v27 + 16);
  if (v28)
  {
    uint64_t v78 = _swiftEmptyArrayStorage;
    swift_bridgeObjectRetain();
    sub_1000455B8(0, v28, 0);
    uint64_t v29 = v27 + ((*(unsigned __int8 *)(v69 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v69 + 80));
    uint64_t v30 = *(void *)(v69 + 72);
    id v31 = v78;
    do
    {
      sub_10003C0EC(v29, (uint64_t)v3, type metadata accessor for CRLSELibraryViewModeItemNode);
      sub_10003C0EC((uint64_t)v3, (uint64_t)v11, type metadata accessor for CRLSELibraryViewModel.Item);
      sub_10003C154((uint64_t)v3, type metadata accessor for CRLSELibraryViewModeItemNode);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1000455B8(0, v31[2] + 1, 1);
        id v31 = v78;
      }
      unint64_t v33 = v31[2];
      unint64_t v32 = v31[3];
      if (v33 >= v32 >> 1)
      {
        sub_1000455B8(v32 > 1, v33 + 1, 1);
        id v31 = v78;
      }
      v31[2] = v33 + 1;
      sub_10003C1B4((uint64_t)v11, (uint64_t)v31+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(void *)(v8 + 72) * v33, type metadata accessor for CRLSELibraryViewModel.Item);
      v29 += v30;
      --v28;
    }
    while (v28);
    swift_bridgeObjectRelease();
  }
  sub_10003C154((uint64_t)v76, type metadata accessor for CRLSELibraryViewModel.Item);
LABEL_35:
  uint64_t v56 = v70;
  char v57 = v67;
  id v59 = v65;
  uint64_t v58 = v66;
  LOBYTE(v78) = 1;
  sub_10005C680();
  uint64_t result = swift_bridgeObjectRelease();
  id v60 = *(void **)(v56 + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController_dataSource);
  if (v57)
  {
    if (!v60) {
      goto LABEL_42;
    }
    id v61 = v60;
    sub_10005C6D0();
  }
  else
  {
    if (!v60) {
      goto LABEL_43;
    }
    id v61 = v60;
    sub_10005C6F0();
  }
  uint64_t v62 = v64;

  return (*(uint64_t (**)(char *, uint64_t))(v62 + 8))(v59, v58);
}

id sub_10003904C()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10005C710();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10005C700();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10005C750();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for UICollectionLayoutListConfiguration.Appearance.insetGrouped(_:), v6);
  sub_10005C720();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for UICollectionLayoutListConfiguration.HeaderMode.none(_:), v2);
  sub_10005C730();
  sub_10005C740();
  sub_10002DBB8(0, &qword_10007D150);
  uint64_t v14 = (void *)sub_10005CA90();
  id result = [v1 view];
  if (result)
  {
    uint64_t v16 = result;
    [result bounds];
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;

    id v25 = [objc_allocWithZone((Class)UICollectionView) initWithFrame:v14 collectionViewLayout:v18];
    [v25 setCollectionViewLayout:v14];
    [v25 setTranslatesAutoresizingMaskIntoConstraints:0];

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    return v25;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100039350(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v145 = a4;
  uint64_t v135 = sub_1000131E0(&qword_10007D750);
  __chkstk_darwin(v135);
  uint64_t v137 = (uint64_t)&v128 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v133 = (uint64_t)&v128 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v138 = (uint64_t)&v128 - v11;
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v129 = (uint64_t)&v128 - v13;
  uint64_t v14 = __chkstk_darwin(v12);
  uint64_t v136 = (uint64_t)&v128 - v15;
  uint64_t v16 = __chkstk_darwin(v14);
  id v141 = (char *)&v128 - v17;
  uint64_t v18 = __chkstk_darwin(v16);
  double v20 = (char *)&v128 - v19;
  __chkstk_darwin(v18);
  double v22 = (char *)&v128 - v21;
  uint64_t v23 = sub_1000131E0((uint64_t *)&unk_10007D850);
  __chkstk_darwin(v23 - 8);
  id v25 = (char *)&v128 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_10005C390();
  uint64_t v27 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  uint64_t v29 = (char *)&v128 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_10005C660();
  uint64_t v139 = *(void *)(v30 - 8);
  uint64_t v140 = v30;
  __chkstk_darwin(v30);
  unint64_t v32 = (char *)&v128 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v142 = a1;
  sub_10005CA80();
  uint64_t v147 = sub_1000190F4();
  uint64_t v143 = a3;
  uint64_t v144 = v33;
  sub_10003C0EC(a3, (uint64_t)v22, type metadata accessor for CRLSELibraryViewModel.Item);
  *(void *)&long long v146 = v7;
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 3)
  {
    uint64_t v37 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
    swift_bridgeObjectRelease();
    sub_10003C51C((uint64_t)&v22[*(int *)(v37 + 64)], (uint64_t)v25, (uint64_t *)&unk_10007D850);
    uint64_t v38 = sub_10005C3D0();
    (*(void (**)(char *, uint64_t))(*(void *)(v38 - 8) + 8))(v22, v38);
  }
  else
  {
    if (EnumCaseMultiPayload == 2)
    {
      uint64_t v35 = sub_1000131E0(&qword_10007D1D0);
      swift_bridgeObjectRelease();
      sub_10003C51C((uint64_t)&v22[*(int *)(v35 + 80)], (uint64_t)v25, (uint64_t *)&unk_10007D850);
      uint64_t v36 = type metadata accessor for CRLSEBoardIdentifier;
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v27 + 56))(v25, 1, 1, v26);
      uint64_t v36 = type metadata accessor for CRLSELibraryViewModel.Item;
    }
    sub_10003C154((uint64_t)v22, v36);
  }
  uint64_t v39 = v32;
  uint64_t v40 = (uint64_t)v141;
  id v41 = v145;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v27 + 48))(v25, 1, v26) == 1)
  {
    sub_10001E8C0((uint64_t)v25, (uint64_t *)&unk_10007D850);
    uint64_t v42 = 0;
    id v141 = 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v27 + 32))(v29, v25, v26);
    sub_10003AA1C();
    id v41 = v145;
    uint64_t v42 = v43;
    id v141 = v44;
    (*(void (**)(char *, uint64_t))(v27 + 8))(v29, v26);
  }
  id v45 = v142;
  id v46 = [v41 traitCollection];
  id v47 = [v46 preferredContentSizeCategory];

  int v131 = sub_10005CA60();
  swift_bridgeObjectRetain();
  sub_10005C640();
  sub_10005C5A0();
  uint64_t v48 = (void (*)(uint64_t *, void))sub_10005C5F0();
  sub_10005C5C0();
  v48(v148, 0);
  int64_t v49 = (void (*)(uint64_t *, void))sub_10005C5F0();
  sub_10005C5B0();
  v49(v148, 0);
  uint64_t v50 = self;
  id v51 = [v50 secondaryLabelColor];
  uint64_t v52 = (void (*)(uint64_t *, void))sub_10005C630();
  sub_10005C5E0();
  v52(v148, 0);
  sub_1000131E0((uint64_t *)&unk_10007D110);
  uint64_t v53 = swift_allocObject();
  *(_OWORD *)(v53 + 16) = xmmword_1000622D0;
  *(void *)(v53 + 32) = [v50 whiteColor];
  uint64_t v54 = v143;
  sub_10003C0EC(v143, (uint64_t)v20, type metadata accessor for CRLSELibraryViewModel.Item);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    id v55 = sub_100019A18(*v20);
  }
  else
  {
    sub_10003C154((uint64_t)v20, type metadata accessor for CRLSELibraryViewModel.Item);
    id v55 = [v45 tintColor];
    if (!v55)
    {
      swift_bridgeObjectRelease();
      __break(1u);
      JUMPOUT(0x10003A57CLL);
    }
  }
  *(void *)(v53 + 40) = v55;
  v148[0] = v53;
  sub_10005C910();
  sub_10002DBB8(0, &qword_10007D758);
  Class isa = sub_10005C8F0().super.isa;
  swift_bridgeObjectRelease();
  char v57 = self;
  id v58 = [v57 configurationWithPaletteColors:isa];

  id v134 = [v57 configurationWithTextStyle:UIFontTextStyleTitle1 scale:-1];
  id v145 = [v134 configurationByApplyingConfiguration:v58];
  sub_10003C0EC(v54, v40, type metadata accessor for CRLSELibraryViewModel.Item);
  unsigned int v59 = swift_getEnumCaseMultiPayload();
  id v130 = v50;
  if (v59 < 2) {
    goto LABEL_17;
  }
  if (v59 != 2)
  {
    uint64_t v62 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
    swift_bridgeObjectRelease();
    sub_10001E8C0(v40 + *(int *)(v62 + 64), (uint64_t *)&unk_10007D850);
    uint64_t v63 = sub_10005C3D0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v63 - 8) + 8))(v40, v63);
LABEL_17:
    int v61 = 0;
    goto LABEL_18;
  }
  uint64_t v60 = sub_1000131E0(&qword_10007D1D0);
  swift_bridgeObjectRelease();
  int v61 = *(unsigned __int8 *)(v40 + *(int *)(v60 + 64));
  sub_10001E8C0(v40 + *(int *)(v60 + 80), (uint64_t *)&unk_10007D850);
  sub_10003C154(v40, type metadata accessor for CRLSEBoardIdentifier);
LABEL_18:
  id v64 = v45;
  uint64_t v65 = *(int *)(v135 + 48);
  uint64_t v66 = v137;
  sub_10003C0EC(v54, v137, type metadata accessor for CRLSELibraryViewModel.Item);
  *(unsigned char *)(v66 + v65) = v61;
  int v67 = swift_getEnumCaseMultiPayload();
  uint64_t v68 = v136;
  uint64_t v132 = v42;
  id v142 = v58;
  switch(v67)
  {
    case 1:
      sub_10001978C();
      sub_10005C650();
      id v80 = v145;
      id v81 = (void (*)(uint64_t *, void))sub_10005C620();
      sub_10005C600();
      v81(v148, 0);
      goto LABEL_24;
    case 2:
      sub_10003C0EC(v66, v136, type metadata accessor for CRLSELibraryViewModel.Item);
      uint64_t v69 = sub_1000131E0(&qword_10007D1D0);
      swift_bridgeObjectRelease();
      uint64_t v70 = *(int *)(v69 + 80);
      uint64_t v71 = v68 + v70;
      if (v61)
      {
        uint64_t v72 = self;
        NSString v73 = sub_10005C7D0();
        id v74 = [v72 systemImageNamed:v73];

        sub_10005C650();
        id v75 = [v130 labelColor];
        uint64_t v76 = (void (*)(uint64_t *, void))sub_10005C620();
        sub_10005C610();
        v76(v148, 0);
        sub_10001E8C0(v71, (uint64_t *)&unk_10007D850);
        sub_10003C154(v68, type metadata accessor for CRLSEBoardIdentifier);
LABEL_24:
        sub_10003C154(v66, type metadata accessor for CRLSELibraryViewModel.Item);
LABEL_25:
        uint64_t v82 = v144;
        uint64_t v83 = v64;
      }
      else
      {
        sub_10001E8C0(v68 + v70, (uint64_t *)&unk_10007D850);
        sub_10003C154(v68, type metadata accessor for CRLSEBoardIdentifier);
LABEL_27:
        sub_10003C154(v66, type metadata accessor for CRLSELibraryViewModel.Item);
        uint64_t v83 = v64;
        if (v131)
        {
          id v84 = self;
          NSString v85 = sub_10005C7D0();
          id v86 = [v84 systemImageNamed:v85];

          sub_10005C650();
          id v87 = [v130 clearColor];
          unint64_t v88 = (void (*)(uint64_t *, void))sub_10005C620();
          sub_10005C610();
          v88(v148, 0);
        }
        else
        {
          sub_10005C650();
        }
        uint64_t v82 = v144;
      }
      sub_1000131E0((uint64_t *)&unk_10007D760);
      uint64_t v89 = swift_allocObject();
      long long v146 = xmmword_1000622C0;
      *(_OWORD *)(v89 + 16) = xmmword_1000622C0;
      *(void *)(v89 + 32) = v147;
      *(void *)(v89 + 40) = v82;
      uint64_t v90 = v138;
      sub_10003C0EC(v54, v138, type metadata accessor for CRLSELibraryViewModel.Item);
      int v91 = swift_getEnumCaseMultiPayload();
      if (v91 == 3)
      {
        uint64_t v93 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        sub_10001E8C0(v90 + *(int *)(v93 + 64), (uint64_t *)&unk_10007D850);
        uint64_t v94 = sub_10005C3D0();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v94 - 8) + 8))(v90, v94);
      }
      else
      {
        if (v91 != 2)
        {
          swift_bridgeObjectRetain();
          sub_10003C154(v90, type metadata accessor for CRLSELibraryViewModel.Item);
          swift_bridgeObjectRelease();
          goto LABEL_47;
        }
        uint64_t v92 = sub_1000131E0(&qword_10007D1D0);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();
        sub_10001E8C0(v90 + *(int *)(v92 + 80), (uint64_t *)&unk_10007D850);
        sub_10003C154(v90, type metadata accessor for CRLSEBoardIdentifier);
      }
      uint64_t v95 = v133;
      sub_10003C0EC(v54, v133, type metadata accessor for CRLSELibraryViewModel.Item);
      unsigned int v96 = swift_getEnumCaseMultiPayload();
      if (v96 >= 2)
      {
        if (v96 == 2)
        {
          uint64_t v97 = sub_1000131E0(&qword_10007D1D0);
          swift_bridgeObjectRelease();
          uint64_t v98 = v95;
          char v99 = *(unsigned char *)(v95 + *(int *)(v97 + 64));
          sub_10001E8C0(v98 + *(int *)(v97 + 80), (uint64_t *)&unk_10007D850);
          sub_10003C154(v98, type metadata accessor for CRLSEBoardIdentifier);
          if (v99)
          {
            type metadata accessor for CRLSEExtensionContextManager();
            uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
            id v101 = [self bundleForClass:ObjCClassFromMetadata];
            NSString v102 = sub_10005C7D0();
            NSString v103 = sub_10005C7D0();
            NSString v104 = sub_10005C7D0();
            id v105 = [v101 localizedStringForKey:v102 value:v103 table:v104];

            uint64_t v106 = sub_10005C810();
            uint64_t v108 = v107;

            unint64_t v110 = *(void *)(v89 + 16);
            unint64_t v109 = *(void *)(v89 + 24);
            if (v110 >= v109 >> 1) {
              uint64_t v89 = (uint64_t)sub_100053658((char *)(v109 > 1), v110 + 1, 1, (char *)v89);
            }
            *(void *)(v89 + 16) = v110 + 1;
            uint64_t v111 = v89 + 16 * v110;
            *(void *)(v111 + 32) = v106;
            *(void *)(v111 + 40) = v108;
          }
        }
        else
        {
          uint64_t v112 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
          swift_bridgeObjectRelease();
          sub_10001E8C0(v95 + *(int *)(v112 + 64), (uint64_t *)&unk_10007D850);
          uint64_t v113 = sub_10005C3D0();
          (*(void (**)(uint64_t, uint64_t))(*(void *)(v113 - 8) + 8))(v95, v113);
        }
      }
      id v114 = v141;
      if (v141)
      {
        unint64_t v116 = *(void *)(v89 + 16);
        unint64_t v115 = *(void *)(v89 + 24);
        if (v116 >= v115 >> 1) {
          uint64_t v89 = (uint64_t)sub_100053658((char *)(v115 > 1), v116 + 1, 1, (char *)v89);
        }
        *(void *)(v89 + 16) = v116 + 1;
        uint64_t v117 = v89 + 16 * v116;
        *(void *)(v117 + 32) = v132;
        *(void *)(v117 + 40) = v114;
      }
LABEL_47:
      v148[0] = v89;
      sub_1000131E0(&qword_10007D470);
      sub_10003475C();
      sub_10005C7B0();
      swift_bridgeObjectRelease();
      NSString v118 = sub_10005C7D0();
      swift_bridgeObjectRelease();
      [v83 setAccessibilityLabel:v118];

      UIAccessibilityTraits v119 = UIAccessibilityTraitButton;
      unint64_t v120 = (unint64_t)[v83 accessibilityTraits];
      if ((v119 & ~v120) != 0) {
        UIAccessibilityTraits v121 = v119;
      }
      else {
        UIAccessibilityTraits v121 = 0;
      }
      [v83 setAccessibilityTraits:v121 | v120];
      uint64_t v122 = swift_allocObject();
      *(_OWORD *)(v122 + 16) = v146;
      *(void *)(v122 + 32) = v147;
      *(void *)(v122 + 40) = v82;
      Class v123 = sub_10005C8F0().super.isa;
      swift_bridgeObjectRelease();
      [v83 setAccessibilityUserInputLabels:v123];

      uint64_t v124 = v140;
      v148[3] = v140;
      v148[4] = (uint64_t)&protocol witness table for UIListContentConfiguration;
      uint64_t v125 = sub_100022698(v148);
      uint64_t v126 = v139;
      (*(void (**)(uint64_t *, char *, uint64_t))(v139 + 16))(v125, v39, v124);
      sub_10005CA50();

      return (*(uint64_t (**)(char *, uint64_t))(v126 + 8))(v39, v124);
    case 3:
      uint64_t v77 = v129;
      sub_10003C0EC(v66, v129, type metadata accessor for CRLSELibraryViewModel.Item);
      uint64_t v78 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
      swift_bridgeObjectRelease();
      sub_10001E8C0(v77 + *(int *)(v78 + 64), (uint64_t *)&unk_10007D850);
      uint64_t v79 = sub_10005C3D0();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v79 - 8) + 8))(v77, v79);
      goto LABEL_27;
    default:
      sub_10005C650();
      sub_10001E8C0(v66, &qword_10007D750);
      goto LABEL_25;
  }
}

void *sub_10003A58C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v33 = a4;
  uint64_t v34 = a1;
  uint64_t v5 = sub_1000131E0((uint64_t *)&unk_10007D740);
  __chkstk_darwin(v5 - 8);
  uint64_t v30 = (char *)&v27 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10005C570();
  uint64_t v31 = *(void *)(v7 - 8);
  uint64_t v32 = v7;
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10005C530();
  uint64_t v28 = *(void *)(v10 - 8);
  uint64_t v29 = v10;
  __chkstk_darwin(v10);
  uint64_t v12 = (char *)&v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  uint64_t v14 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)&v27 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_1000131E0((uint64_t *)&unk_10007D1A0);
  __chkstk_darwin(v17 - 8);
  uint64_t v19 = (char *)&v27 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10003C0EC(a3, (uint64_t)v19, type metadata accessor for CRLSELibraryViewModel.Item);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v14 + 56))(v19, 0, 1, v13);
  sub_10002DBB8(0, &qword_10007D720);
  double v20 = (void *)sub_10005C9F0();
  sub_10001E8C0((uint64_t)v19, (uint64_t *)&unk_10007D1A0);
  sub_10003C0EC(a3, (uint64_t)v16, type metadata accessor for CRLSELibraryViewModel.Item);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    sub_1000131E0((uint64_t *)&unk_10007D180);
    sub_10005C580();
    *(_OWORD *)(swift_allocObject() + 16) = xmmword_1000622C0;
    uint64_t v22 = v28;
    uint64_t v21 = v29;
    (*(void (**)(char *, void, uint64_t))(v28 + 104))(v12, enum case for UICellAccessory.DisplayedState.always(_:), v29);
    uint64_t v23 = sub_10005C540();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v30, 1, 1, v23);
    id v24 = v20;
    sub_10005C560();
    sub_10005C550();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v9, v32);
    (*(void (**)(char *, uint64_t))(v22 + 8))(v12, v21);
    sub_10005CA70();
  }
  else
  {
    id v25 = v20;
    sub_10005CA70();

    sub_10003C154((uint64_t)v16, type metadata accessor for CRLSELibraryViewModel.Item);
  }
  return v20;
}

uint64_t sub_10003AA1C()
{
  uint64_t v0 = sub_10005C410();
  uint64_t v51 = *(void *)(v0 - 8);
  uint64_t v52 = v0;
  __chkstk_darwin(v0);
  int64_t v49 = (char *)&v46 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v2 = sub_1000131E0((uint64_t *)&unk_10007D850);
  __chkstk_darwin(v2 - 8);
  uint64_t v50 = (char *)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = sub_10005C390();
  uint64_t v56 = *(void *)(v53 - 8);
  uint64_t v4 = __chkstk_darwin(v53);
  id v47 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v48 = (char *)&v46 - v6;
  uint64_t v7 = sub_10005C420();
  uint64_t v54 = *(void *)(v7 - 8);
  uint64_t v55 = v7;
  __chkstk_darwin(v7);
  char v57 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10005C400();
  id v9 = sub_100037948();
  [v9 setDoesRelativeDateFormatting:1];

  id v10 = sub_100037948();
  Class isa = sub_10005C350().super.isa;
  id v12 = [v10 stringFromDate:isa];

  uint64_t v13 = sub_10005C810();
  uint64_t v15 = v14;

  id v16 = sub_100037948();
  [v16 setDoesRelativeDateFormatting:0];

  id v17 = sub_100037948();
  Class v18 = sub_10005C350().super.isa;
  id v19 = [v17 stringFromDate:v18];

  uint64_t v20 = sub_10005C810();
  uint64_t v22 = v21;

  if (v13 == v20 && v15 == v22 || (sub_10005CDF0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    uint64_t v24 = v51;
    uint64_t v23 = v52;
    id v25 = v49;
    (*(void (**)(char *, void, uint64_t))(v51 + 104))(v49, enum case for Calendar.Component.weekOfYear(_:), v52);
    uint64_t v26 = v50;
    sub_10005C3F0();
    uint64_t v27 = v25;
    uint64_t v28 = (uint64_t)v26;
    (*(void (**)(char *, uint64_t))(v24 + 8))(v27, v23);
    uint64_t v29 = v56;
    uint64_t v30 = v53;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v56 + 48))(v28, 1, v53) == 1)
    {
      sub_10001E8C0(v28, (uint64_t *)&unk_10007D850);
      uint64_t v32 = v54;
      uint64_t v31 = v55;
LABEL_11:
      id v42 = sub_100037958();
      Class v43 = sub_10005C350().super.isa;
      id v44 = [v42 stringFromDate:v43];

      sub_10005C810();
      (*(void (**)(char *, uint64_t))(v32 + 8))(v57, v31);
      return v20;
    }
    uint64_t v33 = v48;
    (*(void (**)(char *, uint64_t, uint64_t))(v29 + 32))(v48, v28, v30);
    uint64_t v34 = v47;
    sub_10005C360();
    uint64_t v35 = sub_10005C370();
    uint64_t v36 = *(void (**)(char *, uint64_t))(v29 + 8);
    v36(v34, v30);
    uint64_t v37 = v29 + 8;
    uint64_t v32 = v54;
    uint64_t v31 = v55;
    if (v35 != 1)
    {
      v36(v33, v30);
      goto LABEL_11;
    }
    uint64_t v56 = v37;
    swift_bridgeObjectRelease();
    uint64_t v38 = v36;
    id v39 = sub_100037A0C();
    Class v40 = sub_10005C350().super.isa;
    id v41 = [v39 stringFromDate:v40];

    uint64_t v13 = sub_10005C810();
    v38(v33, v30);
    (*(void (**)(char *, uint64_t))(v32 + 8))(v57, v31);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v54 + 8))(v57, v55);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v13;
}

uint64_t sub_10003AFDC(void *a1)
{
  uint64_t v2 = sub_10005C3D0();
  uint64_t v96 = *(void *)(v2 - 8);
  uint64_t v97 = v2;
  __chkstk_darwin(v2);
  uint64_t v92 = (char *)&v85 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v95 = type metadata accessor for CRLSEBoard(0);
  uint64_t v4 = __chkstk_darwin(v95);
  uint64_t v89 = (char *)&v85 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v90 = (uint64_t)&v85 - v6;
  uint64_t v7 = type metadata accessor for CRLSEBoardIdentifier(0);
  uint64_t v93 = *(void *)(v7 - 8);
  uint64_t v94 = v7;
  __chkstk_darwin(v7);
  char v99 = (char *)&v85 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for CRLSELibraryViewModeItemNode(0);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v87 = v9;
  uint64_t v88 = v10;
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v85 = (uint64_t)&v85 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v85 - v13;
  uint64_t v15 = sub_1000131E0((uint64_t *)&unk_10007D6F0);
  __chkstk_darwin(v15 - 8);
  uint64_t v86 = (uint64_t)&v85 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_1000131E0((uint64_t *)&unk_10007D1A0);
  __chkstk_darwin(v17 - 8);
  id v19 = (char *)&v85 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v91 = (uint64_t)&v85 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __chkstk_darwin(v22);
  uint64_t v98 = (uint64_t)&v85 - v25;
  uint64_t v26 = __chkstk_darwin(v24);
  uint64_t v28 = (char *)&v85 - v27;
  uint64_t v29 = __chkstk_darwin(v26);
  uint64_t v31 = (char *)&v85 - v30;
  __chkstk_darwin(v29);
  uint64_t v33 = (char *)&v85 - v32;
  Class isa = sub_10005C430().super.isa;
  uint64_t v35 = a1;
  uint64_t v36 = v100;
  [v35 deselectItemAtIndexPath:isa animated:0];

  uint64_t v37 = *(void **)&v36[OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController_dataSource];
  if (!v37)
  {
    __break(1u);
    JUMPOUT(0x10003BAFCLL);
  }
  id v38 = v37;
  sub_10005C6E0();

  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v19, 1, v20) != 1)
  {
    uint64_t v40 = (uint64_t)v33;
    sub_10003C1B4((uint64_t)v19, (uint64_t)v33, type metadata accessor for CRLSELibraryViewModel.Item);
    uint64_t v41 = (uint64_t)v31;
    sub_10003C0EC((uint64_t)v33, (uint64_t)v31, type metadata accessor for CRLSELibraryViewModel.Item);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 1u:
        sub_10003C0EC((uint64_t)v31, (uint64_t)v28, type metadata accessor for CRLSELibraryViewModel.Item);
        if (*v28 == 4) {
          goto LABEL_6;
        }
        uint64_t v71 = v87;
        uint64_t v72 = *(void *)&v36[OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController_representedObject
                            + *(int *)(v87 + 20)];
        uint64_t v73 = *(void *)(v72 + 16);
        if (v73)
        {
          uint64_t v74 = v72 + ((*(unsigned __int8 *)(v88 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v88 + 80));
          uint64_t v75 = *(void *)(v88 + 72);
          swift_bridgeObjectRetain();
          while (1)
          {
            sub_10003C0EC(v74, (uint64_t)v14, type metadata accessor for CRLSELibraryViewModeItemNode);
            if (sub_10001D61C((uint64_t)v14, v40)) {
              break;
            }
            sub_10003C154((uint64_t)v14, type metadata accessor for CRLSELibraryViewModeItemNode);
            v74 += v75;
            if (!--v73) {
              goto LABEL_24;
            }
          }
          uint64_t v78 = (uint64_t)v14;
          uint64_t v77 = v86;
          sub_10003C1B4(v78, v86, type metadata accessor for CRLSELibraryViewModeItemNode);
          uint64_t v76 = 0;
        }
        else
        {
          swift_bridgeObjectRetain();
LABEL_24:
          uint64_t v76 = 1;
          uint64_t v77 = v86;
        }
        uint64_t v79 = v88;
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v88 + 56))(v77, v76, 1, v71);
        swift_bridgeObjectRelease();
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v79 + 48))(v77, 1, v71) == 1)
        {
          sub_10001E8C0(v77, (uint64_t *)&unk_10007D6F0);
          id v80 = (char *)[v36 navigationController];
          if (!v80) {
            goto LABEL_33;
          }
          id v81 = v80;
          Class v43 = (char *)[v80 popToRootViewControllerAnimated:1];
        }
        else
        {
          uint64_t v82 = v85;
          sub_10003C1B4(v77, v85, type metadata accessor for CRLSELibraryViewModeItemNode);
          Class v43 = (char *)sub_10003C21C(v82);
          uint64_t v83 = &v36[OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController_delegate];
          swift_unknownObjectWeakLoadStrong();
          *(void *)&v43[OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController_delegate + 8] = *((void *)v83 + 1);
          swift_unknownObjectWeakAssign();
          swift_unknownObjectRelease();
          id v84 = (char *)[v36 navigationController];
          if (!v84) {
            goto LABEL_32;
          }
          id v81 = v84;
          [v84 pushViewController:v43 animated:1];
        }

        Class v43 = v81;
        goto LABEL_32;
      case 2u:
        uint64_t v44 = v98;
        sub_10003C0EC((uint64_t)v31, v98, type metadata accessor for CRLSELibraryViewModel.Item);
        uint64_t v45 = sub_1000131E0(&qword_10007D1D0);
        uint64_t v46 = (uint64_t *)(v44 + *(int *)(v45 + 48));
        uint64_t v47 = *v46;
        uint64_t v48 = v46[1];
        uint64_t v49 = v44;
        uint64_t v50 = (uint64_t)v99;
        sub_10003C1B4(v49, (uint64_t)v99, type metadata accessor for CRLSEBoardIdentifier);
        uint64_t v51 = v90;
        sub_10003C0EC(v50, v90, type metadata accessor for CRLSEBoardIdentifier);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v93 + 56))(v51, 0, 1, v94);
        uint64_t v52 = v95;
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v96 + 56))(v51 + *(int *)(v95 + 24), 1, 1, v97);
        uint64_t v53 = (void *)(v51 + *(int *)(v52 + 20));
        *uint64_t v53 = v47;
        v53[1] = v48;
        if (swift_unknownObjectWeakLoadStrong())
        {
          sub_10002BA10(v51);
          swift_unknownObjectRelease();
        }
        id v54 = [v36 navigationController];
        if (v54)
        {
          uint64_t v55 = v54;
        }
        uint64_t v56 = v98 + *(int *)(v45 + 80);
        sub_10003C154(v51, type metadata accessor for CRLSEBoard);
        sub_10003C154((uint64_t)v99, type metadata accessor for CRLSEBoardIdentifier);
        sub_10003C154(v40, type metadata accessor for CRLSELibraryViewModel.Item);
        sub_10001E8C0(v56, (uint64_t *)&unk_10007D850);
        return sub_10003C154(v41, type metadata accessor for CRLSELibraryViewModel.Item);
      case 3u:
        char v99 = v31;
        uint64_t v57 = v91;
        sub_10003C0EC((uint64_t)v31, v91, type metadata accessor for CRLSELibraryViewModel.Item);
        uint64_t v98 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
        id v58 = (uint64_t *)(v57 + *(int *)(v98 + 48));
        uint64_t v59 = *v58;
        uint64_t v60 = v58[1];
        uint64_t v62 = v96;
        uint64_t v61 = v97;
        uint64_t v63 = v92;
        (*(void (**)(char *, uint64_t, uint64_t))(v96 + 32))(v92, v57, v97);
        uint64_t v64 = (uint64_t)v89;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v93 + 56))(v89, 1, 1, v94);
        uint64_t v65 = v95;
        uint64_t v66 = v64 + *(int *)(v95 + 24);
        (*(void (**)(uint64_t, char *, uint64_t))(v62 + 16))(v66, v63, v61);
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v62 + 56))(v66, 0, 1, v61);
        int v67 = (void *)(v64 + *(int *)(v65 + 20));
        *int v67 = v59;
        v67[1] = v60;
        if (swift_unknownObjectWeakLoadStrong())
        {
          sub_10002BA10(v64);
          swift_unknownObjectRelease();
        }
        id v68 = [v36 navigationController];
        if (v68)
        {
          uint64_t v69 = v68;
        }
        uint64_t v70 = v91 + *(int *)(v98 + 64);
        sub_10003C154(v64, type metadata accessor for CRLSEBoard);
        (*(void (**)(char *, uint64_t))(v62 + 8))(v92, v61);
        sub_10003C154(v40, type metadata accessor for CRLSELibraryViewModel.Item);
        sub_10001E8C0(v70, (uint64_t *)&unk_10007D850);
        uint64_t v41 = (uint64_t)v99;
        return sub_10003C154(v41, type metadata accessor for CRLSELibraryViewModel.Item);
      default:
LABEL_6:
        id v42 = (char *)[v36 navigationController];
        if (v42)
        {
          Class v43 = v42;

LABEL_32:
        }
LABEL_33:
        sub_10003C154(v40, type metadata accessor for CRLSELibraryViewModel.Item);
        return sub_10003C154(v41, type metadata accessor for CRLSELibraryViewModel.Item);
    }
  }
  return sub_10001E8C0((uint64_t)v19, (uint64_t *)&unk_10007D1A0);
}

id sub_10003BC3C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CRLSEiOSBoardPickerViewController();
  return [super dealloc];
}

uint64_t sub_10003BD14()
{
  return type metadata accessor for CRLSEiOSBoardPickerViewController();
}

uint64_t type metadata accessor for CRLSEiOSBoardPickerViewController()
{
  uint64_t result = qword_10007D6D8;
  if (!qword_10007D6D8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10003BD68()
{
  uint64_t result = type metadata accessor for CRLSELibraryViewModeItemNode(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for CRLSEiOSBoardPickerViewController.CollectionViewSection(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *uint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)uint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)uint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *uint64_t result = 0;
      break;
    case 2:
      *(_WORD *)uint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x10003BEACLL);
    case 4:
      *(_DWORD *)uint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for CRLSEiOSBoardPickerViewController.CollectionViewSection()
{
  return &type metadata for CRLSEiOSBoardPickerViewController.CollectionViewSection;
}

unint64_t sub_10003BEE8()
{
  unint64_t result = qword_10007D6E8;
  if (!qword_10007D6E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D6E8);
  }
  return result;
}

id sub_10003BF3C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v6 = v5;
  if (!a2)
  {
    NSString v10 = 0;
    uint64_t v11 = a4[3];
    if (v11) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v16 = 0;
    goto LABEL_6;
  }
  NSString v10 = sub_10005C7D0();
  swift_bridgeObjectRelease();
  uint64_t v11 = a4[3];
  if (!v11) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v12 = sub_10001BB00(a4, v11);
  uint64_t v13 = *(void *)(v11 - 8);
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v19 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v13 + 16))(v15);
  uint64_t v16 = sub_10005CDE0();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v11);
  sub_10001BB98((uint64_t)a4);
LABEL_6:
  id v17 = [v6 initWithTitle:v10 style:a3 target:v16 action:a5];

  swift_unknownObjectRelease();
  return v17;
}

uint64_t sub_10003C0C4()
{
  return sub_1000387CC(1);
}

uint64_t sub_10003C0EC(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10003C154(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10003C1B4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

id sub_10003C21C(uint64_t a1)
{
  objc_super v2 = (objc_class *)type metadata accessor for CRLSEiOSBoardPickerViewController();
  uint64_t v3 = (char *)objc_allocWithZone(v2);
  *(void *)&v3[OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController_dataSource] = 0;
  *(void *)&v3[OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController____lazy_storage___shortDateFormatter] = 0;
  *(void *)&v3[OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController____lazy_storage___mediumDateFormatter] = 0;
  *(void *)&v3[OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController____lazy_storage___localizedDateFormatter] = 0;
  *(void *)&v3[OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  sub_10003C0EC(a1, (uint64_t)&v3[OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController_representedObject], type metadata accessor for CRLSELibraryViewModeItemNode);
  v6.receiver = v3;
  v6.super_class = v2;
  id v4 = [super initWithNibName:0 bundle:0];
  sub_10003C154(a1, type metadata accessor for CRLSELibraryViewModeItemNode);
  return v4;
}

unint64_t sub_10003C310()
{
  unint64_t result = qword_10007D708;
  if (!qword_10007D708)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D708);
  }
  return result;
}

unint64_t sub_10003C364()
{
  unint64_t result = qword_10007D710;
  if (!qword_10007D710)
  {
    type metadata accessor for CRLSELibraryViewModel.Item(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D710);
  }
  return result;
}

uint64_t sub_10003C3BC()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10003C3F4(void *a1, uint64_t a2, uint64_t a3)
{
  return sub_100039350(a1, a2, a3, *(void **)(v3 + 16));
}

uint64_t sub_10003C3FC()
{
  uint64_t v1 = sub_1000131E0(&qword_10007D718);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

void *sub_10003C490(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = *(void *)(sub_1000131E0(&qword_10007D718) - 8);
  uint64_t v8 = v3 + ((*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));

  return sub_10003A58C(a1, a2, a3, v8);
}

uint64_t sub_10003C51C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000131E0(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10003C580()
{
  swift_getObjectType();
  sub_1000131E0(&qword_10007D8D8);
  sub_10005C830();
  swift_bridgeObjectRelease();
  sub_10002DBB8(0, (unint64_t *)&qword_10007CF90);
  sub_100047434((unint64_t *)&unk_10007D8E0, (unint64_t *)&qword_10007CF90);
  id v1 = v0;
  if (sub_10005CDD0())
  {
  }
  else
  {
    swift_allocError();
    void *v2 = v0;
  }
  uint64_t v3 = (void *)sub_10005C1E0();
  swift_errorRelease();
  sub_10005CBA0(25);
  swift_bridgeObjectRelease();
  id v4 = [v3 domain];
  uint64_t v5 = sub_10005C810();
  uint64_t v7 = v6;

  v9._countAndFlagsBits = v5;
  v9._object = v7;
  sub_10005C880(v9);
  swift_bridgeObjectRelease();
  v10._countAndFlagsBits = 0x3D65646F4320;
  v10._object = (void *)0xE600000000000000;
  sub_10005C880(v10);
  [v3 code];
  v11._countAndFlagsBits = sub_10005CDC0();
  sub_10005C880(v11);

  swift_bridgeObjectRelease();
  return 0x20726F727245534ELL;
}

char *sub_10003C76C(unint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1000131E0(&qword_10007D0E8);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v30 = (uint64_t)&v28 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v28 - v7;
  if (a1 >> 62)
  {
LABEL_21:
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_10005CCA0();
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v9 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v9)
    {
LABEL_3:
      uint64_t v28 = v2;
      unint64_t v34 = a1 & 0xC000000000000001;
      uint64_t v33 = (char *)_swiftEmptyArrayStorage;
      uint64_t v10 = 4;
      unint64_t v29 = a1;
      while (1)
      {
        uint64_t v2 = v10 - 4;
        if (v34)
        {
          id v12 = (id)sub_10005CBE0();
          uint64_t v13 = v10 - 3;
          if (__OFADD__(v2, 1)) {
            goto LABEL_20;
          }
        }
        else
        {
          id v12 = *(id *)(a1 + 8 * v10);
          uint64_t v13 = v10 - 3;
          if (__OFADD__(v2, 1))
          {
LABEL_20:
            __break(1u);
            goto LABEL_21;
          }
        }
        id v14 = v12;
        id v15 = [v14 url];
        if (v15)
        {
          uint64_t v16 = v15;
          sub_10005C290();

          uint64_t v17 = sub_10005C300();
          uint64_t v18 = *(void *)(v17 - 8);
          (*(void (**)(char *, void, uint64_t, uint64_t))(v18 + 56))(v8, 0, 1, v17);
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v8, 1, v17) != 1)
          {
            uint64_t v19 = v30;
            sub_10001E85C((uint64_t)v8, v30, &qword_10007D0E8);
            uint64_t v20 = sub_10005C260();
            uint64_t v31 = v21;
            uint64_t v32 = v20;
            (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v19, v17);
            sub_10001E8C0((uint64_t)v8, &qword_10007D0E8);

            uint64_t v22 = v33;
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
              uint64_t v22 = sub_100053658(0, *((void *)v22 + 2) + 1, 1, v22);
            }
            unint64_t v24 = *((void *)v22 + 2);
            unint64_t v23 = *((void *)v22 + 3);
            if (v24 >= v23 >> 1) {
              uint64_t v22 = sub_100053658((char *)(v23 > 1), v24 + 1, 1, v22);
            }
            *((void *)v22 + 2) = v24 + 1;
            uint64_t v33 = v22;
            uint64_t v25 = &v22[16 * v24];
            uint64_t v26 = v31;
            *((void *)v25 + 4) = v32;
            *((void *)v25 + 5) = v26;
            a1 = v29;
            goto LABEL_6;
          }
        }
        else
        {
          uint64_t v11 = sub_10005C300();
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
        }
        sub_10001E8C0((uint64_t)v8, &qword_10007D0E8);

LABEL_6:
        ++v10;
        if (v13 == v9)
        {
          swift_bridgeObjectRelease();
          return v33;
        }
      }
    }
  }
  swift_bridgeObjectRelease();
  return (char *)_swiftEmptyArrayStorage;
}

void *sub_10003CACC(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_10005CCA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  unint64_t result = _swiftEmptyArrayStorage;
  if (v2)
  {
    unint64_t result = (void *)sub_10005CC40();
    if (v2 < 0)
    {
      __break(1u);
    }
    else
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        uint64_t v4 = 0;
        do
        {
          uint64_t v5 = v4 + 1;
          uint64_t v10 = (void *)sub_10005CBE0();
          sub_10002DBB8(0, &qword_10007D120);
          id v6 = v10;
          sub_1000131E0((uint64_t *)&unk_10007D960);
          swift_dynamicCast();
          swift_unknownObjectRelease();
          sub_10005CC20();
          sub_10005CC50();
          sub_10005CC60();
          sub_10005CC30();
          uint64_t v4 = v5;
        }
        while (v2 != v5);
      }
      else
      {
        uint64_t v7 = (void **)(a1 + 32);
        sub_10002DBB8(0, &qword_10007D120);
        do
        {
          uint64_t v8 = *v7++;
          id v9 = v8;
          sub_1000131E0((uint64_t *)&unk_10007D960);
          swift_dynamicCast();

          sub_10005CC20();
          sub_10005CC50();
          sub_10005CC60();
          sub_10005CC30();
          --v2;
        }
        while (v2);
      }
      return _swiftEmptyArrayStorage;
    }
  }
  return result;
}

char *sub_10003CCDC(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_10005CCA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  uint64_t v3 = _swiftEmptyArrayStorage;
  if (!v2) {
    return (char *)v3;
  }
  uint64_t v13 = _swiftEmptyArrayStorage;
  unint64_t result = sub_100045524(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        sub_10005CBE0();
        sub_10002DBB8(0, &qword_10007D948);
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_100045524(0, v3[2] + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v7 = v3[2];
        unint64_t v6 = v3[3];
        if (v7 >= v6 >> 1)
        {
          sub_100045524((char *)(v6 > 1), v7 + 1, 1);
          uint64_t v3 = v13;
        }
        v3[2] = v7 + 1;
        sub_1000493EC(v12, &v3[4 * v7 + 4]);
      }
    }
    else
    {
      uint64_t v8 = (id *)(a1 + 32);
      sub_10002DBB8(0, &qword_10007D948);
      do
      {
        id v9 = *v8;
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_100045524(0, v3[2] + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v11 = v3[2];
        unint64_t v10 = v3[3];
        if (v11 >= v10 >> 1)
        {
          sub_100045524((char *)(v10 > 1), v11 + 1, 1);
          uint64_t v3 = v13;
        }
        v3[2] = v11 + 1;
        sub_1000493EC(v12, &v3[4 * v11 + 4]);
        ++v8;
        --v2;
      }
      while (v2);
    }
    return (char *)v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_10003CF40()
{
  id v0 = [self mainBundle];
  NSString v1 = sub_10005C7D0();
  NSString v2 = sub_10005C7D0();
  id v3 = [v0 localizedStringForKey:v1 value:v2 table:0];

  uint64_t v4 = sub_10005C810();
  return v4;
}

uint64_t sub_10003D044(uint64_t a1, uint64_t a2, char a3)
{
  unint64_t v6 = self;
  swift_bridgeObjectRetain();
  id v7 = [v6 mainBundle];
  if (a3)
  {
    NSString v12 = sub_10005C7D0();
    NSString v13 = sub_10005C7D0();
    id v14 = [v7 localizedStringForKey:v12 value:v13 table:0];

    sub_10005C810();
  }
  else
  {
    NSString v8 = sub_10005C7D0();
    NSString v9 = sub_10005C7D0();
    id v10 = [v7 localizedStringForKey:v8 value:v9 table:0];

    sub_10005C810();
  }
  sub_1000131E0(&qword_10007D870);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_1000622C0;
  *(void *)(v11 + 56) = &type metadata for String;
  *(void *)(v11 + 64) = sub_10002D9AC();
  *(void *)(v11 + 32) = a1;
  *(void *)(v11 + 40) = a2;
  uint64_t v15 = sub_10005C7E0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v15;
}

id sub_10003D62C()
{
  uint64_t v1 = OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager____lazy_storage___presentedItemOperationQueue;
  NSString v2 = *(void **)(v0
                + OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager____lazy_storage___presentedItemOperationQueue);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager____lazy_storage___presentedItemOperationQueue);
  }
  else
  {
    id v4 = [objc_allocWithZone((Class)NSOperationQueue) init];
    NSString v5 = sub_10005C7D0();
    [v4 setName:v5];

    [v4 setMaxConcurrentOperationCount:1];
    [v4 setQualityOfService:17];
    unint64_t v6 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    NSString v2 = 0;
  }
  id v7 = v2;
  return v3;
}

void sub_10003D74C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10005C230();
  uint64_t v37 = *(void *)(v4 - 8);
  uint64_t v38 = v4;
  __chkstk_darwin(v4);
  uint64_t v36 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10005C300();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v35 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000131E0(&qword_10007D0E8);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  NSString v12 = (char *)&v35 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v15 = (char *)&v35 - v14;
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v35 - v16;
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  uint64_t v41 = a1;
  v18((char *)&v35 - v16, a1, v6);
  id v39 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56);
  v39(v17, 0, 1, v6);
  uint64_t v40 = v2;
  uint64_t v19 = v2 + OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager_containerURL;
  swift_beginAccess();
  sub_10003701C((uint64_t)v17, v19, &qword_10007D0E8);
  swift_endAccess();
  sub_10001E85C(v19, (uint64_t)v12, &qword_10007D0E8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v12, 1, v6))
  {
    sub_10001E8C0((uint64_t)v12, &qword_10007D0E8);
    uint64_t v20 = 1;
  }
  else
  {
    uint64_t v21 = v35;
    v18(v35, (uint64_t)v12, v6);
    sub_10001E8C0((uint64_t)v12, &qword_10007D0E8);
    uint64_t v42 = 0x74726F706D49;
    unint64_t v43 = 0xE600000000000000;
    unint64_t v23 = v36;
    uint64_t v22 = v37;
    uint64_t v24 = v38;
    (*(void (**)(char *, void, uint64_t))(v37 + 104))(v36, enum case for URL.DirectoryHint.inferFromPath(_:), v38);
    sub_1000454B0();
    sub_10005C2E0();
    (*(void (**)(char *, uint64_t))(v22 + 8))(v23, v24);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v21, v6);
    uint64_t v20 = 0;
  }
  v39(v15, v20, 1, v6);
  uint64_t v25 = v40;
  uint64_t v26 = v40 + OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager_importDirectoryURL;
  swift_beginAccess();
  sub_10003701C((uint64_t)v15, v26, &qword_10007D0E8);
  swift_endAccess();
  sub_10001E85C(v26, (uint64_t)v17, &qword_10007D0E8);
  uint64_t v27 = v25 + OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager_presentedItemURL;
  swift_beginAccess();
  sub_10003701C((uint64_t)v17, v27, &qword_10007D0E8);
  swift_endAccess();
  if (qword_10007C6D8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v28 = (void *)static OS_os_log.crlSharingExtension;
  sub_1000131E0(&qword_10007D870);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000622C0;
  id v30 = v28;
  uint64_t v31 = sub_10005C220();
  uint64_t v33 = v32;
  *(void *)(inited + 56) = &type metadata for String;
  *(void *)(inited + 64) = sub_10002D9AC();
  *(void *)(inited + 32) = v31;
  *(void *)(inited + 40) = v33;
  uint64_t v34 = sub_10005C9B0();
  sub_100050FE0((uint64_t)v30, (uint64_t)&_mh_execute_header, v34, (uint64_t)"Container URL: %@", 17, 2, inited);
  swift_setDeallocating();
  sub_1000131E0(&qword_10007D108);
  swift_arrayDestroy();
}

uint64_t sub_10003DC68(uint64_t a1)
{
  v2[45] = a1;
  v2[46] = v1;
  sub_1000131E0(&qword_10007D0E8);
  v2[47] = swift_task_alloc();
  uint64_t v3 = sub_10005C300();
  v2[48] = v3;
  v2[49] = *(void *)(v3 - 8);
  v2[50] = swift_task_alloc();
  uint64_t v4 = sub_10005C510();
  v2[51] = v4;
  v2[52] = *(void *)(v4 - 8);
  v2[53] = swift_task_alloc();
  uint64_t v5 = sub_10005C0B0();
  v2[54] = v5;
  v2[55] = *(void *)(v5 - 8);
  v2[56] = swift_task_alloc();
  return _swift_task_switch(sub_10003DE10, 0, 0);
}

uint64_t sub_10003DE10()
{
  v0[44] = _swiftEmptyArrayStorage;
  id v1 = [objc_allocWithZone((Class)CRLSEImportItemFactory) init];
  v0[57] = v1;
  id v2 = [self mainBundle];
  NSString v3 = sub_10005C7D0();
  NSString v4 = sub_10005C7D0();
  id v5 = [v2 localizedStringForKey:v3 value:v4 table:0];

  sub_10005C810();
  NSString v6 = sub_10005C7D0();
  swift_bridgeObjectRelease();
  [v1 setDefaultImageFileName:v6];

  if (qword_10007C6D8 != -1) {
LABEL_50:
  }
    swift_once();
  uint64_t v7 = (void *)v0[45];
  swift_beginAccess();
  uint64_t v8 = (void *)static OS_os_log.crlSharingExtension;
  v0[58] = sub_1000131E0(&qword_10007D870);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1000622C0;
  id v10 = v8;
  id v11 = [v7 inputItems];
  uint64_t v12 = sub_10005C900();

  uint64_t v13 = *(void *)(v12 + 16);
  swift_bridgeObjectRelease();
  *(void *)(inited + 56) = &type metadata for Int;
  *(void *)(inited + 64) = &protocol witness table for Int;
  *(void *)(inited + 32) = v13;
  uint64_t v14 = sub_10005C9B0();
  sub_100050FE0((uint64_t)v10, (uint64_t)&_mh_execute_header, v14, (uint64_t)"Context Items: %d", 17, 2, inited);
  swift_setDeallocating();
  v0[59] = sub_1000131E0(&qword_10007D108);
  swift_arrayDestroy();

  id v15 = [v7 inputItems];
  uint64_t v16 = sub_10005C900();
  v0[60] = v16;

  uint64_t v17 = *(void *)(v16 + 16);
  v0[61] = v17;
  if (v17)
  {
    unint64_t v18 = 0;
    uint64_t v19 = v0 + 44;
    while (1)
    {
      v0[62] = v18;
      uint64_t v20 = v0[60];
      if (v18 >= *(void *)(v20 + 16))
      {
        __break(1u);
        goto LABEL_49;
      }
      sub_10002DFAC(v20 + 32 * v18 + 32, (uint64_t)(v0 + 33));
      sub_10002DBB8(0, &qword_10007D948);
      if (swift_dynamicCast()) {
        break;
      }
      unint64_t v18 = v0[62] + 1;
      if (v18 == v0[61])
      {
        swift_bridgeObjectRelease();
        uint64_t v21 = (void *)v0[44];
        goto LABEL_9;
      }
    }
    uint64_t v26 = (void *)v0[43];
    v0[63] = v26;
    id v27 = [v26 attachments];
    if (v27)
    {
      uint64_t v28 = v27;
      sub_10002DBB8(0, (unint64_t *)&unk_10007D950);
      unint64_t v29 = sub_10005C900();
    }
    else
    {
      unint64_t v29 = (unint64_t)_swiftEmptyArrayStorage;
    }
    id v30 = (void *)static OS_os_log.crlSharingExtension;
    uint64_t v31 = swift_initStackObject();
    *(_OWORD *)(v31 + 16) = xmmword_1000622C0;
    unint64_t v32 = v29 >> 62;
    unint64_t v83 = v29;
    if (v29 >> 62)
    {
      id v78 = v30;
      swift_bridgeObjectRetain();
      uint64_t v19 = v0 + 44;
      uint64_t v33 = sub_10005CCA0();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v33 = *(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10);
      id v34 = v30;
    }
    *(void *)(v31 + 56) = &type metadata for Int;
    *(void *)(v31 + 64) = &protocol witness table for Int;
    *(void *)(v31 + 32) = v33;
    uint64_t v35 = sub_10005C9B0();
    sub_100050FE0((uint64_t)v30, (uint64_t)&_mh_execute_header, v35, (uint64_t)"Attachment Count: %d", 20, 2, v31);
    swift_setDeallocating();
    swift_arrayDestroy();

    id v36 = [v26 attributedContentText];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v79 = v33;
      id v81 = v19;
      uint64_t v38 = v0[55];
      uint64_t v39 = v0[56];
      uint64_t v40 = v0[54];
      id v41 = [v36 string];
      uint64_t v42 = sub_10005C810();
      uint64_t v44 = v43;

      v0[40] = v42;
      v0[41] = v44;
      sub_10005C090();
      sub_1000454B0();
      uint64_t v45 = sub_10005CAE0();
      unint64_t v47 = v46;
      (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v39, v40);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v48 = HIBYTE(v47) & 0xF;
      if ((v47 & 0x2000000000000000) == 0) {
        uint64_t v48 = v45 & 0xFFFFFFFFFFFFLL;
      }
      if (v48)
      {
        unint64_t v49 = v83;
        id v80 = v37;
        if (!v32)
        {
          uint64_t v50 = *(void *)((v83 & 0xFFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRetain();
          if (!v50) {
            goto LABEL_34;
          }
LABEL_27:
          uint64_t v52 = 0;
          while (1)
          {
            id v53 = (v83 & 0xC000000000000001) != 0 ? (id)sub_10005CBE0() : *(id *)(v49 + 8 * v52 + 32);
            id v54 = v53;
            uint64_t v55 = v52 + 1;
            if (__OFADD__(v52, 1)) {
              break;
            }
            uint64_t v57 = v0[52];
            uint64_t v56 = v0[53];
            uint64_t v58 = v0[51];
            sub_10005C4E0();
            sub_10005C470();
            (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v56, v58);
            NSString v59 = sub_10005C7D0();
            swift_bridgeObjectRelease();
            LODWORD(v58) = [v54 hasItemConformingToTypeIdentifier:v59];

            if (v58)
            {
              swift_bridgeObjectRelease();
              if (v79 == 1)
              {
                unsigned int v82 = 1;
                goto LABEL_35;
              }
              uint64_t v51 = 0;
              uint64_t v37 = v80;
              goto LABEL_41;
            }
            ++v52;
            unint64_t v49 = v83;
            if (v55 == v50) {
              goto LABEL_34;
            }
          }
LABEL_49:
          __break(1u);
          goto LABEL_50;
        }
        swift_bridgeObjectRetain();
        uint64_t v50 = sub_10005CCA0();
        if (v50) {
          goto LABEL_27;
        }
LABEL_34:
        swift_bridgeObjectRelease();
        unsigned int v82 = 0;
LABEL_35:
        uint64_t v60 = v0[48];
        uint64_t v61 = v0[49];
        uint64_t v62 = v0[47];
        id v63 = [objc_allocWithZone((Class)CRLSEImportableItem) init];
        id v64 = [v80 string];
        uint64_t v65 = sub_10005C810();
        uint64_t v67 = v66;

        sub_10003F978(v65, v67, v62);
        swift_bridgeObjectRelease();
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v61 + 48))(v62, 1, v60) == 1)
        {
          sub_10001E8C0(v0[47], &qword_10007D0E8);
          [v63 setAttributedText:v80];
        }
        else
        {
          uint64_t v69 = v0[49];
          uint64_t v68 = v0[50];
          uint64_t v70 = v0[48];
          (*(void (**)(uint64_t, void, uint64_t))(v69 + 32))(v68, v0[47], v70);
          sub_10005C270(v71);
          uint64_t v73 = v72;
          [v63 setUrl:v72];

          (*(void (**)(uint64_t, uint64_t))(v69 + 8))(v68, v70);
        }
        uint64_t v37 = v80;
        id v74 = v63;
        sub_10005C8E0();
        uint64_t v51 = v82;
        if (*(void *)(*v81 + 16) >= *(void *)(*v81 + 24) >> 1) {
          sub_10005C920();
        }
        sub_10005C940();
        sub_10005C910();
      }
      else
      {
        uint64_t v51 = 0;
      }
LABEL_41:
    }
    else
    {
      uint64_t v51 = 0;
    }
    uint64_t v75 = (void *)v0[57];
    sub_10002DBB8(0, (unint64_t *)&unk_10007D950);
    Class isa = sub_10005C8F0().super.isa;
    v0[64] = isa;
    swift_bridgeObjectRelease();
    v0[2] = v0;
    v0[7] = v0 + 42;
    v0[3] = sub_10003E7CC;
    uint64_t v77 = swift_continuation_init();
    v0[28] = _NSConcreteStackBlock;
    v0[29] = 0x40000000;
    v0[30] = sub_10003F89C;
    v0[31] = &unk_1000737D0;
    v0[32] = v77;
    [v75 createImportItems:isa skipTextAttachments:v51 completion:v0 + 28];
    return _swift_continuation_await(v0 + 2);
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v21 = _swiftEmptyArrayStorage;
LABEL_9:
    uint64_t v22 = (void *)v0[57];
    uint64_t v23 = sub_1000484A8((uint64_t)v21);
    swift_bridgeObjectRelease();

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v24 = (uint64_t (*)(uint64_t))v0[1];
    return v24(v23);
  }
}

uint64_t sub_10003E7CC()
{
  uint64_t v1 = *(void *)(*(void *)v0 + 48);
  *(void *)(*(void *)v0 + 520) = v1;
  if (v1) {
    id v2 = sub_10003F044;
  }
  else {
    id v2 = sub_10003E8DC;
  }
  return _swift_task_switch(v2, 0, 0);
}

uint64_t sub_10003E8DC()
{
  uint64_t v1 = *(void **)(v0 + 504);
  unint64_t v2 = *(void *)(v0 + 336);

  NSString v3 = sub_10003CACC(v2);
  swift_bridgeObjectRelease();
  sub_100051FF4((uint64_t)v3);

  unint64_t v4 = *(void *)(v0 + 496) + 1;
  if (v4 == *(void *)(v0 + 488))
  {
LABEL_6:
    swift_bridgeObjectRelease();
    id v11 = *(void **)(v0 + 456);
    uint64_t v12 = sub_1000484A8(*(void *)(v0 + 352));
    swift_bridgeObjectRelease();

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v13 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v13(v12);
  }
  unint64_t v5 = v0 + 264;
  uint64_t v6 = v0 + 336;
  uint64_t v7 = &qword_10007D948;
  uint64_t v8 = (void *)(v0 + 344);
  uint64_t inited = (char *)&type metadata for Any + 8;
  while (1)
  {
    *(void *)(v0 + 496) = v4;
    uint64_t v10 = *(void *)(v0 + 480);
    if (v4 >= *(void *)(v10 + 16))
    {
      __break(1u);
      goto LABEL_46;
    }
    sub_10002DFAC(v10 + 32 * v4 + 32, v0 + 264);
    sub_10002DBB8(0, &qword_10007D948);
    if (swift_dynamicCast()) {
      break;
    }
    unint64_t v4 = *(void *)(v0 + 496) + 1;
    if (v4 == *(void *)(v0 + 488)) {
      goto LABEL_6;
    }
  }
  uint64_t v7 = *(unint64_t **)(v0 + 344);
  *(void *)(v0 + 504) = v7;
  id v15 = [v7 attachments];
  if (v15)
  {
    uint64_t v16 = v15;
    sub_10002DBB8(0, (unint64_t *)&unk_10007D950);
    unint64_t v5 = sub_10005C900();
  }
  else
  {
    unint64_t v5 = (unint64_t)_swiftEmptyArrayStorage;
  }
  uint64_t v8 = (void *)static OS_os_log.crlSharingExtension;
  uint64_t inited = (char *)swift_initStackObject();
  *((_OWORD *)inited + 1) = xmmword_1000622C0;
  unint64_t v63 = v5 >> 62;
  uint64_t v60 = v0 + 352;
  if (v5 >> 62) {
    goto LABEL_47;
  }
  uint64_t v17 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  id v18 = v8;
  while (1)
  {
    uint64_t v62 = v6;
    *((void *)inited + 7) = &type metadata for Int;
    *((void *)inited + 8) = &protocol witness table for Int;
    *((void *)inited + 4) = v17;
    uint64_t v19 = sub_10005C9B0();
    sub_100050FE0((uint64_t)v8, (uint64_t)&_mh_execute_header, v19, (uint64_t)"Attachment Count: %d", 20, 2, (uint64_t)inited);
    swift_setDeallocating();
    swift_arrayDestroy();

    id v20 = [v7 attributedContentText];
    unint64_t v64 = v5;
    if (!v20)
    {
      uint64_t v31 = 0;
      goto LABEL_42;
    }
    uint64_t v59 = v17;
    uint64_t v21 = *(void *)(v0 + 440);
    uint64_t v8 = *(void **)(v0 + 448);
    uint64_t v22 = *(void *)(v0 + 432);
    id v61 = v20;
    id v23 = [v20 string];
    uint64_t v24 = sub_10005C810();
    uint64_t v26 = v25;

    *(void *)(v0 + 320) = v24;
    *(void *)(v0 + 328) = v26;
    sub_10005C090();
    sub_1000454B0();
    uint64_t v27 = sub_10005CAE0();
    unint64_t v29 = v28;
    (*(void (**)(void *, uint64_t))(v21 + 8))(v8, v22);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v30 = HIBYTE(v29) & 0xF;
    if ((v29 & 0x2000000000000000) == 0) {
      uint64_t v30 = v27 & 0xFFFFFFFFFFFFLL;
    }
    if (!v30)
    {
LABEL_40:
      uint64_t v31 = 0;
      goto LABEL_41;
    }
    if (v63) {
      break;
    }
    uint64_t v6 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v6) {
      goto LABEL_31;
    }
LABEL_23:
    uint64_t v32 = 0;
    unint64_t v63 = v5 & 0xC000000000000001;
    while (1)
    {
      uint64_t v33 = v63 ? (char *)sub_10005CBE0() : (char *)*(id *)(v5 + 8 * v32 + 32);
      uint64_t inited = v33;
      unint64_t v5 = v32 + 1;
      if (__OFADD__(v32, 1)) {
        break;
      }
      uint64_t v35 = *(void *)(v0 + 416);
      uint64_t v34 = *(void *)(v0 + 424);
      uint64_t v36 = *(void *)(v0 + 408);
      sub_10005C4E0();
      sub_10005C470();
      uint64_t v37 = *(void (**)(uint64_t, uint64_t))(v35 + 8);
      uint64_t v8 = (void *)(v35 + 8);
      v37(v34, v36);
      NSString v38 = sub_10005C7D0();
      swift_bridgeObjectRelease();
      uint64_t v7 = (unint64_t *)[inited hasItemConformingToTypeIdentifier:v38];

      if (v7)
      {
        swift_bridgeObjectRelease();
        if (v59 != 1) {
          goto LABEL_40;
        }
        uint64_t v31 = 1;
        goto LABEL_32;
      }
      ++v32;
      BOOL v39 = v5 == v6;
      unint64_t v5 = v64;
      if (v39) {
        goto LABEL_31;
      }
    }
LABEL_46:
    __break(1u);
LABEL_47:
    id v58 = v8;
    swift_bridgeObjectRetain();
    uint64_t v17 = sub_10005CCA0();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_10005CCA0();
  if (v6) {
    goto LABEL_23;
  }
LABEL_31:
  swift_bridgeObjectRelease();
  uint64_t v31 = 0;
LABEL_32:
  uint64_t v41 = *(void *)(v0 + 384);
  uint64_t v40 = *(void *)(v0 + 392);
  uint64_t v42 = *(void *)(v0 + 376);
  id v43 = [objc_allocWithZone((Class)CRLSEImportableItem) init];
  id v44 = [v61 string];
  uint64_t v45 = sub_10005C810();
  uint64_t v47 = v46;

  sub_10003F978(v45, v47, v42);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v40 + 48))(v42, 1, v41) == 1)
  {
    sub_10001E8C0(*(void *)(v0 + 376), &qword_10007D0E8);
    [v43 setAttributedText:v61];
  }
  else
  {
    uint64_t v48 = *(void *)(v0 + 392);
    uint64_t v49 = *(void *)(v0 + 400);
    uint64_t v50 = *(void *)(v0 + 384);
    (*(void (**)(uint64_t, void, uint64_t))(v48 + 32))(v49, *(void *)(v0 + 376), v50);
    sub_10005C270(v51);
    id v53 = v52;
    [v43 setUrl:v52];

    (*(void (**)(uint64_t, uint64_t))(v48 + 8))(v49, v50);
  }
  id v54 = v43;
  sub_10005C8E0();
  if (*(void *)(*(void *)v60 + 16) >= *(void *)(*(void *)v60 + 24) >> 1) {
    sub_10005C920();
  }
  sub_10005C940();
  sub_10005C910();

LABEL_41:
LABEL_42:
  uint64_t v55 = *(void **)(v0 + 456);
  sub_10002DBB8(0, (unint64_t *)&unk_10007D950);
  Class isa = sub_10005C8F0().super.isa;
  *(void *)(v0 + 512) = isa;
  swift_bridgeObjectRelease();
  *(void *)(v0 + 16) = v0;
  *(void *)(v0 + 56) = v62;
  *(void *)(v0 + 24) = sub_10003E7CC;
  uint64_t v57 = swift_continuation_init();
  *(void *)(v0 + 224) = _NSConcreteStackBlock;
  *(void *)(v0 + 232) = 0x40000000;
  *(void *)(v0 + 240) = sub_10003F89C;
  *(void *)(v0 + 248) = &unk_1000737D0;
  *(void *)(v0 + 256) = v57;
  [v55 createImportItems:isa skipTextAttachments:v31 completion:v0 + 224];
  return _swift_continuation_await(v0 + 16);
}

uint64_t sub_10003F044()
{
  unint64_t v2 = (void *)v0[63];
  uint64_t v1 = (void *)v0[64];
  swift_willThrow();

  swift_errorRelease();
  unint64_t v3 = v0[62] + 1;
  if (v3 == v0[61])
  {
LABEL_6:
    swift_bridgeObjectRelease();
    uint64_t v10 = (void *)v0[57];
    uint64_t v11 = sub_1000484A8(v0[44]);
    swift_bridgeObjectRelease();

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v12 = (uint64_t (*)(uint64_t))v0[1];
    return v12(v11);
  }
  unint64_t v4 = v0 + 10;
  unint64_t v5 = (unint64_t)(v0 + 33);
  uint64_t v6 = v0 + 43;
  uint64_t v7 = &qword_10007D948;
  uint64_t inited = (char *)&type metadata for Any + 8;
  while (1)
  {
    v0[62] = v3;
    uint64_t v9 = v0[60];
    if (v3 >= *(void *)(v9 + 16))
    {
      __break(1u);
      goto LABEL_46;
    }
    sub_10002DFAC(v9 + 32 * v3 + 32, (uint64_t)(v0 + 33));
    sub_10002DBB8(0, &qword_10007D948);
    if (swift_dynamicCast()) {
      break;
    }
    unint64_t v3 = v0[62] + 1;
    if (v3 == v0[61]) {
      goto LABEL_6;
    }
  }
  uint64_t v6 = (void *)v0[43];
  v0[63] = v6;
  id v14 = [v6 attachments];
  if (v14)
  {
    id v15 = v14;
    sub_10002DBB8(0, (unint64_t *)&unk_10007D950);
    unint64_t v5 = sub_10005C900();
  }
  else
  {
    unint64_t v5 = (unint64_t)_swiftEmptyArrayStorage;
  }
  uint64_t v7 = (unint64_t *)static OS_os_log.crlSharingExtension;
  uint64_t inited = (char *)swift_initStackObject();
  *((_OWORD *)inited + 1) = xmmword_1000622C0;
  unint64_t v4 = (void *)(v5 >> 62);
  uint64_t v62 = v0 + 44;
  unint64_t v63 = v0 + 42;
  if (v5 >> 62) {
    goto LABEL_47;
  }
  uint64_t v16 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v17 = v7;
  while (1)
  {
    *((void *)inited + 7) = &type metadata for Int;
    *((void *)inited + 8) = &protocol witness table for Int;
    *((void *)inited + 4) = v16;
    uint64_t v18 = sub_10005C9B0();
    sub_100050FE0((uint64_t)v7, (uint64_t)&_mh_execute_header, v18, (uint64_t)"Attachment Count: %d", 20, 2, (uint64_t)inited);
    swift_setDeallocating();
    swift_arrayDestroy();

    id v19 = [v6 attributedContentText];
    unint64_t v65 = v5;
    if (!v19)
    {
      uint64_t v32 = 0;
      goto LABEL_39;
    }
    id v20 = v19;
    uint64_t v60 = v16;
    uint64_t v21 = v0[55];
    uint64_t v7 = (unint64_t *)v0[56];
    uint64_t v22 = v0[54];
    id v23 = [v19 string];
    uint64_t v24 = sub_10005C810();
    uint64_t v26 = v25;

    v0[40] = v24;
    v0[41] = v26;
    sub_10005C090();
    sub_1000454B0();
    uint64_t v27 = sub_10005CAE0();
    unint64_t v29 = v28;
    (*(void (**)(unint64_t *, uint64_t))(v21 + 8))(v7, v22);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    uint64_t v30 = HIBYTE(v29) & 0xF;
    if ((v29 & 0x2000000000000000) == 0) {
      uint64_t v30 = v27 & 0xFFFFFFFFFFFFLL;
    }
    if (!v30)
    {
      uint64_t v32 = 0;
      goto LABEL_38;
    }
    unint64_t v31 = v65;
    id v61 = v20;
    if (v4) {
      break;
    }
    uint64_t v6 = *(void **)((v65 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (!v6) {
      goto LABEL_31;
    }
LABEL_24:
    uint64_t v33 = 0;
    while (1)
    {
      uint64_t v34 = (v65 & 0xC000000000000001) != 0
          ? (char *)sub_10005CBE0()
          : (char *)*(id *)(v31 + 8 * v33 + 32);
      uint64_t inited = v34;
      unint64_t v5 = v33 + 1;
      if (__OFADD__(v33, 1)) {
        break;
      }
      uint64_t v36 = v0[52];
      uint64_t v35 = v0[53];
      uint64_t v37 = v0[51];
      sub_10005C4E0();
      sub_10005C470();
      unint64_t v4 = v38;
      BOOL v39 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
      uint64_t v7 = (unint64_t *)(v36 + 8);
      v39(v35, v37);
      NSString v40 = sub_10005C7D0();
      swift_bridgeObjectRelease();
      LODWORD(v37) = [inited hasItemConformingToTypeIdentifier:v40];

      if (v37)
      {
        swift_bridgeObjectRelease();
        if (v60 == 1)
        {
          unsigned int v64 = 1;
          goto LABEL_32;
        }
        uint64_t v32 = 0;
        id v20 = v61;
        goto LABEL_38;
      }
      ++v33;
      unint64_t v31 = v65;
      if ((void *)v5 == v6) {
        goto LABEL_31;
      }
    }
LABEL_46:
    __break(1u);
LABEL_47:
    uint64_t v59 = v7;
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_10005CCA0();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  uint64_t v6 = (void *)sub_10005CCA0();
  if (v6) {
    goto LABEL_24;
  }
LABEL_31:
  swift_bridgeObjectRelease();
  unsigned int v64 = 0;
LABEL_32:
  uint64_t v41 = v0[48];
  uint64_t v42 = v0[49];
  uint64_t v43 = v0[47];
  id v44 = [objc_allocWithZone((Class)CRLSEImportableItem) init];
  id v45 = [v61 string];
  uint64_t v46 = sub_10005C810();
  uint64_t v48 = v47;

  sub_10003F978(v46, v48, v43);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v42 + 48))(v43, 1, v41) == 1)
  {
    sub_10001E8C0(v0[47], &qword_10007D0E8);
    [v44 setAttributedText:v61];
  }
  else
  {
    uint64_t v50 = v0[49];
    uint64_t v49 = v0[50];
    uint64_t v51 = v0[48];
    (*(void (**)(uint64_t, void, uint64_t))(v50 + 32))(v49, v0[47], v51);
    sub_10005C270(v52);
    id v54 = v53;
    [v44 setUrl:v53];

    (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v49, v51);
  }
  id v20 = v61;
  id v55 = v44;
  sub_10005C8E0();
  uint64_t v32 = v64;
  if (*(void *)(*v62 + 16) >= *(void *)(*v62 + 24) >> 1) {
    sub_10005C920();
  }
  sub_10005C940();
  sub_10005C910();

LABEL_38:
LABEL_39:
  uint64_t v56 = (void *)v0[57];
  sub_10002DBB8(0, (unint64_t *)&unk_10007D950);
  Class isa = sub_10005C8F0().super.isa;
  v0[64] = isa;
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[7] = v63;
  v0[3] = sub_10003E7CC;
  uint64_t v58 = swift_continuation_init();
  v0[28] = _NSConcreteStackBlock;
  v0[29] = 0x40000000;
  v0[30] = sub_10003F89C;
  v0[31] = &unk_1000737D0;
  v0[32] = v58;
  [v56 createImportItems:isa skipTextAttachments:v32 completion:v0 + 28];
  return _swift_continuation_await(v0 + 2);
}

id sub_10003F7A0(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_12;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v2; uint64_t v2 = sub_10005CCA0())
  {
    uint64_t v3 = 4;
    while (1)
    {
      id v4 = (a1 & 0xC000000000000001) != 0 ? (id)sub_10005CBE0() : *(id *)(a1 + 8 * v3);
      unint64_t v5 = v4;
      uint64_t v6 = v3 - 3;
      if (__OFADD__(v3 - 4, 1)) {
        break;
      }
      id v7 = [v4 isPDF];

      if ((v7 & 1) == 0)
      {
        ++v3;
        if (v6 != v2) {
          continue;
        }
      }
      goto LABEL_14;
    }
    __break(1u);
LABEL_12:
    swift_bridgeObjectRetain();
  }
  id v7 = 0;
LABEL_14:
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_10003F89C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (a3)
  {
    sub_1000131E0((uint64_t *)&unk_10007D380);
    uint64_t v5 = swift_allocError();
    *uint64_t v6 = a3;
    id v7 = a3;
    return _swift_continuation_throwingResumeWithError(v3, v5);
  }
  else
  {
    sub_10002DBB8(0, &qword_10007D120);
    **(void **)(*(void *)(v3 + 64) + 40) = sub_10005C900();
    return _swift_continuation_throwingResume(v3);
  }
}

uint64_t sub_10003F978@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_1000131E0(&qword_10007D940);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v33 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_1000131E0(&qword_10007D0E8);
  __chkstk_darwin(v9 - 8);
  uint64_t v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10005C300();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  id v15 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10005C2D0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) == 1)
  {
    sub_10001E8C0((uint64_t)v11, &qword_10007D0E8);
LABEL_11:
    uint64_t v22 = 1;
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 56))(a3, v22, 1, v12);
  }
  uint64_t v16 = *(void (**)(char *, char *, uint64_t))(v13 + 32);
  v16(v15, v11, v12);
  if ((sub_10005C210() & 1) != 0 || (sub_10005C2C0(), uint64_t v18 = v17, swift_bridgeObjectRelease(), !v18))
  {
LABEL_10:
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    goto LABEL_11;
  }
  if (sub_10005C240() == a1 && v19 == a2)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v21 = sub_10005CDF0();
    swift_bridgeObjectRelease();
    if ((v21 & 1) == 0) {
      goto LABEL_10;
    }
  }
  uint64_t v33 = (void (*)(uint64_t, char *, uint64_t))v16;
  uint64_t v34 = a3;
  uint64_t v39 = *(void *)"http";
  unint64_t v40 = 0xE400000000000000;
  swift_bridgeObjectRetain();
  uint64_t result = sub_10005C2C0();
  if (v24)
  {
    uint64_t v37 = result;
    uint64_t v38 = v24;
    uint64_t v25 = sub_10005C3E0();
    uint64_t v26 = *(void *)(v25 - 8);
    uint64_t v27 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v26 + 56);
    uint64_t v35 = v26 + 56;
    uint64_t v36 = v27;
    v27(v8, 1, 1, v25);
    sub_1000454B0();
    uint64_t v28 = sub_10005CB10();
    sub_10001E8C0((uint64_t)v8, &qword_10007D940);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (!v28) {
      goto LABEL_21;
    }
    uint64_t v39 = *(void *)"https";
    unint64_t v40 = 0xE500000000000000;
    swift_bridgeObjectRetain();
    uint64_t result = sub_10005C2C0();
    if (v29)
    {
      uint64_t v37 = result;
      uint64_t v38 = v29;
      v36(v8, 1, 1, v25);
      uint64_t v30 = sub_10005CB10();
      sub_10001E8C0((uint64_t)v8, &qword_10007D940);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (!v30) {
        goto LABEL_21;
      }
      strcpy((char *)&v39, "message");
      unint64_t v40 = 0xE700000000000000;
      swift_bridgeObjectRetain();
      uint64_t result = sub_10005C2C0();
      if (v31)
      {
        uint64_t v37 = result;
        uint64_t v38 = v31;
        v36(v8, 1, 1, v25);
        uint64_t v32 = sub_10005CB10();
        sub_10001E8C0((uint64_t)v8, &qword_10007D940);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v32)
        {
          swift_arrayDestroy();
          (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
          uint64_t v22 = 1;
          a3 = v34;
          return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 56))(a3, v22, 1, v12);
        }
LABEL_21:
        swift_arrayDestroy();
        a3 = v34;
        v33(v34, v15, v12);
        uint64_t v22 = 0;
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 56))(a3, v22, 1, v12);
      }
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_10003FE8C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_10005CDF0();
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
    if (v12 || (sub_10005CDF0() & 1) != 0) {
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

uint64_t sub_10003FF54(uint64_t a1, uint64_t a2)
{
  v11[1] = a2;
  uint64_t v2 = sub_10005C230();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12[0] = sub_10005C3A0();
  v12[1] = v6;
  uint64_t v7 = enum case for URL.DirectoryHint.inferFromPath(_:);
  uint64_t v8 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 104);
  v8(v5, enum case for URL.DirectoryHint.inferFromPath(_:), v2);
  sub_1000454B0();
  sub_10005C2E0();
  uint64_t v9 = *(void (**)(char *, uint64_t))(v3 + 8);
  v9(v5, v2);
  swift_bridgeObjectRelease();
  strcpy((char *)v12, "Manifest.plist");
  HIBYTE(v12[1]) = -18;
  v8(v5, v7, v2);
  sub_10005C2F0();
  v9(v5, v2);
  return swift_bridgeObjectRelease();
}

uint64_t sub_100040114(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v172 = a3;
  id v168 = a2;
  uint64_t v179 = a1;
  v177 = (int *)type metadata accessor for CRLSEBoard(0);
  uint64_t v169 = *((void *)v177 - 1);
  __chkstk_darwin(v177);
  uint64_t v170 = v4;
  uint64_t v171 = (uint64_t)&v143 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v152 = type metadata accessor for CRLSEManifestItem(0);
  uint64_t v153 = *(void *)(v152 - 8);
  uint64_t v5 = __chkstk_darwin(v152);
  uint64_t v159 = (uint64_t)&v143 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v160 = (uint64_t)&v143 - v7;
  uint64_t v8 = sub_1000131E0(&qword_10007D8B0);
  __chkstk_darwin(v8 - 8);
  uint64_t v167 = (uint64_t)&v143 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v166 = type metadata accessor for CRLSEBoardIdentifier(0);
  uint64_t v165 = *(void *)(v166 - 8);
  __chkstk_darwin(v166);
  uint64_t v158 = (uint64_t)&v143 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000131E0(&qword_10007D8B8);
  __chkstk_darwin(v11 - 8);
  v150 = (char *)&v143 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_1000131E0((uint64_t *)&unk_10007D8C0);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  v155 = (char *)&v143 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v17 = (char *)&v143 - v16;
  uint64_t v173 = type metadata accessor for CRLSEImportManifest(0);
  uint64_t v149 = *(void *)(v173 - 8);
  uint64_t v18 = __chkstk_darwin(v173);
  uint64_t v148 = (uint64_t)&v143 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v178 = (uint64_t)&v143 - v20;
  uint64_t v21 = sub_10005C3D0();
  uint64_t v22 = *(void *)(v21 - 8);
  uint64_t v23 = __chkstk_darwin(v21);
  v164 = (char *)&v143 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = __chkstk_darwin(v23);
  id v163 = (char *)&v143 - v26;
  __chkstk_darwin(v25);
  v182 = (char *)&v143 - v27;
  uint64_t v28 = sub_1000131E0(&qword_10007D0E8);
  __chkstk_darwin(v28 - 8);
  uint64_t v30 = (char *)&v143 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = sub_10005C300();
  uint64_t v32 = *(void *)(v31 - 8);
  uint64_t v33 = __chkstk_darwin(v31);
  unint64_t v157 = (unint64_t)&v143 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = __chkstk_darwin(v33);
  id v176 = (char *)&v143 - v36;
  uint64_t v37 = __chkstk_darwin(v35);
  uint64_t v175 = (uint64_t)&v143 - v38;
  uint64_t v39 = __chkstk_darwin(v37);
  id v181 = (char *)&v143 - v40;
  uint64_t v41 = __chkstk_darwin(v39);
  id v180 = (char *)&v143 - v42;
  __chkstk_darwin(v41);
  id v44 = (char *)&v143 - v43;
  unsigned __int8 v184 = 0;
  uint64_t v45 = (uint64_t)v3 + OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager_importDirectoryURL;
  swift_beginAccess();
  sub_10001E85C(v45, (uint64_t)v30, &qword_10007D0E8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v32 + 48))(v30, 1, v31) != 1)
  {
    uint64_t v151 = v3;
    uint64_t v49 = v32;
    uint64_t v50 = *(void (**)(char *, char *, uint64_t))(v32 + 32);
    v50(v44, v30, v31);
    uint64_t v51 = v177;
    sub_10001E85C(v179 + v177[6], (uint64_t)v17, (uint64_t *)&unk_10007D8C0);
    int v52 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v22 + 48))(v17, 1, v21);
    uint64_t v162 = v22;
    id v174 = v44;
    uint64_t v156 = v21;
    uint64_t v161 = v49;
    if (v52 == 1)
    {
      sub_10001E8C0((uint64_t)v17, (uint64_t *)&unk_10007D8C0);
      id v53 = v164;
      sub_10005C3C0();
      id v54 = v182;
      (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v182, v53, v21);
      uint64_t v147 = *(void (**)(char *, char *, uint64_t))(v22 + 16);
      v147(v53, v54, v21);
      uint64_t v55 = v175;
      uint64_t v56 = (uint64_t)v176;
      sub_10003FF54(v175, (uint64_t)v176);
      id v154 = *(void (**)(char *, uint64_t))(v22 + 8);
      v154(v53, v21);
      v50(v180, (char *)v55, v31);
      v50(v181, (char *)v56, v31);
      uint64_t v57 = v178;
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v22 + 56))(v178, 1, 1, v21);
      uint64_t v58 = v179;
      uint64_t v59 = (uint64_t *)(v179 + v51[5]);
      uint64_t v61 = *v59;
      uint64_t v60 = v59[1];
      uint64_t v62 = (int *)v173;
      unint64_t v63 = (void *)(v57 + *(int *)(v173 + 20));
      *unint64_t v63 = 0;
      v63[1] = 0;
      unsigned int v64 = (void *)(v57 + v62[6]);
      *unsigned int v64 = v61;
      v64[1] = v60;
      *(void *)(v57 + v62[7]) = _swiftEmptyArrayStorage;
      swift_bridgeObjectRetain();
    }
    else
    {
      unint64_t v65 = v163;
      (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v163, v17, v21);
      long long v146 = (void (*)(char *, uint64_t, uint64_t))v50;
      uint64_t v66 = *(void (**)(char *, char *, uint64_t))(v22 + 16);
      uint64_t v67 = v182;
      v66(v182, v65, v21);
      uint64_t v68 = v164;
      uint64_t v147 = v66;
      uint64_t v145 = v22 + 16;
      v66(v164, v67, v21);
      uint64_t v69 = v175;
      uint64_t v70 = (uint64_t)v176;
      sub_10003FF54(v175, (uint64_t)v176);
      uint64_t v71 = *(void (**)(char *, uint64_t))(v22 + 8);
      v71(v68, v21);
      uint64_t v72 = v69;
      uint64_t v73 = v146;
      v146(v180, v72, v31);
      id v74 = v181;
      v73(v181, v70, v31);
      sub_10005C180();
      swift_allocObject();
      sub_10005C170();
      uint64_t v75 = v161;
      unint64_t v76 = v157;
      (*(void (**)(unint64_t, char *, uint64_t))(v161 + 16))(v157, v74, v31);
      uint64_t v77 = sub_10005C310();
      id v154 = v71;
      uint64_t v78 = v77;
      unint64_t v79 = v76;
      unint64_t v81 = v80;
      (*(void (**)(unint64_t, uint64_t))(v75 + 8))(v79, v31);
      sub_100046FB0(&qword_10007D8D0, (void (*)(uint64_t))type metadata accessor for CRLSEImportManifest);
      uint64_t v62 = (int *)v173;
      uint64_t v144 = v78;
      unint64_t v157 = v81;
      sub_10005C160();
      sub_10002D954(v144, v157);
      uint64_t v140 = v150;
      (*(void (**)(char *, void, uint64_t, int *))(v149 + 56))(v150, 0, 1, v62);
      swift_release();
      uint64_t v21 = v156;
      v71(v163, v156);
      uint64_t v141 = (uint64_t)v140;
      uint64_t v142 = v148;
      sub_100049384(v141, v148, type metadata accessor for CRLSEImportManifest);
      uint64_t v57 = v178;
      sub_100049384(v142, v178, type metadata accessor for CRLSEImportManifest);
      uint64_t v22 = v162;
      uint64_t v58 = v179;
    }
    uint64_t v82 = v167;
    sub_10001E85C(v58, v167, &qword_10007D8B0);
    int v83 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v165 + 48))(v82, 1, v166);
    uint64_t v84 = v151;
    if (v83 == 1)
    {
      sub_10001E8C0(v82, &qword_10007D8B0);
    }
    else
    {
      uint64_t v85 = v158;
      sub_100049384(v82, v158, type metadata accessor for CRLSEBoardIdentifier);
      sub_10001E8C0(v57, (uint64_t *)&unk_10007D8C0);
      v147((char *)v57, (char *)v85, v21);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v22 + 56))(v57, 0, 1, v21);
      uint64_t v86 = (uint64_t *)(v85 + *(int *)(type metadata accessor for CRLSEBoardIdentifierStorage(0) + 20));
      uint64_t v88 = *v86;
      uint64_t v87 = v86[1];
      swift_bridgeObjectRetain();
      sub_1000473D4(v85, type metadata accessor for CRLSEBoardIdentifier);
      uint64_t v89 = (void *)(v57 + v62[5]);
      *uint64_t v89 = v88;
      v89[1] = v87;
      swift_bridgeObjectRelease();
    }
    if (v168)
    {
      id v90 = v168;
      if ((uint64_t)[v90 length] < 1)
      {
      }
      else
      {
        uint64_t v91 = v160;
        sub_10005C3C0();
        uint64_t v92 = v62;
        uint64_t v93 = (int *)v152;
        uint64_t v94 = v91 + *(int *)(v152 + 24);
        id v95 = v90;
        sub_10005C120();
        uint64_t v96 = sub_10005C110();
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v96 - 8) + 56))(v94, 0, 1, v96);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v161 + 56))(v91 + v93[7], 1, 1, v31);
        uint64_t v97 = v91 + v93[8];
        uint64_t v98 = sub_10005C510();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v98 - 8) + 56))(v97, 1, 1, v98);
        char v99 = (void *)(v91 + v93[5]);
        *char v99 = 0;
        v99[1] = 0;
        sub_100047478(v91, v159, type metadata accessor for CRLSEManifestItem);
        uint64_t v100 = v92[7];
        id v101 = *(void **)(v57 + v100);
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *(void *)(v57 + v100) = v101;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          id v101 = (void *)sub_10005375C(0, v101[2] + 1, 1, v101);
          *(void *)(v57 + v100) = v101;
        }
        unint64_t v104 = v101[2];
        unint64_t v103 = v101[3];
        if (v104 >= v103 >> 1)
        {
          id v101 = (void *)sub_10005375C(v103 > 1, v104 + 1, 1, v101);
          *(void *)(v57 + v100) = v101;
        }
        uint64_t v84 = v151;
        v101[2] = v104 + 1;
        sub_100049384(v159, (uint64_t)v101+ ((*(unsigned __int8 *)(v153 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v153 + 80))+ *(void *)(v153 + 72) * v104, type metadata accessor for CRLSEManifestItem);

        sub_1000473D4(v160, type metadata accessor for CRLSEManifestItem);
      }
    }
    uint64_t v179 = v31;
    uint64_t v105 = v57;
    uint64_t v106 = (int *)[objc_allocWithZone((Class)NSFileCoordinator) initWithFilePresenter:v84];
    sub_10005C270(v107);
    unint64_t v109 = v108;
    uint64_t v110 = v58;
    uint64_t v111 = v171;
    sub_100047478(v110, v171, type metadata accessor for CRLSEBoard);
    unint64_t v112 = (*(unsigned __int8 *)(v169 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v169 + 80);
    uint64_t v113 = v84;
    unint64_t v114 = (v170 + v112 + 7) & 0xFFFFFFFFFFFFFFF8;
    unint64_t v115 = (void *)swift_allocObject();
    uint64_t v116 = v172;
    v115[2] = v180;
    v115[3] = v116;
    v115[4] = v113;
    v115[5] = v105;
    v115[6] = v181;
    sub_100049384(v111, (uint64_t)v115 + v112, type metadata accessor for CRLSEBoard);
    *(void *)((char *)v115 + v114) = v182;
    *(void *)((char *)v115 + ((v114 + 15) & 0xFFFFFFFFFFFFFFF8)) = &v184;
    uint64_t v117 = (void *)swift_allocObject();
    v117[2] = sub_1000472D0;
    v117[3] = v115;
    aBlock[4] = sub_100047394;
    aBlock[5] = v117;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = (id)1107296256;
    aBlock[2] = sub_1000436CC;
    aBlock[3] = &unk_1000737A8;
    NSString v118 = _Block_copy(aBlock);
    swift_bridgeObjectRetain();
    UIAccessibilityTraits v119 = v113;
    swift_retain();
    swift_release();
    aBlock[0] = 0;
    v177 = v106;
    [v106 coordinateWritingItemAtURL:v109 options:0 error:aBlock byAccessor:v118];
    _Block_release(v118);

    id v120 = aBlock[0];
    uint64_t isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if (isEscapingClosureAtFileLocation)
    {
      __break(1u);
    }
    else
    {
      if (!v120)
      {
        uint64_t v135 = *(void (**)(char *, uint64_t))(v161 + 8);
        uint64_t v136 = v179;
        v135(v174, v179);

        uint64_t v48 = v184;
        uint64_t v137 = v156;
        uint64_t v138 = v178;
        goto LABEL_24;
      }
      id v176 = v119;
      uint64_t v122 = qword_10007C6D8;
      uint64_t isEscapingClosureAtFileLocation = (uint64_t)v120;
      if (v122 == -1)
      {
LABEL_22:
        swift_beginAccess();
        Class v123 = (void *)static OS_os_log.crlSharingExtension;
        sub_1000131E0(&qword_10007D870);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_100062290;
        id v125 = (id)isEscapingClosureAtFileLocation;
        id v126 = v123;
        uint64_t v127 = sub_10003C580();
        uint64_t v129 = v128;

        *(void *)(inited + 56) = &type metadata for String;
        unint64_t v130 = sub_10002D9AC();
        *(void *)(inited + 64) = v130;
        *(void *)(inited + 32) = v127;
        *(void *)(inited + 40) = v129;
        id v183 = v125;
        sub_10002DBB8(0, (unint64_t *)&qword_10007CF90);
        id v131 = v125;
        uint64_t v132 = sub_10005C830();
        *(void *)(inited + 96) = &type metadata for String;
        *(void *)(inited + 104) = v130;
        *(void *)(inited + 72) = v132;
        *(void *)(inited + 80) = v133;
        uint64_t v134 = sub_10005C9C0();
        sub_100050FE0((uint64_t)v126, (uint64_t)&_mh_execute_header, v134, (uint64_t)"Failed to write sharing extension data due to file coordination error : %{public}@ <%@>", 87, 2, inited);

        swift_setDeallocating();
        sub_1000131E0(&qword_10007D108);
        swift_arrayDestroy();

        uint64_t v135 = *(void (**)(char *, uint64_t))(v161 + 8);
        uint64_t v136 = v179;
        v135(v174, v179);
        uint64_t v48 = 0;
        unsigned __int8 v184 = 0;
        uint64_t v137 = v156;
        uint64_t v138 = v178;
        UIAccessibilityTraits v119 = v176;
LABEL_24:

        sub_1000473D4(v138, type metadata accessor for CRLSEImportManifest);
        v135(v181, v136);
        v135(v180, v136);
        v154(v182, v137);
        [self removeFilePresenter:v119];
        swift_release();
        return v48;
      }
    }
    swift_once();
    goto LABEL_22;
  }
  sub_10001E8C0((uint64_t)v30, &qword_10007D0E8);
  if (qword_10007C6D8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v46 = (id)static OS_os_log.crlSharingExtension;
  uint64_t v47 = sub_10005C9C0();
  sub_100050FE0((uint64_t)v46, (uint64_t)&_mh_execute_header, v47, (uint64_t)"Unable to resolve import directory URL", 38, 2, (uint64_t)_swiftEmptyArrayStorage);

  [self removeFilePresenter:v3];
  return 0;
}

void sub_100041878(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char *a9)
{
  uint64_t v258 = a8;
  uint64_t v263 = a7;
  uint64_t v265 = a6;
  uint64_t v298 = a5;
  uint64_t v12 = sub_10005C230();
  uint64_t v254 = *(void *)(v12 - 8);
  uint64_t v255 = v12;
  __chkstk_darwin(v12);
  v253 = (char *)&v251 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v260 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  __chkstk_darwin(v260);
  v261 = (char *)&v251 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1000131E0((uint64_t *)&unk_10007D1A0);
  __chkstk_darwin(v15 - 8);
  uint64_t v259 = (uint64_t)&v251 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_1000131E0(&qword_10007D8B0);
  __chkstk_darwin(v17 - 8);
  uint64_t v262 = (uint64_t)&v251 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v307 = sub_10005C510();
  uint64_t v19 = *(char **)(v307 - 8);
  __chkstk_darwin(v307);
  v271 = (char *)&v251 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_1000131E0((uint64_t *)&unk_10007D8F0);
  __chkstk_darwin(v21 - 8);
  v295 = (char *)&v251 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_1000131E0(&qword_10007D0E8);
  uint64_t v24 = __chkstk_darwin(v23 - 8);
  uint64_t v257 = (uint64_t)&v251 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = __chkstk_darwin(v24);
  v256 = (char *)&v251 - v27;
  uint64_t v28 = __chkstk_darwin(v26);
  v296 = (char *)&v251 - v29;
  __chkstk_darwin(v28);
  v294 = (char *)&v251 - v30;
  uint64_t v31 = sub_1000131E0(&qword_10007D510);
  __chkstk_darwin(v31 - 8);
  v282 = (char *)&v251 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v300 = type metadata accessor for CRLSEManifestItem(0);
  uint64_t v290 = *(void *)(v300 - 8);
  uint64_t v33 = __chkstk_darwin(v300);
  uint64_t v305 = (uint64_t)&v251 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v35 = __chkstk_darwin(v33);
  uint64_t v306 = (uint64_t)&v251 - v36;
  __chkstk_darwin(v35);
  uint64_t v310 = (uint64_t)&v251 - v37;
  uint64_t v297 = type metadata accessor for CRLSEImportManifest(0);
  __chkstk_darwin(v297);
  uint64_t v268 = (uint64_t)&v251 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = sub_10005C300();
  uint64_t v40 = *(void *)(v39 - 8);
  uint64_t v41 = __chkstk_darwin(v39);
  uint64_t v252 = (char *)&v251 - ((v42 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = __chkstk_darwin(v41);
  v264 = (char *)&v251 - v44;
  uint64_t v45 = __chkstk_darwin(v43);
  v270 = (char *)&v251 - v46;
  uint64_t v47 = __chkstk_darwin(v45);
  v293 = (char *)&v251 - v48;
  uint64_t v49 = __chkstk_darwin(v47);
  v273 = (char *)&v251 - v50;
  uint64_t v51 = __chkstk_darwin(v49);
  v274 = (char *)&v251 - v52;
  uint64_t v53 = __chkstk_darwin(v51);
  v292 = (char *)&v251 - v54;
  __chkstk_darwin(v53);
  uint64_t v56 = (char *)&v251 - v55;
  id v275 = self;
  id v57 = [v275 defaultManager];
  uint64_t v58 = *(void (**)(void, void, void))(v40 + 16);
  uint64_t v276 = a2;
  v280 = (void (*)(char *, uint64_t, uint64_t))v58;
  uint64_t v281 = v40 + 16;
  v58(v56, a2, v39);
  sub_10005C270(v59);
  uint64_t v61 = v60;
  uint64_t v267 = v40;
  uint64_t v62 = *(void (**)(void, void))(v40 + 8);
  v291 = v56;
  v287 = (void (*)(char *, uint64_t))v62;
  uint64_t v288 = v40 + 8;
  v62(v56, v39);
  v315[0] = 0;
  unsigned int v63 = [v57 createDirectoryAtURL:v61 withIntermediateDirectories:1 attributes:0 error:v315];

  id v64 = v315[0];
  if (v63)
  {
    if (a3 >> 62) {
      goto LABEL_72;
    }
    uint64_t v65 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    for (uint64_t i = v39; v65; uint64_t i = v39)
    {
      uint64_t v286 = 0;
      unint64_t v301 = a3 & 0xC000000000000001;
      v309 = (unsigned int (*)(char *, uint64_t, uint64_t))(v267 + 56);
      v304 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56);
      v289 = (void (**)(char *, char *, uint64_t))(v267 + 32);
      v279 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v267 + 48);
      v266 = (void (**)(char *, uint64_t))(v19 + 8);
      uint64_t v66 = 4;
      long long v272 = xmmword_1000622C0;
      long long v251 = xmmword_100062290;
      uint64_t v283 = a4;
      uint64_t v284 = v65;
      unint64_t v285 = a3;
      while (1)
      {
        id v67 = v301 ? (id)sub_10005CBE0() : *(id *)(a3 + 8 * v66);
        uint64_t v68 = v67;
        uint64_t v69 = v66 - 3;
        if (__OFADD__(v66 - 4, 1)) {
          break;
        }
        id v70 = [v67 attributedText];
        if (!v70 || (v71 = v70, uint64_t v19 = (char *)[v70 length], v71, (uint64_t)v19 <= 0))
        {
          uint64_t v302 = v66 - 3;
          uint64_t v303 = v66;
          uint64_t v72 = v306;
          sub_10005C3C0();
          id v311 = v68;
          uint64_t v73 = (int *)v300;
          uint64_t v74 = v72 + *(int *)(v300 + 24);
          uint64_t v75 = sub_10005C110();
          unint64_t v76 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v75 - 8) + 56);
          v76(v74, 1, 1, v75);
          uint64_t v77 = v72 + v73[7];
          v308 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))v309;
          v308(v77, 1, 1, v39);
          uint64_t v78 = v72 + v73[8];
          unint64_t v79 = *v304;
          (*v304)(v78, 1, 1, v307);
          uint64_t v80 = v73[5];
          id v81 = v311;
          uint64_t v82 = (void *)(v72 + v80);
          *uint64_t v82 = 0;
          v82[1] = 0;
          if ([v81 attributedText])
          {
            int v83 = v282;
            sub_10005C120();
            v76((uint64_t)v83, 0, 1, v75);
            uint64_t v84 = (uint64_t)v83;
            id v81 = v311;
            sub_10003701C(v84, v74, &qword_10007D510);
          }
          id v85 = [v81 url:v251];
          if (v85)
          {
            uint64_t v86 = v85;
            uint64_t v87 = (uint64_t)v294;
            sub_10005C290();

            uint64_t v88 = 0;
            uint64_t v39 = i;
          }
          else
          {
            uint64_t v88 = 1;
            uint64_t v39 = i;
            uint64_t v87 = (uint64_t)v294;
          }
          uint64_t v89 = (uint64_t)v295;
          uint64_t v91 = v292;
          id v90 = v293;
          uint64_t v92 = 1;
          v308(v87, v88, 1, v39);
          sub_10003701C(v87, v77, &qword_10007D0E8);
          id v93 = [v311 mediaUTI];
          if (v93)
          {
            uint64_t v94 = v93;
            sub_10005C4B0();

            uint64_t v92 = 0;
          }
          v79(v89, v92, 1, v307);
          sub_10003701C(v89, v78, (uint64_t *)&unk_10007D8F0);
          sub_100049384(v306, v310, type metadata accessor for CRLSEManifestItem);
          id v95 = [v311 url];
          if (v95)
          {
            uint64_t v96 = v95;
            uint64_t v97 = v291;
            sub_10005C290();

            uint64_t v98 = *v289;
            uint64_t v99 = (uint64_t)v296;
            (*v289)(v296, v97, v39);
            v308(v99, 0, 1, v39);
            if ((*v279)(v99, 1, v39) != 1)
            {
              v98(v91, (char *)v99, v39);
              if (sub_10005C210())
              {
                v278 = v98;
                sub_10005C260();
                uint64_t v100 = v291;
                v280(v291, v276, v39);
                sub_10005C3A0();
                id v101 = v274;
                sub_10005C280();
                swift_bridgeObjectRelease();
                v287(v100, v39);
                id v102 = v275;
                id v103 = [v275 defaultManager];
                sub_10005C270(v104);
                uint64_t v106 = v105;
                v315[0] = 0;
                LODWORD(v100) = [v103 createDirectoryAtURL:v105 withIntermediateDirectories:1 attributes:0 error:v315];

                id v107 = v315[0];
                if (!v100)
                {
                  id v189 = v107;
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  uint64_t v190 = sub_10005C1F0();

                  uint64_t v286 = v190;
                  swift_willThrow();

                  id v191 = v287;
                  v287(v101, v39);
LABEL_69:
                  v191(v91, v39);
                  goto LABEL_70;
                }
                sub_10005C280();
                swift_bridgeObjectRelease();
                id v108 = [v102 defaultManager];
                sub_10005C270(v109);
                uint64_t v111 = v110;
                sub_10005C270(v112);
                unint64_t v114 = v113;
                v315[0] = 0;
                unsigned int v115 = [v108 copyItemAtURL:v111 toURL:v113 error:v315];

                if (!v115)
                {
                  id v192 = v315[0];
                  swift_bridgeObjectRelease();
                  uint64_t v193 = sub_10005C1F0();

                  uint64_t v286 = v193;
                  swift_willThrow();

                  id v191 = v287;
                  v287(v273, v39);
                  v191(v101, v39);
                  goto LABEL_69;
                }
                uint64_t v116 = qword_10007C6D8;
                id v117 = v315[0];
                if (v116 != -1) {
                  swift_once();
                }
                swift_beginAccess();
                NSString v118 = (void *)static OS_os_log.crlSharingExtension;
                sub_1000131E0(&qword_10007D870);
                uint64_t inited = swift_initStackObject();
                *(_OWORD *)(inited + 16) = v251;
                id v120 = v118;
                sub_10005C270(v121);
                uint64_t v123 = v122;
                uint64_t v124 = sub_10002DBB8(0, &qword_10007D918);
                *(void *)(inited + 56) = v124;
                uint64_t v125 = sub_100047434(&qword_10007D920, &qword_10007D918);
                *(void *)(inited + 64) = v125;
                *(void *)(inited + 32) = v123;
                id v126 = v273;
                sub_10005C270(v127);
                *(void *)(inited + 96) = v124;
                *(void *)(inited + 104) = v125;
                *(void *)(inited + 72) = v128;
                uint64_t v129 = sub_10005C9B0();
                sub_100050FE0((uint64_t)v120, (uint64_t)&_mh_execute_header, v129, (uint64_t)"Copied file at URL: %@ to %@", 28, 2, inited);
                swift_setDeallocating();
                sub_1000131E0(&qword_10007D108);
                swift_arrayDestroy();

                unint64_t v130 = v287;
                v287(v274, v39);
                v130(v91, v39);
                uint64_t v131 = v310 + *(int *)(v300 + 28);
                sub_10001E8C0(v131, &qword_10007D0E8);
                v278((char *)v131, v126, v39);
                v308(v131, 0, 1, v39);
LABEL_58:
                id v132 = v311;
                goto LABEL_59;
              }
              v287(v91, v39);
LABEL_30:
              id v132 = v311;
              uint64_t v133 = (UIImage *)[v311 image];
              if (v133)
              {
                uint64_t v134 = v133;
                uint64_t v135 = [(UIImage *)v133 CGImage];
                if (v135)
                {
                  uint64_t v136 = v135;
                  CGImageAlphaInfo AlphaInfo = CGImageGetAlphaInfo(v135);
                  if (AlphaInfo <= kCGImageAlphaNoneSkipFirst && ((1 << AlphaInfo) & 0x61) != 0) {
                    uint64_t v138 = UIImageJPEGRepresentation(v134, 0.8);
                  }
                  else {
                    uint64_t v138 = UIImagePNGRepresentation(v134);
                  }
                  uint64_t v139 = v138;
                  if (v139)
                  {
                    uint64_t v277 = sub_10005C330();
                    v278 = v140;

                    uint64_t v141 = [(UIImage *)v134 CGImage];
                    if (v141)
                    {
                      uint64_t v142 = v141;
                      CGImageAlphaInfo v143 = CGImageGetAlphaInfo(v141);
                      unsigned int v269 = (v143 > kCGImageAlphaNoneSkipFirst) | (0x1Eu >> v143);
                    }
                    else
                    {
                      unsigned int v269 = 0;
                    }
                    uint64_t v144 = v271;
                    sub_1000131E0((uint64_t *)&unk_10007D760);
                    uint64_t v145 = swift_allocObject();
                    *(_OWORD *)(v145 + 16) = v272;
                    id v146 = [self mainBundle];
                    NSString v147 = sub_10005C7D0();
                    NSString v148 = sub_10005C7D0();
                    id v149 = [v146 localizedStringForKey:v147 value:v148 table:0];

                    uint64_t v150 = sub_10005C810();
                    uint64_t v152 = v151;

                    *(void *)(v145 + 32) = v150;
                    *(void *)(v145 + 40) = v152;
                    if (v269) {
                      sub_10005C4C0();
                    }
                    else {
                      sub_10005C4D0();
                    }
                    uint64_t v153 = sub_10005C4A0();
                    unint64_t v155 = v154;
                    (*v266)(v144, v307);
                    if (v155) {
                      uint64_t v156 = v153;
                    }
                    else {
                      uint64_t v156 = 6778480;
                    }
                    if (!v155) {
                      unint64_t v155 = 0xE300000000000000;
                    }
                    unint64_t v158 = *(void *)(v145 + 16);
                    unint64_t v157 = *(void *)(v145 + 24);
                    if (v158 >= v157 >> 1) {
                      uint64_t v145 = (uint64_t)sub_100053658((char *)(v157 > 1), v158 + 1, 1, (char *)v145);
                    }
                    *(void *)(v145 + 16) = v158 + 1;
                    uint64_t v159 = v145 + 16 * v158;
                    *(void *)(v159 + 32) = v156;
                    *(void *)(v159 + 40) = v155;
                    uint64_t v160 = v291;
                    uint64_t v39 = i;
                    v280(v291, v276, i);
                    sub_10005C3A0();
                    sub_10005C280();
                    swift_bridgeObjectRelease();
                    v287(v160, v39);
                    id v161 = [v275 defaultManager];
                    sub_10005C270(v162);
                    v164 = v163;
                    v315[0] = 0;
                    LODWORD(v160) = [v161 createDirectoryAtURL:v163 withIntermediateDirectories:1 attributes:0 error:v315];

                    id v165 = v315[0];
                    if (!v160)
                    {
                      id v186 = v315[0];
                      swift_bridgeObjectRelease();
                      swift_bridgeObjectRelease();
                      uint64_t v187 = sub_10005C1F0();

                      uint64_t v286 = v187;
                      swift_willThrow();

                      sub_10002D954(v277, (unint64_t)v278);
                      v287(v90, v39);
LABEL_70:
                      sub_1000473D4(v310, type metadata accessor for CRLSEManifestItem);
                      goto LABEL_78;
                    }
                    v315[0] = (id)v145;
                    id v166 = v165;
                    sub_1000131E0(&qword_10007D470);
                    sub_10003475C();
                    sub_10005C7B0();
                    swift_bridgeObjectRelease();
                    uint64_t v167 = v270;
                    sub_10005C280();
                    swift_bridgeObjectRelease();
                    uint64_t v168 = v286;
                    sub_10005C340();
                    uint64_t v286 = v168;
                    if (v168)
                    {

                      sub_10002D954(v277, (unint64_t)v278);
                      v188 = v287;
                      v287(v167, v39);
                      v188(v90, v39);
                      swift_bridgeObjectRelease();
                      goto LABEL_70;
                    }
                    uint64_t v169 = v310 + *(int *)(v300 + 28);
                    sub_10001E8C0(v169, &qword_10007D0E8);
                    v280((char *)v169, (uint64_t)v167, v39);
                    v308(v169, 0, 1, v39);
                    if (qword_10007C6D8 != -1) {
                      swift_once();
                    }
                    swift_beginAccess();
                    uint64_t v170 = (void *)static OS_os_log.crlSharingExtension;
                    sub_1000131E0(&qword_10007D870);
                    uint64_t v171 = swift_initStackObject();
                    *(_OWORD *)(v171 + 16) = v272;
                    id v172 = v170;
                    sub_10005C270(v173);
                    uint64_t v175 = v174;
                    *(void *)(v171 + 56) = sub_10002DBB8(0, &qword_10007D918);
                    *(void *)(v171 + 64) = sub_100047434(&qword_10007D920, &qword_10007D918);
                    *(void *)(v171 + 32) = v175;
                    uint64_t v176 = sub_10005C9B0();
                    sub_100050FE0((uint64_t)v172, (uint64_t)&_mh_execute_header, v176, (uint64_t)"Copied image data to %@", 23, 2, v171);

                    swift_setDeallocating();
                    sub_1000131E0(&qword_10007D108);
                    swift_arrayDestroy();

                    sub_10002D954(v277, (unint64_t)v278);
                    v177 = v287;
                    v287(v167, v39);
                    v177(v90, v39);
                    goto LABEL_58;
                  }
                }
                else
                {
                }
              }
LABEL_59:
              sub_100047478(v310, v305, type metadata accessor for CRLSEManifestItem);
              uint64_t v178 = v298;
              uint64_t v179 = *(int *)(v297 + 28);
              id v180 = *(void **)(v298 + v179);
              char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
              *(void *)(v178 + v179) = v180;
              a4 = v283;
              uint64_t v66 = v303;
              if ((isUniquelyReferenced_nonNull_native & 1) == 0)
              {
                id v180 = (void *)sub_10005375C(0, v180[2] + 1, 1, v180);
                *(void *)(v298 + v179) = v180;
              }
              unint64_t v183 = v180[2];
              unint64_t v182 = v180[3];
              uint64_t v19 = (char *)(v183 + 1);
              if (v183 >= v182 >> 1)
              {
                id v180 = (void *)sub_10005375C(v182 > 1, v183 + 1, 1, v180);
                *(void *)(v298 + v179) = v180;
              }
              uint64_t v65 = v284;
              a3 = v285;
              v180[2] = v19;
              sub_100049384(v305, (uint64_t)v180+ ((*(unsigned __int8 *)(v290 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v290 + 80))+ *(void *)(v290 + 72) * v183, type metadata accessor for CRLSEManifestItem);

              sub_1000473D4(v310, type metadata accessor for CRLSEManifestItem);
              uint64_t v69 = v302;
              goto LABEL_6;
            }
          }
          else
          {
            uint64_t v99 = (uint64_t)v296;
            v308((uint64_t)v296, 1, 1, v39);
          }
          sub_10001E8C0(v99, &qword_10007D0E8);
          goto LABEL_30;
        }

LABEL_6:
        ++v66;
        if (v69 == v65) {
          goto LABEL_74;
        }
      }
      __break(1u);
LABEL_72:
      swift_bridgeObjectRetain();
      uint64_t v65 = sub_10005CCA0();
    }
    uint64_t v286 = 0;
LABEL_74:
    swift_bridgeObjectRelease();
    sub_10005C1C0();
    swift_allocObject();
    sub_10005C1B0();
    sub_10005C190();
    uint64_t v194 = v268;
    sub_100047478(v298, v268, type metadata accessor for CRLSEImportManifest);
    sub_100046FB0(&qword_10007D900, (void (*)(uint64_t))type metadata accessor for CRLSEImportManifest);
    uint64_t v195 = v286;
    uint64_t v196 = sub_10005C1A0();
    unint64_t v198 = v197;
    sub_1000473D4(v194, type metadata accessor for CRLSEImportManifest);
    if (v195)
    {
      uint64_t v286 = v195;
LABEL_76:
      swift_release();
      goto LABEL_78;
    }
    id v199 = v264;
    v280(v264, v265, v39);
    sub_10005C340();
    uint64_t v286 = 0;
    v287(v199, v39);
    uint64_t v213 = v262;
    sub_10001E85C(v263, v262, &qword_10007D8B0);
    uint64_t v214 = type metadata accessor for CRLSEBoardIdentifier(0);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v214 - 8) + 48))(v213, 1, v214) == 1)
    {
      sub_10001E8C0(v213, &qword_10007D8B0);
      v215 = sub_1000440BC();
      id v216 = (void *)sub_100049150((uint64_t)v215);
      swift_bridgeObjectRelease();
      uint64_t v217 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
      uint64_t v218 = (uint64_t)v261;
      id v219 = &v261[*(int *)(v217 + 48)];
      v220 = &v261[*(int *)(v217 + 64)];
      uint64_t v221 = sub_10005C3D0();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v221 - 8) + 16))(v218, v258, v221);
      v222 = (void *)(v263 + *(int *)(type metadata accessor for CRLSEBoard(0) + 20));
      uint64_t v223 = v222[1];
      *(void *)id v219 = *v222;
      *((void *)v219 + 1) = v223;
      swift_bridgeObjectRetain();
      sub_10005C380();
      uint64_t v224 = sub_10005C390();
      (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v224 - 8) + 56))(v220, 0, 1, v224);
      swift_storeEnumTagMultiPayload();
      char v225 = swift_isUniquelyReferenced_nonNull_native();
      v315[0] = v216;
      uint64_t v226 = v259;
      sub_10004585C(v218, v225, v259);
      id v227 = v315[0];
      swift_bridgeObjectRelease();
      sub_10001E8C0(v226, (uint64_t *)&unk_10007D1A0);
      v315[0] = v227;
      sub_1000131E0(&qword_10007D908);
      sub_1000492E0();
      uint64_t v228 = v286;
      uint64_t v229 = sub_10005C1A0();
      id v231 = v230;
      swift_bridgeObjectRelease();
      uint64_t v286 = v228;
      if (v228)
      {
LABEL_84:
        sub_10002D954(v196, v198);
        goto LABEL_76;
      }
      uint64_t v310 = v229;
      id v311 = v231;
      uint64_t v233 = a4 + OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager_containerURL;
      swift_beginAccess();
      uint64_t v234 = v233;
      uint64_t v235 = v257;
      sub_10001E85C(v234, v257, &qword_10007D0E8);
      uint64_t v236 = v267;
      uint64_t v237 = *(unsigned int (**)(void, void, void))(v267 + 48);
      if (v237(v235, 1, v39))
      {
        sub_10001E8C0(v235, &qword_10007D0E8);
        uint64_t v213 = (uint64_t)v256;
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v236 + 56))(v256, 1, 1, v39);
      }
      else
      {
        v280(v291, v235, v39);
        sub_10001E8C0(v235, &qword_10007D0E8);
        v315[0] = (id)0xD000000000000013;
        v315[1] = (id)0x80000001000647D0;
        uint64_t v238 = v254;
        uint64_t v239 = v255;
        uint64_t v240 = *(void (**)(char *, void, uint64_t))(v254 + 104);
        v309 = (unsigned int (*)(char *, uint64_t, uint64_t))v237;
        uint64_t v241 = v253;
        v240(v253, enum case for URL.DirectoryHint.inferFromPath(_:), v255);
        sub_1000454B0();
        uint64_t v242 = v256;
        uint64_t v243 = v291;
        sub_10005C2E0();
        uint64_t v244 = v241;
        uint64_t v245 = v267;
        (*(void (**)(char *, uint64_t))(v238 + 8))(v244, v239);
        uint64_t v246 = i;
        swift_bridgeObjectRelease();
        v287(v243, v246);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v245 + 56))(v242, 0, 1, v246);
        uint64_t v213 = (uint64_t)v242;
        if (v309(v242, 1, v246) != 1)
        {
          uint64_t v247 = v252;
          (*(void (**)(char *, uint64_t, uint64_t))(v245 + 32))(v252, v213, v246);
          uint64_t v249 = v310;
          unint64_t v248 = (unint64_t)v311;
          uint64_t v250 = v286;
          sub_10005C340();
          if (v250)
          {
            uint64_t v286 = v250;
            v287(v247, v246);
            sub_10002D954(v249, v248);
            goto LABEL_84;
          }
          v287(v247, v246);
          sub_10002D954(v249, v248);
          sub_10002D954(v196, v198);
          swift_release();
LABEL_91:
          char v212 = 1;
          goto LABEL_81;
        }
      }
      sub_10002D954(v310, (unint64_t)v311);
      sub_10002D954(v196, v198);
      swift_release();
      uint64_t v232 = &qword_10007D0E8;
    }
    else
    {
      sub_10002D954(v196, v198);
      swift_release();
      uint64_t v232 = &qword_10007D8B0;
    }
    sub_10001E8C0(v213, v232);
    goto LABEL_91;
  }
  unsigned __int8 v184 = v64;
  uint64_t v185 = sub_10005C1F0();

  uint64_t v286 = v185;
  swift_willThrow();
LABEL_78:
  if (qword_10007C6D8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  v200 = (void *)static OS_os_log.crlSharingExtension;
  sub_1000131E0(&qword_10007D870);
  uint64_t v201 = swift_initStackObject();
  *(_OWORD *)(v201 + 16) = xmmword_100062290;
  swift_getErrorValue();
  uint64_t v202 = v313;
  uint64_t v203 = v314;
  id v204 = v200;
  uint64_t v205 = Error.publicDescription.getter(v202, v203);
  uint64_t v207 = v206;
  *(void *)(v201 + 56) = &type metadata for String;
  unint64_t v208 = sub_10002D9AC();
  *(void *)(v201 + 64) = v208;
  *(void *)(v201 + 32) = v205;
  *(void *)(v201 + 40) = v207;
  swift_getErrorValue();
  uint64_t v209 = Error.fullDescription.getter(v312);
  *(void *)(v201 + 96) = &type metadata for String;
  *(void *)(v201 + 104) = v208;
  *(void *)(v201 + 72) = v209;
  *(void *)(v201 + 80) = v210;
  uint64_t v211 = sub_10005C9C0();
  sub_100050FE0((uint64_t)v204, (uint64_t)&_mh_execute_header, v211, (uint64_t)"Failed to write sharing extension data with error: %{public}@ <%@>", 66, 2, v201);
  swift_errorRelease();
  swift_setDeallocating();
  sub_1000131E0(&qword_10007D108);
  swift_arrayDestroy();

  char v212 = 0;
LABEL_81:
  *a9 = v212;
}

uint64_t sub_1000436CC(uint64_t a1)
{
  uint64_t v2 = sub_10005C300();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = *(void (**)(char *))(a1 + 32);
  sub_10005C290();
  v6(v5);
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_1000437B0()
{
  uint64_t v1 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1 - 8);
  uint64_t v4 = (char *)v21 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = type metadata accessor for CRLSELibraryViewModeItemNode(0);
  uint64_t v5 = *(void *)(v24 - 8);
  __chkstk_darwin(v24);
  uint64_t v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000131E0((uint64_t *)&unk_10007D6F0);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000440BC();
  int64_t v12 = v11[2];
  if (v12)
  {
    uint64_t v22 = v10;
    uint64_t v23 = v0;
    uint64_t v25 = _swiftEmptyArrayStorage;
    sub_100045504(0, v12, 0);
    uint64_t v13 = *(unsigned __int8 *)(v2 + 80);
    v21[1] = v11;
    uint64_t v14 = (uint64_t)v11 + ((v13 + 32) & ~v13);
    uint64_t v15 = *(void *)(v2 + 72);
    uint64_t v16 = v25;
    do
    {
      sub_100047478(v14, (uint64_t)v4, type metadata accessor for CRLSELibraryViewModel.Item);
      sub_100047478((uint64_t)v4, (uint64_t)v7, type metadata accessor for CRLSELibraryViewModel.Item);
      *(void *)&v7[*(int *)(v24 + 20)] = _swiftEmptyArrayStorage;
      sub_1000473D4((uint64_t)v4, type metadata accessor for CRLSELibraryViewModel.Item);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_100045504(0, v16[2] + 1, 1);
        uint64_t v16 = v25;
      }
      unint64_t v18 = v16[2];
      unint64_t v17 = v16[3];
      if (v18 >= v17 >> 1)
      {
        sub_100045504(v17 > 1, v18 + 1, 1);
        uint64_t v16 = v25;
      }
      v16[2] = v18 + 1;
      sub_100049384((uint64_t)v7, (uint64_t)v16+ ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80))+ *(void *)(v5 + 72) * v18, type metadata accessor for CRLSELibraryViewModeItemNode);
      v14 += v15;
      --v12;
    }
    while (v12);
    swift_bridgeObjectRelease();
    uint64_t v10 = v22;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v16 = _swiftEmptyArrayStorage;
  }
  sub_100043AD4((uint64_t)v10);
  type metadata accessor for CRLSELibrary();
  swift_allocObject();
  uint64_t v19 = sub_10005A3C8((uint64_t)v10, (size_t)v16);
  swift_bridgeObjectRelease();
  return v19;
}

uint64_t sub_100043AD4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v29 = a1;
  uint64_t v2 = sub_10005C230();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000131E0(&qword_10007D0E8);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10005C300();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v28 - v14;
  uint64_t v16 = v1 + OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager_containerURL;
  swift_beginAccess();
  sub_10001E85C(v16, (uint64_t)v8, &qword_10007D0E8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_10001E8C0((uint64_t)v8, &qword_10007D0E8);
    uint64_t v20 = type metadata accessor for CRLSELibraryViewModeItemNode(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v29, 1, 1, v20);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v15, v8, v9);
    sub_10005C180();
    swift_allocObject();
    sub_10005C170();
    strcpy(v30, "Snapshot.plist");
    v30[15] = -18;
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for URL.DirectoryHint.inferFromPath(_:), v2);
    sub_1000454B0();
    sub_10005C2E0();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    swift_bridgeObjectRelease();
    uint64_t v17 = sub_10005C310();
    unint64_t v19 = v18;
    sub_1000131E0(&qword_10007CC88);
    sub_100046FF8();
    sub_10005C160();
    uint64_t v28 = *(void *)v30;
    uint64_t v22 = *(void *)(*(void *)v30 + 16);
    uint64_t v23 = type metadata accessor for CRLSELibraryViewModeItemNode(0);
    uint64_t v24 = *(void *)(v23 - 8);
    if (v22)
    {
      uint64_t v25 = v29;
      sub_100047478(v28+ ((*(unsigned __int8 *)(*(void *)(v23 - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(void *)(v23 - 8) + 80)), v29, type metadata accessor for CRLSELibraryViewModeItemNode);
      uint64_t v26 = 0;
    }
    else
    {
      uint64_t v26 = 1;
      uint64_t v25 = v29;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v24 + 56))(v25, v26, 1, v23);
    sub_10002D954(v17, v19);
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v27 = *(void (**)(char *, uint64_t))(v10 + 8);
    v27(v13, v9);
    return ((uint64_t (*)(char *, uint64_t))v27)(v15, v9);
  }
}

void *sub_1000440BC()
{
  uint64_t v1 = sub_10005C230();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = &v26[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = sub_1000131E0(&qword_10007D0E8);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = &v26[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = sub_10005C300();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = &v26[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v10);
  uint64_t v14 = &v26[-v13];
  uint64_t v15 = v0 + OBJC_IVAR____TtC24FreeformSharingExtension28CRLSEExtensionContextManager_containerURL;
  swift_beginAccess();
  sub_10001E85C(v15, (uint64_t)v7, &qword_10007D0E8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_10001E8C0((uint64_t)v7, &qword_10007D0E8);
    return &_swiftEmptyArrayStorage;
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v9 + 32))(v14, v7, v8);
  unint64_t v27 = 0xD000000000000013;
  unint64_t v28 = 0x80000001000647D0;
  (*(void (**)(unsigned char *, void, uint64_t))(v2 + 104))(v4, enum case for URL.DirectoryHint.inferFromPath(_:), v1);
  sub_1000454B0();
  sub_10005C2E0();
  (*(void (**)(unsigned char *, uint64_t))(v2 + 8))(v4, v1);
  swift_bridgeObjectRelease();
  id v16 = [self defaultManager];
  sub_10005C2A0(0);
  NSString v17 = sub_10005C7D0();
  swift_bridgeObjectRelease();
  unsigned int v18 = [v16 fileExistsAtPath:v17];

  if (!v18)
  {
    uint64_t v22 = *(void (**)(unsigned char *, uint64_t))(v9 + 8);
    v22(v12, v8);
    v22(v14, v8);
    return &_swiftEmptyArrayStorage;
  }
  sub_10005C180();
  swift_allocObject();
  sub_10005C170();
  uint64_t v19 = sub_10005C310();
  unint64_t v21 = v20;
  sub_1000131E0(&qword_10007D880);
  sub_100046F0C();
  sub_10005C160();
  swift_release();
  sub_10002D954(v19, v21);
  unint64_t v24 = v27;
  uint64_t v25 = *(void (**)(unsigned char *, uint64_t))(v9 + 8);
  v25(v12, v8);
  v25(v14, v8);
  return (void *)v24;
}

uint64_t sub_100044640(uint64_t a1, uint64_t a2)
{
  return sub_10004709C(*(void *)a1, *(void *)(a1 + 8), *(unsigned char *)(a1 + 16), *(void *)a2, *(void *)(a2 + 8), *(unsigned char *)(a2 + 16));
}

uint64_t sub_10004465C()
{
  return sub_10003CF40();
}

uint64_t sub_100044668()
{
  return sub_10003D044(*(void *)v0, *(void *)(v0 + 8), *(unsigned char *)(v0 + 16));
}

uint64_t sub_100044678(uint64_t a1, uint64_t a2)
{
  uint64_t v77 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  __chkstk_darwin(v77);
  uint64_t v5 = (char *)&v68 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for CRLSELibraryViewModeItemNode(0);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v68 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000131E0((uint64_t *)&unk_10007D6F0);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v74 = (uint64_t)&v68 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v68 - v13;
  uint64_t v15 = sub_10005C0B0();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v68 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a2)
  {
    sub_10004545C();
    swift_allocError();
    *(_OWORD *)uint64_t v44 = xmmword_100062960;
LABEL_12:
    *(unsigned char *)(v44 + 16) = 0;
    swift_willThrow();
    return a1;
  }
  uint64_t v70 = v6;
  uint64_t v71 = v7;
  uint64_t v75 = v9;
  unint64_t v76 = v5;
  uint64_t v72 = v14;
  uint64_t v20 = v17;
  swift_bridgeObjectRetain();
  uint64_t v69 = a1;
  uint64_t v73 = a2;
  NSString v21 = sub_10005C7D0();
  id v22 = [v21 crl_stringByFixingBrokenSurrogatePairs];

  uint64_t v23 = sub_10005C810();
  unint64_t v25 = v24;

  unint64_t v79 = v23;
  unint64_t v80 = v25;
  sub_10005C090();
  unint64_t v78 = sub_1000454B0();
  unint64_t v26 = sub_10005CAE0();
  unint64_t v28 = v27;
  uint64_t v29 = *(void (**)(char *, uint64_t))(v16 + 8);
  uint64_t v30 = v20;
  v29(v19, v20);
  swift_bridgeObjectRelease();
  while (1)
  {
    unint64_t v79 = v26;
    unint64_t v80 = v28;
    swift_bridgeObjectRetain();
    sub_10005C0A0();
    unint64_t v31 = sub_10005CAD0();
    unint64_t v33 = v32;
    a1 = v34;
    v29(v19, v30);
    swift_bridgeObjectRelease();
    if (a1) {
      break;
    }
    unint64_t v26 = sub_100044E1C(v31, v33, 32, 0xE100000000000000, v26, v28);
    unint64_t v36 = v35;
    swift_bridgeObjectRelease();
    unint64_t v28 = v36;
  }
  uint64_t v37 = HIBYTE(v28) & 0xF;
  if ((v28 & 0x2000000000000000) == 0) {
    uint64_t v37 = v26 & 0xFFFFFFFFFFFFLL;
  }
  if (!v37)
  {
    swift_bridgeObjectRelease();
    sub_10004545C();
    swift_allocError();
    uint64_t v45 = v73;
    *(void *)uint64_t v44 = v69;
    *(void *)(v44 + 8) = v45;
    goto LABEL_12;
  }
  uint64_t v38 = v26;
  swift_bridgeObjectRelease();
  uint64_t v39 = sub_1000437B0() + OBJC_IVAR____TtC24FreeformSharingExtension12CRLSELibrary_allBoards;
  swift_beginAccess();
  uint64_t v40 = (uint64_t)v72;
  sub_10001E85C(v39, (uint64_t)v72, (uint64_t *)&unk_10007D6F0);
  swift_release();
  uint64_t v41 = v74;
  sub_10001E85C(v40, v74, (uint64_t *)&unk_10007D6F0);
  uint64_t v43 = v70;
  uint64_t v42 = v71;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v71 + 48))(v41, 1, v70) == 1)
  {
    sub_10001E8C0(v41, (uint64_t *)&unk_10007D6F0);
  }
  else
  {
    uint64_t v46 = *(void *)(v41 + *(int *)(v43 + 20));
    swift_bridgeObjectRetain();
    sub_1000473D4(v41, type metadata accessor for CRLSELibraryViewModeItemNode);
    int64_t v47 = *(void *)(v46 + 16);
    if (v47)
    {
      id v81 = _swiftEmptyArrayStorage;
      sub_100045544(0, v47, 0);
      uint64_t v48 = *(unsigned __int8 *)(v42 + 80);
      uint64_t v74 = v46;
      uint64_t v49 = v46 + ((v48 + 32) & ~v48);
      unint64_t v78 = *(void *)(v42 + 72);
      do
      {
        uint64_t v50 = (uint64_t)v75;
        sub_100047478(v49, (uint64_t)v75, type metadata accessor for CRLSELibraryViewModeItemNode);
        uint64_t v51 = (uint64_t)v76;
        sub_100047478(v50, (uint64_t)v76, type metadata accessor for CRLSELibraryViewModel.Item);
        switch(swift_getEnumCaseMultiPayload())
        {
          case 1u:
            uint64_t v52 = sub_100019490();
            goto LABEL_18;
          case 2u:
            uint64_t v56 = sub_1000131E0(&qword_10007D1D0);
            id v57 = (uint64_t *)(v51 + *(int *)(v56 + 48));
            uint64_t v54 = *v57;
            uint64_t v55 = v57[1];
            sub_10001E8C0(v51 + *(int *)(v56 + 80), (uint64_t *)&unk_10007D850);
            sub_1000473D4(v51, type metadata accessor for CRLSEBoardIdentifier);
            break;
          case 3u:
            uint64_t v58 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
            uint64_t v59 = (uint64_t *)(v51 + *(int *)(v58 + 48));
            uint64_t v54 = *v59;
            uint64_t v55 = v59[1];
            sub_10001E8C0(v51 + *(int *)(v58 + 64), (uint64_t *)&unk_10007D850);
            uint64_t v60 = sub_10005C3D0();
            (*(void (**)(uint64_t, uint64_t))(*(void *)(v60 - 8) + 8))(v51, v60);
            break;
          default:
            uint64_t v52 = sub_1000192A0();
LABEL_18:
            uint64_t v54 = v52;
            uint64_t v55 = v53;
            break;
        }
        sub_1000473D4(v50, type metadata accessor for CRLSELibraryViewModeItemNode);
        uint64_t v61 = v81;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_100045544(0, v61[2] + 1, 1);
          uint64_t v61 = v81;
        }
        unint64_t v63 = v61[2];
        unint64_t v62 = v61[3];
        if (v63 >= v62 >> 1)
        {
          sub_100045544((char *)(v62 > 1), v63 + 1, 1);
          uint64_t v61 = v81;
        }
        v61[2] = v63 + 1;
        id v64 = &v61[2 * v63];
        v64[4] = v54;
        v64[5] = v55;
        v49 += v78;
        --v47;
      }
      while (v47);
      swift_bridgeObjectRelease();
      uint64_t v40 = (uint64_t)v72;
      goto LABEL_29;
    }
    swift_bridgeObjectRelease();
  }
  uint64_t v61 = _swiftEmptyArrayStorage;
LABEL_29:
  a1 = v38;
  char v65 = sub_10003FE8C(v38, v28, v61);
  swift_bridgeObjectRelease();
  if (v65)
  {
    sub_10004545C();
    swift_allocError();
    *(void *)uint64_t v66 = v38;
    *(void *)(v66 + 8) = v28;
    *(unsigned char *)(v66 + 16) = 1;
    swift_willThrow();
  }
  sub_10001E8C0(v40, (uint64_t *)&unk_10007D6F0);
  return a1;
}

Swift::Int sub_100044E1C(unint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6)
{
  swift_bridgeObjectRetain();
  sub_10005CAC0();
  uint64_t v13 = v12;
  swift_bridgeObjectRelease();
  if ((v13 & 0x1000000000000000) != 0) {
    goto LABEL_25;
  }
  swift_bridgeObjectRetain();
  sub_10005CAC0();
  uint64_t v15 = v14;
  Swift::Int result = swift_bridgeObjectRelease();
  if ((v15 & 0x1000000000000000) != 0) {
    goto LABEL_25;
  }
  uint64_t v17 = (a5 >> 59) & 1;
  if ((a6 & 0x1000000000000000) == 0) {
    LOBYTE(v17) = 1;
  }
  uint64_t v18 = 4 << v17;
  unint64_t v19 = a1;
  if ((a1 & 0xC) == 4 << v17)
  {
    Swift::Int result = sub_100046E90(a1, a5, a6);
    unint64_t v19 = result;
  }
  uint64_t v40 = a3;
  unint64_t v20 = a2;
  unint64_t v21 = a5 & 0x800000000000000;
  if ((a6 & 0x1000000000000000) != 0)
  {
    uint64_t v23 = a6 & 0x2000000000000000;
    uint64_t v25 = a5 & 0xFFFFFFFFFFFFLL;
    unint64_t v24 = HIBYTE(a6) & 0xF;
    if ((a6 & 0x2000000000000000) != 0) {
      unint64_t v32 = HIBYTE(a6) & 0xF;
    }
    else {
      unint64_t v32 = a5 & 0xFFFFFFFFFFFFLL;
    }
    if (v32 < v19 >> 16) {
      goto LABEL_43;
    }
    Swift::Int result = sub_10005C8B0();
    Swift::Int v22 = result;
    if (v21) {
      uint64_t v26 = 7;
    }
    else {
      uint64_t v26 = 11;
    }
  }
  else
  {
    Swift::Int v22 = v19 >> 16;
    uint64_t v23 = a6 & 0x2000000000000000;
    unint64_t v24 = HIBYTE(a6) & 0xF;
    uint64_t v25 = a5 & 0xFFFFFFFFFFFFLL;
    uint64_t v26 = 7;
  }
  if (!v23) {
    unint64_t v24 = v25;
  }
  uint64_t v27 = 4 << (v21 >> 59);
  unint64_t v28 = v26 | (v24 << 16);
  a2 = v20;
  if ((a6 & 0x1000000000000000) == 0) {
    uint64_t v27 = 8;
  }
  unint64_t v29 = v20;
  if ((v20 & 0xC) == v27)
  {
    unsigned __int16 v33 = v20;
    Swift::Int v34 = v22;
    Swift::Int result = sub_100046E90(v33, a5, a6);
    Swift::Int v22 = v34;
    unint64_t v29 = result;
  }
  if ((v26 & 0xC) == v18)
  {
    unsigned __int16 v35 = v26;
    Swift::Int v36 = v22;
    Swift::Int result = sub_100046E90(v35, a5, a6);
    Swift::Int v22 = v36;
    unint64_t v28 = result;
    if ((a6 & 0x1000000000000000) == 0)
    {
LABEL_17:
      uint64_t v30 = (v28 >> 16) - (v29 >> 16);
      if ((a4 & 0x1000000000000000) == 0) {
        goto LABEL_18;
      }
      goto LABEL_37;
    }
  }
  else if ((a6 & 0x1000000000000000) == 0)
  {
    goto LABEL_17;
  }
  if (v24 < v29 >> 16)
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  if (v24 >= v28 >> 16)
  {
    Swift::Int v37 = v22;
    uint64_t v38 = sub_10005C8B0();
    Swift::Int v22 = v37;
    uint64_t v30 = v38;
    if ((a4 & 0x1000000000000000) == 0)
    {
LABEL_18:
      if ((a4 & 0x2000000000000000) != 0)
      {
        Swift::Int result = HIBYTE(a4) & 0xF;
        Swift::Int v31 = v22 + result;
        if (!__OFADD__(v22, result)) {
          goto LABEL_23;
        }
      }
      else
      {
        Swift::Int result = v40 & 0xFFFFFFFFFFFFLL;
        Swift::Int v31 = v22 + (v40 & 0xFFFFFFFFFFFFLL);
        if (!__OFADD__(v22, v40 & 0xFFFFFFFFFFFFLL)) {
          goto LABEL_23;
        }
      }
      goto LABEL_39;
    }
LABEL_37:
    Swift::Int v39 = v22;
    Swift::Int result = sub_10005C890();
    Swift::Int v31 = v39 + result;
    if (!__OFADD__(v39, result))
    {
LABEL_23:
      Swift::Int result = v31 + v30;
      if (!__OFADD__(v31, v30))
      {
        sub_10005C840(result);
LABEL_25:
        sub_10005C8D0();
        sub_100045564();
        sub_10005C870();
        swift_bridgeObjectRelease();
        sub_10005C870();
        sub_100046E44(a2, a5, a6);
        sub_10005C870();
        swift_bridgeObjectRelease();
        return 0;
      }
      goto LABEL_40;
    }
LABEL_39:
    __break(1u);
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
  return result;
}

id sub_10004525C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CRLSEExtensionContextManager();
  [super dealloc];
}

uint64_t sub_100045314()
{
  return type metadata accessor for CRLSEExtensionContextManager();
}

uint64_t type metadata accessor for CRLSEExtensionContextManager()
{
  uint64_t result = qword_10007D820;
  if (!qword_10007D820) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100045368()
{
  sub_100045404();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_100045404()
{
  if (!qword_10007D588)
  {
    sub_10005C300();
    unint64_t v0 = sub_10005CAB0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10007D588);
    }
  }
}

unint64_t sub_10004545C()
{
  unint64_t result = qword_10007D838;
  if (!qword_10007D838)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D838);
  }
  return result;
}

unint64_t sub_1000454B0()
{
  unint64_t result = qword_10007D840;
  if (!qword_10007D840)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D840);
  }
  return result;
}

size_t sub_100045504(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_100053958(a1, a2, a3, (void *)*v3);
  size_t *v3 = result;
  return result;
}

char *sub_100045524(char *a1, int64_t a2, char a3)
{
  size_t result = sub_100053978(a1, a2, a3, *v3);
  size_t *v3 = result;
  return result;
}

char *sub_100045544(char *a1, int64_t a2, char a3)
{
  size_t result = sub_100053A80(a1, a2, a3, *v3);
  size_t *v3 = result;
  return result;
}

unint64_t sub_100045564()
{
  unint64_t result = qword_10007D860;
  if (!qword_10007D860)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D860);
  }
  return result;
}

size_t sub_1000455B8(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_100053B84(a1, a2, a3, (void *)*v3);
  size_t *v3 = result;
  return result;
}

uint64_t sub_1000455D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6 - 8);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *v2;
  sub_10005CE50();
  swift_bridgeObjectRetain();
  sub_100018D98();
  Swift::Int v11 = sub_10005CE70();
  uint64_t v12 = -1 << *(unsigned char *)(v10 + 32);
  unint64_t v13 = v11 & ~v12;
  if ((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13))
  {
    uint64_t v19 = a1;
    uint64_t v14 = ~v12;
    uint64_t v15 = *(void *)(v7 + 72);
    while (1)
    {
      sub_100047478(*(void *)(v10 + 48) + v15 * v13, (uint64_t)v9, type metadata accessor for CRLSELibraryViewModel.Item);
      char v16 = sub_10001D61C((uint64_t)v9, a2);
      sub_1000473D4((uint64_t)v9, type metadata accessor for CRLSELibraryViewModel.Item);
      if (v16) {
        break;
      }
      unint64_t v13 = (v13 + 1) & v14;
      if (((*(void *)(v10 + 56 + ((v13 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v13) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        a1 = v19;
        goto LABEL_7;
      }
    }
    swift_bridgeObjectRelease();
    sub_1000473D4(a2, type metadata accessor for CRLSELibraryViewModel.Item);
    sub_100047478(*(void *)(*v3 + 48) + v15 * v13, v19, type metadata accessor for CRLSELibraryViewModel.Item);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
LABEL_7:
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_100047478(a2, (uint64_t)v9, type metadata accessor for CRLSELibraryViewModel.Item);
    uint64_t v20 = *v3;
    void *v3 = 0x8000000000000000;
    sub_100046BF4((uint64_t)v9, v13, isUniquelyReferenced_nonNull_native);
    void *v3 = v20;
    swift_bridgeObjectRelease();
    sub_100049384(a2, a1, type metadata accessor for CRLSELibraryViewModel.Item);
    return 1;
  }
}

uint64_t sub_10004585C@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v42 = a3;
  uint64_t v41 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  uint64_t v6 = *(void *)(v41 - 8);
  __chkstk_darwin(v41);
  uint64_t v8 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v43 = v3;
  uint64_t v9 = *v3;
  sub_10005CE50();
  sub_100018D98();
  Swift::Int v10 = sub_10005CE70();
  uint64_t v11 = -1 << *(unsigned char *)(v9 + 32);
  unint64_t v12 = v10 & ~v11;
  if ((*(void *)(v9 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12))
  {
    uint64_t v13 = ~v11;
    uint64_t v14 = v6;
    uint64_t v15 = *(void *)(v6 + 72);
    do
    {
      sub_100047478(*(void *)(v9 + 48) + v15 * v12, (uint64_t)v8, type metadata accessor for CRLSELibraryViewModel.Item);
      char v16 = sub_10001D61C((uint64_t)v8, a1);
      sub_1000473D4((uint64_t)v8, type metadata accessor for CRLSELibraryViewModel.Item);
      if (v16) {
        break;
      }
      unint64_t v12 = (v12 + 1) & v13;
    }
    while (((*(void *)(v9 + 56 + ((v12 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v12) & 1) != 0);
  }
  else
  {
    uint64_t v14 = v6;
    char v16 = 0;
  }
  uint64_t v17 = v43;
  uint64_t v18 = *(void *)(*v43 + 16);
  BOOL v19 = (v16 & 1) == 0;
  uint64_t v20 = v18 + v19;
  if (__OFADD__(v18, v19))
  {
    __break(1u);
LABEL_31:
    __break(1u);
    goto LABEL_32;
  }
  uint64_t v21 = *(void *)(*v43 + 24);
  if (v21 >= v20 && (a2 & 1) != 0)
  {
    if (v16)
    {
LABEL_11:
      unint64_t v22 = *(void *)(v14 + 72) * v12;
      uint64_t v23 = v42;
LABEL_28:
      uint64_t v37 = *v17;
      sub_100049384(*(void *)(*v17 + 48) + v22, v23, type metadata accessor for CRLSELibraryViewModel.Item);
      sub_100049384(a1, *(void *)(v37 + 48) + v22, type metadata accessor for CRLSELibraryViewModel.Item);
      uint64_t v36 = 0;
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56))(v23, v36, 1, v41);
    }
    goto LABEL_16;
  }
  if (a2)
  {
    sub_100045C30();
  }
  else
  {
    if (v21 >= v20)
    {
      sub_1000462FC();
      if (v16) {
        goto LABEL_11;
      }
LABEL_16:
      unint64_t v24 = v12 >> 6;
      uint64_t v25 = 1 << v12;
      uint64_t v23 = v42;
LABEL_25:
      uint64_t v32 = *v17;
      *(void *)(*v17 + 8 * v24 + 56) |= v25;
      sub_100049384(a1, *(void *)(v32 + 48) + *(void *)(v14 + 72) * v12, type metadata accessor for CRLSELibraryViewModel.Item);
      uint64_t v33 = *(void *)(v32 + 16);
      BOOL v34 = __OFADD__(v33, 1);
      uint64_t v35 = v33 + 1;
      if (!v34)
      {
        *(void *)(v32 + 16) = v35;
        uint64_t v36 = 1;
        return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56))(v23, v36, 1, v41);
      }
      goto LABEL_31;
    }
    sub_100046560();
  }
  uint64_t v26 = *v17;
  sub_10005CE50();
  sub_100018D98();
  Swift::Int v27 = sub_10005CE70();
  uint64_t v28 = -1 << *(unsigned char *)(v26 + 32);
  unint64_t v12 = v27 & ~v28;
  unint64_t v24 = v12 >> 6;
  uint64_t v25 = 1 << v12;
  if (((1 << v12) & *(void *)(v26 + 56 + 8 * (v12 >> 6))) == 0)
  {
    uint64_t v23 = v42;
LABEL_24:
    uint64_t v17 = v43;
    if (v16) {
      goto LABEL_32;
    }
    goto LABEL_25;
  }
  uint64_t v29 = ~v28;
  uint64_t v40 = v14;
  uint64_t v30 = *(void *)(v14 + 72);
  while (1)
  {
    unint64_t v22 = v30 * v12;
    sub_100047478(*(void *)(v26 + 48) + v30 * v12, (uint64_t)v8, type metadata accessor for CRLSELibraryViewModel.Item);
    char v31 = sub_10001D61C((uint64_t)v8, a1);
    sub_1000473D4((uint64_t)v8, type metadata accessor for CRLSELibraryViewModel.Item);
    if (v31) {
      break;
    }
    unint64_t v12 = (v12 + 1) & v29;
    unint64_t v24 = v12 >> 6;
    uint64_t v25 = 1 << v12;
    if ((*(void *)(v26 + 56 + 8 * (v12 >> 6)) & (1 << v12)) == 0)
    {
      uint64_t v23 = v42;
      uint64_t v14 = v40;
      goto LABEL_24;
    }
  }
  uint64_t v23 = v42;
  uint64_t v17 = v43;
  uint64_t v14 = v40;
  if (v16) {
    goto LABEL_28;
  }
LABEL_32:
  uint64_t result = sub_10005CE00();
  __break(1u);
  return result;
}

uint64_t sub_100045C30()
{
  uint64_t v1 = v0;
  uint64_t v56 = sub_10005C3D0();
  uint64_t v2 = *(void *)(v56 - 8);
  __chkstk_darwin(v56);
  uint64_t v52 = (char *)&v47 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for CRLSEBoardIdentifier(0);
  __chkstk_darwin(v4 - 8);
  uint64_t v51 = (uint64_t)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  uint64_t v59 = *(void *)(v6 - 8);
  uint64_t v60 = v6;
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v9 = (unsigned __int8 *)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v47 - v10;
  uint64_t v12 = *v0;
  sub_1000131E0(&qword_10007D928);
  uint64_t v13 = sub_10005CB80();
  uint64_t v14 = v13;
  if (!*(void *)(v12 + 16)) {
    goto LABEL_42;
  }
  uint64_t v48 = v0;
  char v15 = *(unsigned char *)(v12 + 32);
  uint64_t v16 = *(void *)(v12 + 56);
  uint64_t v58 = (void *)(v12 + 56);
  uint64_t v17 = 1 << v15;
  if (v17 < 64) {
    uint64_t v18 = ~(-1 << v17);
  }
  else {
    uint64_t v18 = -1;
  }
  unint64_t v19 = v18 & v16;
  uint64_t v54 = v9 + 8;
  int64_t v57 = (unint64_t)(v17 + 63) >> 6;
  uint64_t v49 = (void (**)(char *, uint64_t))(v2 + 8);
  uint64_t v50 = (void (**)(char *, unsigned __int8 *, uint64_t))(v2 + 32);
  uint64_t v20 = v13 + 56;
  swift_retain();
  int64_t v21 = 0;
  uint64_t v55 = v12;
  while (1)
  {
    if (v19)
    {
      unint64_t v23 = __clz(__rbit64(v19));
      v19 &= v19 - 1;
      unint64_t v24 = v23 | (v21 << 6);
      goto LABEL_24;
    }
    int64_t v25 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      goto LABEL_43;
    }
    if (v25 >= v57) {
      break;
    }
    unint64_t v26 = v58[v25];
    ++v21;
    if (!v26)
    {
      int64_t v21 = v25 + 1;
      if (v25 + 1 >= v57) {
        break;
      }
      unint64_t v26 = v58[v21];
      if (!v26)
      {
        int64_t v21 = v25 + 2;
        if (v25 + 2 >= v57) {
          break;
        }
        unint64_t v26 = v58[v21];
        if (!v26)
        {
          int64_t v27 = v25 + 3;
          if (v27 >= v57) {
            break;
          }
          unint64_t v26 = v58[v27];
          if (!v26)
          {
            while (1)
            {
              int64_t v21 = v27 + 1;
              if (__OFADD__(v27, 1)) {
                goto LABEL_44;
              }
              if (v21 >= v57) {
                goto LABEL_38;
              }
              unint64_t v26 = v58[v21];
              ++v27;
              if (v26) {
                goto LABEL_23;
              }
            }
          }
          int64_t v21 = v27;
        }
      }
    }
LABEL_23:
    unint64_t v19 = (v26 - 1) & v26;
    unint64_t v24 = __clz(__rbit64(v26)) + (v21 << 6);
LABEL_24:
    uint64_t v28 = *(void *)(v59 + 72);
    sub_100049384(*(void *)(v12 + 48) + v28 * v24, (uint64_t)v11, type metadata accessor for CRLSELibraryViewModel.Item);
    sub_10005CE50();
    sub_100047478((uint64_t)v11, (uint64_t)v9, type metadata accessor for CRLSELibraryViewModel.Item);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 2u:
        uint64_t v29 = sub_1000131E0(&qword_10007D1D0);
        swift_bridgeObjectRelease();
        uint64_t v53 = &v9[*(int *)(v29 + 80)];
        uint64_t v30 = v51;
        sub_100049384((uint64_t)v9, v51, type metadata accessor for CRLSEBoardIdentifier);
        sub_100046FB0((unint64_t *)&unk_10007D930, (void (*)(uint64_t))&type metadata accessor for UUID);
        sub_10005C7A0();
        type metadata accessor for CRLSEBoardIdentifierStorage(0);
        swift_bridgeObjectRetain();
        sub_10005C850();
        swift_bridgeObjectRelease();
        sub_1000473D4(v30, type metadata accessor for CRLSEBoardIdentifier);
        uint64_t v31 = (uint64_t)v53;
        uint64_t v12 = v55;
        goto LABEL_28;
      case 3u:
        uint64_t v32 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
        swift_bridgeObjectRelease();
        uint64_t v33 = &v9[*(int *)(v32 + 64)];
        BOOL v34 = v52;
        uint64_t v35 = v56;
        (*v50)(v52, v9, v56);
        sub_100046FB0((unint64_t *)&unk_10007D930, (void (*)(uint64_t))&type metadata accessor for UUID);
        sub_10005C7A0();
        uint64_t v36 = v35;
        uint64_t v12 = v55;
        (*v49)(v34, v36);
        uint64_t v31 = (uint64_t)v33;
LABEL_28:
        sub_10001E8C0(v31, (uint64_t *)&unk_10007D850);
        break;
      default:
        sub_10005CE60(*v9);
        break;
    }
    Swift::Int v37 = sub_10005CE70();
    uint64_t v38 = -1 << *(unsigned char *)(v14 + 32);
    unint64_t v39 = v37 & ~v38;
    unint64_t v40 = v39 >> 6;
    if (((-1 << v39) & ~*(void *)(v20 + 8 * (v39 >> 6))) != 0)
    {
      unint64_t v22 = __clz(__rbit64((-1 << v39) & ~*(void *)(v20 + 8 * (v39 >> 6)))) | v39 & 0x7FFFFFFFFFFFFFC0;
      goto LABEL_7;
    }
    char v41 = 0;
    unint64_t v42 = (unint64_t)(63 - v38) >> 6;
    do
    {
      if (++v40 == v42 && (v41 & 1) != 0)
      {
        __break(1u);
LABEL_43:
        __break(1u);
LABEL_44:
        __break(1u);
        JUMPOUT(0x1000462ECLL);
      }
      BOOL v43 = v40 == v42;
      if (v40 == v42) {
        unint64_t v40 = 0;
      }
      v41 |= v43;
      uint64_t v44 = *(void *)(v20 + 8 * v40);
    }
    while (v44 == -1);
    unint64_t v22 = __clz(__rbit64(~v44)) + (v40 << 6);
LABEL_7:
    *(void *)(v20 + ((v22 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v22;
    sub_100049384((uint64_t)v11, *(void *)(v14 + 48) + v22 * v28, type metadata accessor for CRLSELibraryViewModel.Item);
    ++*(void *)(v14 + 16);
  }
LABEL_38:
  swift_release();
  uint64_t v1 = v48;
  uint64_t v45 = 1 << *(unsigned char *)(v12 + 32);
  if (v45 > 63) {
    bzero(v58, ((unint64_t)(v45 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    *uint64_t v58 = -1 << v45;
  }
  *(void *)(v12 + 16) = 0;
LABEL_42:
  uint64_t result = swift_release();
  *uint64_t v1 = v14;
  return result;
}

void *sub_1000462FC()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000131E0(&qword_10007D928);
  uint64_t v6 = *v0;
  uint64_t v7 = sub_10005CB70();
  uint64_t v8 = v7;
  if (!*(void *)(v6 + 16))
  {
LABEL_25:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v8;
    return result;
  }
  uint64_t result = (void *)(v7 + 56);
  uint64_t v10 = v6 + 56;
  unint64_t v11 = (unint64_t)((1 << *(unsigned char *)(v8 + 32)) + 63) >> 6;
  if (v8 != v6 || (unint64_t)result >= v10 + 8 * v11) {
    uint64_t result = memmove(result, (const void *)(v6 + 56), 8 * v11);
  }
  int64_t v12 = 0;
  *(void *)(v8 + 16) = *(void *)(v6 + 16);
  uint64_t v13 = 1 << *(unsigned char *)(v6 + 32);
  uint64_t v14 = -1;
  if (v13 < 64) {
    uint64_t v14 = ~(-1 << v13);
  }
  unint64_t v15 = v14 & *(void *)(v6 + 56);
  int64_t v16 = (unint64_t)(v13 + 63) >> 6;
  while (1)
  {
    if (v15)
    {
      unint64_t v17 = __clz(__rbit64(v15));
      v15 &= v15 - 1;
      unint64_t v18 = v17 | (v12 << 6);
      goto LABEL_9;
    }
    int64_t v20 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v20 >= v16) {
      goto LABEL_25;
    }
    unint64_t v21 = *(void *)(v10 + 8 * v20);
    ++v12;
    if (!v21)
    {
      int64_t v12 = v20 + 1;
      if (v20 + 1 >= v16) {
        goto LABEL_25;
      }
      unint64_t v21 = *(void *)(v10 + 8 * v12);
      if (!v21)
      {
        int64_t v12 = v20 + 2;
        if (v20 + 2 >= v16) {
          goto LABEL_25;
        }
        unint64_t v21 = *(void *)(v10 + 8 * v12);
        if (!v21) {
          break;
        }
      }
    }
LABEL_24:
    unint64_t v15 = (v21 - 1) & v21;
    unint64_t v18 = __clz(__rbit64(v21)) + (v12 << 6);
LABEL_9:
    unint64_t v19 = *(void *)(v3 + 72) * v18;
    sub_100047478(*(void *)(v6 + 48) + v19, (uint64_t)v5, type metadata accessor for CRLSELibraryViewModel.Item);
    uint64_t result = (void *)sub_100049384((uint64_t)v5, *(void *)(v8 + 48) + v19, type metadata accessor for CRLSELibraryViewModel.Item);
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v16) {
    goto LABEL_25;
  }
  unint64_t v21 = *(void *)(v10 + 8 * v22);
  if (v21)
  {
    int64_t v12 = v22;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v12 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v12 >= v16) {
      goto LABEL_25;
    }
    unint64_t v21 = *(void *)(v10 + 8 * v12);
    ++v22;
    if (v21) {
      goto LABEL_24;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_100046560()
{
  uint64_t v1 = v0;
  uint64_t v56 = sub_10005C3D0();
  uint64_t v2 = *(void *)(v56 - 8);
  __chkstk_darwin(v56);
  uint64_t v51 = (char *)&v46 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for CRLSEBoardIdentifier(0);
  __chkstk_darwin(v4 - 8);
  uint64_t v50 = (uint64_t)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  uint64_t v59 = *(void *)(v6 - 8);
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v9 = (unsigned __int8 *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  unint64_t v11 = (char *)&v46 - v10;
  uint64_t v12 = *v0;
  sub_1000131E0(&qword_10007D928);
  uint64_t v13 = sub_10005CB80();
  uint64_t v14 = v13;
  if (!*(void *)(v12 + 16))
  {
    uint64_t result = swift_release();
    goto LABEL_40;
  }
  uint64_t v47 = v0;
  char v15 = *(unsigned char *)(v12 + 32);
  uint64_t v16 = *(void *)(v12 + 56);
  uint64_t v57 = v12 + 56;
  uint64_t v17 = 1 << v15;
  if (v17 < 64) {
    uint64_t v18 = ~(-1 << v17);
  }
  else {
    uint64_t v18 = -1;
  }
  unint64_t v19 = v18 & v16;
  uint64_t v53 = v9 + 8;
  int64_t v58 = (unint64_t)(v17 + 63) >> 6;
  uint64_t v48 = (void (**)(char *, uint64_t))(v2 + 8);
  uint64_t v49 = (void (**)(char *, unsigned __int8 *, uint64_t))(v2 + 32);
  uint64_t v20 = v13 + 56;
  swift_retain();
  int64_t v21 = 0;
  uint64_t v54 = v12;
  uint64_t v55 = v6;
  uint64_t v22 = v12;
  while (1)
  {
    if (v19)
    {
      unint64_t v24 = __clz(__rbit64(v19));
      v19 &= v19 - 1;
      unint64_t v25 = v24 | (v21 << 6);
      goto LABEL_24;
    }
    int64_t v26 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      goto LABEL_41;
    }
    if (v26 >= v58) {
      break;
    }
    unint64_t v27 = *(void *)(v57 + 8 * v26);
    ++v21;
    if (!v27)
    {
      int64_t v21 = v26 + 1;
      if (v26 + 1 >= v58) {
        break;
      }
      unint64_t v27 = *(void *)(v57 + 8 * v21);
      if (!v27)
      {
        int64_t v21 = v26 + 2;
        if (v26 + 2 >= v58) {
          break;
        }
        unint64_t v27 = *(void *)(v57 + 8 * v21);
        if (!v27)
        {
          int64_t v28 = v26 + 3;
          if (v28 >= v58) {
            break;
          }
          unint64_t v27 = *(void *)(v57 + 8 * v28);
          if (!v27)
          {
            while (1)
            {
              int64_t v21 = v28 + 1;
              if (__OFADD__(v28, 1)) {
                goto LABEL_42;
              }
              if (v21 >= v58) {
                goto LABEL_38;
              }
              unint64_t v27 = *(void *)(v57 + 8 * v21);
              ++v28;
              if (v27) {
                goto LABEL_23;
              }
            }
          }
          int64_t v21 = v28;
        }
      }
    }
LABEL_23:
    unint64_t v19 = (v27 - 1) & v27;
    unint64_t v25 = __clz(__rbit64(v27)) + (v21 << 6);
LABEL_24:
    uint64_t v29 = *(void *)(v59 + 72);
    sub_100047478(*(void *)(v22 + 48) + v29 * v25, (uint64_t)v11, type metadata accessor for CRLSELibraryViewModel.Item);
    sub_10005CE50();
    sub_100047478((uint64_t)v11, (uint64_t)v9, type metadata accessor for CRLSELibraryViewModel.Item);
    switch(swift_getEnumCaseMultiPayload())
    {
      case 2u:
        uint64_t v30 = sub_1000131E0(&qword_10007D1D0);
        swift_bridgeObjectRelease();
        uint64_t v52 = &v9[*(int *)(v30 + 80)];
        uint64_t v31 = v50;
        sub_100049384((uint64_t)v9, v50, type metadata accessor for CRLSEBoardIdentifier);
        sub_100046FB0((unint64_t *)&unk_10007D930, (void (*)(uint64_t))&type metadata accessor for UUID);
        sub_10005C7A0();
        type metadata accessor for CRLSEBoardIdentifierStorage(0);
        swift_bridgeObjectRetain();
        sub_10005C850();
        uint64_t v22 = v54;
        swift_bridgeObjectRelease();
        sub_1000473D4(v31, type metadata accessor for CRLSEBoardIdentifier);
        uint64_t v32 = (uint64_t)v52;
        goto LABEL_28;
      case 3u:
        uint64_t v33 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
        swift_bridgeObjectRelease();
        BOOL v34 = &v9[*(int *)(v33 + 64)];
        uint64_t v35 = v51;
        uint64_t v36 = v56;
        (*v49)(v51, v9, v56);
        sub_100046FB0((unint64_t *)&unk_10007D930, (void (*)(uint64_t))&type metadata accessor for UUID);
        sub_10005C7A0();
        (*v48)(v35, v36);
        uint64_t v32 = (uint64_t)v34;
        uint64_t v22 = v54;
LABEL_28:
        sub_10001E8C0(v32, (uint64_t *)&unk_10007D850);
        break;
      default:
        sub_10005CE60(*v9);
        break;
    }
    Swift::Int v37 = sub_10005CE70();
    uint64_t v38 = -1 << *(unsigned char *)(v14 + 32);
    unint64_t v39 = v37 & ~v38;
    unint64_t v40 = v39 >> 6;
    if (((-1 << v39) & ~*(void *)(v20 + 8 * (v39 >> 6))) != 0)
    {
      unint64_t v23 = __clz(__rbit64((-1 << v39) & ~*(void *)(v20 + 8 * (v39 >> 6)))) | v39 & 0x7FFFFFFFFFFFFFC0;
      goto LABEL_7;
    }
    char v41 = 0;
    unint64_t v42 = (unint64_t)(63 - v38) >> 6;
    do
    {
      if (++v40 == v42 && (v41 & 1) != 0)
      {
        __break(1u);
LABEL_41:
        __break(1u);
LABEL_42:
        __break(1u);
        JUMPOUT(0x100046BE4);
      }
      BOOL v43 = v40 == v42;
      if (v40 == v42) {
        unint64_t v40 = 0;
      }
      v41 |= v43;
      uint64_t v44 = *(void *)(v20 + 8 * v40);
    }
    while (v44 == -1);
    unint64_t v23 = __clz(__rbit64(~v44)) + (v40 << 6);
LABEL_7:
    *(void *)(v20 + ((v23 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v23;
    sub_100049384((uint64_t)v11, *(void *)(v14 + 48) + v23 * v29, type metadata accessor for CRLSELibraryViewModel.Item);
    ++*(void *)(v14 + 16);
  }
LABEL_38:
  uint64_t result = swift_release_n();
  uint64_t v1 = v47;
LABEL_40:
  *uint64_t v1 = v14;
  return result;
}

uint64_t sub_100046BF4(uint64_t a1, unint64_t a2, char a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  unint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v12 = *(void *)(*v4 + 16);
  unint64_t v13 = *(void *)(*v4 + 24);
  if (v13 > v12 && (a3 & 1) != 0)
  {
LABEL_13:
    uint64_t v14 = v9;
    goto LABEL_14;
  }
  if (a3)
  {
    sub_100045C30();
    goto LABEL_8;
  }
  if (v13 <= v12)
  {
    sub_100046560();
LABEL_8:
    uint64_t v15 = *v4;
    sub_10005CE50();
    sub_100018D98();
    Swift::Int v16 = sub_10005CE70();
    uint64_t v17 = -1 << *(unsigned char *)(v15 + 32);
    a2 = v16 & ~v17;
    if ((*(void *)(v15 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
    {
      uint64_t v26 = v8;
      uint64_t v18 = ~v17;
      uint64_t v14 = v9;
      uint64_t v19 = *(void *)(v9 + 72);
      while (1)
      {
        sub_100047478(*(void *)(v15 + 48) + v19 * a2, (uint64_t)v11, type metadata accessor for CRLSELibraryViewModel.Item);
        char v20 = sub_10001D61C((uint64_t)v11, a1);
        sub_1000473D4((uint64_t)v11, type metadata accessor for CRLSELibraryViewModel.Item);
        if (v20) {
          goto LABEL_17;
        }
        a2 = (a2 + 1) & v18;
        if (((*(void *)(v15 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          goto LABEL_14;
        }
      }
    }
    goto LABEL_13;
  }
  uint64_t v14 = v9;
  sub_1000462FC();
LABEL_14:
  uint64_t v21 = *v4;
  *(void *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t result = sub_100049384(a1, *(void *)(v21 + 48) + *(void *)(v14 + 72) * a2, type metadata accessor for CRLSELibraryViewModel.Item);
  uint64_t v23 = *(void *)(v21 + 16);
  BOOL v24 = __OFADD__(v23, 1);
  uint64_t v25 = v23 + 1;
  if (!v24)
  {
    *(void *)(v21 + 16) = v25;
    return result;
  }
  __break(1u);
LABEL_17:
  uint64_t result = sub_10005CE00();
  __break(1u);
  return result;
}

unint64_t sub_100046E44(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0) {
    uint64_t v3 = a2 & 0xFFFFFFFFFFFFLL;
  }
  if (4 * v3 >= result >> 14) {
    return sub_10005C8D0();
  }
  __break(1u);
  return result;
}

uint64_t sub_100046E90(unsigned __int16 a1, uint64_t a2, uint64_t a3)
{
  char v3 = a1;
  uint64_t v4 = a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    uint64_t v10 = sub_10005C8C0();
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
    uint64_t v5 = sub_10005C8A0();
    uint64_t v6 = v5 + (v4 << 16);
    unint64_t v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    unint64_t v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4) {
      unint64_t v8 = v7;
    }
    return v8 | 8;
  }
}

unint64_t sub_100046F0C()
{
  unint64_t result = qword_10007D888;
  if (!qword_10007D888)
  {
    sub_10001DE60(&qword_10007D880);
    sub_100046FB0((unint64_t *)&unk_10007D890, (void (*)(uint64_t))type metadata accessor for CRLSELibraryViewModel.Item);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D888);
  }
  return result;
}

uint64_t sub_100046FB0(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_100046FF8()
{
  unint64_t result = qword_10007D8A0;
  if (!qword_10007D8A0)
  {
    sub_10001DE60(&qword_10007CC88);
    sub_100046FB0(&qword_10007CC90, (void (*)(uint64_t))type metadata accessor for CRLSELibraryViewModeItemNode);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D8A0);
  }
  return result;
}

uint64_t sub_10004709C(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, char a6)
{
  if (a3)
  {
    if ((a6 & 1) == 0) {
      return 0;
    }
  }
  else if (a6)
  {
    return 0;
  }
  if (a1 == a4 && a2 == a5) {
    return 1;
  }
  else {
    return sub_10005CDF0();
  }
}

uint64_t sub_1000470E0()
{
  uint64_t v1 = type metadata accessor for CRLSEBoard(0);
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 56) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);
  swift_bridgeObjectRelease();

  uint64_t v5 = type metadata accessor for CRLSEBoardIdentifier(0);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 48))(v0 + v3, 1, v5))
  {
    uint64_t v6 = sub_10005C3D0();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v0 + v3, v6);
    type metadata accessor for CRLSEBoardIdentifierStorage(0);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  uint64_t v7 = v0 + v3 + *(int *)(v1 + 24);
  uint64_t v8 = sub_10005C3D0();
  uint64_t v9 = *(void *)(v8 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8)) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v7, v8);
  }

  return _swift_deallocObject(v0, ((((v4 + v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 8, v2 | 7);
}

void sub_1000472D0(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for CRLSEBoard(0) - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v5 = (*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  sub_100041878(a1, *(void *)(v1 + 16), *(void *)(v1 + 24), *(void *)(v1 + 32), *(void *)(v1 + 40), *(void *)(v1 + 48), v1 + v4, *(void *)(v1 + v5), *(char **)(v1 + ((v5 + 15) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t sub_100047384()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100047394()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1000473BC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000473CC()
{
  return swift_release();
}

uint64_t sub_1000473D4(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100047434(unint64_t *a1, unint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10002DBB8(255, a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100047478(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void *sub_1000474E0(unint64_t a1, uint64_t *a2)
{
  uint64_t v2 = a1;
  uint64_t v26 = _swiftEmptyArrayStorage;
  if (a1 >> 62) {
    goto LABEL_37;
  }
  for (uint64_t i = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10); i; uint64_t i = sub_10005CCA0())
  {
    unint64_t v4 = 0;
    uint64_t v23 = v2 & 0xFFFFFFFFFFFFFF8;
    unint64_t v24 = v2 & 0xC000000000000001;
    uint64_t v21 = i;
    uint64_t v22 = v2 + 32;
    while (1)
    {
      if (v24)
      {
        id v5 = (id)sub_10005CBE0();
      }
      else
      {
        if (v4 >= *(void *)(v23 + 16)) {
          goto LABEL_34;
        }
        id v5 = *(id *)(v22 + 8 * v4);
      }
      uint64_t v6 = v5;
      if (__OFADD__(v4++, 1)) {
        goto LABEL_35;
      }
      uint64_t v8 = *a2;
      if ((unint64_t)*a2 >> 62)
      {
        swift_bridgeObjectRetain_n();
        uint64_t v9 = sub_10005CCA0();
        if (!v9) {
          goto LABEL_4;
        }
      }
      else
      {
        uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain_n();
        if (!v9) {
          goto LABEL_4;
        }
      }
      if ((v8 & 0xC000000000000001) != 0) {
        id v10 = (id)sub_10005CBE0();
      }
      else {
        id v10 = *(id *)(v8 + 32);
      }
      uint64_t v11 = v10;
      uint64_t v2 = sub_10002DBB8(0, &qword_10007D120);
      char v12 = sub_10005CAA0();

      if (v12)
      {
LABEL_15:

        swift_bridgeObjectRelease_n();
        goto LABEL_5;
      }
      if (v9 != 1) {
        break;
      }
LABEL_4:
      swift_bridgeObjectRelease_n();
      sub_10005CC20();
      sub_10005CC50();
      sub_10005CC60();
      uint64_t v2 = (uint64_t)&v26;
      sub_10005CC30();
LABEL_5:
      if (v4 == v21) {
        return v26;
      }
    }
    if ((v8 & 0xC000000000000001) != 0)
    {
      uint64_t v13 = 1;
      while (1)
      {
        sub_10005CBE0();
        uint64_t v14 = v13 + 1;
        if (__OFADD__(v13, 1)) {
          break;
        }
        char v15 = sub_10005CAA0();
        swift_unknownObjectRelease();
        if (v15) {
          goto LABEL_15;
        }
        ++v13;
        if (v14 == v9) {
          goto LABEL_4;
        }
      }
      __break(1u);
LABEL_34:
      __break(1u);
LABEL_35:
      __break(1u);
      goto LABEL_36;
    }
    uint64_t v16 = 5;
    while (1)
    {
      uint64_t v17 = v16 - 3;
      if (__OFADD__(v16 - 4, 1)) {
        break;
      }
      id v18 = *(id *)(v8 + 8 * v16);
      char v19 = sub_10005CAA0();

      if (v19) {
        goto LABEL_15;
      }
      ++v16;
      if (v17 == v9) {
        goto LABEL_4;
      }
    }
LABEL_36:
    __break(1u);
LABEL_37:
    ;
  }
  return _swiftEmptyArrayStorage;
}

uint64_t sub_100047784(unint64_t a1, uint64_t a2)
{
  uint64_t v41 = a2;
  uint64_t v4 = sub_10005C300();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v38 = (char *)v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000131E0(&qword_10007D0E8);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  id v10 = (char *)v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  unint64_t v39 = (char *)v32 - v11;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v30 = sub_10005CCA0();
    swift_bridgeObjectRelease();
    uint64_t v44 = v30;
    if (v30) {
      goto LABEL_3;
    }
    return 0;
  }
  uint64_t v44 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v44) {
    return 0;
  }
LABEL_3:
  uint64_t v12 = 0;
  unint64_t v49 = a1 & 0xC000000000000001;
  unint64_t v40 = a1 + 32;
  unint64_t v42 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48);
  BOOL v43 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
  uint64_t v36 = (void (**)(char *, uint64_t))(v5 + 8);
  Swift::Int v37 = (void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v32[1] = v2;
  uint64_t v33 = (uint64_t *)(v41 + 40);
  uint64_t v13 = (uint64_t)v39;
  uint64_t v14 = v44;
  v32[0] = a1;
  BOOL v34 = v10;
  uint64_t v35 = v4;
  while (1)
  {
    if (v49) {
      id v15 = (id)sub_10005CBE0();
    }
    else {
      id v15 = *(id *)(v40 + 8 * v12);
    }
    uint64_t v16 = v15;
    if (!objc_msgSend(v15, "isHTTP", v32[0])) {
      goto LABEL_13;
    }
    id v17 = [v16 url];
    if (v17)
    {
      id v18 = v17;
      sub_10005C290();

      uint64_t v19 = 0;
    }
    else
    {
      uint64_t v19 = 1;
    }
    (*v43)(v10, v19, 1, v4);
    sub_10003C51C((uint64_t)v10, v13, &qword_10007D0E8);
    int v20 = (*v42)(v13, 1, v4);
    uint64_t v14 = v44;
    if (v20)
    {
      sub_10001E8C0(v13, &qword_10007D0E8);
LABEL_13:

      BOOL v21 = __OFADD__(v12++, 1);
      if (v21) {
        goto LABEL_24;
      }
      goto LABEL_14;
    }
    uint64_t v22 = v13;
    uint64_t v23 = v38;
    (*v37)(v38, v22, v4);
    sub_10001E8C0(v22, &qword_10007D0E8);
    uint64_t v24 = sub_10005C260();
    uint64_t v26 = v25;
    (*v36)(v23, v4);
    uint64_t v27 = *(void *)(v41 + 16);
    if (v27) {
      break;
    }

    swift_bridgeObjectRelease();
LABEL_22:
    id v10 = v34;
    uint64_t v4 = v35;
    uint64_t v13 = (uint64_t)v39;
    uint64_t v14 = v44;
    BOOL v21 = __OFADD__(v12++, 1);
    if (v21)
    {
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
LABEL_14:
    if (v12 == v14) {
      return 0;
    }
  }
  sub_1000454B0();
  swift_bridgeObjectRetain();
  int64_t v28 = v33;
  while (1)
  {
    uint64_t v29 = *v28;
    uint64_t v47 = *(v28 - 1);
    uint64_t v48 = v29;
    uint64_t v45 = v24;
    uint64_t v46 = v26;
    if (!sub_10005CAF0()) {
      break;
    }
    v28 += 2;
    if (!--v27)
    {

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_22;
    }
  }
LABEL_25:

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v12;
}

unint64_t sub_100047B7C(unint64_t *a1, uint64_t a2)
{
  uint64_t v65 = sub_10005C300();
  uint64_t v61 = *(void (***)(char *, uint64_t))(v65 - 8);
  __chkstk_darwin(v65);
  uint64_t v6 = (char *)&v55 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000131E0(&qword_10007D0E8);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  id v10 = (char *)&v55 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v55 - v11;
  unint64_t v13 = swift_bridgeObjectRetain();
  uint64_t v14 = a2;
  unint64_t v15 = sub_100047784(v13, a2);
  char v17 = v16;
  swift_bridgeObjectRelease();
  if (!v2)
  {
    uint64_t v66 = v12;
    uint64_t v71 = v10;
    uint64_t v59 = 0;
    uint64_t v60 = v6;
    if (v17)
    {
      if (*a1 >> 62)
      {
        swift_bridgeObjectRetain();
        unint64_t v15 = sub_10005CCA0();
        swift_bridgeObjectRelease();
      }
      else
      {
        return *(void *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
    }
    else
    {
      unint64_t v18 = v15 + 1;
      if (__OFADD__(v15, 1)) {
        goto LABEL_72;
      }
      if (*a1 >> 62)
      {
LABEL_73:
        swift_bridgeObjectRetain();
        uint64_t v54 = sub_10005CCA0();
        swift_bridgeObjectRelease();
        if (v18 != v54) {
          goto LABEL_6;
        }
      }
      else if (v18 != *(void *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
      {
LABEL_6:
        uint64_t v19 = v14;
        unint64_t v63 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v61 + 6);
        id v64 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v61 + 7);
        int v20 = (void (**)(char *, uint64_t, uint64_t))(v61 + 2);
        ++v61;
        unint64_t v62 = a1;
        uint64_t v57 = (uint64_t *)(v14 + 40);
        int64_t v58 = v20;
        BOOL v21 = &selRef_size;
        uint64_t v14 = v65;
        uint64_t v56 = v19;
        while (1)
        {
          unint64_t v22 = *a1;
          if ((*a1 & 0xC000000000000001) != 0)
          {
            id v23 = (id)sub_10005CBE0();
          }
          else
          {
            if ((v18 & 0x8000000000000000) != 0)
            {
              __break(1u);
LABEL_63:
              __break(1u);
LABEL_64:
              __break(1u);
LABEL_65:
              __break(1u);
LABEL_66:
              __break(1u);
LABEL_67:
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
              goto LABEL_73;
            }
            if (v18 >= *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
              goto LABEL_63;
            }
            id v23 = *(id *)(v22 + 8 * v18 + 32);
          }
          uint64_t v24 = v23;
          if (![v23 v21[186]]) {
            break;
          }
          id v25 = [v24 url];
          if (v25)
          {
            uint64_t v26 = v25;
            uint64_t v27 = v14;
            uint64_t v28 = (uint64_t)v71;
            sub_10005C290();

            uint64_t v29 = 0x10007B000;
            uint64_t v30 = 0;
          }
          else
          {
            uint64_t v27 = v14;
            uint64_t v29 = (uint64_t)v21;
            uint64_t v30 = 1;
            uint64_t v28 = (uint64_t)v71;
          }
          (*v64)(v28, v30, 1, v27);
          uint64_t v31 = (uint64_t)v66;
          sub_10003C51C(v28, (uint64_t)v66, &qword_10007D0E8);
          if ((*v63)(v31, 1, v27))
          {
            sub_10001E8C0(v31, &qword_10007D0E8);

            BOOL v21 = (char **)v29;
            uint64_t v14 = v27;
          }
          else
          {
            uint64_t v44 = v60;
            (*v58)(v60, v31, v27);
            sub_10001E8C0(v31, &qword_10007D0E8);
            uint64_t v45 = sub_10005C260();
            uint64_t v46 = v27;
            uint64_t v47 = v45;
            uint64_t v49 = v48;
            (*v61)(v44, v46);
            uint64_t v50 = *(void *)(v19 + 16);
            if (v50)
            {
              sub_1000454B0();
              swift_bridgeObjectRetain();
              uint64_t v51 = v57;
              while (1)
              {
                uint64_t v52 = *v51;
                uint64_t v69 = *(v51 - 1);
                uint64_t v70 = v52;
                uint64_t v67 = v47;
                uint64_t v68 = v49;
                if (!sub_10005CAF0()) {
                  break;
                }
                v51 += 2;
                if (!--v50)
                {

                  swift_bridgeObjectRelease();
                  uint64_t v19 = v56;
                  swift_bridgeObjectRelease();
                  a1 = v62;
                  uint64_t v14 = v65;
                  BOOL v21 = &selRef_size;
                  if (v15 == v18) {
                    goto LABEL_38;
                  }
                  goto LABEL_20;
                }
              }

              swift_bridgeObjectRelease();
              uint64_t v19 = v56;
              swift_bridgeObjectRelease();
              a1 = v62;
              uint64_t v14 = v65;
              BOOL v21 = &selRef_size;
              BOOL v40 = __OFADD__(v18++, 1);
              if (v40) {
                goto LABEL_64;
              }
              goto LABEL_40;
            }

            swift_bridgeObjectRelease();
            uint64_t v14 = v65;
            BOOL v21 = &selRef_size;
          }
          a1 = v62;
          if (v15 != v18) {
            goto LABEL_20;
          }
LABEL_38:
          BOOL v40 = __OFADD__(v15++, 1);
          if (v40) {
            goto LABEL_65;
          }
          BOOL v40 = __OFADD__(v18++, 1);
          if (v40) {
            goto LABEL_64;
          }
LABEL_40:
          uint64_t v41 = v19;
          if (*a1 >> 62)
          {
            swift_bridgeObjectRetain();
            uint64_t v42 = sub_10005CCA0();
            swift_bridgeObjectRelease();
          }
          else
          {
            uint64_t v42 = *(void *)((*a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
          }
          BOOL v43 = v18 == v42;
          uint64_t v19 = v41;
          if (v43) {
            return v15;
          }
        }

        if (v15 == v18) {
          goto LABEL_38;
        }
LABEL_20:
        unint64_t v32 = *a1;
        if ((*a1 & 0xC000000000000001) != 0)
        {
          id v33 = (id)sub_10005CBE0();
          unint64_t v32 = *a1;
          if ((*a1 & 0xC000000000000001) == 0)
          {
LABEL_24:
            if ((v18 & 0x8000000000000000) != 0) {
              goto LABEL_68;
            }
            if (v18 >= *(void *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
              goto LABEL_69;
            }
            id v34 = *(id *)(v32 + 8 * v18 + 32);
            goto LABEL_27;
          }
        }
        else
        {
          if ((v15 & 0x8000000000000000) != 0) {
            goto LABEL_66;
          }
          if (v15 >= *(void *)((v32 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
            goto LABEL_67;
          }
          id v33 = *(id *)(v32 + 8 * v15 + 32);
          if ((v32 & 0xC000000000000001) == 0) {
            goto LABEL_24;
          }
        }
        id v34 = (id)sub_10005CBE0();
        unint64_t v32 = *a1;
LABEL_27:
        int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
        *a1 = v32;
        if (!isUniquelyReferenced_nonNull_bridgeObject
          || (v32 & 0x8000000000000000) != 0
          || (v32 & 0x4000000000000000) != 0)
        {
          unint64_t v32 = sub_10005A218(v32);
          *a1 = v32;
        }
        uint64_t v36 = *(void **)((v32 & 0xFFFFFFFFFFFFFF8) + 8 * v15 + 0x20);
        *(void *)((v32 & 0xFFFFFFFFFFFFFF8) + 8 * v15 + 0x20) = v34;

        sub_10005C910();
        unint64_t v37 = *a1;
        int v38 = swift_isUniquelyReferenced_nonNull_bridgeObject();
        *a1 = v37;
        if (!v38 || (v37 & 0x8000000000000000) != 0 || (v37 & 0x4000000000000000) != 0)
        {
          unint64_t v37 = sub_10005A218(v37);
          *a1 = v37;
        }
        if ((v18 & 0x8000000000000000) != 0) {
          goto LABEL_70;
        }
        if (v18 >= *(void *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
          goto LABEL_71;
        }
        unint64_t v39 = *(void **)((v37 & 0xFFFFFFFFFFFFFF8) + 8 * v18 + 0x20);
        *(void *)((v37 & 0xFFFFFFFFFFFFFF8) + 8 * v18 + 0x20) = v33;

        sub_10005C910();
        goto LABEL_38;
      }
    }
  }
  return v15;
}

uint64_t sub_1000481E0(uint64_t a1, uint64_t a2)
{
  if (a1 < 0)
  {
    __break(1u);
  }
  else
  {
    uint64_t v2 = a2;
    uint64_t v4 = a1;
    if (!((unint64_t)*v3 >> 62))
    {
      if (*(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) >= a2) {
        goto LABEL_4;
      }
LABEL_28:
      __break(1u);
      goto LABEL_29;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v20 = sub_10005CCA0();
  swift_bridgeObjectRelease();
  if (v20 < v2) {
    goto LABEL_28;
  }
LABEL_4:
  uint64_t v6 = v2 - v4;
  if (__OFSUB__(v2, v4))
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  uint64_t v5 = v4 - v2;
  if (__OFSUB__(0, v6))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    swift_bridgeObjectRetain();
    uint64_t v21 = sub_10005CCA0();
    swift_bridgeObjectRelease();
    uint64_t v8 = v21 + v5;
    if (!__OFADD__(v21, v5)) {
      goto LABEL_8;
    }
LABEL_33:
    __break(1u);
    goto LABEL_34;
  }
  if ((unint64_t)*v3 >> 62) {
    goto LABEL_31;
  }
  uint64_t v7 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t v8 = v7 - v6;
  if (__OFADD__(v7, v5)) {
    goto LABEL_33;
  }
LABEL_8:
  unint64_t v9 = *v3;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  uint64_t *v3 = v9;
  if (!isUniquelyReferenced_nonNull_bridgeObject
    || (v9 & 0x8000000000000000) != 0
    || (v9 & 0x4000000000000000) != 0
    || (uint64_t v11 = v9 & 0xFFFFFFFFFFFFFF8, v8 > *(void *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1))
  {
    if (!(v9 >> 62))
    {
LABEL_13:
      swift_bridgeObjectRetain();
      uint64_t *v3 = sub_10005CBF0();
      swift_bridgeObjectRelease();
      uint64_t v11 = *v3 & 0xFFFFFFFFFFFFFF8;
      goto LABEL_14;
    }
LABEL_34:
    swift_bridgeObjectRetain();
    sub_10005CCA0();
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
LABEL_14:
  uint64_t v12 = v11 + 32;
  unint64_t v13 = (char *)(v11 + 32 + 8 * v4);
  sub_10002DBB8(0, &qword_10007D120);
  uint64_t result = swift_arrayDestroy();
  if (v5)
  {
    if ((unint64_t)*v3 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v22 = sub_10005CCA0();
      uint64_t result = swift_bridgeObjectRelease();
      uint64_t v16 = v22 - v2;
      if (!__OFSUB__(v22, v2)) {
        goto LABEL_17;
      }
    }
    else
    {
      uint64_t v15 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
      uint64_t v16 = v15 - v2;
      if (!__OFSUB__(v15, v2))
      {
LABEL_17:
        char v17 = (char *)(v12 + 8 * v2);
        if (v4 != v2 || v13 >= &v17[8 * v16]) {
          uint64_t result = (uint64_t)memmove(v13, v17, 8 * v16);
        }
        if (!((unint64_t)*v3 >> 62))
        {
          uint64_t v18 = *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
          uint64_t v19 = v18 + v5;
          if (!__OFADD__(v18, v5))
          {
LABEL_22:
            *(void *)((*v3 & 0xFFFFFFFFFFFFFF8) + 0x10) = v19;
            goto LABEL_23;
          }
LABEL_40:
          __break(1u);
          return result;
        }
LABEL_38:
        swift_bridgeObjectRetain();
        uint64_t v23 = sub_10005CCA0();
        uint64_t result = swift_bridgeObjectRelease();
        uint64_t v19 = v23 + v5;
        if (!__OFADD__(v23, v5)) {
          goto LABEL_22;
        }
        goto LABEL_40;
      }
    }
    __break(1u);
    goto LABEL_38;
  }
LABEL_23:

  return sub_10005C910();
}

uint64_t sub_1000484A8(uint64_t a1)
{
  uint64_t v2 = sub_1000131E0(&qword_10007D0E8);
  uint64_t v3 = __chkstk_darwin(v2 - 8);
  uint64_t v5 = (char *)&v87 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v3);
  uint64_t v8 = (char *)&v87 - v7;
  uint64_t v9 = __chkstk_darwin(v6);
  uint64_t v11 = (char *)&v87 - v10;
  __chkstk_darwin(v9);
  uint64_t v100 = (char *)&v87 - v12;
  uint64_t v101 = sub_10005C300();
  uint64_t v87 = *(void *)(v101 - 8);
  uint64_t v13 = __chkstk_darwin(v101);
  uint64_t v88 = (char *)&v87 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v99 = (char *)&v87 - v16;
  __chkstk_darwin(v15);
  uint64_t v94 = (char *)&v87 - v17;
  unint64_t v108 = (unint64_t)_swiftEmptyArrayStorage;
  uint64_t v18 = *(void *)(a1 + 16);
  if (v18)
  {
    swift_bridgeObjectRetain();
    for (uint64_t i = 0; i != v18; ++i)
    {
      uint64_t v20 = *(void **)(a1 + 8 * i + 32);
      if (v20)
      {
        id v21 = v20;
        sub_10005C8E0();
        if (*(void *)((v108 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v108 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_10005C920();
        }
        sub_10005C940();
        sub_10005C910();
      }
    }
    swift_bridgeObjectRelease();
    unint64_t v22 = v108;
  }
  else
  {
    unint64_t v22 = (unint64_t)_swiftEmptyArrayStorage;
  }
  uint64_t v89 = v8;
  id v90 = v5;
  unint64_t v108 = (unint64_t)_swiftEmptyArrayStorage;
  unint64_t v23 = v22;
  if (v22 >> 62) {
    goto LABEL_79;
  }
  uint64_t v24 = *(void *)((v22 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  while (v24)
  {
    unint64_t v25 = 0;
    uint64_t v105 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v23 & 0xC000000000000001);
    unint64_t v95 = v23 + 32;
    uint64_t v96 = v23 & 0xFFFFFFFFFFFFFF8;
    id v102 = (void (**)(char *, uint64_t))(v87 + 32);
    id v103 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v87 + 56);
    uint64_t v97 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))(v87 + 48);
    uint64_t v91 = v11;
    uint64_t v92 = (void (**)(char *, uint64_t))(v87 + 8);
    unint64_t v104 = v23;
    while (1)
    {
      if (v105)
      {
        id v26 = (id)sub_10005CBE0();
      }
      else
      {
        if (v25 >= *(void *)(v96 + 16)) {
          goto LABEL_76;
        }
        id v26 = *(id *)(v95 + 8 * v25);
      }
      uint64_t v27 = v26;
      if (__OFADD__(v25++, 1))
      {
        __break(1u);
        goto LABEL_75;
      }
      unint64_t v29 = v108;
      if (v108 >> 62)
      {
        swift_bridgeObjectRetain_n();
        uint64_t v11 = (char *)sub_10005CCA0();
        if (!v11) {
          goto LABEL_26;
        }
      }
      else
      {
        uint64_t v11 = *(char **)((v108 & 0xFFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain_n();
        if (!v11) {
          goto LABEL_26;
        }
      }
      if ((v29 & 0xC000000000000001) != 0) {
        id v30 = (id)sub_10005CBE0();
      }
      else {
        id v30 = *(id *)(v29 + 32);
      }
      uint64_t v31 = v30;
      sub_10002DBB8(0, &qword_10007D120);
      char v32 = sub_10005CAA0();

      if (v32)
      {
LABEL_13:
        swift_bridgeObjectRelease_n();

        unint64_t v23 = v104;
        goto LABEL_14;
      }
      if (v11 != (char *)1)
      {
        if ((v29 & 0xC000000000000001) == 0)
        {
          id v58 = *(id *)(v29 + 40);
          unint64_t v23 = sub_10005CAA0();

          if (v23) {
            goto LABEL_13;
          }
          if (v11 != (char *)2)
          {
            uint64_t v59 = 6;
            while (1)
            {
              uint64_t v60 = (char *)(v59 - 3);
              if (__OFADD__(v59 - 4, 1)) {
                goto LABEL_77;
              }
              id v61 = *(id *)(v29 + 8 * v59);
              unint64_t v23 = sub_10005CAA0();

              if (v23) {
                goto LABEL_13;
              }
              ++v59;
              if (v60 == v11) {
                goto LABEL_26;
              }
            }
          }
          goto LABEL_26;
        }
        sub_10005CBE0();
        unint64_t v23 = sub_10005CAA0();
        swift_unknownObjectRelease();
        if (v23) {
          goto LABEL_13;
        }
        if (v11 != (char *)2) {
          break;
        }
      }
LABEL_26:
      swift_bridgeObjectRelease_n();
      id v33 = [v27 url];
      if (!v33)
      {
        uint64_t v38 = (uint64_t)v100;
        (*v103)(v100, 1, 1, v101);
        unint64_t v23 = v104;
LABEL_31:

        sub_10001E8C0(v38, &qword_10007D0E8);
        goto LABEL_14;
      }
      id v34 = v33;
      uint64_t v35 = v99;
      sub_10005C290();

      uint64_t v36 = v101;
      unint64_t v37 = *v102;
      uint64_t v38 = (uint64_t)v100;
      ((void (*)(char *, char *, uint64_t))*v102)(v100, v35, v101);
      uint64_t v98 = *v103;
      v98((char *)v38, 0, 1, v36);
      unint64_t v39 = *v97;
      int v40 = (*v97)(v38, 1, v36);
      unint64_t v23 = v104;
      if (v40 == 1) {
        goto LABEL_31;
      }
      id v93 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v39;
      uint64_t v41 = v94;
      ((void (*)(char *, uint64_t, uint64_t))v37)(v94, v38, v36);
      if (sub_10005C210())
      {
        (*v92)(v41, v36);

        goto LABEL_14;
      }
      uint64_t v46 = sub_10002DBB8(0, (unint64_t *)&unk_10007D970);
      if (v24 < 1) {
        goto LABEL_78;
      }
      uint64_t v11 = (char *)v46;
      swift_bridgeObjectRetain();
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (v105) {
          id v48 = (id)sub_10005CBE0();
        }
        else {
          id v48 = *(id *)(v23 + 8 * j + 32);
        }
        id v49 = v48;
        if (sub_10005CAA0())
        {

          continue;
        }
        id v50 = [v49 image];

        if (v50
          || (id v51 = [v49 attributedText], v51, v51))
        {
          id v49 = v49;
          sub_10005C8E0();
          if (*(void *)((v108 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v108 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_10005C920();
          }
          sub_10005C940();
          sub_10005C910();
          goto LABEL_53;
        }
        id v52 = [v49 url];
        if (!v52)
        {
          uint64_t v55 = (uint64_t)v91;
          v98(v91, 1, 1, v36);
LABEL_59:

          sub_10001E8C0(v55, &qword_10007D0E8);
          unint64_t v23 = v104;
          continue;
        }
        uint64_t v53 = v52;
        uint64_t v54 = v99;
        sub_10005C290();

        uint64_t v55 = (uint64_t)v91;
        ((void (*)(char *, char *, uint64_t))v37)(v91, v54, v36);
        v98((char *)v55, 0, 1, v36);
        if (v93(v55, 1, v36) == 1) {
          goto LABEL_59;
        }
        uint64_t v56 = v88;
        ((void (*)(char *, uint64_t, uint64_t))v37)(v88, v55, v36);
        if (sub_10005C210())
        {
          (*v92)(v56, v36);
LABEL_53:

          unint64_t v23 = v104;
          continue;
        }
        id v57 = v49;
        sub_10005C8E0();
        if (*(void *)((v108 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v108 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_10005C920();
        }
        sub_10005C940();
        sub_10005C910();

        (*v92)(v88, v36);
        unint64_t v23 = v104;
      }
      swift_bridgeObjectRelease();

      (*v92)(v94, v36);
LABEL_14:
      if (v25 == v24) {
        goto LABEL_80;
      }
    }
    uint64_t v42 = 2;
    while (1)
    {
      uint64_t v43 = sub_10005CBE0();
      uint64_t v44 = (char *)(v42 + 1);
      if (__OFADD__(v42, 1)) {
        break;
      }
      unint64_t v23 = v43;
      char v45 = sub_10005CAA0();
      swift_unknownObjectRelease();
      if (v45) {
        goto LABEL_13;
      }
      ++v42;
      if (v44 == v11) {
        goto LABEL_26;
      }
    }
LABEL_75:
    __break(1u);
LABEL_76:
    __break(1u);
LABEL_77:
    __break(1u);
LABEL_78:
    __break(1u);
LABEL_79:
    swift_bridgeObjectRetain();
    uint64_t v24 = sub_10005CCA0();
  }
LABEL_80:
  swift_bridgeObjectRelease();
  unint64_t v62 = (unint64_t)sub_1000474E0(v23, (uint64_t *)&v108);
  swift_bridgeObjectRelease();
  unint64_t v107 = v62;
  if (v62 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v86 = sub_10005CCA0();
    swift_bridgeObjectRelease();
    if (v86 < 2) {
      goto LABEL_108;
    }
  }
  else if (*(uint64_t *)((v62 & 0xFFFFFFFFFFFFFF8) + 0x10) < 2)
  {
LABEL_108:
    swift_bridgeObjectRelease();
    return v62;
  }
  unint64_t v63 = swift_bridgeObjectRetain();
  unsigned __int8 v64 = sub_10003F7A0(v63);
  swift_bridgeObjectRelease();
  if ((v64 & 1) == 0) {
    goto LABEL_108;
  }
  uint64_t v106 = _swiftEmptyArrayStorage;
  if (v62 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_10005CCA0();
    uint64_t v65 = result;
    if (result) {
      goto LABEL_85;
    }
LABEL_104:
    swift_bridgeObjectRelease();
    uint64_t v82 = _swiftEmptyArrayStorage;
    goto LABEL_105;
  }
  uint64_t v65 = *(void *)((v62 & 0xFFFFFFFFFFFFFF8) + 0x10);
  uint64_t result = swift_bridgeObjectRetain();
  if (!v65) {
    goto LABEL_104;
  }
LABEL_85:
  uint64_t v98 = 0;
  if (v65 < 1) {
    goto LABEL_113;
  }
  uint64_t v67 = 0;
  unint64_t v104 = v65;
  uint64_t v105 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v87 + 56);
  uint64_t v68 = (char *)(v87 + 48);
  id v102 = (void (**)(char *, uint64_t))(v87 + 8);
  id v103 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v87 + 16);
  uint64_t v69 = &qword_10007D0E8;
  uint64_t v100 = (char *)(v87 + 48);
  uint64_t v70 = v101;
  do
  {
    if ((v62 & 0xC000000000000001) != 0) {
      id v71 = (id)sub_10005CBE0();
    }
    else {
      id v71 = *(id *)(v62 + 8 * v67 + 32);
    }
    uint64_t v72 = v71;
    if ([v71 isPDF])
    {
      uint64_t v73 = v69;
      id v74 = [v72 url];
      if (v74)
      {
        uint64_t v75 = v74;
        uint64_t v76 = (uint64_t)v90;
        sub_10005C290();

        uint64_t v77 = 0;
      }
      else
      {
        uint64_t v77 = 1;
        uint64_t v76 = (uint64_t)v90;
      }
      (*v105)(v76, v77, 1, v70);
      uint64_t v78 = v76;
      uint64_t v79 = (uint64_t)v89;
      uint64_t v69 = v73;
      sub_10003C51C(v78, (uint64_t)v89, v73);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))v68)(v79, 1, v70))
      {
        sub_10001E8C0(v79, v73);

        uint64_t v65 = v104;
      }
      else
      {
        unint64_t v80 = v99;
        ((void (*)(char *, uint64_t, uint64_t))*v103)(v99, v79, v70);
        sub_10001E8C0(v79, v73);
        char v81 = sub_10005C210();
        (*v102)(v80, v70);
        if (v81)
        {
          sub_10005CC20();
          sub_10005CC50();
          sub_10005CC60();
          sub_10005CC30();
        }
        else
        {
        }
        uint64_t v65 = v104;
        uint64_t v69 = v73;
        uint64_t v68 = v100;
      }
    }
    else
    {
    }
    ++v67;
  }
  while (v65 != v67);
  swift_bridgeObjectRelease();
  uint64_t v82 = v106;
LABEL_105:
  int v83 = sub_10003C76C((unint64_t)v82);
  swift_release();
  swift_bridgeObjectRetain();
  int64_t v84 = sub_100047B7C(&v107, (uint64_t)v83);
  uint64_t result = swift_bridgeObjectRelease();
  if (v107 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v85 = sub_10005CCA0();
    uint64_t result = swift_bridgeObjectRelease();
    if (v85 >= v84) {
      goto LABEL_107;
    }
  }
  else
  {
    uint64_t v85 = *(void *)((v107 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v85 >= v84)
    {
LABEL_107:
      sub_1000481E0(v84, v85);
      swift_bridgeObjectRelease();
      unint64_t v62 = v107;
      goto LABEL_108;
    }
  }
  __break(1u);
LABEL_113:
  __break(1u);
  return result;
}

uint64_t sub_100049150(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v13 - v7;
  uint64_t v9 = *(void *)(a1 + 16);
  sub_100046FB0((unint64_t *)&qword_10007D710, (void (*)(uint64_t))type metadata accessor for CRLSELibraryViewModel.Item);
  uint64_t result = sub_10005C9A0();
  uint64_t v14 = result;
  if (v9)
  {
    uint64_t v11 = a1 + ((*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));
    uint64_t v12 = *(void *)(v3 + 72);
    do
    {
      sub_100047478(v11, (uint64_t)v6, type metadata accessor for CRLSELibraryViewModel.Item);
      sub_1000455D8((uint64_t)v8, (uint64_t)v6);
      sub_1000473D4((uint64_t)v8, type metadata accessor for CRLSELibraryViewModel.Item);
      v11 += v12;
      --v9;
    }
    while (v9);
    return v14;
  }
  return result;
}

unint64_t sub_1000492E0()
{
  unint64_t result = qword_10007D910;
  if (!qword_10007D910)
  {
    sub_10001DE60(&qword_10007D908);
    sub_100046FB0(&qword_10007CCA0, (void (*)(uint64_t))type metadata accessor for CRLSELibraryViewModel.Item);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007D910);
  }
  return result;
}

uint64_t sub_100049384(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

_OWORD *sub_1000493EC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100049400()
{
  return swift_bridgeObjectRetain();
}

uint64_t destroy for CRLSEExtensionContextManager.Error()
{
  return sub_100030670();
}

uint64_t _s24FreeformSharingExtension28CRLSEExtensionContextManagerC5ErrorOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_100049400();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for CRLSEExtensionContextManager.Error(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  char v5 = *((unsigned char *)a2 + 16);
  sub_100049400();
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = v5;
  sub_100030670();
  return a1;
}

__n128 initializeWithTake for CRLSEExtensionContextManager.Error(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for CRLSEExtensionContextManager.Error(uint64_t a1, uint64_t a2)
{
  char v3 = *(unsigned char *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(unsigned char *)(a1 + 16) = v3;
  sub_100030670();
  return a1;
}

uint64_t getEnumTagSinglePayload for CRLSEExtensionContextManager.Error(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0xFF && *(unsigned char *)(a1 + 17)) {
    return (*(_DWORD *)a1 + 255);
  }
  unsigned int v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1) {
    int v4 = -1;
  }
  else {
    int v4 = v3 ^ 0xFF;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for CRLSEExtensionContextManager.Error(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 - 255;
    *(void *)(result + 8) = 0;
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 1;
    }
  }
  else
  {
    if (a3 >= 0xFF) {
      *(unsigned char *)(result + 17) = 0;
    }
    if (a2) {
      *(unsigned char *)(result + 16) = -(char)a2;
    }
  }
  return result;
}

uint64_t sub_1000495A4(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_1000495AC(uint64_t result, char a2)
{
  *(unsigned char *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for CRLSEExtensionContextManager.Error()
{
  return &type metadata for CRLSEExtensionContextManager.Error;
}

uint64_t *OS_os_log.crlSharingExtension.unsafeMutableAddressor()
{
  if (qword_10007C6D8 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlSharingExtension;
}

void sub_100049618()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLDefaultCat_log_t, &CRLDefaultCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlDefault = (uint64_t)v1;
}

uint64_t *OS_os_log.crlDefault.unsafeMutableAddressor()
{
  if (qword_10007C630 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlDefault;
}

id static OS_os_log.crlDefault.getter()
{
  return sub_100050E64(&qword_10007C630, (void **)&static OS_os_log.crlDefault);
}

void static OS_os_log.crlDefault.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlDefault.modify())()
{
  if (qword_10007C630 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_1000497F4()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLAssertCat_log_t, &CRLAssertCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlAssert = (uint64_t)v1;
}

uint64_t *OS_os_log.crlAssert.unsafeMutableAddressor()
{
  if (qword_10007C638 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlAssert;
}

id static OS_os_log.crlAssert.getter()
{
  return sub_100050E64(&qword_10007C638, (void **)&static OS_os_log.crlAssert);
}

void static OS_os_log.crlAssert.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlAssert.modify())()
{
  if (qword_10007C638 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_1000499CC()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLErrorCat_log_t, &CRLErrorCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlError = (uint64_t)v1;
}

uint64_t *OS_os_log.crlError.unsafeMutableAddressor()
{
  if (qword_10007C640 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlError;
}

id static OS_os_log.crlError.getter()
{
  return sub_100050E64(&qword_10007C640, (void **)&static OS_os_log.crlError);
}

void static OS_os_log.crlError.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlError.modify())()
{
  if (qword_10007C640 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_100049BA4()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLWarningCat_log_t, &CRLWarningCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlWarning = (uint64_t)v1;
}

uint64_t *OS_os_log.crlWarning.unsafeMutableAddressor()
{
  if (qword_10007C648 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlWarning;
}

id static OS_os_log.crlWarning.getter()
{
  return sub_100050E64(&qword_10007C648, (void **)&static OS_os_log.crlWarning);
}

void static OS_os_log.crlWarning.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlWarning.modify())()
{
  if (qword_10007C648 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_100049D80()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLAlertCat_log_t, &CRLAlertCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlAlert = (uint64_t)v1;
}

uint64_t *OS_os_log.crlAlert.unsafeMutableAddressor()
{
  if (qword_10007C650 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlAlert;
}

id static OS_os_log.crlAlert.getter()
{
  return sub_100050E64(&qword_10007C650, (void **)&static OS_os_log.crlAlert);
}

void static OS_os_log.crlAlert.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlAlert.modify())()
{
  if (qword_10007C650 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_100049F58()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLPerformanceCat_log_t, &CRLPerformanceCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlPerformance = (uint64_t)v1;
}

uint64_t *OS_os_log.crlPerformance.unsafeMutableAddressor()
{
  if (qword_10007C658 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlPerformance;
}

id static OS_os_log.crlPerformance.getter()
{
  return sub_100050E64(&qword_10007C658, (void **)&static OS_os_log.crlPerformance);
}

void static OS_os_log.crlPerformance.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlPerformance.modify())()
{
  if (qword_10007C658 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004A12C()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLStatusHUDCat_log_t, &CRLStatusHUDCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlStatusHUD = (uint64_t)v1;
}

uint64_t *OS_os_log.crlStatusHUD.unsafeMutableAddressor()
{
  if (qword_10007C660 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlStatusHUD;
}

id static OS_os_log.crlStatusHUD.getter()
{
  return sub_100050E64(&qword_10007C660, (void **)&static OS_os_log.crlStatusHUD);
}

void static OS_os_log.crlStatusHUD.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlStatusHUD.modify())()
{
  if (qword_10007C660 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004A308()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLTextInputCat_log_t, &CRLTextInputCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlTextInput = (uint64_t)v1;
}

uint64_t *OS_os_log.crlTextInput.unsafeMutableAddressor()
{
  if (qword_10007C668 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlTextInput;
}

id static OS_os_log.crlTextInput.getter()
{
  return sub_100050E64(&qword_10007C668, (void **)&static OS_os_log.crlTextInput);
}

void static OS_os_log.crlTextInput.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlTextInput.modify())()
{
  if (qword_10007C668 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004A4E4()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLTraceableResourceCat_log_t, &CRLTraceableResourceCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlTraceableResource = (uint64_t)v1;
}

uint64_t *OS_os_log.crlTraceableResource.unsafeMutableAddressor()
{
  if (qword_10007C670 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlTraceableResource;
}

id static OS_os_log.crlTraceableResource.getter()
{
  return sub_100050E64(&qword_10007C670, (void **)&static OS_os_log.crlTraceableResource);
}

void static OS_os_log.crlTraceableResource.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlTraceableResource.modify())()
{
  if (qword_10007C670 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004A6B8()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLStorageHierachyCat_log_t, &CRLStorageHierachyCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlStorageHierachy = (uint64_t)v1;
}

uint64_t *OS_os_log.crlStorageHierachy.unsafeMutableAddressor()
{
  if (qword_10007C678 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlStorageHierachy;
}

id static OS_os_log.crlStorageHierachy.getter()
{
  return sub_100050E64(&qword_10007C678, (void **)&static OS_os_log.crlStorageHierachy);
}

void static OS_os_log.crlStorageHierachy.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlStorageHierachy.modify())()
{
  if (qword_10007C678 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004A88C()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLSerializableObjectCat_log_t, &CRLSerializableObjectCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlSerializableObject = (uint64_t)v1;
}

uint64_t *OS_os_log.crlSerializableObject.unsafeMutableAddressor()
{
  if (qword_10007C680 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlSerializableObject;
}

id static OS_os_log.crlSerializableObject.getter()
{
  return sub_100050E64(&qword_10007C680, (void **)&static OS_os_log.crlSerializableObject);
}

void static OS_os_log.crlSerializableObject.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlSerializableObject.modify())()
{
  if (qword_10007C680 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004AA60()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLCollaborationParticipantCat_log_t, &CRLCollaborationParticipantCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlCollaborationParticipant = (uint64_t)v1;
}

uint64_t *OS_os_log.crlCollaborationParticipant.unsafeMutableAddressor()
{
  if (qword_10007C688 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlCollaborationParticipant;
}

id static OS_os_log.crlCollaborationParticipant.getter()
{
  return sub_100050E64(&qword_10007C688, (void **)&static OS_os_log.crlCollaborationParticipant);
}

void static OS_os_log.crlCollaborationParticipant.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlCollaborationParticipant.modify())()
{
  if (qword_10007C688 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004AC34()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLSpotlightCat_log_t, &CRLSpotlightCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlSpotlight = (uint64_t)v1;
}

uint64_t *OS_os_log.crlSpotlight.unsafeMutableAddressor()
{
  if (qword_10007C690 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlSpotlight;
}

id static OS_os_log.crlSpotlight.getter()
{
  return sub_100050E64(&qword_10007C690, (void **)&static OS_os_log.crlSpotlight);
}

void static OS_os_log.crlSpotlight.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlSpotlight.modify())()
{
  if (qword_10007C690 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004AE10()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLNetworkReachabilityCat_log_t, &CRLNetworkReachabilityCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlNetworkReachability = (uint64_t)v1;
}

uint64_t *OS_os_log.crlNetworkReachability.unsafeMutableAddressor()
{
  if (qword_10007C698 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlNetworkReachability;
}

id static OS_os_log.crlNetworkReachability.getter()
{
  return sub_100050E64(&qword_10007C698, (void **)&static OS_os_log.crlNetworkReachability);
}

void static OS_os_log.crlNetworkReachability.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlNetworkReachability.modify())()
{
  if (qword_10007C698 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004AFE4()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLAssetDownloadManagerCat_log_t, &CRLAssetDownloadManagerCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlAssetDownloadManager = (uint64_t)v1;
}

uint64_t *OS_os_log.crlAssetDownloadManager.unsafeMutableAddressor()
{
  if (qword_10007C6A0 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlAssetDownloadManager;
}

id static OS_os_log.crlAssetDownloadManager.getter()
{
  return sub_100050E64(&qword_10007C6A0, (void **)&static OS_os_log.crlAssetDownloadManager);
}

void static OS_os_log.crlAssetDownloadManager.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlAssetDownloadManager.modify())()
{
  if (qword_10007C6A0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004B1B8()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLAppAnalyticsCat_log_t, &CRLAppAnalyticsCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlAppAnalytics = (uint64_t)v1;
}

uint64_t *OS_os_log.crlAppAnalytics.unsafeMutableAddressor()
{
  if (qword_10007C6A8 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlAppAnalytics;
}

id static OS_os_log.crlAppAnalytics.getter()
{
  return sub_100050E64(&qword_10007C6A8, (void **)&static OS_os_log.crlAppAnalytics);
}

void static OS_os_log.crlAppAnalytics.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlAppAnalytics.modify())()
{
  if (qword_10007C6A8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004B38C()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLAnalyticsCat_log_t, &CRLAnalyticsCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlAnalytics = (uint64_t)v1;
}

uint64_t *OS_os_log.crlAnalytics.unsafeMutableAddressor()
{
  if (qword_10007C6B0 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlAnalytics;
}

id static OS_os_log.crlAnalytics.getter()
{
  return sub_100050E64(&qword_10007C6B0, (void **)&static OS_os_log.crlAnalytics);
}

void static OS_os_log.crlAnalytics.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlAnalytics.modify())()
{
  if (qword_10007C6B0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004B568()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLKeyboardCat_log_t, &CRLKeyboardCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlKeyboard = (uint64_t)v1;
}

uint64_t *OS_os_log.crlKeyboard.unsafeMutableAddressor()
{
  if (qword_10007C6B8 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlKeyboard;
}

id static OS_os_log.crlKeyboard.getter()
{
  return sub_100050E64(&qword_10007C6B8, (void **)&static OS_os_log.crlKeyboard);
}

void static OS_os_log.crlKeyboard.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlKeyboard.modify())()
{
  if (qword_10007C6B8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004B744()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLFolderUICat_log_t, &CRLFolderUICat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlFolderUI = (uint64_t)v1;
}

uint64_t *OS_os_log.crlFolderUI.unsafeMutableAddressor()
{
  if (qword_10007C6C0 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlFolderUI;
}

id static OS_os_log.crlFolderUI.getter()
{
  return sub_100050E64(&qword_10007C6C0, (void **)&static OS_os_log.crlFolderUI);
}

void static OS_os_log.crlFolderUI.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlFolderUI.modify())()
{
  if (qword_10007C6C0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004B920()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLBoardLibraryCat_log_t, &CRLBoardLibraryCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlBoardLibrary = (uint64_t)v1;
}

uint64_t *OS_os_log.crlBoardLibrary.unsafeMutableAddressor()
{
  if (qword_10007C6C8 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlBoardLibrary;
}

id static OS_os_log.crlBoardLibrary.getter()
{
  return sub_100050E64(&qword_10007C6C8, (void **)&static OS_os_log.crlBoardLibrary);
}

void static OS_os_log.crlBoardLibrary.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlBoardLibrary.modify())()
{
  if (qword_10007C6C8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004BAF4()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLBoardPreviewImageCacheCat_log_t, &CRLBoardPreviewImageCacheCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlBoardPreviewImageCache = (uint64_t)v1;
}

uint64_t *OS_os_log.crlBoardPreviewImageCache.unsafeMutableAddressor()
{
  if (qword_10007C6D0 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlBoardPreviewImageCache;
}

id static OS_os_log.crlBoardPreviewImageCache.getter()
{
  return sub_100050E64(&qword_10007C6D0, (void **)&static OS_os_log.crlBoardPreviewImageCache);
}

void static OS_os_log.crlBoardPreviewImageCache.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlBoardPreviewImageCache.modify())()
{
  if (qword_10007C6D0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004BCC8()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLSharingExtensionCat_log_t, &CRLSharingExtensionCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlSharingExtension = (uint64_t)v1;
}

id static OS_os_log.crlSharingExtension.getter()
{
  return sub_100050E64(&qword_10007C6D8, (void **)&static OS_os_log.crlSharingExtension);
}

void static OS_os_log.crlSharingExtension.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlSharingExtension.modify())()
{
  if (qword_10007C6D8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

void sub_10004BE54()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLStencilLibraryCat_log_t, &CRLStencilLibraryCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlStencilLibrary = (uint64_t)v1;
}

uint64_t *OS_os_log.crlStencilLibrary.unsafeMutableAddressor()
{
  if (qword_10007C6E0 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlStencilLibrary;
}

id static OS_os_log.crlStencilLibrary.getter()
{
  return sub_100050E64(&qword_10007C6E0, (void **)&static OS_os_log.crlStencilLibrary);
}

void static OS_os_log.crlStencilLibrary.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlStencilLibrary.modify())()
{
  if (qword_10007C6E0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004C028()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLCarmelRealTimeMessageTransferCat_log_t, &CRLCarmelRealTimeMessageTransferCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlRealTimeMessageTransfer = (uint64_t)v1;
}

uint64_t *OS_os_log.crlRealTimeMessageTransfer.unsafeMutableAddressor()
{
  if (qword_10007C6E8 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlRealTimeMessageTransfer;
}

id static OS_os_log.crlRealTimeMessageTransfer.getter()
{
  return sub_100050E64(&qword_10007C6E8, (void **)&static OS_os_log.crlRealTimeMessageTransfer);
}

void static OS_os_log.crlRealTimeMessageTransfer.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlRealTimeMessageTransfer.modify())()
{
  if (qword_10007C6E8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004C1FC()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLZoneRefetchCat_log_t, &CRLZoneRefetchCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlZoneRefetch = (uint64_t)v1;
}

uint64_t *OS_os_log.crlZoneRefetch.unsafeMutableAddressor()
{
  if (qword_10007C6F0 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlZoneRefetch;
}

id static OS_os_log.crlZoneRefetch.getter()
{
  return sub_100050E64(&qword_10007C6F0, (void **)&static OS_os_log.crlZoneRefetch);
}

void static OS_os_log.crlZoneRefetch.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlZoneRefetch.modify())()
{
  if (qword_10007C6F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004C3D0()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLSendACopyCat_log_t, &CRLSendACopyCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlSendACopy = (uint64_t)v1;
}

uint64_t *OS_os_log.crlSendACopy.unsafeMutableAddressor()
{
  if (qword_10007C6F8 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlSendACopy;
}

id static OS_os_log.crlSendACopy.getter()
{
  return sub_100050E64(&qword_10007C6F8, (void **)&static OS_os_log.crlSendACopy);
}

void static OS_os_log.crlSendACopy.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlSendACopy.modify())()
{
  if (qword_10007C6F8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004C5AC()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLCloudKitEnvironmentCat_log_t, &CRLCloudKitEnvironmentCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlCloudKitEnvironment = (uint64_t)v1;
}

uint64_t *OS_os_log.crlCloudKitEnvironment.unsafeMutableAddressor()
{
  if (qword_10007C700 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlCloudKitEnvironment;
}

id static OS_os_log.crlCloudKitEnvironment.getter()
{
  return sub_100050E64(&qword_10007C700, (void **)&static OS_os_log.crlCloudKitEnvironment);
}

void static OS_os_log.crlCloudKitEnvironment.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlCloudKitEnvironment.modify())()
{
  if (qword_10007C700 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004C780()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLSidebarCat_log_t, &CRLSidebarCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlSidebar = (uint64_t)v1;
}

uint64_t *OS_os_log.crlSidebar.unsafeMutableAddressor()
{
  if (qword_10007C708 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlSidebar;
}

id static OS_os_log.crlSidebar.getter()
{
  return sub_100050E64(&qword_10007C708, (void **)&static OS_os_log.crlSidebar);
}

void static OS_os_log.crlSidebar.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlSidebar.modify())()
{
  if (qword_10007C708 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004C95C()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLInsertMediaCat_log_t, &CRLInsertMediaCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlInsertMedia = (uint64_t)v1;
}

uint64_t *OS_os_log.crlInsertMedia.unsafeMutableAddressor()
{
  if (qword_10007C710 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlInsertMedia;
}

id static OS_os_log.crlInsertMedia.getter()
{
  return sub_100050E64(&qword_10007C710, (void **)&static OS_os_log.crlInsertMedia);
}

void static OS_os_log.crlInsertMedia.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlInsertMedia.modify())()
{
  if (qword_10007C710 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004CB30()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLCollaboratorCursorCat_log_t, &CRLCollaboratorCursorCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlCollaboratorCursor = (uint64_t)v1;
}

uint64_t *OS_os_log.crlCollaboratorCursor.unsafeMutableAddressor()
{
  if (qword_10007C718 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlCollaboratorCursor;
}

id static OS_os_log.crlCollaboratorCursor.getter()
{
  return sub_100050E64(&qword_10007C718, (void **)&static OS_os_log.crlCollaboratorCursor);
}

void static OS_os_log.crlCollaboratorCursor.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlCollaboratorCursor.modify())()
{
  if (qword_10007C718 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004CD04()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLStateRestorationCat_log_t, &CRLStateRestorationCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlStateRestoration = (uint64_t)v1;
}

uint64_t *OS_os_log.crlStateRestoration.unsafeMutableAddressor()
{
  if (qword_10007C720 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlStateRestoration;
}

id static OS_os_log.crlStateRestoration.getter()
{
  return sub_100050E64(&qword_10007C720, (void **)&static OS_os_log.crlStateRestoration);
}

void static OS_os_log.crlStateRestoration.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlStateRestoration.modify())()
{
  if (qword_10007C720 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004CED8()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLFollowCat_log_t, &CRLFollowCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlFollow = (uint64_t)v1;
}

uint64_t *OS_os_log.crlFollow.unsafeMutableAddressor()
{
  if (qword_10007C728 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlFollow;
}

id static OS_os_log.crlFollow.getter()
{
  return sub_100050E64(&qword_10007C728, (void **)&static OS_os_log.crlFollow);
}

void static OS_os_log.crlFollow.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlFollow.modify())()
{
  if (qword_10007C728 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004D0B0()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLJoinLeaveCat_log_t, &CRLJoinLeaveCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlJoinLeave = (uint64_t)v1;
}

uint64_t *OS_os_log.crlJoinLeave.unsafeMutableAddressor()
{
  if (qword_10007C730 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlJoinLeave;
}

id static OS_os_log.crlJoinLeave.getter()
{
  return sub_100050E64(&qword_10007C730, (void **)&static OS_os_log.crlJoinLeave);
}

void static OS_os_log.crlJoinLeave.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlJoinLeave.modify())()
{
  if (qword_10007C730 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004D28C()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLPencilHoverCat_log_t, &CRLPencilHoverCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlPencilHover = (uint64_t)v1;
}

uint64_t *OS_os_log.crlPencilHover.unsafeMutableAddressor()
{
  if (qword_10007C738 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlPencilHover;
}

id static OS_os_log.crlPencilHover.getter()
{
  return sub_100050E64(&qword_10007C738, (void **)&static OS_os_log.crlPencilHover);
}

void static OS_os_log.crlPencilHover.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlPencilHover.modify())()
{
  if (qword_10007C738 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004D460()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLScenesCat_log_t, &CRLScenesCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlScenes = (uint64_t)v1;
}

uint64_t *OS_os_log.crlScenes.unsafeMutableAddressor()
{
  if (qword_10007C740 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlScenes;
}

id static OS_os_log.crlScenes.getter()
{
  return sub_100050E64(&qword_10007C740, (void **)&static OS_os_log.crlScenes);
}

void static OS_os_log.crlScenes.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlScenes.modify())()
{
  if (qword_10007C740 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004D63C()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLThreeDimensionalObjectsCat_log_t, &CRLThreeDimensionalObjectsCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlThreeDimensionalObjects = (uint64_t)v1;
}

uint64_t *OS_os_log.crlThreeDimensionalObjects.unsafeMutableAddressor()
{
  if (qword_10007C748 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlThreeDimensionalObjects;
}

id static OS_os_log.crlThreeDimensionalObjects.getter()
{
  return sub_100050E64(&qword_10007C748, (void **)&static OS_os_log.crlThreeDimensionalObjects);
}

void static OS_os_log.crlThreeDimensionalObjects.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlThreeDimensionalObjects.modify())()
{
  if (qword_10007C748 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004D810()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLChangeShapeCat_log_t, &CRLChangeShapeCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlChangeShape = (uint64_t)v1;
}

uint64_t *OS_os_log.crlChangeShape.unsafeMutableAddressor()
{
  if (qword_10007C750 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlChangeShape;
}

id static OS_os_log.crlChangeShape.getter()
{
  return sub_100050E64(&qword_10007C750, (void **)&static OS_os_log.crlChangeShape);
}

void static OS_os_log.crlChangeShape.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlChangeShape.modify())()
{
  if (qword_10007C750 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004D9E4()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLCloudQuotaMessagingCat_log_t, &CRLCloudQuotaMessagingCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlCloudQuotaMessaging = (uint64_t)v1;
}

uint64_t *OS_os_log.crlCloudQuotaMessaging.unsafeMutableAddressor()
{
  if (qword_10007C758 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlCloudQuotaMessaging;
}

id static OS_os_log.crlCloudQuotaMessaging.getter()
{
  return sub_100050E64(&qword_10007C758, (void **)&static OS_os_log.crlCloudQuotaMessaging);
}

void static OS_os_log.crlCloudQuotaMessaging.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlCloudQuotaMessaging.modify())()
{
  if (qword_10007C758 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004DBB8()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRL3DBreakthroughCat_log_t, &CRL3DBreakthroughCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crl3DBreakthrough = (uint64_t)v1;
}

uint64_t *OS_os_log.crl3DBreakthrough.unsafeMutableAddressor()
{
  if (qword_10007C760 != -1) {
    swift_once();
  }
  return &static OS_os_log.crl3DBreakthrough;
}

id static OS_os_log.crl3DBreakthrough.getter()
{
  return sub_100050E64(&qword_10007C760, (void **)&static OS_os_log.crl3DBreakthrough);
}

void static OS_os_log.crl3DBreakthrough.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crl3DBreakthrough.modify())()
{
  if (qword_10007C760 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004DD8C()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLLayerAnimationCat_log_t, &CRLLayerAnimationCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlLayerAnimation = (uint64_t)v1;
}

uint64_t *OS_os_log.crlLayerAnimation.unsafeMutableAddressor()
{
  if (qword_10007C768 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlLayerAnimation;
}

id static OS_os_log.crlLayerAnimation.getter()
{
  return sub_100050E64(&qword_10007C768, (void **)&static OS_os_log.crlLayerAnimation);
}

void static OS_os_log.crlLayerAnimation.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlLayerAnimation.modify())()
{
  if (qword_10007C768 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004DF60()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLAnimationImplCat_log_t, &CRLAnimationImplCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlAnimationImpl = (uint64_t)v1;
}

uint64_t *OS_os_log.crlAnimationImpl.unsafeMutableAddressor()
{
  if (qword_10007C770 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlAnimationImpl;
}

id static OS_os_log.crlAnimationImpl.getter()
{
  return sub_100050E64(&qword_10007C770, (void **)&static OS_os_log.crlAnimationImpl);
}

void static OS_os_log.crlAnimationImpl.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlAnimationImpl.modify())()
{
  if (qword_10007C770 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004E134()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLMiniFormatterCat_log_t, &CRLMiniFormatterCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.crlMiniFormatter = (uint64_t)v1;
}

uint64_t *OS_os_log.crlMiniFormatter.unsafeMutableAddressor()
{
  if (qword_10007C778 != -1) {
    swift_once();
  }
  return &static OS_os_log.crlMiniFormatter;
}

id static OS_os_log.crlMiniFormatter.getter()
{
  return sub_100050E64(&qword_10007C778, (void **)&static OS_os_log.crlMiniFormatter);
}

void static OS_os_log.crlMiniFormatter.setter(void *a1)
{
}

uint64_t (*static OS_os_log.crlMiniFormatter.modify())()
{
  if (qword_10007C778 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004E308()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLSceneManagementCat_log_t, &CRLSceneManagementCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.sceneManagement = (uint64_t)v1;
}

uint64_t *OS_os_log.sceneManagement.unsafeMutableAddressor()
{
  if (qword_10007C780 != -1) {
    swift_once();
  }
  return &static OS_os_log.sceneManagement;
}

id static OS_os_log.sceneManagement.getter()
{
  return sub_100050E64(&qword_10007C780, (void **)&static OS_os_log.sceneManagement);
}

void static OS_os_log.sceneManagement.setter(void *a1)
{
}

uint64_t (*static OS_os_log.sceneManagement.modify())()
{
  if (qword_10007C780 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004E4E4()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLCompositionCat_log_t, &CRLCompositionCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.composition = (uint64_t)v1;
}

uint64_t *OS_os_log.composition.unsafeMutableAddressor()
{
  if (qword_10007C788 != -1) {
    swift_once();
  }
  return &static OS_os_log.composition;
}

id static OS_os_log.composition.getter()
{
  return sub_100050E64(&qword_10007C788, (void **)&static OS_os_log.composition);
}

void static OS_os_log.composition.setter(void *a1)
{
}

uint64_t (*static OS_os_log.composition.modify())()
{
  if (qword_10007C788 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004E6BC()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLViewControllerCat_log_t, &CRLViewControllerCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.CRLViewController = (uint64_t)v1;
}

uint64_t *OS_os_log.CRLViewController.unsafeMutableAddressor()
{
  if (qword_10007C790 != -1) {
    swift_once();
  }
  return &static OS_os_log.CRLViewController;
}

id static OS_os_log.CRLViewController.getter()
{
  return sub_100050E64(&qword_10007C790, (void **)&static OS_os_log.CRLViewController);
}

void static OS_os_log.CRLViewController.setter(void *a1)
{
}

uint64_t (*static OS_os_log.CRLViewController.modify())()
{
  if (qword_10007C790 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004E890()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLAppIntentsCat_log_t, &CRLAppIntentsCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.appIntents = (uint64_t)v1;
}

uint64_t *OS_os_log.appIntents.unsafeMutableAddressor()
{
  if (qword_10007C798 != -1) {
    swift_once();
  }
  return &static OS_os_log.appIntents;
}

id static OS_os_log.appIntents.getter()
{
  return sub_100050E64(&qword_10007C798, (void **)&static OS_os_log.appIntents);
}

void static OS_os_log.appIntents.setter(void *a1)
{
}

uint64_t (*static OS_os_log.appIntents.modify())()
{
  if (qword_10007C798 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004EA64()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLAppStateCat_log_t, &CRLAppStateCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.appState = (uint64_t)v1;
}

uint64_t *OS_os_log.appState.unsafeMutableAddressor()
{
  if (qword_10007C7A0 != -1) {
    swift_once();
  }
  return &static OS_os_log.appState;
}

id static OS_os_log.appState.getter()
{
  return sub_100050E64(&qword_10007C7A0, (void **)&static OS_os_log.appState);
}

void static OS_os_log.appState.setter(void *a1)
{
}

uint64_t (*static OS_os_log.appState.modify())()
{
  if (qword_10007C7A0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004EC34()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLInteractionCat_log_t, &CRLInteractionCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.interaction = (uint64_t)v1;
}

uint64_t *OS_os_log.interaction.unsafeMutableAddressor()
{
  if (qword_10007C7A8 != -1) {
    swift_once();
  }
  return &static OS_os_log.interaction;
}

id static OS_os_log.interaction.getter()
{
  return sub_100050E64(&qword_10007C7A8, (void **)&static OS_os_log.interaction);
}

void static OS_os_log.interaction.setter(void *a1)
{
}

uint64_t (*static OS_os_log.interaction.modify())()
{
  if (qword_10007C7A8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004EE0C()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLContentStateCat_log_t, &CRLContentStateCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.contentState = (uint64_t)v1;
}

uint64_t *OS_os_log.contentState.unsafeMutableAddressor()
{
  if (qword_10007C7B0 != -1) {
    swift_once();
  }
  return &static OS_os_log.contentState;
}

id static OS_os_log.contentState.getter()
{
  return sub_100050E64(&qword_10007C7B0, (void **)&static OS_os_log.contentState);
}

void static OS_os_log.contentState.setter(void *a1)
{
}

uint64_t (*static OS_os_log.contentState.modify())()
{
  if (qword_10007C7B0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004EFE4()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLBoardDataStoreCat_log_t, &CRLBoardDataStoreCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.boardStore = (uint64_t)v1;
}

uint64_t *OS_os_log.boardStore.unsafeMutableAddressor()
{
  if (qword_10007C7B8 != -1) {
    swift_once();
  }
  return &static OS_os_log.boardStore;
}

id static OS_os_log.boardStore.getter()
{
  return sub_100050E64(&qword_10007C7B8, (void **)&static OS_os_log.boardStore);
}

void static OS_os_log.boardStore.setter(void *a1)
{
}

uint64_t (*static OS_os_log.boardStore.modify())()
{
  if (qword_10007C7B8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004F1B8()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLFileProviderStoreCat_log_t, &CRLFileProviderStoreCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.fileProviderStore = (uint64_t)v1;
}

uint64_t *OS_os_log.fileProviderStore.unsafeMutableAddressor()
{
  if (qword_10007C7C0 != -1) {
    swift_once();
  }
  return &static OS_os_log.fileProviderStore;
}

id static OS_os_log.fileProviderStore.getter()
{
  return sub_100050E64(&qword_10007C7C0, (void **)&static OS_os_log.fileProviderStore);
}

void static OS_os_log.fileProviderStore.setter(void *a1)
{
}

uint64_t (*static OS_os_log.fileProviderStore.modify())()
{
  if (qword_10007C7C0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004F38C()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLPersistenceCat_log_t, &CRLPersistenceCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.persistence = (uint64_t)v1;
}

uint64_t *OS_os_log.persistence.unsafeMutableAddressor()
{
  if (qword_10007C7C8 != -1) {
    swift_once();
  }
  return &static OS_os_log.persistence;
}

id static OS_os_log.persistence.getter()
{
  return sub_100050E64(&qword_10007C7C8, (void **)&static OS_os_log.persistence);
}

void static OS_os_log.persistence.setter(void *a1)
{
}

uint64_t (*static OS_os_log.persistence.modify())()
{
  if (qword_10007C7C8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004F564()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLDataSyncCat_log_t, &CRLDataSyncCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.dataSync = (uint64_t)v1;
}

uint64_t *OS_os_log.dataSync.unsafeMutableAddressor()
{
  if (qword_10007C7D0 != -1) {
    swift_once();
  }
  return &static OS_os_log.dataSync;
}

id static OS_os_log.dataSync.getter()
{
  return sub_100050E64(&qword_10007C7D0, (void **)&static OS_os_log.dataSync);
}

void static OS_os_log.dataSync.setter(void *a1)
{
}

uint64_t (*static OS_os_log.dataSync.modify())()
{
  if (qword_10007C7D0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004F734()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLCommandControllerCat_log_t, &CRLCommandControllerCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.commandController = (uint64_t)v1;
}

uint64_t *OS_os_log.commandController.unsafeMutableAddressor()
{
  if (qword_10007C7D8 != -1) {
    swift_once();
  }
  return &static OS_os_log.commandController;
}

id static OS_os_log.commandController.getter()
{
  return sub_100050E64(&qword_10007C7D8, (void **)&static OS_os_log.commandController);
}

void static OS_os_log.commandController.setter(void *a1)
{
}

uint64_t (*static OS_os_log.commandController.modify())()
{
  if (qword_10007C7D8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004F908()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLSuspendResumeCollaborationCat_log_t, &CRLSuspendResumeCollaborationCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.suspendResumeCollaboration = (uint64_t)v1;
}

uint64_t *OS_os_log.suspendResumeCollaboration.unsafeMutableAddressor()
{
  if (qword_10007C7E0 != -1) {
    swift_once();
  }
  return &static OS_os_log.suspendResumeCollaboration;
}

id static OS_os_log.suspendResumeCollaboration.getter()
{
  return sub_100050E64(&qword_10007C7E0, (void **)&static OS_os_log.suspendResumeCollaboration);
}

void static OS_os_log.suspendResumeCollaboration.setter(void *a1)
{
}

uint64_t (*static OS_os_log.suspendResumeCollaboration.modify())()
{
  if (qword_10007C7E0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004FADC()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLCarmelRealTimeSyncCat_log_t, &CRLCarmelRealTimeSyncCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.realTimeSync = (uint64_t)v1;
}

uint64_t *OS_os_log.realTimeSync.unsafeMutableAddressor()
{
  if (qword_10007C7E8 != -1) {
    swift_once();
  }
  return &static OS_os_log.realTimeSync;
}

id static OS_os_log.realTimeSync.getter()
{
  return sub_100050E64(&qword_10007C7E8, (void **)&static OS_os_log.realTimeSync);
}

void static OS_os_log.realTimeSync.setter(void *a1)
{
}

uint64_t (*static OS_os_log.realTimeSync.modify())()
{
  if (qword_10007C7E8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004FCB0()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLKeyboardInputCat_log_t, &CRLKeyboardInputCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.keyboardInput = (uint64_t)v1;
}

uint64_t *OS_os_log.keyboardInput.unsafeMutableAddressor()
{
  if (qword_10007C7F0 != -1) {
    swift_once();
  }
  return &static OS_os_log.keyboardInput;
}

id static OS_os_log.keyboardInput.getter()
{
  return sub_100050E64(&qword_10007C7F0, (void **)&static OS_os_log.keyboardInput);
}

void static OS_os_log.keyboardInput.setter(void *a1)
{
}

uint64_t (*static OS_os_log.keyboardInput.modify())()
{
  if (qword_10007C7F0 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10004FE8C()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLTargetGestureCat_log_t, &CRLTargetGestureCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.target_gesture = (uint64_t)v1;
}

uint64_t *OS_os_log.target_gesture.unsafeMutableAddressor()
{
  if (qword_10007C7F8 != -1) {
    swift_once();
  }
  return &static OS_os_log.target_gesture;
}

id static OS_os_log.target_gesture.getter()
{
  return sub_100050E64(&qword_10007C7F8, (void **)&static OS_os_log.target_gesture);
}

void static OS_os_log.target_gesture.setter(void *a1)
{
}

uint64_t (*static OS_os_log.target_gesture.modify())()
{
  if (qword_10007C7F8 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_100050068()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLDataStoreUpgradeCat_log_t, &CRLDataStoreUpgradeCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.upgrade = (uint64_t)v1;
}

uint64_t *OS_os_log.upgrade.unsafeMutableAddressor()
{
  if (qword_10007C800 != -1) {
    swift_once();
  }
  return &static OS_os_log.upgrade;
}

id static OS_os_log.upgrade.getter()
{
  return sub_100050E64(&qword_10007C800, (void **)&static OS_os_log.upgrade);
}

void static OS_os_log.upgrade.setter(void *a1)
{
}

uint64_t (*static OS_os_log.upgrade.modify())()
{
  if (qword_10007C800 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_10005023C()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLPasteboardCat_log_t, &CRLPasteboardCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.pasteboard = (uint64_t)v1;
}

uint64_t *OS_os_log.pasteboard.unsafeMutableAddressor()
{
  if (qword_10007C808 != -1) {
    swift_once();
  }
  return &static OS_os_log.pasteboard;
}

id static OS_os_log.pasteboard.getter()
{
  return sub_100050E64(&qword_10007C808, (void **)&static OS_os_log.pasteboard);
}

void static OS_os_log.pasteboard.setter(void *a1)
{
}

uint64_t (*static OS_os_log.pasteboard.modify())()
{
  if (qword_10007C808 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_100050410()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLBoardItemDataSizeCat_log_t, &CRLBoardItemDataSizeCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.boardItemDataSize = (uint64_t)v1;
}

uint64_t *OS_os_log.boardItemDataSize.unsafeMutableAddressor()
{
  if (qword_10007C810 != -1) {
    swift_once();
  }
  return &static OS_os_log.boardItemDataSize;
}

id static OS_os_log.boardItemDataSize.getter()
{
  return sub_100050E64(&qword_10007C810, (void **)&static OS_os_log.boardItemDataSize);
}

void static OS_os_log.boardItemDataSize.setter(void *a1)
{
}

uint64_t (*static OS_os_log.boardItemDataSize.modify())()
{
  if (qword_10007C810 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_1000505E4()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLBoardItemLifecycleCat_log_t, &CRLBoardItemLifecycleCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.boardItemLifecycle = (uint64_t)v1;
}

uint64_t *OS_os_log.boardItemLifecycle.unsafeMutableAddressor()
{
  if (qword_10007C818 != -1) {
    swift_once();
  }
  return &static OS_os_log.boardItemLifecycle;
}

id static OS_os_log.boardItemLifecycle.getter()
{
  return sub_100050E64(&qword_10007C818, (void **)&static OS_os_log.boardItemLifecycle);
}

void static OS_os_log.boardItemLifecycle.setter(void *a1)
{
}

uint64_t (*static OS_os_log.boardItemLifecycle.modify())()
{
  if (qword_10007C818 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_1000507B8()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLAssetManagementCat_log_t, &CRLAssetManagementCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.assetManagement = (uint64_t)v1;
}

uint64_t *OS_os_log.assetManagement.unsafeMutableAddressor()
{
  if (qword_10007C820 != -1) {
    swift_once();
  }
  return &static OS_os_log.assetManagement;
}

id static OS_os_log.assetManagement.getter()
{
  return sub_100050E64(&qword_10007C820, (void **)&static OS_os_log.assetManagement);
}

void static OS_os_log.assetManagement.setter(void *a1)
{
}

uint64_t (*static OS_os_log.assetManagement.modify())()
{
  if (qword_10007C820 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_100050994()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLShareStateCat_log_t, &CRLShareStateCat_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.shareState = (uint64_t)v1;
}

uint64_t *OS_os_log.shareState.unsafeMutableAddressor()
{
  if (qword_10007C828 != -1) {
    swift_once();
  }
  return &static OS_os_log.shareState;
}

id static OS_os_log.shareState.getter()
{
  return sub_100050E64(&qword_10007C828, (void **)&static OS_os_log.shareState);
}

void static OS_os_log.shareState.setter(void *a1)
{
}

uint64_t (*static OS_os_log.shareState.modify())()
{
  if (qword_10007C828 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_100050B68()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLDrawingDataDetectors_log_t, &CRLDrawingDataDetectors_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.DrawingDataDetectors = (uint64_t)v1;
}

uint64_t *OS_os_log.DrawingDataDetectors.unsafeMutableAddressor()
{
  if (qword_10007C830 != -1) {
    swift_once();
  }
  return &static OS_os_log.DrawingDataDetectors;
}

id static OS_os_log.DrawingDataDetectors.getter()
{
  return sub_100050E64(&qword_10007C830, (void **)&static OS_os_log.DrawingDataDetectors);
}

void static OS_os_log.DrawingDataDetectors.setter(void *a1)
{
}

uint64_t (*static OS_os_log.DrawingDataDetectors.modify())()
{
  if (qword_10007C830 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void sub_100050D3C()
{
  swift_beginAccess();
  swift_beginAccess();
  NSString v0 = sub_10005C7D0();
  id v1 = CRLLogEnsureCreated(v0, (id *)&CRLSideStore_log_t, &CRLSideStore_init_token);
  swift_endAccess();
  swift_endAccess();

  static OS_os_log.sideStore = (uint64_t)v1;
}

uint64_t *OS_os_log.sideStore.unsafeMutableAddressor()
{
  if (qword_10007C838 != -1) {
    swift_once();
  }
  return &static OS_os_log.sideStore;
}

id static OS_os_log.sideStore.getter()
{
  return sub_100050E64(&qword_10007C838, (void **)&static OS_os_log.sideStore);
}

id sub_100050E64(void *a1, void **a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  swift_beginAccess();
  unsigned int v3 = *a2;

  return v3;
}

void static OS_os_log.sideStore.setter(void *a1)
{
}

void sub_100050EF0(void *a1, void *a2, void **a3)
{
  if (*a2 != -1) {
    swift_once();
  }
  swift_beginAccess();
  char v5 = *a3;
  *a3 = a1;
}

uint64_t (*static OS_os_log.sideStore.modify())()
{
  if (qword_10007C838 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_100050FE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  switch(*(void *)(a7 + 16))
  {
    case 1:
      sub_1000131E0(&qword_10007D870);
      uint64_t v9 = swift_allocObject();
      *(_OWORD *)(v9 + 16) = xmmword_1000622C0;
      uint64_t v10 = v9 + 32;
      uint64_t v11 = a7 + 32;
      goto LABEL_25;
    case 2:
      sub_1000131E0(&qword_10007D870);
      uint64_t v12 = swift_allocObject();
      *(_OWORD *)(v12 + 16) = xmmword_100062290;
      sub_100051E48(a7 + 32, v12 + 32);
      uint64_t v10 = v12 + 72;
      uint64_t v11 = a7 + 72;
      goto LABEL_25;
    case 3:
      sub_1000131E0(&qword_10007D870);
      uint64_t v13 = swift_allocObject();
      *(_OWORD *)(v13 + 16) = xmmword_100062B80;
      sub_100051E48(a7 + 32, v13 + 32);
      sub_100051E48(a7 + 72, v13 + 72);
      uint64_t v10 = v13 + 112;
      uint64_t v11 = a7 + 112;
      goto LABEL_25;
    case 4:
      sub_1000131E0(&qword_10007D870);
      uint64_t v14 = swift_allocObject();
      *(_OWORD *)(v14 + 16) = xmmword_100062B70;
      sub_100051E48(a7 + 32, v14 + 32);
      sub_100051E48(a7 + 72, v14 + 72);
      sub_100051E48(a7 + 112, v14 + 112);
      uint64_t v10 = v14 + 152;
      uint64_t v11 = a7 + 152;
      goto LABEL_25;
    case 5:
      sub_1000131E0(&qword_10007D870);
      uint64_t v15 = swift_allocObject();
      *(_OWORD *)(v15 + 16) = xmmword_100062B60;
      sub_100051E48(a7 + 32, v15 + 32);
      sub_100051E48(a7 + 72, v15 + 72);
      sub_100051E48(a7 + 112, v15 + 112);
      sub_100051E48(a7 + 152, v15 + 152);
      uint64_t v10 = v15 + 192;
      uint64_t v11 = a7 + 192;
      goto LABEL_25;
    case 6:
      sub_1000131E0(&qword_10007D870);
      uint64_t v16 = swift_allocObject();
      *(_OWORD *)(v16 + 16) = xmmword_100062B50;
      sub_100051E48(a7 + 32, v16 + 32);
      sub_100051E48(a7 + 72, v16 + 72);
      sub_100051E48(a7 + 112, v16 + 112);
      sub_100051E48(a7 + 152, v16 + 152);
      sub_100051E48(a7 + 192, v16 + 192);
      uint64_t v10 = v16 + 232;
      uint64_t v11 = a7 + 232;
      goto LABEL_25;
    case 7:
      sub_1000131E0(&qword_10007D870);
      uint64_t v17 = swift_allocObject();
      *(_OWORD *)(v17 + 16) = xmmword_100062B40;
      sub_100051E48(a7 + 32, v17 + 32);
      sub_100051E48(a7 + 72, v17 + 72);
      sub_100051E48(a7 + 112, v17 + 112);
      sub_100051E48(a7 + 152, v17 + 152);
      sub_100051E48(a7 + 192, v17 + 192);
      sub_100051E48(a7 + 232, v17 + 232);
      uint64_t v10 = v17 + 272;
      uint64_t v11 = a7 + 272;
      goto LABEL_25;
    case 8:
      sub_1000131E0(&qword_10007D870);
      uint64_t v18 = swift_allocObject();
      *(_OWORD *)(v18 + 16) = xmmword_100062B30;
      sub_100051E48(a7 + 32, v18 + 32);
      sub_100051E48(a7 + 72, v18 + 72);
      sub_100051E48(a7 + 112, v18 + 112);
      sub_100051E48(a7 + 152, v18 + 152);
      sub_100051E48(a7 + 192, v18 + 192);
      sub_100051E48(a7 + 232, v18 + 232);
      sub_100051E48(a7 + 272, v18 + 272);
      uint64_t v10 = v18 + 312;
      uint64_t v11 = a7 + 312;
      goto LABEL_25;
    case 9:
      sub_1000131E0(&qword_10007D870);
      uint64_t v19 = swift_allocObject();
      *(_OWORD *)(v19 + 16) = xmmword_100062B20;
      sub_100051E48(a7 + 32, v19 + 32);
      sub_100051E48(a7 + 72, v19 + 72);
      sub_100051E48(a7 + 112, v19 + 112);
      sub_100051E48(a7 + 152, v19 + 152);
      sub_100051E48(a7 + 192, v19 + 192);
      sub_100051E48(a7 + 232, v19 + 232);
      sub_100051E48(a7 + 272, v19 + 272);
      sub_100051E48(a7 + 312, v19 + 312);
      uint64_t v10 = v19 + 352;
      uint64_t v11 = a7 + 352;
      goto LABEL_25;
    case 0xALL:
      sub_1000131E0(&qword_10007D870);
      uint64_t v20 = swift_allocObject();
      *(_OWORD *)(v20 + 16) = xmmword_100062B10;
      sub_100051E48(a7 + 32, v20 + 32);
      sub_100051E48(a7 + 72, v20 + 72);
      sub_100051E48(a7 + 112, v20 + 112);
      sub_100051E48(a7 + 152, v20 + 152);
      sub_100051E48(a7 + 192, v20 + 192);
      sub_100051E48(a7 + 232, v20 + 232);
      sub_100051E48(a7 + 272, v20 + 272);
      sub_100051E48(a7 + 312, v20 + 312);
      sub_100051E48(a7 + 352, v20 + 352);
      uint64_t v10 = v20 + 392;
      uint64_t v11 = a7 + 392;
      goto LABEL_25;
    case 0xBLL:
      sub_1000131E0(&qword_10007D870);
      uint64_t v21 = swift_allocObject();
      *(_OWORD *)(v21 + 16) = xmmword_100062B00;
      sub_100051E48(a7 + 32, v21 + 32);
      sub_100051E48(a7 + 72, v21 + 72);
      sub_100051E48(a7 + 112, v21 + 112);
      sub_100051E48(a7 + 152, v21 + 152);
      sub_100051E48(a7 + 192, v21 + 192);
      sub_100051E48(a7 + 232, v21 + 232);
      sub_100051E48(a7 + 272, v21 + 272);
      sub_100051E48(a7 + 312, v21 + 312);
      sub_100051E48(a7 + 352, v21 + 352);
      sub_100051E48(a7 + 392, v21 + 392);
      uint64_t v10 = v21 + 432;
      uint64_t v11 = a7 + 432;
      goto LABEL_25;
    case 0xCLL:
      sub_1000131E0(&qword_10007D870);
      uint64_t v22 = swift_allocObject();
      *(_OWORD *)(v22 + 16) = xmmword_100062AF0;
      sub_100051E48(a7 + 32, v22 + 32);
      sub_100051E48(a7 + 72, v22 + 72);
      sub_100051E48(a7 + 112, v22 + 112);
      sub_100051E48(a7 + 152, v22 + 152);
      sub_100051E48(a7 + 192, v22 + 192);
      sub_100051E48(a7 + 232, v22 + 232);
      sub_100051E48(a7 + 272, v22 + 272);
      sub_100051E48(a7 + 312, v22 + 312);
      sub_100051E48(a7 + 352, v22 + 352);
      sub_100051E48(a7 + 392, v22 + 392);
      sub_100051E48(a7 + 432, v22 + 432);
      uint64_t v10 = v22 + 472;
      uint64_t v11 = a7 + 472;
      goto LABEL_25;
    case 0xDLL:
      sub_1000131E0(&qword_10007D870);
      uint64_t v23 = swift_allocObject();
      *(_OWORD *)(v23 + 16) = xmmword_100062AE0;
      sub_100051E48(a7 + 32, v23 + 32);
      sub_100051E48(a7 + 72, v23 + 72);
      sub_100051E48(a7 + 112, v23 + 112);
      sub_100051E48(a7 + 152, v23 + 152);
      sub_100051E48(a7 + 192, v23 + 192);
      sub_100051E48(a7 + 232, v23 + 232);
      sub_100051E48(a7 + 272, v23 + 272);
      sub_100051E48(a7 + 312, v23 + 312);
      sub_100051E48(a7 + 352, v23 + 352);
      sub_100051E48(a7 + 392, v23 + 392);
      sub_100051E48(a7 + 432, v23 + 432);
      sub_100051E48(a7 + 472, v23 + 472);
      uint64_t v10 = v23 + 512;
      uint64_t v11 = a7 + 512;
      goto LABEL_25;
    case 0xELL:
      sub_1000131E0(&qword_10007D870);
      uint64_t v24 = swift_allocObject();
      *(_OWORD *)(v24 + 16) = xmmword_100062AD0;
      sub_100051E48(a7 + 32, v24 + 32);
      sub_100051E48(a7 + 72, v24 + 72);
      sub_100051E48(a7 + 112, v24 + 112);
      sub_100051E48(a7 + 152, v24 + 152);
      sub_100051E48(a7 + 192, v24 + 192);
      sub_100051E48(a7 + 232, v24 + 232);
      sub_100051E48(a7 + 272, v24 + 272);
      sub_100051E48(a7 + 312, v24 + 312);
      sub_100051E48(a7 + 352, v24 + 352);
      sub_100051E48(a7 + 392, v24 + 392);
      sub_100051E48(a7 + 432, v24 + 432);
      sub_100051E48(a7 + 472, v24 + 472);
      sub_100051E48(a7 + 512, v24 + 512);
      uint64_t v10 = v24 + 552;
      uint64_t v11 = a7 + 552;
      goto LABEL_25;
    case 0xFLL:
      sub_1000131E0(&qword_10007D870);
      uint64_t v25 = swift_allocObject();
      *(_OWORD *)(v25 + 16) = xmmword_100062AC0;
      sub_100051E48(a7 + 32, v25 + 32);
      sub_100051E48(a7 + 72, v25 + 72);
      sub_100051E48(a7 + 112, v25 + 112);
      sub_100051E48(a7 + 152, v25 + 152);
      sub_100051E48(a7 + 192, v25 + 192);
      sub_100051E48(a7 + 232, v25 + 232);
      sub_100051E48(a7 + 272, v25 + 272);
      sub_100051E48(a7 + 312, v25 + 312);
      sub_100051E48(a7 + 352, v25 + 352);
      sub_100051E48(a7 + 392, v25 + 392);
      sub_100051E48(a7 + 432, v25 + 432);
      sub_100051E48(a7 + 472, v25 + 472);
      sub_100051E48(a7 + 512, v25 + 512);
      sub_100051E48(a7 + 552, v25 + 552);
      uint64_t v10 = v25 + 592;
      uint64_t v11 = a7 + 592;
      goto LABEL_25;
    case 0x10:
      sub_1000131E0(&qword_10007D870);
      uint64_t v26 = swift_allocObject();
      *(_OWORD *)(v26 + 16) = xmmword_100062AB0;
      sub_100051E48(a7 + 32, v26 + 32);
      sub_100051E48(a7 + 72, v26 + 72);
      sub_100051E48(a7 + 112, v26 + 112);
      sub_100051E48(a7 + 152, v26 + 152);
      sub_100051E48(a7 + 192, v26 + 192);
      sub_100051E48(a7 + 232, v26 + 232);
      sub_100051E48(a7 + 272, v26 + 272);
      sub_100051E48(a7 + 312, v26 + 312);
      sub_100051E48(a7 + 352, v26 + 352);
      sub_100051E48(a7 + 392, v26 + 392);
      sub_100051E48(a7 + 432, v26 + 432);
      sub_100051E48(a7 + 472, v26 + 472);
      sub_100051E48(a7 + 512, v26 + 512);
      sub_100051E48(a7 + 552, v26 + 552);
      sub_100051E48(a7 + 592, v26 + 592);
      uint64_t v10 = v26 + 632;
      uint64_t v11 = a7 + 632;
      goto LABEL_25;
    case 0x11:
      sub_1000131E0(&qword_10007D870);
      uint64_t v27 = swift_allocObject();
      *(_OWORD *)(v27 + 16) = xmmword_100062AA0;
      sub_100051E48(a7 + 32, v27 + 32);
      sub_100051E48(a7 + 72, v27 + 72);
      sub_100051E48(a7 + 112, v27 + 112);
      sub_100051E48(a7 + 152, v27 + 152);
      sub_100051E48(a7 + 192, v27 + 192);
      sub_100051E48(a7 + 232, v27 + 232);
      sub_100051E48(a7 + 272, v27 + 272);
      sub_100051E48(a7 + 312, v27 + 312);
      sub_100051E48(a7 + 352, v27 + 352);
      sub_100051E48(a7 + 392, v27 + 392);
      sub_100051E48(a7 + 432, v27 + 432);
      sub_100051E48(a7 + 472, v27 + 472);
      sub_100051E48(a7 + 512, v27 + 512);
      sub_100051E48(a7 + 552, v27 + 552);
      sub_100051E48(a7 + 592, v27 + 592);
      sub_100051E48(a7 + 632, v27 + 632);
      uint64_t v10 = v27 + 672;
      uint64_t v11 = a7 + 672;
      goto LABEL_25;
    case 0x12:
      sub_1000131E0(&qword_10007D870);
      uint64_t v28 = swift_allocObject();
      *(_OWORD *)(v28 + 16) = xmmword_100062A90;
      sub_100051E48(a7 + 32, v28 + 32);
      sub_100051E48(a7 + 72, v28 + 72);
      sub_100051E48(a7 + 112, v28 + 112);
      sub_100051E48(a7 + 152, v28 + 152);
      sub_100051E48(a7 + 192, v28 + 192);
      sub_100051E48(a7 + 232, v28 + 232);
      sub_100051E48(a7 + 272, v28 + 272);
      sub_100051E48(a7 + 312, v28 + 312);
      sub_100051E48(a7 + 352, v28 + 352);
      sub_100051E48(a7 + 392, v28 + 392);
      sub_100051E48(a7 + 432, v28 + 432);
      sub_100051E48(a7 + 472, v28 + 472);
      sub_100051E48(a7 + 512, v28 + 512);
      sub_100051E48(a7 + 552, v28 + 552);
      sub_100051E48(a7 + 592, v28 + 592);
      sub_100051E48(a7 + 632, v28 + 632);
      sub_100051E48(a7 + 672, v28 + 672);
      uint64_t v10 = v28 + 712;
      uint64_t v11 = a7 + 712;
      goto LABEL_25;
    case 0x13:
      sub_1000131E0(&qword_10007D870);
      uint64_t v29 = swift_allocObject();
      *(_OWORD *)(v29 + 16) = xmmword_100062A80;
      sub_100051E48(a7 + 32, v29 + 32);
      sub_100051E48(a7 + 72, v29 + 72);
      sub_100051E48(a7 + 112, v29 + 112);
      sub_100051E48(a7 + 152, v29 + 152);
      sub_100051E48(a7 + 192, v29 + 192);
      sub_100051E48(a7 + 232, v29 + 232);
      sub_100051E48(a7 + 272, v29 + 272);
      sub_100051E48(a7 + 312, v29 + 312);
      sub_100051E48(a7 + 352, v29 + 352);
      sub_100051E48(a7 + 392, v29 + 392);
      sub_100051E48(a7 + 432, v29 + 432);
      sub_100051E48(a7 + 472, v29 + 472);
      sub_100051E48(a7 + 512, v29 + 512);
      sub_100051E48(a7 + 552, v29 + 552);
      sub_100051E48(a7 + 592, v29 + 592);
      sub_100051E48(a7 + 632, v29 + 632);
      sub_100051E48(a7 + 672, v29 + 672);
      sub_100051E48(a7 + 712, v29 + 712);
      uint64_t v10 = v29 + 752;
      uint64_t v11 = a7 + 752;
      goto LABEL_25;
    case 0x14:
      sub_1000131E0(&qword_10007D870);
      uint64_t v30 = swift_allocObject();
      *(_OWORD *)(v30 + 16) = xmmword_100062A70;
      sub_100051E48(a7 + 32, v30 + 32);
      sub_100051E48(a7 + 72, v30 + 72);
      sub_100051E48(a7 + 112, v30 + 112);
      sub_100051E48(a7 + 152, v30 + 152);
      sub_100051E48(a7 + 192, v30 + 192);
      sub_100051E48(a7 + 232, v30 + 232);
      sub_100051E48(a7 + 272, v30 + 272);
      sub_100051E48(a7 + 312, v30 + 312);
      sub_100051E48(a7 + 352, v30 + 352);
      sub_100051E48(a7 + 392, v30 + 392);
      sub_100051E48(a7 + 432, v30 + 432);
      sub_100051E48(a7 + 472, v30 + 472);
      sub_100051E48(a7 + 512, v30 + 512);
      sub_100051E48(a7 + 552, v30 + 552);
      sub_100051E48(a7 + 592, v30 + 592);
      sub_100051E48(a7 + 632, v30 + 632);
      sub_100051E48(a7 + 672, v30 + 672);
      sub_100051E48(a7 + 712, v30 + 712);
      sub_100051E48(a7 + 752, v30 + 752);
      uint64_t v10 = v30 + 792;
      uint64_t v11 = a7 + 792;
LABEL_25:
      sub_100051E48(v11, v10);
      sub_10005C520();
      uint64_t result = swift_bridgeObjectRelease();
      break;
    default:
      uint64_t result = sub_10005C520();
      break;
  }
  return result;
}

uint64_t sub_100051E48(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

size_t sub_100051EB0(size_t result)
{
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *(void **)v1;
  int64_t v4 = *(void *)(*(void *)v1 + 16);
  int64_t v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  size_t v6 = result;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  if (result && v5 <= v3[3] >> 1)
  {
    if (*(void *)(v6 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
  if (v4 <= v5) {
    int64_t v11 = v4 + v2;
  }
  else {
    int64_t v11 = v4;
  }
  uint64_t result = sub_10005377C(result, v11, 1, v3, &qword_10007DAD0, type metadata accessor for CRLSELibraryViewModeItemNode);
  uint64_t v3 = (void *)result;
  if (!*(void *)(v6 + 16))
  {
LABEL_13:
    if (!v2) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
LABEL_5:
  uint64_t v7 = (v3[3] >> 1) - v3[2];
  uint64_t result = type metadata accessor for CRLSELibraryViewModeItemNode(0);
  if (v7 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t result = swift_arrayInitWithCopy();
  if (!v2)
  {
LABEL_14:
    uint64_t result = swift_bridgeObjectRelease();
    *(void *)uint64_t v1 = v3;
    return result;
  }
  uint64_t v8 = v3[2];
  BOOL v9 = __OFADD__(v8, v2);
  uint64_t v10 = v8 + v2;
  if (!v9)
  {
    v3[2] = v10;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
  return result;
}

uint64_t sub_100051FF4(uint64_t result)
{
  uint64_t v2 = *(void *)(result + 16);
  uint64_t v3 = *v1;
  uint64_t v4 = *(void *)(*v1 + 16);
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_15:
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v5 = result;
  uint64_t result = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v1 = v3;
  if (result)
  {
    uint64_t v6 = *(void *)(v3 + 24) >> 1;
    if (v6 >= v4 + v2)
    {
      if (*(void *)(v5 + 16)) {
        goto LABEL_5;
      }
      goto LABEL_10;
    }
  }
  swift_bridgeObjectRetain();
  uint64_t v3 = sub_10005CBF0();
  uint64_t result = swift_bridgeObjectRelease();
  *uint64_t v1 = v3;
  uint64_t v6 = *(void *)(v3 + 24) >> 1;
  if (!*(void *)(v5 + 16))
  {
LABEL_10:
    if (!v2) {
      goto LABEL_11;
    }
    goto LABEL_15;
  }
LABEL_5:
  if (v6 - *(void *)(v3 + 16) < v2)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  sub_1000131E0((uint64_t *)&unk_10007D960);
  uint64_t result = swift_arrayInitWithCopy();
  if (v2)
  {
    uint64_t v7 = *(void *)(*v1 + 16);
    BOOL v8 = __OFADD__(v7, v2);
    uint64_t v9 = v7 + v2;
    if (!v8)
    {
      *(void *)(*v1 + 16) = v9;
      goto LABEL_11;
    }
LABEL_17:
    __break(1u);
    return result;
  }
LABEL_11:
  swift_bridgeObjectRelease();

  return sub_10005C910();
}

uint64_t sub_100052134(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_10005CCA0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v4 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v5 = v4 + v3;
    if (!__OFADD__(v4, v3)) {
      goto LABEL_5;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_10005CCA0();
  swift_bridgeObjectRelease();
  uint64_t v5 = v15 + v3;
  if (__OFADD__(v15, v3)) {
    goto LABEL_21;
  }
LABEL_5:
  unint64_t v6 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v6;
  if (isUniquelyReferenced_nonNull_bridgeObject)
  {
    if ((v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
    {
      uint64_t v8 = v6 & 0xFFFFFFFFFFFFFF8;
      if (v5 <= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        goto LABEL_11;
      }
    }
  }
  if (v6 >> 62) {
    goto LABEL_23;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_10005CBF0();
    swift_bridgeObjectRelease();
    *uint64_t v1 = v9;
    uint64_t v8 = v9 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_100059EFC(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    sub_10005CCA0();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();

  return sub_10005C910();
}

uint64_t sub_100052300@<X0>(uint64_t a1@<X8>)
{
  uint64_t v48 = a1;
  uint64_t v2 = type metadata accessor for CRLSELibraryViewModeItemNode(0);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v56 = (uint64_t)v44 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v52 = (uint64_t)v44 - v6;
  uint64_t v45 = sub_1000131E0((uint64_t *)&unk_10007D6F0);
  uint64_t v53 = *(void *)(v45 - 8);
  uint64_t v7 = __chkstk_darwin(v45);
  uint64_t v9 = (char *)v44 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)v44 - v11;
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)v44 - v13;
  uint64_t v15 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  uint64_t v16 = __chkstk_darwin(v15 - 8);
  uint64_t v47 = (uint64_t)v44 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v20 = (char *)v44 - v19;
  __chkstk_darwin(v18);
  uint64_t v22 = (char *)v44 - v21;
  uint64_t v46 = v1;
  uint64_t v23 = v1 + OBJC_IVAR____TtC24FreeformSharingExtension12CRLSELibrary_libraryNode;
  uint64_t v24 = v2;
  swift_beginAccess();
  sub_1000535F0(v23, (uint64_t)v14);
  uint64_t v25 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  if (v25((uint64_t)v14, 1, v24))
  {
    sub_10001E8C0((uint64_t)v14, (uint64_t *)&unk_10007D6F0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(v48, 1, 1, v24);
  }
  else
  {
    uint64_t v54 = v9;
    uint64_t v55 = v25;
    uint64_t v50 = v3;
    sub_10005A298((uint64_t)v14, (uint64_t)v20, type metadata accessor for CRLSELibraryViewModel.Item);
    sub_10001E8C0((uint64_t)v14, (uint64_t *)&unk_10007D6F0);
    sub_10005A360((uint64_t)v20, (uint64_t)v22, type metadata accessor for CRLSELibraryViewModel.Item);
    sub_10005A298((uint64_t)v22, v47, type metadata accessor for CRLSELibraryViewModel.Item);
    sub_1000131E0(&qword_10007DAE0);
    uint64_t v27 = *(void *)(v53 + 72);
    uint64_t v28 = *(unsigned __int8 *)(v53 + 80);
    uint64_t v51 = v24;
    uint64_t v29 = (v28 + 32) & ~v28;
    uint64_t v30 = swift_allocObject();
    *(_OWORD *)(v30 + 16) = xmmword_100062B70;
    v44[1] = v30;
    uint64_t v31 = v30 + v29;
    uint64_t v32 = v46;
    uint64_t v33 = v46 + OBJC_IVAR____TtC24FreeformSharingExtension12CRLSELibrary_allBoards;
    swift_beginAccess();
    sub_1000535F0(v33, v31);
    uint64_t v34 = v32 + OBJC_IVAR____TtC24FreeformSharingExtension12CRLSELibrary_recents;
    swift_beginAccess();
    sub_1000535F0(v34, v31 + v27);
    sub_1000529E4(v31 + 2 * v27);
    uint64_t v53 = v27;
    uint64_t v35 = v51;
    sub_100052D10(v31 + 3 * v27);
    uint64_t v36 = _swiftEmptyArrayStorage;
    uint64_t v37 = 4;
    uint64_t v46 = v31;
    uint64_t v38 = v31;
    id v49 = v12;
    uint64_t v39 = (uint64_t)v54;
    do
    {
      sub_1000535F0(v38, (uint64_t)v12);
      sub_10003C51C((uint64_t)v12, v39, (uint64_t *)&unk_10007D6F0);
      if (v55(v39, 1, v35) == 1)
      {
        sub_10001E8C0(v39, (uint64_t *)&unk_10007D6F0);
      }
      else
      {
        uint64_t v40 = v52;
        sub_10005A360(v39, v52, type metadata accessor for CRLSELibraryViewModeItemNode);
        sub_10005A360(v40, v56, type metadata accessor for CRLSELibraryViewModeItemNode);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v36 = (void *)sub_10005377C(0, v36[2] + 1, 1, v36, &qword_10007DAD0, type metadata accessor for CRLSELibraryViewModeItemNode);
        }
        unint64_t v42 = v36[2];
        unint64_t v41 = v36[3];
        if (v42 >= v41 >> 1) {
          uint64_t v36 = (void *)sub_10005377C(v41 > 1, v42 + 1, 1, v36, &qword_10007DAD0, type metadata accessor for CRLSELibraryViewModeItemNode);
        }
        v36[2] = v42 + 1;
        sub_10005A360(v56, (uint64_t)v36+ ((*(unsigned __int8 *)(v50 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v50 + 80))+ *(void *)(v50 + 72) * v42, type metadata accessor for CRLSELibraryViewModeItemNode);
        uint64_t v35 = v51;
        uint64_t v12 = v49;
      }
      v38 += v53;
      --v37;
    }
    while (v37);
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_deallocClassInstance();
    sub_10005A300((uint64_t)v22, type metadata accessor for CRLSELibraryViewModel.Item);
    uint64_t v43 = v48;
    sub_10005A360(v47, v48, type metadata accessor for CRLSELibraryViewModel.Item);
    *(void *)(v43 + *(int *)(v35 + 20)) = v36;
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v50 + 56))(v43, 0, 1, v35);
  }
}

uint64_t (*sub_10005292C())()
{
  return j_j__swift_endAccess;
}

uint64_t (*sub_100052988())()
{
  return j__swift_endAccess;
}

uint64_t sub_1000529E4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for CRLSELibraryViewModeItemNode(0);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000131E0((uint64_t *)&unk_10007D6F0);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = v1 + OBJC_IVAR____TtC24FreeformSharingExtension12CRLSELibrary_libraryNode;
  swift_beginAccess();
  sub_1000535F0(v13, (uint64_t)v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v12, 1, v6))
  {
    sub_10001E8C0((uint64_t)v12, (uint64_t *)&unk_10007D6F0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(a1, 1, 1, v6);
  }
  else
  {
    uint64_t v15 = *(void *)&v12[*(int *)(v6 + 20)];
    swift_bridgeObjectRetain();
    sub_10001E8C0((uint64_t)v12, (uint64_t *)&unk_10007D6F0);
    uint64_t v16 = *(void *)(v15 + 16);
    if (v16)
    {
      uint64_t v17 = v15 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
      uint64_t v18 = *(void *)(v7 + 72);
      swift_bridgeObjectRetain();
      do
      {
        sub_10005A298(v17, (uint64_t)v9, type metadata accessor for CRLSELibraryViewModeItemNode);
        sub_10005A298((uint64_t)v9, (uint64_t)v5, type metadata accessor for CRLSELibraryViewModel.Item);
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          if (*v5 == 3)
          {
            swift_bridgeObjectRelease();
            sub_10005A360((uint64_t)v9, a1, type metadata accessor for CRLSELibraryViewModeItemNode);
            (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
            return swift_bridgeObjectRelease();
          }
        }
        else
        {
          sub_10005A300((uint64_t)v5, type metadata accessor for CRLSELibraryViewModel.Item);
        }
        sub_10005A300((uint64_t)v9, type metadata accessor for CRLSELibraryViewModeItemNode);
        v17 += v18;
        --v16;
      }
      while (v16);
      swift_bridgeObjectRelease();
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(a1, 1, 1, v6);
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_100052D10@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for CRLSELibraryViewModeItemNode(0);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1000131E0((uint64_t *)&unk_10007D6F0);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = v1 + OBJC_IVAR____TtC24FreeformSharingExtension12CRLSELibrary_libraryNode;
  swift_beginAccess();
  sub_1000535F0(v13, (uint64_t)v12);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v12, 1, v6))
  {
    sub_10001E8C0((uint64_t)v12, (uint64_t *)&unk_10007D6F0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(a1, 1, 1, v6);
  }
  else
  {
    uint64_t v15 = *(void *)&v12[*(int *)(v6 + 20)];
    swift_bridgeObjectRetain();
    sub_10001E8C0((uint64_t)v12, (uint64_t *)&unk_10007D6F0);
    uint64_t v16 = *(void *)(v15 + 16);
    if (v16)
    {
      uint64_t v17 = v15 + ((*(unsigned __int8 *)(v7 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));
      uint64_t v18 = *(void *)(v7 + 72);
      swift_bridgeObjectRetain();
      do
      {
        sub_10005A298(v17, (uint64_t)v9, type metadata accessor for CRLSELibraryViewModeItemNode);
        sub_10005A298((uint64_t)v9, (uint64_t)v5, type metadata accessor for CRLSELibraryViewModel.Item);
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          if (*v5 == 2)
          {
            swift_bridgeObjectRelease();
            sub_10005A360((uint64_t)v9, a1, type metadata accessor for CRLSELibraryViewModeItemNode);
            (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
            return swift_bridgeObjectRelease();
          }
        }
        else
        {
          sub_10005A300((uint64_t)v5, type metadata accessor for CRLSELibraryViewModel.Item);
        }
        sub_10005A300((uint64_t)v9, type metadata accessor for CRLSELibraryViewModeItemNode);
        v17 += v18;
        --v16;
      }
      while (v16);
      swift_bridgeObjectRelease();
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(a1, 1, 1, v6);
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_10005303C(size_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1000131E0((uint64_t *)&unk_10007D6F0);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v24 - v8;
  uint64_t v10 = v2 + OBJC_IVAR____TtC24FreeformSharingExtension12CRLSELibrary_allBoards;
  swift_beginAccess();
  sub_1000535F0(v10, (uint64_t)v9);
  uint64_t v11 = type metadata accessor for CRLSELibraryViewModeItemNode(0);
  uint64_t v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(*(void *)(v11 - 8) + 48);
  if (v12(v9, 1, v11))
  {
    uint64_t v13 = _swiftEmptyArrayStorage;
  }
  else
  {
    uint64_t v13 = *(void **)&v9[*(int *)(v11 + 20)];
    swift_bridgeObjectRetain();
  }
  sub_10001E8C0((uint64_t)v9, (uint64_t *)&unk_10007D6F0);
  uint64_t v27 = v13;
  swift_bridgeObjectRetain();
  sub_100051EB0(a1);
  sub_100053354(&v27, sub_1000559E4);
  uint64_t v14 = sub_10005292C();
  uint64_t v16 = v15;
  if (!v12(v15, 1, v11))
  {
    *(void *)&v16[*(int *)(v11 + 20)] = v27;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  ((void (*)(unsigned char *, void))v14)(v26, 0);
  uint64_t v17 = v2 + OBJC_IVAR____TtC24FreeformSharingExtension12CRLSELibrary_recents;
  swift_beginAccess();
  sub_1000535F0(v17, (uint64_t)v7);
  if (v12(v7, 1, v11))
  {
    uint64_t v18 = _swiftEmptyArrayStorage;
  }
  else
  {
    uint64_t v18 = *(void **)&v7[*(int *)(v11 + 20)];
    swift_bridgeObjectRetain();
  }
  sub_10001E8C0((uint64_t)v7, (uint64_t *)&unk_10007D6F0);
  uint64_t v25 = v18;
  size_t v19 = swift_bridgeObjectRetain();
  sub_100051EB0(v19);
  sub_100053354(&v25, sub_100053D80);
  swift_bridgeObjectRelease();
  uint64_t v20 = sub_100052988();
  uint64_t v22 = v21;
  if (!v12(v21, 1, v11)) {
    *(void *)&v22[*(int *)(v11 + 20)] = v25;
  }
  swift_bridgeObjectRelease();
  return ((uint64_t (*)(unsigned char *, void))v20)(v26, 0);
}

uint64_t sub_100053354(void **a1, uint64_t (*a2)(void *))
{
  uint64_t v4 = *(void *)(type metadata accessor for CRLSELibraryViewModeItemNode(0) - 8);
  uint64_t v5 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v5 = (void *)sub_10005A1D4(v5);
  }
  uint64_t v6 = v5[2];
  v8[0] = (char *)v5 + ((*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  v8[1] = v6;
  uint64_t result = a2(v8);
  *a1 = v5;
  return result;
}

uint64_t sub_100053410()
{
  sub_10001E8C0(v0 + OBJC_IVAR____TtC24FreeformSharingExtension12CRLSELibrary_libraryNode, (uint64_t *)&unk_10007D6F0);
  sub_10001E8C0(v0 + OBJC_IVAR____TtC24FreeformSharingExtension12CRLSELibrary_allBoards, (uint64_t *)&unk_10007D6F0);
  sub_10001E8C0(v0 + OBJC_IVAR____TtC24FreeformSharingExtension12CRLSELibrary_recents, (uint64_t *)&unk_10007D6F0);

  return swift_deallocClassInstance();
}

uint64_t sub_1000534B0()
{
  return type metadata accessor for CRLSELibrary();
}

uint64_t type metadata accessor for CRLSELibrary()
{
  uint64_t result = qword_10007D9B0;
  if (!qword_10007D9B0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100053504()
{
  sub_100053598();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_100053598()
{
  if (!qword_10007D9C0)
  {
    type metadata accessor for CRLSELibraryViewModeItemNode(255);
    unint64_t v0 = sub_10005CAB0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10007D9C0);
    }
  }
}

uint64_t sub_1000535F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000131E0((uint64_t *)&unk_10007D6F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

char *sub_100053658(char *result, int64_t a2, char a3, char *a4)
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
    sub_1000131E0((uint64_t *)&unk_10007D760);
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
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
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
  swift_bridgeObjectRelease();
  return v10;
}

size_t sub_10005375C(size_t a1, int64_t a2, char a3, void *a4)
{
  return sub_10005377C(a1, a2, a3, a4, &qword_10007DAE8, type metadata accessor for CRLSEManifestItem);
}

size_t sub_10005377C(size_t result, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t (*a6)(void))
{
  char v8 = result;
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_30:
        __break(1u);
        return result;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (!v12)
  {
    uint64_t v16 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_1000131E0(a5);
  uint64_t v13 = *(void *)(a6(0) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v16 = (void *)swift_allocObject();
  uint64_t result = j__malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v15 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_29;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(result - v15) / v14);
LABEL_19:
  uint64_t v18 = *(void *)(a6(0) - 8);
  if (v8)
  {
    if (v16 < a4
      || (unint64_t v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80),
          (char *)v16 + v19 >= (char *)a4 + v19 + *(void *)(v18 + 72) * v11))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v16;
}

size_t sub_100053958(size_t a1, int64_t a2, char a3, void *a4)
{
  return sub_100053BA4(a1, a2, a3, a4, &qword_10007DAD0, type metadata accessor for CRLSELibraryViewModeItemNode);
}

char *sub_100053978(char *result, int64_t a2, char a3, char *a4)
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
    sub_1000131E0(&qword_10007D450);
    int64_t v10 = (char *)swift_allocObject();
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
    int64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
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
  swift_release();
  return v10;
}

char *sub_100053A80(char *result, int64_t a2, char a3, char *a4)
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
    sub_1000131E0((uint64_t *)&unk_10007D760);
    int64_t v10 = (char *)swift_allocObject();
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
    int64_t v10 = (char *)_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
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

size_t sub_100053B84(size_t a1, int64_t a2, char a3, void *a4)
{
  return sub_100053BA4(a1, a2, a3, a4, &qword_10007DAF0, type metadata accessor for CRLSELibraryViewModel.Item);
}

size_t sub_100053BA4(size_t result, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t (*a6)(void))
{
  char v8 = result;
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_30:
        __break(1u);
        return result;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (!v12)
  {
    uint64_t v16 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_1000131E0(a5);
  uint64_t v13 = *(void *)(a6(0) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v16 = (void *)swift_allocObject();
  uint64_t result = j__malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v15 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_29;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(result - v15) / v14);
LABEL_19:
  uint64_t v18 = *(void *)(a6(0) - 8);
  if (v8)
  {
    if (v16 < a4
      || (unint64_t v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80),
          (char *)v16 + v19 >= (char *)a4 + v19 + *(void *)(v18 + 72) * v11))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v16;
}

uint64_t sub_100053D80(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v302 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  uint64_t v4 = __chkstk_darwin(v302);
  uint64_t v297 = (uint64_t)v253 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __chkstk_darwin(v4);
  uint64_t v300 = (uint64_t)v253 - v7;
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v276 = (uint64_t)v253 - v9;
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v280 = (uint64_t)v253 - v11;
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)v253 - v13;
  __chkstk_darwin(v12);
  uint64_t v267 = (uint64_t)v253 - v15;
  uint64_t v16 = sub_1000131E0((uint64_t *)&unk_10007D850);
  uint64_t v17 = __chkstk_darwin(v16 - 8);
  uint64_t v287 = (uint64_t)v253 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v21 = (char *)v253 - v20;
  uint64_t v22 = __chkstk_darwin(v19);
  uint64_t v270 = (uint64_t)v253 - v23;
  uint64_t v24 = __chkstk_darwin(v22);
  uint64_t v275 = (uint64_t)v253 - v25;
  uint64_t v26 = __chkstk_darwin(v24);
  uint64_t v259 = (uint64_t)v253 - v27;
  __chkstk_darwin(v26);
  uint64_t v260 = (uint64_t)v253 - v28;
  uint64_t v304 = sub_10005C390();
  uint64_t v29 = *(void *)(v304 - 8);
  uint64_t v30 = __chkstk_darwin(v304);
  uint64_t v286 = (char *)v253 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = __chkstk_darwin(v30);
  v296 = (char *)v253 - v33;
  uint64_t v34 = __chkstk_darwin(v32);
  v264 = (char *)v253 - v35;
  uint64_t v36 = __chkstk_darwin(v34);
  v274 = (char *)v253 - v37;
  uint64_t v38 = __chkstk_darwin(v36);
  uint64_t v40 = (char *)v253 - v39;
  __chkstk_darwin(v38);
  v261 = (char *)v253 - v41;
  uint64_t v282 = type metadata accessor for CRLSELibraryViewModeItemNode(0);
  uint64_t v281 = *(void *)(v282 - 8);
  uint64_t v42 = __chkstk_darwin(v282);
  uint64_t v273 = (uint64_t)v253 - ((v43 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v44 = __chkstk_darwin(v42);
  uint64_t v294 = (uint64_t)v253 - v45;
  uint64_t v46 = __chkstk_darwin(v44);
  uint64_t v305 = (uint64_t)v253 - v47;
  uint64_t v48 = __chkstk_darwin(v46);
  uint64_t v299 = (uint64_t)v253 - v49;
  uint64_t v50 = __chkstk_darwin(v48);
  v266 = (char *)v253 - v51;
  uint64_t v52 = __chkstk_darwin(v50);
  uint64_t v278 = (uint64_t)v253 - v53;
  uint64_t v54 = __chkstk_darwin(v52);
  uint64_t v265 = (uint64_t)v253 - v55;
  __chkstk_darwin(v54);
  uint64_t v263 = (uint64_t)v253 - v56;
  uint64_t v303 = a1;
  Swift::Int v57 = a1[1];
  uint64_t result = sub_10005CDB0(v57);
  if (result >= v57)
  {
    if (v57 < 0) {
      goto LABEL_195;
    }
    if (v57) {
      return sub_1000573E4(0, v57, 1, v303);
    }
    return result;
  }
  if (v57 >= 0) {
    uint64_t v59 = v57;
  }
  else {
    uint64_t v59 = v57 + 1;
  }
  if (v57 < -1) {
    goto LABEL_194;
  }
  uint64_t v254 = v40;
  uint64_t v258 = result;
  uint64_t v60 = v57;
  if (v57 <= 1)
  {
    uint64_t v65 = &_swiftEmptyArrayStorage;
    unint64_t v279 = (unint64_t)&_swiftEmptyArrayStorage
         + ((*(unsigned __int8 *)(v281 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v281 + 80));
    if (v57 != 1)
    {
      unint64_t v68 = *((void *)&_swiftEmptyArrayStorage + 2);
      uint64_t v67 = &_swiftEmptyArrayStorage;
      if (v68 < 2)
      {
LABEL_171:
        swift_bridgeObjectRelease();
        v65[2] = 0;
        return swift_bridgeObjectRelease();
      }
LABEL_159:
      uint64_t v245 = *v303;
      while (1)
      {
        unint64_t v246 = v68 - 2;
        if (v68 < 2) {
          goto LABEL_189;
        }
        if (!v245) {
          goto LABEL_202;
        }
        uint64_t v247 = (uint64_t)v67;
        unint64_t v248 = (char *)(v67 + 4);
        uint64_t v249 = v67[2 * v246 + 4];
        uint64_t v250 = v67[2 * v68 + 3];
        uint64_t result = sub_10005823C(v245 + *(void *)(v281 + 72) * v249, v245 + *(void *)(v281 + 72) * *(void *)&v248[16 * v68 - 16], v245 + *(void *)(v281 + 72) * v250, v279);
        if (v2) {
          goto LABEL_171;
        }
        if (v250 < v249) {
          goto LABEL_190;
        }
        uint64_t result = swift_isUniquelyReferenced_nonNull_native();
        if ((result & 1) == 0)
        {
          uint64_t result = (uint64_t)sub_100059EE8(v247);
          uint64_t v247 = result;
        }
        if (v246 >= *(void *)(v247 + 16)) {
          goto LABEL_191;
        }
        long long v251 = (void *)(v247 + 32 + 16 * v246);
        void *v251 = v249;
        v251[1] = v250;
        unint64_t v252 = *(void *)(v247 + 16);
        if (v68 > v252) {
          goto LABEL_192;
        }
        uint64_t v67 = (void *)v247;
        uint64_t result = (uint64_t)memmove((void *)(v247 + 32 + 16 * (v68 - 1)), (const void *)(v247 + 32 + 16 * v68), 16 * (v252 - v68));
        *(void *)(v247 + 16) = v252 - 1;
        unint64_t v68 = v252 - 1;
        if (v252 <= 2) {
          goto LABEL_171;
        }
      }
    }
    uint64_t v64 = (uint64_t)v21;
    uint64_t v255 = &_swiftEmptyArrayStorage;
    unint64_t v63 = v279;
  }
  else
  {
    uint64_t v61 = v59 >> 1;
    uint64_t result = sub_10005C930();
    *(void *)(result + 16) = v61;
    unint64_t v62 = (*(unsigned __int8 *)(v281 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v281 + 80);
    uint64_t v255 = (void *)result;
    unint64_t v63 = result + v62;
    uint64_t v64 = (uint64_t)v21;
  }
  uint64_t v66 = 0;
  uint64_t v256 = v267 + 8;
  uint64_t v257 = v14;
  v253[1] = v14 + 8;
  unint64_t v285 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v29 + 56);
  unint64_t v301 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v29 + 48);
  uint64_t v298 = (void (**)(char *, uint64_t, uint64_t))(v29 + 32);
  v289 = (void (**)(char *, uint64_t))(v29 + 8);
  uint64_t v271 = v280 + 8;
  uint64_t v262 = v276 + 8;
  uint64_t v284 = v300 + 8;
  uint64_t v283 = v297 + 8;
  uint64_t v67 = &_swiftEmptyArrayStorage;
  uint64_t v293 = v64;
  unint64_t v279 = v63;
  while (2)
  {
    uint64_t v69 = (char *)(v66 + 1);
    uint64_t v268 = v67;
    uint64_t v277 = v66;
    if (v66 + 1 >= v60)
    {
      uint64_t v80 = v66 + 1;
      goto LABEL_74;
    }
    uint64_t v70 = *v303;
    uint64_t v71 = *(void *)(v281 + 72);
    uint64_t v72 = v263;
    sub_10005A298(*v303 + v71 * (void)v69, v263, type metadata accessor for CRLSELibraryViewModeItemNode);
    uint64_t v269 = v70;
    uint64_t v295 = v71;
    sub_10005A298(v70 + v71 * v66, v265, type metadata accessor for CRLSELibraryViewModeItemNode);
    sub_10005A298(v72, v267, type metadata accessor for CRLSELibraryViewModel.Item);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    uint64_t v272 = v60;
    if (EnumCaseMultiPayload == 3)
    {
      uint64_t v81 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
      swift_bridgeObjectRelease();
      uint64_t v82 = v267;
      uint64_t v83 = v267 + *(int *)(v81 + 64);
      uint64_t v77 = v260;
      sub_10003C51C(v83, v260, (uint64_t *)&unk_10007D850);
      uint64_t v84 = sub_10005C3D0();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v84 - 8) + 8))(v82, v84);
    }
    else
    {
      if (EnumCaseMultiPayload == 2)
      {
        uint64_t v74 = sub_1000131E0(&qword_10007D1D0);
        swift_bridgeObjectRelease();
        uint64_t v75 = v267;
        uint64_t v76 = v267 + *(int *)(v74 + 80);
        uint64_t v77 = v260;
        sub_10003C51C(v76, v260, (uint64_t *)&unk_10007D850);
        uint64_t v78 = type metadata accessor for CRLSEBoardIdentifier;
        uint64_t v79 = v75;
      }
      else
      {
        uint64_t v77 = v260;
        (*v285)(v260, 1, 1, v304);
        uint64_t v78 = type metadata accessor for CRLSELibraryViewModel.Item;
        uint64_t v79 = v267;
      }
      sub_10005A300(v79, v78);
    }
    uint64_t v64 = v293;
    uint64_t v85 = v304;
    v292 = (char *)*v301;
    if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v292)(v77, 1, v304) != 1)
    {
      uint64_t v86 = *v298;
      (*v298)(v261, v77, v85);
      sub_10005A298(v265, (uint64_t)v257, type metadata accessor for CRLSELibraryViewModel.Item);
      int v87 = swift_getEnumCaseMultiPayload();
      if (v87 == 2)
      {
        uint64_t v95 = sub_1000131E0(&qword_10007D1D0);
        swift_bridgeObjectRelease();
        uint64_t v96 = *(int *)(v95 + 80);
        uint64_t v97 = (uint64_t)v257;
        uint64_t v98 = v259;
        sub_10003C51C((uint64_t)&v257[v96], v259, (uint64_t *)&unk_10007D850);
        uint64_t v99 = type metadata accessor for CRLSEBoardIdentifier;
        uint64_t v100 = v97;
        uint64_t v94 = v98;
      }
      else
      {
        if (v87 == 3)
        {
          uint64_t v88 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
          swift_bridgeObjectRelease();
          uint64_t v89 = *(int *)(v88 + 64);
          uint64_t v90 = (uint64_t)v257;
          uint64_t v91 = v259;
          sub_10003C51C((uint64_t)&v257[v89], v259, (uint64_t *)&unk_10007D850);
          uint64_t v92 = sub_10005C3D0();
          uint64_t v93 = v90;
          uint64_t v94 = v91;
          (*(void (**)(uint64_t, uint64_t))(*(void *)(v92 - 8) + 8))(v93, v92);
LABEL_32:
          uint64_t v60 = v272;
          uint64_t v101 = v304;
          if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v292)(v94, 1, v304) == 1)
          {
            (*v289)(v261, v101);
            sub_10001E8C0(v94, (uint64_t *)&unk_10007D850);
            LODWORD(v291) = 0;
          }
          else
          {
            id v102 = v254;
            v86(v254, v94, v101);
            id v103 = v261;
            LODWORD(v291) = sub_10005C370() == 1;
            unint64_t v104 = *v289;
            (*v289)(v102, v101);
            v104(v103, v101);
          }
          uint64_t v67 = v268;
          uint64_t v64 = v293;
          goto LABEL_36;
        }
        uint64_t v94 = v259;
        (*v285)(v259, 1, 1, v304);
        uint64_t v99 = type metadata accessor for CRLSELibraryViewModel.Item;
        uint64_t v100 = (uint64_t)v257;
      }
      sub_10005A300(v100, v99);
      goto LABEL_32;
    }
    sub_10001E8C0(v77, (uint64_t *)&unk_10007D850);
    LODWORD(v291) = 0;
    uint64_t v60 = v272;
LABEL_36:
    sub_10005A300(v265, type metadata accessor for CRLSELibraryViewModeItemNode);
    uint64_t result = sub_10005A300(v263, type metadata accessor for CRLSELibraryViewModeItemNode);
    uint64_t v80 = v277 + 2;
    if (v277 + 2 >= v60) {
      goto LABEL_60;
    }
    uint64_t v290 = v295 * (void)v69;
    uint64_t v105 = v269;
    uint64_t v288 = v295 * v80;
    uint64_t v106 = (uint64_t)v266;
    while (1)
    {
      uint64_t v107 = v80;
      uint64_t v108 = v278;
      sub_10005A298(v105 + v288, v278, type metadata accessor for CRLSELibraryViewModeItemNode);
      sub_10005A298(v105 + v290, v106, type metadata accessor for CRLSELibraryViewModeItemNode);
      sub_10005A298(v108, v280, type metadata accessor for CRLSELibraryViewModel.Item);
      int v109 = swift_getEnumCaseMultiPayload();
      if (v109 == 3)
      {
        uint64_t v116 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
        swift_bridgeObjectRelease();
        uint64_t v117 = v280;
        uint64_t v118 = v280 + *(int *)(v116 + 64);
        uint64_t v113 = v275;
        sub_10003C51C(v118, v275, (uint64_t *)&unk_10007D850);
        uint64_t v119 = sub_10005C3D0();
        (*(void (**)(uint64_t, uint64_t))(*(void *)(v119 - 8) + 8))(v117, v119);
      }
      else
      {
        if (v109 == 2)
        {
          uint64_t v110 = sub_1000131E0(&qword_10007D1D0);
          swift_bridgeObjectRelease();
          uint64_t v111 = v280;
          uint64_t v112 = v280 + *(int *)(v110 + 80);
          uint64_t v113 = v275;
          sub_10003C51C(v112, v275, (uint64_t *)&unk_10007D850);
          unint64_t v114 = type metadata accessor for CRLSEBoardIdentifier;
          uint64_t v115 = v111;
        }
        else
        {
          uint64_t v113 = v275;
          (*v285)(v275, 1, 1, v304);
          unint64_t v114 = type metadata accessor for CRLSELibraryViewModel.Item;
          uint64_t v115 = v280;
        }
        sub_10005A300(v115, v114);
      }
      uint64_t v120 = v304;
      if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v292)(v113, 1, v304) == 1)
      {
        sub_10001E8C0(v113, (uint64_t *)&unk_10007D850);
        int v121 = 0;
        goto LABEL_56;
      }
      uint64_t v122 = *v298;
      (*v298)(v274, v113, v120);
      sub_10005A298(v106, v276, type metadata accessor for CRLSELibraryViewModel.Item);
      int v123 = swift_getEnumCaseMultiPayload();
      if (v123 == 2)
      {
        uint64_t v129 = sub_1000131E0(&qword_10007D1D0);
        swift_bridgeObjectRelease();
        uint64_t v130 = v276;
        uint64_t v131 = v276 + *(int *)(v129 + 80);
        uint64_t v127 = v270;
        sub_10003C51C(v131, v270, (uint64_t *)&unk_10007D850);
        id v132 = type metadata accessor for CRLSEBoardIdentifier;
        uint64_t v133 = v130;
LABEL_51:
        sub_10005A300(v133, v132);
        goto LABEL_52;
      }
      if (v123 != 3)
      {
        uint64_t v127 = v270;
        (*v285)(v270, 1, 1, v304);
        id v132 = type metadata accessor for CRLSELibraryViewModel.Item;
        uint64_t v133 = v276;
        goto LABEL_51;
      }
      uint64_t v124 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
      swift_bridgeObjectRelease();
      uint64_t v125 = v276;
      uint64_t v126 = v276 + *(int *)(v124 + 64);
      uint64_t v127 = v270;
      sub_10003C51C(v126, v270, (uint64_t *)&unk_10007D850);
      uint64_t v128 = sub_10005C3D0();
      (*(void (**)(uint64_t, uint64_t))(*(void *)(v128 - 8) + 8))(v125, v128);
LABEL_52:
      uint64_t v134 = v304;
      if (((unsigned int (*)(uint64_t, uint64_t, uint64_t))v292)(v127, 1, v304) == 1)
      {
        (*v289)(v274, v134);
        sub_10001E8C0(v127, (uint64_t *)&unk_10007D850);
        int v121 = 0;
      }
      else
      {
        uint64_t v135 = v264;
        v122(v264, v127, v134);
        uint64_t v136 = v274;
        int v121 = sub_10005C370() == 1;
        uint64_t v137 = *v289;
        uint64_t v138 = v135;
        uint64_t v106 = (uint64_t)v266;
        (*v289)(v138, v134);
        uint64_t v139 = v136;
        uint64_t v67 = v268;
        v137(v139, v134);
      }
      uint64_t v60 = v272;
LABEL_56:
      sub_10005A300(v106, type metadata accessor for CRLSELibraryViewModeItemNode);
      uint64_t result = sub_10005A300(v278, type metadata accessor for CRLSELibraryViewModeItemNode);
      if (v291 != v121) {
        break;
      }
      uint64_t v80 = v107 + 1;
      v105 += v295;
      if (v60 == v107 + 1)
      {
        uint64_t v80 = v60;
        uint64_t v64 = v293;
        goto LABEL_60;
      }
    }
    uint64_t v64 = v293;
    uint64_t v80 = v107;
LABEL_60:
    uint64_t v66 = v277;
    if (v291)
    {
      if (v80 < v277) {
        goto LABEL_196;
      }
      if (v277 < v80)
      {
        uint64_t v140 = 0;
        uint64_t v141 = v295 * (v80 - 1);
        uint64_t v142 = v80 * v295;
        uint64_t v143 = v277;
        uint64_t v144 = v277 * v295;
        do
        {
          if (v143 != v80 + v140 - 1)
          {
            uint64_t v146 = v80;
            uint64_t v147 = v269;
            if (!v269) {
              goto LABEL_201;
            }
            unint64_t v148 = v269 + v144;
            v292 = (char *)(v269 + v141);
            sub_10005A360(v269 + v144, v273, type metadata accessor for CRLSELibraryViewModeItemNode);
            if (v144 < v141 || v148 >= v147 + v142)
            {
              uint64_t v145 = (uint64_t)v292;
              swift_arrayInitWithTakeFrontToBack();
            }
            else
            {
              uint64_t v145 = (uint64_t)v292;
              if (v144 != v141) {
                swift_arrayInitWithTakeBackToFront();
              }
            }
            uint64_t result = sub_10005A360(v273, v145, type metadata accessor for CRLSELibraryViewModeItemNode);
            uint64_t v66 = v277;
            uint64_t v80 = v146;
          }
          ++v143;
          --v140;
          v141 -= v295;
          v142 -= v295;
          v144 += v295;
        }
        while (v143 < v80 + v140);
        uint64_t v64 = v293;
        uint64_t v67 = v268;
        uint64_t v60 = v272;
      }
    }
LABEL_74:
    if (v80 >= v60) {
      goto LABEL_109;
    }
    if (__OFSUB__(v80, v66)) {
      goto LABEL_193;
    }
    if (v80 - v66 >= v258)
    {
LABEL_109:
      if (v80 < v66) {
        goto LABEL_188;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      v292 = (char *)v80;
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_100059D08(0, v67[2] + 1, 1, (char *)v67);
        uint64_t v67 = (void *)result;
      }
      unint64_t v194 = v67[2];
      unint64_t v193 = v67[3];
      unint64_t v68 = v194 + 1;
      uint64_t v195 = v64;
      if (v194 >= v193 >> 1)
      {
        uint64_t result = (uint64_t)sub_100059D08((char *)(v193 > 1), v194 + 1, 1, (char *)v67);
        uint64_t v67 = (void *)result;
      }
      v67[2] = v68;
      uint64_t v196 = (char *)(v67 + 4);
      unint64_t v197 = &v67[2 * v194 + 4];
      unint64_t v198 = v292;
      *unint64_t v197 = v66;
      v197[1] = (uint64_t)v198;
      if (v194)
      {
        while (1)
        {
          unint64_t v199 = v68 - 1;
          if (v68 >= 4)
          {
            id v204 = &v196[16 * v68];
            uint64_t v205 = *((void *)v204 - 8);
            uint64_t v206 = *((void *)v204 - 7);
            BOOL v210 = __OFSUB__(v206, v205);
            uint64_t v207 = v206 - v205;
            if (v210) {
              goto LABEL_177;
            }
            uint64_t v209 = *((void *)v204 - 6);
            uint64_t v208 = *((void *)v204 - 5);
            BOOL v210 = __OFSUB__(v208, v209);
            uint64_t v202 = v208 - v209;
            char v203 = v210;
            if (v210) {
              goto LABEL_178;
            }
            unint64_t v211 = v68 - 2;
            char v212 = &v196[16 * v68 - 32];
            uint64_t v214 = *(void *)v212;
            uint64_t v213 = *((void *)v212 + 1);
            BOOL v210 = __OFSUB__(v213, v214);
            uint64_t v215 = v213 - v214;
            if (v210) {
              goto LABEL_179;
            }
            BOOL v210 = __OFADD__(v202, v215);
            uint64_t v216 = v202 + v215;
            if (v210) {
              goto LABEL_183;
            }
            if (v216 >= v207)
            {
              uint64_t v234 = &v196[16 * v199];
              uint64_t v236 = *(void *)v234;
              uint64_t v235 = *((void *)v234 + 1);
              BOOL v210 = __OFSUB__(v235, v236);
              uint64_t v237 = v235 - v236;
              if (v210) {
                goto LABEL_187;
              }
              BOOL v227 = v202 < v237;
              goto LABEL_146;
            }
          }
          else
          {
            if (v68 != 3)
            {
              uint64_t v228 = v67[4];
              uint64_t v229 = v67[5];
              BOOL v210 = __OFSUB__(v229, v228);
              uint64_t v221 = v229 - v228;
              char v222 = v210;
              goto LABEL_140;
            }
            uint64_t v201 = v67[4];
            uint64_t v200 = v67[5];
            BOOL v210 = __OFSUB__(v200, v201);
            uint64_t v202 = v200 - v201;
            char v203 = v210;
          }
          if (v203) {
            goto LABEL_180;
          }
          unint64_t v211 = v68 - 2;
          uint64_t v217 = &v196[16 * v68 - 32];
          uint64_t v219 = *(void *)v217;
          uint64_t v218 = *((void *)v217 + 1);
          BOOL v220 = __OFSUB__(v218, v219);
          uint64_t v221 = v218 - v219;
          char v222 = v220;
          if (v220) {
            goto LABEL_181;
          }
          uint64_t v223 = &v196[16 * v199];
          uint64_t v225 = *(void *)v223;
          uint64_t v224 = *((void *)v223 + 1);
          BOOL v210 = __OFSUB__(v224, v225);
          uint64_t v226 = v224 - v225;
          if (v210) {
            goto LABEL_184;
          }
          if (__OFADD__(v221, v226)) {
            goto LABEL_186;
          }
          if (v221 + v226 >= v202)
          {
            BOOL v227 = v202 < v226;
LABEL_146:
            if (v227) {
              unint64_t v199 = v211;
            }
            goto LABEL_148;
          }
LABEL_140:
          if (v222) {
            goto LABEL_182;
          }
          id v230 = &v196[16 * v199];
          uint64_t v232 = *(void *)v230;
          uint64_t v231 = *((void *)v230 + 1);
          BOOL v210 = __OFSUB__(v231, v232);
          uint64_t v233 = v231 - v232;
          if (v210) {
            goto LABEL_185;
          }
          if (v233 < v221) {
            goto LABEL_15;
          }
LABEL_148:
          unint64_t v238 = v199 - 1;
          if (v199 - 1 >= v68)
          {
            __break(1u);
LABEL_174:
            __break(1u);
LABEL_175:
            __break(1u);
LABEL_176:
            __break(1u);
LABEL_177:
            __break(1u);
LABEL_178:
            __break(1u);
LABEL_179:
            __break(1u);
LABEL_180:
            __break(1u);
LABEL_181:
            __break(1u);
LABEL_182:
            __break(1u);
LABEL_183:
            __break(1u);
LABEL_184:
            __break(1u);
LABEL_185:
            __break(1u);
LABEL_186:
            __break(1u);
LABEL_187:
            __break(1u);
LABEL_188:
            __break(1u);
LABEL_189:
            __break(1u);
LABEL_190:
            __break(1u);
LABEL_191:
            __break(1u);
LABEL_192:
            __break(1u);
LABEL_193:
            __break(1u);
LABEL_194:
            __break(1u);
LABEL_195:
            __break(1u);
LABEL_196:
            __break(1u);
LABEL_197:
            __break(1u);
            goto LABEL_198;
          }
          if (!*v303) {
            goto LABEL_200;
          }
          uint64_t v239 = v67;
          uint64_t v240 = &v196[16 * v238];
          uint64_t v241 = *(void *)v240;
          uint64_t v242 = &v196[16 * v199];
          uint64_t v243 = *((void *)v242 + 1);
          uint64_t result = sub_10005823C(*v303 + *(void *)(v281 + 72) * *(void *)v240, *v303 + *(void *)(v281 + 72) * *(void *)v242, *v303 + *(void *)(v281 + 72) * v243, v279);
          if (v2)
          {
            uint64_t v65 = v255;
            goto LABEL_171;
          }
          if (v243 < v241) {
            goto LABEL_174;
          }
          if (v199 > v239[2]) {
            goto LABEL_175;
          }
          *(void *)uint64_t v240 = v241;
          *(void *)&v196[16 * v238 + 8] = v243;
          unint64_t v244 = v239[2];
          if (v199 >= v244) {
            goto LABEL_176;
          }
          uint64_t v67 = v239;
          unint64_t v68 = v244 - 1;
          uint64_t result = (uint64_t)memmove(&v196[16 * v199], v242 + 16, 16 * (v244 - 1 - v199));
          v239[2] = v244 - 1;
          BOOL v227 = v244 > 2;
          uint64_t v195 = v293;
          if (!v227) {
            goto LABEL_15;
          }
        }
      }
      unint64_t v68 = 1;
LABEL_15:
      uint64_t v66 = (uint64_t)v292;
      uint64_t v64 = v195;
      uint64_t v60 = v303[1];
      if ((uint64_t)v292 >= v60)
      {
        uint64_t v65 = v255;
        if (v68 < 2) {
          goto LABEL_171;
        }
        goto LABEL_159;
      }
      continue;
    }
    break;
  }
  if (__OFADD__(v66, v258)) {
    goto LABEL_197;
  }
  if (v66 + v258 >= v60) {
    uint64_t v149 = v60;
  }
  else {
    uint64_t v149 = v66 + v258;
  }
  if (v149 >= v66)
  {
    if (v80 != v149)
    {
      uint64_t v269 = v2;
      uint64_t v150 = *(void *)(v281 + 72);
      uint64_t v151 = v150 * (v80 - 1);
      uint64_t v288 = v150;
      uint64_t v152 = v80 * v150;
      uint64_t v272 = v149;
      do
      {
        uint64_t v155 = 0;
        uint64_t v156 = (char *)v66;
        uint64_t v290 = v152;
        uint64_t v291 = v151;
        v292 = (char *)v80;
        while (1)
        {
          uint64_t v157 = *v303;
          uint64_t v158 = v152 + v155;
          uint64_t v159 = v152 + v155 + *v303;
          uint64_t v160 = v299;
          sub_10005A298(v159, v299, type metadata accessor for CRLSELibraryViewModeItemNode);
          sub_10005A298(v151 + v155 + v157, v305, type metadata accessor for CRLSELibraryViewModeItemNode);
          sub_10005A298(v160, v300, type metadata accessor for CRLSELibraryViewModel.Item);
          int v161 = swift_getEnumCaseMultiPayload();
          uint64_t v295 = v158;
          if (v161 == 3)
          {
            uint64_t v167 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
            swift_bridgeObjectRelease();
            uint64_t v168 = *(int *)(v167 + 64);
            uint64_t v169 = v300;
            sub_10003C51C(v300 + v168, v64, (uint64_t *)&unk_10007D850);
            uint64_t v170 = sub_10005C3D0();
            (*(void (**)(uint64_t, uint64_t))(*(void *)(v170 - 8) + 8))(v169, v170);
          }
          else
          {
            if (v161 == 2)
            {
              uint64_t v162 = sub_1000131E0(&qword_10007D1D0);
              swift_bridgeObjectRelease();
              uint64_t v163 = *(int *)(v162 + 80);
              uint64_t v164 = v300;
              sub_10003C51C(v300 + v163, v64, (uint64_t *)&unk_10007D850);
              id v165 = type metadata accessor for CRLSEBoardIdentifier;
              uint64_t v166 = v164;
            }
            else
            {
              (*v285)(v64, 1, 1, v304);
              id v165 = type metadata accessor for CRLSELibraryViewModel.Item;
              uint64_t v166 = v300;
            }
            sub_10005A300(v166, v165);
          }
          uint64_t v171 = *v301;
          uint64_t v172 = v304;
          if ((*v301)(v64, 1, v304) == 1)
          {
            uint64_t v153 = v64;
LABEL_85:
            uint64_t v152 = v290;
            uint64_t v151 = v291;
            sub_10001E8C0(v153, (uint64_t *)&unk_10007D850);
            sub_10005A300(v305, type metadata accessor for CRLSELibraryViewModeItemNode);
            uint64_t result = sub_10005A300(v299, type metadata accessor for CRLSELibraryViewModeItemNode);
            unint64_t v154 = v292;
            goto LABEL_86;
          }
          uint64_t v173 = *v298;
          (*v298)(v296, v64, v172);
          sub_10005A298(v305, v297, type metadata accessor for CRLSELibraryViewModel.Item);
          int v174 = swift_getEnumCaseMultiPayload();
          if (v174 == 3)
          {
            uint64_t v181 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
            swift_bridgeObjectRelease();
            uint64_t v182 = *(int *)(v181 + 64);
            uint64_t v183 = v297;
            uint64_t v184 = v287;
            sub_10003C51C(v297 + v182, v287, (uint64_t *)&unk_10007D850);
            uint64_t v185 = sub_10005C3D0();
            uint64_t v186 = v183;
            uint64_t v178 = v184;
            uint64_t v172 = v304;
            (*(void (**)(uint64_t, uint64_t))(*(void *)(v185 - 8) + 8))(v186, v185);
          }
          else
          {
            if (v174 == 2)
            {
              uint64_t v175 = sub_1000131E0(&qword_10007D1D0);
              swift_bridgeObjectRelease();
              uint64_t v176 = v297;
              uint64_t v177 = v297 + *(int *)(v175 + 80);
              uint64_t v178 = v287;
              sub_10003C51C(v177, v287, (uint64_t *)&unk_10007D850);
              uint64_t v179 = type metadata accessor for CRLSEBoardIdentifier;
              uint64_t v180 = v176;
              uint64_t v172 = v304;
            }
            else
            {
              uint64_t v178 = v287;
              (*v285)(v287, 1, 1, v172);
              uint64_t v179 = type metadata accessor for CRLSELibraryViewModel.Item;
              uint64_t v180 = v297;
            }
            sub_10005A300(v180, v179);
          }
          if (v171(v178, 1, v172) == 1)
          {
            (*v289)(v296, v172);
            uint64_t v153 = v178;
            uint64_t v64 = v293;
            goto LABEL_85;
          }
          uint64_t v187 = v286;
          v173(v286, v178, v172);
          v188 = v296;
          uint64_t v189 = sub_10005C370();
          uint64_t v190 = *v289;
          (*v289)(v187, v172);
          v190(v188, v172);
          sub_10005A300(v305, type metadata accessor for CRLSELibraryViewModeItemNode);
          uint64_t result = sub_10005A300(v299, type metadata accessor for CRLSELibraryViewModeItemNode);
          uint64_t v64 = v293;
          if (v189 != 1) {
            break;
          }
          uint64_t v191 = *v303;
          uint64_t v152 = v290;
          uint64_t v151 = v291;
          if (!*v303) {
            goto LABEL_199;
          }
          uint64_t v192 = v191 + v291 + v155;
          sub_10005A360(v191 + v290 + v155, v294, type metadata accessor for CRLSELibraryViewModeItemNode);
          swift_arrayInitWithTakeFrontToBack();
          uint64_t result = sub_10005A360(v294, v192, type metadata accessor for CRLSELibraryViewModeItemNode);
          v155 -= v288;
          ++v156;
          unint64_t v154 = v292;
          if (v292 == v156) {
            goto LABEL_86;
          }
        }
        uint64_t v151 = v291;
        unint64_t v154 = v292;
        uint64_t v152 = v290;
LABEL_86:
        uint64_t v80 = (uint64_t)(v154 + 1);
        v151 += v288;
        v152 += v288;
        uint64_t v66 = v277;
      }
      while (v80 != v272);
      uint64_t v80 = v272;
      uint64_t v2 = v269;
      uint64_t v67 = v268;
    }
    goto LABEL_109;
  }
LABEL_198:
  __break(1u);
LABEL_199:
  __break(1u);
LABEL_200:
  __break(1u);
LABEL_201:
  __break(1u);
LABEL_202:
  __break(1u);
  return result;
}

Swift::Int sub_1000559E4(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v253 = (uint64_t)&v225 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  unint64_t v252 = (char *)&v225 - v8;
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v238 = (uint64_t)&v225 - v10;
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v237 = (uint64_t)&v225 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v225 - v14;
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v225 - v16;
  uint64_t v244 = type metadata accessor for CRLSELibraryViewModeItemNode(0);
  uint64_t v241 = *(void *)(v244 - 8);
  uint64_t v18 = __chkstk_darwin(v244);
  uint64_t v233 = (uint64_t)&v225 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v250 = (uint64_t)&v225 - v21;
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v260 = (uint64_t)&v225 - v23;
  uint64_t v24 = __chkstk_darwin(v22);
  uint64_t v254 = (uint64_t)&v225 - v25;
  uint64_t v26 = __chkstk_darwin(v24);
  uint64_t v242 = (uint64_t)&v225 - v27;
  uint64_t v28 = __chkstk_darwin(v26);
  uint64_t v239 = (uint64_t)&v225 - v29;
  uint64_t v30 = __chkstk_darwin(v28);
  uint64_t v232 = (uint64_t)&v225 - v31;
  __chkstk_darwin(v30);
  uint64_t v231 = (uint64_t)&v225 - v32;
  Swift::Int v33 = a1[1];
  Swift::Int result = sub_10005CDB0(v33);
  if (result >= v33)
  {
    if (v33 < 0) {
      goto LABEL_178;
    }
    if (v33) {
      return sub_100057C7C(0, v33, 1, a1);
    }
  }
  else
  {
    if (v33 >= 0) {
      uint64_t v35 = v33;
    }
    else {
      uint64_t v35 = v33 + 1;
    }
    if (v33 < -1) {
      goto LABEL_177;
    }
    uint64_t v229 = v15;
    uint64_t v228 = v17;
    Swift::Int v227 = result;
    if (v33 > 1)
    {
      uint64_t v36 = v35 >> 1;
      uint64_t v37 = sub_10005C930();
      *(void *)(v37 + 16) = v36;
      uint64_t v38 = *(unsigned __int8 *)(v241 + 80);
      uint64_t v226 = (void *)v37;
      unint64_t v240 = v37 + ((v38 + 32) & ~v38);
      goto LABEL_12;
    }
    uint64_t v39 = (char *)_swiftEmptyArrayStorage;
    unint64_t v240 = (unint64_t)_swiftEmptyArrayStorage
         + ((*(unsigned __int8 *)(v241 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v241 + 80));
    uint64_t v226 = _swiftEmptyArrayStorage;
    if (v33 == 1)
    {
LABEL_12:
      int64_t v40 = 0;
      uint64_t v39 = (char *)_swiftEmptyArrayStorage;
      uint64_t v243 = "Recently Deleted";
      unint64_t v235 = 0x8000000100063B00;
      uint64_t v245 = a1;
      uint64_t v246 = v4;
      while (1)
      {
        Swift::Int v42 = v40 + 1;
        int64_t v236 = v40;
        if (v40 + 1 < v33)
        {
          uint64_t v43 = *a1;
          uint64_t v44 = *(void *)(v241 + 72);
          uint64_t v248 = v40 + 1;
          int64_t v45 = v40;
          uint64_t v46 = v231;
          sub_10005A298(v43 + v44 * v42, v231, type metadata accessor for CRLSELibraryViewModeItemNode);
          uint64_t v247 = v43;
          sub_10005A298(v43 + v44 * v45, v232, type metadata accessor for CRLSELibraryViewModeItemNode);
          uint64_t v47 = v46;
          uint64_t v48 = (uint64_t)v228;
          sub_10005A298(v47, (uint64_t)v228, type metadata accessor for CRLSELibraryViewModel.Item);
          switch(swift_getEnumCaseMultiPayload())
          {
            case 1u:
              uint64_t v49 = sub_100019490();
              goto LABEL_20;
            case 2u:
              uint64_t v53 = sub_1000131E0(&qword_10007D1D0);
              uint64_t v54 = (uint64_t *)(v48 + *(int *)(v53 + 48));
              uint64_t v51 = *v54;
              uint64_t v52 = v54[1];
              sub_10001E8C0(v48 + *(int *)(v53 + 80), (uint64_t *)&unk_10007D850);
              sub_10005A300(v48, type metadata accessor for CRLSEBoardIdentifier);
              break;
            case 3u:
              uint64_t v55 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
              uint64_t v56 = (uint64_t *)(v48 + *(int *)(v55 + 48));
              uint64_t v51 = *v56;
              uint64_t v52 = v56[1];
              sub_10001E8C0(v48 + *(int *)(v55 + 64), (uint64_t *)&unk_10007D850);
              uint64_t v57 = sub_10005C3D0();
              (*(void (**)(uint64_t, uint64_t))(*(void *)(v57 - 8) + 8))(v48, v57);
              break;
            default:
              uint64_t v49 = sub_1000192A0();
LABEL_20:
              uint64_t v51 = v49;
              uint64_t v52 = v50;
              break;
          }
          uint64_t v258 = v51;
          uint64_t v259 = v52;
          uint64_t v58 = (uint64_t)v229;
          sub_10005A298(v232, (uint64_t)v229, type metadata accessor for CRLSELibraryViewModel.Item);
          switch(swift_getEnumCaseMultiPayload())
          {
            case 1u:
              uint64_t v59 = sub_100019490();
              goto LABEL_26;
            case 2u:
              uint64_t v63 = sub_1000131E0(&qword_10007D1D0);
              uint64_t v64 = (uint64_t *)(v58 + *(int *)(v63 + 48));
              uint64_t v61 = *v64;
              uint64_t v62 = v64[1];
              sub_10001E8C0(v58 + *(int *)(v63 + 80), (uint64_t *)&unk_10007D850);
              sub_10005A300(v58, type metadata accessor for CRLSEBoardIdentifier);
              break;
            case 3u:
              uint64_t v65 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
              uint64_t v66 = (uint64_t *)(v58 + *(int *)(v65 + 48));
              uint64_t v61 = *v66;
              uint64_t v62 = v66[1];
              sub_10001E8C0(v58 + *(int *)(v65 + 64), (uint64_t *)&unk_10007D850);
              uint64_t v67 = sub_10005C3D0();
              (*(void (**)(uint64_t, uint64_t))(*(void *)(v67 - 8) + 8))(v58, v67);
              break;
            default:
              uint64_t v59 = sub_1000192A0();
LABEL_26:
              uint64_t v61 = v59;
              uint64_t v62 = v60;
              break;
          }
          uint64_t v256 = v61;
          uint64_t v257 = v62;
          int64_t v249 = sub_1000454B0();
          uint64_t v255 = sub_10005CB00();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          sub_10005A300(v232, type metadata accessor for CRLSELibraryViewModeItemNode);
          sub_10005A300(v231, type metadata accessor for CRLSELibraryViewModeItemNode);
          int64_t v40 = v236;
          Swift::Int v42 = v236 + 2;
          Swift::Int v251 = v33;
          if (v236 + 2 < v33)
          {
            id v230 = v39;
            uint64_t v68 = v247;
            v248 *= v44;
            Swift::Int v69 = v44 * v42;
            while (1)
            {
              Swift::Int v70 = v42;
              uint64_t v71 = v239;
              sub_10005A298(v68 + v69, v239, type metadata accessor for CRLSELibraryViewModeItemNode);
              sub_10005A298(v68 + v248, v242, type metadata accessor for CRLSELibraryViewModeItemNode);
              sub_10005A298(v71, v237, type metadata accessor for CRLSELibraryViewModel.Item);
              switch(swift_getEnumCaseMultiPayload())
              {
                case 1u:
                  uint64_t v72 = sub_100019490();
                  goto LABEL_34;
                case 2u:
                  uint64_t v76 = sub_1000131E0(&qword_10007D1D0);
                  uint64_t v77 = v237;
                  uint64_t v78 = (uint64_t *)(v237 + *(int *)(v76 + 48));
                  uint64_t v74 = *v78;
                  uint64_t v75 = v78[1];
                  sub_10001E8C0(v237 + *(int *)(v76 + 80), (uint64_t *)&unk_10007D850);
                  sub_10005A300(v77, type metadata accessor for CRLSEBoardIdentifier);
                  break;
                case 3u:
                  uint64_t v79 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
                  uint64_t v80 = v237;
                  uint64_t v81 = (uint64_t *)(v237 + *(int *)(v79 + 48));
                  uint64_t v74 = *v81;
                  uint64_t v75 = v81[1];
                  sub_10001E8C0(v237 + *(int *)(v79 + 64), (uint64_t *)&unk_10007D850);
                  uint64_t v82 = sub_10005C3D0();
                  (*(void (**)(uint64_t, uint64_t))(*(void *)(v82 - 8) + 8))(v80, v82);
                  break;
                default:
                  uint64_t v72 = sub_1000192A0();
LABEL_34:
                  uint64_t v74 = v72;
                  uint64_t v75 = v73;
                  break;
              }
              uint64_t v258 = v74;
              uint64_t v259 = v75;
              sub_10005A298(v242, v238, type metadata accessor for CRLSELibraryViewModel.Item);
              switch(swift_getEnumCaseMultiPayload())
              {
                case 1u:
                  uint64_t v83 = v2;
                  uint64_t v84 = sub_100019490();
                  goto LABEL_40;
                case 2u:
                  uint64_t v83 = v2;
                  uint64_t v88 = sub_1000131E0(&qword_10007D1D0);
                  uint64_t v89 = v238;
                  uint64_t v90 = (uint64_t *)(v238 + *(int *)(v88 + 48));
                  uint64_t v86 = *v90;
                  uint64_t v87 = v90[1];
                  sub_10001E8C0(v238 + *(int *)(v88 + 80), (uint64_t *)&unk_10007D850);
                  sub_10005A300(v89, type metadata accessor for CRLSEBoardIdentifier);
                  break;
                case 3u:
                  uint64_t v83 = v2;
                  uint64_t v91 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
                  uint64_t v92 = v238;
                  uint64_t v93 = (uint64_t *)(v238 + *(int *)(v91 + 48));
                  uint64_t v86 = *v93;
                  uint64_t v87 = v93[1];
                  sub_10001E8C0(v238 + *(int *)(v91 + 64), (uint64_t *)&unk_10007D850);
                  uint64_t v94 = sub_10005C3D0();
                  (*(void (**)(uint64_t, uint64_t))(*(void *)(v94 - 8) + 8))(v92, v94);
                  break;
                default:
                  uint64_t v83 = v2;
                  uint64_t v84 = sub_1000192A0();
LABEL_40:
                  uint64_t v86 = v84;
                  uint64_t v87 = v85;
                  break;
              }
              BOOL v95 = v255 == -1;
              uint64_t v256 = v86;
              uint64_t v257 = v87;
              uint64_t v96 = sub_10005CB00();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              sub_10005A300(v242, type metadata accessor for CRLSELibraryViewModeItemNode);
              sub_10005A300(v239, type metadata accessor for CRLSELibraryViewModeItemNode);
              if (v95 == (v96 != -1)) {
                break;
              }
              Swift::Int v42 = v70 + 1;
              v68 += v44;
              Swift::Int v33 = v251;
              uint64_t v2 = v83;
              if (v251 == v70 + 1)
              {
                Swift::Int v42 = v251;
                a1 = v245;
                uint64_t v39 = v230;
                int64_t v40 = v236;
                goto LABEL_47;
              }
            }
            uint64_t v2 = v83;
            a1 = v245;
            uint64_t v39 = v230;
            int64_t v40 = v236;
            Swift::Int v42 = v70;
            Swift::Int v33 = v251;
          }
LABEL_47:
          if (v255 == -1)
          {
            if (v42 < v40) {
              goto LABEL_181;
            }
            if (v40 < v42)
            {
              id v230 = v39;
              uint64_t v225 = v2;
              uint64_t v97 = 0;
              uint64_t v98 = v44 * (v42 - 1);
              Swift::Int v99 = v42 * v44;
              int64_t v100 = v40;
              uint64_t v101 = v40 * v44;
              uint64_t v102 = v247;
              do
              {
                if (v100 != v42 + v97 - 1)
                {
                  if (!v102) {
                    goto LABEL_184;
                  }
                  uint64_t v105 = v44;
                  unint64_t v106 = v102 + v101;
                  uint64_t v107 = v102;
                  uint64_t v255 = v102 + v98;
                  sub_10005A360(v102 + v101, v233, type metadata accessor for CRLSELibraryViewModeItemNode);
                  if (v101 < v98 || v106 >= v107 + v99)
                  {
                    uint64_t v103 = v255;
                    swift_arrayInitWithTakeFrontToBack();
                    uint64_t v44 = v105;
                    uint64_t v104 = v103;
                  }
                  else
                  {
                    uint64_t v44 = v105;
                    uint64_t v104 = v255;
                    if (v101 != v98) {
                      swift_arrayInitWithTakeBackToFront();
                    }
                  }
                  sub_10005A360(v233, v104, type metadata accessor for CRLSELibraryViewModeItemNode);
                  uint64_t v102 = v247;
                }
                ++v100;
                --v97;
                v98 -= v44;
                v99 -= v44;
                v101 += v44;
              }
              while (v100 < v42 + v97);
              uint64_t v2 = v225;
              a1 = v245;
              uint64_t v39 = v230;
              int64_t v40 = v236;
              Swift::Int v33 = v251;
            }
          }
        }
        if (v42 < v33)
        {
          if (__OFSUB__(v42, v40)) {
            goto LABEL_176;
          }
          if (v42 - v40 < v227)
          {
            if (__OFADD__(v40, v227)) {
              goto LABEL_179;
            }
            if (v40 + v227 >= v33) {
              Swift::Int v108 = v33;
            }
            else {
              Swift::Int v108 = v40 + v227;
            }
            if (v108 < v40)
            {
LABEL_180:
              __break(1u);
LABEL_181:
              __break(1u);
LABEL_182:
              __break(1u);
LABEL_183:
              __break(1u);
LABEL_184:
              __break(1u);
LABEL_185:
              __break(1u);
              JUMPOUT(0x100057384);
            }
            if (v42 != v108)
            {
              id v230 = v39;
              uint64_t v225 = v2;
              uint64_t v109 = *(void *)(v241 + 72);
              uint64_t v110 = v109 * (v42 - 1);
              uint64_t v247 = v109;
              uint64_t v255 = v42 * v109;
              Swift::Int v234 = v108;
              do
              {
                uint64_t v112 = 0;
                uint64_t v248 = v110;
                int64_t v249 = v42;
                while (1)
                {
                  uint64_t v113 = *a1;
                  uint64_t v114 = v254;
                  Swift::Int v251 = v255 + v112;
                  sub_10005A298(v255 + v112 + v113, v254, type metadata accessor for CRLSELibraryViewModeItemNode);
                  sub_10005A298(v110 + v112 + v113, v260, type metadata accessor for CRLSELibraryViewModeItemNode);
                  sub_10005A298(v114, (uint64_t)v252, type metadata accessor for CRLSELibraryViewModel.Item);
                  switch(swift_getEnumCaseMultiPayload())
                  {
                    case 1u:
                      uint64_t v121 = sub_100019490();
                      uint64_t v123 = v124;
                      break;
                    case 2u:
                      uint64_t v125 = sub_1000131E0(&qword_10007D1D0);
                      uint64_t v126 = v252;
                      uint64_t v127 = (uint64_t *)&v252[*(int *)(v125 + 48)];
                      uint64_t v121 = *v127;
                      uint64_t v123 = v127[1];
                      sub_10001E8C0((uint64_t)&v252[*(int *)(v125 + 80)], (uint64_t *)&unk_10007D850);
                      sub_10005A300((uint64_t)v126, type metadata accessor for CRLSEBoardIdentifier);
                      break;
                    case 3u:
                      uint64_t v128 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
                      uint64_t v129 = v252;
                      uint64_t v130 = (uint64_t *)&v252[*(int *)(v128 + 48)];
                      uint64_t v121 = *v130;
                      uint64_t v123 = v130[1];
                      sub_10001E8C0((uint64_t)&v252[*(int *)(v128 + 64)], (uint64_t *)&unk_10007D850);
                      uint64_t v131 = sub_10005C3D0();
                      (*(void (**)(unsigned char *, uint64_t))(*(void *)(v131 - 8) + 8))(v129, v131);
                      break;
                    default:
                      if (*v252)
                      {
                        if (*v252 == 1)
                        {
                          type metadata accessor for CRLSEExtensionContextManager();
                          uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
                          id v116 = [self bundleForClass:ObjCClassFromMetadata];
                          NSString v117 = sub_10005C7D0();
                          NSString v118 = sub_10005C7D0();
                          NSString v119 = sub_10005C7D0();
                          id v120 = [v116 localizedStringForKey:v117 value:v118 table:v119];

                          uint64_t v121 = sub_10005C810();
                          uint64_t v123 = v122;
                        }
                        else
                        {
                          type metadata accessor for CRLSEExtensionContextManager();
                          uint64_t v139 = swift_getObjCClassFromMetadata();
                          id v140 = [self bundleForClass:v139];
                          NSString v141 = sub_10005C7D0();
                          NSString v142 = sub_10005C7D0();
                          NSString v143 = sub_10005C7D0();
                          id v144 = [v140 localizedStringForKey:v141 value:v142 table:v143];

                          uint64_t v121 = sub_10005C810();
                          uint64_t v123 = v145;
                        }
                        a1 = v245;
                      }
                      else
                      {
                        type metadata accessor for CRLSEExtensionContextManager();
                        uint64_t v132 = swift_getObjCClassFromMetadata();
                        id v133 = [self bundleForClass:v132];
                        NSString v134 = sub_10005C7D0();
                        NSString v135 = sub_10005C7D0();
                        NSString v136 = sub_10005C7D0();
                        id v137 = [v133 localizedStringForKey:v134 value:v135 table:v136];

                        uint64_t v121 = sub_10005C810();
                        uint64_t v123 = v138;

                        a1 = v245;
                      }
                      break;
                  }
                  uint64_t v258 = v121;
                  uint64_t v259 = v123;
                  sub_10005A298(v260, v253, type metadata accessor for CRLSELibraryViewModel.Item);
                  switch(swift_getEnumCaseMultiPayload())
                  {
                    case 1u:
                      uint64_t v160 = sub_100019490();
                      uint64_t v162 = v151;
                      break;
                    case 2u:
                      uint64_t v152 = sub_1000131E0(&qword_10007D1D0);
                      uint64_t v153 = v253;
                      unint64_t v154 = (uint64_t *)(v253 + *(int *)(v152 + 48));
                      uint64_t v160 = *v154;
                      uint64_t v162 = v154[1];
                      sub_10001E8C0(v253 + *(int *)(v152 + 80), (uint64_t *)&unk_10007D850);
                      sub_10005A300(v153, type metadata accessor for CRLSEBoardIdentifier);
                      break;
                    case 3u:
                      uint64_t v155 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
                      uint64_t v156 = v253;
                      uint64_t v157 = (uint64_t *)(v253 + *(int *)(v155 + 48));
                      uint64_t v160 = *v157;
                      uint64_t v162 = v157[1];
                      sub_10001E8C0(v253 + *(int *)(v155 + 64), (uint64_t *)&unk_10007D850);
                      uint64_t v158 = sub_10005C3D0();
                      (*(void (**)(uint64_t, uint64_t))(*(void *)(v158 - 8) + 8))(v156, v158);
                      break;
                    default:
                      type metadata accessor for CRLSEExtensionContextManager();
                      uint64_t v146 = swift_getObjCClassFromMetadata();
                      id v147 = [self bundleForClass:v146];
                      NSString v148 = sub_10005C7D0();
                      NSString v149 = sub_10005C7D0();
                      NSString v150 = sub_10005C7D0();
                      id v159 = [v147 localizedStringForKey:v148 value:v149 table:v150];

                      uint64_t v160 = sub_10005C810();
                      uint64_t v162 = v161;

                      a1 = v245;
                      break;
                  }
                  uint64_t v256 = v160;
                  uint64_t v257 = v162;
                  sub_1000454B0();
                  uint64_t v163 = sub_10005CB00();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease();
                  sub_10005A300(v260, type metadata accessor for CRLSELibraryViewModeItemNode);
                  sub_10005A300(v254, type metadata accessor for CRLSELibraryViewModeItemNode);
                  if (v163 != -1) {
                    break;
                  }
                  uint64_t v164 = *a1;
                  uint64_t v110 = v248;
                  if (!*a1) {
                    goto LABEL_182;
                  }
                  uint64_t v165 = v164 + v248 + v112;
                  sub_10005A360(v164 + v255 + v112, v250, type metadata accessor for CRLSELibraryViewModeItemNode);
                  swift_arrayInitWithTakeFrontToBack();
                  sub_10005A360(v250, v165, type metadata accessor for CRLSELibraryViewModeItemNode);
                  v112 -= v247;
                  ++v40;
                  int64_t v111 = v249;
                  if (v249 == v40) {
                    goto LABEL_72;
                  }
                }
                uint64_t v110 = v248;
                int64_t v111 = v249;
LABEL_72:
                Swift::Int v42 = v111 + 1;
                v110 += v247;
                v255 += v247;
                int64_t v40 = v236;
              }
              while (v42 != v234);
              Swift::Int v42 = v234;
              uint64_t v2 = v225;
              uint64_t v39 = v230;
            }
          }
        }
        if (v42 < v40) {
          goto LABEL_171;
        }
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        int64_t v249 = v42;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0) {
          uint64_t v39 = sub_100059D08(0, *((void *)v39 + 2) + 1, 1, v39);
        }
        unint64_t v168 = *((void *)v39 + 2);
        unint64_t v167 = *((void *)v39 + 3);
        unint64_t v41 = v168 + 1;
        if (v168 >= v167 >> 1) {
          uint64_t v39 = sub_100059D08((char *)(v167 > 1), v168 + 1, 1, v39);
        }
        *((void *)v39 + 2) = v41;
        uint64_t v169 = v39 + 32;
        uint64_t v170 = &v39[16 * v168 + 32];
        int64_t v171 = v249;
        *(void *)uint64_t v170 = v236;
        *((void *)v170 + 1) = v171;
        if (v168) {
          break;
        }
        unint64_t v41 = 1;
LABEL_14:
        Swift::Int v33 = a1[1];
        int64_t v40 = v249;
        if (v249 >= v33) {
          goto LABEL_143;
        }
      }
      while (1)
      {
        unint64_t v172 = v41 - 1;
        if (v41 >= 4)
        {
          uint64_t v177 = &v169[16 * v41];
          uint64_t v178 = *((void *)v177 - 8);
          uint64_t v179 = *((void *)v177 - 7);
          BOOL v183 = __OFSUB__(v179, v178);
          uint64_t v180 = v179 - v178;
          if (v183) {
            goto LABEL_160;
          }
          uint64_t v182 = *((void *)v177 - 6);
          uint64_t v181 = *((void *)v177 - 5);
          BOOL v183 = __OFSUB__(v181, v182);
          uint64_t v175 = v181 - v182;
          char v176 = v183;
          if (v183) {
            goto LABEL_161;
          }
          unint64_t v184 = v41 - 2;
          uint64_t v185 = &v169[16 * v41 - 32];
          uint64_t v187 = *(void *)v185;
          uint64_t v186 = *((void *)v185 + 1);
          BOOL v183 = __OFSUB__(v186, v187);
          uint64_t v188 = v186 - v187;
          if (v183) {
            goto LABEL_162;
          }
          BOOL v183 = __OFADD__(v175, v188);
          uint64_t v189 = v175 + v188;
          if (v183) {
            goto LABEL_164;
          }
          if (v189 >= v180)
          {
            uint64_t v207 = &v169[16 * v172];
            uint64_t v209 = *(void *)v207;
            uint64_t v208 = *((void *)v207 + 1);
            BOOL v183 = __OFSUB__(v208, v209);
            uint64_t v210 = v208 - v209;
            if (v183) {
              goto LABEL_170;
            }
            BOOL v200 = v175 < v210;
            goto LABEL_131;
          }
        }
        else
        {
          if (v41 != 3)
          {
            uint64_t v201 = *((void *)v39 + 4);
            uint64_t v202 = *((void *)v39 + 5);
            BOOL v183 = __OFSUB__(v202, v201);
            uint64_t v194 = v202 - v201;
            char v195 = v183;
            goto LABEL_125;
          }
          uint64_t v174 = *((void *)v39 + 4);
          uint64_t v173 = *((void *)v39 + 5);
          BOOL v183 = __OFSUB__(v173, v174);
          uint64_t v175 = v173 - v174;
          char v176 = v183;
        }
        if (v176) {
          goto LABEL_163;
        }
        unint64_t v184 = v41 - 2;
        uint64_t v190 = &v169[16 * v41 - 32];
        uint64_t v192 = *(void *)v190;
        uint64_t v191 = *((void *)v190 + 1);
        BOOL v193 = __OFSUB__(v191, v192);
        uint64_t v194 = v191 - v192;
        char v195 = v193;
        if (v193) {
          goto LABEL_165;
        }
        uint64_t v196 = &v169[16 * v172];
        uint64_t v198 = *(void *)v196;
        uint64_t v197 = *((void *)v196 + 1);
        BOOL v183 = __OFSUB__(v197, v198);
        uint64_t v199 = v197 - v198;
        if (v183) {
          goto LABEL_167;
        }
        if (__OFADD__(v194, v199)) {
          goto LABEL_169;
        }
        if (v194 + v199 >= v175)
        {
          BOOL v200 = v175 < v199;
LABEL_131:
          if (v200) {
            unint64_t v172 = v184;
          }
          goto LABEL_133;
        }
LABEL_125:
        if (v195) {
          goto LABEL_166;
        }
        char v203 = &v169[16 * v172];
        uint64_t v205 = *(void *)v203;
        uint64_t v204 = *((void *)v203 + 1);
        BOOL v183 = __OFSUB__(v204, v205);
        uint64_t v206 = v204 - v205;
        if (v183) {
          goto LABEL_168;
        }
        if (v206 < v194) {
          goto LABEL_14;
        }
LABEL_133:
        unint64_t v211 = v172 - 1;
        if (v172 - 1 >= v41)
        {
          __break(1u);
LABEL_157:
          __break(1u);
LABEL_158:
          __break(1u);
LABEL_159:
          __break(1u);
LABEL_160:
          __break(1u);
LABEL_161:
          __break(1u);
LABEL_162:
          __break(1u);
LABEL_163:
          __break(1u);
LABEL_164:
          __break(1u);
LABEL_165:
          __break(1u);
LABEL_166:
          __break(1u);
LABEL_167:
          __break(1u);
LABEL_168:
          __break(1u);
LABEL_169:
          __break(1u);
LABEL_170:
          __break(1u);
LABEL_171:
          __break(1u);
LABEL_172:
          __break(1u);
LABEL_173:
          __break(1u);
LABEL_174:
          __break(1u);
LABEL_175:
          __break(1u);
LABEL_176:
          __break(1u);
LABEL_177:
          __break(1u);
LABEL_178:
          __break(1u);
LABEL_179:
          __break(1u);
          goto LABEL_180;
        }
        uint64_t v212 = *a1;
        if (!*a1) {
          goto LABEL_183;
        }
        uint64_t v213 = v39;
        uint64_t v214 = &v169[16 * v211];
        uint64_t v215 = *(void *)v214;
        uint64_t v216 = &v169[16 * v172];
        uint64_t v217 = *((void *)v216 + 1);
        sub_1000591F8(v212 + *(void *)(v241 + 72) * *(void *)v214, v212 + *(void *)(v241 + 72) * *(void *)v216, v212 + *(void *)(v241 + 72) * v217, v240);
        if (v2) {
          goto LABEL_154;
        }
        if (v217 < v215) {
          goto LABEL_157;
        }
        if (v172 > *((void *)v213 + 2)) {
          goto LABEL_158;
        }
        *(void *)uint64_t v214 = v215;
        *(void *)&v169[16 * v211 + 8] = v217;
        unint64_t v218 = *((void *)v213 + 2);
        if (v172 >= v218) {
          goto LABEL_159;
        }
        uint64_t v39 = v213;
        unint64_t v41 = v218 - 1;
        memmove(&v169[16 * v172], v216 + 16, 16 * (v218 - 1 - v172));
        *((void *)v213 + 2) = v218 - 1;
        a1 = v245;
        if (v218 <= 2) {
          goto LABEL_14;
        }
      }
    }
    unint64_t v41 = _swiftEmptyArrayStorage[2];
LABEL_143:
    if (v41 >= 2)
    {
      uint64_t v219 = *a1;
      do
      {
        unint64_t v220 = v41 - 2;
        if (v41 < 2) {
          goto LABEL_172;
        }
        if (!v219) {
          goto LABEL_185;
        }
        uint64_t v221 = *(void *)&v39[16 * v220 + 32];
        uint64_t v222 = *(void *)&v39[16 * v41 + 24];
        sub_1000591F8(v219 + *(void *)(v241 + 72) * v221, v219 + *(void *)(v241 + 72) * *(void *)&v39[16 * v41 + 16], v219 + *(void *)(v241 + 72) * v222, v240);
        if (v2) {
          break;
        }
        if (v222 < v221) {
          goto LABEL_173;
        }
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          uint64_t v39 = sub_100059EE8((uint64_t)v39);
        }
        if (v220 >= *((void *)v39 + 2)) {
          goto LABEL_174;
        }
        uint64_t v223 = &v39[16 * v220 + 32];
        *(void *)uint64_t v223 = v221;
        *((void *)v223 + 1) = v222;
        unint64_t v224 = *((void *)v39 + 2);
        if (v41 > v224) {
          goto LABEL_175;
        }
        memmove(&v39[16 * v41 + 16], &v39[16 * v41 + 32], 16 * (v224 - v41));
        *((void *)v39 + 2) = v224 - 1;
        unint64_t v41 = v224 - 1;
      }
      while (v224 > 2);
    }
LABEL_154:
    swift_bridgeObjectRelease();
    v226[2] = 0;
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1000573E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v83 = a4;
  uint64_t v66 = a1;
  uint64_t v87 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  uint64_t v6 = __chkstk_darwin(v87);
  uint64_t v85 = &v64[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v6);
  uint64_t v89 = &v64[-v8];
  uint64_t v9 = sub_1000131E0((uint64_t *)&unk_10007D850);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  uint64_t v74 = &v64[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v10);
  uint64_t v13 = &v64[-v12];
  uint64_t v75 = sub_10005C390();
  uint64_t v14 = *(void *)(v75 - 8);
  uint64_t v15 = __chkstk_darwin(v75);
  uint64_t v71 = &v64[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v15);
  uint64_t v84 = &v64[-v17];
  uint64_t v67 = type metadata accessor for CRLSELibraryViewModeItemNode(0);
  uint64_t v18 = __chkstk_darwin(v67);
  uint64_t v78 = &v64[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v90 = &v64[-v21];
  uint64_t result = __chkstk_darwin(v20);
  uint64_t v88 = &v64[-v24];
  uint64_t v77 = a3;
  uint64_t v65 = a2;
  if (a3 != a2)
  {
    uint64_t v25 = *(void *)(v23 + 72);
    Swift::Int v70 = v89 + 8;
    uint64_t v68 = v85 + 8;
    Swift::Int v69 = (void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
    uint64_t v86 = (unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v14 + 48);
    uint64_t v82 = (void (**)(unsigned char *, unsigned char *, uint64_t))(v14 + 32);
    uint64_t v72 = (void (**)(unsigned char *, uint64_t))(v14 + 8);
    uint64_t v73 = v13;
    uint64_t v26 = v25 * (v77 - 1);
    uint64_t v76 = v25;
    uint64_t v27 = v25 * v77;
    while (2)
    {
      uint64_t v29 = 0;
      uint64_t v30 = v66;
      while (1)
      {
        uint64_t v31 = *v83;
        uint64_t v81 = v27 + v29;
        uint64_t v32 = v88;
        sub_10005A298(v27 + v29 + v31, (uint64_t)v88, type metadata accessor for CRLSELibraryViewModeItemNode);
        uint64_t v80 = v26 + v29;
        sub_10005A298(v26 + v29 + v31, (uint64_t)v90, type metadata accessor for CRLSELibraryViewModeItemNode);
        sub_10005A298((uint64_t)v32, (uint64_t)v89, type metadata accessor for CRLSELibraryViewModel.Item);
        int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
        if (EnumCaseMultiPayload == 3)
        {
          uint64_t v40 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
          swift_bridgeObjectRelease();
          uint64_t v41 = *(int *)(v40 + 64);
          Swift::Int v42 = v89;
          sub_10003C51C((uint64_t)&v89[v41], (uint64_t)v13, (uint64_t *)&unk_10007D850);
          uint64_t v43 = sub_10005C3D0();
          (*(void (**)(unsigned char *, uint64_t))(*(void *)(v43 - 8) + 8))(v42, v43);
          uint64_t v34 = v75;
        }
        else
        {
          uint64_t v34 = v75;
          if (EnumCaseMultiPayload == 2)
          {
            uint64_t v35 = sub_1000131E0(&qword_10007D1D0);
            swift_bridgeObjectRelease();
            uint64_t v36 = *(int *)(v35 + 80);
            uint64_t v37 = v89;
            sub_10003C51C((uint64_t)&v89[v36], (uint64_t)v13, (uint64_t *)&unk_10007D850);
            uint64_t v38 = type metadata accessor for CRLSEBoardIdentifier;
            uint64_t v39 = v37;
          }
          else
          {
            (*v69)(v13, 1, 1, v75);
            uint64_t v38 = type metadata accessor for CRLSELibraryViewModel.Item;
            uint64_t v39 = v89;
          }
          sub_10005A300((uint64_t)v39, v38);
        }
        uint64_t v44 = *v86;
        if ((*v86)(v13, 1, v34) == 1) {
          break;
        }
        int64_t v45 = *v82;
        (*v82)(v84, v13, v34);
        sub_10005A298((uint64_t)v90, (uint64_t)v85, type metadata accessor for CRLSELibraryViewModel.Item);
        int v46 = swift_getEnumCaseMultiPayload();
        if (v46 == 3)
        {
          uint64_t v53 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
          swift_bridgeObjectRelease();
          uint64_t v54 = *(int *)(v53 + 64);
          uint64_t v55 = v85;
          uint64_t v56 = v74;
          sub_10003C51C((uint64_t)&v85[v54], (uint64_t)v74, (uint64_t *)&unk_10007D850);
          uint64_t v57 = sub_10005C3D0();
          uint64_t v58 = v55;
          uint64_t v50 = v56;
          (*(void (**)(unsigned char *, uint64_t))(*(void *)(v57 - 8) + 8))(v58, v57);
        }
        else
        {
          if (v46 == 2)
          {
            uint64_t v47 = sub_1000131E0(&qword_10007D1D0);
            swift_bridgeObjectRelease();
            uint64_t v48 = v85;
            uint64_t v49 = (uint64_t)&v85[*(int *)(v47 + 80)];
            uint64_t v50 = v74;
            sub_10003C51C(v49, (uint64_t)v74, (uint64_t *)&unk_10007D850);
            uint64_t v51 = type metadata accessor for CRLSEBoardIdentifier;
            uint64_t v52 = v48;
          }
          else
          {
            uint64_t v50 = v74;
            (*v69)(v74, 1, 1, v34);
            uint64_t v51 = type metadata accessor for CRLSELibraryViewModel.Item;
            uint64_t v52 = v85;
          }
          sub_10005A300((uint64_t)v52, v51);
        }
        if (v44(v50, 1, v34) == 1)
        {
          (*v72)(v84, v34);
          uint64_t v28 = (uint64_t)v50;
          uint64_t v13 = v73;
          goto LABEL_5;
        }
        uint64_t v59 = v71;
        v45(v71, v50, v34);
        uint64_t v60 = v84;
        uint64_t v79 = sub_10005C370();
        uint64_t v61 = *v72;
        (*v72)(v59, v34);
        v61(v60, v34);
        sub_10005A300((uint64_t)v90, type metadata accessor for CRLSELibraryViewModeItemNode);
        uint64_t result = sub_10005A300((uint64_t)v88, type metadata accessor for CRLSELibraryViewModeItemNode);
        uint64_t v13 = v73;
        if (v79 != 1) {
          goto LABEL_6;
        }
        uint64_t v62 = *v83;
        if (!*v83)
        {
          __break(1u);
          return result;
        }
        uint64_t v63 = v62 + v26 + v29;
        sub_10005A360(v62 + v27 + v29, (uint64_t)v78, type metadata accessor for CRLSELibraryViewModeItemNode);
        swift_arrayInitWithTakeFrontToBack();
        uint64_t result = sub_10005A360((uint64_t)v78, v63, type metadata accessor for CRLSELibraryViewModeItemNode);
        v29 -= v76;
        if (v77 == ++v30) {
          goto LABEL_6;
        }
      }
      uint64_t v28 = (uint64_t)v13;
LABEL_5:
      sub_10001E8C0(v28, (uint64_t *)&unk_10007D850);
      sub_10005A300((uint64_t)v90, type metadata accessor for CRLSELibraryViewModeItemNode);
      uint64_t result = sub_10005A300((uint64_t)v88, type metadata accessor for CRLSELibraryViewModeItemNode);
LABEL_6:
      v26 += v76;
      v27 += v76;
      if (++v77 == v65) {
        return result;
      }
      continue;
    }
  }
  return result;
}

uint64_t sub_100057C7C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v52 = a4;
  uint64_t v46 = a1;
  uint64_t v53 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  uint64_t v6 = __chkstk_darwin(v53);
  uint64_t v8 = (char *)&v44 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v44 - v9;
  uint64_t v47 = type metadata accessor for CRLSELibraryViewModeItemNode(0);
  uint64_t v11 = __chkstk_darwin(v47);
  uint64_t v51 = (uint64_t)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v60 = (uint64_t)&v44 - v14;
  uint64_t result = __chkstk_darwin(v13);
  uint64_t v18 = (char *)&v44 - v17;
  uint64_t v50 = a3;
  uint64_t v45 = a2;
  if (a3 != a2)
  {
    uint64_t v19 = *(void *)(v16 + 72);
    uint64_t v48 = (char *)&v44 - v17;
    uint64_t v49 = v19;
    uint64_t v54 = v19 * v50;
    uint64_t v55 = v19 * (v50 - 1);
    do
    {
      uint64_t v20 = 0;
      uint64_t v21 = v46;
      do
      {
        uint64_t v22 = *v52;
        sub_10005A298(v54 + v20 + *v52, (uint64_t)v18, type metadata accessor for CRLSELibraryViewModeItemNode);
        sub_10005A298(v55 + v20 + v22, v60, type metadata accessor for CRLSELibraryViewModeItemNode);
        sub_10005A298((uint64_t)v18, (uint64_t)v10, type metadata accessor for CRLSELibraryViewModel.Item);
        switch(swift_getEnumCaseMultiPayload())
        {
          case 1u:
            uint64_t v23 = sub_100019490();
            goto LABEL_10;
          case 2u:
            uint64_t v27 = sub_1000131E0(&qword_10007D1D0);
            uint64_t v28 = &v10[*(int *)(v27 + 48)];
            uint64_t v25 = *(void *)v28;
            uint64_t v26 = *((void *)v28 + 1);
            sub_10001E8C0((uint64_t)&v10[*(int *)(v27 + 80)], (uint64_t *)&unk_10007D850);
            sub_10005A300((uint64_t)v10, type metadata accessor for CRLSEBoardIdentifier);
            break;
          case 3u:
            uint64_t v29 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
            uint64_t v30 = &v10[*(int *)(v29 + 48)];
            uint64_t v25 = *(void *)v30;
            uint64_t v26 = *((void *)v30 + 1);
            sub_10001E8C0((uint64_t)&v10[*(int *)(v29 + 64)], (uint64_t *)&unk_10007D850);
            uint64_t v31 = sub_10005C3D0();
            (*(void (**)(char *, uint64_t))(*(void *)(v31 - 8) + 8))(v10, v31);
            break;
          default:
            uint64_t v23 = sub_1000192A0();
LABEL_10:
            uint64_t v25 = v23;
            uint64_t v26 = v24;
            break;
        }
        uint64_t v58 = v25;
        uint64_t v59 = v26;
        sub_10005A298(v60, (uint64_t)v8, type metadata accessor for CRLSELibraryViewModel.Item);
        switch(swift_getEnumCaseMultiPayload())
        {
          case 1u:
            uint64_t v32 = sub_100019490();
            goto LABEL_16;
          case 2u:
            uint64_t v36 = sub_1000131E0(&qword_10007D1D0);
            uint64_t v37 = &v8[*(int *)(v36 + 48)];
            uint64_t v34 = *(void *)v37;
            uint64_t v35 = *((void *)v37 + 1);
            sub_10001E8C0((uint64_t)&v8[*(int *)(v36 + 80)], (uint64_t *)&unk_10007D850);
            sub_10005A300((uint64_t)v8, type metadata accessor for CRLSEBoardIdentifier);
            break;
          case 3u:
            uint64_t v38 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
            uint64_t v39 = &v8[*(int *)(v38 + 48)];
            uint64_t v34 = *(void *)v39;
            uint64_t v35 = *((void *)v39 + 1);
            sub_10001E8C0((uint64_t)&v8[*(int *)(v38 + 64)], (uint64_t *)&unk_10007D850);
            uint64_t v40 = sub_10005C3D0();
            (*(void (**)(char *, uint64_t))(*(void *)(v40 - 8) + 8))(v8, v40);
            break;
          default:
            uint64_t v32 = sub_1000192A0();
LABEL_16:
            uint64_t v34 = v32;
            uint64_t v35 = v33;
            break;
        }
        uint64_t v56 = v34;
        uint64_t v57 = v35;
        sub_1000454B0();
        uint64_t v41 = sub_10005CB00();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_10005A300(v60, type metadata accessor for CRLSELibraryViewModeItemNode);
        uint64_t v18 = v48;
        uint64_t result = sub_10005A300((uint64_t)v48, type metadata accessor for CRLSELibraryViewModeItemNode);
        if (v41 != -1) {
          break;
        }
        uint64_t v42 = *v52;
        if (!*v52)
        {
          __break(1u);
          JUMPOUT(0x10005821CLL);
        }
        uint64_t v43 = v42 + v55 + v20;
        sub_10005A360(v42 + v54 + v20, v51, type metadata accessor for CRLSELibraryViewModeItemNode);
        swift_arrayInitWithTakeFrontToBack();
        uint64_t result = sub_10005A360(v51, v43, type metadata accessor for CRLSELibraryViewModeItemNode);
        v20 -= v49;
        ++v21;
      }
      while (v50 != v21);
      v55 += v49;
      v54 += v49;
      ++v50;
    }
    while (v50 != v45);
  }
  return result;
}

uint64_t sub_10005823C(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v144 = a3;
  uint64_t v143 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  uint64_t v7 = __chkstk_darwin(v143);
  id v137 = &v124[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v9 = __chkstk_darwin(v7);
  NSString v141 = &v124[-v10];
  uint64_t v11 = __chkstk_darwin(v9);
  NSString v136 = &v124[-v12];
  __chkstk_darwin(v11);
  id v140 = &v124[-v13];
  uint64_t v14 = sub_1000131E0((uint64_t *)&unk_10007D850);
  uint64_t v15 = __chkstk_darwin(v14 - 8);
  uint64_t v131 = &v124[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v17 = __chkstk_darwin(v15);
  NSString v135 = &v124[-v18];
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v130 = &v124[-v20];
  __chkstk_darwin(v19);
  uint64_t v22 = &v124[-v21];
  uint64_t v145 = sub_10005C390();
  uint64_t v23 = *(void *)(v145 - 8);
  uint64_t v24 = __chkstk_darwin(v145);
  uint64_t v127 = &v124[-((v25 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v26 = __chkstk_darwin(v24);
  NSString v134 = &v124[-v27];
  uint64_t v28 = __chkstk_darwin(v26);
  uint64_t v129 = &v124[-v29];
  __chkstk_darwin(v28);
  id v133 = &v124[-v30];
  uint64_t v138 = type metadata accessor for CRLSELibraryViewModeItemNode(0);
  uint64_t v31 = __chkstk_darwin(v138);
  NSString v142 = &v124[-((v32 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v33 = __chkstk_darwin(v31);
  uint64_t v139 = &v124[-v34];
  uint64_t v35 = __chkstk_darwin(v33);
  uint64_t v37 = &v124[-v36];
  uint64_t result = __chkstk_darwin(v35);
  uint64_t v40 = &v124[-v39];
  uint64_t v42 = *(void *)(v41 + 72);
  if (!v42)
  {
    __break(1u);
LABEL_94:
    __break(1u);
    goto LABEL_95;
  }
  uint64_t v43 = (void (**)(unsigned char *, uint64_t))a1;
  if (a2 - a1 == 0x8000000000000000 && v42 == -1) {
    goto LABEL_94;
  }
  int64_t v44 = v144 - a2;
  if (v144 - a2 != 0x8000000000000000 || v42 != -1)
  {
    uint64_t v45 = (uint64_t)(a2 - a1) / v42;
    NSString v148 = (unsigned char *)a1;
    id v147 = (unsigned char *)a4;
    if (v45 < v44 / v42)
    {
      uint64_t v46 = v45 * v42;
      if (a4 < (unint64_t)v43 || (unint64_t)v43 + v46 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if ((void (**)(unsigned char *, uint64_t))a4 != v43)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      NSString v141 = (unsigned char *)(a4 + v46);
      unint64_t v146 = a4 + v46;
      if (v46 >= 1 && a2 < v144)
      {
        id v137 = v140 + 8;
        uint64_t v128 = (void (**)(unsigned char *, uint64_t))(v136 + 1);
        NSString v134 = v40;
        NSString v135 = (unsigned char *)(v23 + 56);
        NSString v142 = (void *)(v23 + 48);
        uint64_t v139 = (void *)(v23 + 32);
        uint64_t v132 = (void (**)(unsigned char *, uint64_t))(v23 + 8);
        while (1)
        {
          sub_10005A298(a2, (uint64_t)v40, type metadata accessor for CRLSELibraryViewModeItemNode);
          sub_10005A298(a4, (uint64_t)v37, type metadata accessor for CRLSELibraryViewModeItemNode);
          sub_10005A298((uint64_t)v40, (uint64_t)v140, type metadata accessor for CRLSELibraryViewModel.Item);
          int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
          if (EnumCaseMultiPayload == 3)
          {
            uint64_t v54 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
            swift_bridgeObjectRelease();
            uint64_t v55 = v140;
            sub_10003C51C((uint64_t)&v140[*(int *)(v54 + 64)], (uint64_t)v22, (uint64_t *)&unk_10007D850);
            uint64_t v56 = sub_10005C3D0();
            (*(void (**)(unsigned char *, uint64_t))(*(void *)(v56 - 8) + 8))(v55, v56);
          }
          else
          {
            if (EnumCaseMultiPayload == 2)
            {
              uint64_t v50 = sub_1000131E0(&qword_10007D1D0);
              swift_bridgeObjectRelease();
              uint64_t v51 = v140;
              sub_10003C51C((uint64_t)&v140[*(int *)(v50 + 80)], (uint64_t)v22, (uint64_t *)&unk_10007D850);
              uint64_t v52 = type metadata accessor for CRLSEBoardIdentifier;
              uint64_t v53 = v51;
            }
            else
            {
              (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))v135)(v22, 1, 1, v145);
              uint64_t v52 = type metadata accessor for CRLSELibraryViewModel.Item;
              uint64_t v53 = v140;
            }
            sub_10005A300((uint64_t)v53, v52);
          }
          uint64_t v57 = (uint64_t (*)(unsigned char *, uint64_t, uint64_t))*v142;
          int v58 = ((uint64_t (*)(unsigned char *, uint64_t, uint64_t))*v142)(v22, 1, v145);
          uint64_t v59 = (uint64_t)v22;
          if (v58 == 1) {
            goto LABEL_36;
          }
          uint64_t v60 = (void (*)(unsigned char *, unsigned char *, uint64_t))*v139;
          ((void (*)(unsigned char *, unsigned char *, uint64_t))*v139)(v133, v22, v145);
          sub_10005A298((uint64_t)v37, (uint64_t)v136, type metadata accessor for CRLSELibraryViewModel.Item);
          int v61 = swift_getEnumCaseMultiPayload();
          if (v61 == 3)
          {
            uint64_t v69 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
            swift_bridgeObjectRelease();
            uint64_t v70 = *(int *)(v69 + 64);
            uint64_t v71 = v136;
            uint64_t v68 = v130;
            sub_10003C51C((uint64_t)v136 + v70, (uint64_t)v130, (uint64_t *)&unk_10007D850);
            uint64_t v72 = sub_10005C3D0();
            (*(void (**)(void *, uint64_t))(*(void *)(v72 - 8) + 8))(v71, v72);
          }
          else
          {
            if (v61 == 2)
            {
              uint64_t v62 = sub_1000131E0(&qword_10007D1D0);
              swift_bridgeObjectRelease();
              uint64_t v63 = v136;
              uint64_t v64 = (uint64_t)v136 + *(int *)(v62 + 80);
              uint64_t v65 = v130;
              sub_10003C51C(v64, (uint64_t)v130, (uint64_t *)&unk_10007D850);
              uint64_t v66 = type metadata accessor for CRLSEBoardIdentifier;
              uint64_t v67 = v63;
              uint64_t v68 = v65;
            }
            else
            {
              uint64_t v68 = v130;
              (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))v135)(v130, 1, 1, v145);
              uint64_t v66 = type metadata accessor for CRLSELibraryViewModel.Item;
              uint64_t v67 = v136;
            }
            sub_10005A300((uint64_t)v67, v66);
          }
          if (v57(v68, 1, v145) == 1) {
            break;
          }
          uint64_t v76 = v129;
          uint64_t v77 = v145;
          v60(v129, v68, v145);
          uint64_t v78 = v22;
          uint64_t v79 = v37;
          uint64_t v80 = v42;
          uint64_t v81 = v133;
          uint64_t v131 = (unsigned char *)sub_10005C370();
          uint64_t v82 = *v132;
          (*v132)(v76, v77);
          uint64_t v83 = v81;
          uint64_t v42 = v80;
          uint64_t v37 = v79;
          uint64_t v22 = v78;
          v82(v83, v77);
          sub_10005A300((uint64_t)v37, type metadata accessor for CRLSELibraryViewModeItemNode);
          uint64_t v40 = v134;
          sub_10005A300((uint64_t)v134, type metadata accessor for CRLSELibraryViewModeItemNode);
          if (v131 != (unsigned char *)1) {
            goto LABEL_37;
          }
          unint64_t v73 = (unint64_t)v148;
          unint64_t v75 = a2 + v42;
          if ((unint64_t)v148 < a2 || (unint64_t)v148 >= v75)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v148 == (unsigned char *)a2)
          {
            unint64_t v73 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront();
          }
LABEL_43:
          NSString v148 = (unsigned char *)(v73 + v42);
          a4 = (unint64_t)v147;
          if (v147 < v141)
          {
            a2 = v75;
            if (v75 < v144) {
              continue;
            }
          }
          goto LABEL_92;
        }
        (*v132)(v133, v145);
        uint64_t v59 = (uint64_t)v68;
        uint64_t v40 = v134;
LABEL_36:
        sub_10001E8C0(v59, (uint64_t *)&unk_10007D850);
        sub_10005A300((uint64_t)v37, type metadata accessor for CRLSELibraryViewModeItemNode);
        sub_10005A300((uint64_t)v40, type metadata accessor for CRLSELibraryViewModeItemNode);
LABEL_37:
        unint64_t v73 = (unint64_t)v148;
        unint64_t v74 = (unint64_t)&v147[v42];
        if (v148 < v147 || (unint64_t)v148 >= v74)
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (v148 != v147)
        {
          swift_arrayInitWithTakeBackToFront();
        }
        id v147 = (unsigned char *)v74;
        unint64_t v75 = a2;
        goto LABEL_43;
      }
      goto LABEL_92;
    }
    uint64_t v47 = v44 / v42 * v42;
    if (a4 < a2 || a2 + v47 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else
    {
      if (a4 == a2)
      {
LABEL_55:
        unint64_t v84 = a4 + v47;
        unint64_t v146 = a4 + v47;
        NSString v148 = (unsigned char *)a2;
        if (v47 < 1 || (unint64_t)v43 >= a2)
        {
LABEL_92:
          sub_100059E04((unint64_t *)&v148, (unint64_t *)&v147, (uint64_t *)&v146);
          return 1;
        }
        uint64_t v86 = -v42;
        id v133 = v141 + 8;
        uint64_t v126 = v137 + 8;
        uint64_t v87 = (unsigned char *)(v23 + 48);
        NSString v136 = (void *)(v23 + 32);
        uint64_t v128 = (void (**)(unsigned char *, uint64_t))(v23 + 8);
        uint64_t v129 = (unsigned char *)(v23 + 56);
        uint64_t v130 = (unsigned char *)(v23 + 48);
        uint64_t v132 = v43;
        unint64_t v125 = a4;
        while (1)
        {
          uint64_t v88 = v139;
          sub_10005A298(v84 + v86, (uint64_t)v139, type metadata accessor for CRLSELibraryViewModeItemNode);
          id v140 = (unsigned char *)(a2 + v86);
          sub_10005A298(a2 + v86, (uint64_t)v142, type metadata accessor for CRLSELibraryViewModeItemNode);
          sub_10005A298((uint64_t)v88, (uint64_t)v141, type metadata accessor for CRLSELibraryViewModel.Item);
          int v89 = swift_getEnumCaseMultiPayload();
          if (v89 == 3)
          {
            uint64_t v96 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
            swift_bridgeObjectRelease();
            uint64_t v97 = v141;
            uint64_t v98 = (uint64_t)&v141[*(int *)(v96 + 64)];
            uint64_t v93 = v135;
            sub_10003C51C(v98, (uint64_t)v135, (uint64_t *)&unk_10007D850);
            uint64_t v99 = sub_10005C3D0();
            (*(void (**)(unsigned char *, uint64_t))(*(void *)(v99 - 8) + 8))(v97, v99);
          }
          else
          {
            if (v89 == 2)
            {
              uint64_t v90 = sub_1000131E0(&qword_10007D1D0);
              swift_bridgeObjectRelease();
              uint64_t v91 = v141;
              uint64_t v92 = (uint64_t)&v141[*(int *)(v90 + 80)];
              uint64_t v93 = v135;
              sub_10003C51C(v92, (uint64_t)v135, (uint64_t *)&unk_10007D850);
              uint64_t v94 = type metadata accessor for CRLSEBoardIdentifier;
              BOOL v95 = v91;
            }
            else
            {
              uint64_t v93 = v135;
              (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))v129)(v135, 1, 1, v145);
              uint64_t v94 = type metadata accessor for CRLSELibraryViewModel.Item;
              BOOL v95 = v141;
            }
            sub_10005A300((uint64_t)v95, v94);
          }
          int64_t v100 = *(unsigned int (**)(unsigned char *, uint64_t, uint64_t))v87;
          if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))v87)(v93, 1, v145) == 1) {
            goto LABEL_75;
          }
          uint64_t v101 = (void (*)(unsigned char *, unsigned char *, uint64_t))*v136;
          ((void (*)(unsigned char *, unsigned char *, uint64_t))*v136)(v134, v93, v145);
          sub_10005A298((uint64_t)v142, (uint64_t)v137, type metadata accessor for CRLSELibraryViewModel.Item);
          int v102 = swift_getEnumCaseMultiPayload();
          if (v102 == 2) {
            break;
          }
          if (v102 != 3)
          {
            uint64_t v93 = v131;
            (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))v129)(v131, 1, 1, v145);
            uint64_t v112 = type metadata accessor for CRLSELibraryViewModel.Item;
            uint64_t v113 = v137;
            goto LABEL_72;
          }
          uint64_t v103 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
          swift_bridgeObjectRelease();
          uint64_t v104 = *(int *)(v103 + 64);
          uint64_t v105 = v137;
          unint64_t v106 = v131;
          sub_10003C51C((uint64_t)&v137[v104], (uint64_t)v131, (uint64_t *)&unk_10007D850);
          uint64_t v107 = sub_10005C3D0();
          Swift::Int v108 = v105;
          uint64_t v93 = v106;
          uint64_t v87 = v130;
          (*(void (**)(unsigned char *, uint64_t))(*(void *)(v107 - 8) + 8))(v108, v107);
LABEL_73:
          if (v100(v93, 1, v145) != 1)
          {
            uint64_t v115 = v127;
            uint64_t v116 = v145;
            v101(v127, v93, v145);
            NSString v117 = v134;
            BOOL v114 = sub_10005C370() == 1;
            NSString v118 = *v128;
            NSString v119 = v115;
            uint64_t v87 = v130;
            (*v128)(v119, v116);
            uint64_t v120 = v116;
            a4 = v125;
            v118(v117, v120);
            goto LABEL_77;
          }
          (*v128)(v134, v145);
LABEL_75:
          sub_10001E8C0((uint64_t)v93, (uint64_t *)&unk_10007D850);
          BOOL v114 = 0;
LABEL_77:
          unint64_t v121 = v144 + v86;
          sub_10005A300((uint64_t)v142, type metadata accessor for CRLSELibraryViewModeItemNode);
          sub_10005A300((uint64_t)v139, type metadata accessor for CRLSELibraryViewModeItemNode);
          if (v114)
          {
            if (v144 < a2 || v121 >= a2)
            {
              uint64_t v122 = v140;
              swift_arrayInitWithTakeFrontToBack();
            }
            else
            {
              uint64_t v122 = v140;
              if (v144 != a2) {
                swift_arrayInitWithTakeBackToFront();
              }
            }
            v148 += v86;
          }
          else
          {
            unint64_t v123 = v146;
            v146 += v86;
            if (v144 < v123 || v121 >= v123)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (v144 != v123)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            uint64_t v122 = (unsigned char *)a2;
          }
          unint64_t v84 = v146;
          if (v146 > a4)
          {
            a2 = (unint64_t)v122;
            unint64_t v144 = v121;
            if (v122 > (unsigned char *)v132) {
              continue;
            }
          }
          goto LABEL_92;
        }
        uint64_t v109 = sub_1000131E0(&qword_10007D1D0);
        swift_bridgeObjectRelease();
        uint64_t v110 = v137;
        uint64_t v111 = (uint64_t)&v137[*(int *)(v109 + 80)];
        uint64_t v93 = v131;
        sub_10003C51C(v111, (uint64_t)v131, (uint64_t *)&unk_10007D850);
        uint64_t v112 = type metadata accessor for CRLSEBoardIdentifier;
        uint64_t v113 = v110;
        uint64_t v87 = v130;
LABEL_72:
        sub_10005A300((uint64_t)v113, v112);
        goto LABEL_73;
      }
      swift_arrayInitWithTakeBackToFront();
    }
    uint64_t v43 = (void (**)(unsigned char *, uint64_t))a1;
    goto LABEL_55;
  }
LABEL_95:
  __break(1u);
  return result;
}

uint64_t sub_1000591F8(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v98 = a3;
  uint64_t v7 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v95 = (uint64_t)&v90 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v94 = (uint64_t)&v90 - v11;
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v90 - v13;
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v90 - v15;
  uint64_t v92 = type metadata accessor for CRLSELibraryViewModeItemNode(0);
  uint64_t v17 = __chkstk_darwin(v92);
  unint64_t v97 = (unint64_t)&v90 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v96 = (uint64_t)&v90 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v23 = (char *)&v90 - v22;
  __chkstk_darwin(v21);
  uint64_t v25 = (char *)&v90 - v24;
  uint64_t v27 = *(void *)(v26 + 72);
  if (!v27)
  {
    __break(1u);
LABEL_84:
    __break(1u);
    goto LABEL_85;
  }
  if (a2 - a1 == 0x8000000000000000 && v27 == -1) {
    goto LABEL_84;
  }
  int64_t v28 = v98 - a2;
  if (v98 - a2 == 0x8000000000000000 && v27 == -1)
  {
LABEL_85:
    __break(1u);
    JUMPOUT(0x100059CC8);
  }
  uint64_t v29 = (uint64_t)(a2 - a1) / v27;
  unint64_t v105 = a1;
  unint64_t v104 = a4;
  uint64_t v93 = v7;
  if (v29 >= v28 / v27)
  {
    uint64_t v31 = v28 / v27 * v27;
    if (a4 < a2 || a2 + v31 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a2)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    unint64_t v56 = a4 + v31;
    unint64_t v103 = a4 + v31;
    unint64_t v105 = a2;
    if (v31 >= 1 && a1 < a2)
    {
      uint64_t v58 = -v27;
      unint64_t v91 = a1;
      do
      {
        uint64_t v59 = v96;
        sub_10005A298(v56 + v58, v96, type metadata accessor for CRLSELibraryViewModeItemNode);
        unint64_t v60 = a2 + v58;
        sub_10005A298(a2 + v58, v97, type metadata accessor for CRLSELibraryViewModeItemNode);
        sub_10005A298(v59, v94, type metadata accessor for CRLSELibraryViewModel.Item);
        switch(swift_getEnumCaseMultiPayload())
        {
          case 1u:
            uint64_t v61 = sub_100019490();
            goto LABEL_58;
          case 2u:
            uint64_t v65 = sub_1000131E0(&qword_10007D1D0);
            uint64_t v66 = v94;
            uint64_t v67 = (uint64_t *)(v94 + *(int *)(v65 + 48));
            uint64_t v63 = *v67;
            uint64_t v64 = v67[1];
            sub_10001E8C0(v94 + *(int *)(v65 + 80), (uint64_t *)&unk_10007D850);
            sub_10005A300(v66, type metadata accessor for CRLSEBoardIdentifier);
            break;
          case 3u:
            uint64_t v68 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
            uint64_t v69 = v94;
            uint64_t v70 = (uint64_t *)(v94 + *(int *)(v68 + 48));
            uint64_t v63 = *v70;
            uint64_t v64 = v70[1];
            sub_10001E8C0(v94 + *(int *)(v68 + 64), (uint64_t *)&unk_10007D850);
            uint64_t v71 = sub_10005C3D0();
            (*(void (**)(uint64_t, uint64_t))(*(void *)(v71 - 8) + 8))(v69, v71);
            break;
          default:
            uint64_t v61 = sub_1000192A0();
LABEL_58:
            uint64_t v63 = v61;
            uint64_t v64 = v62;
            break;
        }
        uint64_t v101 = v63;
        uint64_t v102 = v64;
        sub_10005A298(v97, v95, type metadata accessor for CRLSELibraryViewModel.Item);
        switch(swift_getEnumCaseMultiPayload())
        {
          case 1u:
            uint64_t v72 = sub_100019490();
            goto LABEL_64;
          case 2u:
            uint64_t v76 = sub_1000131E0(&qword_10007D1D0);
            uint64_t v77 = v95;
            uint64_t v78 = (uint64_t *)(v95 + *(int *)(v76 + 48));
            uint64_t v74 = *v78;
            uint64_t v75 = v78[1];
            sub_10001E8C0(v95 + *(int *)(v76 + 80), (uint64_t *)&unk_10007D850);
            sub_10005A300(v77, type metadata accessor for CRLSEBoardIdentifier);
            break;
          case 3u:
            uint64_t v79 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
            uint64_t v80 = v95;
            uint64_t v81 = (uint64_t *)(v95 + *(int *)(v79 + 48));
            uint64_t v74 = *v81;
            uint64_t v75 = v81[1];
            sub_10001E8C0(v95 + *(int *)(v79 + 64), (uint64_t *)&unk_10007D850);
            uint64_t v82 = sub_10005C3D0();
            (*(void (**)(uint64_t, uint64_t))(*(void *)(v82 - 8) + 8))(v80, v82);
            break;
          default:
            uint64_t v72 = sub_1000192A0();
LABEL_64:
            uint64_t v74 = v72;
            uint64_t v75 = v73;
            break;
        }
        unint64_t v83 = v98;
        unint64_t v84 = v98 + v58;
        uint64_t v99 = v74;
        uint64_t v100 = v75;
        sub_1000454B0();
        uint64_t v85 = sub_10005CB00();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_10005A300(v97, type metadata accessor for CRLSELibraryViewModeItemNode);
        sub_10005A300(v96, type metadata accessor for CRLSELibraryViewModeItemNode);
        if (v85 == -1)
        {
          if (v83 < a2 || v84 >= a2)
          {
            swift_arrayInitWithTakeFrontToBack();
            unint64_t v88 = v91;
          }
          else
          {
            BOOL v87 = v83 == a2;
            unint64_t v88 = v91;
            if (!v87) {
              swift_arrayInitWithTakeBackToFront();
            }
          }
          v105 += v58;
        }
        else
        {
          unint64_t v86 = v103;
          v103 += v58;
          if (v83 < v86 || v84 >= v86)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v83 != v86)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          unint64_t v60 = a2;
          unint64_t v88 = v91;
        }
        unint64_t v56 = v103;
        if (v103 <= a4) {
          break;
        }
        a2 = v60;
        unint64_t v98 = v84;
      }
      while (v60 > v88);
    }
  }
  else
  {
    uint64_t v30 = v29 * v27;
    if (a4 < a1 || a1 + v30 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    unint64_t v97 = a4 + v30;
    unint64_t v103 = a4 + v30;
    if (v30 >= 1 && a2 < v98)
    {
      uint64_t v96 = v27;
      do
      {
        sub_10005A298(a2, (uint64_t)v25, type metadata accessor for CRLSELibraryViewModeItemNode);
        sub_10005A298(a4, (uint64_t)v23, type metadata accessor for CRLSELibraryViewModeItemNode);
        sub_10005A298((uint64_t)v25, (uint64_t)v16, type metadata accessor for CRLSELibraryViewModel.Item);
        switch(swift_getEnumCaseMultiPayload())
        {
          case 1u:
            uint64_t v33 = sub_100019490();
            goto LABEL_24;
          case 2u:
            uint64_t v37 = sub_1000131E0(&qword_10007D1D0);
            uint64_t v38 = &v16[*(int *)(v37 + 48)];
            uint64_t v35 = *(void *)v38;
            uint64_t v36 = *((void *)v38 + 1);
            sub_10001E8C0((uint64_t)&v16[*(int *)(v37 + 80)], (uint64_t *)&unk_10007D850);
            sub_10005A300((uint64_t)v16, type metadata accessor for CRLSEBoardIdentifier);
            break;
          case 3u:
            uint64_t v39 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
            uint64_t v40 = &v16[*(int *)(v39 + 48)];
            uint64_t v35 = *(void *)v40;
            uint64_t v36 = *((void *)v40 + 1);
            sub_10001E8C0((uint64_t)&v16[*(int *)(v39 + 64)], (uint64_t *)&unk_10007D850);
            uint64_t v41 = sub_10005C3D0();
            (*(void (**)(char *, uint64_t))(*(void *)(v41 - 8) + 8))(v16, v41);
            break;
          default:
            uint64_t v33 = sub_1000192A0();
LABEL_24:
            uint64_t v35 = v33;
            uint64_t v36 = v34;
            break;
        }
        uint64_t v101 = v35;
        uint64_t v102 = v36;
        sub_10005A298((uint64_t)v23, (uint64_t)v14, type metadata accessor for CRLSELibraryViewModel.Item);
        switch(swift_getEnumCaseMultiPayload())
        {
          case 1u:
            uint64_t v42 = sub_100019490();
            goto LABEL_30;
          case 2u:
            uint64_t v46 = sub_1000131E0(&qword_10007D1D0);
            uint64_t v47 = &v14[*(int *)(v46 + 48)];
            uint64_t v44 = *(void *)v47;
            uint64_t v45 = *((void *)v47 + 1);
            sub_10001E8C0((uint64_t)&v14[*(int *)(v46 + 80)], (uint64_t *)&unk_10007D850);
            sub_10005A300((uint64_t)v14, type metadata accessor for CRLSEBoardIdentifier);
            break;
          case 3u:
            uint64_t v48 = sub_1000131E0((uint64_t *)&unk_10007D1C0);
            uint64_t v49 = &v14[*(int *)(v48 + 48)];
            uint64_t v44 = *(void *)v49;
            uint64_t v45 = *((void *)v49 + 1);
            sub_10001E8C0((uint64_t)&v14[*(int *)(v48 + 64)], (uint64_t *)&unk_10007D850);
            uint64_t v50 = sub_10005C3D0();
            (*(void (**)(char *, uint64_t))(*(void *)(v50 - 8) + 8))(v14, v50);
            break;
          default:
            uint64_t v42 = sub_1000192A0();
LABEL_30:
            uint64_t v44 = v42;
            uint64_t v45 = v43;
            break;
        }
        uint64_t v99 = v44;
        uint64_t v100 = v45;
        sub_1000454B0();
        uint64_t v51 = sub_10005CB00();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_10005A300((uint64_t)v23, type metadata accessor for CRLSELibraryViewModeItemNode);
        sub_10005A300((uint64_t)v25, type metadata accessor for CRLSELibraryViewModeItemNode);
        unint64_t v52 = v105;
        if (v51 == -1)
        {
          uint64_t v53 = v96;
          unint64_t v55 = a2 + v96;
          if (v105 < a2 || v105 >= v55)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v105 == a2)
          {
            unint64_t v52 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        else
        {
          uint64_t v53 = v96;
          unint64_t v54 = v104 + v96;
          if (v105 < v104 || v105 >= v54)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v105 != v104)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          unint64_t v104 = v54;
          unint64_t v55 = a2;
        }
        unint64_t v105 = v52 + v53;
        a4 = v104;
        if (v104 >= v97) {
          break;
        }
        a2 = v55;
      }
      while (v55 < v98);
    }
  }
  sub_100059E04(&v105, &v104, (uint64_t *)&v103);
  return 1;
}

char *sub_100059D08(char *result, int64_t a2, char a3, char *a4)
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
    sub_1000131E0(&qword_10007DAD8);
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
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_100059E04(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  uint64_t v5 = *a3;
  uint64_t result = type metadata accessor for CRLSELibraryViewModeItemNode(0);
  uint64_t v7 = *(void *)(*(void *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_17:
    __break(1u);
    return result;
  }
  if (v5 - v4 == 0x8000000000000000 && v7 == -1) {
    goto LABEL_17;
  }
  if (v3 < v4 || v3 >= v4 + (uint64_t)(v5 - v4) / v7 * v7)
  {
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (v3 != v4)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *sub_100059EE8(uint64_t a1)
{
  return sub_100059D08(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_100059EFC(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_10005CCA0();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      return a3;
    }
  }
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_10005CCA0();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_10005AC8C();
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            sub_1000131E0(&qword_10007DAF8);
            uint64_t v10 = sub_10005A09C(v13, i, a3);
            id v12 = *v11;
            ((void (*)(void (**)(id *), void))v10)(v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_100030798();
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

void (*sub_10005A09C(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_10005A14C(v6, a2, a3);
  return sub_10005A104;
}

void sub_10005A104(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_10005A14C(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  unint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)sub_10005CBE0();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)unint64_t v3 = v4;
    return sub_10005A1CC;
  }
  __break(1u);
  return result;
}

void sub_10005A1CC(id *a1)
{
}

size_t sub_10005A1D4(void *a1)
{
  return sub_10005377C(0, a1[2], 0, a1, &qword_10007DAD0, type metadata accessor for CRLSELibraryViewModeItemNode);
}

uint64_t sub_10005A218(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_10005CCA0();
    swift_bridgeObjectRelease();
  }

  return sub_10005CBF0();
}

uint64_t sub_10005A298(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10005A300(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10005A360(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10005A3C8(uint64_t a1, size_t a2)
{
  size_t v72 = a2;
  uint64_t v76 = a1;
  uint64_t v69 = type metadata accessor for CRLSELibraryViewModel.Item(0);
  uint64_t v3 = __chkstk_darwin(v69);
  uint64_t v5 = (char *)&v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v59 - v6;
  uint64_t v8 = sub_1000131E0((uint64_t *)&unk_10007D6F0);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v70 = (uint64_t)&v59 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v65 = (uint64_t)&v59 - v12;
  __chkstk_darwin(v11);
  uint64_t v68 = (uint64_t)&v59 - v13;
  uint64_t v14 = type metadata accessor for CRLSELibraryViewModeItemNode(0);
  uint64_t v15 = *(void *)(v14 - 8);
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v59 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __chkstk_darwin(v16);
  uint64_t v64 = (uint64_t)&v59 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v23 = (char *)&v59 - v22;
  __chkstk_darwin(v21);
  uint64_t v61 = (uint64_t)&v59 - v24;
  uint64_t v25 = v2 + OBJC_IVAR____TtC24FreeformSharingExtension12CRLSELibrary_libraryNode;
  uint64_t v27 = v15 + 56;
  uint64_t v26 = *(void (**)(void))(v15 + 56);
  ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v26)(v2 + OBJC_IVAR____TtC24FreeformSharingExtension12CRLSELibrary_libraryNode, 1, 1, v14);
  uint64_t v62 = v2 + OBJC_IVAR____TtC24FreeformSharingExtension12CRLSELibrary_allBoards;
  v26();
  uint64_t v71 = v2;
  uint64_t v63 = v2 + OBJC_IVAR____TtC24FreeformSharingExtension12CRLSELibrary_recents;
  v26();
  swift_beginAccess();
  sub_10005ABBC(v76, v25);
  swift_endAccess();
  uint64_t v67 = v15;
  int64_t v28 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48);
  uint64_t v73 = v15 + 48;
  uint64_t v75 = v28;
  unsigned int v29 = v28(v25, 1, v14);
  uint64_t v74 = v26;
  if (v29)
  {
    uint64_t v30 = v68;
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v26)(v68, 1, 1, v14);
    uint64_t v31 = v14;
    uint64_t v32 = v75;
LABEL_13:
    sub_10001E8C0(v30, (uint64_t *)&unk_10007D6F0);
    goto LABEL_14;
  }
  uint64_t v66 = v15 + 56;
  uint64_t v60 = v14;
  uint64_t v33 = *(void *)(v25 + *(int *)(v14 + 20));
  uint64_t v34 = *(void *)(v33 + 16);
  if (v34)
  {
    uint64_t v35 = v33 + ((*(unsigned __int8 *)(v67 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v67 + 80));
    uint64_t v36 = *(void *)(v67 + 72);
    uint64_t v59 = v33;
    swift_bridgeObjectRetain();
    do
    {
      sub_10005A298(v35, (uint64_t)v23, type metadata accessor for CRLSELibraryViewModeItemNode);
      sub_10005A298((uint64_t)v23, (uint64_t)v7, type metadata accessor for CRLSELibraryViewModel.Item);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        if (!*v7)
        {
          uint64_t v37 = (uint64_t)v23;
          uint64_t v30 = v68;
          sub_10005A360(v37, v68, type metadata accessor for CRLSELibraryViewModeItemNode);
          uint64_t v27 = v66;
          uint64_t v31 = v60;
          uint64_t v32 = v75;
          ((void (*)(uint64_t, void, uint64_t, uint64_t))v74)(v30, 0, 1, v60);
          goto LABEL_12;
        }
      }
      else
      {
        sub_10005A300((uint64_t)v7, type metadata accessor for CRLSELibraryViewModel.Item);
      }
      sub_10005A300((uint64_t)v23, type metadata accessor for CRLSELibraryViewModeItemNode);
      v35 += v36;
      --v34;
    }
    while (v34);
    uint64_t v27 = v66;
    uint64_t v31 = v60;
    uint64_t v32 = v75;
    uint64_t v30 = v68;
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v74)(v68, 1, 1, v60);
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v27 = v66;
    uint64_t v31 = v60;
    uint64_t v32 = v75;
    uint64_t v30 = v68;
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v74)(v68, 1, 1, v60);
  }
LABEL_12:
  swift_bridgeObjectRelease();
  if (v32(v30, 1, v31) == 1) {
    goto LABEL_13;
  }
  uint64_t v47 = v61;
  sub_10005A360(v30, v61, type metadata accessor for CRLSELibraryViewModeItemNode);
  uint64_t v48 = v47;
  uint64_t v49 = v65;
  uint64_t v27 = v66;
  uint64_t v32 = v75;
  sub_10005A360(v48, v65, type metadata accessor for CRLSELibraryViewModeItemNode);
  ((void (*)(uint64_t, void, uint64_t, uint64_t))v74)(v49, 0, 1, v31);
  uint64_t v50 = v62;
  swift_beginAccess();
  sub_10005AC24(v49, v50);
  swift_endAccess();
LABEL_14:
  if (v32(v25, 1, v31))
  {
    uint64_t v38 = v70;
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v74)(v70, 1, 1, v31);
    uint64_t v39 = v71;
    size_t v40 = v72;
  }
  else
  {
    uint64_t v41 = *(void *)(v25 + *(int *)(v31 + 20));
    uint64_t v42 = *(void *)(v41 + 16);
    if (v42)
    {
      uint64_t v66 = v27;
      uint64_t v43 = v41 + ((*(unsigned __int8 *)(v67 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v67 + 80));
      uint64_t v44 = *(void *)(v67 + 72);
      swift_bridgeObjectRetain();
      do
      {
        sub_10005A298(v43, (uint64_t)v18, type metadata accessor for CRLSELibraryViewModeItemNode);
        sub_10005A298((uint64_t)v18, (uint64_t)v5, type metadata accessor for CRLSELibraryViewModel.Item);
        if (swift_getEnumCaseMultiPayload() == 1)
        {
          if (*v5 == 1)
          {
            uint64_t v45 = (uint64_t)v18;
            uint64_t v38 = v70;
            sub_10005A360(v45, v70, type metadata accessor for CRLSELibraryViewModeItemNode);
            uint64_t v46 = 0;
            goto LABEL_26;
          }
        }
        else
        {
          sub_10005A300((uint64_t)v5, type metadata accessor for CRLSELibraryViewModel.Item);
        }
        sub_10005A300((uint64_t)v18, type metadata accessor for CRLSELibraryViewModeItemNode);
        v43 += v44;
        --v42;
      }
      while (v42);
      uint64_t v46 = 1;
      uint64_t v38 = v70;
    }
    else
    {
      swift_bridgeObjectRetain();
      uint64_t v46 = 1;
      uint64_t v38 = v70;
    }
LABEL_26:
    uint64_t v51 = v74;
    uint64_t v39 = v71;
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v74)(v38, v46, 1, v31);
    swift_bridgeObjectRelease();
    unsigned int v52 = v75(v38, 1, v31);
    size_t v40 = v72;
    if (v52 != 1)
    {
      uint64_t v54 = v38;
      uint64_t v55 = v64;
      sub_10005A360(v54, v64, type metadata accessor for CRLSELibraryViewModeItemNode);
      uint64_t v56 = v55;
      uint64_t v57 = v65;
      size_t v40 = v72;
      sub_10005A360(v56, v65, type metadata accessor for CRLSELibraryViewModeItemNode);
      ((void (*)(uint64_t, void, uint64_t, uint64_t))v51)(v57, 0, 1, v31);
      uint64_t v58 = v63;
      swift_beginAccess();
      sub_10005AC24(v57, v58);
      swift_endAccess();
      goto LABEL_28;
    }
  }
  sub_10001E8C0(v38, (uint64_t *)&unk_10007D6F0);
LABEL_28:
  sub_10005303C(v40);
  sub_10001E8C0(v76, (uint64_t *)&unk_10007D6F0);
  return v39;
}

uint64_t sub_10005ABBC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000131E0((uint64_t *)&unk_10007D6F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t sub_10005AC24(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000131E0((uint64_t *)&unk_10007D6F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_10005AC8C()
{
  unint64_t result = qword_10007DB00;
  if (!qword_10007DB00)
  {
    sub_10001DE60(&qword_10007DAF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10007DB00);
  }
  return result;
}

void sub_10005ACE8(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[CRLAssertionHandler packedBacktraceString];
  sub_1000051A8();
  sub_1000051E8((void *)&_mh_execute_header, v3, v4, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", v5, v6, v7, v8, v9);
}

void sub_10005AD8C()
{
  sub_1000051D4();
  uint64_t v3 = "NSString *CRLAppGroupIdentifier()_block_invoke";
  __int16 v4 = v0;
  uint64_t v5 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLBundleUtilities.m";
  __int16 v6 = 1024;
  sub_1000051C0();
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d App group identifier (%@) has unexpected prefix.", v2, 0x2Cu);
}

void sub_10005AE34(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)sub_10000B118() packedBacktraceString];
  sub_1000051A8();
  sub_1000051E8((void *)&_mh_execute_header, v4, v5, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", v6, v7, v8, v9, v10);
}

void sub_10005AED4()
{
  sub_10000B0D8();
  sub_10000B124();
  sub_10000B0EC();
  sub_10000B0FC((void *)&_mh_execute_header, v0, v1, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", v2, v3, v4, v5, v6);
}

void sub_10005AF6C()
{
  sub_10000B0D8();
  sub_10000B124();
  sub_10000B0EC();
  sub_10000B0FC((void *)&_mh_execute_header, v0, v1, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", v2, v3, v4, v5, v6);
}

void sub_10005B004()
{
  sub_10000B0D8();
  sub_10000B124();
  sub_10000B0EC();
  sub_10000B0FC((void *)&_mh_execute_header, v0, v1, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", v2, v3, v4, v5, v6);
}

void sub_10005B09C(uint64_t a1, int a2)
{
  v4[0] = 67110146;
  v4[1] = a2;
  __int16 v5 = 2082;
  sub_10000B124();
  uint8_t v6 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/NSString_CRLAdditions.m";
  __int16 v7 = 1024;
  int v8 = 1331;
  __int16 v9 = 2112;
  uint64_t v10 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Unable to make a string out of data with UTI %@", (uint8_t *)v4, 0x2Cu);
}

void sub_10005B154(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to use AddressBook API. Localization format may be incorrect.", v1, 2u);
}

void sub_10005B198(uint8_t *a1, void *a2, void *a3, void *a4)
{
  __int16 v7 = a2;
  int v8 = [a3 registeredTypeIdentifiers];
  *(_DWORD *)a1 = 138412290;
  *a4 = v8;
  _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Content Identifiers: %@", a1, 0xCu);
}

void sub_10005B21C(void *a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = [UTTypeRAWImage identifier];
  sub_10000D334();
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Unable to load shared content of type %{public}@. Provided item is nil", v3, 0xCu);
}

void sub_10005B2C8(void *a1, void *a2)
{
  id v4 = a1;
  __int16 v5 = (objc_class *)sub_10000D340();
  uint8_t v6 = NSStringFromClass(v5);
  __int16 v7 = [a2 domain];
  [a2 code];
  sub_10000D2E4();
  sub_10000D314((void *)&_mh_execute_header, v8, v9, "Error copying shared item: errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", v10, v11, v12, v13, v14);
}

void sub_10005B37C()
{
  sub_10000D334();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Image file representation: %@", v1, 0xCu);
}

void sub_10005B3F0(uint64_t a1, void *a2)
{
  id v4 = a2;
  __int16 v5 = (objc_class *)sub_10000D340();
  uint8_t v6 = NSStringFromClass(v5);
  uint64_t v13 = [*(id *)(*(void *)(*(void *)a1 + 8) + 40) domain];
  [*(id *)(*(void *)(*(void *)a1 + 8) + 40) code];
  sub_10000D314((void *)&_mh_execute_header, v7, v8, "Error copying shared item: errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", v9, v10, v11, v12, 2u);
}

void sub_10005B4F4()
{
  sub_10000D334();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Image file copied to: %@", v1, 0xCu);
}

void sub_10005B568()
{
  sub_10000D334();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "Unable to resolve extension item to a supported type: %@", v1, 0xCu);
}

void sub_10005B5DC(void *a1, void *a2, void *a3)
{
  __int16 v5 = a1;
  uint8_t v6 = [a2 identifier];
  uint64_t v7 = [a3 localizedDescription];
  int v8 = 138543618;
  uint64_t v9 = v6;
  __int16 v10 = 2114;
  uint64_t v11 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Unable to load shared content of type %{public}@ with error %{public}@", (uint8_t *)&v8, 0x16u);
}

void sub_10005B6B0(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  uint64_t v7 = (objc_class *)sub_10000D340();
  int v8 = NSStringFromClass(v7);
  uint64_t v9 = [a3 domain];
  int v10 = 138413314;
  uint64_t v11 = a1;
  __int16 v12 = 2114;
  uint64_t v13 = v8;
  __int16 v14 = 2114;
  uint64_t v15 = v9;
  __int16 v16 = 2048;
  id v17 = [a3 code];
  __int16 v18 = 2112;
  uint64_t v19 = a3;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Failed to get filetype for URL (%@): errorClass=%{public}@, domain=%{public}@, code=%zd (%@) ", (uint8_t *)&v10, 0x34u);
}

void sub_10005B7B0(void *a1, int a2)
{
  os_log_t v3 = a1;
  id v4 = +[CRLAssertionHandler packedBacktraceString];
  v5[0] = 67109378;
  v5[1] = a2;
  __int16 v6 = 2114;
  uint64_t v7 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", (uint8_t *)v5, 0x12u);
}

void sub_10005B874(int a1, NSObject *a2)
{
  v2[0] = 67110146;
  v2[1] = a1;
  __int16 v3 = 2082;
  id v4 = "+[UIDevice(CRLAdditions) crl_platformString]_block_invoke";
  __int16 v5 = 2082;
  __int16 v6 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/UIDevice_CRLAdditions.m";
  __int16 v7 = 1024;
  int v8 = 46;
  __int16 v9 = 2082;
  int v10 = "s_platformString";
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", (uint8_t *)v2, 0x2Cu);
}

void sub_10005B930()
{
  sub_10000F254();
  sub_10000F234();
  sub_10000B0EC();
  sub_10000F244();
  sub_10000F264((void *)&_mh_execute_header, v0, v1, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d expected inequality between %{public}s and %{public}s", v2, v3, v4, v5, v6);
}

void sub_10005B9D0()
{
  sub_10000F254();
  sub_10000F234();
  sub_10000B0EC();
  sub_10000F244();
  sub_10000F264((void *)&_mh_execute_header, v0, v1, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d expected inequality between %{public}s and %{public}s", v2, v3, v4, v5, v6);
}

void sub_10005BA70()
{
  sub_10000F254();
  sub_10000F234();
  sub_10000B0EC();
  sub_10000F244();
  sub_10000F264((void *)&_mh_execute_header, v0, v1, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d expected inequality between %{public}s and %{public}s", v2, v3, v4, v5, v6);
}

void sub_10005BB10()
{
  sub_10001113C();
  sub_10000B124();
  sub_100011160();
  sub_10001114C();
  sub_10000B0FC((void *)&_mh_execute_header, v0, v1, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d New device size not handled (%f). Defaulting to CRLUIScreenClassPhoneUILarge.", v2, v3, v4, v5, 2u);
}

void sub_10005BB9C()
{
  sub_10001113C();
  sub_10000B124();
  sub_100011160();
  sub_10001114C();
  sub_10000B0FC((void *)&_mh_execute_header, v0, v1, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d New device size not handled (%f). Defaulting to CRLUIScreenClassPhoneUIRegular.", v2, v3, v4, v5, 2u);
}

void sub_10005BC28()
{
  sub_10001113C();
  sub_10000B124();
  sub_100011160();
  sub_10001114C();
  sub_10000B0FC((void *)&_mh_execute_header, v0, v1, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d New device size not handled (%f). Defaulting to CRLUIScreenClassPhoneUIRegularPlus.", v2, v3, v4, v5, 2u);
}

void sub_10005BCB4()
{
  sub_10001113C();
  sub_10000B124();
  sub_100011160();
  sub_10001114C();
  sub_10000B0FC((void *)&_mh_execute_header, v0, v1, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d New device size not handled (%f). Defaulting to CRLUIScreenClassPhoneUIRegularZoom.", v2, v3, v4, v5, 2u);
}

void sub_10005BD40()
{
  sub_10001113C();
  sub_10000B124();
  sub_100011160();
  sub_10001114C();
  sub_10000B0FC((void *)&_mh_execute_header, v0, v1, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d New device size not handled (%f). Defaulting to CRLUIScreenClassPhoneUISmall.", v2, v3, v4, v5, 2u);
}

void sub_10005BDCC()
{
  int v1 = 67109890;
  sub_10001113C();
  uint64_t v2 = "+[UIScreen(CRLAdditions) crl_resetScreenScaleCache]";
  sub_100011170();
  int v3 = 327;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d No one should look at the screen scale before the application has finished launching, because the value isn't ready yet and may change! To debug, break in UIScreen.crl_screenScale and re-launch the app.", (uint8_t *)&v1, 0x22u);
}

void sub_10005BE64()
{
  int v1 = 67109890;
  sub_10001113C();
  uint64_t v2 = "+[UIScreen(CRLAdditions) crl_is3xScreenScale]";
  sub_100011170();
  int v3 = 347;
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Unsupported screen scale.", (uint8_t *)&v1, 0x22u);
}

void sub_10005BEFC(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#Assert *** Ignored previous assertion failure ***", v1, 2u);
}

void sub_10005BF40(void *a1)
{
  int v1 = a1;
  uint64_t v2 = +[CRLAssertionHandler packedBacktraceString];
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "#Assert Assertion backtrace: >>%{public}@<<", (uint8_t *)&v3, 0xCu);
}

void sub_10005BFEC(void *a1, uint64_t a2)
{
  int v3 = a1;
  int v4 = 134218242;
  intptr_t v5 = CRLDynamicBaseAddress();
  __int16 v6 = 2114;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert Assertion backtrace. Load address 0x%0llx, Backtrace:\n%{public}@", (uint8_t *)&v4, 0x16u);
}

uint64_t sub_10005C090()
{
  return static CharacterSet.whitespacesAndNewlines.getter();
}

uint64_t sub_10005C0A0()
{
  return static CharacterSet.newlines.getter();
}

uint64_t sub_10005C0B0()
{
  return type metadata accessor for CharacterSet();
}

uint64_t sub_10005C0C0()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10005C0D0()
{
  return Notification.userInfo.getter();
}

uint64_t sub_10005C0E0()
{
  return type metadata accessor for Notification();
}

uint64_t sub_10005C0F0()
{
  return LocalizedError.helpAnchor.getter();
}

uint64_t sub_10005C100()
{
  return LocalizedError.failureReason.getter();
}

uint64_t sub_10005C110()
{
  return type metadata accessor for AttributedString();
}

uint64_t sub_10005C120()
{
  return AttributedString.init(_:)();
}

uint64_t sub_10005C130(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_10005C140()
{
  return URLResourceValues.contentType.getter();
}

uint64_t sub_10005C150()
{
  return type metadata accessor for URLResourceValues();
}

uint64_t sub_10005C160()
{
  return dispatch thunk of PropertyListDecoder.decode<A>(_:from:)();
}

uint64_t sub_10005C170()
{
  return PropertyListDecoder.init()();
}

uint64_t sub_10005C180()
{
  return type metadata accessor for PropertyListDecoder();
}

uint64_t sub_10005C190()
{
  return dispatch thunk of PropertyListEncoder.outputFormat.setter();
}

uint64_t sub_10005C1A0()
{
  return dispatch thunk of PropertyListEncoder.encode<A>(_:)();
}

uint64_t sub_10005C1B0()
{
  return PropertyListEncoder.init()();
}

uint64_t sub_10005C1C0()
{
  return type metadata accessor for PropertyListEncoder();
}

uint64_t sub_10005C1D0()
{
  return dispatch thunk of NSKeyValueObservation.invalidate()();
}

uint64_t sub_10005C1E0()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_10005C1F0()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_10005C200()
{
  return _KeyValueCodingAndObserving.observe<A>(_:options:changeHandler:)();
}

uint64_t sub_10005C210()
{
  return URL.isFileURL.getter();
}

uint64_t sub_10005C220()
{
  return URL.relativePath.getter();
}

uint64_t sub_10005C230()
{
  return type metadata accessor for URL.DirectoryHint();
}

uint64_t sub_10005C240()
{
  return URL.absoluteString.getter();
}

uint64_t sub_10005C250()
{
  return URL.resourceValues(forKeys:)();
}

uint64_t sub_10005C260()
{
  return URL.lastPathComponent.getter();
}

void sub_10005C270(NSURL *retstr@<X8>)
{
}

uint64_t sub_10005C280()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t sub_10005C290()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10005C2A0(Swift::Bool percentEncoded)
{
  return URL.path(percentEncoded:)(percentEncoded)._countAndFlagsBits;
}

uint64_t sub_10005C2B0()
{
  return URL.path.getter();
}

uint64_t sub_10005C2C0()
{
  return URL.scheme.getter();
}

uint64_t sub_10005C2D0()
{
  return URL.init(string:encodingInvalidCharacters:)();
}

uint64_t sub_10005C2E0()
{
  return URL.appending<A>(path:directoryHint:)();
}

uint64_t sub_10005C2F0()
{
  return URL.appending<A>(component:directoryHint:)();
}

uint64_t sub_10005C300()
{
  return type metadata accessor for URL();
}

uint64_t sub_10005C310()
{
  return Data.init(contentsOf:options:)();
}

NSData sub_10005C320()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_10005C330()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10005C340()
{
  return Data.write(to:options:)();
}

NSDate sub_10005C350()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_10005C360()
{
  return static Date.now.getter();
}

uint64_t sub_10005C370()
{
  return Date.compare(_:)();
}

uint64_t sub_10005C380()
{
  return Date.init()();
}

uint64_t sub_10005C390()
{
  return type metadata accessor for Date();
}

uint64_t sub_10005C3A0()
{
  return UUID.uuidString.getter();
}

uint64_t sub_10005C3B0()
{
  return static UUID.== infix(_:_:)();
}

uint64_t sub_10005C3C0()
{
  return UUID.init()();
}

uint64_t sub_10005C3D0()
{
  return type metadata accessor for UUID();
}

uint64_t sub_10005C3E0()
{
  return type metadata accessor for Locale();
}

uint64_t sub_10005C3F0()
{
  return Calendar.date(byAdding:value:to:wrappingComponents:)();
}

uint64_t sub_10005C400()
{
  return static Calendar.current.getter();
}

uint64_t sub_10005C410()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t sub_10005C420()
{
  return type metadata accessor for Calendar();
}

NSIndexPath sub_10005C430()
{
  return IndexPath._bridgeToObjectiveC()();
}

uint64_t sub_10005C440()
{
  return static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10005C450()
{
  return IndexPath.item.getter();
}

uint64_t sub_10005C460()
{
  return type metadata accessor for IndexPath();
}

uint64_t sub_10005C470()
{
  return UTType.identifier.getter();
}

uint64_t sub_10005C480()
{
  return static UTType.audiovisualContent.getter();
}

uint64_t sub_10005C490()
{
  return UTType.localizedDescription.getter();
}

uint64_t sub_10005C4A0()
{
  return UTType.preferredFilenameExtension.getter();
}

uint64_t sub_10005C4B0()
{
  return static UTType._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10005C4C0()
{
  return static UTType.png.getter();
}

uint64_t sub_10005C4D0()
{
  return static UTType.jpeg.getter();
}

uint64_t sub_10005C4E0()
{
  return static UTType.text.getter();
}

uint64_t sub_10005C4F0()
{
  return static UTType.image.getter();
}

uint64_t sub_10005C500()
{
  return UTType.conforms(to:)();
}

uint64_t sub_10005C510()
{
  return type metadata accessor for UTType();
}

uint64_t sub_10005C520()
{
  return os_log(_:dso:log:type:_:)();
}

uint64_t sub_10005C530()
{
  return type metadata accessor for UICellAccessory.DisplayedState();
}

uint64_t sub_10005C540()
{
  return type metadata accessor for UICellAccessory.LayoutDimension();
}

uint64_t sub_10005C550()
{
  return static UICellAccessory.disclosureIndicator(displayed:options:)();
}

uint64_t sub_10005C560()
{
  return UICellAccessory.DisclosureIndicatorOptions.init(isHidden:reservedLayoutWidth:tintColor:)();
}

uint64_t sub_10005C570()
{
  return type metadata accessor for UICellAccessory.DisclosureIndicatorOptions();
}

uint64_t sub_10005C580()
{
  return type metadata accessor for UICellAccessory();
}

uint64_t sub_10005C590()
{
  return type metadata accessor for UITraitVerticalSizeClass();
}

uint64_t sub_10005C5A0()
{
  return UIListContentConfiguration.secondaryText.setter();
}

uint64_t sub_10005C5B0()
{
  return UIListContentConfiguration.TextProperties.showsExpansionTextWhenTruncated.setter();
}

uint64_t sub_10005C5C0()
{
  return UIListContentConfiguration.TextProperties.numberOfLines.setter();
}

uint64_t sub_10005C5D0()
{
  return UIListContentConfiguration.TextProperties.font.setter();
}

uint64_t sub_10005C5E0()
{
  return UIListContentConfiguration.TextProperties.color.setter();
}

uint64_t sub_10005C5F0()
{
  return UIListContentConfiguration.textProperties.modify();
}

uint64_t sub_10005C600()
{
  return UIListContentConfiguration.ImageProperties.preferredSymbolConfiguration.setter();
}

uint64_t sub_10005C610()
{
  return UIListContentConfiguration.ImageProperties.tintColor.setter();
}

uint64_t sub_10005C620()
{
  return UIListContentConfiguration.imageProperties.modify();
}

uint64_t sub_10005C630()
{
  return UIListContentConfiguration.secondaryTextProperties.modify();
}

uint64_t sub_10005C640()
{
  return UIListContentConfiguration.text.setter();
}

uint64_t sub_10005C650()
{
  return UIListContentConfiguration.image.setter();
}

uint64_t sub_10005C660()
{
  return type metadata accessor for UIListContentConfiguration();
}

uint64_t sub_10005C670()
{
  return type metadata accessor for UITraitHorizontalSizeClass();
}

uint64_t sub_10005C680()
{
  return NSDiffableDataSourceSnapshot.appendItems(_:toSection:)();
}

void sub_10005C690(Swift::OpaquePointer a1)
{
}

uint64_t sub_10005C6A0()
{
  return NSDiffableDataSourceSnapshot.init()();
}

uint64_t sub_10005C6B0()
{
  return UICollectionViewDiffableDataSource.init(collectionView:cellProvider:)();
}

uint64_t sub_10005C6C0()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.supplementaryViewProvider.setter();
}

uint64_t sub_10005C6D0()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.applySnapshotUsingReloadData(_:completion:)();
}

uint64_t sub_10005C6E0()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.itemIdentifier(for:)();
}

uint64_t sub_10005C6F0()
{
  return dispatch thunk of UICollectionViewDiffableDataSource.apply(_:animatingDifferences:completion:)();
}

uint64_t sub_10005C700()
{
  return type metadata accessor for UICollectionLayoutListConfiguration.Appearance();
}

uint64_t sub_10005C710()
{
  return type metadata accessor for UICollectionLayoutListConfiguration.HeaderMode();
}

uint64_t sub_10005C720()
{
  return UICollectionLayoutListConfiguration.init(appearance:)();
}

uint64_t sub_10005C730()
{
  return UICollectionLayoutListConfiguration.headerMode.setter();
}

uint64_t sub_10005C740()
{
  return UICollectionLayoutListConfiguration.showsSeparators.setter();
}

uint64_t sub_10005C750()
{
  return type metadata accessor for UICollectionLayoutListConfiguration();
}

uint64_t sub_10005C760()
{
  return type metadata accessor for UITraitPreferredContentSizeCategory();
}

uint64_t sub_10005C770()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_10005C780()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_10005C790()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_10005C7A0()
{
  return dispatch thunk of Hashable.hash(into:)();
}

uint64_t sub_10005C7B0()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t sub_10005C7C0()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_10005C7D0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10005C7E0()
{
  return static String.localizedStringWithFormat(_:_:)();
}

uint64_t sub_10005C7F0()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_10005C800()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_10005C810()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10005C820()
{
  return String.init<A>(describing:)();
}

uint64_t sub_10005C830()
{
  return String.init<A>(reflecting:)();
}

void sub_10005C840(Swift::Int a1)
{
}

uint64_t sub_10005C850()
{
  return String.hash(into:)();
}

uint64_t sub_10005C860()
{
  return String.count.getter();
}

uint64_t sub_10005C870()
{
  return String.append<A>(contentsOf:)();
}

void sub_10005C880(Swift::String a1)
{
}

Swift::Int sub_10005C890()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_10005C8A0()
{
  return String.UTF8View._foreignIndex(_:offsetBy:)();
}

uint64_t sub_10005C8B0()
{
  return String.UTF8View._foreignDistance(from:to:)();
}

uint64_t sub_10005C8C0()
{
  return String.UTF16View.index(_:offsetBy:)();
}

uint64_t sub_10005C8D0()
{
  return String.subscript.getter();
}

uint64_t sub_10005C8E0()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_10005C8F0()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_10005C900()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10005C910()
{
  return specialized Array._endMutation()();
}

uint64_t sub_10005C920()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_10005C930()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_10005C940()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_10005C950()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_10005C960()
{
  return static MainActor.shared.getter();
}

uint64_t sub_10005C970()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_10005C980()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_10005C990()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_10005C9A0()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_10005C9B0()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_10005C9C0()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10005C9D0()
{
  return UICollectionView.CellRegistration.init(handler:)();
}

uint64_t sub_10005C9E0()
{
  return UICollectionView.SupplementaryRegistration.init(elementKind:handler:)();
}

uint64_t sub_10005C9F0()
{
  return UICollectionView.dequeueConfiguredReusableCell<A, B>(using:for:item:)();
}

uint64_t sub_10005CA00()
{
  return UICollectionView.dequeueConfiguredReusableSupplementary<A>(using:for:)();
}

uint64_t sub_10005CA10()
{
  return UIViewController.registerForTraitChanges(_:target:action:)();
}

uint64_t sub_10005CA20()
{
  return UIViewController.registerForTraitChanges<A>(_:handler:)();
}

uint64_t sub_10005CA30()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_10005CA40()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_10005CA50()
{
  return UICollectionViewCell.contentConfiguration.setter();
}

uint64_t sub_10005CA60()
{
  return static UIContentSizeCategory.< infix(_:_:)();
}

uint64_t sub_10005CA70()
{
  return UICollectionViewListCell.accessories.setter();
}

uint64_t sub_10005CA80()
{
  return UICollectionViewListCell.defaultContentConfiguration()();
}

uint64_t sub_10005CA90()
{
  return static UICollectionViewCompositionalLayout.list(using:)();
}

uint64_t sub_10005CAA0()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_10005CAB0()
{
  return type metadata accessor for Optional();
}

uint64_t sub_10005CAC0()
{
  return Substring.init<A>(_:)();
}

uint64_t sub_10005CAD0()
{
  return StringProtocol.rangeOfCharacter(from:options:range:)();
}

uint64_t sub_10005CAE0()
{
  return StringProtocol.trimmingCharacters(in:)();
}

uint64_t sub_10005CAF0()
{
  return StringProtocol.caseInsensitiveCompare<A>(_:)();
}

uint64_t sub_10005CB00()
{
  return StringProtocol.localizedCaseInsensitiveCompare<A>(_:)();
}

uint64_t sub_10005CB10()
{
  return StringProtocol.compare<A>(_:options:range:locale:)();
}

uint64_t sub_10005CB20()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_10005CB30()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

Swift::Int sub_10005CB40(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_10005CB50()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_10005CB60()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_10005CB70()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_10005CB80()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_10005CB90()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_10005CBA0(Swift::Int a1)
{
}

uint64_t sub_10005CBB0()
{
  return dispatch thunk of _AnyIndexBox._typeID.getter();
}

uint64_t sub_10005CBC0()
{
  return dispatch thunk of _AnyIndexBox._isEqual(to:)();
}

void sub_10005CBD0(Swift::Int a1)
{
}

uint64_t sub_10005CBE0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_10005CBF0()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_10005CC00()
{
  return DecodingError.Context.init(codingPath:debugDescription:underlyingError:)();
}

uint64_t sub_10005CC10()
{
  return type metadata accessor for DecodingError();
}

uint64_t sub_10005CC20()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_10005CC30()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_10005CC40()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_10005CC50()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_10005CC60()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_10005CC70()
{
  return _print_unlocked<A, B>(_:_:)();
}

uint64_t sub_10005CC80()
{
  return dispatch thunk of _AnyCollectionBox.subscript.getter();
}

uint64_t sub_10005CC90()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10005CCA0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_10005CCB0()
{
  return _CocoaArrayWrapper.subscript.getter();
}

uint64_t sub_10005CCD0()
{
  return KeyedDecodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_10005CCE0()
{
  return KeyedDecodingContainer.codingPath.getter();
}

uint64_t sub_10005CCF0()
{
  return KeyedDecodingContainer.decodeIfPresent(_:forKey:)();
}

uint64_t sub_10005CD00()
{
  return KeyedDecodingContainer.decodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_10005CD10()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_10005CD20()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_10005CD30()
{
  return KeyedDecodingContainer.decode<A>(_:forKey:)();
}

uint64_t sub_10005CD40()
{
  return KeyedDecodingContainer.allKeys.getter();
}

uint64_t sub_10005CD50()
{
  return KeyedEncodingContainer.nestedContainer<A>(keyedBy:forKey:)();
}

uint64_t sub_10005CD60()
{
  return KeyedEncodingContainer.encodeIfPresent(_:forKey:)();
}

uint64_t sub_10005CD70()
{
  return KeyedEncodingContainer.encodeIfPresent<A>(_:forKey:)();
}

uint64_t sub_10005CD80()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_10005CD90()
{
  return KeyedEncodingContainer.encode(_:forKey:)();
}

uint64_t sub_10005CDA0()
{
  return KeyedEncodingContainer.encode<A>(_:forKey:)();
}

Swift::Int sub_10005CDB0(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_10005CDC0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_10005CDD0()
{
  return _getErrorEmbeddedNSError<A>(_:)();
}

uint64_t sub_10005CDE0()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_10005CDF0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10005CE00()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_10005CE10()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_10005CE20()
{
  return Error._code.getter();
}

uint64_t sub_10005CE30()
{
  return Error._domain.getter();
}

uint64_t sub_10005CE40()
{
  return Error._userInfo.getter();
}

uint64_t sub_10005CE50()
{
  return Hasher.init(_seed:)();
}

void sub_10005CE60(Swift::UInt a1)
{
}

Swift::Int sub_10005CE70()
{
  return Hasher._finalize()();
}

uint64_t sub_10005CE80()
{
  return Mirror.init(reflecting:)();
}

uint64_t sub_10005CE90()
{
  return static Mirror.DisplayStyle.== infix(_:_:)();
}

uint64_t sub_10005CEA0()
{
  return type metadata accessor for Mirror.DisplayStyle();
}

uint64_t sub_10005CEB0()
{
  return Mirror.displayStyle.getter();
}

uint64_t sub_10005CEC0()
{
  return Mirror.children.getter();
}

uint64_t sub_10005CED0()
{
  return type metadata accessor for Mirror();
}

uint64_t sub_10005CEE0()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t sub_10005CEF0()
{
  return dispatch thunk of Encoder.container<A>(keyedBy:)();
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return _CFLocaleCopyCurrent();
}

void CFRelease(CFTypeRef cf)
{
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return _CFStringGetCharactersPtr(theString);
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return _CFStringTokenizerAdvanceToNextToken(tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return _CFStringTokenizerCreate(alloc, string, range, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFRange CurrentTokenRange = _CFStringTokenizerGetCurrentTokenRange(tokenizer);
  CFIndex length = CurrentTokenRange.length;
  CFIndex location = CurrentTokenRange.location;
  result.CFIndex length = length;
  result.CFIndex location = location;
  return result;
}

CFStringTokenizerTokenType CFStringTokenizerGoToTokenAtIndex(CFStringTokenizerRef tokenizer, CFIndex index)
{
  return _CFStringTokenizerGoToTokenAtIndex(tokenizer, index);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return _CFUUIDCreate(alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return _CFUUIDCreateString(alloc, uuid);
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return _CGImageGetAlphaInfo(image);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return _CGImageSourceCreateWithURL(url, options);
}

size_t CGImageSourceGetCount(CGImageSourceRef isrc)
{
  return _CGImageSourceGetCount(isrc);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  return _CGRectApplyAffineTransform(rect, t);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  return _CGRectUnion(r1, r2);
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return _CMFormatDescriptionGetMediaSubType(desc);
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return _CMTimeMake(retstr, value, timescale);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void NSZoneFree(NSZone *zone, void *ptr)
{
}

void *__cdecl NSZoneMalloc(NSZone *zone, NSUInteger size)
{
  return _NSZoneMalloc(zone, size);
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return _UIImageJPEGRepresentation(image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

int _NSGetExecutablePath(char *buf, uint32_t *bufsize)
{
  return __NSGetExecutablePath(buf, bufsize);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return ___maskrune(a1, a2);
}

const char *__cdecl _dyld_get_image_name(uint32_t image_index)
{
  return __dyld_get_image_name(image_index);
}

intptr_t _dyld_get_image_vmaddr_slide(uint32_t image_index)
{
  return __dyld_get_image_vmaddr_slide(image_index);
}

uint32_t _dyld_image_count(void)
{
  return __dyld_image_count();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void abort(void)
{
}

int asprintf(char **a1, const char *a2, ...)
{
  return _asprintf(a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return _close(a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

int dladdr(const void *a1, Dl_info *a2)
{
  return _dladdr(a1, a2);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

char *__cdecl ether_ntoa(const ether_addr *a1)
{
  return _ether_ntoa(a1);
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return _getpid();
}

const section_64 *__cdecl getsectbyname(const char *segname, const char *sectname)
{
  return _getsectbyname(segname, sectname);
}

uint8_t *__cdecl getsegmentdata(const mach_header_64 *mhp, const char *segname, unint64_t *size)
{
  return _getsegmentdata(mhp, segname, size);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return _ioctl(a1, a2);
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return _realpath_DARWIN_EXTSN(a1, a2);
}

int socket(int a1, int a2, int a3)
{
  return _socket(a1, a2, a3);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return _sscanf(a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastMetatype()
{
  return _swift_dynamicCastMetatype();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getDynamicType()
{
  return _swift_getDynamicType();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getMetatypeMetadata()
{
  return _swift_getMetatypeMetadata();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTupleTypeLayout()
{
  return _swift_getTupleTypeLayout();
}

uint64_t swift_getTupleTypeLayout3()
{
  return _swift_getTupleTypeLayout3();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return [a1 URLByAppendingPathComponent:];
}

id objc_msgSend_URLByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return [a1 URLByAppendingPathExtension:];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__atomicIncrementAssertCount(void *a1, const char *a2, ...)
{
  return _[a1 _atomicIncrementAssertCount];
}

id objc_msgSend_addCharactersInString_(void *a1, const char *a2, ...)
{
  return [a1 addCharactersInString:];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_appendBytes_length_(void *a1, const char *a2, ...)
{
  return [a1 appendBytes:length:];
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return [a1 appendData:];
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return [a1 appendFormat:];
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return [a1 appendString:];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:count:];
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 base64EncodedStringWithOptions:];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_callStackReturnAddresses(void *a1, const char *a2, ...)
{
  return _[a1 callStackReturnAddresses];
}

id objc_msgSend_canBeConvertedToEncoding_(void *a1, const char *a2, ...)
{
  return [a1 canBeConvertedToEncoding:];
}

id objc_msgSend_caseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return [a1 caseInsensitiveCompare:];
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 characterAtIndex:];
}

id objc_msgSend_characterIsMember_(void *a1, const char *a2, ...)
{
  return [a1 characterIsMember:];
}

id objc_msgSend_characterSetWithCharactersInString_(void *a1, const char *a2, ...)
{
  return [a1 characterSetWithCharactersInString:];
}

id objc_msgSend_characterSetWithRange_(void *a1, const char *a2, ...)
{
  return [a1 characterSetWithRange:];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return [a1 componentsJoinedByString:];
}

id objc_msgSend_componentsSeparatedByCharactersInSet_(void *a1, const char *a2, ...)
{
  return [a1 componentsSeparatedByCharactersInSet:];
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return [a1 componentsSeparatedByString:];
}

id objc_msgSend_conformsToType_(void *a1, const char *a2, ...)
{
  return [a1 conformsToType:];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return [a1 containsObject:];
}

id objc_msgSend_coordinateReadingItemAtURL_options_error_byAccessor_(void *a1, const char *a2, ...)
{
  return [a1 coordinateReadingItemAtURL:options:error:byAccessor:];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return [a1 copyItemAtURL:toURL:error:];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return [a1 countByEnumeratingWithState:objects:count:];
}

id objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return [a1 createDirectoryAtURL:withIntermediateDirectories:attributes:error:];
}

id objc_msgSend_createFileAtPath_contents_attributes_(void *a1, const char *a2, ...)
{
  return [a1 createFileAtPath:contents:attributes:];
}

id objc_msgSend_crl_appendJSONStringToString_(void *a1, const char *a2, ...)
{
  return [a1 crl_appendJSONStringToString:];
}

id objc_msgSend_crl_compressWithAlgorithm_operation_(void *a1, const char *a2, ...)
{
  return [a1 crl_compressWithAlgorithm:operation:];
}

id objc_msgSend_crl_countInstancesOfString_options_(void *a1, const char *a2, ...)
{
  return [a1 crl_countInstancesOfString:options:];
}

id objc_msgSend_crl_creatorArtistOrAuthorWithMetadataArray_(void *a1, const char *a2, ...)
{
  return [a1 crl_creatorArtistOrAuthorWithMetadataArray:];
}

id objc_msgSend_crl_filenameTruncatedToCharacterLimit_(void *a1, const char *a2, ...)
{
  return [a1 crl_filenameTruncatedToCharacterLimit:];
}

id objc_msgSend_crl_firstTrackWithMediaType_(void *a1, const char *a2, ...)
{
  return [a1 crl_firstTrackWithMediaType:];
}

id objc_msgSend_crl_initRedactedWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_initRedactedWithFormat:arguments:");
}

id objc_msgSend_crl_initUnRedactedWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return [a1 crl_initUnRedactedWithFormat:arguments:];
}

id objc_msgSend_crl_isCJKString(void *a1, const char *a2, ...)
{
  return [a1 crl_isCJKString];
}

id objc_msgSend_crl_padUI(void *a1, const char *a2, ...)
{
  return [a1 crl_padUI];
}

id objc_msgSend_crl_parseBaseTitleWithLocalizedCopyString_firstCopyFormatString_generalCopyFormatString_outNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_parseBaseTitleWithLocalizedCopyString:firstCopyFormatString:generalCopyFormatString:outNumber:");
}

id objc_msgSend_crl_phoneUI(void *a1, const char *a2, ...)
{
  return [a1 crl_phoneUI];
}

id objc_msgSend_crl_phoneUI667H(void *a1, const char *a2, ...)
{
  return [a1 crl_phoneUI667H];
}

id objc_msgSend_crl_phoneUI667HOrSmaller(void *a1, const char *a2, ...)
{
  return [a1 crl_phoneUI667HOrSmaller];
}

id objc_msgSend_crl_platformString(void *a1, const char *a2, ...)
{
  return [a1 crl_platformString];
}

id objc_msgSend_crl_playableKeysWithKeys_(void *a1, const char *a2, ...)
{
  return [a1 crl_playableKeysWithKeys:];
}

id objc_msgSend_crl_regexForTitleParsingWithLocalizedCopyString_isFirstCopyFormatString_(void *a1, const char *a2, ...)
{
  return [a1 crl_regexForTitleParsingWithLocalizedCopyString:isFirstCopyFormatString:];
}

id objc_msgSend_crl_screenClass(void *a1, const char *a2, ...)
{
  return [a1 crl_screenClass];
}

id objc_msgSend_crl_screenScale(void *a1, const char *a2, ...)
{
  return [a1 crl_screenScale];
}

id objc_msgSend_crl_stringByApplyingSubstitutions_(void *a1, const char *a2, ...)
{
  return [a1 crl_stringByApplyingSubstitutions:];
}

id objc_msgSend_crl_stringByIncrementingCounterAfterDuplicateTitleModifierWithLocalizedCopyString_firstCopyFormatString_generalCopyFormatString_numberFormatter_uniquenessTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "crl_stringByIncrementingCounterAfterDuplicateTitleModifierWithLocalizedCopyString:firstCopyFormatString:generalCopyFormatString:numberFormatter:uniquenessTest:");
}

id objc_msgSend_crl_stringByRemovingCharactersInSet_(void *a1, const char *a2, ...)
{
  return [a1 crl_stringByRemovingCharactersInSet:];
}

id objc_msgSend_crl_stringByReplacingInstancesOfCharactersInSet_withString_(void *a1, const char *a2, ...)
{
  return [a1 crl_stringByReplacingInstancesOfCharactersInSet:withString:];
}

id objc_msgSend_crl_stringWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return [a1 crl_stringWithFormat:arguments:];
}

id objc_msgSend_crl_stringWithNormalizedHyphens(void *a1, const char *a2, ...)
{
  return [a1 crl_stringWithNormalizedHyphens];
}

id objc_msgSend_crl_stringWithNormalizedQuotationMarks(void *a1, const char *a2, ...)
{
  return [a1 crl_stringWithNormalizedQuotationMarks];
}

id objc_msgSend_crl_stringWithPathRelativeTo_(void *a1, const char *a2, ...)
{
  return [a1 crl_stringWithPathRelativeTo:];
}

id objc_msgSend_crl_titleWithMetadataArray_(void *a1, const char *a2, ...)
{
  return [a1 crl_titleWithMetadataArray:];
}

id objc_msgSend_crl_tolerantStringByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return [a1 crl_tolerantStringByAppendingPathExtension:];
}

id objc_msgSend_crl_uncommentedAddress(void *a1, const char *a2, ...)
{
  return [a1 crl_uncommentedAddress];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentDevice];
}

id objc_msgSend_currentTraitCollection(void *a1, const char *a2, ...)
{
  return _[a1 currentTraitCollection];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultImageFileName(void *a1, const char *a2, ...)
{
  return _[a1 defaultImageFileName];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_dictionaryWithSharedKeySet_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithSharedKeySet];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateKeysAndObjectsUsingBlock:];
}

id objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:");
}

id objc_msgSend_escapedPatternForString_(void *a1, const char *a2, ...)
{
  return [a1 escapedPatternForString:];
}

id objc_msgSend_familyName(void *a1, const char *a2, ...)
{
  return _[a1 familyName];
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return [a1 fileExistsAtPath:];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 fileSystemRepresentation];
}

id objc_msgSend_firstMatchInString_options_range_(void *a1, const char *a2, ...)
{
  return [a1 firstMatchInString:options:range:];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_formUnionWithCharacterSet_(void *a1, const char *a2, ...)
{
  return [a1 formUnionWithCharacterSet:];
}

id objc_msgSend_formatDescriptions(void *a1, const char *a2, ...)
{
  return _[a1 formatDescriptions];
}

id objc_msgSend_getCharacters_(void *a1, const char *a2, ...)
{
  return [a1 getCharacters:];
}

id objc_msgSend_getCharacters_range_(void *a1, const char *a2, ...)
{
  return [a1 getCharacters:range:];
}

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return [a1 getResourceValue:forKey:error:];
}

id objc_msgSend_getUUIDBytes_(void *a1, const char *a2, ...)
{
  return [a1 getUUIDBytes:];
}

id objc_msgSend_givenName(void *a1, const char *a2, ...)
{
  return _[a1 givenName];
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_isFatal_description_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:isFatal:description:");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_isFatal_format_args_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:isFatal:format:args:");
}

id objc_msgSend_hasItemConformingToTypeIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 hasItemConformingToTypeIdentifier:];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return [a1 hasPrefix:];
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return [a1 hasSuffix:];
}

id objc_msgSend_horizontalSizeClass(void *a1, const char *a2, ...)
{
  return _[a1 horizontalSizeClass];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return [a1 initWithArray:];
}

id objc_msgSend_initWithBytesNoCopy_length_encoding_freeWhenDone_(void *a1, const char *a2, ...)
{
  return [a1 initWithBytesNoCopy:length:encoding:freeWhenDone:];
}

id objc_msgSend_initWithCharacters_length_(void *a1, const char *a2, ...)
{
  return [a1 initWithCharacters:length:];
}

id objc_msgSend_initWithFilePresenter_(void *a1, const char *a2, ...)
{
  return [a1 initWithFilePresenter:];
}

id objc_msgSend_initWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return [a1 initWithFormat:arguments:];
}

id objc_msgSend_initWithPattern_options_error_(void *a1, const char *a2, ...)
{
  return [a1 initWithPattern:options:error:];
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return [a1 initWithString:];
}

id objc_msgSend_initWithUTF8String_(void *a1, const char *a2, ...)
{
  return [a1 initWithUTF8String:];
}

id objc_msgSend_initWithUUIDBytes_(void *a1, const char *a2, ...)
{
  return [a1 initWithUUIDBytes:];
}

id objc_msgSend_insertString_atIndex_(void *a1, const char *a2, ...)
{
  return [a1 insertString:atIndex:];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_invertedSet(void *a1, const char *a2, ...)
{
  return _[a1 invertedSet];
}

id objc_msgSend_isAtEnd(void *a1, const char *a2, ...)
{
  return _[a1 isAtEnd];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isEnabled];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isFileURL(void *a1, const char *a2, ...)
{
  return _[a1 isFileURL];
}

id objc_msgSend_isQAFatalAssertionsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isQAFatalAssertionsEnabled];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_lastThrottleCheck(void *a1, const char *a2, ...)
{
  return _[a1 lastThrottleCheck];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_loadFileRepresentationForContentType_openInPlace_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 loadFileRepresentationForContentType:openInPlace:completionHandler:];
}

id objc_msgSend_loadItemForTypeIdentifier_options_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 loadItemForTypeIdentifier:options:completionHandler:];
}

id objc_msgSend_loadValuesAsynchronouslyForKeys_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 loadValuesAsynchronouslyForKeys:completionHandler:];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringForKey:value:table:];
}

id objc_msgSend_localizedStringFromPersonNameComponents_style_options_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringFromPersonNameComponents:style:options:];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return _[a1 lowercaseString];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return _[a1 metadata];
}

id objc_msgSend_metadataItemsFromArray_filteredByIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 metadataItemsFromArray:filteredByIdentifier:];
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return _[a1 model];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_mutableCopyWithZone_(void *a1, const char *a2, ...)
{
  return [a1 mutableCopyWithZone:];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_nativeScale(void *a1, const char *a2, ...)
{
  return _[a1 nativeScale];
}

id objc_msgSend_naturalSize(void *a1, const char *a2, ...)
{
  return _[a1 naturalSize];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return [a1 numberWithBool:];
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInt:];
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInteger:];
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInt:];
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInteger:];
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndexedSubscript:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_objectWithItemProviderData_typeIdentifier_error_(void *a1, const char *a2, ...)
{
  return [a1 objectWithItemProviderData:typeIdentifier:error:];
}

id objc_msgSend_p_crl_uncachedScreenClass(void *a1, const char *a2, ...)
{
  return [a1 p_crl_uncachedScreenClass];
}

id objc_msgSend_p_file_conformsTo_(void *a1, const char *a2, ...)
{
  return [a1 p_file:conformsTo:];
}

id objc_msgSend_p_logItemProviderError_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "p_logItemProviderError:error:");
}

id objc_msgSend_p_makeEmptyStringCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 p_makeEmptyStringCharacterSet];
}

id objc_msgSend_p_performBlockIgnoringAssertions_onlyFatal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "p_performBlockIgnoringAssertions:onlyFatal:");
}

id objc_msgSend_p_stringIsConsideredEmpty_(void *a1, const char *a2, ...)
{
  return [a1 p_stringIsConsideredEmpty:];
}

id objc_msgSend_packedBacktraceString(void *a1, const char *a2, ...)
{
  return _[a1 packedBacktraceString];
}

id objc_msgSend_packedBacktraceStringWithReturnAddresses_(void *a1, const char *a2, ...)
{
  return [a1 packedBacktraceStringWithReturnAddresses:];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pathComponents(void *a1, const char *a2, ...)
{
  return _[a1 pathComponents];
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return _[a1 pathExtension];
}

id objc_msgSend_pathWithComponents_(void *a1, const char *a2, ...)
{
  return [a1 pathWithComponents:];
}

id objc_msgSend_pointerValue(void *a1, const char *a2, ...)
{
  return _[a1 pointerValue];
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationName:object:userInfo:];
}

id objc_msgSend_preferredFilenameExtension(void *a1, const char *a2, ...)
{
  return _[a1 preferredFilenameExtension];
}

id objc_msgSend_preferredTransform(void *a1, const char *a2, ...)
{
  return _[a1 preferredTransform];
}

id objc_msgSend_punctuationCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 punctuationCharacterSet];
}

id objc_msgSend_rangeAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 rangeAtIndex:];
}

id objc_msgSend_rangeOfCharacterFromSet_(void *a1, const char *a2, ...)
{
  return [a1 rangeOfCharacterFromSet:];
}

id objc_msgSend_rangeOfCharacterFromSet_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfCharacterFromSet:options:");
}

id objc_msgSend_rangeOfCharacterFromSet_options_range_(void *a1, const char *a2, ...)
{
  return [a1 rangeOfCharacterFromSet:options:range:];
}

id objc_msgSend_rangeOfComposedCharacterSequenceAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 rangeOfComposedCharacterSequenceAtIndex:];
}

id objc_msgSend_rangeOfComposedCharacterSequencesForRange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfComposedCharacterSequencesForRange:");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return [a1 rangeOfString:];
}

id objc_msgSend_rangeOfString_options_(void *a1, const char *a2, ...)
{
  return [a1 rangeOfString:options:];
}

id objc_msgSend_rangeOfString_options_range_(void *a1, const char *a2, ...)
{
  return [a1 rangeOfString:options:range:];
}

id objc_msgSend_rangeValue(void *a1, const char *a2, ...)
{
  return _[a1 rangeValue];
}

id objc_msgSend_registeredContentTypes(void *a1, const char *a2, ...)
{
  return _[a1 registeredContentTypes];
}

id objc_msgSend_registeredTypeIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 registeredTypeIdentifiers];
}

id objc_msgSend_regularExpressionWithPattern_options_error_(void *a1, const char *a2, ...)
{
  return [a1 regularExpressionWithPattern:options:error:];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return _[a1 removeLastObject];
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectAtIndex:];
}

id objc_msgSend_replaceCharactersInRange_withString_(void *a1, const char *a2, ...)
{
  return [a1 replaceCharactersInRange:withString:];
}

id objc_msgSend_replaceOccurrencesOfString_withString_options_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:");
}

id objc_msgSend_resourceValuesForKeys_error_(void *a1, const char *a2, ...)
{
  return [a1 resourceValuesForKeys:error:];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _[a1 scale];
}

id objc_msgSend_scanCharactersFromSet_intoString_(void *a1, const char *a2, ...)
{
  return [a1 scanCharactersFromSet:intoString:];
}

id objc_msgSend_scanLocation(void *a1, const char *a2, ...)
{
  return _[a1 scanLocation];
}

id objc_msgSend_scanUpToCharactersFromSet_intoString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scanUpToCharactersFromSet:intoString:");
}

id objc_msgSend_scannerWithString_(void *a1, const char *a2, ...)
{
  return [a1 scannerWithString:];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return _[a1 scheme];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAttributedText_(void *a1, const char *a2, ...)
{
  return [a1 setAttributedText:];
}

id objc_msgSend_setCaseSensitive_(void *a1, const char *a2, ...)
{
  return [a1 setCaseSensitive:];
}

id objc_msgSend_setCharactersToBeSkipped_(void *a1, const char *a2, ...)
{
  return [a1 setCharactersToBeSkipped:];
}

id objc_msgSend_setCurrentTraitCollection_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentTraitCollection:];
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return [a1 setImage:];
}

id objc_msgSend_setLastThrottleCheck_(void *a1, const char *a2, ...)
{
  return [a1 setLastThrottleCheck:];
}

id objc_msgSend_setMediaUTI_(void *a1, const char *a2, ...)
{
  return [a1 setMediaUTI:];
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKey:];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKeyedSubscript:];
}

id objc_msgSend_setThrottleCount_(void *a1, const char *a2, ...)
{
  return [a1 setThrottleCount:];
}

id objc_msgSend_setUrl_(void *a1, const char *a2, ...)
{
  return [a1 setUrl:];
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return [a1 setWithArray:];
}

id objc_msgSend_setWithSet_(void *a1, const char *a2, ...)
{
  return [a1 setWithSet:];
}

id objc_msgSend_sharedKeySetForKeys_(void *a1, const char *a2, ...)
{
  return [a1 sharedKeySetForKeys:];
}

id objc_msgSend_simulateCrashWithMessage_(void *a1, const char *a2, ...)
{
  return [a1 simulateCrashWithMessage];
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return [a1 sortedArrayUsingComparator:];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingFormat:];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingPathComponent:];
}

id objc_msgSend_stringByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingPathExtension:];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingString:];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return _[a1 stringByDeletingPathExtension];
}

id objc_msgSend_stringByPaddingToLength_withString_startingAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 stringByPaddingToLength:withString:startingAtIndex:];
}

id objc_msgSend_stringByReplacingMatchesInString_options_range_withTemplate_(void *a1, const char *a2, ...)
{
  return [a1 stringByReplacingMatchesInString:options:range:withTemplate:];
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return [a1 stringByReplacingOccurrencesOfString:withString:];
}

id objc_msgSend_stringByStandardizingPath(void *a1, const char *a2, ...)
{
  return _[a1 stringByStandardizingPath];
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return [a1 stringByTrimmingCharactersInSet:];
}

id objc_msgSend_stringFromNumber_(void *a1, const char *a2, ...)
{
  return [a1 stringFromNumber:];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return [a1 stringWithCString:encoding:];
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 stringWithCapacity:];
}

id objc_msgSend_stringWithCharacters_length_(void *a1, const char *a2, ...)
{
  return [a1 stringWithCharacters:length:];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return [a1 stringWithString:];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return [a1 stringWithUTF8String:];
}

id objc_msgSend_strongToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return _[a1 strongToStrongObjectsMapTable];
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return [a1 subarrayWithRange:];
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return [a1 substringFromIndex:];
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return [a1 substringToIndex:];
}

id objc_msgSend_substringWithRange_(void *a1, const char *a2, ...)
{
  return [a1 substringWithRange:];
}

id objc_msgSend_suggestedName(void *a1, const char *a2, ...)
{
  return _[a1 suggestedName];
}

id objc_msgSend_systemName(void *a1, const char *a2, ...)
{
  return _[a1 systemName];
}

id objc_msgSend_systemVersion(void *a1, const char *a2, ...)
{
  return _[a1 systemVersion];
}

id objc_msgSend_temporaryDirectory(void *a1, const char *a2, ...)
{
  return _[a1 temporaryDirectory];
}

id objc_msgSend_throttleCount(void *a1, const char *a2, ...)
{
  return _[a1 throttleCount];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceNow];
}

id objc_msgSend_tracksWithMediaCharacteristic_(void *a1, const char *a2, ...)
{
  return [a1 tracksWithMediaCharacteristic:];
}

id objc_msgSend_tracksWithMediaType_(void *a1, const char *a2, ...)
{
  return [a1 tracksWithMediaType:];
}

id objc_msgSend_traitCollectionWithUserInterfaceLevel_(void *a1, const char *a2, ...)
{
  return [a1 traitCollectionWithUserInterfaceLevel:];
}

id objc_msgSend_typeWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 typeWithIdentifier:];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return _[a1 uppercaseString];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceIdiom];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceStyle];
}

id objc_msgSend_valueWithPointer_(void *a1, const char *a2, ...)
{
  return [a1 valueWithPointer:];
}

id objc_msgSend_valueWithRange_(void *a1, const char *a2, ...)
{
  return [a1 valueWithRange:];
}

id objc_msgSend_verticalSizeClass(void *a1, const char *a2, ...)
{
  return _[a1 verticalSizeClass];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 whitespaceAndNewlineCharacterSet];
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 whitespaceCharacterSet];
}