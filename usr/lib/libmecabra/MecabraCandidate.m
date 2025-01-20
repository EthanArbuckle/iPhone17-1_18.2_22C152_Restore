@interface MecabraCandidate
+ (id)syntheticCandidateFromWords:(id)a3 withLexicon:(Lexicon *)a4 language:(int)a5;
- (BOOL)isEqual:(id)a3;
- (MecabraCandidate)initWithCandidate:(void *)a3;
- (id)analysisString;
- (id)attributes;
- (id)category;
- (id)convertedAnalysisString;
- (id)convertedAnalysisStringForFirstSyllable;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryReading;
- (id)surface;
- (id)syllabifiedAnalysisString;
- (id)syllabifiedConvertedAnalysisString;
- (id)syllabifiedDictionaryReading;
- (id)syllablesInAnalysisString;
- (id)syllablesInConvertedAnalysisString;
- (id)syllablesInDictionaryReading;
- (id)syllablesInString:(id)a3 syllableLengths:(id)a4;
- (id)wordIDs;
- (id)wordReadings;
- (id)words;
- (void)dealloc;
- (void)rawCandidate;
@end

@implementation MecabraCandidate

- (void)rawCandidate
{
  return self->_rawCandidate;
}

- (void)dealloc
{
  rawCandidate = self->_rawCandidate;
  if (rawCandidate)
  {
    (*(void (**)(void *, SEL))(*(void *)rawCandidate + 16))(rawCandidate, a2);
    self->_rawCandidate = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)MecabraCandidate;
  [(MecabraCandidate *)&v4 dealloc];
}

- (id)surface
{
  id result = (id)[self a2:v2];
  if (result)
  {
    objc_super v4 = result;
    uint64_t v5 = (*(uint64_t (**)(id))(*(void *)result + 40))(result);
    uint64_t v6 = *v4;
    if (v5)
    {
      v7 = *(uint64_t (**)(void *))(v6 + 40);
      v8 = v4;
    }
    else
    {
      v7 = *(uint64_t (**)(void *))(v6 + 24);
      v8 = v4;
    }
    return (id)v7(v8);
  }
  return result;
}

- (id)category
{
  uint64_t v3 = [self a2:v2];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  if ((*(unsigned int (**)(uint64_t))(*(void *)v3 + 72))(v3) != 1
    && (*(unsigned int (**)(uint64_t))(*(void *)v4 + 72))(v4) != 7)
  {
    return 0;
  }
  uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 136))(v4);

  return (id)MEMORY[0x270F9A6D0](v5, sel_valueForKey_, @"category");
}

- (id)analysisString
{
  uint64_t v3 = [self a2:v2];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = v3;
  if ((*(unsigned int (**)(uint64_t))(*(void *)v3 + 72))(v3) != 1
    && (*(unsigned int (**)(uint64_t))(*(void *)v4 + 72))(v4) != 7
    && (*(unsigned int (**)(uint64_t))(*(void *)v4 + 72))(v4) != 6)
  {
    return 0;
  }
  uint64_t v5 = *(uint64_t (**)(uint64_t))(*(void *)v4 + 56);

  return (id)v5(v4);
}

- (id)convertedAnalysisString
{
  uint64_t v3 = [self a2:v2];
  if (v3)
  {
    uint64_t v4 = v3;
    if ((*(unsigned int (**)(uint64_t))(*(void *)v3 + 72))(v3) == 1
      || (*(unsigned int (**)(uint64_t))(*(void *)v4 + 72))(v4) == 7)
    {
      uint64_t v5 = *(uint64_t (**)(uint64_t))(*(void *)v4 + 224);
      uint64_t v6 = v4;
      return (id)v5(v6);
    }
    if ((*(unsigned int (**)(uint64_t))(*(void *)v4 + 72))(v4) == 6)
    {
      uint64_t v5 = *(uint64_t (**)(uint64_t))(*(void *)v4 + 176);
      uint64_t v6 = v4;
      return (id)v5(v6);
    }
  }
  return 0;
}

