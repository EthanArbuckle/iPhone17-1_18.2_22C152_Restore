@interface PRTurkishSuffix
+ (id)standardTurkishNounSuffixes;
+ (id)standardTurkishSuffixes;
+ (id)standardTurkishVerbSuffixes;
+ (void)_enumerateSuffixMatchesForBuffer:(char *)a3 length:(unint64_t)a4 followedByLetter:(unsigned __int8)a5 options:(unint64_t)a6 depth:(unint64_t)a7 matchState:(int)a8 suffixStack:(id *)a9 suffixRangeStack:(_NSRange *)a10 usingBlock:(id)a11;
+ (void)enumerateSuffixMatchesForBuffer:(char *)a3 length:(unint64_t)a4 options:(unint64_t)a5 usingBlock:(id)a6;
+ (void)enumerateSuffixMatchesForWord:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5;
- (BOOL)postponesApostrophe;
- (PRTurkishSuffix)initWithPattern:(id)a3 name:(id)a4 type:(int)a5 postponesApostrophe:(BOOL)a6;
- (id)description;
- (id)name;
- (id)pattern;
- (int)suffixType;
- (unint64_t)matchingIndexInBuffer:(char *)a3 length:(unint64_t)a4 followedByLetter:(unsigned __int8)a5 matchWithNameOnly:(BOOL *)a6;
- (void)_fillPatternBuffer;
- (void)dealloc;
@end

@implementation PRTurkishSuffix

- (void)_fillPatternBuffer
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  CFIndex v3 = [(NSString *)self->_pattern length];
  CFIndex usedBufLen = 0;
  self->_unint64_t patternBufferLength = 0;
  v12.location = 0;
  v12.length = v3;
  if (v3 == CFStringGetBytes((CFStringRef)self->_pattern, v12, 0x504u, 0x5Fu, 0, buffer, 16, &usedBufLen))
  {
    unint64_t v4 = usedBufLen;
    if (usedBufLen)
    {
      unint64_t v5 = 0;
      do
      {
        unint64_t patternBufferLength = self->_patternBufferLength;
        if (patternBufferLength > 0xF) {
          break;
        }
        int v7 = buffer[v5];
        if (v7 == 40 && v5 + 2 < v4 && buffer[v5 + 2] == 41)
        {
          self->_isOptional[patternBufferLength] = 1;
          LOBYTE(v7) = buffer[v5 + 1];
          unint64_t patternBufferLength = self->_patternBufferLength;
          uint64_t v8 = 3;
        }
        else
        {
          uint64_t v8 = 1;
        }
        self->_unint64_t patternBufferLength = patternBufferLength + 1;
        self->_patternBuffer[patternBufferLength] = v7;
        v5 += v8;
      }
      while (v5 < v4);
    }
  }
}

- (PRTurkishSuffix)initWithPattern:(id)a3 name:(id)a4 type:(int)a5 postponesApostrophe:(BOOL)a6
{
  v12.receiver = self;
  v12.super_class = (Class)PRTurkishSuffix;
  v10 = [(PRTurkishSuffix *)&v12 init];
  if (v10)
  {
    v10->_pattern = (NSString *)[a3 copy];
    v10->_name = (NSString *)[a4 copy];
    v10->_suffixType = a5;
    v10->_postponesApostrophe = a6;
    [(PRTurkishSuffix *)v10 _fillPatternBuffer];
  }
  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PRTurkishSuffix;
  [(PRTurkishSuffix *)&v3 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"%@/%lu", -[PRTurkishSuffix pattern](self, "pattern"), -[PRTurkishSuffix suffixType](self, "suffixType")];
}

- (id)pattern
{
  return self->_pattern;
}

- (id)name
{
  return self->_name;
}

- (int)suffixType
{
  return self->_suffixType;
}

- (BOOL)postponesApostrophe
{
  return self->_postponesApostrophe;
}

