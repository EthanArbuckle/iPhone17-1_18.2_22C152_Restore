@interface PETEventStringValidator
+ (BOOL)dictionaryContainsValidStrings:(id)a3;
+ (BOOL)setContainsValidStrings:(id)a3;
+ (BOOL)stringIsValid:(id)a3;
+ (id)sanitizedDictionary:(id)a3;
+ (id)sanitizedSet:(id)a3;
+ (id)sanitizedString:(id)a3;
@end

@implementation PETEventStringValidator

+ (id)sanitizedString:(id)a3
{
  v3 = (__CFString *)a3;
  size_t v4 = [(__CFString *)v3 length];
  if (v4)
  {
    size_t v5 = v4;
    v6 = malloc_type_calloc(v4, 1uLL, 0x100004077774924uLL);
    if (v6)
    {
      v7 = v6;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      CFStringRef theString = v3;
      uint64_t v36 = 0;
      int64_t v37 = v5;
      CharactersPtr = CFStringGetCharactersPtr(v3);
      CStringPtr = 0;
      v34 = CharactersPtr;
      if (!CharactersPtr) {
        CStringPtr = CFStringGetCStringPtr(v3, 0x600u);
      }
      uint64_t v10 = 0;
      int64_t v11 = 0;
      int64_t v12 = 0;
      int64_t v38 = 0;
      int64_t v39 = 0;
      uint64_t v13 = 64;
      v35 = CStringPtr;
      do
      {
        if ((unint64_t)v12 >= 4) {
          uint64_t v14 = 4;
        }
        else {
          uint64_t v14 = v12;
        }
        if (v12 < 0 || (uint64_t v15 = v37, v37 <= v12))
        {
          char v17 = 95;
        }
        else
        {
          if (v34)
          {
            UniChar v16 = v34[v12 + v36];
          }
          else if (v35)
          {
            UniChar v16 = v35[v36 + v12];
          }
          else
          {
            if (v39 <= v12 || v11 > v12)
            {
              uint64_t v18 = v14 + v10;
              uint64_t v19 = v13 - v14;
              int64_t v20 = v12 - v14;
              int64_t v21 = v20 + 64;
              if (v20 + 64 >= v37) {
                int64_t v21 = v37;
              }
              int64_t v38 = v20;
              int64_t v39 = v21;
              if (v37 >= v19) {
                uint64_t v15 = v19;
              }
              v41.length = v15 + v18;
              v41.location = v20 + v36;
              CFStringGetCharacters(theString, v41, (UniChar *)&v25);
              int64_t v11 = v38;
            }
            UniChar v16 = *((_WORD *)&v25 + v12 - v11);
          }
          char v17 = 95;
          switch(v16)
          {
            case '0':
            case '1':
            case '2':
            case '3':
            case '4':
            case '5':
            case '6':
            case '7':
            case '8':
            case '9':
            case 'A':
            case 'B':
            case 'C':
            case 'D':
            case 'E':
            case 'F':
            case 'G':
            case 'H':
            case 'I':
            case 'J':
            case 'K':
            case 'L':
            case 'M':
            case 'N':
            case 'O':
            case 'P':
            case 'Q':
            case 'R':
            case 'S':
            case 'T':
            case 'U':
            case 'V':
            case 'W':
            case 'X':
            case 'Y':
            case 'Z':
            case '_':
            case 'a':
            case 'b':
            case 'c':
            case 'd':
            case 'e':
            case 'f':
            case 'g':
            case 'h':
            case 'i':
            case 'j':
            case 'k':
            case 'l':
            case 'm':
            case 'n':
            case 'o':
            case 'p':
            case 'q':
            case 'r':
            case 's':
            case 't':
            case 'u':
            case 'v':
            case 'w':
            case 'x':
            case 'y':
            case 'z':
              char v17 = v16;
              break;
            default:
              break;
          }
        }
        v7[v12++] = v17;
        --v10;
        ++v13;
      }
      while (v5 != v12);
      if (*v7 == 95) {
        unsigned char *v7 = 120;
      }
      id v22 = [NSString alloc];
      v23 = (__CFString *)objc_msgSend(v22, "initWithBytes:length:encoding:", v7, v5, 1, v25, v26, v27, v28, v29, v30, v31, v32);
      free(v7);
    }
    else
    {
      v23 = 0;
    }
  }
  else
  {
    v23 = v3;
  }

  return v23;
}

