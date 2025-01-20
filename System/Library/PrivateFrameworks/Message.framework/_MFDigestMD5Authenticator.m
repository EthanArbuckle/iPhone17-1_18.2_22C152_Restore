@interface _MFDigestMD5Authenticator
- (id)responseForServerData:(id)a3;
- (int64_t)securityLevel;
- (void)dealloc;
- (void)setAuthenticationState:(int64_t)a3;
- (void)setCryptInfo:(void *)a3;
- (void)setExpectedResponse:(id)a3;
- (void)setMaxBuffer:(unsigned int)a3;
- (void)setSecurityLevel:(int64_t)a3;
@end

@implementation _MFDigestMD5Authenticator

- (void)dealloc
{
  if (self->_cryptInfo) {
    NSZoneFree((NSZone *)[(_MFDigestMD5Authenticator *)self zone], self->_cryptInfo);
  }

  v3.receiver = self;
  v3.super_class = (Class)_MFDigestMD5Authenticator;
  [(_MFDigestMD5Authenticator *)&v3 dealloc];
}

- (void)setAuthenticationState:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_MFDigestMD5Authenticator;
  -[ECSASLAuthenticator setAuthenticationState:](&v6, sel_setAuthenticationState_);
  if (a3 != 1)
  {
    expectedResponse = self->_expectedResponse;
    if (expectedResponse)
    {

      self->_expectedResponse = 0;
    }
    *((unsigned char *)self + 42) = *((unsigned char *)self + 42) & 0xFC | 1;
    *((_WORD *)self + 20) = 0;
  }
}

