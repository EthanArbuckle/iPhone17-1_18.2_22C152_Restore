@interface PBRepresentationToObjectCoercion
- (BOOL)canCoerceFromType:(id)a3;
- (Class)theClass;
- (NSMutableDictionary)blockByType;
- (NSMutableOrderedSet)typeOrder;
- (PBRepresentationToObjectCoercion)initWithClass:(Class)a3;
- (id)availableImportTypes;
- (id)createObjectFromRepresentationConformingToType:(id)a3 data:(id)a4 URL:(id)a5 outError:(id *)a6;
- (void)addCoercionFromType:(id)a3 block:(id)a4;
- (void)setBlockByType:(id)a3;
- (void)setTheClass:(Class)a3;
- (void)setTypeOrder:(id)a3;
@end

@implementation PBRepresentationToObjectCoercion

- (PBRepresentationToObjectCoercion)initWithClass:(Class)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PBRepresentationToObjectCoercion;
  v4 = [(PBRepresentationToObjectCoercion *)&v11 init];
  v5 = v4;
  if (v4)
  {
    objc_storeStrong((id *)&v4->_theClass, a3);
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    blockByType = v5->_blockByType;
    v5->_blockByType = (NSMutableDictionary *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA70] orderedSet];
    typeOrder = v5->_typeOrder;
    v5->_typeOrder = (NSMutableOrderedSet *)v8;
  }
  return v5;
}

- (void)addCoercionFromType:(id)a3 block:(id)a4
{
  id v7 = a3;
  uint64_t v6 = (void *)MEMORY[0x192F9AA30](a4);
  [(NSMutableDictionary *)self->_blockByType setObject:v6 forKeyedSubscript:v7];

  [(NSMutableOrderedSet *)self->_typeOrder addObject:v7];
}

- (id)availableImportTypes
{
  return (id)[(NSMutableOrderedSet *)self->_typeOrder array];
}

- (BOOL)canCoerceFromType:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v4 = (__CFString *)a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_typeOrder;
  uint64_t v6 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (UTTypeConformsTo(v4, *(CFStringRef *)(*((void *)&v10 + 1) + 8 * i)))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSMutableOrderedSet *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)createObjectFromRepresentationConformingToType:(id)a3 data:(id)a4 URL:(id)a5 outError:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  long long v13 = [(NSMutableOrderedSet *)self->_typeOrder array];
  v14 = _bestMatchType(v10, v13, &__block_literal_global_15);

  if (!v14
    || ([(NSMutableDictionary *)self->_blockByType objectForKeyedSubscript:v14],
        (uint64_t v15 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    PBCannotInstantiateObjectOfClassError(self->_theClass, v10, 0);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    v16 = 0;
LABEL_9:
    uint64_t v18 = 0;
    goto LABEL_10;
  }
  v16 = (void *)v15;
  Class theClass = self->_theClass;
  id v25 = 0;
  uint64_t v18 = (*(void (**)(uint64_t, Class, void *, id, id, id *))(v15 + 16))(v15, theClass, v14, v11, v12, &v25);
  unint64_t v19 = (unint64_t)v25;
  if (!(v18 | v19))
  {
    PBCannotInstantiateObjectOfClassError(self->_theClass, v10, 0);
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  id v20 = (id)v19;
  if (!v19) {
    goto LABEL_13;
  }
  v21 = [(id)v19 domain];
  char v24 = [v21 isEqualToString:@"PBErrorDomain"];

  if ((v24 & 1) == 0)
  {
    uint64_t v22 = PBCannotInstantiateObjectOfClassError(self->_theClass, v10, v20);

    id v20 = (id)v22;
  }
LABEL_10:
  if (a6 && v20)
  {
    id v20 = v20;
    *a6 = v20;
  }
LABEL_13:

  return (id)v18;
}

- (Class)theClass
{
  return self->_theClass;
}

- (void)setTheClass:(Class)a3
{
}

- (NSMutableDictionary)blockByType
{
  return self->_blockByType;
}

- (void)setBlockByType:(id)a3
{
}

- (NSMutableOrderedSet)typeOrder
{
  return self->_typeOrder;
}

- (void)setTypeOrder:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeOrder, 0);
  objc_storeStrong((id *)&self->_blockByType, 0);
  objc_storeStrong((id *)&self->_theClass, 0);
}

@end