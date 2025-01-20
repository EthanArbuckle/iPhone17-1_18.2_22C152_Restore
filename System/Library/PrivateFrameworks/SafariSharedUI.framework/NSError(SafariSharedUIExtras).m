@interface NSError(SafariSharedUIExtras)
- (BOOL)safari_isLocalNetworkContentFilteringError;
- (id)_errorMessageForFailureReason:()SafariSharedUIExtras failingURLString:providerName:networkName:isUsingEthernetNetwork:;
- (id)computeLocalNetworkContentFilteringErrorTitle;
- (uint64_t)safari_isInWebKitLegacyErrorDomain;
- (uint64_t)safari_isPrivacyProxyError;
- (uint64_t)safari_isPrivacyProxyFailClosedError;
- (uint64_t)safari_isRecoverableByPageFormatMenu;
- (void)fetchLocalNetworkContentFilteringErrorMessageForFailingURLString:()SafariSharedUIExtras withCompletionHandler:;
@end

@implementation NSError(SafariSharedUIExtras)

- (uint64_t)safari_isInWebKitLegacyErrorDomain
{
  v1 = [a1 domain];
  uint64_t v2 = [v1 isEqualToString:*MEMORY[0x1E4F46810]];

  return v2;
}

- (uint64_t)safari_isPrivacyProxyError
{
  id v1 = a1;
  uint64_t v2 = *MEMORY[0x1E4F18E70];
  uint64_t v3 = *MEMORY[0x1E4F28A50];
  while (1)
  {
    v4 = [v1 userInfo];
    uint64_t v5 = objc_msgSend(v4, "safari_BOOLForKey:", v2);

    if (v5) {
      break;
    }
    v6 = [v1 userInfo];
    v7 = [v6 objectForKeyedSubscript:v3];

    objc_opt_class();
    id v1 = v7;
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_6;
    }
  }
  v7 = v1;
LABEL_6:

  return v5;
}

- (uint64_t)safari_isPrivacyProxyFailClosedError
{
  id v1 = [a1 userInfo];
  uint64_t v2 = objc_msgSend(v1, "safari_stringForKey:", @"networkTaskMetricsPrivacyStance");

  uint64_t v3 = [v2 isEqualToString:@"FailedUnreachable"];
  return v3;
}

