@interface ACFCryptograph
- (id)compactDataFromPropertyList:(id)a3;
- (id)compressData:(id)a3;
- (id)decodeBase16:(id)a3;
- (id)decodeBase64:(id)a3;
- (id)decodeStringWithObscuredData:(id)a3;
- (id)decrypt3DESCBCData:(id)a3 withKey:(id)a4;
- (id)decryptAES128CBCData:(id)a3 withKey:(id)a4 initializationVector:(id)a5 pading:(BOOL)a6;
- (id)encodeBase16:(id)a3;
- (id)encodeBase64:(id)a3;
- (id)encodeObscuredDataWithString:(id)a3 length:(unint64_t)a4;
- (id)encrypt3DESCBCData:(id)a3 withKey:(id)a4 pading:(BOOL)a5;
- (id)encryptAES128CBCData:(id)a3 withKey:(id)a4 initializationVector:(id)a5 pading:(BOOL)a6;
- (id)encryptData:(id)a3 withKey:(__SecKey *)a4;
- (id)hashDataSHA1WithString:(id)a3;
- (id)hashDataSHA256WithData:(id)a3;
- (id)hashStringSHA1WithString:(id)a3;
- (id)hashStringSHA256WithString:(id)a3;
- (id)hmac256DataWithData:(id)a3 key:(id)a4;
- (id)randomDataOfLength:(unint64_t)a3;
- (id)randomStringOfLength:(unint64_t)a3;
- (id)sha1ContextFinalize:(id)a3;
- (id)signatureForData:(id)a3 withKey:(__SecKey *)a4;
- (void)clearKey:(id)a3;
- (void)fillEncryptionSuffix:(id)a3;
- (void)fillHMACSuffix:(id)a3;
- (void)setLength:(unint64_t)a3 toData:(id)a4;
- (void)sha1Context:(id)a3 updateWithData:(id)a4;
@end

@implementation ACFCryptograph

- (id)encryptData:(id)a3 withKey:(__SecKey *)a4
{
  size_t cipherTextLen = 0;
  uint64_t v6 = [a3 length];
  if (a4
    && v6
    && (unint64_t v7 = [a3 length], BlockSize = SecKeyGetBlockSize(a4), cipherTextLen = BlockSize, v7 <= BlockSize))
  {
    v10 = (uint8_t *)malloc_type_malloc(BlockSize, 0x988C9ED2uLL);
    if (v10)
    {
      v11 = v10;
      OSStatus v12 = SecKeyEncrypt(a4, 1u, (const uint8_t *)[a3 bytes], [a3 length], v10, &cipherTextLen);
      v9 = (void *)[MEMORY[0x263EFF8F8] dataWithBytes:v11 length:cipherTextLen];
      free(v11);
      BOOL v13 = v12 == 0 && v9 != 0;
      if (!v13) {
        v9 = 0;
      }
      if (v13 || !ACFLog) {
        goto LABEL_16;
      }
      if ((ACFLogSettingsGetLevelMask() & 8) != 0) {
        ACFLog(3, (uint64_t)"-[ACFCryptograph encryptData:withKey:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFCryptograph.m", 52, 0, "Failed to encrypt random key with public key. Status - %d");
      }
    }
  }
  else
  {
    if (!ACFLog) {
      return 0;
    }
    if ((ACFLogSettingsGetLevelMask() & 8) != 0) {
      ACFLog(3, (uint64_t)"-[ACFCryptograph encryptData:withKey:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFCryptograph.m", 58, 0, "Invalid parameters");
    }
  }
  v9 = 0;
LABEL_16:
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
    ACFLog(7, (uint64_t)"-[ACFCryptograph encryptData:withKey:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFCryptograph.m", 60, 0, "SIZE TEST: Encrypted random key size is %d", [v9 length]);
  }
  return v9;
}

- (id)signatureForData:(id)a3 withKey:(__SecKey *)a4
{
  if (!a3 || !a4 || (unint64_t BlockSize = SecKeyGetBlockSize(a4), sigLen = BlockSize, BlockSize < [a3 length]))
  {
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 8) != 0) {
        ACFLog(3, (uint64_t)"-[ACFCryptograph signatureForData:withKey:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFCryptograph.m", 89, 0, "Invalid parameters");
      }
    }
    return 0;
  }
  id result = malloc_type_malloc(BlockSize, 0x78F43951uLL);
  if (result)
  {
    id v8 = result;
    OSStatus v9 = SecKeyRawSign(a4, 0, (const uint8_t *)[a3 bytes], [a3 length], (uint8_t *)result, &sigLen);
    uint64_t v10 = [MEMORY[0x263EFF8F8] dataWithBytes:v8 length:sigLen];
    free(v8);
    id result = v9 == 0 && v10 != 0 ? (id)v10 : 0;
    if ((v9 != 0 || v10 == 0) && ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 8) != 0) {
        ACFLog(3, (uint64_t)"-[ACFCryptograph signatureForData:withKey:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFCryptograph.m", 83, 0, "Failed to generate sign. Status - %d");
      }
      return 0;
    }
  }
  return result;
}

- (id)decodeBase64:(id)a3
{
  return ACFDecodeBase64(a3);
}

- (id)encodeBase64:(id)a3
{
  return (id)ACFEncodeBase64((uint64_t)a3);
}

- (id)decodeBase16:(id)a3
{
  return (id)ACFDecodeBase16(a3);
}

