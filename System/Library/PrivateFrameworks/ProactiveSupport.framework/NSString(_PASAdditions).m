@interface NSString(_PASAdditions)
+ (_PASUTF8String)_pas_stringWithDataNoCopy:()_PASAdditions encoding:nullTerminated:isExternalRepresentation:;
+ (__CFString)_pas_proxyStringByConcatenatingStrings:()_PASAdditions;
+ (id)_pas_stringWithConsumedAllocaDescrNoCopy:()_PASAdditions bufferSize:encoding:nullTerminated:isExternalRepresentation:;
+ (uint64_t)_pas_stringWithDataNoCopy:()_PASAdditions encoding:nullTerminated:;
- (__CFString)_pas_stringBackedByUTF8CString;
- (const)_pas_fastUTF8StringPtrWithOptions:()_PASAdditions encodedLength:;
- (id)_pas_proxyArrayOfSubstringsWithRanges:()_PASAdditions;
- (uint64_t)_pas_retainsConmingledBackingStore;
- (void)_pas_setRetainsConmingledBackingStore:()_PASAdditions;
@end

@implementation NSString(_PASAdditions)

+ (id)_pas_stringWithConsumedAllocaDescrNoCopy:()_PASAdditions bufferSize:encoding:nullTerminated:isExternalRepresentation:
{
  CFIndex v9 = a5;
  if (a4)
  {
    if (a7)
    {
      if (!a5)
      {
        unint64_t v17 = encoding;
        v16 = [MEMORY[0x1E4F28B00] currentHandler];
        [v16 handleFailureInMethod:a2, a1, @"NSString+_PASAdditions.m", 933, @"Invalid parameter not satisfying: %@", @"bufferSize > 0" object file lineNumber description];

        encoding = v17;
      }
      --v9;
    }
    CFStringEncoding v12 = CFStringConvertNSStringEncodingToEncoding(encoding);
    v11 = (void *)CFStringCreateWithBytes(0, a3, v9, v12, a8);
  }
  else
  {
    v11 = +[NSString _pas_foundationStringNoCopyWithBufferStart:bufferEnd:encoding:nullTerminated:isExternalRepresentation:allocator:](a1, (const char *)a3, (unint64_t)&a3[a5], encoding, a7, a8, (const __CFAllocator *)*MEMORY[0x1E4F1CF90]);
  }

  return v11;
}

- (const)_pas_fastUTF8StringPtrWithOptions:()_PASAdditions encodedLength:
{
  if (objc_opt_respondsToSelector())
  {
    return (const char *)objc_msgSend(a1, "_pas_overrideFastUTF8StringPtrWithOptions:encodedLength:", a3, a4);
  }
  else
  {
    uint64_t v8 = a3 & 1;
    id v9 = a1;
    uint64_t v10 = [v9 _fastCStringContents:v8];
    if (v10)
    {
      uint64_t v11 = v10;
      if (a4) {
        *a4 = [v9 length];
      }
    }
    else if ([v9 length])
    {
      return 0;
    }
    else
    {
      if (a4) {
        *a4 = 0;
      }
      return "";
    }
    return (const char *)v11;
  }
}

