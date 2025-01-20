@interface SFUCryptoUtils
+ (BOOL)checkKey:(id)a3 againstPassphraseVerifier:(id)a4;
+ (BOOL)isEncryptionVersionAndFormatSupportedInPassphraseVerifier:(id)a3;
+ (id)decodePassphraseHint:(id)a3;
+ (id)encodePassphraseHint:(id)a3;
+ (id)generatePassphraseVerifierForKey:(id)a3 verifierVersion:(unsigned __int16)a4;
+ (id)generateRandomSalt;
+ (id)generateRandomSaltWithLength:(unint64_t)a3;
+ (id)hashForPassphrase:(id)a3 withSalt:(id)a4;
+ (id)newBufferedInputStreamForDecryptingFile:(id)a3 key:(id)a4 isDeflated:(BOOL)a5 zipStream:(id *)a6;
+ (id)newBufferedInputStreamForDecryptingZippedBundle:(id)a3 key:(id)a4 zipArchive:(id)a5 isDeflated:(BOOL)a6 zipStream:(id *)a7;
+ (id)saltForSageFiles;
+ (id)saltFromVerifier:(id)a3 saltLength:(unint64_t)a4;
+ (id)sha256HashFromData:(id)a3;
+ (id)sha256HashFromDataArray:(id)a3;
+ (id)sha256HashFromStorage:(id)a3;
+ (id)sha256HashFromString:(id)a3;
+ (id)sha256HashFromStrings:(id)a3;
+ (unsigned)iterationCountFromPassphraseVerifier:(id)a3;
+ (unsigned)ivLengthForKey:(id)a3;
@end

@implementation SFUCryptoUtils

+ (id)generateRandomSalt
{
  v2 = objc_opt_class();
  return [v2 generateRandomSaltWithLength:32];
}

+ (id)generateRandomSaltWithLength:(unint64_t)a3
{
  v4 = malloc_type_calloc(a3, 1uLL, 0x100004077774924uLL);
  if (SecRandomCopyBytes(kSecRandomDefault, a3, v4))
  {
    free(v4);
    return 0;
  }
  else
  {
    return +[NSData dataWithBytesNoCopy:v4 length:a3 freeWhenDone:1];
  }
}

+ (id)hashForPassphrase:(id)a3 withSalt:(id)a4
{
  if (!a3 || !a4) {
    return 0;
  }
  v6 = +[NSMutableData dataWithData:a4];
  -[NSMutableData appendData:](v6, "appendData:", [a3 dataUsingEncoding:4]);
  return _[a1 sha256HashFromData:v6];
}

+ (unsigned)ivLengthForKey:(id)a3
{
  return 16 * ([a3 keyType] == 0);
}

