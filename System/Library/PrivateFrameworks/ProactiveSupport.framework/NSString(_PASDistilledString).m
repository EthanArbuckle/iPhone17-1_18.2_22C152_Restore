@interface NSString(_PASDistilledString)
+ (id)_pas_distilledStringClasses;
- (id)_pas_distilledString;
- (id)_pas_revivedString;
@end

@implementation NSString(_PASDistilledString)

- (id)_pas_distilledString
{
  id v1 = a1;
  uint64_t v2 = [a1 length];
  if (!v2) {
    goto LABEL_4;
  }
  unint64_t v3 = v2;
  id v1 = v1;
  uint64_t v4 = [v1 UTF8String];
  if (!v4) {
    goto LABEL_4;
  }
  v5 = (unsigned __int8 *)v4;
  if (*(unsigned char *)(v4 + v3)) {
    goto LABEL_4;
  }
  if ([v1 isEqualToString:@"0"])
  {
    v7 = &unk_1EF683978;
    goto LABEL_6;
  }
  if (([v1 hasPrefix:@" "] & 1) != 0
    || ([v1 hasPrefix:@"+"] & 1) != 0
    || ([v1 isEqualToString:@"-"] & 1) != 0)
  {
    goto LABEL_56;
  }
  if (v3 <= 0x14)
  {
    v10 = v5 + 1;
    int v9 = *v5;
    BOOL v11 = v9 == 45;
    if (v9 != 45) {
      v10 = v5;
    }
    if (*v10 == 48) {
      goto LABEL_35;
    }
    __endptr = 0;
    if (v9 == 45)
    {
      uint64_t v12 = strtol((const char *)v5, &__endptr, 10);
      if (*__endptr) {
        goto LABEL_35;
      }
      uint64_t v6 = [NSNumber numberWithLong:v12];
    }
    else
    {
      unint64_t v16 = strtoul((const char *)v5, &__endptr, 10);
      if (*__endptr) {
        goto LABEL_35;
      }
      uint64_t v6 = [NSNumber numberWithUnsignedLong:v16];
    }
    goto LABEL_5;
  }
  if (v3 != 36)
  {
    BOOL v11 = 0;
    goto LABEL_35;
  }
  uint64_t v13 = 0;
  BOOL v11 = 0;
  while (1)
  {
    if (v13 <= 0x24)
    {
      if (((1 << v13) & 0x842100) != 0)
      {
        if (v5[v13] != 45) {
          goto LABEL_35;
        }
        BOOL v11 = 1;
        goto LABEL_32;
      }
      if (v13 == 36) {
        break;
      }
    }
    int v14 = (char)v5[v13];
    if ((v14 - 65) >= 6 && (v14 - 48) > 9) {
      goto LABEL_35;
    }
LABEL_32:
    ++v13;
  }
  v7 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v1];
  if (v7) {
    goto LABEL_6;
  }
LABEL_35:
  if (v3 < 9) {
    goto LABEL_56;
  }
  if (v11) {
    goto LABEL_56;
  }
  if (((char)*v5 - 48) > 9) {
    goto LABEL_56;
  }
  unint64_t v17 = v3 - 1;
  if (((char)v5[v3 - 1] - 48) > 9 || *v5 == 48 && v5[1] != 46 && v5[1]) {
    goto LABEL_56;
  }
  v18 = (char *)v5;
  while (1)
  {
    v18 = strstr(v18 + 1, ".0");
    if (!v18) {
      break;
    }
    if (v18[2] && v18[2] != 46) {
      goto LABEL_56;
    }
  }
  if (v3 <= 0xB)
  {
    unint64_t v19 = v3;
    v20 = v5;
    do
    {
      unsigned int v21 = *v20++;
      uint64_t v22 = (1 << v21) & 0x1B400000000000;
      if (v21 > 0x34 || v22 == 0) {
        break;
      }
      if (!v17) {
        goto LABEL_56;
      }
      --v17;
      --v19;
    }
    while (v19);
  }
  v7 = objc_msgSend(MEMORY[0x1E4F28D58], "_pas_fromVersionStringIfPossible:", v1);
  if (!v7)
  {
LABEL_56:
    if (v3 >= 0xC && (v3 & 3) == 0)
    {
      v24 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBase64EncodedString:v1 options:0];
      v7 = v24;
      if (!v24) {
        goto LABEL_73;
      }
      unint64_t v25 = [v24 length];
      unint64_t v26 = (v25 % 3) ^ 3;
      if (!(v25 % 3)) {
        unint64_t v26 = 0;
      }
      if (v5[v3 - 1] == 61)
      {
        if (!v26) {
          goto LABEL_73;
        }
        if (v5[v3 - 2] == 61)
        {
          if (v26 < 2)
          {
LABEL_73:

            goto LABEL_4;
          }
        }
        else if (v26 == 2)
        {
          goto LABEL_73;
        }
      }
      else if (v26)
      {
        goto LABEL_73;
      }
      if (v3 != 4 * (([v7 length] + 2) / 3uLL)) {
        goto LABEL_73;
      }
      goto LABEL_6;
    }
LABEL_4:
    uint64_t v6 = [v1 copy];
LABEL_5:
    v7 = (void *)v6;
  }
LABEL_6:

  return v7;
}

- (id)_pas_revivedString
{
  id v1 = (void *)[a1 copy];

  return v1;
}

+ (id)_pas_distilledStringClasses
{
  if (_pas_distilledStringClasses__pasOnceToken2 != -1) {
    dispatch_once(&_pas_distilledStringClasses__pasOnceToken2, &__block_literal_global_1611);
  }
  v0 = (void *)_pas_distilledStringClasses__pasExprOnceResult;

  return v0;
}

@end