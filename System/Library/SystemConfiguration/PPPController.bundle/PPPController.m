uint64_t makepath(const char *a1)
{
  mode_t v2;
  size_t v3;
  char *v4;
  char *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  stat v10;

  v2 = umask(0);
  v3 = (int)(strlen(a1) + 1);
  v4 = (char *)malloc_type_malloc(v3, 0x75972EFAuLL);
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  v5 = v4;
  memset(&v10, 0, sizeof(v10));
  strlcpy(v4, a1, v3);
  v6 = *v5 == 47;
  while (1)
  {
    if (v5[v6])
    {
      if (v5[v6] != 47)
      {
        v7 = 0;
        goto LABEL_13;
      }
      v7 = 0;
      v5[v6] = 0;
    }
    else
    {
      v7 = 1;
    }
    if (mkdir(v5, 0x1EDu) && (*__error() != 17 && *__error() != 21 || stat(v5, &v10) < 0)) {
      break;
    }
    v5[v6] = 47;
LABEL_13:
    ++v6;
    if (v7)
    {
      v8 = 0;
      goto LABEL_17;
    }
  }
  v8 = 0xFFFFFFFFLL;
LABEL_17:
  free(v5);
  umask(v2);
  return v8;
}

FILE *racoon_pid()
{
  unsigned int v3 = 0;
  result = fopen("/var/run/racoon.pid", "r");
  if (result)
  {
    v1 = result;
    fscanf(result, "%d", &v3);
    fclose(v1);
    *(void *)v6 = 0xE00000001;
    int v7 = 1;
    unsigned int v8 = v3;
    bzero(v4, 0x288uLL);
    size_t v2 = 648;
    if (sysctl(v6, 4u, v4, &v2, 0, 0))
    {
      return 0;
    }
    else if (v5[0] ^ 0x6F636172 | *(_DWORD *)((char *)v5 + 3) ^ 0x6E6F6F)
    {
      return 0;
    }
    else
    {
      return (FILE *)v3;
    }
  }
  return result;
}

void IPSecConfigureVerboseLogging(__CFDictionary *a1, int a2)
{
  int valuePtr = a2;
  CFNumberRef v3 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(a1, @"VerboseLogging", v3);
  CFRelease(v3);
}

uint64_t IPSecApplyConfiguration(const void *a1, const char **a2)
{
  return sub_1D34(a1, a2, 1);
}

uint64_t sub_1D34(const void *a1, const char **a2, int a3)
{
  __str[0].__pn_.__r_.__value_.__s.__data_[0] = 0;
  if (!isDictionary(a1))
  {
    *a2 = "IPSec dictionary not present";
    return 0xFFFFFFFFLL;
  }
  memset(&v74, 0, sizeof(v74));
  int v73 = 0;
  GetIntFromDict((const __CFDictionary *)a1, @"VerboseLogging", &v73, 0);
  if (!GetStrAddrFromDict((const __CFDictionary *)a1, @"LocalAddress", cStr, 256))
  {
    v12 = "incorrect local address found";
LABEL_19:
    *a2 = v12;
    goto LABEL_20;
  }
  if (!racoon_validate_cfg_str(cStr))
  {
    v12 = "invalid local address";
    goto LABEL_19;
  }
  if (!GetStrAddrFromDict((const __CFDictionary *)a1, @"RemoteAddress", v77, 256))
  {
    v12 = "incorrect remote address found";
    goto LABEL_19;
  }
  if (!racoon_validate_cfg_str(v77))
  {
    v12 = "invalid remote address";
    goto LABEL_19;
  }
  in_addr_t v7 = inet_addr(v77);
  in_addr_t v8 = v7;
  if (a3)
  {
    if (v7) {
      v9 = v77;
    }
    else {
      v9 = "anonymous";
    }
    v10 = __str;
    snprintf((char *)__str, 0x100uLL, "/var/run/racoon/%s.conf", v9);
    remove(__str, v11);
    if (stat("/var/run/racoon", &v74))
    {
      if (*__error() == 2 && makepath("/var/run/racoon"))
      {
        __error();
        snprintf(v79, 0x100uLL, "cannot create racoon configuration file path (error %d)");
LABEL_55:
        *a2 = v79;
        goto LABEL_20;
      }
      v10 = __str;
    }
  }
  else
  {
    v10 = (std::__fs::filesystem::path *)"/dev/null";
  }
  mode_t v14 = umask(0x3Fu);
  v15 = fopen((const char *)v10, "w");
  umask(v14);
  if (!v15)
  {
    __error();
    snprintf(v79, 0x100uLL, "cannot create racoon configuration file (error %d)");
    goto LABEL_55;
  }
  if (v73)
  {
    fprintf(v15, "%s%s", TAB_LEVEL, "log debug2;\n");
    fprintf(v15, "%s%s", TAB_LEVEL, "path logfile \"/var/log/racoon.log\";\n\n");
  }
  BOOL v17 = CFDictionaryGetValue((CFDictionaryRef)a1, @"UseAnonymousPolicy") == 0 && v8 != 0;
  BOOL v16 = !v17;
  BOOL v64 = v17;
  v18 = v77;
  if (v16) {
    v18 = "anonymous";
  }
  snprintf(v79, 0x100uLL, "remote %s {\n", v18);
  fprintf(v15, "%s%s", TAB_LEVEL, v79);
  fprintf(v15, "%s%s", off_40008[0], "doi ipsec_doi;\n");
  v70 = v15;
  fprintf(v15, "%s%s", off_40008[0], "situation identity_only;\n");
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a1, @"AuthenticationMethod");
  if (Value) {
    CFStringRef v20 = Value;
  }
  else {
    CFStringRef v20 = @"SharedSecret";
  }
  __strlcpy_chk();
  v21 = CFDictionaryGetValue((CFDictionaryRef)a1, @"ExchangeMode");
  CFStringRef cf1 = v20;
  if (!isArray(v21)) {
    goto LABEL_48;
  }
  v66 = a2;
  CFIndex Count = CFArrayGetCount((CFArrayRef)v21);
  unint64_t v23 = Count - 1;
  if (Count >= 1)
  {
    CFIndex v24 = 0;
    if (v23 >= 2) {
      unint64_t v23 = 2;
    }
    unint64_t v25 = v23 + 1;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)v21, v24);
      if (isString(ValueAtIndex))
      {
        if (v24) {
          __strlcat_chk();
        }
        if (!CFEqual(ValueAtIndex, @"Main")
          && !CFEqual(ValueAtIndex, @"Aggressive")
          && !CFEqual(ValueAtIndex, @"Base"))
        {
          v36 = "incorrect phase 1 exchange mode";
          goto LABEL_87;
        }
        __strlcat_chk();
      }
    }
    while (v25 != ++v24);
  }
  a2 = v66;
  if (!Count)
  {
LABEL_48:
    int StrFromDict = GetStrFromDict((const __CFDictionary *)a1, @"LocalIdentifier", v83, 256, "");
    IPSecIsAggressiveMode(v20, StrFromDict, 1);
    __strlcat_chk();
  }
  __strlcat_chk();
  v28 = v15;
  fprintf(v15, "%s%s", off_40008[0], __ptr);
  if (!CFEqual(v20, @"SharedSecret") && !CFEqual(v20, @"Certificate") && !CFEqual(v20, @"Hybrid"))
  {
    v33 = "incorrect authentication method found";
    goto LABEL_232;
  }
  if (GetStrFromDict((const __CFDictionary *)a1, @"LocalIdentifierType", v82, 256, ""))
  {
    __strlcpy_chk();
    if (!racoon_validate_cfg_str(v82))
    {
      v33 = "invalid LocalIdentifierType";
      goto LABEL_232;
    }
  }
  if (GetStrFromDict((const __CFDictionary *)a1, @"LocalIdentifier", v83, 256, ""))
  {
    if (!racoon_validate_cfg_str(v83))
    {
      v33 = "invalid LocalIdentifier";
      goto LABEL_232;
    }
    v29 = v82;
    if (!v82[0]) {
      v29 = "fqdn";
    }
    snprintf(__ptr, 0x400uLL, "my_identifier %s \"%s\";\n", v29, v83);
    goto LABEL_62;
  }
  if (!CFEqual(v20, @"SharedSecret") && !CFEqual(v20, @"Hybrid") && CFEqual(v20, @"Certificate"))
  {
    strcpy(__ptr, "my_identifier asn1dn;\n");
LABEL_62:
    fprintf(v15, "%s%s", off_40008[0], __ptr);
  }
  CFStringRef v30 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a1, @"IdentifierVerification");
  if (!isString(v30)) {
    CFStringRef v30 = @"GenerateFromRemoteAddress";
  }
  if (!CFEqual(v30, @"None"))
  {
    if (CFEqual(v30, @"GenerateFromRemoteAddress"))
    {
      if (!GetStrAddrFromDict((const __CFDictionary *)a1, @"RemoteAddress", v83, 256))
      {
        v33 = "no remote address found";
        goto LABEL_150;
      }
      snprintf(__ptr, 0x400uLL, "peers_identifier address \"%s\";\n", v83);
      v28 = v15;
      fprintf(v15, "%s%s", off_40008[0], __ptr);
      int v34 = CFEqual(v20, @"Certificate");
      v35 = "off";
      if (!v34) {
        v35 = "on";
      }
      int v31 = 2 * (v34 != 0);
      goto LABEL_93;
    }
    if (CFEqual(v30, @"UseRemoteIdentifier"))
    {
      v28 = v15;
      if (!GetStrFromDict((const __CFDictionary *)a1, @"RemoteIdentifier", v83, 256, ""))
      {
        v33 = "no remote identifier found";
        goto LABEL_232;
      }
      if (!racoon_validate_cfg_str(v83))
      {
        v33 = "invalid RemoteIdentifier";
        goto LABEL_232;
      }
      snprintf(__ptr, 0x400uLL, "peers_identifier fqdn \"%s\";\n", v83);
      fprintf(v15, "%s%s", off_40008[0], __ptr);
      if (!CFEqual(v20, @"Certificate") && !CFEqual(v20, @"Hybrid"))
      {
        int v31 = 0;
        v35 = "on";
        goto LABEL_93;
      }
      int v31 = 2;
    }
    else
    {
      if (!CFEqual(v30, @"UseOpenDirectory"))
      {
        v33 = "incorrect verification method";
        goto LABEL_150;
      }
      v28 = v15;
      if (!CFEqual(v20, @"Certificate"))
      {
        v33 = "open directory can only be used with certificate authentication";
        goto LABEL_232;
      }
      int v31 = 1;
    }
    v35 = "off";
LABEL_93:
    v32 = __ptr;
    snprintf(__ptr, 0x400uLL, "verify_identifier %s;\n", v35);
    goto LABEL_94;
  }
  int v31 = 0;
  v32 = "verify_identifier off;\n";
  v28 = v70;
LABEL_94:
  fprintf(v28, "%s%s", off_40008[0], v32);
  if (CFEqual(cf1, @"SharedSecret") || CFEqual(cf1, @"Hybrid"))
  {
    if (!GetStrFromDict((const __CFDictionary *)a1, @"SharedSecret", v83, 256, ""))
    {
      v33 = "no shared secret found";
      goto LABEL_232;
    }
    if (!racoon_validate_cfg_str(v83))
    {
      v33 = "invalid SharedSecret";
      goto LABEL_232;
    }
    __strlcpy_chk();
    v37 = CFDictionaryGetValue((CFDictionaryRef)a1, @"SharedSecretEncryption");
    if (!isString(v37))
    {
LABEL_108:
      snprintf(__ptr, 0x400uLL, "shared_secret %s \"%s\";\n", v82, v83);
      v28 = v70;
      fprintf(v70, "%s%s", off_40008[0], __ptr);
      if (CFEqual(cf1, @"Hybrid"))
      {
        strcpy(__ptr, "certificate_verification sec_framework use_peers_identifier;\n");
LABEL_117:
        fprintf(v28, "%s%s", off_40008[0], __ptr);
        goto LABEL_118;
      }
      goto LABEL_118;
    }
    if (CFEqual(v37, @"Key") || CFEqual(v37, @"Keychain"))
    {
      __strlcpy_chk();
      goto LABEL_108;
    }
    v33 = "incorrect shared secret encryption found";
LABEL_150:
    v28 = v70;
    goto LABEL_232;
  }
  if (CFEqual(cf1, @"Certificate"))
  {
    CFDataRef v38 = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a1, @"LocalCertificate");
    if (isData(v38))
    {
      fprintf(v70, "%s%s", off_40008[0], "certificate_type x509 in_keychain \"");
      CFDataRef v39 = v38;
      v28 = v70;
      int v40 = sub_82A8(v39, (uint64_t)__ptr);
      fwrite(__ptr, 1uLL, v40, v70);
      fputs("\";\n", v70);
    }
    else
    {
      v28 = v70;
      fprintf(v70, "%s%s", off_40008[0], "certificate_type x509 in_keychain;\n");
    }
    fprintf(v28, "%s%s", off_40008[0], "verify_cert on;\n");
    v41 = " use_peers_identifier";
    if (v31 != 2) {
      v41 = "";
    }
    if (v31 == 1) {
      v41 = " use_open_dir";
    }
    snprintf(__ptr, 0x400uLL, "certificate_verification sec_framework%s;\n", v41);
    goto LABEL_117;
  }
LABEL_118:
  if (CFDictionaryContainsKey((CFDictionaryRef)a1, @"ForceLocalAddress")
    && CFDictionaryGetValue((CFDictionaryRef)a1, @"ForceLocalAddress") == kCFBooleanTrue)
  {
    GetStrAddrFromDict((const __CFDictionary *)a1, @"LocalAddress", v83, 256);
    if (racoon_validate_cfg_str(v83))
    {
      snprintf(__ptr, 0x400uLL, "local_address %s;\n", v83);
      fprintf(v28, "%s%s", off_40008[0], __ptr);
      goto LABEL_122;
    }
    v33 = "invalid force local address";
LABEL_232:
    *a2 = v33;
    goto LABEL_233;
  }
LABEL_122:
  *(_DWORD *)v83 = 0;
  GetIntFromDict((const __CFDictionary *)a1, @"NonceSize", v83, 16);
  snprintf(__ptr, 0x400uLL, "nonce_size %d;\n", *(_DWORD *)v83);
  fprintf(v28, "%s%s", off_40008[0], __ptr);
  *(_DWORD *)v83 = 0;
  if (GetIntFromDict((const __CFDictionary *)a1, @"NattMultipleUsersEnabled", v83, 0))
  {
    if (*(_DWORD *)v83) {
      v42 = "on";
    }
    else {
      v42 = "off";
    }
    snprintf(__ptr, 0x400uLL, "nat_traversal_multi_user %s;\n", v42);
    fprintf(v28, "%s%s", off_40008[0], __ptr);
  }
  *(_DWORD *)v83 = 0;
  if (GetIntFromDict((const __CFDictionary *)a1, @"NattKeepAliveEnabled", v83, 1))
  {
    if (*(_DWORD *)v83) {
      v43 = "on";
    }
    else {
      v43 = "off";
    }
    snprintf(__ptr, 0x400uLL, "nat_traversal_keepalive %s;\n", v43);
    fprintf(v28, "%s%s", off_40008[0], __ptr);
  }
  *(_DWORD *)v83 = 0;
  *(_DWORD *)v82 = 0;
  uint64_t v76 = 0;
  int v75 = 0;
  if (GetIntFromDict((const __CFDictionary *)a1, @"DeadPeerDetectionEnabled", v83, 0))
  {
    GetIntFromDict((const __CFDictionary *)a1, @"DeadPeerDetectionDelay", v82, 30);
    GetIntFromDict((const __CFDictionary *)a1, @"DeadPeerDetectionRetry", (_DWORD *)&v76 + 1, 5);
    GetIntFromDict((const __CFDictionary *)a1, @"DeadPeerDetectionMaxFail", &v76, 5);
    GetIntFromDict((const __CFDictionary *)a1, @"BlackHoleDetectionEnabled", &v75, 1);
    snprintf(__ptr, 0x400uLL, "dpd_delay %d;\n", *(_DWORD *)v82);
    fprintf(v28, "%s%s", off_40008[0], __ptr);
    snprintf(__ptr, 0x400uLL, "dpd_retry %d;\n", HIDWORD(v76));
    fprintf(v28, "%s%s", off_40008[0], __ptr);
    snprintf(__ptr, 0x400uLL, "dpd_maxfail %d;\n", v76);
    fprintf(v28, "%s%s", off_40008[0], __ptr);
    if (v75) {
      v44 = "dpd_blackhole_detect";
    }
    else {
      v44 = "dpd_inbound_detect";
    }
    snprintf(__ptr, 0x400uLL, "dpd_algorithm %s;\n", v44);
    fprintf(v28, "%s%s", off_40008[0], __ptr);
  }
  *(_DWORD *)v83 = 0;
  *(_DWORD *)v82 = 0;
  if (GetIntFromDict((const __CFDictionary *)a1, @"DisconnectOnIdle", v83, 0) && *(_DWORD *)v83)
  {
    GetIntFromDict((const __CFDictionary *)a1, @"DisconnectOnIdleTimer", v82, 120);
    snprintf(__ptr, 0x400uLL, "disconnect_on_idle idle_timeout %d idle_direction idle_outbound;\n", *(_DWORD *)v82);
    fprintf(v28, "%s%s", off_40008[0], __ptr);
  }
  fprintf(v28, "%s%s", off_40008[0], "initial_contact on;\n");
  fprintf(v28, "%s%s", off_40008[0], "support_proxy on;\n");
  __strlcpy_chk();
  v45 = CFDictionaryGetValue((CFDictionaryRef)a1, @"ProposalsBehavior");
  if (isString(v45))
  {
    if (!CFEqual(v45, @"Claim")
      && !CFEqual(v45, @"Obey")
      && !CFEqual(v45, @"Strict")
      && !CFEqual(v45, @"Exact"))
    {
      *a2 = "incorrect proposal behavior";
      goto LABEL_88;
    }
    __strlcpy_chk();
  }
  snprintf(__ptr, 0x400uLL, "proposal_check %s;\n", v83);
  v28 = v70;
  fprintf(v70, "%s%s", off_40008[0], __ptr);
  if (!GetStrFromDict((const __CFDictionary *)a1, @"XAuthName", v83, 256, "")) {
    goto LABEL_157;
  }
  if (!racoon_validate_cfg_str(v83))
  {
    v33 = "invalid XauthName";
    goto LABEL_232;
  }
  snprintf(__ptr, 0x400uLL, "xauth_login \"%s\";\n", v83);
  fprintf(v70, "%s%s", off_40008[0], __ptr);
LABEL_157:
  *(_DWORD *)v83 = 0;
  if (GetIntFromDict((const __CFDictionary *)a1, @"ModeConfigEnabled", v83, 0))
  {
    if (*(_DWORD *)v83) {
      v46 = "on";
    }
    else {
      v46 = "off";
    }
    snprintf(__ptr, 0x400uLL, "mode_cfg %s;\n", v46);
    fprintf(v70, "%s%s", off_40008[0], __ptr);
  }
  CFArrayRef v47 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)a1, @"Proposals");
  v66 = a2;
  CFArrayRef theArray = v47;
  int v65 = a3;
  if (isArray(v47)) {
    CFIndex v48 = CFArrayGetCount(v47);
  }
  else {
    CFIndex v48 = 0;
  }
  CFIndex v49 = 0;
  v50 = 0;
  if (v48 <= 1) {
    uint64_t v51 = 1;
  }
  else {
    uint64_t v51 = v48;
  }
  CFTypeRef cf1a = (CFTypeRef)v51;
  do
  {
    if (v48)
    {
      v50 = CFArrayGetValueAtIndex(theArray, v49);
      if (!isDictionary(v50))
      {
        *v66 = "incorrect phase 1 proposal";
        goto LABEL_233;
      }
    }
    fprintf(v28, "%s%s", off_40008[0], "\n");
    fprintf(v28, "%s%s", off_40008[0], "proposal {\n");
    HIDWORD(v76) = 0;
    v52 = CFDictionaryGetValue((CFDictionaryRef)a1, @"AuthenticationMethod");
    GetIntFromDict((const __CFDictionary *)a1, @"XAuthEnabled", (_DWORD *)&v76 + 1, 0);
    __strlcpy_chk();
    if (isString(v52))
    {
      if (!CFEqual(v52, @"SharedSecret") && !CFEqual(v52, @"Certificate") && !CFEqual(v52, @"Hybrid"))
      {
        v36 = "incorrect authentication method";
        goto LABEL_87;
      }
      __strlcpy_chk();
    }
    snprintf(v83, 0x400uLL, "authentication_method %s;\n", v82);
    fprintf(v70, "%s%s", off_40010[0], v83);
    __strlcpy_chk();
    if (!v50)
    {
      snprintf(v83, 0x400uLL, "hash_algorithm %s;\n", v82);
      fprintf(v70, "%s%s", off_40010[0], v83);
LABEL_190:
      __strlcpy_chk();
      goto LABEL_191;
    }
    v53 = CFDictionaryGetValue((CFDictionaryRef)v50, @"HashAlgorithm");
    if (isString(v53))
    {
      if (!CFEqual(v53, @"MD5")
        && !CFEqual(v53, @"SHA1")
        && !CFEqual(v53, @"SHA256")
        && !CFEqual(v53, @"SHA512"))
      {
        v36 = "incorrect authentication algorithm";
        goto LABEL_87;
      }
      __strlcpy_chk();
    }
    snprintf(v83, 0x400uLL, "hash_algorithm %s;\n", v82);
    fprintf(v70, "%s%s", off_40010[0], v83);
    __strlcpy_chk();
    v54 = CFDictionaryGetValue((CFDictionaryRef)v50, @"EncryptionAlgorithm");
    if (isString(v54))
    {
      if (!CFEqual(v54, @"DES")
        && !CFEqual(v54, @"3DES")
        && !CFEqual(v54, @"AES")
        && !CFEqual(v54, @"AES256"))
      {
        v36 = "incorrect encryption algorithm";
LABEL_87:
        *v66 = v36;
LABEL_88:
        v28 = v70;
        goto LABEL_233;
      }
      goto LABEL_190;
    }
LABEL_191:
    snprintf(v83, 0x400uLL, "encryption_algorithm %s;\n", v82);
    v28 = v70;
    fprintf(v70, "%s%s", off_40010[0], v83);
    *(_DWORD *)v82 = 3600;
    if (v50)
    {
      GetIntFromDict((const __CFDictionary *)v50, @"Lifetime", v82, 3600);
      snprintf(v83, 0x400uLL, "lifetime time %d sec;\n", *(_DWORD *)v82);
      fprintf(v70, "%s%s", off_40010[0], v83);
      *(_DWORD *)v82 = 14;
      GetIntFromDict((const __CFDictionary *)v50, @"DHGroup", v82, 14);
      int v55 = *(_DWORD *)v82;
    }
    else
    {
      snprintf(v83, 0x400uLL, "lifetime time %d sec;\n", 3600);
      fprintf(v70, "%s%s", off_40010[0], v83);
      int v55 = 14;
      *(_DWORD *)v82 = 14;
    }
    snprintf(v83, 0x400uLL, "dh_group %d;\n", v55);
    fprintf(v70, "%s%s", off_40010[0], v83);
    fprintf(v70, "%s%s", off_40008[0], "}\n");
    ++v49;
  }
  while (cf1a != (CFTypeRef)v49);
  fprintf(v70, "%s%s", TAB_LEVEL, "}\n\n");
  v56 = CFDictionaryGetValue((CFDictionaryRef)a1, @"Policies");
  if (!isArray(v56)
    || (CFIndex v57 = CFArrayGetCount((CFArrayRef)v56)) == 0
    || (!v64 ? (uint64_t v58 = 1) : (uint64_t v58 = v57), v58 < 1))
  {
LABEL_227:
    fclose(v28);
    if (v65) {
      sub_3A6C();
    }
    return 0;
  }
  CFIndex v59 = 0;
  v60 = "incorrect policy found";
  while (2)
  {
    uint64_t v76 = 0;
    int v75 = 0;
    int v71 = 0;
    int v72 = 0;
    CFDictionaryRef v61 = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)v56, v59);
    if (isDictionary(v61))
    {
      v62 = CFDictionaryGetValue(v61, @"Level");
      if (!isString(v62) || CFEqual(v62, @"None") || CFEqual(v62, @"Discard")) {
        goto LABEL_223;
      }
      if (!CFEqual(v62, @"Require"))
      {
        v60 = "incorrect policy level found";
LABEL_246:
        v28 = v70;
        break;
      }
      if (v64)
      {
        v63 = CFDictionaryGetValue(v61, @"Mode");
        if (!isString(v63) || CFEqual(v63, @"Tunnel"))
        {
          if (!GetStrNetFromDict(v61, @"LocalAddress", __ptr, 256))
          {
            v60 = "incorrect policy local network";
            goto LABEL_246;
          }
          v28 = v70;
          if (!racoon_validate_cfg_str(__ptr))
          {
            v60 = "invalid local network";
            break;
          }
          if (!GetStrNetFromDict(v61, @"RemoteAddress", v82, 256))
          {
            v60 = "incorrect policy remote network";
            break;
          }
          if (!racoon_validate_cfg_str(v82))
          {
            v60 = "invalid remote network";
            break;
          }
          GetIntFromDict(v61, @"LocalPrefix", &v75, 24);
          if (!v75)
          {
            v60 = "incorrect policy local prefix";
            break;
          }
          GetIntFromDict(v61, @"RemotePrefix", &v72, 24);
          if (!v72)
          {
            v60 = "incorrect policy remote prefix";
            break;
          }
          snprintf(v79, 0x100uLL, "sainfo address %s/%d 0 address %s/%d 0 {\n", __ptr, v75, v82, v72);
          snprintf(v83, 0x100uLL, "sainfo address %s/%d 0 address %s/%d 0 {\n", v82, v72, __ptr, v75);
LABEL_219:
          fprintf(v28, "%s%s", TAB_LEVEL, v79);
          if (sub_7D04(v28, v61, v66)) {
            goto LABEL_233;
          }
          fprintf(v28, "%s%s", TAB_LEVEL, "}\n\n");
          if (v64)
          {
            v28 = v70;
            fprintf(v70, "%s%s", TAB_LEVEL, v83);
            if (sub_7D04(v70, v61, v66)) {
              goto LABEL_233;
            }
            fprintf(v70, "%s%s", TAB_LEVEL, "}\n\n");
          }
LABEL_223:
          ++v59;
          v28 = v70;
          if (v58 == v59) {
            goto LABEL_227;
          }
          continue;
        }
        if (!CFEqual(v63, @"Transport"))
        {
          v60 = "incorrect policy type found";
          goto LABEL_246;
        }
        GetIntFromDict(v61, @"LocalPort", (_DWORD *)&v76 + 1, 0);
        GetIntFromDict(v61, @"RemotePort", &v76, 0);
        GetIntFromDict(v61, @"Protocol", &v71, 0);
        GetIntFromDict(v61, @"LocalPrefix", &v75, 32);
        GetIntFromDict(v61, @"RemotePrefix", &v72, 32);
        snprintf(v79, 0x100uLL, "sainfo address %s/%d [%d] %d address %s/%d [%d] %d {\n", cStr, v75, HIDWORD(v76), v71, v77, v72, v76, v71);
        snprintf(v83, 0x100uLL, "sainfo address %s/%d [%d] %d address %s/%d [%d] %d {\n", v77, v72, v76, v71, cStr, v75, HIDWORD(v76), v71);
      }
      else
      {
        strcpy(v79, "sainfo anonymous {\n");
      }
      v28 = v70;
      goto LABEL_219;
    }
    break;
  }
  *v66 = v60;
LABEL_233:
  fclose(v28);
LABEL_20:
  if (__str[0].__pn_.__r_.__value_.__s.__data_[0]) {
    remove(__str, v6);
  }
  return 0xFFFFFFFFLL;
}

uint64_t IPSecValidateConfiguration(const void *a1, const char **a2)
{
  return sub_1D34(a1, a2, 0);
}

uint64_t IPSecRemoveConfiguration(const void *a1, const char **a2)
{
  __str[0].__pn_.__r_.__value_.__s.__data_[0] = 0;
  if (!isDictionary(a1))
  {
    v6 = "IPSec dictionary not present";
LABEL_7:
    *a2 = v6;
    return 0xFFFFFFFFLL;
  }
  if (!GetStrAddrFromDict((const __CFDictionary *)a1, @"RemoteAddress", v7, 32))
  {
    v6 = "incorrect remote address found";
    goto LABEL_7;
  }
  uint64_t result = inet_addr(v7);
  if (result)
  {
    snprintf((char *)__str, 0x100uLL, "/var/run/racoon/%s.conf", v7);
    remove(__str, v5);
    sub_3A6C();
    return 0;
  }
  return result;
}

FILE *sub_3A6C()
{
  uint64_t result = racoon_pid();
  if (result)
  {
    return (FILE *)kill((pid_t)result, 30);
  }
  return result;
}

uint64_t IPSecRemoveConfigurationFile(const void *a1, const char **a2)
{
  __str[0].__pn_.__r_.__value_.__s.__data_[0] = 0;
  if (!isDictionary(a1))
  {
    v6 = "IPSec dictionary not present";
LABEL_7:
    *a2 = v6;
    return 0xFFFFFFFFLL;
  }
  if (!GetStrAddrFromDict((const __CFDictionary *)a1, @"RemoteAddress", v7, 32))
  {
    v6 = "incorrect remote address found";
    goto LABEL_7;
  }
  uint64_t result = inet_addr(v7);
  if (result)
  {
    snprintf((char *)__str, 0x100uLL, "/var/run/racoon/%s.conf", v7);
    remove(__str, v5);
    return 0;
  }
  return result;
}

uint64_t IPSecKickConfiguration()
{
  return 0;
}

const void *IPSecCountPolicies(const __CFDictionary *a1)
{
  CFStringRef Value = CFDictionaryGetValue(a1, @"Policies");
  uint64_t result = isArray(Value);
  if (result) {
    return (const void *)CFArrayGetCount((CFArrayRef)Value);
  }
  return result;
}

BOOL get_address_from_string(const char *a1, void *a2, size_t a3)
{
  BOOL v3 = 0;
  if (a1)
  {
    if (a2)
    {
      v13 = 0;
      int v6 = getaddrinfo(a1, 0, &stru_2ED10, &v13);
      BOOL v3 = v6 == 0;
      if (!v6)
      {
        in_addr_t v7 = v13;
        if (v13)
        {
          in_addr_t v8 = v13;
          while (1)
          {
            ai_addr = v8->ai_addr;
            int sa_family = ai_addr->sa_family;
            if (sa_family == 30 || sa_family == 2) {
              break;
            }
            in_addr_t v8 = v8->ai_next;
            if (!v8) {
              goto LABEL_14;
            }
          }
          if (ai_addr->sa_len <= a3)
          {
            bzero(a2, a3);
            memcpy(a2, v8->ai_addr, v8->ai_addr->sa_len);
          }
        }
LABEL_14:
        freeaddrinfo(v7);
      }
    }
  }
  return v3;
}

uint64_t IPSecInstallPolicies(const __CFDictionary *a1, CFIndex a2, const char **a3)
{
  socklen_t v50 = 4;
  int v51 = 0;
  uint64_t v49 = 0;
  int v48 = 255;
  memset(v53, 0, sizeof(v53));
  memset(v52, 0, sizeof(v52));
  int v6 = pfkey_open();
  if (v6 < 0)
  {
    v9 = "cannot open a pfkey socket";
    goto LABEL_76;
  }
  if (!GetStrAddrFromDict(a1, @"LocalAddress", v56, 256))
  {
    v9 = "incorrect local address";
    goto LABEL_76;
  }
  if (!GetStrAddrFromDict(a1, @"RemoteAddress", v55, 256))
  {
    v9 = "incorrect remote address";
    goto LABEL_76;
  }
  CFStringRef Value = CFDictionaryGetValue(a1, @"Policies");
  if (!isArray(Value))
  {
    v9 = "no policies found";
    goto LABEL_76;
  }
  CFIndex Count = CFArrayGetCount((CFArrayRef)Value);
  v9 = "no policies found";
  if (!Count || Count < a2)
  {
LABEL_76:
    *a3 = v9;
LABEL_77:
    SCLog();
    goto LABEL_78;
  }
  CFIndex v10 = a2 + 1;
  if (a2 == -1) {
    CFIndex v11 = 0;
  }
  else {
    CFIndex v11 = a2;
  }
  if (a2 == -1) {
    CFIndex v10 = Count;
  }
  CFIndex v42 = v10;
  CFIndex idx = v11;
  if (v11 >= v10)
  {
LABEL_81:
    SCLog();
    uint64_t v36 = 0;
    goto LABEL_79;
  }
  int v40 = a3;
  v41 = Value;
  int v12 = 0;
  int v13 = 0;
  int v14 = 0;
  while (1)
  {
    int v44 = v12;
    ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)Value, idx);
    if (!isDictionary(ValueAtIndex))
    {
      CFDataRef v38 = "incorrect policy found";
LABEL_84:
      *int v40 = v38;
      goto LABEL_77;
    }
    BOOL v16 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"Mode");
    if (isString(v16) && !CFEqual(v16, @"Tunnel"))
    {
      if (!CFEqual(v16, @"Transport"))
      {
        CFDataRef v38 = "incorrect policy type found";
        goto LABEL_84;
      }
      char v45 = 1;
    }
    else
    {
      char v45 = 0;
    }
    BOOL v17 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"Direction");
    if (!isString(v17)) {
      goto LABEL_26;
    }
    if (CFEqual(v17, @"In"))
    {
      char v18 = 0;
      char v19 = 1;
    }
    else
    {
      if (!CFEqual(v17, @"Out"))
      {
        if (!CFEqual(v17, @"InOut"))
        {
          CFDataRef v38 = "incorrect policy direction found";
          goto LABEL_84;
        }
LABEL_26:
        char v18 = 0;
        char v19 = 0;
        goto LABEL_27;
      }
      char v19 = 0;
      char v18 = 1;
    }
LABEL_27:
    CFStringRef v20 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"Level");
    if (!isString(v20) || CFEqual(v20, @"None"))
    {
      strcpy(__str, "out none");
      uint64_t v21 = 0x656E6F6E206E69;
LABEL_30:
      *(void *)__s = v21;
      goto LABEL_31;
    }
    if (CFEqual(v20, @"Unique"))
    {
      if (v45)
      {
        strcpy(__str, "out ipsec esp/transport//unique");
        strcpy(__s, "in ipsec esp/transport//unique");
      }
      else
      {
        snprintf(__str, 0x200uLL, "out ipsec esp/tunnel/%s-%s/unique", v56, v55);
        snprintf(__s, 0x200uLL, "in ipsec esp/tunnel/%s-%s/unique");
      }
    }
    else
    {
      if (!CFEqual(v20, @"Require"))
      {
        if (!CFEqual(v20, @"Discard"))
        {
          CFDataRef v38 = "incorrect policy level";
          goto LABEL_84;
        }
        strcpy(__str, "out discard");
        strcpy(&__s[7], "ard");
        uint64_t v21 = *(void *)"in discard";
        goto LABEL_30;
      }
      if (v45)
      {
        strcpy(__str, "out ipsec esp/transport//require");
        strcpy(__s, "in ipsec esp/transport//require");
      }
      else
      {
        snprintf(__str, 0x200uLL, "out ipsec esp/tunnel/%s-%s/require", v56, v55);
        snprintf(__s, 0x200uLL, "in ipsec esp/tunnel/%s-%s/require");
      }
    }
LABEL_31:
    int v22 = strlen(__s);
    caddr_t v23 = ipsec_set_policy(__s, v22);
    if (!v23)
    {
      CFDataRef v38 = "cannot set policy in";
      goto LABEL_84;
    }
    CFIndex v24 = (unsigned __int16 *)v23;
    int v25 = strlen(__str);
    caddr_t v26 = ipsec_set_policy(__str, v25);
    caddr_t v27 = v26;
    if (!v26) {
      break;
    }
    int v43 = *v24;
    int v28 = *(unsigned __int16 *)v26;
    if (v45)
    {
      int v47 = 0;
      if (!get_address_from_string(v56, v53, 0x80uLL))
      {
        CFDataRef v39 = "incorrect local address";
        goto LABEL_94;
      }
      GetIntFromDict((const __CFDictionary *)ValueAtIndex, @"LocalPort", &v47, 0);
      HIWORD(v53[0]) = bswap32((unsigned __int16)v47) >> 16;
      if (BYTE1(v53[0]) == 2) {
        int v29 = 32 * (v53[1] != 0);
      }
      else {
        int v29 = 128;
      }
      HIDWORD(v49) = v29;
      if (!get_address_from_string(v55, v52, 0x80uLL))
      {
        CFDataRef v39 = "incorrect remote address";
        goto LABEL_94;
      }
      GetIntFromDict((const __CFDictionary *)ValueAtIndex, @"RemotePort", &v47, 0);
      WORD1(v52[0]) = bswap32((unsigned __int16)v47) >> 16;
      if (BYTE1(v52[0]) == 2) {
        int v30 = 32 * (DWORD1(v52[0]) != 0);
      }
      else {
        int v30 = 128;
      }
      LODWORD(v49) = v30;
      int v31 = &v48;
      CFDictionaryRef v32 = (const __CFDictionary *)ValueAtIndex;
      CFStringRef v33 = @"Protocol";
      int v34 = 0;
    }
    else
    {
      if (!GetStrNetFromDict((const __CFDictionary *)ValueAtIndex, @"LocalAddress", v54, 256))
      {
        CFDataRef v39 = "incorrect local network (0)";
        goto LABEL_94;
      }
      if (!get_address_from_string(v54, v53, 0x80uLL))
      {
        CFDataRef v39 = "incorrect local network (1)";
        goto LABEL_94;
      }
      GetIntFromDict((const __CFDictionary *)ValueAtIndex, @"LocalPrefix", (_DWORD *)&v49 + 1, 24);
      if (!GetStrNetFromDict((const __CFDictionary *)ValueAtIndex, @"RemoteAddress", v54, 256))
      {
        CFDataRef v39 = "incorrect remote network (0)";
        goto LABEL_94;
      }
      if (!get_address_from_string(v54, v52, 0x80uLL))
      {
        CFDataRef v39 = "incorrect remote network (1)";
        goto LABEL_94;
      }
      int v31 = (int *)&v49;
      CFDictionaryRef v32 = (const __CFDictionary *)ValueAtIndex;
      CFStringRef v33 = @"RemotePrefix";
      int v34 = 24;
    }
    GetIntFromDict(v32, v33, v31, v34);
    int v12 = v44;
    if ((v19 & 1) == 0)
    {
      ++v14;
      if ((pfkey_send_spdadd(v6, (unsigned __int8 *)v53, HIDWORD(v49), (unsigned __int8 *)v52, v49, v48, v27, 8 * v28, v44) & 0x80000000) != 0)
      {
        CFDataRef v39 = "cannot add policy out";
        goto LABEL_94;
      }
      int v12 = v44 + 1;
    }
    CFStringRef Value = v41;
    if ((v18 & 1) == 0)
    {
      ++v14;
      if ((pfkey_send_spdadd(v6, (unsigned __int8 *)v52, v49, (unsigned __int8 *)v53, HIDWORD(v49), v48, v24, 8 * v43, v12) & 0x80000000) != 0)
      {
        CFDataRef v39 = "cannot add policy in";
        goto LABEL_94;
      }
      ++v12;
    }
    if ((getsockopt(v6, 0xFFFF, 4128, &v51, &v50) & 0x80000000) == 0 && v51 >= 1)
    {
      do
      {
        v35 = pfkey_recv(v6);
        if (v35)
        {
          ++v13;
          free(v35);
        }
      }
      while ((getsockopt(v6, 0xFFFF, 4128, &v51, &v50) & 0x80000000) == 0 && v51 > 0);
    }
    free(v24);
    free(v27);
    if (++idx == v42) {
      goto LABEL_81;
    }
  }
  CFDataRef v39 = "cannot set policy out";
LABEL_94:
  *int v40 = v39;
  SCLog();
  free(v24);
  if (v27) {
    free(v27);
  }
LABEL_78:
  uint64_t v36 = 0xFFFFFFFFLL;
  if (v6 != -1) {
LABEL_79:
  }
    pfkey_close(v6);
  return v36;
}

uint64_t IPSecInstallRoutes(uint64_t a1, const __CFDictionary *a2, CFIndex a3, const char **a4, int a5)
{
  return sub_4500(a1, 1, a2, a3, a4, a5);
}

uint64_t sub_4500(uint64_t a1, int a2, const __CFDictionary *a3, CFIndex a4, const char **a5, int a6)
{
  int v36 = a6;
  CFMutableStringRef Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0);
  if (!Mutable)
  {
    *a5 = "cannot allocate CFString";
    return 0xFFFFFFFFLL;
  }
  int v12 = Mutable;
  int v35 = 0;
  v48[0] = 0;
  v48[1] = 0;
  v47[0] = 0;
  v47[1] = 0;
  long long __buf = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  memset(v46, 0, sizeof(v46));
  int v13 = socket(17, 3, 17);
  if (v13 < 0)
  {
    CFDictionaryRef v32 = "cannot open a routing socket";
    goto LABEL_54;
  }
  if (!GetStrAddrFromDict(a3, @"LocalAddress", v51, 256))
  {
    BOOL v16 = "incorrect local address";
LABEL_59:
    *a5 = v16;
    CFRelease(v12);
    goto LABEL_60;
  }
  if (!GetStrAddrFromDict(a3, @"RemoteAddress", v50, 256))
  {
    BOOL v16 = "incorrect remote address";
    goto LABEL_59;
  }
  CFStringRef Value = CFDictionaryGetValue(a3, @"Policies");
  if (!isArray(Value))
  {
    BOOL v16 = "no policies found";
    goto LABEL_59;
  }
  CFIndex Count = CFArrayGetCount((CFArrayRef)Value);
  BOOL v16 = "no policies found";
  if (!Count || Count < a4) {
    goto LABEL_59;
  }
  BOOL v17 = __CFADD__(a4, 1);
  CFIndex v18 = a4 + 1;
  if (a4 == -1) {
    a4 = 0;
  }
  if (v17) {
    CFIndex v18 = Count;
  }
  CFIndex v34 = v18;
  if (a4 < v18)
  {
    int v33 = 0;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)Value, a4);
      if (!isDictionary(ValueAtIndex))
      {
        CFDictionaryRef v32 = "incorrect policy found";
        goto LABEL_54;
      }
      CFStringRef v20 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"Mode");
      if (isString(v20) && !CFEqual(v20, @"Tunnel"))
      {
        if (!CFEqual(v20, @"Transport"))
        {
          CFDictionaryRef v32 = "incorrect policy type found";
          goto LABEL_54;
        }
      }
      else
      {
        uint64_t v21 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"Direction");
        if (isString(v21))
        {
          if (CFEqual(v21, @"In")) {
            goto LABEL_47;
          }
          if (!CFEqual(v21, @"Out") && !CFEqual(v21, @"InOut"))
          {
            CFDictionaryRef v32 = "incorrect policy direction found";
            goto LABEL_54;
          }
        }
        int v22 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"Level");
        if (isString(v22) && !CFEqual(v22, @"None"))
        {
          if (!CFEqual(v22, @"Require") && !CFEqual(v22, @"Discard") && !CFEqual(v22, @"Unique"))
          {
            CFDictionaryRef v32 = "incorrect policy level";
LABEL_54:
            *a5 = v32;
            CFRelease(v12);
            if (v13 == -1) {
              return 0xFFFFFFFFLL;
            }
LABEL_60:
            close(v13);
            return 0xFFFFFFFFLL;
          }
          if (!GetStrNetFromDict((const __CFDictionary *)ValueAtIndex, @"LocalAddress", v49, 256)
            || (LODWORD(v48[0]) = 528, !inet_aton(v49, (in_addr *)v48 + 1)))
          {
            CFDictionaryRef v32 = "incorrect local network";
            goto LABEL_54;
          }
          if (!GetStrNetFromDict((const __CFDictionary *)ValueAtIndex, @"RemoteAddress", v49, 256))
          {
            CFDictionaryRef v32 = "incorrect remote network0";
            goto LABEL_54;
          }
          LODWORD(v47[0]) = 528;
          if (!inet_aton(v49, (in_addr *)v47 + 1))
          {
            CFDictionaryRef v32 = "incorrect remote network1";
            goto LABEL_54;
          }
          if (a2 != 2) {
            goto LABEL_39;
          }
          caddr_t v23 = *(uint64_t **)(a1 + 1048);
          if (!v23) {
            goto LABEL_35;
          }
          while (*((_DWORD *)v23 + 2) != HIDWORD(v48[0]) || *((_DWORD *)v23 + 4) != HIDWORD(v47[0]))
          {
            caddr_t v23 = (uint64_t *)*v23;
            if (!v23) {
              goto LABEL_35;
            }
          }
          if (*((_DWORD *)v23 + 8))
          {
LABEL_39:
            *(void *)&long long __buf = 327680;
            long long v40 = 0u;
            long long v45 = 0u;
            memset(v46, 0, sizeof(v46));
            long long v43 = 0u;
            long long v44 = 0u;
            long long v41 = 0u;
            long long v42 = 0u;
            BYTE3(__buf) = a2;
            DWORD1(v40) = ++v33;
            *((void *)&__buf + 1) = 0x700000803;
            WORD6(v44) = 528;
            LODWORD(v45) = HIDWORD(v47[0]);
            WORD6(v45) = 528;
            v46[0] = v36;
            LOWORD(v46[3]) = 528;
            GetIntFromDict((const __CFDictionary *)ValueAtIndex, @"RemotePrefix", &v35, 24);
            int v24 = v35;
            if (v35)
            {
              unsigned int v25 = 0;
              do
              {
                unsigned int v25 = (v25 >> 1) | 0x80000000;
                --v24;
              }
              while (v24);
              int v35 = 0;
            }
            else
            {
              unsigned int v25 = 0;
            }
            v46[4] = bswap32(v25);
            LOWORD(__buf) = 140;
            if (write(v13, &__buf, 0x8CuLL) < 0)
            {
              caddr_t v26 = __error();
              strerror(*v26);
              addr2ascii(2, (char *)v47 + 4, 4, v38);
              addr2ascii(2, &v36, 4, v37);
              syslog(3, "cannot write on routing socket: %s (address %s, gateway %s)\n");
            }
            else
            {
              update_service_route(a1, SHIDWORD(v48[0]), -1, SHIDWORD(v47[0]), bswap32(v46[4]), v36, 0, a2 == 1);
              sub_8458(HIDWORD(v47[0]), v46[4]);
              CFStringAppendFormat(v12, 0, @"%s, ", byte_40410);
            }
          }
          else
          {
LABEL_35:
            addr2ascii(2, (char *)v47 + 4, 4, v38);
            addr2ascii(2, &v36, 4, v37);
            syslog(6, "ignoring uninstalled route: (address %s, gateway %s)\n");
          }
        }
      }
LABEL_47:
      ++a4;
    }
    while (a4 != v34);
  }
  CFIndex Length = CFStringGetLength(v12);
  if (Length >= 1)
  {
    CFIndex v28 = Length + 1;
    int v29 = (char *)malloc_type_calloc(1uLL, Length + 1, 0x32885FB7uLL);
    if (v29)
    {
      int v30 = v29;
      CFStringGetCString(v12, v29, v28, 0x600u);
      addr2ascii(2, &v36, 4, v37);
      syslog(5, "installed routes: addresses %sgateway %s\n", v30, v37);
      free(v30);
    }
  }
  CFRelease(v12);
  close(v13);
  return 0;
}

uint64_t IPSecRemoveRoutes(uint64_t a1, const __CFDictionary *a2, CFIndex a3, const char **a4, int a5)
{
  return sub_4500(a1, 2, a2, a3, a4, a5);
}

uint64_t IPSecRemovePolicies(const __CFDictionary *a1, CFIndex a2, const char **a3)
{
  uint64_t v42 = 0;
  int v41 = 255;
  memset(v46, 0, sizeof(v46));
  memset(v45, 0, sizeof(v45));
  int v6 = pfkey_open();
  if ((v6 & 0x80000000) == 0)
  {
    if (GetStrAddrFromDict(a1, @"LocalAddress", v44, 256))
    {
      if (GetStrAddrFromDict(a1, @"RemoteAddress", v43, 256))
      {
        CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(a1, @"Policies");
        if (isArray(Value))
        {
          CFIndex Count = CFArrayGetCount(Value);
          v9 = "no policies found";
          if (Count && Count >= a2)
          {
            BOOL v10 = __CFADD__(a2, 1);
            CFIndex v11 = a2 + 1;
            if (a2 == -1) {
              a2 = 0;
            }
            if (v10) {
              CFIndex v11 = Count;
            }
            CFIndex v37 = v11;
            if (a2 < v11)
            {
              int v12 = 0;
              CFArrayRef v36 = Value;
              while (1)
              {
                ValueAtIndex = CFArrayGetValueAtIndex(Value, a2);
                if (!isDictionary(ValueAtIndex))
                {
                  CFDictionaryRef v32 = "incorrect policy found";
                  goto LABEL_52;
                }
                int v14 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"Mode");
                if (isString(v14) && !CFEqual(v14, @"Tunnel"))
                {
                  if (!CFEqual(v14, @"Transport"))
                  {
                    CFDictionaryRef v32 = "incorrect policy type found";
                    goto LABEL_52;
                  }
                  char v15 = 1;
                }
                else
                {
                  char v15 = 0;
                }
                BOOL v16 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"Direction");
                if (isString(v16))
                {
                  if (CFEqual(v16, @"In"))
                  {
                    char v17 = 0;
                    char v18 = 1;
                    goto LABEL_26;
                  }
                  if (CFEqual(v16, @"Out"))
                  {
                    char v18 = 0;
                    char v17 = 1;
                    goto LABEL_26;
                  }
                  if (!CFEqual(v16, @"InOut"))
                  {
                    CFDictionaryRef v32 = "incorrect policy direction found";
                    goto LABEL_52;
                  }
                }
                char v17 = 0;
                char v18 = 0;
LABEL_26:
                strcpy(v48, "out");
                strcpy(__s, "in");
                int v19 = strlen(__s);
                caddr_t v20 = ipsec_set_policy(__s, v19);
                if (!v20)
                {
                  CFDictionaryRef v32 = "cannot set policy in";
                  goto LABEL_52;
                }
                uint64_t v21 = v20;
                int v22 = strlen(v48);
                caddr_t v23 = ipsec_set_policy(v48, v22);
                if (!v23)
                {
                  *a3 = "cannot set policy out";
                  caddr_t v34 = v21;
LABEL_74:
                  free(v34);
                  goto LABEL_53;
                }
                caddr_t v24 = v23;
                int v38 = *(unsigned __int16 *)v21;
                int v39 = *(unsigned __int16 *)v23;
                if (v15)
                {
                  int v40 = 0;
                  if (!get_address_from_string(v44, v46, 0x80uLL))
                  {
                    int v35 = "incorrect local address";
LABEL_73:
                    *a3 = v35;
                    free(v21);
                    caddr_t v34 = v24;
                    goto LABEL_74;
                  }
                  GetIntFromDict((const __CFDictionary *)ValueAtIndex, @"LocalPort", &v40, 0);
                  WORD1(v46[0]) = bswap32((unsigned __int16)v40) >> 16;
                  if (BYTE1(v46[0]) == 2) {
                    int v25 = 32 * (DWORD1(v46[0]) != 0);
                  }
                  else {
                    int v25 = 128;
                  }
                  HIDWORD(v42) = v25;
                  if (!get_address_from_string(v43, v45, 0x80uLL))
                  {
                    int v35 = "incorrect remote address";
                    goto LABEL_73;
                  }
                  GetIntFromDict((const __CFDictionary *)ValueAtIndex, @"RemotePort", &v40, 0);
                  WORD1(v45[0]) = bswap32((unsigned __int16)v40) >> 16;
                  if (BYTE1(v45[0]) == 2) {
                    int v26 = 32 * (DWORD1(v45[0]) != 0);
                  }
                  else {
                    int v26 = 128;
                  }
                  LODWORD(v42) = v26;
                  caddr_t v27 = &v41;
                  CFDictionaryRef v28 = (const __CFDictionary *)ValueAtIndex;
                  CFStringRef v29 = @"Protocol";
                  int v30 = 0;
                }
                else
                {
                  if (!GetStrNetFromDict((const __CFDictionary *)ValueAtIndex, @"LocalAddress", v47, 32))
                  {
                    int v35 = "incorrect local network (0)";
                    goto LABEL_73;
                  }
                  if (!get_address_from_string(v47, v46, 0x80uLL))
                  {
                    int v35 = "incorrect local network (1)";
                    goto LABEL_73;
                  }
                  GetIntFromDict((const __CFDictionary *)ValueAtIndex, @"LocalPrefix", (_DWORD *)&v42 + 1, 24);
                  if (!GetStrNetFromDict((const __CFDictionary *)ValueAtIndex, @"RemoteAddress", v47, 32))
                  {
                    int v35 = "incorrect remote network (0)";
                    goto LABEL_73;
                  }
                  if (!get_address_from_string(v47, v45, 0x80uLL))
                  {
                    int v35 = "incorrect remote network (1)";
                    goto LABEL_73;
                  }
                  caddr_t v27 = (int *)&v42;
                  CFDictionaryRef v28 = (const __CFDictionary *)ValueAtIndex;
                  CFStringRef v29 = @"RemotePrefix";
                  int v30 = 24;
                }
                GetIntFromDict(v28, v29, v27, v30);
                if ((v18 & 1) == 0)
                {
                  if ((pfkey_send_spddelete(v6, (unsigned __int8 *)v46, HIDWORD(v42), (unsigned __int8 *)v45, v42, v41, v24, 8 * v39, v12) & 0x80000000) != 0)
                  {
                    int v35 = "cannot delete policy out";
                    goto LABEL_73;
                  }
                  ++v12;
                }
                if ((v17 & 1) == 0)
                {
                  if ((pfkey_send_spddelete(v6, (unsigned __int8 *)v45, v42, (unsigned __int8 *)v46, HIDWORD(v42), v41, v21, 8 * v38, v12) & 0x80000000) != 0)
                  {
                    int v35 = "cannot delete policy in";
                    goto LABEL_73;
                  }
                  ++v12;
                }
                free(v21);
                free(v24);
                uint64_t v31 = 0;
                ++a2;
                CFArrayRef Value = v36;
                if (v37 == a2) {
                  goto LABEL_59;
                }
              }
            }
            uint64_t v31 = 0;
            goto LABEL_59;
          }
        }
        else
        {
          v9 = "no policies found";
        }
      }
      else
      {
        v9 = "incorrect remote address";
      }
    }
    else
    {
      v9 = "incorrect local address";
    }
    *a3 = v9;
    uint64_t v31 = 0xFFFFFFFFLL;
LABEL_59:
    pfkey_close(v6);
    return v31;
  }
  CFDictionaryRef v32 = "cannot open a pfkey socket";
LABEL_52:
  *a3 = v32;
LABEL_53:
  uint64_t v31 = 0xFFFFFFFFLL;
  if (v6 != -1) {
    goto LABEL_59;
  }
  return v31;
}

uint64_t IPSecRemoveSecurityAssociations(unsigned __int8 *a1, unsigned __int8 *a2)
{
  int v4 = pfkey_open();
  if (v4 < 0) {
    return 0xFFFFFFFFLL;
  }
  int v5 = v4;
  uint64_t v6 = pfkey_send_delete_all(v4, 3, 0, a1, a2);
  if ((v6 & 0x80000000) == 0) {
    uint64_t v6 = pfkey_send_delete_all(v5, 3, 0, a2, a1);
  }
  uint64_t v7 = v6;
  pfkey_close(v5);
  return v7;
}

BOOL IPSecIsAggressiveMode(const void *a1, int a2, int a3)
{
  BOOL result = 0;
  if (a2 && a3) {
    return !isString(a1) || CFEqual(a1, @"Certificate") == 0;
  }
  return result;
}

uint64_t sockaddr_to_string(unsigned __int8 *a1, void *a2, unint64_t a3)
{
  bzero(a2, a3);
  int v6 = a1[1];
  switch(v6)
  {
    case 30:
      uint64_t result = (uint64_t)inet_ntop(30, a1 + 8, (char *)a2, a3);
      if (*((_DWORD *)a1 + 6))
      {
        uint64_t result = strlen((const char *)a2);
        if (a3 >= ((result << 32) + 0x1100000000) >> 32)
        {
          uint64_t v8 = result << 32;
          *((unsigned char *)a2 + (int)result) = 37;
          unsigned int v9 = *((_DWORD *)a1 + 6);
          return (uint64_t)if_indextoname(v9, (char *)a2 + ((v8 + 0x100000000) >> 32));
        }
      }
      break;
    case 18:
      unsigned int v12 = *a1;
      CFIndex v11 = a1 + 8;
      size_t v10 = v12;
      if (v12 >= a3) {
        size_t v13 = a3 - 1;
      }
      else {
        size_t v13 = v10;
      }
      return (uint64_t)memmove(a2, v11, v13);
    case 2:
      return (uint64_t)inet_ntop(2, a1 + 4, (char *)a2, a3);
    default:
      return snprintf((char *)a2, a3, "unexpected address family %d", a1[1]);
  }
  return result;
}

uint64_t get_src_address(unsigned char *a1, uint64_t a2, const char *a3, char *a4)
{
  pid_t v8 = getpid();
  uint64_t result = socket(17, 3, 17);
  if (result != -1)
  {
    int v10 = result;
    bzero(v41, 0x258uLL);
    int __buf = 285540444;
    uint64_t v42 = 0x1100000807;
    pid_t v43 = v8;
    int v44 = 1;
    if (a3)
    {
      LODWORD(a3) = if_nametoindex(a3);
      LODWORD(v42) = 16779271;
      v41[0] = (_WORD)a3;
    }
    CFIndex v11 = v45;
    __memmove_chk();
    __int16 v12 = __buf + v45[0];
    *(_WORD *)&v45[v45[0]] = 4628;
    LOWORD(__buf) = v12 + 20;
    while (write(v10, &__buf, (unsigned __int16)__buf) == -1)
    {
      if (*__error() != 4) {
        goto LABEL_7;
      }
    }
    while (read(v10, &__buf, 0x25CuLL) == -1)
    {
      if (*__error() != 4) {
        goto LABEL_7;
      }
    }
    uint64_t v13 = 0;
    *(_OWORD *)__src = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    int v14 = HIDWORD(v42);
    do
    {
      if (((1 << v13) & v14) != 0)
      {
        *((void *)&v36 + v13) = v11;
        uint64_t v15 = *v11;
        if ((v15 & 3) != 0) {
          uint64_t v16 = (v15 | 3) + 1;
        }
        else {
          uint64_t v16 = *v11;
        }
        if (*v11) {
          uint64_t v17 = v16;
        }
        else {
          uint64_t v17 = 4;
        }
        v11 += v17;
        v14 ^= 1 << v13;
      }
      else
      {
        *((void *)&v36 + v13) = 0;
      }
      ++v13;
    }
    while (v13 != 8);
    if (!a1 || (char v18 = __src[1]) == 0 || (v19 = (const char *)__src[0], a4) && !__src[0])
    {
LABEL_7:
      close(v10);
      return 0xFFFFFFFFLL;
    }
    if (*((unsigned char *)__src[1] + 1) == 30
      && *((unsigned __int8 *)__src[1] + 8) == 254
      && (*((unsigned char *)__src[1] + 9) & 0xC0) == 0x80)
    {
      unsigned int v20 = *((unsigned __int16 *)__src[1] + 5);
      if (*((_WORD *)__src[1] + 5))
      {
        *((_WORD *)__src[1] + 5) = 0;
        if (!v18[6]) {
          v18[6] = __rev16(v20);
        }
      }
    }
    memmove(a1, v18, *(unsigned __int8 *)v18);
    if (a4) {
      strncpy(a4, v19 + 8, 0x10uLL);
    }
    close(v10);
    if (a1[1] != 30) {
      return 0;
    }
    LODWORD(v35) = 128;
    HIDWORD(v35) = a3;
    uint64_t v21 = (sockaddr *)malloc_type_calloc(1uLL, 0x80uLL, 0xF1363277uLL);
    if (v21)
    {
      int v22 = v21;
      int v23 = socket(*(unsigned __int8 *)(a2 + 1), 2, 0);
      if (v23 < 0)
      {
        CFStringRef v29 = __error();
        int v30 = strerror(*v29);
        syslog(3, "socket (%s)\n", v30);
      }
      else
      {
        int v24 = v23;
        if (fcntl(v23, 4, 4, v35, v36, v37) == -1) {
          syslog(3, "failed to put localaddr socket in non-blocking mode\n");
        }
        if (a3)
        {
          int v25 = *(unsigned char *)(a2 + 1) == 2 ? 0 : 41;
          int v26 = *(unsigned char *)(a2 + 1) == 2 ? 25 : 125;
          if (setsockopt(v24, v25, v26, (char *)&v35 + 4, 4u))
          {
            caddr_t v27 = __error();
            CFDictionaryRef v28 = strerror(*v27);
            syslog(3, "failed to set IP family on localaddr socket: %s\n", v28);
          }
        }
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        sockaddr v46 = (sockaddr)0;
        long long v47 = 0u;
        __memcpy_chk();
        if (v46.sa_family == 30 || v46.sa_family == 2) {
          *(_WORD *)v46.sa_data = -14161;
        }
        if (connect(v24, &v46, v46.sa_len) < 0)
        {
          uint64_t v31 = __error();
          CFDictionaryRef v32 = strerror(*v31);
          syslog(3, "connect (%s)\n", v32);
          close(v24);
        }
        else
        {
          if (getsockname(v24, v22, (socklen_t *)&v35) < 0)
          {
            int v33 = __error();
            caddr_t v34 = strerror(*v33);
            syslog(3, "getsockname (%s)\n", v34);
            close(v24);
            return 0;
          }
          close(v24);
          memcpy(a1, v22, v22->sa_len);
        }
      }
      free(v22);
    }
    else
    {
      syslog(3, "failed to get address buffer.\n");
    }
    return 0;
  }
  return result;
}

uint64_t get_if_mtu()
{
  long long v4 = 0u;
  long long v5 = 0u;
  uint64_t v0 = 1500;
  LODWORD(v5) = 1500;
  int v1 = socket(2, 2, 0);
  if ((v1 & 0x80000000) == 0)
  {
    int v2 = v1;
    __strlcpy_chk();
    ioctl(v2, 0xC0206933uLL, &v4);
    close(v2);
    return v5;
  }
  return v0;
}

uint64_t get_if_media()
{
  memset(v3, 0, 44);
  int v0 = socket(2, 2, 0);
  if (v0 < 0) {
    return 0;
  }
  int v1 = v0;
  __strlcpy_chk();
  ioctl(v1, 0xC02C6938uLL, v3);
  close(v1);
  return LODWORD(v3[1]);
}

uint64_t get_if_baudrate(const char *a1)
{
  size_t size = 0;
  unsigned int v1 = if_nametoindex(a1);
  if (!v1) {
    return 0;
  }
  *(_OWORD *)int v6 = xmmword_2ED00;
  int v7 = 3;
  unsigned int v8 = v1;
  if (sysctl(v6, 6u, 0, &size, 0, 0) < 0) {
    return 0;
  }
  int v2 = malloc_type_malloc(size, 0x3FD6D1DDuLL);
  if (sysctl(v6, 6u, v2, &size, 0, 0) < 0)
  {
    uint64_t v3 = 0;
    if (!v2) {
      return v3;
    }
  }
  else if (v2[3] == 14)
  {
    uint64_t v3 = *((unsigned int *)v2 + 8);
  }
  else
  {
    uint64_t v3 = 0;
  }
  free(v2);
  return v3;
}

uint64_t IPSecSetSecurityAssociationsPreference(void *a1, unsigned int a2)
{
  unsigned int v4 = a2;
  size_t v3 = 4;
  if (a2 <= 1) {
    return sysctlbyname("net.key.prefered_oldsa", a1, &v3, &v4, 4uLL);
  }
  else {
    return 0;
  }
}

__CFDictionary *IPSecCreateL2TPDefaultConfiguration(const sockaddr *a1, const sockaddr *a2, const char *a3, const void *a4, int a5, int a6, int a7, const __CFString *a8, int a9)
{
  int v68 = 1;
  int v69 = 0;
  unsigned int valuePtr = 0;
  int v67 = 17;
  int sa_family = a2->sa_family;
  if (a1->sa_family != sa_family)
  {
    syslog(3, "address families don't match (%u != %u)\n", a1->sa_family, sa_family);
    return 0;
  }
  CFMutableStringRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFStringRef v19 = 0;
  if (a3) {
    CFStringRef v19 = CFStringCreateWithCString(0, a3, 0x600u);
  }
  CFStringRef v60 = v19;
  if (a2->sa_family == 30)
  {
    getnameinfo(a1, a1->sa_len, cStr, 0x39u, 0, 0, 10);
    CFStringRef value = CFStringCreateWithCString(0, cStr, 0x600u);
    getnameinfo(a2, a2->sa_len, cStr, 0x39u, 0, 0, 10);
    CFStringRef v62 = CFStringCreateWithCString(0, cStr, 0x600u);
    unsigned int valuePtr = bswap32(*(unsigned __int16 *)a1->sa_data) >> 16;
    CFNumberRef v58 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    unsigned int valuePtr = bswap32(*(unsigned __int16 *)a2->sa_data) >> 16;
    CFNumberRef v20 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    unsigned int valuePtr = 128;
    CFNumberRef v56 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    CFNumberRef v55 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  }
  else
  {
    int v22 = addr2ascii(2, &a1->sa_data[2], 4, 0);
    CFStringRef value = CFStringCreateWithCString(0, v22, 0x600u);
    int v23 = addr2ascii(2, &a2->sa_data[2], 4, 0);
    CFStringRef v62 = CFStringCreateWithCString(0, v23, 0x600u);
    unsigned int valuePtr = bswap32(*(unsigned __int16 *)a1->sa_data) >> 16;
    CFNumberRef v58 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    unsigned int valuePtr = bswap32(*(unsigned __int16 *)a2->sa_data) >> 16;
    CFNumberRef v20 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    CFNumberRef v55 = 0;
    CFNumberRef v56 = 0;
  }
  CFNumberRef v54 = CFNumberCreate(0, kCFNumberIntType, &v69);
  CFNumberRef v61 = CFNumberCreate(0, kCFNumberIntType, &v67);
  if (a6)
  {
    CFNumberRef v53 = 0;
    CFStringRef v24 = @"Obey";
  }
  else
  {
    if (a7) {
      int v25 = &v68;
    }
    else {
      int v25 = &v69;
    }
    CFNumberRef v53 = CFNumberCreate(0, kCFNumberIntType, v25);
    CFStringRef v24 = @"Claim";
  }
  CFDictionarySetValue(Mutable, @"AuthenticationMethod", a4);
  CFDictionarySetValue(Mutable, @"LocalAddress", value);
  CFDictionarySetValue(Mutable, @"RemoteAddress", v62);
  CFDictionarySetValue(Mutable, @"ProposalsBehavior", v24);
  if (a6 && CFEqual(a4, @"Certificate"))
  {
    if (a8) {
      CFStringRef v26 = a8;
    }
    else {
      CFStringRef v26 = @"GenerateFromRemoteAddress";
    }
    if (!a8 && a3)
    {
      CFDictionarySetValue(Mutable, @"RemoteIdentifier", v60);
      CFStringRef v26 = @"UseRemoteIdentifier";
    }
    CFDictionarySetValue(Mutable, @"IdentifierVerification", v26);
    BOOL IsAggressiveMode = IPSecIsAggressiveMode(a4, a5, a6);
  }
  else
  {
    CFDictionarySetValue(Mutable, @"IdentifierVerification", @"None");
    BOOL IsAggressiveMode = IPSecIsAggressiveMode(a4, a5, a6);
    if (!a6) {
      CFDictionarySetValue(Mutable, @"NattMultipleUsersEnabled", v53);
    }
  }
  CFNumberRef v57 = v20;
  int v59 = a6;
  CFArrayRef theArray = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  unsigned int valuePtr = 3600;
  CFNumberRef cf = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  if (a9)
  {
    unsigned int v28 = 0;
  }
  else
  {
    unsigned int valuePtr = 14;
    CFNumberRef v37 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    long long v39 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(v39, @"EncryptionAlgorithm", @"AES256");
    CFDictionarySetValue(v39, @"HashAlgorithm", @"SHA256");
    CFDictionarySetValue(v39, @"DHGroup", v37);
    CFDictionarySetValue(v39, @"Lifetime", cf);
    CFArraySetValueAtIndex(theArray, 0, v39);
    CFRelease(v39);
    int v40 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(v40, @"EncryptionAlgorithm", @"AES256");
    CFDictionarySetValue(v40, @"HashAlgorithm", @"SHA1");
    CFDictionarySetValue(v40, @"DHGroup", v37);
    CFDictionarySetValue(v40, @"Lifetime", cf);
    CFArraySetValueAtIndex(theArray, 1, v40);
    CFRelease(v40);
    int v41 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(v41, @"EncryptionAlgorithm", @"AES256");
    CFDictionarySetValue(v41, @"HashAlgorithm", @"MD5");
    CFDictionarySetValue(v41, @"DHGroup", v37);
    CFDictionarySetValue(v41, @"Lifetime", cf);
    CFArraySetValueAtIndex(theArray, 2, v41);
    CFRelease(v41);
    uint64_t v42 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(v42, @"EncryptionAlgorithm", @"AES256");
    CFDictionarySetValue(v42, @"HashAlgorithm", @"SHA512");
    CFDictionarySetValue(v42, @"DHGroup", v37);
    CFDictionarySetValue(v42, @"Lifetime", cf);
    CFArraySetValueAtIndex(theArray, 3, v42);
    CFRelease(v42);
    if (IsAggressiveMode) {
      goto LABEL_29;
    }
    CFRelease(v37);
    unsigned int valuePtr = 5;
    CFNumberRef v49 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    long long v50 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(v50, @"EncryptionAlgorithm", @"AES256");
    CFDictionarySetValue(v50, @"HashAlgorithm", @"SHA256");
    CFDictionarySetValue(v50, @"DHGroup", v49);
    CFDictionarySetValue(v50, @"Lifetime", cf);
    CFArraySetValueAtIndex(theArray, 4, v50);
    CFRelease(v50);
    long long v51 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(v51, @"EncryptionAlgorithm", @"AES256");
    CFDictionarySetValue(v51, @"HashAlgorithm", @"SHA1");
    CFDictionarySetValue(v51, @"DHGroup", v49);
    CFDictionarySetValue(v51, @"Lifetime", cf);
    CFArraySetValueAtIndex(theArray, 5, v51);
    CFRelease(v51);
    long long v52 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(v52, @"EncryptionAlgorithm", @"AES256");
    CFDictionarySetValue(v52, @"HashAlgorithm", @"MD5");
    CFDictionarySetValue(v52, @"DHGroup", v49);
    CFDictionarySetValue(v52, @"Lifetime", cf);
    CFArraySetValueAtIndex(theArray, 6, v52);
    CFRelease(v52);
    CFRelease(v49);
    unsigned int v28 = 7;
  }
  unsigned int valuePtr = 2;
  CFNumberRef v29 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  int v30 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(v30, @"EncryptionAlgorithm", @"AES256");
  CFDictionarySetValue(v30, @"HashAlgorithm", @"SHA256");
  CFDictionarySetValue(v30, @"DHGroup", v29);
  CFDictionarySetValue(v30, @"Lifetime", cf);
  CFArraySetValueAtIndex(theArray, v28, v30);
  CFRelease(v30);
  uint64_t v31 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(v31, @"EncryptionAlgorithm", @"AES256");
  CFDictionarySetValue(v31, @"HashAlgorithm", @"SHA1");
  CFDictionarySetValue(v31, @"DHGroup", v29);
  CFDictionarySetValue(v31, @"Lifetime", cf);
  CFArraySetValueAtIndex(theArray, v28 + 1, v31);
  CFRelease(v31);
  CFDictionaryRef v32 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(v32, @"EncryptionAlgorithm", @"AES256");
  CFDictionarySetValue(v32, @"HashAlgorithm", @"MD5");
  CFDictionarySetValue(v32, @"DHGroup", v29);
  CFDictionarySetValue(v32, @"Lifetime", cf);
  CFArraySetValueAtIndex(theArray, v28 + 2, v32);
  CFRelease(v32);
  int v33 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(v33, @"EncryptionAlgorithm", @"AES");
  CFDictionarySetValue(v33, @"HashAlgorithm", @"SHA1");
  CFDictionarySetValue(v33, @"DHGroup", v29);
  CFDictionarySetValue(v33, @"Lifetime", cf);
  CFArraySetValueAtIndex(theArray, v28 + 3, v33);
  CFRelease(v33);
  caddr_t v34 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(v34, @"EncryptionAlgorithm", @"AES");
  CFDictionarySetValue(v34, @"HashAlgorithm", @"MD5");
  CFDictionarySetValue(v34, @"DHGroup", v29);
  CFDictionarySetValue(v34, @"Lifetime", cf);
  CFArraySetValueAtIndex(theArray, v28 + 4, v34);
  CFRelease(v34);
  uint64_t v35 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(v35, @"EncryptionAlgorithm", @"3DES");
  CFDictionarySetValue(v35, @"HashAlgorithm", @"SHA1");
  CFDictionarySetValue(v35, @"DHGroup", v29);
  CFDictionarySetValue(v35, @"Lifetime", cf);
  CFIndex v36 = v28 + 6;
  CFArraySetValueAtIndex(theArray, v28 + 5, v35);
  CFRelease(v35);
  CFNumberRef v37 = v29;
  int v38 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(v38, @"EncryptionAlgorithm", @"3DES");
  CFDictionarySetValue(v38, @"HashAlgorithm", @"MD5");
  CFDictionarySetValue(v38, @"DHGroup", v29);
  CFDictionarySetValue(v38, @"Lifetime", cf);
  CFArraySetValueAtIndex(theArray, v36, v38);
  CFRelease(v38);
LABEL_29:
  CFRelease(v37);
  CFRelease(cf);
  uint64_t v21 = Mutable;
  CFDictionarySetValue(Mutable, @"Proposals", theArray);
  CFRelease(theArray);
  pid_t v43 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFDictionarySetValue(v43, @"LocalPort", v58);
  CFDictionarySetValue(v43, @"RemotePort", v57);
  if (v56) {
    CFDictionarySetValue(v43, @"LocalPrefix", v56);
  }
  if (v55) {
    CFDictionarySetValue(v43, @"RemotePrefix", v55);
  }
  CFDictionarySetValue(v43, @"Protocol", v61);
  CFDictionarySetValue(v43, @"Mode", @"Transport");
  CFDictionarySetValue(v43, @"Level", @"Require");
  int v44 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  CFArraySetValueAtIndex(v44, 0, @"AES256");
  CFArraySetValueAtIndex(v44, 1, @"AES");
  CFArraySetValueAtIndex(v44, 2, @"3DES");
  CFDictionarySetValue(v43, @"EncryptionAlgorithm", v44);
  CFRelease(v44);
  long long v45 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  CFArraySetValueAtIndex(v45, 0, @"SHA256");
  CFArraySetValueAtIndex(v45, 1, @"SHA1");
  CFArraySetValueAtIndex(v45, 2, @"MD5");
  CFDictionarySetValue(v43, @"HashAlgorithm", v45);
  CFRelease(v45);
  if (v59)
  {
    MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v43);
    CFDictionarySetValue(MutableCopy, @"RemotePort", v54);
    CFDictionarySetValue(MutableCopy, @"Direction", @"In");
  }
  else
  {
    MutableCopy = 0;
  }
  long long v47 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  CFArraySetValueAtIndex(v47, 0, v43);
  if (v59)
  {
    CFArraySetValueAtIndex(v47, 1, MutableCopy);
    CFRelease(v43);
  }
  else
  {
    MutableCopy = v43;
  }
  CFRelease(MutableCopy);
  CFDictionarySetValue(Mutable, @"Policies", v47);
  CFRelease(v47);
  CFRelease(value);
  CFRelease(v62);
  CFRelease(v58);
  CFRelease(v57);
  if (v56) {
    CFRelease(v56);
  }
  if (v55) {
    CFRelease(v55);
  }
  CFRelease(v54);
  CFRelease(v61);
  if (!v59) {
    CFRelease(v53);
  }
  if (v60) {
    CFRelease(v60);
  }
  return v21;
}

__CFDictionary *IPSecCreateCiscoDefaultConfiguration(const sockaddr *a1, uint64_t a2, const void *a3, const void *a4, int a5, int a6, int a7, const __CFString *a8, int a9)
{
  int v60 = 1;
  int v61 = 0;
  int v59 = -1;
  CFMutableStringRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (a1->sa_family == 30)
  {
    getnameinfo(a1, a1->sa_len, v62, 0x39u, 0, 0, 10);
    syslog(3, "IPv6 IPSec Address: %s\n", v62);
    char v18 = v62;
    CFStringEncoding v19 = 134217984;
  }
  else
  {
    char v18 = addr2ascii(2, &a1->sa_data[2], 4, 0);
    CFStringEncoding v19 = 1536;
  }
  CFStringRef value = CFStringCreateWithCString(0, v18, v19);
  CFNumberRef v20 = addr2ascii(2, (const void *)(a2 + 4), 4, 0);
  CFStringRef v51 = CFStringCreateWithCString(0, v20, 0x600u);
  signed int valuePtr = bswap32(*(unsigned __int16 *)a1->sa_data) >> 16;
  CFNumberRef v49 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  signed int valuePtr = bswap32(*(unsigned __int16 *)(a2 + 2)) >> 16;
  CFNumberRef v48 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  CFNumberRef v47 = CFNumberCreate(0, kCFNumberIntType, &v61);
  CFNumberRef v46 = CFNumberCreate(0, kCFNumberIntType, &v59);
  if (a6)
  {
    CFNumberRef v44 = 0;
    CFStringRef v21 = @"Obey";
  }
  else
  {
    if (a7) {
      int v22 = &v60;
    }
    else {
      int v22 = &v61;
    }
    CFNumberRef v44 = CFNumberCreate(0, kCFNumberIntType, v22);
    CFStringRef v21 = @"Claim";
  }
  CFNumberRef v45 = CFNumberCreate(0, kCFNumberIntType, &v61);
  CFNumberRef v23 = CFNumberCreate(0, kCFNumberIntType, &v60);
  CFDictionarySetValue(Mutable, @"ModeConfigEnabled", v23);
  CFDictionarySetValue(Mutable, @"XAuthEnabled", v23);
  CFDictionarySetValue(Mutable, @"LocalAddress", value);
  CFDictionarySetValue(Mutable, @"RemoteAddress", v51);
  CFDictionarySetValue(Mutable, @"ProposalsBehavior", v21);
  if (a6 && CFEqual(a4, @"Certificate"))
  {
    if (!a8)
    {
      if (a3)
      {
        CFDictionarySetValue(Mutable, @"RemoteIdentifier", a3);
        a8 = @"UseRemoteIdentifier";
      }
      else
      {
        a8 = @"GenerateFromRemoteAddress";
      }
    }
    CFDictionarySetValue(Mutable, @"IdentifierVerification", a8);
    BOOL IsAggressiveMode = IPSecIsAggressiveMode(a4, a5, a6);
  }
  else
  {
    CFDictionarySetValue(Mutable, @"IdentifierVerification", @"None");
    BOOL IsAggressiveMode = IPSecIsAggressiveMode(a4, a5, a6);
    if (!a6) {
      CFDictionarySetValue(Mutable, @"NattMultipleUsersEnabled", v44);
    }
  }
  CFDictionarySetValue(Mutable, @"DeadPeerDetectionEnabled", v23);
  CFDictionarySetValue(Mutable, @"BlackHoleDetectionEnabled", v23);
  signed int valuePtr = 20;
  CFNumberRef v25 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  if (v25)
  {
    CFNumberRef v26 = v25;
    CFDictionarySetValue(Mutable, @"DeadPeerDetectionDelay", v25);
    CFRelease(v26);
  }
  CFArrayRef theArray = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  signed int valuePtr = 3600;
  CFNumberRef cf = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  *(_OWORD *)CFStringRef v62 = xmmword_2ED40;
  int v27 = 14;
  theDict = Mutable;
  if (IsAggressiveMode)
  {
    if (a9) {
      int v27 = 2;
    }
    else {
      int v27 = 14;
    }
    *(_DWORD *)CFStringRef v62 = v27;
    *(_DWORD *)&v62[4] = 0;
  }
  int v57 = 0;
  signed int valuePtr = v27;
  uint64_t v28 = 4;
  do
  {
    CFNumberRef v29 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    uint64_t v54 = v28;
    if (valuePtr < 5)
    {
      uint64_t v31 = theArray;
    }
    else
    {
      int v30 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(v30, @"EncryptionAlgorithm", @"AES256");
      CFDictionarySetValue(v30, @"HashAlgorithm", @"SHA256");
      CFDictionarySetValue(v30, @"DHGroup", v29);
      CFDictionarySetValue(v30, @"Lifetime", cf);
      uint64_t v31 = theArray;
      CFArraySetValueAtIndex(theArray, v57, v30);
      CFRelease(v30);
      ++v57;
    }
    CFDictionaryRef v32 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(v32, @"EncryptionAlgorithm", @"AES256");
    CFDictionarySetValue(v32, @"HashAlgorithm", @"SHA1");
    CFDictionarySetValue(v32, @"DHGroup", v29);
    CFDictionarySetValue(v32, @"Lifetime", cf);
    CFArraySetValueAtIndex(v31, v57, v32);
    CFRelease(v32);
    int v33 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(v33, @"EncryptionAlgorithm", @"AES256");
    CFDictionarySetValue(v33, @"HashAlgorithm", @"MD5");
    CFDictionarySetValue(v33, @"DHGroup", v29);
    CFDictionarySetValue(v33, @"Lifetime", cf);
    int v34 = v57 + 2;
    CFArraySetValueAtIndex(v31, v57 + 1, v33);
    CFRelease(v33);
    int v35 = valuePtr;
    if (valuePtr < 14)
    {
      v57 += 2;
    }
    else
    {
      CFIndex v36 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(v36, @"EncryptionAlgorithm", @"AES256");
      CFDictionarySetValue(v36, @"HashAlgorithm", @"SHA512");
      CFDictionarySetValue(v36, @"DHGroup", v29);
      CFDictionarySetValue(v36, @"Lifetime", cf);
      v57 += 3;
      CFArraySetValueAtIndex(theArray, v34, v36);
      CFRelease(v36);
      int v35 = valuePtr;
    }
    if (v35 <= 2)
    {
      CFNumberRef v37 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(v37, @"EncryptionAlgorithm", @"AES");
      CFDictionarySetValue(v37, @"HashAlgorithm", @"SHA1");
      CFDictionarySetValue(v37, @"DHGroup", v29);
      CFDictionarySetValue(v37, @"Lifetime", cf);
      CFArraySetValueAtIndex(theArray, v57, v37);
      CFRelease(v37);
      int v38 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(v38, @"EncryptionAlgorithm", @"AES");
      CFDictionarySetValue(v38, @"HashAlgorithm", @"MD5");
      CFDictionarySetValue(v38, @"DHGroup", v29);
      CFDictionarySetValue(v38, @"Lifetime", cf);
      CFArraySetValueAtIndex(theArray, v57 + 1, v38);
      CFRelease(v38);
      long long v39 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(v39, @"EncryptionAlgorithm", @"3DES");
      CFDictionarySetValue(v39, @"HashAlgorithm", @"SHA1");
      CFDictionarySetValue(v39, @"DHGroup", v29);
      CFDictionarySetValue(v39, @"Lifetime", cf);
      CFArraySetValueAtIndex(theArray, v57 + 2, v39);
      CFRelease(v39);
      int v40 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(v40, @"EncryptionAlgorithm", @"3DES");
      CFDictionarySetValue(v40, @"HashAlgorithm", @"MD5");
      CFDictionarySetValue(v40, @"DHGroup", v29);
      CFDictionarySetValue(v40, @"Lifetime", cf);
      CFArraySetValueAtIndex(theArray, v57 + 3, v40);
      CFRelease(v40);
      int v41 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(v41, @"EncryptionAlgorithm", @"DES");
      CFDictionarySetValue(v41, @"HashAlgorithm", @"SHA1");
      CFDictionarySetValue(v41, @"DHGroup", v29);
      CFDictionarySetValue(v41, @"Lifetime", cf);
      int v53 = v57 + 5;
      CFArraySetValueAtIndex(theArray, v57 + 4, v41);
      CFRelease(v41);
      uint64_t v42 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(v42, @"EncryptionAlgorithm", @"DES");
      CFDictionarySetValue(v42, @"HashAlgorithm", @"MD5");
      CFDictionarySetValue(v42, @"DHGroup", v29);
      CFDictionarySetValue(v42, @"Lifetime", cf);
      v57 += 6;
      CFArraySetValueAtIndex(theArray, v53, v42);
      CFRelease(v42);
    }
    CFRelease(v29);
    signed int valuePtr = *(_DWORD *)&v62[v54];
    uint64_t v28 = v54 + 4;
  }
  while (valuePtr);
  CFRelease(cf);
  CFDictionarySetValue(theDict, @"Proposals", theArray);
  CFRelease(theArray);
  CFRelease(value);
  CFRelease(v51);
  CFRelease(v49);
  CFRelease(v48);
  CFRelease(v47);
  CFRelease(v46);
  if (v23) {
    CFRelease(v23);
  }
  if (v45) {
    CFRelease(v45);
  }
  if (!a6) {
    CFRelease(v44);
  }
  return theDict;
}

uint64_t IPSecSelfRepair()
{
  pid_t v0 = racoon_pid();
  if (v0) {
    kill(v0, 15);
  }
  return 0;
}

uint64_t IPSecFlushAll()
{
  int v0 = pfkey_open();
  if ((v0 & 0x80000000) == 0)
  {
    int v1 = v0;
    pfkey_send_spdflush(v0);
    pfkey_send_flush(v1, 0);
    pfkey_close(v1);
  }
  return 0;
}

void IPSecLogVPNInterfaceAddressEvent(uint64_t a1, uint64_t a2, int a3, char *a4, void *a5)
{
  if (a2)
  {
    unsigned int v42 = bswap32(*(_DWORD *)(a2 + 64));
    unsigned int v8 = (char *)*(unsigned int *)(a2 + 20);
    switch((int)v8)
    {
      case 1:
        unsigned int v9 = addr2ascii(2, a5, 4, v46);
        uint64_t v10 = *(unsigned int *)(a2 + 28);
        CFIndex v11 = sub_7928(*(_DWORD *)(a2 + 24));
        __int16 v12 = addr2ascii(2, (const void *)(a2 + 48), 4, v45);
        CFIndex v36 = addr2ascii(2, &v42, 4, v44);
        CFNumberRef v37 = addr2ascii(2, (const void *)(a2 + 72), 4, v43);
        int v34 = v11;
        int v35 = v12;
        CFDictionaryRef v32 = (char *)(a2 + 32);
        uint64_t v33 = v10;
        uint64_t v31 = v9;
        uint64_t v13 = "%s: Address added. previous interface setting (name: %s, address: %s), current interface setting (name: %s"
              "%d, family: %s, address: %s, subnet: %s, destination: %s).";
        goto LABEL_9;
      case 2:
        int v14 = addr2ascii(2, a5, 4, v46);
        uint64_t v15 = *(unsigned int *)(a2 + 28);
        uint64_t v16 = sub_7928(*(_DWORD *)(a2 + 24));
        uint64_t v17 = addr2ascii(2, (const void *)(a2 + 48), 4, v45);
        CFIndex v36 = addr2ascii(2, &v42, 4, v44);
        CFNumberRef v37 = addr2ascii(2, (const void *)(a2 + 72), 4, v43);
        int v34 = v16;
        int v35 = v17;
        CFDictionaryRef v32 = (char *)(a2 + 32);
        uint64_t v33 = v15;
        uint64_t v31 = v14;
        uint64_t v13 = "%s: Address changed. previous interface setting (name: %s, address: %s), current interface setting (name: "
              "%s%d, family: %s, address: %s, subnet: %s, destination: %s).";
        goto LABEL_9;
      case 3:
        char v18 = addr2ascii(2, a5, 4, v46);
        uint64_t v19 = *(unsigned int *)(a2 + 28);
        CFNumberRef v20 = sub_7928(*(_DWORD *)(a2 + 24));
        CFStringRef v21 = addr2ascii(2, (const void *)(a2 + 48), 4, v45);
        CFIndex v36 = addr2ascii(2, &v42, 4, v44);
        CFNumberRef v37 = addr2ascii(2, (const void *)(a2 + 72), 4, v43);
        int v34 = v20;
        int v35 = v21;
        CFDictionaryRef v32 = (char *)(a2 + 32);
        uint64_t v33 = v19;
        uint64_t v31 = v18;
        uint64_t v13 = "%s: Address deleted. previous interface setting (name: %s, address: %s), deleted interface setting (name: "
              "%s%d, family: %s, address: %s, subnet: %s, destination: %s).";
        goto LABEL_9;
      case 7:
        CFNumberRef v26 = addr2ascii(2, a5, 4, v46);
        uint64_t v27 = *(unsigned int *)(a2 + 28);
        uint64_t v28 = sub_7928(*(_DWORD *)(a2 + 24));
        CFNumberRef v29 = addr2ascii(2, (const void *)(a2 + 48), 4, v45);
        uint64_t v40 = *(unsigned __int8 *)(a2 + 54);
        uint64_t v41 = *(unsigned __int8 *)(a2 + 53);
        int v38 = (char *)*(unsigned __int8 *)(a2 + 56);
        uint64_t v39 = *(unsigned __int8 *)(a2 + 55);
        CFIndex v36 = (char *)*(unsigned __int8 *)(a2 + 58);
        CFNumberRef v37 = (char *)*(unsigned __int8 *)(a2 + 57);
        int v34 = v28;
        int v35 = v29;
        CFDictionaryRef v32 = (char *)(a2 + 32);
        uint64_t v33 = v27;
        uint64_t v31 = v26;
        uint64_t v13 = "%s: ARP collided. previous interface setting (name: %s, address: %s), conflicting interface setting (name:"
              " %s%d, family: %s, address: %s, mac: %x:%x:%x:%x:%x:%x).";
LABEL_9:
        int v30 = a4;
        break;
      default:
        int v22 = addr2ascii(2, a5, 4, v46);
        CFNumberRef v23 = (char *)*(unsigned int *)(a2 + 28);
        CFStringRef v24 = sub_7928(*(_DWORD *)(a2 + 24));
        CFNumberRef v25 = addr2ascii(2, (const void *)(a2 + 48), 4, v45);
        CFNumberRef v37 = addr2ascii(2, &v42, 4, v44);
        int v38 = addr2ascii(2, (const void *)(a2 + 72), 4, v43);
        int v35 = v24;
        CFIndex v36 = v25;
        uint64_t v33 = a2 + 32;
        int v34 = v23;
        uint64_t v31 = a4;
        CFDictionaryRef v32 = v22;
        uint64_t v13 = "%s: Unknown Address event (%d). previous interface setting (name: %s, address: %s), other interface settin"
              "g (name: %s%d, family: %s, address: %s, subnet: %s, destination: %s).";
        int v30 = v8;
        break;
    }
    syslog(5, v13, a1, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39, v40, v41);
  }
  else
  {
    addr2ascii(2, a5, 4, v46);
    syslog(5, "%s: %d secs TIMEOUT waiting for interface to be reconfigured. previous setting (name: %s, address: %s).");
  }
}

char *sub_7928(int a1)
{
  if ((a1 - 1) < 0xE) {
    return off_391F8[a1 - 1];
  }
  int v1 = byte_40510;
  snprintf(byte_40510, 0x10uLL, "%d", a1);
  return v1;
}

void update_service_route(uint64_t a1, int a2, int a3, int a4, int a5, int a6, __int16 a7, int a8)
{
  uint64_t v16 = *(_DWORD **)(a1 + 1048);
  if (v16)
  {
    while (v16[2] != a2 || v16[3] != a3 || v16[4] != a4 || v16[5] != a5)
    {
      uint64_t v16 = *(_DWORD **)v16;
      if (!v16) {
        goto LABEL_7;
      }
    }
    goto LABEL_9;
  }
LABEL_7:
  uint64_t v16 = malloc_type_calloc(1uLL, 0x28uLL, 0x10200400D048FD2uLL);
  if (v16)
  {
    v16[2] = a2;
    v16[3] = a3;
    v16[4] = a4;
    v16[5] = a5;
    *(void *)uint64_t v16 = *(void *)(a1 + 1048);
    *(void *)(a1 + 1048) = v16;
LABEL_9:
    v16[6] = a6;
    *((_WORD *)v16 + 14) = a7;
    v16[8] = a8;
    return;
  }
  syslog(3, "%s: no memory\n", "update_service_route");
}

void *free_service_routes(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 1048);
  if (result)
  {
    do
    {
      size_t v3 = (void *)*result;
      free(result);
      uint64_t result = v3;
    }
    while (v3);
  }
  *(void *)(a1 + 1048) = 0;
  return result;
}

uint64_t find_injection(const __CFString *a1, const __CFString *a2, uint64_t a3)
{
  if (!(unint64_t)CFStringFind(a1, @"\"", 0).length)
  {
    CFRange v6 = CFStringFind(a1, @";", 0);
    if (!v6.length
      || (v10.location = v6.location + v6.length,
          v10.length = a3 - (v6.location + v6.length),
          !CFStringFindWithOptions(a1, a2, v10, 0, 0)))
    {
      CFRange v7 = CFStringFind(a1, a2, 0);
      if (!v7.length) {
        return 0;
      }
      v11.location = v7.location + v7.length;
      v11.length = a3 - (v7.location + v7.length);
      if (!CFStringFindWithOptions(a1, @";", v11, 0, 0)) {
        return 0;
      }
    }
  }
  uint64_t v8 = 1;
  SCLog();
  return v8;
}

uint64_t racoon_validate_cfg_str(char *cStr)
{
  CFStringRef v1 = CFStringCreateWithCString(0, cStr, 0x8000100u);
  CFStringRef v2 = v1;
  if (!v1
    || (CFIndex Length = CFStringGetLength(v1), find_injection(v2, @"include ", Length))
    || find_injection(v2, @"privsep ", Length)
    || find_injection(v2, @"path ", Length)
    || find_injection(v2, @"timer ", Length)
    || find_injection(v2, @"listen ", Length)
    || find_injection(v2, @"remote ", Length)
    || find_injection(v2, @"sainfo ", Length)
    || find_injection(v2, @"banner ", Length)
    || find_injection(v2, @"my_identifier ", Length)
    || find_injection(v2, @"peers_identifier ", Length))
  {
    CFRelease(v2);
    return 0;
  }
  else
  {
    CFRelease(v2);
    return 1;
  }
}

uint64_t sub_7D04(FILE *a1, const __CFDictionary *a2, const char **a3)
{
  __strlcpy_chk();
  if (a2)
  {
    CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(a2, @"EncryptionAlgorithm");
    if (isArray(Value))
    {
      CFIndex Count = CFArrayGetCount(Value);
      if (Count >= 1)
      {
        CFIndex v7 = Count;
        uint64_t v8 = 0;
        for (CFIndex i = 0; i != v7; ++i)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(Value, i);
          if (isString(ValueAtIndex))
          {
            if (v8) {
              __strlcat_chk();
            }
            if (!CFEqual(ValueAtIndex, @"DES")
              && !CFEqual(ValueAtIndex, @"3DES")
              && !CFEqual(ValueAtIndex, @"AES")
              && !CFEqual(ValueAtIndex, @"AES256"))
            {
              CFStringRef v24 = "incorrect encryption algorithm";
LABEL_51:
              *a3 = v24;
              return 0xFFFFFFFFLL;
            }
            __strlcat_chk();
            uint64_t v8 = 1;
          }
        }
        if (v8) {
          goto LABEL_16;
        }
      }
    }
  }
  __strlcat_chk();
LABEL_16:
  __strlcat_chk();
  fprintf(a1, "%s%s", off_40008[0], __str);
  __strlcpy_chk();
  if (a2)
  {
    CFArrayRef v11 = (const __CFArray *)CFDictionaryGetValue(a2, @"HashAlgorithm");
    if (isArray(v11))
    {
      CFIndex v12 = CFArrayGetCount(v11);
      if (v12 >= 1)
      {
        CFIndex v13 = v12;
        uint64_t v14 = 0;
        for (CFIndex j = 0; j != v13; ++j)
        {
          uint64_t v16 = CFArrayGetValueAtIndex(v11, j);
          if (isString(v16))
          {
            if (v14) {
              __strlcat_chk();
            }
            if (!CFEqual(v16, @"SHA512")
              && !CFEqual(v16, @"SHA256")
              && !CFEqual(v16, @"SHA1")
              && !CFEqual(v16, @"MD5"))
            {
              CFStringRef v24 = "incorrect authentication algorithm";
              goto LABEL_51;
            }
            __strlcat_chk();
            uint64_t v14 = 1;
          }
        }
        if (v14) {
          goto LABEL_31;
        }
      }
    }
  }
  __strlcat_chk();
LABEL_31:
  __strlcat_chk();
  fprintf(a1, "%s%s", off_40008[0], __str);
  __strlcpy_chk();
  if (a2)
  {
    CFArrayRef v17 = (const __CFArray *)CFDictionaryGetValue(a2, @"CompressionAlgorithm");
    if (isArray(v17))
    {
      CFIndex v18 = CFArrayGetCount(v17);
      if (v18 >= 1)
      {
        CFIndex v19 = v18;
        uint64_t v20 = 0;
        for (CFIndex k = 0; k != v19; ++k)
        {
          int v22 = CFArrayGetValueAtIndex(v17, k);
          if (isString(v22))
          {
            if (v20) {
              __strlcat_chk();
            }
            if (!CFEqual(v22, @"Deflate"))
            {
              CFStringRef v24 = "incorrect compression algorithm";
              goto LABEL_51;
            }
            __strlcat_chk();
            uint64_t v20 = 1;
          }
        }
        if (v20) {
          goto LABEL_43;
        }
      }
    }
  }
  __strlcat_chk();
LABEL_43:
  __strlcat_chk();
  fprintf(a1, "%s%s", off_40008[0], __str);
  int v26 = 3600;
  if (a2)
  {
    GetIntFromDict(a2, @"Lifetime", &v26, 3600);
    snprintf(__str, 0x400uLL, "lifetime time %d sec;\n", v26);
    fprintf(a1, "%s%s", off_40008[0], __str);
    int v26 = 0;
    if (GetIntFromDict(a2, @"PFSGroup", &v26, 0))
    {
      if (v26)
      {
        snprintf(__str, 0x400uLL, "pfs_group %d;\n", v26);
        fprintf(a1, "%s%s", off_40008[0], __str);
      }
    }
  }
  else
  {
    snprintf(__str, 0x400uLL, "lifetime time %d sec;\n", 3600);
    fprintf(a1, "%s%s", off_40008[0], __str);
  }
  return 0;
}

uint64_t sub_82A8(const __CFData *a1, uint64_t a2)
{
  BytePtr = CFDataGetBytePtr(a1);
  CFIndex Length = CFDataGetLength(a1);
  if (Length / 3 + Length + Length % 3 > 1023) {
    return 0;
  }
  unint64_t v7 = Length;
  if (Length < 1)
  {
    uint64_t result = 0;
    goto LABEL_20;
  }
  uint64_t result = 0;
  unint64_t v8 = 0;
  unint64_t v9 = v7;
  do
  {
    unint64_t v10 = v8 % 3;
    if (v8 % 3 == 2)
    {
      uint64_t v12 = result + 1;
      *(unsigned char *)(a2 + result) = aAbcdefghijklmn[((unint64_t)(*BytePtr | (*(BytePtr - 1) << 8)) >> 6) & 0x3F];
      unint64_t v11 = *BytePtr & 0x3F;
      uint64_t v13 = 2;
    }
    else
    {
      if (v10 == 1)
      {
        unint64_t v11 = ((unint64_t)(*BytePtr | (*(BytePtr - 1) << 8)) >> 4) & 0x3F;
      }
      else
      {
        if (v10) {
          goto LABEL_13;
        }
        unint64_t v11 = (unint64_t)*BytePtr >> 2;
      }
      uint64_t v13 = 1;
      uint64_t v12 = result;
    }
    result += v13;
    *(unsigned char *)(a2 + v12) = aAbcdefghijklmn[v11];
LABEL_13:
    ++v8;
    ++BytePtr;
    --v9;
  }
  while (v9);
  unint64_t v14 = v7 % 3;
  if (v14 == 2)
  {
    char v16 = aAbcdefghijklmn[4 * (*(BytePtr - 1) & 0xF)];
    uint64_t v17 = 2;
    uint64_t v18 = 1;
    uint64_t v15 = result;
LABEL_19:
    uint64_t v19 = result + v18;
    *(unsigned char *)(a2 + v15) = v16;
    result += v17;
    *(unsigned char *)(a2 + v19) = 61;
  }
  else if (v14 == 1)
  {
    uint64_t v15 = result + 1;
    *(unsigned char *)(a2 + result) = aAbcdefghijklmn[16 * (*(BytePtr - 1) & 3)];
    char v16 = 61;
    uint64_t v17 = 3;
    uint64_t v18 = 2;
    goto LABEL_19;
  }
LABEL_20:
  *(unsigned char *)(a2 + result) = 0;
  return result;
}

char *sub_8458(unsigned int a1, unsigned int a2)
{
  unsigned int v3 = bswap32(a1);
  if ((v3 & 0xFFFFFF) != 0)
  {
    if ((_WORD)v3)
    {
      if ((_BYTE)v3) {
        snprintf(byte_40410, 0x100uLL, "%u.%u.%u.%u");
      }
      else {
        snprintf(byte_40410, 0x100uLL, "%u.%u.%u");
      }
    }
    else
    {
      snprintf(byte_40410, 0x100uLL, "%u.%u");
    }
  }
  else
  {
    snprintf(byte_40410, 0x100uLL, "%u");
  }
  uint64_t result = &byte_40410[strlen(byte_40410)];
  if (a2)
  {
    int v5 = 0;
    unsigned int v6 = bswap32(a2);
    while (((v6 >> v5) & 1) == 0)
    {
      if (++v5 == 32) {
        return (char *)snprintf(result, 8uLL, "/%d");
      }
    }
    int v7 = v5;
    while (v7 != 31)
    {
      unsigned int v8 = v6 >> v7++;
      if ((v8 & 2) == 0) {
        return (char *)snprintf(result, 8uLL, "&0x%x");
      }
    }
    return (char *)snprintf(result, 8uLL, "/%d");
  }
  else
  {
    char *result = 0;
  }
  return result;
}

uint64_t scnc_cache_routing_table(uint64_t a1, const __CFDictionary *a2, int a3, int a4)
{
  if (qword_40528 != -1) {
    dispatch_once(&qword_40528, &stru_39348);
  }
  unsigned int v8 = (const __SCPreferences *)qword_40520;
  if (!qword_40520) {
    return 0;
  }
  CFDictionaryRef Value = (const __CFDictionary *)SCPreferencesGetValue((SCPreferencesRef)qword_40520, *(CFStringRef *)(a1 + 24));
  CFTypeID TypeID = CFDictionaryGetTypeID();
  if (Value && CFGetTypeID(Value) == TypeID) {
    CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, Value);
  }
  else {
    CFDictionaryRef MutableCopy = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  CFDictionaryRef v12 = MutableCopy;
  if (!MutableCopy) {
    return 0;
  }
  if (a3) {
    CFStringRef v13 = kSCEntNetIPv4;
  }
  else {
    CFStringRef v13 = 0;
  }
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 0x40000000;
  v19[2] = sub_8A9C;
  v19[3] = &unk_392A8;
  char v20 = a4;
  char v21 = a3;
  if (a3) {
    CFStringRef v14 = kSCEntNetIPv6;
  }
  else {
    CFStringRef v14 = 0;
  }
  sub_87DC(MutableCopy, a2, a4, @"IPv4", v13, (uint64_t)v19);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 0x40000000;
  v16[2] = sub_8E0C;
  v16[3] = &unk_39308;
  char v17 = a4;
  char v18 = a3;
  sub_87DC(v12, a2, a4, @"IPv6", v14, (uint64_t)v16);
  if (my_CFEqual((unint64_t)Value, (unint64_t)v12))
  {
    CFRelease(v12);
    return 0;
  }
  SCPreferencesSetValue(v8, *(CFStringRef *)(a1 + 24), v12);
  SCPreferencesCommitChanges(v8);
  SCPreferencesApplyChanges(v8);
  my_CFRelease((const void **)(a1 + 504));
  *(void *)(a1 + 504) = v12;
  return 1;
}

void sub_87DC(CFDictionaryRef theDict, const __CFDictionary *a2, int a3, void *key, const void *a5, uint64_t a6)
{
  if (a6)
  {
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, key);
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (a2 && CFGetTypeID(a2) == TypeID)
    {
      if (a5) {
        CFStringRef v14 = a5;
      }
      else {
        CFStringRef v14 = key;
      }
      uint64_t v15 = CFDictionaryGetValue(a2, v14);
      CFTypeID v16 = CFDictionaryGetTypeID();
      if (v15)
      {
        BOOL v17 = CFGetTypeID(v15) == v16;
        if (a3) {
          goto LABEL_31;
        }
LABEL_12:
        if (!v17)
        {
          if (!Value) {
            return;
          }
LABEL_35:
          CFDictionaryRemoveValue(theDict, key);
          return;
        }
LABEL_31:
        CFTypeID v23 = CFDictionaryGetTypeID();
        if (Value && CFGetTypeID(Value) == v23) {
          CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, Value);
        }
        else {
          CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        }
        CFMutableDictionaryRef v25 = MutableCopy;
        if (MutableCopy)
        {
          (*(void (**)(uint64_t, CFMutableDictionaryRef, const void *))(a6 + 16))(a6, MutableCopy, v15);
          if (CFDictionaryGetCount(v25) < 1)
          {
            if (Value) {
              CFDictionaryRemoveValue(theDict, key);
            }
          }
          else if (!my_CFEqual((unint64_t)Value, (unint64_t)v25))
          {
            CFDictionarySetValue(theDict, key, v25);
          }
          CFRelease(v25);
        }
        return;
      }
    }
    else
    {
      CFDictionaryGetTypeID();
      uint64_t v15 = 0;
    }
    BOOL v17 = 0;
    if (a3) {
      goto LABEL_31;
    }
    goto LABEL_12;
  }
  CFTypeID v18 = CFDictionaryGetTypeID();
  if (!a2
    || CFGetTypeID(a2) != v18
    || (a5 ? (uint64_t v19 = a5) : (uint64_t v19 = key),
        (char v20 = CFDictionaryGetValue(a2, v19)) == 0
     || (char v21 = v20, v22 = CFGetTypeID(v20), v22 != CFArrayGetTypeID())
     && v22 != CFBooleanGetTypeID()
     && v22 != CFDataGetTypeID()
     && v22 != CFDateGetTypeID()
     && v22 != CFDictionaryGetTypeID()
     && v22 != CFNumberGetTypeID()
     && v22 != CFStringGetTypeID()))
  {
    if (!CFDictionaryContainsKey(theDict, key)) {
      return;
    }
    goto LABEL_35;
  }

  CFDictionarySetValue(theDict, key, v21);
}

void sub_8A9C(uint64_t a1, CFDictionaryRef theDict, const __CFDictionary *a3)
{
  int v6 = *(unsigned __int8 *)(a1 + 32);
  char v7 = *(unsigned char *)(a1 + 33);
  if (v7) {
    unsigned int v8 = (const void *)kSCPropNetIPv4IncludedRoutes;
  }
  else {
    unsigned int v8 = 0;
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 0x40000000;
  v13[2] = sub_8BD0;
  v13[3] = &unk_39268;
  char v14 = v6;
  char v15 = v7;
  sub_87DC(theDict, a3, v6, @"IncludedRoutes", v8, (uint64_t)v13);
  char v9 = *(unsigned char *)(a1 + 33);
  if (v9) {
    unint64_t v10 = (const void *)kSCPropNetIPv4ExcludedRoutes;
  }
  else {
    unint64_t v10 = 0;
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 0x40000000;
  v11[2] = sub_8D68;
  v11[3] = &unk_39288;
  char v12 = v9;
  sub_87DC(theDict, a3, 0, @"ExcludedRoutes", v10, (uint64_t)v11);
}

void sub_8BD0(uint64_t a1, CFDictionaryRef theDict, const __CFDictionary *a3)
{
  if (*(unsigned char *)(a1 + 32))
  {
    *(_DWORD *)bytes = 0;
    CFDataRef v4 = CFDataCreate(kCFAllocatorDefault, bytes, 4);
    CFDataRef v13 = v4;
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    int v6 = Mutable;
    CFMutableDictionaryRef v12 = Mutable;
    if (v4) {
      BOOL v7 = Mutable == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (!v7)
    {
      CFDictionaryAddValue(Mutable, @"Addresses", v4);
      CFDictionaryAddValue(v6, @"Masks", v4);
    }
    sub_87DC(theDict, v6, 0, @"Addresses", 0, 0);
    sub_87DC(theDict, v6, 0, @"Masks", 0, 0);
    my_CFRelease((const void **)&v12);
    my_CFRelease((const void **)&v13);
  }
  else
  {
    if (*(unsigned char *)(a1 + 33)) {
      unint64_t v10 = (const void *)kSCPropNetIPv4RouteDestinationAddress;
    }
    else {
      unint64_t v10 = 0;
    }
    sub_87DC(theDict, a3, 0, @"Addresses", v10, 0);
    if (*(unsigned char *)(a1 + 33)) {
      unint64_t v11 = (const void *)kSCPropNetIPv4RouteSubnetMask;
    }
    else {
      unint64_t v11 = 0;
    }
    sub_87DC(theDict, a3, 0, @"Masks", v11, 0);
  }
}

void sub_8D68(uint64_t a1, CFDictionaryRef theDict, const __CFDictionary *a3)
{
  if (*(unsigned char *)(a1 + 32)) {
    int v6 = (const void *)kSCPropNetIPv4RouteDestinationAddress;
  }
  else {
    int v6 = 0;
  }
  sub_87DC(theDict, a3, 0, @"Addresses", v6, 0);
  BOOL v7 = (void *)kSCPropNetIPv4RouteSubnetMask;
  if (*(unsigned char *)(a1 + 32)) {
    CFStringRef v8 = @"Masks";
  }
  else {
    CFStringRef v8 = 0;
  }

  sub_87DC(theDict, a3, 0, v7, v8, 0);
}

void sub_8E0C(uint64_t a1, CFDictionaryRef theDict, const __CFDictionary *a3)
{
  int v6 = *(unsigned __int8 *)(a1 + 32);
  char v7 = *(unsigned char *)(a1 + 33);
  if (v7) {
    CFStringRef v8 = (const void *)kSCPropNetIPv6IncludedRoutes;
  }
  else {
    CFStringRef v8 = 0;
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 0x40000000;
  v13[2] = sub_8F40;
  v13[3] = &unk_392C8;
  char v14 = v6;
  char v15 = v7;
  sub_87DC(theDict, a3, v6, @"IncludedRoutes", v8, (uint64_t)v13);
  char v9 = *(unsigned char *)(a1 + 33);
  if (v9) {
    unint64_t v10 = (const void *)kSCPropNetIPv6ExcludedRoutes;
  }
  else {
    unint64_t v10 = 0;
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 0x40000000;
  v11[2] = sub_90D8;
  v11[3] = &unk_392E8;
  char v12 = v9;
  sub_87DC(theDict, a3, 0, @"ExcludedRoutes", v10, (uint64_t)v11);
}

void sub_8F40(uint64_t a1, CFDictionaryRef theDict, const __CFDictionary *a3)
{
  if (*(unsigned char *)(a1 + 32))
  {
    *(void *)bytes = 0;
    uint64_t v15 = 0;
    CFDataRef v4 = CFDataCreate(kCFAllocatorDefault, bytes, 16);
    CFDataRef v13 = v4;
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    int v6 = Mutable;
    CFMutableDictionaryRef v12 = Mutable;
    if (v4) {
      BOOL v7 = Mutable == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (!v7)
    {
      CFDictionaryAddValue(Mutable, @"Addresses", v4);
      CFDictionaryAddValue(v6, @"Masks", v4);
    }
    sub_87DC(theDict, v6, 0, @"Addresses", 0, 0);
    sub_87DC(theDict, v6, 0, @"Masks", 0, 0);
    my_CFRelease((const void **)&v12);
    my_CFRelease((const void **)&v13);
  }
  else
  {
    if (*(unsigned char *)(a1 + 33)) {
      unint64_t v10 = (const void *)kSCPropNetIPv6RouteDestinationAddress;
    }
    else {
      unint64_t v10 = 0;
    }
    sub_87DC(theDict, a3, 0, @"Addresses", v10, 0);
    if (*(unsigned char *)(a1 + 33)) {
      unint64_t v11 = (const void *)kSCPropNetIPv6RoutePrefixLength;
    }
    else {
      unint64_t v11 = 0;
    }
    sub_87DC(theDict, a3, 0, @"Masks", v11, 0);
  }
}

void sub_90D8(uint64_t a1, CFDictionaryRef theDict, const __CFDictionary *a3)
{
  if (*(unsigned char *)(a1 + 32)) {
    int v6 = (const void *)kSCPropNetIPv6RouteDestinationAddress;
  }
  else {
    int v6 = 0;
  }
  sub_87DC(theDict, a3, 0, @"Addresses", v6, 0);
  if (*(unsigned char *)(a1 + 32)) {
    BOOL v7 = (const void *)kSCPropNetIPv6RoutePrefixLength;
  }
  else {
    BOOL v7 = 0;
  }

  sub_87DC(theDict, a3, 0, @"Masks", v7, 0);
}

CFTypeRef scnc_cache_init_service(uint64_t a1)
{
  if (qword_40528 != -1) {
    dispatch_once(&qword_40528, &stru_39348);
  }
  if (qword_40520) {
    CFPropertyListRef Value = SCPreferencesGetValue((SCPreferencesRef)qword_40520, *(CFStringRef *)(a1 + 24));
  }
  else {
    CFPropertyListRef Value = 0;
  }
  my_CFRelease((const void **)(a1 + 504));
  CFTypeRef result = my_CFRetain(Value);
  *(void *)(a1 + 504) = result;
  return result;
}

void scnc_cache_flush_removed_services(const __CFArray *a1)
{
  if (qword_40528 != -1) {
    dispatch_once(&qword_40528, &stru_39348);
  }
  CFStringRef v2 = (const __SCPreferences *)qword_40520;
  CFArrayRef v3 = SCPreferencesCopyKeyList((SCPreferencesRef)qword_40520);
  CFArrayRef v11 = v3;
  CFIndex Count = CFArrayGetCount(v3);
  CFIndex v5 = CFArrayGetCount(a1);
  if (Count <= 0)
  {
    my_CFRelease((const void **)&v11);
  }
  else
  {
    CFIndex v6 = v5;
    CFIndex v7 = 0;
    int v8 = 0;
    do
    {
      CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v3, v7);
      unint64_t v10 = CFArrayGetValueAtIndex(v3, v7);
      v12.location = 0;
      v12.length = v6;
      if (!CFArrayContainsValue(a1, v12, v10))
      {
        SCPreferencesRemoveValue(v2, ValueAtIndex);
        int v8 = 1;
      }
      ++v7;
    }
    while (Count != v7);
    my_CFRelease((const void **)&v11);
    if (v8)
    {
      SCPreferencesCommitChanges(v2);
      SCPreferencesApplyChanges(v2);
    }
  }
}

void sub_9314(id a1)
{
  CFStringRef v1 = SCPreferencesCreate(kCFAllocatorDefault, @"PPPController", @"com.apple.scnc-cache.plist");
  qword_40520 = (uint64_t)v1;
  if (!v1)
  {
    int v2 = SCError();
    SCErrorString(v2);
    SCLog();
    CFStringRef v1 = (const __SCPreferences *)qword_40520;
  }

  SCPreferencesSynchronize(v1);
}

uint64_t ipsec_check_keylen(int a1, int a2, unsigned int a3)
{
  int v5 = 2;
  if (a1 != 14)
  {
    if (a1 != 15) {
      goto LABEL_6;
    }
    int v5 = 3;
  }
  CFIndex v6 = sub_9484(v5, a2);
  if (v6)
  {
    CFIndex v7 = v6;
    unsigned int v8 = *((unsigned __int16 *)v6 + 1);
    int v5 = 14;
    if (v8 <= a3)
    {
      unsigned int v10 = *((unsigned __int16 *)v7 + 2);
      if (v10 >= a3) {
        int v5 = 0;
      }
      else {
        int v5 = 14;
      }
      if (v10 >= a3) {
        uint64_t v9 = 0;
      }
      else {
        uint64_t v9 = 0xFFFFFFFFLL;
      }
      goto LABEL_14;
    }
LABEL_6:
    uint64_t v9 = 0xFFFFFFFFLL;
LABEL_14:
    __ipsec_errcode = v5;
    return v9;
  }
  return 0xFFFFFFFFLL;
}

uint64_t ipsec_check_keylen2(int a1, int a2, unsigned int a3)
{
  CFDataRef v4 = sub_9484(a1, a2);
  if (!v4) {
    return 0xFFFFFFFFLL;
  }
  int v5 = 14;
  if (*((unsigned __int16 *)v4 + 1) <= a3)
  {
    unsigned int v7 = *((unsigned __int16 *)v4 + 2);
    if (v7 >= a3) {
      int v5 = 0;
    }
    else {
      int v5 = 14;
    }
    if (v7 >= a3) {
      uint64_t result = 0;
    }
    else {
      uint64_t result = 0xFFFFFFFFLL;
    }
  }
  else
  {
    uint64_t result = 0xFFFFFFFFLL;
  }
  __ipsec_errcode = v5;
  return result;
}

unsigned __int8 *sub_9484(int a1, int a2)
{
  uint64_t v2 = 0;
  while (dword_2ED58[v2] != a1)
  {
    if (++v2 == 3) {
      goto LABEL_6;
    }
  }
  if (v2 == 0xFFFFFFFFLL)
  {
LABEL_6:
    int v3 = 2;
LABEL_7:
    uint64_t result = 0;
    __ipsec_errcode = v3;
    return result;
  }
  int v5 = (unsigned __int16 *)qword_40530[v2];
  if (!v5)
  {
    int v3 = 22;
    goto LABEL_7;
  }
  unsigned int v6 = *v5;
  if (v6 < 0x10)
  {
LABEL_14:
    int v3 = 1;
    goto LABEL_7;
  }
  uint64_t result = (unsigned __int8 *)(v5 + 4);
  int v7 = v6 + 8;
  while (*result != a2)
  {
    result += 8;
    v7 -= 8;
    if (v7 <= 23) {
      goto LABEL_14;
    }
  }
  return result;
}

uint64_t ipsec_get_keylen(int a1, int a2, void *a3)
{
  if (a3)
  {
    int v5 = 2;
    if (a1 != 14)
    {
      if (a1 != 15)
      {
        uint64_t v8 = 0xFFFFFFFFLL;
        goto LABEL_9;
      }
      int v5 = 3;
    }
    unsigned int v6 = sub_9484(v5, a2);
    if (!v6) {
      return 0xFFFFFFFFLL;
    }
    int v7 = v6;
    int v5 = 0;
    uint64_t v8 = 0;
    *a3 = *(void *)v7;
  }
  else
  {
    uint64_t v8 = 0xFFFFFFFFLL;
    int v5 = 2;
  }
LABEL_9:
  __ipsec_errcode = v5;
  return v8;
}

uint64_t pfkey_set_softrate(int a1, int a2)
{
  __ipsec_errcode = 0;
  if ((a2 - 101) >= 0xFFFFFF9C) {
    int v2 = a2;
  }
  else {
    int v2 = 100;
  }
  switch(a1)
  {
    case 0:
      uint64_t result = 0;
      dword_40020 = v2;
      break;
    case 1:
      uint64_t result = 0;
      dword_40024 = v2;
      break;
    case 2:
      uint64_t result = 0;
      dword_40028 = v2;
      break;
    case 3:
      uint64_t result = 0;
      dword_4002C = v2;
      break;
    default:
      __ipsec_errcode = 2;
      uint64_t result = 1;
      break;
  }
  return result;
}

uint64_t pfkey_get_softrate(int a1)
{
  switch(a1)
  {
    case 0:
      uint64_t result = dword_40020;
      break;
    case 1:
      uint64_t result = dword_40024;
      break;
    case 2:
      uint64_t result = dword_40028;
      break;
    case 3:
      uint64_t result = dword_4002C;
      break;
    default:
      uint64_t result = 0xFFFFFFFFLL;
      break;
  }
  return result;
}

uint64_t pfkey_send_getspi(int a1, char a2, char a3, unsigned __int8 *a4, unsigned __int8 *a5, unsigned int a6, unsigned int a7, int a8, int a9)
{
  if (a4 && a5)
  {
    int v11 = a4[1];
    if (v11 == a5[1])
    {
      if (a6 > a7 || a6 - 1 <= 0xFE)
      {
        SCLog();
        int v19 = 18;
      }
      else
      {
        if (v11 == 2)
        {
          char v18 = 32;
LABEL_13:
          char v34 = v18;
          BOOL v20 = a6 < 0x100 || a7 == -1;
          char v21 = v20;
          char v33 = v21;
          if (v20) {
            uint64_t v22 = 50;
          }
          else {
            uint64_t v22 = 66;
          }
          size_t v23 = ((*a4 - 1) | 7) + ((*a5 - 1) | 7) + v22;
          CFStringRef v24 = malloc_type_calloc(1uLL, v23, 0xB13DC911uLL);
          if (!v24)
          {
            CFNumberRef v29 = __error();
            strerror(*v29);
            __ipsec_set_strerror();
LABEL_41:
            SCLog();
            return 0xFFFFFFFFLL;
          }
          CFMutableDictionaryRef v25 = v24;
          pid_t v26 = getpid();
          if ((int)v23 > 15)
          {
            *CFMutableDictionaryRef v25 = 0;
            v25[1] = 0;
            *(_WORD *)CFMutableDictionaryRef v25 = 258;
            *((unsigned char *)v25 + 2) = 0;
            *((unsigned char *)v25 + 3) = a2;
            *((_DWORD *)v25 + 1) = (unsigned __int16)(v23 >> 3);
            *((_DWORD *)v25 + 2) = a9;
            *((_DWORD *)v25 + 3) = v26;
            if (v23 > 0x1F)
            {
              unint64_t v30 = (unint64_t)v25 + v23;
              v25[2] = 0;
              v25[3] = 0;
              *((_DWORD *)v25 + 4) = 1245186;
              *((unsigned char *)v25 + 20) = a3;
              *((_DWORD *)v25 + 7) = a8;
              uint64_t v31 = sub_9A9C((_WORD *)v25 + 16, (unint64_t)v25 + v23, 5, a4, v34, 255);
              if (v31)
              {
                CFDictionaryRef v32 = sub_9A9C(v31, (unint64_t)v25 + v23, 6, a5, v34, 255);
                if (v32)
                {
                  if ((v33 & 1) == 0)
                  {
                    if ((unint64_t)(v32 + 16) > v30) {
                      goto LABEL_40;
                    }
                    *(_DWORD *)CFDictionaryRef v32 = 1048578;
                    *((_DWORD *)v32 + 1) = a6;
                    *((_DWORD *)v32 + 2) = a7;
                    *((_DWORD *)v32 + 3) = 0;
                    v32 += 16;
                  }
                  if (v32 == (char *)v30)
                  {
                    ssize_t v27 = pfkey_send(a1, v25, v23);
                    free(v25);
                    if ((v27 & 0x80000000) == 0)
                    {
                      __ipsec_errcode = 0;
                      return v27;
                    }
                    goto LABEL_41;
                  }
                }
              }
            }
          }
LABEL_40:
          free(v25);
          goto LABEL_41;
        }
        if (v11 == 30)
        {
          char v18 = 0x80;
          goto LABEL_13;
        }
        SCLog();
        int v19 = 15;
      }
    }
    else
    {
      SCLog();
      int v19 = 24;
    }
  }
  else
  {
    SCLog();
    int v19 = 2;
  }
  __ipsec_errcode = v19;
  return 0xFFFFFFFFLL;
}

char *sub_9A9C(_WORD *a1, unint64_t a2, __int16 a3, unsigned __int8 *a4, char a5, char a6)
{
  int v6 = (*a4 - 1) | 7;
  uint64_t v7 = (v6 + 9);
  uint64_t v8 = (char *)a1 + v7;
  if ((unint64_t)a1 + v7 > a2) {
    return 0;
  }
  bzero(a1, (v6 + 9));
  *a1 = v7 >> 3;
  a1[1] = a3;
  *((unsigned char *)a1 + 4) = a6;
  *((unsigned char *)a1 + 5) = a5;
  a1[3] = 0;
  memcpy(a1 + 4, a4, *a4);
  return v8;
}

ssize_t pfkey_send(int a1, const void *a2, int a3)
{
  ssize_t result = send(a1, a2, a3, 0);
  if ((result & 0x80000000) != 0)
  {
    CFDataRef v4 = __error();
    strerror(*v4);
    __ipsec_set_strerror();
    return 0xFFFFFFFFLL;
  }
  else
  {
    __ipsec_errcode = 0;
  }
  return result;
}

uint64_t pfkey_send_update(int a1, int a2, char a3, unsigned __int8 *a4, unsigned __int8 *a5, int a6, int a7, char a8, char *a9, int a10, unsigned int a11, int a12, unsigned int a13, int a14, int a15, unsigned int a16, int a17, unsigned int a18, int a19, unsigned int a20,int a21,int a22)
{
  return sub_9BE0(a1, 2, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a18, a20, a22);
}

uint64_t sub_9BE0(int a1, char a2, int a3, char a4, unsigned __int8 *a5, unsigned __int8 *a6, int a7, int a8, char a9, char *a10, int a11, unsigned int a12, int a13, unsigned int a14, int a15, int a16, unsigned int a17, unsigned int a18, unsigned int a19, int a20)
{
  if (!a5 || !a6)
  {
    SCLog();
    int v30 = 2;
    goto LABEL_37;
  }
  int v22 = a5[1];
  if (v22 != a6[1])
  {
    SCLog();
    int v30 = 24;
    goto LABEL_37;
  }
  char v26 = a3;
  if (v22 == 2)
  {
    char v29 = 32;
  }
  else
  {
    if (v22 != 30)
    {
      SCLog();
      int v30 = 15;
      goto LABEL_37;
    }
    char v29 = 0x80;
  }
  switch(a3)
  {
    case 2:
      if (!a11)
      {
        if (!a13)
        {
LABEL_36:
          SCLog();
          int v30 = 20;
          goto LABEL_37;
        }
LABEL_23:
        char v45 = v29;
        int v31 = ((a12 - 1) | 7) + 139;
        int v32 = ((a14 - 1) | 7) + 9;
        if (!a13) {
          int v32 = 0;
        }
        if (!a11) {
          int v31 = 130;
        }
        size_t v33 = v31 + v32 + ((*a5 - 1) | 7) + ((*a6 - 1) | 7);
        char v34 = malloc_type_calloc(1uLL, v33, 0xDCB1D0AuLL);
        if (!v34)
        {
          CFIndex v36 = __error();
          strerror(*v36);
          __ipsec_set_strerror();
LABEL_57:
          SCLog();
          return 0xFFFFFFFFLL;
        }
        CFNumberRef v46 = v34;
        pid_t v35 = getpid();
        if ((int)v33 > 15)
        {
          void *v46 = 0;
          v46[1] = 0;
          *(unsigned char *)CFNumberRef v46 = 2;
          *((unsigned char *)v46 + 1) = a2;
          *((unsigned char *)v46 + 2) = 0;
          *((unsigned char *)v46 + 3) = v26;
          *((_DWORD *)v46 + 1) = (unsigned __int16)(v33 >> 3);
          *((_DWORD *)v46 + 2) = a20;
          *((_DWORD *)v46 + 3) = v35;
          if (v33 > 0x1F)
          {
            v46[2] = 0;
            v46[3] = 0;
            *((_DWORD *)v46 + 4) = 65538;
            *((_DWORD *)v46 + 5) = a7;
            *((unsigned char *)v46 + 24) = a9;
            *((unsigned char *)v46 + 25) = 0;
            *((unsigned char *)v46 + 26) = a13;
            *((unsigned char *)v46 + 27) = a11;
            *((_DWORD *)v46 + 7) = a15;
            if (v33 > 0x2F)
            {
              int v39 = v33;
              unint64_t v40 = (unint64_t)v46 + v33;
              v46[4] = 0;
              v46[5] = 0;
              *((_DWORD *)v46 + 8) = 1245186;
              *((unsigned char *)v46 + 36) = a4;
              *((_DWORD *)v46 + 11) = a8;
              uint64_t v41 = sub_9A9C((_WORD *)v46 + 24, (unint64_t)v46 + v33, 5, a5, v45, 255);
              if (v41)
              {
                unsigned int v42 = sub_9A9C(v41, v40, 6, a6, v45, 255);
                if (v42)
                {
                  if (a11)
                  {
                    unsigned int v43 = a12;
                    unsigned int v42 = sub_B768(v42, v40, 9, a10, a12);
                    if (!v42) {
                      goto LABEL_33;
                    }
                  }
                  else
                  {
                    unsigned int v43 = a12;
                  }
                  if ((!a13 || (unsigned int v42 = sub_B768(v42, v40, 8, &a10[v43], a14)) != 0)
                    && (unint64_t)(v42 + 32) <= v40)
                  {
                    *(_OWORD *)unsigned int v42 = 0u;
                    *((_OWORD *)v42 + 1) = 0u;
                    *(_DWORD *)unsigned int v42 = 196612;
                    *((_DWORD *)v42 + 1) = a16;
                    *((void *)v42 + 1) = a17;
                    *((void *)v42 + 2) = a18;
                    *((void *)v42 + 3) = a19;
                    unint64_t v44 = sub_B7F8((uint64_t)(v42 + 32), v40, 4, a16, a17, a18, a19);
                    if (v44)
                    {
                      if (v44 == v40)
                      {
                        ssize_t v37 = pfkey_send(a1, v46, v39);
                        free(v46);
                        if ((v37 & 0x80000000) == 0)
                        {
                          __ipsec_errcode = 0;
                          return v37;
                        }
                        goto LABEL_57;
                      }
                    }
                  }
                }
              }
            }
          }
        }
LABEL_33:
        free(v46);
        goto LABEL_57;
      }
      goto LABEL_31;
    case 9:
      if (a11)
      {
        if (a13) {
          goto LABEL_36;
        }
        goto LABEL_23;
      }
LABEL_31:
      SCLog();
      int v30 = 13;
      goto LABEL_37;
    case 3:
      if (!a11) {
        goto LABEL_36;
      }
      goto LABEL_23;
  }
  SCLog();
  int v30 = 10;
LABEL_37:
  __ipsec_errcode = v30;
  return 0xFFFFFFFFLL;
}

uint64_t pfkey_send_add(int a1, int a2, char a3, unsigned __int8 *a4, unsigned __int8 *a5, int a6, int a7, char a8, char *a9, int a10, unsigned int a11, int a12, unsigned int a13, int a14, int a15, unsigned int a16, int a17, unsigned int a18, int a19, unsigned int a20,int a21,int a22)
{
  return sub_9BE0(a1, 3, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, a18, a20, a22);
}

uint64_t pfkey_send_delete(int a1, char a2, uint64_t a3, unsigned __int8 *a4, unsigned __int8 *a5, int a6)
{
  return sub_A224(a1, 4, a2, a4, a5, a6);
}

uint64_t sub_A224(int a1, char a2, char a3, unsigned __int8 *a4, unsigned __int8 *a5, int a6)
{
  if (!a4 || !a5)
  {
    SCLog();
    int v14 = 2;
LABEL_14:
    __ipsec_errcode = v14;
    return 0xFFFFFFFFLL;
  }
  int v8 = a4[1];
  if (v8 != a5[1])
  {
    SCLog();
    int v14 = 24;
    goto LABEL_14;
  }
  if (v8 == 2)
  {
    char v13 = 32;
    goto LABEL_10;
  }
  if (v8 != 30)
  {
    SCLog();
    int v14 = 15;
    goto LABEL_14;
  }
  char v13 = 0x80;
LABEL_10:
  uint64_t v15 = ((*a5 - 1) | 7) + ((*a4 - 1) | 7);
  uint64_t v16 = v15 + 50;
  BOOL v17 = malloc_type_calloc(1uLL, v15 + 50, 0x25096DD7uLL);
  if (v17)
  {
    char v18 = v17;
    pid_t v19 = getpid();
    if ((int)v15 <= -35) {
      goto LABEL_24;
    }
    void *v18 = 0;
    v18[1] = 0;
    *(unsigned char *)char v18 = 2;
    *((unsigned char *)v18 + 1) = a2;
    *((unsigned char *)v18 + 2) = 0;
    *((unsigned char *)v18 + 3) = a3;
    *((_DWORD *)v18 + 1) = (unsigned __int16)(v16 >> 3);
    *((_DWORD *)v18 + 2) = 0;
    *((_DWORD *)v18 + 3) = v19;
    if ((int)v15 <= -19) {
      goto LABEL_24;
    }
    v18[2] = 0;
    v18[3] = 0;
    *((_DWORD *)v18 + 4) = 65538;
    *((_DWORD *)v18 + 5) = a6;
    v18[3] = 0;
    size_t v23 = sub_9A9C((_WORD *)v18 + 16, (unint64_t)v18 + v16, 5, a4, v13, 255);
    if (!v23) {
      goto LABEL_24;
    }
    CFStringRef v24 = sub_9A9C(v23, (unint64_t)v18 + v16, 6, a5, v13, 255);
    if (v24 && v24 == (char *)v18 + v16)
    {
      ssize_t v20 = pfkey_send(a1, v18, v16);
      free(v18);
      if ((v20 & 0x80000000) == 0)
      {
        __ipsec_errcode = 0;
        return v20;
      }
    }
    else
    {
LABEL_24:
      free(v18);
    }
  }
  else
  {
    int v22 = __error();
    strerror(*v22);
    __ipsec_set_strerror();
  }
  SCLog();
  return 0xFFFFFFFFLL;
}

uint64_t pfkey_send_delete_all(int a1, char a2, uint64_t a3, unsigned __int8 *a4, unsigned __int8 *a5)
{
  if (!a4 || !a5)
  {
    SCLog();
    int v11 = 2;
LABEL_14:
    __ipsec_errcode = v11;
    return 0xFFFFFFFFLL;
  }
  int v7 = a4[1];
  if (v7 != a5[1])
  {
    SCLog();
    int v11 = 24;
    goto LABEL_14;
  }
  if (v7 == 2)
  {
    char v10 = 32;
    goto LABEL_10;
  }
  if (v7 != 30)
  {
    SCLog();
    int v11 = 15;
    goto LABEL_14;
  }
  char v10 = 0x80;
LABEL_10:
  uint64_t v12 = ((*a5 - 1) | 7) + ((*a4 - 1) | 7);
  uint64_t v13 = v12 + 34;
  int v14 = malloc_type_calloc(1uLL, v12 + 34, 0x672870ACuLL);
  if (v14)
  {
    uint64_t v15 = v14;
    pid_t v16 = getpid();
    if ((int)v12 <= -19) {
      goto LABEL_12;
    }
    void *v15 = 0;
    v15[1] = 0;
    *(_WORD *)uint64_t v15 = 1026;
    *((unsigned char *)v15 + 2) = 0;
    *((unsigned char *)v15 + 3) = a2;
    *((_DWORD *)v15 + 1) = (unsigned __int16)(v13 >> 3);
    *((_DWORD *)v15 + 2) = 0;
    *((_DWORD *)v15 + 3) = v16;
    ssize_t v20 = sub_9A9C((_WORD *)v15 + 8, (unint64_t)v15 + v13, 5, a4, v10, 255);
    if (!v20) {
      goto LABEL_12;
    }
    char v21 = sub_9A9C(v20, (unint64_t)v15 + v13, 6, a5, v10, 255);
    if (v21 && v21 == (char *)v15 + v13)
    {
      ssize_t v17 = pfkey_send(a1, v15, v13);
      free(v15);
      if ((v17 & 0x80000000) == 0)
      {
        __ipsec_errcode = 0;
        return v17;
      }
    }
    else
    {
LABEL_12:
      free(v15);
    }
  }
  else
  {
    pid_t v19 = __error();
    strerror(*v19);
    __ipsec_set_strerror();
  }
  SCLog();
  return 0xFFFFFFFFLL;
}

uint64_t pfkey_send_get(int a1, char a2, uint64_t a3, unsigned __int8 *a4, unsigned __int8 *a5, int a6)
{
  return sub_A224(a1, 5, a2, a4, a5, a6);
}

uint64_t pfkey_send_register(int a1, unsigned int a2)
{
  uint64_t v4 = 0;
  if (a2)
  {
    while (dword_2ED58[v4] != a2)
    {
      if (++v4 == 3) {
        goto LABEL_12;
      }
    }
    if (v4 == 0xFFFFFFFFLL)
    {
LABEL_12:
      __ipsec_errcode = 2;
      return 0xFFFFFFFFLL;
    }
    int v7 = (void *)qword_40530[v4];
    if (v7)
    {
      free(v7);
      qword_40530[v4] = 0;
    }
  }
  else
  {
    do
    {
      int v5 = *(void **)((char *)qword_40530 + v4);
      if (v5)
      {
        free(v5);
        *(uint64_t *)((char *)qword_40530 + v4) = 0;
      }
      v4 += 8;
    }
    while (v4 != 24);
  }

  return sub_A8BC(a1, 7, a2);
}

uint64_t sub_A8BC(int a1, int a2, unsigned int a3)
{
  char v3 = a3;
  char v4 = a2;
  if (a2 == 11)
  {
    if (a3 >= 2)
    {
LABEL_11:
      SCLog();
      __ipsec_errcode = 10;
      return 0xFFFFFFFFLL;
    }
  }
  else if (a3 > 9 || ((1 << a3) & 0x20D) == 0)
  {
    goto LABEL_11;
  }
  int v6 = (char *)malloc_type_calloc(1uLL, 0x10uLL, 0x47BAAC7BuLL);
  if (!v6)
  {
    char v10 = __error();
    strerror(*v10);
    __ipsec_set_strerror();
    goto LABEL_10;
  }
  int v7 = v6;
  pid_t v8 = getpid();
  *int v7 = 2;
  v7[1] = v4;
  v7[2] = 0;
  v7[3] = v3;
  *(void *)(v7 + 4) = 2;
  *((_DWORD *)v7 + 3) = v8;
  ssize_t v9 = pfkey_send(a1, v7, 16);
  free(v7);
  if ((v9 & 0x80000000) != 0)
  {
LABEL_10:
    SCLog();
    return 0xFFFFFFFFLL;
  }
  __ipsec_errcode = 0;
  return v9;
}

uint64_t pfkey_recv_register(int a1)
{
  pid_t v2 = getpid();
  char v3 = pfkey_recv(a1);
  if (!v3) {
    return 0xFFFFFFFFLL;
  }
  char v4 = v3;
  while (*((unsigned char *)v4 + 1) != 7 || *((_DWORD *)v4 + 3) != v2)
  {
    char v4 = pfkey_recv(a1);
    if (!v4) {
      return 0xFFFFFFFFLL;
    }
  }
  unsigned __int16 v5 = 8 * v4[2];
  v4[2] = v5;
  int v6 = pfkey_set_supported((uint64_t)v4, v5 & 0xFFF8);
  free(v4);
  if (v6) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0;
  __ipsec_errcode = 0;
  return result;
}

unsigned __int16 *pfkey_recv(int a1)
{
  v10[0] = 0;
  v10[1] = 0;
  while (1)
  {
    unint64_t v2 = recv(a1, v10, 0x10uLL, 2);
    if ((v2 & 0x8000000000000000) == 0) {
      break;
    }
    if (*__error() != 4)
    {
      char v3 = __error();
      strerror(*v3);
      __ipsec_set_strerror();
      return 0;
    }
  }
  if (v2 <= 0xF)
  {
    recv(a1, v10, 0x10uLL, 0);
    char v4 = 0;
    __ipsec_errcode = 27;
    return v4;
  }
  size_t v5 = 8 * WORD2(v10[0]);
  char v4 = (unsigned __int16 *)malloc_type_calloc(1uLL, v5, 0xE4862B0EuLL);
  if (!v4)
  {
    pid_t v8 = __error();
    strerror(*v8);
    __ipsec_set_strerror();
    return v4;
  }
  while (1)
  {
    ssize_t v6 = recv(a1, v4, v5, 0);
    if ((v6 & 0x8000000000000000) == 0) {
      break;
    }
    if (*__error() != 4)
    {
      int v7 = __error();
      strerror(*v7);
      __ipsec_set_strerror();
      goto LABEL_16;
    }
  }
  if (v6 == v5 && v5 == 8 * v4[2])
  {
    __ipsec_errcode = 0;
    return v4;
  }
  __ipsec_errcode = 26;
LABEL_16:
  free(v4);
  return 0;
}

uint64_t pfkey_set_supported(uint64_t a1, unsigned int a2)
{
  if (*(unsigned __int16 *)(a1 + 4) == a2)
  {
    unint64_t v2 = a1 + a2;
    char v3 = (unsigned __int16 *)(a1 + 16);
    if (a2 >= 0x18)
    {
      do
      {
        uint64_t v6 = *v3;
        if (!*v3 || v2 < (unint64_t)v3 + v6) {
          break;
        }
        int v8 = v3[1];
        if ((v8 & 0xFFFE) != 0xE) {
          goto LABEL_4;
        }
        unsigned __int16 v9 = 8 * v6;
        *char v3 = v9;
        if (v8 == 14)
        {
          uint64_t v10 = 0;
        }
        else
        {
          if (v8 != 15) {
            goto LABEL_4;
          }
          uint64_t v10 = 1;
        }
        int v11 = (void *)qword_40530[v10];
        if (v11)
        {
          free(v11);
          unsigned __int16 v9 = *v3;
        }
        uint64_t v12 = malloc_type_malloc(v9, 0xD31EFA2FuLL);
        qword_40530[v10] = (uint64_t)v12;
        if (!v12)
        {
          uint64_t v13 = __error();
          strerror(*v13);
          __ipsec_set_strerror();
          return 0xFFFFFFFFLL;
        }
        memcpy(v12, v3, *v3);
        char v3 = (unsigned __int16 *)((char *)v3 + *v3);
      }
      while ((unint64_t)v3 < v2 && v2 >= (unint64_t)(v3 + 4));
    }
    if (v3 == (unsigned __int16 *)v2)
    {
      uint64_t result = 0;
      __ipsec_errcode = 0;
      return result;
    }
LABEL_4:
    int v4 = 10;
  }
  else
  {
    int v4 = 2;
  }
  __ipsec_errcode = v4;
  return 0xFFFFFFFFLL;
}

uint64_t pfkey_send_flush(int a1, unsigned int a2)
{
  return sub_A8BC(a1, 9, a2);
}

uint64_t pfkey_send_dump(int a1, unsigned int a2)
{
  return sub_A8BC(a1, 10, a2);
}

uint64_t pfkey_send_promisc_toggle(int a1, int a2)
{
  return sub_A8BC(a1, 11, a2 != 0);
}

ssize_t pfkey_send_spdadd(int a1, unsigned __int8 *a2, unsigned int a3, unsigned __int8 *a4, unsigned int a5, char a6, void *a7, int a8, int a9)
{
  return sub_ADE4(a1, 14, a2, a3, a4, a5, a6, 0, 0, a7, a8, a9);
}

ssize_t sub_ADE4(int a1, char a2, unsigned __int8 *a3, unsigned int a4, unsigned __int8 *a5, unsigned int a6, char a7, unsigned int a8, uint64_t a9, void *__src, int a11, int a12)
{
  if (!a3 || !a5)
  {
    SCLog();
    int v22 = 2;
LABEL_17:
    __ipsec_errcode = v22;
    return 0xFFFFFFFFLL;
  }
  int v14 = a3[1];
  if (v14 != a5[1])
  {
    SCLog();
    int v22 = 24;
    goto LABEL_17;
  }
  char v17 = a6;
  char v18 = a4;
  if (v14 == 2)
  {
    unsigned int v21 = 32;
    goto LABEL_10;
  }
  if (v14 != 30)
  {
    SCLog();
    int v22 = 15;
    goto LABEL_17;
  }
  unsigned int v21 = 128;
LABEL_10:
  if (v21 < a4 || v21 < a6)
  {
    SCLog();
    int v22 = 16;
    goto LABEL_17;
  }
  size_t v23 = a11 + ((2 * *a3 - 2) | 0xE) + 66;
  CFStringRef v24 = malloc_type_calloc(1uLL, v23, 0x30F4C00FuLL);
  if (v24)
  {
    CFMutableDictionaryRef v25 = v24;
    pid_t v26 = getpid();
    if ((int)v23 <= 15) {
      goto LABEL_25;
    }
    *CFMutableDictionaryRef v25 = 0;
    v25[1] = 0;
    *(unsigned char *)CFMutableDictionaryRef v25 = 2;
    *((unsigned char *)v25 + 1) = a2;
    int v30 = (char *)v25 + v23;
    *((_WORD *)v25 + 1) = 0;
    *((_DWORD *)v25 + 1) = (unsigned __int16)(v23 >> 3);
    *((_DWORD *)v25 + 2) = a12;
    *((_DWORD *)v25 + 3) = v26;
    int v31 = sub_9A9C((_WORD *)v25 + 8, (unint64_t)v25 + v23, 5, a3, v18, a7);
    if (!v31) {
      goto LABEL_25;
    }
    int v32 = sub_9A9C(v31, (unint64_t)v25 + v23, 6, a5, v17, a7);
    if (!v32) {
      goto LABEL_25;
    }
    size_t v33 = v32;
    char v34 = v32 + 32;
    if (v34 > v30) {
      goto LABEL_25;
    }
    *(_OWORD *)size_t v33 = 0u;
    *((_OWORD *)v33 + 1) = 0u;
    *(void *)size_t v33 = 196612;
    *((void *)v33 + 1) = 0;
    *((void *)v33 + 2) = a8;
    *((void *)v33 + 3) = a9;
    if (&v34[a11] == v30)
    {
      memcpy(v34, __src, a11);
      ssize_t v27 = pfkey_send(a1, v25, v23);
      free(v25);
      if ((v27 & 0x80000000) == 0)
      {
        __ipsec_errcode = 0;
        return v27;
      }
    }
    else
    {
LABEL_25:
      free(v25);
    }
  }
  else
  {
    char v29 = __error();
    strerror(*v29);
    __ipsec_set_strerror();
  }
  SCLog();
  return 0xFFFFFFFFLL;
}

ssize_t pfkey_send_spdadd2(int a1, unsigned __int8 *a2, unsigned int a3, unsigned __int8 *a4, unsigned int a5, char a6, unsigned int a7, uint64_t a8, void *a9, int a10, int a11)
{
  return sub_ADE4(a1, 14, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
}

ssize_t pfkey_send_spdupdate(int a1, unsigned __int8 *a2, unsigned int a3, unsigned __int8 *a4, unsigned int a5, char a6, void *a7, int a8, int a9)
{
  return sub_ADE4(a1, 13, a2, a3, a4, a5, a6, 0, 0, a7, a8, a9);
}

ssize_t pfkey_send_spdupdate2(int a1, unsigned __int8 *a2, unsigned int a3, unsigned __int8 *a4, unsigned int a5, char a6, unsigned int a7, uint64_t a8, void *a9, int a10, int a11)
{
  return sub_ADE4(a1, 13, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11);
}

ssize_t pfkey_send_spddelete(int a1, unsigned __int8 *a2, unsigned int a3, unsigned __int8 *a4, unsigned int a5, char a6, void *a7, int a8, int a9)
{
  if (a8 == 16) {
    return sub_ADE4(a1, 15, a2, a3, a4, a5, a6, 0, 0, a7, 16, a9);
  }
  __ipsec_errcode = 2;
  return 0xFFFFFFFFLL;
}

uint64_t pfkey_send_spddelete2(int a1, int a2)
{
  return sub_B2C4(a1, 22, a2);
}

uint64_t sub_B2C4(int a1, char a2, int a3)
{
  uint64_t v6 = (char *)malloc_type_calloc(1uLL, 0x20uLL, 0xF69C0C1CuLL);
  if (!v6)
  {
    uint64_t v10 = __error();
    strerror(*v10);
    __ipsec_set_strerror();
    goto LABEL_5;
  }
  int v7 = v6;
  pid_t v8 = getpid();
  *int v7 = 2;
  v7[1] = a2;
  *((_WORD *)v7 + 1) = 0;
  *(void *)(v7 + 4) = 4;
  *((_DWORD *)v7 + 3) = v8;
  *((void *)v7 + 2) = 1179776;
  *((_DWORD *)v7 + 6) = a3;
  *((_DWORD *)v7 + 7) = 0;
  ssize_t v9 = pfkey_send(a1, v7, 32);
  free(v7);
  if ((v9 & 0x80000000) != 0)
  {
LABEL_5:
    SCLog();
    return 0xFFFFFFFFLL;
  }
  __ipsec_errcode = 0;
  return v9;
}

uint64_t pfkey_send_spdget(int a1, int a2)
{
  return sub_B2C4(a1, 16, a2);
}

ssize_t pfkey_send_spdsetidx(int a1, unsigned __int8 *a2, unsigned int a3, unsigned __int8 *a4, unsigned int a5, char a6, void *a7, int a8, int a9)
{
  if (a8 == 16) {
    return sub_ADE4(a1, 20, a2, a3, a4, a5, a6, 0, 0, a7, 16, a9);
  }
  __ipsec_errcode = 2;
  return 0xFFFFFFFFLL;
}

uint64_t pfkey_send_spdflush(int a1)
{
  return sub_A8BC(a1, 19, 0);
}

uint64_t pfkey_send_spddump(int a1)
{
  return sub_A8BC(a1, 18, 0);
}

uint64_t pfkey_open()
{
  int v4 = 0x20000;
  uint64_t v0 = socket(29, 3, 2);
  if ((v0 & 0x80000000) != 0)
  {
    unint64_t v2 = __error();
    strerror(*v2);
    __ipsec_set_strerror();
    return 0xFFFFFFFFLL;
  }
  else
  {
    uint64_t v1 = v0;
    setsockopt(v0, 0xFFFF, 4097, &v4, 4u);
    setsockopt(v1, 0xFFFF, 4098, &v4, 4u);
    __ipsec_errcode = 0;
  }
  return v1;
}

uint64_t pfkey_close(int a1)
{
  uint64_t result = close(a1);
  __ipsec_errcode = 0;
  return result;
}

uint64_t pfkey_align(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0xFFFFFFFFLL;
  int v4 = 2;
  if (a1 && a2)
  {
    *(void *)(a2 + 232) = 0;
    *(_OWORD *)(a2 + 216) = 0u;
    *(_OWORD *)(a2 + 200) = 0u;
    *(_OWORD *)(a2 + 184) = 0u;
    *(_OWORD *)(a2 + 168) = 0u;
    *(_OWORD *)(a2 + 152) = 0u;
    *(_OWORD *)(a2 + 136) = 0u;
    *(_OWORD *)(a2 + 120) = 0u;
    *(_OWORD *)(a2 + 104) = 0u;
    *(_OWORD *)(a2 + 88) = 0u;
    *(_OWORD *)(a2 + 72) = 0u;
    *(_OWORD *)(a2 + 56) = 0u;
    *(_OWORD *)(a2 + 40) = 0u;
    *(_OWORD *)(a2 + 24) = 0u;
    *(_OWORD *)(a2 + 8) = 0u;
    unint64_t v5 = *(unsigned __int16 *)(a1 + 4);
    unint64_t v6 = a1 + 8 * v5;
    *(void *)a2 = a1;
    int v7 = (unsigned __int16 *)(a1 + 16);
    if (v5 >= 3)
    {
      while (1)
      {
        pid_t v8 = &v7[4 * *v7];
        if (!*v7 || v6 < (unint64_t)v8) {
          break;
        }
        uint64_t v11 = v7[1];
        if (*(void *)(a2 + 8 * v11) || (v11 - 1) >= 0x10 && (v11 - 18) > 1)
        {
          uint64_t result = 0xFFFFFFFFLL;
          int v4 = 12;
          goto LABEL_11;
        }
        *(void *)(a2 + 8 * v11) = v7;
        BOOL v12 = (unint64_t)v8 < v6 && v6 >= (unint64_t)(v8 + 2);
        int v7 = v8;
        if (!v12) {
          goto LABEL_5;
        }
      }
    }
    pid_t v8 = v7;
LABEL_5:
    BOOL v9 = v8 == (unsigned __int16 *)v6;
    if (v8 == (unsigned __int16 *)v6) {
      int v4 = 0;
    }
    else {
      int v4 = 3;
    }
    if (v9) {
      uint64_t result = 0;
    }
    else {
      uint64_t result = 0xFFFFFFFFLL;
    }
  }
LABEL_11:
  __ipsec_errcode = v4;
  return result;
}

uint64_t pfkey_check(uint64_t a1)
{
  if (a1 && (unint64_t v2 = *(unsigned char **)a1) != 0)
  {
    if (*v2 == 2)
    {
      unsigned int v3 = v2[1];
      if (v3 <= 0x1A)
      {
        int v6 = v2[3];
        uint64_t result = 0xFFFFFFFFLL;
        int v5 = 1;
        switch(v6)
        {
          case 0:
            char v7 = v3 - 1;
            if ((v3 - 1) >= 8u) {
              goto LABEL_17;
            }
            unsigned int v8 = 191;
            goto LABEL_14;
          case 1:
            if (v3 == 11) {
              goto LABEL_17;
            }
            goto LABEL_24;
          case 2:
          case 3:
          case 9:
            char v7 = v3 - 14;
            if (v3 - 14 < 6)
            {
              unsigned int v8 = 55;
LABEL_14:
              if ((v8 >> v7)) {
                goto LABEL_25;
              }
            }
LABEL_17:
            uint64_t v9 = *(void *)(a1 + 40);
            if (!v9) {
              goto LABEL_23;
            }
            uint64_t v10 = *(void *)(a1 + 48);
            if (!v10) {
              goto LABEL_23;
            }
            if (*(unsigned __int8 *)(v9 + 4) == *(unsigned __int8 *)(v10 + 4))
            {
              int v11 = *(unsigned __int8 *)(v9 + 9);
              if (v11 == *(unsigned __int8 *)(v10 + 9))
              {
                if (v11 == 30 || v11 == 2)
                {
LABEL_23:
                  int v5 = 0;
                  uint64_t result = 0;
                }
                else
                {
                  int v5 = 15;
                }
              }
              else
              {
                int v5 = 24;
              }
            }
            else
            {
              int v5 = 23;
            }
            break;
          case 5:
          case 6:
          case 7:
          case 8:
            break;
          default:
LABEL_24:
            uint64_t result = 0xFFFFFFFFLL;
LABEL_25:
            int v5 = 10;
            break;
        }
      }
      else
      {
        uint64_t result = 0xFFFFFFFFLL;
        int v5 = 11;
      }
    }
    else
    {
      uint64_t result = 0xFFFFFFFFLL;
      int v5 = 4;
    }
  }
  else
  {
    uint64_t result = 0xFFFFFFFFLL;
    int v5 = 2;
  }
  __ipsec_errcode = v5;
  return result;
}

char *sub_B768(_WORD *a1, unint64_t a2, __int16 a3, const void *a4, unsigned int a5)
{
  int v5 = (a5 - 1) | 7;
  uint64_t v6 = (v5 + 9);
  char v7 = (char *)a1 + v6;
  if ((unint64_t)a1 + v6 > a2) {
    return 0;
  }
  bzero(a1, (v5 + 9));
  *a1 = v6 >> 3;
  a1[1] = a3;
  a1[2] = 8 * a5;
  a1[3] = 0;
  memcpy(a1 + 4, a4, a5);
  return v7;
}

unint64_t sub_B7F8(uint64_t a1, unint64_t a2, int a3, int a4, unsigned int a5, unsigned int a6, unsigned int a7)
{
  unint64_t result = a1 + 32;
  if (result > a2) {
    return 0;
  }
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_WORD *)a1 = 4;
  *(_WORD *)(a1 + 2) = a3;
  if (a3 == 3)
  {
    *(_DWORD *)(a1 + 4) = a4;
    *(void *)(a1 + 8) = a5;
    *(void *)(a1 + 16) = a6;
    goto LABEL_8;
  }
  if (a3 == 4)
  {
    *(_DWORD *)(a1 + 4) = dword_40020 * a4 / 0x64u;
    unint64_t v9 = dword_40028 * a6 / 0x64uLL;
    *(void *)(a1 + 8) = dword_40024 * a5 / 0x64uLL;
    *(void *)(a1 + 16) = v9;
    a7 = dword_4002C * a7 / 0x64;
LABEL_8:
    *(void *)(a1 + 24) = a7;
  }
  return result;
}

uint64_t get_addr_option(uint64_t a1, const __CFString *key, const void *a3, CFDictionaryRef theDict, uint64_t a5, unsigned int *a6, unsigned int a7)
{
  if (*(_DWORD *)(a1 + 628)
    && getAddressFromEntity((const __SCDynamicStore *)gDynamicStore, kSCDynamicStoreDomainState, *(const __CFString **)(a1 + 24), key, a3, a6))
  {
    return 1;
  }
  if (theDict
    && (CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, key)) != 0
    && (v15 = Value, CFTypeID v16 = CFGetTypeID(Value), v16 == CFDictionaryGetTypeID())
    && (CFArrayRef v17 = (const __CFArray *)CFDictionaryGetValue(v15, a3)) != 0
    && (CFArrayRef v18 = v17, v19 = CFGetTypeID(v17), v19 == CFArrayGetTypeID())
    && CFArrayGetCount(v18))
  {
    CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v18, 0);
    a7 = CFStringAddrToLong(ValueAtIndex);
    uint64_t result = 2;
  }
  else
  {
    if (getAddressFromEntity((const __SCDynamicStore *)gDynamicStore, kSCDynamicStoreDomainSetup, *(const __CFString **)(a1 + 24), key, a3, a6))return 3; {
    uint64_t result = 0;
    }
  }
  *a6 = a7;
  return result;
}

uint64_t get_int_option(uint64_t a1, const __CFString *key, const void *a3, CFDictionaryRef theDict, CFDictionaryRef a5, _DWORD *a6, int a7)
{
  if (*(_DWORD *)(a1 + 628)
    && getNumberFromEntity((const __SCDynamicStore *)gDynamicStore, kSCDynamicStoreDomainState, *(const __CFString **)(a1 + 24), key, a3, a6))
  {
    return 1;
  }
  if (theDict)
  {
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, key);
    if (Value)
    {
      CFDictionaryRef v16 = Value;
      CFTypeID v17 = CFGetTypeID(Value);
      if (v17 == CFDictionaryGetTypeID())
      {
        if (getNumber(v16, a3, a6)) {
          return 2;
        }
      }
    }
  }
  if (a5)
  {
    CFDictionaryRef v18 = (const __CFDictionary *)CFDictionaryGetValue(a5, key);
    if (!v18) {
      goto LABEL_13;
    }
    CFDictionaryRef v19 = v18;
    CFTypeID v20 = CFGetTypeID(v18);
    if (v20 != CFDictionaryGetTypeID() || !getNumber(v19, a3, a6)) {
      goto LABEL_13;
    }
  }
  else if (!getNumberFromEntity((const __SCDynamicStore *)gDynamicStore, kSCDynamicStoreDomainSetup, *(const __CFString **)(a1 + 24), key, a3, a6))
  {
LABEL_13:
    uint64_t result = 0;
    *a6 = a7;
    return result;
  }
  return 3;
}

uint64_t get_str_option(uint64_t a1, const __CFString *key, const void *a3, CFDictionaryRef theDict, CFDictionaryRef a5, char *a6, unsigned int a7, _DWORD *a8, char *__source)
{
  if (!*(_DWORD *)(a1 + 628)
    || !getStringFromEntity((const __SCDynamicStore *)gDynamicStore, kSCDynamicStoreDomainState, *(const __CFString **)(a1 + 24), key, a3, a6, (unsigned __int16)a7))
  {
    if (theDict)
    {
      CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(theDict, key);
      if (Value)
      {
        CFDictionaryRef v19 = Value;
        CFTypeID v20 = CFGetTypeID(Value);
        if (v20 == CFDictionaryGetTypeID())
        {
          if (getString(v19, a3, a6, (unsigned __int16)a7))
          {
            uint64_t v17 = 2;
            goto LABEL_16;
          }
        }
      }
    }
    if (a5)
    {
      CFDictionaryRef v21 = (const __CFDictionary *)CFDictionaryGetValue(a5, key);
      if (!v21) {
        goto LABEL_13;
      }
      CFDictionaryRef v22 = v21;
      CFTypeID v23 = CFGetTypeID(v21);
      if (v23 != CFDictionaryGetTypeID() || !getString(v22, a3, a6, (unsigned __int16)a7)) {
        goto LABEL_13;
      }
    }
    else if (!getStringFromEntity((const __SCDynamicStore *)gDynamicStore, kSCDynamicStoreDomainSetup, *(const __CFString **)(a1 + 24), key, a3, a6, (unsigned __int16)a7))
    {
LABEL_13:
      strlcpy(a6, __source, a7);
      uint64_t v17 = 0;
      goto LABEL_16;
    }
    uint64_t v17 = 3;
    goto LABEL_16;
  }
  uint64_t v17 = 1;
LABEL_16:
  *a8 = strlen(a6);
  return v17;
}

const void *get_cf_option(void *key, const void *a2, uint64_t a3, CFDictionaryRef theDict, CFDictionaryRef a5, uint64_t a6)
{
  if (!theDict
    || (CFDictionaryRef v11 = (const __CFDictionary *)CFDictionaryGetValue(theDict, key)) == 0
    || (CFDictionaryRef v12 = v11, v13 = CFGetTypeID(v11), v13 != CFDictionaryGetTypeID())
    || (int v14 = CFDictionaryGetValue(v12, a2)) == 0
    || (CFDictionaryRef v15 = v14, CFGetTypeID(v14) != a3))
  {
    if (!a5) {
      return (const void *)a6;
    }
    CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(a5, key);
    if (!Value) {
      return (const void *)a6;
    }
    CFDictionaryRef v17 = Value;
    CFTypeID v18 = CFGetTypeID(Value);
    if (v18 != CFDictionaryGetTypeID()) {
      return (const void *)a6;
    }
    CFDictionaryRef v19 = CFDictionaryGetValue(v17, a2);
    if (!v19) {
      return (const void *)a6;
    }
    CFDictionaryRef v15 = v19;
    if (CFGetTypeID(v19) != a3) {
      return (const void *)a6;
    }
  }
  return v15;
}

uint64_t ppp_getoptval(uint64_t a1, CFDictionaryRef theDict, CFDictionaryRef a3, int a4, char *a5, unsigned int a6, unsigned int *a7)
{
  uint64_t v11 = a1;
  uint64_t v43 = 0;
  int v42 = 0;
  *a7 = 4;
  *(_DWORD *)a5 = 0;
  switch(a4)
  {
    case 1:
      if (a3)
      {
        if (!*(_WORD *)(a1 + 66))
        {
          CFDictionaryRef Value = CFDictionaryGetValue(a3, kSCEntNetInterface);
          if (Value)
          {
            CFTypeID v14 = CFGetTypeID(Value);
            if (v14 == CFDictionaryGetTypeID())
            {
              uint64_t v15 = _SCNetworkInterfaceCreateWithEntity();
              if (v15)
              {
                CFDictionaryRef v16 = (const void *)v15;
                CFStringRef v17 = (const __CFString *)_SCNetworkInterfaceCopySlashDevPath();
                CFRelease(v16);
                if (v17)
                {
                  CFStringGetCString(v17, a5, 256, 0x8000100u);
                  CFRelease(v17);
                  goto LABEL_66;
                }
              }
            }
          }
        }
      }
      unint64_t v40 = "";
      if (*(_WORD *)(v11 + 66) == 2) {
        unint64_t v40 = "en0";
      }
      if (*(_WORD *)(v11 + 66)) {
        uint64_t v41 = (char *)v40;
      }
      else {
        uint64_t v41 = "modem";
      }
      get_str_option(v11, kSCEntNetInterface, kSCPropNetInterfaceDeviceName, theDict, a3, a5, a6, a7, v41);
      goto LABEL_87;
    case 2:
      if (*(_WORD *)(a1 + 66)) {
        goto LABEL_87;
      }
      CFStringRef v18 = kSCEntNetModem;
      CFDictionaryRef v19 = &kSCPropNetModemSpeed;
      goto LABEL_84;
    case 3:
      CFStringRef v20 = kSCEntNetModem;
      CFStringRef v21 = kSCPropNetModemConnectionScript;
      if (*(_WORD *)(a1 + 66)) {
        __source = "";
      }
      else {
        __source = "Apple Internal 56K Modem (v.34)";
      }
      goto LABEL_62;
    case 4:
      CFStringRef v23 = kSCEntNetPPP;
      get_int_option(a1, kSCEntNetPPP, kSCPropNetPPPDisconnectOnIdle, theDict, a3, (_DWORD *)&v43 + 1, 0);
      if (!HIDWORD(v43)) {
        goto LABEL_87;
      }
      CFStringRef v24 = &kSCPropNetPPPDisconnectOnIdleTimer;
      goto LABEL_56;
    case 5:
      CFStringRef v20 = kSCEntNetPPP;
      CFMutableDictionaryRef v25 = &kSCPropNetPPPCommRemoteAddress;
      goto LABEL_61;
    case 6:
      goto LABEL_72;
    case 7:
      CFStringRef v20 = kSCEntNetPPP;
      CFMutableDictionaryRef v25 = &kSCPropNetPPPAuthName;
      goto LABEL_61;
    case 8:
      get_str_option(a1, kSCEntNetPPP, kSCPropNetPPPAuthPassword, theDict, a3, a5, a6, a7, "");
      uint64_t result = 1;
      if (*a7)
      {
        *a5 = 42;
        *a7 = 1;
      }
      return result;
    case 9:
      get_int_option(a1, kSCEntNetPPP, kSCPropNetPPPLCPCompressionPField, theDict, a3, (_DWORD *)&v43 + 1, *(unsigned __int16 *)(a1 + 66) != 2);
      if (*(_WORD *)(v11 + 66) == 2)
      {
        int v27 = 0;
      }
      else
      {
        get_int_option(v11, kSCEntNetPPP, kSCPropNetPPPLCPCompressionACField, theDict, a3, &v43, 1);
        int v27 = 2 * v43;
      }
      int v38 = v27 + HIDWORD(v43);
      goto LABEL_82;
    case 10:
      if (*(_WORD *)(a1 + 66) == 2) {
        int v28 = 1492;
      }
      else {
        int v28 = 1500;
      }
      CFStringRef v18 = kSCEntNetPPP;
      char v29 = &kSCPropNetPPPLCPMRU;
      goto LABEL_35;
    case 11:
      int v30 = *(unsigned __int16 *)(a1 + 66);
      if (v30 == 5) {
        int v31 = 1280;
      }
      else {
        int v31 = 1500;
      }
      if (v30 == 2) {
        int v28 = 1492;
      }
      else {
        int v28 = v31;
      }
      CFStringRef v18 = kSCEntNetPPP;
      char v29 = &kSCPropNetPPPLCPMTU;
LABEL_35:
      CFStringRef v32 = *v29;
      goto LABEL_41;
    case 12:
      if (*(_WORD *)(a1 + 66) == 2) {
        goto LABEL_39;
      }
      CFStringRef v18 = kSCEntNetPPP;
      CFDictionaryRef v19 = &kSCPropNetPPPLCPReceiveACCM;
      goto LABEL_84;
    case 13:
      if (*(_WORD *)(a1 + 66) == 2) {
        goto LABEL_39;
      }
      CFStringRef v18 = kSCEntNetPPP;
      CFDictionaryRef v19 = &kSCPropNetPPPLCPTransmitACCM;
      goto LABEL_84;
    case 14:
      CFStringRef v18 = kSCEntNetPPP;
      CFStringRef v32 = kSCPropNetPPPIPCPCompressionVJ;
      int v28 = *(unsigned __int16 *)(a1 + 66) != 2;
LABEL_41:
      CFDictionaryRef v33 = theDict;
      CFDictionaryRef v34 = a3;
      pid_t v35 = a5;
      goto LABEL_86;
    case 15:
      CFStringRef v36 = kSCEntNetIPv4;
      ssize_t v37 = (const void **)&kSCPropNetIPv4Addresses;
      goto LABEL_44;
    case 16:
      CFStringRef v36 = kSCEntNetIPv4;
      ssize_t v37 = (const void **)&kSCPropNetIPv4DestAddresses;
LABEL_44:
      get_addr_option(a1, v36, *v37, theDict, (uint64_t)a5, (unsigned int *)a5, 0);
      goto LABEL_87;
    case 17:
      get_str_option(a1, kSCEntNetPPP, kSCPropNetPPPLogfile, 0, a3, a5, a6, a7, "");
      uint64_t result = 1;
      if (!*a5 || *a5 == 47) {
        return result;
      }
      strncpy(a5 + 13, a5, *a7);
      qmemcpy(a5, "/var/log/ppp/", 13);
      *a7 += 13;
      goto LABEL_87;
    case 18:
    case 26:
    case 27:
      goto LABEL_39;
    case 19:
      CFStringRef v23 = kSCEntNetPPP;
      get_int_option(a1, kSCEntNetPPP, kSCPropNetPPPIdleReminder, theDict, a3, (_DWORD *)&v43 + 1, 0);
      if (!HIDWORD(v43)) {
        goto LABEL_87;
      }
      CFStringRef v24 = &kSCPropNetPPPIdleReminderTimer;
      goto LABEL_56;
    case 20:
      CFStringRef v18 = kSCEntNetPPP;
      CFStringRef v32 = @"AlertEnable";
      CFDictionaryRef v33 = theDict;
      CFDictionaryRef v34 = a3;
      pid_t v35 = a5;
      int v28 = -1;
      goto LABEL_86;
    case 21:
      get_int_option(a1, kSCEntNetPPP, kSCPropNetPPPLCPEchoEnabled, theDict, a3, (_DWORD *)&v43 + 1, 0);
      if (!HIDWORD(v43)) {
        goto LABEL_87;
      }
      get_int_option(v11, kSCEntNetPPP, kSCPropNetPPPLCPEchoInterval, theDict, a3, &v43, 10);
      get_int_option(v11, kSCEntNetPPP, kSCPropNetPPPLCPEchoFailure, theDict, a3, &v42, 4);
      int v38 = v42 + (v43 << 16);
      goto LABEL_82;
    case 22:
      CFStringRef v18 = kSCEntNetPPP;
      CFDictionaryRef v19 = &kSCPropNetPPPCommConnectDelay;
      goto LABEL_84;
    case 23:
      CFStringRef v23 = kSCEntNetPPP;
      get_int_option(a1, kSCEntNetPPP, kSCPropNetPPPUseSessionTimer, theDict, a3, (_DWORD *)&v43 + 1, 0);
      if (!HIDWORD(v43)) {
        goto LABEL_87;
      }
      CFStringRef v24 = &kSCPropNetPPPSessionTimer;
LABEL_56:
      CFStringRef v32 = *v24;
      a1 = v11;
      CFStringRef v18 = v23;
      goto LABEL_85;
    case 24:
      get_int_option(a1, kSCEntNetPPP, kSCPropNetPPPCommDisplayTerminalWindow, theDict, a3, (_DWORD *)&v43 + 1, 0);
      if (HIDWORD(v43)) {
        goto LABEL_71;
      }
      get_int_option(v11, kSCEntNetPPP, kSCPropNetPPPCommUseTerminalScript, theDict, a3, (_DWORD *)&v43 + 1, 0);
      uint64_t result = 1;
      if (!HIDWORD(v43)) {
        return result;
      }
      goto LABEL_73;
    case 25:
      CFStringRef v20 = kSCEntNetPPP;
      CFMutableDictionaryRef v25 = &kSCPropNetPPPCommTerminalScript;
LABEL_61:
      CFStringRef v21 = *v25;
      __source = "";
LABEL_62:
      get_str_option(a1, v20, v21, theDict, a3, a5, a6, a7, __source);
      goto LABEL_87;
    case 28:
      if (*(_WORD *)(a1 + 66)) {
        goto LABEL_87;
      }
      CFStringRef v18 = kSCEntNetModem;
      CFDictionaryRef v19 = &kSCPropNetModemConnectSpeed;
      goto LABEL_84;
    case 29:
      *a5 = 0;
      CFStringGetCString(*(CFStringRef *)(a1 + 24), a5, 256, 0x8000100u);
LABEL_66:
      int v39 = a5;
      goto LABEL_68;
    case 30:
      int v39 = strncpy(a5, (const char *)(a1 + 104), 0x10uLL);
LABEL_68:
      *a7 = strlen(v39);
      goto LABEL_87;
    case 31:
      *a7 = 4;
      *(_DWORD *)a5 = 0;
      __s1[0] = 0;
      HIDWORD(v43) = 256;
      get_str_option(a1, kSCEntNetModem, kSCPropNetModemDialMode, theDict, a3, __s1, 0x100u, (_DWORD *)&v43 + 1, "");
      buffer[0] = 0;
      CFStringGetCString(kSCValNetModemDialModeIgnoreDialTone, buffer, 256, 0x8000100u);
      if (strcmp(__s1, buffer))
      {
        buffer[0] = 0;
        CFStringGetCString(kSCValNetModemDialModeManual, buffer, 256, 0x8000100u);
        if (!strcmp(__s1, buffer))
        {
LABEL_71:
          int v38 = 2;
LABEL_82:
          *(_DWORD *)a5 = v38;
        }
        goto LABEL_87;
      }
LABEL_72:
      uint64_t result = 1;
LABEL_73:
      *(_DWORD *)a5 = 1;
      break;
    case 32:
      goto LABEL_10;
    default:
      if (a4 == 0x80000000)
      {
LABEL_10:
        CFStringRef v18 = kSCEntNetPPP;
        CFDictionaryRef v19 = &kSCPropNetPPPDialOnDemand;
LABEL_84:
        CFStringRef v32 = *v19;
LABEL_85:
        CFDictionaryRef v33 = theDict;
        CFDictionaryRef v34 = a3;
        pid_t v35 = a5;
        int v28 = 0;
LABEL_86:
        get_int_option(a1, v18, v32, v33, v34, v35, v28);
LABEL_87:
        uint64_t result = 1;
      }
      else
      {
LABEL_39:
        uint64_t result = 0;
        *a7 = 0;
      }
      break;
  }
  return result;
}

uint64_t ppp_subtype(unint64_t a1)
{
  if (my_CFEqual(a1, (unint64_t)kSCValNetInterfaceSubTypePPPSerial))
  {
    return 0;
  }
  else if (my_CFEqual(a1, (unint64_t)kSCValNetInterfaceSubTypePPPoE))
  {
    return 2;
  }
  else if (my_CFEqual(a1, (unint64_t)kSCValNetInterfaceSubTypeL2TP))
  {
    return 5;
  }
  else
  {
    return (unsigned __int16)-16;
  }
}

uint64_t ppp_new_service(uint64_t a1)
{
  *(void *)(a1 + 624) = 0xFFFFFFFFLL;
  *(void *)(a1 + 592) = -1;
  *(void *)(a1 + 600) = -1;
  *(_DWORD *)(a1 + 608) = -1;
  if (*(void *)(a1 + 40))
  {
    __strlcpy_chk();
    buffer[0] = 0;
    CFStringGetCString(*(CFStringRef *)(a1 + 40), buffer, 32, 0x8000100u);
    __strlcat_chk();
    __strlcat_chk();
    size_t v2 = strlen(__s);
    CFURLRef v3 = CFURLCreateFromFileSystemRepresentation(0, (const UInt8 *)__s, v2, 1u);
    if (v3)
    {
      CFURLRef v4 = v3;
      my_CFRelease((const void **)(a1 + 616));
      *(void *)(a1 + 616) = CFBundleCreate(0, v4);
      CFRelease(v4);
    }
  }
  return 0;
}

uint64_t ppp_dispose_service(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 628)) {
    return 1;
  }
  sub_C904(a1);
  my_CFRelease((const void **)(a1 + 472));
  my_CFRelease((const void **)(a1 + 480));
  my_CFRelease((const void **)(a1 + 136));
  return 0;
}

void sub_C904(uint64_t a1)
{
  int v2 = *(_DWORD *)(a1 + 624);
  if (v2 != -1)
  {
    close(v2);
    *(_DWORD *)(a1 + 624) = -1;
  }
  CFURLRef v3 = *(const void **)(a1 + 80);
  if (v3)
  {
    CFRelease(v3);
    *(void *)(a1 + 80) = 0;
  }
}

uint64_t ppp_setup_service(uint64_t a1)
{
  pid_t v26 = 0;
  *(_DWORD *)(a1 + 72) &= 0xF780FEFF;
  int v2 = (const __CFDictionary **)(a1 + 136);
  my_CFRelease((const void **)(a1 + 136));
  uint64_t v3 = *(void *)(a1 + 584);
  if (v3)
  {
    CFURLRef v4 = (__CFString *)ne_sm_bridge_copy_configuration(v3);
    int v5 = v4;
    pid_t v26 = v4;
    if (v4 && (CFDictionaryRef Value = CFDictionaryGetValue((CFDictionaryRef)v4, kSCEntNetPPP)) != 0)
    {
      CFDictionaryRef v7 = (const __CFDictionary *)CFRetain(Value);
      *int v2 = v7;
    }
    else
    {
      CFDictionaryRef v7 = *v2;
    }
  }
  else
  {
    CFDictionaryRef v7 = (const __CFDictionary *)copyEntity((const __SCDynamicStore *)gDynamicStore, kSCDynamicStoreDomainSetup, *(const __CFString **)(a1 + 24), kSCEntNetPPP);
    int v5 = 0;
    *(void *)(a1 + 136) = v7;
  }
  int v27 = 0;
  if (!v7) {
    goto LABEL_25;
  }
  int v27 = 0;
  getNumber(v7, kSCPropNetPPPDialOnDemand, &v27);
  if (v27) {
    *(_DWORD *)(a1 + 72) |= 0x10000u;
  }
  int v27 = 0;
  getNumber(*v2, kSCPropNetPPPDisconnectOnLogout, &v27);
  if (v27) {
    *(_DWORD *)(a1 + 72) |= 0x20000u;
  }
  int v27 = *(unsigned __int16 *)(a1 + 66) != 5;
  getNumber(*(const __CFDictionary **)(a1 + 136), kSCPropNetPPPDisconnectOnSleep, &v27);
  if (v27) {
    *(_DWORD *)(a1 + 72) |= 0x40000u;
  }
  int v27 = 0;
  getNumber(*v2, kSCPropNetPPPOnDemandEnabled, &v27);
  if (v27)
  {
    int v8 = 18874368;
  }
  else
  {
    if (!CFDictionaryGetValue(*v2, kSCPropNetVPNOnDemandRules)
      || !controller_options_is_useVODDisconnectRulesWhenVODDisabled())
    {
      goto LABEL_17;
    }
    int v8 = 0x1000000;
  }
  *(_DWORD *)(a1 + 72) |= v8;
LABEL_17:
  int v27 = *(unsigned __int16 *)(a1 + 66) != 5;
  getNumber(*(const __CFDictionary **)(a1 + 136), @"PreventIdleSleep", &v27);
  int v9 = *(_DWORD *)(a1 + 72);
  if (v27)
  {
    v9 |= 0x80000u;
    *(_DWORD *)(a1 + 72) = v9;
  }
  int v27 = v9 & 0x20000;
  getNumber(*v2, @"DisconnectOnFastUserSwitch", &v27);
  if (v27) {
    *(_DWORD *)(a1 + 72) |= 0x100000u;
  }
  int v27 = 1;
  *(_DWORD *)(a1 + 196) = 0;
  getNumber(*(const __CFDictionary **)(a1 + 136), kSCPropNetPPPDisconnectOnWake, &v27);
  if (v27)
  {
    *(_DWORD *)(a1 + 72) |= 0x8000000u;
    getNumber(*(const __CFDictionary **)(a1 + 136), kSCPropNetPPPDisconnectOnWakeTimer, (void *)(a1 + 196));
  }
  int v27 = 0;
  getNumber(*v2, @"ConnectionPersist", &v27);
  if (v27) {
    *(_DWORD *)(a1 + 72) |= 0x400000u;
  }
LABEL_25:
  if (*(_WORD *)(a1 + 66) == 2)
  {
    CFDictionaryRef v10 = (const __CFDictionary *)copyEntity((const __SCDynamicStore *)gDynamicStore, kSCDynamicStoreDomainSetup, *(const __CFString **)(a1 + 24), kSCEntNetInterface);
    if (v10)
    {
      CFDictionaryRef v11 = v10;
      *(void *)&v29.sa_len = 0;
      *(void *)&v29.sa_data[6] = 0;
      __int16 v30 = 0;
      CFStringRef v12 = (const __CFString *)CFDictionaryGetValue(v10, kSCPropNetInterfaceDeviceName);
      CFStringRef v13 = (const __CFString *)CFDictionaryGetValue(v11, kSCPropNetInterfaceHardware);
      CFTypeID TypeID = CFStringGetTypeID();
      if (!v13) {
        goto LABEL_33;
      }
      if (CFGetTypeID(v13) != TypeID) {
        goto LABEL_33;
      }
      CFTypeID v15 = CFStringGetTypeID();
      if (!v12
        || CFGetTypeID(v12) != v15
        || CFStringCompare(v13, kSCEntNetAirPort, 0) && CFStringCompare(v13, kSCEntNetEthernet, 0))
      {
        goto LABEL_33;
      }
      CFStringRef v24 = *(const __CFString **)(a1 + 80);
      if (!v24) {
        goto LABEL_67;
      }
      if (CFStringCompare(v12, v24, 0)) {
        sub_C904(a1);
      }
      if (!*(void *)(a1 + 80))
      {
LABEL_67:
        int v25 = socket(27, 3, 0);
        *(_DWORD *)(a1 + 624) = v25;
        if ((v25 & 0x80000000) == 0)
        {
          *(void *)(a1 + 80) = v12;
          CFRetain(v12);
          CFStringGetCString(v12, v29.sa_data, 16, 0);
          *(_WORD *)&v29.sa_len = 6930;
          if (bind(*(_DWORD *)(a1 + 624), &v29, 0x12u) < 0) {
LABEL_33:
          }
            sub_C904(a1);
        }
      }
      CFRelease(v11);
    }
  }
  int v16 = *(_DWORD *)(a1 + 628);
  if (v16 == 11 || v16 == 3)
  {
    *(_DWORD *)(a1 + 72) = *(_DWORD *)(a1 + 72) & 0xFFFFFFE7 | 8;
    scnc_stop(a1, 0, 15, 0);
  }
  else if (v16)
  {
    *(_DWORD *)(a1 + 72) = *(_DWORD *)(a1 + 72) & 0xFFFFFFE7 | 0x10;
    if (v5
      || (v5 = copyService((const __SCDynamicStore *)gDynamicStore, kSCDynamicStoreDomainSetup, *(const __CFString **)(a1 + 24)), (pid_t v26 = v5) != 0))
    {
      CFDictionaryRef v19 = *(const __CFDictionary **)(a1 + 128);
      CFStringRef v20 = CFDictionaryGetValue((CFDictionaryRef)v5, kSCEntNetPPP);
      if (v20)
      {
        CFTypeID v21 = CFGetTypeID(v20);
        if (v21 == CFDictionaryGetTypeID())
        {
          uint64_t v28 = 0;
          int v22 = *(_DWORD *)(a1 + 596);
          sub_F034(v22, "[OPTIONS]");
          get_int_option(a1, kSCEntNetPPP, kSCPropNetPPPIdleReminder, v19, (CFDictionaryRef)v5, (_DWORD *)&v28 + 1, 0);
          if (HIDWORD(v28))
          {
            get_int_option(a1, kSCEntNetPPP, kSCPropNetPPPIdleReminderTimer, v19, (CFDictionaryRef)v5, (_DWORD *)&v28 + 1, 0);
            int v23 = HIDWORD(v28);
          }
          else
          {
            int v23 = 0;
          }
          sub_115A0(v22, "reminder", v23);
          ppp_getoptval(a1, v19, (CFDictionaryRef)v5, 4, (char *)&v28 + 4, 4u, (unsigned int *)&v28);
          sub_115A0(v22, "idle", SHIDWORD(v28));
          if (v19 && GetStrFromDict(v19, @"OutgoingInterface", (char *)&v29, 24, "")) {
            sub_11620(v22, "ifscope", (char *)&v29);
          }
          sub_F034(v22, "[EOP]");
        }
      }
    }
  }
  else
  {
    int v17 = *(_DWORD *)(a1 + 72);
    if ((v17 & 0x10000) != 0 && ((v17 & 0x20000) == 0 || gLoggedInUser)) {
      ppp_start(a1, 0);
    }
  }
  my_CFRelease((const void **)&v26);
  return 0;
}

uint64_t ppp_start(unint64_t a1, CFTypeRef cf1, int a3, int a4, mach_port_name_t a5, mach_port_name_t a6, int a7, int a8)
{
  int v133 = 1;
  unsigned int v134 = 0;
  *(_DWORD *)(a1 + 72) &= 0xFFFFFDE7;
  int v14 = *(_DWORD *)(a1 + 628);
  if (v14)
  {
    if (v14 == 11 || v14 == 3)
    {
      my_CFRelease((const void **)(a1 + 640));
      *(void *)(a1 + 640) = cf1;
      *(_DWORD *)(a1 + 648) = a3;
      *(_DWORD *)(a1 + 652) = a4;
      *(_DWORD *)(a1 + 656) = a5;
      *(_DWORD *)(a1 + 660) = a6;
      my_CFRetain(cf1);
      scnc_stop(a1, 0, 15, 0);
      uint64_t result = 0;
      *(_DWORD *)(a1 + 72) |= 4u;
    }
    else if (my_CFEqual((unint64_t)cf1, *(void *)(a1 + 128)))
    {
      phase_changed(a1, *(_DWORD *)(a1 + 628));
      return 0;
    }
    else
    {
      return 5;
    }
    return result;
  }
  scnc_log(7, @"PPP Controller: VPN System Prefs %@");
  scnc_log(7, @"PPP Controller: VPN User Options %@");
  CFDictionaryRef v19 = *(__CFUserNotification **)(a1 + 168);
  if (v19)
  {
    CFUserNotificationCancel(v19);
    Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveSource(Current, *(CFRunLoopSourceRef *)(a1 + 176), kCFRunLoopDefaultMode);
    my_CFRelease((const void **)(a1 + 168));
    my_CFRelease((const void **)(a1 + 176));
  }
  *(void *)(a1 + 632) = 1;
  uint64_t v21 = *(void *)(a1 + 584);
  if (v21) {
    uint64_t v22 = ne_sm_bridge_copy_configuration(v21);
  }
  else {
    uint64_t v22 = (uint64_t)copyService((const __SCDynamicStore *)gDynamicStore, kSCDynamicStoreDomainSetup, *(const __CFString **)(a1 + 24));
  }
  CFDictionaryRef v24 = (const __CFDictionary *)v22;
  long long v141 = 0u;
  long long v142 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  long long v138 = 0u;
  if (v22)
  {
    long long v141 = 0uLL;
    long long v142 = 0uLL;
    long long v139 = 0uLL;
    long long v140 = 0uLL;
    long long v138 = 0uLL;
    sub_FF38((uint64_t)&v138, &v134, "pppd");
    sub_FF38((uint64_t)&v138, &v134, "serviceid");
    sub_FF38((uint64_t)&v138, &v134, *(char **)(a1 + 56));
    sub_FF38((uint64_t)&v138, &v134, "controlled");
    if (socketpair(1, 1, 0, (int *)(a1 + 592)) == -1
      || socketpair(1, 1, 0, (int *)(a1 + 600)) == -1
      || setsockopt(*(_DWORD *)(a1 + 596), 0xFFFF, 4130, &v133, 4u) == -1)
    {
      goto LABEL_310;
    }
    *(_DWORD *)(a1 + 72) = *(_DWORD *)(a1 + 72) & 0xFFFFFBFF | ((a8 != 0) << 10);
    *(_DWORD *)(a1 + 88) = a3;
    *(_DWORD *)(a1 + 92) = a4;
    scnc_bootstrap_retain(a1, a5);
    scnc_ausession_retain(a1, a6);
    if (*(void *)(a1 + 584))
    {
      CFDictionaryRef Value = CFDictionaryGetValue(v24, @"EnvironmentVariables");
      if (!Value) {
        goto LABEL_26;
      }
      CFTypeRef v26 = CFRetain(Value);
    }
    else
    {
      CFTypeRef v26 = collectEnvironmentVariables((const __SCDynamicStore *)gDynamicStore, *(const __CFString **)(a1 + 24));
    }
    int v27 = v26;
    if (v26)
    {
      extractEnvironmentVariables(v26, a1);
      CFRelease(v27);
    }
LABEL_26:
    uint64_t v28 = makeref(a1);
    uint64_t v29 = geteuid();
    uint64_t v30 = getegid();
    unsigned int v31 = makeref(a1);
    int v32 = SCNCPluginExecCommand2(0, (uint64_t)sub_FFAC, v28, v29, v30, (uint64_t)"/usr/sbin/pppd", (uint64_t)&v138, (uint64_t)sub_10180, v31);
    *(_DWORD *)(a1 + 608) = v32;
    if (v32 != -1)
    {
      v136 = 0;
      int v135 = 0;
      CFDictionaryRef v33 = (__CFString *)kSCEntNetPPP;
      CFDictionaryRef v34 = (const __CFDictionary *)CFDictionaryGetValue(v24, kSCEntNetPPP);
      if (v34)
      {
        CFDictionaryRef v35 = v34;
        CFTypeID v36 = CFGetTypeID(v34);
        if (v36 == CFDictionaryGetTypeID())
        {
          uint64_t v137 = 0;
          int v37 = *(_DWORD *)(a1 + 596);
          sub_F034(v37, "[OPTIONS]");
          if (gPluginsDir)
          {
            CFStringGetCString((CFStringRef)gPluginsDir, buffer, 1024, 0x8000100u);
            __strlcat_chk();
            sub_11620(v37, "plugin", buffer);
            if (*(_WORD *)(a1 + 66) == 5) {
              sub_115A0(v37, "dialogtype", 1);
            }
          }
          get_int_option(a1, kSCEntNetPPP, kSCPropNetPPPVerboseLogging, (CFDictionaryRef)cf1, v24, &v137, 0);
          if (v137) {
            sub_F034(v37, "debug");
          }
          *(_DWORD *)(a1 + 72) &= 0xFFFFFF3F;
          ppp_getoptval(a1, (CFDictionaryRef)cf1, v24, 20, (char *)&v137, 4u, (unsigned int *)&v137 + 1);
          char v38 = v137;
          if ((v137 & 2) != 0) {
            *(_DWORD *)(a1 + 72) |= 0x40u;
          }
          if ((v38 & 8) != 0) {
            *(_DWORD *)(a1 + 72) |= 0x80u;
          }
          if (ppp_getoptval(a1, (CFDictionaryRef)cf1, v24, 17, cStr, 0x100u, (unsigned int *)&v137 + 1)
            && cStr[0])
          {
            if (cStr[0] == 47) {
              int v39 = "";
            }
            else {
              int v39 = "/var/log/ppp/";
            }
            snprintf(buffer, 0x400uLL, "%s%s", v39, cStr);
            sub_11620(v37, "logfile", buffer);
          }
          CFStringRef v40 = *(const __CFString **)(a1 + 40);
          if (v40)
          {
            CFStringGetCString(v40, __str, 252, 0x8000100u);
            __strlcat_chk();
            sub_11620(v37, "plugin", __str);
          }
          if (ppp_getoptval(a1, (CFDictionaryRef)cf1, v24, 1, cStr, 0x100u, (unsigned int *)&v137 + 1)
            && cStr[0])
          {
            sub_11620(v37, "device", cStr);
          }
          if (ppp_getoptval(a1, (CFDictionaryRef)cf1, v24, 2, (char *)&v137, 4u, (unsigned int *)&v137 + 1)&& v137)
          {
            snprintf(buffer, 0x400uLL, "%d", v137);
            sub_F034(v37, buffer);
          }
          if (cf1
            && GetStrFromDict((const __CFDictionary *)cf1, @"OutgoingInterface", v143, 24, ""))
          {
            sub_11620(v37, "ifscope", v143);
          }
          CFDictionaryRef theDict = v35;
          int v132 = v37;
          if (*(_WORD *)(a1 + 66) != 5)
          {
            if (!*(_WORD *)(a1 + 66))
            {
              get_str_option(a1, kSCEntNetInterface, kSCPropNetInterfaceHardware, (CFDictionaryRef)cf1, 0, cStr, 0x100u, &v137, "");
              if (*(_DWORD *)cStr == 1701080909 && v145 == 109)
              {
                int v42 = (void *)copyEntity((const __SCDynamicStore *)gDynamicStore, kSCDynamicStoreDomainSetup, *(const __CFString **)(a1 + 24), kSCEntNetModem);
                if (v42)
                {
                  uint64_t v43 = v42;
                  if (cf1)
                  {
                    CFDictionaryRef v44 = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)cf1, kSCEntNetModem);
                    if (v44
                      && (CFDictionaryRef v45 = v44, v46 = CFGetTypeID(v44), v46 == CFDictionaryGetTypeID())
                      && CFDictionaryGetCount(v45)
                      && (CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, (CFDictionaryRef)v43)) != 0)
                    {
                      CFNumberRef v48 = MutableCopy;
                      CFNumberRef v49 = CFDictionaryGetValue(v45, kSCPropNetModemConnectionScript);
                      if (v49) {
                        CFDictionarySetValue(v48, kSCPropNetModemConnectionScript, v49);
                      }
                      long long v50 = CFDictionaryGetValue(v45, kSCPropNetModemSpeaker);
                      if (v50) {
                        CFDictionarySetValue(v48, kSCPropNetModemSpeaker, v50);
                      }
                      CFStringRef v51 = CFDictionaryGetValue(v45, kSCPropNetModemErrorCorrection);
                      if (v51) {
                        CFDictionarySetValue(v48, kSCPropNetModemErrorCorrection, v51);
                      }
                      long long v52 = CFDictionaryGetValue(v45, kSCPropNetModemDataCompression);
                      if (v52) {
                        CFDictionarySetValue(v48, kSCPropNetModemDataCompression, v52);
                      }
                      int v53 = CFDictionaryGetValue(v45, kSCPropNetModemPulseDial);
                      if (v53) {
                        CFDictionarySetValue(v48, kSCPropNetModemPulseDial, v53);
                      }
                      uint64_t v54 = CFDictionaryGetValue(v45, kSCPropNetModemDialMode);
                      if (v54) {
                        CFDictionarySetValue(v48, kSCPropNetModemDialMode, v54);
                      }
                      CFRelease(v43);
                    }
                    else
                    {
                      CFNumberRef v48 = (__CFDictionary *)v43;
                    }
                    int v37 = v132;
                  }
                  else
                  {
                    CFNumberRef v48 = (__CFDictionary *)v42;
                  }
                  CFDataRef v127 = Serialize(v48, &v136, &v135);
                  if (v127)
                  {
                    CFDataRef v128 = v127;
                    sub_116EC(v37, v136, v135);
                    CFRelease(v128);
                  }
                  CFRelease(v48);
                  CFDictionaryRef v33 = (__CFString *)kSCEntNetPPP;
                }
              }
            }
LABEL_98:
            if (ppp_getoptval(a1, (CFDictionaryRef)cf1, v24, 24, (char *)&v137, 4u, (unsigned int *)&v137 + 1))
            {
              int v64 = v137;
              if (v137)
              {
                if (*(_WORD *)(a1 + 66))
                {
                  sub_11620(v37, "plugin", "PPPSerial.ppp");
                  int v64 = v137;
                }
                if (v64 == 1)
                {
                  if (ppp_getoptval(a1, (CFDictionaryRef)cf1, v24, 25, cStr, 0x100u, (unsigned int *)&v137 + 1)&& cStr[0])
                  {
                    sub_11620(v37, "terminalscript", cStr);
                  }
                }
                else if (v64 == 2)
                {
                  sub_F034(v37, "terminalwindow");
                }
              }
            }
            if (ppp_getoptval(a1, (CFDictionaryRef)cf1, v24, 5, cStr, 0x100u, (unsigned int *)&v137 + 1)
              && cStr[0])
            {
              sub_11620(v37, "remoteaddress", cStr);
            }
            get_int_option(a1, v33, kSCPropNetPPPCommRedialEnabled, (CFDictionaryRef)cf1, v24, &v137, 0);
            if (v137)
            {
              get_str_option(a1, v33, kSCPropNetPPPCommAlternateRemoteAddress, (CFDictionaryRef)cf1, v24, cStr, 0x100u, &v137, "");
              if (cStr[0]) {
                sub_11620(v37, "altremoteaddress", cStr);
              }
              get_int_option(a1, v33, kSCPropNetPPPCommRedialCount, (CFDictionaryRef)cf1, v24, &v137, 0);
              if (v137) {
                sub_115A0(v37, "redialcount", v137);
              }
              get_int_option(a1, v33, kSCPropNetPPPCommRedialInterval, (CFDictionaryRef)cf1, v24, &v137, 0);
              if (v137) {
                sub_115A0(v37, "redialtimer", v137);
              }
            }
            double v65 = 0.0;
            if (!gSleeping) {
              double v65 = *(double *)&gTimeScaleSeconds * (double)(mach_absolute_time() - gWakeUpTime);
            }
            if ((int)v65 <= 19)
            {
              if (20 - (int)v65 <= 3) {
                int v66 = 3;
              }
              else {
                int v66 = 20 - (int)v65;
              }
              sub_115A0(v37, "extraconnecttime", v66);
            }
            if (ppp_getoptval(a1, (CFDictionaryRef)cf1, v24, 4, (char *)&v137, 4u, (unsigned int *)&v137 + 1)&& v137)
            {
              sub_115A0(v37, "idle", v137);
              sub_F034(v37, "noidlerecv");
            }
            if (ppp_getoptval(a1, (CFDictionaryRef)cf1, v24, 23, (char *)&v137, 4u, (unsigned int *)&v137 + 1)&& v137)
            {
              sub_115A0(v37, "maxconnect", v137);
            }
            if (a7)
            {
              sub_F034(v37, "demand");
              get_int_option(a1, v33, @"HoldOffTime", 0, v24, &v137, 30);
              sub_115A0(v37, "holdoff", v137);
              if ((a7 & 2) != 0 && v137) {
                sub_F034(v37, "holdfirst");
              }
              get_int_option(a1, v33, @"MaxFailure", 0, v24, &v137, 3);
              sub_115A0(v37, "maxfail", v137);
            }
            if (ppp_getoptval(a1, (CFDictionaryRef)cf1, v24, 21, (char *)&v137, 4u, (unsigned int *)&v137 + 1))
            {
              unsigned __int16 v67 = v137;
              if (v137)
              {
                if (v137 >= 0x10000)
                {
                  sub_115A0(v37, "lcp-echo-interval", WORD1(v137));
                  unsigned __int16 v67 = v137;
                }
                if (v67) {
                  sub_115A0(v37, "lcp-echo-failure", v67);
                }
              }
            }
            if (ppp_getoptval(a1, (CFDictionaryRef)cf1, v24, 9, (char *)&v137, 4u, (unsigned int *)&v137 + 1))
            {
              char v68 = v137;
              if ((v137 & 1) == 0)
              {
                sub_F034(v37, "nopcomp");
                char v68 = v137;
              }
              if ((v68 & 2) == 0) {
                sub_F034(v37, "noaccomp");
              }
            }
            if (ppp_getoptval(a1, (CFDictionaryRef)cf1, v24, 10, (char *)&v137, 4u, (unsigned int *)&v137 + 1)&& v137)
            {
              sub_115A0(v37, "mru", v137);
            }
            if (ppp_getoptval(a1, (CFDictionaryRef)cf1, v24, 11, (char *)&v137, 4u, (unsigned int *)&v137 + 1)&& v137)
            {
              sub_115A0(v37, "mtu", v137);
            }
            if (ppp_getoptval(a1, (CFDictionaryRef)cf1, v24, 12, (char *)&v137, 4u, (unsigned int *)&v137 + 1))
            {
              if (v137)
              {
                sub_115A0(v37, "asyncmap", v137);
LABEL_159:
                if (ppp_getoptval(a1, (CFDictionaryRef)cf1, v24, 13, (char *)&v137, 4u, (unsigned int *)&v137 + 1)&& v137)
                {
                  sub_F034(v37, "escape");
                  int v70 = 0;
                  buffer[0] = 0;
                  do
                  {
                    if ((v137 >> v70))
                    {
                      snprintf(__str, 0x100uLL, "%d,", v70);
                      __strlcat_chk();
                    }
                    ++v70;
                  }
                  while (v70 != 32);
                  buffer[strlen(buffer) - 1] = 0;
                  sub_F034(v37, buffer);
                }
                if (CFDictionaryContainsKey(v24, kSCEntNetIPv4))
                {
                  if (getStringFromEntity((const __SCDynamicStore *)gDynamicStore, kSCDynamicStoreDomainState, 0, kSCEntNetIPv4, kSCPropNetIPv4Router, cStr, 0x100u))BOOL v71 = cStr[0] == 0; {
                  else
                  }
                    BOOL v71 = 1;
                  if (!v71) {
                    sub_11620(v37, "ipparam", cStr);
                  }
                  get_int_option(a1, kSCEntNetIPv4, kSCPropNetOverridePrimary, 0, v24, &v137, 0);
                  if (v137)
                  {
                    sub_F034(v37, "defaultroute");
                    int v72 = 1;
                  }
                  else
                  {
                    int v72 = 0;
                  }
                  if (!ppp_getoptval(a1, (CFDictionaryRef)cf1, v24, 14, (char *)&v137, 4u, (unsigned int *)&v137 + 1)|| !v137)
                  {
                    sub_F034(v37, "novj");
                  }
                  if (*(_WORD *)(a1 + 66) == 5) {
                    sub_115A0(v37, "ip-src-address-filter", 2);
                  }
                  if (ppp_getoptval(a1, (CFDictionaryRef)cf1, v24, 15, (char *)&v137, 4u, (unsigned int *)&v137 + 1)&& v137)
                  {
                    snprintf(__str, 0x100uLL, "%d.%d.%d.%d", BYTE3(v137), BYTE2(v137), BYTE1(v137), v137);
                  }
                  else
                  {
                    __strlcpy_chk();
                  }
                  __strlcpy_chk();
                  __strlcat_chk();
                  if (ppp_getoptval(a1, (CFDictionaryRef)cf1, v24, 16, (char *)&v137, 4u, (unsigned int *)&v137 + 1)&& v137)
                  {
                    snprintf(__str, 0x100uLL, "%d.%d.%d.%d", BYTE3(v137), BYTE2(v137), BYTE1(v137), v137);
                  }
                  else
                  {
                    __strlcpy_chk();
                  }
                  __strlcat_chk();
                  sub_F034(v37, buffer);
                  sub_F034(v37, "noipdefault");
                  sub_F034(v37, "ipcp-accept-local");
                  sub_F034(v37, "ipcp-accept-remote");
                  get_int_option(a1, v33, @"IPCPUsePeerDNS", (CFDictionaryRef)cf1, v24, &v137, 1);
                  if (v137) {
                    sub_F034(v37, "usepeerdns");
                  }
                  if (*(_WORD *)(a1 + 66) != 5)
                  {
LABEL_194:
                    if (CFDictionaryContainsKey(v24, kSCEntNetIPv6))
                    {
                      sub_F034(v37, "+ipv6");
                      sub_F034(v37, "ipv6cp-use-persistent");
                    }
                    if (v72)
                    {
                      sub_F034(v37, "noacsp");
                      stat v74 = "no-use-dhcp";
                    }
                    else
                    {
                      get_int_option(a1, v33, kSCPropNetPPPACSPEnabled, (CFDictionaryRef)cf1, v24, &v137, 0);
                      if (!v137) {
                        sub_F034(v37, "noacsp");
                      }
                      get_int_option(a1, v33, @"UseDHCP", (CFDictionaryRef)cf1, v24, &v137, *(unsigned __int16 *)(a1 + 66) == 5);
                      if (v137 != 1)
                      {
LABEL_203:
                        sub_F034(v37, "noauth");
                        int v75 = ppp_getoptval(a1, (CFDictionaryRef)cf1, v24, 6, (char *)&v137, 4u, (unsigned int *)&v137 + 1);
                        BOOL v76 = 0;
                        int v77 = 1;
                        if (v75 && v137)
                        {
                          if (ppp_getoptval(a1, (CFDictionaryRef)cf1, v24, 7, cStr, 0x100u, (unsigned int *)&v137 + 1)&& cStr[0])
                          {
                            sub_11620(v37, "user", cStr);
                            int str_option = get_str_option(a1, v33, kSCPropNetPPPAuthPassword, (CFDictionaryRef)cf1, v24, cStr, 0x100u, &v137, "");
                            int v79 = cStr[0];
                            CFTypeID TypeID = CFStringGetTypeID();
                            if (v79)
                            {
                              if (str_option == 3) {
                                CFDictionaryRef v81 = 0;
                              }
                              else {
                                CFDictionaryRef v81 = (const __CFDictionary *)cf1;
                              }
                              if (str_option == 3) {
                                CFDictionaryRef v82 = v24;
                              }
                              else {
                                CFDictionaryRef v82 = 0;
                              }
                              CFStringRef cf_option = (const __CFString *)get_cf_option(v33, kSCPropNetPPPAuthPasswordEncryption, TypeID, v81, v82, 0);
                              if (!cf_option) {
                                goto LABEL_217;
                              }
                              CFStringRef v84 = cf_option;
                              if (CFEqual(cf_option, kSCValNetPPPAuthPasswordEncryptionKeychain))
                              {
                                if (str_option == 3) {
                                  v87 = "keychainpassword";
                                }
                                else {
                                  v87 = "userkeychainpassword";
                                }
LABEL_231:
                                sub_11620(v37, v87, cStr);
LABEL_232:
                                BOOL v76 = 1;
                                goto LABEL_233;
                              }
                              if (CFStringCompare(v84, kSCValNetPPPAuthPasswordEncryptionToken, 0))
                              {
LABEL_217:
                                CFStringRef v85 = CFStringCreateWithCString(0, cStr, 0x8000100u);
                                if (v85)
                                {
                                  CFStringRef v86 = v85;
                                  CFStringGetCString(v85, cStr, 256, 0x500u);
                                  CFRelease(v86);
                                }
                                v87 = "password";
                                goto LABEL_231;
                              }
                            }
                            else
                            {
                              CFStringRef v90 = (const __CFString *)get_cf_option(v33, kSCPropNetPPPAuthPasswordEncryption, TypeID, (CFDictionaryRef)cf1, v24, 0);
                              if (!v90 || CFStringCompare(v90, kSCValNetPPPAuthPasswordEncryptionToken, 0)) {
                                goto LABEL_232;
                              }
                            }
                          }
                          else
                          {
                            CFTypeID v88 = CFStringGetTypeID();
                            CFStringRef v89 = (const __CFString *)get_cf_option(v33, kSCPropNetPPPAuthPasswordEncryption, v88, (CFDictionaryRef)cf1, v24, 0);
                            if (!v89 || CFStringCompare(v89, kSCValNetPPPAuthPasswordEncryptionToken, 0))
                            {
                              BOOL v76 = *(unsigned __int16 *)(a1 + 66) == 5;
LABEL_233:
                              int v77 = 1;
                              goto LABEL_234;
                            }
                          }
                          BOOL v76 = 1;
                          sub_115A0(v37, "tokencard", 1);
                          int v77 = 0;
                        }
LABEL_234:
                        int v129 = v77;
                        int v130 = v76;
                        if (!cf1
                          || (CFDictionaryRef v91 = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)cf1, v33)) == 0
                          || (CFDictionaryRef v92 = v91, v93 = CFGetTypeID(v91), v93 != CFDictionaryGetTypeID())
                          || (v94 = CFDictionaryGetValue(v92, kSCPropNetPPPAuthProtocol)) == 0
                          || (v95 = v94, CFTypeID v96 = CFGetTypeID(v94), v96 != CFArrayGetTypeID()))
                        {
                          v95 = CFDictionaryGetValue(theDict, kSCPropNetPPPAuthProtocol);
                          if (!v95) {
                            goto LABEL_258;
                          }
                        }
                        CFTypeID v97 = CFGetTypeID(v95);
                        if (v97 == CFArrayGetTypeID()
                          && (LODWORD(v137) = CFArrayGetCount((CFArrayRef)v95), v137))
                        {
                          unint64_t v98 = 0;
                          int v99 = 0;
                          do
                          {
                            CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)v95, v98);
                            if (ValueAtIndex)
                            {
                              CFStringRef v101 = ValueAtIndex;
                              CFTypeID v102 = CFGetTypeID(ValueAtIndex);
                              if (v102 == CFStringGetTypeID())
                              {
                                if (CFStringCompare(v101, kSCValNetPPPAuthProtocolPAP, 0))
                                {
                                  if (CFStringCompare(v101, kSCValNetPPPAuthProtocolCHAP, 0))
                                  {
                                    if (CFStringCompare(v101, @"MSCHAP1", 0))
                                    {
                                      if (CFStringCompare(v101, @"MSCHAP2", 0))
                                      {
                                        if (CFEqual(v101, @"EAP")) {
                                          v99 |= 0x10u;
                                        }
                                      }
                                      else
                                      {
                                        v99 |= 8u;
                                      }
                                    }
                                    else
                                    {
                                      v99 |= 4u;
                                    }
                                  }
                                  else
                                  {
                                    v99 |= 2u;
                                  }
                                }
                                else
                                {
                                  v99 |= 1u;
                                }
                              }
                            }
                            ++v98;
                          }
                          while (v98 < v137);
                        }
                        else
                        {
LABEL_258:
                          int v99 = 15;
                        }
                        if (v129)
                        {
                          CFStringRef v103 = kSCEntNetPPP;
                          get_int_option(a1, kSCEntNetPPP, @"TokenCard", (CFDictionaryRef)cf1, v24, &v137, 0);
                          if (v137)
                          {
                            sub_115A0(v132, "tokencard", v137);
                            int v130 = 1;
                          }
                        }
                        else
                        {
                          CFStringRef v103 = kSCEntNetPPP;
                        }
                        if ((v99 & 0x10) != 0)
                        {
                          v99 &= ~0x10u;
                          if (cf1
                            && (CFDictionaryRef v104 = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)cf1, v103)) != 0
                            && (CFDictionaryRef v105 = v104, v106 = CFGetTypeID(v104), v106 == CFDictionaryGetTypeID())
                            && (v107 = CFDictionaryGetValue(v105, @"AuthEAPPlugins")) != 0
                            && (v108 = v107, CFTypeID v109 = CFGetTypeID(v107), v109 == CFArrayGetTypeID()))
                          {
                            int v110 = 1;
                          }
                          else
                          {
                            v111 = CFDictionaryGetValue(theDict, @"AuthEAPPlugins");
                            if (!v111) {
                              goto LABEL_282;
                            }
                            v108 = v111;
                            int v110 = 0;
                          }
                          CFTypeID v112 = CFGetTypeID(v108);
                          if (v112 == CFArrayGetTypeID())
                          {
                            LODWORD(v137) = CFArrayGetCount((CFArrayRef)v108);
                            if (v137)
                            {
                              unint64_t v113 = 0;
                              do
                              {
                                CFStringRef v114 = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)v108, v113);
                                if (v114)
                                {
                                  CFStringRef v115 = v114;
                                  CFTypeID v116 = CFGetTypeID(v114);
                                  if (v116 == CFStringGetTypeID())
                                  {
                                    CFStringGetCString(v115, buffer, 1020, 0x8000100u);
                                    if (!v110 || !strchr(buffer, 92))
                                    {
                                      __strlcat_chk();
                                      sub_11620(v132, "eapplugin", buffer);
                                      v99 |= 0x10u;
                                    }
                                  }
                                  CFStringRef v103 = kSCEntNetPPP;
                                }
                                ++v113;
                              }
                              while (v113 < v137);
                            }
                          }
                        }
LABEL_282:
                        sub_F034(v132, "noccp");
                        if (v99)
                        {
                          if ((v99 & 2) != 0) {
                            goto LABEL_284;
                          }
                        }
                        else
                        {
                          sub_F034(v132, "refuse-pap");
                          if ((v99 & 2) != 0)
                          {
LABEL_284:
                            if ((v99 & 4) != 0) {
                              goto LABEL_285;
                            }
                            goto LABEL_319;
                          }
                        }
                        sub_F034(v132, "refuse-chap-md5");
                        if ((v99 & 4) != 0)
                        {
LABEL_285:
                          if ((v99 & 8) != 0) {
                            goto LABEL_286;
                          }
                          goto LABEL_320;
                        }
LABEL_319:
                        sub_F034(v132, "refuse-mschap");
                        if ((v99 & 8) != 0)
                        {
LABEL_286:
                          if ((v99 & 0x10) != 0) {
                            goto LABEL_288;
                          }
                          goto LABEL_287;
                        }
LABEL_320:
                        sub_F034(v132, "refuse-mschap-v2");
                        if ((v99 & 0x10) != 0)
                        {
LABEL_288:
                          if (v99 == 16 || !v130 || (*(_DWORD *)(a1 + 72) & 0x80) == 0) {
                            sub_F034(v132, "noaskpassword");
                          }
                          get_str_option(a1, v103, kSCPropNetPPPAuthPrompt, (CFDictionaryRef)cf1, v24, cStr, 0x100u, &v137, "");
                          if (cStr[0])
                          {
                            __str[0] = 0;
                            CFStringGetCString(kSCValNetPPPAuthPromptAfter, __str, 256, 0x8000100u);
                            if (!strcmp(cStr, __str)) {
                              sub_F034(v132, "askpasswordafter");
                            }
                          }
                          sub_F034(v132, "nodetach");
                          get_int_option(a1, v103, kSCPropNetPPPIdleReminder, (CFDictionaryRef)cf1, v24, &v137, 0);
                          if (v137)
                          {
                            get_int_option(a1, v103, kSCPropNetPPPIdleReminderTimer, (CFDictionaryRef)cf1, v24, &v137, 0);
                            if (v137) {
                              sub_115A0(v132, "reminder", v137);
                            }
                          }
                          CFArrayRef v117 = (const __CFArray *)CFDictionaryGetValue(theDict, kSCPropNetPPPPlugins);
                          if (v117)
                          {
                            CFArrayRef v118 = v117;
                            CFTypeID v119 = CFGetTypeID(v117);
                            if (v119 == CFArrayGetTypeID())
                            {
                              LODWORD(v137) = CFArrayGetCount(v118);
                              if (v137)
                              {
                                unint64_t v120 = 0;
                                do
                                {
                                  CFStringRef v121 = (const __CFString *)CFArrayGetValueAtIndex(v118, v120);
                                  if (v121)
                                  {
                                    CFStringRef v122 = v121;
                                    CFTypeID v123 = CFGetTypeID(v121);
                                    if (v123 == CFStringGetTypeID())
                                    {
                                      CFStringGetCString(v122, buffer, 1020, 0x8000100u);
                                      __strlcat_chk();
                                      sub_11620(v132, "plugin", buffer);
                                    }
                                  }
                                  ++v120;
                                }
                                while (v120 < v137);
                              }
                            }
                          }
                          if (GetStrFromDict(theDict, kSCPropUserDefinedName, cStr, 256, "")
                            || GetStrFromDict(v24, kSCPropUserDefinedName, cStr, 256, ""))
                          {
                            sub_11620(v132, "call", cStr);
                          }
                          sub_F034(v132, "[EOP]");
                          ppp_socket_create_client(*(_DWORD *)(a1 + 600), 1, 0, 0);
                          *(_DWORD *)(a1 + 632) = 0;
                          ppp_updatephase(a1, 1u, 0);
                          *(_DWORD *)(a1 + 396) = 0;
                          service_started(a1);
                          *(_DWORD *)(a1 + 72) = *(_DWORD *)(a1 + 72) & 0xFFFFFFDF | (32 * (a7 != 0));
                          *(void *)(a1 + 128) = cf1;
                          my_CFRetain(cf1);
                          goto LABEL_310;
                        }
LABEL_287:
                        sub_F034(v132, "refuse-eap");
                        goto LABEL_288;
                      }
                      stat v74 = "use-dhcp";
                    }
                    sub_F034(v37, v74);
                    goto LABEL_203;
                  }
                  int v73 = "addifroute";
                }
                else
                {
                  int v72 = 0;
                  int v73 = "noip";
                }
                sub_F034(v37, v73);
                goto LABEL_194;
              }
              int v69 = "receive-all";
            }
            else
            {
              int v69 = "default-asyncmap";
            }
            sub_F034(v37, v69);
            goto LABEL_159;
          }
          CFTypeID v55 = CFStringGetTypeID();
          CFStringRef v56 = (const __CFString *)get_cf_option((void *)kSCEntNetL2TP, kSCPropNetL2TPTransport, v55, (CFDictionaryRef)cf1, v24, 0);
          if (v56 && CFEqual(v56, kSCValNetL2TPTransportIP)) {
            sub_F034(v37, "l2tpnoipsec");
          }
          get_str_option(a1, kSCEntNetL2TP, kSCPropNetL2TPIPSecSharedSecret, (CFDictionaryRef)cf1, v24, cStr, 0x100u, &v137, "");
          if (cStr[0])
          {
            sub_11620(v37, "l2tpipsecsharedsecret", cStr);
            CFTypeID v57 = CFStringGetTypeID();
            CFStringRef v58 = (const __CFString *)get_cf_option((void *)kSCEntNetL2TP, kSCPropNetL2TPIPSecSharedSecretEncryption, v57, (CFDictionaryRef)cf1, v24, 0);
            if (!v58) {
              goto LABEL_97;
            }
            CFStringRef v59 = v58;
            if (CFStringCompare(v58, @"Key", 0))
            {
              int v60 = (CFStringRef *)&kSCValNetL2TPIPSecSharedSecretEncryptionKeychain;
              goto LABEL_93;
            }
          }
          else
          {
            get_str_option(a1, kSCEntNetIPSec, kSCPropNetIPSecSharedSecret, (CFDictionaryRef)cf1, v24, cStr, 0x100u, &v137, "");
            if (!cStr[0]) {
              goto LABEL_97;
            }
            sub_11620(v37, "l2tpipsecsharedsecret", cStr);
            CFTypeID v61 = CFStringGetTypeID();
            CFStringRef v62 = (const __CFString *)get_cf_option((void *)kSCEntNetL2TP, kSCPropNetIPSecSharedSecretEncryption, v61, (CFDictionaryRef)cf1, v24, 0);
            if (!v62) {
              goto LABEL_97;
            }
            CFStringRef v59 = v62;
            if (CFStringCompare(v62, @"Key", 0))
            {
              int v60 = (CFStringRef *)&kSCValNetIPSecSharedSecretEncryptionKeychain;
LABEL_93:
              if (CFEqual(v59, *v60))
              {
                v63 = "keychain";
LABEL_96:
                sub_11620(v37, "l2tpipsecsharedsecrettype", v63);
              }
LABEL_97:
              get_int_option(a1, kSCEntNetL2TP, @"UDPPort", (CFDictionaryRef)cf1, v24, &v137, 0);
              sub_115A0(v37, "l2tpudpport", v137);
              goto LABEL_98;
            }
          }
          v63 = "key";
          goto LABEL_96;
        }
      }
      kill(*(_DWORD *)(a1 + 608), 15);
    }
LABEL_310:
    CFRelease(v24);
  }
  uint64_t v124 = v134;
  if (v134)
  {
    v125 = (void **)&v138;
    do
    {
      v126 = *v125++;
      free(v126);
      --v124;
    }
    while (v124);
  }
  if (*(_DWORD *)(a1 + 608) == -1)
  {
    my_close(*(unsigned int *)(a1 + 600));
    *(_DWORD *)(a1 + 600) = -1;
    my_close(*(unsigned int *)(a1 + 604));
    *(_DWORD *)(a1 + 604) = -1;
    my_close(*(unsigned int *)(a1 + 592));
    *(_DWORD *)(a1 + 592) = -1;
    my_close(*(unsigned int *)(a1 + 596));
    *(_DWORD *)(a1 + 596) = -1;
    sub_10464(a1);
  }
  return *(unsigned int *)(a1 + 632);
}

BOOL ppp_can_sleep(uint64_t a1)
{
  return *(_DWORD *)(a1 + 628) != 8 || (*(unsigned char *)(a1 + 74) & 8) == 0;
}

uint64_t ppp_will_sleep(uint64_t a1, int a2)
{
  int v2 = *(_DWORD *)(a1 + 628);
  if (!v2) {
    goto LABEL_4;
  }
  if ((*(unsigned char *)(a1 + 74) & 4) == 0)
  {
    int v2 = 0;
LABEL_4:
    int v3 = 0;
    return v3 | v2;
  }
  int v3 = 2 * (((v2 - 3) & 0xFFFFFFF7) != 0);
  if (!a2) {
    scnc_stop(a1, 0, 15, 2);
  }
  int v2 = 1;
  return v3 | v2;
}

_DWORD *ppp_wake_up(_DWORD *result)
{
  if (result[157]) {
    return (_DWORD *)scnc_disconnectifoverslept((uint64_t)"ppp_wake_up", (uint64_t)result);
  }
  int v1 = result[18];
  if ((v1 & 0x10000) != 0 && ((v1 & 0x20000) == 0 || gLoggedInUser)) {
    return (_DWORD *)ppp_start((unint64_t)result, 0, 0, 0, result[24], result[25], 1, 0);
  }
  return result;
}

uint64_t ppp_log_out(uint64_t result)
{
  if (*(_DWORD *)(result + 628))
  {
    if ((*(unsigned char *)(result + 74) & 2) != 0) {
      return scnc_stop(result, 0, 15, 3);
    }
  }
  return result;
}

unint64_t ppp_log_in(unint64_t result)
{
  if (!*(_DWORD *)(result + 628) && (*(unsigned char *)(result + 74) & 1) != 0) {
    return ppp_start(result, 0, 0, 0, *(_DWORD *)(result + 96), *(_DWORD *)(result + 100), 1, 0);
  }
  return result;
}

_DWORD *ppp_log_switch(_DWORD *result)
{
  unsigned int v1 = result[18];
  if (result[157])
  {
    if ((v1 & 0x100000) != 0)
    {
      result[18] = (v1 >> 13) & 8 | v1 & 0xFFFFFFE7;
      return (_DWORD *)scnc_stop((uint64_t)result, 0, 15, 4);
    }
  }
  else if ((v1 & 0x10000) != 0)
  {
    return (_DWORD *)ppp_start((unint64_t)result, 0, 0, 0, result[24], result[25], 1, 0);
  }
  return result;
}

uint64_t ppp_ondemand_add_service_data(uint64_t a1, __CFDictionary *a2)
{
  CFDictionaryRef v3 = *(const __CFDictionary **)(a1 + 136);
  if (v3)
  {
    CFDictionaryRef Value = CFDictionaryGetValue(v3, kSCPropNetPPPOnDemandMatchDomainsAlways);
    if (isArray(Value)) {
      CFDictionarySetValue(a2, @"OnDemandMatchDomainsAlways", Value);
    }
    uint64_t v6 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 136), kSCPropNetPPPOnDemandMatchDomainsOnRetry);
    if (isArray(v6)) {
      CFDictionarySetValue(a2, @"OnDemandMatchDomainsOnRetry", v6);
    }
    CFDictionaryRef v7 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 136), kSCPropNetPPPOnDemandMatchDomainsNever);
    if (isArray(v7)) {
      CFDictionarySetValue(a2, @"OnDemandMatchDomainsNever", v7);
    }
    int v8 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 136), kSCPropNetPPPCommRemoteAddress);
    if (isString(v8)) {
      CFDictionarySetValue(a2, @"RemoteAddress", v8);
    }
  }
  return 0;
}

uint64_t ppp_install(uint64_t a1)
{
  return 0;
}

ssize_t sub_F034(int a1, char *__s)
{
  size_t v4 = strlen(__s);
  write(a1, __s, v4);

  return write(a1, " ", 1uLL);
}

uint64_t ppp_uninstall(uint64_t a1)
{
  return 0;
}

void MT_pppGetTracerOptions(uint64_t a1, char *a2)
{
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  long long cStr = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v59 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v52 = 0u;
  int v48 = 0;
  bzero(a2, 0x338uLL);
  size_t v4 = copyService((const __SCDynamicStore *)gDynamicStore, kSCDynamicStoreDomainSetup, *(const __CFString **)(a1 + 24));
  if (!v4) {
    return;
  }
  CFDictionaryRef v5 = (const __CFDictionary *)v4;
  CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)v4, kSCEntNetModem);
  if (Value)
  {
    CFDictionaryRef v7 = Value;
    if (getString(Value, kSCPropNetModemDeviceVendor, (char *)&cStr, 0x100u))
    {
      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      long long v74 = 0u;
      long long v75 = 0u;
      long long v72 = 0u;
      long long v73 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      __strlcpy_chk();
      long long cStr = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      long long v99 = 0u;
    }
    if (getString(v7, kSCPropNetModemDeviceModel, (char *)&cStr, 0x100u))
    {
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v59 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v52 = 0u;
      __strlcpy_chk();
      long long cStr = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      long long v99 = 0u;
    }
    if ((_BYTE)v68 && (_BYTE)v52)
    {
      *((_OWORD *)a2 + 14) = 0u;
      *((_OWORD *)a2 + 15) = 0u;
      *((_OWORD *)a2 + 12) = 0u;
      *((_OWORD *)a2 + 13) = 0u;
      *((_OWORD *)a2 + 10) = 0u;
      *((_OWORD *)a2 + 11) = 0u;
      *((_OWORD *)a2 + 8) = 0u;
      *((_OWORD *)a2 + 9) = 0u;
      *((_OWORD *)a2 + 6) = 0u;
      *((_OWORD *)a2 + 7) = 0u;
      *((_OWORD *)a2 + 4) = 0u;
      *((_OWORD *)a2 + 5) = 0u;
      *((_OWORD *)a2 + 2) = 0u;
      *((_OWORD *)a2 + 3) = 0u;
      *(_OWORD *)a2 = 0u;
      *((_OWORD *)a2 + 1) = 0u;
      __strlcat_chk();
      __strlcat_chk();
      __strlcat_chk();
    }
  }
  CFDictionaryRef v8 = (const __CFDictionary *)CFDictionaryGetValue(v5, kSCEntNetPPP);
  if (v8)
  {
    CFDictionaryRef v9 = v8;
    getNumber(v8, kSCPropNetPPPDialOnDemand, &v48);
    snprintf(a2 + 516, 4uLL, "%u", v48);
    int v48 = 0;
    getNumber(v9, kSCPropNetPPPIdleReminder, &v48);
    snprintf(a2 + 520, 4uLL, "%u", v48);
    int v48 = 0;
    getNumber(v9, kSCPropNetPPPDisconnectOnLogout, &v48);
    snprintf(a2 + 524, 4uLL, "%u", v48);
    int v48 = 0;
    getNumber(v9, kSCPropNetPPPDisconnectOnFastUserSwitch, &v48);
    snprintf(a2 + 528, 4uLL, "%u", v48);
    int v48 = 0;
    if (getString(v9, kSCPropNetPPPAuthPrompt, (char *)&cStr, 0x100u))
    {
      *(_OWORD *)(a2 + 756) = 0u;
      *(_OWORD *)(a2 + 772) = 0u;
      *(_OWORD *)(a2 + 724) = 0u;
      *(_OWORD *)(a2 + 740) = 0u;
      *(_OWORD *)(a2 + 692) = 0u;
      *(_OWORD *)(a2 + 708) = 0u;
      *(_OWORD *)(a2 + 660) = 0u;
      *(_OWORD *)(a2 + 676) = 0u;
      *(_OWORD *)(a2 + 628) = 0u;
      *(_OWORD *)(a2 + 644) = 0u;
      *(_OWORD *)(a2 + 596) = 0u;
      *(_OWORD *)(a2 + 612) = 0u;
      *(_OWORD *)(a2 + 564) = 0u;
      *(_OWORD *)(a2 + 580) = 0u;
      *(_OWORD *)(a2 + 532) = 0u;
      *(_OWORD *)(a2 + 548) = 0u;
      __strlcpy_chk();
      long long cStr = 0u;
      long long v85 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      long long v88 = 0u;
      long long v89 = 0u;
      long long v90 = 0u;
      long long v91 = 0u;
      long long v92 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      long long v95 = 0u;
      long long v96 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      long long v99 = 0u;
    }
    getNumber(v9, kSCPropNetPPPCommRedialEnabled, &v48);
    snprintf(a2 + 788, 4uLL, "%u", v48);
    int v48 = 0;
    getNumber(v9, kSCPropNetPPPLCPEchoEnabled, &v48);
    snprintf(a2 + 792, 4uLL, "%u", v48);
    int v48 = 0;
    getNumber(v9, kSCPropNetPPPVerboseLogging, &v48);
    snprintf(a2 + 796, 4uLL, "%u", v48);
    int v48 = 0;
    getNumber(v9, kSCPropNetPPPIPCPCompressionVJ, &v48);
    snprintf(a2 + 800, 4uLL, "%u", v48);
    int v48 = 0;
    getNumber(v9, kSCPropNetPPPCommDisplayTerminalWindow, &v48);
    snprintf(a2 + 804, 4uLL, "%u", v48);
    int v48 = 0;
  }
  CFDictionaryRef v10 = (const __CFDictionary *)CFDictionaryGetValue(v5, kSCEntNetDNS);
  if (v10)
  {
    CFArrayRef v11 = (const __CFArray *)CFDictionaryGetValue(v10, kSCPropNetDNSServerAddresses);
    if (v11)
    {
      if (CFArrayGetCount(v11) >= 1) {
        int v48 = 1;
      }
    }
  }
  snprintf(a2 + 512, 4uLL, "%u", v48);
  int v48 = 0;
  CFDictionaryRef v12 = (const __CFDictionary *)CFDictionaryGetValue(v5, kSCEntNetIPv4);
  if (v12 && getString(v12, kSCPropNetIPv4ConfigMethod, (char *)&cStr, 0x100u))
  {
    CFStringRef v13 = CFStringCreateWithCString(0, (const char *)&cStr, 0x8000100u);
    if (v13)
    {
      CFStringRef v14 = v13;
      if (CFEqual(v13, kSCValNetIPv4ConfigMethodManual)) {
        int v48 = 1;
      }
      CFRelease(v14);
    }
    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long cStr = 0u;
    long long v85 = 0u;
  }
  snprintf(a2 + 808, 4uLL, "%u", v48);
  int v48 = 0;
  CFDictionaryRef v15 = (const __CFDictionary *)CFDictionaryGetValue(v5, kSCEntNetIPv6);
  if (v15 && getString(v15, kSCPropNetIPv6ConfigMethod, (char *)&cStr, 0x100u))
  {
    CFStringRef v16 = CFStringCreateWithCString(0, (const char *)&cStr, 0x8000100u);
    if (v16)
    {
      CFStringRef v17 = v16;
      if (CFEqual(v16, kSCValNetIPv6ConfigMethodManual)) {
        int v48 = 1;
      }
      CFRelease(v17);
    }
    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long cStr = 0u;
    long long v85 = 0u;
  }
  snprintf(a2 + 812, 4uLL, "%u", v48);
  int v48 = 0;
  snprintf(a2 + 816, 4uLL, "%u", 0);
  int v48 = 0;
  CFStringRef v18 = SCPreferencesCreate(0, @"Plugin:PPPController", @"preferences.plist");
  CFDictionaryRef v19 = v18;
  if (v18
    && (CFDictionaryRef v20 = (const __CFDictionary *)SCPreferencesGetValue(v18, kSCPrefNetworkServices)) != 0
    && (CFDictionaryRef v21 = (const __CFDictionary *)CFDictionaryGetValue(v20, *(const void **)(a1 + 24))) != 0)
  {
    CFDictionaryRef v22 = (const __CFDictionary *)CFDictionaryGetValue(v21, kSCEntNetProxies);
    snprintf(a2 + 820, 4uLL, "%u", v48);
    if (v22) {
      CFDictionaryApplyFunction(v22, (CFDictionaryApplierFunction)sub_FEB4, a2);
    }
  }
  else
  {
    snprintf(a2 + 820, 4uLL, "%u", v48);
  }
  if (!a2 || *(_WORD *)(a1 + 66) == 2 || !v19) {
    goto LABEL_55;
  }
  int v23 = SCNetworkServiceCopy(v19, *(CFStringRef *)(a1 + 24));
  if (!v23 || (CFDictionaryRef v24 = v23, (Interface = SCNetworkServiceGetInterface(v23)) == 0))
  {
LABEL_56:
    CFRelease(v19);
    goto LABEL_57;
  }
  do
  {
    CFTypeRef v26 = Interface;
    Interface = SCNetworkInterfaceGetInterface(Interface);
  }
  while (Interface);
  CFStringRef BSDName = SCNetworkInterfaceGetBSDName(v26);
  if (!BSDName) {
    goto LABEL_55;
  }
  CFStringRef v28 = BSDName;
  uint64_t v29 = IOServiceMatching("IOSerialBSDClient");
  CFDictionarySetValue(v29, @"IOSerialBSDClientType", @"IOSerialStream");
  io_iterator_t existing = 0;
  memset(&v101[16], 0, 256);
  if (IOServiceGetMatchingServices(kIOMasterPortDefault, v29, &existing)) {
    goto LABEL_55;
  }
  io_object_t v30 = IOIteratorNext(existing);
  if (!v30) {
    goto LABEL_54;
  }
  io_registry_entry_t v31 = v30;
  while (1)
  {
    CFMutableDictionaryRef properties = 0;
    if (IORegistryEntryCreateCFProperties(v31, &properties, kCFAllocatorDefault, 0) || !properties) {
      goto LABEL_53;
    }
    int v32 = CFDictionaryGetValue(properties, @"IOTTYDevice");
    if (v32)
    {
      if (CFEqual(v32, v28)) {
        break;
      }
    }
    CFRelease(properties);
LABEL_53:
    IOObjectRelease(v31);
    io_registry_entry_t v31 = IOIteratorNext(existing);
    if (!v31) {
      goto LABEL_54;
    }
  }
  memset(v101, 0, 256);
  memset(v100, 0, sizeof(v100));
  CFDictionaryRef v33 = CFDictionaryGetValue(properties, @"IOTTYBaseName");
  if (CFEqual(v33, @"usbmodem"))
  {
    __strlcat_chk();
    CFStringRef v34 = CFStringCreateWithFormat(0, 0, @"idVendor");
    CFNumberRef v35 = (const __CFNumber *)IORegistryEntrySearchCFProperty(v31, "IOService", v34, 0, 3u);
    if (v35 && (CFNumberRef v36 = v35, TypeID = CFNumberGetTypeID(), CFGetTypeID(v36) == TypeID))
    {
      int valuePtr = 0;
      CFNumberGetValue(v36, kCFNumberIntType, &valuePtr);
      __sprintf_chk((char *)v101, 0, 0x100uLL, "%0.4x", valuePtr);
      __strlcat_chk();
      __strlcat_chk();
      CFRelease(v36);
    }
    else
    {
      __strlcat_chk();
      __strlcat_chk();
    }
    CFRelease(v34);
    CFStringRef v38 = CFStringCreateWithFormat(0, 0, @"idProduct");
    CFNumberRef v39 = (const __CFNumber *)IORegistryEntrySearchCFProperty(v31, "IOService", v38, 0, 3u);
    if (v39)
    {
      CFNumberRef v40 = v39;
      CFTypeID v41 = CFNumberGetTypeID();
      if (CFGetTypeID(v40) == v41)
      {
        int valuePtr = 0;
        CFNumberGetValue(v40, kCFNumberIntType, &valuePtr);
        __sprintf_chk((char *)v100, 0, 0x100uLL, "%0.4x");
        goto LABEL_75;
      }
    }
LABEL_76:
    __strlcat_chk();
    __strlcat_chk();
    goto LABEL_77;
  }
  if (CFEqual(v33, @"pci-serial"))
  {
    __strlcat_chk();
    CFStringRef v42 = CFStringCreateWithFormat(0, 0, @"vendor-id");
    CFDataRef v43 = (const __CFData *)IORegistryEntrySearchCFProperty(v31, "IOService", v42, 0, 3u);
    if (v43 && (CFDataRef v44 = v43, v45 = CFDataGetTypeID(), CFGetTypeID(v44) == v45))
    {
      int valuePtr = 0;
      v102.length = CFDataGetLength(v44);
      v102.location = 0;
      CFDataGetBytes(v44, v102, (UInt8 *)&valuePtr);
      __sprintf_chk((char *)v101, 0, 0x100uLL, "%0.2x%0.2x", BYTE1(valuePtr), valuePtr);
      __strlcat_chk();
      __strlcat_chk();
      CFRelease(v44);
    }
    else
    {
      __strlcat_chk();
      __strlcat_chk();
    }
    CFRelease(v42);
    CFStringRef v38 = CFStringCreateWithFormat(0, 0, @"device-id");
    CFNumberRef v46 = (const __CFNumber *)IORegistryEntrySearchCFProperty(v31, "IOService", v38, 0, 3u);
    if (!v46) {
      goto LABEL_76;
    }
    CFNumberRef v40 = v46;
    CFTypeID v47 = CFDataGetTypeID();
    if (CFGetTypeID(v40) != v47) {
      goto LABEL_76;
    }
    int valuePtr = 0;
    v103.length = CFDataGetLength(v40);
    v103.location = 0;
    CFDataGetBytes(v40, v103, (UInt8 *)&valuePtr);
    __sprintf_chk((char *)v100, 0, 0x100uLL, "%0.2x%0.2x");
LABEL_75:
    __strlcat_chk();
    __strlcat_chk();
    CFRelease(v40);
LABEL_77:
    CFRelease(v38);
  }
  else if (CFEqual(v33, @"Bluetooth-Modem"))
  {
    __strlcat_chk();
  }
  if (properties) {
    CFRelease(properties);
  }
LABEL_54:
  *((_OWORD *)a2 + 16) = 0u;
  *((_OWORD *)a2 + 17) = 0u;
  *((_OWORD *)a2 + 18) = 0u;
  *((_OWORD *)a2 + 19) = 0u;
  *((_OWORD *)a2 + 20) = 0u;
  *((_OWORD *)a2 + 21) = 0u;
  *((_OWORD *)a2 + 22) = 0u;
  *((_OWORD *)a2 + 23) = 0u;
  *((_OWORD *)a2 + 24) = 0u;
  *((_OWORD *)a2 + 25) = 0u;
  *((_OWORD *)a2 + 26) = 0u;
  *((_OWORD *)a2 + 27) = 0u;
  *((_OWORD *)a2 + 28) = 0u;
  *((_OWORD *)a2 + 29) = 0u;
  *((_OWORD *)a2 + 30) = 0u;
  *((_OWORD *)a2 + 31) = 0u;
  __strlcpy_chk();
  CFRelease(v24);
LABEL_55:
  if (v19) {
    goto LABEL_56;
  }
LABEL_57:
  CFRelease(v5);
}

CFTypeID sub_FEB4(const __CFString *a1, const void *a2, uint64_t a3)
{
  CFTypeID result = CFStringHasSuffix(a1, @"Enable");
  if (result)
  {
    int valuePtr = 0;
    CFTypeID v6 = CFGetTypeID(a2);
    CFTypeID result = CFNumberGetTypeID();
    if (v6 == result)
    {
      CFTypeID result = CFNumberGetValue((CFNumberRef)a2, kCFNumberIntType, &valuePtr);
      if (result)
      {
        if (valuePtr) {
          *(_WORD *)(a3 + 820) = 49;
        }
      }
    }
  }
  return result;
}

char *sub_FF38(uint64_t a1, _DWORD *a2, char *__s)
{
  CFTypeID result = (char *)strlen(__s);
  if (result)
  {
    size_t v7 = (size_t)(result + 1);
    CFTypeID result = (char *)malloc_type_malloc((size_t)(result + 1), 0xD5BF51C7uLL);
    *(void *)(a1 + 8 * *a2) = result;
    if (result)
    {
      CFTypeID result = (char *)strlcpy(result, __s, v7);
      ++*a2;
    }
  }
  return result;
}

void sub_FFAC(uint64_t a1, __int16 a2, uint64_t a3, unsigned int a4)
{
  CFDictionaryRef v5 = (_DWORD *)findbyref(0, a4);
  if (!v5) {
    return;
  }
  unint64_t v6 = (unint64_t)v5;
  if ((a2 & 0x7F) != 0) {
    goto LABEL_3;
  }
  int v8 = HIBYTE(a2);
  BOOL v9 = HIBYTE(a2) > 0x19u;
  int v7 = v9;
  if (v9)
  {
    int v8 = 127;
  }
  else if (v5[157] != 1)
  {
LABEL_3:
    int v7 = 1;
    goto LABEL_9;
  }
  v5[158] = v8;
  v5[159] = 0;
  sub_10464((uint64_t)v5);
LABEL_9:
  ppp_updatephase(v6, 0, 0);
  *(_DWORD *)(v6 + 396) = 0;
  service_ended(v6);
  *(_DWORD *)(v6 + 600) = -1;
  my_close(*(unsigned int *)(v6 + 596));
  *(_DWORD *)(v6 + 596) = -1;
  my_CFRelease((const void **)(v6 + 128));
  *(void *)(v6 + 128) = 0;
  cleanup_dynamicstore(v6);
  uint64_t v10 = *(void *)(v6 + 584);
  if (v10) {
    ne_sm_bridge_acknowledge_sleep(v10);
  }
  else {
    allow_sleep();
  }
  if (!allow_dispose(v6) && !allow_stop())
  {
    int v11 = *(_DWORD *)(v6 + 72);
    if ((v11 & 4) != 0)
    {
      ppp_start(v6, *(CFTypeRef *)(v6 + 640));
      my_CFRelease((const void **)(v6 + 640));
      *(void *)(v6 + 648) = 0;
      *(void *)(v6 + 640) = 0;
      *(void *)(v6 + 656) = 0;
      *(_DWORD *)(v6 + 72) &= ~4u;
    }
    else if (v7 {
           && (*(_DWORD *)(v6 + 72) & 0x38) != 0x20
    }
           && (v11 & 0x10000) != 0
           && ((v11 & 0x20000) == 0 || gLoggedInUser))
    {
      ppp_start(v6, 0);
    }
    else
    {
      scnc_bootstrap_dealloc(v6);
      scnc_ausession_dealloc(v6);
    }
  }
}

void sub_10180(int a1, unsigned int a2)
{
  uint64_t v3 = findbyref(0, a2);
  size_t v4 = (_DWORD *)v3;
  if (a1)
  {
    int v11 = 1;
    my_close(*(unsigned int *)(v3 + 592));
    v4[148] = -1;
    my_close(v4[151]);
    v4[151] = -1;
    ioctl(v4[149], 0x8004667EuLL, &v11);
  }
  else
  {
    my_close(*(unsigned int *)(v3 + 596));
    v4[149] = -1;
    my_close(v4[150]);
    v4[150] = -1;
    int v5 = v4[148];
    if (v5) {
      dup2(v5, 0);
    }
    int v6 = v4[151];
    if (v6 != 1) {
      dup2(v6, 1);
    }
    close(2);
    open("/dev/null", 2, 0);
    int v7 = getdtablesize();
    if (v7 >= 4)
    {
      unsigned int v8 = v7 + 1;
      do
      {
        close(v8 - 2);
        --v8;
      }
      while (v8 > 4);
    }
    uid_t v9 = geteuid();
    uid_t v10 = v4[22];
    if (v9 != v10) {
      setruid(v10);
    }
    applyEnvironmentVariables((uint64_t)v4);
  }
}

unint64_t ppp_updatephase(unint64_t result, unsigned int a2, int a3)
{
  uint64_t v3 = result;
  if (*(_DWORD *)(result + 600) == -1)
  {
    *(_DWORD *)(result + 628) = 0;
    return phase_changed(result, 0);
  }
  else
  {
    if (*(_DWORD *)(result + 628) == a2) {
      return result;
    }
    *(_DWORD *)(result + 628) = a2;
    CFTypeID result = phase_changed(result, a2);
    int v5 = *(_DWORD *)(v3 + 628);
    if (v5 > 7)
    {
      if (v5 != 8)
      {
        if (v5 != 11) {
          return result;
        }
        goto LABEL_13;
      }
      *(unsigned char *)(v3 + 104) = 0;
      CFTypeID result = snprintf((char *)(v3 + 104), 0x10uLL, "ppp%d", a3);
      *(_DWORD *)(v3 + 396) = 1;
      if (!*(_DWORD *)(v3 + 188))
      {
        CFTypeID result = mach_absolute_time();
        *(_DWORD *)(v3 + 188) = (*(double *)&gTimeScaleSeconds * (double)result);
      }
    }
    else
    {
      if (v5 == 1)
      {
        CFTypeID result = mach_absolute_time();
        *(_DWORD *)(v3 + 184) = (*(double *)&gTimeScaleSeconds * (double)result);
        *(_DWORD *)(v3 + 192) = 0;
        return result;
      }
      if (v5 == 3)
      {
        *(unsigned char *)(v3 + 104) = 0;
        CFTypeID result = (unint64_t)getStringFromEntity((const __SCDynamicStore *)gDynamicStore, kSCDynamicStoreDomainState, *(const __CFString **)(v3 + 24), kSCEntNetPPP, kSCPropInterfaceName, (char *)(v3 + 104), 0x10u);
LABEL_13:
        if ((*(unsigned char *)(v3 + 72) & 0x10) != 0)
        {
          return scnc_stop(v3, 0, 15, 0);
        }
      }
    }
  }
  return result;
}

void sub_10464(uint64_t a1)
{
  CFMutableDictionaryRef v16 = 0;
  *(void *)(a1 + 184) = 0;
  int v1 = *(_DWORD *)(a1 + 632);
  if (v1 != 5)
  {
    int v3 = *(_DWORD *)(a1 + 72);
    if ((v3 & 0x440) == 0x40)
    {
      int v4 = v3 & 0x20;
      if (v1 != 21 || v4 == 0)
      {
        SInt32 error = 0;
        uint64_t v6 = *(unsigned int *)(a1 + 636);
        if (v6)
        {
          if (v6 == 6 && *(_WORD *)(a1 + 66) == 5) {
            return;
          }
          CFStringRef v7 = CFStringCreateWithFormat(0, 0, @"%@ Error %d", *(void *)(a1 + 40), v6);
          CFStringRef v17 = v7;
          if (v7) {
            goto LABEL_33;
          }
        }
        if (*(_DWORD *)(a1 + 632) == 5) {
          return;
        }
        CFStringRef v7 = CFStringCreateWithFormat(0, 0, @"PPP Error %d", *(unsigned int *)(a1 + 632));
        CFStringRef v17 = v7;
        if (v7)
        {
LABEL_33:
          if (CFStringGetLength(v7))
          {
            CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
            CFMutableDictionaryRef v16 = Mutable;
            if (Mutable)
            {
              uid_t v9 = Mutable;
              if (gIconURLRef) {
                CFDictionaryAddValue(Mutable, kCFUserNotificationIconURLKey, (const void *)gIconURLRef);
              }
              if (gBundleURLRef) {
                CFDictionaryAddValue(v9, kCFUserNotificationLocalizationURLKey, (const void *)gBundleURLRef);
              }
              CFDictionaryAddValue(v9, kCFUserNotificationAlertMessageKey, v7);
              if (*(_WORD *)(a1 + 66) == 5) {
                CFStringRef v10 = @"VPN Connection";
              }
              else {
                CFStringRef v10 = @"Network Connection";
              }
              CFDictionaryAddValue(v9, kCFUserNotificationAlertHeaderKey, v10);
              int v11 = *(__CFUserNotification **)(a1 + 168);
              if (v11)
              {
                SInt32 error = CFUserNotificationUpdate(v11, 0.0, 1uLL, v9);
              }
              else
              {
                CFDictionaryRef v12 = CFUserNotificationCreate(0, 0.0, 1uLL, &error, v9);
                *(void *)(a1 + 168) = v12;
                if (v12)
                {
                  CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource(0, v12, (CFUserNotificationCallBack)user_notification_callback, 0);
                  *(void *)(a1 + 176) = RunLoopSource;
                  if (RunLoopSource)
                  {
                    Current = CFRunLoopGetCurrent();
                    CFRunLoopAddSource(Current, *(CFRunLoopSourceRef *)(a1 + 176), kCFRunLoopDefaultMode);
                  }
                  else
                  {
                    my_CFRelease((const void **)(a1 + 168));
                  }
                }
              }
            }
          }
        }
        my_CFRelease((const void **)&v16);
        my_CFRelease((const void **)&v17);
      }
    }
  }
}

uint64_t ppp_stop(_DWORD *a1, int a2)
{
  int v3 = a1[18];
  if ((v3 & 0x18) != 0) {
    a2 = 15;
  }
  uint64_t v5 = 10;
  switch(a1[157])
  {
    case 0:
      return 0;
    case 1:
      a1[18] = v3 & 0xFFFFFFFB;
      goto LABEL_9;
    case 2:
      goto LABEL_9;
    case 3:
    case 0xB:
      if (a2 == 1) {
        return 0;
      }
      goto LABEL_10;
    case 9:
    case 0xA:
      goto LABEL_10;
    default:
      uint64_t v5 = 9;
LABEL_9:
      ppp_updatephase(a1, v5, 0);
LABEL_10:
      int v6 = a1[149];
      if (v6 == -1) {
        goto LABEL_14;
      }
      if (a2 == 1)
      {
        CFStringRef v7 = "[DISCONNECT]";
      }
      else
      {
        if (a2 != 15)
        {
LABEL_14:
          kill(a1[152], a2);
          return 0;
        }
        CFStringRef v7 = "[TERMINATE]";
      }
      sub_F034(v6, v7);
      return 0;
  }
}

uint64_t ppp_suspend(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 628)) {
    kill(*(_DWORD *)(a1 + 608), 18);
  }
  return 0;
}

uint64_t ppp_resume(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 628)) {
    kill(*(_DWORD *)(a1 + 608), 19);
  }
  return 0;
}

void ppp_updatestatus(uint64_t a1, int a2, int a3)
{
  *(_DWORD *)(a1 + 632) = a2;
  *(_DWORD *)(a1 + 636) = a3;
  sub_10464(a1);
}

BOOL ppp_is_pid(uint64_t a1, int a2)
{
  return *(_DWORD *)(a1 + 608) == a2;
}

uint64_t ppp_getstatus(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 628) - 1;
  if (v1 > 0xD) {
    return 0;
  }
  else {
    return dword_2EDE8[v1];
  }
}

uint64_t ppp_getstatus1(uint64_t a1, vm_address_t *a2, _WORD *a3)
{
  vm_address_t v6 = my_Allocate(36);
  *a2 = v6;
  if (!v6) {
    return 12;
  }
  CFStringRef v7 = (_DWORD *)v6;
  *(_DWORD *)(v6 + 32) = 0;
  *(_OWORD *)vm_address_t v6 = 0u;
  *(_OWORD *)(v6 + 16) = 0u;
  int v8 = *(_DWORD *)(a1 + 628);
  if ((v8 | 8) == 0xB)
  {
    *(_DWORD *)vm_address_t v6 = 0;
LABEL_4:
    *(_DWORD *)(v6 + 4) = ppp_translate_error(*(unsigned __int16 *)(a1 + 66), *(_DWORD *)(a1 + 632), *(_DWORD *)(a1 + 636));
LABEL_5:
    uint64_t result = 0;
    *a3 = 36;
    return result;
  }
  *(_DWORD *)vm_address_t v6 = v8;
  if (v8 != 8)
  {
    if (v8 == 13)
    {
      *(_DWORD *)(v6 + 4) = 0;
      *(_DWORD *)__dst = 0;
      getNumberFromEntity((const __SCDynamicStore *)gDynamicStore, kSCDynamicStoreDomainState, *(const __CFString **)(a1 + 24), kSCEntNetPPP, kSCPropNetPPPRetryConnectTime, __dst);
      if (*(_DWORD *)__dst)
      {
        double v18 = *(double *)&gTimeScaleSeconds * (double)mach_absolute_time();
        unsigned int v19 = *(_DWORD *)__dst - v18;
        if (*(_DWORD *)__dst < v18) {
          unsigned int v19 = 0;
        }
        v7[1] = v19;
      }
      goto LABEL_5;
    }
    if (v8 != 12) {
      goto LABEL_4;
    }
  }
  int v10 = socket(2, 2, 0);
  if ((v10 & 0x80000000) == 0)
  {
    int v11 = v10;
    memset(v26, 0, sizeof(v26));
    long long v25 = 0u;
    long long v24 = 0u;
    long long v23 = 0u;
    strncpy(__dst, (const char *)(a1 + 104), 0x10uLL);
    int v12 = ioctl(v11, 0xC05C697BuLL, __dst);
    close(v11);
    if ((v12 & 0x80000000) == 0)
    {
      int v21 = 0;
      getNumberFromEntity((const __SCDynamicStore *)gDynamicStore, kSCDynamicStoreDomainState, *(const __CFString **)(a1 + 24), kSCEntNetPPP, kSCPropNetPPPConnectTime, &v21);
      unsigned int v20 = 0;
      getNumberFromEntity((const __SCDynamicStore *)gDynamicStore, kSCDynamicStoreDomainState, *(const __CFString **)(a1 + 24), kSCEntNetPPP, kSCPropNetPPPDisconnectTime, &v20);
      unsigned int v13 = (*(double *)&gTimeScaleSeconds * (double)mach_absolute_time());
      if (v21) {
        v7[1] = v13 - v21;
      }
      BOOL v14 = v20 >= v13;
      int v15 = v20 - v13;
      if (!v14) {
        int v15 = 0;
      }
      if (!v20) {
        int v15 = -1;
      }
      v7[2] = v15;
      int v16 = DWORD1(v23);
      v7[6] = DWORD2(v24);
      v7[3] = v16;
      v7[4] = HIDWORD(v23);
      v7[7] = v25;
      int v17 = v24;
      v7[5] = v24;
      v7[8] = v17;
      goto LABEL_5;
    }
  }
  my_Deallocate(*a2, 36);
  return *__error();
}

uint64_t ppp_translate_error(int a1, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x14)
  {
    uint64_t result = 256;
    if (a1) {
      return result;
    }
  }
  else
  {
    uint64_t result = dword_2ED70[a2];
    if (a1) {
      return result;
    }
  }
  if (a3)
  {
    if (a3 > 9) {
      return 257;
    }
    else {
      return dword_2EDC4[a3 - 1];
    }
  }
  return result;
}

uint64_t ppp_copyextendedstatus(uint64_t a1, void *a2)
{
  CFStringRef value = 0;
  *a2 = 0;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFMutableDictionaryRef v36 = Mutable;
  if (!Mutable) {
    goto LABEL_44;
  }
  uint64_t v5 = Mutable;
  CFMutableDictionaryRef v6 = CFDictionaryCreateMutable(0, 0, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFStringRef value = v6;
  if (!v6) {
    goto LABEL_44;
  }
  CFStringRef v7 = v6;
  AddNumber(v6, kSCPropNetPPPStatus, *(_DWORD *)(a1 + 628));
  if (!*(_DWORD *)(a1 + 628)) {
    goto LABEL_7;
  }
  AddStringFromState((const __SCDynamicStore *)gDynamicStore, *(const __CFString **)(a1 + 24), kSCEntNetPPP, kSCPropNetPPPCommRemoteAddress, v7);
  int v8 = *(_DWORD *)(a1 + 628);
  if (v8 <= 11)
  {
    if (v8 == 3) {
      goto LABEL_17;
    }
    if (v8 != 8) {
      goto LABEL_7;
    }
    goto LABEL_10;
  }
  if (v8 != 13)
  {
    if (v8 == 12)
    {
LABEL_10:
      uint64_t v9 = *(void *)(a1 + 584);
      if (v9)
      {
        uint64_t connect_time = ne_sm_bridge_get_connect_time(v9);
        AddNumber64(v7, kSCPropNetPPPConnectTime, connect_time);
      }
      else
      {
        AddNumberFromState((const __SCDynamicStore *)gDynamicStore, *(const __CFString **)(a1 + 24), kSCEntNetPPP, kSCPropNetPPPConnectTime, v7);
      }
      AddNumberFromState((const __SCDynamicStore *)gDynamicStore, *(const __CFString **)(a1 + 24), kSCEntNetPPP, kSCPropNetPPPDisconnectTime, v7);
      AddNumberFromState((const __SCDynamicStore *)gDynamicStore, *(const __CFString **)(a1 + 24), kSCEntNetPPP, kSCPropNetPPPLCPCompressionPField, v7);
      AddNumberFromState((const __SCDynamicStore *)gDynamicStore, *(const __CFString **)(a1 + 24), kSCEntNetPPP, kSCPropNetPPPLCPCompressionACField, v7);
      AddNumberFromState((const __SCDynamicStore *)gDynamicStore, *(const __CFString **)(a1 + 24), kSCEntNetPPP, kSCPropNetPPPLCPMRU, v7);
      AddNumberFromState((const __SCDynamicStore *)gDynamicStore, *(const __CFString **)(a1 + 24), kSCEntNetPPP, kSCPropNetPPPLCPMTU, v7);
      AddNumberFromState((const __SCDynamicStore *)gDynamicStore, *(const __CFString **)(a1 + 24), kSCEntNetPPP, kSCPropNetPPPLCPReceiveACCM, v7);
      AddNumberFromState((const __SCDynamicStore *)gDynamicStore, *(const __CFString **)(a1 + 24), kSCEntNetPPP, kSCPropNetPPPLCPTransmitACCM, v7);
      unsigned int v13 = (const __SCDynamicStore *)gDynamicStore;
      CFStringRef v14 = *(const __CFString **)(a1 + 24);
      int v15 = (const void **)&kSCPropNetPPPIPCPCompressionVJ;
      goto LABEL_16;
    }
LABEL_7:
    AddNumber(v7, kSCPropNetPPPLastCause, *(_DWORD *)(a1 + 632));
    AddNumber(v7, kSCPropNetPPPDeviceLastCause, *(_DWORD *)(a1 + 636));
    goto LABEL_17;
  }
  uint64_t v11 = *(void *)(a1 + 584);
  if (v11)
  {
    uint64_t v12 = ne_sm_bridge_get_connect_time(v11);
    AddNumber64(v7, kSCPropNetPPPConnectTime, v12);
    goto LABEL_17;
  }
  unsigned int v13 = (const __SCDynamicStore *)gDynamicStore;
  CFStringRef v14 = *(const __CFString **)(a1 + 24);
  int v15 = (const void **)&kSCPropNetPPPRetryConnectTime;
LABEL_16:
  AddNumberFromState(v13, v14, kSCEntNetPPP, *v15, v7);
LABEL_17:
  CFDictionaryAddValue(v5, kSCEntNetPPP, v7);
  my_CFRelease((const void **)&value);
  if (!*(_WORD *)(a1 + 66))
  {
    int v16 = *(_DWORD *)(a1 + 628);
    if ((v16 | 4) != 0xC) {
      goto LABEL_19;
    }
    CFMutableDictionaryRef v32 = CFDictionaryCreateMutable(0, 0, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFStringRef value = v32;
    if (v32)
    {
      AddNumberFromState((const __SCDynamicStore *)gDynamicStore, *(const __CFString **)(a1 + 24), kSCEntNetModem, kSCPropNetModemConnectSpeed, v32);
      CFDictionaryAddValue(v5, kSCEntNetModem, value);
      my_CFRelease((const void **)&value);
      goto LABEL_18;
    }
LABEL_44:
    uint64_t v31 = 12;
    goto LABEL_45;
  }
LABEL_18:
  int v16 = *(_DWORD *)(a1 + 628);
LABEL_19:
  if ((v16 | 4) == 0xC)
  {
    int v17 = (void *)copyEntity((const __SCDynamicStore *)gDynamicStore, kSCDynamicStoreDomainState, *(const __CFString **)(a1 + 24), kSCEntNetIPv4);
    CFStringRef value = v17;
    if (v17)
    {
      CFDictionaryAddValue(v5, kSCEntNetIPv4, v17);
      my_CFRelease((const void **)&value);
    }
    CFPropertyListRef v18 = copyEntity((const __SCDynamicStore *)gDynamicStore, kSCDynamicStoreDomainState, *(const __CFString **)(a1 + 24), kSCEntNetDNS);
    CFStringRef v34 = v18;
    if (v18)
    {
      CFDictionaryRef v19 = (const __CFDictionary *)v18;
      unsigned int v20 = CFDictionaryGetValue((CFDictionaryRef)v18, kSCPropNetDNSServerAddresses);
      CFTypeID TypeID = CFArrayGetTypeID();
      if (v20 && CFGetTypeID(v20) == TypeID) {
        CFDictionarySetValue(v5, @"DNSServers", v20);
      }
      CFDictionaryRef v22 = CFDictionaryGetValue(v19, kSCPropNetDNSDomainName);
      CFTypeID v23 = CFStringGetTypeID();
      if (v22 && CFGetTypeID(v22) == v23) {
        CFDictionarySetValue(v5, @"DNSDomain", v22);
      }
      long long v24 = CFDictionaryGetValue(v19, kSCPropNetDNSSearchDomains);
      CFTypeID v25 = CFArrayGetTypeID();
      if (v24 && CFGetTypeID(v24) == v25) {
        CFDictionarySetValue(v5, @"DNSSearchDomains", v24);
      }
      CFTypeRef v26 = CFDictionaryGetValue(v19, kSCPropNetDNSSupplementalMatchDomains);
      CFTypeID v27 = CFArrayGetTypeID();
      if (v26 && CFGetTypeID(v26) == v27) {
        CFDictionarySetValue(v5, @"DNSSupplementalMatchDomains", v26);
      }
      my_CFRelease(&v34);
    }
    int v16 = *(_DWORD *)(a1 + 628);
  }
  unsigned int v28 = v16 - 1;
  if (v28 > 0xD) {
    int v29 = 0;
  }
  else {
    int v29 = dword_2EDE8[v28];
  }
  AddNumber(v5, @"Status", v29);
  CFTypeRef v30 = CFRetain(v5);
  uint64_t v31 = 0;
  *a2 = v30;
LABEL_45:
  my_CFRelease((const void **)&value);
  my_CFRelease((const void **)&v36);
  return v31;
}

uint64_t ppp_copystatistics(uint64_t a1, void *a2)
{
  CFMutableDictionaryRef v12 = 0;
  *a2 = 0;
  if ((*(_DWORD *)(a1 + 628) | 4) != 0xC) {
    return 22;
  }
  long long v17 = 0u;
  memset(v18, 0, sizeof(v18));
  long long v15 = 0u;
  long long v16 = 0u;
  *(_OWORD *)__dst = 0u;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFMutableDictionaryRef v13 = Mutable;
  if (Mutable
    && (uint64_t v5 = Mutable,
        CFMutableDictionaryRef v6 = CFDictionaryCreateMutable(0, 0, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks),
        (CFMutableDictionaryRef v12 = v6) != 0))
  {
    CFStringRef v7 = v6;
    int v8 = socket(2, 2, 0);
    if (v8 < 0
      || (long long v17 = 0u,
          memset(v18, 0, sizeof(v18)),
          long long v15 = 0u,
          long long v16 = 0u,
          strncpy(__dst, (const char *)(a1 + 104), 0x10uLL),
          ioctl(v8, 0xC05C697BuLL, __dst) < 0))
    {
      uint64_t v10 = *__error();
    }
    else
    {
      AddNumber(v7, @"BytesIn", SDWORD1(v15));
      AddNumber(v7, @"BytesOut", SDWORD2(v16));
      AddNumber(v7, @"PacketsIn", SHIDWORD(v15));
      AddNumber(v7, @"PacketsOut", v17);
      AddNumber(v7, @"ErrorsIn", v16);
      AddNumber(v7, @"ErrorsOut", v16);
      CFDictionaryAddValue(v5, kSCEntNetPPP, v7);
      CFTypeRef v9 = CFRetain(v5);
      uint64_t v10 = 0;
      *a2 = v9;
    }
  }
  else
  {
    uint64_t v10 = 12;
    int v8 = -1;
  }
  my_CFRelease((const void **)&v12);
  my_CFRelease((const void **)&v13);
  if (v8 != -1) {
    close(v8);
  }
  return v10;
}

uint64_t ppp_getconnectsystemdata(uint64_t a1, void *a2, _WORD *a3)
{
  memset(__len, 0, sizeof(__len));
  uint64_t v5 = copyService((const __SCDynamicStore *)gDynamicStore, kSCDynamicStoreDomainSetup, *(const __CFString **)(a1 + 24));
  if (v5)
  {
    CFMutableDictionaryRef v6 = v5;
    CFDataRef v7 = Serialize(v5, (const UInt8 **)&__len[1], __len);
    if (v7)
    {
      CFDataRef v8 = v7;
      CFTypeRef v9 = (void *)my_Allocate(__len[0]);
      *a2 = v9;
      if (v9)
      {
        memmove(v9, *(const void **)&__len[1], __len[0]);
        uint64_t v10 = 0;
        *a3 = __len[0];
      }
      else
      {
        uint64_t v10 = 12;
      }
      CFRelease(v6);
      CFRelease(v8);
    }
    else
    {
      CFRelease(v6);
      return 12;
    }
  }
  else
  {
    uint64_t v10 = 0;
    *a3 = 0;
  }
  return v10;
}

uint64_t ppp_getconnectdata(uint64_t a1, CFTypeRef *a2, int a3)
{
  *a2 = 0;
  CFDictionaryRef v3 = *(const __CFDictionary **)(a1 + 128);
  if (v3)
  {
    if (a3)
    {
      *a2 = CFRetain(*(CFTypeRef *)(a1 + 128));
    }
    else
    {
      CFDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v3);
      if (MutableCopy)
      {
        CFMutableDictionaryRef v6 = MutableCopy;
        CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(MutableCopy, kSCEntNetPPP);
        if (Value)
        {
          CFDictionaryRef v8 = Value;
          CFTypeID v9 = CFGetTypeID(Value);
          if (v9 == CFDictionaryGetTypeID())
          {
            uint64_t v10 = CFDictionaryCreateMutableCopy(0, 0, v8);
            if (v10)
            {
              uint64_t v11 = v10;
              CFDictionaryRemoveValue(v10, kSCPropNetPPPAuthPassword);
              CFDictionarySetValue(v6, kSCEntNetPPP, v11);
              CFRelease(v11);
            }
          }
        }
        CFDictionaryRef v12 = (const __CFDictionary *)CFDictionaryGetValue(v6, kSCEntNetL2TP);
        if (v12)
        {
          CFDictionaryRef v13 = v12;
          CFTypeID v14 = CFGetTypeID(v12);
          if (v14 == CFDictionaryGetTypeID())
          {
            long long v15 = CFDictionaryCreateMutableCopy(0, 0, v13);
            if (v15)
            {
              long long v16 = v15;
              CFDictionaryRemoveValue(v15, kSCPropNetL2TPIPSecSharedSecret);
              CFDictionarySetValue(v6, kSCEntNetL2TP, v16);
              CFRelease(v16);
            }
          }
        }
        CFDictionaryRef v17 = (const __CFDictionary *)CFDictionaryGetValue(v6, kSCEntNetIPSec);
        if (v17)
        {
          CFDictionaryRef v18 = v17;
          CFTypeID v19 = CFGetTypeID(v17);
          if (v19 == CFDictionaryGetTypeID())
          {
            unsigned int v20 = CFDictionaryCreateMutableCopy(0, 0, v18);
            if (v20)
            {
              int v21 = v20;
              CFDictionaryRemoveValue(v20, kSCPropNetIPSecSharedSecret);
              CFDictionarySetValue(v6, kSCEntNetIPSec, v21);
              CFRelease(v21);
            }
          }
        }
        *a2 = CFRetain(v6);
        CFRelease(v6);
      }
    }
  }
  return 0;
}

ssize_t sub_115A0(int a1, char *a2, int a3)
{
  sub_F034(a1, a2);
  snprintf(__str, 0x20uLL, "%d", a3);
  return sub_F034(a1, __str);
}

ssize_t sub_11620(int a1, char *__s, char *a3)
{
  size_t v6 = strlen(__s);
  write(a1, __s, v6);
  write(a1, " \"", 2uLL);
  char v7 = *a3;
  if (*a3)
  {
    do
    {
      if (v7 == 92 || v7 == 34) {
        write(a1, "\\"", 1uLL);
      }
      write(a1, a3, 1uLL);
      int v8 = *++a3;
      char v7 = v8;
    }
    while (v8);
  }

  return write(a1, "\" ", 2uLL);
}

ssize_t sub_116EC(int a1, const void *a2, int a3)
{
  sub_115A0(a1, "modemdict", a3);
  write(a1, a2, a3);

  return write(a1, " ", 1uLL);
}

uint64_t terminate_all()
{
  CFRunLoopSourceInvalidate((CFRunLoopSourceRef)gTerminalrls);
  CFRelease((CFTypeRef)gTerminalrls);
  uint64_t v0 = (void *)service_head;
  if (service_head)
  {
    do
    {
      scnc_stop((uint64_t)v0, 0, 15, 11);
      uint64_t v0 = (void *)*v0;
    }
    while (v0);
  }

  return allow_stop();
}

uint64_t scnc_stop(uint64_t a1, uint64_t a2, int a3, int a4)
{
  if (!a2)
  {
    pid_t v7 = 0;
    goto LABEL_17;
  }
  pid_t v7 = *(_DWORD *)(a2 + 72);
  if (a4 == 6 || a4 == 10)
  {
LABEL_17:
    while (1)
    {
      long long v15 = *(uint64_t **)(a1 + 568);
      if (!v15) {
        break;
      }
      uint64_t v13 = *v15;
      CFTypeID v14 = (void *)v15[1];
      if (*v15)
      {
        *(void *)(v13 + 8) = v14;
        CFTypeID v14 = (void *)v15[1];
      }
      else
      {
        *(void *)(a1 + 576) = v14;
      }
      *CFTypeID v14 = v13;
      free(v15);
    }
    goto LABEL_18;
  }
  int v8 = (void *)(a1 + 568);
  CFTypeID v9 = (void *)(a1 + 568);
  while (1)
  {
    CFTypeID v9 = (void *)*v9;
    if (!v9) {
      break;
    }
    if (v9[2] == a2)
    {
      uint64_t v10 = (void *)(a1 + 568);
      while (1)
      {
        uint64_t v10 = (void *)*v10;
        if (!v10) {
          goto LABEL_29;
        }
        if (v10[2] == a2)
        {
          uint64_t v11 = (void *)*v10;
          CFDictionaryRef v12 = (void *)v10[1];
          if (*v10)
          {
            v11[1] = v12;
            CFDictionaryRef v12 = (void *)v10[1];
          }
          else
          {
            *(void *)(a1 + 576) = v12;
          }
          void *v12 = v11;
          free(v10);
          goto LABEL_29;
        }
      }
    }
  }
LABEL_29:
  if (*v8) {
    return 0;
  }
LABEL_18:
  if (!scnc_get_reason_str(a4)) {
    goto LABEL_32;
  }
  if (!v7) {
    pid_t v7 = getpid();
  }
  sub_159D4(v7, __str);
  int v16 = *(unsigned __int16 *)(a1 + 64);
  if (*(_WORD *)(a1 + 64))
  {
    if (v16 == 2) {
      goto LABEL_32;
    }
    if (v16 == 1) {
      ipsec_error_to_string(*(_DWORD *)(a1 + 596));
    }
  }
  else
  {
    ppp_error_to_string(*(_DWORD *)(a1 + 632));
    ppp_dev_error_to_string(*(unsigned __int16 *)(a1 + 66), *(_DWORD *)(a1 + 636));
  }
  SCLog();
LABEL_32:
  if (*(_WORD *)(a1 + 64) == 1) {
    return ipsec_stop(a1);
  }
  if (*(_WORD *)(a1 + 64)) {
    return 0xFFFFFFFFLL;
  }
  return ppp_stop((_DWORD *)a1, a3);
}

uint64_t allow_stop()
{
  if (!gStopRls) {
    return 0;
  }
  uint64_t v0 = &service_head;
  while (1)
  {
    uint64_t v0 = (uint64_t *)*v0;
    if (!v0) {
      break;
    }
    if (*((_WORD *)v0 + 32) == 1)
    {
      int v1 = ipsec_getstatus((uint64_t)v0);
    }
    else
    {
      if (*((_WORD *)v0 + 32)) {
        return 0;
      }
      int v1 = ppp_getstatus((uint64_t)v0);
    }
    if (v1) {
      return 0;
    }
  }
  CFRunLoopSourceSignal((CFRunLoopSourceRef)gStopRls);
  if (gPluginRunloop) {
    CFRunLoopWakeUp((CFRunLoopRef)gPluginRunloop);
  }
  return 1;
}

uint64_t pppcntl_run_thread()
{
  if (ppp_mach_start_server()
    || ppp_mach_start_server_priv()
    || ppp_socket_start_server()
    || client_init_all())
  {
    pthread_exit((char *)&dword_0 + 1);
  }
  mach_timebase_info info = 0;
  thePortRef[0] = 0;
  CFStringRef v54 = 0;
  CFStringRef v55 = 0;
  CFMutableArrayRef v52 = 0;
  CFStringRef v53 = 0;
  CFArrayRef v50 = 0;
  CFMutableArrayRef v51 = 0;
  CFRunLoopSourceRef source = 0;
  thePortRef[1] = (IONotificationPortRef)kSCEntNetPPP;
  v58[0] = kSCEntNetModem;
  v58[1] = kSCEntNetInterface;
  v58[2] = kSCEntNetIPv4;
  v58[3] = kSCEntNetIPv6;
  v58[4] = kSCEntNetDNS;
  uint64_t v0 = kSCEntNetVPN;
  v58[5] = kSCEntNetIPSec;
  v58[6] = kSCEntNetVPN;
  v58[7] = @"com.apple.payload";
  v58[8] = 0;
  io_object_t notifier = 0;
  scnc_init_resources((__CFBundle *)gBundleRef);
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  reachability_init((uint64_t)Current, (uint64_t)kCFRunLoopDefaultMode, (uint64_t)&stru_393D8);
  sub_138B4(0);
  gSleeping = 0;
  gStopRls = 0;
  gIOPort = IORegisterForSystemPower(0, thePortRef, (IOServiceInterestCallback)sub_14C1C, &notifier);
  if (!gIOPort
    || (int v2 = CFRunLoopGetCurrent(),
        CFRunLoopSourceRef RunLoopSource = IONotificationPortGetRunLoopSource(thePortRef[0]),
        CFRunLoopAddSource(v2, RunLoopSource, kCFRunLoopDefaultMode),
        mach_timebase_info(&info)))
  {
    SCLog();
    goto LABEL_8;
  }
  LODWORD(v4) = info.numer;
  LODWORD(v5) = info.denom;
  *(double *)&gTimeScaleSeconds = (double)v4 / (double)v5 / 1000000000.0;
  pid_t v7 = SCDynamicStoreCreate(0, @"SCNCController", (SCDynamicStoreCallBack)sub_14E48, 0);
  gDynamicStore = (uint64_t)v7;
  if (!v7) {
    goto LABEL_8;
  }
  int v8 = SCDynamicStoreCreateRunLoopSource(0, v7, 0);
  CFRunLoopSourceRef source = v8;
  if (!v8) {
    goto LABEL_8;
  }
  CFTypeID v9 = v8;
  uint64_t v10 = CFRunLoopGetCurrent();
  CFRunLoopAddSource(v10, v9, kCFRunLoopDefaultMode);
  my_CFRelease((const void **)&source);
  CFStringRef NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity(0, kSCDynamicStoreDomainState, kSCEntNetOnDemand);
  gOndemand_key = (uint64_t)NetworkGlobalEntity;
  if (NetworkGlobalEntity) {
    SCDynamicStoreRemoveValue((SCDynamicStoreRef)gDynamicStore, NetworkGlobalEntity);
  }
  ipsec_init_things();
  CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  CFMutableArrayRef v52 = Mutable;
  CFMutableArrayRef v13 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  CFMutableArrayRef v51 = v13;
  CFArrayRef theArray = Mutable;
  if (!Mutable) {
    goto LABEL_8;
  }
  CFTypeID v14 = v13;
  if (!v13) {
    goto LABEL_8;
  }
  if (kSCEntNetPPP)
  {
    long long v15 = (const __CFString **)v58;
    CFStringRef v16 = kSCEntNetPPP;
    do
    {
      CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0, kSCDynamicStoreDomainSetup, kSCCompAnyRegex, v16);
      CFStringRef v55 = NetworkServiceEntity;
      if (!NetworkServiceEntity) {
        goto LABEL_8;
      }
      CFStringRef v18 = NetworkServiceEntity;
      CFArrayAppendValue(v14, NetworkServiceEntity);
      CFRelease(v18);
      CFStringRef v19 = *v15++;
      CFStringRef v16 = v19;
    }
    while (v19);
  }
  CFStringRef v20 = SCDynamicStoreKeyCreateNetworkGlobalEntity(0, kSCDynamicStoreDomainSetup, kSCEntNetIPv4);
  CFStringRef v55 = v20;
  if (!v20) {
    goto LABEL_8;
  }
  CFStringRef v21 = v20;
  CFArrayAppendValue(theArray, v20);
  CFRelease(v21);
  CFStringRef v22 = SCDynamicStoreKeyCreateNetworkGlobalEntity(0, kSCDynamicStoreDomainState, kSCEntNetIPv4);
  CFStringRef v55 = v22;
  if (!v22) {
    goto LABEL_8;
  }
  CFStringRef v23 = v22;
  CFArrayAppendValue(theArray, v22);
  CFRelease(v23);
  CFStringRef v24 = SCDynamicStoreKeyCreateNetworkGlobalEntity(0, kSCDynamicStoreDomainState, kSCEntNetDNS);
  CFStringRef v55 = v24;
  if (!v24) {
    goto LABEL_8;
  }
  CFStringRef v25 = v24;
  CFArrayAppendValue(theArray, v24);
  CFRelease(v25);
  CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, kSCDynamicStoreDomainState, kSCCompAnyRegex, kSCEntNetAirPort);
  CFArrayAppendValue(v14, NetworkInterfaceEntity);
  CFRelease(NetworkInterfaceEntity);
  SCDynamicStoreSetNotificationKeys((SCDynamicStoreRef)gDynamicStore, theArray, v14);
  int out_token = 0;
  mach_port_t notify_port = 0;
  notify_key = (const char *)nwi_state_get_notify_key();
  if (!notify_register_mach_port(notify_key, &notify_port, 0, &out_token))
  {
    uint64_t v45 = 0;
    long long v43 = 0u;
    long long v44 = 0u;
    nwi_state_get_notify_key();
    unsigned int v28 = (void *)_SC_CFMachPortCreateWithPort();
    CFStringRef v42 = v28;
    if (v28)
    {
      CFRunLoopSourceRef source = CFMachPortCreateRunLoopSource(kCFAllocatorDefault, (CFMachPortRef)v28, 0);
      if (source)
      {
        int v29 = CFRunLoopGetCurrent();
        CFRunLoopAddSource(v29, source, kCFRunLoopCommonModes);
        my_CFRelease((const void **)&source);
      }
      else
      {
        notify_cancel(out_token);
      }
      my_CFRelease(&v42);
    }
    else
    {
      notify_cancel(out_token);
    }
  }
  service_head = 0;
  qword_436E8 = (uint64_t)&service_head;
  controller_options_modify_ondemand();
  CFStringRef v53 = CFStringCreateWithFormat(0, 0, @"(%@|%@|%@)", kSCEntNetPPP, kSCEntNetIPSec, v0);
  CFStringRef v30 = SCDynamicStoreKeyCreateNetworkServiceEntity(0, kSCDynamicStoreDomainSetup, kSCCompAnyRegex, v53);
  CFStringRef v55 = v30;
  CFStringRef v31 = SCDynamicStoreKeyCreate(0, @"%@/%@/%@/", kSCDynamicStoreDomainSetup, kSCCompNetwork, kSCCompService);
  CFStringRef v54 = v31;
  if (!v30 || (CFStringRef v32 = v31) == 0)
  {
LABEL_8:
    my_CFRelease((const void **)&gDynamicStore);
    goto LABEL_9;
  }
  CFArrayRef v33 = SCDynamicStoreCopyKeyList((SCDynamicStoreRef)gDynamicStore, v30);
  CFArrayRef v50 = v33;
  if (v33)
  {
    CFArrayRef v34 = v33;
    int Count = CFArrayGetCount(v33);
    if (Count >= 1)
    {
      CFIndex v36 = 0;
      uint64_t v37 = Count;
      do
      {
        CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v34, v36);
        CFStringRef v39 = parse_component(ValueAtIndex, v32);
        if (v39)
        {
          CFStringRef v40 = v39;
          sub_15354(v39);
          CFRelease(v40);
        }
        ++v36;
      }
      while (v37 != v36);
    }
    sub_15678();
    sub_136A0();
    if (gSCNCVerbose) {
      sub_1575C();
    }
  }
LABEL_9:
  my_CFRelease((const void **)&v53);
  my_CFRelease((const void **)&v50);
  my_CFRelease((const void **)&v55);
  my_CFRelease((const void **)&v54);
  my_CFRelease((const void **)&v52);
  my_CFRelease((const void **)&v51);
  CFRunLoopRun();
  return 0;
}

void load(const void *a1, int a2)
{
  memset(&v5, 0, sizeof(v5));
  pthread_t v4 = 0;
  *(_OWORD *)&v3.cancel = unk_393A8;
  memset(&v3, 0, 64);
  gBundleRef = (uint64_t)a1;
  gSCNCVerbose = _sc_verbose | a2;
  gSCNCDebug = a2;
  gPluginRunloop = (uint64_t)CFRunLoopGetCurrent();
  gTerminalrls = (uint64_t)CFRunLoopSourceCreate(0, 0, &v3);
  if (gTerminalrls)
  {
    pthread_attr_init(&v5);
    pthread_attr_setdetachstate(&v5, 2);
    if (pthread_create(&v4, &v5, (void *(__cdecl *)(void *))pppcntl_run_thread, 0))
    {
      CFRelease((CFTypeRef)gTerminalrls);
      gTerminalrls = 0;
    }
    else
    {
      pthread_attr_destroy(&v5);
      CFRetain(a1);
    }
  }
  else
  {
    SCLog();
  }
}

void stop(uint64_t a1)
{
  if (gOndemand_key) {
    SCDynamicStoreRemoveValue((SCDynamicStoreRef)gDynamicStore, (CFStringRef)gOndemand_key);
  }
  if (!gStopRls)
  {
    gStopRls = a1;
    if (gTerminalrls) {
      CFRunLoopSourceSignal((CFRunLoopSourceRef)gTerminalrls);
    }
    int v2 = (__CFRunLoop *)gControllerRunloop;
    if (gControllerRunloop)
    {
      CFRunLoopWakeUp(v2);
    }
  }
}

uint64_t allow_dispose(uint64_t a1)
{
  if (*(void *)(a1 + 584))
  {
    ne_sm_bridge_allow_dispose(*(void *)(a1 + 584));
  }
  else
  {
    if ((*(unsigned char *)(a1 + 72) & 2) == 0) {
      return 0;
    }
    sub_12374((unsigned __int16 *)a1);
  }
  return 1;
}

void sub_12374(unsigned __int16 *a1)
{
  scnc_stop(a1, 0, 15, 12);
  if (a1[32])
  {
    if (a1[32] != 1)
    {
      *((_DWORD *)a1 + 18) &= ~2u;
LABEL_27:
      my_CFRelease((const void **)a1 + 18);
      unsigned int v3 = *((_DWORD *)a1 + 18);
      if ((v3 & 0x200000) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
    if (ipsec_dispose_service((uint64_t)a1))
    {
LABEL_4:
      *((_DWORD *)a1 + 18) |= 2u;
      return;
    }
  }
  else if (ppp_dispose_service((uint64_t)a1))
  {
    goto LABEL_4;
  }
  int v2 = a1[32];
  unsigned int v3 = *((_DWORD *)a1 + 18) & 0xFFFFFFFD;
  *((_DWORD *)a1 + 18) = v3;
  if (v2 != 1) {
    goto LABEL_27;
  }
  if ((v3 & 0x200000) != 0)
  {
LABEL_8:
    *((_DWORD *)a1 + 18) = v3 & 0xFFDFFFFF;
    sub_15858((uint64_t)a1);
  }
LABEL_9:
  pthread_t v4 = &service_head;
  uint64_t v5 = *(void *)a1;
  if (*(void *)a1) {
    pthread_t v4 = *(uint64_t **)a1;
  }
  v4[1] = *((void *)a1 + 1);
  **((void **)a1 + 1) = v5;
  reachability_clear((uint64_t)a1);
  client_notify(*((CFStringRef *)a1 + 3), *((char **)a1 + 7), a1[34] | (a1[33] << 16), 0, 0, 8);
  size_t v6 = (void *)*((void *)a1 + 7);
  if (v6) {
    free(v6);
  }
  pid_t v7 = (__CFUserNotification *)*((void *)a1 + 21);
  if (v7)
  {
    CFUserNotificationCancel(v7);
    CFRunLoopRef Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveSource(Current, *((CFRunLoopSourceRef *)a1 + 22), kCFRunLoopDefaultMode);
    my_CFRelease((const void **)a1 + 21);
    my_CFRelease((const void **)a1 + 22);
  }
  mach_port_name_t v9 = *((_DWORD *)a1 + 24);
  if (v9)
  {
    mach_port_deallocate(mach_task_self_, v9);
    *((_DWORD *)a1 + 24) = 0;
  }
  mach_port_name_t v10 = *((_DWORD *)a1 + 25);
  if (v10)
  {
    mach_port_deallocate(mach_task_self_, v10);
    *((_DWORD *)a1 + 25) = 0;
  }
  my_CFRelease((const void **)a1 + 3);
  my_CFRelease((const void **)a1 + 5);
  my_CFRelease((const void **)a1 + 6);
  my_CFRelease((const void **)a1 + 4);
  my_CFRelease((const void **)a1 + 52);
  my_CFRelease((const void **)a1 + 53);
  my_CFRelease((const void **)a1 + 56);
  my_CFRelease((const void **)a1 + 54);
  my_CFRelease((const void **)a1 + 57);
  my_CFRelease((const void **)a1 + 62);
  my_CFRelease((const void **)a1 + 63);
  uint64_t v11 = (void *)*((void *)a1 + 64);
  if (v11) {
    free(v11);
  }
  CFDictionaryRef v12 = (void *)*((void *)a1 + 65);
  if (v12) {
    free(v12);
  }

  free(a1);
}

void scnc_init_resources(__CFBundle *a1)
{
  gBundleURLRef = (uint64_t)CFBundleCopyBundleURL(a1);
  CFURLRef v2 = CFURLCopyAbsoluteURL((CFURLRef)gBundleURLRef);
  if (v2)
  {
    CFURLRef v3 = v2;
    gBundleDir = (uint64_t)CFURLCopyPath(v2);
    CFRelease(v3);
  }
  CFURLRef v4 = CFBundleCopyBuiltInPlugInsURL(a1);
  if (v4)
  {
    CFURLRef v5 = v4;
    CFURLRef v6 = CFURLCopyAbsoluteURL(v4);
    if (v6)
    {
      CFURLRef v7 = v6;
      gPluginsDir = (uint64_t)CFURLCopyPath(v6);
      CFRelease(v7);
    }
    CFRelease(v5);
  }
  CFURLRef v8 = CFBundleCopyResourcesDirectoryURL(a1);
  if (v8)
  {
    CFURLRef v9 = v8;
    CFURLRef v10 = CFURLCopyAbsoluteURL(v8);
    if (v10)
    {
      CFURLRef v11 = v10;
      gResourcesDir = (uint64_t)CFURLCopyPath(v10);
      CFRelease(v11);
    }
    CFRelease(v9);
  }
  CFURLRef v12 = CFBundleCopyResourceURL(a1, @"NetworkConnect.icns", 0, 0);
  gIconURLRef = (uint64_t)v12;
  if (v12)
  {
    CFURLRef v13 = CFURLCopyAbsoluteURL(v12);
    if (v13)
    {
      CFURLRef v14 = v13;
      gIconDir = (uint64_t)CFURLCopyPath(v13);
      CFRelease(v14);
    }
  }
  CFDictionaryRef v15 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
  if (v15)
  {
    CFDictionaryRef v16 = v15;
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v15, _kCFSystemVersionProductNameKey);
    CFStringRef v18 = (const __CFString *)CFDictionaryGetValue(v16, _kCFSystemVersionProductVersionKey);
    if (Value)
    {
      CFStringRef v19 = v18;
      if (v18)
      {
        CFMutableArrayRef Mutable = CFStringCreateMutable(0, 0);
        if (Mutable)
        {
          CFStringRef v21 = Mutable;
          CFStringAppend(Mutable, @"Cisco Systems VPN Client ");
          CFStringAppend(v21, v19);
          CFStringAppend(v21, @":");
          CFStringAppend(v21, Value);
          CFIndex v22 = CFStringGetLength(v21) + 1;
          CFStringRef v23 = (char *)malloc_type_malloc(v22, 0x20951351uLL);
          gIPSecAppVersion = (uint64_t)v23;
          if (v23) {
            CFStringGetCString(v21, v23, v22, 0x8000100u);
          }
          CFRelease(v21);
        }
      }
    }
    CFRelease(v16);
  }
}

void do_network_signature_changed()
{
  CFStringRef v9 = 0;
  CFURLRef v10 = 0;
  CFStringRef v8 = 0;
  if (!controller_options_is_onDemandPauseUntilNetChangeCheckSignature()) {
    goto LABEL_13;
  }
  CFStringRef v0 = copyPrimaryService((const __SCDynamicStore *)gDynamicStore);
  CFStringRef v8 = v0;
  if (v0)
  {
    CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, v0, kSCEntNetIPv4);
    CFStringRef v9 = NetworkServiceEntity;
    if (NetworkServiceEntity)
    {
      CFPropertyListRef v2 = SCDynamicStoreCopyValue((SCDynamicStoreRef)gDynamicStore, NetworkServiceEntity);
      CFURLRef v10 = v2;
      CFTypeID TypeID = CFDictionaryGetTypeID();
      if (v2)
      {
        if (CFGetTypeID(v2) == TypeID)
        {
          CFStringRef Value = CFDictionaryGetValue((CFDictionaryRef)v2, kSCPropInterfaceName);
          CFURLRef v5 = CFDictionaryGetValue((CFDictionaryRef)v2, @"NetworkSignature");
          CFTypeID v6 = CFStringGetTypeID();
          if (Value)
          {
            if (CFGetTypeID(Value) == v6)
            {
              CFTypeID v7 = CFStringGetTypeID();
              if (v5)
              {
                if (CFGetTypeID(v5) == v7)
                {
                  if (!my_CFEqual(qword_40548, (unint64_t)Value))
                  {
                    my_CFRelease((const void **)&qword_40548);
                    CFRetain(Value);
                    qword_40548 = (uint64_t)Value;
LABEL_16:
                    my_CFRelease((const void **)&qword_40550);
                    CFRetain(v5);
                    qword_40550 = (uint64_t)v5;
LABEL_13:
                    SCLog();
                    goto LABEL_14;
                  }
                  if (!my_CFEqual(qword_40550, (unint64_t)v5)) {
                    goto LABEL_16;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
LABEL_14:
  my_CFRelease((const void **)&v9);
  my_CFRelease((const void **)&v8);
  my_CFRelease(&v10);
}

uint64_t ondemand_clear_pause_all()
{
  return SCLog();
}

uint64_t allow_sleep()
{
  SCLog();
  if (!gSleeping || sub_129F0(1)) {
    return 0;
  }
  uint64_t v0 = 1;
  SCLog();
  if (gSleepArgument)
  {
    IOAllowPowerChange(gIOPort, gSleepArgument);
    gSleepArgument = 0;
  }
  return v0;
}

uint64_t sub_129F0(int a1)
{
  uint64_t v1 = service_head;
  if (service_head)
  {
    uint64_t v3 = 0;
    while (1)
    {
      int v4 = *(unsigned __int16 *)(v1 + 64);
      if (v4 == 2)
      {
        uint64_t v3 = 0;
      }
      else
      {
        if (v4 == 1)
        {
          int v5 = ipsec_will_sleep(v1, a1);
          goto LABEL_9;
        }
        if (!*(_WORD *)(v1 + 64))
        {
          int v5 = ppp_will_sleep(v1, a1);
LABEL_9:
          uint64_t v3 = v5 | v3;
        }
      }
      uint64_t v1 = *(void *)v1;
      if (!v1) {
        return v3;
      }
    }
  }
  return 0;
}

void service_ended(uint64_t a1)
{
  CFPropertyListRef v2 = (CFRunLoopTimerRef *)(a1 + 160);
  if (*(void *)(a1 + 160))
  {
    CFRunLoopRef Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveTimer(Current, *v2, kCFRunLoopCommonModes);
    my_CFRelease((const void **)v2);
  }
  my_CFRelease((const void **)(a1 + 152));
  if ((byte_40558 & 1) == 0 && (*(_WORD *)(a1 + 64) || *(unsigned __int16 *)(a1 + 66) >= 3u))
  {
    CFStringRef v4 = copyPrimaryService((const __SCDynamicStore *)gDynamicStore);
    if (v4)
    {
      CFStringRef v5 = v4;
      CFStringRef v6 = *(const __CFString **)(a1 + 24);
      if (v6 == v5 || v6 && CFEqual(v6, v5))
      {
        byte_40558 = 1;
        scnc_log(6, @"SCNC Controller: %s, waiting for PrimaryService. status = %x.");
      }
      CFRelease(v5);
    }
    else
    {
      byte_40558 = 1;
      scnc_log(6, @"SCNC Controller: %s, waiting for PrimaryService. status = %x.");
    }
  }
}

BOOL hasDNS()
{
  CFPropertyListRef v2 = copyEntity((const __SCDynamicStore *)gDynamicStore, kSCDynamicStoreDomainState, 0, kSCEntNetDNS);
  BOOL v0 = isDictionary(v2) != 0;
  my_CFRelease(&v2);
  return v0;
}

uint64_t *findbyserviceID(CFStringRef theString2)
{
  CFPropertyListRef v2 = &service_head;
  do
    CFPropertyListRef v2 = (uint64_t *)*v2;
  while (v2 && CFStringCompare((CFStringRef)v2[3], theString2, 0));
  return v2;
}

uint64_t findbypid(int a1)
{
  for (uint64_t i = service_head; i; uint64_t i = *(void *)i)
  {
    if (*(_WORD *)(i + 64))
    {
      if (*(_WORD *)(i + 64) == 2) {
        return 0;
      }
    }
    else if (ppp_is_pid(i, a1))
    {
      return i;
    }
  }
  return i;
}

uint64_t findbysid(const char *a1, int a2)
{
  uint64_t v2 = service_head;
  if (service_head)
  {
    size_t v4 = a2;
    do
    {
      CFStringRef v5 = *(const char **)(v2 + 56);
      if (v5 && strlen(*(const char **)(v2 + 56)) == v4 && !strncmp(v5, a1, v4)) {
        break;
      }
      uint64_t v2 = *(void *)v2;
    }
    while (v2);
  }
  return v2;
}

uint64_t makeref(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 68) | (*(unsigned __int16 *)(a1 + 66) << 16);
}

uint64_t findbyref(int a1, unsigned int a2)
{
  uint64_t result = service_head;
  if (service_head)
  {
    unsigned int v4 = HIWORD(a2);
    do
    {
      if (*(unsigned __int16 *)(result + 64) == a1
        && (v4 == 0xFFFF || v4 == *(unsigned __int16 *)(result + 66))
        && ((unsigned __int16)a2 == 0xFFFF || *(unsigned __int16 *)(result + 68) == (unsigned __int16)a2))
      {
        break;
      }
      uint64_t result = *(void *)result;
    }
    while (result);
  }
  return result;
}

uint64_t findfreeunit(int a1, int a2)
{
  uint64_t v2 = (uint64_t *)service_head;
  if (service_head)
  {
    unsigned __int16 v3 = 0;
    while (1)
    {
      if (*((unsigned __int16 *)v2 + 32) == a1
        && *((unsigned __int16 *)v2 + 33) == a2
        && *((unsigned __int16 *)v2 + 34) == v3)
      {
        if (++v3 == 0xFFFF) {
          return (unsigned __int16)-1;
        }
        uint64_t v2 = &service_head;
      }
      uint64_t v2 = (uint64_t *)*v2;
      if (!v2) {
        return v3;
      }
    }
  }
  return 0;
}

uint64_t phase_changed(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = *(void *)(a1 + 584);
  if (v3)
  {
    return ne_sm_bridge_status_changed(v3);
  }
  else
  {
    if ((*(unsigned char *)(a1 + 74) & 0x20) != 0) {
      ondemand_add_service(a1, 0);
    }
    CFStringRef v6 = *(const __CFString **)(a1 + 24);
    CFTypeID v7 = *(char **)(a1 + 56);
    unsigned int v8 = *(unsigned __int16 *)(a1 + 68) | (*(unsigned __int16 *)(a1 + 66) << 16);
    scnc_getstatus(a1);
    return client_notify(v6, v7, v8, a2, 0, 8);
  }
}

uint64_t ondemand_add_service(uint64_t a1, int a2)
{
  uint64_t v2 = 0;
  CFMutableDictionaryRef theDict = 0;
  CFMutableDictionaryRef v45 = 0;
  CFMutableArrayRef theArray = 0;
  long long v43 = 0;
  int valuePtr = 0;
  if ((*(unsigned char *)(a1 + 74) & 0x20) != 0 && gOndemand_key)
  {
    int valuePtr = scnc_getstatus(a1);
    if (valuePtr == 2)
    {
      ondemand_unpublish_dns_triggering_dicts(a1);
    }
    else
    {
      CFDictionaryRef v5 = *(const __CFDictionary **)(a1 + 432);
      if (v5 && !*(unsigned char *)(a1 + 440) && SCDynamicStoreSetMultiple((SCDynamicStoreRef)gDynamicStore, v5, 0, 0)) {
        *(unsigned char *)(a1 + 440) = 1;
      }
    }
    CFPropertyListRef v6 = SCDynamicStoreCopyValue((SCDynamicStoreRef)gDynamicStore, (CFStringRef)gOndemand_key);
    long long v43 = v6;
    if (v6)
    {
      CFDictionaryRef v7 = (const __CFDictionary *)v6;
      CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v6, @"Triggers");
      CFArrayRef v9 = Value;
      if (Value)
      {
        CFIndex Count = CFArrayGetCount(Value);
        if (Count < 1)
        {
          int v16 = 0;
          LODWORD(v12) = 0;
          BOOL v13 = 1;
        }
        else
        {
          CFIndex v11 = Count;
          CFIndex v12 = 0;
          BOOL v13 = 0;
          while (1)
          {
            CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v9, v12);
            if (ValueAtIndex)
            {
              CFStringRef v15 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"ServiceID");
              if (v15)
              {
                if (CFEqual(v15, *(CFStringRef *)(a1 + 24))) {
                  break;
                }
              }
            }
            BOOL v13 = v11 <= ++v12;
            if (v11 == v12)
            {
              int v16 = 0;
              LODWORD(v12) = 0;
              goto LABEL_22;
            }
          }
          int v16 = 1;
        }
LABEL_22:
        CFDictionaryRef MutableCopy = CFArrayCreateMutableCopy(0, 0, v9);
        CFStringRef v19 = MutableCopy;
        CFMutableArrayRef theArray = MutableCopy;
        if (v13 || !MutableCopy)
        {
          if (!MutableCopy) {
            goto LABEL_79;
          }
          CFDictionaryRef v17 = 0;
          CFArrayRef v9 = 0;
        }
        else
        {
          CFArrayRef v9 = (const __CFArray *)CFArrayGetValueAtIndex(v9, v12);
          if (a2)
          {
            CFDictionaryRef v17 = 0;
          }
          else
          {
            CFDictionaryRef v17 = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, v9);
            CFMutableDictionaryRef theDict = v17;
          }
          CFArrayRemoveValueAtIndex(v19, v12);
        }
      }
      else
      {
        CFDictionaryRef v17 = 0;
        int v16 = 0;
        LODWORD(v12) = 0;
      }
      CFMutableDictionaryRef v45 = CFDictionaryCreateMutableCopy(0, 0, v7);
      if (!v45) {
        goto LABEL_79;
      }
      if (v17)
      {
LABEL_34:
        CFNumberRef v21 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
        if (v21)
        {
          CFNumberRef v22 = v21;
          CFDictionarySetValue(v17, @"Status", v21);
          CFRelease(v22);
        }
        CFStringRef v23 = *(const void **)(a1 + 416);
        CFStringRef v24 = theDict;
        CFStringRef v25 = (const void *)kSCPropNetVPNOnDemandRuleAction;
        if (v23)
        {
          CFDictionarySetValue(theDict, kSCPropNetVPNOnDemandRuleAction, v23);
        }
        else if (CFDictionaryContainsKey(theDict, kSCPropNetVPNOnDemandRuleAction))
        {
          CFDictionaryRemoveValue(v24, v25);
        }
        CFTypeRef v26 = *(const void **)(a1 + 424);
        CFTypeID v27 = (const void *)kSCPropNetVPNOnDemandRuleActionParameters;
        if (v26)
        {
          CFDictionarySetValue(v24, kSCPropNetVPNOnDemandRuleActionParameters, v26);
        }
        else if (CFDictionaryContainsKey(v24, kSCPropNetVPNOnDemandRuleActionParameters))
        {
          CFDictionaryRemoveValue(v24, v27);
        }
        unsigned int v28 = *(const void **)(a1 + 448);
        if (v28)
        {
          CFDictionarySetValue(v24, @"ProbeResults", v28);
        }
        else if (CFDictionaryContainsKey(v24, @"ProbeResults"))
        {
          CFDictionaryRemoveValue(v24, @"ProbeResults");
        }
        if (*(unsigned char *)(a1 + 488))
        {
          CFDictionarySetValue(v24, @"DNSRedirectDetected", kCFBooleanTrue);
          int v29 = *(const void **)(a1 + 496);
          CFTypeID TypeID = CFDictionaryGetTypeID();
          if (v29 && CFGetTypeID(v29) == TypeID) {
            CFDictionarySetValue(v24, @"DNSRedirectedAddresses", *(const void **)(a1 + 496));
          }
        }
        else if (CFDictionaryContainsKey(v24, @"DNSRedirectDetected"))
        {
          CFDictionaryRemoveValue(v24, @"DNSRedirectDetected");
          CFDictionaryRemoveValue(v24, @"DNSRedirectedAddresses");
        }
        CFStringRef v31 = *(const void **)(a1 + 504);
        if (v31)
        {
          CFDictionarySetValue(v24, @"TunneledNetworks", v31);
        }
        else if (CFDictionaryContainsKey(v24, @"TunneledNetworks"))
        {
          CFDictionaryRemoveValue(v24, @"TunneledNetworks");
        }
        CFNumberRef v32 = CFNumberCreate(0, kCFNumberIntType, (const void *)(a1 + 544));
        if (v32)
        {
          CFNumberRef v33 = v32;
          CFDictionarySetValue(v24, @"ReachFlags", v32);
          CFRelease(v33);
        }
        CFNumberRef v34 = CFNumberCreate(0, kCFNumberIntType, (const void *)(a1 + 548));
        if (v34)
        {
          CFNumberRef v35 = v34;
          CFDictionarySetValue(v24, @"ReachInterfaceIndex", v34);
          CFRelease(v35);
        }
        CFNumberRef v36 = CFNumberCreate(0, kCFNumberIntType, (const void *)(a1 + 412));
        if (v36)
        {
          CFNumberRef v37 = v36;
          CFDictionarySetValue(v24, kSCPropNetVPNOnDemandSuspended, v36);
          CFRelease(v37);
        }
        if (a2)
        {
          if (*(_WORD *)(a1 + 64) == 1)
          {
            ipsec_ondemand_add_service_data(a1, v24);
          }
          else if (!*(_WORD *)(a1 + 64))
          {
            ppp_ondemand_add_service_data(a1, v24);
          }
          CFDictionarySetValue(v24, @"ServiceID", *(const void **)(a1 + 24));
          sub_136A0();
        }
        if (v9 && my_CFEqual((unint64_t)v9, (unint64_t)v24)) {
          goto LABEL_82;
        }
        CFStringRef v38 = v45;
        if (v45
          || (CFStringRef v38 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks), (v45 = v38) != 0))
        {
          CFMutableArrayRef Mutable = theArray;
          if (theArray
            || (Mutable = CFArrayCreateMutable(0, 1, &kCFTypeArrayCallBacks), (CFMutableArrayRef theArray = Mutable) != 0))
          {
            if (!v16 || a2) {
              CFArrayAppendValue(Mutable, theDict);
            }
            else {
              CFArrayInsertValueAtIndex(Mutable, (int)v12, theDict);
            }
            CFDictionarySetValue(v38, @"Triggers", Mutable);
            SCDynamicStoreSetValue((SCDynamicStoreRef)gDynamicStore, (CFStringRef)gOndemand_key, v38);
            sub_138B4(Mutable);
LABEL_82:
            uint64_t v2 = 1;
            goto LABEL_83;
          }
        }
        goto LABEL_79;
      }
    }
    else
    {
      LODWORD(v12) = 0;
      int v16 = 0;
      CFArrayRef v9 = 0;
    }
    CFStringRef v20 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFMutableDictionaryRef theDict = v20;
    if (v20)
    {
      CFDictionaryRef v17 = v20;
      a2 = 1;
      goto LABEL_34;
    }
LABEL_79:
    uint64_t v2 = 0;
  }
LABEL_83:
  my_CFRelease((const void **)&v45);
  my_CFRelease((const void **)&theDict);
  my_CFRelease((const void **)&theArray);
  my_CFRelease(&v43);
  return v2;
}

uint64_t scnc_getstatus(uint64_t a1)
{
  if (*(_WORD *)(a1 + 64) == 1) {
    return ipsec_getstatus(a1);
  }
  if (*(_WORD *)(a1 + 64)) {
    return 0;
  }
  return ppp_getstatus(a1);
}

void user_notification_callback(void *cf, uint64_t a2)
{
  unsigned int v4 = &service_head;
  while (1)
  {
    unsigned int v4 = (uint64_t *)*v4;
    if (!v4) {
      break;
    }
    if ((void *)v4[21] == cf)
    {
      CFRetain(cf);
      CFRunLoopRef Current = CFRunLoopGetCurrent();
      CFRunLoopRemoveSource(Current, (CFRunLoopSourceRef)v4[22], kCFRunLoopDefaultMode);
      my_CFRelease((const void **)v4 + 21);
      my_CFRelease((const void **)v4 + 22);
      if (*((_WORD *)v4 + 32) == 1)
      {
        ipsec_user_notification_callback((uint64_t)v4, (CFUserNotificationRef)cf, a2);
      }
      else if (!*((_WORD *)v4 + 32))
      {
        ppp_user_notification_callback(v4, cf, a2);
      }
      CFRelease(cf);
      return;
    }
  }
}

BOOL ondemand_unpublish_dns_triggering_dicts(uint64_t a1)
{
  CFArrayRef v9 = 0;
  CFDictionaryRef v2 = *(const __CFDictionary **)(a1 + 432);
  if (v2)
  {
    if (*(unsigned char *)(a1 + 440))
    {
      size_t Count = CFDictionaryGetCount(v2);
      if (Count)
      {
        CFIndex v4 = Count;
        CFDictionaryRef v5 = (const void **)malloc_type_calloc(Count, 8uLL, 0x6004044C4A2DFuLL);
        if (v5)
        {
          CFPropertyListRef v6 = v5;
          CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 432), v5, 0);
          CFArrayRef v7 = CFArrayCreate(kCFAllocatorDefault, v6, v4, &kCFTypeArrayCallBacks);
          CFArrayRef v9 = v7;
          if (v7 && SCDynamicStoreSetMultiple((SCDynamicStoreRef)gDynamicStore, 0, v7, 0)) {
            *(unsigned char *)(a1 + 440) = 0;
          }
          free(v6);
        }
      }
    }
  }
  my_CFRelease((const void **)&v9);
  return *(unsigned char *)(a1 + 440) == 0;
}

void sub_136A0()
{
  hasDNS();
  CFMutableArrayRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  uint64_t v1 = (void *)service_head;
  if (Mutable) {
    BOOL v2 = service_head == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (!v2)
  {
    do
    {
      uint64_t v3 = (const void *)v1[3];
      uint64_t v1 = (void *)*v1;
      if (v3) {
        CFArrayAppendValue(Mutable, v3);
      }
    }
    while (v1);
  }
  CFStringRef v15 = Mutable;
  if (Mutable)
  {
    scnc_cache_flush_removed_services(Mutable);
    my_CFRelease((const void **)&v15);
  }
  CFIndex v4 = (void *)service_head;
  if (service_head)
  {
    int v5 = 0;
    while (1)
    {
      while (1)
      {
        uint64_t v6 = (uint64_t)v4;
        CFIndex v4 = (void *)*v4;
        int v7 = *(_DWORD *)(v6 + 72);
        if (v7) {
          break;
        }
LABEL_35:
        if (!v4) {
          return;
        }
      }
      *(_DWORD *)(v6 + 72) = v7 & 0xFFFFFFFC;
      if ((v7 & 0x200000) != 0)
      {
        *(_DWORD *)(v6 + 72) = v7 & 0xFFDFFFFC;
        sub_15858(v6);
      }
      int v8 = *(unsigned __int16 *)(v6 + 64);
      if (v8 == 2)
      {
        int v5 = -1;
        goto LABEL_29;
      }
      if (v8 == 1) {
        break;
      }
      if (!*(_WORD *)(v6 + 64))
      {
        int v9 = ppp_setup_service(v6);
LABEL_20:
        int v5 = v9;
      }
      if (v5 < 0)
      {
LABEL_29:
        *(unsigned char *)(v6 + 16) = 0;
        if (!v4) {
          return;
        }
      }
      else
      {
        *(unsigned char *)(v6 + 16) = 1;
        if (ne_session_use_as_system_vpn()) {
          *(_DWORD *)(v6 + 72) &= 0xFEDFFFFF;
        }
        CFURLRef v10 = (void *)(v6 + 144);
        my_CFRelease((const void **)(v6 + 144));
        CFDictionaryRef v11 = (const __CFDictionary *)copyEntity((const __SCDynamicStore *)gDynamicStore, kSCDynamicStoreDomainSetup, *(const __CFString **)(v6 + 24), @"com.apple.payload/PayloadRoot");
        if (v11)
        {
          CFDictionaryRef v12 = v11;
          CFArrayRef Value = CFDictionaryGetValue(v11, @"PayloadIdentifier");
          void *v10 = Value;
          CFTypeID TypeID = CFStringGetTypeID();
          if (Value && CFGetTypeID(Value) == TypeID)
          {
            void *v10 = Value;
            CFRetain(Value);
          }
          else
          {
            void *v10 = 0;
          }
          CFRelease(v12);
        }
        if ((*(unsigned char *)(v6 + 74) & 0x20) == 0)
        {
          reachability_clear(v6);
          goto LABEL_35;
        }
        scnc_cache_init_service(v6);
        reachability_reset(v6);
        ondemand_add_service(v6, 1);
        if (!v4) {
          return;
        }
      }
    }
    int v9 = ipsec_setup_service(v6);
    goto LABEL_20;
  }
}

uint64_t sub_138B4(const __CFArray *a1)
{
  if (isArray(a1) && (CFIndex Count = CFArrayGetCount(a1), Count >= 1))
  {
    CFIndex v3 = Count;
    uint64_t v4 = 0;
    CFIndex v5 = 0;
    uint64_t v6 = (const void *)kSCPropNetVPNOnDemandRuleAction;
    int v7 = (const void *)kSCValNetVPNOnDemandRuleActionIgnore;
    int v8 = (const void *)kSCValNetVPNOnDemandRuleActionDisconnect;
    do
    {
      CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, v5);
      if (isDictionary(ValueAtIndex))
      {
        CFArrayRef Value = CFDictionaryGetValue(ValueAtIndex, v6);
        if (CFDictionaryGetValue(ValueAtIndex, @"OnDemandMatchAppEnabled")
          || !Value
          || !CFEqual(Value, v7) && !CFEqual(Value, v8))
        {
          ++v4;
        }
      }
      ++v5;
    }
    while (v3 != v5);
  }
  else
  {
    uint64_t v4 = 0;
  }
  int v11 = gNotifyOnDemandToken;
  if (gNotifyOnDemandToken == -1)
  {
    if (notify_register_check("com.apple.system.SCNetworkConnectionOnDemand", &gNotifyOnDemandToken))
    {
LABEL_19:
      SCLog();
      uint64_t result = gNotifyOnDemandToken;
      if (gNotifyOnDemandToken != -1)
      {
        uint64_t result = notify_cancel(gNotifyOnDemandToken);
        gNotifyOnDemandToken = -1;
      }
      return result;
    }
    int v11 = gNotifyOnDemandToken;
  }
  if (notify_set_state(v11, v4)) {
    goto LABEL_19;
  }
  uint64_t result = notify_post("com.apple.system.SCNetworkConnectionOnDemand");
  if (result) {
    goto LABEL_19;
  }
  return result;
}

uint64_t bringup_cellular(const void **a1)
{
  uint64_t v5 = 0;
  long long v7 = 0u;
  uint64_t v8 = 0;
  uint64_t v6 = a1;
  context.version = 0;
  memset(&context.retain, 0, 24);
  context.mach_timebase_info info = a1;
  uint64_t v2 = _CTServerConnectionCreate();
  a1[19] = (const void *)v2;
  if (!v2
    || (unint64_t)_CTServerConnectionGetPacketContextActive() >> 32
    || (SCLog(), (unint64_t)_CTServerConnectionRegisterForNotification() >> 32)
    || (unint64_t)_CTServerConnectionRegisterForNotification() >> 32
    || (unint64_t)_CTServerConnectionSetPacketContextActiveByServiceType() >> 32)
  {
    SCLog();
    my_CFRelease(a1 + 19);
    return 0;
  }
  else
  {
    CFRunLoopGetCurrent();
    _CTServerConnectionAddToRunLoop();
    return 1;
  }
}

void sub_13C40(int a1, const void *a2, CFDictionaryRef theDict, uint64_t a4)
{
  int valuePtr = 0;
  v15.version = 0;
  memset(&v15.retain, 0, 24);
  v15.mach_timebase_info info = (void *)a4;
  CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(theDict, kCTRegistrationDataContextID);
  if (CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr)) {
    BOOL v8 = valuePtr == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (!v8) {
    return;
  }
  if (!CFEqual(a2, kCTRegistrationDataStatusChangedNotification))
  {
    SCLog();
    if (*(_WORD *)(a4 + 64) != 1) {
      return;
    }
    uint64_t v13 = a4;
    int v14 = 2;
    goto LABEL_14;
  }
  int v9 = CFDictionaryGetValue(theDict, kCTRegistrationDataActive);
  if (!CFEqual(v9, kCFBooleanTrue)) {
    return;
  }
  SCLog();
  my_CFRelease((const void **)(a4 + 152));
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  CFRunLoopTimerRef v11 = CFRunLoopTimerCreate(0, Current + 2.0, 3.1536e10, 0, 0, (CFRunLoopTimerCallBack)sub_13DD4, &v15);
  *(void *)(a4 + 160) = v11;
  if (v11)
  {
    CFDictionaryRef v12 = CFRunLoopGetCurrent();
    CFRunLoopAddTimer(v12, *(CFRunLoopTimerRef *)(a4 + 160), kCFRunLoopCommonModes);
    return;
  }
  SCLog();
  if (*(_WORD *)(a4 + 64) == 1)
  {
    uint64_t v13 = a4;
    int v14 = 1;
LABEL_14:
    ipsec_cellular_event(v13, v14);
  }
}

void sub_13DD4(uint64_t a1, uint64_t a2)
{
  my_CFRelease((const void **)(a2 + 160));
  if (*(_WORD *)(a2 + 64) == 1)
  {
    ipsec_cellular_event(a2, 0);
  }
}

CFStringRef check_interface_captive_and_not_ready(const __SCDynamicStore *a1, uint64_t a2)
{
  if (!a1) {
    return 0;
  }
  CFStringRef v3 = CFStringCreateWithFormat(0, 0, @"State:/Network/Interface/%s/CaptiveNetwork", a2);
  if (!v3) {
    return 0;
  }
  CFStringRef v4 = v3;
  CFStringRef NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity(0, kSCDynamicStoreDomainState, v3);
  if (NetworkGlobalEntity)
  {
    CFDictionaryRef v6 = (const __CFDictionary *)SCDynamicStoreCopyValue(a1, NetworkGlobalEntity);
    CFRelease(NetworkGlobalEntity);
    if (v6)
    {
      CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v6, @"Stage");
      CFStringRef NetworkGlobalEntity = Value;
      if (Value)
      {
        CFStringRef NetworkGlobalEntity = (const __CFString *)(CFStringCompare(Value, @"Uknown", 0)
                                                && CFStringCompare(NetworkGlobalEntity, @"Online", 0));
        SCLog();
      }
      CFRelease(v6);
    }
    else
    {
      CFStringRef NetworkGlobalEntity = 0;
    }
  }
  CFRelease(v4);
  return NetworkGlobalEntity;
}

uint64_t client_gone(uint64_t a1)
{
  uint64_t v1 = (void *)service_head;
  if (service_head)
  {
    do
    {
      CFStringRef v3 = v1 + 71;
      while (1)
      {
        CFStringRef v3 = (void *)*v3;
        if (!v3) {
          break;
        }
        if (v3[2] == a1)
        {
          if (*((_DWORD *)v3 + 6))
          {
            *(_DWORD *)(a1 + 116) &= ~2u;
            scnc_stop((uint64_t)v1, a1, 15, 0);
          }
          break;
        }
      }
      uint64_t v1 = (void *)*v1;
    }
    while (v1);
  }
  return 0;
}

uint64_t scnc_bootstrap_dealloc(uint64_t result)
{
  mach_port_name_t v1 = *(_DWORD *)(result + 96);
  if (v1)
  {
    uint64_t v2 = result;
    uint64_t result = mach_port_deallocate(mach_task_self_, v1);
    *(_DWORD *)(v2 + 96) = 0;
  }
  return result;
}

uint64_t scnc_bootstrap_retain(uint64_t result, mach_port_name_t name)
{
  mach_port_name_t v3 = *(_DWORD *)(result + 96);
  if (v3 != name)
  {
    uint64_t v4 = result;
    if (v3) {
      uint64_t result = mach_port_deallocate(mach_task_self_, v3);
    }
    if (name) {
      uint64_t result = mach_port_mod_refs(mach_task_self_, name, 0, 1);
    }
    *(_DWORD *)(v4 + 96) = name;
  }
  return result;
}

uint64_t scnc_ausession_dealloc(uint64_t result)
{
  mach_port_name_t v1 = *(_DWORD *)(result + 100);
  if (v1)
  {
    uint64_t v2 = result;
    uint64_t result = mach_port_deallocate(mach_task_self_, v1);
    *(_DWORD *)(v2 + 100) = 0;
  }
  return result;
}

uint64_t scnc_ausession_retain(uint64_t result, mach_port_name_t name)
{
  mach_port_name_t v3 = *(_DWORD *)(result + 100);
  if (v3 != name)
  {
    uint64_t v4 = result;
    if (v3) {
      uint64_t result = mach_port_deallocate(mach_task_self_, v3);
    }
    if (name) {
      uint64_t result = mach_port_mod_refs(mach_task_self_, name, 0, 1);
    }
    *(_DWORD *)(v4 + 100) = name;
  }
  return result;
}

uint64_t scnc_start(unint64_t a1, const __CFDictionary *a2, uint64_t a3, int a4, int a5, int a6, int a7, mach_port_name_t a8, mach_port_name_t a9)
{
  int v39 = 0;
  if (!a2)
  {
    uint64_t v38 = a3;
LABEL_26:
    int v23 = 0;
    goto LABEL_30;
  }
  if (GetIntFromDict(a2, @"OnDemandTrafficClass", &v39, 0))
  {
    if (v39 != 100)
    {
      if (v39 == 200)
      {
        char v17 = 0;
      }
      else
      {
        if (v39 == 900) {
          goto LABEL_27;
        }
        char v17 = 1;
      }
      int v18 = *(_DWORD *)(a1 + 412);
      if (!v18) {
        char v17 = 1;
      }
      if (v18 != 1 && (v17 & 1) != 0) {
        goto LABEL_13;
      }
    }
LABEL_27:
    SCLog();
    return 5;
  }
LABEL_13:
  uint64_t v38 = a3;
  if (!CFDictionaryContainsKey(a2, @"OnDemandHostName")) {
    goto LABEL_26;
  }
  CFStringRef Value = CFDictionaryGetValue(a2, @"OnDemandHostName");
  CFStringGetTypeID();
  if (Value) {
    CFGetTypeID(Value);
  }
  CFStringRef v20 = (const __CFString *)CFDictionaryGetValue(a2, kSCPropNetPPPOnDemandPriority);
  if (!isString(v20) || CFEqual(v20, kSCValNetPPPOnDemandPriorityHigh)) {
    goto LABEL_29;
  }
  if (CFStringCompare(v20, kSCValNetPPPOnDemandPriorityLow, 0))
  {
    if (CFStringCompare(v20, kSCValNetPPPOnDemandPriorityDefault, 0)) {
      goto LABEL_29;
    }
    CFDictionaryRef v21 = (const __CFDictionary *)CFDictionaryGetValue(a2, kSCEntNetPPP);
    if (!v21) {
      goto LABEL_29;
    }
    CFStringRef v22 = (const __CFString *)CFDictionaryGetValue(v21, kSCPropNetPPPOnDemandMode);
    if (!isString(v22)
      || CFEqual(v22, kSCValNetPPPOnDemandModeAggressive))
    {
      goto LABEL_29;
    }
    if (CFStringCompare(v22, kSCValNetPPPOnDemandModeConservative, 0))
    {
      if (CFEqual(v22, kSCValNetPPPOnDemandModeCompatible)) {
        return 5;
      }
      goto LABEL_29;
    }
  }
  if ((*(_DWORD *)(a1 + 72) & 0x200) == 0) {
    return 5;
  }
LABEL_29:
  int v23 = 1;
LABEL_30:
  uint64_t v24 = controller_options_get_onDemandBlacklistedProcesses();
  if (v24)
  {
    CFArrayRef v25 = (const __CFArray *)v24;
    int v26 = a5;
    int v27 = a6;
    mach_port_name_t v28 = a8;
    int v29 = a4;
    proc_name(a7, buffer, 0x40u);
    CFStringRef v30 = CFStringCreateWithCString(kCFAllocatorDefault, buffer, 0x600u);
    if (v30)
    {
      CFStringRef v31 = v30;
      v41.length = CFArrayGetCount(v25);
      v41.location = 0;
      if (CFArrayContainsValue(v25, v41, v31))
      {
        SCLog();
        CFRelease(v31);
        return 5;
      }
      CFRelease(v31);
    }
    a4 = v29;
    a8 = v28;
    a6 = v27;
    a5 = v26;
  }
  if (gStopRls || gSleeping && (*(unsigned char *)(a1 + 74) & 4) != 0) {
    return 5;
  }
  *(void *)(a1 + 400) = 0;
  *(_DWORD *)(a1 + 408) = 0;
  int v34 = *(unsigned __int16 *)(a1 + 64);
  if (v34 == 2)
  {
    uint64_t v32 = 0;
    goto LABEL_49;
  }
  if (v34 == 1)
  {
    uint64_t v35 = ipsec_start(a1, a2, a5, a6, a8, 0, v23);
    goto LABEL_47;
  }
  if (!*(_WORD *)(a1 + 64))
  {
    uint64_t v35 = ppp_start(a1, a2, a5, a6, a8, a9, 0, v23);
LABEL_47:
    uint64_t v32 = v35;
    goto LABEL_49;
  }
  uint64_t v32 = 5;
LABEL_49:
  sub_159D4(a7, buffer);
  SCLog();
  if (!v32)
  {
    *(_DWORD *)(a1 + 72) &= ~0x200u;
    if (v38 && (CFNumberRef v36 = malloc_type_malloc(0x20uLL, 0x10A0040D98738FAuLL)) != 0)
    {
      uint64_t v32 = 0;
      v36[2] = v38;
      *((_DWORD *)v36 + 6) = a4;
      void *v36 = 0;
      CFNumberRef v37 = *(void **)(a1 + 576);
      v36[1] = v37;
      void *v37 = v36;
      *(void *)(a1 + 576) = v36;
    }
    else
    {
      return 0;
    }
  }
  return v32;
}

uint64_t scnc_suspend(uint64_t a1)
{
  if (*(_WORD *)(a1 + 64)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return ppp_suspend(a1);
  }
}

uint64_t scnc_resume(uint64_t a1)
{
  if (*(_WORD *)(a1 + 64)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return ppp_resume(a1);
  }
}

uint64_t scnc_copyextendedstatus(uint64_t a1, void *a2, _WORD *a3)
{
  CFTypeRef cf = 0;
  *a2 = 0;
  *a3 = 0;
  if (*(_WORD *)(a1 + 64) == 1)
  {
    uint64_t v5 = ipsec_copyextendedstatus(a1, &cf);
  }
  else
  {
    if (*(_WORD *)(a1 + 64))
    {
      uint64_t v6 = 22;
LABEL_21:
      strerror(v6);
      scnc_log(5, @"Copy extended status for %@ failed: %s");
      return v6;
    }
    uint64_t v5 = ppp_copyextendedstatus(a1, &cf);
  }
  uint64_t v6 = v5;
  CFTypeRef v7 = cf;
  if (cf) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (!v8)
  {
    CFDataRef v9 = 0;
    if (!cf) {
      goto LABEL_18;
    }
LABEL_17:
    CFRelease(v7);
    goto LABEL_18;
  }
  memset(__len, 0, sizeof(__len));
  CFDataRef v9 = Serialize(cf, (const UInt8 **)&__len[1], __len);
  if (v9 && (CFURLRef v10 = (void *)my_Allocate(__len[0]), (*a2 = v10) != 0))
  {
    memmove(v10, *(const void **)&__len[1], __len[0]);
    uint64_t v6 = 0;
    *a3 = __len[0];
  }
  else
  {
    uint64_t v6 = 12;
  }
  CFTypeRef v7 = cf;
  if (cf) {
    goto LABEL_17;
  }
LABEL_18:
  if (v9) {
    CFRelease(v9);
  }
  if (v6) {
    goto LABEL_21;
  }
  return v6;
}

uint64_t scnc_copystatistics(uint64_t a1, void *a2, _WORD *a3)
{
  CFTypeRef cf = 0;
  *a2 = 0;
  *a3 = 0;
  if (*(_WORD *)(a1 + 64) == 1)
  {
    uint64_t v5 = ipsec_copystatistics(a1, &cf);
  }
  else
  {
    if (*(_WORD *)(a1 + 64))
    {
      uint64_t v6 = 22;
LABEL_21:
      strerror(v6);
      scnc_log(5, @"Copy statistics for %@ failed: %s");
      return v6;
    }
    uint64_t v5 = ppp_copystatistics(a1, &cf);
  }
  uint64_t v6 = v5;
  CFTypeRef v7 = cf;
  if (cf) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (!v8)
  {
    CFDataRef v9 = 0;
    if (!cf) {
      goto LABEL_18;
    }
LABEL_17:
    CFRelease(v7);
    goto LABEL_18;
  }
  memset(__len, 0, sizeof(__len));
  CFDataRef v9 = Serialize(cf, (const UInt8 **)&__len[1], __len);
  if (v9 && (CFURLRef v10 = (void *)my_Allocate(__len[0]), (*a2 = v10) != 0))
  {
    memmove(v10, *(const void **)&__len[1], __len[0]);
    uint64_t v6 = 0;
    *a3 = __len[0];
  }
  else
  {
    uint64_t v6 = 12;
  }
  CFTypeRef v7 = cf;
  if (cf) {
    goto LABEL_17;
  }
LABEL_18:
  if (v9) {
    CFRelease(v9);
  }
  if (v6) {
    goto LABEL_21;
  }
  return v6;
}

uint64_t scnc_getconnectdata(uint64_t a1, void *a2, _WORD *a3, int a4)
{
  CFTypeRef cf = 0;
  *a2 = 0;
  *a3 = 0;
  if (*(_WORD *)(a1 + 64) == 1)
  {
    uint64_t v6 = ipsec_getconnectdata(a1, &cf, a4);
  }
  else
  {
    if (*(_WORD *)(a1 + 64)) {
      return 22;
    }
    uint64_t v6 = ppp_getconnectdata(a1, &cf, a4);
  }
  uint64_t v7 = v6;
  CFTypeRef v8 = cf;
  if (cf) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9)
  {
    memset(__len, 0, sizeof(__len));
    CFDataRef v10 = Serialize(cf, (const UInt8 **)&__len[1], __len);
    if (v10)
    {
      CFDataRef v11 = v10;
      CFDictionaryRef v12 = (void *)my_Allocate(__len[0]);
      *a2 = v12;
      if (v12)
      {
        memmove(v12, *(const void **)&__len[1], __len[0]);
        uint64_t v7 = 0;
        *a3 = __len[0];
      }
      else
      {
        uint64_t v7 = 12;
      }
      CFRelease(v11);
    }
    else
    {
      uint64_t v7 = 12;
    }
    CFTypeRef v8 = cf;
  }
  if (v8) {
    CFRelease(v8);
  }
  return v7;
}

uint64_t scnc_getconnectsystemdata(uint64_t a1, void *a2, _WORD *a3)
{
  if (*(_WORD *)(a1 + 64)) {
    return 0xFFFFFFFFLL;
  }
  else {
    return ppp_getconnectsystemdata(a1, a2, a3);
  }
}

uint64_t scnc_idle_disconnect(uint64_t result)
{
  if (*(_WORD *)(result + 64) == 1)
  {
    *(_DWORD *)(result + 596) = 19;
    return ipsec_stop(result);
  }
  else if (!*(_WORD *)(result + 64))
  {
    *(_DWORD *)(result + 632) = 12;
    return ppp_stop((_DWORD *)result, 15);
  }
  return result;
}

uint64_t scnc_disconnectifoverslept(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 0;
  if ((*(unsigned char *)(a2 + 75) & 8) != 0 && gWokeAt != -1 && gSleptAt != -1)
  {
    difftime(gWokeAt, gSleptAt);
    uint64_t v2 = 1;
    SCLog();
    scnc_idle_disconnect(a2);
  }
  return v2;
}

uint64_t set_ondemand_pause_timer(uint64_t a1, unsigned int a2, int a3, int a4)
{
  uint64_t result = 0;
  context.version = 0;
  memset(&context.retain, 0, 24);
  context.mach_timebase_info info = (void *)a1;
  if (a2 && a3 != a4)
  {
    SCLog();
    clear_ondemand_pause_timer(a1);
    *(_DWORD *)(a1 + 560) = a4;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    CFRunLoopTimerRef v9 = CFRunLoopTimerCreate(0, Current + (double)a2, 0.0, 0, 0, (CFRunLoopTimerCallBack)sub_14BB8, &context);
    *(void *)(a1 + 552) = v9;
    if (v9)
    {
      CFDataRef v10 = CFRunLoopGetCurrent();
      CFRunLoopAddTimer(v10, *(CFRunLoopTimerRef *)(a1 + 552), kCFRunLoopCommonModes);
      return 1;
    }
    else
    {
      SCLog();
      return 0;
    }
  }
  return result;
}

__CFRunLoopTimer *clear_ondemand_pause_timer(uint64_t a1)
{
  uint64_t result = *(__CFRunLoopTimer **)(a1 + 552);
  if (result)
  {
    mach_port_name_t v3 = (const void **)(a1 + 552);
    CFRunLoopTimerInvalidate(result);
    my_CFRelease(v3);
    return (__CFRunLoopTimer *)SCLog();
  }
  return result;
}

void sub_14BB8(uint64_t a1, uint64_t a2)
{
  SCLog();

  my_CFRelease((const void **)(a2 + 552));
}

void sub_14C04(id a1, service *a2)
{
  if ((a2->var10 & 0x200000) != 0) {
    ondemand_add_service((uint64_t)a2, 0);
  }
}

uint64_t sub_14C1C(uint64_t a1, uint64_t a2, int a3, intptr_t a4)
{
  uint64_t result = SCLog();
  if (a3 <= -536870145)
  {
    if (a3 == -536870288)
    {
      SCLog();
      for (uint64_t i = service_head; i; uint64_t i = *(void *)i)
      {
        if (*(_WORD *)(i + 64))
        {
          if (*(_WORD *)(i + 64) == 1 && !ipsec_can_sleep(i))
          {
LABEL_29:
            io_connect_t v10 = gIOPort;
            return IOCancelPowerChange(v10, a4);
          }
        }
        else if (!ppp_can_sleep(i))
        {
          goto LABEL_29;
        }
      }
    }
    else
    {
      if (a3 != -536870272) {
        return result;
      }
      SCLog();
      gSleeping = 1;
      time(&gSleptAt);
      uint64_t result = sub_129F0(0);
      if (result)
      {
        gSleepArgument = a4;
        return result;
      }
    }
    io_connect_t v8 = gIOPort;
    return IOAllowPowerChange(v8, a4);
  }
  if (a3 == -536870144)
  {
    time(&gWokeAt);
    for (uint64_t j = service_head; j; uint64_t j = *(void *)j)
    {
      *(_DWORD *)(j + 72) |= 0x200u;
      if (*(_WORD *)(j + 64) == 1)
      {
        ipsec_wake_up(j);
      }
      else if (!*(_WORD *)(j + 64))
      {
        ppp_wake_up((_DWORD *)j);
      }
    }
  }
  else
  {
    if (a3 != -536870112) {
      return result;
    }
    gSleeping = 0;
    gWakeUpTime = mach_absolute_time();
  }

  return SCLog();
}

void sub_14E48(uint64_t a1, const __CFArray *a2)
{
  SCLog();
  if (a2)
  {
    CFStringRef v38 = SCDynamicStoreKeyCreate(0, @"%@/%@/%@/", kSCDynamicStoreDomainSetup, kSCCompNetwork, kSCCompService);
    CFStringRef NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity(0, kSCDynamicStoreDomainSetup, kSCEntNetIPv4);
    CFTypeRef cf2 = NetworkGlobalEntity;
    CFStringRef v4 = SCDynamicStoreKeyCreateNetworkGlobalEntity(0, kSCDynamicStoreDomainState, kSCEntNetIPv4);
    CFTypeRef v36 = v4;
    CFStringRef value = (void *)SCDynamicStoreKeyCreateNetworkGlobalEntity(0, kSCDynamicStoreDomainState, kSCEntNetDNS);
    if (!v38 || (NetworkGlobalEntity ? (BOOL v5 = v4 == 0) : (BOOL v5 = 1), v5))
    {
      SCLog();
LABEL_78:
      my_CFRelease((const void **)&v38);
      my_CFRelease(&cf2);
      my_CFRelease(&v36);
      my_CFRelease((const void **)&value);
      return;
    }
    int Count = CFArrayGetCount(a2);
    if (Count < 1)
    {
LABEL_76:
      if (gSCNCVerbose) {
        sub_1575C();
      }
      goto LABEL_78;
    }
    CFIndex v7 = 0;
    int v8 = 0;
    int v9 = 0;
    CFIndex v10 = Count;
    unint64_t v30 = kSCValNetVPNOnDemandRuleInterfaceTypeMatchCellular;
    uint64_t v11 = Count;
    while (1)
    {
      CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a2, v7);
      if (CFEqual(ValueAtIndex, cf2))
      {
        int v9 = 1;
      }
      else
      {
        if (CFEqual(ValueAtIndex, v36))
        {
          if (byte_40558 == 1) {
            CFStringRef v13 = copyPrimaryService((const __SCDynamicStore *)gDynamicStore);
          }
          else {
            CFStringRef v13 = 0;
          }
          uint64_t v16 = service_head;
          if (!service_head)
          {
LABEL_35:
            if (!v13 || !byte_40558) {
              goto LABEL_38;
            }
            byte_40558 = 0;
            SCLog();
LABEL_39:
            CFRelease(v13);
LABEL_40:
            v39.location = 0;
            v39.length = v10;
            if (!CFArrayContainsValue(a2, v39, value)) {
              do_network_signature_changed();
            }
            goto LABEL_11;
          }
          BOOL v17 = 0;
          while (2)
          {
            *(_DWORD *)(v16 + 72) |= 0x200u;
            if (*(_WORD *)(v16 + 64) == 1)
            {
              ipsec_ipv4_state_changed(v16);
              if (v17) {
                goto LABEL_33;
              }
            }
            else
            {
              if (!*(_WORD *)(v16 + 64)) {
                ppp_ipv4_state_changed(v16);
              }
              if (v17)
              {
LABEL_33:
                uint64_t v16 = *(void *)v16;
                if (!v16)
                {
                  if (!v17) {
                    goto LABEL_35;
                  }
LABEL_38:
                  if (v13) {
                    goto LABEL_39;
                  }
                  goto LABEL_40;
                }
                continue;
              }
            }
            break;
          }
          if (v13)
          {
            CFStringRef v18 = *(const __CFString **)(v16 + 24);
            BOOL v17 = v18 == v13 || v18 && CFEqual(v18, v13);
          }
          goto LABEL_33;
        }
        CFStringRef v14 = parse_component(ValueAtIndex, v38);
        if (v14)
        {
          CFStringRef v15 = v14;
          sub_15354(v14);
          CFRelease(v15);
          int v8 = 1;
        }
        else if (!v8)
        {
          CFStringRef v19 = (const __CFString *)value;
          int v20 = CFEqual(ValueAtIndex, value);
          int v21 = CFEqual(ValueAtIndex, @"NWI_NOTIFICATION");
          if (v20 | v21)
          {
            int v22 = v21;
            CFTypeRef cf1 = 0;
            CFPropertyListRef v23 = SCDynamicStoreCopyValue((SCDynamicStoreRef)gDynamicStore, v19);
            CFStringRef v33 = 0;
            CFTypeRef cf1 = v23;
            CFStringRef v24 = copy_primary_interface_name(0);
            CFStringRef v32 = 0;
            CFStringRef v33 = v24;
            CFStringRef v32 = (const __CFString *)copy_service_id_for_interface((unint64_t)v24);
            for (uint64_t i = service_head; i; uint64_t i = *(void *)i)
            {
              if (*(unsigned char *)(i + 75))
              {
                if (v22 && my_CFEqual(*(void *)(i + 24), (unint64_t)v32)
                  || v20 && (CFTypeRef v27 = *(CFTypeRef *)(i + 456), cf1 != v27) && (!cf1 || !v27 || !CFEqual(cf1, v27)))
                {
                  if (*(_WORD *)(i + 64) == 1 && scnc_getstatus(i) && *(unsigned char *)(i + 934))
                  {
                    if (my_CFEqual(*(void *)(i + 24), (unint64_t)v32))
                    {
                      my_CFRelease((const void **)&v33);
                      my_CFRelease((const void **)&v32);
                      CFStringRef v33 = copy_primary_interface_name(*(const __CFString **)(i + 24));
                      CFStringRef v26 = (const __CFString *)copy_service_id_for_interface((unint64_t)v33);
                      CFStringRef v32 = v26;
                    }
                    else
                    {
                      CFStringRef v26 = v32;
                    }
                    CFStringRef v31 = 0;
                    CFTypeRef v28 = copy_interface_type(v26);
                    CFStringRef v31 = v28;
                    if (v28 && !my_CFEqual((unint64_t)v28, v30)) {
                      scnc_stop(i, 0, 15, 0);
                    }
                    my_CFRelease(&v31);
                  }
                  my_CFRelease((const void **)(i + 456));
                  if (cf1)
                  {
                    CFRetain(cf1);
                    CFTypeRef v29 = cf1;
                  }
                  else
                  {
                    CFTypeRef v29 = 0;
                  }
                  *(void *)(i + 456) = v29;
                }
              }
            }
            my_CFRelease(&cf1);
            my_CFRelease((const void **)&v33);
            my_CFRelease((const void **)&v32);
          }
          int v8 = 0;
        }
      }
LABEL_11:
      if (++v7 == v11)
      {
        if (v9) {
          sub_15678();
        }
        if (v8) {
          sub_136A0();
        }
        goto LABEL_76;
      }
    }
  }
}

void sub_15300()
{
  values = @"NWI_NOTIFICATION";
  CFArrayRef v0 = CFArrayCreate(0, (const void **)&values, 1, &kCFTypeArrayCallBacks);
  sub_14E48((uint64_t)v0, v0);
  my_CFRelease((const void **)&v0);
}

void sub_15354(const __CFString *a1)
{
  CFStringRef v18 = 0;
  uint64_t v2 = &service_head;
  do
    uint64_t v2 = (uint64_t *)*v2;
  while (v2 && CFStringCompare((CFStringRef)v2[3], a1, 0));
  CFPropertyListRef v3 = copyEntity((const __SCDynamicStore *)gDynamicStore, kSCDynamicStoreDomainSetup, a1, kSCEntNetInterface);
  BOOL v17 = v3;
  if (!v3)
  {
    if (!v2) {
      goto LABEL_35;
    }
    goto LABEL_10;
  }
  CFDictionaryRef v4 = (const __CFDictionary *)v3;
  CFStringRef Value = CFDictionaryGetValue((CFDictionaryRef)v3, kSCPropNetInterfaceType);
  uint64_t v6 = Value;
  if (!v2)
  {
    CFIndex v7 = CFDictionaryGetValue(v4, kSCPropNetInterfaceSubType);
    goto LABEL_12;
  }
  if (!my_CFEqual((unint64_t)Value, v2[4]))
  {
LABEL_10:
    sub_12374((unsigned __int16 *)v2);
    goto LABEL_35;
  }
  CFIndex v7 = CFDictionaryGetValue(v4, kSCPropNetInterfaceSubType);
  if (my_CFEqual((unint64_t)v7, v2[5]))
  {
LABEL_29:
    *((_DWORD *)v2 + 18) |= 1u;
    goto LABEL_35;
  }
  sub_12374((unsigned __int16 *)v2);
LABEL_12:
  int v8 = (uint64_t *)malloc_type_malloc(0x420uLL, 0x10F2040B89F1A8BuLL);
  if (!v8) {
    goto LABEL_35;
  }
  uint64_t v2 = v8;
  bzero(v8, 0x420uLL);
  v2[3] = (uint64_t)my_CFRetain(a1);
  v2[4] = (uint64_t)my_CFRetain(v6);
  v2[5] = (uint64_t)my_CFRetain(v7);
  size_t v9 = (unsigned __int16)(CFStringGetLength(a1) + 1);
  CFIndex v10 = (char *)malloc_type_malloc(v9, 0xE7FB2078uLL);
  v2[7] = (uint64_t)v10;
  if (v10) {
    CFStringGetCString(a1, v10, v9, 0x8000100u);
  }
  if (my_CFEqual((unint64_t)v6, (unint64_t)kSCValNetInterfaceTypePPP))
  {
    *((_WORD *)v2 + 32) = 0;
    int v11 = ppp_subtype((unint64_t)v7);
LABEL_19:
    int v12 = v11;
    *((_WORD *)v2 + 33) = v11;
LABEL_20:
    int v13 = *((unsigned __int16 *)v2 + 32);
    int v14 = findfreeunit(v13, v12);
    *((_WORD *)v2 + 34) = v14;
    if (v14 != 0xFFFF && v13 != 2)
    {
      if (v13 == 1)
      {
        if (!ipsec_new_service((uint64_t)v2)) {
          goto LABEL_27;
        }
      }
      else
      {
        if (v13)
        {
LABEL_28:
          *((_DWORD *)v2 + 22) = 0;
          *((_DWORD *)v2 + 18) |= 0x200u;
          v2[71] = 0;
          v2[72] = (uint64_t)(v2 + 71);
          CFStringRef v15 = (uint64_t **)qword_436E8;
          *uint64_t v2 = 0;
          v2[1] = (uint64_t)v15;
          __CFArray *v15 = v2;
          qword_436E8 = (uint64_t)v2;
          client_notify((CFStringRef)v2[3], (char *)v2[7], v14 | (v12 << 16), 0, 0, 8);
          goto LABEL_29;
        }
        if (!ppp_new_service((uint64_t)v2))
        {
LABEL_27:
          int v12 = *((unsigned __int16 *)v2 + 33);
          int v14 = *((unsigned __int16 *)v2 + 34);
          goto LABEL_28;
        }
      }
    }
    goto LABEL_32;
  }
  if (my_CFEqual((unint64_t)v6, (unint64_t)kSCValNetInterfaceTypeIPSec))
  {
    *((_WORD *)v2 + 32) = 1;
    int v11 = ipsec_subtype();
    goto LABEL_19;
  }
  if (my_CFEqual((unint64_t)v6, kSCValNetInterfaceTypeVPN))
  {
    int v12 = *((unsigned __int16 *)v2 + 33);
    goto LABEL_20;
  }
LABEL_32:
  my_CFRelease((const void **)v2 + 3);
  my_CFRelease((const void **)v2 + 4);
  my_CFRelease((const void **)v2 + 5);
  uint64_t v16 = (void *)v2[7];
  if (v16) {
    free(v16);
  }
  free(v2);
LABEL_35:
  my_CFRelease(&v17);
  my_CFRelease(&v18);
}

void sub_15678()
{
  CFArrayRef v0 = (const __CFArray *)copy_service_order();
  if (v0)
  {
    CFArrayRef v1 = v0;
    CFIndex Count = CFArrayGetCount(v0);
    if (Count >= 1)
    {
      CFIndex v3 = Count;
      for (CFIndex i = 0; i != v3; ++i)
      {
        CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v1, i);
        uint64_t v6 = &service_head;
        while (1)
        {
          uint64_t v6 = (uint64_t *)*v6;
          if (!v6) {
            break;
          }
          if (CFEqual((CFStringRef)v6[3], ValueAtIndex))
          {
            uint64_t v7 = *v6;
            if (*v6) {
              int v8 = (uint64_t *)*v6;
            }
            else {
              int v8 = &service_head;
            }
            v8[1] = v6[1];
            *(void *)v6[1] = v7;
            uint64_t v9 = qword_436E8;
            uint64_t *v6 = 0;
            v6[1] = v9;
            *(void *)qword_436E8 = v6;
            qword_436E8 = (uint64_t)v6;
            break;
          }
        }
      }
    }
    CFRelease(v1);
  }
}

uint64_t sub_1575C()
{
  uint64_t result = SCLog();
  CFArrayRef v1 = (void *)service_head;
  if (service_head)
  {
    do
    {
      uint64_t result = SCLog();
      CFArrayRef v1 = (void *)*v1;
    }
    while (v1);
  }
  return result;
}

void sub_15858(uint64_t a1)
{
  BOOL v17 = 0;
  CFMutableDictionaryRef v18 = 0;
  CFMutableArrayRef v16 = 0;
  if (gOndemand_key)
  {
    ondemand_unpublish_dns_triggering_dicts(a1);
    CFPropertyListRef v2 = SCDynamicStoreCopyValue((SCDynamicStoreRef)gDynamicStore, (CFStringRef)gOndemand_key);
    BOOL v17 = v2;
    if (v2)
    {
      CFDictionaryRef v3 = (const __CFDictionary *)v2;
      CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v2, @"Triggers");
      if (Value)
      {
        CFArrayRef v5 = Value;
        CFIndex Count = CFArrayGetCount(Value);
        if (Count >= 1)
        {
          CFIndex v7 = Count;
          CFIndex v8 = 0;
          while (1)
          {
            CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v5, v8);
            if (ValueAtIndex)
            {
              CFStringRef v10 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, @"ServiceID");
              if (v10)
              {
                if (CFEqual(v10, *(CFStringRef *)(a1 + 24))) {
                  break;
                }
              }
            }
            if (v7 == ++v8) {
              goto LABEL_17;
            }
          }
          if (v7 == 1)
          {
            SCDynamicStoreRemoveValue((SCDynamicStoreRef)gDynamicStore, (CFStringRef)gOndemand_key);
            CFArrayRef v11 = 0;
LABEL_16:
            sub_138B4(v11);
            goto LABEL_17;
          }
          CFMutableArrayRef MutableCopy = CFArrayCreateMutableCopy(0, 0, v5);
          CFMutableArrayRef v16 = MutableCopy;
          if (MutableCopy)
          {
            CFMutableArrayRef v13 = MutableCopy;
            CFArrayRemoveValueAtIndex(MutableCopy, v8);
            CFMutableDictionaryRef v14 = CFDictionaryCreateMutableCopy(0, 0, v3);
            CFMutableDictionaryRef v18 = v14;
            if (v14)
            {
              CFMutableDictionaryRef v15 = v14;
              CFDictionarySetValue(v14, @"Triggers", v13);
              SCDynamicStoreSetValue((SCDynamicStoreRef)gDynamicStore, (CFStringRef)gOndemand_key, v15);
              CFArrayRef v11 = v13;
              goto LABEL_16;
            }
          }
        }
      }
    }
  }
LABEL_17:
  my_CFRelease(&v17);
  my_CFRelease((const void **)&v18);
  my_CFRelease((const void **)&v16);
}

char *sub_159D4(int a1, char *__str)
{
  int v4 = snprintf(__str, 0x80uLL, ", triggered by (%d) ", a1);
  if (v4 < 1) {
    *__str = 0;
  }
  else {
    proc_name(a1, &__str[v4], 128 - v4);
  }
  return __str;
}

uint64_t client_init_all()
{
  client_head = 0;
  qword_43710 = (uint64_t)&client_head;
  return 0;
}

uint64_t client_new_socket(const void *a1, int a2, int a3, int a4)
{
  CFIndex v8 = malloc_type_malloc(0x98uLL, 0x10F0040A283F929uLL);
  uint64_t v9 = (uint64_t)v8;
  if (v8)
  {
    v8[18] = 0;
    *((_OWORD *)v8 + 7) = 0u;
    *((_OWORD *)v8 + 8) = 0u;
    *((_OWORD *)v8 + 5) = 0u;
    *((_OWORD *)v8 + 6) = 0u;
    *((_OWORD *)v8 + 3) = 0u;
    *((_OWORD *)v8 + 4) = 0u;
    *((_OWORD *)v8 + 1) = 0u;
    *((_OWORD *)v8 + 2) = 0u;
    *(_OWORD *)CFIndex v8 = 0u;
    CFRetain(a1);
    int v10 = *(_DWORD *)(v9 + 116) | (a2 != 0);
    *(_DWORD *)(v9 + 64) = a3;
    *(_DWORD *)(v9 + 68) = a4;
    *(_DWORD *)(v9 + 116) = v10 | 0x10;
    *(void *)(v9 + 136) = 0;
    *(void *)(v9 + 144) = v9 + 136;
    CFArrayRef v11 = (uint64_t *)qword_43710;
    *(void *)uint64_t v9 = 0;
    *(void *)(v9 + 8) = v11;
    *(void *)(v9 + 16) = a1;
    uint64_t *v11 = v9;
    qword_43710 = v9;
  }
  return v9;
}

uint64_t client_new_mach(const void *a1, const void *a2, const void *a3, int a4, int a5, int a6, int a7, int a8, int a9, char a10)
{
  CFMutableDictionaryRef v18 = malloc_type_malloc(0x98uLL, 0x10F0040A283F929uLL);
  uint64_t v19 = (uint64_t)v18;
  if (v18)
  {
    v18[18] = 0;
    *((_OWORD *)v18 + 7) = 0u;
    *((_OWORD *)v18 + 8) = 0u;
    *((_OWORD *)v18 + 5) = 0u;
    *((_OWORD *)v18 + 6) = 0u;
    *((_OWORD *)v18 + 3) = 0u;
    *((_OWORD *)v18 + 4) = 0u;
    *((_OWORD *)v18 + 1) = 0u;
    *((_OWORD *)v18 + 2) = 0u;
    *(_OWORD *)CFMutableDictionaryRef v18 = 0u;
    CFRetain(a1);
    CFRetain(a2);
    CFRetain(a3);
    *(void *)(v19 + 24) = a1;
    *(void *)(v19 + 40) = a2;
    *(void *)(v19 + 48) = a3;
    *(_DWORD *)(v19 + 64) = a4;
    *(_DWORD *)(v19 + 68) = a5;
    *(_DWORD *)(v19 + 72) = a6;
    *(_DWORD *)(v19 + 32) = a8;
    *(_DWORD *)(v19 + 116) &= ~0x10u;
    *(_DWORD *)(v19 + 56) = a7;
    *(_DWORD *)(v19 + 60) = a9;
    *(unsigned char *)(v19 + 132) = a10;
    *(void *)(v19 + 136) = 0;
    *(void *)(v19 + 144) = v19 + 136;
    int v20 = (uint64_t *)qword_43710;
    *(void *)uint64_t v19 = 0;
    *(void *)(v19 + 8) = v20;
    *int v20 = v19;
    qword_43710 = v19;
  }
  return v19;
}

void client_dispose(uint64_t a1)
{
  CFPropertyListRef v2 = &client_head;
  CFDictionaryRef v3 = *(uint64_t **)a1;
  if (*(void *)a1) {
    CFPropertyListRef v2 = *(uint64_t **)a1;
  }
  v2[1] = *(void *)(a1 + 8);
  **(void **)(a1 + 8) = v3;
  client_gone(a1);
  while (1)
  {
    int v4 = *(uint64_t **)(a1 + 136);
    if (!v4) {
      break;
    }
    uint64_t v5 = *v4;
    uint64_t v6 = (void *)v4[1];
    if (*v4)
    {
      *(void *)(v5 + 8) = v6;
      uint64_t v6 = (void *)v4[1];
    }
    else
    {
      *(void *)(a1 + 144) = v6;
    }
    void *v6 = v5;
    CFRelease((CFTypeRef)v4[2]);
    free(v4);
  }
  *(_DWORD *)(a1 + 128) = 0;
  CFIndex v7 = *(void **)(a1 + 120);
  if (v7)
  {
    free(v7);
    *(void *)(a1 + 120) = 0;
  }
  vm_address_t v8 = *(void *)(a1 + 80);
  if (v8)
  {
    my_Deallocate(v8, *(_DWORD *)(a1 + 92) + 1);
    *(void *)(a1 + 80) = 0;
  }
  *(void *)(a1 + 88) = 0;
  mach_port_name_t v9 = *(_DWORD *)(a1 + 56);
  if (v9)
  {
    mach_port_deallocate(mach_task_self_, v9);
    *(_DWORD *)(a1 + 56) = 0;
  }
  mach_port_name_t v10 = *(_DWORD *)(a1 + 32);
  if (v10)
  {
    mach_port_deallocate(mach_task_self_, v10);
    *(_DWORD *)(a1 + 32) = 0;
  }
  mach_port_name_t v11 = *(_DWORD *)(a1 + 60);
  if (v11)
  {
    mach_port_deallocate(mach_task_self_, v11);
    *(_DWORD *)(a1 + 60) = 0;
  }
  int v12 = *(__CFSocket **)(a1 + 16);
  if (v12)
  {
    CFSocketInvalidate(v12);
    my_CFRelease((const void **)(a1 + 16));
  }
  CFMutableArrayRef v13 = *(__CFMachPort **)(a1 + 24);
  if (v13)
  {
    CFMachPortInvalidate(v13);
    my_CFRelease((const void **)(a1 + 24));
  }
  if (*(void *)(a1 + 40))
  {
    CFAbsoluteTime Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveSource(Current, *(CFRunLoopSourceRef *)(a1 + 40), kCFRunLoopDefaultMode);
    my_CFRelease((const void **)(a1 + 40));
  }
  my_CFRelease((const void **)(a1 + 48));

  free((void *)a1);
}

_OWORD *client_newoptset(uint64_t a1, const void *a2)
{
  uint64_t result = malloc_type_malloc(0x20uLL, 0xE004003D73A93uLL);
  if (result)
  {
    uint64_t v5 = result;
    _OWORD *result = 0u;
    result[1] = 0u;
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v5[3] = Mutable;
    if (Mutable)
    {
      v5[2] = a2;
      CFRetain(a2);
      CFIndex v7 = *(void **)(a1 + 144);
      void *v5 = 0;
      v5[1] = v7;
      *CFIndex v7 = v5;
      *(void *)(a1 + 144) = v5;
      return (_OWORD *)v5[3];
    }
    else
    {
      free(v5);
      return 0;
    }
  }
  return result;
}

uint64_t *client_findoptset(uint64_t a1, CFStringRef theString2)
{
  CFDictionaryRef v3 = (uint64_t **)(a1 + 136);
  while (1)
  {
    CFDictionaryRef v3 = (uint64_t **)*v3;
    if (!v3) {
      break;
    }
    if (CFEqual((CFStringRef)v3[2], theString2)) {
      return v3[3];
    }
  }
  return 0;
}

uint64_t client_notify(CFStringRef theString2, char *__s2, unsigned int a3, unsigned int a4, unsigned int a5, int a6)
{
  for (uint64_t i = client_head; i; uint64_t i = *(void *)i)
  {
    int v13 = *(_DWORD *)(i + 116);
    if ((v13 & a6) != 0)
    {
      if ((v13 & 0x10) != 0)
      {
        CFMutableDictionaryRef v14 = *(const char **)(i + 120);
        if (!v14)
        {
          unsigned int v15 = *(_DWORD *)(i + 128);
          if (v15 != a3 && v15 <= 0xFFFEFFFF) {
            continue;
          }
          goto LABEL_15;
        }
        if (!*v14 || !strcmp(v14, __s2)) {
          goto LABEL_15;
        }
      }
      else if (CFEqual(*(CFStringRef *)(i + 48), theString2))
      {
        int v13 = *(_DWORD *)(i + 116);
LABEL_15:
        if ((v13 & 0x10) != 0)
        {
          if (*(void *)(i + 120)) {
            BOOL v17 = __s2;
          }
          else {
            BOOL v17 = 0;
          }
          socket_client_notify(*(__CFSocket **)(i + 16), v17, a3, a4, a5, v13);
        }
        else
        {
          mach_client_notify(*(_DWORD *)(i + 32));
        }
      }
    }
  }
  return 0;
}

uint64_t *client_findbysocketref(uint64_t a1)
{
  uint64_t result = &client_head;
  do
    uint64_t result = (uint64_t *)*result;
  while (result && result[2] != a1);
  return result;
}

void *client_findbymachport(int a1)
{
  CFArrayRef v1 = (void *)client_head;
  if (client_head)
  {
    do
    {
      CFDictionaryRef v3 = (__CFMachPort *)v1[3];
      if (v3 && CFMachPortGetPort(v3) == a1) {
        break;
      }
      CFArrayRef v1 = (void *)*v1;
    }
    while (v1);
  }
  return v1;
}

uint64_t ppp_socket_start_server()
{
  memset(&v11, 0, sizeof(v11));
  int v0 = socket(1, 1, 0);
  if (v0 == -1)
  {
    uint64_t v6 = 1;
    SCLog();
  }
  else
  {
    int v1 = v0;
    unlink("/var/run/pppconfd");
    sockaddr v12 = (sockaddr)0;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    memset(v17, 0, sizeof(v17));
    v12.int sa_family = 1;
    __strlcpy_chk();
    mode_t v2 = umask(0);
    int v3 = strlen(v12.sa_data);
    int v4 = bind(v1, &v12, v3 + 2);
    umask(v2);
    if (v4)
    {
      uint64_t v5 = 0;
    }
    else
    {
      uint64_t v5 = CFSocketCreateWithNative(0, v1, 1uLL, (CFSocketCallBack)sub_161E4, &v11);
      if (v5)
      {
        CFRunLoopSourceRef RunLoopSource = CFSocketCreateRunLoopSource(0, v5, 0);
        if (RunLoopSource)
        {
          mach_port_name_t v9 = RunLoopSource;
          CFAbsoluteTime Current = CFRunLoopGetCurrent();
          CFRunLoopAddSource(Current, v9, kCFRunLoopDefaultMode);
          CFRelease(v9);
          listen(v1, 128);
          CFRelease(v5);
          return 0;
        }
      }
    }
    uint64_t v6 = 1;
    SCLog();
    close(v1);
    if (v5)
    {
      CFSocketInvalidate(v5);
      CFRelease(v5);
    }
  }
  return v6;
}

uint64_t sub_161E4(__CFSocket *a1)
{
  long long v10 = 0u;
  memset(v11, 0, sizeof(v11));
  long long v8 = 0u;
  long long v9 = 0u;
  sockaddr v6 = (sockaddr)0;
  long long v7 = 0u;
  memset(v4, 0, sizeof(v4));
  socklen_t v5 = 106;
  CFSocketNativeHandle Native = CFSocketGetNative(a1);
  uint64_t result = accept(Native, &v6, &v5);
  if (result != -1)
  {
    int v3 = result;
    socklen_t v5 = 76;
    if (getsockopt(result, 0, 1, v4, &v5) == -1)
    {
      __error();
      return SCLog();
    }
    else
    {
      return ppp_socket_create_client(v3, 0, 0, 0);
    }
  }
  return result;
}

uint64_t ppp_socket_create_client(int a1, int a2, int a3, int a4)
{
  memset(&context, 0, sizeof(context));
  int v8 = fcntl(a1, 3);
  if (v8 == -1 || fcntl(a1, 4, v8 | 4u) == -1)
  {
    __error();
    SCLog();
  }
  long long v9 = CFSocketCreateWithNative(0, a1, 1uLL, (CFSocketCallBack)sub_1641C, &context);
  if (v9)
  {
    long long v10 = v9;
    CFRunLoopSourceRef RunLoopSource = CFSocketCreateRunLoopSource(0, v9, 0);
    if (RunLoopSource)
    {
      sockaddr v12 = RunLoopSource;
      CFAbsoluteTime Current = CFRunLoopGetCurrent();
      CFRunLoopAddSource(Current, v12, kCFRunLoopDefaultMode);
      CFRelease(v12);
      if (client_new_socket(v10, a2, a3, a4))
      {
        CFRelease(v10);
        return 0;
      }
    }
    CFSocketInvalidate(v10);
    CFRelease(v10);
  }
  else
  {
    close(a1);
  }
  return 0xFFFFFFFFLL;
}

void sub_1641C(__CFSocket *a1)
{
  CFSocketNativeHandle Native = CFSocketGetNative(a1);
  int v3 = client_findbysocketref((uint64_t)a1);
  if (!v3) {
    return;
  }
  uint64_t v4 = (uint64_t)v3;
  uint64_t v5 = *((unsigned int *)v3 + 22);
  if (v5 > 0x13)
  {
LABEL_16:
    long long v16 = (__int16 **)(v4 + 80);
    int v17 = readn(Native, (char *)(*(void *)(v4 + 80) + v5), *(_DWORD *)(v4 + 92) - (int)v5);
    if (v17 != -1)
    {
      int v18 = *(_DWORD *)(v4 + 92);
      int v19 = *(_DWORD *)(v4 + 88) + v17;
      *(_DWORD *)(v4 + 88) = v19;
      if (v19 != v18) {
        return;
      }
      int v20 = *v16;
      vm_address_t address = 0;
      uint64_t v21 = (unsigned __int16)v20[1];
      if (v21 <= 0x12)
      {
        int v22 = (void (*)(uint64_t, __int16 *, vm_address_t *))requests[v21];
        if (v22) {
          v22(v4, v20, &address);
        }
        goto LABEL_26;
      }
      if ((*(unsigned char *)(v4 + 116) & 1) == 0) {
        goto LABEL_26;
      }
      if (v21 == 268)
      {
        unint64_t v33 = ppp_find(v20);
        if (*v20 < 0) {
          uint64_t v34 = *((unsigned int *)v20 + 3);
        }
        else {
          uint64_t v34 = 0;
        }
        CFRange v41 = (char *)v20 + v34;
        unsigned int v42 = *((_DWORD *)v41 + 5);
        int v43 = *((_DWORD *)v41 + 6);
        *((_DWORD *)v20 + 4) = -1;
        if (v33) {
          ppp_updatephase(v33, v42, v43);
        }
        goto LABEL_26;
      }
      if (v21 == 267)
      {
        uint64_t v35 = ppp_find(v20);
        if (*v20 < 0) {
          uint64_t v36 = *((unsigned int *)v20 + 3);
        }
        else {
          uint64_t v36 = 0;
        }
        long long v44 = (char *)v20 + v36;
        int v45 = *((_DWORD *)v44 + 5);
        int v46 = *((_DWORD *)v44 + 6);
        *((_DWORD *)v20 + 4) = -1;
        if (v35) {
          ppp_updatestatus(v35, v45, v46);
        }
        goto LABEL_26;
      }
      if (v21 != 266
        || ((uint64_t v30 = ppp_find(v20), v31 = (void *)v30, *v20 < 0) ? (v32 = *((unsigned int *)v20 + 3)) : (v32 = 0),
            CFNumberRef v37 = (char *)v20 + v32,
            unsigned int v38 = *((_DWORD *)v37 + 5),
            unsigned int v39 = *((_DWORD *)v37 + 6),
            *((_DWORD *)v20 + 4) = -1,
            !v30))
      {
LABEL_26:
        signed int v23 = *v20;
        uint64_t v24 = *(void *)(v20 + 6);
        if ((*(unsigned char *)(v4 + 116) & 0x20) != 0)
        {
          *int v20 = bswap32(v23) >> 16;
          v20[1] = bswap32((unsigned __int16)v20[1]) >> 16;
          v25.i64[0] = *(void *)(v20 + 2);
          v25.i64[1] = v24;
          *(int8x16_t *)(v20 + 2) = vrev32q_s8(v25);
        }
        size_t v26 = HIDWORD(v24);
        if (HIDWORD(v24) != -1)
        {
          int v51 = v24;
          CFSocketNativeHandle v27 = CFSocketGetNative(*(CFSocketRef *)(v4 + 16));
          if (v23 < 0) {
            size_t v28 = (v51 + 20);
          }
          else {
            size_t v28 = 20;
          }
          writen(v27, (char *)v20, v28);
          if (v26)
          {
            CFSocketNativeHandle v29 = CFSocketGetNative(*(CFSocketRef *)(v4 + 16));
            writen(v29, (char *)address, v26);
            my_Deallocate(address, v26);
          }
        }
        my_Deallocate(*(void *)(v4 + 80), *(_DWORD *)(v4 + 92) + 1);
        *long long v16 = 0;
        *(void *)(v4 + 88) = 0;
        return;
      }
      if (v38 != 23)
      {
        if (v38 == 22)
        {
          uint64_t v47 = *(void *)(v30 + 584);
          if (v47) {
            ne_sm_bridge_request_install(v47);
          }
          goto LABEL_63;
        }
        if (v38 != 1)
        {
          unsigned int v39 = 0;
LABEL_63:
          CFStringRef v48 = (const __CFString *)v31[3];
          CFNumberRef v49 = (char *)v31[7];
          unsigned int v50 = makeref((uint64_t)v31);
          ppp_getstatus((uint64_t)v31);
          client_notify(v48, v49, v50, v38, v39, 4);
          goto LABEL_26;
        }
        unsigned int v39 = ppp_translate_error(*(unsigned __int16 *)(v30 + 66), v39, 0);
      }
      uint64_t v40 = v31[73];
      if (v40) {
        ne_sm_bridge_request_uninstall(v40);
      }
      goto LABEL_63;
    }
    goto LABEL_21;
  }
  sockaddr v6 = (__int16 *)(v3 + 12);
  int v7 = readn(Native, (char *)v3 + v5 + 96, 20 - (int)v5);
  if (v7 != -1)
  {
    LODWORD(v5) = *(_DWORD *)(v4 + 88) + v7;
    *(_DWORD *)(v4 + 88) = v5;
    if (v5 != 20) {
      goto LABEL_15;
    }
    int v8 = *(_DWORD *)(v4 + 116);
    if ((v8 & 1) != 0 || (unsigned int v9 = *(unsigned __int16 *)(v4 + 98), v9 < 0x13))
    {
      *(_DWORD *)(v4 + 116) = v8 & 0xFFFFFFDF;
      unsigned int v11 = *(_DWORD *)(v4 + 112);
    }
    else
    {
      *(_DWORD *)(v4 + 116) = v8 | 0x20;
      *(_WORD *)(v4 + 96) = bswap32(*(unsigned __int16 *)(v4 + 96)) >> 16;
      *(_WORD *)(v4 + 98) = __rev16(v9);
      int8x16_t v10 = vrev32q_s8(*(int8x16_t *)(v4 + 100));
      *(int8x16_t *)(v4 + 100) = v10;
      unsigned int v11 = v10.u32[3];
    }
    if (v11 <= 0x10000)
    {
      if (*v6 < 0)
      {
        unsigned int v12 = *(_DWORD *)(v4 + 108);
        if (v12 >= 0x41) {
          goto LABEL_21;
        }
      }
      else
      {
        unsigned int v12 = 0;
      }
      unsigned int v13 = v11 + v12;
      *(_DWORD *)(v4 + 92) = v13 + 20;
      vm_address_t v14 = my_Allocate(v13 + 21);
      *(void *)(v4 + 80) = v14;
      if (v14)
      {
        long long v15 = *(_OWORD *)v6;
        *(_DWORD *)(v14 + 16) = *(_DWORD *)(v4 + 112);
        *(_OWORD *)vm_address_t v14 = v15;
        *(unsigned char *)(*(void *)(v4 + 80) + *(unsigned int *)(v4 + 92)) = 0;
        LODWORD(v5) = *(_DWORD *)(v4 + 88);
LABEL_15:
        if (v5 < 0x14) {
          return;
        }
        goto LABEL_16;
      }
    }
LABEL_21:
    SCLog();
  }

  client_dispose(v4);
}

uint64_t readn(int a1, char *a2, int a3)
{
  LODWORD(v4) = a3;
  if (a3 < 1) {
    return (a3 - v4);
  }
  int64_t v4 = a3;
  int v7 = 10;
  while (1)
  {
    ssize_t v8 = read(a1, a2, v4);
    if ((v8 & 0x8000000000000000) == 0) {
      break;
    }
    __error();
    SCLog();
    if (*__error() == 35)
    {
      if (!v7) {
        return (a3 - v4);
      }
      --v7;
      if (!usleep(0x9C40u)) {
        continue;
      }
    }
    if (*__error() != 4) {
      return 0xFFFFFFFFLL;
    }
    ssize_t v8 = 0;
LABEL_10:
    a2 += v8;
    BOOL v9 = v4 <= v8;
    v4 -= v8;
    if (v9) {
      return (a3 - v4);
    }
  }
  if (v8) {
    goto LABEL_10;
  }
  return 0xFFFFFFFFLL;
}

size_t writen(int __fd, char *__buf, size_t __nbyte)
{
  size_t v3 = __nbyte;
  if ((int)__nbyte >= 1)
  {
    int64_t v6 = __nbyte;
    int v7 = 10;
    while (1)
    {
      ssize_t v8 = write(__fd, __buf, v6);
      if (v8 > 0) {
        goto LABEL_9;
      }
      __error();
      SCLog();
      if (*__error() == 35)
      {
        if (!v7) {
          return (v3 - v6);
        }
        --v7;
        if (!usleep(0x9C40u)) {
          continue;
        }
      }
      if (*__error() != 4) {
        return 0xFFFFFFFFLL;
      }
      ssize_t v8 = 0;
LABEL_9:
      __buf += v8;
      BOOL v9 = v6 <= v8;
      v6 -= v8;
      if (v9) {
        return v3;
      }
    }
  }
  return v3;
}

_DWORD *sub_16A30(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = (_DWORD *)my_Allocate(4);
  *a3 = result;
  if (result)
  {
    *(_DWORD *)(a2 + 4) = 0;
    *(_DWORD *)(a2 + 16) = 4;
    _DWORD *result = 1;
    if ((*(_DWORD *)(a1 + 116) & 0x20) != 0) {
      int v7 = 0x1000000;
    }
    else {
      int v7 = 1;
    }
    _DWORD *result = v7;
  }
  else
  {
    *(_DWORD *)(a2 + 4) = 12;
    *(_DWORD *)(a2 + 16) = 0;
  }
  return result;
}

uint64_t sub_16AA8(uint64_t a1, uint64_t a2, int8x16_t **a3)
{
  uint64_t result = ppp_find((__int16 *)a2);
  if (result)
  {
    unsigned __int16 v10 = 0;
    uint64_t result = ppp_getstatus1(result, (vm_address_t *)a3, &v10);
    if (result)
    {
      int v7 = 0;
      *(_DWORD *)(a2 + 4) = result;
    }
    else
    {
      if ((*(unsigned char *)(a1 + 116) & 0x20) != 0)
      {
        vm_address_t v8 = (vm_address_t)*a3;
        int8x16_t v9 = vrev32q_s8((*a3)[1]);
        *(int8x16_t *)vm_address_t v8 = vrev32q_s8(**a3);
        *(int8x16_t *)(v8 + 16) = v9;
        *(_DWORD *)(v8 + 32) = bswap32(*(_DWORD *)(v8 + 32));
      }
      *(_DWORD *)(a2 + 4) = 0;
      int v7 = v10;
    }
  }
  else
  {
    int v7 = 0;
    *(_DWORD *)(a2 + 4) = 19;
  }
  *(_DWORD *)(a2 + 16) = v7;
  return result;
}

void sub_16B50(int *a1, __int16 *a2)
{
  if (*a2 < 0) {
    uint64_t v4 = *((unsigned int *)a2 + 3);
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = ppp_find(a2);
  if (!v5)
  {
    int v11 = 19;
LABEL_20:
    *((_DWORD *)a2 + 1) = v11;
LABEL_21:
    *((_DWORD *)a2 + 4) = 0;
    return;
  }
  unint64_t v6 = v5;
  CFIndex v7 = *((unsigned int *)a2 + 4);
  if (!v7)
  {
    int8x16_t v9 = client_findoptset((uint64_t)a1, *(CFStringRef *)(v5 + 24));
LABEL_13:
    unsigned int v12 = (unsigned __int16)*a2;
    if (v12) {
      uint64_t v13 = (uint64_t)a1;
    }
    else {
      uint64_t v13 = 0;
    }
    *((_DWORD *)a2 + 1) = scnc_start(v6, (const __CFDictionary *)v9, v13, (v12 >> 1) & 1, a1[16], a1[17], a1[18], 0, 0);
    if (v9 && *((_DWORD *)a2 + 4)) {
      CFRelease(v9);
    }
    goto LABEL_21;
  }
  CFDataRef v8 = Unserialize((UInt8 *)a2 + v4 + 20, v7);
  if (!v8)
  {
    int v11 = 12;
    goto LABEL_20;
  }
  int8x16_t v9 = (uint64_t *)v8;
  CFTypeID v10 = CFGetTypeID(v8);
  if (v10 == CFDictionaryGetTypeID()) {
    goto LABEL_13;
  }
  *((_DWORD *)a2 + 1) = 12;
  *((_DWORD *)a2 + 4) = 0;

  CFRelease(v9);
}

uint64_t sub_16C84(uint64_t a1, uint64_t a2)
{
  uint64_t result = ppp_find((__int16 *)a2);
  if (result)
  {
    if ((*(_WORD *)a2 & 1) == 0 || a1 == 0) {
      int v6 = 6;
    }
    else {
      int v6 = 5;
    }
    uint64_t result = scnc_stop(result, a1, 1, v6);
    int v7 = 0;
  }
  else
  {
    int v7 = 19;
  }
  *(_DWORD *)(a2 + 4) = v7;
  *(_DWORD *)(a2 + 16) = 0;
  return result;
}

vm_address_t sub_16CE8(uint64_t a1, __int16 *a2, uint64_t a3)
{
  if (*a2 < 0) {
    uint64_t v6 = *((unsigned int *)a2 + 3);
  }
  else {
    uint64_t v6 = 0;
  }
  vm_address_t result = ppp_find(a2);
  unsigned int __len = 0;
  if (!result)
  {
    *((_DWORD *)a2 + 4) = 0;
    int v11 = 19;
LABEL_19:
    *((_DWORD *)a2 + 1) = v11;
    return result;
  }
  uint64_t v8 = result;
  int8x16_t v9 = (unsigned int *)((char *)a2 + v6 + 20);
  if ((*(unsigned char *)(a1 + 116) & 0x20) != 0) {
    unsigned int *v9 = bswap32(*v9);
  }
  if (*(_DWORD *)(result + 628)) {
    CFTypeID v10 = *(uint64_t **)(result + 128);
  }
  else {
    CFTypeID v10 = client_findoptset(a1, *(CFStringRef *)(result + 24));
  }
  vm_address_t result = ppp_getoptval(v8, (CFDictionaryRef)v10, 0, *v9, (char *)__len_4, 0x101u, &__len);
  if (!result)
  {
    *((_DWORD *)a2 + 4) = 0;
    int v11 = 102;
    goto LABEL_19;
  }
  vm_address_t result = my_Allocate(__len + 4);
  *(void *)a3 = result;
  if (result)
  {
    if ((*(unsigned char *)(a1 + 116) & 0x20) != 0 && *v9 <= 0x20 && ((1 << *v9) & 0x191FDFE54) != 0) {
      __len_4[0] = bswap32(__len_4[0]);
    }
    *(_DWORD *)vm_address_t result = *v9;
    vm_address_t result = (vm_address_t)memmove((void *)(*(void *)a3 + 4), __len_4, __len);
    *((_DWORD *)a2 + 1) = 0;
    *((_DWORD *)a2 + 4) = __len + 4;
  }
  else
  {
    *((_DWORD *)a2 + 1) = 12;
    *((_DWORD *)a2 + 4) = 0;
  }
  return result;
}

void sub_16E80(uint64_t a1, __int16 *a2)
{
  if (*a2 < 0) {
    unsigned int v4 = *((_DWORD *)a2 + 3);
  }
  else {
    unsigned int v4 = 0;
  }
  uint64_t v5 = (char *)a2 + v4;
  unsigned int v8 = *((_DWORD *)v5 + 6);
  uint64_t v6 = v5 + 24;
  unsigned int v7 = v8;
  int v9 = *((_DWORD *)a2 + 4);
  uint64_t v10 = ppp_find(a2);
  if (!v10)
  {
    LODWORD(v14) = 19;
    goto LABEL_69;
  }
  uint64_t v11 = v10;
  unsigned int v12 = (unsigned int *)(v6 - 4);
  if ((*(unsigned char *)(a1 + 116) & 0x20) != 0)
  {
    unsigned int *v12 = bswap32(*v12);
    unsigned int v7 = bswap32(v7);
  }
  CFDictionaryRef v13 = (const __CFDictionary *)client_findoptset(a1, *(CFStringRef *)(v10 + 24));
  if (!v13)
  {
    CFDictionaryRef v13 = (const __CFDictionary *)client_newoptset(a1, *(const void **)(v11 + 24));
    if (!v13)
    {
      LODWORD(v14) = 12;
      goto LABEL_69;
    }
  }
  LODWORD(v14) = 102;
  switch(*v12)
  {
    case 1u:
      CFStringRef v15 = kSCEntNetInterface;
      long long v16 = (const void **)&kSCPropNetInterfaceDeviceName;
      goto LABEL_67;
    case 2u:
      uint64_t v17 = 2400;
      uint64_t v18 = 9600;
      uint64_t v19 = 19200;
      uint64_t v20 = 38400;
      uint64_t v21 = 115200;
      if (v7 < 0xE101) {
        uint64_t v21 = 57600;
      }
      if (v7 >= 0x9601) {
        uint64_t v20 = v21;
      }
      if (v7 >= 0x4B01) {
        uint64_t v19 = v20;
      }
      if (v7 >= 0x2581) {
        uint64_t v18 = v19;
      }
      if (v7 >= 0x961) {
        uint64_t v17 = v18;
      }
      if (v7 >= 0x4B1) {
        unint64_t v22 = v17;
      }
      else {
        unint64_t v22 = 1200;
      }
      CFStringRef v23 = kSCEntNetModem;
      CFStringRef v24 = kSCPropNetModemSpeed;
      CFDictionaryRef v25 = v13;
      unint64_t v26 = 0xFFFFFFFFLL;
      uint64_t v27 = 0;
      goto LABEL_56;
    case 3u:
      CFStringRef v15 = kSCEntNetModem;
      long long v16 = (const void **)&kSCPropNetModemConnectionScript;
      goto LABEL_67;
    case 4u:
      CFStringRef v28 = kSCEntNetPPP;
      unint64_t v29 = v7;
      LODWORD(v14) = 1;
      if (sub_17FD8(v13, kSCEntNetPPP, kSCPropNetPPPDisconnectOnIdleTimer, v7, 0xFFFFFFFFuLL, 1)) {
        goto LABEL_69;
      }
      uint64_t v30 = &kSCPropNetPPPDisconnectOnIdle;
      goto LABEL_59;
    case 5u:
      CFStringRef v15 = kSCEntNetPPP;
      long long v16 = (const void **)&kSCPropNetPPPCommRemoteAddress;
      goto LABEL_67;
    case 6u:
      CFStringRef v31 = 0;
      CFStringRef v32 = @"None";
      switch(v7)
      {
        case 0u:
          goto LABEL_87;
        case 1u:
          LODWORD(v14) = 0;
          CFStringRef v31 = kSCValNetPPPAuthProtocolPAP;
          goto LABEL_85;
        case 2u:
          LODWORD(v14) = 0;
          CFStringRef v48 = 0;
          CFStringRef v31 = kSCValNetPPPAuthProtocolPAP;
          break;
        case 3u:
          LODWORD(v14) = 0;
          CFStringRef v31 = 0;
LABEL_85:
          CFStringRef v48 = kSCValNetPPPAuthProtocolCHAP;
          break;
        default:
          LODWORD(v14) = 22;
          CFStringRef v48 = 0;
          break;
      }
      CFStringRef v32 = v31;
      CFStringRef v31 = v48;
      if (!((unint64_t)v32 | (unint64_t)v48)) {
        goto LABEL_69;
      }
LABEL_87:
      unsigned int v44 = sub_180E0(v13, kSCEntNetPPP, kSCPropNetPPPAuthProtocol, v32, v31);
      goto LABEL_68;
    case 7u:
      CFStringRef v15 = kSCEntNetPPP;
      long long v16 = (const void **)&kSCPropNetPPPAuthName;
      goto LABEL_67;
    case 8u:
      CFStringRef v15 = kSCEntNetPPP;
      long long v16 = (const void **)&kSCPropNetPPPAuthPassword;
      goto LABEL_67;
    case 9u:
      LODWORD(v14) = 1;
      if (sub_17FD8(v13, kSCEntNetPPP, kSCPropNetPPPLCPCompressionPField, v7 & 2, 1uLL, 1)) {
        goto LABEL_69;
      }
      CFStringRef v33 = kSCPropNetPPPLCPCompressionACField;
      unint64_t v34 = v7 & 1;
      CFDictionaryRef v35 = v13;
      CFStringRef v36 = kSCEntNetPPP;
      goto LABEL_60;
    case 0xAu:
      CFStringRef v23 = kSCEntNetPPP;
      CFNumberRef v37 = &kSCPropNetPPPLCPMRU;
      goto LABEL_53;
    case 0xBu:
      CFStringRef v23 = kSCEntNetPPP;
      CFNumberRef v37 = &kSCPropNetPPPLCPMTU;
      goto LABEL_53;
    case 0xCu:
      CFStringRef v23 = kSCEntNetPPP;
      CFNumberRef v37 = &kSCPropNetPPPLCPReceiveACCM;
      goto LABEL_53;
    case 0xDu:
      CFStringRef v23 = kSCEntNetPPP;
      CFNumberRef v37 = &kSCPropNetPPPLCPTransmitACCM;
      goto LABEL_53;
    case 0xEu:
      CFStringRef v23 = kSCEntNetPPP;
      CFStringRef v24 = kSCPropNetPPPIPCPCompressionVJ;
      unint64_t v22 = v7;
      CFDictionaryRef v25 = v13;
      unint64_t v26 = 1;
      goto LABEL_55;
    case 0xFu:
      CFStringRef v38 = CFStringCreateWithFormat(0, 0, @"%d.%d.%d.%d", HIBYTE(v7), BYTE2(v7), BYTE1(v7), v7);
      if (!v38) {
        goto LABEL_77;
      }
      CFStringRef v39 = v38;
      CFStringRef v40 = kSCEntNetIPv4;
      CFRange v41 = (const void **)&kSCPropNetIPv4Addresses;
      goto LABEL_46;
    case 0x10u:
      CFStringRef v42 = CFStringCreateWithFormat(0, 0, @"%d.%d.%d.%d", HIBYTE(v7), BYTE2(v7), BYTE1(v7), v7);
      if (!v42) {
        goto LABEL_77;
      }
      CFStringRef v39 = v42;
      CFStringRef v40 = kSCEntNetIPv4;
      CFRange v41 = (const void **)&kSCPropNetIPv4DestAddresses;
LABEL_46:
      LODWORD(v14) = sub_180E0(v13, v40, *v41, v39, 0);
      CFRelease(v39);
      goto LABEL_69;
    case 0x13u:
      CFStringRef v28 = kSCEntNetPPP;
      unint64_t v29 = v7;
      LODWORD(v14) = 1;
      if (sub_17FD8(v13, kSCEntNetPPP, kSCPropNetPPPIdleReminderTimer, v7, 0xFFFFFFFFuLL, 1)) {
        goto LABEL_69;
      }
      uint64_t v30 = &kSCPropNetPPPIdleReminder;
      goto LABEL_59;
    case 0x14u:
      CFStringRef v23 = kSCEntNetPPP;
      unint64_t v22 = v7;
      CFStringRef v24 = @"AlertEnable";
      goto LABEL_54;
    case 0x15u:
      LODWORD(v14) = 1;
      if (sub_17FD8(v13, kSCEntNetPPP, kSCPropNetPPPLCPEchoInterval, *(unsigned __int16 *)v6, 0xFFFFFFFFuLL, 1))goto LABEL_69; {
      CFStringRef v33 = kSCPropNetPPPLCPEchoFailure;
      }
      unint64_t v34 = *((unsigned __int16 *)v6 + 1);
      CFDictionaryRef v35 = v13;
      CFStringRef v36 = kSCEntNetPPP;
      unint64_t v43 = 0xFFFFFFFFLL;
      goto LABEL_61;
    case 0x16u:
      CFStringRef v23 = kSCEntNetPPP;
      CFNumberRef v37 = &kSCPropNetPPPCommConnectDelay;
LABEL_53:
      CFStringRef v24 = *v37;
      unint64_t v22 = v7;
LABEL_54:
      CFDictionaryRef v25 = v13;
      unint64_t v26 = 0xFFFFFFFFLL;
LABEL_55:
      uint64_t v27 = 1;
LABEL_56:
      unsigned int v44 = sub_17FD8(v25, v23, v24, v22, v26, v27);
      goto LABEL_68;
    case 0x17u:
      CFStringRef v28 = kSCEntNetPPP;
      unint64_t v29 = v7;
      LODWORD(v14) = 1;
      if (sub_17FD8(v13, kSCEntNetPPP, kSCPropNetPPPSessionTimer, v7, 0xFFFFFFFFuLL, 1)) {
        goto LABEL_69;
      }
      uint64_t v30 = &kSCPropNetPPPUseSessionTimer;
LABEL_59:
      CFStringRef v33 = *v30;
      CFDictionaryRef v35 = v13;
      CFStringRef v36 = v28;
      unint64_t v34 = v29;
      goto LABEL_60;
    case 0x18u:
      switch(v7)
      {
        case 2u:
          LODWORD(v14) = 1;
          if (sub_17FD8(v13, kSCEntNetPPP, kSCPropNetPPPCommUseTerminalScript, 0, 1uLL, 1)) {
            goto LABEL_69;
          }
          CFStringRef v33 = kSCPropNetPPPCommDisplayTerminalWindow;
          CFDictionaryRef v35 = v13;
          CFStringRef v36 = kSCEntNetPPP;
          unint64_t v34 = 1;
LABEL_60:
          unint64_t v43 = 1;
LABEL_61:
          LODWORD(v14) = sub_17FD8(v35, v36, v33, v34, v43, 1) != 0;
          goto LABEL_69;
        case 1u:
          LODWORD(v14) = 1;
          if (sub_17FD8(v13, kSCEntNetPPP, kSCPropNetPPPCommUseTerminalScript, 1uLL, 1uLL, 1)) {
            goto LABEL_69;
          }
          CFStringRef v33 = kSCPropNetPPPCommDisplayTerminalWindow;
          CFDictionaryRef v35 = v13;
          CFStringRef v36 = kSCEntNetPPP;
          unint64_t v34 = 0;
          goto LABEL_60;
        case 0u:
          sub_18070(v13, kSCEntNetPPP, kSCPropNetPPPCommDisplayTerminalWindow);
          sub_18070(v13, kSCEntNetPPP, kSCPropNetPPPCommUseTerminalScript);
          break;
      }
LABEL_77:
      LODWORD(v14) = 0;
LABEL_69:
      *((_DWORD *)a2 + 1) = v14;
      *((_DWORD *)a2 + 4) = 0;
      return;
    case 0x19u:
      CFStringRef v15 = kSCEntNetPPP;
      long long v16 = (const void **)&kSCPropNetPPPCommTerminalScript;
LABEL_67:
      unsigned int v44 = sub_17F34(v13, v15, *v16, v6, v9 - 4, 0);
LABEL_68:
      LODWORD(v14) = v44;
      goto LABEL_69;
    case 0x1Fu:
      int v45 = &kSCValNetModemDialModeIgnoreDialTone;
      int v46 = &kSCValNetModemDialModeManual;
      if (v7 != 2) {
        int v46 = &kSCValNetModemDialModeWaitForDialTone;
      }
      if (v7 != 1) {
        int v45 = v46;
      }
      CFStringRef v14 = *v45;
      if (!*v45) {
        goto LABEL_69;
      }
      uint64_t v47 = sub_18184(v13, kSCEntNetModem, kSCPropNetModemDialMode);
      if (v47) {
        CFDictionaryAddValue(v47, kSCPropNetModemDialMode, v14);
      }
      goto LABEL_77;
    default:
      goto LABEL_69;
  }
}

void sub_17694(uint64_t a1, __int16 *a2)
{
  if (*((_DWORD *)a2 + 4) == 4)
  {
    if (*a2 < 0) {
      uint64_t v4 = *((unsigned int *)a2 + 3);
    }
    else {
      uint64_t v4 = 0;
    }
    unsigned int v6 = *(_DWORD *)((char *)a2 + v4 + 20);
    int v5 = *(_DWORD *)(a1 + 116);
    unsigned int v7 = bswap32(v6);
    if ((v5 & 0x20) != 0) {
      unsigned int v6 = v7;
    }
    if (v6 - 4 <= 0xFFFFFFFC)
    {
      int v8 = 22;
LABEL_17:
      *((_DWORD *)a2 + 1) = v8;
      goto LABEL_18;
    }
  }
  else
  {
    int v5 = *(_DWORD *)(a1 + 116);
    LOBYTE(v6) = 1;
  }
  *((_DWORD *)a2 + 1) = 0;
  *(_DWORD *)(a1 + 116) = v5 & 0xFFFFFFF3 | (4 * (v6 & 3));
  *(_DWORD *)(a1 + 128) = 0;
  int v9 = *(void **)(a1 + 120);
  if (v9)
  {
    free(v9);
    *(void *)(a1 + 120) = 0;
  }
  int v10 = *((_DWORD *)a2 + 3);
  if (*a2 < 0)
  {
    uint64_t v11 = (char *)malloc_type_malloc((v10 + 1), 0xC252AEBFuLL);
    *(void *)(a1 + 120) = v11;
    if (!v11)
    {
      int v8 = 12;
      goto LABEL_17;
    }
    strncpy(v11, (const char *)a2 + 20, *((unsigned int *)a2 + 3));
    *(unsigned char *)(*(void *)(a1 + 120) + *((unsigned int *)a2 + 3)) = 0;
  }
  else
  {
    *(_DWORD *)(a1 + 128) = v10;
  }
LABEL_18:
  *((_DWORD *)a2 + 4) = 0;
}

void sub_17784(uint64_t a1, _DWORD *a2)
{
  if (a2[4] != 4)
  {
    int v5 = *(_DWORD *)(a1 + 116);
    LOBYTE(v6) = 1;
LABEL_5:
    v5 &= ~4u;
    *(_DWORD *)(a1 + 116) = v5;
    goto LABEL_6;
  }
  if (*(__int16 *)a2 < 0) {
    uint64_t v4 = a2[3];
  }
  else {
    uint64_t v4 = 0;
  }
  unsigned int v6 = *(_DWORD *)((char *)a2 + v4 + 20);
  int v5 = *(_DWORD *)(a1 + 116);
  unsigned int v10 = bswap32(v6);
  if ((v5 & 0x20) != 0) {
    unsigned int v6 = v10;
  }
  if (v6 - 4 < 0xFFFFFFFD)
  {
    int v9 = 22;
    goto LABEL_18;
  }
  if (v6) {
    goto LABEL_5;
  }
LABEL_6:
  if ((v6 & 2) != 0)
  {
    unsigned int v7 = v5 & 0xFFFFFFF7;
    *(_DWORD *)(a1 + 116) = v7;
    if ((v7 & 8) != 0)
    {
LABEL_12:
      int v9 = 0;
      goto LABEL_18;
    }
  }
  else if ((v5 & 8) != 0)
  {
    goto LABEL_12;
  }
  *(_DWORD *)(a1 + 128) = 0;
  int v8 = *(void **)(a1 + 120);
  if (!v8) {
    goto LABEL_12;
  }
  free(v8);
  int v9 = 0;
  *(void *)(a1 + 120) = 0;
LABEL_18:
  a2[1] = v9;
  a2[4] = 0;
}

_DWORD *sub_1784C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = service_head;
  if (service_head)
  {
    unsigned int v7 = 0;
    int v8 = *(unsigned __int16 *)(a2 + 14);
    do
    {
      if (v8 == 0xFFFF || v8 == *(unsigned __int16 *)(v6 + 66)) {
        ++v7;
      }
      uint64_t v6 = *(void *)v6;
    }
    while (v6);
  }
  else
  {
    unsigned int v7 = 0;
  }
  vm_address_t result = (_DWORD *)my_Allocate(4);
  *a3 = result;
  if (result)
  {
    *(_DWORD *)(a2 + 4) = 0;
    *(_DWORD *)(a2 + 16) = 4;
    _DWORD *result = v7;
    if ((*(unsigned char *)(a1 + 116) & 0x20) != 0) {
      _DWORD *result = bswap32(v7);
    }
  }
  else
  {
    *(_DWORD *)(a2 + 4) = 12;
    *(_DWORD *)(a2 + 16) = 0;
  }
  return result;
}

vm_address_t sub_17908(vm_address_t result, uint64_t a2, vm_address_t *a3)
{
  unsigned int v4 = *(_DWORD *)(a2 + 20);
  unsigned int v5 = bswap32(v4);
  if ((*(unsigned char *)(result + 116) & 0x20) != 0) {
    unsigned int v4 = v5;
  }
  uint64_t v6 = service_head;
  if (!service_head)
  {
LABEL_10:
    int v11 = 0;
    int v12 = 19;
    goto LABEL_11;
  }
  vm_address_t v8 = result;
  int v9 = 0;
  int v10 = *(unsigned __int16 *)(a2 + 14);
  while (1)
  {
    if (v10 != 0xFFFF && v10 != *(unsigned __int16 *)(v6 + 66)) {
      goto LABEL_9;
    }
    if (v9 == v4) {
      break;
    }
    ++v9;
LABEL_9:
    uint64_t v6 = *(void *)v6;
    if (!v6) {
      goto LABEL_10;
    }
  }
  vm_address_t result = my_Allocate(4);
  *a3 = result;
  if (result)
  {
    vm_address_t result = makeref(v6);
    CFDictionaryRef v13 = (_DWORD *)*a3;
    *(_DWORD *)*a3 = result;
    int v12 = 0;
    if ((*(unsigned char *)(v8 + 116) & 0x20) != 0) {
      _DWORD *v13 = bswap32(result);
    }
    int v11 = 4;
  }
  else
  {
    int v11 = 0;
    int v12 = 12;
  }
LABEL_11:
  *(_DWORD *)(a2 + 4) = v12;
  *(_DWORD *)(a2 + 16) = v11;
  return result;
}

void sub_179F0(uint64_t a1, uint64_t a2, vm_address_t *a3)
{
  uint64_t v6 = (const char *)(a2 + 20);
  v6[*(unsigned int *)(a2 + 16)] = 0;
  CFStringRef v7 = CFStringCreateWithCString(0, v6, 0x8000100u);
  if (v7)
  {
    CFStringRef v8 = v7;
    int v9 = findbyserviceID(v7);
    if (v9)
    {
      uint64_t v10 = (uint64_t)v9;
      vm_address_t v11 = my_Allocate(4);
      *a3 = v11;
      if (v11)
      {
        unsigned int v12 = makeref(v10);
        CFDictionaryRef v13 = (_DWORD *)*a3;
        *(_DWORD *)*a3 = v12;
        if ((*(unsigned char *)(a1 + 116) & 0x20) != 0)
        {
          int v14 = 0;
          _DWORD *v13 = bswap32(v12);
        }
        else
        {
          int v14 = 0;
        }
        int v15 = 4;
      }
      else
      {
        int v15 = 0;
        int v14 = 12;
      }
    }
    else
    {
      int v15 = 0;
      int v14 = 19;
    }
    CFRelease(v8);
  }
  else
  {
    int v15 = 0;
    int v14 = 12;
  }
  *(_DWORD *)(a2 + 4) = v14;
  *(_DWORD *)(a2 + 16) = v15;
}

vm_address_t sub_17ACC(vm_address_t result, __int16 *a2, vm_address_t *a3)
{
  vm_address_t v5 = result;
  uint64_t v6 = (const char *)(a2 + 10);
  CFStringRef v7 = &service_head;
  do
  {
    CFStringRef v7 = (uint64_t *)*v7;
    if (!v7)
    {
      unsigned int v10 = 0;
      int v9 = 19;
      goto LABEL_14;
    }
    vm_address_t result = strncmp((const char *)v7 + 104, v6, 0x10uLL);
  }
  while (result);
  if (*a2 < 0)
  {
    int v11 = strlen((const char *)v7[7]);
    vm_address_t result = my_Allocate(v11);
    *a3 = result;
    if (result)
    {
      unsigned int v12 = (void *)result;
      CFDictionaryRef v13 = (const char *)v7[7];
      unsigned int v10 = strlen(v13);
      vm_address_t result = (vm_address_t)memmove(v12, v13, v10);
      int v9 = 0;
      goto LABEL_14;
    }
LABEL_11:
    unsigned int v10 = 0;
    int v9 = 12;
    goto LABEL_14;
  }
  vm_address_t result = my_Allocate(4);
  *a3 = result;
  if (!result) {
    goto LABEL_11;
  }
  vm_address_t result = makeref((uint64_t)v7);
  CFStringRef v8 = (_DWORD *)*a3;
  *(_DWORD *)*a3 = result;
  int v9 = 0;
  if ((*(unsigned char *)(v5 + 116) & 0x20) != 0) {
    *CFStringRef v8 = bswap32(result);
  }
  unsigned int v10 = 4;
LABEL_14:
  *((_DWORD *)a2 + 1) = v9;
  *((_DWORD *)a2 + 4) = v10;
  return result;
}

uint64_t sub_17BD4(uint64_t a1, uint64_t a2)
{
  uint64_t result = ppp_find((__int16 *)a2);
  if (result)
  {
    uint64_t result = ppp_suspend(result);
    int v4 = 0;
  }
  else
  {
    int v4 = 19;
  }
  *(_DWORD *)(a2 + 4) = v4;
  *(_DWORD *)(a2 + 16) = 0;
  return result;
}

uint64_t sub_17C18(uint64_t a1, uint64_t a2)
{
  uint64_t result = ppp_find((__int16 *)a2);
  if (result)
  {
    uint64_t result = ppp_resume(result);
    int v4 = 0;
  }
  else
  {
    int v4 = 19;
  }
  *(_DWORD *)(a2 + 4) = v4;
  *(_DWORD *)(a2 + 16) = 0;
  return result;
}

void sub_17C5C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = ppp_find((__int16 *)a2);
  LODWORD(__len) = 0;
  CFTypeRef cf = 0;
  if (v5)
  {
    int v6 = ppp_copyextendedstatus(v5, &cf);
    CFDataRef v7 = 0;
    int v8 = 0;
    CFTypeRef v9 = cf;
    if (!v6 && cf)
    {
      __src = 0;
      CFDataRef v7 = Serialize(cf, (const UInt8 **)&__src, &__len);
      if (v7 && (unsigned int v10 = (void *)my_Allocate(__len), (*a3 = v10) != 0))
      {
        memmove(v10, __src, __len);
        int v6 = 0;
      }
      else
      {
        int v6 = 12;
      }
      int v8 = (unsigned __int16)__len;
      CFTypeRef v9 = cf;
    }
    *(_DWORD *)(a2 + 4) = v6;
    if (v6) {
      int v11 = 0;
    }
    else {
      int v11 = v8;
    }
    *(_DWORD *)(a2 + 16) = v11;
    if (v9) {
      CFRelease(v9);
    }
    if (v7) {
      CFRelease(v7);
    }
  }
  else
  {
    *(_DWORD *)(a2 + 4) = 19;
    *(_DWORD *)(a2 + 16) = 0;
  }
}

void sub_17D40(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = ppp_find((__int16 *)a2);
  LODWORD(__len) = 0;
  CFTypeRef cf = 0;
  if (v5)
  {
    int v6 = ppp_getconnectdata(v5, &cf, 0);
    CFDataRef v7 = 0;
    int v8 = 0;
    CFTypeRef v9 = cf;
    if (!v6 && cf)
    {
      __src = 0;
      CFDataRef v7 = Serialize(cf, (const UInt8 **)&__src, &__len);
      if (v7 && (unsigned int v10 = (void *)my_Allocate(__len), (*a3 = v10) != 0))
      {
        memmove(v10, __src, __len);
        int v6 = 0;
      }
      else
      {
        int v6 = 12;
      }
      int v8 = (unsigned __int16)__len;
      CFTypeRef v9 = cf;
    }
    *(_DWORD *)(a2 + 4) = v6;
    if (v6) {
      int v11 = 0;
    }
    else {
      int v11 = v8;
    }
    *(_DWORD *)(a2 + 16) = v11;
    if (v9) {
      CFRelease(v9);
    }
    if (v7) {
      CFRelease(v7);
    }
  }
  else
  {
    *(_DWORD *)(a2 + 4) = 19;
    *(_DWORD *)(a2 + 16) = 0;
  }
}

uint64_t ppp_find(__int16 *a1)
{
  if (*a1 < 0) {
    return findbysid((const char *)a1 + 20, *((_DWORD *)a1 + 3));
  }
  else {
    return findbyref(0, *((_DWORD *)a1 + 3));
  }
}

uint64_t socket_client_notify(__CFSocket *a1, char *__s, unsigned int a3, unsigned int a4, unsigned int a5, char a6)
{
  int __buf = 655360;
  int v20 = 0;
  unsigned int __buf_4 = a4;
  unint64_t v19 = __PAIR64__(a3, a5);
  if (__s)
  {
    LOWORD(__buf) = 0x8000;
    size_t v11 = strlen(__s);
    a3 = v11;
    HIDWORD(v19) = v11;
    __int16 v12 = 128;
    size_t v13 = v11;
    if ((a6 & 0x20) == 0) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  __int16 v12 = 0;
  size_t v13 = 0;
  if ((a6 & 0x20) != 0)
  {
LABEL_3:
    LOWORD(__buf) = v12;
    HIWORD(__buf) = 2560;
    unsigned int __buf_4 = bswap32(a4);
    unint64_t v19 = _byteswap_uint64(__PAIR64__(a5, a3));
    int v20 = 0;
  }
LABEL_4:
  CFSocketNativeHandle Native = CFSocketGetNative(a1);
  uint64_t result = writen(Native, (char *)&__buf, 0x14uLL);
  if (__s)
  {
    if (result == 20)
    {
      CFSocketNativeHandle v16 = CFSocketGetNative(a1);
      return writen(v16, __s, v13);
    }
  }
  return result;
}

CFStringRef sub_17F34(const __CFDictionary *a1, const void *a2, const void *a3, const char *a4, int a5, const void *a6)
{
  unsigned int v10 = sub_18184(a1, a2, a3);
  if (!v10) {
    return (CFStringRef)&dword_C;
  }
  size_t v11 = v10;
  if (a6)
  {
    CFDictionaryAddValue(v10, a3, a6);
  }
  else
  {
    a4[a5] = 0;
    CFStringRef result = CFStringCreateWithCString(0, a4, 0x8000100u);
    if (!result) {
      return result;
    }
    CFStringRef v13 = result;
    CFDictionaryAddValue(v11, a3, result);
    CFRelease(v13);
  }
  return 0;
}

CFNumberRef sub_17FD8(const __CFDictionary *a1, const void *a2, const void *a3, unint64_t a4, unint64_t a5, uint64_t a6)
{
  unint64_t valuePtr = a4;
  if (a4 > a5)
  {
    if (!a6) {
      return (CFNumberRef)(&dword_14 + 2);
    }
    unint64_t valuePtr = a5;
  }
  CFMutableDictionaryRef v7 = sub_18184(a1, a2, a3);
  if (!v7) {
    return (CFNumberRef)&dword_C;
  }
  int v8 = v7;
  CFNumberRef result = CFNumberCreate(0, kCFNumberLongType, &valuePtr);
  if (result)
  {
    CFNumberRef v10 = result;
    CFDictionaryAddValue(v8, a3, result);
    CFRelease(v10);
    return 0;
  }
  return result;
}

void sub_18070(const __CFDictionary *a1, const void *a2, const void *a3)
{
  CFArrayRef Value = (__CFDictionary *)CFDictionaryGetValue(a1, a2);
  if (Value)
  {
    uint64_t v5 = Value;
    CFTypeID v6 = CFGetTypeID(Value);
    if (v6 == CFDictionaryGetTypeID())
    {
      CFDictionaryRemoveValue(v5, a3);
    }
  }
}

uint64_t sub_180E0(const __CFDictionary *a1, const void *a2, const void *a3, const void *a4, const void *a5)
{
  CFMutableDictionaryRef v8 = sub_18184(a1, a2, a3);
  if (!v8) {
    return 12;
  }
  CFTypeRef v9 = v8;
  CFMutableDictionaryRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  if (!Mutable) {
    return 12;
  }
  size_t v11 = Mutable;
  if (a4) {
    CFArrayAppendValue(Mutable, a4);
  }
  if (a5) {
    CFArrayAppendValue(v11, a5);
  }
  CFDictionaryAddValue(v9, a3, v11);
  CFRelease(v11);
  return 0;
}

CFMutableDictionaryRef sub_18184(const __CFDictionary *a1, const void *a2, const void *a3)
{
  CFArrayRef Value = (__CFDictionary *)CFDictionaryGetValue(a1, a2);
  if (!Value)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (!Mutable) {
      return Mutable;
    }
    CFDictionaryAddValue(a1, a2, Mutable);
    CFRelease(Mutable);
LABEL_6:
    CFDictionaryRemoveValue(Mutable, a3);
    return Mutable;
  }
  CFMutableDictionaryRef Mutable = Value;
  CFTypeID v8 = CFGetTypeID(Value);
  if (v8 == CFDictionaryGetTypeID()) {
    goto LABEL_6;
  }
  return 0;
}

uint64_t sub_18224(int a1, uint64_t a2, uint64_t a3, mach_port_name_t a4, mach_port_name_t a5, int a6, int a7, int a8, int a9, mach_port_name_t *a10, int *a11, _OWORD *a12)
{
  CFMachPortRef port = 0;
  CFStringRef v39 = 0;
  CFRunLoopSourceRef source = 0;
  gid_t egidp = -1;
  uid_t euidp = -1;
  pid_t pidp = -1;
  if (dword_40560 == a1)
  {
    char v16 = 1;
    SCLog();
  }
  else
  {
    SCLog();
    char v16 = 0;
  }
  mach_port_t previous = 0;
  *a10 = 0;
  SCLog();
  if (!_SCUnserializeString())
  {
LABEL_13:
    int v20 = 1001;
    goto LABEL_14;
  }
  CFTypeID TypeID = CFStringGetTypeID();
  if (v39 && CFGetTypeID(v39) == TypeID)
  {
    long long v18 = a12[1];
    *(_OWORD *)atoken.val = *a12;
    *(_OWORD *)&atoken.val[4] = v18;
    audit_token_to_au32(&atoken, 0, &euidp, &egidp, 0, 0, &pidp, 0, 0);
    if (euidp == a7 && egidp == a8 && pidp == a9)
    {
LABEL_10:
      mach_port_allocate(mach_task_self_, 1u, a10);
      CFMachPortRef port = (CFMachPortRef)_SC_CFMachPortCreateWithPort();
      mach_port_insert_right(mach_task_self_, *a10, *a10, 0x14u);
      mach_port_request_notification(mach_task_self_, *a10, 70, 1u, *a10, 0x15u, &previous);
      CFRunLoopSourceRef source = CFMachPortCreateRunLoopSource(0, port, 0);
      CFAbsoluteTime Current = CFRunLoopGetCurrent();
      CFRunLoopAddSource(Current, source, kCFRunLoopDefaultMode);
      if (client_new_mach(port, source, v39, a7, a8, a9, a4, a5, a6, v16))
      {
        *a11 = 0;
        my_CFRelease(&v39);
        my_CFRelease((const void **)&port);
        my_CFRelease((const void **)&source);
        return 0;
      }
      goto LABEL_13;
    }
    long long v23 = a12[1];
    *(_OWORD *)atoken.val = *a12;
    *(_OWORD *)&atoken.val[4] = v23;
    CFStringRef v24 = SecTaskCreateWithAuditToken(0, &atoken);
    if (!v24)
    {
      SCLog();
      goto LABEL_38;
    }
    CFDictionaryRef v25 = v24;
    *(void *)atoken.val = 0;
    CFBooleanRef v26 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v24, @"com.apple.private.SCNetworkConnection-proxy-user", (CFErrorRef *)&atoken);
    if (v26)
    {
      CFBooleanRef v27 = v26;
      CFTypeID v29 = CFBooleanGetTypeID();
      if (CFGetTypeID(v27) == v29)
      {
        int Value = CFBooleanGetValue(v27);
        CFRelease(v27);
        CFRelease(v25);
        if (Value) {
          goto LABEL_10;
        }
LABEL_38:
        SCLog();
        int v20 = 1003;
        goto LABEL_14;
      }
      CFTypeID v31 = CFArrayGetTypeID();
      if (CFGetTypeID(v27) == v31)
      {
        CFRelease(v27);
        CFRelease(v25);
        goto LABEL_10;
      }
      SCLog();
      CFBooleanRef v28 = v27;
    }
    else
    {
      if (!*(void *)atoken.val)
      {
LABEL_37:
        CFRelease(v25);
        goto LABEL_38;
      }
      SCLog();
      CFBooleanRef v28 = *(const __CFBoolean **)atoken.val;
    }
    CFRelease(v28);
    goto LABEL_37;
  }
  int v20 = 1002;
LABEL_14:
  *a11 = v20;
  my_CFRelease(&v39);
  if (port)
  {
    CFMachPortInvalidate(port);
    my_CFRelease((const void **)&port);
  }
  if (source)
  {
    uint64_t v21 = CFRunLoopGetCurrent();
    CFRunLoopRemoveSource(v21, source, kCFRunLoopDefaultMode);
    my_CFRelease((const void **)&source);
  }
  if (*a10)
  {
    mach_port_mod_refs(mach_task_self_, *a10, 0, -1);
    mach_port_mod_refs(mach_task_self_, *a10, 1u, -1);
    *a10 = 0;
  }
  if (a4) {
    mach_port_deallocate(mach_task_self_, a4);
  }
  if (a5) {
    mach_port_deallocate(mach_task_self_, a5);
  }
  return 0;
}

void server_handle_request(uint64_t a1, mach_msg_header_t *a2)
{
  mach_msg_return_t v5;
  char *v6;
  mach_port_name_t msgh_local_port;
  void *v8;
  mach_port_t v9;
  uint64_t vars8;

  mode_t v2 = a2;
  mach_msg_id_t msgh_id = a2->msgh_id;
  if ((msgh_id - 78) >= 0xFFFFFFF2)
  {
    if (msgh_id == 70)
    {
      msgh_local_CFMachPortRef port = a2->msgh_local_port;
      CFTypeID v8 = client_findbymachport(msgh_local_port);
      if (v8) {
        client_dispose((uint64_t)v8);
      }
      CFTypeRef v9 = mach_task_self_;
      mach_port_mod_refs(v9, msgh_local_port, 1u, -1);
    }
  }
  else
  {
    if (!sub_2D66C(a2, (uint64_t)&dword_40568))
    {
      syslog(6, "unknown message ID (%d) received", v2->msgh_id);
      goto LABEL_15;
    }
    if ((dword_40568 & 0x1F) == 0x11) {
      mach_msg_option_t v4 = 17;
    }
    else {
      mach_msg_option_t v4 = 1;
    }
    uint64_t v5 = mach_msg((mach_msg_header_t *)&dword_40568, v4, unk_4056C, 0, 0, 0, 0);
    if (v5)
    {
      CFTypeID v6 = mach_error_string(v5);
      syslog(6, "PPPController: mach_msg(send): %s", v6);
      mode_t v2 = (mach_msg_header_t *)&dword_40568;
LABEL_15:
      mach_msg_destroy(v2);
    }
  }
}

uint64_t sub_18838(int a1, uint64_t a2, uint64_t a3, mach_port_name_t a4, mach_port_name_t a5, int a6, mach_port_name_t *a7, int *a8, _OWORD *a9)
{
  gid_t egidp = -1;
  uid_t euidp = -1;
  pid_t pidp = -1;
  long long v17 = a9[1];
  *(_OWORD *)atoken.val = *a9;
  *(_OWORD *)&atoken.val[4] = v17;
  audit_token_to_au32(&atoken, 0, &euidp, &egidp, 0, 0, &pidp, 0, 0);
  long long v18 = a9[1];
  *(_OWORD *)atoken.val = *a9;
  *(_OWORD *)&atoken.val[4] = v18;
  sub_18224(a1, a2, a3, a4, a5, a6, euidp, egidp, pidp, a7, a8, &atoken);
  return 0;
}

uint64_t sub_1891C(int a1, _DWORD *a2, int *a3)
{
  *a2 = -1;
  uint64_t v5 = client_findbymachport(a1);
  if (v5)
  {
    CFTypeID v6 = findbyserviceID((CFStringRef)v5[6]);
    if (v6)
    {
      int v7 = scnc_getstatus((uint64_t)v6);
      int v8 = 0;
      *a2 = v7;
    }
    else
    {
      int v8 = 5001;
    }
  }
  else
  {
    int v8 = 1002;
  }
  *a3 = v8;
  return 0;
}

uint64_t sub_18980(int a1, void *a2, int *a3, int *a4)
{
  uint64_t v12 = 0;
  unsigned __int16 v11 = 0;
  int v7 = client_findbymachport(a1);
  if (v7)
  {
    int v8 = findbyserviceID((CFStringRef)v7[6]);
    if (v8)
    {
      if (!scnc_copyextendedstatus((uint64_t)v8, &v12, &v11))
      {
        *a2 = v12;
        *a3 = v11;
        a3 = a4;
        goto LABEL_8;
      }
      int v9 = 1001;
    }
    else
    {
      int v9 = 5001;
    }
  }
  else
  {
    int v9 = 1002;
  }
  *a4 = v9;
  *a2 = 0;
LABEL_8:
  *a3 = 0;
  return 0;
}

uint64_t sub_18A20(int a1, void *a2, int *a3, int *a4)
{
  uint64_t v12 = 0;
  unsigned __int16 v11 = 0;
  int v7 = client_findbymachport(a1);
  if (v7)
  {
    int v8 = findbyserviceID((CFStringRef)v7[6]);
    if (v8)
    {
      if (!scnc_copystatistics((uint64_t)v8, &v12, &v11))
      {
        *a2 = v12;
        *a3 = v11;
        a3 = a4;
        goto LABEL_8;
      }
      int v9 = 1001;
    }
    else
    {
      int v9 = 5001;
    }
  }
  else
  {
    int v9 = 1002;
  }
  *a4 = v9;
  *a2 = 0;
LABEL_8:
  *a3 = 0;
  return 0;
}

uint64_t sub_18AC0(int a1, void *a2, int *a3, int *a4)
{
  uint64_t v12 = 0;
  unsigned __int16 v11 = 0;
  int v7 = client_findbymachport(a1);
  if (v7)
  {
    int v8 = findbyserviceID((CFStringRef)v7[6]);
    if (v8)
    {
      if (!scnc_getconnectdata((uint64_t)v8, &v12, &v11, 0))
      {
        *a2 = v12;
        *a3 = v11;
        a3 = a4;
        goto LABEL_8;
      }
      int v9 = 1001;
    }
    else
    {
      int v9 = 5001;
    }
  }
  else
  {
    int v9 = 1002;
  }
  *a4 = v9;
  *a2 = 0;
LABEL_8:
  *a3 = 0;
  return 0;
}

uint64_t sub_18B64(int a1, uint64_t a2, int a3, int a4, int *a5)
{
  CFStringRef v13 = 0;
  int v8 = client_findbymachport(a1);
  if (!v8) {
    goto LABEL_6;
  }
  uint64_t v9 = (uint64_t)v8;
  CFNumberRef v10 = findbyserviceID((CFStringRef)v8[6]);
  if (!v10)
  {
    int v11 = 5001;
    goto LABEL_10;
  }
  if (!a3)
  {
    if (!scnc_start((unint64_t)v10, 0, v9, a4 == 0, *(_DWORD *)(v9 + 64), *(_DWORD *)(v9 + 68), *(_DWORD *)(v9 + 72), *(_DWORD *)(v9 + 56), *(_DWORD *)(v9 + 60)))
    {
      my_CFRelease(&v13);
      *a5 = 0;
      return 0;
    }
    goto LABEL_9;
  }
  if (!_SCUnserialize())
  {
LABEL_9:
    int v11 = 1001;
    goto LABEL_10;
  }
  CFDictionaryGetTypeID();
LABEL_6:
  int v11 = 1002;
LABEL_10:
  *a5 = v11;
  my_CFRelease(&v13);
  return 0;
}

uint64_t sub_18C8C(int a1, int a2, int *a3)
{
  uint64_t v5 = client_findbymachport(a1);
  if (v5)
  {
    uint64_t v6 = (uint64_t)v5;
    int v7 = findbyserviceID((CFStringRef)v5[6]);
    if (v7)
    {
      uint64_t v8 = (uint64_t)v7;
      if (a2) {
        int v9 = 10;
      }
      else {
        int v9 = 9;
      }
      if (controller_options_is_onDemandAutoPauseUponDisconnect() && !*(_DWORD *)(v8 + 412)) {
        ondemand_set_pause(v8, 2, 0);
      }
      scnc_stop(v8, v6, 1, v9);
      int v10 = 0;
    }
    else
    {
      int v10 = 5001;
    }
  }
  else
  {
    int v10 = 1002;
  }
  *a3 = v10;
  return 0;
}

uint64_t sub_18D30(int a1, int *a2)
{
  size_t v3 = client_findbymachport(a1);
  if (v3)
  {
    mach_msg_option_t v4 = findbyserviceID((CFStringRef)v3[6]);
    if (v4)
    {
      scnc_suspend((uint64_t)v4);
      int v5 = 0;
    }
    else
    {
      int v5 = 5001;
    }
  }
  else
  {
    int v5 = 1002;
  }
  *a2 = v5;
  return 0;
}

uint64_t sub_18D84(int a1, int *a2)
{
  size_t v3 = client_findbymachport(a1);
  if (v3)
  {
    mach_msg_option_t v4 = findbyserviceID((CFStringRef)v3[6]);
    if (v4)
    {
      scnc_resume((uint64_t)v4);
      int v5 = 0;
    }
    else
    {
      int v5 = 5001;
    }
  }
  else
  {
    int v5 = 1002;
  }
  *a2 = v5;
  return 0;
}

uint64_t sub_18DD8(int a1, int a2, int *a3)
{
  int v5 = client_findbymachport(a1);
  if (v5)
  {
    int v6 = 0;
    *((_DWORD *)v5 + 29) = *((_DWORD *)v5 + 29) & 0xFFFFFFF7 | (8 * (a2 != 0));
  }
  else
  {
    int v6 = 1002;
  }
  *a3 = v6;
  return 0;
}

uint64_t sub_18E2C(uint64_t a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, _OWORD *a5)
{
  pid_t pidp = 0;
  long long v8 = a5[1];
  *(_OWORD *)atoken.val = *a5;
  *(_OWORD *)&atoken.val[4] = v8;
  audit_token_to_au32(&atoken, 0, 0, 0, 0, 0, &pidp, 0, 0);
  uint64_t v9 = findbypid(pidp);
  if (v9)
  {
    *a2 = *(_DWORD *)(v9 + 96);
    *a3 = *(_DWORD *)(v9 + 100);
    a3 = a4;
  }
  else
  {
    *a4 = 1002;
    *a2 = 0;
  }
  *a3 = 0;
  return 0;
}

uint64_t sub_18ED0(uint64_t a1, int a2, void *a3, int *a4, int *a5, _OWORD *a6)
{
  pid_t pidp = 0;
  uint64_t v16 = 0;
  unsigned __int16 v15 = 0;
  long long v10 = a6[1];
  *(_OWORD *)atoken.val = *a6;
  *(_OWORD *)&atoken.val[4] = v10;
  audit_token_to_au32(&atoken, 0, 0, 0, 0, 0, &pidp, 0, 0);
  uint64_t v11 = findbypid(pidp);
  if (!v11)
  {
    int v12 = 1002;
    goto LABEL_7;
  }
  if (a2 != 1)
  {
    if (!a2 && scnc_getconnectsystemdata(v11, &v16, &v15)) {
      goto LABEL_5;
    }
LABEL_9:
    *a3 = v16;
    *a4 = v15;
    goto LABEL_10;
  }
  if (!scnc_getconnectdata(v11, &v16, &v15, 1)) {
    goto LABEL_9;
  }
LABEL_5:
  int v12 = 1001;
LABEL_7:
  *a5 = v12;
  *a3 = 0;
  a5 = a4;
LABEL_10:
  *a5 = 0;
  return 0;
}

uint64_t sub_18FB8(uint64_t a1, int *a2, _OWORD *a3)
{
  pid_t pidp = 0;
  long long v4 = a3[1];
  *(_OWORD *)atoken.val = *a3;
  *(_OWORD *)&atoken.val[4] = v4;
  audit_token_to_au32(&atoken, 0, 0, 0, 0, 0, &pidp, 0, 0);
  if (findbypid(pidp)) {
    int v5 = 0;
  }
  else {
    int v5 = 1002;
  }
  *a2 = v5;
  return 0;
}

void mach_client_notify(mach_port_t a1)
{
  mach_msg_return_t v1;
  mach_msg_header_t msg;

  *(void *)&msg.msgh_bits = 0x1800000013;
  msg.msgh_remote_CFMachPortRef port = a1;
  msg.msgh_local_CFMachPortRef port = 0;
  *(void *)&msg.msgh_voucher_CFMachPortRef port = 0;
  int v1 = mach_msg(&msg, 17, 0x18u, 0, 0, 0, 0);
  if (v1 == 268435459 || v1 == 16) {
    mach_msg_destroy(&msg);
  }
}

uint64_t ppp_mach_start_server_priv()
{
  kern_return_t v0;
  __CFMachPort *v2;
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v4;
  mach_port_t sp;

  sp = 0;
  int v0 = bootstrap_check_in(bootstrap_port, "com.apple.SystemConfiguration.PPPController-priv", &sp);
  if (v0)
  {
    bootstrap_strerror(v0);
LABEL_3:
    SCLog();
    return 0xFFFFFFFFLL;
  }
  mode_t v2 = (__CFMachPort *)_SC_CFMachPortCreateWithPort();
  qword_435C8 = (uint64_t)v2;
  if (!v2) {
    goto LABEL_3;
  }
  dword_40560 = sp;
  CFRunLoopSourceRef RunLoopSource = CFMachPortCreateRunLoopSource(0, v2, 0);
  if (!RunLoopSource)
  {
    SCLog();
    CFRelease((CFTypeRef)qword_435C8);
    qword_435C8 = 0;
    dword_40560 = 0;
    return 0xFFFFFFFFLL;
  }
  long long v4 = RunLoopSource;
  gControllerRunloop = (uint64_t)CFRunLoopGetCurrent();
  CFRunLoopAddSource((CFRunLoopRef)gControllerRunloop, v4, kCFRunLoopDefaultMode);
  CFRunLoopAddSource((CFRunLoopRef)gControllerRunloop, (CFRunLoopSourceRef)gTerminalrls, kCFRunLoopDefaultMode);
  CFRelease(v4);
  return 0;
}

CFStringRef sub_19204()
{
  return CFStringCreateWithFormat(0, 0, @"PPPController-Priv");
}

uint64_t ppp_mach_start_server()
{
  kern_return_t v0;
  __CFMachPort *v2;
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v4;
  mach_port_t sp;

  sp = 0;
  int v0 = bootstrap_check_in(bootstrap_port, "com.apple.SystemConfiguration.PPPController", &sp);
  if (v0)
  {
    bootstrap_strerror(v0);
LABEL_3:
    SCLog();
    return 0xFFFFFFFFLL;
  }
  mode_t v2 = (__CFMachPort *)_SC_CFMachPortCreateWithPort();
  qword_435D0 = (uint64_t)v2;
  if (!v2) {
    goto LABEL_3;
  }
  dword_40564 = sp;
  CFRunLoopSourceRef RunLoopSource = CFMachPortCreateRunLoopSource(0, v2, 0);
  if (!RunLoopSource)
  {
    SCLog();
    CFRelease((CFTypeRef)qword_435D0);
    qword_435D0 = 0;
    dword_40564 = 0;
    return 0xFFFFFFFFLL;
  }
  long long v4 = RunLoopSource;
  gControllerRunloop = (uint64_t)CFRunLoopGetCurrent();
  CFRunLoopAddSource((CFRunLoopRef)gControllerRunloop, v4, kCFRunLoopDefaultMode);
  CFRunLoopAddSource((CFRunLoopRef)gControllerRunloop, (CFRunLoopSourceRef)gTerminalrls, kCFRunLoopDefaultMode);
  CFRelease(v4);
  return 0;
}

CFStringRef sub_1937C()
{
  return CFStringCreateWithFormat(0, 0, @"PPPController");
}

CFMutableStringRef parse_component(const __CFString *a1, const __CFString *a2)
{
  if (!CFStringHasPrefix(a1, a2)) {
    return 0;
  }
  CFMutableStringRef MutableCopy = CFStringCreateMutableCopy(0, 0, a1);
  v8.length = CFStringGetLength(a2);
  v8.CFIndex location = 0;
  CFStringDelete(MutableCopy, v8);
  CFIndex location = CFStringFind(MutableCopy, @"/", 0).location;
  if (location == -1)
  {
    CFRelease(MutableCopy);
    return 0;
  }
  CFIndex v6 = location;
  v9.length = CFStringGetLength(MutableCopy) - location;
  v9.CFIndex location = v6;
  CFStringDelete(MutableCopy, v9);
  return MutableCopy;
}

__CFString *copyService(const __SCDynamicStore *a1, const __CFString *a2, const __CFString *a3)
{
  CFStringRef v6 = kSCEntNetPPP;
  v14[0] = kSCEntNetModem;
  v14[1] = kSCEntNetInterface;
  v14[2] = kSCEntNetIPv4;
  v14[3] = kSCEntNetIPv6;
  v14[4] = kSCEntNetDNS;
  v14[5] = kSCEntNetL2TP;
  v14[6] = kSCEntNetPPTP;
  v14[7] = kSCEntNetIPSec;
  v14[8] = 0;
  CFMutableStringRef MutableCopy = (__CFString *)SCDynamicStoreKeyCreate(0, @"%@/%@/%@/%@", a2, kSCCompNetwork, kSCCompService, a3);
  if (MutableCopy)
  {
    CFDictionaryRef v8 = (const __CFDictionary *)SCDynamicStoreCopyValue(a1, MutableCopy);
    if (v8
      || (CFDictionaryRef v8 = CFDictionaryCreate(0, 0, 0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks)) != 0)
    {
      CFRelease(MutableCopy);
      CFMutableStringRef MutableCopy = (__CFString *)CFDictionaryCreateMutableCopy(0, 0, v8);
      CFRelease(v8);
      if (MutableCopy && kSCEntNetPPP)
      {
        CFRange v9 = (const __CFString **)v14;
        do
        {
          CFPropertyListRef v10 = copyEntity(a1, a2, a3, v6);
          if (v10)
          {
            uint64_t v11 = v10;
            CFDictionaryAddValue((CFMutableDictionaryRef)MutableCopy, v6, v10);
            CFRelease(v11);
          }
          CFStringRef v12 = *v9++;
          CFStringRef v6 = v12;
        }
        while (v12);
      }
    }
    else
    {
      CFRelease(MutableCopy);
      return 0;
    }
  }
  return MutableCopy;
}

CFPropertyListRef copyEntity(const __SCDynamicStore *a1, const __CFString *a2, const __CFString *a3, CFStringRef entity)
{
  if (a3) {
    CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0, a2, a3, entity);
  }
  else {
    CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity(0, a2, entity);
  }
  CFStringRef v6 = NetworkServiceEntity;
  if (!NetworkServiceEntity) {
    return 0;
  }
  CFPropertyListRef v7 = SCDynamicStoreCopyValue(a1, NetworkServiceEntity);
  CFRelease(v6);
  return v7;
}

CFPropertyListRef existEntity(const __SCDynamicStore *a1, const __CFString *a2, const __CFString *a3, const __CFString *a4)
{
  CFPropertyListRef result = copyEntity(a1, a2, a3, a4);
  if (result)
  {
    CFRelease(result);
    return &dword_0 + 1;
  }
  return result;
}

CFStringRef getString(const __CFDictionary *a1, const void *a2, char *a3, unsigned int a4)
{
  *a3 = 0;
  CFStringRef result = (const __CFString *)CFDictionaryGetValue(a1, a2);
  if (result)
  {
    CFStringRef v7 = result;
    CFTypeID v8 = CFGetTypeID(result);
    if (v8 == CFStringGetTypeID())
    {
      CFStringGetCString(v7, a3, a4, 0x8000100u);
      return (const __CFString *)(&dword_0 + 1);
    }
    CFTypeID v9 = CFGetTypeID(v7);
    if (v9 == CFDataGetTypeID())
    {
      CFStringRef result = (const __CFString *)CFDataGetLength((CFDataRef)v7);
      if (result)
      {
        CFIndex v10 = (CFIndex)result;
        CFStringRef result = (const __CFString *)CFDataGetBytePtr((CFDataRef)v7);
        if (result)
        {
          CFStringEncoding v11 = LOBYTE(result->isa) ? 335544576 : 268435712;
          CFStringRef result = CFStringCreateWithBytes(0, (const UInt8 *)result, v10, v11, 0);
          if (result)
          {
            CFStringRef v12 = result;
            CFStringGetCString(result, a3, a4, 0x8000100u);
            CFRelease(v12);
            return (const __CFString *)(&dword_0 + 1);
          }
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

CFNumberRef getNumber(const __CFDictionary *a1, const void *a2, void *a3)
{
  CFNumberRef result = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  if (result)
  {
    CFNumberRef v5 = result;
    CFTypeID v6 = CFGetTypeID(result);
    if (v6 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v5, kCFNumberSInt32Type, a3);
      return (const __CFNumber *)(&dword_0 + 1);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

CFDictionaryRef getNumberFromEntity(const __SCDynamicStore *a1, const __CFString *a2, const __CFString *a3, const __CFString *a4, const void *a5, void *a6)
{
  CFDictionaryRef result = (const __CFDictionary *)copyEntity(a1, a2, a3, a4);
  if (result)
  {
    CFDictionaryRef v9 = result;
    CFNumberRef Number = getNumber(result, a5, a6);
    CFRelease(v9);
    return Number;
  }
  return result;
}

CFDictionaryRef getStringFromEntity(const __SCDynamicStore *a1, const __CFString *a2, const __CFString *a3, const __CFString *a4, const void *a5, char *a6, unsigned int a7)
{
  CFDictionaryRef result = (const __CFDictionary *)copyEntity(a1, a2, a3, a4);
  if (result)
  {
    CFDictionaryRef v11 = result;
    CFStringRef String = getString(result, a5, a6, a7);
    CFRelease(v11);
    return (const __CFDictionary *)String;
  }
  return result;
}

const void *copyCFStringFromEntity(const __SCDynamicStore *a1, const __CFString *a2, const __CFString *a3, const __CFString *a4, const void *a5)
{
  CFDictionaryRef v6 = (const __CFDictionary *)copyEntity(a1, a2, a3, a4);
  if (!v6) {
    return 0;
  }
  CFDictionaryRef v7 = v6;
  int Value = CFDictionaryGetValue(v6, a5);
  CFDictionaryRef v9 = Value;
  if (Value)
  {
    CFTypeID v10 = CFGetTypeID(Value);
    if (v10 == CFStringGetTypeID()) {
      CFRetain(v9);
    }
    else {
      CFDictionaryRef v9 = 0;
    }
  }
  CFRelease(v7);
  return v9;
}

CFStringRef CFStringAddrToLong(const __CFString *result)
{
  if (result)
  {
    buffer[0] = 0;
    CFStringGetCString(result, buffer, 100, 0);
    return (const __CFString *)bswap32(inet_addr(buffer));
  }
  return result;
}

uint64_t getAddressFromEntity(const __SCDynamicStore *a1, const __CFString *a2, const __CFString *a3, const __CFString *a4, const void *a5, _DWORD *a6)
{
  CFDictionaryRef v8 = (const __CFDictionary *)copyEntity(a1, a2, a3, a4);
  if (!v8) {
    return 0;
  }
  CFDictionaryRef v9 = v8;
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(v8, a5);
  if (Value && (CFArrayRef v11 = Value, CFArrayGetCount(Value)))
  {
    CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v11, 0);
    *a6 = CFStringAddrToLong(ValueAtIndex);
    uint64_t v13 = 1;
  }
  else
  {
    uint64_t v13 = 0;
  }
  CFRelease(v9);
  return v13;
}

uint64_t my_CFEqual(unint64_t cf1, unint64_t a2)
{
  if (!(cf1 | a2)) {
    return 1;
  }
  uint64_t result = 0;
  if (cf1)
  {
    if (a2) {
      return CFEqual((CFTypeRef)cf1, (CFTypeRef)a2);
    }
  }
  return result;
}

void my_CFRelease(const void **a1)
{
  if (a1)
  {
    mode_t v2 = *a1;
    if (v2)
    {
      CFRelease(v2);
      *a1 = 0;
    }
  }
}

uint64_t my_close(uint64_t result)
{
  if (result != -1) {
    return close(result);
  }
  return result;
}

CFTypeRef my_CFRetain(CFTypeRef cf)
{
  if (cf) {
    CFRetain(cf);
  }
  return cf;
}

const void *isDictionary(const void *result)
{
  if (result)
  {
    CFTypeID v1 = CFGetTypeID(result);
    return (const void *)(v1 == CFDictionaryGetTypeID());
  }
  return result;
}

const void *isArray(const void *result)
{
  if (result)
  {
    CFTypeID v1 = CFGetTypeID(result);
    return (const void *)(v1 == CFArrayGetTypeID());
  }
  return result;
}

const void *isString(const void *result)
{
  if (result)
  {
    CFTypeID v1 = CFGetTypeID(result);
    return (const void *)(v1 == CFStringGetTypeID());
  }
  return result;
}

const void *isNumber(const void *result)
{
  if (result)
  {
    CFTypeID v1 = CFGetTypeID(result);
    return (const void *)(v1 == CFNumberGetTypeID());
  }
  return result;
}

const void *isData(const void *result)
{
  if (result)
  {
    CFTypeID v1 = CFGetTypeID(result);
    return (const void *)(v1 == CFDataGetTypeID());
  }
  return result;
}

void AddNumber(__CFDictionary *a1, const void *a2, int a3)
{
  int valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberSInt32Type, &valuePtr);
  if (v5)
  {
    CFNumberRef v6 = v5;
    CFDictionaryAddValue(a1, a2, v5);
    CFRelease(v6);
  }
}

void AddNumber64(__CFDictionary *a1, const void *a2, uint64_t a3)
{
  uint64_t valuePtr = a3;
  CFNumberRef v5 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  if (v5)
  {
    CFNumberRef v6 = v5;
    CFDictionaryAddValue(a1, a2, v5);
    CFRelease(v6);
  }
}

void AddString(__CFDictionary *a1, const void *a2, char *cStr)
{
  CFStringRef v5 = CFStringCreateWithCString(0, cStr, 0x8000100u);
  if (v5)
  {
    CFStringRef v6 = v5;
    CFDictionaryAddValue(a1, a2, v5);
    CFRelease(v6);
  }
}

void AddNumberFromState(const __SCDynamicStore *a1, const __CFString *a2, const __CFString *a3, const void *a4, __CFDictionary *a5)
{
  int v7 = 0;
  if (getNumberFromEntity(a1, kSCDynamicStoreDomainState, a2, a3, a4, &v7)) {
    AddNumber(a5, a4, v7);
  }
}

void AddStringFromState(const __SCDynamicStore *a1, const __CFString *a2, const __CFString *a3, const void *a4, __CFDictionary *a5)
{
  int v7 = copyCFStringFromEntity(a1, kSCDynamicStoreDomainState, a2, a3, a4);
  if (v7)
  {
    CFDictionaryRef v8 = v7;
    CFDictionaryAddValue(a5, a4, v7);
    CFRelease(v8);
  }
}

CFDataRef Serialize(CFPropertyListRef propertyList, const UInt8 **a2, _DWORD *a3)
{
  CFDataRef XMLData = CFPropertyListCreateXMLData(0, propertyList);
  CFDataRef v6 = XMLData;
  if (XMLData)
  {
    *a2 = CFDataGetBytePtr(XMLData);
    *a3 = CFDataGetLength(v6);
  }
  return v6;
}

CFDataRef Unserialize(UInt8 *bytes, CFIndex length)
{
  CFDataRef result = CFDataCreate(0, bytes, length);
  if (result)
  {
    CFDataRef v3 = result;
    CFPropertyListRef v4 = CFPropertyListCreateFromXMLData(0, result, 0, 0);
    CFRelease(v3);
    return (const __CFData *)v4;
  }
  return result;
}

vm_address_t my_Allocate(int a1)
{
  vm_address_t address = 0;
  if (vm_allocate(mach_task_self_, &address, a1, 1)) {
    return 0;
  }
  else {
    return address;
  }
}

vm_address_t my_Deallocate(vm_address_t address, int a2)
{
  if (address) {
    return vm_deallocate(mach_task_self_, address, a2);
  }
  return address;
}

uint64_t GetIntFromDict(const __CFDictionary *a1, const void *a2, _DWORD *a3, int a4)
{
  CFArrayRef Value = CFDictionaryGetValue(a1, a2);
  if (isNumber(Value) && CFNumberGetValue((CFNumberRef)Value, kCFNumberSInt32Type, a3)) {
    return 1;
  }
  uint64_t result = 0;
  *a3 = a4;
  return result;
}

size_t GetStrFromDict(const __CFDictionary *a1, const void *a2, char *a3, int a4, const char *a5)
{
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(a1, a2);
  if (!isString(Value) || !CFStringGetCString(Value, a3, a4, 0x8000100u)) {
    strncpy(a3, a5, a4);
  }
  return strlen(a3);
}

BOOL GetStrAddrFromDict(const __CFDictionary *a1, const void *a2, char *a3, int a4)
{
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(a1, a2);
  return isString(Value) && CFStringGetCString(Value, a3, a4, 0x8000100u);
}

const void *GetStrNetFromDict(const __CFDictionary *a1, const void *a2, char *a3, int a4)
{
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(a1, a2);
  uint64_t result = isString(Value);
  if (result)
  {
    uint64_t result = (const void *)CFStringGetCString(Value, a3, a4, 0x8000100u);
    if (result) {
      return (const void *)(inet_network(a3) != -1);
    }
  }
  return result;
}

uint64_t publish_keyentry(const __SCDynamicStore *a1, const __CFString *a2, const void *a3, const void *a4)
{
  CFDictionaryRef v8 = (const __CFDictionary *)SCDynamicStoreCopyValue(a1, a2);
  if (v8)
  {
    CFDictionaryRef v9 = v8;
    CFMutableStringRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v8);
    CFRelease(v9);
    if (MutableCopy)
    {
LABEL_3:
      CFDictionarySetValue(MutableCopy, a3, a4);
      SCDynamicStoreSetValue(a1, a2, MutableCopy);
      CFRelease(MutableCopy);
      return 1;
    }
  }
  else
  {
    CFMutableStringRef MutableCopy = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (MutableCopy) {
      goto LABEL_3;
    }
  }
  return 0;
}

uint64_t unpublish_keyentry(const __SCDynamicStore *a1, const __CFString *a2, const void *a3)
{
  CFDictionaryRef v6 = (const __CFDictionary *)SCDynamicStoreCopyValue(a1, a2);
  if (v6)
  {
    CFDictionaryRef v7 = v6;
    CFMutableStringRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v6);
    if (MutableCopy)
    {
      CFDictionaryRef v9 = MutableCopy;
      CFDictionaryRemoveValue(MutableCopy, a3);
      SCDynamicStoreSetValue(a1, a2, v9);
      CFRelease(v9);
    }
    CFRelease(v7);
  }
  return 0;
}

uint64_t publish_dictnumentry(const __SCDynamicStore *a1, CFStringRef serviceID, CFStringRef entity, const void *a4, int a5)
{
  int valuePtr = a5;
  CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0, kSCDynamicStoreDomainState, serviceID, entity);
  if (!NetworkServiceEntity) {
    return 12;
  }
  CFStringRef v8 = NetworkServiceEntity;
  CFNumberRef v9 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  if (v9)
  {
    CFNumberRef v10 = v9;
    publish_keyentry(a1, v8, a4, v9);
    CFRelease(v10);
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = 12;
  }
  CFRelease(v8);
  return v11;
}

uint64_t unpublish_dictentry(const __SCDynamicStore *a1, CFStringRef serviceID, CFStringRef entity, const void *a4)
{
  CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0, kSCDynamicStoreDomainState, serviceID, entity);
  if (!NetworkServiceEntity) {
    return 12;
  }
  CFStringRef v7 = NetworkServiceEntity;
  unpublish_keyentry(a1, NetworkServiceEntity, a4);
  CFRelease(v7);
  return 0;
}

uint64_t publish_multiple_dicts(const __SCDynamicStore *a1, const __CFString *a2, CFArrayRef theArray, const __CFArray *a4)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  uint64_t result = 0xFFFFFFFFLL;
  if (theArray && a4)
  {
    CFIndex Count = CFArrayGetCount(theArray);
    if (Count == CFArrayGetCount(a4))
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (Count >= 1)
      {
        for (CFIndex i = 0; i != Count; ++i)
        {
          CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(theArray, i);
          uint64_t v13 = CFArrayGetValueAtIndex(a4, i);
          CFTypeID TypeID = CFStringGetTypeID();
          if (ValueAtIndex)
          {
            if (CFGetTypeID(ValueAtIndex) == TypeID)
            {
              CFTypeID v15 = CFDictionaryGetTypeID();
              if (v13)
              {
                if (CFGetTypeID(v13) == v15)
                {
                  CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0, kSCDynamicStoreDomainState, a2, ValueAtIndex);
                  if (NetworkServiceEntity)
                  {
                    CFStringRef v17 = NetworkServiceEntity;
                    CFDictionaryAddValue(Mutable, NetworkServiceEntity, v13);
                    CFRelease(v17);
                  }
                }
              }
            }
          }
        }
      }
      SCDynamicStoreSetMultiple(a1, Mutable, 0, 0);
      if (Mutable) {
        CFRelease(Mutable);
      }
      return 12;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return result;
}

uint64_t unpublish_dict(const __SCDynamicStore *a1, CFStringRef serviceID, CFStringRef entity)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  if (entity) {
    CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0, kSCDynamicStoreDomainState, serviceID, entity);
  }
  else {
    CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreate(0, @"%@/%@/%@/%@", kSCDynamicStoreDomainState, kSCCompNetwork, kSCCompService, serviceID);
  }
  CFStringRef v6 = NetworkServiceEntity;
  if (!NetworkServiceEntity) {
    return 12;
  }
  SCDynamicStoreRemoveValue(a1, NetworkServiceEntity);
  CFRelease(v6);
  return 0;
}

uint64_t unpublish_multiple_dicts(const __SCDynamicStore *a1, const __CFString *a2, const __CFArray *a3, int a4)
{
  if (!a1) {
    return 0xFFFFFFFFLL;
  }
  CFMutableDictionaryRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  if (a3)
  {
    CFIndex Count = CFArrayGetCount(a3);
    if (Count >= 1)
    {
      CFIndex v10 = Count;
      for (CFIndex i = 0; i != v10; ++i)
      {
        CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(a3, i);
        CFTypeID TypeID = CFStringGetTypeID();
        if (ValueAtIndex)
        {
          if (CFGetTypeID(ValueAtIndex) == TypeID)
          {
            CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0, kSCDynamicStoreDomainState, a2, ValueAtIndex);
            if (NetworkServiceEntity)
            {
              CFStringRef v15 = NetworkServiceEntity;
              CFArrayAppendValue(Mutable, NetworkServiceEntity);
              CFRelease(v15);
            }
          }
        }
      }
    }
  }
  if (a4)
  {
    CFStringRef v16 = SCDynamicStoreKeyCreate(0, @"%@/%@/%@/%@", kSCDynamicStoreDomainState, kSCCompNetwork, kSCCompService, a2);
    if (v16)
    {
      CFStringRef v17 = v16;
      CFArrayAppendValue(Mutable, v16);
      CFRelease(v17);
    }
  }
  SCDynamicStoreSetMultiple(a1, 0, Mutable, 0);
  if (Mutable) {
    CFRelease(Mutable);
  }
  return 12;
}

uint64_t publish_dictstrentry(const __SCDynamicStore *a1, CFStringRef serviceID, CFStringRef entity, const void *a4, const char *a5, CFStringEncoding a6)
{
  CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0, kSCDynamicStoreDomainState, serviceID, entity);
  if (!NetworkServiceEntity) {
    return 12;
  }
  CFStringRef v11 = NetworkServiceEntity;
  CFStringRef v12 = CFStringCreateWithCString(0, a5, a6);
  if (v12)
  {
    CFStringRef v13 = v12;
    publish_keyentry(a1, v11, a4, v12);
    CFRelease(v13);
    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v14 = 12;
  }
  CFRelease(v11);
  return v14;
}

uint64_t cfstring_is_ip(const __CFString *a1)
{
  v9.s_addr = 0;
  if (!isString(a1)) {
    return 0;
  }
  CFIndex Length = CFStringGetLength(a1);
  CFIndex usedBufLen = Length;
  if (!Length) {
    return 0;
  }
  CFIndex v3 = Length;
  CFPropertyListRef v4 = (UInt8 *)malloc_type_malloc(Length + 1, 0x351A353AuLL);
  if (!v4)
  {
    SCLog();
    return 0;
  }
  CFStringRef v5 = (char *)v4;
  v10.CFIndex location = 0;
  v10.length = v3;
  CFStringGetBytes(a1, v10, 0, 0, 0, v4, v3, &usedBufLen);
  v5[usedBufLen] = 0;
  uint64_t v6 = inet_aton(v5, &v9);
  free(v5);
  return v6;
}

CFStringRef copyPrimaryService(const __SCDynamicStore *a1)
{
  CFStringRef NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity(0, kSCDynamicStoreDomainState, kSCEntNetIPv4);
  if (NetworkGlobalEntity)
  {
    CFDictionaryRef v3 = (const __CFDictionary *)SCDynamicStoreCopyValue(a1, NetworkGlobalEntity);
    CFRelease(NetworkGlobalEntity);
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (!v3) {
      return 0;
    }
    if (CFGetTypeID(v3) == TypeID)
    {
      CFStringRef NetworkGlobalEntity = (const __CFString *)CFDictionaryGetValue(v3, kSCDynamicStorePropNetPrimaryService);
      CFTypeID v5 = CFStringGetTypeID();
      if (!NetworkGlobalEntity)
      {
LABEL_8:
        CFRelease(v3);
        return NetworkGlobalEntity;
      }
      if (CFGetTypeID(NetworkGlobalEntity) == v5)
      {
        CFRetain(NetworkGlobalEntity);
        goto LABEL_8;
      }
    }
    CFStringRef NetworkGlobalEntity = 0;
    goto LABEL_8;
  }
  return NetworkGlobalEntity;
}

uint64_t UpdatePasswordPrefs(const __CFString *a1, const void *a2, uint64_t a3, const void *a4, const void *a5)
{
  in_addr v9 = SCPreferencesCreate(0, @"UpdatePassword", 0);
  if (v9)
  {
    CFRange v10 = v9;
    if (SCPreferencesLock(v9, 1u))
    {
      CFStringRef v11 = SCNetworkServiceCopy(v10, a1);
      if (v11)
      {
        CFStringRef v12 = v11;
        Interface = SCNetworkServiceGetInterface(v11);
        if (!Interface) {
          goto LABEL_13;
        }
        uint64_t v14 = Interface;
        CFStringRef InterfaceType = SCNetworkInterfaceGetInterfaceType(Interface);
        if (!CFEqual(InterfaceType, a2)) {
          goto LABEL_13;
        }
        if (SCNetworkInterfaceCheckPassword() && !SCNetworkInterfaceRemovePassword()) {
          SCLog();
        }
        CFDictionaryRef Configuration = SCNetworkInterfaceGetConfiguration(v14);
        CFStringRef v17 = Configuration
            ? CFDictionaryCreateMutableCopy(0, 0, Configuration)
            : CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        CFDictionaryRef v19 = v17;
        if (v17)
        {
          if (a5) {
            CFDictionarySetValue(v17, a4, a5);
          }
          else {
            CFDictionaryRemoveValue(v17, a4);
          }
          if (SCNetworkInterfaceSetConfiguration(v14, v19)
            && SCPreferencesCommitChanges(v10)
            && SCPreferencesApplyChanges(v10))
          {
            uint64_t v18 = 1;
          }
          else
          {
            SCLog();
            uint64_t v18 = 0;
          }
          CFRelease(v19);
        }
        else
        {
LABEL_13:
          SCLog();
          uint64_t v18 = 0;
        }
        CFRelease(v12);
      }
      else
      {
        SCLog();
        uint64_t v18 = 0;
      }
      SCPreferencesUnlock(v10);
    }
    else
    {
      SCLog();
      uint64_t v18 = 0;
    }
    CFRelease(v10);
  }
  else
  {
    SCLog();
    return 0;
  }
  return v18;
}

uint64_t set_ifmtu(uint64_t a1, int a2)
{
  long long v8 = 0u;
  long long v9 = 0u;
  int v3 = socket(2, 2, 0);
  if (v3 < 0)
  {
    uint64_t v6 = __error();
    CFStringRef v7 = strerror(*v6);
    syslog(6, "sifmtu: cannot create ip socket, %s", v7);
    return 0;
  }
  else
  {
    int v4 = v3;
    __strlcpy_chk();
    LODWORD(v9) = a2;
    ioctl(v4, 0x80206934uLL, &v8);
    close(v4);
    return 1;
  }
}

uint64_t set_ifaddr(uint64_t a1, int a2, int a3, int a4)
{
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  int v7 = socket(2, 2, 0);
  if (v7 < 0)
  {
    CFRange v10 = __error();
    CFStringRef v11 = strerror(*v10);
    syslog(6, "sifaddr: cannot create ip socket, %s", v11);
  }
  else
  {
    int v8 = v7;
    __strlcpy_chk();
    *((void *)&v13 + 1) = 0;
    LODWORD(v13) = 528;
    DWORD1(v13) = a2;
    *((void *)&v14 + 1) = 0;
    LODWORD(v14) = 528;
    DWORD1(v14) = a3;
    long long v15 = 0uLL;
    if (a4)
    {
      LOWORD(v15) = 528;
      DWORD1(v15) = a4;
    }
    if ((ioctl(v8, 0x8040691AuLL, &v12) & 0x80000000) == 0 || *__error() == 17)
    {
      close(v8);
      return 1;
    }
    close(v8);
  }
  return 0;
}

BOOL clear_ifaddr(uint64_t a1, int a2)
{
  long long v9 = 0u;
  long long v10 = 0u;
  int v3 = socket(2, 2, 0);
  if (v3 < 0)
  {
    int v7 = __error();
    int v8 = strerror(*v7);
    syslog(6, "cifaddr: cannot create ip socket, %s", v8);
    return 0;
  }
  else
  {
    int v4 = v3;
    __strlcpy_chk();
    *((void *)&v10 + 1) = 0;
    LODWORD(v10) = 528;
    DWORD1(v10) = a2;
    int v5 = ioctl(v4, 0x80206919uLL, &v9);
    close(v4);
    return v5 >= 0;
  }
}

void *in6_len2mask(void *__b, int a2)
{
  int v3 = __b;
  size_t v4 = 0;
  *__b = 0;
  __b[1] = 0;
  if (a2 >= 8)
  {
    size_t v4 = (a2 >> 3) - 1 + 1;
    __b = memset(__b, 255, v4);
  }
  if (a2 <= 0) {
    int v5 = -(-a2 & 7);
  }
  else {
    int v5 = a2 & 7;
  }
  if (v5) {
    *((unsigned char *)v3 + v4) = 0xFF00u >> v5;
  }
  return __b;
}

uint64_t in6_maskaddr(uint64_t result, uint64_t a2)
{
  for (uint64_t i = 0; i != 16; ++i)
    *(unsigned char *)(result + i) &= *(unsigned char *)(a2 + i);
  return result;
}

void *in6_addr2net(uint64_t a1, int a2, uint64_t a3)
{
  v7[0] = 0;
  v7[1] = 0;
  uint64_t result = in6_len2mask(v7, a2);
  for (uint64_t i = 0; i != 16; ++i)
    *(unsigned char *)(a3 + i) = *((unsigned char *)v7 + i) & *(unsigned char *)(a1 + i);
  return result;
}

uint64_t set_ifaddr6(uint64_t a1, unsigned __int8 *a2, int a3)
{
  long long __b = 0uLL;
  int v5 = socket(30, 2, 0);
  if ((v5 & 0x80000000) == 0)
  {
    int v6 = v5;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    *(_OWORD *)&v14[16] = 0u;
    long long v15 = 0u;
    long long v13 = 0u;
    *(_OWORD *)long long v14 = 0u;
    __strlcpy_chk();
    *(_WORD *)long long v14 = 7708;
    *(_OWORD *)&v14[8] = *(_OWORD *)a2;
    WORD4(v16) = 7708;
    in6_len2mask(&__b, a3);
    long long v17 = __b;
    *((void *)&v19 + 1) = -1;
    if (*a2 == 254 && (a2[1] & 0xC0) == 0x80)
    {
      if (ioctl(v6, 0xC0806982uLL, &v13) < 0)
      {
        int v7 = __error();
        strerror(*v7);
        syslog(3, "set_ifaddr6: can't set link-local IPv6 address, %s");
LABEL_10:
        close(v6);
        return 0;
      }
    }
    else if (ioctl(v6, 0x8080691AuLL, &v13) < 0)
    {
      CFStringRef v11 = __error();
      strerror(*v11);
      syslog(3, "set_ifaddr6: can't set IPv6 address, %s");
      goto LABEL_10;
    }
    close(v6);
    return 1;
  }
  long long v9 = __error();
  long long v10 = strerror(*v9);
  syslog(3, "set_ifaddr6: can't create IPv6 socket, %s", v10);
  return 0;
}

uint64_t clear_ifaddr6(uint64_t a1, _OWORD *a2)
{
  int v3 = socket(30, 2, 0);
  if (v3 < 0)
  {
    int v6 = __error();
    int v7 = strerror(*v6);
    syslog(3, "set_ifaddr6: can't create IPv6 socket, %s", v7);
  }
  else
  {
    int v4 = v3;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    *(_OWORD *)&v11[16] = 0u;
    long long v12 = 0u;
    long long v10 = 0u;
    *(_OWORD *)CFStringRef v11 = 0u;
    __strlcpy_chk();
    *(_WORD *)CFStringRef v11 = 7708;
    *(_OWORD *)&v11[8] = *a2;
    if ((ioctl(v4, 0x81206919uLL, &v10) & 0x80000000) == 0)
    {
      close(v4);
      return 1;
    }
    int v8 = __error();
    long long v9 = strerror(*v8);
    syslog(3, "set_ifaddr6: can't set IPv6 address, %s", v9);
    close(v4);
  }
  return 0;
}

const char *inet_sockaddr_to_p(unsigned __int8 *a1, char *a2, socklen_t a3)
{
  int v6 = a1[1];
  if (v6 == 30)
  {
    int v7 = a1 + 8;
    return inet_ntop(v6, v7, a2, a3);
  }
  if (v6 == 2)
  {
    int v7 = a1 + 4;
    return inet_ntop(v6, v7, a2, a3);
  }
  return 0;
}

uint64_t inet_p_to_sockaddr(const char *a1, char *a2, unsigned int a3)
{
  bzero(a2, (int)a3);
  if (a3 < 0x10) {
    return 0;
  }
  char v6 = 2;
  if (inet_pton(2, a1, a2 + 4))
  {
    char v7 = 16;
LABEL_4:
    *a2 = v7;
    a2[1] = v6;
    return 1;
  }
  if (a3 < 0x1C) {
    return 0;
  }
  char v6 = 30;
  uint64_t result = inet_pton(30, a1, a2 + 8);
  if (result)
  {
    char v7 = 28;
    goto LABEL_4;
  }
  return result;
}

BOOL copyGateway(const __SCDynamicStore *a1, int a2, char *a3, int a4, void *a5, int a6)
{
  if (a3) {
    *a3 = 0;
  }
  if (a5) {
    bzero(a5, a6);
  }
  if (a2 != 30 && a2 != 2) {
    return 0;
  }
  long long v12 = (CFStringRef *)&kSCEntNetIPv6;
  if (a2 == 2) {
    long long v12 = (CFStringRef *)&kSCEntNetIPv4;
  }
  CFStringRef NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity(0, kSCDynamicStoreDomainState, *v12);
  if (NetworkGlobalEntity)
  {
    CFDictionaryRef v14 = (const __CFDictionary *)SCDynamicStoreCopyValue(a1, NetworkGlobalEntity);
    CFRelease(NetworkGlobalEntity);
    if (v14)
    {
      CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v14, kSCDynamicStorePropNetPrimaryInterface);
      LODWORD(NetworkGlobalEntity) = Value != 0;
      if (a3 && Value)
      {
        CFStringGetCString(Value, a3, a4, 0x8000100u);
        LODWORD(NetworkGlobalEntity) = 1;
      }
      long long v16 = (const void **)&kSCPropNetIPv4Router;
      if (a2 != 2) {
        long long v16 = (const void **)&kSCPropNetIPv6Router;
      }
      CFStringRef v17 = (const __CFString *)CFDictionaryGetValue(v14, *v16);
      if (v17 && (buffer[0] = 0, CFStringGetCString(v17, buffer, 256, 0x8000100u), buffer[0]))
      {
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        *(_OWORD *)size_t __len = 0u;
        long long v23 = 0u;
        int v18 = inet_p_to_sockaddr(buffer, (char *)__len, 0x80u);
        BOOL v19 = v18 != 0;
        if (a5 && v18)
        {
          if (LOBYTE(__len[0]) <= a6) {
            memmove(a5, __len, LOBYTE(__len[0]));
          }
          BOOL v19 = 1;
        }
      }
      else
      {
        BOOL v19 = 0;
      }
      CFRelease(v14);
      goto LABEL_28;
    }
    LODWORD(NetworkGlobalEntity) = 0;
  }
  BOOL v19 = 0;
LABEL_28:
  if (NetworkGlobalEntity) {
    BOOL v21 = !v19;
  }
  else {
    BOOL v21 = 1;
  }
  return !v21;
}

BOOL hasGateway(const __SCDynamicStore *a1, int a2)
{
  return copyGateway(a1, a2, 0, 0, 0, 0);
}

__CFDictionary *create_ipv6_dummy_primary(uint64_t a1)
{
  int valuePtr = 1;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    int v3 = CFArrayCreateMutable(0, 1, &kCFTypeArrayCallBacks);
    if (v3)
    {
      int v4 = v3;
      CFArrayAppendValue(v3, @"::1");
      CFDictionarySetValue(Mutable, kSCPropNetIPv6Addresses, v4);
      CFRelease(v4);
    }
    CFDictionarySetValue(Mutable, kSCPropNetIPv6Router, @"::1");
    CFNumberRef v5 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
    if (v5)
    {
      CFNumberRef v6 = v5;
      CFDictionarySetValue(Mutable, kSCPropNetOverridePrimary, v5);
      CFRelease(v6);
    }
    CFDictionarySetValue(Mutable, @"IsNULL", kCFBooleanTrue);
    if (a1)
    {
      CFStringRef v7 = CFStringCreateWithFormat(0, 0, @"%s", a1);
      if (v7)
      {
        CFStringRef v8 = v7;
        CFDictionarySetValue(Mutable, kSCPropInterfaceName, v7);
        CFRelease(v8);
      }
    }
  }
  return Mutable;
}

__CFDictionary *create_stateaddr(int a1, int a2, uint64_t a3, unsigned int a4, unsigned int a5, unsigned int a6, int a7, int a8, void *value, void *a10)
{
  int valuePtr = a8;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    CFMutableArrayRef v15 = CFArrayCreateMutable(0, 1, &kCFTypeArrayCallBacks);
    if (v15)
    {
      long long v16 = v15;
      CFStringRef v17 = CFStringCreateWithFormat(0, 0, @"%d.%d.%d.%d", a5, BYTE1(a5), BYTE2(a5), HIBYTE(a5));
      if (v17)
      {
        CFStringRef v18 = v17;
        CFArrayAppendValue(v16, v17);
        CFRelease(v18);
        CFDictionarySetValue(Mutable, kSCPropNetIPv4Addresses, v16);
      }
      CFRelease(v16);
    }
    CFStringRef v19 = CFStringCreateWithFormat(0, 0, @"%d.%d.%d.%d", a6, BYTE1(a6), BYTE2(a6), HIBYTE(a6));
    if (v19)
    {
      CFStringRef v20 = v19;
      CFDictionarySetValue(Mutable, kSCPropNetIPv4Router, v19);
      CFRelease(v20);
    }
    CFNumberRef v21 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    if (v21)
    {
      CFNumberRef v22 = v21;
      CFDictionarySetValue(Mutable, kSCPropNetOverridePrimary, v21);
      CFRelease(v22);
    }
    if (a3)
    {
      CFStringRef v23 = CFStringCreateWithFormat(0, 0, @"%s", a3);
      if (v23)
      {
        CFStringRef v24 = v23;
        CFDictionarySetValue(Mutable, kSCPropInterfaceName, v23);
        CFRelease(v24);
      }
    }
    CFStringRef v25 = CFStringCreateWithFormat(0, 0, @"%d.%d.%d.%d", a4, BYTE1(a4), BYTE2(a4), HIBYTE(a4));
    if (v25)
    {
      CFStringRef v26 = v25;
      CFDictionarySetValue(Mutable, @"ServerAddress", v25);
      CFRelease(v26);
    }
    if (!valuePtr)
    {
      uint64_t v27 = _SCNetworkServiceCopyActive();
      if (v27)
      {
        long long v28 = (const void *)v27;
        SCNetworkServiceSetPrimaryRank();
        CFRelease(v28);
      }
    }
    if (value) {
      CFDictionarySetValue(Mutable, kSCPropNetIPv4AdditionalRoutes, value);
    }
    if (a10) {
      CFDictionarySetValue(Mutable, kSCPropNetIPv4ExcludedRoutes, a10);
    }
  }
  return Mutable;
}

const __SCDynamicStore *create_dns(const __SCDynamicStore *a1, CFStringRef serviceID, const void *a3, const void *a4, const void *a5, int a6)
{
  CFMutableStringRef MutableCopy = a1;
  if (a1)
  {
    CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0, kSCDynamicStoreDomainState, serviceID, kSCEntNetDNS);
    if (NetworkServiceEntity)
    {
      CFStringRef v13 = NetworkServiceEntity;
      CFDictionaryRef v14 = (const __CFDictionary *)SCDynamicStoreCopyValue(MutableCopy, NetworkServiceEntity);
      if (v14)
      {
        CFDictionaryRef v15 = v14;
        CFMutableStringRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v14);
        CFRelease(v15);
        if (!MutableCopy) {
          goto LABEL_16;
        }
      }
      else
      {
        CFMutableStringRef MutableCopy = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        if (!MutableCopy)
        {
LABEL_16:
          CFRelease(v13);
          return MutableCopy;
        }
      }
      CFTypeID v16 = CFGetTypeID(MutableCopy);
      if (v16 == CFDictionaryGetTypeID())
      {
        CFDictionarySetValue(MutableCopy, kSCPropNetDNSServerAddresses, a3);
        if (a4) {
          CFDictionarySetValue(MutableCopy, kSCPropNetDNSDomainName, a4);
        }
        if (a5) {
          CFDictionarySetValue(MutableCopy, kSCPropNetDNSSupplementalMatchDomains, a5);
        }
        if (a6) {
          AddNumber(MutableCopy, kSCPropNetDNSSupplementalMatchDomainsNoSearch, 1);
        }
        CFDictionarySetValue(MutableCopy, kSCPropNetDNSConfirmedServiceID, serviceID);
        notify_post("com.apple.system.dns.delay");
      }
      goto LABEL_16;
    }
    return 0;
  }
  return MutableCopy;
}

BOOL equal_address(uint64_t a1, uint64_t a2)
{
  int v2 = *(unsigned __int8 *)(a1 + 1);
  if (v2 != *(unsigned __int8 *)(a2 + 1)) {
    return 0;
  }
  if (v2 == 30) {
    return *(void *)(a1 + 8) == *(void *)(a2 + 8) && *(void *)(a1 + 16) == *(void *)(a2 + 16);
  }
  if (v2 != 2) {
    return 0;
  }
  return *(_DWORD *)(a1 + 4) == *(_DWORD *)(a2 + 4);
}

uint64_t route_gateway(int a1, uint64_t a2, _OWORD *a3, _OWORD *a4, int a5, int a6)
{
  if (!a2) {
    return 0xFFFFFFFFLL;
  }
  int v7 = *(unsigned __int8 *)(a2 + 1);
  if (v7 == 30 || v7 == 2)
  {
    int v14 = socket(17, 3, 17);
    if (v14 < 0)
    {
      CFStringRef v19 = __error();
      CFStringRef v20 = strerror(*v19);
      syslog(6, "route_gateway: open routing socket failed, %s", v20);
    }
    else
    {
      int v15 = v14;
      long long v27 = 0u;
      long long v28 = 0u;
      memset(v32, 0, sizeof(v32));
      long long v31 = 0u;
      long long v30 = 0u;
      long long v29 = 0u;
      char v26 = a1;
      if (a5) {
        unsigned int v16 = 2051;
      }
      else {
        unsigned int v16 = 2049;
      }
      if (a6) {
        v16 |= 0x1000u;
      }
      char v25 = 5;
      LODWORD(v28) = 1;
      *(void *)((char *)&v27 + 4) = v16 | 0x700000000;
      if (*(unsigned char *)(a2 + 1) == 2)
      {
        *(_OWORD *)&v32[8] = *(_OWORD *)a2;
        if (a4) {
          *(_OWORD *)&v32[24] = *a4;
        }
        if (a3) {
          *(_OWORD *)&v32[40] = *a3;
        }
        unsigned int v17 = 140;
      }
      else
      {
        *(_OWORD *)&v32[8] = *(_OWORD *)a2;
        *(_OWORD *)&v32[20] = *(_OWORD *)(a2 + 12);
        if (a4)
        {
          *(_OWORD *)&v32[36] = *a4;
          *(_OWORD *)&v32[48] = *(_OWORD *)((char *)a4 + 12);
        }
        if (a3)
        {
          *(_OWORD *)&v32[64] = *a3;
          *(_OWORD *)&v32[76] = *(_OWORD *)((char *)a3 + 12);
        }
        unsigned int v17 = 176;
      }
      __int16 __buf = v17;
      if ((write(v14, &__buf, v17) & 0x8000000000000000) == 0)
      {
        close(v15);
        return 0;
      }
      if (a1 == 2) {
        int v21 = 7;
      }
      else {
        int v21 = 3;
      }
      CFNumberRef v22 = __error();
      CFStringRef v23 = strerror(*v22);
      syslog(v21, "route_gateway: write routing socket failed, %s", v23);
      close(v15);
    }
  }
  return 0xFFFFFFFFLL;
}

uint64_t set_host_gateway(int a1, uint64_t a2, uint64_t a3, const char *a4, int a5)
{
  if (!a2) {
    return 0;
  }
  int v6 = *(unsigned __int8 *)(a2 + 1);
  if (v6 != 30 && v6 != 2) {
    return 0;
  }
  int v12 = socket(17, 3, 17);
  if (v12 < 0)
  {
    unsigned int v16 = __error();
    unsigned int v17 = strerror(*v16);
    syslog(6, "host_gateway: open routing socket failed, %s", v17);
    return 0;
  }
  int v13 = v12;
  int v34 = 0;
  long long v33 = 0u;
  memset(v32, 0, sizeof(v32));
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long __buf = 0u;
  BYTE3(__buf) = a1;
  if (a5) {
    int v14 = 2305;
  }
  else {
    int v14 = 2053;
  }
  DWORD2(__buf) = v14;
  if (a3)
  {
    int v15 = *(unsigned __int8 *)(a3 + 1);
    if (v15 != 30)
    {
      if (v15 != 2 || !*(_DWORD *)(a3 + 4)) {
        goto LABEL_22;
      }
LABEL_21:
      DWORD2(__buf) = v14 | 2;
      goto LABEL_22;
    }
    if (*(void *)(a3 + 8)) {
      BOOL v18 = 0;
    }
    else {
      BOOL v18 = *(void *)(a3 + 16) == 0;
    }
    if (!v18) {
      goto LABEL_21;
    }
  }
LABEL_22:
  BYTE2(__buf) = 5;
  DWORD1(v28) = 1;
  HIDWORD(__buf) = 7;
  if (*(unsigned char *)(a2 + 1) == 2)
  {
    *(_OWORD *)((char *)v32 + 12) = *(_OWORD *)a2;
    if (a3) {
      *(_OWORD *)((char *)&v32[1] + 12) = *(_OWORD *)a3;
    }
    WORD6(v32[2]) = 528;
    LODWORD(v32[3]) = -1;
    CFStringRef v19 = (char *)&v32[3] + 12;
    unsigned int v20 = 160;
    if (a4)
    {
LABEL_26:
      *(_WORD *)CFStringRef v19 = 4628;
      size_t v21 = strlen(a4);
      if (v21 >= 0xC) {
        size_t v22 = 12;
      }
      else {
        size_t v22 = v21;
      }
      v19[5] = v22;
      HIDWORD(__buf) = 23;
      memmove(v19 + 8, a4, v22);
      goto LABEL_34;
    }
  }
  else
  {
    *(_OWORD *)((char *)v32 + 12) = *(_OWORD *)a2;
    *(_OWORD *)((char *)&v32[1] + 8) = *(_OWORD *)(a2 + 12);
    if (a3)
    {
      *(_OWORD *)((char *)&v32[2] + 8) = *(_OWORD *)a3;
      *(_OWORD *)((char *)&v32[3] + 4) = *(_OWORD *)(a3 + 12);
    }
    WORD2(v32[4]) = 7708;
    CFStringRef v19 = (char *)&v33;
    *(void *)((char *)&v32[4] + 12) = -1;
    *(void *)((char *)&v32[5] + 4) = -1;
    unsigned int v20 = 196;
    if (a4) {
      goto LABEL_26;
    }
  }
  v20 -= 20;
LABEL_34:
  LOWORD(__buf) = v20;
  if ((write(v13, &__buf, v20) & 0x8000000000000000) == 0)
  {
    close(v13);
    return 1;
  }
  if (a1 == 2) {
    int v24 = 7;
  }
  else {
    int v24 = 3;
  }
  char v25 = __error();
  char v26 = strerror(*v25);
  syslog(v24, "host_gateway: write routing socket failed, command %d, %s", a1, v26);
  close(v13);
  return 0;
}

__CFDictionary *create_proxies(uint64_t a1, uint64_t a2, int a3, const void *a4, int a5, int a6, const __CFString *a7, const void *a8)
{
  int v23 = a6;
  int v24 = a5;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  if (Mutable)
  {
    int valuePtr = 1;
    CFNumberRef v13 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    if (v13)
    {
      CFNumberRef v14 = v13;
      if (a3)
      {
        CFDictionarySetValue(Mutable, kSCPropNetProxiesProxyAutoDiscoveryEnable, v13);
      }
      else if (a4)
      {
        CFDictionarySetValue(Mutable, kSCPropNetProxiesFTPEnable, v13);
        CFDictionarySetValue(Mutable, kSCPropNetProxiesHTTPEnable, v14);
        CFDictionarySetValue(Mutable, kSCPropNetProxiesHTTPSEnable, v14);
        CFNumberRef v16 = CFNumberCreate(0, kCFNumberIntType, &v24);
        if (!v16) {
          goto LABEL_7;
        }
        CFNumberRef v17 = v16;
        CFDictionarySetValue(Mutable, kSCPropNetProxiesFTPPort, v16);
        CFDictionarySetValue(Mutable, kSCPropNetProxiesHTTPPort, v17);
        CFDictionarySetValue(Mutable, kSCPropNetProxiesHTTPSPort, v17);
        CFRelease(v17);
        CFDictionarySetValue(Mutable, kSCPropNetProxiesFTPProxy, a4);
        CFDictionarySetValue(Mutable, kSCPropNetProxiesHTTPProxy, a4);
        CFDictionarySetValue(Mutable, kSCPropNetProxiesHTTPSProxy, a4);
        CFNumberRef v18 = CFNumberCreate(0, kCFNumberIntType, &v23);
        if (!v18)
        {
LABEL_7:
          CFRelease(v14);
          return Mutable;
        }
        CFNumberRef v19 = v18;
        CFDictionarySetValue(Mutable, kSCPropNetProxiesExcludeSimpleHostnames, v18);
        CFRelease(v19);
        if (a7)
        {
          CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, a7, @";");
          if (ArrayBySeparatingStrings)
          {
            CFArrayRef v21 = ArrayBySeparatingStrings;
            CFDictionarySetValue(Mutable, kSCPropNetProxiesExceptionsList, ArrayBySeparatingStrings);
            CFRelease(v21);
          }
        }
      }
      if (a8) {
        CFDictionarySetValue(Mutable, kSCPropNetProxiesSupplementalMatchDomains, a8);
      }
      goto LABEL_7;
    }
  }
  return Mutable;
}

uint64_t create_tun_interface(void *a1, socklen_t a2, unsigned int *a3, int a4, int a5)
{
  memset(v14, 0, sizeof(v14));
  socklen_t v13 = 0;
  uint64_t v10 = socket(32, 2, 2);
  if (v10 == -1)
  {
    __error();
    SCLog();
    return v10;
  }
  int v16 = 0;
  memset(v15, 0, sizeof(v15));
  __strlcpy_chk();
  if (ioctl(v10, 0xC0644E03uLL, v15))
  {
    __error();
LABEL_11:
    SCLog();
    close(v10);
    return 0xFFFFFFFFLL;
  }
  *(_DWORD *)&v14[0].sa_len = 139296;
  *(_DWORD *)&v14[0].sa_data[2] = v15[0];
  memset(&v14[0].sa_data[6], 0, 24);
  if (!a4)
  {
    if (!connect(v10, v14, 0x20u)) {
      goto LABEL_14;
    }
LABEL_10:
    __error();
    goto LABEL_11;
  }
  if (bind(v10, v14, 0x20u)) {
    goto LABEL_10;
  }
  int v12 = a4;
  socklen_t v13 = 4;
  if (setsockopt(v10, 2, 1, &v12, 4u) || connect(v10, v14, 0x20u)) {
    goto LABEL_17;
  }
LABEL_14:
  socklen_t v13 = a2;
  if (getsockopt(v10, 2, 2, a1, &v13)
    || (*a3 = if_nametoindex((const char *)a1), a5) && (int v12 = 1, setsockopt(v10, 2, 3, &v12, 4u)))
  {
LABEL_17:
    __error();
    goto LABEL_11;
  }
  return v10;
}

uint64_t set_tun_delegate(int a1, char *__s)
{
  socklen_t v4 = strlen(__s);
  uint64_t v5 = setsockopt(a1, 2, 15, __s, v4);
  if (v5)
  {
    int v6 = __error();
    strerror(*v6);
    SCLog();
  }
  return v5;
}

uint64_t event_create_socket(void *a1, CFSocketNativeHandle *a2, CFSocketRef *a3, void (__cdecl *a4)(CFSocketRef, CFSocketCallBackType, CFDataRef, const void *, void *), int a5)
{
  context.version = 0;
  memset(&context.retain, 0, 24);
  context.mach_timebase_info info = a1;
  BOOL v16 = 0;
  uint64_t v15 = 0;
  int v9 = socket(32, 3, 1);
  *a2 = v9;
  if (v9 < 0)
  {
    __error();
    SCLog();
  }
  else
  {
    uint64_t v15 = 0x100000001;
    BOOL v16 = a5 == 0;
    ioctl(v9, 0x800C6502uLL, &v15);
    uint64_t v10 = CFSocketCreateWithNative(0, *a2, 1uLL, a4, &context);
    *a3 = v10;
    if (!v10) {
      goto LABEL_8;
    }
    CFRunLoopSourceRef RunLoopSource = CFSocketCreateRunLoopSource(0, v10, 0);
    if (RunLoopSource)
    {
      int v12 = RunLoopSource;
      CFAbsoluteTime Current = CFRunLoopGetCurrent();
      CFRunLoopAddSource(Current, v12, kCFRunLoopDefaultMode);
      CFRelease(v12);
      return 0;
    }
  }
  if (!*a3)
  {
LABEL_8:
    if ((*a2 & 0x80000000) == 0) {
      close(*a2);
    }
    goto LABEL_10;
  }
  CFSocketInvalidate(*a3);
  CFRelease(*a3);
LABEL_10:
  *a3 = 0;
  uint64_t result = 0xFFFFFFFFLL;
  *a2 = -1;
  return result;
}

__CFData *SCNCPluginExecCallbackRunLoopSourceInit(CFRunLoopRef Current, uint64_t a2, uint64_t a3)
{
  CFMutableDictionaryRef Mutable = CFDataCreateMutable(0, 264);
  int v7 = Mutable;
  if (Mutable)
  {
    CFDataSetLength(Mutable, 264);
    MutableBytePtr = CFDataGetMutableBytePtr(v7);
    CFRunLoopRef v10 = 0;
    v12.version = 0;
    memset(&v12.retain, 0, 56);
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v23 = 0;
    v12.mach_timebase_info info = v7;
    v12.perform = (void (__cdecl *)(void *))sub_1C7D8;
    CFRunLoopSourceRef v11 = CFRunLoopSourceCreate(0, 0, &v12);
    if (v11)
    {
      *((void *)&v22 + 1) = a2;
      uint64_t v23 = a3;
      if (!Current) {
        CFAbsoluteTime Current = CFRunLoopGetCurrent();
      }
      CFRunLoopRef v10 = Current;
      CFRetain(Current);
      CFRunLoopAddSource(Current, v11, kCFRunLoopDefaultMode);
      memmove(MutableBytePtr, &v10, 0x108uLL);
    }
    else
    {
      CFRelease(v7);
      return 0;
    }
  }
  return v7;
}

void sub_1C7D8(__CFData *a1)
{
  CFTypeID TypeID = CFDataGetTypeID();
  if (a1 && CFGetTypeID(a1) == TypeID)
  {
    MutableBytePtr = CFDataGetMutableBytePtr(a1);
    socklen_t v4 = MutableBytePtr;
    uint64_t v5 = (void (*)(void, void, UInt8 *, void))*((void *)MutableBytePtr + 31);
    if (v5) {
      v5(*((unsigned int *)MutableBytePtr + 24), *((unsigned int *)MutableBytePtr + 25), MutableBytePtr + 104, *((void *)MutableBytePtr + 32));
    }
    CFRunLoopSourceInvalidate(*((CFRunLoopSourceRef *)v4 + 1));
    CFRelease(*((CFTypeRef *)v4 + 1));
    CFRelease(*(CFTypeRef *)v4);
    CFRelease(a1);
  }
}

uint64_t SCNCPluginExecCommand(__CFRunLoop *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  CFRunLoopSourceRef v11 = SCNCPluginExecCallbackRunLoopSourceInit(a1, a2, a3);
  if (v11)
  {
    return __SCDPluginExecCommand(sub_1C908, v11, a4, a5, a6, a7);
  }
  else
  {
    SCLog();
    return 0xFFFFFFFFLL;
  }
}

void sub_1C908(int a1, int a2, const void *a3, __CFData *a4)
{
  CFTypeID TypeID = CFDataGetTypeID();
  if (a4 && CFGetTypeID(a4) == TypeID)
  {
    MutableBytePtr = CFDataGetMutableBytePtr(a4);
    *((_DWORD *)MutableBytePtr + 24) = a1;
    *((_DWORD *)MutableBytePtr + 25) = a2;
    memmove(MutableBytePtr + 104, a3, 0x90uLL);
    CFRunLoopSourceSignal(*((CFRunLoopSourceRef *)MutableBytePtr + 1));
    CFRunLoopRef v10 = *(__CFRunLoop **)MutableBytePtr;
    CFRunLoopWakeUp(v10);
  }
}

uint64_t SCNCPluginExecCommand2(__CFRunLoop *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  long long v14 = SCNCPluginExecCallbackRunLoopSourceInit(a1, a2, a3);
  if (v14)
  {
    return __SCDPluginExecCommand2(sub_1C908, v14, a4, a5, a6, a7, a8, a9);
  }
  else
  {
    SCLog();
    return 0xFFFFFFFFLL;
  }
}

uint64_t SCNCExecSBSLauncherCommandWithArguments(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  CFURLRef v14 = CFBundleCopyResourcesDirectoryURL((CFBundleRef)gBundleRef);
  if (!v14) {
    return 0;
  }
  CFURLRef v15 = v14;
  memset(v29, 0, sizeof(v29));
  CFURLRef v16 = CFURLCopyAbsoluteURL(v14);
  if (v16)
  {
    CFURLRef v17 = v16;
    CFStringRef v18 = CFURLCopyPath(v16);
    if (v18)
    {
      CFStringRef v19 = v18;
      if (CFStringGetCString(v18, buffer, 1024, 0))
      {
        __strlcat_chk();
        *(void *)&v29[0] = "sbslauncher";
        *((void *)&v29[0] + 1) = a1;
        long long v28 = &a10;
        uint64_t v20 = a9;
        if (a9)
        {
          unint64_t v21 = 2;
          do
          {
            uint64_t v22 = v21 + 1;
            *((void *)v29 + v21) = v20;
            uint64_t v23 = v28++;
            uint64_t v20 = *v23;
            if (v20) {
              BOOL v24 = v21 >= 0xE;
            }
            else {
              BOOL v24 = 1;
            }
            ++v21;
          }
          while (!v24);
        }
        else
        {
          uint64_t v22 = 2;
        }
        *((void *)v29 + v22) = 0;
        if (a2) {
          uint64_t v26 = SCNCPluginExecCommand2(0, a3, a4, 0, 0, (uint64_t)buffer, (uint64_t)v29, a2, a4);
        }
        else {
          uint64_t v26 = SCNCPluginExecCommand(0, a3, a4, 0, 0, (uint64_t)buffer, (uint64_t)v29);
        }
        uint64_t v25 = v26;
      }
      else
      {
        uint64_t v25 = 0;
      }
      CFRelease(v19);
    }
    else
    {
      uint64_t v25 = 0;
    }
    CFRelease(v17);
  }
  else
  {
    uint64_t v25 = 0;
  }
  CFRelease(v15);
  return v25;
}

CFIndex extractEnvironmentVariablesApplierFunction(const __CFString *a1, const __CFString *a2, uint64_t a3)
{
  CFTypeID TypeID = CFStringGetTypeID();
  if (a1 && CFGetTypeID(a1) == TypeID)
  {
    uint64_t v7 = *(int *)(a3 + 528);
    CFStringRef v8 = (UInt8 *)(*(void *)(a3 + 512) + (v7 << 8));
    uint64_t v9 = *(void *)(a3 + 520);
    *CFStringRef v8 = 0;
    CFIndex Length = CFStringGetLength(a1);
    if ((unint64_t)(Length - 256) < 0xFFFFFFFFFFFFFF01) {
      return SCLog();
    }
    CFIndex v11 = Length;
    v21.CFIndex location = 0;
    v21.length = Length;
    if (CFStringGetBytes(a1, v21, 0x8000100u, 0, 0, v8, 256, 0) <= 0) {
      return SCLog();
    }
    CFRunLoopSourceContext v12 = (UInt8 *)(v9 + (v7 << 8));
    v8[v11] = 0;
    ++*(_DWORD *)(a3 + 528);
    UInt8 *v12 = 0;
    CFTypeID v13 = CFStringGetTypeID();
    if (!a2)
    {
      CFNumberGetTypeID();
      CFBooleanGetTypeID();
      return SCLog();
    }
    if (CFGetTypeID(a2) == v13)
    {
      CFIndex v14 = CFStringGetLength(a2);
      if ((unint64_t)(v14 - 256) >= 0xFFFFFFFFFFFFFF01)
      {
        CFIndex v15 = v14;
        v22.CFIndex location = 0;
        v22.length = v14;
        CFIndex result = CFStringGetBytes(a2, v22, 0x8000100u, 0, 0, v12, 256, 0);
        if (result > 0)
        {
          v12[v15] = 0;
          return result;
        }
      }
      return SCLog();
    }
    CFTypeID v17 = CFNumberGetTypeID();
    if (CFGetTypeID(a2) == v17)
    {
      uint64_t valuePtr = 0;
      if (CFNumberGetValue((CFNumberRef)a2, kCFNumberSInt64Type, &valuePtr)) {
        return snprintf((char *)v12, 0x100uLL, "%lld");
      }
      return SCLog();
    }
    CFTypeID v18 = CFBooleanGetTypeID();
    if (CFGetTypeID(a2) != v18) {
      return SCLog();
    }
    CFBooleanGetValue((CFBooleanRef)a2);
    return snprintf((char *)v12, 0x100uLL, "%s");
  }
  else
  {
    return SCLog();
  }
}

CFPropertyListRef collectEnvironmentVariables(const __SCDynamicStore *a1, const __CFString *a2)
{
  if (a1 && a2)
  {
    return copyEntity(a1, kSCDynamicStoreDomainSetup, a2, @"EnvironmentVariables");
  }
  else
  {
    SCLog();
    return 0;
  }
}

void extractEnvironmentVariables(const void *a1, uint64_t a2)
{
  if (a1)
  {
    CFTypeID TypeID = CFDictionaryGetTypeID();
    if (CFGetTypeID(a1) != TypeID || CFDictionaryGetCount((CFDictionaryRef)a1) < 1) {
      goto LABEL_13;
    }
    CFIndex Count = CFDictionaryGetCount((CFDictionaryRef)a1);
    int v6 = *(void **)(a2 + 512);
    if (v6)
    {
      free(v6);
      *(void *)(a2 + 512) = 0;
    }
    uint64_t v7 = *(void **)(a2 + 520);
    if (v7)
    {
      free(v7);
      *(void *)(a2 + 520) = 0;
    }
    *(_DWORD *)(a2 + 528) = 0;
    size_t v8 = Count << 8;
    *(void *)(a2 + 512) = malloc_type_malloc(v8, 0x1000040104B78CFuLL);
    uint64_t v9 = malloc_type_malloc(v8, 0x1000040104B78CFuLL);
    *(void *)(a2 + 520) = v9;
    if (*(void *)(a2 + 512) && v9)
    {
      CFDictionaryApplyFunction((CFDictionaryRef)a1, (CFDictionaryApplierFunction)extractEnvironmentVariablesApplierFunction, (void *)a2);
    }
    else
    {
LABEL_13:
      SCLog();
    }
  }
}

void applyEnvironmentVariables(uint64_t a1)
{
  if (*(int *)(a1 + 528) >= 1)
  {
    uint64_t v2 = 0;
    uint64_t v3 = 0;
    do
    {
      uint64_t v4 = *(void *)(a1 + 512);
      if (v4)
      {
        unsetenv((const char *)(v4 + v2));
        uint64_t v5 = *(void *)(a1 + 520);
        if (v5) {
          setenv((const char *)(*(void *)(a1 + 512) + v2), (const char *)(v5 + v2), 1);
        }
      }
      ++v3;
      v2 += 256;
    }
    while (v3 < *(int *)(a1 + 528));
  }
  *(_DWORD *)(a1 + 528) = 0;
  int v6 = *(void **)(a1 + 512);
  if (v6)
  {
    free(v6);
    *(void *)(a1 + 512) = 0;
  }
  uint64_t v7 = *(void **)(a1 + 520);
  if (v7)
  {
    free(v7);
    *(void *)(a1 + 520) = 0;
  }
}

char *scnc_get_reason_str(int a1)
{
  switch(a1)
  {
    case 1:
      CFIndex result = scnc_ctrl_stopped[0];
      break;
    case 2:
      CFIndex result = scnc_sys_sleep[0];
      break;
    case 3:
      CFIndex result = scnc_usr_logout[0];
      break;
    case 4:
      CFIndex result = scnc_usr_switch[0];
      break;
    case 5:
    case 6:
      CFIndex result = scnc_sock_disco[0];
      break;
    case 7:
      CFIndex result = scnc_plugin_chg[0];
      break;
    case 8:
      CFIndex result = scnc_app_rem[0];
      break;
    case 9:
    case 10:
      CFIndex result = scnc_usr_req[0];
      break;
    case 11:
      CFIndex result = scnc_term_all[0];
      break;
    case 12:
      CFIndex result = scnc_serv_disp[0];
      break;
    default:
      CFIndex result = 0;
      break;
  }
  return result;
}

char *ppp_error_to_string(int a1)
{
  CFIndex result = 0;
  switch(a1)
  {
    case 1:
      CFIndex result = ppp_fatal[0];
      break;
    case 2:
      CFIndex result = ppp_option[0];
      break;
    case 3:
      CFIndex result = ppp_not_root[0];
      break;
    case 4:
      CFIndex result = ppp_no_kern[0];
      break;
    case 5:
      CFIndex result = ppp_user_req[0];
      break;
    case 6:
      CFIndex result = ppp_lock_fail[0];
      break;
    case 7:
      CFIndex result = ppp_open_fail[0];
      break;
    case 8:
      CFIndex result = ppp_conn_fail[0];
      break;
    case 9:
      CFIndex result = ppp_pty_fail[0];
      break;
    case 10:
      CFIndex result = ppp_nego_fail[0];
      break;
    case 11:
      CFIndex result = ppp_peer_auth_fail[0];
      break;
    case 12:
      CFIndex result = ppp_idle_tmo[0];
      break;
    case 13:
      CFIndex result = ppp_sess_tmo[0];
      break;
    case 14:
      CFIndex result = ppp_callback[0];
      break;
    case 15:
      CFIndex result = ppp_peer_dead[0];
      break;
    case 16:
      CFIndex result = ppp_disco_by_dev[0];
      break;
    case 17:
      CFIndex result = ppp_loopback[0];
      break;
    case 18:
      CFIndex result = ppp_init_fail[0];
      break;
    case 19:
      CFIndex result = ppp_auth_fail[0];
      break;
    case 20:
      CFIndex result = ppp_term_fail[0];
      break;
    case 21:
      CFIndex result = ppp_dev_err[0];
      break;
    case 23:
      CFIndex result = ppp_peer_unauth[0];
      break;
    case 24:
      CFIndex result = ppp_cnid_auth_fail[0];
      break;
    case 25:
      CFIndex result = ppp_peer_unreach[0];
      break;
    default:
      return result;
  }
  return result;
}

char *ppp_dev_error_to_string(int a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a1)
  {
    if (a1 != 2)
    {
      if (a1 == 5)
      {
        CFIndex result = 0;
        switch(a2)
        {
          case 1:
            goto LABEL_10;
          case 2:
            goto LABEL_12;
          case 5:
            CFIndex result = ppp_dev_prot_err[0];
            break;
          case 6:
            CFIndex result = ppp_dev_net_chg[0];
            break;
          case 7:
            CFIndex result = ppp_dev_psk[0];
            break;
          case 8:
            CFIndex result = ppp_dev_cert[0];
            break;
          default:
            return result;
        }
        return result;
      }
      return 0;
    }
    switch(a2)
    {
      case 1:
LABEL_10:
        CFIndex result = ppp_dev_no_srvr[0];
        break;
      case 2:
        CFIndex result = ppp_dev_no_srvc[0];
        break;
      case 3:
        CFIndex result = ppp_dev_no_ac[0];
        break;
      case 4:
        CFIndex result = ppp_dev_no_ac_srvc[0];
        break;
      case 5:
        CFIndex result = ppp_dev_conn_refuse[0];
        break;
      default:
        return 0;
    }
  }
  else
  {
    CFIndex result = 0;
    switch(a2)
    {
      case 1:
        CFIndex result = ppp_dev_no_car[0];
        break;
      case 2:
        CFIndex result = ppp_dev_no_num[0];
        break;
      case 3:
        CFIndex result = ppp_dev_busy[0];
        break;
      case 4:
        CFIndex result = ppp_dev_no_dial[0];
        break;
      case 5:
        CFIndex result = ppp_dev_modem_err[0];
        break;
      case 6:
LABEL_12:
        CFIndex result = ppp_dev_no_ans[0];
        break;
      case 7:
        CFIndex result = ppp_dev_hang[0];
        break;
      case 9:
        CFIndex result = ppp_dev_bad_script[0];
        break;
      default:
        return result;
    }
  }
  return result;
}

char *ipsec_error_to_string(int a1)
{
  switch(a1)
  {
    case 1:
      CFIndex result = ipsec_gen_err[0];
      break;
    case 2:
      CFIndex result = ipsec_no_srvr_addr[0];
      break;
    case 3:
      CFIndex result = ipsec_no_psk[0];
      break;
    case 4:
      CFIndex result = ipsec_no_cert[0];
      break;
    case 5:
      CFIndex result = ipsec_dns_err[0];
      break;
    case 6:
      CFIndex result = ipsec_no_local[0];
      break;
    case 7:
      CFIndex result = ipsec_cfg_err[0];
      break;
    case 8:
      CFIndex result = ipsec_ctrl_err[0];
      break;
    case 9:
      CFIndex result = ipsec_conn_err[0];
      break;
    case 10:
      CFIndex result = ipsec_nego_err[0];
      break;
    case 11:
      CFIndex result = ipsec_psk_err[0];
      break;
    case 12:
      CFIndex result = ipsec_srvr_cert_err[0];
      break;
    case 13:
      CFIndex result = ipsec_cli_cert_err[0];
      break;
    case 14:
      CFIndex result = ipsec_xauth_err[0];
      break;
    case 15:
      CFIndex result = ipsec_net_chg[0];
      break;
    case 16:
      CFIndex result = ipsec_peer_disco[0];
      break;
    case 17:
      CFIndex result = ipsec_peer_dead[0];
      break;
    case 18:
      CFIndex result = ipsec_edge_err[0];
      break;
    case 19:
      CFIndex result = ipsec_idle_tmo[0];
      break;
    case 20:
      CFIndex result = ipsec_cli_cert_pre[0];
      break;
    case 21:
      CFIndex result = ipsec_cli_cert_exp[0];
      break;
    case 22:
      CFIndex result = ipsec_srvr_cert_pre[0];
      break;
    case 23:
      CFIndex result = ipsec_srvr_cert_exp[0];
      break;
    case 24:
      CFIndex result = ipsec_srvr_cert_id[0];
      break;
    default:
      CFIndex result = 0;
      break;
  }
  return result;
}

char *vpn_error_to_string(int a1)
{
  CFIndex result = 0;
  switch(a1)
  {
    case 1:
      CFIndex result = vpn_gen_err[0];
      break;
    case 2:
      CFIndex result = vpn_no_srvr_addr[0];
      break;
    case 3:
      CFIndex result = vpn_no_cert[0];
      break;
    case 4:
      CFIndex result = vpn_dns_err[0];
      break;
    case 5:
      CFIndex result = vpn_no_local[0];
      break;
    case 6:
      CFIndex result = vpn_cfg_err[0];
      break;
    case 7:
      CFIndex result = vpn_ctrl_err[0];
      break;
    case 8:
      CFIndex result = vpn_conn_err[0];
      break;
    case 9:
      CFIndex result = vpn_net_chg[0];
      break;
    case 10:
      CFIndex result = vpn_peer_disco[0];
      break;
    case 11:
      CFIndex result = vpn_peer_dead[0];
      break;
    case 12:
      CFIndex result = vpn_peer_unresp[0];
      break;
    case 13:
      CFIndex result = vpn_nego_err[0];
      break;
    case 14:
      CFIndex result = vpn_xauth_err[0];
      break;
    case 15:
      CFIndex result = vpn_edge_err[0];
      break;
    case 16:
      CFIndex result = vpn_idle_tmo[0];
      break;
    case 17:
      CFIndex result = vpn_addr_invalid[0];
      break;
    case 18:
      CFIndex result = vpn_ap_req[0];
      break;
    case 20:
      CFIndex result = vpn_cli_cert_pre[0];
      break;
    case 21:
      CFIndex result = vpn_cli_cert_exp[0];
      break;
    case 22:
      CFIndex result = vpn_srvr_cert_pre[0];
      break;
    case 23:
      CFIndex result = vpn_srvr_cert_exp[0];
      break;
    case 24:
      CFIndex result = vpn_srvr_cert_id[0];
      break;
    case 25:
      CFIndex result = vpn_plugin_upd[0];
      break;
    case 26:
      CFIndex result = vpn_plugin_dis;
      break;
    default:
      return result;
  }
  return result;
}

void cleanup_dynamicstore(uint64_t a1)
{
  CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0, kSCDynamicStoreDomainState, *(CFStringRef *)(a1 + 24), kSCCompAnyRegex);
  if (NetworkServiceEntity)
  {
    uint64_t v2 = NetworkServiceEntity;
    CFMutableDictionaryRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    if (Mutable)
    {
      CFArrayRef v4 = Mutable;
      CFArrayAppendValue(Mutable, v2);
      CFDictionaryRef v5 = SCDynamicStoreCopyMultiple((SCDynamicStoreRef)gDynamicStore, 0, v4);
      if (v5)
      {
        CFArrayRef v6 = v5;
        CFDictionaryApplyFunction(v5, (CFDictionaryApplierFunction)sub_1D9C8, (void *)gDynamicStore);
        CFRelease(v2);
        uint64_t v2 = v4;
        CFArrayRef v4 = v6;
      }
      CFRelease(v2);
      uint64_t v2 = v4;
    }
    CFRelease(v2);
  }
}

uint64_t sub_1D9C8(CFStringRef key, int a2, SCDynamicStoreRef store)
{
  uint64_t result = SCDynamicStoreRemoveValue(store, key);
  if (!result) {
    return SCLog();
  }
  return result;
}

CFStringRef copy_primary_interface_name(const __CFString *a1)
{
  CFStringRef NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity(0, kSCDynamicStoreDomainState, kSCEntNetIPv4);
  if (NetworkGlobalEntity)
  {
    CFPropertyListRef v3 = SCDynamicStoreCopyValue((SCDynamicStoreRef)gDynamicStore, NetworkGlobalEntity);
    CFRelease(NetworkGlobalEntity);
    if (!isDictionary(v3)) {
      return 0;
    }
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)v3, kSCDynamicStorePropNetPrimaryInterface);
    if (isString(Value))
    {
      CFDictionaryRef v5 = CFDictionaryGetValue((CFDictionaryRef)v3, kSCDynamicStorePropNetPrimaryService);
      if (a1 && v5 && CFEqual(v5, a1))
      {
        CFStringRef NetworkGlobalEntity = 0;
        int v6 = 1;
      }
      else
      {
        CFStringRef NetworkGlobalEntity = CFStringCreateCopy(0, Value);
        int v6 = 0;
      }
    }
    else
    {
      int v6 = 0;
      CFStringRef NetworkGlobalEntity = 0;
    }
    CFRelease(v3);
    if (a1)
    {
      if (v6 && !NetworkGlobalEntity)
      {
        CFStringRef v7 = copy_interface_name(a1);
        uint64_t v8 = nwi_state_copy();
        if (!v7 || !v8)
        {
LABEL_23:
          if (v7) {
            goto LABEL_26;
          }
          goto LABEL_27;
        }
        if (!nwi_state_get_first_ifstate())
        {
          CFStringRef NetworkGlobalEntity = 0;
          goto LABEL_26;
        }
        while (1)
        {
          ifname = (const char *)nwi_ifstate_get_ifname();
          CFStringRef v10 = CFStringCreateWithCString(kCFAllocatorDefault, ifname, 0x600u);
          if (v10)
          {
            CFStringRef NetworkGlobalEntity = v10;
            if (!CFEqual(v10, v7) && (~nwi_ifstate_get_flags() & 5) == 0)
            {
              CFRetain(NetworkGlobalEntity);
              CFRelease(NetworkGlobalEntity);
LABEL_26:
              CFRelease(v7);
LABEL_27:
              nwi_state_release();
              return NetworkGlobalEntity;
            }
            CFRelease(NetworkGlobalEntity);
          }
          if (!nwi_ifstate_get_next())
          {
            CFStringRef NetworkGlobalEntity = 0;
            goto LABEL_23;
          }
        }
      }
    }
  }
  return NetworkGlobalEntity;
}

CFStringRef copy_interface_name(const __CFString *a1)
{
  if (!isString(a1)) {
    return 0;
  }
  CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, a1, kSCEntNetIPv4);
  if (!NetworkServiceEntity) {
    return 0;
  }
  CFStringRef v3 = NetworkServiceEntity;
  CFDictionaryRef v4 = (const __CFDictionary *)SCDynamicStoreCopyValue((SCDynamicStoreRef)gDynamicStore, NetworkServiceEntity);
  if (v4)
  {
    CFDictionaryRef v5 = v4;
    CFStringRef Value = (const __CFString *)CFDictionaryGetValue(v4, kSCPropInterfaceName);
    if (Value) {
      CFStringRef Copy = CFStringCreateCopy(kCFAllocatorDefault, Value);
    }
    else {
      CFStringRef Copy = 0;
    }
    CFRelease(v3);
  }
  else
  {
    CFStringRef Copy = 0;
    CFDictionaryRef v5 = (const __CFDictionary *)v3;
  }
  CFRelease(v5);
  return Copy;
}

const void *copy_service_id_for_interface(unint64_t a1)
{
  if (!isString((const void *)a1)) {
    return 0;
  }
  CFMutableDictionaryRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, kSCCompAnyRegex, kSCEntNetIPv4);
  CFStringRef v4 = NetworkServiceEntity;
  CFDictionaryRef v5 = 0;
  int v6 = 0;
  CFStringRef v7 = 0;
  uint64_t v8 = 0;
  if (Mutable) {
    BOOL v9 = NetworkServiceEntity == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
LABEL_20:
    if (!v4) {
      goto LABEL_21;
    }
    goto LABEL_32;
  }
  CFArrayAppendValue(Mutable, NetworkServiceEntity);
  CFDictionaryRef v5 = SCDynamicStoreCopyMultiple((SCDynamicStoreRef)gDynamicStore, 0, Mutable);
  int64_t Count = CFDictionaryGetCount(v5);
  int v6 = (const void **)malloc_type_calloc(Count, 8uLL, 0x6004044C4A2DFuLL);
  CFIndex v11 = (const void **)malloc_type_calloc(Count, 8uLL, 0x6004044C4A2DFuLL);
  CFStringRef v7 = v11;
  if (v6) {
    BOOL v12 = v11 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12 || (CFDictionaryGetKeysAndValues(v5, v6, v11), Count < 1))
  {
    uint64_t v8 = 0;
    goto LABEL_32;
  }
  CFDictionaryRef v20 = v5;
  uint64_t v13 = 0;
  while (1)
  {
    CFStringRef v14 = (const __CFString *)v6[v13];
    CFDictionaryRef v15 = (const __CFDictionary *)v7[v13];
    if (isString(v14))
    {
      if (isDictionary(v15))
      {
        unint64_t Value = (unint64_t)CFDictionaryGetValue(v15, kSCPropInterfaceName);
        if (!(a1 | Value) || a1 && Value && CFEqual((CFTypeRef)Value, (CFTypeRef)a1)) {
          break;
        }
      }
    }
    if (Count == ++v13) {
      goto LABEL_19;
    }
  }
  if (!CFStringHasPrefix(v14, kSCDynamicStoreDomainState) || !CFStringHasSuffix(v14, kSCEntNetIPv4))
  {
LABEL_19:
    uint64_t v8 = 0;
    CFDictionaryRef v5 = v20;
    goto LABEL_20;
  }
  CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, v14, @"/");
  uint64_t v8 = 0;
  CFDictionaryRef v5 = v20;
  if (CFArrayGetCount(ArrayBySeparatingStrings) == 5)
  {
    CFStringRef ValueAtIndex = CFArrayGetValueAtIndex(ArrayBySeparatingStrings, 3);
    uint64_t v8 = ValueAtIndex;
    if (ValueAtIndex) {
      CFRetain(ValueAtIndex);
    }
  }
  CFRelease(ArrayBySeparatingStrings);
  if (v4)
  {
LABEL_32:
    CFRelease(v4);
    if (!Mutable) {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
LABEL_21:
  if (Mutable) {
LABEL_22:
  }
    CFRelease(Mutable);
LABEL_23:
  if (v5) {
    CFRelease(v5);
  }
  if (v6) {
    free(v6);
  }
  if (v7) {
    free(v7);
  }
  return v8;
}

CFTypeRef copy_interface_type(const __CFString *a1)
{
  if (!isString(a1)) {
    return 0;
  }
  CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainSetup, a1, kSCEntNetInterface);
  CFDictionaryRef v3 = (const __CFDictionary *)SCDynamicStoreCopyValue((SCDynamicStoreRef)gDynamicStore, NetworkServiceEntity);
  if (isDictionary(v3))
  {
    unint64_t Value = (unint64_t)CFDictionaryGetValue(v3, kSCPropNetInterfaceHardware);
    if (isString((const void *)Value))
    {
      if (!(Value | (unint64_t)kSCEntNetAirPort))
      {
LABEL_14:
        CFStringRef v10 = (CFTypeRef *)&kSCValNetVPNOnDemandRuleInterfaceTypeMatchWiFi;
LABEL_27:
        CFTypeRef v8 = CFRetain(*v10);
        goto LABEL_28;
      }
      if (Value) {
        BOOL v5 = kSCEntNetAirPort == 0;
      }
      else {
        BOOL v5 = 1;
      }
      if (v5)
      {
        CFStringRef v6 = kSCEntNetEthernet;
        BOOL v7 = kSCEntNetEthernet == 0;
        if (!(Value | (unint64_t)kSCEntNetEthernet)) {
          goto LABEL_19;
        }
      }
      else
      {
        if (CFEqual((CFTypeRef)Value, kSCEntNetAirPort)) {
          goto LABEL_14;
        }
        CFStringRef v6 = kSCEntNetEthernet;
        BOOL v7 = kSCEntNetEthernet == 0;
      }
      if (!Value || v7)
      {
        CFIndex v11 = (const void *)kSCEntNetCommCenter;
        BOOL v12 = kSCEntNetCommCenter == 0;
        if (!(Value | kSCEntNetCommCenter))
        {
LABEL_26:
          CFStringRef v10 = (CFTypeRef *)&kSCValNetVPNOnDemandRuleInterfaceTypeMatchCellular;
          goto LABEL_27;
        }
      }
      else
      {
        if (CFEqual((CFTypeRef)Value, v6))
        {
LABEL_19:
          CFStringRef v10 = (CFTypeRef *)&kSCValNetVPNOnDemandRuleInterfaceTypeMatchEthernet;
          goto LABEL_27;
        }
        CFIndex v11 = (const void *)kSCEntNetCommCenter;
        BOOL v12 = kSCEntNetCommCenter == 0;
      }
      CFTypeRef v8 = 0;
      if (!Value || v12)
      {
LABEL_28:
        if (!NetworkServiceEntity) {
          goto LABEL_30;
        }
        goto LABEL_29;
      }
      if (CFEqual((CFTypeRef)Value, v11)) {
        goto LABEL_26;
      }
    }
  }
  CFTypeRef v8 = 0;
  if (NetworkServiceEntity) {
LABEL_29:
  }
    CFRelease(NetworkServiceEntity);
LABEL_30:
  if (v3) {
    CFRelease(v3);
  }
  return v8;
}

uint64_t primary_interface_is_cellular(char *a1)
{
  if (!nwi_state_copy())
  {
    uint64_t v5 = 0;
    char v4 = 0;
    if (!a1) {
      return v5;
    }
    goto LABEL_10;
  }
  char v2 = 1;
  while (1)
  {
    char v3 = v2;
    if (nwi_state_get_first_ifstate()) {
      break;
    }
LABEL_6:
    char v2 = 0;
    if ((v3 & 1) == 0)
    {
      char v4 = 0;
      uint64_t v5 = 0;
      goto LABEL_9;
    }
  }
  while (nwi_ifstate_get_vpn_server())
  {
    if (!nwi_ifstate_get_next()) {
      goto LABEL_6;
    }
  }
  uint64_t v5 = (nwi_ifstate_get_reachability_flags() >> 18) & 1;
  char v4 = 1;
LABEL_9:
  nwi_state_release();
  if (a1) {
LABEL_10:
  }
    *a1 = v4;
  return v5;
}

uint64_t interface_is_cellular(uint64_t a1)
{
  uint64_t v1 = a1;
  if (a1)
  {
    if (nwi_state_copy())
    {
      if (nwi_state_get_ifstate()) {
        uint64_t v1 = (nwi_ifstate_get_reachability_flags() >> 18) & 1;
      }
      else {
        uint64_t v1 = 0;
      }
      nwi_state_release();
    }
    else
    {
      return 0;
    }
  }
  return v1;
}

CFPropertyListRef copy_dns_dict(const __CFString *a1)
{
  if (!isString(a1)) {
    return 0;
  }
  CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(kCFAllocatorDefault, kSCDynamicStoreDomainState, a1, kSCEntNetDNS);
  if (!NetworkServiceEntity) {
    return 0;
  }
  CFStringRef v3 = NetworkServiceEntity;
  CFPropertyListRef v4 = SCDynamicStoreCopyValue((SCDynamicStoreRef)gDynamicStore, NetworkServiceEntity);
  CFRelease(v3);
  return v4;
}

const void *copy_service_order()
{
  CFStringRef NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity(0, kSCDynamicStoreDomainSetup, kSCEntNetIPv4);
  if (!NetworkGlobalEntity) {
    return 0;
  }
  CFStringRef v1 = NetworkGlobalEntity;
  CFDictionaryRef v2 = (const __CFDictionary *)SCDynamicStoreCopyValue((SCDynamicStoreRef)gDynamicStore, NetworkGlobalEntity);
  if (v2)
  {
    CFDictionaryRef v3 = v2;
    unint64_t Value = CFDictionaryGetValue(v2, kSCPropNetServiceOrder);
    uint64_t v5 = Value;
    if (Value) {
      CFRetain(Value);
    }
    CFRelease(v3);
  }
  else
  {
    uint64_t v5 = 0;
  }
  CFRelease(v1);
  return v5;
}

CFStringRef scnc_copy_remote_server(uint64_t a1, BOOL *a2)
{
  if (*(_WORD *)(a1 + 64) == 1)
  {
    CFDictionaryRef v3 = &kSCPropNetIPSecRemoteAddress;
LABEL_5:
    CFStringRef v4 = *v3;
    if (!a2) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (!*(_WORD *)(a1 + 64))
  {
    CFDictionaryRef v3 = &kSCPropNetPPPCommRemoteAddress;
    goto LABEL_5;
  }
  CFStringRef v4 = 0;
  if (a2) {
LABEL_6:
  }
    *a2 = 0;
LABEL_7:
  if (!v4) {
    return 0;
  }
  CFStringRef Value = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 136), v4);
  CFTypeID TypeID = CFStringGetTypeID();
  if (Value && CFGetTypeID(Value) == TypeID && CFStringGetLength(Value) >= 1)
  {
    CFCharacterSetRef v7 = CFCharacterSetCreateWithCharactersInString(kCFAllocatorDefault, @"/");
    CFCharacterSetRef v8 = CFCharacterSetCreateWithCharactersInString(kCFAllocatorDefault, @":");
    result.CFIndex location = 0;
    result.length = 0;
    range.CFIndex location = 0;
    range.length = 0;
    CFRetain(Value);
    v20.length = CFStringGetLength(Value);
    v20.CFIndex location = 0;
    if (CFStringFindCharacterFromSet(Value, v7, v20, 0, &result))
    {
      CFURLRef v9 = CFURLCreateWithString(kCFAllocatorDefault, Value, 0);
      if (v9)
      {
        CFURLRef v10 = v9;
        if (CFURLGetByteRangeForComponent(v9, kCFURLComponentScheme, 0).location != -1
          || (CFRelease(v10),
              CFStringRef v11 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"https://%@", Value),
              CFURLRef v10 = CFURLCreateWithString(kCFAllocatorDefault, v11, 0),
              CFRelease(v11),
              v10))
        {
          CFRelease(Value);
          CFStringRef v12 = CFURLCopyHostName(v10);
          CFStringRef Value = (const __CFString *)v10;
LABEL_22:
          CFRelease(Value);
          CFStringRef Value = v12;
        }
      }
    }
    else
    {
      v21.length = CFStringGetLength(Value);
      v21.CFIndex location = 0;
      if (CFStringFindCharacterFromSet(Value, v8, v21, 0, &range))
      {
        v22.length = range.location;
        v22.CFIndex location = 0;
        CFStringRef v12 = CFStringCreateWithSubstring(kCFAllocatorDefault, Value, v22);
        goto LABEL_22;
      }
    }
    CFRelease(v7);
    CFRelease(v8);
    if (Value && a2)
    {
      memset(v19, 0, sizeof(v19));
      CFIndex Length = CFStringGetLength(Value);
      CFDictionaryRef v15 = (char *)CFAllocatorAllocate(kCFAllocatorDefault, Length + 1, 0);
      CFStringGetCString(Value, v15, Length, 0x600u);
      BOOL v16 = inet_pton(2, v15, (char *)v19 + 4) != 1 && inet_pton(30, v15, (char *)v19 + 8) != 1;
      *a2 = v16;
      CFAllocatorDeallocate(kCFAllocatorDefault, v15);
    }
  }
  return Value;
}

uint64_t scnc_log(uint64_t a1, const __CFString *a2)
{
  uint64_t result = ne_sm_bridge_is_logging_at_level();
  if (result)
  {
    uint64_t result = ne_sm_bridge_logv();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)CFStringGetCStringPtr(a2, 0x8000100u);
      if (result)
      {
        _SC_syslog_os_log_mapping();
        return os_log_with_args();
      }
    }
  }
  return result;
}

uint64_t ipsec_init_things()
{
  return 0;
}

const char *ipsec_error_to_str(int a1)
{
  int v1 = a1 + 1;
  uint64_t result = "Invalid payload type";
  switch(v1)
  {
    case 0:
      uint64_t result = "Internal error";
      break;
    case 1:
LABEL_7:
      uint64_t result = "Unknown error";
      break;
    case 2:
      return result;
    case 3:
      uint64_t result = "DOI not supported";
      break;
    case 4:
      uint64_t result = "Situation not supported";
      break;
    case 5:
      uint64_t result = "Invalid cookie";
      break;
    case 6:
      uint64_t result = "Invalid major version";
      break;
    case 7:
      uint64_t result = "Invalid minor version";
      break;
    case 8:
      uint64_t result = "Invalid exchange type";
      break;
    case 9:
      uint64_t result = "Invalid flags";
      break;
    case 10:
      uint64_t result = "Invalid message id";
      break;
    case 11:
      uint64_t result = "Invalid protocol id";
      break;
    case 12:
      uint64_t result = "Invalid SPI";
      break;
    case 13:
      uint64_t result = "Invalid transform id";
      break;
    case 14:
      uint64_t result = "Attributes not supported";
      break;
    case 15:
      uint64_t result = "No proposal chosen";
      break;
    case 16:
      uint64_t result = "Bad proposal syntax";
      break;
    case 17:
      uint64_t result = "Payload malformed";
      break;
    case 18:
      uint64_t result = "Invalid key information";
      break;
    case 19:
      uint64_t result = "Invalid id information";
      break;
    case 20:
      uint64_t result = "Invalid cert encoding";
      break;
    case 21:
      uint64_t result = "Invalid certificate";
      break;
    case 22:
      uint64_t result = "Bad cert request syntax";
      break;
    case 23:
      uint64_t result = "Invalid cert authority";
      break;
    case 24:
      uint64_t result = "Invalid hash information";
      break;
    case 25:
      uint64_t result = "Authentication Failed";
      break;
    case 26:
      uint64_t result = "Invalid signature";
      break;
    case 27:
      uint64_t result = "Address notification";
      break;
    case 28:
      uint64_t result = "Notify SA lifetime";
      break;
    case 29:
      uint64_t result = "Certificate unavailable";
      break;
    case 30:
      uint64_t result = "Unsupported exchange type";
      break;
    case 31:
      uint64_t result = "Unequal payload lengths";
      break;
    default:
      switch("Invalid payload type")
      {
        case 0xC351u:
          uint64_t result = "Dead Peer";
          break;
        case 0xC352u:
          uint64_t result = "Phase 1 Delete";
          break;
        case 0xC353u:
          uint64_t result = "Idle Timeout";
          break;
        case 0xC354u:
          uint64_t result = "Certificate premature";
          break;
        case 0xC355u:
          uint64_t result = "Certificate expired";
          break;
        case 0xC356u:
          uint64_t result = "Server certificate premature";
          break;
        case 0xC357u:
          uint64_t result = "Server certificate expired";
          break;
        case 0xC358u:
          uint64_t result = "Server certificate subjectName invalid";
          break;
        case 0xC359u:
          uint64_t result = "Server certificate subjectAltName invalid";
          break;
        default:
          if ("Invalid payload type" != 40501) {
            goto LABEL_7;
          }
          uint64_t result = "Load balance";
          break;
      }
      break;
  }
  return result;
}

uint64_t ipsec_error_to_status(uint64_t a1, int a2, int a3)
{
  uint64_t result = 10;
  switch(a3)
  {
    case -1:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 21:
    case 29:
    case 30:
      return result;
    case 0:
LABEL_9:
      uint64_t result = 1;
      break;
    case 20:
    case 22:
    case 25:
      if (a2 == 1) {
        uint64_t result = 13;
      }
      else {
        uint64_t result = 12;
      }
      break;
    case 23:
      uint64_t result = 11;
      break;
    case 24:
      uint64_t result = 14;
      break;
    case 26:
    case 27:
LABEL_8:
      uint64_t result = 0;
      break;
    case 28:
      uint64_t result = 4;
      break;
    default:
      switch(a3)
      {
        case 50001:
        case 50002:
        case 50003:
          goto LABEL_8;
        case 50004:
          uint64_t result = 20;
          break;
        case 50005:
          uint64_t result = 21;
          break;
        case 50006:
          uint64_t result = 22;
          break;
        case 50007:
          uint64_t result = 23;
          break;
        case 50008:
        case 50009:
          uint64_t result = 24;
          break;
        default:
          if (a3 == 40501) {
            goto LABEL_8;
          }
          goto LABEL_9;
      }
      break;
  }
  return result;
}

const char *ipsec_msgtype_to_str(int a1)
{
  if (a1 > 0x8000)
  {
    if (a1 > 32800)
    {
      if (a1 > 33024)
      {
        if (a1 == 33025) {
          return "VPNCTL_STATUS_NEED_AUTHINFO";
        }
        if (a1 == 33026) {
          return "VPNCTL_STATUS_NEED_REAUTHINFO";
        }
      }
      else
      {
        if (a1 == 32801) {
          return "VPNCTL_STATUS_PH2_START";
        }
        if (a1 == 32802) {
          return "VPNCTL_STATUS_PH2_ESTABLISHED";
        }
      }
    }
    else if (a1 > 32785)
    {
      if (a1 == 32786) {
        return "VPNCTL_STATUS_PH1_START_PEER";
      }
      if (a1 == 32787) {
        return "VPNCTL_STATUS_PH1_ESTABLISHED";
      }
    }
    else
    {
      if (a1 == 32769) {
        return "VPNCTL_STATUS_IKE_FAILED";
      }
      if (a1 == 32785) {
        return "VPNCTL_STATUS_PH1_START_US";
      }
    }
    return "Unknown message type";
  }
  else
  {
    int v1 = a1 - 1;
    uint64_t result = "VPNCTL_CMD_BIND";
    switch(v1)
    {
      case 0:
        return result;
      case 1:
        uint64_t result = "VPNCTL_CMD_UNBIND";
        break;
      case 2:
        uint64_t result = "VPNCTL_CMD_REDIRECT";
        break;
      case 3:
        uint64_t result = "VPNCTL_CMD_PING";
        break;
      case 16:
        uint64_t result = "VPNCTL_CMD_CONNECT";
        break;
      case 17:
        uint64_t result = "VPNCTL_CMD_DISCONNECT";
        break;
      case 18:
        uint64_t result = "VPNCTL_CMD_START_PH2";
        break;
      case 19:
        uint64_t result = "VPNCTL_CMD_XAUTH_INFO";
        break;
      case 21:
        uint64_t result = "VPNCTL_CMD_ASSERT";
        break;
      case 22:
        uint64_t result = "VPNCTL_CMD_RECONNECT";
        break;
      default:
        return "Unknown message type";
    }
  }
  return result;
}

const char *ipsec_xauthtype_to_str(int a1)
{
  int v1 = a1 - 16520;
  uint64_t result = "XAUTH_TYPE";
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = "XAUTH_USER_NAME";
      break;
    case 2:
      uint64_t result = "XAUTH_USER_PASSWORD";
      break;
    case 3:
      uint64_t result = "XAUTH_PASSCODE";
      break;
    case 4:
      uint64_t result = "XAUTH_MESSAGE";
      break;
    case 5:
      uint64_t result = "XAUTH_CHALLENGE";
      break;
    case 6:
      uint64_t result = "XAUTH_DOMAIN";
      break;
    case 7:
      uint64_t result = "XAUTH_STATUS";
      break;
    case 8:
      uint64_t result = "XAUTH_NEXT_PIN";
      break;
    case 9:
      uint64_t result = "XAUTH_ANSWER";
      break;
    default:
      if ("XAUTH_TYPE" == 32136) {
        uint64_t result = "XAUTH_VENDOR";
      }
      else {
        uint64_t result = "XAUTH_TYPE unknown type";
      }
      break;
  }
  return result;
}

const char *ipsec_modecfgtype_to_str(int a1)
{
  int v1 = a1 - 1;
  uint64_t result = "INTERNAL_IP4_ADDRESS";
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      uint64_t result = "INTERNAL_IP4_NETMASK";
      break;
    case 2:
      uint64_t result = "INTERNAL_IP4_DNS";
      break;
    case 3:
      uint64_t result = "INTERNAL_IP4_NBNS";
      break;
    case 4:
      uint64_t result = "INTERNAL_ADDRESS_EXPIRY";
      break;
    case 5:
      uint64_t result = "INTERNAL_IP4_DHCP";
      break;
    case 6:
      uint64_t result = "APPLICATION_VERSION";
      break;
    case 7:
      uint64_t result = "INTERNAL_IP6_ADDRESS";
      break;
    case 8:
      uint64_t result = "INTERNAL_IP6_NETMASK";
      break;
    case 9:
      uint64_t result = "INTERNAL_IP6_DNS";
      break;
    case 10:
      uint64_t result = "INTERNAL_IP6_NBNS";
      break;
    case 11:
      uint64_t result = "INTERNAL_IP6_DHCP";
      break;
    case 12:
      uint64_t result = "INTERNAL_IP4_SUBNET";
      break;
    case 13:
      uint64_t result = "SUPPORTED_ATTRIBUTES";
      break;
    case 14:
      uint64_t result = "INTERNAL_IP6_SUBNET";
      break;
    default:
      switch("INTERNAL_IP4_ADDRESS")
      {
        case 0x7000u:
          uint64_t result = "UNITY_BANNER";
          break;
        case 0x7001u:
          uint64_t result = "UNITY_SAVE_PASSWD";
          break;
        case 0x7002u:
          uint64_t result = "UNITY_DEF_DOMAIN";
          break;
        case 0x7003u:
          uint64_t result = "UNITY_SPLITDNS_NAME";
          break;
        case 0x7004u:
          uint64_t result = "UNITY_SPLIT_INCLUDE";
          break;
        case 0x7005u:
          uint64_t result = "UNITY_NATT_PORT";
          break;
        case 0x7006u:
          uint64_t result = "UNITY_LOCAL_LAN";
          break;
        case 0x7007u:
          uint64_t result = "UNITY_PFS";
          break;
        case 0x7008u:
          uint64_t result = "UNITY_FW_TYPE";
          break;
        case 0x7009u:
          uint64_t result = "UNITY_BACKUP_SERVERS";
          break;
        case 0x700Au:
          uint64_t result = "UNITY_DDNS_HOSTNAME";
          break;
        case 0x700Bu:
          uint64_t result = "UNITY_BROWSER_PROXY";
          break;
        default:
          uint64_t result = "MODECFG_TYPE unknown type";
          break;
      }
      break;
  }
  return result;
}

uint64_t ipsec_subtype()
{
  return 0;
}

uint64_t ipsec_new_service(uint64_t a1)
{
  *(_DWORD *)(a1 + 592) = 0;
  *(_DWORD *)(a1 + 784) = -1;
  *(_DWORD *)(a1 + 904) = -1;
  *(_DWORD *)(a1 + 800) = -1;
  *(void *)(a1 + 1048) = 0;
  return 0;
}

uint64_t ipsec_dispose_service(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 592)) {
    return 1;
  }
  free_service_routes(a1);
  my_CFRelease((const void **)(a1 + 136));
  my_CFRelease((const void **)(a1 + 144));
  return 0;
}

uint64_t ipsec_setup_service(uint64_t a1)
{
  *(_DWORD *)(a1 + 72) = *(_DWORD *)(a1 + 72) & 0xF780DE3F | 0xC0;
  CFDictionaryRef v2 = (CFDictionaryRef *)(a1 + 136);
  my_CFRelease((const void **)(a1 + 136));
  uint64_t v3 = *(void *)(a1 + 584);
  if (v3) {
    CFDictionaryRef v4 = (const __CFDictionary *)ne_sm_bridge_copy_configuration(v3);
  }
  else {
    CFDictionaryRef v4 = (const __CFDictionary *)copyEntity((const __SCDynamicStore *)gDynamicStore, kSCDynamicStoreDomainSetup, *(const __CFString **)(a1 + 24), kSCEntNetIPSec);
  }
  *CFDictionaryRef v2 = v4;
  if (!v4)
  {
    sub_1F39C(3, @"IPSec Controller: Cannot copy IPSec dictionary from setup");
    ipsec_stop(a1);
    return 0xFFFFFFFFLL;
  }
  int v10 = 0;
  getNumber(v4, kSCPropNetIPSecOnDemandEnabled, &v10);
  if (v10)
  {
    int v5 = 18874368;
  }
  else
  {
    if (!CFDictionaryGetValue(*v2, kSCPropNetVPNOnDemandRules)
      || !controller_options_is_useVODDisconnectRulesWhenVODDisabled())
    {
      goto LABEL_12;
    }
    int v5 = 0x1000000;
  }
  *(_DWORD *)(a1 + 72) |= v5;
LABEL_12:
  int v10 = 0;
  getNumber(*v2, @"DisconnectOnLogout", &v10);
  if (v10) {
    *(_DWORD *)(a1 + 72) |= 0x20000u;
  }
  int v10 = 0;
  getNumber(*v2, @"DisconnectOnSleep", &v10);
  if (v10) {
    *(_DWORD *)(a1 + 72) |= 0x40000u;
  }
  int v10 = 0;
  getNumber(*(const __CFDictionary **)(a1 + 136), @"PreventIdleSleep", &v10);
  int v7 = *(_DWORD *)(a1 + 72);
  if (v10)
  {
    v7 |= 0x80000u;
    *(_DWORD *)(a1 + 72) = v7;
  }
  int v10 = v7 & 0x20000;
  getNumber(*v2, @"DisconnectOnFastUserSwitch", &v10);
  if (v10) {
    *(_DWORD *)(a1 + 72) |= 0x100000u;
  }
  int v10 = 1;
  *(_DWORD *)(a1 + 196) = 0;
  getNumber(*(const __CFDictionary **)(a1 + 136), kSCPropNetIPSecDisconnectOnWake, &v10);
  if (v10)
  {
    *(_DWORD *)(a1 + 72) |= 0x8000000u;
    getNumber(*(const __CFDictionary **)(a1 + 136), kSCPropNetIPSecDisconnectOnWakeTimer, (void *)(a1 + 196));
  }
  int v10 = 1;
  getNumber(*v2, @"AlertEnable", &v10);
  if (!v10) {
    *(_DWORD *)(a1 + 72) &= 0xFFFFFF3F;
  }
  int v10 = 0;
  getNumber(*v2, @"ConnectionPersist", &v10);
  if (v10) {
    *(_DWORD *)(a1 + 72) |= 0x400000u;
  }
  uint64_t result = CFDictionaryContainsKey(*v2, @"ProfileIdentifier");
  if (result)
  {
    my_CFRelease((const void **)(a1 + 144));
    CFStringRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 136), @"ProfileIdentifier");
    CFTypeRef v9 = my_CFRetain(Value);
    uint64_t result = 0;
    *(void *)(a1 + 144) = v9;
  }
  return result;
}

uint64_t sub_1F39C(uint64_t a1, const __CFString *a2)
{
  uint64_t result = ne_sm_bridge_is_logging_at_level();
  if (result)
  {
    uint64_t result = ne_sm_bridge_logv();
    if ((result & 1) == 0)
    {
      uint64_t result = (uint64_t)CFStringGetCStringPtr(a2, 0x8000100u);
      if (result)
      {
        _SC_syslog_os_log_mapping();
        return os_log_with_args();
      }
    }
  }
  return result;
}

uint64_t ipsec_stop(uint64_t a1)
{
  sub_1F39C(5, @"IPSec Controller: ipsec_stop");
  if (*(_DWORD *)(a1 + 592) == 4)
  {
    CFDictionaryRef v2 = *(__CFUserNotification **)(a1 + 168);
    if (v2)
    {
      CFUserNotificationCancel(v2);
      CFAbsoluteTime Current = CFRunLoopGetCurrent();
      CFRunLoopRemoveSource(Current, *(CFRunLoopSourceRef *)(a1 + 176), kCFRunLoopDefaultMode);
      my_CFRelease((const void **)(a1 + 168));
      my_CFRelease((const void **)(a1 + 176));
    }
  }
  int v34 = 0;
  int v4 = *(_DWORD *)(a1 + 72);
  if ((v4 & 0x2000) != 0
    || ((v5 = *(_DWORD *)(a1 + 596), v6 = v5 > 0x10, int v7 = (1 << v5) & 0x10600, !v6) ? (v8 = v7 == 0) : (v8 = 1),
        v8 || (CFDictionaryRef v9 = *(const __CFDictionary **)(a1 + 608)) == 0))
  {
LABEL_15:
    *(_DWORD *)(a1 + 72) = v4 & 0xFFFFDFFF;
    int v13 = *(_DWORD *)(a1 + 592);
    if (!v13 || v13 == 7) {
      return 0;
    }
    sub_1FBF4(a1, 7u);
    CFStringRef v14 = ne_log_obj();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15.s_addr = *(_DWORD *)(a1 + 748);
      BOOL v16 = inet_ntoa(v15);
      *(_DWORD *)CFDictionaryRef v35 = 136315138;
      CFStringRef v36 = v16;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "IPSec disconnecting from server %s\n", v35, 0xCu);
    }
    CFTypeID v17 = *(__CFMachPort **)(a1 + 1000);
    if (v17)
    {
      CFMachPortGetPort(v17);
      CFMachPortInvalidate(*(CFMachPortRef *)(a1 + 1000));
      CFRelease(*(CFTypeRef *)(a1 + 1000));
      *(void *)(a1 + 1000) = 0;
      getaddrinfo_async_cancel();
    }
    int v18 = *(_DWORD *)(a1 + 784);
    if (v18 != -1) {
      racoon_send_cmd_disconnect(v18, *(_DWORD *)(a1 + 748));
    }
    if (*(_DWORD *)(a1 + 868))
    {
      if (IPSecRemovePolicies(*(const __CFDictionary **)(a1 + 608), -1, &v34)) {
        sub_1F39C(3, @"IPSec Controller: Cannot remove policies, error '%s'");
      }
      IPSecRemoveSecurityAssociations((unsigned __int8 *)(a1 + 616), (unsigned __int8 *)(a1 + 744));
      *(_DWORD *)(a1 + 868) = 0;
    }
    uint64_t v19 = *(void *)(a1 + 584);
    if (v19) {
      ne_sm_bridge_request_uninstall(v19);
    }
    sub_217B8(a1, 1);
    if (*(_DWORD *)(a1 + 864))
    {
      if (IPSecRemoveConfiguration(*(const void **)(a1 + 608), &v34)) {
        sub_1F39C(3, @"IPSec Controller: Cannot remove configuration, error '%s'");
      }
      *(_DWORD *)(a1 + 864) = 0;
    }
    vm_address_t v20 = *(void *)(a1 + 832);
    if (v20)
    {
      my_Deallocate(v20, *(_DWORD *)(a1 + 844) + 1);
      *(void *)(a1 + 832) = 0;
    }
    *(void *)(a1 + 840) = 0;
    vm_address_t v21 = *(void *)(a1 + 816);
    if (v21)
    {
      my_Deallocate(v21, *(_DWORD *)(a1 + 824));
      *(void *)(a1 + 816) = 0;
    }
    *(_DWORD *)(a1 + 824) = 0;
    *(void *)(a1 + 88) = 0;
    *(_DWORD *)(a1 + 96) = 0;
    *(_DWORD *)(a1 + 912) = 0;
    *(unsigned char *)(a1 + 918) = 0;
    *(unsigned char *)(a1 + 934) = 0;
    my_CFRelease((const void **)(a1 + 1024));
    *(void *)(a1 + 1024) = 0;
    CFRange v22 = *(__CFSocket **)(a1 + 792);
    if (v22)
    {
      CFSocketInvalidate(v22);
      my_CFRelease((const void **)(a1 + 792));
    }
    else
    {
      int v23 = *(_DWORD *)(a1 + 784);
      if (v23) {
        close(v23);
      }
    }
    *(_DWORD *)(a1 + 784) = -1;
    BOOL v24 = *(__CFSocket **)(a1 + 808);
    if (v24)
    {
      CFSocketInvalidate(v24);
      my_CFRelease((const void **)(a1 + 808));
    }
    else
    {
      int v25 = *(_DWORD *)(a1 + 800);
      if (v25) {
        close(v25);
      }
    }
    *(_DWORD *)(a1 + 800) = -1;
    *(void *)(a1 + 768) = 0;
    *(void *)(a1 + 760) = 0;
    scnc_bootstrap_dealloc(a1);
    scnc_ausession_dealloc(a1);
    my_CFRelease((const void **)(a1 + 128));
    my_CFRelease((const void **)(a1 + 608));
    if (*(void *)(a1 + 776))
    {
      uint64_t v26 = CFRunLoopGetCurrent();
      CFRunLoopRemoveTimer(v26, *(CFRunLoopTimerRef *)(a1 + 776), kCFRunLoopCommonModes);
      my_CFRelease((const void **)(a1 + 776));
    }
    if (*(void *)(a1 + 952))
    {
      long long v27 = CFRunLoopGetCurrent();
      CFRunLoopRemoveTimer(v27, *(CFRunLoopTimerRef *)(a1 + 952), kCFRunLoopCommonModes);
      my_CFRelease((const void **)(a1 + 952));
    }
    if (gNattKeepAliveInterval != -1)
    {
      *(_DWORD *)CFDictionaryRef v35 = gNattKeepAliveInterval;
      sysctlbyname("net.key.natt_keepalive_interval", 0, 0, v35, 4uLL);
      gNattKeepAliveInterval = -1;
    }
    if (*(void *)(a1 + 984))
    {
      long long v28 = CFRunLoopGetCurrent();
      CFRunLoopRemoveTimer(v28, *(CFRunLoopTimerRef *)(a1 + 984), kCFRunLoopCommonModes);
      my_CFRelease((const void **)(a1 + 984));
    }
    my_CFRelease((const void **)(a1 + 976));
    uint64_t v29 = *(unsigned int *)(a1 + 596);
    if (v29 <= 0x15 && ((1 << v29) & 0x302000) != 0)
    {
      if (*(void *)(a1 + 144))
      {
        CFStringRef v30 = CFStringCreateWithFormat(0, 0, @"IPSec Error %d, Re-enroll", *(unsigned int *)(a1 + 596));
        if (v30)
        {
          CFStringRef v31 = v30;
          sub_23D54(a1, v30, 0, 2);
          CFRelease(v31);
        }
        goto LABEL_61;
      }
    }
    else if (!v29 || (*(_DWORD *)(a1 + 72) & 0x400) != 0)
    {
LABEL_61:
      sub_1FBF4(a1, 0);
      cleanup_dynamicstore(a1);
      *(_DWORD *)(a1 + 600) = 0;
      *(void *)(a1 + 396) = 0;
      service_ended(a1);
      if (*(void *)(a1 + 584)) {
        allow_dispose(a1);
      }
      return 0;
    }
    sub_23D54(a1, 0, v29, 0);
    goto LABEL_61;
  }
  CFStringRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 608), @"AuthenticationMethod");
  int StrFromDict = GetStrFromDict(v9, @"LocalIdentifier", (char *)v35, 256, "");
  if (!IPSecIsAggressiveMode(Value, StrFromDict, 1)) {
    goto LABEL_14;
  }
  CFStringRef v12 = ne_log_obj();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "IPSec Controller: retry IPSec aggressive mode with DH Group 2", buf, 2u);
  }
  *(_DWORD *)(a1 + 72) |= 0x2000u;
  if (!sub_2407C(a1, 64, 1))
  {
LABEL_14:
    int v4 = *(_DWORD *)(a1 + 72);
    goto LABEL_15;
  }
  return 0;
}

CFTypeID ipsec_set_initial_values(uint64_t a1, const void *a2)
{
  CFTypeID result = CFDictionaryGetTypeID();
  if (a2)
  {
    CFTypeID v5 = result;
    CFTypeID result = CFGetTypeID(a2);
    if (result == v5)
    {
      int v6 = 0;
      CFTypeID result = (CFTypeID)getNumber((const __CFDictionary *)a2, @"LastCause", &v6);
      *(_DWORD *)(a1 + 596) = v6;
    }
  }
  return result;
}

uint64_t ipsec_user_notification_callback(uint64_t result, CFUserNotificationRef userNotification, char a3)
{
  uint64_t v3 = result;
  int v4 = *(_DWORD *)(result + 592);
  if ((a3 & 3) != 0)
  {
    if (v4)
    {
      return ipsec_stop(result);
    }
    else
    {
      unsigned int v11 = *(_DWORD *)(result + 596);
      BOOL v12 = v11 > 0x15;
      int v13 = (1 << v11) & 0x302000;
      if (!v12 && v13 != 0)
      {
        CFTypeID result = *(void *)(result + 584);
        if (result)
        {
          CFStringRef v15 = *(const __CFString **)(v3 + 144);
          return ne_sm_bridge_start_profile_janitor(result, v15);
        }
      }
    }
    return result;
  }
  if (v4 != 4) {
    return result;
  }
  __int16 v6 = *(_WORD *)(result + 916);
  if ((v6 & 8) != 0)
  {
    __int16 v16 = 16529;
LABEL_22:
    v19[0] = v16;
    ResponseCFStringRef Value = CFUserNotificationGetResponseValue(userNotification, kCFUserNotificationTextFieldValuesKey, 0);
    unsigned int v7 = 1;
    goto LABEL_23;
  }
  if ((v6 & 0x10) != 0)
  {
    __int16 v16 = 16528;
    goto LABEL_22;
  }
  if (v6)
  {
    v19[0] = 16521;
    ResponseCFStringRef Value = CFUserNotificationGetResponseValue(userNotification, kCFUserNotificationTextFieldValuesKey, 0);
    __int16 v6 = *(_WORD *)(v3 + 916);
    unsigned int v7 = 1;
    if ((v6 & 4) != 0) {
      goto LABEL_11;
    }
  }
  else
  {
    unsigned int v7 = 0;
    if ((v6 & 4) != 0)
    {
LABEL_11:
      CFIndex v8 = v7;
      CFDictionaryRef v9 = &v19[8 * v7];
      __int16 v10 = 16523;
LABEL_30:
      __int16 *v9 = v10;
      *((void *)v9 + 1) = CFUserNotificationGetResponseValue(userNotification, kCFUserNotificationTextFieldValuesKey, v8);
      ++v7;
      goto LABEL_23;
    }
  }
  if ((v6 & 2) != 0)
  {
    CFIndex v8 = v7;
    CFDictionaryRef v9 = &v19[8 * v7];
    __int16 v10 = 16522;
    goto LABEL_30;
  }
LABEL_23:
  CFTypeID v17 = *(__CFRunLoopTimer **)(v3 + 776);
  if (v17)
  {
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    CFRunLoopTimerSetNextFireDate(v17, Current + 30.0);
  }
  sub_1FBF4(v3, 3u);
  return racoon_send_cmd_xauthinfo(*(_DWORD *)(v3 + 784), *(_DWORD *)(v3 + 748), (uint64_t)v19, v7);
}

uint64_t sub_1FBF4(uint64_t result, unsigned int a2)
{
  if (*(_DWORD *)(result + 592) != a2)
  {
    uint64_t v3 = result;
    *(_DWORD *)(result + 592) = a2;
    phase_changed(result, a2);
    int v4 = (const __SCDynamicStore *)gDynamicStore;
    CFStringRef v5 = *(const __CFString **)(v3 + 24);
    return publish_dictnumentry(v4, v5, kSCEntNetIPSec, kSCPropNetIPSecStatus, a2);
  }
  return result;
}

uint64_t racoon_send_cmd_xauthinfo(int a1, int a2, uint64_t a3, int a4)
{
  uint64_t v8 = a4;
  if (a4 < 1)
  {
    size_t v13 = 20;
  }
  else
  {
    CFDictionaryRef v9 = (const __CFString **)(a3 + 8);
    int v10 = 20;
    uint64_t v11 = a4;
    do
    {
      CFStringRef v12 = *v9;
      if (*v9) {
        LODWORD(v12) = CFStringGetLength(v12);
      }
      v10 += v12 + 4;
      v9 += 2;
      --v11;
    }
    while (v11);
    size_t v13 = v10;
  }
  CFStringRef v14 = (UInt8 *)malloc_type_malloc(v13, 0xEAEE4576uLL);
  if (!v14) {
    return 0xFFFFFFFFLL;
  }
  CFStringRef v15 = v14;
  *(void *)CFStringRef v14 = 0;
  *((void *)v14 + 1) = 0;
  *(_WORD *)CFStringRef v14 = 5120;
  *((_WORD *)v14 + 7) = bswap32(v13 - 16) >> 16;
  *((_DWORD *)v14 + 4) = a2;
  if (a4 >= 1)
  {
    __int16 v16 = v14 + 20;
    CFTypeID v17 = (CFStringRef *)(a3 + 8);
    do
    {
      CFIndex usedBufLen = 0;
      if (*v17) {
        CFIndex Length = CFStringGetLength(*v17);
      }
      else {
        CFIndex Length = 0;
      }
      *(_DWORD *)__int16 v16 = bswap32((unsigned __int16)Length | (*((unsigned __int16 *)v17 - 4) << 16));
      v16 += 4;
      if (Length)
      {
        v23.CFIndex location = 0;
        v23.length = Length;
        CFStringGetBytes(*v17, v23, 0x8000100u, 0, 0, v16, Length, &usedBufLen);
        v16 += Length;
      }
      v17 += 2;
      --v8;
    }
    while (v8);
  }
  sub_21AB4(a1, (uint64_t)v15, v13);
  uint64_t v19 = ne_log_obj();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "IPSec sending Extended Authentication.\n", buf, 2u);
  }
  free(v15);
  return 0;
}

uint64_t ipsec_install(uint64_t a1)
{
  return 0;
}

void sub_1FE44(uint64_t a1, int a2, int a3)
{
  in_addr_t v199 = 0;
  v197 = 0;
  v198 = 0;
  v194 = 0;
  CFStringRef v195 = 0;
  CFStringRef v192 = 0;
  v193 = 0;
  CFStringRef v191 = 0;
  *(_DWORD *)(a1 + 908) = 0;
  uint64_t v4 = *(void *)(a1 + 816);
  uint64_t v5 = v4;
  if (!v4)
  {
    uint64_t v5 = *(void *)(a1 + 832);
    if (!v5) {
      return;
    }
    uint64_t v4 = a1 + 848;
  }
  v196 = 0;
  unsigned int v6 = bswap32(*(unsigned __int16 *)(v4 + 14)) >> 16;
  CFMutableDictionaryRef Mutable = 0;
  unsigned int v7 = ne_log_obj();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "IPSec Network Configuration started.\n", buf, 2u);
  }
  if (v6 < 0x1D) {
    goto LABEL_39;
  }
  in_addr_t v186 = 0;
  unsigned int v8 = v6 - 28;
  uint64_t v183 = a1;
  v184 = (in_addr_t *)(a1 + 908);
  in_addr_t v9 = -1;
  int v10 = (unsigned __int16 *)(v5 + 44);
  unsigned int v179 = v8;
  do
  {
    unsigned int v11 = v10[1];
    int v12 = bswap32(*v10);
    int v13 = HIWORD(v12) & 0x7FFF;
    if (v13 != 28673)
    {
      if (v13 == 2)
      {
        in_addr_t v9 = *((_DWORD *)v10 + 1);
        in_addr_t v199 = v9;
        CFTypeID v17 = ne_log_obj();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v18.s_addr = v9;
          uint64_t v19 = inet_ntoa(v18);
          *(_DWORD *)buf = 136315138;
          *(void *)&buf[4] = v19;
          _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "IPSec Network Configuration: INTERNAL-IP4-MASK = %s.\n", buf, 0xCu);
        }
      }
      else if (v13 == 1)
      {
        in_addr_t v199 = *((_DWORD *)v10 + 1);
        CFStringRef v14 = ne_log_obj();
        in_addr_t v186 = v199;
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          v15.s_addr = v199;
          __int16 v16 = inet_ntoa(v15);
          *(_DWORD *)buf = 136315138;
          *(void *)&buf[4] = v16;
          _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "IPSec Network Configuration: INTERNAL-IP4-ADDRESS = %s.\n", buf, 0xCu);
        }
      }
      goto LABEL_31;
    }
    vm_address_t v20 = ne_log_obj();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v11 != 256;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_DEFAULT, "IPSec Network Configuration: SAVE-PASSWORD = %d.\n", buf, 8u);
    }
    __int16 v21 = *(_WORD *)(a1 + 916);
    if ((v11 != 256) == ((v21 & 0x40) == 0))
    {
      uint64_t v22 = *(void *)(a1 + 584);
      if (v22)
      {
        ne_sm_bridge_clear_saved_password(v22);
      }
      else
      {
        if (v11 == 256) {
          CFStringRef v23 = 0;
        }
        else {
          CFStringRef v23 = kSCValNetIPSecXAuthPasswordEncryptionPrompt;
        }
        if (!UpdatePasswordPrefs(*(const __CFString **)(a1 + 24), *(const void **)(a1 + 32), 4, kSCPropNetIPSecXAuthPasswordEncryption, v23))goto LABEL_27; {
      }
        }
      __int16 v24 = *(_WORD *)(a1 + 916);
      if (v11 == 256)
      {
        *(_WORD *)(a1 + 916) = v24 & 0xFFBF;
        CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 608), kSCPropNetIPSecXAuthPasswordEncryption);
        if ((v21 & 0x20) == 0) {
          goto LABEL_31;
        }
LABEL_30:
        if ((*(_WORD *)(a1 + 916) & 0xC0) == 0x40)
        {
          sub_25278(a1, a1 + 744, a1 + 760, 0);
          return;
        }
        goto LABEL_31;
      }
      *(_WORD *)(a1 + 916) = v24 | 0x40;
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 608), kSCPropNetIPSecXAuthPasswordEncryption, kSCValNetIPSecXAuthPasswordEncryptionPrompt);
LABEL_27:
      if ((v21 & 0x20) == 0) {
        goto LABEL_31;
      }
      goto LABEL_30;
    }
LABEL_31:
    unsigned int v25 = __rev16(v11);
    if (v12 >> 16 >= 0) {
      uint64_t v26 = v25;
    }
    else {
      uint64_t v26 = 0;
    }
    int v27 = v8 - v26;
    int v10 = (unsigned __int16 *)((char *)v10 + v26 + 4);
    unsigned int v8 = v8 - v26 - 4;
  }
  while (v27 > 4);
  uint64_t v28 = a1;
  if (!v186)
  {
LABEL_39:
    sub_1F39C(3, @"IPSec Controller: Internal IP Address missing from Mode Config packet ");
    return;
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  int v168 = v9;
  CFStringRef value = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 608), @"ForceLocalAddress")
    && CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 608), @"ForceLocalAddress") == kCFBooleanTrue)
  {
    CFDictionaryRef v35 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 608), @"LocalAddress");
    CFDictionarySetValue(Mutable, @"LocalAddress", v35);
    memset(__s, 0, sizeof(__s));
    int v189 = 0;
    long long v33 = (const UInt8 *)(v5 + 44);
    if (*(_DWORD *)(a1 + 760))
    {
      LOWORD(__s[0]) = 7708;
      CFStringRef v36 = __s;
      nw_nat64_synthesize_v6();
    }
    else
    {
      CFStringRef v36 = (char **)(a1 + 744);
    }
    unsigned int v34 = v179;
    getnameinfo((const sockaddr *)v36, *(unsigned __int8 *)v36, buf, 0x39u, 0, 0, 10);
    AddString(Mutable, @"RemoteAddress", buf);
  }
  else
  {
    v29.s_addr = *(_DWORD *)(v5 + 20);
    CFStringRef v30 = inet_ntoa(v29);
    AddString(Mutable, @"LocalAddress", v30);
    in_addr_t v199 = *(_DWORD *)(v5 + 16);
    v31.s_addr = v199;
    CFStringRef v32 = inet_ntoa(v31);
    AddString(Mutable, @"RemoteAddress", v32);
    long long v33 = (const UInt8 *)(v5 + 44);
    unsigned int v34 = v179;
  }
  int v37 = 0;
  int v182 = 0;
  int v38 = 0;
  uint64_t v174 = 0;
  int v171 = 0;
  int v173 = 1;
  int v172 = 1;
  while (2)
  {
    unsigned int v39 = *((unsigned __int16 *)v33 + 1);
    int v40 = bswap32(*(unsigned __int16 *)v33);
    int v41 = HIWORD(v40) & 0x7FFF;
    CFIndex v42 = __rev16(v39);
    switch(v41)
    {
      case 28672:
        if (!*(void *)(v28 + 960))
        {
          *(void *)(v28 + 960) = CFStringCreateWithBytes(0, v33 + 4, v42, 0, 0);
          unint64_t v43 = ne_log_obj();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            CStringPtr = CFStringGetCStringPtr(*(CFStringRef *)(v28 + 960), 0);
            *(_DWORD *)buf = 136315138;
            *(void *)&buf[4] = CStringPtr;
            int v45 = v43;
            int v46 = "IPSec Network Configuration: BANNER = %s.\n";
            goto LABEL_61;
          }
        }
        goto LABEL_158;
      case 28673:
      case 28677:
      case 28679:
      case 28680:
      case 28681:
      case 28682:
        goto LABEL_158;
      case 28674:
        if (!v195)
        {
          CFStringRef v195 = CFStringCreateWithBytes(0, v33 + 4, v42, 0, 0);
          CFMutableArrayRef v52 = ne_log_obj();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            CFStringRef v53 = CFStringGetCStringPtr(v195, 0);
            *(_DWORD *)buf = 136315138;
            *(void *)&buf[4] = v53;
            int v45 = v52;
            int v46 = "IPSec Network Configuration: DEF-DOMAIN = %s.\n";
LABEL_61:
            _os_log_impl(&dword_0, v45, OS_LOG_TYPE_DEFAULT, v46, buf, 0xCu);
          }
        }
        goto LABEL_158;
      case 28675:
        if (v194) {
          goto LABEL_158;
        }
        v194 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
        if (!v194 || v39 == 0) {
          goto LABEL_158;
        }
        int v178 = v40;
        v175 = v33;
        int v177 = v42;
        CFStringRef v55 = (const char *)(v33 + 4);
        int v56 = v42;
        unsigned int v180 = v34;
        while (1)
        {
          __s[0] = 0;
          CFStringRef v57 = CFStringCreateWithCString(0, v55, 0);
          if (!v57)
          {
            my_CFRelease((const void **)&v194);
            goto LABEL_166;
          }
          CFStringRef v58 = v57;
          int v59 = CFStringGetLength(v57) + 2;
          long long v60 = (char *)malloc_type_malloc(v59, 0x84533F37uLL);
          __s[0] = v60;
          if (!v60) {
            goto LABEL_90;
          }
          long long v61 = v60;
          CFStringGetCString(v58, v60, v59, 0);
          long long v62 = __s[0];
          long long v63 = ",";
          if (!strchr(__s[0], 44))
          {
            long long v63 = ";";
            if (!strchr(v62, 59))
            {
              long long v63 = "\n";
              if (!strchr(v62, 10))
              {
                long long v63 = "\r";
                if (!strchr(v62, 13))
                {
                  if (strchr(v62, 32)) {
                    long long v63 = " ";
                  }
                  else {
                    long long v63 = (const char *)&unk_2EE90;
                  }
                }
              }
            }
          }
          long long v64 = strsep(__s, v63);
          while (v64)
          {
            if (*v64) {
              goto LABEL_82;
            }
LABEL_86:
            long long v64 = strsep(__s, v63);
            if (!v64) {
              goto LABEL_89;
            }
          }
          long long v64 = __s[0];
LABEL_82:
          CFStringRef v65 = CFStringCreateWithCString(0, v64, 0);
          if (v65)
          {
            CFArrayAppendValue(v194, v65);
            long long v66 = ne_log_obj();
            if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
            {
              long long v67 = CFStringGetCStringPtr(v65, 0);
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)&buf[4] = v38;
              *(_WORD *)&uint8_t buf[8] = 2080;
              *(void *)&buf[10] = v67;
              _os_log_impl(&dword_0, v66, OS_LOG_TYPE_DEFAULT, "IPSec Network Configuration: SPLITDNS-NAME[%d] = %s.\n", buf, 0x12u);
            }
            CFRelease(v65);
            ++v38;
            goto LABEL_86;
          }
          my_CFRelease((const void **)&v194);
LABEL_89:
          free(v61);
          unsigned int v34 = v180;
LABEL_90:
          v55 += v59;
          v56 -= v59;
          CFRelease(v58);
          if (v56 <= 0)
          {
LABEL_166:
            uint64_t v28 = v183;
            long long v33 = v175;
            goto LABEL_157;
          }
        }
      case 28676:
        if (!*((_WORD *)v33 + 1))
        {
          int v172 = 0;
          goto LABEL_158;
        }
        int v178 = v40;
        unsigned int v181 = v34;
        v176 = v33;
        int v177 = v42;
        long long v68 = (in_addr_t *)(v33 + 4);
        int v69 = v199;
        unsigned int v70 = ((int)v42 - 1) / 0xEu;
        int v71 = v42 + 14;
        int v72 = v182;
        break;
      case 28678:
        if (!*((_WORD *)v33 + 1)) {
          goto LABEL_158;
        }
        int v178 = v40;
        unsigned int v181 = v34;
        v176 = v33;
        int v177 = v42;
        long long v82 = (in_addr_t *)(v33 + 4);
        int v83 = v199;
        int v84 = v42 + 14;
        do
        {
          long long v85 = CFDictionaryCreateMutable(0, 0, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          CFDictionarySetValue(v85, @"Mode", @"Tunnel");
          CFDictionarySetValue(v85, @"Direction", @"InOut");
          CFDictionarySetValue(v85, @"Level", @"None");
          v86.s_addr = v186;
          long long v87 = inet_ntoa(v86);
          AddString(v85, @"LocalAddress", v87);
          AddNumber(v85, @"LocalPrefix", 32);
          in_addr_t v88 = *v82;
          v89.s_addr = *v82;
          long long v90 = inet_ntoa(v89);
          AddString(v85, @"RemoteAddress", v90);
          unsigned int v91 = v82[1];
          unsigned int v92 = 32 - __clz(__rbit32(bswap32(v91)));
          if (v91) {
            int v93 = v92;
          }
          else {
            int v93 = 0;
          }
          AddNumber(v85, @"RemotePrefix", v93);
          long long v94 = ne_log_obj();
          if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
          {
            v95.s_addr = v88;
            long long v96 = inet_ntoa(v95);
            v97.s_addr = v186;
            long long v98 = inet_ntoa(v97);
            *(_DWORD *)buf = 67110146;
            *(_DWORD *)&buf[4] = v182;
            *(_WORD *)&uint8_t buf[8] = 2080;
            *(void *)&buf[10] = v96;
            __int16 v201 = 1024;
            int v202 = v93;
            __int16 v203 = 2080;
            v204 = v98;
            __int16 v205 = 1024;
            int v206 = 32;
            _os_log_impl(&dword_0, v94, OS_LOG_TYPE_DEFAULT, "IPSec Network Configuration: LOCAL-LAN[%d] = destination %s/%d -> gateway %s/%d.\n", buf, 0x28u);
          }
          update_service_route(v183, v186, -1, v83, 0, 0, 0, 0);
          CFArrayAppendValue(value, v85);
          CFRelease(v85);
          v84 -= 14;
          long long v82 = (in_addr_t *)((char *)v82 + 14);
        }
        while (v84 > 14);
        uint64_t v28 = v183;
        goto LABEL_116;
      case 28683:
        if (!*((_WORD *)v33 + 1))
        {
          uint64_t v174 = 0;
          int v171 = 0;
          goto LABEL_158;
        }
        int v178 = v40;
        unsigned int v181 = v34;
        uint64_t v174 = 0;
        int v99 = 0;
        int v177 = v42;
        int v100 = v42;
        CFStringRef v101 = v33;
        CFRange v102 = v33;
        do
        {
          CFRange v103 = v102 + 4;
          int v104 = bswap32(*((unsigned __int16 *)v102 + 2));
          CFIndex v105 = __rev16(*((unsigned __int16 *)v102 + 3));
          switch(HIWORD(v104) & 0x7FFF)
          {
            case 1:
              CFTypeID v106 = ne_log_obj();
              if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v37;
                *(_WORD *)&uint8_t buf[8] = 1024;
                *(_DWORD *)&buf[10] = v105;
                _os_log_impl(&dword_0, v106, OS_LOG_TYPE_DEFAULT, "IPSec Network Configuration: BROWSER-PROXY[%d] = setting %d.\n", buf, 0xEu);
              }
              int v173 = v105;
              break;
            case 2:
              v107 = ne_log_obj();
              if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v37;
                *(_WORD *)&uint8_t buf[8] = 1024;
                *(_DWORD *)&buf[10] = v105;
                v108 = v107;
                CFTypeID v109 = "IPSec Network Configuration: BROWSER-PROXY[%d] = browser-type %d.\n";
                goto LABEL_132;
              }
              break;
            case 3:
              int v110 = ne_log_obj();
              if (os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v37;
                *(_WORD *)&uint8_t buf[8] = 1024;
                *(_DWORD *)&buf[10] = v105;
                v108 = v110;
                CFTypeID v109 = "IPSec Network Configuration: BROWSER-PROXY[%d] = connection-type %d.\n";
                goto LABEL_132;
              }
              break;
            case 4:
              v111 = ne_log_obj();
              if (os_log_type_enabled(v111, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v37;
                *(_WORD *)&uint8_t buf[8] = 1024;
                *(_DWORD *)&buf[10] = v105;
                _os_log_impl(&dword_0, v111, OS_LOG_TYPE_DEFAULT, "IPSec Network Configuration: BROWSER-PROXY[%d] = auto-detect %d.\n", buf, 0xEu);
              }
              HIDWORD(v174) = v105;
              break;
            case 5:
              CFTypeID v112 = ne_log_obj();
              if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v37;
                *(_WORD *)&uint8_t buf[8] = 1024;
                *(_DWORD *)&buf[10] = v105;
                v108 = v112;
                CFTypeID v109 = "IPSec Network Configuration: BROWSER-PROXY[%d] = protocol %d.\n";
LABEL_132:
                uint32_t v113 = 14;
                goto LABEL_150;
              }
              break;
            case 6:
              if (!v192)
              {
                CFStringRef v114 = v102 + 8;
                if (*((_WORD *)v102 + 3))
                {
                  unsigned int v115 = v105 - 1;
                  if (v114[(v105 - 1)]) {
                    unsigned int v115 = v105;
                  }
                }
                else
                {
                  unsigned int v115 = 0;
                }
                CFStringRef v192 = CFStringCreateWithBytes(0, v114, v115, 0x8000100u, 0);
                unint64_t v120 = ne_log_obj();
                if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
                {
                  CFStringRef v121 = CFStringGetCStringPtr(v192, 0);
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)&buf[4] = v37;
                  *(_WORD *)&uint8_t buf[8] = 2080;
                  *(void *)&buf[10] = v121;
                  v108 = v120;
                  CFTypeID v109 = "IPSec Network Configuration: BROWSER-PROXY[%d] = server %s.\n";
                  goto LABEL_149;
                }
              }
              break;
            case 7:
              CFTypeID v116 = ne_log_obj();
              if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v37;
                *(_WORD *)&uint8_t buf[8] = 1024;
                *(_DWORD *)&buf[10] = v105;
                _os_log_impl(&dword_0, v116, OS_LOG_TYPE_DEFAULT, "IPSec Network Configuration: BROWSER-PROXY[%d] = port %d.\n", buf, 0xEu);
              }
              int v99 = v105;
              break;
            case 8:
              CFArrayRef v117 = ne_log_obj();
              if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 67109376;
                *(_DWORD *)&buf[4] = v37;
                *(_WORD *)&uint8_t buf[8] = 1024;
                *(_DWORD *)&buf[10] = v105;
                _os_log_impl(&dword_0, v117, OS_LOG_TYPE_DEFAULT, "IPSec Network Configuration: BROWSER-PROXY[%d] = bypass-local %d.\n", buf, 0xEu);
              }
              LODWORD(v174) = v105;
              break;
            case 9:
              if (!v191)
              {
                CFStringRef v191 = CFStringCreateWithBytes(0, v102 + 8, v105, 0, 0);
                CFArrayRef v118 = ne_log_obj();
                if (os_log_type_enabled(v118, OS_LOG_TYPE_DEFAULT))
                {
                  CFTypeID v119 = CFStringGetCStringPtr(v191, 0);
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)&buf[4] = v37;
                  *(_WORD *)&uint8_t buf[8] = 2080;
                  *(void *)&buf[10] = v119;
                  v108 = v118;
                  CFTypeID v109 = "IPSec Network Configuration: BROWSER-PROXY[%d] = bypass-address-list %s.\n";
LABEL_149:
                  uint32_t v113 = 18;
LABEL_150:
                  _os_log_impl(&dword_0, v108, OS_LOG_TYPE_DEFAULT, v109, buf, v113);
                }
              }
              break;
            default:
              break;
          }
          if (v104 >> 16 >= 0) {
            uint64_t v122 = v105;
          }
          else {
            uint64_t v122 = 0;
          }
          CFRange v102 = &v103[v122];
          int v123 = v100 - v122;
          ++v37;
          int v100 = v123 - 4;
        }
        while (v123 > 4);
        int v171 = v99;
        long long v33 = v101;
        goto LABEL_156;
      default:
        if (v41 == 3 && (v193 || (v193 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks)) != 0))
        {
          unsigned int v47 = v34;
          CFStringRef v48 = CFStringCreateWithFormat(0, 0, @"%d.%d.%d.%d", v33[4], v33[5], v33[6], v33[7]);
          if (v48)
          {
            CFStringRef v49 = v48;
            CFArrayAppendValue(v193, v48);
            unsigned int v50 = ne_log_obj();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              int v51 = CFStringGetCStringPtr(v49, 0);
              *(_DWORD *)buf = 136315138;
              *(void *)&buf[4] = v51;
              _os_log_impl(&dword_0, v50, OS_LOG_TYPE_DEFAULT, "IPSec Network Configuration: INTERNAL-IP4-DNS = %s.\n", buf, 0xCu);
            }
            CFRelease(v49);
          }
          unsigned int v34 = v47;
        }
        goto LABEL_158;
    }
    while (2)
    {
      long long v73 = CFDictionaryCreateMutable(0, 0, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFDictionarySetValue(v73, @"Mode", @"Tunnel");
      CFDictionarySetValue(v73, @"Direction", @"InOut");
      CFDictionarySetValue(v73, @"Level", @"Unique");
      v74.s_addr = v186;
      long long v75 = inet_ntoa(v74);
      AddString(v73, @"LocalAddress", v75);
      AddNumber(v73, @"LocalPrefix", 32);
      in_addr_t v76 = *v68;
      v77.s_addr = *v68;
      long long v78 = inet_ntoa(v77);
      AddString(v73, @"RemoteAddress", v78);
      unsigned int v79 = v68[1];
      if (!*v184)
      {
        if (v79 == -1)
        {
          in_addr_t *v184 = v76;
        }
        else
        {
          in_addr_t *v184 = v76 | 0x1000000;
          if (!v79) {
            goto LABEL_99;
          }
        }
        goto LABEL_101;
      }
      if (v79)
      {
LABEL_101:
        int v80 = 32 - __clz(__rbit32(bswap32(v79)));
        goto LABEL_102;
      }
LABEL_99:
      int v80 = 0;
LABEL_102:
      AddNumber(v73, @"RemotePrefix", v80);
      if (!v72)
      {
        long long v81 = ne_log_obj();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v81, OS_LOG_TYPE_DEFAULT, "IPSec Network Configuration: SPLIT-INCLUDE.\n", buf, 2u);
        }
      }
      update_service_route(v28, v186, -1, v69, 0, 0, 0, 0);
      CFArrayAppendValue(value, v73);
      CFRelease(v73);
      ++v72;
      v71 -= 14;
      long long v68 = (in_addr_t *)((char *)v68 + 14);
      if (v71 > 14) {
        continue;
      }
      break;
    }
    int v172 = 0;
    v182 += v70 + 1;
LABEL_116:
    long long v33 = v176;
LABEL_156:
    unsigned int v34 = v181;
LABEL_157:
    int v40 = v178;
    LODWORD(v42) = v177;
LABEL_158:
    if (v40 >> 16 >= 0) {
      uint64_t v124 = v42;
    }
    else {
      uint64_t v124 = 0;
    }
    int v125 = v34 - v124;
    unsigned int v34 = v34 - v124 - 4;
    v33 += v124 + 4;
    if (v125 - 4 > 0) {
      continue;
    }
    break;
  }
  if (v172)
  {
    v126 = CFDictionaryCreateMutable(0, 0, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(v126, @"Mode", @"Tunnel");
    CFDictionarySetValue(v126, @"Direction", @"InOut");
    CFDictionarySetValue(v126, @"Level", @"Require");
    unsigned int v128 = v186;
    v127.s_addr = v186;
    in_addr_t v199 = v186;
    int v129 = inet_ntoa(v127);
    AddString(v126, @"LocalAddress", v129);
    AddNumber(v126, @"LocalPrefix", 32);
    int v130 = ne_log_obj();
    if (os_log_type_enabled(v130, OS_LOG_TYPE_DEFAULT))
    {
      v131.s_addr = v186;
      int v132 = inet_ntoa(v131);
      *(_DWORD *)buf = 136315394;
      *(void *)&buf[4] = v132;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 32;
      _os_log_impl(&dword_0, v130, OS_LOG_TYPE_DEFAULT, "IPSec Network Configuration: DEFAULT-ROUTE = local-address %s/%d.\n", buf, 0x12u);
    }
    *(_DWORD *)(v28 + 908) = v186;
    CFDictionarySetValue(v126, @"RemoteAddress", @"0.0.0.0");
    AddNumber(v126, @"RemotePrefix", 0);
    update_service_route(v28, v186, -1, 0, 0, 0, 0, 0);
    int v133 = value;
    CFArrayAppendValue(value, v126);
    CFRelease(v126);
    int v134 = v172;
  }
  else
  {
    int v134 = 0;
    int v133 = value;
    unsigned int v128 = v186;
  }
  CFDictionarySetValue(Mutable, @"Policies", v133);
  CFRelease(v133);
  int v135 = a3;
  if (!a3)
  {
LABEL_187:
    if (!a2)
    {
      my_CFRelease((const void **)&v194);
      my_CFRelease((const void **)&v195);
      my_CFRelease((const void **)&v193);
      my_CFRelease((const void **)&v192);
      my_CFRelease((const void **)&v191);
      my_CFRelease((const void **)&v198);
      my_CFRelease((const void **)&v197);
      my_CFRelease((const void **)&Mutable);
LABEL_224:
      if (v135) {
        *(_DWORD *)(v28 + 876) = 1;
      }
      v167 = ne_log_obj();
      if (os_log_type_enabled(v167, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v167, OS_LOG_TYPE_DEFAULT, "IPSec Network Configuration established.\n", buf, 2u);
      }
      return;
    }
    SCNetworkReachabilityFlags flags = 0;
    long long v139 = SCNetworkReachabilityCreateWithAddress(0, (const sockaddr *)(v28 + 744));
    int v140 = SCNetworkReachabilityGetFlags(v139, &flags);
    SCNetworkReachabilityFlags v141 = flags;
    CFRelease(v139);
    *(void *)buf = 0;
    __s[0] = 0;
    if (v140 && (v141 & 0x20000) != 0 || !*(_DWORD *)(v28 + 940))
    {
      if (!*(unsigned char *)(v28 + 918))
      {
        v143 = 0;
        if (v172) {
          goto LABEL_195;
        }
        goto LABEL_198;
      }
      long long v142 = (char *)CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
      v143 = v142;
      __s[0] = v142;
      unsigned int v144 = *(_DWORD *)(v28 + 748);
      unsigned int v145 = 0;
      uint64_t v146 = v28 + 918;
    }
    else
    {
      long long v142 = (char *)CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
      v143 = v142;
      __s[0] = v142;
      unsigned int v144 = *(_DWORD *)(v28 + 748);
      unsigned int v145 = *(_DWORD *)(v28 + 940);
      uint64_t v146 = 0;
    }
    sub_24AEC((__CFArray *)v142, v144, 0xFFFFFFFF, v145, 1, v146);
    if (v172)
    {
LABEL_195:
      v147 = 0;
      goto LABEL_200;
    }
LABEL_198:
    in_addr_t v199 = v128;
    v147 = sub_24D04(Mutable, v186);
    *(void *)buf = v147;
    if (!v147) {
      sub_1F39C(3, @"IPSec Controller: create_ipv4_route_array failed");
    }
LABEL_200:
    if (!*(void *)(v28 + 584)) {
      sub_24FE0(v28, &v199, v134);
    }
    v198 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    v197 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    stateaddr = create_stateaddr(gDynamicStore, *(void *)(v28 + 24), v28 + 104, *(_DWORD *)(v28 + 748), v128, v128, v168, v134, v147, v143);
    my_CFRelease((const void **)buf);
    my_CFRelease((const void **)__s);
    if (stateaddr)
    {
      CFArrayAppendValue(v197, kSCEntNetIPv4);
      CFArrayAppendValue(v198, stateaddr);
      CFRelease(stateaddr);
    }
    if (v172)
    {
      ipv6_dummy_primary = create_ipv6_dummy_primary(v28 + 104);
      if (ipv6_dummy_primary)
      {
        v150 = ipv6_dummy_primary;
        *(_DWORD *)(v28 + 892) = 1;
        CFArrayAppendValue(v197, kSCEntNetIPv6);
        CFArrayAppendValue(v198, v150);
        CFRelease(v150);
      }
    }
    if (v193)
    {
      v152 = v194;
      CFStringRef v151 = v195;
      if (!v194 && v195)
      {
        CFMutableArrayRef v153 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
        v194 = v153;
        CFStringRef v151 = v195;
        if (v153)
        {
          CFArrayAppendValue(v153, v195);
          v152 = v194;
          CFStringRef v151 = v195;
        }
        else
        {
          v152 = 0;
        }
      }
      dns = create_dns((const __SCDynamicStore *)gDynamicStore, *(CFStringRef *)(v28 + 24), v193, v151, v152, 0);
      if (dns)
      {
        v155 = dns;
        CFArrayAppendValue(v197, kSCEntNetDNS);
        CFArrayAppendValue(v198, v155);
        CFRelease(v155);
      }
    }
    if (v173 == 2)
    {
      uint64_t v156 = gDynamicStore;
      uint64_t v157 = *(void *)(v28 + 24);
      CFStringRef v159 = v191;
      CFStringRef v158 = v192;
      v160 = v194;
      int v162 = v174;
      int v161 = HIDWORD(v174);
      int v163 = v171;
    }
    else
    {
      v160 = v194;
      if (!v194)
      {
LABEL_221:
        uint64_t v166 = *(void *)(v28 + 584);
        if (v166) {
          ne_sm_bridge_filter_state_dictionaries(v166);
        }
        publish_multiple_dicts((const __SCDynamicStore *)gDynamicStore, *(const __CFString **)(v28 + 24), v197, v198);
        sub_1F39C(7, @"IPSec Controller: Published dictionaries to dynamic store.");
        my_CFRelease((const void **)&v194);
        my_CFRelease((const void **)&v195);
        my_CFRelease((const void **)&v193);
        my_CFRelease((const void **)&v192);
        my_CFRelease((const void **)&v191);
        my_CFRelease((const void **)&v198);
        my_CFRelease((const void **)&v197);
        my_CFRelease((const void **)&Mutable);
        *(_DWORD *)(v28 + 872) = 1;
        int v135 = a3;
        goto LABEL_224;
      }
      uint64_t v156 = gDynamicStore;
      uint64_t v157 = *(void *)(v28 + 24);
      int v161 = 0;
      CFStringRef v158 = 0;
      int v163 = 0;
      int v162 = 0;
      CFStringRef v159 = 0;
    }
    proxies = create_proxies(v156, v157, v161, v158, v163, v162, v159, v160);
    if (proxies)
    {
      v165 = proxies;
      CFArrayAppendValue(v197, kSCEntNetProxies);
      CFArrayAppendValue(v198, v165);
      CFRelease(v165);
    }
    goto LABEL_221;
  }
  sub_1F39C(7, @"IPSec Controller: Mode Config Policies %@");
  if ((IPSecInstallPolicies(Mutable, -1, &v196) & 0x80000000) != 0)
  {
    CFStringRef v137 = @"IPSec Controller: IPSecInstallPolicies failed '%s'";
    goto LABEL_181;
  }
  *(void *)(v28 + 880) = my_CFRetain(Mutable);
  *(_DWORD *)(v28 + 888) = v134;
  *(_DWORD *)(v28 + 896) = v128;
  *(_DWORD *)(v28 + 900) = v168;
  int tun_interface = create_tun_interface((void *)(v28 + 104), 0x10u, (unsigned int *)(v28 + 120), 3, 0);
  *(_DWORD *)(v28 + 904) = tun_interface;
  if (tun_interface == -1)
  {
    CFStringRef v137 = @"IPSec Controller: cannot create tunnel interface";
    goto LABEL_181;
  }
  if (set_tun_delegate(tun_interface, (char *)(v28 + 918)))
  {
    CFStringRef v137 = @"IPSec Controller: cannot set delegate interface for tunnel interface";
    goto LABEL_181;
  }
  set_ifmtu(v28 + 104, 1280);
  set_ifaddr(v28 + 104, v128, v128, v168);
  if (!racoon_send_cmd_start_ph2(*(_DWORD *)(v28 + 784), *(_DWORD *)(v28 + 748), Mutable))
  {
    sub_24920((const char *)(v28 + 104), v184);
    goto LABEL_187;
  }
  CFStringRef v137 = @"IPSec Controller: racoon_send_cmd_start_ph2 failed '%s'";
LABEL_181:
  sub_1F39C(3, v137);
  my_CFRelease((const void **)&v194);
  my_CFRelease((const void **)&v195);
  my_CFRelease((const void **)&v193);
  my_CFRelease((const void **)&v192);
  my_CFRelease((const void **)&v191);
  my_CFRelease((const void **)(v28 + 960));
  my_CFRelease((const void **)&v198);
  my_CFRelease((const void **)&v197);
  my_CFRelease((const void **)&Mutable);
  CFDictionaryRef v138 = *(const __CFDictionary **)(v28 + 880);
  if (v138)
  {
    IPSecRemovePolicies(v138, -1, &v196);
    my_CFRelease((const void **)(v28 + 880));
  }
  if (*(_DWORD *)(v28 + 888)) {
    *(_DWORD *)(v28 + 888) = 0;
  }
  my_close(*(unsigned int *)(v28 + 904));
  *(_DWORD *)(v28 + 904) = -1;
}

uint64_t ipsec_uninstall(uint64_t a1)
{
  return 0;
}

void sub_217B8(uint64_t a1, int a2)
{
  unsigned int v6 = 0;
  CFMutableArrayRef v7 = 0;
  if (*(_DWORD *)(a1 + 872))
  {
    CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    CFMutableArrayRef v7 = Mutable;
    CFArrayAppendValue(Mutable, kSCEntNetIPv4);
    if (*(_DWORD *)(a1 + 892))
    {
      CFArrayAppendValue(Mutable, kSCEntNetIPv6);
      *(_DWORD *)(a1 + 892) = 0;
    }
    CFArrayAppendValue(Mutable, kSCEntNetDNS);
    CFArrayAppendValue(Mutable, kSCEntNetProxies);
    unpublish_multiple_dicts((const __SCDynamicStore *)gDynamicStore, *(const __CFString **)(a1 + 24), Mutable, 1);
    my_CFRelease((const void **)&v7);
    if (*(_DWORD *)(a1 + 888)) {
      *(_DWORD *)(a1 + 888) = 0;
    }
    my_CFRelease((const void **)(a1 + 960));
    *(_DWORD *)(a1 + 872) = 0;
  }
  if (a2 && *(_DWORD *)(a1 + 876))
  {
    CFDictionaryRef v5 = *(const __CFDictionary **)(a1 + 880);
    if (v5)
    {
      if (IPSecRemovePolicies(v5, -1, &v6)) {
        sub_1F39C(3, @"IPSec Controller: Cannot remove mode config policies, error '%s'");
      }
      my_CFRelease((const void **)(a1 + 880));
    }
    IPSecRemoveSecurityAssociations((unsigned __int8 *)(a1 + 616), (unsigned __int8 *)(a1 + 744));
    clear_ifaddr(a1 + 104, *(_DWORD *)(a1 + 896));
    my_close(*(unsigned int *)(a1 + 904));
    *(_DWORD *)(a1 + 904) = -1;
    free_service_routes(a1);
    *(_DWORD *)(a1 + 876) = 0;
  }
}

uint64_t ipsec_ondemand_add_service_data(uint64_t a1, __CFDictionary *a2)
{
  CFStringRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 136), kSCPropNetIPSecOnDemandMatchDomainsAlways);
  if (isArray(Value)) {
    CFDictionarySetValue(a2, @"OnDemandMatchDomainsAlways", Value);
  }
  CFDictionaryRef v5 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 136), kSCPropNetIPSecOnDemandMatchDomainsOnRetry);
  if (isArray(v5)) {
    CFDictionarySetValue(a2, @"OnDemandMatchDomainsOnRetry", v5);
  }
  unsigned int v6 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 136), kSCPropNetIPSecOnDemandMatchDomainsNever);
  if (isArray(v6)) {
    CFDictionarySetValue(a2, @"OnDemandMatchDomainsNever", v6);
  }
  CFMutableArrayRef v7 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 136), @"RemoteAddress");
  if (isString(v7)) {
    CFDictionarySetValue(a2, @"RemoteAddress", v7);
  }
  return 0;
}

uint64_t racoon_send_cmd_reconnect(int a1, int a2)
{
  v4[1] = 0x400000000000000;
  v4[0] = 5888;
  int v5 = a2;
  sub_1F39C(5, @"IPSec Controller: sending RECONNECT to racoon control socket");
  sub_21AB4(a1, (uint64_t)v4, 0x14uLL);
  return 0;
}

uint64_t sub_21AB4(int __fd, uint64_t a2, unint64_t a3)
{
  if (!a3) {
    return sub_1F39C(5, @"Sent %zd/%zu bytes");
  }
  unint64_t v6 = 0;
  while (1)
  {
    ssize_t v7 = write(__fd, (const void *)(a2 + v6), a3 - v6);
    if (v7 < 1) {
      break;
    }
    v6 += v7;
LABEL_11:
    if (v6 >= a3) {
      return sub_1F39C(5, @"Sent %zd/%zu bytes");
    }
  }
  int v8 = *__error();
  if (v8 != 35)
  {
    if (v8 != 4)
    {
      strerror(v8);
      CFStringRef v11 = @"Received write error %s";
      goto LABEL_16;
    }
    strerror(4);
    uint64_t v9 = 5;
    CFStringRef v10 = @"Received write error %s";
    goto LABEL_10;
  }
  strerror(35);
  sub_1F39C(3, @"Received write error %s");
  if (!write_barrier(__fd))
  {
    uint64_t v9 = 6;
    CFStringRef v10 = @"Received writeable event";
LABEL_10:
    sub_1F39C(v9, v10);
    goto LABEL_11;
  }
  CFStringRef v11 = @"Failed to write packet";
LABEL_16:
  sub_1F39C(3, v11);
  return sub_1F39C(5, @"Sent %zd/%zu bytes");
}

void ipsec_network_event(uint64_t a1, uint64_t a2)
{
  context.version = 0;
  memset(&context.retain, 0, 24);
  context.mach_timebase_info info = (void *)a1;
  CFStringRef v54 = 0;
  if (*(unsigned char *)(a1 + 617) == 2) {
    IPSecLogVPNInterfaceAddressEvent((uint64_t)"ipsec_network_event", a2, *(_DWORD *)(a1 + 972), (char *)(a1 + 918), (void *)(a1 + 620));
  }
  if (*(void *)(a1 + 584))
  {
    if ((*(unsigned char *)(a1 + 74) & 0x20) != 0)
    {
      if (*(unsigned char *)(a1 + 934))
      {
        v59[0] = 0;
        int is_cellular = primary_interface_is_cellular(v59);
        if (v59[0])
        {
          if (!is_cellular)
          {
            CFStringRef v5 = @"IPSec Controller: Disconnecting tunnel over cellular in favor of better interface";
            uint64_t v6 = 5;
LABEL_19:
            sub_1F39C(v6, v5);
            *(_DWORD *)(a1 + 596) = 15;
            ipsec_stop(a1);
            return;
          }
        }
      }
    }
  }
  if ((*(_DWORD *)(a2 + 20) - 1) > 2) {
    return;
  }
  snprintf(__str, 0x20uLL, "%s%d", (const char *)(a2 + 32), *(_DWORD *)(a2 + 28));
  if (strncmp(__str, (const char *)(a1 + 918), 0x10uLL))
  {
    if (*(_DWORD *)(a1 + 592) != 8
      || !*(void *)(a1 + 952)
      || (*(_DWORD *)(a2 + 20) - 1) > 1
      || *(__int16 *)(a2 + 48) == -343)
    {
      return;
    }
    CFStringRef v5 = @"IPSec Controller: an alternative interface %s was detected while the underlying interface %s was down.";
    goto LABEL_18;
  }
  if (*(_DWORD *)(a2 + 24) == 6)
  {
    CFStringRef v5 = @"IPSec Controller: Network changed on underlying PPP interface";
LABEL_18:
    uint64_t v6 = 3;
    goto LABEL_19;
  }
  if (getifaddrs(&v54))
  {
LABEL_22:
    ssize_t v7 = (const __SCDynamicStore *)gDynamicStore;
    if (gDynamicStore)
    {
      if ((*(_DWORD *)(a2 + 20) & 0xFFFFFFFE) != 2) {
        goto LABEL_47;
      }
      memset(v59, 0, 512);
      memset(v58, 0, 512);
      CFStringRef v8 = CFStringCreateWithCStringNoCopy(0, (const char *)(a1 + 918), 0x600u, kCFAllocatorNull);
      if (v8)
      {
        CFStringRef v9 = v8;
        CFMutableArrayRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
        CFStringRef v11 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
        CFStringRef NetworkInterfaceEntity = SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, kSCDynamicStoreDomainSetup, v9, kSCEntNetAirPort);
        CFArrayAppendValue(Mutable, NetworkInterfaceEntity);
        CFRelease(NetworkInterfaceEntity);
        CFStringRef v13 = SCDynamicStoreKeyCreateNetworkInterfaceEntity(0, kSCDynamicStoreDomainState, v9, kSCEntNetAirPort);
        CFArrayAppendValue(Mutable, v13);
        CFRelease(v13);
        CFStringRef NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(0, kSCDynamicStoreDomainSetup, kSCCompAnyRegex, kSCEntNetInterface);
        CFArrayAppendValue(v11, NetworkServiceEntity);
        CFRelease(NetworkServiceEntity);
        CFStringRef v15 = SCDynamicStoreKeyCreateNetworkServiceEntity(0, kSCDynamicStoreDomainSetup, kSCCompAnyRegex, kSCEntNetIPv4);
        CFArrayAppendValue(v11, v15);
        CFRelease(v15);
        CFDictionaryRef v16 = SCDynamicStoreCopyMultiple(v7, Mutable, v11);
        CFRelease(Mutable);
        CFRelease(v11);
        if (v16)
        {
          CFIndex Count = CFDictionaryGetCount(v16);
          if (Count <= 0)
          {
            syslog(3, "%s: empty SCDynamicStore dictionary", "ipsec_network_event");
            CFRelease(v9);
            int v33 = 0;
            int v34 = 0;
          }
          else
          {
            CFIndex v18 = Count;
            CFStringRef cf1 = v9;
            if ((unint64_t)Count < 0x81)
            {
              vm_address_t v20 = (const void **)v58;
              uint64_t v19 = (const void **)v59;
            }
            else
            {
              uint64_t v19 = (const void **)CFAllocatorAllocate(0, 8 * Count, 0);
              vm_address_t v20 = (const void **)CFAllocatorAllocate(0, 8 * v18, 0);
            }
            CFDictionaryRef theDict = v16;
            CFDictionaryGetKeysAndValues(v16, v19, v20);
            int v52 = 0;
            for (uint64_t i = 0; i != v18; ++i)
            {
              CFStringRef v36 = (const __CFString *)v19[i];
              CFDictionaryRef v37 = (const __CFDictionary *)v20[i];
              CFTypeID TypeID = CFStringGetTypeID();
              if (v36)
              {
                if (CFGetTypeID(v36) == TypeID)
                {
                  CFTypeID v39 = CFDictionaryGetTypeID();
                  if (v37)
                  {
                    if (CFGetTypeID(v37) == v39)
                    {
                      if (CFStringHasSuffix(v36, kSCEntNetInterface))
                      {
                        CFStringRef Value = CFDictionaryGetValue(v37, kSCPropNetInterfaceDeviceName);
                        CFTypeID v41 = CFStringGetTypeID();
                        if (Value && CFGetTypeID(Value) == v41 && CFEqual(cf1, Value))
                        {
                          CFArrayRef ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(0, v36, @"/");
                          if (CFArrayGetCount(ArrayBySeparatingStrings) < 4)
                          {
                            int v46 = 0;
                          }
                          else
                          {
                            CFStringRef ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(ArrayBySeparatingStrings, 3);
                            CFStringRef v44 = SCDynamicStoreKeyCreateNetworkServiceEntity(0, kSCDynamicStoreDomainSetup, ValueAtIndex, kSCEntNetIPv4);
                            if (v44)
                            {
                              CFStringRef v45 = v44;
                              if (CFDictionaryGetValue(theDict, v44))
                              {
                                int v46 = 0;
                              }
                              else
                              {
                                syslog(5, "%s: detected disabled IPv4 Config", "ipsec_network_event");
                                int v46 = 1;
                              }
                              CFRelease(v45);
                            }
                            else
                            {
                              syslog(5, "%s: detected disabled IPv4 Config", "ipsec_network_event");
                              int v46 = 1;
                            }
                          }
                          if (ArrayBySeparatingStrings) {
                            CFRelease(ArrayBySeparatingStrings);
                          }
                          int v52 = 1;
                          int v33 = 1;
                          if (v46) {
                            goto LABEL_98;
                          }
                        }
                      }
                      else if (CFStringHasSuffix(v36, kSCEntNetAirPort))
                      {
                        if (CFStringHasPrefix(v36, kSCDynamicStoreDomainSetup))
                        {
                          unsigned int v47 = CFDictionaryGetValue(v37, @"PowerEnabled");
                          CFTypeID v48 = CFBooleanGetTypeID();
                          if (v47 && CFGetTypeID(v47) == v48 && CFEqual(v47, kCFBooleanFalse))
                          {
                            syslog(5, "%s: detected AirPort, PowerEnable == FALSE", "ipsec_network_event");
                            int v33 = 1;
                            goto LABEL_98;
                          }
                        }
                        else if (CFStringHasPrefix(v36, kSCDynamicStoreDomainState))
                        {
                          __int16 valuePtr = 0;
                          CFStringRef v49 = CFDictionaryGetValue(v37, @"Power Status");
                          CFTypeID v50 = CFNumberGetTypeID();
                          if (v49)
                          {
                            if (CFGetTypeID(v49) == v50
                              && CFNumberGetValue((CFNumberRef)v49, kCFNumberShortType, &valuePtr)
                              && !valuePtr)
                            {
                              syslog(5, "%s: detected AirPort, PowerStatus == 0", "ipsec_network_event");
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
            int v33 = 0;
LABEL_98:
            CFRelease(cf1);
            if (v19 != (const void **)v59)
            {
              CFAllocatorDeallocate(0, v19);
              CFAllocatorDeallocate(0, v20);
            }
            CFDictionaryRef v16 = theDict;
            int v34 = v52;
          }
          CFRelease(v16);
          if (v33 || !v34) {
            goto LABEL_103;
          }
LABEL_47:
          if (*(void *)(a1 + 952))
          {
            if (*(unsigned char *)(a1 + 617) != 2
              || *(_DWORD *)(a1 + 592) != 8
              || (*(_DWORD *)(a2 + 20) - 1) > 1
              || *(_DWORD *)(a1 + 620) == *(_DWORD *)(a2 + 48)
              || (unsigned __int16)*(_DWORD *)(a2 + 48) == 65193)
            {
              return;
            }
            CFStringRef v5 = @"IPSec Controller: the underlying interface %s address changed.";
          }
          else
          {
            sub_1F39C(3, @"IPSec Controller: Network changed, address disappeared on underlying interface, install timer %d secs");
            CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
            LODWORD(v28) = *(_DWORD *)(a1 + 972);
            CFRunLoopTimerRef v29 = CFRunLoopTimerCreate(0, Current + (double)v28, 3.1536e10, 0, 0, (CFRunLoopTimerCallBack)sub_227E4, &context);
            *(void *)(a1 + 952) = v29;
            if (v29)
            {
              sub_1FBF4(a1, 8u);
              CFStringRef v30 = CFRunLoopGetCurrent();
              CFRunLoopAddTimer(v30, *(CFRunLoopTimerRef *)(a1 + 952), kCFRunLoopCommonModes);
              if (*(void *)(a1 + 984))
              {
                in_addr v31 = (CFRunLoopTimerRef *)(a1 + 984);
                CFStringRef v32 = CFRunLoopGetCurrent();
                CFRunLoopRemoveTimer(v32, *v31, kCFRunLoopCommonModes);
                my_CFRelease((const void **)v31);
              }
              return;
            }
            CFStringRef v5 = @"IPSec Controller: Network changed, cannot create RunLoop timer";
          }
          goto LABEL_18;
        }
        syslog(3, "%s: failed to initialize SCDynamicStore dictionary", "ipsec_network_event");
        CFRelease(v9);
      }
      else
      {
        syslog(3, "%s: failed to initialize interface CFString", "ipsec_network_event");
      }
LABEL_103:
      CFStringRef v5 = @"IPSec Controller: the underlying interface/service has changed unrecoverably.";
      goto LABEL_18;
    }
    syslog(7, "%s: invalid SCDynamicStore reference", "ipsec_network_event");
    goto LABEL_47;
  }
  __int16 v21 = v54;
  if (!v54)
  {
    freeifaddrs(0);
    goto LABEL_22;
  }
  uint64_t v22 = v54;
  do
  {
    ifa_name = v22->ifa_name;
    if (!ifa_name) {
      goto LABEL_37;
    }
    ifa_addr = v22->ifa_addr;
    if (!ifa_addr) {
      goto LABEL_38;
    }
    if (!strncmp(ifa_name, (const char *)(a1 + 918), 0x10uLL) && ifa_addr->sa_family == 2 && *(unsigned char *)(a1 + 617) == 2) {
      LODWORD(ifa_addr) = *(_DWORD *)&ifa_addr->sa_data[2] == *(_DWORD *)(a1 + 620);
    }
    else {
LABEL_37:
    }
      LODWORD(ifa_addr) = 0;
LABEL_38:
    uint64_t v22 = v22->ifa_next;
    if (v22) {
      BOOL v25 = ifa_addr == 0;
    }
    else {
      BOOL v25 = 0;
    }
  }
  while (v25);
  freeifaddrs(v21);
  if (!ifa_addr) {
    goto LABEL_22;
  }
  if (*(void *)(a1 + 952))
  {
    sub_1FBF4(a1, 6u);
    sub_1F39C(3, @"IPSec Controller: Network changed, address came back on underlying interface, cancel timer");
    uint64_t v26 = CFRunLoopGetCurrent();
    CFRunLoopRemoveTimer(v26, *(CFRunLoopTimerRef *)(a1 + 952), kCFRunLoopCommonModes);
    my_CFRelease((const void **)(a1 + 952));
    if ((*(unsigned char *)(a1 + 73) & 4) != 0)
    {
      racoon_send_cmd_start_dpd(*(_DWORD *)(a1 + 784), *(_DWORD *)(a1 + 748));
      *(_DWORD *)(a1 + 992) = 1;
    }
    else
    {
      sub_1F39C(5, @"IPSec Controller: asserting connection");
      racoon_send_cmd_assert(a1);
    }
  }
}

uint64_t racoon_send_cmd_start_dpd(int a1, int a2)
{
  v4[1] = 0x400000000000000;
  v4[0] = 5376;
  int v5 = a2;
  sub_1F39C(5, @"IPSec Controller: sending START_DPD to racoon control socket");
  sub_21AB4(a1, (uint64_t)v4, 0x14uLL);
  return 0;
}

uint64_t racoon_send_cmd_assert(uint64_t a1)
{
  context.version = 0;
  memset(&context.retain, 0, 24);
  context.mach_timebase_info info = (void *)a1;
  uint64_t v8 = 5632;
  uint64_t v9 = 0;
  int v10 = 0;
  if (*(unsigned char *)(a1 + 617) == 2) {
    int v10 = *(_DWORD *)(a1 + 620);
  }
  int v11 = *(_DWORD *)(a1 + 748);
  HIWORD(v9) = 2048;
  sub_21AB4(*(_DWORD *)(a1 + 784), (uint64_t)&v8, 0x18uLL);
  *(_DWORD *)(a1 + 912) = 0;
  if (*(_DWORD *)(a1 + 592) == 6) {
    *(_DWORD *)(a1 + 600) = 1;
  }
  CFDictionaryRef v2 = *(__CFRunLoopTimer **)(a1 + 776);
  double v3 = CFAbsoluteTimeGetCurrent() + 3.0;
  if (v2)
  {
    CFRunLoopTimerSetNextFireDate(v2, v3);
LABEL_9:
    sub_1F39C(5, @"IPSec Controller: wait for %d secs before forcing SAs to rekey");
    return 0;
  }
  CFRunLoopTimerRef v4 = CFRunLoopTimerCreate(0, v3, 3.1536e10, 0, 0, (CFRunLoopTimerCallBack)sub_233C4, &context);
  *(void *)(a1 + 776) = v4;
  if (v4)
  {
    CFAbsoluteTime Current = CFRunLoopGetCurrent();
    CFRunLoopAddTimer(Current, *(CFRunLoopTimerRef *)(a1 + 776), kCFRunLoopCommonModes);
    goto LABEL_9;
  }
  sub_1F39C(3, @"IPSec Controller: assert cannot create RunLoop timer");
  if (!*(_DWORD *)(a1 + 596)) {
    *(_DWORD *)(a1 + 596) = 1;
  }
  sub_1F39C(3, @"IPSec Controller: ASSERT failed");
  ipsec_stop(a1);
  return 0xFFFFFFFFLL;
}

uint64_t sub_227E4(uint64_t a1, uint64_t a2)
{
  sub_1F39C(5, @"IPSec Controller: Network change event timer expired");
  if (*(unsigned char *)(a2 + 617) == 2) {
    IPSecLogVPNInterfaceAddressEvent((uint64_t)"event_timer", 0, *(_DWORD *)(a2 + 972), (char *)(a2 + 918), (void *)(a2 + 620));
  }
  *(_DWORD *)(a2 + 596) = 15;

  return ipsec_stop(a2);
}

uint64_t racoon_send_cmd_connect(int a1, int a2)
{
  v6[1] = 0x400000000000000;
  v6[0] = 4352;
  int v7 = a2;
  sub_1F39C(5, @"IPSec Controller: sending CONNECT to racoon control socket");
  sub_21AB4(a1, (uint64_t)v6, 0x14uLL);
  double v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "IPSec Phase1 starting.\n", v5, 2u);
  }
  return 0;
}

uint64_t racoon_send_cmd_disconnect(int a1, int a2)
{
  v4[1] = 0x400000000000000;
  v4[0] = 4608;
  int v5 = a2;
  sub_1F39C(5, @"IPSec Controller: sending DISCONNECT to racoon control socket, address 0x%x");
  sub_21AB4(a1, (uint64_t)v4, 0x14uLL);
  return 0;
}

uint64_t racoon_send_cmd_bind(int a1, int a2, char *__s)
{
  if (__s) {
    signed int v6 = strlen(__s);
  }
  else {
    signed int v6 = 0;
  }
  uint64_t v9 = 0;
  HIWORD(v9) = bswap32(v6 + 8) >> 16;
  uint64_t v8 = 256;
  int v10 = a2;
  unsigned int v11 = bswap32(v6) >> 16;
  sub_1F39C(5, @"IPSec Controller: sending BIND to racoon control socket");
  sub_21AB4(a1, (uint64_t)&v8, 0x18uLL);
  if (v6) {
    sub_21AB4(a1, (uint64_t)__s, v6);
  }
  return 0;
}

uint64_t racoon_send_cmd_set_nat64_prefix(int a1, long long *a2)
{
  v4[1] = 0x1000000000000000;
  v4[0] = 6144;
  long long v5 = *a2;
  sub_1F39C(5, @"IPSec Controller: sending SET_NAT64_PREFIX to racoon control socket");
  sub_21AB4(a1, (uint64_t)v4, 0x20uLL);
  return 0;
}

uint64_t racoon_send_cmd_unbind(int a1, int a2)
{
  v4[1] = 0x400000000000000;
  v4[0] = 512;
  int v5 = a2;
  sub_1F39C(5, @"IPSec Controller: sending UNBIND to racoon control socket");
  sub_21AB4(a1, (uint64_t)v4, 0x14uLL);
  return 0;
}

uint64_t racoon_send_cmd_start_ph2(int a1, int a2, const __CFDictionary *a3)
{
  int v6 = IPSecCountPolicies(a3);
  if (v6 < 1 || (size_t v7 = 48 * v6 + 88, (v8 = malloc_type_malloc(v7, 0xFE5E5D8uLL)) == 0))
  {
    sub_1F39C(3, @"IPSec Controller: failed to start phase2 - '%s'");
    return 0xFFFFFFFFLL;
  }
  uint64_t v9 = v8;
  bzero(v8, v7);
  _WORD *v9 = 4864;
  *((_DWORD *)v9 + 4) = a2;
  *((_DWORD *)v9 + 5) = 269352960;
  *(_DWORD *)(v9 + 13) = 117440512;
  if (!GetStrAddrFromDict(a3, @"LocalAddress", v51, 256)
    || !GetStrAddrFromDict(a3, @"RemoteAddress", v50, 256)
    || (CFStringRef Value = CFDictionaryGetValue(a3, @"Policies"), !isArray(Value))
    || (CFIndex Count = CFArrayGetCount((CFArrayRef)Value)) == 0)
  {
LABEL_59:
    sub_1F39C(3, @"IPSec Controller: failed to start phase2 - '%s'");
    free(v9);
    return 0xFFFFFFFFLL;
  }
  int __fd = a1;
  int v12 = (in_addr *)(v9 + 16);
  if (Count >= 1)
  {
    CFIndex v13 = Count;
    CFIndex v14 = 0;
    uint64_t v15 = 0;
    CFIndex v41 = Count;
    CFIndex v42 = Value;
    while (1)
    {
      v48.in_addr_t s_addr = 0;
      *(void *)&v47[0].in_addr_t s_addr = 0;
      int v45 = 255;
      int v46 = 0;
      CFStringRef ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)Value, v14);
      if (!isDictionary(ValueAtIndex)) {
        goto LABEL_59;
      }
      CFTypeID v17 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"Mode");
      if (isString(v17) && !CFEqual(v17, @"Tunnel"))
      {
        if (!CFEqual(v17, @"Transport")) {
          goto LABEL_59;
        }
        char v18 = 1;
      }
      else
      {
        char v18 = 0;
      }
      uint64_t v19 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"Direction");
      if (!isString(v19)) {
        goto LABEL_21;
      }
      if (CFEqual(v19, @"In"))
      {
        char v20 = 0;
        char v43 = 1;
      }
      else
      {
        if (!CFEqual(v19, @"Out"))
        {
          if (!CFEqual(v19, @"InOut")) {
            goto LABEL_59;
          }
LABEL_21:
          char v20 = 0;
          char v43 = 0;
          goto LABEL_22;
        }
        char v43 = 0;
        char v20 = 1;
      }
LABEL_22:
      __int16 v21 = CFDictionaryGetValue((CFDictionaryRef)ValueAtIndex, @"Level");
      if (isString(v21) && (CFEqual(v21, @"Unique") || CFEqual(v21, @"Require")))
      {
        if (v18)
        {
          unsigned int v44 = 0;
          GetIntFromDict((const __CFDictionary *)ValueAtIndex, @"LocalPort", &v44, 0);
          unsigned int v22 = (unsigned __int16)v44;
          if (!inet_aton(v51, &v48)) {
            goto LABEL_59;
          }
          uint64_t v23 = v15;
          in_addr_t s_addr = v48.s_addr;
          GetIntFromDict((const __CFDictionary *)ValueAtIndex, @"RemotePort", &v44, 0);
          unsigned int v25 = v44;
          if (!inet_aton(v50, &v47[1])) {
            goto LABEL_59;
          }
          unsigned int v26 = bswap32(v22) >> 16;
          unsigned int v27 = bswap32(v25) >> 16;
          if (s_addr) {
            unsigned int v28 = -1;
          }
          else {
            unsigned int v28 = 0;
          }
          if (v47[1].s_addr) {
            unsigned int v29 = -1;
          }
          else {
            unsigned int v29 = 0;
          }
          GetIntFromDict((const __CFDictionary *)ValueAtIndex, @"Protocol", &v45, 0);
LABEL_49:
          char v33 = v43;
        }
        else
        {
          if (!GetStrAddrFromDict((const __CFDictionary *)ValueAtIndex, @"LocalAddress", v49, 256)
            || !inet_aton(v49, &v48))
          {
            goto LABEL_59;
          }
          GetIntFromDict((const __CFDictionary *)ValueAtIndex, @"LocalPrefix", v47, 32);
          in_addr_t v30 = v47[0].s_addr;
          if (v47[0].s_addr)
          {
            unsigned int v31 = 0;
            do
            {
              unsigned int v28 = (v31 >> 1) | 0x80000000;
              unsigned int v31 = v28;
              --v30;
            }
            while (v30);
          }
          else
          {
            unsigned int v28 = 0;
          }
          if (!GetStrAddrFromDict((const __CFDictionary *)ValueAtIndex, @"RemoteAddress", v49, 256)
            || !inet_aton(v49, &v47[1]))
          {
            goto LABEL_59;
          }
          uint64_t v23 = v15;
          GetIntFromDict((const __CFDictionary *)ValueAtIndex, @"RemotePrefix", &v46, 32);
          int v32 = v46;
          if (!v46)
          {
            LOWORD(v26) = 0;
            LOWORD(v27) = 0;
            unsigned int v29 = 0;
            goto LABEL_49;
          }
          unsigned int v29 = 0;
          char v33 = v43;
          do
          {
            unsigned int v29 = (v29 >> 1) | 0x80000000;
            --v32;
          }
          while (v32);
          LOWORD(v26) = 0;
          LOWORD(v27) = 0;
        }
        unsigned int v34 = bswap32(v28);
        unsigned int v35 = bswap32(v29);
        if (v33)
        {
          uint64_t v15 = v23;
        }
        else
        {
          v12->in_addr_t s_addr = v48.s_addr;
          v12[1].in_addr_t s_addr = v34;
          LOWORD(v12[4].s_addr) = v26;
          v12[2].in_addr_t s_addr = (in_addr_t)v47[1];
          v12[3].in_addr_t s_addr = v35;
          HIWORD(v12[4].s_addr) = v27;
          LOWORD(v12[5].s_addr) = bswap32((unsigned __int16)v45) >> 16;
          uint64_t v15 = (v23 + 1);
          v12 += 6;
        }
        CFIndex v13 = v41;
        if ((v20 & 1) == 0)
        {
          v12[2].in_addr_t s_addr = v48.s_addr;
          v12[3].in_addr_t s_addr = v34;
          HIWORD(v12[4].s_addr) = v26;
          v12->in_addr_t s_addr = (in_addr_t)v47[1];
          v12[1].in_addr_t s_addr = v35;
          LOWORD(v12[4].s_addr) = v27;
          LOWORD(v12[5].s_addr) = bswap32((unsigned __int16)v45) >> 16;
          uint64_t v15 = (v15 + 1);
          v12 += 6;
        }
        CFStringRef Value = v42;
      }
      if (++v14 == v13) {
        goto LABEL_62;
      }
    }
  }
  LODWORD(v15) = 0;
LABEL_62:
  v9[13] = bswap32(v15) >> 16;
  v12->in_addr_t s_addr = 201326592;
  LOWORD(v12[1].s_addr) = 1;
  v12[2].in_addr_t s_addr = 201326592;
  LOWORD(v12[3].s_addr) = 0;
  v12[4].in_addr_t s_addr = 50331648;
  LOWORD(v12[5].s_addr) = 0;
  v12[6].in_addr_t s_addr = 318767360;
  LOWORD(v12[7].s_addr) = 0;
  v12[8].in_addr_t s_addr = 251658496;
  LOWORD(v12[9].s_addr) = 0;
  v12[10].in_addr_t s_addr = 234881280;
  LOWORD(v12[11].s_addr) = 0;
  v12[12].in_addr_t s_addr = 419430912;
  LOWORD(v12[13].s_addr) = 0;
  uint64_t v37 = 24 * (unsigned __int16)v15;
  unint64_t v38 = v37 + 88;
  v9[7] = bswap32(v37 + 72) >> 16;
  sub_1F39C(5, @"IPSec Controller: sending START_PH2 to racoon control socket");
  sub_21AB4(__fd, (uint64_t)v9, v38);
  CFTypeID v39 = ne_log_obj();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v48.s_addr) = 0;
    _os_log_impl(&dword_0, v39, OS_LOG_TYPE_DEFAULT, "IPSec Phase2 starting.\n", (uint8_t *)&v48, 2u);
  }
  free(v9);
  return 0;
}

intptr_t write_barrier(int a1)
{
  CFDictionaryRef v2 = dispatch_semaphore_create(0);
  double v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_write, a1, 0, 0);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000;
  handler[2] = sub_23380;
  handler[3] = &unk_39448;
  handler[4] = v2;
  dispatch_source_set_event_handler(v3, handler);
  dispatch_retain(v3);
  dispatch_retain(v2);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 0x40000000;
  void v7[2] = sub_23388;
  v7[3] = &unk_39468;
  v7[4] = v2;
  v7[5] = v3;
  dispatch_source_set_cancel_handler(v3, v7);
  dispatch_activate(v3);
  dispatch_time_t v4 = dispatch_time(0, 250000000);
  intptr_t v5 = dispatch_semaphore_wait(v2, v4);
  dispatch_source_cancel(v3);
  dispatch_release(v3);
  dispatch_release(v2);
  return v5;
}

intptr_t sub_23380(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_23388(uint64_t a1)
{
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
  CFDictionaryRef v2 = *(NSObject **)(a1 + 40);

  dispatch_release(v2);
}

void sub_233C4(uint64_t a1, uint64_t a2)
{
  sub_1F39C(5, @"IPSec Controller: racoon_timer expired");
  int v3 = *(_DWORD *)(a2 + 592);
  if ((v3 - 1) > 1 || (CFArrayRef v4 = *(const __CFArray **)(a2 + 1024)) == 0)
  {
LABEL_12:
    int v12 = v3 - 1;
    int v13 = 7;
    switch(v12)
    {
      case 0:
        goto LABEL_24;
      case 1:
        int v13 = 9;
        goto LABEL_24;
      case 2:
        int v14 = *(_DWORD *)(a2 + 912);
        if (v14 < 1) {
          goto LABEL_23;
        }
        goto LABEL_19;
      case 5:
        int v15 = *(_DWORD *)(a2 + 600);
        if (v15 == 1)
        {
          int v18 = *(_DWORD *)(a2 + 784);
          int v19 = *(_DWORD *)(a2 + 748);
          uint64_t v25 = 0x400000000000000;
          *(void *)buffer = 5888;
          int v26 = v19;
          sub_1F39C(5, @"IPSec Controller: sending RECONNECT to racoon control socket");
          sub_21AB4(v18, (uint64_t)buffer, 0x14uLL);
          if (*(_DWORD *)(a2 + 592) == 6) {
            *(_DWORD *)(a2 + 600) = 2;
          }
          char v20 = *(__CFRunLoopTimer **)(a2 + 776);
          if (v20)
          {
            CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
            CFRunLoopTimerSetNextFireDate(v20, Current + 10.0);
          }
        }
        else if (v15 == 4 && (int v14 = *(_DWORD *)(a2 + 912), v14 > 0))
        {
LABEL_19:
          *(_DWORD *)(a2 + 912) = v14 - 1;
          sub_24920((const char *)(a2 + 104), (_DWORD *)(a2 + 908));
          CFDictionaryRef v16 = *(__CFRunLoopTimer **)(a2 + 776);
          if (v16)
          {
            double v17 = CFAbsoluteTimeGetCurrent() + 1.0;
            CFRunLoopTimerSetNextFireDate(v16, v17);
          }
        }
        else
        {
LABEL_23:
          int v13 = 10;
LABEL_24:
          *(_DWORD *)(a2 + 596) = v13;
          ipsec_stop(a2);
        }
        break;
      default:
        goto LABEL_23;
    }
    return;
  }
  CFIndex v5 = *(int *)(a2 + 1036);
  if (CFArrayGetCount(v4) <= v5)
  {
    int v3 = *(_DWORD *)(a2 + 592);
    goto LABEL_12;
  }
  CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a2 + 1024), *(int *)(a2 + 1036));
  if (ValueAtIndex)
  {
    CFDictionaryRef v7 = ValueAtIndex;
    ++*(_DWORD *)(a2 + 1036);
    CFDataRef Value = (const __CFData *)CFDictionaryGetValue(ValueAtIndex, @"RemoteAddress");
    if (Value)
    {
      CFDataRef v9 = Value;
      if ((unint64_t)CFDataGetLength(Value) >= 0x10)
      {
        *(void *)buffer = 0;
        uint64_t v25 = 0;
        v28.length = CFDataGetLength(v9);
        v28.CFIndex location = 0;
        CFDataGetBytes(v9, v28, buffer);
        *(void *)unsigned int v22 = 0;
        uint64_t v23 = 0;
        CFDataRef v10 = (const __CFData *)CFDictionaryGetValue(v7, @"RemoteAddressNAT64Prefix");
        if (v10)
        {
          CFDataRef v11 = v10;
          if (CFDataGetLength(v10) != 16) {
            return;
          }
          v29.length = CFDataGetLength(v11);
          v29.CFIndex location = 0;
          CFDataGetBytes(v11, v29, v22);
        }
        sub_1F39C(5, @"IPSec Controller: racoon_timer call racoon_restart_cisco_ipsec");
        sub_25278(a2, buffer, v22, 0);
      }
    }
  }
}

uint64_t ipsec_cellular_event(uint64_t a1, int a2)
{
  if ((a2 - 1) >= 2)
  {
    if (!a2) {
      return sub_236EC(a1);
    }
  }
  else
  {
    *(_DWORD *)(a1 + 596) = 18;
    return ipsec_stop(a1);
  }
  return a1;
}

uint64_t sub_236EC(uint64_t a1)
{
  GetStrFromDict(*(const __CFDictionary **)(a1 + 136), @"RemoteAddress", v7, 255, "");
  *(_DWORD *)(a1 + 744) = 528;
  if (inet_aton(v7, (in_addr *)(a1 + 748))) {
    return sub_25278(a1, (_OWORD *)(a1 + 744), (_OWORD *)(a1 + 760), 0);
  }
  gettimeofday((timeval *)(a1 + 1008), 0);
  int v3 = getaddrinfo_async_start();
  if (v3)
  {
    sub_2771C(v3, 0, a1);
    *(_DWORD *)(a1 + 596) = 5;
    ipsec_stop(a1);
    return *(unsigned int *)(a1 + 596);
  }
  else
  {
    CFArrayRef v4 = (__CFMachPort *)_SC_CFMachPortCreateWithPort();
    *(void *)(a1 + 1000) = v4;
    if (v4)
    {
      CFRunLoopSourceRef RunLoopSource = CFMachPortCreateRunLoopSource(0, v4, 0);
      CFAbsoluteTime Current = CFRunLoopGetCurrent();
      CFRunLoopAddSource(Current, RunLoopSource, kCFRunLoopCommonModes);
      CFRelease(RunLoopSource);
    }
    return 0;
  }
}

uint64_t ipsec_start(uint64_t a1, const void *a2, int a3, int a4, mach_port_name_t a5, uint64_t a6, int a7)
{
  if (!*(unsigned char *)(a1 + 16))
  {
    *(_DWORD *)(a1 + 596) = 7;
    sub_23D54(a1, 0, 7, 0);
    return *(unsigned int *)(a1 + 596);
  }
  sub_1F39C(5, @"IPSec Controller: ipsec_start, ondemand flag = %d");
  if (!*(_DWORD *)(a1 + 592))
  {
    int v14 = *(__CFUserNotification **)(a1 + 168);
    if (v14)
    {
      if (a7)
      {
        unsigned int v15 = *(_DWORD *)(a1 + 596);
        if (v15 <= 0x15 && ((1 << v15) & 0x302000) != 0)
        {
          sub_1F39C(3, @"IPSec Controller: ipsec_start fails cert validity, returns error %d ");
          return *(unsigned int *)(a1 + 596);
        }
      }
      CFUserNotificationCancel(v14);
      CFAbsoluteTime Current = CFRunLoopGetCurrent();
      CFRunLoopRemoveSource(Current, *(CFRunLoopSourceRef *)(a1 + 176), kCFRunLoopDefaultMode);
      my_CFRelease((const void **)(a1 + 168));
      my_CFRelease((const void **)(a1 + 176));
    }
    sub_1FBF4(a1, 1u);
    *(_DWORD *)(a1 + 600) = 0;
    *(_DWORD *)(a1 + 396) = 0;
    service_started(a1);
    *(_DWORD *)(a1 + 596) = 0;
    *(_DWORD *)(a1 + 912) = 0;
    *(_DWORD *)(a1 + 992) = 0;
    *(void *)(a1 + 1032) = 0;
    *(void *)(a1 + 1024) = 0;
    *(void *)(a1 + 128) = a2;
    my_CFRetain(a2);
    *(_DWORD *)(a1 + 88) = a3;
    *(_DWORD *)(a1 + 92) = a4;
    scnc_bootstrap_retain(a1, a5);
    *(_DWORD *)(a1 + 72) = *(_DWORD *)(a1 + 72) & 0xFFFFF3FF | ((a7 != 0) << 10);
    sub_1F39C(7, @"IPSec Controller: IPSec System Prefs %@");
    sub_1F39C(7, @"IPSec Controller: IPSec User Options %@");
    if (GetStrFromDict(*(const __CFDictionary **)(a1 + 136), @"RemoteAddress", cStr, 255, ""))
    {
      if (racoon_validate_cfg_str(cStr))
      {
        double v17 = ne_log_obj();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)&buf.sa_len = 136315138;
          *(void *)&buf.sa_data[2] = cStr;
          _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "IPSec connecting to server %s\n", &buf.sa_len, 0xCu);
        }
        *(_WORD *)(a1 + 916) = 0x8000;
        CFStringRef Value = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 136), kSCPropNetIPSecXAuthPasswordEncryption);
        if (isString(Value)
          && CFEqual(Value, kSCValNetIPSecXAuthPasswordEncryptionPrompt))
        {
          *(_WORD *)(a1 + 916) |= 0x40u;
        }
        if (*(void *)(a1 + 584)
          || *(_DWORD *)(a1 + 800) != -1
          || (event_create_socket((void *)a1, (CFSocketNativeHandle *)(a1 + 800), (CFSocketRef *)(a1 + 808), (void (__cdecl *)(CFSocketRef, CFSocketCallBackType, CFDataRef, const void *, void *))sub_23FD8, 0) & 0x80000000) == 0)
        {
          SCNetworkReachabilityFlags flags = 0;
          *(void *)&buf.sa_data[6] = 0;
          *(void *)&buf.sa_len = 528;
          int v19 = SCNetworkReachabilityCreateWithAddress(0, &buf);
          if (v19)
          {
            char v20 = v19;
            if (SCNetworkReachabilityGetFlags(v19, &flags))
            {
              BOOL v21 = (~flags & 0x40006) == 0;
              sub_1F39C(5, @"IPSec Controller: ipsec_start reachability SCNetworkReachabilityFlags flags = 0x%x, need_cellular = %d");
            }
            else
            {
              BOOL v21 = 0;
            }
            CFRelease(v20);
          }
          else
          {
            BOOL v21 = 0;
          }
          int valuePtr = 1;
          __int16 v24 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 136), @"NattKeepAliveEnabled");
          CFTypeID TypeID = CFNumberGetTypeID();
          if (!v24
            || CFGetTypeID(v24) != TypeID
            || (CFNumberGetValue((CFNumberRef)v24, kCFNumberIntType, &valuePtr), valuePtr))
          {
            if ((flags & 0x40000) != 0) {
              int v26 = 0;
            }
            else {
              int v26 = 60;
            }
            int v30 = v26;
            CFNumberRef v27 = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 136), @"NattKeepAliveTimer");
            CFTypeID v28 = CFNumberGetTypeID();
            if (v27)
            {
              if (CFGetTypeID(v27) == v28) {
                CFNumberGetValue(v27, kCFNumberIntType, &v30);
              }
            }
            size_t v29 = 4;
            sysctlbyname("net.key.natt_keepalive_interval", &gNattKeepAliveInterval, &v29, &v30, 4uLL);
          }
          if (!v21) {
            return sub_236EC(a1);
          }
          if (bringup_cellular((const void **)a1)) {
            return 0;
          }
          int v23 = 18;
          goto LABEL_48;
        }
        CFStringRef v22 = @"IPSec Controller: cannot create event socket";
LABEL_30:
        sub_1F39C(3, v22);
        if (*(_DWORD *)(a1 + 596))
        {
LABEL_49:
          sub_1F39C(3, @"IPSec Controller: ipsec_start failed");
          ipsec_stop(a1);
          return *(unsigned int *)(a1 + 596);
        }
        int v23 = 1;
LABEL_48:
        *(_DWORD *)(a1 + 596) = v23;
        goto LABEL_49;
      }
      CFStringRef v22 = @"IPSec Controller: invalid RemoteAddress ...";
    }
    else
    {
      CFStringRef v22 = @"IPSec Controller: cannot find RemoteAddress ...";
    }
    *(_DWORD *)(a1 + 596) = 2;
    goto LABEL_30;
  }
  if (my_CFEqual((unint64_t)a2, *(void *)(a1 + 128)))
  {
    phase_changed(a1, *(_DWORD *)(a1 + 592));
    return 0;
  }
  return 5;
}

void sub_23D54(uint64_t a1, CFStringRef theString, uint64_t a3, int a4)
{
  CFMutableDictionaryRef v15 = 0;
  if ((*(unsigned char *)(a1 + 72) & 0x40) != 0)
  {
    SInt32 error = 0;
    if (theString)
    {
      CFStringRef v16 = theString;
      CFStringRef v7 = theString;
    }
    else
    {
      if (a3 <= 0x13 && ((1 << a3) & 0xB8001) != 0) {
        return;
      }
      CFStringRef v7 = CFStringCreateWithFormat(0, 0, @"IPSec Error %d", a3);
      CFStringRef v16 = v7;
      if (!v7)
      {
        my_CFRelease((const void **)&v15);
LABEL_24:
        my_CFRelease((const void **)&v16);
        return;
      }
    }
    if (CFStringGetLength(v7) && (a4 != 2 || (*(unsigned char *)(a1 + 73) & 4) == 0 || !*(unsigned char *)(a1 + 1040)))
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFMutableDictionaryRef v15 = Mutable;
      if (Mutable)
      {
        CFDataRef v9 = Mutable;
        if (gIconURLRef) {
          CFDictionaryAddValue(Mutable, kCFUserNotificationIconURLKey, (const void *)gIconURLRef);
        }
        if (gBundleURLRef) {
          CFDictionaryAddValue(v9, kCFUserNotificationLocalizationURLKey, (const void *)gBundleURLRef);
        }
        CFDictionaryAddValue(v9, kCFUserNotificationAlertMessageKey, v7);
        CFDictionaryAddValue(v9, kCFUserNotificationAlertHeaderKey, @"VPN Connection");
        if (a4 == 2)
        {
          CFDictionaryAddValue(v9, kCFUserNotificationDefaultButtonTitleKey, @"Ignore");
          CFDictionaryAddValue(v9, kCFUserNotificationAlternateButtonTitleKey, @"Settings");
          *(unsigned char *)(a1 + 1040) = 1;
        }
        else if (a4 == 1)
        {
          CFDictionaryAddValue(v9, kCFUserNotificationAlternateButtonTitleKey, @"Disconnect");
        }
        CFDataRef v10 = *(__CFUserNotification **)(a1 + 168);
        if (v10)
        {
          SInt32 error = CFUserNotificationUpdate(v10, 0.0, 1uLL, v9);
        }
        else
        {
          CFDataRef v11 = CFUserNotificationCreate(0, 0.0, 1uLL, &error, v9);
          *(void *)(a1 + 168) = v11;
          if (v11)
          {
            CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource(0, v11, (CFUserNotificationCallBack)user_notification_callback, 0);
            *(void *)(a1 + 176) = RunLoopSource;
            if (RunLoopSource)
            {
              CFAbsoluteTime Current = CFRunLoopGetCurrent();
              CFRunLoopAddSource(Current, *(CFRunLoopSourceRef *)(a1 + 176), kCFRunLoopDefaultMode);
            }
            else
            {
              my_CFRelease((const void **)(a1 + 168));
            }
          }
        }
      }
    }
    my_CFRelease((const void **)&v15);
    if (!theString) {
      goto LABEL_24;
    }
  }
}

void sub_23FD8(__CFSocket *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  CFSocketNativeHandle Native = CFSocketGetNative(a1);
  if (recv(Native, v7, 0x100uLL, 0) != -1) {
    ipsec_network_event(a5, (uint64_t)v7);
  }
}

uint64_t ipsec_getstatus_hack_notify(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 592) - 1;
  if (v1 > 6) {
    return 0;
  }
  else {
    return dword_2EEFC[v1];
  }
}

uint64_t sub_2407C(uint64_t a1, int a2, int a3)
{
  if (!a3) {
    return 0;
  }
  sub_1FBF4(a1, 1u);
  *(_DWORD *)(a1 + 72) |= a2;
  *(void *)(a1 + 596) = 0;
  *(_DWORD *)(a1 + 1036) = 1;
  *(_DWORD *)(a1 + 912) = 0;
  *(_DWORD *)(a1 + 992) = 0;
  vm_address_t v5 = *(void *)(a1 + 832);
  if (v5)
  {
    my_Deallocate(v5, *(_DWORD *)(a1 + 844) + 1);
    *(void *)(a1 + 832) = 0;
  }
  *(void *)(a1 + 840) = 0;
  vm_address_t v6 = *(void *)(a1 + 816);
  if (v6)
  {
    my_Deallocate(v6, *(_DWORD *)(a1 + 824));
    *(void *)(a1 + 816) = 0;
  }
  *(_DWORD *)(a1 + 824) = 0;
  if (*(void *)(a1 + 776))
  {
    CFAbsoluteTime Current = CFRunLoopGetCurrent();
    CFRunLoopRemoveTimer(Current, *(CFRunLoopTimerRef *)(a1 + 776), kCFRunLoopCommonModes);
    my_CFRelease((const void **)(a1 + 776));
  }
  if (*(void *)(a1 + 952))
  {
    uint64_t v8 = CFRunLoopGetCurrent();
    CFRunLoopRemoveTimer(v8, *(CFRunLoopTimerRef *)(a1 + 952), kCFRunLoopCommonModes);
    my_CFRelease((const void **)(a1 + 952));
  }
  if (*(void *)(a1 + 984))
  {
    CFDataRef v9 = CFRunLoopGetCurrent();
    CFRunLoopRemoveTimer(v9, *(CFRunLoopTimerRef *)(a1 + 984), kCFRunLoopCommonModes);
    my_CFRelease((const void **)(a1 + 984));
  }
  my_CFRelease((const void **)(a1 + 976));
  sub_1F39C(5, @"IPSec Controller: reconnecting");
  my_CFRelease((const void **)(a1 + 472));
  my_CFRelease((const void **)(a1 + 480));
  uint64_t v10 = 1;
  sub_25278(a1, (_OWORD *)(a1 + 744), (_OWORD *)(a1 + 760), 1);
  return v10;
}

uint64_t ipsec_getstatus(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 592) - 1;
  if (v1 > 7) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = dword_2EF18[v1];
  }
  if (gSCNCVerbose) {
    sub_1F39C(5, @"IPSec Controller: ipsec_getstatus = %s");
  }
  return v2;
}

uint64_t ipsec_copyextendedstatus(uint64_t a1, void *a2)
{
  CFMutableDictionaryRef v32 = 0;
  *a2 = 0;
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFMutableDictionaryRef v33 = Mutable;
  if (!Mutable
    || (vm_address_t v5 = Mutable,
        CFMutableDictionaryRef v6 = CFDictionaryCreateMutable(0, 0, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks),
        (CFMutableDictionaryRef v32 = v6) == 0))
  {
    uint64_t v12 = 12;
    goto LABEL_36;
  }
  CFStringRef v7 = v6;
  AddNumber(v6, kSCPropNetIPSecStatus, *(_DWORD *)(a1 + 592));
  if (!*(_DWORD *)(a1 + 592)) {
    goto LABEL_10;
  }
  v8.in_addr_t s_addr = *(_DWORD *)(a1 + 748);
  CFDataRef v9 = inet_ntoa(v8);
  if (v9) {
    AddString(v7, @"RemoteAddress", v9);
  }
  if (*(_DWORD *)(a1 + 592) != 6)
  {
LABEL_10:
    int v13 = *(_DWORD *)(a1 + 596);
    CFStringRef v14 = @"LastCause";
    CFMutableDictionaryRef v15 = v7;
LABEL_11:
    AddNumber(v15, v14, v13);
    goto LABEL_12;
  }
  uint64_t v10 = *(void *)(a1 + 584);
  if (!v10)
  {
    int v13 = *(_DWORD *)(a1 + 184);
    CFMutableDictionaryRef v15 = v7;
    CFStringRef v14 = kSCPropNetIPSecConnectTime;
    goto LABEL_11;
  }
  uint64_t connect_time = ne_sm_bridge_get_connect_time(v10);
  AddNumber64(v7, kSCPropNetIPSecConnectTime, connect_time);
LABEL_12:
  CFDictionaryAddValue(v5, kSCEntNetIPSec, v7);
  int v16 = *(_DWORD *)(a1 + 592);
  if (v16 == 6)
  {
    CFPropertyListRef v17 = copyEntity((const __SCDynamicStore *)gDynamicStore, kSCDynamicStoreDomainState, *(const __CFString **)(a1 + 24), kSCEntNetIPv4);
    if (v17)
    {
      int v18 = v17;
      CFDictionaryAddValue(v5, kSCEntNetIPv4, v17);
      CFRelease(v18);
    }
    CFDictionaryRef v19 = (const __CFDictionary *)copyEntity((const __SCDynamicStore *)gDynamicStore, kSCDynamicStoreDomainState, *(const __CFString **)(a1 + 24), kSCEntNetDNS);
    if (v19)
    {
      CFDictionaryRef v20 = v19;
      CFStringRef Value = CFDictionaryGetValue(v19, kSCPropNetDNSServerAddresses);
      CFTypeID TypeID = CFArrayGetTypeID();
      if (Value && CFGetTypeID(Value) == TypeID) {
        CFDictionarySetValue(v5, @"DNSServers", Value);
      }
      int v23 = CFDictionaryGetValue(v20, kSCPropNetDNSDomainName);
      CFTypeID v24 = CFStringGetTypeID();
      if (v23 && CFGetTypeID(v23) == v24) {
        CFDictionarySetValue(v5, @"DNSDomain", v23);
      }
      uint64_t v25 = CFDictionaryGetValue(v20, kSCPropNetDNSSearchDomains);
      CFTypeID v26 = CFArrayGetTypeID();
      if (v25 && CFGetTypeID(v25) == v26) {
        CFDictionarySetValue(v5, @"DNSSearchDomains", v25);
      }
      CFNumberRef v27 = CFDictionaryGetValue(v20, kSCPropNetDNSSupplementalMatchDomains);
      CFTypeID v28 = CFArrayGetTypeID();
      if (v27 && CFGetTypeID(v27) == v28) {
        CFDictionarySetValue(v5, @"DNSSupplementalMatchDomains", v27);
      }
      CFRelease(v20);
    }
    int v16 = *(_DWORD *)(a1 + 592);
  }
  if ((v16 - 1) > 7) {
    int v29 = 0;
  }
  else {
    int v29 = dword_2EF18[v16 - 1];
  }
  if (gSCNCVerbose) {
    sub_1F39C(5, @"IPSec Controller: ipsec_getstatus = %s");
  }
  AddNumber(v5, @"Status", v29);
  sub_1F39C(7, @"IPSec Controller: Copy Extended Status %@");
  CFTypeRef v30 = CFRetain(v5);
  uint64_t v12 = 0;
  *a2 = v30;
LABEL_36:
  my_CFRelease((const void **)&v32);
  my_CFRelease((const void **)&v33);
  return v12;
}

uint64_t ipsec_getconnectdata(uint64_t a1, CFTypeRef *a2, int a3)
{
  CFMutableDictionaryRef v12 = 0;
  *a2 = 0;
  CFDictionaryRef v3 = *(const __CFDictionary **)(a1 + 128);
  if (v3)
  {
    if (!a3)
    {
      CFMutableDictionaryRef MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v3);
      CFMutableDictionaryRef v12 = MutableCopy;
      if (!MutableCopy) {
        return 0;
      }
      CFDictionaryRef v3 = MutableCopy;
      CFDictionaryRef Value = (const __CFDictionary *)CFDictionaryGetValue(MutableCopy, kSCEntNetIPSec);
      if (Value)
      {
        CFDictionaryRef v8 = Value;
        CFTypeID v9 = CFGetTypeID(Value);
        if (v9 == CFDictionaryGetTypeID())
        {
          uint64_t v10 = CFDictionaryCreateMutableCopy(0, 0, v8);
          if (v10)
          {
            CFDataRef v11 = v10;
            CFDictionaryRemoveValue(v10, kSCPropNetIPSecSharedSecret);
            CFDictionarySetValue(v3, kSCEntNetIPSec, v11);
            CFRelease(v11);
          }
        }
      }
    }
    *a2 = CFRetain(v3);
    my_CFRelease((const void **)&v12);
  }
  return 0;
}

uint64_t ipsec_copystatistics(uint64_t a1, void *a2)
{
  uint64_t v10 = 0;
  *a2 = 0;
  if (*(_DWORD *)(a1 + 592) != 6) {
    return 22;
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  CFMutableDictionaryRef v11 = Mutable;
  if (Mutable
    && (CFArrayRef v4 = Mutable,
        vm_address_t v5 = CFDictionaryCreateMutable(0, 0, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks),
        (uint64_t v10 = v5) != 0))
  {
    CFMutableDictionaryRef v6 = v5;
    AddNumber(v5, @"BytesIn", 0);
    AddNumber(v6, @"BytesOut", 0);
    AddNumber(v6, @"PacketsIn", 0);
    AddNumber(v6, @"PacketsOut", 0);
    AddNumber(v6, @"ErrorsIn", 0);
    AddNumber(v6, @"ErrorsOut", 0);
    CFDictionaryAddValue(v4, kSCEntNetIPSec, v6);
    CFTypeRef v7 = CFRetain(v4);
    uint64_t v8 = 0;
    *a2 = v7;
  }
  else
  {
    uint64_t v8 = 12;
  }
  my_CFRelease((const void **)&v10);
  my_CFRelease((const void **)&v11);
  return v8;
}

uint64_t ipsec_device_unlock(uint64_t result)
{
  *(unsigned char *)(result + 1040) = 0;
  return result;
}

uint64_t ipsec_log_out(uint64_t result)
{
  if (*(_DWORD *)(result + 592))
  {
    if ((*(unsigned char *)(result + 74) & 2) != 0) {
      return scnc_stop(result, 0, 15, 3);
    }
  }
  return result;
}

uint64_t ipsec_log_switch(uint64_t result)
{
  if (*(_DWORD *)(result + 592))
  {
    if ((*(unsigned char *)(result + 74) & 0x10) != 0) {
      return scnc_stop(result, 0, 15, 4);
    }
  }
  return result;
}

BOOL ipsec_can_sleep(uint64_t a1)
{
  return *(_DWORD *)(a1 + 592) != 6 || (*(unsigned char *)(a1 + 74) & 8) == 0;
}

uint64_t ipsec_will_sleep(uint64_t a1, int a2)
{
  if (*(_DWORD *)(a1 + 592) && !a2 && (*(_DWORD *)(a1 + 72) & 0x40000) != 0) {
    scnc_stop(a1, 0, 15, 2);
  }
  return 0;
}

uint64_t ipsec_wake_up(uint64_t result)
{
  int v1 = *(_DWORD *)(result + 592);
  if (v1 == 8 || v1 == 6) {
    return scnc_disconnectifoverslept((uint64_t)"ipsec_wake_up", result);
  }
  return result;
}

uint64_t sub_24920(const char *a1, _DWORD *a2)
{
  int v4 = socket(2, 3, 1);
  if ((v4 & 0x80000000) == 0)
  {
    int v5 = v4;
    int v11 = 0;
    *(void *)&v14.sa_len = 0;
    *(void *)&v14.sa_data[6] = 0;
    unsigned int v10 = if_nametoindex(a1);
    if (setsockopt(v5, 0, 25, &v10, 4u))
    {
      sub_1F39C(3, @"racoon_trigger_phase2 failed to set IP_BOUND_IF");
      return close(v5);
    }
    v14.int sa_family = 2;
    *(_WORD *)v14.sa_data = 0;
    *(_DWORD *)&v14.sa_data[2] = *a2;
    char v12 = 8;
    v13[0] = 0;
    *(_DWORD *)((char *)v13 + 3) = 0;
    size_t v9 = 4;
    if (sysctlbyname("net.key.blockacq_count", &v11, &v9, 0, 0))
    {
      int v11 = 10;
    }
    else if (v11 < 0)
    {
      return close(v5);
    }
    int v7 = -1;
    do
    {
      ssize_t v8 = sendto(v5, &v12, 8uLL, 0, &v14, 0x10u);
      sub_1F39C(3, @"racoon_trigger_phase2 sent ping, wrote %ld");
      if (v8 <= 7) {
        break;
      }
      ++v7;
    }
    while (v7 < v11);
    return close(v5);
  }

  return sub_1F39C(3, @"racoon_trigger_phase2 failed to create socket");
}

void sub_24AEC(__CFArray *a1, unsigned int a2, unsigned int a3, unsigned int a4, int a5, uint64_t a6)
{
  CFTypeID TypeID = CFArrayGetTypeID();
  if (a1)
  {
    if (CFGetTypeID(a1) == TypeID)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      CFMutableDictionaryRef v19 = Mutable;
      CFTypeID v14 = CFDictionaryGetTypeID();
      if (Mutable)
      {
        if (CFGetTypeID(Mutable) == v14)
        {
          CFStringRef v15 = CFStringCreateWithFormat(0, 0, @"%d.%d.%d.%d", a2, BYTE1(a2), BYTE2(a2), HIBYTE(a2), v19);
          CFTypeRef cf = v15;
          if (v15)
          {
            CFDictionarySetValue(Mutable, kSCPropNetIPv4RouteDestinationAddress, v15);
            my_CFRelease(&cf);
          }
          if (a3)
          {
            CFStringRef v16 = CFStringCreateWithFormat(0, 0, @"%d.%d.%d.%d", a3, BYTE1(a3), BYTE2(a3), HIBYTE(a3));
            CFTypeRef cf = v16;
            if (v16)
            {
              CFDictionarySetValue(Mutable, kSCPropNetIPv4RouteSubnetMask, v16);
              my_CFRelease(&cf);
            }
          }
          if (a4)
          {
            CFStringRef v17 = CFStringCreateWithFormat(0, 0, @"%d.%d.%d.%d", a4, BYTE1(a4), BYTE2(a4), HIBYTE(a4));
            CFTypeRef cf = v17;
            if (v17)
            {
              CFDictionarySetValue(Mutable, kSCPropNetIPv4RouteGatewayAddress, v17);
              my_CFRelease(&cf);
            }
          }
          if (a5 && a6)
          {
            CFStringRef v18 = CFStringCreateWithFormat(0, 0, @"%s", a6);
            CFTypeRef cf = v18;
            if (v18)
            {
              CFDictionarySetValue(Mutable, kSCPropNetIPv4RouteInterfaceName, v18);
              CFRelease(cf);
            }
          }
          CFArrayAppendValue(a1, Mutable);
          my_CFRelease((const void **)&v19);
        }
      }
    }
  }
}

__CFArray *sub_24D04(const __CFDictionary *a1, unsigned int a2)
{
  CFMutableDictionaryRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
  CFArrayRef Value = (const __CFArray *)CFDictionaryGetValue(a1, @"Policies");
  CFTypeID TypeID = CFArrayGetTypeID();
  if (Value)
  {
    if (CFGetTypeID(Value) == TypeID)
    {
      CFIndex Count = CFArrayGetCount(Value);
      if (Count >= 1)
      {
        CFIndex v8 = Count;
        CFIndex v9 = 0;
        v22[0] = 0;
        v22[1] = 0;
        int v20 = 0;
        do
        {
          CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(Value, v9);
          if (isDictionary(ValueAtIndex))
          {
            int v11 = CFDictionaryGetValue(ValueAtIndex, @"Mode");
            CFTypeID v12 = CFStringGetTypeID();
            if (v11)
            {
              if (CFGetTypeID(v11) == v12)
              {
                if (CFEqual(v11, @"Tunnel"))
                {
                  int v13 = CFDictionaryGetValue(ValueAtIndex, @"Direction");
                  CFTypeID v14 = CFStringGetTypeID();
                  if (v13)
                  {
                    if (CFGetTypeID(v13) == v14 && (CFEqual(v13, @"Out") || CFEqual(v13, @"InOut")))
                    {
                      CFStringRef v15 = CFDictionaryGetValue(ValueAtIndex, @"Level");
                      CFTypeID v16 = CFStringGetTypeID();
                      if (v15)
                      {
                        if (CFGetTypeID(v15) == v16
                          && !CFEqual(v15, @"None")
                          && (CFEqual(v15, @"Require")
                           || CFEqual(v15, @"Discard")
                           || CFEqual(v15, @"Unique")))
                        {
                          if (GetStrNetFromDict(ValueAtIndex, @"RemoteAddress", v21, 32))
                          {
                            LODWORD(v22[0]) = 528;
                            if (inet_aton(v21, (in_addr *)v22 + 1))
                            {
                              GetIntFromDict(ValueAtIndex, @"RemotePrefix", &v20, 24);
                              int v17 = v20;
                              if (v20)
                              {
                                unsigned int v18 = 0;
                                do
                                {
                                  unsigned int v18 = (v18 >> 1) | 0x80000000;
                                  --v17;
                                }
                                while (v17);
                                int v20 = 0;
                              }
                              else
                              {
                                unsigned int v18 = 0;
                              }
                              sub_24AEC(Mutable, HIDWORD(v22[0]), bswap32(v18), a2, 0, 0);
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
          ++v9;
        }
        while (v9 != v8);
      }
    }
  }
  return Mutable;
}

void sub_24FE0(uint64_t a1, _DWORD *a2, int a3)
{
  CFMutableDataRef Mutable = CFDataCreateMutable(kCFAllocatorDefault, 0);
  CFMutableDataRef v32 = Mutable;
  CFMutableDataRef v7 = CFDataCreateMutable(kCFAllocatorDefault, 0);
  CFMutableDataRef v31 = v7;
  CFMutableDataRef v8 = CFDataCreateMutable(kCFAllocatorDefault, 0);
  CFMutableDataRef v30 = v8;
  CFMutableDataRef v9 = CFDataCreateMutable(kCFAllocatorDefault, 0);
  CFMutableDataRef v29 = v9;
  if (Mutable) {
    BOOL v10 = v7 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10 && v8 != 0 && v9 != 0)
  {
    int v13 = v9;
    uint64_t v28 = a1;
    for (uint64_t i = *(uint64_t **)(a1 + 1048); i; uint64_t i = (uint64_t *)*i)
    {
      int v15 = *((_DWORD *)i + 6);
      if (v15 == *a2) {
        CFTypeID v16 = Mutable;
      }
      else {
        CFTypeID v16 = v8;
      }
      if (v15 == *a2) {
        int v17 = v7;
      }
      else {
        int v17 = v13;
      }
      CFDataAppendBytes(v16, (const UInt8 *)i + 16, 4);
      CFDataAppendBytes(v17, (const UInt8 *)i + 20, 4);
    }
    CFMutableDictionaryRef v18 = CFDictionaryCreateMutable(kCFAllocatorDefault, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    int v19 = a3;
    uint64_t v20 = a1;
    if (v18)
    {
      BOOL v21 = v18;
      CFMutableDictionaryRef v22 = CFDictionaryCreateMutable(kCFAllocatorDefault, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      if (v22)
      {
        int v23 = v22;
        if (CFDataGetLength(Mutable))
        {
          CFTypeID v24 = CFDictionaryCreateMutable(kCFAllocatorDefault, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          if (v24)
          {
            uint64_t v25 = v24;
            CFDictionaryAddValue(v24, @"Addresses", Mutable);
            CFDictionaryAddValue(v25, @"Masks", v7);
            CFDictionaryAddValue(v23, @"IncludedRoutes", v25);
            CFRelease(v25);
          }
        }
        if (CFDataGetLength(v8))
        {
          CFTypeID v26 = CFDictionaryCreateMutable(kCFAllocatorDefault, 2, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          if (v26)
          {
            CFNumberRef v27 = v26;
            CFDictionaryAddValue(v26, @"Addresses", v8);
            CFDictionaryAddValue(v27, @"Masks", v13);
            CFDictionaryAddValue(v23, @"ExcludedRoutes", v27);
            CFRelease(v27);
          }
        }
        CFDictionaryAddValue(v21, @"IPv4", v23);
        CFRelease(v23);
        uint64_t v20 = v28;
      }
      scnc_cache_routing_table(v20, v21, 0, v19 != 0);
      CFRelease(v21);
    }
  }
  my_CFRelease((const void **)&v32);
  my_CFRelease((const void **)&v31);
  my_CFRelease((const void **)&v30);
  my_CFRelease((const void **)&v29);
}

uint64_t sub_25278(uint64_t a1, _OWORD *a2, _OWORD *a3, int a4)
{
  in_addr v74 = 0;
  context.version = 0;
  memset(&context.retain, 0, 24);
  context.mach_timebase_info info = (void *)a1;
  sub_1F39C(5, @"IPSec Controller: racoon_restart_cisco_ipsec...");
  if (a3 && *(_DWORD *)a3)
  {
    *(_OWORD *)(a1 + 760) = *a3;
    sub_1F39C(5, @"IPSec Controller: NAT64 prefix with length %d");
  }
  else
  {
    *(void *)SCNetworkReachabilityFlags flags = 0;
    nw_nat64_copy_prefixes();
    *(void *)(a1 + 760) = 0;
    *(void *)(a1 + 768) = 0;
  }
  if (*(_DWORD *)(a1 + 868))
  {
    if (IPSecRemovePolicies(*(const __CFDictionary **)(a1 + 608), -1, &v74)) {
      sub_1F39C(3, @"IPSec Controller: Cannot remove policies, error '%s'");
    }
    IPSecRemoveSecurityAssociations((unsigned __int8 *)(a1 + 616), (unsigned __int8 *)(a1 + 744));
    *(_DWORD *)(a1 + 868) = 0;
  }
  uint64_t v8 = *(void *)(a1 + 584);
  if (v8) {
    ne_sm_bridge_request_uninstall(v8);
  }
  sub_217B8(a1, 1);
  if (*(_DWORD *)(a1 + 864))
  {
    if (IPSecRemoveConfigurationFile(*(const void **)(a1 + 608), &v74)) {
      sub_1F39C(3, @"IPSec Controller: Cannot remove configuration, error '%s'");
    }
    *(_DWORD *)(a1 + 864) = 0;
    int v9 = 1;
  }
  else
  {
    int v9 = 0;
  }
  *(_DWORD *)(a1 + 912) = 0;
  *(_OWORD *)(a1 + 744) = *a2;
  CFDictionaryRef v10 = *(const __CFDictionary **)(a1 + 128);
  if (v10) {
    BOOL v11 = GetStrFromDict(v10, @"OutgoingInterface", (char *)(a1 + 918), 16, "") != 0;
  }
  else {
    BOOL v11 = 0;
  }
  memset(v71, 0, sizeof(v71));
  int v72 = 0;
  CFTypeID v12 = (long long *)(a1 + 760);
  int v13 = (void *)(a1 + 744);
  if (*(_DWORD *)(a1 + 760))
  {
    LOWORD(v71[0]) = 7708;
    int v13 = v71;
    nw_nat64_synthesize_v6();
  }
  if (v11) {
    CFTypeID v14 = (const char *)(a1 + 918);
  }
  else {
    CFTypeID v14 = 0;
  }
  if (!get_src_address((unsigned char *)(a1 + 616), (uint64_t)v13, v14, 0))
  {
    if (!v11) {
      copyGateway((const __SCDynamicStore *)gDynamicStore, 2, (char *)(a1 + 918), 16, (void *)(a1 + 936), 16);
    }
    if (*(unsigned char *)(a1 + 918))
    {
      *(unsigned char *)(a1 + 934) = interface_is_cellular(a1 + 918);
      sub_1F39C(5, @"IPSec Controller: lower interface (%s) is%s cellular");
    }
    else
    {
      flags[0] = 0;
      int v17 = SCNetworkReachabilityCreateWithAddress(0, (const sockaddr *)(a1 + 744));
      int v18 = SCNetworkReachabilityGetFlags(v17, flags);
      SCNetworkReachabilityFlags v19 = (flags[0] >> 18) & 1;
      if (!v18) {
        LOBYTE(v19) = 0;
      }
      *(unsigned char *)(a1 + 934) = v19;
      CFRelease(v17);
    }
    if (*(void *)(a1 + 584))
    {
      if ((*(unsigned char *)(a1 + 74) & 0x20) != 0)
      {
        if (*(unsigned char *)(a1 + 934))
        {
          LOBYTE(flags[0]) = 0;
          int is_cellular = primary_interface_is_cellular((char *)flags);
          if (LOBYTE(flags[0]))
          {
            if (!is_cellular)
            {
              CFStringRef v15 = @"IPSec Controller: Skipping tunnel creation over cellular in favor of better interface";
              uint64_t v16 = 5;
              goto LABEL_27;
            }
          }
        }
      }
    }
    *(_DWORD *)(a1 + 968) = 0;
    uint64_t v21 = 5;
    if ((*(_DWORD *)(a1 + 72) & 0x400) != 0) {
      int v22 = 5;
    }
    else {
      int v22 = 20;
    }
    if ((*(_DWORD *)(a1 + 72) & 0x400) == 0) {
      uint64_t v21 = 20;
    }
    uint64_t v67 = v21;
    sub_1F39C(5, @"getting interface (media %x) timeout for ipsec: %d secs");
    *(_DWORD *)(a1 + 972) = v22;
    if (check_interface_captive_and_not_ready((const __SCDynamicStore *)gDynamicStore, a1 + 918)) {
      goto LABEL_104;
    }
    int v23 = (CFMutableDictionaryRef *)(a1 + 608);
    if (!a4 && *(void *)(a1 + 608))
    {
      getnameinfo((const sockaddr *)(a1 + 616), *(unsigned __int8 *)(a1 + 616), (char *)flags, 0x39u, 0, 0, 10);
      CFStringRef v24 = CFStringCreateWithCString(0, (const char *)flags, 0x600u);
      if (v24)
      {
        CFStringRef v25 = v24;
        CFDictionarySetValue(*v23, @"LocalAddress", v24);
        CFRelease(v25);
      }
      CFTypeID v26 = addr2ascii(2, (const void *)(a1 + 748), 4, 0);
      CFStringRef v27 = CFStringCreateWithCString(0, v26, 0x600u);
      if (v27)
      {
        CFStringRef v28 = v27;
        CFDictionarySetValue(*v23, @"RemoteAddress", v27);
        CFRelease(v28);
      }
      if (v11) {
        CFDictionarySetValue(*v23, @"ForceLocalAddress", kCFBooleanTrue);
      }
      goto LABEL_99;
    }
    CFStringRef v29 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 136), @"AuthenticationMethod");
    if (isString(v29))
    {
      CFStringRef v69 = @"SharedSecret";
      if (!CFEqual(v29, @"SharedSecret"))
      {
        if (CFEqual(v29, @"Certificate")) {
          *(_DWORD *)(a1 + 72) |= 0x800u;
        }
        CFStringRef v69 = v29;
      }
    }
    else
    {
      CFStringRef v69 = @"SharedSecret";
    }
    int v30 = v9;
    CFStringRef v31 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 136), @"IdentifierVerification");
    CFStringRef v32 = v31;
    if (v31) {
      isString(v31);
    }
    CFStringRef v33 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 136), @"RemoteAddress");
    if (*(void *)(a1 + 608)) {
      my_CFRelease((const void **)(a1 + 608));
    }
    CFStringRef value = v33;
    if (cfstring_is_ip(v33)) {
      CFStringRef v33 = 0;
    }
    int StrFromDict = GetStrFromDict(*(const __CFDictionary **)(a1 + 136), @"LocalIdentifier", (char *)flags, 256, "");
    CFStringRef v35 = v69;
    CiscoDefaultCFDictionaryRef Configuration = IPSecCreateCiscoDefaultConfiguration((const sockaddr *)(a1 + 616), a1 + 744, v33, v69, StrFromDict, 1, 0, v32, a4);
    *(void *)(a1 + 608) = CiscoDefaultConfiguration;
    if (!CiscoDefaultConfiguration)
    {
      CFStringRef v15 = @"IPSec Controller: cannot create IPSec dictionary...";
      int v9 = v30;
      goto LABEL_26;
    }
    CFDictionaryApplyFunction(*(CFDictionaryRef *)(a1 + 136), (CFDictionaryApplierFunction)sub_25D6C, CiscoDefaultConfiguration);
    int v9 = v30;
    if (v11) {
      CFDictionarySetValue(*v23, @"ForceLocalAddress", kCFBooleanTrue);
    }
    CFTypeID v12 = (long long *)(a1 + 760);
    if ((*(unsigned char *)(a1 + 73) & 4) != 0)
    {
      int valuePtr = 1;
      CFNumberRef v37 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
      if (v37)
      {
        CFNumberRef v38 = v37;
        CFDictionarySetValue(*v23, @"DisconnectOnIdle", v37);
        CFRelease(v38);
      }
      int valuePtr = 120;
      CFNumberRef v39 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
      if (v39)
      {
        CFNumberRef v40 = v39;
        CFDictionarySetValue(*v23, @"DisconnectOnIdleTimer", v39);
        CFRelease(v40);
      }
    }
    CFDictionaryRef v41 = *(const __CFDictionary **)(a1 + 128);
    if (v41)
    {
      CFDictionaryRef v42 = (const __CFDictionary *)CFDictionaryGetValue(v41, kSCEntNetIPSec);
      CFDictionaryRef v43 = v42;
      if (v42)
      {
        unsigned int v44 = CFDictionaryGetValue(v42, @"XAuthName");
        if (isString(v44)) {
          CFDictionarySetValue(*v23, @"XAuthName", v44);
        }
        int v45 = CFDictionaryGetValue(v43, @"XAuthPassword");
        if (isString(v45)) {
          CFDictionarySetValue(*v23, @"XAuthPassword", v45);
        }
      }
    }
    else
    {
      CFDictionaryRef v43 = 0;
    }
    CFStringRef v46 = (const __CFString *)CFDictionaryGetValue(*v23, @"LocalIdentifier");
    if (isString(v46))
    {
      if (CFStringHasSuffix(v46, @"[hybrid]"))
      {
        CFIndex Length = CFStringGetLength(v46);
        v76.length = Length - CFStringGetLength(@"[hybrid]");
        CFStringRef v35 = v69;
        v76.CFIndex location = 0;
        CFStringRef v48 = CFStringCreateWithSubstring(0, v46, v76);
        if (v48)
        {
          CFStringRef v49 = v48;
          CFDictionarySetValue(*v23, @"LocalIdentifier", v48);
          CFDictionarySetValue(*v23, @"AuthenticationMethod", @"Hybrid");
          CFRelease(v49);
          CFDictionarySetValue(*v23, @"RemoteIdentifier", value);
          CFDictionarySetValue(*v23, @"IdentifierVerification", @"UseRemoteIdentifier");
        }
      }
    }
    if (!CFEqual(v35, @"SharedSecret"))
    {
LABEL_99:
      sub_1F39C(7, @"IPSec Controller: Complete IPsec dictionary %@");
      int v57 = CFDictionaryContainsKey(*v23, @"XAuthName");
      CFMutableDictionaryRef v58 = *v23;
      if (v57)
      {
        if (IPSecApplyConfiguration(v58, &v74))
        {
LABEL_101:
          sub_1F39C(3, @"IPSec Controller: Cannot apply configuration, error '%s'");
LABEL_102:
          int v59 = 7;
LABEL_103:
          *(_DWORD *)(a1 + 596) = v59;
          goto LABEL_104;
        }
      }
      else
      {
        CFDictionarySetValue(v58, @"XAuthName", @" ");
        int v61 = IPSecApplyConfiguration(*v23, &v74);
        CFDictionaryRemoveValue(*v23, @"XAuthName");
        if (v61) {
          goto LABEL_101;
        }
      }
      *(_DWORD *)(a1 + 864) = 1;
      if (IPSecCountPolicies(*(const __CFDictionary **)(a1 + 608)))
      {
        if (IPSecInstallPolicies(*v23, -1, &v74))
        {
          sub_1F39C(3, @"IPSec Controller: Cannot install policies, error '%s'");
          int v9 = 0;
          goto LABEL_102;
        }
        *(_DWORD *)(a1 + 868) = 1;
      }
      int v62 = *(_DWORD *)(a1 + 784);
      if (v62 == -1)
      {
        if ((sub_25DDC(a1) & 0x80000000) != 0)
        {
          sub_1F39C(3, @"IPSec Controller: cannot create racoon control socket");
          int v9 = 0;
          int v59 = 8;
          goto LABEL_103;
        }
      }
      else
      {
        racoon_send_cmd_unbind(v62, -1);
      }
      racoon_send_cmd_bind(*(_DWORD *)(a1 + 784), *(_DWORD *)(a1 + 748), (char *)gIPSecAppVersion);
      if (*(_DWORD *)(a1 + 760)) {
        racoon_send_cmd_set_nat64_prefix(*(_DWORD *)(a1 + 784), v12);
      }
      racoon_send_cmd_connect(*(_DWORD *)(a1 + 784), *(_DWORD *)(a1 + 748));
      long long v63 = *(__CFRunLoopTimer **)(a1 + 776);
      double v64 = CFAbsoluteTimeGetCurrent() + 10.0;
      if (v63)
      {
        CFRunLoopTimerSetNextFireDate(v63, v64);
      }
      else
      {
        CFRunLoopTimerRef v65 = CFRunLoopTimerCreate(0, v64, 3.1536e10, 0, 0, (CFRunLoopTimerCallBack)sub_233C4, &context);
        *(void *)(a1 + 776) = v65;
        if (!v65)
        {
          sub_1F39C(3, @"IPSec Controller: cannot create RunLoop timer");
          int v9 = 0;
          goto LABEL_104;
        }
        CFAbsoluteTime Current = CFRunLoopGetCurrent();
        CFRunLoopAddTimer(Current, *(CFRunLoopTimerRef *)(a1 + 776), kCFRunLoopCommonModes);
      }
      return 0;
    }
    CFTypeID v50 = CFDictionaryGetValue(*v23, @"SharedSecret");
    if (!isString(v50)) {
      goto LABEL_129;
    }
    int v51 = CFDictionaryGetValue(*v23, @"SharedSecretEncryption");
    if (!my_CFEqual((unint64_t)v51, (unint64_t)@"Keychain")) {
      goto LABEL_99;
    }
    int v52 = (const void *)ne_sm_bridge_copy_password_from_keychain(*(void *)(a1 + 584));
    if (!v52)
    {
LABEL_129:
      if (v43 && *(void *)(a1 + 128))
      {
        CFStringRef v53 = CFDictionaryGetValue(v43, @"SharedSecret");
        if (isString(v53))
        {
          CFDictionarySetValue(*v23, @"SharedSecret", v53);
          CFDictionaryRemoveValue(*v23, @"SharedSecretEncryption");
          goto LABEL_99;
        }
LABEL_124:
        *(_DWORD *)(a1 + 596) = 3;
        CFStringRef v15 = @"IPSec Controller: incorrect shared secret found.";
        goto LABEL_26;
      }
      CFStringRef v54 = CFDictionaryGetValue(*v23, @"SharedSecretEncryption");
      if (!my_CFEqual((unint64_t)v54, (unint64_t)@"Keychain")) {
        goto LABEL_124;
      }
      CFStringRef v55 = CFStringCreateWithFormat(0, 0, @"%@.SS", *(void *)(a1 + 24), v67);
      if (!v55) {
        goto LABEL_124;
      }
      CFStringRef v56 = v55;
      CFDictionarySetValue(*v23, @"SharedSecret", v55);
      int v52 = v56;
    }
    CFRelease(v52);
    goto LABEL_99;
  }
  *(_DWORD *)(a1 + 596) = 6;
  CFStringRef v15 = @"IPSec Controller: cannot get our local address...";
LABEL_26:
  uint64_t v16 = 3;
LABEL_27:
  sub_1F39C(v16, v15);
LABEL_104:
  if (!*(_DWORD *)(a1 + 596)) {
    *(_DWORD *)(a1 + 596) = 1;
  }
  sub_1F39C(3, @"IPSec Controller: restart failed");
  if (v9) {
    IPSecKickConfiguration();
  }
  ipsec_stop(a1);
  return *(unsigned int *)(a1 + 596);
}

void sub_25D6C(const __CFString *a1, const void *a2, __CFDictionary *a3)
{
  if (CFStringCompare(a1, @"RemoteAddress", 0))
  {
    CFDictionarySetValue(a3, a1, a2);
  }
}

uint64_t sub_25DDC(uint64_t a1)
{
  context.version = 0;
  memset(&context.retain, 0, 24);
  context.mach_timebase_info info = (void *)a1;
  memset(v13, 0, 106);
  int v2 = socket(1, 1, 0);
  *(_DWORD *)(a1 + 784) = v2;
  if (v2 < 0)
  {
    __error();
    CFStringRef v9 = @"IPSec Controller: cannot create racoon control socket (errno = %d) ";
LABEL_11:
    sub_1F39C(3, v9);
    goto LABEL_12;
  }
  strcpy(v13[0].sa_data, "/var/run/vpncontrol.sock");
  *(_WORD *)&v13[0].sa_len = 256;
  memset(&v13[1].sa_data[9], 0, 79);
  if (connect(v2, v13, 0x6Au) < 0)
  {
    __error();
    CFStringRef v9 = @"IPSec Controller: cannot connect racoon control socket (errno = %d)";
    goto LABEL_11;
  }
  int v3 = fcntl(*(_DWORD *)(a1 + 784), 3);
  if (v3 == -1 || fcntl(*(_DWORD *)(a1 + 784), 4, v3 | 4u) == -1)
  {
    __error();
    sub_1F39C(3, @"IPSec Controller: Couldn't set client socket in non-blocking mode, errno = %d");
  }
  int v4 = CFSocketCreateWithNative(0, *(_DWORD *)(a1 + 784), 1uLL, (CFSocketCallBack)sub_25FD4, &context);
  *(void *)(a1 + 792) = v4;
  if (v4)
  {
    CFRunLoopSourceRef RunLoopSource = CFSocketCreateRunLoopSource(0, v4, 0);
    if (RunLoopSource)
    {
      CFMutableDictionaryRef v6 = RunLoopSource;
      CFAbsoluteTime Current = CFRunLoopGetCurrent();
      CFRunLoopAddSource(Current, v6, kCFRunLoopDefaultMode);
      CFRelease(v6);
      return 0;
    }
  }
LABEL_12:
  CFDictionaryRef v10 = *(__CFSocket **)(a1 + 792);
  if (v10)
  {
    CFSocketInvalidate(v10);
    CFRelease(*(CFTypeRef *)(a1 + 792));
  }
  else
  {
    int v11 = *(_DWORD *)(a1 + 784);
    if ((v11 & 0x80000000) == 0) {
      close(v11);
    }
  }
  *(void *)(a1 + 792) = 0;
  uint64_t result = 0xFFFFFFFFLL;
  *(_DWORD *)(a1 + 784) = -1;
  return result;
}

_OWORD *sub_25FD4(__CFSocket *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  CFSocketNativeHandle Native = CFSocketGetNative(a1);
  int v7 = Native;
  uint64_t v8 = *(unsigned int *)(a5 + 840);
  if (v8 <= 0xF)
  {
    uint64_t result = (_OWORD *)readn(Native, (char *)(a5 + 848 + v8), 16 - (int)v8);
    if (result == -1)
    {
      int v11 = 2;
    }
    else
    {
      LODWORD(v8) = *(_DWORD *)(a5 + 840) + result;
      *(_DWORD *)(a5 + 840) = v8;
      if (v8 != 16)
      {
        int v11 = 0;
        goto LABEL_11;
      }
      unsigned int v10 = bswap32(*(unsigned __int16 *)(a5 + 862)) >> 16;
      *(_DWORD *)(a5 + 844) = v10 + 16;
      uint64_t result = (_OWORD *)my_Allocate(v10 + 17);
      *(void *)(a5 + 832) = result;
      if (result)
      {
        int v11 = 0;
        _OWORD *result = *(_OWORD *)(a5 + 848);
        *(unsigned char *)(*(void *)(a5 + 832) + *(unsigned int *)(a5 + 844)) = 0;
      }
      else
      {
        int v11 = 3;
      }
    }
    LODWORD(v8) = *(_DWORD *)(a5 + 840);
LABEL_11:
    if (v8 < 0x10) {
      goto LABEL_14;
    }
    goto LABEL_12;
  }
  int v11 = 0;
LABEL_12:
  uint64_t result = (_OWORD *)readn(v7, (char *)(*(void *)(a5 + 832) + v8), *(_DWORD *)(a5 + 844) - (int)v8);
  if (result == -1)
  {
LABEL_15:
    sub_1F39C(5, @"IPSec Controller: connection closed by client, call ipsec_stop");
    *(_DWORD *)(a5 + 596) = 1;
    return (_OWORD *)ipsec_stop(a5);
  }
  int v12 = *(_DWORD *)(a5 + 840) + result;
  *(_DWORD *)(a5 + 840) = v12;
  if (v12 != *(_DWORD *)(a5 + 844))
  {
LABEL_14:
    if ((v11 - 2) >= 2) {
      return result;
    }
    goto LABEL_15;
  }
  uint64_t v143 = 0;
  uint64_t v144 = 0;
  if (!gSCNCVerbose) {
    goto LABEL_27;
  }
  sub_1F39C(5, @"IPSec Controller: ====================================================");
  sub_1F39C(5, @"IPSec Controller: Process Message:");
  ipsec_msgtype_to_str(bswap32(*(unsigned __int16 *)(a5 + 848)) >> 16);
  sub_1F39C(5, @"IPSec Controller:\tmsg_type = 0x%x (%s)");
  sub_1F39C(5, @"IPSec Controller:\tSCNetworkReachabilityFlags flags = 0x%x %s");
  sub_1F39C(5, @"IPSec Controller:\tcookie = 0x%x");
  sub_1F39C(5, @"IPSec Controller:\treserved = 0x%x");
  sub_1F39C(5, @"IPSec Controller:\tuint64_t result = 0x%x");
  sub_1F39C(5, @"IPSec Controller:\tlen = %d");
  signed int v13 = bswap32(*(unsigned __int16 *)(a5 + 848)) >> 16;
  if (v13 <= 0x8000)
  {
    if (v13 > 0x17 || ((1 << v13) & 0x860006) == 0 && v13 != 20) {
      goto LABEL_26;
    }
    uint64_t v14 = *(void *)(a5 + 832);
    sub_1F39C(5, @"IPSec Controller:\t----------------------------");
    v15.in_addr_t s_addr = *(_DWORD *)(v14 + 16);
    inet_ntoa(v15);
    CFStringRef v16 = @"IPSec Controller:\taddress = %s";
    goto LABEL_24;
  }
  if (v13 <= 33024)
  {
    if (v13 != 32769)
    {
      if (v13 == 32787)
      {
        uint64_t v26 = *(void *)(a5 + 832);
        v27.in_addr_t s_addr = *(_DWORD *)(v26 + 16);
        inet_ntoa(v27);
        sub_1F39C(5, @"IPSec Controller:\tvm_address_t address = %s");
        if ((*(_WORD *)(v26 + 2) & 0x100) != 0)
        {
          uint64_t v28 = *(void *)(a5 + 832);
          unsigned int v29 = bswap32(*(unsigned __int16 *)(a5 + 862)) >> 16;
          v30.in_addr_t s_addr = *(_DWORD *)(v28 + 20);
          inet_ntoa(v30);
          sub_1F39C(5, @"IPSec Controller:\touter_local_addr = %s");
          sub_1F39C(5, @"IPSec Controller:\touter_remote_CFMachPortRef port = %d");
          sub_1F39C(5, @"IPSec Controller:\touter_local_CFMachPortRef port = %d");
          sub_1F39C(5, @"IPSec Controller:\tifname = %s");
          if (v29 >= 0x1D)
          {
            int v31 = v29 - 28;
            CFStringRef v32 = (unsigned __int16 *)(v28 + 44);
            do
            {
              unsigned int v33 = v32[1];
              unsigned int v34 = bswap32(*v32);
              ipsec_modecfgtype_to_str(HIWORD(v34) & 0x7FFF);
              sub_1F39C(5, @"IPSec Controller:\tModeConfig Attribute Type = %d (%s)");
              unsigned int v35 = bswap32(v33) >> 16;
              if ((v34 & 0x80000000) != 0)
              {
                sub_1F39C(5, @"IPSec Controller:\tModeConfig Attribute CFArrayRef Value = %d");
              }
              else
              {
                sub_1F39C(5, @"IPSec Controller:\tModeConfig Attribute Length = %d CFArrayRef Value = ...");
                v31 -= v35;
                CFStringRef v32 = (unsigned __int16 *)((char *)v32 + v35);
              }
              v32 += 2;
              BOOL v36 = __OFSUB__(v31, 4);
              v31 -= 4;
            }
            while (!((v31 < 0) ^ v36 | (v31 == 0)));
          }
        }
      }
      goto LABEL_26;
    }
    uint64_t v52 = *(void *)(a5 + 832);
    sub_1F39C(5, @"IPSec Controller:\t----------------------------");
    v53.in_addr_t s_addr = *(_DWORD *)(v52 + 16);
    inet_ntoa(v53);
    sub_1F39C(5, @"IPSec Controller:\tvm_address_t address = %s");
    int v134 = ipsec_error_to_str(bswap32(*(unsigned __int16 *)(v52 + 20)) >> 16);
    sub_1F39C(5, @"IPSec Controller:\tike_code = %d 0x%x (%s)");
    sub_1F39C(5, @"IPSec Controller:\tfrom = %d");
    if (*(_WORD *)(v52 + 20) != 13726) {
      goto LABEL_26;
    }
    v54.in_addr_t s_addr = *(_DWORD *)(v52 + 24);
    inet_ntoa(v54);
    CFStringRef v16 = @"IPSec Controller:\tredirect address = %s";
LABEL_24:
    uint64_t v17 = 5;
    goto LABEL_25;
  }
  if (v13 != 33025)
  {
    if (v13 != 33027) {
      goto LABEL_26;
    }
    uint64_t v41 = *(void *)(a5 + 832);
    sub_1F39C(5, @"IPSec Controller:\t----------------------------");
    v42.in_addr_t s_addr = *(_DWORD *)(v41 + 16);
    inet_ntoa(v42);
    sub_1F39C(5, @"IPSec Controller:\tresponse from vm_address_t address = %s");
    CFStringRef v16 = @"IPSec Controller:\tike_code = %d";
    goto LABEL_24;
  }
  uint64_t v55 = *(void *)(a5 + 832);
  sub_1F39C(5, @"IPSec Controller:\t----------------------------");
  v56.in_addr_t s_addr = *(_DWORD *)(v55 + 16);
  inet_ntoa(v56);
  sub_1F39C(5, @"IPSec Controller:\tvm_address_t address = %s");
  LODWORD(v57) = bswap32(*(unsigned __int16 *)(a5 + 862)) >> 16;
  if (v57 < 5) {
    goto LABEL_26;
  }
  CFMutableDictionaryRef v58 = (unsigned __int16 *)(*(void *)(a5 + 832) + 20);
  while (1)
  {
    unint64_t v57 = (v57 - 4);
    if (v57 <= 3)
    {
      CFStringRef v16 = @"IPSec Controller: invalid length of isakmp data, expected %zu actual %d";
      goto LABEL_180;
    }
    unsigned int v59 = *v58;
    unsigned int v60 = bswap32(v59);
    size_t v61 = __rev16(v58[1]);
    if ((v60 & 0x80000000) == 0) {
      break;
    }
    ipsec_xauthtype_to_str(HIWORD(v60) & 0x7FFF);
    sub_1F39C(5, @"IPSec Controller:\tXAuth Attribute Type = %d (%s)");
    sub_1F39C(5, @"IPSec Controller:\tXAuth Attribute CFArrayRef Value = %d");
LABEL_108:
    v58 += 2;
    if ((int)v57 <= 4) {
      goto LABEL_26;
    }
  }
  if (v61 + 4 <= v57)
  {
    ipsec_xauthtype_to_str(HIWORD(v60) & 0x7FFF);
    sub_1F39C(5, @"IPSec Controller:\tXAuth Attribute Type = %d (%s)");
    if (v59 == 35904)
    {
      int v62 = malloc_type_malloc(v61 + 1, 0x25848174uLL);
      if (v62)
      {
        long long v63 = v62;
        memmove(v62, v58 + 2, v61);
        v63[v61] = 0;
        sub_1F39C(5, @"IPSec Controller:\tXAuth Attribute CFArrayRef Value = %s");
        free(v63);
      }
    }
    else
    {
      sub_1F39C(5, @"IPSec Controller:\tXAuth Attribute Length = %d CFArrayRef Value = ...");
    }
    LODWORD(v57) = v57 - v61;
    CFMutableDictionaryRef v58 = (unsigned __int16 *)((char *)v58 + v61);
    goto LABEL_108;
  }
  CFStringRef v16 = @"IPSec Controller: invalid length of xauth message, expected %zu actual %d";
LABEL_180:
  uint64_t v17 = 3;
LABEL_25:
  sub_1F39C(v17, v16);
LABEL_26:
  sub_1F39C(5, @"IPSec Controller: ====================================================");
LABEL_27:
  signed int v18 = bswap32(*(unsigned __int16 *)(a5 + 848)) >> 16;
  if (v18 > 32800)
  {
    if (v18 <= 33024)
    {
      if (v18 != 32801)
      {
        if (v18 != 32802) {
          goto LABEL_276;
        }
        sub_1F39C(5, @"IPSec Controller: PH2 ESTABLISHED. phase %d, assert %d");
        int v22 = *(_DWORD *)(a5 + 592);
        if (v22 != 5 && (v22 != 6 || *(_DWORD *)(a5 + 600) != 5)) {
          goto LABEL_276;
        }
        if (*(void *)(a5 + 776))
        {
          CFAbsoluteTime Current = CFRunLoopGetCurrent();
          CFRunLoopRemoveTimer(Current, *(CFRunLoopTimerRef *)(a5 + 776), kCFRunLoopCommonModes);
        }
        my_CFRelease((const void **)(a5 + 776));
        int v24 = *(_DWORD *)(a5 + 592);
        if (v24 == 6)
        {
          if (*(_DWORD *)(a5 + 600) == 5) {
            *(_DWORD *)(a5 + 600) = 0;
          }
        }
        else if (v24 == 5)
        {
          CFStringRef v25 = *(const __CFString **)(a5 + 960);
          if (v25)
          {
            if ((*(unsigned char *)(a5 + 73) & 4) == 0)
            {
              sub_23D54(a5, v25, 0, 1);
              my_CFRelease((const void **)(a5 + 960));
            }
          }
        }
        sub_1FBF4(a5, 6u);
        *(_DWORD *)(a5 + 396) = 1;
        CFRange v76 = ne_log_obj();
        if (!os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_276;
        }
        *(_WORD *)sockaddr buf = 0;
        in_addr v77 = "IPSec Phase2 established.\n";
        goto LABEL_173;
      }
      sub_1F39C(5, @"IPSec Controller: PH2 START. phase %d, assert %d");
      int v46 = *(_DWORD *)(a5 + 592);
      if (v46 != 3)
      {
        if (v46 != 6 || *(_DWORD *)(a5 + 600) != 4) {
          goto LABEL_276;
        }
        int v47 = 5;
LABEL_176:
        *(_DWORD *)(a5 + 600) = v47;
        goto LABEL_276;
      }
      long long v78 = *(__CFRunLoopTimer **)(a5 + 776);
      if (v78)
      {
        CFAbsoluteTime v79 = CFAbsoluteTimeGetCurrent();
        CFRunLoopTimerSetNextFireDate(v78, v79 + 30.0);
      }
      uint64_t v20 = a5;
      unsigned int v21 = 5;
LABEL_132:
      sub_1FBF4(v20, v21);
      goto LABEL_276;
    }
    if (v18 != 33025)
    {
      if (v18 == 33027)
      {
        sub_1F39C(5, @"IPSec Controller: PEER RESP. phase %d, assert %d");
        uint64_t v39 = *(void *)(a5 + 832);
        sub_1F39C(5, @"IPSec Controller:\t----------------------------");
        v40.in_addr_t s_addr = *(_DWORD *)(v39 + 16);
        inet_ntoa(v40);
        sub_1F39C(5, @"IPSec Controller:\tresponse from vm_address_t address = %s");
        sub_1F39C(5, @"IPSec Controller:\tike_code = %d");
        if (!*(_DWORD *)(a5 + 992)) {
          sub_1F39C(3, @"IPSec Controller: unsolicited peer response notification");
        }
        *(_DWORD *)(a5 + 992) = 0;
      }
      goto LABEL_276;
    }
    uint64_t v132 = *(unsigned int *)(a5 + 592);
    uint64_t v133 = *(unsigned int *)(a5 + 600);
    sub_1F39C(5, @"IPSec Controller: AUTHINFO. phase %d, assert %d");
    int v51 = *(_DWORD *)(a5 + 592);
    if (v51 == 3)
    {
      sub_1FBF4(a5, 4u);
    }
    else
    {
      if (v51 != 6 || *(_DWORD *)(a5 + 600) != 4) {
        goto LABEL_276;
      }
      if ((*(_WORD *)(a5 + 916) & 0x40) != 0)
      {
        CFStringRef v38 = @"IPSec Controller: session asserting but XAuth dialog required, so connection aborted";
        goto LABEL_274;
      }
    }
    int v80 = *(__CFRunLoopTimer **)(a5 + 776);
    if (v80) {
      CFRunLoopTimerSetNextFireDate(v80, 3.1536e10);
    }
    long long v81 = ne_log_obj();
    if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)sockaddr buf = 0;
      _os_log_impl(&dword_0, v81, OS_LOG_TYPE_DEFAULT, "IPSec requesting Extended Authentication.\n", buf, 2u);
    }
    uint64_t v82 = *(void *)(a5 + 832);
    LODWORD(v83) = bswap32(*(unsigned __int16 *)(a5 + 862)) >> 16;
    __int16 v84 = *(_WORD *)(a5 + 916) & 0xFFD0 | 0x20;
    *(_WORD *)(a5 + 916) = v84;
    if (v83 >= 5)
    {
      long long v85 = 0;
      in_addr v86 = (unsigned __int16 *)(v82 + 20);
      while (1)
      {
        unint64_t v83 = (v83 - 4);
        if (v83 <= 3)
        {
          CFStringRef v119 = @"IPSec Controller: invalid length of isakmp data, expected %zu actual %d";
          goto LABEL_185;
        }
        int v87 = bswap32(*v86);
        int v88 = v87 >> 16;
        if (((v87 >> 16) & 0x80000000) == 0 && (unint64_t)(bswap32(v86[1]) >> 16) + 4 > v83) {
          break;
        }
        int v89 = HIWORD(v87) & 0x7FFF;
        switch(v89)
        {
          case 16520:
            if (!v86[1]) {
              goto LABEL_159;
            }
            CFStringRef v119 = @"IPSec Controller: Received unsupported Xauth Type (value %d)";
            goto LABEL_185;
          case 16521:
            __int16 v90 = *(_WORD *)(a5 + 916) & 0xFFE6 | 1;
            goto LABEL_158;
          case 16522:
            __int16 v90 = *(_WORD *)(a5 + 916) & 0xFFE1 | 2;
            goto LABEL_158;
          case 16523:
            __int16 v90 = *(_WORD *)(a5 + 916) & 0xFFE1 | 4;
            goto LABEL_158;
          case 16524:
            if (!v85)
            {
              unsigned int v91 = malloc_type_malloc((bswap32(v86[1]) >> 16) + 1, 0x6B74A2FEuLL);
              long long v85 = v91;
              if (v91)
              {
                memmove(v91, v86 + 2, bswap32(v86[1]) >> 16);
                v85[bswap32(v86[1]) >> 16] = 0;
              }
            }
            goto LABEL_159;
          case 16525:
            CFStringRef v119 = @"IPSec Controller: Received unsupported Xauth Challenge";
            goto LABEL_185;
          case 16526:
            sub_1F39C(3, @"IPSec Controller: Ignoring unsupported Xauth Domain");
            goto LABEL_159;
          case 16527:
            CFStringRef v119 = @"IPSec Controller: Received unsupported Xauth Status";
            goto LABEL_185;
          case 16528:
            __int16 v90 = *(_WORD *)(a5 + 916) & 0xFFE0 | 0x10;
            goto LABEL_158;
          case 16529:
            __int16 v90 = *(_WORD *)(a5 + 916) & 0xFFE0 | 8;
LABEL_158:
            *(_WORD *)(a5 + 916) = v90;
            goto LABEL_159;
          default:
            if (v89 == 32136 && v86[1] != 256)
            {
              CFStringRef v119 = @"IPSec Controller: Received unsupported Xauth Vendor attribute (value %d)";
              goto LABEL_185;
            }
LABEL_159:
            if ((v88 & 0x80000000) == 0)
            {
              unsigned int v92 = bswap32(v86[1]);
              LODWORD(v83) = v83 - HIWORD(v92);
              in_addr v86 = (unsigned __int16 *)((char *)v86 + HIWORD(v92));
            }
            v86 += 2;
            if ((int)v83 <= 4)
            {
              __int16 v84 = *(_WORD *)(a5 + 916);
              goto LABEL_164;
            }
            break;
        }
      }
      CFStringRef v119 = @"IPSec Controller: invalid length of xauth message, expected %zu actual %d";
LABEL_185:
      sub_1F39C(3, v119);
      goto LABEL_271;
    }
    long long v85 = 0;
LABEL_164:
    if ((v84 & 0x8000) == 0 && *(_DWORD *)(a5 + 592) != 6
      || (LOBYTE(v93) = v84, *(_WORD *)(a5 + 916) = v84 & 0x7FFF, (v84 & 0x40) != 0))
    {
LABEL_205:
      CFMutableDictionaryRef v142 = 0;
      if ((*(unsigned char *)(a5 + 72) & 0x80) == 0)
      {
LABEL_271:
        *(_WORD *)(a5 + 916) = 0;
        if (v85) {
          free(v85);
        }
        CFStringRef v38 = @"IPSec Controller: XAuth authentication failed";
        goto LABEL_274;
      }
      CFRange v103 = *(__CFUserNotification **)(a5 + 168);
      if (v103)
      {
        CFUserNotificationCancel(v103);
        int v104 = CFRunLoopGetCurrent();
        CFRunLoopRemoveSource(v104, *(CFRunLoopSourceRef *)(a5 + 176), kCFRunLoopDefaultMode);
        my_CFRelease((const void **)(a5 + 168));
        my_CFRelease((const void **)(a5 + 176));
      }
      if (v85) {
        CFStringRef v105 = CFStringCreateWithFormat(0, 0, @"%s", v85, v133, v134);
      }
      else {
        CFStringRef v105 = CFStringCreateWithFormat(0, 0, @"Enter your user authentication", v132, v133, v134);
      }
      CFStringRef v106 = v105;
      SInt32 error = 0;
      *(void *)sockaddr buf = v105;
      if (!v105 && !CFStringGetLength(0)
        || (CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFCopyStringDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks), (v142 = Mutable) == 0))
      {
LABEL_270:
        my_CFRelease((const void **)&v142);
        my_CFRelease((const void **)buf);
        goto LABEL_271;
      }
      v108 = Mutable;
      if (gIconURLRef) {
        CFDictionaryAddValue(Mutable, kCFUserNotificationIconURLKey, (const void *)gIconURLRef);
      }
      if (gBundleURLRef) {
        CFDictionaryAddValue(v108, kCFUserNotificationLocalizationURLKey, (const void *)gBundleURLRef);
      }
      CFDictionaryAddValue(v108, kCFUserNotificationAlertMessageKey, v106);
      CFDictionaryAddValue(v108, kCFUserNotificationAlertHeaderKey, @"VPN Connection");
      CFDictionaryAddValue(v108, kCFUserNotificationAlternateButtonTitleKey, @"Cancel");
      CFTypeID v109 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
      if (!v109)
      {
        uint64_t v113 = 0;
        CFIndex Count = 0;
LABEL_247:
        if (*(_WORD *)(a5 + 916))
        {
          CFArrayRef Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a5 + 608), @"XAuthName");
          if (isString(Value))
          {
            CFStringRef v121 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
            if (v121)
            {
              uint64_t v122 = v121;
              CFArrayAppendValue(v121, Value);
              if ((*(_WORD *)(a5 + 916) & 6) != 0) {
                CFArrayAppendValue(v122, &stru_3D168);
              }
              CFDictionaryAddValue(v108, kCFUserNotificationTextFieldValuesKey, v122);
              CFRelease(v122);
            }
          }
        }
        if (Count >= 1)
        {
          CFMutableArrayRef v123 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
          CFMutableArrayRef v140 = v123;
          CFMutableArrayRef v124 = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
          CFMutableArrayRef v139 = v124;
          int v137 = 1;
          int valuePtr = 0;
          CFNumberRef v125 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
          CFNumberRef v136 = v125;
          CFNumberRef v126 = CFNumberCreate(0, kCFNumberIntType, &v137);
          CFNumberRef v135 = v126;
          if (v123)
          {
            if (v124)
            {
              if (v125)
              {
                CFNumberRef v127 = v126;
                if (v126)
                {
                  do
                  {
                    CFArrayAppendValue(v123, v125);
                    CFArrayAppendValue(v124, v127);
                    --Count;
                  }
                  while (Count);
                  CFDictionarySetValue(v108, @"SBUserNotificationTextAutocapitalizationType", v123);
                  CFDictionarySetValue(v108, @"SBUserNotificationTextAutocorrectionType", v124);
                }
              }
            }
          }
          my_CFRelease((const void **)&v140);
          my_CFRelease((const void **)&v139);
          my_CFRelease((const void **)&v136);
          my_CFRelease((const void **)&v135);
        }
        if (v113) {
          CFOptionFlags v128 = 0x8000 << v113;
        }
        else {
          CFOptionFlags v128 = 0;
        }
        int v129 = CFUserNotificationCreate(0, 150.0, v128, &error, v108);
        *(void *)(a5 + 168) = v129;
        if (v129)
        {
          CFRunLoopSourceRef RunLoopSource = CFUserNotificationCreateRunLoopSource(0, v129, (CFUserNotificationCallBack)user_notification_callback, 0);
          *(void *)(a5 + 176) = RunLoopSource;
          if (RunLoopSource)
          {
            in_addr v131 = CFRunLoopGetCurrent();
            CFRunLoopAddSource(v131, *(CFRunLoopSourceRef *)(a5 + 176), kCFRunLoopDefaultMode);
            my_CFRelease((const void **)&v142);
            my_CFRelease((const void **)buf);
            *(_WORD *)(a5 + 916) |= 0x80u;
LABEL_267:
            if (v85) {
              free(v85);
            }
            goto LABEL_276;
          }
          my_CFRelease((const void **)(a5 + 168));
        }
        goto LABEL_270;
      }
      int v110 = v109;
      __int16 v111 = *(_WORD *)(a5 + 916);
      if ((v111 & 8) != 0)
      {
        CFArrayAppendValue(v109, @"Answer");
      }
      else
      {
        if ((v111 & 0x10) != 0)
        {
          CFArrayAppendValue(v109, @"Next PIN");
          uint64_t v113 = 1;
          goto LABEL_246;
        }
        if (v111)
        {
          CFArrayAppendValue(v109, @"Account");
          __int16 v111 = *(_WORD *)(a5 + 916);
        }
        if ((v111 & 4) != 0)
        {
          CFStringRef v112 = @"Passcode";
LABEL_243:
          CFArrayAppendValue(v110, v112);
          if (*(_WORD *)(a5 + 916)) {
            uint64_t v113 = 2;
          }
          else {
            uint64_t v113 = 1;
          }
          goto LABEL_246;
        }
        if ((v111 & 2) != 0)
        {
          CFStringRef v112 = @"Password";
          goto LABEL_243;
        }
      }
      uint64_t v113 = 0;
LABEL_246:
      CFIndex Count = CFArrayGetCount(v110);
      CFDictionaryAddValue(v108, kCFUserNotificationTextFieldTitlesKey, v110);
      CFRelease(v110);
      goto LABEL_247;
    }
    if (v84)
    {
      CFStringRef v94 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a5 + 608), @"XAuthName");
      if (isString(v94))
      {
        CFIndex Length = CFStringGetLength(v94);
        __int16 v93 = *(_WORD *)(a5 + 916);
        if (Length)
        {
          BOOL v96 = 1;
          goto LABEL_189;
        }
      }
      else
      {
        __int16 v93 = *(_WORD *)(a5 + 916);
      }
    }
    else
    {
      CFStringRef v94 = 0;
    }
    if (v93) {
      goto LABEL_205;
    }
    BOOL v96 = 0;
LABEL_189:
    if ((v93 & 6) == 0)
    {
      CFStringRef v99 = 0;
      goto LABEL_200;
    }
    CFStringRef v97 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a5 + 608), kSCPropNetIPSecXAuthPasswordEncryption);
    CFTypeID TypeID = CFStringGetTypeID();
    if (!v97 || CFGetTypeID(v97) != TypeID || CFStringCompare(v97, kSCValNetIPSecXAuthPasswordEncryptionKeychain, 0))
    {
      CFStringRef v99 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a5 + 608), kSCPropNetIPSecXAuthPassword);
      CFTypeID v100 = CFStringGetTypeID();
      if (!v99)
      {
LABEL_198:
        if (!isString(v99))
        {
LABEL_203:
          if (v99) {
            CFRelease(v99);
          }
          goto LABEL_205;
        }
        BOOL v96 = CFStringGetLength(v99) != 0;
LABEL_200:
        if (v96)
        {
          __int16 v101 = *(_WORD *)(a5 + 916);
          if (v101)
          {
            *(_WORD *)sockaddr buf = 16521;
            CFStringRef v146 = v94;
            int v102 = 1;
          }
          else
          {
            int v102 = 0;
          }
          if ((v101 & 4) != 0)
          {
            __int16 v115 = 16523;
          }
          else
          {
            if ((v101 & 2) == 0)
            {
LABEL_235:
              CFArrayRef v117 = *(__CFRunLoopTimer **)(a5 + 776);
              if (v117)
              {
                CFAbsoluteTime v118 = CFAbsoluteTimeGetCurrent();
                CFRunLoopTimerSetNextFireDate(v117, v118 + 30.0);
              }
              sub_1FBF4(a5, 3u);
              racoon_send_cmd_xauthinfo(*(_DWORD *)(a5 + 784), *(_DWORD *)(a5 + 748), (uint64_t)buf, v102);
              if (v99) {
                CFRelease(v99);
              }
              goto LABEL_267;
            }
            __int16 v115 = 16522;
          }
          CFTypeID v116 = &buf[16 * v102];
          *(_WORD *)CFTypeID v116 = v115;
          *((void *)v116 + 1) = v99;
          ++v102;
          goto LABEL_235;
        }
        goto LABEL_203;
      }
      if (CFGetTypeID(v99) == v100)
      {
        CFRetain(v99);
        goto LABEL_198;
      }
    }
    CFStringRef v99 = 0;
    goto LABEL_198;
  }
  if (v18 > 32785)
  {
    if (v18 != 32786)
    {
      if (v18 != 32787) {
        goto LABEL_276;
      }
      sub_1F39C(5, @"IPSec Controller: PH1 ESTABLISHED. phase %d, assert %d");
      int v37 = *(_DWORD *)(a5 + 592);
      if (v37 == 3)
      {
        uint64_t v69 = *(void *)(a5 + 832);
        if (!*(void *)(a5 + 584)) {
          goto LABEL_122;
        }
        vm_address_t v70 = *(void *)(a5 + 816);
        if (v70)
        {
          my_Deallocate(v70, *(_DWORD *)(a5 + 824));
          *(void *)(a5 + 816) = 0;
        }
        int v71 = *(_DWORD *)(a5 + 844) + 1;
        *(_DWORD *)(a5 + 824) = v71;
        int v72 = (void *)my_Allocate(v71);
        *(void *)(a5 + 816) = v72;
        memcpy(v72, *(const void **)(a5 + 832), *(unsigned int *)(a5 + 824));
        uint64_t v73 = *(void *)(a5 + 584);
        sub_27634(a5);
        LOBYTE(v73) = ne_sm_bridge_request_install(v73);
        sub_1FE44(a5, 0, 1);
        if ((v73 & 1) == 0)
        {
LABEL_122:
          if ((*(_WORD *)(v69 + 2) & 0x100) != 0) {
            sub_1FE44(a5, 1, 1);
          }
        }
        *(_DWORD *)(a5 + 912) = 15;
        in_addr v74 = *(__CFRunLoopTimer **)(a5 + 776);
        if (v74)
        {
          CFAbsoluteTime v75 = CFAbsoluteTimeGetCurrent();
          CFRunLoopTimerSetNextFireDate(v74, v75 + 1.0);
        }
        *(_DWORD *)(a5 + 184) = (*(double *)&gTimeScaleSeconds * (double)mach_absolute_time());
        *(_DWORD *)(a5 + 192) = 0;
      }
      else
      {
        if (v37 != 6 || *(_DWORD *)(a5 + 600) != 4) {
          goto LABEL_276;
        }
        if (sub_276A8(a5))
        {
          CFStringRef v38 = @"IPSec Controller: unassert failed";
LABEL_274:
          sub_1F39C(3, v38);
LABEL_275:
          ipsec_stop(a5);
          goto LABEL_276;
        }
      }
      CFRange v76 = ne_log_obj();
      if (!os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_276;
      }
      *(_WORD *)sockaddr buf = 0;
      in_addr v77 = "IPSec Phase1 established.\n";
LABEL_173:
      _os_log_impl(&dword_0, v76, OS_LOG_TYPE_DEFAULT, v77, buf, 2u);
      goto LABEL_276;
    }
    sub_1F39C(5, @"IPSec Controller: PH1 STARTPEER. phase %d, assert %d");
    int v48 = *(_DWORD *)(a5 + 592);
    if (v48 != 2 && (v48 != 6 || *(_DWORD *)(a5 + 600) != 3)) {
      goto LABEL_276;
    }
    CFStringRef v49 = *(__CFRunLoopTimer **)(a5 + 776);
    if (v49)
    {
      CFAbsoluteTime v50 = CFAbsoluteTimeGetCurrent();
      CFRunLoopTimerSetNextFireDate(v49, v50 + 30.0);
      int v48 = *(_DWORD *)(a5 + 592);
    }
    if (v48 == 6)
    {
      if (*(_DWORD *)(a5 + 600) != 3) {
        goto LABEL_276;
      }
      int v47 = 4;
      goto LABEL_176;
    }
    if (v48 != 2) {
      goto LABEL_276;
    }
    uint64_t v20 = a5;
    unsigned int v21 = 3;
    goto LABEL_132;
  }
  if (v18 == 32769)
  {
    sub_1F39C(3, @"IPSec Controller: IKE FAILED. phase %d, assert %d");
    uint64_t v43 = *(void *)(a5 + 832);
    unsigned int v44 = *(unsigned __int16 *)(v43 + 20);
    if (v44 == 13726)
    {
      uint64_t v144 = 0;
      v45.in_addr_t s_addr = *(_DWORD *)(v43 + 24);
      LODWORD(v143) = 528;
      HIDWORD(v143) = v45;
      inet_ntoa(v45);
      sub_1F39C(5, @"IPSec Controller: connection redirected to server '%s'...");
      sub_25278(a5, &v143, a5 + 760, 0);
      goto LABEL_276;
    }
    ipsec_error_to_str(__rev16(v44));
    uint64_t v64 = sub_1F39C(3, @"IPSec Controller: connection failed <IKE Error %d (0x%x) %s>");
    int v65 = ipsec_error_to_status(v64, bswap32(*(unsigned __int16 *)(v43 + 22)) >> 16, bswap32(*(unsigned __int16 *)(v43 + 20)) >> 16);
    *(_DWORD *)(a5 + 596) = v65;
    if (v65 == 14 && *(_DWORD *)(a5 + 592) >= 5u) {
      *(_DWORD *)(a5 + 596) = 16;
    }
    goto LABEL_275;
  }
  if (v18 != 32785) {
    goto LABEL_276;
  }
  sub_1F39C(5, @"IPSec Controller: PH1 STARTUS. phase %d, assert %d");
  int v19 = *(_DWORD *)(a5 + 592);
  if (v19 == 6)
  {
    int v66 = *(_DWORD *)(a5 + 600);
    if (v66 != 2)
    {
      if (v66 != 1) {
        goto LABEL_276;
      }
      uint64_t v67 = *(__CFRunLoopTimer **)(a5 + 776);
      if (v67)
      {
        CFAbsoluteTime v68 = CFAbsoluteTimeGetCurrent();
        CFRunLoopTimerSetNextFireDate(v67, v68 + 10.0);
        if (*(_DWORD *)(a5 + 592) != 6) {
          goto LABEL_276;
        }
      }
    }
    int v47 = 3;
    goto LABEL_176;
  }
  if (v19 == 1)
  {
    uint64_t v20 = a5;
    unsigned int v21 = 2;
    goto LABEL_132;
  }
LABEL_276:
  uint64_t result = (_OWORD *)my_Deallocate(*(void *)(a5 + 832), *(_DWORD *)(a5 + 844) + 1);
  *(void *)(a5 + 840) = 0;
  *(void *)(a5 + 832) = 0;
  return result;
}

BOOL sub_27634(uint64_t a1)
{
  unsigned int v1 = bswap32(*(unsigned __int16 *)(a1 + 862)) >> 16;
  if (v1 < 0x1D) {
    return 1;
  }
  int v3 = v1 - 28;
  int v4 = (unsigned __int16 *)(*(void *)(a1 + 832) + 44);
  do
  {
    int v5 = bswap32(*v4);
    int v6 = HIWORD(v5) & 0x7FFF;
    BOOL result = v6 != 28676;
    if (v6 == 28676) {
      break;
    }
    unsigned int v7 = bswap32(v4[1]) >> 16;
    uint64_t v8 = v5 >> 16 >= 0 ? v7 : 0;
    int v9 = v3 - v8;
    int v4 = (unsigned __int16 *)((char *)v4 + v8 + 4);
    BOOL v10 = __OFSUB__(v9, 4);
    int v3 = v9 - 4;
  }
  while (!((v3 < 0) ^ v10 | (v3 == 0)));
  return result;
}

uint64_t sub_276A8(uint64_t a1)
{
  if (!*(_DWORD *)(a1 + 872)) {
    return 0xFFFFFFFFLL;
  }
  if (*(_DWORD *)(a1 + 592) == 6 && *(_DWORD *)(a1 + 600) == 4)
  {
    unsigned int v1 = (CFRunLoopTimerRef *)(a1 + 776);
    if (*(void *)(a1 + 776))
    {
      CFAbsoluteTime Current = CFRunLoopGetCurrent();
      CFRunLoopRemoveTimer(Current, *v1, kCFRunLoopCommonModes);
    }
    my_CFRelease((const void **)v1);
  }
  return 0;
}

void sub_2771C(int a1, addrinfo *a2, uint64_t a3)
{
  long long buffer = 0uLL;
  long long v39 = 0uLL;
  int v6 = nw_nat64_copy_prefixes();
  if (a1 || !a2)
  {
    gai_strerror(a1);
    CFStringRef v27 = @"IPSec Controller: dns reply: getaddrinfo() failed: %s";
    goto LABEL_38;
  }
  int v7 = v6;
  CFMutableDictionaryRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  CFMutableArrayRef theArray = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
  unsigned int v35 = a2;
  int v9 = a2;
  do
  {
    ai_addr = v9->ai_addr;
    int sa_family = ai_addr->sa_family;
    if (sa_family == 2)
    {
      if (ai_addr->sa_len <= 0x10u)
      {
        CFMutableDictionaryRef v12 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        if (v12)
        {
          signed int v13 = v12;
          CFDataRef v14 = CFDataCreate(0, &v9->ai_addr->sa_len, v9->ai_addr->sa_len);
          if (v14)
          {
            CFDataRef v15 = v14;
            CFDictionarySetValue(v13, @"RemoteAddress", v14);
            CFRelease(v15);
            if (v7 < 1) {
              goto LABEL_25;
            }
            CFDataRef v16 = CFDataCreate(kCFAllocatorDefault, 0, 16);
            if (v16)
            {
              CFDataRef v17 = v16;
              CFDictionarySetValue(v13, @"RemoteAddressNAT64Prefix", v16);
              CFArrayAppendValue(theArray, v13);
              CFRelease(v17);
            }
            goto LABEL_26;
          }
        }
      }
    }
    else
    {
      BOOL v18 = sa_family != 30 || v7 < 1;
      if (!v18 && ai_addr->sa_len <= 0x1Cu)
      {
        int v19 = 0;
        uint64_t v20 = v7;
        while ((nw_nat64_extract_v4() & 1) == 0)
        {
          v19 += 16;
          if (!--v20) {
            goto LABEL_27;
          }
        }
        if (v20)
        {
          CFMutableDictionaryRef v21 = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          if (v21)
          {
            signed int v13 = v21;
            CFDataRef v22 = CFDataCreate(0, v19, 16);
            if (v22)
            {
              CFDataRef v23 = v22;
              CFDictionarySetValue(v13, @"RemoteAddressNAT64Prefix", v22);
              CFRelease(v23);
              uint64_t v38 = 0;
              *(_DWORD *)int v37 = 528;
              *(_DWORD *)&v37[4] = 0;
              CFDataRef v24 = CFDataCreate(0, v37, 16);
              if (!v24) {
                goto LABEL_27;
              }
              CFDataRef v25 = v24;
              CFDictionarySetValue(v13, @"RemoteAddress", v24);
              CFRelease(v25);
LABEL_25:
              CFArrayAppendValue(Mutable, v13);
            }
LABEL_26:
            CFRelease(v13);
          }
        }
      }
    }
LABEL_27:
    int v9 = v9->ai_next;
  }
  while (v9);
  uint64_t v26 = (CFArrayRef *)(a3 + 1024);
  my_CFRelease((const void **)(a3 + 1024));
  *(void *)(a3 + 1024) = Mutable;
  *(_DWORD *)(a3 + 1032) = 0;
  if (CFArrayGetCount(Mutable) || v7 < 1)
  {
    CFRelease(theArray);
  }
  else
  {
    sub_1F39C(5, @"IPSec Controller: dns reply: no synthesized IPv6 address in reply on NAT64 network");
    my_CFRelease((const void **)(a3 + 1024));
    *uint64_t v26 = theArray;
  }
  a2 = v35;
  sub_1F39C(7, @"IPSec Controller: dns reply: resolvedAddress %@");
  if (!CFArrayGetCount(*v26))
  {
    my_CFRelease((const void **)(a3 + 1024));
    CFStringRef v32 = @"IPSec Controller: dns reply: no IPv4 address in reply";
LABEL_41:
    sub_1F39C(3, v32);
    a1 = 0;
    goto LABEL_42;
  }
  CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(*v26, 0);
  if (!ValueAtIndex)
  {
    CFStringRef v32 = @"IPSec Controller: dns reply: failed to get elem %d from addr array";
    goto LABEL_41;
  }
  CFDictionaryRef v29 = ValueAtIndex;
  CFDataRef Value = (const __CFData *)CFDictionaryGetValue(ValueAtIndex, @"RemoteAddress");
  a1 = 0;
  if (!Value || (CFDataRef v31 = Value, (unint64_t)CFDataGetLength(Value) <= 0xF))
  {
    CFStringRef v27 = @"IPSec Controller: dns reply: failed to get elem %d from addr array";
    goto LABEL_38;
  }
  long long buffer = 0uLL;
  v41.length = CFDataGetLength(v31);
  v41.CFIndex location = 0;
  CFDataGetBytes(v31, v41, (UInt8 *)&buffer);
  *(_DWORD *)(a3 + 1036) = 1;
  long long v39 = 0uLL;
  CFDataRef v33 = (const __CFData *)CFDictionaryGetValue(v29, @"RemoteAddressNAT64Prefix");
  if (v33)
  {
    CFDataRef v34 = v33;
    if (CFDataGetLength(v33) == 16)
    {
      v42.length = CFDataGetLength(v34);
      v42.CFIndex location = 0;
      CFDataGetBytes(v34, v42, (UInt8 *)&v39);
      goto LABEL_49;
    }
    CFStringRef v27 = @"IPSec Controller: dns reply: failed to get elem %d from nat64 array";
LABEL_38:
    sub_1F39C(3, v27);
LABEL_42:
    sub_1F39C(5, @"IPSec Controller: dns reply: Stopping service");
    *(_DWORD *)(a3 + 596) = 5;
    ipsec_stop(a3);
    *(void *)(a3 + 1024) = CFRetain(kCFNull);
    *(_DWORD *)(a3 + 1032) = a1;
  }
  else
  {
LABEL_49:
    sub_25278(a3, &buffer, &v39, 0);
  }
  sub_1F39C(7, @"IPSec Controller: dns reply: done");
  if (a2) {
    freeaddrinfo(a2);
  }
}

__CFMachPort *sub_27BE0(__CFMachPort *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(__CFMachPort **)(a4 + 1000) == result)
  {
    CFMachPortInvalidate(result);
    CFRelease(*(CFTypeRef *)(a4 + 1000));
    *(void *)(a4 + 1000) = 0;
    return (__CFMachPort *)_getaddrinfo_async_handle_reply(a2);
  }
  return result;
}

double nat_port_mapping_set(uint64_t a1)
{
  if (a1)
  {
    if (*(_DWORD *)(a1 + 888))
    {
      SCLog();
      return result;
    }
    if (*(_DWORD *)(a1 + 392)) {
      sub_27E7C(a1);
    }
    if (*(_WORD *)(a1 + 64) == 1)
    {
      if_nametoindex((const char *)(a1 + 918));
      if (!strstr((char *)(a1 + 918), "ppp") && !strstr((char *)(a1 + 918), "utun"))
      {
        int v3 = (_DNSServiceRef_t **)(a1 + 200);
        if (!*(void *)(a1 + 200))
        {
          if (DNSServiceCreateConnection((DNSServiceRef *)(a1 + 200))
            || (int v4 = *v3) == 0
            || (current_queue = dispatch_get_current_queue(), DNSServiceSetDispatchQueue(v4, current_queue)))
          {
LABEL_14:
            SCLog();
            return sub_27FB0(a1 + 200);
          }
          if (!*(void *)(a1 + 976))
          {
            CFRunLoopRef Current = CFRunLoopGetCurrent();
            *(void *)(a1 + 976) = my_CFRetain(Current);
          }
        }
        *(void *)(a1 + 208) = *(void *)(a1 + 200);
        if (!DNSServiceNATPortMappingCreate((DNSServiceRef *)(a1 + 208), 0x4000u, 0, 0, 0, 0, 0, (DNSServiceNATPortMappingReply)sub_27FF0, (void *)a1))
        {
          *(_DWORD *)(a1 + 220) = 0;
          *(_DWORD *)(a1 + 224) = 0;
          *(_WORD *)(a1 + 228) = 0;
          *(void *)(a1 + 232) = 0;
          SCLog();
          ++*(_DWORD *)(a1 + 392);
          return result;
        }
        goto LABEL_14;
      }
    }
  }
  return result;
}

void sub_27E7C(uint64_t a1)
{
  sub_27F48(a1);
  if (*(_DWORD *)(a1 + 392))
  {
    SCLog();
    if (*(_DWORD *)(a1 + 392))
    {
      unint64_t v2 = 0;
      uint64_t v3 = a1 + 200;
      do
      {
        sub_27FB0(v3);
        if (v2 > 2) {
          break;
        }
        ++v2;
        v3 += 48;
      }
      while (v2 < *(unsigned int *)(a1 + 392));
    }
    *(_DWORD *)(a1 + 392) = 0;
  }
}

void nat_port_mapping_clear(uint64_t a1)
{
  if (a1) {
    sub_27E7C(a1);
  }
}

void sub_27F48(uint64_t a1)
{
  if (*(_WORD *)(a1 + 64) == 1)
  {
    unsigned int v1 = *(__CFRunLoopTimer **)(a1 + 984);
    if (v1)
    {
      unint64_t v2 = (const void **)(a1 + 984);
      CFRunLoopRemoveTimer(*(CFRunLoopRef *)(a1 + 976), v1, kCFRunLoopCommonModes);
      my_CFRelease(v2);
    }
  }
}

double sub_27FB0(uint64_t a1)
{
  if (a1)
  {
    unint64_t v2 = *(_DNSServiceRef_t **)a1;
    if (v2) {
      DNSServiceRefDeallocate(v2);
    }
    double result = 0.0;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)a1 = 0u;
  }
  return result;
}

void sub_27FF0(uint64_t a1, uint64_t a2, unsigned int a3, int a4, unsigned int a5, int a6, unsigned int a7, unsigned int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
  {
    signed int v13 = (unsigned __int16 *)(a10 + 64);
    if (*(_WORD *)(a10 + 64) == 1)
    {
      BOOL v14 = *(_DWORD *)(a10 + 592) != 0;
      CFDataRef v15 = (char *)(a10 + 918);
      size_t v16 = 16;
    }
    else
    {
      BOOL v14 = 0;
      CFDataRef v15 = "NULL";
      size_t v16 = 4;
    }
  }
  else
  {
    signed int v13 = (_WORD *)(&stru_20 + 32);
    BOOL v14 = 0;
    CFDataRef v15 = "NULL";
    size_t v16 = 4;
  }
  unsigned int v17 = bswap32(a5);
  unsigned int v18 = __rev16(a7);
  unsigned int v19 = __rev16(a8);
  if (*(_DWORD *)(a10 + 888))
  {
    SCLog();
    goto LABEL_8;
  }
  unsigned int v62 = v18;
  unsigned int v61 = v19;
  BOOL v59 = v14;
  if (a4 != -65558 && a4)
  {
    SCLog();
    if ((a4 + 65565) > 1)
    {
      if (a4 != -65563) {
        return;
      }
    }
    else
    {
      if (*(_DWORD *)(a10 + 392) >= 4u) {
        unsigned int v21 = 4;
      }
      else {
        unsigned int v21 = *(_DWORD *)(a10 + 392);
      }
      if (!v21) {
        return;
      }
      uint64_t v22 = 0;
      uint64_t v23 = 48 * v21;
      while (1)
      {
        uint64_t v24 = a10 + v22;
        if (*(void *)(a10 + v22 + 208) == a1) {
          break;
        }
        v22 += 48;
        if (v23 == v22) {
          return;
        }
      }
      SCLog();
      if (*(_DWORD *)(v24 + 240) && v59)
      {
        SCLog();
        int v37 = *v13;
        goto LABEL_67;
      }
    }
LABEL_8:
    sub_27E7C(a10);
    return;
  }
  unsigned int v60 = v17;
  long long v63 = 0;
  if (getifaddrs(&v63)) {
    goto LABEL_14;
  }
  in_addr v53 = v13;
  CFDataRef v25 = v63;
  if (!v63)
  {
    freeifaddrs(0);
    int v54 = 0;
    goto LABEL_48;
  }
  int v54 = 0;
  int v26 = 0;
  do
  {
    ifa_name = v25->ifa_name;
    if (ifa_name)
    {
      ifa_addr = v25->ifa_addr;
      if (ifa_addr)
      {
        if ((!strncmp(v25->ifa_name, "utun", 4uLL) || !strncmp(ifa_name, "ppp", 3uLL))
          && ifa_addr->sa_family == 2
          && *(_DWORD *)&ifa_addr->sa_data[2] == a5)
        {
          SCLog();
          ifa_name = v25->ifa_name;
          if (!ifa_name)
          {
            int v26 = 1;
            goto LABEL_42;
          }
          ifa_addr = v25->ifa_addr;
          int v26 = 1;
          if (!ifa_addr) {
            goto LABEL_42;
          }
        }
        if (!strncmp(ifa_name, v15, v16) && ifa_addr->sa_family == 2 && *(unsigned char *)(a10 + 617) == 2)
        {
          int v29 = v54;
          if (*(_DWORD *)&ifa_addr->sa_data[2] == *(_DWORD *)(a10 + 620)) {
            int v29 = 1;
          }
          int v54 = v29;
        }
      }
    }
LABEL_42:
    CFDataRef v25 = v25->ifa_next;
  }
  while (v25);
  freeifaddrs(v63);
  if (v26) {
    return;
  }
LABEL_48:
  if_indextoname(a3, (char *)&__s1);
  if (!strncmp((const char *)&__s1, v15, v16))
  {
    if (strstr(v15, "ppp") || strstr(v15, "utun")) {
      goto LABEL_14;
    }
    if (v54) {
      goto LABEL_54;
    }
    if (a5 && (!a7 || a8)) {
      goto LABEL_14;
    }
    SCLog();
    unint64_t v45 = *(unsigned int *)(a10 + 392);
    if (v45)
    {
      unint64_t v46 = 0;
      int v47 = (_DWORD *)(a10 + 240);
      do
      {
        if (*((void *)v47 - 4) == a1)
        {
          *int v47 = 0;
          SCLog();
          unint64_t v45 = *(unsigned int *)(a10 + 392);
        }
        if (v46 > 2) {
          break;
        }
        ++v46;
        v47 += 12;
      }
      while (v46 < v45);
    }
    return;
  }
  int v30 = v61 | v62;
  if ((a6 || !a5 || v30)
    && (v60 | a6 || v30)
    && (*v53 != 1 || *(unsigned char *)(a10 + 617) != 2 || *(_DWORD *)(a10 + 620) != a5 || !v54))
  {
LABEL_14:
    SCLog();
    return;
  }
LABEL_54:
  SCLog();
  unsigned int v31 = *(_DWORD *)(a10 + 392);
  if (v31 >= 4) {
    unsigned int v31 = 4;
  }
  unsigned int v32 = a7;
  unsigned int v33 = a3;
  if (!v31) {
    return;
  }
  uint64_t v34 = 0;
  uint64_t v35 = 48 * v31;
  while (1)
  {
    uint64_t v36 = a10 + v34;
    if (*(void *)(a10 + v34 + 208) == a1) {
      break;
    }
    v34 += 48;
    if (v35 == v34) {
      return;
    }
  }
  int v38 = *(_DWORD *)(v36 + 240);
  if (v38) {
    BOOL v39 = a5 == 0;
  }
  else {
    BOOL v39 = 0;
  }
  if (v39 && a8 == 0)
  {
    SCLog();
    __s1.version = 0;
    memset(&__s1.retain, 0, 24);
    __s1.mach_timebase_info info = (void *)a10;
    if (*(_WORD *)(a10 + 64) == 1 && !*(void *)(a10 + 952) && !*(void *)(a10 + 984))
    {
      SCLog();
      CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
      unsigned int v44 = CFRunLoopTimerCreate(0, Current + 20.0, 3.1536e10, 0, 0, (CFRunLoopTimerCallBack)sub_28BFC, &__s1);
      *(void *)(a10 + 984) = v44;
      if (v44)
      {
        CFRunLoopAddTimer(*(CFRunLoopRef *)(a10 + 976), v44, kCFRunLoopCommonModes);
        return;
      }
      goto LABEL_138;
    }
    return;
  }
  if (v38)
  {
    sub_27F48(a10);
    unsigned int v33 = a3;
    unsigned int v32 = a7;
  }
  if (*v53 == 1 && *(unsigned char *)(a10 + 617) == 2 && *(_DWORD *)(a10 + 620) == a5 && v32 == a8)
  {
    SCLog();
    unsigned int v33 = a3;
  }
  uint64_t v41 = a10 + v34;
  if (*(_DWORD *)(a10 + v34 + 220) == v33)
  {
    int v42 = *(_DWORD *)(v41 + 224);
    if (v42 == a6)
    {
      if (*(unsigned __int16 *)(a10 + v34 + 228) == v62)
      {
        SCLog();
        goto LABEL_113;
      }
LABEL_110:
      if (*(unsigned __int16 *)(a10 + v34 + 228) != v62)
      {
        SCLog();
        *(_WORD *)(a10 + v34 + 228) = v62;
      }
      goto LABEL_113;
    }
  }
  else
  {
    unsigned int v48 = v33;
    SCLog();
    *(_DWORD *)(v41 + 220) = v48;
    int v42 = *(_DWORD *)(v41 + 224);
  }
  if (v42 == a6) {
    goto LABEL_110;
  }
  SCLog();
  *(_DWORD *)(a10 + v34 + 224) = a6;
LABEL_113:
  uint64_t v49 = a10 + v34;
  int v50 = *(_DWORD *)(a10 + v34 + 232);
  unsigned int v51 = a7;
  unsigned int v52 = v60;
  if (!*(_DWORD *)(v36 + 240))
  {
    if (v50 != v60)
    {
      SCLog();
      unsigned int v52 = v60;
      unsigned int v51 = a7;
      *(_DWORD *)(v49 + 232) = v60;
    }
    if (*(unsigned __int16 *)(a10 + v34 + 236) != v61)
    {
      SCLog();
      unsigned int v51 = a7;
      *(_WORD *)(a10 + v34 + 236) = v61;
      unsigned int v52 = *(_DWORD *)(v49 + 232);
    }
    if (v52 && (!v51 || a8))
    {
      *(_DWORD *)(v36 + 240) = 1;
      goto LABEL_14;
    }
    return;
  }
  if (v50 != v60)
  {
    SCLog();
    if (!v59)
    {
      *(_DWORD *)(v49 + 232) = v60;
      return;
    }
    if (!a7 || a5) {
      goto LABEL_138;
    }
    return;
  }
  if (*(unsigned __int16 *)(a10 + v34 + 236) == v61)
  {
    if (a4 == -65558) {
      goto LABEL_14;
    }
    return;
  }
  SCLog();
  if (!v59)
  {
    *(_WORD *)(a10 + v34 + 236) = v61;
    return;
  }
  if (!a7 || a8)
  {
LABEL_138:
    SCLog();
    int v37 = (unsigned __int16)*v53;
LABEL_67:
    if (v37 == 1)
    {
      racoon_send_cmd_start_dpd(*(_DWORD *)(a10 + 784), *(_DWORD *)(a10 + 748));
      *(_DWORD *)(a10 + 992) = 1;
    }
  }
}

uint64_t sub_28BFC(uint64_t a1, uint64_t a2)
{
  if (*(_WORD *)(a2 + 64) == 1)
  {
    uint64_t result = SCLog();
    if (*(_WORD *)(a2 + 64) == 1)
    {
      uint64_t result = racoon_send_cmd_start_dpd(*(_DWORD *)(a2 + 784), *(_DWORD *)(a2 + 748));
      *(_DWORD *)(a2 + 992) = 1;
    }
  }
  return result;
}

uint64_t ne_sm_bridge_logv()
{
  if (!qword_435D8 || !*(void *)qword_435D8) {
    return 0;
  }
  (*(void (**)(void))qword_435D8)();
  return 1;
}

uint64_t ne_sm_bridge_is_logging_at_level()
{
  if (qword_435D8 && (int v0 = *(uint64_t (**)(void))(qword_435D8 + 8)) != 0) {
    return v0();
  }
  else {
    return 1;
  }
}

uint64_t ne_sm_bridge_copy_configuration(uint64_t a1)
{
  if (qword_435D8 && (unsigned int v1 = *(uint64_t (**)(void))(qword_435D8 + 16)) != 0) {
    return v1(*(void *)(a1 + 1064));
  }
  else {
    return 0;
  }
}

uint64_t ne_sm_bridge_status_changed(uint64_t result)
{
  if (qword_435D8 && *(void *)(qword_435D8 + 24))
  {
    uint64_t v1 = *(void *)(result + 1064);
    uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(qword_435D8 + 24);
    uint64_t v2 = scnc_getstatus(result + 8);
    return v3(v1, v2);
  }
  return result;
}

uint64_t ne_sm_bridge_acknowledge_sleep(uint64_t result)
{
  if (qword_435D8)
  {
    uint64_t v1 = *(uint64_t (**)(void))(qword_435D8 + 32);
    if (v1) {
      return v1(*(void *)(result + 1064));
    }
  }
  return result;
}

uint64_t ne_sm_bridge_filter_state_dictionaries(uint64_t result)
{
  if (qword_435D8)
  {
    uint64_t v1 = *(uint64_t (**)(void))(qword_435D8 + 40);
    if (v1) {
      return v1(*(void *)(result + 1064));
    }
  }
  return result;
}

uint64_t ne_sm_bridge_copy_password_from_keychain(uint64_t a1)
{
  if (qword_435D8 && (uint64_t v1 = *(uint64_t (**)(void))(qword_435D8 + 48)) != 0) {
    return v1(*(void *)(a1 + 1064));
  }
  else {
    return 0;
  }
}

void ne_sm_bridge_allow_dispose(uint64_t a1)
{
  uint64_t v1 = *(void (***)(void))(a1 + 1072);
  *(void *)(a1 + 1072) = 0;
  if (v1)
  {
    v1[2](v1);
    _Block_release(v1);
  }
}

uint64_t ne_sm_bridge_get_connect_time(uint64_t a1)
{
  if (qword_435D8 && (uint64_t v1 = *(uint64_t (**)(void))(qword_435D8 + 56)) != 0) {
    return v1(*(void *)(a1 + 1064));
  }
  else {
    return 0;
  }
}

uint64_t ne_sm_bridge_request_install(uint64_t a1)
{
  if (!qword_435D8) {
    return 0;
  }
  uint64_t v1 = *(void (**)(void))(qword_435D8 + 64);
  if (!v1) {
    return 0;
  }
  v1(*(void *)(a1 + 1064));
  return 1;
}

uint64_t ne_sm_bridge_request_uninstall(uint64_t a1)
{
  if (!qword_435D8) {
    return 0;
  }
  uint64_t v1 = *(void (**)(void))(qword_435D8 + 72);
  if (!v1) {
    return 0;
  }
  v1(*(void *)(a1 + 1064));
  return 1;
}

uint64_t ne_sm_bridge_start_profile_janitor(uint64_t a1, CFStringRef theString)
{
  if (!theString) {
    return 0;
  }
  uint64_t result = CFStringGetCString(theString, buffer, 256, 0x8000100u);
  if (!result) {
    return result;
  }
  if (!qword_435D8) {
    return 0;
  }
  int v4 = *(void (**)(void, char *))(qword_435D8 + 80);
  if (!v4) {
    return 0;
  }
  v4(*(void *)(a1 + 1064), buffer);
  return 1;
}

uint64_t ne_sm_bridge_clear_saved_password(uint64_t result)
{
  if (qword_435D8)
  {
    uint64_t v1 = *(uint64_t (**)(void))(qword_435D8 + 88);
    if (v1) {
      return v1(*(void *)(result + 1064));
    }
  }
  return result;
}

uint64_t ne_sm_bridge_copy_functions(uint64_t a1, uint64_t a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 0x40000000;
  v3[2] = sub_29008;
  _OWORD v3[3] = &unk_394C8;
  v3[4] = a1;
  v3[5] = a2;
  if (qword_435E0 != -1) {
    dispatch_once(&qword_435E0, v3);
  }
  return qword_435E8;
}

CFTypeRef sub_29008(uint64_t a1)
{
  uint64_t v2 = malloc_type_malloc(0xB8uLL, 0x80040A224B1F7uLL);
  qword_435E8 = (uint64_t)v2;
  *uint64_t v2 = sub_29208;
  v2[1] = sub_29440;
  v2[2] = sub_2950C;
  v2[3] = sub_29744;
  v2[4] = sub_297D8;
  v2[5] = sub_2985C;
  v2[6] = sub_29900;
  v2[7] = sub_299A0;
  v2[8] = sub_29A00;
  v2[9] = sub_29A84;
  v2[10] = sub_29B64;
  v2[11] = sub_29BA0;
  v2[12] = sub_29C18;
  v2[13] = sub_29C90;
  v2[14] = sub_29E44;
  v2[15] = sub_29EAC;
  v2[16] = sub_29F14;
  v2[17] = sub_29F84;
  v2[18] = sub_29FB0;
  v2[19] = sub_29FDC;
  v2[20] = sub_29FF4;
  v2[21] = sub_2A00C;
  v2[22] = sub_2A088;
  uint64_t v3 = malloc_type_malloc(0x60uLL, 0x800408F261F10uLL);
  qword_435D8 = (uint64_t)v3;
  int v4 = *(_OWORD **)(a1 + 32);
  long long v5 = v4[1];
  *uint64_t v3 = *v4;
  v3[1] = v5;
  long long v6 = v4[2];
  long long v7 = v4[3];
  long long v8 = v4[5];
  v3[4] = v4[4];
  v3[5] = v8;
  v3[2] = v6;
  _OWORD v3[3] = v7;
  CFTypeRef result = CFRetain(*(CFTypeRef *)(a1 + 40));
  gBundleRef = (uint64_t)result;
  return result;
}

unsigned char *sub_29208(int a1, const __CFString *a2, uint64_t a3)
{
  if (qword_435F0 != -1) {
    dispatch_once(&qword_435F0, &stru_39508);
  }
  if (byte_435F8 != 1) {
    return 0;
  }
  long long v6 = malloc_type_malloc(0x438uLL, 0x10F2040525B70B8uLL);
  bzero(v6 + 4, 0x434uLL);
  *(_DWORD *)long long v6 = a1;
  *((void *)v6 + 133) = a3;
  long long v7 = v6 + 8;
  *((void *)v6 + 4) = CFRetain(a2);
  CFIndex v8 = CFStringGetLength(a2) + 1;
  int v9 = (char *)malloc_type_malloc(v8, 0xB05C7E5CuLL);
  *((void *)v6 + 8) = v9;
  CFStringGetCString(a2, v9, v8, 0x8000100u);
  *((void *)v6 + 74) = v6;
  if (a1 == 1)
  {
    *((void *)v6 + 5) = CFRetain(kSCValNetInterfaceTypeIPSec);
    *((_WORD *)v6 + 36) = 1;
    ipsec_new_service((uint64_t)(v6 + 8));
    uint64_t v10 = ipsec_setup_service((uint64_t)(v6 + 8));
    if (!v10) {
      goto LABEL_14;
    }
    sub_2A0E4(3, @"bridge_create: ipsec_setup_service failed: %d", v11, v12, v13, v14, v15, v16, v10);
    goto LABEL_12;
  }
  if ((a1 & 0xFFFFFFFE) == 2)
  {
    *((void *)v6 + 5) = CFRetain(kSCValNetInterfaceTypePPP);
    unsigned int v17 = (CFTypeRef *)&kSCValNetInterfaceSubTypeL2TP;
    *((_WORD *)v6 + 36) = 0;
    if (a1 != 3) {
      unsigned int v17 = (CFTypeRef *)&kSCValNetInterfaceSubTypePPTP;
    }
    CFTypeRef v18 = CFRetain(*v17);
    *((void *)v6 + 6) = v18;
    *((_WORD *)v6 + 37) = ppp_subtype((unint64_t)v18);
    ppp_new_service((uint64_t)(v6 + 8));
    uint64_t v19 = ppp_setup_service((uint64_t)(v6 + 8));
    if (v19)
    {
      sub_2A0E4(3, @"bridge_create: ppp_setup_service failed: %d", v20, v21, v22, v23, v24, v25, v19);
LABEL_12:
      LOBYTE(a1) = 0;
      goto LABEL_14;
    }
  }
  LOBYTE(a1) = 1;
LABEL_14:
  int v26 = findfreeunit(*((unsigned __int16 *)v6 + 36), *((unsigned __int16 *)v6 + 37));
  *((_WORD *)v6 + 38) = v26;
  if (v26 == 0xFFFF)
  {
    sub_2A0E4(3, @"bridge_create: findfreeunit failed", v27, v28, v29, v30, v31, v32, v36);
    uint64_t v34 = (void *)qword_436E8;
    *((void *)v6 + 1) = 0;
    *((void *)v6 + 2) = v34;
    *uint64_t v34 = v7;
    qword_436E8 = (uint64_t)(v6 + 8);
    goto LABEL_18;
  }
  unsigned int v33 = (void *)qword_436E8;
  *((void *)v6 + 1) = 0;
  *((void *)v6 + 2) = v33;
  void *v33 = v7;
  qword_436E8 = (uint64_t)(v6 + 8);
  if ((a1 & 1) == 0)
  {
LABEL_18:
    sub_29440(v6);
    return 0;
  }
  v6[24] = 1;
  return v6;
}

void sub_29440(void *a1)
{
  if ((*(_DWORD *)a1 - 2) >= 2)
  {
    if (*(_DWORD *)a1 == 1) {
      ipsec_dispose_service((uint64_t)a1 + 8);
    }
  }
  else
  {
    ppp_dispose_service((uint64_t)a1 + 8);
  }
  CFRelease(*((CFTypeRef *)a1 + 4));
  CFRelease(*((CFTypeRef *)a1 + 5));
  uint64_t v2 = (const void *)*((void *)a1 + 6);
  if (v2) {
    CFRelease(v2);
  }
  uint64_t v3 = *((void *)a1 + 1);
  int v4 = (void *)*((void *)a1 + 2);
  if (v3)
  {
    *(void *)(v3 + 8) = v4;
    int v4 = (void *)*((void *)a1 + 2);
  }
  else
  {
    qword_436E8 = *((void *)a1 + 2);
  }
  *int v4 = v3;
  long long v5 = (const void *)*((void *)a1 + 134);
  if (v5) {
    _Block_release(v5);
  }
  long long v6 = (void *)*((void *)a1 + 65);
  if (v6) {
    free(v6);
  }
  long long v7 = (void *)*((void *)a1 + 66);
  if (v7) {
    free(v7);
  }
  free(*((void **)a1 + 8));

  free(a1);
}

void sub_2950C(_DWORD *a1, const char *a2, char a3)
{
  if (*a1 == 1)
  {
    uint64_t v5 = (uint64_t)(a1 + 2);
    if (scnc_getstatus((uint64_t)(a1 + 2)))
    {
      memset(v41, 0, sizeof(v41));
      long long v39 = 0u;
      long long v40 = 0u;
      long long v38 = 0u;
      if (a3)
      {
        uint64_t v35 = 0;
        uint64_t v36 = 512;
        uint64_t v37 = 0;
        strncpy(__dst, a2, 0xFuLL);
        int v6 = socket(2, 2, 0);
        int v7 = ioctl(v6, 0xC0206921uLL, __dst);
        close(v6);
        if (v7 < 0)
        {
          int v26 = __error();
          uint64_t v27 = strerror(*v26);
          sub_2A0E4(3, @"ioctl(SIOCGIFADDR) failed: %s", v28, v29, v30, v31, v32, v33, (uint64_t)v27);
          return;
        }
        LODWORD(v41[0]) = HIDWORD(v36);
      }
      uint64_t v8 = -1;
      do
      {
        int v9 = a2[++v8];
        if (v9) {
          BOOL v10 = (v9 - 58) >= 0xFFFFFFF6;
        }
        else {
          BOOL v10 = 1;
        }
      }
      while (!v10);
      uint64_t v11 = &a2[v8];
      __strncpy_chk();
      if ((*v11 - 48) <= 9) {
        HIDWORD(v39) = strtol(v11, 0, 10);
      }
      if (v40 == 7368816) {
        DWORD2(v39) = 6;
      }
      if (a3) {
        int v18 = 1;
      }
      else {
        int v18 = 3;
      }
      DWORD1(v39) = v18;
      if (qword_435D8)
      {
        uint64_t v19 = *(unsigned int (**)(uint64_t))(qword_435D8 + 8);
        if (v19)
        {
          if (!v19(7))
          {
LABEL_27:
            ipsec_network_event(v5, (uint64_t)&v38);
            return;
          }
          int v18 = DWORD1(v39);
        }
      }
      if (v18 == 3)
      {
        sub_2A0E4(7, @"Network change event: deleted address from interface %s%d (family %d)", v12, v13, v14, v15, v16, v17, (uint64_t)&v40);
      }
      else if (v18 == 1)
      {
        *(void *)__dst = 0;
        uint64_t v35 = 0;
        inet_ntop(2, v41, __dst, 0x10u);
        sub_2A0E4(7, @"Network change event: added address %s to interface %s%d (family %d)", v20, v21, v22, v23, v24, v25, (uint64_t)__dst);
      }
      goto LABEL_27;
    }
  }
}

BOOL sub_29744(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((*a1 - 2) >= 2) {
    BOOL v9 = *a1 == 1 && ipsec_will_sleep((uint64_t)(a1 + 2), 0) != 0;
  }
  else {
    BOOL v9 = (int)ppp_will_sleep((uint64_t)(a1 + 2), 0) > 0;
  }
  sub_2A0E4(7, @"handle sleep for bridge type %d returning %d", a3, a4, a5, a6, a7, a8, *a1);
  return v9;
}

BOOL sub_297D8(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if ((*a1 - 2) >= 2)
  {
    if (*a1 != 1)
    {
      BOOL v10 = 1;
      goto LABEL_7;
    }
    BOOL can_sleep = ipsec_can_sleep((uint64_t)(a1 + 2));
  }
  else
  {
    BOOL can_sleep = ppp_can_sleep((uint64_t)(a1 + 2));
  }
  BOOL v10 = can_sleep;
LABEL_7:
  sub_2A0E4(7, @"can sleep for bridge type %d returning %d", a3, a4, a5, a6, a7, a8, *a1);
  return v10;
}

uint64_t sub_2985C(uint64_t a1, double a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t result = sub_2A0E4(6, @"System slept for %f secs", a4, a5, a6, a7, a8, a9, *(uint64_t *)&a2);
  if ((*(unsigned char *)(a1 + 83) & 8) != 0)
  {
    uint64_t result = sub_2A0E4(6, @"Session is configured to disconnect on wake if slept for more than %f seconds", v12, v13, v14, v15, v16, v17, 0);
    *(_DWORD *)(a1 + 200) += a2;
    if (a2 > 0.0)
    {
      return scnc_idle_disconnect(a1 + 8);
    }
  }
  return result;
}

_DWORD *sub_29900(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result = (_DWORD *)sub_2A0E4(5, @"Handling wake up for bridge type %d", a3, a4, a5, a6, a7, a8, *a1);
  if (*a1 - 2 >= 2)
  {
    if (*a1 == 1)
    {
      return (_DWORD *)ipsec_wake_up((uint64_t)(a1 + 2));
    }
  }
  else
  {
    return ppp_wake_up(a1 + 2);
  }
  return result;
}

BOOL sub_299A0(_DWORD *a1, const void *a2, int a3, int a4, mach_port_name_t a5, mach_port_name_t a6, int a7)
{
  if ((*a1 - 2) < 2)
  {
    int v7 = ppp_start((unint64_t)(a1 + 2), a2, a3, a4, a5, a6, 0, a7);
    return v7 == 0;
  }
  if (*a1 == 1)
  {
    int v7 = ipsec_start((uint64_t)(a1 + 2), a2, a3, a4, a5, 0, a7);
    return v7 == 0;
  }
  return 0;
}

BOOL sub_29A00(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2A0E4(5, @"Handling stop for bridge type %d", a3, a4, a5, a6, a7, a8, *a1);
  if (*a1 - 2 < 2)
  {
    int v9 = ppp_stop(a1 + 2, 15);
    return v9 == 0;
  }
  if (*a1 == 1)
  {
    int v9 = ipsec_stop((uint64_t)(a1 + 2));
    return v9 == 0;
  }
  return 0;
}

void sub_29A84(_DWORD *a1, xpc_object_t xdict, _DWORD *a3, _DWORD *a4)
{
  xpc_dictionary_get_remote_connection(xdict);
  int v7 = (void *)xpc_connection_copy_entitlement_value();
  uint64_t v8 = v7;
  if (*a1 == 3)
  {
    if (!v7)
    {
      *a3 = 0;
      *a4 = 0;
      return;
    }
  }
  else if (*a1 != 2 || v7 == 0)
  {
    *a3 = 0;
    *a4 = 0;
    if (!v7) {
      return;
    }
    goto LABEL_16;
  }
  if (xpc_get_type(v7) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v8))
  {
    *a3 = a1[26];
    int v10 = a1[27];
  }
  else
  {
    int v10 = 0;
    *a3 = 0;
  }
  *a4 = v10;
LABEL_16:

  xpc_release(v8);
}

void *sub_29B64(uint64_t a1, void *aBlock)
{
  int v4 = *(const void **)(a1 + 1072);
  if (v4) {
    _Block_release(v4);
  }
  uint64_t result = _Block_copy(aBlock);
  *(void *)(a1 + 1072) = result;
  return result;
}

uint64_t sub_29BA0(_DWORD *a1)
{
  uint64_t v10 = 0;
  if ((*a1 - 2) < 2)
  {
    int v1 = ppp_copystatistics((uint64_t)(a1 + 2), &v10);
    if (!v1) {
      return v10;
    }
    goto LABEL_6;
  }
  if (*a1 == 1)
  {
    int v1 = ipsec_copystatistics((uint64_t)(a1 + 2), &v10);
    if (v1)
    {
LABEL_6:
      uint64_t v2 = strerror(v1);
      sub_2A0E4(5, @"Failed to copy statistics: %s", v3, v4, v5, v6, v7, v8, (uint64_t)v2);
    }
  }
  return v10;
}

uint64_t sub_29C18(_DWORD *a1)
{
  uint64_t v10 = 0;
  if ((*a1 - 2) < 2)
  {
    int v1 = ppp_copyextendedstatus((uint64_t)(a1 + 2), &v10);
    if (!v1) {
      return v10;
    }
    goto LABEL_6;
  }
  if (*a1 == 1)
  {
    int v1 = ipsec_copyextendedstatus((uint64_t)(a1 + 2), &v10);
    if (v1)
    {
LABEL_6:
      uint64_t v2 = strerror(v1);
      sub_2A0E4(5, @"Failed to copy extended status: %s", v3, v4, v5, v6, v7, v8, (uint64_t)v2);
    }
  }
  return v10;
}

__CFDictionary *sub_29C90(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_get_remote_connection(xdict);
  if (qword_435D8 && (uint64_t v3 = *(uint64_t (**)(void))(qword_435D8 + 16)) != 0) {
    uint64_t v4 = (const void *)v3(*(void *)(a1 + 1064));
  }
  else {
    uint64_t v4 = 0;
  }
  CFStringRef value = 0;
  if ((*(_DWORD *)a1 - 2) >= 2)
  {
    if (*(_DWORD *)a1 != 1)
    {
      int v9 = 0;
      goto LABEL_17;
    }
    int v8 = ipsec_getconnectdata(a1 + 8, (CFTypeRef *)&value, 0);
LABEL_16:
    int v9 = v8;
    goto LABEL_17;
  }
  uint64_t v5 = (void *)xpc_connection_copy_entitlement_value();
  if (!v5)
  {
    int v8 = ppp_getconnectdata(a1 + 8, (CFTypeRef *)&value, 0);
    goto LABEL_16;
  }
  uint64_t v6 = v5;
  BOOL v7 = xpc_get_type(v5) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v6);
  int v9 = ppp_getconnectdata(a1 + 8, (CFTypeRef *)&value, v7);
  xpc_release(v6);
LABEL_17:
  CFMutableDictionaryRef Mutable = 0;
  uint64_t v11 = value;
  if (!v9 && value)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    CFDictionarySetValue(Mutable, @"SessionLegacyUserConfiguration", value);
    uint64_t v11 = value;
  }
  if (v11) {
    CFRelease(v11);
  }
  if (v4)
  {
    if (!Mutable) {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    }
    CFDictionarySetValue(Mutable, @"SessionLegacyServiceConfiguration", v4);
    CFRelease(v4);
  }
  return Mutable;
}

_DWORD *sub_29E44(_DWORD *result)
{
  if ((*result - 2) < 2)
  {
    uint64_t result = (_DWORD *)ppp_install((uint64_t)(result + 2));
    if (!result) {
      return result;
    }
LABEL_6:
    int v1 = strerror((int)result);
    return (_DWORD *)sub_2A0E4(5, @"Failed to install: %s", v2, v3, v4, v5, v6, v7, (uint64_t)v1);
  }
  if (*result == 1)
  {
    uint64_t result = (_DWORD *)ipsec_install((uint64_t)(result + 2));
    if (result) {
      goto LABEL_6;
    }
  }
  return result;
}

_DWORD *sub_29EAC(_DWORD *result)
{
  if ((*result - 2) < 2)
  {
    uint64_t result = (_DWORD *)ppp_uninstall((uint64_t)(result + 2));
    if (!result) {
      return result;
    }
LABEL_6:
    int v1 = strerror((int)result);
    return (_DWORD *)sub_2A0E4(5, @"Failed to uninstall: %s", v2, v3, v4, v5, v6, v7, (uint64_t)v1);
  }
  if (*result == 1)
  {
    uint64_t result = (_DWORD *)ipsec_uninstall((uint64_t)(result + 2));
    if (result) {
      goto LABEL_6;
    }
  }
  return result;
}

_DWORD *sub_29F14(_DWORD *result)
{
  if ((*result - 2) >= 2)
  {
    if (*result == 1)
    {
      uint64_t result = (_DWORD *)ipsec_setup_service((uint64_t)(result + 2));
      if (result) {
        return (_DWORD *)sub_2A0E4(3, @"bridge_create: ipsec_setup_service failed: %d", v7, v8, v9, v10, v11, v12, (uint64_t)result);
      }
    }
  }
  else
  {
    uint64_t result = (_DWORD *)ppp_setup_service((uint64_t)(result + 2));
    if (result) {
      return (_DWORD *)sub_2A0E4(3, @"bridge_create: ppp_setup_service failed: %d", v1, v2, v3, v4, v5, v6, (uint64_t)result);
    }
  }
  return result;
}

_DWORD *sub_29F84(_DWORD *result)
{
  if ((*result - 2) < 2) {
    return (_DWORD *)ppp_log_out((uint64_t)(result + 2));
  }
  if (*result == 1) {
    return (_DWORD *)ipsec_log_out((uint64_t)(result + 2));
  }
  return result;
}

_DWORD *sub_29FB0(_DWORD *result)
{
  if ((*result - 2) < 2) {
    return ppp_log_switch(result + 2);
  }
  if (*result == 1) {
    return (_DWORD *)ipsec_log_switch((uint64_t)(result + 2));
  }
  return result;
}

_DWORD *sub_29FDC(_DWORD *result)
{
  if (*result == 1) {
    return (_DWORD *)ipsec_device_lock(result + 2);
  }
  return result;
}

_DWORD *sub_29FF4(_DWORD *result)
{
  if (*result == 1) {
    return (_DWORD *)ipsec_device_unlock((uint64_t)(result + 2));
  }
  return result;
}

CFTypeID sub_2A00C(_DWORD *a1, const void *a2)
{
  CFTypeID result = CFDictionaryGetTypeID();
  if (a2)
  {
    CFTypeID v5 = result;
    CFTypeID result = CFGetTypeID(a2);
    if (result == v5 && *a1 == 1)
    {
      return ipsec_set_initial_values((uint64_t)(a1 + 2), a2);
    }
  }
  return result;
}

FILE *sub_2A088(FILE *result, _DWORD *a2)
{
  if (a2)
  {
    uint64_t v3 = result;
    CFTypeID result = racoon_pid();
    *a2 = result;
    if ((LODWORD(v3->_p) - 2) >= 2)
    {
      if (LODWORD(v3->_p) != 1) {
        return result;
      }
      int r = 0;
    }
    else
    {
      int r = v3[4]._r;
    }
    a2[1] = r;
  }
  return result;
}

uint64_t sub_2A0E4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  if (qword_435D8)
  {
    if (*(void *)qword_435D8) {
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t *))qword_435D8)(result, a2, &a9);
    }
  }
  return result;
}

void sub_2A124(id a1)
{
  mach_timebase_info info = 0;
  values = kCFBooleanTrue;
  keys = (void *)kSCDynamicStoreUseSessionKeys;
  scnc_init_resources((__CFBundle *)gBundleRef);
  if (mach_timebase_info(&info))
  {
    sub_2A0E4(3, @"init_controller: mach_timebase_info failed", v1, v2, v3, v4, v5, v6, v18);
    return;
  }
  LODWORD(v7) = info.numer;
  LODWORD(v8) = info.denom;
  *(double *)&gTimeScaleSeconds = (double)v7 / (double)v8 / 1000000000.0;
  CFDictionaryRef v9 = CFDictionaryCreate(kCFAllocatorDefault, (const void **)&keys, (const void **)&values, 1, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  gDynamicStore = (uint64_t)SCDynamicStoreCreateWithOptions(kCFAllocatorDefault, @"NE - SCNC bridge", v9, 0, 0);
  if (gDynamicStore)
  {
    service_head = 0;
    qword_436E8 = (uint64_t)&service_head;
    client_init_all();
    ipsec_init_things();
    byte_435F8 = 1;
    if (!v9) {
      return;
    }
  }
  else
  {
    int v10 = SCError();
    uint64_t v11 = SCErrorString(v10);
    sub_2A0E4(3, @"init_controller: SCDynamicStoreCreateWithOptions failed: %s", v12, v13, v14, v15, v16, v17, (uint64_t)v11);
    if (!v9) {
      return;
    }
  }
  CFRelease(v9);
}

uint64_t setup_security_context()
{
  kern_return_t v0;
  uint64_t v1;
  _OWORD v3[2];
  int v4;
  mach_port_name_t v5;
  mach_port_t sp[2];

  *(void *)sp = 0;
  uint64_t v5 = 0;
  uint64_t v4 = 0;
  memset(v3, 0, sizeof(v3));
  int v0 = bootstrap_look_up(bootstrap_port, "com.apple.SystemConfiguration.PPPController-priv", &sp[1]);
  if (v0)
  {
    if (v0 == 1102) {
      return 0xFFFFFFFFLL;
    }
    else {
      return 4294967294;
    }
  }
  else
  {
    uint64_t v1 = sub_2C618(sp[1], sp, &v5, &v4, v3);
    mach_port_deallocate(mach_task_self_, sp[1]);
    if (!v1)
    {
      if (!sp[0]
        || (uint64_t v1 = task_set_special_port(mach_task_self_, 4, sp[0]),
            mach_port_deallocate(mach_task_self_, sp[0]),
            !v1))
      {
        if (v5)
        {
          if (!audit_session_join(v5)) {
            return 4294967293;
          }
          mach_port_deallocate(mach_task_self_, v5);
        }
        return 0;
      }
    }
  }
  return v1;
}

uint64_t controller_options_get_onDemandPauseIntervalOnAuthCancel()
{
  return dword_40408;
}

uint64_t controller_options_is_onDemandPauseUntilNetChangeCheckWakeup()
{
  return byte_4040C;
}

uint64_t controller_options_is_onDemandPauseUntilNetChangeCheckSignature()
{
  return byte_4040D;
}

uint64_t controller_options_is_onDemandAutoPauseUponDisconnect()
{
  return byte_4040E;
}

uint64_t controller_options_is_useVODDisconnectRulesWhenVODDisabled()
{
  return byte_43600;
}

uint64_t controller_options_get_onDemandBlacklistedProcesses()
{
  return qword_43608;
}

void controller_options_modify_ondemand()
{
  uint64_t v1 = 0;
  uint64_t v2 = &v1;
  uint64_t v3 = 0x2000000000;
  char v4 = 1;
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_2A4C4;
  block[3] = &unk_39530;
  block[4] = &v1;
  if (qword_43618 != -1) {
    dispatch_once(&qword_43618, block);
  }
  if (*((unsigned char *)v2 + 24))
  {
    sub_2A684(*(const __SCPreferences **)qword_43610);
    SCPreferencesSynchronize(*(SCPreferencesRef *)qword_43610);
  }
  _Block_object_dispose(&v1, 8);
}

void sub_2A4C4(uint64_t a1)
{
  memset(&context, 0, sizeof(context));
  qword_43610 = (uint64_t)CFAllocatorAllocate(kCFAllocatorDefault, 8, 0);
  uint64_t v2 = SCPreferencesCreate(kCFAllocatorDefault, @"PPPController", @"com.apple.pppcontroller-options.plist");
  uint64_t v3 = (void *)qword_43610;
  *(void *)qword_43610 = v2;
  if (!v2)
  {
    int v6 = SCError();
    SCErrorString(v6);
LABEL_7:
    SCLog();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    goto LABEL_8;
  }
  context.version = 0;
  memset(&context.retain, 0, 24);
  context.mach_timebase_info info = v3;
  if (!SCPreferencesSetCallback(v2, (SCPreferencesCallBack)sub_2A628, &context)
    || (char v4 = *(const __SCPreferences **)qword_43610,
        CFAbsoluteTime Current = CFRunLoopGetCurrent(),
        !SCPreferencesScheduleWithRunLoop(v4, Current, kCFRunLoopDefaultMode)))
  {
    int v7 = SCError();
    SCErrorString(v7);
    goto LABEL_7;
  }
LABEL_8:
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    unint64_t v8 = (void *)qword_43610;
    if (*(void *)qword_43610)
    {
      CFRelease(*(CFTypeRef *)qword_43610);
      unint64_t v8 = (void *)qword_43610;
    }
    CFAllocatorDeallocate(kCFAllocatorDefault, v8);
    qword_43610 = 0;
  }
}

void sub_2A628(const __SCPreferences *a1, int a2)
{
  if (a2 == 1)
  {
    SCLog();
    sub_2A684(a1);
    SCPreferencesSynchronize(a1);
  }
}

uint64_t sub_2A684(const __SCPreferences *a1)
{
  SCLog();
  CFBooleanRef Value = (const __CFBoolean *)SCPreferencesGetValue(a1, @"Debug");
  CFTypeID TypeID = CFBooleanGetTypeID();
  if (Value && CFGetTypeID(Value) == TypeID)
  {
    int v4 = CFBooleanGetValue(Value);
    SCLog();
  }
  else
  {
    SCLog();
    int v4 = 0;
  }
  gSCNCVerbose = _sc_verbose | v4;
  gSCNCDebug = v4;
  dword_40408 = 10;
  CFNumberRef v5 = (const __CFNumber *)SCPreferencesGetValue(a1, @"OnDemandPauseIntervalOnAuthCancel");
  CFTypeID v6 = CFNumberGetTypeID();
  if (v5 && CFGetTypeID(v5) == v6) {
    CFNumberGetValue(v5, kCFNumberSInt32Type, &dword_40408);
  }
  SCLog();
  byte_4040C = 1;
  CFBooleanRef v7 = (const __CFBoolean *)SCPreferencesGetValue(a1, @"PauseUntilNetChangeCheckWakeup");
  CFTypeID v8 = CFBooleanGetTypeID();
  if (v7 && CFGetTypeID(v7) == v8) {
    byte_4040C = CFBooleanGetValue(v7);
  }
  SCLog();
  byte_4040D = 1;
  CFBooleanRef v9 = (const __CFBoolean *)SCPreferencesGetValue(a1, @"PauseUntilNetChangeCheckNetSignature");
  CFTypeID v10 = CFBooleanGetTypeID();
  if (v9 && CFGetTypeID(v9) == v10) {
    byte_4040D = CFBooleanGetValue(v9);
  }
  SCLog();
  byte_4040E = 1;
  CFBooleanRef v11 = (const __CFBoolean *)SCPreferencesGetValue(a1, @"OnDemandAutoPauseUponDisconnect");
  CFTypeID v12 = CFBooleanGetTypeID();
  if (v11 && CFGetTypeID(v11) == v12) {
    byte_4040E = CFBooleanGetValue(v11);
  }
  SCLog();
  if (qword_43608) {
    CFRelease((CFTypeRef)qword_43608);
  }
  qword_43608 = 0;
  CFArrayRef v13 = (const __CFArray *)SCPreferencesGetValue(a1, @"OnDemandBlacklistedProcesses");
  CFTypeID v14 = CFArrayGetTypeID();
  if (v13 && CFGetTypeID(v13) == v14)
  {
    CFIndex Count = CFArrayGetCount(v13);
    if (Count < 1)
    {
LABEL_26:
      qword_43608 = (uint64_t)CFArrayCreateCopy(kCFAllocatorDefault, v13);
    }
    else
    {
      CFIndex v16 = Count;
      CFIndex v17 = 0;
      while (1)
      {
        CFDictionaryRef ValueAtIndex = CFArrayGetValueAtIndex(v13, v17);
        CFTypeID v19 = CFStringGetTypeID();
        if (!ValueAtIndex || CFGetTypeID(ValueAtIndex) != v19) {
          break;
        }
        if (v16 == ++v17) {
          goto LABEL_26;
        }
      }
    }
  }
  else
  {
    SCLog();
  }
  int v20 = byte_43600;
  byte_43600 = 0;
  CFBooleanRef v21 = (const __CFBoolean *)SCPreferencesGetValue(a1, @"UseVODDisconnectRulesWhenVODDisabled");
  CFTypeID v22 = CFBooleanGetTypeID();
  if (v21 && CFGetTypeID(v21) == v22) {
    byte_43600 = CFBooleanGetValue(v21);
  }
  uint64_t result = SCLog();
  if (byte_43600 != v20)
  {
    uint64_t v24 = (void *)service_head;
    if (service_head)
    {
      uint64_t v25 = (const void *)kSCPropNetVPNOnDemandRules;
      do
      {
        int v26 = v24;
        uint64_t v24 = (void *)*v24;
        int v27 = *((_DWORD *)v26 + 18);
        if ((v27 & 0x200000) == 0)
        {
          if (!byte_43600)
          {
            unsigned int v28 = v27 & 0xFEFFFFFF;
            goto LABEL_39;
          }
          uint64_t result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)v26[17], v25);
          if (result)
          {
            unsigned int v28 = *((_DWORD *)v26 + 18) | 0x1000000;
LABEL_39:
            *((_DWORD *)v26 + 18) = v28;
          }
        }
      }
      while (v24);
    }
  }
  return result;
}

void reachability_init(uint64_t a1, uint64_t a2, uint64_t a3)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 0x40000000;
  block[2] = sub_2AC10;
  block[3] = &unk_39558;
  void block[5] = a1;
  block[6] = a2;
  block[4] = a3;
  if (qword_43620 != -1) {
    dispatch_once(&qword_43620, block);
  }
}

void *sub_2AC10(uint64_t a1)
{
  qword_43628 = (uint64_t)dispatch_queue_create("PPPController reachability dispatch queue", 0);
  qword_43630 = *(void *)(a1 + 40);
  CFRetain((CFTypeRef)qword_43630);
  qword_43638 = *(void *)(a1 + 48);
  CFRetain((CFTypeRef)qword_43638);
  uint64_t result = _Block_copy(*(const void **)(a1 + 32));
  qword_43640 = (uint64_t)result;
  return result;
}

double reachability_clear(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 536);
  if (v2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_2B2F0;
    block[3] = &unk_395D8;
    block[4] = v2;
    dispatch_async((dispatch_queue_t)qword_43628, block);
  }
  *(void *)(a1 + 536) = 0;
  double result = NAN;
  *(void *)(a1 + 544) = 0xFFFFFFFF00000000;
  return result;
}

void reachability_reset(uint64_t a1)
{
  reachability_clear(a1);
  CFStringRef v2 = scnc_copy_remote_server(a1, 0);
  CFTypeID TypeID = CFStringGetTypeID();
  if (v2 && CFGetTypeID(v2) == TypeID && CFStringGetLength(v2) >= 1)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v17 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    *(_OWORD *)bytes = 0u;
    CFIndex Length = CFStringGetLength(v2);
    CFNumberRef v5 = (char *)CFAllocatorAllocate(kCFAllocatorDefault, Length + 1, 0);
    CFStringGetCString(v2, v5, Length, 0x600u);
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    if (inet_pton(2, v5, &bytes[4]) == 1)
    {
      *(_WORD *)bytes = 528;
      CFAllocatorRef v7 = kCFAllocatorDefault;
      CFIndex v8 = 16;
    }
    else
    {
      if (inet_pton(30, v5, &bytes[8]) != 1)
      {
        CFDictionarySetValue(Mutable, @"nodename", v2);
        goto LABEL_10;
      }
      *(_WORD *)bytes = 7708;
      CFAllocatorRef v7 = kCFAllocatorDefault;
      CFIndex v8 = 28;
    }
    CFDataRef v9 = CFDataCreate(v7, bytes, v8);
    CFDictionarySetValue(Mutable, @"remote-address", v9);
    CFRelease(v9);
LABEL_10:
    CFRelease(v2);
    CFAllocatorDeallocate(kCFAllocatorDefault, v5);
    CFDictionarySetValue(Mutable, @"ConnectionOnDemandBypass", kCFBooleanTrue);
    CFTypeID v10 = *(const void **)(a1 + 24);
    CFRetain(v10);
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_2AF68;
    block[3] = &unk_395B8;
    block[4] = Mutable;
    void block[5] = v10;
    block[6] = v2;
    dispatch_async((dispatch_queue_t)qword_43628, block);
  }
}

void sub_2AF68(uint64_t a1)
{
  CFStringRef v2 = (const __SCNetworkReachability *)SCNetworkReachabilityCreateWithOptions();
  CFRelease(*(CFTypeRef *)(a1 + 32));
  if (v2)
  {
    uint64_t v3 = *(void **)(a1 + 40);
    context.version = 0;
    context.mach_timebase_info info = v3;
    context.retain = (const void *(__cdecl *)(const void *))&_CFRetain;
    context.release = (void (__cdecl *)(const void *))&_CFRelease;
    context.copyDescription = (CFStringRef (__cdecl *)(const void *))&CFCopyDescription;
    SCNetworkReachabilitySetCallback(v2, (SCNetworkReachabilityCallBack)sub_2B0B4, &context);
    SCNetworkReachabilitySetDispatchQueue(v2, (dispatch_queue_t)qword_43628);
    block[0] = _NSConcreteStackBlock;
    block[1] = 0x40000000;
    block[2] = sub_2B180;
    block[3] = &unk_39598;
    block[4] = *(void *)(a1 + 40);
    void block[5] = v2;
    CFRunLoopPerformBlock((CFRunLoopRef)qword_43630, (CFTypeRef)qword_43638, block);
    CFRunLoopWakeUp((CFRunLoopRef)qword_43630);
  }
  else
  {
    SCLog();
  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void sub_2B0B4(const void *a1, SCNetworkReachabilityFlags a2, const void *a3)
{
  SCNetworkReachabilityFlags flags = a2;
  CFRetain(a1);
  CFRetain(a3);
  SCNetworkReachabilityGetFlags((SCNetworkReachabilityRef)a1, &flags);
  int InterfaceIndex = SCNetworkReachabilityGetInterfaceIndex();
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 0x40000000;
  void v6[2] = sub_2B340;
  v6[3] = &unk_395F8;
  int v6[4] = a3;
  v6[5] = a1;
  SCNetworkReachabilityFlags v7 = flags;
  int v8 = InterfaceIndex;
  CFRunLoopPerformBlock((CFRunLoopRef)qword_43630, (CFTypeRef)qword_43638, v6);
  CFRunLoopWakeUp((CFRunLoopRef)qword_43630);
}

void sub_2B180(uint64_t a1)
{
  CFStringRef v2 = findbyserviceID(*(CFStringRef *)(a1 + 32));
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = v2[67];
    if (v4)
    {
      blocCFIndex k = _NSConcreteStackBlock;
      uint64_t v11 = 0x40000000;
      CFTypeID v12 = sub_2B2F0;
      long long v13 = &unk_395D8;
      uint64_t v14 = v4;
      dispatch_async((dispatch_queue_t)qword_43628, &block);
      v3[67] = 0;
    }
    v3[67] = *(void *)(a1 + 40);
    CFNumberRef v5 = qword_43628;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 0x40000000;
    v8[2] = sub_2B2E0;
    v8[3] = &unk_39578;
    int8x16_t v9 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
    p_blocCFIndex k = (void ***)v8;
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 40);
    CFNumberRef v5 = qword_43628;
    blocCFIndex k = _NSConcreteStackBlock;
    uint64_t v11 = 0x40000000;
    CFTypeID v12 = sub_2B2F0;
    long long v13 = &unk_395D8;
    uint64_t v14 = v7;
    p_blocCFIndex k = &block;
  }
  dispatch_async(v5, p_block);
}

void sub_2B2E0(uint64_t a1)
{
}

void sub_2B2F0(uint64_t a1)
{
  SCNetworkReachabilitySetCallback(*(SCNetworkReachabilityRef *)(a1 + 32), 0, 0);
  SCNetworkReachabilitySetDispatchQueue(*(SCNetworkReachabilityRef *)(a1 + 32), 0);
  CFStringRef v2 = *(const void **)(a1 + 32);

  CFRelease(v2);
}

void sub_2B340(uint64_t a1)
{
  CFStringRef v2 = findbyserviceID(*(CFStringRef *)(a1 + 32));
  if (v2 && v2[67] == *(void *)(a1 + 40))
  {
    *((_DWORD *)v2 + 136) = *(_DWORD *)(a1 + 48);
    *((_DWORD *)v2 + 137) = *(_DWORD *)(a1 + 52);
    (*(void (**)(void))(qword_43640 + 16))();
  }
  CFRelease(*(CFTypeRef *)(a1 + 40));
  uint64_t v3 = *(const void **)(a1 + 32);

  CFRelease(v3);
}

uint64_t sub_2B3C0(mach_port_t a1, uint64_t a2, int a3, unsigned int a4, unsigned int a5, unsigned int a6, _DWORD *a7, _DWORD *a8)
{
  msg.msgh_size_t size = 0;
  int v17 = 4;
  uint64_t v18 = a2;
  int v19 = 16777472;
  int v20 = a3;
  uint64_t v21 = a4;
  int v22 = 1245184;
  uint64_t v23 = a5;
  int v24 = 1114112;
  uint64_t v25 = a6;
  int v26 = 1245184;
  NDR_record_t v27 = NDR_record;
  int v28 = a3;
  reply_CFMachPortRef port = mig_get_reply_port();
  msg.msgh_remote_CFMachPortRef port = a1;
  msg.msgh_local_CFMachPortRef port = reply_port;
  msg.msgh_bits = -2147478253;
  *(void *)&msg.msgh_voucher_CFMachPortRef port = 0x465000000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    reply_CFMachPortRef port = msg.msgh_local_port;
  }
  uint64_t v12 = mach_msg(&msg, 3, 0x5Cu, 0x3Cu, reply_port, 0, 0);
  uint64_t v13 = v12;
  if ((v12 - 268435458) <= 0xE && ((1 << (v12 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
  }
  else
  {
    if (!v12)
    {
      if (msg.msgh_id == 71)
      {
        uint64_t v13 = 4294966988;
      }
      else if (msg.msgh_id == 18100)
      {
        if ((msg.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v13 = 4294966996;
          if (v17 == 1 && msg.msgh_size == 52 && !msg.msgh_remote_port && HIWORD(v19) << 16 == 1114112)
          {
            uint64_t v13 = 0;
            int v14 = HIDWORD(v21);
            *a7 = v18;
            *a8 = v14;
            return v13;
          }
        }
        else if (msg.msgh_size == 36)
        {
          uint64_t v13 = 4294966996;
          if (HIDWORD(v18))
          {
            if (msg.msgh_remote_port) {
              uint64_t v13 = 4294966996;
            }
            else {
              uint64_t v13 = HIDWORD(v18);
            }
          }
        }
        else
        {
          uint64_t v13 = 4294966996;
        }
      }
      else
      {
        uint64_t v13 = 4294966995;
      }
      mach_msg_destroy(&msg);
      return v13;
    }
    mig_dealloc_reply_port(msg.msgh_local_port);
  }
  return v13;
}

uint64_t sub_2B5C4(int a1, _DWORD *a2, _DWORD *a3)
{
  *(_OWORD *)&msg[20] = 0u;
  long long v13 = 0u;
  *(_DWORD *)&msg[4] = 0;
  reply_CFMachPortRef port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x465100000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_CFMachPortRef port = *(_DWORD *)&msg[12];
  }
  uint64_t v7 = mach_msg((mach_msg_header_t *)msg, 3, 0x18u, 0x34u, reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (v7)
    {
      mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
      return v8;
    }
    if (*(_DWORD *)&msg[20] == 71)
    {
      uint64_t v8 = 4294966988;
    }
    else if (*(_DWORD *)&msg[20] == 18101)
    {
      if ((*(_DWORD *)msg & 0x80000000) == 0)
      {
        if (*(_DWORD *)&msg[4] == 44)
        {
          if (!*(_DWORD *)&msg[8])
          {
            uint64_t v8 = *(unsigned int *)&msg[32];
            if (!*(_DWORD *)&msg[32])
            {
              int v11 = DWORD1(v13);
              *a2 = v13;
              *a3 = v11;
              return v8;
            }
            goto LABEL_23;
          }
        }
        else if (*(_DWORD *)&msg[4] == 36)
        {
          if (*(_DWORD *)&msg[8]) {
            BOOL v9 = 1;
          }
          else {
            BOOL v9 = *(_DWORD *)&msg[32] == 0;
          }
          if (v9) {
            uint64_t v8 = 4294966996;
          }
          else {
            uint64_t v8 = *(unsigned int *)&msg[32];
          }
          goto LABEL_23;
        }
      }
      uint64_t v8 = 4294966996;
    }
    else
    {
      uint64_t v8 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy((mach_msg_header_t *)msg);
    return v8;
  }
  mig_put_reply_port(*(mach_port_t *)&msg[12]);
  return v8;
}

uint64_t sub_2B734(int a1, void *a2, _DWORD *a3, _DWORD *a4)
{
  long long v15 = 0u;
  long long v14 = 0u;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  reply_CFMachPortRef port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x465200000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_CFMachPortRef port = *(_DWORD *)&msg[12];
  }
  uint64_t v9 = mach_msg((mach_msg_header_t *)msg, 3, 0x18u, 0x44u, reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
  }
  else
  {
    if (!v9)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v10 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 18102)
      {
        if ((*(_DWORD *)msg & 0x80000000) != 0)
        {
          uint64_t v10 = 4294966996;
          if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 60 && !*(_DWORD *)&msg[8] && BYTE3(v14) == 1)
          {
            int v11 = DWORD1(v14);
            if (DWORD1(v14) == v15)
            {
              uint64_t v10 = 0;
              *a2 = *(void *)&msg[28];
              *a3 = v11;
              *a4 = DWORD1(v15);
              return v10;
            }
          }
        }
        else if (*(_DWORD *)&msg[4] == 36)
        {
          uint64_t v10 = 4294966996;
          if (*(_DWORD *)&msg[32])
          {
            if (*(_DWORD *)&msg[8]) {
              uint64_t v10 = 4294966996;
            }
            else {
              uint64_t v10 = *(unsigned int *)&msg[32];
            }
          }
        }
        else
        {
          uint64_t v10 = 4294966996;
        }
      }
      else
      {
        uint64_t v10 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v10;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
  }
  return v10;
}

uint64_t sub_2B908(int a1, void *a2, _DWORD *a3, _DWORD *a4)
{
  long long v15 = 0u;
  long long v14 = 0u;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  reply_CFMachPortRef port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x465300000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_CFMachPortRef port = *(_DWORD *)&msg[12];
  }
  uint64_t v9 = mach_msg((mach_msg_header_t *)msg, 3, 0x18u, 0x44u, reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
  }
  else
  {
    if (!v9)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v10 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 18103)
      {
        if ((*(_DWORD *)msg & 0x80000000) != 0)
        {
          uint64_t v10 = 4294966996;
          if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 60 && !*(_DWORD *)&msg[8] && BYTE3(v14) == 1)
          {
            int v11 = DWORD1(v14);
            if (DWORD1(v14) == v15)
            {
              uint64_t v10 = 0;
              *a2 = *(void *)&msg[28];
              *a3 = v11;
              *a4 = DWORD1(v15);
              return v10;
            }
          }
        }
        else if (*(_DWORD *)&msg[4] == 36)
        {
          uint64_t v10 = 4294966996;
          if (*(_DWORD *)&msg[32])
          {
            if (*(_DWORD *)&msg[8]) {
              uint64_t v10 = 4294966996;
            }
            else {
              uint64_t v10 = *(unsigned int *)&msg[32];
            }
          }
        }
        else
        {
          uint64_t v10 = 4294966996;
        }
      }
      else
      {
        uint64_t v10 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v10;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
  }
  return v10;
}

uint64_t sub_2BADC(int a1, void *a2, _DWORD *a3, _DWORD *a4)
{
  long long v15 = 0u;
  long long v14 = 0u;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  reply_CFMachPortRef port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x465400000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_CFMachPortRef port = *(_DWORD *)&msg[12];
  }
  uint64_t v9 = mach_msg((mach_msg_header_t *)msg, 3, 0x18u, 0x44u, reply_port, 0, 0);
  uint64_t v10 = v9;
  if ((v9 - 268435458) <= 0xE && ((1 << (v9 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
  }
  else
  {
    if (!v9)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        uint64_t v10 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 18104)
      {
        if ((*(_DWORD *)msg & 0x80000000) != 0)
        {
          uint64_t v10 = 4294966996;
          if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 60 && !*(_DWORD *)&msg[8] && BYTE3(v14) == 1)
          {
            int v11 = DWORD1(v14);
            if (DWORD1(v14) == v15)
            {
              uint64_t v10 = 0;
              *a2 = *(void *)&msg[28];
              *a3 = v11;
              *a4 = DWORD1(v15);
              return v10;
            }
          }
        }
        else if (*(_DWORD *)&msg[4] == 36)
        {
          uint64_t v10 = 4294966996;
          if (*(_DWORD *)&msg[32])
          {
            if (*(_DWORD *)&msg[8]) {
              uint64_t v10 = 4294966996;
            }
            else {
              uint64_t v10 = *(unsigned int *)&msg[32];
            }
          }
        }
        else
        {
          uint64_t v10 = 4294966996;
        }
      }
      else
      {
        uint64_t v10 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v10;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
  }
  return v10;
}

uint64_t sub_2BCB0(mach_port_t a1, uint64_t a2, int a3, int a4, int *a5)
{
  int v13 = 1;
  uint64_t v14 = a2;
  int v15 = 16777472;
  int v16 = a3;
  NDR_record_t v17 = NDR_record;
  int v18 = a3;
  int v19 = a4;
  reply_CFMachPortRef port = mig_get_reply_port();
  *(void *)&msg.msgh_bits = 2147489043;
  msg.msgh_remote_CFMachPortRef port = a1;
  msg.msgh_local_CFMachPortRef port = reply_port;
  *(void *)&msg.msgh_voucher_CFMachPortRef port = 0x465500000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    reply_CFMachPortRef port = msg.msgh_local_port;
  }
  uint64_t v8 = mach_msg(&msg, 3, 0x3Cu, 0x30u, reply_port, 0, 0);
  uint64_t v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (v8)
    {
      mig_dealloc_reply_port(msg.msgh_local_port);
      return v9;
    }
    if (msg.msgh_id == 71)
    {
      uint64_t v9 = 4294966988;
    }
    else if (msg.msgh_id == 18105)
    {
      if ((msg.msgh_bits & 0x80000000) == 0)
      {
        if (msg.msgh_size == 40)
        {
          if (!msg.msgh_remote_port)
          {
            uint64_t v9 = HIDWORD(v14);
            if (!HIDWORD(v14))
            {
              *a5 = v15;
              return v9;
            }
            goto LABEL_23;
          }
        }
        else if (msg.msgh_size == 36)
        {
          if (msg.msgh_remote_port) {
            BOOL v10 = 1;
          }
          else {
            BOOL v10 = HIDWORD(v14) == 0;
          }
          if (v10) {
            uint64_t v9 = 4294966996;
          }
          else {
            uint64_t v9 = HIDWORD(v14);
          }
          goto LABEL_23;
        }
      }
      uint64_t v9 = 4294966996;
    }
    else
    {
      uint64_t v9 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy(&msg);
    return v9;
  }
  mig_put_reply_port(msg.msgh_local_port);
  return v9;
}

uint64_t sub_2BE5C(mach_port_t a1, int a2, _DWORD *a3)
{
  long long v12 = 0u;
  v10.msgh_size_t size = 0;
  NDR_record_t v11 = NDR_record;
  LODWORD(v12) = a2;
  reply_CFMachPortRef port = mig_get_reply_port();
  v10.msgh_remote_CFMachPortRef port = a1;
  v10.msgh_local_CFMachPortRef port = reply_port;
  v10.msgh_bits = 5395;
  *(void *)&v10.msgh_voucher_CFMachPortRef port = 0x465600000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&v10);
    reply_CFMachPortRef port = v10.msgh_local_port;
  }
  uint64_t v6 = mach_msg(&v10, 3, 0x24u, 0x30u, reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (v6)
    {
      mig_dealloc_reply_port(v10.msgh_local_port);
      return v7;
    }
    if (v10.msgh_id == 71)
    {
      uint64_t v7 = 4294966988;
    }
    else if (v10.msgh_id == 18106)
    {
      if ((v10.msgh_bits & 0x80000000) == 0)
      {
        if (v10.msgh_size == 40)
        {
          if (!v10.msgh_remote_port)
          {
            uint64_t v7 = v12;
            if (!v12)
            {
              *a3 = DWORD1(v12);
              return v7;
            }
            goto LABEL_23;
          }
        }
        else if (v10.msgh_size == 36)
        {
          if (v10.msgh_remote_port) {
            BOOL v8 = 1;
          }
          else {
            BOOL v8 = v12 == 0;
          }
          if (v8) {
            uint64_t v7 = 4294966996;
          }
          else {
            uint64_t v7 = v12;
          }
          goto LABEL_23;
        }
      }
      uint64_t v7 = 4294966996;
    }
    else
    {
      uint64_t v7 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy(&v10);
    return v7;
  }
  mig_put_reply_port(v10.msgh_local_port);
  return v7;
}

uint64_t sub_2BFD4(int a1, _DWORD *a2)
{
  memset(&rcv_name_12[4], 0, 28);
  int rcv_name = 0;
  reply_CFMachPortRef port = mig_get_reply_port();
  int rcv_name_4 = a1;
  mach_port_t rcv_name_8 = reply_port;
  int v9 = 5395;
  *(void *)rcv_name_12 = 0x465700000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    reply_CFMachPortRef port = rcv_name_8;
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)&v9, 3, 0x18u, 0x30u, reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (v5)
    {
      mig_dealloc_reply_port(rcv_name_8);
      return v6;
    }
    if (*(_DWORD *)&rcv_name_12[4] == 71)
    {
      uint64_t v6 = 4294966988;
    }
    else if (*(_DWORD *)&rcv_name_12[4] == 18107)
    {
      if ((v9 & 0x80000000) == 0)
      {
        if (rcv_name == 40)
        {
          if (!rcv_name_4)
          {
            uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
            if (!*(_DWORD *)&rcv_name_12[16])
            {
              *a2 = *(_DWORD *)&rcv_name_12[20];
              return v6;
            }
            goto LABEL_23;
          }
        }
        else if (rcv_name == 36)
        {
          if (rcv_name_4) {
            BOOL v7 = 1;
          }
          else {
            BOOL v7 = *(_DWORD *)&rcv_name_12[16] == 0;
          }
          if (v7) {
            uint64_t v6 = 4294966996;
          }
          else {
            uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
          }
          goto LABEL_23;
        }
      }
      uint64_t v6 = 4294966996;
    }
    else
    {
      uint64_t v6 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy((mach_msg_header_t *)&v9);
    return v6;
  }
  mig_put_reply_port(rcv_name_8);
  return v6;
}

uint64_t sub_2C138(int a1, _DWORD *a2)
{
  memset(&rcv_name_12[4], 0, 28);
  int rcv_name = 0;
  reply_CFMachPortRef port = mig_get_reply_port();
  int rcv_name_4 = a1;
  mach_port_t rcv_name_8 = reply_port;
  int v9 = 5395;
  *(void *)rcv_name_12 = 0x465800000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    reply_CFMachPortRef port = rcv_name_8;
  }
  uint64_t v5 = mach_msg((mach_msg_header_t *)&v9, 3, 0x18u, 0x30u, reply_port, 0, 0);
  uint64_t v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (v5)
    {
      mig_dealloc_reply_port(rcv_name_8);
      return v6;
    }
    if (*(_DWORD *)&rcv_name_12[4] == 71)
    {
      uint64_t v6 = 4294966988;
    }
    else if (*(_DWORD *)&rcv_name_12[4] == 18108)
    {
      if ((v9 & 0x80000000) == 0)
      {
        if (rcv_name == 40)
        {
          if (!rcv_name_4)
          {
            uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
            if (!*(_DWORD *)&rcv_name_12[16])
            {
              *a2 = *(_DWORD *)&rcv_name_12[20];
              return v6;
            }
            goto LABEL_23;
          }
        }
        else if (rcv_name == 36)
        {
          if (rcv_name_4) {
            BOOL v7 = 1;
          }
          else {
            BOOL v7 = *(_DWORD *)&rcv_name_12[16] == 0;
          }
          if (v7) {
            uint64_t v6 = 4294966996;
          }
          else {
            uint64_t v6 = *(unsigned int *)&rcv_name_12[16];
          }
          goto LABEL_23;
        }
      }
      uint64_t v6 = 4294966996;
    }
    else
    {
      uint64_t v6 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy((mach_msg_header_t *)&v9);
    return v6;
  }
  mig_put_reply_port(rcv_name_8);
  return v6;
}

uint64_t sub_2C29C(mach_port_t a1, int a2, _DWORD *a3)
{
  long long v12 = 0u;
  v10.msgh_size_t size = 0;
  NDR_record_t v11 = NDR_record;
  LODWORD(v12) = a2;
  reply_CFMachPortRef port = mig_get_reply_port();
  v10.msgh_remote_CFMachPortRef port = a1;
  v10.msgh_local_CFMachPortRef port = reply_port;
  v10.msgh_bits = 5395;
  *(void *)&v10.msgh_voucher_CFMachPortRef port = 0x465900000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&v10);
    reply_CFMachPortRef port = v10.msgh_local_port;
  }
  uint64_t v6 = mach_msg(&v10, 3, 0x24u, 0x30u, reply_port, 0, 0);
  uint64_t v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (v6)
    {
      mig_dealloc_reply_port(v10.msgh_local_port);
      return v7;
    }
    if (v10.msgh_id == 71)
    {
      uint64_t v7 = 4294966988;
    }
    else if (v10.msgh_id == 18109)
    {
      if ((v10.msgh_bits & 0x80000000) == 0)
      {
        if (v10.msgh_size == 40)
        {
          if (!v10.msgh_remote_port)
          {
            uint64_t v7 = v12;
            if (!v12)
            {
              *a3 = DWORD1(v12);
              return v7;
            }
            goto LABEL_23;
          }
        }
        else if (v10.msgh_size == 36)
        {
          if (v10.msgh_remote_port) {
            BOOL v8 = 1;
          }
          else {
            BOOL v8 = v12 == 0;
          }
          if (v8) {
            uint64_t v7 = 4294966996;
          }
          else {
            uint64_t v7 = v12;
          }
          goto LABEL_23;
        }
      }
      uint64_t v7 = 4294966996;
    }
    else
    {
      uint64_t v7 = 4294966995;
    }
LABEL_23:
    mach_msg_destroy(&v10);
    return v7;
  }
  mig_put_reply_port(v10.msgh_local_port);
  return v7;
}

uint64_t sub_2C414(mach_port_t a1, uint64_t a2, int a3, unsigned int a4, unsigned int a5, unsigned int a6, int a7, int a8, int a9, _DWORD *a10, _DWORD *a11)
{
  int v18 = 4;
  v17.msgh_size_t size = 0;
  uint64_t v19 = a2;
  int v20 = 16777472;
  int v21 = a3;
  uint64_t v22 = a4;
  int v23 = 1245184;
  uint64_t v24 = a5;
  int v25 = 1114112;
  uint64_t v26 = a6;
  int v27 = 1245184;
  NDR_record_t v28 = NDR_record;
  int v29 = a3;
  int v30 = a7;
  int v31 = a8;
  int v32 = a9;
  reply_CFMachPortRef port = mig_get_reply_port();
  v17.msgh_remote_CFMachPortRef port = a1;
  v17.msgh_local_CFMachPortRef port = reply_port;
  v17.msgh_bits = -2147478253;
  *(void *)&v17.msgh_voucher_CFMachPortRef port = 0x465D00000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&v17);
    reply_CFMachPortRef port = v17.msgh_local_port;
  }
  uint64_t v13 = mach_msg(&v17, 3, 0x68u, 0x3Cu, reply_port, 0, 0);
  uint64_t v14 = v13;
  if ((v13 - 268435458) <= 0xE && ((1 << (v13 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v17.msgh_local_port);
  }
  else
  {
    if (!v13)
    {
      if (v17.msgh_id == 71)
      {
        uint64_t v14 = 4294966988;
      }
      else if (v17.msgh_id == 18113)
      {
        if ((v17.msgh_bits & 0x80000000) != 0)
        {
          uint64_t v14 = 4294966996;
          if (v18 == 1 && v17.msgh_size == 52 && !v17.msgh_remote_port && HIWORD(v20) << 16 == 1114112)
          {
            uint64_t v14 = 0;
            int v15 = HIDWORD(v22);
            *a10 = v19;
            *a11 = v15;
            return v14;
          }
        }
        else if (v17.msgh_size == 36)
        {
          uint64_t v14 = 4294966996;
          if (HIDWORD(v19))
          {
            if (v17.msgh_remote_port) {
              uint64_t v14 = 4294966996;
            }
            else {
              uint64_t v14 = HIDWORD(v19);
            }
          }
        }
        else
        {
          uint64_t v14 = 4294966996;
        }
      }
      else
      {
        uint64_t v14 = 4294966995;
      }
      mach_msg_destroy(&v17);
      return v14;
    }
    mig_dealloc_reply_port(v17.msgh_local_port);
  }
  return v14;
}

uint64_t sub_2C618(int a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, _OWORD *a5)
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  *(_DWORD *)&msg[4] = 0;
  *(_OWORD *)&msg[20] = 0u;
  reply_CFMachPortRef port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x465F00000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_CFMachPortRef port = *(_DWORD *)&msg[12];
  }
  uint64_t v11 = mach_msg((mach_msg_header_t *)msg, 50331651, 0x18u, 0x84u, reply_port, 0, 0);
  uint64_t v12 = v11;
  if ((v11 - 268435458) <= 0xE && ((1 << (v11 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
    return v12;
  }
  if (v11)
  {
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
    return v12;
  }
  if (*(_DWORD *)&msg[20] == 71)
  {
    uint64_t v12 = 4294966988;
    goto LABEL_27;
  }
  if (*(_DWORD *)&msg[20] != 18115)
  {
    uint64_t v12 = 4294966995;
    goto LABEL_27;
  }
  if ((*(_DWORD *)msg & 0x80000000) == 0)
  {
    if (*(_DWORD *)&msg[4] == 36)
    {
      uint64_t v12 = 4294966996;
      if (*(_DWORD *)&msg[32])
      {
        if (*(_DWORD *)&msg[8]) {
          uint64_t v12 = 4294966996;
        }
        else {
          uint64_t v12 = *(unsigned int *)&msg[32];
        }
      }
    }
    else
    {
      uint64_t v12 = 4294966996;
    }
    goto LABEL_27;
  }
  uint64_t v12 = 4294966996;
  if (*(_DWORD *)&msg[24] != 2
    || *(_DWORD *)&msg[4] != 64
    || *(_DWORD *)&msg[8]
    || WORD1(v17) << 16 != 1114112
    || HIWORD(v17) << 16 != 1114112)
  {
LABEL_27:
    mach_msg_destroy((mach_msg_header_t *)msg);
    return v12;
  }
  if (HIDWORD(v18) || v19 < 0x20) {
    return 4294966987;
  }
  uint64_t v12 = 0;
  int v14 = DWORD1(v17);
  *a2 = *(_DWORD *)&msg[28];
  *a3 = v14;
  *a4 = DWORD2(v18);
  long long v15 = v21;
  *a5 = v20;
  a5[1] = v15;
  return v12;
}

uint64_t sub_2C808(mach_port_t a1, int a2, void *a3, _DWORD *a4, _DWORD *a5, _OWORD *a6)
{
  memset(v21, 0, sizeof(v21));
  long long v20 = 0u;
  long long v19 = 0u;
  msg.msgh_size_t size = 0;
  *(NDR_record_t *)long long v18 = NDR_record;
  *(_DWORD *)&v18[8] = a2;
  reply_CFMachPortRef port = mig_get_reply_port();
  msg.msgh_remote_CFMachPortRef port = a1;
  msg.msgh_local_CFMachPortRef port = reply_port;
  msg.msgh_bits = 5395;
  *(void *)&msg.msgh_voucher_CFMachPortRef port = 0x466000000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set(&msg);
    reply_CFMachPortRef port = msg.msgh_local_port;
  }
  uint64_t v12 = mach_msg(&msg, 50331651, 0x24u, 0x80u, reply_port, 0, 0);
  uint64_t v13 = v12;
  if ((v12 - 268435458) <= 0xE && ((1 << (v12 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(msg.msgh_local_port);
    return v13;
  }
  if (v12)
  {
    mig_dealloc_reply_port(msg.msgh_local_port);
    return v13;
  }
  if (msg.msgh_id == 71)
  {
    uint64_t v13 = 4294966988;
    goto LABEL_27;
  }
  if (msg.msgh_id != 18116)
  {
    uint64_t v13 = 4294966995;
    goto LABEL_27;
  }
  if ((msg.msgh_bits & 0x80000000) == 0)
  {
    if (msg.msgh_size == 36)
    {
      uint64_t v13 = 4294966996;
      if (*(_DWORD *)&v18[8])
      {
        if (msg.msgh_remote_port) {
          uint64_t v13 = 4294966996;
        }
        else {
          uint64_t v13 = *(unsigned int *)&v18[8];
        }
      }
    }
    else
    {
      uint64_t v13 = 4294966996;
    }
    goto LABEL_27;
  }
  uint64_t v13 = 4294966996;
  if (*(_DWORD *)v18 != 1
    || msg.msgh_size != 60
    || msg.msgh_remote_port
    || BYTE3(v19) != 1
    || (int v14 = DWORD1(v19), DWORD1(v19) != v20))
  {
LABEL_27:
    mach_msg_destroy(&msg);
    return v13;
  }
  if (DWORD2(v20) || HIDWORD(v20) < 0x20) {
    return 4294966987;
  }
  uint64_t v13 = 0;
  *a3 = *(void *)&v18[4];
  *a4 = v14;
  *a5 = DWORD1(v20);
  long long v16 = *(_OWORD *)&v21[28];
  *a6 = *(_OWORD *)&v21[12];
  a6[1] = v16;
  return v13;
}

uint64_t sub_2CA40(int a1, _DWORD *a2, _OWORD *a3)
{
  uint64_t v18 = 0;
  long long v17 = 0u;
  long long v16 = 0u;
  long long v15 = 0u;
  long long v14 = 0u;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  reply_CFMachPortRef port = mig_get_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = reply_port;
  *(_DWORD *)mach_msg_header_t msg = 5395;
  *(void *)&msg[16] = 0x466100000000;
  if (&_voucher_mach_msg_set)
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    reply_CFMachPortRef port = *(_DWORD *)&msg[12];
  }
  uint64_t v7 = mach_msg((mach_msg_header_t *)msg, 50331651, 0x18u, 0x6Cu, reply_port, 0, 0);
  uint64_t v8 = v7;
  if ((v7 - 268435458) <= 0xE && ((1 << (v7 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&msg[12]);
    return v8;
  }
  if (v7)
  {
    mig_dealloc_reply_port(*(mach_port_t *)&msg[12]);
    return v8;
  }
  if (*(_DWORD *)&msg[20] == 71)
  {
    uint64_t v8 = 4294966988;
LABEL_23:
    mach_msg_destroy((mach_msg_header_t *)msg);
    return v8;
  }
  if (*(_DWORD *)&msg[20] != 18117)
  {
    uint64_t v8 = 4294966995;
    goto LABEL_23;
  }
  if ((*(_DWORD *)msg & 0x80000000) != 0) {
    goto LABEL_22;
  }
  if (*(_DWORD *)&msg[4] != 40)
  {
    if (*(_DWORD *)&msg[4] == 36)
    {
      if (*(_DWORD *)&msg[8]) {
        BOOL v9 = 1;
      }
      else {
        BOOL v9 = *(_DWORD *)&msg[32] == 0;
      }
      if (v9) {
        uint64_t v8 = 4294966996;
      }
      else {
        uint64_t v8 = *(unsigned int *)&msg[32];
      }
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  if (*(_DWORD *)&msg[8])
  {
LABEL_22:
    uint64_t v8 = 4294966996;
    goto LABEL_23;
  }
  uint64_t v8 = *(unsigned int *)&msg[32];
  if (*(_DWORD *)&msg[32]) {
    goto LABEL_23;
  }
  uint64_t v11 = &msg[(*(unsigned int *)&msg[4] + 3) & 0x1FFFFFFFCLL];
  if (*(_DWORD *)v11 || *((_DWORD *)v11 + 1) < 0x20u) {
    return 4294966987;
  }
  uint64_t v8 = 0;
  *a2 = v14;
  long long v12 = *(_OWORD *)(v11 + 36);
  *a3 = *(_OWORD *)(v11 + 20);
  a3[1] = v12;
  return v8;
}

uint64_t sub_2CC00(uint64_t a1)
{
  int v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 18022) >= 0xFFFFFFEA) {
    return (uint64_t)*(&_pppcontroller_subsystem + 5 * (v1 - 18000) + 5);
  }
  else {
    return 0;
  }
}

uint64_t sub_2CC3C(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 4 || *(_DWORD *)(result + 4) != 92)
  {
    int v3 = -304;
    goto LABEL_13;
  }
  if (*(unsigned char *)(result + 39) != 1
    || *(unsigned __int16 *)(result + 54) << 16 != 1114112
    || *(unsigned __int16 *)(result + 66) << 16 != 1114112
    || *(unsigned __int16 *)(result + 78) << 16 != 1114112
    || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 88))
  {
    int v3 = -300;
    goto LABEL_13;
  }
  if (*(_DWORD *)(result + 92) || *(_DWORD *)(result + 96) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_13:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_14;
  }
  uint64_t v4 = (mach_port_name_t *)(a2 + 28);
  *(void *)(a2 + 32) = 0x11000000000000;
  int v5 = *(_DWORD *)(result + 12);
  uint64_t v6 = *(void *)(result + 28);
  uint64_t v7 = *(unsigned int *)(result + 40);
  mach_port_name_t v8 = *(_DWORD *)(result + 44);
  mach_port_name_t v9 = *(_DWORD *)(result + 56);
  int v10 = *(_DWORD *)(result + 68);
  long long v11 = *(_OWORD *)(result + 128);
  v12[0] = *(_OWORD *)(result + 112);
  v12[1] = v11;
  double result = sub_18838(v5, v6, v7, v8, v9, v10, v4, (int *)(a2 + 48), v12);
  if (!result)
  {
    *(NDR_record_t *)(a2 + 40) = NDR_record;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 52;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_14:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

_DWORD *sub_2CD8C(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }
  else
  {
    double result = (_DWORD *)sub_1891C(result[3], (_DWORD *)(a2 + 36), (int *)(a2 + 40));
    *(_DWORD *)(a2 + 32) = result;
    NDR_record_t v3 = NDR_record;
    if (!result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 44;
      return result;
    }
  }
  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

_DWORD *sub_2CE0C(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }
  *(_DWORD *)(a2 + 36) = 16777473;
  double result = (_DWORD *)sub_18980(result[3], (void *)(a2 + 28), (int *)(a2 + 52), (int *)(a2 + 56));
  if (result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_6:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }
  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 60;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

_DWORD *sub_2CEB8(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }
  *(_DWORD *)(a2 + 36) = 16777473;
  double result = (_DWORD *)sub_18A20(result[3], (void *)(a2 + 28), (int *)(a2 + 52), (int *)(a2 + 56));
  if (result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_6:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }
  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 60;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

_DWORD *sub_2CF64(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }
  *(_DWORD *)(a2 + 36) = 16777473;
  double result = (_DWORD *)sub_18AC0(result[3], (void *)(a2 + 28), (int *)(a2 + 52), (int *)(a2 + 56));
  if (result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_6:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }
  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 60;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t sub_2D010(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 60)
  {
    int v5 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v5;
    NDR_record_t v4 = NDR_record;
    goto LABEL_10;
  }
  if (*(unsigned char *)(result + 39) != 1 || (int v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 52)))
  {
    int v5 = -300;
    goto LABEL_9;
  }
  double result = sub_18B64(*(_DWORD *)(result + 12), *(void *)(result + 28), v3, *(_DWORD *)(result + 56), (int *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v4 = NDR_record;
  if (!result)
  {
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_10:
  *(NDR_record_t *)(a2 + 24) = v4;
  return result;
}

_DWORD *sub_2D0C8(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }
  else
  {
    double result = (_DWORD *)sub_18C8C(result[3], result[8], (int *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = result;
    NDR_record_t v3 = NDR_record;
    if (!result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }
  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

_DWORD *sub_2D14C(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }
  else
  {
    double result = (_DWORD *)sub_18D30(result[3], (int *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = result;
    NDR_record_t v3 = NDR_record;
    if (!result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }
  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

_DWORD *sub_2D1C8(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }
  else
  {
    double result = (_DWORD *)sub_18D84(result[3], (int *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = result;
    NDR_record_t v3 = NDR_record;
    if (!result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }
  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

_DWORD *sub_2D244(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    NDR_record_t v3 = NDR_record;
  }
  else
  {
    double result = (_DWORD *)sub_18DD8(result[3], result[8], (int *)(a2 + 36));
    *(_DWORD *)(a2 + 32) = result;
    NDR_record_t v3 = NDR_record;
    if (!result)
    {
      *(NDR_record_t *)(a2 + 24) = NDR_record;
      *(_DWORD *)(a2 + 4) = 40;
      return result;
    }
  }
  *(NDR_record_t *)(a2 + 24) = v3;
  return result;
}

uint64_t sub_2D2C8(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 4 || *(_DWORD *)(result + 4) != 104)
  {
    int v3 = -304;
    goto LABEL_13;
  }
  if (*(unsigned char *)(result + 39) != 1
    || *(unsigned __int16 *)(result + 54) << 16 != 1114112
    || *(unsigned __int16 *)(result + 66) << 16 != 1114112
    || *(unsigned __int16 *)(result + 78) << 16 != 1114112
    || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 88))
  {
    int v3 = -300;
    goto LABEL_13;
  }
  if (*(_DWORD *)(result + 104) || *(_DWORD *)(result + 108) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_13:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_14;
  }
  *(void *)(a2 + 32) = 0x11000000000000;
  int v4 = *(_DWORD *)(result + 12);
  uint64_t v5 = *(void *)(result + 28);
  uint64_t v6 = *(unsigned int *)(result + 40);
  mach_port_name_t v7 = *(_DWORD *)(result + 44);
  mach_port_name_t v8 = *(_DWORD *)(result + 56);
  int v9 = *(_DWORD *)(result + 68);
  int v10 = *(_DWORD *)(result + 92);
  int v11 = *(_DWORD *)(result + 96);
  int v12 = *(_DWORD *)(result + 100);
  long long v13 = *(_OWORD *)(result + 140);
  v14[0] = *(_OWORD *)(result + 124);
  v14[1] = v13;
  double result = sub_18224(v4, v5, v6, v7, v8, v9, v10, v11, v12, (mach_port_name_t *)(a2 + 28), (int *)(a2 + 48), v14);
  if (!result)
  {
    *(NDR_record_t *)(a2 + 40) = NDR_record;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 52;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_14:
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  return result;
}

uint64_t sub_2D428(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 24)
  {
    int v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 24) || *(_DWORD *)(result + 28) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
LABEL_8:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }
  *(void *)(a2 + 32) = 0x13000000000000;
  *(void *)(a2 + 44) = 0x13000000000000;
  double result = sub_18E2C(*(unsigned int *)(result + 12), (_DWORD *)(a2 + 28), (_DWORD *)(a2 + 40), (_DWORD *)(a2 + 60), (_OWORD *)(result + 44));
  if (result)
  {
    *(_DWORD *)(a2 + 32) = result;
    goto LABEL_8;
  }
  *(NDR_record_t *)(a2 + 52) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 64;
  *(_DWORD *)(a2 + 24) = 2;
  return result;
}

uint64_t sub_2D4F4(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 36) || *(_DWORD *)(result + 40) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
LABEL_8:
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    return result;
  }
  *(_DWORD *)(a2 + 36) = 16777473;
  double result = sub_18ED0(*(unsigned int *)(result + 12), *(_DWORD *)(result + 32), (void *)(a2 + 28), (int *)(a2 + 52), (int *)(a2 + 56), (_OWORD *)(result + 56));
  if (result)
  {
    *(_DWORD *)(a2 + 32) = result;
    goto LABEL_8;
  }
  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(NDR_record_t *)(a2 + 44) = NDR_record;
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 60;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t sub_2D5CC(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 24)
  {
    int v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 24) || *(_DWORD *)(result + 28) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    NDR_record_t v4 = NDR_record;
LABEL_8:
    *(NDR_record_t *)(a2 + 24) = v4;
    return result;
  }
  double result = sub_18FB8(*(unsigned int *)(result + 12), (int *)(a2 + 36), (_OWORD *)(result + 44));
  *(_DWORD *)(a2 + 32) = result;
  NDR_record_t v4 = NDR_record;
  if (result) {
    goto LABEL_8;
  }
  *(NDR_record_t *)(a2 + 24) = NDR_record;
  *(_DWORD *)(a2 + 4) = 40;
  return result;
}

uint64_t sub_2D66C(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  int v4 = a1[5];
  if ((v4 - 18022) >= 0xFFFFFFEA
    && (uint64_t v5 = (void (*)(void))*(&_pppcontroller_subsystem + 5 * (v4 - 18000) + 5)) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    uint64_t result = 0;
    *(NDR_record_t *)(a2 + 24) = NDR_record;
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return _CFAllocatorAllocate(allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return _CFArrayContainsValue(theArray, range, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreate(allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return _CFArrayCreateCopy(allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return _CFArrayCreateMutable(allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return _CFArrayCreateMutableCopy(allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return _CFArrayGetTypeID();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFURLRef CFBundleCopyBuiltInPlugInsURL(CFBundleRef bundle)
{
  return _CFBundleCopyBuiltInPlugInsURL(bundle);
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return _CFBundleCopyBundleURL(bundle);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return _CFBundleCopyResourceURL(bundle, resourceName, resourceType, subDirName);
}

CFURLRef CFBundleCopyResourcesDirectoryURL(CFBundleRef bundle)
{
  return _CFBundleCopyResourcesDirectoryURL(bundle);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return _CFBundleCreate(allocator, bundleURL);
}

CFCharacterSetRef CFCharacterSetCreateWithCharactersInString(CFAllocatorRef alloc, CFStringRef theString)
{
  return _CFCharacterSetCreateWithCharactersInString(alloc, theString);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return _CFDataCreate(allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return _CFDataCreateMutable(allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return _CFDataGetMutableBytePtr(theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
}

CFTypeID CFDateGetTypeID(void)
{
  return _CFDateGetTypeID();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryContainsKey(theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreate(allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return _CFDictionaryCreateMutable(allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return _CFDictionaryCreateMutableCopy(allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return _CFDictionaryGetCount(theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return _CFDictionaryGetTypeID();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return _CFMachPortCreateRunLoopSource(allocator, port, order);
}

mach_port_t CFMachPortGetPort(CFMachPortRef port)
{
  return _CFMachPortGetPort(port);
}

void CFMachPortInvalidate(CFMachPortRef port)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

CFPropertyListRef CFPropertyListCreateFromXMLData(CFAllocatorRef allocator, CFDataRef xmlData, CFOptionFlags mutabilityOption, CFStringRef *errorString)
{
  return _CFPropertyListCreateFromXMLData(allocator, xmlData, mutabilityOption, errorString);
}

CFDataRef CFPropertyListCreateXMLData(CFAllocatorRef allocator, CFPropertyListRef propertyList)
{
  return _CFPropertyListCreateXMLData(allocator, propertyList);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopRemoveTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
}

void CFRunLoopRun(void)
{
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return _CFRunLoopSourceCreate(allocator, order, context);
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
}

CFRunLoopTimerRef CFRunLoopTimerCreate(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval, CFOptionFlags flags, CFIndex order, CFRunLoopTimerCallBack callout, CFRunLoopTimerContext *context)
{
  return _CFRunLoopTimerCreate(allocator, fireDate, interval, flags, order, callout, context);
}

void CFRunLoopTimerInvalidate(CFRunLoopTimerRef timer)
{
}

void CFRunLoopTimerSetNextFireDate(CFRunLoopTimerRef timer, CFAbsoluteTime fireDate)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

CFRunLoopSourceRef CFSocketCreateRunLoopSource(CFAllocatorRef allocator, CFSocketRef s, CFIndex order)
{
  return _CFSocketCreateRunLoopSource(allocator, s, order);
}

CFSocketRef CFSocketCreateWithNative(CFAllocatorRef allocator, CFSocketNativeHandle sock, CFOptionFlags callBackTypes, CFSocketCallBack callout, const CFSocketContext *context)
{
  return _CFSocketCreateWithNative(allocator, sock, callBackTypes, callout, context);
}

CFSocketNativeHandle CFSocketGetNative(CFSocketRef s)
{
  return _CFSocketGetNative(s);
}

void CFSocketInvalidate(CFSocketRef s)
{
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return _CFStringCreateArrayBySeparatingStrings(alloc, theString, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return _CFStringCreateCopy(alloc, theString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return _CFStringCreateMutable(alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return _CFStringCreateMutableCopy(alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return _CFStringCreateWithBytes(alloc, bytes, numBytes, encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return _CFStringCreateWithCString(alloc, cStr, encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return _CFStringCreateWithCStringNoCopy(alloc, cStr, encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return _CFStringCreateWithFormat(alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return _CFStringCreateWithSubstring(alloc, str, range);
}

void CFStringDelete(CFMutableStringRef theString, CFRange range)
{
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFRange v5 = _CFStringFind(theString, stringToFind, compareOptions);
  CFIndex length = v5.length;
  CFIndex location = v5.location;
  result.CFIndex length = length;
  result.CFIndex location = location;
  return result;
}

Boolean CFStringFindCharacterFromSet(CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return _CFStringFindCharacterFromSet(theString, theSet, rangeToSearch, searchOptions, result);
}

Boolean CFStringFindWithOptions(CFStringRef theString, CFStringRef stringToFind, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return _CFStringFindWithOptions(theString, stringToFind, rangeToSearch, searchOptions, result);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return _CFStringGetBytes(theString, range, encoding, lossByte, isExternalRepresentation, buffer, maxBufLen, usedBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return _CFStringGetCString(theString, buffer, bufferSize, encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return _CFStringGetCStringPtr(theString, encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return _CFStringGetLength(theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return _CFStringGetTypeID();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return _CFStringHasPrefix(theString, prefix);
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return _CFStringHasSuffix(theString, suffix);
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return _CFURLCopyAbsoluteURL(relativeURL);
}

CFStringRef CFURLCopyHostName(CFURLRef anURL)
{
  return _CFURLCopyHostName(anURL);
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return _CFURLCopyPath(anURL);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return _CFURLCreateFromFileSystemRepresentation(allocator, buffer, bufLen, isDirectory);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return _CFURLCreateWithString(allocator, URLString, baseURL);
}

CFRange CFURLGetByteRangeForComponent(CFURLRef url, CFURLComponentType component, CFRange *rangeIncludingSeparators)
{
  CFRange v5 = _CFURLGetByteRangeForComponent(url, component, rangeIncludingSeparators);
  CFIndex length = v5.length;
  CFIndex location = v5.location;
  result.CFIndex length = length;
  result.CFIndex location = location;
  return result;
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return _CFUserNotificationCancel(userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return _CFUserNotificationCreateRunLoopSource(allocator, userNotification, callout, order);
}

CFStringRef CFUserNotificationGetResponseValue(CFUserNotificationRef userNotification, CFStringRef key, CFIndex idx)
{
  return _CFUserNotificationGetResponseValue(userNotification, key, idx);
}

SInt32 CFUserNotificationUpdate(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags flags, CFDictionaryRef dictionary)
{
  return _CFUserNotificationUpdate(userNotification, timeout, flags, dictionary);
}

DNSServiceErrorType DNSServiceCreateConnection(DNSServiceRef *sdRef)
{
  return _DNSServiceCreateConnection(sdRef);
}

DNSServiceErrorType DNSServiceNATPortMappingCreate(DNSServiceRef *sdRef, DNSServiceFlags flags, uint32_t interfaceIndex, DNSServiceProtocol protocol, uint16_t internalPort, uint16_t externalPort, uint32_t ttl, DNSServiceNATPortMappingReply callBack, void *context)
{
  return _DNSServiceNATPortMappingCreate(sdRef, flags, interfaceIndex, protocol, internalPort, externalPort, ttl, callBack, context);
}

void DNSServiceRefDeallocate(DNSServiceRef sdRef)
{
}

DNSServiceErrorType DNSServiceSetDispatchQueue(DNSServiceRef service, dispatch_queue_t queue)
{
  return _DNSServiceSetDispatchQueue(service, queue);
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return _IOAllowPowerChange(kernelPort, notificationID);
}

IOReturn IOCancelPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return _IOCancelPowerChange(kernelPort, notificationID);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return _IONotificationPortGetRunLoopSource(notify);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return _IORegisterForSystemPower(refcon, thePortRef, callback, notifier);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperties(entry, properties, allocator, options);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntrySearchCFProperty(entry, plane, key, allocator, options);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return _IOServiceGetMatchingServices(mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

CFArrayRef SCDynamicStoreCopyKeyList(SCDynamicStoreRef store, CFStringRef pattern)
{
  return _SCDynamicStoreCopyKeyList(store, pattern);
}

CFDictionaryRef SCDynamicStoreCopyMultiple(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return _SCDynamicStoreCopyMultiple(store, keys, patterns);
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return _SCDynamicStoreCopyValue(store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return _SCDynamicStoreCreate(allocator, name, callout, context);
}

CFRunLoopSourceRef SCDynamicStoreCreateRunLoopSource(CFAllocatorRef allocator, SCDynamicStoreRef store, CFIndex order)
{
  return _SCDynamicStoreCreateRunLoopSource(allocator, store, order);
}

SCDynamicStoreRef SCDynamicStoreCreateWithOptions(CFAllocatorRef allocator, CFStringRef name, CFDictionaryRef storeOptions, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return _SCDynamicStoreCreateWithOptions(allocator, name, storeOptions, callout, context);
}

CFStringRef SCDynamicStoreKeyCreate(CFAllocatorRef allocator, CFStringRef fmt, ...)
{
  return _SCDynamicStoreKeyCreate(allocator, fmt);
}

CFStringRef SCDynamicStoreKeyCreateNetworkGlobalEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef entity)
{
  return _SCDynamicStoreKeyCreateNetworkGlobalEntity(allocator, domain, entity);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterfaceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef ifname, CFStringRef entity)
{
  return _SCDynamicStoreKeyCreateNetworkInterfaceEntity(allocator, domain, ifname, entity);
}

CFStringRef SCDynamicStoreKeyCreateNetworkServiceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef serviceID, CFStringRef entity)
{
  return _SCDynamicStoreKeyCreateNetworkServiceEntity(allocator, domain, serviceID, entity);
}

Boolean SCDynamicStoreRemoveValue(SCDynamicStoreRef store, CFStringRef key)
{
  return _SCDynamicStoreRemoveValue(store, key);
}

Boolean SCDynamicStoreSetMultiple(SCDynamicStoreRef store, CFDictionaryRef keysToSet, CFArrayRef keysToRemove, CFArrayRef keysToNotify)
{
  return _SCDynamicStoreSetMultiple(store, keysToSet, keysToRemove, keysToNotify);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return _SCDynamicStoreSetNotificationKeys(store, keys, patterns);
}

Boolean SCDynamicStoreSetValue(SCDynamicStoreRef store, CFStringRef key, CFPropertyListRef value)
{
  return _SCDynamicStoreSetValue(store, key, value);
}

int SCError(void)
{
  return _SCError();
}

const char *__cdecl SCErrorString(int status)
{
  return _SCErrorString(status);
}

uint64_t SCLog()
{
  return _SCLog();
}

uint64_t SCNetworkInterfaceCheckPassword()
{
  return _SCNetworkInterfaceCheckPassword();
}

CFStringRef SCNetworkInterfaceGetBSDName(SCNetworkInterfaceRef interface)
{
  return _SCNetworkInterfaceGetBSDName(interface);
}

CFDictionaryRef SCNetworkInterfaceGetConfiguration(SCNetworkInterfaceRef interface)
{
  return _SCNetworkInterfaceGetConfiguration(interface);
}

SCNetworkInterfaceRef SCNetworkInterfaceGetInterface(SCNetworkInterfaceRef interface)
{
  return _SCNetworkInterfaceGetInterface(interface);
}

CFStringRef SCNetworkInterfaceGetInterfaceType(SCNetworkInterfaceRef interface)
{
  return _SCNetworkInterfaceGetInterfaceType(interface);
}

uint64_t SCNetworkInterfaceRemovePassword()
{
  return _SCNetworkInterfaceRemovePassword();
}

Boolean SCNetworkInterfaceSetConfiguration(SCNetworkInterfaceRef interface, CFDictionaryRef config)
{
  return _SCNetworkInterfaceSetConfiguration(interface, config);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return _SCNetworkReachabilityCreateWithAddress(allocator, address);
}

uint64_t SCNetworkReachabilityCreateWithOptions()
{
  return _SCNetworkReachabilityCreateWithOptions();
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return _SCNetworkReachabilityGetFlags(target, flags);
}

uint64_t SCNetworkReachabilityGetInterfaceIndex()
{
  return _SCNetworkReachabilityGetInterfaceIndex();
}

Boolean SCNetworkReachabilitySetCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityCallBack callout, SCNetworkReachabilityContext *context)
{
  return _SCNetworkReachabilitySetCallback(target, callout, context);
}

Boolean SCNetworkReachabilitySetDispatchQueue(SCNetworkReachabilityRef target, dispatch_queue_t queue)
{
  return _SCNetworkReachabilitySetDispatchQueue(target, queue);
}

SCNetworkServiceRef SCNetworkServiceCopy(SCPreferencesRef prefs, CFStringRef serviceID)
{
  return _SCNetworkServiceCopy(prefs, serviceID);
}

SCNetworkInterfaceRef SCNetworkServiceGetInterface(SCNetworkServiceRef service)
{
  return _SCNetworkServiceGetInterface(service);
}

uint64_t SCNetworkServiceSetPrimaryRank()
{
  return _SCNetworkServiceSetPrimaryRank();
}

Boolean SCPreferencesApplyChanges(SCPreferencesRef prefs)
{
  return _SCPreferencesApplyChanges(prefs);
}

Boolean SCPreferencesCommitChanges(SCPreferencesRef prefs)
{
  return _SCPreferencesCommitChanges(prefs);
}

CFArrayRef SCPreferencesCopyKeyList(SCPreferencesRef prefs)
{
  return _SCPreferencesCopyKeyList(prefs);
}

SCPreferencesRef SCPreferencesCreate(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID)
{
  return _SCPreferencesCreate(allocator, name, prefsID);
}

CFPropertyListRef SCPreferencesGetValue(SCPreferencesRef prefs, CFStringRef key)
{
  return _SCPreferencesGetValue(prefs, key);
}

Boolean SCPreferencesLock(SCPreferencesRef prefs, Boolean wait)
{
  return _SCPreferencesLock(prefs, wait);
}

Boolean SCPreferencesRemoveValue(SCPreferencesRef prefs, CFStringRef key)
{
  return _SCPreferencesRemoveValue(prefs, key);
}

Boolean SCPreferencesScheduleWithRunLoop(SCPreferencesRef prefs, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return _SCPreferencesScheduleWithRunLoop(prefs, runLoop, runLoopMode);
}

Boolean SCPreferencesSetCallback(SCPreferencesRef prefs, SCPreferencesCallBack callout, SCPreferencesContext *context)
{
  return _SCPreferencesSetCallback(prefs, callout, context);
}

Boolean SCPreferencesSetValue(SCPreferencesRef prefs, CFStringRef key, CFPropertyListRef value)
{
  return _SCPreferencesSetValue(prefs, key, value);
}

void SCPreferencesSynchronize(SCPreferencesRef prefs)
{
}

Boolean SCPreferencesUnlock(SCPreferencesRef prefs)
{
  return _SCPreferencesUnlock(prefs);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
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

uint64_t _CFCopySystemVersionDictionary()
{
  return __CFCopySystemVersionDictionary();
}

uint64_t _CTServerConnectionAddToRunLoop()
{
  return __CTServerConnectionAddToRunLoop();
}

uint64_t _CTServerConnectionCreate()
{
  return __CTServerConnectionCreate();
}

uint64_t _CTServerConnectionGetPacketContextActive()
{
  return __CTServerConnectionGetPacketContextActive();
}

uint64_t _CTServerConnectionRegisterForNotification()
{
  return __CTServerConnectionRegisterForNotification();
}

uint64_t _CTServerConnectionSetPacketContextActiveByServiceType()
{
  return __CTServerConnectionSetPacketContextActiveByServiceType();
}

uint64_t _SCNetworkInterfaceCopySlashDevPath()
{
  return __SCNetworkInterfaceCopySlashDevPath();
}

uint64_t _SCNetworkInterfaceCreateWithEntity()
{
  return __SCNetworkInterfaceCreateWithEntity();
}

uint64_t _SCNetworkServiceCopyActive()
{
  return __SCNetworkServiceCopyActive();
}

uint64_t _SCUnserialize()
{
  return __SCUnserialize();
}

uint64_t _SCUnserializeString()
{
  return __SCUnserializeString();
}

uint64_t _SC_CFMachPortCreateWithPort()
{
  return __SC_CFMachPortCreateWithPort();
}

uint64_t _SC_syslog_os_log_mapping()
{
  return __SC_syslog_os_log_mapping();
}

int *__error(void)
{
  return ___error();
}

uint64_t __ipsec_set_strerror()
{
  return ___ipsec_set_strerror();
}

uint64_t __memcpy_chk()
{
  return ___memcpy_chk();
}

uint64_t __memmove_chk()
{
  return ___memmove_chk();
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return ___sprintf_chk(a1, a2, a3, a4);
}

uint64_t __strlcat_chk()
{
  return ___strlcat_chk();
}

uint64_t __strlcpy_chk()
{
  return ___strlcpy_chk();
}

uint64_t __strncpy_chk()
{
  return ___strncpy_chk();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return _accept(a1, a2, a3);
}

char *__cdecl addr2ascii(int a1, const void *a2, int a3, char *a4)
{
  return _addr2ascii(a1, a2, a3, a4);
}

au_asid_t audit_session_join(mach_port_name_t port)
{
  return _audit_session_join(port);
}

void audit_token_to_au32(audit_token_t *atoken, uid_t *auidp, uid_t *euidp, gid_t *egidp, uid_t *ruidp, gid_t *rgidp, pid_t *pidp, au_asid_t *asidp, au_tid_t *tidp)
{
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return _bind(a1, a2, a3);
}

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return _bootstrap_check_in(bp, service_name, sp);
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return _bootstrap_look_up(bp, service_name, sp);
}

const char *__cdecl bootstrap_strerror(kern_return_t r)
{
  return _bootstrap_strerror(r);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return _close(a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return _connect(a1, a2, a3);
}

double difftime(time_t a1, time_t a2)
{
  return _difftime(a1, a2);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_get_current_queue(void)
{
  return _dispatch_get_current_queue();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
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

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

int dup2(int a1, int a2)
{
  return _dup2(a1, a2);
}

int fclose(FILE *a1)
{
  return _fclose(a1);
}

int fcntl(int a1, int a2, ...)
{
  return _fcntl(a1, a2);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return _fopen(__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return _fprintf(a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return _fputs(a1, a2);
}

void free(void *a1)
{
}

void freeaddrinfo(addrinfo *a1)
{
}

void freeifaddrs(ifaddrs *a1)
{
}

int fscanf(FILE *a1, const char *a2, ...)
{
  return _fscanf(a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return _fwrite(__ptr, __size, __nitems, __stream);
}

const char *__cdecl gai_strerror(int a1)
{
  return _gai_strerror(a1);
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  return _getaddrinfo(a1, a2, a3, a4);
}

uint64_t getaddrinfo_async_cancel()
{
  return _getaddrinfo_async_cancel();
}

uint64_t getaddrinfo_async_start()
{
  return _getaddrinfo_async_start();
}

int getdtablesize(void)
{
  return _getdtablesize();
}

gid_t getegid(void)
{
  return _getegid();
}

uid_t geteuid(void)
{
  return _geteuid();
}

int getifaddrs(ifaddrs **a1)
{
  return _getifaddrs(a1);
}

int getnameinfo(const sockaddr *a1, socklen_t a2, char *a3, socklen_t a4, char *a5, socklen_t a6, int a7)
{
  return _getnameinfo(a1, a2, a3, a4, a5, a6, a7);
}

pid_t getpid(void)
{
  return _getpid();
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return _getsockname(a1, a2, a3);
}

int getsockopt(int a1, int a2, int a3, void *a4, socklen_t *a5)
{
  return _getsockopt(a1, a2, a3, a4, a5);
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

char *__cdecl if_indextoname(unsigned int a1, char *a2)
{
  return _if_indextoname(a1, a2);
}

unsigned int if_nametoindex(const char *a1)
{
  return _if_nametoindex(a1);
}

in_addr_t inet_addr(const char *a1)
{
  return _inet_addr(a1);
}

int inet_aton(const char *a1, in_addr *a2)
{
  return _inet_aton(a1, a2);
}

in_addr_t inet_network(const char *a1)
{
  return _inet_network(a1);
}

char *__cdecl inet_ntoa(in_addr a1)
{
  return _inet_ntoa(a1);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return _inet_ntop(a1, a2, a3, a4);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return _inet_pton(a1, a2, a3);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return _ioctl(a1, a2);
}

caddr_t ipsec_set_policy(char *a1, int a2)
{
  return _ipsec_set_policy(a1, a2);
}

int kill(pid_t a1, int a2)
{
  return _kill(a1, a2);
}

int listen(int a1, int a2)
{
  return _listen(a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return _mach_error_string(error_value);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return _mach_msg(msg, option, send_size, rcv_size, rcv_name, timeout, notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return _mach_port_allocate(task, right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return _mach_port_deallocate(task, name);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return _mach_port_insert_right(task, name, poly, polyPoly);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return _mach_port_mod_refs(task, name, right, delta);
}

kern_return_t mach_port_request_notification(ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_t notify, mach_msg_type_name_t notifyPoly, mach_port_t *previous)
{
  return _mach_port_request_notification(task, name, msgid, sync, notify, notifyPoly, previous);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
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

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return _memset(__b, __c, __len);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
}

mach_port_t mig_get_reply_port(void)
{
  return _mig_get_reply_port();
}

void mig_put_reply_port(mach_port_t reply_port)
{
}

int mkdir(const char *a1, mode_t a2)
{
  return _mkdir(a1, a2);
}

uint64_t ne_log_obj()
{
  return _ne_log_obj();
}

uint64_t ne_session_use_as_system_vpn()
{
  return _ne_session_use_as_system_vpn();
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
}

uint32_t notify_register_mach_port(const char *name, mach_port_t *notify_port, int flags, int *out_token)
{
  return _notify_register_mach_port(name, notify_port, flags, out_token);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return _notify_set_state(token, state64);
}

uint64_t nw_nat64_copy_prefixes()
{
  return _nw_nat64_copy_prefixes();
}

uint64_t nw_nat64_extract_v4()
{
  return _nw_nat64_extract_v4();
}

uint64_t nw_nat64_synthesize_v6()
{
  return _nw_nat64_synthesize_v6();
}

uint64_t nwi_ifstate_get_flags()
{
  return _nwi_ifstate_get_flags();
}

uint64_t nwi_ifstate_get_ifname()
{
  return _nwi_ifstate_get_ifname();
}

uint64_t nwi_ifstate_get_next()
{
  return _nwi_ifstate_get_next();
}

uint64_t nwi_ifstate_get_reachability_flags()
{
  return _nwi_ifstate_get_reachability_flags();
}

uint64_t nwi_ifstate_get_vpn_server()
{
  return _nwi_ifstate_get_vpn_server();
}

uint64_t nwi_state_copy()
{
  return _nwi_state_copy();
}

uint64_t nwi_state_get_first_ifstate()
{
  return _nwi_state_get_first_ifstate();
}

uint64_t nwi_state_get_ifstate()
{
  return _nwi_state_get_ifstate();
}

uint64_t nwi_state_get_notify_key()
{
  return _nwi_state_get_notify_key();
}

uint64_t nwi_state_release()
{
  return _nwi_state_release();
}

int open(const char *a1, int a2, ...)
{
  return _open(a1, a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_log_with_args()
{
  return _os_log_with_args();
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return _proc_name(pid, buffer, buffersize);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return _pthread_attr_destroy(a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return _pthread_attr_init(a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return _pthread_attr_setdetachstate(a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return _pthread_create(a1, a2, a3, a4);
}

void pthread_exit(void *a1)
{
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return _read(a1, a2, a3);
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return _recv(a1, a2, a3, a4);
}

BOOL remove(const std::__fs::filesystem::path *__p, std::error_code *__ec)
{
  return _remove(__p, __ec);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return _send(a1, a2, a3, a4);
}

ssize_t sendto(int a1, const void *a2, size_t a3, int a4, const sockaddr *a5, socklen_t a6)
{
  return _sendto(a1, a2, a3, a4, a5, a6);
}

int setenv(const char *__name, const char *__value, int __overwrite)
{
  return _setenv(__name, __value, __overwrite);
}

int setruid(uid_t a1)
{
  return _setruid(a1);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return _setsockopt(a1, a2, a3, a4, a5);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return _socket(a1, a2, a3);
}

int socketpair(int a1, int a2, int a3, int *a4)
{
  return _socketpair(a1, a2, a3, a4);
}

int stat(const char *a1, stat *a2)
{
  return _stat(a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return _strchr(__s, __c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return _strcmp(__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return _strlcpy(__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return _strlen(__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return _strncmp(__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return _strncpy(__dst, __src, __n);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return _strsep(__stringp, __delim);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return _strstr(__s1, __s2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return _strtol(__str, __endptr, __base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
}

kern_return_t task_set_special_port(task_t task, int which_port, mach_port_t special_port)
{
  return _task_set_special_port(task, which_port, special_port);
}

time_t time(time_t *a1)
{
  return _time(a1);
}

mode_t umask(mode_t a1)
{
  return _umask(a1);
}

int unlink(const char *a1)
{
  return _unlink(a1);
}

int unsetenv(const char *a1)
{
  return _unsetenv(a1);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return _vm_allocate(target_task, address, size, flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return _vm_deallocate(target_task, address, size);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return _voucher_mach_msg_set(msg);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return _write(__fd, __buf, __nbyte);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return _xpc_connection_copy_entitlement_value();
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return _xpc_dictionary_get_remote_connection(xdict);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_release(xpc_object_t object)
{
}