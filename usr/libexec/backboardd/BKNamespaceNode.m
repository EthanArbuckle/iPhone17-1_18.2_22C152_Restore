@interface BKNamespaceNode
- (BKNamespaceNode)init;
- (BOOL)isEqual:(id)a3;
- (NSMutableOrderedSet)subnodes;
- (NSObject)object;
- (NSString)name;
- (id)_enumerateKeyPathNodesByComponent:(id)a3 options:(int64_t)a4 ifFound:(id)a5 ifMissing:(id)a6;
- (id)description;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)enumerateKeyPathNodes:(id)a3 options:(int64_t)a4 ifFound:(id)a5 ifMissing:(id)a6;
- (id)nodeAtKeyPath:(id)a3;
- (id)objectAtKeyPath:(id)a3;
- (id)setObject:(id)a3 atKeyPath:(id)a4;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (unint64_t)hash;
- (void)_dumpNodeTree:(id)a3 level:(int64_t)a4;
- (void)_enumerateNodesWithOptions:(int64_t)a3 usingBlock:(id)a4;
- (void)dumpNodeTree;
- (void)removeNodeAtKeyPath:(id)a3;
- (void)setName:(id)a3;
- (void)setObject:(id)a3;
- (void)setSubnodes:(id)a3;
@end

@implementation BKNamespaceNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subnodes, 0);
  objc_storeStrong((id *)&self->_object, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setSubnodes:(id)a3
{
}

- (NSMutableOrderedSet)subnodes
{
  return self->_subnodes;
}

- (void)setObject:(id)a3
{
}

- (NSObject)object
{
  return self->_object;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)_dumpNodeTree:(id)a3 level:(int64_t)a4
{
  id v6 = a3;
  v7 = sub_10005FB14();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if ((int)a4 <= 16) {
      int v8 = 2 * a4;
    }
    else {
      int v8 = 32;
    }
    v9 = [(BKNamespaceNode *)self name];
    v10 = [(BKNamespaceNode *)self object];
    *(_DWORD *)buf = 68158722;
    int v25 = v8;
    __int16 v26 = 2080;
    v27 = "                                ";
    __int16 v28 = 2048;
    v29 = self;
    __int16 v30 = 2114;
    v31 = v9;
    __int16 v32 = 2114;
    v33 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%.*s%p %{public}@ %{public}@", buf, 0x30u);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v11 = v6;
  id v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    id v13 = v12;
    int64_t v14 = a4 + 1;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v11);
        }
        v17 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v18 = [v17 subnodes:v19];
        [v17 _dumpNodeTree:v18 level:v14];
      }
      id v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }
}

- (id)_enumerateKeyPathNodesByComponent:(id)a3 options:(int64_t)a4 ifFound:(id)a5 ifMissing:(id)a6
{
  char v33 = a4;
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = self->_subnodes;
  id v13 = self;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v9;
  id v14 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  v34 = (void (**)(void, void, void, void))v11;
  if (v14)
  {
    id v15 = v14;
    v16 = 0;
    uint64_t v17 = *(void *)v37;
    v18 = (void (**)(void, void, void))v10;
    __int16 v32 = (void (**)(void, void, void))v10;
    while (2)
    {
      long long v19 = 0;
      long long v20 = v13;
      id v13 = v16;
      long long v21 = v12;
      do
      {
        if (*(void *)v37 != v17) {
          objc_enumerationMutation(obj);
        }
        long long v22 = *(void **)(*((void *)&v36 + 1) + 8 * (void)v19);

        v23 = [(NSMutableOrderedSet *)v21 set];
        v24 = [v23 member:v22];
        int v25 = v24;
        if (v24)
        {
          if (v18)
          {
            if ((v33 & 1) == 0
              || ([v24 object], __int16 v26 = objc_claimAutoreleasedReturnValue(), v26, v26))
            {
              ((void (**)(void, void *, BKNamespaceNode *))v18)[2](v18, v25, v20);
            }
          }
          id v27 = v25;
        }
        else
        {
          if (!v34
            || ([(NSMutableOrderedSet *)v21 lastObject],
                __int16 v28 = objc_claimAutoreleasedReturnValue(),
                ((void (**)(void, void *, BKNamespaceNode *, BOOL))v34)[2](v34, v22, v20, v22 == v28),
                id v27 = (id)objc_claimAutoreleasedReturnValue(),
                v28,
                !v27))
          {

            __int16 v30 = 0;
            id v13 = v20;
            id v12 = v21;
            v18 = v32;
            goto LABEL_20;
          }
          v29 = [(BKNamespaceNode *)v20 subnodes];
          [v29 addObject:v27];

          v18 = v32;
        }
        id v13 = (BKNamespaceNode *)v27;

        id v12 = [(BKNamespaceNode *)v13 subnodes];

        long long v19 = (char *)v19 + 1;
        long long v20 = v13;
        long long v21 = v12;
      }
      while (v15 != v19);
      id v15 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
      v16 = v13;
      __int16 v30 = v13;
      if (v15) {
        continue;
      }
      break;
    }
  }
  else
  {
    __int16 v30 = 0;
    v18 = (void (**)(void, void, void))v10;
  }
LABEL_20:

  return v30;
}