- (id)responseForServerData:(id)a3
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  if ([(ECSASLAuthenticator *)self authenticationState] == 1)
  {
    v73 = (const UInt8 *)[a3 bytes];
    uint64_t v5 = [a3 length];
    v74 = &v73[v5];
    unint64_t v75 = 0xAAAAAAAA00000001;
    long long v76 = 0u;
    long long v77 = 0u;
    uint64_t v78 = 0;
    if (v5 >= 1)
    {
      while (1)
      {
        if (!v75) {
          goto LABEL_141;
        }
        objc_super v6 = (__CFString *)copyToken(&v73);
        v7 = v6;
        v8 = v73;
        v9 = v74;
        if (v73 < v74) {
LABEL_6:
        }
          UInt8 v10 = *v8;
        else {
          UInt8 v10 = 0;
        }
        v11 = v8;
        v8 = v73;
        do
        {
          while (1)
          {
            do
            {
              UInt8 v12 = v10;
              UInt8 v10 = 0;
            }
            while (v12 > 0x20u);
            if (((1 << v12) & 0x100002600) == 0) {
              break;
            }
            UInt8 v10 = 0;
            v8 = v11 + 1;
            v11 = v8;
            if (v8 < v74)
            {
              v73 = v8;
              goto LABEL_6;
            }
          }
        }
        while (v12);
        v73 = v8;
        if (v6)
        {
          if (v11 >= v74 || *v11 != 61)
          {
            v15 = MFLogGeneral();
            if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
              goto LABEL_53;
            }
            if (v11 >= v9) {
              CC_LONG v16 = 0;
            }
            else {
              CC_LONG v16 = *v11;
            }
            goto LABEL_51;
          }
          v13 = v11 + 1;
          v73 = v11 + 1;
          if (v11 + 1 >= v74) {
            UInt8 v14 = 0;
          }
          else {
LABEL_18:
          }
            UInt8 v14 = *v13;
          v17 = v13;
          v13 = v73;
          do
          {
            while (1)
            {
              do
              {
                UInt8 v18 = v14;
                UInt8 v14 = 0;
              }
              while (v18 > 0x20u);
              if (((1 << v18) & 0x100002600) == 0) {
                break;
              }
              UInt8 v14 = 0;
              v13 = v17 + 1;
              v17 = v13;
              if (v13 < v74)
              {
                v73 = v13;
                goto LABEL_18;
              }
            }
          }
          while (v18);
          v73 = v13;
          if ([(__CFString *)v6 caseInsensitiveCompare:@"realm"])
          {
            if ([(__CFString *)v7 caseInsensitiveCompare:@"nonce"])
            {
              if ([(__CFString *)v7 caseInsensitiveCompare:@"qop"])
              {
                if ([(__CFString *)v7 caseInsensitiveCompare:@"stale"])
                {
                  if ([(__CFString *)v7 caseInsensitiveCompare:@"maxbuf"])
                  {
                    if ([(__CFString *)v7 caseInsensitiveCompare:@"charset"])
                    {
                      if ([(__CFString *)v7 caseInsensitiveCompare:@"algorithm"])
                      {
                        if (![(__CFString *)v7 caseInsensitiveCompare:@"cipher-opts"])
                        {
                          CFDataRef v52 = (const __CFData *)copyQuotedTokenList(&v73);
                          CFDataRef v21 = v52;
                          if (v52)
                          {
                            if (!(void)v77) {
                              *(void *)&long long v77 = [(__CFData *)v52 copy];
                            }
                            goto LABEL_117;
                          }
                          v55 = MFLogGeneral();
                          if (!os_log_type_enabled(v55, OS_LOG_TYPE_INFO)) {
                            goto LABEL_117;
                          }
                          buf.A = 138412290;
                          *(void *)&buf.B = v7;
                          v28 = v55;
                          v29 = "*** Unable to parse %@. Ignoring";
LABEL_60:
                          uint32_t v30 = 12;
                          goto LABEL_61;
                        }
                        uint64_t v19 = [(__CFString *)v7 caseInsensitiveCompare:@"rspauth"];
                        CFStringRef v20 = copyToken(&v73);
                        CFDataRef v21 = (CFDataRef)v20;
                        if (v19)
                        {
                          if (v20) {
                            goto LABEL_117;
                          }
                          CFDataRef v21 = quoted_string(&v73);
                          if (v21) {
                            goto LABEL_117;
                          }
                          v22 = MFLogGeneral();
                          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
                          {
                            buf.A = 138412290;
                            *(void *)&buf.B = v7;
                            v23 = v22;
                            v24 = "*** Unable to parse %@. Aborting";
                            uint32_t v25 = 12;
                            goto LABEL_52;
                          }
                          goto LABEL_53;
                        }
                        if (v20)
                        {
                          if (!*((void *)&v77 + 1)) {
                            *((void *)&v77 + 1) = MFCreateDataWithString();
                          }
                          goto LABEL_117;
                        }
                        v43 = MFLogGeneral();
                        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
                        {
LABEL_126:
                          buf.A = 138412290;
                          *(void *)&buf.B = v7;
                          _os_log_impl(&dword_1A7EFF000, v43, OS_LOG_TYPE_INFO, "*** Unable to parse %@. Ignoring", (uint8_t *)&buf, 0xCu);
                        }
                      }
                      else
                      {
                        v34 = (__CFString *)copyToken(&v73);
                        if (v34
                          || (CFDataRef v53 = quoted_string(&v73)) != 0
                          && (CFDataRef v54 = v53,
                              v34 = (__CFString *)[[NSString alloc] initWithData:v53 encoding:4], v54, v34))
                        {
                          if ([(__CFString *)v34 caseInsensitiveCompare:@"md5-sess"])
                          {
                            v51 = MFLogGeneral();
                            if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
                            {
                              buf.A = 138412546;
                              *(void *)&buf.B = v34;
                              LOWORD(buf.D) = 2112;
                              *(void *)((char *)&buf.D + 2) = v7;
                              _os_log_impl(&dword_1A7EFF000, v51, OS_LOG_TYPE_INFO, "*** Unexpected value %@ for %@. Ignoring", (uint8_t *)&buf, 0x16u);
                            }
                            LODWORD(v75) = 0;
                          }
                          else
                          {
                            LODWORD(v78) = v78 | 0x20;
                          }
LABEL_77:

                          goto LABEL_54;
                        }
                        v43 = MFLogGeneral();
                        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO)) {
                          goto LABEL_126;
                        }
                      }
                    }
                    else
                    {
                      v49 = (__CFString *)copyToken(&v73);
                      if (v49)
                      {
                        CFDataRef v21 = (CFDataRef)v49;
                        if ([(__CFString *)v49 caseInsensitiveCompare:@"utf-8"])
                        {
                          v50 = MFLogGeneral();
                          if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
                          {
                            buf.A = 138412546;
                            *(void *)&buf.B = v21;
                            LOWORD(buf.D) = 2112;
                            *(void *)((char *)&buf.D + 2) = v7;
                            v28 = v50;
                            v29 = "*** Unexpected value %@ for %@. Ignoring";
                            uint32_t v30 = 22;
LABEL_61:
                            _os_log_impl(&dword_1A7EFF000, v28, OS_LOG_TYPE_INFO, v29, (uint8_t *)&buf, v30);
                          }
LABEL_117:

                          goto LABEL_54;
                        }
                        int v46 = v78 | 0x10;
LABEL_116:
                        LODWORD(v78) = v46;
                        goto LABEL_117;
                      }
                      v43 = MFLogGeneral();
                      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO)) {
                        goto LABEL_126;
                      }
                    }
                  }
                  else
                  {
                    v47 = (__CFString *)copyToken(&v73);
                    if (v47)
                    {
                      CFDataRef v21 = (CFDataRef)v47;
                      int v48 = [(__CFString *)v47 intValue];
                      if ((v48 - 1) > 0xFFFD) {
                        goto LABEL_117;
                      }
                      int v46 = v78 & 0xFFC0003F | ((unsigned __int16)v48 << 6);
                      goto LABEL_116;
                    }
                    v43 = MFLogGeneral();
                    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO)) {
                      goto LABEL_126;
                    }
                  }
                }
                else
                {
                  CFStringRef v44 = copyToken(&v73);
                  if (v44)
                  {
                    CFDataRef v21 = (CFDataRef)v44;
                    if (NSBOOLFromString()) {
                      int v45 = 8;
                    }
                    else {
                      int v45 = 0;
                    }
                    int v46 = v78 & 0xFFFFFFF7 | v45;
                    goto LABEL_116;
                  }
                  v43 = MFLogGeneral();
                  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO)) {
                    goto LABEL_126;
                  }
                }
              }
              else
              {
                v33 = (__CFString *)copyQuotedTokenList(&v73);
                if (v33)
                {
                  v34 = v33;
                  uint64_t v35 = [(__CFString *)v33 count];
                  if (v35)
                  {
                    uint64_t v36 = v35;
                    int v37 = v78;
                    do
                    {
                      uint64_t v38 = [(__CFString *)v34 objectAtIndex:--v36];
                      unint64_t v39 = 0;
                      do
                      {
                        unint64_t v40 = v39;
                        uint64_t v41 = [(__CFString *)QOP_NAMES[v39] caseInsensitiveCompare:v38];
                        unint64_t v39 = v40 + 1;
                      }
                      while (v40 <= 1 && v41);
                      int v42 = (1 << v39) & 7;
                      if (v41) {
                        int v42 = 0;
                      }
                      v37 |= v42;
                    }
                    while (v36);
                    LODWORD(v78) = v37;
                  }
                  goto LABEL_77;
                }
                v43 = MFLogGeneral();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO)) {
                  goto LABEL_126;
                }
              }
            }
            else
            {
              CFDataRef v31 = quoted_string(&v73);
              if (v31)
              {
                CFDataRef v21 = v31;
                if (*((void *)&v76 + 1))
                {
                  v32 = MFLogGeneral();
                  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                  {
                    buf.A = 138412290;
                    *(void *)&buf.B = v7;
                    _os_log_impl(&dword_1A7EFF000, v32, OS_LOG_TYPE_INFO, "*** Duplicate value for %@. Ignoring", (uint8_t *)&buf, 0xCu);
                  }
                  LODWORD(v75) = 0;
                  goto LABEL_117;
                }
                *((void *)&v76 + 1) = v31;
              }
              else
              {
                v43 = MFLogGeneral();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO)) {
                  goto LABEL_126;
                }
              }
            }
          }
          else
          {
            CFDataRef v26 = quoted_string(&v73);
            if (v26)
            {
              CFDataRef v21 = v26;
              if ((void)v76)
              {
                v27 = MFLogGeneral();
                if (!os_log_type_enabled(v27, OS_LOG_TYPE_INFO)) {
                  goto LABEL_117;
                }
                buf.A = 138412290;
                *(void *)&buf.B = v7;
                v28 = v27;
                v29 = "*** Duplicate value for %@. Ignoring";
                goto LABEL_60;
              }
              *(void *)&long long v76 = v26;
            }
            else
            {
              v43 = MFLogGeneral();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO)) {
                goto LABEL_126;
              }
            }
          }
        }
        else
        {
          if (v11 >= v74 || *v11 != 44)
          {
            v15 = MFLogGeneral();
            if (!os_log_type_enabled(v15, OS_LOG_TYPE_INFO)) {
              goto LABEL_53;
            }
            if (v11 >= v9) {
              CC_LONG v16 = 0;
            }
            else {
              CC_LONG v16 = *v11;
            }
LABEL_51:
            buf.A = 67109120;
            buf.B = v16;
            v23 = v15;
            v24 = "*** Unexpected character '%c', aborting";
            uint32_t v25 = 8;
LABEL_52:
            _os_log_impl(&dword_1A7EFF000, v23, OS_LOG_TYPE_INFO, v24, (uint8_t *)&buf, v25);
LABEL_53:
            LODWORD(v75) = 0;
            goto LABEL_54;
          }
          v73 = v11 + 1;
        }
