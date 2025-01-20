@interface ISPurchaseReceipt
+ (ISPurchaseReceipt)receiptWithContentsOfFile:(id)a3;
- (BOOL)_anchorTrust:(__SecTrust *)a3 toRootCertificateIn:(__CFArray *)a4;
- (BOOL)_checkArray:(__CFArray *)a3 containsCertificateWithOID:(__CFString *)a4;
- (BOOL)_checkIfCertificate:(__SecCertificate *)a3 containsOID:(__CFString *)a4;
- (BOOL)_decodeReceiptData:(id)a3 toDecodedMessage:(SecCmsMessageStr *)a4;
- (BOOL)_parseReceiptFromMessage:(SecCmsMessageStr *)a3;
- (BOOL)_setPoliciesForTrust:(__SecTrust *)a3;
- (BOOL)isRevoked;
- (BOOL)isVPPLicensed;
- (ISPurchaseReceipt)initWithContentsOfFile:(id)a3;
- (NSDate)expirationDate;
- (SecCmsSignedDataStr)_extractSignedDataFromMessage:(SecCmsMessageStr *)a3;
- (__CFArray)_copyCertificatesFromSignedData:(SecCmsSignedDataStr *)a3;
- (int64_t)_verifySignatureForSignedData:(SecCmsSignedDataStr *)a3 onDate:(id)a4;
- (void)_parseTokens:(id)a3;
@end

@implementation ISPurchaseReceipt

+ (ISPurchaseReceipt)receiptWithContentsOfFile:(id)a3
{
  id v3 = a3;
  v4 = [[ISPurchaseReceipt alloc] initWithContentsOfFile:v3];

  return v4;
}

- (ISPurchaseReceipt)initWithContentsOfFile:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)ISPurchaseReceipt;
  v5 = [(ISPurchaseReceipt *)&v25 init];
  if (v5)
  {
    if (v4 && [v4 length])
    {
      v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v4];
      v7 = v6;
      if (v6 && [v6 length])
      {
        *(void *)v26 = 0;
        BOOL v8 = [(ISPurchaseReceipt *)v5 _decodeReceiptData:v7 toDecodedMessage:v26]&& [(ISPurchaseReceipt *)v5 _parseReceiptFromMessage:*(void *)v26]&& [(ISPurchaseReceipt *)v5 _verifySignatureForSignedData:[(ISPurchaseReceipt *)v5 _extractSignedDataFromMessage:*(void *)v26] onDate:v5->_receiptCreationDate] != 0xFFFF;
        if (*(void *)v26) {
          SecCmsMessageDestroy();
        }
        if (v8) {
          goto LABEL_22;
        }
      }
    }
    else
    {
      v7 = 0;
    }
    v9 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v9)
    {
      v9 = +[SSLogConfig sharedConfig];
    }
    int v10 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v11 = v10 | 2;
    }
    else {
      int v11 = v10;
    }
    v12 = [v9 OSLogObject];
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      v11 &= 2u;
    }
    if (v11)
    {
      v13 = objc_opt_class();
      id v14 = v13;
      uint64_t v15 = [v7 length];
      *(_DWORD *)v26 = 138412802;
      *(void *)&v26[4] = v13;
      __int16 v27 = 2048;
      uint64_t v28 = v15;
      __int16 v29 = 2112;
      id v30 = v4;
      LODWORD(v24) = 32;
      v16 = (void *)_os_log_send_and_compose_impl();

      if (!v16)
      {
LABEL_21:

        v5 = 0;
LABEL_22:

        goto LABEL_23;
      }
      v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v16, 4, v26, v24);
      free(v16);
      SSFileLog(v9, @"%@", v17, v18, v19, v20, v21, v22, (uint64_t)v12);
    }

    goto LABEL_21;
  }
LABEL_23:

  return v5;
}

- (BOOL)isRevoked
{
  return [(NSString *)self->_cancellationReason length] != 0;
}

- (BOOL)isVPPLicensed
{
  return self->_renewalDate != 0;
}

- (BOOL)_anchorTrust:(__SecTrust *)a3 toRootCertificateIn:(__CFArray *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v20[0] = xmmword_1A52F6558;
  v20[1] = unk_1A52F6568;
  CFDataRef v6 = CFDataCreate(0, (const UInt8 *)v20, 32);
  if (!v6) {
    return 0;
  }
  CFDataRef v7 = v6;
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 1, MEMORY[0x1E4F1D510]);
  CFIndex Count = CFArrayGetCount(a4);
  CFIndex v10 = Count - 1;
  if (Count < 1) {
    goto LABEL_12;
  }
  CFIndex v11 = 0;
  char v12 = 0;
  do
  {
    ValueAtIndex = CFArrayGetValueAtIndex(a4, v11);
    id v14 = (const void *)SecCertificateCopySubjectPublicKeyInfoSHA256Digest();
    if (v14)
    {
      uint64_t v15 = v14;
      if (CFEqual(v7, v14))
      {
        CFArrayAppendValue(Mutable, ValueAtIndex);
        char v12 = 1;
      }
      CFRelease(v15);
    }
    if (v12) {
      break;
    }
  }
  while (v10 != v11++);
  if (v12)
  {
    OSStatus v18 = SecTrustSetAnchorCertificates(a3, Mutable);
    if (!v18) {
      OSStatus v18 = SecTrustSetAnchorCertificatesOnly(a3, 1u);
    }
    BOOL v17 = v18 == 0;
  }
  else
  {
LABEL_12:
    BOOL v17 = 0;
  }
  CFRelease(Mutable);
  CFRelease(v7);
  return v17;
}

