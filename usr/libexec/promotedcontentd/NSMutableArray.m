@interface NSMutableArray
+ (NSMutableArray)arrayWithCountedSet:(id)a3;
- (void)addRepeatingObject:(id)a3 count:(unint64_t)a4;
@end

@implementation NSMutableArray

+ (NSMutableArray)arrayWithCountedSet:(id)a3
{
  id v3 = a3;
  v4 = +[NSMutableArray array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v5 = [v3 objectEnumerator];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [v4 addRepeatingObject:*(void *)(*((void *)&v11 + 1) + 8 * i) count:objc_msgSend(v3, "countForObject:", *(void *)(*((void *)&v11 + 1) + 8 * i))];
      }
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return (NSMutableArray *)v4;
}

- (void)addRepeatingObject:(id)a3 count:(unint64_t)a4
{
  if (a4)
  {
    unint64_t v4 = a4;
    do
    {
      id v7 = [a3 copy];
      [(NSMutableArray *)self addObject:v7];

      --v4;
    }
    while (v4);
  }
}

@end