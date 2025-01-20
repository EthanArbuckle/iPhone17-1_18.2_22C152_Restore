@interface GQHBulletState
+ (__CFString)createLabelStr:(int)a3 number:(int)a4;
- (BOOL)hasNumberAtLevel:(int)a3;
- (GQHBulletState)init;
- (__CFString)bulletChar:(int)a3;
- (__CFString)createTieredNumberStringForLevel:(int)a3;
- (id)listStyleAtLevel:(int)a3;
- (int)bulletIndentForLevel:(int)a3;
- (int)currentLevel;
- (int)labelTypeAtLevel:(int)a3;
- (int)numberAtLevel:(int)a3;
- (int)textIndentForLevel:(int)a3;
- (int)typeAtlevel:(int)a3;
- (void)dealloc;
- (void)setBulletChar:(__CFString *)a3 level:(int)a4;
- (void)setBulletIndent:(int)a3 level:(int)a4;
- (void)setCurrentLevel:(int)a3;
- (void)setLabelType:(int)a3 level:(int)a4;
- (void)setListStyle:(id)a3 atLevel:(int)a4;
- (void)setNumber:(int)a3 level:(int)a4;
- (void)setTextIndent:(int)a3 level:(int)a4;
- (void)setType:(int)a3 level:(int)a4;
@end

@implementation GQHBulletState

+ (__CFString)createLabelStr:(int)a3 number:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  Mutable = CFStringCreateMutable(0, 0);
  v7 = Mutable;
  if ((a3 & 0xFFFFFFFE) == 4)
  {
    int v8 = (int)v4 % 26;
    if (a3 == 4) {
      unsigned int v9 = 90;
    }
    else {
      unsigned int v9 = 122;
    }
    if (a3 == 4) {
      int v10 = 64;
    }
    else {
      int v10 = 96;
    }
    unsigned int v11 = v10 + v8;
    if (v8) {
      uint64_t v12 = v11;
    }
    else {
      uint64_t v12 = v9;
    }
    if ((int)v4 >= -24)
    {
      int v13 = ((int)v4 - 1) / 26 + 1;
      do
      {
        CFStringAppendFormat(v7, 0, @"%c", v12);
        --v13;
      }
      while (v13);
    }
  }
  else
  {
    CFStringAppendFormat(Mutable, 0, @"%d", v4);
  }
  return v7;
}

- (GQHBulletState)init
{
  v7.receiver = self;
  v7.super_class = (Class)GQHBulletState;
  v2 = [(GQHBulletState *)&v7 init];
  if (v2)
  {
    v2->mLevels = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
    if ((dword_9CDF8 & 0x80000000) == 0)
    {
      uint64_t v3 = 0;
      int v4 = -1;
      do
      {
        v5 = objc_alloc_init(GQHBulletInfo);
        [(GQHBulletInfo *)v5 setBulletIndent:v3];
        [(GQHBulletInfo *)v5 setTextIndent:10];
        CFArrayAppendValue(v2->mLevels, v5);

        ++v4;
        uint64_t v3 = (v3 + 10);
      }
      while (v4 < dword_9CDF8);
    }
  }
  return v2;
}

- (void)dealloc
{
  CFRelease(self->mLevels);
  v3.receiver = self;
  v3.super_class = (Class)GQHBulletState;
  [(GQHBulletState *)&v3 dealloc];
}

- (void)setType:(int)a3 level:(int)a4
{
  uint64_t v4 = *(void *)&a3;
  ValueAtIndex = (void *)CFArrayGetValueAtIndex(self->mLevels, a4);
  [ValueAtIndex setType:v4];
}

- (int)typeAtlevel:(int)a3
{
  ValueAtIndex = (void *)CFArrayGetValueAtIndex(self->mLevels, a3);
  return [ValueAtIndex type];
}

- (void)setNumber:(int)a3 level:(int)a4
{
  uint64_t v4 = *(void *)&a3;
  ValueAtIndex = (void *)CFArrayGetValueAtIndex(self->mLevels, a4);
  [ValueAtIndex setNumber:v4];
  [ValueAtIndex setHasNumber:1];
}

- (BOOL)hasNumberAtLevel:(int)a3
{
  ValueAtIndex = (void *)CFArrayGetValueAtIndex(self->mLevels, a3);
  return [ValueAtIndex hasNumber];
}

- (int)numberAtLevel:(int)a3
{
  ValueAtIndex = (void *)CFArrayGetValueAtIndex(self->mLevels, a3);
  return [ValueAtIndex number];
}

- (void)setLabelType:(int)a3 level:(int)a4
{
  uint64_t v4 = *(void *)&a3;
  ValueAtIndex = (void *)CFArrayGetValueAtIndex(self->mLevels, a4);
  [ValueAtIndex setLabelType:v4];
}

