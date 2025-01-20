uint64_t __WFDefaultLog()
{
  if (__WFDefaultLog_onceToken != -1) {
    dispatch_once(&__WFDefaultLog_onceToken, &__block_literal_global);
  }
  return __WFDefaultLog_log;
}

uint64_t WFDebugLevel()
{
  return gWebFilterDebugLevel;
}

uint64_t WFSetDebugLevel(uint64_t result)
{
  gWebFilterDebugLevel = result;
  return result;
}

uint64_t IndexOfBody(void *a1)
{
  if (a1)
  {
    uint64_t v2 = [a1 length];
    uint64_t v3 = [a1 rangeOfString:@"<body" options:1];
    if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      return -1;
    }
    else
    {
      uint64_t v13 = v3;
      v14 = __WFDefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        IndexOfBody_cold_2(v13, v14);
      }
      uint64_t v15 = objc_msgSend(a1, "rangeOfString:options:range:", @">", 1, v13, v2 - v13);
      return v15 + v16;
    }
  }
  else
  {
    v5 = __WFDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      IndexOfBody_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
    return 0;
  }
}

uint64_t DebugHeader(uint64_t a1, void *a2, void *a3, void *a4, int a5)
{
  uint64_t v8 = objc_msgSend((id)objc_msgSend(NSString, "stringWithContentsOfFile:encoding:error:", @"/Library/Application Support/Apple/ParentalControls/ContentFiltering/debugpageheader.html", 4, 0), "WF_stringByReplacingString:withString:", @"DEBUG_MESSAGE", objc_msgSend(a4, "WF_stringByReplacingString:withString:", @" ", @"&nbsp;"));
  if (a2)
  {
    uint64_t v9 = objc_msgSend(a2, "WF_stringByReplacingString:withString:", @"\n", @"<br>\n");
    if (v9) {
      uint64_t v10 = (__CFString *)v9;
    }
    else {
      uint64_t v10 = @"**** Error: strippedPageInHTML is nil <br>";
    }
    uint64_t v8 = objc_msgSend(v8, "WF_stringByReplacingString:withString:", @"STRIPPED_PAGE", v10);
  }
  if (a3)
  {
    uint64_t v11 = objc_msgSend((id)objc_msgSend(a3, "WF_stringByReplacingString:withString:", @" ", @"&nbsp;"),
            "WF_stringByReplacingString:withString:",
            @"\n",
            @"<br>\n");
    if (v11) {
      uint64_t v12 = (__CFString *)v11;
    }
    else {
      uint64_t v12 = @"**** Error: wordDumpInHTML is nil <br>";
    }
    uint64_t v8 = objc_msgSend(v8, "WF_stringByReplacingString:withString:", @"WORD_DUMP", v12);
  }
  if (a5) {
    uint64_t v13 = @"red";
  }
  else {
    uint64_t v13 = @"green";
  }
  if (a5) {
    v14 = @"Restricted";
  }
  else {
    v14 = @"Allowed";
  }
  uint64_t v15 = objc_msgSend(v8, "WF_stringByReplacingString:withString:", @"FILTER_FLAG_COLOR", v13);
  return objc_msgSend(v15, "WF_stringByReplacingString:withString:", @"FILTER_MESSAGE", v14);
}

uint64_t InjectPage(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, int a6)
{
  uint64_t v6 = (void *)a1;
  uint64_t v7 = DebugHeader(a1, a3, a4, a5, a6);
  if (v6)
  {
    uint64_t v8 = v7;
    uint64_t v9 = IndexOfBody(v6);
    if ((v9 & 0x8000000000000000) == 0)
    {
      uint64_t v10 = v9;
      uint64_t v11 = [v6 substringToIndex:v9];
      uint64_t v12 = [v6 substringFromIndex:v10];
      return [NSString stringWithFormat:@"%@%@%@", v11, v8, v12];
    }
    v22 = __WFDefaultLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      InjectPage_cold_2(v22, v23, v24, v25, v26, v27, v28, v29);
    }
  }
  else
  {
    v14 = __WFDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      InjectPage_cold_1(v14, v15, v16, v17, v18, v19, v20, v21);
    }
    return 0;
  }
  return (uint64_t)v6;
}

