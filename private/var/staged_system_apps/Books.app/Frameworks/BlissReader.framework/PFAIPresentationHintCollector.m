@interface PFAIPresentationHintCollector
- (PFAIPresentationHintCollector)init;
- (id)handleExtraIndexForTrailingParagraph:(id)a3 textStorage:(id)a4;
- (id)lineBreaksForIdref:(id)a3;
- (id)lineBreaksForIdref:(id)a3 fromIndexSet:(id)a4;
- (id)repairedIndexesForHintCollection:(id)a3 textStorage:(id)a4;
- (void)addHintCollection:(id)a3 idref:(id)a4;
- (void)addLineBreakHint:(unint64_t)a3 textStorage:(id)a4;
- (void)addStartHint:(unint64_t)a3 withIdref:(id)a4 textStorage:(id)a5;
- (void)dealloc;
- (void)processHintCollectionsWithStorage:(id)a3;
- (void)updateLastLineBreakHintWithIndex:(unint64_t)a3 textStorage:(id)a4;
@end

@implementation PFAIPresentationHintCollector

- (PFAIPresentationHintCollector)init
{
  v4.receiver = self;
  v4.super_class = (Class)PFAIPresentationHintCollector;
  v2 = [(PFAIPresentationHintCollector *)&v4 init];
  if (v2)
  {
    v2->mIdrefStart = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v2->mLineBreakIndexes = (NSMutableIndexSet *)objc_alloc_init((Class)NSMutableIndexSet);
    v2->mStartIndexes = (NSMutableIndexSet *)objc_alloc_init((Class)NSMutableIndexSet);
    v2->mLastLineBreakHint = 0x7FFFFFFFFFFFFFFFLL;
    v2->mHintCollections = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v2->mHintCollectionIdrefs = (TSUPointerKeyDictionary *)objc_alloc_init((Class)TSUPointerKeyDictionary);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFAIPresentationHintCollector;
  [(PFAIPresentationHintCollector *)&v3 dealloc];
}

- (void)addStartHint:(unint64_t)a3 withIdref:(id)a4 textStorage:(id)a5
{
  self->mLastStartIdref = 0;
  if (a4)
  {
    self->mLastStartHintAdded = [(NSMutableIndexSet *)self->mStartIndexes containsIndex:a3] ^ 1;
    if (([(NSMutableIndexSet *)self->mLineBreakIndexes containsIndex:a3] & 1) != 0
      || (unsigned __int8 v9 = [(NSMutableIndexSet *)self->mStartIndexes containsIndex:a3], !a3)
      || (v9 & 1) != 0
      || ([a5 characterAtIndex:a3 - 1], (IsParagraphBreakingCharacter() & 1) == 0))
    {
      self->mLastStartHint = a3;
      self->mLastStartIdref = (NSString *)a4;
    }
    [(NSMutableIndexSet *)self->mStartIndexes addIndex:a3];
    mIdrefStart = self->mIdrefStart;
    v11 = +[NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)mIdrefStart setObject:v11 forKey:a4];
  }
}

- (void)addLineBreakHint:(unint64_t)a3 textStorage:(id)a4
{
  self->mLastLineBreakHintAdded = -[NSMutableIndexSet containsIndex:](self->mLineBreakIndexes, "containsIndex:") ^ 1;
  unsigned __int8 v7 = [(NSMutableIndexSet *)self->mLineBreakIndexes containsIndex:a3];
  if (!a3
    || (v7 & 1) != 0
    || ([a4 characterAtIndex:a3 - 1], (IsParagraphBreakingCharacter() & 1) == 0))
  {
    self->mLastLineBreakHint = a3;
  }
  [(NSMutableIndexSet *)self->mLineBreakIndexes addIndex:a3];

  self->mLastStartIdref = 0;
  self->mLastStartHint = 0x7FFFFFFFFFFFFFFFLL;
}

- (id)lineBreaksForIdref:(id)a3 fromIndexSet:(id)a4
{
  id v6 = [(NSMutableDictionary *)self->mIdrefStart objectForKey:a3];
  if (!v6) {
    return 0;
  }
  id v7 = [v6 unsignedIntegerValue];
  id v8 = objc_alloc_init((Class)NSMutableIndexSet);
  for (id i = [(NSMutableIndexSet *)self->mStartIndexes indexGreaterThanIndex:v7];
        v7 < i;
        id v7 = [a4 indexGreaterThanIndex:v7])
  {
    [v8 addIndex:v7];
  }
  if (i != (id)0x7FFFFFFFFFFFFFFFLL) {
    [v8 addIndex:i];
  }
  return v8;
}

