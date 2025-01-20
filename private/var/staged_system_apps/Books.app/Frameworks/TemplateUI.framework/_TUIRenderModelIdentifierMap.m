@interface _TUIRenderModelIdentifierMap
- (NSMutableIndexSet)available;
- (_NSRange)allocateNewRangeWithLength:(unint64_t)a3;
- (_TUIRenderModelIdentifierMap)init;
- (id).cxx_construct;
- (id)mapRenderModels:(id)a3;
- (unint64_t)allocateNewIndex;
- (unint64_t)indexForIdentifier:(id)a3;
- (unint64_t)largestIndexInUse;
- (unint64_t)nextUnassigned;
- (void)_appendInterests:(id)a3;
- (void)_collectIndex:(unint64_t)a3;
- (void)_releaseIndexes:(const void *)a3;
- (void)_retainIndexes:(const void *)a3;
- (void)setAvailable:(id)a3;
- (void)setNextUnassigned:(unint64_t)a3;
@end

@implementation _TUIRenderModelIdentifierMap

- (_TUIRenderModelIdentifierMap)init
{
  v10.receiver = self;
  v10.super_class = (Class)_TUIRenderModelIdentifierMap;
  v2 = [(_TUIRenderModelIdentifierMap *)&v10 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    available = v2->_available;
    v2->_available = (NSMutableIndexSet *)v3;

    v2->_nextUnassigned = 0;
    uint64_t v5 = objc_opt_new();
    identifierToIndex = v2->_identifierToIndex;
    v2->_identifierToIndex = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    indexToIdentifier = v2->_indexToIdentifier;
    v2->_indexToIdentifier = (NSMutableDictionary *)v7;
  }
  return v2;
}

- (void)_collectIndex:(unint64_t)a3
{
  unint64_t v3 = a3;
  sub_16CD94((uint64_t **)&self->_collectedIndexes, &v3, (uint64_t *)&v3);
}

- (void)_retainIndexes:(const void *)a3
{
  unint64_t v3 = (char *)a3 + 8;
  v4 = *(char **)a3;
  if (*(const void **)a3 != (char *)a3 + 8)
  {
    p_indexToReferenceCount = (uint64_t **)&self->_indexToReferenceCount;
    p_pair1 = &self->_indexToReferenceCount.__tree_.__pair1_;
    do
    {
      unint64_t v7 = *((void *)v4 + 4);
      unint64_t v16 = v7;
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, unsigned long>, void *>>> *)p_pair1->__value_.__left_;
      if (!p_pair1->__value_.__left_) {
        goto LABEL_14;
      }
      v9 = p_pair1;
      do
      {
        unint64_t v10 = (unint64_t)left[4].__value_.__left_;
        BOOL v11 = v10 >= v7;
        if (v10 >= v7) {
          v12 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, unsigned long>, void *>>> **)left;
        }
        else {
          v12 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, unsigned long>, void *>>> **)&left[1];
        }
        if (v11) {
          v9 = left;
        }
        left = *v12;
      }
      while (*v12);
      if (v9 != p_pair1 && (void *)v7 >= v9[4].__value_.__left_)
      {
        ++v9[5].__value_.__left_;
      }
      else
      {
LABEL_14:
        v17 = &v16;
        sub_DB11C(p_indexToReferenceCount, &v16, (uint64_t)&std::piecewise_construct, (uint64_t **)&v17)[5] = 1;
      }
      v13 = (char *)*((void *)v4 + 1);
      if (v13)
      {
        do
        {
          v14 = v13;
          v13 = *(char **)v13;
        }
        while (v13);
      }
      else
      {
        do
        {
          v14 = (char *)*((void *)v4 + 2);
          BOOL v15 = *(void *)v14 == (void)v4;
          v4 = v14;
        }
        while (!v15);
      }
      v4 = v14;
    }
    while (v14 != v3);
  }
}

- (void)_releaseIndexes:(const void *)a3
{
  unint64_t v3 = (char *)a3 + 8;
  v4 = *(char **)a3;
  if (*(const void **)a3 != (char *)a3 + 8)
  {
    p_indexToReferenceCount = (uint64_t **)&self->_indexToReferenceCount;
    p_pair1 = &self->_indexToReferenceCount.__tree_.__pair1_;
    do
    {
      left = p_pair1->__value_.__left_;
      if (p_pair1->__value_.__left_)
      {
        unint64_t v9 = *((void *)v4 + 4);
        unint64_t v10 = (uint64_t *)p_pair1;
        do
        {
          unint64_t v11 = left[4];
          BOOL v12 = v11 >= v9;
          if (v11 >= v9) {
            v13 = left;
          }
          else {
            v13 = left + 1;
          }
          if (v12) {
            unint64_t v10 = left;
          }
          left = (void *)*v13;
        }
        while (*v13);
        if (v10 != (uint64_t *)p_pair1 && v9 >= v10[4])
        {
          uint64_t v14 = v10[5] - 1;
          v10[5] = v14;
          if (!v14)
          {
            sub_A0398(p_indexToReferenceCount, v10);
            operator delete(v10);
            [(NSMutableIndexSet *)self->_available addIndex:v9];
            indexToIdentifier = self->_indexToIdentifier;
            unint64_t v16 = +[NSNumber numberWithUnsignedInteger:v9];
            v17 = [(NSMutableDictionary *)indexToIdentifier objectForKeyedSubscript:v16];

            v18 = self->_indexToIdentifier;
            v19 = +[NSNumber numberWithUnsignedInteger:v9];
            [(NSMutableDictionary *)v18 setObject:0 forKeyedSubscript:v19];

            if (v17) {
              [(NSMutableDictionary *)self->_identifierToIndex setObject:0 forKeyedSubscript:v17];
            }
          }
        }
      }
      v20 = (char *)*((void *)v4 + 1);
      if (v20)
      {
        do
        {
          v21 = v20;
          v20 = *(char **)v20;
        }
        while (v20);
      }
      else
      {
        do
        {
          v21 = (char *)*((void *)v4 + 2);
          BOOL v22 = *(void *)v21 == (void)v4;
          v4 = v21;
        }
        while (!v22);
      }
      v4 = v21;
    }
    while (v21 != v3);
  }
}