LABEL_54:

        if (v73 >= v74)
        {
          if (!v75) {
            goto LABEL_141;
          }
          break;
        }
      }
    }
    if (self->_expectedResponse)
    {
      if (*((void *)&v77 + 1))
      {
        if (objc_msgSend(*((id *)&v77 + 1), "isEqual:"))
        {
          [(_MFDigestMD5Authenticator *)self setAuthenticationState:4];
          id v56 = (id)[MEMORY[0x1E4F1C9B8] data];
LABEL_142:

          return v56;
        }
        v59 = MFLogGeneral();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf.A) = 0;
          v60 = "*** Bogus rspauth value returned from the server";
          goto LABEL_140;
        }
      }
      else
      {
        v59 = MFLogGeneral();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf.A) = 0;
          v60 = "*** Missing rspauth value in server message";
LABEL_140:
          _os_log_impl(&dword_1A7EFF000, v59, OS_LOG_TYPE_INFO, v60, (uint8_t *)&buf, 2u);
        }
      }
LABEL_141:
      [(_MFDigestMD5Authenticator *)self setAuthenticationState:3];
      id v56 = 0;
      goto LABEL_142;
    }
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v79 = 0u;
    unsigned int v57 = v78;
    if ((v78 & 0x20) != 0)
    {
      memset(&buf, 170, 16);
      if (MFGetRandomBytes())
      {
        CFDataRef v62 = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)&buf, 16, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
        id v63 = (id)[(__CFData *)v62 mf_encodeBase64WithoutLineBreaks];
        *(void *)&long long v79 = v63;
        CFRelease(v62);
        objc_msgSend(NSString, "stringWithFormat:", @"%08x", 1);
        *((void *)&v79 + 1) = MFCreateDataWithString();
        if ((v57 & 4) != 0)
        {
          [(_MFDigestMD5Authenticator *)self setSecurityLevel:2];
          [(_MFDigestMD5Authenticator *)self setMaxBuffer:(unsigned __int16)(v57 >> 6)];
        }
        else
        {
          [(_MFDigestMD5Authenticator *)self setSecurityLevel:1];
        }
        [(_MFDigestMD5Authenticator *)self securityLevel];
        *(void *)&long long v80 = MFCreateDataWithString();
        v64 = [(ECSASLAuthenticator *)self account];
        [NSString stringWithFormat:@"%@/%@", objc_msgSend((id)objc_opt_class(), "saslProfileName"), -[ECAuthenticatableAccount hostname](v64, "hostname")];
        [(ECAuthenticatableAccount *)v64 username];
        *((void *)&v80 + 1) = MFCreateDataWithString();
        [(ECAuthenticatableAccount *)v64 password];
        *(void *)&long long v81 = MFCreateDataWithString();
        *((void *)&v81 + 1) = MFCreateDataWithString();
        v65 = (void *)v76;
        *(void *)&long long v82 = [(id)v76 copy];
        *((void *)&v82 + 1) = _createResponseData((uint64_t)&v76, (uint64_t)&v79, 1);
        if (*((void *)&v82 + 1))
        {
          int64_t v66 = [(_MFDigestMD5Authenticator *)self securityLevel];
          if (v66 == 2)
          {
            *(void *)&long long v68 = 0xAAAAAAAAAAAAAAAALL;
            *((void *)&v68 + 1) = 0xAAAAAAAAAAAAAAAALL;
            *(_OWORD *)&buf.data[13] = v68;
            *(_OWORD *)&buf.data[6] = v68;
            *(_OWORD *)&buf.data[10] = v68;
            *(_OWORD *)&buf.Nl = v68;
            *(_OWORD *)&buf.data[2] = v68;
            *(_OWORD *)&buf.A = v68;
            [(_MFDigestMD5Authenticator *)self setCryptInfo:NSZoneCalloc((NSZone *)[(_MFDigestMD5Authenticator *)self zone], 1uLL, 0x28uLL)];
            CC_MD5_Init(&buf);
            CC_MD5_Update(&buf, &v83, 0x10u);
            CC_MD5_Update(&buf, "Digest session key to server-to-client signing key magic constant", 0x41u);
            CC_MD5_Final((unsigned __int8 *)0x18, &buf);
            CC_MD5_Init(&buf);
            CC_MD5_Update(&buf, &v83, 0x10u);
            CC_MD5_Update(&buf, "Digest session key to client-to-server signing key magic constant", 0x41u);
            CC_MD5_Final((unsigned __int8 *)8, &buf);
          }
          else if (v66 == 3)
          {
            v67 = MFLogGeneral();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
            {
              LOWORD(buf.A) = 0;
              _os_log_impl(&dword_1A7EFF000, v67, OS_LOG_TYPE_INFO, "*** ECSASLPrivacySecurityLevel is not supported.", (uint8_t *)&buf, 2u);
            }
          }
          ResponseData = _createResponseData((uint64_t)&v76, (uint64_t)&v79, 0);
          [(_MFDigestMD5Authenticator *)self setExpectedResponse:ResponseData];

          v70 = (void *)[objc_allocWithZone(MEMORY[0x1E4F1CA58]) init];
          v71 = v70;
          if (*((void *)&v80 + 1)) {
            _appendQuotedString(v70, (uint64_t)"username", *((void **)&v80 + 1));
          }
          if (v65) {
            _appendQuotedString(v71, (uint64_t)"realm", v65);
          }
          if (*((void *)&v76 + 1)) {
            _appendQuotedString(v71, (uint64_t)"nonce", *((void **)&v76 + 1));
          }
          _appendQuotedString(v71, (uint64_t)"cnonce", (void *)v79);
          _appendValue(v71, (uint64_t)"nc", *((uint64_t *)&v79 + 1));
          _appendValue(v71, (uint64_t)"qop", v80);
          _appendQuotedString(v71, (uint64_t)"digest-uri", *((void **)&v81 + 1));
          _appendValue(v71, (uint64_t)"response", *((uint64_t *)&v82 + 1));
          if (*((_WORD *)self + 20))
          {
            EFStringWithInt();
            v72 = (void *)MFCreateDataWithString();
            _appendValue(v71, (uint64_t)"maxbuf", (uint64_t)v72);
          }
          if ((v57 & 0x10) != 0) {
            _appendValue(v71, (uint64_t)"charset", [@"utf-8" dataUsingEncoding:1]);
          }
          id v56 = v71;
          id v63 = (id)v79;
          if (!(void)v79) {
            goto LABEL_150;
          }
          goto LABEL_149;
        }
LABEL_148:
        [(_MFDigestMD5Authenticator *)self setAuthenticationState:3];
        id v56 = 0;
        if (!v63)
        {
LABEL_150:
          if ((void)v80) {

          }
          if (*((void *)&v79 + 1)) {
          if (*((void *)&v80 + 1))
          }

          if ((void)v81) {
          if (*((void *)&v81 + 1))
          }

          if ((void)v82) {
          if (*((void *)&v82 + 1))
          }

          goto LABEL_142;
        }
LABEL_149:

        goto LABEL_150;
      }
    }
    else
    {
      v58 = MFLogGeneral();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf.A) = 0;
        _os_log_impl(&dword_1A7EFF000, v58, OS_LOG_TYPE_INFO, "*** Missing algorithm=md5-sess in server response", (uint8_t *)&buf, 2u);
      }
    }
    id v63 = 0;
    goto LABEL_148;
  }
  return 0;
}

- (void)setSecurityLevel:(int64_t)a3
{
  *((unsigned char *)self + 42) = *((unsigned char *)self + 42) & 0xFC | a3 & 3;
}

- (int64_t)securityLevel
{
  return (uint64_t)(*((unsigned __int8 *)self + 42) << 30) >> 30;
}

- (void)setMaxBuffer:(unsigned int)a3
{
  *((_WORD *)self + 20) = a3;
}

- (void)setCryptInfo:(void *)a3
{
  if (self->_cryptInfo) {
    NSZoneFree((NSZone *)[(_MFDigestMD5Authenticator *)self zone], self->_cryptInfo);
  }
  self->_cryptInfo = a3;
}

- (void)setExpectedResponse:(id)a3
{
  id v5 = a3;

  self->_expectedResponse = (NSData *)a3;
}

@end