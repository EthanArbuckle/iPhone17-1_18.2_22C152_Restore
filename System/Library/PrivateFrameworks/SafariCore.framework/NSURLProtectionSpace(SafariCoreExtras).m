@interface NSURLProtectionSpace(SafariCoreExtras)
+ (id)safari_HTMLFormProtectionSpaceForURL:()SafariCoreExtras;
+ (id)safari_passkeySidecarProtectionSpaceForRelyingPartyIdentifier:()SafariCoreExtras;
- (BOOL)safari_allowsCredentialSaving;
- (id)safari_URL;
- (id)safari_addressString;
- (id)safari_creationDateOfCredentialWithUser:()SafariCoreExtras;
- (id)safari_identityPreferenceDomain;
- (id)safari_protectionSpaceByReplacingHostWithHighlevelDomain;
- (id)safari_userVisibleSiteForProtectionSpace;
- (uint64_t)isEqualToProtectionSpaceForPasswordManager:()SafariCoreExtras;
- (uint64_t)safari_compareToHighLevelDomainFromProtectionSpace:()SafariCoreExtras;
- (uint64_t)safari_compareToHighLevelDomainFromProtectionSpaceOrderingDecimalCharactersLast:()SafariCoreExtras;
- (uint64_t)safari_defaultPortForProtocol;
- (uint64_t)safari_hasDefaultPortForProtocol;
- (uint64_t)safari_protocolAsSecAttrProtocolValue;
@end

@implementation NSURLProtectionSpace(SafariCoreExtras)

+ (id)safari_HTMLFormProtectionSpaceForURL:()SafariCoreExtras
{
  id v4 = a3;
  v5 = [v4 port];
  v6 = [v4 host];
  objc_msgSend(v6, "safari_stringByRemovingWwwDotPrefix");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v8 = [v4 scheme];

  id v9 = [a1 alloc];
  if (v5) {
    uint64_t v10 = [v5 integerValue];
  }
  else {
    uint64_t v10 = 0;
  }
  if (!v8) {
    v8 = &stru_1F105D3F0;
  }
  if (!v7) {
    v7 = &stru_1F105D3F0;
  }
  v11 = (void *)[v9 initWithHost:v7 port:v10 protocol:v8 realm:0 authenticationMethod:*MEMORY[0x1E4F18C88]];

  return v11;
}

+ (id)safari_passkeySidecarProtectionSpaceForRelyingPartyIdentifier:()SafariCoreExtras
{
  v2 = (void *)MEMORY[0x1E4F1CB10];
  v3 = objc_msgSend(@"https://", "stringByAppendingString:");
  id v4 = [v2 URLWithString:v3];
  v5 = objc_msgSend(a1, "safari_HTMLFormProtectionSpaceForURL:", v4);

  return v5;
}

- (uint64_t)safari_protocolAsSecAttrProtocolValue
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v1 = [a1 protocol];
  if ([v1 isEqualToString:*MEMORY[0x1E4F18CD0]])
  {
    v2 = (uint64_t *)MEMORY[0x1E4F3B7E8];
  }
  else
  {
    if (([v1 isEqualToString:*MEMORY[0x1E4F18CD8]] & 1) == 0)
    {
      v3 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        int v6 = 138543362;
        v7 = v1;
        _os_log_impl(&dword_1B728F000, v3, OS_LOG_TYPE_INFO, "Unsupported protocol %{public}@", (uint8_t *)&v6, 0xCu);
      }
    }
    v2 = (uint64_t *)MEMORY[0x1E4F3B7F8];
  }
  uint64_t v4 = *v2;

  return v4;
}

- (id)safari_protectionSpaceByReplacingHostWithHighlevelDomain
{
  v2 = [a1 host];
  v3 = objc_msgSend(v2, "safari_highLevelDomainFromHost");

  uint64_t v4 = [a1 host];
  int v5 = [v4 isEqualToString:v3];

  if (v5)
  {
    id v6 = a1;
  }
  else
  {
    id v7 = objc_alloc((Class)objc_opt_class());
    uint64_t v8 = [a1 port];
    id v9 = [a1 protocol];
    uint64_t v10 = [a1 realm];
    v11 = [a1 authenticationMethod];
    id v6 = (id)[v7 initWithHost:v3 port:v8 protocol:v9 realm:v10 authenticationMethod:v11];
  }
  return v6;
}