- (BOOL)_checkArray:(__CFArray *)a3 containsCertificateWithOID:(__CFString *)a4
{
  CFIndex Count = CFArrayGetCount(a3);
  if (Count < 1) {
    return 0;
  }
  CFIndex v8 = Count;
  if ([(ISPurchaseReceipt *)self _checkIfCertificate:CFArrayGetValueAtIndex(a3, 0) containsOID:a4])
  {
    return 1;
  }
  CFIndex v10 = 1;
  do
  {
    CFIndex v11 = v10;
    if (v8 == v10) {
      break;
    }
    BOOL v12 = [(ISPurchaseReceipt *)self _checkIfCertificate:CFArrayGetValueAtIndex(a3, v10) containsOID:a4];
    CFIndex v10 = v11 + 1;
  }
  while (!v12);
  return v11 < v8;
}

- (BOOL)_checkIfCertificate:(__SecCertificate *)a3 containsOID:(__CFString *)a4
{
  CFDataRef cf = CFDataCreate(0, byte_1A52F6578, 2);
  CFArrayRef v4 = (const __CFArray *)SecCertificateCopyProperties();
  if (v4)
  {
    CFArrayRef v5 = v4;
    CFIndex Count = CFArrayGetCount(v4);
    if (Count < 1)
    {
      BOOL v20 = 0;
    }
    else
    {
      CFIndex v6 = 0;
      char v7 = 0;
      CFIndex v8 = (const void *)*MEMORY[0x1E4F3BC20];
      v9 = (const void *)*MEMORY[0x1E4F3BC38];
      do
      {
        CFDictionaryRef ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v5, v6);
        Value = CFDictionaryGetValue(ValueAtIndex, v8);
        if (Value)
        {
          if (CFEqual(Value, a4))
          {
            CFArrayRef v12 = (const __CFArray *)CFDictionaryGetValue(ValueAtIndex, v9);
            if (v12)
            {
              CFArrayRef v13 = v12;
              CFIndex v14 = CFArrayGetCount(v12);
              if (v14 >= 1 && (v7 & 1) == 0)
              {
                CFIndex v15 = v14;
                uint64_t v16 = 1;
                do
                {
                  CFDictionaryRef v17 = (const __CFDictionary *)CFArrayGetValueAtIndex(v13, v16 - 1);
                  OSStatus v18 = CFDictionaryGetValue(v17, v8);
                  if (v18)
                  {
                    if (CFEqual(v18, @"Unparsed Data"))
                    {
                      uint64_t v19 = CFDictionaryGetValue(v17, v9);
                      if (v19)
                      {
                        if (CFEqual(v19, cf)) {
                          char v7 = 1;
                        }
                      }
                    }
                  }
                  if (v16 >= v15) {
                    break;
                  }
                  ++v16;
                }
                while ((v7 & 1) == 0);
              }
            }
          }
        }
        ++v6;
        BOOL v20 = v7 & 1;
      }
      while (v6 < Count && (v7 & 1) == 0);
    }
    CFRelease(v5);
  }
  else
  {
    BOOL v20 = 0;
  }
  CFRelease(cf);
  return v20;
}

- (__CFArray)_copyCertificatesFromSignedData:(SecCmsSignedDataStr *)a3
{
  uint64_t CertificateList = SecCmsSignedDataGetCertificateList();
  if (!CertificateList) {
    return 0;
  }
  CFArrayRef v4 = (uint64_t *)CertificateList;
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E4F1D510]);
  uint64_t v6 = *v4;
  if (*v4)
  {
    char v7 = v4 + 1;
    do
    {
      CFDataRef v8 = CFDataCreate(0, *(const UInt8 **)(v6 + 8), *(void *)v6);
      if (v8)
      {
        CFDataRef v9 = v8;
        SecCertificateRef v10 = SecCertificateCreateWithData(0, v8);
        if (v10)
        {
          SecCertificateRef v11 = v10;
          CFArrayAppendValue(Mutable, v10);
          CFRelease(v11);
        }
        CFRelease(v9);
      }
      uint64_t v12 = *v7++;
      uint64_t v6 = v12;
    }
    while (v12);
  }
  return Mutable;
}

- (BOOL)_decodeReceiptData:(id)a3 toDecodedMessage:(SecCmsMessageStr *)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (SecCmsDecoderCreate())
  {
    CFArrayRef v5 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v5)
    {
      CFArrayRef v5 = +[SSLogConfig sharedConfig];
    }
    int v6 = [v5 shouldLog];
    if ([v5 shouldLogToDisk]) {
      int v7 = v6 | 2;
    }
    else {
      int v7 = v6;
    }
    CFDataRef v8 = [v5 OSLogObject];
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      v7 &= 2u;
    }
    if (!v7) {
      goto LABEL_32;
    }
  }
  else
  {
    id v9 = v4;
    [v9 bytes];
    [v9 length];
    if (SecCmsDecoderUpdate())
    {
      CFArrayRef v5 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v5)
      {
        CFArrayRef v5 = +[SSLogConfig sharedConfig];
      }
      int v10 = [v5 shouldLog];
      if ([v5 shouldLogToDisk]) {
        int v11 = v10 | 2;
      }
      else {
        int v11 = v10;
      }
      CFDataRef v8 = [v5 OSLogObject];
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        v11 &= 2u;
      }
      if (!v11) {
        goto LABEL_32;
      }
    }
    else
    {
      if (!SecCmsDecoderFinish())
      {
        BOOL v22 = 1;
        goto LABEL_34;
      }
      CFArrayRef v5 = +[SSLogConfig sharedStoreServicesConfig];
      if (!v5)
      {
        CFArrayRef v5 = +[SSLogConfig sharedConfig];
      }
      int v12 = [v5 shouldLog];
      if ([v5 shouldLogToDisk]) {
        int v13 = v12 | 2;
      }
      else {
        int v13 = v12;
      }
      CFDataRef v8 = [v5 OSLogObject];
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        v13 &= 2u;
      }
      if (!v13) {
        goto LABEL_32;
      }
    }
  }
  int v25 = 138412290;
  id v26 = (id)objc_opt_class();
  id v14 = v26;
  LODWORD(v24) = 12;
  CFIndex v15 = (void *)_os_log_send_and_compose_impl();

  if (v15)
  {
    CFDataRef v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v15, 4, &v25, v24);
    free(v15);
    SSFileLog(v5, @"%@", v16, v17, v18, v19, v20, v21, (uint64_t)v8);