uint64_t ComposeDebugPageSimple(void *a1, uint64_t a2, void *a3)
{
  uint64_t v6 = (void *)[[NSString alloc] initWithData:a1 encoding:4];
  id v7 = +[WFWebPageDecorator webPageWithString:v6 URLString:a2];

  uint64_t v8 = (void *)[v7 pageContent];
  uint64_t v9 = (void *)ComposeDebugPage(a1, a2, v8, objc_msgSend(+[WFLSMMap mapFromFilePath:](WFLSMMap, "mapFromFilePath:", +[WFJudge defaultLSMMapPath](WFJudge, "defaultLSMMapPath")), "wordDump:", v8), a3, 1);
  return [v9 dataUsingEncoding:4];
}

uint64_t ComposeDebugPage(void *a1, uint64_t a2, void *a3, void *a4, void *a5, int a6)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v12 = __WFDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v30 = 138412290;
    uint64_t v31 = a2;
    _os_log_impl(&dword_217734000, v12, OS_LOG_TYPE_INFO, "Composing debug page for:%@", (uint8_t *)&v30, 0xCu);
  }
  uint64_t v13 = __WFDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    ComposeDebugPage_cold_1((uint64_t)a1, v13);
  }
  xmlCharEncoding v14 = xmlDetectCharEncoding((const unsigned __int8 *)[a1 bytes], objc_msgSend(a1, "length"));
  uint64_t v15 = 4;
  uint64_t v16 = 8;
  uint64_t v17 = 3;
  uint64_t v18 = 1;
  BOOL v19 = v14 != XML_CHAR_ENCODING_ASCII;
  if (v14 != XML_CHAR_ENCODING_ASCII) {
    uint64_t v18 = 4;
  }
  if (v14 == XML_CHAR_ENCODING_EUC_JP) {
    BOOL v19 = 0;
  }
  else {
    uint64_t v17 = v18;
  }
  BOOL v20 = v14 != XML_CHAR_ENCODING_SHIFT_JIS && v19;
  if (v14 != XML_CHAR_ENCODING_SHIFT_JIS) {
    uint64_t v16 = v17;
  }
  BOOL v21 = v14 != XML_CHAR_ENCODING_8859_2;
  if (v14 == XML_CHAR_ENCODING_8859_2) {
    uint64_t v15 = 9;
  }
  if (v14 == XML_CHAR_ENCODING_8859_1)
  {
    BOOL v21 = 0;
    uint64_t v15 = 5;
  }
  if (v14 <= XML_CHAR_ENCODING_2022_JP) {
    BOOL v22 = v21;
  }
  else {
    BOOL v22 = v20;
  }
  if (v14 <= XML_CHAR_ENCODING_2022_JP) {
    uint64_t v23 = v15;
  }
  else {
    uint64_t v23 = v16;
  }
  uint64_t v24 = [[NSString alloc] initWithData:a1 encoding:v23];
  uint64_t v25 = (void *)v24;
  if (v22 && !v24)
  {
    uint64_t v26 = __WFDefaultLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      LOWORD(v30) = 0;
      _os_log_impl(&dword_217734000, v26, OS_LOG_TYPE_INFO, "NSUTF8StringEncoding encoding doesn't seem to work, trying with NSISOLatin1StringEncoding", (uint8_t *)&v30, 2u);
    }
    uint64_t v25 = (void *)[[NSString alloc] initWithData:a1 encoding:5];
  }
  id v27 = v25;
  if (a6 && WFDebugLevel() == 2) {
    uint64_t v25 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v25, "WF_stringByReplacingString:withString:", @"src", @"OFF"), "WF_stringByReplacingString:withString:", @"SRC", @"OFF"), "WF_stringByReplacingString:withString:", @"background-image", @"OFF");
  }
  return InjectPage((uint64_t)v25, v28, a3, a4, a5, a6);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