- (unint64_t)matchingIndexInBuffer:(char *)a3 length:(unint64_t)a4 followedByLetter:(unsigned __int8)a5 matchWithNameOnly:(BOOL *)a6
{
  int v68 = a5;
  unint64_t patternBufferLength = self->_patternBufferLength;
  __int16 v72 = 0;
  unsigned __int8 v71 = 0;
  if (a4)
  {
    int v9 = 0;
    char v69 = 0;
    char v70 = 0;
    BOOL v62 = 0;
    patternBuffer = self->_patternBuffer;
    uint64_t v64 = 0;
    isOptional = self->_isOptional;
    v61 = a3 - 1;
    unint64_t v63 = 0x7FFFFFFFFFFFFFFFLL;
    unint64_t v10 = a4;
    while (1)
    {
      if (!patternBufferLength) {
        goto LABEL_224;
      }
      unint64_t v11 = v10 - 1;
      if (v10 == 1) {
        int v12 = 0;
      }
      else {
        int v12 = a3[v10 - 2];
      }
      int v13 = v68;
      if (v10 < a4) {
        int v13 = a3[v10];
      }
      unsigned int v14 = a3[v11];
      if (v14 - 65 < 0x1A || v14 - 192 < 0x17) {
        break;
      }
      if (a3[v11] <= 0xD7u)
      {
        BOOL v18 = v14 - 138 > 0x15 || ((1 << (v14 + 118)) & 0x200015) == 0;
        int v17 = a3[v11];
        if (!v18) {
          goto LABEL_27;
        }
      }
      else
      {
        if (v14 - 216 < 5) {
          goto LABEL_22;
        }
        if (v14 == 221)
        {
          int v17 = 105;
        }
        else
        {
          int v17 = a3[v11];
          if (v14 == 222) {
            goto LABEL_22;
          }
        }
      }
LABEL_30:
      int v19 = patternBuffer[--patternBufferLength];
      if (v19 == v17) {
        goto LABEL_105;
      }
      if (v19 == 65)
      {
        if ((v17 & 0xFB) == 0x61) {
          goto LABEL_105;
        }
        goto LABEL_116;
      }
      if ((v19 - 67) <= 1)
      {
        BOOL v20 = 1;
        if (v12 <= 0xF7 && (v12 - 97) >= 0x1A && (v12 - 223) >= 0x18) {
          BOOL v20 = (v12 + 102) <= 4u && (v12 & 1) == 0;
        }
        if ((v12 - 65) >= 0x1A && (v12 - 192) >= 0x17)
        {
          if (v12 > 215)
          {
            if ((v12 - 216) < 5) {
              goto LABEL_69;
            }
            if (v12 != 221)
            {
              if (v12 != 222) {
                goto LABEL_75;
              }
LABEL_69:
              LOBYTE(v12) = v12 + 32;
              goto LABEL_75;
            }
            LOBYTE(v12) = 105;
LABEL_80:
            unint64_t v26 = 0;
            do
            {
              unint64_t v27 = v26;
              if (v26 == 7) {
                break;
              }
              int v28 = byte_20CC650C0[++v26];
            }
            while (v28 != v12);
            BOOL v25 = v27 < 7;
LABEL_84:
            BOOL v29 = !v20 || !v25;
            if (v19 == 67 && v17 == 99 && (!v20 || !v25)) {
              goto LABEL_105;
            }
            BOOL v30 = v25 || !v20;
            BOOL v31 = v19 == 67 && v17 == 231;
            if (v31 && v30) {
              goto LABEL_105;
            }
            BOOL v33 = v17 == 100 && v29;
            if (v19 == 68 && v33) {
              goto LABEL_105;
            }
            if (v19 != 68 || v17 != 116) {
              BOOL v30 = 0;
            }
            if (v30)
            {
LABEL_105:
              if (v10 != 1)
              {
                if (isOptional[patternBufferLength])
                {
                  if (!patternBufferLength)
                  {
                    unsigned int v35 = a3[v10 - 2];
                    if (v35 > 0xF7
                      || v35 - 97 < 0x1A
                      || v35 - 223 < 0x18
                      || v35 - 154 <= 4 && ((1 << (v35 + 102)) & 0x15) != 0)
                    {
                      if (_isTurkishVowel(v35, 0, 0, 0))
                      {
                        if (v19 == 73) {
                          goto LABEL_224;
                        }
                      }
                      else if ((v19 - 110) <= 0xB && ((1 << (v19 - 110)) & 0x821) != 0)
                      {
                        goto LABEL_224;
                      }
                    }
                  }
                }
              }
              if (!_isTurkishVowel(v14, &v72, (BOOL *)&v72 + 1, &v71)) {
                goto LABEL_139;
              }
              if (v70 & 1 | ((v69 & 1) == 0))
              {
                int v36 = v71;
              }
              else
              {
                if (v72 != (BYTE4(v64) & 1)) {
                  goto LABEL_224;
                }
                int v36 = v71;
                if (v62 && v71 != (v64 & 1)) {
                  goto LABEL_224;
                }
              }
              BOOL v62 = HIBYTE(v72) != 0;
              LOBYTE(v64) = v36 != 0;
              BYTE4(v64) = v72 != 0;
              char v69 = 1;
              char v70 = 0;
              if ((v19 - 65) >= 0x1A
                && (v19 - 192) >= 0x17
                && (char v69 = 1, v70 = 0, (v19 - 216) >= 7)
                && ((v19 - 138) > 0x15 || ((1 << (v19 + 118)) & 0x200015) == 0))
              {
                char v69 = 1;
                char v70 = 1;
                if (patternBufferLength)
                {
LABEL_140:
                  --v10;
                  goto LABEL_206;
                }
              }
              else
              {
LABEL_139:
                if (patternBufferLength) {
                  goto LABEL_140;
                }
              }
              goto LABEL_144;
            }
            goto LABEL_116;
          }
          if ((v12 - 138) <= 0x15 && ((1 << (v12 + 118)) & 0x200015) != 0)
          {
LABEL_72:
            if (v12 == 159) {
              LOBYTE(v12) = -1;
            }
            else {
              LOBYTE(v12) = v12 + 16;
            }
          }
LABEL_75:
          if (v12 != 231) {
            goto LABEL_80;
          }
          BOOL v25 = 1;
          goto LABEL_84;
        }
        if ((v12 - 138) > 0x15 || ((1 << (v12 + 118)) & 0x200015) == 0)
        {
          if (v12 != 73) {
            goto LABEL_69;
          }
          LOBYTE(v12) = -3;
          goto LABEL_80;
        }
        goto LABEL_72;
      }
      if (v19 == 75)
      {
        int v59 = v9;
        v21 = a6;
        BOOL isTurkishVowel = _isTurkishVowel(v12, 0, 0, 0);
        BOOL v23 = _isTurkishVowel(v13, 0, 0, 0);
        if (v17 == 107 || !isTurkishVowel)
        {
          a6 = v21;
          int v9 = v59;
          if (v17 == 107) {
            goto LABEL_105;
          }
        }
        else
        {
          BOOL v24 = v17 == 240 && v23;
          a6 = v21;
          int v9 = v59;
          if (v24) {
            goto LABEL_105;
          }
        }
      }
      else if (v19 == 73 && ((v17 - 252) < 2 || v17 == 105 || v17 == 117))
      {
        goto LABEL_105;
      }
LABEL_116:
      if (!isOptional[patternBufferLength]) {
        goto LABEL_224;
      }
      if (patternBufferLength) {
        goto LABEL_206;
      }
      if (v14 <= 0xF7 && v14 - 97 >= 0x1A && v14 - 223 >= 0x18 && (v14 - 154 > 4 || ((1 << (v14 + 102)) & 0x15) == 0))
      {
LABEL_143:
        unint64_t v11 = v10;
        goto LABEL_144;
      }
      if (_isTurkishVowel(v14, 0, 0, 0))
      {
        if ((v19 - 110) > 0xB) {
          goto LABEL_143;
        }
        unint64_t v11 = v10;
        if (((1 << (v19 - 110)) & 0x821) != 0) {
          goto LABEL_224;
        }
      }
      else
      {
        unint64_t v11 = v10;
        if (v19 == 73) {
          goto LABEL_224;
        }
      }
LABEL_144:
      unint64_t v37 = v11;
      do
      {
        unint64_t v38 = v37;
        if (!v37) {
          break;
        }
        unsigned int v39 = a3[v37 - 1];
        BOOL v40 = v39 <= 0xF7 && v39 - 97 >= 0x1A;
        if (!v40 || v39 - 223 < 0x18) {
          break;
        }
        --v37;
        unsigned int v42 = v39 - 154;
        BOOL v43 = v42 > 4;
        int v44 = (1 << v42) & 0x15;
      }
      while (v43 || v44 == 0);
      unint64_t v10 = v11;
      if (!(v70 & 1 | ((v69 & 1) == 0)))
      {
        if (v11)
        {
          uint64_t v46 = 0;
          v47 = v61;
          while (1)
          {
            int v48 = v47[v11];
            if (v48 == 97 && v11 - 3 == v46)
            {
              int v48 = *a3 == 105 && a3[1] == 80 && a3[3] == 100 ? 105 : 97;
            }
            else if (v48 == 101 && v11 - 6 == v46)
            {
              if (*a3 == 105 && a3[1] == 80 && a3[2] == 104 && a3[3] == 111)
              {
                if (a3[4] == 110) {
                  int v48 = 117;
                }
                else {
                  int v48 = 101;
                }
              }
              else
              {
                int v48 = 101;
              }
            }
            if (_isTurkishVowel(v48, &v72, (BOOL *)&v72 + 1, &v71)) {
              break;
            }
            --v47;
            if (v11 == ++v46)
            {
              unint64_t v10 = -1;
              goto LABEL_187;
            }
          }
          BOOL v51 = v72 == (BYTE4(v64) & 1) && (!v62 || v71 == (v64 & 1));
          unint64_t v10 = ~v46 + v11;
          if (v38 && !v51)
          {
            char v70 = 0;
            if (!a6 || v11 < 2) {
              goto LABEL_206;
            }
            if (a3[v11 - 1] != 39) {
              goto LABEL_219;
            }
            char v70 = 0;
            unsigned int v56 = *a3;
            if (v56 > 0xF7 || v56 - 97 < 0x1A || v56 - 223 < 0x18) {
              goto LABEL_206;
            }
            unsigned int v57 = v56 - 154;
            if (v57 > 4 || ((1 << v57) & 0x15) == 0)
            {
              char v70 = 0;
              int v9 = 1;
              unint64_t v63 = v11 - 1;
            }
            else
            {
LABEL_219:
              char v70 = 0;
            }
            goto LABEL_206;
          }
        }
        else
        {
          unint64_t v10 = -1;
        }
      }
LABEL_187:
      if (v11)
      {
        if (a3[v11 - 1] == 39)
        {
          unint64_t v63 = v11 - 1;
          if ([(PRTurkishSuffix *)self postponesApostrophe])
          {
            if (!v38) {
              goto LABEL_206;
            }
          }
          else
          {
            unsigned int v52 = *a3;
            if (v52 <= 0xF7 && v52 - 97 >= 0x1A && v52 - 223 >= 0x18)
            {
              unsigned int v53 = v52 - 154;
              if (v53 > 4 || ((1 << v53) & 0x15) == 0) {
                goto LABEL_206;
              }
            }
            unsigned int v54 = a3[1];
            if (v54 <= 0xF7 && v54 - 97 >= 0x1A && v54 - 223 >= 0x18)
            {
              unsigned int v55 = v54 - 154;
              if (v55 > 4 || ((1 << v55) & 0x15) == 0) {
                goto LABEL_206;
              }
            }
          }
        }
        unint64_t v63 = v11;
      }
      else
      {
        unint64_t v63 = 0;
      }
LABEL_206:
      if (!v10) {
        goto LABEL_224;
      }
    }
    if (v14 - 138 > 0x15 || ((1 << (v14 + 118)) & 0x200015) == 0)
    {
      if (v14 == 73)
      {
        int v17 = 253;
        goto LABEL_30;
      }
LABEL_22:
      int v17 = v14 + 32;
      goto LABEL_30;
    }
LABEL_27:
    if (v14 == 159) {
      int v17 = 255;
    }
    else {
      int v17 = v14 + 16;
    }
    goto LABEL_30;
  }
  LOBYTE(v9) = 0;
  unint64_t v63 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_224:
  if (a6) {
    *a6 = v9 & 1;
  }
  return v63;
}

