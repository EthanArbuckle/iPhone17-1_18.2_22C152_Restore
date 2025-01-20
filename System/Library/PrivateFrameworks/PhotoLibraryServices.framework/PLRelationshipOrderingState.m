@interface PLRelationshipOrderingState
- (BOOL)setOrderValue:(int64_t)a3 forObjectID:(id)a4 atIndex:(unint64_t)a5;
- (PLRelationshipOrderingState)initWithObjectIDs:(id)a3 orderValues:(id)a4;
- (id)description;
- (id)objectIDs;
- (id)orderKeys;
- (unint64_t)findIndexForObjectID:(id)a3 newOrderValue:(int64_t)a4 hasOrderValueConflictWithObjectID:(id *)a5;
- (unint64_t)indexForObjectID:(id)a3;
@end

@implementation PLRelationshipOrderingState

- (void).cxx_destruct
{
  objc_storeStrong(&self->_foks, 0);
  objc_storeStrong(&self->_oids, 0);
}

- (unint64_t)findIndexForObjectID:(id)a3 newOrderValue:(int64_t)a4 hasOrderValueConflictWithObjectID:(id *)a5
{
  id v8 = a3;
  if ([self->_foks count])
  {
    v9 = [NSNumber numberWithLongLong:a4];
    unint64_t v10 = objc_msgSend(self->_foks, "indexOfObject:inSortedRange:options:usingComparator:", v9, 0, objc_msgSend(self->_foks, "count"), 1024, &__block_literal_global_23268);
    if (v10 >= [self->_oids count])
    {
      if (a5) {
        goto LABEL_9;
      }
    }
    else
    {
      v11 = [self->_foks objectAtIndexedSubscript:v10];
      if ([v11 isEqual:v9])
      {
        v12 = [self->_oids objectAtIndexedSubscript:v10];
        char v13 = [v12 isEqual:v8];

        if (!a5)
        {
          char v14 = v13 ^ 1;
          if (!v10) {
            goto LABEL_17;
          }
LABEL_15:
          if ((v14 & 1) == 0)
          {
            v15 = [self->_oids objectAtIndexedSubscript:v10 - 1];
            unsigned int v16 = [v15 isEqual:v8];

            v10 -= v16;
          }
          goto LABEL_17;
        }
        if ((v13 & 1) == 0)
        {
          *a5 = [self->_oids objectAtIndexedSubscript:v10];
LABEL_17:

          goto LABEL_18;
        }
LABEL_9:
        char v14 = 0;
        *a5 = 0;
        if (!v10) {
          goto LABEL_17;
        }
        goto LABEL_15;
      }

      if (a5) {
        goto LABEL_9;
      }
    }
    char v14 = 0;
    if (!v10) {
      goto LABEL_17;
    }
    goto LABEL_15;
  }
  unint64_t v10 = 0;
LABEL_18:

  return v10;
}

uint64_t __100__PLRelationshipOrderingState_findIndexForObjectID_newOrderValue_hasOrderValueConflictWithObjectID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)objectIDs
{
  return self->_oids;
}

- (id)orderKeys
{
  return self->_foks;
}

- (BOOL)setOrderValue:(int64_t)a3 forObjectID:(id)a4 atIndex:(unint64_t)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (!self->_isMutable)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = (void *)[self->_oids mutableCopy];
      id oids = self->_oids;
      self->_id oids = v9;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v11 = (void *)[self->_foks mutableCopy];
      id foks = self->_foks;
      self->_id foks = v11;
    }
    self->_isMutable = 1;
  }
  unint64_t v13 = [self->_oids count];
  char v14 = (unsigned char *)MEMORY[0x1E4F59AC0];
  if (v13 < a5)
  {
    if (!*MEMORY[0x1E4F59AC0])
    {
      v15 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = [self->_oids count];
        int v28 = 134218240;
        unint64_t v29 = a5;
        __int16 v30 = 2048;
        int64_t v31 = v16;
        _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Target index %ld is too large, count of object IDs is %ld", (uint8_t *)&v28, 0x16u);
      }
    }
    a5 = [self->_oids count];
  }
  unint64_t v17 = [self->_oids indexOfObject:v8];
  if (v17 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v18 = -1;
  }
  else
  {
    v19 = [self->_foks objectAtIndex:v17];
    uint64_t v18 = [v19 longLongValue];
  }
  if (v18 != a3)
  {
    if (!*v14)
    {
      v20 = __CPLAssetsdOSLogDomain();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        int v28 = 134218754;
        unint64_t v29 = v18;
        __int16 v30 = 2048;
        int64_t v31 = a3;
        __int16 v32 = 2048;
        unint64_t v33 = a5;
        __int16 v34 = 2112;
        id v35 = v8;
        _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEBUG, "Assigning updated order value (was %lld) to %lld (idx %ld) for %@", (uint8_t *)&v28, 0x2Au);
      }
    }
    if (v17 == 0x7FFFFFFFFFFFFFFFLL)
    {
      [self->_oids insertObject:v8 atIndex:a5];
      id v21 = self->_foks;
      v22 = [NSNumber numberWithLongLong:a3];
      [v21 insertObject:v22 atIndex:a5];
LABEL_25:

      goto LABEL_30;
    }
    if (v17 == a5)
    {
      id v23 = self->_foks;
      v22 = [NSNumber numberWithLongLong:a3];
      [v23 replaceObjectAtIndex:a5 withObject:v22];
      goto LABEL_25;
    }
    [self->_oids insertObject:v8 atIndex:a5];
    id v24 = self->_foks;
    v25 = [NSNumber numberWithLongLong:a3];
    [v24 insertObject:v25 atIndex:a5];

    if (v17 <= a5) {
      unint64_t v26 = v17;
    }
    else {
      unint64_t v26 = v17 + 1;
    }
    [self->_oids removeObjectAtIndex:v26];
    [self->_foks removeObjectAtIndex:v26];
  }
LABEL_30:

  return v18 != a3;
}

- (unint64_t)indexForObjectID:(id)a3
{
  return [self->_oids indexOfObject:a3];
}

- (id)description
{
  v3 = (void *)MEMORY[0x1E4F28E78];
  v10.receiver = self;
  v10.super_class = (Class)PLRelationshipOrderingState;
  v4 = [(PLRelationshipOrderingState *)&v10 description];
  v5 = [v3 stringWithFormat:@"%@ isMutable=%d count=%d\n", v4, self->_isMutable, objc_msgSend(self->_oids, "count")];

  if ([self->_oids count])
  {
    unint64_t v6 = 0;
    do
    {
      v7 = [self->_foks objectAtIndexedSubscript:v6];
      id v8 = [self->_oids objectAtIndexedSubscript:v6];
      [v5 appendFormat:@"  %@ -> %@\n", v7, v8];

      ++v6;
    }
    while ([self->_oids count] > v6);
  }
  return v5;
}

- (PLRelationshipOrderingState)initWithObjectIDs:(id)a3 orderValues:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PLRelationshipOrderingState;
  id v8 = [(PLRelationshipOrderingState *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    id oids = v8->_oids;
    v8->_id oids = (id)v9;

    uint64_t v11 = [v7 copy];
    id foks = v8->_foks;
    v8->_id foks = (id)v11;
  }
  return v8;
}

@end