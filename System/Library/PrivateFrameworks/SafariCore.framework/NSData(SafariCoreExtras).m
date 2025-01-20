@interface NSData(SafariCoreExtras)
+ (id)safari_dataWithHexString:()SafariCoreExtras;
- (BOOL)safari_dataAppearsToBeCompressed;
- (id)safari_SHA1Hash;
- (id)safari_dataByAppendingData:()SafariCoreExtras;
- (id)safari_dataByCompressingData;
- (id)safari_dataByDecompressingData;
- (id)safari_descriptionWithoutSpaces;
- (id)safari_scryptHashWithSalt:()SafariCoreExtras N:r:p:keyLength:;
- (uint64_t)safari_hashMD5;
@end

@implementation NSData(SafariCoreExtras)

- (id)safari_dataByCompressingData
{
  if ([a1 length])
  {
    id v2 = a1;
    v8.avail_in = objc_msgSend(v2, "length", objc_msgSend(v2, "bytes"), (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, 0);
    id v3 = 0;
    if (!deflateInit_(&v8, 9, "1.2.12", 112))
    {
      objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:", deflateBound(&v8, objc_msgSend(v2, "length")));
      id v4 = objc_claimAutoreleasedReturnValue();
      v8.next_out = (Bytef *)[v4 mutableBytes];
      v8.avail_out = [v4 length];
      int v5 = deflate(&v8, 4);
      deflateEnd(&v8);
      if (v5 == 1)
      {
        uint64_t v6 = [v4 length];
        [v4 setLength:v6 - v8.avail_out];
        id v3 = v4;
      }
      else
      {
        id v3 = 0;
      }
    }
  }
  else
  {
    id v3 = [MEMORY[0x1E4F1C9B8] data];
  }
  return v3;
}

- (id)safari_dataByDecompressingData
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([a1 length])
  {
    memset(&strm.avail_in, 0, 104);
    id v2 = a1;
    strm.next_in = (Bytef *)[v2 bytes];
    strm.avail_in = [v2 length];
    id v3 = 0;
    if (!inflateInit_(&strm, "1.2.12", 112))
    {
      id v4 = [MEMORY[0x1E4F1CA58] data];
      while (1)
      {
        strm.avail_out = 0x10000;
        strm.next_out = v7;
        if (inflate(&strm, 0) >= 2) {
          break;
        }
        [v4 appendBytes:v7 length:0x10000 - strm.avail_out];
        if (strm.avail_out)
        {
          inflateEnd(&strm);
          id v3 = v4;
          goto LABEL_9;
        }
      }
      inflateEnd(&strm);
      id v3 = 0;
LABEL_9:
    }
  }
  else
  {
    id v3 = [MEMORY[0x1E4F1C9B8] data];
  }
  return v3;
}

- (BOOL)safari_dataAppearsToBeCompressed
{
  if ((unint64_t)[a1 length] >= 2
    && ([a1 getBytes:&v3 length:2], (v3 & 0x8F) == 8))
  {
    return (unsigned __int16)(31711 * (bswap32(v3) >> 16)) < 0x843u;
  }
  else
  {
    return 0;
  }
}

- (uint64_t)safari_hashMD5
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  CC_MD5((const void *)[v1 bytes], objc_msgSend(v1, "length"), md);
  if (v4 >= 0) {
    return v4;
  }
  else {
    return -v4;
  }
}

- (id)safari_SHA1Hash
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  id v2 = CC_SHA1((const void *)[v1 bytes], objc_msgSend(v1, "length"), md);
  if (v2)
  {
    id v2 = [MEMORY[0x1E4F1C9B8] dataWithBytes:md length:20];
  }
  return v2;
}

- (id)safari_scryptHashWithSalt:()SafariCoreExtras N:r:p:keyLength:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  int64_t v13 = ccscrypt_storage_size();
  if (v13 <= 0)
  {
    v21 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349568;
      uint64_t v26 = a4;
      __int16 v27 = 1026;
      int v28 = a5;
      __int16 v29 = 1026;
      int v30 = a6;
      _os_log_error_impl(&dword_1B728F000, v21, OS_LOG_TYPE_ERROR, "Invalid scrypt parameters N: %{public}llu, r: %{public}u, p: %{public}u.", buf, 0x18u);
    }
    v20 = 0;
  }
  else
  {
    v14 = malloc_type_malloc(v13, 0x26C1784BuLL);
    v15 = malloc_type_malloc(a7, 0x3DD5B4F7uLL);
    v16 = objc_alloc_init(WBSScopeExitHandler);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __70__NSData_SafariCoreExtras__safari_scryptHashWithSalt_N_r_p_keyLength___block_invoke;
    v24[3] = &__block_descriptor_48_e5_v8__0l;
    v24[4] = v14;
    v24[5] = v15;
    v23 = v16;
    [(WBSScopeExitHandler *)v16 setHandler:v24];
    [a1 length];
    [a1 bytes];
    [v12 length];
    [v12 bytes];
    int v17 = ccscrypt();
    if (v17)
    {
      int v18 = v17;
      v19 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[NSData(SafariCoreExtras) safari_scryptHashWithSalt:N:r:p:keyLength:](v18, v19);
      }
      v20 = 0;
    }
    else
    {
      v20 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v15, a7, a7, v15);
    }
  }
  return v20;
}

- (id)safari_descriptionWithoutSpaces
{
  id v1 = objc_msgSend(NSString, "safari_stringAsHexWithData:", a1);
  id v2 = [NSString stringWithFormat:@"<%@>", v1];
  unsigned __int16 v3 = [v2 lowercaseString];

  return v3;
}

- (id)safari_dataByAppendingData:()SafariCoreExtras
{
  id v4 = a3;
  uint64_t v5 = (void *)[a1 mutableCopy];
  [v5 appendData:v4];

  return v5;
}

+ (id)safari_dataWithHexString:()SafariCoreExtras
{
  unsigned __int16 v3 = (void *)MEMORY[0x1E4F28B88];
  id v4 = a3;
  uint64_t v5 = [v3 characterSetWithCharactersInString:@"0123456789abcdefABCDEF"];
  uint64_t v6 = [v5 invertedSet];

  v7 = objc_msgSend(v4, "safari_stringByRemovingCharactersInSet:", v6);

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  id v9 = v7;
  [v9 UTF8String];
  if ([v9 length] != 1)
  {
    unint64_t v10 = 0;
    do
    {
      __strlcpy_chk();
      char v12 = 0;
      char v12 = strtol(__str, 0, 16);
      [v8 appendBytes:&v12 length:1];
      v10 += 2;
    }
    while (v10 < [v9 length] - 1);
  }

  return v8;
}

- (void)safari_scryptHashWithSalt:()SafariCoreExtras N:r:p:keyLength:.cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67240192;
  v2[1] = a1;
  _os_log_error_impl(&dword_1B728F000, a2, OS_LOG_TYPE_ERROR, "Scrypt failed with error: %{public}d", (uint8_t *)v2, 8u);
}

@end