@interface EDSortedCollection
- (unint64_t)addObject:(id)a3;
- (unint64_t)addObject:(id)a3 overrideDuplicate:(BOOL)a4;
@end

@implementation EDSortedCollection

- (unint64_t)addObject:(id)a3
{
  return [(EDSortedCollection *)self addObject:a3 overrideDuplicate:0];
}

- (unint64_t)addObject:(id)a3 overrideDuplicate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 key];
  unint64_t v8 = [(EDCollection *)self count];
  if (v8)
  {
    while (1)
    {
      unint64_t v9 = v8 - 1;
      v10 = [(EDCollection *)self objectAtIndex:v8 - 1];
      v11 = v10;
      if (v10)
      {
        uint64_t v12 = [v10 key];
        if (v7 >= v12) {
          break;
        }
      }

      --v8;
      if (!v9) {
        goto LABEL_5;
      }
    }
    v16.receiver = self;
    v16.super_class = (Class)EDSortedCollection;
    [(EDKeyedCollection *)&v16 insertObject:v6 atIndex:v8];
    if (v4 && v7 == v12)
    {
      v15.receiver = self;
      v15.super_class = (Class)EDSortedCollection;
      [(EDKeyedCollection *)&v15 removeObjectAtIndex:v8 - 1];
    }
  }
  else
  {
LABEL_5:
    v14.receiver = self;
    v14.super_class = (Class)EDSortedCollection;
    [(EDKeyedCollection *)&v14 insertObject:v6 atIndex:0];
    unint64_t v8 = 0;
  }

  return v8;
}

@end