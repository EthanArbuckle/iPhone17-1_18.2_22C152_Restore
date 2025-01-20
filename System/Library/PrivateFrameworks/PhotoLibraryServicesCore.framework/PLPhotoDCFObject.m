@interface PLPhotoDCFObject
+ (id)validDCFNameForName:(id)a3 requiredLength:(int)a4 nameLength:(int)a5 number:(int *)a6 numberRange:(_NSRange)a7 suffix:(id)a8;
- (PLPhotoDCFObject)initWithName:(id)a3 number:(int)a4;
- (id)description;
- (id)name;
- (int)number;
- (int64_t)compare:(id)a3;
@end

@implementation PLPhotoDCFObject

- (void).cxx_destruct
{
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@ %p: %@ (%d)>", objc_opt_class(), self, self->_name, self->_number];
}

- (int64_t)compare:(id)a3
{
  int v4 = [a3 number];
  int number = self->_number;
  BOOL v6 = v4 < number;
  int64_t v7 = v4 > number;
  if (v6) {
    return -1;
  }
  else {
    return v7;
  }
}

- (int)number
{
  return self->_number;
}

- (id)name
{
  return self->_name;
}

- (PLPhotoDCFObject)initWithName:(id)a3 number:(int)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLPhotoDCFObject;
  v8 = [(PLPhotoDCFObject *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_name, a3);
    v9->_int number = a4;
  }

  return v9;
}