+ (id)standardTurkishNounSuffixes
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = (id)standardTurkishNounSuffixes_standardTurkishNounSuffixes;
  if (!standardTurkishNounSuffixes_standardTurkishNounSuffixes)
  {
    objc_super v3 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"(y)Im", @"sIn", @"DIr", @"(y)Iz", @"sInIz", @"DIrlAr", @"(y)DIm", @"(y)DIn", @"(y)DI", @"(y)DIk", @"(y)DInIz", @"(y)DIlAr", @"(y)sAm", @"(y)sAn", @"(y)sA", @"(y)sAk", @"(y)sAnIz",
                   @"(y)sAlAr",
                   @"(y)DIysAm",
                   @"(y)DIysAn",
                   @"(y)DIysA",
                   @"(y)DIysAk",
                   @"(y)DIysAnIz",
                   @"(y)DIysAlAr",
                   @"(y)DImsA",
                   @"(y)DInsA",
                   @"(y)DIysA",
                   @"(y)DIksA",
                   @"(y)DInIzsA",
                   @"(y)DIysAlAr",
                   @"(y)mIşIm",
                   @"(y)mIşsIn",
                   @"(y)mIş",
                   @"(y)mIşIz",
                   @"(y)mIşsInIz",
                   @"(y)mIşlAr",
                   @"(y)mIşsAm",
                   @"(y)mIşsAn",
                   @"(y)mIşsA",
                   @"(y)mIşsAk",
                   @"(y)mIşsAnIz",
                   @"(y)mIşsAlAr",
                   @"(y)A",
                   @"DA",
                   @"DAn",
                   @"(y)I",
                   @"(n)In",
                   @"lAr",
                   @"(s)I(n)",
                   @"(I)m",
                   @"(I)mIz",
                   @"(I)n",
                   @"(I)nIz",
                   @"lArI(n)",
                   @"sIz",
                   @"(y)lA",
                   @"lI",
                   @"lIK",
                   @"CI",
                   @"ki(n)",
                   @"Daş");
    unint64_t v4 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"I-am", @"you-are", @"it-is", @"we-are", @"you-are", @"they-are", @"I-was", @"you-were", @"it-was", @"we-were", @"you-were", @"they-were", @"if-I-am", @"if-you-are", @"if-it-is", @"if-we-are", @"if-you-are",
                   @"if-they-are",
                   @"if-I-was",
                   @"if-you-were",
                   @"if-it-was",
                   @"if-we-were",
                   @"if-you-were",
                   @"if-they-were",
                   @"if-I-was",
                   @"if-you-were",
                   @"if-it-was",
                   @"if-we-were",
                   @"if-you-were",
                   @"if-they-were",
                   @"apparently-I-am",
                   @"apparently-you-are",
                   @"apparently-it-is",
                   @"apparently-we-are",
                   @"apparently-you-are",
                   @"apparently-they-are",
                   @"if-apparently-I-am",
                   @"if-apparently-you-are",
                   @"if-apparently-it-is",
                   @"if-apparently-we-are",
                   @"if-apparently-you-are",
                   @"if-apparently-they-are",
                   @"to",
                   @"at",
                   @"from",
                   @"acc.",
                   @"of",
                   @"pl.",
                   @"its",
                   @"my",
                   @"our",
                   @"your",
                   @"your",
                   @"their",
                   @"-less",
                   @"with",
                   @"having",
                   @"-ness",
                   @"-er",
                   @"which-is",
                   @"fellow");
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v11 = 1;
    memset(v8, 0, sizeof(v8));
    HIBYTE(v9) = 1;
    BYTE8(v10) = 1;
    BYTE10(v10) = 1;
    BYTE14(v10) = 1;
    id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
    for (uint64_t i = 0; i != 72; ++i)
    {
      v6 = -[PRTurkishSuffix initWithPattern:name:type:postponesApostrophe:]([PRTurkishSuffix alloc], "initWithPattern:name:type:postponesApostrophe:", [v3 objectAtIndex:i], objc_msgSend(v4, "objectAtIndex:", i), byte_20CC650D0[i], *((unsigned char *)v8 + i) != 0);
      [v2 addObject:v6];
    }
    standardTurkishNounSuffixes_standardTurkishNounSuffixes = (uint64_t)v2;
  }
  return v2;
}

