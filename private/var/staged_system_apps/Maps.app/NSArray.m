@interface NSArray
+ (BOOL)array:(id)a3 isEqualToArray:(id)a4;
+ (id)_maps_commonPrefixSharedBetweenArray:(id)a3 suffix:(id *)a4 andArray:(id)a5 suffix:(id *)a6;
+ (id)_navigation_newArrayWithDefaultValue:(id)a3 withCapacity:(unint64_t)a4;
- (BOOL)_maps_containsContextOfClass:(Class)a3;
- (BOOL)_maps_containsSearchResultEqualToResult:(id)a3 forPurpose:(int64_t)a4;
- (BOOL)_maps_isPrefixOfArray:(id)a3;
- (NSArray)carShortenedArray;
- (id)_maps_compactMap:(id)a3;
- (id)_maps_firstContextOfClass:(Class)a3;
- (id)_maps_lastContextOfClass:(Class)a3;
- (id)_maps_map:(id)a3;
- (id)_maps_subarrayFromIndex:(unint64_t)a3;
- (id)_maps_subarrayToIndex:(unint64_t)a3;
@end

@implementation NSArray

- (BOOL)_maps_containsContextOfClass:(Class)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1003BF248;
  v4[3] = &unk_1012E7BD0;
  v4[4] = a3;
  return [(NSArray *)self indexOfObjectPassingTest:v4] != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)_maps_firstContextOfClass:(Class)a3
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_100103B5C;
  v10 = sub_100104638;
  id v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1003BF388;
  v5[3] = &unk_1012E7BF8;
  v5[4] = &v6;
  v5[5] = a3;
  [(NSArray *)self enumerateObjectsUsingBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_maps_lastContextOfClass:(Class)a3
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = sub_100103B5C;
  v10 = sub_100104638;
  id v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1003BF508;
  v5[3] = &unk_1012E7BF8;
  v5[4] = &v6;
  v5[5] = a3;
  [(NSArray *)self enumerateObjectsWithOptions:2 usingBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)_maps_subarrayFromIndex:(unint64_t)a3
{
  if (a3)
  {
    if ([(NSArray *)self count] <= a3)
    {
      id v5 = &__NSArray0__struct;
    }
    else
    {
      -[NSArray subarrayWithRange:](self, "subarrayWithRange:", a3, (char *)[(NSArray *)self count] - a3);
      id v5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v5 = [(NSArray *)self copy];
  }

  return v5;
}

- (id)_maps_subarrayToIndex:(unint64_t)a3
{
  if ([(NSArray *)self count])
  {
    unint64_t v5 = a3 + 1;
    if (v5 >= [(NSArray *)self count])
    {
      id v6 = [(NSArray *)self copy];
    }
    else
    {
      -[NSArray subarrayWithRange:](self, "subarrayWithRange:", 0, v5);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    id v6 = &__NSArray0__struct;
  }

  return v6;
}

+ (id)_navigation_newArrayWithDefaultValue:(id)a3 withCapacity:(unint64_t)a4
{
  id v5 = a3;
  id v6 = +[NSMutableArray arrayWithCapacity:a4];
  if (a4)
  {
    uint64_t v7 = 0;
    do
    {
      if (v5) {
        [v6 setObject:v5 atIndexedSubscript:v7];
      }
      ++v7;
    }
    while (a4 != v7);
  }
  id v8 = [v6 copy];

  return v8;
}

- (BOOL)_maps_containsSearchResultEqualToResult:(id)a3 forPurpose:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  id v8 = v6;
  if (v8)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v9 = v7;
    id v10 = [(NSArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v18;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && (objc_msgSend(v8, "isEqualToSearchResult:forPurpose:", v14, a4, (void)v17) & 1) != 0)
          {
            v15 = v14;

            v9 = v15;
            goto LABEL_14;
          }
        }
        id v11 = [(NSArray *)v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    v15 = 0;
LABEL_14:
  }
  else
  {
    v15 = 0;
  }

  return v15 != 0;
}

+ (BOOL)array:(id)a3 isEqualToArray:(id)a4
{
  unint64_t v5 = (unint64_t)a3;
  unint64_t v6 = (unint64_t)a4;
  uint64_t v7 = (void *)v6;
  if (v5 | v6)
  {
    unsigned __int8 v8 = 0;
    if (v5 && v6) {
      unsigned __int8 v8 = [(id)v5 isEqualToArray:v6];
    }
  }
  else
  {
    unsigned __int8 v8 = 1;
  }

  return v8;
}

- (id)_maps_map:(id)a3
{
  v4 = (void (**)(id, void))a3;
  unint64_t v5 = +[NSMutableArray arrayWithCapacity:[(NSArray *)self count]];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unint64_t v6 = self;
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = v4[2](v4, *(void *)(*((void *)&v13 + 1) + 8 * i));
        [v5 addObject:v11];
      }
      id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)_maps_compactMap:(id)a3
{
  v4 = (void (**)(id, void))a3;
  unint64_t v5 = +[NSMutableArray arrayWithCapacity:[(NSArray *)self count]];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unint64_t v6 = self;
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = v4[2](v4, *(void *)(*((void *)&v13 + 1) + 8 * i));
        if (v11) {
          [v5 addObject:v11];
        }
      }
      id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)_maps_isPrefixOfArray:(id)a3
{
  id v4 = a3;
  id v5 = [v4 count];
  if (v5 >= (id)[(NSArray *)self count])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = self;
    id v8 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v17;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v7);
          }
          uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
          long long v14 = [v4 objectAtIndexedSubscript:(char *)i + v10];
          LODWORD(v13) = [v14 isEqual:v13];

          if (!v13)
          {
            BOOL v6 = 0;
            goto LABEL_13;
          }
        }
        id v9 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        v10 += (uint64_t)i;
        if (v9) {
          continue;
        }
        break;
      }
    }
    BOOL v6 = 1;
