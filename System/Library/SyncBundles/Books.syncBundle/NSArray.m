@interface NSArray
- (id)arrayOfDictionariesSortedByKey:(id)a3;
- (id)arrayOfObjectsContainingMatchingKey:(id)a3 matchingStrings:(id)a4;
- (id)arrayRemovingMatchingStrings:(id)a3;
- (id)arrayRemovingNonStrings;
- (id)arrayRemovingObjectsByKey:(id)a3 matchingStrings:(id)a4;
- (id)presortedArrayOfObjectsContainingMatchingKey:(id)a3 matchingPresortedStrings:(id)a4;
- (id)presortedArrayRemovingMatchingPresortedStrings:(id)a3;
- (id)presortedArrayRemovingObjectsByKey:(id)a3 matchingPresortedStrings:(id)a4;
@end

@implementation NSArray

- (id)arrayRemovingNonStrings
{
  id v3 = +[NSMutableArray array];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(NSArray *)self countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(self);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * (void)v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v3 addObject:v8];
        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSArray *)self countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  return v3;
}

- (id)arrayOfObjectsContainingMatchingKey:(id)a3 matchingStrings:(id)a4
{
  id v6 = -[NSArray arrayOfDictionariesSortedByKey:](self, "arrayOfDictionariesSortedByKey:");
  id v7 = [a4 sortedArrayUsingSelector:"compare:"];

  return [v6 presortedArrayOfObjectsContainingMatchingKey:a3 matchingPresortedStrings:v7];
}

- (id)arrayRemovingObjectsByKey:(id)a3 matchingStrings:(id)a4
{
  id v6 = -[NSArray arrayOfDictionariesSortedByKey:](self, "arrayOfDictionariesSortedByKey:");
  id v7 = [a4 sortedArrayUsingSelector:"compare:"];

  return [v6 presortedArrayRemovingObjectsByKey:a3 matchingPresortedStrings:v7];
}

- (id)arrayRemovingMatchingStrings:(id)a3
{
  id v4 = [(NSArray *)self sortedArrayUsingSelector:"compare:"];
  id v5 = [a3 sortedArrayUsingSelector:"compare:"];

  return [(NSArray *)v4 presortedArrayRemovingMatchingPresortedStrings:v5];
}

- (id)arrayOfDictionariesSortedByKey:(id)a3
{
  return [(NSArray *)self sortedArrayUsingFunction:_compareDictionaryValues context:a3];
}

- (id)presortedArrayRemovingMatchingPresortedStrings:(id)a3
{
  if (![a3 count] || !-[NSArray count](self, "count")) {
    return self;
  }
  SEL v19 = a2;
  id v6 = [a3 count];
  id v7 = [a3 objectAtIndex:0];
  id v20 = +[NSMutableArray array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v8 = self;
  id v9 = [(NSArray *)self countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v22;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v8);
        }
        uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        if (v7)
        {
          while (1)
          {
            v16 = (char *)[v7 compare:v15];
            if (v16 != (char *)-1) {
              break;
            }
            if (++v12 >= (unint64_t)v6)
            {
              id v7 = 0;
              goto LABEL_17;
            }
            id v7 = [a3 objectAtIndex:v12];
          }
          if (v16 == (unsigned char *)&dword_0 + 1) {
            goto LABEL_17;
          }
          if (!v16) {
            ++v11;
          }
        }
        else
        {
LABEL_17:
          [v20 addObject:v15];
        }
      }
      id v10 = [(NSArray *)v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }
  else
  {
    uint64_t v11 = 0;
  }
  v17 = (char *)[v20 count] + v11;
  if (v17 != (char *)[(NSArray *)v8 count]) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", v19, v8, @"NSArray+IMAdditions.m", 163, @"Unexpected Counts: Unfiltered: %lu; Filter: %lu; Filtered: %lu; Filter Hit: %lu",
  }
      [(NSArray *)v8 count],
      [a3 count],
      [v20 count],
      v11);
  return v20;
}