- (id)dictionaryReading
{
  uint64_t v3 = [self a2:v2];
  if (v3)
  {
    uint64_t v4 = v3;
    if ((*(unsigned int (**)(uint64_t))(*(void *)v3 + 72))(v3) == 1
      || (*(unsigned int (**)(uint64_t))(*(void *)v4 + 72))(v4) == 7)
    {
      uint64_t v5 = *(uint64_t (**)(uint64_t))(*(void *)v4 + 232);
      uint64_t v6 = v4;
      return (id)v5(v6);
    }
    if ((*(unsigned int (**)(uint64_t))(*(void *)v4 + 72))(v4) == 6)
    {
      uint64_t v5 = *(uint64_t (**)(uint64_t))(*(void *)v4 + 184);
      uint64_t v6 = v4;
      return (id)v5(v6);
    }
  }
  return 0;
}

- (id)attributes
{
  id result = (id)[self a2:v2];
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(*(void *)result + 136);
    return (id)v4();
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)[self a2:(uint64_t)a3];
  if (result)
  {
    v8 = (char *)[self v6:v7];
    uint64_t v9 = (**(uint64_t (***)(char *))&v8[*(void *)(*(void *)v8 - 32)])(&v8[*(void *)(*(void *)v8 - 32)]);
    v11 = [MecabraCandidate allocWithZone:v10];
    return (id)[v11 initWithCandidate:v12 candidateID:v9];
  }
  return result;
}

- (MecabraCandidate)initWithCandidate:(void *)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MecabraCandidate;
  id result = [(MecabraCandidate *)&v5 init];
  if (result) {
    result->_rawCandidate = a3;
  }
  return result;
}