unint64_t _NSHTMLEncoding(char *a1, unint64_t a2)
{
  uint64_t v4 = 0;
  uint64_t v5 = 8;
  if (a2 > 8) {
    uint64_t v5 = a2;
  }
  uint64_t v6 = v5 - 8;
  uint64_t v7 = -1;
  uint64_t v8 = a1;
  do
  {
    if (!v6) {
      return 0;
    }
    uint64_t v9 = v4 + 8;
    ++v4;
    if (!strncasecmp(v8, "charset=", 8uLL)) {
      uint64_t v7 = v9;
    }
    --v6;
    ++v8;
  }
  while (v7 < 0);
  if (v7 + 1 >= a2) {
    return 0;
  }
  uint64_t v10 = 0;
  uint64_t v11 = &a1[v7];
  CFIndex v12 = -1;
  uint64_t v13 = v7;
  do
  {
    if (!v10 && *v11 == 34)
    {
      ++v13;
      if ((v12 & 0x8000000000000000) == 0) {
        break;
      }
      goto LABEL_17;
    }
    if (v11[v10] == 34) {
      CFIndex v12 = v7 + v10 - v13;
    }
    if ((v12 & 0x8000000000000000) == 0) {
      break;
    }
LABEL_17:
    unint64_t v14 = v7 + v10++ + 2;
  }
  while (v14 < a2);
  if (v12 < 1) {
    return 0;
  }
  CFStringRef v15 = CFStringCreateWithBytes(0, (const UInt8 *)&a1[v13], v12, 0x201u, 0);
  if (!v15) {
    return 0;
  }
  CFStringRef v16 = v15;
  CFStringEncoding v17 = CFStringConvertIANACharSetNameToEncoding(v15);
  CFRelease(v16);
  if (v17 == -1) {
    return 0;
  }
  return CFStringConvertEncodingToNSStringEncoding(v17);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t _WFEvaluateVerdict(void *a1, uint64_t *a2)
{
  if (a2)
  {
    uint64_t v4 = (void *)[a1 LSMEvaluationResult];
    if (v4) {
      uint64_t v5 = [v4 debugDescription];
    }
    else {
      uint64_t v5 = [a1 message];
    }
    *a2 = v5;
  }
  return [a1 restricted];
}

uint64_t WFIsWebPageExplicit(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5 = objc_msgSend(+[WFJudge defaultJudge](WFJudge, "defaultJudge"), "pronounceOnPageContent:pageURL:debugPage:pageTitle:", a1, a2, 0, a3);
  uint64_t v6 = v5;
  if (a4)
  {
    uint64_t v7 = (void *)[v5 LSMEvaluationResult];
    if (v7) {
      uint64_t v8 = [v7 debugDescription];
    }
    else {
      uint64_t v8 = [v6 message];
    }
    *a4 = v8;
  }
  return [v6 restricted];
}

uint64_t WFIsWebPageToRestrictForUser(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t *a5)
{
  id v9 = +[WFWhitelistUserPreferences defaultWhitelistForUser:a1];
  if (!v9)
  {
    uint64_t v10 = __WFDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      WFIsWebPageToRestrictForUser_cold_4(v10);
    }
  }
  id v11 = +[WFJudge defaultJudge];
  if (!v11 && (CFIndex v12 = __WFDefaultLog(), os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)))
  {
    WFIsWebPageToRestrictForUser_cold_3(v12);
    if (a2) {
      goto LABEL_9;
    }
  }
  else if (a2)
  {
    goto LABEL_9;
  }
  uint64_t v13 = __WFDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    WFIsWebPageToRestrictForUser_cold_2(v13);
  }
LABEL_9:
  if ([a3 hasPrefix:@"https"])
  {
    if ([v9 alwaysAllowHTTPS])
    {
      return [v9 alwaysAllowHTTPS] ^ 1;
    }
    else
    {
      unsigned __int8 v25 = 1;
      BOOL v19 = (void *)[v9 pronounceOnPageURLString:a3 shouldFilter:&v25];
      BOOL v20 = v19;
      if (a5)
      {
        BOOL v21 = (void *)[v19 LSMEvaluationResult];
        if (v21) {
          uint64_t v22 = [v21 debugDescription];
        }
        else {
          uint64_t v22 = [v20 message];
        }
        *a5 = v22;
      }
      unsigned int v23 = [v20 restricted];
      uint64_t v24 = __WFDefaultLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        WFIsWebPageToRestrictForUser_cold_1(&v25, v23, v24);
      }
      if (v25) {
        return 1;
      }
      else {
        return v23;
      }
    }
  }
  else
  {
    CFStringRef v15 = (void *)[v11 pronounceOnPageContent:a2 pageURL:a3 whitelistUserPreferences:v9 debugPage:0 pageTitle:a4];
    CFStringRef v16 = v15;
    if (a5)
    {
      CFStringEncoding v17 = (void *)[v15 LSMEvaluationResult];
      if (v17) {
        uint64_t v18 = [v17 debugDescription];
      }
      else {
        uint64_t v18 = [v16 message];
      }
      *a5 = v18;
    }
    return [v16 restricted];
  }
}

