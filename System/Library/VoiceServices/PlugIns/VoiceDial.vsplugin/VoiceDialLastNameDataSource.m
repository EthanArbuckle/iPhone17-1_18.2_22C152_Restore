@interface VoiceDialLastNameDataSource
- (BOOL)getName:(id *)a3 phoneticName:(id *)a4 atIndex:(unint64_t)a5 forPerson:(void *)a6;
- (int)typeOfNameAtIndex:(unint64_t)a3;
- (unint64_t)indexOfMainNameOfType:(int)a3;
- (unint64_t)personNameCount;
@end

@implementation VoiceDialLastNameDataSource

- (unint64_t)personNameCount
{
  v3.receiver = self;
  v3.super_class = (Class)VoiceDialLastNameDataSource;
  return [(VoiceDialNameDataSource *)&v3 personNameCount] + 1;
}

- (BOOL)getName:(id *)a3 phoneticName:(id *)a4 atIndex:(unint64_t)a5 forPerson:(void *)a6
{
  v16.receiver = self;
  v16.super_class = (Class)VoiceDialLastNameDataSource;
  id v11 = [(VoiceDialNameDataSource *)&v16 personNameCount];
  if ((unint64_t)v11 <= a5)
  {
    id v12 = v11;
    if (a3)
    {
      id v13 = 0;
      *a3 = 0;
      if (v12 == (id)a5)
      {
        if ([(VoiceDialNameDataSource *)self useCompositeNamesOnly])
        {
          id v13 = *a3;
        }
        else
        {
          id v13 = (id)ABRecordCopyValue(a6, *MEMORY[0x263F244D0]);
          *a3 = v13;
        }
      }
      LOBYTE(a3) = v13 != 0;
    }
    if (a4)
    {
      *a4 = 0;
      if (v12 == (id)a5 && ![(VoiceDialNameDataSource *)self useCompositeNamesOnly]) {
        *a4 = [(VoiceDialNameDataSource *)self copyPronunciationPropertyForPerson:a6 withNameType:1];
      }
      LOBYTE(a3) = (a3 & 1) != 0 || *a4 != 0;
    }
  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)VoiceDialLastNameDataSource;
    LOBYTE(a3) = [(VoiceDialNameDataSource *)&v15 getName:a3 phoneticName:a4 atIndex:a5 forPerson:a6];
  }
  return (char)a3;
}

- (unint64_t)indexOfMainNameOfType:(int)a3
{
  if (a3 == 1)
  {
    v5.receiver = self;
    v5.super_class = (Class)VoiceDialLastNameDataSource;
    return [(VoiceDialNameDataSource *)&v5 personNameCount];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)VoiceDialLastNameDataSource;
    return -[VoiceDialNameDataSource indexOfMainNameOfType:](&v4, sel_indexOfMainNameOfType_);
  }
}

- (int)typeOfNameAtIndex:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)VoiceDialLastNameDataSource;
  id v5 = [(VoiceDialNameDataSource *)&v8 personNameCount];
  if ((unint64_t)v5 <= a3)
  {
    if (v5 == (id)a3) {
      return 1;
    }
    else {
      return -1;
    }
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)VoiceDialLastNameDataSource;
    return [(VoiceDialNameDataSource *)&v7 typeOfNameAtIndex:a3];
  }
}

@end