- (id)convertedAnalysisStringForFirstSyllable
{
  uint64_t v4 = MecabraCandidateCopySyllableLengthArrayInAnalysisString(self, a2, v2);
  if (objc_msgSend_count(v4, v5, v6))
  {
    v8 = [v4 objectAtIndex:v7];
    int v11 = [v8 v9:v10];
    v14 = [self analysisString:v12 string:v13];
    v19 = 0;
    if (objc_msgSend_length(v14, v15, v16) >= (unint64_t)v11)
    {
      v20 = [self convertedAnalysisString:v17 withString:v18];
      int v23 = [v8 valueForKeyPath:v21];
      v19 = [v20 substringToIndex:v23];
    }
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (id)description
{
  uint64_t v4 = [self a2:v2];
  if (v4
    && ((uint64_t v7 = v4, (*(unsigned int (**)(uint64_t))(*(void *)v4 + 72))(v4) == 1)
     || (*(unsigned int (**)(uint64_t))(*(void *)v7 + 72))(v7) == 7))
  {
    uint64_t v8 = [self v5:v6];
    double v9 = (*(double (**)(uint64_t))(*(void *)v8 + 392))(v8);
    uint64_t v10 = NSString;
    uint64_t Surface = MecabraCandidateGetSurface(self, v11, v12);
    uint64_t v16 = [self analysisString:v14 withString:v15];
    uint64_t v19 = [self v17:v18];
    uint64_t v22 = [self objc_msgSend_dictionaryReading:v20 :v21];
    uint64_t v25 = [self v23:v24];
    if (v25) {
      uint64_t v25 = (*(uint64_t (**)(uint64_t))(*(void *)v25 + 112))(v25);
    }
    double v27 = -1000.0;
    if (v9 != -1.79769313e308) {
      double v27 = v9;
    }
    return (id)[v10 stringWithFormat:@"%@ (AS:%@ CAS:%@ DR:%@), %d, %f", Surface, v16, v19, v22, v25, *(void *)&v27];
  }
  else
  {
    v29 = NSString;
    uint64_t v30 = MecabraCandidateGetSurface(self, v5, v6);
    uint64_t v33 = [self analysisString:v31 withString:v32];
    uint64_t v36 = [self v34:v35];
    uint64_t v39 = [self objc_msgSend_dictionaryReading:v37 withDictionary:v38];
    uint64_t v42 = [self v40:v41];
    if (v42) {
      uint64_t v42 = (*(uint64_t (**)(uint64_t))(*(void *)v42 + 112))(v42);
    }
    return (id)[v29 stringWithFormat:@"%@ (AS:%@ CAS:%@ DR:%@), %d", v30, v33, v36, v39, v42];
  }
}

- (BOOL)isEqual:(id)a3
{
  uint64_t Surface = MecabraCandidateGetSurface(self, a2, (uint64_t)a3);
  uint64_t v8 = MecabraCandidateGetSurface(a3, v6, v7);
  if (!(Surface | v8) || (int isEqualToString = objc_msgSend_isEqualToString_((void *)Surface, v9, v8)) != 0)
  {
    uint64_t v12 = [self analysisString:v9 withString:v10];
    uint64_t v15 = [a3 analysisString:v13, v14];
    if (!(v12 | v15) || (int isEqualToString = objc_msgSend_isEqualToString_((void *)v12, v16, v15)) != 0)
    {
      uint64_t v18 = [self v16:v17];
      uint64_t v21 = [a3 convertedAnalysisString:v19, v20];
      if (!(v18 | v21) || (int isEqualToString = objc_msgSend_isEqualToString_((void *)v18, v22, v21)) != 0)
      {
        uint64_t v24 = [self objc_msgSend_dictionaryReading:v22 withDictionary:v23];
        uint64_t v27 = [a3 objc_msgSend_dictionaryReading:v25, v26];
        if (v24 | v27)
        {
          LOBYTE(isEqualToString) = [v24 isEqualToString:v28];
        }
        else
        {
          LOBYTE(isEqualToString) = 1;
        }
      }
    }
  }
  return isEqualToString;
}

- (id)syllabifiedAnalysisString
{
  uint64_t v3 = [self syllablesInAnalysisString:a2];

  return [v3 componentsJoinedByString:v4];
}

- (id)syllabifiedConvertedAnalysisString
{
  uint64_t v3 = [self syllablesInConvertedAnalysisString:a2];

  return [v3 componentsJoinedByString:@"'"];
}

- (id)syllabifiedDictionaryReading
{
  uint64_t v3 = [self syllablesInDictionaryReading:a2];

  return [v3 componentsJoinedByString:@"'"];
}

- (id)syllablesInString:(id)a3 syllableLengths:(id)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v8 = [a4 countByEnumeratingWithState:v7 objects:v39 count:16];
  if (v8)
  {
    uint64_t v11 = v8;
    unint64_t v12 = 0;
    uint64_t v13 = *(void *)v36;
    do
    {
      uint64_t v14 = 0;
      uint64_t v15 = v12;
      do
      {
        if (*(void *)v36 != v13) {
          objc_enumerationMutation(a4);
        }
        uint64_t v16 = [*(void **)(*((void *)&v35 + 1) + 8 * v14) unsignedIntegerValue:v9, v10];
        unint64_t v19 = [a3 length:v17 with:v18];
        unint64_t v12 = v16 + v15;
        if (v16 < 1 || v19 < v12)
        {
          unint64_t v12 = v15;
          goto LABEL_13;
        }
        uint64_t v21 = [a3 substringWithRange:v9];
        [v6 addObject:v22];
        ++v14;
        v15 += v16;
      }
      while (v11 != v14);
      uint64_t v11 = [a4 countByEnumeratingWithState:v9 objects:v35 count:v39];
    }
    while (v11);
LABEL_13:
    if (v12 > objc_msgSend_length(a3, v9, v10)) {
      [v6 addObject:v23];
    }
  }
  else
  {
    [a3 length];
    unint64_t v12 = 0;
  }
  if (v12 < objc_msgSend_length(a3, v23, v24))
  {
    uint64_t v27 = NSString;
    uint64_t v28 = [a3 length:v25, v26];
    uint64_t v30 = [a3 substringWithRange:v29];
    uint64_t v32 = [v27 stringWithFormat:v31, v30];
    [v6 addObject:v32];
  }
  return v6;
}

- (id)syllablesInAnalysisString
{
  uint64_t v4 = MecabraCandidateCopySyllableLengthArrayInAnalysisString(self, a2, v2);
  uint64_t v7 = [self analysisString:v5 string:v6];
  double v9 = [self syllablesInString:v8 syllableLengths:v7];

  return v9;
}

- (id)syllablesInConvertedAnalysisString
{
  uint64_t v4 = MecabraCandidateCopySyllableLengthArrayInConvertedAnalysisString(self, a2, v2);
  uint64_t v7 = [self convertedAnalysisString:v5 withString:v6];
  double v9 = [self syllablesInString:v8 syllableLengths:v7];

  return v9;
}

- (id)syllablesInDictionaryReading
{
  uint64_t v4 = MecabraCandidateCopySyllableLengthArrayInDictionaryReading(self, a2, v2);
  uint64_t v7 = [self dictionaryReading:v5 withDictionary:v6];
  double v9 = [self syllablesInString:v8 syllableLengths:v7];

  return v9;
}

- (id)words
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v6 = [self v4:v5];
  if ((*(uint64_t (**)(uint64_t))(*(void *)v6 + 48))(v6))
  {
    uint64_t v8 = 0;
    double v9 = 0;
    do
    {
      uint64_t WordLengthAtIndex = MecabraCandidateGetWordLengthAtIndex(self, v9, v7);
      uint64_t Surface = (void *)MecabraCandidateGetSurface(self, v11, v12);
      uint64_t v15 = [Surface substringWithRange:v14];
      if (objc_msgSend_length(v15, v16, v17)) {
        [v3 addObject:v18];
      }
      v8 += WordLengthAtIndex;
      ++v9;
      uint64_t v20 = [self v18:v19];
    }
    while ((unint64_t)v9 < (*(uint64_t (**)(uint64_t))(*(void *)v20 + 48))(v20));
  }
  return v3;
}

