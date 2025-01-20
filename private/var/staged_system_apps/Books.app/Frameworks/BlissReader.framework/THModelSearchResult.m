@interface THModelSearchResult
+ (unint64_t)stringCompareOptions;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToResult:(id)a3;
- (BOOL)isMediaResult;
- (BOOL)isNotesResult;
- (BOOL)isTextResult;
- (NSString)cfi;
- (NSString)context;
- (NSString)displayPageNumber;
- (NSString)term;
- (NSString)title;
- (THAnnotation)annotation;
- (THModelSearchResult)initWithTerm:(id)a3 annotation:(id)a4 pageNumber:(unint64_t)a5 displayPageNumber:(id)a6 occurrenceIndex:(unint64_t)a7 context:(id)a8;
- (THModelSearchResult)initWithTerm:(id)a3 rank:(int)a4 cfi:(id)a5 pageNumber:(unint64_t)a6 displayPageNumber:(id)a7 occurrenceIndex:(unint64_t)a8 context:(id)a9;
- (_NSRange)contextRangeForResult;
- (_NSRange)contextRangeForResultWithTrimmedContext:(id)a3;
- (id)description;
- (int)rank;
- (unint64_t)hash;
- (unint64_t)occurenceCount;
- (unint64_t)occurrenceIndex;
- (unint64_t)pageNumber;
- (void)dealloc;
- (void)setDisplayPageNumber:(id)a3;
- (void)setOccurenceCount:(unint64_t)a3;
- (void)setPageNumber:(unint64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation THModelSearchResult

+ (unint64_t)stringCompareOptions
{
  return 1;
}

- (THModelSearchResult)initWithTerm:(id)a3 rank:(int)a4 cfi:(id)a5 pageNumber:(unint64_t)a6 displayPageNumber:(id)a7 occurrenceIndex:(unint64_t)a8 context:(id)a9
{
  v17.receiver = self;
  v17.super_class = (Class)THModelSearchResult;
  v15 = [(THModelSearchResult *)&v17 init];
  if (v15)
  {
    v15->mTerm = (NSString *)[a3 copy];
    v15->mRank = a4;
    v15->mCFI = (NSString *)[a5 copy];
    v15->mPageNumber = a6;
    v15->mDisplayPageNumber = (NSString *)[a7 copy];
    v15->mOccurrenceIndex = a8;
    v15->mContext = (NSString *)[a9 copy];
    v15->mOccurenceCount = 1;
  }
  return v15;
}

- (THModelSearchResult)initWithTerm:(id)a3 annotation:(id)a4 pageNumber:(unint64_t)a5 displayPageNumber:(id)a6 occurrenceIndex:(unint64_t)a7 context:(id)a8
{
  v16.receiver = self;
  v16.super_class = (Class)THModelSearchResult;
  v14 = [(THModelSearchResult *)&v16 init];
  if (v14)
  {
    v14->mTerm = (NSString *)[a3 copy];
    v14->mAnnotation = (THAnnotation *)a4;
    v14->mRank = 100;
    v14->mPageNumber = a5;
    v14->mDisplayPageNumber = (NSString *)[a6 copy];
    v14->mOccurrenceIndex = a7;
    v14->mContext = (NSString *)[a8 copy];
    v14->mOccurenceCount = 1;
  }
  return v14;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)THModelSearchResult;
  [(THModelSearchResult *)&v3 dealloc];
}

- (unint64_t)hash
{
  return ([(NSString *)self->mTerm hash] << 16) | ((unint64_t)LODWORD(self->mPageNumber) << 8) | LOBYTE(self->mOccurrenceIndex);
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (!a3) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return [(THModelSearchResult *)self isEqualToResult:a3];
}