LABEL_32:
  }
  SecCmsDecoderDestroy();
  BOOL v22 = 0;
LABEL_34:

  return v22;
}

- (SecCmsSignedDataStr)_extractSignedDataFromMessage:(SecCmsMessageStr *)a3
{
  int v3 = SecCmsMessageContentLevelCount();
  if (v3 < 1) {
    return 0;
  }
  int v4 = v3;
  int v5 = 0;
  while (1)
  {
    SecCmsMessageContentLevel();
    if (SecCmsContentInfoGetContentTypeTag() == 26)
    {
      result = (SecCmsSignedDataStr *)SecCmsContentInfoGetContent();
      if (result) {
        break;
      }
    }
    if (v4 == ++v5) {
      return 0;
    }
  }
  return result;
}

- (BOOL)_parseReceiptFromMessage:(SecCmsMessageStr *)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = MEMORY[0x1A6267890](a3, a2);
  if (v4 && *(void *)v4)
  {
    CFDataRef v5 = CFDataCreate(0, *(const UInt8 **)(v4 + 8), *(void *)v4);
    if (v5)
    {
      CFDataRef v6 = v5;
      int v7 = +[asn1Token readTokenFromBuffer:CFDataGetBytePtr(v5)];
      uint64_t v8 = [v7 identifier];
      BOOL v9 = v8 == 17;
      if (v8 == 17)
      {
        [(ISPurchaseReceipt *)self _parseTokens:v7];
LABEL_40:
        CFRelease(v6);
        goto LABEL_41;
      }
      uint64_t v23 = +[SSLogConfig sharedStoreServicesConfig];
      uint64_t v24 = (void *)v23;
      if (!v23)
      {
        uint64_t v24 = +[SSLogConfig sharedConfig];
      }
      int v25 = [v24 shouldLog];
      if ([v24 shouldLogToDisk]) {
        int v26 = v25 | 2;
      }
      else {
        int v26 = v25;
      }
      uint64_t v27 = [v24 OSLogObject];
      if (!os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        v26 &= 2u;
      }
      if (v26)
      {
        LODWORD(v38) = 138412290;
        *(void *)((char *)&v38 + 4) = objc_opt_class();
        id v28 = *(id *)((char *)&v38 + 4);
        LODWORD(v37) = 12;
        __int16 v29 = (void *)_os_log_send_and_compose_impl();

        if (!v29)
        {
LABEL_39:

          goto LABEL_40;
        }
        uint64_t v27 = objc_msgSend(NSString, "stringWithCString:encoding:", v29, 4, &v38, v37, v38);
        free(v29);
        SSFileLog(v24, @"%@", v30, v31, v32, v33, v34, v35, (uint64_t)v27);
      }

      goto LABEL_39;
    }
    int v7 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v7)
    {
      int v7 = +[SSLogConfig sharedConfig];
    }
    int v21 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v22 = v21 | 2;
    }
    else {
      int v22 = v21;
    }
    int v12 = [v7 OSLogObject];
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      v22 &= 2u;
    }
    if (!v22) {
      goto LABEL_17;
    }
  }
  else
  {
    int v7 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v7)
    {
      int v7 = +[SSLogConfig sharedConfig];
    }
    int v10 = [v7 shouldLog];
    if ([v7 shouldLogToDisk]) {
      int v11 = v10 | 2;
    }
    else {
      int v11 = v10;
    }
    int v12 = [v7 OSLogObject];
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      v11 &= 2u;
    }
    if (!v11) {
      goto LABEL_17;
    }
  }
  LODWORD(v38) = 138412290;
  *(void *)((char *)&v38 + 4) = objc_opt_class();
  id v13 = *(id *)((char *)&v38 + 4);
  LODWORD(v37) = 12;
  id v14 = (void *)_os_log_send_and_compose_impl();

  if (v14)
  {
    int v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v14, 4, &v38, v37, v38);
    free(v14);
    SSFileLog(v7, @"%@", v15, v16, v17, v18, v19, v20, (uint64_t)v12);
LABEL_17:
  }
  BOOL v9 = 0;
LABEL_41:

  return v9;
}

