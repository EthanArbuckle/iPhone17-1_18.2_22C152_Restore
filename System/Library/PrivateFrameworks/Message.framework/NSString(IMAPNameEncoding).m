@interface NSString(IMAPNameEncoding)
- (__CFString)mf_encodedIMAPMailboxName;
- (id)mf_decodedIMAPMailboxName;
@end

@implementation NSString(IMAPNameEncoding)

- (id)mf_decodedIMAPMailboxName
{
  v2 = (void *)[(__CFString *)a1 copy];
  CFIndex v3 = [(__CFString *)a1 length];
  theString = a1;
  uint64_t v4 = [(__CFString *)a1 rangeOfString:@"-", 0, 0, v3 options range];
  uint64_t v6 = v5;
  if (!v5) {
    goto LABEL_33;
  }
  uint64_t v7 = v4;
  id v8 = 0;
  unint64_t v9 = 0;
  v10 = a1;
  v42 = v2;
  do
  {
    uint64_t v11 = [(__CFString *)v10 rangeOfString:@"&", 4, v9, v7 - v9 options range];
    if (!v12)
    {
LABEL_10:
      if (v8)
      {
        v10 = theString;
        if (v7 + v6 <= v9)
        {
          id v15 = 0;
        }
        else
        {
          uint64_t v18 = [v8 length];
          [v8 setLength:v18 + 2 * (v7 + v6 - v9)];
          id v19 = v8;
          uint64_t v20 = [v19 mutableBytes];
          v46.location = v9;
          v46.length = v7 + v6 - v9;
          CFStringGetCharacters(theString, v46, (UniChar *)(v20 + v18));
          id v15 = 0;
          id v8 = v19;
        }
        v2 = v42;
      }
      else
      {
        id v15 = 0;
        v2 = v42;
        v10 = theString;
      }
      goto LABEL_28;
    }
    unint64_t v13 = v11;
    CFIndex v14 = v7 - (v11 + v12);
    if (v7 == v11 + v12)
    {
      __int16 v44 = 38;
      id v15 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&v44 length:2];
      if (!v15) {
        goto LABEL_10;
      }
    }
    else
    {
      MutableCopy = (__CFCharacterSet *)mf_decodedIMAPMailboxName_invalidModifiedBase64Set;
      if (!mf_decodedIMAPMailboxName_invalidModifiedBase64Set)
      {
        CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetAlphaNumeric);
        MutableCopy = CFCharacterSetCreateMutableCopy(0, Predefined);
        CFCharacterSetAddCharactersInString(MutableCopy, @"+,");
        CFCharacterSetInvert(MutableCopy);
        mf_decodedIMAPMailboxName_invalidModifiedBase64Set = (uint64_t)MutableCopy;
      }
      v50.location = v13 + 1;
      v50.length = v14;
      if (CFStringFindCharacterFromSet(theString, MutableCopy, v50, 0, 0)) {
        goto LABEL_10;
      }
      id v21 = (id) [objc_allocWithZone(MEMORY[0x1E4F1CA58]) initWithLength:v14];
      [v21 mutableBytes];
      MFStringGetBytes();
      v22 = objc_msgSend(v21, "mf_decodeModifiedBase64", 0);
      v23 = (void *)[v22 mutableCopyWithZone:0];

      id v15 = v23;
      v24 = (char *)[v15 mutableBytes];
      uint64_t v25 = [v15 length];
      if ((uint64_t)(v25 & 0xFFFFFFFFFFFFFFFELL) >= 1)
      {
        v26 = &v24[v25 & 0xFFFFFFFFFFFFFFFELL];
        do
        {
          *(_WORD *)v24 = bswap32(*(unsigned __int16 *)v24) >> 16;
          v24 += 2;
        }
        while (v24 < v26);
      }

      if (!v15) {
        goto LABEL_10;
      }
    }
    v10 = theString;
    if (!v8)
    {
      v27 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1CA58]), "initWithCapacity:", 2 * -[__CFString length](theString, "length"));
      v28 = v27;
      if (v9)
      {
        [v27 setLength:2 * v9];
        id v8 = v28;
        v29 = (UniChar *)[v8 mutableBytes];
        v47.location = 0;
        v47.length = v9;
        CFStringGetCharacters(theString, v47, v29);
      }
      else
      {
        id v8 = v27;
      }
    }
    BOOL v30 = v13 > v9;
    CFIndex v31 = v13 - v9;
    if (v30)
    {
      uint64_t v32 = [v8 length];
      [v8 setLength:v32 + 2 * v31];
      uint64_t v33 = [v8 mutableBytes];
      v48.location = v9;
      v48.length = v31;
      CFStringGetCharacters(theString, v48, (UniChar *)(v33 + v32));
    }
    v2 = v42;
    [v8 appendData:v15];
