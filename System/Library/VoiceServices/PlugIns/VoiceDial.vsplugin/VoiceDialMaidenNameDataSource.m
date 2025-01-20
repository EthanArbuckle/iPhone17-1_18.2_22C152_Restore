@interface VoiceDialMaidenNameDataSource
- (BOOL)getName:(id *)a3 phoneticName:(id *)a4 atIndex:(unint64_t)a5 forPerson:(void *)a6;
- (BOOL)getNth:(unint64_t)a3 name:(id *)a4 phoneticName:(id *)a5 ofType:(int)a6 nameIndex:(unint64_t *)a7 forPerson:(void *)a8;
- (int)matchingNameType:(id)a3 fromTypes:(unint64_t)a4 forPerson:(void *)a5;
- (int)typeOfNameAtIndex:(unint64_t)a3;
- (unint64_t)countOfNamesOfType:(int)a3;
- (unint64_t)personNameCount;
@end

@implementation VoiceDialMaidenNameDataSource

- (unint64_t)personNameCount
{
  v3.receiver = self;
  v3.super_class = (Class)VoiceDialMaidenNameDataSource;
  return [(VoiceDialNameDataSource *)&v3 personNameCount] + 2;
}

- (BOOL)getName:(id *)a3 phoneticName:(id *)a4 atIndex:(unint64_t)a5 forPerson:(void *)a6
{
  v25.receiver = self;
  v25.super_class = (Class)VoiceDialMaidenNameDataSource;
  id v11 = [(VoiceDialNameDataSource *)&v25 personNameCount];
  unint64_t v12 = a5 - (void)v11;
  if (a5 < (unint64_t)v11)
  {
    v24.receiver = self;
    v24.super_class = (Class)VoiceDialMaidenNameDataSource;
    return [(VoiceDialNameDataSource *)&v24 getName:a3 phoneticName:a4 atIndex:a5 forPerson:a6];
  }
  if (!a3)
  {
    if (!a4) {
      return 0;
    }
LABEL_8:
    char v14 = 0;
    *a4 = 0;
    if (!v12) {
      goto LABEL_6;
    }
    goto LABEL_9;
  }
  *a3 = 0;
  if (a4) {
    goto LABEL_8;
  }
  char v14 = 1;
  if (!v12)
  {
LABEL_6:
    char v15 = 0;
    goto LABEL_11;
  }
LABEL_9:
  if (v12 != 1) {
    goto LABEL_22;
  }
  char v15 = 9;
LABEL_11:
  if (!VoiceDialPersonIsCompany(a6))
  {
    CFTypeRef v16 = ABRecordCopyValue(a6, *MEMORY[0x263F24408]);
    if (v16)
    {
      v17 = v16;
      int v18 = *MEMORY[0x263F244D0];
      CFStringRef v19 = (const __CFString *)ABRecordCopyValue(a6, *MEMORY[0x263F244D0]);
      if (v19)
      {
        CFStringRef v20 = v19;
        CFStringRef MaidenNameFromLastName = VoiceDialMaidenNameDataSourceCreateMaidenNameFromLastName(v19);
        if (MaidenNameFromLastName)
        {
          CFStringRef v22 = MaidenNameFromLastName;
          if (a3) {
            *a3 = VoiceDialPersonCopyCompositeNameWithSubstitution(a6, MaidenNameFromLastName, v18, v15);
          }
          if ((v14 & 1) == 0) {
            *a4 = VoiceDialPersonCopyCompositeNameWithSubstitution(a6, v22, v18, v15 | 6u);
          }
          CFRelease(v22);
        }
        CFRelease(v20);
      }
      CFRelease(v17);
    }
  }
LABEL_22:
  if (!a3)
  {
    if ((v14 & 1) == 0) {
      return *a4 != 0;
    }
    return 0;
  }
  BOOL result = *a3 != 0;
  if (*a3) {
    char v23 = 1;
  }
  else {
    char v23 = v14;
  }
  if ((v23 & 1) == 0) {
    return *a4 != 0;
  }
  return result;
}

- (int)typeOfNameAtIndex:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)VoiceDialMaidenNameDataSource;
  id v5 = [(VoiceDialNameDataSource *)&v8 personNameCount];
  if (a3 >= (unint64_t)v5)
  {
    if (a3 - (unint64_t)v5 >= 2) {
      return -1;
    }
    else {
      return 2;
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)VoiceDialMaidenNameDataSource;
    return [(VoiceDialNameDataSource *)&v7 typeOfNameAtIndex:a3];
  }
}

- (BOOL)getNth:(unint64_t)a3 name:(id *)a4 phoneticName:(id *)a5 ofType:(int)a6 nameIndex:(unint64_t *)a7 forPerson:(void *)a8
{
  uint64_t v10 = *(void *)&a6;
  if (a6 == 1
    && (v20.receiver = self,
        v20.super_class = (Class)VoiceDialMaidenNameDataSource,
        [(VoiceDialNameDataSource *)&v20 countOfNamesOfType:1] == a3))
  {
    if (a7) {
      *a7 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if (a4)
    {
      if (VoiceDialPersonIsCompany(a8)
        || (CFStringRef v15 = (const __CFString *)ABRecordCopyValue(a8, *MEMORY[0x263F244D0])) == 0)
      {
        LOBYTE(a4) = 0;
      }
      else
      {
        CFStringRef v16 = v15;
        v17 = (id)VoiceDialMaidenNameDataSourceCreateMaidenNameFromLastName(v15);
        *a4 = v17;
        LOBYTE(a4) = v17 != 0;
        CFRelease(v16);
      }
    }
    if (a5) {
      *a5 = 0;
    }
  }
  else
  {
    v19.receiver = self;
    v19.super_class = (Class)VoiceDialMaidenNameDataSource;
    LOBYTE(a4) = [(VoiceDialNameDataSource *)&v19 getNth:a3 name:a4 phoneticName:a5 ofType:v10 nameIndex:a7 forPerson:a8];
  }
  return (char)a4;
}

- (unint64_t)countOfNamesOfType:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VoiceDialMaidenNameDataSource;
  unint64_t result = -[VoiceDialNameDataSource countOfNamesOfType:](&v5, sel_countOfNamesOfType_);
  if (a3 == 1) {
    ++result;
  }
  return result;
}

- (int)matchingNameType:(id)a3 fromTypes:(unint64_t)a4 forPerson:(void *)a5
{
  id v8 = a3;
  v15.receiver = self;
  v15.super_class = (Class)VoiceDialMaidenNameDataSource;
  int v9 = [(VoiceDialNameDataSource *)&v15 matchingNameType:v8 fromTypes:a4 forPerson:a5];
  if (v9 == -1)
  {
    if ((a4 & 2) != 0 && (CFStringRef v10 = (const __CFString *)ABRecordCopyValue(a5, *MEMORY[0x263F244D0])) != 0)
    {
      CFStringRef v11 = v10;
      CFStringRef MaidenNameFromLastName = VoiceDialMaidenNameDataSourceCreateMaidenNameFromLastName(v10);
      if (MaidenNameFromLastName)
      {
        CFStringRef v13 = MaidenNameFromLastName;
        if ([v8 caseInsensitiveCompare:MaidenNameFromLastName]) {
          int v9 = -1;
        }
        else {
          int v9 = 1;
        }
        CFRelease(v13);
      }
      else
      {
        int v9 = -1;
      }
      CFRelease(v11);
    }
    else
    {
      int v9 = -1;
    }
  }

  return v9;
}

@end