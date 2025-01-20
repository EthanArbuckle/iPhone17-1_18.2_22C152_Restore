@interface NSArray
- (id)allIdentifiers;
- (id)arrayByAddingObject:(id)a3 forIdentifier:(id)a4;
- (id)arrayByRemovingObjectForIdentifier:(id)a3;
- (id)objectForIdentifier:(id)a3;
@end

@implementation NSArray

- (id)allIdentifiers
{
  id v3 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSArray count](self, "count")];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = self;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = [v9 identifier:v14];

        if (v10)
        {
          v11 = [v9 identifier];
          [v3 addObject:v11];
        }
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  id v12 = [v3 copy];

  return v12;
}

- (id)objectForIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = self;
    id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          v10 = [v9 identifier:v13];
          unsigned __int8 v11 = [v10 isEqualToString:v4];

          if (v11)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
        id v6 = [(NSArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)arrayByAddingObject:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 length])
  {
    if (v6)
    {
      uint64_t v18 = 0;
      v19 = &v18;
      uint64_t v20 = 0x2020000000;
      uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
      id v12 = _NSConcreteStackBlock;
      uint64_t v13 = 3221225472;
      long long v14 = sub_10018394C;
      long long v15 = &unk_100238B78;
      id v16 = v7;
      long long v17 = &v18;
      [(NSArray *)self enumerateObjectsUsingBlock:&v12];
      if (v19[3] == 0x7FFFFFFFFFFFFFFFLL)
      {
        -[NSArray arrayByAddingObject:](self, "arrayByAddingObject:", v6, v12, v13, v14, v15);
        id v8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v10 = [(NSArray *)self mutableCopy];
        [v10 replaceObjectAtIndex:v19[3] withObject:v6];
        id v8 = [v10 copy];
      }
      _Block_object_dispose(&v18, 8);
      goto LABEL_10;
    }
    v9 = [(NSArray *)self arrayByRemovingObjectForIdentifier:v7];
  }
  else
  {
    v9 = self;
  }
  id v8 = v9;
LABEL_10:

  return v8;
}

- (id)arrayByRemovingObjectForIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100183AA8;
    v8[3] = &unk_100238BA0;
    id v9 = v4;
    id v5 = +[NSPredicate predicateWithBlock:v8];
    id v6 = [(NSArray *)self filteredArrayUsingPredicate:v5];
  }
  else
  {
    id v6 = self;
  }

  return v6;
}

@end