+ (id)generatePassphraseVerifierForKey:(id)a3 verifierVersion:(unsigned __int16)a4
{
  unsigned int v4 = a4;
  if ([a3 keyType])
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CED98);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10016AD78();
    }
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[SFUCryptoUtils generatePassphraseVerifierForKey:verifierVersion:]"), +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/sf/SFUCryptoUtils.mm"], 91, 0, "Unsupported key type");
    +[TSUAssertionHandler logBacktraceThrottled];
    return 0;
  }
  else
  {
    id v7 = +[NSMutableData data];
    id v21 = 0;
    v8 = [[SFUMemoryOutputStream alloc] initWithData:v7];
    __int16 v20 = v4;
    __int16 v19 = 1;
    [(SFUMemoryOutputStream *)v8 writeBuffer:&v20 size:2];
    [(SFUMemoryOutputStream *)v8 writeBuffer:&v19 size:2];
    unsigned int v18 = [a3 iterationCount];
    [(SFUMemoryOutputStream *)v8 writeBuffer:&v18 size:4];
    if (v4 >= 2) {
      -[SFUMemoryOutputStream writeBuffer:size:](v8, "writeBuffer:size:", objc_msgSend(objc_msgSend(a3, "saltData"), "bytes"), objc_msgSend(objc_msgSend(a3, "saltData"), "length"));
    }
    size_t v9 = [a1 ivLengthForKey:a3];
    __chkstk_darwin();
    v11 = (char *)&v16 - v10;
    if (SecRandomCopyBytes(kSecRandomDefault, v9, (char *)&v16 - v10))
    {

      +[NSException raise:NSGenericException format:@"SFUCryptor failed to copy random bytes."];
      v8 = 0;
    }
    [(SFUMemoryOutputStream *)v8 writeBuffer:v11 size:v9];
    if (SecRandomCopyBytes(kSecRandomDefault, 0x20uLL, bytes))
    {

      +[NSException raise:NSGenericException format:@"SFUCryptor failed to copy random bytes."];
      v8 = 0;
    }
    v12 = [[SFUCryptor alloc] initWithKey:a3 operation:0 iv:v11 ivLength:v9 usePKCS7Padding:v4 == 1];
    if (![(SFUCryptor *)v12 cryptDataFromBuffer:bytes length:32 toStream:v8 finished:0 error:&v21])
    {

      id v13 = [v21 localizedDescription];
      +[NSException raise:format:](NSException, "raise:format:", NSGenericException, @"SFUCryptor failed. %@: %@", v13, [v21 localizedFailureReason]);
      v8 = 0;
      v12 = 0;
    }
    if (CC_SHA256_Init(&c) && CC_SHA256_Update(&c, bytes, 0x20u) && CC_SHA256_Final(md, &c))
    {
      if (![(SFUCryptor *)v12 cryptDataFromBuffer:md length:32 toStream:v8 finished:1 error:&v21])
      {

        id v14 = [v21 localizedDescription];
        +[NSException raise:format:](NSException, "raise:format:", NSGenericException, @"SFUCryptor failed. %@: %@", v14, [v21 localizedFailureReason]);
        v12 = 0;
        v8 = 0;
      }
    }
    else
    {
      +[TSUAssertionHandler _atomicIncrementAssertCount];
      if (TSUAssertCat_init_token != -1) {
        dispatch_once(&TSUAssertCat_init_token, &stru_1001CEDB8);
      }
      if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
        sub_10016ACF0();
      }
      +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[SFUCryptoUtils generatePassphraseVerifierForKey:verifierVersion:]"), +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/sf/SFUCryptoUtils.mm"], 154, 0, "CC_SHA256 failed");
      +[TSUAssertionHandler logBacktraceThrottled];
      id v7 = 0;
    }
  }
  return v7;
}

+ (unsigned)iterationCountFromPassphraseVerifier:(id)a3
{
  unsigned int v4 = [[SFUMemoryInputStream alloc] initWithData:a3];
  if ([(id)objc_opt_class() isEncryptionVersionAndFormatSupportedInPassphraseVerifier:a3])
  {
    [(SFUMemoryInputStream *)v4 seekToOffset:4];
    unsigned int v7 = 0;
    id v5 = [(SFUMemoryInputStream *)v4 readToBuffer:&v7 size:4];

    if (v5 == (id)4) {
      return v7;
    }
    else {
      return 0;
    }
  }
  else
  {

    return 0;
  }
}