uint64_t WFIsURLExplicit(void *a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v8 = objc_msgSend((id)objc_msgSend(a1, "scheme"), "lowercaseString");
  if (([v8 isEqualToString:@"https"] & 1) != 0
    || (uint64_t result = [v8 isEqualToString:@"http"], result))
  {
    id v10 = +[WFJudge defaultJudge];
    id v11 = (void *)[[NSString alloc] initWithData:a2 encoding:4];
    CFIndex v12 = objc_msgSend(v10, "pronounceOnPageContent:pageURL:debugPage:pageTitle:", v11, objc_msgSend(a1, "absoluteString"), 0, a3);

    if (a4)
    {
      uint64_t v13 = (void *)[v12 LSMEvaluationResult];
      if (v13) {
        uint64_t v14 = [v13 debugDescription];
      }
      else {
        uint64_t v14 = [v12 message];
      }
      *a4 = v14;
    }
    return [v12 restricted];
  }
  return result;
}

uint64_t WFIsURLToRestrictForUser(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  id v10 = objc_msgSend((id)objc_msgSend(a2, "scheme"), "lowercaseString");
  if (([v10 isEqualToString:@"https"] & 1) != 0
    || (uint64_t result = [v10 isEqualToString:@"http"], result))
  {
    id v12 = +[WFWhitelistUserPreferences defaultWhitelistForUser:a1];
    id v13 = +[WFJudge defaultJudge];
    uint64_t v14 = (void *)[[NSString alloc] initWithData:a3 encoding:4];
    CFStringRef v15 = objc_msgSend(v13, "pronounceOnPageContent:pageURL:whitelistUserPreferences:debugPage:pageTitle:", v14, objc_msgSend(a2, "absoluteString"), v12, 0, a4);

    if (a5)
    {
      CFStringRef v16 = (void *)[v15 LSMEvaluationResult];
      if (v16) {
        uint64_t v17 = [v16 debugDescription];
      }
      else {
        uint64_t v17 = [v15 message];
      }
      *a5 = v17;
    }
    return [v15 restricted];
  }
  return result;
}

uint64_t PreferredLanguageForUserName(uint64_t result)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  if (!result) {
    return result;
  }
  CFStringRef v1 = (const __CFString *)result;
  uint64_t v2 = __WFDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    PreferredLanguageForUserName_cold_8((uint64_t)v1, v2);
  }
  uint64_t v3 = (id)CFPreferencesCopyValue(@"AppleLanguages", (CFStringRef)*MEMORY[0x263EFFE48], v1, (CFStringRef)*MEMORY[0x263EFFE50]);
  if (![v3 count])
  {
    uint64_t v8 = __WFDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      PreferredLanguageForUserName_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
    return 0;
  }
  uint64_t v4 = (void *)[MEMORY[0x263F086E0] bundleWithPath:@"/System/Library/PrivateFrameworks/WebContentAnalysis.framework"];
  if (!v4)
  {
    CFStringRef v16 = __WFDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      PreferredLanguageForUserName_cold_4(v16, v17, v18, v19, v20, v21, v22, v23);
    }
    return 0;
  }
  uint64_t v5 = (void *)[v4 localizations];
  if (![v5 count])
  {
    uint64_t v24 = __WFDefaultLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      PreferredLanguageForUserName_cold_5(v24, v25, v26, v27, v28, v29, v30, v31);
    }
    return 0;
  }
  uint64_t v6 = (void *)[MEMORY[0x263F086E0] preferredLocalizationsFromArray:v5 forPreferences:v3];
  if (![v6 count])
  {
    uint64_t v32 = __WFDefaultLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      PreferredLanguageForUserName_cold_6(v32, v33, v34, v35, v36, v37, v38, v39);
    }
    return 0;
  }
  uint64_t v7 = __WFDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    PreferredLanguageForUserName_cold_7([v6 objectAtIndex:0], v40, v7);
  }
  return [v6 objectAtIndex:0];
}

void sub_21773DDD4(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v2 = objc_begin_catch(exception_object);
    uint64_t v3 = __WFDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      PreferredLanguageForUserName_cold_3((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);
    }
    objc_end_catch();
    uint64_t v10 = __WFDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      PreferredLanguageForUserName_cold_2(v10, v11, v12, v13, v14, v15, v16, v17);
    }
    JUMPOUT(0x21773DDA0);
  }
  _Unwind_Resume(exception_object);
}

