@interface WDArrayIterator
- (BOOL)hasNext;
- (WDArrayIterator)initWithArray:(id)a3;
- (id)next;
@end

@implementation WDArrayIterator

- (WDArrayIterator)initWithArray:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WDArrayIterator;
  v6 = [(WDArrayIterator *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->mArray, a3);
    v7->mNextIndex = 0;
  }

  return v7;
}

- (BOOL)hasNext
{
  unint64_t mNextIndex = self->mNextIndex;
  return [(NSArray *)self->mArray count] > mNextIndex;
}

- (id)next
{
  unint64_t mNextIndex = self->mNextIndex;
  if ([(NSArray *)self->mArray count] <= mNextIndex)
  {
    v4 = 0;
  }
  else
  {
    v4 = [(NSArray *)self->mArray objectAtIndex:self->mNextIndex];
    ++self->mNextIndex;
  }
  return v4;
}

- (void).cxx_destruct
{
}

@end