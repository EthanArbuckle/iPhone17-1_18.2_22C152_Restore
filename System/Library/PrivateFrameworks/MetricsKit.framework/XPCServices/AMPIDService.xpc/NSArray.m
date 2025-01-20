@interface NSArray
- (id)mt_condensedArray;
- (id)mt_deepCopy;
- (id)mt_map:(id)a3;
- (void)mt_verifyEventData;
@end

@implementation NSArray

- (void)mt_verifyEventData
{
  if ([(NSArray *)self count])
  {
    unint64_t v3 = 0;
    do
    {
      v4 = [(NSArray *)self objectAtIndexedSubscript:v3];
      v5 = +[NSNull null];
      if (v4 == v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
      }
      else
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0)
        {
          objc_opt_class();
          id v13 = MTConfigurationError(108, @"Event data item at index %ld is of invalid type %@. Event data items must be of NSDictionary or MTPromise type.", v7, v8, v9, v10, v11, v12, v3);
        }
      }

      ++v3;
    }
    while (v3 < [(NSArray *)self count]);
  }
}

- (id)mt_map:(id)a3
{
  v4 = (void (**)(id, void))a3;
  v5 = +[NSMutableArray arrayWithCapacity:[(NSArray *)self count]];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = self;
  id v7 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = v4[2](v4, *(void *)(*((void *)&v14 + 1) + 8 * i));
        if (v11)
        {
          [v5 addObject:v11];
        }
        else
        {
          uint64_t v12 = +[NSNull null];
          [v5 addObject:v12];
        }
      }
      id v8 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)mt_deepCopy
{
  NSUInteger v3 = [(NSArray *)self count];
  uint64_t v4 = 8 * v3;
  v5 = (char *)&v12 - ((8 * v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  bzero(v5, 8 * v3);
  if (v3)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      id v7 = [(NSArray *)self objectAtIndexedSubscript:i];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v8 = objc_msgSend(v7, "mt_deepCopy");

        id v7 = (void *)v8;
      }
      uint64_t v9 = *(void **)&v5[8 * i];
      *(void *)&v5[8 * i] = v7;
    }
  }
  uint64_t v10 = +[NSArray arrayWithObjects:v5 count:v3];
  if (v3)
  {
    do
    {

      v4 -= 8;
    }
    while (v4);
  }

  return v10;
}

- (id)mt_condensedArray
{
  NSUInteger v3 = +[NSMutableArray arrayWithCapacity:[(NSArray *)self count]];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v4 = self;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    id v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          if (!v7 && v8) {
            id v7 = [v8 mutableCopy];
          }
          if (v7)
          {
            [v7 addEntriesFromDictionary:v11];
          }
          else
          {
            id v13 = v11;

            uint64_t v8 = v13;
          }
        }
        else
        {
          if (v7)
          {
            id v12 = [v7 copy];
            [v3 addObject:v12];
          }
          else if (v8)
          {
            objc_msgSend(v3, "addObject:", v8, (void)v17);
          }

          [v3 addObject:v11];
          id v7 = 0;
          uint64_t v8 = 0;
        }
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);

    if (v7)
    {
      id v14 = [v7 copy];
      [v3 addObject:v14];

      goto LABEL_26;
    }
    if (v8) {
      [v3 addObject:v8];
    }
  }
  else
  {

    uint64_t v8 = 0;
  }
  id v7 = 0;
LABEL_26:
  id v15 = objc_msgSend(v3, "copy", (void)v17);

  return v15;
}

@end