+ (id)saltFromVerifier:(id)a3 saltLength:(unint64_t)a4
{
  unsigned int v7 = [[SFUMemoryInputStream alloc] initWithData:a3];
  if ([(id)objc_opt_class() isEncryptionVersionAndFormatSupportedInPassphraseVerifier:a3])
  {
    __int16 v11 = 0;
    if ((id)[(SFUMemoryInputStream *)v7 readToBuffer:&v11 size:2] == (id)2 && v11)
    {
      if (v11 == 1)
      {
        id v8 = [a1 saltForSageFiles];
      }
      else
      {
        __chkstk_darwin([(SFUMemoryInputStream *)v7 seekToOffset:8]);
        if (-[SFUMemoryInputStream readToBuffer:size:](v7, "readToBuffer:size:", &v10[-((a4 + 15) & 0xFFFFFFFFFFFFFFF0)], a4) == a4)id v8 = [objc_alloc((Class)NSData) initWithBytes:&v10[-((a4 + 15) & 0xFFFFFFFFFFFFFFF0)] length:a4]; {
        else
        }
          id v8 = 0;
      }
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {

    return 0;
  }
  return v8;
}

+ (id)saltForSageFiles
{
  id v2 = [objc_alloc((Class)NSData) initWithBytes:"someSalt" length:8];
  return v2;
}

+ (BOOL)checkKey:(id)a3 againstPassphraseVerifier:(id)a4
{
  unsigned int v7 = [[SFUMemoryInputStream alloc] initWithData:a4];
  unsigned __int16 v32 = 0;
  if ((id)[(SFUMemoryInputStream *)v7 readToBuffer:&v32 size:2] == (id)2
    && (unsigned int v8 = v32, v31 = 0, (id)[(SFUMemoryInputStream *)v7 readToBuffer:&v31 size:2] == (id)2)
    && ([(id)objc_opt_class() isEncryptionVersionAndFormatSupportedInPassphraseVerifier:a4] & 1) != 0&& (v30 = 0, (id)-[SFUMemoryInputStream readToBuffer:size:](v7, "readToBuffer:size:", &v30, 4) == (id)4)&& (int v9 = v30, v9 == objc_msgSend(a3, "iterationCount"))&& (v8 < 2|| (v10 = objc_msgSend(objc_msgSend(a3, "saltData"), "length"), __chkstk_darwin(v10), (id)-[SFUMemoryInputStream readToBuffer:size:](v7, "readToBuffer:size:") == v10)))
  {
    id v11 = [a1 ivLengthForKey:a3];
    unsigned int v12 = v11;
    uint64_t v13 = v11;
    __chkstk_darwin(v11);
    v15 = (char *)&v26 - v14;
    if ((id)[(SFUMemoryInputStream *)v7 readToBuffer:(char *)&v26 - v14 size:v13] == (id)v12)
    {
      uint64_t v16 = [[SFUCryptor alloc] initWithKey:a3 operation:1 iv:v15 ivLength:v13 usePKCS7Padding:v8 == 1];
      uint64_t v17 = 0;
      uint64_t v28 = 0;
      uint64_t v29 = 0;
      do
      {
        uint64_t v18 = v17;
        unsigned int v19 = [(SFUCryptor *)v16 cryptDataFromStream:v7 toBuffer:&data[v17] length:64 - v17 bytesRead:&v29 error:&v28];
        uint64_t v17 = v29 + v18;
        if (v19) {
          BOOL v20 = v29 == 0;
        }
        else {
          BOOL v20 = 1;
        }
      }
      while (!v20);

      LOBYTE(v21) = 0;
      if (v18 == 64 && !v28)
      {
        int v21 = CC_SHA256_Init(&c);
        if (v21)
        {
          int v21 = CC_SHA256_Update(&c, data, 0x20u);
          if (v21)
          {
            int v21 = CC_SHA256_Final(md, &c);
            if (v21) {
              LOBYTE(v21) = v38 == *(void *)md && v39 == v34 && v40 == v35 && v41 == v36;
            }
          }
        }
      }
    }
    else
    {

      LOBYTE(v21) = 0;
    }
  }
  else
  {

    LOBYTE(v21) = 0;
  }
  return v21;
}

+ (BOOL)isEncryptionVersionAndFormatSupportedInPassphraseVerifier:(id)a3
{
  unsigned int v4 = (unsigned __int16 *)[a3 bytes];
  return (unint64_t)[a3 length] >= 4 && *v4 - 1 <= 1 && v4[1] == 1;
}

+ (id)newBufferedInputStreamForDecryptingFile:(id)a3 key:(id)a4 isDeflated:(BOOL)a5 zipStream:(id *)a6
{
  BOOL v7 = a5;
  int v9 = [[SFUFileInputStream alloc] initWithPath:a3 offset:0];
  if (v9)
  {
    id v10 = v9;
    id v11 = [[SFUCryptoInputStream alloc] initForDecryptionWithInputStream:v9 key:a4];

    if (!v7)
    {
      if (!v11) {
        return 0;
      }
LABEL_10:
      uint64_t v13 = [[SFUBufferedInputStream alloc] initWithStream:v11];

      return v13;
    }
  }
  else
  {
    if (!v7) {
      return 0;
    }
    id v11 = 0;
  }
  unsigned int v12 = v11;
  id v11 = [[SFUZipInflateInputStream alloc] initWithInput:v11];

  if (v11)
  {
    if (a6) {
      *a6 = v11;
    }
    goto LABEL_10;
  }
  return 0;
}

+ (id)newBufferedInputStreamForDecryptingZippedBundle:(id)a3 key:(id)a4 zipArchive:(id)a5 isDeflated:(BOOL)a6 zipStream:(id *)a7
{
  BOOL v8 = a6;
  id v10 = [a5 entryWithName:a3];
  if (v10 && (id v11 = [v10 inputStream]) != 0)
  {
    unsigned int v12 = [[SFUCryptoInputStream alloc] initForDecryptionWithInputStream:v11 key:a4];
    if (!v8) {
      goto LABEL_4;
    }
  }
  else
  {
    unsigned int v12 = 0;
    if (!v8)
    {
LABEL_4:
      if (!v12) {
        return 0;
      }
LABEL_11:
      uint64_t v14 = [[SFUBufferedInputStream alloc] initWithStream:v12];

      return v14;
    }
  }
  uint64_t v13 = [[SFUZipInflateInputStream alloc] initWithInput:v12];

  if (v13)
  {
    if (a7) {
      *a7 = v13;
    }
    unsigned int v12 = v13;
    goto LABEL_11;
  }
  return 0;
}

+ (id)encodePassphraseHint:(id)a3
{
  return [a3 dataUsingEncoding:4];
}

+ (id)decodePassphraseHint:(id)a3
{
  id result = [a3 length];
  if (result)
  {
    id v5 = objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", objc_msgSend(a3, "bytes"), result, 4);
    return v5;
  }
  return result;
}

+ (id)sha256HashFromData:(id)a3
{
  int v4 = CC_SHA256_Init(&v6);
  if ((unint64_t)[a3 length] >> 32)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CEDD8);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10016AE00();
    }
    +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[SFUCryptoUtils sha256HashFromData:]"), +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/sf/SFUCryptoUtils.mm"], 414, 0, "overflow  in sha256HashFromData");
    +[TSUAssertionHandler logBacktraceThrottled];
  }
  if (v4
    && CC_SHA256_Update(&v6, [a3 bytes], (CC_LONG)objc_msgSend(a3, "length"))
    && CC_SHA256_Final(md, &v6))
  {
    return +[NSData dataWithBytes:md length:32];
  }
  else
  {
    return 0;
  }
}

