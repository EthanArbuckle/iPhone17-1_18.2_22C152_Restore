@interface NSSet(TRAdditions)
- (id)setByIntersectingSet:()TRAdditions;
- (id)setByMinusingSet:()TRAdditions;
- (id)setByRemovingObject:()TRAdditions;
@end

@implementation NSSet(TRAdditions)

- (id)setByIntersectingSet:()TRAdditions
{
  v4 = (void *)MEMORY[0x263EFF9C0];
  id v5 = a3;
  v6 = [v4 setWithSet:a1];
  [v6 intersectSet:v5];

  v7 = [MEMORY[0x263EFFA08] setWithSet:v6];

  return v7;
}

- (id)setByMinusingSet:()TRAdditions
{
  v4 = (void *)MEMORY[0x263EFF9C0];
  id v5 = a3;
  v6 = [v4 setWithSet:a1];
  [v6 minusSet:v5];

  v7 = [MEMORY[0x263EFFA08] setWithSet:v6];

  return v7;
}

- (id)setByRemovingObject:()TRAdditions
{
  v4 = (void *)MEMORY[0x263EFF9C0];
  id v5 = a3;
  v6 = [v4 setWithSet:a1];
  [v6 removeObject:v5];

  v7 = [MEMORY[0x263EFFA08] setWithSet:v6];

  return v7;
}

@end