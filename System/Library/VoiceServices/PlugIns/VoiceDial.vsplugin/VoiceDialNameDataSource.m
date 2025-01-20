@interface VoiceDialNameDataSource
+ (id)_nameDataSourceByLanguageMap;
+ (id)nameDataSourceForLanguageIdentifier:(id)a3;
- (BOOL)getName:(id *)a3 phoneticName:(id *)a4 atIndex:(unint64_t)a5 forPerson:(void *)a6;
- (BOOL)getNth:(unint64_t)a3 name:(id *)a4 phoneticName:(id *)a5 ofType:(int)a6 nameIndex:(unint64_t *)a7 forPerson:(void *)a8;
- (BOOL)useCompositeNamesOnly;
- (id)copyPronunciationPropertyForPerson:(void *)a3 withNameType:(int)a4;
- (int)matchingNameType:(id)a3 fromTypes:(unint64_t)a4 forPerson:(void *)a5;
- (int)typeOfNameAtIndex:(unint64_t)a3;
- (unint64_t)countOfNamesOfType:(int)a3;
- (unint64_t)indexOfMainNameOfType:(int)a3;
- (unint64_t)nameTypes;
- (unint64_t)personNameCount;
- (void)setUseCompositeNamesOnly:(BOOL)a3;
@end

@implementation VoiceDialNameDataSource

+ (id)_nameDataSourceByLanguageMap
{
  pthread_once(&_nameDataSourceByLanguageMap___createNameSourceMapOnce, _CreateNameDataSourceMap);
  v2 = (void *)__nameSourceMap;

  return v2;
}

+ (id)nameDataSourceForLanguageIdentifier:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && (uint64_t v6 = [v4 rangeOfString:@"-"], v6 != 0x7FFFFFFFFFFFFFFFLL))
  {
    v8 = [v5 substringToIndex:v6];
    if (v8
      && ([a1 _nameDataSourceByLanguageMap],
          v9 = objc_claimAutoreleasedReturnValue(),
          [v9 objectForKey:v8],
          v10 = (NSString *)objc_claimAutoreleasedReturnValue(),
          v9,
          v10))
    {
      Class v7 = NSClassFromString(v10);
    }
    else
    {
      Class v7 = 0;
    }
  }
  else
  {
    Class v7 = 0;
    v8 = 0;
  }
  if (v7) {
    v11 = v7;
  }
  else {
    v11 = (objc_class *)a1;
  }
  id v12 = objc_alloc_init(v11);

  return v12;
}

- (void)setUseCompositeNamesOnly:(BOOL)a3
{
  self->_compositeNamesOnly = a3;
}

- (BOOL)useCompositeNamesOnly
{
  return self->_compositeNamesOnly;
}

- (unint64_t)personNameCount
{
  return 4;
}

- (unint64_t)indexOfMainNameOfType:(int)a3
{
  if (a3 > 3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    return qword_22A5F7A00[a3];
  }
}

- (id)copyPronunciationPropertyForPerson:(void *)a3 withNameType:(int)a4
{
  if (a4)
  {
    if (a4 != 1) {
      return 0;
    }
    v5 = (ABPropertyID *)MEMORY[0x263F244C0];
    uint64_t v6 = (ABPropertyID *)MEMORY[0x263F244C8];
  }
  else
  {
    v5 = (ABPropertyID *)MEMORY[0x263F243F8];
    uint64_t v6 = (ABPropertyID *)MEMORY[0x263F24400];
  }
  ABPropertyID v7 = *v5;
  if (*v6 == -1 || v7 == -1) {
    return 0;
  }
  id result = (id)ABRecordCopyValue(a3, *v6);
  if (!result)
  {
    return (id)ABRecordCopyValue(a3, v7);
  }
  return result;
}

- (BOOL)getName:(id *)a3 phoneticName:(id *)a4 atIndex:(unint64_t)a5 forPerson:(void *)a6
{
  if (!a6)
  {
    LOBYTE(v9) = 0;
    return (char)v9;
  }
  v9 = a3;
  if (a3)
  {
    *a3 = 0;
    switch(a5)
    {
      case 0uLL:
        v11 = a6;
        char v12 = 0;
        goto LABEL_7;
      case 1uLL:
        v11 = a6;
        char v12 = 9;
LABEL_7:
        v13 = VoiceDialPersonCopyCompositeName(v11, v12);
        goto LABEL_13;
      case 2uLL:
        if ([(VoiceDialNameDataSource *)self useCompositeNamesOnly]
          || VoiceDialPersonIsCompany(a6))
        {
          goto LABEL_14;
        }
        v14 = (ABPropertyID *)MEMORY[0x263F24408];
LABEL_12:
        v13 = (void *)ABRecordCopyValue(a6, *v14);
LABEL_13:
        id *v9 = v13;
LABEL_14:
        LOBYTE(v9) = *v9 != 0;
        break;
      case 3uLL:
        v14 = (ABPropertyID *)MEMORY[0x263F24508];
        goto LABEL_12;
      default:
        goto LABEL_14;
    }
  }
  if (a4)
  {
    *a4 = 0;
    if (a5 == 2)
    {
      if ([(VoiceDialNameDataSource *)self useCompositeNamesOnly]
        || VoiceDialPersonIsCompany(a6))
      {
        goto LABEL_26;
      }
      CFMutableStringRef v17 = [(VoiceDialNameDataSource *)self copyPronunciationPropertyForPerson:a6 withNameType:0];
    }
    else
    {
      if (a5 == 1)
      {
        v15 = a6;
        char v16 = 15;
      }
      else
      {
        if (a5) {
          goto LABEL_26;
        }
        v15 = a6;
        char v16 = 6;
      }
      CFMutableStringRef v17 = VoiceDialPersonCopyCompositeName(v15, v16);
    }
    *a4 = v17;
LABEL_26:
    LOBYTE(v9) = (v9 & 1) != 0 || *a4 != 0;
  }
  return (char)v9;
}

