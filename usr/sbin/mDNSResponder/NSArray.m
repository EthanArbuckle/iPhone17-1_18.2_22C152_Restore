@interface NSArray
- (id)describeQHashes;
- (id)filterObjectsUsingBlock:(id)a3;
@end

@implementation NSArray

- (id)describeQHashes
{
  if ([(NSArray *)self count])
  {
    v3 = +[NSMutableString string];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    v4 = self;
    id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = 0;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v4);
          }
          [v3 appendFormat:@"%x", [*(id *)(*((void *)&v12 + 1) + 8 * i) unsignedIntValue]];
          if ((char *)i + v7 + 1 < (char *)[(NSArray *)v4 count]) {
            [v3 appendString:@", "];
          }
        }
        v7 += (uint64_t)v6;
        id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }

    id v10 = v3;
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (id)filterObjectsUsingBlock:(id)a3
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __49__NSArray_ua_extension__filterObjectsUsingBlock___block_invoke;
  v8[3] = &unk_100149068;
  id v9 = a3;
  id v4 = v9;
  id v5 = [(NSArray *)self indexesOfObjectsPassingTest:v8];
  id v6 = [(NSArray *)self objectsAtIndexes:v5];

  return v6;
}

uint64_t __49__NSArray_ua_extension__filterObjectsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end