- (int)labelTypeAtLevel:(int)a3
{
  ValueAtIndex = (void *)CFArrayGetValueAtIndex(self->mLevels, a3);
  return [ValueAtIndex labelType];
}

- (void)setBulletChar:(__CFString *)a3 level:(int)a4
{
  ValueAtIndex = (void *)CFArrayGetValueAtIndex(self->mLevels, a4);
  [ValueAtIndex setBulletChar:a3];
}

- (__CFString)bulletChar:(int)a3
{
  ValueAtIndex = (void *)CFArrayGetValueAtIndex(self->mLevels, a3);
  return (__CFString *)[ValueAtIndex bulletChar];
}

- (void)setBulletIndent:(int)a3 level:(int)a4
{
  uint64_t v4 = *(void *)&a3;
  ValueAtIndex = (void *)CFArrayGetValueAtIndex(self->mLevels, a4);
  [ValueAtIndex setBulletIndent:v4];
}

- (int)bulletIndentForLevel:(int)a3
{
  ValueAtIndex = (void *)CFArrayGetValueAtIndex(self->mLevels, a3);
  return [ValueAtIndex bulletIndent];
}

- (void)setTextIndent:(int)a3 level:(int)a4
{
  uint64_t v4 = *(void *)&a3;
  ValueAtIndex = (void *)CFArrayGetValueAtIndex(self->mLevels, a4);
  [ValueAtIndex setTextIndent:v4];
}

- (int)textIndentForLevel:(int)a3
{
  ValueAtIndex = (void *)CFArrayGetValueAtIndex(self->mLevels, a3);
  return [ValueAtIndex textIndent];
}

- (void)setListStyle:(id)a3 atLevel:(int)a4
{
  if (CFArrayGetCount(self->mLevels) > a4)
  {
    ValueAtIndex = (void *)CFArrayGetValueAtIndex(self->mLevels, a4);
    [ValueAtIndex setStyle:a3];
  }
}

- (id)listStyleAtLevel:(int)a3
{
  if (CFArrayGetCount(self->mLevels) <= a3) {
    return 0;
  }
  ValueAtIndex = (void *)CFArrayGetValueAtIndex(self->mLevels, a3);
  return [ValueAtIndex style];
}

- (__CFString)createTieredNumberStringForLevel:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  CFIndex Count = CFArrayGetCount(self->mLevels);
  Mutable = CFStringCreateMutable(kCFAllocatorDefault, 0);
  unsigned int v7 = [(GQHBulletState *)self typeAtlevel:v3];
  int v8 = 0;
  if ((int)v3 >= 1 && (v7 & 0xFFFFFFFE) == 2)
  {
    unsigned int v9 = [(GQHBulletState *)self typeAtlevel:(v3 - 1)];
    unsigned int v10 = v3;
    do
    {
      unsigned int v11 = v10;
      if (v10 < 2) {
        break;
      }
      if ((v9 & 0xFFFFFFFE) != 2) {
        break;
      }
      unsigned int v12 = [(GQHBulletState *)self typeAtlevel:v10 - 2];
      unsigned int v10 = v11 - 1;
      BOOL v13 = v9 == 2;
      unsigned int v9 = v12;
    }
    while (!v13);
    int v8 = v11 - 1;
  }
  if (v8 <= (int)v3)
  {
    CFIndex v14 = v8;
    if (Count > v8)
    {
      char v15 = 0;
      do
      {
        ValueAtIndex = (void *)CFArrayGetValueAtIndex(self->mLevels, v14);
        if ([ValueAtIndex type] == 3
          || [ValueAtIndex type] == 2)
        {
          id v17 = [ValueAtIndex createTierStringNumber];
          v18 = v17;
          if ((v15 & 1) == 0) {
            char v15 = 1;
          }
          CFStringAppendFormat(Mutable, 0, @"%@.", v17);
          CFRelease(v18);
        }
        if (([ValueAtIndex type] == 1 || !objc_msgSend(ValueAtIndex, "type"))
          && (v15 & 1) != 0)
        {
          break;
        }
        if (v14 >= (int)v3) {
          break;
        }
        ++v14;
      }
      while (Count > v14);
    }
  }
  return Mutable;
}

- (void)setCurrentLevel:(int)a3
{
  if (self->mCurrentLevel > a3 && dword_9CDF8 > a3)
  {
    uint64_t v6 = a3;
    do
    {
      ValueAtIndex = (void *)CFArrayGetValueAtIndex(self->mLevels, ++v6);
      [ValueAtIndex setNumber:0];
      [ValueAtIndex setHasNumber:0];
    }
    while (v6 < dword_9CDF8);
  }
  self->mCurrentLevel = a3;
}

- (int)currentLevel
{
  return self->mCurrentLevel;
}

@end