- (id)encodeBase16:(id)a3
{
  return (id)ACFEncodeBase16(a3);
}

- (id)decodeStringWithObscuredData:(id)a3
{
  return (id)ACFDecodeObscuredString(a3);
}

- (id)encodeObscuredDataWithString:(id)a3 length:(unint64_t)a4
{
  return ACFEncodeObscuredString(a3, a4);
}

- (id)hashStringSHA256WithString:(id)a3
{
  v3 = ACFSHA256AsString((void *)[a3 dataUsingEncoding:4]);

  return (id)[v3 lowercaseString];
}

- (id)hashDataSHA256WithData:(id)a3
{
  return (id)ACFSHA256(a3);
}

- (id)hashDataSHA1WithString:(id)a3
{
  return (id)ACFSHA1(a3);
}

- (id)hashStringSHA1WithString:(id)a3
{
  return ACFSHA1AsString(a3);
}

- (id)randomDataOfLength:(unint64_t)a3
{
  return ACFRandomData(a3);
}

- (id)randomStringOfLength:(unint64_t)a3
{
  return (id)ACFRandomString(a3);
}

- (id)encryptAES128CBCData:(id)a3 withKey:(id)a4 initializationVector:(id)a5 pading:(BOOL)a6
{
  return (id)ACFAES128_CBC_Encrypt(a3, a4, a5, a6);
}

- (id)decryptAES128CBCData:(id)a3 withKey:(id)a4 initializationVector:(id)a5 pading:(BOOL)a6
{
  return (id)ACFAES128_CBC_Decrypt(a3, a4, a5, a6);
}

- (id)encrypt3DESCBCData:(id)a3 withKey:(id)a4 pading:(BOOL)a5
{
  return (id)ACF3DES_CBC_Encrypt(a3, a4, a5);
}

- (id)decrypt3DESCBCData:(id)a3 withKey:(id)a4
{
  return (id)ACF3DES_CBC_Decrypt(a3, a4);
}

- (id)hmac256DataWithData:(id)a3 key:(id)a4
{
  return (id)ACFHmacSHA256(a3, a4);
}

- (void)fillEncryptionSuffix:(id)a3
{
  if (a3)
  {
    [a3 setLength:16];
    qmemcpy((void *)[a3 mutableBytes], "HARDCODEDKEY1321", 16);
  }
  else
  {
    [((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler")) handleFailureInMethod:a2 object:self file:@"ACFCryptograph.m" lineNumber:183 description:@"Invalid parameter not satisfying: %@", @"nil != outKey1"];
  }
}

- (void)fillHMACSuffix:(id)a3
{
  if (a3)
  {
    [a3 setLength:16];
    qmemcpy((void *)[a3 mutableBytes], "HARDCODEDKEY2abc", 16);
  }
  else
  {
    [((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler")) handleFailureInMethod:a2 object:self file:@"ACFCryptograph.m" lineNumber:209 description:@"Invalid parameter not satisfying: %@", @"nil != outKey1"];
  }
}

- (void)clearKey:(id)a3
{
  if (a3)
  {
    v4 = (unsigned char *)[a3 mutableBytes];
    for (uint64_t i = [a3 length]; i; --i)
      *v4++ = 0;
    [a3 setLength:0];
  }
  else
  {
    [((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler")) handleFailureInMethod:a2 object:self file:@"ACFCryptograph.m" lineNumber:235 description:@"Invalid parameter not satisfying: %@", @"nil != outKey"];
  }
}

- (id)compactDataFromPropertyList:(id)a3
{
  uint64_t v3 = [MEMORY[0x263F08AC0] dataWithPropertyList:a3 format:100 options:0 error:0];
  id v4 = (id)[[NSString alloc] initWithData:v3 encoding:4];
  v5 = [[(id)[v4 componentsSeparatedByCharactersInSet:[MEMORY[0x263F08708] characterSetWithCharactersInString:@"\t\n"]] componentsJoinedByString:&stru_26F261788];

  return (id)[v5 dataUsingEncoding:4];
}

- (id)compressData:(id)a3
{
  if (!a3)
  {
    [objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"ACFCryptograph.m", 264, @"Invalid parameter not satisfying: %@", @"nil != plainData");
    return 0;
  }
  uLongf destLen = compressBound([a3 length]);
  id result = (id)[MEMORY[0x263EFF990] dataWithLength:destLen];
  if (result)
  {
    id v5 = result;
    int v6 = compress2((Bytef *)[result mutableBytes], &destLen, (const Bytef *)[a3 bytes], [a3 length], 9);
    if (v6)
    {
      if (ACFLog)
      {
        int v7 = v6;
        if ((ACFLogSettingsGetLevelMask() & 8) != 0) {
          ACFLog(3, (uint64_t)"-[ACFCryptograph compressData:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Foundation/Sources/ACFCryptograph.m", 281, 0, "Failed to compress data with error: %d", v7);
        }
      }
      return 0;
    }
    [v5 setLength:destLen];
    return (id)[v5 copy];
  }
  return result;
}

- (void)sha1Context:(id)a3 updateWithData:(id)a4
{
}

- (id)sha1ContextFinalize:(id)a3
{
  return (id)ACFSHA1Final(a3);
}

- (void)setLength:(unint64_t)a3 toData:(id)a4
{
}

@end