- (BOOL)isEqualToResult:(id)a3
{
  int mRank = self->mRank;
  if (mRank != [a3 rank]
    || (id mPageNumber = self->mPageNumber, mPageNumber != [a3 pageNumber])
    || (id mOccurrenceIndex = self->mOccurrenceIndex, mOccurrenceIndex != [a3 occurrenceIndex]))
  {
    LOBYTE(v8) = 0;
    return v8;
  }
  unsigned int v8 = -[NSString isEqualToString:](self->mTerm, "isEqualToString:", [a3 term]);
  if (v8)
  {
    unsigned int v8 = -[NSString isEqualToString:](self->mCFI, "isEqualToString:", [a3 cfi]);
    if (v8)
    {
      mAnnotation = self->mAnnotation;
      if (!mAnnotation)
      {
        if (![a3 annotation])
        {
LABEL_10:
          LOBYTE(v8) = 1;
          return v8;
        }
        mAnnotation = self->mAnnotation;
      }
      unsigned int v8 = -[THAnnotation isEqual:](mAnnotation, "isEqual:", [a3 annotation]);
      if (v8) {
        goto LABEL_10;
      }
    }
  }
  return v8;
}

- (BOOL)isTextResult
{
  int mRank = self->mRank;
  unsigned int v3 = mRank - 6;
  BOOL v4 = mRank != 100;
  return v3 >= 2 && v4;
}

- (BOOL)isMediaResult
{
  return (self->mRank & 0xFFFFFFFE) == 6;
}

- (BOOL)isNotesResult
{
  return self->mRank == 100;
}

- (_NSRange)contextRangeForResult
{
  id v2 = [(THModelSearchResult *)self contextRangeForResultWithTrimmedContext:self->mContext];
  result.length = v3;
  result.location = (NSUInteger)v2;
  return result;
}

- (_NSRange)contextRangeForResultWithTrimmedContext:(id)a3
{
  if (self->mOccurrenceIndex)
  {
    v5 = 0;
    NSUInteger v6 = 0;
    uint64_t v7 = 0;
    while (1)
    {
      v5 = objc_msgSend(a3, "rangeOfString:options:range:", self->mTerm, objc_msgSend((id)objc_opt_class(), "stringCompareOptions"), &v5[v6], (unsigned char *)objc_msgSend(a3, "length") - &v5[v6]);
      if (v5 == (unsigned char *)0x7FFFFFFFFFFFFFFFLL || v6 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      if (++v7 >= self->mOccurrenceIndex) {
        goto LABEL_10;
      }
    }
  }
  NSUInteger v6 = 0;
  v5 = 0;
LABEL_10:
  result.length = v6;
  result.location = (NSUInteger)v5;
  return result;
}

- (id)description
{
  return +[NSString stringWithFormat:@"{[%p] term='%@' rk=%d pgIdx=%lu dispPgNum=%@ cfi=%@\n%lu-th in '%@'}", self, [(THModelSearchResult *)self term], [(THModelSearchResult *)self rank], [(THModelSearchResult *)self pageNumber], [(THModelSearchResult *)self displayPageNumber], [(THModelSearchResult *)self cfi], [(THModelSearchResult *)self occurrenceIndex], [(THModelSearchResult *)self context]];
}

- (NSString)term
{
  return self->mTerm;
}

- (int)rank
{
  return self->mRank;
}

- (NSString)cfi
{
  return self->mCFI;
}

- (NSString)title
{
  return self->mTitle;
}

- (void)setTitle:(id)a3
{
}

- (unint64_t)pageNumber
{
  return self->mPageNumber;
}

- (void)setPageNumber:(unint64_t)a3
{
  self->id mPageNumber = a3;
}

- (NSString)displayPageNumber
{
  return self->mDisplayPageNumber;
}

- (void)setDisplayPageNumber:(id)a3
{
}

- (unint64_t)occurrenceIndex
{
  return self->mOccurrenceIndex;
}

- (NSString)context
{
  return self->mContext;
}

- (unint64_t)occurenceCount
{
  return self->mOccurenceCount;
}

- (void)setOccurenceCount:(unint64_t)a3
{
  self->mOccurenceCount = a3;
}

- (THAnnotation)annotation
{
  return self->mAnnotation;
}

@end