id -[WFBlockPage _blockpage](WFBlockPage *self, SEL a2)
{
  pageTemplateURL = self->pageTemplateURL;
  if (!pageTemplateURL) {
    return 0;
  }
  uint64_t v12 = 0;
  uint64_t v3 = (void *)[NSString stringWithContentsOfURL:pageTemplateURL encoding:4 error:&v12];
  if (!v3)
  {
    uint64_t v4 = __WFDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(WFBlockPage *)(uint64_t)&v12 _blockpage];
    }
  }
  return v3;
}

BOOL _WebFilterIsActive()
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v0 = NSUserName();
  if (objc_msgSend(&unk_26C7B0A18, "containsObject:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "bundleIdentifier")))
  {
    CFStringRef v1 = __WFDefaultLog();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_217734000, v1, OS_LOG_TYPE_INFO, "_WebFilterIsActive is bypassing filter", (uint8_t *)&v8, 2u);
    }
  }
  else
  {
    id v2 = [[WFUserSettings alloc] initWithUserName:v0];
    if (v2)
    {
      uint64_t v3 = v2;
      BOOL v4 = [(WFUserSettings *)v2 restrictionType] > 0;

      goto LABEL_7;
    }
  }
  BOOL v4 = 0;
LABEL_7:
  uint64_t v5 = __WFDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = @"NO";
    if (v4) {
      uint64_t v6 = @"YES";
    }
    int v8 = 138412290;
    uint64_t v9 = v6;
    _os_log_impl(&dword_217734000, v5, OS_LOG_TYPE_INFO, "_WebFilterIsActive returning: %@", (uint8_t *)&v8, 0xCu);
  }
  return v4;
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_8(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_9(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_11(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

uint64_t NS64BaseStringFromString(void *a1)
{
  uint64_t v1 = (void *)[a1 dataUsingEncoding:4];
  return [v1 base64EncodedStringWithOptions:0];
}

void IndexOfBody_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void IndexOfBody_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_217734000, a2, OS_LOG_TYPE_DEBUG, "IndexOfBody found body at index:%lu", (uint8_t *)&v2, 0xCu);
}

void InjectPage_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void InjectPage_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void ComposeDebugPage_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_217734000, a2, OS_LOG_TYPE_DEBUG, "GuessEncodingForData:%p", (uint8_t *)&v2, 0xCu);
}

void WFIsWebPageToRestrictForUser_cold_1(unsigned __int8 *a1, char a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = *a1;
  v4[0] = 67109376;
  v4[1] = v3;
  __int16 v5 = 1024;
  int v6 = a2 & 1;
  _os_log_debug_impl(&dword_217734000, log, OS_LOG_TYPE_DEBUG, "WFIsWebPageToRestrictForUser: https should filter: %d, isRestricted: %d", (uint8_t *)v4, 0xEu);
}

void WFIsWebPageToRestrictForUser_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_217734000, log, OS_LOG_TYPE_DEBUG, "WFIsWebPageToRestrictForUser: webpageContent is nil", v1, 2u);
}

void WFIsWebPageToRestrictForUser_cold_3(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_217734000, log, OS_LOG_TYPE_ERROR, "WFGetPageEvaluation: judge is nil", v1, 2u);
}

void WFIsWebPageToRestrictForUser_cold_4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_217734000, log, OS_LOG_TYPE_ERROR, "WFGetPageEvaluation: whitelist is nil", v1, 2u);
}

void PreferredLanguageForUserName_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void PreferredLanguageForUserName_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_217734000, a1, a3, "%{public}s ----- returning nil", a5, a6, a7, a8, 2u);
}

void PreferredLanguageForUserName_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void PreferredLanguageForUserName_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void PreferredLanguageForUserName_cold_5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void PreferredLanguageForUserName_cold_6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void PreferredLanguageForUserName_cold_7(uint64_t a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 136446466;
  *(void *)(buf + 4) = "NSString *PreferredLanguageForUserName(NSString *)";
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a1;
  _os_log_debug_impl(&dword_217734000, log, OS_LOG_TYPE_DEBUG, "%{public}s ----- got preferred loc: %@", buf, 0x16u);
}

