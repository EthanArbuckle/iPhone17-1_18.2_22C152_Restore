@interface NSIndexPath(_PASAdditions)
+ (id)_pas_fromVersionString:()_PASAdditions withExceptions:;
+ (id)_pas_fromVersionStringIfPossible:()_PASAdditions;
+ (uint64_t)_pas_fromVersionString:()_PASAdditions;
- (BOOL)_pas_isEqualToVersionString:()_PASAdditions;
- (BOOL)_pas_isGreaterThanOrEqualToVersionString:()_PASAdditions;
- (BOOL)_pas_isGreaterThanVersionString:()_PASAdditions;
- (BOOL)_pas_isLessThanOrEqualToVersionString:()_PASAdditions;
- (BOOL)_pas_isLessThanVersionString:()_PASAdditions;
- (__CFString)_pas_asVersionString;
@end

@implementation NSIndexPath(_PASAdditions)

- (BOOL)_pas_isGreaterThanVersionString:()_PASAdditions
{
  v2 = objc_msgSend(MEMORY[0x1E4F28D58], "_pas_fromVersionString:");
  BOOL v3 = [a1 compare:v2] == 1;

  return v3;
}

- (BOOL)_pas_isGreaterThanOrEqualToVersionString:()_PASAdditions
{
  v2 = objc_msgSend(MEMORY[0x1E4F28D58], "_pas_fromVersionString:");
  BOOL v3 = [a1 compare:v2] != -1;

  return v3;
}

- (BOOL)_pas_isEqualToVersionString:()_PASAdditions
{
  v2 = objc_msgSend(MEMORY[0x1E4F28D58], "_pas_fromVersionString:");
  BOOL v3 = [a1 compare:v2] == 0;

  return v3;
}

- (BOOL)_pas_isLessThanOrEqualToVersionString:()_PASAdditions
{
  v2 = objc_msgSend(MEMORY[0x1E4F28D58], "_pas_fromVersionString:");
  BOOL v3 = [a1 compare:v2] != 1;

  return v3;
}

- (BOOL)_pas_isLessThanVersionString:()_PASAdditions
{
  v2 = objc_msgSend(MEMORY[0x1E4F28D58], "_pas_fromVersionString:");
  BOOL v3 = [a1 compare:v2] == -1;

  return v3;
}

- (__CFString)_pas_asVersionString
{
  uint64_t v2 = [a1 length];
  BOOL v3 = &stru_1EF678A50;
  switch(v2)
  {
    case 0:
      break;
    case 1:
      uint64_t v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"%tu", objc_msgSend(a1, "indexAtPosition:", 0), v9, v10, v11, v12, v13);
      goto LABEL_11;
    case 2:
      uint64_t v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"%tu.%tu", objc_msgSend(a1, "indexAtPosition:", 0), objc_msgSend(a1, "indexAtPosition:", 1), v10, v11, v12, v13);
      goto LABEL_11;
    case 3:
      uint64_t v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"%tu.%tu.%tu", objc_msgSend(a1, "indexAtPosition:", 0), objc_msgSend(a1, "indexAtPosition:", 1), objc_msgSend(a1, "indexAtPosition:", 2), v11, v12, v13);
      goto LABEL_11;
    case 4:
      uint64_t v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"%tu.%tu.%tu.%tu", objc_msgSend(a1, "indexAtPosition:", 0), objc_msgSend(a1, "indexAtPosition:", 1), objc_msgSend(a1, "indexAtPosition:", 2), objc_msgSend(a1, "indexAtPosition:", 3), v12, v13);
      goto LABEL_11;
    case 5:
      uint64_t v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"%tu.%tu.%tu.%tu.%tu", objc_msgSend(a1, "indexAtPosition:", 0), objc_msgSend(a1, "indexAtPosition:", 1), objc_msgSend(a1, "indexAtPosition:", 2), objc_msgSend(a1, "indexAtPosition:", 3), objc_msgSend(a1, "indexAtPosition:", 4), v13);
      goto LABEL_11;
    case 6:
      uint64_t v4 = objc_msgSend([NSString alloc], "initWithFormat:", @"%tu.%tu.%tu.%tu.%tu.%tu", objc_msgSend(a1, "indexAtPosition:", 0), objc_msgSend(a1, "indexAtPosition:", 1), objc_msgSend(a1, "indexAtPosition:", 2), objc_msgSend(a1, "indexAtPosition:", 3), objc_msgSend(a1, "indexAtPosition:", 4), objc_msgSend(a1, "indexAtPosition:", 5));
LABEL_11:
      BOOL v3 = (__CFString *)v4;
      break;
    default:
      BOOL v3 = (__CFString *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:2 * v2];
      uint64_t v5 = 0;
      uint64_t v6 = v2 - 1;
      do
      {
        v7 = (void *)MEMORY[0x1A62450A0]();
        -[__CFString appendFormat:](v3, "appendFormat:", @"%tu.", [a1 indexAtPosition:v5]);
        ++v5;
      }
      while (v6 != v5);
      -[__CFString appendFormat:](v3, "appendFormat:", @"%tu", [a1 indexAtPosition:v6]);
      break;
  }

  return v3;
}