- (uint64_t)safari_compareToHighLevelDomainFromProtectionSpaceOrderingDecimalCharactersLast:()SafariCoreExtras
{
  id v4 = a3;
  int v5 = [a1 host];
  id v6 = objc_msgSend(v5, "safari_highLevelDomainFromHost");

  id v7 = [v4 host];
  uint64_t v8 = objc_msgSend(v7, "safari_highLevelDomainFromHost");

  id v9 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
  if ([v6 length]) {
    int v10 = objc_msgSend(v9, "characterIsMember:", objc_msgSend(v6, "characterAtIndex:", 0)) ^ 1;
  }
  else {
    int v10 = 1;
  }
  if ([v8 length]) {
    int v11 = objc_msgSend(v9, "characterIsMember:", objc_msgSend(v8, "characterAtIndex:", 0)) ^ 1;
  }
  else {
    int v11 = 1;
  }
  if ((v10 | v11 ^ 1) == 1)
  {
    if ((v10 ^ 1 | v11) == 1) {
      uint64_t v12 = objc_msgSend(a1, "safari_compareToHighLevelDomainFromProtectionSpace:", v4);
    }
    else {
      uint64_t v12 = -1;
    }
  }
  else
  {
    uint64_t v12 = 1;
  }

  return v12;
}

- (uint64_t)safari_compareToHighLevelDomainFromProtectionSpace:()SafariCoreExtras
{
  id v4 = a3;
  int v5 = [a1 host];
  id v6 = [v4 host];

  id v7 = objc_msgSend(v5, "safari_highLevelDomainFromHost");
  uint64_t v8 = objc_msgSend(v6, "safari_highLevelDomainFromHost");
  uint64_t v9 = [v7 caseInsensitiveCompare:v8];
  if (!v9)
  {
    if ([v5 caseInsensitiveCompare:v7])
    {
      if ([v6 caseInsensitiveCompare:v7]) {
        uint64_t v9 = [v5 caseInsensitiveCompare:v6];
      }
      else {
        uint64_t v9 = 1;
      }
    }
    else
    {
      uint64_t v9 = -1;
    }
  }

  return v9;
}

- (id)safari_addressString
{
  if ([a1 isProxy]) {
    [a1 proxyType];
  }
  else {
  v2 = [a1 protocol];
  }
  uint64_t v3 = [a1 port];
  id v4 = NSString;
  uint64_t v5 = [a1 host];
  id v6 = (void *)v5;
  if (v3) {
    [v4 stringWithFormat:@"%@://%@:%ld/", v2, v5, v3];
  }
  else {
  id v7 = [v4 stringWithFormat:@"%@://%@/", v2, v5, v9];
  }

  return v7;
}

- (id)safari_userVisibleSiteForProtectionSpace
{
  v1 = objc_msgSend(a1, "safari_addressString");
  v2 = objc_msgSend(v1, "safari_simplifiedUserVisibleURLStringWithSimplifications:forDisplayOnly:simplifiedStringOffset:", 7, 0, 0);

  return v2;
}

- (id)safari_identityPreferenceDomain
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F29088]);
  uint64_t v3 = [a1 protocol];
  [v2 setScheme:v3];

  id v4 = [a1 host];
  [v2 setHost:v4];

  uint64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(a1, "port"));
  [v2 setPort:v5];

  id v6 = [v2 string];

  return v6;
}

- (id)safari_URL
{
  id v2 = objc_alloc(MEMORY[0x1E4F1CB10]);
  uint64_t v3 = objc_msgSend(a1, "safari_addressString");
  id v4 = (void *)[v2 initWithString:v3];

  return v4;
}

