@interface NSData(TRI)
+ (id)triVerifiedMappedDataWithFile:()TRI error:;
- (id)triHexlify;
- (id)triSha256;
- (id)triSha256Base64String;
@end

@implementation NSData(TRI)

- (id)triSha256
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:32];
  id v3 = a1;
  v4 = (const void *)[v3 bytes];
  CC_LONG v5 = [v3 length];
  id v6 = v2;
  v7 = (unsigned __int8 *)[v6 mutableBytes];
  if (!v7)
  {
    id v9 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
    objc_exception_throw(v9);
  }
  CC_SHA256(v4, v5, v7);
  return v6;
}

- (id)triSha256Base64String
{
  v1 = [a1 triSha256];
  v2 = [v1 base64EncodedStringWithOptions:0];

  return v2;
}

- (id)triHexlify
{
  uint64_t v4 = [a1 length];
  uint64_t v5 = 2 * v4;
  id v6 = (char *)malloc_type_malloc(2 * v4, 0x19C0FF2BuLL);
  if (!v6)
  {
    id v19 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
    objc_exception_throw(v19);
  }
  v7 = v6;
  id v8 = a1;
  id v9 = (unsigned __int8 *)[v8 bytes];
  if (v4)
  {
    v10 = v7 + 1;
    do
    {
      unsigned int v12 = *v9++;
      unsigned int v11 = v12;
      unsigned int v13 = v12 & 0xF;
      if (v12 >= 0xA0) {
        char v14 = 87;
      }
      else {
        char v14 = 48;
      }
      *(v10 - 1) = v14 + (v11 >> 4);
      if (v13 >= 0xA) {
        char v15 = 87;
      }
      else {
        char v15 = 48;
      }
      unsigned char *v10 = v15 + v13;
      v10 += 2;
      --v4;
    }
    while (v4);
  }
  v16 = (void *)[[NSString alloc] initWithBytesNoCopy:v7 length:v5 encoding:1 freeWhenDone:1];
  if (!v16)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, v8, @"NSData+TRI.m", 54, @"Invalid parameter not satisfying: %@", @"result" object file lineNumber description];
  }
  return v16;
}

+ (id)triVerifiedMappedDataWithFile:()TRI error:
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x19F3AD060]();
  id v7 = v5;
  int v8 = open((const char *)[v7 fileSystemRepresentation], 0);
  if (v8 < 0)
  {
    id v15 = [NSString alloc];
    v16 = __error();
    v17 = strerror(*v16);
    v18 = (void *)[v15 initWithFormat:@"Failed to open \"%@\": %s (%d)", v7, v17, *__error()];
    if (a4)
    {
      id v19 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v20 = *MEMORY[0x1E4F28798];
      uint64_t v21 = *__error();
      uint64_t v44 = *MEMORY[0x1E4F28568];
      v45[0] = v18;
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:&v44 count:1];
      uint64_t v23 = [v19 initWithDomain:v20 code:v21 userInfo:v22];
      id v24 = *a4;
      *a4 = (id)v23;
    }
LABEL_17:
    v35 = 0;
    goto LABEL_18;
  }
  int v9 = v8;
  id v10 = (id) [objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:0x10000];
  uint64_t v11 = [v10 mutableBytes];
  if (!v11)
  {
    id v39 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
    objc_exception_throw(v39);
  }
  unsigned int v12 = (void *)v11;
  while (1)
  {
    ssize_t v13 = read(v9, v12, [v10 length]);
    ssize_t v14 = v13;
    if (v13 < 0) {
      break;
    }
    if (!v13) {
      goto LABEL_13;
    }
  }
  id v25 = [NSString alloc];
  v26 = __error();
  v27 = strerror(*v26);
  v28 = (void *)[v25 initWithFormat:@"Error while read-verifying \"%@\": %s (%d)", v7, v27, *__error()];
  if (a4)
  {
    id v40 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v29 = *MEMORY[0x1E4F28798];
    uint64_t v30 = *__error();
    uint64_t v42 = *MEMORY[0x1E4F28568];
    v43 = v28;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
    v32 = v31 = v6;
    uint64_t v33 = [v40 initWithDomain:v29 code:v30 userInfo:v32];
    id v34 = *a4;
    *a4 = (id)v33;

    id v6 = v31;
  }

LABEL_13:
  close(v9);

  if (v14 < 0) {
    goto LABEL_17;
  }
  id v41 = 0;
  v35 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v7 options:8 error:&v41];
  id v36 = v41;
  id v37 = v41;
  if (a4) {
    objc_storeStrong(a4, v36);
  }

LABEL_18:
  return v35;
}

@end