- (void)_parseTokens:(id)a3
{
  uint64_t v160 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = &off_1E5BA6000;
  CFDataRef v5 = +[SSLogConfig sharedStoreServicesConfig];
  if (!v5)
  {
    CFDataRef v5 = +[SSLogConfig sharedConfig];
  }
  int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  uint64_t v8 = [v5 OSLogObject];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    int v9 = v7;
  }
  else {
    int v9 = v7 & 2;
  }
  if (v9)
  {
    int v156 = 138412290;
    id v157 = (id)objc_opt_class();
    id v10 = v157;
    LODWORD(v150) = 12;
    v149 = &v156;
    int v11 = (void *)_os_log_send_and_compose_impl();

    if (!v11) {
      goto LABEL_13;
    }
    uint64_t v8 = objc_msgSend(NSString, "stringWithCString:encoding:", v11, 4, &v156, v150);
    free(v11);
    SSFileLog(v5, @"%@", v12, v13, v14, v15, v16, v17, (uint64_t)v8);
  }

LABEL_13:
  uint64_t v18 = [v3 nextToken];
  if (v18)
  {
    uint64_t v19 = (void *)v18;
    id v154 = v3;
    while (2)
    {
      uint64_t v20 = (void *)MEMORY[0x1A6267F60]();
      int v21 = +[asn1ReceiptToken readFromBuffer:](asn1ReceiptToken, "readFromBuffer:", [v19 content]);
      switch([v21 type])
      {
        case 0:
          int v22 = [v4[244] sharedStoreServicesConfig];
          if (!v22)
          {
            int v22 = [v4[244] sharedConfig];
          }
          int v23 = objc_msgSend(v22, "shouldLog", v149);
          if ([v22 shouldLogToDisk]) {
            int v24 = v23 | 2;
          }
          else {
            int v24 = v23;
          }
          int v25 = [v22 OSLogObject];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
            int v26 = v24;
          }
          else {
            int v26 = v24 & 2;
          }
          if (!v26) {
            goto LABEL_180;
          }
          goto LABEL_114;
        case 1:
          int v22 = [v4[244] sharedStoreServicesConfig];
          if (!v22)
          {
            int v22 = [v4[244] sharedConfig];
          }
          int v27 = objc_msgSend(v22, "shouldLog", v149);
          if ([v22 shouldLogToDisk]) {
            int v28 = v27 | 2;
          }
          else {
            int v28 = v27;
          }
          int v25 = [v22 OSLogObject];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
            int v29 = v28;
          }
          else {
            int v29 = v28 & 2;
          }
          if (v29) {
            goto LABEL_55;
          }
          goto LABEL_180;
        case 2:
          int v22 = [v4[244] sharedStoreServicesConfig];
          if (!v22)
          {
            int v22 = [v4[244] sharedConfig];
          }
          int v75 = objc_msgSend(v22, "shouldLog", v149);
          if ([v22 shouldLogToDisk]) {
            int v76 = v75 | 2;
          }
          else {
            int v76 = v75;
          }
          int v25 = [v22 OSLogObject];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
            int v77 = v76;
          }
          else {
            int v77 = v76 & 2;
          }
          if (v77) {
            goto LABEL_114;
          }
          goto LABEL_180;
        case 3:
          int v22 = [v4[244] sharedStoreServicesConfig];
          if (!v22)
          {
            int v22 = [v4[244] sharedConfig];
          }
          int v30 = objc_msgSend(v22, "shouldLog", v149);
          if ([v22 shouldLogToDisk]) {
            int v31 = v30 | 2;
          }
          else {
            int v31 = v30;
          }
          int v25 = [v22 OSLogObject];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
            int v32 = v31;
          }
          else {
            int v32 = v31 & 2;
          }
          if (!v32) {
            goto LABEL_180;
          }
LABEL_114:
          v78 = objc_opt_class();
          id v79 = v78;
          v80 = [v21 stringValue];
          int v156 = 138412546;
          id v157 = v78;
          __int16 v158 = 2112;
          uint64_t v159 = (uint64_t)v80;
          LODWORD(v150) = 22;
          v149 = &v156;
          goto LABEL_161;
        case 4:
          int v22 = [v4[244] sharedStoreServicesConfig];
          if (!v22)
          {
            int v22 = [v4[244] sharedConfig];
          }
          int v33 = objc_msgSend(v22, "shouldLog", v149);
          if ([v22 shouldLogToDisk]) {
            int v34 = v33 | 2;
          }
          else {
            int v34 = v33;
          }
          int v25 = [v22 OSLogObject];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
            int v35 = v34;
          }
          else {
            int v35 = v34 & 2;
          }
          if (!v35) {
            goto LABEL_180;
          }
