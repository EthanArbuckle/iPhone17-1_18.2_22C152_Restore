@interface THModelSearchIndexInflection
- ($41A25B052F3098E4BF49521C564DEBD4)occurrences;
- (BOOL)isEqual:(id)a3;
- (NSString)inflection;
- (THModelSearchIndexInflection)initWithInflection:(id)a3;
- (id)description;
- (int)minimumOccurrenceRank;
- (unint64_t)hash;
- (unint64_t)occurrenceCount;
- (void)addOccurrence:(id)a3 rank:(unint64_t)a4 paragraphIndex:(unint64_t)a5 pageNumber:(unint64_t)a6 displayPageNumber:(id)a7;
- (void)dealloc;
@end

@implementation THModelSearchIndexInflection

- (THModelSearchIndexInflection)initWithInflection:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)THModelSearchIndexInflection;
  v4 = [(THModelSearchIndexInflection *)&v7 init];
  if (v4)
  {
    v5 = (NSString *)[a3 copy];
    v4->mOccurrenceCount = 0;
    v4->mOccurrences = 0;
    v4->mInflection = v5;
  }
  return v4;
}

- (void)dealloc
{
  if (self->mOccurrenceCount)
  {
    uint64_t v3 = 0;
    unint64_t v4 = 0;
    do
    {
      v5 = &self->mOccurrences[v3];

      ++v4;
      ++v3;
    }
    while (v4 < self->mOccurrenceCount);
  }
  free(self->mOccurrences);
  v6.receiver = self;
  v6.super_class = (Class)THModelSearchIndexInflection;
  [(THModelSearchIndexInflection *)&v6 dealloc];
}

- (unint64_t)hash
{
  return [(NSString *)self->mInflection hash];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }
  else if (a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    BOOL v5 = -[NSString isEqualToString:](self->mInflection, "isEqualToString:", [a3 inflection]);
    if (v5)
    {
      id mOccurrenceCount = self->mOccurrenceCount;
      LOBYTE(v5) = mOccurrenceCount == [a3 occurrenceCount];
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (id)description
{
  unint64_t v3 = [(THModelSearchIndexInflection *)self occurrenceCount];
  unint64_t v4 = +[NSMutableArray arrayWithCapacity:v3];
  BOOL v5 = [(THModelSearchIndexInflection *)self occurrences];
  if (v3)
  {
    p_var3 = &v5->var3;
    unint64_t v7 = v3;
    do
    {
      uint64_t v8 = *((unsigned __int16 *)p_var3 - 4);
      uint64_t v9 = *((unsigned __int16 *)p_var3 - 3);
      uint64_t v10 = *((unsigned int *)p_var3 - 1);
      id v12 = *p_var3;
      id v11 = p_var3[1];
      p_var3 += 3;
      [(NSMutableArray *)v4 addObject:+[NSString stringWithFormat:@"{rid=%@,rk=%d,idx=%d,pgi=%lu,dp=%@}", v11, v8, v9, v10, v12]];
      --v7;
    }
    while (v7);
  }
  return +[NSString stringWithFormat:@"%@[%ld]%@", [(THModelSearchIndexInflection *)self inflection], v3, [(NSMutableArray *)v4 componentsJoinedByString:@","]];
}

- (void)addOccurrence:(id)a3 rank:(unint64_t)a4 paragraphIndex:(unint64_t)a5 pageNumber:(unint64_t)a6 displayPageNumber:(id)a7
{
  unsigned int v8 = a6;
  unsigned __int16 v9 = a5;
  unsigned __int16 v10 = a4;
  unint64_t mOccurrenceCount = self->mOccurrenceCount;
  mOccurrences = self->mOccurrences;
  self->unint64_t mOccurrenceCount = ++mOccurrenceCount;
  v15 = ($41A25B052F3098E4BF49521C564DEBD4 *)malloc_type_realloc(mOccurrences, 24 * mOccurrenceCount, 0x1080040D2F62047uLL);
  self->mOccurrences = v15;
  if (!v15)
  {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THModelSearchIndexInflection addOccurrence:rank:paragraphIndex:pageNumber:displayPageNumber:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THModelSearchIndexInflection.m") lineNumber:88 description:@"Couldn't allocate space for occurrences!"];
    v15 = self->mOccurrences;
  }
  v16 = &v15[self->mOccurrenceCount];
  v16[-1].var0 = v10;
  v16[-1].var1 = v9;
  v16[-1].var4 = [a3 copy];
  v16[-1].var2 = v8;
  v16[-1].var3 = [a7 copy];
}

- (int)minimumOccurrenceRank
{
  return -1;
}

- (NSString)inflection
{
  return self->mInflection;
}

- (unint64_t)occurrenceCount
{
  return self->mOccurrenceCount;
}

- ($41A25B052F3098E4BF49521C564DEBD4)occurrences
{
  return self->mOccurrences;
}

@end