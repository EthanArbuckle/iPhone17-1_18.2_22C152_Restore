@interface MLChapterTOC
- (BOOL)hasDataForProperty:(int)a3;
- (ChapterData)chapterDataRef;
- (id)titlePropertyOfChapterAtIndex:(unsigned int)a3;
- (id)urlPropertyOfChapterAtIndex:(unsigned int)a3;
- (id)urlTitlePropertyOfChapterAtIndex:(unsigned int)a3;
- (unsigned)chapterIndexAtTimeLocationInMS:(unsigned int)a3;
- (unsigned)chapterIndexForGroupIndex:(unsigned int)a3 groupingProperty:(int)a4;
- (unsigned)countOfChapters;
- (unsigned)countOfGroupsForProperty:(int)a3;
- (unsigned)durationInMSOfGroupAtIndex:(unsigned int)a3 groupingProperty:(int)a4;
- (unsigned)groupIndexAtTimeLocationInMS:(unsigned int)a3 groupingProperty:(int)a4;
- (unsigned)groupIndexForChapterIndex:(unsigned int)a3 groupingProperty:(int)a4;
- (unsigned)timeLocationInMSOfChapterAtIndex:(unsigned int)a3;
- (unsigned)timeLocationInMSOfGroupAtIndex:(unsigned int)a3 groupingProperty:(int)a4;
@end

@implementation MLChapterTOC

- (ChapterData)chapterDataRef
{
  return 0;
}

- (id)urlPropertyOfChapterAtIndex:(unsigned int)a3
{
  return 0;
}

- (id)urlTitlePropertyOfChapterAtIndex:(unsigned int)a3
{
  return 0;
}

- (id)titlePropertyOfChapterAtIndex:(unsigned int)a3
{
  return 0;
}

- (unsigned)timeLocationInMSOfChapterAtIndex:(unsigned int)a3
{
  return 0;
}

- (unsigned)chapterIndexAtTimeLocationInMS:(unsigned int)a3
{
  unsigned int v5 = [(MLChapterTOC *)self countOfChapters];
  if (v5)
  {
    uint64_t v6 = 0;
    unsigned int v7 = 0;
    while (1)
    {
      unsigned int v8 = [(MLChapterTOC *)self timeLocationInMSOfChapterAtIndex:v6];
      if (v7 <= a3 && v8 > a3) {
        break;
      }
      uint64_t v6 = (v6 + 1);
      unsigned int v7 = v8;
      if (v5 == v6) {
        goto LABEL_6;
      }
    }
    if (v6) {
      return v6 - 1;
    }
    else {
      return 0;
    }
  }
  else
  {
LABEL_6:
    if (a3 != 0 && v5 != 0) {
      return v5 - 1;
    }
    else {
      return 0x7FFFFFFF;
    }
  }
}

- (unsigned)timeLocationInMSOfGroupAtIndex:(unsigned int)a3 groupingProperty:(int)a4
{
  return 0;
}

- (unsigned)groupIndexAtTimeLocationInMS:(unsigned int)a3 groupingProperty:(int)a4
{
  return 0;
}

- (unsigned)durationInMSOfGroupAtIndex:(unsigned int)a3 groupingProperty:(int)a4
{
  return 0;
}

- (unsigned)groupIndexForChapterIndex:(unsigned int)a3 groupingProperty:(int)a4
{
  return 0;
}

- (unsigned)chapterIndexForGroupIndex:(unsigned int)a3 groupingProperty:(int)a4
{
  return 0;
}

- (unsigned)countOfGroupsForProperty:(int)a3
{
  return 0;
}

- (BOOL)hasDataForProperty:(int)a3
{
  return [(MLChapterTOC *)self countOfGroupsForProperty:*(void *)&a3] != 0;
}

- (unsigned)countOfChapters
{
  return 0;
}

@end