LABEL_55:
          v36 = objc_opt_class();
          uint64_t v37 = NSNumber;
          id v38 = v36;
          uint64_t v39 = objc_msgSend(v37, "numberWithUnsignedLongLong:", objc_msgSend(v21, "integerValue"));
          int v156 = 138412546;
          id v157 = v36;
          __int16 v158 = 2112;
          uint64_t v159 = (uint64_t)v39;
          LODWORD(v150) = 22;
          v149 = &v156;
          uint64_t v40 = _os_log_send_and_compose_impl();

          goto LABEL_162;
        case 5:
          int v22 = [v4[244] sharedStoreServicesConfig];
          if (!v22)
          {
            int v22 = [v4[244] sharedConfig];
          }
          int v41 = objc_msgSend(v22, "shouldLog", v149);
          if ([v22 shouldLogToDisk]) {
            int v42 = v41 | 2;
          }
          else {
            int v42 = v41;
          }
          int v25 = [v22 OSLogObject];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
            int v43 = v42;
          }
          else {
            int v43 = v42 & 2;
          }
          if (!v43) {
            goto LABEL_179;
          }
          v153 = v20;
          v44 = objc_opt_class();
          v151 = (void *)MEMORY[0x1E4F1C9B8];
          id v45 = v21;
          id v152 = v44;
          v46 = [v45 contentToken];
          uint64_t v47 = [v46 content];
          v48 = [v45 contentToken];

          v49 = objc_msgSend(v151, "dataWithBytes:length:", v47, objc_msgSend(v48, "length"));

          uint64_t v50 = [v49 length];
          int v156 = 138412546;
          id v157 = v44;
          __int16 v158 = 2048;
          uint64_t v159 = v50;
          LODWORD(v150) = 22;
          v149 = &v156;
          v51 = (void *)_os_log_send_and_compose_impl();

          if (v51)
          {
            int v25 = objc_msgSend(NSString, "stringWithCString:encoding:", v51, 4, &v156, v150);
            free(v51);
            SSFileLog(v22, @"%@", v52, v53, v54, v55, v56, v57, (uint64_t)v25);
            uint64_t v20 = v153;
            id v3 = v154;
            goto LABEL_179;
          }
          uint64_t v20 = v153;
          id v3 = v154;
          goto LABEL_221;
        case 8:
          int v22 = [v4[244] sharedStoreServicesConfig];
          if (!v22)
          {
            int v22 = [v4[244] sharedConfig];
          }
          int v81 = objc_msgSend(v22, "shouldLog", v149);
          if ([v22 shouldLogToDisk]) {
            v81 |= 2u;
          }
          int v25 = [v22 OSLogObject];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
            int v82 = v81;
          }
          else {
            int v82 = v81 & 2;
          }
          if (!v82) {
            goto LABEL_179;
          }
          id v83 = (id)objc_opt_class();
          v84 = [v21 stringValue];
          v85 = v84;
          if (v84)
          {
            id v86 = v84;
            v87 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", parseISO8601((unsigned __int8 *)objc_msgSend(v86, "UTF8String"), objc_msgSend(v86, "length")));
          }
          else
          {
            v87 = 0;
          }

          int v156 = 138412546;
          id v157 = v83;
          __int16 v158 = 2112;
          uint64_t v159 = (uint64_t)v87;
          LODWORD(v150) = 22;
          v149 = &v156;
          uint64_t v148 = _os_log_send_and_compose_impl();

          if (!v148) {
            goto LABEL_220;
          }
          int v25 = objc_msgSend(NSString, "stringWithCString:encoding:", v148, 4, &v156, v150);
          v98 = (void *)v148;
          goto LABEL_164;
        case 9:
          int v22 = [v4[244] sharedStoreServicesConfig];
          if (!v22)
          {
            int v22 = [v4[244] sharedConfig];
          }
          int v88 = objc_msgSend(v22, "shouldLog", v149);
          if ([v22 shouldLogToDisk]) {
            v88 |= 2u;
          }
          int v25 = [v22 OSLogObject];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
            int v89 = v88;
          }
          else {
            int v89 = v88 & 2;
          }
          if (v89) {
            goto LABEL_160;
          }
          goto LABEL_180;
        case 10:
          int v22 = [v4[244] sharedStoreServicesConfig];
          if (!v22)
          {
            int v22 = [v4[244] sharedConfig];
          }
          int v90 = objc_msgSend(v22, "shouldLog", v149);
          if ([v22 shouldLogToDisk]) {
            v90 |= 2u;
          }
          int v25 = [v22 OSLogObject];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
            int v91 = v90;
          }
          else {
            int v91 = v90 & 2;
          }
          if (v91) {
            goto LABEL_177;
          }
          goto LABEL_180;
        case 11:
          int v22 = [v4[244] sharedStoreServicesConfig];
          if (!v22)
          {
            int v22 = [v4[244] sharedConfig];
          }
          int v92 = objc_msgSend(v22, "shouldLog", v149);
          if ([v22 shouldLogToDisk]) {
            v92 |= 2u;
          }
          int v25 = [v22 OSLogObject];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
            int v93 = v92;
          }
          else {
            int v93 = v92 & 2;
          }
          if (v93) {
            goto LABEL_160;
          }
          goto LABEL_180;
        case 12:
          v58 = [v21 stringValue];
          v59 = v58;
          if (v58)
          {
            id v60 = v58;
            objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", parseISO8601((unsigned __int8 *)objc_msgSend(v60, "UTF8String"), objc_msgSend(v60, "length")));
            v61 = (NSDate *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v61 = 0;
          }

          receiptCreationDate = self->_receiptCreationDate;
          self->_receiptCreationDate = v61;

          int v22 = [v4[244] sharedStoreServicesConfig];
          if (!v22)
          {
            int v22 = [v4[244] sharedConfig];
          }
          int v127 = objc_msgSend(v22, "shouldLog", v149);
          if ([v22 shouldLogToDisk]) {
            v127 |= 2u;
          }
          int v25 = [v22 OSLogObject];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
            int v128 = v127;
          }
          else {
            int v128 = v127 & 2;
          }
          if (!v128) {
            goto LABEL_180;
          }
          v129 = objc_opt_class();
          v130 = self->_receiptCreationDate;
          int v156 = 138412546;
          id v157 = v129;
          __int16 v158 = 2112;
          uint64_t v159 = (uint64_t)v130;
          id v74 = v129;
          LODWORD(v150) = 22;
          v149 = &v156;
          goto LABEL_214;
        case 13:
          int v22 = [v4[244] sharedStoreServicesConfig];
          if (!v22)
          {
            int v22 = [v4[244] sharedConfig];
          }
          int v62 = objc_msgSend(v22, "shouldLog", v149);
          if ([v22 shouldLogToDisk]) {
            v62 |= 2u;
          }
          int v25 = [v22 OSLogObject];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
            int v63 = v62;
          }
          else {
            int v63 = v62 & 2;
          }
          if (v63) {
            goto LABEL_177;
          }
          goto LABEL_180;
        case 14:
          int v22 = [v4[244] sharedStoreServicesConfig];
          if (!v22)
          {
            int v22 = [v4[244] sharedConfig];
          }
          int v64 = objc_msgSend(v22, "shouldLog", v149);
          if ([v22 shouldLogToDisk]) {
            v64 |= 2u;
          }
          int v25 = [v22 OSLogObject];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
            int v65 = v64;
          }
          else {
            int v65 = v64 & 2;
          }
          if (v65) {
            goto LABEL_160;
          }
          goto LABEL_180;
        case 15:
          int v22 = [v4[244] sharedStoreServicesConfig];
          if (!v22)
          {
            int v22 = [v4[244] sharedConfig];
          }
          int v66 = objc_msgSend(v22, "shouldLog", v149);
          if ([v22 shouldLogToDisk]) {
            v66 |= 2u;
          }
          int v25 = [v22 OSLogObject];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
            int v67 = v66;
          }
          else {
            int v67 = v66 & 2;
          }
          if (v67) {
            goto LABEL_160;
          }
          goto LABEL_180;
        case 16:
          int v22 = [v4[244] sharedStoreServicesConfig];
          if (!v22)
          {
            int v22 = [v4[244] sharedConfig];
          }
          int v94 = objc_msgSend(v22, "shouldLog", v149);
          if ([v22 shouldLogToDisk]) {
            v94 |= 2u;
          }
          int v25 = [v22 OSLogObject];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
            int v95 = v94;
          }
          else {
            int v95 = v94 & 2;
          }
          if (!v95) {
            goto LABEL_180;
          }