+ (id)sha256HashFromStorage:(id)a3
{
  int v4 = CC_SHA256_Init(&c);
  id v5 = [a3 bufferedInputStream];
  [v5 disableSystemCaching];
  data = 0;
  if (!v4) {
    return 0;
  }
  while (1)
  {
    id v6 = [v5 readToOwnBuffer:&data size:0xFFFFFFFFLL];
    if (!v6) {
      break;
    }
    if (!CC_SHA256_Update(&c, data, (CC_LONG)v6)) {
      return 0;
    }
  }
  if (CC_SHA256_Final(md, &c)) {
    return +[NSData dataWithBytes:md length:32];
  }
  else {
    return 0;
  }
}

+ (id)sha256HashFromString:(id)a3
{
  id v4 = [a3 dataUsingEncoding:4];
  return _[a1 sha256HashFromData:v4];
}

+ (id)sha256HashFromDataArray:(id)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v4 = CC_SHA256_Init(&c) != 0;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v15 objects:v28 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v16;
    *(void *)&long long v6 = 67109890;
    long long v14 = v6;
    do
    {
      int v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(a3);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * (void)v9);
        if ((unint64_t)objc_msgSend(v10, "length", v14, (void)v15) >> 32)
        {
          unsigned int v11 = +[TSUAssertionHandler _atomicIncrementAssertCount];
          if (TSUAssertCat_init_token != -1) {
            dispatch_once(&TSUAssertCat_init_token, &stru_1001CEDF8);
          }
          unsigned int v12 = TSUAssertCat_log_t;
          if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v14;
            unsigned int v21 = v11;
            __int16 v22 = 2082;
            v23 = "+[SFUCryptoUtils sha256HashFromDataArray:]";
            __int16 v24 = 2082;
            v25 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/sf/SFUCryptoUtils.mm";
            __int16 v26 = 1024;
            int v27 = 498;
            _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d overflow in sha256HashFromData", buf, 0x22u);
          }
          +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[SFUCryptoUtils sha256HashFromDataArray:]"), +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/sf/SFUCryptoUtils.mm"], 498, 0, "overflow in sha256HashFromData");
          +[TSUAssertionHandler logBacktraceThrottled];
        }
        BOOL v4 = v4 && CC_SHA256_Update(&c, [v10 bytes], (CC_LONG)objc_msgSend(v10, "length")) != 0;
        int v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [a3 countByEnumeratingWithState:&v15 objects:v28 count:16];
    }
    while (v7);
  }
  if (v4 && CC_SHA256_Final(buf, &c)) {
    return +[NSData dataWithBytes:buf length:32];
  }
  else {
    return 0;
  }
}

