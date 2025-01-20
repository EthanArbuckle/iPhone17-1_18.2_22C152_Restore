@interface PBObjectToObjectCoercion
- (BOOL)canCoerceToObjectOfClass:(Class)a3;
- (Class)theClass;
- (NSMutableDictionary)blockByClass;
- (NSMutableOrderedSet)orderedClassNames;
- (PBObjectToObjectCoercion)initWithClass:(Class)a3;
- (id)availableClasses;
- (id)coerceObject:(id)a3 toObjectOfClass:(Class)a4 outError:(id *)a5;
- (void)addCoercionToClass:(Class)a3 block:(id)a4;
- (void)setBlockByClass:(id)a3;
- (void)setOrderedClassNames:(id)a3;
- (void)setTheClass:(Class)a3;
@end

@implementation PBObjectToObjectCoercion

- (PBObjectToObjectCoercion)initWithClass:(Class)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PBObjectToObjectCoercion;
  v4 = [(PBObjectToObjectCoercion *)&v11 init];
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_theClass, a3);
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    blockByClass = v5->_blockByClass;
    v5->_blockByClass = (NSMutableDictionary *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA70] orderedSet];
    orderedClassNames = v5->_orderedClassNames;
    v5->_orderedClassNames = (NSMutableOrderedSet *)v8;
  }
  return v5;
}

- (void)addCoercionToClass:(Class)a3 block:(id)a4
{
  id v6 = a4;
  NSStringFromClass(a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x192F9AA30](v6);

  [(NSMutableDictionary *)self->_blockByClass setObject:v7 forKeyedSubscript:v8];
  [(NSMutableOrderedSet *)self->_orderedClassNames addObject:v8];
}

- (id)availableClasses
{
  return (id)[(NSMutableOrderedSet *)self->_orderedClassNames array];
}

- (BOOL)canCoerceToObjectOfClass:(Class)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = self->_orderedClassNames;
  uint64_t v5 = [(NSMutableOrderedSet *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        Class v9 = NSClassFromString(*(NSString **)(*((void *)&v12 + 1) + 8 * i));
        if (-[objc_class isSubclassOfClass:](v9, "isSubclassOfClass:", a3, (void)v12))
        {
          BOOL v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMutableOrderedSet *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (id)coerceObject:(id)a3 toObjectOfClass:(Class)a4 outError:(id *)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  Class v9 = self->_orderedClassNames;
  uint64_t v10 = [(NSMutableOrderedSet *)v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(NSString **)(*((void *)&v28 + 1) + 8 * i);
        Class v15 = NSClassFromString(v14);
        if ([(objc_class *)v15 isSubclassOfClass:a4])
        {
          uint64_t v16 = [(NSMutableDictionary *)self->_blockByClass objectForKeyedSubscript:v14];
          if (v16)
          {
            v19 = (void *)v16;
            id v27 = 0;
            v18 = (*(void (**)(uint64_t, Class, id, id *))(v16 + 16))(v16, v15, v8, &v27);
            id v20 = v27;
            id v21 = v20;
            if (a5)
            {
              if (v20)
              {
                v22 = [v20 domain];
                char v23 = [v22 isEqualToString:@"PBErrorDomain"];

                if ((v23 & 1) == 0)
                {
                  v24 = (objc_class *)objc_opt_class();
                  uint64_t v25 = PBCannotCoerceObjectOfClassToObjectOfClassError(v24, a4, v21);

                  id v21 = (id)v25;
                }
              }
              id v21 = v21;
              *a5 = v21;
            }

            goto LABEL_19;
          }
        }
      }
      uint64_t v11 = [(NSMutableOrderedSet *)v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  if (a5)
  {
    uint64_t v17 = (objc_class *)objc_opt_class();
    PBCannotCoerceObjectOfClassToObjectOfClassError(v17, a4, 0);
    v18 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }
LABEL_19:

  return v18;
}

- (Class)theClass
{
  return self->_theClass;
}

- (void)setTheClass:(Class)a3
{
}

- (NSMutableDictionary)blockByClass
{
  return self->_blockByClass;
}

- (void)setBlockByClass:(id)a3
{
}

- (NSMutableOrderedSet)orderedClassNames
{
  return self->_orderedClassNames;
}

- (void)setOrderedClassNames:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedClassNames, 0);
  objc_storeStrong((id *)&self->_blockByClass, 0);
  objc_storeStrong((id *)&self->_theClass, 0);
}

@end