LABEL_160:
          v96 = objc_opt_class();
          v97 = NSNumber;
          id v79 = v96;
          v80 = objc_msgSend(v97, "numberWithUnsignedLongLong:", objc_msgSend(v21, "integerValue"));
          int v156 = 138412546;
          id v157 = v96;
          __int16 v158 = 2112;
          uint64_t v159 = (uint64_t)v80;
          LODWORD(v150) = 22;
          v149 = &v156;
LABEL_161:
          uint64_t v40 = _os_log_send_and_compose_impl();

LABEL_162:
          if (v40)
          {
            int v25 = objc_msgSend(NSString, "stringWithCString:encoding:", v40, 4, &v156, v150);
            v98 = (void *)v40;
LABEL_164:
            free(v98);
            SSFileLog(v22, @"%@", v99, v100, v101, v102, v103, v104, (uint64_t)v25);
            id v3 = v154;
LABEL_179:
            uint64_t v4 = &off_1E5BA6000;
LABEL_180:
          }
          else
          {
LABEL_220:
            id v3 = v154;
LABEL_221:
            uint64_t v4 = &off_1E5BA6000;
          }
LABEL_181:

LABEL_182:
          uint64_t v125 = [v3 nextToken];

          uint64_t v19 = (void *)v125;
          if (!v125) {
            break;
          }
          continue;
        case 21:
          v105 = [v21 stringValue];
          v106 = v105;
          if (v105)
          {
            id v107 = v105;
            objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", parseISO8601((unsigned __int8 *)objc_msgSend(v107, "UTF8String"), objc_msgSend(v107, "length")));
            v108 = (NSDate *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v108 = 0;
          }

          expirationDate = self->_expirationDate;
          self->_expirationDate = v108;

          int v22 = [v4[244] sharedStoreServicesConfig];
          if (!v22)
          {
            int v22 = [v4[244] sharedConfig];
          }
          int v132 = objc_msgSend(v22, "shouldLog", v149);
          if ([v22 shouldLogToDisk]) {
            v132 |= 2u;
          }
          int v25 = [v22 OSLogObject];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
            int v133 = v132;
          }
          else {
            int v133 = v132 & 2;
          }
          if (!v133) {
            goto LABEL_180;
          }
          v134 = objc_opt_class();
          v135 = self->_expirationDate;
          int v156 = 138412546;
          id v157 = v134;
          __int16 v158 = 2112;
          uint64_t v159 = (uint64_t)v135;
          id v74 = v134;
          LODWORD(v150) = 22;
          v149 = &v156;
          goto LABEL_214;
        case 22:
          v109 = [v21 stringValue];
          v110 = v109;
          if (v109)
          {
            id v111 = v109;
            objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", parseISO8601((unsigned __int8 *)objc_msgSend(v111, "UTF8String"), objc_msgSend(v111, "length")));
            v112 = (NSDate *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v112 = 0;
          }

          renewalDate = self->_renewalDate;
          self->_renewalDate = v112;

          int v22 = [v4[244] sharedStoreServicesConfig];
          if (!v22)
          {
            int v22 = [v4[244] sharedConfig];
          }
          int v137 = objc_msgSend(v22, "shouldLog", v149);
          if ([v22 shouldLogToDisk]) {
            v137 |= 2u;
          }
          int v25 = [v22 OSLogObject];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
            int v138 = v137;
          }
          else {
            int v138 = v137 & 2;
          }
          if (!v138) {
            goto LABEL_180;
          }
          v139 = objc_opt_class();
          v140 = self->_renewalDate;
          int v156 = 138412546;
          id v157 = v139;
          __int16 v158 = 2112;
          uint64_t v159 = (uint64_t)v140;
          id v74 = v139;
          LODWORD(v150) = 22;
          v149 = &v156;
          goto LABEL_214;
        case 23:
          int v22 = [v4[244] sharedStoreServicesConfig];
          if (!v22)
          {
            int v22 = [v4[244] sharedConfig];
          }
          int v113 = objc_msgSend(v22, "shouldLog", v149);
          if ([v22 shouldLogToDisk]) {
            v113 |= 2u;
          }
          int v25 = [v22 OSLogObject];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
            int v114 = v113;
          }
          else {
            int v114 = v113 & 2;
          }
          if (!v114) {
            goto LABEL_180;
          }
