@interface NSMutableSet
- (void)mb_minusPathSet:(id)a3;
@end

@implementation NSMutableSet

- (void)mb_minusPathSet:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableSet set];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v6 = self;
  id v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v11, "mb_pathComponentExistsInSet:", v4, (void)v12) & 1) == 0) {
          [v5 addObject:v11];
        }
      }
      id v8 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  [(NSMutableSet *)v6 setSet:v5];
}

@end