- (void)_enumerateNodesWithOptions:(int64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if ((a3 & 2) != 0)
  {
    if (((a3 & 1) == 0 || self->_object) && (*((uint64_t (**)(id, BKNamespaceNode *))v6 + 2))(v6, self)) {
      goto LABEL_14;
    }
  }
  else
  {
    a3 |= 2uLL;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int v8 = self->_subnodes;
  id v9 = [(NSMutableOrderedSet *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      id v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * (void)v12) _enumerateNodesWithOptions:a3 usingBlock:v7, v13];
        id v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [(NSMutableOrderedSet *)v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }

LABEL_14:
}

- (void)dumpNodeTree
{
}

- (id)enumerateKeyPathNodes:(id)a3 options:(int64_t)a4 ifFound:(id)a5 ifMissing:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = [a3 componentsSeparatedByString:@"."];
  long long v13 = [(BKNamespaceNode *)self _enumerateKeyPathNodesByComponent:v12 options:a4 ifFound:v11 ifMissing:v10];

  return v13;
}

- (id)setObject:(id)a3 atKeyPath:(id)a4
{
  id v6 = a3;
  v7 = [(BKNamespaceNode *)self enumerateKeyPathNodes:a4 options:0 ifFound:0 ifMissing:&stru_1000F90E0];
  [v7 setObject:v6];

  return v7;
}

- (id)objectAtKeyPath:(id)a3
{
  v3 = [(BKNamespaceNode *)self nodeAtKeyPath:a3];
  v4 = [v3 object];

  return v4;
}

- (id)nodeAtKeyPath:(id)a3
{
  return [(BKNamespaceNode *)self enumerateKeyPathNodes:a3 options:0 ifFound:0 ifMissing:0];
}

- (void)removeNodeAtKeyPath:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = sub_10009FACC;
  long long v13 = sub_10009FADC;
  id v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10009FAE4;
  v8[3] = &unk_1000F90A0;
  v8[4] = &v9;
  v5 = [(BKNamespaceNode *)self enumerateKeyPathNodes:v4 options:0 ifFound:v8 ifMissing:0];
  if (v5)
  {
    id v6 = (void *)v10[5];
    if (v6)
    {
      v7 = [v6 subnodes];
      [v7 removeObject:v5];
    }
  }

  _Block_object_dispose(&v9, 8);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && ([(NSString *)self->_name isEqual:v4])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (name = self->_name,
          [v4 name],
          v7 = objc_claimAutoreleasedReturnValue(),
          LODWORD(name) = [(NSString *)name isEqual:v7],
          v7,
          name))
    {
      object = self->_object;
      uint64_t v9 = [v4 object];
      unsigned __int8 v5 = [object isEqual:v9];
    }
    else
    {
      unsigned __int8 v5 = 0;
    }
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSString *)self->_name hash];
}

- (id)description
{
  return [(BKNamespaceNode *)self descriptionWithMultilinePrefix:0];
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4 = [(BKNamespaceNode *)self succinctDescriptionBuilder];
  id v5 = [v4 appendObject:self->_name withName:@"name"];
  if (self->_object)
  {
    char v6 = objc_opt_respondsToSelector();
    object = self->_object;
    if (v6) {
      [object succinctDescription];
    }
    else {
    int v8 = [object description];
    }
    id v9 = [v4 appendObject:v8 withName:@"object"];
  }
  id v10 = [(NSMutableOrderedSet *)self->_subnodes array];
  uint64_t v11 = [v4 activeMultilinePrefix];
  [v4 appendArraySection:v10 withName:@"subnodes" multilinePrefix:v11 skipIfEmpty:1 objectTransformer:&stru_1000F9078];

  return v4;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(BKNamespaceNode *)self descriptionBuilderWithMultilinePrefix:a3];
  id v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  return +[BSDescriptionBuilder builderWithObject:self];
}

- (id)succinctDescription
{
  v2 = [(BKNamespaceNode *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (BKNamespaceNode)init
{
  v6.receiver = self;
  v6.super_class = (Class)BKNamespaceNode;
  v2 = [(BKNamespaceNode *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
    subnodes = v2->_subnodes;
    v2->_subnodes = v3;
  }
  return v2;
}

@end