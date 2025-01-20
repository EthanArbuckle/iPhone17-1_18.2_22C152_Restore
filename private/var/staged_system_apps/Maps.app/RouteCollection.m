@interface RouteCollection
- (BOOL)isEqual:(id)a3;
- (GEOComposedRoute)currentRoute;
- (NSArray)alternateRoutes;
- (NSArray)routes;
- (NSArray)uniqueRouteIDs;
- (NSString)shortDescription;
- (RouteCollection)initWithRoutes:(id)a3 currentRouteIndex:(unint64_t)a4;
- (id)description;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectForKey:(id)a3;
- (id)routeCollectionByChangingCurrentRouteIndex:(unint64_t)a3;
- (id)routeCollectionByReplacingAlternateComposedRoutes:(id)a3 withTraffics:(id)a4;
- (id)routeCollectionByReplacingAlternateRoutes:(id)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)currentRouteIndex;
- (unint64_t)fastestRouteIndex;
- (unint64_t)hash;
- (unint64_t)indexForUniqueRouteID:(id)a3;
- (unint64_t)indexOfRoute:(id)a3;
- (unint64_t)shortestRouteIndex;
- (void)dealloc;
- (void)enumerateRoutesUsingBlock:(id)a3;
- (void)setCurrentRouteIndex:(unint64_t)a3;
- (void)setRoutes:(id)a3;
@end

@implementation RouteCollection

- (RouteCollection)initWithRoutes:(id)a3 currentRouteIndex:(unint64_t)a4
{
  id v6 = a3;
  v7 = v6;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL || (unint64_t)[v6 count] <= a4)
  {
    +[NSException raise:NSInvalidArgumentException format:@"currentRouteIndex is out of bounds"];
    v27 = 0;
  }
  else
  {
    v36.receiver = self;
    v36.super_class = (Class)RouteCollection;
    v8 = [(RouteCollection *)&v36 init];
    if (v8)
    {
      id v9 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v7 count]];
      id v10 = [objc_alloc((Class)NSMutableSet) initWithCapacity:[v7 count]];
      unint64_t v30 = a4;
      v11 = [v7 objectAtIndexedSubscript:a4];
      v29 = [v11 uniqueRouteID];

      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      v31 = v7;
      id v12 = v7;
      id v13 = [v12 countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v33;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v33 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            v18 = [v17 uniqueRouteID];
            unsigned __int8 v19 = [v10 containsObject:v18];

            if ((v19 & 1) == 0)
            {
              [v9 addObject:v17];
              [v17 _maps_routeCollectionOnly_setRouteCollectionWhenNil:v8];
              v20 = [v17 uniqueRouteID];
              [v10 addObject:v20];
            }
          }
          id v14 = [v12 countByEnumeratingWithState:&v32 objects:v37 count:16];
        }
        while (v14);
      }

      v21 = (NSArray *)[v9 copy];
      routes = v8->_routes;
      v8->_routes = v21;

      unint64_t v23 = v30;
      v24 = [(NSArray *)v8->_routes objectAtIndexedSubscript:v30];
      unsigned __int8 v25 = [v29 isEqual:v24];

      if ((v25 & 1) == 0)
      {
        id v26 = [(RouteCollection *)v8 indexForUniqueRouteID:v29];
        if (v26 == (id)0x7FFFFFFFFFFFFFFFLL) {
          unint64_t v23 = 0;
        }
        else {
          unint64_t v23 = (unint64_t)v26;
        }
      }
      v8->_currentRouteIndex = v23;

      v7 = v31;
    }
    self = v8;
    v27 = self;
  }

  return v27;
}

- (unint64_t)shortestRouteIndex
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v6[3] = 0x7FEFFFFFFFFFFFFFLL;
  v2 = [(RouteCollection *)self routes];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10087B83C;
  v5[3] = &unk_1012FE640;
  v5[4] = v6;
  v5[5] = &v7;
  [v2 enumerateObjectsUsingBlock:v5];

  unint64_t v3 = v8[3];
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (unint64_t)fastestRouteIndex
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v6[3] = 0x7FEFFFFFFFFFFFFFLL;
  v2 = [(RouteCollection *)self routes];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10087B9BC;
  v5[3] = &unk_1012FE640;
  v5[4] = v6;
  v5[5] = &v7;
  [v2 enumerateObjectsUsingBlock:v5];

  unint64_t v3 = v8[3];
  _Block_object_dispose(v6, 8);
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (void)dealloc
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unint64_t v3 = [(RouteCollection *)self routes];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) _maps_routeCollectionOnly_Clear];
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)RouteCollection;
  [(RouteCollection *)&v8 dealloc];
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  unint64_t v4 = [(RouteCollection *)self currentRouteIndex];
  id v5 = [(RouteCollection *)self routes];
  uint64_t v6 = +[NSString stringWithFormat:@"<%@: %p currentRouteIndex=%lu routes=%@>", v3, self, v4, v5];

  return v6;
}

- (NSString)shortDescription
{
  uint64_t v3 = objc_opt_class();
  unint64_t v4 = [(RouteCollection *)self currentRouteIndex];
  id v5 = [(RouteCollection *)self routes];
  uint64_t v6 = +[NSString stringWithFormat:@"<%@: %p currentRouteIndex=%lu routes=%@>", v3, self, v4, v5];

  return (NSString *)v6;
}