+ (id)sha256HashFromStrings:(id)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  BOOL v4 = CC_SHA256_Init(&c) != 0;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [a3 countByEnumeratingWithState:&v15 objects:v28 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v16;
    *(void *)&long long v6 = 67109890;
    long long v14 = v6;
    do
    {
      int v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(a3);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * (void)v9), "dataUsingEncoding:", 4, v14, (void)v15);
        if ((unint64_t)[v10 length] >> 32)
        {
          unsigned int v11 = +[TSUAssertionHandler _atomicIncrementAssertCount];
          if (TSUAssertCat_init_token != -1) {
            dispatch_once(&TSUAssertCat_init_token, &stru_1001CEE18);
          }
          unsigned int v12 = TSUAssertCat_log_t;
          if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v14;
            unsigned int v21 = v11;
            __int16 v22 = 2082;
            v23 = "+[SFUCryptoUtils sha256HashFromStrings:]";
            __int16 v24 = 2082;
            v25 = "/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/sf/SFUCryptoUtils.mm";
            __int16 v26 = 1024;
            int v27 = 521;
            _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d overflow in sha256HashFromData", buf, 0x22u);
          }
          +[TSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](TSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[SFUCryptoUtils sha256HashFromStrings:]"), +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/sf/SFUCryptoUtils.mm"], 521, 0, "overflow in sha256HashFromData");
          +[TSUAssertionHandler logBacktraceThrottled];
        }
        BOOL v4 = v4 && CC_SHA256_Update(&c, [v10 bytes], (CC_LONG)objc_msgSend(v10, "length")) != 0;
        int v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [a3 countByEnumeratingWithState:&v15 objects:v28 count:16];
    }
    while (v7);
  }
  if (v4 && CC_SHA256_Final(buf, &c)) {
    return +[NSData dataWithBytes:buf length:32];
  }
  else {
    return 0;
  }
}

@end