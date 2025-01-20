@interface OAVPath
+ (EshComputedValue)noneParam;
+ (EshComputedValue)parseParam:(const char *)a3 first:(BOOL)a4;
+ (int)parseCommand:(const char *)a3;
+ (void)readPath:(id)a3 toGeometry:(id)a4;
+ (void)writePath:(id)a3 toString:(id)a4;
@end

@implementation OAVPath

+ (void)readPath:(id)a3 toGeometry:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v38 = 0;
  v39 = 0;
  uint64_t v40 = 0;
  uint64_t v36 = 0;
  v37 = &unk_26EBD6288;
  __p = 0;
  v35 = 0;
  v33 = &unk_26EBD6120;
  id v8 = [v6 uppercaseString];
  v9 = (char *)[v8 UTF8String];

  char v10 = 0;
  v32 = v9;
  uint64_t v11 = MEMORY[0x263EF8318];
  while (1)
  {
    while (1)
    {
      unsigned int v12 = *v9;
      if (!((v12 & 0x80000000) != 0 ? __maskrune(v12, 0x4000uLL) : *(_DWORD *)(v11 + 4 * v12 + 60) & 0x4000)) {
        break;
      }
      v9 = ++v32;
    }
    if (!*v32) {
      break;
    }
    int v14 = [a1 parseCommand:&v32];
    int v15 = v14;
    if (v14 == -1) {
      break;
    }
    int v16 = EshPathCommand::paramsPerCommand(v14);
    __int16 v17 = 1;
    char v18 = 1;
    while (1)
    {
      if (v16 >= 1)
      {
        LOWORD(v19) = 0;
        char v20 = v18;
        do
        {
          [a1 parseParam:&v32 first:v20 & 1];
          EshBasicTablePropVal<EshComputedValue>::append(&v33, &v31);
          char v18 = 0;
          char v20 = 0;
          int v19 = (__int16)(v19 + 1);
        }
        while (v19 < v16);
      }
      for (i = v32; ; i = ++v32)
      {
        unsigned int v22 = *i;
        if (!((v22 & 0x80000000) != 0 ? __maskrune(v22, 0x4000uLL) : *(_DWORD *)(v11 + 4 * v22 + 60) & 0x4000)) {
          break;
        }
      }
      unsigned int v24 = *v32;
      if ((v24 & 0x80000000) != 0 ? __maskrune(v24, 0x100uLL) : *(_DWORD *)(v11 + 4 * v24 + 60) & 0x100) {
        break;
      }
      unsigned int v26 = *v32;
      if (!*v32) {
        break;
      }
      int v27 = (v26 & 0x80000000) != 0 ? __maskrune(v26, 0x4000uLL) : *(_DWORD *)(v11 + 4 * v26 + 60) & 0x4000;
      if (!v27 && v16 == 0)
      {
        unsigned int v29 = *v32;
        int v30 = (v29 & 0x80000000) != 0 ? __maskrune(v29, 0x100uLL) : *(_DWORD *)(v11 + 4 * v29 + 60) & 0x100;
        if (!v30 && *v32) {
          break;
        }
      }
      ++v17;
    }
    LOWORD(v31) = v17;
    HIDWORD(v31) = v15;
    EshBasicTablePropVal<EshComputedValue>::append(&v37, &v31);
    char v10 = 1;
    v9 = v32;
  }
  if (v10) {
    +[OABShapeGeometry readFromPathCommands:&v37 pathParams:&v33 toGeometry:v7];
  }
  v33 = &unk_26EBD61B0;
  if (__p)
  {
    v35 = __p;
    operator delete(__p);
  }
  v37 = &unk_26EBD62F0;
  if (v38)
  {
    v39 = v38;
    operator delete(v38);
  }
}

+ (int)parseCommand:(const char *)a3
{
  unsigned int v4 = **a3;
  if ((v4 & 0x80000000) != 0)
  {
    if (!__maskrune(v4, 0x100uLL)) {
      return -1;
    }
  }
  else if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v4 + 60) & 0x100) == 0)
  {
    return -1;
  }
  v5 = (*a3)++;
  int result = 0;
  switch(*v5)
  {
    case 'A':
      *a3 = v5 + 2;
      int v7 = v5[1];
      if (v7 > 81)
      {
        if (v7 == 82)
        {
          return 9;
        }
        else
        {
          if (v7 != 84) {
            return -1;
          }
          return 8;
        }
      }
      else if (v7 == 69)
      {
        return 6;
      }
      else
      {
        if (v7 != 76) {
          return -1;
        }
        return 7;
      }
    case 'C':
      return 1;
    case 'E':
      return 4;
    case 'H':
      *a3 = v5 + 2;
      int v8 = v5[1];
      if ((v8 - 65) >= 9) {
        return -1;
      }
      return v8 - 48;
    case 'L':
      return result;
    case 'M':
      return 2;
    case 'N':
      *a3 = v5 + 2;
      int v9 = *((unsigned __int8 *)v5 + 1);
      if (v9 == 83) {
        int v10 = 16;
      }
      else {
        int v10 = -1;
      }
      BOOL v11 = v9 == 70;
      int v12 = 15;
      goto LABEL_28;
    case 'Q':
      *a3 = v5 + 2;
      int v13 = v5[1];
      switch(v13)
      {
        case 'B':
          int result = 14;
          break;
        case 'X':
          int result = 12;
          break;
        case 'Y':
          int result = 13;
          break;
        default:
          return -1;
      }
      break;
    case 'R':
      return 29;
    case 'T':
      return 28;
    case 'V':
      return 30;
    case 'W':
      *a3 = v5 + 2;
      int v14 = *((unsigned __int8 *)v5 + 1);
      if (v14 == 82) {
        int v10 = 11;
      }
      else {
        int v10 = -1;
      }
      BOOL v11 = v14 == 65;
      int v12 = 10;
LABEL_28:
      if (v11) {
        return v12;
      }
      else {
        return v10;
      }
    case 'X':
      return 3;
    default:
      return -1;
  }
  return result;
}