LABEL_13:
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (id)_maps_commonPrefixSharedBetweenArray:(id)a3 suffix:(id *)a4 andArray:(id)a5 suffix:(id *)a6
{
  id v9 = a3;
  id v10 = a5;
  if (v9) {
    uint64_t v11 = v9;
  }
  else {
    uint64_t v11 = &__NSArray0__struct;
  }
  if (v10) {
    uint64_t v12 = v10;
  }
  else {
    uint64_t v12 = &__NSArray0__struct;
  }
  id v13 = objc_alloc_init((Class)NSMutableArray);
  unint64_t v14 = 0;
  if ([v11 count])
  {
    while (v14 < (unint64_t)[v12 count])
    {
      long long v15 = [v11 objectAtIndexedSubscript:v14];
      long long v16 = [v12 objectAtIndexedSubscript:v14];
      unsigned __int8 v17 = [v16 isEqual:v15];

      if ((v17 & 1) == 0)
      {

        if (a4) {
          goto LABEL_12;
        }
        goto LABEL_13;
      }
      [v13 addObject:v15];
      ++v14;

      if (v14 >= (unint64_t)[v11 count]) {
        break;
      }
    }
  }
  if (a4)
  {
LABEL_12:
    objc_msgSend(v11, "subarrayWithRange:", v14, (char *)objc_msgSend(v11, "count") - v14);
    id v18 = objc_claimAutoreleasedReturnValue();
    *a4 = v18;
  }
LABEL_13:
  if (a6)
  {
    [v12 subarrayWithRange:v14, (char *)[v12 count] - v14];
    id v19 = objc_claimAutoreleasedReturnValue();
    *a6 = v19;
  }

  return v13;
}

- (NSArray)carShortenedArray
{
  if (![(NSArray *)self count]
    || (unint64_t v3 = +[CarDisplayController maximumListLength],
        v3 == -1))
  {
    id v5 = self;
  }
  else
  {
    NSUInteger v4 = v3;
    if ([(NSArray *)self count] < v3) {
      NSUInteger v4 = [(NSArray *)self count];
    }
    -[NSArray subarrayWithRange:](self, "subarrayWithRange:", 0, v4);
    id v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

@end