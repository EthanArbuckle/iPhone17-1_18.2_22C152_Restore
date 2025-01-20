@interface EDMergedCellCollection
- (id)referenceContainingRow:(int)a3 column:(int)a4;
- (unint64_t)addObject:(id)a3;
@end

@implementation EDMergedCellCollection

- (id)referenceContainingRow:(int)a3 column:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  unint64_t v7 = [(EDCollection *)self count];
  if (v7)
  {
    unint64_t v8 = v7;
    uint64_t v9 = 0;
    while (1)
    {
      v10 = [(EDCollection *)self objectAtIndex:v9];
      if ([v10 containsRow:v5 column:v4]) {
        break;
      }

      if (v8 == ++v9) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    v10 = 0;
  }
  return v10;
}

- (unint64_t)addObject:(id)a3
{
  id v4 = a3;
  if ([v4 isValidAreaReference])
  {
    v7.receiver = self;
    v7.super_class = (Class)EDMergedCellCollection;
    unint64_t v5 = [(EDCollection *)&v7 addObject:v4];
  }
  else
  {
    unint64_t v5 = -1;
  }

  return v5;
}

@end