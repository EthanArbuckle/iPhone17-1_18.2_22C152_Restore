@interface OITSUPathSet
+ (id)parseNumberOutOfBasename:(id)a3 hasNumber:(BOOL *)a4 number:(unsigned int *)a5;
+ (void)processPath:(id)a3 base:(id *)a4 hasBaseNumber:(BOOL *)a5 baseNumber:(unsigned int *)a6 extension:(id *)a7;
- (BOOL)isPathUsed:(id)a3;
- (OITSUPathSet)init;
- (OITSUPathSet)initWithPaths:(id)a3 basePathToNumberMap:(id)a4;
- (id)addPath:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)pathIsNoLongerUsed:(id)a3;
- (void)pathIsUsed:(id)a3;
- (void)setUnderlyingPathSet:(id)a3;
- (void)unionPathSet:(id)a3;
@end

@implementation OITSUPathSet

- (OITSUPathSet)init
{
  v4.receiver = self;
  v4.super_class = (Class)OITSUPathSet;
  v2 = [(OITSUPathSet *)&v4 init];
  if (v2)
  {
    v2->mPaths = (NSMutableSet *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:4096];
    v2->mBasePathToNumberMap = (NSMutableDictionary *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:128];
  }
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithPaths:basePathToNumberMap:", self->mPaths, self->mBasePathToNumberMap);
  [v4 setUnderlyingPathSet:self->mUnderlyingSet];
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OITSUPathSet;
  [(OITSUPathSet *)&v3 dealloc];
}

- (id)addPath:(id)a3
{
  id v19 = 0;
  char v18 = 0;
  unsigned int v17 = 0;
  uint64_t v16 = 0;
  [(id)objc_opt_class() processPath:a3 base:&v19 hasBaseNumber:&v18 baseNumber:&v17 extension:&v16];
  id v4 = v19;
  if (v18) {
    id v4 = (id)objc_msgSend(v19, "stringByAppendingFormat:", @"-%u", v17);
  }
  if (v16)
  {
    id v4 = (id)objc_msgSend(v4, "tsu_tolerantStringByAppendingPathExtension:");
    id v5 = v19;
    if (v16) {
      id v5 = (id)objc_msgSend(v19, "tsu_tolerantStringByAppendingPathExtension:");
    }
  }
  else
  {
    id v5 = v19;
  }
  uint64_t v6 = objc_msgSend((id)objc_msgSend(v5, "uppercaseString"), "lowercaseString");
  if ([(OITSUPathSet *)self isPathUsed:v4])
  {
    unsigned int v7 = v17;
    unsigned int v8 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->mBasePathToNumberMap, "objectForKey:", v6), "unsignedIntValue");
    if (v7 <= v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = v7;
    }
    do
    {
      id v4 = v19;
      if (v9) {
        id v4 = (id)objc_msgSend(v19, "stringByAppendingFormat:", @"-%u", v9);
      }
      if (v16) {
        id v4 = (id)objc_msgSend(v4, "tsu_tolerantStringByAppendingPathExtension:");
      }
      uint64_t v9 = (v9 + 1);
    }
    while ([(OITSUPathSet *)self isPathUsed:v4]);
    mBasePathToNumberMap = self->mBasePathToNumberMap;
    uint64_t v11 = [NSNumber numberWithUnsignedInt:v9];
    v12 = mBasePathToNumberMap;
    goto LABEL_19;
  }
  unsigned int v13 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->mBasePathToNumberMap, "objectForKey:", v6), "unsignedIntValue");
  if (v17 >= v13)
  {
    v14 = self->mBasePathToNumberMap;
    uint64_t v11 = [NSNumber numberWithUnsignedInt:v17 + 1];
    v12 = v14;
LABEL_19:
    [(NSMutableDictionary *)v12 setObject:v11 forKey:v6];
  }
  [(OITSUPathSet *)self pathIsUsed:v4];
  return v4;
}

- (void)pathIsUsed:(id)a3
{
  mPaths = self->mPaths;
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a3, "uppercaseString"), "lowercaseString");
  [(NSMutableSet *)mPaths addObject:v4];
}

- (void)pathIsNoLongerUsed:(id)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a3, "uppercaseString"), "lowercaseString");
  if ([(NSMutableSet *)self->mPaths containsObject:v4])
  {
    [(NSMutableSet *)self->mPaths removeObject:v4];
    id v11 = 0;
    char v10 = 0;
    int v9 = 0;
    uint64_t v8 = 0;
    [(id)objc_opt_class() processPath:v4 base:&v11 hasBaseNumber:&v10 baseNumber:&v9 extension:&v8];
    id v5 = v11;
    if (v8) {
      id v5 = (id)objc_msgSend(v11, "tsu_tolerantStringByAppendingPathExtension:");
    }
    uint64_t v6 = objc_msgSend((id)objc_msgSend(v5, "uppercaseString"), "lowercaseString");
    int v7 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->mBasePathToNumberMap, "objectForKey:", v6), "unsignedIntValue");
    if (v7 == v9 + 1) {
      -[NSMutableDictionary setObject:forKey:](self->mBasePathToNumberMap, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedInt:"), v6);
    }
  }
}

- (BOOL)isPathUsed:(id)a3
{
  if (-[NSMutableSet containsObject:](self->mPaths, "containsObject:", objc_msgSend((id)objc_msgSend(a3, "uppercaseString"), "lowercaseString")))
  {
    LOBYTE(mUnderlyingSet) = 1;
  }
  else
  {
    mUnderlyingSet = self->mUnderlyingSet;
    if (mUnderlyingSet)
    {
      LOBYTE(mUnderlyingSet) = [(OITSUPathSet *)mUnderlyingSet isPathUsed:a3];
    }
  }
  return (char)mUnderlyingSet;
}

