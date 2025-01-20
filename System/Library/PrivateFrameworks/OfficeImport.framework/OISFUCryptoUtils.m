@interface OISFUCryptoUtils
+ (BOOL)checkKey:(id)a3 againstPassphraseVerifier:(id)a4;
+ (BOOL)generateRandomDataInBuffer:(char *)a3 length:(unint64_t)a4;
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
+ (id)sha1HashFromStorage:(id)a3;
+ (id)sha256HashFromData:(id)a3;
+ (id)sha256HashFromStorage:(id)a3;
+ (id)sha256HashFromString:(id)a3;
+ (unsigned)iterationCountFromPassphraseVerifier:(id)a3;
+ (unsigned)ivLengthForKey:(id)a3;
@end

@implementation OISFUCryptoUtils

+ (BOOL)generateRandomDataInBuffer:(char *)a3 length:(unint64_t)a4
{
  v6 = fopen("/dev/random", "r");
  if (!v6) {
    return 0;
  }
  v7 = v6;
  BOOL v8 = fread(a3, a4, 1uLL, v6) == 1;
  fclose(v7);
  return v8;
}

+ (id)generateRandomSalt
{
  v2 = objc_opt_class();
  return (id)[v2 generateRandomSaltWithLength:32];
}

+ (id)generateRandomSaltWithLength:(unint64_t)a3
{
  v5 = malloc_type_calloc(a3, 1uLL, 0x100004077774924uLL);
  if ([a1 generateRandomDataInBuffer:v5 length:a3])
  {
    v6 = (void *)MEMORY[0x263EFF8F8];
    return (id)[v6 dataWithBytesNoCopy:v5 length:a3 freeWhenDone:1];
  }
  else
  {
    free(v5);
    return 0;
  }
}

+ (id)hashForPassphrase:(id)a3 withSalt:(id)a4
{
  if (!a3 || !a4) {
    return 0;
  }
  v6 = (void *)[MEMORY[0x263EFF990] dataWithData:a4];
  objc_msgSend(v6, "appendData:", objc_msgSend(a3, "dataUsingEncoding:", 4));
  return (id)[a1 sha256HashFromData:v6];
}

+ (unsigned)ivLengthForKey:(id)a3
{
  return 16 * ([a3 keyType] == 0);
}

+ (id)generatePassphraseVerifierForKey:(id)a3 verifierVersion:(unsigned __int16)a4
{
  unsigned int v4 = a4;
  uint64_t v30 = *MEMORY[0x263EF8340];
  if ([a3 keyType])
  {
    uint64_t v7 = [NSString stringWithUTF8String:"+[OISFUCryptoUtils generatePassphraseVerifierForKey:verifierVersion:]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUCryptoUtils.mm"], 103, 0, "Unsupported key type");
    +[OITSUAssertionHandler logBacktraceThrottled];
    return 0;
  }
  else
  {
    BOOL v8 = (void *)[MEMORY[0x263EFF990] data];
    id v27 = 0;
    v9 = [[OISFUMemoryOutputStream alloc] initWithData:v8];
    __int16 v26 = v4;
    __int16 v25 = 1;
    [(OISFUMemoryOutputStream *)v9 writeBuffer:&v26 size:2];
    [(OISFUMemoryOutputStream *)v9 writeBuffer:&v25 size:2];
    int v24 = [a3 iterationCount];
    [(OISFUMemoryOutputStream *)v9 writeBuffer:&v24 size:4];
    if (v4 >= 2) {
      -[OISFUMemoryOutputStream writeBuffer:size:](v9, "writeBuffer:size:", objc_msgSend((id)objc_msgSend(a3, "saltData"), "bytes"), objc_msgSend((id)objc_msgSend(a3, "saltData"), "length"));
    }
    uint64_t v10 = [a1 ivLengthForKey:a3];
    uint64_t v11 = v10;
    MEMORY[0x270FA5388](v10);
    v13 = (char *)&c - v12;
    [a1 generateRandomDataInBuffer:(char *)&c - v12 length:v11];
    [(OISFUMemoryOutputStream *)v9 writeBuffer:v13 size:v11];
    v14 = [[OISFUCryptor alloc] initWithKey:a3 operation:0 iv:v13 ivLength:v11 usePKCS7Padding:v4 == 1];
    [a1 generateRandomDataInBuffer:data length:32];
    if (![(OISFUCryptor *)v14 cryptDataFromBuffer:data length:32 toStream:v9 finished:0 error:&v27])
    {

      v15 = (void *)MEMORY[0x263EFF940];
      uint64_t v16 = *MEMORY[0x263EFF488];
      uint64_t v17 = [v27 localizedDescription];
      [v15 raise:v16, @"SFUCryptor failed. %@: %@", v17, objc_msgSend(v27, "localizedFailureReason") format];
      v9 = 0;
      v14 = 0;
    }
    if (CC_SHA256_Init(&c) && CC_SHA256_Update(&c, data, 0x20u) && CC_SHA256_Final(md, &c))
    {
      if (![(OISFUCryptor *)v14 cryptDataFromBuffer:md length:32 toStream:v9 finished:1 error:&v27])
      {

        v18 = (void *)MEMORY[0x263EFF940];
        uint64_t v19 = *MEMORY[0x263EFF488];
        uint64_t v20 = [v27 localizedDescription];
        [v18 raise:v19, @"SFUCryptor failed. %@: %@", v20, objc_msgSend(v27, "localizedFailureReason") format];
        v14 = 0;
        v9 = 0;
      }
    }
    else
    {
      uint64_t v21 = [NSString stringWithUTF8String:"+[OISFUCryptoUtils generatePassphraseVerifierForKey:verifierVersion:]"];
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUCryptoUtils.mm"], 156, 0, "CC_SHA256 failed");
      +[OITSUAssertionHandler logBacktraceThrottled];
      BOOL v8 = 0;
    }
  }
  return v8;
}