- (id)safari_creationDateOfCredentialWithUser:()SafariCoreExtras
{
  v20[8] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  CFTypeRef cf = 0;
  uint64_t v5 = *MEMORY[0x1E4F3B998];
  uint64_t v6 = *MEMORY[0x1E4F3B5E8];
  v19[0] = *MEMORY[0x1E4F3B978];
  v19[1] = v6;
  uint64_t v7 = *MEMORY[0x1E4F3B5F8];
  v20[0] = v5;
  v20[1] = v7;
  uint64_t v8 = *MEMORY[0x1E4F3B5C0];
  v20[2] = v4;
  uint64_t v9 = *MEMORY[0x1E4F3B7C8];
  v19[2] = v8;
  v19[3] = v9;
  v20[3] = objc_msgSend(a1, "safari_protocolAsSecAttrProtocolValue");
  v19[4] = *MEMORY[0x1E4F3B848];
  int v10 = [a1 host];
  uint64_t v11 = *MEMORY[0x1E4F3B878];
  uint64_t v12 = *MEMORY[0x1E4F3B880];
  v20[4] = v10;
  v20[5] = v12;
  uint64_t v13 = *MEMORY[0x1E4F3BC68];
  v19[5] = v11;
  v19[6] = v13;
  v19[7] = *MEMORY[0x1E4F3BB80];
  uint64_t v14 = *MEMORY[0x1E4F3BB90];
  v20[6] = MEMORY[0x1E4F1CC38];
  v20[7] = v14;
  OSStatus v15 = SecItemCopyMatching((CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:8], &cf);

  v16 = 0;
  if (!v15)
  {
    v16 = [(id)cf objectForKey:*MEMORY[0x1E4F3B668]];
    CFRelease(cf);
  }

  return v16;
}

- (uint64_t)isEqualToProtectionSpaceForPasswordManager:()SafariCoreExtras
{
  id v4 = a3;
  uint64_t v5 = [a1 host];
  uint64_t v6 = [v4 host];
  if ([v5 isEqualToString:v6]
    && (uint64_t v7 = [a1 port], v7 == objc_msgSend(v4, "port")))
  {
    uint64_t v8 = [a1 protocol];
    uint64_t v9 = [v4 protocol];
    uint64_t v10 = WBSIsEqual(v8, v9);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (BOOL)safari_allowsCredentialSaving
{
  v1 = objc_msgSend(a1, "safari_URL");
  id v2 = +[WBSSavedAccountMatchCriteria criteriaForExactFQDNPasswordMatchesOfURL:v1];

  objc_msgSend(v2, "setOptions:", objc_msgSend(v2, "options") | 4);
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  uint64_t v3 = +[WBSSavedAccountStore sharedStore];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __71__NSURLProtectionSpace_SafariCoreExtras__safari_allowsCredentialSaving__block_invoke;
  v6[3] = &unk_1E615BA68;
  v6[4] = &v7;
  [v3 getSavedAccountsMatchingCriteria:v2 withSynchronousCompletionHandler:v6];

  BOOL v4 = *((unsigned char *)v8 + 24) == 0;
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (uint64_t)safari_defaultPortForProtocol
{
  v1 = [a1 protocol];
  if ([v1 isEqualToString:*MEMORY[0x1E4F18CD8]])
  {
    uint64_t v2 = 443;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4F18CD0]])
  {
    uint64_t v2 = 80;
  }
  else if ([v1 isEqualToString:*MEMORY[0x1E4F18CC8]])
  {
    uint64_t v2 = 20;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

- (uint64_t)safari_hasDefaultPortForProtocol
{
  uint64_t v2 = [a1 port];
  if (!v2) {
    return 1;
  }
  uint64_t v3 = v2;
  BOOL v4 = [a1 protocol];
  char v5 = [v4 isEqualToString:*MEMORY[0x1E4F18CD8]];
  if (v3 == 443 && (v5 & 1) != 0
    || (char v6 = [v4 isEqualToString:*MEMORY[0x1E4F18CD0]], v3 == 80) && (v6 & 1) != 0)
  {
    uint64_t v7 = 1;
  }
  else
  {
    unsigned int v8 = [v4 isEqualToString:*MEMORY[0x1E4F18CC8]];
    if ((v3 & 0xFFFFFFFFFFFFFFFELL) == 0x14) {
      uint64_t v7 = v8;
    }
    else {
      uint64_t v7 = 0;
    }
  }

  return v7;
}

@end