@interface NSData(FCAdditions)
+ (id)fc_randomDataWithLength:()FCAdditions;
- (BOOL)fc_isGzipped;
- (id)fc_URLSafeBase64EncodedStringWithOptions:()FCAdditions;
- (id)fc_decryptAESSIVWithKey:()FCAdditions additionalData:;
- (id)fc_encryptAESSIVWithKey:()FCAdditions additionalData:;
- (id)fc_gzipDeflate;
- (id)fc_gzipInflate;
- (id)fc_sha256;
- (id)fc_zlibDeflate;
- (id)fc_zlibInflate;
- (uint64_t)fc_bigEndianCompareAsUnsignedInteger:()FCAdditions;
@end

@implementation NSData(FCAdditions)

- (id)fc_sha256
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  memset(v4, 0, sizeof(v4));
  id v1 = a1;
  v2 = CC_SHA256((const void *)objc_msgSend(v1, "bytes", 0, 0, 0, 0), objc_msgSend(v1, "length"), (unsigned __int8 *)v4);
  if (v2)
  {
    v2 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v4 length:32];
  }
  return v2;
}

- (id)fc_gzipDeflate
{
  if ([a1 length])
  {
    memset(&v10.total_out, 0, 72);
    id v2 = a1;
    v10.avail_in = objc_msgSend(v2, "length", objc_msgSend(v2, "bytes"), (unsigned __int128)0, (unsigned __int128)0);
    id v3 = 0;
    if (!deflateInit2_(&v10, -1, 8, 31, 8, 0, "1.2.12", 112))
    {
      v4 = [MEMORY[0x1E4F1CA58] dataWithLength:0x4000];
      do
      {
        uLong total_out = v10.total_out;
        if (total_out >= [v4 length]) {
          [v4 increaseLengthBy:0x4000];
        }
        id v6 = v4;
        uint64_t v7 = [v6 mutableBytes];
        v10.next_out = (Bytef *)(v7 + v10.total_out);
        int v8 = [v6 length];
        v10.avail_out = v8 - LODWORD(v10.total_out);
        deflate(&v10, 4);
      }
      while (!v10.avail_out);
      deflateEnd(&v10);
      [v6 setLength:v10.total_out];
      id v3 = [MEMORY[0x1E4F1C9B8] dataWithData:v6];
    }
  }
  else
  {
    id v3 = a1;
  }
  return v3;
}

- (id)fc_URLSafeBase64EncodedStringWithOptions:()FCAdditions
{
  id v1 = objc_msgSend(a1, "base64EncodedStringWithOptions:");
  id v2 = (void *)[v1 mutableCopy];

  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @"+", @"-", 0, 0, objc_msgSend(v2, "length"));
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @"/", @"_", 0, 0, objc_msgSend(v2, "length"));
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @"=", &stru_1EF8299B8, 0, 0, objc_msgSend(v2, "length"));
  return v2;
}