- (BOOL)safari_isLocalNetworkContentFilteringError
{
  id v1 = [a1 userInfo];
  uint64_t v2 = objc_msgSend(v1, "safari_dictionaryForKey:", @"networkResolutionReport");

  if (v2)
  {
    uint64_t v3 = objc_msgSend(v2, "safari_stringForKey:", @"dnsFailureReason");
    BOOL v4 = ([v3 isEqualToString:@"censored"] & 1) != 0
      || ([v3 isEqualToString:@"filtered"] & 1) != 0
      || [v3 isEqualToString:@"blocked"];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)computeLocalNetworkContentFilteringErrorTitle
{
  id v1 = [a1 userInfo];
  uint64_t v2 = objc_msgSend(v1, "safari_dictionaryForKey:", @"networkResolutionReport");

  uint64_t v3 = objc_msgSend(v2, "safari_stringForKey:", @"dnsFailureReason");
  BOOL v4 = objc_msgSend(MEMORY[0x1E4F28B50], "safari_currentTemplateAppName");
  if ([v3 isEqualToString:@"censored"])
  {
    if (v4)
    {
      uint64_t v5 = NSString;
LABEL_9:
      v6 = _WBSLocalizedString();
      v7 = objc_msgSend(v5, "localizedStringWithFormat:", v6, v4);

      goto LABEL_11;
    }
  }
  else if ([v3 isEqualToString:@"filtered"])
  {
    if (v4)
    {
      uint64_t v5 = NSString;
      goto LABEL_9;
    }
  }
  else if (v4)
  {
    uint64_t v5 = NSString;
    goto LABEL_9;
  }
  v7 = _WBSLocalizedString();
LABEL_11:

  return v7;
}

- (void)fetchLocalNetworkContentFilteringErrorMessageForFailingURLString:()SafariSharedUIExtras withCompletionHandler:
{
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 userInfo];
  v9 = objc_msgSend(v8, "safari_dictionaryForKey:", @"networkResolutionReport");

  if (v9)
  {
    v10 = objc_msgSend(v9, "safari_stringForKey:", @"dnsFailureReason");
    v11 = objc_msgSend(v9, "safari_stringForKey:", @"provider");
    v12 = objc_msgSend(v9, "safari_arrayForKey:", @"interfaces");
    v13 = [v12 firstObject];

    v14 = objc_msgSend(v13, "safari_stringForKey:", @"type");
    if ([v11 length]) {
      uint64_t v15 = 0;
    }
    else {
      uint64_t v15 = [v14 isEqualToString:@"wired"];
    }
    if ([v14 isEqualToString:@"wifi"])
    {
      v16 = (void *)MEMORY[0x1E4F38CF8];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __120__NSError_SafariSharedUIExtras__fetchLocalNetworkContentFilteringErrorMessageForFailingURLString_withCompletionHandler___block_invoke;
      v27[3] = &unk_1E5E45E60;
      v27[4] = a1;
      id v28 = v10;
      id v29 = v6;
      id v30 = v11;
      char v32 = v15;
      id v31 = v7;
      [v16 fetchCurrentWithCompletionHandler:v27];
    }
    else
    {
      if ([v14 isEqualToString:@"cellular"])
      {
        v17 = (void *)[objc_alloc(MEMORY[0x1E4F23A80]) initWithQueue:0];
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __120__NSError_SafariSharedUIExtras__fetchLocalNetworkContentFilteringErrorMessageForFailingURLString_withCompletionHandler___block_invoke_2;
        v19[3] = &unk_1E5E45EB0;
        id v25 = v7;
        id v20 = v17;
        v21 = a1;
        id v22 = v10;
        id v23 = v6;
        id v24 = v11;
        char v26 = v15;
        id v18 = v17;
        [v18 getCurrentDataSubscriptionContext:v19];
      }
      else
      {
        id v18 = [a1 _errorMessageForFailureReason:v10 failingURLString:v6 providerName:v11 networkName:0 isUsingEthernetNetwork:v15];
        (*((void (**)(id, id))v7 + 2))(v7, v18);
      }
    }
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (id)_errorMessageForFailureReason:()SafariSharedUIExtras failingURLString:providerName:networkName:isUsingEthernetNetwork:
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  if ([v13 length]) {
    uint64_t v15 = v13;
  }
  else {
    uint64_t v15 = v14;
  }
  id v16 = v15;
  v17 = objc_msgSend(MEMORY[0x1E4F28B50], "safari_currentTemplateAppName");
  if ([v11 isEqualToString:@"censored"])
  {
    id v18 = NSString;
    if (a7)
    {
      if (v17)
      {
        v19 = _WBSLocalizedString();
        uint64_t v20 = objc_msgSend(v18, "stringWithFormat:", v19, v17, v12);
        goto LABEL_28;
      }
      goto LABEL_24;
    }
    if (v17) {
      goto LABEL_20;
    }
LABEL_25:
    v19 = _WBSLocalizedString();
    id v24 = v16;
    goto LABEL_26;
  }
  int v21 = [v11 isEqualToString:@"filtered"];
  id v18 = NSString;
  if (v21)
  {
    if (a7)
    {
      if (v17) {
        goto LABEL_16;
      }
LABEL_24:
      v19 = _WBSLocalizedString();
LABEL_26:
      objc_msgSend(v18, "localizedStringWithFormat:", v19, v12, v24, v25);
      goto LABEL_27;
    }
    if (!v17) {
      goto LABEL_25;
    }
LABEL_20:
    v19 = _WBSLocalizedString();
    id v25 = v16;
    goto LABEL_21;
  }
  if (!a7)
  {
    if (!v17) {
      goto LABEL_25;
    }
    goto LABEL_20;
  }
  if (!v17) {
    goto LABEL_24;
  }
LABEL_16:
  v19 = _WBSLocalizedString();
LABEL_21:
  objc_msgSend(v18, "localizedStringWithFormat:", v19, v17, v12, v25);
  uint64_t v20 = LABEL_27:;
LABEL_28:
  id v22 = (void *)v20;

  return v22;
}

- (uint64_t)safari_isRecoverableByPageFormatMenu
{
  return objc_msgSend(a1, "safari_matchesErrorDomain:andCode:", *MEMORY[0x1E4F46810], 104);
}

@end