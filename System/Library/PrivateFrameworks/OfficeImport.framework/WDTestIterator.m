@interface WDTestIterator
- (BOOL)hasNext;
- (BOOL)test:(id)a3;
- (WDTestIterator)initWithIterator:(id)a3;
- (id)next;
@end

@implementation WDTestIterator

- (WDTestIterator)initWithIterator:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WDTestIterator;
  v6 = [(WDTestIterator *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->mIterator, a3);
    id v8 = [(WDTestIterator *)v7 next];
  }

  return v7;
}

- (BOOL)test:(id)a3
{
  return 0;
}

- (BOOL)hasNext
{
  return self->mNext != 0;
}

- (id)next
{
  id v3 = self->mNext;
  id mNext = self->mNext;
  self->id mNext = 0;

  while ([(WDIterator *)self->mIterator hasNext])
  {
    id v5 = [(WDIterator *)self->mIterator next];
    if ([(WDTestIterator *)self test:v5])
    {
      id v6 = self->mNext;
      self->id mNext = v5;

      break;
    }
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->mNext, 0);
  objc_storeStrong((id *)&self->mIterator, 0);
}

@end