- (BOOL)getNth:(unint64_t)a3 name:(id *)a4 phoneticName:(id *)a5 ofType:(int)a6 nameIndex:(unint64_t *)a7 forPerson:(void *)a8
{
  unint64_t v15 = [(VoiceDialNameDataSource *)self indexOfMainNameOfType:*(void *)&a6];
  unint64_t v16 = v15;
  if (a7) {
    *a7 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v15 == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v17 = 0;
    if (!a3 && a6 == 1)
    {
      BOOL v17 = a4 != 0;
      if (a4) {
        *a4 = (id)(id)ABRecordCopyValue(a8, *MEMORY[0x263F244D0]);
      }
      if (a5)
      {
        BOOL v17 = 1;
        *a5 = [(VoiceDialNameDataSource *)self copyPronunciationPropertyForPerson:a8 withNameType:1];
      }
    }
  }
  else if ([(VoiceDialNameDataSource *)self getName:a4 phoneticName:a5 atIndex:v15 forPerson:a8])
  {
    if (a7) {
      *a7 = v16;
    }
    return 1;
  }
  else
  {
    unint64_t v18 = [(VoiceDialNameDataSource *)self personNameCount];
    if (v18)
    {
      unint64_t v19 = v18;
      v24 = a5;
      unint64_t v20 = 0;
      BOOL v21 = 0;
      do
      {
        if (v16 != v20 && [(VoiceDialNameDataSource *)self typeOfNameAtIndex:v20] == a6)
        {
          BOOL v22 = [(VoiceDialNameDataSource *)self getName:a4 phoneticName:v24 atIndex:v20 forPerson:a8];
          BOOL v21 = v22;
          if (a7)
          {
            if (v22) {
              *a7 = v20;
            }
          }
        }
        ++v20;
        BOOL v17 = v21;
      }
      while (v20 < v19 && !v21);
    }
    else
    {
      return 0;
    }
  }
  return v17;
}

- (int)typeOfNameAtIndex:(unint64_t)a3
{
  if (a3 > 3) {
    return -1;
  }
  else {
    return dword_22A5F7A20[a3];
  }
}

- (unint64_t)nameTypes
{
  if (!self->_nameTypeMask)
  {
    unint64_t v3 = [(VoiceDialNameDataSource *)self personNameCount];
    if (v3)
    {
      unint64_t v4 = v3;
      for (uint64_t i = 0; i != v4; ++i)
      {
        int v6 = [(VoiceDialNameDataSource *)self typeOfNameAtIndex:i];
        if (v6 != -1) {
          self->_nameTypeMask |= 1 << v6;
        }
      }
    }
  }
  return self->_nameTypeMask;
}

- (unint64_t)countOfNamesOfType:(int)a3
{
  if (([(VoiceDialNameDataSource *)self nameTypes] & (1 << a3)) == 0) {
    return a3 == 1;
  }
  unint64_t v5 = [(VoiceDialNameDataSource *)self personNameCount];
  if (!v5) {
    return 0;
  }
  unint64_t v6 = v5;
  unint64_t v7 = 0;
  for (uint64_t i = 0; i != v6; ++i)
  {
    if ([(VoiceDialNameDataSource *)self typeOfNameAtIndex:i] == a3) {
      ++v7;
    }
  }
  return v7;
}

- (int)matchingNameType:(id)a3 fromTypes:(unint64_t)a4 forPerson:(void *)a5
{
  id v6 = a3;
  unint64_t v7 = [(VoiceDialNameDataSource *)self personNameCount];
  BOOL v21 = v6;
  if (v6)
  {
    unint64_t v8 = v7;
    if (v7)
    {
      char v9 = 0;
      v10 = 0;
      unint64_t v11 = 1;
      do
      {
        int v12 = -[VoiceDialNameDataSource typeOfNameAtIndex:](self, "typeOfNameAtIndex:", v11 - 1, v21);
        if (v12 == -1 || (int v13 = v12, v14 = 1 << v12, (v14 & a4) == 0))
        {
          int v17 = -1;
          id v16 = v10;
        }
        else
        {
          id v24 = v10;
          BOOL v15 = [(VoiceDialNameDataSource *)self getName:&v24 phoneticName:0 atIndex:v11 - 1 forPerson:a5];
          id v16 = v24;

          int v17 = -1;
          if (v15 && v16)
          {
            if ([v16 caseInsensitiveCompare:v21]) {
              int v17 = -1;
            }
            else {
              int v17 = v13;
            }
          }
          v9 |= v14;
        }
        if (v17 != -1) {
          break;
        }
        v10 = v16;
      }
      while (v11++ < v8);
    }
    else
    {
      id v16 = 0;
      char v9 = 0;
      int v17 = -1;
    }
    if ((a4 & 2) != 0 && (v9 & 2) == 0 && (v17 == 3 || v17 == -1))
    {
      unint64_t v19 = (void *)ABRecordCopyValue(a5, *MEMORY[0x263F244D0]);

      if (v19)
      {
        if (![v19 caseInsensitiveCompare:v21]) {
          int v17 = 1;
        }
        id v16 = v19;
      }
      else
      {
        id v16 = 0;
      }
    }
  }
  else
  {
    id v16 = 0;
    int v17 = -1;
  }

  return v17;
}

@end