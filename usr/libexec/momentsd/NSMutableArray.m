@interface NSMutableArray
- (id)dequeue;
- (void)shuffle;
- (void)shuffleWithSeed:(int)a3;
@end

@implementation NSMutableArray

- (void)shuffle
{
  id v3 = [(NSMutableArray *)self count];
  unint64_t v4 = (unint64_t)v3 - 2;
  if ((unint64_t)v3 >= 2)
  {
    uint32_t v5 = v3;
    uint64_t v6 = 0;
    unsigned int v7 = 0;
    do
    {
      [(NSMutableArray *)self exchangeObjectAtIndex:v6 withObjectAtIndex:arc4random_uniform(v5--) + v7];
      uint64_t v6 = ++v7;
    }
    while (v4 >= v7);
  }
}

- (void)shuffleWithSeed:(int)a3
{
  int v5 = [(NSMutableArray *)self count];
  if (v5 >= 2)
  {
    srand(a3);
    uint64_t v6 = (v5 - 1);
    do
      [(NSMutableArray *)self exchangeObjectAtIndex:v6-- withObjectAtIndex:rand() % v5--];
    while (v6);
  }
}

- (id)dequeue
{
  if ([(NSMutableArray *)self count])
  {
    id v3 = [(NSMutableArray *)self objectAtIndex:0];
    if (v3) {
      [(NSMutableArray *)self removeObjectAtIndex:0];
    }
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

@end