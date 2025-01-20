@interface NSString(Occurrence)
- (uint64_t)mk_occurrenceCountOfString:()Occurrence;
@end

@implementation NSString(Occurrence)

- (uint64_t)mk_occurrenceCountOfString:()Occurrence
{
  v4 = a3;
  if (v4)
  {
    CFIndex Length = CFStringGetLength(a1);
    CFIndex v6 = CFStringGetLength(v4);
    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    *(_OWORD *)v57 = 0u;
    long long v58 = 0u;
    CFStringRef v65 = a1;
    uint64_t v68 = 0;
    CFIndex v69 = Length;
    CharactersPtr = CFStringGetCharactersPtr(a1);
    CStringPtr = 0;
    v66 = CharactersPtr;
    if (!CharactersPtr) {
      CStringPtr = CFStringGetCStringPtr(a1, 0x600u);
    }
    CFIndex v70 = 0;
    CFIndex v71 = 0;
    v67 = CStringPtr;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    *(_OWORD *)buffer = 0u;
    long long v43 = 0u;
    CFStringRef theString = v4;
    uint64_t v53 = 0;
    CFIndex v54 = v6;
    v9 = CFStringGetCharactersPtr(v4);
    v10 = 0;
    v51 = v9;
    if (!v9) {
      v10 = CFStringGetCStringPtr(v4, 0x600u);
    }
    v38 = v4;
    uint64_t v55 = 0;
    uint64_t v56 = 0;
    v52 = v10;
    CFIndex v40 = Length - v6;
    if (Length - v6 < 1)
    {
      uint64_t v13 = 0;
    }
    else
    {
      uint64_t v11 = v6;
      int64_t v12 = 0;
      uint64_t v13 = 0;
      uint64_t v39 = v11;
      do
      {
        if (v11 < 1)
        {
          uint64_t v35 = 0;
          uint64_t v36 = 1;
        }
        else
        {
          uint64_t v14 = 0;
          uint64_t v15 = 0;
          int64_t v16 = -v12;
          int64_t v17 = v12 + 64;
          uint64_t v18 = 64;
          unint64_t v19 = v12;
          uint64_t v41 = v13;
          while (1)
          {
            uint64_t v20 = v19 >= 4 ? 4 : v19;
            uint64_t v21 = (unint64_t)v15 >= 4 ? 4 : v15;
            CFIndex v22 = v12 + v15;
            if (v12 + v15 < 0 || (CFIndex v23 = v69, v69 <= v22))
            {
              UniChar v24 = 0;
            }
            else if (v66)
            {
              UniChar v24 = v66[v12 + v15 + v68];
            }
            else if (v67)
            {
              UniChar v24 = v67[v68 + v12 + v15];
            }
            else
            {
              if (v71 <= v22 || (CFIndex v29 = v70, v70 > v22))
              {
                int64_t v30 = v12 - v20;
                uint64_t v31 = v20 + v16;
                CFIndex v32 = v17 - v20;
                uint64_t v33 = v15 + v30;
                CFIndex v34 = v33 + 64;
                if (v33 + 64 >= v69) {
                  CFIndex v34 = v69;
                }
                CFIndex v70 = v33;
                CFIndex v71 = v34;
                if (v69 >= v32) {
                  CFIndex v23 = v32;
                }
                v73.length = v23 + v31;
                v73.location = v33 + v68;
                CFStringGetCharacters(v65, v73, v57);
                uint64_t v11 = v39;
                CFIndex v29 = v70;
              }
              UniChar v24 = v57[v12 - v29 + v15];
            }
            uint64_t v25 = v54;
            if (v54 <= v15)
            {
              UniChar v26 = 0;
            }
            else if (v51)
            {
              UniChar v26 = v51[v15 + v53];
            }
            else if (v52)
            {
              UniChar v26 = v52[v53 + v15];
            }
            else
            {
              if (v56 <= v15 || (uint64_t v27 = v55, v55 > v15))
              {
                uint64_t v28 = v15 - v21 + 64;
                if (v28 >= v54) {
                  uint64_t v28 = v54;
                }
                uint64_t v55 = v15 - v21;
                uint64_t v56 = v28;
                if (v54 >= v18 - v21) {
                  uint64_t v25 = v18 - v21;
                }
                v72.length = v25 + v21 + v14;
                v72.location = v15 - v21 + v53;
                CFStringGetCharacters(theString, v72, buffer);
                uint64_t v11 = v39;
                uint64_t v27 = v55;
              }
              UniChar v26 = buffer[v15 - v27];
            }
            if (v24 != v26) {
              break;
            }
            ++v15;
            ++v19;
            --v16;
            ++v17;
            --v14;
            ++v18;
            if (v11 == v15)
            {
              uint64_t v35 = 1;
              uint64_t v36 = v11;
              goto LABEL_50;
            }
          }
          uint64_t v35 = 0;
          uint64_t v36 = 1;
LABEL_50:
          uint64_t v13 = v41;
        }
        v13 += v35;
        v12 += v36;
      }
      while (v12 < v40);
    }
    v4 = v38;
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

@end