+ (unsigned)iterationCountFromPassphraseVerifier:(id)a3
{
  unsigned int v4 = [[OISFUMemoryInputStream alloc] initWithData:a3];
  if ([(id)objc_opt_class() isEncryptionVersionAndFormatSupportedInPassphraseVerifier:a3])
  {
    [(OISFUMemoryInputStream *)v4 seekToOffset:4];
    unsigned int v7 = 0;
    uint64_t v5 = [(OISFUMemoryInputStream *)v4 readToBuffer:&v7 size:4];

    if (v5 == 4) {
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
  uint64_t v13 = *MEMORY[0x263EF8340];
  unsigned int v7 = [[OISFUMemoryInputStream alloc] initWithData:a3];
  if ([(id)objc_opt_class() isEncryptionVersionAndFormatSupportedInPassphraseVerifier:a3])
  {
    __int16 v12 = 0;
    if ([(OISFUMemoryInputStream *)v7 readToBuffer:&v12 size:2] == 2 && v12)
    {
      if (v12 == 1)
      {
        id v8 = (id)[a1 saltForSageFiles];
      }
      else
      {
        uint64_t v10 = [(OISFUMemoryInputStream *)v7 seekToOffset:8];
        MEMORY[0x270FA5388](v10);
        if (-[OISFUMemoryInputStream readToBuffer:size:](v7, "readToBuffer:size:", &v11[-((a4 + 15) & 0xFFFFFFFFFFFFFFF0)], a4) == a4)id v8 = (id)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:&v11[-((a4 + 15) & 0xFFFFFFFFFFFFFFF0)] length:a4]; {
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
  v2 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:"someSalt" length:8];
  return v2;
}

+ (BOOL)checkKey:(id)a3 againstPassphraseVerifier:(id)a4
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  unsigned int v7 = [[OISFUMemoryInputStream alloc] initWithData:a4];
  unsigned __int16 v32 = 0;
  if ([(OISFUMemoryInputStream *)v7 readToBuffer:&v32 size:2] == 2
    && (unsigned int v8 = v32, v31 = 0, [(OISFUMemoryInputStream *)v7 readToBuffer:&v31 size:2] == 2)
    && ([(id)objc_opt_class() isEncryptionVersionAndFormatSupportedInPassphraseVerifier:a4] & 1) != 0
    && (int v30 = 0, [(OISFUMemoryInputStream *)v7 readToBuffer:&v30 size:4] == 4)
    && (int v9 = v30, v9 == [a3 iterationCount])
    && (v8 < 2
     || (uint64_t v10 = objc_msgSend((id)objc_msgSend(a3, "saltData"), "length"),
         MEMORY[0x270FA5388](v10),
         -[OISFUMemoryInputStream readToBuffer:size:](v7, "readToBuffer:size:") == v10)))
  {
    uint64_t v11 = [a1 ivLengthForKey:a3];
    int v12 = v11;
    uint64_t v13 = v11;
    MEMORY[0x270FA5388](v11);
    v15 = (char *)&v26 - v14;
    if ([(OISFUMemoryInputStream *)v7 readToBuffer:(char *)&v26 - v14 size:v13] == v12)
    {
      uint64_t v16 = [[OISFUCryptor alloc] initWithKey:a3 operation:1 iv:v15 ivLength:v13 usePKCS7Padding:v8 == 1];
      uint64_t v17 = 0;
      uint64_t v28 = 0;
      uint64_t v29 = 0;
      do
      {
        uint64_t v18 = v17;
        BOOL v19 = [(OISFUCryptor *)v16 cryptDataFromStream:v7 toBuffer:&data[v17] length:64 - v17 bytesRead:&v29 error:&v28];
        uint64_t v17 = v29 + v18;
      }
      while (v19 && v29 != 0);

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
  int v9 = [[OISFUFileInputStream alloc] initWithPath:a3 offset:0];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = [[OISFUCryptoInputStream alloc] initForDecryptionWithInputStream:v9 key:a4];

    if (!v7)
    {
      if (!v11) {
        return 0;
      }
LABEL_10:
      uint64_t v13 = [[OISFUBufferedInputStream alloc] initWithStream:v11];

      return v13;
    }
  }
  else
  {
    if (!v7) {
      return 0;
    }
    uint64_t v11 = 0;
  }
  int v12 = v11;
  uint64_t v11 = [[OISFUZipInflateInputStream alloc] initWithInput:v11];

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
  uint64_t v10 = (void *)[a5 entryWithName:a3];
  if (v10 && (uint64_t v11 = [v10 inputStream]) != 0)
  {
    int v12 = [[OISFUCryptoInputStream alloc] initForDecryptionWithInputStream:v11 key:a4];
    if (!v8) {
      goto LABEL_4;
    }
  }
  else
  {
    int v12 = 0;
    if (!v8)
    {
LABEL_4:
      if (!v12) {
        return 0;
      }
LABEL_11:
      uint64_t v14 = [[OISFUBufferedInputStream alloc] initWithStream:v12];

      return v14;
    }
  }
  uint64_t v13 = [[OISFUZipInflateInputStream alloc] initWithInput:v12];

  if (v13)
  {
    if (a7) {
      *a7 = v13;
    }
    int v12 = v13;
    goto LABEL_11;
  }
  return 0;
}

+ (id)encodePassphraseHint:(id)a3
{
  return (id)[a3 dataUsingEncoding:4];
}

+ (id)decodePassphraseHint:(id)a3
{
  id result = (id)[a3 length];
  if (result)
  {
    uint64_t v5 = objc_msgSend([NSString alloc], "initWithBytes:length:encoding:", objc_msgSend(a3, "bytes"), result, 4);
    return v5;
  }
  return result;
}

+ (id)sha256HashFromData:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v4 = CC_SHA256_Init(&v7);
  if ((unint64_t)[a3 length] >> 32)
  {
    uint64_t v5 = [NSString stringWithUTF8String:"+[OISFUCryptoUtils sha256HashFromData:]"];
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/sf/SFUCryptoUtils.mm"], 416, 0, "overflow  in sha256HashFromData");
    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  if (v4
    && CC_SHA256_Update(&v7, (const void *)[a3 bytes], objc_msgSend(a3, "length"))
    && CC_SHA256_Final(md, &v7))
  {
    return (id)[MEMORY[0x263EFF8F8] dataWithBytes:md length:32];
  }
  else
  {
    return 0;
  }
}

+ (id)sha256HashFromStorage:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v4 = CC_SHA256_Init(&c);
  uint64_t v5 = (void *)[a3 bufferedInputStream];
  [v5 disableSystemCaching];
  data = 0;
  if (!v4) {
    return 0;
  }
  while (1)
  {
    uint64_t v6 = [v5 readToOwnBuffer:&data size:0xFFFFFFFFLL];
    if (!v6) {
      break;
    }
    if (!CC_SHA256_Update(&c, data, v6)) {
      return 0;
    }
  }
  if (CC_SHA256_Final(md, &c)) {
    return (id)[MEMORY[0x263EFF8F8] dataWithBytes:md length:32];
  }
  else {
    return 0;
  }
}

+ (id)sha256HashFromString:(id)a3
{
  uint64_t v4 = [a3 dataUsingEncoding:4];
  return (id)[a1 sha256HashFromData:v4];
}

+ (id)sha1HashFromStorage:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v4 = CC_SHA1_Init(&c);
  uint64_t v5 = (void *)[a3 bufferedInputStream];
  [v5 disableSystemCaching];
  data = 0;
  if (!v4) {
    return 0;
  }
  while (1)
  {
    uint64_t v6 = [v5 readToOwnBuffer:&data size:0xFFFFFFFFLL];
    if (!v6) {
      break;
    }
    if (!CC_SHA1_Update(&c, data, v6)) {
      return 0;
    }
  }
  if (CC_SHA1_Final(md, &c)) {
    return (id)[MEMORY[0x263EFF8F8] dataWithBytes:md length:20];
  }
  else {
    return 0;
  }
}

@end