@interface _PASLevenshtein
+ (unint64_t)distanceBetweenStrings:(id)a3 and:(id)a4;
@end

@implementation _PASLevenshtein

+ (unint64_t)distanceBetweenStrings:(id)a3 and:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v7 = (__CFString *)a3;
  v8 = (__CFString *)a4;
  unsigned int v9 = [(__CFString *)v7 length];
  unsigned int v10 = [(__CFString *)v8 length];
  if (!v9 || (unsigned int v11 = v10) == 0)
  {
    unint64_t v13 = [(__CFString *)v8 lengthOfBytesUsingEncoding:2348810496];
    unsigned int v12 = ((unint64_t)[(__CFString *)v7 lengthOfBytesUsingEncoding:2348810496] >> 2)
        + (v13 >> 2);
    goto LABEL_30;
  }
  if ([(__CFString *)v7 isEqualToString:v8])
  {
    unsigned int v12 = 0;
    goto LABEL_30;
  }
  CStringPtr = CFStringGetCStringPtr(v7, 0x600u);
  v15 = CFStringGetCStringPtr(v8, 0x600u);
  if (CStringPtr || [(__CFString *)v7 UTF8String])
  {
    if (v15) {
      goto LABEL_11;
    }
  }
  else
  {
    v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2 object:a1 file:@"_PASLevenshtein.mm" lineNumber:133 description:@"First string is not valid Unicode."];

    if (v15) {
      goto LABEL_11;
    }
  }
  if (![(__CFString *)v8 UTF8String])
  {
    v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2 object:a1 file:@"_PASLevenshtein.mm" lineNumber:134 description:@"Second string is not valid Unicode."];
  }
LABEL_11:
  if (CStringPtr || (uint64_t v16 = [(__CFString *)v7 canBeConvertedToEncoding:1], v16))
  {
    if (v15 || (uint64_t v16 = [(__CFString *)v8 canBeConvertedToEncoding:1], v16))
    {
      if (CStringPtr)
      {
        if (!v15) {
          goto LABEL_27;
        }
      }
      else
      {
        CStringPtr = (const char *)[(__CFString *)v7 UTF8String];
        if (!v15) {
LABEL_27:
        }
          v15 = (const char *)[(__CFString *)v8 UTF8String];
      }
      unsigned int v12 = levenshtein<char>((uint64_t)CStringPtr, (uint64_t)v15, v9, v11);
      goto LABEL_30;
    }
  }
  uint64_t v17 = v11;
  size_t v18 = 4 * v11;
  if (v18 + 4 * v9 > 0x7CF)
  {
    v28 = [(__CFString *)v7 dataUsingEncoding:2348810496];
    v29 = [(__CFString *)v8 dataUsingEncoding:2348810496];
    unint64_t v30 = [v28 length];
    unint64_t v31 = [v29 length];
    id v32 = v28;
    uint64_t v33 = [v32 bytes];
    id v34 = v29;
    unsigned int v12 = levenshtein<unsigned int>(v33, [v34 bytes], v30 >> 2, v31 >> 2);
  }
  else
  {
    uint64_t v19 = v9;
    size_t v20 = 4 * v9;
    memptr = 0;
    uint64_t v44 = 0;
    if ((v20 | 3) > 0x7D0)
    {
      uint64_t v23 = malloc_type_posix_memalign(&memptr, 8uLL, v20, 0xC0947BEFuLL);
      LOBYTE(v44) = 0;
      if (v23)
      {
        id v39 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
        objc_exception_throw(v39);
      }
      v22 = (char *)memptr;
    }
    else
    {
      MEMORY[0x1F4188790](v16);
      v22 = (char *)&v42[-1] - ((v21 + 15) & 0x7FFFFFFF0);
      bzero(v22, v21);
      memptr = v22;
      LOBYTE(v44) = 1;
    }
    uint64_t v24 = v44;
    memptr = 0;
    uint64_t v44 = 0;
    if ((v18 | 3) > 0x7D0)
    {
      int v38 = malloc_type_posix_memalign(&memptr, 8uLL, v18, 0xDA2A97C6uLL);
      LOBYTE(v44) = 0;
      if (v38)
      {
        id v40 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
        objc_exception_throw(v40);
      }
      v26 = (char *)memptr;
    }
    else
    {
      MEMORY[0x1F4188790](v23);
      v26 = (char *)&v42[-1] - ((v25 + 15) & 0x7FFFFFFF0);
      bzero(v26, v25);
      memptr = v26;
      LOBYTE(v44) = 1;
    }
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __46___PASLevenshtein_distanceBetweenStrings_and___block_invoke;
    v42[3] = &__block_descriptor_64_e5_v8__0l;
    v42[4] = v22;
    v42[5] = v24;
    v42[6] = v26;
    v42[7] = v44;
    v27 = (void (**)(void))MEMORY[0x1A6245320](v42);
    memptr = 0;
    unint64_t v41 = 0;
    -[__CFString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](v7, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v22, v20, &memptr, 2348810496, 0, 0, v19, 0);
    -[__CFString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](v8, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", v26, v18, &v41, 2348810496, 0, 0, v17, 0);
    unsigned int v12 = levenshtein<unsigned int>((uint64_t)v22, (uint64_t)v26, (unint64_t)memptr >> 2, v41 >> 2);
    if (v27) {
      v27[2](v27);
    }
  }
LABEL_30:

  return v12;
}

@end