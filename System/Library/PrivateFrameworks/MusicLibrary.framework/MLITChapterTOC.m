@interface MLITChapterTOC
+ (unsigned)_chapterDataCookieIndexMapForProperty:(int)a3 ofChapterTOC:(id)a4;
+ (void)enumerateArtworkCacheIDsInFlattenedChapterData:(id)a3 usingBlock:(id)a4;
+ (void)enumerateChapterTimesInFlattenedChapterData:(id)a3 usingBlock:(id)a4;
- (ChapterData)chapterDataRef;
- (MLITChapterTOC)initWithChapterDataRef:(ChapterData *)a3 totalTimeInMS:(unsigned int)a4;
- (id)titlePropertyOfChapterAtIndex:(unsigned int)a3;
- (id)urlPropertyOfChapterAtIndex:(unsigned int)a3;
- (id)urlTitlePropertyOfChapterAtIndex:(unsigned int)a3;
- (id)urlTitleTrimmingCharacterSet;
- (unsigned)_cachedCookieIndexMapForProperty:(int)a3 createIfNecessary:(BOOL)a4;
- (unsigned)chapterIndexForGroupIndex:(unsigned int)a3 groupingProperty:(int)a4;
- (unsigned)countOfChapters;
- (unsigned)countOfGroupsForProperty:(int)a3;
- (unsigned)durationInMSOfGroupAtIndex:(unsigned int)a3 groupingProperty:(int)a4;
- (unsigned)groupIndexAtTimeLocationInMS:(unsigned int)a3 groupingProperty:(int)a4;
- (unsigned)groupIndexForChapterIndex:(unsigned int)a3 groupingProperty:(int)a4;
- (unsigned)timeLocationInMSOfChapterAtIndex:(unsigned int)a3;
- (unsigned)timeLocationInMSOfGroupAtIndex:(unsigned int)a3 groupingProperty:(int)a4;
- (unsigned)totalTimeInMS;
- (void)dealloc;
@end

@implementation MLITChapterTOC

- (id)urlPropertyOfChapterAtIndex:(unsigned int)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  chapterDataRef = self->_chapterDataRef;
  if (!chapterDataRef) {
    goto LABEL_9;
  }
  if ((ChapterData_GetFlags() & 4) == 0 || ChapterData_GetIndChapterTime() == -1)
  {
LABEL_8:
    chapterDataRef = 0;
LABEL_9:
    v4 = 0;
LABEL_10:

    goto LABEL_11;
  }
  bzero(v6, 0x800uLL);
  if (!ChapterData_FindURLForTime())
  {
    if (v6[1])
    {
      v4 = (void *)[[NSString alloc] initWithUTF8String:v6];
      if (v4) {
        chapterDataRef = (ChapterData *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v4];
      }
      else {
        chapterDataRef = 0;
      }
      goto LABEL_10;
    }
    goto LABEL_8;
  }
  chapterDataRef = 0;
LABEL_11:

  return chapterDataRef;
}

- (id)urlTitlePropertyOfChapterAtIndex:(unsigned int)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (!self->_chapterDataRef || (ChapterData_GetFlags() & 4) == 0) {
    goto LABEL_3;
  }
  if (ChapterData_GetIndChapterTime() == -1)
  {
    v5 = 0;
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    if (ChapterData_FindURLTitleForTime())
    {
LABEL_3:
      v4 = 0;
      goto LABEL_9;
    }
    v5 = NSStringCreateWithUStr255((unsigned __int16 *)v9);
  }
  id v6 = v5;
  uint64_t v7 = [(MLITChapterTOC *)self urlTitleTrimmingCharacterSet];
  v4 = [v6 stringByTrimmingCharactersInSet:v7];

LABEL_9:

  return v4;
}

- (id)urlTitleTrimmingCharacterSet
{
  return (id)[MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
}

- (id)titlePropertyOfChapterAtIndex:(unsigned int)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (!self->_chapterDataRef
    || (ChapterData_GetFlags() & 1) == 0
    || ChapterData_GetIndChapterTime() == -1
    || (memset(v5, 0, sizeof(v5)), ChapterData_CopyProperty()))
  {
    v3 = 0;
  }
  else
  {
    v3 = NSStringCreateWithUStr255((unsigned __int16 *)v5);
  }

  return v3;
}

