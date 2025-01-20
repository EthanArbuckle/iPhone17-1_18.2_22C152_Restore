@interface NSInvocation(NAAdditions)
- (id)na_argumentDescriptionsWithObjectFormatter:()NAAdditions;
- (id)na_argumentsAsObjects;
@end

@implementation NSInvocation(NAAdditions)

- (id)na_argumentDescriptionsWithObjectFormatter:()NAAdditions
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  v5 = objc_msgSend(a1, "na_argumentsAsObjects");
  if (![v5 count])
  {
    v22 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_22;
  }
  v27 = &v25;
  uint64_t v25 = [v5 count];
  v6 = (char *)&v25 - ((8 * v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = 8 * v25;
  bzero(v6, 8 * v25);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v32 = 0u;
  long long v31 = 0u;
  v28 = v5;
  id v30 = v5;
  uint64_t v7 = [v30 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (!v7) {
    goto LABEL_18;
  }
  uint64_t v8 = v7;
  uint64_t v9 = 0;
  uint64_t v10 = *(void *)v32;
  v29 = v6;
  do
  {
    uint64_t v11 = 0;
    v12 = &v6[8 * v9];
    do
    {
      if (*(void *)v32 != v10) {
        objc_enumerationMutation(v30);
      }
      v13 = *(void **)(*((void *)&v31 + 1) + 8 * v11);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_10;
      }
      id v14 = v13;
      if (strcmp((const char *)[v14 objCType], "B"))
      {

LABEL_10:
        uint64_t v15 = v4[2](v4, v13, v9 + v11);
        id v14 = (id)v15;
        v16 = @"(null)";
        if (v15) {
          v16 = (__CFString *)v15;
        }
        goto LABEL_12;
      }
      int v19 = [v14 BOOLValue];
      v16 = @"NO";
      if (v19) {
        v16 = @"YES";
      }
LABEL_12:
      v17 = v16;

      v18 = *(void **)&v12[8 * v11];
      *(void *)&v12[8 * v11] = v17;

      ++v11;
    }
    while (v8 != v11);
    uint64_t v20 = [v30 countByEnumeratingWithState:&v31 objects:v35 count:16];
    uint64_t v8 = v20;
    v9 += v11;
    v6 = v29;
  }
  while (v20);
LABEL_18:
  id v21 = v30;

  v22 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v6, objc_msgSend(v21, "count"));
  uint64_t v23 = v26;
  if (v25)
  {
    do
    {

      v23 -= 8;
    }
    while (v23);
  }
  v5 = v28;
LABEL_22:

  return v22;
}

- (id)na_argumentsAsObjects
{
  sizep[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1 methodSignature];
  uint64_t v3 = [v2 numberOfArguments];
  uint64_t v4 = v3 - 2;

  if (v3 == 2)
  {
    v18 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_50;
  }
  v21[0] = v3;
  v21[1] = v21;
  ((void (*)(void))MEMORY[0x1F4188790])();
  v6 = (char *)v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v6, v5);
  uint64_t v7 = 0;
  do
  {
    id v8 = [a1 methodSignature];
    uint64_t v9 = (const char *)[v8 getArgumentTypeAtIndex:v7 + 2];

    if (!strcmp(v9, "@"))
    {
      sizep[0] = 0;
      [a1 getArgument:sizep atIndex:v7 + 2];
      if (sizep[0])
      {
        id v16 = (id)sizep[0];
      }
      else
      {
        id v16 = [MEMORY[0x1E4F1CA98] null];
      }
    }
    else
    {
      sizep[0] = 0;
      uint64_t v10 = NSGetSizeAndAlignment(v9, sizep, 0);
      MEMORY[0x1F4188790](v10);
      v12 = (unsigned __int8 *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
      if (v11 >= 0x200) {
        size_t v13 = 512;
      }
      else {
        size_t v13 = v11;
      }
      bzero((char *)v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v13);
      [a1 getArgument:v12 atIndex:v7 + 2];
      int v15 = *v9;
      if (v15 > 80)
      {
        switch(*v9)
        {
          case 'c':
            id v16 = [NSNumber numberWithChar:(char)*v12];
            if (!v16) {
              break;
            }
            goto LABEL_43;
          case 'd':
            id v16 = [NSNumber numberWithDouble:*(double *)v12];
            if (!v16) {
              break;
            }
            goto LABEL_43;
          case 'e':
          case 'g':
          case 'h':
          case 'j':
          case 'k':
          case 'm':
          case 'n':
          case 'o':
          case 'p':
          case 'r':
            break;
          case 'f':
            LODWORD(v14) = *(_DWORD *)v12;
            id v16 = [NSNumber numberWithFloat:v14];
            if (!v16) {
              break;
            }
            goto LABEL_43;
          case 'i':
            id v16 = [NSNumber numberWithInt:*(unsigned int *)v12];
            if (!v16) {
              break;
            }
            goto LABEL_43;
          case 'l':
            id v16 = [NSNumber numberWithLong:*(void *)v12];
            if (!v16) {
              break;
            }
            goto LABEL_43;
          case 'q':
            id v16 = [NSNumber numberWithLongLong:*(void *)v12];
            if (!v16) {
              break;
            }
            goto LABEL_43;
          case 's':
            id v16 = [NSNumber numberWithShort:*(__int16 *)v12];
            if (!v16) {
              break;
            }
            goto LABEL_43;
          default:
            if (v15 == 81)
            {
              id v16 = [NSNumber numberWithUnsignedLongLong:*(void *)v12];
              if (v16) {
                goto LABEL_43;
              }
            }
            else if (v15 == 83)
            {
              id v16 = [NSNumber numberWithUnsignedShort:*(unsigned __int16 *)v12];
              if (v16) {
                goto LABEL_43;
              }
            }
            break;
        }
LABEL_42:
        id v16 = [MEMORY[0x1E4F29238] value:v12 withObjCType:v9];
        goto LABEL_43;
      }
      if (v15 > 72)
      {
        if (v15 == 73)
        {
          id v16 = [NSNumber numberWithUnsignedInt:*(unsigned int *)v12];
          if (v16) {
            goto LABEL_43;
          }
          goto LABEL_42;
        }
        if (v15 != 76) {
          goto LABEL_42;
        }
        id v16 = [NSNumber numberWithUnsignedLong:*(void *)v12];
        if (!v16) {
          goto LABEL_42;
        }
      }
      else
      {
        if (v15 == 66)
        {
          id v16 = [NSNumber numberWithBool:*v12];
          if (v16) {
            goto LABEL_43;
          }
          goto LABEL_42;
        }
        if (v15 != 67) {
          goto LABEL_42;
        }
        id v16 = [NSNumber numberWithUnsignedChar:*v12];
        if (!v16) {
          goto LABEL_42;
        }
      }
    }
LABEL_43:
    v17 = *(void **)&v6[8 * v7];
    *(void *)&v6[8 * v7] = v16;

    ++v7;
  }
  while (v4 != v7);
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:v4];
  uint64_t v19 = 8 * v21[0];
  do
  {

    v19 -= 8;
  }
  while (v19 != 16);
LABEL_50:
  return v18;
}

@end