+ (id)standardTurkishVerbSuffixes
{
  id v2 = (id)standardTurkishVerbSuffixes_standardTurkishVerbSuffixes;
  if (!standardTurkishVerbSuffixes_standardTurkishVerbSuffixes)
  {
    objc_super v3 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"(I)n", @"(I)ş", @"DIr", @"t", @"Il", @"mA", @"(y)Abil", @"(y)AmA", @"mAyAbil", @"mIyAbil", @"(y)AmIyAbil", @"(y)AmAyAbil", @"(y)Iver", @"mAyIver", @"(y)IvermA", @"(y)An", @"(y)AcAK",
                   @"(I)r",
                   @"mIş",
                   @"DIK",
                   @"mAK",
                   @"mAklIK",
                   @"mA",
                   @"(y)Iş",
                   @"mAzlIK",
                   @"mAmAzlIK",
                   @"(y)IcI",
                   @"lA",
                   @"lAn",
                   @"lAş",
                   @"lAt",
                   @"(I)yorum",
                   @"(I)yorsun",
                   @"(I)yor",
                   @"(I)yoruz",
                   @"(I)yorsunuz",
                   @"(I)yorlar",
                   @"(I)yordum",
                   @"(I)yordun",
                   @"(I)yordu",
                   @"(I)yorduk",
                   @"(I)yordunuz",
                   @"(I)yordular",
                   @"(I)yorlardı",
                   @"(I)yorsam",
                   @"(I)yorsan",
                   @"(I)yorsa",
                   @"(I)yorsak",
                   @"(I)yorsanız",
                   @"(I)yorsalar",
                   @"(I)yorlarsa",
                   @"(I)yorduysam",
                   @"(I)yorduysan",
                   @"(I)yorduysa",
                   @"(I)yorduysak",
                   @"(I)yorduysanız",
                   @"(I)yorduysalar",
                   @"(I)yorlardıysa",
                   @"(I)yormuşum",
                   @"(I)yormuşsun",
                   @"(I)yormuş");
    unint64_t v4 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:", @"refl.", @"recip.", @"caus.", @"caus.", @"pass.", @"neg.", @"pot.", @"impot.", @"negpot.", @"negpot.", @"negimpot.", @"negimpot.", @"quick", @"negquick", @"quickneg", @"prespart.", @"futpart.",
                   @"aorpart.",
                   @"pastpart.",
                   @"pastpart.",
                   @"inf.",
                   @"verbal",
                   @"verbal",
                   @"verbal",
                   @"negverbal",
                   @"negverbal",
                   @"nominalizer",
                   @"verbalizer",
                   @"verbalizer",
                   @"verbalizer",
                   @"verbalizer",
                   @"1spres",
                   @"2spres",
                   @"3spres",
                   @"1ppres",
                   @"2ppres",
                   @"3ppres",
                   @"1spast",
                   @"2spast",
                   @"3spast",
                   @"1ppast",
                   @"2ppast",
                   @"3ppast",
                   @"3ppast",
                   @"1sprescond",
                   @"2sprescond",
                   @"3sprescond",
                   @"1pprescond",
                   @"2pprescond",
                   @"3pprescond",
                   @"3pprescond",
                   @"1spastcond",
                   @"2spastcond",
                   @"3spastcond",
                   @"1ppastcond",
                   @"2ppastcond",
                   @"3ppastcond",
                   @"3ppastcond",
                   @"1sinf",
                   @"2sinf",
                   @"3sinf");
    id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
    for (uint64_t i = 0; i != 241; ++i)
    {
      v6 = -[PRTurkishSuffix initWithPattern:name:type:postponesApostrophe:]([PRTurkishSuffix alloc], "initWithPattern:name:type:postponesApostrophe:", [v3 objectAtIndex:i], objc_msgSend(v4, "objectAtIndex:", i), byte_20CC65118[i], 0);
      [v2 addObject:v6];
    }
    standardTurkishVerbSuffixes_standardTurkishVerbSuffixes = (uint64_t)v2;
  }
  return v2;
}