+ (id)sanitizedSet:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  size_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        int64_t v11 = objc_msgSend(a1, "sanitizedString:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  int64_t v12 = (void *)[v5 copy];

  return v12;
}

+ (id)sanitizedDictionary:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  size_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(id *)(*((void *)&v18 + 1) + 8 * i);
        int64_t v12 = objc_msgSend(v6, "objectForKeyedSubscript:", v11, (void)v18);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v13 = [a1 sanitizedString:v11];

          id v11 = (id)v13;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v14 = [a1 sanitizedString:v12];

          int64_t v12 = (void *)v14;
        }
        if (v11) {
          BOOL v15 = v12 == 0;
        }
        else {
          BOOL v15 = 1;
        }
        if (!v15) {
          [v5 setObject:v12 forKeyedSubscript:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  long long v16 = (void *)[v5 copy];

  return v16;
}

+ (BOOL)setContainsValidStrings:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (!objc_msgSend(a1, "stringIsValid:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
        {
          BOOL v9 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_11:

  return v9;
}

+ (BOOL)dictionaryContainsValidStrings:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(a1, "stringIsValid:", v9, (void)v13)) {
          goto LABEL_14;
        }
        uint64_t v10 = objc_msgSend(v4, "objectForKeyedSubscript:", v9, (void)v13);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && ![a1 stringIsValid:v10])
        {

LABEL_14:
          BOOL v11 = 0;
          goto LABEL_15;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v11 = 1;
LABEL_15:

  return v11;
}

+ (BOOL)stringIsValid:(id)a3
{
  v3 = (__CFString *)a3;
  uint64_t v4 = [(__CFString *)v3 length];
  if (v4)
  {
    unint64_t v5 = v4;
    memset(v23, 0, sizeof(v23));
    CFStringRef theString = v3;
    uint64_t v27 = 0;
    uint64_t v28 = v4;
    CharactersPtr = CFStringGetCharactersPtr(v3);
    CStringPtr = 0;
    long long v25 = CharactersPtr;
    if (!CharactersPtr) {
      CStringPtr = CFStringGetCStringPtr(v3, 0x600u);
    }
    uint64_t v8 = 0;
    BOOL v9 = 0;
    uint64_t v10 = 0;
    uint64_t v29 = 0;
    uint64_t v30 = 0;
    uint64_t v11 = 64;
    long long v26 = CStringPtr;
    uint64_t v12 = MEMORY[0x1E4F14390];
    while (1)
    {
      uint64_t v13 = (unint64_t)v10 >= 4 ? 4 : v10;
      if (v10 < 0) {
        break;
      }
      uint64_t v14 = v28;
      if (v28 <= v10) {
        break;
      }
      if (v25)
      {
        UniChar v15 = v25[v10 + v27];
      }
      else if (v26)
      {
        UniChar v15 = v26[v27 + v10];
      }
      else
      {
        if (v30 <= v10 || (uint64_t v17 = v29, v29 > v10))
        {
          uint64_t v18 = v13 + v8;
          uint64_t v19 = v11 - v13;
          uint64_t v20 = v10 - v13;
          uint64_t v21 = v20 + 64;
          if (v20 + 64 >= v28) {
            uint64_t v21 = v28;
          }
          uint64_t v29 = v20;
          uint64_t v30 = v21;
          if (v28 >= v19) {
            uint64_t v14 = v19;
          }
          v31.length = v14 + v18;
          v31.location = v20 + v27;
          CFStringGetCharacters(theString, v31, (UniChar *)v23);
          uint64_t v17 = v29;
        }
        UniChar v15 = *((_WORD *)v23 + v10 - v17);
      }
      unsigned int v16 = v15;
      if (v15 <= 0x7Fu) {
        goto LABEL_13;
      }
      if (__maskrune(v15, 0x500uLL)) {
        goto LABEL_29;
      }
LABEL_14:
      if (!v10 || v15 != 95) {
        goto LABEL_32;
      }
LABEL_29:
      BOOL v9 = ++v10 >= v5;
      --v8;
      ++v11;
      if (v5 == v10) {
        goto LABEL_32;
      }
    }
    unsigned int v16 = 0;
    UniChar v15 = 0;
LABEL_13:
    if ((*(_DWORD *)(v12 + 4 * v16 + 60) & 0x500) != 0) {
      goto LABEL_29;
    }
    goto LABEL_14;
  }
  BOOL v9 = 0;
LABEL_32:

  return v9;
}

@end