+ (id)validDCFNameForName:(id)a3 requiredLength:(int)a4 nameLength:(int)a5 number:(int *)a6 numberRange:(_NSRange)a7 suffix:(id)a8
{
  NSUInteger length = a7.length;
  int64_t location = a7.location;
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a8;
  uint64_t v14 = [v12 length];
  v15 = (__CFString *)v12;
  MEMORY[0x1F4188790]();
  v16 = (char *)&v62 - ((length + 16) & 0xFFFFFFFFFFFFFFF0);
  if (v14 != a4)
  {
    v19 = 0;
    id v20 = v15;
    goto LABEL_85;
  }
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v69 = 0u;
  *(_OWORD *)buffer = 0u;
  int64_t v17 = location + length;
  v76 = v15;
  long long v79 = xmmword_19BDC6F00;
  CharactersPtr = CFStringGetCharactersPtr(v15);
  if (CharactersPtr) {
    CStringPtr = 0;
  }
  else {
    CStringPtr = CFStringGetCStringPtr(v15, 0x600u);
  }
  NSUInteger v67 = length;
  v64 = a6;
  v65 = &v62;
  v63 = v15;
  id v66 = v13;
  uint64_t v80 = 0;
  uint64_t v81 = 0;
  v78 = CStringPtr;
  if (location >= v17)
  {
    uint64_t v21 = 0;
    BOOL v32 = 1;
  }
  else
  {
    uint64_t v21 = 0;
    uint64_t v22 = 0;
    int64_t v23 = -location;
    int64_t v24 = location + 64;
    unint64_t v25 = location;
    v26 = &buffer[location];
    do
    {
      uint64_t v27 = location + v22;
      if (v25 >= 4) {
        uint64_t v28 = 4;
      }
      else {
        uint64_t v28 = v25;
      }
      if (v27 < 0 || (uint64_t v29 = *((void *)&v79 + 1), *((uint64_t *)&v79 + 1) <= v27))
      {
        LOBYTE(v30) = 0;
      }
      else if (CharactersPtr)
      {
        UniChar v30 = CharactersPtr[location + v22 + (void)v79];
      }
      else if (v78)
      {
        LOBYTE(v30) = v78[(void)v79 + location + v22];
      }
      else
      {
        if (v81 <= v27 || v21 > v27)
        {
          uint64_t v33 = v28 + v23;
          uint64_t v34 = v24 - v28;
          uint64_t v35 = -v28;
          v36 = v26;
          uint64_t v37 = 64 - v28;
          uint64_t v38 = v22 + location - v28;
          uint64_t v39 = location + v22 + v37;
          if (v39 >= *((uint64_t *)&v79 + 1)) {
            uint64_t v39 = *((void *)&v79 + 1);
          }
          uint64_t v80 = v38;
          uint64_t v81 = v39;
          if (*((uint64_t *)&v79 + 1) >= v34) {
            uint64_t v29 = v34;
          }
          v84.NSUInteger length = v29 + v33;
          v84.int64_t location = location + v22 + v35 + v79;
          CFStringGetCharacters(v76, v84, buffer);
          v26 = v36;
          uint64_t v21 = v80;
        }
        UniChar v30 = v26[v22 - v21];
      }
      v16[v22] = v30;
      unsigned int v31 = (char)v30 - 48;
      BOOL v32 = v31 < 0xA;
      if (v31 > 9) {
        break;
      }
      ++v25;
      ++v22;
      --v23;
      ++v24;
    }
    while (v22 + location < v17);
  }
  NSUInteger v40 = v67;
  if (location) {
    uint64_t v41 = 0;
  }
  else {
    uint64_t v41 = v67;
  }
  if (location) {
    uint64_t v42 = location;
  }
  else {
    uint64_t v42 = 8;
  }
  if (!v32 || v41 >= v42 || v41 >= v14)
  {
    v15 = v63;
    id v20 = v63;
    goto LABEL_74;
  }
  int v43 = 0;
  uint64_t v44 = -v41;
  uint64_t v45 = v41 + 64;
  do
  {
    if ((unint64_t)v41 >= 4) {
      uint64_t v46 = 4;
    }
    else {
      uint64_t v46 = v41;
    }
    if (v41 < 0 || (uint64_t v47 = *((void *)&v79 + 1), *((uint64_t *)&v79 + 1) <= v41))
    {
      UniChar v48 = 0;
    }
    else
    {
      if (CharactersPtr)
      {
        UniChar v48 = CharactersPtr[v41 + (void)v79];
      }
      else if (v78)
      {
        UniChar v48 = v78[(void)v79 + v41];
      }
      else
      {
        if (v81 <= v41 || v21 > v41)
        {
          uint64_t v50 = v46 + v44;
          uint64_t v51 = v45 - v46;
          uint64_t v52 = v41 - v46;
          uint64_t v53 = v52 + 64;
          if (v52 + 64 >= *((uint64_t *)&v79 + 1)) {
            uint64_t v53 = *((void *)&v79 + 1);
          }
          uint64_t v80 = v52;
          uint64_t v81 = v53;
          if (*((uint64_t *)&v79 + 1) >= v51) {
            uint64_t v47 = v51;
          }
          v85.NSUInteger length = v47 + v50;
          v85.int64_t location = v52 + v79;
          CFStringGetCharacters(v76, v85, buffer);
          uint64_t v21 = v80;
        }
        UniChar v48 = buffer[v41 - v21];
      }
      if (v48 == 95 || (unsigned __int16)(v48 - 65) < 0x1Au || (unsigned __int16)(v48 - 48) < 0xAu)
      {
        BOOL v32 = 1;
        goto LABEL_50;
      }
    }
    unsigned int v49 = (unsigned __int16)(v48 - 97);
    BOOL v32 = v49 < 0x1A;
    if (v49 >= 0x1A) {
      break;
    }
    int v43 = 1;
LABEL_50:
    if (++v41 >= v42) {
      break;
    }
    --v44;
    ++v45;
  }
  while (v41 < v14);
  v15 = v63;
  id v20 = v63;
  NSUInteger v40 = v67;
  if ((v32 & v43) == 1)
  {
    id v20 = [(__CFString *)v63 uppercaseString];

    BOOL v32 = 1;
  }
LABEL_74:
  id v13 = v66;
  v56 = v64;
  if (v64 && v32)
  {
    v16[v40] = 0;
    int *v56 = atoi(v16);
  }
  if (v13) {
    BOOL v57 = v32;
  }
  else {
    BOOL v57 = 0;
  }
  if (v57)
  {
    v58 = [v20 uppercaseString];
    int v59 = [v58 hasSuffix:v13];

    if (!v59) {
      goto LABEL_82;
    }
LABEL_84:
    v19 = v20;
  }
  else
  {
    if (v32) {
      goto LABEL_84;
    }
LABEL_82:
    v19 = 0;
  }
LABEL_85:
  id v60 = v19;

  return v60;
}

@end