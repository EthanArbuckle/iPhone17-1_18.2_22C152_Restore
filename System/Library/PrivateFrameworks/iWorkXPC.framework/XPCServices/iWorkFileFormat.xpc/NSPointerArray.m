@interface NSPointerArray
- (BOOL)tsu_hasNonNullPointers;
- (id)tsu_description;
- (unint64_t)tsu_indexOfPointer:(void *)a3;
- (void)tsu_addPointersFromPointerArray:(id)a3;
- (void)tsu_enumerateNonNullObjectUsingBlock:(id)a3;
- (void)tsu_enumerateNonNullPointersUsingBlock:(id)a3;
- (void)tsu_insertRange:(_NSRange)a3;
- (void)tsu_removeRange:(_NSRange)a3;
@end

@implementation NSPointerArray

- (BOOL)tsu_hasNonNullPointers
{
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self;
  id v3 = [(NSPointerArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (*(void *)(*((void *)&v7 + 1) + 8 * i))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      id v3 = [(NSPointerArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (void)tsu_enumerateNonNullPointersUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, void *, uint64_t, unsigned char *))a3;
  char v9 = 0;
  NSUInteger v5 = [(NSPointerArray *)self count];
  if (v5)
  {
    NSUInteger v6 = v5;
    unint64_t v7 = 1;
    do
    {
      long long v8 = [(NSPointerArray *)self pointerAtIndex:v7 - 1];
      if (v8) {
        v4[2](v4, v8, v7 - 1, &v9);
      }
      if (v7 >= v6) {
        break;
      }
      ++v7;
    }
    while (!v9);
  }
}

- (void)tsu_enumerateNonNullObjectUsingBlock:(id)a3
{
  uint64_t v4 = (void (**)(id, uint64_t, uint64_t, char *))a3;
  char v16 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  NSUInteger v5 = self;
  id v6 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v13;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v13 != v9) {
        objc_enumerationMutation(v5);
      }
      uint64_t v11 = *(void *)(*((void *)&v12 + 1) + 8 * v10);
      if (v11)
      {
        v4[2](v4, v11, v8 + v10, &v16);
        if (v16) {
          break;
        }
      }
      if (v7 == (id)++v10)
      {
        id v7 = [(NSPointerArray *)v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
        v8 += v10;
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (void)tsu_insertRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  int64_t location = a3.location;
  if (a3.location >= [(NSPointerArray *)self count])
  {
    [(NSPointerArray *)self setCount:location + length];
  }
  else
  {
    int64_t v6 = [(NSPointerArray *)self count];
    [(NSPointerArray *)self setCount:(char *)[(NSPointerArray *)self count] + length];
    for (int64_t i = v6 - 1; i >= location; --i)
      [(NSPointerArray *)self replacePointerAtIndex:length + i withPointer:[(NSPointerArray *)self pointerAtIndex:i]];
    if ((uint64_t)(location + length) >= v6) {
      int64_t v8 = v6;
    }
    else {
      int64_t v8 = location + length;
    }
    if (location < v8)
    {
      do
        [(NSPointerArray *)self replacePointerAtIndex:location++ withPointer:0];
      while (v8 != location);
    }
  }
}

- (void)tsu_removeRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  int64_t location = (char *)a3.location;
  if (a3.location < [(NSPointerArray *)self count])
  {
    if (&location[length] < (char *)[(NSPointerArray *)self count])
    {
      NSUInteger v6 = [(NSPointerArray *)self count];
      if ((unint64_t)&location[length] < v6)
      {
        NSUInteger v7 = v6;
        do
        {
          [(NSPointerArray *)self replacePointerAtIndex:location withPointer:[(NSPointerArray *)self pointerAtIndex:&location[length]]];
          ++location;
        }
        while ((unint64_t)&location[length] < v7);
      }
      int64_t location = (char *)[(NSPointerArray *)self count] - length;
    }
    [(NSPointerArray *)self setCount:location];
  }
}

- (unint64_t)tsu_indexOfPointer:(void *)a3
{
  uint64_t v6 = 0;
  NSUInteger v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10007827C;
  v5[3] = &unk_1001CBD50;
  v5[4] = &v6;
  v5[5] = a3;
  [(NSPointerArray *)self tsu_enumerateNonNullPointersUsingBlock:v5];
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)tsu_addPointersFromPointerArray:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(NSPointerArray *)self count];
  -[NSPointerArray setCount:](self, "setCount:", (char *)[v4 count] + -[NSPointerArray count](self, "count"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100078360;
  v6[3] = &unk_1001CBD78;
  v6[4] = self;
  v6[5] = v5;
  objc_msgSend(v4, "tsu_enumerateNonNullPointersUsingBlock:", v6);
}

- (id)tsu_description
{
  unint64_t v3 = +[NSString stringWithFormat:@"NSPointerArray %p Count:%lu", self, [(NSPointerArray *)self count]];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self;
  id v5 = [(NSPointerArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      uint64_t v9 = v3;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = +[NSString stringWithFormat:@"\n    %@", *(void *)(*((void *)&v12 + 1) + 8 * (void)v8)];
        unint64_t v3 = [v9 stringByAppendingString:v10];

        uint64_t v8 = (char *)v8 + 1;
        uint64_t v9 = v3;
      }
      while (v6 != v8);
      id v6 = [(NSPointerArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

@end