- (void)setUnderlyingPathSet:(id)a3
{
  id v5 = a3;

  self->mUnderlyingSet = (OITSUPathSet *)a3;
}

- (void)unionPathSet:(id)a3
{
  [(NSMutableSet *)self->mPaths unionSet:*((void *)a3 + 1)];
  id v12 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  objc_msgSend(v12, "addObjectsFromArray:", -[NSMutableDictionary allKeys](self->mBasePathToNumberMap, "allKeys"));
  objc_msgSend(v12, "addObjectsFromArray:", objc_msgSend(*((id *)a3 + 2), "allKeys"));
  id v5 = (void *)[v12 objectEnumerator];
  uint64_t v6 = [v5 nextObject];
  if (v6)
  {
    uint64_t v7 = v6;
    do
    {
      uint64_t v8 = (void *)[(NSMutableDictionary *)self->mBasePathToNumberMap objectForKey:v7];
      int v9 = (void *)[*((id *)a3 + 2) objectForKey:v7];
      char v10 = v9;
      if (!v8
        || v9 && (unsigned int v11 = [v9 unsignedIntValue], v11 > objc_msgSend(v8, "unsignedIntValue")))
      {
        [(NSMutableDictionary *)self->mBasePathToNumberMap setObject:v10 forKey:v7];
      }
      uint64_t v7 = [v5 nextObject];
    }
    while (v7);
  }
}

- (OITSUPathSet)initWithPaths:(id)a3 basePathToNumberMap:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)OITSUPathSet;
  uint64_t v6 = [(OITSUPathSet *)&v8 init];
  if (v6)
  {
    v6->mPaths = (NSMutableSet *)[a3 mutableCopy];
    v6->mBasePathToNumberMap = (NSMutableDictionary *)[a4 mutableCopy];
  }
  return v6;
}

+ (id)parseNumberOutOfBasename:(id)a3 hasNumber:(BOOL *)a4 number:(unsigned int *)a5
{
  id v5 = a3;
  *a4 = 0;
  if (a3)
  {
    uint64_t v8 = [a3 length];
    if (v8 - 1 >= 1)
    {
      uint64_t v9 = v8;
      unsigned int v10 = objc_msgSend(v5, "characterAtIndex:");
      if (v10 <= 0xFF)
      {
        uint64_t v11 = MEMORY[0x263EF8318];
        if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v10 + 60) & 0x400) != 0)
        {
          uint64_t v12 = v9 - 2;
          while (1)
          {
            unsigned int v13 = [v5 characterAtIndex:v12];
            if (v13 > 0xFF || (*(_DWORD *)(v11 + 4 * v13 + 60) & 0x400) == 0) {
              break;
            }
            if (v12-- <= 0) {
              return v5;
            }
          }
          if (v12)
          {
            if ([v5 characterAtIndex:v12] == 45)
            {
              v15 = (void *)[v5 substringToIndex:v12];
              signed int v16 = objc_msgSend((id)objc_msgSend(v5, "substringFromIndex:", v12 + 1), "intValue");
              if (v15)
              {
                signed int v17 = v16;
                if ([v15 length])
                {
                  if (v17 != 0x7FFFFFFF && v17 >= 1)
                  {
                    *a4 = 1;
                    if (a5)
                    {
                      *a5 = v17;
                      return v15;
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v5;
}

+ (void)processPath:(id)a3 base:(id *)a4 hasBaseNumber:(BOOL *)a5 baseNumber:(unsigned int *)a6 extension:(id *)a7
{
  id v11 = a3;
  unsigned int v13 = (void *)[a3 pathExtension];
  *a7 = v13;
  if (![v13 length]) {
    *a7 = 0;
  }
  if (![v11 length])
  {
    v14 = NSString;
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    id v11 = (id)objc_msgSend(v14, "stringWithFormat:", @"%.0f", v15 * 1000.0);
  }
  *a4 = (id)[v11 stringByDeletingPathExtension];
  *a6 = 0;
  signed int v16 = (void *)[a1 parseNumberOutOfBasename:*a4 hasNumber:a5 number:a6];
  *a4 = v16;
  signed int v17 = (void *)[v16 lastPathComponent];
  int v18 = [v17 hasPrefix:@"~"];
  if (v18) {
    signed int v17 = (void *)[@"x" stringByAppendingString:v17];
  }
  uint64_t v19 = 255 - [@"-0000" length];
  if (*a7) {
    v19 += ~[*a7 length];
  }
  v20 = (const char *)[v17 fileSystemRepresentation];
  if (!v20)
  {
    if (!v18) {
      return;
    }
    goto LABEL_13;
  }
  uint64_t v21 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F08850], "defaultManager"), "stringWithFileSystemRepresentation:length:", v20, strlen(v20)), "tsu_substringWithComposedCharacterSequencesTruncatedToLength:", v19);
  int v22 = [v17 isEqualToString:v21];
  if (!v22) {
    signed int v17 = (void *)v21;
  }
  if ((v18 | v22 ^ 1)) {
LABEL_13:
  }
    *a4 = (id)objc_msgSend((id)objc_msgSend(*a4, "stringByDeletingLastPathComponent"), "stringByAppendingPathComponent:", v17);
}

@end