+ (id)standardTurkishSuffixes
{
  id result = (id)standardTurkishSuffixes_standardTurkishSuffixes;
  if (!standardTurkishSuffixes_standardTurkishSuffixes)
  {
    id result = (id)objc_msgSend((id)objc_msgSend(a1, "standardTurkishNounSuffixes"), "arrayByAddingObjectsFromArray:", objc_msgSend(a1, "standardTurkishVerbSuffixes"));
    standardTurkishSuffixes_standardTurkishSuffixes = (uint64_t)result;
  }
  return result;
}

+ (void)_enumerateSuffixMatchesForBuffer:(char *)a3 length:(unint64_t)a4 followedByLetter:(unsigned __int8)a5 options:(unint64_t)a6 depth:(unint64_t)a7 matchState:(int)a8 suffixStack:(id *)a9 suffixRangeStack:(_NSRange *)a10 usingBlock:(id)a11
{
  uint64_t v13 = a5;
  uint64_t v47 = *MEMORY[0x263EF8340];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id obj = +[PRTurkishSuffix standardTurkishSuffixes];
  uint64_t v40 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
  if (v40)
  {
    uint64_t v39 = *(void *)v43;
    unint64_t v35 = a7 + 1;
    v34 = &a10[a7];
    unint64_t v29 = a7;
    unint64_t v38 = (char *)&_turkishSuffixMatchTable + 60 * a8;
    unsigned int v33 = v13;
    BOOL v31 = a3;
    unint64_t v32 = a4;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v43 != v39) {
          objc_enumerationMutation(obj);
        }
        int v17 = *(void **)(*((void *)&v42 + 1) + 8 * v16);
        __int16 v41 = 0;
        LODWORD(v18) = *(_DWORD *)&v38[4 * [v17 suffixType]];
        if (v18)
        {
          uint64_t v19 = [v17 matchingIndexInBuffer:a3 length:a4 followedByLetter:v13 matchWithNameOnly:&v41];
          if (v19 != 0x7FFFFFFFFFFFFFFFLL)
          {
            unint64_t v20 = v19;
            NSUInteger v21 = a4 - v19;
            BOOL v22 = v41 == 0;
            a9[a7] = v17;
            if (v22) {
              uint64_t v18 = v18;
            }
            else {
              uint64_t v18 = 12;
            }
            v34->location = v19;
            v34->length = v21;
            if ((a6 & 2) != 0)
            {
              BOOL v23 = 0;
              BOOL v24 = 0;
            }
            else
            {
              unsigned int v30 = v18;
              BOOL v23 = (void *)[MEMORY[0x263EFF980] array];
              BOOL v24 = (void *)[MEMORY[0x263EFF980] array];
              if (v35)
              {
                unint64_t v25 = a7;
                p_length = &v34->length;
                do
                {
                  [v23 addObject:a9[v25]];
                  objc_msgSend(v24, "addObject:", objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", *(p_length - 1), *p_length));
                  --v25;
                  p_length -= 2;
                }
                while (v25 != -1);
                a7 = v29;
              }
              uint64_t v18 = v30;
            }
            (*((void (**)(id, unint64_t, void *, unint64_t, NSUInteger, uint64_t, void *, void *, char *))a11
             + 2))(a11, v20, v17, v20, v21, v18, v23, v24, (char *)&v41 + 1);
            if (HIBYTE(v41)) {
              return;
            }
            uint64_t v13 = v33;
            a3 = v31;
            a4 = v32;
            if (v20 && v32 > v20 && v35 <= 0xF && !(_BYTE)v41) {
              [a1 _enumerateSuffixMatchesForBuffer:v31 length:v20 followedByLetter:v31[v20] options:a6 depth:v35 matchState:v18 suffixStack:a9 suffixRangeStack:a10 usingBlock:a11];
            }
          }
        }
        ++v16;
      }
      while (v16 != v40);
      uint64_t v27 = [obj countByEnumeratingWithState:&v42 objects:v46 count:16];
      uint64_t v40 = v27;
    }
    while (v27);
  }
}