+ (id)_pas_fromVersionString:()_PASAdditions withExceptions:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v7 = a3;
  uint64_t v8 = [(__CFString *)v7 length];
  if (![(__CFString *)v7 length])
  {
    v19 = objc_opt_new();
    goto LABEL_25;
  }
  CStringPtr = CFStringGetCStringPtr(v7, 0x600u);
  if (!CStringPtr)
  {
    uint64_t v10 = v7;
    CStringPtr = (const char *)[(__CFString *)v10 UTF8String];
    if (!CStringPtr)
    {
      if (!a4) {
        goto LABEL_30;
      }
      v22 = [MEMORY[0x1E4F28B00] currentHandler];
      [v22 handleFailureInMethod:a2, a1, @"NSIndexPath+_PASAdditions.m", 38, @"Unable to get ASCII or UTF-8 bytes of input to _pas_fromVersionString: %@", v10 object file lineNumber description];

      CStringPtr = 0;
    }
  }
  unint64_t v11 = (unint64_t)(v8 + 1) >> 1;
  unint64_t v12 = (8 * v11) | 7;
  __endptr = 0;
  uint64_t v28 = 0;
  if (v12 > 0x1F4)
  {
    int v23 = malloc_type_posix_memalign((void **)&__endptr, 8uLL, 8 * v11, 0x100004000313F17uLL);
    LOBYTE(v28) = 0;
    if (v23)
    {
      id v25 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
      objc_exception_throw(v25);
    }
    uint64_t v13 = __endptr;
  }
  else
  {
    uint64_t v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v13, (8 * v11) | 7);
  }
  __endptr = 0;
  if ((*CStringPtr - 58) < 0xFFFFFFF6)
  {
LABEL_16:
    if (v12 >= 0x1F5)
    {
      free(v13);
      if (!a4) {
        goto LABEL_30;
      }
    }
    else if (!a4)
    {
      goto LABEL_30;
    }
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, a1, @"NSIndexPath+_PASAdditions.m", 52, @"Invalid input to _pas_fromVersionString (got an unexpected non-digit character): %@", v7 object file lineNumber description];
    goto LABEL_43;
  }
  uint64_t v14 = 0;
  while (1)
  {
    *__error() = 0;
    unint64_t v15 = strtoul(CStringPtr, &__endptr, 10);
    if (*__error()) {
      BOOL v16 = v15 + 1 > 1;
    }
    else {
      BOOL v16 = 1;
    }
    if (!v16)
    {
      if (v12 >= 0x1F5)
      {
        free(v13);
        if (a4)
        {
LABEL_47:
          v24 = [MEMORY[0x1E4F28B00] currentHandler];
          [v24 handleFailureInMethod:a2, a1, @"NSIndexPath+_PASAdditions.m", 64, @"Invalid input to _pas_fromVersionString (unable to parse a decimal integer into an NSUInteger): %@", v7 object file lineNumber description];
          goto LABEL_43;
        }
      }
      else if (a4)
      {
        goto LABEL_47;
      }
LABEL_30:
      v19 = 0;
      goto LABEL_25;
    }
    v17 = __endptr;
    if (__endptr == CStringPtr)
    {
      if (v12 >= 0x1F5)
      {
        free(v13);
        if (!a4) {
          goto LABEL_30;
        }
      }
      else if (!a4)
      {
        goto LABEL_30;
      }
      v24 = [MEMORY[0x1E4F28B00] currentHandler];
      [v24 handleFailureInMethod:a2, a1, @"NSIndexPath+_PASAdditions.m", 74, @"Invalid input to _pas_fromVersionString (expected a decimal integer, got something, or nothing, else): %@", v7 object file lineNumber description];
      goto LABEL_43;
    }
    *(void *)&v13[8 * v14] = v15;
    if (*v17 != 46) {
      break;
    }
    int v18 = v17[1];
    __endptr = 0;
    ++v14;
    CStringPtr = v17 + 1;
    if ((v18 - 58) < 0xFFFFFFF6) {
      goto LABEL_16;
    }
  }
  if (*v17)
  {
    if (v12 >= 0x1F5)
    {
      free(v13);
      if (!a4) {
        goto LABEL_30;
      }
    }
    else if (!a4)
    {
      goto LABEL_30;
    }
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, a1, @"NSIndexPath+_PASAdditions.m", 91, @"Invalid input to _pas_fromVersionString (expected '.' or null terminator, got something else): %@", v7 object file lineNumber description];
LABEL_43:

    __break(1u);
  }
  v19 = (void *)[objc_alloc(MEMORY[0x1E4F28D58]) initWithIndexes:v13 length:v14 + 1];
  if (v12 >= 0x1F5) {
    free(v13);
  }
  if (v14 + 1 > v11)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"NSIndexPath+_PASAdditions.m", 101, @"Invalid parameter not satisfying: %@", @"length <= maxPossibleIndexPathLength" object file lineNumber description];
  }
LABEL_25:

  return v19;
}

+ (id)_pas_fromVersionStringIfPossible:()_PASAdditions
{
  if (a3)
  {
    uint64_t v4 = objc_msgSend(a1, "_pas_fromVersionString:withExceptions:", a3, 0);
  }
  else
  {
    uint64_t v4 = 0;
  }
  return v4;
}

+ (uint64_t)_pas_fromVersionString:()_PASAdditions
{
  return objc_msgSend(a1, "_pas_fromVersionString:withExceptions:", a3, 1);
}

@end