LABEL_177:
          v115 = objc_opt_class();
          id v116 = v115;
          v117 = [v21 stringValue];
          int v156 = 138412546;
          id v157 = v115;
          __int16 v158 = 2112;
          uint64_t v159 = (uint64_t)v117;
          LODWORD(v150) = 22;
          v149 = &v156;
          v118 = (void *)_os_log_send_and_compose_impl();

          if (!v118) {
            goto LABEL_221;
          }
          int v25 = objc_msgSend(NSString, "stringWithCString:encoding:", v118, 4, &v156, v150);
          free(v118);
          SSFileLog(v22, @"%@", v119, v120, v121, v122, v123, v124, (uint64_t)v25);
          goto LABEL_179;
        case 24:
          v68 = [v21 stringValue];
          cancellationReason = self->_cancellationReason;
          self->_cancellationReason = v68;

          int v22 = [v4[244] sharedStoreServicesConfig];
          if (!v22)
          {
            int v22 = [v4[244] sharedConfig];
          }
          int v70 = objc_msgSend(v22, "shouldLog", v149);
          if ([v22 shouldLogToDisk]) {
            v70 |= 2u;
          }
          int v25 = [v22 OSLogObject];
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
            int v71 = v70;
          }
          else {
            int v71 = v70 & 2;
          }
          if (!v71) {
            goto LABEL_180;
          }
          v72 = objc_opt_class();
          v73 = self->_cancellationReason;
          int v156 = 138412546;
          id v157 = v72;
          __int16 v158 = 2112;
          uint64_t v159 = (uint64_t)v73;
          id v74 = v72;
          LODWORD(v150) = 22;
          v149 = &v156;
LABEL_214:
          v141 = (void *)_os_log_send_and_compose_impl();

          if (!v141) {
            goto LABEL_181;
          }
          int v25 = objc_msgSend(NSString, "stringWithCString:encoding:", v141, 4, &v156, v150);
          free(v141);
          SSFileLog(v22, @"%@", v142, v143, v144, v145, v146, v147, (uint64_t)v25);
          goto LABEL_180;
        default:
          goto LABEL_182;
      }
      break;
    }
  }
}