+ (EshComputedValue)parseParam:(const char *)a3 first:(BOOL)a4
{
  uint64_t v7 = v4;
  int v8 = *a3;
  uint64_t v9 = MEMORY[0x263EF8318];
  if (a4) {
    goto LABEL_9;
  }
  while (1)
  {
    unsigned int v10 = *v8;
    int v11 = (v10 & 0x80000000) != 0 ? __maskrune(v10, 0x4000uLL) : *(_DWORD *)(v9 + 4 * v10 + 60) & 0x4000;
    int v8 = *a3;
    if (!v11) {
      break;
    }
    *a3 = ++v8;
  }
  if (*v8 != 44)
  {
LABEL_9:
    int v12 = 0;
  }
  else
  {
    *a3 = ++v8;
    int v12 = 1;
  }
  while (1)
  {
    unsigned int v13 = *v8;
    int v14 = (v13 & 0x80000000) != 0 ? __maskrune(v13, 0x4000uLL) : *(_DWORD *)(v9 + 4 * v13 + 60) & 0x4000;
    int v15 = *a3;
    if (!v14) {
      break;
    }
    int v8 = v15 + 1;
    *a3 = v8;
  }
  EshComputedValue v16 = (EshComputedValue)*v15;
  if (*(_DWORD *)&v16.var0 == 44) {
    goto LABEL_32;
  }
  if ((*(_DWORD *)&v16.var0 & 0x80000000) != 0)
  {
    EshComputedValue v16 = (EshComputedValue)__maskrune(*(__darwin_ct_rune_t *)&v16.var0, 0x100uLL);
    if (*(_DWORD *)&v16.var0) {
      goto LABEL_31;
    }
  }
  else
  {
    EshComputedValue v16 = (EshComputedValue)(*(_DWORD *)(v9 + 4 * *(unsigned int *)&v16.var0 + 60) & 0x100);
    if (*(_DWORD *)&v16.var0) {
      goto LABEL_31;
    }
  }
  __int16 v17 = *a3;
  uint64_t v18 = *(unsigned __int8 *)*a3;
  if (!**a3)
  {
LABEL_31:
    if (!v12) {
      goto LABEL_33;
    }
LABEL_32:
    *(unsigned char *)uint64_t v7 = 0;
    *(_DWORD *)(v7 + 4) = 0;
    return v16;
  }
  if ((v18 & 0x80) == 0 && (*(_DWORD *)(v9 + 4 * v18 + 60) & 0x400) != 0 || v18 == 64 || v18 == 45)
  {
    if (v18 == 64) {
      *a3 = ++v17;
    }
    EshComputedValue v16 = (EshComputedValue)atol(v17);
    int v19 = v17 + 1;
    do
    {
      *a3 = v19;
      int v21 = *v19++;
      unsigned __int8 v20 = v21;
    }
    while ((v21 & 0x80000000) == 0 && (*(_DWORD *)(v9 + 4 * v20 + 60) & 0x400) != 0);
    *(unsigned char *)uint64_t v7 = v18 == 64;
    *(_DWORD *)(v7 + 4) = *(_DWORD *)&v16.var0;
    return v16;
  }
LABEL_33:
  return (EshComputedValue)[a1 noneParam];
}

+ (EshComputedValue)noneParam
{
  v3 = v2;
  if (+[OAVPath noneParam]::once != -1) {
    dispatch_once(&+[OAVPath noneParam]::once, &__block_literal_global_65);
  }
  void *v3 = *(void *)+[OAVPath noneParam]::param;
  return (EshComputedValue)a1;
}

void __20__OAVPath_noneParam__block_invoke()
{
}

