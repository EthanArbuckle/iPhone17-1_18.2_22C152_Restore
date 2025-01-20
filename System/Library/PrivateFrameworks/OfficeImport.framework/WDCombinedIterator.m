@interface WDCombinedIterator
- (BOOL)hasNext;
- (WDCombinedIterator)initWithParentIterator:(id)a3;
- (WDIterator)childIterator;
- (id)childIteratorFrom:(id)a3;
- (id)newChildIteratorFrom:(id)a3;
- (id)next;
- (void)incrementChildIterator;
- (void)setChildIterator:(id)a3;
@end

@implementation WDCombinedIterator

- (WDCombinedIterator)initWithParentIterator:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WDCombinedIterator;
  v6 = [(WDCombinedIterator *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->mParentIterator, a3);
    [(WDCombinedIterator *)v7 incrementChildIterator];
  }

  return v7;
}

- (id)childIteratorFrom:(id)a3
{
  return 0;
}

- (id)newChildIteratorFrom:(id)a3
{
  return 0;
}

- (BOOL)hasNext
{
  return self->mChildIterator != 0;
}

- (id)next
{
  mChildIterator = self->mChildIterator;
  if (mChildIterator)
  {
    v4 = [(WDIterator *)mChildIterator next];
    if (![(WDIterator *)self->mChildIterator hasNext]) {
      [(WDCombinedIterator *)self incrementChildIterator];
    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (WDIterator)childIterator
{
  return self->mChildIterator;
}

- (void)setChildIterator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mChildIterator, 0);
  objc_storeStrong((id *)&self->mParentIterator, 0);
}

- (void)incrementChildIterator
{
  do
  {
    v3 = [(WDIterator *)self->mParentIterator next];
    if (v3)
    {
      id v4 = [(WDCombinedIterator *)self newChildIteratorFrom:v3];
      [(WDCombinedIterator *)self setChildIterator:v4];
    }
    else
    {
      [(WDCombinedIterator *)self setChildIterator:0];
    }

    mChildIterator = self->mChildIterator;
  }
  while (mChildIterator && ![(WDIterator *)mChildIterator hasNext]);
}

@end