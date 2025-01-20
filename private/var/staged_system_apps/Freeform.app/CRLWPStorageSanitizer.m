@interface CRLWPStorageSanitizer
+ (id)filterMarkAttributes:(id)a3;
+ (id)filterText:(id)a3;
+ (id)filterText:(id)a3 removingAttachments:(BOOL)a4;
+ (id)filterText:(id)a3 removingAttachments:(BOOL)a4 removingControlCharacters:(BOOL)a5;
@end

@implementation CRLWPStorageSanitizer

+ (id)filterText:(id)a3
{
  return [a1 filterText:a3 removingAttachments:1];
}

+ (id)filterText:(id)a3 removingAttachments:(BOOL)a4
{
  return _[a1 filterText:a3 removingAttachments:a4 removingControlCharacters:1];
}

+ (id)filterText:(id)a3 removingAttachments:(BOOL)a4 removingControlCharacters:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  if (qword_1016A9310 != -1) {
    dispatch_once(&qword_1016A9310, &stru_1014E1928);
  }
  id v53 = (id)qword_1016A92F0;
  if (!v6 || !v5)
  {
    if (v6 || v5)
    {
      if (!v6 || v5) {
        goto LABEL_12;
      }
      v8 = &qword_1016A9308;
    }
    else
    {
      v8 = &qword_1016A9300;
    }
  }
  else
  {
    v8 = &qword_1016A92F8;
  }
  id v9 = (id)*v8;

  id v53 = v9;
LABEL_12:
  uint64_t v10 = objc_opt_class();
  v11 = sub_1002469D0(v10, v7);
  v12 = v11;
  if (v11)
  {
    [v11 string];
  }
  else
  {
    uint64_t v13 = objc_opt_class();
    sub_1002469D0(v13, v7);
  v14 = };
  if (!v14)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E1948);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108A7E4();
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E1968);
    }
    v15 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_1010668E0(v15);
    }
    v16 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLWPStorageSanitizer filterText:removingAttachments:removingControlCharacters:]");
    v17 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPStorageSanitizer.m"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v16, v17, 103, 0, "invalid nil value for '%{public}s'", "theStr");
  }
  id v18 = v7;
  v52 = v18;
  char v19 = 0;
  while ([v14 length])
  {
    if ([v14 characterAtIndex:0] != 65279) {
      break;
    }
    if ((v19 & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v20 = [v52 mutableCopy];

        uint64_t v21 = [v20 mutableString];

        id v18 = v20;
        v14 = (void *)v21;
      }
      else
      {
        v22 = +[NSMutableString stringWithString:v14];

        id v20 = v22;
        v14 = v20;
      }

      id v18 = v20;
    }
    char v19 = 1;
    [v18 replaceCharactersInRange:0, 1 withString:&stru_101538650];
  }
  v51 = v12;
  if ([v14 length])
  {
    unint64_t v23 = 0;
    do
    {
      v24 = (char *)[v14 length];
      uint64_t v25 = (uint64_t)&v24[-v23];
      id v26 = [v14 rangeOfCharacterFromSet:v53 options:0 range:v23 v24[-v23]];
      uint64_t v28 = v27;
      unint64_t v29 = sub_1001FA2FC((uint64_t)v26, v14, v23, v25, 0xD800uLL, 0x400uLL);
      uint64_t v31 = v30;
      unint64_t v32 = sub_1001FA2FC(v29, v14, v23, v25, 0xDC00uLL, 0x400uLL);
      if (v29 >= (unint64_t)v26 || v29 >= v32)
      {
        BOOL v35 = v32 < (unint64_t)v26;
        BOOL v36 = v32 < v29;
        if (v35 && v36) {
          uint64_t v31 = v33;
        }
        else {
          uint64_t v31 = v28;
        }
        if (v35 && v36) {
          unint64_t v29 = v32;
        }
        else {
          unint64_t v29 = (unint64_t)v26;
        }
      }
      else if (v29 + 1 < (unint64_t)[v14 length] {
             && ([v14 characterAtIndex:v29 + 1] & 0xFC00) == 0xDC00)
      }
      {
        v37 = (char *)[v14 length];
        if (v29 + 2 <= (unint64_t)v37) {
          v38 = v37;
        }
        else {
          v38 = (char *)(v29 + 2);
        }
        if (v29 + 2 >= (unint64_t)v37) {
          unint64_t v29 = (unint64_t)v37;
        }
        else {
          v29 += 2;
        }
        v39 = &v38[-v29];
        goto LABEL_65;
      }
      if (v29 == 0x7FFFFFFFFFFFFFFFLL || v31 == 0) {
        break;
      }
      v41 = (char *)[v14 length];
      if ((v19 & 1) == 0)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v42 = [v52 mutableCopy];

          uint64_t v43 = [v42 mutableString];

          id v18 = v42;
          v14 = (void *)v43;
        }
        else
        {
          v44 = +[NSMutableString stringWithString:v14];

          id v42 = v44;
          v14 = v42;
        }

        id v18 = v42;
      }
      v39 = &v41[-v29 - v31];
      [v18 replaceCharactersInRange:v29 withString:v31];
      char v19 = 1;
LABEL_65:
      unint64_t v23 = v29;
    }
    while (v39);
  }
  if (v51)
  {
    v45 = [v18 string];
    unsigned __int8 v46 = [v14 isEqualToString:v45];

    if ((v46 & 1) == 0)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E1988);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10108A744();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E19A8);
      }
      v47 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_1010668E0(v47);
      }
      v48 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLWPStorageSanitizer filterText:removingAttachments:removingControlCharacters:]");
      v49 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPStorageSanitizer.m"];
      +[CRLAssertionHandler handleFailureInFunction:v48 file:v49 lineNumber:208 isFatal:0 description:"Internal inconsistency in attributed string"];
    }
  }

  return v18;
}

+ (id)filterMarkAttributes:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_opt_class();
  BOOL v5 = sub_1002469D0(v4, v3);
  id v6 = [v5 mutableCopy];

  id v7 = v3;
  if ([v6 length])
  {
    v8 = [v6 attributesAtIndex:0 effectiveRange:0];
    id v9 = [v8 objectForKeyedSubscript:NSUnderlineStyleAttributeName];
    if ([v9 integerValue])
    {
      [v6 removeAttribute:NSUnderlineStyleAttributeName range:0, [v6 length]];
      [v6 removeAttribute:NSUnderlineColorAttributeName range:0, [v6 length]];
    }
    uint64_t v10 = [v8 objectForKeyedSubscript:NSBackgroundColorAttributeName];

    if (v10) {
      [v6 removeAttribute:NSBackgroundColorAttributeName range:0, [v6 length]];
    }
    id v7 = v6;
  }

  return v7;
}

@end