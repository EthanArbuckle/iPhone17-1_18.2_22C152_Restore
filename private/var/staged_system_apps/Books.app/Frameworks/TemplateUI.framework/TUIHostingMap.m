@interface TUIHostingMap
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToMap:(id)a3;
- (NSArray)order;
- (NSDictionary)groupMap;
- (NSDictionary)map;
- (NSSet)identifiers;
- (TUIHostingMap)initWithMap:(id)a3 order:(id)a4;
- (id)description;
- (id)objectForKeyedSubscript:(id)a3;
- (id)reverseEnumeratorForGroup:(id)a3;
@end

@implementation TUIHostingMap

- (TUIHostingMap)initWithMap:(id)a3 order:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v37.receiver = self;
  v37.super_class = (Class)TUIHostingMap;
  v8 = [(TUIHostingMap *)&v37 init];
  if (v8)
  {
    v9 = (NSDictionary *)[v6 copy];
    map = v8->_map;
    v8->_map = v9;

    v11 = (NSArray *)[v7 copy];
    order = v8->_order;
    v8->_order = v11;

    if (v8->_order)
    {
      v13 = (NSSet *)[objc_alloc((Class)NSSet) initWithArray:v8->_order];
      identifiers = v8->_identifiers;
      v8->_identifiers = v13;
    }
    else
    {
      identifiers = v8->_identifiers;
      v8->_identifiers = 0;
    }

    if ([(NSArray *)v8->_order count])
    {
      v15 = objc_opt_new();
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      v29 = v8;
      v16 = v8->_order;
      id v17 = [(NSArray *)v16 countByEnumeratingWithState:&v33 objects:v38 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v34;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(void *)v34 != v19) {
              objc_enumerationMutation(v16);
            }
            uint64_t v21 = *(void *)(*((void *)&v33 + 1) + 8 * i);
            v22 = [v6 objectForKeyedSubscript:v21, v29];
            v23 = [v22 groupIdentifier];

            if (v23)
            {
              v24 = [v15 objectForKeyedSubscript:v23];
              if (!v24)
              {
                v24 = objc_opt_new();
                [v15 setObject:v24 forKeyedSubscript:v23];
              }
              [v24 addObject:v21];
            }
          }
          id v18 = [(NSArray *)v16 countByEnumeratingWithState:&v33 objects:v38 count:16];
        }
        while (v18);
      }

      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_197A8;
      v30[3] = &unk_251B98;
      id v31 = v6;
      v8 = v29;
      v25 = v29;
      v32 = v25;
      [v15 enumerateKeysAndObjectsUsingBlock:v30];
      v26 = (NSDictionary *)[v15 copy];
      groupMap = v25->_groupMap;
      v25->_groupMap = v26;
    }
  }

  return v8;
}

- (id)objectForKeyedSubscript:(id)a3
{
  return [(NSDictionary *)self->_map objectForKeyedSubscript:a3];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 != objc_opt_class() || v4 == 0) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = [(TUIHostingMap *)self isEqualToMap:v4];
  }

  return v7;
}

- (BOOL)isEqualToMap:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    map = self->_map;
    v8 = [v5 map];
    if (map == v8
      || (v9 = self->_map,
          [v6 map],
          v3 = objc_claimAutoreleasedReturnValue(),
          [(NSDictionary *)v9 isEqualToDictionary:v3]))
    {
      order = self->_order;
      uint64_t v12 = [v6 order];
      if (order == (NSArray *)v12)
      {

        unsigned __int8 v10 = 1;
      }
      else
      {
        v13 = (void *)v12;
        v14 = self->_order;
        v15 = [v6 order];
        unsigned __int8 v10 = [(NSArray *)v14 isEqualToArray:v15];
      }
      if (map == v8) {
        goto LABEL_11;
      }
    }
    else
    {
      unsigned __int8 v10 = 0;
    }

LABEL_11:
    goto LABEL_12;
  }
  unsigned __int8 v10 = 0;
LABEL_12:

  return v10;
}

- (id)reverseEnumeratorForGroup:(id)a3
{
  v3 = [(NSDictionary *)self->_groupMap objectForKeyedSubscript:a3];
  id v4 = [v3 reverseObjectEnumerator];

  return v4;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = +[NSString stringWithFormat:@"<%@ %p map=%@ order=%@ groups=%@>", v4, self, self->_map, self->_order, self->_groupMap];

  return v5;
}

- (NSArray)order
{
  return self->_order;
}

- (NSSet)identifiers
{
  return self->_identifiers;
}

- (NSDictionary)groupMap
{
  return self->_groupMap;
}

- (NSDictionary)map
{
  return self->_map;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_map, 0);
  objc_storeStrong((id *)&self->_groupMap, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);

  objc_storeStrong((id *)&self->_order, 0);
}

@end