- (__CFString)_pas_stringBackedByUTF8CString
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (objc_opt_respondsToSelector())
  {
    v2 = [(__CFString *)a1 _pas_overrideStringBackedByUTF8CString];
LABEL_5:
    v3 = v2;
    goto LABEL_6;
  }
  if (CFStringGetCStringPtr(a1, 0x8000100u))
  {
LABEL_4:
    v2 = a1;
    goto LABEL_5;
  }
  uint64_t v5 = [(__CFString *)a1 length];
  if (v5)
  {
    size_t v6 = v5;
    uint64_t v7 = [(__CFString *)a1 lengthOfBytesUsingEncoding:4];
    if (!v7) {
      goto LABEL_4;
    }
    uint64_t v8 = v7;
    size_t v9 = v7 + 1;
    memptr = 0;
    uint64_t v22 = 0;
    if ((unint64_t)(v7 + 4) > 0x400)
    {
      int v18 = malloc_type_posix_memalign(&memptr, 8uLL, v9, 0x7C790F8uLL);
      LOBYTE(v22) = 0;
      if (v18)
      {
        id v19 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
        objc_exception_throw(v19);
      }
      uint64_t v10 = (char *)memptr;
    }
    else
    {
      uint64_t v10 = (char *)&v20 - ((v7 + 19) & 0xFFFFFFFFFFFFFFF0);
      bzero(v10, v7 + 4);
      memptr = v10;
      LOBYTE(v22) = 1;
    }
    uint64_t v11 = v22;
    [(__CFString *)a1 getCString:v10 maxLength:v9 encoding:4];
    if (v8 == v6)
    {
      if (strnlen(v10, v6) < v6)
      {
        if ((v11 & 1) == 0) {
          free(v10);
        }
        goto LABEL_4;
      }
      v14 = (void *)MEMORY[0x1A62450A0]();
      uint64_t v15 = objc_msgSend(NSString, "_pas_stringWithConsumedAllocaDescrNoCopy:bufferSize:encoding:nullTerminated:isExternalRepresentation:", v10, v11, v9, 1, 1, 0);
      if (!v15) {
        __assert_rtn("-[NSString(_PASAdditions) _pas_stringBackedByUTF8CString]", "NSString+_PASAdditions.m", 1044, "result");
      }
      v3 = (__CFString *)v15;
    }
    else
    {
      id v12 = objc_alloc(MEMORY[0x1E4F1C9B8]);
      if (v11) {
        v13 = (void *)[v12 initWithBytes:v10 length:v9];
      }
      else {
        v13 = (void *)[v12 initWithBytesNoCopy:v10 length:v9 freeWhenDone:1];
      }
      v16 = v13;
      uint64_t v17 = +[NSString _pas_stringWithDataNoCopy:encoding:nullTerminated:isExternalRepresentation:utf8StringThreshold:](NSString, v13, 4, 1, 0, 1uLL);
      if (!v17) {
        __assert_rtn("-[NSString(_PASAdditions) _pas_stringBackedByUTF8CString]", "NSString+_PASAdditions.m", 1060, "result");
      }
      v3 = (__CFString *)v17;
    }
  }
  else
  {
    v3 = &stru_1EF678A50;
  }
LABEL_6:

  return v3;
}

- (uint64_t)_pas_retainsConmingledBackingStore
{
  v1 = objc_getAssociatedObject(a1, sel__pas_setRetainsConmingledBackingStore_);
  uint64_t v2 = [v1 BOOLValue];

  return v2;
}

- (void)_pas_setRetainsConmingledBackingStore:()_PASAdditions
{
  if (malloc_size(a1))
  {
    if (a3) {
      uint64_t v5 = (void *)*MEMORY[0x1E4F1CFD0];
    }
    else {
      uint64_t v5 = 0;
    }
    objc_setAssociatedObject(a1, sel__pas_setRetainsConmingledBackingStore_, v5, (void *)1);
  }
}

- (id)_pas_proxyArrayOfSubstringsWithRanges:()_PASAdditions
{
  id v4 = a3;
  id v5 = a1;
  size_t v6 = (void *)MEMORY[0x1E4F1C978];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__NSString__PASAdditions___pas_proxyArrayOfSubstringsWithRanges___block_invoke;
  v13[3] = &unk_1E5AEAE18;
  id v14 = v5;
  id v15 = v4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__NSString__PASAdditions___pas_proxyArrayOfSubstringsWithRanges___block_invoke_2;
  v11[3] = &unk_1E5AEAE40;
  id v12 = v15;
  id v7 = v15;
  id v8 = v5;
  size_t v9 = objc_msgSend(v6, "_pas_proxyArrayUsingObjectAtIndexBlock:andCountBlock:", v13, v11);

  return v9;
}

+ (__CFString)_pas_proxyStringByConcatenatingStrings:()_PASAdditions
{
  id v3 = a3;
  self;
  id v4 = objc_msgSend(v3, "_pas_mappedArrayWithTransform:", &__block_literal_global_1803);

  if ([v4 count])
  {
    if ([v4 count] == 1)
    {
      uint64_t v5 = [v4 objectAtIndexedSubscript:0];
    }
    else
    {
      uint64_t v5 = (uint64_t)-[_PASProxyConcatenatedString _initWithComponents:]([_PASProxyConcatenatedString alloc], v4);
    }
    size_t v6 = (__CFString *)v5;
  }
  else
  {
    size_t v6 = &stru_1EF678A50;
  }

  return v6;
}

+ (uint64_t)_pas_stringWithDataNoCopy:()_PASAdditions encoding:nullTerminated:
{
  return objc_msgSend(NSString, "_pas_stringWithDataNoCopy:encoding:nullTerminated:isExternalRepresentation:", a3, a4, a5, 0);
}

+ (_PASUTF8String)_pas_stringWithDataNoCopy:()_PASAdditions encoding:nullTerminated:isExternalRepresentation:
{
  return +[NSString _pas_stringWithDataNoCopy:encoding:nullTerminated:isExternalRepresentation:utf8StringThreshold:](NSString, a3, a4, a5, a6, 0x400uLL);
}

@end