- (unsigned)timeLocationInMSOfChapterAtIndex:(unsigned int)a3
{
  chapterDataRef = self->_chapterDataRef;
  if (chapterDataRef) {
    LODWORD(chapterDataRef) = ChapterData_GetIndChapterTime();
  }
  return chapterDataRef;
}

- (unsigned)timeLocationInMSOfGroupAtIndex:(unsigned int)a3 groupingProperty:(int)a4
{
  uint64_t v5 = [(MLITChapterTOC *)self chapterIndexForGroupIndex:*(void *)&a3 groupingProperty:*(void *)&a4];

  return [(MLITChapterTOC *)self timeLocationInMSOfChapterAtIndex:v5];
}

- (unsigned)groupIndexAtTimeLocationInMS:(unsigned int)a3 groupingProperty:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v6 = [(MLChapterTOC *)self chapterIndexAtTimeLocationInMS:*(void *)&a3];

  return [(MLITChapterTOC *)self groupIndexForChapterIndex:v6 groupingProperty:v4];
}

- (unsigned)durationInMSOfGroupAtIndex:(unsigned int)a3 groupingProperty:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v7 = -[MLITChapterTOC chapterIndexForGroupIndex:groupingProperty:](self, "chapterIndexForGroupIndex:groupingProperty:");
  if ([(MLITChapterTOC *)self countOfGroupsForProperty:v4] - 1 == a3)
  {
    unsigned int v8 = [(MLITChapterTOC *)self totalTimeInMS];
    return v8 - [(MLITChapterTOC *)self timeLocationInMSOfChapterAtIndex:v7];
  }
  else
  {
    unsigned int v10 = [(MLITChapterTOC *)self timeLocationInMSOfChapterAtIndex:[(MLITChapterTOC *)self chapterIndexForGroupIndex:a3 + 1 groupingProperty:v4]];
    return v10 + ~[(MLITChapterTOC *)self timeLocationInMSOfChapterAtIndex:v7];
  }
}

- (unsigned)totalTimeInMS
{
  return self->_totalTimeInMS;
}

- (unsigned)groupIndexForChapterIndex:(unsigned int)a3 groupingProperty:(int)a4
{
  chapterDataRef = self->_chapterDataRef;
  unsigned int v5 = 0x7FFFFFFF;
  if (chapterDataRef)
  {
    uint64_t IndChapterTime = ChapterData_GetIndChapterTime();
    int v9 = 0x7FFFFFFF;
    if ((a4 - 1) <= 3
      && !((unsigned int (*)(ChapterData *, uint64_t, void, int *))off_1F08D3FB8[a4 - 1])(chapterDataRef, IndChapterTime, 0, &v9)&& v9 != 0x7FFFFFFF)
    {
      return v9 - 1;
    }
  }
  return v5;
}

- (unsigned)chapterIndexForGroupIndex:(unsigned int)a3 groupingProperty:(int)a4
{
  unsigned int v5 = [(MLITChapterTOC *)self _cachedCookieIndexMapForProperty:*(void *)&a4 createIfNecessary:1];
  if (v5 && *v5 > a3) {
    return v5[a3 + 1] - 1;
  }
  return a3;
}

- (unsigned)countOfGroupsForProperty:(int)a3
{
  unsigned int v5 = [(MLITChapterTOC *)self _cachedCookieIndexMapForProperty:*(void *)&a3 createIfNecessary:0];
  if (v5) {
    return *v5;
  }
  chapterDataRef = self->_chapterDataRef;
  if (!chapterDataRef) {
    return 0;
  }
  unsigned int result = ChapterData_GetNumChapters();
  if (result)
  {
    uint64_t IndChapterTime = ChapterData_GetIndChapterTime();
    unsigned int v9 = 0x7FFFFFFF;
    if ((a3 - 1) > 3) {
      return 0;
    }
    if (((unsigned int (*)(ChapterData *, uint64_t, void, unsigned int *))off_1F08D3FB8[a3 - 1])(chapterDataRef, IndChapterTime, 0, &v9))
    {
      return 0;
    }
    unsigned int result = v9;
    if (v9 == 0x7FFFFFFF) {
      return 0;
    }
  }
  return result;
}

