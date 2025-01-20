@interface NSString(TRI)
+ (id)triHashStrings:()TRI withDataSalt:;
+ (uint64_t)triNullableStringsAreEqualWithString:()TRI andOther:;
- (id)triFilenameForFactorName;
- (id)triHashWithDataSalt:()TRI;
- (id)triHashWithIntegerSalt:()TRI;
- (id)triSanitizedPathComponentWithMaxLength:()TRI addHash:error:;
- (id)triStringByResolvingSymlinksInPath;
- (id)triTrim;
- (uint64_t)triIsPathSafe;
- (uint64_t)triIsPathSafePlausibleUniqueId;
- (uint64_t)triJavaHash;
@end

@implementation NSString(TRI)

- (id)triSanitizedPathComponentWithMaxLength:()TRI addHash:error:
{
  v44[1] = *MEMORY[0x1E4F143B8];
  v10 = (void *)MEMORY[0x19F3AD060]();
  v11 = [a1 dataUsingEncoding:1 allowLossyConversion:1];
  if (v11)
  {
    uint64_t v12 = [[NSString alloc] initWithData:v11 encoding:1];
    if (v12)
    {
      v13 = (void *)v12;
      if (qword_1EB3B78B0 != -1) {
        dispatch_once(&qword_1EB3B78B0, &__block_literal_global_16);
      }
      v14 = [v13 componentsSeparatedByCharactersInSet:_MergedGlobals_13];
      v15 = [v14 componentsJoinedByString:&stru_1EEFB6D68];

      if (!a4 || [a1 isEqualToString:v15])
      {
        if (!a3)
        {
LABEL_32:
          id v25 = v15;

          v28 = v25;
          goto LABEL_33;
        }
        if ([v15 length] > a3)
        {
          if (a4) {
            goto LABEL_10;
          }
          uint64_t v40 = a2;
          v29 = NSString;
          v30 = [v15 substringToIndex:a3 - 1];
          uint64_t v31 = [v29 stringWithFormat:@"%@#", v30];

          v15 = (void *)v31;
          a2 = v40;
        }
LABEL_26:
        unint64_t v32 = [v15 length];
        unint64_t v33 = 8;
        if (!a4) {
          unint64_t v33 = 0;
        }
        if (v33 <= a3) {
          unint64_t v33 = a3;
        }
        if (v32 > v33)
        {
          v35 = [MEMORY[0x1E4F28B00] currentHandler];
          uint64_t v36 = a2;
          v37 = v35;
          [v35 handleFailureInMethod:v36 object:a1 file:@"NSString+TRI.m" lineNumber:125 description:@"sanitized string is longer than expected"];
        }
        goto LABEL_32;
      }
LABEL_10:
      uint64_t v39 = a2;
      int v38 = [a1 triJavaHash];
      v16 = v15;
      v17 = v16;
      v18 = v16;
      if (a3)
      {
        if (a3 < 8)
        {
          v18 = &stru_1EEFB6D68;
        }
        else
        {
          unint64_t v19 = [(__CFString *)v16 length];
          if (v19 >= a3 - 8) {
            unint64_t v20 = a3 - 8;
          }
          else {
            unint64_t v20 = v19;
          }
          v18 = [(__CFString *)v17 substringToIndex:v20];
        }
      }
      v15 = [NSString stringWithFormat:@"%@#%07x", v18, v38 & 0xFFFFFFF];

      a2 = v39;
      if (!a3) {
        goto LABEL_32;
      }
      goto LABEL_26;
    }
    if (a5)
    {
      v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v41 = *MEMORY[0x1E4F28568];
      v42 = @"could not create string from ASCII encoded data";
      v22 = (void *)MEMORY[0x1E4F1C9E8];
      v23 = &v42;
      v24 = &v41;
      goto LABEL_20;
    }
LABEL_21:
    v28 = 0;
    goto LABEL_34;
  }
  if (!a5) {
    goto LABEL_21;
  }
  v21 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v43 = *MEMORY[0x1E4F28568];
  v44[0] = @"could not get data from string";
  v22 = (void *)MEMORY[0x1E4F1C9E8];
  v23 = (__CFString **)v44;
  v24 = &v43;
LABEL_20:
  id v25 = [v22 dictionaryWithObjects:v23 forKeys:v24 count:1];
  uint64_t v26 = [v21 errorWithDomain:@"TRIGeneralErrorDomain" code:2 userInfo:v25];
  v27 = *a5;
  *a5 = (void *)v26;

  v28 = 0;
LABEL_33:

LABEL_34:
  return v28;
}

- (uint64_t)triIsPathSafePlausibleUniqueId
{
  uint64_t result = [a1 triIsPathSafe];
  if (result) {
    return (unint64_t)[a1 length] > 5;
  }
  return result;
}