+ (void)enumerateSuffixMatchesForBuffer:(char *)a3 length:(unint64_t)a4 options:(unint64_t)a5 usingBlock:(id)a6
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v11 = objc_alloc_init(MEMORY[0x263F086B0]);
  uint64_t v12 = 0;
  memset(v15, 0, sizeof(v15));
  do
  {
    uint64_t v13 = &v14[v12];
    *uint64_t v13 = xmmword_20CC61990;
    v13[1] = xmmword_20CC61990;
    v12 += 32;
  }
  while (v12 != 256);
  objc_msgSend(a1, "_enumerateSuffixMatchesForBuffer:length:followedByLetter:options:depth:matchState:suffixStack:suffixRangeStack:usingBlock:", a3, a4, 0, a5, 0, 13, NAN, v15, v14, a6);
}

+ (void)enumerateSuffixMatchesForWord:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  CFIndex usedBufLen = 0;
  uint64_t v8 = (__CFString *)[a3 stringByReplacingOccurrencesOfString:@"’" withString:@"'"];
  uint64_t v9 = [(__CFString *)v8 length];
  v13.length = [(__CFString *)v8 length];
  v13.location = 0;
  if (v9 == CFStringGetBytes(v8, v13, 0x504u, 0x5Fu, 0, buffer, 72, &usedBufLen)) {
    [a1 enumerateSuffixMatchesForBuffer:buffer length:usedBufLen options:a4 usingBlock:a5];
  }
}

@end