- (id)fc_zlibInflate
{
  if (![a1 length])
  {
    id v6 = a1;
    goto LABEL_14;
  }
  uint64_t v2 = [a1 length];
  unint64_t v3 = [a1 length];
  v4 = [MEMORY[0x1E4F1CA58] dataWithLength:v2 + (v3 >> 1)];
  id v5 = a1;
  v14.avail_in = objc_msgSend(v5, "length", objc_msgSend(v5, "bytes"), (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, 0);
  v14.zalloc = 0;
  v14.zfree = 0;
  v14.uLong total_out = 0;
  id v6 = 0;
  if (!inflateInit2_(&v14, -15, "1.2.12", 112))
  {
    unint64_t v7 = v3 >> 1;
    do
    {
      uLong total_out = v14.total_out;
      if (total_out >= [v4 length]) {
        [v4 increaseLengthBy:v7];
      }
      id v9 = v4;
      uint64_t v10 = [v9 mutableBytes];
      v14.next_out = (Bytef *)(v10 + v14.total_out);
      int v11 = [v9 length];
      v14.avail_out = v11 - LODWORD(v14.total_out);
      int v12 = inflate(&v14, 2);
    }
    while (!v12);
    if (v12 == 1)
    {
      if (!inflateEnd(&v14))
      {
        [v9 setLength:v14.total_out];
        id v6 = [MEMORY[0x1E4F1C9B8] dataWithData:v9];
        goto LABEL_13;
      }
    }
    else
    {
      inflateEnd(&v14);
    }
    id v6 = 0;
  }
LABEL_13:

LABEL_14:
  return v6;
}

- (id)fc_zlibDeflate
{
  if ([a1 length])
  {
    memset(&v10.total_out, 0, 72);
    id v2 = a1;
    v10.avail_in = objc_msgSend(v2, "length", objc_msgSend(v2, "bytes"), (unsigned __int128)0, (unsigned __int128)0);
    id v3 = 0;
    if (!deflateInit2_(&v10, 9, 8, -15, 9, 0, "1.2.12", 112))
    {
      v4 = [MEMORY[0x1E4F1CA58] dataWithLength:0x4000];
      do
      {
        uLong total_out = v10.total_out;
        if (total_out >= [v4 length]) {
          [v4 increaseLengthBy:0x4000];
        }
        id v6 = v4;
        uint64_t v7 = [v6 mutableBytes];
        v10.next_out = (Bytef *)(v7 + v10.total_out);
        int v8 = [v6 length];
        v10.avail_out = v8 - LODWORD(v10.total_out);
        deflate(&v10, 4);
      }
      while (!v10.avail_out);
      deflateEnd(&v10);
      [v6 setLength:v10.total_out];
      id v3 = [MEMORY[0x1E4F1C9B8] dataWithData:v6];
    }
  }
  else
  {
    id v3 = a1;
  }
  return v3;
}

- (id)fc_gzipInflate
{
  if (![a1 length])
  {
    id v6 = a1;
    goto LABEL_14;
  }
  uint64_t v2 = [a1 length];
  unint64_t v3 = [a1 length];
  v4 = [MEMORY[0x1E4F1CA58] dataWithLength:v2 + (v3 >> 1)];
  id v5 = a1;
  v14.avail_in = objc_msgSend(v5, "length", objc_msgSend(v5, "bytes"), (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, 0);
  v14.zalloc = 0;
  v14.zfree = 0;
  v14.uLong total_out = 0;
  id v6 = 0;
  if (!inflateInit2_(&v14, 47, "1.2.12", 112))
  {
    unint64_t v7 = v3 >> 1;
    do
    {
      uLong total_out = v14.total_out;
      if (total_out >= [v4 length]) {
        [v4 increaseLengthBy:v7];
      }
      id v9 = v4;
      uint64_t v10 = [v9 mutableBytes];
      v14.next_out = (Bytef *)(v10 + v14.total_out);
      int v11 = [v9 length];
      v14.avail_out = v11 - LODWORD(v14.total_out);
      int v12 = inflate(&v14, 2);
    }
    while (!v12);
    if (v12 == 1)
    {
      if (!inflateEnd(&v14))
      {
        [v9 setLength:v14.total_out];
        id v6 = [MEMORY[0x1E4F1C9B8] dataWithData:v9];
        goto LABEL_13;
      }
    }
    else
    {
      inflateEnd(&v14);
    }
    id v6 = 0;
  }
LABEL_13:

LABEL_14:
  return v6;
}

- (BOOL)fc_isGzipped
{
  if ((unint64_t)[a1 length] < 2) {
    return 0;
  }
  uint64_t v2 = (unsigned __int8 *)[a1 bytes];
  int v3 = *v2;
  if (v3 != 31)
  {
    if (v3 == 120)
    {
      int v4 = v2[1];
      if (v4 == 1 || v4 == 218 || v4 == 156) {
        return 1;
      }
    }
    return 0;
  }
  return v2[1] == 139;
}

+ (id)fc_randomDataWithLength:()FCAdditions
{
  objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithLength:");
  id v4 = objc_claimAutoreleasedReturnValue();
  if (CCRandomGenerateBytes((void *)[v4 mutableBytes], a3))
  {

    id v4 = 0;
  }
  return v4;
}

- (id)fc_encryptAESSIVWithKey:()FCAdditions additionalData:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    ccaes_siv_encrypt_mode();
    [a1 length];
    int v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:ccsiv_ciphertext_size()];
    ccaes_siv_encrypt_mode();
    [v6 length];
    [v6 bytes];
    [v7 length];
    [v7 bytes];
    [a1 length];
    [a1 bytes];
    id v9 = v8;
    [v9 mutableBytes];
    if (!ccsiv_one_shot()) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_5;
    }
    id v9 = (id)objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "key != nil");
    *(_DWORD *)buf = 136315906;
    int v12 = "-[NSData(FCAdditions) fc_encryptAESSIVWithKey:additionalData:]";
    __int16 v13 = 2080;
    z_stream v14 = "NSData+FCAdditions.m";
    __int16 v15 = 1024;
    int v16 = 250;
    __int16 v17 = 2114;
    id v18 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }

LABEL_5:
  id v9 = 0;
LABEL_6:

  return v9;
}

- (id)fc_decryptAESSIVWithKey:()FCAdditions additionalData:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    ccaes_siv_encrypt_mode();
    [a1 length];
    int v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:ccsiv_plaintext_size()];
    ccaes_siv_decrypt_mode();
    [v6 length];
    [v6 bytes];
    [v7 length];
    [v7 bytes];
    [a1 length];
    [a1 bytes];
    id v9 = v8;
    [v9 mutableBytes];
    if (!ccsiv_one_shot()) {
      goto LABEL_6;
    }
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
      goto LABEL_5;
    }
    id v9 = (id)objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "key != nil");
    *(_DWORD *)buf = 136315906;
    int v12 = "-[NSData(FCAdditions) fc_decryptAESSIVWithKey:additionalData:]";
    __int16 v13 = 2080;
    z_stream v14 = "NSData+FCAdditions.m";
    __int16 v15 = 1024;
    int v16 = 275;
    __int16 v17 = 2114;
    id v18 = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }

LABEL_5:
  id v9 = 0;
LABEL_6:

  return v9;
}

- (uint64_t)fc_bigEndianCompareAsUnsignedInteger:()FCAdditions
{
  id v4 = a3;
  id v5 = a1;
  uint64_t v6 = [v5 bytes];
  id v7 = v4;
  uint64_t v8 = [v7 bytes];
  uint64_t v9 = [v5 length];
  if ([v7 length] | v9)
  {
    uint64_t v10 = 0;
    unint64_t v11 = 0;
    do
    {
      unint64_t v12 = [v5 length];
      if (v12 <= [v7 length])
      {
        unint64_t v17 = [v7 length];
        if (v17 <= [v5 length])
        {
          uint64_t v15 = *(unsigned __int8 *)(v6 + v11);
          uint64_t v16 = *(unsigned __int8 *)(v8 + v11);
        }
        else
        {
          uint64_t v18 = [v7 length];
          uint64_t v19 = [v5 length];
          uint64_t v16 = *(unsigned __int8 *)(v8 + v11);
          if (v11 >= v18 - v19) {
            uint64_t v15 = *(unsigned __int8 *)(v6 + v19 - v18 + v11);
          }
          else {
            uint64_t v15 = 0;
          }
        }
      }
      else
      {
        uint64_t v13 = [v5 length];
        uint64_t v14 = [v7 length];
        uint64_t v15 = *(unsigned __int8 *)(v6 + v11);
        if (v11 >= v13 - v14) {
          uint64_t v16 = *(unsigned __int8 *)(v8 + v14 - v13 + v11);
        }
        else {
          uint64_t v16 = 0;
        }
      }
      v20 = [NSNumber numberWithUnsignedChar:v15];
      v21 = [NSNumber numberWithUnsignedChar:v16];
      uint64_t v22 = [v20 compare:v21];

      if (v22 == 1 || v22 == -1)
      {
        char v23 = 1;
        uint64_t v10 = v22;
      }
      else
      {
        char v23 = 0;
      }
      unint64_t v24 = [v5 length];
      unint64_t v25 = [v7 length];
      if (v24 <= v25) {
        unint64_t v26 = v25;
      }
      else {
        unint64_t v26 = v24;
      }
      if (v23) {
        break;
      }
      ++v11;
    }
    while (v11 < v26);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

@end