- (uint64_t)triIsPathSafe
{
  uint64_t result = [a1 length];
  if (result) {
    return ([a1 containsString:@"/"] & 1) == 0
  }
        && ([a1 containsString:&stru_1EEFBA828] & 1) == 0
        && [a1 UTF8String] != 0;
  return result;
}

- (id)triHashWithIntegerSalt:()TRI
{
  uint64_t v7 = a3;
  v4 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v7 length:8];
  v5 = [a1 triHashWithDataSalt:v4];

  return v5;
}

- (id)triHashWithDataSalt:()TRI
{
  id v4 = a3;
  v5 = [a1 dataUsingEncoding:4];
  v6 = objc_msgSend(MEMORY[0x1E4F1CA58], "dataWithCapacity:", objc_msgSend(v5, "length") + objc_msgSend(v4, "length"));
  [v6 appendData:v4];

  [v6 appendData:v5];
  uint64_t v7 = [MEMORY[0x1E4F1CA58] dataWithLength:32];
  id v8 = v6;
  v9 = (const void *)[v8 bytes];
  CC_LONG v10 = [v8 length];
  id v11 = v7;
  CC_SHA256(v9, v10, (unsigned __int8 *)[v11 mutableBytes]);
  id v12 = objc_alloc(MEMORY[0x1E4F29128]);
  id v13 = v11;
  v14 = objc_msgSend(v12, "initWithUUIDBytes:", objc_msgSend(v13, "bytes"));

  return v14;
}

+ (id)triHashStrings:()TRI withDataSalt:
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, a1, @"NSString+TRI.m", 38, @"Invalid parameter not satisfying: %@", @"strings" object file lineNumber description];
  }
  v9 = (void *)MEMORY[0x19F3AD060]();
  memset(&c, 0, sizeof(c));
  CC_SHA256_Init(&c);
  if (v8)
  {
    id v10 = v8;
    CC_SHA256_Update(&c, (const void *)[v10 bytes], objc_msgSend(v10, "length"));
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        v17 = (void *)MEMORY[0x19F3AD060]();
        v18 = [v16 dataUsingEncoding:4];
        unint64_t v19 = v18;
        if (v18)
        {
          id v20 = v18;
          CC_SHA256_Update(&c, (const void *)[v20 bytes], objc_msgSend(v20, "length"));
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v13);
  }

  id v21 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:32];
  if (![v21 mutableBytes])
  {
    id v25 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
    objc_exception_throw(v25);
  }
  id v22 = v21;
  CC_SHA256_Final((unsigned __int8 *)[v22 mutableBytes], &c);

  return v22;
}

- (uint64_t)triJavaHash
{
  if (![a1 length]) {
    return 0;
  }
  unint64_t v2 = 0;
  LODWORD(v3) = 0;
  do
    uint64_t v3 = [a1 characterAtIndex:v2++] - v3 + 32 * v3;
  while (v2 < [a1 length]);
  return v3;
}

- (id)triFilenameForFactorName
{
  id v7 = 0;
  id v4 = [a1 triSanitizedPathComponentWithMaxLength:50 addHash:1 error:&v7];
  if (!v4)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, a1, @"NSString+TRI.m", 136, @"Failed to sanitize factor name \"%@\": %@", a1, v7 object file lineNumber description];
  }
  return v4;
}

- (id)triTrim
{
  unint64_t v2 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  uint64_t v3 = [a1 stringByTrimmingCharactersInSet:v2];

  return v3;
}

- (id)triStringByResolvingSymlinksInPath
{
  v10[3] = *MEMORY[0x1E4F143B8];
  v1 = [a1 stringByResolvingSymlinksInPath];
  if ([v1 hasPrefix:@"/var/"])
  {
    unint64_t v2 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v9 = 0;
    uint64_t v3 = [v2 destinationOfSymbolicLinkAtPath:@"/var" error:&v9];
    id v4 = v9;

    if (v3)
    {
      v5 = [v1 substringFromIndex:objc_msgSend(@"/var/", "length")];

      v6 = NSString;
      v10[0] = @"/";
      v10[1] = v3;
      v10[2] = v5;
      id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:3];
      v1 = [v6 pathWithComponents:v7];
    }
  }
  return v1;
}

+ (uint64_t)triNullableStringsAreEqualWithString:()TRI andOther:
{
  unint64_t v5 = a3;
  unint64_t v6 = a4;
  id v7 = (void *)v6;
  if (v5 | v6)
  {
    uint64_t v8 = 0;
    if (v5 && v6) {
      uint64_t v8 = [(id)v5 isEqualToString:v6];
    }
  }
  else
  {
    uint64_t v8 = 1;
  }

  return v8;
}

@end