- (id)wordReadings
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v6 = [self v4:v5];
  if ((*(uint64_t (**)(uint64_t))(*(void *)v6 + 48))(v6))
  {
    uint64_t v8 = 0;
    double v9 = 0;
    do
    {
      uint64_t WordReadingLengthAtIndex = MecabraCandidateGetWordReadingLengthAtIndex(self, v9, v7);
      uint64_t v13 = [self analysisString:v11 string:v12];
      uint64_t v15 = [v13 substringWithRange:v14];
      if (objc_msgSend_length(v15, v16, v17)) {
        [v3 addObject:v18];
      }
      v8 += WordReadingLengthAtIndex;
      ++v9;
      uint64_t v20 = [self v18:v19];
    }
    while ((unint64_t)v9 < (*(uint64_t (**)(uint64_t))(*(void *)v20 + 48))(v20));
  }
  return v3;
}

- (id)wordIDs
{
  uint64_t v3 = [self a2:v2];
  if (!v3) {
    return 0;
  }
  uint64_t v6 = v3;
  uint64_t v7 = [MEMORY[0x263EFF980] objc_msgSend_array:v4, v5];
  if ((*(uint64_t (**)(uint64_t))(*(void *)v6 + 48))(v6))
  {
    unint64_t v8 = 0;
    do
    {
      uint64_t v9 = (*(uint64_t (**)(uint64_t, unint64_t))(*(void *)v6 + 120))(v6, v8);
      uint64_t v11 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(v9 + 8)];
      [v7 addObject:v12];
      ++v8;
    }
    while (v8 < (*(uint64_t (**)(uint64_t))(*(void *)v6 + 48))(v6));
  }
  return v7;
}

+ (id)syntheticCandidateFromWords:(id)a3 withLexicon:(Lexicon *)a4 language:(int)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  __p = 0;
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:a2 objects:(id *)&v21 count:v28];
  if (v7)
  {
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(a3);
        }
        unint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        if (a4) {
          sub_21628CE20((uint64_t)a4, (const __CFString *)v10);
        }
        uint64_t v11 = v26;
        if (v26 >= v27)
        {
          uint64_t v13 = (char *)__p;
          uint64_t v14 = (v26 - (unsigned char *)__p) >> 2;
          unint64_t v15 = v14 + 1;
          if ((unint64_t)(v14 + 1) >> 62) {
            sub_21610CB04();
          }
          uint64_t v16 = v27 - (unsigned char *)__p;
          if ((v27 - (unsigned char *)__p) >> 1 > v15) {
            unint64_t v15 = v16 >> 1;
          }
          if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v10 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v10 = v15;
          }
          if (v10)
          {
            uint64_t v17 = (char *)sub_2161129B4((uint64_t)&v27, v10);
            uint64_t v13 = (char *)__p;
            uint64_t v11 = v26;
          }
          else
          {
            uint64_t v17 = 0;
          }
          uint64_t v18 = &v17[4 * v14];
          *(_DWORD *)uint64_t v18 = 0;
          uint64_t v12 = v18 + 4;
          while (v11 != v13)
          {
            int v19 = *((_DWORD *)v11 - 1);
            v11 -= 4;
            *((_DWORD *)v18 - 1) = v19;
            v18 -= 4;
          }
          __p = v18;
          uint64_t v26 = v12;
          uint64_t v27 = &v17[4 * v10];
          if (v13) {
            operator delete(v13);
          }
        }
        else
        {
          *(_DWORD *)uint64_t v26 = 0;
          uint64_t v12 = v11 + 4;
        }
        uint64_t v26 = v12;
      }
      uint64_t v7 = [a3 countByEnumeratingWithState:v10 objects:&v21 count:v28];
    }
    while (v7);
  }
  operator new();
}

@end