- (BOOL)_setPoliciesForTrust:(__SecTrust *)a3
{
  v16[2] = *MEMORY[0x1E4F143B8];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 3, MEMORY[0x1E4F1D510]);
  uint64_t v5 = 0;
  uint64_t v6 = *MEMORY[0x1E4F3BBD0];
  v16[0] = *MEMORY[0x1E4F3BBC8];
  v16[1] = v6;
  char v7 = 1;
  while (1)
  {
    char v8 = v7;
    SecPolicyRef v9 = SecPolicyCreateWithProperties((CFTypeRef)v16[v5], 0);
    if (!v9) {
      break;
    }
    CFArrayAppendValue(Mutable, v9);
    CFRelease(v9);
    char v7 = 0;
    uint64_t v5 = 1;
    if ((v8 & 1) == 0)
    {
      id v10 = CFDictionaryCreateMutable(0, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      if (!v10) {
        goto LABEL_9;
      }
      goto LABEL_7;
    }
  }
  id v10 = CFDictionaryCreateMutable(0, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (!v10) {
    goto LABEL_11;
  }
LABEL_7:
  int v11 = [NSNumber numberWithUnsignedLong:3];
  CFDictionaryAddValue(v10, (const void *)*MEMORY[0x1E4F3BC08], v11);
  SecPolicyRef v12 = SecPolicyCreateWithProperties((CFTypeRef)*MEMORY[0x1E4F3BBC0], v10);
  if (v12)
  {
    SecPolicyRef v13 = v12;
    CFArrayAppendValue(Mutable, v12);
    CFRelease(v13);
    CFRelease(v10);

    if (v9)
    {
LABEL_9:
      BOOL v14 = SecTrustSetPolicies(a3, Mutable) == 0;
      goto LABEL_12;
    }
  }
  else
  {
    CFRelease(v10);
  }
LABEL_11:
  BOOL v14 = 0;
LABEL_12:
  CFRelease(Mutable);
  return v14;
}

- (int64_t)_verifySignatureForSignedData:(SecCmsSignedDataStr *)a3 onDate:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  CFDateRef v6 = (const __CFDate *)a4;
  SecTrustRef trust = 0;
  char v7 = [(ISPurchaseReceipt *)self _copyCertificatesFromSignedData:a3];
  if (!v7)
  {
    SecPolicyRef v13 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v13)
    {
      SecPolicyRef v13 = +[SSLogConfig sharedConfig];
    }
    int v14 = [v13 shouldLog];
    if ([v13 shouldLogToDisk]) {
      int v15 = v14 | 2;
    }
    else {
      int v15 = v14;
    }
    uint64_t v16 = [v13 OSLogObject];
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      v15 &= 2u;
    }
    if (v15)
    {
      int v50 = 138412290;
      id v51 = (id)objc_opt_class();
      id v17 = v51;
      LODWORD(v47) = 12;
      uint64_t v18 = (void *)_os_log_send_and_compose_impl();

      if (!v18)
      {
LABEL_25:

        int64_t v25 = 0xFFFFLL;
        goto LABEL_49;
      }
      uint64_t v16 = objc_msgSend(NSString, "stringWithCString:encoding:", v18, 4, &v50, v47);
      free(v18);
      SSFileLog(v13, @"%@", v19, v20, v21, v22, v23, v24, (uint64_t)v16);
    }

    goto LABEL_25;
  }
  char v8 = v7;
  if (CFArrayGetCount(v7) == 3)
  {
    if ([(ISPurchaseReceipt *)self _checkArray:v8 containsCertificateWithOID:@"1.2.840.113635.100.6.2.1"])
    {
      if (SecTrustCreateWithCertificates(v8, 0, &trust))
      {
        SecPolicyRef v9 = +[SSLogConfig sharedStoreServicesConfig];
        if (!v9)
        {
          SecPolicyRef v9 = +[SSLogConfig sharedConfig];
        }
        int v10 = [v9 shouldLog];
        if ([v9 shouldLogToDisk]) {
          int v11 = v10 | 2;
        }
        else {
          int v11 = v10;
        }
        SecPolicyRef v12 = [v9 OSLogObject];
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          v11 &= 2u;
        }
        if (!v11) {
          goto LABEL_46;
        }
      }
      else if ([(ISPurchaseReceipt *)self _setPoliciesForTrust:trust])
      {
        if ([(ISPurchaseReceipt *)self _anchorTrust:trust toRootCertificateIn:v8])
        {
          if (!v6 || !SecTrustSetVerifyDate(trust, v6))
          {
            int v48 = 0;
            MEMORY[0x1A6267940](trust, &v48);
            if (v48 == 1 || v48 == 4) {
              int64_t v25 = 0;
            }
            else {
              int64_t v25 = 0xFFFFLL;
            }
            goto LABEL_48;
          }
          SecPolicyRef v9 = +[SSLogConfig sharedStoreServicesConfig];
          if (!v9)
          {
            SecPolicyRef v9 = +[SSLogConfig sharedConfig];
          }
          int v39 = [v9 shouldLog];
          if ([v9 shouldLogToDisk]) {
            int v40 = v39 | 2;
          }
          else {
            int v40 = v39;
          }
          SecPolicyRef v12 = [v9 OSLogObject];
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
            v40 &= 2u;
          }
          if (!v40) {
            goto LABEL_46;
          }
        }
        else
        {
          SecPolicyRef v9 = +[SSLogConfig sharedStoreServicesConfig];
          if (!v9)
          {
            SecPolicyRef v9 = +[SSLogConfig sharedConfig];
          }
          int v43 = [v9 shouldLog];
          if ([v9 shouldLogToDisk]) {
            int v44 = v43 | 2;
          }
          else {
            int v44 = v43;
          }
          SecPolicyRef v12 = [v9 OSLogObject];
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
            v44 &= 2u;
          }
          if (!v44) {
            goto LABEL_46;
          }
        }
      }
      else
      {
        SecPolicyRef v9 = +[SSLogConfig sharedStoreServicesConfig];
        if (!v9)
        {
          SecPolicyRef v9 = +[SSLogConfig sharedConfig];
        }
        int v41 = [v9 shouldLog];
        if ([v9 shouldLogToDisk]) {
          int v42 = v41 | 2;
        }
        else {
          int v42 = v41;
        }
        SecPolicyRef v12 = [v9 OSLogObject];
        if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
          v42 &= 2u;
        }
        if (!v42) {
          goto LABEL_46;
        }
      }
      id v45 = objc_opt_class();
      int v50 = 138412290;
      id v51 = v45;
      id v30 = v45;
      LODWORD(v47) = 12;
      goto LABEL_44;
    }
    SecPolicyRef v9 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v9)
    {
      SecPolicyRef v9 = +[SSLogConfig sharedConfig];
    }
    int v28 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v29 = v28 | 2;
    }
    else {
      int v29 = v28;
    }
    SecPolicyRef v12 = [v9 OSLogObject];
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      v29 &= 2u;
    }
    if (!v29) {
      goto LABEL_46;
    }
  }
  else
  {
    SecPolicyRef v9 = +[SSLogConfig sharedStoreServicesConfig];
    if (!v9)
    {
      SecPolicyRef v9 = +[SSLogConfig sharedConfig];
    }
    int v26 = [v9 shouldLog];
    if ([v9 shouldLogToDisk]) {
      int v27 = v26 | 2;
    }
    else {
      int v27 = v26;
    }
    SecPolicyRef v12 = [v9 OSLogObject];
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      v27 &= 2u;
    }
    if (!v27) {
      goto LABEL_46;
    }
  }
  int v50 = 138412290;
  id v51 = (id)objc_opt_class();
  id v30 = v51;
  LODWORD(v47) = 12;
LABEL_44:
  int v31 = (void *)_os_log_send_and_compose_impl();

  if (v31)
  {
    SecPolicyRef v12 = objc_msgSend(NSString, "stringWithCString:encoding:", v31, 4, &v50, v47);
    free(v31);
    SSFileLog(v9, @"%@", v32, v33, v34, v35, v36, v37, (uint64_t)v12);
LABEL_46:
  }
  int64_t v25 = 0xFFFFLL;
LABEL_48:
  CFRelease(v8);
LABEL_49:
  if (trust) {
    CFRelease(trust);
  }

  return v25;
}

- (NSDate)expirationDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renewalDate, 0);
  objc_storeStrong((id *)&self->_receiptCreationDate, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_cancellationReason, 0);
}

@end