- (id)presortedArrayOfObjectsContainingMatchingKey:(id)a3 matchingPresortedStrings:(id)a4
{
  if (![a4 count] || !-[NSArray count](self, "count") || !objc_msgSend(a3, "length")) {
    return 0;
  }
  SEL v23 = a2;
  id v7 = [a4 count];
  id v8 = [a4 objectAtIndex:0];
  id v24 = +[NSMutableArray array];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v9 = [(NSArray *)self countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v28;
    obj = self;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        uint64_t v16 = objc_opt_class();
        v17 = (void *)BCDynamicCast(v16, v15);
        id v18 = [v17 objectForKey:a3];
        if ([v18 length]) {
          BOOL v19 = v8 == 0;
        }
        else {
          BOOL v19 = 1;
        }
        if (v19)
        {
LABEL_19:
          ++v11;
        }
        else
        {
          while (1)
          {
            id v20 = [v8 compare:v18];
            if (v20 != (id)-1) {
              break;
            }
            if (++v12 >= (unint64_t)v7)
            {
              id v8 = 0;
              goto LABEL_19;
            }
            id v8 = [a4 objectAtIndex:v12];
          }
          if (v20) {
            goto LABEL_19;
          }
          [v24 addObject:v17];
        }
      }
      self = obj;
      id v10 = [(NSArray *)obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v10);
  }
  else
  {
    uint64_t v11 = 0;
  }
  long long v21 = (char *)[v24 count] + v11;
  if (v21 != (char *)[(NSArray *)self count]) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", v23, self, @"NSArray+IMAdditions.m", 242, @"Unexpected Counts: Unfiltered: %lu; Filter: %lu; Filtered: %lu; Filter Hit: %lu",
  }
      [(NSArray *)self count],
      [a4 count],
      [v24 count],
      v11);
  return v24;
}

- (id)presortedArrayRemovingObjectsByKey:(id)a3 matchingPresortedStrings:(id)a4
{
  if (![a4 count] || !-[NSArray count](self, "count") || !objc_msgSend(a3, "length")) {
    return self;
  }
  SEL v24 = a2;
  id v8 = [a4 count];
  id v9 = [a4 objectAtIndex:0];
  id v27 = +[NSMutableArray array];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v10 = [(NSArray *)self countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v25 = 0;
    obj = self;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v29;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v16 = objc_opt_class();
        v17 = (void *)BCDynamicCast(v16, v15);
        id v18 = [v17 objectForKey:a3];
        if ([v18 length]) {
          BOOL v19 = v9 == 0;
        }
        else {
          BOOL v19 = 1;
        }
        if (v19)
        {
LABEL_21:
          [v27 addObject:v17];
        }
        else
        {
          while (1)
          {
            id v20 = (char *)[v9 compare:v18];
            if (v20 != (char *)-1) {
              break;
            }
            if (++v12 >= (unint64_t)v8)
            {
              id v9 = 0;
              goto LABEL_21;
            }
            id v9 = [a4 objectAtIndex:v12];
          }
          if (v20 == (unsigned char *)&dword_0 + 1) {
            goto LABEL_21;
          }
          uint64_t v21 = v25;
          if (!v20) {
            uint64_t v21 = v25 + 1;
          }
          uint64_t v25 = v21;
        }
      }
      self = obj;
      id v11 = [(NSArray *)obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v11);
  }
  else
  {
    uint64_t v25 = 0;
  }
  long long v22 = (char *)[v27 count] + v25;
  if (v22 != (char *)[(NSArray *)self count]) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", v24, self, @"NSArray+IMAdditions.m", 320, @"Unexpected Counts: Unfiltered: %lu; Filter: %lu; Filtered: %lu; Filter Hit: %lu",
  }
      [(NSArray *)self count],
      [a4 count],
      [v27 count],
      v25);
  return v27;
}

@end