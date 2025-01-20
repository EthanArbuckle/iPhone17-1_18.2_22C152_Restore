@interface TSTCustomFormatList
- (BOOL)supportsIDMapForType:(int)a3;
- (TSTCustomFormatList)init;
- (TSTCustomFormatList)initWithContext:(id)a3;
- (id)allNumberKeys;
- (id)customFormatWrapperForKey:(unsigned int)a3;
- (id)newUniqueNameFromName:(id)a3;
- (id)newUniqueNameFromName:(id)a3 preserveSeed:(BOOL)a4;
- (unsigned)addCustomFormat:(void *)a3 duringImport:(BOOL)a4;
- (unsigned)addCustomFormat:(void *)a3 withOldKey:(unsigned int)a4;
- (unsigned)maxKey;
- (void)customFormatForKey:(unsigned int)a3;
- (void)dealloc;
- (void)p_setupNamesList;
@end

@implementation TSTCustomFormatList

- (TSTCustomFormatList)init
{
  v2 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
  uint64_t v3 = [NSString stringWithUTF8String:"-[TSTCustomFormatList init]"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSTCustomFormatList.mm"), 16, @"Don't use init for TSTCustomFormatList");
  return 0;
}

- (TSTCustomFormatList)initWithContext:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSTCustomFormatList;
  result = [(TSTTableDataList *)&v4 initWithType:6 context:a3];
  if (result) {
    result->mNamesList = 0;
  }
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSTCustomFormatList;
  [(TSTTableDataList *)&v3 dealloc];
}

- (BOOL)supportsIDMapForType:(int)a3
{
  if (a3 == 6) {
    return 1;
  }
  uint64_t v7 = v3;
  uint64_t v8 = v4;
  v6.receiver = self;
  v6.super_class = (Class)TSTCustomFormatList;
  return -[TSTTableDataList supportsIDMapForType:](&v6, sel_supportsIDMapForType_);
}

- (unsigned)addCustomFormat:(void *)a3 duringImport:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t KeyForCustomFormat = TSTTableDataListGetKeyForCustomFormat(&self->super, (TSUCustomFormat *)a3);
  if (KeyForCustomFormat)
  {
    unsigned int v8 = KeyForCustomFormat;
    TSTTableDataListAddReferenceForKey((id *)&self->super.super.super.isa, KeyForCustomFormat);
  }
  else
  {
    v9 = [(TSTCustomFormatList *)self newUniqueNameFromName:TSUCustomFormat::formatName((TSUCustomFormat *)a3) preserveSeed:v4];
    TSUCustomFormat::setFormatName((TSUCustomFormat *)a3, v9);
    uint64_t v10 = TSTTableDataListAddCustomFormat(&self->super, (uint64_t)a3);
    unsigned int v8 = v10;
    mNamesList = self->mNamesList;
    if (mNamesList) {
      BOOL v12 = v10 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    if (!v12) {
      -[NSMutableDictionary setObject:forKey:](mNamesList, "setObject:forKey:", [NSNumber numberWithInt:v10], v9);
    }
  }
  return v8;
}

- (unsigned)addCustomFormat:(void *)a3 withOldKey:(unsigned int)a4
{
  uint64_t v7 = [(TSTCustomFormatList *)self customFormatForKey:*(void *)&a4];
  if (v7 && (TSUCustomFormat::customFormatIsEqual(v7, (TSUCustomFormat *)a3) & 1) != 0) {
    return a4;
  }
  return [(TSTCustomFormatList *)self addCustomFormat:a3 duringImport:0];
}

- (void)customFormatForKey:(unsigned int)a3
{
  return (void *)TSTTableDataListGetCustomFormatForKey((uint64_t)self, *(uint64_t *)&a3);
}

- (id)customFormatWrapperForKey:(unsigned int)a3
{
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x263F7C818]), "initWithCustomFormat:", TSTTableDataListGetCustomFormatForKey((uint64_t)self, *(uint64_t *)&a3));
  return v3;
}

- (unsigned)maxKey
{
  return [(TSTTableDataList *)self nextID] - 1;
}

- (id)allNumberKeys
{
  uint64_t v3 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", -[TSTCustomFormatList count](self, "count"));
  if ([(TSTTableDataList *)self nextID])
  {
    uint64_t v4 = 0;
    do
    {
      if ([(TSTCustomFormatList *)self customFormatForKey:v4]) {
        objc_msgSend(v3, "addObject:", objc_msgSend(NSNumber, "numberWithInt:", v4));
      }
      uint64_t v4 = (v4 + 1);
    }
    while (v4 < [(TSTTableDataList *)self nextID]);
  }
  return v3;
}

- (void)p_setupNamesList
{
  if (!self->mNamesList)
  {
    int64_t v3 = [(TSTCustomFormatList *)self count] <= 20 ? [(TSTCustomFormatList *)self count] : 20;
    uint64_t v4 = (NSMutableDictionary *)(id)[MEMORY[0x263EFF9A0] dictionaryWithCapacity:v3];
    self->mNamesList = v4;
    if (v4)
    {
      if ([(TSTCustomFormatList *)self count] >= 1)
      {
        unsigned int v5 = [(TSTTableDataList *)self nextID];
        if ((int)(v5 - 1) >= 1)
        {
          LODWORD(v6) = v5;
          do
          {
            uint64_t v6 = (v6 - 1);
            uint64_t v7 = [(TSTCustomFormatList *)self customFormatForKey:v6];
            if (v7) {
              -[NSMutableDictionary setObject:forKey:](self->mNamesList, "setObject:forKey:", [NSNumber numberWithInt:v6], TSUCustomFormat::formatName(v7));
            }
          }
          while ((int)v6 > 1);
        }
      }
    }
  }
}

- (id)newUniqueNameFromName:(id)a3
{
  return [(TSTCustomFormatList *)self newUniqueNameFromName:a3 preserveSeed:0];
}

- (id)newUniqueNameFromName:(id)a3 preserveSeed:(BOOL)a4
{
  if (!a3) {
    a3 = (id)[(id)TSTBundle() localizedStringForKey:@"Custom Format" value:&stru_26D688A48 table:@"TSTables"];
  }
  id v16 = a3;
  [(TSTCustomFormatList *)self p_setupNamesList];
  if ([(NSMutableDictionary *)self->mNamesList objectForKey:v16])
  {
    uint64_t v6 = v16;
    do
    {
      v17 = v6;
      uint64_t v7 = (void *)[v6 componentsSeparatedByString:@" "];
      uint64_t v8 = objc_msgSend((id)objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v7, "count") - 1), "integerValue");
      if (!v8 || a4)
      {
        v13 = v17;
        BOOL v12 = @" 1";
      }
      else
      {
        uint64_t v9 = v8;
        uint64_t v10 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v7, "count"));
        [v10 addObjectsFromArray:v7];
        [v10 removeLastObject];
        uint64_t v11 = [v10 componentsJoinedByString:@" "];
        BOOL v12 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @" %li", v9 + 1);
        v13 = (void *)v11;
      }
      uint64_t v18 = [v13 stringByAppendingString:v12];
      uint64_t v14 = [(NSMutableDictionary *)self->mNamesList objectForKey:v18];
      uint64_t v6 = (void *)v18;
      a4 = 0;
    }
    while (v14);
  }
  else
  {
    uint64_t v6 = v16;
  }
  return v6;
}

@end