+ (void)writePath:(id)a3 toString:(id)a4
{
  id v59 = a3;
  id v5 = a4;
  uint64_t v6 = [v59 elementCount];
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = 0;
    uint64_t v57 = v6;
    v58 = v5;
    while (1)
    {
      uint64_t v9 = [v59 elementAtIndex:v8];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        break;
      }
      [v5 appendString:@"X"];
LABEL_57:
      [v5 appendString:@" "];

      if (v7 == ++v8) {
        goto LABEL_71;
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v10 = [v9 toPoint];
      unint64_t v12 = v11;
      int v13 = [v9 relative];
      int v14 = @"M";
      if (v13) {
        int v14 = @"T";
      }
      int v15 = v14;
      if (v10) {
        EshComputedValue v16 = @"@";
      }
      else {
        EshComputedValue v16 = &stru_26EBF24D8;
      }
      __int16 v17 = [NSString stringWithFormat:@"%@%d", v16, HIDWORD(v10)];
      uint64_t v18 = NSString;
      if (v12) {
        int v19 = @"@";
      }
      else {
        int v19 = &stru_26EBF24D8;
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unint64_t v20 = [v9 toPoint];
        unint64_t v12 = v21;
        int v22 = [v9 relative];
        v23 = @"L";
        if (v22) {
          v23 = @"R";
        }
        int v15 = v23;
        if (v20) {
          unsigned int v24 = @"@";
        }
        else {
          unsigned int v24 = &stru_26EBF24D8;
        }
        __int16 v17 = [NSString stringWithFormat:@"%@%d", v24, HIDWORD(v20)];
        uint64_t v18 = NSString;
        if (v12) {
          int v19 = @"@";
        }
        else {
          int v19 = &stru_26EBF24D8;
        }
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          unint64_t v25 = [v9 controlPoint1];
          unint64_t v27 = v26;
          unint64_t v28 = [v9 controlPoint2];
          unint64_t v30 = v29;
          unint64_t v31 = [v9 toPoint];
          unint64_t v56 = v32;
          int v33 = [v9 relative];
          v34 = @"C";
          if (v33) {
            v34 = @"V";
          }
          int v15 = v34;
          if (v25) {
            v35 = @"@";
          }
          else {
            v35 = &stru_26EBF24D8;
          }
          __int16 v17 = [NSString stringWithFormat:@"%@%d", v35, HIDWORD(v25)];
          if (v27) {
            uint64_t v36 = @"@";
          }
          else {
            uint64_t v36 = &stru_26EBF24D8;
          }
          v37 = [NSString stringWithFormat:@"%@%d", v36, HIDWORD(v27)];
          if (v28) {
            v38 = @"@";
          }
          else {
            v38 = &stru_26EBF24D8;
          }
          v39 = [NSString stringWithFormat:@"%@%d", v38, HIDWORD(v28)];
          if (v30) {
            uint64_t v40 = @"@";
          }
          else {
            uint64_t v40 = &stru_26EBF24D8;
          }
          v41 = [NSString stringWithFormat:@"%@%d", v40, HIDWORD(v30)];
          if (v31) {
            v42 = @"@";
          }
          else {
            v42 = &stru_26EBF24D8;
          }
          v43 = [NSString stringWithFormat:@"%@%d", v42, HIDWORD(v31)];
          if (v56) {
            v44 = @"@";
          }
          else {
            v44 = &stru_26EBF24D8;
          }
          v45 = [NSString stringWithFormat:@"%@%d", v44, HIDWORD(v56)];
          [v58 appendFormat:@"%@ %@,%@ %@,%@ %@,%@", v15, v17, v37, v39, v41, v43, v45];

          goto LABEL_55;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            goto LABEL_57;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                objc_opt_isKindOfClass();
              }
            }
            goto LABEL_57;
          }
          unint64_t v51 = [v9 controlPoint];
          unint64_t v53 = v52;
          if (v51) {
            v54 = @"@";
          }
          else {
            v54 = &stru_26EBF24D8;
          }
          int v15 = [NSString stringWithFormat:@"%@%d", v54, HIDWORD(v51)];
          if (v53) {
            v55 = @"@";
          }
          else {
            v55 = &stru_26EBF24D8;
          }
          __int16 v17 = [NSString stringWithFormat:@"%@%d", v55, HIDWORD(v53)];
          [v58 appendFormat:@"QB %@,%@", v15, v17];
          goto LABEL_56;
        }
        unint64_t v46 = [v9 toPoint];
        unint64_t v12 = v47;
        int v48 = [v9 startsVertical];
        v49 = @"QX";
        if (v48) {
          v49 = @"QY";
        }
        int v15 = v49;
        if (v46) {
          v50 = @"@";
        }
        else {
          v50 = &stru_26EBF24D8;
        }
        __int16 v17 = [NSString stringWithFormat:@"%@%d", v50, HIDWORD(v46)];
        uint64_t v18 = NSString;
        if (v12) {
          int v19 = @"@";
        }
        else {
          int v19 = &stru_26EBF24D8;
        }
      }
    }
    v37 = [v18 stringWithFormat:@"%@%d", v19, HIDWORD(v12)];
    [v58 appendFormat:@"%@ %@,%@", v15, v17, v37];
LABEL_55:

LABEL_56:
    uint64_t v7 = v57;
    id v5 = v58;
    goto LABEL_57;
  }
LABEL_71:
  if (([v59 stroked] & 1) == 0) {
    [v5 appendString:@"NS "];
  }
  if (![v59 fillMode]) {
    [v5 appendString:@"NF "];
  }
  [v5 appendString:@"E"];
}

@end