- (id)lineBreaksForIdref:(id)a3
{
  return [(PFAIPresentationHintCollector *)self lineBreaksForIdref:a3 fromIndexSet:self->mLineBreakIndexes];
}

- (void)updateLastLineBreakHintWithIndex:(unint64_t)a3 textStorage:(id)a4
{
  if (a3)
  {
    [a4 characterAtIndex:a3 - 1];
    if (IsParagraphBreakingCharacter())
    {
      unint64_t mLastLineBreakHint = self->mLastLineBreakHint;
      if (mLastLineBreakHint != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (mLastLineBreakHint + 1 == a3)
        {
          if (self->mLastLineBreakHintAdded) {
            -[NSMutableIndexSet removeIndex:](self->mLineBreakIndexes, "removeIndex:");
          }
          [(NSMutableIndexSet *)self->mLineBreakIndexes addIndex:a3];
        }
        self->unint64_t mLastLineBreakHint = 0x7FFFFFFFFFFFFFFFLL;
      }
      unint64_t mLastStartHint = self->mLastStartHint;
      if (mLastStartHint != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (mLastStartHint + 1 == a3)
        {
          if (self->mLastStartHintAdded) {
            -[NSMutableIndexSet removeIndex:](self->mStartIndexes, "removeIndex:");
          }
          [(NSMutableIndexSet *)self->mStartIndexes addIndex:a3];
          [(NSMutableDictionary *)self->mIdrefStart setObject:+[NSNumber numberWithUnsignedInteger:a3] forKey:self->mLastStartIdref];
        }
        self->unint64_t mLastStartHint = 0x7FFFFFFFFFFFFFFFLL;

        self->mLastStartIdref = 0;
      }
    }
  }
}

- (void)addHintCollection:(id)a3 idref:(id)a4
{
  if (a3 && a4)
  {
    -[NSMutableArray addObject:](self->mHintCollections, "addObject:");
    mHintCollectionIdrefs = self->mHintCollectionIdrefs;
    [(TSUPointerKeyDictionary *)mHintCollectionIdrefs setObject:a4 forUncopiedKey:a3];
  }
}

- (id)handleExtraIndexForTrailingParagraph:(id)a3 textStorage:(id)a4
{
  id v6 = (char *)[a4 length];
  id v7 = v6 - 2;
  if ((unint64_t)v6 >= 2)
  {
    id v8 = v6;
    if ([a3 containsIndex:v6])
    {
      unsigned __int8 v9 = v8 - 1;
      unsigned int v10 = [a4 characterAtIndex:v9];
      unsigned int v11 = [a4 characterAtIndex:v7];
      if (v11 <= 0xC && ((1 << v11) & 0x1420) != 0 && v10 == 160)
      {
        [a4 deleteRange:v9 undoTransaction:1, 0];
        id v12 = [objc_alloc((Class)NSMutableIndexSet) initWithIndexSet:a3];
        [v12 removeIndex:[a3 lastIndex]];
        return v12;
      }
    }
  }
  return a3;
}

- (id)repairedIndexesForHintCollection:(id)a3 textStorage:(id)a4
{
  id v7 = -[PFAIPresentationHintCollector lineBreaksForIdref:fromIndexSet:](self, "lineBreaksForIdref:fromIndexSet:", -[TSUPointerKeyDictionary objectForKey:](self->mHintCollectionIdrefs, "objectForKey:"), self->mLineBreakIndexes);
  id v8 = (char *)[a3 hintsCount] + 1;
  if ([v7 count] == v8) {
    return v7;
  }

  return [(PFAIPresentationHintCollector *)self handleExtraIndexForTrailingParagraph:v7 textStorage:a4];
}

- (void)processHintCollectionsWithStorage:(id)a3
{
  if (a3)
  {
    -[NSMutableIndexSet addIndex:](self->mLineBreakIndexes, "addIndex:", [a3 length]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    mHintCollections = self->mHintCollections;
    id v6 = [(NSMutableArray *)mHintCollections countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (id i = 0; i != v7; id i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(mHintCollections);
          }
          unsigned int v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          id v11 = [(PFAIPresentationHintCollector *)self repairedIndexesForHintCollection:v10 textStorage:a3];
          if (v11) {
            [v10 applePubUpdateRangesWithLineBreakIndexes:v11 textStorage:a3];
          }
        }
        id v7 = [(NSMutableArray *)mHintCollections countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

@end