LABEL_28:
    unint64_t v34 = v3 + v9;
    unint64_t v9 = v7 + v6;
    CFIndex v3 = v34 - (v7 + v6);
    uint64_t v7 = [(__CFString *)v10 rangeOfString:@"-", 0, v7 + v6, v3 options range];
    uint64_t v6 = v35;
  }
  while (v6);
  if (!v8)
  {
LABEL_33:
    id v39 = 0;
    goto LABEL_34;
  }
  if (v3)
  {
    uint64_t v36 = [v8 length];
    [v8 setLength:v36 + 2 * v3];
    uint64_t v37 = [v8 mutableBytes];
    v49.location = v9;
    v49.length = v3;
    CFStringGetCharacters(v10, v49, (UniChar *)(v37 + v36));
  }
  id v38 = [NSString alloc];
  id v39 = v8;
  uint64_t v40 = objc_msgSend(v38, "initWithCharacters:length:", objc_msgSend(v39, "bytes"), (unint64_t)objc_msgSend(v39, "length") >> 1);

  v2 = (void *)v40;
LABEL_34:

  return v2;
}

- (__CFString)mf_encodedIMAPMailboxName
{
  v2 = (__CFString *)[(__CFString *)a1 copy];
  uint64_t v3 = [(__CFString *)a1 length];
  *(void *)&long long v4 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  long long v38 = v4;
  long long v39 = v4;
  long long v36 = v4;
  long long v37 = v4;
  long long v34 = v4;
  long long v35 = v4;
  *(_OWORD *)buffer = v4;
  long long v33 = v4;
  if (!mf_encodedIMAPMailboxName_passThroughSet)
  {
    v48.location = 32;
    v48.length = 94;
    mf_encodedIMAPMailboxName_passThroughSet = (uint64_t)CFCharacterSetCreateWithCharactersInRange(0, v48);
  }
  uint64_t v40 = a1;
  uint64_t v43 = 0;
  uint64_t v44 = v3;
  CharactersPtr = CFStringGetCharactersPtr(a1);
  if (CharactersPtr) {
    CStringPtr = 0;
  }
  else {
    CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
  }
  v42 = CStringPtr;
  uint64_t v45 = 0;
  uint64_t v46 = 0;
  if (v3 < 1)
  {
    id v6 = 0;
    goto LABEL_61;
  }
  v29 = v2;
  id v6 = 0;
  uint64_t v7 = 0;
  do
  {
    unsigned __int16 v31 = -21846;
    if (v7 < 0 || (uint64_t v8 = v44, v44 <= v7))
    {
      UniChar v11 = 0;
    }
    else
    {
      unint64_t v9 = (UniChar *)CharactersPtr;
      if (CharactersPtr)
      {
        uint64_t v10 = v43 + v7;
      }
      else
      {
        if (v42)
        {
          UniChar v11 = v42[v43 + v7];
          goto LABEL_14;
        }
        if (v46 <= v7 || (uint64_t v24 = v45, v45 > v7))
        {
          uint64_t v25 = v7 - 4;
          if ((unint64_t)v7 < 4) {
            uint64_t v25 = 0;
          }
          if (v25 + 64 < v44) {
            uint64_t v8 = v25 + 64;
          }
          uint64_t v45 = v25;
          uint64_t v46 = v8;
          v50.location = v43 + v25;
          v50.length = v8 - v25;
          CFStringGetCharacters(v40, v50, buffer);
          uint64_t v24 = v45;
        }
        uint64_t v10 = v7 - v24;
        unint64_t v9 = buffer;
      }
      UniChar v11 = v9[v10];
    }
LABEL_14:
    unsigned __int16 v31 = v11;
    int IsCharacterMember = CFCharacterSetIsCharacterMember((CFCharacterSetRef)mf_encodedIMAPMailboxName_passThroughSet, v11);
    int v13 = v31;
    if (IsCharacterMember && v31 != 38)
    {
      if (v6)
      {
        v30[0] = v31;
        [v6 appendBytes:v30 length:1];
      }
      goto LABEL_24;
    }
    if (!v6)
    {
      CFIndex v14 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1CA58]), "initWithCapacity:", -[__CFString length](a1, "length"));
      id v15 = v14;
      if (v7 >= 1)
      {
        [v14 setLength:v7];
        [v15 mutableBytes];
        uint64_t v28 = 0;
        MFStringGetBytes();
      }
      int v13 = v31;
      id v6 = v15;
    }
    if (v13 == 38)
    {
      strcpy(v30, "&-");
      [v6 appendBytes:v30 length:2];
LABEL_24:
      ++v7;
      continue;
    }
    v16 = (void *)[objc_allocWithZone(MEMORY[0x1E4F1CA58]) initWithCapacity:64];
    unsigned int v17 = v31;
    uint64_t v18 = v7 + 1;
    do
    {
      uint64_t v7 = v18;
      unsigned __int16 v31 = bswap32(v17) >> 16;
      objc_msgSend(v16, "appendBytes:length:", &v31, 2, v28);
      if (v7 >= v3) {
        break;
      }
      if (v7 - 1 < -1 || (uint64_t v19 = v44, v44 <= v7))
      {
        UniChar v20 = 0;
      }
      else if (CharactersPtr)
      {
        UniChar v20 = CharactersPtr[v7 + v43];
      }
      else if (v42)
      {
        UniChar v20 = v42[v43 + v7];
      }
      else
      {
        if (v46 <= v7 || (uint64_t v21 = v45, v45 > v7))
        {
          uint64_t v22 = v7 - 4;
          if ((unint64_t)v7 < 4) {
            uint64_t v22 = 0;
          }
          if (v22 + 64 < v44) {
            uint64_t v19 = v22 + 64;
          }
          uint64_t v45 = v22;
          uint64_t v46 = v19;
          v49.location = v43 + v22;
          v49.length = v19 - v22;
          CFStringGetCharacters(v40, v49, buffer);
          uint64_t v21 = v45;
        }
        UniChar v20 = buffer[v7 - v21];
      }
      unsigned __int16 v31 = v20;
      if (CFCharacterSetIsCharacterMember((CFCharacterSetRef)mf_encodedIMAPMailboxName_passThroughSet, v20)) {
        break;
      }
      unsigned int v17 = v31;
      uint64_t v18 = v7 + 1;
    }
    while (v31 != 38);
    [v6 appendBytes:"&" length:1];
    v23 = objc_msgSend(v16, "mf_encodeModifiedBase64");
    [v6 appendData:v23];

    [v6 appendBytes:"-" length:1];
  }
  while (v7 < v3);
  v2 = v29;
  if (v6)
  {
    id v6 = v6;
    CFStringRef v26 = CFStringCreateWithBytes(0, (const UInt8 *)[v6 bytes], objc_msgSend(v6, "length"), 0x600u, 0);

    v2 = (__CFString *)v26;
  }
LABEL_61:

  return v2;
}

@end