void PreferredLanguageForUserName_cold_8(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136446466;
  int v3 = "NSString *PreferredLanguageForUserName(NSString *)";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_217734000, a2, OS_LOG_TYPE_DEBUG, "%{public}s ----- getting language for: %@", (uint8_t *)&v2, 0x16u);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFStringRef CFStringConvertEncodingToIANACharSetName(CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE5060](*(void *)&encoding);
}

unint64_t CFStringConvertEncodingToNSStringEncoding(CFStringEncoding encoding)
{
  return MEMORY[0x270EE5068](*(void *)&encoding);
}

CFStringEncoding CFStringConvertIANACharSetNameToEncoding(CFStringRef theString)
{
  return MEMORY[0x270EE5070](theString);
}

CFStringEncoding CFStringConvertNSStringEncodingToEncoding(unint64_t encoding)
{
  return MEMORY[0x270EE5078](encoding);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x270EE50D0](alloc, bytes, numBytes, *(void *)&encoding, isExternalRepresentation);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
}

CFTypeRef CFWriteStreamCopyProperty(CFWriteStreamRef stream, CFStreamPropertyKey propertyName)
{
  return (CFTypeRef)MEMORY[0x270EE5528](stream, propertyName);
}

CFWriteStreamRef CFWriteStreamCreateWithAllocatedBuffers(CFAllocatorRef alloc, CFAllocatorRef bufferAllocator)
{
  return (CFWriteStreamRef)MEMORY[0x270EE5530](alloc, bufferAllocator);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x270EE5558](stream);
}

LSMMapRef LSMMapCreateFromURL(CFAllocatorRef alloc, CFURLRef file, CFOptionFlags flags)
{
  return (LSMMapRef)MEMORY[0x270F46D48](alloc, file, flags);
}

CFIndex LSMMapGetCategoryCount(LSMMapRef mapref)
{
  return MEMORY[0x270F46D50](mapref);
}

CFDictionaryRef LSMMapGetProperties(LSMMapRef mapref)
{
  return (CFDictionaryRef)MEMORY[0x270F46D58](mapref);
}

OSStatus LSMMapWriteToStream(LSMMapRef mapref, LSMTextRef textref, CFWriteStreamRef stream, CFOptionFlags options)
{
  return MEMORY[0x270F46D60](mapref, textref, stream, options);
}

LSMResultRef LSMResultCreate(CFAllocatorRef alloc, LSMMapRef mapref, LSMTextRef textref, CFIndex numResults, CFOptionFlags flags)
{
  return (LSMResultRef)MEMORY[0x270F46D68](alloc, mapref, textref, numResults, flags);
}

LSMCategory LSMResultGetCategory(LSMResultRef result, CFIndex n)
{
  return MEMORY[0x270F46D70](result, n);
}

CFIndex LSMResultGetCount(LSMResultRef result)
{
  return MEMORY[0x270F46D78](result);
}

float LSMResultGetScore(LSMResultRef result, CFIndex n)
{
  MEMORY[0x270F46D80](result, n);
  return v2;
}

OSStatus LSMTextAddWords(LSMTextRef textref, CFStringRef words, CFLocaleRef locale, CFOptionFlags flags)
{
  return MEMORY[0x270F46D88](textref, words, locale, flags);
}

LSMTextRef LSMTextCreate(CFAllocatorRef alloc, LSMMapRef mapref)
{
  return (LSMTextRef)MEMORY[0x270F46D90](alloc, mapref);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

NSString *NSUserName(void)
{
  return (NSString *)MEMORY[0x270EF2C70]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int atoi(const char *a1)
{
  return MEMORY[0x270ED86E8](a1);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

int fnmatch(const char *a1, const char *a2, int a3)
{
  return MEMORY[0x270ED99E8](a1, a2, *(void *)&a3);
}

void free(void *a1)
{
}

htmlDocPtr htmlReadMemory(const char *buffer, int size, const char *URL, const char *encoding, int options)
{
  return (htmlDocPtr)MEMORY[0x270F9BAC0](buffer, *(void *)&size, URL, encoding, *(void *)&options);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x270F9A6A0](location);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

int strncasecmp(const char *a1, const char *a2, size_t a3)
{
  return MEMORY[0x270EDB620](a1, a2, a3);
}

xmlCharEncoding xmlDetectCharEncoding(const unsigned __int8 *in, int len)
{
  return MEMORY[0x270F9BC00](in, *(void *)&len);
}