- (void)_appendInterests:(id)a3
{
  id v5 = a3;
  if (self->_collectedIndexes.__tree_.__pair3_.__value_)
  {
    v4 = [[_TUIRenderModelIdentifierInterest alloc] initWithIndexes:&self->_collectedIndexes map:self];
    if (v4) {
      [v5 addObject:v4];
    }
  }
  else
  {
    v4 = 0;
  }
}

- (unint64_t)largestIndexInUse
{
  unint64_t nextUnassigned = self->_nextUnassigned;
  if (nextUnassigned) {
    return nextUnassigned - 1;
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (id)mapRenderModels:(id)a3
{
  id v15 = a3;
  id v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v15, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v15;
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v5);
        }
        unint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        unint64_t v10 = [v9 identifier];
        unint64_t v11 = [(_TUIRenderModelIdentifierMap *)self indexForIdentifier:v10];

        if (v11 != 0x7FFFFFFFFFFFFFFFLL)
        {
          id v12 = [v9 copyWithItemIndex:v11];
          [v4 addObject:v12];
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  id v13 = [v4 copy];

  return v13;
}

- (unint64_t)indexForIdentifier:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(NSMutableDictionary *)self->_identifierToIndex objectForKeyedSubscript:v4];
    id v6 = v5;
    if (v5)
    {
      id v7 = [v5 unsignedIntegerValue];

      unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
      if (v7 == (id)0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_12;
      }
    }
    else
    {
      id v7 = [(NSMutableIndexSet *)self->_available firstIndex];
      if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        id v7 = [(_TUIRenderModelIdentifierMap *)self allocateNewIndex];
        unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
        if (v7 == (id)0x7FFFFFFFFFFFFFFFLL) {
          goto LABEL_12;
        }
      }
      else
      {
        [(NSMutableIndexSet *)self->_available removeIndex:v7];
      }
      unint64_t v9 = +[NSNumber numberWithUnsignedInteger:v7];
      [(NSMutableDictionary *)self->_identifierToIndex setObject:v9 forKeyedSubscript:v4];

      indexToIdentifier = self->_indexToIdentifier;
      unint64_t v11 = +[NSNumber numberWithUnsignedInteger:v7];
      [(NSMutableDictionary *)indexToIdentifier setObject:v4 forKeyedSubscript:v11];
    }
    [(_TUIRenderModelIdentifierMap *)self _collectIndex:v7];
    unint64_t v8 = (unint64_t)v7;
  }
  else
  {
    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_12:

  return v8;
}

- (unint64_t)allocateNewIndex
{
  unint64_t result = self->_nextUnassigned;
  if (result > 0x7FFFFFFFFFFFFFFELL) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  self->_unint64_t nextUnassigned = result + 1;
  return result;
}

- (_NSRange)allocateNewRangeWithLength:(unint64_t)a3
{
  NSUInteger nextUnassigned = self->_nextUnassigned;
  if ((uint64_t)(nextUnassigned + a3) < 0)
  {
    NSUInteger v5 = 0;
    NSUInteger nextUnassigned = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    NSUInteger v5 = a3;
    self->_NSUInteger nextUnassigned = nextUnassigned + a3;
  }
  result.length = v5;
  result.location = nextUnassigned;
  return result;
}

- (NSMutableIndexSet)available
{
  return self->_available;
}

- (void)setAvailable:(id)a3
{
}

- (unint64_t)nextUnassigned
{
  return self->_nextUnassigned;
}

- (void)setNextUnassigned:(unint64_t)a3
{
  self->_NSUInteger nextUnassigned = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_available, 0);
  sub_9F928((uint64_t)&self->_collectedIndexes, (void *)self->_collectedIndexes.__tree_.__pair1_.__value_.__left_);
  sub_9F928((uint64_t)&self->_indexToReferenceCount, (void *)self->_indexToReferenceCount.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_indexToIdentifier, 0);

  objc_storeStrong((id *)&self->_identifierToIndex, 0);
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((void *)self + 3) = (char *)self + 32;
  *((void *)self + 8) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 6) = (char *)self + 56;
  return self;
}

@end