- (id)routeCollectionByChangingCurrentRouteIndex:(unint64_t)a3
{
  id v5 = objc_alloc((Class)objc_opt_class());
  uint64_t v6 = [(RouteCollection *)self routes];
  id v7 = [v5 initWithRoutes:v6 currentRouteIndex:a3];

  return v7;
}

- (id)routeCollectionByReplacingAlternateRoutes:(id)a3
{
  id v4 = a3;
  id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:3];
  uint64_t v6 = [(RouteCollection *)self currentRoute];
  [v5 addObject:v6];

  [v5 addObjectsFromArray:v4];
  id v7 = [objc_alloc((Class)objc_opt_class()) initWithRoutes:v5 currentRouteIndex:0];

  return v7;
}

- (id)routeCollectionByReplacingAlternateComposedRoutes:(id)a3 withTraffics:(id)a4
{
  id v5 = a3;
  id v6 = [objc_alloc((Class)NSMutableArray) initWithCapacity:3];
  id v7 = [(RouteCollection *)self currentRoute];
  [v6 addObject:v7];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v14 = [v13 uniqueRouteID:v18];
        id v15 = [(RouteCollection *)self objectForKeyedSubscript:v14];

        if (!v15) {
          id v15 = v13;
        }
        [v6 addObject:v15];
      }
      id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v10);
  }

  id v16 = [objc_alloc((Class)objc_opt_class()) initWithRoutes:v6 currentRouteIndex:0];

  return v16;
}

- (unint64_t)count
{
  v2 = [(RouteCollection *)self routes];
  id v3 = [v2 count];

  return (unint64_t)v3;
}

- (GEOComposedRoute)currentRoute
{
  id v3 = [(RouteCollection *)self routes];
  id v4 = [v3 objectAtIndexedSubscript:[self currentRouteIndex]];

  return (GEOComposedRoute *)v4;
}

- (NSArray)alternateRoutes
{
  alternateRoutes = self->_alternateRoutes;
  if (!alternateRoutes)
  {
    id v4 = [(RouteCollection *)self routes];
    id v5 = (NSArray *)[v4 mutableCopy];

    [(NSArray *)v5 removeObjectAtIndex:[(RouteCollection *)self currentRouteIndex]];
    id v6 = self->_alternateRoutes;
    self->_alternateRoutes = v5;

    alternateRoutes = self->_alternateRoutes;
  }

  return alternateRoutes;
}

- (unint64_t)indexForUniqueRouteID:(id)a3
{
  id v4 = a3;
  id v5 = [(RouteCollection *)self routes];
  id v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0;
    while (1)
    {
      id v8 = [(RouteCollection *)self routes];
      id v9 = [v8 objectAtIndexedSubscript:v7];

      id v10 = [v9 uniqueRouteID];
      unsigned __int8 v11 = [v10 isEqual:v4];

      if (v11) {
        break;
      }
      ++v7;
      long long v12 = [(RouteCollection *)self routes];
      id v13 = [v12 count];

      if (v7 >= (unint64_t)v13) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (unint64_t)indexOfRoute:(id)a3
{
  id v4 = a3;
  id v5 = [(RouteCollection *)self routes];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10087C210;
  v9[3] = &unk_1012EAE80;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 indexOfObjectPassingTest:v9];

  return (unint64_t)v7;
}

- (NSArray)uniqueRouteIDs
{
  v2 = [(RouteCollection *)self routes];
  id v3 = sub_100099700(v2, &stru_1012FE660);

  return (NSArray *)v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (RouteCollection *)a3;
  id v5 = v4;
  if (v4 == self)
  {
    unsigned __int8 v10 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v5;
    id v7 = [(RouteCollection *)v6 currentRouteIndex];
    if (v7 == (id)[(RouteCollection *)self currentRouteIndex])
    {
      id v8 = [(RouteCollection *)v6 routes];
      id v9 = [(RouteCollection *)self routes];
      unsigned __int8 v10 = [v8 isEqual:v9];
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  id v3 = [(RouteCollection *)self routes];
  unint64_t v4 = (unint64_t)[v3 hash];
  id v5 = +[NSNumber numberWithUnsignedInteger:[(RouteCollection *)self currentRouteIndex]];
  unint64_t v6 = v4 ^ ((void)[v5 hash] << 8);

  return v6;
}

- (unint64_t)currentRouteIndex
{
  return self->_currentRouteIndex;
}

- (void)setCurrentRouteIndex:(unint64_t)a3
{
  self->_currentRouteIndex = a3;
}

- (NSArray)routes
{
  return self->_routes;
}

- (void)setRoutes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routes, 0);

  objc_storeStrong((id *)&self->_alternateRoutes, 0);
}

- (id)objectForKey:(id)a3
{
  unint64_t v4 = [(RouteCollection *)self indexForUniqueRouteID:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = [(RouteCollection *)self objectAtIndexedSubscript:v4];
  }

  return v5;
}

- (id)objectAtIndex:(unint64_t)a3
{
  unint64_t v4 = [(RouteCollection *)self routes];
  id v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (void)enumerateRoutesUsingBlock:(id)a3
{
  unint64_t v4 = (void (**)(id, uint64_t, char *))a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(RouteCollection *)self routes];
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
      char v11 = 0;
      v4[2](v4, v10, &v11);
      if (v11) {
        break;
      }
      if (v7 == (id)++v9)
      {
        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  uint64_t v8 = [(RouteCollection *)self routes];
  id v9 = [v8 countByEnumeratingWithState:a3 objects:a4 count:a5];

  return (unint64_t)v9;
}

@end