- (unsigned)_cachedCookieIndexMapForProperty:(int)a3 createIfNecessary:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v7 = (unsigned int **)[(id)objc_opt_class() _chapterDataCookieIndexMapForProperty:*(void *)&a3 ofChapterTOC:self];
  unsigned int v8 = v7;
  if (!v7 || (chapterDataRef = self->_chapterDataRef) == 0)
  {
LABEL_16:
    if (v8) {
      return *v8;
    }
    else {
      return 0;
    }
  }
  unsigned int result = *v7;
  if (*v8) {
    BOOL v11 = 1;
  }
  else {
    BOOL v11 = !v4;
  }
  if (!v11)
  {
    int NumChapters = ChapterData_GetNumChapters();
    unsigned int v13 = [(MLITChapterTOC *)self countOfGroupsForProperty:v5];
    unsigned int result = (unsigned int *)malloc_type_calloc((NumChapters + 1), 4uLL, 0x100004052888210uLL);
    *unsigned int v8 = result;
    *unsigned int result = v13;
    if (NumChapters)
    {
      unsigned int v14 = 0;
      uint64_t v15 = (int)v5 - 1;
      unsigned int v16 = 1;
      int v17 = 0x7FFFFFFF;
      do
      {
        ++v14;
        uint64_t IndChapterTime = ChapterData_GetIndChapterTime();
        int v20 = 0x7FFFFFFF;
        int v19 = 0x7FFFFFFF;
        if (v15 <= 3)
        {
          if (((unsigned int (*)(ChapterData *, uint64_t, void, int *))off_1F08D3FB8[v15])(chapterDataRef, IndChapterTime, 0, &v20))
          {
            int v19 = 0x7FFFFFFF;
          }
          else
          {
            int v19 = v20;
          }
        }
        if (v19 != v17)
        {
          (*v8)[v16++] = v14;
          int v17 = v19;
        }
      }
      while (NumChapters != v14);
      goto LABEL_16;
    }
  }
  return result;
}

- (unsigned)countOfChapters
{
  chapterDataRef = self->_chapterDataRef;
  if (chapterDataRef) {
    LODWORD(chapterDataRef) = ChapterData_GetNumChapters();
  }
  return chapterDataRef;
}

- (void)dealloc
{
  if (self->_chapterDataRef) {
    ChapterData_Release();
  }
  picCookieIndexMap = self->_picCookieIndexMap;
  if (picCookieIndexMap) {
    free(picCookieIndexMap);
  }
  urlCookieIndexMap = self->_urlCookieIndexMap;
  if (urlCookieIndexMap) {
    free(urlCookieIndexMap);
  }
  nameCookieIndexMap = self->_nameCookieIndexMap;
  if (nameCookieIndexMap) {
    free(nameCookieIndexMap);
  }
  v6.receiver = self;
  v6.super_class = (Class)MLITChapterTOC;
  [(MLITChapterTOC *)&v6 dealloc];
}

- (ChapterData)chapterDataRef
{
  return self->_chapterDataRef;
}

- (MLITChapterTOC)initWithChapterDataRef:(ChapterData *)a3 totalTimeInMS:(unsigned int)a4
{
  uint64_t v8 = objc_opt_class();
  if (v8 == objc_opt_class())
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"MLITChapterTOC.m" lineNumber:44 description:@"MLITChapterTOC is an abstract class.  You must allocate a concrete subclass."];
  }
  v13.receiver = self;
  v13.super_class = (Class)MLITChapterTOC;
  unsigned int v9 = [(MLITChapterTOC *)&v13 init];
  unsigned int v10 = v9;
  if (v9)
  {
    v9->_totalTimeInMS = a4;
    if (a3) {
      v9->_chapterDataRef = (ChapterData *)ChapterData_Retain();
    }
  }
  return v10;
}

+ (void)enumerateChapterTimesInFlattenedChapterData:(id)a3 usingBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v8 = 0;
  [v5 length];
  id v7 = v5;
  [v7 bytes];
  ChapterData_CreateWithFlattenedData();
  ChapterData_Release();
}

+ (void)enumerateArtworkCacheIDsInFlattenedChapterData:(id)a3 usingBlock:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v8 = 0;
  [v5 length];
  id v7 = v5;
  [v7 bytes];
  ChapterData_CreateWithFlattenedData();
  ChapterData_Release();
}

+ (unsigned)_chapterDataCookieIndexMapForProperty:(int)a3 ofChapterTOC:(id)a4
{
  id v7 = (char *)a4;
  if (!v7)
  {
    unsigned int v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:a1 file:@"MLITChapterTOC.m" lineNumber:92 description:@"invalid parameter"];
  }
  if ((a3 - 1) > 3) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = (unsigned int **)&v7[*off_1E5FB59F8[a3 - 1]];
  }

  return v8;
}

@end